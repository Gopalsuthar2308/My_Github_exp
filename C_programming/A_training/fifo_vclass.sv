virtual class Fifo#(parameter DATA_WIDTH=32,DEPTH=16);
  rand bit [DATA_WIDTH-1:0] fifo_write;
  bit [DATA_WIDTH-1:0] fifo_read;
  bit [DATA_WIDTH-1:0] mem[DEPTH-1:0];
  bit [DATA_WIDTH-1:0] write_ptr,read_ptr;
  bit [DATA_WIDTH-1:0] count;

  virtual function void write(bit [DATA_WIDTH-1:0] fifo_write);
  endfunction

  virtual function void read();
  endfunction

  virtual function is_full();
  endfunction

  virtual function is_empty();
  endfunction

endclass

class Fifo1#(parameter DATA_WIDTH=15,DEPTH=16) extends Fifo#(.DATA_WIDTH(DATA_WIDTH),.DEPTH(DEPTH)); 
  function void write(bit [DATA_WIDTH-1:0] fifo_write);
    if(!is_full()) begin
      mem[write_ptr] = fifo_write;
      if(write_ptr<DEPTH)
        write_ptr = write_ptr+1;
      else
        write_ptr = 0;
      count = count + 1;
      $display("fifo_write = %0d count = %0d write_ptr =%0d, mem = %0p",fifo_write,count,write_ptr,mem);
    end
    else
      $display("fifo full");
  endfunction

  function void read();
    if(!is_empty()) begin
      fifo_read = mem[read_ptr];
      mem[read_ptr] = 0;
      if(read_ptr<DEPTH)
        read_ptr = read_ptr+1;
      else
        read_ptr = 0;
      count = count - 1;
      $display("fifo_read = %0d count = %0d read_ptr = %0d, mem = %0p",fifo_read,count,read_ptr,mem);
    end
    else
      $display("fifo empty");
  endfunction

  function is_full();
    return (count==DEPTH);
  endfunction
    
  function is_empty();
    return (count==0);
  endfunction

endclass

class Fifo2#(parameter DATA_WIDTH=16,DEPTH=16) extends Fifo1#(.DATA_WIDTH(DATA_WIDTH),.DEPTH(DEPTH)); 
  function void peek();
   // if(!is_empty()) begin
      fifo_read = mem[read_ptr];
      if(read_ptr<DEPTH)
        read_ptr = read_ptr+1;
      else
        read_ptr = 0;
      //count = count - 1;
      $display("inside peek function fifo_read = %0d, read_ptr = %0d, mem = %0p",fifo_read,read_ptr,mem);
   // end
    //else
    //  $display("fifo empty");
  endfunction
endclass


module test;
  Fifo1 fifo_h1;
  Fifo2 fifo_h2;
    int i,j;
  initial begin
    fifo_h1=new();
    fifo_h2=new();

    /*for(i=0;i<20;i++) begin
      void'(fifo_h1.randomize());
      fifo_h1.write(fifo_h1.fifo_write);
    end

    $write("\nmem = ");
    for(j=0;j<16;j++)
      $write("%0d ",fifo_h1.mem[j]);
    $display("\n");*/
    
    for(i=0;i<20;i++) begin
      void'(fifo_h2.randomize());
      fifo_h2.write(fifo_h2.fifo_write);
    end

    $write("\nmem = ");
    for(j=0;j<16;j++)
      $write("%0d ",fifo_h2.mem[j]);
    $display("\n");
      
    /*for(i=0;i<20;i++) begin
      fifo_h1.read();
    end

   $write("\nmem = ");
    for(j=0;j<16;j++)
      $write("%0d ",fifo_h1.mem[j]);
    $display("\n");*/
    
   for(i=0;i<20;i++) begin
      fifo_h2.peek();
    end
    
   $write("\nmem = ");
    for(j=0;j<16;j++)
      $write("%0d ",fifo_h2.mem[j]);
    $display("\n");
  end

endmodule
