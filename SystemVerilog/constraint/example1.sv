module tb;
class transaction;
  rand bit[3:0] array[];
  constraint c {array.size()==10;}
constraint C1 { foreach(array[i])
                    if(i%2==0)
                          array[i]%2 !=0;
                    else
                         array[i]%2 ==0;}
endclass

transaction e = new();
  initial begin
  void'( e.randomize());
   $display("array=%p",e.array);
  end
endmodule
