# 12: Introducing the Architectural Tiers

1. Introducing the Architectural Tiers, Part 1 - 48m
2. Introducing the Architectural Tiers, Part 2 - 32m
3. Introducing the Architectural Tiers, Part 3 - 37m
4. Lab 12: Introducing the Architectural Tiers - 6m

## 1. Introducing the Architectural Tiers, Part 1 - 48m

We will talk about architectural tiers in this lesson. We will see tier wise how we build, and what are the issues related to each and every tier, technologies related, how do we go about it, how the GUI model will behave in a different way. There will be different tiers in the web UI model than from the GUI model.

Objectives of this lesson are very simple. So we describe the concept of client and presentation tier. We talk about the concept of business tier, concept of resource and integration tier. And the last part of this lesson will talk about the solution model. So we will lay the foundation of solution model over here. We will see how the solution model will look like, what components will be over there. And then in the next lesson, we will refine the main model in a proper way to see how it can be mapped to an extent so that quoting can be directly done in that.

So let us look at here. We are here in the architecture model. We are done with the requirements model. We already finished with this. And then in this lesson, we will also touch the solution model. So you can see this and these two models we are touching in this particular lesson.

So the tasks which will be carried out over here, we will refine the detailed deployment diagram. We will refine the tier and layer diagram. We will create a design model for a use case using robustness analysis. And we will create the solution model by merging the design and the architecture model. So let us first take a look at introducing the client and presentation tiers.

Now, in the client tier, we can see the various technologies residing. There can be two major clients which we can talk about over here. There can be a variety of clients. There can be mobile clients, other handheld device clients. There can be machines, the various systems which can behave as clients. But here, we are talking about basically two different clients-- the clients with a graphical user interface, like a desktop Windows, and the web UI.

Now, in graphical UI, you will see that view and controller can be seen somehow together. So we will see view will provide the inputs and this will process the request. Or a more appropriate can be used as parsing the request. It can parse the request, make it ready for the business process.

And in the case of web UI, you would see that you will have-- OK, I'm talking about views, so let me say the view and the controller. View will be your web page. And your controller normally will be a servlet. Normally this is how it will go.

So let us take a look at the various primary components. Like, controller is one component. So controller controls the input from the boundary. So you may have a boundary over here. So I may have my GUI screen. So on the GUI screen, there will be various-- inputs will be there. Here, labels are there. Maybe some button is there. So when you click on this button, you will see that there will be a piece of code related to this. We will talk about it more in the next coming slides.

And if we have a web UI, it will be something like you have a web page. And this web page will take a big leap over by using HTTP protocol. And it will reach to a completely different tier where there will be a web component which is a controller. So here, this is a controller. And here, the code which is associated with the button or with any action element over here, that will be considered as a controller.

Now, this will take the data. This will take the request. And it may perform some kind of sanity check. Now here, the data may be there. The data may go. There may be some other small kind of an event which is just performing something called as a sanity check over here. So why do we do it? We will talk about it. We don't want a lot of network traffic to the server. So we will take care of that.

Now in short, we can say the controller component controls the input from the boundary. It will see whether the right input has come. Controller itself can perform the sanity check. If it is a GUI controller, it can fetch that data from all the text fields over here. It will fetch the data and it will perform some kind of a sanity check over here. And here, even though after checking the data you are sending, it will have a server side sanity check-- validation or sanity check-- will be here.

So ultimately, controller is performing some kind of a sanity check. It is responsible for parsing the request. It will parse the request, perform some operations, make the data ready, and will send the data to the business logic. And from here also, it will make the data ready. And say if this is a business tier, there is a business logic. It will send the data to be processed to the business logic.

Now, it will dispatch the view components. Once everything is being done, there may be conditional processing, or there may be processing based on certain criterias. So once everything is done, then what it will do, it will forward the control. After the business logic performs everything, the view will be sent back over here. And here, in this case, once the business logic is done, the control will come over here, and controller will select a particular view and send it to the client. So it can control the input from the boundary, perform the input sanity check, call the business logic methods, and select a particular view component.

And then we have the view component itself. View component can be your GUI screen or it can be any web page. And it retrieves the data required by the view. So once the data comes, it will retrieve the data for that view purpose. It will prepare the view in a suitable format. If it is a GUI, then the data will be pushed, or you can say into a particular kind of screen. And if it is not, then a particular web page response will be created, and that response will be sent, and the browser will be able to render the pages.

The biggest challenge in this will be that how will you render the page depending upon the browser. Browser-sensitive response has to be sent. So it can also add client sanity checking sometimes. We will see that usually happens in the web applications. Now, talking about the clients, we talk about the boundary interface technologies, though there can be a graphical user interface, as we discussed on the board. The graphical user interface technologies can be a variety of technologies related to the GUI.

As we are talking in this course in reference to Java itself, so we can say we stick to Java. It can be AWT, it can be Swing technology, or it can be SWT. Otherwise, if it is a mobile, we can use MIDlets. And if it is a web UI, then of course, we can use HTML, we can use TSP. We can use TSF, and so on-- some to name.

And there can be a third kind of boundary interface technology that is where the machine or a device interface is provided. Normally, it may happen in the form of web services. So one web service can communicate to another web service, or a service client can communicate to another client, where it will be communicating in interoperable form. That means the client and the service can be completely decoupled. You can have a client in .NET. You can call a service from Java. So Java services can have .NET clients. And there are a lot of other things involved in that.

But yes, interoperability in the form of hardware, platform, technology, everything that is being provided. And various ways to communicate via web services-- we can use big web services like SOAP-based web services, or we can use the latest ones which is being introduced in Java EE 6, like REST-based web services, which is a bare XML over HTTP. No SOAP Envelope, nothing like that. Other boundary interface includes you can use touchpads, direct manipulation, joystick, command line-- any of the ways you can use. You can use voice, or you can use some kind of keypads, and so on.

Now, talking about the generic application components-- of course, we discussed about it, but just an overview once again. A normal application-- you will see we will have a component controller. We will have view, we will have service, and we will have entity. So these are the various views available, various components available.

The four components-- the controller, as we have seen in the previous over here, controller jobs are very, very clear. View, what can do-- that is also we discussed. Service is nothing but a business logic. Now, one service can make a call to another service, or one service can communicate to an entity. One service can communicate to a data access logic to fetch some data from database and fill the data back into the entity. And then entity can be sent back to the controller, and controller to the view.

Controller can communicate to the entity. Controller can communicate to the service. View can also communicate to the entity. We say a name more like a logical way. Normally the style is that view communicates to the entity via controller. Best practice-- as a best practice, you can say we do not want the volatile components to communicate to the stable components directly. One of the best practices. That is what we can see over here.

And then this is how your GUI screen will look like. So here, we can see that the GUI screen, the graphical UI where you have the various components. The main thing which we need to look at over here is the screen is divided logically in the various formats.

We have various formats. We can see the first part can be considered as two columns-- one where the reference label is there-- first name, last name, phone, address-- street one-- and so on; and the second column where you have all the text fields where you can input the data. And the next one, the second panel, which we can see over here, are three buttons over here in a row. So logically, we can see how the screen design is-- this is one particular screen-- when we talk from the screen design perspective.

So we can see this kind of screen design can be understood over here. So this contains one group of view components. This contains another group of view components. Here, there are three components. And here, there is a single component on the right hand side that is right justified-- so various components.

Now, creating, you can say, user-friendly screens is an art. So there are specialized people only four UI. So there have to be many things in that, like you have to think about who are the users. You have to think about the duration for which the application will be used-- this UI will be used-- whether your user is illiterate or whether you're literate in the sense-- whether your user is computer literate, or are you creating an application which is going to be used by people who are above 60, and so on.

These are only some of the points. There are a lot of points in this which one has to take care while designing the UI. Maybe you are designing gaming software for kids. So certainly you would not like to use a combination of gray with yellow-- a very, very dull combination. You will use very catchy colors. And if you are designing something for a banking application where people have to sit from morning to evening to operate on the screen, red and blue is certainly not a combination which anybody would like to go for.

So now, taking a look at the design which we can think of, so normally, if we look at this part of the design only, our design over here, so we can see we have individual components. These individual components we can see are grouped together here. Then these are grouped together over here. So we can see we have various components that can be grouped into panels. And there are panels. Panels may be placed on a certain window frame. And window frame may have some common hierarchy. So that is what we can see over here on the slide.

Well, we say customer UI is your screen. And this screen contains a JFrame. This is your JFrame. This whole is a JFrame And from the JFrame, we can see that there are different panels. Say this is panel number one. This is panel number two. And each panel has a group of components.

So say over here, there is a row of buttons-- button one, button two, button three, and so on. So you will see this kind of a tree structure will be used wherever you are creating. So the normal style is you will have a frame. Frame will have panel. Every panel will have its own layout. And within that layout, we will try to fit the various components. Sometimes there can be a chance that you have a panel within a panel. It depends upon how complex your UI is.

Now, once we create the UI, you can input the data in the UI. And now, when you click on a button or when you perform certain action, this UI is supposed to do something. Like here, if you click on Search, it should perform the search operation. If you click on New, we expect that all the data will be cleared out and a new, fresh screen will be available for us. If you say Update, or maybe if you say Save, then some operation has to take place.

Now, how Java achieves this, we need to know about this. Let us take a look at the event model for the Java applications-- how we can make our application to respond back. So there's a standard way out. That is how we follow it. We will perform some kind of a comparison. Here we will see about the GUI, and here we will see the scenario when we go for web UI.

Now here, in general, in the case of applications, we can see there are three components which perform the total task. So you have a source. Say, for example, I create a JFrame. I take an example from Swing. And here, there is some text field. Here, is another text field. And here is a button. So we say Submit.

The button will be called as a source. Source is where the user action will take place. When you create a source, this source should be associated with a listener. When the source is associated with a listener, when the user takes any action, user action will be heard by the listener.

And when you take the action, this source will produce an event object. And this event object will be sent to the listener with all the details of the event. And then this listener is associated or is being implemented by something called as event handler. And that event handler knows which task to be carried out.

So Java follows event delegation model. The events are delegated by the sources to the listeners, and from the listeners to the event handlers. And that is the model we are talking about when we are talking about GUI. We can see the similar thing over here on the screen. So buttons are associated with the action listener.

So here, we can see the Update button is registered, or you can say it's associated with the action listener. When the booking agent presses this button, the actual Update button will delegate the event or delegate the action to the action listener. And action listener knows what to carry out, what task is to be done.

Here, we can see-- over here now-- so there are three different buttons. You have Search button, you have a New button, and you have an Update button. So Search button will be associated with one action listener. New button will be associated with one action listener. And the Update button will be associated with another action listener.

So whatever button you press, on whatever button the user takes an action, that button's listener will listen to the event, will catch the event from the source, and will delegate the event to some other place where the event will be delegated. And this is the place where the event is delegated. This is acting as a controller in the total scenario.

So we understand now. This is my view. And this is my controller. Now, controller after handling-- we will see in the next parts-- it will go to the business component. And there, the actual business logic processing for a particular event will be carried out.

If we take a look at this-- now, from the business component where the business logic is carried out, it will, after processing, will send the data for the persistence. For theoretical purposes, I'm creating a database symbol so that we understand that we are talking about a repository over here. This repository can be anything.

Now, here, when we see-- this is my view. This is my controller. And these two put together, it will create my model. So this makes my M, V, and C model. This is what you call it as-- your MVC model.

Now, MVC is of two types. This is what we are talking about. We are talking about model one architecture. Model one is usually used for the applications which are non-web UI applications. So let us take a look at what these three components will do.

Now, view will display the information for the user, as view can be a GUI screen. And it implements the update procedure. If you click on an Update button or if you click on a Save button, or if you click on a Delete button, whatever the action, that action will be carried out to the controller. Normally, the view will send the user actions, which are normally called as user gestures, to the controller.

It can also retrieve the data from the model, in this particular MVC button, what we are talking about. And view will communicate to the controller. The controller accepts the inputs from the user in the form of events. It can translate these events to the service requests for the model, because it needs to do the request processing. And then it will send everything to the model for the processing purpose that is for the business logic.

And it will translate the events to display the request to the view, because it will select the ultimate view-- which kind of view needs to be dispatched for the view purpose to the client. And the model will be the functional core, where the total your domain logic-- the business logic-- will be implemented. And it will notify the dependent components about the data changes.

Now, does it to ring a bell in our mind when we talk about the model notifies? So that means I can understand something like this. This is my model. Say here, there are various views-- view one, view two, and view three. So here is my controller. Of course, all the views are communicating to the controller. Now controller sends over here to the model. Model does everything.

After doing everything, now what the model will do? Then there's an update, when there is a change in that data in the model, we say model will send notification to the views. When model sends the notification to the views-- remember in lesson number 10, we talked about something called as an observer pattern.

Now, the idea to understand over here is MVC itself is an architectural pattern. To implement MVC architectural pattern model one, we are using another best practice, which is called as an observer pattern. We will see that very, very clearly in the coming slide-- the next slide over here, actually.

So here, we will see another thing that your application contains controller and a view. The user can communicate to the view. View, in turn, will communicate to the controller. Under some circumstances we can say, logically, that user can communicate to the controller when the user presses a button.

And the controller communicates to the various parts of your application-- that is, the services and the entities. Services and the entities put together over here make the model. This makes the model. So the model needs to communicate back over here to the view. We will see over here. It uses the MVC pattern. We have used this slide previously in lesson number 10 when we talked about the observer pattern.

So internal design is something like this. Whenever the listener is added, the components are created, there is an intimation to the model. So whenever something happens, you can see over here, within the component itself, there is a model view controller architecture. So whenever something happens, some business logic happens, it will send the intimation to the view to refresh itself, to update it. So we can see that MVC uses another design pattern, which is an observer design pattern.

We are in a position now to fill our first tier. We have talked in detail about the GUI application. So in the client tier with the GUI, we see over here that we have any PC. We have any operating system. We use J2SE version 1.3. And from here, we used Swing. And using Swing API, we created the reservation model GUI application component. So this is what we have done in that on the GUI end.

Now, next is we would like to explore about the web UI. So in web UI, we provide a browser-based interface. And the web UI clients are the thin clients. But there are different kinds of actions which take place when we use the web UI.

So the thin client will send a huge amount of information to the controller-- that is, to the web component for the request processing purpose. So these kinds of requests are sent over HTTP. We call these requests as HTTP requests. And in the case of web UI, we will see a different kind of a design happening over here. It will be different from this.

So say you have a web page where the user will view the different information. User will come to, say, the hotel website. And user will see some things. And user wants to book some information. So user may be looking at the various kinds of facilities provided by the hotel. Every time the user clicks a link, it's a new web page coming in front of the user. The web-based application has a different kind of a workflow where the different information or the different views are provided in the form of different web pages. And only one will open at a time.

Say this was the home page of the particular web application, and the user viewed the facilities. And then the user viewed the various-- maybe you can say the location, or about the hotel, or, say about. And after that, user decided that user would like to book a room in this particular hotel. So the user gave the inquiry-- that is, the date, the arrival date, departure date-- and clicked on the button called as Find Rooms. So once the user clicked on the Find Rooms, a list of all the rooms was being provided over here in the form of maybe a different web page. After selecting it, whatever the rooms are, when the user selected the room, user clicked the final button.

When user clicked the final button here, now the UI provided the page where it said sign in or sign up. So that means whether you are new user or whether you are already existing user-- you have already visited the hotel. You are existing customer. So from here, it will go to another set where once the registration is over or about whatever you have done-- say I sign in-- or here, there will be an alternate flow, if you sign up. And this is you sign in.

And after doing both these things, you will come to another workflow where you will have payment details. And then from here, you will have the final reservation details over here, maybe. I may be missing something, but this is the overall idea.

So the thing which we can see over here-- but if the same things were happening over here, this is a different kind of a thing. Everything is coming maybe on the same window. But here, you would see that your flow is one page at a time. And it will be rare that the same flow will be used by any other use case. There may be some very common ones which can be reused.

In the case of web UI, we need to understand that the pages are normally pertaining to a particular workflow. There may be some only which will be used again and again like a login or these kind of details. So there is only a single path through the screens. So only one screen is open at a time. You won't see more than one web page is open at a time.

Now, web UI is constructed as a sequence of related screens, as we can see from here. So whatever the pages are coming, we will be designing the screens in that particular way. And each screen has its own UI components, because every screen, every web page will use the HTML GUI components, or HTML UI components, which are usually considered as a DOM-- document object model-- by W3C. So this can be communicated via JavaScript where you want to perform some kind of a micro event for validation purpose. That is what you will do.

So a web UI presents the user's view of the domain model. Once everything is there, you will get the final outcome. And it is rare that a screen may be reused by the multiple use cases, as we can see. Only cross-cutting concerns, like maybe some kind of auditing, or maybe some login-- so these kind of screens can only be re-utilized.

So this is something I already shown you-- similar kind of thing. You may request being a customer. You may request for the room selection. Search results will come. You will go for customer login or create a new customer, confirm the reservation, and view the reservation. So this is how we will go about.

Here, we can see two kinds of events happening in the web UI event model. Here, when we talk about the GUI event model, we talked about delegated events. In the GUI, we have delegated events.

When we come to web UI, you will see two kinds of events-- micro events, and when you say sign up over here, when you sign in. And from here, when you sign in, it will go to the web component. So this will use HTTP. Or even when you say find rooms, from here to here, there may be internally a web component which is performing the total-- this is a business component. And then that will bring the results back to you.

So the request which is sent from the web page, from the web page to the web tier-- that means where your web complement is-- it is called as a macro event. And when you input some data into your web page and you want to validate the data before you send the data to the server, because you don't want many round trips for every wrong data-- so you want to be sure from your side that nothing wrong enters into the server, because it is costing to you on performance.

So what do we do? That is called as a micro event. So in web, you will have a total different event model. Micro events are those events which are locally happening onto the client side, maybe for sanity check purpose. And the macro events are those events where the client sends a huge amount or a bulk of data-- the whole of form data-- to the web component over HTTP. That is what we call as a macro event.

WebMVC model-- now, it is interesting to know WebMVC model is a little different over here. So let me find out a place to draw it. Maybe here, a very small one I will draw. So say this is your model. This is your view. And this is your controller. We will just see the communication. We will not see what actually is happening.

So we can see that view renders the HTML response. Now, view is a form. And once the form is filled, the data goes to the controller, which can be a servlet. It goes over here. Servlet, in turn, will communicate to the model for the business processing purpose. Model finishes everything, sends the details back to the controller. And controller is the one which is the deciding authority to dispatch the model.

I will not like to draw any communication between the model and the view, though I can do it. So view model can send a notification to the view, which is of course costly, in the form of a server push. or the client can ask the model to give the details by using a client pool. But of course, different technologies will be involved, and we are not about to talk. The normal model is, every communication between model and the view goes via a controller. So we will stick to that kind of thing over here.

So we understand view renders the response. It requests updates from the model, and provides HTML forms for user request. The actor will fill those forms The data will be sent to the controller, verifies data for the HTTP request. It maps the user data to model the updates. So whatever are the updates will reach to the view on request when view would like to refresh itself.

There is no automatic notification not done at every point of time. If it is 100% required, then we may use some other method, like I told you client pull or a server push kind of a thing But in nominal conditions, we don't do that.

Because if your server has to or a model has to send the notification to the view, either it has to identify a particular view and notify that. But in the previous model, as we could see, it will notify everyone. So that will be a waste of-- although you can say the performance can come down, because everything is happening in the web application over the network. So model encapsulates application state, responds to the state queries, and exposes application functionality. So these are the various things.

Now here, when we talk about WebMVC controller is essentially a servlet. View can be HTML. View can be TSP. View can be JSF Facelets. Model remains same service plus the entity.

WebMVC pattern is called as Model 2 architecture. That one which I draw over here for you-- this one-- we can call it as a Model 2 architecture. So here, we had Model 1. So Model 1 and Model 2 architecture we can see.

So servlet acts as a controller to process that HTTP request. It verifies the HTML form data, updates the business model, selects the dispatch for the next view. And JSP or JSF can be used as a view. When it is JSF, it is an XHTML Facelet. And Java technology classes can be used, whether local or whether distributed. EJBs can be used. RMI can be used. Web services can be used for the business services.

And the entities can be used in two ways. If you are designing your application or architecting your application before Java EE 6, then maybe I can use entity EJB to as an entity which will communicate to the database resource. If you are using Java EE 6, then these are deprecated. These are not supported, not available. So in Java EE 5, we find that there are only session beans, and there are message-driven beans.

So in that case, these entity EJBs have been replaced by non-EJB JPA entities. We will see this is what we have. So this is object-relational mapping, more encapsulated form of doing the things. So that can be done. We don't say that we totally rule out the JDBC. It depends upon the situation. Instead of using container-managed persistence with an entity EJB, we will certainly prefer to use JPA entities over there.

So let us take a look at the overview of the tiers and layers package diagram for the web client. Now, we have the various chassis over here. We have any PC, any OS, any browser. HTML version we fix over here for 4.0. And the client UI is a HTML 4.0 form in the browser.

On the presentation tier, we say it is Athlon. It is hosting a Linux operating system. We are using Tomcat version 4.0, J2SE 1.3. We can use any other application server also. But right now, we are using this. Because we are not using EJB in this particular design, we find that using complete fully implemented Java EE server may be a waste of resources, because RMI is supported otherwise also. So we are ruling out the usage of EE container over here-- fully implemented EE container over here.

So we are sticking onto web profile application server which is with a small footprint. That is Tomcat 4.0. So Tomcat 4.0 supports Servlet 2.3, JSP 1.2. And using this, we are creating various view and controller components which will be deployed onto the web tier within Tomcat 4.0 application server.

## 2. Introducing the Architectural Tiers, Part 2 - 32m

So after the client tier and the presentation tier, we talk about the business tier. The business tier contains the business logic. And it contains entity components and the service components.

And what are the tasks which are carrier out in the business tier? We can perform the validation of the business rules. And we can perform the updates on the entity components.

Now, it will be normally like this. We have a web tier, or we can say presentation tier. Presentation tier component will prepare the request and will send it over here to a business component.

Now this business component can be any of these three types. It can be RMI. It can be EJB. It can be web service. It can be many other than these also. It can be implemented maybe by using CORBA protocol. So this will be more like a technology independent. Because CORBA components can be implemented by using C++ or by using any other technology.

If we are using RMI we will be using JRMP protocol. That is Java Remote Method protocol. If we are using EJB we will be using IIOP protocol with CORBA. That is CORBA IIOP protocol.

Or we can say, RMI in Java two types. One is with IIOP. And other one is with JRMP. So JRMP are the pure RMI components. IIOP, Internet Inter-ORB Protocol, which is used the EJBs. So this provides me a facility. I can have local components or I can have the remote EJB components.

And if I am using web service I may be using REST or I may be using SOAP. These various kind of business components can be there.

Now, using this I will implement the business logic. I can do business tool validations. If it is a complex business logic, it will be going into various components from here to various conditional. Depends upon how complex your application is.

And once everything is done, normally every business component will communicate with one or more entity components. Because after performing the business rules what do you want to do? You want to store the results somewhere. So these entity components, in turn, will be carried to the next tier.

So we find there can be updates. You may create new entity components. You may update entity components.

Say, let us take an example of a hotel reservation system itself. Say there is a request from the client to add one more room to the reservation. Or there is a request to change the room. So that means in either of the case, entity over here, which is reservation, will be communicated by the business component. Either it will be updated-- in this particular request case, it will be updated. And if it is a create reservation request or make reservation request, then the new object will be created.

And this is also communicating with the room entity. Now room entity will be normally updated. Room is a permanent entity which is existing in the hotel property, so we will find it will say available. So when it is a booking, it will say true. And when the booking is over it will say false.

So that means when the booking is there, that means room available is false because room cannot be used by any other reservation. And once the customer checks out, again, you will see that the room object, room entity, will be updated by making it available is equal to true.

Now business tier may be accessed by a variety of components and by a variety of rules. I already made a list over here. We can have CORBA components. We can have RMI, JRMP or IIOP components. In RMI IIOP, you can have local and remote. And here in the web service, you can have REST or SOAP. In addition to that, you can make your own user-defined way also to do things if you wish to.

Now talking about the local access to a service components. Now here we need to understand, what do we mean by local? What is the meaning of local? Say this is our Tomcat 4.0. Or say it is an app server. Let us be more general rather than going for specific.

So this is a app server. Now in this app server there is a web component. There is a web component.

Now this app server contains something more, which we have not yet talked about. And that is what we call it as JVM, Java Virtual Machine.

So when we have an EJB here itself maybe one or maybe multiple beans or whatever it is. And there may be some other kind of component classes. Now all the components which exist in the same JVM are called as local. We call these components as local.

Now in a single JVM, when you have a local class-- and there may be another scenario over here. That scenario can be something like this. That may be there is a single JVM and here there is some kind of a UI you have made available over here. And this is your business component. So that means these two are existing in the same JVM. So these can communicate.

Now we need to understand when there is a communication among the various objects within the same JVM. How does it communicate? Every object will have an object reference. This object will also have the object reference. This has its own object reference. So every object has an object reference.

And when we communicate within the local JVM, that means within the same JVM, it is when you-- say this object calls a [INAUDIBLE] called as make reservation bypassing customer entity and reservation details entity. Say it does that. Now what goes inside is a object reference goes inside.

That means what? That means when this business component will make a change in any of the received parameters this change will directly be visible to the client. You don't need any specific way because you are receiving some object references. Using those object references you are communicating.

So because every object reference will have some area of memory where every object is communicating, so you have a common heap area where you are making the changes. So it is visible from one component to another component.

Now, as we can see on the slide, we can see a UI frame directly communicating to reservation service class. This is a very, very rigid design. It is a rigid design because you are directly communicating to the class. So the design will become brittle. Tomorrow you want to make some change, there will be a problem.

Now, here we can see we can apply the same thing, we can use a local component, but we can use our dependency inversion principle over here. So that means our reservation form UI will communicate to the reservation service through an interface. So when it is using through an interface, it applies the interface and implementation segregation principle. And we see that form keeps on communicating with the reservation interface.

An interface can be implemented by any of the providers. There can be multiple logics existing depending on various scenarios without the knowledge of client. Until there is no change in the means of communication the parameters which you are passing, or the name of the operation is not changed, everything remains very, very flexible.

Now talking about the remote. Now I would like to design something over there in the form of a remote. What do we mean by remote?

Now remote means over here say this is one container. Let us say this is a web container. It can be any web container, [? JVOS ?], Apache, WebLogic, Glassfish, Article Application Servers, WebSphere, anything. So that means this web container has one Java Virtual Machine inside this.

Now, you have a remote component. That means it is certainly not in the same container. Say this is a EJB container, for example. Or it may be any other container, EE, any kind of an EE container. So this will have its own Java Virtual Machine. This will have its own Java Virtual Machine.

So say here I have a web competent, and here say I have any kind of business components over here. And this have to be communicated over a protocol. So that means there is a network involved over here.

So things are not happening that does one request or one use case is not executed within the same JVM, within the same runtime environment. There are multiple runtime environments, multiple JVMs through which you are communicating.

So say this fills the customer and reservation objects. And these objects are supposed to be sent for the business component to be processed. How will you send it? Certainly you cannot send it by the same object reference methodology. It cannot be sent like this.

So what will we do? We have to serialize. You have to send the data byte by byte.

So you have overhead over here on the sender side. You have to convert these objects into a stream of bytes. And then internally, so many other things will happen the data will repackage it and it will be sent depending upon what kind of a protocol you are using. So then it will go over here.

Now once it goes over here this component is not processing bytes. It is processing objects. So what has to be done? It has to be deserialized. This is called marshaling. And this is called unmarshal.

So that means you have an overhead when you are using a remote component. Of course, if you are using primitives, primitives can be sent as such. But most of the time, when you are processing data in the enterprise application, it is rare that you will send individual.

Like for example, if I want to send an employee data, I will not send employee number, employee name, skill set in string. I won't send like that. I will send the whole object. Because if I'm sending individual one then it has to be multiple calls. And there I have to go together and I have to apply another business logic where I will say, OK, how to collect the data from all the various parameters to know that it is a single object.

So you can see over here in the workstation this is your client site. And when you communicate, of course, you are communicating over here with the interface. But this is how exactly it happens. When you use RMI, or when you use EJB, or whatever you are using, whenever it is remote-- when it is JVM to JVM communication, data has to be serialized and sent over there.

So when you are accessing it with a remote service, even though you have a stop on this side, you will see that the data, if it is using any particular entity which is to be sent as a parameter, or the service returns any object maybe a transfer object or maybe any other kind of an object, it has to send it as a marshal the data.

Now, here we can see passing of the parameters. We have already talked about it. We have seen how the data can be serialized and data can be sent. Booking agent using UI frame using a stub. When the stub wants to send a customer object, it will be sent byte by byte by byte.

This slide shows that how RMI can be used. We discussed in the morning session, but let us just have a small review of this. So we will see whenever we are using code RMI, that is RMI JRMP, RMI registry will act as a registry place where all the remote components will be registered. And we will see that is called as binding the stub.

We can see your whole reservation system business application binds to the stub. That means it published all the remote components onto the RMI registry. And RMI registry should be started, should be in the running mode. Then only you can bind the stub.

Once the stub is bound, the client has to find the stub. When client finds the stub, RMI registry returns a stub proxy over here. Stub is returned in the form of a proxy.

Now on the client side, there is a local stub existing. And the client will keep on communicating to the local stub. And this stub will communicate to the reservation service.

Now we will see that in the latest versions of Java, I think after 1.2, we do not require to show the skeleton. That is a server stub component because that is managed at the runtime.

So that is why you can see over here when we are talking about RMO stub is directly communicating to the implementation class over here. We are not showing stub to the skel and skel to the implementation class because that happens internally at the runtime. It doesn't mean that it doesn't happen. It happens at the runtime. It remains transparent to me. According to me, the stub will go and communicate to my reservation service class.

So here it a revision. We will see now we have already discussed that, but let us just take a look at. We are taking a look only, and only at three tiers now, client, presentation and the business.

So here we can see the customer communicating with HTTP protocol to the controller. Controller communicating the stub. Stub picking up the customer, serializing it, using JRMP protocol. So the client has already looked at it for the stub. That part is missing. That is understood. When the stub is being shown on the client side, that means stub already exists over there.

So the stub communicates to the service implementation. You can see the stub of the scale. Everything is absent on the business tier.

And of course, when we say the service uses the customer that means the service will take the trouble to unmarshal the data which is coming as in the form of a parameter, using it, serializing it once again in case if needs to return. And send it back to the client.

And once everything goes back-- say we are talking about the selection of room over here. Say if a selection room or making a reservation, sending the reservation details, the controller will pick up the appropriate view and send it back to the browser component. We have seen the workflow in the previous tier, that is in the web tier.

So here we can see if it is SE client, that means if it is a GUI client, in that case, your UI will communicate to the stub. Stub will serialize your data. And rest of the process remains the same.

With this we can see the filling of the tiers now. This is for GUI. We can fill the business tier. So whether it is GUI or web UI, the business tier filling remains same. It if is a web UI, you will see one more tier coming over here where we will talk about the servlets and JSP components, Apache Tomcat, and so on.

So that drawing is missing in your slide over here. So we can see the idea is whether this part remains same. This remains same. There is no change.

If we are talking about GUI, then it is this one. If we are talking about web UI, there will be one more tier over here. It will make the client. And this will become the presentation in that particular case.

So here we will see the business tier as Athlon Server, RedHat 7.2. We use J2SE version 1.3. Because we are using J2SE 1.3 with RMI, that is why we are not showing any skeleton on the RMI side. And using RMI components we are creating HRS business application.

Resource tier it is something where the data will exist beyond your application address space. Now, when we talk about resource tier let us have a very small view over here. This is our client. This is our presentation. This is our business. This is our integration. And this is our resource.

So we have to see how deep the data has to move over here. And in case, if it has to send it back any response, so we will see how deep it has to go.

So resource tier usually is the last tier. Because either it contains the data prominently, or it is a gateway where the data will go to entirely different domain and will be utilized over there.

In any case, we understand the data exists beyond application address space. Data exists beyond application address space.

Now resource tier can have that data in database. It can keep the data in a flat file. It can keep the data maybe the data will be given to the web service, or it will go to EIS. Flat file means it can be a regular flat file. It can even be an XML file, a universal repository with data plus metadata together.

Now, when we talk about the resource tier we would like to understand that in which form the data is to be kept. So we say persistence is a property. Often object by which it exists beyond the address space of your application.

Now a persistence object is an object that exists beyond the time spent. Say you run your application once. You created certain objects. And then you shut down the application. Does the data which was being used in the application is placed at some place that when you restart your application once again, maybe after one day, maybe the same day, maybe after one week, one month, one year, ten years, is the data there somewhere so that you can fetch the data and you can see what happened that day? What was being done? Is it available over there?

So an object that is stored independently of the address space. Now that data which is being stored can be used by the same application. It can be used by another application also.

When we talk about the persistence, it is one of the complex activities which can be performed because we need to know in what form that data has to be stored. What is the type of data storage? Is it going to be stored in a database? Is it to be stored in a flat file, or in an XML file, or it has to go to another application?

And even if it is a flat file, what format? What is the low level format of the data? If it is a database, of course, we do not bother about the low level format of the data. But sometimes you may have a complex application there where there are multiple types of databases to be interacted. So every database will have its own low level that how the data is to be kept.

The database schema needs to be mapped to the database. Now the mapping is the bigger part over here. We understand that in my application the data exists in the form of a Java object.

But when it goes to the database it is in the table form. Now I don't know how at the low level it will be done. That is not a part of my task as of now.

So this Java data object, maybe there is a customer object over here with a very small set of attributes. Say I have a cust ID, and I have a name, and I have address.

Now this data needs to be mapped over here into a customer database table, which will have the fields as ID, C name, and C address. So that means I need to map this, this, and this.

Now what are the means of mapping? What is the means of mapping? I need to map my Java data object to my schema in the table. So I can use some integration components over here.

Now these integration components can be of various types. The simplest one which we would like to discuss is either it can be via JDBC or it can be maybe I can use some ORM, object relation mapping. And what these integration objects will do, these will have data access objects. This will have data access logic. That means these will perform the basic CRUD operations.

This will create an entity. And this entity will go to my integration object. And from the integration object, it will be mapped to the database table. So this is what we want to do.

Creating a database schema for the domain model, how do we go about it? So we understood the need. That is a Java data object needs to be mapped to a database table, for example. Right now we are taking only that example.

The logical entity relation diagram can be created. So when we create a logical entity diagram what do we do? We say the OO entities are mapped as tables. That means the class will be mapped. Actually what will happen, your one instance will make one row in a database. And every content of that row will be mapped to a field in a database table.

So the simple mapping is like this. The class will map to the table. Object of the class will be mapped to a database table row. The attributes will be mapped to the fields. And the associations will be mapped to relations. That is what we will do. Relationships between the tables.

Now this will happen at logical level. And when we are creating a physical ER diagram, we will see that we will add the data types on the fields. We will create the indexes on the tables. And we will write the data integrity constraint.

## 3. Introducing the Architectural Tiers, Part 3 - 37m

So as of now, what we have seen is, regarding the Resource Tier, a small recap, we have seen the Resource Tier can be a variety of technologies. It can be database. It can be file, web service, EIS, anything. And the object needs to be persisted in the back end or in any of these repositories, or it needs to be sent to another application.

For that purpose, we need to know a few things about the persistence, like the data storage, the database schema type, and what kind of operations we need to do. Now, to do all this, we start the whole process by a logical entity relationship diagram. And we identify, like we have seen the map over here, that a class will be mapped to a table, object will be mapped to the row, attributes to the fields, and associations to the relationships in the tables.

The physical entity diagram, which consists of a logical entity diagram plus a few more things, like we will add the data types, indexes, and integrity constraints on it. Now, how do we actually do it? How do we implement it? There are three various steps which we will take over here. First, we will convert each class into a table.

Now from there, these classes will come-- remember, we created a Domain Model. So we will pick up those Domain Model entities. And we will convert those entities into database tables. Then we will specify the primary key for each table.

Now, there can be two kinds of identities over here. There can be independent entities, like Customer, like Reservation. Or there can be dependent entities, which are like Room. Like Room depends upon the Property. So if it is a primary entity or an independent entity, there will be a single primary key. A single field can act as a primary key.

And if it is a dependent entity, then we may have a composite key. Now, many times when we talk about the primary key, we may perform certain operations. As we go ahead, we will take a look at that. And then we will use the association multiplicity to determine the type of ER association. That is, whether it is 1 to 1, whether it is 1 to many, many to 1, or many to many.

Now, this is our Domain Model. This is what we had created. And let us take a look at this. We have Reservation and Customer, which has 1 to many relationships. That means one customer can make more than one booking. Many rooms can be associated with many reservations, certainly not at the same time.

So for one reservation, we can have multiple rooms. And one room can be associated with multiple reservations over a period of time. And one property can have multiple rooms.

Now, this Domain Model, we would like to convert it into the Database Model. Or we can say, we will map these entities into the various tables. So there are four classes over here. Let us just note it down over here so we don't have to come back to the slide again and again.

So let us see. We have Reservation and we have more Customer. This is 1 to many. And here, we have Room. And that is 1 to many. And here we have Property. And we have 1 to many.

This is what we have. Let us see how we convert it. So what do we do? We convert every class into a database tables. So here we can see Reservation, Customer, Property, and Room. We can see the stereotype at the top we have written as a table.

And every field of the class has been converted into the field in a database table. So attributes, whatever the attributes are very much over here. So equalling to this, I will create a Reservation table. Let us say we will map it like this. I will just have a small model.

So we create a Reservation table. We created a Customer table. We created a Room table. And say we created a Property table. So this is what we have done.

So we created everything in the form of a table over here. And this maps to this. This maps to this. This maps to this. And this maps to this. Say that is a property. This is what we have.

Now, coming to the next part, identifying or specifying the primary key. Now, many times, what we do is we consider any field in our class or any attribute of the class as a primary key. Like for example, if I create a certain Customer database table, and I am writing a software in the US, so I will make Social Security number as a primary key. Because that is a unique value.

Now, do you think it's a good idea? Certainly not. Reason for this is if you want to use the same software in Europe, you cannot use it. Because there is no Social Security number. So normally, what do we do?

We can use a separate numeric field which can be used as a primary key. Like for example, here we can see we are using Reservation ID. Here we use Reservation ID. Here we use Cust ID. Here we can use Room ID. And if we need, we can use Property ID.

So normally, these are types of fields which can be used. Now, here we can see now Reservation is an independent entity. So Reservation ID is OK. Customer is an independent entity. So Customer ID is also OK. Property is also an independent entity. So property ID is also OK.

But Room pertains to the Property. So what do we do? We use Property ID over here to identify this key. So this can be considered as a foreign key over here. So wherever you will see that we have 1 to many, we will try to identify it by using a key otherwise.

Now, here you can see when we map, when we associate Reservation to Customer, we can say, every customer can have many reservations. So how I will identify a reservation over here, I will add a Cust ID as a foreign key over here. And I will say OK, that means I will have more than one reservations for this particular customer.

Likewise, when I do it for Property, I will say from Property ID, I have the key over here. So this will be a way that I can identify 1 to many relationships. One customer, many reservations, one property, many rooms. So we will see, this is how we can use it for the identification purpose.

Now, if you have many to many relationship, how do we handle it? Normally, we do it by using an association table or a resolution table. So what we can do over here, now, we know that Reservation and Room has many to many relationship. Right? Reservation and Room, it's a many to many. So what do we do?

We create one resolution table over here. And we are naming it as Reservation Rooms. And what will it contain? It will contain the primary keys of both the tables. It will contain the primary keys. So that means you can use it for identification.

All the transactions between Room and Reservation will be available over here. I can find the details from here. Now, as we can see, we have created our Resource Tier now. So let us take a look at the Domain Diagram with the Resource Tier added over here.

So we can see we have Client Tier communicating to the Presentation Tier, Client Tier of GUI communicating to the Business Tier, Presentation Tier communicating to the Business Tier. And now the Business Tier needs to communicate to the Resource Tier. That is what we have.

Before this, we will see that this part is already there. The only part which we are creating afresh now, that is this one. This is the new addition. So the communication between these two is using JDBC. So we are rolling out ORM right now. So we are just trying to understand how it is.

We have yet to create something which will actually do the handshake between the Business Tier and the Resource Tier. We just decided that the communication to the Resource Tier will happen to the Database Tier or to the Resource Tier using JDBC. We are not yet sure how the data access logic is going to appear over here.

That will happen in the coming slides, that is, when we talk about the Integration Tier. But right now, my Tiers and Layers Diagram looks like this. I have a Client and a Presentation Tier. The Business Tier is being already added. The Resource Tier is deployed onto the same hardware and operating system as Business Tier.

Business Tier, Integration Tier, and Resource Tier, all the three are presented physically on the same machine. So we selected our Database. And we also used SQL DDL. And we created our database schema.

The database schema which we have created is very much here. We assume that we created a Reservation Table, a Customer Table, Room Table, Property Table, and Reservation Room Table, which represents many to many association. So this is what we have done.

Now, next, we would like to see and we would like to talk about the Integration Tier. Now, Integration Tier is sandwiched between, this is my Business Tier, this is my Resource Tier. And here in between is my Integration Tier. So this is a handshake between the Business Tier and the Resource Tier.

Business Tier will produce certain entities. And these entities need to be persistent over here in the tables as of now. So I have to perform some kind of CRUD operations over here. And these operations will be performed on the entities. And these CRUD operations, in turn, will write the data to the Database Table.

Now, the Integration Tier is, again, one of the versatile tiers. We can have integration via data sources. We can have enterprise information systems, computational libraries, message services, B2B services. So we can see over here in the Integration Tier, I can have a data source which can be using a particular connection pool for creating a lot of database connections.

And the Business Tier can keep on using those connections and perform the operations over here. We can also have EIS systems sometimes. You know, I may have CICS maybe doing something over here. Very commonly used is JMS.

We can also use even web services over here, that is, B2B. So various technologies or various means can be used to do this. Now, here, whatever we are doing right now in our Integration Tier, we are using a particular design pattern to implement the integration over here. We are using Data Access Object pattern.

Now, Data Access Object pattern, Data Access Object is that object in which we create all the CRUD operations. And these CRUD operations encapsulate the data storage mechanism to the database. So maybe you want to build some JDBC queries. Or maybe you want to use some other mechanism.

Maybe you want to create some message which will send a notification to the Resource Tier. Or maybe you want to communicate to another application. Maybe you want to communicate to another native library or something like that. But here, the Data Access Object can be created for a variety of operations.

All operations are CRUD. But the way you create a DAO will vary from one to another. So what we can do is we can have a factory. We will create a factory object. And this can be considered as an interface. And here, we can have a particular DAO, say, Cust DAO.

This can also be an interface. Now, this can be implemented by various types of classes. Say this is RDBMS encapsulated logic. And this is XML encapsulated logic. This can be some other, say flat file. Or there can be something more, like a web service implemented logic.

So all these classes are implementing this interface. And likewise, I will have the factories. I will have a factory which will produce RDBMS objects. I will have a factory which will produce DAOs for XML.

I will have another factory which will produce for flat files. And I will have another factory which will produce for web services. So let us take a look at this. The factories are marked with red. So these are our factories.

So my style of working will be, I will pick up a certain factory. So once I pick up a certain factory, the factory will automatically produce all the objects. Say I pick RDBMS factory. All the DAO objects, all the operations which are CRUD operations for various entities will automatically be created for RDBMS. Because these two will be communicating.

So when these two communicate, when I create a Cust DAO with the DAO factory, and DAO factory, I pick up RDBMS. So I keep on using the generic object reference, dependency injection kind of a thing. And this automatically picks up that other kind of factory.

That is our DAO design pattern. Here we can see the details. So we see that DAO factory, there are two factories implemented. There are two concretions. One is for RDBMS, other is for XML. Now, when the user picks up a factory, say a user picks up an RDBMS factory, it creates Depot DAO RDBMS components.

And if you pick up XML, then it creates a group of XML. Now, there is a second implementation over here. One is for RDBMS, other is for web service. I can have all the things together like I created on the board. We can have RDBMS, flat file, XML, web service. I can create one more, maybe for messaging or something else.

So It depends upon how you want to use it. So DAO helps me to abstract the source from the procedure. Right? So once the factory is created, I keep on using DAO object without bothering whether I am using RDBMS logic, or is it XML? The factory and the DAO communication automatically brings our things to a right place.

Now, we have now almost filled all the tiers. Now, Integration Tier is here. We create a factory. And factory produces a particular kind of an object. So when I pick up DAO RDBMS, it clears RDBMS objects for me. And now, my business object, my service object, that communicates to the Cust DAO for all the CRUD operations.

So that means all the entities which are created are sent to the Cust DAO RDBMS. And Cust DAO RDBMS is using JDBC. It will pick up the data from the entity, convert it into SQL Query, depending upon whether you want to insert it or whether you want to update it or delete it, or whatever you want to do. And it will perform all the database operations over here.

So the CRUD operations are done now. Now, what is the final scenario? The final scenario is something like this. So we have, everything is OK. Up to Business Tier, we had everything created earlier. It was very much there.

And the Resource Tier also, we settled before the Integration Tier. Now, what happens over here? Service Implementation contains a reference to the DAO factory interface. And this interface internally produces the required object.

And then the service is able to use that object. And using that object, the data is being placed at its right place. Now, this is only a very simplified view of everything just for our understanding. When we go to the Solution Model, we will see, only for one single use case, how many entities, how many DAO objects are created, and so on.

Now, this is our Tiers and Layers final diagram. So we can see, now this is like where we finished our last lesson. This is what we had. But now, stage wise, we are able to create it. We are understanding which technology we used, why we used, how internally we mapped everything.

So we come up with a Web UI Package Diagram for Tiers and Layers. So we have total three physical machines. The first machine contains the Client Tier. Second machine contains the Presentation or Web Tier. And third machine contains the Business, Integration, and the Resource Tier.

So if we wish, we can keep these also separately. But we have to think about the overheads and other things. Now, we talked about JDBC. There is another technology, remember, we talked about ORM. Maybe I would like to use the Object Relation Mapping. Because that is a simplified way of doing things.

Simplified way in the sense that the operations remain transparent to the user. When you use, say I have a Customer entity. I will just write at Entity. And I will say class Customer, Public. And whatever I write over here, here is a Database Table. The Object Relation Mapping tool internally will map all the fields.

And in JPA, it is an alternative to DAO. And it takes the best ideas. The beginning of this was, I think, with TopLink. And then we find that TopLink was Oracle product given as an open source. Then we get Eclipse Link. We get Hibernate. And we get Java Data Objects.

So here we see it uses a POJO type, Plain Old Java Object Type mapping. We don't have anything. And when I want to perform a CRUD operation, it will be, I will have a service object which is called as Entity Manager. And using this Entity Manager, say I get this Entity Manager object by using certain injection or something.

And when I say em.persist, it will insert a row. And when I say em.merge, it will do the addition operation. So the idea is you are not writing SQL queries as such. You are doing everything as if it was a Java objects. So the idea is if you are using this, you don't need a developer who needs to know database programming as well as Java programming.

You can manage without that. And even a Java persistence API in Version 2.0 comes with a builder API. So criteria builder builds the complex queries, just like Java objects in a progressive manner. So we have an Entity Manager over here which manages the objects by keeping the data in a synchronization state with the database record.

Persist, merge all the unmanaged objects can be synchronized with the database just by making a simple method called. The CRUD operations can be performed. We can also search for a particular row or a particular data by using a primary key and by using a find method over here.

Now, with this, we come to the end of tiers and layers. So we just now talked about the Architecture Model. We already had built our Design Model. Now, combining these two, we will reach now, we will talk about the Solution Model.

The Solution Model is very close to the Implementation Model. That is where we actually code. We will not actually create a diagram of the whole Solution Model. But certainly, it is of use to the people who are new to this system, this kind of a system development.

Sometimes, we find that this Solution Model will be in the form of a code which will be built for the architectural baseline purposes. And thus, it can serve as a base for the actual system. Now, talking about the Solution Model, we have identified these three components for the GUI. That is Boundary, Service, and Entity.

Now, using this, we will see that we can represent the complete Design Model for creating the Reservation use case. Now, the booking agent communicates with the main UI. And main UI, in turn, can communicate to Reservation from UI. Booking agent can also communicate to the Customer Management UI. Or even main UI can communicate to the Customer Management UI.

And then further, we can communicate to Payment Management UI. According to Presentation Abstraction Control pattern, we can see that Reservation contains the UI Service and the Reservation Entity. In addition to this, it has additional two packages over here. One is for the Customer Management, other is for the Payment, and each one individually carrying out its Service and its Entity.

Like Customer Management UI will have a Customer Service which can help you to take the data or identify a customer, which in any case will use the Customer Entity. And the Payment Management UI, have a Payment Service which will use the Payment Entity to record the details of the payment over here. So this is our Design Model. This we have created from the Analysis Model.

And here, we can see now the Solution Model. It covers all the components of a particular use case. So we can see we are representing the same Design Model over here. Customer can communicate to the main UI, to the Reservation UI, Customer Management, or Payment Management. Actor has to provide information for all these.

And these communicate to three different Service tabs. That means everything is being implemented as a remote component. So Payment Service stub, Customer Service stub, and Reservation Service stub. And here we can see in the RMI, we have published all the three Services. And all these three Services communicate over here to the Implementation classes from our Client Tier over here.

Now, this is the design for a GUI application. And here of course, the various entities, Reservation, Room, Payment, Property, Customer, everything is there, we can see the equivalent five tables are being created over here, five different DAOs for performing the CRUD operations. So we can see a complete solution over here. And all these services communicating to a DAO factory, and DAO factory in turn creating all the five different DAO objects.

These five DAO objects contain the JDBC code, which contains the SQL statements to communicate to the database. And all these services are using the various entities. These entities will be sent to the DAO for performing the various operations. So this is a complete solution for the use case of Make Reservation.

Now, like this, we may have many different use cases. So if we want, we can create this all with the help of the complete design, we can build an evolutionary prototype which will contain the details of all this Solution Model. Now, talking about now the web application, in the web application, we can see that a Client is not only the View.

Client is a combination of the Controller and the View, the boundary component. The boundary component is represented by the View and the Controller together. So we can see the View is being considered with a vision. And the Controller is with the indication of a hand.

So we will see that design comes out to be something like this. We can see the Customer has communication with Make Reservation Controller. Customer also has communication with the Customer Controller over here. So the Make Reservation Controller has four different views.

One is a Room Selection View, other is Search Results View. View Reservation, that means once everything is done, you want to see the Reservation Details, and Confirm Reservation. Now, this controller manages the Reservation Service, Customer Service, and the Payment Service. And from this point onwards, the design remains same.

Whereas, because it is a Web Client, we need to incorporate the login now. So we have added a Customer Controller over here, which actually keeps track of the login. We can see here, it keeps track of the login service.

So this is our design. Let us take a look at the detail. It is same as previous, except that we will see some changes over here. We will see four Views under one Controller. So this View and this Controller are together. And the Customer Controller over here manages another two Views, that is the Customer Login and the Create Customer.

So either you can log in as a customer, or you can be signing up. That means you need to create a new Customer. And you have to provide all the details that will be here. Now because we added a login service over here, we can see one more step has been published over here into the RMI. And rest of the things are the same.

We have same three steps. We have same five entities. We have one factory and five DAO components over here. Of course, we have five tables. And this is our design. So we find that instead of three services now, here we have four services. One is coming to you from the login.

So this is our Solution Model. Now, with this, we come to the end of our Lesson Number 12. So in this lesson, this was the last lesson in the Architecture. Architecture is a very, very big process, we can say. In Oracle University, we deliver a course for five days only for Architecture, where what you have seen right now over here, each and every tiers, Architecture is discussed in detail regarding technologies, pros and cons, capacity planning, and all those kind of things.

But here, we have talked about the various technical aspects, how the process takes place in a very short and summary kind of a way. So that is what we have talked about. And we have combined both the models which we talked about over here, that is, the Architecture Model and the Design Model and the Solution Model.

Now, Solution Model contains all components, all the components. That means View components, Controller components, Model components, in such a detail. And their relationship is also very, very clear so that we can directly put this into the coding. That is the idea of creating a Solution Model.

## 4. Lab 12: Introducing the Architectural Tiers - 6m

So let us take a look at Lab Number 12. We have two activities. In the first activity, we will update and extend the Tiers and Layers Package Diagram. In your lab machine you will find that there is a template available for Tiers and Layers Diagram over there. You can download that. You can take a look at that diagram and you can edit it.

Or you can take a look at that, create the similar one with a [INAUDIBLE], the tool which we discussed on the day one. And then you can update that diagram. And the second one is about creating the DAO factories. So we will see we will create a DAOFactory. And then we will create the DAO's for two different kind of external resources for the integration purpose.

So let us take a look at the first one. So here we can see. We can open the Tiers and Layers dot PDF file, which is located on your lab machine in Exercises, Architecture, Tiers directory. And then we will update and extend the Tiers and Layers Diagram by using the information which is provided in that particular PDF.

So let us take a look at this vision of our ultimate outcome is this. So the client here, we are using in the same way what we have discussed in the class. The presentation tier, as per the specification, we are using Sun system. The operating system is Solaris 10 on AMD. And Tomcat 6.0 for Java SE 6. And the technology version also changes. We are using JSF. Now, JSF will provide internal subnet for you. You don't need to create any subnet over there. So subnet APA 2.5 and JSP 2.1.

So if I come to the completely latest technology, I can just use JSF 2.0 over here where I don't need to use JSP as a view technology. It will provide [INAUDIBLE]. I can do that way also. And using that I will create hotel system web components.

Coming to the business tier, integration tier, and resource tier, we can see that resource tier has been moved onto a completely separate machine. So we understand there may be some database on a separate machine over there. So we are using Sun Blade over there with Solaris 10. Databases are Oracle 11g. And we are using SQL DDL and DB schema.

For the business tier, we are using Sun Blade Terminal 6340. Solaris 10 as operating system. For the business tier, we are using EJB. So when we are using EJB, I need a fully implemented EE server over here. So I'm using Sun GlassFish over here, which is for Java SE 6 version available. We are using EJB technology 3.0.

So I don't need to use JDBC over here because entity EJBs are not available in EJB 3.0. So what we are doing, we are using Oracle 11g JDBC driver and we are using JPA over here. So that will simplify the process a lot. So using these, we create a what? Component. So that is our solution number one.

Let us go to activity two over here. And here we can see. We talk about creating a Class diagram containing the DAO classes. So we will focus only and only on DAO classes that will allow us to access to two different data sources. So we can use our database and web services, which will give a lot of flexibility to us. And we will add a factory for both the external sources.

Let us take a look at the solution. Solution is quite simple. Let us take a look at that ReservationDAO. So we create ReservationDAO RDBMS and ReservationDAO for web services. You can see that the main idea to look at this is although at one point we are talking about RDBMS cloud operations, at second point we are talking about web service cloud operations, but of an API, or you can say of our own methods, our operations, and their parameters and return values that remain the same.

So that means to a client, it will not make any difference whether the back end is a database or whether you are using web services in the integration tier. Their calls will remain same. No change from the client end. That means the business tier will always keep on making the call to the same kind of conference irrespective of whether the ultimate operation is performed by web service or by RDBMS.

Likewise, we can see for customer you have all the cloud operations and we have RDBMS and web service. Again, the operations demand same, with the same signature, and we create two DAO factories. One is for RDBMS make CustomerDAO and make a ReservationDAO and same way make CustomerDAO and make ReservationDAO but one is for web service group and other is for RDBMS group. So this is our lab.
