/*class real_value;
rand real value;
constraint c1{value inside{[2.99:3.99]};}
endclass

module test;
real_value r;
initial begin
  r=new();
  repeat(10) begin 
  if(!r.randomize())
    $error("failed randomization");
    else
      $display("value = %0.2f",r.value);
    end
  end
  endmodule*/



 /* class abc;
 rand bit [31:0] arr[];

 constraint c1{arr.size()==10;
 foreach(arr[i])
   arr[i] < 100;}
   constraint c2{foreach(arr[i])
   foreach(arr[j])
     if(i<j)
       arr[i] != arr[j];}
       //constraint c1{arr.size()==10;
       //             foreach(arr[i])
       //             arr[i] < 100;
       //           unique{arr};}

     endclass

     module test;
     abc g;
     initial begin
       g = new();
       repeat(10) begin
         g.randomize();
         $display("arr = %0p",g.arr);
       end
     end
     endmodule*/



    class abc;
      rand bit [3:0] value1;
      rand bit [3:0] value2;

      constraint c1 {value1 dist {1:=20,[2:5]:=80,6:=40}; }
      constraint c2 {value2 dist {[1:5]:/10,[6:8]:/80,10:/40}; }
    endclass

    module test;
    abc g;
    initial begin
      g = new();
      repeat(10) begin
        if(g.randomize()) begin
          $display("value1 = %0d and value2 = %0d",g.value1,g.value2);
        end
      end
    end
    endmodule












