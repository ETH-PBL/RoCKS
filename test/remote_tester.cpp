#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string>
#include <errno.h>
#include <sys/queue.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <byteswap.h>
#include <rdma/rdma_cma.h>
#include <unistd.h>
#include <time.h>
#include <stdbool.h>
#include <boost/program_options.hpp>
#include <string>
#include <iostream>
#include <chrono> 
#include <random>
#include <cstring>
#include <infiniband/mlx5dv.h>

struct ibvQ {
    // Node 
    uint32_t ip_addr; 

    // Queue 
    uint32_t qpn; 
    uint32_t psn;
    uint32_t rkey;

    // Buffer 
    uint64_t *vaddr;
    uint32_t size;

    // Global ID 
    char gid[33]; 

    // Function to print a QP
    void print(const char *name) {

        printf("%s: QPN 0x%06x, PSN 0x%06x, RKEY 0x%06x, VADDR %016lx, SIZE %08x, IP 0x%08x\n",
            name, qpn, psn, rkey, (uint64_t)vaddr, size, ip_addr);
    }
};
typedef struct {
    uint32_t rkey;
    uint32_t psn;
    uint32_t remote_qpn;
    uint32_t remote_ip;
    uint64_t vaddr;
    uint32_t iterations;
    uint32_t length;
} rdma_params_t;

// global parameters
const int msgAck = 1;
const int msgNAck = 0; 
const int hugePageSize = (2*1024*1024);

// Default parameters for experimentation 
constexpr auto const defOper = false; // read
constexpr auto const defMinSize = 1024; 
constexpr auto const defMaxSize = 64 * 65536;//64 * 1024; 
constexpr auto const defNRepsThr = 1000;
constexpr auto const defNRepsLat = 100;
constexpr auto const defVerbose = false;
constexpr auto const defNTransactions = 1;
constexpr auto const defTCPIP = 3232235798; 		// 192.168.1.22
constexpr auto const remote_TCPIP = 3232235796; 	// 192.168.1.20


int main(){
    int tcp_ip = defTCPIP;
    bool oper = defOper;
    uint32_t min_size = defMinSize;
    uint32_t max_size = defMaxSize;
    uint32_t n_reps_thr = defNRepsThr;
    uint32_t n_reps_lat = defNRepsLat;
    bool verbose = defVerbose; 
	uint32_t n_transactions = defNTransactions; 
    //Mellanox card setup
    // Get device to be opened 
	struct ibv_device **dev_list; 
	dev_list = ibv_get_device_list(NULL);
	if(!dev_list) {
		throw std::runtime_error("1 - Device not found!");
		return -1;
	} else {
		printf("Found the following device: %s \n", ibv_get_device_name(dev_list[0]));
	}

    // Communication context 
	struct ibv_context *context; 
	context = ibv_open_device(dev_list[0]);
	if(!context) {
		throw std::runtime_error("2 - Context not created, device couldn't be opened!");
		return -1; 
	} else {
		printf("Opened the following device: %s \n", ibv_get_device_name(context->device));
	}

    // Communication Protection Domain 
	struct ibv_pd *pd; 
	pd = ibv_alloc_pd(context);
	if(!pd) {
		throw std::runtime_error("3 - Protection Domain couldn't be allocated!");
		return -1;
	} else {
		printf("Allocated the Protection Domain. \n");
	}
    // Register Memory Region 
	uint32_t n_pages = (max_size + hugePageSize -1) / hugePageSize;
	size_t buf_bytes = (size_t)n_pages * hugePageSize;
	printf("Size of the allocated buffer: %d Bytes. \n", (n_pages*hugePageSize));
	uint64_t *buf = (uint64_t *)calloc(1, buf_bytes);
	if(buf == NULL) {
		throw std::runtime_error("3.5 - Couldn't obtain a buffer in the required size!");
		return -1; 
	} else {
		printf("Buffer obtained successfully! \n");
	}
    //this will be used to generate the rkey 
	struct ibv_mr *mr; 
	mr = ibv_reg_mr(pd,  buf, max_size, IBV_ACCESS_LOCAL_WRITE | IBV_ACCESS_REMOTE_WRITE | IBV_ACCESS_REMOTE_READ | IBV_ACCESS_RELAXED_ORDERING);
	if(!mr) {
		throw std::runtime_error("4 - Memory Region couldn't be allocated!");
		return -1;
	} else {
		printf("Allocated the Memory Region. \n");
	}
    // Create completion channel
	struct ibv_comp_channel *comp_channel; 
	comp_channel = ibv_create_comp_channel(context);
	if(!comp_channel) {
		throw std::runtime_error("5 - Completion Channel couldn't be created!");
		return -1;
	} else {
		printf("Created the Completion Channel. \n");
	}

	// Create completion queue 
	struct ibv_cq *comp_queue; 
	comp_queue = ibv_create_cq(context, 100, NULL, comp_channel, 0);
	if(!comp_queue) {
		throw std::runtime_error("6 - Completion Queue couldn't be created! ");
		return -1;
	} else {
		printf("Created the Completion Queue. \n");
	}



	// Create init attributes for the queue pair
	struct ibv_qp_init_attr qp_init_attr; 
	memset(&qp_init_attr, 0, sizeof(qp_init_attr));
	qp_init_attr.send_cq = comp_queue;
	qp_init_attr.recv_cq = comp_queue;
	qp_init_attr.qp_type = IBV_QPT_RC;
	qp_init_attr.cap.max_send_wr = 4096; // 2048; 
	qp_init_attr.cap.max_recv_wr = 4096; // 2048; 
	qp_init_attr.cap.max_send_sge = 16; // 2; 
	qp_init_attr.cap.max_recv_sge = 16; // 2; 
	printf("Created the QP Init Attributes. \n");
    
    // Create Queue Pair 
	struct ibv_qp *qp; 
	qp = ibv_create_qp(pd, &qp_init_attr);
	if(!qp) {
		throw std::runtime_error("7 - Queue Pair couldn't be created!");
		return -1;
	} else {
		printf("Created a Queue Pair. \n");
	}

	// Set Queue Pair to INIT
	struct ibv_qp_attr attr; 
	memset(&attr, 0 , sizeof(attr));
	attr.qp_state = IBV_QPS_INIT; 
	attr.port_num = 1;
	attr.pkey_index = 0; 
	attr.qp_access_flags = IBV_ACCESS_REMOTE_WRITE | IBV_ACCESS_REMOTE_READ; 
	attr.path_mtu = IBV_MTU_4096; 

	switch(ibv_modify_qp(qp, &attr, IBV_QP_STATE | IBV_QP_ACCESS_FLAGS | IBV_QP_PKEY_INDEX | IBV_QP_PORT)) {
		case 0: printf("Set the Queue Pair to INIT. \n"); break;
		case -1: throw std::runtime_error("8 - Queue Pair couldn't be set to INIT - unspecified!"); return -1; break; 
		case EINVAL: throw std::runtime_error("8 - Queue Pair couldn't be set to INIT - Invalid Value provided!"); return -1; break; 
		case ENOMEM: throw std::runtime_error("8 - Queue Pair couldn't be set to INIT - not enough resources!"); return -1; break;
		default: throw std::runtime_error("8 - Queue Pair couldn't be set to INIT - don't know why."); return -1; break;
	}


    // Create Remote QP with static values (based on our FPGA setup)
    struct ibvQ *remote_ibvQ;
	remote_ibvQ = (struct ibvQ*)malloc(sizeof(struct ibvQ));
    // TODO : Fill in the remote QP information here
	remote_ibvQ->qpn = 0x400;
	remote_ibvQ->ip_addr = remote_TCPIP;
	remote_ibvQ->psn = 0x1;
	remote_ibvQ->rkey = 0xffff;
	remote_ibvQ->size = max_size;
	remote_ibvQ->vaddr = 0;
	// Build remote gid from the received IP-Address
	uint64_t remote_gid;
	remote_gid = 0x0000FFFF00000000 | (uint64_t)remote_ibvQ->ip_addr;
	// printf("ORed remote GID: %ld \n", remote_gid);
	uint32_t high_part = htonl((uint32_t)(remote_gid >> 32));
	uint32_t low_part = htonl((uint32_t) remote_gid & 0xFFFFFFFF);
	remote_gid = ((uint64_t)(low_part) << 32) | high_part;
	printf("Transformed remote GID: %ld \n", remote_gid);

	// Printout of the received information 
    remote_ibvQ->print("Remote"); 
    // Create local QP in reset phase
    // Setting up the local information of the ibvQ to send to the remote side 
	struct ibvQ *local_ibvQ; 
	local_ibvQ = (struct ibvQ*)malloc(sizeof(struct ibvQ));
	local_ibvQ->qpn = qp->qp_num;
	local_ibvQ->rkey = mr->lkey;
	local_ibvQ->vaddr = buf; 
	local_ibvQ->psn = remote_ibvQ->psn; 
	//local_ibvQ->psn = 0x1 ;
	local_ibvQ->size = max_size;
	local_ibvQ->ip_addr = tcp_ip;
	sprintf(local_ibvQ->gid, "%08x%08x%08x%08x", local_ibvQ->ip_addr, local_ibvQ->ip_addr, local_ibvQ->ip_addr, local_ibvQ->ip_addr);
	

    // Print the QPs 
	local_ibvQ->print("Local"); 
	remote_ibvQ->print("Remote"); 
    ///////////////////////////////////
    ///  Set local QP to RTR phase  ///
    ///////////////////////////////////
	// Change queuepair to RTR (ready to receive)
	memset(&attr, 0, sizeof(attr));
	union ibv_gid ibv_gid_variable;
	for(int i = 0; i < 16; i++) {
		ibv_gid_variable.raw[i] = (uint8_t) 0;
	}
	ibv_gid_variable.global.subnet_prefix = (__be64)0;
	// ibv_gid_variable.global.interface_id = (__be64)7082751587679928320;
	ibv_gid_variable.global.interface_id = (__be64)remote_gid;
	attr.qp_state = IBV_QPS_RTR;
	attr.path_mtu = IBV_MTU_4096;
	attr.dest_qp_num = remote_ibvQ->qpn;
	attr.rq_psn = local_ibvQ->psn;
	//attr.sq_psn = remote_ibvQ->psn;
	attr.max_dest_rd_atomic = 16;
	attr.max_rd_atomic = 16; 
	attr.min_rnr_timer = 0;
	attr.ah_attr.dlid = 0; 
	attr.ah_attr.sl = 1;
	attr.ah_attr.static_rate = IBV_RATE_10_GBPS; 
	attr.ah_attr.is_global = 1;
	attr.ah_attr.src_path_bits = 0;
	attr.ah_attr.port_num = 1;
	attr.ah_attr.grh.dgid = ibv_gid_variable;
	attr.ah_attr.grh.flow_label = 0;
	attr.ah_attr.grh.sgid_index = 3;
	attr.ah_attr.grh.hop_limit = 4;
	attr.ah_attr.grh.traffic_class = 0; 

    union ibv_gid gid; 
	int rc = ibv_query_gid(context, 1, 3, &gid);
	if(rc) {
		throw std::runtime_error("Querying the gid didn't work!");
	} else {
		printf("GID-values: \n");
		printf(" - Subnet prefix: %lld \n", gid.global.subnet_prefix);
		printf(" - Interface ID: %lld \n", gid.global.interface_id);
	}

	// Printout of data sent to the remote side
	printf("IBV_QP_STATE: %d \n", attr.qp_state);
	printf("IBV_QP_PATH_MTU: %d \n", attr.path_mtu);
	printf("IBV_QP_DEST_QPN: %d \n", attr.dest_qp_num);
	printf("IBV_QP_RQ_PSN: %d \n", attr.rq_psn);
	printf("IBV_QP_MAX_DEST_RD_ATOMIC: %d \n", attr.max_dest_rd_atomic);
	printf("IBV_QP_MIN_RNR_TIMER: %d \n", attr.min_rnr_timer);
	printf("IBV AH ATTR: \n");
	printf(" - DLID: %d \n", attr.ah_attr.dlid);
	printf(" - Service Level: %d \n", attr.ah_attr.sl);
	printf(" - Static Rate: %d \n", attr.ah_attr.static_rate);
	printf(" - Is Global: %d \n", attr.ah_attr.is_global);
	printf(" - src_path_bits: %d \n", attr.ah_attr.src_path_bits);
	printf(" - port number: %d \n", attr.ah_attr.port_num);
	printf(" - Global Routing Header: \n");
	printf(" - - flow_label: %d \n", attr.ah_attr.grh.flow_label);
	printf(" - - sgid_index: %d \n", attr.ah_attr.grh.sgid_index);
	printf(" - - hop_limit: %d \n", attr.ah_attr.grh.hop_limit);
	printf(" - - traffic class: %d \n", attr.ah_attr.grh.traffic_class);
	printf(" - - Global ID: \n");
	printf(" - - - - Subnet Prefix: %lld \n", attr.ah_attr.grh.dgid.global.subnet_prefix);
	printf(" - - - - Interface ID: %lld \n", attr.ah_attr.grh.dgid.global.interface_id);

	errno = ibv_modify_qp(qp, &attr, IBV_QP_STATE | IBV_QP_AV | IBV_QP_PATH_MTU | IBV_QP_DEST_QPN | IBV_QP_RQ_PSN | IBV_QP_MAX_DEST_RD_ATOMIC | IBV_QP_MIN_RNR_TIMER);
	switch(errno) {
		case 0: printf("Set the Queue Pair to RTR. \n"); break;
		default: printf("%s \n", strerror(errno)); throw std::runtime_error("17 - IBV QP modification went wrong!\n"); return -1; break;
	}

		struct ibv_sge sge = {
		.addr   = (uintptr_t)buf,
		.length = max_size,
		.lkey   = mr->lkey
	};

	struct ibv_recv_wr wr = {};
	wr.sg_list = &sge;
	wr.num_sge = 1;

	struct ibv_recv_wr *bad;
	for(int i = 0; i < 16; i++) { 
		errno = ibv_post_recv(qp, &wr, &bad);
		switch(errno) {
			case 0: printf("Work request added. \n"); break;
			default: printf("%s \n", strerror(errno)); throw std::runtime_error("17 - Work request went wrong!\n"); return -1; break;
		}
	}
	
	// printf("%s", wr);

	// Change queuepair to RTS 
	memset(&attr, 0, sizeof(attr));
	attr.qp_state = IBV_QPS_RTS;
	attr.sq_psn = local_ibvQ->psn;
	attr.timeout = 20; 
	attr.retry_cnt = 12; 
	attr.rnr_retry = 7;
	attr.max_rd_atomic = 16; 
	attr.path_mig_state = IBV_MIG_REARM;
	// Read the buffer 
	printf("Buffer dump (first 256 bytes):\n");

	uint8_t *p = (uint8_t *)buf;
	size_t dump_len = buf_bytes < 256 ? buf_bytes : 256;

	for (size_t i = 0; i < dump_len; i++) {
		printf("%02x ", p[i]);
		if ((i + 1) % 16 == 0)
			printf("\n");
	}
	printf("\n");
	
	errno = ibv_modify_qp(qp, &attr, IBV_QP_STATE | IBV_QP_SQ_PSN | IBV_QP_TIMEOUT | IBV_QP_RETRY_CNT | IBV_QP_RNR_RETRY | IBV_QP_MAX_QP_RD_ATOMIC | IBV_QP_PATH_MIG_STATE);
	if(errno == 0) {
		printf("Set the Queue Pair to RTS. \n");
	} else {
		printf("%s \n", strerror(errno)); 
		throw std::runtime_error("18 - Setting the QP to RTS didn't work properly.");
	}
	// do handshake on the port 8000
	int sock = 0;
	struct sockaddr_in serv_addr;
	memset(&serv_addr, 0, sizeof(serv_addr));
	// create socket
	if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
		printf("\n Socket creation error \n");
		return -1;
	}else{
		printf("Socket created successfully! \n");
	}

	// Bind the socket to the port 8000
	serv_addr.sin_family = AF_INET;
	serv_addr.sin_port = htons(8000);
	serv_addr.sin_addr.s_addr = INADDR_ANY;
	int bind_ret = bind(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr));
	if (bind_ret < 0) {
		printf("\n Socket bind error \n");
		return -1;
	} else{
		printf("Socket binded successfully! \n");
	
	}
	// listen for incoming connections
	int listen_ret = listen(sock, 3);
	if (listen_ret < 0) {
		printf("\n Socket listen error \n");
		return -1;
	} else {
		printf("Socket is listening! \n");
	}
	// accept a connection
	int client_sock = accept(sock, NULL, NULL);
	if (client_sock < 0) {
		printf("\n Socket accept error \n");
		return -1;
	} else {
		printf("Socket accepted a connection! \n");
	}
	// read the handshake message from the client
	char buffer[1024] = {0};
	int read_val = read(client_sock, buffer, 1024);
	while(read_val == 0) {
		printf("Waiting for handshake message...\n");
		read_val = read(client_sock, buffer, 1024);
		sleep(1);
	}
	if (read_val < 0) {
		perror("\n Socket read error \n");
		return -1;
	}else{
		printf("Received handshake message: %s\n", buffer);	
	}
	//write the local QP information to the client
	rdma_params_t params;
	params.rkey = local_ibvQ->rkey;
	params.psn = local_ibvQ->psn;
	params.remote_qpn = local_ibvQ->qpn;
	params.remote_ip = htonl(defTCPIP);
	//params.remote_ip = local_ibvQ->ip_addr;
	params.vaddr = (uint64_t)local_ibvQ->vaddr;
	params.iterations = 1000;
	params.length = 2048;
	int write_val = write(client_sock, &params, sizeof(params));
	if (write_val < 0) {
		printf("\n Socket write error \n");
		return -1;
	} else {
		printf("Sent local QP information to the client!, %d bytes \n", write_val);
	}

	printf("Waiting for FPGA writes...\n");
	printf("Buffer address: %p (rkey=%d)\n", buf, mr->lkey);

	struct ibv_wc wc;
	struct ibv_cq *ev_cq;
	void *ev_ctx;

	// make sure that we get notified on the first completion
	int ret = ibv_req_notify_cq(comp_queue, 0);
	if (ret) {
		printf("Error: ibv_req_notify_cq() returned %d\n", ret);
		return ret;
	}

	// wait for a CQ event to arrive on the channel
	ret = ibv_get_cq_event(comp_channel, &ev_cq, &ev_ctx);
	if (ret) {
		printf("Error: ibv_get_cq_event returned %d\n", ret);
		return ret;
	}

	// acknowledge event
	ibv_ack_cq_events(ev_cq, 1);

	// poll event (which is an incoming RDMA SEND)
	ibv_poll_cq(comp_queue, 1, &wc);



	printf("############################################################################################# \n");
	printf("This is the end... \n");
	printf(" - Free the buffer now! \n");
	if(buf != NULL) {
		free(buf);
	} else {
		printf("Couldn't free the buffer! \n");
	}
	printf(" - Destroy the queue pair! \n");
	ibv_destroy_qp(qp);
	printf(" - Destroy the completion queue! \n");
	ibv_destroy_cq(comp_queue);
	printf(" - Destroy the completion channel! \n");
	ibv_destroy_comp_channel(comp_channel);
	printf(" - Dereg the memory region! \n");
	ibv_dereg_mr(mr);
	printf(" - Deallocate the Protection Domain! \n");
	ibv_dealloc_pd(pd);
	printf(" - Close the device! \n");
	ibv_close_device(context);
}
