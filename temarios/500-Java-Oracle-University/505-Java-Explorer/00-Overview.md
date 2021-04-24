# 1. Overview

Una breve descripción general del "mundo de Java": su ecosistema, sintaxis, mentalidad de diseño, API y uso empresarial

## Title and Objectives 3m

Welcome to the Java Basics learning path, where we introduce the world of Java and the fundamentals of Java programming. My name is Joe Greenwald. I'm a senior principal instructor and learning solution architect with Oracle University. My background is in model-based development, case tools, and object-oriented analysis and design programming.

I got my start with objects in the late '80s with Object Pascal-- some of you may remember Borland Turbo Pascal and Delphi products-- followed by Smalltalk and C++. I've been working with Java since it was first created and taught the first Java classes for Oracle University. I've been working with and teaching Java ever since.

Java is widely used in the industry, and learning Java is applicable to many different roles, not just the obvious developer and designer roles. All manner of tech folks can benefit from knowing Java-- support engineers, QA engineers, even administrators and architects. Also, proficiency with Java is a highly marketable skill. This learning path serves as an introduction to our Java learning subscription, which can be your one-stop shop for your Java education and training needs.

This learning path contains two parts. The first is an overview of the world of Java, and the second is a course to teach you basic programming skills in Java. Let's take a look at the objectives for the world of Java.

Our first objective is to become familiar with why Java was invented and the different ways that it is used, from smart cards to TVs to the enterprise. Then we'll briefly examine the structure of a typical Java program to see what it looks like. We'll also consider the Java design mindset. How do we design using object-oriented principles and Java features to increase code reuse and create code that is easier to maintain and extend?

We'll examine some of the more common Application Programming Interfaces, APIs, included with the Java Development Kit. These are libraries of classes that add functionality to our applications and make it easier to create robust, industrial-grade applications. And lastly, we'll look at how Java is used in the enterprise, which is where we see it used most often today.

I hope my experience and enthusiasm for Java is contagious, and you leave feeling entertained, enlightened, and eager to get started programming with Java. Let's get started.

## Java Origins and Ecosystem 5m

Explain the Java origins and ecosystem. Java was created at Sun Microsystems as a general-purpose programming language, similar to C and C++. It is object-oriented and platform-independent. And we'll talk more about what that actually means.

It was originally designed in 1995 for use in consumer electronics. Modern uses include things like writing applications for the Internet of Things, cloud computing, and so on. It's widely adopted across billions of devices, ranging from smart cards, and watches, and phones, and tablets, up through computers, all the way up to supercomputers.

The Java ecosystem has a number of different Java additions that make up the ecosystem. First is the Java Card, which is the smart card addition and can be used with SIM cards. Next is the Java ME Micro-Edition, which can work with things like smart TVs, and set-top boxes, and embedded devices.

Java SE Standard-Edition is where you start learning the Java programming language, because it contains both the tools, like compilers and Java virtual machines, to run your code, but also the structures necessary to support the code that you're creating-- libraries of very, very useful classes and functionality.

Java MP Micro-Profile is used with micro services and allows you to define, for a server, how your application should be deployed and run as a microservice. And lastly, Java EE Enterprise-Edition supports creating applications for the enterprise. This includes web services, passing messages through Java messaging asynchronously, and enterprise JavaBeans for sharing code.

Also, for user interface, you can also create servlets, Java server pages, and Java server faces applications, although we're seeing that being used less and less. Mostly, we're seeing Java used in the enterprise, in what we call the back end of the enterprise, to create reusable, shareable code that can be used by many different applications. This can take the form of web services and is typically how we see Java being used today.

I mentioned earlier that Java is platform-independent. So Java is cross-platform because each Java program only needs to be written and compiled once. Now, what this means is, when you have a Java program, you write the logic in English, as you see here-- number one. You see the public class MyApp, and you have some program logic. And as the course goes along, we'll talk about what this code means and what it does. But this is basically creating a class called MyApp that would have some programming logic.

We'd write that and then compile it. We cannot run English language on computers. We have to convert the actual code that we're writing-- our source code-- into a form the computer can execute-- binary 1s and 0s that it can execute. So what the compile does is convert the code that we write-- the source code that we write-- into a form that the computer can execute.

Now, it actually doesn't go all the way directly down to what's called machine code, which is the actual executable code for the computer. It goes to an intermediate form of code called bytecode. So the bytecode, then, can be deployed to any computer that runs a Java virtual machine and can be executed there.

So this is why we say it can be written once and compiled once, and then it can run in many different environments. So for example, I can write a Java program on my Macintosh and compile it into a Java class, take that Java class over to a Windows machine, and I can run that Java class on that machine. And it'll look and work the same as it did on my Mac.

The Java programs themselves are executed inside of a piece of software called a Java virtual machine. The Java virtual machine emulates the actual CPU and the computer that the software is running on, and translates the bytecodes that were created by the compiler into the actual executable code necessary for that computer.

So Java is cross-platform, and we only have to write the code once. And this is where you've heard, maybe, that Java is "write once, run anywhere."

## Java Language 3m

The Java language. The Java language is made up of three basic code structures-- a class, which codes the basic unit of your code and describes the data and logic of your program, a package, which is an intermediate logical code aggregation-- that's quite a mouthful.

A package is zero or more classes-- typically a group of classes that are logically related together. So for example, if I was creating an application for order entry, I would probably have an order entry package. And I would have, like, an order class, and I would have a product class, and things like that.

With Java 9, we introduced the module. This is a high-level physical code aggregation, and it allows you to override the lower-level code aggregation of the package and choose, explicitly, what parts of your code you want to expose for reuse and people to access and what parts you don't.

In Java syntax, Java code is grouped into classes. Here, we see a class called employee. It has methods, like-- for example, set salary and get name, which actually carry out code and do things-- and variables that store values. So for example, we have a variable called name, which is a string, as it will store it names.

And we have a get name method. And when that method is invoked, it returns this string, which is the name. We also have a set salary, which, when we pass a value to it as a float, it will use that to set the salary value.

Java includes exception handling, which allows you to interrupt the normal program execution flow when a problem occurs. Here, for example, we're trying to read lines from a file. And if we're not able to do so-- maybe the file is gone or there's a problem with the file system-- an exception would be thrown.

And rather than the program crashing or having to write long, complicated logic to deal with this occurring, it's a much cleaner way to simply change the flow of execution. And we'll talk about this more when we talk about exception handling in the course itself.

Most modern programming languages have some form of exception handling. C++ does. C# does. PL/SQL does. All of these have the same basic idea that, when an exception occurs, you branch out of where the exception occurs and goes to an exception handler, where you then continue on to try to deal with the exception. Doing this allows you to decide what your program should do in the case of an error.

Java exception handling allows you to write flexible code that can handle different types of adverse circumstances. When something undesirable or an error in a program occurs in your program execution, you can write code that can deal with that problem.

## Java Design 6m

The Java design mindset. When working with Java and object-oriented programming languages, we work with classes and objects. A class represents a type of thing or concept that has attributes and behavior. For example, here, we see a cat, or a dog, or a ball, or a human. An object is an instance-- a specific example of a class-- that is created at runtime by the computer to execute our code.

So here, we see, for example, that at runtime, the computer has created a new dog whose name is Fido and another new dog whose name is Rex. These are object instances created from the template class that was created as part of the design.

One of the benefits of working with Java is the ability to easily reuse code. Inheritance allows more general top-level classes, like, say, animal, which might have attributes of name and weight and behaviors of eat and breathe, to be extended with lower-level classes that have more specific behavior as dictated by the needs of the application.

For example, a lower-level, more specific form of an animal class might be a dog class. Now, the dog class would extend the animal class and, thereby, would automatically get the name and weight attributes and the eat and breathe behavior from the animal class.

If we had another class, like fish, it would be the same thing. The fish class could extend the animal class. And it would receive the attributes of name and weight, because fish can have names and weights, and also because they can eat and breathe. Now, dogs breathe differently than fish, and so the implementation of the breathe behavior would be different in each class.

And you might wonder, well, how is this resolved at runtime? Well, at runtime, Java detects the type of object-- dog or fish-- that's being used, and executes the appropriate code for that object. So if we had a dog object and asked it to breathe, Java would automatically execute the breathe code for the dog. If we had a fish object and we asked it to breathe, Java would automatically execute the breathe code for a fish. This ability of the Java runtime system to invoke the correct behavior based on the type of object is called polymorphism.

It's also worth mentioning that a dog might have other behaviors, like chasing cars or burying bones, that other types of animals might not possess. So we can add attributes and behaviors to our lower-level classes to extend and augment the functionality inherited from the top-level classes, thus creating a flexible, extendable application.

The graphic here shows inheritance at work in evolution. It shows the evolutionary tree from a single-celled life form all the way through inheritance to a more complex, specific form of life, like a tree or a dog.

Java has other ways to achieve a flexible design, like interfaces that abstract out common behavior across classes, enumerations, called enums, for creating user-defined constants, and generics to pass specific type information to the compiler, making programs more stable and less error-prone.

Now, here, we see, for example, an enum called feed, which would have two constants-- one called dog food and one called fish food-- so when we go to feed our pets, we can make sure that they get the right type of food. We also see that we're creating a list, or a collection, of pet objects, and we've passed generic information to that list.

Now, this will make sure the compiler makes sure that we can only add objects to this list that implement the pet interface. So pet here references the pet interface here, and the pet interface would have certain behaviors, like maybe eat and breathe.

Now, if we go to add a new dog, we can create a new dog object and add that to our pets list. We can create a new fish object and add that to our pets list. And it works in both cases, because dog and fish implement the pet interface.

But let's say we had a different animal. Let's say we had a boa constrictor that does not implement the pet interface. In that case, if we tried to add a new boa constrictor object-- if we created a new boa constrictor object and then tried to add it to the pets list-- it would be rejected, and we would get a warning.

And lastly, we look at analysis, design, and architecture. We do all of these with Java and object orientation. And to make it easier for us, we use something called the Unified Modeling Language, UML. This is a modeling notation that allows us to analyze our business requirements, model our code structures, and describe application deployment. And it's done with a series of diagrams and meta information about the application we're creating.

We typically start with a use case that describes the interaction between an end user and the system. We use class diagrams to represent the different classes we're going to need, and also document their behaviors, attributes, and relationships to each other.

Here, for example, we see two classes which are inheriting from a superclass, or a top-level class. We have activity diagrams to describe flow of control. We have sequence diagrams to show how one object can invoke another object, and the passing of data back and forth. And we have state transition diagrams if we need to document that a certain object goes in or out of a certain state-- for example, turning on or turning something off. And then we have deployment diagrams that indicate how the application can be deployed.

Using all of these together allows us to analyze, design, and architect our applications.

## Java APIs 6m

Java APIs. Java comes with a number of different application program interfaces to allow you to do useful things in the programming language without having to write the code yourself. First up, we see here an array. An array is a simple group of elements that are indexed, and is one of the easiest data structures to work with. Each element in the array has a different index, index of 0, 1, 2, 3, and we can easily access and manipulate the array.

But for more complex, flexible capabilities, there is a collection API that is provided that allows us to work with different types of collections, array lists, link lists, sets, stacks, queues. And we can do things like add, update, remove, search, and rearrange. So the collection API is very useful for allowing us to manipulate collections of objects.

The Java Streams API allow us to efficiently filter, map, and reduce large streams of data. They perform these actions upon data using lambda expressions. And lambda expressions are a form of functional programming in Java.

Here we see, for example, that we've created a new array list of employees. And we're not showing all of the code, but there would be code here that would actually populate the list. So we have a list of employees. And then we can say to that list, return a stream of objects, and do this in parallel, multi-threaded, automatically filtering the list.

So for each employee whose salary is greater than 1,000, allow that employee to be calculated. If you have an employee whose salary is not greater than 1,000, then that employee would be filtered out. Then for each of the employees whose salary is greater than 1,000, we're going to calculate a bonus for that employee. So we calculate the bonus for each employee, and this can be done in parallel. So Java Streams APIs are a very powerful way of manipulating working with large data sets.

Java also comes with I/O APIs. This allows you to transfer data through a series of interconnected streams. These are different streams than we saw in the previous slide. We can read information from various sources, typically a flat file, but it doesn't have to be, and that would be the input direction. And we can write information to various destinations. That's the output direction.

Here we see an example where we have path information for a file in the file system, and we can retrieve that information and manipulate it as an object. So if we want to work with that file, copy it, delete it, do other things, open it, things like that, we can do so. In the second line of code, we see a file here called readme, which is being read using UTF-8 character set. And for each line of the file that's being read, they're just simply printing out the lines. So they're reading the line from the file, and printing it out to standard I/O. But with this, you can see that the capabilities exist in Java to work with file systems and work with files and other data sources.

There's also a Java Concurrency API that'll take advantage of multicore CPU architectures. It will execute code concurrently to achieve better performance and user experience. It'll create multiple different tasks that all can run basically at the same time. Now of course, that's going to be affected by how many CPUs you actually have, and other workloads in the computer. But basically, from day one when Java was first created, the ability to create multi-threaded code has been there.

So here we see an example where we're going to create a callable object of type BigDecimal to do a calculation with called taxCalculation. And we have some code in there that will do some tax calculations. And then to use this, we would go to our executor service, which will execute the actual threads. It will create a new cached thread pool with all the different threads. It'll then go ahead, and when we submit this tax calculation, it'll actually cause the thread pool to be executed, and each of the different results are being executed and then returned at the end.

Our last API that we're going to look at here is the Java Database Connectivity Protocol, JDBC, that allows us to connect to vendor databases and execute SQL statements. The Java Persistence API, JPA, has code that allows Java objects to be written to relational databases, and relational SQL data to be read from those databases, queried from those databases, and then create Java objects as a result. This is called object-relational mapping, as we move Java data into a database and database data into Java objects.

So this all starts with the application logic, which would make a call to or invoke the Java Persistence API. For example, we need to read information about a dog, let's say. So we would have a dog object here. And the dog object would know how to read and write itself to the database. The application logic would go to JPA and say, hey, we need to connect to the database, and we need to read and write information about a dog.

So JPA would do this by using a provider-neutral API. So regardless of what type of database we're working with, Oracle, Db2, SQL Server, all of them work the same way from the Java perspective. The provider neutral API allows us to connect to the database, create a statement object to execute SQL statements, execute the SQL statement, and get back the return result set of all the rows that come back when a query is done.

Now in order to make this work, there's also a provider specific driver that is used. So the provider neutral API is used by Java Persistence architecture, and then the provider JDBC driver is used at runtime to actually connect to the database. So for example, Oracle creates a JDBC driver, as does IBM for Db2, as does Microsoft for SQL Server. And most relational databases, if not all relational databases out there, have drivers for JDBC and Java.

So we see here that the application logic asks JPA to read or write to the database. It uses the provider neutral API to connect, execute a statement, and get a result set or write to the database. The provider JDBC driver connects to the database using a native database protocol. And then the database responds to the SQL statements that are implemented.

There are other APIs as well, and we cover those in the Java Learning Subscription.

## Java in the Enterprise 4m

Java in the Enterprise. Java works in the enterprise. And it's actually mostly where Java is used today, in the back end processing. You don't really see Java used too much for user interfaces any longer. So in the back end, one of the things we work with Java are web services.

Web services allow us to expose code to the enterprise for reuse in a controlled, standardized manner, basically sending messages over HTTP transports, although some types of web services, like SOAP, can work with any transport, but typically we're talking about over the internet. These web service capabilities include the ability to work with XML object mappings, and be able to convert Java objects into XML for transmission across the wire, and to receive the XML data back and convert it back into a Java object. And they can do the same thing with JavaScript Object Notation, JSON. So there's capabilities built-in and APIs built-in that would convert Java objects into XML or JSON, send across to another web service, and get the result back and convert it back to Java.

The JAX-WS API enables the SOAP service implementation where we can define our own interface and our own types of methods that we support. The JAX-RS API enables REST service implementation that leverages the HTTP transport, and the operations available in HTTP, and can work with different types of data. SOAP can only work with XML but REST services can work with any type of data we wish, XML, JSON, plain text, whatever we want.

Java EE applications are actually deployed to a server in order to execute. While Java Standard Edition applications can run from the command line, Java EE applications have to be deployed to a server like WebLogic or WebSphere, JBoss, or Tomcat. These types of servers or containers host Java EE applications. They provide support for enterprise Java Bean, which implement reusable logic and web containers. Here, for example, we see the web container supporting front-end components like servlets, Java Server Pages, and Java Server Faces. And the EJB container supports business logic and back-end components.

The container provide security, concurrency, transaction management, and lifecycle management so the developer doesn't have to deal with that. The Oracle Cloud Infrastructure, OCI, supports a number of different APIs and services to make enterprise applications easier to write for the cloud.

We support developer tools like command line tools, SDKs, Ansible, Terraform, Eclipse, GitHub, so you can put your code into GitHub and be able to leverage it from the cloud. We support many different languages and frameworks, Java EE, of course, but also Ruby, node.js, Python, C-- C++ and C#, Go, Helidon, and Grail VM as ways of hosting. Down here we see cloud native support, functional programming streaming, API management, and working with events. And of course, we support Kubernetes and Docker.

We also support Data Management, the Oracle's autonomous database, data warehouse, and transaction , processing. and not only SQL databases. And then we have support for Visual Builder resource manager and other types of tools that we can leverage from a Java perspective. At the base of all this is the Oracle Cloud infrastructure. The virtual machines or bare metal compute instances, the storage, the networking, and security and databases. So with this all these capabilities are available to the Java developer. And we'll see in the Java Learning subscription and other learning subscriptions how to work with all these different capabilities.

## Summary 1m

In this module, you learned a little bit about the Java origins and ecosystem, the Java language, the Java design mindset that's used to design using object orientation, the Java application programming interfaces available, and how Java is used in the enterprise. Now that you've completed this overview, what's next? What's next for you is to complete the Java Basics programming course. Once you complete that course, you'll earn your Oracle Learning Explorer Badge. Good luck.
