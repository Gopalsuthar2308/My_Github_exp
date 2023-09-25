/*class parent;
  virtual function void display();
    $display("parent class");
  endfunction
endclass

class child extends parent;
  virtual function void display();
    $display("child class");
  endfunction
endclass

module test;
  parent p=new();
  child c=new();
  initial begin
    p.display();
    p=c;
    p.display();
  end
endmodule*/


/*class abc;
  function void series(int n);
    int num=1;
    repeat(n) begin
      $write("%0d ",num);
      num = num * 2;
    end
  endfunction
endclass

module test;
  abc g=new();
  initial begin
    $display("");
    g.series(10);
  end
endmodule*/



/*class abc;
  rand int A;
  constraint c1{A inside {[5:10]};}
  constraint c2{A%2 != 0;}
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(10) begin
      void'(g.randomize());
      $display("A = %0d",g.A);
    end
  end
endmodule*/




//class abc;

//endclass


/*module test;
  int num;
  initial begin
    repeat(10) begin
      num = $urandom_range(10,15);
      $display("num =%0d",num);
    end
  end
endmodule*/





/*
class abc; 
  static int w,x,y,z; 
  rand int A, B, C, addr; 

  constraint cal_c{A= w * 2; 
                    B= x/4; 
                    c= y^4; 
                    addr =z %2;}
endclass*/




/*
class abc;
  rand bit [31:0]mem[4095];
  constraint c1{mem dist {mem[0:204]:=5,mem[3892:4095]:=5},mem[205:3891]:=90;}
endclass

module test;
  abc g=new();
  initial begin

  end
endmodule*/



/*
module test;
  bit [3:0]val;

  covergroup covr_grp;
    option.at_least = 1;
    C1:coverpoint val{bins val_b[] = {1,2,4,8};}
  endgroup
endmodule*/







/*class abc;
  rand int arr[10];

  constraint c1{foreach(arr[i])
                  if(i%2==0)
                    arr[i]==0;
                  else
                    arr[i]==(i+1)/2;}
endclass

module test;
  abc g=new();
  initial begin
    void'(g.randomize());
    $display("series = %0p",g.arr);
  end
  endmodule
*/





class abc;
  rand int arr[];
  constraint c1{arr.size()==20;}
  constraint c2{foreach(arr[i])
                  arr[i] dist {[0:1000]:/60, [1001:4000]:/40};}
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


