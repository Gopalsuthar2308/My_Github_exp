//3.1 write a function which has 4 integer input and return the sum of all 4 input.
//3.2 modify the function in Q1 such as function gives two output one is addition of first two input (1st and 2nd)and another output is addition of next two input (3rd and 4th).

/*class abc;
  int a,b,c,d;

  function int func(int a,b,c,d);
    int sum;
    int sum_op1;
    int sum_op2;
    $display("a = %0d, b = %0d, c =%0d, d = %0d",a,b,c,d);
    sum = a+b+c+d;
    sum_op1=a+b;
    sum_op2=c+d;
    $display("sum_op1 = %0d",sum_op1);
    $display("sum_op2 = %0d",sum_op2);
    return sum;
  endfunction
endclass

module test;
  abc g;
  initial begin
    g = new();
    $display("sum = %0d",g.func(3,5,7,9));
  end
endmodule*/



class abc;
  //int a,b,c,d;
  int sum_op1,sum_op2;
  function int func(int a,b,c,d,ref int sum_op1,sum_op2);
    int sum;
    $display("a = %0d, b = %0d, c =%0d, d = %0d",a,b,c,d);
    //sum = a+b+c+d;
    sum_op1=a+b;
    sum_op2=c+d;
   // $display("sum_op1 = %0d",sum_op1);
    //$display("sum_op2 = %0d",sum_op2);
    //return sum;
  endfunction
endclass

module test;
  abc g;
  //int sum_op1,sum_op2;
  initial begin
    g = new();
    //$display("sum = %0d",g.func(3,5,7,9));
    g.func(3,5,7,9,g.sum_op1,g.sum_op2);
    $display("sum_op1 = %0d sum_op2 = %0d",g.sum_op1,g.sum_op2);
  end
endmodule
