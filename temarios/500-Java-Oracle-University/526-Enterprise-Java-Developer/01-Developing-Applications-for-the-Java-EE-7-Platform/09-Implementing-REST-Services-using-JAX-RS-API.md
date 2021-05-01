# 9: Implementing REST Services using JAX-RS API

1. Implementing REST Services using JAX-RS API - 31m
2. Practice 9-1: Creating a REST Service - 17m
3. Practice 9-2: Invoking a REST Service by Using JavaScript - 7m
4. Practice 9-3: Invoking a REST Service by Using Java - 15m
5. Skill Check: Implementing REST Services using JAX-RS API - Score 80% or higher to pass

## 1. Implementing REST Services using JAX-RS API - 31m

Let's take a look at ways of implementing REST services with JAX-RS API. In this chapter, we can try to first understand the way in which REST services work-- Representational State Transfer conventions-- and then implement Java handlers for the REST components, and then also look at how we invoke REST services from the client.

Let's take a look at REST service conventions and Resources. REST-- first of all, it's not a standard. It's just a coding convention. So you may come across REST services that don't really follow that pattern, but, well, convention says they should. It's all about handling different types of Resources on a server. Resource is a server-side object. And then we map it to the URL, and we handle access to that object via a variety of HTTP methods-- GET, POST, PUT, DELETE.

Suppose the Resource represents some kind of a business object, and we want to perform operations such as query, insert, update, delete around that object. We map these operations to HTTP methods. We expect method GET to do the query. We expect method POST to create a new type of object, new instance of object. We expect the method PUT to update it, DELETE to remove it, to delete it. Other operations are also possible.

But because it's not a standard, we can't really guarantee that some REST services out there, written by other people, will always adhere to that particular convention. We sort of hope that they are, but then again. Unlike SOAP services, which are very strictly codified, a very rigid standard-- it's all about WSDL files and schemas-- REST services are not.

They are not obliged to provide any formal descriptor. They're not obliged to follow that convention-- although, well, they really rather should, yeah? OK, it's just a collection of different Resources accessed via HTTP protocol.

Now, let's take a closer look at the actual REST communication model. The data that the REST protocol transports can be anything. It can be XML. It can be JSON. It can be whatever format you like. There is no requirement for that information that we exchange between a client and REST service to follow any particular format.

JSON is JavaScript Object Notation. It's used by JavaScript applications, typically. And XML-- well, obviously, that's what other services, such as SOAP services, use. But there is no restriction as to what exact format of information the REST service is supposed to use. What it's supposed to do, it's supposed to react to HTTP methods-- GET, POST, PUT, DELETE, HEAD, and OPTIONS, react to these methods, and provision handling for a particular Resource.

All right, so typical client that will invoke the REST service is probably JavaScript sort of client in a browser, or maybe mobile application. But it could be called from Java, you know, from anywhere you like.

How REST services are implemented using JAX-RS API-- well, first of all, you need to create a REST Application component and map it to the HTTP URL. So this is the first example-- Application path maps the Application component to the URL. I'll return to this Application class in just a moment. We'll talk about it in just a moment.

But then I want to highlight this Resource registration. You create a class that represents your Resource. For example, let's say the REST service should handle something about a Product, yes? This is a Product Resource.

The Resource will provision handling for operations. GET, POST, PULL, DELETE, that's still to come. That's not on this PowerPoint. We'll add that code a little later. And a Resource is also a map to the URL, so here it is-- map to the URL Products.

Now, how the Resource is then registered with the Application-- let's go back to the Application class. We need to take the Resource and add it to the list of supported Resources for that Application. So that overriding the method called get classes, right?

There's another method in the Application you could have used, and that registers singletons. So there's get classes, and then there's also a registration of singletons, so a pair of methods, yeah? But in this example, shows you the registry of the class rather than a singleton.

The resulting URL will be the base URL plus the URL for the Resource. So it will be the full URL pointing to that Resource. A Resource can then register further Sub-Resources. So for example, a Product has a Sub-Resource, which is Discount. So that just sort of appends to that base URL as a further Sub-Resource.

To map Resources and Sub-Resources, you use the notation called Path. To map the base URL, you use the notation called Application Path. So base URL is for the Application, and then Paths are for Resources.

What Resource could it be? Well, it could be an Enterprise JavaBean. It could be a CDI Bean.

It could just a POJO. Well, this is just a POJO. It's just a normal Java object. There's nothing special about it.

If it's a singleton stateless Bean, it's registered with a different method in the Application Config class. But otherwise, it's just getting the class and registering it.

OK, and mapping them to URLs-- mapping Resources to URLs is quite an interesting process, because apparently, you can also parameterize these URLs. And this is an interesting example. So we have now-- by the way, that's the first example of actually creating a Resource that handles a specific HTTP method. You see the GET annotation, yeah?

So it's saying this Resource, Product REST Resource, is going to react to the client calling it through the HTTP GET method, all right? And he's going to expect the URL to contain some extra-interesting values. For example, here's some Product code.

You've noticed that the Path contains a regular expression that describes the shape of that parameter, do you see? And this is what you expect, that code to be of a particular shape. It could also be used to describe things like, for example, value from and to-- like a range of values, yes? So the parameters could contain different sort of parts, if you like.

Now, each parameter would have a name, like so, and then PathParam annotation would refer to that name. So that's pretty straightforward, yeah? The name mapped to the PathParam annotation within a method. And that's how your Java code inside that method gets access to parameters submitted through the GET method here. They're just part of the URL.

Another interesting thing that happens in this example is this pair of annotations, which is called Produces and Consumes. Produces and Consumes annotations are used to describe what sort of data structures-- what data type would this particular REST service work with? In this particular case, its application JSON type. But as I say, it could be XML, could be HTML, could the plain text, anything.

REST Resource could support a number of different operations, not just GET. So this example shows further operations-- GET, POST, PUT, DELETE. Let's start with GET.

Conventionally-- remember, that's not a strict standard, but general convention-- you expect the method GET, that has no parameters-- GET with no parameters-- you expect that to return you a list of components of the type of that Resource. So list of Products, in this case.

If the GET method contains parameters-- for example, it contains a parameter of Product ID, well, then you expect it to return not a list of Products, but then a single Product. But either way, whichever way you look at it, generally you say, that's used to read data. The GET method is there to support read operations.

Let's take a look at POST. POST could be used to create a new object-- create a new entity. PUT-- the difference between POST and PUT, you see, is that PUT contains an ID of the object-- identity as the path parameter. And that means it's probably more suitable to updating the object, because you're saying which one to update.

I must say, however, there is this comment at the bottom of the page that sometimes, PUT or POST may be used interchangeably by a REST service. Remember, absence of standard-- it's just a convention. So there are REST services that may use POST for update and PUT for create, rather than the other way around. It depends.

I suppose the reason is this. If you're creating a new entity, and you are not generating the ID from the sequence, then you may designate the ID as Path parameter. And if you have means of identifying which record to update without passing an ID parameter, well, I suppose, then, the PUT could be used for create rather than update. I don't know. POST could be used for update in that case.

Well, it's up to you, really. But generally speaking, normally, you would use POST for creating and PUT for updating. DELETE for deleting, you would expect-- DELETE operation to accept the identity of the record as a Path parameter to identify which record, which object you want to remove.

The HEAD HTTP method conventionally is supposed to do exactly the same thing as GET, except it's not returning an actual object. It's returning only headers. Typical use case for the HEAD is to check if the previously received GET operation-- content from the GET-- is still valid. So you can, for example, by calling the HEAD method, check if this content has changed-- like, you know, if it's still cacheable, if the headers are still the same, then you may not have to download the entire content all over again through the GET method.

OPTIONS method is typically used to return information about other methods supported by that particular REST Resource. So if your client wants to find out if the Resource supports GET, POST, PUT, DELETE, whichever way, calling the OPTIONS method will return that information.

The JAX-RS API provides default implementation for HEAD and OPTION methods. You don't really need to write them. The JAX-RS already gives you these methods out of the box. But if you want to, for example, put in some extra logic into the HEAD method, certainly, you can.

So far, we've REST services that were producing and consuming just one type of content. But they may produce and consume different types. And you can mix them in any shape and form you like. So in this example, you see that overall, we expect this service Resource to produce JSON objects. But then some method could produce XML, and another method could produce plain text, and then another one could consume XML or JSON.

So it's all about how flexible you want your service to be. Do you want your service to allow this multitude of different formats of information? Is it OK for a client to send you XML objects and JSON objects? I suppose if you want to support different types of clients, that could make sense. Right, so that's achieved with Produces and Consumes annotations.

A little bit more on parameters. So far, we've seen examples that were used in this first style of parameter called Path Parameter. That was on previous pages. So slash and then the parameter.

Alternatively, you could use other styles of parameters. A Query parameter as a name, value pair, as you can see. Matrix parameter-- well, the difference is that Matrix uses this semicolon rather than question mark as a parameter separator. Parameters could be not part of the URL, but say, cookies or HTTP headers. So you could use these for parametrization. An element in the HTML form, application/x-www-form-urlencoded, that could be the parameter as well. That's FormParam.

OK, so that's what you typically would use in your Resource handling methods. Oh, also, if the parameter happens to be missing, you may default its value. So that's this annotation right in the corner of the screen, defaulting the parameter value. Could be used with any style of parameter-- Path, Query, Matrix, any.

Right, do you remember Bean Validation? We talked about this Bean Validation API in the chapter that covered Java Persistence. And apparently, we've mention there that the Beam Validation can be used not just in the Java Persistence API, but all over the place, anywhere, really, including REST services, see? That' all the same Bean Validation constraints-- NotNull, yeah. It was a decimal min max, Yeah?

And you can generally just use this @Valid annotation, and just annotate a parameter, and just validate whatever user sent it to you. So that's exactly the same Bean Validation API, no differences at all. You use the same Resource bundle for validation message properties, for specifying error messages. You use the same annotations as you did before in the JPA part of the course. It's exactly the same.

OK, now, if we'd like to produce web service errors from within the REST service, I suppose it's quite simple as this. You need to send to the client a relevant HTTP status code.

There are several ways in which you can do it. So anything from the range of 400 or 500 HTTP error codes will basically signal errors to the client. So suppose, in this particular case, you could use a ResponseBuilder object to set the status with a relevant response code-- well, NOT_FOUND will indicate an error.

Alternatively, you can just throw the exception. This example of throwing the WebApplicationException with exactly same NOT_FOUND error-- so pretending that the Resource the client's trying to access is not found. Yeah, that's you return as an error code, 404. Well, it could be any other status code you like.

Alternatively, you could throw one of the exceptions that are actually subclasses of the WebApplicationException. NotFound is actually a subclass of WebApplicationException with pre-coded status code. So you don't have to parse it as an argument. It's just, for every HTTP status code, there is an already available subclass for the WebApplicationException you can just throw.

If you want to throw any other custom exception of yours, you will have to create a mapper-- a mapper that maps your exception to the HTTP code that you want to return to the client. The course notes contain the example.

Next interesting thing that we're going to take a look that is a capability of the REST service to handle our requests in asynchronous fashion. Remember, HTTP protocol is still synchronous. There's kind of nothing you can do about that. It's all about an optimization of the Resource utilization on a server tier.

So in this particular case, you're designing the server-- a web service, REST service, that uses this interesting parameter, AsyncResponse, with suspended annotation. And what it allows us to do is to create a handler for the asynchronous response, and allows us to define a logic of, what do you want to do with that response as another thread that will do the handling-- so that's the actual logic-- but also associate that handling with a time out.

You can set how long the time out should be like-- in this particular case, 20 seconds-- and then you could set up the time out handler as a piece of code you want to invoke if the time out occurs, before you actually manage to produce that particular service result. So you've given yourself 20 seconds to do it. And the handling of the actual call is in a new runnable object. So that's basically a new thread.

If you are dealing with a REST service that's implemented as an Enterprise JavaBean, then it's actually quite easy to do, because Enterprise Java Beans already are capable of handling asynchronous calls. So all you need to do is put asynchronous annotation, and that's it, really. You don't need to create this new thread thing.

No, just suspended parameter. It's the same as in previous example. And just mark the method as asynchronous, and that's it. Write the business logic that performs the handling of the call asynchronously. So it's much easier to do if you are using the Enterprise Java Bean, because you're using its asynchronous handling facilities-- its capability of handling requests in asynchronous fashion.

How to invoke REST service from the client-- now, this particular page shows you how you can call REST service from JavaScript client. JavaScript is a different programming language. It's not covered in this course. It is covered in another course. JavaScript and HTML5, Develop Web Applications-- we have the course for it, which goes into detail about exactly what you do in the JavaScript here.

However, because REST services are often invoked from JavaScript, it stands reason to at least show you the example of how it's done, maybe without elaborate chapter-long explanation, which is where you can find information in that course. But at least some idea of what's going on in the JavaScript client.

JavaScript clients can handle both synchronous or asynchronous styles of HTTP communications. At this stage, it will get a little bit bizarre. To do that communication with a REST service, you have to create a XMLHttpRequest object.

Well, as soon as you're thinking about JavaScript, things are not what they're called. An XMLHttpRequest object does not have to represent XML. In fact, it can represent any data you want. It could be JSON, it could be XML, it could be plain text. It doesn't matter. I know it's called XML, but it doesn't mean it's actually XML.

So in this particular case, you're creating an XMLHttpRequest, and then what you do is that you-- well, you get some parameters. I suppose your page has some Product ID value, so it's an element in your HTML document, I guess. You point to the URL of your REST service, so whereabouts your service is. That's that URL that contains this Product ID at the end.

And then you open it with HTTP request, open that with method GET. It could be synchronous or asynchronous call. This particular example is asynchronous. You're registering onreadystatechange function, which basically means you're looking for a callback at a point when the handling of that call will be complete.

So right as they change, you're tracking if you're finished that call. The readyState equals 4. There are several readyStates in the JavaScript. When you dispatch the request, when you start getting-- when you upload information to the server, then you start getting responses, and then eventually, you got the response. So readystatechange 4 is that you got the response phase. You got to the end of it.

And then you check in the status code. Well, that's just an HTTP status. I suppose if it's like 400, then that's an error. If it's 200, everything is fine.

And look what I'm doing next. I'm expecting this service to return a JSON object. So I'm parsing the returned JSON value, and I'm using it somehow within the page-- well, how exactly it's used is missing from this particular example. But this is the interaction.

So you're saying either I end up with a 200 code, in which case we'll use the content produced by REST service, or I ended up with some other code, which I suppose is an error. As I say, more information on that is in the JavaScript and HTML5, Develop Web Applications course, which I will strongly recommend you also take if you're interested in writing applications using JavaScript.

What about Java client? OK, well, that's the Java piece of code that calls the REST service. The API that you're using for that invocation is called Jersey, JAX-RS Jersey. It's basically in the reference implementation library behind JAX-RS API.

OK, it's pretty straightforward. So first, you need to point to your REST service, the base URL. Create a new Client object. Construct any URLs appended to the base URL-- well, path to your Resource. So that's Products Resource, that's some kind of Product ID appended to that.

Then you're registering with the web target what kind of response you're supposed to get. So you're saying, I think I will get back a Product object encoded as JSON-- Product object encoded as JSON. And in order to get it back, I need to invoke the service. So you end up with building the GET method-- buildGet, POST, PUT, DELETE, whichever HTTP method you want to use, and invoke that service.

You invoke the service from the Response object. You read that Product. So the JSON object will be converted to Product object for you. There you go. Close the client when you end up with an interaction-- when you finish with that interaction.

This is slightly different example of Java client calling a REST service. And the difference is that this time, it's asynchronous call. So you add these async operation. You initialize the client in a web target in exactly the same way. But before you make the request, you make sure it's asynchronous request. So you added that bit.

And then you register InvocationCallbackListener. InvocationCallbackListener has two methods, completed and failed. If you're really getting a response from the REST service, the completed method will be invoked for you. If the REST service returns a fault, failed method will be returned-- will be invoked for you. So you could put logic into these methods as to how would you like to handle correct or errored response from the REST service.

Suppose it's pretty straightforward stuff. So first of all, remember, you form REST application, map to the base URL, then you form a number of Resources reacting to GET, POST, PUT, DELETE, whatever operations, decide how you pass parameters to them, decide what sort of data types they consume or produce. That said, add some business logic, you're ready to go. And then decide, what sort of a client would you like to have? Maybe JavaScript, maybe Java.

And also, we've mentioned the asynchronous capabilities of REST services and their clients. And the pattern of all asynchronous calls, you probably have noticed already, is by registering listeners that are looking for the call to be completed, or maybe errored.

What about a practice? In this exercise, you're creating a new REST service that does a very simple check. It looks if the discount for the Product is available or not.

You're then going to write two types of clients for this REST service. One's in JavaScript and will be part of your browser-based application, and the other is in Java, just to look at how we could call the REST service from the Java client as well.

## 2. Practice 9-1: Creating a REST Service - 17m

Let's take a look at practices for lesson 9. In these practices, we create a REST web service to check what discount could be applicable for a given product.

Would that invoke this service from HTML page using JavaScript? And also, we create in Java Client to invoke that service. So discount, REST service, and two types of invoking clients.

Let's start with a practice that creates the actual REST service itself. We create a REST service using JAX-RS API that should check if the product is eligible for the discount a day before the expiry date. And then the service should provide the discount, well, if that is bigger. The price is still bigger than 1. Then we could discount it further.

Right. Well, let's start by creating a new class in the product web project, and that being new class, which will represent the discount resource to be used by our representational transfer service. We will place that discount clause in the demos web RS package.

Product web, new Java class, call it discount, put it in demos web RS package. That's for representational state transfer services. OK? So that's your future REST service resource.

Now, what we need to do is make sure that this class implements serializable interface, and we also need a couple of imports here, importing big decimal and local date because we need a couple of variables for holding up the values for product expiry date and price. So implement in serializable, and adding relevant fields.

I'm sorting out all imports. OK.

Next, we need getter and setter methods for these two fields. That could be automated by using getter and setter method insertion of code. So let's do that.

Insert-Getters and Setters for all of these fields. Done.

So this discount is a serializable object that represents a value of product, the big decimal, and its expiry date. Lovely.

Now let's create another class which will be called DiscountService that will represent the actual REST resource itself. OK, so let's create a new class, same project, called DiscountService, and we'll place it in demos web RS package as well.

A new class, DiscountService, same package, demos web RS. OK.

What we'll do with this DiscountService class, we'll turn it into CDI bean. It will be a REST service, but it will also be a CDI bean. Well, why not? Request scoped, yeah? Sure. Just to prove the point that the same class can be both. Yeah?

Make sure you put the correct import in place, which is enterprise context, request scoped.

Now, add a path annotation to map DiscountService to URL discount. Done. Again, make sure you've imported Java X ws RS path.

Let's say it produces and consumes JSON messages, which is highly likely for a web service to do, REST service to do. Use and consume and JSON, sort out the import statements. OK?

And we need JAX ws RS produces, yeah? JAX ws consumes, and the JAX RS core media type. Yes? So these are the imports you need to use. OK.

Now inject product manager, of course, because that's where all our business logic is. Yeah, that's how we access the business logic of our application. OK, and then create an operation which will map to the GET HTTP method.

The operation should accept ID path as an argument and return that discount object, remember, the one we just created a moment ago. So a map that PathParam ID. Yeah? And then will be a REST service operation.

Fix imports, OK? Obviously, we still need to add to the calculation of actual discount here, but at least we've arranged what that operation should be shaped as.

So how do we calculate discount? Well, we need to create a new discount, obviously. Eventually, we need to return it. And then we need to find a product.

So in between the instantiation of discount and return of discount object, we need to look for products. How do we do that? Well, we checked the product manager CDI bin, didn't we? So that will be good. Yeah? We'll just query the product we use in the product ID. That's our path parameter. We read a product from the product manager bean.

Then we check if we found anything. You see, it is possible that we'll pass the product ID as an argument that result in no valid product. So in which case, we will throw the web application exception here, and we'll say that while the status of response will be not found, which kind of makes sense because we're indicating that we can't find a product with that particular ID. Make sure you've added appropriating parts.

Now if the product is found, let's try to calculate the discount for it. OK? So product is now, with rolled exception, product is not now. We do in the new price calculation.

Fix and imports first, yeah? Get in the price from the product, multiply to 10% discount.

Get the best before date for the product. Let's get that. Again, you need an import of Java time local date. And now, check if the price is still bigger than 1, and the best before date is later than tomorrow.

In this case, place the discount value and date minus 1 day value to the discount object. Otherwise, discounts should be set to zero. So that's the logic.

So subtract the value and compare to 1. If it's greater than zero, then check if the date is about to expire. If the date is about to expire and the price after the discount is still bigger than zero, yes, apply the discount. Otherwise, don't apply the discount. OK?

So that's the algorithm. And that's what we'll do next in this method. And essentially-- let me just reformat the code so it will look nicer. Essentially, we arrived at a point when the discount object will contain discount, either as zero or as some discount value which could be 10% of the price, depending on whatever we did manage to get that had a particular date. Yeah? And the price is still bigger than 1 after we apply discount or not.

So just some business logic here. OK? That's it, I suppose. Yeah? With REST resource, we sorted. Now we need to create a REST application with which we register this resource.

So new file, new Java class, we'll call this class REST application and we'll place it in demos web RS package as well. New Java class, REST application would be the class name, package will be demos web RS. Good.

We need to turn this into REST application. How do we do that? Well, first of all, extend the application class, which is Java X ws RS application, the other REST core application, and also annotate it with application path annotation, mapping it to some URL.

OK. So let's do that. Map that to RS URL and extend application class. Oh, typo. Make sure you've imported correct application class, Java X ws RS core application, and make sure you've imported correct application path limitation as well. That's it. Yeah?

So now it is indeed the REST application. However, what we need to do is register our discount service, which was our resource, handling that discount with this REST application. How do we do that?

We need to override GET classes method over the REST application class. Insert code, override methods, let's do that. Insert code, override method, and GET classes. That's it. Lovely.

OK, now inside this method, we now have an opportunity to register a discount service class. How do we do that?

Before we return super GET classes, create a set, hash set, and add discount service class to that hash set. OK? Here, yeah? Again, sort out your imports. We did. Yeah? So we imported necessary APIs.

And then we add that to the classes object and propagate it to super. OK.

Actually, instead of propagating to super, we should have returned that classes object, of course. It was just-- it's our collection of classes. So let's fix that line as well.

Return our classes. So we registered this resource with the REST application. Right. Testing, clean build, deploy, and then eventually, after everything goes fine, just go to that URL to which you mapped your REST application, REST resource, and ask for the product with ID 1. See what will happen.

OK, clean and build, then once that's finished, deploy product web application. Give it a moment to complete the deployment. Once it says that it's ready, go to the browser and do the test.

I could just open another tab. OK, what's the discount for the product 1? And that's the JSON object that's returned by the service, because we just directly call it with GET method. Well, we're just getting back that, yeah, the discount is potentially available.

What's the discount for product 2? Nah, there's no discount for product 2. Why would that be the case? Why there's no discount for product 2 and there is discount for product 1?

Let's remind ourselves what the data looks like in the products table. Product 2 price is 1, so it cannot be lowered further. And product 1 potentially can have a discount of a particular value, whatever it was, yeah, 10%. And the discount will be available. So just check for product 1.

When does the discount-- will be available on the 26th. Why is that? Why will it be available on the 26th? Well, that's because it expires on 27th.

So that concludes the first part of the chapter 9 exercise.

## 3. Practice 9-2: Invoking a REST Service by Using JavaScript - 7m

Let's take a look at Practice 9, Part 2 exercise. We will, in this practice, add functionality to the ProductEdit JavaServer page to invoke the Discount REST service, check if the discount on the product is potentially applicable.

Generally, we don't really study JavaScript in this course, so more information is available in HTML5 JavaScript course. But we're given here, basically, a JavaScript file. So you create a file, and then it will copy the content into that JavaScript file from the file that's located in Resources folder.

Just create a file called PM and put it in the web/js folder. So I'll go into the ProductWeb project, create a new file, and we want a JavaScript file. Call it pm, place it into web/js folder. So there you go. Just like this says. And then the contents of this file will be taken from the pm.js file located in Resources folder, basically. Hey, that's created. Grab the file, pm.js, from Oracle Home Labs resources. That's the contents of the file. And copy it into your pm.js.

Let me just very briefly comment on what's going on. So it registers a function called getDiscount, creating a new request, which will point to our discount service, appending the product ID at the end. The product ID-- we'll get that from the current HTML document element pid. We'll open a get request, send it, register asynchronous listener onreadystatechange function.

Check when we get a request back-- the response back. If we get a response back, if everything is fine and status of response is 200, parse response text as JSON object. And then if discount on the JSON object is more than 0, display a dialog saying that's the possible discount and that's what will be available. Otherwise, display the dialog that product is not eligible for a discount. And if you had a problem, any other status but 200-- in which case, well, just an error, I guess. Yes? So display that error to the user. So that's that getDiscount function we've added to our project.

Now, there's an explanation of what the discount function is doing provided in the manual. So that's just for you to read. Well, I've just talked you through that anyway. And then we need to add the invocation of that discount function to the ProductEdit.jsp.

So let's add a script element in the head section of the ProductEdit.jsp. So that's the script element here. Let's add that. Open the ProductEdit page. Scroll to the top. That's the head section. Just start another line of code here, and add that reference to the product management JS, JavaScript file. Good. Added that.

However, that's just a reference to the file. What we still need to do is actually invoke it. Well, let's add a button. We have this form, and we can just add another button to it, and a button, on click, will call the getDiscount function. Just somewhere in this form. It'll be after whatever is the last button we've added. Let's just add another button to call that getDiscount functionality.

That's it. Deploy. Clean, build, test. Let's do that. We'll do the test. So we recompile the project just in case. So now deploy that application to the server. Completing the deployment. As soon as it finishes the deployment, let's run the test.

So to remind you what the test looks like, simply go to the product search, find a product and then try to click on that discount button. And depending on which product you're looking at, you will either get the discount or not. So see, deployment is fine. Go to Product Management URL, search for products. Well, find all of them.

So let's go to the first one, to the cookie. Click on the Discount button. Discount is available. That's the price. That's the value. Back to the search. Let's try again. Let's find, now-- let's go to Cake. Check the discount on Cake. Product not eligible for discount. Obviously, depending on the price, depending on the date and these values, it may or may not be eligible. So you can easily check that.

Well, that concludes this part of the exercise. The next thing we'll do will be creating a Java client to invoke that REST service.

## 4. Practice 9-3: Invoking a REST Service by Using Java - 15m

Now let's take a look at practice 9, part 3, in which we create a Java application that will invoke Discount REST service. We'll do it in a separate project. It will be another client application project. So create new project, which will be a Java application. And then this would be DiscountClient project. Make sure it's in Home or collapsed Projects folder. So we create a new project and DiscountClient and check if it's in Oracle. Yeah, labs/projects, that's fine.

Main class. OK, well, yes, we would like to have a main class, and it will be demos.client.DiscountClient. So creating the main class, as well. That's it. So this project will contain JAX-RS client that will invoke our web service. In order to support JAX-RS API in client tier, we need to ensure we add relevant libraries. That's JAX-RS 2.0 and Jersey 2.51 JAX-RS reference implementation. Add them to the libraries of the DiscountClient. Add in the JAX-RS 2.0 and Jersey reference implementation libraries. OK, so we have relevant libraries in our class path now.

Now, that's because it's essentially Java SE client project and doesn't have the Java EE libraries in the class path. Now, we'll create a class called Discount in demos.client.rs package to represent the REST content that we're sending and receiving in Java. So, the Discount class would be serializable and would have a big decimal value representing discount and string that represents the date. Please note, string that represents the date. That's because HTTP protocol translates everything as text, so if you want to do a conversion such as LocalDate, unfortunately, the JAX-RS API does not automatically convert that. We could supply the custom converter again, I suppose. But for these particular purposes of the practice, it's not really required. We could just simply accept the value as is.

So a Discount class needs to be created, yeah? You can actually copy the existing Discount class code from the ProductWeb, just to save time. It's practically saying-- well, with minor changes, I guess. So the simple copy/paste will do. Look, if you go to the ProductWeb project, we have there the Discount class that we've created to represent our data. That's the Discount class. So we can just copy it. And where we will put it here? Well, you see, we could put it just in packages folder and then refactor it to be in the right package.

So you can just do-- I'm sorry. Yeah, there you go. So at the moment, it's just pasted as is. Once you've copied the Discount class, you need to perform refactoring of that class. Because it's in different package, it should be in a different place now. So the new package where it should be should be demos.client.rs. So let's fix that package statement. And then, see this bulb here, incorrect package? Move the class to correct folder. That's what we need to do.

So we'll position it to the demos.client.rs. We moved that class. It's practically the same as on the server tier, that Discount class, with just some minor changes. Because we want the date to be string rather than LocalDate, because we don't really care about parsing it in this particular program. Although, we could have, I suppose.

So that means that we need to modify the type of date field here. Change that to string. Obviously, you match the getters and setters. It's pretty straightforward. And if you want to remove unused imports, just click on fix the imports. That will get rid of unused imports. So that's basically what the resulting code approximately would look like. It's just a value hold an object, really, for us.

Now, we need to create a class which will represent the discount service, which is obviously a remote service, but it will represent this remote service on the client tier. So within the DiscountClient project, create a new Java class. Call it DiscountService and place it in demos.client.rs package. Within DiscountClient, create new Java class, DiscountService. Place it in demos.client.rs package. That's it.

What we're going to do with this class, it will be representing remote service for the client. So first of all, we need to add here a WebTarget instance variable. Let's add that. Appropriate import should also be added. Then, a client variable that represents the client of our REST service. Again, appropriate import needs to be added. That's javax.wrs.rs.client.Client.

Now, in a constructor, we will initialize that Client, and we'll initialize the WebTarget. And we'll initialize them to point to our REST service, so reserve a URL variable to point to the REST service. Let's add that. Let's add constructor, as well, which will perform the initialization of the Client and WebTarget, basically, by pointing to this REST service and then by pointing to the Discount resource registered for that REST service. Sort out the import. Make sure you added ClientBuilder import.

Now, a closure method will be required, so clean up that ClientBuilder resource once we've stopped using it, I suppose. So additional closure should be added to this code so we close that client. All we need to do now is add an operation that will represent the getDiscount remote service method. Let's call it getDiscount. It will accept product ID, return us a Discount object. Obviously, further code will need to be placed in here in order to actually invoke remote web service. How to do that? Use the WebTarget.

All you need to do with the WebTarget is that you need to add to it a path which is the product ID. Current path of the WebTarget is the base URI plus discount. And all you need to do is just append that product ID at the end. Done. Appended that path. So, now we're ready to perform the actual invocation. We need to register Discount class with that WebTarget, because we need the REST service to convert JSON packet to the Discount object. So the REST API will do it for us. Then, we need to request the JSON media from the server. So say, yes, we are supporting JSON interaction, build the GET request, and invoke the service.

That will return as a response object inside which we will get the Discount object. Sort out your imports, response and media type. Format the code. That's getting a response, invoking it, and then just extracting the discount out of the response object. So getting the discount and returning it. Getting discount from response object and returning the discount. I think that's pretty much it in terms of the mechanics of invoking that service from the Java client, so we have the necessary method here. I think response import, we've already added that.

Now, just in the DiscountClient main method, create an instance of DiscountService and proceed with the call. So this is our DiscountClient in our main method. Instantiate DiscountService. Make sure it's imported, of course. Now, in order to proceed with the call, really, all you need to do is just call that method, getDiscount. Decide for which product you want to get the discount. It is product one? Is it product two? Well, you know, any. I suppose product two would not have a discount. Product one will have a discount. So whichever one of these products you want. Make sure you import demos.client.rs.Discount class.

You may check what's going on with your Discount object. So you could, for example, see if the discount is zero or not and then decide what to display to the user, different messages. This is basically like that JavaScript program showing alerts, but this time, it's a Java client just printing messages on the console. So we'll add that handling code once we acquire the discount. Big decimal needs to be imported. We can nicely form the code. So either a discount and date are available or not.

Oh, and what else we need to do? Close the DiscountService. That's why we provisioned that closure method. So once we're over with that call, just make sure you are gracefully closing that DiscountService. That's it. You ready to run, build, test, see what will happen? So all you need to do is just basically clean and rebuild DiscountClient and run it. So this time, we're running product number two. Should say the discount is not available, product not eligible for discount.

Let's try it with product number-- well, it depends on your data in the table, isn't it? You can always rig it to be available or not available for discount. And then, let's try it with product one. Well, that's fine. That's available, yeah? So we've sorted that particular example out. That is it for the practice for lesson 9.

## 5. Skill Check: Implementing REST Services using JAX-RS API - Score 80% or higher to pass

Skill Check: Implementing REST Services using JAX-RS API

View Skill Check
