
// Write a constraint on 3*3 array which doesnot change the surroundings.

class A;
  rand bit [3:0]ar[3][3];
  constraint cons_name1{foreach (ar[i,j])
                                 if((i&j) !=1)
                                   ar[i][j]==1;} 
endclass

module array;
    A a;
    initial begin
      a=new();
      $display ("The value elements of array before randomization = %0p",a.ar);  
      for (int i =0;i<=5;i++)begin  
        void'(a.randomize());  
        $display ("The value of elements of array after randomization = %0p",a.ar); 
      end
    end
endmodule

