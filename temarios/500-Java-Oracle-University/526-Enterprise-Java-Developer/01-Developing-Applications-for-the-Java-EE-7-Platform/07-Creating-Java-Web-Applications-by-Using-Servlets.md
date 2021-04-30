# 7: Creating Java Web Applications by Using Servlets

1. Creating Java Web Applications by Using Servlets: HTTP Protocol Basics: Sending Requests - 27m
2. Creating Java Web Applications by Using Servlets: Request Dispatcher - 18m
3. Practice 7-1: Creating a Java Web Application - 17m
4. Practice 7-2: Creating a Product Search Servlet - 21m
5. Practice 7-3: Creating an Error-Handling Servlet - 10m
6. Skill Check: Creating Java Web Applications by using Servlet API - Score 80% or higher to pass

## 1. Creating Java Web Applications by Using Servlets: HTTP Protocol Basics: Sending Requests - 27m

We have so far went through a series of chapters that describe the back-end functionalities of the Java EE 7 server. We've talked about Java Persistence API. We talked about enterprise Java beans. We talked about web services. Messaging services. Now we're going to talk about front-end part, the web container content and web container technologies, and there will be a series of chapters on that, and we start with servlets-- creating Java web applications with using servlets.

Well, as we cross from the back-end to the front-end, we'd like to start here with basics of an HTTP protocol because we're going to use HTTP not just for servlets but for other web container technologies. So we need to be comfortable with the way the HTTP protocol works and then understand how we can handle HTTP calls with servlets, and later on, with GSPs, GSFs, REST services, et cetera.

So creating servlets, of course, that's another thing that we'll cover in this chapter. Mapping service to URLs. Handling HTTP calls. Headers, parameters, cookies, all the aspects of HTTP conversations. And we'll use servlets to generate dynamic content and deliver it to our clients. We need to understand how we manage the servlet lifecycle with container callbacks and various listeners.

Of course we'll be using CDI beans from our servlets. We'll also be talking about the use of filters, WebFilter technology, asynchronous servlets, the use of NIO API with servlets, and handling of errors. Let's start with basics.

Let's take a look at the HTTP protocol basics. When you form an HTTP request, you use one of these different HTTP methods-- GET, POST, PUT, DELETE, OPTIONS, HEADERS-- to form the request to send it to the server. Now, by default, if you just type the URL in a browser and just submit it, what will happen is that you will be using method GET and all the parameters, if you have any, will be then concatenated into sort of just one URL. Everything will be passed as a single URL. All name value pairs of parameters.

That might not be very convenient if you've got lots of parameters or big parameter sizes. You know, they're all kind of present in the same place. But I suppose it's OK if you call an initial page through the method GET. There might not be any parameters there, so that's fine. And once you need to start submitting any values, you can control the way and method with which the values are submitted through using HTML forms.

So you can say method POST. And in this case, notice the parameters have passed as separate name value pairs in the body of an HTTP packet. They're not concatenated into one URL at the top. They're transmitted as a packet body. So I suppose it's more convenient to use these other HTTP methods if you want to submit some data from the client.

Now, in response to the HTTP request that you've submitted, a server will send you back some sort of an HTTP response, which will contain a response code. There may be different response codes, and depending on which response code group they're from, you can tell their sort of nature. You know, what is that response code representing?

For example, any resource code that starts with 100 means it's some kind of an informational code. Like, for example, switching to protocol. I don't know, maybe you want to switch to Web Socket protocol or something. Or if you've got a successful response-- you got response codes from a series of 200 codes, like 200OK-- that means that request has been submitted and a response is just confirming that it's fine.

The 300 codes indicate redirections. If you need to go to another URL, for example. So moving the pages around. Temporarily or permanently moving pages.

400 codes indicate all sorts of errors, like 404 is a classic, yeah? Page not found. And 500 codes indicate severe server errors, like the 500 code that-- I don't know, service unavailable, 503, saying that something went wrong on a server tier.

So the packet will contain the response code. May contain other headers describing content length, content time. So what sort of content the packet has. You know, time stamps, date headers, and the body of the packet. Whatever content the server returned to the client.

The body is not necessarily always present. It depends. For example, imagine you're setting the GET request to the server and you expect a page body to be returned. That's fine. It's a 200 code that you may get from the server. It implies, with the GET method, you get some document back.

Let's say you call the very same page but with the HEAD method instead of GET method. The HEAD explicitly says there's not going to be any body in that response. The response code may be 200, all right, but there will be only headers. That's the nature of method HEAD. It works just like method GET but returns only headers without the body.

Typically, it's actually used to tell whenever the content is still good to use if it's cached. So you could check, for example, cache headers, expiry dates and things like that and decide whenever the cached copy of the document is still OK or do you want to refresh it. That's a HEAD method use case.

POST, the response body should contain the result of requested action. So maybe you've posted something on a server. TRACE, echoing back the request. So it's for debugging reasons mostly. It'll just echo back whatever you've sent to the server. So whatever happens to the response depends on the nature of the request and what it is that component is generating. What sort of dynamic content your server site component should produce. But it always has some kind of response code to indicate what exactly the response nature is.

Server site components that handle these HTTP communications are servlets. A servlet can be described with a simple web servlet annotation, where you can map it to the URL. There you go. And most certainly it could also be described using a web XML file. Again, servlet mapped to a URL pattern. The URL patterns may contain wild cards. You can map the servlets not just to a specific URL but, I don't know, to intercept a number of calls to different URLs.

And then, within a servlet, you will write some code that will react to these HTTP methods-- GET, POST. So we'll be handling these calls within a servlet. And that's on the next page, so let's take a look.

Now we've got several options here. First of all, you may override the method called SERVICE. OK, there it is. A method SERVICE accepts HTTP servlet request parameter that encapsulates anything that client sends to you. HTTP servlet response parameter that encapsulates whatever you want to send to the client back and may throw servlet and I/O exceptions. If you override the method SERVICE, then you're creating a code that reacts to any call from the client regardless of whenever it's GET, POST, PUT, DELETE, whatever. So you're saying, I want to write an algorithm that will react to any of the HTTP method calls.

However, a servlet class provides variants of the method SERVICE, really, called doGet, doPost, doPut, doDelete. Their parameters are exactly the same as parameters of the method SERVICE, so HTTP servlet request, HTTP servlet response following the exactly same exceptions. The method signatures of these methods is identical.

If you don't override the method SERVICE-- if you decide not to do it-- and instead you're overriding the methods GET, POST, PUT, DELETE, et cetera, default method SERVICE that already exists in a servlet class-- because notice, you're extending here a class called HTTP servlet, right? So default method SERVICE that's already there in an HTTP servlet class has a bit of code that detects which HTTP method the client was using and it calls the method doGet, doPost, doPut, doDelete for you. So if you want to write the code that does something when the client is invoking servlet by method GET and something else when the client calls a servlet with method POST and something else when some other method, instead of overriding method SERVICE, you may just override methods GET, POST, PUT to have their unique reactions to these different types of calls.

Finally, you may create another method, which is technically speaking not really overriding a parent class method. It's just an arbitrary method, really. It's called processRequest. So, technically speaking, this is not a fixed name because you're not overriding here a parent class method.

The idea of processRequest is this. What if you want to call this method from the method SERVICE unconditionally, and then within that method, have logic that will be common for all the GET, POST, PUT, and DELETE operations, and then from this method, call doGet, doPost, doPut, doDelete, if you wish to do so, to have logic that is unique to methods GET, or POST, or PUT, or DELETE. So with processRequest, you're kind of just creating a custom method where you're trying to take the benefit of both worlds, have a bit of processing that's common for all the HTTP methods, and then also have these other HTTP methods that process specific things for GET, POST, PUT, or DELETE-- whatever other HTTP method operations. All the methods accept the same parameters and all of them throw the same exceptions. It's identical.

Here's an example. So here's a method, processRequest, yeah? Accepting an HTTP request and an HTTP response objects. Throw in these servlet and I/O exceptions. And that's the first thing you could do-- figure out which HTTP method the call came from. So is it method GET? Is it method PUT? Whatever it is, yeah? And then it's just a string, so you can write in some kind of switch case and say, if it's GET, do this. If it's POST, do that. Or, if it's all the same to you, just have one way of handling that logic.

I suppose if you want to generate anything back to your client, you need to tell what kind of content you're going to produce. Tell the client, it's going to be an HTML content. It's going to be, I don't know, UTF encoded or something. Get the print writer and just print whatever you need. At the end, don't forget to close it. So that's production of the response to the client.

When you're handling client input in a servlet, you may wish to get HTTP packet headers-- request.getHeaderNames. Get your enumeration of headers, iterate through that. Whilst it has more elements, get me the next one. Get me the header value. Do whatever you like with these headers. Or parameters. Get me parameter names from request. Enumeration of parameter names, iterate through parameters, get every parameter name, get every value, do whatever you like with that.

Or cookies. Slightly different. The request, getCookies, returns you the array of cookies, which actually could be null if no cookies were sent to the client prior to that point. If it's not null, you can iterate through these array of cookies. Get every cookie, name and value. Do whatever you like with it.

If you want to create a new cookie, there you go. Name value pair, construct it, set its expiry time, max age, and add the cookie to the response. Remember, cookies are values that you want to send to the client for the client to memorize on your behalf, so next time the client accesses the server-- some other page, maybe, some other servlet that can get these cookies as values that you've sent to that client before. So it's a way of implementing some kind of a storage within a client tier of your values.

Of course, when your servlet generates the content to the client, it could generate absolutely any content you want. It doesn't have to be text or HTML. In fact, in this particular case, I'm generated a JPEG image-- well, I'm not really generating a JPEG image, I'm just reading the file and then streaming it to the servlet output stream, which is a little bit of cheating really, because if you just wanted to get the static file, well, why do you need a servlet? You'd just go to the URL, point to that some picture file and be done with it. But let's imagine that I'm not just reading the file. Maybe I'm really dynamically generating that picture.

So why not? A servlet could certainly produce other content types. So long as you tell the client what content type to expect-- response that content type-- you're perfectly fine generating anything you like. Content type is really a must, because otherwise, the client wouldn't really know what to do with that stream of data that you send to the client. Content length is optional but a good idea. If the client doesn't know what the content length is, then how would the client do things like progress bars? You know, display how long it takes to load the page. The browser won't be able to predict that because it doesn't know how large is that file that you're sending. So it's probably a graceful thing to do to tell the client how big is the content that you're generating.

Lifecycle methods. A servlet can not just react to the requests that a client sends to that servlet, which is, remember, methods SERVICE, doGet, doPut, doPost, et cetera, but also, the servlet can react to lifecycle methods that initialize the servlet when it's loaded to memory. Overriding the method called INIT. And when a servlet is overloaded for memory, overriding a method called DESTROY. If you have any kind of common initialization you would like to make for that servlet, optionally, the INIT method can accept server conflict as an argument, which allows you to get configuration from the web XML file, essentially. So your projection of the web XML properties into the code of the servlet.

By default, servlet is really a singleton, so it will be loaded to memory just once. And then the same instance of a servlet will be used to service all of your other concurrent requests. So lots of different threads connecting concurrently to the servlet's method. But if you want any common initialization or clean up, you may override INIT and DESTROY methods.

If you want to inject CDI Beans into your servlets, simply describe the CDI Bean, like this session scope bean, for example, and just inject them. There you go. Injecting that bean and just start using the bean methods.

The bean's XML file, which you see at the top of this page, is optional. You may use it to control the CDI Bean processing, like, for example, discovering all annotated beans in your application, which is default anyway. More on that in CDI Bean's appendix. From the perspective of how servlets manage the injection of the CDI Bean, well, this page shows you everything you need to know. Just inject and use the code and it will be in the right scope, anyway.

If you are in your servlet, use a session tracking code. To achieve the session tracking, you might use either a cookie or you URL parameter called jsessionid. The cookie, unfortunately, might not be particularly reliable. The session tracking, you see, is this idea of associating the client with a particular HTTP session on a server.

The server may send a cookie to the client and say, well this is the session ID, right? So next time the client calls a server, it passes on the cookie. But what if the client turned the cookie support off? What if the servlet can not, for some reason, send the cookie to the client?

You can then use this interesting method. It's called encodeURL. It adds to the URL a jsessionid parameter. This is what it does. It adds this particular session ID. Current session ID. [INAUDIBLE] automatically picks up whichever is the current session, puts the ID into the URL, so when you construct a dynamic content-- some kind of page-- you're sending it back to the client and you create a clickable link there in the page, that link will contain this jsessionid parameter, with the help of which when the client will click on that link and progress to the next page, the next page will know which session it's supposed to be using. It will associate the call with the same session, although it's a brand new call from that client.

Other web container lifecycle events can be handled with a number of event listeners. Now this is a little bit tricky because there are two types of listeners here. And there are different examples, so let me just talk you through them. First of all, the listeners may be associated with different kinds of memory scopes. [INAUDIBLE] listeners track and request events or session events or application events. So, so far, so good. These are these categories.

But within each category, you could also be tracking different sorts of things. For example, a servlet request listener can be used to track the point at which request is created and the point at which request is destroyed. Servlet request attribute listener could be used to track a point at which any kind of object was inserted as an attribute to the request, like CDI Bean associated with request or that bean was updated or the object was disassociated. So any time you put an attribute into request or remove it or update it, you react to that.

Session listeners-- listeners that react to the session being created or destroyed or an attribute's been placed or removed in a session. Or servlet context listeners. Same idea. When you initialize the application, when you destroy the application, that's servlet context listener. And when you put some attributes into the application, context, such as application scoped attributes.

Now I've highlighted four listeners here as examples. So that's HTTP session listener and servlet context listener. They are implemented as web listeners in the first example on this page. You may implement in the same class a number of listeners, if you like, so in this particular case, the code reacts to session being created, session being destroyed, context initialized, or context destroyed. So these are the events that occur with sessions and application.

But the second listener is rather interesting because it's not a web listener. Did you notice, the annotation here is annotation of CDI Bean. Apparently, CDI Bean can contain code that reacts to that bean being injected or removed from various contexts. In this case, we have two listeners here-- an activation listener and binding listener. Activation listener provisions two methods-- the first two, session didActivate and session willPassEvade.

For example, imagine you have this session scope bean. Add session scope. Just that, right? You then inject it into a variety of servlets and pages and whereabouts you want to use it. A session to which it was injected got serialized in order to be passed from one cluster node to another, replicating the session across cluster nodes. So it was deactivated on one machine and reactivated on another.

What if that session scope bean wants to know when that happens? Like it needs to reinitialize something-- some resources that are machine-specific. If it was just migrated and resetted on a different computer, maybe you would like to do something about it. So, hence, you have these willPassEvade and didActivate methods.

Another interesting example with a binding listener is this one-- value bound, value unbound. When the bean is injected first time somewhere in some component in your application, when it's initialized, it's getting into the session scope. Do you know which servlet, page, component in your application managed to be invoked first to perform such an injection? No idea. I don't know which one. I know it was injected somewhere, but which one of them did it first?

So, regardless of who did it first, I can write the code into the bean itself-- value bound-- into that method that I know will be invoked right at the point when this bean goes into the session scope. When it's instantiated. When it's going into the session scope. And when it's removed from the scope-- again, I have no idea when that happens. It could be any time when the session expires. But it's difficult to predict because it might have been injected in all sorts of components. But I can make that bean react to the fact that it's now gone from the session. And that's value unbound when you're removing that from the session context.

So that's just some examples of listeners but what's most important about this page is that it gives you this classification of types of events. The first example was showing events you could listen for to track things around your lifecycle of a session or servlet context or whatever. A second example is a type of events you can be listening from within the CDI Bean, bean itself being notified by a container about what is happening to it. So you could write some code maybe to reinitialize things or clean up or react to these events that occur around the bean within the container.

## 2. Creating Java Web Applications by Using Servlets: Request Dispatcher - 18m

Now let's talk about request dispatchers. A request dispatcher allows us to gain access to another servlet, to another URL, and help a particular servlet carry out its tasks. So cooperative handling of the request. So in this particular example, let's imagine a couple of servlets. Servlet A, servlet B.

A user calls, user invokes, servlet A. User knows nothing of servlet B. But servlet A then internally decides to enlist the help of servlet B to complete its tasks. There are two things that they could do.

Servlet A can either forward a request to servlet B, which means that servlet A is saying, I wouldn't produce any output. Let servlet B do that. Or servlet A can start producing some output and then say, well, there's a piece of the page, there's a chunk in a page, that I'd like the servlet B to produce. So in this case, servlet A includes whatever servlet B does into its own output.

Of course, in a second scenario where you're using the dispatcher.include functionality, you must make sure you are correctly handling that inclusion. Because if servlet A has opened the output stream and servlet B obviously could produce content to that stream, servlet B shouldn't close it because the idea is that servlet A can then, after that inclusion, continue to produce some output. I suppose whoever opens the stream-- well, in this case, servlet A-- is responsible for closing it.

In the other scenario, in a forward scenario, the idea was that servlet A is probably not producing any output. So in this case, the servlet B is opening a stream, and servlet B is closing a stream. Why would servlet A be needed in that scenario?

Well, you see, it may carry out tasks that are not related to production of the actual visual output of the content to the client. Maybe servlet B is handling some parameters, or maybe it's resolving some security issues. And then servlet B is producing the actual content. And that's the forward case, I guess.

And do you know, it probably gives us an interesting angle on the ways of approaching model view controller. Distribution of functionalities around the application. Because then you may have some servlets focusing, let's say, on handling business logic, and others focusing on producing the output. And they can cooperatively do these things together to handle requests. But you distribute the functionalities around the servlets.

Another interesting coding technique that you may employ in the web container is web filter. Web filter can be applied to servlets, pages-- well, to any URL. Really, that's the idea. The web filter her is mapped to some URL pattern. It could be specific page, it could be wild card. And obviously you can map multiple filters, as many as you like.

The filter contains a doFilter method. doFilter method is hijacking the call. It's very similar in terms of the idea to the interceptors that we've already seen for enterprise Java beans that were intercepting calls towards the beans. So filters do similar thing, but of course for URLs in a web container. And a doFilter method is basically hijacking that call that is inbound call from the client.

The client is not calling the filter, of course. The client is calling that page, that servlet, that URL, and a filter behind the scenes jumps on that request and starts handling it. Please note the parameters and the doFilter method are not HTTP servlet request and HTTP servlet respond, but just servlet request and servlet response. These are parent classes of HTTP servlet request and response. And if you want to get access to HTTP specific features like headers, HTTP method, et cetera, you will have to cut the type down, narrow down the type to HTTP servlet request and HTTP servlet response within the body of the filter method.

To progress from one filter to another, you invoke the chain.doFilter method. Chain is that third argument of the doFilter. And basically it means that you call in another filter that's mapped to the same URL in a chain, and eventually the call progresses to the target page or servlet that you're trying to invoke there. If you put any code before chain.doFilter, that code will be executed first. If you put any code after chain.doFilter, there will be post-processing after the entire cycle of handling is complete, and you return from the page back to the filter to do that after part.

Oh, and if you don't call the doFilter here, well, it'd break the chain. So you're not progressing here, which is actually something you may wish to do quite consciously. Maybe your filter was handling some sort of security around the servlet, and figured out that it was not satisfactory. So decided not proceed to the target servlet at all. So don't call a doFilter. Maybe just instead produce some kind of error to the client. That's quite possible.

One more thing about these two pages that we just went through. The filters and request dispatchers. They all share same request object. So if you are allocating a CDI bean that's targeted, the scope, requestScope, CDI bean targeted to the request, then all the filters in a chain, all the servlets that were used in forward or display request dispatcher forward or request dispatcher include operations, are actually looking at the same request object. So they instantaneously share that instance of request code bean between each other.

Which is quite handy if you want one filter to put some information into a request. Well, use the request code bean. If you want one servlet to put some information for the next servlet to which the request was forwarded to use that information. Again, if that's on the same progression, a same request object is being handled on these occasions, then whatever CDI beans you've targeted to that scope will obviously be visible to all the components in that progression.

One more thing. The order of filters is controlled through the web XML file. So you have to decide there in which sequence the filters are applied.

Now, change of subject. The next couple of pages-- this one and the next one-- talk about asynchronous servlets and the use of NIO API. They're very closely linked subjects.

The asynchronous servlets. Well, see, the HTTP protocol is inherently synchronous. So really, what's asynchronous servlet then is? What's the nature of it? Because then the client creates an HTTP request. The client expects some kind of response. it might not be the whole document. It might be just the status code. But still, the client expects the response from the server. So how come you can have an asynchronous servlet? What does it mean?

It's all about improvements in resource utilization on a service. It's a performance improvement trick. The idea is that when the client calls the server, a server has to allocate a thread in which the client request will be processed. What if it takes a long time to process it? Then this thread cannot be used for another client. It's busy with handling that particular request.

So the idea is that what you can do is that you can make your servlet asynchronous. Well, asynchronous support true. And then basically create a new thread, new runnable object, which you start executing via asynchronous context object. And that thread, that new runnable object, would be there to carry out that slow, lengthy progressing that a server that may have to be involved in. Maybe writing things to the database, maybe invoking some back end business logic that just takes a long time to execute, to carry out.

And eventually, when that processing will be over, it will inform the servlet container, that's it. It's done. You can now tell the client about the results of that processing.

But most importantly, during that period of time when you were doing that slow processing here, you were doing it in a separate thread. So the thread that was initially used to accept the client call was not busy doing that processing. It was released to handle some other client call at that particular point in time. So it improves the overall capabilities of the server to handle significant amount of concurrent calls, even though some of these calls take a long time to process.

Very closely to this idea, we've got another idea of nonblocking I/O. nonblocking I/O, again, it's all about asynchronicity in servlets. So NIO API implies that you're still use asynchronous support servlet. You can use annotation for that. You can use a web XML file to describe that as an asynchronous servlet.

The nonblocking I/O using a servlet is trying to solve slightly different problem. The previous example that we looked at, solving a problem of a server taking a long time to process things, so we do it in a separate thread. This time, we're solving the problem of a client uploading a lot of information, possibly through a connection that's rather slow. So the client capability to upload data to us or download data from us might be compromised. So slow network idea.

And what we're trying to do is process that upload or download in another thread, not blocking the main thread of a servlet container, releasing that to handle calls from other clients. So you're still using asynchronous servlet in this case. For example, to handle client input, you get servlet input stream and register the ReadListener.

ReadListener has three methods, onDataAvailable, onAllDataRead, and onError. The logic is rather straightforward. As the client uploads things, you're processing them in onDataAvailable. When all data is received from the client, the method onAllDataRead will be invoked. So you know that point in time, well, that's it. You've handled all the upload. Or if you had a problem, there's been an error, then onError method will be invoked.

If you're dealing with things that you want to download from the server to the client, then just reverse the InputStream to ServletOutputStream, ReadListener to WriteListener. So it's practically a mirror of the code. And then two methods that you need overwrite, onWrite and onError to handle the content that might be rather large and might take a while to download to the client, or maybe the client network is not that good, in another thread without blocking the main thread of main thread pool in a servlet run time.

So both of these are performance improvement tricks. They do not change the nature of a client interaction with a servlet. The client sees no difference. The client doesn't know if it's calling an asynchronous or synchronous servlet. Client has got no clue at all. The client calls the URL as usual. The client gets the response as usual. It's all about the distribution of threads within the Java EE servlet container, how that is happening to improve internal workings of that container, obviously for performance improvement reasons.

Well, there's one more thing left for us to discuss here, and it's the way in which we produce and handle errors in a web container. A servlet could simply return an error code to the client like this one. Send me 404 error, for example. Why not? Send me that. Page not found.

Well, it's just a status code. HTTP status code. If you're going to throw an exception, that will basically produce one of the 500 codes. So from perspective of the client, that means that your servlet really crashed. But still, you can if you want to.

And then when you produce the error, you tell the client what is the status code of it and what is the error message. You may actually create a custom error handler, and that can be registered in a web XML file. For every error code, for every type of exception, you may register a handler page or a servlet. So when you throw that error, the control will be passed onto that page, into that servlet.

Within that servlet, you get full access to all the attributes of that error. They are available in the request object, so you can find out what was the status code, what's inception time, what's the message, which servlet threw it. All of that information is available, so you can then produce the informative output to the user, telling a user what went wrong, what's going on on your application. So that's displaying that in a designated error page.

I guess that is it. So we've looked at a lot of things that are related to the servlet runtime. But it's not just servlets, really, because we looked at the entire web container, the way in which we handle HTTP protocol calls. Of course, we looked at the way servlets are written, how they handle different HTTP methods, how they produce different content types, what's their life cycle, life cycle methods.

We used some managed beans, CDI beans. We used web filters, request dispatchers. We tried to improve performance with the use of asynchronous servlets and NIO API. And finally, we looked at the ways of handling errors.

In terms of the practical exercise for these chapter, what you're about to do is create a web application that will search and display products. It will have just a simple HTML search form where your user is supposed to enter criteria and execute a query. They'll be handled by a servlet, and then the servlet will render some kind of an output, which will be the list of products as a result of that query.

## 3. Practice 7-1: Creating a Java Web Application - 17m

Now let's take a look at the practices for lesson seven. We're now entering a web UI part of the course, and we're creating here our first web front-end part of the application. For the purposes of demonstrating Java EE7 U capability of placing Enterprise Java Beans code directly within the web module, we'll take an approach of moving the code that we've written so far into a new project, which will be the web-based project.

So in other words-- let me just highlight this for you. This is the code you've written so far in previous exercises. It was this product app that contained Enterprise Java Bean, and a web SOAP service, and other singleton beans, and message-driven beans. And we were accessing this application from RMI Java clients or from SOAP clients. What we're going to do now is we'll start from product web project, which will contain same ProductFacade Enterprise Java Bean as the product app; same JP entities-- that part will be the same. But now we will access it differently. It will not be remotely exposed to our clients. Instead it will be locally exposed as a local bean to our client, which is essentially-- will be a set of servlets interacting with these Enterprise Java Beans from within a web container.

As a proxy handler for accessing the ProductFacade, we'll use a ProductManager bean. Previously, we used ProductManager class as a proxy to allow Java client to access the Enterprise Java Bean remotely via RMI. If you like, we use the same idea, but this time we're helping our servlets to access the Enterprise Java Bean Facade-- just locally.

Now, in this exercise, not only we are proceeding with this web product web application project, but we also create in there HTML5 and CSS components to construct our user interface. And of course, we're creating Java servlets to display the list of products-- our query products-- and display them. Oh, and yeah-- we'll look at the exception handling within that module as well.

OK, well, let's proceed to the first part of this exercise where we open a product web project, the migration of code of the ProductFacade. And JP entities has been done for you-- so simply a replica of the same code that you developed so far but just done for the web-only deployment style. So let's go to NetBeans.

You may, if you currently have any open files, close them. But you don't need to close existing projects. Well, it makes no difference. Just open another project. It will be in Home Oracle Labs Projects folder. And that is the product web. Open that one.

Product web folder gives you a starting point to your design of the web part of this course. If you look at what it already contains, it contains Validation Messages properties, DataConverter, Product class. So that's the bit that's exactly the same as you've seen it before. And in the demos model package it contains the ProductFacade. There it is, yeah-- ProductFacade. That's just the local bean.

The difference between the previous version of ProductFacade is that this time we are not implementing remote interface. So this ProductFacade is identical in every way, but it doesn't have a remote interface. It's just a local bean. Everything else here is exactly the same.

And we have the ProductManager class, which is just a simple request scoped object-- CDI bean injecting ProductFacade and just propagating calls to it. So that is for the benefit of the future servlets, GSPs, GSFs, whatever else we'll create during this course.

To assist these other web UI classes, we'll use this ProductManager to gain access to the Enterprise Java Bean. So that's the code that you have in the product web project so far.

No web UI as such, apart from this dummy page, which is index HTML-- if you just create new web project in NetBeans, it just generates that page for you. So, yeah-- so the page doesn't do anything. But we got to put real code in in a moment.

So that's it. We've opened the project. I tried to comment on what your-- will find in that project-- what's already there, OK? You may, obviously, observe differences between your existing code and this new project code, but the differences are basically the absence of JMS components and the absence of a remote interface in the Enterprise Java Beans-- so these things that simply won't work in the Enterprise Java Bean's light container, which is part of the web container deployment.

Now what we're about to do next is add a Cascading Style Sheet file to this project. Let's just create a new CSS file. OK, so under the product web, make sure you're opening the right project first, yeah? Create New File. And that's the Cascading Style Sheet file we need to create.

Right. The properties-- well, let's call it pm, as in ProductManager, yeah. And put it in a webcss folder; pm-- webcss folder. That's it. So this is our Cascading Style Sheets file.

Obviously, you need to put some code into it. You may just grab the existing code from Resources folder. There is the pm CSS file there. So I can just basically take the code from it and put it into my Cascading Style Sheet file. There you go, yeah? Save that.

But do you know, this is just the same code as you see in this exercise here, yeah? It's exactly the same code. So you've got some styles for different visual classes-- for header, footer, navigation, et cetera, et cetera, yeah? We'll use these visual CSS classes in our HTML documents that we'll be creating throughout these course exercises.

A valid note-- if you want to learn more about JavaScript and HTML5, there is, indeed, a course that covers things like CSS, yeah? But that's not this course, yeah? In this course we assume you either already know it or you intend to learn about these things in the JavaScript and HTML5 course. Because we gonna focus on a Java side of things. And that's actually why you are not told to code any of that but just grab an existing file instead-- so different styles for our visual components.

The next thing we'll modify-- that index HTML file. Again, we have a template code with the help of which we can do the modification. You can copy the template code from here or from Resources folder. That template is what you will use routinely in various pages throughout these set of exercises.

So let me just open a file that contains the template, and simply replace the entire contents of index HTML with the content from that template, right? So there's several areas in that template that we'll be then using throughout the course for various pages-- titles, headers, content, et cetera.

Oh, notice they're referring to the visual class names. These are the class names from the pm CSS file, yeah?

Now let's replace some bullet plate text that is contained within this template, with appropriate values. What we need to do is replace the title, header, and footer with these product management and product management application texts. So in the future, we put product management application, and then we put product management into the title and into the header.

OK. Next, replace the page navigation component with the link towards the product search page. We actually haven't created that page yet, but we will, right next-- in the next part of this practice. So we'll include this ability to go to the product search page, yeah?

And then, finally, into the body of the page where the page content is, let's just put the word Welcome for now. So for each content-- Welcome! That's it. You may format the code nicely, but that's it, yeah? So that's a very simple index page.

Now, next thing we do, we create a new HTML file, which is indeed-- will be that ProductSearch page, OK-- so ProductSearch page. Let's create a new HTML file in the product web project; new file, HTML. Call it ProductSearch. Make sure it's in a web folder, OK.

Right. Well, guess what we need to do-- repeat the process of replacing the code from the template, just with slightly different arrangements here, yeah, with slightly different values. So this time we want it to be called Find Products, yeah, in slightly different text in the footer. But generally, it's the same code as we had in the template before. Mainly you can copy it from scratch from the template. You can copy it from index HTML and just replace the relevant texts. It doesn't matter. It's the same code, yeah?

So instead of Product Management, it should say Find Products, yeah? And then in footer it should say Enter Product Name, blah, blah, blah, yeah? OK, let's just do that. Let's replace the footer first, yeah; then Find Products.

That should be the title; and a header; a navigation link here should point back to the home page. So that's it-- back to the index, yeah? OK so back to the index page. That's that-- anchor, yeah?

Now, why don't I just say /index HTML? Why just say /pm? All right? Let's take a look at a web XML file for a moment, yeah?

Here, in this file, we can configure what should be the default page for that application. By default, yeah, if you don't specify which page that is, you assume that is an index HTML. That's why if you just go to /pm, by default, you assume you're actually going to index HTML page. So you don't have to explicitly spell it out, really.

But if you want a custom welcome page, then in the web XML file, here you can create a welcome file list element and then have your own pages, whatever they are. So you can explicitly configure that as well if you like.

OK, and that's what the comment says here. The Java EE web module automatically assumes that files like index HTML and JSP are indeed your welcome file list, unless you override it in a web XML file.

Now, let's replace the content area of the product search with this form-- so page content, yeah? Well, in my case, it's the welcome message, isn't it? Because I copied it from index HTML, but, you know, it's that content area which I need to replace with the HTML form.

This form is going to submit itself to the URL called list. That's the URL to which we will map a servlet. We haven't created it yet, but we will. So there will be a servlet handling that particular form's input.

Inside that form, let's create a divider that contains a label and an input field for entering product name. Add in that. OK-- divider with a field product name, yeah-- it's a mandatory field. You have to enter it. So, there you go.

We also need to add a Submit button, yeah? OK.

Dividers are needed to align items here with the style sheet, yeah, because I'm referencing here CSS plus, yes-- so just for visual arrangement purposes-- to make it look nicer.

So we've got a form with an input field and a button-- Submit button, yeah-- simple HTML.

Lovely!

Now we're ready to start the next exercise, which is creating a product search servlet, yeah? So we'll proceed to that. But as far as the creation of the web module project, and basic HTML, and cascading style sheet files, well, that part is over.

## 4. Practice 7-2: Creating a Product Search Servlet - 21m

We'll continue practice 7, proceeding part 2, and create in there a product search servlet. So in the same ProductWeb project, we need to launch file New Wizard, to create a new servlet. This servlet should be called ProductList and will be in the demos web package. Let's try that.

In a ProductWeb project-- make sure that's correct project first. Create new-- you need a web-- it's already selected-- web servlet component. And give it a name of ProductList, and it should be in demos web package. Click next.

So now we need to sort out the URL mapping here. So make sure we map that servlet to a URL of our liking. Now, that should be the URL /list. Let's map it to URL /list-- just that list. That's the same URL, remember, to which we were submitting the form, the ProductSearch form which was part of the previous exercise.

Let's hit Finish. Let's create that servlet. So we have the servlet mapped. It's called ProductList. It's mapped to URL Patterns /list. And well, what we have here is processRequest method and doGet and doPost methods. That's currently the code of that servlet. So there are further HTTP methods available here.

Well, for now, let's ignore the further HTTP methods. We'll start with processRequest, I guess. And just quick look at that, we're opening a PrintWriter. And we're printing out some sort of default servlets output, just kind of hello from that servlet.

So obviously we need to put real code into this servlet now once we've created it. We need to open that ProductList servlet, and we need to add an injection of a CDI Bean into it, which is the ProductManager Bean. Let's do the injection.

Format the code. Make sure you fix the imports. You need to import these two clauses, Inject and ProductManager. Lovely. So that's how our CDI Bean file-- which we can access the rest of our business logic contained in the Enterprise Channel Bean part of the application.

Now, we need to modify the code in the processRequest method inside a try block. And what we'll do is we'll add here a StringBuilder object. So we could basically construct a necessary text of the page in there.

So let's add that StringBuilder. And that goes into this try block in the processRequest. You don't really need the code that's already there in that processRequest method. It's just a dummy. So you may as well remove the rest of that code. That's perfectly fine.

Now, get the parameter name, p_name. So two things we can-- yeah, get rid of that code. We don't need it really. And get the parameter name. The parameter name is the parameter, p_name, that is submitted as an input field of the ProductSearch form that submits to that /list URL, which is what that servlet is mapped to. So hence, we extract in that parameter.

Now, we use that parameter to pass on to the CDI Bean to the ProductManager and get a list of products. Perfect. Make sure you've added the imports. Done.

Now, once we've got a list of products, what are we going to do with it? I suppose it's worth checking if it's not empty. And then we construct some output if it is empty or if it isn't empty. We just need to sort of process that information. So this is that if statement.

Oh, sorry. I did after this line, obviously. I queried the list of products then add that if statement. That's formatted nicely. So what's happening here? If ProductList is not empty-- so we actually get in some products. With that particular StringBuilder, we start appending content.

So we're constructing text. And we're constructing text that is, basically, a set of dividers and the product's information. If there's a situation where we've got no products packets whole, well, we just told this list say so. We can't find any products match in that particular name that was the p_name parameter. We are unable to find any.

So now, the rest of this code that I just removed, remember, you want to print out this information on construct appropriate HTML for the user. So how are we going to do that? There's a servlet_template.txt file, which contains, basically, exactly same HTML as the template HTML file but wrapped up into the out.println statements to be used within a servlet.

So let me just open up that file, servlet_template.txt. It's exactly the same code as you've observed in a template HTML, just wrapped up into out.println. So remember, we don't want that default output that a servlet was producing. So we remove it. And instead, we place this output of ours. So we print in an HTML document. We reference in a style sheet here. We have in all of these standard placeholders. Good.

So now, all we need to do is replace the placeholders around this template. And this is what we'll do. We'll put the name, ProductList, into the title. We'll call Header, Products-- so Title, Product, List, Header, Products.

In a Navigation section, we create a reference back to the Search page. So put that into a page navigation, we could go back to the Search page. In the Footer section, we need to replace what it is that we're printing as a footer. Invoker used, which method-- which HTTP method? That's the text of the footer. I mean, you can just copy this whole line I suppose.

So it's partially that text now. So footer Invoker used, then let's just put a quote here plus request.getMethod plus footer. Oh, no-- better-- so sort of out where the quotes are, of course. That's useful.

This is basically telling us whenever the request was GET or POST or PUT or DELETE or whatever, it is just for education purposes to reflect which HTTP method was used to call that particular page, that particular servlet. So print that information as part of the footer. Make sure it compiles. Do the clean and build.

And actually, we're ready, almost ready, to test it. There's just one more thing. We arrange all the starting bits of content here the title, the header, the navigation, and the footer. But there's one more dynamic bit that we need to do. And that is the printout of content. So whereabouts the page content is, that placeholder, we replace with out.println of content.

What's that content? It's that StringBuilder that we've created a little earlier. That's where we append that information of our products. So that was our dynamic part of the page that we've inserted here. And well, obviously, there's another small dynamic bit, which is that part of the footer which tells us which HTTP method was used to invoke that particular servlet. So clean and build, and we're ready to test.

After you finish the build, deploy ProductWeb project. So that's that. Make sure you deploy successfully. So select Deploy. Put in that. We can test it by navigating to that pm URL. So checking if it was deployed successfully, then we just open that URL. That will get us to the Product Management index page.

That's a static page from which we can navigate down to ProductSearch. Here, we can specify what it is that we're looking for. So shall we look for any products? Let's start with Co%. Let's do that, and Find. And there's our cookies and coffee.

And then, let's go back again and then look at anything that starts with C% for example. Oh, actually, you know what? Let's do the GET method here rather than POST method. So take that URL-- see that, currently, the servlet says it was processing the POST request. And now, let's call that same servlet, but this time with GET request. There we go. It says it's method GET.

So we're submitting a form, a form was sent to use method POST. That's what the form method was. Or where we just type the parameters into URL directly, we're obviously invoking that servlet with the same parameter, but this time it's method GET. There you go. That's the test procedure for the ProductWeb servlet.

Now, if we will try to call the servlet without providing any parameters at all-- so if we go back to ProductSearch and try to Invoke the servlet without providing any values. Back to search, just click Find. Please fill out the field. Fair enough. The field is marked as required. So we don't even proceed to the servlet in the first place.

However, because the GET method was actually allowed, that means that if you try to Invoke that servlet directly via the GET method and pass, no product parameter, you will actually get a different behavior because, see, if I will try to say that I didn't supply the name-- name is nothing. See that? So I do Invoke that list servlet in this case because I bypassed my form because the servlet was coded to respond to both POST and GET method equally.

So it didn't distinguish how it was called, who called it. It just basically tried to get the p_name parameter either way and process it. But the GET method, when you were bypassing the form, no pre-validation of that parameter was available and, hence, maybe would like to modify the ProductList servlet. So it will refuse to serve the list of products when it's receiving the method GET rather than POST.

So for that, we need to go back to NetBeans to the ProductList class. Expand these additional HTTP method section. So ProductList, scroll down. Expand this section where we've got GET method and POST methods. Well, and how about in the method, which is the method GET-- locate the doGET-- add RequestDispatcher. That simply throws us back to ProductSearch.

So somebody calls this list servlet attempting to circumvent the POST method implemented by the input form. And instead, you actually would say, now, I would not want to do that. Go back to the input form, please.

So you could basically just throw it back to the ProductSearch page. Forward the request there, and, in which case, you obviously don't call the processRequest method. So if you are invoked by the method GET, that's it then. You don't really go ahead with processRequest at all.

Now, obviously, don't forget to add that import, which we did of RequestDispatcher. Compile, deploy again, and just test it again. See what will happen. So rebuild. Redeploy the ProductWeb project, and let's see what's going to happen.

Let's go back to the Search form first. If we're going through ProductSearch and we're looking for product, I don't know, tea, then we find it all right. There's no problem at all. But if we try to say, /list?p_name=Tea, although it's a valid value, we'll be thrown back immediately to the Find page because it's method GET not POST. So servlet simply refused to even acknowledge that call, and just with RequestDispatcher, simply rendered a different page back to me.

Notice the URL still shows that I was accessing servlet /list, which is what I was accessing. That's the URL I submitted. But the servlet decided not to produce any output of its own and simply forwarded a request to an HTML page instead. So there you go.

Now, just for an interest, let's perform another test. What will happen if you try to access non-existent URL? Shall we? We don't have a URL acme on our server. You get the generic Error 404-- Not Found. You're trying to access the page that's not there.

So that will be the next theme for our exercise. What we'll try to do is we'll try to supply an error handlers for different HTTP status codes. So we'll be able to produce custom error pages in these situations. But so far, that is it for this section of practices for lesson 7.

## 5. Practice 7-3: Creating an Error-Handling Servlet - 10m

Now, let's take a look at practice 7 part 3 in which we create error handling servlet. So in the product web application, in NetBeans, we need to create a new servlet. And then this servlet will be called ErrorHandler, and we'll be in a demos, web package. So there you go. Product web, new, web, servlet, call it ErrorHandler, and it will be in demos, web package. Click next.

Now we want to map it to the URL called /errors. Fine, let's do that. So URL pattern, /errors. We're good to go! Finished.

So this is the ErrorHandler servlet. Now all we need to do is add some ErrorHandling code to it, of course. All right, so let's find out what went wrong with that page here so we could extract information about error codes, error messages, status codes, from that request of ours here. And well, just extract that information first.

So throwable object, that's the attribute, which is the exception that has occurred. So instead of that to do maybe here, somewhere here. OK, so find which exception has occurred. Then what was the error message? Find that. So we're getting that information.

And then we also need to retrieve the status code, which http status code led to the error. Format this nicely. So these are request attributes that we extracted.

OK, after this, we'll add another line of code that will be used to prepare the actual error message. So error, and then we'll figure out what to put into that line of code in a moment. So prepare our error message variable.

What we need to do is analyze what sort of code are we getting. Now, of course, we can analyze all sorts of error codes we like, but for starters, let's just look at the error code 404, "page not found," or 500, which means any other service side problem. We can easily achieve that with a simple switch statement where each case will correspond to a different error code. All error codes, http codes, are available in the HP servlet response subject as integer constants, so they ideally match our requirements to construct a switch statement.

So let's put that code in. Right. And again, format it nicely. OK, status is what we extracted right here as an error code. And then we look if it's internal error, that's 500 case. So we'll add to that error the words that we need to contact the server administrator. Something went horribly wrong. A well said here error message.

If it's "page not found," well, it's not that dramatic. You maybe just placed the wrong URL. That's OK. But we need to produce some kind of message there as well. Say "requested page not found," just to make it nice looking custom sort of message.

OK. Of course, you can handle more codes, but for starters, that will do. As usual, use the servlet template TXD file to replace the rest of the dummy code in a servlet with our custom template. So servlet template TXT here, if you haven't closed it yet, and replace the rest of this dummy code with our code.

Now what's left for us to do is replace this bullet plate dummy text with real values. So for example, page title should be "error page," so we'll put it here in the title. The header should be "errors," the navigation should link back to the home page right here. So that's page navigation.

Content. Well, just printout the message that we've prepared already. Here a service that has prepared that error message, and we put it here as our content. And finally, the footer is simply a reminder to click back on a home page link to start over if you had any errors.

And that's it. We're ready to produce some nicely formatted errors for the users. All that's left to do for us is to register this ErrorHandler servlet.

Remember it was mapped to the URL errors. So mapping of that URL to specific error codes, the ones that we want to handle, 404, 500. Here we need to put that into the web xml file. So go back, open the web xml file, and after the session conflict element, just add the registry of your servlet to be the ErrorHandler for these particular codes.

OK. So we're ready to produce some errors. How do we produce them? Remember the ProductList servlet. It has a doGet operation where the requested special sends us off to the login page.

But let's create here a piece of code that will react to parameter error. What if we call this servlet get method with parameter error, and we throw a servlet exception? So we're simulating the 500 error, basically. So go into ProductList, just in a Get method, just before the request dispatcher. Put that throw away of the servlet exception if we receive the error parameter piece of code.

OK. We now can clean build and deploy that code. Obviously, to test, we'll just go to that error URL to see what will happen. Clean and build. Wait for it to complete compilation. Once it completes, product web, right mouse button click, deploy. Wait for it to deploy, and then after it will tell us that it has deployed successfully. Go to the browser, put in the wrong URL, the error URL, and observe your page displayed now here with that home link, with that information about the error, that we need to conduct server administrator.

OK, let's go home. What if we'll try to call the nonexistent URL on a server? So that acme URL. We know it will lead to the 404 error. Again, we have our custom error page here. With have a nicely formatted error message, a "request not found."

So that concludes the test of the functionality of the error servlet. The rest of the functionality of this application should be exactly as you tested at the end of the exercise 7-2. That's it. We've finished practices for lesson 7.

## 6. Skill Check: Creating Java Web Applications by using Servlet API - Score 80% or higher to pass

Skill Check: Creating Java Web Applications by using Servlet API

View Skill Check
