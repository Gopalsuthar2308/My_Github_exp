import uvm_pkg::*;
`include "uvm_macros.svh"
`include "APB_INT.sv"
`include "APB_DUT.sv"
`include "APB_SEQITEM.sv"
`include "APB_SEQR.sv"
`include "APB_SEQ.sv"
`include "APB_DRV.sv"
`include "APB_MON1.sv"
`include "APB_MON2.sv"
`include "APB_AGE1.sv"
`include "APB_AGE2.sv"
`include "APB_SB.sv"
`include "APB_ENV.sv"
`include "APB_TEST.sv"
`include "APB_TEST1.sv"
`include "APB_TEST2.sv"
`include "APB_TEST3.sv"
`include "APB_TEST4.sv"
`include "APB_ASSER.sv"


module apbtb();
bit PCLK,PRST;
inte intf(PCLK,PRST);
APBDUT INI( .PCLK(intf.PCLK),.PRST(intf.PRST),.WR_RD(intf.WR_RD),.ADDR(intf.ADDR),.DATA(intf.DATA),.PRDAT(intf.PRDAT),.PSEL(intf.PSEL),.PWR(intf.PWR),.PEN(intf.PEN),.PRDY(intf.PRDY),.PADDR(intf.PADDR),.PWDAT(intf.PWDAT));
always #2 PCLK=~PCLK;

initial begin
  PRST=1; 
  #4
  PRST=0; 
end

initial
begin
  uvm_config_db #(virtual inte)::set(uvm_root::get(),"*","intf",intf);
  //run_test("test");
  //run_test("test1");
  //run_test("test2");
  //run_test("test3");
  run_test("test4");
end
assertion a1(intf);
endmodule
//
////vlog +incdir+C:/questasim_10.4e/verilog_src/uvm-1.1d/src +incdir+C:/questasim_10.4e/verilog_src/uvm-1.1d/src C:/questasim_10.4e/verilog_src/uvm-1.1d/src/uvm.sv +incdir+. UVM_TOP.sv +define+UVM_NO_DPI
