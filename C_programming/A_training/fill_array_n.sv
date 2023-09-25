// A function that takes an integer array and number 'n' as argument and fills the array with first 'n' integers.
class abc;
  rand int arr[];
  rand int n;

  constraint c1{arr.size() inside {[5:20]};}
  constraint c2{n inside {[1:20]};}
  function func(ref int arr[],int n);
    foreach(arr[i])
      if(i<n)
        arr[i] = i+2;
        else
          arr[i] = 0;
    $display("n = %0d, array size = %0d, array = %0p",n,arr.size,arr);
  endfunction
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(20) begin
      void'(g.randomize());
      if(g.n <= g.arr.size())
        g.func(g.arr,g.n);
    end
  end
endmodule
