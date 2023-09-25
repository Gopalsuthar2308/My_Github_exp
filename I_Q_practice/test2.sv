/*class Main;
  rand bit [2:0] index;
  rand bit[7:0] num;
  constraint c1{ index < 7;
  num == (3 << index);}
endclass

module test;
Main m ;
initial begin
  m = new() ;
  repeat(10) begin
    if ( m.randomize() ) begin
      $display("num = %0d, index = %0d, and num = %b",m.num,m.index,m.num);
    end
  end
end
endmodule*/




/*class Main;
  //rand bit [2:0] index;
  rand bit[7:0] num;
  //constraint c1{ index < 7;
  //num == (3 << index);}
  constraint c1{$countones(num)==2;}
  constraint c2{foreach(num[i])
                  if(i>0 && num[i]==1)
                    num[i-1]==1;}
endclass

module test;
Main m ;
initial begin
  m = new() ;
  repeat(10) begin
    if ( m.randomize() ) begin
      //$display("num = %0d, index = %0d, and num = %b",m.num,m.index,m.num);
      $display("num = %0d num = %b",m.num,m.num);
    end
  end
end
endmodule*/






//Array contains a unique and repeated values.. Then how will you verify that the array contains the unique value or repeated value write a snippet for it?


class abc;
  rand bit [4:0] arr[];
  rand bit [4:0] arr1[];

  constraint c1{arr.size()==10;
                arr1.size()==10;}

  constraint c2{unique {arr};}

  function void func(ref bit [4:0] arr[]);
    int count=0;
    foreach(arr[i])
      foreach(arr[j])
        if(i != j && arr[i] == arr[j])
          count = count + 1;
    if(count)
      $display("array contains repeated value, arr = %0p",arr);
    else
      $display("array contains unique value, arr = %0p",arr);
  endfunction
endclass

module test;
  abc g = new();
  initial begin
    repeat(5) begin
      void'(g.randomize());
      g.func(g.arr);
      g.func(g.arr1);
    end
  end
endmodule
