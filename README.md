# State Machine For Live Event Navigator

<!--First section-->
## Team Details
<details>
  <summary>Detail</summary>
  
  > Semester : 3rd Sem B. Tech. CSE

  > Section : S2 

  > Team ID : S2-T13

  > Member-1 : Bade V N R Mahi Tejesh Reddy , 231CS216 , badevnrmahitejeshreddy.231cs216@nitk.edu.in

  > Member-2 : Desu Sai Chaitanya , 231CS220 , saichaitanya.231cs220@nitk.edu.in

  > Member-3 : Lava Kumar Tentu , 231CS230 , lavakumartentu.231cs230@nitk.edu.in
</details>

<!--Second section-->

## Abstract
<details>
  <summary>Detail</summary>

  1. **Motivation**:
   There are situations where people do not know about the events happening and feel unsatisfied
after choosing an event to go to. This project aims for providing a clear blueprint of the event
by classifying all sub-events and problems that are faced in events. So, this event navigator
suggests the individual to proper event according to their interest. This makes the individual
more satisfied and enjoy the event.
This also helps the event manager to conduct further events based on the strength attended
to each event and tracking the major interest of people attending their events.

2. **Problem Statement**:
   Our project focused on building a state machine for live event navigator utilizing the con-
cepts of digital systems, aims for easy navigation between the events going on in a concert or
exhibition. This system puts forward an innovative solution to the individual by keeping them
conscious of the ongoing events through various mediums. It focuses on people’s satisfaction
and their experience towards the event.

3. **Features**:

   •  **Categorizing by event type**:</t>
   > Categorizing by event type helps in organizing events
into various groups based on their characteristics.
   
   •  **Switching between events**:
   > This feature allows individual to navigate between events
easily.

   •  **Seat Allotment**:
   > This dynamic allocation feature allows individual to identify current
availability of seats.
   
   •  **Ticketing system**:
   > This type of system facilitates tax payers and differentiates them
from others.
   
   •  **Time**:
   > Indicating the time helps the individual to know the current status of the event.
   
   •  **Emergency Alarm**:
   > Featuring emergency alarm helps the people to vacate the event
immediately during unfortunate disruptions.
   
   
</details>

## Functional Block Diagram
<details>
  <summary>Detail</summary>
  
  ![S2-T13-draw.io](https://github.com/Lavakumar1807/S2-T13-DDS-Mini-Project/blob/607aad88e5306787821d21be0d134003052b2f7a/Snapshots/S2-T13.draw.io.png)
</details>

## Working
<details>
  <summary>Detail</summary>
  <h3>Outline : </h3>
  
  <p>Usually when a person enters the auditorium or exhibition, there will be numerous
 events going on there. There will be a LED corresponding each event and it lights up when
 the event is going on and has seats available in it. Among the events going on there, the
 person has an option to choose the particular event he likes the most and he can choose that
 event which he wants to go in. After going to a particular event, after some time, he can also
 switch to another event based on his interest and wish, if there are seats available in that event.
    
 There is a special facility for VIP’s or Tax Payer’s, as they can enter any event going on,
 on their wish, independent of seats available in that particular event. Similarly, during switch
ing of an event, seats availability of that event was not considered for them.

 There is also one more facility available for volunteer’s and workers attending the event, where
 they are allowed directly into the particular event without any regulations.</p>

 <h3>Main Process : </h3>

 <p>Initially a person will be entered into the event accordingly to the inputs, where the inputs are person type and vacancy of the event.

If the person entered is a part of general audience then he'll be allowed according to the vacancy denoted by the vacancy indicator, which is constructed using comparator. At this point of time both the present count and total count of the participants will be incremented, where the present count is implemented by using adders, subtractors, registers and total count is implemented by adders, registers. In the case of completely occupied event, he'll be allowed to choose other events accordingly to the same circumstances. Even after entering the event we have a possibility of switching into other events which is co-ordinated by Event switcher, which is developed using basic logic gates. In this case of event switching, present count of the event will be decremented and present count and total count of the event he wants to switch will be incremented.

Correspondingly to the other input of person type denoting worker or volunteer, the event that they wanted to check-in will be directly permitted without considering any seat availability. Since the person was either volunteer or worker, both the present count and total count will not be incremented as don't occupy any seat.

And finally, the last input from person type which indicates a VIP, again in this case the person will be allowed into the particular event that he wanted to visit without considering any vacancy terms. But only the total count of that event will be incremented without disturbing the present count of that event. Even during the time of switching, this particular kind of inputs are directly allowed into event with only total count increment.

We will be having a Emergency alarm and a time counter, which are directly connected to a LED representing each event individually, including a vacancy indicator where it indicates the audience regarding the current possibility of getting into that particular event.
</p>

<h3>Flow Chart : </h3>

![Flow-Chart](https://github.com/Lavakumar1807/S2-T13-DDS-Mini-Project/blob/90429d8379098fcf0efff77102b811ff3fa7471a/Snapshots/Flow%20Chart.draw.io.png)

<h3>Modules Used : </h3>

> Seat Allocator : 

![TT-1](https://github.com/Lavakumar1807/S2-T13-DDS-Mini-Project/blob/90429d8379098fcf0efff77102b811ff3fa7471a/Snapshots/Seat%20Allocator%20Truth%20Table.png)

<p>PC1 = !(P1F + P0F + E1F + E0F)
  
 TC1 = ((!P1F . !P0F) + (P1F . P0F)) . (!E0F . !E1F)
 
 PC2 = (!P1F . !P0F . !E1F . E0F)
 
 TC2 = ((!P1F . !P0F) + (P1F . P0F)) . (!E0F . E1F)
 
 PC3 = (!P1F . !P0F . E1F . !E0F)
 
 TC3 = ((!P1F . !P0F) + (P1F . P0F)) . (E0F . !E1F)
 
 PC4 = (!P1F . !P0F . E1F . E0F)
 
 TC4 = ((!P1F . !P0F) + (P1F . P0F)) . (E0F . E1F)</p>

> Main Person Type :

![TT-2](https://github.com/Lavakumar1807/S2-T13-DDS-Mini-Project/blob/90429d8379098fcf0efff77102b811ff3fa7471a/Snapshots/Final%20Person%20Truth%20Table.jpg)

<p> P1F = (!Switch . P1) + (Switch . !P1)
  
 P2F = (!Switch . P0) + (Switch . !P0)</p>

> Main Event Type :

![TT-3](https://github.com/Lavakumar1807/S2-T13-DDS-Mini-Project/blob/90429d8379098fcf0efff77102b811ff3fa7471a/Snapshots/Final%20Event%20Truth%20Table.jpg)

<p>E1F = (!Switch . E1) + (Switch . !E1)
  
 E2F = (!Switch . E0) + (Switch . !E0)</p>

> Event Switcher :

![TT-4](https://github.com/Lavakumar1807/S2-T13-DDS-Mini-Project/blob/90429d8379098fcf0efff77102b811ff3fa7471a/Snapshots/Count%20Subtractor%20Truth%20Table.jpg)

<p>S1 = (Switch) . !(P1' + P0') . (!E1' . !E0')
  
 S2 = (Switch) . !(P1' + P0') . (!E1' . E0')
 
 S3 = (Switch) . !(P1' + P0') . (E1' . !E0')
 
 S4 = (Switch) . !(P1' + P0') . (E1' . E0')</p>

</details>

## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>

  <h4>Main Circuit</h4> 

   ![Main Circuit](https://github.com/Lavakumar1807/S2-T13-DDS-Mini-Project/blob/6c8b3c78f93405a58323935246eea64b4a912bbb/Snapshots/Main%20Circuit.png)

   <h4>Seat Allocator Module</h4>

   ![Seat Allocator](https://github.com/Lavakumar1807/S2-T13-DDS-Mini-Project/blob/6c8b3c78f93405a58323935246eea64b4a912bbb/Snapshots/Seat%20Allocator.png)

   <h4>Vacancy Indicator Module</h4>

   ![Vacancy Indicator](https://github.com/Lavakumar1807/S2-T13-DDS-Mini-Project/blob/6c8b3c78f93405a58323935246eea64b4a912bbb/Snapshots/Vacancy%20Indicator.png)
   
   <h4>Time Counter Module</h4>

   ![Time Counter](https://github.com/Lavakumar1807/S2-T13-DDS-Mini-Project/blob/6c8b3c78f93405a58323935246eea64b4a912bbb/Snapshots/Time%20Counter.png)
   
   <h4>Register Module</h4>

   ![Register](https://github.com/Lavakumar1807/S2-T13-DDS-Mini-Project/blob/6c8b3c78f93405a58323935246eea64b4a912bbb/Snapshots/Register.png)
   
   <h4>Event Switcher Module</h4>

   ![Event Switcher](https://github.com/Lavakumar1807/S2-T13-DDS-Mini-Project/blob/6c8b3c78f93405a58323935246eea64b4a912bbb/Snapshots/Event%20Switcher.png)
   
</details>

## Verilog Code
<details>
  <summary>Gate Level</summary>

    
  ```verilog
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

```

</details>

<details>
  <summary>Data Flow or Behavioural Model </summary>

   ```verilog
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

  ```

</details>

<details>
  <summary>Test Bench</summary>

  ```verilog
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
  ```
</details>

<details>
  <summary>Output</summary>

  ![Output](https://github.com/Lavakumar1807/S2-T13-DDS-Mini-Project/blob/c510cbb455572e7caf46206b322d16a77a544ad3/Snapshots/OUTPUT.png)
</details>

## Hardware Implementation
<details>
  <summary>Hardware</summary>
  <p>The hardware implementation was a bit long process, which consisted of soldering, wire cutting,
making bases into PCB’s and implementing all the circuit that we have did in logisim. Due to the
time and material constraints we have scaled down our project accordingly to the resources provided.</p>
  <p>Our project was scaled down to 2 input events, which is implemented as 4 inputs in logisim. Initially
we wanted event type input as a 2-bit input, but we scaled it down and implemented with 1-bit
input.Then we accordingly implemented it in hardware.</p>
  <p>Initially we have been provided with 2 PCB’s and the bases separately, we soldered the bases into
PCB’s and then we have soldered the wires into the positions accordingly to the IC’s we wanted to
use. Finally we implemented in the order of individual modules</p>
</details>
<details>
  
<summary>Components Used</summary>

> 4-bit Comparator ( 7485 ) - For Vacancy Indicator

> 4-bit Parallel-access Shift Register IC ( 7495 ) - For Seat Allocator

> 4-bit Adder ( 7483 ) - For Seat Allocator

</details>

## References
<details>
  <summary>Detail</summary>
      <p>Digital Logic and Computer Design By M.Morris Mano</p>
      <a href="https://www.geeksforgeeks.org/digital-electronics-logic-design-tutorials/">Geeks for Geeks - Digital Electronics</a>
  </li>
</details>
