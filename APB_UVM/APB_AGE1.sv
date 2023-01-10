class agent1 extends uvm_agent;
  `uvm_component_utils(agent1)

  apb_seqr seqr;
  driver drv;
  mon1 monn1;

  function new (string name="agent1", uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seqr=apb_seqr::type_id::create("seqr", this);
  drv=driver::type_id::create("drv", this);
  monn1=mon1::type_id::create("monn1", this);
endfunction

virtual function void connect_phase(uvm_phase phase);  
super.connect_phase(phase);  
drv.seq_item_port.connect(seqr.seq_item_export);
          endfunction
        endclass
