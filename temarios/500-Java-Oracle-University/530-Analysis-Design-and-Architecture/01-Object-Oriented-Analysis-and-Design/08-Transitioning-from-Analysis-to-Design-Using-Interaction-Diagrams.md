# 8: Transitioning from Analysis to Design Using Interaction Diagrams

1. Transitioning from Analysis to Design Using Interaction Diagrams, Part 1 - 52m
2. Transitioning from Analysis to Design Using Interaction Diagrams, Part 2 - 44m
3. Lab 8: Transitioning from Analysis to Design Using Interaction Diagrams - 11m

## 1. Transitioning from Analysis to Design Using Interaction Diagrams, Part 1 - 52m

So in the previous seven lessons, we talked about analysis. We talked about requirements model. We got the requirements.

We created various diagrams, which helped us to gather the requirements. We did analysis. And now, our last step was we created the domain entities.

We were able to create our domain model with all the entity classes, with all the associations multiplicity. We even validated our model. That means now we are ready to take the next step. So we are moving on to design today.

So in lesson number eight, we will talk about how we can transition from analysis to design. And to do that, we will use interaction diagrams.

Now, objectives of this lesson are to explain the purpose and elements of design model, to identify the essential elements of UML communication diagrams, to create a communication diagram view of the design model. We will identify the essential elements of sequence diagram, and we will create a sequence diagram view of the design model.

Basically, we can divide this lesson into three different segments. In the first segment, we will talk about the design with robustness analysis. It's a process which helps us to identify the design components. The second part of the lesson will be interaction diagrams. And these interaction diagrams, we will have two parts.

One, we will talk about communication diagrams. And second, we will talk about sequence diagrams. So this is what we are going to do in this lesson. So let us begin.

We just finished the requirements model. In the requirements model, we talked about the various functional requirements. We get it.

And here, in the design model, we will design the components, which can achieve those functional requirements. That is the purpose. And to do that, we will create interaction diagrams.

These interaction diagrams will show us the communication between the objects, which objects are participating, what messages are sent, and what is the outcome. So this we will see. The normal symbol which we use for the robustness analysis that is shown over here in this particular diagram.

So let us take a look at the process. All right. Now design model is created from the functional requirements of the requirements model. And we acquire these functional requirements in variety of ways. We catch the requirements by use cases while we get the information of the entities which will participate.

In the form of domain model, we already created domain model yesterday. Now, the design model is focused on the functional requirements, whereas the architecture model, which we will do tomorrow, that focuses on the non-functional requirements. So we can see everything was available together over here in the requirements model.

It was common. Now we divided. It is like we are becoming more cohesive.

So we go to the functional requirements, focus over there, design over components. Then we come to architecture model, where we see. We create an architecture, and we try to fit those components into the architecture by creating a solution model.

So our ultimate aim is we will today talk about the design. Then we will create our architecture. And then we combine these two. These two will merge. And we will create our solution model.

The design is implemented by creating interaction diagram. Now let us take a look at the process. We created use cases.

These use cases gave us the details about the functional requirements. The functional requirement can be, for example, that somebody needs to withdraw money from ATM.

Now here we understand that there will be a user. There is ATM. And here, the user will use the card to withdraw the amount.

So what information user needs to give? It can be in the form of inputting a card, then inputting your pass code, your password, and then you will give the amount. And you will hit the Submit button.

So when you hit the Submit button, the inputs, whatever the inputs we have. These, maybe these are my inputs. These inputs are being sent to the ATM machine.

Here there is certain process which carries out all the operations. Maybe it will have a link to the central database where it will check whether there is a sufficient amount or not, whether this transaction can take place. And the output will come in the form of the money.

Or it can be in the form of an error message. Insufficient balance, transaction cannot take place. This is my function requirement. Now how will I carry it out? I have some kind of input screen where I input all the data. So this is same me.

So I want to interact with this screen. And this will interact with some other component, which will carry out the process. And here is some repository where my details are there.

So very clearly, I can identify this is my input, which is communicating to the outside world. Maybe I can call it as a UI, user interface. And this is my process.

Maybe I can call it as a service provider. And here is my details. That means me as an entity or as an object.

This is what we want to do. This is what we want to understand. How this communication will take place? What are the components I will identify? And how I can show it in a visual, or in a diagrammatic way, so that client or a stakeholder can understand how I'm going to do it.?

And the other thing members should also be able to understand, OK, these are the components. This is how the things will happen. Now, this can be achieved by creating interaction diagrams.

You can see I'm showing an interaction, how I am communicating to the UI giving the data. How the UI will send the data to the service. And then the service will communicate to the database and the response will come back to me.

So it is kind of a sequence of events. Or I can say it is showing me how the various parts, or the components of my application, are communicating with one another. That is what we call it as interaction diagrams. This is what we have.

We will talk about the sequence diagrams. We will talk about the communication diagrams. Now, when we talk about these two, one more thing comes into our mind.

That is yesterday, we were talking about activity diagrams. What about that? Was it not showing the similar kind of a thing? Yes of course.

So activity diagrams also participate in a way to be a part of the interaction diagrams. That is what we call it as a third type, which can be created on a requirement, which is called as a interaction overview diagram. Now what do we mean by interaction overview?

Interaction overview is a combination of an activity diagram and the sequence diagram. Say yesterday we were creating some particular activity, create reservation. So when we create that particular activity, we come to a place where we say OK, identify customer. Now say the customer wants to see the details of this. So how we will do it?

Now this identify customer, I will blow it up. And I will make it in the form of a sequence diagram. So that means what exactly we are doing? Actually, we are talking about activity diagram. This is my activity.

So this is partial activity and partial sequence. So that means when you blow up some, particularly when you expand certain process and you say that, OK, this activity, this is how internally it is taking place. You call it as a interaction overview diagram. So this is about how three different types of diagrams are available.

Now, what does interaction diagrams do? Interaction diagrams show me the details or the interactions of one or more use case scenarios. Remember, we are using the word scenario, not a use case.

So one use case is there. That use case may have different scenarios. Yesterday like we talked about reservation. Reservation may be successful or it may fail due to certain reason.

So one or two use case scenarios, like I may create a certain diagram. So this is my diagram. And here, I will say OK. I'm going to show here, I will show the successful scenario. And here, I will show the failure scenario.

And I will write over here that this is showing me some kind of alternate flow. It's not exactly, but we will see, but just an idea. We can see over here one or more use case scenarios can be shown in the interaction diagram.

Or we have something. Say you have a very, very complex process. So when you have a complex process, when you want to write a very complex software, what do we do?

We just write something like this, say. I will say this is my Main Menu. And from Main Menu, I will say Accounts. Then I will say Loans. I can say mortgage.

And then I will expand this. Then I will expand this. And then I will expand this.

Here, again, I can have four major options, which can further be divided into something. That is what we call it as a modular approach. Now, interaction diagrams also provide us a facility that we do not expand the whole use case in a single diagram.

So what is the alternative to that? What do we do for that? We can create something which as called as fragments.

I will create one big interaction diagram. And I will say, OK, this is my first fragment, which talks about Find Rooms. This is my second fragment, which talks about Identify Customer. And this is my third fragment, which talks about Payment Guarantee.

Now when it is a fragment, I'm telling go outside, and you will have separate diagrams for each of it. Just like we did yesterday with an activity diagram, we gave a hint over here by using the symbol, saying that go and look. There is another activity diagram over there.

So in the same way, we can use segments. Well, here, we have been talking about the interaction diagram where we are trying to show one use case or different scenarios of the same use case. One or two scenarios of the use case. Interaction diagrams can be used at various levels.

We can create interaction diagrams to show the interaction among the objects. We can create interaction diagrams to show the interaction among components, how my EJB component communicates to a web component. How my web component communicates to some other component, say, real component. So we can create the diagrams for that.

Not only that, we can also create interaction diagrams to show the interaction among the systems and subsystems. So it depends upon at what level we want to create. We can go as high as systems. We can go as low as objects.

We talked about analysis. We talk a little bit about the design. Now let us take the comparison between the two.

Sometimes we feel both are doing the same thing. There also, we were talking about requirements, functional requirements. We were creating all of the use case diagrams. We were creating activity diagrams and so on. So what is the difference between analysis and design?

In analysis, we created the diagrams like use cases. We created the diagrams like domain model, where we got the information about the entities participating in a particular use case. Now, analysis tells me what to do.

Analysis just told me this is my requirement. This is what I want to do. Whereas design tells me how the system will support a particular process.

Like for example, when I talked about analysis, when I talked about create a reservation, I said the user will provide arrival date, departure date, and the types of rules required. We didn't say how that information will come. What kind of UI I am using.

We just ignored UI. We are not talking about the other back end components. We are just talking at a high level. We are saying, I want the information to be provided by the actor.

After, that information will go to make reservation. Make reservation will call find roles. Find roles will provide the list. Then the list will be given to the customer.

Customer accepts the list. We go to Identify Customer and so on. We are not saying how we are doing it. Design tells me how I materialize, physically how I create the components for this particular system.

Now, looking at this, when we talked about over here that here is a user, user provides the information, the information goes to a certain-- say we were talking about ATM. So I can say this is boundary. Boundary because this lands at the edge. It communicates towards the outside. The boundary is always something which interacts with the outside world.

So boundary component is a component-- we will talk about boundary components. We will talk about the components which provide the service. And then we will talk about the third type of components, which we already identified yesterday.

That is the entities. Because some data between process, that data needs to be stored or to be made persistent into a database or into a flat file system. So we will talk about the design model will consist of boundary components, service components, and the entity components.

Now, to do this, to identify, we use something called as a Robustness Analysis. Not very popular, but yes, very prominently used to identify the various types of components. Now, what does Robustness Analysis do? It is a process that assists in identifying design components that would be required in the design model.

So we identify. We will see what process we follow for that Robustness Analysis. The total design process, whatever we do, how we show the communication, we call it as a Robustness Analysis.

Now, as we can see from the drawing on the slide over here, this is our requirements model, the base for analysis. Using this model, we analyze everything. And what did we create? We created use case diagrams. We created use case forms and scenarios. We created also the domain model.

We can add something more, which is very, very important. That is SSD. We created a specification document. So these are our outcomes. This is what we did in the requirements model.

Now, all these components which we created, all these documents will be the input for the design model. Taking the inputs from all these documents, we will perform the Robustness Analysis, and we will create our design model.

Now, this design model, we can see it has three different components. One, two-- sorry. One, two, and three. So these three different components, we can see.

We see one component like this. This is my boundary. We saw the second component like this. This is my service. And we saw the third component, which is my entity.

So BSE. This is my ultimate target. And after identifying these components, we will see their interactions. Maybe services will communicate to other services. These will communicate to entities, and so on. It's a very, very interesting process.

Now, let's take a look at the Robustness Analysis. As we saw in the previous diagram two, the inputs to the Robustness Analysis are a use case, the use case scenarios which we created for a particular use case. Activity diagram, because that gives a good work flow of how the things are happening, and the domain model, and of course SSD.

Why we say SSD? SSD contains the business rules. We talked yesterday that what all the business rules are common to multiple use cases, those business rules can be put into SSD. So these are the various components.

And what is the output from the Robustness Analysis? We will capture UML. The design model will be captured in the UML interaction diagram with the design components, like boundary, service, and entity.

So we will be able to create a design. Whatever the process we identified, the requirements, functional requirements we identified, in a requirement analysis, in the form of activities, or in the form of use cases, we will identify the components, what kind of a component are required for this. Whether it is a service, whether it is a boundary, or it is an entity. There can be multiple boundaries, multiple services, and multiple entities communicating with one another.

So I can say in my own layman's language, I consider design as a network of boundary, service, and entity components interacting with one another in a meaningful way to achieve certain functionality. Now, let us try to identify and talk about individual components.

Let's talk about the boundary components. The boundary class array component is used to model interaction between the system and its actors. Actors are the users of your system.

And these are always external to the system. We talked about actors yesterday. We said the actors can be primary or secondary actors.

We listed something like Online Booking Agent. We talked about a travel agent system, travel system. We talked about receptionist, and so on.

In lesson number three, we talked about the various types of actors. Actor can be a device. We said we will show it something like this by writing the name over here. Actor can also be time. Maybe a time initiated activities.

Now, likewise, we can see, the various sectors can communicate in a variety of ways. So boundary components are actually the user interface components. The most common user interface which we use is either a GUI, that's a graphical user interface.

If we talk in terms of Java, we can say it can be any Window program which is written using AWT or Swing. Or it can be web UI. It can be an HTML page, or it can be any HTML5 page, and so on. It can be JSP, JSF, ViewPage, and so on.

Now the UIs can be other than these two. These two are the most common-- GUI and web UI. Now, our boundary components can also-- boundary component takes the input from the user and interacts with the user.

They may create a variety of systems. Maybe we are creating some embedded systems where your smartphone is a system. And what is your boundary component?

You use the boundary component as a sensor. You touch the screen and some signal goes ding. And maybe you're creating some washing machine kind of a system where you press the button and that is your boundary.

That is your input. That is how you are interacting with the system. It can be sensors. It can be any other communication interfaces.

Maybe one system is giving an input to another system. So one system, the whole system, can act as an actor and can provide input to another system. So UI screens, sensors, communication interfaces, and so on.

Boundaries are always high level components. That means when I create a boundary component, when I talk about the boundary component, I say it's a web UI or it's a graphical UI. I'm not talking about when I'm talking about a boundary component.

I don't say, OK, I will use three labels, four text fields, and two radio buttons, five check boxes, and one support button. We don't give the details of the components. We talk about the UI as a whole. So we understand whatever the UI, the purpose of the UI is two.

Now UI, the boundary component, this is my boundary component. And this is actor. And this is my Rest of System.

It communicates with the external world. And it also communicates with the rest of the system. Now, in the very first lesson, we talked about extraction. Extraction means hiding the details.

Now, what happens over here, me being an actor, I know only one thing. This is my UI. This is my boundary component. I will give some inputs. And here, there is a Submit button.

I give the data over here. And this will go-- maybe this is a login screen. And here, it will have some process which will validate-- or rather I can say authenticate.

This is what it does. The boundary component introduces an abstraction between the user and the rest of the system. The user has only one communication point. That is boundary. User doesn't know what is happening inside. According to user, what is happening, you give the credentials and you click on Submit. And either you will go in the system, or you will get an error message.

So boundary is considered as an abstraction between the user and the rest of the system. So it's a high level component. And the boundary component has one constraint.

Any component is a valid boundary component if it interacts at least with one actor. If there's no actor, we cannot call it as a UI. Because user interface, right. If user is not interacting, it is not a user interface. So boundary component must have at least one actor. That is the constraint.

Then we have service components. Now, this is the bulk of the system. You can see this is the place where everything happens. It's a very, very happening place. Sometimes, we call our services as controllers, or controls.

Why do we call as service as a control or a controller? Because it controls the process. It has all the instructions depending upon certain functionality.

And it controls the total system, whether particular input is given right, it will process the data. And it has a control whether, depending on the input, whether it's a failure or whether it's a success, or whatever it wants to do. So the control is a word.

Boundary can also be considered as view, because the user can view the data. User cannot view what is happening over here inside. So this is normally consider, this is what we have a service. This is a service. So service is considered as a controller the process.

So we can see, this can be compared to view. This can be compared to the controller. Service is a more common word when we are designing. But you will see that ultimately, it will go and map to something, which is very popularly used for architecting the enterprise applications.

So what does control do? Or what does service do? What all we can do? It has a sequence of instructions.

It will perform instructions one after the other. It capable of carrying out various kind of transactions. Control of other objects and often encapsulate control related to a specific use case.

That means service is also a kind of abstraction in a different way. We can have the services in a variety of ways. For example, think of the system we are modeling something like this. This is here, say, boundary. It provides you a facility to create, update, or delete reservation.

So you give the data on this screen. And here, you go to a particular service. This is your single point of contact. Say we call it as a reservation services, or reservation service.

Now, reservation service can be considered as a controller where it identifies what is supposed to be done, whether user has sent the request for create or user has sent a request for update or for delete. Depending on that, this reservation service will send the control to another one of these three services, which is create, update, and delete.

Very commonly, we also call it by another name, called as a facade. Sometimes service may not be truly facade. But of course, facade is a type of a service, which encapsulates the total process and abstracts the user from the rest of the system.

So if we think in terms of object oriented, we can say this kind of a service provides me a loosely coupled design. Of course, cohesion will be compromised to an extent over here, because it may do multiple services. But that is also sometimes we say that it is our view how we look at it.

I may call it as a cohesive, because it is dealing with all the reservation directed services. So this is my facade. It's a loosely coupled design. And we understand that change in these processes, maybe internally we change some of the process how the reservation is to be carried out.

The user will remain unaware about what is happening at the back end. So that means the facility of this kind of a design identifying three different kinds of components itself brings about something which we call it as a separation of concerns. And because of the separation of concerns, we can alter one type of a component without affecting another one. That is the ultimate aim of this kind of a design.

So it coordinates control flow. And it isolates the changes in the workflow from the boundary, I just now explained to you, and the entity. Because like areas over here, here you will see we will have the various entities.

Here we will have various entities. Of course, we are going to talk about entities in the next slide. So these are our entities.

Now, what is happening over here in the business process? A business process just knows that what data entity contains. It is independent of the process. It only needs to know that what input has to go to the entity.

So it will abstract both sides. And this we can call it as the entities can be compared to-- let us use a different color to highlight-- this we call it as a controller. Boundary, we call it as a-- here we call this as view. This was our controller. And then we create our entities over here, the various entities.

We will call these as model, because it keeps the details which has to go to a certain backend. The model, it tells what kind of data is going to be kept.

So we can see MVC. Although we are not talking in terms of part of your controller architecture. But we can see our design leads us to a boundary which is a view, to a service which is a controller, and to an entity which is a model over here.

So then we talk about entities. Now, entity is used to model information, which can be long lived, which is persistent. The data may be stored into a certain repository.

Secondary store is maybe a database, maybe XML file, maybe in another way. So here we can see that interaction. We can see the actor sends a room request to the reservation UI.

So the reservation UI is a boundary component. All the details have being given, and this makes a call to make reservation. Now make reservation creates a reservation object. Entities correspond to the domain objects, which we identified yesterday. We identified reservation, customer payment guarantee, room, property, and so on.

So most entities are persistent. And their services can communicate to the entities we can see.

So all the entities can have complex behavior. What do we mean by saying entities can have complex behavior? When we say entities can have complex behavior, that means some kind of a business process or a business logic can reside inside an entity.

So what kind of a business process can reside in an entity? Certainly because entities can be used by various use cases. Like for example, when we talk about a reservation entity, reservation entity can be used by check-in use case.

It can be used by checkout use case. It can be used by create reservation use case, update reservation use case, delete reservation use case. It can also be used by some kind of report generating use case where you want to know that how many reservations, what other details, which kind of rules are more in demand. So those kind of things.

So we understand when we say the entity can contain some kind of a business logic, we should be careful that any business related logic should not be put into the entity, because entity is reusable by various use cases. So in that light, we can see what kind of logic or what kind of a business process can be put into the entity. Mostly, the entity related business logic is put in the entity.

Like for example, you want to validate something. Say we said arrival date or departure date. So when I want to validate it over there, or maybe some input you are taking and you want to validate that kind of input, only the entity related business logic is advisable.

To be put into the entity, we would not be like to keep half of the business logic in the service and rest half of the business logic which is related to the functionality of the process in the entity at all. Now, here we talk about service and entity components. So entity component will often have corresponding service component. Most of the time, we will see these service components communicate with the entity components.

Going back to our reservation. So when we come to create reservation, it creates reservation object. And from here, we say it calls another service called as find rooms.

So this is one service. This is another service. This is entity. Now find rooms. Communicate with room entity. It may, some circumstances, it may communicate to a property entity also. Maybe property entity can provide the stuff for all the rooms. And then it will see over there.

So we can see the various services. Most of the time, the service is always associated with an entity. Or we can say an entity is always associated with a service.

A service object will control its corresponding entity object. Then make reservation or create reservation. Receive some data. It will create a reservation object, store the arrival date, departure date, rule type, and status as new in the reservation object.

And when the service object reaches to a defined room service, it reaches to the room. When it associates the room with the particular reservation, it will make it not available to somebody else. So that means service is always interacting with the entity and is changing the state of the entity as a result of its process.

Service object can also delegate to other service objects. That helps us to avoid creating complex use cases. So we can modulize it.

We can write small modules. Each small use case, there are two utilizations of that. Number one, your use case is not very complex. Number two, there are some use cases which can be reused by some other use cases. So you bring more modularity to that.

Then we have boundary and entity components. Now this is a very, very interesting scenario. I would like to take it on the board.

Here we have UI. Reservation UI component. Now here we can see in the slide that your reservation UI is communicating to the reservation object.

So we say it is asking for get details. Now this is a bad practice usually. We say a volatile component, UI is a volatile component, must not directly communicate in a non-volatile component which is persistent. Because reservation is supposed to be a persistent object.

Now, it can be considered in two ways. I will not go much into details. But just few lines.

Number one, we can say that it is not changing its state. It is just querying to get the data. That is one way to put it. Second way is that it may not be the actual reservation object, but it may be a cached copy of the actual object.

It may be something like this. Say this is the boundary. This is the service. And this is my entity.

And beyond entity, there is a database to which this entity is attached to. Now, here what happens, the boundary sends a query saying get reservation details. Now, service scans it to the entity.

Entity goes to the database, gets the data over here depending upon whatever the details of the query are. And reservation returns a copy of the details to the service. And service gives it back to over here.

So it is not the actual-- it is not showing the actual physical communication between the entity and the otherwise. If it's a very small system, local system, everything happening in the single place, maybe yes. But if your system is a distributed system and your entities and your services are lying on a remote server, so then certainly it is not.

Then in that case, in the case of a remote, what is being sent over here is called as a TO, or what we call it as a Transfer Object, which is being sent to the boundary. So it's a copy which can be cached on some place. So we understand again here request goes, make reservation, find rooms, everything.

You are setting the quoted price now. Here, what happens when you come to the make reservation service, we can see make reservation service. What does it do?

It creates the reservation. You can see a stereotype create over here. It tells what action is being taken by service for the entity. It is creating an entity.

So it's create an entity. Once the entity's created, all the details are over. And the boundary can ask for the details. And the details are provided to the actor.

Now what is the process of the Robustness Analysis? Number one, we select a particular use case and we construct a communication diagram or a sequence diagram. That will satisfy the activities of that particular use case.

We will identify the design components, which will support all those activities of that use case, draw the associations between those components, and label the components with the messages. We are associating and labelling it with messages.

Message is a method. When we say, like for example in the previous slide, we say make reservation. Now, make reservation is a method call.

When we say get details, that is a method call. That means these methods will be available in a certain class. And you are making a call to that method through the object reference of that class.

So when we can convert a communication diagram to a sequence diagram, or a sequence diagram can be converted to the otherwise, that is a sequence to communication and so on for an alternate view. It depends upon if you want the details to be shown to a programmer, programmers prefer sequence diagram.

And you have created, as a designer, you have created a communication diagram. You will convert it into sequence. And you will show it to the programmer.

## 2. Transitioning from Analysis to Design Using Interaction Diagrams, Part 2 - 44m

So let us identify the elements of a communication diagram. We have object nodes. And in the object nodes, we will use the iconic stereotypes to represent what kind of an object this is. Like in Reservation UI, it is a boundary component. A reservation service is a service component. And reservation is an entity component.

We show the communication between the various objects by using an association line. So we draw an association line from Reservation UI to the Reservation service. And on this association, we label the association with a few things.

Number one, we show a sequence number. So you will see the sequence numbers coming like 1. We will see something as 1.1, then 1.1.1, 1.1.2, and so on. So this shows the hierarchy. Or you can say this shows the order.

Main operation is 1. It may make a call to another one that is 1.1. In that operation, there can be another activity taking place that will be 1.1.1. We'll go back to 1.1, and the second activity of 1.1 is 1.1.2. This is a usual sequencing which is used in the communication diagram.

When another new operation will begin, we can go for 2, then 2.1, and so on-- 2.1.1 and so on. So this is how we find the various sequences guys sequencing can happen. So we see 1.1 over here, followed by column, and then the name of the message. Message is nothing but a method call.

If I have to make a call to makeReservation, I will make it like-- this makeReservation. And we will say all the parameters-- arrival date, departure date, and we'll say room type required. This is what we have.

Now, in actuality, I will make a call-- maybe I will say rs.makeReservation. So rs will represent a reservation service object reference. That object reference is not shown over here because you are issuing a communication. So we have seen the object node as one element, sequence number, another element.

Message is another element. Message will show the parameters passed to the message. And then we will have message direction. We chose a navigation from one object to another object.

So we understand a reservation UI which is a boundary object makes a first call to the service in the form of makeReservation by passing information AD, DD, and RTR. And the arrow shows the call is being made by Reservation UI to the Reservation service.

So this is our service mode, or a service object node. And the service, you can see, here we have another sequence number, now 1.1.1. That means it is a sub task of makeReservation. And the call is being made to create an object of reservation type. The stereotype shows over here what is actually happening. It is showing what the task is.

So here we can see in 1.1-- it is a method called. No stereotype is used. But then you are creating certain objects, performing some kind of an activity which is not shown completely by a method, or a message, we use a stereotype to show what is happening. So we said 1.1.1. We say create object stereotype.

So object is created. And the direction of the arrows shows reservation service creates a reservation object.

Now the complete process is not shown. But we see, over here, the object is created. And after that, there's no reference to 1.1. So we assume, implicitly, that the activity of creating a reservation, or making a reservation, is completed.

And then starts the second thing, second operation, 1.2.1, if it says get reservation number. So the call goes from a boundary to an entity. And entity returns a reservation number. So note down the difference between the types of arrows.

So we will see three types of symbols over here. The first one you will see is solid line with a solid arrow-- solid line with a solid arrow, the filled one. So this is a synchronous call. That means a request response.

The return type will be shown by a dashed line with open arrow. So this is return. And there is a third one that's a solid line with an open arrow. This shows asynchronous call.

These are three different answers. So they can make a synchronous call. We can have a return. And we can have asynchronous call. We may not find all the time return arrows shown. Sometimes, when it is not shown, we understand that it is implicitly for our own understanding that the return value is there. Two, you will see a lot of things which are not being shown directly onto a single communication diagram to avoid complexities.

So this is what we have over here. So these are the various elements of communication diagram. Now this looks very, very complex. Let us take a look at the next one. This is how, actually, the things will look. Because no labels are shown over here. Here, we are labeling the things to show that what a particular element means.

So this is how it is. Now this is the actual process. Let us take a look-- reservation UI object makes a call to reservation service by sending a message makeReservation. Reservation service object creates a reservation object. Reservation UI makes a call to get the reservation number. And reservation entity returns the reservation number back to the boundary.

Now identifying the elements [INAUDIBLE], a message name will be there. Direction arrow will be there. I already showed you solid arrowhead is used for synchronous. And open arrowhead is shown for asynchronous call. A dashed line with the open arrow sometimes is missing. We understand it as an implicit return.

Sequence number, which describes the order of the message call, a list of parameters will be there. Sometimes, we will see guard conditions. Now, guard conditions will be returned just like how the guard conditions are returned in the state diagrams. For example, guard condition, new customer.

So we will find guard conditions will be there. And a return parameter will be there. A return parameter can be with the line, or it will be just implicit and will be understood when you make a call to the get method.

Now how to create a communication diagram? So a few simple steps. Number one, we place the actor in a communication diagram. Step number two, we analyze the use case form, or the activity diagram, for a particular use case. When we analyze the activity diagram or a use case form, we identify the boundary component. Once we identify, we add a boundary component in the communication diagram.

Second step, we add and identify service. And then we add and identify entity components. So these three are the main basic steps.

Then, now when we go to the design, and we start creating that detailed flow, we may understand that we have missed some boundaries, we have missed some entities, or we have missed some method calls and so on. So we identify and add further interactions. We may discover new methods. We rediscover any of the three new components. Maybe a boundary service or an entity.

So here we begin. We place the actor-- this is our starting point. So booking agent, which is a synonym for a customer. It's a proxy for the customer. Step number two, we identify the boundary.

So operation number one, room request is sent by an actor to makeReservation by giving three informations-- arrival date, departure date, and room type, which is required. So this is my UI, and the UI identifies a service called as a reservation service. Sequence number 1.1, makeReservation, the three parameters which were received from the actor are passed to the service.

Next step we identify an entity. So the service creates an entity object that is a reservation by providing three information which were being recieved by the booking agent, ultimately. So service received it from the UI and service passed the information to the reservation object when the object is created.

Next step, identify additional interactions. Now the makeReservation method will use findRoom method because we want to search for the rooms. And here we can see 1.1 and what was createReservation? CreateReservation object was 1.1.1.

Now once that object is created, you'll come back to makeReservation method. And, from there, we make a second call, at 1.1.2 to the room service, which, in turn, interacts with the room entity. And here we see, after finding and choosing the free rooms, which are not shown, the setRooms method assigns the rooms to a reservation.

So we can see, after 1.1.2, 1.1.2.1 here. 1.1.2.1-- that means returning a list. And 1.1.3, maybe you are calculating the price. So these are missing. So we say setRooms, chosen room list, and, 1.1.5-- again, some particular action which is not shown on the sequence diagram. And we go to directly 1.1.6, set quoted price. We pass the calculated price. So that means price was being calculated for the selected rooms in 1.1.5.

So these have been omitted. So we will see, it is very much normal in a communication diagram to omit some of the actions. And these activities will be listed on one side in the nodes. And these are usually the fragments.

So fragments means a communication diagram fragments, you go to the separate place. There, you have a communication diagram, maybe for 1.1.2.1, 1.1.3, and 1.1.5. So this is how it goes.

Now the makeReservation method of the ReservationService object now returns the Reservation object, which is, again, not shown, to the Reservation UI. And the roomRequest of Reservation UI then calls the getReservation detailed methods because it needs to view whatever is available in the Reservation-- which returns the details of the Reservation and then the booking-- then these will be notified to the booking agent. So whatever you made it call, it is something like this.

We say make a Reservation. You created Reservation object. Then you made a call for findRooms, made a list of rooms, calculated price, setRooms, you set the price. And with all of this data in the Reservation object, you returned this object back to the booking agent.

So booking agent will send a request to get the details. And these details are shown back to the booking agent in the form of a data only window or only web pages, depending upon whatever is the UI.

So here, we can see, we identify the additional details over here. So here we see 1.1.1 create object, then 2 is find. 3 and 5 are missing, so four is setting the rooms, quoted price, getReservation details. 1.3, action number 1.3 we say getDetails. So details are shown back. That is, again, not shown. So when you say getReservation details, it is obvious that these details are shown back.

All right, now in the coming two slides, will see that two communication diagrams, as per the syntax of UML, you can show the happy and sad, both scenarios on the same diagram. But to have more clarity, not to make it very confusing, we have two different diagrams over here. The first one will be about the primary scenario. And the second one will be about the secondary scenario.

Secondary scenario, we are considering where the rooms offered are rejected by the booking agent. Again the final details are missing to reduce the complexity because we will create separate fragments for that.

So let's take a look at the first communication diagram, which is about the happy scenario where the Reservation is successful. Booking agent begins by sending a room request and Reservation UI, sends the makeReservation request to the service. Service creates the Reservation object, and, after creating the object here at 1.1.2, it sends a request for finding rooms.

We can see the return arrow dashed with an open arrow which returns a room list as 1.1.2.1. Now 1.1.3 is a separate fragment, which is to find sufficient rooms for the dates. So that means findRooms will find all the rooms. And here we have a fragment which will find the sufficient rooms for given dates.

Once we do that, we come over here to 1.1.4 to set the rooms with a chosen room list. 1.1.5 is again another fragment to calculate the price. 1.1.6, we set the quoted price. And after that, we have the return of this object back, 1.2. It returns the object back. The Reservation object is returned back. And here, we have 1.3, which asks for the getting reservation details. That is a fragment.

Now, the held Reservation details are provided over here in 1.4. And we assume the booking agent accepts the rooms. 2, a new activity begins from the actor to the rest of the system. 2.1 takes the accepted Reservation details to the service. And service, in turn, goes for 2.1 to get the payment guarantee.

So once the payment guarantee is confirmed by 2.1.1.1, you go back and confirm the Reservation details. 2.3, again, it asks for the confirmed reservation details. So we'll see the various fragments available over here. You will see such kind of nodes where we say all the keys are defined over here like arrival date, departure date, requested room type. And the node is being written over here-- the fragments are the separate another diagram which you can go and see. So this is the complete process for a happy scenario.

Now let's take a look at that second communication diagram, which is a scenario which is a sad one. Details remain same over here. The room is requested. We make a call from the boundary to the service for makeReservation. The Reservation object is created. Request goes for finding the rooms. We get the list. We go to the fragment to find the sufficient rooms. We come back over here, set the rooms, get the price calculated.

After that, we set the price. And then we send the Reservation object back. So once we send the Reservation object back, the boundary requests the details of the reservation. 1.4, held Reservation details are shown. But the booking agent response is different over here. The booking agent rejects the rooms. So once the rooms are rejected, 2.1, cancelReservation, is initiated. Once the Reservation is cancelled, the Reservation object is destroyed. So this is a sad scenario there the Reservation doesn't happen successfully.

Another interaction diagram which we can create is a sequence diagram. Now sequence diagrams provide a different perspective of interaction between the objects. It's a more clear communication. It can be used instead of communication diagrams. Sometimes we don't create communication diagram at all. And we create only sequence diagrams.

We can convert our communication diagram to a sequence diagram, or a sequence back to communication. Sequence diagrams are more liked by the programmers. And this highlights the time ordering of the various interactions. In the next section, we will see the various elements of sequence diagrams.

So we have the various object nodes. The normal understanding is all the objects which are available in the beginning are at the same level. And the objects which are created later as a part of some process, these are shown at the other part, that is down.

So we have, over here, the object nodes. So this is a boundary object. This is a service object. And this is an entity object. The symbols remain the same, no change. Messages shown over here, along with all the parameters, there is no sequence number over here. Because we understand that the object makes a call, and the second call goes a little down, and so on. So the activities are carried out or shown on the sequence diagram in order.

So we say makeReservation. It is a message which is being sent to the service. And service makes a Reservation object. So no message call, but the stereotype is shown, telling that it is a create. It creates a Reservation object.

Reservation object is returned back. Now, the symbols which we use in the communication diagram and the sequence diagram for the arrows to show the direction that is same. So a solid line with a solid arrow is a synchronous call. Solid line with an open arrow is an asynchronous call. And a dashed line with an open arrow is a return value showing the return.

Now here, we can see that lifelines are shown. If I draw an actor over here, the lifeline of the actor will be completely there. It will never end because actor is always available till the end of the use case. These are the activation bars shows at what point of times the object was active.

So we can see, over here, for a Reservation service, we can see the activation is shown only for the making Reservation. When you say getReservationNumber, the Reservation service object is not active at that time because you are required to communicate with another object, maybe, directly. It shows a direct communication over there. So the object nodes, the messages, explicit return, and the timeline, the lifeline, and the activation bar-- these are the various elements in a sequence diagram.

Let us take a look at-- we can create sequence fragments. These are very popularly used. So we can create the fragments to show various activities, like if you want to show any iteration, any looping activity, we can create a fragment for that. Maybe we want to show an alternate path. We can create a fragment for that, too.

We can allow two or more scenarios to be shown on a single diagram. We will see, actually, one such diagram where we show both the alternate scenarios in the same sequence diagram. UML 2 allows that to do it.

We can show reference to another detailed sequence diagram fragment. We can just show the fragment, and we can go to another place where the fragment is expanded. That itself is a complete sequence diagram. It also allows you to break up a large diagram into several smaller diagrams. So these are the various possibilities which we can have with a sequence diagram. Now, let's take a look at one of the fragments.

So we see the fragments examples. We can see various types of fragments in this diagram. Whenever we have a fragment, what type of a fragment it is, it is shown over here. So we say this is a loop. We have librarian as an actor. And we have two objects-- a borrow book UI, which is a boundary, and we have a loan service, which is a service object. The lifelines are shown for the actor, for the borrow book UI, and for the loan service. These are the lifelines. You can see the dashed lines over here.

Now, when we write a loop, we write a guard condition over here. We say while more books to borrow. So this is a guard condition. When this guard condition is true, the librarian scans the book code, the librarian actor. So book UI we say scans the book code.

And here we have another sequence fragment which says validate book code. So there's a separate sequence diagram for this fragment where we validate the book code. So after this fragment, we have another fragment over here, which is an alternate cases. So that means there are two possibilities, two use case scenarios are discussed in this particular fragment.

The first fragment says the code is invalid. So when the code is invalid, the control comes back, and we say please rescan. So that message comes back to the librarian that code is invalid. So you need to rescan the book code.

To show a second scenario, we have a dotted line over here, a dashed line. So the first part is the first case. The second one is another one, a happy scenario now, where we say the code is valid. When the code is valid, we carry out a second fragment that is assign book to member.

So we understand the whole process in the loop that we will [INAUDIBLE] me borrow more than one books. Hence, there's a loop. And while you have more books to borrow, for every book, you scan the code. Once you scan the code, there is a validate book code fragment.

That fragment gives me a result back. And I have two scenarios over there, one where the scanned code is invalid. So when the code is invalid, we give an indication to the actor that please redo the action once again. Scan the code once again.

Second scenario says it is a valid code. We execute another fragment where we carry out the activities to assign a book to the member. And it returns the message back to the client saying the loan is OK. So this is an example of fragments. We could see the loop fragment over here.

We could see a fragment which refers to a completely different sequence diagram. There are two such fragments over here. One is a validate book code, and the other is a assign book to member.

And then we see another type of a fragment where it is alternating. You have an old fragment. That means main flow and the alternate flow both are shown on the same diagram.

Now, in the next three slides, we will see three different sequence diagrams. The first one shows me a primary or a successful and a secondary scenario together. That is-- again in main and alternate flow in the same sequence diagram. The second slide will contain a secondary or unsuccessful scenario where the rooms offered are rejected-- the same scenario which we saw in the communication diagram.

The third fragment shows me the final ended of a get reservation details fragment in the form of a loop then where we get the various information in this fragment. So let's take a look at the sequence diagram for a happy scenario. We saw the same process in the communication diagram. After we see the sequence diagram, we will have a good comparison with the communication diagram over there.

So the booking agent begins the process, sends a room request to the Reservation UI by passing arrival date, departure date, and requested room type. Boundary object, that is reservation UI, sends a message to the Reservation service, makeReservation, by passing parameters. And the Reservation service creates a Reservation object.

Now, Reservation object is shown separately over here down. We can see all of them are at the same level. This is a kind of a way to show what is created new. So it is created as a part of the process.

Now once the Reservation is created, Reservation service sends a message to Room service to find the rooms. And the room service returns the room list. And after that, we have a sequence fragment, find sufficient rooms on the dates. So this represents a fragment in the sequence diagram 2.

Once the rooms are served and the room list is available, we find the sufficient rooms for dates. After finding the rooms, we set the rooms from the chosen list. And then we have another fragment to calculate the price. So we're calculating the price. And this was, again, a fragment in the communication diagram.

And here, we say set the quoted price. And after everything is being done, Reservation object is returned back. So we have another sequence fragment over here for getting the Reservation details. And held Reservation details are shown to the client.

Now client accepts the rooms and sends-- the accept reservation is being sent back to the service by the boundary. And we have another sequence fragment, identify customer. This was missing in the communication diagram. This was not there. So if you want, we can put one more number over there and say that fragment is also there.

After we find the valid customer, and then we go for the payment guarantee. Now here we can see, once the payment guarantee fragment is executed, we have an alternate and the main flow together, which was missing in the communication. In the communication, we assumed that payment guarantee is OK, and we said the Reservation is confirmed.

Now here, we can see the more details can be shown in a better way. We show the alternate fragment over here. Now, in this alternate fragment, we have the first case where the payment guarantee is successful, and the Reservation service confirms Reservation.

The confirmed Reservation object is returned back. And the client, again, asks for the confirmed Reservation details, which is being shown. So this is end of the happy scenario. Now the alternate one is being shown over here where we say no payment guarantee-- where the payment guarantee is not there, Reservation services destroy the Reservation object, cancel Reservation.

And here the cross over here shows that the Reservation object is destroyed, and the scenario ends on a sad note. That means process doesn't happen. Now I'll clear off everything from here. And we will just have a short comparison for both.

Of course, we have not everything available in both the places. Communication diagram is less elaborative in comparison to sequence diagram. So we can see sequence number 1. The room is requested. The room is requested over here also.

And here we can see 1.1, makeReservation. So here we see makeReservation. You can see comparison. I would rather like to show over here more, you can see this one where we see 1.1.3 fragment for sufficient rooms.

So here, we are showing it with a fragment. Then you have another fragment, calculate price, and you have another fragment over here the 5, 1.1.5 over here.

Then we have a fragment for getReservation detail, which we find over here as 1.3 at the top. Top of the window. And here, we can see, we identify the customer. Now this fragment is missing over here, actually. We don't find any fragment or any process showing the process of identification.

So this is additional over here. Payment guarantee, of course, this is shown over here as a fragment. But it is shown over here in the communication diagram. It is just shown as a simple process. I think I should show you another diagram over here. The previous one, this one.

So here we can see payment guarantee is shown over here. And it is confirmed. But here, we can see the alternate is being shown to us with payment guarantee yes and payment guarantee failed. So we can see, although I could have shown everything over here also on the communication diagram, but it looks too much cumbersome. And, my personal opinion, that sequence diagram shows me a much clearer idea about the process, how the activities are being carried out.

So let us go back. And let us take a look at the next sequence diagram over here. Now this is a sad scenario. So sad scenario says you'll ask for the booking, ask for the makeReservation, create a Reservation object, go for finding rooms, calculate the price. And you'll have a sequence forward Get Reservation Details.

Now, when the reservation details are being shown to the customer, or to the booking agent, booking agent doesn't like the rooms and say reject. So boundary, you can see, over here, the activation of the boundary. Boundary object is active until you get the Reservation. Then you're waiting. There's no activation. And again, the activation starts when the client communicates with the boundary over here. And we send a signal for cancelReservation.

So cancelReservation, again, the service is active now. And the Reservation object is active, which, ultimately, ends up in cancelling this particular object because we do not require this Reservation. So this is the sad scenario.

One sad scenario, actually, we saw in the previous diagram also, over here, when there was no payment guarantee. Here also, we can see that the Reservation object is actually destroyed. But the scenario is different. It is at a different point of time.

So here we go, now, for another sequence diagram where we show the fragment of the loop-- a very simple one. The UI sends a request for getting the rooms. And we get the room list from the reservation object. So reservation object has a list of all the available rooms.

Now the booking agent has to select some of the rooms. You'll need to present a list onto the UI. So we say get the room type. We put a loop over here. We say while more rooms are available, get the room type, get the room identity, get the description. Everything is being shown. And, after that, we just get the quoted price. So this is what we have over here in a sequence diagram for this.

So by this, we come to the end of this lesson, a big lesson. We talked about the interaction diagram. Interaction diagrams can be communication diagrams, sequence diagram, or interaction overview diagram where we show the combination of activity with the sequence fragment. We talked about that robustness analysis, which we carry out to find boundary elements, and the service elements, and the entity elements.

We create interaction diagrams to show the communication among these three types of components. And to show this, we created two types of interactions, one we created as communication, and the other we created as sequence diagrams. Both in communication and sequence diagrams, we can show the fragments, and the fragments can be expanded separately in the form of another diagram.

## 3. Lab 8: Transitioning from Analysis to Design Using Interaction Diagrams - 11m

So let us take a look at Lab 8. There are fourth activities. Activity 1 and 3 is a very simple one. We just need to identify the elements of Communication Diagram and elements of Sequence Diagram. Activity 2 and 4 is to create a Communication Diagram for the check-in process. And Activity 4 is to create a Sequence Diagram for the same.

So let us take a look at Activity 1. So these are the symbols given and here is our solution. The first element is an object node.

The second element is a message link. Third one is create object message. We can see the stereotype over here.

And the fourth one is a boundary component. We can see the icon to show the boundary. Next one is a service. And the next one is an entity.

Simple first exercise-- second one is an interesting one. So we go back to Lab 4, where we created a Use Case Form for check-in. We rig the main flow of events in the check-in Use Case Form. And we place the Actor for the use case on the diagram.

And we analyze the flow of events. We identify the boundary elements, the service elements, and the entity components. Then we draw the associations between these components, and we label the actions performed by each component to satisfy that interaction in the use case.

So if we wish, we can create a diagram for another scenario, also. So here is our solution. This is what we have. Let us take a look at this now.

We begin with number one, where we say, enter reservation number. That is the receptionist, is the Actor over here. So you go to the counter. You give the reservation number. The reservation number is entered-- Activity 1.

1.1, find the reservation number. So let us first take a look at, in general, what are the elements we identified? Actor is identified, which is receptionist.

Then we have check-in UI, which is a boundary. Service is a reservation service. And there are four entity elements, which are related to this activity.

So we have chargeable item. We have bill, room, and the reservation. So we are defining the communication among all of these components.

That process begins when you give the reservation number to the receptionist. 1.1, the reservation is found. 1.1.1, the reservation is returned. And then we have a 1.2 fragment, get reservation details at the top.

1.3, we get the reservation details. 1.4, maybe the customer proposes to change the assigned rooms. So after this, we begin with 2, the Activity 2.

Activity 2 says, rooms are accepted. And then begins the process 2.1, where we say the fragment payment guarantee is being carried out. And then we have 2.2, accept check-in. Now accept check-in has a lot of processes in it. There are in total around 10 to 11 activities.

We can see 2.2 begins with accept check-in. And 2.2.11 is the one which completes the total check-in process. So during this, a lot of things happen.

2.2.1, you've checked in. Then you'll get the rooms. You get the room list.

And the room is occupied. And 2.2.4-- let me just take a look at-- yeah, fragment 2 includes the key generation. And then we create a bill.

After creating the bill, you have 2.2.6. You see the quoted price, because that is to be added to the bill. And the room is, of course, occupied.

And then we have create a price type. You are selecting the items which are chargeable. And you are carrying out that process.

Add the chargeable item, then payment guarantee for the additional items. The note is over here about this fragment-- include change room form status. All these things are happening.

You add all the charges. Payment guarantees are being given for all of the chargeable items. And in the end, 2.2.11, you complete the process.

So the whole bunch of activities-- that is once the check-in starts-- occupant of the room, enabling the room form, looking at the price, putting it onto the bill, creating the bill object, adding the various additional items, and doing all of those things. And in the end, we say, OK, the check-in is completed. It looks very simple, because everything we are putting with the simple things. And a lot of things are being put over here in the fragment. So this is a very clear view of the total process.

So let us take a look at Activity 3. Activity 3 is about the elements of Sequence Diagram. So let us see the solution. Here we are.

Customer Actor Node-- then there is an Object Node. Activation Bar is there. Lifeline is there-- return arrow and a message arrow. So very simple symbols-- we have seen these a lot.

And then we go to Activity 4. Now Activity 4 talks about the check-in process, the same check-in process, which we carried out in the Communication Diagram. The only difference is we will do it now with the Sequence Diagram.

So here we see it's a lengthy diagram. Maybe I will do it in the scroll mode. Because I don't want to reduce the size over here.

So we can see the receptionist. The process begins when the receptionist enters the reservation number. And Reservation Service finds the equivalent reservation for that particular number and will return the reservation object to the boundary.

And from there we have a sequence fragment for getting the reservation details. Details are presented to the receptionist. And there is a fragment for assigning change assigned rooms.

So we can do that. New rooms are accepted. Payment guarantee is carried out. And we say, accept the check-in process. Now everything is OK.

The check-in process begins. Rooms are accepted. Everything is OK.

So the customer checks in, gets the room. You get the room list. You have a loop where there are more than one rooms occupied.

So every room is marked as occupied. So you can see this brings you more clarity. So then we didn't understand that whether there is one room, which is to be occupied, or more than one room is there.

So everything is left to the fragment. But although we are not explaining everything over here, we can still show that this is a loop. And the various rooms are being occupied, we say, for each room in the room list.

So then we have a fragment to create the room keys. We create the bill, get the quoted price from the reservation object. We can see the reservation object active over here at a number of places.

And then we go forward to create the chargeable items. The customer is opting for a chargeable item. Add the chargeable item to the bill. Bill is active over here.

Then there is an optional fragment over here-- payment guarantee for additional items, which includes sequence fragment for including changing the room form status. Charges are allowed. And the total process is complete. And the reservation check-in is completed over here.

So this is your Lab of Lesson #8. I think there is one more activity over here, which is showing the details. Check-in UI-- you get the customer details. You get the last name, get the room list.

And here you have a loop, which we saw in our theory lesson, that is getting the room ID, getting everything. Get the arrival date, departure date, get the quoted price. And the ultimate quoted price we are getting from the reservation object and getting the details. So this is your Lab #8.

We discussed the various elements of both types of diagrams. We saw the Communication Diagram and a Sequence Diagram for the check-in process. And here are the details of the reservation details fragment for another Sequence Diagram. So that is what we have in our Lab #8.
