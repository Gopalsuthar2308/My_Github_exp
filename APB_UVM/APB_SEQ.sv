
class seq extends uvm_sequence #(seq_item);
  seq_item pkt;
  bit [7:0]datainout;
  bit [7:0]addrinout;
  string s_data;
  string s_addr;
  string str_cfg,data_cfg,addr_cfg;

  `uvm_declare_p_sequencer(apb_seqr)
  `uvm_object_utils_begin(seq)
  `uvm_field_string(str_cfg, UVM_DEFAULT)
  `uvm_field_string(data_cfg, UVM_DEFAULT)
  `uvm_field_string(addr_cfg, UVM_DEFAULT)
  `uvm_object_utils_end

  function new(string name ="");
    super.new(name);
  endfunction

  virtual task body();
  pkt=seq_item::type_id::create("pkt");
  void'(p_sequencer.get_config_string("str_cfg",str_cfg));
  void'(p_sequencer.get_config_string("data_cfg",data_cfg));
  void'(p_sequencer.get_config_string("addr_cfg",addr_cfg));
  s_data=data_cfg;
  s_addr=addr_cfg;
  $display(" string %s %s %s",str_cfg,data_cfg,addr_cfg);

  case(str_cfg)
    "WR_RD":repeat(10)
  begin
    #20
    start_item(pkt);
    pkt.DATA=calc_datain(s_data);
    pkt.ADDR=calc_addr(s_addr);
    pkt.WR_RD=1;
    finish_item(pkt);
    #8
    start_item(pkt);
    pkt.WR_RD=0;
    finish_item(pkt);

    $display("------------sequence generated-------------");
    $display("wr=%d  DATA=%d ADDR=%d",pkt.WR_RD,pkt.DATA,pkt.ADDR);
  end
  "WR":repeat(10)
begin
  #20
  start_item(pkt);
  pkt.DATA=calc_datain(s_data);
  pkt.ADDR=calc_addr(s_addr);
  pkt.WR_RD=1;
  finish_item(pkt);

  $display("------------sequence generated-------------");
  $display("WR=%d DATA=%d ADDR=%d",pkt.WR_RD,pkt.DATA,pkt.ADDR)
end
endcase
endtask

virtual function [7:0] calc_datain(string s_data);
  begin
    case(s_data)
      "random":begin 
      datainout=$random; 
      return datainout;
    end    
    "increment":begin  
    return datainout++;
  end

  "dec":begin  
  return datainout--;
end
"user":begin 
datainout=32'd30; 
return datainout;
end
                                                                                                                  endcase
end
endfunction

virtual function [7:0] calc_addr(string s_addr);
begin
  case(s_addr)
"random":begin
  addrinout=$random;  
  return addrinout;  
end  
"increment":begin 
 "increment":begin 
  return addrinout++;
   end
  "dec":begin  
  return datainout--;
  end  
  "user":begin 
  addrinout=32'd40;
  return addrinout; 
  end     
  endcase
  end
  endfunction
  endclass
                    /*
                                                                                                                                        * class seq extends uvm_sequence #(seq_item);
                                                                                                                                        * `uvm_object_utils(seq)
                                                                                                                                        * seq_item pkt;
                                                                                                                                        * function new(string name="seq");
                                                                                                                                        * super.new(name);
                                                                                                                                        * endfunction
                                                                                                                                        * task body();
                                                                                                                                        * pkt=seq_item::type_id::create("pkt");
                                                                                                                                        * repeat(10)
                                                                                                                                        * begin
                                                                                                                                          * #20
                                                                                                                                          * start_item(pkt);
                                                                                                                                          * pkt.WR_RD=1;
                                                                                                                                          * assert(pkt.randomize());
                                                                                                                                          * finish_item(pkt);
                                                                                                                                          * #8
                                                                                                                                          * start_item(pkt);
                                                                                                                                          * pkt.WR_RD=0;
                                                                                                                                          * finish_item(pkt);
                                                                                                                                          * `uvm_info("seq",$sformatf("ADDR=%d  DATA=%d ",pkt.ADDR,pkt.DATA),UVM_NONE);
                                                                                                                                          * $display("----------------------------------------");
                                                                                                                                          * end
                                                                                                                                          * endtask
                                                                                                                                          * endclass
                                                                                                                                          * */

