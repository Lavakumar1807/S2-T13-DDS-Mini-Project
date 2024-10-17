/*---------------------------Main-------------------------*/
module Main(P1,P0,N1,NO,Switch,NP1,NP0,E1,E0,OE1,OE0,Enter,Enable,Clear,ALARM,START,Clock,output [3:0]TC_B,output [3:0]PC_B,output TC_Co,PC_Co,PC_Bo);
    input P1,P0,N1,NO,Switch,NP1,NP0,E1,E0,OE1,OE0,Enable,Enter,Clear,ALARM,START,Clock;
    wire P1F,P0F,E1F,E0F,S1,S2,S3,S4;
    wire PC1, PC2, PC3, PC4, TC1, TC2, TC3, TC4;
    output wire [3:0] TC_B;  
    output wire TC_Co ; 
    output wire [3:0] PC_B;     
    output wire PC_Co;
    output wire PC_Bo;
    output VI;
    output SA;
    output EA_LED;
    wire EAI,TCI;
    output LED;   

    Switcher test1(P1,P0,Switch,N1,N0,OE1,OE0,E1,E0,NP1,NP0,P1F,P0F,E1F,E0F,S1,S2,S3,S4);
    Count_Adder test2(P1F, P0F, E1F, E0F,PC1, PC2, PC3, PC4, TC1, TC2, TC3, TC4);
    TC test3(Enter,Enable,Clear,TC1,TC_B,TC_Co);
    PC test4(Enter,Enable,Clear,PC1,S1,PC_B,PC_Co,PC_Bo);
    VI test5(P1F,P0F,PC_B,VI,SA);
    EmergencyAlarm test6(ALARM,EA_LED,EA);
    LED test7(VI,EAI,TCI,LED);
    Time_Counter test8(START,Clock,TCI);
endmodule


/*---------------------------Event Switcher Module------------------------*/
module Event_Switcher(K,A,B,O);
  input K,A,B;
  output O;
  wire w1,w2,w3;

  assign O = (((~K)&A) | (K&B));
endmodule

module Switcher(P1,P0,Switch,N1,N0,OE1,OE0,E1,E0,NP1,NP0,P1F,P0F,E1F,E0F,S1,S2,S3,S4);
  input P1,P0,Switch,N1,N0,OE1,OE0,E1,E0,NP1,NP0; // OE1 = E1' , OE0 = E0' , NP1 = P1' , NP0 = P0'
  output P1F,P0F,E1F,E0F,S1,S2,S3,S4;

  assign P1F = ((~Switch)&P1) | (Switch&NP1);
  assign P0F = ((~Switch)&P0) | (Switch&NP0);
  assign E1F = ((~Switch)&E1) | (Switch&N1);
  assign E0F = ((~Switch)&E0) | (Switch&N0);
 
  assign w = Switch&(~NP1)&(~NP0);
  assign S1 = w&(~OE1)&(~OE0);
  assign S2 = w&(OE0)&(~OE1);
  assign S3 = w&(OE1)&(~OE0);
  assign S4 = w&(OE0)&(OE1);

endmodule


/*------------------------------------Seat Allocator--------------------------------------*/
/*------------------------Count Increment----------------------------*/
module Count_Adder(P1F, P0F, E1F, E0F,PC1, PC2, PC3, PC4, TC1, TC2, TC3, TC4);
    input P1F, P0F, E1F, E0F;
    output PC1, PC2, PC3, PC4, TC1, TC2, TC3, TC4;

    assign temp = ~(P0F ^ P1F);
    assign PC1 = ~(P1F | P0F | E1F | E0F);
    assign TC1 = (temp & ~(E0F | E1F));
    assign PC2 = (~(P0F) & ~(P1F) & ~(E1F) & (E0F));
    assign TC2 = (temp & ~(E1F) & (E0F));
    assign PC3 = (~(P0F) & ~(P1F) & (E1F) & ~(E0F));
    assign TC3 = (temp & (E1F) & ~(E0F));
    assign PC4 = (~(P0F) & ~(P1F) & (E1F) & (E0F));
    assign TC4 = (temp & (E1F) & (E0F));

endmodule

/*-----------------------------Total Count(TC)----------------------*/
module full_adder(
    input wire A,    
    input wire B,    
    input wire Ci,   
    output wire S,  
    output wire Co 
);

    assign S = (A ^ B) ^ (Ci);
    assign Co = (A & B) | (B & Ci) | (Ci & A);

endmodule

module Register (
    input wire [3:0] IB, 
    input wire Button,      
    input wire Enable,       
    input wire Clear,       
    output reg [3:0] OB      
);

    always @(posedge Button or posedge Clear) begin
        if (Clear) begin
            OB <= 4'b0000;  
        end else if (Enable) begin
            OB <= IB;      
        end
    end

endmodule

module TC (
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
  
    assign D = (A ^ B) ^ Bi;
    assign Bo = (A & B) | (B & ~Bi) | (A & ~Bi);
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

    wire [3:0] and_sum, and_sub, and_w_sum;

    assign and_sum[0] = SA_PC_A0 & sum_result[0];
    assign and_sum[1] = SA_PC_A0 & sum_result[1];
    assign and_sum[2] = SA_PC_A0 & sum_result[2];
    assign and_sum[3] = SA_PC_A0 & sum_result[3];

    assign and_sub[0] = SA_PC_S0 & sub_result[0];
    assign and_sub[1] = SA_PC_S0 & sub_result[1];
    assign and_sub[2] = SA_PC_S0 & sub_result[2];
    assign and_sub[3] = SA_PC_S0 & sub_result[3];


    wire w;
    assign w = ~(SA_PC_A0 | SA_PC_S0);

    assign and_w_sum[0] = w & sum_result[0];
    assign and_w_sum[1] = w & sum_result[1];
    assign and_w_sum[2] = w & sum_result[2];
    assign and_w_sum[3] = w & sum_result[3];

    assign result[0] = and_sum[0] | and_sub[0] | and_w_sum[0];
    assign result[1] = and_sum[1] | and_sub[1] | and_w_sum[1];
    assign result[2] = and_sum[2] | and_sub[2] | and_w_sum[2];
    assign result[3] = and_sum[3] | and_sub[3] | and_w_sum[3];
    
    wire [3:0] selected_result;
    assign selected_result[0] = o1';
    assign selected_result[1] = o2';
    assign selected_result[2] = o3';
    assign selected_result[3] = o4';

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
module VI(input P0,P1, input [0:3]AS, output VI, output SA);
 // PT : Person Type 
 // AS : Allocated Seats
 // MC : Maximum Cpacity
 // SA : Seat Allocation
   wire w3,w2,w1,w0,a,p;
   assign w3 = (AS[3]&(1'b1)) | (AS[3])&((1'b1));
   assign w2 = (AS[2]&(1'b1)) | (AS[2])&((1'b1));
   assign w1 = (AS[1]&(1'b1)) | (AS[1])&((1'b1));
   assign w0 = (AS[0]&(1'b1)) | (AS[0])&((1'b1));

   assign a  = (w3 & w2 & w1 & w0);
   assign p  = (P0|P1);

   assign VI = a;
   assign SA = ~(p|a);

endmodule

/*-----------------------------LED---------------------------*/
module EmergencyAlarm(ALARM,EA_LED,EAI);
    input ALARM;    // ED : Emergency Data
    output EA_LED, EAI;   // EA_LED : Emergency Alarm LED ,  EAI : Emergency Alarm Indicator

    assign EA_LED = ALARM;
    assign EAI = ALARM ;                       
endmodule


module LED(VI,EAI,TCI,LED);
    input VI, EAI, TCI;  // VI: Vacany Indicator, EAI : Emergency Alarm Indicator, TCI: Time Count Indicator
    output LED;          // LED of a paricular event

    // Data-Flow
    assign LED = (VI | EAI | TCI); 
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

module JKFF (
    input wire J,         // J input
    input wire K,         // K input
    input wire Clk,       // Clock input (trigger on the falling edge)
    output reg Q          // Output
);
    always @(negedge Clk) begin
        if (J == 1'b0 && K == 1'b0)
            Q <= Q;        
        else if (J == 1'b0 && K == 1'b1)
            Q <= 1'b0;     
        else if (J == 1'b1 && K == 1'b0)
            Q <= 1'b1;     
        else if (J == 1'b1 && K == 1'b1)
            Q <= ~Q;          
    end
endmodule
/*-----------------------------------------------------*/
