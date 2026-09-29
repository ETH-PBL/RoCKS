# RoCEv2 on Kria SOM (RoCKS) FPGA Design

## Prerequisites

- Build machine: Ubuntu 24.04.5 LTS


## Setup build environment

1. Download Vitis v2025.2.1 (`*.tar`) from https://www.amd.com/en/support/downloads/adaptive-socs-and-fpgas/development-tools/2025-2.html, extract it with `tar -xvf *.tar` (be aware, the image is about 120GB).

2. Build Vitis docker image
```bash
cd docker
source build_docker.sh
```


## Populate submodules, apply patches

```bash
git submodule update --init --recursive
```

1. verilog-ethernet
```bash
cd verilog-ethernet/verilog-ethernet
git apply ../patches/0001-remove-udp-stack-instead-export-MAC-input-output-AXI.patch \
../patches/0002-increase-RX-TX-FIFO-size-to-8192-bytes.patch
```

2. fpga-network-stack
```bash
cd rdma_block_ip/fpga-network-stack
git apply ../patches/0001-v2025.2-migration.patch \
../patches/0002-fix-csim.patch \
../patches/0003-consume-but-ignore-Congestion-Notification-packets-C.patch \
../patches/0004-Fix-cumulative-ACK-handling-in-RoCEv2-transport-stac.patch
```


## Build Vitis HLS modules

1. Run Vitis docker container
```bash
docker compose run --rm vitis
```

2. fpga-network-stack
```bash
cd rdma_block_ip
mkdir build && cd build
cmake ..
make ip
```

3. Stream Generator
```bash
cd rdma_block_ip/stream_generator_ip
vitis-run --mode hls --tcl run_hls.tcl
```


## Compile design, export hardware files

1. Run Vitis docker container. `docker compose run --rm vitis`
2. Open design. `vivado -source scripts/build.tcl &`
3. Run the synthesis and implementation steps. Generate bitstream.
4. Export hardware including bitstream/binary. `File > Export > Export hardware...`
5. Generate System Device Tree (SDT) for Yocto
```bash
sdtgen sdt.tcl rocks.xsa rocks_sdt
tar czf rocks_sdt.tar.gz rocks_sdt
```

> **_Note:_**  Vitis v2025.2 contains bug where `pss_ref_clk` defined in `zynqmp-clk-ccf.dtsi` is 33.333333 MHz instead of 33.333 MHz (as defined in Zynq settings in Vivado) which leads to rounding errors resulting in wrong clock rates. This must be fixed manually. Alternatively, Vitis v2026.1 may be used where the bug is fixed (see [commit](https://github.com/Xilinx/linux-xlnx/commit/2932380b3fccc9ca6dcb7ab5e98bf4dd9350b4c9)).
