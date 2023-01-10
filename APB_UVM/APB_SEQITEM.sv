class seq_item extends uvm_sequence_item;
  `uvm_object_utils(seq_item)
  randc bit[7:0] ADDR;
  randc bit [7:0]DATA;
  bit[7:0]PRDAT;
  bit [7:0]PWDAT;
  bit[7:0]PADDR;
  bit WR_RD, PSEL,PWR,PEN,PRDY;
  bit[7:0]temp;


  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(ADDR,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(DATA,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(PRDAT,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(PWDAT,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(PADDR,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(WR_RD,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(PSEL,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(PWR,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(PEN,UVM_ALL_ON|UVM_DEC)
  `uvm_field_int(PRDY,UVM_ALL_ON|UVM_DEC)
  `uvm_object_utils_end
  function new(string name="");
    super.new(name);
  endfunction
endclass




/*
class seq_item extends uvm_sequence_item;
  `uvm_object_utils(seq_item)
  randc bit[7:0] ADDR;
  randc bit [7:0]DATA;
  bit[7:0]PRDAT;
  bit [7:0]PWDAT;
  bit[7:0]PADDR;
  bit WR_RD, PSEL,PWR,PEN,PRDY;
  bit[7:0]temp;
  function new(string name="seq_item");
    super.new(name);
  endfunction
endclass
*/
