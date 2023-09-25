// A function that computes the remainder given two numbers 'a' and 'b' i.e. a mod b by repeated subtraction.

class abc;
  rand bit [4:0] a;
  rand bit [4:0] b;

  function func(int a,int b);
    $display("a = %0d, b = %0d",a,b);
    while(a>=b) begin
      a=a-b;
    end
    $display("reminder = %d",a);
  endfunction
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(10) begin
      void'(g.randomize());
      if(g.a>=g.b)
        g.func(g.a,g.b);
    end
  end
endmodule

/*module test;
  function void two(int a,b);
    $display("a=%0d,b=%0d",a,b);
      while (a>=b) begin
        a=a-b;
      end
      $display("remainder is %0d",a);
  endfunction

  initial begin
    two(67,13);
  end
endmodule*/
