
class test3 extends uvm_test;
  `uvm_component_utils(test3)

  environment ENV;
  seq seqq; 
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  seqq=seq::type_id::create("seqq", this);   
  ENV=environment::type_id::create("ENV", this);
  set_config_string("ENV.ag1.seqr","str_cfg","SETUP");
  set_config_string("ENV.ag1.seqr","data_cfg","increment");
  set_config_string("ENV.ag1.seqr","addr_cfg","increment");
endfunction

task run_phase(uvm_phase phase);

  phase.raise_objection(this);
  seqq.start(ENV.ag1.seqr);
  //#1000;
  phase.drop_objection(this);
endtask
endclass
