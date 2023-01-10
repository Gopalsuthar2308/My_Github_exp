
interface inte(input  PCLK,input PRST);
  logic WR_RD;
  logic [7:0] ADDR;
  logic [7:0] DATA;
  logic [7:0] PRDAT;
  logic PSEL, PWR,PEN,PRDY;
  logic[7:0] PADDR;
  logic [7:0] PWDAT;
  modport dut(input WR_RD , ADDR  , DATA ,output PSEL, PWR,PEN,PRDY,PADDR,PWDAT);
endinterface

