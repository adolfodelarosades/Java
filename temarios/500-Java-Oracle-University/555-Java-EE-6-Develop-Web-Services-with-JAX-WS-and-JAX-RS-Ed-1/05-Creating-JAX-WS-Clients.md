# 5: Creating JAX-WS Clients

   * Creating JAX-WS Clients: Part 1 26m
   * Creating JAX-WS Clients: Part 2 8m
   * Practice 5-1: Selecting the JAXB Data Binding and JAXB Providers 3m
   * Practice 5-2: Creating a Card Deck Web Service 6m
   * Practice 5-3: Creating a Java SE Web Service Client 4m
   * Practice 5-4: Creating a Java EE Web Service Client 4m
   * Practice 5-5: Binding Customization 5m
   * Practice 5-6: Creating a JAX-WS Dispatch Web Service Client 4m
   * Practice 5-7: Using WS-MakeConnection with a JAX-WS Client 5m
   * Skill Check: Creating JAX-WS Clients - Score 80% or higher to pass

## Creating JAX-WS Clients: Part 1 26m

OK. Let's go ahead now and take a look at a lesson called Creating JAX-WS Clients. So what we're doing here, and let me just go to the board and I can explain a little bit what I'm trying to do here. So imagine that I have in this case a web service that already exists.

So I do have an application here. So I have my enterprise application. And it has a bunch of components, pretty much a bunch of components all here representing the services and so forth. And most probably this one also can talk to a database. If I use a web profile it would be something like this.

And then what I did is I do have now in this case, I do have a JAX-WS infrastructure for it to expose the business logic as a web service. Now what I want to do in this lesson is I want to create a client. I do I have my web service client. Of course on this side I do have what we call on my web service. And of course here I do also have the JAX-WS.

It turns out that this JAX-WS is defined on both sides of the SOAP web service, on the client side and on the service side. So all what need in this case on the client side, is a WSDL file from the service. I pass the WSDL file to the client. The client will build the web service client. And so that of course they can start with interacting with each other through, of course, SOAP messages.

So all what I need from this guy is that hey, give me the WSDL file. Thank you. So I can go ahead and pass it to my WS Import Engine to generate my web service client. So what we want to do now in this lesson is we want to investigate how we create a JAX-WS web service client.

So let's go ahead take a look at that. So here we're going to use the tools to generate our JAX-WS client artifact. We're going to call the SOAP web service by using the JAX-WS Java Standard Edition, in this case, environment. And we're going to also call a SOAP service using the Java EE environment. And what's the difference, by the way, between the two? We'll take a look at that.

Well of course, we use JAXB for customization with the SOAP service, create of course, JAX-WS dispatch client. You see yesterday, I have discussed with you that JAX-WS is not JAX-RPC backward comparable. But in some cases, you can have existing JAX-RPC, old JAX-RPC web services. And now you have your new JAX-WS web services. And you want to talk to the old JAX-RPC web services because it happened that they have some SOAP messages that are weird, they're out standard. What is it that we need to do to build on my JAX-WS side, a client that allows me to talk to that nonstandard type of a SOAP web service?

And that would be using the dispatch client. We'll take a look at that. And then of course we're going to create a client that consumes the WS-Policy-enhanced services, like MakeConnection. Remember we discussed the WS-Policy extensions in the previous lesson.

So there are a couple of ways, ladies and gentlemen, to call a SOAP service when using JAX-WS clients. First one that everybody loves is what we call the pre-generated, in this case, static clients. This is the most convenient, concrete service implementation that provides access to your services using your generated classes. You do have again, tools that read the WSDL file and produce your Java artifacts on the fly.

And of course there is little to no direct interaction with SOAP and XML. It's all hidden for you. This is exactly a diagram that I want to show you here, where in this case from the service side we spilled out when we deployed the application.

You will build our web service. We configure that class of service and web services. We jar them, compile them, and assemble them into WAR files, and deploy them. And then of course when we deploy them that's where the app server generates the WSDL file.

I'm looking at this. We'll look at that tomorrow, by the way. Today we're looking at this side. Where the client was given a WSDL file. We pass it to the engine. And this will generate all the artifacts for thus, and for the web service client. That's what we're going to do.

And so that's pretty much the-- and by the way, remember. I mentioned to you that it can use dispatch clients, some generic service instance, which is used to dispatch handcrafted SOAP messages. Again this is used when SOAP messages must be constructed by the developer code. Why? Because they are non-standard messages, if needed.

So because when we started working with web services a while ago, there were no standards. People created SOAP messages their own way. But now the question is they still work. They still exist. We don't want to break them. We don't want to spend money refactoring them for now. But we want to talk to them.

So one way to do that is using this way. So this pretty much represents what we call the dispatch client, to allow us to again generate nonstandard messages if needed. And of course, no compile-time dependency In this case.

So what's the role of JAXB in the JAX-WS? Remember how earlier yesterday when I showed you a couple of boxes where one represents JAX-WS, the other one JAX-RS? And I said JAXB is used underneath the hood, when using by JAX-WS. So here pretty much the role of JAXB in JAX-WS is that the WSDL type section contains your schema, similar to XJC, process that XML schema elements and produce what we call JAXB annotated classes.

These annotated classes, we've seen them yesterday, the different our XML root element, our XML value, our XML type, and so forth. Local copies of these XML schemas can be modified by the JAXB custom binding annotations. To modify your generated Java classes, I want this name, I don't want this name, and so forth, so we take a look at that.

And of course client-generated classes may have the same name as a server area class, except that they're empty. There is no business logic. The business logic is on the server side. But you know the class names are pretty much the same in this case.

Creating a JAX-WS Client. Well you can use the JAX-WS Reference Implementation, which is part of your application server. In this case it could be your GlassFish or your Apache Tomcat, or your WebLogic, and so forth.

Basic SOAP web services can be used by the Standard Edition of client. And of course developers use what? The wsimport, similar to the xjc to generate that artifacts of client. And that's pretty much similar to the diagram that I showed you here.

And of course all what you need in this case is your WSDL file, and you're good to go. So here is, again, just an example of the wsimport. A command, how we run it, again you see specifies pretty much in this case, the Hello service, the extension, and so forth. So that's pretty much-- this could be, by the way, this script could be part of a script language like-- I don't know if you guys are using Ant or Maven, or any one of these.

Of course, the wsimport produces all the classes. So here running the wsimport on the hello world in this case, WSDL file. I'm pretty sure it pretty much produces all these files for you. The GetHello.java, this the JAXB annotated class used to marshal and unmarshal your SOAP requests, in this case, body.

And you have the GetHelloResponse, which is again a JAXB annotated class used to marshal and unmarshal your response, SOAP response. You have the Hello, which is the JAX-WS port class. We have the Helloservice. That's the service that we are going to use, by the way. Remember this HelloService. this is the one that we're going to use to get a port.

And then the ObjectFactory, that's the JAXB factory, and then the package-info.java, which represents the package level annotations. All of these are generated for you. And you guys have done some labs yesterday that actually allow you to look at these generated files.

And here are some examples that you guys have done yesterday. Here's is the CardType generated for you, as you see here. You see the annotations, our XML access type, our XML type, and so forth. You have the ColorType. And here it is.

A notation here, it happens that it's an enumeration. That's why you have it with that XML name. The object factory, here it is. And then we have the stock type, which also is generated for you. And then the suit type, which is also generated for you, and the package info. That's the one that we were discussing, which we said by the way in the case, it is the JAXB level annotations.

So of course looking at this local WSDL file, when configuring your web service a client reference in NetBeans, it just happened that had the ID in NetBeans, there are a couple of copies of the WSDL file. One is under resources in XML. Again, you must switch the File tab. Let's just see an example about that.

When we say switch to the File tab, you can go to the File tab. And then let's go ahead and look at that. And underneath you will see again in this case, on the xml-resources. And then underneath you will see jaxb, and then jaxb-binding. And then here are your XXD and so forth. So obviously you can find all these files underneath.

And of course this copy is used when running your wsimport every time you build your project. And then we have one under the META-INF also, if you go back here and look under the META-INF in this case, you also can find that too from the web tier. And you will see that again later on underneath in this case the web, and then the WEB-INF, and so forth. So you can see again in this case the WSDL file, which happens to be in case this one. This is the WSDL file that we've seen earlier in the first exercise. And this is the XXD file that of course, in this case represents the XXD, the schema file.

Moving along and looking at the next slide would be calling a web service. Look how easy it is. This is as simple as this. This is when you create a simple Java web service client using again, Standard Edition. All what you do here, if you remember I said, remember this class, HelloService. That's the web service class.

So here what we do is we go ahead and create a new instance of the HelloService. And then invoke on it the getHelloPort. That gives me the port. And then after that once I get the port, I can invoke my method, getHello pass Matt to it. It's going to return a string, which I'm going to print. Most probably it's going to return what? Hello Matt.

That's in the Standard Edition. So after of course the JAX-WS artifact is generated, calling the web service is pretty much fairly easy, as simple as what we have here.

And of course the question that we always have here when we talk about these web services, the judgment is we would like, we would love to use the Enterprise Edition. Why the Enterprise Edition? Because when we use the Enterprise Edition, we are making use of a web server, or an app server that gives us all these services for free through configuration, either deployment descriptor configuration, or annotations, right? What are these services?

Concurrency, multi-threading, transactions, persistence, naming services, security and all that. So if you want to use an Enterprise Edition, in this case a web service client, then it is so simple. All what we do in this case to create a new instance of the web service client is as simple as what? As using the annotation on the field.

So if you want in this case to create a Java EE web service client, almost all the steps are exactly the same. If your client is a managed component-- what do we mean by a managed component? It could be an a EJB. It could be a servlet. It could be a JSF component. It could be a managed bean. That's what we mean. Managed component means its life cycle is managed by the container, either the web container or the EJB container. Then in that case it's as simple as what?

Here is my Hello, and I can use a service. Declare that it's a service, and then annotate that with @WebServiceRef. What I added in between parentheses here that you see here, ladies and gentlemen, is just the WSDL file, specifying the WSDL file. And that's it.

So once I add that, what happened is that once I use this annotation on my service, it will inject a new instance of the service. I can even do better. I can now-- and by the way, this is optional for this one here. You can actually put it, or you can just leave it alone. I could do this same thing. But I could apply either to a service or to a port.

If I apply it to a service, then I invoke the method, getPort to get a port from the service. If I apply it on the port directly, then I get the port directly. And I can invoke the method directly on the port. So you folks are going to do a lab when you are going to create a JAX-WS web service client. You're going to create a Standard Edition one, and you're going to create an Enterprise Edition one. That's the one that you are going to use to create.

So to create a Java EE web service client all what you do is just inject it through what? Annotation. What is this annotation called? @WebServiceRef. As simple as that.

So this is why we call JAX-WS is the magic wand. Of course if you want causes that advise us, if you want, or force us to go to the Enterprise Edition, is sometimes you have thread safety, potential thread safety. What potential threading issues exist in the web service client? Again what is a de-threading model of the Java EE, again in this case, calling the web service. Servlets are multi-threaded. So that's why we're not using them. Session EJBs are not, if you [INAUDIBLE].

So you have to pretty much now, take a look at-- use the advantage of the existing services given by the app server to handle all of that for you. So can this service and/or port be shared by multiple threads? It depends. The JAX-WS specification says that it's not guaranteed. But if you take advantage of the existing enterprise application features, or services by the app server or your web server, then in that case you can go ahead and handle thread safety by creating a pool of EJ statement session B's, or using a servlet which handles the multi-threading. And so forth. That's why the Enterprise Edition is the advice that we typically give when you build a JAX-WS client.

Binding Customization. So if your remote web service is developed in a different type of programing language, again the names of XML types may not follow the naming convention. And of course what you could do is you can use the JAXB binding customization to actually handle that. You can do an inline customization which is applied to your local, in this case, XML schema files. And/or you can go ahead and use an external binding by ensuring that all your changes will not be overwritten. And then you can go ahead and put that into an XML file, and then of course reference that.

And if you remember what we have done, and what we have discussed, ladies and gentlemen, we said that sometimes you are forced to create your message, your SOAP messages by yourself, simply because you're talking to a web service, which SOAP web service which happens to be non-standard. In that case, you can use what we call a dispatch client.

So dispatch client does not require an wsimport or any generated artifact, because you have to do everything by hand. So the dispatch class client manually creates your SOAP message, and have a greater flexibility to create your SOAP requests. And we use it, by the way, as a practice, which is an optional one. Where in this case, here is what you do.

You create a MessageFactory, instance of a message by invoking the new instance on the MessageFactory, passing your SOAP protocol 1.1. Once you get that MessageFactory, you invoke the create message on it. You get the SOAP message. Once you get the SOAP message, you go ahead and invoke. Get the SOAP part, you get that part of it. Once you get that part, you go ahead and invoke getEnvelope. You get the envelope part of it. Once you get the envelope, you invoke the getBody to get the body. Once you get the body you can do anything to it.

You could put your operations, your parameters and all that. This reminds you of, for those who have done JAX-RPC, this reminds you of which API? SAAJ, remember? SOAP attachment API for Java? That's pretty much what we [INAUDIBLE].

So this is a mechanism by which actually we can now create a dispatch client to have control on our SOAP message. That's the idea behind this.

So here I could go ahead and add an element, any element to my body. I have control over that. And I want to add up to what? To my partner, because it happens that my partner is using SOAP messages that are not standard. That's the idea.

So what it means here and then the good news about this since you have implemented your SOAP web services using the JAX-RPC old API, guess what. If you know use JAX-WS, you'll have no problem talking to all the services that you have.

We do have an engine here called clientgen, clientgen by the way is WebLogic specific, alternate to the wsimport. When using your extensions, like WS-extensions, all the WSDL to Java compilers may not understand that policy statement. So in general, what we do, we use like a wsimport or the clientgen. Most of these do actually use-- most WS compilers provide an Ant task that can of course be added to your project to actually build all the machinery, if you want, or all the plumbing for you.

Again, do not use this Web Service Client option in NetBeans. Again, it configures only wsimport. Because it's specific to the WebLogic.

And here's an example of your clientgen Ant task that can be used in NetBeans. Again, this assumes that you have an Enterprise Edition project with weblogic.file. And then for more information about that, you can go ahead and see the reference linked to again at the end of the lesson here. So you see, it's just pretty much showing you in this case, the Ant script that your are going to write down there.

And of course what we said is we said we do have a WS-MakeConnection. That's by the way, part of what? The WS-Policy. This WS-MakeConnection is pretty much quite simple. It is nothing but a WS extension that is supported by WebLogic. And what it does, it actually enables polling SOAP, for SOAP responses, instead of requiring what? A persistent connection.

So this is what it does. If you actually use the WS-MakeConnection, it allows a client to poll for response, rather than establishing a persistent connection, and then of course waiting for that message. WS-MakeConnection is very simple. It's part of the WS-Policy.

Server and client code can be the same as without the policy. And of course SOAP messages will be different, even though the server the client remain exactly the same. So if you want to add, by the way, if you're curious. You say, let me go ahead and use the WS-MakeConnection, but I'm curious just to take a look at some of these SOAP messages.

Easy, all what you do is you add the VM option this one here, set it to true, so it can dump, so that SOAP messages are dumped on the system. You just go ahead and take a look at them, and see how they look like, and so forth. You will get to actually do that in the lab.

And that's pretty much what we wanted to say about the creating a web service client, the SOAP service client. So let's go ahead and just summarize what we've done.

There are two ways to create a JAX-WS client. One, which is the easy way, by doing what? By passing the WSDL file to the wsimport engine. The whole thing is generated for you. That's the convenient way. Now if you're talking to a non-standard type of SOAP message web service, then you need to use the dispatch client. And that pretty much gives you all the detailed code which happens to be familiar to you. Just because you've used it before in the past.

And you can use a standalone JAX-WS client. And you just get an instance of the service, and then get the port from it, and invoke. Or it would be even better if you use what? The Java EE SOAP web service on JAX-WS client. Why? Because you get services for free from the server. And all over there, all what you do is you just add the web service reference in the annotation. And that will inject an instance of a service, or in an instance of a port. And then you use it. And you get to do, by the way, both in the lab.

Just a small quiz here to end this lecture. So the methods available in a JAX-WS-generated web service client are determined by what? In this case, by the imported WSDL file, and by of course the JAXB binding customization. We'll see some of the JAXB binding customization when we use the top-down and the bottom-up mechanism to create SOAP web services. That will be tomorrow.

One more quiz. To call a web service with JAX-WS, you must first use wsimport. And the answer is false. Simply because we already have seen another way to create a SOAP web service.

And of course every lecture finishes with a bunch of resources. And these just are links to read a little bit about JAX-WS, or maybe the JSR 224, or maybe the EE 6, or the developing WebLogic Web Service Client, and so forth.

And that's pretty much what we wanted to say about this lecture, which is creating JAX-WS Clients.

## Creating JAX-WS Clients: Part 2 8m

OK, now that we are done with lesson 5, which is creating JWS clients, if you remember, we've done a couple of ways to do that. One is by passing the WSDL 5 to a WS import to generate the class artifacts for the web service client, or using the dispatch client if you want to build the SOAP message by hand. In this practices, we first do a practice 1, which is selecting be JAXB data binding and JAXB providers.

Here, what we do is in this practice, we configure the JAXB implementation, which will be used by all application running in a WebLogic server instance. So the WebLogic 12c is shipped with a couple of JAXB implementations, which are the EclipseLink MOXy and the GlassFish implementation. MOXy is, by the way, the default JAXB implementation used by the WebLogic server. And the GlassFish reference implementation was the default in the previous WebLogic server releases. So in this practice, what we do, we reconfigure WebLogic server to use the GlassFish JAXB reference implementation.

Again, you go through the tasks here, step by step, and pretty much read them through it to understand the machinery if you want. And then at some point in time in this step, they'll ask you to shut down your WebLogic and NetBean. And after that, they want you to get into the way the dispatch, which is the library of the server, WebLogic server, and then look for that WebLogic JAR file.

Once you get that WebLogic JAR file, you are going to rename it to weblogic.jar.old. And then after that, you're going to copy the new one back in that directory. And then after that, you start your NetBeans, start your WebLogic server, and you're good to go for the next labs.

The next practice, which is Practice 5-2, that's where we ask you to create a card deck web service. And again, you use your existing JAXB annotated playing card classes to create a basic web service out of an EJB. This project will be called CardDecksWS. So you go through all the steps, and you create that web service. And step by step, we pretty much guide you. What is the code that you need to add, and why, and so forth, all the way until you create your web service. After that, you just deploy it, and you just start web service.

In practice 5-3, we create a Java SE web service client. So again, this is pretty much similar to what we have done in the lecture. So in this case, we create a Java SE application that uses a JAX-WS to a web service. We already, by the way, assume that the card deck web service project that we have done in 5-2 is all deployed.

So again, here, step by step, we ask you to go through the steps and create this web service client. If you take a look here, you will see that pretty much in terms of the code, that's where you create a new instance of the service, and then you get the port of that service. And then follow the different steps to add the code that is needed to run this project. Once you're done with it, you can go ahead and pretty much run the project.

After that, in practice 5-4, you create now this time a Java EE web service client. If you remember, we also discussed that, and we said if, for example, you're interested in getting a services by configuring your application server, then it would be nice to create a Java EE web service. That would be, for example, a managed type of a component, or in the Java EE managed component for that. So you create a Java EE application that uses a JAX-WS proxy to call a web service.

So here, we do have, step by step, what you need to do to create this web service. And one thing that you are going to remember is that @WebService reference that if you remember we discussed in the lesson, that we apply on the service. Once we get that instance of the service, then at that time, we invoke the, again, the method to get the port from the service. Once you get the port from the service, you can go ahead and invoke your method, which is create a deck with the parameter 2.

And we continue with that by, again, just following the steps. Then after that, once you finish all of your project, you go ahead and build the project, which is the card deck EE client. And then after that, you run your web service client servlet that you create in this lesson. If you want to use in the playing card Unicode called block and the DejaVuSans, which you already did in lesson 3, if you've done that, then you're all set for that. And that pretty much your practice for dash 3.

Now, the rest of the practices, they're really optional. And what we mean by optional is you go ahead and o the required ones, and then if you've got time, and you want to do more practices, then you can go ahead and do those. For example, in practice 5-5, which is optional, you customize the binding to improve the methods and class names of the generated JAX-WS artifacts. A lot of work is just JAXB binding customization, just like you already performed in lesson 3.

In 5-6, which is also optional, you create a Java SE application that uses the JAX-WS dispatch client to call a web service. Again, know that no generated artifacts are used in this project, though the code does make more assumptions about the structure of the request and response messages. You could also programmatically pass the WSDL file and associated XMS schema to create a truly dynamic client. This is the discussion that we had when we create that dispatch client, that JAX-WS dispatch client.

And in the practice 5-7, which is also optional, you used the WS-MakeConnection with JAX-WS client. So what you're going to do is create that JAX-WS client, which uses the WS extension. In this case, it would be using the WS-MakeConnection. So again, here, we just show you step by step. We assume, by the way, here, that practice 4-3, which is the small calculator application, is already done. And you follow just the step by step to perform this project. And then after that, you go ahead and run your CalcServlet class.

And that's pretty much what we wanted to ask you to do for the practices of lesson 5. Thank you.

## Practice 5-1: Selecting the JAXB Data Binding and JAXB Providers 3m

In practice 5-1, we will select the JAXB data binding and JAXB providers. So in this practice, what we do is we configure the JAXB implementation, which will be used by all applications running in WebLogic server instance. Of course, WebLogic server 12c is shipped with two JAXB implementation, EclipseLink MOXy and the GlassFish implementation.

MOXy is the default JAXB implementation used by WebLogic. The GlassFish reference implementation was the default in previous WebLogic server releases. In this practice, we will reconfigure WebLogic server to use the GlassFish JAXB reference implementation.

So in this practice, the way we do that is pretty much straightforward. What we do is we'll go ahead and look for the WebLogic JAR file and enter the in this case-- let me go back here and explain this in-- we do have that in the library, which by the way, in this case is located under the WebLogic WLS Server server and lib library. And what we have done is we named the old WebLogic.jar file by calling it WebLogic.jar.old, and then we copied the WebLogic JAR file that is provided to us in lab 5.

That's pretty much what they, which is, by the way, in this case this one here. So we copied this JAR file to that Library folder. And then, of course, we've done this by first of all, shutting down the GlassFish and then shutting down NetBeans, and we did of course the changes and copied the JAR file.

And then after that, we started WebLogic. We started NetBeans, then we started WebLogic. And now, of course, we're ready for the next practice, which is going to be practice 5-2. That's all what we wanted to do in this practice. Thank you.

## Practice 5-2: Creating a Card Deck Web Service 6m

In practice 5-2, we create a card deck web service. We use our existing JAXB annotated playing card classes to create a basic web service out off an EJB. So in this case, we get into NetBeans. We create a CardDecksWS project. And in it, after that, we will go ahead and, of course, we make sure that the source binding format is JDK7 for the CardDecks web service project.

And we copy the playing cards package from the JavaToSchema project to the CardDecksWS project. Of course, in this case, we're using the existing Java classes that we used for the JavaToSchema project. And let's going ahead and take a look at that in NetBeans.

So here is pretty much the project that I created. And here is the playing card that we copied. And in addition, we make sure that the card class to have no argument constructed. And we can see that here where here's my card, and then I can just double click on it here to make it full screen. And then if you take a look at this class, it's annotated with the JAXB annotations that we already have seen in the previous lesson.

And here's our class. It has its own fields. Some of these fields are annotated And then as you see, it has also the card constructed, again, with no argument constructed, exactly what we've seen. And then after that, what they want us to do is they want us to create a session bean, a singleton EJB, called CardDeckSessionBean. And that's pretty much the one where that is going to have the business methods needed for this card deck web service. Let's go ahead and take a look at that.

So as you see in this session bean, we pretty much have-- first of all, we make the session bean maintain a collection of card decks. And let's take a look at that at the beginning. So let's, first of all, open this C CardDeckSessionBean. Here it is. Let's make it full screen, so we can see the code. So here's our class. It is a singleton session bean. But of course, here, we annotated with @WebService, which makes it a web service, a JAX-WS web service. We'll take a look at these annotations in a later lesson.

So again, it maintains a map here of decks, which has an integer in the type FrenchCardDeck. And it's a new HashMap, again, initialized with the new HashMap. And then it has a bunch of methods. First method that you see here is createDeck. Again, this createDeck accepts one parameter, which is the number of jobs, and returns the unique ID of the deck that was created.

Then after that, we have the listDeckIds, and this pretty much a method that returns an array of all the deck IDs. Then we have deleteDeck method, and this pretty much deletes a deck of cards by ID and returns true if the deck was present and deleted.

And then after that, we have a shuffleDeck. This method shuffles a deck of cards by ID and returns true if the deck was presented, present rather, and shuffled. And then we have the get method, which is getDeck. And this returns a deck, again, by ID. That's pretty much what we have. That's what they asked us to do.

Of course, they asked us to deploy this application. I already deployed it, and you see it here. And then after that, once we deploy it, they want us to test is, this CardDeckSessionBean web service. So for the testing, first of all, they want us-- let me just open the browser. So first of all, they want us to deploy the web service and call the CardDeckSessionBean service.

If I click on this, then this will give me the web service. Of course, I can have access to the WSDL file. And here it is. Here's the WSDL file of this web service. Again, the file always starts with the definition and ends with definition [INAUDIBLE] inside what we call the logical part and the implementation part. We'll take a look at that later on.

And then after that, they want to open a web browser and use WebLogic service, so test client to test the card web service where we go to this URL that they asked us to go through. And then here, we can go ahead and create, for example, create a deck. And then after that, obviously, test other if you want, methods, in this case. You can show operations here, and you can pretty much delete a deck, get a deck, list the decks, shuffle the deck, and so forth.

And that's pretty much what they want us to do in practice 5-2. Thank you.

## Practice 5-3: Creating a Java SE Web Service Client 4m

In practice 5-3, we want to create a Java Standard Edition web service client. Here, we create Java SE application that uses JAX-WS to call a web service. So in this case, they asked us to create a Java SE application project called Card Deck SE Client, and then that would be in the folder Lab 5.

And then after that, they want us to create, in this case, a web service, which will be web service client, using the WSDL file. Of course, they want us to, in this case, work with the CardDeckSEClient.java, which has a main method, and in it, we're going to create the new service, get from it a port, and then, of course, after that, [? code ?] create a deck, and shuffle, and use the rest of the methods.

And let's go ahead and take a look at that. So here's our Card Deck SE Client. Here's our CardDeckSEClient.java. Let me go ahead and click on it to get it on a full screen. So this is a class. It has a main method. Here, we went ahead and called the Create Deck method in this case, and it turns a deck ID.

And then we pass it to do a shuffled deck, and we get the deck in this case. We do make use of a list of card decks by invoking the card deck to get the list of cards. And in this case, we do have a for loop in this case to iterate through the for loop and the enhanced for loop through the card decks, the list of the cards, and print the rank, and so forth.

So in the shuffle, that's where we go ahead and create a new instance of the service. From the card deck session bean service, we'll go out and get the port, and then on the port, we invoke the shuffle, bypassing of course [INAUDIBLE] in this case. And then here's my card deck, which turned out to be-- so we have the shuffle. We have here the create deck, and then we have the get deck.

And then they want us to, in this case, right click and run this project. And if we run it, we get the output. And if I make the output, you will see that pretty much it has my output in this case of this particular project. That's pretty much what they want us to do in practice 5-3. Thank you.

## Practice 5-4: Creating a Java EE Web Service Client 4m

In Practice 5-4, we create a Java EE web service client. In this case pretty much, a Java EE application is the one that we are going to create to use a JAX-WS proxy to call a web service. So we do create a project called Card Deck Enterprise Edition client, and of course, in it, you know-- so that would be the project.

And in it, what we are going to do in this case, we want to make sure that, of course, it makes use of JDK 7. And then in it, we are going to create a servlet that of course, in this case would be called the WS client servlet that, of course, in this case would be the servlet to access to make use of a web service, which is called the card deck session bean service.

And then of course, from it we'll go ahead and access the create a card deck, and of course, access the deck, and so forth. So let's go ahead and take a look at that. This would be in NetBeans. So here's the project, and here's the servlet that we created. So this is called WS client, and it's an HTTP servlet. We, of course, configure this as a servlet using the at web servlet.

The name is WS client, and the pattern, the way you connect to it is forward slash WS client. And here we go ahead and inject an instance of a service, which is called the card deck session bean service using the at web service reference. Of course, here we specify the WSDL location, which is this one here. And then, of course, after that, in the process request method, that's where we, of course, make use of the [INAUDIBLE] in this case.

And then through the service we'll go ahead and invoke the get card deck session bean port. That gets me the port. And then after that, we'll go ahead and invoke the create deck in this case, and pass through to it as a parameter. That gets me the deck ID, and then I'll go ahead and shuffle, and of course, after that get the deck.

OK, this is pretty much where we do some mock up, of course, in this case to get an output in our case here. So if we now run this servlet by just right clicking, and then clicking run file, that will open a small window here that says, of course, servlet execution in this case would be using the URL pattern.

Which, by the way, that's the one that we had. So we click OK. This will go ahead and open it, and that, of course, here will get us the output. And of course, this is pretty much what they want us to do for, in this case, practice 5-4. Thank you.

## Practice 5-5: Binding Customization 5m

Let's take a look at practice 5-5. Of course, practice 5-5 is an optional practice, which means you don't have to do it. You do it only if you finished everything. And like I mentioned earlier, these practices, if you don't get a chance to do them, especially the optional ones, that doesn't mean that you didn't learn. These are just extra features that we added in case some people finish early and want to do something else, so we just added these. But then again, try them only if you did not finish with all the practices that we ask you to do.

So in this practice, we customized the binding to improve the method and class names of the generated JAX-WS artifacts, because a lot of work is just a JAXB binding customization, just like we already performed in lesson 3. So here, we do have a CardDecks extended addition project. And then, when we add a service client to the project, WSDL and XSD files for the remote web service are copied to the project. And the files are copied to two locations. Only the files in the xml-resources folder are used when running the WS import, building the project.

So what we want to do here is switch to the file in the NetBeans and expand the folder in the CardDeck extended addition client project, starting with the xml-resources folder, until we find the WSDL file and the XSD files. So all of that pretty much is done here.

So here's our project, CardDeck extended addition client. If you go to the Favorites, that would be underneath this here. And then that's what they want you to open it and extend all of these. And so by expanding all of these, we'll see pretty much all the-- so here's the XSD. And then that's what they want us to see.

And here, we do have the complexType, which is the stackType, which by the way, if you take a look here, they want us to, make sure that you're modifying the stackType complex to have a class name of cardStack instead of stackType, and to have a getCards method instead of getCard. So as you see here, this is pretty much what they want us to add, which by the way-- and then continuing with it into the next page. And this is pretty much what we have, and that's what they want us to do.

And then after that, they want us modify the CardDeck extended addition client. And that would be going back to the project and modifying that CardDeck extended addition client that you see here. And here's the getDeck and the different methods that we have over there. And then they want us to build the project, deliver project.

So going back, so I already built it. So if I run it, just run it, and that would be our output. And then you can see the whole output in one page. And that's pretty much what they want us to do in this optional practice 5-5. Thank you.

## Practice 5-6: Creating a JAX-WS Dispatch Web Service Client 4m

Let's take a look now at the optional practice 5-6. Again, this is an optional, which means you don't have to do it unless you really are done with all the labs that you are supposed to do, and you've got lots and lots of time, and in that time you go ahead and try it. So in this practice we create a Java Standard Edition application that uses a JAX-WS dispatch client to call a web service.

And you should note that no generated artifacts are used in this project, though the code does make some assumptions about the structure of the request and response messages. Again, we could, in this case, programmatically pass the WSDL, and also seed an XMS schema to create a truly dynamic client.

So in this case we want to work with a project called Card Deck Standard Edition Dispatch Client, and then in it we are going to work with a class called Card Deck Standard Edition Dispatch Client dot Java. Let's go ahead and take a look at that. So here we have the project, and here we have the card deck dispatch client.

So this is a class where in this case, what we're doing is we're creating a queue name, service queue name which is presented by the new instance of the queue name, and then the port, and then, of course, the endpoint URL that you see over there on line 22, 23, and 24. And then, of course, after that we'll go ahead and, in this case, create a service and add the port to the service, and create a SOAP message.

So as you see here, 1.1 message. That would be here in these. In the [? SOAP. ?] And then, of course, after that they want us to, in this case, complete the SOAP body with the request to create the deck with one Joker. And as you see here, OK, so that's all this code here. And then after that, they want us to create a new SOAP message. And that would be here in this case.

And then after that, they want us to, in this case, complete the SOAP body with a request to get the deck previously created. That would be here, in this one here. And then after that, they want us to look through the content of the SOAP response body and print out the value of each card. And that would be all done through this code that you see here. OK.

And of course, they want us to throw SOAP exceptions enclosed to the main method. That's, of course, all done. OK. And all that they want us to do now is run the project. We'll go ahead and run it. Of course we're, on the project and look at the output in a full screen, and that's, again, the output that you get here. And that's pretty much what they want us to do in the optional practice A5-A6 in this case. Thank you.

## Practice 5-7: Using WS-MakeConnection with a JAX-WS Client 5m

Let's take a look at the practice 5-7, which is also optional. Like I mentioned, optional practices, you do them only if you are done with all the rest of the practices. In this practice, we use a WS-MakeConnection with a JAX-WS client. Of course, we created the JAX-WS client, which uses the WS- extension, particularly, WS-MakeConnection.

So in this case, we'll go ahead and open the SlowCalculatorApp project, which, by the way, we already have it in NetBeans, SlowCalculatorApp, which was deployed. And then after that, we'll go ahead and create a new project called the SlowCalculator Enterprise Edition client. That's the one that we have here. And of course, we want to make sure that it uses JDK7. And of course, we use the WebLogic client gen and task instead of the WS import. And for that, we need to have this code, and then the bin.xml. Let's go ahead and take a look at that.

If I go to Favorites, and then open my bin.xml, I see that. That's in here. And we want to make sure that the bindings and the JAX-WS bindings, XML bindings, which is this one here, we need to also see this code, this code here that we see here. And this would be represented by, you know, I already opened this here. And as you see, its there.

And then we want to create a servlet called CalcServlet. And let me go back to the project and open that. So and this is the CalcServlet. Let me just go ahead and open it in full screen. So it's an HTTP servlet and annotated with the @WebServlet.

And then inside, we'll go ahead and use wsdlUrl and pass that to the CalculatorWSService to create a new instance of the service. And then get the instance of mcFeature. And then set the UseMcWithSyncInvoke to set to true. And then after that, invoke the getCalculatorWSPort with the mcFeature that get us an instance of the port.

And then after that, we'll go ahead and get an instance of the setContentType. Get an instance of the print output writer. And then in it, we'll go ahead and invoke the add method and pass 5, 10 to it. And then we'll go ahead and add 5 to 10.

Of course, to run the-- we'll just click a Run file. I did run it because it takes a little while to actually execute. So I already did that. And you will get the output, which is this one here, 15.

And then it'll tell you if you, now, go under in the NetBeans and set the VM option to the dump set it to true. And this is typically done under Tools. From it you select a Service. And then for the web service, you create a platform. And I already did the input. I already did that. So you guys are going to do this on the machine that you're working with.

Of course, this will actually allow you to see the polling of the WS-MakeConnection. If you put the output and then enter on the WebLogic server, you could actually see the polling here happening. That's pretty much what they want us to do for a practice 5-7, which is an optional one, like I mentioned. Thank you.

## Skill Check: Creating JAX-WS Clients - Score 80% or higher to pass

Skill Check: Creating JAX-WS Clients

View Skill Check
