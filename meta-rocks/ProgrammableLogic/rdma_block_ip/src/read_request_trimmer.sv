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

// Simple module that trims a read request to size as they are zero-padded straight outta HLS 

module read_request_trimmer(
    // Incoming clock and reset 
    input logic nclk, 
    input logic nresetn, 
    
    input logic s_axis_tvalid,
    input logic [511:0] s_axis_tdata,
    input logic s_axis_tlast,
    input logic [63:0] s_axis_tkeep,
    output logic s_axis_tready,
    
    output logic m_axis_tvalid,
    output logic[511:0] m_axis_tdata,
    output logic m_axis_tlast,
    output logic[63:0] m_axis_tkeep,
    input logic m_axis_tready
    
);
    // AXI-Stream interfaces for network streams
    AXI4S input_stream(.aclk(nclk), .aresetn(nresetn));
    assign input_stream.tvalid = s_axis_tvalid;
    assign input_stream.tdata = s_axis_tdata;
    assign input_stream.tlast = s_axis_tlast;
    assign input_stream.tkeep = s_axis_tkeep;
    assign s_axis_tready = input_stream.tready;
    AXI4S output_stream(.aclk(nclk), .aresetn(nresetn));
    assign m_axis_tvalid = output_stream.tvalid;
    assign m_axis_tdata = output_stream.tdata;
    assign m_axis_tlast = output_stream.tlast;
    assign m_axis_tkeep = output_stream.tkeep;
    assign output_stream.tready = m_axis_tready;
    // Direct assignment between input and output: 
    // - In case of a READ REQUEST, shorten the first beat and eliminate the second 
    // - For identifying the second beat, we need some simple state-holding in synchronous logic 
    logic is_read_request_first_beat;
    logic is_read_request_second_beat;

    assign is_read_request_first_beat = input_stream.tvalid && (input_stream.tdata[15:0] == 16'h0245) && (input_stream.tdata[231:224] == 8'h0c);

    assign input_stream.tready = output_stream.tready;

    assign output_stream.tvalid = is_read_request_second_beat ? 1'b0 : input_stream.tvalid;

    assign output_stream.tlast = is_read_request_first_beat ? 1'b1 : (is_read_request_second_beat ? 1'b0 : input_stream.tlast);

    assign output_stream.tdata[447:0] = is_read_request_second_beat ? 448'h0 : input_stream.tdata[447:0];
    assign output_stream.tdata[511:448] = (is_read_request_second_beat || is_read_request_first_beat) ? 64'h0 : input_stream.tdata[511:448];

    assign output_stream.tkeep = is_read_request_first_beat ? 64'h00ffffffffffffff : (is_read_request_second_beat ? 64'h0 : input_stream.tkeep);

    // Synchronous logic for state-holding
    always_ff @(posedge nclk) begin 
        if(!nresetn) begin 
            is_read_request_second_beat <= 1'b0;
        end else begin 
            if(!is_read_request_second_beat) begin 
                if(is_read_request_first_beat) begin 
                    is_read_request_second_beat <= 1'b1; // Set the state if the first beat is present 
                end else begin 
                    is_read_request_second_beat <= 1'b0; // Reset the state if the first beat is not present
                end 
            end else begin 
                if(input_stream.tvalid && input_stream.tlast && output_stream.tready) begin 
                    is_read_request_second_beat <= 1'b0; // Reset the state if the second beat has passed 
                end else begin 
                    is_read_request_second_beat <= 1'b1; // Keep the state if the second beat has not passed 
                end 
            end 
        end
    end

endmodule 