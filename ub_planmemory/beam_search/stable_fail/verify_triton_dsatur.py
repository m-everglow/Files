"""Run the paired Triton/PlanMemory regression and save reproducible evidence."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import time


ROOT = Path('/home/m00953828')
CASE = ROOT / 'Files/ub_planmemory/beam_search/stable_fail/triton_dsatur_fragmentation.py'
STABLE = ROOT / 'mojo/npu-ir/stable/bin'
CURRENT = ROOT / 'mojo/mojo_data/triton_fragmentation_20261019/toolchains/current/bin'


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--deadline', type=float, default=time.time() + 3600)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    report = dict(started=time.time(), source=str(CASE), source_sha256=sha(CASE),
                  device='Ascend950PR_9579', visible_devices=os.environ.get('ASCEND_RT_VISIBLE_DEVICES'),
                  commands=[], runtime=[], isolated=[], binaries={}, assertions=[])
    for label, directory in [('stable', STABLE), ('current', CURRENT)]:
        report['binaries'][label] = {name: dict(path=str(directory / name), sha256=sha(directory / name))
                                     for name in ['bishengir-compile', 'bishengir-opt', 'hivmc', 'hivmc-a5']}
    report['shared_bitcode'] = dict(path=str(STABLE.parent / 'lib/meta_op.aiv.c310.bc'),
                                   sha256=sha(STABLE.parent / 'lib/meta_op.aiv.c310.bc'))
    report['git_commit'] = subprocess.check_output(['git', '-C', str(ROOT / 'AscendNPU-IR'), 'rev-parse', 'HEAD'], text=True).strip()

    def save():
        (args.output / 'verification.json').write_text(json.dumps(report, indent=2))

    def run(command, log, env=None, limit=90):
        remaining = args.deadline - time.time()
        if remaining <= 1:
            raise TimeoutError('Overall experiment deadline reached')
        started = time.time()
        with log.open('w') as stream:
            result = subprocess.run(command, stdout=stream, stderr=subprocess.STDOUT,
                                    env=env, timeout=min(limit, remaining))
        report['commands'].append(dict(command=list(map(str, command)), log=str(log),
                                       returncode=result.returncode, seconds=time.time()-started))
        save()
        return result.returncode, log.read_text(errors='replace')

    try:
        frontend_hashes = []
        for round_id in range(1, 4):
            for label, binary_dir in [('stable', STABLE), ('current', CURRENT)]:
                work = args.output / f'{label}_round{round_id}'
                work.mkdir(exist_ok=True)
                env = dict(os.environ, PATH=str(binary_dir) + ':' + os.environ['PATH'],
                           TRITON_CACHE_DIR=str(work / 'cache'), TRITON_ALWAYS_COMPILE='1')
                # Keep compilation output local to this run instead of the shared dump.
                env.pop('TRITON_DEBUG', None)
                command = [sys.executable, str(CASE), '--output', str(work), '--seed-base', str(round_id * 100)]
                if label == 'stable':
                    command.append('--compile-only')
                code, log = run(command, work / 'console.log', env=env)
                record = json.loads((work / 'result.json').read_text())
                if label == 'current':
                    assert code == 0 and record['status'] == 'PASS' and len(record['checks']) == 8
                else:
                    assert code != 0 and record['status'] == 'FAIL'
                    assert 'ub overflow' in log, log[-2500:]
                frontend = list((work / 'cache').rglob('fragmented_copy.bcmlir'))
                assert len(frontend) == 1, frontend
                frontend_hashes.append(sha(frontend[0]))
                record.pop('metadata', None)
                report['runtime'].append(dict(version=label, round=round_id, returncode=code,
                                              result=record, frontend_sha256=sha(frontend[0])))
                if label == 'current' and round_id == 1:
                    shutil.copyfile(frontend[0], args.output / 'input.bcmlir')
                print(f'{label} round {round_id}: exit={code}, checks={len(record["checks"])}', flush=True)
                save()
        assert len(set(frontend_hashes)) == 1, frontend_hashes
        report['assertions'].append('All six fresh-cache Triton frontend inputs have identical SHA256')

        common = ['--target=Ascend950PR_9579', '--enable-auto-multi-buffer=False',
                  '--enable-auto-bind-sub-block=False', '--disable-ffts',
                  '--limit-auto-multi-buffer-of-local-buffer=no-limit',
                  '--enable-hfusion-compile=true', '--enable-triton-kernel-compile=true',
                  '--append-bisheng-options=-cce-link-aicore-ll-module /usr/local/python3.11.15/lib/python3.11/site-packages/triton/backends/ascend/lib/libdevice.10.bc',
                  '--enable-vf-merge-level=1']
        before_modules = {}
        for label, binary_dir in [('stable', STABLE), ('current', CURRENT)]:
            command = [str(binary_dir / 'bishengir-compile'), str(args.output / 'input.bcmlir'), *common,
                       '--enable-tuning-mode', '--mlir-print-ir-before=hivm-plan-memory-regbase',
                       '--mlir-print-ir-after=hivm-plan-memory-regbase', '--debug-only=hivm-plan-memory',
                       '-o', str(args.output / f'{label}_debug')]
            code, log = run(command, args.output / f'{label}_debug.log')
            assert code == (1 if label == 'stable' else 0)
            marker = '// -----// IR Dump Before PlanMemoryRegBase (hivm-plan-memory-regbase) //----- //'
            modules = []
            for part in log.split(marker)[1:]:
                match = re.search(r'\n(module[\s\S]*?\n})\n', part)
                if match and '#hivm.address_space<ub>' in match.group(1):
                    modules.append(match.group(1) + '\n')
            assert modules
            before_modules[label] = modules[-1]
        assert before_modules['stable'] == before_modules['current'], 'PlanMemory inputs differ'
        plan_input = args.output / 'input_plan_memory.mlir'
        plan_input.write_text(before_modules['current'])
        report['plan_input_sha256'] = sha(plan_input)
        report['assertions'].append('Both full pipelines produce byte-identical final PlanMemory input')

        for round_id in range(1, 4):
            for label, binary_dir in [('stable', STABLE), ('current', CURRENT)]:
                output = args.output / f'{label}_plan_round{round_id}.mlir'
                command = [str(binary_dir / 'bishengir-opt'), str(plan_input),
                           '--hivm-plan-memory-regbase', '--debug-only=hivm-plan-memory', '-o', str(output)]
                code, log = run(command, args.output / f'{label}_plan_round{round_id}.log')
                if label == 'stable':
                    assert code == 1 and 'ub overflow' in log
                    assert 'Memory planning attempt 9/9' in log
                else:
                    assert code == 0 and '[PlanVerifier] verified 4 StorageEntries' in log
                    entries = re.findall(r'buffer : (%\w+) = memref\.alloc\(\).*?offset: (\d+), extent: (\d+)', log)
                    assert entries[-4:] == [('%alloc_7', '0', '131072'), ('%alloc_1', '131072', '65536'),
                                            ('%alloc', '0', '65536'), ('%alloc_3', '65536', '65536')], entries
                report['isolated'].append(dict(version=label, round=round_id, returncode=code))

        # Positive control: the old binary can also place this graph with another ordering.
        code, log = run([str(STABLE / 'bishengir-opt'), str(plan_input),
                         '--hivm-plan-memory-regbase=plan-memory-strategy=largest-first',
                         '-o', str(args.output / 'stable_largest_first.mlir')],
                        args.output / 'stable_largest_first.log')
        assert code == 0
        report['assertions'].append('Stable largest-first positive control succeeds on identical PlanMemory input')
        # Same flag on both versions rules out optional inplace choices as the cause.
        for label, binary_dir in [('stable', STABLE), ('current', CURRENT)]:
            code, log = run([str(binary_dir / 'bishengir-opt'), str(plan_input),
                             '--hivm-plan-memory-regbase=disable-tightly-coupled-buffer-reuse=true',
                             '-o', str(args.output / f'{label}_no_optional.mlir')],
                            args.output / f'{label}_no_optional.log')
            assert code == (1 if label == 'stable' else 0)
        report['assertions'].append('Disabling optional tightly-coupled reuse on both versions preserves the difference')
        report['status'] = 'PASS'
    except Exception as error:
        report.update(status='FAIL', error=repr(error))
        raise
    finally:
        report['ended'] = time.time()
        save()
        print(json.dumps({k: v for k, v in report.items() if k in ['status', 'error', 'assertions', 'started', 'ended']}, indent=2))


if __name__ == '__main__':
    main()
