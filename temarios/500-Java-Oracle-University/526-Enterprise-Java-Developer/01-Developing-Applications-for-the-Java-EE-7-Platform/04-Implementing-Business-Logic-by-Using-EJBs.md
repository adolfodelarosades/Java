# 4: Implementing Business Logic by Using EJBs

1. Implementing Business Logic by Using EJBs: EJBs and EJB Container - 30m
2. Implementing Business Logic by Using EJBs: Timers - 17m
3. Practice 4-1: Creating an EJB Module - 25m
4. Practice 4-2: Creating an EJB Client - 9m
5. Practice 4-3: Testing the EJB Client - 5m
6. Practice 4-4: Creating an EJB Timer - 9m
7. Skill Check: Implementing Business Logic by Using EJBs - Score 80% or higher to pass

## 1. Implementing Business Logic by Using EJBs: EJBs and EJB Container - 30m

Implementing Business Logic with Enterprise JavaBeans. Well, in this chapter, we're looking at how do we create Enterprise JavaBeans components. And we're looking at session beans here. Message-driven beans are actually covered in detail by the next lesson, JMS API. But we are starting with session M

How to create session beans? How to add business methods to them? How do we manage their life cycles with container callbacks? How do we do asynchronous EJB invocations? How do we control transactions?

We started the transaction topic in the JEPA chapter, but we need to complete that transactions topic by putting it in a context of the container-managed transactions. And this chapter will give us an opportunity to do so. Also, in this chapter, we cover the Enterprise JavaBeans timers and interceptors.

Let's start with the role of an Enterprise JavaBean and an Enterprise JavaBeans container. An Enterprise JavaBean is a server-side component that carries out your business logic. An EJB container is the environment which executes these components. Funny enough, you can actually create an EJB container programmatically. Here it is.

Yeah, there's a piece of code. And I doubt you would do it for real, because the Java application kind of already created the EJB container for you. But, I don't know, maybe if you want to test some Enterprise JavaBean without deploying it to a real server. Yeah. So, you can actually just create these EJB-like container for like local testing, maybe.

And, of course, remember, we talked about it in the earlier session in this course, two types of Enterprise JavaBeans containers, full and embeddable light. The light container is instantly available for you, even with the web profile for the Java. The full container requires full platform support. And we talked about the differences, didn't we? Remember, remote irrevocable beans are supported by full container, but not by the light one. Yeah. OK.

Anyway, Enterprise JavaBean types. So there's session beans, and there's message-driven beans. Message-driven beans covered in next lesson. So they are subscribers to message queues and topics. Session beans are covered right now. And there are three types of session beans, stateful, stateless, and singleton.

Stateful performs the tasks specific to a particular client. Because, remember, stateful beans have a permanent connection to that client. Stateless beans perform tasks that don't require such permanent connectivity. They're given to the client for duration of the call.

And then they're returned back. And it could be a pool of instances of stateless beans used by multiple clients. And, finally, singleton that creates a single instance of that Enterprise JavaBean to be shared between all clients of your server.

You may expose an Enterprise JavaBean as a web service, but it has to be stateless or singleton. So only these two types can be exposed as web services. Stateful beans cannot because they have to be tied to specific client via non-transient protocol. So they can't be web services. Their essentially sole purpose is to be linked to particular clients.

How do you create them? Minimalistically, all you need to do is just put an annotation, like stateless, for example. Stateless, stateful, singleton-- that's pretty much it. Just that, yeah? Right.

Optionally, if you want to inject an Enterprise JavaBeans context object, you can do so, as well, into any of these beans. And that is if you need to gain access, programmatic access, to things like security, properties, context data, such as, I don't know, interceptors, web service context, or perform transaction control. So that might be the reason why you inject it.

With regards to the types of interfaces that you could use to expose the Enterprise JavaBean to callers, there are several options. Of course, you can do the remote interface, expose some of the operations of the bean to remote callers. And that's that example, remote interface defines the methods that you want remote callers to use.

You can use local interface, define methods that you want local callers to use. Maybe a different set of methods, I don't know. You may, certainly, expose the bean as a web service. Now allow the beaning methods to be called as so service methods. But there's another interesting option. And it's called local bean, or no interface option.

Don't confuse local bean with local. They're different. The local option implies that you have an interface. And in that interface, you describe which methods you would like the caller to be able to invoke. A local bean says, don't bother with an interface. Any public method in the bean, just allow it to call, and that's it.

So, in a simple case, really, you could just say, oh, well, that's a local bean, don't need to create any particular interfaces, just use the bean. Right? If you're happy with just public methods being exposed to callers. If you need more control, over which method in the bean to be exposed to which caller, yeagm use interfaces then.

Life cycles. For each type of bean we need to cover what are the life cycle options. So stateless session bean could be in nonexistent state and in ready state. When it transits from nonexistence to ready state, at that stage the container can invoke a @PostConstruct method upon that bean. If it is disposed of, if it goes from ready to nonexistent state, the @PreDestroy method can be invoked by the container.

You can simply write a pair of methods for @PostConstruct, @PreDestroy, just void methods, really. In this particular case, they're called it and cleanup, but you can call it whatever you like. Method names are not significant.

Let's take a look at a stateless session bean life cycle. It could be in two states, nonexistent and ready. It travels from one status to another. And as it travels from nonexistence to ready state, a container can invoke the method that you've annotated with a @PostConstruct annotation.

The method signature-- well, any method will do really. Name is not significant. It doesn't have to be called init. You can call it whatever you like. And then if you're disposing of the bean, then @PreDestroy method can be invoked by a container. There it is. That's the annotation.

Again, it doesn't have to be called anything in particular, doesn't have to be called cleanup, but just the method of that you would like to invoke at that stage, and any other business methods that the bean would have. So the @PostConstruct and @PreDestroy, basically, are used to allocate, initialize any resources that you might wish that bean to use, or dispose and clean up these resources when the bean is about to be garbage collected, when it's marked as ready to be scrapped.

Now let's take a look at the stateful session bean life cycle. @PostConstruct and @PreDestroy, identical. I wouldn't repeat that whole story because it works the same way. But stateful session bean has an additional state, which actually you may turn off with passivation capable faults attribute. But default is true. Passivation capable by default is true. You don't really need to say that. And what it means is that you allow the instance of a stateful session bean to be swapped, as in take it from RAM and dump it somewhere and then restore it back from storage back to memory.

Why would you want to do that? Because stateful session beans are linked to specific clients. If that client is inactive, a server still has to keep the stateful session bean in memory. That's resource-consuming. That's a drag on your resources. So you can swap it out of memory if the client is not currently using that bean.

With stateless, there wasn't a problem. The stateless session bean can be recycled for another client instantaneously. All the clients use the same instances of stateless session beans concurrently. That's fine. But with stateful, the problem would be that you will keep unused bean and memory for as long as the client still has a connection, even though the client might not be currently doing anything with that bean. And hence, you're risking running out of RAM.

So if you have too many concurrent clients, too many stateful session bean instances, you may wish to swap them out of memory. If you want to do anything at the point when you swap in the bean from RAM, called @PrePassivate method-- there you go. And when you restore, you need @PostActivate. So @PrePassivate and @PostActivate pair of methods.

And one more thing-- a client can explicitly request the server to terminate the stateful session bean, remove it. The client doesn't want that bean anymore. Of course, with stateless it wouldn't make any sense because the client has no link to specific instance of a stateless session bean. So the client simply just stops using stateless session bean. It is then used by another client. That's fine.

But with stateful, the bean is stealing memory until the client closes the connection. What if the client wants to keep the connection but doesn't want that stateful bean anymore? OK, well, remove method, I suppose. This is what you could do to tell the server to scrap that instance. Singleton, a third type of a session bean. Simply allocating one instance of the bean shared between all clients. @PostConstruct and @PreDestroy methods work just the same. Again, there's no difference there. The difference, I suppose, is that the bean is only initiated ever once.

Now, what if two clients simultaneously call that singleton? By default, only one of these clients will actually succeed in making the call. And a second caller will have to wait for the first client to complete the call. Because the default lock policy on the singleton is a write lock. That's a default. So singleton assumes that, potentially, concurrent client accessing the same instance may do it in a thread unsafe way. And they may corrupt some information if they concurrently try to update the bean.

If two concurrent clients read information from the bean but don't try to write anything to it, then it's pretty safe. They can read simultaneously as much as they like. So if you have an operation on a bean that you know is not modifying any data, it's just reading it, you can mark it with a read lock. And that will allow concurrent clients to simultaneously call that operation on a same instance in a thread safe way.

But nobody but you knows which operation is that. So the singleton, by default, implies that all methods should use the right annotation. If you don't put anything, that's the lock type write, that it's assumed by default just to make sure it's thread safe. And then if you feel like there are certain operations that're just reading information, mark them as read, and that will allow the concurrent callers to progress with simultaneous calls to these operations. Unless, of course, there is some concurrent caller that calls some other method that has a write lock on it. That will prevent everybody from accessing that instance at that point.

Now the callers will wait for the lock to be released. How long? That is controlled with an annotation called access timeout. By default, access timeout is indefinite. It's minus one. You may measure it at a specific interval of time, like in this case, five seconds. So kind of saying if there are a number of callers simultaneously accessing the singleton, then no caller would wait for longer than five seconds. And if that is the case, if somebody is queued to gain access to that instance for longer than that, they'll just receive an exception. If they manage to get access to that bean so other callers release their write locks, then they will succeed. It depends whenever the other callers manage to release the write locks within that five second interval or not.

Guess what happens if you set it to zero. Presumably you will disable concurrent calls from ever waiting, right? So if two callers simultaneously call that singleton with the write lock on it, one of them will just get in there straight ahead. But default remember is indefinite wait, minus one.

One more thing about singletons. They allow you to be started before anybody calls them. And to do that you can sort of eagerly initialize this singleton bean instance by placing startup annotation here. So that allows you to tell the container, as the application which contains that code is started, it should immediately load the singleton into memory. Otherwise, the bean is used when it's first injected somewhere, so when some other component uses the bean. That's when it will be loaded.

Enterprise JavaBeans may be invoked asynchronously. In this particular example, we're looking at an asynchronous operation on the Enterprise JavaBean, which is enabled with asynchronous annotation. So we're saying this is the Enterprise JavaBean capable of running asynchronous code. It could be a specific method, it could be the whole bean-- so in this particular case, whole bean.

There are two cases of asynchronous method calls. First case is when the method is void, doesn't need to return anything. Well in which case the invoker just calls the method and as the method executes whatever it's doing, that code is executed. The invoker simultaneously progresses to the next chunk of code. So these bits of code run in parallel. The invoker is not waiting for the reserve stock method to return. It's shoot and forget. The invoker calls it and immediately proceeds to the next line of code.

If the method returns the value, you need to return an object which is known as future. So there's an implementation class for the future, and that's async result. it's a wrapper. The way it works is when you call that method, when you call that method, you're get it back from that call that wrapper, that future object. Then the method does whatever it does and your code does whatever it does as invoker. These beats are running in parallel.

The contents inside a future object is initially empty. There is nothing inside. But at some stage, the method will get to the point when it actually forms the result. And when it forms the result, that creates the actual content, the result, inside the future object so you can retrieve it at a later point. If you call the future dot get at the point in time at which the bean hasn't yet produced the result, your get method will simply be waiting. It will be synchronously waiting for the get invoice method to produce your invoice.

But if you call get method, after a while, not immediately, but you are doing some other things and then you call the method get upon that future object, you give a chance to the get invoice method to create that invoice and eventually return it to you. So there you go. When you call the method get and a future which does contain the result, you just get the result. You call a method get before the future object has been populated with the result, oh, well, you'll just have to wait for this result to be produced. But it certainly gives an opportunity for invoker and for the bean to do things in parallel.

Another thing that we need to pick up from the earlier presentation is the management of transactions. We kind of started that topic in a Java Persistence API chapter, but we need to complete it with a discussion about how the transactions are managed in general, not just with regard to the JPA, but maybe with other things in Java. There are two approaches to transaction management-- that's bean management transactions, where you write the code that begins and ends transactions, or container manage transactions, or declarative approach, where you annotate your object as to how would you like the transactions to be performed. But you're not actually programmatically starting and ending transactions. You trust container to do it for you.

The transaction has some very important properties. We know them as ACID properties. Transaction has to be atomic, which means all the things done with a transaction are either completely done or completely undone. The transaction has to bring the system from one state to another, from one consistent state to another consistent state. That's the consistent property. Things that you do within the transactions are not visible to the outside world until the transaction is finished. So that's known as isolation. And finally, durable-- once you're committed or once you rolled back, once the transaction ends, whatever it ends in, the changes are made permanent. So you cannot really undo after you roll back, unless you do another transaction, I guess.

Programmatic approach-- well, that depends, you see. What we're doing in this PowerPoint, we have two examples. We have a CDI bean on the left hand side and an Enterprise JavaBean on right hand side. The CDI, by default, is using bean-managed transactions. And an Enterprise JavaBean, by default, is using container-managed transactions. Hence, if you want it to be bean, you have to switch it, transaction management bean. If you decide that you want to do bean-managed transactions, control transactions programmatically, inject user transaction object. Oh, if you're doing it from outside of Enterprise JavaBeans container at all, as in Java SE, actually, you can look up the transaction object to using JNDI. So there you go.

Now, what do you do with a user transaction object? Begin commit rollback. It's as simple as that. Begin the transaction and then end it in either a commit or rollback. That's it. It's pretty easy.

Now container-managed transactions. Vice versa. Enterprise JavaBeans, the default is container-managed, so you don't really need to say that. That's the default anyway. But CDI beans, you can actually make them transactional. I just have to annotate it. So the default for them is bean-managed, but they can be made container-managed.

With container-managed transactions, you don't call begin, commit, or rollback methods. Uh-uh. Container does it for you. If everything is hunky dory, and your code runs and everything is fine, the container commits. If you want a container to roll back, you may call the method set rollback only. So it's an-- you cannot call rollback. But you can ask container to roll back. So set rollback only tells the container you'd rather roll back, and contain it will do it for you.

Alternatively, on the CDI beans, actually you may designate a list of exceptions upon which you want to perform rollback. You may designate that certain exceptions shouldn't cause rollback and certain other exceptions should. So there you go. That's the idea. So you just throw the exception to do a rollback in that scenario. I suppose you could do the same thing with an Enterprise JavaBean, but then they have this convenient set rollback only method, so whichever you find more convenient, I guess.

You've noticed on the previous page-- I didn't comment there, but there were some transactional attributes placed on the page. So we're marking the beans and their materials with these transactional attributes. What do they mean? Well, it's actually this is a default for the Enterprise JavaBean required. That's the default for an Enterprise JavaBean. If you don't mark with anything, that's a sealed-- it's the annotation.

If the caller the calls your bean, invokes the bean-- the method and bean that has a required, which is the default transactional property, and the caller does not have a transaction, the caller hasn't started any transaction just yet, that's fine. The bean will start a transaction. If the caller has the transaction prior to making the call to the bean, the bean will join the transaction or the caller. So that's required.

Let's take a look at the next one, requires new. Similar to required, but a bean will start new transaction any way, even if the caller that calls it has an ongoing transaction. Let's take a look at the next one, not supported. The bean will refuse to join transaction of the caller if it exists. Just ignore it. Next one, supports. The bean will join the transaction of the caller if it exists, or be executed without transactional context if that's the case, if the caller called it with no transaction.

Mandatory. The bean will join the transaction of the caller, if there is one, or throw an exception if the caller calls the bean without establishing a transactional context prior to it. And finally, never. Opposite of mandatory. The bean will throw an exception if the caller has the transactional context, and will only agree to execute with no current ongoing transaction of the caller. That's the never option.

So you can say the whole bean or particular method into bean with these transactional attributes. As you've seen, it could be done for both CDIs and for Enterprise JavaBeans. And it just declaratively tells the container what you want to do, how do you want to start transactions or join existing ones, and its circumstances.

Another interesting feature-- do you remember, we talked about different CDI bean scopes. And I told you at that stage there more scopes than I can humanly cover because you can create custom ones. Anyway, well, there is one scope that you might be interested in. It's called transactionless code bean. Mm.

If you create a bean that's transactionally scoped, this is what's going to happen. You inject this bean. Say you inject it in here, this order, Inject it in order management. Order management is annotated with annotation stateless, which means it's a stateless session bean, right? OK. What's the stateless session bean default transactional attribute? Requires. Well, we make this particular method requires new, so definitely starts a new transaction. Good. So whoever calls complete order will actually start new transaction. Lovely.

Now, what else happens? We have another bean, also an Enterprise JavaBean, another stateless bean, invoice management. And we actually happen to inject the CDI bean called transaction scope, that order bean, we happen to inject it there as well. See what happens next. Whoever calls complete order method starts a new transaction. The complete order operates, does something with the order. OK, it was doing something there. And then it calls this method called issue invoice.

What's the transactional attribute of the issue invoice method? Not annotated, which means it's required. It joins the transaction of the caller. In other words, it's in the same transaction as complete order method. OK. When you call this ready for payment method, it is guaranteed it will be invoked on the same instance of the order as that instance that was here, and calculate total. Because order was transactionally scoped.

If that invoice management will be in another transaction, it will be another instance of order. But it's in the same transaction, so it is the same instance of order. Did I pass an order as an argument? Nope I just use an annotation. Interesting approach. Isn't it? You're asking container to figure out which instance of the order bean to inject in these two Enterprise JavaBeans. And container figures it out for you, purely based on the fact that it happen to be in the same transaction. Ta-da. Actually, I think it's a very good example of using the CDI bean outside of the web container. It's purely an Enterprise JavaBeans example in this case.

## 2. Implementing Business Logic by Using EJBs: Timers - 17m

Now let's talk about another feature of Enterprise Java Beans container, and that's timers. You could attach timers to different types of your beans. You could do it with stateless beans. You can do it with singletons. You can actually do it with message-driven beans. Well, that's for backward compatibility reasons. The old 2.1 Entity beans, but we're not using them anymore.

So timers allow you to execute your code based on a time, a schedule, a particular point in time. It could be reoccurring event. It could be one-off event. So a certain point or points in time when you want to run your code. The timers by default are stateful, but you can make them stateless. Stateful timer means that if your server is shut and then restarted, the timer is used. Say at last timer, your server shuts down. The timer is lost. So you're not resuming them. Default is stateful, but you could play around with the timers and make them either way you want.

Now, there are two ways of configuring timers. You may configure a timer with a method called timeout. Mark one method in your bean with annotation timeout, just one. Then inject TimerService, create the timer. Well, here we'll specify when it will go off. There's more to it. There are parameters there. We'll discuss them in a moment.

So we could configure specific properties when the timer should go off. And then you have this timeout method which will be executed when that timer will expire. This is called a programmatic timer. There's another type of timer which is called automatic timer. If I will be a person who would formulate the timers standard, I would never call it automatic. I will call it, as in any other API, declarative.

You always have this programmatic versus declarative. But for some mysterious reasons, the standard that describes timers, instead of the word "declarative" uses the word "automatic." Don't ask me. I can't comprehend it either. So anyway, you're basically creating a timer by using schedule annotations.

You're just defining against a particular method or number of methods in the bean. When do you want these methods to be executed? So build up the schedule with different expressions. I suppose this automatic or declarative timer is probably our more flexible approach.

First of all, because you're not restricted to a single method end bean. You can have multiple methods there. And then you can build all sorts of schedules. And it's very easy to do through the annotation. But if you want to create programmatic timers, sure you can. So I guess it's when you want to dynamically set up that timer object. That's the benefit of it. Unfortunately, you'll be restricted to just one timeout method in that case.

Timer methods must be void. Must not return values. They may take Timer object as an argument, but it's actually optional. You don't have to. It's up to you. If you want further control of the timer, then you accept Timer object as an argument. But then again.

Expressions. They might be used in the programmatic timer creation. They might be used in schedule annotation. They might be used, actually, in the EJB JAR XML as part of your deployment descriptor. And there's lots of examples here. There could be specific points in time. Could be days of the week. There could be days of the month.

I don't know. Let's say minus seven. Negative number. What does that mean? Well, it means seven days from the end of the month. So you're counting not from the beginning but from the end. Anyway, so there's quite a few different annotations.

This is the default, by the way. If you don't specify a particular second or minute or hour, what it would be by default. And there's also wildcards. If you use a wildcard, that basically means-- for example, if you say 15 minutes, that means execute it at 15 minutes past 1:00, for example. If you say star 15, means execute every 15 minutes. So that's a repeating event in that case. So it will be executed at, let's say, 15 past 1:00, and then half past 1:00, and 45 past 1:00, et cetera, et cetera. And possibly on the next hour, depending what the hour says.

How to construct programmatic timer. So there's all sorts of different types of timers you can create. Calendars, intervals, single actions. There's generic createTimer method. So you construct it with a schedule expression. There it is. And just build up this. In this particular case, it says every 30th second every 10 minutes of every hour. So piece of code will be executed periodically on the 30th second of every 10th minute.

And then you create a timer. And because that's a programmatic timer, the method that's annotated with Timeout annotation is going to be invoked. If you want to control the time of persistency, that setPersistent true/false method could be used to turn persistency off if needed.

Automatic or declarative timer. That's done with a schedule annotation. You can build multiple schedules in one go. So schedules. Actually, you can make them transient as well. Persistent equals false. So that switches off a particular timer's persistency. In this particular case, what is it saying? Every hour, every minute, every 10 seconds. Another one, every 45 seconds.

How about this one? Every 15 minutes between 9 o'clock in the morning and 5 o'clock in the evening. There you go. Info is any serializable object. It's optional. If you want to associate any serialized object with a timer, you could just put whatever you like there.

Finally, controlling timers. Timer service, which remember, you can just inject. It has method to get all the timers. What's the difference between get all timers and get timers? Get timers returns the timers that are for this bean. All timers returns the all timers, for all beans. Anyway, so you can iterate with a collection of timers.

And then you can get a handler for each timer, get info, that serializable object for each dimer, get where is the next timeout, get time remaining till the next timeout, or even cancel the timer altogether. So you can programmatically cancel them out if you feel like it. There you go.

And next part of this chapter talks about interceptors. So we over with timers. We off to interceptors. Interceptor is a piece of code you would like to run before, after, or around a call to a CDI or an Enterprise Java bean. Interceptor is transparent to the invoker. A caller is calling the bean, not the interceptor.

A caller is calling the bean. An interceptor behind the scenes hijacks the call, and it allows you to put a bit of code before you call that bean, a bit of code after you call that bean. The call to the bean is controlled by the interceptor with a simple method called proceed. Calling the proceed method means that you're asking the interceptor go to the next interceptor in line and eventually go to the bean. Make that progression.

Whatever you put before you call the proceed method into the interceptor will be the code that is invoked. Prior to that point, whatever you put after the proceed method will be whatever the code you invoked after the bean has been executed. Interceptors could contain code that you don't want to put into specific bean. Anything that you feel like you want to be generic or apply to multiple beans, any routine, reusable, repeated code fragments-- I don't know, logging, auditing, security aspects. Whatever you want, code that caters for multiple different CDI or Enterprise Java beans components.

Actually could be intercepting timeout calls, by the way. See that around timeout? Could do that. Absolutely.

Lastly, these methods such as around timeout and around invoke, you can put them directly into the bean. You can. But if you want them to be really reusable, you probably want to put them in a separate class. So in this case, you mark this class as an interceptor. How do you establish an interceptor's order?

Somebody calls the bean, and then interceptors hijack the call. But what is the order in which they invoked? There are interceptors that are applied not by you, you see. They're interceptors that are applied by Java EE container. So they have their own order, and this order is controlled by the integer priority number.

So you would not accidentally mess about the interceptors provided by container and accidentally step into their sequence. You're given a constant, which is called application priority, which is basically a number. But this number is guaranteed to be after the container number. It's later than whatever container interceptors.

So you allow the container to do its thing, and then you're saying, OK, well, I've written some additional interceptors, and then you just control them by adding whatever number to the application priority. Plus 1, plus 2, plus 3. That orders them. There you go. So any kind of generic code you want to apply to a number of different beans, you can hijack the calls to them and put that code into interceptors.

You can intercept lifecycle methods as well. Remember the PostConstruct, PreDestroy? So you can intercept these calls as well. Invocations of constructor, AroundConstruct method. Intercept the call to the constructor of the class. So these are lifecycle interceptors. Oh, and optionally if you feel like it, an interceptor method has this ability.

I really should highlight that ability. What will happen if you not invoke the proceed method? Not just lifecycle, any interceptor method. What's going to happen? You're not progressing to the next interceptor in a chain. You're not progressing to the bean. So if you're not calling proceed in AroundConstruct, would you have to construct the bean? No.

That's what happens if you don't call proceed. It may be a conscious decision. For example, interceptor is doing something which prevents the bean from being created, or prevents the method from running. I don't know. Maybe there's some security aspect. You check in some security and you're saying, no. If that security check fails, don't proceed. Why not? You could certainly use interceptor to prohibit the call to the bean.

Interceptors could be there applied to your classes. You can apply them on a class level. You can apply them on a method level. You can exclude them. So result is that for the operation x, interceptors A, B, C, D will be applied. In whichever order, I don't know. We need to look at the priority annotation on them. So priority property defines the order. At least some order.

And on operation Y, only A and B interceptors are applied. And operation Z, no interceptors are applied because you've just excluded them. There you go. So it's easy to control.

And that's it for this particular session. So we've looked at what are the session bean types, how to define their methods, how to expose them to clients using a variety of interfaces-- remote, law, code, even web service. That operations could be synchronous and asynchronous. That you can participate in transactions. That you can run methods based on timers. That you can apply interceptors. And of course, manage the bean's lifecycle.

In the practice for this particular session, you're going to create an Enterprise Java bean which will be a stateless session bean containing business logic methods and behind the scenes manage your product. That product is the same JPA code that you've created in an earlier exercise. It's just this time you will be running in the Java EE environment rather than Java SE environment.

We are going to expose this code through a remote interface to the Java client. So we'll be actually calling that bean remotely from the client. And that's another task. We'll have to write that client.

Then you will be asked to create another Enterprise Java bean which will be a singleton which will contain a timer. We'll be checking for products. They're about to expire. So those that have an expiry date, best before date tomorrow. And then if they are about to expire, well, we'll raise an event about it. What we're going to do when they will expire, we'll actually continue that particular theme in later exercises. So there will be more logic attached to that particular code later on.

But anyway, first we need to just trigger that event and see what happens if the timer is triggered. Oh, and one more thing that you'll do in the practice. You will have an interaction between a pair of beans and a server. The singleton will be calling ProductFacade. Just a local call between these beans.

## 3. Practice 4-1: Creating an EJB Module - 25m

Let's take a look at a practice exercise for lesson 4. During this practice, we will construct a Java EE application code that will deploy into the WebLogic Server, that will work on same JPA objects as the Java SE application that you've created during lesson's 3 exercise. However, this time we're going to use this JPA entities and net code from the Java EE container. So we will create a Stateless Session Bean-- it's ProductFacade-- that will handle the JPA product entity, that will use exactly the same entity, exactly same converter.

So-- and then, we also modify the product manager class because it was previously used to locally manage persistency within the client tier, but this time the product manager will act as a kind of a proxy, to help the clients to access a remote ProductFacade Enterprise JavaBean.

Later in this exercise, in a later part of it, we'll also create an ExpiringProduct Singleton Enterprise JavaBean, which we'll use as a controller for the timer, to make sure we can handle the products that are just about to expire.

So we kind of migrate the code from the client to the Java EE server-- that's where the JPAs would be-- and we'll create some Enterprise JavaBeans around them, and we'll change the product manager to operate with remote Enterprise JavaBeans, instead of just local JPA objects.

Let's start with the practice for part 1, in which we will need to create an Enterprise JavaBeans module.

In order for you not to have to migrate the JPA code from product client into the Java EE environment, in order for you not to have to copy the files yourselves, pre-coded project is already supplied. So you can just open that project. It's comprised of two parts, which is the ProductApp and ProductApp-client. And there's also, inside of ProductApp, app there will be Enterprise JavaBeans module product, ProductApp-ejb, that will contain our future Enterprise JavaBeans.

So that's where you need to start. You just need to open these projects. Let's go to NetBeans, and open ProductApp, ProductApp-client, from-- make sure you use correct folder-- home or collapse projects. Yeah?

So these two, and tick the box, open required projects. Go ahead, open them. So that's in addition to your ProductClient project that you used so far.

Now, let's just study what's going on. So this ProductApp is your future Enterprise JavaBean application that will contain the ProductApp-ejb.jar file inside. So the ProductApp itself will represent an EAR file, and the ProductApp-ejb.jar will represent an Enterprise Java Beans module, residing in that EAR file. That's the actual project that will contain that Enterprise Java Beans module. And that's the project that will represent a remote client that will call that Enterprise Java Bean.

Very quickly, let's just take a look at what you got in there. So that ProductApp-client-- what you got inside? You've got ProductClient class, but it contains all of that code that you've written in a previous lab, which is currently just commented out. So we're not using that code anymore. Otherwise, it's the same class as you've written in a previous exercise.

And you have ProductManager. And this time, the ProductManager has been sort of resetted because instead of working with an entity manager locally, we would like to put here code that will invoke an Enterprise Java Bean remotely. Otherwise, the structure of the ProductManager class remains absolutely the same as it was in a previous exercise, exactly same, except it's not now designed to manage JPAs locally, but we will write here code to make it call remote Enterprise Java Bean.

What about the-- so let's close these files for now. What about this Enterprise JavaBeans project? What's there?

OK, so we've got same ValidationMessages.properties file. That just copied from the previous project. And then we've got the same Product entity, exactly same, no changes at all, it's exactly how it was, and a DateConverter exactly how it was, so no changes there at all whatsoever.

OK. So that's the starting point. We kind of took the code, part of the code that we've created in Java SE environment, and we primed it to be used in Java EE environment. But we haven't yet created any Enterprise Java Beans, so that's our next thing that we need to do.

OK, so we open these projects. But the notes in the manual pretty much explain what I've just told you. Yeah?

Oh, also, if you look there, you'll find the persistence.xml file, as well, because obviously we're managing entities. So-- so yeah-- so that's part of your configuration.

There you go, persistence.xml file, and you could see a source code for it if you like. And notice the difference. It's a JTA transaction type. Yeah? And remember, in a product client, before, if we look at the META-INF of the product client, and compare the old sort of version of that file we use in previous exercise, it was RESOURCE-LOCAL.

We also used our own JDBC connection properties in a previous exercise. And then this exercise, the persistence.xml, simply references the data source. Remember, you created that data source in a practice for lesson 2 as part of the configuration of the WebLogic server. So you just reference in that data source.

Right. So that explains sort of a starting point for your exercise. Now, let's go ahead and create ourselves an Enterprise JavaBean type of Session Bean inside a ProductApp-ejb project. Make sure you select the ProductApp-ejb project first, just in case, so you wouldn't accidentally do it in the wrong project, right? And then you are ready to create a new-- a new Enterprise JavaBean object. So select Enterprise JavaBeans, select Session Bean, click Next.

Now, what do you want this Bean to be? Right? How do you want it to be configured?

Well, let's take a look. We'll call it ProductFacade, and we would like it to be in a package demos.model, and we would like it to be stateless. OK. Well, that's what we'll do.

OK, demos.model, and it should be stateless.

OK, so it's pretty straightforward. Once you fill in dialog, click Finish, and we will be ready to proceed modifying the Bean and creating some interfaces for it.

Now, here's an interesting thing. I know I haven't clicked Finish yet, but there is a reason for it. You're asked to create remote and local interfaces for the Bean. It says here, for training purposes, you're asked to do it step by step, manually, because technically speaking, you could have just ticked these boxes.

But there is a reason we'd like to understand how that's done better. So we don't trust NetBeans Wizard to do it for us. We'll do it ourselves, right? So that's why these boxes are not ticked. Just Finish and then we'll add the remote and local interfaces to that Bean ourselves.

So at the moment, it's just a local Bean. Yeah? A way of calling it is simply for a local invocation, which is fine. Let it be the local Bean. We can just add other interfaces, as necessary, to it.

Anyway, so what are these other interfaces? What we need to do is create a Java interface in this project that will represent a remote interface. So we'll call it ProductFacadeRemote. Yeah? OK, why not?

New, Java Interface, ProductFacadeRemote, and demos.model is where you want it to create it. Nice.

So that's your remote interface. What shall we do with that remote interface?

OK. Well, we'll add some methods to it. First of all, we'll annotate it as remote interface, of course. Yeah? So let's do that. We want it to properly tell that it's remote interface. Make sure we add it to the javax.ejb.Remote import.

And then we add some business methods to this interface. There they are. These methods are going to represent the create, update, delete, find actions. Make sure you fix imports. All right. That should be java.util.List, of course. OK, so make sure you've got correct imports, and click OK.

OK, so we represented, in this interface, capabilities of create, and update, and delete and findProducts. Nice. What next?

Well, I suppose we need to make sure that the Bean, that ProductFacade, actually implements that interface. So let's add the implements interface clause to the ProductFacade Bean. Lovely.

And now, of course, we need to implement all abstract methods of that Bean. Of course, the bodies for these methods need to be provided properly. But at least we've got method signatures in place, so we override methods create, update, delete, find, well, whatever they are. Lovely.

So we've made our modifications. Dummy code was added to our application.

Now, inject Persistence Context object to initialize the EntityManager, OK, right inside of ProductFacade. Ensure correct initialization of the EntityManager. Fixing ports, format code, there you go. This is the name of the persistence unit we're looking for that's in our persistence.xml file.

And unlike the earlier client project where we had to use the factory class to manufacture the instance of EntityManager, because now we're in a Java EE environment, we could simply use the injection of Persistence Context object to initialize the EntityManager.

Done. Next.

Start replacing bodies for these methods. It should be persist, merge. So create method should use the assist. Update method should use merge. Delete method should use delete. So remove-- remove functionalities of EntityManager.

So just keep going through all of these methods, persist, merge, remove. And then with the-- with the method which is doing the findProduct, you're returning a single product just by looking at its primary key.

And the method that queries multiple products, this one should use the name query, OK, named query. It's exactly same named query we used so far in the previous exercise, looking for products by their names.

javax.persistence.Query import needs to be added. OK, reformat the code. There you go. So using the name, find product by name, run the query, return a result. Oh, it's a list of results actually.

Now, there's another interesting thing that we would like to do. Our Enterprise JavaBean has a local Bean annotation. It's already in place. We created that Bean that way. Remember? Yeah? We didn't tick the boxes, remote and local interfaces. So by default, it came up with this local Bean annotation.

What if we would like to add some methods to that Bean that will not be remotely invocable? For whatever reason, doesn't matter-- just we want a method that will call locally but not remotely. There you go. That would be such a method.

So let's just start another operation here. Make sure, again, you sorted out the import of java.time.LocalDate because that's our parameter in the method. And we'll add some implementation code to this method in a moment.

This method is not declared by the product remote interface. It's not one of these. Therefore, this particular operation is not remotely invocable. But is still callable locally from maybe other Enterprise JavaBeans, or other components, that reside within a Java EE server.

That particular method-- this is the implementation for it. What we would like to do is to run a query inside this method, which this query should use the findByBestBefore date. Yeah? So we're looking for products with specific best before dates, OK, and returning the list of these products. OK.

Just to remind us, that was the query here, findByBestBefore. We've declared it already. OK.

What else we want to do with that? Another method, which we'll call findTotal, also, essentially, only locally callable upon that ProductFacade Bean, because it's not declared in a remote interface. So that will be only locally callable. So that will be findTotal method.

Next, the findTotal method is going to use a named query, which is called findTotal. It was one of the queries we created during the practice 3. Let me show you that in a moment. I will also set a parameter for it, which is the list of product IDs.

So I'll put that query in place, and add the product IDs parameter. There you go. Add in that. And then finally, execute the query to return the collection object array here.

Now, let me explain what's going on with that query, because it's rather interesting, really. So format that code and comment on what's going on.

This query, called Product.FindTotal, what's that? It's one of the queries we've added to our code earlier, Product.FindTotal. It selects, not an entity like other queries, but it selects specific attributes.

So back you are getting, from that query, not one entity object, or collection of entities, but you are getting two values, how many products you found, counter, and a total sum. And parameter is collection of product IDs. So how many products you found and total sum.

And because you are getting not one value, but two, that's why the result is an object array when you are getting the result. It's a single record, all right, you're just getting two numbers. It's one record, two numbers inside. So the total result list is just one record, but there are two values within it. So that's why this line of code is ever so slightly different from what you've seen previously.

All right. So these are the operations that are not exposed to remote colors. We will use them locally a little later in this exercise.

Now, add another business method to the ProductFacade to validate product objects.

This is just-- this is just to show you, to demonstrate, that a validation doesn't have to occur as part of your transactional behavior. I mean, it certainly can. But-- so make sure you fix the imports. It certainly can. But you see, in this particular case, I'm actually not even doing anything with the product.

If I pass the product as an argument to that method, the method is not in any transactional context. It will switch the transactional context off, so passing a product to the method just to validate it. Maybe you want to do something with a product, or not, doesn't matter, but what this method allows you to do is validate the product not when you are trying to do create, update, or delete, which you certainly can.

Remember, the create, update, and delete methods create and update anyway. Create and update already have a valid annotation on them, so they check on if the product is valid or not. But what if you just want to check if the product is valid just because? So certainly, you can. And it doesn't have to be part of any ongoing transaction at all.

So I suppose the last step of this exercise that we've executed here shows us that the Bean validation API could be used on its own, not necessarily with JPA, but just anywhere else you want to use it in your program.

What remains to be done in this exercise is compilation. You need to compile the project with the Clean and Build. So just go ahead and do the Clean and Build. There you go. So that's done.

And then deploy that project to your Java EE server. So make sure it deploys.

OK. Let's give it a try. So how do you deploy that? You need to deploy not ProductApp-ejb. No, no, no. You need to deploy ProductApp. That contains the relevant ejb module inside, remember. It's an EAR file containing the relevant Enterprise JavaBean archive. So we're deploying that EAR file to the server.

So that concludes practice 4 part 1. Once that deployment successfully completes, make sure that your application is properly deployed. Wait for a success message.

If you want to check what's going on on a WebLogic server, you can go from the deployment to the WebLogic server tab, because if the server throws you any exceptions during the deployment, you may wish to see them here, well, if you had any problems at that stage.

Now, we haven't yet created a program part that calls that Enterprise JavaBean. That will come as a next exercise. After that, we'll be able to do further tests. But that concludes the part 1 of this practice.

## 4. Practice 4-2: Creating an EJB Client - 9m

Let's take a look at practice 4, part 2. In this part of the practice we're creating a client that would invoke our Enterprise JavaBean-- so the Enterprise JavaBean that we've created, ProductFacade bean, that we've created in a previous lab.

So what we need to do is go to the ProductApp-client project, and open the ProductManager class. Let's start by adding their logger. So go to ProductApp-client project, find the ProductManager class, and set up the logger. OK, make sure you've got correct import statements-- so import java.util.logging.Logger.

Next, we need to reference that ProductFacadeRemote interface, so prepare a variable for it. Done, ProductFacadeRemote. Next, we need to add a code to the constructor of the ProductManager to perform an actual JDNI lookup to find that ProductFacade.

So that's the constructor, try-catch block, where we're looking for that product-- ProductFacade Enterprise JavaBean. OK, so initialize the remote Enterprise JavaBean here. Reformat the code. Make sure you've got all the correct imports. And you need the Context to javax.naming.Context, and logging.Level, and InitialContext objects. So they were imported.

This concordination is not really necessary. It's just because the line of code didn't fit in a PDF file to the line of code, so really it's just one string here-- the lookup. So the carriage returns are simply placed in a PDF so the code will be correctly copy-pastable. But you may remove them if you don't want them.

So that's your initialization code for looking up the remote Enterprise JavaBean object, remote interface of it.

And then we'll initialize the ProductFacade reference. So that's a constructor of ProductManager. Make sure the imports are in place. Now, for each one of the methods of the product manager, we need to simply propagate the call to the ProductFacade. Make sure the create, update, delete, and find methods invoke their remote counterparts.

So create method, invoking create upon ProductManager. Update method, invoking update on the ProductManager. So these are all of your remote operations. So that would be invoking delete method.

The local class product boundary simply is acting as a proxy for the remote Enterprise JavaBean. So that's finding a product, propagating the call to find product method. And finally, finding product with a product name, looking for product with a specific name.

Now that's right about here. Done. So we're propagating calls from the client to the server to that Enterprise JavaBean remote interface.

Now we need to create a jndi.properties file. So what we need to do, create new property file. Let's do that. In the ProductApp-client project-- make sure that's the correct project you've selected-- create new, Other, Properties File, jndi.properties-- that's the file name. And make sure you place it in sources folder, src folder. So select Folder, sources. That's it.

So that puts this file into the root of your class path. That's where it will eventually be. Sorry, I've made a typo in the file name-- jndi, Java Naming and Directory Interface. That's much better. Create the file.

This file should contain properties-- there's actually a copy of that file provided with Resources folder, so you can take the properties from there, or you could copy them from the manual, whatever. These are the name-value pairs properties that you need to put in a file. That's it.

So what these properties are, they tell the client how to connect to the remote server. So that ProductManager, when it's making the Java Name and Directory Interface lookup-- when it's creating a new instance of InitialContext object-- at that point, this jndi.properties file is picked up by the InitialContext to initialize the connection for the server. Sorted, next.

Now in the ProductApp-client project, open the ProductClient class, and inside the try block there, instantiate that ProductManager. So our commandline client, in a ProductApp-client, class ProductClient-- that's the one-- here in a try block, instantiate ProductManager. So that will act as a proxy through which this client can access a remote Enterprise JavaBean.

That's it. Make sure you compile that project. And that concludes this part of the exercise-- exercise 4, part 2-- where we prepared our client to invoke an Enterprise JavaBean. Just make sure the compilation succeeds, and we'll be able to progress to the next exercise. We'll be actually writing here, code, to test that interaction with remote Enterprise JavaBean.

## 5. Practice 4-3: Testing the EJB Client - 5m

Now let's take a look at Practice 4 Part 3. In this practice, we're going to add code to the ProductClient to invoke an actual Enterprise JavaBean and test its functionalities. We'll start by simply querying the product.

Actually, the relevant code is already in place, because it's exactly the same as the code you've used in an earlier exercise. It's just that, in Practice 3, that code was calling ProductManager class, which was doing the whole management locally. And now, the ProductManager is transporting the code to remote Enterprise JavaBean. So if you run that code, the query will be executed by the remote Enterprise JavaBean, and the ProductManager will return you that result, which is what you observe here.

OK, so that's our first test, simply uncomment relevant part of the code. It's exactly the same code as you've written in Practice 3, so there's no point writing it again. Comment out previous step. Uncomment the next step, which is querying a number of products. See how that goes-- control slash, comment, uncomment.

And well, let's just run that now. So it's finding all products that start with the letters C-O. Fine, works as well, so you're running that. Next let's try to do the update of the product. Again, just uncomment the code. Comment that. Uncomment the update.

See if you'll be able to successfully update the product. Just keep clicking Run button. There you go. Yeah, we've updated it.

If you want to make sure that that is actually your currently-updated value, you can always go to the Services tab and View Data within that products table. And yeah, that's that cookie product that we just updated a moment ago. OK, so verifying that through the SQL console.

Now let's produce an error. Let's go back to our code and modify it so that it will cause constraint violations. Go back to the code. Change the price. Change the name. OK, you can rebuild that project if you like or just run. Hit the Run button or right mouse button and click Run File.

So there you go, see? These are our error messages that arrive from the server. The ProductApp client does not contain the necessary resource bundles or validation constraints. Everything is on the server tier within Enterprise JavaBean that basically throws us exceptions and then constraint violations.

And then here, we are deciphering, if that's a constraint violation, then we are logging these messages on the client. So we have rigged it to fail. I suppose that's pretty much it. Optionally, if you have time, you may repeat the same example as you did before with optimistic lock. It's exact like you did in Practice 3 Part 3.

And anyway, if you want to check that particular code, there it is. Yeah, so you can always uncomment that and rig the process to fail with optimistic lock exception, just to test, but it will give you exactly the same result as in Exercise 3, anyway. That concludes Lesson 4 Part 3 Exercise.

## 6. Practice 4-4: Creating an EJB Timer - 9m

Now, let's take a look at a Practice 4, part 4. In this part of the exercise, we're creating a singleton Enterprise JavaBean and would like methods of that bean to be triggered by timer expressions. So, we'll start by selecting ProductApp-ejb and creating an Enterprise JavaBean which will be that timer session bean of ours. So ProductApp-ejb project, New, Enterprise JavaBeans, timer bean that we'll want to create. Click Next.

Now, what are the properties of the timer bean that we need to specify? Well, the name of the bean will be ExpiringProduct. The package, demos model. We form it as a singleton. And at the moment, we deselect the expose timer method into interface checkbox. So we deselect that. And as for the other details, we're going to fill them in as we start editing the bean. So let's create the bean. ExpiringProduct, demos model, singleton, don't expose timer methods into interfaces. So, once you've finished that up, click on Finish, and we'll be ready to proceed to the next part.

So that's our bit, the bean. Singleton bean. Now, in this bean, we'd like to add a logger to it, as usual, so we'll be able to write some log messages. Let's go and add a logger. Sort out the import statement, java.util.logging.Logger. Inject into this bean a ProductFacade bean. So another interesting thing that we're doing this exercise, we'll make these two beans talk to each other. ProductFacade.

Notice, we don't need to do any kind of Java name indirect interface lookups. We can just do the simple injection. And we're not using remote interface of the ProductFacade. We'll treat it just as local bean. One Enterprise JavaBean talking to another Enterprise JavaBean with the same container don't really require the interface. They can just be both local beans talking to one another.

There is a method in this bean called myTimer. Let's give it a better name. Call it handleExpiringProducts. So myTimer is not exciting, yeah? handleExpiringProducts is probably a better name. Now, what we're going to do inside this method is we're going to invoke the operation upon the ProductFacade, which is the other Enterprise JavaBean we've got, which is called findByProductDate. And we will be looking for those products whose due date-- best before date. Whose best before date is just about to expire. So make sure you sorted out your imports. And due date is just about to expire, which means today plus one day. So they will expire tomorrow, basically.

For now, for a moment, let's just simply iterate through the collection of these products and log them, write them to the log. A more realistic logic will be added to it in the next chapter's exercise. So for now, just write down which products you found. So simple iteration through the collection of products that we retrieve from this operation. A more realistic logic will be added later.

Now, what we need to figure out is the point at which this timer expires. Take a note of the current time on a computer on which you're running this code. So for example, at the moment, it says here 8:30 PM. It's not even my local time, so be careful. It's that local time of the time zone where your remote desktop is actually sitting, because it could be across the globe anywhere. Right, so note that time. Instruct the schedule expression, which will be a little later than that time. Give yourself an opportunity to deploy that code, so a few minutes to actually deploy that code.

So we'll copy the schedule expression, put it into here. So that's my schedule expression. And then, fix the time. So that will be 8:00 PM, and then let's make it 33 minutes. Well, just to be on the safe side. You could make it next minute, but you never know when you've crossed over from one minute to another. Clean and build that project. And then, deploy ProductApp on a server, ProductApp deploy. All right, so just wait for it to complete the deployment. And basically, you expect this handleExpiringProducts method to be triggered at 33 minutes past eight. Well, that's the time on that particular machine. Obviously, note your time when you're doing your lab and construct it from there.

You can always check what's going on on the WebLogic Server console. I'm afraid you'll have to wait for a minute for results to emerge here, because it says the minute is 33. So we can give ourselves some time. And just whilst we're waiting, I will very quickly flip back to the PDF file. That's precisely what you're asked to do, yeah? Make sure that you're running that code, deployed it on a server, and observed the output of the WebLogic Server console, where the bean will eventually log messages. Oh, well, there you go. It just appeared. Cookie. So this cookie's about to expire tomorrow.

I mean, if you want to see more messages like this, all you had to do is just make sure you set up [INAUDIBLE] the best before dates in a way that will cause them to be just about expiring time. So you can set the best before date for whichever one of these products to trigger that timer and to include that product in a list of queried products. OK, well, that concludes this particular exercise.

## 7. Skill Check: Implementing Business Logic by Using EJBs - Score 80% or higher to pass

Skill Check: Implementing Business Logic by Using EJBs

View Skill Check
