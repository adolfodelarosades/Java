# 6: RESTful Web Services: Overview

   * RESTful Web Services: Overview: Part 1 29m
   * RESTful Web Services: Overview: Part 2 6m
   * Practice 6-1: Enabling RESTful Management Services for WebLogic 2m
   * Practice 6-2: Exploring WebLogic RESTful Management Services 3m
   * Practice 6-3: Updating Jersey (JAX-RS) 3m
   * Practice 6-4: Creating a Basic RESTful Web Service with JAX-RS 5m
   * Practice 6-5: Exploring a REST Service with cURL 2m
   * Skill Check: RESTful Web Services: Overview - Score 80% or higher to pass

## RESTful Web Services: Overview: Part 1 29m

Let's go ahead now and turn to RESTful web services. So far, what we've done is we just went through an overview of SOAP web services, and then we created a JAX-WS web service client. And I was using either the WS import engine, and of course, all the dispatch client.

Now what we want to do is get into the RESTful web services. And we're going to take a look at an overview of these RESTful web services. So we're going to look at the RESTful web services architecture and how it can be applied to web services, and design RESTful web services, identify resources, navigate RESTful web service using hypermedia, select the correct HTTP method to use when duplicating-- of course, a request must be avoided-- and identify the web service result status-- and looking also at RESTful web service versions.

Of course, the question that we always have is, we do have already a specification about web services, and that is SOAP web services. OK? That has an API called JAX-WS. Suddenly now we have a new one. For what? OK?

So it turn out that when we work with SOAP web services-- which by the way, is a complete, very mature type of an API, and it is a technology that is doing an excellent job. Plus in addition, we worked hard on securing SOAP web services too. Now we can secure the SOAP web services at the application level, at the transport level, and at the message level.

Of course, by creating all this machinery and all this plumbing for the SOAP web services, what we have done now is we created all these many layers, which by the way, induced some of the performance issues when, in fact, in business use cases, in many cases, what typically the client is looking for is data.

In fact, many of us will have smartphones or tablets, all what we're doing is passing data on a smartphone or tablet. Looking at this, getting this data, getting this data, and so forth. And of course, here's an example where I wanted to take a look at Google and say, you know what, show me the latest news. I just want to see the latest news. OK?

Here's the latest news from the different type of news organizations-- CNN, Washington Post, ABC News, New York Times, and so forth. That's pretty much data that I just want to-- just browsing data. So lots of times we know what we are doing is we're just looking up resources. OK? Just reading data.

It turns out that if you are reading tremendous amount of data, you need speed, you need performance. So instead of representing this data in a form of SOAP message-- which by the way, we already know about the SOAP message that looks like onions. We already have seen an example about that, where a SOAP message is, I take a look at so many layers to build that SOAP message.

So we said, why not, by the way, in this case just work with raw XML? As simple as that, as raw XML. Especially if you are using HTTP, you're moving data and you're reading data in a form of XML. That's how the idea of RESTful web services came into the picture.

So let's not complicate things. Let's not build a huge SOAP message representing some data that we want to read. So we said, let's go ahead and go the REST way. Well, REST stands for what? REST stands for Representational State Transfer architecture style for distributed hypermedia system. So RESTful web services represents nothing but a way to represent data. So it's a different approach than what we have been still looking at the from the SOAP-based services point of view.

So REST is a style on an architecture. And then, of course, it has its own API. We'll take a look at that. And really, it was the consequence of Roy Fielding's doctoral dissertation which describes REST. Of course, what we have done is we've built an API starting Java EE6 specification, JAX-RS which, by the way, now is still evolving in a sense that there's still more features added to these JAX-RS API.

So REST concerns pretty much-- the properties of REST architecture is that the client server-based type of-- it's status communication, which means what? Every request should contain all the, in this case, information needed to, of course, understand the request. And of course, a uniform interface. And that's in the sense it has a uniform interface, or a single purpose type of an interface that's kind of similar to the Java interface to access some requests.

And what's the good thing about it, it's a layered system. What does it mean? What it means is that the client communicates only with the one layer. And then to get to the next information, you go to the layer next to it, and so forth. It's all, by the way, what we call hypermedia-based. It's all a matter of links that you are going to click on and get to the data.

So it turns out that REST always represent resources. That's why we call it REST resources. So REST all the time is centered around the concept of resources. Any named piece of information can be a resource. That's the idea here. So a resource is always, by the way, uniquely identified by a URI all the time. OK?

And then of course, clients will request and submit a representation of resources. The data, when it comes, it may take different representation. Could be an XML-based. Later we're going to see JSON-based. Sometimes the client wants to see HTML-based, which means there could be an engine that converts that XML into HTML so that the human could read that.

And of course, these representations consist of what we call data and metadata. Metadata, again, is always a bunch of key value pairs that are typically in the HTTP header. And resources are always interconnected by hypermedia, by the concept of links. So it's kind of similar to that object oriented analysis and design where you identify nouns in use cases, and then represent them in a form of what we call classes.

So of course, we said that RESTful web services contain pretty much bunch of resources. And these resources are linked together through the hypermedia concept. And of course, they form what we call a tree type of resources, where you can access, for example, the root tree. And then based on when you access the root, then you can go ahead and get into the detailed components of these resources that you're looking for.

And resources, by the way, they're all represented in a form of nouns or things. And lots of times, what we have done for RESTful web services also is we leverage the HTTP technology. The GET and the PUT and the POST and the DELETE methods. Those are called, by the way, general purpose type of operations that we use in RESTful web services.

How are we going to use them? We'll see them tomorrow when we build RESTful web services. Because today we're going to take a look at an overview of these RESTful web services, and then we're going to look at creating a RESTful web service client.

And here's an example where imagine, for example, I have a URL. This URL that says, go ahead and go to local host port 7001, my op resources, and then get me all the collection of users. Here this link is going to return to me what? All of the users. A collection of users. And of course, if I wanted a particular user, then I can go ahead and use, for example, this link where it says, go ahead in this case and get me a resource, a user in this case, who happens to be a specific resource which is, in this case, a user called Matt.

So in that case, if I use the Matt to the link, in this case, the URI, then I'm getting that particular resource representing Matt. And of course, what it means here, what it means is that all resources are, if you want-- RESTful web services rely on resources. And these resources, they're nothing but nouns or things and so forth.

And of course, the question that we typically have-- OK, you're telling us, Joe, that all these are resources. How about if I want to know-- if I want to invoke an action? OK? Which means a particular method. So how this is going to happen?

So here's one example, an example where imagine that I, in this case, would like to access the account of Matt. So that's through this URI that says local host, bank accounts, Matt. And then I want to also access the account of Tom. And then what I want to do now, I want to transfer again, in this case, money from Matt's account to Tom's account. Aha!

The minute now I see transfers, that is not a noun anymore. That is what? A verb. That means it's an action. So the question is, how do we do this we RESTful web service? Not a big deal. All what we need to do is take those verbs and do what do them? Nounify them, which means you can take a verb and I can just give it a name, and I know I will reach it as a resource. And now, who's going to take care of that, a process of transfer? That's my business components behind the scene.

All what I know is that that verb in the use case, which is transfer, I can go ahead and nounify that, nounify the verb, and I can correctly access identify the resource that I'm accessing, which happens to be here transfer. And now who's going to handle the transfer? That it is the business of my business component.

So it turn out that this is really quite useful. Which means now web service-- all what it needs is an input data to form an operation. That's if, for example, I want to say, I want to go ahead and invoke a request. And I want a particular, for example, an object from the collection. If I want a particular option from a collection, I need to pass the data input, which represents the index in the collection that allowed me to access that particular data inside the collection. Easy.

I can go ahead and use a path parameter by specifying, in this case, a collection and then the ID. This uses the URL to identify a resource or a collection of resources. So I can go ahead and use again, in this case, a query parameter where I can specify with a question mark and ampersand whatever parameter I'm passing to request.

Or I can go ahead and put it inside the body of an HTTP request. And that, of course, would be using a form and sending that information. Or I can even send that information within the headers by putting a key value pair, like a metadata or any type, on the inside. And I would go ahead and send that. And that doing what? Taking advantage of the HTTP machinery. The HTTP API, which we already know about.

So now, of course, resource representation for [? module ?]. And we know that a RESTful web service may again support one or more representation formats. An engineer, for example, in this case, we just specify the accept and the context type in the HTTP header and that would tell you. For example, I could be sending JSON. JSON is, by the way, a web browser. JavaScript is commonly used as a web service client in this case. And by returning that data in a form of JSON.

JSON, by the way, is less verbose than XML, but it conveys very, very nice information to the client, especially if the client using JavaScript. What's good about it is JSON objects can map to a Java object script quite easy. Or you can use XML. XML, by the way, does have a lot of features and some people like it just because it has a lot of support liability that you can actually use. But you have a choice. And I can use JSON or XML. We'll investigate this JSON and XML later on.

Now, what we have as a principal for REST, in this case, ladies and gentlemen, is that REST follows what you call the HATEOAS as a principal, which stands for what? Hypermedia as the Engine of the Application State. The whole thing by this HATEOAS principle is what, folks? It is what we call progressive disclosure.

What it means is that you go ahead and provide the fixed URL, and then from there, you can go ahead and navigate to any resource that you're looking for. We give you an example here in this slide when we tell you, imagine somebody wants to access the Oracle website, they want to download Java. So the first thing you're going to do is go ahead and access, in this case, Oracle. And then from there, you will get to, of course-- let's use that as an example.

So if I say Oracle here, and then get to the website. So that gives me, in this case, the Oracle website. And then just by looking at the Oracle website, I click on Downloads. And then the downloads will allow me, in this case, to download whatever I want. So in this case, I could go ahead, for example, and click on this, or I can go to the Java instance.

So I say Ora-- and in this case-- so I'll go ahead and access the download. And then from there I can see the download, the different-- in this case, if I want to, for example, I want Java, right-click, and Java SE, and that'll get me to the Standard Edition, SE, in this case. And then continue by selecting which Java SE I want to download.

Is it the SE 6, is it the SE 7, and so on. That's the idea behind, again, the concept of what we call HATEOAS. So here's again, in this case, and that [INAUDIBLE] tells me about which Java I want. And if I want to continue with the Java Standard Edition that, of course, will get me here. And then from here, I can go ahead and click on this Download Java here.

And then from there, of course, I can go ahead and access any type of a-- so for example, I have the update. If I want to download, for example, the old ones, I can always go to the old ones and download any one I want. The previous versions if I want to download that. So the whole idea behind, again, going through all of this step is that by reading the page, it pretty much allows you to get to the page that allow you to download Java in this case. And that's the HATEOAS principle.

And of course, the whole idea of RESTful web services rely on what we call the hyperlinking, where you return an obsolete URL to the client instead of relative URL, makes it easier for the clients to follow the links, and of course, access anything you want. That's the advantage that you have. And that's pretty much so client developers, what we do, we typically save that URL. That is even, again, pretty much-- that would be seven links down or some-- just save it so that it can bookmark that so that next time it can go ahead and go back to A link. So the idea about hyperlinking in RESTful web services is really the way to go.

And of course, what's good about it, about RESTful web services in this case, folks, is that we rely, or we make use of the HTTP methods that are, of course, the method that your web services API can use. Which is the GET that allows you to read and possibly cache data. POST allows you to update data, in this case, without an ID, which means insert a brand new data.

PUT allows you to update a data. DELETE allows you to remove data. And then you had in the option which, by the way, that had pretty much read the headers. And the options, again, which list the allowed methods that you want to use.

So what's good about this RESTful web services is that it actually leverages the HTTP API. And by the way, lots of times we want to get information back. What is it that we are looking for? And the good thing about it here, we did not reinvent the wheel. All what we've done is we used the HTTP status code that we all know about.

So we know that the 100's are informational. We know that the 200's represent success. And we have the 300's represent the redirection where the client must again take additional actions to complete the request. The 400 means an error on the client side. And the 500 means errors on the server side.

Here's an example of the 200, OK. 201, created-- a new resource created. At 202, that's one that you did in the lab that says accepted for processing but not yet completed. 204, again, no content. 206, batch of content, and so forth. And all of these, by the way, are in the API. You do not need to actually look at all of these. In fact, later on when we get into the API, I'm going to show you that all of these are down here under the Response Status in the API. And you will see all the different numbers in here, all the different codes that you carry. We'll get to see that later on and we'll take a look at that.

So the 300's also, you have the multiple choice, the move permanently, the see other, the not modified, and so forth. And you have the 400, bad request, unauthorized, forbidden, not found. That's from the client side point of view, and so forth. So all of these are pretty much the 405, the 406, the 409 conflict, and so forth.

So all of these are status codes that are very, very useful for RESTful web services. And we get to use these when we work in different labs. Plus in addition, when you use RESTful web services yourself, you will get to use these different codes based on the use case that you're dealing with, and based on what you are expecting in this case.

So the good thing about this also is that some of the HTTP requests, when repeated, will not affect-- again, we have no effect, whereas for example, the GET just reads only and it's idempotent, which means nothing has changed. The PUT also does the same thing because all what it does, in this case, it inserts an updated resource. So that's idempotent.

The DELETE also does the same thing, remove a resource, which is also idemp-- but on the other hand, the POST actually, anything goes. So that's why POST is never read only, which means you cannot bookmark that. Again, what we have done here is we did not reinvent the wheel. All what we have done is pretty much we leveraged the HTTP, which by the way, many of us are actually familiar with.

In terms of the resource collections, it's very common to represent the collections of resources. And the collections, again, itself is a resource. So for example, I can go ahead and here GET collection, which means returns all of the lists of hyperlinks. Or I can do a DELETE that deletes everything collection. I can do a PUT that replaces everything. I can do a POST collection that creates one new thing inside the collection. Or I can do a PUT with and ID.

If I do a PUT with an ID, what it means is that I'm updating a particular resource in that collection. That's what it means. And if I again go ahead, I can specify this, the PUT pretty much allows us to do an update on the old. And then the POST allows us to insert a brand new resource.

And the beauty about these RESTful web services, lady and gentlemen, is that it uses HTTP, which is very, very reliable. Because HTTP uses URLs. And URLs, for example, if I want to access Matt's account, I know how to access its unique URL. Same thing, Tom's account. If I want to do a transfer, it's also a known.

How about, by the way, if I want to do a transfer between Matt's account and Tom's account, but I do not want these transfers to be duplicated? I want to avoid duplication. What do I do? That's where I could specify an ID. If I specify an ID with the transfer, then there will not be any replay. This is part of security, and we'll talk about that. We do have a chapter about that and how we actually fix this replay where somebody can steal and spoof your, in this case, and listen to your application, steals that number, that ID, and then tries to do another transfer or another [? node. ?] So that's the idea behind, again, using a transfer, to apply the replay-- or to avoid the replay.

Ah, what did we say? We said that RESTful web services, all what they're used for is to do what? Read data. Read resources. OK? So if they read resources, then one thing that we should be very, very careful with, because when you read lots of data, it would be nice to actually not read it again, especially if the data is recent and it's the latest one.

So in that case, what is the best philosophy to actually read the data and don't try to read it again from the database, don't try to fetch it again because it's still fresh data. The concept here is what we call the caching. So the REST relies a lot on what we call chattiness, which means you bring in lots and lots of data. It would be nice, by the way, in this case, to use a mechanism by which you cache that data.

So again, in this case, there are different techniques on how to cache the data. And so it's a matter of what type of technique you guys are going to follow. And of course, normally when you get a collection of data, it would be nice to cache it somewhere so that it can go ahead and make use of it. And by the way, in the Enterprise Edition, just to let you know, the Enterprise Edition, is always advisable to cache data. at the web tier, cache data at the business tier, cache data at the integration tier. All the time. Even on the client tier too, at some point in time it might be a good idea to cache data so that you don't have to, again, do another call on data that is already-- you already have it because it's already up to date.

Of course, the only problem that we have with this type of lots of data cached is what? When it becomes stale. When it becomes old, we need to have a mechanism by which we update that data.

And what's good RESTful web services also, in terms of documentation, is developers again would understand a web service API to use it. So it's a good idea to understand. So you must understand that, the web service API, to use it. Of course, we can look at it as a single URL where the web service fully embraces the hypermedia, starting with the base URL. And then from it, you can go ahead and go to other URLs. Or you can go ahead and use the human-generated type of a developer documentation, that's typically a web page. And the docs list the available URLs, and they provide you an example of request where to go.

Or it could be a machine-generated type of a developer. That would be a tool that will allow you to discover all the URLs by using, of course, the root URL. And then from there, you can go ahead and reach to any one of them. That's, of course, specifying the URL [INAUDIBLE]. Lots of times, by the way, that's represented in a form of what we call a WADL. And we have seen at the beginning of the-- if you remember, of the exercises, we have seen an example of a WADL.

Let me just go ahead and show you that. And I do not know if actually it's here. No, I don't think so. So let me go ahead and just to show you that quickly. And that, if you remember, you deployed that application. And that application called a Hello World.

So if I open this within a browser. And so I can go ahead and actually, that's again-- so I wanted to read the WADL. And I think that was in the exercise number one, I think. There is a link that we have to use it. This is the link, actually. If I click on this link and say Allow, this will allow it actually to, in this case-- so it's just reading it. OK. Or what I could do is I can go ahead and just copy that link and then put it inside my browser.

And if I now-- let me go just to this browser, just as an example. And hit Return. And that's my WADL, OK? And the web application description language that we've seen in exercise in lab one, in practices of lesson one. All right.

So what Richardson has done in this case-- we call it Richardson Maturity Model. Again, what Leonard Richardson created is a model of RESTful maturity that can be used to quickly describe your architecture element of your RESTful web service. And what Richardson said is level 0, where it represents an HTTP is used as a tunneling, which it represents a single post, in this case, method, to a single URL, which is used, for example, to transfer XML documents.

One represents nouns, we know, in this case, which represents resources. Level two represents verbs, which represents, in this case, methods. And level three represents the media, hypermedia, which represents, in this case, a root resource. From it, you can go ahead and get all the resources.

So this is just to kind of give us an idea about how level zero specifies what we call a tunneling technology that allows you to get a single method. Level one allows you to get multiple resources. Level two allows you to handle multiple methods. And level three allows you to have the concept of HATEOAS, which is the concept of hyperlink-- a hyperlink where you get the single root resource which is used to discover all the rest of the resources.

Don't forget also that in RESTful web services, we can also use the concept of versioning. Where in this case, for example, we can run parallel versions of the RESTful web service. Here's an example where I can say a URL forward slash version 1, and then forward slash version 2. This is a common way to represent the different versions of the RESTful web services.

All right. And this is pretty much what we wanted to say, how to introduce these RESTful web services. We're just going to finish the lecture with a couple of quizzes here. Which HTTP status code range represents client errors? And that's, of course, the 400 level, that's D. And the second one, which HTTP methods are idempotent? And that, of course, would be GET, PUT, and DELETE. We already know about that.

And that's pretty much-- and of course, we always give you some resources at the end of the lecture, just to do a little bit more reading if you want about the different topics that we discovered and that we covered in this particular lecture. And that's what we wanted to say about the introduction to RESTful web services.

## RESTful Web Services: Overview: Part 2 6m

OK. After we looked at exploring RESTful web services, let's go ahead now and look at the practices for this lesson. So in this lesson, for practice 1, what we want to do is enable a RESTful web service of WebLogic. And of course in this case, we enable a REST web service within the WebLogic server that provides advanced monitoring capabilities because, of course, monitoring by its very nature does not change anything. So you will find that a REST web service explored here uses only GET operations. Later, of course, in the lessons, we'll leverage additional HTTP methods.

Of course, the WebLogic server is not the only Java EE application server that supports REST interface. For information, you can go ahead and see in that link. So pretty much here they ask you to get into the admin console. And then from there, you go under the Configuration tab, General, and then you'll click [INAUDIBLE] Advanced. And you will see that there is a Enable RESTful WebService service box that you are going to enable. You save, and then of course you're good with that.

The exercise, so practice 6-2, explores WebLogic RESTful WebService service in this case, or RESTful management services. And so in this case, what you do is you explore the RESTful management service provided by the WebLogic server using a cURL and RESTClient extension. So you go through these tasks. And at some point in time, by the way, they'll tell you using the RESTClient, attempt to determine the amount of heap memory for your server.

The way you do that pretty much is straightforward. You can go ahead and just do an extension. And then in that, you can go ahead and look at, in this case, the URL, which is local host 7001 management tenant monitoring service, and then my server. If we click in this case, then obviously in this case you get the OK. And then their response, if you look in this case, you will see the size of the heap, the maximum size of the heap, the heap for the current in this case size and so forth. So you'll see some of here the heap size current in this case. So all these are sizes of the heap of your system for this one here.

And then in practice 6-3, you're going to update the Jersey, in this case, JAX-RS. In this practice, we install the Jersey 1.17 as WebLogic server shared library. This Jersey is the reference implementation of JAX-RS. Shared library, library is a collection of classes and resources that any deployed application can use. These shared libraries even take preference over classes that are bounded with the WebLogic server in this case, or rather bundled with the WebService WebLogic server, thereby allowing deployed application to use different version of a library. WebLogic server 12.1.1.1 includes the Jersey 1.9 as the JAX-RS implementation.

Of course, by deploying the Jersey 1.17 as a shared library, you enable any deployed application to select the version of the Jersey it will use at run time. And if you do this, by the way, on NetBeans it would look something like this. Under the Tools and Library, and then this is already installed here, this one here. So if you take a look at this, you will see it's Jersey 1.17. And you're going to add all these JAR files here under class path. And then you also go to the dock and add all these, in this case, folder for the documentation. So that's what you are going to do in this particular.

So you start by doing that. So you go through all of these steps, in this case, by installing all of these steps. And then of course using the WebLogic, you're going to view the admin console. And then what you're going to do, through the admin console, by connecting through WebLogic and welcome1, you can go ahead and install this Jersey library WAR file. Go through all these steps.

If you take a look here, you will see that I already did install this. And it shows here that it's installed, the Jersey 1.17 that you see here. That's what you guys are going to do for the lab. And of course after that, using the shared library in any Java EE web application requires the lines to be added to the WebLogic.xml, which are all these lines. You guys are going to add all these to the WebLogic.xml.

In practice number 6-4, you're going to create a basic RESTful web service with JAX-RS. So just follow the steps step-by-step. Here, you're going to create a simple RESTful web service with JAX-RS. And then in a later lesson, we will cover the JAX-RS in depth. And that will be, of course, tomorrow.

So follow the steps and create this RESTful web service called "Hello REST". And of course, do all the configuration necessary. And then of course after you do that, test your application.

And this is just an optional type of practice where you explore the RESTful web service using cURL. Again, you're not required to do that. But if you're interested and you want to try it, go ahead and try that.

This is pretty much what we have for practices for lesson six, which is the overview of RESTful web services. Thanks.

## Practice 6-1: Enabling RESTful Management Services for WebLogic 2m

OK. Now that we're done with lecturing lesson six, let's go ahead and do its practices. In practice 6-1, we are going to enable RESTful management services for WebLogic. And to do that, what we are going to do is open the admin console, OK? And of course, under the admin console in this case, we'll go ahead in this case, and of course, let me go ahead and show you that in the browser.

So we'll go ahead in this case, and get into to the-- first of all, click on My Domain, and then from there, get into the-- in the configuration general tab, and then expand the advanced section. And then, of course, a set. You know, in this case enable the web service, the enable RESTful web and management service, and then click on Save.

And that's why we have this green message that says, you know, successfully done. And then, of course, after that we need to restart the WebLogic, which I already have done. And that would be what's needed to be done in practice 6-1. Thank you.

## Practice 6-2: Exploring WebLogic RESTful Management Services 3m

In practice 6-2, we want to explore the WebLogic RESTful Management Service. Again, in this case we explore the RESTful Management Services provided by WebLogic server using, again, in this case, the REST Client extension. So in this case, we'll go ahead and first get into the URL local host 7001 management tenant monitoring. And that of course would be, in this case, on my, as you see here, it says name my server state running, health is OK.

And after that, they want us to use the web browser and open server resources in this case. So that would be in my next, in this case, where we start the Firefox web browser and use REST Client in this case. And then enter, in this case, the URL, HTTP local host 7000 management to tenant monitoring servers. And that of course would give us, in this case-- and they want us by the way to set the header menu to be in this case on getting the accept application HTML. Which, by the way, we'll show you now in the next example.

So it says that, in this case, of course the status code is 200. And then this is the body, the response body row. And this is the highlight, which is again my server which is running. And then of course after that they want us to use the REST Client extension to attempt to determine the amount of heap memory in this server. We've done this where we specified, in this case, first of all the header have to be accept in application.xml. And then we connect to the URL local host 7001 management tenant monitoring servers, and my server, because the server is my server.

And this actually will attempt-- will give us the amount of heap memory used by the server. And if you take a look at the output here, you will see that we have, in this case, the server is my server running. The health is OK. And then down here we can see some of the memory, in this case, size. So we have the heap size current, which is this size here, and then we have the heap-free current. And we have the heap size max. And this is pretty much giving us, in this case, the heap memory used for the server. And that's pretty much what they want us to do in practice 6-2. Thank you.

## Practice 6-3: Updating Jersey (JAX-RS) 3m

In practice 6-3 we're going to update the Jersey JAX-RS. So we installed the Jersey 1.17 as a WebLogic shared library. Again, Jersey is a reference implementation of the JAX-RS. A shared library is a collection of classes and resources that any deployed application can use.

Again, these shared libraries can even take preference over classes that are bundled with WebLogic Server, thereby allowing deployed applications to use different versions of libraries. Of course, WebLogic server 12.1.1.1 includes Jersey 1.9 as the JAX-RS. Implementation. By deploying the Jersey 1.17 as a shared library, we enable any deployed application to select the version of a Jersey it will use at run time.

Of course, the Jersey is really useful for the JAX-RS. web services that we are going to use later on. So in this case, pretty much go to NetBeans, and enter the-- of course, let me go ahead and just minimize this guy here. And so under the tools, and of course library, I already installed that, and that's called the Jersey 1.17, which is this one here.

And I installed all these JAR files. Again, of course, I've entered the Java documentation. I also installed these different type of folders. That's pretty much what you're supposed to do. Then, after that, you are supposed to install the Jersey 1.17 shared library. In this case, the way you do it, of course, is this is all done. I'll just go ahead and cancel this one here, but then enter the admin console.

That's where I went through the deployment, and then created an install, and then flowed the steps to install the shared library, which, by the way, here shows that it's already installed and active, Jersey 1.17 that you see here. So again, the steps are quite straightforward.

Click on Install, and then following the steps step by step, and then, of course, it shows you how you get, you know, through the steps they showed you in this case on step six, where that allowed you, of course, to install all of that. That's pretty much what they want us to do in this particular case. And then that would be the practice, in this case, 6-3. Thank you.

## Practice 6-4: Creating a Basic RESTful Web Service with JAX-RS 5m

 
In practice 6-4, we're going to create a basic RESTful web service with JAX-RS. Again, in this case, it would be-- later on we're going to, of course, cover in detail this JAX-RS API. But for now, we are going to, in this case, with a project called "Hello REST". And in this project "Hello REST", let me go ahead and-- I already opened it and created it in NetBeans. And of course, it is a project that is going to contain a class representing a RESTful web service. So it makes use of JDK 7, and it has the weblogic.xml under the configuration file here that makes use of the Jersey API that you see here again, and that we can show you here on the full screen, full editor.

And of course, in this case, they want us to create a class called Greeting Resource, which is this one here under the Hello folder. This is actually a class that is going to represent a RESTful web service. The reason why it is a RESTful web service is because of this annotation @path, which by the way we are going to see in the future when we get into the JAX-RS API.

So it has a text, which happens to be static. And then of course it has a context, in this case, get an instance of context. Here's a constructor. And then it has a bunch of methods. As you see here, the methods are also annotated. For example a Get, which returns a string, is annotated @Get. And then this [INAUDIBLE] of course produces the type of-- it would be text plain. And then it has a put, which takes, by the way, a string and that you pass from the client. That's why we have the @Put annotation here. And then of course the type of data it consumes is text plain. And that of course takes that content and initializes with it the text which is, in this case, a static field of the class called Greeting Resource. So this is a RESTful web service.

And of course what they want us to do here is just to test it. So what I've done is first of all deployed this application by right-click, and then deploy is already done to save time. And then of course they want us to test it. So what I did in this case, just following what they have asked us to do in the activity guide, step eight of this practice, which is 6-4. And so they want us to create a RESTClient-- of course open, launch the RESTClient. That's what I did.

And then of course they want us to use the URL local host 7000 hello REST web resources and forward slash greeting. And then when I click Send, I get the response, which is again, in this case, a response header would be a 200 OK, which is good. And then of course, the body would be hello. And that's what they want us, in this case, to do.

And then of course if we change this now, in this case, we will change then this to Put. The method, instead of Send, is going to be Put. And we enter in this case the new message in the request body, which is Hello Dave.

And then, of course, after that, they want us to click Send. And then of course we switch back to the GET method. And then we invoke in this case the Send. And then of course this, as you see, will return Hello Dave. And that's exactly what they want us to do in this case. And that's pretty much what we wanted to do in practice 6-4. Thank you.

## Practice 6-5: Exploring a REST Service with cURL 2m

In practice 6-5 we explore a REST web service with cURL. Again, this is optional. You do not need, really, to do it unless you're done with all the labs, exactly like the ones that I mentioned to you before. And of course, we use the cURL command utility to explore WebLogic RESTful web services. All that you do here is pretty much go into the-- in this case the command, in this case a terminal.

And of course, change it to the lab student resources. And then, of course, in this case use the cURL executable to request the list of applications running on the domain. Again, the response should be JSON formatted. Of course, we should but that in a large production environment, multiple WebLogic Server instances would be installed and grouped together to form a domain.

Again, we can use WebLogic RESTful management services to check that a particular application is running correctly on every server. Again, that would be the target. That is, of course, installed in this case, too. So we could, by the way, design a shell script that alerts you when the application status changed. And again, in this case it would be JSON or XML.

Or HTML would be easier to pass, again, with the command line tools, like, you know, set and AWK, and so forth. Or XCD. And that's pretty much what they want us to do in this practice 6-5, which happens to be optional. Which means, like I mentioned to you, we really do not need to do this practice, unless you're done with all the rest of the practices. Thank you.

## Skill Check: RESTful Web Services: Overview - Score 80% or higher to pass

Skill Check: RESTful Web Services: Overview

View Skill Check

