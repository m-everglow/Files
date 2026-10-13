import math
from collections import namedtuple

import torch
import torch_npu

LAYOUT = "BNSD"
PER_BLOCK_SIZE_Q = 128
PER_BLOCK_SIZE_KV = 256
SEED = 42
DEVICE = 'npu'
torch.manual_seed(SEED)

CaseInput = namedtuple('CaseInput',
                       ['do', 'q', 'k', 'v', 'o', 'mask', 'l', 'd_scale_q', 'd_scale_k', 'd_scale_v',
                        'scale'])
CaseOutput = namedtuple('CaseOutput', ['dq', 'dk', 'dv'])

DTYPE_MAP = {
    "fp16": torch.float16,
    "bf16": torch.bfloat16,
    'fp8_e5m2': torch.float8_e5m2,
    'fp8_e4m3fn': torch.float8_e4m3fn,
}


def cpu_golden(q, k, v, o, do, L, sm_scale, mask, CAUSAL, dtype, block_size=128):
    Z, H, N_CTX, HEAD_DIM = q.shape
    dQ = torch.zeros_like(q, dtype=torch.float32)
    dK = torch.zeros_like(k, dtype=torch.float32)
    dV = torch.zeros_like(v, dtype=torch.float32)
    for i in range(Z):
        for j in range(H):
            for s1 in range(0, N_CTX, block_size):
                q_block = q[i, j, s1:s1 + block_size]
                for s2 in range(0, N_CTX, block_size):
                    k_block = k[i, j, s2:s2 + block_size].float()
                    v_block = k[i, j, s2:s2 + block_size].float()
                    s_block = (q_block @ k_block.T) * sm_scale
                    p_block = torch.exp(s_block - L[i, j, s1:s1 + block_size, None])
                    if CAUSAL:
                        p_block = torch.where(mask, p_block, 0.0)
                    do_block = do[i, j, s1:s1 + block_size].float()
                    o_block = o[i, j, s1:s1 + block_size].float()
                    dp_block = do_block @ v_block.T
                    delta_block = torch.sum(do_block * o_block, -1)
                    ds_block = p_block * (dp_block - delta_block)
                    dq_block = ds_block @ k_block
                    dk_block = ds_block.T @ q_block
                    dv_block = p_block.T @ do_block
                    dQ[i, j, s1:s1 + block_size] = dq_block
                    dK[i, j, s2:s2 + block_size] = dk_block
                    dV[i, j, s2:s2 + block_size] = dv_block
    dQ = dQ * sm_scale
    dK = dK * sm_scale
    return dQ.to(dtype), dK.to(dtype), dV.to(dtype)


def block_quantize(tensor, block_size, data_type=torch.float8_e4m3fn):
    if data_type == torch.float8_e5m2:
        FP8_MAX = 57344.0
    elif data_type == torch.float8_e4m3fn:
        FP8_MAX = 448.0
    else:
        raise ValueError(f"{data_type} Not support block quant")

    B, N, S, D = tensor.shape # [128, 8, 8192, 128], torch.float32
    reshaped_input = tensor.view(B, N, S // block_size, block_size, D) # [128, 8, 64, 128, 128]
    flattened_block = reshaped_input.flatten(start_dim=-2)  # (B, N, G, Num_Blocks, 128*D) [128, 8, 64, 16384]
    max_val = torch.max(torch.abs(flattened_block), dim=-1).values # [128, 8, 64]
    scale_val = FP8_MAX / max_val.clamp(min=1e-12) # [128, 8, 64]
    scale_expanded = scale_val.view(B, N, -1, 1, 1) # [128, 8, 64, 1, 1]
    scaled_data = reshaped_input * scale_expanded #  [128, 8, 64, 128, 128], torch.float32
    quantized_data = scaled_data.to(data_type) # [128, 8, 64, 128, 128], torch.float8_e4m3fn
    quantized_tensor = quantized_data.view(B, N, S, D) # torch.Size([128, 8, 8192, 128]), torch.float8_e4m3fn
    scale = scale_val.unsqueeze(-1) # [128, 8, 64, 1], torch.float32
    d_scale = 1 / scale # [128, 8, 64, 1], torch.float32
    return d_scale, quantized_tensor


def gen(Z, H, N_CTX, HEAD_DIM, CAUSAL, dtype, is_cpu_golden=False):
    device = DEVICE

    do = torch.empty(Z, H, N_CTX, HEAD_DIM, dtype=torch.float32, device=device).normal_(mean=0.0, std=0.5)
    q = torch.empty((Z, H, N_CTX, HEAD_DIM), dtype=torch.float32, device=device).normal_(mean=0.0, std=0.5)
    k = torch.empty((Z, H, N_CTX, HEAD_DIM), dtype=torch.float32, device=device).normal_(mean=0.0, std=0.5)
    v = torch.empty((Z, H, N_CTX, HEAD_DIM), dtype=torch.float32, device=device).normal_(mean=0.0, std=0.5)
    atten_mask = None
    sparse_mode = 0
    d_scale_q = None
    d_scale_k = None
    d_scale_v = None
    if CAUSAL:
        atten_mask = torch.triu(torch.ones(N_CTX, N_CTX, device=device, dtype=torch.bool), diagonal=1).to(DEVICE)
        sparse_mode = 2
    sm_scale = 1 / math.sqrt(HEAD_DIM)

    if dtype == torch.float16 or dtype == torch.bfloat16:
        do = do.to(dtype)
        q = q.to(dtype)
        k = k.to(dtype)
        v = v.to(dtype)
        out, softmax_max, softmax_sum, _, seed, offset, numels = torch_npu.npu_fusion_attention_v2(
            q, k, v, H,
            LAYOUT,
            atten_mask=torch.triu(
                torch.ones(2048,
                           2048,
                           device=DEVICE),
                diagonal=1).bool() if CAUSAL else None,
            scale=sm_scale,
            sparse_mode=sparse_mode)
        l = softmax_max[..., 0] + torch.log(softmax_sum[..., 0])
        if not is_cpu_golden:
            dq, dk, dv, _, _, _, _ = torch_npu.npu_fusion_attention_grad_v2(
                q, k, v, do, H, LAYOUT,
                atten_mask=torch.triu(
                    torch.ones(2048, 2048, device=DEVICE),
                    diagonal=1).bool() if CAUSAL else None,
                softmax_max=softmax_max,
                softmax_sum=softmax_sum, attention_in=out,
                scale_value=sm_scale,
                sparse_mode=sparse_mode, seed=seed,
                offset=offset, numels=numels)
            return (CaseInput(do, q, k, v, out, atten_mask, l, d_scale_q, d_scale_k, d_scale_v, sm_scale),
                    CaseOutput(dq, dk, dv))
        else:
            dq, dk, dv = cpu_golden(q.cpu(), k.cpu(), v.cpu(), out.cpu(), do.cpu(), l.cpu(), sm_scale, atten_mask.cpu(),
                                    CAUSAL, dtype, block_size=128)
            return (CaseInput(do, q, k, v, out, atten_mask, l, d_scale_q, d_scale_k, d_scale_v, sm_scale),
                    CaseOutput(dq, dk, dv))

    # d_scale_do, do = block_quantize(do, dtype)
    d_scale_q, q = block_quantize(q, PER_BLOCK_SIZE_Q, dtype)
    d_scale_k, k = block_quantize(k, PER_BLOCK_SIZE_KV, dtype)
    d_scale_v, v = block_quantize(v, PER_BLOCK_SIZE_KV, dtype)
    d_scale_q = d_scale_q.to(DEVICE)
    d_scale_k = d_scale_k.to(DEVICE)
    d_scale_v = d_scale_v.to(DEVICE)
    do = do.to(torch.float16)
    q = q.to(dtype)
    k = k.to(dtype)
    v = v.to(dtype)
    out, softmax_max, softmax_sum, _, seed, offset, numels = torch_npu.npu_quant_fusion_attention(
        q, k, v, H,
        LAYOUT,
        atten_mask=torch.triu(
            torch.ones(2048,
                       2048,
                       device=DEVICE),
            diagonal=1).bool() if CAUSAL else None,
        d_scale_q=d_scale_q,
        d_scale_k=d_scale_k,
        d_scale_v=d_scale_v,
        scale=sm_scale,
        sparse_mode=sparse_mode)
    l = softmax_max[..., 0] + torch.log(softmax_sum[..., 0])
    dq, dk, dv, _, _, _, _ = torch_npu.npu_quant_fusion_attention_grad(
        q, k, v, do, H, LAYOUT,
        atten_mask=torch.triu(
            torch.ones(2048, 2048, device=DEVICE),
            diagonal=1).bool() if CAUSAL else None,
        d_scale_q=d_scale_q,
        d_scale_k=d_scale_k,
        d_scale_v=d_scale_v,
        softmax_max=softmax_max,
        softmax_sum=softmax_sum, attention_in=out,
        scale_value=sm_scale,
        sparse_mode=sparse_mode, seed=seed,
        offset=offset, numels=numels)
    return (CaseInput(do, q, k, v, out, atten_mask, l, d_scale_q, d_scale_k, d_scale_v, sm_scale),
            CaseOutput(dq, dk, dv))


if __name__ == '__main__':
    print(gen(1, 8, 1024, 128, False, torch.float8_e4m3fn))
