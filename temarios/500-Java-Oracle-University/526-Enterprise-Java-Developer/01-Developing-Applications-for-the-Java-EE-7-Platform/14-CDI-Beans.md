# 14: CDI Beans

1. CDI Beans - 17m

## 1. CDI Beans - 17m

Let's take a quick look at another appendix, which covers the use of CDI beans, more advanced CDI beans topics. The basics are pretty straightforward. You just declare the CDI bean with request scope, session scope, or whatever scoped annotation you need, and inject it where you wanted to. But there are some more advanced configuration cases where we need to observe. And that's precisely what this appendix is doing.

So we're looking at bean qualifiers, the use of the bean's xml file, the producers and disposer methods for CDI beans, how to define CDI beans interceptors, how to describe and define CDI bean events, and the use of stereotypes. So quite a few different things, which are all grouped as advanced CDI beans topics.

Well, let's start with the named qualifier. On the face of it, it's rather simple. You can just give an alias to ' bean, give it whatever name alias you like. And you typically use this alias, for example, in Java server pages with Java server faces expressions to avoid typing the class name every time.

But apparently, the qualifiers can be used in another way for another purpose. Here's an example. Imagine you've got a class order, which is extended by the class online order, and possibly store order. So parent class called order is extended with these two children.

Now, you decided you want to inject that order somewhere. You want to inject the order into some application. And there are two examples of injections here. From the object-oriented programming point of view, when you reference an object, it's generally considered to be a good idea to use parent type. Order is the parent for both store an online order, isn't it?

So generally, for polymorphism purposes, to support that flexibility in the application, it's generally recommended to use the parent type to declare these variables. But then the question is, which one of these orders are actually injecting? Is it the store order, or is it the online order? Yeah, OK, you could have just said inject me the online order directly, you could have. But that would mean that your variable becomes type of online order. What if you want it to be a generic type order?

Well, then the named annotation allows you to basically qualify which one of these orders do you want to inject. Then obviously, it works in a page as well when you're using it in expressions. So a named qualifier allows you to select correct subtype of the bean to inject into your code.

Next. You can also create custom qualifiers. Here's the custom qualifier. It's an annotation. You create your own annotation. Remember, to create an annotation, you use this at interface that is basically declaring an annotation. And this annotation is a qualifier. We want to retain it at runtime. We want to apply these two methods, fields, parameters, types, well, I don't know, wherever you want to apply to. That's where it will be applicable.

And then you are saying that there is some subtype of order that you mark with that qualifier. You're saying, this is an online order as opposed to some other order, which isn't. And when you do an injection, you can use generic type and that qualifier to select appropriate subtype. Obviously, you can create more qualifiers. You can create qualifiers for online order. You can create qualifiers for store order. What the idea is that it allows you to resolve, again, specific subtype that you want to inject into your code.

So this is really another way of achieving the same thing we have done with a named annotation. But presumably, this mechanic is a little bit more object-oriented. A name relied upon us typing the string name to determine which subtype we want to use. And here, we're actually using qualifier annotation to determine which subtype would use. So probably more geared towards the object-oriented approach.

Another example here, the use of alternative qualifier. And this one comes with the use of the beans xml. You mark the CDI bean with alternative annotation. And in the bean's xml file, you can control which one of these subtypes you are injecting into your application. The injection itself will simply use generic type. It will just inject order.

And the xml file will control is it the store order, or is it the online order, because you could basically mark it as alternative. So you can use as many subtypes as you like, repeat the use of alternative annotation, all these different subtypes. Well, I only put it on one of them. But obviously, you could put them on any other subtypes as well. And then select through the configuration file for the beans xml which exact subtype do you want to inject. Suppose it means that you're achieving a more flexible deployment where you don't have to modify the code of the application to select that type, but rather just make that decision on the level of the configuration file, beans xml.

There are certain guidelines, certain rules, that govern how CDI beans are instantiated. For once, for example, a CDI bean is supposed to have no argument constructor, parameterless constructor. But what if you've written the bean that breaks these rules? Or what if you've written a CDI bean that requires a more complex initialization? Or what if you want to select a subtype of which bean to inject specific subtype programmatically? Not through declaration, not through named annotation, nor through alternatives, but just through your code, dynamically decide which subtype do you want to inject.

So for all of these cases where the bean is more complex, where you want to have more complex initialization, when you want to programmatically, dynamically select specific bean subtype, you could use this technique called producers and disposers. Let's study what this example is doing. First of all, I created an enum, online and store. So that would be the selector for my two subtypes representing the online and store orders.

Then I've created a type qualifier called order type qualifier. And I would then have a value method here, which associates that qualifier with the enum. So when I use the order type qualifier, it allows me to parameterize that with the enum online or store value.

Next, I create an order factory class. This class will manufacture instances of the order CDI bean. And to create such instances, I create producer methods. A producer method is annotated with the type qualifier, indicating either online or store type. And inside the method, guess what, I create the instance of either online or store order matching that type that I've indicated on a method.

You could also create a disposing method. For example, if you need to perform some kind of a cleanup when you stopped using the bean-- that's optional-- you may wish to do the cleanup if necessary. The producers and disposers, our annotations, are controlling the purpose of these methods. So you could basically say, I'm disposing of that order.

Well, lastly, how the injection is going to work? When you inject that order, you use the type qualifier, and you indicate which one of them you need. Is that online, or is it store? And note, the variable type is just generic super type. It's just order. The factory is automatically producing you the relevant instance of that order, irrelevant subtype, which is what you indicate with the type qualifier.

There you go. So we're making a more flexible injection here. And we potentially could also do more complex constructors, let's say more parameters in these constructors. And if we require some clear up at the end, we could have some extra business methods to perform this cleanup like closure of the order, well, whatever it is. OK.

The next interesting coding technique regarding CDI beans is interceptors. An interceptor could be used to perform tasks that you don't want to code into every CDI bean, but you'd rather code once, and then attach this functionality to a variety of CDI beans of yours. It might be that you would like to attach that functionality to business methods of your beans, in which case you use the around invoke annotation. Or it might be that you would like to attach the functionalities to life cycle methods of your beans. So there you go.

In this particular example, we develop some kind of custom annotation called logging. We associate that annotation with an interceptor. This is an interceptor. This interceptor, you could control its priority. That's the order in which interceptors are applied. There's a system priority, which is used by the container itself. And then there's obviously-- after the container priority-- there is an application priority.

So it's a simple number. You can just add plus 1, plus 2, plus 3 to control the order in which interceptors are applied. And then you were writing your AroundInvoke. Well, in this case, AroundInvoke, which is intercepting business methods, a method that has a parameter over invocation context. And then you do whatever you want to do before or after you've made a call to a next interceptor in a chain. The proceed method does that.

And eventually, proceed method will proceed to the actual method of the bean. To apply this interceptor to your program, all you need to do is use logging annotation, which is what this interceptor was associated with. So literally, what's happening here is that you have your method here at product. And the user, or what have it, calls the method at product. But in fact, the interceptor will do some logging around it as well. That's what will happen when you will apply it to this operation.

And now the interesting technique you could use with CDI beans would be to fire and subscribe to listen to CDI events. So bean can fire an event. And now the bean can subscribe to the event. Now, this page shows us how this could be done. So we have the CDI been here, which injects some event. The product is just a custom parameter for that event. So you want to observe things that happen with a product. To fire that event, all you need to do is invoke the method fire, and pass the relevant object-- in this case product object-- as an argument.

Any other CDI bean that wants to know what happens to the product could simply have a method, which has a product as an argument, and the annotation called observes. That's it. Magic. It will be subscribed to listen to any other bean firing the event that contains the product. Its all you need to do. It's quite easy.

So also, you could use events with custom qualifiers. So whatever we've previously discussed in this chapter still applies. So you can do this more complex selection of types of beans you would like to use, fire the events, observe these events. There you go.

Lastly, stereotypes idea. It's actually quite simple. A stereotype is an annotation comprised of other annotations. If you want to write a CDI bean which uses annotation alternative, which is using the annotation or request scoped, which is using whatever annotations you want, you can create your own annotation, mark that custom annotation of yours, stereotype, and be done with it. Instead of repeating over and over again all other annotations, just put that custom annotation in. And that does the trick.

So optionally, you could use a named annotation, alternative annotations, it could use interceptor bindings, anything you like. Any annotations, group them together, and just use as one simple annotation of yours. Custom is not a keyword. It's just really your name, whatever you'd like your annotation to be called. That is it. I suppose that concludes the topic of the more advanced features of CDI beans.
