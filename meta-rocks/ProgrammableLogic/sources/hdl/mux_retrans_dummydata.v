/*
 * Copyright (C) 2026 ETH Zurich
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the GPL-3.0 license.  See the LICENSE file for details.
 */

`timescale 1ns / 1ps

module mux_retrans_dummydata#(ITERATIONS=64)(
(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF m_axis_user_req, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 10000" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 nclk CLK" *)
input wire nclk, 

(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 nresetn RST" *)
input wire nresetn,
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_user_req TVALID" *)
output reg m_axis_user_req_tvalid,

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_user_req TDATA" *)
output reg [1023:0] m_axis_user_req_tdata,

//(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_user_req TREADY" *)
//input wire m_axis_user_req_tready,

//(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_user_req TLAST" *)
//output reg m_axis_user_req_tlast,

//(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_user_req TKEEP" *)
//output reg [255:0] m_axis_user_req_tkeep
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_user_req TUSER" *)
output reg [3:0] m_axis_user_req_tuser

    );
    reg[7:0] counter;
    always @(posedge nclk) begin
        if(!nresetn) begin
            counter                <= 0;
            m_axis_user_req_tvalid <= 1'b1;
            //m_axis_user_req_tlast  <= 1'b0;
            m_axis_user_req_tdata  <= {1024{1'b1}};
            //m_axis_user_req_tkeep  <= {256{1'b1}};
            
            m_axis_user_req_tuser = 4'b1111;
        end else begin
            if(m_axis_user_req_tvalid ) begin
                if(counter == 31) begin
                    counter <= 0;
                    //m_axis_user_req_tlast <= 1'b0; 
                end else begin
                    counter <= counter + 1;
                    
                    if (counter == 30) begin
                       // m_axis_user_req_tlast <= 1'b1;
                    end else begin
                       // m_axis_user_req_tlast <= 1'b0;
                    end
                end
            end
        end
    end
   
endmodule
