/*
 * Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
 * Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cstdint>
#include <stdio.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <string>
#include <iostream>
void example(char* a, char* b, char* c);
typedef ap_axiu<184,0,0,0> conn_interface;
typedef ap_axiu<248,0,0,0> meta_interface;
typedef ap_axiu<512,0,0,0> ack_interface;
typedef ap_axiu<512,0,0,0> rx_axis_interface;

void stream_generator(ap_uint<256> ctrl,  hls::stream<conn_interface>& qp_conn, hls::stream<conn_interface> &qp_interface, hls::stream<meta_interface> &sq_meta,  ap_uint<32> &counter_dbg,  ap_uint<64>&cur_vaddr_dbg , ap_uint<64> &cycles_dbg, ap_uint<32> &number_iterations);
int main() {
    ap_uint<256> ctrl;
    ctrl.range(31,0)= 0x001ffe00;
    ctrl.range(55,32) = 0x000001;
    ctrl.range(95,64) = 0x00000151;
    ctrl.range(127,96) = 0x0201a8c0;
    ctrl.range(191, 128) = 0x00007fde2e000010;
    ctrl.range(223,192) = 0x000000010;
    ctrl.range(239,224) = 0x0200;
    ctrl.range(255,240) = 0x0001;
    hls::stream<conn_interface> qp_conn;
    hls::stream<conn_interface> qp_interface;
    hls::stream<meta_interface> sq_meta;
    hls::stream<ack_interface> ack;
    hls::stream<ack_interface> rx_axis;
    ap_uint<32> counter_dbg;
    ap_uint<64> cur_vaddr_dbg;
    ap_uint<64> cycles_dbg;
    ap_uint<32> number_iterations;
    ap_uint<32> ack_count_dbg;
    ack_interface ack_pkt;
    ack_pkt.last = 1;
    ack_pkt.keep = -1;
    ack_pkt.data = 0xffffff;
    //ctrl.range(63.0)=0xFFFFFFFFFFFFFFFF;
    #pragma HLS PIPELINE II=1
    for(int i = 0 ; i < 100 ; i++){
        stream_generator(ctrl,  qp_conn, qp_interface, sq_meta,  counter_dbg, cur_vaddr_dbg,cycles_dbg, number_iterations);
    }
    
    #pragma HLS PIPELINE II=1
    for(int i = 0 ; i < 100 ; i++){
        //ack.write(ack_pkt);
        stream_generator(ctrl,  qp_conn, qp_interface, sq_meta, counter_dbg, cur_vaddr_dbg,cycles_dbg, number_iterations);
    }
    //stream_generator(ctrl, ack, qp_conn, qp_interface, sq_meta, rx_axis, counter_dbg, cur_vaddr_dbg,cycles_dbg, number_iterations);
     if (!qp_conn.empty()) {
        conn_interface pkt = qp_conn.read();
        std::string hex_str = pkt.data.to_string(16); // hex
        std::cout << "qp_conn = " << hex_str << std::endl;
    
        //printf("qp_conn = 0x%08x\n", (unsigned)pkt.data.range(183,0));
    } else {
        printf("No qp conn emitted\n");
    }
    if (!qp_interface.empty()) {
        conn_interface pkt2 = qp_interface.read();
        std::string hex_str = pkt2.data.to_string(16); // hex
        std::cout << "qp_interface = " << hex_str << std::endl;
    
       // printf("qp_interface = 0x%08x\n", (unsigned)pkt2.data.range(183,0));
    } else {
        printf("No qp_interface emitted\n");
    }
    if (!sq_meta.empty()) {
        meta_interface pkt3 = sq_meta.read();
        std::string hex_str = pkt3.data.to_string(16); // hex
        std::cout << "sq_meta = " << hex_str << std::endl;
        //printf("sq_meta = 0x%08x\n", (unsigned)pkt3.data.range(247,0));
    } else {
        printf("No sq_meta emitted\n");
    }
/*
    if (!rx_axis.empty()) {
        ack_interface pkt4 = rx_axis.read();
        std::string hex_str = pkt4.data.to_string(16); // hex
        std::cout << "rx_axis = " << hex_str << std::endl;
        //printf("sq_meta = 0x%08x\n", (unsigned)pkt3.data.range(247,0));
    } else {
        printf("No rx_axis emitted\n");
    }
*/
    printf("%d packets sent over %d cycles  \n", counter_dbg, cycles_dbg);
    printf("Finished running simulation");
    return 0;


    /*
    char a;
    char b;
    char c;
    char d;
    char sw_result;

    printf("HLS AXI-Lite Example\n");
    printf("Function c += a + b\n");
    printf("Initial values a = 5, b = 10, c = 0\n");

    a = 5;
    b = 10;
    c = 0;
    d = 0;

    example(&a, &b, &c);
    d += a + b;

    printf("HW result = %d\n", c);
    printf("SW result = %d\n", d);

    if (d == c) {
        printf("Success SW and HW results match\n");
        return 0;
    } else {
        printf("ERROR SW and HW results mismatch\n");
        return 1;
    }
    */
}
