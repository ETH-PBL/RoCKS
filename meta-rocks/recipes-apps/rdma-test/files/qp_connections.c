#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>

#include "qp_connections.h"

int connect_qp(const char * remote_ip, int port, rdma_params_t * params) {
    int sock = 0;
    struct sockaddr_in serv_addr;

    if((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        printf("Creating socket failed\n");
        return -1;
    }else {
        printf("Created socket\n");
    }
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(port);

    if(inet_pton(AF_INET, remote_ip, &serv_addr.sin_addr) <= 0) {
        printf("Address invalid / not supported\n");
        return -1;
    }

    if(connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        printf("Connection failed\n");
        return -1;
    }else {
        printf("Connected to remote\n");
    }
    //write to the remote to request parameters
    char * request = "Requesting RDMA parameters\n";
    int result = send(sock, request, strlen(request), 0);
    if(result < 0) {
        perror("Failed to send request to remote\n");
        close(sock);
        return -1;
    }else {
        printf("Request sent to remote\n");
    }


    // Read the parameters sent by the remote
    int valread = read(sock, params, sizeof(*params));
    while(valread == 0){
        printf("Waiting for parameters from remote...\n");
        valread = read(sock, params, sizeof(*params));
        sleep(1);
    }
    if(valread < sizeof(*params)) {
        perror("Failed to read all parameters from remote\n");
        close(sock);
        return -1;
    }
    printf("Received parameters from remote: rkey=0x%08x, psn=0x%08x, remote_qpn=0x%08x, remote_ip=0x%08x, vaddr=0x%016lx, iterations=%u, length=%u\n",
           params->rkey, params->psn, params->remote_qpn, params->remote_ip, params->vaddr, params->iterations, params->length);

    close(sock);
    return 0;
}

