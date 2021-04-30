# 6: Implementing SOAP Services by Using JAX-WS

1. Implementing SOAP Services by Using JAX-WS - 25m
2. Practice 6-1: Exposing an Enterprise Java Bean as a JAX-WS Service - 21m
3. Practice 6-2: Testing the JAX-WS Service - 6m
4. Practice 6-3: Creating a JAX-WS Client - 9m
5. Skill Check: Implementing SOAP Services by using JAX-WS - Score 80% or higher to pass

## 1. Implementing SOAP Services by Using JAX-WS - 25m

Let's take a look at the ways of implementing SOAP web services with the use of JAX-WS API. In this chapter, we're looking at a SOAP service structure. We're also looking at the ways in which we could support the mapping of the SOAP service artifacts to Java code using JAX-WS API. And of course, the ways of writing clients that invoke such services as well.

Let's start with the web services and their use of the SOAP protocol. The purpose of SOAP web services is to create interoperable platform independent mechanism for exchanging information calls between systems. The systems themselves might not be written in Java. They might be written in whatever programming language. That's not the point. Of course, we can write them in Java.

The point of the services is to standardize such exchanges regardless of which programming language is used to implement a service or the client. To achieve that, SOAP service has to rely upon strict standardization of a service interface and a transport protocol that is used to communicate messages. The underpinning transport could be anything, really. Typically it could be HTTP, but doesn't have to be. There might be other transport protocols.

But the structure of the message that you put on to that transport is strictly standardized by the SOAP services standard. So the message will contain a SOAP envelope, which is an XML wrapper, an element that wraps around the rest of the message code. It may contain a number of headers, message body.

Message body can contain whatever content you want to send, or maybe faults if you want to report some kind of error. And optionally, the message could come with attachments. So if you want to attach additional documents to it. Well, mostly I suppose you will be transporting the content of the message within the body.

Now, the program that is sending messages, calling such services, is known as a service consumer. The program that processes messages, returns some other messages back, and handling the service calls is called service implementation. So consumer via whatever transfer protocol produces SOAP managers. Service producer having an implementation of service behind the scenes will process such messages.

Now, there might be different interaction patterns associated with SOAP services. Practically, I'd say two main types, synchronous versus asynchronous, although there are some types within asynchronous message deliveries as well.

Synchronous delivery means that you send in a request towards a service and expect the service to return you either some output or fault. So that's the interaction. In this case, consumer will be blocked for the duration of the call. Consumer is going to send a request and wait for either output or fault to be returned. The alternative is asynchronous interaction. In that case, a service defines an operation that has input, but does not have an output or fault elements to it.

So we could be just one way, shoot and forget type of interaction where your consumer sends the request to the SOAP service and that's it. Just not expecting anything back. Fine.

However, there is a possibility of implementing a two-way SOAP interaction with asynchronous style where the second operation is used to perform a callback. So in a sense, consumer in this case is also a service because it can receive the call, not just send the call. And the idea of a callback is that it's a brand new request. Technically speaking from the protocol point of view, it's not really a response. It's just another request.

But that request can logically be treated as if it's a response to the previously received request. The idea is that you could put an identity of the request in this first call right here. When you are sending the request. You could associate this request with a header called WS addressing header. Specifically the part that deals with correlation ID.

Then you also put another header, which is a callback address. The callback address identifies where to send that call to, the call back to, where it should go. And correlation ID simply can be copied from the request there to the request here.

So this consumer, when it receives that request, looks into it and says, what is the correlation ID value? And matches it to the correlation ID that it has used to send the initial request. And that's how it ties them together. They are otherwise two completely independent calls. But they may be tied together into a pair with the correlation ID identity for the request.

SOAP services must be described with the Web Services Description Language documents, WSDL files. They're XML base descriptors of services. They also use XML Schema Definition files, XSD files, to describe data types and data structures that services use to formulate messages, send and receive content.

A WSDL file, first thing it does, it imports previously defined schema. So it says I'm going to use that collection of XML types, elements, described in a schema. Then the WSDL file will use the schema elements in messages that it defines. Messages are going to be used by operations, and then these operations will be available for you to invoke.

A WSDL file is structured into two parts called abstract and concrete WSDL. They're no different files. It's still the same file, but it's logically two parts to that file. An abstract WSDL describes what the messages are, what the operations are, how the operations are grouped together. A group of operations is called port type, and it's logical group of operations. So how they're grouped together.

A concrete WSDL describes the way in which you deploy that service with regards to specific transport protocol, which transport are you going to use and whereabouts you're going to deploy that service. So the abstract part describes general capabilities of the service. Concrete part describes physical deployment of that service.

First let's start with the schema definition file. XML Schema Definitions are describing data structures you'd like to use in your application, specifically in this case for SOAP services. So this is the schema that describes some kind of product with ID and quantity. To map this XML Schema document to Java code, we use the API called JAXB, Java Architecture for XML Binding, which is covered by Appendix E. So more information on that in Appendix E, how exactly these mappings work.

However, the basic example is straight ahead present on this PowerPoint. As you can see, we're mapping here XML root element product. There you go. So there you go. We map that Java class product to that schema. But there is more to it, which is why we have a separate appendix. So we're going to take a look at other cases of these mappings.

But suppose this is where you start. When you're thinking about what sort of data would you like your web services to process, you need to describe the data in XML and map it to your Java code. Once again, why do you need to describe the data in XML?

Because your invoker of a service is not necessarily written in Java. It might use whatever other programming language, so what does it know about Java classes? Nothing. The only way you can tell them what you expect them to send, what you expect them to handle in return values, is by describing your data structures in XML.

Now, the next important concept that you need to be comfortable with is a concept of an XML namespace. You see, you have to control the uniqueness of XML element names, and the uniqueness of an XML element name is controlled with the help of namespace concept. When you describe a WSDL, a schema, whatever XML document, you have this ability to describe a target namespace for this document. There it is.

Can we just go back one page? Target namespace for a schema. Notice that? There you go.

This namespace, it looks like a URL. But trust me, it's not. It is an arbitrary text label. Why does it look like a URL? The only reason why it would look like a URL is because this is the way to guarantee its universal uniqueness. An internet domain name is unique in the first place.

So for example, if I work for Oracle, I choose to use Oracle.com as my domain. And then presumably within the company, you should be able to agree upon some kind of naming convention. So demos product code. Whatever is the naming convention adopted inside your company.

Bottom line. For every type of XML document you're using, like schema, WSDL, whatever, whatever type of document, you have to come up with a unique namespace that identifies that document. So that's a unique identifier of that schema. And that's a unique identifier of some WSDL file.

Notice I'm importing the schema file here. So I'm importing product quote XSD. And I'm saying that this product quote has this namespace. If you remember, that was the URL-- well, URL, text label-- for the namespace that we use in that schema.

Can then associate the namespace with a prefix. The prefix is absolutely arbitrary. You don't have to call it anything in particular. Call it NS1, whatever, as in namespace one, two, three. Whatever. The name is not significant.

So any element in this document that will have a prefix on NS1 will be coming from that schema. That's how you refer to them. Or I don't know, anything described in this document with that namespace will be prefixed by the words TNS.

Here's another example for you. Look, this is a schema language. This one is a schema language. The language with which you describe XML schemas, and you see the prefix is XSD. Well, there you go. That means you're talking about element, import or element schema that comes from that schema language.

Why is that important? You could have defined an element called schema in your schema. How do you tell your element schema from the element schema of a schema language? By its prefix. And prefix is associated with unique namespace.

So all of these different prefixes-- SOAP, whatever-- they're all coming from relevant namespaces. Well, now we have some elements that are not prefixed. Definitions element. Types element. Well, why they are not prefixed? It's because the namespace of the WSDL is associated with XMLNS.

Not XMLNS calling something. Just XMLNS. And that's a default namespace. So that says any element that doesn't have an explicit prefix in front of it is from that namespace. There you go. So they're not real URLs. They're just identifiers of namespaces.

Let's take a further look. So we've imported some schemas. That was done in the types element. And we continue with the WSDL file. This time we're looking at messages. A message uses contents from the schema-- NS1, remember that's a schema prefix.

So imagine in my schema file I described an element called product. I described an element called quote. I described an element called quote error. And now I would like to use these as messages that I will send and receive as part of my input, output, or fault of whatever web service operation. Same XML schema may be used by different services, and that's why a service can describe the way in which schema elements are used by placing them in the context of messages.

Messages are inputs, outputs, and faults of whatever operations. Operations grouped together into port types. There you go. There's a group of operations. And that concludes the abstract part of the WSDL. We proceed to concrete WSDL part. We're talking about deploying that port type on top of a specific transport protocol. So that port type deployed on top of SOAP HTTP.

We're saying how exactly we would like the mappings to the SOAP HTTP protocol be handled. In this particular case, we're saying Document style. There are two styles, called Document and there's another style called RPC. A slightly different style of wrapping up parameters. RPC is a legacy style. You're supposed to use it for backward compatibility with older style services. These days, Document style is recommended, which basically transmits the message as is in the body of the SOAP packet.

So transmitting messages. Oh, and this part defines whereabouts the service is deployed. Location, which URL the service is deployed at. So hopefully this set of pages should have helped you get around WSDLs and schema files.

Now, how do you design a Java SOAP service? You may start with WSDLs and schemas, define interface, and then create Java classes that are mapped to these WSDLs and schemas. Or you may do it the other way around. Start by creating Java classes, put some annotations on them, and produce WSDLs and schemas. So the first approach is called top down. The latter is called bottom up.

I would personally normally recommend using top down. Bottom up approach, implementation first approach, might be quicker to develop because you just say this is classed as a web service. That's it. Generate me a WSDL. And it will generate you a WSDL.

But the quality of that WSDL and schema is anybody's guess. And ultimately, that WSDL and schema is what you will expose your service as to the rest of the world. You probably want to have a clean, nicely designed top down interface there where you first thought of how the web service will be visible to the rest of the world, and then you figure out how to map it to your Java code rather than your WSDL and schemas will be a product of an accident than a design in a bottom up approach. But it depends. I mean, bottom up is certainly quicker to develop.

To map the Java code to WSDL file, you may start by mapping an interface. And in the interface here-- I see the annotation and web service. And I hope you're now getting the idea of what's going on, because we're telling what namespace is going to use. That's basically mapping it to specific WSDL namespace.

Describing what SOAP bindings we'll be using. It's document bare style. This "see also XML factory," this is annotation used by JAXB mapper API. It's because we're using JAXB behind the scenes to map XML to Java. So it's a helper class for that JAXB, Java XML conversions. It's auto-generated. You're not writing this one. It's automatic.

And then you just control how methods are going to be mapped to WSDL artifacts. So web methods, what sort of result is produced in its response, what sort of request it will accept, its web parameters. So these are the bits that map parts of the Java code to the bits in a WSDL file, specifically the inputs and outputs of a particular operation. Operation is "get quote."

Now the implementation class. The implementation class could say this is a web service. Describe which end point interface it implements. Might be slightly odd. Do you see, normally you'd write the code that says class, blah, blah, blah, implements interface.

But in this case, you're saying end point interface is this or that class. You're qualifying it as an attribute of web service annotation. And you're describing here the namespace and the WSDL file location, whereabouts they are and what type of binding would you like to use. And basically, this operation is indeed an implementation behind-- can we go to previous page-- behind that operation.

And that "get quote" defines the mapping for it as just an interface really. And then in this case "get quote" contains a real body, whatever logic you want to put inside that piece of code. Well, what it is that your web service operation is supposed to be doing.

Now, what about the client? This is the Java client that can invoke such service using the annotation WebServiceClient. Map into the very same WSDL file. WSDL file location. And representing a service side piece of code on a client with this web end point. It allows us to propagate the call from the client to the server's specific operation. In this case, some service called PriceQuote which we'd like to invoke.

If you want to invoke, make an actual call, create priceQuotePort, get a port. Web service port. Form a document. In this particular case, a product. Presumably that product is mapped via JAXB to an XML schema that that service is using. That's what you're going to send as your object.

And pass it on to the "get quote" operation. And well, whatever result it returns, some quote result. There you go. Catch exceptions, if any. The exceptions are basically conversions of your SOAP faults to Java exceptions.

In Java EE, it's slightly more simple because you could use this annotation called Web Service Ref which basically just defines the reference to the service, and just do the direct injection of a service into this particular bean. So in this case, we have a stateless session bean calling a web service. There you go. The rest of the logic is the same as Java SE client. This is just the way you inject. That's automated by the container.

That's it. So there are two things that we covered in this chapter. First, we went through the structure of the web service interface. We're trying to understand how service is presented to the rest of the world with WSDLs and schema files. In a very simplistic case, all you need to do is just say "app web service," and it will generate you WSDLs and schemas out of a class. You could take that approach.

Of course, if you want to have more control over how exactly your Java classes map to WSDLs and schemas, you will have to use all of these other annotations. Web method to designate which operation is mapped to WSDL, web results to designate how return type of operation is mapped, web param to designate how parameters are mapped. And control the way Java code is mapped to WSDLs and schemas.

In a practical exercise, you will be creating a web service called Price Quote which basically goes into same product database and returns quotes for products. And then consume that from the client. Write a Java client that will call that service.

## 2. Practice 6-1: Exposing an Enterprise Java Bean as a JAX-WS Service - 21m

Let's take a look at exercises for Lesson 6. In Lesson 6 practices, we are creating a price quote SOAP service that would be implemented as an exposure of a session-- Enterprise JavaBean as a web service. We then will test this particular web service with the WebLogic testing tool. So it's provided as an online building, testing facility for web services.

But also, we'll build an actual Java client that will invoke the price quote service, using JAX-WS API. So additional Enterprise JavaBean price quote-- Enterprise Java Bean to be exposed as price quote service. Let's start with Practice 6, part 1, where first we just study the WSDLs and schema files that we'll use in this exercise.

There are two files. There's price quote schema and price quote WSDL, both located at Home Oracle Labs Resources folder. So before we'll create a service with these files, the practice suggests we should just take a quick look at what these files represent. You don't need to write that code. It's already written for you. But just understand that this schema describes an element called Products.

Let me ask you-- do you know what? Let me open it in that beans for you. So I'll close all existing files for now. And we'll just open the file-- Open File. And I'll go to the Home Oracle Labs Resources folder. And we'll start by opening these Quote schema and WSDL files. I will not add them to the project or anything-- just to look at them.

So let's start with a schema. So we describe here an element called Products. And it contains a product ID. And also, this schema contains another element, which is called Quote. And that contains quoted price. And there's another one called Quote Error. And it just contains a message.

It's a very simple schema. Obviously, your elements here could be more sophisticated. But just understand the principle of how the web services work to do the exercise. That should suffice. So this scheme is then imported into the WSDL file. There it is.

And let's check the target namespace for this schema. It's this one-- PriceQuote. And we'll look into the WSDL file. That namespace is associated with a prefix, ns1. So any element that has a prefix ns1 will be, basically, coming from that schema. We define messages called QuoteRequest, QuoteResponse, and QuoteFault using Product Quote and Quote Error.

So that will contain-- remember-- product ID. That will contain price. And that will contain an error message. So these are three messages of ours. Now, we describe a port type and a Get Quote operation, which uses these messages-- QuoteRequest, QuoteResponse, and QuoteFault-- as input-output and fault parts of that operation. This concludes the abstract part of the WSDL.

And now, the concrete part of the WSDL will describe SOAP binding here as an HTTP document-style binding, further operation-- Get Quote. And we just, basically, use these Request, Response, and QuoteFault messages to pass around that operation. And eventually, we'll be deploying that service at this particular URL.

So this is just a preparatory part. You can close these files now. And all of that code, with brief explanations, is present in your activity guide, just for you to be comfortable with how the schemas are imported, what's an abstract WSDL, what's in a concrete WSDL, how the whole thing is held together. So that's your first chunk of the practice.

At that stage, you actually start creating a web service, using this WSDLs and schemas. So in the product app, EGBProject, you need to launch the wizard to create a web service from WSDL. Make sure you select the correct project, ProductApp.ejb. Go File New-- find Web Services. There you go. And you need to create a web service from WSDL file. Click Next.

Now, on this next page, we need to form appropriate service details and pick up that WSDL file of ours. So the details are-- let's call this PriceQuoteService. It's a name like any other. Why not? So PriceQuoteService will be the service name. Current project-- ProductApp.ejb. The package-- let's do it as DemosModel.ws. Why not?

OK, now we need to select the WSDL file, which is the one we've just observed a moment ago. So that will be PriceQuoteService WSDL. Browse and select that file. It should be under Home-- Oracle-- Labs-- Resources-- PriceQuoteService WSDL. Open the file. It then parses the file. It may take a moment to parse it.

Picks up the port-- PriceQuote port. There you go. Anything else you need to do in this dialog? Not really. Just click Finish. And a new service will be created with exactly the mappings to the WSDL and schema that you observed just a moment ago. OK, so click Finish.

The wizard created us a stateless session bean. There you go-- stateless session bean, called PriceQuoteService. And it happens to be mapped as a web service. And these are annotations mapping it to the relevant and endpoint interface, to the relevant namespaces, to that WSDL file that we just picked up. It has been copied to that WSDL file, into our project now.

And we have the presentation of a Get Quote method, which works with product and returns us Quote objects, which-- remember-- mapped to the XML schema elements-- oh yes-- and potentially fault, that it could throw as an exception. Now, what do we need to do next?

There is some extra code, like JAX artifacts, not that you really need to work with them at this stage. But you can just check them out here. So classes such as ProductQuote and QuoteError. And you may find them under the generated sources in this project. So there it is.

You've got these additional classes. So if you want to see, for example, how product class is mapped, these are JAXB mappings that were generated for you-- RootElement, Products-- well, as you would imagine. So that's optional. You don't need to modify that class in any way. So that's fine.

Right-- now what we need to do is prepare a PriceQuoteService stateless session bean to host some web service logic. So what we need to do is open the PriceQuoteService class, if it's not yet opened, and then click on a Source tab, so we could start editing the code. PriceQuoteService class-- if it's not yet opened-- well, it is. So we could just proceed, editing that. Just in case, if it opened in Design mode, you could always flip to Source mode.

Start by adding a static logger to this class. Add in the logger. Make sure that we have correct imports format and account. So logger has been added. What next? Inject the ProductFacade bean. We would not want to repeat any business logic that we've coded so far. So that ProductFacade has already encapsulated necessary business methods. We could just use them over and over again, from whichever other beans we like.

Make sure you do half correct imports of ProductFacade as well and format the code. So we're ready to use that. Now, we need to-- just to make code more readable, really-- remove package prefixes in front of QuoteProduct and QuoteFault elements in these files. So you've noticed here, yeah, these are the package prefixes.

The code will just get a little bit more readable. And it will be easier for you to write further manipulations with that code. Obviously, because at this stage we're missing imports, we need to fix these imports. There you go-- fixed-- so making it more convenient for us to operate on further coding.

Implement the PriceQuote functionality in the Get Quote method. Currently, this unsupported exception being thrown from method-- we're going to remove it. Instead, what we need to do is add a Try block, followed by a couple of Catch blocks. First one of these catches should look for QuoteFault. The second catch should handle all other exceptions. So one catch catching QuoteFault. Second one-- any other exceptions.

Now, when we handle these other exceptions, whatever they are, whatever other exception may occur, we'll wrap it up into the QuoteError object and throw it out. OK, so depending on what happened here, we catch QuoteFault or we wrap it up into custom exception object. So that's that code here, inside a Get Quote method.

Fix import statements-- format the code. Further, code will be added inside a Try block to implement actual logic of the service. So it's still to come. Now, at this stage, we expect the Get Quote method to be declared to throw the QuoteFault. Let's just check that. Is that the case? Yes, it is. It throws the QuoteFault.

And that's why, no matter what goes wrong inside this particular method, in order to report it to our web service client, we ought to keep throwing same exception type. So whatever other faults we may have, we have to wrap them up and, eventually, throw out the QuoteFault, if we want to throw it out of this method.

If it was a straight-ahead go QuoteFault, we could just re-throw it as-is. If it's any other error, produce a new QuoteFault with a QuoteError message inside and throw it. Because that's the only type of fault mapped by our WSDL file for a JAXB to an XML message that a client would receive. So that's why these two catches are required.

Now, what about the actual logic of the method within a Try block? So let's get out of the current request some product IDs. OK, so we have this request-- products here. And in a Try block, we will retrieve some product IDs. Make sure you import Java Util List. Format the code. So there you go.

Once we retrieve that list, we need to check if that product list is empty or not-- is empty or not. So format the code again. Just before we proceed any further, a quick reminder-- just a really quick reminder about that product's request element. If you look at that product request element, what it can contain is a list of integers.

It could be more than one product ID. That's how the schema described it, with potentially more than one product ID. So that's precisely what we're trying to handle at this stage. We're trying to handle this collection of product IDs. And if we're getting no product IDs in that input, if that is empty, let us suppose we need to produce some kind of error, saying to the invoker, could you please provide at least one product ID?

OK, so there you go. Reformat the code. Now, obviously, if you throw that QuoteError, what's going to happen here is that-- QuoteError is just an error message. The exception is QuoteFault. So you a throw a QuoteFault and then that will be caught right here. You'll log that into the Log file and then re-throw it to your invoker. So the invoker will receive it as an XML message. OK, so we produce the QuoteFault if no products were sent to us

After the If block, if product IDs were available-- so we received some product IDs-- we pass them on to the ProductFacade bean-- a method called FindTotal. Let's remind ourselves what a FindTotal method was doing. Let's take a look at that method. Method FindTotal executed a named query called ProductFindTotal. Mm.

And what the named query was doing is expecting us to pass the list of product IDs and return, from the query, a counter of how many products we've managed to find, and assume product price. That's the query we're executing at this stage. So ProductFacade already provides a method to do it. We just invoke it from our quote service once we acquired the list of product IDs from the caller who propagated that call.

Good-- so next we need to extract the first value from the object array, as that is our number of products. Count, here, the number of products we found. That's the first value. Second value-- remember-- is the overall total. Now, what could happen with this number of products?

It could be that we found products in a quantity that is less than a size of the list of product IDs. In other words, some of the product IDs were never found. That's potentially what could happen, right? In which case, throw the QuoteFault saying that error pricing quote. And the error message will be, unable to locate some of the products. And then just [? echo ?] the list of products IDs.

So we figure out, by running that query, we didn't really get all the products that we should have had in that database. So that's one possibility. However, if we manage to find all the products specified in that list-- so everything is fine-- what we could do is produce a new quote. And that's the second value from that array, which is the total price.

You wrap it up into the new quote element. And you return it to the caller. This is, kind of, a happy execution scenario where everything is fine. Make sure you reported back BigDecimal, formatted the code. That's it. So overall, what this algorithm does is that it gets the product subject, which is containing the list of products IDs; checking if anything is [INAUDIBLE], and giving us an error if it's not; running the query; checking if all products are found; giving us an error, if that wasn't the case; and then, if everything's fine, returning us a quoted price.

OK, at this stage, we can rebuild that project. And then, right-click on a Product app to deploy that project. So first, make sure it correctly compiles. Clean and rebuild everything. And then, once that's done, go to the prototype and redeploy it again.

So now, we have our web service in place. That particular bean is ready to be used. It is exposed as a web service. And our next exercise part, we will actually perform some tests.

## 3. Practice 6-2: Testing the JAX-WS Service - 6m

Now let's take a look at practice six, part two, in which we'll test our web service.

To perform the test, you can simply open this browser testing tool available as part of the WebLogic server. Just let's go to browser, yeah? You can open a new tab. Open the testing tool. OK, just wait here for it to initialize.

The testing tool will require us to pass in here a WSDL file, OK? So let's take a WSDL file and pass it into this field. OK, click on Test. So this WSDL file is obviously the WSDL file under which the web service that you created in previous exercise has been published.

So you could see that it contains here this getQuote operation. And that's precisely what we're going to do next. What we need to do is select this getQuote operation and then produce some kind of an input with product IDs-- a list of product IDs. So select getQuote operation. Specify product IDs.

Now the exercise here suggests to specify product one and three. Well, why not? Yeah? So let's specify products one and three.

Take a look at the raw message. This is basically the SOAP envelope you are going to be sending to that server, yeah? So just for your information, this is what will go to the server as a product message.

OK, so you're ready to call it. Click the Invoke button, all right? Now, because I've made my fonts bigger, I have to scroll to get to it. There's one Invoke button right there at the bottom of the screen. Just scroll to that part and click on that Invoke.

Now what's happening here-- we're getting this message. Again, I might have to scroll a little bit to see it better. This is a request we sent to the server. And as a response we got back from the server, we got some quoted price. Well, specifically what quoted price you'll get depends on the prices of products in your database at the moment, yeah-- so whatever they are, yeah? But it's always a total of whatever you've just queried in terms of product IDs, OK? So you observe that price. It might be different for you if prices of products in your table are different at the moment.

Now, let's create an incorrect value for the product ID. The product ID number, 42, does not exist. And test it again.

So let's go back. Scroll up, OK? You can just change one of the product IDs to 42. You could just type it here, OK? And then what you want to do is just test it again, OK?

So I scroll to find Invoke button. Make the invocation. And let's take a look that we now have a SOAP fold. Lovely.

So that's the request we've sent. And that's the response we've got back-- "Unable to locate some of these products." OK, so-- nice.

Right. So you could keep testing that. The other test I suppose we could do is just destroy all products [CHUCKLES] in that list, yeah? Pass on a completely empty list and see what will happen.

OK, so let's go back to the browser. Scroll up to the message. Clear all the products from the list. So obviously, that will lead to an error as well. But it will be a slightly different error, yeah? So let's just get to the Invoke button again. And then let's take a look at what error we got.

Now we've got-- yeah-- "Provide at least one product ID to get a quote." Fair enough. So either some of the product is not found or we just haven't provided any products. Whichever way, we'll get these quote folds. Or else if everything is fine and we provide valid product IDs, we'll get back our quote.

So that's that for the simple test that we've performed through the WebLogic server provided web services testing tool. In the next practice we're going to write the actual Java client to invoke, and again, test that service.

## 4. Practice 6-3: Creating a JAX-WS Client - 9m

Now let's take a look at the Practice 6 Part 3. In this Practice, we need to create a JAX-WS client to invoke a web service. To achieve that, we need to create a new project that will contain that client's code. So you go to NetBeans and you create a new project.

So this would be what kind of project? Just a Java application, normal client application. We'll call this project PriceQuoteClient. And it will be in home/labs/projects folder. OK, so normal Java application, PriceQuoteClient, make sure it's in the projects folder.

What about the main class? Well, demos.client.PriceQuoteClient will be the name of the main class, which will run this client tests. That's it. That creates a new Java application project to be used as our client for price quote service.

Once the project is created, then we need to select this new PriceQuoteClient project. And in that project, launch the Web Services Client Wizard under Web Services, Web Services Client Wizard. So make sure you select PriceQuoteClient, File, New File. Go to Web Services section. And you need to launch the Web Service Client Wizard. Click next.

OK, so, in this dialogue, we need to set following properties. We will build our client based on the existing WSDL URL, because we already have the service. We can just build a client to represent it.

The package will be demos.client.ws. And that would be the WSDL URL. So set up the URL here. Set up the package, demos.client.ws, so that's what we need to do.

And also, tick these boxes called Generate Dispatch Code, which will basically create a code that will send necessary messages from the client to the server and dispatch the communications to the corresponding service. So there you go, generate the code, and Finish.

OK, so we created here some client artifacts that were generated for us. Next, the wizard has generated supporting classes-- Products, Quote, QuoteError. These are mapped to JAX XML types. And it also generated code to represent PriceQuoteService quote surface itself and getQuote operation, through which we can call the remote service.

Now, let's open the priceQuote client, that's a part of the demos.client package, and add to it a logger. OK, so PriceQuoteClient, that's it. It's already open. Let's just add here a logger, sort out your java.util.logging.Logger import, format the code. That's fine.

Next, add a try catch block to this main method of a priceQuote client. What need to you need to do is basically catch QuoteFault, or, potentially, maybe other exceptions, if you fail to call the service at all, for example. So try block, catch relevant exceptions. That's in the main method right here. And make sure you sort out the imports, java.util.logging.QuoteFault, and align the code.

Of course, we're not yet invoking that PriceQuoteService, but we will in a moment, so there will be an opportunity for us to actually get that QuoteFault. Now, let's call the service. To invoke the PriceQuoteService, we need to invoke this PriceQuoteService object, instantiate that first. So PriceQuoteService object has been generated for us by the wizard that we've run to create a new Web Service client, so that's generated this object. Let's just take a quick look at that, if you like.

Let's go to declaration here. So it basically contains here the URL towards which-- with which it points towards the Web Service, and contains the annotations to map it as a Web Service client for a given WSDL location, and the capabilities to propagate the call to the corresponding service with an endpoint called priceQuote port. So that's the one that will contain the method getQuote eventually.

All right, so we've instantiated that PriceQuoteService component. Now let's add that priceQuote port to the code. So out of that PriceQuoteService, we get a relevant port. That contains the getQuote method we're about to call, so we'll add that to our application. Make sure you are doing a correct import with that.

And, of course, you need to form that list of products that you're about to send to the server, same products as we've used in a previous exercise. Again, make sure you've got to correct import. And import the list as well, java.until.List, and format the code. It's the same products, product 1 and 3, as we were using to test the service in a previous lab.

So now, let's just make the call. We have that QuoteRequest object that contains a list of product IDs. We have the quote port that contains the method getQuote. All that's left for us to do is make the invocation, import the quote, which is the response that we're getting from the service, and handle that response.

So how do we handle it? Well, I guess we just print out the price. For a simple Java client, that will do. So, that's it. We can run it.

If there will be a problem with that quote, we'll get some faults. If everything will be fine, everything will be fine. Recompile, make sure you've got a clean build.

And if everything compiles successfully, just run that file. That's it. You should get the quote back from the server. The actual value of the quote may differ if you've got different prices in your table at the moment.

If you want to rig it to fail like you did with a previous exercise, remember, we're passing wrong product IDs. That's fine. Try that out, see what will happen. So obviously you'll get some message here, unable to locate products.

Same will happen if you pass an empty list of products. You'll get a slightly different message. You can play around with that, but that's generally it. So we have created a client that's capable of invoking our web service. That's it.

## 5. Skill Check: Implementing SOAP Services by using JAX-WS - Score 80% or higher to pass

Skill Check: Implementing SOAP Services by using JAX-WS

View Skill Check
