`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2026 01:02:34 PM
// Design Name: 
// Module Name: ack_counter
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


module ack_counter(
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_ack:m_ack:s_req:m_req, FREQ_HZ 100000000" *)
    
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
    input wire clk,
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
    input wire rst,

    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_ack TVALID" *)
    input wire s_ack_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_ack TDATA" *)
    input wire[511:0] s_ack_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_ack TREADY" *)
    output wire s_ack_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_ack TLAST" *)
    input wire s_ack_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_ack TKEEP" *)
    input wire[63:0] s_ack_tkeep,

    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_ack TVALID" *)
    output wire m_ack_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_ack TDATA" *)
    output wire[511:0] m_ack_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_ack TREADY" *)
    input wire m_ack_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_ack TKEEP" *)
    output wire[63:0] m_ack_tkeep,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_ack TLAST" *)
    output wire m_ack_tlast,
    
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req TVALID" *)
    input wire s_req_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req TDATA" *)
    input wire[247:0] s_req_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_req TREADY" *)
    output wire s_req_tready,

    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req TVALID" *)
    output wire m_req_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req TDATA" *)
    output wire[247:0] m_req_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_req TREADY" *)
    input wire m_req_tready,
    
    input wire [31:0] iterations,
    output reg [63:0] cycles,
    output reg [31:0] ack_psn,
    output reg [31:0] sq_metas
);
    
    reg run;

    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            run <= 0;
            cycles <= 0;
            ack_psn <= 0;
            sq_metas <= 0;
        end else begin
            if(run) begin
                cycles <= cycles + 1;
                if(s_ack_tvalid && s_ack_tready) begin
                    // the incoming frame is without MAC header, therefore PSN resides in octets 39...37
                    ack_psn[23:16] <= s_ack_tdata[303:296];
                    ack_psn[15:8] <= s_ack_tdata[311:304];
                    ack_psn[7:0] <= s_ack_tdata[319:312];    
                end
                if(s_req_tvalid && s_req_tready) begin
                    sq_metas <= sq_metas + 1;
                end
                if(ack_psn == (iterations + 1)) begin
                    run <= 0; 
                end
            end else begin
                if(s_req_tvalid && s_req_tready) begin
                    run <= 1;
                    ack_psn <= 0;
                    cycles <= 0;
                    sq_metas <= 1;
                end
            end
        end     
    end
    
    assign m_req_tvalid = s_req_tvalid;
    assign m_req_tdata  = s_req_tdata;
    assign s_req_tready = m_req_tready;
    
    assign m_ack_tvalid = s_ack_tvalid;
    assign m_ack_tdata  = s_ack_tdata;
    assign m_ack_tlast  = s_ack_tlast;
    assign m_ack_tkeep  = s_ack_tkeep;
    assign s_ack_tready = m_ack_tready;
endmodule
