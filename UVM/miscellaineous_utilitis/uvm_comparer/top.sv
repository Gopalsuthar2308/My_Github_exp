`include "uvm_macros.svh"
import uvm_pkg::*;

`include "transaction.sv"
`include "test.sv"

module tb_top;
initial begin
  run_test("base_test");
end
endmodule
