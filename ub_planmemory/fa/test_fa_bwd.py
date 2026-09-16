"""
Fused Attention
===============

This is a Triton implementation of the Flash Attention v2 algorithm from Tri Dao (https://tridao.me/publications/flash2/flash2.pdf)

Credits: OpenAI kernel team

Extra Credits:

* Original flash attention paper (https://arxiv.org/abs/2205.14135)
* Rabe and Staats (https://arxiv.org/pdf/2112.05682v2.pdf)

"""

import pytest
import torch
import triton
import triton.language as tl
import torch_npu

DEVICE = "npu"

import triton.runtime.driver as driver
from data import gen

device = torch.npu.current_device()
properties = driver.active.utils.get_device_properties(device)
AICORE_NUM = properties["num_aicore"]


def is_hip():
    return triton.runtime.driver.active.get_current_target().backend == "hip"


@triton.jit
def _attn_backward_preprocess(O, DO,  #
                         Delta,  #
                         Z, H, N_CTX,  #
                         BLOCK_M: tl.constexpr, HEAD_DIM: tl.constexpr,  #
                         NUM_CORES: tl.constexpr
                         ):
    pid = tl.program_id(0)

    # task 维度展开 (bhid = Z*H) × (m_block = N_CTX/BLOCK_M)
    NUM_MBLOCKS: tl.constexpr = N_CTX // BLOCK_M
    NUM_TASKS: tl.constexpr = (Z * H) * NUM_MBLOCKS # row: Z*H, col: NUM_MBLOCKS

    off_n = tl.arange(0, HEAD_DIM)

    for task in range(pid, NUM_TASKS, NUM_CORES):
        off_hz = task // NUM_MBLOCKS          # 0 .. Z*H-1, #row
        m_blk  = task - off_hz * NUM_MBLOCKS  # task % NUM_MBLOCKS, #col

        off_m = m_blk * BLOCK_M + tl.arange(0, BLOCK_M) # every col has BLOCK_M length

        o  = tl.load(O  + off_hz * HEAD_DIM * N_CTX + off_m[:, None] * HEAD_DIM + off_n[None, :]).to(tl.float32) #[BLOCK_M, BLOCK_DIM]
        do = tl.load(DO + off_hz * HEAD_DIM * N_CTX + off_m[:, None] * HEAD_DIM + off_n[None, :]).to(tl.float32) #[BLOCK_M, BLOCK_DIM]

        delta = tl.sum(o * do, axis=1) #[BLOCK_M]

        tl.store(Delta + off_hz * N_CTX + off_m, delta) #[BLOCK_M]


@triton.jit
def _attn_bwd_combined(
    dq, dk, dv,  # 输出累加器
    q, k, v,  # 输入张量
    DO, M, D, sm_scale,
    stride_tok: tl.constexpr, stride_d: tl.constexpr,
    H: tl.constexpr, N_CTX: tl.constexpr,
    BLOCK_M: tl.constexpr,
    BLOCK_N: tl.constexpr,
    HEAD_DIM: tl.constexpr,
    start_m, start_n,  # 当前块的起始位置
    MASK: tl.constexpr
):
    """
    统一计算 dQ, dK, dV 的kernel
    - q: 已加载的当前 M 块的 Q [BLOCK_M, HEAD_DIM]
    - k, v: 已加载的当前 N 块的 K, V [BLOCK_N, HEAD_DIM]
    - 计算这一对 (M, N) 块之间的梯度贡献
    """
    offs_m = start_m + tl.arange(0, BLOCK_M)
    offs_n = start_n + tl.arange(0, BLOCK_N)
    offs_k = tl.arange(0, HEAD_DIM)
    
    # 加载 DO 和统计量
    do = tl.load(DO + offs_m[:, None] * stride_tok + offs_k[None, :] * stride_d)
    m = tl.load(M + offs_m)
    Di = tl.load(D + offs_m)
    
    # 计算 attention scores: Q @ K^T
    kT = tl.trans(k)
    qk = tl.dot(q, kT)  # [BLOCK_M, BLOCK_N]
    
    # 计算 attention weights: P = exp(QK^T - m)
    p = tl.math.exp(qk * sm_scale - m[:, None])
    
    # Apply mask if needed
    if MASK:
        mask = (offs_m[:, None] >= offs_n[None, :])
        p = tl.where(mask, p, 0.0)
    
    # ===== 计算 dV =====
    # dV += P^T @ dO
    p = p.to(do.dtype)
    pT = tl.trans(p)
    dv += tl.dot(pT, do)
    
    # ===== 计算 dK =====
    # dP = dO @ V^T
    vT = tl.trans(v)
    dp = tl.dot(do, vT).to(tl.float32)
    
    # dS = P * (dP - D)
    ds = p * (dp - Di[:, None]) * sm_scale
    ds = ds.to(q.dtype)
    
    # dK += dS^T @ Q
    dsT = tl.trans(ds)
    dk += tl.dot(dsT, q)
    
    # ===== 计算 dQ =====
    # dQ += dS @ K
    dq += tl.dot(ds, k)
    return dq, dk, dv


@triton.jit
def _attn_bwd(Q_origin, K_origin, V_origin, DO_origin, DQ_origin,
              DK_origin, DV_origin, M_origin, D_origin,
              sm_scale,
              stride_z: tl.constexpr, stride_h: tl.constexpr, 
              stride_tok: tl.constexpr, stride_d: tl.constexpr,
              Z: tl.constexpr, H: tl.constexpr, N_CTX: tl.constexpr,
              BLOCK_M1: tl.constexpr,
              BLOCK_N1: tl.constexpr,
              BLK_SLICE_FACTOR: tl.constexpr,
              HEAD_DIM: tl.constexpr,
              CAUSAL: tl.constexpr,
              NUM_CORES: tl.constexpr):
    
    pid_core = tl.program_id(0)
    
    NUM_BLOCKS: tl.constexpr = N_CTX // BLOCK_N1
    NUM_BH: tl.constexpr = Z * H
    NUM_TASKS: tl.constexpr = NUM_BH * NUM_BLOCKS
    
    offs_k = tl.arange(0, HEAD_DIM)
    
    for task in range(pid_core, NUM_TASKS, NUM_CORES):
        bhid = task // NUM_BLOCKS
        pid = task - bhid * NUM_BLOCKS
        
        off_chz = (bhid * N_CTX).to(tl.int64)
        adj = (stride_h * (bhid % H) + stride_z * (bhid // H)).to(tl.int64)
        
        # Offset pointers for batch/head
        Q = Q_origin + adj
        K = K_origin + adj
        V = V_origin + adj
        DO = DO_origin + adj
        DQ = DQ_origin + adj
        DK = DK_origin + adj
        DV = DV_origin + adj
        M = M_origin + off_chz
        D = D_origin + off_chz
        
        # 当前块的位置
        block_n = pid  # 当前处理的 N 块索引
        start_n = block_n * BLOCK_N1
        offs_n = start_n + tl.arange(0, BLOCK_N1)
        
        # 加载当前 N 块的 K 和 V (这些在整个计算中保持不变)
        k = tl.load(K + offs_n[:, None] * stride_tok + offs_k[None, :] * stride_d)
        v = tl.load(V + offs_n[:, None] * stride_tok + offs_k[None, :] * stride_d)
        
        # 初始化 dK 和 dV 累加器
        dk = tl.zeros([BLOCK_N1, HEAD_DIM], dtype=tl.float32)
        dv = tl.zeros([BLOCK_N1, HEAD_DIM], dtype=tl.float32)
        
        if CAUSAL:
            # ===== Causal 模式 =====
            # 对于 dK/dV: 只需要处理 m >= n 的块 (下三角)
            # 对于 dQ: 只需要处理 n <= m 的块 (下三角)
            
            # 计算需要处理的 M 块范围
            MASK_BLOCK_M: tl.constexpr = BLOCK_M1 // BLK_SLICE_FACTOR
            
            # 1. 处理对角块附近 (需要 mask)
            start_m = start_n
            num_diagonal_blocks = BLOCK_N1 // MASK_BLOCK_M
            
            for m_idx in range(num_diagonal_blocks):
                curr_m = start_m + m_idx * MASK_BLOCK_M
                offs_m = curr_m + tl.arange(0, MASK_BLOCK_M)
                
                # 加载当前 M 块的 Q
                q = tl.load(Q + offs_m[:, None] * stride_tok + offs_k[None, :] * stride_d)
                
                # 初始化 dQ 累加器
                dq = tl.zeros([MASK_BLOCK_M, HEAD_DIM], dtype=tl.float32)
                
                # 调用统一kernel (带mask)
                dq, dk, dv = _attn_bwd_combined(
                    dq, dk, dv,
                    q, k, v,
                    DO, M, D, sm_scale,
                    stride_tok, stride_d,
                    H, N_CTX,
                    MASK_BLOCK_M, BLOCK_N1, HEAD_DIM,
                    curr_m, start_n,
                    MASK=True
                )
                
                # 写回 dQ
                dq_ptrs = DQ + offs_m[:, None] * stride_tok + offs_k[None, :] * stride_d
                #tl.store(dq_ptrs, dq)
                tl.atomic_add(dq_ptrs, dq)
            
            # 2. 处理对角块下方的块 (不需要 mask)
            start_m = start_n + num_diagonal_blocks * MASK_BLOCK_M
            num_blocks = (N_CTX - start_m) // BLOCK_M1
            
            for m_idx in range(num_blocks):
                curr_m = start_m + m_idx * BLOCK_M1
                offs_m = curr_m + tl.arange(0, BLOCK_M1)
                
                # 加载当前 M 块的 Q
                q = tl.load(Q + offs_m[:, None] * stride_tok + offs_k[None, :] * stride_d)
                
                # 初始化 dQ 累加器
                dq = tl.zeros([BLOCK_M1, HEAD_DIM], dtype=tl.float32)
                
                # 调用统一kernel (不带mask)
                dq, dk, dv = _attn_bwd_combined(
                    dq, dk, dv,
                    q, k, v,
                    DO, M, D, sm_scale,
                    stride_tok, stride_d,
                    H, N_CTX,
                    BLOCK_M1, BLOCK_N1, HEAD_DIM,
                    curr_m, start_n,
                    MASK=False
                )
                
                # 写回 dQ
                dq_ptrs = DQ + offs_m[:, None] * stride_tok + offs_k[None, :] * stride_d
                #tl.store(dq_ptrs, dq)
                tl.atomic_add(dq_ptrs, dq)
                
        else:
            # ===== Non-causal 模式 =====
            # 需要遍历所有的 M 块
            num_blocks = N_CTX // BLOCK_M1
            
            for m_idx in range(num_blocks):
                curr_m = m_idx * BLOCK_M1
                offs_m = curr_m + tl.arange(0, BLOCK_M1)
                
                # 加载当前 M 块的 Q
                q = tl.load(Q + offs_m[:, None] * stride_tok + offs_k[None, :] * stride_d)
                
                # 初始化 dQ 累加器
                dq = tl.zeros([BLOCK_M1, HEAD_DIM], dtype=tl.float32)
                
                # 调用统一kernel
                dq, dk, dv = _attn_bwd_combined(
                    dq, dk, dv,
                    q, k, v,
                    DO, M, D, sm_scale,
                    stride_tok, stride_d,
                    H, N_CTX,
                    BLOCK_M1, BLOCK_N1, HEAD_DIM,
                    curr_m, start_n,
                    MASK=False
                )
                
                # 写回 dQ
                dq_ptrs = DQ + offs_m[:, None] * stride_tok + offs_k[None, :] * stride_d
                #tl.store(dq_ptrs, dq)
                tl.atomic_add(dq_ptrs, dq)
        
        # 写回 dK 和 dV
        # dk *= sm_scale
        dk_ptrs = DK + offs_n[:, None] * stride_tok + offs_k[None, :] * stride_d
        tl.store(dk_ptrs, dk)
        
        dv_ptrs = DV + offs_n[:, None] * stride_tok + offs_k[None, :] * stride_d
        tl.store(dv_ptrs, dv)


def fag(do, q, k, v, atten_mask, o, lse,
        sm_scale, CAUSAL, HEAD_DIM, BLOCK_M, BLOCK_N):
    assert do.is_contiguous()
    assert q.stride() == k.stride() == v.stride() == o.stride() == do.stride()
    BATCH, N_HEAD, N_CTX = q.shape[:3]
    PRE_BLOCK = 64
    num_cores = AICORE_NUM
    BLK_SLICE_FACTOR = 2
    arg_k = k
    # arg_k = k * sm_scale
    assert N_CTX % PRE_BLOCK == 0
    pre_grid = (num_cores,)
    delta = torch.empty_like(lse)
    print("num_cores:", num_cores)

    _attn_backward_preprocess[pre_grid](
        o, do, delta,
        BATCH, N_HEAD, N_CTX,
        BLOCK_M=PRE_BLOCK, HEAD_DIM=HEAD_DIM,
        NUM_CORES=num_cores,
    )

    # dq = torch.empty_like(q, dtype=q.dtype, device='cpu').to(q.device)
    dq = torch.zeros_like(q, dtype=q.dtype, device='cpu').to(q.device)
    dk = torch.empty_like(k, dtype=q.dtype, device='cpu').to(q.device)
    dv = torch.empty_like(v, dtype=q.dtype, device='cpu').to(q.device)

    grid = (num_cores,)

    _attn_bwd[grid](
            q, arg_k, v, do, dq, dk, dv,  #
            lse, delta, sm_scale,
            q.stride(0), q.stride(1), q.stride(2), q.stride(3),  #
            BATCH, N_HEAD, N_CTX,  #
            BLOCK_M1=BLOCK_M, BLOCK_N1=BLOCK_N,  #
            BLK_SLICE_FACTOR=BLK_SLICE_FACTOR,  #
            HEAD_DIM=HEAD_DIM,  #
            CAUSAL=CAUSAL,
            NUM_CORES=num_cores,
            enable_mixed_cv=True,
            enable_auto_bind_sub_block=True,
            #multibuffer = True,
            enable_flatten=False,
            set_workspace_multibuffer=2,
            sync_solver=True
        )
    return dq, dk, dv


@pytest.mark.parametrize(
    "Z, H, N_CTX, HEAD_DIM, causal, dtype, BM, BN",
    [
        (128, 8, 8192, 128, False, torch.float16, 128, 64),
        (128, 8, 8192, 64, False, torch.float16, 128, 128),
        (128, 8, 1024, 128, False, torch.float16, 128, 64),
        (128, 8, 1024, 64, False, torch.float16, 128, 128),
        (128, 8, 8192, 128, True, torch.float16, 128, 64),
        (128, 8, 8192, 64, True, torch.float16, 128, 128),
        (128, 8, 1024, 128, True, torch.float16, 64, 64),
        (128, 8, 1024, 64, True, torch.float16, 128, 128),
        (128, 8, 8192, 128, False, torch.bfloat16, 128, 64),
        (128, 8, 8192, 64, False, torch.bfloat16, 128, 128),
        (128, 8, 1024, 128, False, torch.bfloat16, 128, 64),
        (128, 8, 1024, 64, False, torch.bfloat16, 128, 128),
        (128, 8, 8192, 128, True, torch.bfloat16, 128, 64),
        (128, 8, 8192, 64, True, torch.bfloat16, 128, 128),
        (128, 8, 1024, 128, True, torch.bfloat16, 64, 64),
        (128, 8, 1024, 64, True, torch.bfloat16, 128, 128),
    ],
)
def test_op(Z, H, N_CTX, HEAD_DIM, causal, dtype, BM, BN, is_sim=False):
    # Filter out non-integer cases; N_CTX must be divisible by BM and BN, and HEAD_DIM must be divisible by 16.
    if N_CTX % BM != 0 or N_CTX % BN != 0 or HEAD_DIM % 16 != 0:
        pytest.skip("Skipping non-divisible case")
    case_input, case_output = gen(Z, H, N_CTX, HEAD_DIM, causal, dtype, is_sim)
    dq, dk, dv = fag(case_input.do, case_input.q, case_input.k, case_input.v, case_input.mask, case_input.o,
                     case_input.l, case_input.scale, causal, HEAD_DIM, BM, BN)
    dq_golden, dk_golden, dv_golden = case_output
    torch.npu.synchronize()
    torch.testing.assert_close(dv, dv_golden, atol=1e-2, rtol=1e-2, equal_nan=True)
    torch.testing.assert_close(dq, dq_golden, atol=1e-2, rtol=1e-2, equal_nan=True)
    torch.testing.assert_close(dk, dk_golden, atol=1e-2, rtol=1e-2, equal_nan=True)
    # from xrun_test import data_compare
    # data_compare(dv.float().cpu().numpy(), dv_golden.float().cpu().numpy(), 1e-4, 1e-4)
    # data_compare(dq.float().cpu().numpy(), dq_golden.float().cpu().numpy(), 1e-4, 1e-4)
    # data_compare(dk.float().cpu().numpy(), dk_golden.float().cpu().numpy(), 1e-4, 1e-4)
    print(f"[PASSED] Attention shape:({Z}, {H}, {N_CTX}, {HEAD_DIM}), BM: {BM}, BN: {BN}, dtype: {dtype}")


if __name__ == "__main__":
    test_op([128, 8, 8192, 128, False, torch.float16, 128, 128, 128, 128, 128, 128])

