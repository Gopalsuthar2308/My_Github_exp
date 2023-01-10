class mon2 extends uvm_monitor;

  `uvm_component_utils(mon2)

  seq_item pkt;
  uvm_analysis_port #(seq_item) m22s;


  virtual inte intf;

  function new(string name="mon2", uvm_component parent);
    super.new(name, parent);
    m22s=new("m22s",this);
  endfunction

  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db #(virtual inte)::get(this,"","intf",intf);
endfunction

task run_phase(uvm_phase phase);

  pkt=seq_item::type_id::create("pkt");
  forever
begin
  //  #8
  #28
  //pkt.ADDR=intf.ADDR;
  //pkt.DATA=intf.DATA;
  //pkt.PADDR=intf.PADDR;
  //pkt.PWDAT=intf.PWDAT;
  //pkt.PSEL=intf.PSEL;
  //pkt.PEN=intf.PEN;
  //pkt.PWR=intf.PWR;

  pkt.PRDAT=intf.PRDAT;
  $display("---------------MON2----------------------");
  `uvm_info("mon2",$sformatf("PRDAT=%d ",pkt.PRDAT),UVM_NONE);

  m22s.write(pkt);
end
 endtask
endclass
