module APBDUT (

  input PCLK,PRST,WR_RD,
  input [7:0] ADDR,
  input [7:0] DATA,

  output [7:0] PRDAT, 
  output  PSEL, PWR,PEN,PRDY,
  output [7:0] PADDR,
  output [7:0] PWDAT);

  APB_MASTER APB_M (.PCLK(PCLK),.PRST(PRST),.DATA(DATA),.ADDR(ADDR),.WR_RD(WR_RD),.PSEL(PSEL),.PWR(PWR),.PEN(PEN),.PRDY(PRDY),.PADDR(PADDR),.PWDAT(PWDAT));        

  APB_SLAVE APB_S (.PCLK(PCLK),.PRST(PRST),.PSEL(PSEL),.PWR(PWR),.PEN(PEN),.PADDR(PADDR),.PWDAT(PWDAT),.PRDY(PRDY),.PRDAT(PRDAT));

  endmodule

  module APB_MASTER (PCLK,PRST,WR_RD,ADDR,DATA,PSEL,PWR,PEN,PRDY,PADDR,PWDAT);

  input PCLK,PRST;
  input [7:0]DATA; 
  input [7:0]ADDR; 
  input WR_RD;
  input PRDY;
  output reg PSEL;
  output reg PWR;
  output reg PEN;
  output reg [7:0]PADDR;
  output reg [7:0]PWDAT;


  reg [1:0] PR_ST, NXT_ST;

  parameter [1:0] IDLE_ST  = 2'b00;
  parameter [1:0] SETUP_ST = 2'b01;
  parameter [1:0] ACCES_ST = 2'b10;


  always @(posedge PCLK)
  begin
    if(PRST==1)
    begin
      PWR <= 0;
      PADDR <= 0;
      PWDAT <= 0;
    end
    else
    begin
      //    PWR <= WR_RD;
      if(WR_RD==1 )//& PSEL == 1 & PEN == 1)//
      begin
        PADDR <= ADDR;
        PWDAT <= DATA; 
      end  
    end
  end

  always @(posedge PCLK)
  begin
    if(PRST==1)
      PR_ST <= IDLE_ST;
      else
        PR_ST <= NXT_ST;
      end

      always @(posedge PCLK)
      begin
        if(PRST==1)
        begin 
        PSEL <= 0;
        PEN <= 0;
      end
      else
      begin

        case(PR_ST)

          IDLE_ST :  begin 
          PSEL <= 0;
          PEN  <= 0;
          PWR <= WR_RD;
          NXT_ST <= SETUP_ST;
        end

        SETUP_ST :  begin 
        PSEL <= 1;
        PEN <= 0;
        PWR <= WR_RD;
        PADDR <= ADDR;
        PWDAT <= DATA;//PWDAT;
        NXT_ST <= ACCES_ST;
      end


      ACCES_ST :  begin
        PSEL <=1;
        PEN <=1;
        PWR <= WR_RD;
        PADDR <= ADDR;
        PWDAT <= DATA;//PWDAT;
        if (PRDY == 0)
          NXT_ST <= ACCES_ST;
          else 
            NXT_ST <= IDLE_ST;
          end

        endcase
      end
    end
    endmodule

    module APB_SLAVE (PCLK,PRST,PSEL,PWR,PEN,PADDR,PWDAT,PRDY,PRDAT);

    input PCLK,PRST;
    input PSEL,PEN;
    input PWR;
    input [7:0] PADDR;
    input [7:0] PWDAT;
    output PRDY;
    output reg [7:0] PRDAT;
    reg [7:0] SLAVE [255:0];

    assign PRDY = PSEL==1 && PEN==1;

    always @(posedge PCLK)
    begin
      if (PRST==1)
        PRDAT <= 0;
        else //if (PSEL == 1 && PEN == 1 && PRDY == 1)
        begin
          if(PWR == 1 && PSEL == 1 && PEN == 1)
          begin
            SLAVE [PADDR] <= PWDAT;

          end 
          else if (PWR == 0 && PSEL == 1 && PEN == 1)       
          begin
            PRDAT <=  SLAVE [PADDR];

          end

        end
      end 
      endmodule

