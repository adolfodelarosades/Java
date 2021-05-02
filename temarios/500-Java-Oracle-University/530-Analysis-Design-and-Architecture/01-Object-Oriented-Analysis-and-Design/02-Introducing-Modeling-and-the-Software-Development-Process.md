# 2: Introducing Modeling and the Software Development Process

1. Introducing Modeling and the Software Development Process - 42m
2. Lab 2: Introducing Modeling and the Software Development Process - 5m

## 1. Introducing Modeling and the Software Development Process - 42m

Module two talks about introducing modeling and the software development process. In this lesson we have two parts. First part, we'll talk about the OOSD process itself and how modeling supports the object-oriented software development process. We will also take a look at the various workflows, like requirement gathering, analysis, architecture design, implementation, testing and deployment.

We will learn a little bit what activities go in each and every workflow. And then we will talk about the modeling support for OOSD process and how it benefits the modeling of software. Now, over a period of time we see that the software industry, the way it works, the way development happens, and the way each and every activity is carried out is changed, depending upon the new languages, the new network protocols, the new kind of way the applications operate.

Previously we used to [? have ?] distributed applications where client and server will communicate with each other. Now with [? VIP ?] coming into picture, we have no control and no limit of the number of users who can access your application. And every client can be of a different type.

To the same application, there can be a client who is accessing the application from the desktop, or from a mobile, or from a PDA, or from a tablet, or maybe from the web browser. So we find that all the software development process now is following the object-oriented software development process. Object-oriented software development methodology is spanned over large-scale phases. It can be there are many different methodologies, so we are discussing one or a little more than one over here.

The total organization can be decomposed into medium-level phases. The total development process-- that means the software development life cycle is divided into various disciplines. And these disciplines, or workflows, are decomposed into various activities.

Activities produce artifacts. To carry out activities, we may use various tools, graphical editors, or some IDEs, some text editors, and so on. The final outcome is an artifact which is used as a part of the software development process.

The artifact can be a piece of code, it can be a textual document, or a graphical representation of a particular view of the system. Here in this diagram we just try to understand how the things work out. By using various tools we can produce various artifacts. Artifacts are created as part of the activities, and activities are sub-parts of the workflows.

Or we can say, a methodology has large-scale phases. Phases carry various workflows. Workflows can be carried out by doing certain activities. And activities can be performed using tools which in turn produce artifacts.

And all this happens to support the various object-oriented technology activities. And how the whole process goes is to be followed along with the best practices of object-oriented methodology. Now, the various workflows which we can see in object-oriented software development process are requirement gathering, requirement analysis, architecture, design, implementation, testing, and deployment.

When we create a certain software, it has to be communicated to the clients. So everyone who participates in this process-- maybe from the client side, maybe from the development side-- all are in general called stakeholders. So there can be client-side stakeholders, there can be development-side stakeholders. Client-side stakeholders are business owners, managers, and users. Business owner is the final decision-making authority.

The total software of a product is the outcome of the mental model of the business owner, and users are those client-side stakeholders who actually interact with the software. And managers are the people who manage the users and communicate with the business owner. On the development side, we have the project manager. Project managers are responsible, not for technical activities, but these are the people who manage the budgeting, the scheduling, and the delivery of the various-- you can say-- modules.

Business analyst is the one who carries out all the requirement analysis. Business analyst, along with the software architect, may meet the business owner, get the various requirements, analyze those requirements, and design the software with the help of a software designer. So software designer is the person who designs the individual components, the components which will fit into the architecture which is created by the software architect.

Programmer is the one who actually implements the design by writing the programs. And the software testers are the people who test the unit test cases, or the use cases, and find out whether the software is doing what it is supposed to do. Deployment specialists are the people who will be responsible to write certain scripts and to deploy the software onto the client end.

Here we begin with the process. The first process in this is a requirement gathering workflow. The business analyst and the architect can meet the business owner and gather their requirements, the high-level functional requirements. So in this workflow, we determine with whom the software will interact. Who are the actors of the system?

Actor does not mean an individual user. Actor is a role. Like maybe if I want to make a certain booking in a hotel. So I understand a booking agent can be an actor, or a receptionist can be an actor, or any online system from where the booking can happen, that can be an actor.

So after this we also gather the information about the behavior. What is the various functionality? The detailed behavior of the use case is analyzed over here. We gather the low-level functional requirements, and we also gather non-functional requirements. The detailed account of the activities can be seen over here.

The business owner provides all the details. The mental model of the business owner provides us the details that what activities need to be carried out. What are the various functions which can be performed? And as a result of this, the architect which is produced is a use case with all the high level requirements.

Later we can gather the low-level functionality. Like for example, when we analyze the various activities, we understand that some use cases are common. Some activities in the use cases are common, and these activities can be carried out as an explicit use case.

So we meet the project stakeholders to identify the additional low-level requirements. There can be a lot of documents which can be created in this workflow. Use case diagrams, use case scenarios, glossary of terms, the non-functional requirements are understood over here.

Second is a requirement analysis workflow. In this, we analyze our use cases. The detailed behavior of every use case is understood. We find out the supplementary use cases. Maybe some use cases, some low-level functionalities were ignored in the previous. We identify those.

We also identify the various entities, the key abstractions, the various domain entities which will be used along with the use cases. And we also create a business domain class diagram as a part of analysis. We can see the various activities which are carried out over here in details.

So number one, we analyze the use case scenarios to refine the use case forms and diagram. The use case form is a document. It's a kind of a textual document which will contain the requirements of functional as well as the non functional. It will contain all the details of a particular use case, the restrictions.

Also we will understand over here the various actors who are communicating, the glossary of terms. What are the preconditions of a use case? What are the post-conditions of a use case? The business rules? Alternate flow, main flow, everything will be understood over here.

As a validation, we can also create the activity diagrams, which will contain the more elaborate workflow of a use case. We analyze all the previous documents, and we try to identify all the key abstractions. Key abstractions can be found out by using Class Responsibility Collaborate analysis, which is called a CRC analysis.

Once the key abstractions are identified, we can create a domain model. The domain model will contain all the classes, the association among the classes, and the multiplicity. It may also include the navigation from one class to another class. Optionally, we can also validate our domain model by creating the object diagrams for particular use case scenarios.

Architecture is a study of all the high-level structure of our software solution. Mainly, the architect will identify the risks, will provide the mitigation plan. The architecture will be defined, the architectural patterns will be identified and will be applied. As a result of this, we will be able to have a clear picture of all the non-functional requirements.

In the architecture workflow we model the high-level system that can satisfy the non-functional requirements. We develop the high-level structure of the software solution. We identify the risks and provide a mitigation plan. And we satisfy the NFRs, Non-Functional Requirements by making use of architectural design patterns.

As a part of architecture workflow, an architect will select the type of the system, the architecture type of the system which can be a standalone, which can be a client server, or it can be application [? end ?] [? tier. ?] It can be web-centric [? end tier ?], or it can be [? e-centric ?] [? end tier ?]. After identifying the architectural type, it will create the deployment diagram for the architecturally significant use cases, which will show the various use cases of architectural importance, the components deployment, and the communication of these components using various protocols.

We will refine the architectural model to satisfy non-functional requirements, and we will create the architectural baseline. We may also create evolutionary architectural prototype, which will be considered as the-- you can say a proof of concept for the architecturally significant use cases. We will document the technology choices in the tiers and layers diagram. So these are the various activities which are carried out.

So until now we talked about requirement gathering. In requirement gathering we determine what the system must do. Now, there can be two possible alternatives in the requirement gathering. One, it can be that we are using a fixed model. That is, maybe we are using a waterfall methodology where we will create a vision document and there won't be any change in the requirement gathering once it is being done. So that means 100% of requirement gathering must happen over here.

The second alternative can be maybe we use incremental and alternative methodology. In that case, as we go ahead we will keep on discovering the various use cases and we will keep on going. Maybe around 80% of the requirements will be gathered initially, and the rest of the 20% we will discover as we go along the process.

In the requirement analysis, we model the existing business processes. We create two main models. The first one is a use case [? view ?] model and second one is a domain model.

In the architecture we model the high-level system, we identify the type of architecture, we understand that which component will be deployed onto which hardware node, which technology is to be used. What are the risks? What are the mitigations for that?

Then coming to the design. Design workflow helps us to design the overall system. In the design model, we design how the system will support the various use cases. So we will create a design model for a use case using interaction diagrams. We can create communication diagrams, or we can create interaction overview diagrams, which is a combination of activity and the sequence diagram fragments.

We can create sequence diagrams. We identify the model with non-trivial states using a state machine diagram. We identify that are there any specific use cases which are missed over here? Depending upon the state, maybe certain activities are happening. So that will be mapped using state machine diagram.

We will create a solution model by merging the design and the architecture models. Solution model is the one which will be given to the implementer or a developer who will actually code the software using that. We will refine the domain model to add new functionalities to identify some additional behaviors. You can say to refine [? our ?] attributes, to refine the methods, and to refine the associations and multiplicities. So all these activities will be carried out as a part of design workflow.

In the design workflow, the designer will model a use case using a robustness analysis. In the robustness analysis, we will be able to identify the various types of components, like what are the UI components? What are the business processes? And what are the back-end entities, domain entities?

We identify the behavior which is dependent on the state. We visualize them or model them by using state machine diagrams. We apply the design patterns to make it sure that all the best practices are being followed.

We create a solution model by merging the architectural model and the design model so that all the functional and nonfunctional requirements are considered. And we refine the domain model to satisfy the solution model. So these are the various activities which we carry out.

Implementation, testing, and deployment are not discussed in this course, because these are the actual code-related activities. But implementing the software means writing the codes and debugging the codes. Testing means performing all sorts of testing, unit testing, integration testing, and to make sure that all the unit test cases are successful. And then the scripts are written, and the deployment of the software happens in the actual production environment.

So the activities which are carried out over here, the developers implement the software solution by writing the codes. Testing of the software solution happens by the testers. The various use cases are written or the test cases can be written at various levels. And different kinds of testing can happen, white-box testing or black-box testing. All those tests will be carried out.

And then the deployment of the software will happen at the client end. It may be the system administrators who will carry out the various activities to make sure that deployment is OK and everything is working fine. Now, we talked about the various models, the requirements model, the design model, the architecture model.

What does a model do? What exactly is a model? A model represents the different views of a particular-- you can say a software or anything. A model is an abstract conceptualization of some entity. That entity can be a software entity, or it can be anything other than that.

Software modeling came into existence by the inspiration far the modeling which was there in the civil industry, in the buildings. So in the software model, we find that the model may represent any component. It can represent a network, or it can represent a software component. It can represent the way various components communicate.

It will model, and it will show the various views of the same particular product. Maybe a sequence diagram view will show how the objects will communicate over a period of time. The domain model may show the various classes and their relationship with the other classes. Activity diagram may show the way of working of a particular use case from neither a very high level or not in-depth. It will show the activities to be carried out, but it will not show which object is communicating to what.

So we can have various different models. So why do we use modeling for the software? If I want to understand a system which already exists, or if I want to create a new system, want to design a new system, I may write a lot of text. I may create a text document, maybe of 200, 300, 400 pages to understand, OK, this is how the system is working.

And I give it to somebody has to-- even the stakeholders who are using it to tell them that please see that if this is right. Do they understand the things, this is how is it working. [? Text ?] is a very deceptive area, you know? People can interpret it in different ways.

So if everything is shown in a diagrammatic way, there is no chance of any confusion or misconception. So modeling is used to visualize the existing systems and to create the new systems to show. If I create a certain diagram and if I say that this is how it will work, for example, let us take a small example over here to understand what we are trying.

So say I tell the stakeholder that this is a booking agent. And this booking agent can create a reservation. And here is an admin who can cancel a reservation. They understand it very well.

I can further break it up by saying that the actor will provide all the information, input, details. And these details will be sent to another system. And with these details we will create a reservation. And as a part of the reservation we will identify a particular customer.

We will identify, we will search rooms, they will understand it well. So it is a graphical way to represent the various activities and to show the same system from different points of view. And these different views can be provided to the different people.

Like for example, use cases can be shown to the business owner to make him understand, OK, these are the major activities which we want to carry out. We can elaborate the use cases and show it to the users by saying that this is how these activities are carried out as a part of create a reservation. We can create a sequence diagram, and show it to the developer, and say that, see, this is how at this point of time you're creating this object. And this is how the communication has to take place.

So we can communicate the decisions to a variety of project stakeholders to document the decisions made in object-oriented software design workflow. For example, you may create certain document. For example, glossary of terms is one such document. All the terms which are used by the stakeholders are a part of that problem domain will be listed over there with their definition.

We can list all the non-functional requirements by which we understand, these are the properties of your system. These are the factors which will contribute to the quality of service and can be communicated to the stakeholder that saying that, OK at present we are designing it for 100 users at a time, but the system can scale up to 200 users or 500 users later. So we also specify the various structure which are static and dynamic in nature. Like we can show the domain entities as static and we can show the sequence diagram as a part of the dynamic element of a system.

We can also use a template for constructing the software solution. You may create one particular template, and you can apply-- you can use that template for the various use cases which have certain commonalities. Now, software development can be viewed as a series of transformations. We begin with the stakeholders' mental model and we end up writing the actual code.

In between these two, there is a lot which happens. You need to gather all the requirements and you need to analyze those requirements that makes the requirements model. Now, as a part of the requirement model, we gather functional as well as the non-functional requirements.

To design the model which satisfies all the functional requirements, we create a design model. To find a solution to all the non-functional requirements we create an architecture model and we combine these two models to create a solution model. In the solution model, all the design components which are designed in the design model fit into the created architecture.

And we create the solution model. The solution model is given to the developer to write the codes. And that is how the total process takes place.

Now, UML is a graphical language which is used for designing all these models. We can visualize, we can construct documents, we can do a lot of things with UML. And to do that, UML provides us elements which are things and relationships. Various elements can be put and their relationships can be created among the various elements.

Using these elements we can create various types of diagrams, a communication diagram, sequence diagram, use case diagram, timing diagram, and so on. And these diagrams help us to visualize the system from a different perspective from the different views. So here are the UML elements, various UML elements. The actors, the use cases, components, which can be any type of components.

This kind of a node represent a hardware component. This represents an code. And this represents any kind of archives. We have the package elements where we can package other various elements, maybe the use case diagrams, or the class diagrams, or the various components.

Here we have other elements which can be used to build the various type of diagrams. We have class nodes or class elements. We have state elements, various types of states can be represented.

And we have notes. The notes can be attached to any kind of an element to give more description about what that element is doing. And then we have the relationships, the various kind of dependencies. We can show the association between actor and a use case using association.

We can use dependency to show how one component is dependent upon another component. Generalization, used for inheritance, and realization, used for implementing the interfaces. So the various elements are provided.

Now, these are the various diagrams which we can see over here for the UML diagrams. We have a class diagram. The class diagram shows the relationship between the classes. What are the various classes participating in a particular use case and their relationship?

The object diagram is shown as a runtime instance of a particular class diagram. Component diagram just shows the collection of physical software components and their relationships. Deployment diagram shows where the various components are being placed and how these communicate using certain protocols.

Compose structure diagram can show the internal structure of a particular composite. Package diagram can show which are the various components which can be put together. It can be shown at various levels. We can have a package diagram right starting from a class up to the systems and subsystems.

We have a profile diagram which define the existing diagrams with additional notations. Like it can show the stereotypes, or constraints, or meta-models. Then we have other categories of diagrams. Actually, we can draw one line over here, and we can say-- we will see that in the next slide also these can be called as diagrams which are of static nature and these are the diagrams which are of dynamic nature.

So we have use case. Use case shows me the high level functionality. We have activity diagram. A communication diagram shows how the various components will communicate with one another. Sequence diagram will show communication over a period of time.

interaction overview diagram will be a combination of activity with a fragment. State machine diagram will show what are the behaviors which are dependent upon a various state of an object. And the timing diagram. Here we can see, these are all structural diagrams. These represent the structure of your system.

And these diagrams show the runtime behavior of your system, or the runtime behavior or the interaction of the objects for a particular system. Now, there are some common elements and connectors which give more meaning to any diagram or any model we create. We can package the various components or various diagrams. We can add notes. We can use dependencies and stereotypes.

So here is an example of packages and notes. In the first case, we can see that the package shows all the use cases for door access. Like you can open the door, you can close the door, and you can lock the door. So these are the three functionalities related to the door.

But in the second diagram, we pick up a single use case that is a locked door and we show the various diagrams or various views related to that. So the first one is a use case. Then we show the robustness analysis, which are the boundary service and the entity components related to this. And here we show the domain diagram for that.

Notes can be added. Notes are shown by a dog-eared rectangle over here, a bend on the rightmost corner. And we can add the notes with any component. Like for example, in a class diagram with a particular method, we can show that what this method is supposed to do.

Say, for credit we say balance is equal to balance plus amount, and for debit we say balance is equal to balance minus amount. Sometimes if you want to do a certain process in one particular style or you want to follow a certain algorithm, you can write the details about that in the notes. Dependency shows, we can say at the analysis time, we identified an account class which had number, balance, and type as the attributes. Credit, debit, and get balance is the operations.

At the design time, we refine the account class, which is dependent on the analysis time class. So this is the various kinds of dependents we can show. Like here in this particular case, we show the dependency that account class refines the previously existing account class.

Or the client communicates to the server using HTTP protocol. Or a particular component communicates with another component using a [? SOAP ?] protocol. So we can show the dependencies, and the dependencies get more meaning when we use stereotypes. Stereotype is just a label which brings more meaning to the dependency, which makes it more explicit to understand exactly what is happening or what is being used.

Then we talk about the UML. Now what UML is and what UML is not. We previously talked about UML that it's a graphical language which helps us to create the various models. So let us take a look at what UML is not.

It is not used to create an executable model. That means, it is not a programming language. Or it is not a methodology. I cannot say, I'm creating an object-oriented software design using UML methodology. UML is a tool which can be used to create certain model or create certain uses depending on various methodologies.

So it can be used to generate even the code skeletons. There is a facility that if you provide a class diagram, maybe the class code can be generated from that. And UML is created in such a way that mostly it maps to the programming languages. Like for example, you have a class node which can be mapped to a Java class or a C++ class.

So it provides us the sub-elements like, I can use a minus to show a private in the class. If I write any element with a minus sign, that means it will map with a private element. If I use a plus sign, that means it will map with a public element, and so on. So it can be used as a tool within activities of any certain methodology.

There are various tools available which can be used for creating all the UML diagrams. There are some tools which provide support for the verification of the diagrams. We can use certain methodology, like there is a rational suite which follows a rational methodology to create all the various processes. If follows all the phases and workflows of rational.

We can generate code skeletons. There are a lot of tools out there with which you create a diagram and it will create the simple class code for you. So that reduces the burden on the coder.

There are tools which will organize all the diagrams for a particular project. So there are automatic generation tools. Like NetBeans and JDeveloper provide a facility that you can create a diagram for Java code and so on.

So there are [? UMLet ?]. I introduced one with you in the previous lab. So you can use that style. UML is there, MS Visio is there, Enterprise Architect is there. And the basic functionality is provided within JDeveloper and NetBeans like software too.

So in this lesson we talked about the various workflows which we follow for the object-oriented software development process. And we also talked about UML. We talked about the various kinds of diagrams, the various elements, and [INAUDIBLE] can do for us and what it cannot do for us. So this was our lesson number two.

## 2. Lab 2: Introducing Modeling and the Software Development Process - 5m

 
So in lab two, we have various activities related to the workflows. We have activity for requirement gathering workflow, for requirements analysis workflow, for design workflow, modeling software, what are the benefits, and about UML.

So I will show the solutions over here. So this is the first one where you have various terms. And you have to map it to its definition.

What is requirement gathering? Or what is requirement analysis? Like model the high-level structure or system, paying particular attention to the NFRs files and mitigation of risk. So this is architecture.

So we will map the various terms over here. And this is, again, fill in the blanks. The definitions are given and you have to identify the characteristics of a requirement gathering workflow. So which are the answers? Which one is right?

For example, answer A, C, and E is the one which maps the requirement gathering. B and D do not map. These belong to the various work flows. Activity three is to identify the characteristics of a requirement analysis workflow. So the workflow includes recording use case scenarios. That is wrong, because this activity is a part of requirement gathering workflow.

B is right. This workflow starts with analyzing and use case scenarios. Option C is wrong, because this is a purpose of a design workflow. And E is wrong because it is related to the deployment diagrams.

Activity four is to identify the characteristics of architectural workflow. D and E is not right, because here we are talking about the purpose of this workflow is to model the high level structure of system to satisfy the functional requirements it should be the non-functional requirements, not the functional requirements. And you will refine the design model during this workflow. This is not related to the architecture.

Next activity we have about the design. So we find A and B is wrong. A says that you will use an activity diagram to verify the use case diagrams during this workflow. So this is done during the analysis.

And B talks about the scenarios, which is again about analysis. So C, D, and E are the right options over here. Here we try to explore the benefits of modeling. We can show the various views for any particular activity or any particular component.

Activity seven talks about the benefits of modeling of the softwares. So model gives you only a starting point for a new system. This is wrong, because model provides the various views. Option B says model helps you only to understand what you have developed. It is before our development.

And option C says model helps you to visualize new or existing systems. That is right. We can create a model for the existing system or for the new system.

B is not right, because models are concrete realization of the system. It is not. Option E is right, because model helps you to communicate the decisions to the project stakeholders.

So this is a self check activity. Various diagram names have been given and the definitions. And you can map it by reading it from the student guide. So with this, we come to the end of activity two.
