import pytest
import torch
import torch_npu

from test_fa_forward_modify_core_exp import *

DEVICE = "npu"

@pytest.mark.parametrize("Z,H,kv_heads,N_CTX,HEAD_DIM,causal,dtype,BM,BN", [
        # 128, 8, 8192, 64, causal=False, dtype=torch.float16, BM = 128, BN = 128
        # ============================ fp16 cases ===================================
        [128, 8, 8, 8192, 128, False, torch.float16, 128, 128],
        [128, 8, 8, 8192, 64, False, torch.float16, 128, 128],
        [128, 8, 8, 1024, 128, False, torch.float16, 128, 128],
        [128, 8, 8, 1024, 64, False, torch.float16, 128, 128],
        [128, 8, 8, 8192, 128, True, torch.float16, 128, 128],
        [128, 8, 8, 8192, 64, True, torch.float16, 128, 128],
        [128, 8, 8, 1024, 128, True, torch.float16, 128, 128],
        [128, 8, 8, 1024, 64, True, torch.float16, 128, 128],
        # ============================ bf16 cases ===================================
        [128, 8, 8, 8192, 128, False, torch.bfloat16, 128, 128],
        [128, 8, 8, 8192, 64, False, torch.bfloat16, 128, 128],
        [128, 8, 8, 1024, 128, False, torch.bfloat16, 128, 128],
        [128, 8, 8, 1024, 64, False, torch.bfloat16, 128, 128],
        [128, 8, 8, 8192, 128, True, torch.bfloat16, 128, 128],
        [128, 8, 8, 8192, 64, True, torch.bfloat16, 128, 128],
        [128, 8, 8, 1024, 128, True, torch.bfloat16, 128, 128],
        [128, 8, 8, 1024, 64, True, torch.bfloat16, 128, 128],
        # ============================ fp8 cases ===================================
        # [128, 8, 8192, 128, False, torch.float8_e5m2, 128,128],
        # [128, 8, 8192, 64, False, torch.float8_e5m2, 128,128],
        # [128, 8, 1024, 128, False, torch.float8_e5m2, 128,128],
        # [128, 8, 1024, 64, False, torch.float8_e5m2, 128,128],
        # [128, 8, 8192, 128, True, torch.float8_e5m2, 64,128],
        # [128, 8, 8192, 64, True, torch.float8_e5m2, 64,128],
        # [128, 8, 1024, 128, True, torch.float8_e5m2, 64,128],
        # [128, 8, 1024, 64, True, torch.float8_e5m2, 64,128],
        # [128, 8, 8192, 128, False, torch.float8_e4m3, 128,128],
        # [128, 8, 8192, 64, False, torch.float8_e4m3, 128,128],
        # [128, 8, 1024, 128, False, torch.float8_e4m3, 128,128],
        # [128, 8, 1024, 64, False, torch.float8_e4m3, 128,128],
        # [128, 8, 8192, 128, True, torch.float8_e4m3, 64,128],
        # [128, 8, 8192, 64, True, torch.float8_e4m3, 64,128],
        # [128, 8, 1024, 128, True, torch.float8_e4m3, 64,128],
        # [128, 8, 1024, 64, True, torch.float8_e4m3, 64,128],
        # [1, 1, 8192, 128, True, torch.float16, 128, 64]
        # ============================ FA-prefill_v2(优先) cases ===================================
        [1, 80, 8, 1024, 128, True, torch.float16, 128, 128],
        [1, 80, 8, 2048, 128, True, torch.float16, 128, 128],
        [1, 80, 8, 4096, 128, True, torch.float16, 128, 128],
        [1, 80, 8, 8192, 128, True, torch.float16, 128, 128],
        [1, 80, 8, 16384, 128, True, torch.float16, 128, 128],
        [1, 80, 8, 32768, 128, True, torch.float16, 128, 128],
        [1, 80, 8, 65536, 128, True, torch.float16, 128, 128],
        # [1, 80, 8, 131072, 128, True, torch.float16, 128, 128],


    ])
def test_op(Z, H, kv_heads, N_CTX, HEAD_DIM, causal, dtype,BM ,BN):
    torch.manual_seed(20)
    q = (torch.empty((Z, H, N_CTX, HEAD_DIM), dtype=dtype, device=DEVICE).normal_(mean=0.0, std=0.5).requires_grad_())
    k = (torch.empty((Z, kv_heads, N_CTX, HEAD_DIM), dtype=dtype, device=DEVICE).normal_(mean=0.0, std=0.5).requires_grad_())
    v = (torch.empty((Z, kv_heads, N_CTX, HEAD_DIM), dtype=dtype, device=DEVICE).normal_(mean=0.0, std=0.5).requires_grad_())

    sm_scale = 0.5

    compressed_len = 2048
    atten_mask = None
    sparse_mode = 0
    atten_golden_mask = None

    if causal:
        atten_mask = torch.triu(torch.ones(N_CTX, N_CTX, device=DEVICE), diagonal=1)
        atten_golden_mask = torch.triu(torch.ones(compressed_len, compressed_len, device=DEVICE), diagonal=1).bool()
        sparse_mode = 2

    if atten_mask is None:
        atten_mask = torch.zeros((1, 1), device=DEVICE)
        
    
    ref_out = torch_npu.npu_fusion_attention(
        q, k, v, H,
        padding_mask=None,
        atten_mask=atten_golden_mask,
        scale=sm_scale,
        keep_prob=1.0,
        input_layout='BNSD',
        pre_tockens=65535,
        next_tockens=65535,
        sparse_mode=sparse_mode,
        )[0]


    tri_out = attention(q, k, v, atten_mask, causal, sm_scale,BM,BN)

    rtol = 0.0
    atol = 1e-2	
    assert torch.allclose(ref_out, tri_out, atol=atol, rtol=rtol)
    print("compare success!")

if __name__ == "__main__":
    test_op(128,8,8192,128, causal=True, dtype=torch.float16, BM = 64,BN = 64)
