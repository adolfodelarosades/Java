# 5: Creating Activity Diagrams

1. Creating Activity Diagrams - 45m
2. Lab 5: Creating Activity Diagrams - 8m

## 1. Creating Activity Diagrams - 45m

In Module 5, let us talk about creating activity diagrams. Objectives of the lesson are to learn about essential elements and then to model the Use Case flow of events using an Activity diagram.

So we are still in a requirements model. And we will take the inputs from all-- whatever the mental model of the stakeholder Use Case is and Use Case from scenarios and everything. And we will create Activity diagram out of this. This is the symbol which is used in UML to depict Activity diagram.

Let us talk about what is an Activity diagram? When we collect a lot of functional requirements in the Use Case, we would like to validate-- we would like to model the flow of events. Now, we already did that. We did it in Use Case form.

Let us just review our activity, what we have done until now. Meeting the stakeholders and collecting the information in the form of Use Case. And then we studied these properly and did a lot of things. Made some expansions. Identify some additional Use Cases required over here.

To understand these stories and these requirements properly, what did we do? We created user stories in the form of Use Case scenarios. Now, when we had all of this information, what did we do? We created one additional form. What we call as Use Case form.

We created everything. Everything is available with us. But as we discussed yesterday also, that diagram is always preferred over text. So whatever is there in the Use Case form, whatever is there in the various places, we would like to model it in the form of all of [INAUDIBLE] activities so that we can give it to the stakeholders to see that whether we understood their requirements properly or not.

They have seen, in all this form, maybe when we draw a diagram-- Activity diagrams. Sometime people compare these Activity diagrams with flow charts. But of course, we cannot say it is a flow chart, because in flow charts we go even up to the level for declaring a variable and chewing showing every activity in detail.

Like here, I may say a deposit amount. Or I may say, identify customer. Or in that, I will take everything. I will put a for loop. I will get the search results. Return those values. And these are more elaborative.

So you can see somewhere in between, where I can be sure of, OK, I'm not missing any point. All activities are listed. So we would like to model the flow of events of any Use Case.

So in a way, we can say when we model the events, we understand that it helps me to validate my Use Case by reviewing the Activity diagram that is everything OK. So that is the purpose of any Activity diagram.

Now let's try to understand the various elements of Activity diagram now. So here we find every Activity diagram will have a start node and a stop node. We can see the difference in the symbol. A start node is just a filled circle, and here we have one empty circle around it. So this marks the beginning-- the start of the activity-- and the second one marks the end of the activity.

Then we have an activity node, which looks like a rounded rectangle. The name of the activity is listed over here. We will also find the two different kinds of nodes.

Now, again, this symbol looks much like a flow chart symbol, like a decision diamond, but here we can see that these are named as two different things. And we are not checking conditions all the time with this. When we have a branch node, it may usually be accompanied with a condition, which is called a guard condition.

Unlike flow charts, the condition is not returned within the node, but condition is returned outside the node in rectangular brackets. Else is also returned like a condition over here. So this is the way how we document the various conditions in the activity node.

This is just a simply another activity. And here is a merge node. Now, to look at the difference between a branch node and the merge node, let us take a look at this. Of course, we will talk about it in detail just a few seconds later, a few minutes later.

So here we see in the branch, there is one inflow. But in that case of merge, there are multiple inflows. That is the difference.

So we understand the various elements. We have the start node and the stop node. We have activity node. We have got conditions. We have branch and merge nodes. And not to forget, we have flow off activity everywhere, which is represented by an arrow sign. All over. It's all over the place. This is actually a linking thread, which links all of the various activities.

Now, this is another kind of an element in the Activity diagram. Sometimes we will have the activities which can run in parallel. There can be various reasons for that. We may be using multi-threading or we may be submitting the jobs to the multiple processors. Or there can be activities where the order doesn't matter.

So here is a scenario where the order doesn't matter. So we can see, we are to input three different informations. We have to input the name. We have to input the address and the phone number. And it doesn't matter whether you enter the name first or you enter the phone number first or you enter the address first. Doesn't matter.

So these activities can be shown in parallel. These can be considered as concurrent activities. Order doesn't matter. All the three activities take their own individual part, and any one can be completed before any one else-- any other.

These kind of concurrent activities are represented by another kind of activity element called as a fork and join bar. We begin with activity, and we draw a horizontal line. And we show the concurrent flows or out of order activities where the order doesn't matter.

Once those activities are completed, we close it. And we bring it to the end. Or we may continue to another activity , which may happen after all of these activities are finished. Maybe you have some common action to be taken when all the threads in your application are done with.

Now, in place of using all of these various nodes or activities, these activities can be other type of-- let me just show you a simple one over here. Let us-- it may not be as good as it is there on the diagram, but I think it will serve the purpose.

Say I'm showing two simultaneous activities over here, and these may represent the various-- sorry. Bad drawing. So here we go. So these may represent, say, two threads running. So one thread is, let's say, it is a gaming. So one thread is used for fighting, and other is animate some kind of words. So these are happening simultaneously.

So one thread it is used to how the bullets are fired, and the other one is used. The idea is that is not only the out-of-order activities that can be thread, it can be two different processes. Like maybe this process is about you are entering the data-- so data entry-- and here some printing process is going on. It can represent any different kinds of activities which are out of order.

Now, for these purposes, we use fork and join bar. Now, there is another term which we would like to be clear about. That is activities and actions. What is the difference between activities and actions? We did not see any particular element representing an action.

The reason for this is both activity and action nodes are same. We use the same symbol for activity. We use the same symbol for the actions. Now, activity can be divided into other activity actions, like if it is a big hotel system, we are talking about all the big systems over here. We can show here is a create reservation. And as a part of create reservation, you have print reservation details.

Now, print reservation details is a single action. It is producing some output. But create reservation is an activity. If we are showing these together as a part of one thing-- now, this can be representing a single action. This may represent the create reservation.

Now, normally when I want to say that it is an activity and it contains another sub activities, what I will do, I can use a small symbol like this. A spectacles kind of a symbol showing that more activities can be seen.

The details of the activity-- when this symbol is found-- when this symbol is found, you are telling that go and look at another place. There is a complete activity diagram.

So it depends upon whether you want to show this or you don't want to show this. But the difference between the activity and action is activity is made up of many actions together. An action can be considered as an atomic node.

It is an atomic node which represents a single action, which can either return a value to you or it can bring about the change in the state of your system.

Let us try to understand the various elements individually in detail, and then we were to draw our activity. Flow of control. It links two different nodes, and it shows the sequence of the activities.

For example, we understand when this is the start. This is the start. And from the start, it is the first activity. After first activity, we go to the second one. And then we say end. So this shows me the sequence or the order of the activities.

Then we have branching. Branching is used where there is a conditional flow. Maybe want to make some checking, like an IF statement. So here we see an example of a branching. The branch node has one inflow and will result into multiple outflows. Not necessity two. It can be sometimes more than two.

So here, say we have main menu. And here, we will show a single activity. And I may show three different flows from here. Say, entry of data and deletion and, say, updation. So we can have more than two outflows.

But the inflow is always one when we are talking about the branch node. And usually, it as accompanied with a condition. So customer found, customer not found. So with every outflow, I will have another condition. Say, for example, I can say option one, go to entry. Option two, go to deletion. And option three, I can say updation. And so on.

So this is about our branch node. When we have a branch node, usually it is accompanied with a merge node. Now, merge node is different. Merge node's purpose is to unify all the actions back. So you will see, it will have multiple inflows and a single outflow. So once the conditional-- all conditional activities are over, you would like to unify everything together. And you will go to the single flow.

Now, these branch nodes, in the actual scenarios, there can be something like this. The complex Activity diagrams. Maybe from here, it will have its own branch node. You will go. It may have its own branch node. It depends upon how complex your logic is. How much diversification of the activities are available.

But ultimately, we make a node from all different sources, and we will have a single merge node coming out like this. This can be the scenario. It depends upon-- not necessarily always have to be very complex or very simple. It depends upon what do we want to do.

Now, in Activity diagrams, we can also show that iterations. When we want to show the iteration, we can see the first diagram represents something like a while-do loop. Now, the while-do loop is a pre-tested loop. That means you first check the condition, and then you take an action.

In such a scenario, we will perform certain regular action when the time comes to perform the while-do operation. We will use a node over here, where you can see it is multiple inflows and there is a single outflow. So I cannot call it as a branch or as a merge. This is how the design is.

So we make certain decision, and depending upon the decision, we take certain action. The conditions are returned over here. Here we say obtain a certain iterative. And we check the condition if there are more elements. We go to perform an activity. After performing the activity, we go back. And keep on going back until the condition does not come out to be else. So once the condition is else, you come out. In such situations, you will not find a pair of nodes, but you will find a single node.

The second one is a condition-- is a loop where you are performing a post-test condition. So in the post test, what happens? You start up with a node. You perform certain action. And then you need to check a condition.

Now, once the condition is true and you need to go back, you need a reference point where you have to go back. So you say, go back to this node. So this, going back to the node-- like a merge node, you can see that it receives multiple inflows and it ends up going for a particular activity, again going for the condition, and so on.

So this is the way, in UML Activity diagram, how can we show the various types of loops. You must be wondering, there is no for loop over here, which is very popularly used with the programming. Then nature of the for and the while are both pre-tested. So if we are using a for loop or we are using a while loop, we can use the same way.

Now, another is a concurrent flow off control. So this is done by a fork and join bars. These represent threaded activities or parallel user activities, all the activities where the order doesn't matter-- the sequence doesn't matter. We can perform the activities in any order.

How many activities within the fork and join bar are listed? That shows the multiplicity indicator. Say there are four activity nodes within a fork and join bar, and you are representing a concurrent activity. That shows four concurrent threads will be executed as a part of this. So this is how we show.

Now, another interesting scenario. When we perform certain activities, there can be a chance that one activity returns some information. Or you can say, one action returns certain information. And that information-- that data-- we want to send to the next action or to the next activity for the purpose of processing or for some other purpose.

Now, how do we show that? To show that we create a certain activity node over here. And we draw a small rectangle. This is called as a pin. If we are using a pin-- say, for example, I say order over here. This is a received order. I can also be more explicit, where I say received order.

So this activity is a returning received order. How do I understand it returns? When the pin is used at the lower end of the activity, that is a return value. I have maybe another activity over here. And here I will use. So I will pass it like this at the upper hand end of the activity-- so I will say received order. And

Now, this also wants to return to another activity. So I will say processed order. So the position of the pin, if it is at the top, it is it can be considered as a parameter passed. And if it is at the low end, it can be considered as a return value from that particular action.

So we can use pin. Pin is a connection point of an action for object input or object output. Output is always a return value, input is always a parameter to a certain method or an action. The name of the pin will show what object is being passed. Like we can see over here, it says order received, order processed, order shipped.

Now, another interesting fact about the Activity diagrams. Activity. What does it do? It is just showing you the various actions being taken place in a particular Use Case. So maybe you perform certain activities as a group.

When you want to show the object grouped into a certain partition, in the previous versions of UML, we used to call these as swimlanes. Now we call these as partitions. Partitions-- you can show the partitions vertically or you can show them horizontally or you can show these partitions both together. Depends upon how you want to do your grouping.

So here we can see, it gives me more information. I understand the order is received in the sales department. And the order is processed in the manufacturing department. And the order is shipped via order dispatch department. So I'm just saying, normally we will see a very common partition between a user and a system. The activities which are taking on the user end, and the activities which are being executed in the system end.

So this talks about the partition in Activity diagrams. Another interesting thing which can be used in the Activity diagram is the signals. Now, signals can be compared to interrupts. These are always coming from a source external to your Use Case-- external to your activity.

There are two kinds of interrupts or signals which can be used over here. One is the Accept Event Action as a result of certain event. Maybe somebody was working-- actually working on the system. You didn't want to continue with a certain activity. What did you do? You pressed Control and scroll. That is an interrupt. That is a signal-- cancel signal.

But what is it? It is not a timed signal. It is some event. You pressed a key from the keyboard, and that even generated a signal, and your application received that particular signal. So you can have an action event signals. You can have time-based signals. Time event signals or accepting action signals.

So there can be another kind of a signal. You want to send the signal. When you want to send the signal, you will send the signal external to your activity. Whatever activity you are in, that sent signal will be external to that.

Here is an example. So we say present order details for confirmation. This is an activity. And you receive an order from outside. So this is an accept order signal. You accepted the order.

After you did that, you are continuing. Once you've finished that, you want to send it to another place. So you use another send signal called as a raise invoice. The whole process must be completed within 10 minutes. So we say, after 10 minutes, and we use an hour glass to show that it is a time signal. That means if the whole activity does not finish within 10 seconds, please proceed with cancel order activity.

Now, there is something more to the signals. Because of the presence of signals, what we can do, we can group the activities which can receive a common signal and perform some action as a result of this. We can do that by creating interruptable activity regions.

Like here, we say when we receive the order-- when we receive the order-- and when we are processing the order. It is possible that a customer can cancel that order. They changed their mind. They don't want this order to be carried out. So we can receive a cancel signal when we are in these two activities.

Now, because both activities can commonly receive a single signal, called as a cancel signal, we draw an interruptable region outside it. So we send the signal not to the activity, but to the region. So whatever activity is taking place, due to this cancel signal, it will proceed outside and it will start performing a cancel activity.

But once these two activities are done, and you are outside the interruptable region-- when the ship order activity is taking place, we cannot perform a cancel order activity, because you are outside that interruptable region.

Now, your activity diagram may contain multiple signal-- or, you can say, multiple interrupt regions. For example, this is-- I'm not drawing in the dotted line, just to save time. So I can have a group of activities. Activity one. Activity two. Activity three. And here I can have activity initialization and some other activities going on over here.

So here, I can say, a cancel signal is there-- sorry. A cancel signal is there. And here I can say, after 15 minutes. So that means there are two interrupts. When you are within this interruptable region, you can cancel these activities, and it may come out here, maybe to another activity called as end activity.

Or if there is no cancel signal, and you come out of this interruptable region successfully, or you are here in this region and the timeouts, then the outer interruptable region, you will fall into that category, and the required action will be taken.

Creating an Activity diagram for a Use Case. To understand how to create an activity diagram, we will take a look at the various steps. Number one, we will identify activities. Number two, we will identify branching and looping. And number three, we will identify concurrent activities.

Now, here we will see-- in the coming slides, we will see few activity diagrams. The first example is about the activities which are a part of reservation Use Case-- create reservation Use Case. So we see a diagram which will show the activities involved in identifying a customer.

So by either delegating the entry of the new customer details to the extension point directly or by entering a subset of a data for identification of the customer, we find the customer. And if there is no existing customer found, then the extension point is used. So let us see three different possibilities over here.

So we would like to take now-- take a note of a few things. First, there are two partitions. Some activities which are taking place on the active site, and some activities which are taking place on the system side.

You will see an interesting activity which is at the boundary of the both. That means with this activity, book the system and the actor are interacting. So these activities are put at the boundary. So let us begin.

Start of the activity happens by requesting the customer details. So we get the Customer Details. So there is one possibility that you directly opt to go for the extension point of a new customer. If that is the case, we haven't got condition. It is a new customer, and we go for extension point.

So the new customer extension point, after the details of the customer are entered, we end of the activity because that is our purpose. We want to either identify the customer, or we want to add a new customer if the customer is not existing.

The second possibility is we check if it is an existing customer. If the customer is existing, we enter the details. The actor enters the existing customer name and post code and send it to the system to search for the matching customers. If the customers are found, the list of all the matching customers is returned. From there, the actor can choose that correct customer.

Once it is being done, it will end the activity. And if the customer is not found, and now you want the go for the extension point. So from here, we can see we go back to the point once again where we say, OK, customer is not found, and I would like to go back to the extension point. Let us take a review of that.

Three possible cases were there. Number one, you request for the customer details. And you have decided that you want to go for an extension point. You know that it's a new customer. You will directly go to the activity, new customer.

Second possibility is you would like to take a chance. You are not sure. Maybe it's a new customer or its a existing customer. We get the details of the existing-- we assume that it's an existing customer, and we find that the customer is not there. Then we go for the extension point.

And the third possibility is you give the details. The system created the list of all the matching customers. Gave it to you, and you chose the required customer. So this is about how a part of a Use Case can be converted into an Activity diagram.

Now, there is another one where we take a look at the overall create reservation Use Case form. Now, whatever activities we listed in the Use Case form for create reservation, we will see how this use case can be converted into an Activity diagram. Let us take a look at this. Take a look.

So we begin with the activity by entering reservation details. Now, let us take a look at this. Two interesting points. One, you can see the outer dotted line, and then you can see here, one inner dotted line. So these mark two different interruptable regions.

So the first one-- the outer one, the bigger one-- is a cancel region. So what are the activities which are a part of the cancel region? Everything except delete unconfirmed reservation. So deleting it as reservation happens due to some kind of a rejection. Some side Use Case scenario.

So except that entering the reservation details, creating a new customer, finding out the existing customer, finding out rooms, upgrading rooms, calculating price, identifying a customer, payment guarantee-- everything, at any point of time, the customer can change their mind and cancel the reservation. So that is that outer interruptable region.

The inner interruptable region is where the activities are time-bound. So we can see the only activity which is not time-bound. One is-- both the activities which are not time-bound are not related to this current system. These are external.

One is actor inputting the data. Actor may take a long time to input the data. That cannot be considered as a part of the time region, where inactivity timeout has to happen.

The other is after everything is being done, confirm the reservation is there and you want to notify. Maybe you are sending an email, which is kind of happening in a batch processing. All the confirmed reservations are being put in a queue, and one by one, the system will keep on sending the mails.

So these two activities are outside the inactivity region. The rest-- everything-- is within the timed activity region. So let us take a look at the process now. So we understand, we enter the reservation details. And the first thing we check over here is if the date is valid. That was our business rule.

So if valid-- date when you check, if the date is invalid, you go back and you ask the customer to enter their details once again. So that is the very first activity. If the date is valid, we go to the next activity over here, where we say, OK, create new reservation. So we create new reservation. Reservation object is created.

And the next step is, once reservation is created, maybe you have filled in all the arrival date, all of the details, whatever the customer has given to you-- now what you want to do, you want to find the rooms. That activity has to take place on the system side. System tries to find the rooms, and finds that there are no rooms.

System can wait for another activity, upgrade rooms. And when the rooms are upgraded, it performs, once again, the find rooms activity. There can be a chance that there is no upgrade happening, so in that case, it will go back and if will ask the customer to change the details.

Maybe you are going-- you must have seen many times when you do a booking for [INAUDIBLE], it saves all of the seats are booked for this. So there are no available seats. So can you book for another date? So just like that, we can say, OK, there are no rooms available for this date. Would you like to have another alternate? Maybe you want to book for another date.

So if the rooms are found, then we calculate the price and record the price, that what is the price for each and every room, and we offer the rooms to the actor. Now, actor has to give it a response for this. If the response is reject, customer doesn't like the rooms, directly we can delete the reservation and end the Use Case. Delete and and. That can happen.

Now, if that is not the case, and if the client accepts the rooms, then the next activity happens. It is interesting to note over here, we go for identify customer. Watch out for this spectacle symbols. Activity to activity connection. That means, we say, go and look the details.

Identify customer is a completely different Activity diagram. Please go there, and check out the details. As of now, we understand that customer needs to be identified. How the customer is identified, that is described in a separate diagram.

So we say, OK. Once that is being done, then we come to the extension point, payment guarantee. Everything is OK. Now, all of these activities were to happen within a timeout activity region.

So that is being done. Now you are out of one interruptable region. You say, confirm reservation. You confirm the reservation, and you notify the reservation to the customer or to the booking agent, and then you end the Use Case. But in all of these activities, at any point of time, cancel interrupt can be generated, and it can be canceled.

Maybe if it is a web page, you can close the web page. Or if it is anything else, maybe you can press Control+C, take some action to show that I don't want to carry out this certain activity.

So let us just review this diagram once again. We saw all possible events happening over here, what we listed in the alternate flow and the main flow in the Use Case form. Of course, not every business rule is discussed over here, but all the major things are very much over here.

So customer enters their details. We check for the validity of date. If everything is good, we go for find rooms. If we find the rooms, we offer the rooms. Customer accepts the rooms. We identify the customer. Go for a payment guarantee. Confirm, and everything is ended. That's a successful scenario.

Customer enters details. Date is invalid. We can send back. Or the rooms are not available. Either we can wait for upgrade. If no upgrades are happening, we can ask the customer to go for another alternate dates.

There can be another chance. Everything is OK, and customer doesn't like the rooms. The rooms are rejected. And the activity can come to an end.

So with this we come to the end of lesson number 5 on Activity diagrams.

## 2. Lab 5: Creating Activity Diagrams - 8m

Let's take a look at Lab 5. So there are two activities. First one where we identify all the essential elements in an activity diagram. And the second one where we create an activity diagram to model a use case diagram.

So here is the first activity. We can see all the various symbols over here. Let us take a look at the solution to this. This is activity or action. We learned that activity and action symbols are same. Our decision or merge. We can say branch or merge. Initial activity. Final activity. Fork. Activity flow. Join. So these are the various symbols which we are using in an activity diagram. OK?

So the second activity is about creating an activity diagram. So in the previous lesson, we created a use case form for check in process and check out process. Like pre check-in and post check-in and check out. So we are looking at the use case form from the previous lab, lab number four. So your lab number four should be completed to come to this exercise. We create an activity diagram to represent the flow of events.

And we begin with the first activity, represent each activity from the use case form as an activity node. So we represent a complex set of activities as one activity node in the main activity diagram and then we show all the internal activities. So we will take a look at the solution.

Here is our main activity diagram. So we have a check-in start. We perform pre check-in activities. Doing that period, you are in the cancel pre check-in activity region. In that case, we can notify the receptionist to restart the check-in process. Maybe some data was not entered in a correct manner so you need to start all over again. And if it successfully completes the pre check-in activities then it will perform another activity that is a post check-in activities.

So let's take a look at individual activities over here. So first we take a look at post check-in activities. Post check-in, once the check-in is over, we change the reservation status to checked in. We change the status of the room to occupied, include the electronic room keys activity, include the change room telephone status to enabled. The phone is enabled.

And we create the bill for reservation. Now here we add the quoted charge to the bill. There can be two possibilities. We can notify the receptionist that check-in is complete or we can change the bill status to chargeable and then do it. In the first case, there is a payment guarantee for additional chargeable items. And if we directly notify the receptionist, that means there is a no payment guarantee for additional chargeable items. So post second activity ends over here.

Let us take a look at pre check-in. So we say pre check-in starts over here. And there are different possibilities. So request reservation number or request name. That means when you want to search for a reservation, either you can search by reservation ID or you can search by the customer's name. So when you say a reservation number, we search the matching reservation number and notify receptionist that no matching reservation is found. So the pre check-in can start once again. Maybe the number was not entered correct or there was no reservation at all.

Other can be enter the customer name. So when you enter the customer name, it searches for the matching reservations. There can be we can notify the receptionist of the summary of matching reservations. Or there can only be one matching reservation.

Maybe when you are talking about the customer, there can be same name of more than one customers and multiple reservations can be known. So in that case, we select one matching reservation. But if there is a unique name of the customer, then there is only one matching preservation. So valid selection is there. We notify the receptionist of the reservation details.

Maybe there is a chance that on the spot the customer wants to change the room. If the rooms have to be changed, then we will have two possibilities that rooms are accepted and extension payment guarantee will be performed once again. And here there are rooms not changed. So we respond back and we have extension point change assigned rooms. In that case, we will see that if rooms are accepted, we will go for the payment guarantee.

So over all thing is you are performing few activities over here. You are identifying the reservation either by number or by name. If it is by number, it will be always one reservation. So if it is not, there can be two possibilities. Maybe data entered was not correct or the reservation was not being made. If it is named, there is possibility that there are multiple customers with the same name and all those customers or some of those customers have made their reservations.

So you will have multiple reservations and you will select one out of these. Other can be once there is only one reservations. So you select the reservation. So once you select the reservation, maybe there can be a chance that customer likes to change the rooms. So then you will see the new rooms. And if the rooms are accepted, we will go forward extension point, that is a payment guarantee. We will accept. They'll respond if everything is OK. We will just finish the pre check-in activities.

So this is about lab number five. So we saw the detailed activities of pre check-in and post check-in activities. So if you are interested, you can do the activity. You can create the activity diagrams even for the checking out process.
