//1. Given the following class, create a method in an extended class ExtBinary the multiplies val1 and val2 and returns an integer.

class Binary;
  rand bit [3:0] val1,val2;

  function new(input bit [3:0] val1,val2);
    this.val1 = val1;
    this.val2 = val2;
  endfunction

  virtual function void print_int(input int val);
    $display("val = %0d",val);
  endfunction
endclass

class ExtBinary extends Binary;

  constraint c1{val1<10;
                val2<10;}
  function new(input bit [3:0] val1,val2);
    super.new(val1,val2);
  endfunction

  function int multiple();
    int mul;
    mul = val1*val2;
    $display("val1 = %0d, val2 = %0d",val1,val2);
    super.print_int(mul);
  endfunction
endclass

module test;
  Binary g;
  ExtBinary exg;
  initial begin
    exg = new(15,8);
    exg.multiple();
    repeat(5) begin
      void'(exg.randomize());
      exg.multiple();
    end
  end
endmodule
