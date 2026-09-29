module pulse_stretcher #(
  parameter int unsigned STRETCH_CYCLES = 16  // >=2, power-of-two
) (
  input  logic clk,
  input  logic rst_ni,        // active-low reset
  input  logic signal_in,     // synchronous to clk
  output logic signal_out
);

  logic [$clog2(STRETCH_CYCLES)-1:0]    cnt_q,   cnt_d;
  logic out_d, out_q;

  always_comb begin
    cnt_d  = cnt_q;
    if (cnt_q == '0) begin
      if (signal_in) begin
        cnt_d  = STRETCH_CYCLES - 1;
      end
    end else begin
      cnt_d  = cnt_q - 1'b1;
    end

    out_d = (cnt_q != '0) || signal_in;

  end

  always_ff @(posedge clk or negedge rst_ni) begin
    if (!rst_ni) begin
        cnt_q  <= '0;
        out_q  <= 1'b0;
    end else begin
        cnt_q  <= cnt_d;
        out_q  <= out_d;
    end
  end

  assign signal_out = out_q;

endmodule
