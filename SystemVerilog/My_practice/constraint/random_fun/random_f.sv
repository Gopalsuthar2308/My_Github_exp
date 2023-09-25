module random;
  //bit[31:0]a,b;
  //bit a,b;

  initial
  begin
    repeat(10) begin 
     #10 a =$urandom();
     $display("a=%d",a);
     #10 b =$random();
     $display("b=%d",b);
    end
    #10 $finish;
  end

endmodule
