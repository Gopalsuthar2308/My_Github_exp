//write a  verilog  function which takes two 32 bot vector and returns integer value where return value is the number of bits that two vectors differ

class abc;
  bit [31:0] val1;
  bit [31:0] val2;

  function bit [31:0] func(ref bit [31:0] val1,bit [31:0] val2);

  endfunction
endclass

module test;
 abc g;
 initial begin
   g=new();
   repeat(20) begin
     void'(g.randomize());
       if(g.n <= g.arr.size())
          g.func(g.arr,g.n);
       end
   end
endmodule
