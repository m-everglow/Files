import os

import math
import torch
import torch_npu
import pytest

import sys
from fa_forward_fp8 import *


DEVICE="npu"

def block_quantize(tensor, data_type=torch.float8_e4m3fn, per_block_size=128):
    if data_type == torch.float8_e5m2:
        FP8_MAX = 57344.0
    elif data_type == torch.float8_e4m3fn:
        FP8_MAX = 448.0
    else:
        raise ValueError(f"{data_type} Not support block quant")
 
    B, N, S, D = tensor.shape
 
    reshaped_input = tensor.view(B, N, S // per_block_size, per_block_size, D) # (B, N, S, D) -> (B, N, S//128, 128, D)
    flattened_block = reshaped_input.flatten(start_dim=-2)  # (B, N, G, 128*D)
    max_val = torch.max(torch.abs(flattened_block), dim=-1).values
    scale_val = FP8_MAX / max_val.clamp(min=1e-12)
    scale_expanded = scale_val.view(B, N, -1, 1, 1) 
    scaled_data = reshaped_input * scale_expanded
    quantized_data = scaled_data.to(data_type)
    quantized_tensor = quantized_data.view(B, N, S, D)
    scale = scale_val.unsqueeze(-1)
    d_scale = 1 / scale
    return d_scale, quantized_tensor


@pytest.mark.parametrize("Z,H,N_CTX,HEAD_DIM,causal,dtype,BM,BN", [
        # ============================ fp8 cases ===================================
        # [128, 8, 8192, 128, False, torch.float32, 128,128],
        # [128, 8, 8192, 64, False, torch.float32, 128,128],
        [128, 8, 1024, 128, False, torch.float32, 128,256],
        [128, 8, 1024, 64, False, torch.float32, 128,256],
        # [128, 8, 8192, 128, True, torch.float32, 128,128],
        # [128, 8, 8192, 64, True, torch.float32, 128,128],
        [128, 8, 1024, 128, True, torch.float32, 128,128],
        [128, 8, 1024, 64, True, torch.float32, 128,128],
    ])
def test_op(Z, H, N_CTX, HEAD_DIM, causal, dtype,BM ,BN):
    torch.manual_seed(20)
    PER_BLOCK_SIZE_Q = BM
    PER_BLOCK_SIZE_KV = BN
    # assert PER_BLOCK_SIZE == BM and BM == BN
    q = torch.empty((Z, H, N_CTX, HEAD_DIM), dtype=dtype, device=DEVICE).normal_(mean=0.0, std=0.5).requires_grad_()
    k = torch.empty((Z, H, N_CTX, HEAD_DIM), dtype=dtype, device=DEVICE).normal_(mean=0.0, std=0.5).requires_grad_()
    v = torch.empty((Z, H, N_CTX, HEAD_DIM), dtype=dtype, device=DEVICE).normal_(mean=0.0, std=0.5).requires_grad_()


    sm_scale = 1.0 / math.sqrt(HEAD_DIM)

    atten_mask = None
    if causal:
        atten_mask = torch.triu(torch.ones(N_CTX, N_CTX, device=DEVICE), diagonal=1).bool()

    dscale_q, q_quant = block_quantize(q, torch.float8_e4m3fn, per_block_size=PER_BLOCK_SIZE_Q)
    dscale_k, k_quant = block_quantize(k, torch.float8_e4m3fn, per_block_size=PER_BLOCK_SIZE_KV)
    dscale_v, v_quant = block_quantize(v, torch.float8_e4m3fn, per_block_size=PER_BLOCK_SIZE_KV)


    tri_out = attention(
        q_quant, k_quant, v_quant, dscale_q, dscale_k, dscale_v, atten_mask, causal, sm_scale, BM, BN, PER_BLOCK_SIZE_Q,
        PER_BLOCK_SIZE_KV
    )
