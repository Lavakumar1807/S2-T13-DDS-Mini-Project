module Main_tb;
   reg P1,P0,N1,NO,Switch,NP1,NP0,E1,E0,OE1,OE0,Enter,Enable,Clear,ALARM,START,Clock;
   wire TC_Co,PC_Co,PC_Bo,EA_LED,LED;
   wire [3:0]TC_B;
   wire [3:0]PC_B;
   Main test(P1,P0,N1,NO,Switch,NP1,NP0,E1,E0,OE1,OE0,Enter,Enable,Clear,ALARM,START,Clock, TC_B,PC_B,TC_Co,PC_Co,PC_Bo,EA_LED,LED);

   initial
   begin
      Clock = 0;     
      Enter = 0;

      #10 P1 = 1'b0;
      P0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b0;
      Switch = 1'b0;
      NP1 = 1'b0;
      NP0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b0;
      OE1 = 1'b0;
      OE0 = 1'b0;
      Switch = 1'b0;
      Enable = 1'b1;
      Enter = ~Enter;
      Clock = ~Clock;

      #10 P1 = 1'b0;
      P0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b0;
      Switch = 1'b0;
      NP1 = 1'b0;
      NP0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b0;
      OE1 = 1'b0;
      OE0 = 1'b0;
      Switch = 1'b0;
      Enable = 1'b1;
      Enter = ~Enter;
      Clock = ~Clock;

       #10 P1 = 1'b0;
      P0 = 1'b1;
      E1 = 1'b0;
      E0 = 1'b0;
      Switch = 1'b0;
      NP1 = 1'b0;
      NP0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b0;
      OE1 = 1'b0;
      OE0 = 1'b0;
      Switch = 1'b0;
      Enable = 1'b1;
      Enter = ~Enter;
      Clock = ~Clock;

       #10 P1 = 1'b1;
      P0 = 1'b1;
      E1 = 1'b0;
      E0 = 1'b0;
      Switch = 1'b0;
      NP1 = 1'b0;
      NP0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b0;
      OE1 = 1'b0;
      OE0 = 1'b0;
      Switch = 1'b0;
      Enable = 1'b1;
      Enter = ~Enter;
       Clock = ~Clock;
    
       #10 P1 = 1'b0;
      P0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b1;
      Switch = 1'b0;
      NP1 = 1'b0;
      NP0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b0;
      OE1 = 1'b0;
      OE0 = 1'b0;
      Switch = 1'b0;
      Enable = 1'b1;
      Enter = ~Enter;
      Clock = ~Clock;

       #10 P1 = 1'b0;
      P0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b1;
      Switch = 1'b0;
      NP1 = 1'b0;
      NP0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b0;
      OE1 = 1'b0;
      OE0 = 1'b0;
      Switch = 1'b0;
      Enable = 1'b1;
      Enter = ~Enter;
      Clock = ~Clock;

       #10 P1 = 1'b0;
      P0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b0;
      Switch = 1'b0;
      NP1 = 1'b0;
      NP0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b0;
      OE1 = 1'b0;
      OE0 = 1'b0;
      Switch = 1'b1;
      Enable = 1'b1;
      Enter = ~Enter;
      Clock = ~Clock;

       #10 P1 = 1'b0;
      P0 = 1'b0;
      E1 = 1'b1;
      E0 = 1'b0;
      Switch = 1'b0;
      NP1 = 1'b0;
      NP0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b0;
      OE1 = 1'b0;
      OE0 = 1'b0;
      Switch = 1'b0;
      Enable = 1'b1;
      Enter = ~Enter;
      Clock = ~Clock;

       #10 P1 = 1'b0;
      P0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b0;
      Switch = 1'b0;
      NP1 = 1'b0;
      NP0 = 1'b0;
      E1 = 1'b0;
      E0 = 1'b0;
      OE1 = 1'b0;
      OE0 = 1'b0;
      Switch = 1'b0;
      Enable = 1'b1;
      Enter = ~Enter;
     Clock = ~Clock;
    #10 $finish;
   end

   initial begin
     $display("-------Inputs------------------------------------------------------------Outputs----------------------------------------");
     $display("Time    P1  P0  E1  E0  Switch  N1  N0  P1'  P0'  E1'  E0'   TC_B3  TC_B2  TC_B1  TC_B0  PC_B3  PC_B2  PC_B1  PC_B0  LED");
     $monitor("%4d   %3b   %3b   %3b   %3b   %3b   %3b   %3b   %3b   %3b   %3b   %3b   %3b  %3b  %3b   %3b   %3b   %3b   %3b   %3b  %3b ",$time,P1,P0,E1,E0,Swicth,N1,N0,NP1,NP0,OE1,OE0,TC_B[3],TC_B[2],TC_B[1],TC_B[0],PC_B[3],PC_B[2],PC_B[1],PC_B[0],LED);
   end
endmodule