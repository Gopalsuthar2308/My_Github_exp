

class mon1 extends uvm_monitor;
  `uvm_component_utils (mon1)
  seq_item pkt;
  virtual inte intf;
  bit[7:0]q[$];
  uvm_analysis_port#(seq_item)m12s;

  function new(string name="mon1",uvm_component parent);
    super.new(name,parent);
    m12s=new("m12s",this);
  endfunction

  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db#(virtual inte)::get(this,"","intf",intf);
endfunction

task run_phase(uvm_phase phase);
  pkt=seq_item::type_id::create("pkt");
  forever
begin
  //#8

  //pkt.WR_RD=intf.WR_RD;
  //pkt.ADDR=intf.ADDR;
  //pkt.DATA=intf.DATA;
  pkt.PADDR<=intf.PADDR;
  //pkt.PWDAT=intf.PWDAT;
  pkt.PWR<=intf.PWR;
  pkt.PSEL<=intf.PSEL;
  pkt.PEN<=intf.PEN;
  pkt.PRDY<=intf.PRDY;
  //$display($time,"wr=%d",intf.PWDAT);
  q.push_front(intf.PWDAT);
  #8
  pkt.temp=q.pop_back();
  $display("---------------MON1----------------------");
  `uvm_info("DRIVER",$sformatf(" ADDR=%d DATA=%d  PADDR=%d PWDAT=%d temp=%d ",pkt.ADDR,pkt.DATA,pkt.PADDR,pkt.PWDAT,pkt.temp),UVM_NONE);
  m12s.write(pkt);
end
 endtask
endclass
