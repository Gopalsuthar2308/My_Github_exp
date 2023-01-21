module conditional;
  reg [3:0] d0,d1,y;
  logic l;
  initial begin
    d0=4'b1100;
    d1=4'b0101;
    l=1'bx;
    y=l?d0:d1;

    $display("d0=%0b",d0);
    $display("d1=%0b",d1);
    $display("y=%0b",y);
  end
endmodule

//if condition is unknown, it will check if same bit match then output same if both bit is diff. the output x(unknown).

//output
//
// d0=1100
// d1=0101
// y=x10x
