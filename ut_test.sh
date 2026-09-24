docker run -u 0 -dit --shm-size=512g --name=mj --net=host --privileged=true --shm-size='300g' --ulimit memlock=150000000000:150000000000 -e ASCEND_RT_VISIBLE_DEVICES=1 -v /data:/data -v /home:/home -v /root/.ssh:/root/.ssh -v /usr/local/Ascend/driver/:/usr/local/Ascend/driver/ -v /etc/ascend_install.info:/etc/ascend_install.info triton_op_pipeline:v1.0 /bin/bash

/home/m00953828/TileIR/OpenTileAS/third_party/llvm-project/build/bin/llvm-objdump -D -S kernel.o kernel.S

vim /usr/local/python3.11.13/lib/python3.11/site-packages/triton/backends/ascend/compiler.py

export ASCEND_RT_VISIBLE_DEVICES=6

source /data/set_proxy.bash
source /data/setenv.bash
export PATH=/data/m00953828/NPU-IR/0819/triton/backends/ascend/bishengir/bin:$PATH


rm -rf ~/.triton/cache && rm -rf ./cache && TRITON_CACHE_DIR=./cache TRITON_ALWAYS_COMPILE=1 TRITON_DEBUG=1 pytest -sv /data/w00893189/0824/mojo_opset/mojo_opset/tests/perf/test_attention_swa_mfu.py::test_swa_function_perf


#流水
PYTHONPATH=src/kernels:$PYTHONPATH && rm -rf ~/.triton/cache && rm -rf ./cache && \
  TRITON_CACHE_DIR=cache TRITON_ALWAYS_COMPILE=1 TRITON_DEBUG=1 msprof op simulator --kernel-name=recompute_w_u_fwd_kernel --core-id=0 --soc-version=Ascend950PR_9589 --output=./performance pytest /data/m00953828/Q2TritonKernel/tests/fla/test_wy_fast_gated_delta.py -sv



git clone https://p_platformuser1:m8TD%40tf9@szv-open.codehub.huawei.com/TestCode/Computing/BeiMing_TD/LLM/Triton_Automation.git -b br_a5_operator_3.6
cp -r Triton_Automation/ascend triton_ascend


PERSONAL_DIR=/data/m00953828/code-repo
cd $PERSONAL_DIR
export WORKSPACE=${PERSONAL_DIR}
export HARDWARE_TYPE=NPU_A5

source /etc/profile;source /root/.bashrc;export WORKSPACE=/data/m00953828/code-repo/;export HARDWARE_TYPE=NPU_A5;cd /data/m00953828/code-repo/triton_ascend/test/script;DEVICE_ID=5,6,7 PACKAGES_DIR=/data/Triton_Build_fast_pipeline/packages_zhugan bash check_package.sh
source /etc/profile;source /root/.bashrc;export WORKSPACE=/data/m00953828/code-repo/;export HARDWARE_TYPE=NPU_A5;cd /data/m00953828/code-repo/triton_ascend/test/script;bash pre_testcase.sh install_bs_triton /data/m00953828/code-repo/triton_ascend/test/data/packages

bash mojo_operator_cases/run_mojo_accuracy_hw_950_acc_github.sh