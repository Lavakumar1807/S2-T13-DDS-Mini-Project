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
  <summary>Detail</summary>
  Your team details go here
</details>

## References
<details>
  <summary>Detail</summary>
  Your team details go here
</details>
