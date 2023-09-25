module tb;
reg Krdy;
reg Drdy;
reg EN;
reg CLK;
reg RSTn;

property check_dout;
  @(posedge CLK) disable iff (~RSTn)
  (
    (
    (
    (EN & Krdy)
    ##1
    (
      ((EN & Krdy) == 0)
      throughout
      (
        ((EN & Krdy) == 0)
        ##[0:$]
        (EN & Drdy & ~Krdy)
        )
        )
        )
        ##1
        (EN [-> 1])
        ), $display("antecedent happened at time=%t", $time)
        )
        |=> (1==1, $display("consequent happended at time=%t", $time));
      endproperty

      assert property (check_dout)
      else $error("Error at time=%t", $time);

      always #5 CLK = ~CLK;

  initial begin
        CLK = 0;
        RSTn = 1;
        EN = 1;
        @(posedge CLK);
        Krdy = 1;
        Drdy = 0;
        @(posedge CLK);
        Krdy = 0;
        Drdy = 1;
        @(posedge CLK);
        Drdy = 0;
        repeat (3) @(posedge CLK);
        $stop;
  end

endmodule
