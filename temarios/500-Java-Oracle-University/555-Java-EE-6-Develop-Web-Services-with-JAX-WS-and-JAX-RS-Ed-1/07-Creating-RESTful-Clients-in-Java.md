# 7: Creating RESTful Clients in Java

   * Creating RESTful Clients in Java, Part 1 - 24m
   * Creating RESTful Clients in Java, Part 2 - 14m
   * Creating RESTful Clients in Java, Part 3 - 6m
   * Practice 7-1: Calling REST Services with URLConnection - 6m
   * Practice 7-2: Using the Jersey Client API - 3m
   * Practice 7-3: Modifying a JavaScript (jQuery) REST Client - 4m
   * Practice 7-4: Properties of a RESTful Web Service - 2m
   * Skill Check: Creating RESTful Clients in Java - Score 80% or higher to pass

## Creating RESTful Clients in Java, Part 1 - 24m

Let's go ahead now, after we looked at this overview of RESTful Web Services, let's go ahead now and actually create a RESTful web service client, in Java of course.

Here we're going to make use of the Java SE API to make an HTTP request, use the Jersey Client API to make an HTTP request. And process XML and JSON in a RESTful web service client. One thing that we need to remember about RESTful web services and JAX-RS API, let me to go to the board now.

Well, the RESTful web services actually make use of an API called JAX-RS. But JAX-RS from the service side, we use the JAX-RS to build our RESTful web services. Tomorrow we'll see how we build a web service using the JAX-RS API.

But today what we are going to do is we are going to create a client. And this client is going to be a-- it's called a RESTful Client. But this RESTful Client does not use the JAX-RS.

If you remember, in the morning we looked at the JAX-WS. And with it we created a JAX-WS client. For RESTful web services you actually don't have the JAX-RS API on the client side. But we do have a couple of ways to actually create this RESTful client.

First we're going to use the URL API, Java API. And the second one, we're going to use the Jersey API. That's what we are going to do. The Jersey API is quite interesting. And that's the one that allows of course to make calls on the JAX-RS RESTful web services. Let's go ahead and look at that.

So Java provides a simple mechanism for communicating with HTTP via the URL object associated with the URLConnections. The Jersey also, by the way, provides a client API for a convenient access to the JAX-RS web services. We see that.

By the way, that our third-party libraries also that it can use which are the Apache HttpClient that allows you again to access that.

So here what are we going to do? We're going to start by using the first one, which is the URL object. That's what we are going to do.

So here is a simple Java client that allows us to access a web service. And of course here we are making use of URLConnection. So we do have a class called SimplestClient. And let me just increase this a little bit, so you guys can see the code nicely.

So we have a main method that throws an exception. And we create a string called contextURL that has again this URL, http localhost. 8080/jaxrs. And then a resourcePath [INAUDIBLE] resource called airports. And then it requests a path called number of airports, which means it's going to return the number airports.

I concatenate all those strings and create the URL string. Then with it, I create the new instance of the URL. So the URL is an API, by the way. I know it's a class that actually we can make use of. And it has the methods that you see here. Pretty much all these methods can be used. And of course, in this case, and also it has constructors. So the first one that's the one that we're using. It's the first one, URL it takes a string. That's the one that we're using at the beginning.

So we go ahead and create a new instance of the URL. And then we invoke the get.Content on the URL, and cast it into an object of type InputStream, and get the result which is an InputStream.

Now what do we do is now pass that to a new instance of a scanner. Everybody knows about the Scanner class in Java that allows you to read data. So you get that scanner, and then of course from it you can go ahead and get the next element from scanner. By the way, Scanner is an API in Java.

And thus the Scanner class, in SE 7, and that's pretty much what we have. And it has methods. Again, next, and next byte, next and so forth. So it has next integer, and so forth. So you see here's the next string and so forth. That's the one that pretty much we've seen here.

And then so as simple as that. So this is an example on how in this case you access the resource, which is in this case, localhost 8080/jaxrs, airports, number of airports. And then it returns the number of airports, and you go ahead and print them out.

We can even use a path parameter that if you're passing a parameter. For example here, we have an example called PathParamClient. It has a main method. I have a URL, a contextURL. I have a resource, a path, and have in this case a request path. But it says nameByCode, which means I'm going to return the name of the airport by code. So which means I'm going to have a param called LGA, which stands for LaGuardia, by the way, airport in here.

So I'll go ahead and pass that. And then what I do is I pretty much take all these strings and concatenate all of them together, including the param LGA. And then pass that to the URL constructor to create URL. And then invoke the getContent to get an InputStream. And then after that I use what? I use a reader, by doing what? Taking that result and wrap it into a constructor of InputStreamReader. And then wrap it up into a BufferedReader, and get a BufferedReader.

Once I get an instance of BufferedReader, I'll go ahead and invoke the readLine, and print that line. Anybody a little bit familiar with I/O API? OK. That's pretty much what we're doing here. So this is an example.

I can even do a little bit of instead of passing one parameter, I can pass a form, a FormParam. That's again part of the HTTP. Nothing is really new to us here.

So a FormParamClient here as an example. We have the contextURL, the resourcePath, but this time look what I have. I have an add request, which is an add operation. Where it allows me to add the code, and the name. Which means I'm going to insert a brand new, in this case, a record about in this case, of the airport, LGA for LaGuardia. Most probably for example, Jetblue or some airline, they want to add a route from Boston to LaGuardia. So they're adding the LaGuardia in this case as an airport.

So I'll go ahead and look what I do now. I take the contextURL, the resourcePath, and the requestPath, and I concatenate all of these together and create a urlString. I pass that to the URL. And then I invoke now an openConnection, and cast it into an HTTP connection.

So in this case I can always show you that where in the methods I can go ahead and get into a URLConnection. And from the URLConnection, I can go ahead and get an HttpURLConnection. Which is again, all of this Java. There is nothing new to it.

So I get my connection. And then when I get my connection I'll go ahead and now I do have these methods, which by the way you would see all of this here, these methods that allow you to again set the different settings, and so forth. Some of these methods are inside the URLConnection. Some of them, by the way, are inside the connection itself. Also it has a bunch of methods that you see here, Connect and so forth.

So this is what I see here in my code. So set the request path to POST, which means I'm going to add, post that. Set the AllowUserInteraction to true. So for the user to interact. Set the DoOutput and the DoInput to read and write. And then of course connect that connection.

After that I'll go ahead and invoke the getOutputStream to get an instance of the output stream. And then I'll go ahead and pass that to the PrintWriter. And then I'll go ahead and now write to my application by passing the code, and the name.

And you take a look at the ampersand over there. That's how we do it in HTTP for those who are used to HTTP. And then you close the writer. Then after that you get an InputStream. And then from the connection to get the result. And then wrap it up into an InputStream and a BufferedReader, which allows me to read, in this case, the result. Which most probably would be the ID of that particular airport that we added.

So when you look at this code, ladies and gentlemen, when we look at this code, what is that we don't like about this code, just by looking at this code? So we need to be very familiar with HTTP API, the URL connection. We need to be familiar with I/O. And so this is all a nuisance.

So maybe there is another way to actually do that. So the drawback of the approach that we've seen is that we said to avoid the URL parameters. That you again, may need to provide the URL-encoding, awareness of the structure of HTTP, require low-level I/O programming. That's exactly what we've seen here in this example.

So we said this may be a bad way to actually write a RESTful client. Why not make use of a new API that allows us to quickly create the client, RESTful client. And that's actually going to drive us to the concept of the Jersey API.

But before getting into the Jersey API, let me just share with you one of the concepts that Java uses. Most probably you guys know about that. Anybody knows about method chaining in Java? It's well known. Where, for example, here I do have a-- create a new instance of a person. And then I can go ahead and set the name, and set the last name, set the first name, set the address. What we could do is instead of having this setFirstName have a void it returns an object of type person. Instead of having a return of void, I want it to return and instance of type person.

Which means I can use this concept, new Person, .setFirstName, .setLastName, .setAddress. That's by the way, well-known part of which pattern? Anybody knows about the Gang of pattern? The Gang of Four pattern, rather in Java? The design patterns? Yeah, that's the Builder pattern. Yeah.

So we see this a lot in the builder pattern. So we put this, by the way, just to give you a review, you remember the chaining methods? You remember how we do it? Now what's going to happen is we're going to use the Jersey API that takes advantage of these chaining methods. That's pretty much why we gave you this API.

Now we're going to see the second way, which is the way to build a RESTful web service client. And that's the Jersey API. The Jersey Client API revolves again around two entities. One is called the WebResource, which represents by the way in this case, the JAX-RS resource. Communication between the Client and the JAX-RS resource are encapsulated within these instances.

And then it has another class called the Client. Client defines a configuration point for the Jersey runtime. It also acts as a factory for the WebResource. So these two APIs, by the way, are already in-- and we can already read about them. And here's again, I just opened them.

So here's a Class Client, which is part of the Jersey API. It's under com.sun.jersey.api.client. And it has again a bunch of methods. We're going to make use of some of these methods that you have here. And of course it has a constructor that creates an instance of the, in this case, Client.

And then we have the other one, which is WebResource. This is also another class. And pretty much again like when you take a look at this Client, which says in this case, the Client can be configured to actually in this case, create a WebResource for you.

And then the WebResource itself, this is an API that represents a resource, or a JAX-RS resource. And it has its own methods too, accept and so forth. We're going to see some of these later on.

So let's go ahead and talk on this API. So here's an example. So what are we going to do? Is we are going to mimic exactly these examples that we've seen earlier, folks, the Simplest one, the PathParam one, and the FormParam one. We're going to mimic the same thing, but this time we're going to use what? The Jersey API.

Let's start with a Simplest Jersey Client. Here's a class called Simplest Jersey Client. And it has a main method. I have a contextURL. I have a resourcePath. And I have a resource request, pretty much similar to what we've done. I'll go ahead and concatenate all of this to build a URL string.

And then I go ahead and invoke, on the client class I invoke a create method. So this client class that you have here has a method that allows you in this case, to create a client. So here it is. It creates a default client. That's exactly what we've done here in the API.

So once I get that client, now on the client I have a resource, and pass the URL string to it, which is this one here, replace and find the resource. And then with it I create a WebResource.

So again going back to the API. And looking at the API, so I have now a client. And then of course by looking at the API here, it looks that there is a method called resource in the client class. Let's go ahead and take a look at that. Here it is.

Resource that takes a string representing, so that creates a WebResource from the Client. So that's typically the one that we're using. And that's exactly what we're using. So we get the resource. And then once we get the resource, we invoke the get method. It looks like the resource has a get method. The WebResource has a getWebMethod.

And let's go ahead and look at this. So here's a get. And this get, of course in this case, you pass the class type. You guys know about generics in Java, right? You pass the type, and that's exactly the object type that you are going to return. And so that invokes the get method that allows you to get that. And this is exactly what we're doing here.

Invoke the get, pass the string class because it returns what? An instance of type string. And then after that I'll go ahead and print it, as simple as that. This is an example of, what we call in this case, a Jersey Client, the simple one.

Imagine now that I want to pass a parameter. So first of all, before doing that, let's go ahead and understand a little bit about these concepts of customizing a request message. WebResource class allows the application to customize the HTTP method used by the request, including the payload. Also the request headers, the query parameters, they could be request cookies, and so forth.

Here's a QueryParam, similar to what we have done in the Java earlier. So here I have a class called QueryParam, a Jersey Client. It has a main method. It has again, the contextURL, the resourcePath, the requestPath, and then here look what we do. We do have now, we have a codeByName. Which means I pass the name.

In the example of using the URL in Java, we used pass the code and return the name. Here we pass the name and return the code. So we have the name, LaGuardia. We create a urlString. We create a client. We create a WebResource with that urlString. And then all what we do now, it turns out that we have a queryParam method. The queryParam method, here's my queryParam method. As you see here, it's overloaded.

And that I can, in this case, take a key and a string or a value map, and it creates a WebResource from the WebResource with additional query parameters that you want to add. So in this case it turns out that I'm using the one that I have here is a name, which just happens to be the name that I am using here, which is LaGuardia.

And that's the key. And that's the name. And that's exactly what I have here. So I'm using this one here. I'm using this one, creating a WebResource from this WebResource with an additional query parameter added to the URI of these WebResource. And that should return for me an instance of a WebResource. And that's exactly what I have here.

So I get my, in this case-- and of course I invoke-- see this is the chain method when it comes. So it returns a WebResource, which I invoke on it what? The get method, and pass the string class, because I want to return a string. And then we print it out. Everybody sees that?

So which means here the code of LaGuardia, which is LGA, will be returned and printed out here. And that's the key of this case of the chaining method. Because the queryParam returns a WebResource, and on it I invoke the get method to return my string.

So this get method accepts a type, or a list of types, to again use when creating the value to return to the caller. Of course the type is accepted as include classes that are JAXB classes, in the sense that are in this case, marshallable by the JAXB API. It is also possible to specify the representation that the client expects for a payload of the reply message. We'll see that, what the client expects, in a couple of slides.

Now let's assume that I want to specify what again is expected as a return type. Aha! So it turns out, folks, that the WebResource API has a method called accept. And this accept pretty much adds an acceptable media.

So for example in my exercise here, my example here, look what I have. I have in this case a class called JSONObjectJerseyClient. It has a main method. I have my urlString, which happens I represented all the way in one URL. I create a client, and I use that urlString to create a resource. And then in it, I go ahead and on the resource I invoke accept.

So here what I'm telling the WebResource I expect what? I expect a message of type what? JSON to be returned. That's what it means. And then after that I invoke the get method, It's again chaining methods in this case. And that of course passes to it what? The class type that I'm trying to return, which in this case returning what? An airport. And then after that I'll go ahead and print that airport.

Which means the airport object most probably has the two-string method already overloaded. So we'll go ahead and print the information about the airport. Got that? Good. Good. Good. Good. So that's pretty much what it is.

So one more example that we want to see is, how about if I want to pass the form parameter. So here's an example when I want to submit the form, the same concept by the way. Nothing really new to it. So let's take a look at that.

I do I have a class here called FormSubmitJerseyClient. It has a main method. It has the URL context, in this case a string URL, in this case. And then I create a client, typical. And I'll go ahead and use that URL to create a resource. And here look what I do. I create a MultiValueMap. MultiValueMap always is made of what?

Key and a value, the key is a string, and the value is of course a string here. We all know about generics in Java, right? So that's what we're using here. So I'll go ahead and initialize it with the new instance of MultiValueMap implementation.

And then after that all what I do is I add the code, which happens to be JFK, to the params, to the MultiValueMap. And then I'll add the name, which is John_F_Kennedy to the params, which is a MultiValueMap. And after that all what I'm going to do is invoke the type. Aha! So it looks like the resource now has a type. So the resource has a type. Let's go ahead and look at that type.

So we have here two types. We have a media type. It sets the media type. And then here of course sets the media type with a string. And both of them return a WebResource Builder. So look and see that. So here I again pass of course, this application. And then here a form, a urlencoded.

And then on it, I invoke the post. But what I'm doing. When I invoke the post, the post method that you have here folks, which is this one here, is the post method that accepts in this case what? The class that represents the type that is the returned, and then of course the request entity, the object that you're trying to pass. And that's exactly what we have here.

So we're passing in this case, this represents the object that is returned. And this represents the parameters that you're passing to the service. The params contains what? The code and the name, which is JFK and John_F_Kennedy.

And then of course after that, I'll go ahead once I get the result, most probably it would be the airport in this case number. Then I'll go ahead and print that in this area. Everybody sees the Jersey API? That's pretty much what it is. So it's very straightforward, very simple, and we love working with it.

## Creating RESTful Clients in Java, Part 2 - 14m

So now of course after looking at this submitting form data, what we want to take is a little bit at the reply metadata that we want to [INAUDIBLE] want to see. And typically what we do is we use the ClientResponse. The ClientResponse represents the complete reply message received by the client. And it's an API that allows you to access the status code, the message payload, the response header, the response cookies, and so forth.

This API is here. Let me just show you that. It is a class, in this case, called ClientResponse. It has again, in this case, a bunch of fields that, again, in this case, we can make use of. And also it has, in this case, constructors again, in this case, that we have ClientResponse. That [INAUDIBLE] status, headers, an entity, and workers. And it also has a bunch of methods. These methods are again, in this case, useful sometimes to actually work with.

The good thing about also the ResponseClient, it also allows us to work with the again nested class, which is, in this case, the status. And this status, by the way, has enum constant summary, which represents again the different ones. So the accepted constant is 202, the bad gateway 502, the bad request 400, the conflict 409, and so forth. So you have a whole list of all of this that you want to make use of.

So here's an example where if, for example, here we want to obtain reply metadata. Here I have an example where it says a ClientResponseJerseyClient class, it has a main method, it has a URL string here represented by this URL here, and then it has a-- first we create a client. And then after that, we go ahead and use the urlString to create a resource.

But this time, look what we want to do. We want to go ahead and use the resource and say accept, which means it's going to return in this case a JSON. It's going to accept JSON. And it returns a response, in this case, of type ClientResponse. That's why I passed the ClientResponse.class in this case to the get method. And then after that, I'll go ahead, once I get the response, I invoke getStatus. And that will get me the status in our code, and I'll go ahead and print it out. And then I invoke getEntity, pass the instance of the airport, and that of course will return an instance of the airport, which by the way I'll go ahead and print, because [INAUDIBLE] does the two-string method already overloaded in the airport class. So that's pretty much what we have here as an example if you want to work with a response status.

Of course, another interesting example is using filters. Jersey Client API filters. We can use these, by the way. Let me just ask you a question, anybody have the filters? We use filters in many technologies. One of them in the web components. Which one of the web component that has filters? You've got servlet filters.

And as an example, let me just show you that as an example. And for that, let me just put in a diagram here just to have an idea about it. So if you remember, we actually used this yesterday. And if I want to just change this or modify this so that I can have from a servlet filter which calls another servlet filter which calls another servlet filter, which calls my, in this case, servlet. Which calls my servlet. Which calls my, of course, business delegate here.

So what I could do here, I can use the servlet filters-- SF stands for servlet filters-- where I can see the first servlet filter here handles, for example, decryption. And then the second one handles authentication, and then the third one handles authorization, and then it gets to my servlet. So servlet filters are very, very handy.

And by the way, in the EJBs also, we do have also some handlers in EJBs. And they're called interceptors. Anybody heard of interceptors for EJBs? Or for SOAP web services, we call them handlers.

So let me just show you an example about that here. And so here, of course, we have filters that allow client to perform common operations on any JAX-RS interaction, independent of which particular interaction they each are. Filters are similar to servlet filters, like I showed you over there, or handlers for JAX-WS specification. And by the way, in my design here, I can always use also a servlet filter on the board here where I can specify a server. Like this servlet filter, I can say this will go ahead and handle auditing. If I want to audit what's going on and all that. So I can go ahead and do that, too.

So let's go ahead and take a look at an example. And in this example, look what we did. We actually created a class called LoggingFilter. And then I have here a LoggingClient class. It has a main method. I have a URL string here represented by this URL. I'll go ahead and first of all create a client by invoking the create method on the Client class to get a client.

And then look what I do. Then I use the addFilter method on the client by creating a new instance of the LoggingFilter and adding it to my client. Then after that, I'll use the resource method passed through with the URL string to create a resource. And then from there, I have the web resource. And then from there, I'll go ahead and invoke the accept that says return object of type JSON. And then of course invoke the get to pass the object that I wanted, or the type that I wanted to return. And then I'll return result. I'll print it out.

So this is a mechanism by which we show you that the Jersey client can use filters. And the example that we showed you here, how we can add a LoggingFilter to, in this case, the Jersey client, which is pretty much straightforward. So far so good? Everybody's following here? That's pretty much what we've done here.

So of course, lots of times we want to work with JSON. Does Jersey work with JSON? Of course the answer is yes. Jersey client supports marshalling and unmarshalling JAXB objects, as shown again in the previous slides that we've seen.

The Jersey client again uses a library called the Jackson JSON library to support JSON. So for example, here I have resource. I do an accept media dot application JSON. And then I pass the Quote class. And that of course will return an object of type quote, in this case. So the support of JSON is pretty much not limited to the JAXB classes, but you can also use a clientConfig in this case. Let me just show you that clientConfig in this case.

ClientConfig. In the Jersey API. And this is an interface, by the way, that declares common property names, features, properties and providers, classes, and singletons. And we'll talk about singletons tomorrow. And it has also a bunch of methods. getsClasses, getPropertyFeatures, getSingletons, and so forth. So we'll see that, by the way, tomorrow, when we build our-- it has also fields in this case that are the property buffer response entity on exceptions. We see some of these, again, in this case tomorrow, when we build our JAX-RS web service.

So I create the new instance of, in this case, the clientConfig by calling the default clientConfig. And then on that clientConfig, I invoke getFeatures and put again in this case the configuration, which happens to be in this case the mapping in this case to the pojo mapping. And then of course the Boolean set to true. [INAUDIBLE] we'll go ahead and do the mapping. And then I'll pass that to the client, and then of course this will automatically support that JSON concept.

You can, by the way, you read and write JSON. Java does not actually have a standard for reading and writing JSON yet, which means it's in the works. So the Jackson JSON libraries can be used standalone or with a Jersey JSON JAXB context. So here, for example, let's assume that I have a file that is a JSON file called sample.json. What I could do is I can go ahead and create a file input stream to read that file. And I get my input stream here.

And then when I read, if I want a POJO with Jackson, easy. I'll go ahead and create a new instance of the object mapper. So it turns out that I have an API here called ObjectMapper. ObjectMapper.

And this ObjectMapper that I have here-- oops. I do have a firewall here. I do have a firewall to access it. Hopefully I can access it through this one here. Nope. Yeah, it's a firewall on this machine. But of course, you can read this API and you can actually read about it. It's pretty much straightforward.

So I get an instance of the ObjectMapper. And then in this case, on my mapper, I go ahead and read the value, which is in this case the JSON. And of course the type of the class that I'm going to return, which happens to be a pojoQuote. I could read of course, by the, way this is reading a POJO with Jackson. If I want to read now JAXB with Jersey, easy. I'll go ahead to create a new instance of JSONJAXBContext. There is JSONJAXBContext. Let me go ahead and try if I can get that.

JSONJAXBContext. And I should be able to actually-- OK, here it is. So this is again an adoption of the JAXB context to support marshalling and unmarshalling of JAXB Beans using the JSON format. That's pretty much what it is. And it has again its own methods, and it has its own constructor fields, of course, in this case, of JSON array, JSON enabled, JSON non-string, and so forth. And it has of course some nested, in this case, a class that has a JSON notation, which by the way in this case represent my notations, which are enumerations that say [INAUDIBLE], mapped, mapped jettison, and natural and so forth.

All right. So I create the new instance. And pass, of course, this is to of course work with the class Quote. And then from it, I'll go ahead and create an unmarshaller, the JSON unmarshaller. And then of course after that I'll go ahead and use the unmarshalFromJSON that takes me the input which is the JSON and then convert that into a Java object. This is pretty much how I read JSON and get converted in doing this case a Java object.

That's pretty much what I see here. And of course, you can look at the API that allow in this case to create a JSONUnmarshaller. And this JSONUnmarshaller itself has of course in this case a method summary that allows you to unmarshalFromJSON and so forth. And in the example that we see here in this lesson is it uses createJSONUnmarshaller, and then unmarshalFromJSON, which means I have JSON that comes from my input stream, and then I want to convert that into an object of type class Quote. And that's what I'm returning here. Everybody sees that? Good, good, good, good, good. That's pretty much straightforward. And that's pretty much what we wanted to say here about of course JSON in general.

Now what we're going to do is just take a look at a couple of quizzes. First, the JAX-RS 1.1 specification defines a standard client API. And that of course is not true, as you know. And the second one is with Jersey class represents-- which Jersey class, rather, represents a REST resource that is located at a URL? And that of course would be the WebResource. That's always represents a resource, a JAX-RS resource.

We do have a bunch of resources as URL, if you want to read a little bit about HttpURLConnection or Jersey API or the Jackson JSON Processor, and so forth. And that's what we wanted to say about the Jersey client. So what we ended up studying here, folks, is that from the RESTful client point of view, we can use the URL connection, which is pure Java, to actually create in this case a RESTful client. Or, we can use the Jersey API that uses a couple of objects here. One is the client, and the other one that allows you to create the web resource. And of course, uses the concept of the method chaining that we've seen in this lesson.

## Creating RESTful Clients in Java, Part 3 - 6m

Now that we went through the lesson of creating REST clients, where we actually discussed how we create these RESTful clients, one is using the URL connection API, Java API, to create that RESTful client. And of course, we also looked at the Jersey API that makes use of the client and the web resource components to create a Jersey client. And now what we're going to do is investigate this through a bunch of practices in this lesson, practices for lesson 7.

So in lesson 1, we are going to, in this case, call a RESTful web service using a URL connection. Which means we're going to create a client, making use of the URL connection. So you will, in this case, call the WebLogic RESTful Management Service web service.

Again, the web service provides a representation in three formats-- HTML, JSON, and XML. And because Java includes multiple APIs to process XML-formatted messages, the easiest representational format to process in Java without, of course, additional libraries is XML. And we'll go ahead and create these. Again, in this case, we assume that 6.1 Enabling RESTful Web Service Management for WebLogic was completed.

So you follow the steps, step by step. And you create all, you know, and go through all of these, in this case, labs. And add the code necessary and all of the configuration necessary. And then, of course, after that, dress you run your Java SE RESTful client. And in the Practice 7-2, what we're going to do is, this time, use a Jersey Client API.

So in this practice, we modified the Java SE REST client that we did before to use the Jersey Client API. Again, the Jersey Client API is not a standard part of the Standard Edition of the Enterprise Edition library. However, it is expected that it will be coming from the Enterprise Edition 7. So you will see that it will be part of the API, the EE 7 API.

So the same concept, except that in this time, we wanted to make sure that you've got finished with the complete practice 7-1. And then you go through all the steps here, step by step. First of all, we create a new instance of an Authenticator, WebLogic, welcome1. And then you create a Jersey Client code.

And then you create a webResource code, kind of similar to what we have seen in the lesson. And then you follow again, in this case, through all of these steps that they ask you to go through. And of course, run that client. So that would be Practice 7-2.

And Practice 7-3 is optional. Which means you don't have to do it. Here what we do is we just modify Java's jQuery REST client. Here, you open your existing jQuery REST client application and modify it to display the version of the Java used by the WebLogic server. And again, here we just pretty much show you step by step what you have done.

Of course, the requirement here is that you have enabled the RESTful Management Services for WebLogic, which you already have done. So if that 6-1, Practice 6-1, is completed, then you can go ahead and do this particular practice.

Again, follow the steps, step by step. Pretty much straightforward. We add this code and pretty much, in this case, of course run your jQuery REST Client project to test your application.

And view the, again, success method that displays the amount of heap memory currently in use by the server named in the Input box. Follow again. Follow that, those steps. And that's pretty much what we want to do in this particular practice.

We do have one more practice, which is practice 7-4. This pretty much follows the properties of RESTful Web Services. In this practice, which is optional-- you don't have to do it-- but if you want to try it, again in this case, you discuss with me, if you want. Or discuss it again. Or take a look at it. And if you have any question, let me know. Or fellow classmates, if you are, of course, having somebody taking the class with you.

And the task is pretty much look at some of the Roy Fielding's writing on REST. And of course, perform an internet search for REST. In RESTafarian, also leads to interesting discussion in the validity of REST web service styles.

And then you can also answer these questions that we put for you. Are the RESTful Management Service form of logic hypermedia based? And what would be the benefit of having a single root URL be in this case?

And that's pretty much what we wanted to do in this case for the practices for lesson 7, which is pretty much creating a RESTful client. What's interesting in this particular set of practices is the first one and the second, which is creating a RESTful Client using the URL connection and creating a RESTful Client using the Jersey Client API. Thank you.

## Practice 7-1: Calling REST Services with URLConnection - 6m

Now that we are done with the lecturing of lesson seven, which is related to creating a RESTful client, let's go ahead and take a look at some of the practices. And now we're going to take a look at practice 7-1, which is calling RESTful services using URLConnection, which is a standard edition client in this case. So in this practice, we're going to call the web service, or rather the WebLogic RESTful management service web service. Again, the web service provides representation in three formats, HTML, JSON, and XML. Because Java includes multiple APIs to process XML-formatted messages, the easiest representation of format to process in Java without additional libraries would be XML.

So here we are going to create in this case a project called Java SE RESTClient. And then of course in it, we're going to create a new JAXB binding for, in this case, the monitoring.xsd. And we'll take a look at this in the practice. So here's my project. And then of course underneath, we want to show you the monitoring.xsd. Let me show it to you in this case in the full page.

And of course, commonly, RESTful web service may not provide an XML schema document, even if it returns XML representations of resources. Of course, to process the XML data in Java, you could either use a processing method such as STAX, or you can actually create a JAXB annotated classes. You can either create the JAXB annotated classes by hand and never have an XML schema file, or you can create an XML schema file by hand for the purpose of generating JAXB artifacts.

Of course, for this practice, an XML schema file has been created in advance for you. And of course, that's again, in this case, the XML schema that you have. Monitoring.xsd.

And then of course after that, we want to generate the JAXB classes in this case. And generating the JAXB classes will be here underneath when I, of course, build in this case a project. And then of course here, we'll go ahead and when we right-click, of course, the JAXB binding node under the JAX SE RESTClient and choose generate the code, it will be all generated, as you see here all the codes and the different classes that are generated here. Here's the object factory and so forth.

And of course, now we want to open the Java in this case RESTClient, Java SE RESTClient class, which is this one here. Java SE RESTClient. And let me just go ahead and open it in a full page so that we can see the whole thing. This is a class, of course, that has a main method. And of course, obviously below the main method we want to add the print object type method that will recursively call itself and print out all chart elements. Again, you can copy and paste this inside. So we do have it in this case. And here it is. OK, this is the method that we discussed.

And of course, in the main method we use the triblock. And where of course-- and we catch of course in this case if there is any IOException or a JAXBException. And of course we'll first create a new instance of the authenticator that you see here. And then of course we create a connection to the applications that you see here.

Then of course, if the response code was 400 or 500, then of course in this case we'll write the code accordingly what it's supposed to do in this case. And we use the ELSE also in response code where it is below, in this case, 400. Then of course the request, in this case, succeeded. And we convert the response body into a simple string object using the StringBuilder, as you see here.

And of course, we use the JAXB, in this case. We use the JAXB to read the root data element of the response body, and pass the chart object elements to the print object in this case. And we see all of this here as a code. And that's pretty much what they want us to write as code in this particular class.

So now, of course, what they want us to do is run the project. So if I right-click and run the project, then I will have an output. And I want to show you this output in a full screen. And that's pretty much what we get as an output for this project.

And that is what we wanted to do in this practice, which happens to be practice 7-1. Thank you.


## Practice 7-2: Using the Jersey Client API - 3m

In practice 7-2, what we want to use in this case is a Jersey client API to create a RESTful web service client. So here we're going to modify that Java SE REST client that we've done earlier in 7.1 to use the Jersey client API that we discussed in the lecture.

Of course, the Jersey client API is not a standard part of the Standard Edition or the Enterprise Edition platform library, however it is expected to, again, that the upcoming Java EE REST client API will be based on the Jersey client API. So of course here what we want to do is modify in this case the-- let's take a look at that in the code. So here's our-- you know, so modify the code in such a way that we are going to use now, in this case, a Jersey API.

So first because we have no authenticator, exactly like earlier where we have the WebLogic and welcome1 for username and password. And then pass that to the authenticator, set the default, and then here instead we are going to create a client and the base URL. Use that base URL to create a web resource, and then, of course, after that we'll go ahead and invoke the chain method, where we accept the path applications, and the media type is application XML.

And then, of course, invoke the get method to get the data type, in this case. And that's pretty much what they want. Of course, here's the print object method that we already have there. That's exactly what they want us to do. So instead, we used, in this case, the Jersey API to create a client, and then a web resource, and then invoke the web resource that you see here.

Of course, they ask us to run this project, and then, of course, the output should be the same. So as you see here, the output is pretty much the same, except that instead of using a URL connection, in this case we are using the Jersey API, client API to, of course, create a RESTful web service client. That's what they want us to do in this practice 7-2. Thank you.

## Practice 7-3: Modifying a JavaScript (jQuery) REST Client - 4m

In practice 7-3, which is optional, like I mentioned, you do not need to do this practice unless you're done with everything, OK? So this is just extra, which is not really required for you to learn the course, but we just add it in case people finish, and they want to just explore different things. So in this practice we open an existing jQuery REST client and modify it to display the version of the Java used by the WebLogic server.

Of course, first of all we open the jQuery REST client, which I opened here. And then, of course, what they want us to do in this case, in this practice is open the index.htm.jsp, which happens to be a JSP file. And here it is. And then, of course, in this one here they want us to, in the jQuery dollar sign document, in this case, ready, and of course, in this case function.

So they want us to run the code after the elements of the web page have been loaded. Again, this block adds a click handler to an element with an ID of ajaxGetLink that appears on, in this case, line 46, which is this one here, OK? And of course, this block, again, adds a click handler to an element with an ID of the ajaxGetLink that appears again, as we see here.

Again, because the href in this case in our particular use of the link is set to JavaScript void zero, the only thing that will happen when clicking the hyperlink is that the click handler will run. Of course, the click handler of the ajaxGetLink calls the read string function, which is on line A22. Read string, OK? And this is pretty much showing me the code here, log reading server status.

And then, of course, here we have the URL, the data type, the accept, and of course, in this case the success and the error. And, of course, they want us to run and test this one here. So if we run this, we'll actually get, in this case, an output that looks like this.

And then, of course, in this case they want us to, in this case, enter the value of my server, and then when you click get, of course, at the beginning you will be prompted to enter the user name and password, which is WebLogic, welcome1. And then, of course, if you get them, that's the read object that we see, what we have here. That's the message that we get. And that's pretty much what they want us to do for this practice, which is optional, which is 7-3. Thank you.

## Practice 7-4: Properties of a RESTful Web Service - 2m

In practice 7-4, which is also optional, this is pretty much a discussion that you want to have. And so we want you to look at Roy Fielding's writing on REST, OK? And you will get these by clicking these, or getting into those, in this case, links. OK? And the first one, and then the second one. So just looking at the first of the fieldings. You know, that's pretty much what they want us to look at as links. And so this one, and of course, the other one, which, by the way, we can go ahead and click on it.

And that, of course, will give us here some readings, you know, of Roy Fielding. And all that they want us to do in this case is pretty much in the-- you know, do some readings, and, of course, do some search about RESTful work services, and look at the RESTful management services for WebLogic hypermedia based.

And then, of course, you know, the benefits of having a single root URL. That's pretty much the discussion. So through reading, you pretty much can get-- of the two links, you can get all the answers to these. And that's what they want us to do in this practice, which by the way, happened to be optional, like I mentioned. Don't do this unless, of course, you're done with all the labs, you know, that we asked you to do related all the different lectures. Thank you.

## Skill Check: Creating RESTful Clients in Java - Score 80% or higher to pass

Skill Check: Creating RESTful Clients in Java

View Skill Check
