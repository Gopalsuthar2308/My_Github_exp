//Constraint a random variable to generate even value ranges from 500 to 700.
/*class abc;
  rand int val;
  constraint c1{val inside {[500:700]};}
  constraint c2{val%2==0;}
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(10) begin
      void'(g.randomize());
      $display("value = %0d",g.val);
    end
  end
endmodule*/



//There is an 8 bit register all the fields of register must be one.write a constraint for it.
/*class abc;
  rand reg [7:0]r;
  constraint c1{$countones(r)==8;}
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(10) begin
      void'(g.randomize());
      $display("r = %0b",g.r);
    end
  end
endmodule*/



//Constraint to generate a dynamic array of size 128 to 256 elements.each. element has a difference of 4 wrt neighbour

/*class abc;
  //rand bit [9:0]arr[];
  rand int arr[];
  constraint c1{arr.size() inside {[128:256]};}
  constraint c2{foreach(arr[i])
                  if(i>0)
                    arr[i]-arr[i-1]==4;}
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(10) begin
      void'(g.randomize());
      $display("arr size = %0d arr = %0p",g.arr.size(),g.arr);
    end
  end
endmodule*/




//write an asseration to verify present state1 when it is enabled,it must be stable for 10 cycles.




//There are two random variables(a,b). if a>15, b must be odd.   if a<15, b must be even. Write a constraint.
/*class abc;
  rand bit [5:0] a,b;
  constraint c1{if(a>15)
                  b%2!=0;
                else
                  b%2==0;}
endclass

module test;
  abc g=new();
  initial begin
    repeat(10) begin
      void'(g.randomize());
      $display("a = %0d b = %0d",g.a,g.b);
    end
  end
endmodule*/





//in an array which can hold 100 elements. Write constraint to generate 5 even numbers and 5 odd numbers alternatively

/*class abc;
  rand bit [7:0]arr[];
  constraint c1{arr.size()==100;}
  constraint c2{foreach(arr[i])
                    if(i%5==0 && i%2==0){
                      arr[i]%2==0;
                      arr[i+1]%2==0;
                      arr[i+2]%2==0;
                      arr[i+3]%2==0;
                      arr[i+4]%2==0;
                  }
                  else if(i%5==0 && i%2!=0){
                      arr[i]%2!=0;
                      arr[i+1]%2!=0;
                      arr[i+2]%2!=0;
                      arr[i+3]%2!=0;
                      arr[i+4]%2!=0;
                  }}
endclass

module test;
  abc g;
  initial begin
    g=new();
    void'(g.randomize());
    $display("arr = %0p",g.arr);
  end
endmodule*/




/*module abc;
  //int l;
  initial begin
    for(int i=0;i<5;i++) begin
      fork
        automatic int l=i;
        //l=i;
        begin        
          $display("i=%d, l=%d",i,l);
        end//b1
      join_none  
    end//for
  end //initial
endmodule*/




/*module abc;
  initial begin
    for(int i=0;i<5;i++) begin
      fork
        begin
          int l=i;        
          $display("i=%d, l=%d",i,l);
        end//b1
      join_none  
    end//for
  end //initial
endmodule*/






//Swap values of two variables without using third variable.
/*module test;
  int a,b;
  initial begin
    a=10;
    b=20;
    $display("before swaping a = %0d and b = %0d",a,b);
    //a <= b;
    //b <= a;
    //#5;
    //a=a+b;
    //b=a-b;
    //a=a-b;
    
    //a=a^b;
    //b=a^b;
    //a=a^b;
    
    a=a*b;
    b=a/b;
    a=a/b;
    $display("after swaping a = %0d and b = %0d",a,b);
    //$monitor("a = %0d and b = %0d",a,b);
  end
endmodule*/


//Check whether a number is odd or even without using a modulus operator
class abc;
  rand bit [7:0]num;
  function bit [7:0] odd_even(bit [7:0] num);
    //if(!(num & 1))
    if((num/2)*2==num)
      return 0;
    else
      return 1;
  endfunction
endclass

module test;
  abc g=new();
  int res;
  initial begin
    repeat(10) begin
      void'(g.randomize());
      res = g.odd_even(g.num);
      if(res==1)
        $display("number %0d is odd",g.num);
      else
        $display("number %0d is even",g.num);
    end
  end
endmodule
