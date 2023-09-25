/*class abc;
rand int arr[];
rand int arr2[];
rand bit enable;

constraint c1{arr.size()==10;
arr2.size()==5;}
constraint c2{foreach(arr[i])
arr[i] inside {[10:30]};
foreach(arr2[j])
  arr2[j] inside {[1:10]};}

  function void func(ref int arr[],int arr2[],bit enable);
    if(enable)
      $display("enable = %0d, arr = %0p",enable,arr1);
      else
        $display("enable = %0d, arr2 = %0p",enable,arr2);
      endfunction
    endclass

    module test;
    abc g;
    initial begin
      g=new();
      repeat(10) begin
        g.randomize();
        g.func(g.arr,g.arr2,g.enable);
      end
    end
    endmodule*/


   /*class abc;
   rand bit arr[];
   rand bit [3:0] start;
   rand bit [3:0] stop;

   constraint c1{arr.size()==16;
   start<stop;}
   //constraint c2{foreach(arr[i])
   //              arr[i] inside {[1:10]};}

   function void func(ref bit arr[],bit [3:0] start,bit [3:0] stop);
     bit parity=0;
     foreach(arr[i])
       if(i>=start && i<=stop)
         parity ^= arr[i];
         if(parity)
           $display("arr = %0p, start=%0d, stop=%0d, parity=%0b",arr,start,stop,parity);
           else
             $display("arr = %0p, start=%0d, stop=%0d, parity=%0b",arr,start,stop,parity);
           endfunction
         endclass

         module test;
         abc g;
         initial begin
           g=new();
           repeat(10) begin
             void'(g.randomize());
             g.func(g.arr,g.start,g.stop);
           end
         end
         endmodule*/



        /*class abc;
        rand int arr[];

        constraint c1{arr.size()==20;}

        function void func(ref int arr[]);
          foreach(arr[i])
            if(i==11)
              arr[i]=20;
              $display("arr = %0p",arr);
            endfunction
          endclass

          module test;
          abc g;
          initial begin
            g=new();
            repeat(10) begin
              void'(g.randomize());
              g.func(g.arr);
            end
          end
          endmodule*/




         /*class b;
         rand int arr[];

         constraint c1{arr.size()==10;}
         constraint c2{foreach(arr[i])
         arr[i] inside {[0:1]};}

         virtual function func(ref int arr[]);
         bit parity=0;
         foreach(arr[i])
           parity ^= arr[i];
           if(parity)
             $display("inside base class\n arr = %0p, parity = %0b",arr,parity);
           endfunction
         endclass

         class d extends b;
           function func(ref int arr[]);
             bit parity=0;
             foreach(arr[i])
               parity ^= arr[i];
               if(parity == 0)
                 $display("inside derived class\n arr = %0p, parity = %0b",arr,parity);
                 //else
                   // super.func(arr);
                 endfunction
               endclass

               module test;
               b g_b1,g_b2;
               d g_d;
               initial begin
                 g_d = new();
                 g_b2 = new();
                 g_b1 = g_d;
                 repeat(5) begin
                   void'(g_d.randomize());
                   g_b1.func(g_d.arr);
                   g_b2.func(g_d.arr);
                 end
               end
               endmodule*/




/*class b;
  rand int arr[];

                constraint c1{arr.size()==10;}
                constraint c2{foreach(arr[i])
                arr[i] inside {[0:1]};}

                function void func(ref int arr[]);
                  bit parity=0;
                  foreach(arr[i])
                    parity ^= arr[i];
                    if(parity)
                      $display("inside base class\n arr = %0p, parity = %0b",arr,parity);
                    endfunction
                  endclass

                  class d extends b;
                    function void func(ref int arr[]);
                      bit parity=0;
                      foreach(arr[i])
                        parity ^= arr[i];
                        if(parity == 0)
                          $display("inside derived class\n arr = %0p, parity = %0b",arr,parity);
                          else
                            super.func(arr);
                          endfunction
                        endclass


                        module test;
                        d g_d;
                        initial begin
                          g_d = new();
                          repeat(5) begin
                            void'(g_d.randomize());
                            g_d.func(g_d.arr);
                          end
                        end
                        endmodule*/




/*class abc;
  int val;
  event e;

  task my_task();
  //for(int i=0;i<10;i++) begin
  forever begin 
    $display("@%t inside task val = %0d",$time,val);
    val++;
    #10;
    if(val==5)
      ->e;
  end
  endtask
endclass

module test;
  abc g;
  initial begin
    g=new();

    fork
      g.my_task();
      wait(g.e);
      //wait(g.val==5);
      // if(g.val==5) disable g.my_task;
      join_any
      disable fork;
      //forever begin
      //  g.my_task();
      //  if(g.val == 5)
      //    disable g.my_task;
      //end
      $display("@%t  outside loop val = %0d",$time,g.val);
    end
endmodule
*/






                         /*class abc;
                         rand bit [31:0] A[];
                         rand bit [31:0] B[];
                         bit [63:0] C[$];

                         constraint c1{A.size()==20;
                         B.size()==20;}
                         constraint c2{foreach(A[i])
                         A[i] inside {[1:20]};
                         foreach(B[i])
                           B[i] inside {[1:20]};}

                           function func(ref bit [31:0] A[],bit [31:0] B[]);
                             foreach(A[i])
                               foreach(B[j])
                                 if(i>0 && i%4==0 && i==j) begin
                                   C.push_back(A[i]);
                                   C.push_back(B[j]);
                                 end

                                 $display("C = %0p",C);
                               endfunction

                             endclass

                             module test;
                             abc g;
                             initial begin
                               g=new();
                               void'(g.randomize());
                               $display("A = %0p",g.A);
                               $display("B = %0p",g.B);
                               g.func(g.A,g.B);
                             end
                             endmodule*/
