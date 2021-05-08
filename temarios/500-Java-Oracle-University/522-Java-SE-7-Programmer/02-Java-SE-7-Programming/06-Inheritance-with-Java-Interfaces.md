# 6: Inheritance with Java Interfaces

1. Inheritance with Java Interfaces, Part 1 - 20m
2. Inheritance with Java Interfaces, Part 2 - 20m
3. Inheritance with Java Interfaces, Part 3 - 14m
4. Practice 6-1: Implementing an Interface - 9m
5. Practice 6-2: Applying the DAO Pattern - 12m
6. Practice 6-3: Implementing Composition - 10m

## 1. Inheritance with Java Interfaces, Part 1 - 20m

Let's go ahead now and get into lesson six, which is going to cover in this case inheritance with Java interfaces. So the objective of this lesson is that we are going to be able to model business problems by using interfaces, define a Java interface, and see how we define a Java interface, choose between interface inheritance and class inheritance, extend an interface, and of course, refactor code to implement the data access object pattern.

So now once we get into this lesson, now we can go ahead. And then after we cover the interfaces we can now compare the interface to an abstract class. Good.

So looking at implementation substitution. Well, folks the ability to outline abstract type is of course, a very, very powerful feature of Java. Typically, abstractions enable us to again, in this case, have ease of maintenance, where classes with logic errors can actually be substituted with a new and improved, of course, classes.

Also it enables implementation substitution. What do you mean by that? Example, the Java SQL package outlines the methods used by developers to communicate to with the database. But of course the implementation is vendor specific. So for example, know that we have SQL implementation to an Oracle database, or a MySQL database, or a DB2 database, and so forth. And of course, it enables division of labor, where in this case, in general, outlining the business API needed by an application user interface allows the user interface and the business logic to be developed in tandem, one after the other one.

So pretty much, there are a couple of ways to define the abstractions. And it's either using abstract classes that we already have seen or interfaces that we are going to of course see in this particular lecture. Let's go ahead and look at Java interfaces.

It turns out, folks that this construct, which is part of Java is very, very useful. They are used to define abstract types. And of course interfaces are similar to abstract classes containing, by the way containing, only abstract methods. If you remember, when I was talking about abstract classes, I said that abstract classes can actually contain non-abstract methods, too. And also we said that abstract classes can contain fields, variables.

And interfaces by the way, on the other hand, in this case, interfaces, they contain only public abstract methods and also interfaces the outline methods that must be implemented by a class. Again, the methods must not have an implementation braces when you, of course, declare them in the interface.

And of course interfaces can contain constant feeds, and only constant fields, and can be used as a reference type. We'll talk about that later on. And of course they're quite important, an essential component of many design patterns.

Let's look now developing Java interfaces. Well, it turns out, folks that these public top-level interfaces are declared in their own .java files. Of course, you implement an interface instead of extending that interface. And here's an example on how to actually define an interface.

You usually pretty much we have the name of the interface, which is in this case electronic device. And to be able to define an interface only use this keyword here interface in front of it. And of course, inside what we do folks is now we go ahead and write down the abstract methods. So all methods by the way, in an interface, they're all public. Even though, if you forget to declare them as public, they're ultimately implicitly public.

And by the way you may not declare methods as private or protected in an interface. Interfaces are like contracts. That's pretty much how we look at them.

And now looking at in this case, the concept of implementing interface. Here's a class called television, which by the way we are making it implement electronic device. What does it mean? Well, what it means here is that this television class will implement the methods, the abstract methods that you have in the interface. You see how we are implementing them here. Well, actually we see now the curly braces after the methods. Because all methods again, we said are implicitly abstract, then there is there a redundancy if you want to write abstract in front of them in the interface.

So in this case, we see that this television class does implement electronic device. And that's why you see the implementation of both methods turned on and turned off. But also it has its own extra methods in this case that are specific to the class television in this case, or the television class, which is in this case, change channel and initialize screen.

And by the way, folks a class can extend one parent class and then implement a comma separated list of interfaces, which means a class can implement more than one interface.

Now, yes you've got a question?

Implements total would be?

I'm sorry.

How many interfaces can you implement?

Oh, you can implement as many interfaces as you want. It all depends on your application. Good question. So again, how many interfaces? And the class can implement as many interfaces as you want. And in fact, we see here that it implements a comma separated list of interfaces.

Let's go out and look at constant fields. If you remember, folks what we said about interfaces can contain constant fields. So they can have constant fields. And here's again in this case, and by the way only constantly fields are permitted in an interface. And you can declare a field in an interface.

And by the way, it is implicitly public, static, final. Even though, you don't put it. So in this case here, we have a constant field, which is warning. And it's written in capital case characters. And as you know, we said it's static, final, in this case, or public, static, final.

And it is a string. And here we initialize it to this string here. And of course we have the two methods, the abstract methods, by the way, with which must not contain the curly braces is inside the interface. OK? Good.

So continue with that and now looking at interface references. It turns out, folks that we can use an interface as a reference type. So when using an interface reference type, what we need to do is we must use only the methods outlined in the interface. For example here, I can go ahead and use this first one here, which is a reference variable that of course, of type electronic device and initialize it with what? With a new instance of television. And that makes sense, why? Because television itself implements what? The interface electronic device.

So an interface typed reference can be used only to reference an object that implements that interface. And by the way, just now to let you also for extra information, when I also add that interface is implicitly include all of the methods from the java.lang.object.

So for example here, I can go ahead now and invoke the turn on or turn off. And I can now do this, why? Because obviously the instance is of type electronic device. And of course the change channel of course, that is not in this case the abstract method, right? But I could do this, the last one. Why? Because we said that interfaces implicitly include all the methods from the java.lang.object class. Everybody's following, folks?

Go ahead.

[UNINTELLIGIBLE]

Say that again.

ed.

ed, yes.

[UNINTELLIGIBLE]

Yes. But then again.

[UNINTELLIGIBLE]

But in this case ed is of type what? Electronic device. And if you take a look at electronic device before, we knew that it has two methods, turned on and turned off. So that's why those are the ones that you can go ahead and of course, invoke on that. But on the other hand, change channel does not belong to that. OK, good.

[UNINTELLIGIBLE]

Yes, you can.

And then we can?

Then we can use that. We'll see that later on.

Is it [UNINTELLIGIBLE] promotion, or?

Well, it's kind of similar to the concept of what we see. We'll see that in a few slides. Again, this is talking about the casting. We'll talk about that soon. Let's go ahead and look at the instance of operator.

Well, that also can be used with interfaces too. And here's a good example, where in these case we have an instance of type television that we declare a reference variable, t of type television, and initialize it with a new instance of type television. And then here we're gonna actually write in the code, if t is an instance of electronic device, do whatever you want. And just because television implements the electronic interface, then of course in that case, we can go ahead and use the instance of for the interfaces.

So here we have a television that implements electronic device, and therefore a television is an instance of a television, and of course an instance of electronic device, and of course an instance of the java.lang.object. Everybody's following? OK, good.

Let's go out now and look at market interfaces. Well, marker interfaces, they define a type, but do not outline any methods that must be implemented by a class. So here for example, in this case, where I have a person, it implements the java.io.serializable, which by the way, all what it means here is that the instances of person are marked as what? Serializable. Which means what by the way, serializable? They are martialable. They can be martialed.

So the java.io.serializable is a market interface used by the Java IO library to determine if an object can have its state serialized. So when implementing serializable, you are not required to implement or provide any method implementation because the serialized interface does not have that one.

In fact, if you take a look at the API, here's pretty much what it is, the interface serializable. It does not have any methods. So I don't have a link here, a live link for the methods to be able to actually click on the methods. It does not have.

So we say that serializability of a class is enabled by the class implementing the java.io.serializable. And we said also that classes that do not implement this in interface will not have their state serialized or be serialized. And in general we say that it's used as a marker.

Let's continue with the lecture. And of course, the only reason these types of interfaces exist is for type checking. Here's an example, where if I now declare a reference p of type person and initialize it with a new instance of type person. I can go out and say, is p an instance of serializable?

And of course, this is going to be what? True. Why, because we made the class person implements, what? The serializable interface. So it is nothing but a marker specifying that instances of type person will be serialized.

Everybody's following here, folks? Good. By the way, we get to see this later on when we talk about Java I/O fundamentals. There is a lecture where we're going to talk about that.

Speaking of casting. So casting to an interface type. So for example, you can cast to an interface. Here's an example. Where in this case, if you take a look here, folks you will see that we have a method called turn object on. That makes an instance of type object.

And then here we check if always an instance of electronic device, what should you do? We'll go ahead and cast that object into an instance of type electronic device. And now of course use it to invoke the turn on.

So just as we did before with classes where again we casted two class types, we can also do the same thing in of course, for interfaces. And of course, in this case, whenever we want to work with this we can always verify that a cast will succeed. And again we should use the instance of to test that.

Except that if you look for example, on the example that we see here on the slide, which is the one that I'm just highlighting

here, you will see that this is a poor design. Because this method turn object on operates only on electronic devices. So if it's in this case, operates on the electronic devices, then when we use the instance of operator and course use the casting that actually does nothing but add overhead at runtime.

So if know that you're method, in this case takes only instances of electronic device, you might as well write it then this way. If you write it this way, then you avoid the usage of the instance of and of course the usage of casting, which by the way add to the overhead at runtime. Everybody sees that?

Continuing with these concepts, let's go ahead and look at now using generic reference types. Well, typically, we always say we use the most genetic type off reference whenever possible, whenever we can. Here's a very good example, where in this case, I use a reference variable called DAO of type what? An EmployeeDAO, which by the way it is a generic type of reference. And in this case, of course I will go ahead and use the constructor employee DAO memory implementation that will of course in this case create an instance of type employee DAO memory implementation.

And that of course, will implement the EmployeeDAO. So in this case, what I did on the right side what we did is we used the employee DAO memory implementation that implements the EmployeeDAO. And of course, after that I'll use it to maybe delete the record one.

By using an interface reference type, we can actually use a different implementing class without running the risk off breaking subsequent lines of code. Let's go ahead and look at that. So for example, if you take a look at this here, here I am declaring a reference variable of type what? employee DAO memory implementation and initialize it with a with a new instance Employee DAO memory implementation.

Here, of course, it is possible that you could be using the employee DAO implementation only method here. So which means whenever we do this then of course whatever I'm invoking as a method here would be the methods that are only where in the employee DAO memory implementation. On the other hand, if I write it this way, then I can go ahead and implement my employee DAO anyway I want. So I can actually be using methods from different implementation. Got that?

So reference types to a specific class codes your code to again be more tightly coupled to that class and potentially cause greater refactoring if you code when changing the implementation.

[UNINTELLIGIBLE]

Well, yeah. The whole idea here is if you're making-- for example, I can always create a generalized, or a genetic type of interface. And from it, I can extend the concrete interface. And let me show you an example of that.

[UNINTELLIGIBLE]

Yes. That is one implementation of the employee DAO. But it could be another one. For example, instead of memory, it could be file. It could be database and so forth. Got it?

## 2. Inheritance with Java Interfaces, Part 2 - 20m

Let's look at implementing and extending. Well, classes can extend a parent class and implement an interface. Here's an example where I have a class called AmphibiousCar that extends BasicCar and implements what? A MotorizedBoat.

You could also implement multiple interfaces, speaking of what Mike was just asking earlier. So I have a class here called AmphibiousCar that extends BasicCar and implements MotorizedBoat and, of course, implements what? Serializable. I could have that. And you see that now these interfaces are separated by what? Comma. So you can actually use both extend and implement. But if when you use both extend and implement, always put the extend that has to go first. And then after that implement.

Oh, by the way, we could also extend interfaces. So here we have an interfaces that can extend other interfaces. For example, I have an interface called Boat. And then I can have a MotorizedBoat interface that extends Boat. That can work. So in this case, by implementing-- for example, in this particular example here that I see here and I just highlighted, by implementing the MotorizedBoat-- in this case the AmphibiousCar because I have the Motorized Boat that extends Boat. So by implementing the MotorizedBoat, the Amphibious Car in this case, class must fulfill the contract outlined by both Motorized and Boat. Why? Because we know that MotorizedBoat extends also what?

Boat.

Boat. So I can go ahead and write now AmphibiousCar extends BasicCar implements MotorizedBoat and Serializable. The fact that I made it implement MotorizedBoat, then it also will implement what? Boat. Everybody's following, folks? Good. Let me know if you have any questions.

Now, if you want to understand the whole interface inheritance hierarchies, let's go ahead and look at this example. Well, in this case, folks, we have-- just to give you an idea-- we have an interface called Car-- Oops. So looking now at the interfaces in inheritance hierarchies. And let's look at this example where in our example here we see that we have an interface, Car, and then we have the BasicCar class that implements the interface-- By the way, the dot dot and arrow here means implementation in UML.

And then we have in this case a Boat interface. And of course, the MotorizedBoat interface inherits from the Boat interface. And we have the AmphibiousCar that, of course in this case, implements the Motorized Boat, which, by the way, means that it implements also the Boat interface because the Motorized Boat, obviously, extends Boat. And also this Amphibious Car implements Serializable, right. So this is pretty much how. So when you have the dot dot lines like this that means implement. And if it's a full line like this one here that means extend.

So interfaces are used for a form of inheritance and that is typically referred to as interface inheritance. And by the way, Java allows multiple interface inheritance but only one single class inheritance. Everybody's following that? Good. So you can go ahead and extend and implement classes. You can have an interface that implements another, rather, extends another interface. And you could have a class that implements a, for example in this case, this class AmphibiousCar, which implements this interface BasicCar, or rather extends BasicCar, which by the way implements Car. So that means that AmphibiousCar also implements what? Car.

And then here we have AmphibiousCar implements MotorizedBoat. And we know that MotorizedBoat inherits from Boat. So which means now AmphibiousCar does what also? Of course, implements Boat interface. And so an interface can extend another interface. And we saw the example here where we have MotorizedBoat that extends the interface Boat.

And by the way, when you have a class that implements multiple inheritance, or rather interfaces, and directly or indirectly, like in the case here AmphibiousCar implements the Boat interface indirectly, the same method signature may appear in different implemented interfaces. So it means if the signatures are the same, then there is no conflict again and only one implementation is acquired in this case.

And here is a quiz. So the quiz says, a class can implement multiple interfaces. Is that true or false? False. That's true. Good. Thanks.

Continuing with the concepts of interfaces, let's go ahead and look at this concept called design patterns and interfaces. Well, folks, one of the principles of object-oriented design is to program to an interface and not an implementation. Sometimes we say program to an interface and not a concrete object, or in this case an implementation. So there is a common theme in many design patterns. And again, this principle plays a role in the data access object design patterns and the factory design pattern. And we're gonna look at these in the next few slides.

Let's start with the data access object pattern. The data access object pattern is used when creating an application that must persist information. Again, the DAO pattern typically separates the problem domain from the persistent mechanism, in a sense your business domain from the persistence access code. It typically uses an interface to define the methods used for persistence. And of course, an interface allows a persistent implementation to be replaced by what, speaking of what we were saying earlier? You remember how I said when you can implement an interface that maybe, in this case, would be memory based data access objects as a temporary solution. Or it could be file based DAO for initial release. Or it could be a JDBC based DAO to support database persistence. Or it could be a JPA based DAO to support the database persistence.

So now we have in this case, we have a choice to actually implement that data access object anyway we want. It could be, in this case, talking to an Oracle 11g. Or it could to a database. Or it could be, again, implementing it to talk to a MySQL database or maybe a DB2 database, and so forth. Everybody's following, folks?

So let's look at the concept of before the data access object pattern. Well, here's a very interesting case. And in this case, we have a class called Employee. And when we look at the class Employee here, here's what's the problem, folks. When you look at the class Employee, you will see that in this case, it has a bunch of methods that are related to what? To the employee, which are like getFirstName, getLastName, getSalary, and so forth. ToString.

And then it also has a bunch of methods related to what? The persistence. OK. Which is in this case save, delete, and, of course, findByID and getAllEmployees, and so forth. So obviously, this is definitely a problem. It is a problem from the cohesion point of view, folks. We got a class here that is not cohesive. Why it's not cohesive? Because it pretty much focuses on two different principles of concerns. One is the set of methods related to the employee information itself. And the other one is a bunch of methods related to what? To the persistence of the object.

Can we fix this problem? And the answer is yes. If we use object-oriented type of concepts, then of course this would be converted into something like this. By making use of the data access object pattern, now we can actually have a very neat type of design where, in this case, the data access object pattern moves the persistence logic out all of the domain classes and into a separate classes. So for example here, we decided that the Employee would be a class and that Employee would represent only the data related to the Employee plus the methods that manipulate the different fields of the Employee, like getFirstName, getLastName, get Birthday, getSalary, and so forth, and toString to again override the toString method.

And if you take a look at the data access object pattern here, what we have done, ladies and gentlemen, now we have an interface, the top one here, again this top one here. This interface called EmployeeDAO. This is the generic type of an interface that we said we should strive to actually create and work with. So this, again, interface, which is called the EmployeeDAO, it has all the abstract methods, addEmployee, updateEmployee, deleteEmployee, and, of course, findByID and getAllEmployee. And all these are abstract methods of that interface.

And then we make the EmployeeDAOMemoryImpl class. We make it what? Implement. Can you see here? We make this class implement the interface. And as you see here now, of course, this can implement the addEmployee method, updateEmployee, delete method, again findByID, getAllEmployees, and so forth. And you see the braces next to it which means now this class here implements the EmployeeDAO.

And by the way, this one here is called EmployeeDAOMemoryImpl. . We can actually later on maybe make another, create another class, that is called EmployeeDAOFileImpl or EmployeeDAOJDBCImpl implementation or EmployeeDAOJPImpl, and so forth. Got that? That's the idea behind, of course, making use of the data access object pattern. Everybody's following, folks?

Generally, in many instances of Java, anything that ends with impl implies that the implementation of the interface.

Yes.

So that as here EmployeeDAOMemoryImpl suggests that it is an implementation, but it is in fact not an implementation. It is an interface.

Well, in this case, it is an implementation of the interface EmployeeDAO.

Is it?

Yeah, of course. You see these are the abstract methods, and these are the implementation of the abstract methods. Here we don't see the braces. Here we see the braces.

Oh, OK.

Got that? So again, so you realize that. So [? Das ?] was just mentioning that he was looking at this as an interface when in fact he just didn't look carefully at the braces. And this is really the implementation of the interface EmployeeDAO. Got that? OK. Good.

Of course, what we have done here is the fact that we implemented the EmployeeDAO, now of course, we're implementing the methods that allows you to create, update, and delete data where? In the database. Everybody's following, folks. Any questions? Please let me.

Continue with that, let's go ahead now. So now we know the purpose of the data access objects pattern. Everybody's following that, folks? OK.

Let's go ahead now and look at the need for the factory pattern. Well, folks, the DAO pattern depends on using interfaces to define an abstraction. So of course, using a DAO implementations constructor ties you to a specific implementation. For example, in this case, on the left side here, I have EmployeeDAO which means a reference variable of type EmployeeDAO. Again, with use of an interface type, any subsequent lines are not tied to the single implementation.

On the other hand, here on the right side, we are now using a constructor that, of course in this case, creates an instance type EmployeeDAOMemoryImpl. So again, this constructor invocation is tied to what? To an implementation and, of course, will appear in many places throughout an application. And of course we know that EmployeeDAOMemoryImpl class does what? It does implement the EmployeeDAO interface.

Let's go ahead and look now at using the factory pattern. Well, using a factory prevents your application from being tightly coupled to a specific DAO implementation. And for that, we see the example here where, in this case, first we declare a reference variable factory of EmployeeDAOFactory. And of course, we initialize it with the new instance of type EmployeeDAOFactory. Got that? And now what we do is we make use of, in this case, a method which is a factory method, in this case called createEmployeeDAO. And when I invoke the createEmployeeDAO on the reference variable factory that I had that I created the first statement. Then of course, in this case, will return an instance of type what? EmployeeDAO.

So the EmployeeDAO here implementation, of course, is hidden. So we like this pattern because of the fact it eliminates the direct call to a constructor. And instead, it favors a call to a method that returns an instance for you. We've seen this by the way, folks, where? In a singleton. Thank you so much. We've seen that in a singleton earlier. So that's why this is really likeable. So the factory, again, could return a DAO implementation that uses file or database to store and retrieve data.

Let's go ahead and look now at the factory. Well, the implementation of the factory is the only point in the application that, in this case, should depend on the concrete DAO class. So here, for example, we have a class called EmployeeDAOFactory, where in it what we do is we have now the createEmployeeDAO method that, of course in this case, will go ahead and create new instance of the EmployeeDAOMemoryImple and return that. Again, the returns here, it returns an interface type reference.

So, in general, by the way, for simplicity, the factory hard codes the name of a concrete class to instantiate. Again, we could enhance factory by putting the class name in an external source, like a text file, and use the Java.lang.class again to instantiate the concrete subclass. And we see this as an example where, in this case, we decided that this would be located in com.example.DAO, and that's the EmployeeDAO implementation. And then of course we specify this path in other string. And then of course, in this case we use the full name method of the class, OK, where we passed the name to it. And that, of course, that will return a reference to that class. And then once we have it, we'll go ahead and invoke on a new instance and that, of course, will get us what? It creates an instance and cast it into an object of type DAO and then, of course, return it.

Now let's look at the DAO and factory together. Here's an example, folks. And in this example, we now have a client. And if you take a look at the client that has a main method here, the client depends on what? The client depends on, of course, on the genetic type the abstract DAO, which is in these case EmployeeDAO. And we know that this EmployeeDAO is implemented by this class called, in this case, EmployeeDAOMemoryImp. So of course in this case, we can go ahead and have an EmployeeDAOFactory that can be used by the client, where it will go ahead and call a factory method, createEmployeeDAO, to return, in this case, and instance of type what? EmployeeDAO.

So we like the fact that clients depend only on abstract DAOs. Everybody sees that, folks? OK, good. So we like that a lot. So of course-- and by the way, these are a bunch of design patterns that you are going to see in the future. In fact, there are lots and lots of design patterns in the Java SE standard and also in the Java EE2. In the Java EE, we have web-tier patterns, presentation-tier patterns, business-tier patterns, integration-tier patterns, and so forth.

And we got a quiz here. And this quiz says, a typical singleton implementation contains a factory method. What do you think? That's true. Good job.

## 3. Inheritance with Java Interfaces, Part 3 - 14m

Let's go on and look now at code reuse. This is an interesting slide. And I would like everybody to pay attention to this one, folks.

Code duplication, copy and paste, can lead to maintenance problems. That's why we advise you that you do not want to fix the same bug multiple times. It's a bad idea.

Then what we tell you, please don't repeat yourself. Lots of times by the way, we call it DRY principle.

So reuse the code in a very, very good way, by doing what? By doing refactor all commonly used routines into libraries. That's why now we have libraries that we use. Right? That's why you see libraries because those libraries can be used by more than one application.

So instead of, again, being redundant and implementing them and everywhere. Then in this case, you don't have to actually do that. You put them into a library, or a bunch of libraries, and work with them.

And move the behavior shared by sibling classes into where, into the parent class. We already kind of know about that, from yesterday. And also create a new combinations of behaviors by combining multiple types of objects together. And that's the concept of composition. We're going to see composition soon.

So far, folks, we have seen inheritance. Now we're going to see also the concept of composition.

So let's look at some design difficulties. So here we have a class inheritance that allows for code reuse. But it's not really very modular. Why? Because here we have a class, in this case, we have a CarWithSunRoof class, which again inherits from BasicCar, or extends basic. And we have another car, called SpyCar, that extends from, again in this case, BasicCar.

So we know that Java supports singular inheritance, which by the way, eliminates the possibility of inheriting different implementations of a method with the same signature. We know about that.

And we also know that multiple interface inheritance does not, by the way, pose the same problem as class inheritance because there can be no conflicting method implementations in interfaces. We already know about that.

So the question that we have here is how do we create now a SpyCarWithSunRoof. We wanted a SpyCar. But we wanted it with a SunRoof. Well, here, what we're going to do is we want to make use of another nice pattern, which by the way, is also known in Object-Oriented Design. And that is the Composition Pattern.

So if you have taken our Object-Oriented Analysis and Oriented Implementation Analysis, using you UML, of course then, most probably, you will see this pattern. And we have it, by the way, available. You can actually look it up in the Oracle University website. And you can find that course, if you're interested, by looking at that course.

Let's look at Object Composition and what does it do for us. Well folks, object composition allows us to create more complex objects to again, in this case, implement composition. What we need to do is, we create a class with references to other classes and add same signature methods that forward to the referenced objects.

In this case, for example, if we want, we can create a class called SpyCarWithSunRoof. And by the way, we can now make this contain what, the BasicCar. So it's a composition of BasicCar, SpyCar Addon and of course, SunRoof Addon.

So combining multiple classes methods through composition and forwarding, is quite interesting. And of course, whenever we say method delegation or method forwarding, these are two terms that are often used interchangeably. So again in this case, method forwarding is when you write the method that does nothing except passes the execution over to another method.

And that's the concept of delegation, which is also known. In fact, we have a well-known pattern called what, the Delegate Pattern, in Object-Oriented.

Now, looking at composition implementation, of course, we looked at here on the diagram, on the class diagram. But right now, we would like to see how we actually implement this in Java.

And that leads us to this next slide. Well, as you see here, folks, what we have here is we have a class called SpyCarWithSunRoof. And as you see here, now, in an instance of BasicCar and an instance of SpyCar Addon, an instance of the SunRoof Addon. These are nothing but what, data members all of what, of the SpyCarWithSunRoof. OK.

And of course here, I have a method on the top level, in this case, which belongs to this class SpyCarWithSunRoof. And inside I am doing what? I'm doing a forwarding or delegating.

I'm making that start method called the start method of which component, of a BasicCar component. Got that? And we can have other forwarding methods. And by the way, if you're making use of NetBeans IDE and you want to implement composition with NetBeans IDE, we typically show you here some of the steps that you need to follow.

So use the insert code tool as again, the way you see it here, where you right-click within the braces of the complex class and choose Insert Code. And then, after that, select Delegate Method, the Generate Delegate Methods dialogue appears. And then, after that, select the method codes that you want to forward.

And of course, the methods are inserted for you. Again, repeat the steps for every delegate class. You folks are going to get a chance to do this, when you do the practice lab for this lesson. Everybody's following, folks? OK, good.

Continuing with that, let's go on and look at Polymorphism and Composition. This is a quite useful combination.

Well, we should know that polymorphism enables us to pass any type of a car to an addCar method. On the other hand, ladies and gentlemen, Composition does not enable Polymorphism, unless we do what, unless we going to find out what we should do to be able to handle that.

So in this case, we have a person and this person has an addCar. OK? And of course, in this case, we want to have the ability to have that addCar method. That will go ahead and add any type of car, no matter how complex it is. Again, it is pretty much another form of code reuse.

So again, in this case, we cannot currently say that addCar and pass a new instance of, in this case, SpyCarWithSunRoof. We cannot do that, yet. Everybody sees that, folks?

How can we now do this? Well easy, here's what we could do. We can now make the SpyCar because we know that the addCar can take an instance of a car. So if we make SpyCarWithSunRoof implement what, the Interface car, then we're good to go, folks.

So as you see here, we know that BasicCar implements car. And that we've done this previously, right, in a previous life. And now, what we did is, we made this SpyCarWithSunRoof Implement car. So every delegate class that you use in a composition should have an interface defined.

So when creating the composing class, what do you is you declare that it implements all of the Delegate Interface types. And by doing this, what you're doing is you create an object that is a composition of other objects and has many different types. Now, that we make SpyCarWithSunRoof implement car, we can now write this. Right, everybody sees that? Why, because SpyCarWithSunRoof now implements car, which by the way, we know that addCar takes an instance of type car. Everybody sees that? Good.

And now, we've got a quiz. This quiz says, in this case, method delegation is required to create complex objects using what?

[INAUDIBLE]

Composition, thank you.

And that's pretty much what we wanted to say about this particular module. So we looked at the model business problems by using interfaces. We looked at the defining Java interfaces. We looked at choosing between an interface inheritance and a class inheritance.

We looked at extending an interface. And we looked at how we refactor code to implement the DAO packet. Right? We're also looked at the Factory Pattern. Right? Something else, too, folks. So now, that we looked at interfaces, now we can look at the difference between an abstract class and an interface.

And by the way, the Java API has a lot of interfaces that you can implement. A good example, anybody can give me a good example of an API that is an interface? What is that API that allows you to talk to a database? What is it called?

[INAUDIBLE]

JDBC. JDBC can be implemented to any type of database. Anybody heard of JMS, Java Message Service Interface; how about GNDI, right; how about JAAS, Java Authentication Authorization Services, and so forth. So they are a lot of APIs, again, that are interfaces that can be implemented anyway you want. JNDI is the Java Naming Directory Interface that allows you to look up services. Right?

It turns out, folks, that we have a bunch of also practice slides here. The first one we implement an interface. Second one, we applied the DAO pattern. The third one, which is optional, and I'll advise you to do it, please. It's an overview of the Implementing Composition.

And of course, if you look at the Activity Guide and particularly, looking at the labs of module six, you will see the details here, where first, we have a implementing an interface. And by the way, we always give you the summary level and of course, the detail level version of that.

So it depends how much you are comfortable. If you're comfortable with the summary level, then go ahead and use that. If you need to get a little bit more information, then in that case, you get into the detail level and use that to do your lab, your practice.

And then you have practice 6-2. Again, it has a summary level applying the DAO pattern. Of course, if you need more information, then maybe you should use the detailed level for that particular practice.

And we also have a last one, which is optional. And that is implementing composition. And in this case, also, we advise you to please try this one here. Because it's worth trying it.

So we'll go ahead and do the practice labs. And then, after that, we'll continue with the next lecture. Thank you.

## 4. Practice 6-1: Implementing an Interface - 9m

After looking at Lesson 6, which covers inheritance with Java interfaces, where we modeled business problems using interfaces, we defined Java interfaces. We selected between an interface inheritance and class inheritance. We also used the concept of extending an interface and refactoring code to implement the data access object.

Let's go ahead and look at Practice 1 of Lesson 6. And we go to the detailed level for this one. In this practice, we create an interface and implement that interface. Again, in summary, we've been given a project that implements an abstract class named Animal. And we create a hierarchy of animals that is rooted in the Animal class. Of course, several of the Animal classes implement an interface named Pet.

So as you see here, we have the Animal class, which is abstract, and this is showed on this diagram here. And we've got the classes that inherit from Animal are Spider, Cat, and Fish. But we made Cat and Fish implement the interface Pet. So first, we are going to review the whole code and assume everybody reviewed that. And then we open the Animal class, and we review this abstract class.

And of course, we open the Spider class. The Spider class is an example of extending an Animal class. And let's go ahead and do that. So we have the Animal class, which pretty much has a protected variable here, or instance variable, called Legs of type integer. And it has the constructor that takes the variable and integer presenting the number of legs to initialize the Legs, in this case.

And it has a Walk method. Then it has a Void. Then, of course, it has a Print message saying that the animal walks on, and then the number legs. And then it has an Eat method, which, by the way, turned out to be abstract here. We made it abstract, because the class Animal, itself, is abstract.

And then, again, following what they asked us to do is to look at the Spider. And we look at the Spider class. And we see that it extends Animal, and it has a constructor that's called Super-- the constructor of the Super class pass 8, because a spider has eight legs. And it hard overrides the method Eat, what it says here. We just print this message says the Spider eats a fly.

Continuing with the, again, activity guide question, create a class, in this case called-- create, rather, a new interface called Pet in the package com.example. And code the Pet interface that has a bunch of methods, getName, setName, and Play. Let's go ahead and see that.

Here's the interface that has three different abstract methods. And then after that, continuing with this, we went ahead and we created a class Fish in the package. Again, code the Fish in this case, where that extends Animal. And this, complete, again, in this case, it has a string called Name. It has a bunch of get as and set as Names.

And in this case, the Fish takes-- the constructor takes-- calls the constructor of the Super class and puts zero to it, because the fish has zero legs. And it overrides the method, again, in this case Play, by printing a message called "Just keep swimming." Let's go ahead and see that. And that's for, of course, the Fish.

So we'll open the Fish. And here's the fish. Extends Animal, it has a constructor, overrides the Eat, and it has a getName, a setName, and it has a Play, and it has a Walk. OK, fish, of course, can't walk. They swim, as we just put a message over there.

All right, continuing with that-- and so we did, again, here we see the overriding, again, the methods of Eat and Fish. And like we said here, the Eat is we say that the fish eats pond scum. We see it here and here.

And continuing with that, so create a class called Cat in the com.example package. The Cat class extends, of course, Animal. And of course, it has a string name. It has a bunch of getters and setters.

And it has a constructor that takes a string name and, of course, passes 4 to the constructor of the Super class, which means the cat has four legs and has a bunch of methods that you override. Again, here it has the constructor that picks the name of the cat, Fluffy. And it has the Play method that you want to override and the Eat method that you want to override.

Let's go ahead and look at that cat-- here it is-- that extends Animal and implements Pet as, OK. So of course, in this case, the Fish class, of course, will go ahead and extend Animal and implement Pet interface. But the Cat also extends Animal and implements Pet.

And here's the constructor first that calls just. In this case, this, and pass to it Fluffy, which pretty much calls this constructor here and pass to it the string Fluffy. And then this will call the Super and pass 4 for the number of legs. And that's calling the constructor of the Super class. And it overrides a bunch of methods, Eat getName, setName, and Play and so forth.

And then, of course, then we modify the PetMain class to actually create this, again, instances of different animals that extend, of course, animal, in this case, Cat and Spider and so forth. So first, we create and instance of a Spider. And then, of course, after that, an instance of a Cat and an instance of a Fish and so forth and run all of that.

So let's go ahead and see that in the Pet Name method where we first create an instance of an animal. And then we create an instance of Spider, and we invoke the Eat and Walk, create an instance of a Cat called Tom. And we create again, in this case, and we can also set the name of the Cat by creating another instance of the Cat and set it to Mr. Whiskers. Create an instance of a Fish, set the name Guppy, and of course, in this case, call the play with Animal method, which, by the way, is implemented here, that says if an instance is a pet, go ahead and cast that into an instance of a pet and call the Play method on that.

And of course, after that, they're asking us to run, implement, again, the Play With Animal method, which just discussed and called that. And of course, after that, we're going to run the project. We're running the project. In this case, we go to Properties, click on Run, and make sure that the PetMain class is actually the one that is being run in this case, because it has the Main method.

And then, of course, running it will get us, in this case, the output where the spider eats fly, and then the animal walks on eight legs. Then this is passed just because of the spider. And again, cats like to eat spiders and fish and so forth. So pretty much wherever we did here and trying to, again, call the different methods.

And of course, we know that the different methods print different messages in the Fish and in the Cat and the Spider and so forth, and of course, in the Animal itself. And that pretty much ends the Practice 1 of Lesson 6. Thank you.

## 5. Practice 6-2: Applying the DAO Pattern - 12m

Let's go ahead and look now at Practice 2 of Lesson 7, where we apply the DAO. In this case, we will take an existing application and refactor the code to implement the Data Access Object-- DAO-- design pattern. So again, we've been given a project that implements the logic for a human resources application. The application allows for creating, retrieving, updating, deleting, and listing Employee objects.

And the Employee objects are currently stored in memory using an array. We must move any code related to the persistence of Employee objects out of the Employee class. In these later practices, again, we will supply alternative persistent implementation. In the future, this application should require no modification when substituting the persistent implementation.

The task is to open the project. And of course, we run it, and we should be able to see a menu, C for Create, R for read, U for Update, D for Delete, L for List, and Q for Quit. And of course, entering the dates, in this case, in the form of Nov for November, space, 26, comma, space, 1996, for example. And of course, the Employee ID will be in the range of 0 through 9. So we review the class Employee. Go ahead and open that. Here it is, the class Employee, which, by the way, we're already familiar with it.

And then after that, we'll continue by, in our case here, once we've reviewed that class Employee, we'll go ahead and find an array using these used to store the employees. We already know about that. And locate the Save, Delete, FindById, Get, and so forth, methods. And of course, that will lead us always to looking at to the Employee class.

And then, of course, create a package called DAO under com.example. Create an EmployeeDAO interface and put in it the methods, Add, Update, and Delete. Find, and GetAll Employees. And that, of course, would be this EmployeeDAO, which turned out to be an interface in this case. And it has, again, the abstract methods, Add, Update, Delete, FindById, and GetAllEmployees.

After that, we'll go ahead and create the Employee implementation in the same package and complete, again, the EmployeeDAOMemory implementation class, remove the Employee array and any related methods from the Employee class to the EmployeeDAO implementation. So move them to that EmployeeDAOMemory implementation. Implement the EmployeeDAO interface, modify the methods that you moved in the previous step.

And of course, the Save method becomes the Add method and is modified to have an Employee parameter. And the Save method is duplicated to become the Update method that is modified to have an Employee parameter. Delete method is modified, and the FindById method is no longer static. And the GetAllEmployee method is no longer static. And that would look something like this.

Let's go ahead and do that. So that, of course, would be this one here. It's the EmployeeDAOMemory implementation that implements the EmployeeDAO. And that pretty much has the-- so we have the array of employees here, and we have the constructor here, and we have the Add, the Update, the Delete, and the FindById and the GetAllEmployees methods all implemented. As you see, straightforward Java code.

And continuing with that, update the employee test. So we are right now at update the EmployeeTestInteractive class by, again, creating a new instance of the EmployeeDAOMemory implementation. Modify any code containing errors to use the EmployeeDAO instances. And of course, after that-- so let's go ahead and see that. That would be in the employee test.

So as you see here, we create an instance of the EmployeeDAOFactory, referenced by a reference variable Factory, declare a local variable called TimeToQuit, which is of type Boolean, initialized to false. Create a new instance of the EmployeeDAO, and get a BufferedReader. And we have, of course, the ExecuteMenu method.

First, we print here, of course, the text. And then here, we have the Switch statement that, of course, in these case, goes through if it's a C or an R for Create or Retrieve or Update and so forth, or Delete or L for List. And then we create a new instance of the, in this case, we call the InputEmployee passed with a BufferedReader, get an instance of Employee. That's a static method.

And of course, the second one, method InputEmployee, that takes a BufferedReader and an instance of the employee [UNINTELLIGIBLE] employee defaults. And we have another one that takes, of course, in addition to the BufferedReader, the Employee is the Boolean. And of course, that is coded to handle-- no, that's pretty much the InputEmployee.

And continuing with that, so create an EmployeeDAOFactory class, and of course, add a method, in this case, CreateEmployeeDAO. And that pretty much is this one here that gets us an instance of the EmployeeDAOMemory implementation. And that's exactly, by the way, what we used in NetBeans. If you remember, when we were looking at the EmployeeTestInteractive, that's where we called to get an instance of the Employee implementation. And again, this code is provided on the environment. And you just take a look at it, which is straightforward code.

And of course, continuing with that, so in the EmployeeTestInteractive, so we go ahead and create a new instance of EmployeeDAOFactory, which, by the way, we already have seen here, an instance of the EmployeeDAOFactory. Diego And that's this one here that we already went through earlier. And of course, after that, we go ahead and create a-- we obtain an EmployeeDAO instance using the Factory created in the previous step and by invoking the CreateEmployeeDAO. And that, of course, in this case, would be the Create method that we have here. And that gives you an instance of the EmployeeDAO.

And after that, run the project. So first, we click on Properties, and then we click on Run, and then we are now running the-- obviously, in this case, you would be the Employee. So the EmployeeInteractiveTest, that's the one that we want. Click OK. And then after that, we'll go ahead and run this.

Of course, now, if we want to go ahead and create, capital C for Create. And we just follow exactly what they were telling us earlier how to run this all the way. So with the entering dates, you should be able, again, in the form of this. So in that case, and if you click, you can then enter the Employee ID. So let's assume it's 7.

And then enter the Employee first name. Let's assume it's Tom. And the employee last name is Smith. Of course, the date here, let's assume it's November, and space, 26, and then the space, again, just following what they asked us to do here. So we've got November, space, 26, comma, space, 1976, for example.

Enter the float value for the employee's salary. And let's assume that is something like this, for example. And that, of course, will print, in this case, the employee ID 7, Tom Smith, date of birth, of course, and their salary. And that will end the Practice 2 of Lesson 6. Thank you.

## 6. Practice 6-3: Implementing Composition - 10m

Let's go ahead and look now at Practice 3 of Lesson 6. In this practice, you will take an existing application and refactor it to make use of composition. So we have been given a small project that represents a hierarchy of animals that is rooted in the Animal class. Several of these animal classes implement an interface named Pet. This project is to complete an implementation of the Implementing an Interface practice.

Again, in this case, there are some potential problems with the design of the existing project. If you want to restrict a pet's name to be less than 20 characters, how many classes you would have to modify. Would this problem become worse with the addition of new animals? If some types of animals, such as Fish, cannot walk, should they have a Walk method?

So in the task, we open this PetComposition project as the main project, and of course, expand the project directory. And again, in this case, we centralize all the name functionality. All pets can be named, but you may want to give names to objects that cannot play. For instance, you could name a volleyball Wilson. Again, your design should reflect this.

Create a Nameable interface under the com.example package. And this completes the Nameable interface with the SetName and GetName method signatures. And create a-- so let's go ahead and look at that, this Nameable interface. And that, of course, in this case, has a SetName and a GetName that are abstract methods.

And then, in addition, complete the Nameable implementation class. It should implement the Nameable interface, contain a private String field, contain Name, only accepts names less than 20 characters in length, and print the "Name too long" if the name is too long. So let's go ahead and do that.

And that's where now we'll go ahead and make the Nameable implementation implements Nameable. It has a String name, and it has a method SetName, that, of course, takes a name. If, again, the length is less than 20 characters, go ahead and use that name. Otherwise, print the "Name too long," and then override the GetName by returning a name.

Continuing with that, with this lab or practice, modify the Fish, Cat, and again-- rather, modify the Pet interface and extends the Nameable interface. And of course, remove the GetName in the SetName method signatures. They are inherited now.

So let's go ahead and look at that. So we have now the Pet class extends Nameable. OK, that's good, and has the Play method over there but extends all the methods of Nameable. That's good.

So we showed you that. And then, of course, we deleted the Get and SetName and because they're inherited, in this case, from the Nameable interface. Modify the Fish and Cat classes to use composition. Again, delete the Name field, delete the existing GetName and SetName, add the new Nameable field that you see here.

And of course, add the Get and Set methods that delegate to the Nameable field. Hint, position the cursor within the curly braces for the class. Open the Source menu, and select, again, Insert Code, select Delegate Method, select the Nameable check box, and click the Generate button.

So we said now we're looking at, in our case here, the Fish and Cat classes. Let's go ahead and do that. The fish class, as you see, extends Animal, implements Pet, and it has an instance of Nameable here. And as you see, it has a SetName that calls the SetName of the Nameable reference variable, and the same thing with the GetName here.

And then for the Cat, the same thing. Again, we create a new instance of Nameable. And of course, as you see here, the GetName and the SetName are calling the SetName and the GetName of the Nameable reference variable here, which is a reference variable of type Nameable here, which is a new instance of the Nameable implementation.

Continuing with that, and now we are-- so we've done that. And now, again, centralize all walking functionality. Only some animals can walk. They remove the Walk method from the Animal class and use interfaces and composition to facilitate that. Create Ambulatory interface, and complete the Ambulatory interface that will have Walk as an abstract method.

Let's go ahead and see that. Here it is. This is the interface that has the Work method. And then after that, they're telling us to create a class called Ambulatory implementation, impl, which stands for implementation. And of course, complete-- this should be implementing the interface Ambulatory and contains a private integer field Legs that, of course, contains a single argument constructor that receives an Int value to be stored in the Leg field, again, in this case, and contain a Walk method that you see here.

Let's go ahead and see that. Of course, delete the Walk method from the Fish class, which we already deleted. So let's go ahead and look at this Ambulatory implementation. Here it is.

And you see, it implements the Ambulatory interface. And that's where, again, it has the Legs, and of course, it has the constructor here that takes the number of legs, like we said. And it has the Walk method that now, of course, is in this case defined in this Ambulatory implementation class.

And then after that, again, modify the Spider and the Cat classes to use composition. Add the new Ambulatory field. Let's go ahead and do that, the Spider and the Cat. So here's the Spider that calls a new instance of the Ambulatory that you see here and the Cat that also contains a new instance of the Ambulatory that you see here.

So add the Walk method that delegates to the Ambulatory. Position the cursor within the curly braces of the class. Open the Source menu, select Insert Code, select Delegate Method, select the Ambulatory check box, and click the Generate button. Initialize the Ambulatory field within the Spider and the Cat by, again, a constructor, and modify the Pet method.

So first of all, let's go ahead and look at the Spider and the Cat. We're looking at the Spider. You see, of course, in this case, how we do the initialization down here on line eight. And of course, for the cat, it's the same thing too, where we see how we do the implementation on line 13 here, rather than the initialization with the number of legs here, four.

And then after that, modify the PetMain class to test the Walk method. Again, the Walk method can only be called on the Spider, Cat, or Ambulatory references. Let's go ahead and see that. And you see it here, and see how we create a new instance of the Spider, and we called Walk. And we also created an instance of Cat, and we called Walk. And of course, here is the print with Animal-- I'd rather play with Animal method that we already know about from the previous labs, because running this one here will, of course, get us an output.

And that's pretty much the output that you see here. The Spider eats a fly, the animal walks on eight legs, and so forth, the output that we typically have. And that pretty much ends the Practice 3 of Lesson 6. Thank you.
