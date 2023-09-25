/*class abc;
rand int num[10];
  constraint c1{foreach(num[i])
                  num[i] inside {[0:9]};}
  constraint c2{num[0] inside {9,8,7,6};}
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(10) begin
      void'(g.randomize());
        $display("num = ");
        foreach(g.num[i]) begin
          $write("%0d",g.num[i]);
        end
        $display(" ");
    end
  end
endmodule*/



/*class abc;
  rand bit [9:0][3:0] num;
  constraint c1{foreach(num[i])
                  num[i] inside {[0:9]};}
  constraint c2{num[9] inside {9,8,7,6};}
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(10) begin
       void'(g.randomize());
       $display("num = ");
       foreach(g.num[i]) begin
           $write("%0d",g.num[i]);
         end
         $display(" ");
     end
  end
endmodule*/






class abc;
  rand bit [4:0] arr[];
  constraint c1{arr.size()==10;}
  //constraint c2{unique {arr};}
  constraint c2{foreach(arr[i])
                  foreach(arr[j])
                    if(i!=j)
                      arr[i] != arr[j];}
endclass

module test;
  abc g=new();
  initial begin
    repeat(10) begin
      void'(g.randomize());
      $display("arr = %0p",g.arr);
    end
  end
endmodule

