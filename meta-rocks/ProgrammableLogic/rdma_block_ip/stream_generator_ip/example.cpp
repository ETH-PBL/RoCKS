#include <cstdint>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

typedef ap_axiu<184, 0, 0, 0> conn_interface;
typedef ap_axiu<248, 0, 0, 0> meta_interface;
typedef ap_axiu<512, 0, 0, 0> ack_interface;

#define LOCAL_QPN 0x400


void request_side(
    ap_uint<16> length,
    ap_uint<64> vaddr,
    ap_uint<32> remote_qpn,
    ap_uint<32> remote_ip,
    ap_uint<32> r_key,
    ap_uint<24> psn,
    hls::stream<conn_interface> &qp_conn,
    hls::stream<conn_interface> &qp_interface,
    hls::stream<meta_interface> &sq_meta
) {

    conn_interface qp_interface_pkt;
    conn_interface conn_pkt;
    meta_interface meta_pkt;



    qp_interface_pkt.keep = -1;
    qp_interface_pkt.last = 1;
    conn_pkt.keep = -1;
    conn_pkt.last = 1;

    // QP Interface Packet
    qp_interface_pkt.data = 0;
    qp_interface_pkt.data.range(31,0)       = 0x0003;           // QP State
    qp_interface_pkt.data.range(55,32)      = LOCAL_QPN;        // local QPN
    qp_interface_pkt.data.range(79,56)      = psn;              // remote PSN
    qp_interface_pkt.data.range(103,80)     = psn;              // local PSN
    qp_interface_pkt.data.range(135,104)    = r_key;            // RKEY
    qp_interface_pkt.data.range(183,136)    = 0x000000000000;   // remote virtual address
    qp_interface.write(qp_interface_pkt);

    // QP Conn Packet
    conn_pkt.data                   = 0;
    conn_pkt.data.range(15,0)       = LOCAL_QPN;    // local QPN
    conn_pkt.data.range(39,16)      = remote_qpn;   // remote QPN
    conn_pkt.data.range(71,40)      = remote_ip;    // remote IP address (4 x IPv4)
    conn_pkt.data.range(103,72)     = remote_ip;
    conn_pkt.data.range(135,104)    = remote_ip;
    conn_pkt.data.range(167,136)    = remote_ip;
    conn_pkt.data.range(183,168)    = 0x12b7;       // remote UDP port
    qp_conn.write(conn_pkt);


    meta_pkt.keep = -1;
    meta_pkt.last = 1;
    meta_pkt.data = 0;
    meta_pkt.data.range(31,0)   = 0x0000000a;   // opcode
    meta_pkt.data.range(47,32)  = LOCAL_QPN;    // local QPN
    meta_pkt.data.range(55,48)  = 0x03;         // host, last, offset (6 bits)
    meta_pkt.data.range(119,56) = vaddr;        // remote virtual address
    meta_pkt.data.range(215,184)= length;       // transfer length
    
    sq_meta.write(meta_pkt);
    

}

/*
// --- RESPONSE PROCESS (The Receiver) ---
void response_side(
    ap_uint<32> iterations,
    hls::stream<ack_interface> &ack,
    hls::stream<ack_interface> &rx_axis,
    ap_uint<32> &ack_cnt_out
) {
    static ap_uint<32> ack_count = 0;
    static bool running = false;

   
    // Monitor iterations to know when to start/reset
    if (ack_count < iterations) {

        if (!ack.empty() && !rx_axis.full()) {
            rx_axis.write(ack.read());
            ack_count++;
        }
    } else if (iterations == 0) {
        // Reset if iterations is cleared
        ack_count = 0;
    }

    ack_cnt_out = ack_count;
}
*/
// --- TOP LEVEL WRAPPER ---
void stream_generator(
    ap_uint<256> ctrl,
   // hls::stream<ack_interface> &ack,
    hls::stream<conn_interface> &qp_conn, 
    hls::stream<conn_interface> &qp_interface, 
    hls::stream<meta_interface> &sq_meta ,
  //  hls::stream<ack_interface> &rx_axis,
    ap_uint<32> &number_iterations,
    ap_uint<16> &packet_length
    //ap_uint<32> &ack_count_dbg
) {
    // AXI-Lite Interface for control signals
    #pragma HLS INTERFACE s_axilite port=ctrl bundle=control
    #pragma HLS INTERFACE ap_none port=number_iterations 
    #pragma HLS INTERFACE ap_none port=packet_length
   // #pragma HLS INTERFACE ap_none port=ack_count_dbg
    #pragma HLS INTERFACE s_axilite port=return bundle=control 

    // AXI-Stream Interfaces
   // #pragma HLS INTERFACE axis port=ack
    #pragma HLS INTERFACE axis port=qp_conn
    #pragma HLS INTERFACE axis port=qp_interface
    #pragma HLS INTERFACE axis port=sq_meta
   // #pragma HLS INTERFACE axis port=rx_axis

    // Shared internal wire for Flow Control
    static ap_uint<32> shared_ack_cnt = 0;

    // Unpack Control Word
    ap_uint<32> r_key      = ctrl.range(31,0);
    ap_uint<24> psn        = ctrl.range(55,32);
    ap_uint<32> remote_qpn = ctrl.range(95,64);
    ap_uint<32> remote_ip  = ctrl.range(127,96);
    ap_uint<64> vaddr      = ctrl.range(191,128);
    ap_uint<32> iterations = ctrl.range(223,192);
    ap_uint<16> length     = ctrl.range(239, 224);
    ap_uint<16> start      = ctrl.range(255,240);

    number_iterations = iterations;
    packet_length = length;
    //ack_count_dbg = shared_ack_cnt;
    // Dataflow ensures these execute as parallel RTL blocks on posedge clk
   
    request_side(length, vaddr, remote_qpn, remote_ip, r_key, psn, qp_conn, qp_interface, sq_meta);
    //response_side(iterations, ack, rx_axis, shared_ack_cnt);
}
