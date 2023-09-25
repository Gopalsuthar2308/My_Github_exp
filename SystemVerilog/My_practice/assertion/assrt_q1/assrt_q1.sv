module assertion_test;

logic clk;
logic start,i_vof,o_vof;

//CLock generation
always
  #5 clk = ~clk;

  initial begin
    clk =0 ; start =0;
    i_vof = 0;
    o_vof = 1;

    //drive_ovf(0);
    //drive_ovf(1);
    drive_ovf(15);
    $display("MUNEEB");
    #200 $finish();
  end

  property ovf_check;
    @(posedge clk)
    //$rose(start) |-> o_vof ##[2:20] $fell(o_vof) ##0 (!o_vof throughout !i_vof) ##[1:$] ($rose(i_vof) && o_vof);
    //$rose(start) |-> o_vof ##[2:20] $fell(o_vof) ##1 ($stable(o_vof) throughout !i_vof) ##[1:$] ($rose(i_vof) && o_vof); // (!o_vof throughout !i_vof || $rose(i_vof)) ##0 o_vof;

    //$rose(start) |-> o_vof ##[2:20] $fell(o_vof) ##1 $stable(o_vof)[*1:$] ##1 $rose(i_vof) ##0 o_vof; 
    //$rose(start) |-> o_vof ##[2:20] $fell(o_vof) ##1 $stable(o_vof)[*1:$] ##1 o_vof ##0 $rose(i_vof);
    //$rose(start) |-> o_vof ##[2:20] $fell(o_vof) ##0 !o_vof[*1:$] ##1 $rose(i_vof) ##0 o_vof;
  
    $rose(start) |-> o_vof ##[2:20] $fell(o_vof) ##0 !o_vof[*1:$] ##1 (o_vof && $rose(i_vof));
  endproperty: ovf_check

  OVF_CHECK : assert property (ovf_check)
  $display("PASS @ %0t", $time);
  else
    $error("OVF_CHECK failed @ %0t", $time);

    task drive_ovf(int count);
      //sce -1
      repeat(2) begin
        @(posedge clk);
      end
      start <= 1;

      repeat(count) begin
        @(posedge clk);
      end
      o_vof <= 0;

      repeat(2) begin
        @(posedge clk);
      end
      //i_vof <= 1;
      o_vof <= 1;

      repeat(1) begin
        @(posedge clk);
      end
      i_vof <= 1;
      //o_vof <= 1;

 endtask: drive_ovf

 initial begin
   $dumpfile("dump.vcd");
   $dumpvars();
 end

 endmodule : assertion_test
