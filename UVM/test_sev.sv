`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;
  `uvm_component_utils(driver);

  function new(string name="", uvm_component parent);
    super.new(name,parent);
  endfunction


  task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_warning("TEST", "Warning occured");  
    `uvm_info("TEST","inoformation severity--1 (info_none)", UVM_NONE);  
    `uvm_info("TEST","information severity--2 (info_medium)", UVM_MEDIUM);  
    `uvm_info("TEST","information severity--3 (info_low)", UVM_LOW);  
    `uvm_error("TEST", "Error 1");  
    `uvm_error("TEST", "Error 2");   
    `uvm_fatal("FATAL", "A fatal error has occurred");
  
  endtask
endclass

module top;
  driver dri;

initial begin

  dri = driver::type_id::create("dri",null);

  dri.set_report_severity_override(UVM_ERROR,UVM_WARNING);    
  dri.set_report_severity_id_override(UVM_FATAL,"FATAL",UVM_WARNING);
  
  run_test();
end
endmodule
