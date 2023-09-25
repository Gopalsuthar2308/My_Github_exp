// 1. task wait_intr (int unsigned ch_no); Write a code to wait for interrupts from two channels 0 and 1 simultaneously and exit when anyone arrives.

/*class abc;
  int unsigned ch_no;

  task wait_intr(int unsigned ch_no);
    fork
      wait(ch_no_0);
      wait(ch_no_1);
    join_any
  endtask
endclass*/




/*class memory;
  rand int unsigned num_bytes;
  bit [7:0] mem [4096];
  int count;

  constraint c1{num_bytes<2000;}
  function int allocate(int unsigned num_bytes,ref int count);
    $display("giving size num_bytes = %0d",num_bytes);
    for(int i=0;i<num_bytes;i++)
      if(count<=4095)
        count=count+1;
      else
        return -1;
    $display("allocated space = %0d free space = %0d",count,4096-count);
  endfunction
endclass

module test;
  memory m;
  initial begin
    int full;
    m=new();
    repeat(5) begin
      void'(m.randomize());
      full = m.allocate(m.num_bytes,m.count);
      if(full == -1)
        $display("No free space %0d",full);
    end
  end
endmodule*/



 

/*class type_m #(int DEPTH = 1024);
  localparam ADDR_W = $clog2(DEPTH);
  rand bit [31:0]mem[DEPTH];
  
  constraint c1{foreach(mem[i])
                  mem[i] inside {[1:100]};}
  //extern virtual function void  move(bit [ADDR_w:0]source_address,bit [ADDR_w:0]dest_address,bit [ADDR_w:0]size);
  function void move(bit [ADDR_W:0]source_address,bit [ADDR_W:0]dest_address,bit [ADDR_W:0]size);
    $display("before moving data mem = %0p",mem);
    for(int i=0;i<size;i++) begin
      mem[dest_address] = mem[source_address];
      dest_address++;
      source_address++;
    end
    $display("after moving data mem = %0p",mem);
  endfunction

endclass

module test;
  type_m t;
  initial begin
    t=new();
    void'(t.randomize());
    t.move(5,15,4);
  end
endmodule*/




//Given a pseudo code as follows
/*fork
  begin
   a();
  end 
  begin
   b();
  end        
  begin
   c();
  end
join*/

//how to execute the thread in the order b,a,c with the above code ?
/*module test;
  semaphore s;
  initial begin
    s=new(0);
    fork
      begin
        s.get(1);
        $display("inside Thread-1 a() execute");
        s.put(2);
      end
      begin
        $display("inside Thread-2 b() execute");
        s.put(1);
      end
      begin
        s.get(2);
        $display("inside Thread-3 c() execute");
      end
    join
  end
endmodule*/



//Write constraints for generating number from 0 to 100, without repetition for filling an array of 15 elements.

class abc;
  randc int num;
  int arr[15];
  constraint c1{num inside {[0:100]};}
  //constraint c2{unique {num};}
endclass
module test;
  abc g;
  initial begin
    g=new();
    for(int i=0;i<15;i++) begin
      void'(g.randomize());
      g.arr[i]=g.num;
    end
    $display("arr = %0p",g.arr);
  end
endmodule
