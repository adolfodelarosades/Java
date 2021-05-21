# 1: Introduction to Web Services

   * Introduction to Web Services: Part 1 40m
   * Introduction to Web Services: Part 2 12m
   * Introduction to Web Services: Part 3 4m
   * Practice 1-1: Configuring NetBeans to Control WebLogic Server 5m
   * Practice 1-2: Creating and Deploying Web Service Sample Applications 14m
   * Practice 1-3: Web Service Testing 6m
   * Skill Check: Introduction to Web Services - Score 80% or higher to pass

## Introduction to Web Services: Part 1 40m

Good morning, again. Welcome, everybody to the Java EE6 Developing Web Services with the JAX-WS and JAX-RS technologies. JAX-WS is for SOAP, and JAX-RS is for REST web services. I'm going to start by introducing the course, and then, of course, after that, I will get into the concept of web services.

So let me go ahead and start with the course itself, which is just the first chapter for an introduction to web services. In fact, what we are going to do today, we're going to do a little bit of review. Most probably you guys are a little bit familiar with the concept of a XML. So we do have a chapter just to do a little bit of review about XML. And then we're going to get into, of course, the concept of a one API for web services. I do not know if you folks heard of JAXB. JAXB is an API that allows you to [INAUDIBLE] XML objects, so we'll just show you that. And then, of course, after that, we'll introduce the SOAP web services. That's what we're going to do today.

And we'll start by getting into the SOAP web services, and then when we finish with the SOAP web services client, then we get into REST, and then the REST client, and then after that we get into building SOAP web services, top, down, bottom, up, and then building a RESTful web services in the JAX-RS API, and then get into more chapters later, and I'll discuss all of those.

So let me start by the introduction to this course, which is explaining the need for a web services, looking at defining these web services, looking at the characteristics of these web services, explaining the concept of a message, a format, which is either, in this case, XML or JSON, and we're going to explain both, and why XML and why JSON, identify the two major approaches to developing web services, which are, by the way, SOAP and REST. These are the two major ones. And explaining the advantages of developing web services within a Java EE container.

Now when we talk about a container, in this case, it would be either a web container, or you could be, by the way, a web and an EJB container. We'll talk about that.

So the objectives of this course, which is, by the way, quite an attractive course. It is a course that covers the latest and the greatest of the web services technology. And we'll start by creating XML documents using the namespace declarations and XML schema. This is pretty much a review to the concept of XML, talking about XML, format of XML, the syntax in XML, resolving name conflicts using the namespaces, talking about validating XML through XML schema and so forth.

Then, of course, we're going to talk about producing and consuming XML and JSON, getting into creating RESTful web service clients, getting into creating SOAP service clients by using the JAX-WS API. Of course, when I say here, creating REST web service clients, if you take a look here, we did not say, using JAX-RS. And I will talk about it when I get there. We do have a couple of APIs that allow you to create this RESTful web service clients. One is Java using the pure HTTP UI connections, and the other one is the Jersey API.

Then we're going to get-- once we've built, of course, a REST and SOAP web service clients, we're going to build also the REST web service using the JAX-RS, and then, of course, we're going to build a SOAP web service using the JAX-WS. In the SOAP web service, we are going to discuss a couple of ways to build these web services-- bottom up and top down. We'll explain what's the usage of every one of them, the advantage and disadvantage of every one of them, and so forth.

Then after that, of course, because we're dealing with web services building within the context of enterprise applications and Java, and as you know, we need to deal with errors. It's not always rosy. Once in awhile, you get issues, and we need to find out how to handle errors in SOAP web services and errors in REST web services.

After that, we start by introducing the concept of web services security, where we talk about web service security in general. And then we get into the WS security, which is an API used to secure SOAP web services. But we also talk about a very nice technology. I don't know if you folks, anybody heard of OAuth technology. So we will take a look at that. And it's an open source, and we'll see the implementation, the Jersey implementation part of it. That will be, by the way, towards the end of the course.

So you guys pretty much, we got introduced, and so that's the next thing. Of course, the typical audience of this course judgment is, ladies and gentlemen, is, of course, a Java Standard Edition and the Java Enterprise Edition. And, of course, I will talk about that a little bit later on. The prereqs for this course, it would be nice to know about Java SE 7. Are you folks are familiar a little bit with the Standard Edition Server? So we will talk a little bit again at some point in time and mention what's new in the SE 7.

And some of the new concepts of the SE 7 are really quite good in terms to help performance, to have a development of the code, and so forth. And so this is more or less what we're going to cover pretty much every day. Of course, now the next is the environment. This environment is on the machines, the lab machines that are available to you. So we provide you with the JDK 7 already installed, NetBeans already installed, and, of course, the Java EE6 WebLogic. That would be an application server that we use.

And, of course, the Firefox and a browser. Why? Because we are going to install the REST client extension on the Firefox to test our web services. We also use a tool in cURL to just do some testing, a little bit of jQuery, if somebody's interested, we have it as an option, just in case somebody to use it. We provide a student guide and an activity guide.

I assume that everybody downloaded their student guide, and their activity guide. Of course, the API. Chance is that when I talk about many, many of these, the plumbing of web services, if you want, the coding, I will be also sharing some of the APIs to explain what is it that we added in the API at the Standard Edition and not the Enterprise Edition, of course, to have been web services. So that's why, of course, the Enterprise Edition specifications.

We focus more on the current one, which is the EE6 in this case. So this is just the curriculum that we have, and the courses in blue are pretty much-- the background is blue. Those are the Standard Edition courses that we have available, and then what's in red is those are the Enterprise Edition. Of course, here in our particular case, we're focusing more on the Java EE6 developing web services using the JAX-RS and the JAX-WS web APIs.

And, of course, the question that we always have in this case is that, why do we need these web services? And for that, let me just go to the whiteboard, and tell you a little bit of a story of what happened throughout the years, and why is it that suddenly web services came into the picture. So awhile ago when, of course, TCP/IP was created, everybody was quite happy. Why? Because through TCP/IP, we can allow two systems to talk to each other.

So anybody has done that awhile ago and trying to implement that in the C language and other languages and so forth, but at some point in time, well, people said it would be nice to actually have a standard interface that you implement at that standard interface, API will actually be an adapter so that two systems can talk to each other.

And you've most probably heard of CORBA. CORBA had a protocol called IIOP, and then, of course, we used that awhile ago. And then in 1995, when Java got created, when the Java Standard Edition-- let me just-- when the Java Standard Edition got into the picture, we actually created them in an API that allowed two objects or two Java objects to talk to each other through the network. And that was-- anybody remembers that API? RMI, thank you, sir. RMI, Remote Method Invocation.

Of course, we used to actually implement that by hand, but then in 1997, a group of engineers from Oracle, at Sun, they just said, you know what? Every time we build an enterprise application, we have to code everything. We have to code security. We have to code persistence. We have to code transactions. We have to code the naming services concept. We have to code the multi-threading. We have to code the concurrency and so forth.

They said, why not build a piece of software that handles all these common services through configuration, and let the developer focus only on the business logic? That's how actually the Java EE technology came into the picture. So when we created a Java EE, we started with now the concept of software servers, a web server like the Apache Tomcat, and then an application server.

So what is this application server here? This application server is a piece of software or a middleware made of one or two containers. One, let's put in the full Java EE application server that has a web container, and it has an EJB container. And then, of course, we do have the resource deal, which would be, for example, a database in this case.

We could also, by the way, have an EIS system, an enterprise information system that can also talk to our ser-- it could be a mainframe. It could be another server. Could be a .NET server for that matter, and so forth. So these are what is called the web container, and what is called the EJB container.

And of course, we do have now-- we would love to have as a client what we call a thin client. So we then have the client, and our client's typically a browser. So what we have done, what we also have done in this case, we also have said, OK, let's go ahead and divide all of this into tiers. So here, we have the client tier, the client tier. Let me just write it nicely. Client tier. Then here we call this a presentation tier, and we call this a business tier.

That's where your business logic is, and then what we have done in this container, we also created one more tier here, and that is called the integration tier. The integration tier. Of course, this is the application server that we are discussing here, and at that time, we actually had an API that allowed a Java EE server to talk to a CORBA system. And if you remember that JAR file is called RMI-IIOP, which allows Java to talk to CORBA and back and forth and back and forth.

So which means here, we can actually talk to an EIS system through that. And that's where in our slide here, we say if you take a look here, we say that a computer program calling a subroutine located in a different type of a machine on the network, we did have many different type of technologies. One is our PC from Sun Microsystems, which is Oracle now, was an early example of that cross system. And then, of course, other ones like the CORBA/IIOP, the .Net Remoting, the RMI, and so forth. That's pretty much what we had.

Of course, in these times, for many of you, most probably you are familiar with the concept of having here what we call a connector, having the concept of a connector that allow an app server, in this case, or app server components to talk to an EIS system, or even to a database.

And, of course, in this enterprise application, we do have now, for example, we can go ahead and make a browser called, for example, a servlet through a bunch of filters that handle authentication and authorization and so forth. Let me just go ahead and represent this as an SF or Servlet Filter. Could be more than one. And then from a servlet, we can go ahead and call a component here, for example, could be here, a business delegate that will delegate the call to a business component here.

My business component here, it could be, for example, a stateless session bean EJB, which calls this one here. And then that stateless session bean can now call the database if he wants to get some data from a database. But I can go ahead and use, for example, in this case, a DAO, Data Access Object, or I can go ahead and use a domain store. A domain store. A DAO uses JDBC, uses a JDBC, and the domain store can use JPA. You guys know a little bit of JPA ORM software like Hibernate. Have you heard of Hibernate, TopLink, EclipseLink? That's the idea. So it's a choice.

So for example, if you're using JPA, then chances that you are going to use an entity class representing the data, which, by the way, this will talk to the database, of course, either one of them. JPA is an API that was built above the JDBC, which allows, of course, a faster production, and it allows you to make use of an ORM software, object relational mapping software, which actually activates the implementation of the code that talks to a database.

So this is just as an example. But if you take a look here, that was, in this case, a call, an HTTP call from the client, which is, in this case, a browser, a thin client on a browser, which is, in this case, we can call it a B to C. So then the introduction of XML, which is an interoperable language, came into the picture, especially if you're moving XML through HTTP, because HTTP is a lot cheaper as a transport protocol. That's where the idea of once XML was introduced over HTTP, the idea of now having two systems talking to each other through XML became very, very attractive, because XML is interoperable. That's how the idea of web services came into the picture.

It's the interoperability and, of course, the easiness, and the implementation is quite simplified and so forth. That's how we came up with the idea of web service, which means now we can have an outside system. That could be, for example, an EIS system like this. Let me represent this way as what I call, in this case, a web service client. And this web service client now can interact with your system, and the interaction of your web service client with your system, you have a choice. You can actually have it interacting through a, in this case, you could be a JAX-RS servlet or a JAX-WS servlet. OK. Either one of them.

And, of course, the interaction of this web service client through the JAX-RS, which, by the way, can now make use of a component here, could be a web service broker, for example, component, which might be me now, give a talk to the business delegate, which talks to the facade. Or the same thing here. It could be calling a web service broker, which allows me to talk to the business delegate, which talks to EJB, or I could call directly the EJB. I can also do this direct call too-- why not-- from this component.

But the bottom line, you can access your facade that represents web services, but this time it's from outside. We can even do better. We can also, if we want, and we have also another alternative here, where I can go ahead and make use of a stateless session bean JAX-WS servlet or a stateless session bean JAX-RS servlet. And these, by the way-- here, I said stateless. Actually it could be also a single session bean. That also can be used. And I can make the web service also call these components, which themselves can call the business tier, the interface, or rather, the session facade.

So in this case, what we're showing you is that now, an outside system can interact with your application, your existing enterprise application, and all what we have done in the case of web services is we created the infrastructure, the web services infrastructure, that allow a web service client to talk to your application, either through JAX-RS or through JAX-WS. We can investigate these JAX-WS and these JAX-RS APIs. We can investigate this web services infrastructure that allows now two systems talk to each other through web services, through the concept of, of course, what we call the JAXB, rather the JAX-RS or the JAX-WS APIs.

And, of course, when we talk about these web services, here I just said web services, but, of course, there are two types of web services. There is a SOAP web service, and there is, of course, REST web service. Now why is it that-- now, by the way, also if you follow the Java EE specification, the Java EE specification also tells you that you don't have to use an EJB container. Let's assume that you have a Tomcat Apache up server. You can now use what we call web profile, and you can actually use an embedded EJB container inside the web container and interact with it. In fact, that's what we're going to do in the course.

And this way, it allows you to deploy your web services into a WAR file, rather than an enterprise archive file. I'll share that with you, of course, later on. So why is it that we would like to use an application server for these web services? Just because, in general, the app server provides a lot of services for you, for your managed components for free, rather than coding that.

And that comes from the layer pattern, which is an architecture pattern, where in general, we say we do have a hardware machine that would be your server. That would be your hardware platform. And then to make the hardware work, what we need to do is we need to now install an OS system on the top of it, and then to run Java-- that's an operating system. It could be Linux, Solaris, Windows, and so forth. And then if you want to run Java on the top of that, what you need is the JVM.

So we could look at all of this as what we call a lower platform, these two. And then what you need to do is if you want to take advantage of having a middleware server like this WebLogic or GlassFish and so forth, so obviously, this app service provides lots of services for your managed components, which are servlets, JSPs, JSF components, enterprise Java beans, stateless session beans, stateful session beans, single session bean, and message-driven bean, and so forth. We could actually have an EIS system interacting with your system through an asynchronous communication and sending messages to a JMS system here, which is picked up in the queue or a topic by an MDB, by a message-driven bean, and getting processed.

So that's why you need to install an application server, a Java EE app server. And this Java EE app server, this pretty much would be an upper platform. I can look at it as an upper platform. But every app server has a specification. I can now specify the specification through a layer here like the one that we are dealing with this in this course would be the Java EE 6 specification. And that would be what we call specs and frameworks.

And that would be related to your app server. That's typically called a virtual platform. Why? Because it changes. If it was EE 6, it was EE 4, and then EE 5, and then EE 6, and now, of course, and so forth, and the next one EE 7 and so forth. And your applications in which you've built all these components are represented here on the top of this as an application platform. Your applications.

So what we are going to focus on in this course is the web services, the interaction with web services. That's what we're going to focus on. This APIs, the JAX-WS for SOAP web services, and the JAX-RS for RESTful web services, and the concepts and the characteristics of every web service. That's what we are going to focus on. And then towards the end, we talk about securing these web services.

So and that we said, obviously using these types of technologies, obviously, you need pretty much the concept of having to have to install a bunch of APIs and having to do a little bit of an implementation. Of course, many of these technologies, unfortunately, they suffer from the platform-specific type of a language or programming language and so forth.

And also they were quite complex. That's why we came up, by the way, in this case, with the idea of web services. So this, the W3C, which is the Worldwide Web Consortium, what they've done, of course, in this case is they introduced these web services, which is nothing but a software system design to support the interoperability of a machine to machine interaction over the network. That's the idea.

Of course, to be able to build these web services, we need also some of the APIs that allow us to build these web services, and we're going to use, for example, technologies like the WSDL file, which is the Web Service Description language would allow us to actually describe the web service that you're trying to expose to the client.

And then we'll also make use of messages. These messages can have the form of SOAP, and we'll take a look at how SOAP is built, and our XML, which also can be used-- the XML has tendency to be used, for example, by REST. That's the raw type of XML documents, and SOAP is used for SOAP web services.

Of course, over the years what happened to these web services, ladies and gentlemen, is that they evolved, and beyond these definitions, and we're going to take a look at all what actually has been added to the whole machinery if you want to, the whole machinery of web services. So characteristics of web services, why they're liked, because their platform-neutral, which means I can have an app server like WebLogic talk to another system. It could be a mainframe, could be a .Net system, could be through web services.

So a platform neutral data interchange, client server type of an architecture, where we do have a web service client which represents, in this case, by the way, the client side, and then the service side would be these servers that answer to all response to a request or web service request. So in general, SOAP and REST web services are not tied to HTTP as a transport protocol, but just because of the fact that HTTP is quite popular and it's ubiquitous. It exists almost everywhere. That's why HTTP became, if you want, the de facto type of a web service, a transport protocol.

So of course, whenever we work with a web services, we need to describe these web services. Every web service that you want to code or you want to call an operation represented by, in this case, a web service, we need to describe how actually we are to interact with-- we are going to interact with these operations.

And that's where we came up with this idea of the WSDL. We'll get into the WSDL file in detail and understand how all of this API is built. That's called the Web Service Description language, which is similar to the Java interface. And pretty much list all the operations, the parameters, the return type, and so forth.

And WSDL file is usually primarily used for SOAP web services, and the WSDL 2.0 actually can support RESTful web services, but it's not up to the level yet. We also can make use of another file, which is called the Web Service Application Description Language. That's what we call nowadays the WADL file. This is nothing, again, but an XML description language of RESTful web services.

Don't forget that sometimes we need the human readable type of representation. That would be HTML. As you know, there are now engines that are used on the web tier, and these engines, what they do is they allow us to convert an XML document into an HTML document. An example of that is a machinery or that API. Anybody have the XSLT? That would be an example, or like a JSF plugin would a renderer and so forth.

So because we use web services for business to business, but don't forget also, in some cases, we also need B to C too, business to consumer, because we human beings, we understand the HTML concept. We know, because HTML will be written in a language like the English language, so we can read and understand what the information that, of course, is represented to us.

And don't forget that these web services are self-describing, which means giving a starting URL, you will discover all the rest. We'll talk about all of that. That's what we call a progressive disclosure, and we'll take a look at that. Rest focuses a lot on progressive disclosure. And to help facilitate this platform, a neutral data exchange, what we have done in this case is we made use of a couple of ways to represent the format of the messages or the web service messages, and that's using either the Extensible Markup Language, which is XML, which is, by the way, used by both SOAP and REST.

There's a whole-- and sometimes it is attractive, because it has a big library or big processing line, not many number or large number of processing libraries that exist to support the XML for almost every language. And it has a bunch of APIs that help you process these XML documents, and that's like the SAX. Anybody heard of SAX? Or DOM and so forth, and StAX. The one that we are interested by in this course is really JAXB, and we actually dedicated one chapter or one lesson for this JAXB in this course.

SOAP web services rely on XML, but, of course, the libraries hide all the portion of the XML part of it, which is SOAP. And by the way, nowadays also, lots of businesses do make use of JSON, which is quietly used for RESTful web services. And by the way, why people like JSON? Because it maps very nicely to JavaScript objects. And so it's a subset of JavaScript. Less variables then XML, but it does a very, very good job. The support is evolving for all the languages, and nowadays, actually, it became one attractive format for web services that everybody wants to use for web service, of course, and messages.

And the whole approach behind getting into these web services is a couple of ways. There are two main types of web services-- what we call SOAP web services, and SOAP web services are heavily standard, and, of course, evolved throughout the years. But now they became quite a mature type of a web services. XML data is transmitted over HTTP. That's, again, in general, the de facto type of, or if you want, the popular transport protocol.

And the XML data lists the methods and the parameter calls and [INAUDIBLE] to call and so forth. That's to do with the WSDL. We'll take a look at all of that. And, of course, an XML response, which is generated, in this case, containing the method return data and so forth. And by the way, for a SOAP web services, nowadays you can actually build them or develop them in a couple of different ways.

Either the WSDL, you start with WSDL, and you end up with code, and that's called a top-down development methodology. And the second one is the code. You start from the code, and you get to the WSDL, you generate the WSDL, and that's what we call a bottom-up. In fact, we do have for every one of them, we do have one lesson. And we'll dedicate that one lesson for each one of them, and we'll take a look at those in detail later on.

Of course, now we do have another type, which is REST. REST became quite attractive. Why? Because of the fact that it's a lightweight and less format approach. So because of the different layers that were created in SOAP, somehow the issue of performance becomes a topic, and that's where the idea of moving data, especially if you're reading lots and lots of data at once, REST became quite attractive.

And that's why we're going to investigate how REST is attractive and how REST would do an excellent job. So REST uses HTTP operations as methods. And REST, by the way, what's good about REST, it relies on the HTTP API. So the GET and the PUT and the POST, and so forth, so we're going to see how all of those are used within the context of RESTful web services.

And different URLs represent resources. Basically, REST focuses more on resources. We'll take a look at that. And of course, the format of the RESTful web service messages are either in XML or JSON. And of course, we'll look into that into different examples and how actually we can characterize a message in a form of XML, or a message.


## Introduction to Web Services: Part 2 12m

So in terms of the web service implementation, we know that SOAP web services now is supported by the JAX-WS API. And of course, for those of you most probably remember, there was an API before JAX-WS, and that's called JAX-RS, but what we should know, ladies and gentlemen, is that JAX-WS is not backward compatible with JAX-RS. And so if you do have old web services that make use of JAX-RPC, then what you need to do is you need to have that installed, all those libraries installed, because JAX-WS is really quite good.

In fact, in many cases, we call compare JAX-WS to JAX-RPC. We always say JAX-WS is the magic wand. Really, it does a lot of things for you underneath the hood. And we'll see that throughout the course when we talk about the different topics of the JAX-WS, plus in addition when we do the labs.

So JAX-WS is part of the Standard Edition, but a production-grade HTTP server is not. So remember one thing is that, and we'll talk about that, so because really the production-grade HTTP server on the Java Standard Edition is really to test your application. If you're going to do a POC, proof of concept, that's something fine. But it's not a production-quality type of server. That's why you need an app server like, what do you guys have? WebLogic or GlassFish and so forth.

We do have, of course, in SOAP web services, we have some extras, and these are what we call the WS extensions, which are not included, and we'll talk about those once we get into the JAX-WS API. We'll also discuss what are the features of these extensions, which are the JAX-WS extensions, and why are they helpful. We'll discuss those also.

Most probably you guys heard of the Metro stack project. It's very, very popular complete JAX-WS implementation that uses the GlassFish project. So when we get into, for example, the WS extensions and the security for SOAP web services, we'll discuss this Metro stack project, which we now call it the Metro stack suite, which is really quite attractive. WebLogic, of course, web services stack is now based on the Metro stack.

So that's the implementation of the SOAP web services using JAX-WS. We'll also take a look at the RESTful web services, which are supported by JAX-RS. And by the way, JAX-RS is not part of the Standard Edition. JAX-RS, of course, covers only the services, like I mentioned to you earlier, and it talks only on the, of course, it's used only on the server side.

On the client side, we don't have JAX-RS yet. But of course, we do have a couple of APIs that allow us to build clients to talk to the RESTful web services, and that would be the URL HTTP connection API, and also the second one is the Jersey API. And when we get there, we'll discussed that in detail.

Jersey's production quality implementation-- that is also a reference implementation. This is exactly the one that we are going to use for a RESTful web service client.

So in terms of the web services within the Java EE container, well, web services rely on HTTP communication. That would be pretty much the de facto, like I said-- the most popular type of way to, of course, represent the transport protocol for web services. And of course, there are different types of servers that we can use, and this is where we can use Tomcat server or GlassFish or WebLogic. All these are examples of containers.

So obviously some of you are using Tomcat, some of you are using WebLogic, some of you are using GlassFish, and so forth. And of course, only a Java EE full profile server supports the JAX-WS and the JAX-RS out of the box, in a sense, if you want to support everything.

Now, let me explain a little bit about this full profile versus what we call the web profile, and let me go to the board. And if I show you this diagram that I went through early, this diagram actually represents what we call a full profile, which means all the specification is included-- the full EJB specification, the full server specification, the full Java specification, and so forth.

But in many cases, you might not need the whole full profile, the whole full EJB specification. You might need only what we call an EJB Lite version, a subset version of the EJBs, which means you use only the web container part of the application server.

And of course, some of you might ask the question, how about EJBs, Joe? Now, that shouldn't be a problem because now EJBs can be included inside especially the EJB Lite version or a subset of EJBs can be included as an embedded EJB container inside the web container. This is why nowadays, we actually use EJBs inside the web container and we jar the whole enterprise application into a WAR file rather than having a whole enterprise archive file. That's a lot simpler, a lot faster, a lot easier to work with, and so forth.

So and continue with that, again, we said the Metro and the Jersey can be added to the basic web container like Tomcat to actually work with it. And chances, like some of you said, use Tomcat, so that actually why you can make, you take advantage of all these couple of projects to, of course, have your Tomcat web server of course, in this case, support web services.

Of course, web services simplify and provide that platform-neutral type of a wrapper around the business logic, and this is why we like that. Of course, like we said earlier, and I mentioned this earlier and I said, if you want, if your enterprise application needs transactions, needs security, needs multithreading, and needs concurrency and so forth, this is why I said it would be nice to actually make use of the application server. And the reason why is because your application server, which is in this case this layer here, allows you to-- through a configuration.

And nowadays, by the way, the configuration you have a choice. You can use what we call deployment descriptors, most probably you folks have had the web.xml and ejb-jar.xml, and so forth. But nowadays, even better, we don't even have to actually use the latest Java 6 technologies. We don't even have to use those deployment descriptor to configure some of these features like transactions or security or persistence.

We can actually use what else, what's new, what was introduced to replace these long XML deployment descriptors, annotations. So that's actually became quite attractive. And so now, this is actually what made the Java EE service quite attractive to build an enterprise in web services because of the fact that we can now configure all of this, and they're given to us by these services, given to us by the app server for free. It's just a matter of configuration.

That's the advantage you have. And we see, by the way, we are going to see examples where actually these annotations are quite handy to configure different features for the web services in our WebLogic application server. That's the one that we're going to use for, of course, the labs.

Moving along, going to continue with these concepts. Again, we're looking at, of course, the other question is what are the web services tools? And here, what we want to do is we want to use tools to be able to test our web services. And so testing web service, testing tools, are, of course, commonly used doing the development when we build our web services, and there are different ones. So application servers do have a mechanism by which we can test our web services, like GlassFish or WebLogic. We'll see examples about that.

In this particular course, we also give you one other tool, which is the cURL. That's a command line client type of a tool that allows you to test some of the web services. But we also use extensions in the browser. The one that we're using here is the Firefox client extension, and you folks are going to install that right at the beginning in one of the first labs that we are going to do.

And these are just a couple of just quizzes to-- we have them at the end of every chapter, and the whole idea is to just, in this case, test our knowledge once you folks have actually in this case went through the lecture. So for example here, which protocol is typically used by web services? And we give you different-- and there are some multiple choices based on what you are going to read in as answers. You will see that the HTTP is really the one that is used, and that's the hypertext transfer protocol.

Another small quiz here where it says, which of the following are common characteristics of web services? And we always give you more than one in this case answer. And by reading all of these, you will see that the a actually works well, which is a text-based data interchange format. That's why actually web services are actually quite attractive, because they're neutral interoperable. And the other one is a client accessible service description, which means the client will go ahead and access a service description, which allows, of course, it to build a web service client.

And at the end of every chapter, also we talk a little bit about some of the resources. These are just different types of links that allow you to read a little bit about web services architecture, the Metro stack, the Jersey stack, the EE 6 tutorial, and so forth. And that's pretty much what we wanted to say about the introduction to the web services and the introduction to the course.

## Introduction to Web Services: Part 3 4m

After we finished the first lecture, let's go ahead and just show you what we need to do for the practices for lecture one. This, by the way, would be by using your activity guide book. In general, when you download your eKit, what we call the eKit, which would be your books. You do have a student guide, and you do have an activity guide.

The student guide is for the lesson. It would be nice to have your student guide next to you when I teach, because then this way when I use the slides and explain some of the concepts, you could read through, for example, and, of course, take notes about what I'm discussing. That would be very helpful. And the activity guides is really to do the labs.

So for example, for after lesson one, we are going to do a practice for lesson one, which is configuring the WebLogic and the web services. That's what we're going to do. So in practice one, we're going to go ahead, and configure our WebLogic server, and, of course, on NetBeans. And then in the second one, we're going to create and deploy web services center.

We're going to deploy, in this case, we're going to open a project called Calculate Our App, and we are going to deploy it, and go through all these tasks. By the way, labs always do have an overview. It is highly advisable, by the way, ladies and gentlemen, to read the overview about the labs, and read the assumptions. Because some of the labs depend on all the labs that you guys are going to do.

And then after that, the tasks, if you follow the tasks step-by-step, and read every single task, there's no question that the labs will work properly without any problem. I also want to mention one more thing. If, for example, you have to leave at some task. After some task, let's assume you are here, and suddenly your boss calls you, or you have to step out for some time, it would be nice also to take notes that you are at this step. This way, when you come back, you're not going to skip a step. If you can skip a step, most probably the lab will not work.

So in number one, we're going to create and deploy web service sample application. This would be, by the way, a SOAP web service. And in the next exercise here, we're going to go ahead and do the same thing.

Use web service testing tools where we're going to use a web service testing client, in this case, which is the WebLogic test client. We'll also use the cURL as a command line to test web services. And then we're going to go ahead and install the rest client extension to test web services through the Firefox browser.

And so you will go through all of these steps step-by-step. These steps are very, very elaborate and vary in details so there is no way you are going to have a problem. Like I mentioned to you, the key, ladies and gentlemen, is to follow, read the steps, step-by-step, and follow them. There's no question that you will have no problem whatsoever doing the labs.

## Practice 1-1: Configuring NetBeans to Control WebLogic Server 5m

Now that we're done with lesson 1, lecturing basically lesson 1, let's take a look at the practices of this lesson 1. And we start with the first one, which is practice 1-1, and this is pretty much configuring the in this case the NetBeans to control WebLogic server. In a sense, we'll add the WebLogic server to NetBeans.

And for that, pretty much following, again, the steps that they give us here in this practice, all what we do in this case here, we go to the Services tab and then underneath the server here, we'll go ahead and right-click, click on the server and add the server. This will, of course, open a wizard window in this case that it's the Add Server Instance window. And they ask us to, of course, in this case highlight Oracle WebLogic Server.

Click Next, and then of course here, we'll go ahead and browse for the server. And following the steps in the activity guide, we'll go to the D drive. From the D drive, they want us to go to WebLogic. And from WebLogic, they want us to go to WLS. And then from it, we'll highlight WL, which is WebLogic server, and click Open.

So that's what they asked us to do. Of course, then after that, we click Next. And now we want to just double-check that the domain location is under WebLogic domain. And then of course, for the username WebLogic, they want us to put the password, which should be in this case welcome1 all lowercase-- welcome1, all lowercase.

Now, it's quite important, by the way, to make sure that this password is actually well spell-checked. If you don't spell it the right way, which is welcome1 with all lowercase with, of course, number one at the end, if you make a mistake, that of course will not allow you to run some of the applications, so you have to make sure that it's all done the right way.

And then, of course, after that, they want us to click Finish. And what happened on the left side, as you see here, we see the WebLogic, and all what they want us to do here is just right-click and start it. So the WebLogic is now starting, as you see. And so we'll get here an output that pretty much guide us and kind of tell us what's going on, while WebLogic is starting.

And of course, they also tell us that after WebLogic finishes loading, the message should be the server started in running mode, and we should be able to see that. Once we've seen that, and then we are in a good shape in this case. So let's go ahead and wait for that.

And it's almost-- so as you see here, the server started in the running mode. Now, what we could do is we can go ahead and pretty much in this case, right-click on this [INAUDIBLE] view, click on View Admin Console, and this will pretty much open the browser for us. And so we'll just wait just a little bit. It says connecting, but at some point in time, it will go ahead and connect and give us the admin console.

So here it is, and now all we need to do in this case is just use WebLogic here. As a username and password is welcome1, and then we go ahead and click on Log In. And you want to send this information? OK. And so as you see, when you click on this, and now boom. And now we've got, of course, the admin console of our WebLogic.

That's just at some point in time, you might need in some of the labs or the practices, you might need to get into this area-- of course, in this case the WebLogic admin console-- and we'll tell you when, in this case. And that pretty much ends the in this case practice 1-1 of lesson 1. Thank you.

## Practice 1-2: Creating and Deploying Web Service Sample Applications 14m

OK. Let's go ahead and take a look now at practice 1.2 of lesson one. And here we're going to create and deploy a web service sample application. So again, following the steps in the activity guide in this practice. They want us to start in these. And then want us to open the calculator app. So let's go ahead and do that.

And then the file. We say Open Project. And then, of course, that will lead us to the D drive. And then from the D drive we go ahead and look at the labs. And then in the labs they want us to, in this case, open the exercises.

And then my lab 01, and of course open the first one, which is the calculator app. So we highlight this and click Open Project. Cause it's going to take some time, so take a look at the scanning here. It's just the way NetBeans opens the project at the beginning. It scans all the fines and all the libraries and so forth, related to this lab. That's why it's taking a little bit of time.

So give it a little bit of time until it all opens. And then after that you're good. OK. And so we're just waiting a little bit. And boom. Now, of course, it is almost fully deployed.

So wait typically a little bit until this scanning here-- until, of course, it vanishes. And you do not see it anymore. Now that is done, they want us to right click. And, of course, in this case, and deploy the application.

So right click and select Deploy. This will go ahead and deploy the application. OK. So we're just waiting a little bit just to see that the application is deployed.

It's going to take what it's going to take. And of course at the end, when it's deployed, you will see in green that it's of course successfully done. And so that's what we're doing right now. And again, with these labs, typically it takes a little bit of time, because it's an Enterprise application. So give it some time to, of course, do its right thing. And going to deploy the applications and starts the application, and so forth.

And as you see, it's done. Now it's been successful. And it's all done.

And to find out that your application is actually deployed, you click on the Services tab. And then you open. You need to click on this A plus next to the app server. And then you open applications. And because it's a war file. And the reason why it's a war file is also the icon, which is this blue globe that you see here, or sphere.

And then if you click on Web Applications, you see that it's deployed. And that's pretty much it. If you of course want to undeploy, you just right click and click on Deploy, and that will get undeployed. But of course right now, we do not want to do this.

After that what they want us to do is they want us now to open Firefox. And then they want us to copy this link that you see here.

So if we just I mean, we can do it in a couple ways. We can do it this way, where in this case, going back to our application. It would be nice, by the way, in this case to just open your student guide in here on your desktop of the machine they give you.

And so this is, of course, another way to also see the practice. So we're right now doing practice 1.2. And they want us to take this link here, as you see. And you can copy. And let me highlight this here. And then, of course, copy it.

And then open it in Firefox. I already opened Firefox earlier. So I'll just go ahead and paste it here. And then, of course, don't forget, I just copied the dot with it. So I should not be doing that.

And then, of course, this, as you see, was the file. So this was the file that we have in this case for the application. Was the file always starts with the definition tag, root tag, and finishes with the definition root tag.

And then, of course, after that it has the types, which are represented here. And then the messages and the port type, which is typically mapped to the class, or the interface in Java. And then you have the binding.

We get to take a look at these. That was the file. Here's the service and the port, and so forth. We get to see this, of course, later on in the different lectures.

So let me minimize this guy here. And then after that, of course, open in this case my NetBeans. And what they want us to do right now is open the second project, which is in this case a calculator client app. That's what they want us to do. That would be in step 5. That's what they want us to. So I'll go ahead and open it.

So again, it's going to take what it's going to take to of course open. So there would be a scan in this case to just open that. So here they want us to right click and clean and build this.

So let's go ahead and do that. So it's gonna pass the WSDL with the file. And that's the first thing they want us to do. So obviously, as you see here, those red button is not there anymore.

And then after we clean it and build it, in that case, just to make sure that you know, it's all cleared and built, then they want us to, of course, right click this project and run it. It's going to right click this project and run it. And of course when it runs, it's going to, of course, open in a browser.

So that's what they want us-- or open a browser and of course, write it down. So as you see here, it's in the second tab that it says connecting here. And the first tab is the WebLogic admin that we've done that we opened earlier in the practice 1.1. See now we have it.

As you see, we can go ahead and try these. Pretty much any couple of values. Like, 2 plus 2 is 4. You can choose anything you want over there.

So this is just to kind of give you an idea about how all of that works in this case. And of course, this is pretty much-- now after that they want us to-- let me minimize this guy here. And go back. They want us to go to the services and open the applications. And then they want us to undeploy the calculator app.

So we go ahead and undeploy the calculator app. So it's going to be undeployed. And then after that, what they want us to do is to try to run the calculator app again.

And of course, we should be able to guess, you should get an error in here in case with the error 500. Let's go ahead and do that, just so you can see that.

And if we run it, so it's connecting. And soon it's going to show us the result, which, by the way, would be an error, because of course the application is not deployed. Because I just undeployed it.

Let's take a look at that. And we'll see that in this case-- so let me just double check here that it's actually undeployed by opening the NetBeans, go into the services, and making sure that it's-- so yeah, obviously it's going to take some time to undeploy. But once it's undeployed, if you run it, it should give you a 500 error.

We can also, by the way, in this case, just copy this link. Or I can click on this link directly. And this will take me to, in this case, the tab. Let me just close this guy here. Close all the tabs. And then do it again.

And it's obviously giving me-- so if I click on this, it will give me an error 500. So that obviously shows that the application is undeployed. And the client app, obviously, in this case could not find the application.

So that's pretty much what they want us to do in this. And then let's continue with this practice. Of course the next thing they want us to do with this case, you can just go back to NetBeans. And this time they want us to open another project. And this project is called Hello Rest.

So this is open a project. That would be the third one. Hello World. Which is really a RESTful web service. We'll get to talk about RESTful web services anyway.

And so obviously a RESTful web services are also quite interesting. And we get to learn about them later on in the lessons of this particular course. So if I right click on this guy here, so I pretty much open this project. And then of course, right now what they want us to do is right click on this project and select Run.

When we select Run, it's going to go ahead, of course, in this case, deploy and run it. And let's take a look at that. And then it's going to open a browser. And it's going to call of course, in this case, the web application definition language.

So it's going to just take a little bit of time. In the meanwhile, let me just click on NetBeans and just show you that the application is actually deployed in WebLogic by clicking on web application. And here's my Hello World that is already deployed.

Of course now the next thing that we want to take a look in this case is the browser. And let's take a look at this browser. And we see that pretty much here's my, in this case, my browser.

And if I now put down, for example, any name, for example, Tom. And then hit Send. That of course in this case says the text change was successfully was done.

Now what they want us to do in this case, and just going back in this case to the PDF file. And that would be the next in this case links. If I click on this link, this will get me the WADL file. So I'll click Allow Here.

And then of course let me go ahead and-- or I just copy the link. Let me go ahead and copy the link too, and put it inside the Firefox. Let me go ahead and do that.

And so here's my link, copy. And then let me go ahead and open Firefox. And of course paste it. And then hit Return. And hit Return. Of course, and that gives me the web application and efficient language for RESTful web services. We talk about these when we get into web services.

So the tag here is MS zero in the application. That would be the root tag. And then of course you have a bunch of other tags that are presenting in this case the resource, the grammar, the response, the presentation, and so forth.

And that's pretty much what they want us to do for this practice 1.2. Thank you.

## Practice 1-3: Web Service Testing 6m

Let's go ahead and look at practice 1-3 of the lesson one, which is the Web Service Testing. In this case, what we want to do is we want to use a WebLogic test client. And then we're going to run some URL commands. And of course, use the Firefox REST client extension. And we'll set it up, of course.

So the first thing is they want us to set up Favorites. So again, to create your Favorites, you just, under Windows, click on Favorites, and that will go ahead and get you this Favorite. Let me go ahead and close this one here. And when you click on Favorites, here it opens it.

But then again, when it opens it, you will see a Home, so you right-click on the Home and say remove. And then you right-click and then add your Favorite, which in this case, we want it to be Labs. This way, we give you the opportunity to see the Labs. And even check on the solutions-- some of the solution, if you want to check them against the code that you write.

And of course, that's pretty much what they want us to start doing. And then after that, they want us to test the WebLogic, in this case, in the calculator test. So they want you to open the WebLogic, rather the web service folder here under the project. Right-click, and of course, click and call test web service client.

This, of course, is going to open a window similar to what you see right now here. Of course, I had this earlier opened, and that's why you see it right now in here. So if I can go ahead and add now, five to-- so this is the second one that I just read.

So let me go ahead and add 4 and 3/4, just as an example. And then I click Add. And that, of course, should add them. And here it gives you the request, the SOAP request. And then also it gives you the SOAP response, which is the addition of 4 plus 3, which is 7. That's the WebLogic tester.

And then, of course, after that, they want us to run some URL commands. So this would be from a command line. And for example, I run this here [INAUDIBLE] content type. Explain and then locate calling the Hello World. And I get the answer here, which pretty much is Hello TOM. Remember when I run earlier the application, I entered TOM. And that's why it says Hello TOM. With a capital O-- T-O-M.

And then after that, they want us to install the web service RESTful client extension. This is, again, to [INAUDIBLE]. This is quite easy, by the way. All what I have done in this case is I went under Resources, and I drag this on the Firefox. And then I click Install, and then it says Restart, and then you would see this here.

And then of course, you see the extension, the Firefox extension, which are represented by these red type of a square. And of course, after that, they want us to do some testing here. So the first one that they want to test, the Hello World RESTful web service client.

And this, I've done this here just by entering the URL that they gave you. And then the GET and then click on Send. And then, of course, this will-- if you click on Send, that gives you the answer. Of course, here's a response body.

But then, of course, later on, they want you to customize the header by, in this case, using Accept, and of course, it should be a text plain and click OK. And then if you send it again, you are going to have a plain text, which is TOM. That's what you see. And there's of course, the header is 200 OK, which is all good.

And then after that, they want you to use an example of a post. I've done this here. And so we changed the post and put the content type to be text HTML. And then they want you to copy and paste, in this case, the body, which is this one here.

And then of course, when you click Send, that, of course, will give you a-- send that so the responses to, again, the header is 200 OK, which is good. And then pretty much the response would be this one here, which is, in this case, the addition of a-- if you take a look here at the request. In this case, it would be passing three and two, which, by the way, will give you an answer to be filed, because it's a calculator app and it adds the two integers. And that's pretty much what they want us to do in this Practice 1-3. Thank you.

## Skill Check: Introduction to Web Services - Score 80% or higher to pass

Skill Check: Introduction to Web Services

View Skill Check
