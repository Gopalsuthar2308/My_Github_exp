/*class environment extends uvm_env;
* `uvm_component_utils(environment)
* agent1 ag1;
* agent2 ag2;
* apb_sb sb;
*
* function new(string name="environment",uvm_component parent);
* super.new(name,parent);
* endfunction
*
* virtual function void build_phase(uvm_phase phase);
* super.build_phase(phase);
* ag1=agent1::type_id::create("ag1",this);
* ag2=agent2::type_id::create("ag2",this);
* sb=apb_sb::type_id::create("sb",this);
* endfunction
* virtual function void connect_phase(uvm_phase phase);
* super.connect_phase(phase);
* ag1.monn1.m12s.connect(sb.ip_fifo.analysis_export);
* ag2.monn2.m22s.connect(sb.op_fifo.analysis_export);
* endfunction
* endclass*/


class environment extends uvm_env;

  `uvm_component_utils(environment)

  agent1 ag1;
  agent2 ag2;
  apb_sb sb;

  function new(string name="environment", uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  ag1=agent1::type_id::create("ag1", this);
  ag2=agent2::type_id::create("ag2", this);
  sb=apb_sb::type_id::create("sb", this);
endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
ag1.monn1.m12s.connect(sb.ip_fifo.analysis_export);
ag2.monn2.m22s.connect(sb.op_fifo.analysis_export);
              endfunction
            endclass
