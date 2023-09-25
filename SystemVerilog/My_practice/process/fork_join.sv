module tb;
  //abc a;
  initial begin
    //a=new();
    $display("Task calling started");
    fork
      Print(20,"task 1");
      Print(10,"task 2");
      Print(5,"task 1 a");
    join
    $display("kashyap pancholi");
  end
  
  //without automatic 3 task point same memory so it will print 3 time task 1 a
  //task Print(int _time,string name);
  //  #_time; $display("%0d %s %t",_time,name,$time);
  //endtask
  
  //with automatic 3 task point diffrent memory so it will print 3 time diffrent
  task automatic Print(int _time,string name);
    #_time; $display("%0d %s %t",_time,name,$time);
  endtask
endmodule
