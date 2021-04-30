# 5: Using Java Message Service API

1. Using Java Message Service API - 26m
2. Practice 5-1: Configuring WebLogic JMS Server - 9m
3. Practice 5-2: Creating a JMS Producer and a JMS Consumer - 12m
4. Practice 5-3: Testing the JMS Producer and the JMS Consumer - 5m
5. Skill Check: Using Java Message Services API - Score 80% or higher to pass

## 1. Using Java Message Service API - 26m

Java Message Service API. In this chapter, we're going to look at the JMS API messaging models and how we produce and consume messages and we'll look at both types of consumers and producers-- those that were in Java EE but then also those that are not, so outside of Java EE container as well. We discuss specific types of message consumption, like, for example, durable or shared subscriptions, and we'll also discuss message-driven beans as a type of a message consumer.

Oh, and one more thing, of course, if we're talking of transactions, message-driven components can also participate in transactions. So how do we use transactions with JMS? And that's another point.

JMS API allows us to organize exchanges of messages between different parties. Any party can publish and subscribe to messages. It could be external clients. It could be session beans. It could be CDI beans. As a consumer of the message, you may use a message-driven bean, which is a special type of bean specifically designed to consume messages, but then again, you can consume messages from other components as well.

The messages are exchanged through the JMS server. It's part of your Java EE. By the way, it requires your Java EE server to be supporting full profile, so it's a full specification in order to be able to run JMS. And it enables all sorts of components to exchange these messages.

Now message exchanges could follow two types of models, known as Point-to-Point, also known as Queue, and Publish-Subscribe, also known as Topic. The Queue model allows you to deliver the message to the queue, put the message into the queue, and it acts like a stack of cards where the consumer of the message picks up the message from the queue and that's it. It's gone. You draw the card from the stack. It's gone from the queue. So as the messages are consumed from the queue, they're gone. Each message will be consumed by one consumer in a Queue model.

There is a permutation of that type of message consumption, which is called queue browser, which is a type of consumer that's not really taking messages out of the queue. It's just looking at messages in a queue. Not really taking them out. So that's a browser. But otherwise, if you consume the queue message, it's kind of gone from the queue. That's it.

A topic is more like a billboard. You stick the message onto the billboard-- onto the topic-- for everybody who is looking at the topic to see. Right? So the message is visible to all consumers of that particular topic.

However, there is a tricky bit with a topic. If you put the message into the queue and there's no immediate consumer that is available that is listening to what's coming into that queue, well the message stays in the queue until there is a consumer. That's fine. Sooner or later, the consumer for the queue will emerge and they will grab the message.

But with a topic, the message does not stay indefinitely. There's a period of time when a message is retained and then it has to go. So if there are no active consumers on a topic, what could theoretically happen is that you put a message into the topic, nobody looked at it, the message is gone. Well, after a time out, it will eventually be gone.

In order to avoid losing topic messages like these, you may create a durable subscription. If there is at least one consumer in a topic that tells the topic, I'm a durable consumer, I'm a durable subscriber, that will instruct the topic to keep this message on until that durable subscriber gets it. So a kind of guarantee that there is at least one subscriber who's going to get it, even if that subscriber at the moment was busy with something else-- inactive or otherwise unavailable. Otherwise, if it's a non-durable subscription, potentially, you can lose messages in a topic if you're not careful about it.

There has been a great deal of change between earlier version of Java EE and the Java EE 7 with regards to JMS. A new JMS 2.0 API has been introduced as a significant change. First of all, if you ever worked with the earlier version, just in case, you were establishing their connection, you were establishing session, you were then creating the consumer or producer of messages.

In the new API-- and this course presents us a new API-- the old API examples are available in notes but they're not presented as part of the course. So the new API simplifies it dramatically. You basically have just one object that controls all aspects of the JMS message handling and that's called JMS Context. With a context object, you can produce messages. With a context object, you can create producers and consumers.

In addition to the context object, you also may need a connection factory, but funny enough, a new JMS standard, Java EE 7 standard, actually defines a default connection factory for you so you don't really need to create one. If you want to customize what the connection factory is, surely you can create one, but there is one called Default Connection Factory provided out of the box. So you might not bother actually creating one.

Connection Factory may be useful if you want to tailor the way you connect to the JMS server, like creating and managing connection pools, et cetera, but that's only if you want to customize it. Also, notice that we now have a standard way of describing connection factories, queues, and topics-- all of these artifacts-- via annotations. You don't have to do it via provider-specific setup, although you could still do it via provider-specific setup. You could go to, like, WebLogic Server console and configure this things. But actually, you could just annotate your code. That's an example. Creating queues, topics, and connection factories just with annotation.

It depends what you want to achieve. If you want to pre-configure these objects on a server, that's fine. If you want to sort of supply the configuration with your deployment via notation or deployment descriptor, that's also fine. You can do it either way.

Now that crucial key object called JMS Context, out of the JMS Context object, you create all other things in JMS 2.0 API. You create consumers, producers, different types of consumers, like shared consumer for the topic or queue browser. Remember, that's the one that allows you to peek into the queue without actually getting messages off the queue. You could describe JMS destinations. You can create actual messages.

The messages could be in different formats-- byte, map, objects, text, anything. And then, of course, you may post messages-- that's through the JMS Producer-- receive messages-- that's through various types of consumers-- and handle exceptions, handle transactions, and control that subscription and delivery of messages.

Let's take a look at a producer. This page shows us Java SE Message Producer. There will be slightly different page a little later showing Java EE Producer. So SE Producer needs to establish the JNDI context, and with that, look up the Connection Factory and the queue objects. Well, queue or topic. Whatever. This example is with a queue. Create JMS Context object, create a message, and produce it. There you go.

When you produce the message, you can control how exactly you do it with this chain method imitation, dot dot dot. So when you send that message, you can say, what is the delivery mode? Like persistent, transient. Do you want the JMS to save the message? And what's the time for the message to leave in this system? Time out for it, et cetera. OK, so posting the message.

Consumer. This is Java SE Consumer. The Java EE Consumer is a message-driven bean, discovered a little later. Now Java SE Message Consumer will do the similar thing-- establish initial context object, look up the Connection Factory, look up the queue, create JMS context, create a consumer, and receive a message. This Receive property describes a time out.

You're asking this particular consumer to wait for a period of time for a message to arrive in that queue. If it doesn't arrive, oh well, it doesn't. So you stop waiting for it. So the Receive method is basically a way of consuming messages synchronously. OK?

Probably a more flexible approach will be asynchronous message production and asynchronous message consumption. That's certainly possible. This is how it's done.

If you want to asynchronously produce a message, you need to create a completion listener object, with two methods-- onCompletion, onException. And when you register the producer against JMS Context object, you basically set that asynchronous listener right here as an argument and then you call the method Send. So what happens is that method Send sends the message to that destination-- to that queue, topic, whatever-- and it allows your code to proceed. You're not waiting for a sent message to actually really conclude sending it. You just shoot and forget.

And then later on, when the JMS server really figures out what happens to that message-- is it produced, consumed, whatever-- so whatever happened to it-- it will call one of these methods. onCompletion if everything was hunky dory or onException if you had a problem. So you can find out later what's happening. OK?

Now asynchronous message consumption, you register a message listener, override all message method, and set it against the JMS Context object. There it is. Yeah, set the message listener. That's it. You will be called-- that allMessage method will be invoked when the message will arrive in whichever queue or topic you've associated that JMS Context object with. OK?

When you consume messages, you can acknowledge that you've consumed it and there are several different ways in which you can manage that process. The default mode in which JMS Context object works is called AUTO_ACKNOWLEDGE, so it automatically performs the message acknowledgments.

But if you want to control the process from within your code, you can change that mode to CLIENT_ACKNOWLEDGMENT. CLIENT_ACKNOWLEDGMENT means that you can use two methods called Acknowledge and Recover. If you call Acknowledge method, you're telling the server, everything's fine. It consumed the message. Good. If you call method Recover, then you're telling the JMS server, can I try consuming that message again, please? I'm having a problem. I want to try again. Yeah? So that's Recover idea. It's basically a retry, yeah?

If you tell the JMS Context you wanted to establish transacted session, you acknowledge not individual messages-- you commit the transaction. By committing the transaction, you automatically acknowledge whatever else happened in that transaction-- whatever messages you've managed to consume so far. All in one go. Or if you rollback transaction, obviously that's an equivalent of recovery, if you like. Yeah, you're trying to tell the JMS server, I'm having a problem. Can I try again? So that's transacted session that ties the message confirmation to the transaction.

DUPS_OK is a slight variance on the AUTO_ACKNOWLEDGE mode, and basically, it tells the server that not to track-- not to track individual message acknowledgements. It may lead to a strange circumstance. If the server crashes and then restarts, theoretically what could happen is that it could double-deliver the message. So, a certain message, the server will not realize that it already has been acknowledged. In the case of a crash, that might be the situation. So if your code is tolerant to the message duplicates-- if nothing wrong will happen if you process the same message twice-- DUPS_OK will improve the server performance by not telling me to track additional information. Otherwise, AUTO_ACKNOWLEDGE is the safer option, which is the default anyway.

Now, when you handle JMS messages, what you do with messages depends on their type. You can have binary, object, stream, text, all sorts of types of messages. You may also compose messages with any number of arbitrary properties. So in this particular case, I have in here the pair of properties-- some strings and some float properties. I don't know, just anything.

It looks like it's an object message. I'm having a product here. Product object. And I'm using some of these products as properties. OK. I can set the properties of a message.. You can get the properties of the message. The message will contain the entire product anyway, but property is like a separate name value pair that you would like to associate with a message. There are some standard JMS properties maintained by JMS Server and then there are custom ones, like the one you observe here, where you can just create because you want extra properties.

How you can utilize properties is rather interesting. We'll see the example of property utilization a little later. Java EE Message Producer. We've seen Java SE Message Producer. That's a Java EE Message Producer. See the difference? That's the difference.

You simply inject JMS Context and you say which queue or topic you want to subscribe to. Connection Factory is automatically provided by container. You don't really need to do anything else. The rest of the code is just the same. OK. So you can send your messages.

Java EE Message Consumer. We normally would use a message-driven bean. We'll see the message-driven bean in just a moment, but in this case, we're consuming the message from the CDI bean. Same idea. You inject in JMS context, you inject in particular queue or topic, and then you're receiving the message. A simple, synchronous message consumption. But as I say, more often than not, you probably would use a message-driven bean instead, so we'll have to look at that in a moment.

Now shared or unshared subscription. Shared subscription is a feature of a topic. What it allows us to do, it allows us to say that, normally, in unshared subscription scenario, a message that goes into the topic is shown to every consumer, but if two consumers use shared subscription-- basically, two consumers identify the same subscription name. That's all they need to do. So they say, we're sharing the same subscription name.

Then a message will be delivered not to each one of these consumers but to one of them. So it's a bit like a queue-ish. [? Well, I said, ?] my message is delivered just to one but not all components. So this is a trick you can play with a topic if you want a shared subscription. So shared by this name.

The other trick is to make a queue work a little bit like a topic. If you consume the message in a queue, you're getting it off the queue. It's gone from the queue except when you use a queue browser. A queue browser allows you to see what the messages are in a queue as enumeration of messages and just iterate through that collection but they will not be removed from the queue itself. They will be still in the queue.

And finally, long awaited, message-driven bean. I promised you that and here it comes. It may be annotated with a message-driven annotation or it could be described in ejb-jar.xml file. It implements message listener. Therefore, we override the method onMessage, which accepts message as an argument. We may optionally inject message-driven context into it.

The idea is that you are subscribing to a particular queue or a topic via the set of annotations known as Activation Config. So you're creating these Activation Conflg properties and that's it. The message goes into that queue or into to that topic and this bean will be picking that message up.

Remember we mentioned messages having properties. This is an interesting one. Using the properties as a filter or condition-- it's called Message Selector-- I basically tell that this bean is not getting all messages. I'm telling it's getting only teas that are priced above $2.99. It's some kind of a very expensive, elaborate [? Porsche ?] tea. That's the nature of this particular bean. So it's looking for certain types of objects but not all of them. So you could use message properties for filtration reasons. There may be some other bean that looks for all the products in that queue, I don't know, but that's certainly an interesting approach.

The message-driven bean lifecycle is very much like a stateless session bean. Two states-- Nonexistent and Ready-- two methods that allow you to control your code when your bean goes from one state to another-- postConstruct and preDestroy. So that's it.

And finally, message-driven beans and generally JMS components-- producers and consumers-- can participate in transactions. However, the transaction of a producer is not the same as transaction of consumer. They're always different transactions. You may choose whenever the consumer does consume messages and transactional context or not. Maybe you want transacted session. Maybe you want to do it as acknowledgments or auto-acknowledgments. I don't know, that's up to you. You decide how you want that to work.

But you certainly can just say, here, transaction management, container-- well actually, this is default for an Enterprise Java Bean anyway, so it's a message-driven bean, so it's by default container-managed. And then you can say, transaction attribute required or maybe not supported. Their other transactional attributes are not available for message-driven beans. Just required and not supported. So it's either join in the transaction of JMS producer or it's just consume messages without transaction context. That's it. It's as simple as that.

Take a look at this property. Delivery Counter. Very important property. It's a number of times the bean tried to handle the message. So it says here less than three, so basically counting attempts. So there's a problem with a message. Try again, try again, but not more than three times. That's what the property says here.

Because if you are not careful with that, what you could do accidentally is that you may create a kind of a hot potato scenario. Imagine this. You publish the message, right? OK. You try to consume it. The consumer that consumes the message raises an exception.

It rolls back. Is transaction required? OK, fine. It rolls back. The message tries again. But what if the problem was with the message? It will try again indefinitely in a loop unless you limit that delivery counter and you say, do you know, three attempts is just about enough. And then you post the message into some other queue someplace else, where you have another handler which deals with error messages.

You diverted the message. You're saying that you don't want to repeatedly reconsume it in the same bean, in the same consumer object, because you know where it will lead. It will lead to an error anyway because the error might be with the message itself.

And that's it for this particular session. So what we've covered is uses of JMS API in a Java SE world and in a Java EE world. We looked at all types of consumers and producers. We figured out that this JMS 2.0 API is greatly simplified. Basically, everything is controlled from JMS Context object, which allows you to create messages, producers, consumers, and the rest of it.

A very important part where we're trying to figure out a difference between types of consumers-- remember, shared and unshared, durable and undurable, queue browsers-- all sorts of permutations of types of consumers. Using message-driven beans as consumers. Dealing with JMS transactions.

In a practical exercise, you will be asked to create JMS queues on the WebLogic Server [INAUDIBLE] messages as an expiring product. That's that timer singleton that you created in an earlier exercise. You will add functionality to it. You will post messages to the queue. So a product is about to expire, send a message to the queue, and then we'll dequeue the message in another bean-- message-driven bean-- and pass on to the stateless enterprise Java beans [INAUDIBLE] for further handling. And basically the logic there will be, I would like to discount the product that's just about to expire. All right.

## 2. Practice 5-1: Configuring WebLogic JMS Server - 9m

 
Let's take a look at Practice 4 Lesson 5. In this practice, we need to create a WebLogic server Java Messaging Server configuration. You modify then the bean, which is the timer bean, which you created in a previous exercise, which is expiring product. You modify it to be a producer of messages, to write messages into the queue.

So at the moment, remember, it's just simply printing information by products onto the console. So we want it to publish things in a queue. And then we will configure that message-driven bean, additional bean, message-driven bean to be a handler for these messages, so ExpiringProduct timer will produce messages.

And then we'll create another one which is called DiscountProduct. And that will consume messages. For the rest of the business logic handling, we'll use the Product Facade Enerprise JavaBean and the JPA objects that were created so far as usual.

Let's start Part 1 of this exercise by creating a configuration within a WebLogic Server that describes relevant queues and topics. Open your browser and navigate to localhost port 7001/console and log in as user weblogic and password welcome1. If your browser is already open, you may have to refresh that connection, because it could be that your login have expired, so just log in again, then.

OK, so you've logged in to the console. Now, once you went onto the WebLogic console, expand Services, Messaging section, and find the Java Messaging Servers node underneath-- so services, messaging, and click on this JMS servers. You are ready to create a configuration for Java Message Server. It's a WebLogic configuration that describes the JMS runtime environment that you are going to use.

Let's call it-- JMSServer is a good name as any. OK, New-- give it a name, JMSServer. And click Next.

Now, Persistent Store-- you can persist messages that arrive in Java Messaging Service if you want to. If you don't create persistent store and you don't associate it with your server, the messages essentially will be transient, so, in another words, they will be working for queues, and for topics, and everything, but if you shut down the server, you lose messages, whilst, of course, if they were persistent, you could resume message consumption of those messages that are currently held in queues and topics even if the server shuts, if it crashes, whatever happens to it. So for the purposes of the exercise, we don't really need to create persistent store, so you can skip that. You don't have to do it.

And then you need to target the JMS Server to an instance of WebLogic Server, so here you click Next. And then make sure you select the target, which is the AdminServer. OK, so now, Java Messaging Server is created and is associated with the instance of the WebLogic server, good. That's not the end of the configuration though. We need to do a bit more.

What we need to do next is create a Java Messaging Service module, JMS module. So you go to JMS Modules, click on a New button, and create a module called JMSModule. OK, let's do that, Modules, New, give your module a name and click Next. Make sure the module is targeted to the same server, to the AdminServer server, so tick that box. Well, the exercise tells you to do that. And click Next.

And then, at the next phase, we'll finish creating module. We'll add some Java Messaging Service resources to it. So finish creating the module, tick the box that, yes, you would like to add some resources to the module. And these resources will be queues, topics, connection factories, well, whatever you want to add to that configuration. So generally, the mass module, basically, is a WebLogic Server configuration with which you can create different queues, topics, connection factories, et cetera, so, for that module.

Right, well, what we want to do at that stage is configure a queue, so let's create a new queue-- New, Queue, OK, click Next. Fill in details for that queue. The details go like this, the queue name should be called productQueue. And the Java name and Directory Interface name should be jms/productQueue. OK, so, give these names, click Next.

Now, what's a subdeployment? Subdeployment is a WebLogic-specific concept. It's part of the WebLogic server configuration that allows you to describe how resources that you place into your JMS modules are related to specific Java EE servers, so where they should be made available. So we create subdeployment for the product queue. Let's do that. Create New Subdeployment, and call it productQueue. That's fine, click OK.

And that allows us to relate that particular subdeployment to the JMS server. So select that, yeah, and we would like that subdeployment to be associated with Java Messaging Server. That's it. That's the part of the exercise, just make sure that you finish running that wizard.

So what we've achieved so far, we created a definition of a Java Messaging Server which was associated with WebLogic Server. We created a module that may contain a number of queues, topics, connection factories. Well, we created a queue. It will use default connection factory. That's fine, but, particularly, if you want to create your custom connection factory, I suppose you can, or, maybe, you want to create a topic, just repeat that mechanism that we've observed so far.

So it's just a standard Java EE, sort of, environment for a JMS system. And then we associated it with a WebLogic Server instance that we're currently running. So that concludes the first part of the Lesson 5 Exercise.

## 3. Practice 5-2: Creating a JMS Producer and a JMS Consumer - 12m

Let's take a look at a practice 5, part 2. In this practice, we need to modify the expiring product timer bean so it will actually place messages into the queue about those products that are soon to expire. We'll then create a new message-driven bean that will get these messages out of the queue, and then process them by applying the discount so you can discount the products that are soon due to expire.

Let's start by modifying the expiring product timer enterprise JavaBean by injecting there this code. We need to reference JMSContext object and a queue which you've just configured on a WebLogic server in your previous exercise.

So go into NetBeans, inside the product app enterprise JavaBeans project find expiring product bean. Make sure that's opened. And inject relevant resources. Make sure you sort out your imports. You need to import JMS queue. Inject, and the resource annotation. Align the code. There you go.

So are we prepared now to start working with Java Messaging Service from within this bean. Now create Java Messaging Service producer. That's what you do in a handle expiring products method. Handle expiring products. Add producer. And now what we're going to do-- oh, yes, fix the import, of course.

And now, what we're going to do is replace that printout of your products into the log with hosting products to the queue. So we are iterating through the list of our products. And we post them into the queue. Align your code nicely. There you go.

So, for every product that's due to expire, we create a new message. We post it into the product queue as a JMS producer.

OK. Next, we will create a consumer to retrieve these messages from the queue. And that's going to be a message-driven bean. This message-driven bean will be called DiscountProduct, and will be in the demos.model.project.

So let's start by going to file, new file menu, enterprise JavaBeans, message-driven bean, in the product app, EJB, click Next. Make sure you gave it a nice name-- DiscountProduct. Should be in the demos.model package. Right. And where should we subscribe to? Should be subscribed to the JMS product queue. There you go.

So subscribe it to this particular server destination. Click Next. Now here is where you can configure the properties of this particular Java message-driven bean subscription. So acknowledgment mode, what it is-- obviously, it's listening for a queue, in this particular case, types of subscription. Well you don't need to change any of these activation properties. Leave them all to default. So just click Finish. You'll be fine. OK. So that creates this DiscountProduct message-driven bean with the given activation configure.

Let's play around with this bean a bit. So what we're going to do is we going to modify this bean. And, first of all, we are going to add this interesting activation config property. It will prevent the bean from retrying to process the same product message if it errors-- delivery account attempts --more than three times. So you limit the amount of retries that you allow this bean to perform when handling the product.

Now add a logger to this bean, as usual, so we'll be able to write some log messages. Make sure you sort out the import statement, java.util.login.Logger. Then, inject ProductFacade enterprise JavaBean into it, because that's where our business logic code is located. Make sure imported Java X EJB annotation.

Then we will add code to the DiscountProduct message on message method. Discount bean product on message method. The code is very similar to what you are doing with the JP API so far in other examples in other practices in this course. Basically, we're looking for various types of exceptions here. We could be looking for Java Messaging Service exceptions, of course. We could be looking for other exceptions. For example, if we violate any constraints, or if we have an optimistic log problem, or anything else-- any other miscellaneous errors.

So let's practically except this part, which is the JMS exception handler. The rest of it is probably familiar code to you anyway, because that's what you were doing in other exercises in this course. So this is what we add to the OnMessage method. Make sure you fix the imports first. So login level, JMS exception, good. And nicely format the code.

Of course, at the moment, more code needs to be added to the try block, because the JMS exception is actually never thrown inside that code block body, because we're not really doing anything with the message just yet. So it's a potential problem, but we haven't actually coded anything to it yet. So we sorted out the exceptions and imports.

Now, let's handle the message. Try to get the message body out of it. We assume that what we were publishing into that queue in the first place is the message that contains the product. So, hence, we are retrieving it. See that warning, the JMS exception, wasn't actually potentially thrown in that kill block has disappeared, because at that stage, oh, yes, if we have a problem getting that product, will get the JMS exception. So we've added some realistic handling extraction of the message body.

Now, what we want to do is perform a calculation that will apply a 10% discount to the product. Calculate 10% discount value. There you go. Add relevant imports, format the code. So we are now calculating that discount.

Once the discount is calculated, we'll then apply the discount to the product. OK. So we're going to apply the discount. There you go. Lovely. so we set the product price to the new, discounted, price, subtracting the discount from it.

OK. Now, at that stage, let's validate the product. What it is that we validate in a product? What if, after applying the discount, the product now became cheaper than a minimal allowed price? Let me remind you that we had this constraint on a product. And the constraint is basically saying that a price cannot be smaller than the 1. So if we keep discounting it, and we go below that value, we'll obviously violate a constraint. OK so that's why we are in the discount product JMS bean. Check that after we've applied the discount, if everything is still fine with that product and validating that.

Once you've added the validation of the product, you're ready to update it. So that's our next step. We're updating that product. And I suppose, after that, we could just write the message to the log just to say, yes, we've applied some discount to the product. That's it. So just to conclude that example. Make sure the code compiles. Do the clean and build.

So that would be the end of this particular part of the practice of part 2. And in part 3, we'll proceed testing that code further.

## 4. Practice 5-3: Testing the JMS Producer and the JMS Consumer - 5m

In Practice 5, Part 3, all we need to do is to test the JMS producers and consumers, how they're sending and receiving messages. But in order to do that, we need to set up our database records so that there will be a couple of records about to expire, and which price for one of them will be $1.99, so we could still discount that. For the other one, the price will be $1, so it cannot be further discounted. We cannot apply further a discount to it.

So let's go to NetBeans to SQL console. And basically, what you need to do is check your current date. And for me, it's January 25th. So make sure that the date is set to next date, so 26th, yeah? And change the price to $1.99 and $1, yeah? Commit changes. So the data now is rigged to trigger the discount application to these two products.

Now, the next thing you need to do is modify your expiring product being scheduled an expression to be triggered in a few minutes after you've made a modification and deployed it. So go on back to the NetBeans code, find an expiring products bean. Current time for me, 9:35 PM, so 21-- let's say 37, to be safe, yeah?

And then compile the project, clean and build. And go to the product app and deploy it. So-- yeah so it should deploy your application. And that would trigger the test of expiring product, OK? In a moment.

So what do we expect from the test, yeah? We expect the test-- once we deploy it, we expect the test to cause an update of one of the products, to discount that, but not the other, because for the other product, the price will be smaller than $1. So that should cause a constraint violation exception.

Let's go back to NetBeans. Obviously, everything is now deployed. Go to the Oracle WebLogic Server tab, and just wait for new messages to arrive, yeah? So they should arrive shortly.

Well, we set it to 37 minutes, yeah? So there you go. Right on time, yeah? So price must be greater than $1. For one of these products, the discount was applied all right. So everything is fine. That product was discounted, yeah? But you can check in on the SQL console, yeah?

So let's just run this query again. Watch for these two prices, yeah? So run it again. One is $1.79, and the other still is $1. Let's analyze these messages a little closer.

So one of them was discounted by a particular amount, what [INAUDIBLE] is $1.79 now. But why do we have these three messages, price must be greater than $1, printed three times to the log with regards to that cake? Well, let's take a look again at discount product B, yeah?

So it's trying to validate, obviously failing with exception. But here's the interesting thing, exception is caught, isn't it, yeah? So we can't update it. We cannot proceed with update. The message is not confirmed. It's not acknowledged, therefore, because we had a problem. And it is attempting to be redelivered three times. There you go, yeah?

And you could have done it differently by, say, for example, throwing exceptions differently, or by annotating acknowledgment builds differently. But at the moment, it's simply just saying that if there is a problem, try it out three times, and then abandon that message. So this concludes the Practice 5.

## 5. Skill Check: Using Java Message Services API - Score 80% or higher to pass

Skill Check: Using Java Message Services API

View Skill Check
