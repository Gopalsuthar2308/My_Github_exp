/*class abc;
  randc int num;
  real val;
  constraint c1{num inside {[990:1000]};}
  //constraint c2{unique {num};}

  function void post_randomize();
    val = num/10.0;
  endfunction
endclass

module test;
  abc g=new();
  initial begin
    repeat(10) begin
      void'(g.randomize());
      $display("val = %0.2f",g.val);
      //$display("num = %0d",g.num);
    end
  end
endmodule*/



/*class abc;
  rand bit [6:0] a,b;
  constraint c{a != b;}
  constraint c1{$countones(a) == 5;}
endclass

module test;
  abc g = new();
  initial begin
    repeat(5) begin
      void'(g.randomize());
      $display("a = [%0d] - %0b b = [%0d] - %0b", g.a,g.a,g.b,g.b);
    end
  end
endmodule*/



class abc;
  rand bit [3:0]a;
  int q[$];
  constraint c1{!(a inside {q});}

  function void post_randomize();
    $display("a = %0d",a);
    q.push_back(a);
    if(q.size == 6)
      q.pop_front();
  endfunction
endclass

module test;
  abc g = new();
  initial begin
    repeat(20) begin
      void'(g.randomize());
      //$display("a = %0d",g.a);
    end
  end
  endmodule
