#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>

#include "rdma_ip.h"

#define PCI_FILE "/dev/mem"
#define BASE_ADDR 0x80020000
#define PAGE_SIZE 0x10000

// registers
#define RDMA_IP_REG_IP_ADDRESS          0
#define RDMA_IP_REG_MAC_ADDRESS         1
#define RDMA_IP_REG_CRC_DROP            2
#define RDMA_IP_REG_RX                  3
#define RDMA_IP_REG_TX                  4
#define RDMA_IP_REG_INVALID_PSN_DROP    5
#define RDMA_IP_REG_RETRANS             6
#define RDMA_IP_REG_CYCLES              7
#define RDMA_IP_REG_ACKS                8
#define RDMA_IP_SQ_METAS                9


int rdma_set_ip_address(uint32_t ip) {
    // write to mapped memory to trigger the RDMA write operation
    int f;
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

    ptr[RDMA_IP_REG_IP_ADDRESS] = ip;

    munmap(ptr, PAGE_SIZE);
    close(f);
    return 0;
}

int rdma_get_ip_address(uint32_t * ip) {
    // write to mapped memory to trigger the RDMA write operation
    int f;
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

    *ip = ptr[RDMA_IP_REG_IP_ADDRESS];

    munmap(ptr, PAGE_SIZE);
    close(f);
    return 0;
}

int rdma_set_mac_address(uint32_t mac) {
    // write to mapped memory to trigger the RDMA write operation
    int f;
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

    ptr[RDMA_IP_REG_MAC_ADDRESS] = mac;

    munmap(ptr, PAGE_SIZE);
    close(f);
    return 0;
}

int rdma_get_mac_address(uint32_t * mac) {
    // write to mapped memory to trigger the RDMA write operation
    int f;
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

    *mac = ptr[RDMA_IP_REG_MAC_ADDRESS];

    munmap(ptr, PAGE_SIZE);
    close(f);
    return 0;
}

int rdma_get_crc_drop_count(uint32_t * crc_drop_cnt) {
    // write to mapped memory to trigger the RDMA write operation
    int f;
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

    *crc_drop_cnt = ptr[RDMA_IP_REG_CRC_DROP];

    munmap(ptr, PAGE_SIZE);
    close(f);
    return 0;
}

int rdma_get_rx_count(uint32_t * rx_cnt) {
    // write to mapped memory to trigger the RDMA write operation
    int f;
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

    *rx_cnt = ptr[RDMA_IP_REG_RX];

    munmap(ptr, PAGE_SIZE);
    close(f);
    return 0;
}

int rdma_get_tx_count(uint32_t * tx_cnt) {
    // write to mapped memory to trigger the RDMA write operation
    int f;
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

    *tx_cnt = ptr[RDMA_IP_REG_TX];

    munmap(ptr, PAGE_SIZE);
    close(f);
    return 0;
}

int rdma_get_invalid_psn_drop_count(uint32_t * invalid_psn_drop_cnt) {
    // write to mapped memory to trigger the RDMA write operation
    int f;
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

    *invalid_psn_drop_cnt = ptr[RDMA_IP_REG_INVALID_PSN_DROP];

    munmap(ptr, PAGE_SIZE);
    close(f);
    return 0;
}

int rdma_get_retrans_count(uint32_t * retrans_cnt) {
    // write to mapped memory to trigger the RDMA write operation
    int f;
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

    *retrans_cnt = ptr[RDMA_IP_REG_RETRANS];

    munmap(ptr, PAGE_SIZE);
    close(f);
    return 0;
}

int rdma_get_cycles_count(uint32_t * cycles_cnt) {
    // write to mapped memory to trigger the RDMA write operation
    int f;
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

    *cycles_cnt = ptr[RDMA_IP_REG_CYCLES];

    munmap(ptr, PAGE_SIZE);
    close(f);
    return 0;
}

int rdma_get_acks_count(uint32_t * acks_cnt) {
    // write to mapped memory to trigger the RDMA write operation
    int f;
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

    *acks_cnt = ptr[RDMA_IP_REG_ACKS];

    munmap(ptr, PAGE_SIZE);
    close(f);
    return 0;
}

int rdma_get_sq_metas_count(uint32_t * sq_metas_cnt) {
    // write to mapped memory to trigger the RDMA write operation
    int f;
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

    *sq_metas_cnt = ptr[RDMA_IP_SQ_METAS];

    munmap(ptr, PAGE_SIZE);
    close(f);
    return 0;
}
