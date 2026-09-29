#include <stdint.h> 
#pragma once
typedef struct {
    uint32_t rkey;
    uint32_t psn;
    uint32_t remote_qpn;
    uint32_t remote_ip;
    uint64_t vaddr;
    uint32_t iterations;
    uint32_t length;
} rdma_params_t;

int connect_qp(const char * remote_ip, int port, rdma_params_t * params);
