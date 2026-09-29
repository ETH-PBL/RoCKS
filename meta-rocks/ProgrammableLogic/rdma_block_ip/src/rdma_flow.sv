/**
 * This file is part of the Coyote <https://github.com/fpgasystems/Coyote>
 *
 * MIT Licence
 * Copyright (c) 2025, Systems Group, ETH Zurich
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:

 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */


module rdma_flow (
   // metaIntf.s                  s_req,
    input logic s_req_tvalid,
    input logic [247:0] s_req_tdata,
    output logic s_req_tready,
    
    output logic m_req_tvalid,
    output logic [247:0] m_req_tdata,
    input logic m_req_tready,
    //metaIntf.m                  m_req,

    //metaIntf.s                  s_ack,
    input logic s_ack_tvalid,
    input logic [63:0] s_ack_tdata,
    output logic s_ack_tready,
    
    //metaIntf.m                  m_ack,
    output logic m_ack_tvalid,
    output logic[55:0] m_ack_tdata,
    input logic m_ack_tready,

    input  logic                aclk,
    input  logic                aresetn
);
metaIntf #(.STYPE(dreq_t)) s_req (.aclk(aclk), .aresetn(aresetn));
assign s_req.valid = s_req_tvalid;
assign s_req.data = s_req_tdata;
assign s_req_tready = s_req.ready;

metaIntf #(.STYPE(dreq_t)) m_req (.aclk(nclk), .aresetn(nresetn));
assign m_req_tvalid = m_req.valid;
assign m_req_tdata = m_req.data;
assign m_req.ready = m_req_tready;

metaIntf #(.STYPE(dack_t)) s_ack (.aclk(nclk), .aresetn(nresetn));
assign s_ack.valid = s_ack_tvalid;
assign s_ack.data.ack.opcode = s_ack_tdata[0 +:OPCODE_BITS];
assign s_ack.data.ack.remote = 1'b1;
assign s_ack.data.ack.pid = s_ack_tdata[32+:PID_BITS];
assign s_ack.data.ack.vfid = s_ack_tdata[32+PID_BITS +: DEST_BITS];
assign s_ack.data.ack.host = s_ack_tdata[32 + RDMA_QPN_BITS +: 1];
assign s_ack.data.ack.dest = s_ack_tdata[32+RDMA_QPN_BITS+1+:DEST_BITS];
assign s_ack.data.ack.strm = s_ack_tdata[32+RDMA_QPN_BITS+1+DEST_BITS+:STRM_BITS];
assign s_ack.data.ack.rsrvd = 0;
assign s_ack.data.last = s_ack_tdata[32+RDMA_QPN_BITS+1+DEST_BITS+STRM_BITS+:1];

logic [7:0] s_ack_count;
assign s_ack_count = s_ack_tdata[56+:8];

assign s_ack_tready = s_ack.ready;

metaIntf #(.STYPE(dack_t)) m_ack (.aclk(nclk), .aresetn(nresetn));
assign m_ack_tvalid = m_ack.valid ;
assign m_ack_tdata = m_ack.data;
assign m_ack.ready = m_ack_tready;

localparam integer RDMA_N_OST = 8; // number of outstanding packets
localparam integer RDMA_OST_BITS = $clog2(RDMA_N_OST);
localparam integer RD_OP = 0;
localparam integer WR_OP = 1;

// -- FSM
typedef enum logic[2:0]  {ST_IDLE, ST_ACK_LUP_WAIT, ST_REQ_LUP_WAIT, ST_ACK_LUP, ST_REQ_LUP} state_t;
logic [2:0] state_C, state_N;
logic [1+1+PID_BITS-1:0] addr_C, addr_N;

logic [1:0] ssn_wr;
logic [1+1+PID_BITS-1:0] ssn_addr;
logic [15:0] ssn_in;
logic [15:0] ssn_out;

metaIntf #(.STYPE(ack_t)) ack_que_in (.*);
metaIntf #(.STYPE(dreq_t)) req_out (.*);

logic [RDMA_OST_BITS-1:0] tail, tail_next;
logic [RDMA_OST_BITS-1:0] head, head_next;
logic issued, issued_next;
logic [7:0] count_C, count_N;


// Pointer table
ram_sp_nc #(
    .ADDR_BITS(1+1+PID_BITS),
    .DATA_BITS(16)
) inst_pntr_table (
    .clk(aclk),
    .a_en(1'b1),
    .a_we(ssn_wr),
    .a_addr(ssn_addr),
    .a_data_in(ssn_in),
    .a_data_out(ssn_out)
);

// REG
always_ff @(posedge aclk) begin: PROC_REG
    if (aresetn == 1'b0) begin
        state_C <= ST_IDLE;
        addr_C <= 'X;
        count_C <= 0;
    end
    else begin
        state_C <= state_N;
        addr_C <= addr_N;
        count_C <= count_N;
    end
end

// NSL
always_comb begin: NSL
	state_N = state_C;

	case(state_C)
		ST_IDLE: 
			state_N = (s_ack.valid) ? ST_ACK_LUP_WAIT : (s_req.valid & req_out.ready ? ST_REQ_LUP_WAIT : ST_IDLE);

        ST_ACK_LUP_WAIT:
            state_N = ST_ACK_LUP;

        ST_REQ_LUP_WAIT:
            state_N = ST_REQ_LUP;

        ST_REQ_LUP:
            state_N = ST_IDLE;

        ST_ACK_LUP:
            state_N = ST_IDLE;

	endcase // state_C
end

// DP
assign ssn_in = {7'h00, issued_next, head_next, tail_next};
assign issued = ssn_out[2*RDMA_OST_BITS];
assign head = ssn_out[RDMA_OST_BITS+:RDMA_OST_BITS];
assign tail = ssn_out[0+:RDMA_OST_BITS];

always_comb begin: DP
    addr_N = addr_C;
    count_N = count_C;

    // ACKs
    s_ack.ready = 1'b0;

    ack_que_in.valid = 1'b0;
    ack_que_in.data = s_ack.data.ack;

    // Req
    s_req.ready = 1'b0;
    req_out.valid = 1'b0;
    req_out.data = s_req.data;
    req_out.data.req_1.offs = head;

    // Table
    ssn_wr = 0;
    ssn_addr = 0;

    // Pointers
    head_next = 0;
    tail_next = 0;
    issued_next = 0;

    case(state_C)
        ST_IDLE: begin
            if(s_ack.valid) begin
                s_ack.ready = 1'b1;
                ack_que_in.valid = s_ack.data.last;
                count_N = s_ack_count;

                ssn_addr = {is_opcode_rd_resp(s_ack.data.ack.opcode), s_ack.data.ack.vfid[1-1:0], s_ack.data.ack.pid};
                addr_N = ssn_addr;
            end
            else if(s_req.valid & req_out.ready) begin
                ssn_addr = {is_opcode_rd_req(s_req.data.req_1.opcode), s_req.data.req_1.vfid[1-1:0], s_req.data.req_1.pid};
                addr_N = ssn_addr;
            end
        end

        ST_ACK_LUP: begin
            head_next = head;
            tail_next = tail + count_C;
            if(head == tail_next)
                issued_next = 1'b0;
            else
                issued_next = issued;

            ssn_wr = ~0;
            ssn_addr = addr_C;
        end

        ST_REQ_LUP: begin
            if(!issued || (head != tail)) begin
                req_out.valid = 1'b1;
                s_req.ready = 1'b1;       

                head_next = head + 1;
                tail_next = tail;
                issued_next = 1'b1;

                ssn_wr = ~0;
                ssn_addr = addr_C;
            end
        end

    endcase

end

// ACK queue
queue_meta #(
    .QDEPTH(RDMA_N_OST)
) inst_cq (
    .aclk(aclk),
    .aresetn(aresetn),
    .s_meta(ack_que_in),
    .m_meta(m_ack)
);

// REQ queue
queue_meta #(
    .QDEPTH(RDMA_N_OST)
) inst_sq (
    .aclk(aclk),
    .aresetn(aresetn),
    .s_meta(req_out),
    .m_meta(m_req)
);

endmodule
