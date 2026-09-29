#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>

#include "xstream_generator_hw.h"
#include "rdma_write.h"

#define PCI_FILE "/dev/mem"
#define BASE_ADDR 0x80010000
#define PAGE_SIZE 0x10000
#define AP_START (1 << 0)
#define AP_DONE  (1 << 1)
#define AP_IDLE  (1 << 2)



int rdma_write(rdma_params_t * params){
    // write to mapped memory to trigger the RDMA write operation
    int f ;
    uint32_t * ptr;
    f = open(PCI_FILE, O_RDWR | O_SYNC);
    if (f < 0) {
       perror("Error opening PCI device file");
       return -1;
    }
    ptr = mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, f, BASE_ADDR);
    if (ptr == MAP_FAILED) {
       perror("Error mapping PCI device memory");
       return -1;
    }
    uint32_t beat_0 = params->rkey; //rkey
    uint32_t beat_1 = params->psn; // psn
    uint32_t beat_2 = params->remote_qpn; // remote_qpn
    uint32_t beat_3 = params->remote_ip; // remote_ip
    uint32_t beat_4 = (uint32_t)params->vaddr; // vaddr 1
    uint32_t beat_5 = (uint32_t)(params->vaddr >> 32); // vaddr 2
    uint32_t beat_6 = params->iterations; // iterations
    uint32_t beat_7 = params->length; 

    ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4] = beat_0;
    ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 + 1] = beat_1;
    ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 + 2] = beat_2;
    ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 + 3] = beat_3;
    ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 + 4] = beat_4 ;
    ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 + 5] = beat_5 ;
    ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 +6] = beat_6;
    ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 +7] = beat_7;
    ptr[XSTREAM_GENERATOR_CONTROL_ADDR_AP_CTRL] = 0x1; // Start the operation

     // wait for the operation to complete
    while((ptr[XSTREAM_GENERATOR_CONTROL_ADDR_AP_CTRL] & AP_IDLE) == 0) {
        //printf("Waiting for operation to complete...\n");
        sleep(1);
    }   

    munmap(ptr, PAGE_SIZE);
    close(f);
    return 0;

}