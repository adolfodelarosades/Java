# 11: Introducing Architectural Concepts and Diagrams

1. Introducing Architectural Concepts and Diagrams, Part 1 - 49m
2. Introducing Architectural Concepts and Diagrams, Part 2 - 48m
3. Introducing Architectural Concepts and Diagrams, Part 3 - 23m
4. Lab 11: Introducing Architectural Concepts and Diagrams - 14m

## 1. Introducing Architectural Concepts and Diagrams, Part 1 - 49m

So we started with the requirements model. And in the requirements model, we collected functional requirements, as well as we connected nonfunctional requirements. Now from here, we came to the design model. Here, we collected our requirements using use cases. We validate our requirements using activity diagram. And we identified all our key abstractions. And then our end product over here was domain model.

Now from here, when we transit over here to the design model, we performed a robustness analysis. And we created our interaction diagrams. We created communication as well as sequence diagrams.

Now after doing that, we applied some best practices in two ways. One, we learned about the design principles. We talked about open close principle. We talked about dependency inversion principle and composite reuse principle. And the second part was we talked about the various design patterns which are the mid-level software design components which help us to design our software components in a better way.

Now in this, the focus was functional requirements. Now, our focus is going to be nonfunctional requirements now. And we will pick up the nonfunctional requirements analysis from our requirement model. And we will talk about the creation of architectural model. That is what we are going to do in lesson number 11 and lesson number 12.

So here, we will perform certain activities. We will learn the deliverables of an architecture-- or you can say an architect-- whatever the documents is to be delivered. The main focus will be on nonfunctional requirements, quality of service, and risk management. Of course, there will be a lot of other things along with that. But this is what we have.

Once we've finished with the architecture model, we will take up the architecture model and the design model, and we will create something called a design model where we will get a chance to revise our domain model to make it ready so that it can be used directly for the polling purpose. So that is going to be our motive for the next two days. So let us begin with lesson number 11. Let us talk about introducing architectural concepts and diagrams.

The objectives of this lesson are to distinguish between architecture and design; to describe tiers, layers, and systemic quantities; to describe the architecture flow; to describe the diagrams of key architectural views; to select a particular architecture type; and to create the architecture flow artifacts. So let us see where we are. So here, we can see.

Here we are. So we are in the architectural model. And what are the activities we will perform over here? We will select the architecture type for the system. We will create a detailed deployment diagram. And we will document the technology choices in the tiers and layers diagram. So let us begin.

So with time, we can see that applications have become complex. And the number of users who can use your application, particularly when you are writing a web application, it is uncountable. So we can see there are two main problems over here at this point of time.

When we write the web applications-- or the normal applications we are using these days, where we can have a lot of number of users and a variety of users are there-- so the first and foremost challenge which we face these days is about the scaling of your system. That is, we do not know how many users will be using your application. Or there can be a certain increase in the users. So somebody has to be there to take care of this thing, that how your system is behaving, how your system is responding. Is it capable of taking that load?

And when there are more number of users, we have to distribute our components . We have to make sure. Maybe I cannot keep the components on the same single server. So say if you have the component, which is deployed onto the single server, and these are the various geographical regions where all are communicating with the same application. So rather we would like to keep the components near to the individual region. So that means the same component will be distributed at more number of servers.

So when we do not know, and in each region, you have n number of users using your applications, which is not completely in your control, so what happens, you have to keep track of the security because you don't know your users. You have to keep the components distributed at the various places. And the number of users are not in your control. So that means scale distribution security. These are the main issues.

In addition to that, you have other things which you need to take care. That is, you have to take care of your functional requirements. Your functional requirements will tell you what the system must do.

And here, in all this area, whatever we are looking at, we are looking at how it is performing, how the system is performing. Are there any delays because there are more number of users? Is there any compromise on the security? So these kinds of requirements we call as NFRs. So if we have a special person or a separate person who can take care of these high-level requirements, the system can be designed in a better way.

So we find when we talk about distributed applications or when we talk about enterprise applications, we have distribution of roles. So because the application is becoming more complex, we understand I need a designer, I need an analyst, I need a developer, and I need a person who can integrate my applications. So I need an integrator. And to make things happen properly, I need an architect. So that justifies that architect's role becomes mandatory in today's enterprise applications.

Now, talking about the risks which are associated with large-scale distributed enterprise systems, we find earlier, this is an example of a simple system. Of course, this is a distributed. But I would call it rather an old times distributed system, where you have some components deployed onto the server. All your data is deployed onto the database in the form of tables.

And you know your clients. There are various number of clients. And you know everybody has been given a particular user name, password. And all can log into the server. The server will provide you the business logic. And here, we will see the data is available in database. The simple principle for these kind of application is validate near the user and compute near the data.

But in today's systems, we will see that there's a lot of complexity. First of all, the users can be from any place. So security becomes an issue because you don't know your users. We will find over here, the firewall which will do some security job. And then we find the applications being very complex. There are different tiers. So different tiers will be deployed with different components.

Like for example, I can have a web tier to keep the web components. I can have a business tier to keep the business logic. And I can have an integration tier to keep the data access logic. So I will have different components deployed onto the different tiers.

There will be utilizations of that. Your design will become loosely coupled. You'll be able to implement separation of concerns. One type of a component can be changed or altered without the knowledge of another. So there are a lot of utilizations of this.

And you can yet keep some specific services which can be used by this application or by any other application into a separate server. You can deploy the security at multiple points by introducing various firewalls. Maybe if the security is compromised at the first level, by the time the hacker reaches to the second level, you can already take some measures.

There will be multiple servers. This is a very, very simplified view of the applications which we are using these days. Say, for example, let's take an example of eBay. How many people are using it throughout the world? So you have to maintain the performance. There should be no delays. There should be a proper data integrity. No two people should be confused about their orders or whatever they have done.

Or Amazon-- how many people are using it to order the items? So maybe there are only two books left for something, and there are four people who are ordering. So you'll have to keep track. The data should be updated very, very quickly. So all these things we have to keep it in mind.

So this is a scenario of today's systems. Now, we can establish from this that certainly we need a specific entity, a specific role, who can be take care of all of these things. So we try to understand in this slide the difference in the role or the activities which are taken care of by an architect from a designer. So the abstraction level deliverables and area of focus-- these are the three things we will see over here.

In the case of architect, architect takes care of high-level functionality, or you can say high-level requirements. So focus is not on details. Or you can think like this. Say, for example, the designer will think about when a user presses a Submit button, what happens? How the workflow will go? Where it has to go first and what activity has to be taken care?

But whereas architect will think, if thousand people will click the Submit button at the same time, will there be any delays? Will everybody be entertained property? If there will be any kind of a data integrity issue, is everything being taken care?

So deliverables in the case of architect are the plans of the overall system and subsystems, the interactions among the subsystems, architectural prototype, which will provide the details of the overall design of your system, overall functionality, how everything will take place from one point to another. It's a complete design-- taking care of the load, taking care of scalability, and all these things.

In the case of designer, designer will take a look into the individual component design, the specifications of the code. Say, for example, the best practices for the corporate security policy will be given by the architect. And designer will give me the best coding practices, like how should be the variable naming, how should you write the code. It can also describe how much should be the tab size, and all these things.

Areas of focus for architect is nonfunctional requirements-- risk management. This can be of many variety of types. There can be political risks. There can be risks at HR level. There can be risks due to some kind of split in the team.

There can be technical risks, maybe due to technology. There can be risks related to costing of your system, whereas the designer will focus on the functional requirements. So in general, we can say the functionality is the area where designer will focus. And the quality is the area where the architect will focus.

So let us take a look at architectural principles. So there are six basic architectural principles. First is a separation of concerns, second is dependency inversion principle, keeping volatile and stable components separate, using component and container framework, keep component interfaces simple and clear, and remote component interface course-grained. So let us begin with the first one-- separation of concerns.

Now, separation of concerns, it follows actually the object-oriented design principle where we say that we must keep the components in a loosely coupled form. So when we talk about loosely coupled, the separation of concerns, the simplest way to keep the separation of concerns is by keeping-- these are your view components. These are your model components. And somewhere over here, there is a control component.

Separation of concerns is also implemented by identifying the view which is also called as a boundary component. And we can keep the service components separate. And we can also keep the entities separate. Controller is a thread which will make all these to communicate with one another flawlessly.

So keeping separation of concerns tell me that I must be in a position to alter one component without much affecting the other, or you can say without affecting another one. So that is what we talk about separation of concerns. Every concern is separate. View is one concern. Functionality, business logic is one concern. Keeping data and its access logic is another concern.

So this is how we can keep the various things. And when you make a change in the business logic, if the interface doesn't change with the client, it will not affect the overall system. So without the knowledge of the client-- and that is very beautifully implemented in Java EE by making use of APIs.

So I keep on using an API. The internal logic, the implementer or the provider may use any kind of logic. It doesn't matter for me. I will write my web component, deploy it onto a particular web application server without bothering whether it is an Apache Tomcat or whether it is a JBoss or WebLogic or GlassFish or WebSphere. Doesn't matter. So separation of concerns.

Second one is a dependency inversion principle. Now, dependency inversion principle, again, it talks about the loosely coupled way of keeping the classes, you can say-- the dependency of one component onto another. So in this, we can see that there can be a variety of ways. But the basic rule says depend on abstractions and do not depend upon concretions.

So we can see over here a variety of ways the dependency. This is a tightly coupled dependency where client is directly communicating with the supplier. We do not prefer to have this kind of a design. Not considered as a very good idea.

So here, we can see either the one component dependency on another. This is implemented by client class directly communicating with the supplier. So we can have other kind of dependency where we say a client communicates to the service, and client just knows how to communicate with the service. Client must be least bothered about how the service is implemented or who is providing the service.

Maybe you want to purchase something. And say something like this. It will be an interesting example to know, like this. Say you want purchase a particular book. Say I want to purchase a book on OOAD. So it is something like this. This is a global website where I can purchase the item. I will ask to show me what are the books of OOAD. Say I select one particular book, and I carry out the transaction for that.

Now, I don't know from where I'm getting the book. This may be linked with the various sellers. It may be from Amazon. It may be from [INAUDIBLE]. Or it may be from some local book seller which is very nearly available to me.

So I'm not bothered about that. What I'm bothered is I have a particular way to communicate. I'm doing like this. Now how these people are acquiring, this is not my concern. So this is kind of a dependency which is called an interface dependency. I know one place to communicate to. How the internal things are working, I'm not bothered about that.

This kind of dependency can be achieved in two ways. Your client may be dependent upon an abstract class. And this abstract class may have been implemented by another component. Or there can be a dependency over here on an interface. And this interface may have been implemented by different people. From where I'm getting the service, it will not be my concern.

Then we have keeping the volatile components separate from the stable ones. Again, you can see the principles repeating or merging with one another. Many principles you will see will have their traces of one into another.

Separate volatile and stable components. Volatile components are the components which are the view. These are all the boundary components. And the stable components are the components which a the data components, or you can say the database. This is my permanent repository. And this is my client providing some kind of information.

So we keep these components separate. Volatile components are the boundary components. These are the UI user interface components. So we keep them separate from the components which are the database components, which are persistent. We can keep them in separate packages. We can also keep them physically separate on the different machines. We can do that.

And then we talk about use component and container framework. When we talk about component, component is a software component which provides certain functionality. It provides certain functionality. And the container is the one on which the competent is deployed. Container can be considered a kind of a framework. which maintains or which manages the component.

Say, for example, I can write, I can create a web component called as a servlet. And I deploy it onto, say, Apache Tomcat. I deploy it over here. Or it can be any other-- say I deploy it onto WebLogic server, for example. So let us make it like this. WebLogic server-- more advanced, more flexible, more facilities.

Now, you send a request to the servlet from outside. When this object is created, how the thread was spawned to get the request, and how the request is processed, who called or who decided whether doGet or doPost method is to be called, and when this object is to be destroyed-- that means the total life cycle management will be taken care by the WebLogic server. So with this, what exactly you're doing? You can see over here again, you are doing separation of concerns. You are dividing the tasks. And everyone is doing their own task.

What is the utilization of this? Me being a decoder, I can just take care of the functionality of my component. How the concurrency, how the other things about when to create, when to destroy, how to behave-- all these things have to be taken care by some other particular software, a framework which manages that complement.

Now, keep component interfaces simple and clear. A common understanding about the interfaces is-- because when I create an interface in Java, I know there is no implementation. I just declare the methods. And I declare methods, and the implementation will be done at a later state.

So what do I do? I create an interface. And because there is no coding, I understand this is a lightweight thing. So I write in the same interface, login, logout, and add customer-- say, for example, addCust, delCust, addAcct, and delAcct.

Now, your logic is-- anyway, there is no implementation. So you can write as many as-- I know the multiple classes can implement-- maybe a Login class will implement this interface, and a CustMgr will implement this, and AcctMgr will implement this. Now, the question is, although these classes are cohesive, but your interface is not cohesive.

So if you go for AcctMgr, what it will do with the other four methods? Or maybe you want to use somewhere else. So even though we are using interfaces, we would like to create three different interfaces. We will keep the interfaces simple and clear.

So I will create a login interface which will keep only the login methods. I will create the cust interface and the account Interface which will keep the things separate. So separation of concerns, cohesiveness, loosely coupled components-- this has to be a universal concern whenever we are designing enterprise application with using object-oriented principles.

Keep remote component interfaces coarse-grid. Now, this is one of the main points. Now, this is my remote server. And here, I have different users. So I need the information for an employee. So say there are four different information I need for the employee. So you are sending one, two, three, and four different requests over the network, because your component is remote. So we are talking about the remoteness over here.

So your component is remote. What do you say? You say, OK, I will make four different calls. So how much traffic you are adding to the network? So we don't want that. We want to replace it with a single call. Here, I said say getId, getName, getSkill, and getSalary. Instead of this, I will make a single call, and I will say getEmployee. So there is a single call. Let it return a single transfer object called as employee object, so a single coarse-grained call.

One more thing we need to keep track [INAUDIBLE], that is just making it coarse-grained will help, of course. And if you are making a right call-- that means your business process, if you need only four informations most of the time, and then let it not fill it with another 20 fields. Let it send only whatever is required. So that is the idea about the architectural principles. This will help to enhance the quality of service of your application.

Now, architect can plan the system in a better way, can do some trade-offs depending upon the pattern-based reasoning process for service-level requirements. And a variety of decisions can be taken if, as an architect, I have the knowledge of various pattern catalogues.

So design patterns are the standard solutions. And these can be used to define the structure and behavior, to construct effective and reusable object-oriented software components. But design patterns are primarily used for the functional requirements, whereas when we talk about the architectural principles, we will have the patterns which will give an overall view of the system. Like there are some architectural design patterns-- like there is a pattern called as filters. There is a pattern called as layers.

So layers help us to have a separation between the various software components. Like, for example, we will see in the coming slides that you can have the various layers in your system. So say if this layer contains operating system, the next layer may contain some kind of, say, application server. The next layer may contain some API, and so on. So there are various architectural patterns which we can use.

So here, we talk about tiers, layers, and systemic quantities. Now, tiers, layer, and systemic quantities are the three different dimensions for SunTone Architecture Methodology. So it's a 3D kind of a system. So there are three different dimensions over here. So we will see it is something like I have the layers, and I have the tiers, and then I have the systemic qualities. So these are the three different things.

So we will see there are different tiers. Tiers are used for the logical separation, separation of logical concerns of any particular application. Layers, we will see how these will arrange the components in a component container fashion. And systemic quantities will be the strategies which are identified for the purpose of maintaining of the quality of service.

So let us take a look at all the three different components. So this is my hardware platform. This is my operating system. This is my app server. And this is API. And this is my application component. So I will call it as a hardware platform, lower platform, upper platform, virtual platform, and my application platform. So these will be the five different layers. These are the layers.

I have different tiers. Maybe a bad division, but this is client, this is web tier or presentation tier, this is business, and here we have integration, and this is resource. These are the tiers. And then we have the systemic qualities. So these are four. We have manifest, operational, developmental, and evolutionary. So these are systemic qualities. So this is our 3D model.

Now, let us take a look at the details of each and every dimension. First, we'll talk about the tiers. So the client tier can contain a thin client over here. We are talking about the client, because this is basically enterprise. So we are assuming that we are using web clients. So web client is always a thin client.

Then we have a presentation or a web tier which contains basically the components for request processing. It can contain the HTML pages, forms, and other process. Like for example, the component which will reside over here will be a servlet. It will be a servlet component. What resides over here will be an HTML form. The client will communicate or will pass the data to these forms.

And then we have a business tier, which contains the business logic and the business services. Then you have an integration tier. Now, when we are talking about the separation of concerns, it is something like this client sends the information to the web component. Web component passes this data and makes it ready for the business logic, so sends it for the business tier. And business tier performs all the business logic. And now it makes the data ready to be sent to the database, or to any persistent storage.

So we have a data access logic over here. Now, data access logic, we do not want it to be combined with the business logic. This is another separation of concerns. So we would like to keep the data access logic separate.

And here, the data access logic will go to the integration tier. And from the integration tier, of course, it will go to the resource tier. Resource tier is a very, very rich tier. It can be represented by a database management system-- RDBMS, ORDBMS, flat files, XML, legacy systems, any other kind of a third-party application. It can be anything.

So then we talk about the layers. So layers, we have our hardware. So normally, it can be any hardware. Of course, you have to keep track of at least what kind of a component is going to be deployed on this. And then you have operating system, which makes the lower platform. Now, hardware doesn't work by its own. It is always driven by the operating system.

So we have the second layer-- the operating system. So we can see the layer's communication is only to the adjacent layer. My application component will never come and communicate to the hardware directly. It has to come through a certain process. It will descend down from the stack.

So the application component which you have written-- maybe I have written some servlet. So it was written using API, which is a virtual platform. Now, this API is implemented by your application server which understands when a particular method is called by an application component, what I am supposed to do. That is your application server.

This is called as an upper layer. So most of the time, the middleware will reside in the upper layer of your stack. And then you have a lower platform, which is an operating system, which is a bridge between your application server and your hardware platform. It takes a request from here, deciphers them, and sends it to the ultimate bare calls which the hardware can understand.

Then we have systemic qualities. That is the third dimension. This third dimension is a very, very interesting one. Now, this is the part where all your NFR-related concerns reside. All your NFR-related concerns will reside over here.

Now, we can see the manifest is related to the user, the user experience. So it addresses all the quantities for the end user experience. That means, is the application available? Is your usability, or availability, accessibility-- so all these are the manifest kind of quality of service.

You have written the best possible software-- very complex and very, very good, which can do a lot of things. But the user don't like it, because most of the time, due to its complexity, it is not available, or user doesn't have a good experience. So usability is one of the major concerns for success of any kind of a software, at least.

So operational-- it addresses the qualities reflected at the execution of the system, like throughput. So throughput security-- these are the qualities which are related to the operation. Then we have developmental. It addresses those qualities which reflect in the planning, the costing, and the physical implementation. Now, you created a beautiful architecture, but is it realizable? Can it be put into practice? Will it fit the cost? So all these qualities are related to the development systemic qualities.

And then we have evolutionary. It address the long-term ownership, like scalability. Is your system scalable? Is your system flexible? Flexibility. Is your system extensible? So these are the systemic qualities.

So this is a SunTone 3D architecture. This document is around SunTone Architecture Methodology. PDF is available if you want to download from the net. It is around 40 pages document which explains the total process in a very, very beautiful way. So if you wish, you can download that.

Now, then we talk about the architectural workflow. I explained it, actually, in the very beginning of this session. We started with the requirements model. Now, the requirements model, we did all the analysis of functional requirements, nonfunctional requirements. We created the design model.

And the architecture model now we are talking about, we know what are the different qualities we must have in our software. And then, once we define all this architecture, we will see how the design components can be incorporated into the architecture model, which will help me to create a solution model. And solution model can directly be implemented into the code.

## 2. Introducing Architectural Concepts and Diagrams, Part 2 - 48m

So let's talk about introducing the architecture workflow. Six different activities we perform over here. The first one is to select an architecture type for the system. So depending upon the nonfunctional requirements of our system, we will perform-- we will select an architecture type. Maybe we need a standalone system, or maybe we need a two-tier client service system, or application n-centric or web application n-centric or enterprise n-centric Any of these.

Then we create a detailed deployment diagram for architecturally significant use cases. In this step, the architect performs the duty of a designer. Designs the use cases for architecturally significant use cases. So the design is being carried out at this point.

And then we refine architecture model to satisfy the NFRs, to apply the best practices, to apply the design patterns, to see what best can be created for this model. Then we create and test the architecture baseline. We can create an evolutionary prototype over here.

After creating the evolutionary prototype, we can enhance it to implement all the architecturally significant use cases, which can be-- once all the architecturally significant use cases are created, we can have an architecture baseline over here, which can be used even for the testability purpose.

And then we document the technology choices in the tiers and layers. We will decide which component will be deployed where, which version of the technology will be used, which technology will be used, which version will be used. Everything will be fixed at this point of time.

And then, we will create an architecture template from the final detailed deployment diagram so that it can be used to represent the generic architectural view, so that it can be used to show the deployment of the various modules for similar kind of components.

This we have seen earlier. We call it as a robustness analysis. This was the beginning of our design. So architect will perform this robustness analysis to identify the boundary, service, and the entity components for the architecturally significant use cases and then will perform all the tasks which are supposed to be carried out by a designer for these architecturally significant use cases like creation of interaction diagram, application of the design principles, application of the design patterns. And all of those things will be carried out at that point of time.

Now here we see a beautiful diagram. An example of an architecture template. How does it look like? Now, the architecture template is a view of the set of physical components that implement the design components. We can see we're not talking about any particular use case over here.

We are not saying, am I talking about the hotel reservation use case or am I talking about the payment module? No. We are just talking about the type of a component. Where I would like to place a particular type of a component. So here, we can see-- let us take a look at.

So this shows me a few things. This shows me that I have used two physical hardware nodes. So one is for the internet workstation, and other where the application server is deployed. So the agent will communicate-- the actor will communicate to the boundary competent, which preferably is a UI frame.

So maybe I get some kind of an indication that maybe this is a standard edition application. So this is a GUI client, maybe a rich client. So this boundary will communicate to the service. Now, services are represented over here as a stub. This particular application is using a remote method in location components, RMI components over here.

And we know RMI components will provide a proxy for the RMI component in the formal of stub on the client side and in the form of a skeleton on the server side. Of course, we will talk a little bit more about the RMI components later.

So this is what we understand. Boundary will communicate to the service. And this lollipop over here-- a vertical line followed by a circle-- this represents that the boundary will communicate to the stub using an interface. The boundary can also use entity. Whatever the data the client is providing, that data can be filled into the entity and the service will use-- will be dependent on this entity, because the service need to process the data which is being stuffed into the entity component.

So communication from the internet workstation to the application server happens over RMI protocol. Entity will be passed as a parameter maybe to the application server using RMI protocol, which has a hidden information to give to the user or to the designer and to the architect that the data needs to be marshalled. So that means whatever entity classes you are using, please utilize them.

So it reaches to the skeleton. Skeleton actually communicates to the service impl class. That means that implementation class. And that implementation class, in turn, may use an entity component to process the information.

So we are not talking about any specific use case over here. We are talking about architecture template that gives me a general idea that the actor will communicate to the boundary. Boundary will communicate to the service proxy. And the service proxy may use the entities which are filled-- which map to the boundary components.

And everything will be sent to the application server. Application server has a server-side proxy called as a skeleton. That will communicate to the actual implementation of the service, which may use the data which is sent in the form of serialized data to the application server.

Without talking about any particular use case, we are able to give a generic workflow-- a general workflow of our application.

Now, here we can see, when we fill-- when we snap the design components into the architecture template, we can call it as a solution model. Here, you see the difference. If we go back here, we can see booking agent communicates to the boundary. But the booking agent communicates to the main UI. Now, main UI communicate to the reservation from UI. We are talking about a specific use case. That is a hotel reservation. Reservation of a room.

So here we see reservation from UI. Reservation form UI will talk to the reservation service stub. Again, your use case specific design component. Reservation service stub will communicate or will be-- will have dependency on property entity and a room entity.

Using RMI, we reach to the reservation service skel, which in turns communicate to the reservation service implementation. Reservation implementation service will use property component and the room component and the service is provided to book a particular room in the hotel.

So here we can see now, we talked about two different kinds of things over here. We saw the solution model and we saw the architecture template, but when we come to the architectural documents, we will see that there are three different types of architectural views are available.

So there are more documents, there are more deliverables than just these three. We will see, for example, the risk evaluation, and the mitigation of the risks is not available over here. The return on investment is not available over here. Capacity planning is not available over here. The quality of service show stopper is not there. The performance of the system with extrapolation graphs, that is missing over here.

So all those will be the deliverables, in addition to corporate best practices or security policy, the governance documents. These are missing over here. So all of these will be added. But from OAD perspective, we can see that there are three main UML diagrams which need to be delivered.

One is a package diagram. Second one is a component diagram. And third one is a deployment diagram. So package view, component view, and the deployment view are the three different views which will be provided from the architectural perspective.

So let us first take a look at the package. The mail elements of the package diagram are very few. Main is the package notation. So package notation can be shown in two different ways. The symbol remains same. You have a box with a tab at the top.

If you don't want to give the detailed view of the package, you can use the first one, where you can write the name of the package in the middle of the box. The package name can be placed in the body.

And the other one is where you want to give the detailed view. So in that case, the name of the package will move to the tab. So it will go to the tab. And here, you will give the details of the package. What does it contain?

We can also show in the package diagram, package view, we can show the dependencies of one package on another. For example, here we can see the UI is dependent on service and on domain, and the service depends upon the domain.

Now, we show the various components over here. A UI contains two different UI components. One is a main UI, other is a reservation form UI. And the service contains the reservation service interface, which is implemented by that RMI implementation and the RMI stub. Stub acts as a proxy. And we can see the proxy is the one which communicates with the domain, because it will have the meta calls which has parameters acting-- serving those entity components. And these entity components will be passed to the actual service component using marshalling and unmarshalling.

So this is how, if we want to show a very abstract dependency, we can show it like this also. So just we are trying to show UI users, or depends upon on service and domain and service depends upon domain, and so on.

So this is how-- this is a very simple way to represent. We can show it in a much more elaborative way, depending upon the complexity of your application or a particular package being dependent upon how many other packages.

Then the second view is a component diagram view or a component view. Now, component view, it tells you the physical components and their dependencies. So we can see here-- we can see the reservation form UI component. This is the symbol which we use for the component reservation form. UI component depends upon the service.

And this lollipop again shows me that it communicates to the reservation service through its interface. Reservation service component in turn depends upon property and on the room service. Here, we can show interface separately, or we can just use the symbol to show that how the communication or the dependency is.

Now there is another, a little more elaborative, which is being introduced in UML 2.0. The component which depends upon a certain service uses a symbol like a half moon symbol, or you can say a semicircular symbol over here. Here you can see that symbol being shown over here. So we are showing this.

This shows the reservation form UI will communicate to the reservation service only by using an interface. So that means you are showing an interface coupling or abstract coupling over here by seeing that reservation form UI communicates to the reservation service only by interface. And that shows that reservation service must use an interface symbol telling that it is implementing an interface over here.

So this is another way to represent. Now the question is how-- what other ways you can show. Now, here you can see we are using the competent nodes over here. Now, the other way is you can use a standard notation. Like, you can use a box, and you can use a component stereotype within that to represent the symbol. So it is only how you would like to depict a particular view.

So you can use a standard boxes and you can use stereotype icons inside to show whether it is a domain, whether it is a component, or whatever it is. So this is another view. This is another way now.

We have been talking about a component. Now, what a component is. A component is marked by certain characteristic features. So let us take a look at that. The first and the foremost feature are a characteristic of a component is that it is a software unit.

What do we mean by a software unit? What is it? A software unit can be as big as the whole component. Software unit can be as big as a subsystem. Software unit can be as big as the whole system. But it can be as small as a single class.

So it depends upon how complex, how big your competent is. And component does not mean just one web component or one servlet or one EJB. Component, as we can see in the next slide over here, it can be anything. Component can be a concrete component. It can be a component implementing an interface.

Your whole database, or just a single table in a database, can be represented as a component. Your source file-- your .java file, .html file, .javascript file, .jsp, .jsf file, all these represent a component.

Your complete application jar file or your web archive-- that is your war file-- or your ejb-jar file, or your ear file-- that is enterprise archive file. That can also present a component. That means how big picture you are talking about.

So you can have a very big picture, something like this. Say this is your own system. Now, this system-- say this is considered as one component. It depends upon-- say I have a banking system, for example. So this is a loan system. This is considered as another component. This is your mortgage system. This is another component.

Now, this system may use another three-- loan dispersal, recovery. and management. These can be another three components. Now, this can be one enterprise archive. This can be another enterprise archive, say, another ear file. This can be another ear file. Now these may be dependent upon this maybe using one ejb component, one vip component, and some HTML component, and so on.

So you can break it down. And here, after all these systems put together, these will communicate to one big database system, which itself can be considered as one particular company. So it depends upon-- when you talk about a software unit, it can be a whole application. It can be a group of applications which are interacting with one another. And it can be anything. It depends upon how big or how small you visualize it. So we will see that that itself is one of the characteristic features of the component.

So a component can be large and abstract. Just now I gave you an example. A component can be small. Component can be as large as a complete loan management system or a complete banking system or a customer management system, insurance system.

It can be as small as a single class. If I write a single class-- something like this. Say I write a class called as a customer. Say this is public customer and here I write all the details. Say, ID, name, address, phone number. Let us not write phone number. Let us be more specific. Say, cell number.

So we say there is a cell number. And then we have email. So some kind of a reference. Maybe your bank has a scheme that the customer has to come through a set of reference. So all of these. And then make sure all of the methods over here, getters, setters, and all those kind of things. So this is also a component. This is a component.

So component can be as small as a single class. Component can be as big as the whole of this system. So it can be large and abstract. It can be very, very small. And it might have an interface that may communicate to other components. Like we saw an example of banking communicating to loan system, loan communicating to dispersal, recovery, or management.

And so component can be just a single file. Your one single HTML file. Or maybe your one properties file, where you are storing all the error messages under certain circumstance, what message you want to show. So anything can be represented as a component.

Now, example of a component diagram. Now, component diagram shows me the physical components and the dependencies. Now, these dependencies are not standard. You can show the dependencies the way you want it.

Now, here in this particular example, we can see that there are various physical components. There's a form UI. There is a stub. There are two entities over here. And this form UI communicates using RMI. So this shows the dependency. And it shows the dependency of a stub on the property and room.

Another way can see over here, now, the travel agent system is one physical system. One physical component. And reservation web service is another component, which uses property and the room. But your travel system uses or depends upon this reservation service using a SOAP protocol. So there can be a variety of ways of dependencies.

Here is another way to represent. Now, this is my, say, domain.jar file. This domain.jar file contains a customer.class and reservation.class. Now, the customer.class depends upon customer.java. Reservation.class depends upon reservation.java. Now, these are all of the variety of ways we can show the dependencies of the components. So the physical components and their dependencies can be shown in the component diagram.

Then we talk about the deployment diagram. Now, the deployment diagram shows me the configuration of the runtime processing nodes and the computer processes and the objects that live on those nodes. For example, here we can see there are five different hardware nodes are shown.

First is a customer computer. Second one is a mobile form. Third one is a television system. Now, these are 3D cubicle symbols. These are normally used to show a device node or a hardware node.

Mobile is also considered as one kind of a hardware node, because this is a device through which the client can communicate to a particular system. Travel agent system and customer computer system. Then you have a car rental server over here. This is another hardware node. And a third-party electronic payment system. That is another hardware node.

So we will see the computer-- the customer computer hardware node has a software component browser. Now, I can go more into detail, but that will make it too complex. Because the browser may have many other software components, which can be the HTML or JSF or JSB files. Individual files. Individual components.

And the mobile phone has a car rental booking application. That is deployed on mobile. And the travel agent system has a travel booking service, which is an application which is deployed on that. So we can see the hardware node and which software component, at the high level, which is deployed over there.

We are not going to show-- like, for example, travel booking service may have many other software components. We are not showing that. We are just showing that which main software component is deployed on which hardware. That is the first part.

Car rental server has a web server deployed on it, has a database deployed on it, and a car rental application under this. So that means three different software components. Main software components are deployed onto the car rental server. And the electronic payments has the charge account application.

And then we show their dependencies. We show hardware to hardware communication, as well as we show how one software component communicates to another software component. So when we show hardware communication, we draw the solid lines.

So we say, customer computer and a mobile device and the travel agent system will communicate to the car rental server hardware node by using TCP protocol-- TCP internet protocol. And the car rental server communicates to a third-party system, which uses TCP extranet. Whereas the other three nodes are using TCP internet.

Now, the browser component-- that car rental application component will use the HTTP protocol to communicate to the web server. Car rental application is a web service, so the mobile phone-- sorry. Not the mobile phone. The travel agent system will communicate to the car rental application using a SOAP protocol. And the car rental application also communicates to the payment application, which is another web service, using a SOAP protocol.

Now, internal communication of the software components, like web server uses RMI to communicate to the car rental application. Car rental application uses SQL to communicate to the database. So that shows the car rental application has various software components, some web services, some remote components, some database access components.

Remote components are being communicated by web servers through RMI. The web service components communicate to-- the web service clients communicate to the web service using SOAP protocol. And the data access objects communicate to the database using SQL as a protocol.

Not only that, we also show the multiplicity. So one car rental server communicates-- is being communicated by zero or more customer computers. Zero or more mobiles can communicate to web server. Zero or more travel agent system can communicate to car rental application.

But the car renal application can communicate to a single electronic payment system. So this is how we show the various hardware nodes. The various software components deployed on those, how the hardware to hardware communication, software components communication, and the multiplicity of the various components in a system can be shown with a deployment diagram.

So we saw over here, the various nodes-- the hardware nodes are there. The software components are there, and the communication protocols. Here we have a bit more description about it. Hardware nodes can be any physical hardware. It can be representing something, a router, or a firewall, or any other kind of a device. Need not be only computer.

The links between the hardware nodes indicate the connectivity and can include communication protocol, which are used between the nodes. Like we saw TCP internet, TCP extranet, and so on.

Software components are placed within the hardware nodes. The simplest way to represent this, I can just communicate these three things like this. Say this is my one hardware node with a client. So say this is a computer. This is my server. And so we will see, this particular node, the computer node, communicates to the server using TCP internet.

And then I will say there is one component over here-- say, browser-- this is what even we show with the previous one also. And here is your application. So it communicates to the application using HTTP or say, HTTPS. And here we will say this. So this is the simplest deployment diagram, which represents the purpose of the deployment.

So deployment shows me which hardware node which will contain which software component, and how that software component will communicate to another software component via different hardware components. And the hardware to hardware communication, software to software communication deployed on that particular hardware.

Now, two types of deployment diagrams usually we can create. One is a descriptor, which we saw over here in the previous one. This kind of a descriptor. So descriptor is a general idea about which hardware deployed with which software and how the communication is.

Another one is a detailed one which is called as an instance diagram. The instance diagram contains all the specifics of the hardware configuration. For example, you give the name of the server over here.

So you say it is www.bayview and its type is web server. So we can see and colon in between the two, the name of the server and the type of the server. Just like in an instance diagram, or when you want to represent any detailed class diagram, you write the variable, colon, the data type. So exactly in the same way, we can see the instance is described.

And then in the second segment-- second section-- we have the various hardware attributes, like what should be the speed of the CPU, which type of a CPU, what is the memory, which operating system is deployed on that particular hardware.

And then in the third section, we show the actual software deployment and the communication. Like we can say Apache, but what is deployed on Apache? Whether it is JSF components or JSB components and so on. So two types of deployments, descriptor as well as instance.

Now, here we come to the same old [INAUDIBLE] now. We are just in a procedure for finalizing of an architecture. So the first step, which we talked in the very beginning of the lesson, is about selecting an architect type.

So when you want to select architecture type, what drives you to select a particular architecture? Suppose I say, I would like to use a standalone system. So why should I use a standalone system? Or if I say, I want to use e-centric end tier. Why should I go for that?

So basic four factors. First one is a platform constraint in the system requirement. There can be some specific requirement that I have to use, like the system is complex, so I would like to use this particular kind of a system. Say a tier system, which is, say, web centric. So I'm writing a web application. I know I want to use the application over the internet. So I will go for, say, I will go for web centric.

Modes of user interaction. Whether user is communicating from GUI or web UI or mobile or PDA, or is it another device communicating? Or is it another app communicating to another app? Or are you using certain particular service?

Persistence mechanism. Where want to-- does it require persistence? If yes, then which kind of a persistence you are using? Are you using a database, or is it a legacy system? So what kind of a system it is.

Data and transactional integrity. Say you want to write an application which is heavy on transactions. So I may not go for a web application. Now, even though we can justify it that Java EE 6 web file contains EJBs and can support transactions on the web server, or you can say web container. But your application, if you have heavy on transaction and it is a distributed application, certainly my take will be on EE n-centric system.

So these four basic factors of the constraints of the platform. User interaction modes, persistence mechanism, and data and transactional integrity, which will drive you to select a particular kind of a system.

Now, let's take a look at five different kind of architecture types are provided. Standalone applications, client/server two tier, n-tier applications, web-centric n-tier applications, or enterprise n-tier applications. So let us take a look at these one by one.

So first we talk about standalone applications. Maybe you are creating some particular small tool which is to be used on an individual machine. There is no interaction required. We don't need any kind of a shared resource or anything.

We can use a standalone application. No external data sources. Very simple application. File server is very much within the same hardware node itself. There's no network communication. So no hassle about thinking about the performance or throughput or scalability or extensibility in that case, where you have to communicate with multiple users.

Simple security, just because you don't want anybody else to use this application. So that can be a system level of a security, which is as you log in, you have a username and a password. So that kind of security can be applied over here.

So because you are using an application, so what is the drawback? Now, one is the requirement. There is only a small tool which can be used by an individual. The data produced, that reports produced by that particular tool are meant only for that user. We don't want to share the reports anywhere else. So certainly, we can go for standalone.

Now, what are the drawbacks within the system itself? The drawback can be a deployment related problem. Maybe, for example, I have been using MS Word 97 from very long time. Happily using .doc files. Now I receive some document which is a .docx. That forces me to upgrade my system-- to deploy a new version of the system-- of the software on my system. So that can be the constraint or the drawback.

Second one is about to client/server two-tier application. The client will be a fat client. All that data processing or a business processing related to the application will be carried out within the client workstation itself. Only the data related logic can be computed within the database server.

So you know your clients, so data store manages the transactions, manages the integrity of the data, and the thick client manages all of the business logic related activities over here.

The drawbacks are quite similar to the previous one. Say a new format of a database comes, so you need to change your application. There is another drawback over here. So say the application changes. So when the application changes, and if you have 100 clients attached to your database servers, then all the hundred clients need to be deployed individually with an application. So that is an additional task. So that's what we have.

And then we have N-tier applications. N-tier application can be compared as a EJB related based application, where the client is a Java SE client. So you can have a thin client. But you can have a client where the request processing.

So when I said thin client over here, the business logic is on the application service, but the request processing is taking place on the client site itself. So client performs the request processing, prepares all the information to be sent to the business application, and the business application communicates to the database.

So here, it can be considered as, say, I have a thing like this. This is a receptionist desktop. And the application is here. So this application will-- the receptionist will fill the form. Send the details over here. Now, this is my application server.

So all of the business processing-- find room, for example, and allocate room, calculate price-- all those things. Check the payment. All those things are happening over here. Once everything is ready, it goes to the database over here.

So this can be-- that means the client directly communicates to the business logic over here. So again, when the client application changes, then it needs to be deployed onto all the client workstations.

Then we have web centric. Of course, I understand web centric will be when we want the client to be anywhere on the globe. It's a web application. So the web browsers are the thin clients. No processing takes place, maybe, on the web browser. And just like this, I have the client machine. The client is a browser.

And the browser contains some JSF or HTML pages. And this will, in turn, communicate to another called as a web container or the web application server. OK Web application server will have certain web components. So this is because this is a thin client. The request processing is happening over here.

And once the request processing happens, it will communicate to the application server, and application server to the database server. In most of these kind of systems, we will see that this presentation tier or the web tier, whatever it has, sometimes we used presentation servers.

Say, for example, I come and log in into my Oracle 8e. And I'm seeing today one particular-- my company's homepage. It is not on my own system. It is coming to me from some service. Next week, when I come, there are a lot of changes on that. So I did not download it. I don't need it. So centralized deployment is there.

So everybody will go and pick up the data from there, or go and pick up the thing over there. So this makes it as a web application n-tier. So tier number one, tier number two, and tier number three. Or you can say tier number four. So that makes it n-tier. So application n-tier, this is one, three, and four.

Now, in this, security will be the issue, because you don't know your clients. So that makes your application more complex. In this particular case, you'll know that it is the receptionist. So receptionist will be given some credentials. The receptionist will log into the system and will perform this.

But here, you have no control. You don't know who all are going to be your clients. So that means security will be the showstopper nonfunctional requirement over here. And second thing is I also need to think about in another terms now. Because this is a web client, I don't know how many clients will try to log into my system. So that means scalability becomes another issue over here.

So all these things. What we are trying to understand over here, when we-- right starting from the standalone, two-tier application n-tier, then web centric n-tier and you will see the next, when we go to enterprise n-tier.

Now, enterprise n-tier is actually already here. This combination of the two makes it as enterprise n-tier because you have multiple types of clients. So some clients are communicating directly to your business logic. Some clients are coming to you via web. There maybe another one over here, which on mobile.

So this is a mobile client. So this mobile client may also communicate to the web tier, and from there it will go. I may have PDA. I may have another travel agent system. So I can have multiple clients that makes it as a enterprise n-tier. So scalability becomes an issue.

Now, this architecture type-- as we said, what are the deciding factors? What kind of a platform you are using, who are your users, how much transactions-- all these things will come into play. And when we decide about the type of architecture, the nonfunctional requirements or the quality of service requirements will keep on changing, depending upon the type of architecture you choose from.

So two types of clients mostly in the enterprise n-tier architecture. One is a web browser for internet users. Other is a GUI thin clients for the internet users. So web application server provides the presentation logic where request processing happens. And the application server provides the business logic.

Now, this is our enterprise n-tier system for the hotel reservation system. Now, there-- whatever it there on the board, we are just talking about in general. So we convert our n-tier architecture now to our hotel application.

So that means we decide to have an EE n-tier architecture, or enterprise application n-tier architecture, for our hotel reservation system. So we internet client. Various clients are coming. And then we have a client workstation, which is in the premises of the hotel itself.

So hotel application is here-- the booking agent. And all the internet clients will communicate to the web server, whereas client workstation can directly communicate to your hotel reservation business application, which is an application server containing the business logic. And the hotel reservation application server communicates to the database.

Now, this also tells me a kind of thing that how the deployment can take place. So we can see that when we say application server, we are putting HRS business application and the database together. Gives me a kind of an idea that these two components are deployed together onto the same system, like as we can see over here. That is what we can see. That web server and the car rental application, all these are deployed onto the same hardware node.

Then we talk about how do I create a detailed deployment diagram?

## 3. Introducing Architectural Concepts and Diagrams, Part 3 - 23m

So let us take a look at Creating The Detailed Deployment Diagram. The first step is to design the components for architecturally significant use cases. That will be done using robustness analysis. We will, as an architect, identify the boundary component, the service component, and the entity component.

So once we have identified those components, then we will place these design components into the architecture model. And the third step will be you will merge both, and you have a detailed deployment diagram from the merger of the design components and the infrastructure components. That means you will combine your hardware and software components, put them together, and make a deployment diagram.

Of course, we have seen that deployment diagram earlier. But let us take a look at a deployment diagram for the hotel reservation system now. Earlier, we were talking about in general. Now this is the detailed diagram.

I will explain about the RMI components in a little while. So we are using RMI over here,. You can see the word used, JRMP. That is Java Remote Method Protocol.

Now normally what happens, you can see here one more entry coming over here called an RMI registration reservation SVC, where one stub is being deployed. Now before I explain this diagram, let me just tell you a few things about doing the RMI components itself that is necessary to know. To go for RMI components, in general, let us take a look at how RMI components are designed.

We will write RMI Java components, which will contain RMI interface and implemented classes. Now once we do that, we will put these for compilation, which will produce the byte codes. Now then it will be given to RMIC, which is called an RMI compiler.

Now RMI compiler will actually generate stubs and skels. So stubs are usually for the client. And skels, or skeleton, is for the server.

The components will be deployed onto the client and the server machines. And to run this application, you will run something called RMI registry. Now RMI registry can be considered an RMI server component.

So what happens? When you start your application, when you execute your app, your application will publish, or you can say deploy or register, all your RMI components over here. RMI components will be registered over here. So this is how.

Now this is one part. The second part is your client. This is your client application, your client app. So you start your client app. Your client app wants to use RMI components.

So your client code will have a lookup, the JNDI lookup. And when this lookup is performed, it will go and look to the RMI server, or RMI registry for a remote component. And this will return the proxy, let us say. This will return the proxy of RMI back.

And the client component can keep on communicating to this proxy. Here on your application server, you will have a skel, and here you will have your implementation class. Now your client will communicate to the proxy. Proxy will communicate to the skel, skel to the implementation, and so on.

So you will find that whenever we are using RMI, you will find one additional component, called RMI registry, which acts like a cache, which acts like an RMI server for all the components-- just like all the databases are deployed onto the JNDI servers and all the web components are on the web server. All the web services can be looked in a UDDI database on JNDI data sources on JNDI and so on. RMS message components on JNDI-- so likewise, RMI components can be looked or searched in the RMI registry area. So let us take a look at now my detailed deployment diagram for hotel reservation-- only for the reservation. That is create a reservation use case.

Now remember these detailed deployment diagrams the architect will provide only for the use cases which are significant for the architectural perspective. That means the scalability, flexibility, those kind of issues are-- so maybe you have something where some local system is taking place in the hotel. Say for example, somebody has to go and enable telephone in a particular room.

That may not be an architecturally significant use case. But when the booking is happening, there may be so many people booking that scalability and security can be the issue. So it is an architecturally significant use case.

Here we can see the client, which is a web browser communicates to the web component using HTTP protocol. So a polygon symbol over here represents a servlet component. Now this servlet component, after processing that request, communicates to the reservation service stub, which is already being provided. So stub is a client-side proxy on the presentation tier.

Now it will use JRMP protocol. And it will communicate. So you can see that nobody is communicating, no other component is directly communicating to RMI registry. The presence of RMI registry with the RMI stub shows that the component is registered. And when required, the RMI registry will provide the proxy of that.

So here's what happens. The stub communicates to the server-side implementation. So here we can see the server-side stub or a skeleton, whatever we call it. It is very much here. Implementation is here.

And on the other hand, the booking agent, which is a GUI client, can also communicate to the reservation form UI, which can have its own copy of a stub-- it's own proxy of a stub. And that can also communicate. So there are two things which we would like to concentrate on over here.

We can see that clientwise deployment is being shown. The presentation tier marked in the blue-colored boundary is not applicable to the booking agent, which is deployed onto the internet work station. So here we can see there is an additional component with which the web component communicates. That is Select Room.

That means when the web client is there, the Select Room will appear as a separate web page, which is a view component to the client. But such indication is being given onto the internet application. Because we assume that everything is happening on the same GUI screen.

So on the business tier, we can see the business logic in the form of reservation service. Implementation is deployed. And then we show an integration tier where we are using data access object factory, JDBC. It shows that we are using JDBC.

We are not using any ORM or JPA hyperlink. We are not using any of those. So the communication of the business logic is to the DAO Factory. Factory creates the DAO, which is being used for all the cred operations by the business logic. And then this DAO JDBC using SQL communicates to the database.

So we can see with clarity each and every component and its interaction and how that interaction is taking place. Like for example, if you are using DAO Factory JDBC, what is the purpose of DAO Factory JDBC? The purpose of this is it is creating a DAO object. That is also being shown.

So the dependencies are clearly shown for the software components and so on. So this is how we can see the purpose of the deployment diagram use casewise. So that means if I have 20 different use cases, which are architecturally significant, I must find the 20 different deployment diagrams for that. Or there will be an architecture template, where I will say that, OK, I won't go for this. But in general, this is my process, which can be filled later.

Then we take a look at the architectural template. Now we have seen the deployment diagram. From a deployment diagram, we cut off the individual use case-specific components. And we understand from the robustness analysis that each and every individual design component is of what type.

So we strip the detailed deployment diagram to just one set of design components. So after we have designed a few diagrams, we understand that this is going to be my general style. Say, through all of my applications, I'm using JRMP. I can have one particular kind of architectural template for that. All boundary components will be there in the browser.

And then presentation tier will have the related web components and views. From there, I will have the business components. And business components will communicate to the integration components. And those will communicate to the entities.

So replace the design components with the type of the component. You see all the components in the blue color. In the next diagram, you can see client tier with a boundary. Web component is a boundary component, because it communicates with the client and processes the request, parses the request.

View is a boundary component. Stub is a service component. Likewise, JavaBean-- where we were using, in the previous one, we were using a customer bean over here. So we can say it just as an entity.

So it can be any-- so we generalize our design. So we said this is my architecture, in general. A client will communicate to the boundary. Boundary can communicate. Boundary controller can communicate to the boundary view, can communicate to the service stub.

Service stub, in turn, can communicate to the entity, using JRMP, passes to the business tier. Business tier has service components, which can use entities, communicate to the entity, DAOs. And entity DAOs, using SQL, will communicate to the entities in the resource tier.

So likewise, we can see, for the GUI application, we said there is a boundary over here, which communicates to the service stub. Service stub, again, uses the entities. So the process remains simple. So chop off all the individual use case components, replace them with their three basic robustness analysis components-- boundary, service, and entity-- and your architecture template is ready.

Now here we talk about another point of view. This is also one of the deliverables of an architect-- creating the tiers and layers package diagram. So we determine what application components exist.

So from the deployment diagram, we can see here we are talking only about the tiers. We say, which hardware node is present on which tier? Let us take a detailed look over here. So we say, this is client tier, presentation tier, business tier, integration tier, source tier.

And it shows which hardware nodes and which software components are being deployed over here. But we are not showing any technology choices. We showed these components, not as hardware-software nodes, but rather we show them as the packages. We call it a tiers and layers package diagram.

So we determine what technology, which version, which protocols, are required for a particular component. We also determine which container product to use. Basically, when we are talking about tiers and layers, it is technology choices.

And we determine which operating system we are using, which kind of hardware will be more appropriate to be used. So we will talk about tiers and layers in the next lesson. We will build tiers and layers tier by tier. But here is a general view.

So we can see the client tier over here, business tier, integration tier, and resource tier. Now this is for the GUI application-- tiers and layers for the GUI application. So we say, hardware can be any PC-- because only the client component is deployed-- any operating system, maybe who knows, maybe Linux, maybe Solaris, maybe Apple Macintosh. It doesn't matter.

We are specific about the technology over here. We say, Java SE 1.3. We chose our technology.

And in Java SE, my API is Swing. So that means whatever Swing is compatible or is available with J2SE 1.3, that version of Swing will be used over here. And using that, I will create my client company, GUI component.

Then we have business tier, integration tier, and resource tier. We can see a single hardware and a single OS. That shows the business tier, the integration tier, and the resource tier are physically deployed onto the same hardware and same software-- same operating system.

Then of course, technologywise the choices have to be different. So the business tier is using J2SE version 1.3, RMI. So whatever version of RMI is available in J2SE version 1.3, that RMI will be used. And using that, we are creating hotel reservation business application components, remote components.

Integration tier, we are using J2SE version 1.3, post driver. When you are using JDBC, you need a JDBC driver of a particular type, which will be vendor specific, for a particular vendor, depending upon what kind of a database we are using. So we use here PostgreSQL. So the post driver is the PostgreSQL driver for J2SE version 1.3. That is my technology choice over here.

The JDBC-- we are using 2.0. And using this post driver with JDBC 2.0, we are creating database access objects, which will be written in Java. That is why we are saying JDBC version 1.3.

PostgreSQL is the database. SQL DDL is the technology choice over here. That is a virtual platform.

I'm using SQL, using data definition language. And here the DB schemas are created using SQL DDL. That is my GUI tiers and layers. The idea is to know, even up to the last detail, the versioning of the technology-- so which technology we are using over here.

Let us take a look at the tiers and layers diagram for the web application. This part remains the same, because there is no difference between the business tier, integration tier. So this part behind this, whatever is there, that is not changing. So that means this part remains the same, like the previous. Because there is no change over here.

So this also shows me separation of concern and a loosely cooperative design. Because my business tier, integration tier, and resource tier does not change, even though my front-end changes. So now my front-end is any hardware PC, any operating system, any browser, using HTML 4.0.

Remember, I'm not saying 3.0, 5.0-- 4.0. Using that, we are creating client-side forms. And the web tier, or the representation tier, is on separate hardware.

So I can see three different hardware nodes. One, which is on the client side, where you have deployed your HTML pages. Second node, which is an Athlon deployed with a Linux operating system, which uses Tomcat 4.0 for J2SE 1.3, where the servlet 2.3 and JSP 1.2 is a virtual platform.

And we are creating web applications, which will be servlets and JSP pages. And the rest of the hardware and the software stack-- you can say layer stack-- remains the same as the GUI application. So that is what we have over here.

With this, we come to the end of Lesson #11. So in this lesson, we talked about the architectural perspectives. We learned about how the design components can be fit into the architectural design, architectural model.

We talked about the detailed deployment of the software components on the hardware nodes, the communication protocols, selection of architecture type-- like whether it can be standalone, two-tier, on n-tier application design, depending upon whether it is a web application, enterprise application, or a GUI application. We talked about the component diagrams, packages, and tiers and layers and the various three different major views, like deployment views, components views, and package views of the architecture. We also talked about the various kinds of dependencies, which we showed in the components, like dependencies based upon SOAP protocol or HTTP protocol or externet. All these things we talked about. The next lesson, we will talk about, in detail, tiers and layers.

## 4. Lab 11: Introducing Architectural Concepts and Diagrams - 14m

Now let's take a look at the lab of lesson number 11. There are four exercises. The first three exercises talk about the various types of diagrams, identifying the elements, mapping it to the corresponding definitions, and finding our true and false statements. And then there is exercise four, which is a case study for which we need to create a detailed deployment diagram.

So first exercise is about identify tiers, layers, and systemic qualities. So part one of the first exercise, we try to identify the different layers. So provide the API that application component implement. So the API is always in the virtual platform.

Consists of the operating system-- it's a lower platform. Includes computing components such as servers, storage, and network devices-- so this is my hardware platform. And provides a concrete implementation of components to satisfy the functional requirements-- that is what you have application. We create the application components. And the products such as web containers and middleware, that is an upper platform.

So we remember our diagram. First we have a hardware platform. Then we have a lower platform which contains the operating system.

Then we have an upper platform which contains the middleware, like all the application servers. Then we have virtual platform where APIs are there. And then we have application layer where we put our own created application components, like servlets, JSPs, EJBs, whatever it is.

Second part of this exercise identifies the tiers. Client tier is the one where all the client services, or you can say client components, resides. All the services and UI components, web pages, that is what represents the client.

So provides the services and entities is a Business tier. All back end components is a Resource tier. And usually described thin, often in a web browser, that is a Client tier.

Provide HTTP pages, forms, request processing, all of these things are available in the Web tier or in the Presentation tier. The components that tie the Business tier to the Resource tier, which is sandwiched between the Business tier and the Resource tier, where the data access logic is there which communicates with the business entities, put them onto the persistence, that is what we have as an Integration tier. So that is our first exercise.

Oh no, one more is there. That is about the systemic qualities. So addresses the requisite qualities as the system evolves-- that is of our Evolutionary qualities, like scalability, flexibility, extensibility. Manifest is when you address the qualities in the production, the user satisfaction, the usability.

Evolutionary we discussed. And Developmental are realizability and planability. Can we realize our plan in a right way? And then we are left with, I think, Operational. Operational is where we see the execution of the system, all the qualities which reflect the execution of the system-- throughput, securities, serviceability, and all these.

So these are the four different. You can map to the slides. So this is the description of all the tiers, all the layers, and all the systemic qualities.

The second exercise is about the exploding component diagrams-- so various types of component nodes. So this represents a Component node, the first symbol. Then arrow shows the dependency.

Then line with a circle shows an interface icon. The document with the wheels kind of a structure shows Executable file components, like JAR files and so on. And a cylindrical kind of a structure shows database component. And the last component over here, which we can see, that is representing the Application component over here.

The next is we test which statements are true. So a component represents a software unit? The answer to that is yes. There are descriptor and instance forms of Component diagrams? Certainly no. It applies to Deployment diagram.

Components can be abstract? It can be abstract software components, so we can say, in a way, yes. Component diagrams show organization and dependencies among the components? Yes. You can create your own component icons to extend the UML diagram? Yes, you can write various data types in that, and you can show.

Then we have understanding deployment diagrams, the various symbols. Straight line shows a Communication link between two hardware nodes. A Component node can be shown in a variety of ways. A cube kind of a structure shows a Hardware node. And a dashed line with an arrow shows a Dependency.

The true and false statements-- you can assign your own icons to represent hardware in the deployment diagrams by using stereotypes? Yes. There are descriptor and instance forms of deployment diagrams? Yes. A descriptor deployment diagram shows a particular deployment of the system? Certainly no.

A deploy stereotype can be used to document components within the node? Answer to that is yes. There is only descriptor form of a deployment? No, because there is an instance type also.

And now this is the bigger one. Let me just adjust it so that we can see at least a part of it. This is a big diagram. It's a case study which I think I need to read from here before I explain it to you what is happening.

So we say the booking agent must be able to manage reservations on behalf of customers who telephone or email reservation requests. So that means customers can communicate either by telephone or by email. Majority of these requests will make a new reservation, but there can be chance that there are amendments. Or there can be cancellations.

A reservation holds one or more rooms of a room type for a single time period and must be guaranteed by either an electronic card payment or receipt of a purchase order for corporate customers and travel agents. These payment guarantees must be saved for the future reference. A reservation can also be made electronically from the travel agent system and by customers directly. It can be via internet.

A receptionist must be able to check in customers. We have talked about the Check In activity previously. This section will allocate one or more rooms of a requested type. And in most cases, a further electronic card payment guarantee is required.

So a receptionist must be able to check out customers before they leave the hotel. During the Check Out process-- we have discussed this-- a lot of various activities have to take place. In most cases, immediate payment is required to settle the bill for any outstanding room, meal, or any other chargeable items added to the bill during the stay. And the common payment method is in the form of a credit card or in the form of a debit card.

Some customers will have all or part of their bill guaranteed by the purchase order. So if it is a company or a travel agent, then it may be a daily generated-- either a printed or any other sent electronically way. That is how you are taking the payments.

The room telephone is enabled upon check in, and marketing staff can publish current offers. The hotel group does not currently have a loyalty scheme. And that we have discussed previously.

Customers who provide phone numbers must be sent a text message. This also we have discussed earlier. Cleaners must be informed. That also we talked about, the check out process in the previous lessons.

So when the customer vacates the room after checking out, the various individual members of the staff should be notified. We have talked about this. Your job is to ensure that the hotel system includes the various functionalities for the notification purpose and so on.

Now, the task is to create a high-level deployment diagram from the selected architecture type and technologies. List the applications mentioned in the case study, and list all the actors and hardware nodes, relationship between the actors and the hardware nodes. Draw relationships between the hardware nodes. Label the hardware nodes. The ultimate is you are creating a detailed deployment diagram.

So these are the various hardware nodes. We have a Customer Machine, Travel Agent System, Electronic Payment System, Web Interface Machine, and Hotel Staff Machine, External Loyalty Points Scheme Machine, Database Server Hardware. You have an Application Server Machine, which is communicating with all the other hardware nodes, Department Display Screens, Hotel Telephone Exchange from where all the telephone information is going, and the Handheld Devices.

But what are the components which are deployed, software components on all these hardware nodes? Customer Machine-- with a browser. Our Travel Agent System-- with a travel application. Electronic Payment Machine-- with a card payments software. External Loyalty-- with the loyalty point admin software.

Database-- of course, with the database system, a database server. Web Interface Machines-- with the web server and email client. Hotel Staff Machines-- with a hotel interface system.

All are communicating to the Application Server-- your Electronic Payment System, your Loyalty System, your Travel Agent System. Client is not communicating directly with the Application Server. It is communicating with the Web Interface. And Web Interface, in turn, is communicating with the Application Server.

Hotel Staff Machines, using RMI, these are communicating with this. And then Department Display Screens are, again, getting notifications using SOAP protocol from here to the display software. We are using SOAP protocol for a variety of web services, like Room Phone Control System or Call Monitor Systems or Text Software systems. And we are using, again, SOAP with the handheld devices for Micro Hotel System Software.

So these are the various. We can see the communication with the hardware nodes is with TCP/IP, that the various nodes, except the Electronic Payment System is with Extranet, REST, all are with the other systems. That is, all are with the internet.

There is one system with the internet that is within the hotel premises only. And some are communicating with SOAP, some with RMI, and some are with HTTP. So this is about our-- so deployment diagram is just to show all the hardware nodes with all the deployed software, communication between hardware nodes, and communication with the software nodes, with some kind of node over here for some additional information. So this is about our lab 11.

