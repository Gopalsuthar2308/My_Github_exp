//What is output of the code below:
/*program test;
class a;
  int i;
endclass
initial
begin
  a a1;
  a a2;
  a1 = new();
  a1.i = 10;
  a2 = a1;
  $display("(1) a1.i = %0d, a2.i = %0d\n", a1.i, a2.i);
  a1.i = 20;
  a2.i = 30;
  a2 = new a1;
  $display("(2) a1.i = %0d, a2.i = %0d\n", a1.i, a2.i);
end
endprogram*/

// Code your testbench here
// or browse Examples
/*class ABC;
  int x;
  task abc();
  for(x=0;x<4;x++)
  begin
    $display("X Value %0d",x);
  end
    $display("X1 Value %0d",x);
  endtask
  endclass:ABC
    module test;
    ABC a;
    initial begin
      a=new();
      a.abc();
    end
    endmodule*/



   class main;
       rand bit [7:0] a;
         constraint c1{ $countones(a) == 6;}
           constraint c2{foreach(a[i])
                             if(a[i]==0 && i>0)
                                                   a[i+1]==0;}
                                                 endclass

                                                 module test;
                                                 main m ;
                                                 initial begin
                                                     m = new() ;
                                                       repeat(10) begin
                                                           if ( m.randomize() ) begin
                                                                 $display("num = %0b",m.a);
                                                               end
                                                             end
                                                           end
                                                           endmodule
