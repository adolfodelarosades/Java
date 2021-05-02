# 3: Creating Use Case Diagrams

1. Creating Use Case Diagrams - 54m
2. Lab 3: Creating Use Case Diagrams - 9m

## 1. Creating Use Case Diagrams - 54m

So module 3, we talk about use case diagrams. This is the first activity which is performed as a part of requirement gathering. In this lesson, we will talk about the need for a use case diagram.

We will identify and describe the essential elements of a use case diagram, develop use case diagrams for a software system based on the goals of a business owner. We develop elaborated use case diagrams based on the goals of all the stakeholders, recognize and document use case dependencies using UML notation for extends, includes, and generalization. And we describe how to manage the complexity of use case diagrams by creating UML package views.

So this is the process map for z this lesson. We are into requirements model. And we will perform the activity to meet the stakeholders to identify the various business requirements and meet the other stakeholders to identify the additional requirements to refine our requirements or to refine our use case diagram. So let's begin with justifying the need for a use case diagram.

Use case diagram helps us to model the high level functional requirements which are required to satisfy the user's goals. The business analyst can directly create a use case diagram when the business analyst meets the stakeholders to note down all of the high level functional requirements. Or the business analyst can make the textural nodes. And from those nodes, the use case diagrams can be created later.

Use case diagram acts as a common language to communicate between the stakeholders and the business analyst. And it provides the big picture view of the system to the stakeholders. Like, stakeholders can get the details of the identified functionalities for the various departments.

Say, for example, all the functionalities of sales departments can be put in one group of use case diagrams. All the functionalities of, say, manufacturing department can be put together. And the use case developments which are created can act or can serve as the basis for the further then details which are to be identified for the functional requirements. That is, low-level functional requirements can be retrieved from further analyzing these use cases.

Use cases can also be privatized, depending upon the complexity, depending upon the business needs, and depending upon the other use cases with which these use cases interact with. And the use cases which have minimal dependencies can be created or can be developed together. To create use case diagrams, we need to understand the various elements of use case diagram.

So the various elements are that actors. Actor is a role which communicates with the rest of the system. We can create a system boundary, which is an optional element in the form of a rectangle. And at the top of this top left corner of the rectangle, we write the name of the system.

Inside the boundary, we can specify the various use cases which depicts the various functionalities within that system. And the association between the active and the use case shows that which actors will activate or interact with which use case. So these are the various elements of the use case diagram. Now, this is an alternate view of the use case elements.

Here, we need to take a look at two major aspects. Number one, the managed reservation use case has association with two different actors. That shows the single use case can be interacted by various actors.

And a single actor is communicating with two different use cases over here. Receptionist interacts with a check-in customer as well as with manage reservations. So two important things over here in this diagram. A single use case can be communicated by multiple actors or a single actor and communicate with multiple use cases.

Let us take a look at individual elements in the table. First, we talk about actors. Actor is not a physical entity.

Actor represents a role that is external to the system boundary. It will never be a part of the system. From the outside, actor communicate with the system.

Now, who can be the actor? Actor can be a human being like a booking agent or a receptionist or any data entry operator. Actor can also be a device.

Maybe you have some system. We developed one system long back where a food crusher was one main functionality system. And there was some other devices which were communicating with that, with the main system.

So a device can be an actor. Maybe you are taking some information from some electrical current to your computer which you want to digitize later. So that can be an actor.

Another complete system can be an actor. Maybe one application is providing information to another application. So that can also be an actor. In your system, you can have the time bound activities. Maybe in the midnight, 3:00 AM, you'll want to take up some backup.

So nobody except then the time of your system will initiate that particular process. So that can act as an actor. So overall, we understand that actor is someone who will communicate with the system who can initiate certain functionality.

So there can be two categories of actors. Actors can be primary actors or secondary actors. Primary actors are those actors who initiate the process and who control the overall system, who are always available throughout the use case. And the secondary actors are those actors who participate with the system only for a part of it.

So maybe I make the hotel reservation. So booking agent is a primary actor because he or she is the one who initiated the process. And once all the details of the reservations are done, you want to communicate with the external payment system for the payment guarantee. So payment guarantee acts as a secondary system because it is participating.

It is external your system. But it is participating in the system only for a part of it-- partially. So a single physical instance of human, device, or a system can play different actors because it is not physical.

Actor is a role. When I say booking agent, booking agent may represent the customer itself. Booking agent may represent any third person who is booking a room on behalf of somebody else. Or it can be a travel agent system which is making the bookings for its customers. So this is about actors.

Now, here we can see all the various symbols which can be used, various icons which can be used, for actors. If your actor is a human actor, we will use this particular symbol or icon. If the actor is a system or a device, we can use a rectangular box with a stereotype specifying its name, right?

Maybe I can create an actor like this. And here, I can see that voltmeter or ammeter is the external system. So this is an actor which is providing some kind of information to the rest of your system.

Or if it is a time which is acting as an actor, we may draw a clock symbol. A clock icon can be used for a it time trigger mechanism. Next is the use case element. Use case element is shown by an ellipse. And the name of the use cases is written inside it.

The name of the use case is usually a verb known pair. It should not be a very long sentence. It should be usually a pair. For example, create reservation or cancel reservation, update reservation, make payment. So these kind of names can be used.

A use case is independent of the user interface. The user may provide the information. But use case is not tightly coupled with the inputs which are given. Or, you can say it is not tightly coupled with the UI.

What do we mean when we say, it is not tightly coupled with the UI? For example let us take an example of a managed reservation itself. Now, somebody can manage the reservation on book the reservation by using a web page. Somebody else may provide the details or may book the reservations through mobile.

But the client can be the web page or the client can be [INAUDIBLE] which is deployed onto the mobile. But your use case will not to depend upon the client because it is only dependent upon what the information it receives. By what means it receives the information, it is immaterial.

Then we have system boundary. Now, this is an optional element. We can see there are two representations over here. The first one is just listing all the use cases and their actors and their associations. So there is no system boundary over here. But on the right hand side, we can see the boundary.

So if we are creating a boundary outside the use cases, than it is mandatory that you write the name of the system. Preferably, I will prefer always to use the boundary because this gives me a sense of definitiveness-- that what I'm doing, what I'm talking about. So it is preferred that we draw the boundary.

But of course, it is optional. It depends upon a personal choice. Then we have use case associations.

Now, when the actor wants to interact with the certain functionality, that means the actor is associated with that particular use case. And this is shown by drawing a solid line from the actor to the use case.

So use cases can be associated with more than one actor or a single actor can be associated with multiple use cases. Now, most of the time, we draw a straight line. And we do not show any arrows or navigability from the actor to the use case because it is always from the actor to the use case. But there are some tools, UML tools, which will draw an arrow at the end of the line towards the use case from the actor when the use case is drawn, when the association is drawn over here.

Now, how do we create the initial use case diagram? The main aim of the use case diagram is to capture the high level functional requirements. And the business analyst goes and meet the business owner to identify all those functionalities, high level functionalities, which are significant to the business.

A use case diagram can be created during the business meeting itself, as you can see. As the business owner is stating this, this, this are the requirements, the business analyst may create the diagram on the spot. Otherwise, alternatively, the diagrams can be created after the meeting is over from the textual notes which are recorded at the time of the meeting.

Now, here is a simple case study where we consider that the textural notes were recorded. And from these textural notes, we will create our first use case diagram. So the study goes like this. We say the booking agent, considered as internal staff, must be able to manage reservations on behalf of customers who telephone or email with the reservation requests.

The majority of these requests will make a new reservation. But occasionally, they will need to amend or cancel reservation. The reservation holds one or more rooms of a room type for a single time period and must be guaranteed by either an electronic card payment or the receipt of purchase order for corporate customers and the travel agents. These payment guarantees must be saved for future reference.

A reservation can also be made electronically from travel agent system and also by customers directly via internet. It continues. The receptionist must be able to check in customers arriving at the hotel. This section will allocate one or more rooms of the requested type. In most cases, a further electronic card payment guarantee is required.

Most receptionists will be trained to perform the booking agent tasks for customers who arrive without any booking or need to change a booking. The marketing staff will need to manage promotions, special offers. Based on a review of past and future reservation statistics, the marketing stuff will elaborate on the detailed requirements in a subsequent meeting. And the management needs a daily status report which needs to be produced when the hotel is quiet. The activity is usually done at 3:00 AM.

Now, before I show you the diagram, let us just like to identify it. So we said a booking agent is one actor. Then we talked about the reservation, the receptionist. We also talked about the marketing agent. And we talked about the payment system.

We talk about the sales representative. We talked about the receptionist. And we talked about the booking agent.

So here, if we draw our systems-- I will not cover all over here but the major ones-- we also talked about the time. So we said time related activity is there, right? So the booking agent can make reservation or managed reservation.

The receptionist will also make reservation. It also performs something else called as a check-in activity. So, marketing person will be able to talk about the promotions. And here, we talk about the status report which is associated with the time.

Reservation is also associated with the payment system. So this can be our first view. But let us take a look at the diagram provided over here.

We can identify the travel agent system, the online booker, the booking agent, and the receptionist. Now, what I draw on the board, all of these three were considered together as a single entity or a single type of an actor called as a booking agent-- a common terms used, right? So we can do this.

We can write only the booking agent. And we can write a note on the side where we say, booking agent represents, the booking agent, online booker, and the travel agent system. So this can be another way to represent it.

But if we wish, we can represent all individual actors, all communicate with the managed reservation. A receptionist communicates with the check-in customer for those reservations which are not booked previously or if there are any changes in that. And the marketing actor manage promotions and retrieve the reservation statistics to know maybe there are certain offerings for the customers who have been very regular to this hotel and generate nightly status report.

So these are the various use cases is identified in the initial stage. So at the very beginning, we could quickly identify these five different use cases. Now, out of this travel agent system, online booking agent, a receptionist, nightly report that is timed, and the marketing all are primary actors.

There is one secondary actor. That is our electronic payment system. So this is about our identifying the initial use cases in any system or any hotel use case system.

Now, how do we identify the additional use cases? So we identify the initial use cases. Now let's take a look at how we can identify additional use cases.

During the meeting with the business owner, we can identify 10% to 20% of the use cases needed for the system on the spot. And then we meet the various stakeholders, the other stakeholders, like the users of the system or the managers-- so all of those various stakeholders who will, in one or the other way, will interact with the system. And we will identify the additional use cases.

For example, when we talk about make reservation-- so when we make reservation, we may identify something like this. Make reservation was our use case. Now when we say make reservation, we need to find the room for the reservation. Find room for reservation.

When you want to find room for reservation, we need to maintain rooms. We need to understand, first of all, the rooms must be created in the database. Second is when somebody vacates the room, the status of the room needs to be updated, right?

Or maybe some rooms become unusable. We need to delete those rooms. Rooms are of various types. Maybe there are deluxe rooms or there are normal rooms, OK? Or maybe there are some kind of rooms which are called as suites.

So we need to maintain the room types. So whenever we talk about two main use cases, maintain rooms is related to find rooms. And maintain room types is another one. So we identify the additional use cases. We identify the additional use cases.

Now, additional use cases can be identified in two ways. One, if you follow non-iterative process. If you follow non-iterative process, then all the 100% use cases need to be found out or need to be gathered in the beginning.

It's a intensive task and must be completed without fail. Because you may follow the strategy or methodology where there is no coming back. You cannot come back and identify the requirements once again. So this type of a non-iterative process, when we are following, we have to make sure that all the 100% use cases have to be identified in the beginning.

If we want to identify additional use cases in an iterative or an incremental developmental process, so there we find that we can discover almost 80% of the use case titles with 20% of effort. So that means we understand with 20% of effort, 80% of the system is almost ready. The rest of the 20%, we can discover over a period of time.

So these are the two different strategies for requirement gathering. If it is an iterative, we can keep on discovering the details or the requirements up to maybe, you can say, implementation phase or until even the development does not start, until we finalize all the design thing. And if it is a non-iterative, then we have to do everything 100% in the beginning itself. Not only that, once we identify the additional use cases, we need to elaborate our use cases.

For example, we said manage reservation or maintain reservation. So when we say make reservation, what do we mean by make reservation? Or maybe, the better word over here is manage-- manage reservation.

When we talk about managing of reservation, what do we mean by manage? So it includes you can create reservation. You can update reservation.

Maybe earlier, you booked for a single room. You need one more. Or maybe you booked for a normal room. And now you require a deluxe room. So you may want to make some changes.

Or maybe you will cancel your reservation. So mostly when we use the terms like manage, like maintain, normally what is happening, we are talking about CRUD operations. You may need to create. You may need to retrieve. You may need to update or delete.

So normally, what happens here, we can see on the slide now, the manage reservation use case now becomes create reservation, update reservation, and delete reservation. So it is broken down. It is decomposed into three different use cases.

So we need to understand that when we do this, we are actually expanding the high level use cases into more low level processes. So wherever there is maintain, wherever you have key words like maintain or process, normally we are talking about the CRUD operations. Process reservation-- what do we mean by process reservation or process account?

Maybe process account contains a lot of details about you may like to create a new account. Or you may update the details of a customer if the customer was today a regular customer. Due to the transactions, they become a privileged customer. So you're updating over there. But you're processing the account.

So we understand other high level use cases can occur. When we dig deep into other use cases, you may discover new use cases which can be high level use cases or low level use cases. Maybe you discover many use cases.

And you identify that there is one common use case coming into play into all the other use cases-- say, login. So for every operation, somebody wants to login. So what you can do-- you can bring it separate. Make it as a separate use case.

So here, we understand when you want to expand the high level use cases, so you say, one, we expanded manage reservations into Create, Update, and Delete. Now, another one is, it is kind of common sense. We said receptionist can perform the check in activities for the customer.

When the customer checks in, customer needs to check out. System doesn't speak about that. But certainly, the customer who has checked into the hotel has to take out. So this is another made to identify the related activities.

So these are the various ways we can expand our high level use cases. During expansion of use cases, we can identify certain cases where we can use inheritance patterns. And inheritance patterns can be applied to actors as well as to the use cases.

When actor inherits, when we create a sub actor, the sub actor will inherit all the use case associations from the super actor or from the parent actor. So when the use case is sub-classed, we can create multiple specialized use cases. Examples are here.

Let's first take an example of actor inheritance. An actor can inherit all the use cases from the patent or a super actor. Say, for example, we have a standard customer who performs all the standard services in the bank. And when the customer is specialized into a gold customer, the gold customer is a sub-actor of the standard customer.

That means the gold customer will perform all the standard services. Plus, it will be able to perform the gold services. So when the actor inheritance happens, the sub-actor will have the privilege to use all the use cases of the parent actor as well as can add the new ones. The condition is a kind of relationship or a rule must be satisfied.

That means gold customer is a standard customer. When we say gold customer is a standard customer, gold customer performs every activity what a standard customer can perform. In addition to that, it can perform some additional activities.

When we come to use case specialization. So it is more of a specialized use case. We can create a check in customer activity over here. Now, check in customer process is different for the VIP customer as well as for the standard customer.

Now, rather than writing two separate use cases individually, totally independent of each other, what we can do is we can create an abstract check in customer. From abstract check in customer, we can specialize two cases-- check in stand customer and check in VIP customer. So check in standard customer will perform all the standard activities. And check in VIP customer will perform all the activities in a different way.

The specialized use cases or sub-use cases can override some of the behavior which is incorporated in the parent use case. So use case specialization normally identified the significant variations in the various scenarios. And if the basic use case cannot be instantiated, that means they have not much common activities except the names. Then the base use case or the super use case must be declared as an abstract use case.

In addition to inheritance, there are two more kind of dependencies which we can use with the use cases. One is called as a include dependency and other is called as an extended dependency. Always remember this extend should not be confused with the Java extends keyword. That is different.

Include dependency is used when one use case always needs to execute or perform the other use case unconditionally. That means it can be considered like this that there is one bigger use case and a complex one. And you break its activities into multiple. So sequence-wise one after the other, all those use cases will be a part of the same use case. That is include dependency.

Extend dependency is where a use case will optionally execute another use case. Not always. So include dependency is shown over here.

We take a case study of a library book. We want to issue the book to somebody. And we say, OK, when they want to check out the book to a member, we need to identify the book.

And when we want to return the book, when we want to get the book back from the member-- member comes, want to return the book-- the book needs to be identified. Now, check out book and return book activities are not complete without identifying a book. So this is a case of include dependency.

Whether you want to perform any of these, identify book has to be executed. It is not optional. It is always. So it is a include dependency.

In the use case of a reservation, whenever we want to update a reservation or we want to delete a reservation it is must that we identify the existing reservation. Without identifying a particular reservation, we neither can update, nor can we delete. So this makes a case of include.

If you want to update reservation, first you need to identify reservation. If you want to delete a reservation, first you need to identify a reservation. So this is a case of include dependency.

Another case of include dependency is say we have a check in customer. Now, the receptionist actor communicates with the check in customer. And when the customer checks in, telephone system, which is a device, needs to interact with the check in customer activity because the telephone of a room needs to be activated.

So it does not give a clear picture of what activity is related with the actor a telephone system. So we prefer to break it into two. We decompose the check in customer activity into more elaborate activity.

We say, receptionist interacts with the check in customer. And check in customer includes enable room phone, which is to be communicated with the telephone system. So these are the various possibilities where include dependency can be incorporated.

So we saw when one use case has to execute another use case, in brackets always. Then it is a case of include dependency. When you have a single complex use case which can be decomposed into various activities maybe due to its over complexity or maybe due to multiple actors communicating with the same use case, we can break it into include dependency.

Let us take a look at extend dependency now. Extend dependency is for when one use case needs to perform the other use case conditionally. It is not always.

Here is a good example. When the member wants to return a book, the extension point says, issue a fine. Now, fine need not be paid all the time. It's conditional-- only and only if book is overdue.

Then we need to perform the issue a fine use case. Otherwise, it is not required. So when that is the case, when we use extend dependency, we divide the use case into two halves.

The first half contains the name of the use case, and the second half contains the extension point. Extension point tells under what circumstance the other use case needs to be performed. So we say, overdue book.

And here, normally as a note, we write what is the condition. So we say, extension point is an overdue book. And condition is, fine is due. When the book is overdue, fine needs to be paid.

Now, let us take an interesting dependency criteria over here. When it is extends, the dependency is from a optional use case to the main use case. And when it is include dependency, it is always from the main to the next one.

Because it shows that it is like a flow. It is a sequence. After check in customer, enable room phone must be executed. But in the next case we find, we say, OK. If the condition is true, then the issue of fine use case will jump into the main flow of the overall execution of a particular use case.

Now, in our reservation system, let us take a look. We'll review the use case scenarios for a significant and cohesive sequence of behavior. So we say, OK. Let us take a look at this.

When we create a reservation, we want to identify a customer who is booking-- for which customer the booking is being made. So there can be two possibilities. The customer has already visited the hotel.

When the customer has already visited the hotel, that means the customer data is available at the hotel. I don't need to create a new customer details. But when the customer is not already existing in the hotel database, what I need to do is I need to create a. Customer

So when I say create reservation, extension point is new customer. The customer has not visited the hotel earlier. We execute a use case called as create customer. It is just like something like this.

You must have seen many times. Maybe this is a web page. And you filled all the details. And you said, you know, create reservation, OK? When you click on this button, you will get another use case screen. It will say login.

OK, you have a username and a password. And it will say sign up or register. This is a case of extend dependency.

That means if you are existing customer, you will go here. This is your main flow. From here, you jumped over here. From here, you will go to maybe to make the payment details and so on.

But if you are visiting the hotel for the first time and you go to the sign up, sign up will open another screen for you where you will have the customer details. You will enter all the data, then you will click on Register.

Maybe they will send you a mail. And they will ask you to click on the link. And then you will be considered. And then you can complete the operation.

But this will not happen always. This is only when you are booking for the first time. When you book with the hotel for the second time, you will certainly go for this. So that means this is an optional dependency. So when it is optional dependency, it is considered as extend dependency for us.

So this is a combined example, now, of everything. We can see that we have more details over here. It's an interesting scenario.

You can see over here all of those three, four various actors have been accumulated or are represented by a single actor called as a booking agent like travel agent system and online booking agent. And all of those actors have come together. And here, we can see the booking agent can create a reservation.

When the booking agent creates a reservation, the extension point Create Customer is there, which is an extends dependency. And here, we write the details under what circumstances this is considered as extend dependency. The second one is a update reservation. And third one is a delete reservation.

In both cases, we have a include dependency where we say, identify existing reservation. Now, identify existing reservation, we are making as abstract. Because the user can identify reservation in two ways.

One, it can be identify reservation by reservation number, OK? Second, it can be maybe you provide a customer details. So that means here we can see various things, you know? This is a booking agent, right?

And we have create reservation. We have update reservation. And we have delete reservation.

So actor communicates with all the three. Here, we saw extend dependency in the case of a new customer. Here in both the cases, we saw include dependency in the case of identify reservation as a nation. Now, here we can see identify reservation is being given in two different ways. That is, by ID and by details.

Now, this is our inheritance. That is, it is an inheritance on use case. This is what we find over here.

So this is a use case inheritance. We can see all kind of dependencies coming over here-- extend dependency, include dependency, and generalization dependency over here. So in the down half of the screen, we have another dependency where the receptionist is there-- let me just make it over here.

Receptionist is there. Receptionist communicates with the check in. And check in communicates with the, you know, enable form. And here is a form system.

So this is a secondary actor. This is a primary actor. This is what we see over hear, OK?

So here, we can see extend is coming. Include is coming. Inheritance is coming. And here, another second case of include.

So this is our complete system. We understand these are the various possibilities. Or, it covers almost all the basic options. Now, in a normal software system, which is usually a nontrivial software system, we find that there may be many, many, and many use cases.

Now, how we can keep track or how can we manage this complexity? We can group the related use cases into certain packages. So here is an example we can see.

We identify in the hotel system four different categories of the use cases. We group them into front desk use cases, then maintenance use cases, reservation use cases, and marketing use cases. So front desk use cases are check in and check out.

Maintenance use cases are get room requiring maintenance. That means those homes which require the maintenance, the customer has just left. And the maintenance of the room needs to be done.

Then we have mark room as serviceable when the customers acquires the room. And mark it unserviceable because that is nobody staying in the room. Then we have marketing use cases.

We have managed promotions and retrieve reservation statistics to work out the various offers to be given to the customers. And reservation use cases, we will list all of those use cases which are related to the main use case like creating a customer, create customer use case, identify existing customer use case, perform payment, guarantee your payment, transaction use case, create, delete, and update reservation. So there can be more groups.

This is just an example to understand that how we can package the use cases. Now, we can show the packaging in a variety of ways. This is one way where we are just accumulating all the use case names and listing them together.

This can be another way to package the use case view. Say, for example, we can look inside the package and see the interaction between the actor and the use case. So here, we say marketing actor performs manage promotions and retrieve reservation statistics. So we understand that this is the interaction. So this is a more elaborative view of the package.

Now, here it is an example of the reservation package. So we say, what are the booking agent can create reservation, booking agent can update reservation. Booking agent can update reservation and booking agent can delete reservation.

So we list all the possible things. So extension point, create customer. OK? Extension point, create customer.

Then there is a extends dependency for all the three use cases when you create your reservation when you update your reservation and when you delete your reservation. In all the three cases-- let me put the arrow in the right direction-- perform payment transaction is required for all the three use cases. That is for create, update, and delete.

But this is extend. Another question is, how does it become extend? Under what circumstances we can think of that the payment guarantee will not happen?

Normally, we think that it must be a include use case. When I'm booking a reservation, it must be included that the payment guarantee has to be given. Now, say the booking agent asks for the rooms. And the available room list was being provided. And the customer or the booking agent did not find any appropriate rooms for the given dates.

That means whatever you were offering to the customer, customer declined it. Under that circumstance, payment guarantee will not happen. So in that light, we can say that perform payment transaction is considered as extend dependency and not an include dependency.

But whereas identify existing reservation dependency is a include dependency both for-- it is both for the delete as well as for the update reservation. And the electronic payment guarantee, of course, is a secondary actor. So we can see one primary actor, one secondary actor, one and two.

These are extend use cases and one include use case and three main use cases. Everything is put together in the package with all the details. So this is, again, a packaging of the use case views with all the details.

So you can see, if we go to the previous slide, this is elaboration. This is completely textural. Just, you are giving information what is related to what. And here, we give more detail.

And here, we give a complete detail with all the extended and included use cases. So this is how we can see. So with this, we come to the end of lesson number three where we learned about the use cases.

When these are created at the time of requirement gathering, it can be a first document to be created. And it gives some information to the stakeholders. What are the various elements? What are the optional payments?

What are the essential elements? How do you identify the use cases from a textural information which is given to you? How do you extend the use cases?

You expand them. You try to understand what are the various lower level use cases which can be identified from the main use cases. We also identify the various kind of dependencies. And in the end, we talked about the packaging of use cases in a variety of ways.

## 2. Lab 3: Creating Use Case Diagrams - 9m

Lab 3 contains five activities. Let us take a look at each one. That first activity is to identify the various use case diagram symbols. So in your Activity Guide, solutions are available. So we find Human actor node, System active node, Time actor node, Use Case, Annotation, and Association.

The second one talks about a study for the hotel system. So we provide the abstract for the additional requirements. So the textual node is there. We will convert this textual node into the various diagrams.

So we will see over here, various options are being given where the customer's bill needs to be calculated. And some customers will have a part of their bill guaranteed by the purchase order. Invoices for these charges will be charged daily or either printed or sent electronically to the company or the travel agent.

Or a customer who currently is checked in but have not yet checked out can be charged for food, beverages, and other services on their room account. So these are the various options. Room telephone is enable upon check-in and is disabled upon check-out.

This is the regular activity diagram which we studied in the lesson where we had Managed Reservation. We had Check In Customer, Retrieve Reservation Statistics, Manage Promotions, and Generate Nightly Status Report. So through this, we identify the various use cases like this.

So these are the various actors-- Travel Agent System, Online Booker, Booking Agent, Receptionist. These all communicate with the various use cases. We added a new actor called as Waiter who will add charges to the customer's bill because when the item is being brought, the charges are added to the bill.

And we will generate invoices daily. And it can be communicating with email system. We have a telephone system which will be enabled or disabled on check-in and check-out activity.

And all the other five are available, which we have already studied. So Check Out Customer, Add Charges to the Customer's Bill, Generate Invoices are the three use cases, along with their actors, which have been added over here.

In the third activity, these were our tasks. We had to read the abstract and create a system boundary. We can see we created-- the system boundary is available over here. And we also copy any of the actors or use cases from the previous diagram and added the new actors, added new use cases, and made new associations between the actors and the use cases.

The next activity is about another enhancement. We can see still more additional requirements. So we understand that the hotel group does not have currently a loyalty system, but the group is affiliated with the various airlines or allied services, like car rental companies or other, to gain the various reward points. So that means if a customer takes a complete package-- will travel by certain airlines or will use the car by certain vendors-- so then they will be given some points, some reward points. So depending upon and in addition to that, the customer who provided the phone number must be sent a text message as a courtesy message on the day of travel.

Cleaners can request a list of rooms that have been vacated so that the maintenance of the room can be done. And occasionally, there are discrepancies in a customer's bill. Therefore the receptionist may need to make adjustments to the bill.

Night auditors will request that the system generates a discrepancy report during the night. Based on this report, whatever the report is being created, the adjustments need to be made to the customer bill. And the duty of the night auditor is to complete, complete for that night only, when there are no more discrepancies left.

So what we need to do, we need to add new use cases, actors, and associations, expand high-level use cases, and refine the use case diagram with dependencies and inheritance wherever applicable. So we can see we are creating the package diagrams for the Night Auditor. Two activities are to be carried out-- Adjustment of the Bill, and Generating of Discrepancy Report.

Then there is a hotel Front Desk package-- Register Customer Loyalty Card, Make Adjustment to the Customer Bill, Check In Responsibilities, which include Change the Room Phone Status, and which also includes an optional activity, Perform Payment Card Transactions. Then we have Check Out, which again, it includes the room status, the phone of the room to be disabled.

And again, it extends the Perform Payment Cash Transactions. Some cash transactions may have been made. So these need to be adjusted over here. And the Loyalty Point System will add the loyalty points. So payments, of course, communicate with the external system. So this is in the Front Desk.

So you can see over here, it says that we create the package structure to hold the different use case views. And we copy the use cases, actors, association, everything from the previous diagram, refine the use case, refine the views by expanding any high-level use cases, and refine the use case diagram views by showing dependencies. So that is what we are doing for each and every package.

So this is a housekeeper. We have a Housekeeping package now where we Request the List of Vacated Rooms. And another use case is Mark Rooms as Ready For Use after cleaning and all that.

We have Marketing-- Creating Promotion, Modifying the Promotion, Retrieving the Reservation Statistics, and Publish Special Promotions to the Customer by email system. So these are the new activities which are being added. And here we have Reservation Service. We Notify Guest Today's Reservation by text messaging system.

And this is the overall view of all the packages. We have Marketing with the more use cases than before. We Create Promotion, Manage Promotion, Modify Promotion, Publish Special Promotions to the Customer, and Retrieve Reservation Statistic.

These are the actors, list of all the actors-- Front Desk Operations, Finance Operations, Housekeeping, and Reservation Services. So this was lab number 3.
