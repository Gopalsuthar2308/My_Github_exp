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



/*module tb;
initial begin
  $display("Main thread");
  fork
    print(20,"thread 1 a");
    print(30,"thread 1 b");
    print(10,"thread 2");
  join_any
  $display("Main thread finished");
end
task automatic print(int _time,string name);
  #(_time)$display("[%t] %s",$time,name);
endtask
endmodule*/
















