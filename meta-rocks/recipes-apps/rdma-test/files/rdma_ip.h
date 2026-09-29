
int rdma_set_ip_address(uint32_t ip);
int rdma_get_ip_address(uint32_t * ip);
int rdma_set_mac_address(uint32_t mac);
int rdma_get_mac_address(uint32_t * mac);
int rdma_get_crc_drop_count(uint32_t * crc_drop_cnt);
int rdma_get_rx_count(uint32_t * rx_cnt);
int rdma_get_tx_count(uint32_t * tx_cnt);
int rdma_get_invalid_psn_drop_count(uint32_t * invalid_psn_drop_cnt);
int rdma_get_retrans_count(uint32_t * retrans_cnt);
int rdma_get_cycles_count(uint32_t * cycles_cnt);
int rdma_get_acks_count(uint32_t * acks_cnt);
int rdma_get_sq_metas_count(uint32_t * sq_metas_cnt);
