# 8: Bottom-Up JAX-WS Web Services

   * Bottom-Up JAX-WS Web Services, Part 1 - 24m
   * Bottom-Up JAX-WS Web Services, Part 2 - 17m
   * Bottom-Up JAX-WS Web Services, Part 3 - 12m
   * Bottom-Up JAX-WS Web Services, Part 4 - 6m
   * Practice 8-1: Creating the Card Game Service - 11m
   * Practice 8-2: Publishing Endpoints Without an Application Server - 3m
   * Skill Check: Bottom-Up JAX-WS Web Services - Score 80% or higher to pass

## Bottom-Up JAX-WS Web Services, Part 1 - 24m

So good morning, everybody. Welcome back. And let's go ahead now and get into building web services. So before that, we're going to start with the bottom up JAX-WS web services. But before that, we just want to take a look at what we have done so far.

So we went through the concept of web services. We discussed a little bit these XML files, which was probably many of you are familiar with. It could be a review. It could be some of you maybe have not seen some of the features, then get a chance to see them. And then after that, we looked at these JAXB API that allow us to move from, again, a marshal and unmarshal XML data. And then we said these JAXB really used underneath the JAX-WS and the JAX-RS API.

And then after that, we went ahead and introduced the JAX-WS web services. And these JAX-WS web services, we said that pretty much we do have some specifications. Particularly, we discussed the SOAP specification. And we saw how this SOAP message that is made with a bunch of layers, one on the top, kind of like an onion, and that's what we said this could be an issue when building a SOAP message, when passing a SOAP message, when securing a SOAP message, which we'll talk tomorrow.

And we looked at WSDL file. It turned out that WSDL file helped describe the web service that you're exposing to the web service client. And we discussed that these WSDL flies start with the definitions as the root tag. And then after that, we have the types that specify the type of data that you're working with. Lots of times, it's represented through a XML schema.

And then after that, we got into the message. We said the message tag elements specify which information, the actual information that you're working with. And we know that in terms of the information for the messages, it would be either an input message, and that would be the argument pass through the operation, or the output message, which are, again, coming back to return from the operation. Or it could be a fault message, which we'll discuss tomorrow morning. We still did not discuss the errors and how to handle errors in SOAP and REST yet. That would be a lesson that we'll start with tomorrow morning.

And then after that, you have the port type, which is mapped to the Java class. So the port type is always mapped to your Java class that you have in your business tier or Java interface. And the port type is always an aggregation of a bunch of operations. And the operations themselves are associated with an input, a message, an output message, and a fault, if for example, the operations are always in an exception.

And then after that, we looked at the bindings. And if you remember, the binding tells us about the transport protocol and also the SOAP specification, which is, again, documented literal, RPC/literal, and so forth. We've seen that. And then we have the service stack that represents the port and the service location.

And then when we kind of looked at all the definitions and then the specification of this WSDL file. In SOAP, we said by the way, this SOAP and WSDL file are not enough to actually perform or handle what we call it a pure, complete interoperability of messages. We said we need some help.

And the help actually came from the metro stack, if you remember. And we called those extensions, WS extensions. That all sit underneath the WS policies. And we've seen one of them in the lab, that WS-MakeConnection that allow a client to pull a response, rather than you create a persistence, a continuous type of connection. And so we know that those extensions are very helpful, and we'll make use of them when we talk about the WS policy when we talk about security tomorrow.

So and then once we finish that, we said OK. Now, it would be nice to build a JAX-WS client. So we started with a JAX-WS client. And if you remember, there are a couple of ways to actually build that JAX-WS client. One is using the WS import by just feeding the WSDL file to the engine, and the whole thing is generated for you. You folks have gone through a bunch of labs for that.

And then we also looked at how about if I now want to use my JAX-WS web service and talk to a web service that is nonstandard, that has SOAP messages that are non-standard. So that's where we said it would be nice to use the dispatch API, the dispatch client. And where you're going to get into the SOAP part, the SOAP envelope, the SOAP body, the SOAP header, and you can add anything you want. So you pretty much build your SOAP message by hand. And that's kind of a way, if you want, similar to that JAX RPC implementation that we've done a while ago.

Once we've finished with that, we said OK. So so far, what we have done is we've built a JAX-WS client, and then we got into the concept of RESTful web services. It turns out that these RESTful web services are quite useful because they improve performance, and they're quite simple to work with. And also, one of the biggest advantages of using RESTful web services is that they represent nothing but what? Resources. And then the second is we leverage. They make use of the HTTP API, which we're quite familiar with-- the do, the get, the post, the put, and the delete, and so forth.

So first of all, we introduce these RESTful web services, which they stand for representation and a state transfer. And they represent only a bunch of resources. And we also said that they rely on the concept of hyperlinking, where hyperlinking allow you to actually handle what we call a progressive disclosure of information by getting the main link, and then from there, you can dig down and get to any resources that you're looking for.

And we said also when we actually use this RESTful web services, if we want to use an action, which is in this case a verb, all what we need to do is nounify that verb, which once we nounify it, it will be represented just as a resource. And then when it gets into the web service, it will be handled by the web service itself.

And today in the afternoon, we are going to actually look at how we build that RESTful web service. What are the configurations that we need to use as annotations on the class, so that the class will behave as a RESTful web service? We have a couple of ways actually to do that in the afternoon, and we'll cover all of that in the afternoon.

And then once we kind of went through the concept of these RESTful web services, we also looked at the different status codes that actually a RESTful web service use, which are the status code of HTTP, the 400, the 100s, information, the 200, success, the 300 direction, or the 400 client problem, the 500s, which is a server problem, and so forth.

And then after we've done with that, and we introduce this RESTful web service, we said let's go ahead and build a RESTful web service client. So when we started building RESTful web service client, we found outside that the JAX-RS is supported only on the server side, but not on the client side.

But we have a couple of ways to build this RESTful web service. One is using the typical URL connection of Java, or the HTTP URL connection. And we saw a couple of examples over there. What we did not like, the way we build those Java-based, if you want, or URL connection Java-based web service, or RESTful web service clients is that you have to know about the whole structure of HTTP. You also have to know a little bit above the I/O, the low level I/O programming API, and so forth.

Then we went into the new way to actually represent that web service client, which is slightly different, and that's using the Jersey API. The Jersey API allows us to work with a couple of components, if you remember. One is the client, and the other one is the web resource.

The client acts as a factory to build a web resource. And then we saw how we can write all of that in the code. And then once we get the web resource, we use the method chaining to actually handle our request. And so it turned out we've seen examples where you're just getting some data, or you're passing a parameter and getting some data, or you're passing a form parameter and getting some data.

We also have seen how we can return a client responds, and then from there, we can get the load. We can get the status. We can get the status code, and so forth.

So that was what we have done. So so far, what we did is we built a JAX-WS client and JAX-RS client. Today, we're going to build the web service. And we're going to start by building the JAX-WS web service. And when we build the JAX-WS web service, then we have a couple of ways to do that, because JAX-WS is supported on both sides, on the client side and on the service side.

Now, in this diagram that I have here, and I just drew this morning before the class, what I have done is I've just drawn a diagram that represents my application server. Imagine that I do have an existing enterprise application. And now, I want to do business with a partner. So I did blow up this bigger, but this one here should be big too. It's another partners that they have their own application, and so forth. What we want to do now is we want out now expose our existing application as a web service to our clients. That's the idea behind this.

So what we want to do is take out our business components, and these business components have their methods over here, and we want to expose those methods as what? Operations, web service operations to the client. That what we want to do. So that is called bottom up.

Why? Because I have an existing application, which already exists. All what I want to do now is configure my component, my business components, so that they are exposed as a web service to the client, which means I'm going to start with Java classes, and then from it, I'll do some configuration. That's the JAX-WS configuration. Most of it is through annotation. And then from it, I'll will generate the WSDL file, which I give to the client, which I give to the client, so that the client will go ahead.

So in a sense, this is my service. I already have an existing business application. And I want to go ahead and configure the business components that I want expose as a web service to my web service client, configure those. And then when I deploy the application, I will go ahead and generate a WSDL file-- it will be generated for me by the app server-- and then give that to the client, so which means we separate these into a couple of lessons.

One is what we call bottom up, where we start from Java and generate the WSDL file. And the second one is once you have that WSDL file, give it to the client to, again, create a web service client. And that is called the top down. These are the couple of lessons that we are going to tackle right now.

Of course, even when we build all of this, sometimes there is the concept of customization. My partner wants to call this method ABC, rather than XYZ. So can I have a mechanism by which I can handle that? Or maybe I want to customize the Namespace. Or maybe I want to-- and so forth, or maybe I want to-- so we'll take a look at all of that.

So that's what we are going to look at. We're going to look at starting from an existing application and configuring it, so that I can expose it as a web service, which in general, like in your organization, you have all of these organizations that want to interact with each other. Like in the concept of law enforcement, you have different type of law enforcement agencies from one state to another state, also at the federal level, and all of these agencies all have to talk to each other.

Or it could be an e-commerce SAML application. And for example, in the pharmaceutics it could be CVS pharmacy interacting with their partners, or Walgreen's pharmacy interacting with their partners. Or it could be even a Target interacting with their partners, or a Walmart interacting with the Targets, or Oracle interacting with their partners, and so forth. So let's go ahead and take a look at that.

And for that, we're going to start by doing the bottom up web services. So here, we're going to describe the benefits of Code First Design. We're going to look at creating a JAX-WS POJO endpoints, and of course, JAX-WS EJB endpoint. We have a choice, again, in this case.

So the whole idea behind this, ladies and gentlemen, is that we have that JAX-WS development approach, which allow us to generate the web service artifacts using the information contained in the WSDL file-- that's called the top down-- or create a service endpoint of a value classes as Java source files, and then use them as input to generate the associated WSDL file and other portable artifacts. So in both cases, pretty much we do have this JAX-WS infrastructure that will generate all the artifacts for us.

In either case, like we said, that JAX-WS generates the majority infrastructure of the code. And we've seen an example over there before. So now in this lesson, we're going to start from an existing application, and we're going to code all of this and configure that, and then JAR that into a WAR file or a JAR file. In our case, you're going to do a WAR file.

The reason why in your labs you are using with WAR files, if you take a look here, all of these are WAR files. And under the file system, once you build an application, and let me just show you an example, one that I actually-- so under the distribution here, I see my WAR file. And this is the WAR file that I actually am going to deploy.

And the reason why we do that is we are using what we call a web profile. And let me explain this a little bit. I do have a diagram that actually can share with you here. So I have this enterprise application, and I use a full profile. If I use a full profile, that means I use an EJB container and a web container. In many cases, for example, in your case, you have a web server that you're using. If you have a web service, and you want a web server, and you want to make use of EJBs, the light part of EJBs, the light part of it means that you can use status session bean, stateful session bean, singleton session bean. and just so it's just a light part of it, not the full-blown EJB profile.

Then you can make use of an embedded-- so here's your web server-- and you can make use of an embedded EJB container. That actually is now available starting JAVA EE6. If your web server is Java EE6 compliant, then you can create EJBs in the WAR file. And then you can make [INAUDIBLE] servlets, or JSBs, or JSF components, or some Java beans, or managed beans for components, a bunch of helper classes, and so forth. You bundle all of these gentlemen into a WAR file, and then you deploy. So you do not need an enterprise archive to deploy that. A WAR file is good enough.

And by the way, this is exactly how you can create. So as an example, I right click here and say new. And then I can go ahead and I have a choice here to select a session bean. And then from there, I can create a status session bean, a stateful session bean, a singleton session bean, anything I want.

Here, it's complaining about the package. I can go ahead and say here's my package. And then I could say stateless session bean with a local interface, a home interface, a remote interface, or I don't need any one of them. I can actually, in Java EE6 EJB 3.1, I can create a session bean with no interface, so it behaves exactly like a POJO, like a Java bean.

So it's just a special Java bean because it gets services from the container. The container manages its life cycle. It gives it security. It gives it transaction. It gives it persistence. It gives it naming services. It gives it concurrency, and so forth. All of that can be done automatically through configuration.

So what you have been doing in the labs, you have been using what we call the web profile, just the web application, which is quite light. It's not bad, actually, as a mechanism. It's just to simplify your enterprise application. That's the idea behind this.

Let's go on and continue with our lesson. So what are the benefits of the bottom up approach? So when you provide a web service interface to an existing enterprise application-- that's the idea-- you have an existing enterprise application, and that's exactly what I showed you here in my diagram on the board. I have an existing enterprise application, which clients have been already using it. These clients are what? Either the thin client, the browser based client, and by the way, that browser base could be on a laptop, on a tablet, on a smartphone, and so forth. And then it has it could be an EIS system, talking to your system through, for example, JMS, through asynchronous communication, or through a connector, communication, and so forth.

So that is all ready established. We already have an existing application. What we want to do now is we want to expose this as what? As a web service interface. That's the idea behind this.

And the question why would we want to do that? Because we said that the RMI-IIOP, you remember the first day we said this is, again, expensive. On the other hand, when you run XML or when you pass XML over HTTP, that's quite inexpensive. Plus in addition, it is what? Fully interoperable, which means I can be using different programming language, and I can interact a dot net system, or another type of, let's say, mainframe, and so forth, and I can interact with them.

It could be a mainframe written in COBOL. There are lots and lots of applications where they have been written in COBOL, and to refactor those in Java is going to cost a lot of money. But we saw this still work. But we want to expose them as web services. Or what we do is set up the web service infrastructure, and we can talk to each other. That's the idea behind this.

So the benefits of the bottom up here is you can actually use the quickest. It's pretty much the quickest development, because all what I'm going to do is configure the class to be a web service. That's all I want to do. It's a natural approach. That's good. You can map existing domain models directly to the WSDL file on the fly. And you to reuse the service side as a mediator to the domain logic to all the types of application clients. That's, again, that's exactly what I want to show you here in these diagram.

I already have a client that could be a thin client. I already have a client that could be an outside system, using connector API or using the asynchronous communication. That's not a problem. I could have this same client. When I say thin clients, this could be a Java ME client, Java Micro Edition client, which is a smartphone, or a tablet, and so forth. And so I do already have these client.

My business logic is sitting here in this status session bean, which plays the role of a facade. What I want to do is want to expose, create, expose my component as a web service, so that web service clients can actually also make the call. But the key here is that the business logic is still here, so that all the clients can access it, other client than a web service client. That's the idea behind this.

So that's why we came up with this idea. So here, what we want to do is we want to take an existing application and configure it. We're going to see this new concept called the @WebService annotation. And we apply that on your POJO implementation, or your stateless session bean, or your servlet-based, and so forth. And that because you could be servlet-based, like a JAX-WS servlet, here, could be a stateless session bean JAX-WS here, or a singleton session bean, or it could be simple POJO, just a regular JAVA class. So that we know.

And then we package that, and we deploy it. The minute we deploy, that is going to do what? It's going spill for us, spill out for us the WSDL file. That's the idea behind this. This is the beauty about JAX-WS, ladies and gentlemen, is that everything is done for us, and we're not going to worry about writing that WSDL file.

## Bottom-Up JAX-WS Web Services, Part 2 - 17m

 
Well, you know again, here, starting with Java, from again, starting from a Java class, we pretty much like I mentioned earlier, you just go ahead and annotate your POJO, or your session bean, or your, again, service-base type of an area. In this case, it could be a Handler classes. And then you package all of that into WAR file or an ear file. We've been doing using the WAR files in our labs. And then we deploy that, and that's basically was the file.

And in this bottom up, which is JAVA to WSDL, the Java to WSDL mapping, it's still pretty much straightforward, where from the WSDL file, you can specify the type, specify what the type of data that you're working with. These were the JAX. We will handle that for you on the fly underneath the hood. You have your Java objects that representing the input parameters and the output parameter from the operations, and so forth.

We know that the port type from the WSDL [? side ?] maps to the service endpoint implementation class, which represents the web service. And we know that every single port type has a bunch of operations. That operation is mapped directly to what? To the method in Java. So that, of course, we discussed that. And now, we're just showing you a diagram representing that.

And by the way, even for the SOAP message, SOAP to Java also is quite mapped also, where you have your envelope. You do have your class, which represents OrderManager. And then in it, you do have, for example, an OrderManager class, which is annotated with @WebService, representing the web service. And then in it, it has a method submitOrder, which exists now inside the body of your SOAP message.

And then it takes an order, and that order is, in this case, represented by the data here, which later on, when it's JAXB and marshalled, it becomes nothing but an object representing that order in Java. That's what it is. So again, the concept is really straightforward.

So here's an example. Let's go ahead and take a look at this class. This is a simple class, which is under com.example.standalone type of a package, and it's called AirportManager. And it has a method called addAirport, a code and then airport name. You remember how we've seen that yesterday when we were talking about building the JAX-WS client. So now, we can see some code from the server side, server side, and then which invokes an instance of a DAO.

So the idea here is I'm passing, and let me just explain here. So I have my web service client that I built yesterday, the JAX-WS web service client, which by the way calls the web service. Here, I'm just using a web service broker. That will go ahead and call my session bean, my stateless session bean. And that gets an instance of a DAO and passes again to it the code and the name of the airport, and inserts that in the database. And then, also, that returns an integer representing the ID of that airport.

So you see how I invoke the add method on the DAO. This add method is implemented in the DAO to talk to the database using JDBC or a domain store using JPA. And then I'll go ahead and create an instance of the airport DAO, and then make use of it here to insert the code and the name, which gets me the ID that would return back. That's what I'm doing.

So what I want to do now, I do have an existing business component that I see here, which is an AirportManager. I want to do now is I want to expose this R web service. To expose this as a JAX-WS web service, here's what I do. All what I do is just use this, annotation. This annotation is enough to tell me that this class now play the role of a JAX-WS web service.

And the next thing is take a look a little bit at the life cycle. So a service implementation must be stateless object. That's why we have it as a stateless session bean or a singleton session bean. Stateless session beans are not qualified for a service. Service implementation bean must not save any client-specific state across method calls. And a container may use any instance to service the request, including a new bean instance or using an existing one.

Again, we can use the @PostConstruct and @PreDestroy annotation if it's an EJB, for example. Anybody knows about @PostConstruct and @PreDestroy? Anybody knows about that? Let me just tell you a little bit in a nutshell what this means.

When you make use of EJBs, let's assume that this is a stateless session bean. If it's a stateless session bean, that means it's pooled, which means it is multi-threaded, which means it can service more than one client. And so we actually in the life cycle of a session bean, when the app server-- because when you have these session beans, folks, you never use the new keyword to create an instance. The app server will create that for you automatically when it's needed. And lots of times, it uses the eager implementation, which means it will create the instances for you on the fly before the client will start connecting. So that's the eager initialization.

And inside the bean, you can write the method. You can actually create a method. And you annotate that method with @PostConstruct. I can call it initialize, for example, just as a choice. And inside the initialize method, I'll go ahead and acquire maybe a connection from the pool to the database. I acquire what we call resources for the bean to do its job.

So the minute that an instance is created, that method is called by the container. It has nothing to do with a client, so that the resources are available to the bean to do its job. But you know, these beans once they are inside over there, once they finish their job, if it's a stateless session bean, the contenders should return that back to the pool. If it's a stateful session bean, it should again-- we don't use that in web services-- it should actually be destroyed by the bean. Otherwise you'll have a lot of object inside the memory. So what happened is the container has to garbage collect that through the garbage collector.

That's why we create another method. We can call it release resources. And we annotate it with @PreDestroy. And what it does over there, you actually over there, you return. You close the connection. You do all of that. So this way, before the app server destroys the bean, all the resources are released, so that another bean can use them. And then the bean is destroyed.

These are the @PostConstruct and the @PreDestroy. We call them callback methods, because they're called by the container. You just tell the container what to do, and the container will go ahead and execute that. This is the advantage of using EE Enterprise Edition.

All right, moving along and continuing with our lesson, now, what are the requirements of the JAX-WS? Well, the requirements on the Java class are it must be annotated with [INAUDIBLE] web service, which is javax.ws.webservice. It cannot be final. We know that it cannot be declared final, because final means what? It cannot be extended. And it cannot be abstract, because an abstract class cannot be instantiated.

Must have a default public no-argument constructor, so that the container create an instance for you, and must not have finalize method. Let the app server garbage collect that for you. Do not interfere in the way it is garbage collecting. You know what I mean? Let the container handle that for you. That's the idea behind this.

So in terms of how to access these web services, the concepts is pretty much quite simple. There's a default URL for web service, which is based on the class name of the service. For example, if you have a POJO, you will access it through the host, the port number, the application. There would be, for example, the WAR file, the class name, and the service. And that's it. Use the @WebService to specify the path, how to connect to it. If it's an EJB, be pretty much quite similar, also. You have the class name, and the port class name, and the path, how to call that component.

In terms of the JAX-WS requirements, there are requirements on the web service methods. Ah, let's see that. If you have a class, and you want your methods to be exposed, they must be public. Any method that is public inside the class is automatically exposed by default. Every public method in the class will be part of the web service.

But we can actually have a web service component, and we can say you know what? I have this EJB here, or this Java bean, and I want to expose this as a web service. It has a bunch of methods. In those method, it has six methods. Four of them are OK for me to expose them to the client. Two of them are internal to me. They are internal to my business logic. I don't want the client to see them. I don't want the client to actually access them.

So how do we go by avoiding to expose some of these methods to the outside world? Easy, all what we need to do, methods that you want to exclude as a web service using as a web service method, all what you do is just use on those methods @WebMethod. Just annotate them with @WebMethod and exclude here set to true. The minute you do that-- boom-- that method is not going to be exposed as a web service. So this actually is a huge flexibility. So that's the idea behind this.

So for example, in your application, chances that you have some business logic inside that has a method does something. But then you don't want that to be exposed. And this is just for national security something. For example, if a local law enforcement agency is trying to access the federal one, and the federal one can expose some information, but it does not expose other ones, simply because that's national type of security, and we don't want to expose that.

This is, again, in the case of a law enforcement application. Or it could be an e-commerce [INAUDIBLE] application. I do have a bunch of methods that actually allow me to compute something internal to the company that I don't want the client to actually see.

Again, these methods must again not to be static, because as you know, static methods, they are called only on the class. And they must not be final. Make sense, again, you can overwrite them. And then must be JAXB compatible. Why JAXB compatible? Because JAXB does what? Is the one that actually marshal and marshal the data. Remember, it's used underneath the hood by JAX-WS.

All right, moving along, continuing with that, you will go ahead and generate with the WSDL file. The WSDL file description again and supporting files to publish the service endpoint [INAUDIBLE]. There must be a WSDL file per service, and a JAXB classes for every message. Again, JAX-WS can deliver WSDL and message classes dynamically, just by specifying, again, you can get the WSDL file through the URL.

Updating a WSDL from running service is preferred. If you, for example, need to generate the WSDL file without running the service endpoint, you can go ahead and use this annotation processor, and this can be also used. Just to let you know, the annotation processor tool and the wsgen were deprecated starting Java SE7.

Ah, let me just show you an example here, just to give you an idea about the SOAP message. Let's take a look at this example, here, that actually would be in the next page. Let me go ahead and take a look at that in the next page. Ah, let's take a look now at this example. Here, just to let you know, folks, and most probably some of you know about that, the WSDL file for JAX-WS does not support the overloaded methods. So web services require unique names for every single method.

So if we knew our application, let's assume that here I have a better airport, which has a method called removeAirport by ID, and as you see here, I have another one, removeAirport by code. So both of these are overloaded methods. Why? Because a signature is different of the methods. One takes an ID, a long integer, and the other one takes a string. But they have the same name.

JAX-WS does not support that, so we need to have unique names. That's why you need to do what? Annotate these and specify the operation name. So for example, here, this I'm going to call it removeById, which means when the WSDL find is generated, it's going to have that name.

And then this one here, I'm going to call it removeByCode. So if I do this, once I generate the WSDL file, then you will see now that the operation here is called the removeById, and this operation is called removeByCode. So overloaded operation, this is how they're handled.

And of course, every method has its own input and output. Here, as you see, ladies and gentlemen, we don't see fault yet. Tomorrow, we'll see the example of the fault, because remember I said an operation can be associated with three type of messages, input, output, and a fault.

Ah, we actually have a way to customize some of the features in the WSDL file. For example, the custom WSDL file description, you have a default XML name, Namespace, which is typically given to you. If you represent your package in Java, that is com.example.security.server, this will be produced inside the WSDL file as what? HTTP://sever. security.example.com.

Sometimes, you do not want this. You want to customize this. That can be done. We can go ahead and do this this way. If I wanted to customize the XML Namespace, all what I need to do on my class here, that I have here, when I annotate with @WebService, inside the parentheses, I just specify the targetNamespace. And I say when my WSDL file will be generated, I want the targetNamespace to be what? urn://com.example.managerNS. So if I do this, I'll produce this one here.

## Bottom-Up JAX-WS Web Services, Part 3 - 12m

And then of course, here's how we do it in this case for if you want to customize the target name space. Or what you do, you have your class, and you want to annotate with @webservice to expose it as a web service. You just add between parentheses the targetNameSpace, and then in this case the namespace that you want. And here it happens that we want it, in this case, urn://com.example.managerMS. And that's exactly what is produced in the WSDL file.

And by the way, in addition, just for completeness, you can also, by the way, in this case customize the web service, for example, the port name or the port-- in this case, the port type name on the port name. That also pretty much follows the same concept.

You can, by the way, also in this case customize the parameter names. By the way, in the WSDL file, when you use parameters of operations, always these parameter names always have the names arg0, arg1, and so forth. That's the default naming.

When you look at this, many people say well, you know, arg0, arg1 does not give me much information about which method I'm working with. So for example, here you have your complex type, get message. The sequence is arg0, which happens to be a string.

Arg0, OK, tells me it's an argument in this case, but that's not enough. I really want it to use the exact name that of course follows the semantics of my business logic. That's why it would be nice to actually modify the element names by using the @webparam.

Here's an example where I have get message method, in this case, and I use the @webparam, and I specify the name of the message in this case as well. Message, and then of course that would be, by using this inside, and then of course that would be on my message. So I have to use this annotation applied to my, in this case, message. And then, of course, after that what happened is you will find the name, instead of arg0, is going to be what? Message. That's the idea behind this.

So if you use @webparam, it will actually allow you to, in this case, get the name of arg0. And by the way, this is very useful in debugging. Because sometimes in debugging, you see arg0 and say what is this. But if you see message, you say ah, I know what it's coming from.

And we, like I mentioned, and so like I mentioned, by the way, in the web service context, this web service, like every single other component, like servlet has a context and EJB has a context, session context, MDB context, and a servlet context and so forth, the web services do have context, too. And this context is very, very useful. We'll actually make use of that in security.

So it allows an endpoint to access context and security information, and so forth. So the way you get an instant of the web service context is very easy. You just use the @resource. @resource here, when you use the @resource annotation, you're asking the container hey, inject for me please an instance of the web service context. And again, in the method of the endpoint, you can go ahead and use the-- you guys heard of the default each loop, in order to enhance for loop. So here I just used the key set on the context to get the set of [INAUDIBLE] for each one of them. And then I'll go ahead and pass the key to the get method on the context, because the context has-- it's an associative type of a collection. It has key value, key value, key value, and so forth.

So by using the key, I get the object. And then I can do anything I want with the object. Here, I'm just printing it out.

So a context is an associated array or collection that has that made of key value pair. That's what it is. All right.

Moving along and continuing with the web service, so here's an example where in this case, I have a simple standalone server. Just to let you know, the JVM, starting JVM SE6, you actually have a standalone server over there. You can make use of it. The only thing that we let you know or we tell you folks here is that you can use these standalone servers, but it's only for testing a proof of concept. This is not a production quality type of server. So remember that.

And we just give it to you here just to let you know because sometimes, by the way, here nowadays it's really quite easy. Why? Because you can download NetBeans with the web server attached, or the [INAUDIBLE] server. And you can do your coding and all that. But in some applications, you might not have a server available. And you say you know what, I built this proof of concept, I just want to test it. So you can actually use these.

So here is pretty much, we used this as an example in the airport manager. It has a main method. We have the URL, which is local host 8080 airport manager. And then of course here we specify the URL read from, again, the arg1 in this case. And then we create a new instance of the airport manager. And then what we do is we use the endpoint in this case and publish that through the URL and the instance of the manager. That's typically how we do it.

You can even do a little bit of fine-grained control if you want to do with that. Let me show you that example. This is just a finer control. Where here, I'll go ahead and create a new instance of the HTTP server. And with of course the inet socket address 8080 with, again, 10 threads.

And I use the executor. And you guys heard of the executor in Java. I'll go ahead and create a new pool of 10 threads of the executor. And then of course I set the executor in this case on the server so that it has 10 threads to run, if you want, multiple 10 threads at a time.

And then after that, I'll go ahead and on the server create a context to call the service called fancy server. That's my context. Create a new instance of manager. And then of course now create an endpoint by passing the manager through the create method of the endpoint class. And then of course after that, I'll go ahead and publish that using the context. And then I start my server. This is just to show you-- these are standalone server. I do not know if you got a chance to use them. They are part of the JVM. We just add them here just to let you know they exist, but a lot of people actually use the web server they have to implement and test their applications. And it's not, by the way, production quality type of server.

In terms of viewing SOAP messages, sometimes it may be helpful to dump all SOAP messages exchanged by the server to a standalone out. So the JAX0WS includes a generic framework that can be used for this. And this is called JAX-WS handler. And if you want to do that, it's very easy. You just use your system property to dump all the JAX-WS just by setting this, in this case, this option.

And most probably you folks have done that in the lab. They ask you to do that. So it's pretty much straightforward. You go under Tools, and then you go to Server. And then in the platform, you put down your option. And then you're good to go. So that's pretty much something that you'll see in the activity guide anyway.

And by the way, you may use SOAP 1.2. All what you do is just use the @bindingtype annotation. And then in it, you can specify the value, which is in this case SOAPBinding, which is SOAP12HTTP_BINDING. As simple as that.

Just to let you know, ladies and gentlemen, the reference implementation does not currently support the WSDL 2.0 yet. But it's a work in progress, so at some point in time. Remember how we've seen the difference between WSDL 1.1 and WSDL where now we don't have a message anymore, the port type is now called interface and the port is called endpoint and so forth. At some point in time, you've seen that. And by the way, WSDL 2.0 can work also with the RESTful web services tool.

In terms of testing web services, you folks have seen some so far in the labs. So one of them is the WebLogic's server tester. That would be one way to do that. Also Glassfish has also a tester. WebLogic uses this URL to test a web service, Glassfish uses that. Glassfish, by the way, is the reference implementation for the Oracle Glassfish server is the reference implementation to test all the new specifications.

And of course, you could be any HTTP tool that can submit a post request with a custom body. For example, you folks have seen the Firefox RESTClient, the cURL. JDeveloper will have a JDeveloper that actually use that. And there is also dedicated SOAP testing application. Anybody use SOAP UI before? That's also another one that you can use.

And to finish this lesson, we just want to go through a bunch of quizzes here. Public methods, in this case, in an endpoint must be annotated with @webmethod in order to be exposed to clients. Is that true? And of course we said it's no. As long as it's public, it's good.

And then when using a bottom-up development approach to create the SOAP endpoint, you create the WSDL file first. And that, of course, is not true. You just annotate your class with @webservice, and it will generate the WSDL file for you.

As always, at the end of every lesson, we do have some resources. These are just links if you want to read a little bit about JAX-WS or some features for JAX-WS or the EE 6 and so forth. And that's pretty much what we wanted to say about the bottom-up this case methodology for JAX-WS web services, where you do start with Java classes, and you just annotate with @webservice. And we also have a mechanism by which we can also customize different things. We've seen that.

And then you're good to go. And then of course you bundle all of that. And this is why I showed you this diagram. You bundle all of that into a WAR file. That's what you guys have done. And once you deploy it, it generates the WSDL file for you automatically.

So what's left now in the next chapter, or the next lesson, is to go through the top-down, where in this case we'll use the existing WSDL file given to us by a partner, and we'll generate-- of course, we create a client in this case, a JAX-WS client, with it. And that's pretty much what we want to cover in this lesson. Thanks.

## Bottom-Up JAX-WS Web Services, Part 4 - 6m

Now that we're done with the bottom-up JAX-WS web services, and we discussed how we can actually configure some Java classes to represent them as a web service interface, let's go ahead and take a look at the practices for this lesson. So in practice one, what we are going to do in this case is, we assume again that in the previous practice, which is 5-2, we created a card deck web service, again in this case, and we created a SOAP service that allowed the creation, listing, shuffling, and deleting of cards. Of course, in this practice, what you guys are going to do is you will create a generic card game web service project.

This new generic card game web service will contain the functionality needed for many card games, such as combining card decks, dealing handing, and creating card piles like a stockpile, discard pile, and so on. So of course, if you are creating multiple card games in the Java. Such as a Klondike, Solitaire, and Indian rummy, you again would place all of the common functionality into a shared library, JAR file. And of course, with web services, you should imagine that someone, for example, is creating a Klondike using C# maybe, Indian rummy using Java, and any number of games are being of course created using any possible language.

So you could either attempt to of course recreate the shared library in every programming language. Or you could, by the way, make it available as a web service. So creating a web service instead of a shared library does of course have its costs, such as the overhead of the network communication and adding another potential point of failure into your application. So the primary benefits of web services are platform neutrality. And of course if you can't guarantee that you will have only a single client implementation for your service and both the client and the service will be implemented in the same language, you might not need to of course, in this case, implement your service as a web service.

A shared library or a network service using a platform-specific technology like Java NMI might be a better choice in this case. And of course in a later lesson, you will create a client for this generic card game service. But of course, because you haven't reached that part of the course yet, you cannot be sure which programming language will be, of course, used for the client.

Therefore, a web service is the safest choice for the shared card game functionality. That's what we're going to do in this lab. The assumption is that you went through lab 5-2 where you created a card game web service that was completed. And the card deck WS WAR file is already deployed to your WebLogic server.

So here again, we just guide you step by step about how to go about creating these projects and of course called the generic game web service and what is it that you need to do in terms of configuration and implementation of code, again, going step by step in this case through all of this and adding the code necessary to handle all of that. So that's pretty much what you are going to, in this case, creating your game storage bean Singleton in EJB, and completing the code for it, and so forth. So pretty much step by step you're going to go through all of these different types of steps in the tasks to implement all of that, build and deploy, in this case, and test your game service.

And then after that, we again improve the generated element names by doing again gone, when using the WebLogic Test Client, you might again have had to reference the card game service source to figure out what method parameter was formed, because the names are non-descriptive. So you want to also do some work to somehow try to describe these names by using the @webparam annotation to fix that. We make you go through that by using @webparam annotation wherever it's necessary. And then, of course, after that, just following along and adding an overhead create pile method in the web service class that doesn't, again, need to know the number of the cards to add to a pile. It takes a [INAUDIBLE] all the remaining supply cards. So start by modifying your card game, OK, and so forth.

So that's pretty much what we want to do in lab practice 8.1. In practice 8.2, which is optional-- again, do it only when you have time-- this would be publishing an endpoint without an application server. Again, in this practice, what we're going to do is publish a simple endpoint by using only Java Standard Edition. Again, we make you go through all of these steps to handle that. And, of course, that would be, in this case, your lab for this lecture or your practices for the lecture.

## Practice 8-1: Creating the Card Game Service - 11m

After we're done lecturing the lesson eight, which is the bottom object of these web services, we want to start with, of course, Practice 8-1. In Practice 8-1 we create the Card Game Service. Again, in the previous practice, which is 5-2, Creating a Deck Web Service, you created a SOAP web service that allowed for the creation, listing, shuffling, and deleting of cards.

In this practice, what we want to do is we'll create the Generic Card Game Web Service project. The new generic card game web service will contain the functionality needed for many card games, such as combining card decks, dealing handing, creating card piles, again, stock pile, discard pile, and so on.

So if you were creating multiple card games in Java, such as a Klondike, a solitaire, and India Rummy, you would again place all the common functionality into a shared library JAR file. Of course, in this case, with the web services, you should imagine that someone is creating Klondike using C#, Indian Rummy using Java, and any number of games are being created using any possible language.

You could either attempt to recreate the shared libraries in every programming language, or you could make it available as a web service. Creating a web service instead of a shared library does have costs, such as the overhead of network communication and adding another potential point of failure to an application.

The primary benefits of web services are platform neutrality. You can, of course, guarantee that you will, again, have only a single client implementation for your service, and both the client and the service will be implemented in the same language. You might also not need to implement your service as a web service. A shared library or network service using a platform-specific technology like Java RMI might be a better choice.

So in later lessons, you will create a client for this generic card game service, but because you haven't reached that part of the course yet, you cannot be sure which programming language you will be using for the client. Therefore, a web service is the safest choice for the shared card game functionality.

And for that, what we decided to do is we decided to, in this case, create a project called Generic Card Game Web Service. Let's go in and take a look at that. So it happened that I already have it open, in this case created it. And then of course, they wanted to make sure that this, of course, project uses JDK 7. And then of course, the WebLogic server 12c is certified to run JDK 7, as we know.

So the Generic Card Game Web Service will provide web service, but it will also be a client of the card deck's web service that we created earlier and the new web service client to the generic card WSA service. So in this case, that's what we're going to do is add that, so we'll go ahead and add that.

And of course, looking at-- creating, in this case, a bunch of folders, the first one is the card game. And this card game that you see here pretty much is a class, in this case, that should be capable of representing the card layout of most card games.

Again, a card game starts off with one or more card decks. Cards can be split into a pile, shuffled, and of course, a card or cards can be drawn from a pile. A pile can be something like the cards in a player's hand-- a discard, a pile, or a stockpile. And even single-player games like Klondike solitaire use piles, such as foundation piles, downturn piles, and so on.

Effectively, pile management forms the basis of any card game. Add a pile-management code to the card class. That's we're going to do in this case. So here we have an array list, and we have a hash map. We have the Add, a method, again, in this case. And so this addCards is used to add the cards to the game. And then we have a createPile method, and this pretty much again, is used to create a pile of a name card using supply cards as a source.

And then of course we have an elimination, which is distribution, a method of elimination, a round robin or a fill pile. And then we have a, in this case, createPiles method. This again is used to create multiple named piles of cards using the supply cards as the source. Again, use the distribution parameter to determine how cards are distributed from the supply cards to the named piles. And that's what we have here. OK, this is pretty much-- they give us also in the book so that we can follow that.

We have also a showTopCard method, and this is used to retrieve a single card or all cards from a named pile. And we have the showPile method, OK, that you see. We have also the transferCards method. Again, this removes cards from one named pile and adds them to another named pile.

And we have shuffleAll. We have shufflePile. We have a shuffleCardList method that takes a list of cards and shuffles them. We have the getSupplySize and we do have the getPileSize, and that's pretty much what we have in the card game method.

We also are asked to create another class called, in this case, the GameStorageBean, which just happens to be a singleton, a session bean. And of course, we complete this, of course, by, in this case, having a map representing the singular card game, and he has a get getGame method and addGame and moveGame method, OK?

And then after that, they want us to create another class in this case called a CardGameService, OK, and this CardGameService that you see here, OK. And this CardGameService, of course, also, as you see, it's a web service and makes use of the bean. We inject an instance of the GameStorageBean using the @EJB. It has a URL and of course the WSDL location, OK?

And then, of course, here we do have the createCardGame method, OK? And of course, don't forget also that they want us to-- it has also other methods, which is a moveCardGame and so forth. But they want us to also enhance, improve the generic elements using the WebLogic test class. Again, we might have a [INAUDIBLE] reference the CardGameService source to figure out what method parameter was for, because the names are undescriptive. So we use the @WebParam.

That's what you see here, the @WebParam, an annotation to fix that, OK, as you see here. And we see it in the createCardGame and also in the removeCardGame and in the createPile method in this case, and of course in the createPile, in the createPiles, in the showTopCard and showPile and transferCards and shuffleAll and shufflePile-- all of them use the @WebParam. That we discussed.

And of course, they want us to save and deploy this application, of course. Then test it. So I already deployed it, and if you want to test it, you go ahead and test it by, in this case, using all the different types of methods by creating all supply pile, creating card game, create a pile, and so forth, and remove, show, and so forth. So we pretty much can go ahead and test all of these. OK, and that's pretty much what they want us to do in Practice 8-1. Thank you.

## Practice 8-2: Publishing Endpoints Without an Application Server - 3m

The optional practice A-2-- again, it's an optional one, which means you don't have to do it unless you've finished everything-- it's about publishing endpoints without an application server. Of course, here they want us to create an application project called Java SE web service. And that's what I have here.

And then, of course, in it we do have a hello-- create hello service, which happens to be a web service here, in this case, that has a message, get message, which returns a name, and then rocks, whatever, in this case. And then we have, of course, a Java SE web service, in this case a Java class that pretty much has a main method that has an endpoint, which is represented by the publication of the hello web service, by creating a new instance of the hello service.

Of course, we'll go ahead and run this, and then we open a browser. And in the browser, we'll go ahead in this case, and first invoke a get on the local host 80/80-- you know, hello. And that's pretty much what we get in this case, which is a, in this case, response of the web service. And this is the local host which is the WSDL file represented in this case. The URL of the WSDL file.

And then what we want to do is, in this case, go ahead and run post. And for that, we run a post using this one here, where in this case we use the content type to be text HTML, and then here's the [INAUDIBLE] that we passed. And we invoke the [? send, ?] we get the response that says again, in this case we're passing Tom as a name value in this case.

And then the response would be Tom rocks, OK? And that's pretty much what they want us to get as an output. Of course, this is just an optional practice. And like I mentioned to you, we don't need to do it unless, of course, you're done with all the practices. And by not doing it, doesn't mean that you are not going to learn about the web services in this particular course. Thank you.

## Skill Check: Bottom-Up JAX-WS Web Services - Score 80% or higher to pass

Skill Check: Bottom-Up JAX-WS Web Services

View Skill Check
