module formal_argument;
bit clk, q, r, en,valid;

always #5 clk = ~clk;

sequence seq(bit en);
  (q | r) & en;
endsequence

property prop(en,valid);
  @(posedge clk) valid |-> seq(en);
endproperty

logical_exp: assert property(prop(en,valid)) $info("assertion passed"); else $error("assertion failed");


initial begin
  // $dumpfile("dump.vcd");
  // $dumpvars;
      valid = 0; en=0;
      q = 0; r = 0;
  #10 q = 0; r = 1;
  #10 q = 1; r = 0;
  #10 q = 0; r = 1;

      valid = 1;
      q = 0; r = 0;
  #10 q = 0; r = 1;
  #10 q = 1; r = 0;
  #10 q = 0; r = 1;
  en = 1;
  #10 q = 1; r = 0;
  #10 q = 1; r = 1;
  #10; 
  $finish;
end

initial begin
  $dumpfile
  ("waveform.vcd");
  $dumpvars();
end
endmodule
