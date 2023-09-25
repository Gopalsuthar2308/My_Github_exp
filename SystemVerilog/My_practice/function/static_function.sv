//'static function' can access any static variables and it's own variable.

class a;
  static int b_var;
  // Maintains a single copy of b_var for every object but 
  // initiliazes a_var during each function call

  static function void display();
    int a_var;
    a_var++;
    $display("a_var = %0d",a_var);
    b_var++;
    $display("b_var = %0d",b_var);
  endfunction
endclass

module static_function;
int i;
initial
begin
  a a_obj;
  a b_obj;
  a_obj = new();
  b_obj = new();

  $display("For a_obj : ");
  for(i=0;i<5;i++)
  begin
    a_obj.display();
  end

  $display("For b_obj : ");
  for(i=0;i<5;i++)
  begin
    b_obj.display();
  end
end
endmodule

