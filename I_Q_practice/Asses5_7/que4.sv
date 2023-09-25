//4.1 Write a class A having function which gives even numbers, write class EA which extends A having function which gives oddnumbers, create a object of class ea and access both methods.
//4.2 if base class A is not supposed to used to create an object, than how to do that?

class A;
  rand bit [3:0] num;

  //function void func(ref bit [3:0] num);
  function void even(ref bit [3:0] num);
    if(num%2==0)
      $display("even number = %0d",num);
  endfunction
endclass

class EA extends A;

  //function void func(ref bit [3:0] num);
  function void odd(ref bit [3:0] num);
    if(num%2!=0)
      $display("odd number = %0d",num);
    //else
      //super.func(num);
  endfunction
endclass

module test;
  EA ea;
  initial begin
    ea = new();
    repeat(10) begin
      void'(ea.randomize());
      ea.even(ea.num);
      ea.odd(ea.num);
    end
  end
endmodule
