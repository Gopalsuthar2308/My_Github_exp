module test;
  reg[8*7:0]s;
  initial begin
    s="gopal";
    $display("string is = %s",s);
    #5 $finish;
  end
endmodule
