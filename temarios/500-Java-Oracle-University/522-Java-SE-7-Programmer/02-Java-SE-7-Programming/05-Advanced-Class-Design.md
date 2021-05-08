# 5: Advanced Class Design

1. Advanced Class Design, Part 1 - 13m
2. Advanced Class Design, Part 2 - 22m
3. Advanced Class Design, Part 3 - 26m
4. Practice 5-1: Applying the Abstract Keyword - 11m
5. Practice 5-2: Applying the Singleton Design Pattern - 6m
6. Practice 5-3: Using Java Enumerations - 6m

## 1. Advanced Class Design, Part 1 - 13m

OK, folks. Let's go ahead now and get into lesson number five, which by the way is going to cover advanced class design. Well, the objectives of this particular lesson is to be able to design general-purpose base classes by using abstract classes, looking at construct abstract Java classes and subclasses. We're going to model business problems by using static and final keywords. So Gavin asked about static and final, so we're going to take a look at these keywords and what they mean in Java. Implement the singleton design pattern. And of course distinguish between top-level and nested classes.

Let's start by modeling business problems with classes. So we've seen inheritance, and we know inheritance-- or by the way, sometimes it's called subclasses-- it is pretty much an essential and important feature of the Java programming language. Again, this inheritance provides some code reuse through either the method inheritance where some classes avoid code duplication by inheriting what? Method implementations of the parent classes. And of course generalization where code that is designed to rely on the most generic type possible is easier to maintain.

So in a sense, we have an example here where we've got a caller, and that's a client. And of course, this caller makes use of either a mobile phone or a television. In this case, we make mobile phone and television classes inherit from what? An electronic device. And in this case, we have the turn-on and turn-off methods that, by the way, can be now used either by the mobile phone subclass or television subclass.

So when you're designing object-oriented solutions, we always attempt to avoid code duplication. And how do we do that? By looking at the sibling classes and see what's common as methods in those classes. And of course move all of those to what? To the parent class. That's pretty much how we want to look at that. Which by the way, in general, it is something that we all do in our daily lives. Actually, those common things that everybody does, we have a tendency to create a mechanism by which they're done by one person, and then they don't have to be duplicated by many, many different people.

Let's look at enabling generalization. Well, coding to a common base type allows us for that introduction of the concept of new classes with little or no modification of any code that depends on more genetic base types. And we see here for example, where here we declare a reference variable of type electronic device. And we can go ahead and initialize it with a new instance of television because we know that television inherits from where? From electronic device. And we've seen that in the previous slide, right? OK.

And then, of course, after that we'll go ahead and invoke the turn-on here on that reference variable dev, for D-E-V. Of course, all electronic devices can be turned on. Of course, always use the most generic reference type possible. And by the way, Java IDEs like NetBeans and other ones may contain some manufacturing tools to assist in changing existing references to a more generic type of base, in this case.

OK. Continuing with that and now looking at identifying the need for abstract classes. Well, subclasses may not need to inherit a method implementation if the method, of course, is specialized. And here's an example where, in this case, we have a class called television that extends electronic device. And of course, this television implements the turn-on method where it calls a change channel and passed to it one maybe going to the channel one, and of course initializes the screen. And of course we have a method, which is a turn-off method. And of course it's going to be implemented the way we want it to be implemented.

And down here, we have the change channel. And that takes an integer representing the channel number. And of course, it does what it does with it here. And here, we have the initialize screen. And that's, of course, a method that is implemented here. So in general, we say when sibling classes have common method, again, it is typically placed in the parent class, which makes sense. This way we're actually focusing on generalization.

And of course, usually the parent class implementation will always need to be operated with a specialized implementation, if need be. Like for example, we've seen how yesterday we did override the getDetails method for manager, and we had a getDetails method for employee, but still we did override because it turned out that the getDetails gives us also the department name for a manager. OK?

All right. Continuing with that and looking at defining abstract classes. Well, what's an abstract class? A class that can be declared as abstract by using the abstract class level modifier. For example, here I have an electronic device class, which is, by the way, a parent class. And look what we've done here. We actually declared it as what? A, an abstract class. Everybody sees that?

And of course, an abstract class can be subclassed. And here's an example where, in this case, I have my electronic device class, which, by the way, can be extended in this case by what? Subclassed by the class television. OK? So we now have television which extends the electronic device.

And of course, an abstract class, by the way, and that's very important cannot be instantiated. That's what's important. So really, the purpose of the abstract class is to capture that generalization all your object. OK? And as you see here, if you want to try to create a new instance of electronic devise, of course is going to give you what? An error, as you see here. So an abstract class will typically be extended by a child class but, of course, may be used as a reference type. And we'll see that later on.

Let's go ahead and look now at defining abstract methods and what they mean. Well, a method can be declared as abstract, again, by using the abstract method-level modifier. And in this case, I have a class called electronic device. And this class is abstract. And as you see here, we have a couple of methods here which are turn-on and turn-on. And we decided that these classes are now defined as what? As abstract methods. where? In the abstract class. So these methods here, which are abstract, they are defined as abstract methods within the abstract class called electronic device.

An abstract method, by the way, we cannot have a method body. That's why you don't see the braces, right? Curly braces. You don't see them. And of course, they must be declared in the abstract class. And they are typically overridden in the subclasses. That's where you override these methods or what we call implement them inside the extended classes or inside the subclasses.

An abstract method is pretty much a way to guarantee that any child class will maintain a method with a matching signature of what? Of that abstract method. Right? OK.

Continuing with that and now looking at-- Yes.

What is the difference between interface and abstract class?

Good question. So what is the difference between an interface and an abstract class? We defined--

One cannot be instantiated, right?

Yes, of course. But interfaces are used for the purpose of, again, creating a contract, some kind of a contract. So we'll get a chance to actually define that. Once we define the interfaces, then we come back and compare both of them. So right now, a short answer is an interface is usually used to define or implement some kind of a contract between the class and the interface, which means implementing the methods of the interface. But let's wait a little bit, defer, continue with abstract classes, understand the concept of abstract classes, and then when we get into interfaces and understand them, then we come back, and at that time we'll talk a little bit about the comparisons. OK? All right? Thank you.

OK. So again, when a child class inherits an abstract method, it is inheriting a method signature but not the implementation. So that's why whenever we declare abstract methods inside an abstract class, we typically don't use braces. So no braces pretty much, in this case, are allowed when defining an abstract method in an abstract class.

Now looking at validating abstract classes. Well, there are a bunch of additional rules, folks, that apply when we use abstract classes and methods. And an abstract class may have any number of abstract and non-abstract methods. A-ha. Now look what we've done. We've now decided that based on the rules that we can have non-abstract methods in the abstract class. Something, by the way, that you will not have in an interface. And in an interface, you always have abstract methods. OK? And well look more about that when we get into the interface.

So when inheriting from an abstract class, again, you must do either of the following that we have here, either declare the child class as abstract or override all abstract methods inherited from the parent class. So that's typically what it is. So if you have an abstract class that has abstract methods, so when you subclass that class and then, of course, that subclass will either have the implementation of your abstract methods of the parent class, or you can still declare them as abstract. OK? And by the way, declaring the abstract methods of the parent class as abstract methods inside the subclass really is nothing but delaying, in this case, the inevitable, which means at some point in time we have to implement those methods within the class hierarchy.

Or you can, in this case, override all abstract methods inherited from the parent class. Again, failure to do so will result in a compiler error. And you'll get something similar to this one here, where, in this case, if you don't override a particular abstract method, you get an error at compile time. And by the way, use abstract methods to outline functionalities required in the child classes.

And here we have a nice quiz just to break and of course answer a bunch of questions about abstract. Here the quiz says, to compile successfully, an abstract method must not have what, in this case?

Method implementation.

A method implementation. Thank you. And that's B.

## 2. Advanced Class Design, Part 2 - 22m

Continuing with that, now let's go ahead and take a look at static keyword. Well, the modifier is also very interesting, and it's sometimes useful for us. And it is used to declare fields and methods as what? Class-level resources. So static class members typically can do what? They can be used without object instances. You do not have to create an instance of type class where you define your static methods or fields to be able to use these static methods or what we call static members.

They are used when a problem is best solved without objects. So there is no need to create objects. That's why, if you remember yesterday, I was mentioning also that lots of times, abstract methods we call them utility methods. Because you do not have to actually have an instance created to be able to make use of a static method.

And so we said they're use when objects of the same type need to share fields. So if objects of the same type need to share fields, then that's a very, very nice mechanism by which you achieve that. And of course these static class members should not be used to bypass the object-oriented features of Java unless there is a good reason for that.

And in Java programming language, it is typically an object-oriented language and like the is C and C++ which, by the way, were inherited from the procedural design of the C language. So when we develop in Java, we always try to attempt to design an object-oriented solution.

Continuing with that, let's go ahead now and start by digging into the static methods. So static methods are what? They're nothing but a bunch of methods that can be called even, by the way, if the class the are declared in is not instantiated. By the way, static methods are called class methods. Many, many times we call them that. They're useful for APIs that are not object-oriented. For example, the math class. That contains many static methods.

And remember, you can use random. We're going to see the example of random and a bunch of the ones later on. Or yesterday, I was mentioning about pi. Pi is a static field. We'll talk about a static fields later on.

And by the way, these static methods, they're commonly used in place of constructors to perform tasks related to object initialization. They cannot access non-static members within the same class. Very important. And they can be hidden in subclasses but not overridden. You cannot override static methods, but you can hide them. Hiding that means what? Declaring them as what? Private. OK. And of course, no virtual method location.

And so you can, by the way, them. Here's an example where we showed you here, in terms of specifying a factory method that may also produce an object that subclasses the methods return type. An example here where here we invoke the getInstance on, of course, the number format class, in this case, calling the getInstance using the number format class to, again, get, in this case, an instance of the number format. Everybody's following, folks?

Continuing with that, let's go ahead now and look at how we implement static methods. Well, static method can be used before any instance of their enclosing classes that have been created. So for example, here I have a class called StaticErrorClass. And in here, I declared an instance variable, which is, in this case, x of type integer. And it's private.

And down here, I have a static method. And this static method is called staticMethod. As you can see, it returns void. And look what I tried to do here. I tried to do what? I tried to access the instance variable. Can I do that? No, I can't. Because we said that static method can access only what? Static variables. OK. So of course, in this case, obviously there would be an issue in this case.

And here also I have another method that I declared here called instanceMethod that, of course, assigns to the instance variable x And of course, in this case, I'm trying to access this method inside the static method. Of course, I get what? I get compile error. OK. So remember that static methods can be used before any instance of their enclosing classes have been created.

And also, we said that what it means is that in running JVM, there may not be any instance of that particular class already existing. But static methods, by the way, can never access their enclosing class instance variables and of course all of their non-static methods. For example, here I have a non-static method within the class static error class, and I simply cannot access it from a static method. Everybody's following here, folks?

[INAUDIBLE]

Yes. As long as you're working with static variables, static fields. OK? For example, usually a static method is always used to initialize, for example, a static field. OK? Or initializing a static object. OK, good. Thank you.

Continuing with that, and of course the question that we all have is how do we call a static method? Well, here's an example where, again, in this case, I'm calling what here? The random method from where? From the math class of the Java API, right? So it's going to create a random number, in this case, which is a double and use it to, of course, save it into the variability d of type, in this case, double.

I can also here call a print message method, which is, in this case, a static method, on the class static utility class, for example. And of course, I can go ahead and create a new instance, in this case, of static utility class, in this case, and I'll go ahead and use this. This, by the way, works, but it's misleading.

So again, when calling static methods, what we say always we should quantify the location of the method with a class name if the class name is located in a different class other than the caller. And by the way, is not required for methods within the same class. If you have methods within the same class, they are static methods, you just call them by their name, and you don't have to qualify them with the name of the class. Got that? OK.

And we say avoid using an object reference to call a static method because usually a static method, like we said, it is a utility type of a method. And we do not need any reference to that class to be able to call it. We just call it through what? Through of the class name.

So now what should we remember about static methods? We should remember that static methods can be called through what? Through the class name, right? You don't need any instances of the particular class to create it to be able to call that static method, right? We also said that a static method cannot access what? Instance variables and non-static methods that are part of what? Of the class. Good, good, good, good.

Now looking at static variables, well, static variables they're what? They are a bunch of variables that can be accessed even, by the way, the class they are declared in has not been instantiated, which means there is no object to instantiate to access a static variable. And static variables, by the way, they're called class variables. Sometimes we call them class variables. They're limited to a single copy per JVM. That's important. OK?

And of course, they're useful for containing shared data. A-ha. Now we kinda have an idea that shared data. For those who know a little bit about a C language, you remember the concept of global variable? That's kind of similar. So of course that shared data can be now accessed by what? By more than one object once they are instantiated.

And so we said, it's useful for containing shared data. Again, static methods store data in the static variables. That's again coming back to what Majeet what we were discussing, and I said how static method can actually, in this case, store data in a static variable or initialize a static variable. And all object instance share a single copy of any static variable. That's what it is, typically. And by the way, initialized when the containing class is first loaded. OK?

So remember, an application developer supplies, again, supplied classes are typically loaded on demand again for when they are first used. So static variables are typically initialized when their enclosing class is loaded. So what we could do is we can say, if you attempt to access a static class member, then you're automatically triggering what? You are triggering the loading of the class by the class loader. Good.

I have a second question.

I'm sorry?

Limited to single object per JVM?

Yes. It's limited to a single. So whenever you are working with a class, you have a class which, pretty much, is now loaded, and, of course, it always needs a JVM. So let's assume that class that has instance variables but also has static variables. So a static variable, when it's, again, created, in this case, when you work with static variable, which is part of the class, or when you make, it is pretty much a single copy that is limited to the JVM where the class is loaded, right? And of course, that static variable now can be accessed by or can be used by all instance of the type that particular class. So it's kind of a shared type of a data that can be shared by more than instance of type that class. Got that?

So for example, you can say that I can use a counter. And every time I create an instance of counter, I increment the counter in the constructor. So that counter is shared by all different instances of the class. But they represent what? The distance variable number that was created. Got that? That's the idea. Good, Majeet? Following? Thanks. So remember that an attempt to try to access a static class member can trigger the loading of your class.

Let's go ahead and look now at defining static variables. Well, here's a class, in this case, called StaticCounter. Oh, speaking of what I just mentioned to you, here's the example. And so I was mentioning that example, so let's go ahead and look at that. So here, look at this class called StaticCounter. It actually now makes use of a static variable counter, which by the way, is a static and stop integer initialized to zero. So if you take a look here, this is again one copy in memory per JVM. Got that? OK, good.

So now, in the constructor, look what we do. We increment the counter, which means, in this case, every time you instantiate a new instance of type static counter what's going to happen? It's going to have a value of that counter, which will be what? The next increment of that counter. And then, by the way, we also specify here a method called getCount, which, by the way, is static and returns an integer. That's the one that will access the static member and return it. In this case, it's returning the counter.

So again, in many technologies that are used to persist application state in Java, again, only save instance variables. Again, maintaining a single object that keeps track of shared state may be used as an alternative to a static variable. We'll see that later on.

Now how do we use static variables? Well, here's an example. What is it that we're doing here in the first one, folks? We're accessing the static member of pi of the math class, which, by the way, pi is, in general, 3.14 and so forth, right? OK. And here, again, we create a new instance static counter. And then here, we can go ahead, and if we print, we want to print the counter, we'll just go ahead and call the getCount, which, by the way, here is this one here, which is static, and of course is going to return the counter for me over there.

So when accessing static variables, we always say you should qualify the location of the variable with the class name if the variable is, of course, located in a different class than the color. Again, not required for variables within the same class. You don't have to qualify them with the class name. And by the way, avoid also using an object reference to access a static variable. We always access static variable through what? Through the name of the class.

Continuing with that, now let's take a look at static imports. How many we have heard or have seen static imports before? OK. That's fairly new to all of you. Again, this was introduced in the Java SE 1.5. A static import statement makes the static members of a class available and their simple name.

For example, if you do a static import of this, the random of math class, or all wherever it's in the math class, then calling the math random method can be, in this case, written as what? Simply random. Why? Because, in this case, we did a static import, which means by calling random, it really means like you're calling that. So it's kind of similar to what you folks have seen when you use the import statements, right?

And by the way, we always tell you pay attention and be careful with this, folks. Because overusing static imports can actually negatively impact the readability of your code. Think about Java.sql.date and Java.utl.date. OK?

And of course, we have a quiz here. And this quiz says, the number of instances of static variables is related to the number of objects that have been created.

False.

That's false. Thank you.

Let's go ahead and continue. And now we're going to see also a very interesting keyword, and that's final. And we'll see what final is useful for us, in this case. How do we use it? A method can be declared final. What does it mean? Final methods means what? Means they cannot be overridden, right? OK.

So for example, if I have a class, in this case, called MethodParentClass where I have a print message method, which, by the way, we decided to it, again, in this case, declare it as what? OK? And of course, this will print, this is a final.

And then later on, we create a class called MethodChildClass, which extends MethodParentClass, which is this one here. And then now what we want to do is we want to override the print message. Of course, this is what? A compile time error. OK.

Again, the question that always people have is what's the preference by using this final. We always say there's little to no preference benefits when you declare a method as final. Again, the only thing is method should be declared as final only to disable method overriding. Everybody's following, folks?

Let's go ahead and look at final classes. Final classes is also interesting. What does final classes mean, folks? Final class can be declared final and final classes may not be extended. So if you want a class not to be extended, you can actually use, in this case, final. That's why in the EJBs we say they shouldn't be final. Why? Because the app server will create an instance of an EJB that is stateless or stateful session bean or a message-driven bean through, of course, the inheritance, and it's done underneath the hood.

So let's assume that we decided that this class is called FinalParentClass. And we decided that it's going to be what? A plus. But in addition, it's going to be final. So if now we attempt to actually extend that class using the child class, what's going to happen? You're going to have a compile time error. Everybody's following? OK, good.

Continuing with that, let's look at final variables. Final variables are interesting folks. Let's go ahead and look at final variables. So final variables, the final modifier can be applied to variables, and final variables may not change the value after they are initialized. That's the idea behind a final variable.

So final variables can be, by the way, class fields, again, final fields with a compile time constant expression, again, constant variables. And static can, again, be combined with a final to create an always available, never changing variable. So this is really equivalent to what? Constants that we see in a C language.

So of course, final variables can be method parameters. You can actually pass them as parameters to methods. And they can be local variables to a method too or to a block of code. We should also note that final references must always reference the same object, but the contents of the object may be modified. This is quite interesting. So whenever we say a final reference of an object, it means what? The address is not changing. But the content of the object can be changed if you have some set of methods, right?

Some of the benefits and drawbacks of the final variables. When we say they handle bug prevention, what do we mean by that? Final variables can never have their values modified after they are initialized. So again, this behavior functions as a bug prevention mechanism, which means if you now try to modify that final attribute value, of course the compiler is going to scream at you.

And it's also used for thread safety. The immutable nature of a final variable eliminates, of course, what? Any of the concerns that come with concurrent access by multiple thread. So if you have an immutable, in this case final variable, you're not going to worry about a thread modifying it because it is immutable. So obviously, no thread is going to bother. So in that case, we're not going to worry about the thread safety what we need to synchronize which thread is modifying now that variable.

And of course, it's used for final reference to objects. So we said that final object reference only serves to prevent a reference from pointing to another object. OK. That's pretty much what it is. But you can always, by the way, change the contents of that object. And also we say if you are designing immutable objects, you must, again, prevent those objects fields from been modified. So final references also prevent you from assigning a null to that particular reference, because we said that it's going to point to always that particular object. You cannot just say, no, it's going to change, it's not going to change anymore.

And this is really useful for what? This is useful to prevent the garbage collector to collect the object from you. So if you have, in this case, maintaining an object reference prevents the object from being garbage collected by the garbage collector. Everybody understands the concept, folks? So this is quite interesting.

## 3. Advanced Class Design, Part 3 - 26m

Now, looking at declaring final variables. How we do that? Well, here it is where we have a variable, in this case ExampleClass, and in this case, we declare a field, which is an attribute or an instance variable field, which is going to be of type integer it's final. We also do the same thing here for forgottenField. And then here we declare a new instance of date, and we make it final, which means this is a reference variable that is going to always point to what? To that object that we just created on that line.

And then here, we now declare a variable that is what? Static and final. If it's static and final, and of course, initialize it to 10 then it is going to be what? A constant variable.

By the way, constant variables in Java, by convention, we all write them in capital case.

And if you take a look here, we have a VariableExampleClass. Is this good? OK, so we say that final fields must again be either what? Assigned a value when they're declared. or what? Assigned a value in every constructor. Right? So if I look at this constructor here, I've got a problem here. If I look at NetBeans I'm going to see an error that is going to signal to me over there that it has a problem.

What is it that we see here as a problem, folks?

[INAUDIBLE]

Thank you, the other field is not initialized. So the forgottenField not initialized. And also here, I have a method called changeValues, and by the way, look what it does. It takes a what? A final parameter. Of course, here what's going to happen is, and then I take that final parameter and I do what to it? And I try to assign one to it.

Again, this would be a compile-time, because this, of course, we'd be somehow, somewhere initialized already. And now I'm trying to attempt to assign one to it, and of course, I'll have a compile-time error. Everybody's following here? Very important. Good.

And then down here, I am going to set the time to zero for the instance date. Can I do that? Yes, I can, because we said that when you have a final reference to an object, what is it that you want from that? You want the address not to change. But then you can go ahead and access and change the content of the object. Everybody's following? Good, good, good.

And how about if I attempt to do this? What is it that I'm trying to do here, folks? I'm trying to change the address of reference variable date to point to another object of type new Date, and of course, the compiler going to scream at me here.

And then here, I declared a local variable and it's in addition what? It's final. So first, I go ahead and assign to it 42. If I attempt to assign to it 43, what's going to happen? It's going to, of course, give me a compile-time.

So let's go ahead and look at this example. And let me open that example just to show you how actually all of this is handled. For that, let me you use the-- the name of the example was variable example class, so it should be--

[INAUDIBLE]

--FinalExample, yeah. And here it is. So exactly what we said. Look at that. What is it now? If you move the mouse, what does it say here, folks? It says, variable forgottenField might not have been initialized. So that's why it's complaining within this constructor.

And then now here, if you move the mouse here, it says that the final parameter, param, may not be assigned. Makes sense. And then down here, we say that it cannot assign a value to final variable date. And then of course, down here, we say that variable localvar might already have been assigned. And yes, it already has been assigned here. Everybody sees that? OK, good. Good, good, good, good, good, good.

All right, so again, static final variables. A field that is both static and final is considered as constant. Again, by convention, we said that constant fields are written using upper case letters and with underscores, like the one that we've seen here.

And of course, we have a quiz here. And it says, a final field or instance variable can be assigned a value either when declared or in all constructors. Is this true or false, folks?

True.

And that's true. Thank you.

Let's continue. And now, looking at when to avoid constants. Well, public static final variables can be very useful, but also there is a particular usage factors that we should avoid. So constants typically can provide a false sense of input validation or value range checking. And to actually understand this, let's go ahead and consider this method that should receive only three possible values.

And in this case again, we declare a new instance of the Computer, and then on it invoke the setState and pass to it the POWER_SUSPEND. Again, this is an int constant. Nobody is going to prevent us from what? From creating a new instance, and since this is represented as an integer, I can go ahead and pass 42 to it.

Well, it turns out that this is really bad for validation in this case. Why? Our bad range type value range checking. Why? Because I know that in general when I work with POWER_SUSPEND and also on and off, I'm really using the integers zero, one, or two. So to be able to avoid these type of errors like this, what I could do is I can put an IF statement inside and say that if you enter an integer other than zero, one or two, I'm going to consider it as what? An error. I could do that.

Even better, I can actually resolve. So instead of writing that code, which by the way, afterwards it becomes a little bit of a bad practice, what we could do is we can actually fix this problem through what? Anybody has an idea? What is that we need to do to be able to fix this issue?

First of all, everybody understands what's the problem here? Here, because 42 is an integer, so nobody prevents you from passing 42. But then semantically, it doesn't mean anything. Because the semantically, you either have to have a zero for off, a one for on, and a two for what? For POWER_SUSPEND. Right?

So obviously here, we definitely should not have this method setState that accepts any type of integer. It has to accept an integer that could be what? A zero or one or two, because they have meanings. Right?

So in that case, how can we resolve this issue? In fact, we fix that problem starting Java SE 5. Anybody knows? Using enums. Thank you. Let's go ahead and look at that.

Well, to handle the type safety, we make use of the typesafe enumerations. Java SE 5 added this typesafe enum to the language, and enums are created using a variation of the Java class. And of course, provide a compile-time time range check. That's the advantage.

So for example here, I can go ahead and create an enum called powerState. Again, these are references to the only three power states, in this case which is what? OFF, ON, and SUSPEND. And now of course, in this case, an enum can be now used in the following way. Where I can pass this, and if I pass this, by the way, this method takes the powerState reference without any problem.

So again, in this example, just to again showing here the compiler performs the compile-time time check to ensure that only a valid powerState instance or instances are passed to the setState method. Again, [UNINTELLIGIBLE] checking overhead. Here is incurred our run time. Which means, you don't have to write that IF-ELSE, and so forth method. Everybody's following? OK, good.

So and of course, the question is how we are going to use this enum. So how do we use it? Enum references can be again, statically important. So we can go ahead and import them. Here's how we do it. And then in this case, I can have a class Computer that extends ElectronicDevice, and I can go ahead and declare, in this case, an instance of powerState and then assign OFF to it. Everybody follows that?

So that works why? Because I imported this. And of course, enums can actually be used as an expression in the switch statement. Here it is. Where I have a setState method, that takes what? An instance of powerState, and then I can use that to again check the cases, in this case. Case OFF or case ON or case SUSPEND, and so forth. Everybody's following here, folks? OK, good.

Continuing with that, let's go ahead and look at some of the complex enums. Well, enums can again have fields, methods and private constructors. So here is for example, an enum called PowerState, and I can go ahead and use constructors here, where in this case, we call a PowerState constructor to initialize the public static final OFF, in this case. The power is off, or this one, the second one, the usage power is high, or the second one in this case, the power usage is low.

And by the way, we said that also enums can have what? Fields. So here is a field, in this case called description of type String. And we also said that enums must have, by the way, what? Private constructors. So that's why here I have a constructor, and by the way, it's private. And it takes a string and use it to initialize the instance variable here of the enum. And of course, it can have also methods, like in this case, getDescription, which returns a description.

Remember, the constructor may not be public or protected. It must be always what? Private. All the time. So you may not instantiate an enum instance with a new instance. So you cannot do that. Everybody's following, folks? Good.

And here's a nice example. And in this example, again, what we're trying to get at, in this case, is pretty much to answer these particular quiz. An enum can have a constructor with the following access level? Which is what is the answer here?

[INAUDIBLE] Private.

Private, which is D. Thank you.

Let's go ahead and look at some design patterns. What's design patterns? Well, design patterns, by the way, they are typically reusable solutions to common software problems. It turns out that in software we have a lot of design patterns, and you folks remember the Gang of Four design patterns which are well known. OK. And so there are a lot of design patterns. There's a whole catalog of design patterns that allow us to, of course, in this case, use these design patterns to have a robust design. You could learn more about design patterns in this case, from the Java design pattern book, which is again, called Design Patterns. And lots of times we call it again the Gang of Four, because of the four authors who wrote the book.

And design patterns, of course, are a vocabulary used to discuss design or document design. And for that, let's go ahead and look at the singleton pattern.  What is a singleton pattern? How many of you have used or heard of singleton patterns?

So a singleton design pattern details a class implementation that again, can be instantiated only once. That's the idea behind again, the singleton. So here's an example where in this case, we have a class called singleton class. And as you see here, so to implement a singleton design pattern, first we go ahead and use a static reference to point to a singleton instance. OK? Making again, the reference final to ensure that it we never reference a different instance, so that's what we have here. OK?

And of course, in this case, we'll use a constructor in this case, which is in this case, a singleton class. Which by the way, is also private. OK? So the first thing is we use a static reference to point to the singleton instance, and we have that in the step one, here.

Step two, we add a private constructor to a singleton, and we have it here. OK.

And the third one, we in this case, provide a public factory method that returns a copy of the singleton. And that's for example, in this case, using the getInstance, which by the way, returns the instance that I just created here, as an instance of type singleton. Everybody follows that, folks? OK, good.

Factory methods, by the way, provide a very, very nice flexibility and typically, are always used in most singleton implementations. So for example here, I have a factory method for example here, that returns for me an instance of the singleton.

How about the concept of nested classes? Well, a nested class is a class declared within the body of another class. Again, by the way, nested classes can have multiple different categories. They can have inner classes. By the way, inner classes can be what? Member classes within the outer class. They can be local classes. They can be local to a method. Or they can be anonymous classes. Anonymous classes means what? They're inner classes without a name. Got that? OK, good.

And of course, they could be static nested classes. OK? Again, the difference between the inner and the static nested classes, they are static. And of course, nested classes are commonly used in applications with GUI, graphical user interface elements. We see that a lot. And of course, we can limit utilization of a helper class to the enclosing top classes.

Some reasons to use nested classes. Let's go ahead and look at these. And we say that again, some of the information can be in this particular website. But in general, we say logical grouping of classes. So if a class is useful to another class, or only one other class, again, then this is a logical to embed that particular class inside the outer class. Again, to keep them together. So again, this nesting of such helper classes make their package more, of course, streamlined.

Also, they help increase encapsulation. What do you mean by that? How about if we now have two top-level classes, A and B, and where B now needs access to members of A, and it turns out that those members of A or fields of A are private. So if you want a class to access private members of another class, what you could do is you just put that class, in this case B, for example, if you put it within A, then B will have access to all of the private fields of A. Got that? So a nested class has access to what? To the private fields of the outer class. Got that? OK.

And of course, they use for some of the reasons to use nested classes, again for readability and maintainability of the code. So nesting small classes within top classes place the code closer to where it is used. Everybody's following, folks? OK, good.

Let's go ahead and look at an example of an inner class. Here's a very good example that we have. It's a class called Car, and in this class I declared an instance variable running, of type Boolean, and initialize it to false. And then here, I go ahead and declare a reference variable to an Engine called engine with lowercase E, and initialize with a new instance of the Engine.

But what's good about it, folks, here is that I inside the class Car go ahead and define what in here? I define a class. It is an inner class called what? Engine. And that's class itself has a method called start, right? Did you see that? And of course, this start will go ahead and set the running in this case to true.

And I could do that, even though this is private, I can actually do that without any problem, because I know that a nested inner class has access to what? The private fields of an outer class.

And of course, this class Car has also a method called start, which by the way, calls the start method of the Engine. So you see that there are two start methods. One that belongs to the Car, and the other belongs to what? To the Engine. So we always said that inner classes, again, they are considered part of the outer class, and inherit access to all of the private members of the outer class. And we saw the example here.

And by the way, just so that we make the difference, a static nested class is not an inner class, but it's declaration appears similar to the one of the, in this case, to the inner class. Except that you have an additional static modifier on the nested class.

Also, by the way, nested classes can be instantiated before the enclosing outer class, and therefore are denied access to all the non-static members of the enclosing class. So remember that.

Ahh, let's go ahead and take a look at what? Anonymous inner classes. Well, in this case, an anonymous class is used to define a class with no name. And in this case, we use the object class. And of course, we made it subclass. In this case, the object class has been subclassed. Of course, it is that class that is being instantiated, and we see it here. Everybody sees that?

And of course, when you compile this class, what's going to happen is the compiler actually creates in addition to the outer class, it actually creates this new one here, class called outer$1. OK. This will be generated. Again, the one here is the index number of the anonymous classes in the enclosing class. And of course, the outer class is the same name of the enclosing class, which is in this case, whatever you have. So whatever you have in this case, which is AnonymousExampleClass.

Anonymous inner classes could be local classes, in a sense. Local classes to what? To methods. Everybody sees that? OK, good. And of course, what are we doing here? Overriding the toString method.

So here's a quiz, and it says, which of the following nested classes type are inner classes? Yes?

Anonymous.

Anonymous and what?

[INAUDIBLE]

Say it again? Anonymous and local, right? Inner classes can be local, too. Got that OK, good.

And that's pretty much what we wanted to say about this lesson. So again, we looked at designing general purpose base classes by using abstract classes. We looked at construct abstract Java classes and subclasses. We looked at the modeling business problems by using static and final keywords. We looked at implementing a singleton design pattern. And we looked at distinguishing between top-level and nested classes.

Of course, we do have a bunch of again, labs in this case, or practice labs. And we have the one that is used to apply the abstract keyword. And the second one is related to applying the singleton design pattern. And the third one, which is making use of the Java enumerations. And the third one is recognizing nested classes.

Of course, you can also find them in your book activity guide, where in this case, what we're going to do, folks, is looking at applying the abstract keyword. Like I mentioned to you, you can actually use a summary level of the version of the exercise of the lab or the practice, or you can use the detailed one. And this is the detailed level that actually gives you more code about that. OK?

And of course, in practice 5-2, we also have a summary level if you want to start from a summary level of the problem, in this case, related to applying the singleton design pattern, or you can make use of the detailed level that gives you more code to be able to work with.

And of course, we have an optional one here, which is the 5-3 one. And that helps you, or if you want to again, take a look at using the Java enumeration again. I advise everybody to try these, even though they're optional.

And the last one, which is also optional, and also I advise you to try it, which is recognizing nested classes.

And that's pretty much what we wanted to do so far. So let's go ahead and do the practice labs for lesson five, and then once we finish with it, we'll continue with the lecture of the lesson six. Thank you.

## 4. Practice 5-1: Applying the Abstract Keyword - 11m

After looking at Lesson 5, which talks about advanced class design, where we looked at the general design purpose-based classes by using abstract classes, we looked at constructing abstract Java classes and sub-classes. We looked at modeling business problems using the Static and Final keywords. We looked at implementing the Singleton design pattern, and we looked at distinguishing between the top-level and nested classes.

Let's go ahead and look now at the practices for this lesson. And for that, we are going to first the Practice 5.1. As always, we look at the detailed level. This way, we can actually see a lot of details about that. And in this one here, we'll take an existing application and refactor the code to use the Abstract keyword.

So in summary, here we've been given a project that implements the logic for a bank. The banking software supports only the creation of time deposit accounts. The time deposit accounts allow withdrawal only after a maturity date. Time deposit accounts are also known as term deposit, certificate of deposit, CD, or fixed-deposit accounts.

You will enhance the software to support checking accounts. Again, a checking account and a time deposit account have some similarities and some differences. Your class design should reflect this. Additional types of accounts might be added in the future.

So first, we'll go ahead and, of course, open that project. So obviously, on NetBeans, we have it open. And then, of course, we'll go ahead and run the project. And this is what we see, in our case here, as an output. So again, this is just looking at the 5.1 details. And then after that, they want us to, again, review the time deposit account, just by looking at the TimeDepositAccount just to review the code, which extends Account, by the way, and it overrides the Withdrawal method and the getDescription.

And continuing with the lab, so we identified the fields and methods, like I showed you on the NetBeans. And now, they want us to create a new class called Account in the com.example package. Again, code the Account, this class Account, and of course, as Abstract. Let's go ahead and look at that.

And of course, as you see, move the Balance field and the getBalance, deposit, and toString methods from the TimeDepositAccount of the Account. Note that the field and method should be removed from the TimeDepositAccount. Add the abstract getDescription method to the Account class. Add the abstract Withdrawal method to the Account class.

And of course, the Account class should have a protected access level Balance field. If you have already moved this field from the TimeDepositAccount, just change the access level. Add an Account class constructor structure that has a Double Balance parameter. Modify the TimeDepositAccount class, of course, in this case.

So first of all, let's go ahead and look at the Account class. For that, here it is. So it's an abstract class. It has a balance. It has the Account constructor. It has the getBalance. It has the Deposit method. It has the overriding, the toString method, the Withdrawal, and Deposit, which, by the way, are now abstract, as you see here on the NetBeans.

And then in addition, they said, modify the TimeDepositAccount class. Again, it should be a sub-class account. And modify, again, the constructor to call the Parent class constructor using the Super. And of course, make sure that you are overriding the abstract Withdrawal and getDescription methods inherited from the account by using the @Override annotation.

Modify the customer-- rather, let's go ahead and do that first. So here's the Time Deposit extends Account, as you see the constructor, TimeDepositAccount called Super, which is the one of the account, the Super class. And as you see here, we override the Withdrawal method, as you see here, because it was abstract in the Account class. And now, of course, we implement that.

And in addition, we Override the getDescription too. So that's what we've done here. Go back to the NetBeans, and you will see that we actually are overriding the Withdrawal method, creating an instance of the Date called Today, and of course, call the After method to it. Pass the maturityDate value or variable. And of course, use an If/Else here to pretty much handle the logic. And override the getDescription method, exactly what they told us.

After that, they asked us to modify the class Customer and CustomerReport classes to use Account references. Again, in this case, open the Customer.java file and change all the TimeDepositAccount references to Account. And do the same thing, open the Customer report and change the TimeDepositAccount to Account references. Go ahead and do that.

It has the Customer.java, and as you see now, we have only Accounts. And I'll pass the constructor and plus and get methods. And we'll do the same thing with CustomerReport, where now, wherever we see the TimeDepositAccount, we just changed it with Account and as you see here, in the code here.

After that, they want us to run the project. You should see a report of all customers and their accounts. And then after that, we'll go ahead and check and create a new class called CheckingAccount. Again, this is sub-class Account. And it should add an overDraftLimit field to the CheckingAccount and add the CheckingAccount constructor that calls the Super constructor.

And add a CheckingAccount constructor that has one parameter, the Balance. Override the abstract getDescription method in here that's from the Account. Note it is a good practice to add @Override to any method that should be overriding apparent method. Makes sense.

Again, override the abstract Withdrawal method inherited from the Account. Go ahead and do that, and you see it shows you the code. And let's go ahead and do that. First of all, so we'll see this new CheckingAccount. See, it inherits from Account.

And it has an overDraftLimit, which is of type Double. It has a CheckingAccount constructor. That's the one that calls the Super. It has the Override, Withdrawal, and getDescription.

And then after that, they're asking us to modify the AbstractBankingMain class to create a checking account for customers. And we'll show you the code here, how to modify this. Again, both Customer and CustomerReport can use CheckingAccount instances because you previously modified them to use AccountType references. And then run the project. Let's go ahead and first do that.

So here's my abstract-- so here we have a Main method, create a new instance of a Bank, and pass that to the initializeCustomers bank. initializeCustomers method takes an instance of a Bank, and that's where you get an instance of the calendar and call the Add method on that and then add a customer, Jane Smith, add a customer Bryant, Owen, add a customer, Tim Soley, and add a customer, Maria Soley.

And then, of course, after that, they want us to run it. So running the project means first of all, go to the Properties. And on the Run, we make sure that we are referring to the class that has the Main method, in this case, AbstractBankingMain. Click OK, and then, of course, run the project. And that, of course, will get us the CustomerReport, Jane Smith, Owen Bryant, Tim Soley, and Maria Soley with their information. And that pretty much ends the Practice 1 of Lesson 5. Thank you.

## 5. Practice 5-2: Applying the Singleton Design Pattern - 6m

Let's look at the Practice 2 of Lesson 5, which is Practice 5-2.

This, of course is related to applying the Singleton design pattern. In this practice, we will take an existing application and refactor the code to implement the Singleton design pattern. Again, first, in summary, we have been given a project that implements the logic for a bank. The application currently allows the creation of an unlimited number of Bank instances. bank2, bank 1, bank2, 3 and so forth, as we see on the activity guide.

We use the static and final key words-- you will limit the number of Bank instances for one per Virtual Machine. And the task here is to open the SingletonBanking project as the main project, and of course, expand the project to actually, again, run the project. And then after that, we want to modify the class to implement the Singleton pattern.

So we open the Bank.java file, and of course, change the constructor to private and add the new field name instance. Again, the field should be private, marked static, marked final, and type of Bank, initialized to a new Bank instance. And as you see here, the code representing that. And create a static method getInstance that, in this case, return an instance of Bank.

So, let's go ahead and do that. So that's for the Bank. And as you see here, we have a static final instance of type Bank. And we initial a new instance of Bank. And it's private. And the constructor is private also, in this case.

In addition, we have an array of customers and an integer called numberOfCustomers-- integer variable, rather. And the constructor, Bank, in this case, is private. That initializes the array to 10, customers 10. Of course, initialize the number of customer's variable to 0. And we have the getInstance, which is a static method that returns an instance of a Bank. And all what it does, it returns the instance here.

And then, of course add a customer, get a number of customers, add a customer.text. Of course, in this case, the couple strings-- first name and last name. And get a number of customers. And getCustomers, of course, if you pass the index, returns that customer. That is, again, referenced by one location of the array customers.

Continuing with that, after that they want us to, in this case, to modify-- open the SingletonBankingMain file, replace any calls to the Bank constructor with a call to the previously created getInstance method.

In the main method, create a second a local Bank reference named two, bank2. Initialize it using the getInstance.

Use reference equality checking to determine whether the bank and bank2 reference the same object.

Initialize only the second bank, but run the report on the first bank.

And again, run the project. Let's go ahead and do that.

And now, of course, go into the SingletonMain. So, as you see here, as a main method, we create a couple of instances of bank. One is bank, the other one, bank2. Check if they are equal. Again, print the--

Pass the bank2 to initializeCustomers method. And, of course, this initialize method. And of course after that, here's the initialize method that we already know about, right?

And down here, we'll go ahead and create an instance of CustomerReport. Pass the bank to the setBank method on the reference variable report, and then invoke the generateReport. And that's, of course, from the CustomerReport class that we already know, which is this one here. OK, that's how we generate a report.

Now, of course, after that, they want us to run the project. So, in this case, first, we go ahead and look at the Properties of the project to make sure that the method we're calling in the SingletonBankingMain. So that's good. And then, of course, after that, we'll go ahead and run the project. And that will get us the output, in this case, where we see bank and bank2 are the same object.

That's the purpose of the Singleton, which is only one instance, OK. Singleton means one instance per JVM. And then of course, the customer report.

And that, of course, ends Practice 2 of Lesson 5. Thank you.

## 6. Practice 5-3: Using Java Enumerations - 6m

Let's look at practice three of lesson 5, which is by the way optional. In this practice, we will take an existing application and refactor it to code the use of enum. Again, in summary, we have been given a project that implements the logic for a bank. The application currently allows the creation of a time deposit account instances with any maturity date. And we see the code, how it's done.

Again, by creating a new Java enum, you will modify the application to only allow for the creation of a time deposit instance with a maturity date that is 90 or 180 in the future. Again, the task here is to open the enum bank project, and then of course create a new Java enum deposit length in this case in the com.example package. And of course call the deposit length enum. In this case, when we declare days fields along with a corresponding constructors and getter methods as you see on the code.

And create 2 deposit length instances, 3 months and 6 months, that call the deposit length constructor with values of 90 and 180 respectively. Modify the time deposit account class to only accept the deposit length instances for the constructors maturity date parameter. Again open the time deposit file, in this case, and modify the existing structures to receive an enum as the second parameter.

We see here, as we see in the code here. OK, that's for the time deposit constructor. And as you see, it calls the super constructor. It's the constructor of the super class and get the instance of the calendar and record the add method in this case. Where we, again in this case, pass to it the day of year and the get number of days. And then after that, of course, we will get the time invoked. Again, invoke the get time method on the instance of calendar and use it to initialize with it the maturity date field or instance variable.

And of course, after that, though, let's go ahead and look at that first in NetBeans. And that of course in this case will show us the whole time deposit. Which, by the way, is in our case here rather the deposit length, which is an enum. And as you see here, it as the 3 months and the 6 months constructors, we get 90 and 180. We have the declared days as an integer. And we have the deposit length, and the get date.

And then after that, we modify the enum banking main class to create a time deposit account instance using the two deposit length instances variables. Again open the enum banking main, and within the, again, the initial last customer method, remove the code to create the calendar. And within the initialized customers method, modify the creation of all deposit accounts instances to use the deposit length enum.

Again we should, as a note here, try using both the 6 month and the 3 month values. You can also use a static report to reduce the length of the statement. And of course, run the project in this case to see the output.

So in this case, we'll just go ahead and look at the enum. And as you see here, in the enum banking main method, it has a main method, we create 2 instances of the bank. We check in the array qual and then, after that, we'll go ahead and, in this case, pass the bank 2 reference variable to the initializeCustomers. And that's where, in the initializeCustomers, that's where obviously we add the customer Jane Simmons.

The customer, again in this case, add zero to it, and here add account. And in the accounts, we see that it passed to it a new instance of time deposit account plus the 500 and the deposit length in this case. And first we passed the 6 months and then we do it the same as you see here for Jane and Tim, and then we do it for Maria bypassing, in this case, the three months.

And then after that, they want us to run the project. And that's easy. We'll just go to right click and then click on Properties. And then of course run. We see that we are using the enum class. Click OK. And then, of course, after that, running the project.

It's going to run the project and of course you see that it adjusts the information where, in our case here, we are getting the Jane Simmons information, and Bryant, Owen information, Tim Soley information, and Maria Soley information.

And that pretty much ends the practice 3 of lesson 5. Thank you.
