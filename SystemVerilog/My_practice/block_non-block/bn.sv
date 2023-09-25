module bn;
 int a,b,c;

 initial begin
   a=3;
   b=4;
   c=5;

   a<=b;
   c<=b;
   $display("a=%0d b=%0d c=%0d",a,b,c);
   //$monitor("a=%0d b=%0d c=%0d",a,b,c);
 end
endmodule
