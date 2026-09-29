#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include "xstream_generator_hw.h"


#define PCI_FILE "/dev/mem"
#define BASE_ADDR 0x80010000
#define PAGE_SIZE 0x10000
#define AP_START (1 << 0)
#define AP_DONE  (1 << 1)
#define AP_IDLE  (1 << 2)


int main(int argc, char *argv[]) {
   if(argc != 7) {
      perror("Usage: ./rdma <remote_ip> <remote_qpn> <rkey> <vaddr> <iterations> <length>");
      return -1;
   }
   uint32_t remote_ip = (uint32_t)strtoul(argv[1], NULL, 0);
   uint32_t remote_qpn = (uint32_t)strtoul(argv[2], NULL, 0);
   uint32_t rkey = (uint32_t)strtoul(argv[3], NULL, 0);
   uint64_t vaddr = (uint64_t)strtoul(argv[4], NULL, 0);
   uint32_t iterations = (uint32_t)strtoul(argv[5], NULL, 0);
   uint32_t length = (uint32_t)strtoul(argv[6], NULL, 0);

   int f ;
   volatile uint32_t * ptr;

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
    uint32_t beat_0 = rkey; //rkey
    uint32_t beat_1 = 0x00000001; // psn
    uint32_t beat_2 = remote_qpn; // remote_qpn
    uint32_t beat_3 = remote_ip; // remote_ip
    uint32_t beat_4 = (uint32_t)vaddr; // vaddr 1
    uint32_t beat_5 = (uint32_t)(vaddr >> 32); // vaddr 2
    uint32_t beat_6 = iterations; // iterations
    uint32_t beat_7 = length; 
    //uint32_t beat_7 = 0x00000011; // Start
   //write data to the mapped memory
      // wait for idle BEFORE starting
   ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4] = beat_0;
   ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 + 1] = beat_1;
   ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 + 2] = beat_2;
   ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 + 3] = beat_3;
   ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 + 4] = beat_4 ;
   ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 + 5] = beat_5 ;
   ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 +6] = beat_6;
   ptr[XSTREAM_GENERATOR_CONTROL_ADDR_CTRL_DATA/4 +7] = beat_7;
   //ptr[XSTREAM_GENERATOR_CONTROL_ADDR_AP_CTRL/4] = beat_7;

   
   munmap(ptr, PAGE_SIZE);
   close(f);
   return 0;
}