#!/usr/bin/env bash
# Re-run the 12 kernel/case rows classified as 劣化 in kernel_perf_comparison.csv.
# Usage: bash run_degraded_12_perf_cases.sh --list
#        bash run_degraded_12_perf_cases.sh --cards 1,2,3,4,6,7
#        bash run_degraded_12_perf_cases.sh --cards 1,2,3,4,6,7 --resume <run-dir>
# Whole-batch phases: stable-1 -> current-1 -> current-2 -> stable-2.
# Every case stays on the same healthy card across all four phases.
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
REPO=/home/m00953828/mojo/mojo_operator_cases/github_mojo_opset_950perf
CANN_ENV=/data/shared/cann/9.2.0.weekly.20260902/cann-9.2.0/set_env.sh
STABLE_BIN=/home/m00953828/mojo/npu-ir/stable/bin
CURRENT_BIN=/home/m00953828/mojo/npu-ir/local-inplace/bin
RESULT_PARENT=${RESULT_PARENT:-/home/m00953828/mojo/mojo_data}

# Frozen from the 12 "劣化" rows in beam_search/kernel_perf_comparison.csv.
CASES=(
  '_gelu_fwd_kernel|mojo_opset/tests/perf/test_activation.py::test_gelu[x1]'
  '_int8_gemm_dequant_kernel|mojo_opset/tests/perf/test_gemm_dequant.py::test_quant_gemm_perf[x_i88-w_i88-x_scale8-w_scale8-output_dtype8-False]'
  '_sdpa_infer_kernel|mojo_opset/tests/perf/test_attention.py::test_sdpa[query0-key0-value0-blockwise_diffusion_attn_mask0-True]'
  '_silu_fwd_flatten_kernel|mojo_opset/tests/perf/test_activation.py::test_silu[x3]'
  '_silu_fwd_flatten_kernel|mojo_opset/tests/perf/test_activation.py::test_silu_forward_backward_diff[shape1]'
  '_silu_fwd_flatten_kernel|mojo_opset/tests/perf/test_activation.py::test_silu_forward_backward_diff[shape2]'
  '_swa_bwd_preprocess|mojo_opset/tests/perf/test_attention_swa_mfu.py::test_swa_function_perf[False-4-1023-M_BF16_4096]'
  '_swa_bwd_preprocess|mojo_opset/tests/perf/test_attention_swa_mfu.py::test_swa_function_perf[False-4-1023-M_BF16_8192]'
  'flex_attention_kernel|mojo_opset/tests/perf/test_flex_attention_mfu.py::test_flex_attention_perf[cross_2000_22000]'
  'kernel_sdpa_bwd_d|mojo_opset/tests/perf/test_sdpa_impl.py::test_sdpa_impl[1-5-1-128-2048-32]'
  'kernel_sdpa_bwd_d|mojo_opset/tests/perf/test_sdpa_impl.py::test_sdpa_impl[1-8-2-128-8192-32]'
  'lightning_indexer_kernel|mojo_opset/tests/perf/test_indexer.py::test_lightning_index[query7-query_scale7-key7-key_scale7]'
)

if [[ ${#CASES[@]} -ne 12 ]]; then
  echo "Expected exactly 12 cases" >&2
  exit 2
fi

if [[ ${1:-} == --list ]]; then
  for index in "${!CASES[@]}"; do
    printf '%02d\t%s\n' "$((index + 1))" "${CASES[index]}"
  done
  exit 0
fi
if [[ ( $# -ne 2 && $# -ne 4 ) || ${1:-} != --cards || -z ${2:-} ||
      ( $# -eq 4 && ( ${3:-} != --resume || -z ${4:-} ) ) ]]; then
  echo "Usage: bash $SCRIPT_DIR/run_degraded_12_perf_cases.sh --list" >&2
  echo "   or: bash $SCRIPT_DIR/run_degraded_12_perf_cases.sh --cards <comma-separated healthy idle NPU IDs> [--resume <run-dir>]" >&2
  exit 2
fi
IFS=, read -r -a CARDS <<< "$2"
if [[ ${#CARDS[@]} -eq 0 || ${#CARDS[@]} -gt 8 ]]; then
  echo "Select 1 to 8 NPU cards" >&2
  exit 2
fi
declare -A SEEN_CARDS=()
for card in "${CARDS[@]}"; do
  if [[ ! $card =~ ^[0-7]$ || -v SEEN_CARDS[$card] ]]; then
    echo "Invalid or duplicate NPU card: $card" >&2
    exit 2
  fi
  SEEN_CARDS[$card]=1
done
PHASES=(stable-1 current-1 current-2 stable-2)

for required in "$CANN_ENV" "$STABLE_BIN/bishengir-compile" "$CURRENT_BIN/bishengir-compile"; do
  if [[ ! -e $required ]]; then
    echo "Missing prerequisite: $required" >&2
    exit 2
  fi
done
check_cards() {
  local smi_output card
  smi_output=$(npu-smi info)
  for card in "${CARDS[@]}"; do
    if ! grep -Eq "^\\|[[:space:]]*$card[[:space:]]+\\|[^|]+\\|[[:space:]]*OK[[:space:]]+\\|" <<< "$smi_output"; then
      echo "NPU $card is not reported healthy by npu-smi" >&2
      return 1
    fi
    if ! grep -Fq "No running processes found in NPU $card" <<< "$smi_output"; then
      echo "NPU $card has a running process; stop before the next phase" >&2
      return 1
    fi
  done
}
check_cards

# shellcheck disable=SC1090
source "$CANN_ENV"
BASE_PATH=$PATH
export PYTHONPATH="$REPO:${PYTHONPATH:-}"
export MOJO_BACKEND=ttx
export TRITON_ALWAYS_COMPILE=1
export TRITON_DEBUG=1
export TRITON_PRINT_AUTOTUNING=1
mkdir -p "$RESULT_PARENT"
if [[ $# -eq 4 ]]; then
  RUN_DIR=$4
  if [[ ! -d $RUN_DIR || ! -f $RUN_DIR/summary.tsv || ! -f $RUN_DIR/run_info.txt ||
        ! -f $RUN_DIR/case_card_map.tsv ]]; then
    echo "Incomplete resume directory: $RUN_DIR" >&2
    exit 2
  fi
  for line in "cards=${CARDS[*]}" "phases=${PHASES[*]}" \
    "stable_sha256=$(sha256sum "$STABLE_BIN/bishengir-compile")" \
    "current_sha256=$(sha256sum "$CURRENT_BIN/bishengir-compile")"; do
    if ! grep -Fxq "$line" "$RUN_DIR/run_info.txt"; then
      echo "Resume metadata mismatch: $line" >&2
      exit 2
    fi
  done
else
  RUN_DIR=$(mktemp -d "$RESULT_PARENT/planmemory_degraded12_$(date +%Y%m%d_%H%M%S)_XXXXXX")
  printf 'index\tkernel_name\tcase\trun\tpytest_exit\tlog\n' > "$RUN_DIR/summary.tsv"
  printf 'source_csv=%s\ncards=%s\nphases=%s\nstable_sha256=%s\ncurrent_sha256=%s\n' \
    "$SCRIPT_DIR/kernel_perf_comparison.csv" "${CARDS[*]}" "${PHASES[*]}" \
    "$(sha256sum "$STABLE_BIN/bishengir-compile")" \
    "$(sha256sum "$CURRENT_BIN/bishengir-compile")" > "$RUN_DIR/run_info.txt"
  printf 'index\tkernel_name\tcase\tnpu_id\n' > "$RUN_DIR/case_card_map.tsv"
fi
for index in "${!CASES[@]}"; do
  item=${CASES[index]}
  case_id=${item#*|}
  case_file=${case_id%%::*}
  if [[ ! -f "$REPO/$case_file" ]]; then
    echo "Missing pytest file: $REPO/$case_file" >&2
    exit 2
  fi
  if [[ $# -eq 2 ]]; then
    printf '%d\t%s\t%s\t%s\n' "$((index + 1))" "${item%%|*}" "$case_id" \
      "${CARDS[index % ${#CARDS[@]}]}" >> "$RUN_DIR/case_card_map.tsv"
  fi
done
echo "Result directory: $RUN_DIR"
echo "Forced compilation: TRITON_ALWAYS_COMPILE=$TRITON_ALWAYS_COMPILE"
echo "Case/card mapping: $RUN_DIR/case_card_map.tsv"

run_case() {
  local index=$1 run=$2 card=$3 expected=$4
  local item kernel case_id label work actual status
  item=${CASES[index]}
  kernel=${item%%|*}
  case_id=${item#*|}
  label=$(printf '%02d_%s' "$((index + 1))" "$kernel")
  work="$RUN_DIR/$label/$run"
  mkdir -p "$work"
  actual=$(command -v bishengir-compile)
  if [[ $actual != "$expected" ]]; then
    echo "Unexpected compiler: $actual (expected $expected)" >&2
    return 2
  fi
  export TRITON_CACHE_DIR="$work/cache"
  printf '%s\n' "$actual" > "$work/compiler.txt"
  sha256sum "$actual" >> "$work/compiler.txt"
  echo "START $label $run NPU=$card $(date '+%F %T')"
  if (cd "$work" && pytest -sv "$REPO/$case_id" --junitxml=results.xml > pytest.log 2>&1); then
    status=0
  else
    status=$?
  fi
  printf '%s\n' "$status" > "$work/exit_code.txt"
  echo "DONE  $label $run NPU=$card exit=$status $(date '+%F %T')"
}

failures=$(awk -F '\t' 'NR>1 && $5 != 0 {n++} END {print n+0}' "$RUN_DIR/summary.tsv")
for run in "${PHASES[@]}"; do
  completed=$(awk -F '\t' -v phase="$run" 'NR>1 && $4==phase {n++} END {print n+0}' "$RUN_DIR/summary.tsv")
  if (( completed == ${#CASES[@]} )); then
    echo "PHASE SKIP  $run (already complete)"
    continue
  fi
  if (( completed != 0 )); then
    echo "Cannot resume partially recorded phase $run: $completed/${#CASES[@]}" >&2
    exit 2
  fi
  check_cards
  version=${run%-*}
  if [[ $version == stable ]]; then
    export PATH="$STABLE_BIN:$BASE_PATH"
    expected="$STABLE_BIN/bishengir-compile"
  else
    export PATH="$CURRENT_BIN:$BASE_PATH"
    expected="$CURRENT_BIN/bishengir-compile"
  fi
  if [[ $(command -v bishengir-compile) != "$expected" ]]; then
    echo "Wrong compiler in phase $run" >&2
    exit 2
  fi
  echo "PHASE START $run compiler=$expected $(date '+%F %T')"
  pids=()
  for card_index in "${!CARDS[@]}"; do
    (
      export ASCEND_RT_VISIBLE_DEVICES="${CARDS[card_index]}"
      for index in "${!CASES[@]}"; do
        if (( index % ${#CARDS[@]} == card_index )); then
          run_case "$index" "$run" "${CARDS[card_index]}" "$expected"
        fi
      done
    ) &
    pids+=("$!")
  done
  for pid in "${pids[@]}"; do
    wait "$pid"
  done
  for index in "${!CASES[@]}"; do
    item=${CASES[index]}
    label=$(printf '%02d_%s' "$((index + 1))" "${item%%|*}")
    work="$RUN_DIR/$label/$run"
    status=$(<"$work/exit_code.txt")
    if (( status != 0 )); then
      failures=$((failures + 1))
    fi
    printf '%d\t%s\t%s\t%s\t%d\t%s\n' \
      "$((index + 1))" "${item%%|*}" "${item#*|}" "$run" "$status" "$work/pytest.log" >> "$RUN_DIR/summary.tsv"
  done
  echo "PHASE DONE  $run $(date '+%F %T')"
done
echo "Completed ${#CASES[@]} cases x ${#PHASES[@]} phases; failed runs=$failures; summary=$RUN_DIR/summary.tsv"
(( failures == 0 ))
