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
## Practice 6-1: Enabling RESTful Management Services for WebLogic 2m
## Practice 6-2: Exploring WebLogic RESTful Management Services 3m
## Practice 6-3: Updating Jersey (JAX-RS) 3m
## Practice 6-4: Creating a Basic RESTful Web Service with JAX-RS 5m
## Practice 6-5: Exploring a REST Service with cURL 2m
## Skill Check: RESTful Web Services: Overview - Score 80% or higher to pass

