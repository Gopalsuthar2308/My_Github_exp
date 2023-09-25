class base;
  rand bit [9:0] val[];

  constraint c1{val.size==10;
  foreach(val[i])
    val[i] inside {[5:7]};}

    constraint c2{foreach(val[i])
    foreach(val[j])
      if(i!=j)
        val[i]<=val[j];}
      endclass
      module test;
      base obj;
      initial begin
        obj=new();
        repeat(5) begin
          obj.randomize();
          $display("val=%p",obj.val);
        end
      end
      endmodule
