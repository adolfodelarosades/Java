## 02. Object-Oriented Programming	- Practical Object-Oriented Concepts: Part 1

DESCRIPTION

Practical Object-Oriented Concepts: Part 1

BENEFITS TO YOU

Practical Object-Oriented Concepts: Part 1

## 01. Practical Object-Oriented Concepts Part 1 New 8m

Welcome to Practical Object-Oriented Concepts Part 1. My name is Joe Greenwald. I'm a Learning Solutions Architect, Curriculum Developer, and Senior Instructor with Oracle University. I've been teaching and consulting for Oracle since 1992. I've been using object-oriented software since the late 1980s, starting with Borland's Turbo Pascal and Delphi, and then moving on to Smalltalk, C++, Java, and C Sharp, amongst others.

I wrote these materials over many years, trying to simplify and distill the essence of what is object-oriented software development. I hope you enjoy watching this presentation as much as I did in writing it and recording it. In this presentation, I will define what is an object, a class, an attribute, a method, and a message, and how they're used in object-oriented programming. I'll also talk about what it means to create an object-oriented application and the benefits, advantages, of object orientation itself.

I think it's both interesting and helpful to understand why object-oriented programming was developed, what problems it tries to solve, and why does it look the way it does. So let's get in our wayback machine and go all the way back to the late '60s and early '70s and look at the computing environment at that time. At that time, software was basically monolithic. It was mainframe code typically using punch cards or tape. Terminals were just becoming popular at the time.

COBOL, common business-oriented language, was there for the business folk to write business applications. FORTRAN, formula translation, was available and used by scientists and mathematicians, and assembler was used by the true computer geeks. Languages like Pascal and C, whose syntax are derived from the parent language ALGOL, were gaining in popularity.

Pascal, named for the mathematician Blaise Pascal, was created by Niklaus Wirth and remains one of the best languages to teach beginning programming. C was also becoming popular because it was small, compact, fast, essentially a verbose assembler-type language, and it was used to write the Unix operating system. There was very little programming discipline or structure at the time.

Goto-less programming, structured programming, modular programming, procedural programming-- those sorts of things were years off for mainstream coders. Mostly it was seat-of-the-pants coding. You'd start writing some code and hope it works and then add to it. Also, writing the entire program at once and then going back to test it little by little was popular, as well, if more frustrating and time-consuming.

In the early 1970s, computer pioneers at the Xerox Palo Alto Research Center, called Xerox PARC, were developing a single-use computer with a graphical user interface. This was a computer that can be used by a single person at a time. It was dedicated to that one person. The person had their own dedicated computer, CPU, memory, storage, monitor, and input devices like keyboards and mice.

While mainframe users did share the computing resources with others, the sharing could be transparent when things went well, or in some cases not so transparent. For example, when the mainframe went down and crashed or was unavailable, it went down for everyone. Even years later, I remember my mentor at the time bragging about a new mainframe operating system that he was using that was like a virtual operating system, where it made it look like each user had their own disk, storage, memory, and CPU. And I said, "You mean like my PC?" at the time.

However, back at Xerox PARC, they were developing and using this amazing, for the time, new box. One was called the Star and the other was called the Altos-- what was effectively the first personal computers with a graphical user interface and a mouse-- and they wanted to move away from the monolithic, text-based development mechanisms of the time and create a more flexible environment. They wanted this development, environment, and language to be more suited to a graphical user interface-based personal computer. Remember, this is many years before Macintosh came out.

One of their lead pioneers, Alan Kay, proposed the idea of individual entities or cells communicating with each other using a very simple syntax and passing messages to each other to make the entity cells do things. This development system, called Smalltalk, was a huge departure from the current mainframe programming systems at the time. It was designed to be simple and easy.

For example, Alan Kay was challenged to write the entire syntax of the Smalltalk language on a 3-inch by 5-inch card, and he was pretty much able to do that. And it should be easy enough for kids to use. Indeed, the first versions were tested with local high students in and around Palo Alto.

Years later, in the early '90s, I actually met one of these "Alan Kay's kids," as they were called. I was working in Silicon Valley and working with Smalltalk, and he was at a Smalltalk library for graphical interfaces that I had purchased, and I got to meet him and work with him and talk with him. I heard some amazing stories from him working with PARC and Alan Kay at the time. He'd started programming in Smalltalk at about the age of 13 and he was something like 26 when I met him. So imagine working in something like Smalltalk at that age and for the next 13 or 14 or 15 years. I learned a lot from him.

Alan Kay took as inspiration aspects of the earlier simulation language called Simula and extended it to the idea that everything was an object and all computation would be done by passing messages. Alan Kay took as an inspiration aspects from the earlier simulation language called Simula and extended it to the idea that everything was an object and all computation was done by passing messages. We'll talk more about these ideas later on.

One interesting note-- Alan Kay developed the idea for what he called a Dynabook back in the mid-'70s, which would look very much today like our iPads and tablets that we use. And he developed this as a way to bring new ways of thinking to human civilzation and amplify human reach. He also worked on a free, open source version of Smalltalk, which you can obtain today, called Squeak. You can find it at S-Q-U-E-A-K.org, squeak.org. I highly recommend trying it out and seeing what Smalltalk looks like. For myself, learning Smalltalk made be a much better object-oriented programmer, just as learning assembler made me a much better overall programmer.

So Alan Kay's Vision, his idea was that he thought of objects being like biological cells or individual computers on a network only able to communicate with messages. Think today of things like web services, SOAP or REST web services. So his idea of messaging, passing messages from one object to another, came at the very beginning. It took him a while to see how to do messaging in a programming language efficiently enough to be useful.

Now, if we see here, we see a common representation of an object. The internal state of the object, the data that represents the state of the object, is hidden and encapsulated and cannot be directly manipulated by other objects. One object sends a message to another object to make it do something. Then another object can send a message, and you get this message passing going back and forth. Initially, of course, these object systems were all in one memory space within a computer, but it easily extended out to multiple different memory spaces across different machines, very similar to what we have in terms of web services today.

## 02. Using Object Orientation New 11m

Using Orientation-Orientation-- object-oriented programs are modular with a code for one type of object isolated from other objects. So changes to one object won't necessarily break other objects in the program. For example, if you have an order object and an item object, the code for the order object is in one definition, and the code for the item object is in another. Changes to the order object won't necessarily break the code in the item object.

Also, this modularity makes it easier to find and fix bugs as well as making changes to functionality or adding new functionality. If I want the order to do something new, I know to go to the order object and make the change there. Also, object-oriented programs tend to be more flexible because the same message sent to one object could cause different behavior when it's sent to a different object. For example, if I send the message, print, to the order object, it would behave differently than if I send the message, print, for example, to a catalog object.

It's also easier to reuse code by identifying common behaviors and data among members of different, but related classes. This is something called inheritance, and we'll look at this later. Many of these benefits come through during maintenance and enhancement and not as much during the initial application development. And object-oriented programs tend to be more verbose than when using languages like C.

And since object-oriented applications manage their own memory allocation and de-allocation through something called garbage collection, historically, there's been a slight impact on performance of the code over a compiled language. However, these performance differences are really not significant any longer given just-in-time compilers and much faster computers. So what is this object-oriented stuff about anyway?

Object orientation is about simulating the real world in a computer. In the real world, we interact with objects every day without thinking about how they work or why. We just know how they work. And when we tell someone or something to do something by sending them a message, they would do it, mostly. For example, if we were going to implement a dog object in an application, what would that dog be able to do, and what would the dog be able to know?

The dog has behaviors, what it can do, and it would have an internal state, what it can know. Behaviors for the dog would include things like eat, sleep, speak, chase cars, walk, and fetch a toy. However, behavior like calculate bank balance is not typically a behavior that we would ascribe to a dog.

It doesn't do it in the real world and probably wouldn't do it in the computer program either. It's internal state, what the dog would know about itself, could include things like its name, its weight, the number of bones its varied, its favorite toy, its owner, and the date of its last meal. So dogs, like all things, have behavior and would know about their internal state.

When we interact with dogs, we would send a message to the dog and ask it to do something. Now, we don't know how it does what we ask it to do. And nor do we, as users of that thing, or interacting with that dog do we really care.

For example, here, the dog's name is Bowser, and we get his attention, and say, Bowser, speak, Bowser, walk. And Bowser would receive the message, speak or walk, and then Bowser, the dog, is going to collaborate with other parts of the dog to carry out that message.

For example, the message walk could result in a message of, step, pass to its legs or paws, and each paw would get a message of lift. So there's a collaboration that occurs within the object itself. So objects are responsible for doing things.

Objects then collaborate with other objects to perform tasks. And objects use their internal state to carry out the behavior. So in an object-oriented fashion, we would have the object dog. The dog would have paws. And the paw would know how to lift and take a step.

So let's see how we solve a problem using objects. Using objects, we start with a use case. We start with a problem domain-- what problem are we trying to solve? We'd like to have a dog fetch and play with a toy. So we would write the use case by saying, the owner asked the dog to fetch the toy. After the dog has fetched the toy, the dog plays with the toy. Now, this is a stunningly simplistic example. And of course, things get more complex. But the basic truth is here.

This scenario is called a use case, and it is where object orientation starts. A use case would describe the objects that are used to create the application. What are we working with? It also describes the messages, the behavior, that an object understands. So for example, what things you typically work with in this use case-- take a look at the picture, and think about the things that would be involved in this use case.

What did you come up with? In the domain for a dog, we would say that we have dogs, owners, and dog toys. Dogs play with dog toys. Owners interact with dogs. Now, we also can say that objects "know" things. And notice that "know" is in quotes here. And the reason for that, there's an anthropomorphic aspect to this. And we talk about this in objects, like, if the object was alive and could actually respond, how would it actually respond to what would it do?

For example, each object knows its name and other internal information about itself. Here, we see three dog objects, one dog whose internal name is Bowser, another dog whose internal name is Kayla, and another dog whose internal name is Matty. The owner is a separate object and would have their own internal state.

Since each object is different, it has its own individual data and state. The values of the name may be different for each dog object. So while each dog has a name, the actual value for the name would be different, and each object would therefore be different.

This anthropomorphic use of "know" is intentional, since we're simulating real-world objects and making believe like they're actually alive. And this is actually how I program and how I teach my students to do object-oriented programming. Imagine the objects were alive and they could respond to messages. How would you actually write them, and what could they do? And how would they work together and collaborate?

For example, we have a use case, and we'd start by the owner sending a message to the dog to fetch a toy. So the owner sends the message, fetch a toy, to the dog Bowser. Bowser would then send a message that it wants to play with that toy by going out and fetching the toy to play with it. So Bowser would play with a ball or play with a squeaky toy or play with a chew toy.

So now we're seeing three different types of toys in this case, a ball, a squeaky toy, and a chew toy. And while they have certain behaviors and internal states that are common between them-- they'd have a name and a type-- they could also have things that are different. For example, a squeaky toy would make a sound. And a chew toy would be able to be chewed, for example. And a ball could be bounced.

So the dog would fetch the toy, and then the dog plays with the toy. Again, this is very simplistic, but it's not actually all that far-fetched. You could easily see a situation where a customer sends message to an order to add an item to an existing order. And the dog object can have different behaviors in different applications, what we'd say different problem domains.

In one application, we ask the dog to fetch a toy. In another application, we asked the dog to eat at regular intervals. In a different application, we could ask the dog to walk a specified distance. Again, this is one of the benefits of object orientation. The same object can be used in different applications in different ways, but it gains new behaviors and, therefore, new value over time.

Now, so far, we've been looking at objects and how they're used by the user of the object. But of course, clearly, inside of a program, at some point, we have to write code to make the object work. And this is the designer's view. The designer uses variables, typically other objects, to represent the dog object's state.

For example, a string object called name would store its name, in this case, the letters that make up the word Bowser. And a number object would have a weight, in this case, 52.5. And a toy object would have a favorite toy, which would be a value a squeaky toy. So a dog object could have a favorite toy, and it would be a squeaky toy, or it could be a chew toy.

Now, what happens if we decide to change our implementation and use a different variable name or represent the name differently or represent the weight differently? Or let's say we read it from a database or a web service? What would happen in that case?

Well, if the implementation, that is the data structure storing the state, and the algorithm which carries out the behavior, is visible to the user of the object, if either the user or the dog could actually see how the name field is actually coded, then every place that referred to the dog's name variable would have to be changed, recompiled, and debugged in my program.

That's a side effect and also something that we would call strong coupling. One use of an object is coupled to its implementation, and the change of the implementation breaks the use of the object. That's not a good thing.

However, if the implementation, the data structure, and the algorithm is hidden from the user, and if the implementation changes, the user of the object is not impacted. So for example, I would, using the dog object, I could ask the dog what its name is. And it would tell me what its name is.

But I don't know how the dog object is implemented internally. And I can't write code that's dependent on that implementation. Therefore, this is more flexible. And the designer can change the internal implementation of the dog object without breaking my application that's using the dog object.

Now, we'll look at procedural programming first to compare it with object-oriented programming. Procedural programs, like for example C, Pascal, or PL/SQL put the data structure that defines the data into the main program. Here, for example, the main program would define a dog having a name, a weight, and a favorite toy. And then we could create dogs based on that structure.

Separate from the main program, in a separate file, we would see that the function or procedures that actually carry out the behavior are stored. So here, for example, we have a compare function. If we pass it dog1 and dog2, it'll compare those two dogs and give us an answer back.

Of course, the problem arises, what happens if we decide to change the data structure for a dog, and now we say dogs have names, weights, favorite toys, and something else? Well, this whole main program, and actually everywhere that the dog is defined, all of the programs would have to be recompiled and retested.

The problem is more evident with databases. Here, we have multiple programs all referencing a table. The table has columns and they're referencing the columns directly inside the code of the application. Well, what happens now if that table structure changes, if we change the spelling of the column or get rid of the column entirely? Well, this creates a problem, and this code would all have to be recompiled and debugged.

Now, of course, in databases, there are things like views that provide a level and direction between the application code and the database table. But again, that's a different subject.

## 03. Procedural Versus OO New 15m

Let's take a look at procedural versus object-oriented programs. On the left here, we see a procedural program, a main program with the data structure exposed in the code. The Dog data structure has a name, a weight and a favoriteToy. Separate from the main program is a Dog library, which would have procedures and functions to carry out various behaviors, like make a toy its favorite or compare two dogs.

However, you'll notice that if we change the structure of a Dog-- if we were to add a new piece of data, for example, maybe its height-- we'd have to make the change here in the main program and we'd have to recompile the main program and every program where a Dog is being used. However, changes in the Dog library would not necessarily cause a recompile of the main program. This modularity is an aspect of procedural programs.

Object-oriented programs leverage that to a greater degree. Here in the main program for an object-oriented program, we see that we have myDog, which is an object reference to an object in memory. We send it the message fetch and tell it to fetch aSqueakyToy. Once it's fetched the squeaky toy, we can tell that myDog object to make that squeaky toy its favorite.

How does this work? Well, the behavior of the object-- fetch(), getName(), makeFavorite(), and compare()-- if you will, the procedures and functions-- are stored along with or defined along with the name, weight, and favoriteToy, the structure itself. We combine the data structure-- name, weight, and favoriteToy-- and the behaviors into a single structure that we call a class.

So a class acts as a template that defines both the behavior and the data structure for that object. At runtime, when the main program creates a new myDog object, that object is created with a name field, because name is in the class, and a weight field, because weight is defined in the class, and a favoriteToy field, because favoriteToy is defined in the class. And the object has a pointer back to the class so it knows what its behavior will be.

In this case, myDog is called an object reference. It's like a pointer to the object in memory. So the main program does not have direct access to the internal state of the object. It simply sends messages to the object and the system makes sure the messages are carried out. So access to an object would include access to its data and its behavior, as well.

So when I access myDog and tell it to fetch aSqueakyToy, then a message is sent to this object to fetch, and the fetch() code would get executed with the toy that we pass it. And then if we said, myDog and pass the message makeFavorite aSqueakyToy, it'll set aSqueakyToy to be the favoriteToy for that object.

We see here that maybe later in the program, we have another object called yourDog, which, again, is a Dog object and would have a name of Matty, a weight, and a favoriteToy, which might be a ChewToy. Also notice that there are different classes for the SqueakyToy, ChewToy, and Ball. SqueakyToy would have data of volume and sound, and behavior of play. ChewToy would have a flavor as a type of data and play as a behavior. And ball would have a color and play. So notice that any toy that we use would know how to play, even if the behavior of playing is different.

Here we see two objects, one that has the name Bowser and one that has the name Matty. What do these objects have in common? Well, they're both types of Dog objects. They have the same attributes of name, weight, and favoriteToy that describes their internal state. And they would have the same behavior. They could tell you their name. You can compare one dog with another. You could make a certain toy their favorite. They have the same basic behavior.

So when we see objects that have the same attributes and the same behavior, we would say they belong to a common class. And that's the term that we use. And then we would use the class to design what the object will look like. So at design time, we would specify what a dog should have. We would say, based on our application, that our dog needs to have a name, a weight, and a favorite toy, because that's the way we're going to work with the dog in the application.

So at design time, we use the class to specify what the object should look like. But the object is created at runtime. We create a specific instance of a class at runtime, and we call that an object. You can have many different objects. As you see here, we have two separate physical objects that are all considered part of the Dog class.

Examples. You could see, for example, the definition of a table in a database is like a class. It defines what the table can hold. And each row would represent an object-- for example, a specific instance in that table. If you had a table of orders, then the table would have things like order number, order date, et cetera. And then each row would have the specific values for that specific order.

Or a recipe, for example. When you're creating a recipe for a meal, the recipe describes what you're going to do and what you need to create that meal, but the meal is the instance. The recipe is the class, if you will. You can use that over and over to create new meals. The meal is actually what you create at the time. That's the instance of the recipe, if you will.

Same thing with blueprints and buildings. The blueprint is done at design time to design what the building will look like. And when the building is constructed, we can create an instance of that blueprint, if you will, and that's the built building. Also, like an integer. An integer defines what the behavior and what the internal state of a number would be. 23 would be an actual instance of that number. And actually, in object-oriented system, you will see that integer itself is actually a class and 23 would be considered an instance of that class.

So then what is a class? A class is a template or a factory for creating new objects. The class defines the name of the class-- in this case, Dog-- and it describes the attributes, the variables or internal state values-- in this case name, which is a string; the weight, which is a number; and a favoriteToy, which could be some type of toy. It could be a ChewyToy, a SqueakyToy, a Ball, or some other type of toy.

And it also has the definition of the messages that that class can understand. For example, a dog would know how to get its name, and a dog could make a toy its favorite.

Now, in this case, we use the term class, and we do this at design time. But at runtime, we're going to notice that the object will understand the message. For example, if I go back for a moment, we have two object instances here created based on the Dog class. If we send the message getName to this object, it will return Bowser as a value for its name. If we ask this object, getName, it'll return the value Matty.

So we have two different objects, both of which are types of the Dog class. But at runtime, they're separate physical objects. They have separate memory structures, and therefore can contain separate values for the attributes, even though the attributes are the same.

So then what is an object? Well, at runtime, an object is created in memory. It is the object that holds the values and it is the object that does the work for us at runtime. Classes are there to tell the computer what type of memory structure to create. So memory is allocated for its attributes.

And here's an example of Java code that will actually create a new Dog object. Over on the left, we're saying we need an object reference called myDog, which will point to the new Dog object. And myDog is of type Dog. In this case, we're seeing that myDog is of type Dog. Java is a strongly-typed language, and we have to define what type an object reference must be.

Then over on the right-hand side, we create a new instance of the dog class-- in this case, a Dog object-- using the new keyword, and assign that to the myDog object reference.

So at runtime, when new Dog() is executed, then the computer will look at the Dog class, see it needs to create a data structure in memory that has a name field, a weight field, and a favoriteToy field-- as you can see down here-- give it the values that it's supposed to get however it does it, which we're not going to talk about here. And now we created an object reference, the line that you see here, and that is now being pointed to or being used by myDog to reference that object.

So now if I send a message to myDog-- or in Java terms, call a method-- like getName or makeFavorite on myDog, it'll go ahead and execute the code. So each object has a unique object reference, a pointer to that object in memory, and each object has a pointer to its class definition. So the object stores the data structures and the class definition stores the actual code.

So we see there are some similarities to procedural code. We see that the procedural code is here in the Dog class, and we have a separate data structure. But the big difference is the data structure is not in the main program.

Notice that if we change the definition of the Dog class and add something like height, then that would cause a recompile of the Dog class, but would not necessarily cause me to recompile my main program. And that's a huge benefit of object orientation.

So how does this work in Java? Well, over on the left, we've defined a couple of different classes. We have a Dog class. Don't worry about the syntax of public, and class, and all that. We'll get to that in the Java code. But we see here a Dog class. And a Dog class has an attribute of a Toy-- which would be what we're going to reference as myToy-- and a favoriteToy. So a dog could actually have a couple of different toys, its toy and even its favorite toy. Maybe this is the toy that it's playing with.

And we can see that it has a method called fetch(). fetch() would take a toy and then say to that toy, I want to play with you, and then maybe make it its favorite toy. Down here, we see a ChewToy class, which has a play() method. Here is the code to play with the ChewToy. And here, we have a public class, SqueakyToy, which would have the code in order to play with the SqueakyToy.

Notice both ChewToys and SqueakyToys have the same behavior-- or sorry, I should say the same method-- play(), even though the code is probably different. The benefit of that comes about when we look at the program itself. Over here, we have a program called DogTester(). And inside that program, we start by creating a new Dog object. And the myDog variable object reference points to that Dog object.

And now we create a new ChewToy. We create a new ChewToy object, and we store the object reference for that new ChewToy object in the cToy object reference. Now we can say to myDog, fetch(cToy). The notation here is Java notation for basically sending a message. We're telling the myDog object to fetch(), and we're passing it cToy.

So what happens is the object reference, myDog, which is pointing to an object of type Dog, then executes the code for fetch(). fetch() is over here. We pass in cToy, and therefore, that specific object will take in that cToy and fetch that toy. Here, we create a SqueakyToy-- sToy, a new SqueakyToy. And now we can tell myDog to fetch(sToy). And we can go on and on from there. So once it fetches sToy, it plays with it and makes it its favorite.

For example, at the end of this code, the favoriteToy for myDog is what? It would be a SqueakyToy, because we've replaced this ChewToy that we set to be its favorite toy here, through fetch(), with the SqueakyToy through the fetch() here. That might be a little bit involved, and we'll go through that as you go through the actual code examples and the class itself. You'll see more and more of that work.

So when the toy receives a play() message, it executes its play() behavior. Depending on the type of toy, different behavior may be exhibited. So notice that here, I can tell it to fetch(cToy), and it'll automatically tell that toy to play. And that toy-- let's say in this case, a ChewToy-- will execute the code for a ChewToy.

But if it happens to be a SqueakyToy, we're reusing the same code, passing a different object in this case-- the object reference for a SqueakyToy-- and we're reusing the code. And automatically, we get the behavior for a SqueakyToy without having to make any changes, or write any if statements, or things like that. That's something we call polymorphism. And that's something we're going to take a look at in the next lesson.

So in part two of this, we'll look at some of the principles of object orientation. We'll look at abstraction, which is where we define what behaviors and what data we need to keep about a specific object. We'll look at encapsulation. How do we make sure that the methods, and behaviors, and the variables of a class are kept separated and hidden from other users of that class of objects so that changes to the implementation of the class do not break the applications that the users are using?

We'll also look at inheritance. Inheritance is a property of object-oriented systems. Here, for example, we can see that Dog is part of an inheritance hierarchy inheriting attributes and behaviors, potentially, from an Animal superclass. So all animals, for example, would have a name, and all animals can speak, although dogs, bears, and snakes may speak differently. And we can even see that dogs can actually be broken down into subclasses, like poodle and Great Dane.

I don't know that this is the best example of a subclass, and we did this to make you think about it. Can you think of any attributes that are different for poodles and Great Danes? Name, for example, would not be a difference. Both poodles and Great Danes would have names, because they're types of dogs, and dogs are types of animals. And we said animals have a name, and therefore, all the subclasses of Animal would inherit the name, as well. This is one of the benefits of object-oriented systems, making it easier to reuse data and code among related classes.

So the only thing I can think of is maybe the amount of curl in their fur or how curly it is. So poodles are very famous for being curly-type fur, and maybe Great Danes, not so much. Part of analysis, as we'll see later in part of abstraction, as we look at our problem domain, is to say, poodle and Great Dane are really not actually subclasses of Dog. But on the other hand, if actually poodles speak very differently than Great Danes do and the different types of behavior, that could be a way of doing it.

We would say, OK, all animals can speak. Dogs, therefore, can speak. However, poodles speak very differently than how Great Danes speak. Again, this is pushing the example a bit. But you could see that we could actually leverage common behavior and also have different behavior for the subclasses.

So the last thing is for polymorphism. And polymorphism is the ability of different objects to get the same message and react or respond differently. So we could say speak now to a dog, and it will say, woof, or a duck would say, quack, or a snake would say, hiss, or a bear would growl.

So in summary, we've seen how to define an object, a class, and attribute, a method, and a message, and we've explained what it means to create an object-oriented application. Thank you.
