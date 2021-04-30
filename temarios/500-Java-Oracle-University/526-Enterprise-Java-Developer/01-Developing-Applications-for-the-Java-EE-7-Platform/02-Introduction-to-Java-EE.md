# 2: Introduction to Java EE

1. Introduction to Java EE, Part 1: Requirements of Enterprise Applications - 33m
2. Introduction to Java EE, Part 2: Java EE 7 Web Services - 21m
3. Introduction to Java EE, Part 3: Assembling Application Components with CDIs - 17m
4. Introduction to Java EE, Part 4: Java EE Packaging and Deployment - 15m
5. Practice 2-1: Configuring and Starting WebLogic Server - 6m
6. Practice 2-2: Configuring a Java Database - 5m
7. Practice 2-3: Configuring a JDBC Data Source - 4m
8. Skill Check: Introduction to Java EE - Score 80% or higher to pass

## 1. Introduction to Java EE, Part 1: Requirements of Enterprise Applications - 33m

Let's take a look at the introduction to the Java EE. This chapter takes a broad view over Java EE 7 architecture and its components. And it looks at the standards that are involved in Java EE, containers of Java EE, APIs, services, and then trying to map these to different application tiers.

What do we do with web container technologies? What do we do with business logic container technologies? What we do with web services? Try to match the technological areas of Java EE to specific application tasks, to what it is that we're trying to achieve with them.

We'll then look at packaging and deployment options.

And then, there is another important part of this chapter that talks about the way in which we use JavaBeans-- enterprise JavaBeans CDI beans, managed beans. There's too many beans around, so what we need to do is figure out which bean type is appropriate in what sort of circumstances.

So, understanding their life cycle, understanding their memory scopes-- without it, you won't be able to really consciously make a decision as to where which type of bean is going to be more appropriate. Linking components together with injections, with annotations, and with Java Naming Directory Interface.

Requirements for the Java EE application. Well, you see, the Java EE is a platform that caters for enterprise class application type, with applications that possibly span across multiple tiers. They might sit on different machines. They might be distributed. They might use internets to communicate between different parts of the application.

And a primary goal is to tie all these different types of components together in a fashion that would be vendor-neutral, so you would be able to use Java EE containers of different providers. So it's not just for Oracle. There's quite a lot of players out there. You name it. So there's-- Glassfish, there's a WebLogic server, there is WebSphere, JBoss, to name but a few.

What we're trying to achieve on this particular course is to explain the means of writing-- the ways of writing Java EE technologies that are vendor-neutral. Whatever you do in the labs on this course, it's going to work on third-party Java EE servers just like on Oracle's. It doesn't matter. It's very important.

And, of course, the frameworks in Java EE are component-oriented, so we're looking at this component-based approach to coding. Another important Java EE goal is to help developers develop the code. So compared to the Java SE development, the Java EE developers rely upon the application server for a lot of tasks. They don't really have to themselves deal with persistency or multi-threading or security or networking in those cases where the container can help them out.

So rather than doing these sort of plumb and code in your cells, you should trust the container to do it for you. And one of the important things that we study in this course is what it is, exactly, the container does for you with regards to every technology that we cover. What are the default behaviors upon which you can fall back where you don't need to code, an only code in those cases where you really need to express your business logic.

Let's start by taking a look at a structure and purpose of Java EE 7 server containers and APIs. It's quite a complex page. A lot of things are happening here.

First of all, there is a kind of a distribution of different tiers. The client tier, the presentation business logic tiers, and resource tiers on this page. These tiers represent logical areas of your software. They might represent external systems, such as a resource tier, which may represent a number of external applications, things that are accessed from the Java EE world. But these are not necessarily Java EE technologies.

So we may use a variety of different protocols to connect to these external systems and to communicate with them. That might include HTTP, RMI, JMS, as JCA protocols, et cetera. And, of course, databases. Well, technically, they're external from the Java point of view. They're almost kind of an external resource. But we manage access to them with a GWC protocol.

And really, databases is a bit of a special case. They're not just an external system. The database is a place where our application keeps its own information. So, from that point of view, although they're external to Java, they're not external to your application. They're really logically part of what an application does.

Client tier may be mobile applications, or browser, maybe desktops. So all sorts of different technologies are possible there. These days, obviously there's a prominent use of browsers and mobile devices, but maybe less so of desktops. It's kind of appearing less popular these days. But still, it's a possible type of client.

A variety of protocols may be used by clients to access the Java EE service. They could be HTTP, could be WebSockets. So we'll take a look at these protocols as well.

Within the Java EE server, we've got two profiles. One of them is called full platform. It's technically speaking not really a profile. It's, like, the whole Java EE 7. So full platform. And the other one is called Web Profile. Web Profile, if you like, is a kind of a cut-down version of Java EE. Ability to run Java EE server with some, but not all, features.

Specifically, what is not in a Web Profile. What's available only on a full platform. Ability to run remotely-invokable enterprise JavaBeans. Interesting enough, you can run enterprise JavaBeans in a web profile. That's not a big deal. You can. But only locally-invokable ones-- no remotely-invokable irrevocable. So that remote capability is part of full platform.

SOAP web services, which is what we develop with JAX-WS API. They're part of full platform as well. Java Messaging Services, they are part of full platform as well. And JCA technology, Java Connector Architecture. The JCA technology purpose is to write adapters to access external systems-- non-Java systems.

That's actually one of the topics that's not covered in this course, the JCA. It's mentioned here and in some other occasions but there is no chapter that actually covers it. Anyway, so it's probably an exception from the rule, because the other technologies are covered.

Now, with the web profile, there are some technologies that really emerge from Java SE world. Specifically, that would be Java Persistence API, Transactions API, bean validation technologies. So they are available not necessarily just for the Java EE, but maybe for Java SE applications.

And funny enough, that's actually precisely how we do exercises in this course. The chapter where we do the practice for Java Persistence API, the first exercise for Java Persistence API tells you to do it in Java SE environment. And then, in the next lab, we migrate that code into the Java EE environment. And it's rather important, because you'd see what level of automation Java EE container provides with exactly the same back-end code.

Now, what all the other interesting things that we need to consider. The web container technologies, of course, that will be servlets, JavaServer Pages, JavaServer Faces, Java Standard Tag Library, and Representational State Transfer API-- JAX-RS, that's for REST services. So these are the web profile things.

We are looking at a support for the CDI bean specification, and for expression language, which is the way of writing various expressions. We'll be using them in different areas, really-- JavaServer Pages, JavaServer Faces, for example --but in other areas as well. It's kind of universal.

Whatever the web profile supports is obviously also part of the full platform. So all of these technologies are available, generally, for any Java EE server. But watch out for the Java EE server certification.

When you approach a particular manufacturer, particular vendor Java EE server, check whatever it supports. Does it support a full platform, or is it just a Web Profile only. Because, remember, we were talking about an introductory part that this course is vendor-neutral. That's true. But, of course, when we go to the full platform services, we need to be aware that only some vendors might support them, not necessarily all. So that depends.

Also, let's just take a closer look at some of the terminologies here. The term Web Profile and web container-- we'd rather not confuse them, really. Because you see, the web container is a part that runs servlets, JSPs, JSFs-- this sort of code.

But a Web Profile is actually much wider than that, because it includes other things that the Java EE server is supposed to support. Actually, enterprise JavaBeans, for example. They are the part of the Web Profile, but the enterprise JavaBeans is a container of its own.

On that point, again, I should point out that we have two types of enterprise JavaBeans containers. There's a light container, and full platform, that will be called full container. So light and full containers.

And a full container is the one that supports remotely-invokable enterprise JavaBeans. That's the one that supports, I don't know, things like Java Messaging Services. So for these technologies, you need the support of a full platform. But it's a it's still an enterprise JavaBeans container. So container and profile and platform-- don't confuse these terms. They kind of mean different things, although they might have a same name, like Web Profile and web container.

All right.

I really should go through the differences between EJB light and EJB full containers with you. So the full container supports everything that the light container does, plus additional features. Let's start with light. The light is part of the Web Profile. So any Java EE server that supports Web Profile must support enterprise JavaBeans, but only in the light container scope. You can deploy their stateless, stateful, singleton session beans, but you can't call these from remote clients if it's an EJB light container.

Although all the other features, like, for example, synchronous or asynchronous method invocations, transaction management, like bean or container-manage transactions, declarative or programmatic approach to security, enterprise JavaBeans timers-- they're all supported by the light container.

So the full container adds to that an ability to invoke enterprise JavaBeans remotely, not just local-- obviously, local calls are still supported --message-driven beans, that's because the full container supports Java Messaging Service API, exposure of enterprise JavaBeans as SOAP web services with JAX-WS API.

There are more features on the timer service available in the full container, although timers are supported in light container. But there's things like timer persistency. That's part of the full container workout. And some of the support for the legacy APIs, for example, entity beans.

Don't confuse them with JPA entities. It's completely different animals. The entity enterprise JavaBeans is quite an old SON API, which we don't mention in this course anywhere, really-- well, maybe in a few places, just mentioned, but we don't cover it. It's a legacy-- it's for backward compatibility reasons, or, for example, support for CORBA objects. Again, the full EJB container supports CORBA, but not light. There you go. So these are the additional features.

Let's talk about front-end. So we looked at overall expectations from the Java EE server, what profiles and what containers we've got. And now, let's take a look at the technologies that we run within this container, starting from front-end technologies. Evolution of web design-- front-end, these days, is all about web and mobile applications.

So that would be evolutionary. Where it started is obviously just simple, static HTML documents. Then we progress to more dynamic content production with things like CGI scripts. Then, Java support for the web-based technologies kicked in with Java servlets. That was the first Java technology to support sort of web-based content, which added an ability to dynamically deliver content to users in a multi-threaded server environment, as opposed to CGI scripts, which kind of lack that ability.

Kind of an automation designed to improve the UI graphical sort of design of the web interface was introduced later, and that's Java Server Pages. Technologically, Java Server Page is basically the same thing as a servlet, give or take, but it's more sort of geared, more catering, for the web UI designers. It's a visual way of designing pages rather than just by coding.

And even further automation to the visual side of things, to structuring your code better, is Java Server Faces technology, which introduced a full model view controller support within the Java EE Web UI environment.

So you could have achieved model view controller architecture with all the technologies, I suppose, even with servlets in Java Server Pages. But it was not enforced. It was something you had to code. You have to provide that code for yourself. But in Java Server Faces, the MVC support is built in. You have no choice. It's the technology that's hinged on you using the MVC. So it's better structure in the code, I suppose.

And more modern fashion, using the dynamic components on the client, in a browser tier with JavaScript, and maybe invoking some services on a server with technologies such as Representational State Transfer, REST services, that add even more dynamacy to the client UI. I suppose it's an important move in terms of technologists, because, prior to that-- prior to the introduction of JavaScript and REST services, all the dynamacy of the web container was managed on a server tier.

And now what we have is we have an approach where we can combine dynamically-produced web content done by JSPs or JSFs with dynamically-handled UI on the client itself, and possibly calling back the server and benefiting from the use of various REST services.

Talking of model view controller-- you probably get where I'm heading, right. So that evolutionary path was definitely rigged to guide us towards this idea of structuring our code into these separate areas, where part of the code that deals with the view is responsible for producing the user interface, for managing the presentation, and for generating the UI events. User clicked on a button, user entered text-- these are the UI events. So the view is rendering the screen and is generated such events.

Model. It's a part of the application that is agnostic to the view. It doesn't know what the view is, doesn't want to know what the view is. The model is all about implementing the business logic, managing persistence. Right.

What about the controller there? Well, that's the part the joins the two together. The job of the controller is to subscribe to listen to the events generated by the view. So user clicks on a button in the view. The view itself isn't doing anything about it. It transports the event to part of the code which is known as a controller that handles that. And the way the controller handles such an event is that it tells the model what's going on.

So the user clicked on some button in the UI, which will support that event to the model, and we invoke some business logic based on that circumstance, right. So we're sending commands to the model through the controller. When the model completed whatever it was doing, the controller then could tell the view to render new UI, to refresh the screen, to show some new page to the user.

So it's kind of an intermediary, the go-between, if you like, the view and a model. On one side is transporting the events, and on the other side, is controlling what to display. But the model itself is really agnostic to the view, and vice versa. And the view is really agnostic to the nature of the model there. Not really directly interacting. They need the help of the controller to interact.

There are several reasons behind MVC. The first reason you could have developers specializing in particular areas of coding. Some developer could be an expert in doing the persistence, and another is an expert in doing the UI, and there you go. So, kind of a greater specialization for developers.

Also the reusability of the code-- if you developed a piece of business logic, you might use it in your browser application, or your mobile application, in your desktop application. You don't need to rewrite the logic every time. You just reuse the code by attaching the same model to different user controllers.

Or say, I don't know, you developed a website or something. You've got your view sorted out. And then sometime later, you decide that you want to go for a mobile application. And you don't need to develop everything from scratch, you just develop a new view part, which is your mobile app, I suppose, but you retain the back-end logic as much as possible. So the segregation of these areas really helps us to achieve it.

Just a quick succession of pages, really, focusing on specific types of web container UI technologies with regards to the model view controller. Remember, evolutionary page. We started with servlets. And servlets were kind of a first way of forming that web UI and dynamic web content in Java EE. That was the first stage of that evolution.

And what we could say about servlets is that they are Java classes. They're mapped to web URLS. They're invoked via HTTP protocol. They work in request-response interactions with a browser or with a client that calls them. What they don't do, they don't segregate model view controller. That part in a servlet application is just a servlet, really. It's not like these are different components.

So, from perspective of MVC, no, servlets are not really designed to do it. Hence, Java Server Pages were introduced a little later. And the Java Server Pages idea is to help us to facilitate that view production, where developers solve JSPs-- just basically form what they could have formed as a servlet --but they format in the style of a page. They design it as a web page.

So I suppose it's more intuitive to the web designers, because it's like modeling an HTML document, really. The model and controller parts in Java Server Pages still might be implemented with JavaBeans, and, actually, with servlets.

At the end of the day, this is the important point I'd like to make. A JSP, technologically, really is the servlet, because this is precisely what's happening here. Take a look. It says, converted and compiled into a servlet. Hmm. So you may design the page visually differently. But when it comes to actually running it, it is a servlet-- it's turned into the servlet, anyway. So it's another style of offering that web UI, but technologically, it's still a servlet. Right.

To help us tie the model part of the application to this JSP part of the application, to the view, we can use expression language, and we could use a variety of different JavaBeans and tag libraries to construct the link between the back-end part, which is the model controller, and the front-end part, which is the view.

Evolving the technology further-- and we're looking at another stage in this evolutionary path, that is the Java Server Faces. And that's where, for the first time, would see full separation of model view and controller parts.

There is a servlet that you don't write-- it's written for you --it's Faces servlet. And Faces servlet acts as your controller. It's a prescribed control mechanism. It's not something you code. You just need to learn how it works.

So there is an already written controller. What you write-- of course you write your pages, Java Server Faces pages that act as your view layer. But they're not converted to servlets. Oh, no. Java Server Faces pages are interpreted by the Faces servlet. They're not converted to servlets.

So you cannot directly put Java code into the Java Server Faces page. You're forced to keep it as pure view, as a component that just renders the user screen. To handle any logic in a JSF page, you write an expression, and you reference Java classes, your managed beans, that represent your model. And the controller, which is the Faces servlet, ties the whole thing together. It keeps them model and view together.

Terminology. There is a term here, managed bean. Now, it's a technology that emerged with the first versions of Java Server Faces pages, JSFs. And then it was broadened and rebranded. And the new evolutionary stage of managed beans is actually called CDI beans. So from the perspective of this course, they're kind of synonymous.

The older version, if you like, of CDI beans, was specifically designed to cater for JSF runtime, to provide the model for the Java Server Faces pages. But the newer evolutionary stage of these managed beans, called CDI beans, is designed to cater for any part of the Java EE server. You can use CDI beans, not just in JSFs, but anywhere-- well, obviously, in JSFs as well.

Another important technology these days is Representation State Transfer services-- REST services. What REST services are really doing, they're just giving us bits of functionalities that we can access via HTTP protocol. And these bits of functionalities typically represent some sort of features of the model. So these are bits of your business logic that you expose for this HTTP-based interface.

You could put any UI on top of it you like. The user interface that invokes the REST service could have been generated by JSP, or JSF, or for all I know, could have been just a plain HTML. It doesn't matter. So the user interface could be anything.

But what is typically happening is that you're delivering some kind of web content here, onto the client. And then, this client has bits of dynamic code running directly in the client tier, things like JavaScript, that call the server back to access additional pieces of functionalities.

So we're not just trying to produce the page dynamically. What we're trying to do is actually having some controller code in a page itself which is adding an extra level of dynamacy, talking to server-side components such as REST services. This doesn't have to be JavaScript, of course. You might have different other languages and components invoking REST services-- anything really. But JavaScript is a frequently-used example. So it makes sense to mention it.

Another technology that also handles things dynamically, directly in a client-- so sort of provision and control allowing functionalities directly in a client is a WebSocket. It's a new feature, support for WebSockets, it's modern technology, and it's a different protocol.

Really just check this out, this connectivity on this page. And if I may go back, connectivity here. With REST services, the connectivity was HTTP. With web sockets, different protocol, the WebSocket protocol.

And the WebSocket protocol is, indeed, different. First of all, it's full duplex. You see, HTTP works in request-response fashion. Your client sends a request, the server responds to it. In HTTP, interaction, the request-response, is the cycle. After your client receives the response from the server using HTTP, that's it. That's the end of the communication. The connection will be closed. A new HTTP request will have to be originated by the client in order to create another interaction.

But with WebSockets, only the initial handshake between the client and a server component happens via HTTP protocol. Initially, they establish an HTTP connection, and then they switch the protocol to the WebSocket. And once that happens, it's not just the client that can originate the call, it's the server component that can actually call the client.

So there is no sense of a client necessarily having to start a conversation, which basically opens up a whole host of opportunities for things like server-side push, where the server could actually actively send messages to clients without the client soliciting these messages in the first place. So a completely different dynamic of an interaction.

Mind you, that will mean that a server here which handles the WebSocket will have to keep an open WebSocket connection to every client. That would be more resource-consuming than your simple HTTP request-response interactions, where permanent connections are not maintained. So I suppose WebSockets can generally be characterized as something that allows you instantaneous communication between a server and a client, possibly with server [INAUDIBLE], but also something that might not scale too well because of the extra resources that server will have to allocate to maintain inclined sockets.

So scalability-wise, not so sure, but instantaneous response-wise, oh, yes. It's very important technology from that perspective.

And later on in this course, you'll see how that would be utilized, because we'll really use WebSockets in a later exercise to implement chat between users. Well, I suppose that's where the dynamacy and this point of an instantaneous response, architecturally, is rather important. So we understand why the socket might be useful in that situation.

## 2. Introduction to Java EE, Part 2: Java EE 7 Web Services - 21m

We did mention two types of Web services supported by Java EE, didn't we? We were mentioning REST services and SOAP services. Well, architecturally there's quite a great deal of difference between them. Let's take a close look. First of all, the REST services are working on top of HTTP protocol, Representational State Transfer services, just utilize HTTP protocol.

SOAP services are protocol agnostic. You can use them on top of whatever protocol. Obviously you can use them on top of HTTP, but this doesn't have to be the case for the SOAP services protocol independent. Then, I really love that part, see, on the right-hand side of this page I use the word standard. You wouldn't find it on the left-hand side would you? No. That's because there is no such thing as REST service standard. REST services are not a standard. They're convention.

It's an agreement that you probably would write code in a particular way. That's why it's not enforced. So a particular author, or REST service may or may not follow that agreement. Nothing is guaranteed.

With SOAP services, oh, yes, it is guaranteed. There's a very strict standard as to how SOAP services are to be formed. So they have to have formal descriptors and formal WSDL files, their data structures must be defined for XML, schema definition files.

They have a whole range of standards of their own, including security, reliability, addressing, transactions, and whatnot. If you're interested in learning more about that, well, obviously, we'll have a chapter on it, but generally, I'd recommend reading upon a consortium of companies which is called Oasis Group which is a standard keeper for any standards that are related to SOAP services. So there's a group of companies that standardize whatever you see in a SOAP services world. Such standardization is not part of REST services.

And I suppose there's a good reason behind these set of differences. SOAP services are designed to act as an exposure of your application model to another application. The purpose of SOAP service is to implement a backhand to backhand conversation, where applications could be written in different programming languages. They're not necessarily on both sides, Java here. It could be anything. They are just backhand talking to the backhand. What's important in the backhand to the backhand conversation?

Architecturally, standardization and compatibility are absolute priority if you're interconnecting different systems together because they are of different providers. Nobody guarantees anything in terms of compatibility unless you come up with a very strict way of describing that standardization. With REST services, however, the typical use case for the REST service is to hook your user interface to your application. It's not application A talking application B, it's your application talking to itself, just different parts of it. So therefore standardization is way less important because it's internal communication not external communication from that point of view.

What's important, however, if you are connecting the user interface, you really, really want to make it quick. So performance comes architecturally as a priority on top of the standardization of a flexibility. So the services are more flexible in a sense of maintaining long-term compatibility between applications. They are more flexible in terms of managing changes in a code. You can replace the SOAP implementation without affecting the interface, these sort of things.

With REST services, it's probably not the case, but they architecturally are designed for a completely different reason. They're designed to implement fast connectivity to the client UI, mobile browser UI, to cater for these cases of the client dynamacy that we were just discussing a couple of pages back.

All the Java EE 7 technologies that we've already mentioned that deserve a very quick look into them, we mentioned beans, Enterprise JavaBeans, CDI Beans, Managed Beans. Yes, there's all sorts of different beans and how they relate. So this page helps us to relate the beans and also helps us to relate different other resources, all right?

What would be the purpose of these different components? What would be the purpose of these different beans? Probably to handle business logic of your application, maybe implement connectivities with external systems, and maybe implement controller functionalities, this is how you use this set of technologies.

Other resources are probably all about external connectivities. Working with databases, with JMS systems here. Enterprise JavaBeans most likely catering for the production of the business logic of the application. CDI Beans, maybe business logic, or maybe controller logic, it depends, so could use them either way.

Remember CDI Beans, originally were called Managed beans. That's why the mixed title because they originated from the JSF runtime. But these days they could be used by any part of the Java EE system, not just by JSFs, all right.

Now the crucial difference between these beans is the way their life cycles are managed. The Enterprise JavaBeans, their lifecycle is determined by the type of the bean. So you've got three types for Session Beans, a Stateless, Stateful, Singleton, and one for Message-driven, Message-driven Bean. And that's that.

So these are the Enterprise JavaBeans. The CDI Bean lifecycle is determined by the memory scope and the context in which it is used. So with CDIs, it depends who's calling, which component invokes the bean because the bean is plugged into the component invoker's context. With the Enterprise JavaBean, who cares who calls it, if it's Stateless, or Stateful, or Singleton, it will be that type regardless of the context in which it is used. So that's the crucial difference, I suppose.

Another difference, of course, is that CDI Beans are just purely locally invocable. Last, Enterprise JavaBeans could be involved both locally and remotely. Although, of course, remember for remote invocations, you have to have a full platform Java EE server, apart from that you can.

Another point that I'd like to make is how the Java application will manage persistence. Well, that sort of depends because you can do it in different tiers. Of course, it could be your database. Oh, yes, by all means.

The manager of the application state could be just saving stuff into your tables, all right. But that's not the only option because you may manage application state within the-- say, for example, client, or web, or business logic tier as well. Now, what are the options there? Let's start with the client.

A client, even if it's just a browser-- well, of course, if it's a mobile device-- can just save files locally. Now of course, the browser saving files locally would have certain security restrictions, but there is an HTML file technology called local storage. You could use that, which is quite flexible. And then of course, you've got cookies. So you may use that. And if it's mobile application or a desktop application, I guess you can just save local files as well. So there's that option.

Pros and cons, not particularly secure is it? Yeah. So that's the obvious issue because we aren't really in a position to guarantee the client-side security. We don't know what the client needs in a way, where it runs, and what are the circumstances. So we generally don't really trust the security of the client.

Web Tier, well, if you just want to keep things in memory, you don't necessarily want to save them to the database, just sort of a classic example. You're shopping for something, you've got a shopping cart, you want to add items to it. It's just your web shop here. You may keep that information within the HTTP session objects for the duration of your interaction with the server.

Now the more stateful you try to make the code in that tier, the more resources you consume. It's the statelessness, the ability of the application to just accept the next client call without having to know any prior knowledge about that client, just next call. It's the best scalable solution, the more stateless application is the better from a scalability point of view.

But of course, state-fullness might be something that you have to embrace just to produce particular business functionalities. To remember things about a previous call from that client, you have to save that information somewhere, so potentially, you can use an HTTP session for that.

The Business Logic Tier also has an option for managing the state. And that is a Stateful Enterprise JavaBean. And I must say, this is a rare thing to use. What happens with a Stateful Enterprise JavaBean is that it is capable of establishing a link between itself and the invoker as a permanent connection.

You see, the permanent connection between a Stateful Session Bean and the invoker would make perfect sense if your invoker is a kind of a desktop application, like a desktop client. Then that particular client, establishing a permanent connection to the server and managing a number of interactions with the same instance of a Bean on a server kind of makes sense. Yeah, you dedicate that instance of the Bean to that particular client. So they have this permanent link.

However, what if your client is using a transient protocol such as the Web Tier client? If your client is any of these, servlets, JSPs, JSFs, if that is the way you produce the client UI, then of course, they wouldn't have a permanent connection between themselves and a browser, would they? No. Well, unless use the WebSocket, I suppose. But Otherwise, it's just a series of HTTP requests and responses.

So dedicating a Stateful Session Bean for transient clients seems like a real waste of resources. Yeah, you will be creating instances of beans reserved for clients, and yet you wouldn't be able to tell even if the client is still there at all. Maybe they have long gone. Maybe they closed the browser window. How do you know, unless they call them back?

Well, you can manage it with session times out and things like that. But until the timeout occurs, your Stateful Session Bean will be sitting in memory all right, taking up resources. So maybe that would not be the good idea to use with the web tier. Hence in a web tier application, you're more likely to choose to use things like HTTP sessions to implement required statefulness. And maybe if you're on a non-web but desktop client application, then maybe a Stateful Session Bean. Then as I've mentioned before, for permanent storage, we can also use databases.

On that note, I might wish to say that sometimes you may choose to use the database tier as a storage for web-based application state instead of an HTTP session. And here is the rationale behind that. When you are storing the application state with HTTP Session, it's an In-Memory object within a Java EE web container.

Say your server crashes, what happens to In-Memory objects? Gone, right? If you're running a cluster, you can replicate an In-Memory object for one class turnout to another. So your session will be available on the next cluster node.

A particular machine crashes, your server crashes, the user could be connected to the next available cluster node which has that session. Oh, which has that session. How do you know which node has that session? So your load balancer has to use the session stickiness.

Your load balancer will route the request from the client, not to any random Web Tier server, but to a specific server which has that session. That's an overhead. And it's an overhead that you will have to implement with every request response operation.

Everytime you process requests from the browser, you have to figure out which server has a session for it. So scalability-wise, not so good. Yeah, especially in a large cluster environment. We have lots of cluster nodes and these sessions are replicated to some but not all nodes. So go figure, yeah. It will be tricky to manage.

Well, saving the record into the table, that's pretty easy. Just dump it into the table, any node in the cluster can pick it up from the table later. It's not a big deal. So all bells wouldn't have to figure it out.

Would there be an overhead? Of course, because you are doing the input-output operation and by definition saving stuff into the database is slower than just putting it into memory. Yeah, there is an overhead, but it's an overhead that slows down an individual interaction between client and server. But you win over in scalability, in ability to support a large amount of clients.

So hmm, this is why this page is important. It shows you not the solution for a particular problem, but it shows you the options of what the solutions could be depending on the circumstances where the state management is required and exactly what you want to achieve with state management. And once again, generally, I would advise, if you can make your application stateless, make it stateless. Any state management is resource consuming.

If it's inevitable, and you have to make some kind of state management, think about where would you like it to be. Yeah, depending on the type of the client, type of connectivity, permanent connection, transient connection, and considerations regarding the scale of the system, I guess.

Next type of the component that I'd like to talk about would be the Session Enterprise JavaBeans. And there are three types, Stateful, Stateless, and Singleton. And if we look at the Stateful Beans first, remember these are the ones that have a permanent connection to the client.

So an instance of a Stateful Session Bean is allocated for every client and they kind of form a permanent connection there. Rather resource consuming, of course, so you really want these clients not to use transient connections like web browser based. No, no, no, you want them to be permanently connected, so you'd know when the line client breaks the connection and disconnects. You can scrap the server side object that you keep for it.

More commonly, you probably would use Stateless Session Beans. They are probably the most common type. A Stateless Session Bean acts as a pool of instances, a number of different instances in a pool where an instance is taken from the pool and is allocated to be used by the invoker for the duration of a single method call. So your caller that invokes the Stateless Session Bean gets the instance that no other caller is using but just for as long as the method call is carried out.

The next call from the same invoker could be performed in the same instance, could be performed in a different instance, all the Stateless Session Bean. The container will just pick up the next available instance and give it to the caller, OK? And finally, Singletons, Singleton is an Enterprise JavaBean that is allocated in memory once per your Java EE Server. So there is one instance of it shared between all concurrent invokers. So they all simultaneously can access the same instance.

Actually, that is something we'll have to talk about in a later chapter. And we'll talk about Enterprise Java Beans because we'll have to figure out how to manage threat safety and concurrent access to the Singleton Beans. If the instance is shared between all callers, potentially, that could be a threat and unsafe. So we have to consider it, yeah? But we'll talk about it in a later chapter.

So I guess in a web-based client scenario, you probably will be using Stateless Beans most of the time, maybe Singletons. And if you have a permanently connected client scenario, then maybe Stateful Beans, OK. More on that in the chapter that covers Enterprise JavaBeans.

Another type of an Enterprise JavaBean would be the Message-driven Bean. Of course, it is in detail covered in a later chapter about Java messaging and service API and Message-driven beans. But we'll need to conceptualize first, what generally the Message-driven Beans are. So Message-driven Bean is really a stateless asynchronous message consumer. It's the way to get messages to subscribe to receive messages out of queues or topics of a Java Messaging Server.

Different components can publish messages. It could be anything, really. You know, your clients, your CDI Beans, your Enterprise JavaBeans. They all push messages into your queues and topics. And the purpose of the Message-driven Bean is to give you a simple type of component that gets the messages out and process these messages.

For further business logic handling, you probably would not want to do that in Message-driven Beans themselves, but delegate the further business logic handling to other components that you normally would use to handle the logic, so Session Beans or CDI Beans. So they invoke from Message-driven Beans.

Really, think about a Message-driven Bean as just an inter-connectivity component, just to gather messages out. Maybe-- I don't know-- validate them or prepare them. And then just pass them on to be handled by the bulk of your application where you keep your logic code Session Beans probably. OK, so that's Message-driven Beans for you.

## 3. Introduction to Java EE, Part 3: Assembling Application Components with CDIs - 17m

Let's take a look at assembling application components with Context Dependency Injections. CDI, Context Dependency Injections, is an API that allows us to manage interconnectivity between different parts of a Java application. It's kind of the crucial thing that allows us to hold the whole thing together. So bits of the business logic that implement the bulk of your application functionalities are to be connected somehow to the view, to the controller, to the other parts of the system, or just generally be interconnected between themselves.

The model of your application is typically represented by components such as Enterprise JavaBeans, but might be implemented with the use of just normal beans or external resources. There's a good example of external resources here, so EntityManager to manage persistence or connectivity to JMS queues or topics. So all sorts of different context objects that represent resources that your application needs to use, they could be injected with CDI injections, of course Enterprise JavaBeans, CDI beans. Remember, the older name for CDI beans is managed bean. That's historically where the CDI beans has evolved from.

This page allows us to quickly appreciate sort of main points about every type of bean here. Enterprise JavaBeans come from javax.ejb package. And they are maintained by the Java EE Enterprise JavaBeans container, which, remember, could be light container or full container, depending on your profile. The Enterprise JavaBeans may be called remotely. Remember, CDI or managed beans cannot be. They may be called remotely or locally.

If the CD-- if the Enterprise JavaBean is stateful, then it could certainly be passivated. We'll talk about passivation in a later chapter that's dedicated to the Enterprise JavaBeans. But it's a feature that allows you to save the bean state. Remember, statefulness is all about state management, yes, save-the-bean state on behalf of the client. That's what stateful session means. Can work with timers, can be invoked synchronously or asynchronously.

CDI beans-- they evolved from the managed beans. Managed beans was a technology specifically designed for JSF container, JavaServer Faces. So here is a package javax.faces.bean, whilst the CDI beans are in different package javax.enterprise.context. A reason why I'm saying that-- some of the names are the same.

For example, we have requests called CDI bean. And we have requests called managed bean. The annotation looks exactly the same. But one is coming from one package. And the other is coming from another package. So just watch out.

When you look at the import statements in your application, make sure you got that right. Are you using the older managed bean API? Or are you using the newer CDI API? But generally, the whole point is that it's an ability to create pieces of logic typically used by web container, but not necessarily. They evolve from bean used in web container. But they might be used in other containers.

We're about to look at a number of examples of the CDI and JSF managed beans. In the next pages, all of the examples will be shown with regards to the use in a web container. I must say that generally they might be in other containers.

Also, there is this file beans.xml, which is actually optional. You don't have to have it. But it controls the way you load CDI beans, the way you process them. So it's kind of a deployment descriptor for CDI beans.

In earlier Java EE versions, to use CDI beans, you actually had to use this file. But in Java EE 7, this mandatory aspect of having that deployment descriptor has been dropped. You don't have to have it. Only if you want to alter the way your CDI beans work, then you put the beans.xml file in. Otherwise you don't really have to.

Actually that is concerning-- that's true concerning all sorts of deployment descriptors. They are all optional these days. But we'll talk about it later.

So I promised you some examples of CDI beans. Here's the one. It's request scoped. Request scoped is a bean that will be instantiated for every request that the web container processes.

So user calls in some servlet, user calls in some JSP, JSF, whatever. A new request, HTTP request, comes into the server. If that servlet or that JSP or that JSF is trying to use the bean called MyBean, MyBean is annotated to be request scoped.

And that will cause the server to create a new instance of this bean for every request and attach it to that request. So for example, let's think about it. What if a couple of server-side components share requests between each other, like that HTML page had in our servlet or JSF or something? They process the same request.

Would these two different components look at the same instance of the bean? Oh, yes. It's one instance per request. So it's a way of sharing that information between servlets, JSPs, filters in a context of [INAUDIBLE] request.

Let's take a look at a next example, session. Any number of requests coming in from the same client will have one session context. So if you created a bean that has a session scope, like this, that will cause the bean to be instantiated once per session. A call that a user makes to any page, any servlet within the same session, so it's done by same user, same client will encounter the same instance of this bean. It will be instantiated for you once per session.

Did you notice one more thing in this example? implements Serializable interface. Why is that? It's because of the statefullness of a session.

Remember, a session can be saved, can be replicated between nodes in a cluster. Do you want to put something into the session? How are you going to replicate that in other cluster node if that is not a serializable object? There you go.

So whatever beans you put into sessions ought to be implemented in Serializable interface. That's not necessarily true for all CDI beans. They don't have to. But here it kind of makes sense.

Application scope-- an instance of the bean is placed into memory once and shared between all users of your application, not to just a particular session, not just requests from the same user or any user or any page. This is basically, give or take, like a singleton, isn't it? You're creating an instance of that bean. And then you're placing it in memory to be accessed by everybody, so shared between all the callers. So that's application scoped.

Another interesting scope-- this scope is unique to JavaServer Faces. Notice the package name here, yeah, so faces.view or faces.bean. There are two styles in which you can form the view scope bean.

This is the CDI style. And this is a managed bean style, so the older, the newer. You know, the CDI is newer. The managed bean is older style. But they're compatible. So you could use any style you like.

Anyway, what's happening in these examples? It's a very peculiar scope. Page scope, view scope is a scope that links an instance of the bean to a specific JSF page.

Remember request scope? We had an instance of the bean linked to the request. If one page forwarded the request to another page, there was still the same request on a server. So request scope, there will be one scope for two pages if the request was forwarded from one page to another.

But with view scope, it won't. A view scope is unique for every page. So you go to page a. There's one instance of this bean.

Your user then progresses to page b. There will be another instance of this bean for another page. That's the view scoped idea. All right.

And obviously, because it's unique to JSF pages, you probably would not use it anywhere else. So it's a kind of example of an API where it shows its true origin, that CDIs emerged from the JSF world initially.

Conversation scope-- formerly, also a scope that was unique to JavaServer Faces, to JSFs. But it was expanded to work with-- in the Java 7 actually. It's a new feature. It was expanded to work with other components in a web container.

Conversation scope is a bit like custom session, if you like. So you can actually control the start and the end of the scope yourself from your logic programmatically, starting and ending that scope where you want it to start and end. So I suppose it solves one of the problems that we have with sessions, that if you put too many things in a session, the session lasts for as long as a user is still active.

So if you have session scoped beans, they tend to stick in memory for a very long time, taking RAM, taking memory. So if you want to create an instance of the bean and keep it in memory just for the part of a session, for just a group of pages, then you may wish to use conversation scope with that. OK.

Another interesting scope-- dependent scope. Do you know what is interesting about it? It's the scope that you achieve with no annotations. You don't need to write an annotation that says dependent scope.

Actually, if you want, you can. But you don't have to. It's a simple POJO. You just got a simple bean.

If you have a Java bean and you inject the bean into another CDI bean, that is implicitly be a dependent scope. Such bean will become application or session or conversation or request scope, depending on where it was injected to. So you could create a bean that has no annotations, doesn't say, I am a session scope, no. Just inject it into another bean that is annotated with session scope while other dependent bean becomes session, just based on the virtue of where it was injected to.

So it's kind of ability to determine the scope of the bean by the context from which it is used. OK, it's quite interesting. I must say, it's not a complete list of all memory skills. But shows you some examples, probably the most obvious and frequently used ones.

Injections, injections-- we were talking about injecting beans. Well, how? OK, here are some examples. This is the bean. So request scoped, right, in this particular case. But it could be anything.

The bean has some properties like this productName with get and set methods. That's a property. And there's some business methods like this placeOrder. So say we want to reference these properties and methods from somewhere. How do we do that?

If you want to inject this bean into another class, this is what you need to do. Inject. That's OK. You can just go ahead and use the bean. You don't need to write any code that says, new product, or you don't instantiate it. No, you trust the container to create an instance of it for you.

However that will happen depends on the context in which this particular class works. The context determined by the bean scope-- that will determine the number of instances. Is it request of session or what?

If you want to inject it into the page, not into another bean but in a page, you could simply give the bean an alias, if you like, named alias. And there you go. Reference that named alias. Actually, the named alias is optional. You don't have to have it. But without it, you will have to use the class name.

So, I don't know, if you're constructing a web page, using a shorter name might be more convenient than using the class name. But apart from that, the name is just a convenient streak. And using these dot notations-- dot product, dot placeOrder-- you access properties and you access methods of the bean.

What it is that you're really injecting? You're not really directly injecting the ProductOrder bean here. You're actually injecting a server-maintained proxy.

Java container, Java server creates behind the scenes, you don't see it, it's invisible to you, creates a proxy object. That proxy object references the ProductOrder bean and gives you that reference in your code. That object resolves several questions regarding the bean life cycle.

That proxy object checks if the bean has already been instantiated or not. Does it have to be instantiated? Or can we just use existing instance figuring out what its scope is? so doing all the plumbing work. You don't need to write any of that code. That miraculously magically happens.

Just use inject. Just use the alias dot property. That's it. It's much easier to code that way, isn't it?

## 4. Introduction to Java EE, Part 4: Java EE Packaging and Deployment - 15m

Now let's take a look at the Java EE packaging and deployment. That's governed by the JSR 88 standard. And it's all about how you form that code base with which you go and deploy the code to the Java EE server.

To deploy the Java EE application, you could put the code or the application into the Enterprise Archive. That's the EAR file. And then within the Enterprise Archive, you can place various modules-- like Web Archives, WAR files, or Java Archives, JAR files-- that contain further code of the application. Theoretically, you may deploy just a WAR or a JAR without wrapping it up into the EAR file.

You can if your application is simple and small enough, I guess. But really, if you want to combine different libraries together, assemble a more complex application code-- just have a better control of the application, I guess-- you could put it in an EAR file as a wrapper for a number of different archives. Please note-- it is rather interesting-- that you now have an ability to do the call deployment.

Enterprise Java Beans may be deployed as a separate archive. Oh, but they may also be deployed directly in a WAR file. Notice. It's just an Enterprise Java Bean module plunged into the WAR files straight ahead. Of course, that would deploy such Enterprise Java beans to the EJB Lite container. So no remotely invokable beans that way. Locally invokable ones.

But if you want remotely invokable ones, you can always form a separate archive and deploy the full container. So there you go. But this call deployment might be practically very useful. On many occasions, you might not wish to have Enterprise Java beans remotely called. Just call them locally from your web tier, and that's it. And then why bother with a separate archive? It might be practically enough to just use the EJB Lite container.

So there you go. That's the Java EE deployment format. Please note that the deployment descriptor files-- web XML, application XML-- are optional. You don't have to have them. But what they allow you to do is to alter the deployment properties, to allow the person who assembles and deploy the application to control the deployment process without changing the code of the application.

Also, the example shows the files which have this WebLogic prefix. WebLogic application XML, WebLogic RAR, WebLogic EJB, JAR, whatever. So these provide specific deployment descriptors. You may put them into your archives if you target the archive to particular application server.

Actually, if you deploy them to another application server, they will simply be ignored. So if you deploy that WebLogic thing onto, I don't know, GlassFish, for example, GlassFish will simply say, I have no idea what that file is. Just not use it. But what they allow you to do is use provider-specific extra properties. Extra features, and tailor the code to particular provider environment rather than just a generic deployment.

Talking of a deployment descriptor versus the annotation. You can achieve exactly same thing with the annotation and with deployment descriptor. See, in this particular case I create a stateless session bean. And in this particular case, I'm creating very same stateless session bean. I could write the annotation stateless, or I could create a clause and just describe it as an Enterprise Java Bean type of stateless or stateful or whatever.

Now, that means that you really could control the code whichever way you like. For a developer, it's more convenient to use the annotation. It's just a single line of code instead of typing all of that XML. However, from the deployer point of view, if you want to change and alter the property of the deployed object, what you don't want to do is go back to the source code and change that. As a deployer, not as a developer, you don't want to change the source code.

So hence the deployers tend to benefit from using the deployment descriptor, and developers find the annotations convenient. Can we reconcile these two approaches? Oh, yes. You see, if you provide both then the deployment descriptor takes precedence over annotation. Essentially it overrides it.

So that means that as a developer, I don't need to bother with XML deployment descriptors. I just write my code with annotations. As a deployer, if I need to alter anything, I don't need to mess about the developer's code. I just alter what I need in the deployment XML descriptor without touching the source code. So these two options available not just for Enterprise Java Beans, but for everything else. So that's the general approach to how you use the annotations and deployment descriptors. They can complement each other.

Actually, this is an example where they can really complement each other. See, I inject here a resource into my code. Just resource. Call it mail host, whatever. And here, I describe what that resource is in the XML deployment descriptor. I give the meaning to that mail host. I'm saying, oh, it's some string. And this is the value.

It's a classic example of how Java EE deployer can supplement the code written by developers. Developers don't know where the future location of some mail host is going to be. Deployer knows that. So developers just inject the resource. They agree upon the name. Let's call that Resource Mail Host. And deployer will figure out what the value for that variable ought to be. So you use a combination of annotation and deployment descriptor.

Now, all sorts of resources can be described in your Java EE application. This could be Enterprise Java Beans. This could be data sources, all sorts of things. There's apparently a global naming convention to look up and resolve resources. And this is a new feature in Java EE.

In earlier versions of Java EE specification, these names were not standardized. So there were slight variations in exactly how the URL pointing to a particular bean or resource, whatever it was, was actually called in different application servers. So we're reporting code from JBoss to WebLogic or whatever, and he had to do minor adjustments to these namings of objects.

Fortunately, as you see in this latest edition of Java EE, it is now standardized. So you've got this ability to look up the names regardless of a server provider. Now, here's the idea, how it works. So you have this prefix, java:global. java:global means you are looking for a resource that's not in the current EAR file. So there's another EAR file that contains another JAR that contains some bean. There you go.

I'm looking for a bean which is in another JAR file in the same EAR file. Second example, Java app. So this time I'm saying it's not another application. It's the current application, just another JAR file that contains the bean.

Bean that's local to my current JAR, you can use the module prefix or just the bean name, really. Just the bean name. If you're looking for remote or local interface of the bean, it's actually in the notes text in the manual. Exclamation mark followed by remote or local interface name could be used to look up, not just for the bean but for particular interface.

So that's generally the idea. You've got this global JNDI convention supported by the Java EE server, how you name your resources. And the resources can be described with annotations, not necessarily with XML descriptors. But if you provide an XML descriptor, that will override the annotation.

Injecting resources. You could put the annotation call resource followed by the look-up. That's the JNDI name. I'm looking up for some data source. I don't know, whatever. Or some Enterprise Java Bean. Anything, really.

Well, some examples here. The example on the top. This is how you define a CDI bean. This is how you inject the CDI bean. This is how you define an Enterprise Java Bean. This is how you inject an Enterprise Java Bean.

So slightly different annotation to inject, @EJB instead of @Inject. And if you want to inject any other resources, @Resource. Do you want to inject a group of resources? There's an annotation called Resources which contains inside one or more of these. So you can group them together should you wish to do so, put multiple resources.

Now, when would you have to make a JNDI look up? Why wouldn't you just inject all the time with these very convenient injections? Well, you see, your code that looks at the component might be running outside of the Java EE container. On a client, for example.

So outside of the Java EE server, you don't have this container that would process your injections. So from the outset, from the Java SE environment, essentially, what would you going to do if you want to resolve some Java EE resource? You will have to connect to the Java EE server.

And that is done with establishing this InitialContext object, the connectivity with the server. Now, the InitialContext object allows you to accept properties, a hash table of properties, as a parameter in the constructor. Well, actually, it's probably more convenient. You can put it in JNDI Properties file. That JNDI Properties file, just put it in the root of your classpath. Just in root of a classpath in your archive, and it will be picked up automatically. If you don't want to code it.

What the file contains, URL where your server is, port on which you need to access the server, connection factory. Could actually contain authentication, username, password with which you connect to the server. That allows you to connect to the Java name and Directory Interface of that particular server.

Once you've connected, start looking up for your resources. There you go. We're looking up data sources. We're looking up Enterprise Java Beans. Whatever we need to look up.

So in the course of this first big presentation of the course, we've covered a lot of ground. We looked at the overall expectations from the Java EE server software, which standards are supposed to support, full profile versus web profile, what are the possible containers, what are the APIs and services the service supports. We look at how they're mapped into the tiers. We looked at how we map these different features and APIs to tasks of the application.

Which components would we use to implement business logic, which components we'll use to implement statefulness, how do we implement services, et cetera, et cetera. So we try to make sense out of the vast array of Java EE 7 technologies. And obviously on many occasions have to say during this presentation, oh, that will be covered later. Because of course, the details about these technologies will indeed be covered later.

Then we looked at how we pull all of these different components together using the injections and using the JNDI look-ups. So making sure the components are talking to one another. And then finally, of course, we need to understand how they're packaged and how they're deployed to your server environment.

Well, that concludes the first important presentation regarding the Java EE 7 architecture and its technologies. In terms of the practical exercise, for this particular session your task is not to develop any code just yet. Your task is to set up your practical environment, set up the NetBeans, make sure you have your WebLogic server configured, because you're going to use it on all the later exercises. And finally, make sure we've got a Derby database configured with some products table, because again we're going to use that in our subsequent exercises. So that's preparatory exercise.

## 5. Practice 2-1: Configuring and Starting WebLogic Server - 6m

Let's take a look at practices for lesson 2. In these set of practices, we configure our environment that we're going to use throughout the rest of the course. In practice part 1, 2 part 1, we configure and start WebLogic Server instance. Then, in practice 2 part 2, configure Derby Database and populated with data. And in part 3, configure JDBC data source so that our WebLogic Server can point onto that Derby Database and use it.

Let's start from practice 2 part 1. So, our task is to configure WebLogic Server and make sure we can run it from NetBeans. What's already on these machines where you're doing the exercises? Java development kit is there already. NetBeans is there already. And WebLogic Server is there already. It's just not configured yet, so that's what we're going to do, create a necessary configuration. We're starting NetBeans and then-- well, starting NetBeans, let's do that. It's on your desktop. Just open NetBeans. Coming right up. You can close the start page if you don't want it. It's not really needed for anything, so you can close that.

Now, the next thing we're going to do is in NetBeans, invoke services window. You can do for Windows services, if you like-- Window and Services-- or just click on this Services tab here. Well, you get to the same place. In the Services window, under the Service section here, add a server. And we're going to add an Oracle WebLogic Server. Click next. So you're asked to point to server location, and that's the correct server location. You should get a correct path by default, so it's home/oracle/weblogic/wls12210/wlsserver. That's the place where the WebLogic server is installed, so it's this field, right. And then, well, click Next.

And then, you need to point to a place where you would put your domain configuration folder. So it should be user/projects/domains/base_domain. Again, that should be correct path straight ahead out of the box. User name should be WebLogic. Password should be welcome1. So make sure you put the passport as welcome1. And that's it. You're ready to go.

Now, when you've pointed to the WebLogic Server domain from NetBeans, once that's done, you may be prompted, at this stage, to enter the default keyring password. If you're prompted to enter that, type Oracle as the password. Click OK. If you're not prompted, you're not prompted. Fine. Next, start the WebLogic Server. Let's do that. So start it, and when it will finish starting, you'll see this small screen sort of icon here that indicates the server has started successfully. And start the server. That's it. It might take a while, so don't hold your breath, yeah? Just wait for the server to start, and then we'll resume to the next step of the exercise once the server is started.

When the service startup completes, you'll see that running message. You'll see this small green sort of icon to the side of WebLogic server that it has started. And the next thing you're asked to do in this exercise is to invoke WebLogic Server admin console. And just make sure you can log in there with user name WebLogic and password welcome1. So let's do that. You could just simply view admin console, like this, and make sure you log in as user WebLogic and password is welcome1. There you go. Log in. You can remember password if you like.

So, coming right up. There's your WebLogic Server environment. I suppose you can make the screen a little bit-- you know, zoom into it, if you like, so you see better. Now, let's proceed to the next part of this chapter's exercise.

## 6. Practice 2-2: Configuring a Java Database - 5m

In practice 2, part 2, our task is to configure a database, and the database, we're going to use throughout the rest of the course. We need to configure that and populate it with some data.

Go back to NetBeans, open the services panel, then open the databases, expand the databases section, and under the Derby DB section, invoke the menu create database. You will need to fill in the properties and the dialogue. The database name should be product, username oracle, password welcome1.

So that means you're going to go to databases on the services tab. Java DB, there it is, create database. OK. Product oracle, that's the username, and welcome1. welcome1, confirm the password. Click OK, and that should create a database for us.

Now, you will see this bind in exception, address already in use. That's because WebLogic server already started that database. So NetBeans is kind of when it creating that, it's sort of trying to start it again. And it shouldn't, really. So this is a strange area, you can just ignore it. The database is perfectly run, and you just create it yourself, this configuration. That's fine.

So just proceed to the next step in the exercise. Well, it's actually-- yeah, so you successfully created it.

Now in this next part, we need to run a script called create DB objects. It's located in home oracle lab's resources folder, so we need to execute that script to populate database with relevant tables and, you know, database objects.

So go back to NetBeans, go to File, Open File menu, go to the oracle labs resources folder. Pick up the file, create DB objects SQL. Open that.

OK. To execute this file, pick up the connection to your database. Should be product database, the one you created a moment ago, and execute that script. Right. OK, so you could see what was going on.

Now, the two errors that you have here are because of these two statements. Drop in the product table, drop in the sequence before creating them. The script is written to reset the database should you wish to do so at any stage later. So just reset values to defaults.

And for that, the script is written to first drop objects and then create them. Obviously, when you run it first time, there's nothing there to drop, so these two statements at the beginning give you an error saying, well, can't drop it, but we then create the objects successfully.

You can actually verify if you created them successfully by expanding the product database, expanding the schema, and looking at the products table that he just created you can view the table data, they you go. So this is what we just populated into the database for products.

Right, well that is that test procedure, verification procedure. Once you complete that and you observe your products, you can now close that window. You don't need it anymore. So let's go and close all of these SQL script windows.

And that will do it, really, so we can now proceed to the next part of these practice exercises.

## 7. Practice 2-3: Configuring a JDBC Data Source - 4m

In Part 3 of the Practice 2 set of exercises, we are configuring a JDBC data source so that a WebLogic server would be able to access the database of ours. Well, let's just open a browser and navigate to the WebLogic server console. It could be already open, because you've opened it in the early exercise. So that's your WebLogic server console, but just in case, if you want to refresh it, or if you need to log in again, obviously, you can do that.

Under the Services section here, you'll find Data Sources section, Services, Data Sources. And that's where you need to create new data source. So let's just check the PDF file and see what exactly we need to do-- find the Data Sources section, create generic data source with the following properties. It should be called productDB. And the JNDI name should be jdbc/productDB. Type should be Derby.

OK, well, let's do it. So New, Generic Data Source, call it productDB. The JDBC-- data source JNDI name should be jdbc/productDB. And the type should be Derby. There you go, click Next.

So once you've created that, a Derby Driver Type 4, yes, that's what you need to use. You can now, obviously, check that with the exercise, so click Next on this page. And then, on the next page, click Next as well, so transactional properties.

So that means that that's what we do. We confirm that that's the driver, click Next. We confirm that, yes, it's set up to use XA transactions, fine, click Next.

Now we need to configure the database name, which is product, hostname, which is localhost, port 5127, database user name oracle, password welcome1. It's exactly how you've created the database in the earlier exercise. But if you want to make sure these are the properties-- yeah, database name product, localhost, 1527, oracle, welcome1, so click Next again. I'll do that-- Next.

On the test configuration, that's fine, just click Next. And then here, make sure you select AdminServer. What you want to do is, you want to make sure you target that data source to be available on your WebLogic server. Current WebLogic server instance you're using is called AdminServer. You are target to your data source to it.

And that's it, Finish. That concludes this exercise for Lesson 2. We're going to use this data source throughout the rest of the course in all other practices.

## 8. Skill Check: Introduction to Java EE - Score 80% or higher to pass

Skill Check: Introduction to Java EE

View Skill Check
