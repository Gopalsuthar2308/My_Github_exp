class agent2 extends uvm_agent;
  `uvm_component_utils(agent2)
  mon2 monn2;
  function new (string name="agent2",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  monn2=mon2::type_id::create("monn2",this);
endfunction

endclass
