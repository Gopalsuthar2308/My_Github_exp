/*class abc;
 rand bit [4:0] num;
 rand int pw2;

  constraint c1{pw2 == num**2;}
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(10) begin
      void'(g.randomize());
      $display("num = %0d power of 2 = %0d",g.num,g.pw2);
    end
  end
endmodule*/



class abc;
  rand bit [31:0] num;
  rand bit [31:0] val;
  
  constraint c1{num == func(val);}

  function bit [31:0] func(bit [31:0] val);
    int count=0;
    foreach(val[i]) begin
      if(val[i]==1)
        count=count+1;
      if(count > 10)
        val[i]=0;
    end
    return val;
  endfunction
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(10) begin
      void'(g.randomize());
      $display("num = %0d num = %b",g.num,g.num);
    end
  end
endmodule


/*class abc;
  randc int a;
  randc int b;
  rand int b1;
  real c;
  rand int d[];

  constraint c1{a inside {[1:20]};
                b inside {[1:10]};}
  //constraint c2 {b1 inside {[0:500]}}
  constraint c3{d.size()==a;}

  function void post_randomize();
    c = real'(b)/2.0;
  endfunction
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(10) begin
      void'(g.randomize());
      $display("a = %0d b = %0d c = %0f d size = %0d",g.a,g.b,g.c,g.d.size());
    end
  end
endmodule*/



/*class abc;
  rand int a[3][3];

  constraint c1{foreach(a[i,j])
                  a[i][j] inside {[1:100]};}
  constraint c2{foreach(a[i])
                  a[i].sum()==100;}
endclass

module test;
  abc g;
  initial begin
    g=new();
    void'(g.randomize());
    $display("a = %0p",g.a);
  end
endmodule*/
