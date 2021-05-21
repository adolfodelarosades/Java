# 9: Top-Down JAX-WS Web Services

   * Top-Down JAX-WS Web Services, Part 1 - 23m
   * Top-Down JAX-WS Web Services, Part 2 - 4m
   * Top-Down JAX-WS Web Services, Part 3 - 6m
   * Practice 9-1: Creating the Player Management Service - 10m
   * Skill Check: Top-Down JAX-WS Web Services - Score 80% or higher to pass

## Top-Down JAX-WS Web Services, Part 1 - 23m

Now that after we looked at the bottom-up, which is pretty much starting from Java and building Web Services, now we're going to do the other way. Now we're going to do a top-down JAX-WS Web Services, where in this case, when we are focusing more on the client side, where we deploy the application, or if you want to look at it this way, we deploy the application, and then we generated the WSDL file, and then we want to pass this WSDL file to the client so that the client will go ahead using the JAX-WS infrastructure, build a Web Service client to talk to the Web Service. That's what we are going to do.

So in this lesson, we're going to describe the benefits of the WSDL file first. We're going to look at generating a service and point from the WSDL file, implement the service endpoint interface, and customize the service endpoint generation, too. We also have the same concept. The way we customize from Java to WSDL, we also can do customization from WSDL to Java.

So the concept is pretty much the same. If you remember this slide, we also had it in the bottom-up too, where you generate the web service architects using the WSDL file, or you create a server endpoint and value classes. And of course, so you go ahead from them, configure them, and they would generate for you the WSDL file.

In either case, like we said, JAX-WS generates the majority of the infrastructure code by the service, except that this time what we are interested by in this case is this part, where we got the WSDL file from a partner, and now we pass it to the WS-Import to generate the whole artifacts for me, [INAUDIBLE] that, and of course create what we call a Web Service client.

So what are of course the benefits, strong typing of our web server, of the top-down? Recall fully worked WSDL file can specify data message types to the fine granularity using schema, XML schema and so forth, to be able to validate messages, content locally. Again, when you generate Java WSDL, in this case a WSDL file, or rather a generate Java from WSDL file, you can actually map strong XML types to Java, and validate those type using your generated code. Of course, when you do that using the WSDL file from Java, the generate tab as likely weaker.

So the benefits in this case of the top-down is that you work with the WSDL file. Why do we like that? Because WSDL is the preferred one when you are not the author of the application. I am not the author of all of the business application, but I want to be able to talk to this business application through Web Service. So what I do is I just take the WSDL file, and use my engine, and of course to handle the whole, and build all my Web Service client for me.

So the strong typing here is shared using a WSDL file. And of course in this case you can have also the client-side validation, which is easier to implement, because the WSDL file comes also with what? All of the XML schema that allow you to validate all type of XML documents.

So the concept is pretty much the same where you now given a, in this case, a WSDL file, you pass it to the WS-Import tool, and it will generate all the artifacts with you. Of course you would have a service endpoint interface, which is annotated with @WebService, and you will have also the implementation of the class that implements this at the interface, also annotated with the @WebService.

And of course you package that. And then after that, you will have again a [INAUDIBLE] or an error file on the client side, which by the way will be deployed and allow you to, of course, interact with the Web Service.

So the concept is pretty much the same. WSDL to Java, we still have the same thing where we have in the WSDL the types are mapped through JAXB to the different components. The port tab is mapped to the service endpoint interface. And the operations are mapped to the methods. Pretty much the same concept as we've seen in the top-down.

Same thing with SOAP by the way. If we take a look at SOAP, pretty much we have the same type of slides where in this case we have the JAX-WS mapping in this case where we can have in this case an OrderManager. And inside we have a submitOrder, which by the way represented here in this case [INAUDIBLE] inside, of course you have data that represents in this case the order. And this also is mapped to an object through the JAXB in this case, to a Java component inside on the Java side. Pretty much the same type of concept.

What we do in this case is we start with the WSDL file. So this is just a review of what we've seen earlier in the WSDL file, where you have your definitions. That would be the root of the WSDL file. The type. Specify what data type will be transmitted. Again, this is input or output.

The message would be what is the exact information that is expected. The portType would be specifying what type of operations or functions to be supported. This by the way, portType is always mapped to the Java class or the Web Service Java class, or the Web Service interface.

The binding specify how the transmission, in this case the transport protocol and the SOAP specification, in this case details. And the service again will define a collection of ports that make up the service, and of course where the service is located.

So let's see an example of this WSDL file from the component point of view. So we've seen that. We said that a service in this case. And if you take a look here, we have a service that has a collection of ports. And the port is always again in this case, for every port has a port type in this case.

And of course we do also have a binding. And a binding port again in this case binds support to a port type with a protocol details. Again, that would be the binding representing in this case the transport protocol and the details of the SOAP message.

And then a portType is always again has one or more in this case operations, or a collection of operations. Could be, by the way, zero or more in this case. And then of course the SOAP and the parameter.

Rather the operation here is associated with three type of messages-- the input message, the output message, and the fault. We added the fault here just in case the operation or the method in Java throws an operation, or the method itself has a SOAP fault in this case. We take a look at those tomorrow morning.

And every message can be made of one or more parts. Again, in this case, the message could be an input message that has more than one parameter that you are passing to the operation.

So here's an example of a WSDL file. So in this WSDL file, we have a definition stack. This again, this is the prologue of the WSDL File. This is the definitions root tag. These are all naming spaces that we use.

And then we have the type, which it represents again the type of data, which happened to be, by the way, represented by the XML schema called a PassengerManagerSchema.xsd. We'll see an example of that in a couple of slides.

After that, we have the message tags. [INAUDIBLE] the message, this represents the input message, which is the addPassengerRequest. That would be represented in Params, which most probably has some parameters inside. And the target namespace is addPassenger.

We have the response represented by also another message, which represents in this case the add response-- rather the addPassengerRequest, which has also a part which is in Params. And then of course the target namespace here would be addPassengerRequest.

And then we do have the port type. The port type again here is represented by a name PassengerManager. It has an operation called addPassenger, which has an input and an output in this case, which is the input message and the output message.

And then of course now we can see also in this case an example of what we call a WSDL file. So this WSDL file that we see, PassengerManagerSchema, we can actually see it here, the one that I'm showing here, this PassengerManagerSchema.xsd.

Let's go ahead and see this one. Here is the schema, where it has a root. Here a tag called xsd schema. The ID is PassengerManagerSchema. And then inside here we have the schema-- in this case implementation.

It happens that you have an element called addPassenger, which is made of a complex type. One is the first name and the other one is the last name. Now we know that a passenger that we're adding in this case has a first name and a last name.

And of course after that we have the binding. The binding here, we have a name binding, which is binded to the PassengerManager, which by the way the PassageManage it happen to be here a port type. So every port is mapped to a port type. That's why you see that.

And here we specify also the style, which is in this case document, and the transport protocol, which is HTTP. And of course for the operation, we have an addPassenger. And it has an input, which is a literal, and an output, which is a literal.

And then we have also the service representing the name of the PassengerManagerService. That's the one that is used for the client to create an instance of the service. And then of course in it it has in this case the port, which is in this case represented by the PassengerManager, which is the map to the port type. And then the address location of the, in this case, of the service.

So that's the one that we are going to feed to the WS-Import. And the WS-Import will generate all the R Java classes for us.

So that lead us to this example, or this slide if you want. Here's a WS-Import generated artifacts where we're running the WS-Import command, generates all the required Java WS artifacts. Artifacts means the Java classes.

These can be categorized, by the way, as the JAXB artifacts. First of all, every complex type, from again in this case, including the in the type section of the WSDL file, will have generated classes on the fly. Every input and output will have in the error fault message will have their JAXB classes represented for that.

We have the ObjectFactory area class. We have the package-info class. We've seen examples about that before. We have the ServiceName. That's the one that is used, by the way, by the client to create a service. And we have the PortTypeName, which by the way represents in this case the service endpoint interface.

And just to let you know a little bit about this JAX-WS API, and why is it that we're pushed a little bit to the concept of the RESTful Web Services. Let's see an example about this. This is quite interesting.

Imagine that we have a scenario here. And I just want to cover this here. Imagine we have a scenario that you have a single port with 10 operations, assuming each operation either receives a single complex type or returns one. So let's just see how many classes are generated for this.

So the number of classes generated by the WS-Import are what? One for the package-info, the second one for the ObjectFactory, then one for the ServiceName, then one for the PortTypeName, then 10 for the complex return object, and 10 for the input, and 10 for the output. Goodness. So how many clauses at the end? 34.

This is actually what made SOAP web services a little bit what? A little bit too heavy. And this is where we can see that obviously performance can be somewhat an issue in each case. We do have some best practices in this case about that. We'll talk a little bit later on when we get into security. But it's still an issue.

So in terms of generating the implementation artifacts, that pretty much quite simple. You use the WS-Import tool, which is a command line. And lots of time, by the way, people use, or developers use the WS-Import within a script, like an endscript or [INAUDIBLE] and so forth. So creating the web service from the WSDL file in NetBeans will run the WS-Import. The generated interface can be implemented on the server to build in this case the web service, and used on the client to invoke the web service.

Some of the options that we can use by the way here, or switches that we can use with the WS-Import is the minus d to specify the location where the files are generated, and the minus s-- this would be the classes generated. And the minus s specifying the location where the source files are generated. Again, you can use WS-Import either using, for example, directly in this case the indirectly the URL representing the WSDL file. Or you can use directly the name of the WSDL file in this case.

All right. So of course what we are interested by here is looking at some of the generated type of [INAUDIBLE]. So WSDL file, if you remember when we looked at the WSDL file, we had a port type in this case called PassengerManager. That's why there will be a service endpoint interface generated for us in this case, which is again is called a PassengerManager, which is mapped to the port type in the WSDL file.

And it's under the package com.example.generated. And it's annotated without Web Service. This is generated for us on the fly. The name is PassengerManager. The target namespace is Traveller.

And then of course, this interface has a method called addPassenger, which is annotated with @WebMethod. It has a web param. You see how now we have the @WebParam specifying the first name, because in the WSDL file we had, in the schema, we have the first name and the last name.

That's why you see them now. They're actually created with the WebParam. So the first name and then the last name. There, that's again annotation for the first name. And then there's an annotation also for the last name, where the WebParam here, the name is lastName.

Of course, this is the service endpoint interface. What we need in this case, lady and gentlemen, is an implementation of the class itself-- of the implementation rather of the interface itself.

So here it is. So this is the service implementation. So you see, the name is exactly the same, class Passenger, which implements this interface that we've seen in the previous page, this one here. So because it has in this case a method called addPassenger, which happens to be, by the way an abstract method. So that's why you have it here.

So this is addPassenger. Takes a first name and a last name, creates a new instance of the passenger with the first name and the last name, and then it creates by the way also an instance of the DAO, and then uses the DAO to insert that new instance of the passenger, in this case in the database. And of course we invoke the getId to get what? The ID of that passenger.

So that's the implementation. All of this, by the way, are generated for us. And you see the implementation now is annotated with @WebService with the endpoint interface, com.example.generated.PassengerManager-- which by the way is represented in the previous page. So that's all generated for us.

And of course, by the way, just like we did in Java to WSDL, we did a bunch of customization, you remember. Guess what? The same thing here. We can go ahead, and the package name when generated class will be placed, and then the name. We can go ahead and customize the name for the type of the generator for the WS port, the name of the method, and so forth.

There are a couple of ways to customize this, to do this customization. One is using the embedded declaration within the WSDL file itself. And the other one is using it in a separate file. We are going to see examples that use the embedded declaration, the separate file you just put them inside the separate file. Let's go ahead and see these.

So here's the example of the embedded customization. So in this case, we wanted to customize what? The package name. If you want to customize the package name from the WSDL file, here's how you do it. You use this, a tags, jaxws bindings, with a target namespace.

And then of course that's the opening tag. This the closing tag. And in it you use the JAX-WS package. And then you specify the name of the package. If you know what you're doing, if you want the package to be named com.example.custom, that's exactly what is going to happen. And this is exactly what's generated.

You can also, by the way, customize also what? The class name. If I want to again embedded customization, if I want to customize, again, I use the JAX-WS bindings. In it I use the JAX-WS class, and I specify that it's going to be CustomManager. So instead of having the name, in this case of the operation, differently than in this case, the one that is generated by default, here I want it to be CustomManager.

I also can customize the method, too, the method name. Here for example, I wanted the method not to be addPassenger, but I want it to be what? Add.

So exactly like what I did here. The class name, I do not want it to be CustomManagerPassenger-- or rather Manager. I want it to be a CustomManager. So the same thing in here. If I wanted to use add instead of addPassenger, I'll go ahead and customize it this way using the jaxws binding. And then of course, all of this is embedded inside what? Inside your WSDL file. Right?

And by the way, after all this customization here, from the package name to the class name to the method name, then using this WSDL file, and passing it to my, in this case, with using this WSDL file and passing it to my WSDL file the classes that are going to be generated for me, let me just show you that class in this case. And this is what generated for me.

This is again a code generated from the customized WSDL file, where now my again, in this case package will be com.example.custom. And that's because of this one here, which is com.example.custom. That's exactly what I want.

And then after that, I have my interface to be what? CustomManager. And that's due to the customization that I put down here instead of having this name.

And then the next one is the operation name, which happens to be add here, instead of what? Instead of addPassenger. And that's pretty much how I do that, too, here. So as you see, it's pretty much a straightforward. So the top-down and bottom-up are pretty much they work in the opposite way. But the concept is pretty much the same in this case.

And by the way we just also want to let you know that the JAX-WS will not invalidate the web server codes against the XML schema constraint, unless requested. So if you want now in this case to handle this schema validation, then let me just show you that as an example.

So this schema validation, by the way, in this case which is again in Java. And then, of course, we can see actually the validation here. And then let me just [INAUDIBLE] Java EE and see if I can get it. And yes. So that's schema validation. So that's pretty much the note.

There is the firewalls. But you can actually look at it from your web browser, and you can actually read about it, pretty much. It's quite simple. So if you want. So because JAX-WS will not validate the web service against the XML schema constraint unless you do what? Unless you specify that.

If you want your schema to be validated, then you just add the annotation addSchemaValidation on your class, which happens to be a web service-- in this case a SOAP web service. And then you add this addSchemaValidation. And that automatically will validate your, in this case, your XML.

If there is no schema validation, then JAX-WS will not do that for you, unless you specify that in your application. You can go ahead and specify, write some code to say, hey, [INAUDIBLE] my application side, I want to handle this validation on the side. But you have to do that by hand. It would be nice to have the JAX-WS do that for you automatically. And that if you use the addSchemaValidation, then of course that would be done.

## Top-Down JAX-WS Web Services, Part 2 - 4m

So now that we've, of course, looked at the bottom-up and the top-down, of course, there is always that question of comparing the development approaches. So every development approach has its own benefits and costs, and of course, it is best-suited for your specific scenarios. And the idea here by specific scenarios, if now on the board if I do have an existing enterprise application and I want to expose this as a web service, then I'll go ahead and just use the annotation to expose the classes that I want to expose as a web service. Plus in addition, Now we can also have a choice to expose the methods that I want to expose as a web service, and the one that I do not want, I'll just go ahead and use the [INAUDIBLE] set to true, and I do not expose them.

That's, again, a scenario. But if I am a client and I did not implement the application but then I want to talk to this application, then in that case, it would be nice to get the WSDL file, and from there, I'll just pass it to the WS import. And it will go ahead, the whole thing will be generated for me so that I can go ahead and do business with my partner.

So again, you should decide on a specific development approach based on the needs and the development efforts, and that's pretty much what we wanted to say about this lecture. So we do have, we finish always with a couple of quizzes. Here it says when using a top-down development approach to create the SOAP endpoints, the resulting method names are determined solely by the WSDL file. And then here again, this [INAUDIBLE] of course, that's not true. That's false, in this case.

And the second one is to generate the service endpoint interface from the WSDL file, you should use again in this case what? The wsimport.

And that's pretty much what we wanted to say here about this lesson. Of course, always we finish with a bunch of URLs just for additional resources, readings for that. So again, here the whole idea behind going through the bottom-up and the top-down from the JAR-WS web services just to again look at different scenarios.

When I have an existing application, when I expose it as a web service, I'll go ahead and configure that as with annotation as a web service, which is a SOAP service. And then of course if I do want to interact with an existing application, we'll just go ahead and use the WSDL file generated from the other part, use it, and of course generate the web service client and work with it.

And like I mentioned earlier, lots of times you want to maybe use just the web container just because you have now the choice to use the embedded EJB container inside. That allows you, of course, to use in this case session beans as service endpoints, and you can go ahead and use EJBs have the advantage of getting all the services from in this case the application, in this case the embedded EJB container in terms of concurrency and so forth. And that's pretty much what we wanted to discuss about this lecture. Thanks.

## Top-Down JAX-WS Web Services, Part 3 - 6m

Now that we're done with this lesson, lesson 9, where we cover the top-down JAX-WS web services, where in this case we start with the WSDL file and you generate your Java artifacts, classes related to the web service client, JAX-WS web service client, let's go ahead and take a look at some of the practices for this lesson. So in practice 1, what we are going to do is create the player management service. Again, in the previous practice, practice 8.1, we created the card game service where we created a SOAP service that provides the building blocks of games, pile management, and so forth.

In this practice, what you folks are going to do is you will create a player management service by itself. Of course, the card game service, we know, only keeps track of the cards. Something needs to keep track of the players, which players are in the game, the win-loss record, which hand pile belongs to which player, and so on. So the player management service will keep track of all this information.

So in this practice, you will create the player management service with a top-down WSDL first approach using the bottom-up code first approach or seen again, in this case in 8.1, is typically the preferred approach and easier to realize just for Java developers. However, sometimes you must start with the WSDL file first. The most common reason is when reimplementing an existing web service in a new programming language.

So when using a top-down approach, the WSDL file that is used to implement the Java-based web service must conform to the features that are provided by the JAX-WS stack. For example, the service would use the document literal a rapid style to be WS Basic compliant. In this practice, you will be supplied with an EJB that can manage users and groups that are stored in the WebLogic server.

Java EE application server provides standard mechanisms to, of course, restrict resources access and read a principal role in group information. But of course I have no standard way to provision users and groups. WebLogic server uses an internal LDAP, in this case, server to store user information by default. Normally, to manage users and groups in this LDAP server you must go to the WebLogic Administration Console.

The provided EJB uses JMX and Beans provided by the WebLogic server to, of course, create an application level programming interface. In this practice, you will use the LDAP server as a simple data store. Later practices you will read the information placed in the LDAP server to provide authentication and authorization by using standard Java EE security mechanisms.

So in this practice you will go ahead and assume that you are done with lab 8.1, where we created the card game service that is all done and completed, and you start with your NetBeans. First of all, you are going to create a BEA utility server library. Again, the provided user management EJB uses classes that are available when running in WebLogic server but are not typically included in the NetBeans project.

So you open your tools and you go ahead and create, in this case, a library, a new library. And, of course, it's going to called BEA Utils. And, of course, it will be a server library. And then we'll go ahead and add, in this case, the library which is com.bea.core.utils_2.0.0.0.jav.

And then once you're done with that, then you open your user manager project in exercise lab number 9 and run that project. And then after that, you will go ahead and deploy it and use the browser to see all the lists of the users and groups. And then, of course, after that, you view the users and groups with the WebLogic using the admin console. And then after that, you go ahead and view the WLS authentication test servlet again.

So we switch back to NetBeans to see that. You inject an EJB over there. And you get to this code here. And then after that, of course, you explore the WS area JMX management session bean just to kind of see.

You view, of course, the UserManagement.wsdl file. You create the player management service using the existing WSDL file. You, of course, complete the player management service class. And you go ahead and create, and build, and deploy your project, test your user management service. In this case, we give you some information to test all of that.

There are, of course, a couple of problems with this web service currently. Clients have no idea if an exception occurs on the server side. So in a later practice we'll explore how exceptions are handled by web services. We'll do that tomorrow.

And, of course, security is non-existent in this case. Anyone that can connect to the web service can actually modify or delete almost any information, except that the values I have coded to be non-editable in the EJB. So in a later practice we'll look at securing these web services. And that's pretty much what we wanted to say about the practices of lesson 9. So go ahead and try these. Thank you.

## Practice 9-1: Creating the Player Management Service - 10m

After you're done with the lecturing of lesson nine, which is top-down JAX-WS web services, now we're going to take a look at practice 9-1. So in the previous practice, which is 8-1, we created the card game service. And we created a SOAP service that provides the building blocks of card games by management.

In this practice, what we want to do is create a player management service. Again, by itself, the card game service only keeps track of the cards. Something needs to keep track of the players, which players are, of course, in the game. So the win, loss record, which hand belongs to which player, and so on. So the player management service will keep track of all of this information.

Of course in this practice, we will create the player management service with a top-down WSDL first approach. Using the bottom-up code first approach, as seen in practice 8-1, is typically the preferred approach, and is easier to realize for Java developers. However, sometimes you must start with the WSDL first. Again, the most common reason is when re-implementing an existing web service is a new programming language. In this case, in a new programming language.

When using a top-down approach, the WSDL file that is used to implement the Java-based web service must conform to the features that are provided by your JAX-WS stack. Of course, for example, the service should use the document [? literal ?] wrapped style and the WS basic compliant. Of course for this practice, we will be supplied in this case with an EJB that can manage users and groups that are stored in a WebLogic server.

And of course, the Java EE application servers provide standard mechanism to restrict resource access and read principal role and group information, but have no standard way to provision users and groups. WebLogic server uses an internal LDAP server to store user information by default. Normally to manage users and groups in an LDAP server, you must go to the WebLogic Administration Console. The provided EJB uses the JMX and beans provided by the WebLogic server to create an application that will [? program ?] [? the ?] interface. Of course in this practice, you will use the LDAP server as simple data store. Later practices, you will read the information placed in the LDAP server to perform authentication and authorization by using standard Java EE security mechanism.

So of course, in this particular practice, we first of all have to add a library that's called the BEA Utils library. So of course, the provided user management EJB users classes that are available when running in WebLogic server, but not typically included in [INAUDIBLE] project. So we'll go ahead and add this library, which is called com.bea.core.utils_2.0.0.0.jar. And of course this is done through [? net ?] [? beans ?]. I already did it under the tools library, and of course you see here it's BEA. And that's what I did [? under ?] the server library. So it's all done in this case.

All right, and of course after that they want us to open the project, in this case, user manager, and of course run it. And that's what I have done. [? My ?] user manager run it. And of course once we run it, we'll go ahead now and in this case, and that's what I typically-- let me just show you how I actually run these. And here's the browser what I got. So under the [? WLS ?] authentication test servlet, and that's the users and the groups that we have here. We can, by the way, find these also under the, in this case, web service in this case under the security [? runs ?] and the web service admin console. And then from there, we got into the-- in this case, the users and groups. So here are the users and here are the groups.

And that's what we have in this case as a list. In our case here, there are some lists there. We can see it on the WebLogic admin console, and of course on the WS authentication servlet also, test servlet that we see here.

Of course, they want us to view the WS authentication test servlet in NetBeans. And that's the one that we have here. And let me just show it to you in a full screen. So this is a servlet, an HTTP servlet annotated with @WebServlet. It has a logger in this case, and it makes use of an instance of WLS JMX management session bean that was given to us.

And of course, in this WS servlet, WS authentication test servlet, [? and there ?] of course, in this case, the [? print ln ?] [? within the try. ?] That's the code that they asked us to add, as you see here. And of course, we do have a WLS JMX management session bean that was given to us. This is the one. And let's go ahead and take a look at that, which is an EJB.

So it is a stateless session bean. Runs as an admin in this case. It has a logger, an object service, and an MBean server. And then with the try, we'll go ahead and get a new instance of the service. And it has an init here that get, of course, the local MBean server. And it has the MBean server connection which is returned by the getRemote MBean server. That takes a host and, of course, in this case, a postString.

We have the Get Local Bean Server. We have the Get User Editor. This is all given to us, by the way.

Get Group Editors. Get Group User [? Lister ?]. Get Member Group [? Lister. ?] Get Authentication Providers.

Create a user. Get to User Description. Get a User Description-- Set a User Description, rather. Remove a User. Reset a User Password.

Does User Exist. Get User List. Add User to Group. Remove a User from Group.

Is User in Group. Create a Group. Get a Group Description. Set a Group Description.

Remove Group. Does Group Exist. Get Groups by Pattern. Get Group Members. Get Member Groups. And all of this, again, as you see here, it's all given to us.

Of course, we also do make use of a class code, in this case, player management service, which is under [INAUDIBLE]. This is the one. So this is a web service, as you see here. And makes use of the WLS JMX management session bean EJB.

It has Create a Group, Create a User, Delete a Group, Delete a User, Get Group Description, Get User Description, and Set the Password, Set Group Description, Set a User Description, Check Group Membership, List Join Group, List Groups by Pattern, List Groups, Join Group, Leave Group, Is Group Present, List Group Members, List Users. These are again, this is the class that we're using in this case.

And of course, after that they want us to deploy the application and then test it. So when we test it, in this case, we do have in this case a test client. It happens in this case I created the user Bob with the password welcome and description Robert. And that's what I have done.

And that's pretty much-- so that's the request, and that's the response, which shows that in this case it's created. Of course, you can do other kinds of operations, try all of them. The one that I used is here, Create User. And that's pretty much what they want us to do in practice 9-1. Thank you.

## Skill Check: Top-Down JAX-WS Web Services - Score 80% or higher to pass

Skill Check: Top-Down JAX-WS Web Services

View Skill Check
