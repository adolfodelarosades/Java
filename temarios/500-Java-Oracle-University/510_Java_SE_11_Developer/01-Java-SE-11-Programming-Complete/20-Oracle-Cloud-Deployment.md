# 20: Oracle Cloud Deployment

1. Oracle Cloud Deployment, Part 1 21m
2. Oracle Cloud Deployment, Part 2 11m
3. Oracle Cloud Deployment, Part 3 19m
4. Oracle Cloud Deployment, Part 4 24m

## 1. Oracle Cloud Deployment, Part 1 21m

Let's take a look at the Oracle Cloud Deployment. In this lesson, we're looking at general cloud application design principles, and how the application that you deploy into the cloud differs from the one you just run locally, and specifically, what are the approaches to changing your application and what things you need to consider in general, as to how your application need to be refactored in order to be hosted on the cloud. And then we'll try to deploy our Java SE Application in the Oracle Cloud environment.

So let's start with looking at the general cloud application requirements. Unlike locally managed application code, the application that you can just invoke by, you know, launching it on command line and, I don't know, interacting with it through the console, Cloud application would require to consider the fact that the application is not running on the same machine. So you have to access it remotely, and therefore, you have to think about what the transport protocol would you use to access it, how the call will be managed, what is the format, in which you'll send data to the application or receive it back, enable various handlers for their remote calls-- so how the application will accept the remote calls, how to produce responses.

Think about it this way-- you may, let's say, for example, typically for the internet communications, you probably would use HTTP protocol, right? But then the question is, which specific format of messages would you use to transport over HTTP? You can transport text, you can transport binary message, [INAUDIBLE] comma separated format, JSON, which is JavaScript Object Notation, or XML-- I don't know. That depends. You have to decide what you want it to be, how exactly you exchange information.

And then in your Java program, instead of, you know, reading and writing information to and from the console, or just handling local files, you'll have to write code that will accept network calls, interpret the messages that are coming in, translate these messages as actions that the program needs to perform against its methods and components, invoke such methods, and only then transport information back-- again, forming some kind of network messages and sending them back to the caller. So this kind of interaction loop have to be considered.

Now, that also means that potentially, your server-side program can be simultaneously invoked by various concurrent callers. So you have to consider managing concurrency-- all of these different inbound calls arriving at the same time. How are you going to handle that? Well, I guess you need, maybe, multiple threads to respond to these different concurrent calls, so that's, again, something to consider within your application.

Finally, a locally executed Java application-- well, you could just open the terminal window and start it up. But what about the remote one? You want to send an HTTP call to it, but surely, that means that on the server-side within the cloud, something has to be running already to accept that call. So your application has to start up first and then, yes, it accepts the call, and it starts responding.

So how do you start the application how do you shut down the application, what is that application lifecycle, how it's going to be managed, how are we going to manage the availability of the application, what if it's down, maybe there's some process on the server that gets started for us, how do we scale it, how many instances of the application we need to launch-- all of these questions need to be answered eventually. Yes, quite a lot of them, as you can see. And that is how the cloud application deployment differs from just your local sort of self-contained application.

So as I say, one thing to consider is the transport and the way in which we process messages. But then the other big area to consider is how the lifecycle of the application is managed. So there are a number of solutions to these problems, and there is something common for all of these solutions, and that is the use of server-side containers to automate these tasks. Your server-side containers, or programs essentially running within a cloud, providing the environment that can host your code. There are various solutions to these. There are various types of containers you could use, and we're going to discuss them in a moment.

But what's common between all of these different containers is that they will try to address the question of an application lifecycle management-- you know, how applications started, and possibly networking, and possibly concurrency, and possibly other, you know, tasks from this list, right? It depends on which container you're using. Different containers are designed to solve different problems. Some containers solve more of these bullets, other containers solve less of these bullets, and yeah, it depends. And you could always use a combination of different deployment techniques and different containers that will host your code.

So anyway, well, let's take a look at what the server-side containers could be, and what sort of tasks we could try to solve with them. And we'll start here by just sort of trying to understand what exactly the cloud infrastructure would look like, and then the role of the containers within that infrastructure. So within the cloud, you will have various machines-- you know, real or virtual machines, depends; could be both, actually-- so there's obviously some hardware, and then the cloud hardware provides us with either real machines that we could get from the cloud, or maybe virtualizations, so several different virtual machines may be mapped onto the same sort of physical machine. Could be done both ways.

Within these machines, physical or virtual, well, obviously, what we do is we run some operation system. We could be different operation systems, but let's say, for example, Linux, right? But of course, this could be other OSs. And you could just take your Java virtual machine, start it up on the Linux host, and within that JVM, you can run your server and you can host your application within it.

So the idea is that something on a server, maybe some kind of script, needs to pre-launch the Java virtual machine with the application running within that Java virtual machine, and then that application will have to exploit some kind of a server, which will, I guess, accept requests, responses-- let's say, an HTTP request or responses, and help the application interact with callers.

And that's the most kind of obvious, basic way in which it could be done. However, you could do more advanced deployments within a cloud, and the more advanced deployment technique comes from the concept of a Docker. Now, what's a Docker? Well, imagine that you're using a process within the operation system which represents a kind of virtualized environment. The Docker is not exactly the entire virtual machine-- it's more like a projection of the virtual machine functions into an OS process, essentially, from perspective of the host.

OS Dockers is a process, basically. But from perspective of a program hosted within the Docker, it feels like, from that program's point of view, that it's running on a machine, which this Docker represents. So it's a process within a host OS, but from the point of view of the Java application running within it, it almost feels like a computer, which helps that. And the point of the Docker is that it's much more lightweight than the entire OS itself. So within a given OS, you may start multiple Docker images, multiple instances.

And the idea is that you can relatively quickly start and stop them, so if you need to provide dynamic provisioning of resources-- like you need an extra instance of your application because say, for example, number of concurrent users spikes, and you want to quickly scale up and just provide extra instances, so you could start extra Docker instances, I guess-- you know, running an application code. And then when you don't need it, you can quickly get rid of them, and this process is much more dynamic and quick than starting the entire host OS, right? So that will be sort of quicker responsiveness to the requirement to scale up or down.

Each Docker, as I say from perspective of your Java program, feels like a machine, basically, but in reality, it isn't, really. The Docker images can be managed via a management process. An example of such management process is a product called Kubernetes, which is basically an environment which allows you to describe the Docker images you want to run, how many you want to start, what are the rules about scaling, what are the rules, about the control-- you know, how you kind of manage these collection of different applications hosted in Docker containers. So that's the job of Kubernetes.

General virtual machine role is as usual. It provides the environment to execute your code. There's nothing special here. It's exact same idea of general virtual machine on a client, or general virtual machine on the server. That's really not much of a difference. You're running the exact same Java code in terms of byte codes, and then JVM translates it to the current environment, as you do.

However, what you also need to consider is that your Java application will have to communicate through the network to whichever callers invoke it, so you need some kind of server, I guess, within your Java program, that will perform these communications that will automate the exchange of information with callers-- so you know, handle inbound, say, HTTP calls, produce outbound calls, map them to different threads as required or, you know, allocate resources, do the input-output, you know, write network packets, read network packets. That's all kind of handful stuff, right? So you want an automation of that, and that's what your Java server could provide.

And there are different Java severs available on the market, and we'll discuss what are the options in a moment. And then finally, your actual application code will be hosted in that environment, and it will essentially use that Java server as a source of input-output, really, as a way to send information to the client or get information from the client, to interact with clients, and as an environment which basically hosts your business logic.

OK, so now, let's zoom in to the actual offering of different Cloud application servers. So what do we have? Out of which options we could choose? Generally, there are three main approaches to running Java in a server tier-- Java EE, Java SE, and Java MP. Now, Java SE is really the unusual choice for the server tier. Java SE, Standard Edition, is just your sort of client-side job, something that you've been writing throughout this course all along-- self-contained Java application running within a client.

Can you deploy it onto the server tier into the Cloud? Well, yes, but then you have to write some code to interact with the clients calling you through the network. And there are products that you can embed into the Java program to do these interactions. So otherwise, it remains a normal Java SE program. It doesn't provide you with any fancy hosting environment, but it can handle the network interactions with clients.

An example of such a program that can be just embedded inside the Java SE code directly is Helidon server, which is basically a product that allows you to, you know, do these interactions with clients, provide limited server capabilities, and the typical use case for it is to host relatively small sort of microservice type applications, in a way don't require a large, complex, bloated application to be deployed when it's fairly straightforward and simple sort of piece of Java code-- which, I guess, that's why you're still running it in Java SE, because you don't want any kind of fancy automations around it. You just need some kind of a web server to direct with your clients, and the Helidon SE does the job.

And now, another option is to use Helidon MP, or MicroProfile. MicroProfile feels like a subset of another environment-- which we'll talk about in a moment, which is Java EE-- a subset specifically designed to host Java applications within a server tier. So it also comes with a way of hosting the application within the container, which interacts with clients via HTTP, so it's basically, again, a web server. And it's designed, again, to host microservice applications, but with higher degree of automation. Unlike pure Java SE environment, Java MP environment brings in all sorts of extra features from the world of Java Enterprise Edition into the world of these sort of small application hosting, into what we call microservices.

Now, there are some terminologies that you observe here in the examples. So REST stands for representational state transfer protocol, which is very typically used protocol for interacting with microservices. And it's basically HTTP as a transport, yeah? REST protocol is just the convention how you use HTTP, basically. What's a POJO? A plain old Java object, which basically means your class-- just normal class, nothing special. So POJO is kind of unspecialized regular sort of Java class, which means it's the kind of code you've been writing all along.

All you need to do is to consider how you would interpret Java calls as HTTP calls. The server, such as MicroProfile or Java SE servers such as Helidon would do the input-output for you, and you could benefit from some degree of automation of your work in terms of server-side environment hosting. But it's not particularly sophisticated. It's pretty straightforward. And it feels-- in all other respects, it feels like a normal Java program, because you've got your normal, plain old Java objects as you use anywhere else.

Now, let's take a look at the other side of this page, which talks about the Java EE server, EE standing for Enterprise Edition. And the lots of different Java service available in the market-- well, obviously, since this is an Oracle course, we'll plug in the Oracle WebLogic Server here, saying it's one of the Java SE services available, manufactured by Oracle in this particular case, and other offers, of course, available as well. So what's the Java EE server doing? Well, that's much more sophisticated environment.

It is hosting your are plain old Java objects all right. You could still use them. But on top of them, you've got a number of more specialized types of Java objects you could use. You've got things like Enterprise, JavaBeans, EJBs-- they're specialized Java objects to contain actual business logical application. It's explicitly designed just to cater for business logic. You've got Java messaging service subjects, JMS, which allow you to create messaging servers; JCA adapters, which allow you-- JCA stands for Java connectivity architecture-- and that represents adapters, which is connectivity with various external systems, which are presumably non-Java.

So you could have very sophisticated kind of backend integration environments. All of these components-- EJBs, JMS, JCA, et cetera-- there's something common between all of them, and that is they're not really from the end user face in any way. They just sort of a backend of the application, containing your business logic, interacting with backend systems with external servers, with other non-Java systems if necessary.

And then you get a front end part where you will actually deal with interactions with your callers. And the front end components typically would be hosted by the web container, because that's the place where you will have all of your HTTP calls for the web, yeah? And there are, again, lots of different options here. You can use representational state transfer services, REST services, but you can also use other technologies-- Java server pages, Java server faces, servlets, et cetera.

Now, this particular course that we're studying now is dedicated Java SE, so all of these other options-- well, they're kind of out of the scope of this course. But the reason we present them is so you know that there is this kind of big market of other types of containers that go beyond Java SE that provide significant degree of automation when you are writing server-side applications. So for example, security management, concurrency, transaction management-- all sorts of different automation that come with this Java server environments. Java MP, or MicroProfile, can be considered essentially as a subset of Java features, just designed to host microservices using REST, and pretty much that's it.

And then in Java SE, you could still do the hosting of the microservices, but again, you have even a smaller subset of features-- basically, nothing beyond just a simple capacity to interact with a client using HTTP. So the level of sophistication is what makes these environments different. You can find more information about these environments in courses that cover web service development, so we provide these developing web services-- oh, and the Java EE course, developing applications for the Java EE 7 platform.

That's, of course, where you can learn more about the Java EE side of things, which, actually, part of it also covers web services, but it's dedicated not just to web services but to, you know, just talking about Java EE in general, and web services becomes, like, one of the topics. And as I say, then other courses cover web services in more detail.

## 2. Oracle Cloud Deployment, Part 2 11m

So how the actual packaging of the application and deployment of the application would differ between sort of client SE or server side E or whatever environment you choose? OK, well, you know that you can package Java SE application as a JImage, right? Actually, the same technique could be applied to Java Micro Profile applications as well. So it's essentially a set of Java libraries.

You may package it to JImage, but you don't even have to package it to JImage, I guess. You could just use the module path or class path, pack your code into the jar files, deliver it to the server, and run it there. Of course, you can do it via JImage as well, but that depends. It that's up to you.

You know that you can run modularized applications without actually creating JImage with jlink, or you can run the good old-fashioned class path sort of mode. It's your choice. So anyway, well, obviously, you could pack the application and deliver it to the server as one image or as a series of jar files, whichever. And then you launch the Java Virtual Machine.

And actually, this is what could be, for example, this is what could be the code base for your Docker. So when you're creating a Docker image, that is what it will contain. That's JVM with the code or that JImage with the code inside.

So you package your code. You deliver it to the server, and then you start up the Java Virtual Machine. And the idea is that the server should actually be launched as a class from within your application code.

So it's technically not really different from, let's say, you reading or writing a file, you open the file and you start reading or writing. Well, this is kind of a degree of similarity here. Your Java code accesses the relevant HTTP server functionalities, but just basically creating an instance of an HTTP server as a class. And then attaching different behaviors to it saying, how would you like to handle operations, calls that are coming into the server? What would you like to do in response?

And tie it to the business logic that your application provides. Therefore, in this particular scenario, Java SE or Java MP scenario, Micro Profile, your application is essentially pretty much self-contained within its own JVM, possibly attached to its own Docker image. So that's how you run it.

Now, in Java EE world, the deployment is a little different. First of all, you would expect Java server to be prestarted on the application server tier. So you'd expect that to have a Java Virtual Machine, which already runs the program, which is your Java E server. So it starts up and runs.

The idea is that that server is never shut down. Well, unless you got some kind of critical maintenance, but, obviously, it's just running. Now, you form your applications as archives, but they are more specialized than just simple jar files, which is what you use in Java SE.

It's the same principle. These archives you form for the Java E environment, also Zip files, but they are more specialized. They're not just simple client side jars. In fact, they're categorized into jars, Java Archives, web archives, WARs, web archives, and EARs, Enterprise Archives, where the EAR file is essentially a wrapper around all other components of your application.

So you'll have one EAR file per application you'd like to deploy, and the application is internally structured into web archives that contain web-based components, so those that you want to directly interact with your users via HTTP. And then any other archives that may be embedded inside an EAR file, or actually embedded inside a particular WAR file, and these are the Java archives contain the rest of the code of the application, not necessarily the web-facing components, but any other backend logic, any other data classes, whatever you need, to make the application function.

One or more such application, one or more EAR file, can be call deployed within a same Java EE server. So the server becomes a hosting environment for a number of applications. So one JVM runs multiple applications potentially.

Whilst in the Java SE or MP scenario, that's not normally the case. You just have one application running per JVM in these scenarios. So it means that your approach to the application management is somewhat different, right? You would use the server tools in the Java environment, like Server Management Console to manage these applications whilst in Java SE or MP scenarios.

We don't really have any special tools or any special counsel beyond the ability of the Docker to start up or shut down the application. Well, I guess you may have Kubernetes, which manages a number of Docker images, but that's basically it. So there's no special server administrative environment to manage the application code, because in Java SE or MP scenarios, server P used to be just embedded into the application. Whilst in a Java EE environment, server is an entity of its own hosting the applications that you deploy to it.

The actual packaging, of course, can be done whichever way you like. I mean, at the end of the day, all you need to do is just form relevant jars. Or in case of enterprise applications, WARs and EARs. These archives need to be formed. And on command line, you just launch the jar tool, and you do that.

But you may ultimately need that process, and there is a tool that is widely used on a market to automate the packaging and deployment of Java applications, and it's called Marvin. And the purpose of Marvin is basically this. When you use a particular Java API, and there are plenty of them, as you probably guessed, and when you go to the Java EE or Java MP world, you'll find out that there are lots of different APIs there that we didn't even touch upon in the Java SE course. So this is like an ever-expanding market of different APIs, different frameworks, different additional libraries that you may consider using.

Anyway, so when you go into that world, you're thinking, well, what do I need to put into my class path? What do I need to put in a module path? Which are the libraries I need to use?

Oh, I'm using some server. Does that server has its own libraries? Well, yes, I guess. Especially if you're embedding a server into your application, of course you need to make sure you have relevant archives in your class path or module path.

In the Java EE world, similar questions need to be addressed. OK, the server is already running. You don't need to include server libraries into your class path or module path, but then there are other libraries there, like additional frameworks, I don't know, Java persistency API, validation APIs, transaction management-- you name it.

Yeah, there are lots of other things that the server does, and you may wish to include X-Ray APIs and reference X-Ray APIs from your program. And in turn, these APIs also have different versions. There would be all sorts of compatibility questions.

Can I use API A with API B? Do they work together? If they do, which versions I'm supposed to use?

And that becomes a task of itself. That has nothing to do with code writing, frankly. This is just the task of managing which jar files, which libraries, you use together, and how you put them together into coherent application deployment. So in the Java E world, that's precisely the kind of thing you need to resolve when you package the enterprise archive.

Would do you put inside? Which are the libraries you might need to use apart from your own code? Maybe some extra libraries, I don't know.

Same thing you have to think about when you packaging Java CE or MP applications, additional server libraries that you may have to carry with your class path or module path. And Marvin gives you the response to this question. It allows you all to make this process.

There's a repository in Marvin expressed via basically XML descriptors that are saying which libraries contain which code and how they're dependent on each other. If you use library A, then you need to use library B, and specific versions that are supposed to be used together. So that's just a tool that helps you all to make the production of that code.

It's, again, it is out of scope of this particular course, but it is covered in other training courses. So something to look forward when you start thinking, oh, I need to take the Web Services class from here, continue to another class. And then it's not just the code writing, which is obviously what the Java SE course is grounded in, but these are other development areas. If you'd like to think about it as a wider dev ops requirements that are not just to do with the way you write your code, but have to do with maintenance, with packaging. And obviously, then we'll have an opportunity to discuss further automation tools, such as Marvin, that come with these extra server side deployment and code management requirements.

## 3. Oracle Cloud Deployment, Part 3 19m

So in terms of the transport protocols-- so that's the other facet of the discussion in this lesson. One is how you host the service side code and the other how you actually communicate with it. You may use a variety of transport protocols. And on training courses, such as developing applications for Java E platform, we have a chance to discuss all the protocols, like HTTP, and web sockets, and RMI, and JMS. There are all sorts of different protocols available.

But I guess HTTP is probably the most basic, obvious, straightforward option that a lot of people would use. Hence, you need to probably be aware of some HTTP basics. So how does the HTTP protocol actually function? Well, it functions in what we call request response mode.

So your client can send a request and then get a response. The request and response in HTTP are basically messages, just text, just text, but they do contain certain characteristics that we need to highlight. First, the request will be sent to the server using one of HTTP methods, and there's some examples here-- get, post, pull, delete-- and there are actually other HTTP methods. Again, in follow-up training courses, such as the Web Services class or Java E class, you have a chance to explore that in more detail.

But anyway, so for example, if you just open a browser and you type the URL, unit browser address bar and just press Enter, well, by default that would send a request using the method get. But then there are other operations, and they treat the way you send requests from the client to the server in slightly different fashion. Such as, for example, in a method get, if you have any parameters, they're essentially passed as part of a URL, but in the methods, let's say, post or put, the data is also passed in the packet body, in the actual HTTP packet body when you transmit the request. So it's a slightly different way of wrapping up information and sending it to the server, but most importantly, it comes with this verb that indicates the action-- get, post, put, delete, et cetera. So you're saying, what do you want to call, which URL, et cetera?

Now, the server responds to you. And one thing the response will contain is a response code, status code. So the status codes represent the nature of the response. For example, 200 code stands for OK response, 404 for not found. Like if you call the page that doesn't exist, the server will respond with that.

So the codes may indicate the nature of response, what exactly happened on a server, to let you know the server's reaction. Then both requests and responses may contain additional headers. So, for example-- say, for example, you're sending a response. There are request headers as well, but regardless, in this particular case, the example shows a response.

So headers that indicate like when the response was produced-- it may be useful for caching reasons, I don't know. What else? What is the content type?

Is it HTML? Is it plain text? Is it picture? What did you get from the server? The length, the size of the response?

And suppose the actual body, the actual content, that the server produced. The presence of the body's not always the case, because, well, it depends upon the status code, I guess, right, and also the nature of the request. If you're asking something to be downloaded from the server, I guess you expect the body. If you have a status code of OK, then presumably the server generated some content. But then maybe your request didn't ask anything from the server, or maybe the response was like 404, page not found, and then you don't expect a response to contain the actual content, right, because you're indicating, sorry, I can't produce that content.

So the actual presence of the body in the request or response depends both on the type of HTTP request you submitted and on the status code of response, whatever the body is actually even required-- maybe not. Anyway, well, that's kind of the gist of the interaction between client and server. The connection between client and server lasts for a very short time, only between the point when a server submits a request and a-- sorry, client submits a request-- and a server produces a response. Then the connection is essentially dropped. The next call from the client will practically be another connection, and every such interaction is basically an exchange of requests and responses between the client and a server.

And many cloud-based applications use this protocol to interact with clients. And in fact, the Representational Estate Transfer Protocol, REST, is entirely based on this HTTP premise. So let's take a look actually.

So this is what the REST protocol is all about. Imagine on a server you have some kind of resource, like your product class maybe, and you would like to access that resource from the client. So the first thing that the REST protocol says is that it should map resource to the URL. Fine.

So we can map the product to some URL. Let's say product URL-- whatever. And then for that URL, you will code logic within a server to respond to methods get, post, pull, delete, possibly two other HTTP methods, like head and options. You code the server to respond to these methods.

And what I'm about to tell you is not really a standard. It's a convention. So the REST protocol, unfortunately, does not actually have a standard. There is no ubiquitous specification that everybody must follow.

There is a convention, which says, well, maybe this is how you should use HTTP protocol. And the convention suggests, that when you invoke a server resource via method get, then it should query something on a server and return you-- so in other words, if I call that URL with method get, I should get some product back, or products. I don't know. It depends on parameters, I guess. So you may have some parameterizations bolted onto that.

If you call the same URL but with method post, you're supposed to provide a request which contains a message body, which is information about that product that you'd like to create. So post properly creates a new element. That should be the server reaction to receiving post.

If you do put, the service should react in updating the relevant product. If you call the server resource with use an operation HTTP call method delete, then presumably you're requesting the server to remove that product instance. Head works exactly as get, except that the method head, the server returns you only headers, but no actual body. So get retrieves the product, and it comes with some headers, I guess. And head method, if you call it on a same URL, should return you only headers.

And typically, the way you use head method is to do cache control. So if you received some product information before and one of the headers states the time when it's valid, then you can call the same URL again with method head and compare the time. Basically, just look at the timestamp to see if the content you have already received through an earlier call using method get is still valid or not. That's a typical use case for the head method.

Options method may be used to retrieve information about other methods. So when you call that URL, how do you know what it's doing? So you can call it with method options, and it may respond to you with, oh, I'm doing this on method get, I'm doing that on method post, et cetera. So information about how the service interprets these methods.

But unfortunately, as I say, there is no actual standard that says that each and every REST service users these HTTP methods in exactly that way. It's a convention rather than an entrenched rule. But many services follow the convention-- not all, but many do. So there is a good probability when you're invoking some REST service, this is how it will work. Otherwise, you have to do a bit of guesswork, ask the server provider for documentation, and figure out how exactly the service works.

When it comes to the data structures that you transmit through these methods-- get, post, put, delete, et cetera-- well, again, REST service does not prescribe what that message format should be. It could be anything, really. It could be plain text. It could be XML.

But actually, on many occasions, REST services are invoked from clients running within a browser. And the clients that are run within a browser have something in common. They're very much likely to be written using a programming language called JavaScript. And JavaScript has nothing to do with Java, by the way, it's a completely different programming language. It's actually a variant of Lisp rather than a variant of Java, but it has a strange history, where some actually allowed to use Java trademark for completely different programming language, which is very odd.

But anyway, JavaScript language running within browsers, it uses the data representation called JSON, JavaScript Object Notation. And if that's the case, if you're using JavaScript client essentially, which you very likely to use with REST services, then probably it makes sense to transmit messages between the client and the server using the notation that is natural and native to that client, which is JSON. But you're not actually required to do that. Your REST service may use any data format you fancy, whatever you like.

So JSON is one of many options, but it's a frequently used option simply because of the nature of your client. It's likely to use JavaScript, but again, not always. You may write clients in other languages. That's up to you.

So that's what you expect REST services to feel like, really, a resource mapped to the URL. You're exchanging information with the client via HTTP protocol, interpreting HTTP methods, these verbs, as some actions that the service side resource should handle, and exchanging information with the client in some data format. You have to figure out which one you would like to use.

Well, let's take a look at how that server side code that handles the HTTP calls and responds to them can be written. This example uses the Helidon SE as our environment, and the examples with MP, Micro Profile, or EE servers you could find, as I mentioned before, other courses, such as Java E Development or the Web Services Development. Anyway, so in this example, we're just doing the basic Java SE environment code, and it's literally the kind of stuff you can just put into the main method of your Java program. It's just that instead of using, say, console or local files, you're channeling your input/output through the web server, in this case, the web server provided by Helidon.

So we start by creating-- well, actually, let's take a look at the end of this code. We end with creating a web server instance and starting it. So your program starts at the server, right?

What do we need to do to achieve that, to start the server? We need to provide two things. We need to provide a configuration, which describes the IP address or host name to which the server is related, and the port number on which it listens, and the routing component. Well, the routing component is a description of how we would like the server to respond to method get, pulls, post, pull, delete, whatever-- all the HTTP methods.

So the routing component will have a registry of a handler per method per URL. So, for example, in this case we're saying, if somebody calls us for the method get, and they call that particular URL, and the URL says product. And then it has some parameters maybe.

And then you can have an equivalent for post, pull, delete, head, options, and other methods. So you could have a method here. You could have URL, and then you have an association of that URL with an actual handler.

What's the handler? Well, handler is a place where you write your business logic. Or better, say it's a place where you write the interaction logic with HTTP request and response, and you invoke your business logic from that place.

I guess your business project will still be in your other classes like that. I don't have the actual code here on the page. But suppose there's some product manager class. You created a PM instance of that, and you call you find product method. This is your business logic.

But as you can see, it's wrapped up into this handler which places the code around it to actually consider HTTP inbound and outbound interactions. The handler is basically an implementation of a functional interface, which is it's a variant of BiConsumer. It's a functional phrase of BiConsumer.

I've got two parameters, a server request, server response, representing inbound and outbound direction of the communication. You can implement it just as a lambda expressions, as you can see in this case. Or you can write a separate class, essentially implementing handler interface, which in turn, as I mentioned, is a BiConsumer variant.

So what do you do? You get your parameters from the request? Yep.

That's my ID parameter right here. And you decide what you want to do with that parameter. In this particular case, I'm just passing it as if it's an int. Well, presumably it is.

And then I use that to query my product. But as I say, if you were doing methods like post, pull, delete, there are other actions you can before. You can update things. You can create new products. You can remove them-- whatever you need to do.

You need to consider how you interpret the actual inbound and outbound messages. But in this particular case, I choose to interpret them as just text plain. So hence, that's why my product is just converted to string as is.

Again, in a real-world REST service scenario, that will be more sophisticated than that. You will have like JSON objects, or XML objects, or something like that. And then you'll be converting your Java data structures to JSON, or to XML, or vise versa. But this is like a very basic example. Let's say it's just text, and you need to respond to the client with some kind of status code. In this particular case, 200.

Again, I would imagine you can make this code more sophisticated. You can have like different cases. Or the product is not found. Maybe you want to return some different code, like an error indicator. Consider that.

But otherwise, you form an HTTP packet. You set your headers, and then you send the result, which is basically, in this particular case, just a text representation of the product. So this is how you could relatively simply just take any existent Java SE code and wrap up that as an actual service.

And put it on a server, this program could go on a server. You can run it on a server tier, and that would be responding to client calls on whichever address, port, and URLs you've mapped with the logic that you coded in your handlers. So I guess we've observed in this lesson general approach to how you turn your application into something that can be deployed on a cloud. You have to consider the environment in which the application is hosted.

You can bring in a lot of automations around that environment. The code example you've observed is bare-bones with no automations at all, or practically no automations at all. If you consider using Java MP, Micro Profile, or Java EE, you'll have a much higher degree of automation in the environment management, et cetera. But nevertheless, you could relatively simply reframe your program input/output to channel it through some kind of the web server and deploy to the cloud.

Now, in this particular appendix, we actually do have an exercise, which is kind of unusual, because other appendices don't do exercises. But this one does. And it tells you to take your existing application and wrap it up into the Helidon SE, which is pretty much the example of code you've just observed, and run it within your cloud. In a way, you can access through the browser, I guess. Because as I say, we're just using plain text HTTP, so that's pretty much accessible from anywhere.

## 4. Oracle Cloud Deployment, Part 4 24m

Let's take a look at the practice for Appendix E, which talks about Oracle Cloud deployment. So in this particular practice, we're looking at a topic that goes beyond the kind of normal Java certification process, and it explores things that go beyond standard Java SE. What we're trying to do is enable our application deployment as a web server.

We're using Helidon SE. Helidon is a product which implements a web server for Java and can handle Java SE applications actually, but deploy them on a server tier and handle remote calls. And what we want to do is turn our Product Management Application into such sort of basic service. Well, let's do that.

So where do we start? We can continue with the previous exercise project, just continue with that. If you haven't finished the previous exercise, which is Lesson 15, the last exercise, 15.2, then you could open the solution for it. So either continue with a solved exercise or a solution for the last Exercise 15.

Now, what we we're going to do is create a new library, because Helidon is a product which is not part of the Java Development Kit. It's additional product. It's additional set of jar files.

You can download Helidon libraries from the internet. This is available from GitHub and other places. But the Helidon libraries were already loaded to this machine, but they were not registered with NetBeans yet. So how to do that?

We go to the Project Properties, and we go to the Libraries section, and we need to Add Module Path Libraries. Well, we've got modular deployment projects, so we need module libraries. And we add a library, which we don't have yet. So we need to create it.

And the library name, let me just check what we were told to call it. We're told to call the library-- what name do we give it? Helidon SE, yeah? OK, let's call it Helidon SE, as in Java SE, Standard Edition.

The Helidon comes with several different distributions. There's also Micro Profile distribution, Helidon MP. But this is like the most basic Helidon subset of libraries.

Then we need to add some jar files. And the jar files that we need are in the folder Home Oracle, and then underneath that, the folder Labs, and then there's a folder Helidon. And you just basically add whatever jar files you'll find here all of them. Well, quite a few, yeah?

So you can see there are quite a few different libraries that you have to had, because there are quite a few dependencies that Helidon has with other modules. And so we add all of these libraries. So they're now in a module path.

Next thing we need to do is that we need to adjust the shop class application to actually use Helidon, right? And firstly, we need to make sure we can use the Helidon libraries. There's an extra requires module directive that needs to be added to our module info, so we'll add that additional requires directive. It's a little ironic that the module is called Lapse Client, because really we're turning it into the server now, but oh well.

Now, in the shop class, we need to place comments on all lines of code inside the try block there, except the following statements-- that initialize resource formatter and initialize the product manager for the service loader. Everything else, comment it out. Well, the rationale behind why we put in comments in the rest of the code here, why we're commenting this whole thing out, is because this is the type of code that we expect to use when we interact with local console, with local file system. What we want to do instead is interact with the remote clients. Well, we will be dealing with server calls that we'll acquire from remote callers.

Now, there is a warning here that says that we not actually throw in the product manager exception. We'll deal with that warning later. So we'll come to that in a moment.

Now, what do we need to do next? We need to configure Helidon server that we'll launch eventually. So to configure the Helidon server, let's do the server configuration object.

So the logic goes like this. We have the server configuration. We call the builder on the server configuration, and then we invoke the bind address to get access to the internet address of the current machine. And then we also bind it to the port-- 4 times 8-- and we complete building the configurations.

Align the code whichever way you like it to be aligned, and let's do some import statements. We need to import internet address. And we also need to import-- now, here's the thing.

It doesn't show the server configuration as an importable option. Well, it looks like a bug again in NetBeans, because NetBeans doesn't realize we've included the requires a Helidon server here. This inclusion has not been probably realized by NetBeans.

So just hit the Rebuild All button first just to rebuild it. And hopefully-- yeah, there you go-- Add An Import appears. Yeah, so again, this is unfortunately a bit of a bug with this particular version of NetBeans. Oh, well.

So we're getting the local host from the internet configuration, and we're getting the port number. And we now have appropriate server configuration imported. That's fine. So if you keep getting this error, just hit rebuild button, and it will be OK.

Now, there is one more thing that we need to sort out. There's an underreported exception here, a known host exception. That's from this method. And obviously, what we need to do next, once we've sorted out all imports, then we need to add the catch clause.

We already have a try catch block. So we just add an extra catch clause to that, add a catch clause. And if you scroll down, we'll have an extra catch clause here, catch an unknown host exception.

Again, for now, ignore the warning with this catch. We'll sort it later. So we're catching this unknown host exception. That's fine.

Now we need to create a rooting object. The rooting object allows us to handle in common calls on different HTTP methods. You could say, how do we react to an HTTP method? And do we react to get method? How do we react to post, [INAUDIBLE], delete, whatever?

This is just a part of the code. We'll need add here URLs and handlers, but that's generally what you need to build. So the rooting object goes into this shop main method.

Format it nicely. And then we will in a moment build logic for the any method and for the get method. I know, at the moment, the logic isn't there, but we will get there.

I think the import will be required of the rooting object. That's fine. Import that, and we'll add some logic here.

Now, with the method-- with these methods, we basically need to implement an IO Helidon server handler interface, which is a variant of BiConsumer, and we can do it an lambda expression, really. So first, let's build a reaction to a call to a rootURL/ invoked on any HTTP method. And what we want to do is implement this handler, which accepts server requests and server response objects in the lab. You don't have to mention the types. You can just name parameters whatever you want.

And what we want to do is respond to the client with a status code 200 and send a message. Just what is the intended use of the service? And the intended use of the service, according to the message, is to specify the product ID and get information about a product in return.

So this is the reaction to the method, any. So we have here the logic that basically responds with the status code and sends the text message. And that's it. And that's for the method, a call on an HTTP method on the root URL.

The next one, we'll sort the get method. Well, as you probably already guessed, we will be retrieving the product information there in the get method. So we need a parameter in the URL which will correspond to the product ID, and then lambda expression, which will handle that ID and query the product. Well, lambda expression still needs to be built, but we'll come to that.

So we need an URL that contains a parameterizable beat, which is the product ID. And we will implement the logic, how do we query products? But I guess you already have a hunch what we're going to do. We're going to call the fine products method there. We're using that ID.

But there's some extra stuff that we need to consider. First of all, let's reserve a string variable that will just reference null for a moment, and that's where we'll store the result of querying the product. And then we'll need an extra try block, and it will become apparent why we need try block in a moment.

But anyway, we need to try block. And in this try block, we call the fine product method. What do we pass as an argument? Well, we pass an int.

But what do we get as parameter? We get this ID and that string. So we need to take that path parameter ID, which is text, and convert it to an int, and then pass it to the fine product.

Fine product returns as a product object, but then we convert it to text, and that's what we intend to eventually intend to return to our HTTP caller, the text of that product. So that's what we're are adding to this lambda expression, and we're adding here the try block. And we're populating the result variable with whatever fine product method returns, but converted to string, obviously.

And that would be the end of the try block. But you notice, they still don't have a catch. See, what the try block-- or the reason for the try block is because the fine product method apparently throws us product management exception. Oh. And that's the try block that we need to complete with this catch, and you can take this from the existing catch. It's already there.

You can just basically cut that and put it right inside after this try. So we just moved the code which was querying the product from the main method of the shop. We moved it inside the lambda expression that was implementing handler for the method get. So hence, we have to have lambda expression call in the fine product. And hence, we have to have try catch intercept and exceptions that may arise from product not found, et cetera, cases.

So we either find a product or we don't, right? But either way, we need to inform the client about, well, either the product we found, or maybe a message that we didn't manage to find it. So we need to produce some response to the client, and there might be two responses here.

There might be the case where everything is fine, and we're just telling the client, look, there is this product. Or there might be a response which is indicative of the fact that we didn't manage to find a product. So one goes into the catch.

So apart from just writing the log on a server tier inside this catch, we'll also want to tell the client what's going on. You need to report that you didn't manage to find a product with a given IP to the client. And then after the try catch, when we finish querying, we're ready to send the response to the client. So we'll do that. We'll send response to the client.

And what do we send to the client? We send the status, HTTP status 200. We send response headers, including the type of content, text, plain. We're always sending plain text to the client, in this case, encoding UTF 8. And we send in this result object, which is basically that text to which we converted our product.

And HTTP needs to be imported. That's another import we need to have. That's the component that enlists all status codes basically. So that's the logic of our rooting object.

If we call our Helidon server with just slash and no parameters, it will tell us that we need product ID. And if we supply product ID, it will try to use it to query the product. If it's able to, it will return us the product as text. If it's not able to, it will return us the message that says, product not found, which is quite a reasonable behavior.

Next. So we need to start the server, and for that, we need to configure it first. So we configure the Helidon server, and we configure it. Again, you need an import, of course. We can figure it with a method create, and we put together two objects-- the configuration object, which we initialized earlier, and the rooting object, which, again, we've initialized earlier.

And now, all we need to do is this web server dot start. Now, that's kind of a minimum requirement. You can just run it. Just hit the Run button, and there you go. It's running.

Now, if you want to shut down the server, this is this button here to shut it down. Actually, it's all in the notes. Once you start the server, it tells you to run, and then it tells you how to shut down once you don't need it anymore. And you can run it externally, if you like, from the terminal. It's just your normal Java application, just run it-- run in shop class as usual pretty much.

Now, there's one more thing that we need to do. We need to actually test it. OK, the server is running. Now, let's access that.

And do you see this IP address and import number? Copy that. Then launch your browser-- just any browser, or Firefox is available on your desktop-- and Paste the address here. OK, press Enter.

You will access the [? root ?] URL on that address, and it will say, specified to retrieve product information. Shall we? Product 101, there you go. That's your product.

That's another product, and that's a nonexistent product. We tested all the cases. There you go.

As I say, you can launch this application from outside of NetBeans through the terminal if you like. This is now a self-contained modularized application. When you were getting the nonexistent product, the error handler here actually prints the information to the console.

But otherwise, the server runs as normal. So that was caused by us querying the product 42 not found case, because we have this logger, an extensive trace. We could shorten it and not write this extensive trace, because, frankly, why panic about a particular product not found? I mean, it's not in your exercise, but that's probably a more appropriate level of logging for the situation when a product not found. There's really no panic that should occur in a server.

Just stop the server first. It's still running. Because we could code the logic here that reacts to some event and call the stop method. But we're just terminating Java runtime instead.

Anyway, just run it again, and do some more testing. So let's-- OK, that's product found. And let's do the product not found again. Do the erroneous product code, and you could see that we have way shorter message printed in this case, just on the info message, which probably is more appropriate in this situation.

But if you need full trace for like testing reasons to understand what's going on with your request, then, of course, you can, in this logger enable, more detailed logging if you want to. That's entirely up to you. And that's pretty much it.

So once you finish testing, shut down your server. And if you theoretically want to package it, and put it on another machine, and run it on its own, then what you need is Helidon libraries and your shop libraries in the module path. And you run minus module client shop. That starts up your server. It will start up your server.

You could just put all the components inside the same folder and just put one folder in the module path. Just put all these jar files that constitute the Helidon library in your own jars that contain your modules. And that's your distribution of code.

Great. So make sure you stop the server when you're not running. And remember, if you want to launch it externally, also you cannot really launch two different copies of the server that are linked-- on the same machine that are linked to the same port number. So if you want more copies of the server on the same VM, just make sure that each copy uses different port, which, I suppose, all of these things, like which IP address you bind into, which port you bind into, these are all configurable things, in theory. And you could not hard code them, like in this example, but pick them up from the configuration, I guess.

Well, this is a very basic form of cloud deployment of running something in a server tier. And the reason why it's so basic is because we're really just acting based on the knowledge we gain through the Java SE, Java Standard Addition, training. In reality, if you want to write more complex and more advanced server side code, then you probably need to look into Java Micro Profile, Java MP, or maybe Java EE, Enterprise Edition, which is defining significant amount of automations around a server side code for you.

But in terms of this particular exercise in this course, well, that's really it. You can learn more about the cloud deployment, about Java EE, about web services from other courses in Oracle Curriculum, such as Developing Web Service course or Developing Java EE Applications courses. All right, that is it.
