class abc;
  rand bit [30:0] val;
  rand bit [31:0] parity_val;

  function void func(ref bit [30:0] val);
    bit parity=0;
    parity_val=val;
    foreach(val[i])
      parity ^= val[i];
      if(parity)
        parity_val[31]=1;

      foreach(val[i])
        $write("%0b",val[i]);
      $display("\n");
      foreach(parity_val[i])
        $write("%0b",parity_val[i]);
  endfunction
endclass
    
module test;
  abc g;
  initial begin
    g=new();
    void'(g.randomize());
    g.func(g.val);
  end
endmodule
