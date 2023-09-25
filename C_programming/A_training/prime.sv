//A function which given a number returns true if the number is prime, else false

  /*class abc;
  rand int num;

  constraint c1{num inside {[1:100]};}

  function int func(ref int num);
    int res=1;
    $display("number = %0d",num);
    for(int i=2;i<=num/2;i++) begin
      if(num%i == 0) begin
        res = 0;
        break;
      end
    end
    $display("inside fun return res = %0d",res);
    return res;
  endfunction
endclass

module test;
abc g;
initial begin
  g=new();
  repeat(10) begin
    void'(g.randomize());
    if(g.func(g.num))
      $display("number is prime");
      else
        $display("number is not prime");
      end
    end
    endmodule*/




   /*module tb;
   prime p;
   initial begin
     int m=5;
     p=new();
     prime(19); 
   end
   function automatic void prime(input int a);
     int res=1;
     for(int i=2;i<=a/2;i=i+1)begin
       if(a%i==0)begin
         res=0;
         break;
       end
     end
     if(res)
       $display("Number is prime");
       else
         $display("Number is not prime");
       endfunction

       endmodule*/






      class prime;
        rand int a;
        //static int c=0;

        constraint n {a inside {[1:100]};}

        function int func(ref int a);
          int res=1;
          for(int i=2;i<10;i++) begin
            if(a%i == 0)
              res=0;
            end
            return res;
            endfunction

            //  function void post_randomize();
            //  a=a.unique();
            // endfunction

          endclass



          module m;
          prime pa=new();
          initial begin
            repeat(10) begin 
            //pa.randomize();
            //pa.a=95;
            //pa.func(pa.a);
            if(pa.func(pa.a))
              $display("value of a %d",pa.a) ;
            end
          end
          endmodule
