// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xstream_generator.h"

extern XStream_generator_Config XStream_generator_ConfigTable[];

#ifdef SDT
XStream_generator_Config *XStream_generator_LookupConfig(UINTPTR BaseAddress) {
	XStream_generator_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XStream_generator_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XStream_generator_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XStream_generator_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XStream_generator_Initialize(XStream_generator *InstancePtr, UINTPTR BaseAddress) {
	XStream_generator_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XStream_generator_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XStream_generator_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XStream_generator_Config *XStream_generator_LookupConfig(u16 DeviceId) {
	XStream_generator_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSTREAM_GENERATOR_NUM_INSTANCES; Index++) {
		if (XStream_generator_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XStream_generator_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XStream_generator_Initialize(XStream_generator *InstancePtr, u16 DeviceId) {
	XStream_generator_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XStream_generator_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XStream_generator_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

