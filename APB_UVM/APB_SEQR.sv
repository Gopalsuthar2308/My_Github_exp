
class apb_seqr extends uvm_sequencer#(seq_item);
  `uvm_component_utils(apb_seqr);
  function new(string name="apb_seqr",uvm_component parent);
    super.new(name,parent);
  endfunction
endclass


