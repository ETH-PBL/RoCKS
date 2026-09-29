//`timescale 1ns / 1ps
/**
 * This file is part of the Coyote <https://github.com/fpgasystems/Coyote>
 *
 * MIT Licence
 * Copyright (c) 2021-2025, Systems Group, ETH Zurich
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
//`ifndef AXI_INTF_SV_
//`define AXI_INTF_SV_

// ----------------------------------------------------------------------------
// AXI4 stream 
// ----------------------------------------------------------------------------
interface AXI4S #(
	parameter AXI4S_DATA_BITS = 512
) (
    input logic aclk,
    input logic aresetn
);

typedef logic [AXI4S_DATA_BITS-1:0] data_t;
typedef logic [AXI4S_DATA_BITS/8-1:0] keep_t;

data_t          tdata;
keep_t  		tkeep;
logic           tlast;
logic           tready;
logic           tvalid;

// Tie off unused master signals
task tie_off_m ();
    tdata      = 0;
    tkeep      = 0;
    tlast     = 1'b0;
    tvalid     = 1'b0;
endtask

// Tie off unused slave signals
task tie_off_s ();
    tready     = 1'b0;
endtask

// Master
modport master (
	import tie_off_m,
	input tready,
	output tdata, tkeep, tlast, tvalid
);

// Slave
modport slave (
    import tie_off_s,
    input tdata, tkeep, tlast, tvalid,
    output tready
);

endinterface


/// ----------------------------------------------------------------------------
// Generic meta interface
// ----------------------------------------------------------------------------
interface metaIntf #(
	parameter type STYPE = logic[63:0]
) (
	input logic aclk,
    input logic aresetn
);


logic valid;
logic ready;
STYPE data;

task tie_off_s ();
	ready = 1'b1;
endtask

task tie_off_m ();
	data = 0;
	valid = 1'b0;
endtask

modport s (
	import tie_off_s,
	input  valid,
	output ready,
	input  data
);

modport m (
	import tie_off_m,
	output valid,
	input  ready,
	output data
);




endinterface


 
parameter integer DEST_BITS = 4;   
parameter integer OPCODE_BITS = 5;
parameter integer STRM_BITS = 2;
parameter integer PID_BITS = 6;
parameter integer VADDR_BITS = 48;
parameter integer LEN_BITS = 28;
parameter integer OFFS_BITS = 6;
parameter integer MEM_CMD_BITS = 96;
parameter integer PMTU_BYTES = 4096;
parameter integer N_OUTSTANDING = 8;
parameter integer AXI_DATA_BITS = 512;
parameter integer BEAT_LOG_BITS = $clog2(AXI_DATA_BITS/8);
parameter integer AXI_NET_BITS = 512;
parameter integer RDMA_QPN_BITS = 16;
typedef struct packed {
        logic [5-1:0] opcode; // One of the values of coyote::CoyoteOper
        logic [2-1:0] strm;     // One of STRM_CARD, STRM_HOST, STRM_TCP, or STRM_RDMA (this determines the where this request lands)
        logic remote;
        logic host;                     // Whether the corresponding request came from the corresponding vFPGA sq_* interface or a host-side invoke
        logic [DEST_BITS-1:0] dest;     // The index of the AXI stream that data arrives at/departs from
        logic [6-1:0] pid;
        logic [DEST_BITS-1:0] vfid;
        logic [32-5-2-2-DEST_BITS-6-DEST_BITS-1:0] rsrvd;
    } ack_t;
 typedef struct packed {
        ack_t ack;
        logic last;
    } dack_t;
    
   typedef struct packed {
        // Opcode
        logic [OPCODE_BITS-1:0] opcode; // One of the values of coyote::CoyoteOper
        logic [STRM_BITS-1:0] strm;     // One of STRM_CARD, STRM_HOST, STRM_TCP, or STRM_RDMA (this determines the where this request lands)
        logic mode;                     // In the STRM_RDMA case, controls whether to skip the request splitter in the dreq_rdma_parser_wr module
        logic rdma;
        logic remote;

        // ID
        logic [DEST_BITS-1:0] vfid; // rsrvd
        logic [PID_BITS-1:0] pid;
        logic [DEST_BITS-1:0] dest; // The index of the AXI stream that data arrives at/departs from

        // FLAGS
        logic last; // Only if last is high, the corresponding AXI stream will have a last signal at the end. Otherwise, the stream will end without a last signal, the checkCompleted counter will not be incremented and no acknowledgement will be sent on the corresponding cq_* interface

        // DESC
        logic [VADDR_BITS-1:0] vaddr;
        logic [LEN_BITS-1:0] len;

        // RSRVD
        logic actv; // rsrvd
        logic host; // rsrvd
        logic [OFFS_BITS-1:0] offs; // rsrvd

        logic [128-OFFS_BITS-2-VADDR_BITS-LEN_BITS-1-2*DEST_BITS-PID_BITS-3-STRM_BITS-OPCODE_BITS-1:0] rsrvd;
    } req_t;
    
   typedef struct packed {
        req_t req_1; // rd, local
        req_t req_2; // wr, remote
    } dreq_t; 
    function integer clog2s;
    input [31:0] v;
    reg [31:0] value;
    begin
        value = v;
        if (value == 1) begin
            clog2s = 1;
        end
        else begin
            value = value-1;
            for (clog2s=0; value>0; clog2s=clog2s+1)
                value = value>>1;
        end
    end
    endfunction
  
    parameter integer RC_RDMA_READ_RESP_FIRST = 5'hD;
    parameter integer RC_RDMA_READ_RESP_MIDDLE = 5'hE;
    parameter integer RC_RDMA_READ_RESP_LAST = 5'hF;
    parameter integer RC_RDMA_READ_RESP_ONLY = 5'h10;
    parameter integer RC_RDMA_READ_REQUEST = 5'hC;
    parameter integer RDMA_MEM_SHIFT = 27;

    function logic is_opcode_rd_resp;
    input [OPCODE_BITS-1:0] opcode;
    begin
        if (opcode == RC_RDMA_READ_RESP_FIRST ||
            opcode == RC_RDMA_READ_RESP_MIDDLE ||
            opcode == RC_RDMA_READ_RESP_LAST ||
            opcode == RC_RDMA_READ_RESP_ONLY) begin
            is_opcode_rd_resp = 1'b1;
        end
        else begin
            is_opcode_rd_resp = 1'b0;
        end
    end
    endfunction
    
    function logic is_opcode_rd_req;
    input [OPCODE_BITS-1:0] opcode;
    begin
        if (opcode == RC_RDMA_READ_REQUEST) begin
            is_opcode_rd_req = 1'b1;
        end
        else begin
            is_opcode_rd_req = 1'b0;
        end
    end
    endfunction