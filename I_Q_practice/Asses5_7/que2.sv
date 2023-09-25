class base;
  local int val;

  function void func(int val1);
    this.val=val1;
    $display("val = %0d",val);
  endfunction
endclass

module test;
  base g;
  int val1;
  initial begin
    g=new();
    val1=10;
    g.func(val1);
  end
endmodule
