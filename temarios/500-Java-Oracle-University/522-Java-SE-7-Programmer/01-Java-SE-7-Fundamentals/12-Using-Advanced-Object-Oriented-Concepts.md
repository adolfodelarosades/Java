# 12: Using Advanced Object-Oriented Concepts

1. Using Advanced Object-Oriented Concepts - 55m
2. Practice Session 12-1 - 18m
3. Practice 12-1: Creating and Using Superclasses and Subclasses, Part 2 - 13m

## 1. Using Advanced Object-Oriented Concepts - 55m

After looking at the practices for lesson 11, let's go ahead now and take a look at lesson 12, which covers the advanced object-oriented concepts.

And by the way, we should not be getting, in this case, scared or paranoid just because we see the word "advanced." But it is just a bunch of other features that do help us understand the Java technology.

And in this particular lesson, we're going to look at describing inheritance, which by the way, is an important topic and important feature of Java that makes it object-oriented. We're going to look also at the concept of superclass and subclass, and test the relationship between the two. Looking at, describing polymorphism, which by the way, means multiform. And then, of course, looking at creating a subclass, and finishing by touching up on the concept of abstract classes and, of course, interfaces.

Looking at inheritance, in general, again, inheritance results in a class hierarchy of the Java classes, similar pretty much to the taxonomies found in biology, such like blue whale, of course, which is a subclass to whales. So in this case, we see on this diagram that we have a blue whale which, by the way, is a subclass of a whale, and which is also a mammal.

And the same thing with the humpback whale which, by the way, is also a whale, and which is also a mammal. And if you see with qualify, for example, a mammal again to have flukes and flippers, and of course, we quality a mammal to have warm blood and, of course, breaths air.

So the whole idea here is to show, again, the concept of this inheritance. And by the way, in general, also we know about inheritance. Nowadays, for example, in the medical field, lots of times we look at the inheritance of genes. This is how we identify if somebody maybe has tendency to get diabetes in the future or any other type of a sickness. So nowadays, it's quite hot, this type of topic.

Now, working with superclasses and subclasses. Here's an example where, in this case, we have again, this table shows us the behavior of a shirt class. And it also shows us a behavior of another class called trousers. Imagine that this Duke's Choice company, they want to diversify and maybe sell trousers, too.

And as you see here, if you take a look at these classes, you should notice that both classes use many of the same methods. For example, the shirts and the trousers, they use the same type of method, get ID, get price, get size, get color, get fit, and so forth. Right? And set ID, set price, set size, set color, set fit, and so forth. And of course, they both have a display method.

So the fact that we have now common methods in both classes, maybe we are copying and pasting, and probably [UNINTELLIGIBLE] this type of code in the classes for nothing. Maybe we find that we should find the mechanism by maybe trying to somehow avoid this code duplication.

And as you see here, we see also the code duplication. Imagine now, the Duke's Choice decides to add a shirt item, stocks item, as well as trousers and shirts, again, that it can sell. So in this case, of course, we see that the shirt has the method get ID. If you take a look at this shirt object, and the trousers object, and the socks object, they do have get ID, display, get price, get size, get color, and the two here, they have get fit.

So at least these methods here-- one, two, three, four, and five-- they're all common to, in this case, shirt, trousers, and socks. So obviously here, we're doing a lot of code duplication, and maybe we should find a mechanism by which we need to reduce this number, and do it maybe only once, and not to three times.

And that leads us to maybe now using the concept of inheritance. So we said now, let's go ahead and gather all the commonalities inside a class, and we're going to call that a superclass. And now what we're going to do is we're going to make those classes as subclasses, and inherit from the superclass. So in a sense, they inherit all the variables, and of course the fields and the methods, that are common to all of them.

And then we add only what is specialized to these different classes. For example, in this case, we decided that we call it a piece of clothing, and that has a get ID, a display method, get price, get size, get color. And then of course, now with the shirt has a new method special to it, get fit. And then we have a trousers that has two methods, get fit and get gender.

And in general, socks does not have not nothing. So it makes use of all of the methods of the clothing, in this case, which is the superclass. Everybody sees that? OK. So that's the idea, again, behind it.

And by the way, later on, we'll see in this case, again here, we have a display method. That works with all of them. Some of you might be saying, hey, you know what? Maybe we need to display more information in the shirts or the trousers. Then we can go ahead and see how we can handle that in the next slides.

So in terms of the classes, so all the classes in superclass must be used by all the subclasses, right? Why is not get fit in [UNINTELLIGIBLE]?

That is a good question. So the question that I have from Jane is she's saying how come get fit is not here? It turns out that get fit belongs only to shirt and to trousers. It does not belong to socks, so of course, it's not common to all three of them. Then we should not edit in the common class. Good question.

Again, the superclass contains only, again, the methods and the fields that are common to all the subclasses.

Now, looking at overriding a superclass method. Speaking of display, remember that? I said imagine I want actually the display method to change for a particular subclass. So here is again, we call this concept overriding. Remember that we already learned about something else about methods, which is what? Overloading methods. And overriding and overloading methods, they're two different things.

So we all know about overloading methods, right? Remember that? I'm going to quiz you guys on that. So everybody knows about that. Good. I'm just joking, OK?

So now, looking at methods that exist in the superclass. Again, methods that exist in the superclass can be either not implemented in the subclass-- again, the method declared in the superclass is used at runtime by the subclass-- or you can implement it in the subclass, which means what? Now the method declared in the subclass is the one that is used at runtime. So you can actually have that.

So continuing, again, with these concepts, now let's go ahead and get into an example. So let's assume now that we create a class. And by the way, when you create a superclass, it's just a regular class. There is no special keyword that we have to put, nothing. Just a regular class.

So some folks say, oh, it's a superclass. Most probably, I should put a special keyword over there that says superclass. No. It's just a regular class.

So here we have a class called clothing. It has, of course, a bunch of fields. ID, description, code, and price. And by the way, we decided to actually make them private, which is we decided to have [UNINTELLIGIBLE] what?

Encapsulation.

Encapsulation, thank you.

And then we have a constructor, here. This constructor takes what? An ID, and a description, and a color code, and a price, and uses them to do what? To again, in this case, initialize the item description, color, and price.

And by the way, take a look carefully how the ones to the left, we always use this in front of it. Why do you think we did that? Anybody?

[UNINTELLIGIBLE]

Actually, it's not local. It's because the parameters that we passed, turn out that the parameters that we passed here, they actually are exactly spelled like what? Like the instance variables. Because they're spelled exactly the instance variables, we need to make the difference between the ones that we passed and the ones that belong to the instance.

So if we put this here in front of it, that means here, I'm talking about the instance variable. On the other hand, this one here, I'm talking about the one that I passed. That's to, again in this case, resolve the conflict in this case between-- you're right, you have the right to actually use the same spelling, because they're really two different things.

But here, if you put this in front, again, you're making a difference between the instance variable and the argument that you're passing, which by the way, the parameter that you're passing will turn out that it happens that, in this case, they are spelled exactly the same. Which is OK. Everybody sees that? Good.

Continuing with that, again, this is part one of the superclass. Again, the superclass has also another method, display method. In this case, the display method has a bunch of the [UNINTELLIGIBLE] displaying for us the ID, the description, the price.

And if you take a look here, it actually calls what? Because we're using encapsulation. Instead of, you remember before, we accessed, again in this case-- now again, we still, by the way, display can access that, because it belongs to the same class. But this is just a better programming style. That's what we call the [UNINTELLIGIBLE] method to actually get either the item ID, or the description, or the price, or the color.

And of course, we define these methods here. Get description, get price, get ID, and so forth. Right?

Continuing with that, it has a part three where we continue with the [UNINTELLIGIBLE] methods, and then we have to specify the [UNINTELLIGIBLE] methods. Right? All of them that allow us to set the data.

So that pretty much represents what? It represents a superclass.

Now, let's take a look at how we define a subclass. The syntax, folks, is typically you specify the name of the superclass. And then in this case, you use a modifier. Could be public or whatever. You have the class, and then you have the class identifier. That's the subclass. And then use now a special keyword that's, again, in Java which says what? Extends. Which means this class extends this one.

Let's go ahead and see an example. Let's look at the example of shirt. Take a look. Now we can go ahead and create a class shirt that, of course, extends clothing.

Well, it extends clothing means what? Means it actually now inherits all of these attribute fields, all of these methods here, and here, and here. That's what the shirts inherits from the what? From the superclass clothing.

But it turned out that the shirt has an extra field that does not belong to the clothing, but belongs to it. Special to it. And that's what? That's a character call fit. And at the beginning we initialize it to U, but that can actually be set to what? U means it's unset, but it can be set to what? To small, medium, or large. Right?

So that variable is special to what? Special to, again in this case, to the shirt class.

And then we have the shirt constructor. The shirt constructor now takes what? Takes an ID, a description, a color code, a price, and a fit.

What I can do here, folks-- let me just move this a little bit-- what I could do here is that I can go ahead now and call super, and then pass to it ID, description, color code, and then the super here is a reference to the methods and attributes of superclass. So in this case, it is actually referencing here the constructor of the superclass, which is this one here.

So in this case, I wanted to call the constructor of the superclass, because I know it helps me initialize what? The ID, the description, the color code, and the price.

So I'll go ahead and do that first, here. And then of course, after that, and I call it always the first one in the [UNINTELLIGIBLE]. And then after that, I need to assign fit to what? To the fit of the current object, in this case, this. So again, this is a reference to this object.

So of course, I could not pass fit, because fit is not organized by the constructor of the clothing class. Everybody sees that?

So super is used a lot. Super, by the way folks, what it means "super," it means in this case that it refers to a superclass, again, even if the method of the superclass has been overridden in this subclass, using a super keyword allow you to invoke the method of the superclass, all the time. Everybody sees that?

So in this case, for example in this, we use the constructor of the superclass. How do we call the constructor of the superclass? By using the super keyword. By the way, this is a special keyword in Java. Everybody sees that? Good, good.

And of course, we added the get fit and the set fit with our special methods to what? To the shirt class. But they are not methods of what? Of the clothing. Right class. Everybody sees that? Good, good.

Now let's look at the second part, in this case, of the shirt class. We have now a display method. Now remember, we had a display method in the superclass. Here it is. But in this case, we decided to actually override this display method and have a special one. So here, it overrides the display method of the clothing superclass.

Why? Here, we wanted to print the ID, the description, the price, the code, and then what? And then the fit at the same time. Everybody sees that?

In fact, instead of doing all of these, instead of writing all of these, I could have within the display method called superdot display. And then that would have called the display method of what? Of the superclass. Because remember that when we explained here, we said that even if the method of the superclass has been overridden in the superclass, using super keyword allows you to invoke the methods of the superclass, including the constructor. Everybody sees that?

And of course, again, we have the set color code. We wanted to override it, for example. This method overrides the method of the superclass, just as an example.

And this maybe checks the color code using the switch statement. Remember that?

So now we know what's the superclass and the subclass. Everybody understands that, right? Now, let's go ahead and look at something else. And this is an abstract class.

Sometimes a superclass makes sense as an object, and sometimes it does not. For example, clothing. Does it make sense, when I say "clothing," is it clear to you what type of clothing is it? No.

Imagine, for example, I say, you know what, folks? I'm going to the supermarket. I'm going to buy some fruits. You can guess. You Can say, maybe he's buying bananas, maybe he's buying oranges, maybe he's buying apples. But when we say "fruit," it's abstract. That's the idea. Maybe it's a tomato. We don't want to start that word of is a tomato is a fruit or a vegetable. We don't want to do that.

And by the way, in general, in object-oriented, we have a tendency to actually make use of abstract classes. Why? Because abstract classes capture the generalization of the object. And then later on, you can decide about the concrete objects. So lots of times we like that.

So again, Duke's Choice, in this case, carries shirts, socks, and trousers, but it does not have an individual item called clothing. So again also, in the application, the superclass clothing may declare some methods that may be required in every subclass, again, but cannot really be implemented in the superclass.

So again in this case, we have a mechanism by which, in this case, we can actually declare that as a superclass in Java. So for example, when we say "shirt," we know that the shirt looks like this. When we say "trousers," we know trousers look like this. When we've say "socks," we know socks look like this.

When we say "clothing," we don't know.

So how do we actually represent this in Java? Ah!

So now, let's look at the example of how to represent. For example now, we can decide that clothing-- because really, it's not clear to us what clothing. Could be anything. Could be trousers, could be socks, could be hats, and so forth. Could be shirts, and so forth. Could be t-shirts.

So now, in that case, we can make it abstract. We can decide that, OK, this shirt now is abstract. And then it has its fields. So the abstract keyword ensures that the class cannot be instantiated.

By the way, when you have a class that is abstract, you cannot instantiate objects of type that class. If you try, the compiler will scream at you. You will get an error.

So abstraction refers to creating classes that are general and may contain methods without particular implementation. That's what they mean. And well we see that. For example here, we have a constructor. Even though we do have a constructor, but as you know, we said we cannot instantiate any object of type an abstract class.

We see this, by the way, in extensive detail in the next advanced course, in the Java SE 7 programming.

Now if you remember, we said that an abstract class can have methods that are not implemented. You just declare them. And here they are. For example, in this case, if you want this method, get color code and set code, if you want them to be abstract, you'll just declare them.

If you declare them, by the way, means what? They're missing the what? The braces. Remember the braces that we put in after that? Open brace and closed brace? They don't have it. You just declare their signature, and that's it. Right?

So the get and set methods for the color code fields are abstract to ensure that they are implemented appropriately by every subclass. Right?

When they are, by the way, defined as abstract classes in the abstract class, they must be implemented somewhere in the descendant, in the, of course, extended classes.

You can, by the way, continue to treat them as abstract in the next subclass, in the first subclass, but then in the third subclass, then you can go ahead, you have to make a decision. By treating them as abstract methods in the subclass, you're just delaying the implementation. But they have to be implemented at some point in time. Everybody's following?

Now, looking at superclass and subclass relationships. It is quite important to consider the best use of inheritance. Again, use inheritance only when it is completely valid or unavoidable. And of course, check appropriateness with it's phrase. That's how you create inheritance.

For example, in this case, we can say a shirt is what? Is a piece of clothing. Socks is a piece of clothing.

And for example, if you want to create an abstract class called employee, then I say an engineer is an employee. A sales person is an employee. An HR person is an employee. A vice president is an employee. So that's the idea.

So the phrase "Shirt is a piece of clothing" expresses a valid inheritance link. And the phrase "hat is socks," that is invalid. So that's how you identify if it's worth using inheritance or not. Got that?

Now here's another example of inheritance. Here we have an employee-- speaking of just the example that I was saying-- here's an employee, and this would be, again, a superclass. And then down here, I have skilled employee. That's inheritance from the employee. And then under skilled, I have editor, I have graphic illustrator, and I have technical writer.

In fact, by the way, this class diagram here, at some point in time, you're going to do it as a practice in the lab.

And the manager is an employee, and so forth. So you can actually, in this case, create a whole hierarchy of classes that inherits from each other. Right?

Of course, the question that I typically get, how many levels we can do that, go with this inheritance? Again folks, in general, up to a second level like this, it's OK. But then after you create many, many different levels, sometimes it's a little bit difficult to read your code. And it's not needed, in any case.

Let's go in and look now at polymorphism and overriding methods.

So looking at the superclass reference types. So far, again, we have seen the class use the reference type to create objects. For example, to use a shirt class, as the reference type of the shirt, we go ahead and declare a reference variable my shirt, and then initialize it with the new instance of shirt.

But by the way, within the inheritance hierarchy, you can actually also use the superclass as a reference. For example here, I can say, I declare a clothing item one of type clothing, and then initialize it with an instance of new shirt. This is perfectly acceptable. Why? Because a shirt is a piece of clothing. So that works. Everybody sees that?

And of course here, I can say a clothing item two, which I declare it as an object of type clothing, a reference object of type clothing, and initialize it with the new instance of trousers. And that is acceptable because trousers us is nothing but clothing.

So again, this is a very important feature of Java, which is the ability to use not only the class itself, but any superclass of the class as its reference type, all the time. So again, in this case, we see that we can use the reference to the shirt as clothing, or reference to the trousers as clothing. Yes?

But what's the advantage?

Well, we'll see that. Again, the question is, what's the advantage? We'll see that later on. We'll see some example here, and then we'll see extensive, by the way, details in the next course, in the Java SE 7 programming. But I'll show you enough here, and you will say, oh, that's a good idea.

Continuing with that, and now looking at accessing to object functionality. Again in this case, accessing the methods of a class using a superclass reference is a little like accessing the controls of an electronic device using a remote control instead of the controls that are on the device.

For example, this camera has a bunch of buttons here that I can use to control, but also there's buttons here, but you can use to control it from the remote control. That's the idea again. We're just giving you an analogy here.

So again, often a device such as a video camera has a comprehensive set of controls for recording, [UNINTELLIGIBLE] editing, and otherwise accessing every available function on the camera. Again, this is a lot like using the class of the object as the reference type.

And of course, in general, we can say that a superclass has access to only the methods of the objects that are declared on the superclass, even if the object has a number of other methods.

Now, looking at the concept of accessing class methods from a superclass. So using a reference type clothing does not allow access to, by the way, into what? To get fit and get gender. Because obviously, they do not exist, right? So using the super class, in this case clothing, does not allow us to, again in this case, access these methods. Because they belong to trousers.

Again, usually this is not a problem, because you are most likely to be passing a clothing reference to methods that do not require access to these methods. But for example, purchasing, purchase method, could receive a clothing argument because it needs access to only get price. So that works.

Now, casting the reference type. Again here, given that a superclass may not have access to all the methods of the object it is referring to, how can we now access those methods? Again, the answer typically is that you can replace, in this case, the superclass by reference. Again, reference that is the same type as the object or an interface that declares the methods in question and is implemented by the class of the object.

Again, we're going to look at interfaces later on. But right now, remember one thing, folks. That we can go ahead and cast, for example, an object of type superclass into an object of type subclass. We'll see that again in the code here.

Look at that, folks. This is a very nice example to explain to you the concept of casting.

Now remember, folks, we already have seen casting earlier in one of the lessons. And if you remember, I mentioned to you that it is quite useful in polymorphism. And now, we're getting to look at the casting concept.

Let's go ahead and look at that. And in this case, let's assume this is within a main method. We create a new instance of trouser.

First of all, we declare a reference variable called CL of type clothing. And then we initialize it with a new instance of what? Of trousers. By using the constructor of trousers that takes an ID, a name, again, and then the color code, the price, and then of course, the number, and of course the size. OK? You see that.

And of course, if you take a look here, and you will see that-- let's go ahead now and call get fit on the reference to the [UNINTELLIGIBLE]. Of course, this is not going to compile. Why? Because we know that for sure the class clothing does not have the get fit method. So the compiler is going to scream at you.

How do you resolve this problem? Well, in general, what you do, if you did that piece of clothing and cast it into an object of what? Of trousers. Then, now, that piece of clothing becomes a trousers, an object of type trousers, and then you can invoke a get method on it, and that works without any problem.

You see how this is quite useful? Yes, sir?

Can we avoid that problem by just doing trousers [UNINTELLIGIBLE]?

Yes. So the question is, again, by Lee-- or the suggestion-- can we now avoid this by just creating a reference trousers, and then call it directly? And the answer is, yes.

But let's take a look at the next level, and you will see that if you deal with that way, you're going to write a lot of code. We want to, again in this case, write only one generic type of code, and we can go past all kind of different objects of different types of classes. And that works very nicely. We'll see that.

Quite a good catch. And we'll see, again, the answer, and why do we need to do that. But you're right. If you're working with trousers, you might as well create an instance of type trousers and work with it.

But in general, if you want to write a generalized type of method that accepts all kind of these clothing, and then you make a decision, once again, a runtime if it's trousers, or shirt, or socks, and so forth. That's the idea behind this.

And here's an example. So now, what we could do in this case, again, we see here's a possible casting error. In this case, we have a display detail that takes a piece of clothing, right? Takes a reference to a clothing. And then here we do a display. Again in this case, it would be calling what? The display method of the clothing class.

Again in this case, you want to invoke the get fit code on the piece of clothes-- and really, we meant to get the get fit code of the trousers, then we need to cast that. And then after that, we print it out. So we get that character, in this case, which is the size, and then we declare that variable fit code, which is a local variable of type character inside the display details method, and of course, use it to save whatever get fit code returns to that.

So what we tell you here about the first code example, in the slide it shows a method that is designed to receive an argument of type clothing, and of course then cast it to trousers to invoke a method that exists only on a trousers object again. But it is not possible to know what object type the reference CL, which is this one here, that points to.

And if it is, again in these case, say a shirt, then the attempt to cast it will cause a problem. No problem all that, because what I'm passing here could be an instance of a shirt. So again, it will throw a cast class exception. That's what it throws.

And throw in this exception is, again, covered later on in the handling errors. So that is definitely an error.

So how can we now resolve this issue? Well, take a look at, in this case, the second method below here, and then now we have a new operator that we are learning in Java-- it's again a special keyword in Java-- and that's called what instance of, which is used to ensure the there is no casting error.

So for example, here I pass a piece of clothing, and then here, I'll go ahead and call display. That's not again a problem.

And then down here, look at that. I say if C is an instance of trousers, then go ahead and do what? Then go ahead and cast CL into an object of type trousers, and invoke get fit. If not, then it will b a shirt, and so forth. So you see, now I can actually write this display details, as you see here, Lee. And it could be generic.

And by the way, I could write code. I can continue this code, and say if it's a shirt, do this. If it's socks, do this, and all that. So I have one method that actually can accept all kinds of objects within the inheritance hierarchy. And of course, any object of the type subclasses. And of course, I can work with this, and I could write only one method. Did you see that? That's the purpose, of course, the concept casting here, and instance of, and so forth. And that's also the concept of polymorphism that we've been discussing. Everybody sees that?

So you see that now we're starting to write a smart type of methods in Java, by again in this case, using these in new type of features that Java offers us. Everybody's following, folks? Good, good.

So again, in this case, just to let you know, if you think your code requires casting, again, be aware that there are often ways to design code so that casting is not necessary. And it is usually preferable. But if you need to cast, you should use the instance of to ensure that the cast does not throw a class cast exception.

Now, discussing polymorphism. Well, folks, polymorphism behavior, again, displayed by a statement may invoke one of the methods of clothing. Again, this is a polymorphic method call, because the invocation does not know or need to know the type of the object until what? Until runtime. But the correct method, again, in this case. And that he is the method of the actual object will be invoked.

Again in this example, on the slide, the object is trousers, but it could be any subclass all clothing. Again, regardless of the reference type used, the method executed is on the instantiated object, whatever object you are using, in this case.

So here we have the get ID, get price. These are methods inherited from the superclass. Display and get color, methods inherited from superclass and overridden. And then here, get fit and get gender, these methods are unique to trousers class.

So again in this case, we say that this is the concept of polymorphic method call. Why do we call it polymorphic call? Because the invocation does not know or need to know the type of the object, again, sometimes called the runtime. But the correct method, again, that is the method of the actual object will be invoked. Everybody's following, folks?

So the idea is, again, knowing what type of instance you are working with. Where? At runtime.

Now, when you get into the advanced course, you are going to see examples where you will see where the compiler stops you, and you'll see cases where the compiler says, OK, this is good. I accept it, because this object is of type. It is, like for example, shirt is a piece of clothing. I got no problem. But then, the runtime will scream at you.

A good example is what we've seen earlier here, where I could be passing, in this case, in the first code an object of type shirt. And that is acceptable, because a shirt is a piece of clothing. But then I get into trouble here, because I cannot cast an object of a type shirt into a trousers. It doesn't make sense, right? A shirt is not a pair of trousers.

So far, so good? Everybody's following?

And we have a quiz. How can you change the reference type of an object? By calling it reference, by casting, by declaring a new reference and assigning the object. Which one is the right thing? By casting. That's B. Thank you.

Let's go and take a look at interfaces. Again, we're introducing interfaces. You're going to see, by the way, abstract classes and interfaces in detail in the advanced course, the next one, which is the Java SE 7 programing.

Let's go ahead and look at multiple hierarchies. And let's take a look at this example where we can have a more complex set of classes that may have items of two different hierarchies. For example, here I have clothing.

Imagine, for example, Duke's Choice now, they actually sell clothing that could be shirts, trousers, but also they sell outdoors. It could be what? A tent, camp stove, [UNINTELLIGIBLE], and so forth. So again, this Duke's Choice now starts selling outdoor gear also. They want to do that, too.

So in this scenario, there may be some classes, again, from every hierarchy that have something in common. For example, the custom shirt item in clothing is not returnable. If you buy a custom shirt, sorry, we cannot return it.

But also we can have neither the [UNINTELLIGIBLE] item in the outdoor hierarchy. That also cannot be returned. All the rest of the items can be. So we decided that the custom shirt cannot be returned and the [UNINTELLIGIBLE] cannot be returned. So again, all other items are returnable.

So the question here, how can we now model this? Again, here are some things to consider. How can we model this? Maybe we create a new superclass that will not work because a class can extend only one superclass, and of course, all items are currently extending either outdoors or clothing. Why? Because the Java technology allows only single inheritance, not multiple inheritance.

So again, this new solution is a bad idea. Right?

How about the second one? How about if we put a new field named returnable, added to every class, could be used to determine if an item can be returned? Again this is certainly possible, but then, there is no single reference type to pass to a method that initiates or processes a return. Again, that's an issue.

How about now if we use a special type of, in this case, constructing Java is called interface. That can be implemented by any class. This interface type can then be used to pass a reference of any class that implements it. That is the solution. That was for the last one here.

Let's go in and look at how we handle that. So now, we can go ahead and say, OK, now we implement an interface called returnable. And then we make class shirt, and trousers, and tent, and camp stove. Implement this interface.

Which means they're going to end up implementing what? The doReturn method. Each one of them implement their doReturn method. Maybe when you return a pair of trousers, they give you only 80% of the money back. And maybe if you return a tent, they give you only 90% of the money. Stuff like that.

Now, how do we do that in Java? Look what we do. We first define an interface. How do we define an interface? The name of the interface, but now we put a special keyword in front of it called what? Interface.

And then, we now will go ahead and declare the method. Remember that method, by the way, by default is abstract. By default. You can put abstract if you want over there, but if you don't put it, it's still an abstract method. An interface contains only abstract methods, and that's it.

And by the way, an interface cannot contain instance fields. It can contain only constants, and that's it. OK? And no instance variables.

But also an interface, in general it has only abstract methods. In general, this interface returnable has a method called doReturn, and returns a string. Right?

Now, how do we make a class implement an interface? Look how we do it. The class shirt here, it extends what? Clothing, but then it implements what? Returnable. That's how we do it.

And by the way, when you write implements returnable, what it means, it means that that class is going to implement which method? The doReturn. It's going to implement it. Everybody sees that?

Interfaces are big, big, big, huge in Java. In fact, how many of you know about JDBC? We work for a database company, so obviously, in this case, we know about JDBC. And JDBC is an interface that can be implemented to talk to what? To Oracle database, or MySQL database, or the Java DB, and so forth. Which is the Derby database, and so forth. Right?

So again, in this case, we have the constructor. We've seen already this constructor. It takes an ID, a description, a color code, the price, the fit. First of all, it calls what? What is this, folks? We're calling what here?

[UNINTELLIGIBLE]

The constructor of the superclass, which is clothing. And then after that, we initialize the fit.

And of course, again by doing this, it ensures that shirt must implement the method returnable. And this is it, of the returnable. So here's the doReturn. That's where we get, again, whatever you want to write down here, and force return.

So again, the code in this example shows a returnable interface and this shirt's class. Only the constructor and the doReturn Return method are shown in this case. Of course, in this implementation, returnable provides a marker to indicate that the item can be returned and ensures that the developer of shirt must implement the doReturnable method.

And of course, the doReturn method returns a string describing the conditions for returning the item. For example, you don't get 100%. You get only 90%, if you bought a tent and you opened it or something like that.

Right? Everybody's following the concept of interface?

It turns out that interfaces are quite useful. Actually, the implement contracts between classes and so forth.

[UNINTELLIGIBLE]

A very good question. A class can implement more than one interface. A class can extend only one class, but it can implement more than one interface. Excellent question.

So again, the question was by [UNINTELLIGIBLE] can a class implement more than one interface? And the answer is yes. Thank you.

Again, all of these will be seen in detail in the advanced course called Java SE 7 programming. Thank you. Yes?

So if it can implement more than one interface, you need to be careful that the methods are not repeated across interfaces?

Yeah. Well, in general, it's not going to happen, because interfaces--

[UNINTELLIGIBLE]

Very good. So the question is, when you implement more than one interface, of course they will have methods that are different inside the different interfaces. And the answer is yes. Good.

And by the way, now let's go ahead and look at access to object methods from an interface. Again, as you see here, we have a superclass reference clothing, and we have the trousers, and then we have here returnable. And of course, in this case, we know that trousers implement the doReturn.

So again, as shown in the previous slide, the reference used to access an object, again, determines the methods that can be called on it. And of course, so in the case of an interface, a reference shown on this particular slide, only the get return method can be called. In this case, if a method receives a returnable reference and needs access to methods on clothing or methods on trousers, the reference can be cast to the appropriate reference type. Again in this case, whatever, if it's trousers and so forth.

And now, looking at the array list, we already learned about the array list, right? It turned out, folks, that some of the best examples of inheritance, and the utility of interface and abstract [UNINTELLIGIBLE] can be actually found in the Java API. For example, the array list class extends an abstract list class, and again which itself extends an abstraction collection. And abstract collection implements the list interface, which means that the array list also implements the list interface.

Again, to use the array list as a list, use the list interface as a reference type. We show you this on here. And for that, what we could do is quickly, if we want to look at the array list, can find it quite easily.

Here it is. And if you take a look here, you see that the array list, again in this case, inherits from abstract list, which inherits from abstract collection, which inherits from the object class.

But they get all implemented interface are serializable, cloneable, iterable, collection, list, as you see here, and random access. These are the interfaces that implement. You will see that a lot in the Java API abstract classes, and of course, interfaces.

And also, the list interface, again, if you want to take a look at that, if you want to take a look at the list, you'll see some interface, face again as you see here. And of course, it's also known implementing these classes that you see here.

Again, the list interface is implemented by many classes. This means that any method that requires a list may actually be passed a list reference to any object of these types.

Ah! Now let's look at the mother of the mothers, which is the object class. We call it the object class because any class that you see in the hierarchy here, folks-- let's go back and look at the class. You see, always, always that's the mother class, that's the object class. It's the mother. We call it the mother of the mothers.

So the object class, again, all classes have at the very top of the hierarchy the object class. It is so central to, again, how Java works that all classes that do not explicitly extend another class automatically always extend an object class implicitly. You can write it explicitly, but you don't have to.

So all classes have objects at the root of the hierarchy. Again, this means that all classes have access to the methods of the object class. Again, being the root of the object class hierarchy, object does not have many methods. Again, only very basic ones that all objects must have.

And one of them is the interesting one, is the two string. We've seen that. An interesting one is the two string. And the object two string method gives very basic information about the object. Generally, classes will override the two string method to provide more useful output.

And then the system that [UNINTELLIGIBLE] and always uses the two string method on an object past to it, in this case, to output a string representation of the object, all the time, of the time.

And of course, you see it here. Again, if you take a look at the methods, you will see that we have the two string. Which by the way, always has a way on how to print in that.

And again, speaking of the two string method, as you see here, again we have in this case, this is a main class, and as an example, it has a main method. Inside here, we call the printer LAN and pass a new instance of the object. Again, these are objects two string is used.

And then, if we have a printer LAN we pass a new instance of this string builder, that again overrides the object's two string, this class, string builder. And then, if you pass, again, an object off in this new-- first, inherits objects, so the two string method of the object. And then the second overrides the object, in this case, because of the two string.

So again, looking at what we just told you here, below, that all objects have a two string method, because it exists in the object class. But the two string method maybe returns different results depending on whether or not that method has been overridden. Again, in this example that we just showed you on the slide, they two string is called via the printed method of the system dot out.

Again, on four objects. First is an object object, which is an object of type class object. Again, this calls the two string method of the base class, which is object. And then the other one, a string builder, these calls the two string method on the string builder.

By the way, a string builder overrides the two string method that inherits from the object class to return a string object of the set of characters it is representing. And then we pass an object of type first, a test class, again. First is a class with no code, and so in this case, the two assuming method called is the one that is inherited from the object class.

And then the other one, we passed an object of type second, which is a test class. The second is a class, again with one of the method named two string. So in this overrides methods. This overridden method will be the one that is called.

So of course, this is just showing you how the two string method can be overridden by any class that you create.

And we have a quiz. And quiz says, which methods of an object can be accessed via an interface that it implements? Again, all the methods implement in the object's class, or all the methods implemented in the object's superclass, or all the methods declared in the interface.

Of course, in this case, would be in the interface. C.

So in summary, we looked out the concept of class hierarchies, inheritance, superclass, subclass. We looked at the concept of polymorphism. We looked at the concept of abstract method, and the concept of interface.

Of course remember, folks, that in the next course, which is the next level course, the advanced one, we do an extensive coverage of the abstract classes and interfaces in that particular course. We have a bunch of lessons that do cover that extensively in detail. Everybody is flowing?

And of course, this lesson also has a bunch of practices. The first one is creating and using a superclass and a subclass. And the second one is using a Java interface, so that's good. We get to use a Java interface. And that's pretty much so.

So now, again, looking at the activity guide, and in looking at these practices in detail-- which is, again, related to lesson 12-- you see that in the first practice, we're looking at creating and using superclasses of classes. And by the way, you see how now we give you details on how to do this practice. So go ahead and do that.

Now we see the one that I was telling you how you can actually now get into the concept of hierarchy of employee. Remember, I mentioned that to you, that you will get to do it as a practice. We've seen this type of a diagram, similar to in the lesson.

And then, you get again, in this case, to again continue. We'll show you, again, step-by-step how to do all of this. Creating an employee class. And so, you get to go through all of this. They give you also a sample of the output.

And then in the second practice, using an interface. So you get a chance to use an interface, too. This is also quite an interesting type of a practice.

We give you the printer class, the country class, the region class, the company class, and the company test class. And then we ask you to finish, again, to create a bunch of other classes and work with it.

So this is, again, quite an interesting practice, and I encourage you to try it. And then of course, we'll take a look at it later on. Thank you so much.

So let's go ahead and do this practices. And then after we finish with that, we get into the lecturing lesson 13. Thank you.

## 2. Practice Session 12-1 - 18m

After looking at Lesson 12, where we looked at some advanced object-oriented concepts like the concept of inheritance, the concept of abstract classes, and interfaces, and so forth, let's go ahead now and take a look at the practices for this particular lesson. And we start with Practice 1. In Practice 1, we create new superclasses and subclasses. Again, in this case, first we design and then create a class hierarchy forms the basic basis for an employee tracking system in the marketing department in the Duke's Choice company.

Again, this practice comprises two sections. In the first one, we create a simple design model for the class hierarchy. In the second, we create the actual classes and, of course, test them. So again, we're given the employee test class. So again, here, in this case, we have the marketing department of Duke's Choice company again here. And we're talking about the design of the class hierarchy, making use, again, of subclasses, and superclasses, and so forth.

So we're saying that the marketing department of Duke's Choice company has employees in several different positions. Some of these positions are technical writers, graphic illustrators, managers, and, of course, editors. And marketing wants you to create a program for tracking information about every one of their workers. Again, this information consists of the worker's name, job title, employee ID, and of course, the level, which would be one, two, or three.

Additionally, managers must have a list of employees of the employees they manage. And of course, technical writers, graphic illustrators, and editors must have a list of skills that they possess. And of course, editors must have a value indicating whether they prefer to do electronic editing or paper-based editing. And there must be, again, in this case, a means by which to display all the information for a given employee type. And we should create a class hierarchy of superclass and subclass relationship for the employees of the marketing department.

Of course, we draw the diagram on a piece of paper. Or if you prefer, you may, again, use that UMLet tool. Again, [UNINTELLIGIBLE] here, use the "is a" phrase and ask yourself, again, to create the inheritance hierarchy.

Again, also, we should look at, in this case, making sure that all of the different job types mentioned above can also be called employees in the general sense. Of course, they share certain fields of operations, and therefore, for example, a manager is an employee, and an editor is an employee, and so forth. And of course, we should consider an interim superclass if you find that certain employee types share common fields or operations that are not shared by other employee types, for instance, a list of skills, then.

In these case, if they are all employees, we consider creating a common superclass of these employees inherited from the top level superclass employee. And of course, in terms of displaying information, we should remember that many of the fields that would be displayed are shared in common by all these employees, for instance, name, job title, employee ID. So in this case, we might be able to display this common information from the top level superclass. And of course, if the subclass simply adds to what was displayed by the superclass showing the fields, in these case, that are unique to this particular employee type.

So again, we should note that this is done by overriding the method from the superclass and calling the overridden method from within the subclass method, which then adds more code to display additional fields. So we should also not forget about the encapsulation, which demonstrates some encapsulation of every of the classes in your design by including get and set methods for every private field according to the type of access required. And of course, in terms of the modeling, again, the model-- we should model the class hierarchy using the class diagram similar to those, again, that we see in the lesson.

So in general, if you take a look at this, you will see pretty much something that would look, maybe, something like this, where you have the employee with the name, job title, employee ID, level. And then you have a bunch of common methods, getName, getJobtitle, getEmployeeID, calculateEmployeeID, getLevel, displayInformation. And then after that, we got a manager, which is a class that extends from employee, and [UNINTELLIGIBLE] from employee. It has, again, setEmployee, getEmployees displayInformation, which is going to be overridden.

And then we have another class, which is called skilled employee. But [UNINTELLIGIBLE] from employee. It has setSkill, getSkill, displayInformation, which, by the way, will be overridden. And in addition, by the way, now we find that three different classes-- graphic illustrator, that inherits from skilled employee. Technical writer, that inherits from skilled employee. And editor, that inherits from skilled employee.

And you see that for the graphic illustrator, nothing to add. For the technical writer, nothing to add. On the other hand, for the editor, we can now add the preferred editing, because they can add it using, again, in this case, paper editing, or, in this case, electronic editing. And of course, we can go ahead and override the display information method for that, too.

So we'll tell you that, again, and that means we create, again, in this case, a new project from existing resource called Practice 12. And then we'll go ahead and pretty much use the concept of, in this case, grabbing that existing source from D:/labs/les11. And of course, before we begin creating the classes again, we change the property of the NetBeans IDE. We add, again-- the @Override Annotation property of the editor is useful when you are creating javadocs for your application. Again, this property is applied when you override a method in a superclass. Again, you'll see that in the advanced Java se 7 programming course, too. You'll see the annotations in detail.

And of course, since we are not creating javadocs in this course, we turn off this property as it is merely distracting for our purposes. Again, and of course, we follow the steps that we show you here to be able, again, in our case, to first go in through this tools and the options from the main menu. And then after that, from the Option menu, click on Editor Toolbar button, and then edit the Hints tab. And then, of course, follow that, change the language to Java. And expand, again, the JDK and later [UNINTELLIGIBLE] node beneath in the Add @Override Annotation. And of course, click OK. And then you're good to go. And that's pretty much what they want us to do in this case.

And of course, they want us create the employee class shown in the diagram, and then put all the fields. Use the Refactor, again, feature, [UNINTELLIGIBLE] to encapsulate the getters and setters. We already have seen that in the previous practices and over the previous lessons.

And again, this time, we should also note that, in this case, we can add a bunch of field not shown in the [? diagram, ?] for example, employeeIDCounter. And we should make it a protected static int. Protected, which means it can be accessed by the derived classes, or the extended class, or the subclasses.

Of course, a static field is a class field. We already know about that. And of course, there's only one value for this field that is shared by all instances in this class. Of course, the static field is used here to store an integer value that is incremented from within calculateEmployeeIDMethod to generate the next ID value. Of course, the employeeIDCounter, in this case, is accessed and incremented by all instances of the employee, and its subclasses-- they're making sure, again, that no duplicate employee IDs are generated.

Again, in a real business application, this technique would not to be robust enough to guarantee unique IDs. Instead, a database would properly generate the ID that would be the primary key. However, again, this technique is good enough for us for this particular course. So we create that calculateEmployeID method. And we create, of course, a display information method which takes no arguments, and again, does not return a value, but pretty much, in this case, print out the value of every field of the class within a suitable label. And as you see here, here's pretty much how this would look like, just to have an idea about what it is.

So here's the static variable that you're using. And then, of course, these are the instance variables. Here's the calculateID that increments the employeeIDCounter. And then, of course, use it to set the employeeID of the instance and the display information that displays all the-- in this case, the name, the title, the ID, job level, and so forth.

Save and compile the class. So of course, now, going back to NetBeans, and you see now, we have the employee class, and that pretty much shows us how, again, in this case, we got all what we wanted to have from there. Continuing with the practice, we'll go ahead now and create the manager class. Again, this manager class extends the employee. And of course, it has an instance variable called employee list that is an array list of employee, because a manager manages more than one employee. And again, add the import statements, whatever, in this case java.util.ArrayList class.

Again, Hints. Again, click on the Error icon in the left margin of the-- again, and let the NetBeans add the import. So we already know about that. We've done that before in the previous practices.

Add a public set employee method to add, again, a single employee to the employee list. That would be, again, that we see here. Again, in this case, take a look at the, again, validation that you might need, again, to handle this method. And then, of course, create a method getEmployees that returns a list of the employee. Add the display information, again, about the employee, because obviously, the display information here of the superclass can be actually used inside this one. But we are overriding that in the manager because the display information in this about the manager works slightly different from one of the employee superclass.

So again, in this case, we might be a good idea to use the super keyword that calls the display information of the superclass. That's what they want us to do here. And so it would be, again, in this case, something like this where you have the display information method of the manager, which, again, first calls the display information of the ancestor, or the superclass, in this case, by calling super.displayInformation.

We already discussed the super keyword in the lesson. And of course, here, we use the enhanced [UNINTELLIGIBLE] each way through the list, and, of course, get the object-- cast them into an object of type employee, in this case, and print, of course. In this case, get the name and print the name of the employees.

And then they want us to create a skilled employee class from the diagram. Again, this class should also extend employee. It uses an array list instead of a String array when you create a skilled list, again, and then, of course, instantiate the field to an empty array list, and we see it again. And then, of course, in this case, we have an array list. This is how, pretty much, it's going to look like, the statement.

And add the necessary imports. Of course, add a method setSkill method, but as a single skill to the skill list. And of course, add a public and getSkills method that returns the skill list, again the list of the skill list.

Override the display information, again, in this case, method as you did in the manager class. We should know that the skill list object contains String objects. So in this case, we can actually directly print the object reference from the array list without casting it to the String. Again, the reason for this is that every object has a two-String method, and the println method invokes this for use, resulting in a display of the String value. Remember that, by the way, we already discussed the two-String method in the lesson.

Continuing with that, again, click and save, compile, and all that. Then, of course, in this case, create the editor class as, in this case, a subclass of skilled employee. Declare the prefersPaperEditing field as a private Boolean, again, and add a set prefersPaperEditing method to take a Boolean argument and returns a void, again, by assigning the argument to the private field. Add a getEditingPreference that will return, again, the String value. Again, use the if/else construct to check the value of the prefersPaperEditing, and set the return value to either paper or electronic.

Override the display information method, again, as you did in the manager class, again, in this case, invoking in the superclass method first, and then displaying the return value of the this.getEditingPreference with a suitable label. Click, and save, and compile.

Then, again, after that, create the remaining two classes, in this case, graphic illustrator and technical writer. Both of these classes extend the skilled employee class. Again, it is not necessary to add any additional fields or methods, nor it is necessary to override the display information.

And by the way, that we've seen. This based on the diagram that we've seen earlier here. If you remember, we already have discussed this earlier. And you can actually also look at this back in your activity guide.

Continuing with that. And of course, so we took care of that. Save and compile. Open the EmployeeTest class in the editor and examine the code. Again, if there are any errors indicated, check to make sure that everything is spelled the right way, and you got no syntax errors. You got no problem. And so again, then, after that, run the EmployeeTest class. And you should be able to, again, get an output similar to this.

Going back to NetBeans, and to just specify what is it that we're doing here, so you see, now, again, in this case, you will see that, pretty much, we have an editor class-- rather, we have an employee class. We already did it. Let's take a look at the manager class.

Here's the manager class. That extends employee. And of course, it has setEmployee and getEmployees. It has the print method in this case, and that takes an instance of the employee, and then called up the super print, of course. We'll see that, by the way, in the second practice. But again, we have only these here.

And then we have the skilled employee. And you see the skilled employee here that has, again, in this case, a field on an instance variable called SkillList of type array list, again, initialized with an instance of the array list, setSkill and getSkills. And then, of course, we have, after that, again, we decided to, in this case, create the editor class.

And you see how the editor extends the skilled employee. It has an extra, in this case, field, or instance variable called prefersPaperEditing. You have the method setPrefersPaperEditing that we discussed, and the getEditing preference. And then we [UNINTELLIGIBLE] paper or electronic. That's good.

And then, of course, we also created the graphic illustrator, if you remember. And we said we add nothing to it. And then the technical writer also, and we said, of course, we add nothing to it. And they're both extend skilled employee.

That's pretty much what they asked us to do. And then, of course, if you're on that, and just looking at the test employee, so again, in this case, we pretty much create instances of employee, and instances of managers, and editors, and, of course, and so forth. And that pretty much-- and then, of course, as you see, there is more code related to the Practice 2.

And so, again, let me go ahead, now, forward and continue with Practice 2 so that we can see the rest of the, again, the code, or understand the rest of the court that is, again, being written here.

## 3. Practice 12-1: Creating and Using Superclasses and Subclasses, Part 2 - 13m

So continuing with Practice Two and that's where, in this case, based on what we've done in Practice One we're going to go ahead now. And first of all, they gave us these classes Printer.java, Country.java, Region.java, Company.java, and CompanyTest.java.

And so first they want us to create a java interface in this case and practice with. And, again, this java interface that they want us to create is going to be called Printable. So you see we go New, Java Interface from the pop menu. Again, enter the Printable name of the interface. You see how we showed you again the wizard here how to do it. And then, of course, after that, click Finish.

After that, they want us in the Printable interface declare a public abstract method called print. It should, again, return void and accept zero arguments. So it would look something like this. Save it.

And then implement the Printable interface in the Employee class. So, again, we should remember that all of the other classes in this hierarchy are subclasses of Employee. Therefore, they now implement Printable through, again, an interface. So, in this case, it would look something like this. So we make Employee class implement the Printable interface. Of course, by making it implement the Printable interface that means that the Employee class will implement, in this case, the print method.

Again, the syntax checker now shows an error, as you see here, icon in the margin of this line. Again, move your cursor over the cursor icon to see the potential compilation error that it recognize that, as you see here. So, again, the explanation here is any non-abstract classes that implement an interface must also implement all the abstract methods of the interface. In this case, the only abstract method in Printable is print.

Again, change the name of the displayInformation method to the print again. And make this same change again to displayInformation in the other classes again that we remember we made the displayInformation at the beginning. And now we want to change it to print method.

So in this case, after that you need to change the names of the superclass method called in the first line of the new print method. Again, in this case, it is no longer the displayInformation. But it is the print method. Again, you do that in the Manager, the SkilledEmployee, and the Editor.

After, that you open the Printer class in the editor and examine it's only method, which is printToScreen. You should notice that this method takes an argument of type Printable. And, of course, any class that implements Printable would be accepted as an argument. In this case, this method invokes the print method of the Printable object and should look something like this.

And, of course, just looking at the NetBeams and what we've done so far, if you take a look here and you see, first of all, we start with the employees. See how we made Employee, in this case, implement the Printable interface. And, of course, now we implemented the print method here that prints the name, the job title, the employee, and the ID.

And, of course, we did the same thing for Manager. And, in this case, and because we're overriding the print method, so we change that. And you see now we changed again that it calls pretty much, in this case, the method print of the superclass, which is Employee. And by the way, we do the same thing with the SkilledEmployee, where, again in this case, we override the print method. And it also calls the print method of the superclass which is Employee.

And we also did that in the editor, if you remember. And in the editor, also, we have the print method, which is now overriding. It's called the print method of superclass. In this case, it would be the superclass would be SkilledEmployee. Employee

And then after that they want us to, again in this case, go to the print er class. And that's where we have a method called printToScreen that takes an instance of Printable. And that would be any instance of the class that implement the Printable interface. And then, of course, involve the print method to print whatever document it is. So, again, is just to update us what we have been doing.

And then in the main method of the Employee Test class, again we make a bunch of changes where we declare and create an instance of the Printer class. And then for every invocation of the displayInformation method, we comment that out. And, of course, we're going to use the printToScreen method of the printer object. Of course, pass in a reference to the Printable object I've shown in this case. So we comment this. And then now we'll go ahead and use this Save and, of course, and compile our program. And, of course, after that we'll run the Employee Test class and examine, again-- it should again be identical to the output that we used before with the displayInformation.

And, of course, go ahead and show that after we show the-- and that's exactly what we have done here. So you see we create a new instance of the Printer, new instance of the Manager, new instance of the Editor, new instance of the GraphicIllustrator, new instance of the TechnicalWriter. And then down here we go ahead and set the name for the Editor. Set the information of the Editor, the Job and calculate the Employee ID, set the Levels and the Skills and so forth and set the PrefersPaperEditing.

And then after that we go ahead and, of course, in this case invoke the-- or call the printer screen method on the instance of the reference variable to the printer called myPrinter and pass the instance myEditor to it. And that should, of course, print that.

And then we do the same thing by creating, again, by setting up the information for the Manager, again in this case, rather for the my-- again in this case, for the GraphicIllustrator that we see here, myGraphicIllustrator, set all the information that is needed here. And then we print it out. And then we do the same thing on the reference variable of the myTechnicalWriter here and myTW, which is a reference variable to the TechnicalWriter. We do the same thing. And then we print it out by calling the printToScreen method on the reference variable myPrinter.

And then after that we'll do it for instance of the Manager, where, again, we set all the information, about the Manager. And then we'll go out and print that. And that, of course, if we run this, that pretty much gets us the, again, exactly the output that, again, we showed you in the activity diagram.

Of course, in terms of discussions, again, one of the benefits of using interfaces is that you can abstract functionality that is used in different applications and different class hierarchies. Of course, this functionality is moved into the interface and can then be used anywhere that the functionality is required. Of course, for example, in this case, in practice the ability to display class fields with labels and formatting, again, has been moved into the Printable Interface.

Of course, now we tested the cross-application benefits by running a different application that also implements Printable. Of course, in this case, we have the Company class hierarchy that displays information about Duke's Choice top-level management, as well as that of its regional and divisional management. Of course, the code is very similar to what you saw in the Employee hierarchy.

So, again, here, again, close all the classes that you have been working with, and open Company, Region, Country, and, of course, in this case, and the Test Company. Examine, in these case-- and let's go ahead and do that first. So we're going to close all these classes that we've been working with. All of them.

And then, of course, now we're going to go ahead and print again the company, rather, open the company, exactly what they told us here, so Company, Region, Country, and, of course, CompanyTest so Company, CompanyTest, and Country and, of course, and Region. So we have all of them opened.

And so they want us to again, in this case, examine the Company class. And this is a superclass of Region and Country. We should notice that it implements the same Printable Interface that you, again, used in the Employee hierarchy. Examine the Region, Country, and CompanyTest classes, as well, and run it. Let's go ahead and do that.

So first we look at the Company. See it is a, again, implements Printable. It has these instance variables or fields-- CompanyName, TaxID, CEO. It has the print statement. It has a bunch of gets and sets methods.

And then we have, again, the Country. And you see that the Country extends Region. So let's take a look at Region first.

Region extends Company. So we got the Region. We have, again, this private reference variable or fields. We have a Region, a list of countries, again, a Region Manager, and, of course, the annual sales. It has a print method. That prints, again, in this case, the Region, the RegionManager, the AnnualSales, and, of course, the countries within this Region.

And then, of course, it has a bunch of gets and sets. It also has a method called addCountry that adds countries. And, of course, get the AnnualSales, add the AnnualSales and so forth.

And then, of course, the Country [? journal ?] that we made it extend Region. So, again in this case, while it also has extra fields-- Country, CountryManager, and the Languages, again, which is a new array.

We have the print method, which is, again, over here. That prints the Country, the CountryManagers, the predominant languages spoken in this country. And, of course, it has a bunch of gets and sets methods.

And, of course, looking at the CompanyTest, that's where now we go ahead and create an instance of the Printer, represented by the reference variable myPrinter., an instance of the Company, referenced by the reference variable myCompany, an instance of the Region, referenced by the reference variable called myRegion, and an instance of the Country referenced by the reference variable myCountry. Then we said the company's name, Duke's Choice, TaxID, the CEO. And we'll go ahead and print that.

Then we'll do the same thing for the Region where we said it is the Americas. The country is the US. Add the country Mexico, Canada. And, of course, the manager is, in this case, Eduardo Jimenez. And then, of course, the AnnualSales, which is $1.5 million, for example. And, of course, again, we'll go ahead a d print that.

And then we also said the myCountry data, in this case the US. The Manager is Rodney Baker. The language is English and of course, Spanish. And we'll print it out.

So now, of course, if we run this, of course, class, we'll go ahead, and it prints exactly what we want it. And, of course, here we did a little bit of formatting so that the printout will be friendly. So Company's Duke's Choice, the TaxID, CEO. And then we've got the Region, the Americas. Underneath you have Canada and Mexico and, of course, the US. And then, of course, in the Country US we have a Manager. And we have the predominant spoken languages over there would be English and Spanish.

And that pretty much ends the practices for lesson 12. Thank you.
