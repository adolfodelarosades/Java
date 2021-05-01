# 10: Creating Java Applications with WebSockets

1. Creating Java Applications with WebSockets - 41m
2. Practice 10-1: Creating a WebSocket Chat Server Endpoint - 14m
3. Practice 10-2: Invoking WebSocket Chat Server by Using JavaScript - 17m
4. Practice 10-3: Invoking a WebSocket Chat Server by Using Java - 16m
5. Skill Check: Creating Java Applications with WebSockets - Score 80% or higher to pass

## 1. Creating Java Applications with WebSockets - 41m

Let's take a look at the ways of creating Java applications with the use of WebSockets. In this chapter, we need to first understand the WebSockets protocol, the communication style used by WebSocket protocol, and then describe the WebSocket endpoint handlers using the Java API which is described by a standard called JSR 356.

Now, the WebSocket endpoint handlers, there are two types of handlers, as we'll discover in this chapter-- client and server handlers, so we need to study both, understand their life cycles, look at how they could produce and consume messages, handle errors. And then there's a chunk of this chapter that goes about ways of encoding and decoding messages.

Generally speaking, messages used by WebSockets, they could be anything. But as an example, we're using here JSON messages. Although technically speaking, you could have used any other data formats. It didn't have to be JSON at all. But well, it was just an example. I suppose it's oftenly used example, because on many occasions WebSocket clients are implemented in JavaScript, which we'll take a look at. But we're also looking at Java clients for WebSockets. Well, let's get started.

First of all, what is the WebSocket protocol? How it's different from HTTP protocol? You see, in HTTP interactions, you're producing a series of requests from the client to which the server needs to respond. HTTP protocol implies that the originator of the call, the originator of the request, is always the client. And a server is responding to that.

So if you want to find out what happened on a server, what do you have to do from the client is keep calling, making kind of poll, repeatedly invoking server and asking the server, are we there yet? What's going on? And then the server can send you various replies, which might be kind of intermediate responses, saying well, I'm still working on something. And then eventually a final response, where the server will tell the client well, this is it. We've concluded some kind of activity on a server. But the client will have to keep polling the server to find it out. That's how the HTTP works.

What about WebSocket? Initial handshake of the client and a server is still done in HTTP. The client calls the server via HTTP protocol. But then the client switches the protocol to a different protocol, to WebSocket protocol. Once the WebSocket connection is established, it creates a full-duplex link between a client and a server.

This connection, unlike HTTP, is not closed. It remains opened. And both client and server got equal capabilities of sending information through it. So the originator of the call through the WebSocket connection doesn't have to be the client. It could be the server. Without a client polling and soliciting any response, the server could just, you know, handle some event, whatever happens in a server tier there, anything-- handles the event on a server and then invokes the client through the socket connection, telling the client what just happened. And that is the key to understanding the push rather than pull strategy.

Of course, that means that to support such an interaction, a server will have to dedicate a handler for each open socket. So in other words, it may prove to be quite resource consuming technique of coding, because the server has to keep open connections, open sockets with clients at all times. So scalability wise, WebSockets do present a problem.

But in terms of the ability of a server to instantaneously deliver a message to the client without the client polling for it, oh well, yes, the sockets are doing the trick. They're more efficient in that sense than HTTP protocol. Oh, it's also, the fact that the socket is, a socket connection allows you to transport not necessarily text, but binary data, for example-- which again, compared to text-based HTTP protocol might be an improvement. Typically, WebSockets would be used by clients that reside in web browsers for JavaScript or maybe mobile applications, although of course, the WebSocket caller could be a Java application as well.

Now, let's try to comprehend what's happening with a WebSocket lifecycle. There are two sides to the WebSocket interaction. There's a server and client WebSocket handlers. And they are really symmetrical. They really are mirrors of each other. For operations that a WebSocket handler-- whatever, it's client or server handler-- it doesn't matter for operations that they have to support-- OnOpen, OnClose, OnMessage, OnError.

The examples in this page do show us on one side, a server endpoint. An example is written in Java. That's that one. And on the other side, a client endpoint, and on this particular page, it's actually written in JavaScript. But even though it's technically a different programming language here, you still see a striking similarity there, how they're mirroring each other when you look at these onopen, onclose, onmessage, and onerror functions here.

So they are registered on both sides of this conversation. And it's precisely because the originator of the call could be the client or the server. They are kind of equal partners in that conversation. So for example, if one component server client makes the call, the other party receives the onmessage notification. So OnMessage method is invoked on the other side.

If there is an error, an OnError message is invoked. When socket is open and you want to maybe, I don't know, initialize some something resources wise at that point, OnOpen method is invoked. Once socket connection is closed, OnClose method will be invoked. So there are your lifecycle events that you handle for both client and server endpoint handlers.

Now, let's take a closer look at actually describing the WebSocket endpoint. You could map your WebSocket handler to a URL. Well, that's this annotation server endpoint here, which binds that handler to the URL. And then within the handler, you annotate methods with OnOpen, OnClose, OnMessage, and OnError annotations.

What exactly these methods are supposed to look like? Let's take a look at what these methods are supposed to look like, the methods that handle OnOpen, OnClose, OnMessage, and OnError calls, for both client and server endpoint. There are certain rules that we need to follow.

First, let's take a look at OnOpen operation. Optionally, if you feel like it, it may accept an EndpointConfig object as an argument, which is a configuration object. It may except session object. Well, they all actually can accept the session object as an argument, and I suppose any other custom parameters should you wish to pass the custom parameters to such operation. So that's when we're initializing the socket OnOpen.

OnClose may accept CloseReason as an argument. Again, it's optional. It might be custom parameters. It might be CloseReason. It might be the session object as well, because that is available for all methods. OnError must accept a Throwable object, which is representing the error, and may accept additional custom parameters, again, as well as the session object, which is still valid.

And the finally, OnMessage, now first of all, it may be void, but it may return a value. So you've got here a couple of variances. You may wish the message, when you receive the message, to immediately respond something back to the caller, but you completely doesn't have to do it. So therefore, OnMessage may return value or may be void.

In terms of the input parameters, the message may be any binary or text message. It may contain custom parameters as well. So you have to think about what sort of the parameters that OnMessage method should have. You may create more than one OnMessage method provided it's for different type of parameter-- so text, binary.

There is another type of parameter that OnMessage may handle. It's called pong message, as in ping pong. So the other counterpart could ping you, you know send a call just to check if the socket is still, you know, still alive-- if the connection is still valid. Yeah, and the other side can respond with a pong-- yeah, so ping pong here, response to the ping. So that's what OnMessage can potentially handle. These are the possible valid parameters for it. And as I say, optionally, they all can accept the WebSocket session object.

Next, the annotation PathParam allows you to append a parameter to the URL with which you open the WebSocket. Any operations within the socket can then reference that param. You see, it has a name ID here. So they can reference that PathParam by using that name. Any other operation can do it.

However, let's think about it for a moment. What exactly these PathParam represents? It does not represent the message the client sends to the server socket or vise versa. This PathParam is a URL with which you open a socket. So once it's opened, it remains the same for that whole socket session. All right. It's kind of constant. If you want to change that value of parameter, you have to reopen the socket again. The client has still open another socket then.

It's not a message that a client sends to the server. It's not a message that a server sends to the client. These could be variable messages. It's just sort of an initialization parameter for the client to initialize a connection with the socket. But then all our other operations on the socket, if they wish to have access to that parameter, they can. It's optional to add custom parameters to these operations. But if you want them to have access to the initialization parameter, just you know add that PathParam annotation and there you go.

When you open a WebSocket, it initializes a session between your client and server handlers. So that starts with OnOpen method, ends with OnClose method. That's the duration of the session. Within that session, you can always check if the session is still open. Programmatically, it's isOpen method. That's pretty straightforward.

You can associate the session with message handlers-- remember, for binary, text, pong handlers. So these are different OnMessage methods. You can provide separate different handlers for every type of OnMessage method if you want to.

When you close the session, I suppose you need to provide information about the closing reason. If you don't, NORMAL_CLOSURE is assumed as the closing reason. But you may close it with some other notification as to why you closed it. So there's a reason there.

And then also the session gives you access to security information. For example, what's the current user? Get the user principal. We'll talk more about Java EE security in the last chapter for this class. So it's still to come. There's quite a lot of information there. But anyway, well, that's how you can access that from a socket, a session API.

One more thing, which is really interesting. Take a look at this operation, getOpenSessions. It allows your socket handler on the server to gain access not just to the current session-- because the current session, you can just receive it as parameter in your method, right-- but to gain access to all other currently active sessions. For example, what if you want to notify all of these sessions at the same time. You want to send a message to these sessions, or some of these sessions?

So server wants to sort of broadcast things, not just to a specific client but to others. Remember in WebSocket interaction, the call doesn't have to be solicited by the client. So server running some timeline may just decide that he wants to get access to all the client sessions and just distribute some information across to these clients. And that's how it's done.

However, scalability wise, there is a catch. You are getting information about all of your sessions within a given Java EE server node. If you're running the cluster, then a WebSocket handler that is on one cluster node is only aware of sessions that are opened and that node. But if it's running on another cluster node, it's blissfully unaware about it. So they have separate sets of sessions. The client connects to specific handler on specific server.

So yeah, if you're in a single-node scenario, that's pretty straightforward. You can just send message to everybody. But if you're in a multi-node scenario, unfortunately, the WebSocket specification doesn't really cut it. It will not automatically give you access to sessions that are across in another cluster node. It's unaware of them. Well, that's a limitation you need to be aware of.

Now, let's take a look at how we can send the message from client to server or from server to the client. May I remind you that the OnMessage method-- we already discussed that-- can simply return a value from server to the client, for example, or the other way around. But that is an instantaneous response. It's when you are getting some message, you're processing that, and then you're replying something to the other party in kind of an immediate response.

But of course, the sockets don't have to do these immediate responses. They may just make a call because they want to. And this is how it's done. The call could be synchronous or asynchronous. Out of the session, you need to get either BasicRemote object or AsyncRemote object, so one of these-- synchronous or asynchronous communication.

If it's BasicRemote, just send whatever you like. Yeah, so it may be clients sending things to a server. It may be server sending things to a client. If it's asynchronous remote, then sendObject method returns your transmission status as a future object. So basically, it allows you to not to wait for the transmission to occur, but then find out how that transmission went by getting status out of that future object.

That's the WebSocket lifecycle, and the way in which we could use that to pass messages around between the server and client endpoints. Any of the WebSocket methods-- OnOpen, OnClose, OnMessage, OnError, it doesn't matter, could you use that API to perform the communication.

Now, let's take a look at the next important part of the WebSocket handling, encoding and decoding of messages. Example on this particular page shows us the encoding and decoding of JSON messages. It doesn't have to be JSON, but of course, it's commonly used by other types of server-side components, such as REST services. It's commonly used by JavaScript client applications. So hence, it's reasonable example to show.

Although technically speaking, format of messages that you exchange through a socket could be anything. It doesn't have to be JSON. But if it is JSON, which is often the case, there's an API for you to help you how to handle JSON conversions, marshal, unmarshal JSON messages. And it's called a JSON-P API, JSON processing API. It's a standard Java API for processing JSON messages.

It has several ways of processing these messages. They are streaming, object based. And let me just compare these two first here. So streaming JSON-P capability implies that you deal with a large object. And you don't want to read the whole object or write the whole object in one go, right? You'd rather use a stream to process it. So JsonParser allows you to read JSON data. And JsonGenerator allows you to generate the JSON data, so create a new JSON object and stream that to the other party across the network.

The reader and writer, the object-based JSON API, allows you to take a JSON message and pull it into memory as one Java object, or take a Java object and convert it, marshal it, to the JSON message. So that is more suitable for smaller messages where you can afford putting the entire message into memory in one go. So the larger is the message, the more you'd be inclined to use streaming API. The smaller is the message, the more you'll be inclined to use the object-based API version.

You may perform the encoding and decoding of these messages directly inside the handler, the WebSocket handler, client or server WebSocket handler. That's true, but you may also encode and decode these messages in a separate encoder/decoder class. I suppose if you have a number of endpoint handlers that use same messages, it makes sense to dedicate separate encoders and decoders for handling the messages. So you share the code more efficiently.

As you probably noticed, there is also here a reference to another training course, which is JavaScript and HTML5, Develop Web Applications course, which goes into real proper level of detail about how JavaScript works and exactly what's happening in JSON object scenarios. For this particular training course, we are sort of just using the JSON, but we're not really studying the JavaScript. So that that's just another language for us.

Well, let's see how the WebSocket message can be handled. In this particular scenario, we're looking at the OnMessage method. It happens to accept some string, return some string. It's quite primitive. We could have used this remote objects, a Basic or Asyncremotes, and read and write messages with them. But they'll do. Because we're not focusing on the way in which we initiate the conversation here. We're just focusing on the way we parse the data packet.

So somebody sends to us that value. And we want to respond with whatever are the string, right? We create a JSON reader. JSON reader, is that object or is that the streaming? It's an object API. OK. Just checking that you remember that. Good. So string reader, reading that value so we're basically parsing that JSON object. And we're ending up with Java representation of it, that JSON object that we've just discovered.

Out of that object, we could start get different bits of information. Like an attribute called ID, for example, presumably Product ID. And then we use that to find a Product. If Product is not found, well, we'll throw an exception. If Product is found and everything is fine, then we create an object builder. And we construct a JSON object here so it will contain the ID, name, and price.

OK. Let's just go one page back for a second. This is precisely what you are constructing. So it's a text message, basically, that contains this set of attributes-- name/value pairs. And that is what you will be transmitting through the network. And from the network, you'll be getting the message that presumably just contained the ID, the Product ID. Because look at the code here-- that's what you are getting out of that packet. You are getting just that integer Product ID. And in response, you are constructing a Product which has ID, name, and price.

Also notice this kind of chained method invocation notation. So you've got dot add, dot add here. You construct the object by adding further components to it. Well once the object is constructed, you're ready to write it to the stream. So you can just use JsonWriter and write it to the output stream. There you go, and return the value. If you use a streamed API, I suppose you can just use a stream straight ahead here. But in this particular case, we're using the, we're building the object first.

Talking about handling errors with sockets, well, that's done in the OnError operation. The OnError operation must accept a Throwable object as an argument that indicates what error just occurred. It may accept session. It may accept additional parameters, if you like. And well, in this particular case, the logic goes like this. If we have a problem, there is an error.

We then take a remote object and we notify the other party about what just happened, you know, sending some message, whatever else you want to do-- I don't know write log files-- so any other handlings that you would like to apply to the error at that point. It could be done on a server. It could be done on a client. This code would be completely mirrored on the other tier anyway.

Now, you may decide that you want to provide a separate encoder and decoder classes. Not hard code the algorithm of encoding or decoding your messages into the handler, but do it in a separate class. So first, you need to register these encoders and decoders. So we register that with your endpoint. It could be server. It could be client endpoint. It doesn't matter, yeah, same idea. So obviously, you need to write these two classes.

Now, here's the thing. Do you see that this particular OnMessage method uses the Product object as return value, and Product object as a parameter? Without encoder and decoder, you stand no chance of that working. Because how would you convert an arbitrary Java object, just your custom object, to JSON? You have to have a bit of code that does the conversion.

The OnMessage method will simply fail. It will say, I have no idea what to do with the Product. In absence of encoder or decoder, it won't be able to communicate with the other tier, because it wouldn't know how to transmit this Java object across to the other Handler. So there you go.

Well, let's take a look how the encoders and decoders are written. Here's the example of encoder. It could be binary or text-- well, dependent on format that you want to send. In this particular case, we're converting Product to JSON. What the encoder means take a Java object and convert it to the format that you want to send across the network.

Encode method, that's what we need to override, accept Java object as an argument, return whatever type you want to send across to the network. What if it's text? I suppose a string here, but it could be binary. So it could be binary or text type. It is text indeed, and it's JSON, so we are creating here. This code is exactly the same as an early example. We create a new JSON object that represents Product with ID name and price. We're building that and we're writing it out.

Also encoders, decoders do have some lifecycle methods, like these two-- init and destroy. Well, if you need to initialize any additional resources, I'll clean them up when the encoder or decoder is initialized or destroyed. And the next example shows us the decoder. So it's a mirror of the previous example.

In this case, we're converting string message to Product. So again, it's a text encoder-- sorry, decoder, of course, text decoder. And we're using JSON object here to parse the inbound message here, extract bits out of it, and form a new Java object out of these bits, which is what we return from this method.

In addition to the usual lifecycle methods, such as init and destroy, there's one more method here that you may wish to use and it's called willDecode. The idea of the willDecode message or method is to check if the inbound message is to your liking. Maybe you don't like it. Maybe there's something wrong with it. You return false out of this method and you don't proceed with an attempt to decode it. So that allows you to eliminate all sorts of issues that are related to corrupted or errored messages that you might be receiving. So willDecode if it returns false basically prevents the decode from ever being invoked. If it returns true, then obviously, decode method progresses as usual.

Now, we've mentioned the other API, the JSON streaming capability. So when you are doing the encoding, this is your choice between the object and the streaming sort of approach here. OK. So the first one we create in the JsonGenerator and we point it directly to the target stream whereabouts we want to output of that. And then we'll start writing to the stream.

See the thing is, we're not creating an intermediate in-memory object to hold on to that set of values. We just keep writing them as they emerge. And if you get a really large object to form, that will save some memory.

Well, the other approach is to create that intermediate object with JSON object builder. That means that we're holding on to all of the values at the same time in RAM, and then we're writing that object out to where we want it to write to, so it could be JsonWriter pointing and again to some stream. So really, that's the difference. Do you want to have an intermediate object to hold onto your values in memory? Or are you happy just writing things directly to the stream? That's entirely up to you.

And the other way around, this is the choice of parsing inbound messages. Again, you can just basically use a parser that works with a stream. That's a little tricky, though, as you could see. So yes, you're connecting the parser to the inbound stream. But then you have to handle things that emerge in that stream as they emerge.

So you look at the stream of content that is coming through, and you're saying, is that a JSON key, like remember, ID, name, price here? Next is that a JSON value? And you have to kind of raise the-- the parser will raise the events for every element that occurs in a stream and what you have to do is react to these events that are raised by the parser and get relevant values out.

You get these values out, where do you put them? It's entirely up to you. If you start putting all of these values in memory, you might as well just create a JSON object in the first place. But the idea is that the stream parser, JsonParser, allows you not to necessarily put all of these values into memory in one go, and handle them as they emerge from the stream.

Or if you're happy parsing the object and the input stream, and converting that to the object in one go, then just use the JsonReader example, rather than JsonParser. And that just creates an object straight ahead. It's much more convenient, of course. And if you've got the object that is not too big, I suppose the reader is much easier to use than the parser. So for large objects, you may have to sort of go on a little bit more lower level of coding here, on a more elementary sort of level, process the inbound message.

Well, how about calling our WebSocket server from the client? There will be an example of JavaScript client and there will be an example of Java client. Let's start with JavaScript. Again, for more detailed conversation about how the JavaScript works with regards to sockets, it's covered in this JavaScript and HTML5 Develop Web Applications class.

But in this course, we still need to have some at least vague understanding of what's going on, because you're actually going to do it in your exercise. So what we need to do is create a new WebSocket object. So there it is. That's this new WebSocket object, points to the relevant WebSocket URL. And then register onmessage, onerror, onopen, onclose functions as you see fit.

I suppose onmessage and onerror are the musts, because otherwise, how are you going to have a conversation? As for the open and close, maybe, but that that's kind of optional here if you need these handlers. Anyway, it will start communicating. You can parse JSON objects that you are sending through the network. It can create new JSON objects, pass on different values. That's actual communication code. It's pretty straightforward.

Now this is Java client. It's very similar to server endpoint. But the difference really is you're using client endpoint annotation instead of server endpoint annotation, right? So this is your handler. You define OnOpen, OnClose, OnError, OnMessage-- whatever methods you need.

Then you need to create a WebSocket container object. With that WebSocket container object, take the URI that points to that socket. And use the container to establish connection to that URI. The other parameter of the connectToServe method is a reference to your client endpoint handler, to this one. So basically saying, that's the class that will be handling onopen, onclose, onerror, onmessage, et cetera, events.

That's it. You're ready to handle the communication. If you want to send something to the server, get either Basic or AsynchRemote and start sending. In this particular case, we're sending Product, so presumably, we have encoders and decoders for that, obviously here. When you're over communicating with a server, close the session. You may provide a closing reason here. There you go. OK.

That's it for the WebSockets chapter. So what we've learned so far is the WebSocket communication style, which is rather different from HTTP because it enables us to perform push-style communications, rather than just pull. We've looked at the ways in which we can write endpoint handlers, and the lifecycle of the WebSocket, both for the client and a server handlers. How to produce and consume socket messages, how to handle errors, and all sorts of variances of exactly how you can encode and decode JSON messages.

Now, if I may draw your attention to a couple of things regarding WebSockets. Unfortunately, the WebSocket API does not automatically convert JSON or XML messages to Java and vise versa. You have to write encoders and decoders.

Why am I mentioning that? Because an earlier chapter, when you used REST API, that just worked for you. You were sending objects through the REST API without having to write your JSON-to-Java and vise versa converters. It just miraculously worked because in the REST API, that is an already written piece of standard functionality. But with WebSockets, you are responsible for providing encoders and decoders. That's one thing.

The other thing, once again, I want to reiterate the applicability of WebSocket. It is creating quite a strain on your server, because you are allocating a stateful connection, a full-duplex connection, stateful session with every client. So that obviously is a scalability limitation. Don't use WebSockets, because they introduce statefulness, if you can avoid using statefulness. If your application needs it, well, fair enough. Then of course, you would go for stateful connectivity. But stateless connectivity, such as HTTP, definitely scales better.

Talking about this, when you're looking on the exercise, an example that you are asked to do and the exercise creates a WebSocket chat server. Suppose if you want your users to implement some kind of a chat algorithm and exchange messages. That nature of a WebSocket of provisioning that instantaneous communication, of instantaneously broadcasting the message through the server to all sessions, is rather important. That would be a good justification as to why would you use a WebSocket.

Other good justifications could be, for example, computer games, where you've got multi-player games. They need to exchange information about events that occur within the game instantaneously. So again, that's rather a important consideration that a WebSocket would allow you to satisfy. But otherwise, if that's not a high priority for such an instantaneous communication, then maybe using good, old-fashioned server pull will scale better.

So if it's just like, you know, some functionality of a business application, like handling these products here, then you might really not need a WebSocket for that, because not such a high demand for instantaneous communication in this scenario. And then, of course, in the exercise, you are creating a JavaScript and Java clients for interacting with a server socket or the a chat server.

## 2. Practice 10-1: Creating a WebSocket Chat Server Endpoint - 14m

Let's take a look at practices for lesson 10. In these exercises, we're going to create a WebSocket server that will allow both JavaScript clients and Java clients to connect to exchange chat messages.

OK, well, let's start from part 1 of this exercise. And basically, we need to create a WebSocket server and point handler to handle our chat. OK, so the purpose of this handler will be to handle the open and closure of sockets to receive messages and errors and send messages back to other WebSocket sessions.

First, let's create a new Java class, that will be that WebSocket server handler, in a product web project in NetBeans. The class should be called ChatServer and we'll put it into a socket package. demos.web.socket package.

All right. So, make sure you select the correct project first, ProductWeb. And then, in ProductWeb, create new Java class. Call it ChatServer, and we want it to be in demos.web.socket package.

OK, so this is our ChatServer. Now, of course, we need to organize this last code to actually be a WebSocket endpoint handler. So we annotate it with server and point annotation.

OK, and I'll map it to URL chat, and sort out the import statement. Good. Now, as usual, let's put a logger so we'll be able to write some log messages. Yeah, so add logger, add an import, a Java util logging logger.

And now we need to create a collection of sessions as a copy-on-write array set. So we'll create a thread-safe collection of sessions. OK, so make sure again you will correctly sort out the import of set, and the Java util concurrent copy-on-write set, and a WebSocket session. This one, Java X WebSocket session. So this would represent all sessions that this chat server is currently handling.

And we'll be able to broadcast messages to all the users using that collection of sessions.

Now, we need to override WebSocket life cycle handling methods, such as onOpen, onClose, onError, our and onMessage. onOpen method should operate with the session parameter. Make sure you sort out the import. And nicely format the code. So that's handling the opening of a session.

onClose, also session parameter, and also, the close reason. All right, import the socket annotation onClose. And close reason.

OK, onError session and a throwable object. These are the parameters onError. Handler. So that is if the socket throws us some exceptions.

And then, finally, the onMessage method. It should accept a simple text message as an argument. Because, well, it's a chat. So we'll be just exchanging chat messages. So simple text will do quite nicely in this case. OK, format that method as well.

Now, once we put in place the necessary method signatures, we'll obviously need to fill in some code. And before we do that, though, we need another method just to be able to broadcast messages to all sessions. We will then invoke this method from other methods that we just created-- from onOpen, onClose, whatever, and from all these other methods.

We start with just preparing that broadcast message method, so we wouldn't have to repeat the code that sends messages, and just reuse that message, basically, from the rest of the code of that ChatServer. So this is just a custom method of yours, really.

Now, implementation logic. Lets start with looking at onOpen operation. We can add a session object to this set of sessions, and acquire the async remote object from that session, and then just just pass us some welcome text to it. And as you connect to the server, the server says, welcome, to you. That's the idea. And broadcast the message, to everyone else, that the user has just joined the chat. So that's the idea, that broadcast.

OK, so onOpen, put in some logic here. Add current session that we just opened to that collection of sessions-- to the set of sessions --get an async remote for this session, and send back, to this user, the word, welcome. And to everyone else, we'll broadcast that message that new user has joined the chat.

Now, onClose, well, we'll remove the session from the collection of sessions from that set, and we broadcast the message to everybody that user has left the chat. So that's what we'll do on a closure.

OK. So we maintain a collection, set of sessions, and we welcome the user, and then we say, goodbye, essentially. Well, everybody else received the message that somebody has left the chat.

OnError, write a log message, and also, send back the error text. So if there's an error, we're echoing, to the session that produced an error, that text back. And then we also write the log message that we had a problem. Lovely.

Finally, we're approaching the onMessage method. Well, first of all, the onMessage method should check if the message exists. If it's not empty, if it's not null-- because if it is, then just, you know, there's no actual message. Let's actually throw the exception at this stage. Why not?

So no actual message received. That will cause the onError behavior to be triggered. But otherwise, if the message is present, then we'll simply broadcast it to everybody. So user sends us a message, and we broadcast that message to all other users. And that's what's happening here. Of course, the broadcast needs to be implemented as well, which is our next task.

We iterate through a set of sessions here, and we send for each session in that collection, we get async remote from that session, and we send that message. That's it. So scan through this entire collection of sessions, and send the message. All right.

I suppose, alternatively, if you just wanted to do it in one of the methods, like, for example, you didn't want to do the broadcast inside the onOpen and onClose, and you just want a broadcast message somewhere, then you don't need to write a separate broadcast method.

Look, for example-- it's not part of your practice, but just out of interest --if only one of these methods needs to perform the broadcast, we could have added the session to the onMessage method. And let's say we want to then use this session parameter to get async remote.

Now that's for current session. Now what about all sessions? All other sessions. Actually, you can just retrieve the set of open sessions anyway. It's maintained by the container for you. So get me the open sessions. and then you do the forEach, you get the iterator, you step through that collection, and then, for every session, you start, you know, broadcasting messages.

So you could have just iterated through that collection anyway. I suppose that would be an OK thing to do if you just have one place where you want that broadcast to occur. But in this example, we want the broadcast to happen from several different methods, not just onMessage, but from onError, from onClose, whatever. Gosh, onError doesn't broadcast. But onClose and onOpen do. And we decided we just want to have an independent method to do that job. So, hence, we factored out the code to a separate method here.

OK, well, whichever way you want to write that code, you can exploit existing built-in capability of a socket-- a handler --to maintain the collection of sessions, or you can easily replicate it yourself, as in this example, where we're adding and removing sessions from that collection. So it's just another collection of references. Whichever way you find more convenient.

OK, so that's the functionality of the ChatServer. And that concludes the first part of this presentation. All that's left for us to do is clean and build that code. And we'll then proceed to the next phase of this exercise, where we will be writing a client for that server. So that all is still to come.

## 3. Practice 10-2: Invoking WebSocket Chat Server by Using JavaScript - 17m

Let's take a look at a second part of the practice 10. In this exercise, we're creating a JavaScript client that would invoke the WebSocket chat server. To invoke that chat client, we modify index.html page to contain a button to trigger the invocation of the chat client for us.

So we start by creating a new JavaScript file in the product web project, and we want this new JavaScript file-- we'll call it "chat"-- and we'll put it in a web/js folder. So make sure you're in correct project first, so that would be product web. And you create new file, which is a JavaScript file. Call it "chat," and put it in a web/js folder. That's it.

Now the content of this file we can copy from resources folder, so there is a chat.js file and resources folder that's under oracle labs here. And it contains the entire functionality of what you need to achieve, because you see, you're not really asked to write a JavaScript code on this course since-- well, it's Java not JavaScript training, of course-- but it contains comments as to what this code is doing. So you create in a WebSocket variable, and you're handling functions to join chat, which is open in a socket-- this is a URL-- to which our chat server is mapped. ServerEndpoint is chat, so there you go.

And then registering against that socket an onmessage function. The onmessage function will work with an html elements, or the element called chat, and then there's an element which is the divider element, which will create for present and chat messages with a visual attribute which is called class visual class, and the value of that will be chat. So that's referring to the CSS, cascading style sheet file, that defines this way of displaying chat messages. So you got a style sheet for that. So constructing a new html element basically, creating a text node that will contain the chat message, appending it to that divider, and then you're ready to display it in your document.

Now onerror, or pop the alert with an error data, onclose, pop up the alert the chat is closed. Also onclose, we will remove content, clear the messages from the chat. The document will also display some abilities to join the chat, leave the chat, send messages here. So we're resetting the fields in the document. For example, if we are closing the chat, that we could set the abilities to send messages, type messages, and leave the chat, we disabled these capabilities, and then we enable the join button. So there's a html element property called disabled here. So if disabled this false, then element is enabled, and vise versa.

Now this is the situation when we are disabling the join button and enabling all other buttons. So that's when we actually joined. OK, so switching which buttons are highlighted and which ones are disabled. And then this mechanism, we're just sending messages here, so get me a message value, construct out of it a message, which was sent to the socket.

The leave chat function is designed to close the socket automatically, given the short period of time within which we are allowed to kind of clean up current activities on a socket. Once the socket is closed, the onclose event, handler will be triggered here. OK, so that's the chat server JavaScript functionality. Yeah, that's what you expect it to do.

Now once you've sorted out that JavaScript file, we copied the code from this file, you could proceed to create an irrelevant html file that will display the chat window, as you probably noticed, that JavaScript have early release upon the elements of the html to provide the necessary user interface. If you're interested in more information about how web sockets are handled in JavaScript, there is another course called JavaScript and HTML 5: Develop Web Applications.

So let's create a chat html file now. Let's call it chat, put it in a web folder here. OK. It's just an HTML file. Make sure you're in the right project, ProductWeb, create new HTML file, call it chat, put it in web folder, and that's it. Actually, is it lowercase chat, or uppercase chat? Uppercase chat, oh. Be careful with case because the rest of the practice will refer to it in that specific case. OK.

So we created chat HTML. Now you probably guessed what we need to do next. We need to organize the code in that chat HTML, and we get it from the template. OK, so open the template HTML file, grab the code, replace the chat content with that code.

And now we need to sort out some of the properties here. First of all, of course we need to include the script in the head section of that page. So refer to that script here in the head section of the page, here we place a reference to that JavaScript. Then organize the title, header, and footer. Right, so title header should be chat, and footer should be Join, Send, Leave. So title, chat, header, chat, footer, oh, some Join, Send, Leave message.

Remove the entire navigation element, so it will be just the chat window. OK. Fair enough? So we'll remove that part. This element got to go. We will still use the content part, the section which contains the content.

In that content section, we need to replace that page content placeholder with the HTML code that will display chat messages, allow a user to enter new messages, and buttons to join chat, send messages, and leave the chat. First we will add an HTML divider inside the section-- this one-- which will represent the way of organizing chat through the chat content. So visual class will be called field, and the ID of the element will be called chat. This will be the target for further chat messages to be added to. So it goes into page content area here.

Now, add another HTML divider. This time it will contain label, message label, and the input field to actually produce chat messages. OK, so that's this divider. The IDs-- these bits-- are referenced from the JavaScript. So when the JavaScript function wants to add a new element, chat message, it uses the field which have an ID of chat, and when it needs to extract the value that user has typed into the field, the JavaScript function would use the element which ID is message.

OK. So we'll add that divider as well to the page. Well, format it nicely. There you go. So we'll have an opportunity to display chat messages followed by the field, which allows us to type them.

And we need I guess-- we need some buttons. So another divider with buttons that represent join chat functionality, and they invoke joined chat function in JavaScript, send message, and leave chat. So we'll add these buttons to the page as well.

There you go. Again format it nicely. Right. So messages area, message entering area, and a button palette to trigger interactions with the chat server.

Now, there's one other small modification that we need to make to our application. And into the index HTML, right after the navigation towards the product search, would like to put a code snippet that would trigger an opening of the chat window. So we can just do it with a simple inline JavaScript function and a bit of an HTML. This would be the inline JavaScript function that will trigger the chat window.

So we're going to go to the index page. All right, we need an index HTML. Here is the navigation to product search inside a nav element, all right? So let me just align it for you nicely here. After that nav element, let's add an inline JavaScript. And this is what that inline JavaScript function is going to do. It's going to invoke a new window, inside this window, it's going to open a blank-- blank means new window, basically. Inside it, it will open the chat HTML file, and these are the window dimensions. Open in a new chat window.

And now we need some kind of a capability to trigger that open chat function. All right, so we've declared the function, how do we call it? I suppose a simple button will do. Could be button, could be URL, whatever you like.

So let's add a button right here. And a button will handle the onclick event. Somebody clicks this button, and the button invokes the open chat function. That's it. So now the index page has an ability to trigger the chat page.

Well, let's deploy and test this chat server of ours. Let's start by clean and build that project and make sure everything compiles nicely. Select the ProductWeb project, deploy it. OK, it's coming right up. Once it deploys, then we need to test it, and just-- I want to draw your attention to how the test is going to go. You need to open the browser and go to the localhost:7001/pm URL. And then open a new chat window, move it aside, and actually open another one. And then sort of dig one of the windows out from background, so you'll see them side by side. This is important because you're going to exchange messages, and you really want to see both of these chat windows on a screen at the same time.

Now you can start your test here. So they're side by side, you aligned them, whatever. You can start to test. So join the chat. Well, then the user joined the chat. Hey, user has joined the chat.

"Hello!" Yes. "Wow!" Yes. Oh no, I'll leave, yeah. Chat closed. OK. User has left the chat. Somebody else joins the chat. Right! Fantastic! [LAUGHS]

Anyway, you can play around with that. It's pretty straightforward. If you just leave it for a while, both of these windows will eventually time out. You could have, I suppose, sat a specific time out value for the web, sort of like a chat session. It's just basically telling a session how long it's going to survive inactive.

But, oh, there you go. Chat's closed. So in a few seconds, it will eventually time out, and the JavaScript will clean all the previous messages.

That it it. We've managed to implement a chat client in JavaScript. In the next part of this practice, we're going to implement Java client and act into the same socket server.

## 4. Practice 10-3: Invoking a WebSocket Chat Server by Using Java - 16m

In this next part of the practice 10, part 3, we are creating a Java application that invokes chat WebSocket server.

So first of all, we need to organize a new, simple Java project that will contain that application's code. So you need to create a new project. We'll call this ChatClient. So go to NetBeans, create a new project. Sorry, not-- yeah, new project, just Java project. Click Next. Call it ChatClient. Make sure it's in the right folder--- /home/oracle/labs/projects. And the package name and the class name for the main class should be demos.client.ChatClient. So we'll create the main class straight ahead. That's it. So create that project.

Now, in this project, what are we going to do? Once it's in place, we're going to add client side class path components and libraries that support WebSockets. We are now outside of Java EE world, so the WebSocket support is not automatic. We need to make sure we actually add an appropriate implementation classes.

Now, first of all, there's a library that we need to add, which is Java EE Web 7 API library. So that one. Let's add that first. So it's right mouse button click on libraries folder in a chat client. Add library. And that's the Java 7 Web API library. OK, add in that.

But also, in addition to this library, which, yes, we've added, we also need to add some other JARs and folders-- additional Java archives. What are they? Well, they represent the reference implementation library for the WebSocket, or the Tyrus library.

The path to it-- these JARs --are located in /home/oracle/weblogic/wls12210/wlsserver/modules section. So let's go there. It's the WebLogic, WLS Server, Modules. And now we need to scroll through the list of modules till we find org.glassfish.tyrus-client.jar. I think that will be the first one in the list. Glassfish-- org.glassfish.tyrus-client.jar.

So our org. Let's comb first. Still comb, still comb. Where's org? Good good good. Aha. org, glassfish, tyrus. Aha, there you go. So we need to-- you could press Control on the keyboard, and select tyrus-client. What else do we need to select? tyrus-core, tyrus-container-jdk-client, and tyrus-spi. So core, spi, container JDK client. Container JDK client, core, spi. Make sure you're holding the control key as you're doing the selections. OK.

So we added necessary parts to the class path because this is otherwise, essentially, a Java SE project environment. So we need to make sure it has the reference implementation libraries.

OK, now we are ready to create a ChatClient class that will implement the client and socket handler. Let's create that socket handler. New class, new Java class, socket handler. And it should be in a package, demos.client.socket. So put it in a right package. That's it. So this class will represent the handling capabilities for the socket.

Now, to these class, we need to add a client and point annotation. Of course, because we want it to be a counterpart for our server socket. So it's the Java X WebSocket client endpoint. Annotate that. And make sure you've got the correct endpoint, as usual. Add the logger to the code. So we add in the logger. Fix any imports. Format the code nicely.

Now what? Now we need to implement an open method, and would like to just write a log message when we open a new session. onOpen, write the log message. Fix imports. Format the code.

Next, onClose. Slightly more involved, because we want to write the actual closing reason as well. So onClose method writes the log message with a close reason. Again, fix imports, reformat the code. So we concatenate a message which is saying that WebSocket session ended with the reason phrase, as part of the close reason.

Now, onError. Similar to that, but this time, we're going to write, to the log, the actual exception message as well. So onError, and we write it here, into the log, the exception message.

And, of course, the onMessage method, where we write, into the log, the message itself. So this is way less sophisticated than our earlier JavaScript example, because we don't really have a-- extra line of code --we don't have a sophisticated UI in this command line client. So we just simply write and log messages instead. OK, so our chat will not be particularly interactive from the point of view.

OK, now we're ready. We have the handler. It can react to onOpen, onClose, onMessage events.

So what we need to do is organize the chat client class to actually send some chat messages. Again, let's add a logger to the chat client. So there you go. Add in a logger. And then we will write, here into the main method, an algorithm that will allow us to prompt user to enter chat messages, and then, of course, [? echo ?] chat messages as well.

So a simple command line interface where we print a prompt to tell the user this is how you interact with the chat. Yeah, you need to click inside the log window, then you need to type message, press Enter, then you need to type, exit, to close the chat. So we've got to parse user input from the console.

Now that parse an algorithm, we are surrounded with a try catch block. If we have an error, we'll obviously log the error. So there you go. Format. I'll make sure you've got correct imports. And that's where the chat interactions will occur, inside a try block.

What exactly we need to do. Well, first of all, we need to declare a URI point to the chat server. Of course. So let's do that. Oh, add an import of Java Net URI. That's where our chat server is located. Notice the protocol is, of course, ws, which is WebSocket.

Now are we need to create a WebSocket container object. Let's create that WebSocket container at a relevant import of container and container provider. Reformat the code, that's it. So container is initialized.

With that container, what do we do? We connect to the server. And as we connect to the server, to that URI, the server, we also register our handler with that container.

So we're saying, establish me a WebSocket session using the socket handler, which is, remember, this class. That's where you've written this custom onOpen, onClose, onError, onMessage methods. That's your handler. So you're registering that handler for that URI. That's the second parameter, that URI.

Your session is opened. You are ready to use it to send some chat messages. OK, so you've connected to server. To send a chat message, you need to create a remote async endpoint, to communicate with the server endpoint. So you get the remote async endpoint, and that's how you will start sending messages from that session. So you establish the session.

Now, we need to ask the user to type the message. So scanner, which we use that to process user input from the console. Oh, and add an import, of course, of scanner from Java util. So we process any user input from the console. And how do we process that? Well, I suppose we'll keep accepting messages until the user types the word, exit-- because the word, exit, will be a trigger to terminate the chat. Otherwise, we keep going with asking the user, over and over again, to put in further chat messages in. Every time the user types a line of text, and presses Enter, this new line is formed, and we send it to that remote object.

When the user types the word, exit, we break from that loop. As we break from that loop, we can now close that session. That's it. So this actually is triggering a session termination. Nice.

Well, I think we're ready to test. So just clean build and start using the chat. It's pretty straightforward. Clean build. Run that project. OK, so user has joined the chat, remember. Let's also join the chat in a browser. And we'll sort of display it side by side.

So join here. Ah, that's it, yes. See, user joined the chat. Say, hello from the browser. Send that message. We received that here. All right, let's type something back. Hello from the console. And there you go. What's happening-- I'm sorry, that's just the wrong window --what's happening in that browser window? That's it. We received the message, hello, from the console.

Now let's leave the chat. Type, exit. We left the chat. What about the browser window when it says user has left the chat. So we'll leave as well. Nice. That's it. That's the test procedure.

And that concludes the exercise for practice 10.

## 5. Skill Check: Creating Java Applications with WebSockets - Score 80% or higher to pass

Skill Check: Creating Java Applications with WebSockets

View Skill Check
