class coverag extends uvm_component;
  `uvm_component_utils(coverag)
  seq_item pkt;
  bit PRST;

  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  pkt=seq_item::type_id::create("pkt");
endfunction
covergroup cg;
  c1:coverpoint pkt.DATA{bins DA1={[0:256]};}
  //c1:coverpoint pkt.DATA{bins DA1[4]={[0:50],[50:100],[100:200],[200:256]};}
  //*c1: coverpoint pkt.DATA{bins DA1={[0:50]};
  //bin/    bins DA2={[50:100]};
  //bin/    bins DA3={[100:200]};
  //bin/    bins DA4={[200:256]};}*/
 c2: coverpoint pkt.ADDR{bins b2={[0:256]};}
 //c2: coverpoint pkt.ADDR{bins b2[4]={[0:50],[50:100],[100:200],[200:256]};}
 c3: coverpoint pkt.WR_RD{bins b3={0,1};}
 C4: coverpoint !pkt.WR_RD{bins b4={1,0};}
 c5: coverpoint PRST{bins b5={1,0};}
 c6:coverpoint pkt.PRDAT{bins PRD1={[0:256]};}
 //c6:coverpoint pkt.PRDAT{bins PRD1[4]={[0:50],[50:100],[100:200],[200:256]};}
 //
 ///*c6: coverpoint pkt.PRDAT{bins PRD1={[0:50]};
 //bin/   bins PRD2={[50:100]};
 //bin/   bins PRD3={[100:200]};
 //bin/   bins PRD4={[200:256]};}*/
c7: coverpoint pkt.PADDR{bins  b7={[0:256]};}
//c7: coverpoint pkt.PADDR{bins  b7[4]={[0:50],[50:100],[100:200],[200:256]};}
c8: coverpoint pkt.PWDAT{bins b8={[0:256]};}
c9: coverpoint pkt.PSEL{bins b9={[1:0]};}
c10:coverpoint pkt.PEN{bins b10={[1:0]};}
c11: coverpoint pkt.PRDY{bins b11={[1:0]};}
c12: coverpoint pkt.PWR{bins b12={[0:1]};}
c13: coverpoint !pkt.PWR{bins b12={[1:0]};}
endgroup

function new(string name="coverag",uvm_component parent);
  super.new(name,parent);
  cg=new();
endfunction
endclass
