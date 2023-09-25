//Constraint for the array[100] to generate the values in the range of 1 to 50.
//For the above question, I want values 10 and 20 in between.

/*class abc;
  rand int arr[100];

  constraint c1{foreach(arr[i])
                  arr[i] inside {[1:50]};}
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(2) begin
      //void'(g.randomize() with {foreach(arr[i])
      //                            arr[i] inside {[10:20]};});
      void'(g.randomize() with {foreach(arr[i])
                                  arr[i] inside {10,20};});
      $display("arr = %0p",g.arr);
    end
  end
endmodule*/



//Construct dynamic array with 10 elements initially. Now I want to increase its
//size by ‘1’ without loss of previous array

/*module test;
 int arr[] = {2,3,4,12,6,8,9,10,1,5};
 initial begin
    $display("arr size = %0d arr = %0p",arr.size(),arr);
    //arr=new[11](arr);
    arr=new[arr.size()+1](arr);
    arr[10]=50;
    $display("after new size arr size = %0d arr = %0p",arr.size(),arr);
  end
endmodule*/




//How to write a checker comparison in testbench(verilog ) for state machine encoded pattern 1011?
//please take clk , reset, d_in (one bit) and op (one bit ) as output


