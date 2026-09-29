`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2026 01:59:06 PM
// Design Name: 
// Module Name: BRAM_buffer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BRAM_buffer(
(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axis_ddr:m_axis_ddr, FREQ_HZ 100000000" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 nclk CLK" *)
input wire nclk, 

(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 nresetn RST" *)
input wire nresetn,
                                
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TVALID" *)
input wire s_axis_ddr_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TDATA" *)
input wire [511:0] s_axis_ddr_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TREADY" *)
output reg s_axis_ddr_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TLAST" *)
input wire s_axis_ddr_tlast,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_ddr TKEEP" *)
input wire [63:0] s_axis_ddr_tkeep,

                                 
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TVALID" *)
output reg m_axis_ddr_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TDATA" *)
output reg [511:0] m_axis_ddr_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TREADY" *)
input wire m_axis_ddr_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TLAST" *)
output reg m_axis_ddr_tlast,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_ddr TKEEP" *)
output reg [63:0] m_axis_ddr_tkeep,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_ddr_wr TVALID" *)
input wire s_req_ddr_wr_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_ddr_wr TDATA" *)
input wire [95:0] s_req_ddr_wr_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_ddr_wr TREADY" *)
output reg s_req_ddr_wr_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_ddr_rd TVALID" *)
input wire s_req_ddr_rd_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_ddr_rd TDATA" *)
input wire[95:0] s_req_ddr_rd_tdata,

(*X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req_ddr_rd TREADY" *)
output reg s_req_ddr_rd_tready,

output reg [6:0] counter_dbg,
input wire [15:0] packet_length



    );
   // --- Parameters and Internal Signals ---
    localparam DEPTH = 1024;
    localparam IDLE  = 1'b0;
    localparam BUSY  = 1'b1;

    reg [9:0] wr_base, rd_base;
    reg [6:0] wr_count, rd_count;
    reg       wr_state, rd_state;
    reg       rd_valid_pipe; // To handle BRAM latency
    wire[15:0] beats;

    // Addressing math (Word Addressed)
    wire [9:0] write_addr = wr_base + wr_count;
    wire [9:0] read_addr  = rd_base + rd_count;
    
    assign counter_dbg = {1'b0, wr_count};
    assign s_axis_ddr_tready = (wr_state == BUSY);
    assign beats = packet_length >> 6;


    wire [511:0] bram_dout;

    blk_mem_gen_0 bram_inst (
        .clka(nclk),
        .ena(1'b1),
        .wea(wr_state == BUSY && s_axis_ddr_tvalid),
        .addra(write_addr),
        .dina(s_axis_ddr_tdata),
        
        .clkb(nclk),
        .enb(1'b1),
        .addrb(read_addr),
        .doutb(bram_dout)
    );

    always @(posedge nclk) begin
        if (!nresetn) begin
            wr_state <= IDLE;
            wr_count <= 0;
            wr_base  <= 0;
            s_req_ddr_wr_tready <= 1'b1;
        end else begin
            case (wr_state)
                IDLE: begin
                    if (s_req_ddr_wr_tvalid) begin
                        wr_state <= BUSY;
                        s_req_ddr_wr_tready <= 1'b0;
                        wr_count <= 0;
                    end
                end
                BUSY: begin
                    if (s_axis_ddr_tvalid && s_axis_ddr_tready) begin
                        if (wr_count == (beats-1)) begin
                            wr_state <= IDLE;
                            s_req_ddr_wr_tready <= 1'b1;
                            wr_base  <= wr_base + beats; 
                        end else begin
                            wr_count <= wr_count + 1;
                        end
                    end
                end
            endcase
        end
    end

    always @(posedge nclk) begin
        if (!nresetn) begin
            rd_state <= IDLE;
            rd_count <= 0;
            rd_base  <= 0;
            s_req_ddr_rd_tready <= 1'b1;
            rd_valid_pipe <= 1'b0;
        end else begin
            case (rd_state)
                IDLE: begin
                    if (s_req_ddr_rd_tvalid) begin
                        rd_state <= BUSY;
                        s_req_ddr_rd_tready <= 1'b0;
                    end
                end
                BUSY: begin
                    if (m_axis_ddr_tready) begin              
                        if(rd_count == (beats-1)) begin
                            rd_state <= IDLE;
                            s_req_ddr_rd_tready <= 1'b1;
                            rd_base  <= rd_base + beats; 
                            rd_count <= 0;
                        end
                        else 
                        rd_count <= rd_count + 1;        
                    end
                end
            endcase
            
            //rd_valid_pipe <= (rd_state == BUSY);
        end
    end

    // --- Output Assignments ---
    always @(*) begin
        m_axis_ddr_tvalid = (rd_state == BUSY);
        m_axis_ddr_tdata  = bram_dout;
        m_axis_ddr_tkeep  = {64{1'b1}}; 
        m_axis_ddr_tlast = (rd_count == beats-1);
    end

endmodule
