/*---------------------------Main-------------------------*/

module Main(P1,P0,N1,NO,Switch,NP1,NP0,E1,E0,OE1,OE0,Enter,Enable,Clear,ALARM,START,Clock,TC_B,PC_B, TC_Co,PC_Co,PC_Bo,EA_LED,LED);
    input P1,P0,N1,NO,Switch,NP1,NP0,E1,E0,OE1,OE0,Enter,Enable,Clear,ALARM,START,Clock;
    output [3:0]TC_B;
    output [3:0]PC_B;
    output TC_Co,PC_Co,PC_Bo,EA_LED,LED;

    wire P1F,P0F,E1F,E0F,S1,S2,S3,S4;
    wire PC1, PC2, PC3, PC4, TC1, TC2, TC3, TC4;
    wire VI;
    wire SA;
    wire EAI,TCI;

    Switcher test1(P1,P0,Switch,N1,N0,OE1,OE0,E1,E0,NP1,NP0,P1F,P0F,E1F,E0F,S1,S2,S3,S4);
    Count_Adder test2(P1F, P0F, E1F, E0F,PC1, PC2, PC3, PC4, TC1, TC2, TC3, TC4);
    TC test3(Enter,Enable,Clear,TC1,TC_B,TC_Co);
    PC test4(Enter,Enable,Clear,PC1,S1,PC_B,PC_Co,PC_Bo);
    Vacancy_Indicator test5(P1F,P0F,PC_B,VI,SA);
    EmergencyAlarm test6(ALARM,EA_LED,EA);
    LED test7(VI,EAI,TCI,LED);
    Time_Counter test8(START,Clock,TCI);
endmodule

/*---------------------------Event Switcher------------------------*/

module Event_Switcher(K,A,B,O);
  input K,A,B;
  output O;
  wire w1,w2,w3;

  not (w1,K);
  and a1(w2,w1,A);
  and a2(w3,K,B);

  or o(O,w2,w3);

endmodule

module Switcher(P1,P0,Switch,N1,N0,OE1,OE0,E1,E0,NP1,NP0,P1F,P0F,E1F,E0F,S1,S2,S3,S4);
  input P1,P0,Switch,N1,N0,OE1,OE0,E1,E0,NP1,NP0; // OE1 = E1' , OE0 = E0' , NP1 = P1' , NP0 = P0'
  output P1F,P0F,E1F,E0F,S1,S2,S3,S4;
  wire w;

  Event_Switcher ES1(Switch,P1,NP1,P1F);
  Event_Switcher ES2(Switch,P0,NP0,P0F);
  Event_Switcher ES3(Switch,E1,N1,E1F);
  Event_Switcher ES4(Switch,E0,N0,E0F);

  and A(w, (~NP1),Switch,(~NP0));
  and s1(S1, w,(~OE1),(~OE0));
  and s2(S2, w,(OE0),(~OE1));
  and s3(S3, w,(OE1),(~OE0));
  and s4(S4, w,OE0,OE1);
endmodule

/*------------------------------------Seat Allocator--------------------------------------*/
/*------------------------Count Increment----------------------------*/
module Count_Adder(P1F, P0F, E1F, E0F,PC1, PC2, PC3, PC4, TC1, TC2, TC3, TC4);
    input P1F, P0F, E1F, E0F;
    output PC1, PC2, PC3, PC4, TC1, TC2, TC3, TC4;

    wire temp, W1, W2, W3, W4;
    xnor (temp, P0F,P1F);
    not (W1, P0F);
    not (W2, P1F);
    not (W3, E0F);
    not (W4, E1F);

    and (PC1, W1,W2,W3,W4);
    and (TC1, temp,W3,W4);
    and (PC2, W1,W2,E0F,W4);
    and (TC2, temp,E0F,W4);
    and (PC3, W1,W2,W3,E1F);
    and (TC3, temp,W3,E1F);
    and (PC4, W1,W2,E0F,E1F);
    and (TC4, temp,E0F,E1F);

endmodule

/*-----------------------------Total Count(TC)----------------------*/
module full_adder(
    input wire A,    
    input wire B,    
    input wire Ci,   
    output wire S,  
    output wire Co 
);
   wire w1,w2,w3;
   xor (w1,A,B);
   and (w2,A,B);
   xor (S,w1,Ci);
   and (w3,w1,Ci);
   or (Co,w3,w2);
endmodule

module Register (
    input wire [3:0] IB, 
    input wire Button,      
    input wire Enable,       
    input wire Clear,       
    output reg [3:0]OB      
);

    always @(posedge Button or posedge Clear) begin
        if (Clear) begin
            OB <= 4'b0000;  
        end else if (Enable) begin
            OB <= IB;      
        end
    end

endmodule

module TC(
    input wire TC_Button,
    input wire TC_Enable,        
    input wire TC_Clear,          
    input wire SA_TC_A0,    
    output wire [3:0] TC_B,   
    output wire TC_Co           
);

    wire [3:0] TC_A;        
    wire TC_Ci = 1'b0;            

    wire C1, C2, C3;              

    full_adder FA0 (.A(TC_A[0]), .B(SA_TC_A0), .Ci(TC_Ci), .S(TC_B[0]), .Co(C1));
    full_adder FA1 (.A(TC_A[1]), .B(1'b0), .Ci(C1), .S(TC_B[1]), .Co(C2));
    full_adder FA2 (.A(TC_A[2]), .B(1'b0), .Ci(C2), .S(TC_B[2]), .Co(C3));
    full_adder FA3 (.A(TC_A[3]), .B(1'b0), .Ci(C3), .S(TC_B[3]), .Co(TC_Co));

    Register TC (
        .IB(TC_B),          
        .Button(TC_Button), 
        .Enable(TC_Enable), 
        .Clear(TC_Clear),  
        .OB(TC_A)     
    );

endmodule

/*-----------------------------Present Count(PC)------------------------*/
module full_subtractor (
    input wire A,     
    input wire B,     
    input wire Bi,   
    output wire D, 
    output wire Bo  
);
    wire w1,w2,w3;
    xor (w1,A,B);
    and (w2,~A,B);
    xor (D,w1,Bi);
    and (w3,~w1,Bi);
    or (Bo,w2,w3);
endmodule

module PC (
    input wire PC_Button,        
    input wire PC_Enable,         
    input wire PC_Clear,          
    input wire SA_PC_A0,         
    input wire SA_PC_S0,         
    output wire [3:0] PC_B,      
    output wire PC_Co,
    output wire PC_Bo            
);

    wire [3:0] PC_A;             
    wire PC_Ci = 1'b0;           
    wire [3:0] sum_result;        
    wire [3:0] sub_result;       
    wire C1, C2, C3;             
    wire B1, B2, B3;             
   
    full_adder FA0 (.A(PC_A[0]), .B(SA_PC_A0), .Ci(PC_Ci), .S(sum_result[0]), .Co(C1));
    full_adder FA1 (.A(PC_A[1]), .B(1'b0), .Ci(C1), .S(sum_result[1]), .Co(C2));
    full_adder FA2 (.A(PC_A[2]), .B(1'b0), .Ci(C2), .S(sum_result[2]), .Co(C3));
    full_adder FA3 (.A(PC_A[3]), .B(1'b0), .Ci(C3), .S(sum_result[3]), .Co(PC_Co));

    full_subtractor FS0 (.A(PC_A[0]), .B(SA_PC_S0), .Bi(PC_Ci), .D(sub_result[0]), .Bo(B1));
    full_subtractor FS1 (.A(PC_A[1]), .B(1'b0), .Bi(B1), .D(sub_result[1]), .Bo(B2));
    full_subtractor FS2 (.A(PC_A[2]), .B(1'b0), .Bi(B2), .D(sub_result[2]), .Bo(B3));
    full_subtractor FS3 (.A(PC_A[3]), .B(1'b0), .Bi(B3), .D(sub_result[3]), .Bo(PC_Bo));

    wire a1,a2,a3,a4;
    and (a1,SA_PC_A0,sum_result[0]);
    and (a2,SA_PC_A0,sum_result[1]);
    and (a3,SA_PC_A0,sum_result[2]);
    and (a4,SA_PC_A0,sum_result[3]);

    wire s1,s2,s3,s4;
    and (s1,SA_PC_S0,sub_result[0]);
    and (s2,SA_PC_S0,sub_result[1]);
    and (s3,SA_PC_S0,sub_result[2]);
    and (s4,SA_PC_S0,sub_result[3]);

    wire w,a1_,a2_,a3_,a4_;
    nor (w,SA_PC_A0,SA_PC_S0);
    and (a1_,w,sum_result[0]);
    and (a2_,w,sum_result[1]);
    and (a3_,w,sum_result[2]);
    and (a4_,w,sum_result[3]);

    wire o1,o2,o3,o4;
    or (o1,a1,s1);
    or (o2,a2,s2);
    or (o3,a3,s3);
    or (o4,a4,s4);

    wire o1_,o2_,o3_,o4_;
    or (o1_,o1,a1_);
    or (o2_,o2,a2_);
    or (o3_,o3,a3_);
    or (o4_,o4,a4_);
    
    wire [3:0] selected_result;
    or (selected_result[0],o1_,0);
    or (selected_result[1],o2_,0);
    or (selected_result[2],o3_,0);
    or (selected_result[3],o4_,0);

    Register PC (
        .IB(selected_result),  
        .Button(PC_Button),    
        .Enable(PC_Enable),    
        .Clear(PC_Clear),      
        .OB(PC_A)              
    );

    assign PC_B = selected_result;

endmodule

/*--------------------Vacancy Indicator-----------------*/
module Vacancy_Indicator(input P0,P1, input [0:3]AS, output VI, output SA);
 // AS : Allocated Seats
 // MC : Maximum Cpacity
 // SA : Seat Allocation
   wire w3,w2,w1,w0,a,p;

   xnor X3(w3,AS[3],1'b1);
   xnor X2(w2,AS[2],1'b1);
   xnor X1(w1,AS[1],1'b1);
   xnor X0(w0,AS[0],1'b1);

   and A(a,w3,w2,w1,w0);
   or O(p,P0,P1);

   assign VI = a;
   nor N(SA,p,a);

endmodule


/*-----------------------------LED---------------------------*/
module EmergencyAlarm(ALARM,EA_LED,EAI);
    input ALARM;    // ED : Emergency Data
    output EA_LED, EAI;   // EA_LED : Emergency Alarm LED ,  EAI : Emergency Alarm Indicator

    or (EA_LED, ALARM,0);
    or (EAI,ALARM,0);                   
endmodule


module LED(VI,EAI,TCI,LED);
    input VI, EAI, TCI;  // VI: Vacany Indicator, EAI : Emergency Alarm Indicator, TCI: Time Count Indicator
    output LED;          // LED of a paricular event

    or(LED, VI,EAI,TCI);
endmodule

/*---------------------------Time Counter------------------*/
module Time_Counter(
    input wire START,     // Start signal
    input wire Clock,     // Clock signal
    output wire STOP      // Stop signal
);

    reg [3:0] count;    
    assign STOP = (count == 4'b0000) ? 1'b1 : 1'b0;

    always @(negedge Clock) begin
        if (START) begin
            count <= 4'b1111; 
        end else if (count > 0) begin
            count <= count - 1; 
        end
    end
endmodule
/*-----------------------------------------------------*/