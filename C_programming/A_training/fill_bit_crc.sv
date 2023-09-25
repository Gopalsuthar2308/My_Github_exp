// A function to compute the 1 bit CRC for an 31 bit integer by doing XOR of the 31 bits and fill it in the 32'nd bit

class crc;
  rand bit [30:0] data;
  rand bit [1:0] div;
  bit crc_val;
  int data_len = $size(data);
  int N = $size(div);
  bit [31:0] data_c;
  
  function void func(ref bit [30:0] data);
    foreach(data_c[i]) begin
        data_c[i+1]=data[i];
    end
    $display("data_len = %0d data_c len = %0d div len N = %0d",data_len,$size(data_c),N);
    $display("data = %b div = %0b \n data_c = %b",data,div,data_c);
  endfunction
endclass

module test;
  crc g;
  initial begin
    g=new();
    void'(g.randomize());
    g.func(g.data);
  end
endmodule
