//1.There is a 8 bit variable. Write constraint to generate min 2 -1's and Max 5-1's in that variable.
/*class abc;
  rand bit [7:0] val;

  constraint c1{$countones(val)>=2;
                $countones(val)<=5;}
  //function void post_randomize();
  //  int count;
  //  foreach(val[i])
  //    if(val[i]==1)
  //      count++;
  //  if(count<2 || count>5)
  //    val=10100110;
  //endfunction
endclass;

module test;
  abc g;
  initial begin
    g=new();
    repeat(10) begin
      void'(g.randomize());
      $display("val = %b",g.val);
    end
  end
endmodule*/

//2. There are 3 variables a,b and c. Write assertion to check all assert at a time and all de-assert at a time.
/*
property p;
  @(posedge clk) (a & b & c);
endproperty

property p;
  @(posedge clk) (!a & !b & !c);
endproperty*/

//3. Come up with all the combinations of coverage for a 32-bit addr, data and Wr,Rd signals.


//4. We have an 8 bit variable, we need to swap bit 5 and bit 2 of that variable. What kind of logic you can code in C and SV?

/*class abc;
  randc bit [7:0] val;

  function void func(ref bit [7:0] val);
    bit temp;
    $display("befor swaping val = %b",val);
    //foreach(val[i]) begin
    //  if(i==1)
    //    temp=val[i];
    //    if(i==4) begin
    //      val[1]=val[i];
    //      val[i]=temp;
    //    end
    //end
    temp=val[1];
    val[1]=val[4];
    val[4]=temp;
    $display("after swaping val = %b\n",val);
  endfunction
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(10) begin
      void'(g.randomize());
      g.func(g.val);
    end
  end
endmodule*/

//5. There is a 8 bit variable. Write constraint to generate min 3 -1's and Max 6-1's in that variable.
class abc;
  randc bit [7:0] val;

  //constraint c1{$countones(val)>=3;
  //              $countones(val)<=6;}

  function void post_randomize();
    int count;
    foreach(val[i])
      if(val[i]==1)
        count++;
    if(count<3 || count>6)
      val=10100110;
  endfunction
endclass;

module test;
  abc g;
  initial begin
    g=new();
    repeat(20) begin
      void'(g.randomize());
      $display("val = %b",g.val);
    end
  end
endmodule

//6. There is address decoder issue in DUT, writes and reads to address 4 are been happening with addr 8. How will you catch this bug?
