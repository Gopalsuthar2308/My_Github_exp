module assertion(inte intf);
sequence write;
  (intf.PSEL==1)&&(intf.PWR==1)&&(intf.PEN==1);                               ///$rose(vit.PSEL) and $rose(vit.PRDY);          
endsequence
sequence read;
  (intf.PSEL==1)&& (intf.PWR==0)&&(intf.PEN==1);
endsequence

//property pwrite;
//@(posedge vit.PCLK)disable iff(vit.PRST)!vit.PRST|->vit.WR_RD|->(vit.PSEL)&(vit.PWR)|->$rose(vit.PEN);
//endproperty


//property pread;
//@(posedge vit.PCLK)disable iff(vit.PRST)!vit.PRST|->!vit.WR_RD|->(vit.PSEL)& (!vit.PWR)|->$rose(vit.PEN);
//endproperty

property pwrite;
  @(posedge intf.PCLK)disable iff(intf.PRST) write|->!$isunknown(intf.PWDAT); //##4 vit.PSEL |-> ##4 (vit.PRDY) ;//##3  $stable ( vit.PSEL)|->  $rose  (vit.PEN);//write;//vit.PWR|->$rose(vit.PSEL)|->$rose(vit.PEN);
endproperty
a1:assert property (pwrite)
$display("write assertion pass");
else
  $display("write assertion fail");


  property pread;
    @(posedge intf.PCLK) disable iff(intf.PRST)read|->!$isunknown(intf.PRDAT);         // !vit.PWR|->##3 $rose (vit.PSEL)|-> ##3  $rose (vit.PEN);//vit.PWR|->$rose(vit.PSEL)|->$rose(vit.PEN);
  endproperty
  a2:assert property (pread)
  $display("read assertion pass");
  else
    $display("read assertion fail");


    property datain;
      @(posedge intf.PCLK)
      (intf.PWR)|-> !$isunknown(intf.PWDAT);
    endproperty
    a3:assert property (datain)
    $display("datain assertion pass");
    else
      $display("datain assertion fail");

      property dataout;
        @(posedge intf.PCLK)
        (!intf.PWR)|->!$isunknown(intf.PRDAT);
      endproperty
      a4:assert property (dataout)
      $display("prdata assertion pass");
      else
        $display("prdata assertion fail");

        property SLAVEIN;
          @(posedge intf.PCLK)disable iff(intf.PRST)
          write|-> (intf.PRDY);
        endproperty
        a5:assert property (SLAVEIN)
        $display("slavein assertion pass");
        else
          $display("slavein assertion fail");


          property SLAVEOUT;
            @(posedge intf.PCLK)disable iff(intf.PRST)
            read|->(intf.PRDY);
          endproperty
          a6:assert property (SLAVEOUT)
          $display("slaveout assertion pass");
          else
            $display("slaveout assertion fail");

            property reset;
              @(posedge intf.PCLK)disable iff(intf.PRST)!intf.PRST|->intf.WR_RD||!intf.WR_RD;
            endproperty
            a7:assert property (reset)
            $display("after reset assertion pass");
            else
              $display("after reset assertion fail");


              property pwr;
                @(posedge intf.PCLK)intf.WR_RD|->##1 (intf.PWR);
              endproperty
              a8:assert property (pwr)
              $display("pwr assertion pass");
              else
                $display("pwr assertion fail");

                property addr;
                  @(posedge intf.PCLK)
                  (intf.WR_RD)|->##5 !$isunknown(intf.ADDR);
                endproperty
                a9:assert property (addr)
                $display("addr assertion pass");
                else
                  $display("addr assertion fail");
                  endmodule



                  /*
                  * module assertion (inte vit);
                  * sequence write;
                  * (vit.wn)and(!vit.rn);//|->(vit.din);
                  * endsequence
                  *
                  * sequence read;
                  * (!vit.wn)and(vit.rn);//|->(vit.dout);
                  * endsequence
                  *
                  * property prop1;
                  * @(posedge vit.clk)disable iff(vit.res)!vit.res|->write;
                  * endproperty
                  * property prop2;
                  * @(posedge vit.clk)disable iff(vit.res)!vit.res|->read;
                  * endproperty
                  *
                  * property prop3;
                  * @(posedge vit.clk)
                  * (vit.wn)|->!$isunknown(vit.din);
                  * endproperty
                  *
                  * property prop4;
                  * @(posedge vit.clk)
                  * (!vit.rn)|->!$isunknown(vit.dout);
                  * endproperty
                  *
                  * property prop5;
                  * @(posedge vit.clk)disable iff(vit.res)
                  * (!vit.res)|->((vit.full)&&(!vit.empty));
                  * endproperty
                  *
                  * property prop6;
                  * @(posedge vit.clk)disable iff(vit.res)
                  * (!vit.res)|->((!vit.full)&&(vit.empty));
                  * endproperty
                  *
                  * always@(posedge vit.clk)
                  * begin
                    * a1:assert property(prop1)
                    *
                    *              $display(" datain assertion pass ");
                    *                   else
                      *                              $display(" datain fail assertion ");
                      *
                      *
                      *                              a2:assert property(prop2)
                      *
                      *                                           $display("dataout assertion pass ");
                      *                                                 else
                        *                                                             $display(" dataout fail assertion  ");
                        *
                        *
                        *                                                             a3:assert property(prop3)
                        *                                                                          $display("data assertion pass ");
                        *                                                                              else
                          *                                                                                           $display("data fail assertion ");
                          *
                          *                                                                                           a4:assert property(prop4)
                          *
                          *                                                                                                        $display("out assertion pass ");
                          *                                                                                                             else
                            *                                                                                                                        $display("out assertion ");
                            *                                                                                                                        a5:assert property(prop5)
                            *                                                                                                                                     $display("full assertion pass ");
                            *                                                                                                                                          else
                              *  $display("full fail assertion ");
                              *
                              *  a6:assert property(prop6)
                              *  $display("empty assertion pass ");
                              *  else
                                *  $display("empty assertion ");    
                                *  end
                                * endmodule*/
