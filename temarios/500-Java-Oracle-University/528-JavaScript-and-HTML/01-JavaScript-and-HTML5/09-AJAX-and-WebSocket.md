# 9: AJAX and WebSocket

1. AJAX and WebSocket - 1h 14m
2. Practice 9-1: AJAX and REST - 11m
3. actice 9-2: WebSocket - 17m

## 1. AJAX and WebSocket - 1h 14m

All right, let's go ahead now and get into AJAX and WebSocket. This, basically, would be in a lesson 9. And in this lesson, we are going to use AJAX with JavaScript to request data from an application server.

This would be, for example, a web server or web container of a WebLogic server or GlassFish or JBoss and so forth. We use AJAX to consume RESTful web services. We're going to discuss that. We're going to use AJAX calls to create a server push interaction, identify alternatives to AJAX used in legacy type of the code, and then get into the WebSockets to create a real-time client/server type of interaction, which is a duplex communication between the client, which happened to be, for example, a browser, Thin Client, and the server, and identify the request-- rather the required back-end technologies for REST and Socket with the Java EE7, which is the current specification of the Java [INAUDIBLE].

So the topics we are going to discuss in this lesson is dynamic data with JavaScript, asynchronous JavaScript and XML AJAX, look at a representational state transfer, which is the discussion of RESTful web services, and talk a little bit about AJAX security, WebSocket, and the Java EE7 environment. And let's start with the dynamic data with JavaScript. So here we we're doing, pretty much we are using JavaScript to get dynamic data from an application server as you see here.

So in general, the JavaScript, which is on the browser side, makes an HTTP request to the server. OK? Of course, the server is going to process the data and return, in this case, a response back to the client, OK, which is a browser. The browser will receive and process the response. Which means, in this case, rendering the response back on the browser, so that the client can see the, in this case, answer or response to the request.

And, of course, there could be more interaction. A client can now fill up a form and send it back to the server. The server will process it and get back the response back to the client and so forth.

So in the request, coming from, in this case, the JavaScript, which is on the browser side, the JavaScript, in this case, makes that HTTP request or requests-- could be more than one within a session. And you construct, again, you know, this with the information that you see here on the slide, which pretty much-- the address and the port of the server. We cannot see this right at the beginning of the calls in the first, you know, or the second lesson.

The URL of the resource, which is in this case the name of the resource, and the HTTP method to use, which is either a get or a post, you know, and so forth, and the body of the request if needed. The body would be if, for example, you are using a form and you are entering or filling up a form with some data. That, of course, will be inside the request body to go back to the server.

Of course, the HTTP headers, you know, are there also if needed. We're talking about some maybe metadata information. There could be name value pairs. It could be some username and password when it comes to maybe authentication and so forth. That's the idea behind, in this case, writing what we call request or how a request is represented.

And, in general, what happened is there will be server side processing once the request, you know, gets into the server. And for that server side processing, the server can maybe, again, to process request, can maybe access the database to grab some data. And we can show you an example on the-- you know, so in this case, we can make a call and talk to a servlet, which maybe talks to a business component, which maybe talks to, in this case, the database through maybe, in this case, a JPA type of a technology, OK, as an example. OK? It could be making use of JPA as an example.

And then, you know, returning back the data-- which, by the way, now can be sent back, you know, from a server back to the Thin Client, which is the browser. Or, you know, it could be any data that we render it inside the JSB and send back to the client. It all depends on the interaction that we have in that particular case.

So it could be, like we said, a data processing. You know, could be data filtering, just getting the data that is needed. Could be a user authentication where we pass the username and password. So we authenticate the user, so that, you know, of course, in this case, the user can go ahead and interact with the second request and the third request and the fourth request, you know, and so forth within a session.

So, in general, what happened is the server will go ahead and process that and build a response and send it back, you know, in this case, to the client, to the browser. So, in general, we do have a callback in the JavaScript that will process that response. Again, you can create as HTML elements to display that data.

Could be modifying DOM, elements. Could be a starting timeouts, or intervals, or workers or, if you remember, the third workers that we've seen in the previous lesson to process data. Or maybe it could make another request within the session to get further information. Or maybe, in that case, we just got a form page so that we can fill up the form with data and then click on the button, submit that data to the server. Which, by the way, in this case, the application server will go ahead and take that data and process the information.

Imagine that, you know, in this case, we're trying to do some banking where we want to pay bills in that case. So we can go ahead and put how much, you know, money we are going to pay. And you know, in this case, is it the electric bill? Is it the gas bill? Is it the phone bill-- and so forth.

Now, let's talk a little bit about the asynchronous Java and XML, which is brother, JavaScript and XML, the Asynchronous JavaScript and XML, which is the AJAX technology. So this is pretty much how we can make a call making use of the AJAX technology. And this AJAX technology actually made JavaScript quite interesting.

It's actually the technology that somehow brought JavaScript back to the front that, you know, now is being used by many, many different applications and the industry use it widely either in a, you know, e-commerce type of applications, or social media, or cloud type of applications, you know, and so forth. So this Asynchronous JavaScript and XML, which is pretty much in short or in acronym is called AJAX, is the API used to create an HTTP request to the server. OK? And, in general, the way it works is pretty much you get a new instance of the XML HTTP request.

The XML HTTP request is really, if you want, the core component to the AJAX technology. So we get that instance of the XML HTTP request. We save it here into a variable or a JavaScript variable called XML HTTP.

And then after that, we go ahead and pretty much use an open method. So we use the open method of the XML HTTP request where in that open function, if you want, we'll go ahead and put it in first [INAUDIBLE] as you see here, three parameters. The first one is the method. The method would be either a get, or a post, or a put, or, you know, a delete and so forth.

The URI is specifying the resource that we are accessing. And the Async, the Async in this case is the value of the call, which is going to be an asynchronous call. This is why, by the way, we call it AJAX.

Because on the browser, we don't need to refresh the whole page. But we just kind of make an XML HTTP request behind the scene asynchronously to the server. And the server will go ahead and process that and send back the data to render only the subgroup within that page.

That's what it means. What I mean by that is imagine that we have here a subview that basically represents only one part of the page. You know, and imagine, actually, this is just a subview here.

But then, you know, the whole page is pretty much in this case the whole page in the browser. So it could be any type of, you know, page. So here what we are doing is just we're making an XML HTTP request so that we can just update, you know, the subview which is here represented with the orange color just as an example.

Then after that, we'll go ahead and we add a callback function. And this is the third line here. This callback function pretty much, we add it to the XML HTTP request object to handle the response coming back when it's received from the server. OK?

So that callback function is pretty much that text response and then render that response. It does whatever it needs to do using the JavaScript code. You know, in this case, it's that function. And then, of course, finally, we have now we call the send method.

The send method is typically used with maybe some request body of data that needs to be sent to the server so that it helps process the response. Sometimes the sent takes nothing, because we do not need to send any information. But sometimes we need to send information, you know, in this case, with this XML HTTP request to the server, so that the server can take that data coming back from the browser and then use it to process the response-- rather, to process the request and build a response and send it back to the client.

All right, and so by the way, in general, you know, when AJAX was a conceived, XML was really the primary choice to send and receive data. But with time, now we can actually send data in other forms. It could be a plain text. It could be a JSON type of data or a partial DOM structure, you know, and so forth.

So that's why XML is not required now in AJAX. So AJAX often use JSON or plain text or passion DOM structure, or, you know, any type. So it does not have to be pure XML, you know, in this case a message, for the AJAX to work. That's what I mean by that. OK?

And in general, you know, the discussion here is about, you know-- even though I should say that many, many now clients make use of the latest browser. So maybe we don't have that problem anymore at this point in time. But, in general, those who use old browsers, the question is can we still make use of create an instance of XML HTTP request and use it.

So here, we just show you some compatibility, in this case a code. So it represents the compatibility about the type of browsers that a client uses. So AJAX has some compatibility, as you see here.

So here's, for example, a function createdAjax. And what it does is it tries to get us an instance of the XML HTTP request. So we say if windows.XMLHttpRequest is an IE7+, or Firefox, Chrome, Opera, Safari, and so forth, we'll go ahead and create a new instance of the XML HTTP request and return it.

Else, if it's an IE6 or 5, the old one, we make use of, in this case, a new instance of an active x object and use it. OK? So many, many clients now don't use this IE6 and IE5 anymore. So it's not typically a problem anymore. Everybody always updates to the latest browser, so we shouldn't be having this problem.

Now, since, you know, we looked at this AJAX code, we said that you get an instance of the XML HTTP request and then use the open method, you know, the open function where you pass the method-- get or post, or [INAUDIBLE], or put, or delete, and so forth. So we said, you know, in this case just looking at the code that we've seen earlier, where you create a new instance of the XML HTTP request-- and then you use the open function. You pass the parameters, which is the HTTP method-- that could be a get, or a post, or a put, or a delete-- and then the URI representing the source, you're accessing into the web server.

And then, of course, the async flag-- you know, in this case, which represents an asynchronous communication behind the scene. And then, of course, after that, we'll go ahead and set the callback function that will render or will take care or reprocess a response coming back from the server. And then we can have a set method that maybe will be useful to send extra data coming from the browser to help process requests in this case or so that the server can use it to process the request for the client. OK?

So that's basically what we have. And now, we can actually now in this case a decision about that async flag that I set. So if it's set to true, it's asynchronous call. If it's set to false, it's a synchronous call. That's what I mean by that.

So, in general, here's how we look at it if you want to make a synchronous call. One thing that-- so we get an instance of the XML HTTP request. We have an open method function that takes the method, which is the get or the post, in this case, or the put, or the delete, and so forth. The URI-- representing the source that we're targeting in this case or hitting on the server side.

And then here we decide that that async flag now will be set to false. OK? All right, So if it's set to false here, what does it mean? Well, you know, in this case, it means that it's a synchronous call, which means, you know, you can go ahead and use AJAX you know, within a synchronous mode, like we see here.

Which means in this case, your code will, of course, stop executing when, you know, in this case, you call the XML HTTP request send that you see here. Which means, now, you know, we wait until the response is received. And then we'll go ahead and continue to execute the next statement and so forth. Which means it's not, in this case, done asynchronously and not stopping all the processes or all the [INAUDIBLE] that are running. That's what it means.

So, again, in this case, in general, we don't have, in this case, the callback method that will be set to on load. The XML HTTP request on load, in this case, property, we don't have to do that. Because, you know, it basically refreshes the whole page. That's what it means.

In general, if you use AJAX technology, you don't want to do that. Basically, you want to use the flag set to true. And that's what we see here. OK. That's a lot better. This, pretty much, is the preferred way to make use of AJAX technology.

Here, we get an instance of the XML HTTP request. Assign it to the XML HTTP variable. Use the open function where we pass the method, the get, the put, the post, [INAUDIBLE], and the URI. And then here, we set the async flag here to true. OK?

And then, of course, after that, we go ahead and make use of a callback function. That's the callback function that will handle response, you know, coming back from the server. In this case, when it's course done and finished, it comes back to the browser from the server. And then, of course, that callback function, which is typically written in AJAX, that's the one that is going to process that response, either rendering the data, whatever it doing-- you know, creating elements, DOM elements, whatever it needs to, maybe, you know, executing some workers, some thread workers, maybe executing or creating some timers, you know, timeouts, and so forth.

And then here we have the send method that maybe is needed to send some requestBody back to the server, so that the server uses it to process the request and bid the response and send it back to the client. And that's basically in this case. We can see this here where, you know, we can send with the HTTP request some data, so that the server that uses that data to process the request and get the response and send it back to the client. That's what we mean here.

So one thing that we want in this case discuss is a callback function. So here's pretty much an example on how, you know, both synchronous and asynchronous, how to handle response using the XML HTTP request. So we can go ahead now and write some code for that callback where we can say we're handling, if you want, the response coming back, which is the AJAX response.

So here, we say if this readyState property of the XML HTTP request is equal to 4, OK-- which means the response is completed. In that case, we'll go ahead and get the status which is response status, and then get the response text and set it to data and then do whatever you need to do with it. In general, this ready state here, we set it to 4.

But it could be having different values. So, in general, if it's 0, that means it's n set, which means the open method has not been called yet. If it is one, it means it's opened. And the open method was called, but the send method has not, in this case, been called.

If it's two, what it means is the header is received, which is the request now has been made. And the server sent back the response headers. If it's three, that means it's loading, which is the request is being received. And the XML HTTP request response text holds partial data.

And if it's four, it means it's done, which means the response is fully received. And the response text from the XML HTTP request has the entire response. And that's basically what we see here as an example. OK?

And let's see an example in our, in this case, practice. So in that case, we'll go ahead. And so let me repeat this.

So let's go ahead now and take a look at an example, in this case, related to the AJAX technology in our JSConsole in our Lab Machine. Let's go ahead and do that. And this, by the way, is represented to you in a form of an exercise where we give you some instructions. Where-- we tell you get the data from a JSON file using the AJAX and display it in the content div. Where-- you create an instance of an XML HTTP request, open the asynchronous get response to the data.json, which by the way, happens to be here.

And then add the onreadystate, chance, or onload callback to handle the response. And inside the callback pass, the JSON string contained inside the response text property of the XML HTTP request. Construct the string with the content.

And set it to the innerHTML of the content HTML element. OK? And pretty much, this would be something similar to, you know, following these a kind of steps that we see here. So we guide in this case about that.

So, of course, if you want to write that code, later on you're going to try it. This is pretty much what you have. Where-- in this case, you have an index.html.

This is the preview where, in this case, it makes use of the code.js that is in here. And we have an input, in this case, button called Load Data. And when we click on it, it calls, in this case, a JavaScript function which is inside the call .jsfile. And that's called load data. OK?

And then here we have, in this case, just an ID content, display info here, in this case, when the button is clicked. So we'll go ahead and look at this. So here, you see that we get element by ID.

This is the load data function. So this basically will tell us that, you know, the loading-- OK, it's just loading in this case, so which means it's going to happen right here, you know, after this one here, after this one here. And then we'll go ahead and create an instance of the XML HTTP request.

We have an open method, or open function, that takes the get, HTTP get, and then hits the data.json, which is this one here, name John Doe, age 32, hobby, music, movies, and so forth. And then it's an asynchronous call, because we now set the async flag to true. OK?

And then we set the callback function, in this case, set it to the onready state change property of the XML HTTP request. And then if the readystate is four and the status 200, which means it's all complete and successful, then go ahead and take, you know, in this case the response text coming from the XML HTTP in this case, XML HTTP request. And then you know, parse that, which means take the JSON, in this case, object and parse that into, in this case, a JavaScript object.

So here, we put it into personal data. We set a variable text to name. And then we, in this case, grab, in this case, the name, which is John Doe from the name here.

And then go to a new line and get the age, which is this one here. And go to a new line, you know, get the age. And then go to a new line, and get the hobbies, which is, this case, this information here. OK?

And so we are concatenating all of this to the text, you know? And then after that what we do is we go ahead and use, in this case, grab the array of data, which is in this case, this one here, the hobbies, and then use the join method. We know that the join method takes the elements of an array and then put them into a string.

Here, we want them to be separated by a comma space. And then after that, once we're all done, then we go ahead and render that inside, you know, the [INAUDIBLE] of the content, which is this one here right after it. OK? That's what we have here. OK. And you see all of this here.

All right, now, of course, we're going to run this. And then now what we're going to do is just by clicking on the Load Data, which is this one here, it's going to call this function, which is this one here that will execute. Let's go ahead and do that. And that's it.

You see how pretty much we executed it. And then we got the name, which is John Doe, the age, pretty much following the rendering that has been done here inside the execution of the callback function. And then the hobby, you know, we put that into a string by using the elements of the array hobbies and first one comma space, second one, and so forth. That's basically what we have here as an example. OK?

All right, so go ahead and take some time and try it. OK. You are going to do it as an exercise. So it's going to maybe take you a few more minutes to write the code.

And now, let's look at a Representational State Transfer, REST. Well, the REST is an architecture that the entire web uses. And it's widely used now.

And it's based on, again, a bunch of design principles which are typically, in this case, the idea of client server interactions. So it's always between a client and a server. And we can show you this here.

So it's always between a client and, in this case, a server. And here, I can show it to you here, if you want, in a form where you do have, in this case, a browser that interacts through HTTP to some a RESTful resource. You know, that is a component representing a RESTful class.

You know, an instance of this is created to maybe interact, in this case, with a business component or maybe directly with the database. So it all depends on, you know, the way we build this application. That's basically what it is, RESTful application if you want.

And REST, basically, is following the PhD thesis of Roy Fielding that describes REST in his dissertation. You know, and of course, REST, basically, you know, is nothing but a resource that a client can access and read. OK. That's basically what it is.

And, in general, if you take a look at principles of REST, so, in general, it's presented with a uniform interface where you have a uniform resource locator and HTTP methods are present to access and modify your resources. Because REST is nothing but a resource. And it's identified by unique URI or URL.

And then, in general, you know, it can be, basically, a system that may contain many, many layers, you know, in between the client and the server, like from a gateway, to the router, to the [INAUDIBLE], and so forth. And, in general, we make use of caches. And caches are implemented here, because, you know, some of the operations that we perform are performed again and again and accessed in the same resource.

So there's no point of accessing always the database and getting the same data again and again. Again, we can go ahead and cache that. This way, if the first client accesses it for the first time, they get it from a database.

But then the second and the third and the fourth client, we do not have to, in this case, make another call to the database. It's cached, you know, in front. And then the client can pick it up.

And, in general, it's stateless, because we have stateless operations that establish no sequence or dependency in RESTful calls. And it's all code-on-demand, which means it's all implemented in JavaScript based on whatever we need in this case on demand. So REST is widely known on the web and pretty much is always a client/server interaction, like a browser and a web server.

And it always has a uniform interface making use of HTTP and URL. Because every resource is uniquely defined by URL. It's a layered system that you can make use an IP that acts as a proxy and gateways and routers and so on to access your resource.

And we always use the cache mechanism where web browsers can cache date or an intermediary type of caches that allow us to, in this case, have clients access, you know, the same type of data. And it's stateless, because HTTP request and response model is stateless. And it's code-on-demand, which is handled by the JavaScript code. That's typically how we handle all of that. OK?

And many, many applications are RESTful applications. In fact, the application that we've been using, you know, where we try all different type of exercises, that's nothing but a REST application. Here it is.

And we can also show you that in our lab. So this is nothing but an application. As you see here, we located through the local host 8080 and the name JConsole. And then pretty much allows us to access any tabs, or we have links. RESTful web service application also rely on what we call progressive disclosure.

Here, I have the main page. And then from the main page, I can go ahead and get into, for example, the REST, you know, example. And this will lead me to the REST example and so forth. OK. That's the idea behind this.

So as you see, you know, the address is using a uniform resource identifier. And, of course, here, we're just using get to get the whole page. And then from there, we have links where we can progressively, you know, access any resource we're looking for. OK.

So REST basically allows us or allows clients, in this case-- those clients could be smartphones, tablets, laptops, desktops, and so forth that, through the browser, you specify a URL. Here, for example, I have a get. And I'm trying to access some resource and their particular server.

And through the web, we can go ahead through the HTTP and access that resource. And then we can go ahead and grab it. In some cases, in that case, what we could do is we can go ahead and have the client talk to its gateway, a gateway that allows you to access the outside world-- in this case, which uses some proxy cache type of, in this case, proxy and then, of course, access the web server.

The web server, in this case, can maybe bid the response and send it back to the client right there. Or maybe, it relies on other service-- or rather servers to our application service to get the data. So in that case, [INAUDIBLE] go ahead and get the data from an app server, you know. And would the app server access its own database, or maybe other's app servers, and so forth?

A very good example about that would be, for example-- let me just start all over again. A good example, in this case, for example, would be accessing the news, so from Google. So here, I have Google.

If I click here and say, you know, get me the news, this pretty much-- and particularly, I want to look at the news in this case and technology news. This will go ahead and allow the google.com server to access PCWorld, ExtremeTech, you know, AnandTech, and so forth, TechCrunch. These are different type of servers that gives me different information.

That's basically what it is, OK? PCMag, you know, these are different news agencies that allows us to give-- so Google access them and get the data. This, basically, we wanted the technology news. So what we did in this case, we had google.com that will access other servers to get that type of information.

So to use REST in web applications, you need to, again, address these steps. First, you have the HTTP method that you need, which is a get, or a post, or a resource you identified by its URI, uniquely identified by its URI. And the content of the request and parsing of the response accordingly will be also done.

So this is typically, in general, how REST, you know, makes use of-- or JavaScript if you want-- in this case is used in the REST technology or to [INAUDIBLE] technology. We can go ahead, in this case, use REST, you know, in JavaScript, which, again, allows us to make a bunch of calls that could be, for example, AJAX calls. And then grab the data.

And then, you know, bring it back and render it on the page. That's basically what it is. And that data can come in a form of JSON structure, or in the form of text, or in the form of XML, and so forth. OK?

And, in general, we rely on the XML-- rather on the HTTP methods. The get allows us to read data, put, post, and delete. So, in general, get allows you to read the data. You can go and, for example, get the whole list of the data-- the whole list, rather, of the users. OK?

Or you can get a particular user. Here, we want only John. So we go ahead and look, a particular, in this case, resource or subresource if you want. And we do, by the way, cover the RESTful web services in detail in our web services course. And we do have a developing web services using JAX-WS for SOAP web services and JAX-RS for RESTful web services.

And we'll go through the whole detail of the RESTful technology and the SOAP technology. And we also cover, by the way, the security, both SOAP and REST. Of course, people have tendency to say, we already have SOAP, you know? Why do we have REST? Why do we need that?

Well, SOAP, in general, it's interoperable, kind of similar to REST. And it's highly secured, because you can secure the message of the SOAP message itself. OK. But the only problem is that SOAP has tendency to be slow compared to REST.

If you want to read a tremendous amount of data, you know, lots of data, you know, it's a good idea to use REST and not SOAP. That's basically what it is. But you can combine them in an application.

You can read lots of data. And then after that when you process a particular data, you can use SOAP just to highly secure. So SOAP can be secured at the application level, at the transport level, and the message level. REST can be secured at the application level and the transport level, not at the message level.

But we do have an API that we can a implement. You know, Oracle has an implementation of it to secure RESTful web services. And that's called the OAuth API. We implement that through the Jersey API.

You can use a post. You know, post is to create a new user. You know, we can add the new user to the user's list. Or put has tendency to update an existing resource. That's what it is. OK?

And let's see an example about REST. So here's the one that pretty much we showed you earlier. And so that's the REST and AJAX technology.

Here, we do have an index.html that has a couple of links. One, add a card, that calls so ad. And the other one, a view cars, that calls a function in these code called showList. These are JavaScript, which are written here. OK?

The back-end, by the way, we do have a RESTful web service component. This is car REST, which happens to be RESTful. Because we annotate that with at path.

Again, this is not part of this course. But, I mentioned to you, we do have full five days web service course that is an excellent course that you can go ahead and take, of course, if you need to learn about SOAP and RESTful web services in detail and then how to secure them and so forth. And this is where we, you know, teach you how to create a class that presents a RESTful web service.

And then it has, in this case, a method getall that returns. In this case, you see it gets the type of data or the message will be JSON. Again, because we have [INAUDIBLE] produces. And, at get means returns, in this case, a JSON array of data.

And then it has, for example, here a get restaurant or add review. And that consumes this. This basically takes some data. And we have a post here to add it, put here to maybe, in this case, update some data about a particular car, you know.

And of course, here-- a delete review if you want to delete it, you know, and so forth. You know, so as you see, all the methods are [INAUDIBLE] either with add get, or add put, or add post, you know, and so forth. And this is just a class where it presents an instance of a car that has a name, a color, model, and year.

So now when you click on Add List, you're actually calling a showAdd function, which is this one here. So for here, we add the listener-- load again, hide all at this point in time. ShowAdd-- here it is. Get the element by ID in this case, which have the, in this case, a [INAUDIBLE] add here, which is add the car.

And then here we have an input that basically takes a name of a car, a color, a model, a year, OK, and a button to click. When you click on it, it actually, in this case, adds a car. So this basically will lead us to this.

When you click on an add, that call the function add. And the function add, basically, is here. And so let's take a look at the function add a car. Here it is that, you know, set, in this case, get the element by ID set loading. OK, set loading.

And then, of course, here, let's go back and see the add. I just want to see the add function. So we create an instance of XML HTTP request calling, in this case, the cars resource which happens to be this one here. It's called cars, see? That's what we have.

And, of course, after that, you know-- and set true. And then we get the callback function. That basically, in this case, if it's all good, then we call the showList. OK. And let's see the showList here-- date and car remove. And, you know, so let's take a look at that.

Here's the showList. OK. And that's the one that makes a call also. And then we'll go ahead, in this case, and show us the list. So get the car list. And then go ahead and get the first child.

And then iterate, you know, through, you know, and get the data you know, about the car, whatever we entered. OK. And then put that. So let's go back to the add now.

And then here we create a car object. And we put, in this case, the value of the name, the color, the model, the year, and so forth. And we go ahead and, basically, in this case, send a request header, content type, and JSON and then take that car object, put it in the form of a string object. OK?

And, of course, here, you know, if you want to look at the details, here's the showDetails also. That's the same thing. So for example, imagine that now I put down name of a car-- for example, something, for example, a something like maybe a Mustang. And then the color, let's go ahead and put it blue. And the model is a Ford. And the year is 2016. And we will go ahead and add that.

See, when we click on Add, it's loading. OK. And then, boom. Now, you see it, which means it accessed and create an object. And then, of course, now we see the list. That's what it means.

OK? And we can go ahead and enter another car. Let's call something an Accord, which happens to be green. And it has a Honda. And it is 2017 as an example.

And we go ahead and click Add. So you see it says Loading. And so that's the AJAX call. And then, boom. Now, it updates.

Basically, it doesn't touch any other thing. It just adds, you know, as we see here. And now it can go ahead and click View. If you click on View, that caused showList, which is going to list the whole thing.

So it's going to call the showList, which is this one here. Which is going to-- if you read all of this-- pretty much allows you to list the car. So you'll go ahead and do that. And it's going to list the cars, you see?

Now, I can go ahead and add another one. So this allows me to add another. So let's do something else, like something like-- let me use another example, a Camry.

And it is black as an example. And it is a Toyota. And let's assume the year is the same thing, OK? And that leaves me this.

OK? And then, of course, here, I can always update a car. So here, you know, I can go ahead and click on a particular car and update it if I want to. So a setup date, you have the name, in this case. You have the color, the model, you know, and so forth. And go ahead.

And, basically, the set loading here always gives you the loading, you know, in this case message. That takes time until it's loaded. OK. That's basically [INAUDIBLE]. And all of this is implemented here.

So we do have an update. And let's see the update. The update is here. So element by ID called update, which comes back to this one here.

And they're showing us, in this case, the update, setup date that you see here. So here, we have element by ID. And if you look here, we'll see in this case, if we look at the whole list here, we have [INAUDIBLE] ID.

And then we have the name ID, in this case update-- in this case, name. And then we have the update name here that you see. So that's what we see here.

And then, you know, get element by ID set loading, it always gets that to show us it's loading. And then after that, we go ahead and call the cars. And, basically, as you see here, you get all these data that you need to build, put it in the form of get an object.

And then, of course, it was called now the showList to list, you know, in this case, the cars. ShowList is here, which does the same thing. Here is 400 [INAUDIBLE], the JSON object get elements by ID car list, which is in this case, this one here.

And then we'll go ahead and, in this case, continue with that by getting the list elements, the first child, and then in this case, list remove child, in this case, the first child, and then iterate through, in this case, the car length, and get the element by ID create an element by ID for the last item and the anchor. And then, of course, set the HF to be this one here, which by the way, we see it here. OK? And then, of course, after that we have a function [INAUDIBLE] ID add a listener and text the, you know, car i, which is the information about the car.

Create, in this case, a child. And [INAUDIBLE] the child creates a text node, which is the car i. And then append that to the list items. And then [INAUDIBLE] up in the list items. So you do list elements and keep on doing that. OK?

And so let's go ahead and, you know, change something here, loading. So here, let's assume that we want to change this to 18. Do an update, and now you have your list. OK?

So it's always making call. If you take a look here, we're always making a call, doing an asynchronous AJAX call. OK. You can take some time and just play with it. You know, we can click on View Cars, and that will load us and list the whole cars, you know, and so forth.

And I can go ahead, for example, and click on this. And then I can go ahead and say delete a car. And this will call, in this case, the delete car. And I'm going to see it now.

So which means now, I'm trying to, in this case, delete the car. Which-- by the way, in this case, calls, you know, in this case-- so we have showAdd. We have a showList. We have a showDetails. of the cars.

And then we have the add. And we have the update. And we have the remove a car. OK. So that's part of the update.

And then we'll also do the same thing and remove a car in this case. OK? And that's basically trying, again, in this case, to show us how-- you know, every time we do any type of an interaction, it would be an AJAX interaction with, of course, the back-end which happens to be a car resource that we have here. That's the RESTful web service class that we created here.

You can go ahead and take your time. I took a little bit more than, you know, two minutes. But you can take more time to kind of take a look at how all of that works.

Now, let's take a look a little bit, discuss a little bit, the concept of AJAX security. With AJAX, you can get information that might go into your application. Data should be, again, validated. Requests should always refer to unknown resources. And third party services should be used with care.

Otherwise, you might end up having some security issues. So that's why we tell you that security measures should be enforced in your code. Although, the web browser will provide some security against some attacks, like the Sandbox and so forth. But still, you need to be careful with that.

So some of the basic AJAX attacks that we can think of is that you need to consume a service from a third party provider that provides you with data that you need to display in your application. So the application creates an AJAX request, receives a response, and sets innerHTML of an element with the response data. So we can render that on the page.

So what typically is a type of a problem we can spot here? And, you know, obviously, some of the problems that we can see here is that the data has not been validated before it is, in this case, added to the page. So that's why.

So we have external HTML code that contains crypt elements. And then the JavaScript code might include some malicious code that you need to be careful with. And that's why, whenever in this case you work with the AJAX technology, what we typically tell you or advise you is using the innerHTML and the eval function is extremely unsafe.

So be careful with that. Because the innerHTML replaces the entire content of an element without, unfortunately, validating its structure or any type of validity. So be careful with that.

And also, the eval function itself is inherently dangerous, because it executes JavaScript code. And that JavaScript code might contain, in this case, some malicious code. OK. So the server sends malicious code in a response that alerts your application.

And, of course, the server sends a script element with malicious code. That could be a problem. So that's why, in general, to avoid these type of problems, we tell you never, never pass a JSON with the eval function.

In general, use the JSON parse, you know, instead. This is, again, to be able to, of course, parse the data and validate it before you make use of it. That's the idea behind this.

Also, sometimes you're accessing trusted servers. But, unfortunately, the data that is coming from there is untrusted. That could be a problem, too.

So even though your service is trusted in this case, it contains data about the users that seek to harm AJAX clients. So its service provides your access to the latest post in a forum. So a user includes, in this case, the postscript element with malicious code and the application that consumes the service are at risk of executing these type of malicious code. Be careful with that. OK?

So lots of times we tell you if you want to add a text to an element, use, for example, the element.add append child. And then use the create text doc, you know, [INAUDIBLE] to create text node and parse the text to it. Because then you can go ahead and have a mechanism by which you can now validate wherever you need to validate. So, again, if you need to create an element, create item by using document.element, that's a lot better.

So some of the security measures that, you know, we advise you to use is, when consuming third party services, never use innerHTML or eval to handle responses. Try to never use services that provide HTML markup in the response and favor JSON or XML. Create all visual elements manually by using the create the document or createElement or the document.createText node and so forth.

And construct secured URI for consuming services. Do not use services that provide absolute URI. Be careful with that. OK?

Other issues that also might arise is the cross-site scripting. Again, this happens when you request information from another server, and this sends the data that modifies your page or inserts malicious scripts. So browsers prevent one type of attack by enforcing the same original policy.

So a JavaScript file may not make AJAX request to another resource that is not in the same server as the JavaScript. So you need to verify that you make AJAX requests only to known and trusted servers. Be careful with that. OK.

All right, let's go ahead now and discuss the concept of new features. You know, let's go ahead and discuss some new concept in this case, which is the WebSocket. WebSocket came with the HTML5.

And it's part, also, of the Java EE7 specification. WebSocket is the technology part of the HTML files specification that redefines the way clients and servers connect allowing a full duplex communication between the client and the server. So that's basically what typically we have with this new technology called WebSocket technology.

And then, of course, just so we can make a difference between the HTTP techniques that we've been using using AJAX and Comet framework and so forth versus this WebSocket-- for the HTTP Push, in general, HTTP uses simulation to enable server push and real-time updates from the server coming in. So, in general, we use the AJAX or maybe Comet, you know, that relies on polling the server for changes asynchronously. In the [INAUDIBLE], we've seen the example pretty much.

And the server may stream changes-- in this case, delay responses or perform a combination of both. And, of course, if the connection is closed, another one, you know, will be open in this case. And the client notifies the server as usual by using a separate request in the XML HTTP request.

So AJAX is used to make requests without refreshing the page in this case, just a refreshing a subview of the page by making use of JavaScript, in this case, events. And Comet, which is also another framework, usually it's a streaming technology that uses AJAX and streams data from the server that is handled by JavaScript, emulating that server push type of technology. OK. So when we created WebSocket, what you folks need to know is that, you know, we really did not create WebSocket to replace AJAX technology.

WebSocket is a new type of mechanism by which HTTP is used to handshake and initiate the WebSocket connection. That would be a duplex connection. So the connection remains open and works like a full duplex socket. Messages can be written to it, rather, you know, in this case. Which means-- messages coming from the browser to the server and at the same message from the server to the browser, they all can be passing on the same time simultaneously.

There is only one connection for upstream and downstream communication. And the connection lasts as long as the client and server want to communicate with each other. That's typically how it's done.

So if you want to look at the difference between the AJAX technology versus the WebSocket, let's see this diagram. This pretty much can explain the concept. So polling is related to the AJAX of technology where a client will send an XML HTTP request. And then the server will create a message put into a response, send it back to the client, and so forth.

In the WebSocket, it's kind of different. You know, what happened is the client wants to create an open HTTP or other WebSocket connection. Once that is created, then there would be a duplex communication of messages going from the browser to the server and server to the browser. This is well-known, by the way, in the gaming. You know, those folks who play games on the internet, it works very nicely for those guys. OK?

So, in general, implementing WebSocket in JavaScript is pretty much straightforward. You connect to WebSocket object by using its absolute URI. And you can use ws for WebSocket or wss for if it's sitting on the HTTPS for security.

You add an onmessage callback method to the websocket object to handle incoming messages on both sides and then send messages [INAUDIBLE] in this case on the JavaScript side, because on the Java side, there will be also an implementation of an endpoint. You know, in this case, a class.

So we send messages to the WebSocket server by using the Send method in the WebSocket object. You can then send and receive text streams only by using the WebSocket. That's the idea behind this.

So here's an example of how to implement this. So here we go ahead. In the first line, we create a new instance of the WebSocket, over there.

You have the onmessage here in general. So, in general, the WebSocket methods are sent, which basically parses them, sends a message to the server. And then you have the close that close the connection.

Some of the WebSocket callbacks, the on close, which basically is called when the WebSocket is closed, and on error, is called when there is an error. And then on send is called when, of course, a message is received from the server. So we see it here. Function event, and then you get the data, which is the chart message.

And then we go ahead and get element [INAUDIBLE] messages. So this is part of the example I'm going to show you here. And then we go ahead and put that message in the innerHTML. OK? Just kind of, in this case, concatenate that.

So the send message, in this case, function that you see over there, you getElementByID message. And that allows you to use the send method that we said sends a message to the server. So we go ahead and send the message, the value of the message field.

And then, of course, this would be the beginning. It's an empty string. But then we can go ahead and concatenate messages to it.

Let's see an example about that. This is the WebSocket. So in this WebSocket concept, so we do have now in the index.html, in this case, a div ID messages. And we have a Message Box that we see here.

And then we have a type, you know, an import, which is a text. And the ID is message. And it has a button Send that you see here.

And then we have the send message, which is on click. On click will go ahead and invoke the send message. The send message is implemented here. And so here, we go ahead and create an instance of the WebSocket. We have the on message, in this case, for that to guess that chart message and look for the element by ID messages, which is this one here.

And, of course, we'll go ahead and, in this case, put a chat message and then, of course, parse that, you know, into using the innerHTML. And here's the send message that we're calling, which is this one here that basically you get the element by ID, which is message, which is this one here to allow us to input some message here that you see. And then, of course, we send that message. OK.

And now we send that message, which is received. And, again, here we just have a value at the beginning. It's just empty. So it talks to WebSocket. So this is on the server side.

And we actually covered this in the Java EE course, Java EE7. We have a front-end and the back. The front-end covers that.

And so here we have a class called ChatWebSocket that is notated with add server endpoint. And we call it through the ChatWebSocket. That's exactly what we have here, the ChatWebSocket that we're calling here to open a new socket. OK.

And then inside, it has the on-open method. [INAUDIBLE] on-open. And this is used, for example, go ahead and add the session. And this gets to some user properties, you know, and so forth. It sends a message.

We have the on message that says get ID. So we increment the ID in this case. And a user, you know, ID whatever sends a particular message.

And then we'll go ahead. And, you know, the message that we send here, we go ahead and basically send it to the server. And the server will go ahead and, in this case, you have a message, this message here.

And then we push that message to the messages. And then, of course, you know, if the message size greater than 15, we go ahead and call the pop, to pop, you know, the data from the messages. And, of course, here, we use the for loop in this case, with the session, iterating with a session.

And then if there is a recipient in this case, we go ahead and get the basic remote, you know, to send that message back to [INAUDIBLE], in this case, so we can see it. OK. And that, of course, on the server code, we'll go ahead and basically take that message and then render it. So, for example, say good morning.

And if I send it, then, of course, you'll be getting. And then here it says user number two said, good morning. Because every time, what we do, is we increment, you know, that ID. OK.

And then we said user number two, have a nice day. Oops, typo here. Have a nice day, as an example. And we can go ahead and send it.

And then, of course, we can see it here. So every time, we have this message that we are sending. OK. And put all of that into the message which, by the way, you know, gets back and gets rendered. In this case, that's how we render that message and so on and so forth. OK?

That's basically the example. You can go ahead and try it. This is just a style, you know, just putting the style of the-- the idea is to work with the index.html and the JavaScript and, of course, the back-end component, which were already created for you. If you don't want to learn how to create a server endpoint on the server side, just take the course the Java EE7 front-end development, and you will pretty much see all the details over there. OK?

So you can go ahead and take a few minutes to look at it. Of course, it took me more than two minutes. So you can actually take as long as you can understand, pretty much, the machinery part of it.

And, of course, now the question is when to use, in this case, a WebSocket and AJAX. WebSocket is not really a replacement, like I said, for AJAX or Comet. WebSocket is for small real-time type of, you know, data-- notification and push, you know, and so forth, even though it's now used a little bit more in some more applications.

They are well-known. You know, it's basically for constant client [INAUDIBLE] or playing games in this case. AJAX is for partial requests, partial page rendering, and background client request. So there are several JavaScript libraries that use AJAX. And, of course, WebSocket is fairly new. So most probably we'll see more usage to it in the future.

Or can I, you know, probably, you know, will apply it in many, many enterprise applications. And we can actually take advantage of that duplex communication. And whenever we have an enterprise application where in this case the client and server need to talk to each other on the same time and in duplex form, then we can go ahead and make use of the WebSocket. But it's there. You know, it's available.

And by the way, it's used out of the box if your application server is Java EE7 up to date with Java EE7 specification. And that leads us to the Java EE7 environment. So in the Java EE7 environment, you know, basically in AJAX, you use an application server to have access to services.

And EE7 app server or app server that is up to date with the spec EE7 provides all the required technology to build the REST and the WebSocket services. Pretty much, it's all used out of the box. That's what we mean by that.

And, of course, in EE7 application server, the application server accesses dynamic data from data sources, like databases, services, and so forth, and has business logic to accomplish any type of tasks and can provide web application data, view HTML, and also make use of JavaScript on the client side to access your application server, provides multiple ways of accessing resources services like REST, SOA, Service Oriented Architecture services, WebSocket, web pages and so on. And we do have courses that cover this. So the EE7 technology added some nice features that we see here.

So we have more annotated POJOs, you know, and less boilerplate code, you know, in many, many APIs either on the front-end or the back-end, cohesive type of integrated platform. We added to it WebSocket. Now, JSON also can be used. Servlet 3.1, which is the non-blocking I/O servlets and also REST.

You know, REST now, by the way, in Java EE7 use the JAX-RS 2.0, which is used on the client side and on the server side. And also, we added the batch API to handle batch processes. We added more nice features related to the concurrency. And we also simplified JMS. JMS now uses the JMS context, which is really, you know, very, very powerful and very, very also simple to use in the implementation.

So we do have coursers. You know, we have the Java EE7 front-end development of enterprise applications or web applications. And we have the Java EE7 back-end that allows us to build back-end enterprise application. And at some point in time towards the end all the course, I'll discuss those where you can use all these kinds of technologies.

And that's pretty much what I wanted to say about this lesson. So in this lesson, we discussed the AJAX technology. We also introduced RESTful web services. And we can access them through the AJAX technology.

We also discussed the concept of AJAX to create a server push type of interaction. We created a real-time client server communication with WebSocket. And then, of course, we looked at Java EE7, in this case, features if you want, up to date features that, you know, can make use of WebSocket out of the box. REST also was updated or the JAX-RS API was updated to the JAX-RS 2.0.

We also introduced the batch API for batch processes. And also we added the Servlet 3.1, which is the non-blocking I/O. And, of course, like I mentioned, the WebSockets now are used as part of the EE7 technology.

We do have some interesting type of practices which are really, really good. And so these are part of your activity guide. Let's go ahead and take a look at that. So in the practices of lesson 9, which actually will be done on the NetBeans, in the first one, we use an application of the AJAX and REST.

So here, we do have basically a diagram that allows us to make use of the AJAX technology to, in this case, interact with restaurants and update some of reviews from the restaurants, give them, in this case, reviews in terms of the scoring and so forth. And pretty much, you know, [INAUDIBLE] we give them some scale, scoring them from one to four or five or whatever. And then we can also put some review texts about them.

We rate them, basically. That's what we do. So that's the first example that uses AJAX.

And the second one uses the WebSocket. This is a very, very nice tic-tac-toe application, again, that uses WebSockets, again. You know, and we ask you to implement it. We provide the whole back-end server components for you. We just kind of ask you to just focus more on the client side using JavaScript.

So go ahead and try these exercises or practices on NetBeans. And we'll look at their solution afterwards. Thank you.

## 2. Practice 9-1: AJAX and REST - 11m

Now that we're done with lesson 9-- that covers AJAX and WebSockets-- let's go ahead take a look at its practices. And we start with practice 9-1.

In practice 9-1, we're going to talk about AJAX and REST, where we modify existing projects to add AJAX calls to get dynamic data from the server. And the application that you create is a restaurant review site that allow users to add and remove reviews.

And the flow of the application, again, is as we stated here. The application loads an empty page with a container where the content is rendered. It makes an AJAX call to the server to get a list of restaurants.

It displays the list of restaurants to the user. The user clicks on them, triggering another AJAX call to get the details of the restaurant. The restaurant and its reviews are displayed.

The user can go back and add a-- remove and add and remove reviews. Each action triggers an AJAX call. So that's basically the diagram that they're showing us here. OK?

And then we start this practice with an existing project that contains all the necessary files-- index and code.js-- OK, that we, of course, will modify.

Here in the code.js, it contains functions that are already implemented-- the addEventListener. And this basically, a event listener, sets the content variable to the content element of the page and invokes the load a-- rather, the loadList function when the page loads.

showRestaurants, this function creates a DOM element to display a list of restaurants. Each element has an anchor with a click event that triggers the loadRestaurant function.

showRestaurant, this function creates a DOM element to display details of the restaurant object and all reviews for a given restaurant. Each review has remove button that calls the removeReview function. Additionally, this function creates fields to add a new review and a button that calls the addReview function when it's clicked.

createOption, that takes a value and a label. This creates an option element. It is used in the showRestaurant method to add options to the select element.

clearContent, this function removes all the elements from the content element on the page, allowing the other the functions to add its content to the page.

Again, you need to implement, in this case, the functions to make the application work. The loadList-- you can use AJAX to get a list of restaurants to be displayed and then call the showRestaurant function.

The loadRestaurant-- in this case, you can use AJAX to get the details of the selected restaurant and then call the showRestaurant function.

addReview, that takes a restaurant, a text, and a rating. You use AJAX to add review to the restaurant, and then you call the loadRestaurant. And then removeReview, which takes a restaurant and review. You use AJAX to remove a review from the restaurant and then call the loadRestaurant function. OK?

And, basically, it looks something like this. OK.

And we go ahead and start basically, in this case, by using a-- opening the NetBeans and then creating a-- opening the project and then working with the index.html, which is already there and then starting to work with the AJAX-- or, rather, the JavaScript code. OK?

So let's go ahead, in this case, and basically get into the practice itself in the code there. So this is pretty much showing all the functions that already created for us-- showRestaurants and-- which is already there-- and showRestaurant, which is already there. OK. And so that's-- and createOption, clearContent.

And now let's go ahead and start with the code that-- we need to change the loadList. OK? So this is the code that we're going to create in the loadList, as you see here. OK.

So in the loadList, again, we must implement the AJAX call to get the list of the restaurants and invoke the showRestaurants, or that's how we do it. We go ahead and get a new instance of the XMLHttpRequest.

We use the open method, specify the GET method and calling the restaurants in this case, the URL. And that's the source. We will get a HTTP method and then, of course, the async plug is set to a true.

And then here, we know a lot. We have a callback function that says when the readyState is equal to four and the status 200-- and so we'll go ahead in this case and parse the response text, OK, and save it into the restaurant a-- in this case, variable. OK? And then, after that, invoke the showRestaurant.

And, of course, we have also the http.send, and that's what we have here as the function. And then, of course, we can run the application, or we can add. Or this time, we'll implement the next, in this case, function, which is loadRestaurant. And here it is.

Pretty much, we do the same thing. We create an XMLHttpRequest. Use the open, but this time we'll have the restaurant ID concatenated in this case the URL. And so that's what we have here.

And then, of course, after that, we have a-- the callback function. That parses the restaurant and then call the showRestaurant and then send the http.send method. OK? And that's the loadRestaurant.

Then, after that, we'll go ahead in this case and create the next-- a function, which they asked us to create, and that would be the addReview. And so let's look at the addReview. There it is.

And the addReview, as you see here in the addReview, what we do is we create a new empty-- view a object by using this again, syntax that you see here. OK?

And then, after that, we get a new instance of the XMLHttpRequest. And then we use the open method. Parse, in this case, the POST, as you see here. And so earlier, we do use the GET in the loadRestaurant. But here it's a POST because we're now having a review.

And we're working with a particular restaurant. And then the function in this case, the callback function checks the state, readyState. If it's four and the status is 204, then we go and load the restaurant. That's what we have here.

OK. And, after that, we go ahead and set the request HTTP header content type as JSON and then send, this case, the review in this case because we are sending some review that is attached within the body of your request. That goes because we have a POST method here. OK? And that's basically how it looks.

And then, after that, we'll implement the review. That will be the last one-- the removeReview, rather, the removeReview function.

Here, we'll go ahead and create an XMLHttpRequest. And then here we use the open method, but this time we call-- we use the method DELETE. The HTTP method will be DELETE.

And then we're looking for a particular in this case, a restaurant with, of course, the ID and then the review.id in this case.

And then, in the callback function, again here we check the readyState to be-- and of the XMLHttpRequest that is equal, and then the status is equal 204. That's what we have here.

And then, after that, we'll go ahead and call the loadRestaurant like you see here. And then we finish by sending in this case the-- by calling the function a HTTP-- xmlhttp.send. OK?

Now, if you are on the application-- so this is just showing you the function that we implemented-- the loadList and the loadRestaurant and the addReview and the removeReview. That's what we have. If you're on the application, that's what we have.

And I see we have existing restaurants here. We can go ahead and, for example, click Pizza Corner. And some people already evaluated that.

We can go ahead and say, hey, review is a 4.5 as a-- 4.5 just as an example. And maybe the review here, we put some messages. So a great pizza. And we can go ahead and put the rating and then click Add, and that will give us and so forth.

We could remove, by the way, a review if you want. OK.

We can go back, and we can access another one-- Taco Place as an example-- and we could put some review here. [INAUDIBLE] "The best taco in town" as an example. And a review, we can put five, and then we can go ahead and add that.

And then we can all-- we can go ahead and review any type of-- and remove any type of review that we want. OK?

Go back and pretty much can also try it on anyone. Ice cream and more. We can go ahead and save it.

"Good ice screen" as an example. And let's put the review, for example, four as an example, and we add that. That will be a review, and we can remove any review we want.

And that's pretty much what they want us to do in this practice. Thank you.

## 3. Practice 9-2: WebSocket - 17m

Let's take a look now at a Practice 9-2. This practice is on WebSockets, which means in this practice, you are going to create an interface for a multi-player tic-tac-toe game by using WebSockets. The game's logic and player control is managed in the server. So this is all implemented, you know, in the server. And you do not need to implement anything like that.

When you are connected to the server by using WebSockets, the server sends messages notifying each player moves. Your application reads these messages and displays the game interface. When the player makes a move, you send a message to the server by using existing WebSocket connection. So what you need to do here is you create the interface for the game by using HTML and JavaScript.

The interface is composed of 3x3 table with buttons or labels. Of course, the buttons represent the available slots that can be played. The labels represent the played moves. For instance, after a player plays in a slot, a label replaces the button. When it is your turn, the buttons are enabled and display your icon, an X or an O. And of course, your opponent's buttons are disabled, with nothing displayed, rather.

So pretty much, this is what we show you how it's going to look like. And of course, the board of a new game that is displayed in the X player's window when it is X turn. And the board of a new game that is displayed in the O player's window when it is X's turn. Here you see an advanced board of the game that is displayed in the X player's window when it is O's turn.

So, of course, the player is connected to the server by using WebSockets to the player-- to play, rather, each other. This allows players to play from different machines from anywhere, as long as both connect to the same server. Of course, the server handles connections, game rules, and turns. When a player connects to the server, the server sends rather a message notifying the player if the player will play with X or 0.

At this point, players send messages to the server notifying of the move taken. The message is pretty much a JSON object, with the coordinates and the player icon. The server responds by sending a message to all players, which rather contains a JSON object with the board status and the player who has the next turn.

So pretty much, we will be making use of socket messages. You have a server to the client messages, and this would be an initial message. The message is sent when a player connects, and is composed of a JSON object with two properties, action, which is basically players start, and always, typically always at a start. It is used to identify the message. And the player can be either a circle or the Xs.

Of course, we have a board update message. There are messages that are sent when a turn happens. This message contains JSON object with a bunch of properties. One is the board, which is a dimensional 3x3 array of strings. And the other one is a message, which is an informative message. And then, of course, you have the current turn, which either, in this case, would be either a circle or Xs, representing whose turn it is next.

Of course, you know, we get an empty board, as you see here on your activity guide book. Game in progress board, you will see that some of them have you click on Xs, and the other one would be click on the O. And then, of course, in this case, where, in this case, when they click on-- what I mean by that is-- when they click on the space, you know, the square space, you know, either one of them gets the X and the other one gets the O because they're playing against each other.

Of course, the client to the server messages, every player sends a message when it is their turn. The message is a JSON object with, again, a bunch of properties. X, which is the x-coordinate of the player's move. Y is the y-coordinate of the player's move. And then, of course, the player, which in this case would be either a circle or an X.

And now, of course, they tell us to go through the different tasks to, of course, try to write down the user interface. First of all, we need to modify the index.html, where we change the title page to tic-tac-toe and add a script reference to code.js section here. And then, of course, inside the body add a header and a div element with a board ID. Of course, and add another div element with the current message ID. This element is used to display the WebSocket messages.

And this you will see here, all of this. So this is pretty much what we have to change. The title, in this case, and then we have the ID board, and then an ID current message. That's what we have here. OK? And they also, by the way, show you this in your activity guide book. This is pretty much the code.

Now what we need to do is open the code.js file and, of course, start writing some JavaScript code here to write the code for this game. OK. Let's go ahead and take a look at that, in this case, in the lab. So here is the code.js. So pretty much, here's the code.js. So as you see here, basically what we need to do is first create four global variables.

One represents the player, that's the first line, player variable to store the token that the player will use. Then you have the current message. And that's a variable to store a reference to the current message div element. Then you've got the board, and the board variable to store a reference to the board div element. And then after that, you have the variable socket, which stores a reference to the WebSocket connection.

After that, we go ahead and create a new window load event listener function. Here it is. OK? And then inside a function, we go ahead and set the board variable to, in this case, to the document, in this case, board. So we have a, or rather, you know, we start first with the player variable. And the player variable is, in this case, set to an empty string. Then after that, we get the current message variable, in this case, and set it to the document element current message.

And then after that, we'll go ahead and set the board variable to the document element board. That's what we have here. Then after that, we'll go ahead and, in this case, create a new socket, a new WebSocket that you see here. And this is basically the URL that gets us to the game WebSocket, which by the way, is inside the server. Then after that, we set the on message variable. And set this onMessage handle to the function called onWebSocketMessage. And what we need to do is create this onWebSocketMessage function. That's what we need to do. OK?

So, this basically takes an event, this function, as you see here. And we'll go ahead and create, in this case, a new data variable and set it to JSON parse data, by parsing that. Then we'll go ahead and, next, we'll go ahead and set the inner HTML of the current message to be event.data. That's what we have over there, to the variable data, you know, in this case, a player. And then after that, we'll go ahead and-- so that's what we have in this line.

Then, you know, if the data actually is equal to start here, that would be in line 16, we set the player variable to the data player. That's what we have here. And if the data action is not equal to the start, then we go into the else. In the else, we'll start by creating a table, in this case, table element. Then we'll go ahead and create an icon variable and assign it to the player, equal, equal, equal EXXES. Generally, in this case, a statement, which is going to be either, you know, if this is true, then it's going to be a capital X. Otherwise, it's going to be capital O.

Then after that, we iterate through the rows. That would be through this for loop that you see here, for y equals 0, y is less than 3, y plus plus. We'll go ahead, in this case, in line 22, we create a table row, tr element, that we see here. Then we iterate through the columns. And that will be for loop that we have in line, in that line, in this case, 23. And after that, we'll go ahead and create a cell element. That's what we have here.

And then after that, we'll go ahead and get the value of the element on the current position of the data board. That's what we have here. That's basically what we have on line 25. And then we check, if the value is equal to none, then what we do is we create a button by creating an input element and set it, its type back to button. That's what we see here. OK? You add a button and set its type to be button.

And then we check if the player is equal, equal, equal to the data.current turn, in this case, if this is true, we set the value attribute to the icon variable to display the player icon in each button. Here it is. And then, of course, after that, we add a, in this case, so that's what we've done so far in line 30. And then we go ahead add a click listener to the button that calls the send function to send a message by using the WebSocket. And that's what we have here.

We have a function, in this case. So we create anonymous function to create a, rather, to copy the current values of x and y. OK? That's what we have here. And it starts there. So over there, we basically have the button add event listener, click function, and then we use the function set. And then, as you see here, we parse X through it, so that's, in this case, anonymous function. And we discussed anonymous functions earlier. So here it is, just highlighted it. And of course, after that, you know, we add the else statement for that player equal equal data.current turn.

So in the else we set, in this case, the button value attributes to, in this case, an empty space. And then we set the disable to be [INAUDIBLE]. OK? And then after that, we add the, rather, we append the button to discern and close the if value equal, equal, equal. So that's what we have here. And then we close that. Then we add, if the value is equal to EXXES, append an X text to the cell. That's what we have here.

And then after that, if the value is equal to circle, then we'll go ahead and, in this case, append, in this case, the create text mode-- in this case, 0-- to the cell. OK. Then after that, we append the cell to the row and close the column iteration. That's here. And then we append the row, in this case, to the table and close the row iteration.

After that, we move all elements from the board element by using, again, the code that we see here. Then, after that, we append the table to the board and close the function. That's what we have. So what we've done here, we append the table to the board and close the function. And this is pretty much the end of the on WebSocket message function. So now it's completed.

Now next, what we need to do is create a new function send, that receives the x and y-coordinate. That's what we have here. So inside this function, we create, in this case, a new anonymous object with the x, y, and player attributes. And then we set it into message. And then we use the send function, in this case, with the string [INAUDIBLE] JSON representation of the previous object. And that's basically what we have. All right? And now, so that pretty much completes the JavaScript code that we need to write for this practice.

Now what we need to do is just run it. And to run it, what we need to do is, in this case, create-- because we need two people to run it-- so in this case, what I'm going to do is just create two tabs. And this way, as you see, the first tab has all empty and the second one has all Xs on the-- and then we can go ahead and have this guy play. So see, this will be an X here. And then the other one can go ahead and put an O like in here, for example.

And then this one will try to look and see if they can go that way, and try to, again, put three Xs in a row or in a column or in, you know, diagonally. And then the first one would say, OK, let me go ahead and stop this guy here. So this one here realizes that, you know, that there is almost one diagonal that is going to be completed. That's why he's going to go back. He or she, in this case, would go ahead and stop that. And then they keep on playing each other.

That's basically how the game is played, in this case. OK? Again, in this particular case, I used a two tab, just because I'm the only one here, accessing this application from two tabs and playing at the same time. But think about two users from two different systems with their browsers and accessing the same application-- in this case, same game-- and playing against each other. That's the idea of this. And this is pretty much what they want us to do for this practice. Thank you.
