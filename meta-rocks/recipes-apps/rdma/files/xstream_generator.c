// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xstream_generator.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XStream_generator_CfgInitialize(XStream_generator *InstancePtr, XStream_generator_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XStream_generator_Start(XStream_generator *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_AP_CTRL) & 0x80;
    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XStream_generator_IsDone(XStream_generator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XStream_generator_IsIdle(XStream_generator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XStream_generator_IsReady(XStream_generator *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XStream_generator_Continue(XStream_generator *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_AP_CTRL) & 0x80;
    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XStream_generator_EnableAutoRestart(XStream_generator *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XStream_generator_DisableAutoRestart(XStream_generator *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_AP_CTRL, 0);
}

void XStream_generator_Set_ctrl(XStream_generator *InstancePtr, XStream_generator_Ctrl Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 0, Data.word_0);
    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 4, Data.word_1);
    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 8, Data.word_2);
    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 12, Data.word_3);
    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 16, Data.word_4);
    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 20, Data.word_5);
    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 24, Data.word_6);
    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 28, Data.word_7);
}

XStream_generator_Ctrl XStream_generator_Get_ctrl(XStream_generator *InstancePtr) {
    XStream_generator_Ctrl Data;

    Data.word_0 = XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 0);
    Data.word_1 = XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 4);
    Data.word_2 = XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 8);
    Data.word_3 = XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 12);
    Data.word_4 = XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 16);
    Data.word_5 = XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 20);
    Data.word_6 = XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 24);
    Data.word_7 = XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA + 28);
    return Data;
}

void XStream_generator_InterruptGlobalEnable(XStream_generator *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_GIE, 1);
}

void XStream_generator_InterruptGlobalDisable(XStream_generator *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_GIE, 0);
}

void XStream_generator_InterruptEnable(XStream_generator *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_IER);
    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_IER, Register | Mask);
}

void XStream_generator_InterruptDisable(XStream_generator *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_IER);
    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_IER, Register & (~Mask));
}

void XStream_generator_InterruptClear(XStream_generator *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XStream_generator_WriteReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_ISR, Mask);
}

u32 XStream_generator_InterruptGetEnabled(XStream_generator *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_IER);
}

u32 XStream_generator_InterruptGetStatus(XStream_generator *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XStream_generator_ReadReg(InstancePtr->Control_BaseAddress, XSTREAM_GENERATOR_CONTROL_ADDR_ISR);
}

