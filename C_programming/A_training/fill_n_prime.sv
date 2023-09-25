// A function which uses the fn. in 3 to fill an array with first 'n' primes.
/*class abc;
rand int n;
int arr[$];

constraint c1{n inside {[1:10]};}

function void func(ref int arr[$],int n);
  //function void func(int arr[$],int n);
  //int res=1,num=2;
  int num=2;
  $display("first n = %0d prime number: ",n);
while(n!=0) begin
  int res=1;
  for(int i=2;i<=num/2;i++) begin
    if(num%i==0) begin
      res = 0;
      break;
    end
  end
  if(res) begin
    arr.push_back(num);
    n=n-1;
    num=num+1;
  end
  else
    num=num+1;
  end
  $display("array = %0p",arr);
  arr.delete();
endfunction
endclass

module test;
abc g;
initial begin
  g=new();
  repeat(5) begin
    void'(g.randomize());
    g.func(g.arr,g.n);
  end
end
endmodule*/



/*class abc;
randc int n;
rand int arr[];
int num;

constraint c1{arr.size() inside {[2:15]};}
constraint c2{n inside {[1:15]};}

function void func(ref int arr[],int n,int num);
  int l = arr.size();
  num=2;
  for(int j=0;j<l;j++) begin
    int res=1;
    for(int i=2;i<=num/2;i++) begin
      if(num%i == 0) begin
        res = 0;
        break;
      end
    end
    if(res) begin
      if(j<n)
        arr[j]=num;
        else
          arr[j]=0;
          num=num+1;
        end
        else begin
          j=j-1;
          num=num+1;
        end
      end
      $display("first n = %0d prime numer in array = %0p",n,arr);
    endfunction
  endclass

  module test;
  abc g;
  initial begin
    g=new();
    repeat(20) begin
      void'(g.randomize());
      if(g.n<=g.arr.size())
        g.func(g.arr,g.n,g.num);
      end
    end
    endmodule*/




class abc;
  int num;
  rand int arr[];
  randc int n;

  constraint c1{arr.size() inside {[5:20]};}
  constraint c2{n inside {[2:20]};}

  function void func_arr(ref int arr[],n,num);
    num=2;
    foreach(arr[i]) begin
      if(i<n) begin
        if(func(num)) begin
          arr[i] = num;
          num=num+1;
        end
        else begin
          num=num+1;
          i=i-1;
        end
      end
      else
        arr[i]=0;
    end
  endfunction

  function int func(ref int num);
    int res=1;
    //$display("number = %0d",num);
    for(int i=2;i<=num/2;i++) begin
      if(num%i == 0) begin
         res = 0;
         break;
      end
    end
    //$display("inside fun return res = %0d",res);
    return res;
  endfunction
endclass

module test;
  abc g;
  initial begin
    g=new();
    repeat(20) begin
      void'(g.randomize());
      if(g.n<g.arr.size()) begin
        g.func_arr(g.arr,g.n,g.num);
        $display("fisrt n = %0d prime in array = %0p",g.n,g.arr);
      end
    end
  end
endmodule
