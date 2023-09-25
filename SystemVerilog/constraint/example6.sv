
module tb;
class ABC;
  rand bit[4:0][3:0] md_array [2][5]; 	// Multidimansional Arrays with unknown size
  
  constraint c_md_array { 
    foreach (md_array[i]) {
    	foreach (md_array[i][j]) {
          foreach (md_array[i][j][k]) {
            if (k %2 == 0) 
              md_array[i][j][k] == 'hF;
            else
              md_array[i][j][k] == 0;
        }
      }
    }
  }
  
  
endclass


 ABC abc = new; 
  initial begin
    void'(abc.randomize());
    $display ("md_array = %p", abc.md_array);
  end
endmodule
