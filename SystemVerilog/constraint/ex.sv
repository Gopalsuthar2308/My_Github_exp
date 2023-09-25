module tb();

 

// creating dynamic array of type int
  int abc [];

 

  initial begin
    // give size of dynamic array for eg. take 7
    $display("// setting array size to seven");
    abc = new[7];
$display("abc.size() =%d",abc.size());

 

    // initialize array elements with 10 values
    abc = '{11,12,13,14,15,16,17,18,19,20};
$display("abc.size() =%d",abc.size());

 

    // iterate through array and print values
    $display("// dynamic array values");
    foreach(abc[i])begin
      $display("value of abc[%0d]=%0d",i,abc[i]);
    end
    $display("");
  end
endmodule 
