// A function to reverse a char array
class abc;
  string str = "gopal";
  string str1;

  function void func(ref string str,str1);
    //str1=str1;
    int l;
    l=str.len();
    for(int i=0;i<l;i++) begin
      str1[i] = str[l-1-i];
    end
    $display("l = %0d, reverse char array = %0s",l,str1);
  endfunction
endclass

module test;
  abc g;
  initial begin
    g=new();
    g.str1 = g.str;
    g.func(g.str,g.str1);
  end
endmodule
