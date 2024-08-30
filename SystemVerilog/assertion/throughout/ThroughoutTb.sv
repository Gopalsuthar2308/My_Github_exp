`include "Throughout.sv"

module ThroughoutTb;

  logic clk, resetn;
  logic valid,ready;
  
  Throughout intf(.clk(clk),
                  .resetn(resetn),
                  .valid(valid),
                  .ready(ready)
                 );

  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  
  initial begin
    Driving_validValueIsHighAndThenStable_Until_readyAsserted_Expect_AssertionPass();
  end

  // Assertion should pass
  task Driving_validValueIsHighAndThenStable_Until_readyAsserted_Expect_AssertionPass();
    $display("test1 started execution",$time);
    resetn = 1;
    #5;
    valid = 'x;
    ready = 'x;
    #10;
    valid = '0;
    ready = '0;
    #10;
    valid = '1;
    #30;
    ready = '1;
    #50;
    $display("test1 ended execution",$time);
    $finish;
  endtask
  
endmodule
