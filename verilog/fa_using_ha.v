module full_add(a,b,c,sum,cout);
  input a,b,c;
  output sum,cout;
  wire s1,c1,c2;
  half_add hal1 (a,b,s1,c1);
  half_add hal2 (c,s1,sum,c2);
  assign cout = c1 | c2; //or g1(cout,c1,c2);

endmodule


module half_add(ha,hb,hs,hc);
  input ha,hb;
  output hs,hc;
  assign hs = ha ^ hb;
  assign hc = ha & hb;
endmodule


module full_add_tb;
reg a,b,c;
wire sum,cout;

full_add dut(a,b,c,sum,cout);

initial begin
  a=0;b=0;c=0;
  $monitor("a = %b  b = %b  c = %b sum = %b  cout = %b",a,b,c,sum,cout);
  #2
  a=0;b=0;c=0;
  #2
  a=0;b=0;c=1;
  #2
  a=0;b=1;c=0;
  #2
  a=0;b=1;c=1;
  #2
  a=1;b=0;c=0;
  #2
  a=1;b=0;c=1;
  #2
  a=1;b=1;c=0;
  #2
  a=1;b=1;c=1;
end

endmodule
