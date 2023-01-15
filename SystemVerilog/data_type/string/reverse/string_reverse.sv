module string_reverse;
  string str = "gopal";
  string str_r;
  int len;
  
  initial begin
    len = str.len();
    $display("string length is = %0d",len);
    
    for(int i=0; i<=len; i++) begin
      str_r = {str[i],str_r};
    end
    
    //str_r = {<<8{str}};  

    $display("reverse string is : %0s",str_r);
  end
endmodule
