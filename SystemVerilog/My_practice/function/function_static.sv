//'function static' can access any variables, but the scope of all the variables becomes static.

class a;
  int b_var;
  // doesnot initialize a_var every object, but maintains a different 
  // copy of b_var for every object

  function static void display();
    int a_var;
    a_var++;
    $display("a_var = %0d",a_var);
    b_var++;
    $display("b_var = %0d",b_var);
  endfunction
endclass

module function_static;
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

