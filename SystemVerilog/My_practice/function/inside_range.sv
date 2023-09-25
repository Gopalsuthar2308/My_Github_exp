class ab;
  function void ex(int i);
    int arr[4] = '{3,6,9,13};
    int x;
    x=arr[i];
    $display("x = %0d",x);
  endfunction
endclass

module test;
  ab g;
  initial begin
    g=new();
    for(int i=0;i<4;i++)
      g.ex(i);
  end
endmodule
