`include "APB_COVE.sv"
class apb_sb extends uvm_scoreboard;
  `uvm_component_utils(apb_sb)
  seq_item pkt1,pkt2;
  //bit[7:0]mem[*];
  uvm_tlm_analysis_fifo #(seq_item) ip_fifo;
  uvm_tlm_analysis_fifo #(seq_item) op_fifo;
  coverag cov;

  function new(string name="apb_sb",uvm_component parent);
    super.new(name,parent);
    ip_fifo=new("ip_fifo",this);
    op_fifo=new("op_fifo",this);
    cov=coverag::type_id::create("cov",this);
  endfunction

  virtual function void buil_phase(uvm_phase phase);
  super.build_phase(phase);
  pkt1=seq_item::type_id::create("pkt1",this);
  pkt2=seq_item::type_id::create("pkt2",this);
endfunction

task run_phase(uvm_phase phase);
  forever
begin
  fork
    ip_fifo.get(pkt1);
    op_fifo.get(pkt2);
  join
  //mem[pkt1.PADDR]=pkt1.PWDAT;
  //pkt2.PRDAT=mem[pkt1.PADDR];
  $display($time,"-------------SB-------------");
  //$display($time,"-----PADDR=%d PWDAT=%d  PRDAT=%d ------",pkt1.PADDR,pkt1.WRDAT, pkt2.PRDAT);
  if(pkt2.PRDAT==pkt1.temp)
  begin  
  `uvm_info("SB MATCHED",$sformatf(" temp=%d  PRDAT=%d ",pkt1.temp, pkt2.PRDAT ),UVM_NONE);
end
else
begin
  `uvm_info("NOT MATCHED",$sformatf(" temp=%d  PRDAT=%d ",pkt1.temp, pkt2.PRDAT ),UVM_NONE);
end
cov.pkt=pkt1;
cov.cg.sample();
                                        end
                                      endtask
                                    endclass
