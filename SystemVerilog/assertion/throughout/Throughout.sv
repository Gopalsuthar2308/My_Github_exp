//if you are checking valid stable throughut ready assert then if you will not add [->1] operater then it will check next clock cycle so you need to give condition for ready like after some cycle delay you need to check ready asserted untill it will check valid high.

module Throughout( 
                   input clk,
                   input resetn,
                   input valid,
                   input ready
                  );

  property whenValidAssertedAndStableUntilReadyAsserted(logic valid, logic ready); 
    @(posedge clk) disable iff (!resetn)
      ($rose(valid) && !ready) |=> ($stable(valid) throughout ready[->1]);
  endproperty  
  
  IFVALIDASSERTED_ANDSTABLE_UNTIL_READYASSERTED: assert property(whenValidAssertedAndStableUntilReadyAsserted(valid,ready))
    $info("ASSERTION PASS");
  else  
    $error("ASSERTION FAIL");
     
endmodule : Throughout
