# 4: SOAP Web Services: Overview

   * SOAP Web Services: Overview: Part 1 7m
   * SOAP Web Services: Overview: Part 2 26m
   * SOAP Web Services: Overview:Part 3 13m
   * SOAP Web Services: Overview: Part 4 6m
   * Practice 4-1: Revisiting the Calculator Web Service 7m
   * Practice 4-2: Configuring WebLogic for WS-* Web Services 5m
   * Practice 4-3: Exploring SOAP and WSDL Documents with WS-* Extensions 6m
   * Skill Check: SOAP Web Services: Overview - Score 80% or higher to pass

## SOAP Web Services: Overview: Part 1 7m

OK. Good morning, everybody. Let's go back and continue with our lecture. And in the morning, we're going to start with SOAP web services overview. But before that, we just want to take a look at what we've done yesterday.

Yesterday, we went through the concept of web services at the beginning, where we discussed that there is an interaction right now. And I put a diagram on the board, which, by the way, I'm showing here an example of it, and where we said if you have an existing enterprise application and you want an outside system to, of course, interact with your application, we said that we do have different technologies that actually handle that communication, which is RMI and Corba IIOP and dot networking and so forth. But we said it would be nice to introduce that interoperability through web services.

And we said through web services, we can have a web service client that can interact, in this case, through an application either on the web tier or on the enterprise tier. It would be either through a JAX-WS servlet if it is a SOAP message, or a JAX-RS servlet if it is a REST message. You can also do the same thing by having the client in this case communicating with a JAX-WS stateless session bean or a singleton session bean on the EJB tier. Or, a JAX-RS stateless session bean or a JAX-RS singleton session bean on the EJB tier.

And we said that these web services are interoperable. And the two main web services that exist, we said that they are REST web services and SOAP web services. And then after that, we got into the concept of XML. We, again, understand-- we kind of did the review of the XML structure and the XML syntax and the XML rules and the schema and the, of course, rules on how to write schema, and so forth.

Then after that, we got into the concept of web services processing and API. And that was JAXB. JAXB, which we said, by the way-- and let me just go back to the board. And we said that this JAXB API is actually used in both cases by the JAX-WS web services and the JAX-RS web services underneath the hood. What we've done is we just opened that JAX-WS API, and we looked what's inside it. We found out that JAXB API makes use of a JAXB context, which by the way, through it, we can go ahead and create a marshaller and unmarshaller. That's what we have done.

And then of course we looked at examples how we use an unmarshaller that actually reads an XML file and converts that into Java classes. And, of course, a marshaller that takes a bunch of Java classes and outputs an XML file, in this case. We've seen that. And then of course after that, we found out that this JAX-WS-- or rather JAXB, has now a new feature which is really quite useful.

And that's the concept of what we call annotations. And we've seen a bunch of annotations. Just as an example, what would be the annotation that you put on the class that you want it to be converting into XML. That was @XmlRootElement, if you remember. And then we've seen a few of them, if you remember. So we've seen many of these. And I can show you these also on the API. If you remember, we also discussed the concept of the JAXB context, which we said that this JAXB context class provides the client's entry point to the JAXB API. And pretty much it provides that abstraction for managing the XML Java binding information necessary to implement your JAXB binding framework operations through the marshal and unmarshal and validate and so forth.

And we said that it has a bunch of methods. And this is the createMarshaller that allows you to create a marshaller. And then of course, it a createUnmarshaller that allows you to create an unmarshaller. And we also said that an Unmarshaller itself was an interface that has of course methods that can be applied. If you remember, we used over there the method unmarshal that we've seen. And as you see here, it's overloaded.

And of course, you can go ahead and look at the marshaller also, which is, by the way, an interface that has a bunch of methods that you can use. And here's also you see the Marshaller method that is overloaded in this case a few times. So we can go ahead and get into every one of them, and we can of course read the definition of every one of them.

So like I mentioned yesterday, the API is really quite useful. And the API is really a very, very friendly type of a mechanism by which we can, of course, we use it to, of course, in this case, understand some of the features or some of the new APIs for web services.

We also looked at the XmlRootElement as an example. We can go ahead and look at in fact the whole package. And in the whole package here, you will see that we have lots of annotations that actually the JAXB can use. And these are the annotation types. If you remember, we've seen some of these. For example, we've seen the @XmlRootElement. That's as an example. And we've seen also another example about the @XmlType and @XmlValue and so forth. So all of these you can go ahead and look at them, and see pretty much every one of them and the definition of every one of them.

This is why we said the API is very, very useful, because it helps us in fact read some of the new APIs that are created and understand what they do for us. And so that's pretty much what we have covered in the JAXB. Plus, in addition, we covered also the concept of how to customize the binding using JAXB for that. You remember we've seen how if you want to customize the name of a class, instead of having it a Person type, we wanted to call it Person. And we've seen an example about that. So that's what we've done yesterday.

## SOAP Web Services: Overview: Part 2 26m

OK, let's go ahead now and take a look at the SOAP Web Services overview. In this lesson, we're going to look at the basic structure of the SOAP, which is the Simple Object Access Protocol message, and how it is encapsulated by the transport protocol, and of course explain how the WSDL file defines a web service, including its message representation, transport mechanism, and so forth, and of course, look at the purpose of the WS-I Basic Profile and the WS-I policy, which is really quite useful. And we'll take a look at that.

So of course, reasons for using SOAP-- why is it that we wanted to use SOAP? Well, SOAP web service specification really sets out how to define the interoperability, the platform-independency, and of course the interaction of these web services.

So web services are very, very useful when they are standard so that different environments can talk to each other and do business with each other. So the SOAP web service requirement, of course, include that decoupling of the message representation from the transport mechanism-- we'll see again how actually this is done-- and of course, support your extensible framework. And we'll take a look at these-- how we can handle this extensible framework through the policies.

Now how does a SOAP message look? Well, a SOAP message looks pretty much similar to the diagram that we see here on this slide. And if we take a look at this, you will see that there's something interesting about this SOAP message adjustment.

You see that we have a SOAP body, we have a SOAP header, and then they're all encapsulated inside an envelope, which is encapsulated in the SOAP area part, in addition to the attachment, which is all encapsulated in an envelope of new SOAP message, and of course after that, encapsulated inside a communication protocol envelope, in this case, which could be HTTP or SMTP and so forth.

Just by looking at this structure, something that comes to our mind just like that and flashes in our mind, it shows that this SOAP message somehow is what? Is made of many different layers.

So it's like an onion layers, which means this actually can call for a little bit of trouble from where? From the performance point of view, right? Because to be able to build a SOAP manage takes time and to be able to pass a SOAP message, it takes a little bit of time.

In addition, later on when we get into security, also we are going to see that if, for example, you want to secure the SOAP message, especially on the message, there's a little bit of work that has to be done over there too. And we, by the way, found a mechanism by which we can alleviate the headaches of the performance when we secure the SOAP message itself. We'll talk about that later on.

Moving along in this lesson, look. Here's an example where, in this case, we see an example of a SOAP message that uses what? Over HTTP, in this case, transport protocol. So if we take a look here, you will see I do have an attachment, which by the way could be a GIF image or whatever.

And then here, I have my SOAP envelope. This SOAP envelope that you see here is, again, made of you have a SOAP envelope body, and inside you have a bunch of operations and so forth. So we did not show the whole thing.

But then on the top of that, you will see now the HTTP header. The HTTP header pretty much represents some of the attribute pairs to, again, represent in this case maybe the content type, maybe the boundary, maybe the text type, and so forth.

So if we now wanted to see an example of a SOAP request, which by the way, makes use of the HTTP transport protocol, you would see that here's our SOAP envelope. That's my SOAP envelope, which by the way, in this case, is on the top, as always, the XML naming space, which represents the envelope, in this case, URI.

And then, of course, we do have, in this case, a header, which happens to be an empty tag, as you see here. There's nothing in it. And then on the top of that, we have, in this case, a body. In the body, we do have a tag, in this case, get hello, represented with the XML naming space, http://ou.

And then inside, we have, in this case, an arg0 tag element represents an XML naming space, which is an empty space. And then of course, a name, which is Matt, in this case.

So most probably this is a request that we are sending with the name Matt that, as an argument, we are passing as arg0 to the operation on the web service. Now the top level here, [INAUDIBLE] adjustment, is the, in this case, HTTP part of the transport protocol.

So we have the accept, accepting the different type of area data in that get, the connection, which is keepalive, the length, the content type, the character set, of course the local host here-- we're talking to the local host with 7001, that's the WebLogic-- and then of course, the SOAP action.

In this case, which right now, it is just a an empty space, and then of course the agent here, which happens to be the Oracle JAX PC version 1.1. So this is the example of a RAW SOAP over HTTP request.

You also have another example here that we show you, again in this case a responsive. If you remember, we passed Matt to the service. Most probably it's going to return hello Matt. The method returns hell Matt on the web service.

This would be an example here where, in this case, my client would send a message through maybe the JAX.WS servlet or the JAX.WS. We see that later on, and then of course, which is picked up by a business component to return for me, in this case, a message in the response.

This message in the response happens to be within an envelope, which by the way, in this case, has an empty header. And this is, again, the request part of it, but in the response, it's going to be also within an envelope, where in this case, again represented by that XML naming space representing the URI in this case, OK, and the prefix s and the URI that you see here.

And then inside the body, I do have the get hello response element, which by the way as, in this case, inside an element called a return with the tag here, return. And it's called hello Matt, which most probably the service, it passed Matt as, in this case, an argument to the operation. And the return, in this case, value would be hello Matt, which is right here.

All right, so of course, how do we define these web service? Well, to define the web service interaction through what we call, in this case, ladies and gentleman, a WSDL file.

Now let's take a look at this WSDL file and see how actually this is a structure. We got to look at the structure of the WSDL file. It turns out, folks, that the structure of the WSDL file here has, first of all, the root tag, which happens to be called, in this case, definitions. That's the root tag.

And this would be the root of the WSDL file, which is the root WSDL element. And then in it, we have another tag called types. And types, what it does, it actually shows us what data type would be transmitted.

And by the way, just based on what we have done yesterday, ladies and gentlemen, based on that, that type could be represented within the WSDL file or could be represented where? In a file called what? The schema file, because remember the schema file is the one that defines the types. So we'll see an example about that later on.

And then we also have another tag, which is called a message tag. And that defines what exactly that exact information is expected in this case. And then of course after that, we have the port type. And the port type specifies what? What operations or functions will be supported that actually your web service supports when you talk to it.

So the port type has tendency to be mapping to what in Java in your opinion, ladies and gentlemen? Most probably, port type is mapped to what? To the Java interface or the Java class that represents the methods that are exposed as a web service operations.

And then we do have a binding tab. And the binding pretty much shows how will this message be transmitted on the wire. For those of us who have a little bit of XML, you can actually pass it as what? A document or RPC in terms of the style.

And then what SOAP specific details are there, which means now we're looking at what? The structure of the SOAP representing the data inside the SOAP. Again, that would be either as what? Literal or RPC. We'll take a look at that.

And then of course after that, we have the service tag. And the service tag, pretty much what it does, it defines the collection of ports that, of course in this case, make up the service, and where, again, is the service located, which means we're specifying, because in general, a web service always has a port, which by the way is binded to a port type. We'll see that later on.

So this is just as an example. And then of course, the next thing that we want to do here is take a look at an example of the file. If you remember, in your lab, when you have done your lab and in the first lesson when we deployed the calculator app, and then you run that using, in this case, the browser, we found out, again in this case, it was the file that you see here.

So this is an example of the WSDL file, where of course, in this case, you have the definition tag. In this case, this is the prologue with some comments. And then after that, we have the definition tag, which by the way, is the root element of your, in this case, WSDL file.

And then after that, you see now we do have a types. OK, we do have the tag types that starts here and ends here. And this tag, again, has now [INAUDIBLE] the schema tag, in this case, element, which by the way, contains your, in this case, schema file, where we can reference the schema file, which happens to be called calculatorwebservice.xsd, that you see, and the location of that, the schema location, and so forth. That's what we have over there.

So going back to the slides of the lesson, we see now we do have a definition. Then we do have, again, in this case, a bunch of XML naming spaces that we have here.

All of this is a list of a bunch of XML naming spaces related to the policy, the metadata, the SOAP, the target namespace, which is, in this case, the package where the classes would be generated, the XML schema, naming space, and the WSDL naming space, and so forth.

Then, of course, after that, you have a types elements. And then we have a message element. And we have a port type. And then we have a binding in the service. So of course, all of us, we would like to see every one of them. Let's go ahead and pick out every one of them and see what we have.

Now if you remember, in the definition, we said type means what? The type is used to represent what? What data will be transmitted, that's the idea. What type of data will be transmitted. So let's go ahead and take a look at that.

And so the type element document the XML schema for the message part. Again, that schema information can be nested or imported and so forth. So here, what we show you, in this case, it's imported, right? In the example that we've seen in the lab, it was actually that calculator web service, which by the way, is imported here. And here's the location that we have seen in here.

So in our case here for this, it is this hello service XML schema that's here. So pretty much, this make, [INAUDIBLE] HTTP get request to obtain the XML schema, in this case.

And of course, here's again an example of that sample schema that we have, which is in this case, this hello that you see here. The helloservice.xsd, this would look something similar to this, where again, in this case, we see we do have, in this case, an XML schema.

It has the port at the beginning, it has the root tag, and then the target name space here for schema, the target name space for, again in this case, the package. And then it has, of course in this case, the element get hello with type, in this case, target namespace get hello.

It has the element get response. Again, this represents a request. This one represents a response. And then we have a complex type that you see here, which again, with the name get hello, that has a sequence to be what? An element which is a arg0 in this type string.

OK, this is again Matt. You remember Matt that we passed in the SOAP request. And then we have, of course, a complex type, in this case, representing the response. So and then, of course, here we have a complex type called get hello response with the sequence, of course, which is name is returned.

And if you remember, we've seen the element return earlier in the response SOAP message. And then of course, the type is string, in this case. So this is just an example of a sample schema that you have.

And of course, earlier when we were doing the labs also, you can also discover again, in this case, some of the data that you can actually represent here. Later on, we're going to see some examples where we can see some of the schemas that, of course, represent in this case the projects that we are going to work on.

Moving along and continuing with this concept, now of course, now we looked at what? First we looked at the types, now we look at the messages. And let's take a look at the message to add. So that's the sample schema and here's the message.

So what did we say? We said the message, what it specifies is the information that you're passing. So this message element lists the parts that make up the message. Why do we say parts? Because if we are having a request, a request can have more than one part, because we can pass more than one argument to a method to an operation, in this case.

Every part corresponds to an element in the XML schema, located in the types section. And of course, all the style of SOAPs messaging did not have the one to one mapping, but right now we have.

So here's an example where, in this case, we do have a message representing the request. In this case, which may present the parameters that you are passing to the get hello. And then we do have another message presenting, in this case, the response, which happens to be, in this case, an element called the get hello response.

Then after that, after we've seen the message type, the next thing is the port type. A port type corresponds to what? To a Java class that is part of the web service pretty much. That's the mapping. It's just that interface on that Java class that you are trying to call that has, of course, public methods that play the role of a web service operations.

So here's an example where I have a port type. The name is hello. And it has an operation called get hello. It has an input-- again, in this case, pretty much the method parameter with input that represents the get hello request that you're trying to pass in the message.

And then it has the output return, which by the way will be here. The response or the value that the operation will return. Again, an operation corresponds to web service method in the Java class. In the method parameters, these are the arguments that you're passing through the method. And the method return type, which is again, in this case, the return object from the operation on the method in Java.

And then after that, we want to discuss the binding, the WSDL binding. The binding element control how a SOAP message request is structured. So now we want the structure of the SOAP message.

And it turned out here that my SOAP message is going to be what? Of style document, OK, in this case. That's the SOAP body is a document is that of an RPC. RPC has tendency to be from a B2B type, and also when you have strong typing and so forth. And then of course here, you have the style, which happens to be a document.

And of course, don't forget also that within the operation, you also have the input parameter and the output parameter. And also these have to specify also the XML data type in this case. And it happens in this case that is going to be literal, which is, again, a bunch of strings. That's what it means.

OK, so by the way, using the wrong type means that clients may not be able to construct the message for your web service. So we have to make sure that it's using the right type, in this case.

Then after that, we have the service element. The service element controls what? What URLs your ports are available at. And of course, in general, in practice there is a one to one mapping of ports to services.

For example, here I have a service which happens to be called hello service. And then in it, we do have a port element. And this port element contains the name is hell port. And that would be, by the way, mapped in this case to the port type.

And then after that here, we have the SOAP address element, which represents, in this case by the way, the location of my service. That's location through URL. So of course, when SOAP over HTTP requests are sent, they're typically sent to that location, HTTP call on local hosts, call on 7001 hello WS web service, and hello service that you have over there.

So that's pretty much how we can define these WSDL files. Of course, if we want to look at this from a structure point of view and from a components point of view, what we see here, ladies and gentlemen, is we do have a service. And the service has a name.

And this service has a port, zero or more ports. And these ports are always binded to a port type, but then there is a binding information. The binding information represents what? The transport protocol and the structure of the SOAP. And we've seen this as an example.

So here, the transport protocol is HTTP. And the style is document literal for the SOAP message, and of course, the different parameters that you're passing to the operation and what the operation is returning for you.

And it specifies also, in this case, the HTTP port that you see here, rather the HTTP transport protocol. That's what I meant to say. So here, what we're doing is we're passing SOAP over HTTP. That's the idea behind this.

So you see it here. So you have a binding information. And then every port type, by the way, has what? Zero or more operations. And those operations themselves-- so a port type typically is an aggregation of operations.

Of course, the question that you should have is, OK, these operations. How do we-- are going to decide now that that method within the class is going to be represented as a web service operation? The other one I do not want to choose that for it to be a web service operation. We'll see that later on when we talk about how we build that in web services.

But every operation typically is made of what? It has messages. We typically have three types of messages for an operation, or if you want, an operation is associated with three type of messages.

What are these messages? The input message representing what? The parameters you're passing through the operation, the response message, which represents what? The response that the operation returns if that operation returns an object and response.

And then the third one is what? The operation may throw an exception. So that will be representing a SOAP port. So we do have a chapter, a lesson about that. We'll talk about that. And then we'll see how we represent that port.

And then by the way, messages can have more than one part. That's what you see now. A message can be an aggregation of parts. For example, when you're passing parameters, I could be passing, for example, customer ID, person ID, and person name, person, and person address. So these are three parameters.

Every one of them represents what we call a part inside a message, right? Now the question that we typically have is this WSDL interaction scenarios, we do have different type of scenarios. This actually, by the way, is very, very interesting, because this leads us to a design of web services, because web services actually, in this case, can be-- so we can have, for example, one way interaction, where the client, in this case, sends a request to a service, but it doesn't want any answer back.

It doesn't want any [INAUDIBLE]. So ahead and do this for me, and thank you. I don't want any answer. Or you could be, by the way, a request response, where a client passes a request and says, give me an answer please. And then the service will have to return an answer.

Or it could be what we call a solid state response, where in this case, a service will imagine that the client sent a request earlier. And this is where actually comes the concept of design, because when you design for web services, you also have what we call the client pull, pulling the service and say, give me an answer.

Or we can have a client invoking a request on the service and say, by the way, can you get me this response? But if that response takes time to compute, then in that case, we use the concept of-- most probably you guys handled this.

Anybody handled what we call a serverpush technology, where in this case, the server will do the computation and then will send a notification back to the client saying, hey, your response is done, OK. I'm finished with it. Go ahead and pick it up.

So in that case, and in many cases, by the way, it's very, very interesting to use that concept of serverpush technology, because in many cases, when in this case when partners are talking to each other and doing business with each other, sometimes you request something. And that response is going to take some time to cook. It's going to take some time to get ready.

So in that case, we should not block the client, have the client blocked and not doing anything and waiting for that. That's a bad idea. Instead, we should make an asynchronous call on the service, say hey, send me this when it's ready please.

And then we knew to have a mechanism by which this service notify the clients that hey, your response is ready for you. Go ahead and pick it up. And then of course, we do have the concept of notification, when in this case, a service will notify the client.

## SOAP Web Services: Overview:Part 3 13m

We just have seen this WSDL file. And what's interesting about the WSDL file, ladies and gentlemen, is that we can separate or we can split this WSDL file into two types of representation of the WSDL file. We have what we call the logical part of it, and the implementation part of it of the WSDL file. Even better, sometimes we call it the abstract back of it and the implementation part of it.

So if you look at the WSDL file-- first of all, let's go ahead and just summarize what we've seen in the WSDL file. We've seen the definition. That would be the root. And then we've seen the type, specify the type of data. Then the message, representing the true data that you are trying to transmit. And then the port type, which is mapped to the Java class inside the Java side of it. And then the port type is made of operations, the operations are mapped to methods.

And then we have the binding. The binding represents two things. One is the transfer protocol. The other one is the structure of the SOAP message. And then after that, we do have the service, which represents the location of the service and the port, which is binded to the port type.

So WSDL file, we can look at it separated in two parts. One is the logical. So the port type, the operations and the message, all of this represents what we call the logical description of the web service. Again, that is what the web service can do.

So for example here, if I look at the example that we've seen in the exercise, you have, in this case, the message, which is this part here, and the port type that you see here. And of course, in this case, the operation, which is inside the port type. All of these are what we call the logical part of the WSDL file, or what we call the abstract part of the WSDL file.

And then the implementation represents what? The schema that defines the representation and the binding, in this case. So all of this now, if we take a look at this example-- so the schema, which is represented by the type, all of this, and the binding, which is this one here, all of this, and of course the service, all of these are part of the implementation of the SOAP document. Or for rather the WSDL document, that's what I mean. Of the WSDL document. So the WSDL binding provides again additional guidance which is again the style of the WSDL file to use.

And there are variations in the WSDL file. Again, designers have to make choices when writing WSDL files. You can use the style which is RPC or document. RPC is used when you have a strong typing, document is when it's a loose type of, in this case, typing, [INAUDIBLE] typing. And then of course, the representation of the data is either literal or SOAP/RPC. People don't use SOAP/RPC anymore. It's always, in this case, literal. Because lots of times, you pass data in the form of XML, and then of course [INAUDIBLE], which is a string, and then you will use that.

So far, when we looked at these SOAP web services-- we actually have seen SOAP and we've seen WSDL. And the question that we should always have in this case, ladies and gentlemen, is does the SOAP and the WSDL specifications represent what we call a pure, or construct what we call compatible messages. And unfortunately, the answer is no. SOAP and WSDL specifications leave a lot of room of web services and clients to be able to construct incompatible web messages for different versions and so forth.

Ah, so what should we do? It turned out that the development community, they actually created now a new, if you want, standard called web service interoperability, which is again done through the Web Service Interoperability Organization. This is pretty much a group that what they did is they attempt to define standards to promote pure interoperability between the web services implementation.

And by the way, suddenly they became what we call a profile. So this WS-I basic profile outlines a subset of bunch of features that will be used when developing web services. For example, our WebLogic 12c supports the WS-I profile, which is in this case 2.0, 1.2, and 1.1.

And of course the question, how do we do that. How do we enable that. We'll show you that in a few slides.

Moving along, and continue with this. It turned out, folks, that now we have created another WSDL version that's the WSDL 2.0. The WSDL 2.0, by the way, has a little bit of variation. If you take a look at the comparison between the 1.1 that we are currently, that everybody currently uses, versus the future one that is coming out, the WSDL 2.0, you will see that a type still exists. But what did we do to message? We got rid of it. We don't use message anymore in the WSDL file.

And then the port type. We don't specify the port type anymore. We call it what? Interface. Which by the way, in my opinion, that's good. Why? Because when we say a port type, we do know that in Java we have interfaces. It makes more sense to actually call it an interface than, in this case, a port type.

And then of course in the binding, the port-- remember, a bunch of folks also makes it a little bit of confusion when we talk about a port. Instead of having it a port, we call it an endpoint processor. For example, in the diagram that I showed earlier, I can look at this JAX-WS servlet as an endpoint processor that accepts SOAP messages and processes SOAP messages. So that's kind of nice to actually have that.

Now speaking of the SOAP, in general, when we move SOAP, the typical de facto transfer protocol has been always HTTP. Why? Because HTTP is ubiquitous. It's everywhere. And SOAP messages, it's pretty much a request and response body. And SOAP actions, HTTP headers, help identify the operation. So obviously, if you want, we can look at an HTTP as a winner when it comes to the transport protocol simply because it does an excellent job to move web service messages from one side to another side.

And by the way, we do have different mechanism by which we test SOAP services. For example, so far you folks have done in the lab used the cURL, you used the Firefox client REST extension. And of course, here's another one, which is the WebLogic. WebLogic web service includes, in this case, the WebLogic service includes a web-based type of web service test client which, by the way, you can access through the URL that you guys have here.

Ah. You remember how we said the WSDL file and the SOAP specification is not enough to create what? A good interoperability for messages. So that's why we added these, what we call in this case, ladies and gentlemen, the WS extensions. All the WS extensions are under the WS-I basic profile. And it outlines a bunch of basic set of interoperable functionality. And this, by the way, is all implemented through what we call, in this case, the metro stack.

So many [INAUDIBLE] standards have been created. And newest would be the WS policy. That's the one that pretty much is the framework that is the umbrella for the policies. You have the WS policy attachment, how you want to use the attachment. The WS security, we're going to see this in the security lesson. We're going to look at that. This is how we secure a message of the SOAP message. The WS security policy, the WS addressing.

WS addressing is very useful. We take a look at that. WS addressing allows you to have what we call a neutral transfer protocol. If I use the WS addressing, then I can use any tranfer protocol. It doesn't have to be HTTP. It could be SMTP, it could be JMS, could be FTP, could be so on and so forth.

The WS reliable messaging. WS, again, assertions for the assertions policy. WS security conversation. WS make a connection. WS atomic transaction, [INAUDIBLE] transaction and so forth. So all of these are extensions that are very, very useful. We'll see some of them throughout this course.

So this is all part of what we call, like I mentioned earlier, the WS policy framework. The WS policy is pretty much the framework, the umbrella, of the WS policies. And of course, the WSDL file outlines that basic contract of a client must follow when communicating with a web service. If additional restrictions or requirements for the client are in place, then ideally of course you can go ahead and include that. WS policy is pretty much a specification that outlines how extra constraints can be specified, and of course it's pretty much a very, very useful type of an extension type of a help to the SOAP web services. And we're going to see some of these enhancements throughout some of these extensions.

And by the way, WebLogic provides all of that WS policy through the annotation called-- we created a new annotation for WebLogic. It's called @weblogic.jws.policy. You guys are going to do that in the lab.

So this @weblogic.jws.policy is used to attach, in this case, a WS policy requirement by developers. So you can use, for example, here is an example where I do have an @policy annotation, with the policy in this case mc1.1.xml. And of course the attached WSDL file is set to true. And developers can add, can choose to add, the policy elements to the generated WSDL file, or not. It's pretty much-- it all depends on the needs, if you want.

And what you folks need to do is, as administration, you guys are going to do this in the lab, is you can attach policies to a deployed web service by adding that, by installing that. So in one of the labs, you are going to configure that. I'll show you that, of course, in the lab.

And that's pretty much what we wanted to discuss here about this lesson, which by the way gave us just an overview of the SOAP web services. One thing that we need to again discuss later on is how in this case the SOAP messages are generated. In general, you can have a web service. And then you compile and JAR that web service. And then you create all the machinery. Of course, you annotate your Java class. And then when you deploy the application, that's when your WSDL file gets generated.

Once the WSDL file is generated, then at that time you give it to the client. The client will pass it to a WS import engine to generate the whole client for you so that it can talk to you. We'll see all of this, by the way, later on in the top-down and bottom-up. That should be tomorrow.

And of course here, just a small couple of quizzes to finish the course. The first one is a request to a SOAP web service endpoint must always be transferred using HTTP. And the answer is no, that's not true. I can use SMTP, I can use JMS, I can use FTP, I can use different type of transfer protocols.

And then the next one is the definition element in a completed WSDL should contain which sequence of elements. If you take a look at this, you will see that we've seen what? Definitions as a root, and then what? We've seen types, and then message, and then port type, and then binding and then service. That's what we have seen when we went through the WSDL file.

And that's pretty much what we wanted to say about this lesson. Here these are just the resources, just a bunch of links for more reading if you want.

## SOAP Web Services: Overview: Part 4 6m

OK. Now that we're done with lesson four, let's go ahead and take a look at practices for lesson four, which is exploring SOAP components. So in this one, we do have a practice 4-1, where we do just revisit that calculator web service that we've seen in lab number one.

So we're going to go ahead and open that. And then open the project dialog box and pretty much select that, and right-click and deploy it. And then, do a bunch of testing. Launch your RESTful client, RESTClient Firefox extension, and just do a little bit of testing here. Follow the steps step by step. We're going to open, of course, some of the SOAP messages that you see here that, of course, we want to use them to do some testing in this case. That's all part of just revisiting and working a little bit by invoking SOAP request and getting responses and so forth. That was the first exercise.

What's interesting here is the second part, folks. This second part is a little bit interesting, because what we are going to do in this practice 4-2, we are going to configure our domain for advanced web service features. We're basically going to configure the WebLogic to handle the WS extensions, web services.

So the WebLogic web services stack supports many web services features beyond those required by the JAX-WS. Some WS extensions require specific configuration of your WebLogic, like asynchronous messaging, web services reliable messaging, message buffering, security web service, WS security convention, and so forth. So a template is available to use during the installation of WebLogic server, which by the way can automatically configure the server to support these additional features. Again, the same template can be applied after installation, which is again what you do in this practice.

So here's what you guys are going to do in 4-2, which is quite important, so we need to look at that carefully. So let me just increase this size just so that we'll see. So here, you're first going to stop your WebLogic. And then of course switch again by SOAP [? your ?] WebLogic.

And then after that, you are going to configure a domain for advanced web service features. This is pretty much telling you what we are trying to do. And to apply the same template, again, perform these steps.

So to perform these steps, it's important to read this note, folks. What we tell you here is saying copy and pasting to the command prompt is known to cause errors. So manually, in this case, once you shut your web server app server, WebLogic app server, all what you do in this case is manually type the following command.

So you are going to open a command, in this case, CMD, like that. And once-- and then you're going to run this command, D colon backslash labs backslash student exercise labs. And then you'll run this script, in this case, this [? WSS ?] part, which by the way happens to be inside, in this case, here. That's the bad one. And if you added this one here, just to see what's in it, it pretty much has, in this case, a script that is going to run to, again, run in this case that script.

And what it does, it will do all the configuration for your WS extensions. Run all of this. Once you run this, ladies and gentlemen, you're going to skip all of this. Skip all of this. All of this, you don't need to do it. Nothing. All of these steps, all the rest of the steps of this page, ignore all of this.

You go to the next page and ignore all of these steps. Go straight to step three and start your WebLogic server. That's all what you need to do.

So in this lab 4-2, or practice 4-2, all what you do is shut down the WebLogic, run this script, and then start the WebLogic. And that's it. In number 4-3, you are going to explore a SOAP and WSDL document with the WS extension.

In this practice, we again use a provided project called slope calculator app to explore the changes in the SOAP and WSDL elements when using the WS extensions. Again, these WS extensions have additional features and restrictions for SOAP-based web services. You explore using some of the security-related extensions in a later lesson. We're going to see that.

For now, you see the WS policy statements that are, in this case, added to the WSDL document when applying a policy to a service. Of course, the WS extension used in this example is a WS make a connection. This WS make a connection enabled client [? pooling ?] for web service operations, which take a long period of time to execute. And if you take a look later on and identify, and of course, dig into the slope calculator app, you will see that we're using some random numbers for the application to sleep for some time, to just, in this case, simulate the concept of a long period.

So you're going to go through all these steps. Again, the key to the labs in this case, ladies and gentlemen, is follow the steps and read what every step tells you so that you don't make any mistake. And if you step away, always mark down where you were, so when you come back you know exactly where you're going to start. And that's pretty much what we're going to do as practices for lesson 4. Thank you.

## Practice 4-1: Revisiting the Calculator Web Service 7m

 
OK. Now we're done with Lecture 4, let's go ahead and take a look at these practices. We'll start by looking at Practice 4-1, where we revisit the calculator web service. And here we revisit that calculator web service that of course we discussed in Lesson 1.

So what we are going to do is launch the RESTClient. And that's pretty much what I have done here. And of course, in this RESTClient, they want us to enter the HTTP local host 7001 calculator app, calculator web service, question mark, WSDL file, into the link. And then of course after that click and send. And that's pretty much what it gives me. It gives me, in this case, the body of your WSDL file.

And then of course they want us to investigate that WSDL file. So we inspect the element type. And in the element type, we actually find under-- we find the schema location under the local host 7001 calculator app, calculator web service, question mark, xsd equal 1. That's pretty much what we have in this case.

And what they want us to do is they want us to open an instance of RESTClient file in extension. And that's what I have done here. And then after that, they want us to paste that link inside the URL. And then of course they want us to click Send. And that will give us the schema location. So here's the schema location. And of course the schema file, too, that you see here, which starts with xsdschema. And plus of course inside you have the schema of the whole thing, which is already given to you in this case as an output.

And that's what we've done. In addition, by the way, they also want us to also launch the client RESTful web service in this case. And in this case, what they want us to do is they want us to put in the link, which is the calculator web service link, and then out in, in this case, the SOAP request that, of course, we're given. And then of course this SOAP request, and then of course set up a post. And then when we of course click on this-- go back to the-- when we click on this and then Send, with a post, we get of course in this case-- in our case here, the response again body should be empty of course. And you will get the message, which is 415, unsupported media type.

So using the header, in this case, the headers, and we want to customize this to the, in this case, the content type. So the content type. And then we want to specify the content type to be a text/xml. And then we send now the-- and of course, in this case, send response.

And then let me just make sure that the content type is text. Was it the-- in this case, they want us to have the content type. Oh, that should be content type here. So let me go ahead and-- content type. Select this. So let me just cancel this one here. And then do it again. But this time, do a custom header, and then do a content type. So that should be the one that-- so content type. And of course-- so that would be my content type in this case, which is-- just make sure that this is capital C. And it should be text/xml. Click OK.

And then, of course, send it again. And that obviously should give us a-- response should have been status 200. So let me just make sure that-- oh, we don't have it actually. Let me put it down. Custom again, and content type. So there is-- OK, here's what we could do is, in this case, I can go ahead and put in a new one. And then just copy the URL in the new one.

So here it is. And then of course set up the content type here. Then the custom header. And then that would leave us the content type, which is a text/xml. That's what they want us to do.

And Click OK. And then now, I'm going to go back and just copy this. Just copy it and put it down here. And paste it. And then of course, we wanted a post in this case. So we need to change this to post, and then click Send. And that will give us the 200, and that's exactly what they want us to see. And this pretty much ends this practice 4-1. Thank you.

## Practice 4-2: Configuring WebLogic for WS-* Web Services 5m

In practice 4-2, they want us to configure WebLogic for the WS extensions web services. And we discussed these extensions, of course. In this case, we configure the domain for advanced web service features. And the WebLogic web services stack supports many web service features beyond those required by the JAX-WS. Some of the WS extensions require a special configuration of WebLogic, such as asynchronous messaging, web service reliable messaging, message buffering, security, using WS connection. So of course, a template is available for use during the installation of WebLogic server, which by the way can automatically configure your server to support these additional features. So the same template can also be applied after installation, which is again what you do in this practice.

So first of all, what they ask you to do in this case is just shut down the WebLogic. So that's the first thing that we need to do. So we go under Services, and right-click WebLogic, and then stop it. So that's going to stop the WebLogic. That's the first thing that they want us to do.

And then of course the other thing that they want us to do is-- and let me go back and just show you this. So they want us to configure the domain for advanced web services. The only thing that you need to remember here, instead of doing all these steps, step by step, all the way down here, and all the way down, and continuing with all these steps until the end here, we want you to read this note. This note is quite important.

And this note says copying and pasting to the command prompt is known to cause errors, so manually type this command, which runs the wsse.bat script. This wsse.bat script in this case is inside your-- and let me just open it just out of curiosity. Let me go ahead-- and so the WebLogic obviously in this case is stopped.

So if you go under, in this case, Lab 4, you actually find this wsse.bat. And so I just want to again in this case edit it so that you can see. So here's pretty much the script that it has over there. And so let's go ahead and-- pretty much makes use of this also script that you see here.

And so they want us to run this command line. That's pretty much what they want us to do in this case, under D colon labs student exercises backslash lab04 wsse.bat. And I have it here. But since the WebLogic has stopped, so I have it here. So all what I do is I hit return, and boom. That's going to go ahead and take care of business for you.

So you let it run all the way until it's done. It's done now. And then all what they want you to do now is, if you go back, they want you to go directly to step three, in this case, and then start the WebLogic again. That's all what you need to do. So skip all the steps, basically. All what you need to do is just run this command. In this case, this one here. D colon labs backslash student exercises lab04 wsse.bat, and that's it. And ignore all of these commands. All of these, you do not need to do them. And all of this. And then go straight to step number three and start your WebLogic. Let's go ahead and do that.

And I'm going to go ahead and start the WebLogic here. So I'll right-click on this guy here, and then click on Start. And that will go ahead and start my WebLogic. I can see that pretty much it is starting in this case. That's all what they want you to do in this exercise 4-2.

And by the way, you see this information that you see in red, so don't panic. That doesn't mean that you have any errors. There's no errors whatsoever. It's just information that you have at, of course, the log output of your WebLogic server. And that pretty much ends this practice 4-2. Thank you.

## Practice 4-3: Exploring SOAP and WSDL Documents with WS-* Extensions 6m

Let's go ahead and take a look at practice 4-3, where we explore SOAP and WSDL document with the WS extensions. In of course this practice, we use a provided project, SlowCalculatorApp, to explore the changes in SOAP and WSDL elements when using the WS extension. Of course, these WS extensions have additional features and assertions for the SOAP-based web service. What we want to do is explore using some of the security-related extensions in later lessons. For now, all what we want to do is see the WS policy statements that are added to a WSDL document when applying a policy to a service. Of course this WS extension used in this example is a WS-MakeConnection. And WS-MakeConnection enables a client pooling the web service operation such, which of course takes a long period of time to execute.

So in this practice, first of all we are going to install this JAR file, which I already did. So if you take a look at, in this case, your NetBeans, and then of course in general you go under Tools and Libraries, you will see that I already added these. And so in general, when you click on it, then you click on Add a New Library. And then you name it. And then it says, in this case, Server Library.

And then after that, you wanted to of course add the JAR file, which happens to be called ws.api_2.0.0.0.jar file. And that's I already did. And the one thing that I want to mention here, which you should pay attention to, is please spell-check the words exactly the same way they are in the practice, in the activity guide. For example, WebLogic, it has a capital W and then a capital L. It's all case-sensitive, so be careful. Such typos can actually throw you out, and of course obviously it's not going to work, and you will be wondering why it's not working. So be careful with that.

Other than that pretty much is straightforward. Then after that, they want us to open the calculator, SlowCalculatorApp. And then they want us to deploy it. And of course, it's deployed in this case. I already did it.

And then after that, they wanted to just do some testing here using the, of course, in this case, the RESTClient extension. And that would be all of this in here. So first thing they want to do is, in this case, do a post on the service. Or rather, do a SEND on this service at the beginning. And so that was this one here. And then to show you that you're actually working with the WS policy. So that's what we've done in-- that's step nine [INAUDIBLE].

And after that, they want us to submit a SOAP request. And that would be the next one. And this SOAP request that we're submitting is this one here that has the I3 and J9. And then of course, the response would be exactly what they want us, which is the sum of 3 plus 9, which is 12. That's exactly what we get, so that's good.

And then after that, they want us to-- in step 11, they want us to send a MakeConnection request to a SlowCalculatorApp web service. In this case, they want us to make use of the-- in our case here would be the-- let me just make sure that I am using-- ah, it's this one here, which is-- actually not this one, but the one before. Which is this one here, which is pretty much in this case sending this. Let me just go ahead and show you that on the-- I tried all of them anyway. So under Favorites, they want you to make use of [INAUDIBLE].

So that's the XML version of that. So copy all of this and send it, and that's exactly what I did in the RESTClient. So this is pretty much what I sent. And then of course click Send. And that's what I got as an answer. [INAUDIBLE], of course in this case the body, which is [INAUDIBLE]. And here's the response body that you have, which is the total, which is 17, which is 7 plus 10.

And then after that, they want us to send a WS MakeConnection pooling request to the SlowCalculatorApp. And that's using another XML file, which is called [INAUDIBLE]. And that of course you will find under the favorites in NetBeans. And I already did that. And that's the one. And then I kind of highlight, copy and paste, and then use it of course inside the RESTClient extension. That would be the last one that I did here.

And here it is. And then of course you will of course get your answer. All right. So that's pretty much what they want us to do in this practice. Thank you.

## Skill Check: SOAP Web Services: Overview - Score 80% or higher to pass

Skill Check: SOAP Web Services: Overview

View Skill Check
