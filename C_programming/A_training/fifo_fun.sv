//fifo code
/*module fifo;
  bit wr_en,rd_en;
  bit [31:0] fifo_write;
  bit [31:0] fifo_read;
  bit fifo_empty,fifo_full;

  bit [31:0] fifo[15:0];
  bit [4:0] read_ptr;
  bit [4:0] write_ptr;
  bit [4:0] count;

  function automatic void wr_func(ref bit [31:0] fifo[15:0],bit [31:0] fifo_write,bit [4:0] count,bit [4:0] write_ptr);
    if(!full_func(count)) begin
      fifo[write_ptr] = fifo_write;
      if(write_ptr<16)
        write_ptr = write_ptr+1;
      else
        write_ptr = 0;
      count = count + 1;
      //if(write_ptr>16 && read_ptr>1)
      //  write_ptr=0;
      $display("fifo_write = %0d count = %0d write_ptr =%0d",fifo_write,count,write_ptr);
    end
    else
      $display("fifo full");
  endfunction

  function automatic void rd_func(ref bit [31:0] fifo[15:0],bit [31:0] fifo_read,bit [4:0] count,bit [4:0] read_ptr);
    if(!empty_func(count)) begin
      fifo_read = fifo[read_ptr];
      fifo[read_ptr] = 0;
      if(read_ptr<16)
        read_ptr = read_ptr+1;
      else
        read_ptr = 0;
      count = count - 1;
      //if(read_ptr>16)
      //  read_ptr=0;
      $display("fifo_read = %0d count = %0d read_ptr = %0d",fifo_read,count,read_ptr);
    end
    else
      $display("fifo empty");
  endfunction

  function automatic full_func(ref bit [4:0] count);
    if(count==16) begin
      fifo_full = 1;
      //count = 16;
    end
    else
      fifo_full = 0;
    return fifo_full;
  endfunction
    
  function automatic empty_func(ref bit [4:0] count);
    if(count==0)
      fifo_empty = 1;
    else
      fifo_empty = 0;
    return fifo_empty;
  endfunction

  initial begin
    int i,j;
    fifo_write=10;

      for(i=0;i<20;i++) begin
      wr_en=1;
      if(wr_en)
        wr_func(fifo,fifo_write,count,write_ptr);
      fifo_write++;
    end

    $write("\nfifo = ");
    for(j=0;j<16;j++)
      $write("%0d ",fifo[j]);
    $display("\n");
      
    for(i=0;i<20;i++) begin
      rd_en=1;
     if(rd_en)
      rd_func(fifo,fifo_read,count,read_ptr);
    end

    $write("\nfifo = ");
    for(j=0;j<16;j++)
      $write("%0d ",fifo[j]);
    $display("\n");
  end

endmodule*/





//fifo class
class fifo;
  bit wr_en,rd_en;
  rand bit [31:0] fifo_write;
  bit [31:0] fifo_read;
  bit fifo_empty,fifo_full;

  bit [31:0] fifo[15:0];
  bit [4:0] read_ptr;
  bit [4:0] write_ptr;
  bit [4:0] count;

  function void wr_func(bit [31:0] fifo_write);
    if(!full_func()) begin
      fifo[write_ptr] = fifo_write;
      if(write_ptr<16)
        write_ptr = write_ptr+1;
      else
        write_ptr = 0;
      count = count + 1;
      //if(write_ptr>16 && read_ptr>1)
      //  write_ptr=0;
      $display("fifo_write = %0d count = %0d write_ptr =%0d",fifo_write,count,write_ptr);
    end
    else
      $display("fifo full");
  endfunction

  function void rd_func();
    if(!empty_func()) begin
      fifo_read = fifo[read_ptr];
      fifo[read_ptr] = 0;
      if(read_ptr<16)
        read_ptr = read_ptr+1;
      else
        read_ptr = 0;
      count = count - 1;
      //if(read_ptr>16)
      //  read_ptr=0;
      $display("fifo_read = %0d count = %0d read_ptr = %0d",fifo_read,count,read_ptr);
    end
    else
      $display("fifo empty");
  endfunction

  function full_func();
    if(count==16) begin
      fifo_full = 1;
      //count = 16;
    end
    else
      fifo_full = 0;
    return fifo_full;
  endfunction
    
  function empty_func();
    if(count==0)
      fifo_empty = 1;
    else
      fifo_empty = 0;
    return fifo_empty;
  endfunction

endclass


module test;
  fifo fifo1;
    int i,j;
  initial begin
    fifo1=new();
    //int i,j;

    for(i=0;i<20;i++) begin
      void'(fifo1.randomize());
      fifo1.wr_func(fifo1.fifo_write);
    end

    $write("\nfifo = ");
    for(j=0;j<16;j++)
      $write("%0d ",fifo1.fifo[j]);
    $display("\n");
      
    for(i=0;i<20;i++) begin
      fifo1.rd_func();
    end

    $write("\nfifo = ");
    for(j=0;j<16;j++)
      $write("%0d ",fifo1.fifo[j]);
    $display("\n");
  end

endmodule
