module tb;
class transaction;
  rand bit[7:0] data;

  constraint C1 { data inside{[150:250]};}
 // constraint C2 {data >149 && data<251;}
endclass

transaction t = new();
  initial begin
       repeat(10)
        begin
         void'( t.randomize());
         // #10ns;
          $display("data=%d",t.data);
        end
  end
endmodule
