// shallow copy
/*class P;
int x = 10;
endclass

module tb;
P p1,p2;
initial begin
  p1 = new(); // p1 = 10101 p2 = null
  p2 = p1;  // p1 = 10101 p2 =10101
  p1 = null;// p1= null   p2 = 10101

  $display(" P1.x = %0d, p2.x = %0d",p1.x,p2.x);
end
endmodule*/


/*class A;
integer j = 5;
endclass
class B;
  integer i = 1;
  A a = new();
endclass

module test;
B b1,b2;
initial
begin
  b1=new();
  b2=new b1;
  b1=null;
  //$display("b1.j = %0d, b1.i =%0d",b1.a.j,b1.i);
  $display("b2.j = %0d, b2.i =%0d",b2.a.j,b2.i);
end
endmodule*/




//deep copy
/*class A;
integer j = 5;
function A copy_A();
  copy_A=new();
  copy_A.j=this.j;
endfunction
endclass
class B;
  integer i = 1;
  A a = new();
  function B copy_B();
    copy_B=new();
    copy_B.i=this.i;
    copy_B.a=a.copy_A();
  endfunction
endclass

module test;
B b1,b2;
initial
begin
  b1=new();
  b2=b1.copy_B();
  $display("b1.i = %0d, b1.a.j = %0d",b1.i,b1.a.j);
  $display("b1.copy_B.i = %0d, b1.a.copy_A = %0d",b1.copy_B.i,b1.a.copy_A.j);
  $display("b2.i = %0d, b2.a.j = %0d",b1.i,b1.a.j);
  $display("b2.copy_B.i = %0d, b2.a.copy_A = %0d\n",b2.copy_B.i,b2.a.copy_A.j);

  b1.i = 10;
  b1.a.j = 15;
  b2.i = 20;
  b2.a.j = 25;
  $display("b1.i = %0d, b1.a.j = %0d",b1.i,b1.a.j);
  $display("b1.copy_B.i = %0d, b1.a.copy_A = %0d",b1.copy_B.i,b1.a.copy_A.j);
  $display("b2.i = %0d, b2.a.j = %0d",b1.i,b1.a.j);
  $display("b2.copy_B.i = %0d, b2.a.copy_A = %0d",b2.copy_B.i,b2.a.copy_A.j);
end
endmodule*/



`include "uvm_macros.svh"
import uvm_pkg::*;

class Packet extends uvm_object;
  rand bit [15:0] addr;

  function string convert2string();
    string content;
    content = $sformatf(" Addr = 0x%0h", addr);
    return content;
  endfunction

  function new(string name = "");
    super.new(name);
  endfunction

  `uvm_object_utils(Packet)

  function bit do_compare(uvm_object _rhs, uvm_comparer comparer);
    bit result;
    Packet _packet_a;

    $cast(_packet_a, _rhs);

    result = super.do_compare(_packet_a, comparer) & (_packet_a.addr == this.addr);
    return result;
  endfunction

endclass

class Packet_1 extends uvm_object;
  `uvm_object_utils(Packet_1)

  rand e_bool m_bool;
  rand bit[3:0] m_mode;
  string m_name;
  rand Packet m_pkt;

  function new(string name = "");
    super.new(name);

    m_pkt = Packet::type_id::create("m_pkt");
    m_pkt.randomize();
  endfunction

  function string convert2string();
    string content = " ";
    $sformat( content , "%s m_bool = %s", content , m_bool);
    $sformat( content , "%s m_mode = %d", content , m_mode);
    $sformat( content , "%s m_name = %s", content , m_name);
    $sformat( content , "%s m_pkt  = %s", content , m_pkt.convert2string());
    return content;
  endfunction

  function bit do_compare(uvm_object _rhs, uvm_comparer comparer);
    bit result;

    Packet_1 _pkt;

    $cast(_pkt, _rhs);

    result = super.do_compare(_pkt, comparer) && (_pkt.m_bool == this.m_bool);
    result &= (_pkt.m_mode == this.m_mode);
    result &= (_pkt.m_name == this.m_name);
    result &= (m_pkt.do_compare(_pkt.m_pkt, comparer));

    return result;
  endfunction
endclass

class test1 extends uvm_test;
  `uvm_component_utils(test1)

  Packet_1 packet_a;
  Packet_1 packet_b;

  function new(string name = "" , uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    packet_a   = Packet_1::type_id::create("packet_a");
    packet_b = Packet_1::type_id::create("packet_b");
    packet_a.randomize();
    packet_b.randomize();

    `uvm_info( get_type_name(), " Trying to compare", UVM_LOW)
    _compare( packet_b, packet_a);

    `uvm_info(get_type_name(), $sformatf("BEFORE: %s", packet_a.convert2string()), UVM_LOW);
    `uvm_info(get_type_name(), $sformatf("packet_b BEFORE: %s", packet_b.convert2string()), UVM_LOW);
    packet_a.copy(packet_b);
    `uvm_info(get_type_name(), $sformatf("AFTER:%s", packet_a.convert2string()), UVM_LOW);
    `uvm_info(get_type_name(), $sformatf("packet_b AFTER:%s", packet_b.convert2string()), UVM_LOW);

    `uvm_info(get_type_name(), $sformatf("BEFORE: %s", packet_a.convert2string()), UVM_LOW);
    `uvm_info(get_type_name(), $sformatf("packet_b BEFORE: %s", packet_b.convert2string()), UVM_LOW);
    $cast(packet_a, packet_b.clone());
    `uvm_info(get_type_name(), $sformatf("AFTER:%s", packet_a.convert2string()), UVM_LOW);
    `uvm_info(get_type_name(), $sformatf("packet_b AFTER:%s", packet_b.convert2string()), UVM_LOW);

    _compare( packet_b, packet_a);

  endfunction

  task run_phase( uvm_phase phase);
    phase.raise_objection(this);
    #1000;
    phase.drop_objection(this);
  endtask
  function void _compare( uvm_object _rhs, uvm_object _lhs);
    if( _rhs.compare(_lhs))
      `uvm_info(get_type_name(), " SAME", UVM_LOW)
      else
        `uvm_info(get_type_name(), " NOT SAME" , UVM_LOW)
      endfunction
    endclass












