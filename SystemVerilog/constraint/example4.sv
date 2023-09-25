module tb;
class multiple4;
  rand bit [7:0]a;

  constraint C1 {a[1:0]==0;}

endclass

multiple4 m =new();
  initial begin
   repeat(10)
      begin 
       void'( m.randomize());
       $display(m.a);
      // #10ns; 
      end
 
  end
endmodule  
