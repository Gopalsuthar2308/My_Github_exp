module tb;
class cccc;
  rand bit [2:0]a;
  constraint c1{a inside{4,6};}
  constraint c2{a dist{4:=4,6:=6};}
endclass


  cccc c=new();
  initial
    begin
      repeat(20) begin
      void'( c.randomize());
        $display(c.a);
       //#5ns;
      end
    end
endmodule
