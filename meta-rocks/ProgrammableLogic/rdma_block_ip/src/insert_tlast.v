`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2026 11:44:32 AM
// Design Name: 
// Module Name: insert_tlast
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


module insert_tlast#(D_WIDTH = 512)(
(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axis:m_axis, FREQ_HZ 100000000" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 nclk CLK" *)
input wire nclk, 

(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 nresetn RST" *)
input wire nresetn,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *)
input wire s_axis_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *)
input wire [D_WIDTH-1:0] s_axis_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *)
output wire  s_axis_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TKEEP" *)
input wire[63:0]  s_axis_tkeep,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *)
input wire  s_axis_tlast,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *)
output reg m_axis_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *)
output wire [D_WIDTH-1:0] m_axis_tdata,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *)
input wire  m_axis_tready,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TKEEP" *)
output reg[63:0]  m_axis_tkeep,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *)
output reg  m_axis_tlast,


// Note: This code only works for packet lengths multiples of 64 bytes (512 bits)

input wire [15:0] packet_length
    );
    reg[7:0] counter;
    wire[15:0] beats;
    assign beats = packet_length >> 6;
    always @(posedge nclk) begin
        if(!nresetn) begin
            counter <= 0;
            m_axis_tkeep <= {64{1'b1}};
            m_axis_tlast <= 0;
            m_axis_tvalid <= 1'b1;
            end
        else begin
            if(beats == 1) begin
                // packet size is exactly one beat
                m_axis_tlast <= 1'b1;
            end else begin
                if(m_axis_tvalid && m_axis_tready) begin
                    if(counter == (beats-1)) begin
                        counter <= 0;
                        m_axis_tlast <= 1'b0; 
                    end else begin
                        counter <= counter + 1;
                        
                        if (counter == (beats-2)) begin
                            m_axis_tlast <= 1'b1;
                        end else begin
                            m_axis_tlast <= 1'b0;
                        end
                    end
                end
            end
            end
        end
        

    assign m_axis_tdata = s_axis_tdata;
    assign s_axis_tready = m_axis_tready;
endmodule
