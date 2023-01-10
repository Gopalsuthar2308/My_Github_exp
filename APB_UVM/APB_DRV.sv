
class driver extends uvm_driver #(seq_item);
  `uvm_component_utils(driver)
  seq_item pkt;
  virtual inte intf;
  function new(string name="driver",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db #(virtual inte)::get(this,"","intf",intf);
endfunction

task run_phase(uvm_phase phase);
  pkt=seq_item::type_id::create("pkt");
  forever
  //repeat(10)
begin
  seq_item_port.get_next_item(pkt);
  //@(posedge intf.PCLK)
  //@(posedge intf.PCLK)
  //@(posedge intf.PCLK)
  //pkt.WR_RD=1;
  //#10
  intf.WR_RD=pkt.WR_RD;
  intf.ADDR=pkt.ADDR;
  intf.DATA=pkt.DATA;
  //pkt.PWR=intf.PWR;
  //pkt.PSEL=intf.PSEL;
  //pkt.PEN=intf.PEN;
  //#4
  //intf.PADDR=pkt.PADDR;
  //intf.PWDAT=pkt.PWDAT;
  //intf.PSEL=pkt.PSEL;
  //intf.PEN=pkt.PEN;
  //intf.PWR=pkt.PWR;
  //intf.PRDY=pkt.PRDY;
  $display("---------------DRIVER----------------------");
  `uvm_info("DRIVER",$sformatf("WR_RD=%d ADDR=%d DATA=%d  PADDR=%d PWDAT=%d ",pkt.WR_RD,pkt.ADDR,pkt.DATA,pkt.PADDR,pkt.PWDAT),UVM_NONE);

  seq_item_port.item_done();
end
 endtask 
endclass
