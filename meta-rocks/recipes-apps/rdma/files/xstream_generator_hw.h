// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 4  - ap_continue (Read/Write/SC)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of ctrl
//        bit 31~0 - ctrl[31:0] (Read/Write)
// 0x14 : Data signal of ctrl
//        bit 31~0 - ctrl[63:32] (Read/Write)
// 0x18 : Data signal of ctrl
//        bit 31~0 - ctrl[95:64] (Read/Write)
// 0x1c : Data signal of ctrl
//        bit 31~0 - ctrl[127:96] (Read/Write)
// 0x20 : Data signal of ctrl
//        bit 31~0 - ctrl[159:128] (Read/Write)
// 0x24 : Data signal of ctrl
//        bit 31~0 - ctrl[191:160] (Read/Write)
// 0x28 : Data signal of ctrl
//        bit 31~0 - ctrl[223:192] (Read/Write)
// 0x2c : Data signal of ctrl
//        bit 31~0 - ctrl[255:224] (Read/Write)
// 0x30 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XSTREAM_GENERATOR_CONTROL_ADDR_AP_CTRL   0x00
#define XSTREAM_GENERATOR_CONTROL_ADDR_GIE       0x04
#define XSTREAM_GENERATOR_CONTROL_ADDR_IER       0x08
#define XSTREAM_GENERATOR_CONTROL_ADDR_ISR       0x0c
#define XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA 0x10
#define XSTREAM_GENERATOR_CONTROL_BITS_CTRL_DATA 256

