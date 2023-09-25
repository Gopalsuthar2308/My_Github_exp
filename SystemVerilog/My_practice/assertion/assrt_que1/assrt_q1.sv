/*module assertion_test;

logic clk;
logic start,i_vof,o_vof;

//CLock generation
always
  #5 clk = ~clk;

  initial begin
    clk =0 ; start =0;
    i_vof = 0;
    o_vof = 1;

    drive_ovf(1);
    //drive_ovf(5);
    //drive_ovf(10);
    $display("MUNEEB");
    #200 $finish();
  end

  sequence seq_1;
   o_vof ##[2:20] $fell(o_vof);
  endsequence

  sequence seq_2;
    !o_vof throughout ($rose(i_vof) && $rose(o_vof));
  endsequence

  property ovf_check;
    @(posedge clk) $rose(start) |-> seq_1 ##0 seq_2;
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
      i_vof <= 1;
      o_vof <= 1;

    endtask: drive_ovf

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars();
    end

    endmodule : assertion_test
*/






module asertion_ex;
    bit clk,start,o_ovf,i_ovf;

    always #2 clk = ~clk; clock generation

      initial begin
        start=0; i_ovf=0; o_ovf=1;
        #6  start=0; i_ovf=0; o_ovf=1;    
        #6  start=1; i_ovf=0; o_ovf=1;  
        #10 start=1; i_ovf=0; o_ovf=0; 
        #10 start=1; i_ovf=0; o_ovf=0;
        #10 start=1; i_ovf=0; o_ovf=1;
        #10 start=1; i_ovf=0; o_ovf=0;  
        #10 start=1; i_ovf=1; o_ovf=1; 
        #10 start=1; i_ovf=0; o_ovf=0;
        #10 start=1; i_ovf=0; o_ovf=0;
        #10;
        $finish;
      end

      property definition
        property p;
          @(posedge clk) $rose(start) |-> o_ovf ##[2:20] !o_ovf ##0 (!o_ovf throughout ($rose(i_ovf) ##0 o_ovf));
        endproperty 

        calling assert property
        a_1: assert property(p)
        $info("PASS @ %0t",$time);
        else
          $info("FAIL @ %0t",$time);

          wave dump
          initial begin 
            $dumpfile("dump.vcd"); $dumpvars;
          end
 endmodule
