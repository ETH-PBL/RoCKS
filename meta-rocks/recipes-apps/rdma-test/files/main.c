#include "qp_connections.h"
#include "rdma_write.h"
#include "rdma_ip.h"
#include <stdio.h>
#include <unistd.h>


int main(){

    const char * remote_ip = "192.168.1.22";
    int port = 8000;
    rdma_params_t params;
    printf("Started rdma-test with remote IP: %s and port: %d\n", remote_ip, port);
    if(connect_qp(remote_ip, port, &params) < 0) {
        printf("\nFailed to connect to remote and retrieve parameters\n");
        return -1;
    }

    // wait 100ms for remote to be ready to accept RoCEv2 data
    usleep(100*1000);

    if(rdma_write(&params) < 0) {
        printf("Failed to perform RDMA write operation\n");
        return -1;
    }

    // wait for data transfer to finish
    sleep(1);

    // statistics
    uint32_t crc_drop_cnt, rx_cnt, tx_cnt, invalid_psn_drop_cnt,
        retrans_cnt, cycles_cnt, acks_cnt, sq_metas_cnt;
    rdma_get_crc_drop_count(&crc_drop_cnt);
    rdma_get_rx_count(&rx_cnt);
    rdma_get_tx_count(&tx_cnt);
    rdma_get_invalid_psn_drop_count(&invalid_psn_drop_cnt);
    rdma_get_retrans_count(&retrans_cnt);
    rdma_get_cycles_count(&cycles_cnt);
    rdma_get_acks_count(&acks_cnt);
    rdma_get_sq_metas_count(&sq_metas_cnt);

    printf("\nTest successful!\n");

    printf("\n---------------- Counters ----------------\n");
    printf("RX frames                   %d\n", rx_cnt);
    printf("TX frames                   %d\n", tx_cnt);
    printf("Retransmission frames       %d\n", retrans_cnt);
    printf("CRC drop frames             %d\n", crc_drop_cnt);
    printf("Invalid PSN drop frames     %d\n", invalid_psn_drop_cnt);

    printf("\n--------------- Statistics ---------------\n");
    printf("RoCEv2 throughput           %2.3f Gbps\n", 1001 * (2048 * 8) / (10e-9 * cycles_cnt) / 1e9);

    return 0;
}
