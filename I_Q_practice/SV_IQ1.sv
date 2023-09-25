/*module array_constraint;
class array_constraint;
  rand int array_k [4][4];
 // constraint c_array{foreach (array_k[i,j])
 // foreach (array_k[k, l]) {
  //  k > i && j == l && i != k -> array_k[i][j] != array_k[k][l];
  //  l > j && j != l && i == k -> array_k[i][j] != array_k[k][l];}}

  constraint c_array{foreach (array_k[i,j])
                      array_k[i][j] != array_k[i][j+1] && 
                      array_k[i][j];
  
    function void print_array();
      for(int i=0; i<4; i++) begin
        for(int j=0; j<4; j++) begin
          $write("[%0d]", array_k[i][j]);
        end
        $display("\n");
      end
    endfunction : print_array
  endclass

  initial begin
    array_constraint array_c;
    array_c = new();
    array_c.randomize();
    array_c.print_array();
  end
  endmodule : array_constraint*/





/*class abc;

   function func();
     //int arr[*];
     int arr[int];
     arr = '{0:5,1:10,2:15,3:20,4:25,5:30};
     $display("size = %0d, arr = %0p",arr.size(),arr);
     //..logic
     //for(int i=0;i<arr.size();i++)
     foreach(arr[i])
       arr[i]=0;
     $display("after clear size = %0d, arr = %0p",arr.size(),arr);

  endfunction

endclass

module test;
  abc g;
  initial begin
    g=new();
    g.func();
  end
endmodule*/






class abc;
  rand bit [3:0] data;
  //bit [3:0] val;
  function bit [3:0] func(ref bit [3:0] data);
    int temp;
    $display("inside function input data = %0d <-> %0b",data,data);
    temp = data[0];
    data[0] = data[$size(data)-1];
    data[$size(data)-1] = temp;

    return data;
  endfunction

endclass

module test;
  abc g;
  bit [3:0] val;
  initial begin
    g = new();
    repeat(10) begin
      void'(g.randomize());
      val = g.func(g.data);
      //g.func(g.data);
      $display("return value = %0d <-> %0b\n",val,val);
    end
  end
endmodule
