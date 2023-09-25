module tb;
class unique1;
  rand bit [7:0]a[5];
  rand bit [7:0]b[5];
  constraint C1 {foreach(a[i])
    foreach (a[j])
      if(i!=j)
        a[i]!=a[j];}
  
  constraint C2 {unique{b};}
endclass

 unique1 u =new();
  initial begin
  void'(u.randomize());
  $display("a=%p",u.a);
  $display("b=%p",u.b);
 
  end
endmodule  
