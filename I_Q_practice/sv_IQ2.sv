//1)Randomize bit a(without using rand keyword).If you have to randomize another variable b along with a,how will you do that?
  
/*module test;
  int g;
  initial begin
    std::randomize(g);
    $display("a = %0d",g);
  end
endmodule*/



//Constraint a dynamic array so that its values on some of the indexes are equal to a constant value.




//write a function , returns 1 if the number is power of two?
/*
class abc;
  randc int num;

  constraint c1{num inside {[1:50]};}

  function power_two(int num);
    if(num>1) begin
      while(num >1) begin
        if(num%2==0)
          num=num/2;
        else
          num = 0;
      end
      if(num==1)
        return 1;
    end
  endfunction
endclass

module test;
  abc g;
  int res;
  initial begin
    g=new();
    repeat(20) begin
      void'(g.randomize());
      res = g.power_two(g.num);
      $display("num = %0d return value = %0d",g.num,res);
    end
  end
endmodule*/





//write a class for semaphore functionality without using semaphore?

//using semaphore
/*module sem;
  semaphore s=new(3);

  task process_1();
    s.get(2);
    $display("process 1 started");
    #5;
    $display("process 1 completed");
    s.put(1);
  endtask

  task process_2();
    s.get(2);
    $display("process 2 started");
    #5;
    $display("process 2 completed");
  endtask

  initial begin
    fork
      process_1();
      process_2();
    join
  end
endmodule
*/



//without semaphore
/*module sem_fun;
  event e;

  task process_1();
    $display("%t process 1 started",$time);
    #5;
    $display("%0t process 1 completed",$time);
    ->e;
  endtask

  task process_2();
    wait(e.triggered);
    //@(e);
    $display("@ %t process 2 started",$time);
    #10; 
    $display("@ %t process 2 completed",$time);
  endtask

  initial begin
    fork
      process_1();
      process_2();
    join
    #10;
    $display("%t Outside fork_join",$time);
  end
endmodule*/



/*class abc;
  bit[3:0] arr[];
  rand bit[3:0] val;
  //constraint c1{arr.size==10;}
endclass

module test;
abc g;
int i=0;
initial begin
  g=new();
  g.arr=new[10];
  repeat(10) begin
    void'(g.randomize());
    g.arr[i]=g.val;
    $display("arr[%0d] = %0d val = %0d",i,g.arr[i],g.val);
    i++;
  end
  $display("arr size = %0d arr = %0p",g.arr.size(),g.arr);
  g.arr=new[5](g.arr);
  $display("after new size arr size = %0d arr = %0p",g.arr.size(),g.arr);
end

endmodule*/






/*module test;
  int arr[] = {2,3,4};
  initial begin
    $display("arr size = %0d arr = %0p",arr.size(),arr);
    //arr=new[5](arr);
    arr=new[arr.size()+1](arr);
    arr[4]=5;
    $display("after new size arr size = %0d arr = %0p",arr.size(),arr);
  end
endmodule*/






module test;
  semaphore s=new(0);
  event eventA,eventB,eventC;
  initial begin
    fork 
      begin
        ->eventC;
        //@(eventA);
        wait(eventA.triggered);
        s.put(1);
        $display("event A");
      end
      begin
        //@(eventB);
        wait(eventB.triggered);
        s.put(1);
        $display("event B");
      end
      begin
        ->eventB;
        //@(eventC);
        wait(eventC.triggered);
        s.put(1);
        $display("event C");
      end
    join_any
    s.get(2);
    disable fork;
    $display("calc_offset");
    //calc_offset();
  end
endmodule
