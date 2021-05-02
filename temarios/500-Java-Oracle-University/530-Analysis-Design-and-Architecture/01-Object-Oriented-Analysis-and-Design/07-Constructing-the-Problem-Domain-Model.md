# 7: Constructing the Problem Domain Model

1. Constructing the Problem Domain Model, Part 1 - 33m
2. Constructing the Problem Domain Model, Part 2 - 29m
3. Lab 7: Constructing the Problem Domain Model - 12m

## 1. Constructing the Problem Domain Model, Part 1 - 33m

After identifying the key abstractions, let us now try to build a Domain Model. Objectives of this lesson are to identify the essential elements in the UML class diagram, to construct a Domain Model using a class diagram, to identify essential elements in a UML object diagram, and to validate the Domain Model with one or more object diagrams. Overall, what we are going to do in this, we will identify the elements of UML class diagram. We will identify the elements of a UML object diagram.

From the key abstractions, we will build our Domain Model. And then, using object diagrams, we will validate our Domain Model. That is what we are going to do in this lesson. Here is a list of activities.

We are in the Requirement Model. Now, this is the last step in the Requirement Model. Next, we will move on to design. Now, in this, we finished the first step. We identified our key abstractions. Now, we will represent the relationships of the key abstractions in a Domain Model.

We will put all the selected key abstractions and their collaborations, their responsibilities, and we will build a model for a particular use case. And then we will verify the Domain Model using the object diagrams which we build from the use case scenarios. What is a Domain Model? As the beginning of the slide says, the sea of classes in a system that serves to capture the vocabulary of the problem space, also known as a conceptual model.

Now, the Requirement Model has three main views. And these three main views are a Use Case Model, then we have Supplementary Specification Document, and the third one we have is a Domain Model. So it is one of the major views in the Requirements Model. That is what we have.

The Domain Model represents the classes which we have identified and their collaborators and their responsibilities. So it will show the various classes, all the various classes, we can say, in a particular use case. Sometimes, we start creating it in such a way that we pick up one major class. And then we start building the nest.

You know, this class is related to this. This is this. This is how we start doing. Then we identify, OK, there is some more class available over here. So this represents a kind of Domain Model in a very raw form over here.

Let us first try to identify the various elements of a class diagram. The most important or the major component is the class node itself. The class node can be represented in a variety of ways. But here we can see we have a more simplistic view. We just draw a rectangle.

And we write the name of the class in that box. So this makes my Class node. So there are three class nodes represented over here-- a reservation, customer, and room. If you remember the previous lesson, we talked about the class responsibility collaboration card.

And on that card, we said that reservation is associated with a customer. And reservation is associated with a room. So it is a simplistic view where we say, reservations association with a customer, and reservations association with a room. So the class nodes are there. And the class nodes are linked by using associations.

The solid lines which we draw from one class to another class, we call it an association. Associations can be named. For example, we can read. When we write the name of the association, we can accompany it with an arrow. So this is how we will read it.

We will say a reservation is made for customer. If we write another association name, customer can make a reservation. So it depends upon how you write the name and how you write the arrow. So when we write the arrow from here, it is just an indicator of how we should read it.

We can say, reservation made for a customer. So here we can see, reservation has a reserved resource, which is room. So this is how we can depict it. So we talked about the class node. We talked about the association and the association name.

The class nodes can be accompanied with their role name, which shows how an object is participating in the association. So we can say, customer is participating in reservation process. Or room is associated with the reservation. So this is how we can write the various role names.

Now, in addition to that, we can also use multiplicity. Multiplicity tells us the number of objects which are participating in a particular process. So various elements, we can list out the class nodes, the associations, the association and the role name, and the multiplicity.

Now, class nodes can be presented in a variety of ways. So the first one we have seen in the previous diagram, just a rectangle along with the name of the class. In addition to that, class nodes can be depicted from a different perspective or from a various view.

For example, in doing analysis, the classes in a Domain Model represent a conceptual entity. So when it represents a conceptual entity, in the design workflow, a class represents a software element or a software component. It may represent a class name, or it may represent a component.

So how do we show what a class node is representing? That can be shown by using a stereotype. So we can use a stereotype in two ways. We can use a stereotype in an iconic form or in a textual form.

So I can write like this, entity, if the class is of entity type. Maybe the class is showing some kind of UI. I can say, boundary. If I don't want to use textual form, I can always use iconic form. So a circle and a tangent at the lower end represents an entity.

Or maybe, if I want to show boundary, I can show something like this. So these are the standard iconic forms which can be used. Normally, three iconic forms are used. One is for boundary. One is for service. And other is for entity.

And when I want to show it for service, I will show it like an arrow like this. So these are the various forms. We can write the stereotype in the class node, along with the class name. Or we can show an iconic symbol over here, representing what kind of component it is. Our class node represents which kind of component.

Is it an entity? Maybe it is an EJB Component. So in the stereotype, I will write EJB. Or maybe I can write a B in symbol or something like that.

There is another way to represent the class node where we do not draw any boundary for the class, but we just show an iconic symbol. And below that, we write the name of the class. The main thing to understand over here is at the different point of times, the class node represents a different view.

Like we talked at analysis time, it is more representing a conceptual entity. And at a design time, it actually represents the software component, which can be a class or which can be the whole component, like an EJB or a web component or something. So class node can also be represented in a more elaborate way where the class node can be compartmentalized.

So various compartments can be created over here. Like I will draw a big one over here to show. The first compartment will contain the class name. This is a class name compartment. The second one will contain the attributes of the class.

So this is an attribute compartment. The third one represents the operations. So we can call it as operations compartment. These three are very commonly used when we talk about a class diagram, a class node. There can be chances that we will have additional compartments over here.

Maybe I would like to show the exceptions which this class [? metered ?] scan through. Or I may like to write certain nodes about the class. Optional, but possible. So mainly, we will have three compartments attributes where all the attributes of the class are listed.

Attributes are nothing but the variables, instance variables, or class member variables which make the state of an object. I would not rather call these as class member variables. Let us talk only about instance variables. So operation compartment contains all the metrics of the class. And additional compartments, as we saw on the board, exceptions, notes, and so on, these can be added.

Now, when we talk about associations, now associations represent the relationship between the classes. Associations are manifested at runtime by representing the object references. So one object reference may communicate with another object using its object reference. That represents the association.

So here on the slide, we can see the reservation class is associated over here with the customer class. This is what we can see. Now, we can use the role names, which tells that customer and R-E-S-V, or cust and resv, are participating in this particular association.

So we can write, whatever labels we are writing over here, these are the role names. And what we wrote over here made for, that is an association name. That is an association name. So we understand reservation is made for customer. This is how we did it.

By showing an arrow, we understand that reservation is accessing the customer. And customer is not able to access the reservation just now. That is what we are trying to understand from here. But this can be represented in another specific way by using explicit navigability.

So when we do not show any particular arrow on the line, like sometimes, associations are represented like this. So the arrow will be there at the end of a line. That is a clear indication that navigation is happening from the reservation to the customer.

Now, multiplicity. Multiplicity tells how many objects are participating in a relationship. For example, here we say, 1 dot dot star and 1. So that means one reservation is made for one customer. That can be said if I write something like this over here, if I say 1, and I say 1, that means one reservation for one customer.

Multiplicity can be represented in a variety of ways. We can write 1 to 1. For example, one payment for one reservation. We can also write 1 to 3. Or we can write 2 to 4. That means a particular number. In general, we can write it as n to m.

So when I say 1 dot dot 3, or 2 dot dot 4, what we are trying to say, it can be two objects, three objects, or four objects participating. There can be another way. We can say 2 comma 3. That means either two or three. Or say, for example, I say 2 comma 9. So that means either two or nine are participating.

When there is a dot, it represents a range. And when it is a comma, it represents a fixed number of objects. Another commonly used is 1 dot dot star. That means one or many. We can also represent 0 dot dot star. This can also be represented just by writing a star.

So here we understand one customer can book one or more reservations. Customer and reservation is one to many relationships. So that means one customer can make one or more reservations.

So this is how we understand multiplicity. Then we have navigation. Navigation shows the direction of accessibility. Who will access whom? For example, we say reservation accesses room. And how do we get to know? Because we draw an arrow from reservation to room.

If we draw a straight line from reservation to room, it does not show any direction. By default, it is bi-directional. That means if you have a straight line from reservation to room, we understand that reservation can access room and room can access reservation. Here, when we show a single arrow, an arrow from reservation to room, it shows reservation can access room, but room cannot access reservation.

Association classes. Now, this is a special case where you have many to many associations. Now, many to many associations between two classes, here we are considering a case for employer and a person. One employer can be associated with multiple persons. That means with multiple employees.

And one person can work with many employers throughout their lifespan. So in this way, we see that employer and person, she has many to many relationships. Practically, we don't like many to many relationships, many to many associations. And we always try to simplify these. But we will see that in another lesson, in the Solution Model.

As of now, we understand. If there is no other goal, and we want to keep a multiple associations, that is, many to many associations, one of the solutions is that we can keep an association class, which keeps the details of the associations. For example, we can have a start date, end date, and final salary.

Sometimes, we prefer that the information which we provide in the association class can be inlined with the employer or with the person, depending upon how we want to access the data. But of course, there is an alternative. We can always go for an association class.

Association class can be mapped to an association table in a database. So where you can get all the details of the transactions which are happening among the entities, which are related to each other by many to many multiplicity relationship or associations. Now, we understood the various elements of Domain Model.

We talked about the class nodes. We talked about association. We talked about association names, role names, navigability, multiplicity. Now, how do we create a Domain Model? What are the steps? How do we go about it?

Number one, we draw the class nodes for each key abstraction. Or rather, I will go one step beyond this. The first step is we must have the key abstractions. That is what we did in the last lesson. Once we have the key abstractions, we draw the class nodes for each key abstraction.

We list their attributes. We list their operations. That means we create a class node with all its responsibilities. Number two, we draw the associations between collaborating classes. After we do that, we identify and document relationships and role names.

So relationship names, association names will be written. Role names will be written. And then we identify and document the association multiplicity. And optionally, we identify and document the association navigation.

Now, starting with the first step, draw the class nodes. Now, here you can see, we have drawn almost all the major class nodes required for create reservation. Normally what happens, we can begin with one class, which seems to be the major one, or you can say the central class.

And then we start getting information. And we start creating all other classes related to that. And by the time we may end up having a network of classes, and then we decide that, OK, this class must not come in the center. We want to have a more clear view about the Domain Model.

And we end up having many iterations to finalize our Domain Model. We are going much more methodical over here. The use case is less complex. It is very small. So we just draw the various class nodes over here.

Now, we draw the class node for reservation, for make reservation or create reservation use case. We also create a customer class. And we create three node classes-- Room, Payment Guarantee, and Property.

Now, the rule says, we create all the class nodes with all its responsibilities. We will list all attributes. We will list all of our operations. But here, because of lack of space, you can see we completely write the details of reservation. And we are writing some details of customer, and no details for Room, Payment Guarantee, and Property.

In actuality, we will write all the details of each and every class. It will be quite a big model to look at. So this is our first step. Then we want to draw the associations among the various classes.

Reservation is associated with Customer. Reservation is associated with Room. Reservation is also associated with Payment Guarantee. Now from where do we get all these details? CRC Card is our resource over here. There we have listed all the attributes and all the operations, what we call responsibilities of the class, and we have also listed all the collaborations.

So all the collaborations are converted into associations over here. Reservation with Customer, reservation with Room, and reservation with Payment Guarantee. Property is associated with Room. So this makes our second step, that is where we draw all the associations from the class to another class.

Now, the third step is label the associations and the role names. So we said reservation is made for customer. This is an association label. Room is located at property. And we say reservation is guaranteed by payment.

We can also add one more over here. Reservation has a source code as room. Reservation has room. So that can be added over here. Now, here we can see the labels made for, guaranteed by, and located at. OK?

And let me show you in different colors all the role names. So role name R-E-S-V is used for the reservation, cust for the customer. Again, we repeat over here for reservation. And it is for room and property. So all the labels which are marked in green are the role names.

And all the labels which are marked with red are the labels for associations. So we do bookings. We label the associations. And we label our role names. That is what is our step number three.

Now, next is, we would like to know how many objects are participating, so multiplicity. We said one customer can book one or more reservations. One room can be associated with multiple reservations. Now, how do we justify that? How one room can be associated with multiple reservations?

Over a period of time, that means in the lifetime of a room, room will be associated with different reservations. We will see that we will justify it in a much better way when we go to the design. When we go to design, there we will have more elaboration on this. But as of now, we understand, in the life span of a room, a room can be associated with multiple reservations over a period of time.

One property has multiple rooms. And one reservation is guaranteed by one payment. So what did we do in this total process? We created our class nodes. We associated the classes. We named all the associations and role names.

And we labeled all the multiplicities. We put all the multiplicities. So by the end of this, what do we have? We have all the classes, all the entities which are participating in a particular use case, with all their associations and with the number of objects which are participating in this use case. How many objects are participating?

Who is associated with whom? And how can we understand the association of one class with another, like reservation is made for customer. Room is located at a hotel, which we call a key abstraction property. So this is how we understand.

Now, the next optional step is navigation. So we say reservation can access customer. This also shows coupling. That means whether particular classes or objects are tightly coupled or these are loosely coupled. So reservation can access customer. Reservation can access room.

Neither customer nor room can access reservation. Room and property can access each other. This is bi-directional navigation, whereas to the customer and to the room from reservation, it is a uni-directional association. Reservation is associated with payment guarantee. We are not showing any navigation.

Sometimes, we prefer not to write navigation at all. That is why we say that navigation is an optional step. So at this point of time, we can leave all the navigation. And we say it is understood that it is left to our own understanding that who will access whom. And we don't show anything at all.

And we modify this or we define it when we go to the Solution Model. So this gives me a clear picture of my Domain Model. Now, I created my Domain Model. How do I validate it? Have I created a right model?

How can I justify that? So to do that, I must see that whatever are the workflows, whatever are the users' stories, does this particular Domain Model solve those use case scenarios? So that will be our next step.

## 2. Constructing the Problem Domain Model, Part 2 - 29m

We will create the Object diagram which will validate that Domain model. So let us see how can we validate. We can validate our Domain model by analyzing multiple Object diagrams.

So we have different user stories. We have use case scenarios. Before we do that, let us have a copy of our Domain model. I will just to make a replica of this, in general.

Reservation. We had arrival date. We had departure date and reservation number and status. Here are some of the things.

Here we created customer, a and we have room. We have created property. And here, we have created payment. guarantee.

We draw that association from here to here, just a rough sketch. And here, this is what we have made. Here we have first name, last name, and we have address and phone number. Let us write it in a different color.

These are our multiplicities. We have one, one to many. This is one to one. This is one room with multiple reservations. And this is one property with one to many rooms.

This is what we have created. We will refer to it in some time, because we want to validate our model. So we should have something to look for.

Now, coming back to the validation. We will have the various use case scenarios. Say, the first use case scenario says so many days over here. And here is a second use case scenario, which gives other details. We can have many.

We would pick up a particular use case scenario. And we will draw an Object to diagram for that. Then we will pick up the second use case scenario.

We draw the diagram for that. And then, we will pick up all the major use case scenarios and draw the diagram, And then, whatever Object diagrams we have created over here, we will map the various elements over here with the Domain model to justify that what my use case scenario speaks does my Domain model provide me that.

If yes, that means the Domain model is validated. It is correct. And if it is not, then we will ask the analyst to make the changes in the Domain model to fit into our user stories.

So let us first take a look at the Object diagram elements. Simple-- there are less elements over here. We have the object nodes. We can see the difference between the object nodes and class nodes.

When we draw a class nodes, we draw a node, a rectangle, and we write the name of the class. This is my class nodes.

If I want to represent an object of the same class node, I will draw on a rectangle. I will put the column over here. And then, I will write the data type of this particular object.

Not only that, we will put one line over here. It will be underlined. This is one of the ways you can represent the object nodes.

In the coming slide, we will see what other various alteration on this. How can be represent the object node in a variety of ways, just like we saw how we represent the class nodes in a variety of ways.

Three object nodes are there-- reservation, customer, and room. So reservation object is linked with the customer. And reservation object is linked with the room. In the Object diagram, you do not talk about the association, but rather, we talk about the links.

So there are no associations, there are links. Link is an instance of an association, which is actual materialization of an association at the run time. We can also use link names over here. So we say, a reservation is made for a customer.

Let us take a look at the various variations on the object node. Now an object node can include only the data type. It can represent only the object name. Or it can represent both together.

This is an example of an object name without any type. So that means Victoria is the name of the object. Then the object always has a label, which is underlined. So we say Victoria is an object.

Now, the second representation is a type without a name. So we say, colon-- we always write like this. It is the object name followed by the type. It's the reverse of how you declare the variables.

When you declare the variable, you will say room, and you will say Victoria. But when you write it, you will say Victoria, and you will say room. So this is object name, and this is your type.

So various ways. And the last one is the detailed object node. Just like you created the various compartments for that class node, we can have the various compartments for the object node.

The first compartment contains the name of the object or the type of the object. And the second compartment is the values compartment, or attributes compartment. So we can say each and every attribute is shown with the value.

So here, we can see we have every attribute and the values are being given over there-- First Name, Last Name, Address, Phone Number, and so on.

So four different ways we can represent an object node-- just by the object name, just by the data type, a combination of an object name and a data type, and the detailed object node, where we represent all the state of the object, that is, values and the names of all the attributes of an object.

Now, talking about the links. The Object diagram-- each link is unique. We can see, in the previous diagram, when we represented the property with the rooms-- the relationship between the property and rooms-- as we can see here, on the diagram, it is one too many.

One property can have many rooms. But when we come to the Object diagram, there is only a singular link. So we say property is associated, property is linked with the Victoria room, with the Blue Room, and with the Queen Room.

Then you have, from one object, multiple links. That means when one object of property is linked with many objects of room type, that shows the multiplicity. That shows that one property is linked with many rooms.

But as such, we do not write any multiplicity like one to one, one to many, or many to many. Nothing is being shown in the Object diagram. So it is devoid of that, because we are not showing the association.

We are not showing how many objects may participate. We are showing the actual participation of the objects. So it is each and every individual object. So hence, we do not write multiplicity.

So we said reservation object communicates with the customer. And reservation object communicates with the room. And we specifically save one object that is a Blue Room.

And the property is linked with various rooms. So this is how we show the links. So never a multiplicity, only by the links.

Now what are the steps we follow to create an Object diagram? First, we pick up one or more use cases-- that exercise, the Domain model, the major ones. We must see the variety.

The focus will be the associations, the number of objects participating, the various objects which are participating. So we will cover three major areas when we pick up the use cases. We must keep track of what all objects are participating.

Are there use case scenarios of the same use case where various objects are participating? All the variety of objects we must keep in mind.

Second thing is, we should also think about the associations. Are we picking up the use case scenarios which have all possible associations? If not in one, at least if I pick up three different use case scenarios, these three scenarios must cover all the associations.

And then, the multiplicity. These are the three things we should keep in mind when we pick up a particular scenario. Then, we walk through each scenario separately. And we draw an Object diagram for each scenario with all the data which is mentioned.

Because when we are talking about objects, certainly we are talking about individual data. We are talking about one specific object. And then, we compare the Object diagram against the Domain model, to see if any association constraints are violated.

So these will be our four steps. Let us begin with the first one.

We pick up the first use case scenario. We say the use case begins when the booking agent receives a request to make a reservation for rooms in the hotel. And the booking agent enters three informations-- arrival date, departure date, and the quantity of each type of room that is required.

So that means my prerequisite is the property must be available. The property is available. The property has rooms. And the actor will provide various information for this.

Now, we say the booking agent then submits the entered details. And the system finds rooms that will be available during the period of reservation.

So when the actor submits that details, the reservation object is created. And the information is stored in the reservation object. We have a reservation number. We have arrival date. We have departure date. And the status is being assigned a value, new. It is a new reservation.

And the system finds the rooms. We assume that system finds three rooms, which are available for the given dates-- Victoria, Blue, and Queen. As of now, there is no association between the reservation and the rooms.

Only the rooms are found, and these are available. maybe the rooms are presented to the actor see whether these rooms are acceptable or not, or which room will be selected for reservation.

Now, the next step is the system allocates the required number and type of rooms from the available rooms. And the system responds that the specified rooms are available, returns the provisional reservation number, and marks the reservation as held.

Now, the rooms are being made available. And one room is being associated with the reservation. And the reservation status changes from new to held.

Continuing, the booking agent accepts the rooms offer. And the booking agent selects that the customer has visited the hotels in this group before. Remember, we are talking about use case scenarios. So we will not have any if statement, if it is a new customer.

So customer already visited the group before. We entered the zip code and the customer name. The system finds and returns the list of all the matching customers. And we assume that the booking agent selects the right one.

And the system assigns this customer to the reservation. So the association between reservation and the customer is materialized over here.

We can see the details of the customer are being provided-- first name, last name, address of the customer, and phone number of the customer. That is because a particular customer has been chosen, or been selected by the booking agent.

The booking agent performs the payment guarantee check. And the check is successful. The system assigns the payment guarantee to the reservation and changes the state of the reservation to confirmed, because the payment guarantee is successful.

And the system returns the reservation ID and the booking details. So these are the details.

So now, we see the reservation is associated with customer. The reservation is linked with the room. And the reservation is linked with the payment guarantee.

Other links are already there. Property is linked with the various three rooms, which were being shown as available for the reservation. So our first scenario is completed over here.

Now, just one scenario is not sufficient. We will look for another one.

So we pick up the second scenario where the actor makes a reservation for a small family reunion. And we say, OK, we require three rooms.

So everything remains the same. A reservation is created. The VISA payment guarantee is there. The name of the customer is there.

So that means a reservation is associated with payment guarantee. A reservation is associated with the customer. Property, as usual, is associated with all the different available rooms.

The change, over here, is from the previous scenario that the reservation is associated with three different rooms. Because the customer has booked three different forms. Now this is what is our second scenario.

So this is what I was talking about, when I said we should pick up our use case scenarios intelligently. In our first one, is not a question that I will select one happy scenario and one sad scenario, no.

That is not the concern over here. The concern over here is, we should pick up those scenarios which cover all the cases. So here, this is what we have now. Now, the next step is we would like to validate. So there are three criteria for validation.

Number one. Are there attributes or responsibilities which are mentioned in the scenario but which are missing in the Domain model? So let us just map.

Now, on the slide, we can see there are four responsibilities in the reservation. That is reservation number, reservation status, arrival date, departure date. And there are some attributes or responsibilities for the customer. That is, first name, last name, address, and phone number.

Let us go to the board and see whether we have all of these available over there or not. So we can see, in our Domain model, we have arrival date. We have departure date. We have reservation number. We have status.

So reservation object is OK. It maps with both the Object diagrams. Because both Object diagrams are listing all of these four responsibilities.

And coming to the customer-- first name, last name, address, and phone number. That is also there. So one criteria is OK. There is no issue.

Let us go to the second one, now. The second one says are there associations in the Object diagram that are not existing in the Domain model? So let us see what associations are there.

Reservation is associated with payment, with customer, and with room. And the property is associated with room. So four associations I can see. Let us see in the previous one.

Here, also, we can see reservation is associated with payment. It is associated with customer. It is associated with room. And property is associated with the room.

Let us go back to the board and see if our Domain model provides these. This is OK. Reservation is associated with the customer.

Second one, reservation is associated with the room. Reservation is associated with the payment guarantee. And property is associated with the room-- one or many rooms. So this is OK.

So as of now, Domain model looks good. Let us go back.

Are there scenarios in which the multiplicity of a is wrong? So this we will do-- one by one scenario. Let us take a look at the first scenario.

In the first scenario, multiplicity between the reservation and the customer is one to one. That is OK, because here it is one to many. One customer can make one or more reservations.

So in this scenario, we understand that customer has made-- let me write it in a different color. So in the first case, it is one customer with one reservation. This is OK. The second one, we say the reservation is marked for one room. So one reservation and one room. Perfectly OK.

One property was associated with multiple rooms. This is also OK. And then we say one reservation is with one payment. So for the first use case scenario, my Domain model provides everything, whatever is required.

Now let us go to the second one. Let us take a look at the slide now, for the second one.

When we take a look at the slide, we understand reservation and payment is one to one. Reservation and payment is one to one. Reservation and payment is one to one, one and one. So I say I give a final take over there. This is OK. There is no issue.

Now let's go back to the slide again. And we see, over here, that reservation is associated with one customer. Now, on the board, we can see one reservation can be associated with one customer. So here, also, we give it final take. Yes, that is OK. No issues.

Coming back to the slide, we see, over here, one property is associated with many rooms. Is that OK, over here? Yes, one property with one to many rooms. So this is also final take.

Let us see the last one now. We say reservation is associated with multiple rooms. Now, one reservation and multiple rooms. Let us go back. We have one reservation, but it is one room. So this is the problem part. We need to rectify this.

That means in our current Domain model, what do we have? We said one room can be associated with multiple reservations over a period of time. But one reservation cannot book multiple rooms. That is the problem with the Domain model.

So that means we need some kind of editing over here. We need to change it. So what do we do?

We go to the next one. Let us take a look at the slide, where we have a refined, final Domain model. So what do we do? We say, over here, this is the change which we made.

So coming back to the board, over here, we will say, OK, because this was wrong. So what do I want to do? I will say I will make a small change. And we will say here, this should be one to many, this association. Now it becomes many to many.

That means many rooms can be associated with many reservations. So that shows one reservation can be associated with one or many rooms. And one or many rooms can be associated with many reservations over a period of time.

So now, I can give a final take over here. This is how we validate our Domain model.

Let us take a look at the Domain model once again. Now, the final Domain model is one customer can make many reservations. Many rooms can be associated with many reservations, one to one between payment and reservation and one to many between property and room.

Now, in this lesson, we learned to create a Domain model to provide a static view of our key abstractions for any particular problem domain for a particular use case. We used the UML diagrams to represent the Domain model.

We created a class diagram with all the associations, multiplicity, and all the classes available. We, optionally, showed even the navigation also over there. And we validated our model by creating an Object diagram for various use case scenarios.

And we also discussed that use case scenarios should not be picked up just on primary and secondary basis. But these should be picked up depending upon the objects participating and the associations and multiplicity. And the classes, which are the various classes available.

So we see that if the Domain model fits all the Object diagrams we have created, that means our Domain model is connect. It is being validated. If not, then we will make the necessary changes to finalize our Domain model at the analysis level.

Now with this activity, we come to the end of requirements model. This is the last activity which we perform in the analysis of our system.

## 3. Lab 7: Constructing the Problem Domain Model - 12m

Let us take a look at lab seven. There are four different activities-- activity first and activity number three. We will identify the various elements in the class diagram and in the object diagram. In the second activity, we will extend the domain model class diagram of the hotel system by adding the various key abstractions which we identified in check-in process. And in the exercise four, we will validate the domain model using one or more object diagrams.

Let us take a look at the first activity. We try to identify the various elements. And here we find the solution to this. So this is a class node. The second one is also a class node with members. 1..* is a multiplicity label. This is unidirectional association. And this represents an association class.

Let us take a look at the second activity. So here we are. So in this exercise, we extend the domain model class diagram of the hotel system by adding new key abstractions, which we identified during CRC analysis in previous lab.

So this is our current model that we just now discussed. And we will add the new key abstractions over here. We add new class nodes for each key abstraction that we found in the activity two in the previous lesson.

So we'll start by adding various nodes. We will add associations. We will add the associations between collaborating classes. We will name the relationships. We will add the multiplicity. And here we are. So this is what we have. Let me just reduce the size of it, so that we can fit all the diagrams here.

So we have the reservation, which is associated with a customer. One customer can make one or more reservations. This is a new key abstraction, Bill, which we are adding over here. One reservation is associated with one bill. One reservation is associated with one payment. It was already existing-- many rooms with many reservations. Room is associated with a room type.

So we say one room type can be associated with zero or more rooms. So this is a new key abstraction, which is added over here. One property is associated with multiple rooms. This was already there. Now one property is also associated. Or you can say many properties are associated with various promotions, which can be simple promotions, or which can be a seasonal price adjustment. So these are new additions over here.

We talked about the payment guarantee. Payment guarantee can be of a card payment guarantee. This is a new key abstraction added.

Or it can be a purchase order guarantee which is coming to you from a company. Now these two are again new-- two key abstractions over here. One company can give multiple purchase order guarantees. But a payment guarantee can be associated with one purchase order guarantee over here.

Coming to the bill-- one bill can be associated with zero or more chargeable items. Remember, that customer may opt not to go for a chargeable item. Completely abstracted from this-- not available. And one chargeable item-- every item can be of one chargeable type.

So these are the new abstractions over here. So the bill chargeable item, chargeable item type, purchase order guarantee, card payment guarantee, company, seasonal adjustments, promotions, room type-- all these are the new additions-- new key abstractions, which we have added on to this. And this domain model shows me the details of a check-in process. So these are all the classes and their associations which are related with the check-in process.

So let us go to activity three over here. So these are the various elements we would like to identify. Let us go to the next one here. Named object node-- the first one. Second one is unnamed object mode, because we show only the data type. We are not showing any object name over here. And object node with attribute values. So this is a instance which provides all the attribute values and the attribute names over here.

Here is another small activity, which says, "select the statements or a statement about UML object diagrams that are true." So statement A says, "object diagram can be validated using class diagram." This is false, because it is the reverse of it. Class diagram can be validated using object diagrams.

Option B says, "object diagrams show runtime links." That is true. Option C says, "object symbols can have three compartments-- name of the object, attributes of the object, and operations of the object." That is not true for object node. But that is true for class node. So statement C is false as far as object is concerned.

Option D says, "object diagram often shows object state." That is true. Option E says, "an object diagram is an instance of a class diagram." That is true.

Let us take a look at activity four. So here we validate a class diagram. So what do we do? We choose a subset of classes that we want to model as objects. And this subset of classes should be based on the classes which are used in a primary scenario-- that we used in inter-connectivity the previous classes which we have discussed in the previous activity. All those classes must be shown over here so that we can validate our domain model properly.

Now draw an object diagram for each key abstraction in the scenario. Draw the links between the collaborating objects. Follow a partial flow of a chosen scenario, changing your object model as the flow progresses. And compare the object diagram and the domain model. So that is what we are about to do. Let us take a look at the next one.

So here we assume that the date is 23rd December, 2009, and John Smith has not yet checked in. But the reservation is there. So we say reservation number is this. Arrival and departure dates are given. Status of reservation is confirmed. And quoted price is 800.

So this is associated with card payment guarantee for the amount of 800. Because there is no addition as of now for chargeable items or anything. It is associated with the customer, John Smith. Reservation is associated with room 319. Status is available. Reservation is also associated with room 302, which is available. Both are of double type rooms. And the property is associated with both the rooms.

So we can compare it with all the associations in the-- over here. Everything seems to be OK. All associations we have already taken care, so everything is good. Now the second scenario here we say-- we can say assume that the date is 23rd December, 2009, and that John Smith checks in. He has extended payment guarantee amount to cover for additional charges over here now.

So we say everything is OK. A reservation is associated with John Smith. It is associated with the rooms-- both the rooms. Room status is occupied now. And the room type is double. That is also OK. That is taken care previously. Property is associated with both the rooms. That is also taken care. Reservation is associated with bill. Now allow additional charges become true. So this is a change. And we say bill is associated with chargeable item. And chargeable item is associated with chargeable item type.

All these are already shown in the domain model. So as of now everything seems to be good. But here we say consider another addition. During this modeling review with the client, we get to know that we might discover a reservation can have a second payment guarantee. So that means-- what do we understand?

Reservation must be associated with multiple payment guarantees. That is not taken care. So after discussing with the client, we can understand that we're required to change our domain model. So we will say reservation can be associated with multiple payment guarantees. So this is what we have.

So this is our lab number seven. So we understand over here-- one more point. That not sometimes just by use case scenarios-- by making the object diagrams-- when we review it with the client, we may find out some additional information. Depending on that, we may need to change our domain model.
