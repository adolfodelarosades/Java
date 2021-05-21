# 10: JAX-RS RESTful Web Services

   * JAX-RS RESTful Web Services: Part 1 - 31m
   * JAX-RS RESTful Web Services: Part 2 - 31m
   * JAX-RS RESTful Web Services: Part 3 - 9m
   * Practice 10-1: The Rules of Indian Rummy - 2m
   * Practice 10-2: Creating the Indian Rummy Web Service Project - 8m
   * Practice 10-3: Creating the Indian Rummy Game Creation REST Resources - 8m
   * Practice 10-4: Using JSON as a Data Interchange Format - 5m
   * Practice 10-5: Completing the Indian Rummy Logic - 2m
   * Skill Check: JAX-RS RESTful Web Services - Score 80% or higher to pass

## JAX-RS RESTful Web Services: Part 1 - 31m

So now after we've done all the implementation of these JAX-WS web services, we went through the bottom up and then to the top down and we looked at the whole plumbing and the whole machinery off those JAX-WS web services. Now let's take a peek at the JAX-RS RESTful web services.

Here, of course, we need that installation. You folks already went through the download and install of the Jersey library. We're going to create application subclasses, create resource classes, create resource methods and sub-resource methods and sub-resource method locators too, and of course produce and consume XML and JSON. OK

So what we've done is again in this case for the JAX-RS API, we said that there is a JAX-RS API, and it's only on the service side. We're going to take a peek in this lesson. But we already have done the RESTful client, and that was using the OAR connection and of course the Jersey API that we've seen yesterday.

So right now, we wanted to create a RESTful web service using the JAX-RS service so that we can go ahead and interact with it from a RESTful client in this case. So that's what we're going to do.

So of course, what we need to start with in this case, for example, in your case, because you have that Tomcat Server in this case, or it could be a WebLogic server, or it could be a GlassFish, you need first of all to download the reference implementation, which is the library that supports the JAX-RS. That would be the JAX-RS reference implementation. And Jersey supports the implementation of RESTful web services. JAX-RS is based on the JSR-311, which is the Java specification request implementation, which specifies, by the way, only the server side in this case, REST API, that's all.

So you have an add on for a servlet container that the Java EE web profile servers in this case formed, or the Java web profile server. In fact, for the labs, we're using the Java web server, web profile servers. That's what we're using. Of course, client library is using the Jersey API that we've seen yesterday. So And it has a bunch of extensions. We'll take a look at that.

It turned out by the way that the JAX-RS API alone is not enough. So if you remember, when we did the JAX-WS, we said that there are some extensions that help in the interoperability. REST also has, JAX-RS API has, a bunch of helpers. They're called providers. We'll cover these in this lesson.

So first, you have to update your version of the Jersey on your WebLogic server. Again, the one that-- of course the WebLogic Server now uses the latest one. But when we did these labs, it includes the Jersey 1.9. So we wanted to update this to the Jersey 1.17, and that's what you folks have done in one of the labs. That's where you went through the installation, and add all those Jersey libraries, and of course set up the class loading features and so forth.

So first, you need to create a WebLogic shared library. This, again, shared libraries can be used by an application deployed to the server and application request shared library. Again the steps to follow all of that, you create an EE module, like a WAR file.

You add the library jar files, that, and you create your manifest file. And now using that Jersey wherever extension here is 1.17. And then you configure your weblogic.xml to handle that. And then you deploy, of course, your library module using the admin console, and you've done that in one of the labs.

Of course, once we were done and installed all of the shared libraries that will be useful to us for the JAX-RS, the Jersey JAX-RS, now, of course, we assume that the WebLogic shared libraries have been deployed to the server, and we can go ahead and obtain information from the manifest.mf. And of course, in your application, you add a library reference element in the weblogic.xml, and you folks have added this in one of the labs. And now, talking about these web services.

Well, we said that web services, or RESTful web services, are nothing but a bunch of resources. And of course, these are pretty much the primary if you want component of RESTful web service would be a resource. Resource, by the way, is a thing or a noun. It is located through a URL. Resource is realized using the JAX-RS annotated class.

Now we are going to learn about new annotations that help us build or configure a class, or a Java class, as a RESTful web service. So these JAX-RS annotated classes contain a bunch of methods. Each of them, again, are supported by the HTTP protocol. JAX-RS resources support consuming and producing XML and JSON components by using, of course, the JAXB. The JAXB is the one that help us marshal and un-marshal Java component, XML to Java, and Java to XML.

So ah, now let's go ahead and introduce the concept of the configuration of a class to represent what we call in this case a RESTful web service. So to begin, you must, again, in this case create a route resource class. And here, for example, I do have a class called message.

And of course, we annotate that class with what? @Path. Anybody has seen @Path before? So @Path, and that specifies that the class is, of course, now represents what we call a web service.

And then if you take a look here, we also in between parentheses, we added in between double quote the name message. That actually would be a name that you are going to use in the URL to actually access the resource. That's how we represent that. This is pretty much how you use the @Path. And then what's in between? That of course it does not matter if you use a forward slash or no forward slash.

Here, it turns out that this class has a message, which is static message, static variable, that again, initialized with the string "Today's word is JAVA." And then it has a getMessage. And if you take a look here, you will see that there is an annotation in this case using @GET. It turns out, folks, that the JAX-RS API locates-- or the JAX-RS machinery if you want-- locates methods by the HTTP method annotation and not by the name of the method.

So it's not by this name of the method, but by the annotation @GET, which actually is quite interesting. So if JAX-RS recognizes or locates the methods by using the annotation @GET and @PUT and so forth. So the question that you might have in this case is how about if I have more than one get method? So how do we-- they both have @GET-- how does now JAX-RS differentiate between the two? We'll take a look at one of the slides later on in this.

Moving along and now calling this simple resource in this case or root resource, which is in this case nothing but a URL. So resource classes are packaged into web application archives, WAR files. That's what you folks have done in the labs, and that's what typically we do just by using the web profile, which by the way pretty much dedicated to a web service like Apache Tomcat, or a web container of GlassFish, or a web container of WebLogic and so forth. So the context path of the WAR determines a path of the URL, and you see it here where you have HTTP, host, port, and then the WAR file would be the WAR context file.

The default, by the way, is the project name, WAR file name. You can override that in the web.xml. And after that, you have the default path of the automatically configured for Jersey servlet. That's the resources. That's the automatic one that we use typically.

And then the next one is the value in the @Path. And if you remember, in the class, we us the message, and that's why we're using message here. And as I said earlier, this will identify the resource that you're calling. Carrying

Moving along and continuing with this, ah, you remember earlier I said how about if your class, or RESTful web service class, has more than one GET method? Here's a good example where in this case, I have a resource class annotated with @Path. And it contains, of course, a couple of, in this case, a resource method.

These resource method are, of course, in this case, marked with the @PUT and @GET. So one is the GET message that returns a string. That's why we have the @GET in front of it. And then the other one is we have the @PUT, which pretty much in this case texts a message and uses the set method to, of course, use that message to initialize the message of the current object, or the field of the current object.

So it turned out that the RESTful web services make use of the HTTP method annotations. @GET is a safe and idempotent method that retrieves information. @PUT is idempotent method that adds a known identity or updates a resource. @DELETE is an idempotent method that deletes a resource. @POST, on the other hand, it is a non-idempotent method that adds a new instance.

@HEAD automatically supported calls your GET method and drops the body-- in this case, [INAUDIBLE]. And then OPTIONS is automatically supported. This is a response with an allowed header showing which HTTP methods are supported for a given URL and includes, of course, that will be included in the WADL file or the WADL body.

Now looking at the content type. It turns out that if you have a web service, that has two methods, GET methods. So for example, here I have a GET message, which happens to return a TEXT_PLAIN message. And then I have another one, getHtmlMessage, which happens to return an HTML, in this case, document.

So here, I am returning a TEXT_PLAIN message and a TEXT_HTML message. So how does, for example, now the JAX-RS recognize one of these GET method? Because both of them has the @GET, in this case, the @GET annotation.

So both methods have the @GET, so the accept header is the one that is used to determine which method gets called, which means in this case, we added this @Produces with this one here produces the TEXT_PLAIN type of a message. And this one produces the text HTML.

So in the header, once you specify the content type, that's where the JAX-RS knows if it's calling this method or this method, even though they're annotated with @GET. So what actually helps here is that the content, in this case, which is inside the header, that or the accept header, which is used to determine in this case the method that gets caught. So it turns out that we can use these annotations, which are @Produces and @Consumes-- and by the way, we can see these also inside the package javax.ws.rs.

You have all these annotations that you can use here, and here's the path that I was talking about. So this identifies the URL path-- in this case, that resource class or method will, again, in this case serve a request for. And you say class. So far you say it on the class, but we're going to see it on a method, too. If we put it on a method, that means that method returns what we call a sub-resource. We'll take a look at that later on.

And then, of course, we have the @Produces and @Consumes. Here's @Produces, which defines the media type that the method of resource class, in this case, can produce. And then you also have the @Consumes, which also defines the media type of resource that in the message, again, [INAUDIBLE] reader can accept in this case. So all these annotations that are actually part of the JAX-RS API.

So continuing with that and looking now at the @Produces and-- these @Produces and @Consumes annotations may be placed at a class level or at a-- which means would be to define the default for all the class methods. Or you can add it at the method level to override, in this case, the class level default. A method may, by the way, produce and consume. You can actually have a method that takes a parameter and returns a parameter too.

So in that case, you can go ahead and use that. And by the way, @Produce and @Consumes annotations expect a string array for their values. So you can actually-- for example, here, you can produce more than one type and you can consume more than a type. We always like to use the media type-- in this case constants, which is TEXT_HTML or TEXT_PLAIN just to avoid typos if we make any type of typos.

Now, Consuming Content. Clients may place data. So that's it clients, for example, in this case, what I'm trying to get at is a client wants to, in this case, pass data to the service. If the client wants to pass data to service, then because the JAX-RS API or RESTful web services make use of the HTTP, in this case, technology, then in that case, we can go ahead and handle that by saying the clients may place data in several different areas of an HTTP request.

And the idea is here is I want to pass this message here. I use the @PUT here, and I know I have to pass this message to the setMessage of my RESTful web service. And in that case, I can go ahead and pass it in this case as an HTTP body parameter, or a matrix parameter, or query parameters, or path parameters, or header parameters, or cookie parameters. All these are mechanism by which we can pass data to the web service.

Ah, Now what we said when we explained the RESTful web services, we said that in general, we get the root link. And then after that, you can go ahead and get to the next resource and the next next resource and so forth. But the concept of progressive disclosure-- and how do we now implement that from the RESTful web service point of view? That will actually allow [INAUDIBLE] now to create the concept of sub-resource.

Here's an example of where I can use a sub-resource. Here I have a class called messages, with an S, which means most probably returned more than one message. It actually has an array of messages, list of strings. And then here, I have a method called GET message here. And what I want to do here is I want to annotate with @GET, which means it returns a string.

And then I annotate this with @Path and then the ID. That ID represents what we call a template parameter. I can pass a template parameter as an ID to actually do what? Show that I can use @Path param ID that is applied to the integer ID that I'm passing here so that I can get to the messages array list and pass the ID to the GET method to the list so that I can return a particular message.

Here, what I'm doing is I'm getting a sub-resource. A sub-resource would be what? Would be an element of the list. OK I can even do better. I can do something like this, for example-- @Path state, city, mayor, which means in this case, I have a-- this annotation can contain any number of template parameters. In this case, I put the parameter mayor and city and state. It's like the mayor of Boston of the state or Massachusetts, or the mayor of Chicago of the state of Illinois, for example. That's the example here.

So now, what we found out in this case late in judgment is that if you want a method to get your sub resource, then in that case, you need to annotate it with what? @Path. That's what it is. So we said that we can query and other parameters types. There's query parameters follow, again, a question mark for the query parameters or matrix parameters they used here. The used the @QueryParam.

And then they followed the question mark that you see here. The @MatrixParam follow the semicolon. The header parameter, But in this case, follow the value key, the key value pair, that you have in this case. The cookie parameter value again always specify the, again, same thing, key value name with a cookie. And then, of course, the form parameter which makes use of a form in this case. You see key value pair, ampersand, key value pair, and so forth.

So this is just, again, known in HTTP, and this is just showing you how you pass parameters to the web service. Ah. Now we can use even a generic way to get to a sub-resource. We always tell you, do not handle all the URLs in a single root class. That's a bad idea, especially if it contains lots and lots of data. Like in the example that we've seen earlier, imagine that this messages list is a huge list. What we can do in this case is we delegate this to a sub resource class by using what we call a locator method.

Here's an example. I do have a class called myClass. That's a root class. It is a RESTful web service because of the annotations that I see here. And then down here, I do have another method called sub-resource locator method, and I annotate it with what? @Path, and then I pass to it the template parameter here, which is called subresource2.

And then what this one will do, we'll go ahead and create an instance of someClass, which is defined somewhere else. And then of course, return that someClass. So here, that someClass is another component or another resource that has the, again, a resource method, whatever it has inside.

And I can go ahead and use a subResource parameter to get me a new instance of that subResource in this case. So this is how we actually show the progressive disclosure of the information of all the resources. That's pretty much how we do it.

And in terms of JAXB and XML with JAX-RS, JAX-RS basically uses JAXB underneath the hood. JAXB is the one that is used to receive and return complex types. You can annotate classes, again, for the JAXB, like the example that I've seen when we looked at the JAXB lecture. And we have @XmlRootElement and so on.

And then of course, the resources should produce and consume, in this case, application/xms. So I can go ahead and specify this with produces or @Consumes. It all depends if I am consuming or rather if using @Consumes or @Produces.

And the good thing about this, maybe in judgment, is that the JAX-RS has a native support for the JAXB object. Nothing else is required. It's all done underneath the hood quickly and fast, and of course, in a robust way.

So the question that we have here is if I have a sub-resource or other resource, that I can go ahead and use the @Path to represent that, no problem. Imagine now I have more than one class representing different resources at the same level. So how do I now built that what we call RESTful application?

Well, it turned out that the API now created a new class called an application class. And this application class defines the resources and the providers that make up your RESTful application. That's what it is.

So so far, we're going to look at resources. I'll show you providers later on. When I started lecturing earlier, I said that JAX-RS also can extend its capabilities through providers. We'll take a look at that later on. In fact, we're going to see an entity provider, an example, a full example of an entity provider.

But before that, I just want to show here that we do have-- we actually can build an application, a RESTful application, using this application class. Do not know if you have seen this before. And well, let me just show you that in the API first.

So in the API, we do have under the Java EE 6 , we have this class application. This class application defines the components of the JAX-RS application and supplier additional meta data. This again application or implementation supplies a concrete subclass of this, again-- a concrete subclass of this abstract class. So this class application, which has by the way the methods, here are the method that it has. It has get classes that allow you to get a set of classes that represent what?

The resources. And it had getSingletons. GetSingletons allow you to return instances of providers, because providers are singletons. OK So that's the idea behind this.

So let me go ahead and in this case share with you an example. So the JAX-RS implementation Jersey supplies that default application. And to customize the resources providers and their life cycle, you should, again, supply an application subclass of that application. And of course, your sub-application can be a POJO.

It can be a singleton session bean. It could be a stateless session bean. All of this can be-- or a CDI bean. By the way, CDI bean means context and dependency injection bean, which is a managed bean for a JSF component. JSF components have managed beans that allow you to talk to the business tier.

I could be, for example, using here as an example, if I was using JSF technology, then I could be using, for example, in here what we call a-- let me just put that into green just to represent this servlet. So I can have here what we call-- I can configure what we call a faces servlet.

And then this face servlet, I can do an HTTP call on this one here. This actually now will call a JSF component, or what we call a facelet starting JSF 2.0. And the JSF itself uses what we call a managed bean, which by the way allow you to call the business tier.

This is why we say JSF 2.0 is pure MVC, because there is no way you can embed Java inside JSF. It has to be always in the managed bean or in the servlet. So that's why this is, again, the new framework or the update of the JSF framework, which actually many, many people use to build web applications.

And the good thing about this is that you can combine JSF AJAX enabled with asynchronous servlets, and you can actually achieve the server push technology in the B2C interaction where you can do on call, one asynchronous call, and then when the server can keep on updating that information in your, in this case, browser. So that's what we mean.

And by the way, we can use-- so we can use these MDBs in this case as resources for web services. We call them CDI beans, context and dependency injection beans. Moving along. And now let's see, of course, an example. So here's an example. Take a look.

This is my name of my application. I've decided to name it application. And it extends this abstract application. This is exactly what we have seen.

We said we define the components of an application that supplies additional meta data. This JAX-RS application or implementation supplies a concrete subclass of this abstract class that we have here that has two abstract methods here that happen to be called GET classes and GET singletons. Let's go ahead and see that.

So here, this application, extends Application, which ends up, by the way, [INAUDIBLE] my application overriding the getClasses and the getSingleton. In the getClasses here, because if you remember I already built one resource, and that resource that I built is called a message-- that was at the beginning-- the message class, if you remember, or the messages. We had a message class RESTful resource, and we have also the messages resource. In And then here's my messages resource.

Let's go back to my application. So here, look what I've done. So in my getClass, getClasses-- which by the way returns of what? Set Classes. Everybody understands the question mark.

That's generics, which means it's the wild card, any type. So here, I'll go ahead and initialize-- declare a classes reference supplementation to Set Classes, and then initialize with the New HashSet.

And then after that, I'll use the Add method to add my messages class that I already built here. This is the messages class that I've built here, not this one here, but this one here. So now, I'm adding it to my set so that I could return that, which means I can add as many classes as I want that do return what? They all represent different resources.

So the idea here, folks, is that I am creating my application. This is my application is RESTful web applications that allow me to have as many classes representing different resources. And the way I get those classes is by using the GET class, classes, where I create a set of these classes.

And then after that, I'll use the Add to add any class that I have over there. Here, it turned out that I have only one called messages.class for the purpose of the lecture. And of course, I returned that set, classes. And you can return as many as you want.

You also, by the way, have another method, getSingleton. This singleton, we'll go ahead and in this case return-- right now, it's returning only a superclass of the singleton. But of course later on, you will see that you can have providers that you could return also here as a set of objects representing the providers that are helpers to the JAX-RS API.

And by the way, this application is annotated without what? @ApplicationsPath. And to call it, it's in this case, I use the name resources. So now, if you have an application like this that extends application, you always annotate with @Application path, which by the way, it's this one here.

It's the @Application path that identifies the application that serves as the base UI for all the resource UIs provided by the path. So this is the annotations that we are using. And that's the one that is pretty much that we are using here to annotate that application, or that RESTful application.

All right, everybody get the idea here? So far so good? OK, good, good, good, good, good, good. All right, moving along and continuing with the, again in this case, with the RESTful web services.

Now of course, you need to configure this application. So we configure the application inside what? We configure it inside the web.xml configuration. So here, you have your servlet, and then you have the servlet name, which is application, that we have. And then the servlet class, in this case, is the servlet container. Again, this represents what we call here the JAX-RS servlet that is created for you here.

In web applications, when you build, for example, a stretch framework, when you use a stretch framework to build your web application, you have to call this. If you were to build the web application using a JSF framework, you configure this, the FacesServlet If you were to use a RESTful web service, you configure this JAX-RS servlet, and here's how we see it now on the slide.

And then you use the init-param to now configure your application. The param name is javax.ws.rs.Application, and the value of that is your application that is under the package OU, which by the way, it's this one here. OK That's how we configure this.

## JAX-RS RESTful Web Services: Part 2 - 31m

Well, we also want to add also that JAXB and JSON can be used also with JAX-RS. The Jersey supports again using Jackson library, similar to what we've seen before, to marshal and unmarshal JSON using JAXB. With the Jackson library, by the way, on the class path, it just works without any problem.

So you annotate your classes with @RootElement et cetera like we've seen that in the-- and by the way, resources in this case should produce and consume your JSON application without any problem. If you want to in this case configure that you are producing or consuming that with the produces and consumes JSON, you just do it this way-- MediaType APPLICATION_JSON or MediaType APPLICATION in the JSON for consumes and produces. You can still use this one also. This is acceptable.

Lots of times, we advise you to use this one here. It's just to avoid typos, that's all, because this exists. This actually exists in the API. You can produce and consume JSON and XML within the same method without any problem.

And by the way, we have the same concept about the status. So all methods mapped to the HTTP method result, of course, in the return numeric status, and those again return void or null results in the 204, or simple and JAXB return types result in a 200 OK status. Exceptions are the 400 to the 500-- the 400 on the client side, the 500 on the server side.

To control that response value, again, we should use that response here that returns, again, in this case as the return type of the methods. And by the way, we do have this here in the API. I just actually represent that. It's the one that I have. It's class that I have.

And if you take a look here, it has pretty much a response status that has all the different, in this case, enumeration of the constants that we have-- the constant value and of course the number. Accepted, bad request, 400, conflict 409, created 201, forbidden 403, and so forth. So we've got a whole list of that.

All right. And of course, a large number of methods will use this return type. And of course, response can include a simple and a complex JAXB data if you want to, by the way, looking for the load in this case. So here's an example where we actually do have here a set, a message, that takes a message. And Consumes, in this case, TEXT_PLAIN returns a response. And then of course here, we have the messages where we put the index in the messaging side and you go ahead and create a URI in this case.

And here, you'll pretty much use in the created method. That takes URI, returns a responseBuilder, and then you return that build. If you want to, for example, here-- this is, by the way, is a shortcut for statusResponse.Status.CREATED. If you want to see a good example, we can see this one here, like a more elaborate type of example.

Here's an example where I have a getMsg method that returns, by the way, a resource here. It takes an ID as a template parameter and then uses that to access the messages list and returns the message. Here, I'll go ahead and get a reference to a responseBuilder. And then in it, I save the message equal to null.

Then I'll go ahead and set the response builder to response dot Status dot-- again in this case-- response.Status.NOT_FOUND. Else, I'll go ahead and do a response.ok and [INAUDIBLE] the message. And then, of course, after that we build the response and then we return it.

So again, part of the API, the response has the best method. And here's the OK method that they're talking about, which returns response builder. That's what we have here. All right.

Moving along. And now, we also, like we mentioned, when we introduced the RESTful web services, we said it is a bad idea to return too much information. The REST way is to do what? Is to use a reference.

Use a reference to get what we call, in this case, the main link, or the root link. And then from there, you can go ahead and access in this case the different resources or sub-resources, if you want, from that link. That's the idea. That, of course, answers to the [INAUDIBLE] principle that we've seen over there, or the hyperlinking concept, or what we call also the progressive disclosure of resources from the client side.

We do have a life cycle and resource class types for the RESTful web services. Root resources classes can be POJOs. They can be CDI managed beans, which are, again, a managed beans for example for JSF components. They could be stateless session beans or they could be single session beans. Stateful session beans are not qualified to be, in this case, resources.

The JAX-RS implementation will obtain that root resource class from your application subclass that we already have seen. And if of course, if the class is returned from the get classes, then the Jersey will create an instance per-request, perform the JAX-RS dependency injection, and calls. If you do have, for example, @PostConstruct and we already have seen the PostConstruct before, if you're making use of a stateless session bean in a singleton session bean, chances are, you are going to use the @PostConstruct to prepare for resources for your service.

And of course, after that, you call the resource or the resource locator method to get your resource. If, of course, the class is returned from the get singleton, then it's expected to be a singleton. Typically, it's used for providers instead of resources. So later on, we're going to see how the getSingleton in this case, or we're going to see more or less the providers-- which, by the way, extend the capabilities of the JAX-RS API.

Let's continue with that. Ah. Let's tell you one more thing here. You remember how in the Jersey API, we used filters. We just added the filter in the Jersey API to the client.

The JAX-RS for now does not support a, in this case, filters. So filters are not currently part of the JAX-RS specification. And so the way we add filters here, we configure them in the web.xml.

So here's an example. Through the init param, you configure your resource filter by specifying your-- here is a rules allowed resource filter factory. And then of course, here's another one that provides my container filter, which is the login filter that I'm adding.

Here's another one. Again this is for inbound and this is another one for outbound that has a container response filter which, again, uses the login filter the outbound. So this is how we configure filters for JAX-RS because JAX-RS currently is not part of the-- or rather filters are not part of the JAX-RS specification.

Ah. So Let's take a look at providers. Well, providers extend the capabilities of the JAX-RS specification. There are three types of providers that we are going to see here. There's the entity provider, and that supports marshalling and unmarshalling new types. So what we are going to do in this case through the-- we're going to see this as an example.

You are going to see an example where the class returns a map. OK It turns out that JAX-RS does not know how to marshal a map. So what we need to do is we need to create an entity provider that actually help us marshal and unmarshall that. That's what we're going to do. We'll see the marshalling part of it in this case.

You can also, by the way, use an entity provider for the context. This supports all new context, and we'll see an example of that tomorrow when we start-- or maybe Friday morning when we talk about security for RESTful web services. You can also use it for exception mapping that converts exception to responses. Sometimes you get an exception and you want to get it as a response. Then you can actually do the mapping through the provider.

Providers, by the way, must be ThreadSafe. They are actually singletons. They must be annotated with @Provider. It turns out that we have an annotation called @Provider, which by the way I already opened here.

Here it is-- Provider. And this marks an implementation of an extension interface. That's the one that actually-- extension to the JAX-RS, by the way, in this case. That's pretty much what we have here.

And we do have a providers interface here. This providers interface actually provide a couple of methods-- getMessageBody reader and getMessageBody writer. These are the ones that we are going to see soon. And this provider, by the way, can be a POJO. It can be a singleton scope CDI bean, context and dependency injection bean, could be a stateless session bean, or it could be a singleton session bean.

So what we are going to look at here, folks, is an entity provider example. In general, the mapping between Java objects and their external representation are the responsibility of the entity provider. So an entity provider is a class that implements the message body reader or the message body writer.

It all depends if you're marshalling or unmarshalling. That's what you're doing, and it's annotated with @Provider. Again, providers are singletons and they must be ThreadSafe, like we said.

So let's see an example. Here, I have an example here. This example, if you take a look here, it is a PlannerRM class. It is a RESTful web service because of the annotation here, and it has, in this case, a method, in this case, that is called getRoutesFromSummary. This gets routes from summary, takes the start, in this case, parameter-- which is the code.

And as you see, I use it here as a-- because it's sub-resource, I annotated with @Path and passed with the parameter template in this case. And it has the @Get also, which returned that. But what it returns here, take a look, folks. It returns a map with the key as a string and the value as a strange. So this get routes from summary will get that.

So inside, I'll go ahead and create a new instance of in this case of the airportDAO and use it to findByCode. This is using JPA. Pass the code, get me the start airport. And then I'll go ahead and declare candidates as a reference to a map with the key flight and the value airport.

And then, of course, this will be-- and if you want a set, or if you want it will be initialized by calling the findRoutesFrom the start from the flight DAO, and that gives me all of that. And then of course here, I'll go ahead and create a reference variable result of Map String String. And then I'll initialize with the new HashMap, in this case. And then I use the enhanced for loop. So I'll call the key set on the candidates.

And for every flight, I'll go ahead and get what, the airport. And then I'll go ahead and put all of that into results. So I'll say, if get the number and the flight get the number, the flight number, and then get the destination, and put that into my, in this case, map. And then after that, return this. Product

So this is that we have here, the issue that we have here is JAX-RS is not able to, in this case, marshal the map. That's the problem that we have. So what do we need to do?

Well, we need to implement a MessageBodyWriter. This MessageBodyWriter-- which is this one here. Take a look at that. Here's the MessageBodyWriter, which happens to be an interface. This MessageBodyWriter is an interface. It is a contract for the provider that supports the conversion of Java type to a stream. And to add the message body writer implementation, annotate the implementation class with the @Provider. Of course, a MessageBodyWriter implementation may be, again, annotated with @Produces if you want.

This interface here has three methods, folks. One is the getSize, and this one here, this getSize, takes a classType, takes a genericType, takes annotations, and takes a mediaType. And it's called to write, in this case-- rather to ascertain the length of the bytes of the data that is serialized, the length of the data that is serialized. So the parameters are [INAUDIBLE], again, the instance to write. The type, in this case, is the class of the object that needs to be written.

The generic type is the type of the object to be written, obtained either by reflection or of a resource method return type, or by inspection of the return instance, the generic entity which provides a way to specify this information at run time, the annotations, which is an array of annotations on the resource methods that returns the object, and the media type, which is the media type of the HTTP entity-- that's typically what it has-- and returns, by the way the length in bytes. If the length is not provided, it returns minus one if the length cannot be determined in advance. If it cannot be determined in advance, you return a minus one. All right.

And then you have IsWriteable. IsWriteable, in this case, ascertains if the message body supports a particular type. Again, this also takes some parameters-- type, the class of the object that is to be written. genericType is the type of the object to be written, obtained by reflection or by inspection. The genericType, which provides a way to specify the information at runtime.

The annotations, which is an array of annotations or resource method that returns the object, and the mediaType. And then returns true if the type is supported. Otherwise, false. And then the method, what we call the worker method. It's this one. That's the one that does the marshalling.

This one here takes a type, an instance type to write, and the class of the object to be written, the generic type, which represents again the object to be written obtained through reflection and inspection, rather the generic type, and the annotation in this case, which is an array of annotations. The mediaType of the HTTP, the HTTP headers, which is again in this case a mutable map of the HTTP header response, and the entity stream, which is the output stream of the HTTP entity. The implementation, again, should not close the output stream in this case. And so this is, again, if you want, the writeTo is the one that does the job.

Let's go back to our lecture. And we again, pretty much give you here just a small definition of every one of them. Here, I went through the API so you guys can see that. So this get size is called to get the size of the response. A non-negative value is used for the Content-Length, minus one if it's not known yet in advance. IsWriteable, again, when registered, a MessageBodyWriter indicates the willingness to handle a particular type, mediaType, combination.

This function, again, is called to check whether this writer can actually handle that marshalling or not. And the writeTo is the one that is called to convert the value to be returned to its appropriate representation when you write that. The message body reader also, well, let me just show you that.

The message body reader also has equivalent methods. It's an interface also that is a contract for a provider that supports the conversion of stream to a Java type. It's the other way now. It's not from Java to stream, but stream to Java.

Here are the methods. It's readable and read from. These are the two methods. We are using the MessageBodyWriter in this example, but the one that we're using is this one here in this example. So let's continue with that. So now, let's see the example.

Here's how we implement getSize. So I have my class called map MessageBodyWriter. It is a provider. That's why I annotated with that provider. It produces a application XML. And it implements the MessageBodyWriter. For what? For the generic type map. That's what it is.

So again, the getSize here, that takes a map. And then the classType, the genericType, the annotations, array, and the mediaType. Here, we made it return minus one. Why?

Because we do not know about the size of the data in advance. Let me show you now the example of IsWriteable. The same concept, the class, and the annotations, and this implements the MessageBodyWriter. Here, we implement IsWriteable.

Again, we put the code here where, again, in this case return, if the generic is equal to the target type and the media type is compatible, then of course we return a Boolean true, which means you can do it. And then, let's see how a provider, in this case, will help us marshal a map. Let's go ahead and do that.

This is in the writeTo. So the writeTo, again, takes all these, in this case, parameters, which is the map and the type, the generic type, the annotations, the media type, and of course the multi-valued map, which is a singleton object, for the headers and the output stream.

So first of all, look how we do it. We create a new instance of what? Stringbuffer. And then we passed with, initialized it with what? The string less than map greater than. So this was probably will be what? Most probably would be the root of what? Of the XML file that represents a map.

Then after that, I'll use the for loop. And for, again, say for a, in this case, every entry of the map, I'll go ahead and get the entry set in this case. And then I get my key OK for that, and I get my value, and then look what I do.

Once I get the key and the value, look what I do. I first append entry, so which means it's going to look something like this. Let me just delete this one here, and let me just show you that one on the board.

So it's going to look something like this where you have the map. And then after that, we decided to put another entry, which is entry. And then after that, we'll go ahead and put the key and then put the value, append all of that. So there will be a key, some value of the key. And then I will go ahead and append /key.

So that's what it says here. And then I'll do the same thing with the value. So I'll append the value. So that'll have a value here, and then some value, and then the value here. Right.

And then, of course, after that, I will finish with what? /entry. And I repeat all of this until what? Until I finish with the whole map. And then at the end, I do what?

So I'm going to go ahead and finish all of this. And at the end, look what I do. At the end, I'll append the last one, which is what? /map, /map. And then, of course, after I do that, all of this, by the way, is represented by what? The stringbuffer.

Then after that, I'll use the entity stream, use the right, and then apply the two string method on what? On the string buffer. And of course, the [INAUDIBLE], I can go ahead and write that out. So I actually created, in this case, with the writeTo, I actually marshalled a map so that it will be looked in a form of xml. Got the idea? OK.

So we said that these providers are really quite useful. We just finished with an example of what? Of the entity provider. We also can use these providers as what? Let me go ahead as a context provider.

JAX-RS uses its own form of dependency injection, which is the @Context annotation. And of course, only the listed types are required to be supported by JAX-RS, all of this one here. I can inject an application, a URI, context HTTP header, Request, tomorrow or Friday, we'll use the security context. The providers, the ServletConfig, ServletContext, and so forth.

JSONConfiguration. Well, the default JSON format is known as Badgerfish-- again, still used for backwards compatibility. Produces an output that may be difficult, again, for some clients to process. By creating a custom context provider, what we do, what we do is we can actually supply a JAXB context that, of course, is configured to produce your JSON that is formatted using the natural notation.

So in this case, we'll go ahead and implement a custom what we call a ContextResolver plus of type JAXBContext, in this case, return an instance of that as a singleton, and then built, of course, a JSON configuration with the desired setting, in this case, and use it when building your JAXB-- or rather, your JSON JAXB context.

So again, this one pretty much is part of what we call the context resolver. We can actually see this context resolver just out of curiosity. So I here's my context resolver.

This is an interface which contract for a provider that supplies a context information to resource classes and other providers. OK It has, again, the method, which is pretty much get the context. And then, as an example, we can also look at the other one, which is again in this case the JSON configuration, or what we call the JSON-- let's start with the JSON configuration and then--

And that's, again, let's just use here. This is part of the Jersey API. And again, this is an immutable configuration of JSON notation and options. And in it, you can see, by the way, here-- this is the nested classes and the fields and the methods that you can use here. OK And then, of course, one more thing that I want to share with you here is the JSON context-- JSON JAXB context, rather. Let's go ahead and show that.

And here's my JSON JAXB context, which is pretty much a class in this case that has its own fields-- JSON array, JSON enable, JSON and so forth. And it has a bunch-- create a JSON marshaller, created a JSON unmarshaller. We've seen some last time about this.

So in terms of the life cycle, resource classes are instance-per-request, no state. Root resource class supports common life cycle annotation using the @PostConstruct. If, for example, your resource is a session bean, then I can provide an @PostConstruct method to, again, provide the resources.

You can perform JAX-WS inject on fields or methods just by, again, using that query param except in sub-resources classes, where only method parameter injection works. Again, constructor injection support is optional in this case. We typically don't use it.

And by the way, just like the JAX-WS, remember how we said there is a server inside the JVM. Also, you can create, you can deploy, a RESTful web service on the standard edition too. It is not a production quality server, but here's how we do it.

An example of airport manager. You get a context URL. You have your context URL. And then, of course, you will specify the context URL with the arg1. And then here, I'll go ahead and create, in this case, a server by invoking the create method on the HTTP server factory, pass the context URL to it to create a server, and then I'll go ahead and start the server and work with it.

You can use this one here, but like I mentioned to you, folks, this actually is not a production quality. It's used to do some tests, just a POC type of test just to approve concept testing and so forth. But in general, it would be nice to actually make use of an ID like NetBeans with an Apache Tomcat Server, or in a GlassFish Server, or WebLogic Server. And of course, you can go ahead and implement and test your RESTful web services.

Just to finish the lecture, a couple of quizzes. What are the three categories of methods that might be called to handle an HTTP GET by the JAX-RS implementation, and we said that's a resource, or a sub-resource, or a locator, which means a sub-resource locator. That's what it means. And the next quiz, a sub-resource locator method is annotated with one or more HTTP method annotations such as @GET, and the answer of course is false.

One more. A root resource class must be annotated with-- in this case, we know it is @Path. That's how we always get the resource class. And that's pretty much what we wanted to say about this lecture. Here are just some of the links to read a little bit about the Jersey user guide or the developing RESTful web services for Oracle WebLogic Server, or the EE 6 or Jersey samples.

And that, of course, lead us to, in this case, to finishing with this lecture where we looked at how we implement RESTful web services. It turned out that we first of all how to download-- we have to download and install and configure the Jersey, and we already have done that through labs. And then, of course, after that, we know how to configure a class to represent a RESTful web service using the @Path annotation. And we also can use the @GET and @PUT and @POST and @DELETE and so forth. We can apply them to the methods within the class.

We also can annotate a method. If we want the method to be a sub-resource locator, we annotate with @Path. We can pass to it also a template, in this case, parameter for that. We also said that now, we can go ahead and create an application that extends the abstract application class part of the API. That'll allow us, of course, to override the get classes and the get singletons.

That'll allow us to have more than-- and add more than one resource to that set of classes represented in the different resources This allow us, of course, to create what we call a RESTful application. And we just need to configure that in the web.xml and work with it.

And then after that, we discussed the providers, which by the way provide a facility to extend the capabilities of JAX-RS. And we've seen an example, a full example, of the entity provider by using, in this case, the interface MessageBodyWriter. And we applied it to the context, or the concept, of in this case marshalling the map.

And of course, we do have also context providers, too, and exception mapping providers too as examples that you can use. One thing that we need to remember on these providers is that they're [? ethernet ?] safe because they are singletons. And if you want a class, in this case, to be represented as a provider, it could be a POJO, it could be a stateless session bean, it could be a singleton session bean, or it could be a CDI bean.

The only thing that we need to remember is that they are singletons. And of course, after that, we looked at the concept of producing and consuming XML and JSON content with the JAX-RS API. And that's what we want to say about this lecture.

## JAX-RS RESTful Web Services: Part 3 - 9m

After we've done with this implementing JAX-RS Web Services, where we looked at how we implement a web service resource using the add path or an application extending an application. And of course we looked at the concept of providers and how they help, in this case, extend the capabilities of JAX-RS. Let's go ahead and look at the practices for this lesson.

So in Practice 10-1, what are we going to do is we're going to deploy an application and run it called RummyRules. And this is just to explain to us how that the RummyRules game works. So typically you just open it and right-click and run it. And then, of course, after that you will get a page like this that pretty much tells you about the Indian Rummy and how it's played. That's what it does.

After that, we're going to get into creating some RESTful service, in this case, web services. So here in 10-2, we're going to create an Indian Rummy web service project. In this practice, what you're going to do is you're going to create the IndianRummy Web Service, WS, project that will contain RESTful resources for playing a game of Indian Rummy.

The Indian Rummy service will, of course, leverage the GenericCardGame web service and Player Management Service that the use manager that we've seen before. And so both web services will be building blocks in this case. Effectively, you are creating a RESTful web service, which is a mix of other web services with game-specific rules and resource presentation.

So you will create the root resource and leverage a supplied resource to represent players in 10.4, where you will create, in this case, the resources that represent games of Indian Rummy. So you assume that you are done with 8-1 and 9-1, OK, projects or practices. And then pretty much you go through the, again, in this case, all the different steps to finish this practice, OK?

And creating the JAXB classes and adding some code, creating the IndianRummyRouteResourceClass, modifying the IndianRummyResourceClass, creating your application sub-class, and of course, in this case, adding the PlayersResource, updating the resource source to provide the client access to the players' sub-resource testing Indian Rummy, and again, in this case, and of course, that would be your lab 10.2.

In lab 10.3, we create the Indian Rummy game, creation REST resources. In this practice, we create a game of Indian Rummy. More specifically, you create the RummyGameCollectionResource and the RummyGameResource. Again, the full mechanics of playing the game will not be implemented in this practice, but you should be able to create and deal the initial hand of Indian Rummy.

Of course, a game of Indian Rummy is stored in two places using the CardGameService SOAP web service, the card piles used by the game are stored in memory. The additional details, such as the order of players at the table and which player's turn it is, of course, stored as a serialized XML data into a group description using the user-management-service SOAP web service.

Each game of India Rummy would be stored as a group name, which is game-GAMEGENERICGAMEUUID, where the GENERICGAMEUUID is the identifier returned by the game service when, of course, creating a generic card game. The game prefix in this case is used to enable rapid identification and deletion of groups that correspond to Rummy Games.

Of course, unlike the player REST resources for the game resources, you will use multiple class files to create resource representation. Again, in this case we assume that Practice 10-2 is completed.

Pretty much you create these classes, OK, and [INAUDIBLE] by adding code to them, and of course updating your IndianRummyRootResource, adding the web service client methods to the RummyGameCollectionResource, adding a private deal game method to the RummyGameCollectionResource, adding to private methods that get each player one card and get player with highest card, OK, and then, of course, at the logger instance, using the log name of Rummy to the RummyGameCollectionResource class.

Create the createGame method in the RummyGameCollectionResource class that responds to the post request. And of course using the CardGameService web service, a new game with the correct number of the index should be created. And again, in this case, create the getGames method in the RummyGameCollectionResource class that responds to the GET requests. Create the deleteGames method also in the same class.

Add the getGameResource sub-resource locator method, OK? Open your RummyGameResource file. Again, this resource will respond to requests to the URL similar to what you see here in this case, which is this, pretty much.

Add a web service client method to the RummyGame resource, create a getGameResource method that responds to the HTTP GET requests, build your RummyGame using the XML stored in the group description, OK? Create the GET hands sub-resource method that represents the HTTP GET request at the hand user path.

Test your Indian Rummy application by deploying it and testing it, OK? And in Practice 10-4, you are going to use the JSON as a data interchange format. In this practice, you use JSON instead of XML. Then, communicating with your RESTful web service, the Jersey implementation of JAX-RS supports the JSON interchange format using a library named Jackson.

Of course, as long as the Jackson-related JARs are on your CLASSPATH, you can actually use JSON. Now, these JARs should already be present for the classroom environment, of course, in this case. Again, because these JARs are already present, and all your resource classes indicated that they support JSON, in this case you can actually use the JSON already with your deployed project.

If desired, you may also use the cURL command utility to perform that practice too if you want. So here we assume that Practice 3 is done, WebLogic Server is running, and the IndianRummyWS project is deployed. And of course, here we tell you step by step how to go by the different tasks of this practice, OK?

One last practice in this case for this lesson is Practice 10-5. This is, again, where you complete-- it's optional, by the way, you don't have to do it-- the Indian Rummy logic, where in this practice, you finish the Indian Rummy resources to enable playing single-round games. Again, we assume here that you are really fast at these practices and need a big challenge. In this case, no solution is provided, so you just give it a try. And that's pretty much what we wanted to say about the practices of this lesson. Thank you.

## Practice 10-1: The Rules of Indian Rummy - 2m

Now that we're done with the lecture of lesson 10, and which is implementing JAX-RS as web services, let's take a look at practice 10-1. In practice 10-1 we just have to open a project, called a Rummy Rules, so we can read about the rules for playing Indian Rummy. That's pretty much what they asked us to do in this case. So let's go ahead and take a look at NetBeans.

So here's a project, Rummy Rules. You can go ahead, by the way, and look at it. This pretty much has nothing, but-- and then you run it. When you run it, that's where, in this case, you will see the the Rummy Rules, OK? So we ask you to read these Indian Rummy rules thoroughly, so you'd understand, pretty much, how to play Indian Rummy. And that's the purpose of this practice 10-1. Thank you.

## Practice 10-2: Creating the Indian Rummy Web Service Project - 8m

In practice 10-2, we're going to create the Indian Rummy Web Service Project. Again, in this practice, we create the Indian Rummy WS Project that will contain RESTful resources for playing a game of Indian rummy. The Indian rummy service will leverage the generic card game web service that we've done earlier, and deploy a management service [INAUDIBLE] a web service as building blocks. Of course effectively, you are creating a REST web service which is a mix of other web services with game-specific rules and resource representation. Again, you will create the root resource and leverage a supply resource to represent players.

In practice 10-4, we'll create the resources that are present in games of Indian rummy. So in this case, we have an Indian rummy project that we are going to create. Let's go back to [INAUDIBLE] and take a look at that. So here it is.

And of course, we want to make sure that in this case the WebLogic.xml actually uses the [? jersey1.17 ?]. We already know about that. And of course, in this case, what we are going to do in this case is take a look at the util package. So we do-- we create util [? bar ?] where we have the card utils class. And that's the one that has the [? get ?] color, [? get ?] [? unique ?] [? code ?] back to unique code. And we've got all this class that is, of course, here useful to us as a util class.

And then of course, after that, we do under the Rummy JAXB package. We do have, in this case, all the classes are representing a hand with all the JAXB annotation-specific. That's the class hand. We do have the link, in this case, a class. And we have the player, a class. And we have the players stats class, which by the way, we also discussed that has again a annotation XML root element, and then the stats. And of course, the XML type [INAUDIBLE] all the wins-- rather the property order would be wins and loses. And of course, we do have a couple of fields which are, in this case, wins and loses-- rather, wins and losses. And they are both integers, and they are of course annotated with [? add ?] XML element.

And then of course, after that we do create a class called Indian Rummy root resource. And here's the Indian Rummy root resource, a class. Let me just go ahead and put it into a full screen. So it's a class which is a RESTful web service. It has the [? add ?] [? path ?] annotation, plus in addition it has [INAUDIBLE] [? and ?] [? it ?] consumes, which by the way shows the media type. That could be an application XML, or JSON.

And of course, we do have also a class that's called application running. And this is the application that extends-- so it's called Rummy Application. [? It says ?] [? my ?] [? application ?]. It has the get classes, and in the get classes we add the Indian Rummy root resource class that we've seen earlier. That's the one that we add to the set of classes, in this case as a RESTful web service.

And we do have also another class called the players resource. And let's go ahead and look at that. And of course, we'll go ahead and look at these-- we do have a player resource class, which happens to be in this case a class that has, of course-- it's annotated with @. It produces an @consumes. And this players resource has a get players method that returns a list of players.

And of course, it has-- and that you see here-- it has a get player method, which, by the way, here is annotated with add path, which means this is a subresource type of a method. Kind of similar to what we discussed in the lecture. And it has also the create or update player, which by the way also happens to be also a method [INAUDIBLE] [? output, ?] and then it has the add path with the parameter that you're passing here, param template.

And then it has the delete player. That, of course, is annotated with @delete. And it also makes use of the template parameter. And of course, a bunch of other methods here, which are static. List group members, is user present, create a user, get a user description, set a password, delete a user, [INAUDIBLE] group element, create a user, join a group, check group membership, so on and so forth. So that's the class that of course we created here.

And of course now they want us to test this application. So we deploy it. And then to test it, again, in this case-- let me just open this. And so we do have, in this case, using the RESTClient. So first, we do have, in this case, just a URL that specifies the resources. And we click on that, and of course that will get us, in this case, a response header with [? array ?] of course the response body that has a link of the players.

And then after that, we wanted to list the players. So that would be in the next one. That's what I did. Of course here, it has no players, as you see it says. But then in the third one, that's where we added a player called Matt, in this case. And then as you see here, it says create it. So obviously in this case, we do have now players.

So now if we wanted to now take a look at the players and invoke a Get on that, that of course in this case will return a list of players, and one of them is Matt, the one that of course we put earlier. And this is pretty much what they want us to do in this practice, which is of course in this case practice 10-2. Thank you.

## Practice 10-3: Creating the Indian Rummy Game Creation REST Resources - 8m

Let's take a look at practice 10-3. In practice 10-3, we are going to create the Indian Rummy game creation REST resources. In this practice, what we do is we create a game of Indian Rummy. More specifically, we create the Rummy Game Collection resource and Rummy Game Resource classes. The full mechanics of playing the game will not be implemented in this practice, but you should be able to create and deal the initial hand of Indian Rummy.

Of course, the game of Indian Rummy is stored in two places. Using the CardGameService SOAP web service, the card piles used by the game are stored in memory. The additional details such as order of players at the table and which players turn it are of course stored as serialized XML data into a group description using the User Management Service SOAP web service. Each game of Indian Rummy will be stored as a group named game-GENERICGAMEUUID, where GENERICGAMEUUID is the identifier returned by the card game service when creating a generic card game. The game prefix is used to enable rapid identification and deletion of groups that correspond to Rummy games. And like, of course, the player REST resources, for the game resources you will use multiple class files to create resource representation.

So the goal in this case is to create a couple of classes. One is the Rummy Game Collection resource, and the other one is Rummy Game Resource. Let's go ahead and take a look at that in NetBeans. And of course before that, what we need to do is create a Rummy Game class under the JAXB, and that's the Rummy Game class.

And this Rummy Game class, as you see here, it is a class that is annotated with @XmlRootElement. And of course, the XML type, where we have the Property Order Players, Current Term Player, Top Discard [INAUDIBLE]. And then of course the XML accessor type, in this case. And then, as you see here, it has its own different fields annotated with the @XmlElement. And it has the Get Players, Set Players, it has Get Current Player, Return Player, and Set Current Term Player, Get Top Discard and Set Top Discard Card, Get HREF, and Set HREF, and Add Player. These are the methods that are inside this Rummy Game class.

Of course, we do also have-- and of course we need to update the Indian Rummy root resource class to use a subresource locator method to return a Rummy Game Collection Resource instance for the game path. And that's under here. And of course, in this case, we do have the Get Rummy Games. And that you will of course here that you will have it. This is the method that we added.

And then of course we do now have a Rummy Game Collection Resource class. And in this Rummy Game Collection Resource class, as you see here, it has a Create Game, which is used in the post, in this case, method. And we add of course a private deal game method, which is again in this case Deal Game. Let's go ahead and take a look at that.

So here the Get Games. And we have Delete Games, we have Get Game Resource, we have Deal Game. That's a private method that we said we add. They gave us the code that we need to use again. And of course, we have another method which is Give Each Player One Card. And of course Get Player With Highest Card. That's also another method.

We do have Create-- and this is a static method, private static-- called Create or Supply Pile. We do have a Create Card Game, Create Pile, Create Piles, Remove Card Game, Shuffle All, Show Top Card, Create Group, Is User Present, Join Group, List Group Members, Set Group Description, Delete Group, Check Group Membership, Is Group Present, List Groups by Pattern. All of these pretty much are a method that you can go ahead and look at. And that's what we have in this case.

We do have another class also that we created. Let me just go back and open it. That's the Rummy Game Resource. And that of course is the one that they asked us to [INAUDIBLE] Rummy Game Resource. And in the Rummy Game Resource, let me go ahead and open it in a full screen. So it, of course-- we created a logger here. And then it has Get Game, which annotated with @get. And it has the Delete Game method, it has the Get Hand, it has the Get Group Description, Delete Group, Is Group Present, Show Top Card, Show Pile, Remove Card Game, all these again part of this new class.

Of course after that all what we need to do is pretty much deploy it and test it like we tested the first type of application. That's pretty much looking at resources and creating a new player, Matt, and pretty much similar to what we have done earlier when we tested the previous practice, or the project Indian Rummy part of the previous practice, which again was part of the practice 10-2. And that's pretty much what they want us to do in this practice 10-3. Thank you.

## Practice 10-4: Using JSON as a Data Interchange Format - 5m

In practice 10-4, we're going to use JSON as a data interchange format. So of course, the Jersey implementation of JAX-RS supports the JSON interchange format using a library named Jackson, of course. As long as the Jackson-related JARs are on your class path, you can use JSON. Of course, these JARs should readily be present for the classroom environment. Of course, they're already there.

So looking at, of course, in this case, using JSONs. And we'll go ahead now and in this case run using the JAX-RS client extension and making sure that we have the content type is application.json and the accept is application.json. And we'll go ahead and do a Send with the Get method on the local host 7001. And of course in your Rummy JAX-WS resources. And we click Send, and that of course will get us, in this case, as an output the-- first of all, the response [INAUDIBLE] 200, OK. And then as you see here, it returns pretty much the JSON components, in this case, or the JSON objects.

And then after that we wanted to, in this case, the next one is to do a Put by creating a new player, Matt, and by passing again in this case the object or the JSON object username Matt and the password welcome1. And then after that, we'll go ahead and look for the list of the players. And when we invoke this case the-- use the URL resources players at the end, and of course invoke the Send, we get a response, which is 200 OK. And now we get, in this case, the username Matt and the H reference, which is this one here. So that pretty much representing in this case, returning what we call in this case a JSON object.

And of course, you can go ahead and create another player, Tom, and get the list of the players. Pretty much the rest of the examples are pretty much the same. Then after that, what they want us to do is they want us to, in this case, in the NetBeans, create-- let me go back to my NeatBeans now. And if we take a look at NetBeans, we do have now a JAXB context resolver that's a provider, which implements the context resolver JAXB context. It has a context, and it has again a list of all the classes, an array of classes types. Link, Player, Player State, Rummy, and Card Type. And then it has a JAXB context resolver that of course throws an EJB exception. Rather, an exception. And we'll go ahead and create a jconfig and pass, again, call the root unwrapping set to true, and human readable formatting true. And then of course, build that. And it has a Get context in this case. And we create a new instance of context and get the Get context, which returns a context.

What we do in this case is we modify the Rummy application where, in the Rummy application, first of all, we do have, again, in the pass, we had these get classes that adds the Indian Rummy resource to the set of classes. Now we're going to have a set of singletons representing the providers. So we have a set of objects initialized with a half set. We create a new instance of the JAXB context resolver called my JAXB context resolver. And we add it to the, of course, set of providers. And that's what they asked us to do in this case. Plus, of course, after that, we'll go ahead and save everything. And then we can perform also a Get request pretty much following the same concept by doing some more testing following the same type of test that they asked us to do. And this is pretty much what they want us to do in practice, in this case, 10-4. Thank you.

## Practice 10-5: Completing the Indian Rummy Logic - 2m

In Practice 10-5, which is optional-- again, you're not supposed to do it. But if you want to try it, give it a try. The only thing that we wanted to add here is we wanted to-- if you want to try this optional practice, which is 10-5, you finish-- in this case, what are you going to do is finish the Indian Rummy resources to enable playing single-round games.

Again, the assumption here is you are really fast at these practices and need a big challenge. Of course, no solution is provided in this. As you see, we do not provide you any solution in this, and it says it in the Assumptions. But you can go through these tasks where you can design additional resources and determine which operations would be required to support playing a round of Indian Rummy.

Of course, you can discuss your design with all of the students, if you want, or you can discuss it with us. But in general, we advise you against doing this practice. It's really not that useful. But if you want to try it, go ahead and try it. That's not a problem. But we just want to, again, emphasize that we did not provide the solution for this one.

So you can go ahead and try it, if you want, but it's not that important anyway. And this is pretty much what we want you to do in Practice 10-5, which is optional. Thank you.

## Skill Check: JAX-RS RESTful Web Services - Score 80% or higher to pass

Skill Check: JAX-RS RESTful Web Services

View Skill Check
