# 2: Introducing the Java Technology

1. Introducing the Java Technology, Part 1 - 40m
2. Introducing the Java Technology, Part 2 - 19m
3. Practices for Lesson 2 - 28m

## 1. Introducing the Java Technology, Part 1 - 40m

We're going to look at identifying different Java technology groups. We then get into describing examples of how Java is used in applications, as well as a consumer products. We also get into describing the benefits of using an integrated development environment IDE. In our particular case, folks, we're going to use the Oracle NetBeans, which by the way, supports the Java SE 7, the current spec, the latest one.

I just want to pass information, extra information, just to let you know that the Java SE 7 was introduced on the 7th of July, 2011. Continuing with the concept, we're going look at the concept of developing classes and describing how to declare classes. We're going to look at the concepts of analyzing a business problem, and to recognize objects and operations that perform the building blocks of the Java program design.

We'll get into the concept of the term object, folks, and what doesn't it mean, and it's relationship to the class. So in a sense, what we are going to do is we are going to get into learning about these Java classes that play the role of what we call the blueprint. And from these blueprints, we'll go ahead and instantiate, we're going to learn the word instantiate, objects of type that class or creating objects of type that class. We're going to look at the concept of writing simple Java program that compiles and runs successfully. We're going to look at the concept of declaring an initializing variables in Java.

We're going to look at the difference primitives that are types in Java. It turn out that there are eight primitives in Java. We're going to look at them, and by the way, we're going to make the difference between the Java primitives and the Java objects. So there will be variable representing primitives, but then there will be the reference variable representing, of course, references to objects, and we're going to make the difference between the two.

Instantiating an object and effectively using objects reference variables, that's what we are going to look at. And of course, we're going to look at the concept of operators in Java, loops in Java, like the for loop, the while loop, the do/while loop, and so forth. And of course, we going to look at the decision constructs, the if/else and the switch states, [INAUDIBLE], and so forth. And we also are going to get into declaring and instantiating arrays and array lists, and be able to, of course, iterate through them.

We'll get into the Javadocs to look up the Java foundation classes. In a sense, we are going to learn how to look up any package or any class offered by the Java API, particularly the Java SE 7 API. We're going to get into declaring a method with arguments and return values. Of course, these methods, which by the way, it may be former languages that you folks learned, like C language and other the languages, maybe you called it functions. Sometimes we call them operations, but in Java, we have tendency to call them methods. Of course, these methods can take parameters and return values, and we going to learn how to actually put all of that in the Java syntax.

We also are going to make use of a very, very nice feature in the Java technology, and that's the concept of inheritance. Inheritance is very, very useful because it allows us to re-use the code again and again and be efficient in the way we write code. So we look at inheritance to declare and define a subclass for an existing superclass. We will also look at how we can handle errors in Java programs. Again, errors are quite important, and we'll see how the Java technology helps us handle those errors in a very, very friendly way. We'll get to that.

And of course, we finish by creating this application that we work with. And of course, once its all created, we should be able to deploy the application using our NetBeans IDE, the Oracle NetBeans IDE. So in general, this is just a rough time kind of schedule on what's going to happen, but of course, it all depends on how much questions you folks have and so forth. So in general, in day number one, we'll go through the introduction, then we get into the Java technology, and then thinking in objects, of course, finishing by introducing the Java language.

The second day, we look at declaring, initializing, and using variables. We also get into working with objects, and of course, we'll use the operators and decision constructs in the Lesson Seven. That would be day number two.

In day number three, continue with number seven by looking at the practice labs, of course, which is related to using operators and decision constructs. And then after that, we get into the concept of creating and using arrays, and of course, we get into lesson nine. That would be on day number three. We finish it by using the loop constructs in Java.

In day number four, we will look at working with methods and method overloading. Quite interesting topic, quite interesting concept in Java. We'll go ahead and learn about that. We'll also learn about encapsulation and constructors, which is, by the way, quite important in Java.

When we get there, we'll understand why do we need the encapsulation. And of course, how do we now make use of constructors in Java? Then we finish the day, which is day number four, by introduce some advanced object-oriented concepts in Java. We finish the course, which would be on day number five, by looking at handling errors and, of course, deploying and maintaining this nice application called the Duke's Choice application. We'll get to see it through all the different lessons in this particular course.

Everybody is following, folks? Good. Continuing with that, so again, this is just part of the facilities and all that. Again, the concept of names and all that, I already had a talk with you guys. So welcome everybody, and let's go ahead and look at the course environment.

In terms of the course environment, here's what we have, folks. We have the JDK, which is already installed, which is the Java SE 7, including the JRE 7 installed on your lab machines, so that, of course, is already done. We also have a browser, which is the Firefox, and reason why we use a browser in this particular course is so that we could look the Java documentation API. We also installed the NetBeans, and NetBeans is a very, very friendly, powerful IDE that is going to help you develop Java applications. When we get to that, I'll explain that concept.

We also have the Glassfish server, and the Glassfish server is an Oracle application server, and it's open source. Typically, it is the reference implementation for the spec, and right now, it is up to spec Java AE 6. Remember, folks, that right now, what we're learning in this course is the Java SE, standard addition, but the Java AE makes use of the Java SE. I'll just give you a tour on that, and of course, show you what is it that you guys need to look at when you're working with an application server.

Of course, many of you are learning this course so that he can get into the Java IE technology, and we have a bunch of good courses, and I will talk about them towards the end of the week. We also have the student guide, and there will be an extra student guide on your lab machine in addition to the eKit that you folks going, or you already, downloaded. We have an activity guide and practice files. Again, these are resources to use doing the practice portion of the course.

And of course, we have the Java API documentation and the Java language specification, which by the way, is already downloaded and installed on the system. You will take a look at it, just at some point in time. We will look at it just to have an idea how to look up classes in Java. These are classes that already provided to us by the Java API.

So in summary, what we have done here is we pretty much introduced to you the course, and hopefully, you are going to enjoy this Java SE 7 fundamentals, and yes, you are. You going to have a good time, and just watch it, folks. I'm going to quiz you. I'm just kidding. OK, continuing with that, let's go ahead, now, and look at introducing the Java technology.

In this lesson, we are going to describe the key features of the Java technology. We're going to describe and identify features of object-oriented programming, and we're going to discuss the difference between compiled and interpreted language. And we're going to also describe how to download and install the Java platform, and described how to run a Java application by using a command line.

We start, by the way, folks with the command line, and then after that, we'll move to the IDE. Why do we do that? So that will give you an opportunity to do everything by hand. As you know, IDEs have tendency to do a lot of things for us, so we want you to use an editor and write everything from scratch. And then after that, you will get to, again, work with an IDE, and of course, identify the different Java technologies.

So continue with that and now looking at the objectives. Again, continuing with the objects. We're going to relate Java with other languages. We're going to discuss the different IDEs that support the Java language, describe how to download and install an IDE, and describe every phase off the product life cycle.

So let's go, now, and start by looking at the key features of the Java and object-oriented programming, which is, by the way, as you know, we typically always say that Java is an object-oriented programming language, pure object-oriented programming language. Well, to put things in perspective, Java is single most widely-used development language in the world today, as you know. So some of the statistics that we give you here-- there are over 9 million developers saying they spend at least some of their time developing in Java according, of course, to the recent events data study. And of course, that's out of the world population of about 14 million developers. Well, that's definitely a huge number, as you know.

In terms of the looking at Java within the context of the desktop, there are about 1.1 billion desktops run Java, so there's, again, according to Nielsen online Gartner in 2010. There are also about 930 million JRE download a year. And of course, the JRE, which is the Java Runtime Environment, is used by the end users. And there are about 9.5 million JDK downloads a year, and of course the JDK stands for the Java Development Kit, which is used by all the Java developers. In fact, you folks are going to use in this particular course and in the next courses that you'll be taking in the future because, obviously, since you got into this course, then you folks are getting into learning Java to use it for your development and your careers.

And again Java is also used in the mobile phones. Again, on most smartphones run Java. Java, now, is included in the TV and card.

Right now, for example, we have the Java TV and the Java card technology, which is, again, used widely. There's about 100% of the Blu-ray players run Java. 71.2 million people connect to the web and Java-powered devices, and that's according to InStat 2010. And there are about 1.4 billion Java cards that are manufactured every year, and that's, again, according to the InStat in 2010.

Now, a little bit of story about Java. Well, Java is a programming language originated in about 1991, and it was part of a research project to develop programming language that would bridge the communication gap between many consumer devices, such as videocassette recorder, VCR, televisions, and so forth. A team of highly skilled software developers at Sun, which by the way, now, became Oracle, and that was called the Green Team, under the leadership of James Gosling, wanted to create this programming language that enabled consumer devices with different central processing units, CPUs, to share the same software enhancements. Again, the initial concept failed after several deals with the consumer device companies weren't successful.

Then after that, what the Green Team has done-- they pretty much were forced to find another market for the Java programming language, and that's where the beginning. It was just the introduction to the World Wide Web Consortium, and if you folks remember, there were, at the beginning, different type of technologies that were used, at that time, for the World Wide Web, and that's how it took off. After that, we got into the concept of creating applets that are run on the browser, and then after that, we created more web components, which are the servlets, and so forth. Just to note here, did you know the character in the slide, in Duke's Java mascot. Again, the original Duke was created by the Green Team graphic artist Joe Palrang.

Now, looking at the key concept of the Java programming language, folks, it is object-oriented, so we work with objects, and in fact, we're going to always, now, think objects. For those of us who have actually worked with the structure programming language, like a C language and Cobalt and other languages, obviously, that way of thinking, we should change it. We should think object, and that's what we're going to do the whole week. Just making sure that we understand this concept of object-oriented.

It is distributed. Distributed, in a sense that Java allows two applications talk to each other through the network, and we have a technology that was created at that time, which is called RMI. Anybody heard of RMI? Remote method invocation, and that's the one that allowed Java components interact with each other through the network. It is quite simple.

And the nice thing about Java is also multi-threaded, that's by nature. Multi-threading nature of Java made it really, really ahead of many, many languages in the market, and that's why Java won in the market. That's why millions and millions now use Java language. It's also secure, and is platform independent. Speaking of platform independent, let me just go ahead, now, on the board and put in a diagram just to show you what is typically known as the layer pattern in the Java AE technology, and you will get to actually look at this layer pattern when you get into Java EE technology, learning about enterprise applications.

So in general, folks, whenever we work with software, we always have to make sure that we have a hardware platform, a hardware machine, and I call it a hardware platform, HP, hardware platform. Of course, to be able to run or use this hardware, we need a piece of software that runs the hardware, which is typically called what? What is-- Somebody just mention it? OS system. The OS system.

And of course, if you want to work with the OS, and obviously, example of operating systems, the Oracle Solaris 11, the Oracle Linux, Microsoft Windows OS, the Mac OS, and so forth. And of course, to be able to work with Java, what we need to do in this case, folks, is download a JVM and install it. Again, that's the JVM, which is the Java SDK that we installed here, 7. So these two together, the OS and the JVM, you need to install the JVM for a particular OS. Now, you need to download the one for Linux if you have a Linux OS, download the one from Windows if you have the Windows OS, download the one for Solaris if you have Solaris OS and so forth.

So these two together to, they call the lower platform. Let me just write it down in blue. It's called the lower platform. This is the hardware platform. This is called the lower platform, P for platform.

And then of course, in our case here, we are going to work with Java applications, but in general, let me just give you this for completeness, and then I'll explain to you that this, you will learn later on when you get into the Java AE technology. In general, once you install the JVM, you need, now, to install an application server, an app server. An example of an app server is the Oracle WebLogic app server, Oracle Glassfish app server, maybe the IBM WebSphere app server or the JBoss app server, and so forth. Or maybe you can install just a Apache web server instead of an application server. An application server has the web tier and the EJB tier, or the EJB container.

And this app server, here, is actually called the upper platform. Let me use the blue to write it down. It's called the upper platform.

Of course, every application server comes with its spec. The specification and the APIs and the frameworks, all of these are actually put on a layer by itself, which is, by the way, attached to the upper layer. I'm going to put that in orange. And that's, of course, where you have all the APIs, specs, and of course, frameworks. We going to see some frameworks when we use NetBeans.

All of this is called the virtual platform, P for platform. Why virtual? Because it changes.

Now, currently, we are a Java EE 6, which by the way, Java AE 7 is on the works. Should be out. It has, for example, the Java SE 7, plus you have the 3.0, JSF 2.0, and a bunch other ones, EJB 3.1 and so forth.

I'm going to represent this in brown, like beans, for example. On the top of that, you have your applications. This is what you are going to build, either pure Java classes-- which by the way, lots of times, we call them Java beans, or POJOs, plain old Java objects, or it could be also EJBs, enterprise Java beans, could be servlets, could be JSPs, could be JFs. You learn about all this technology in future courses that we offer.

So that's called the application platform. Application platform. Of course, in our particular course here, the Java SE fundamentals, we don't use these applications servers. We write pure Java code, and we run it directly on what? On the JVM. Right? But in the future, when you get into the Java technology, you would see these two layers. Right?

Let's continue, now, with the course, continue with the lecture. So again, this is the concept of procedural language, where in this case, the procedure programming language focuses on sequence. Step one, then step two, then step three, then so forth. So the Java programming language, on the other hand, folks, it's an object-oriented programming language because one of the main goals of the Java technology programmer is to create objects. Again, these are autonomous objects, or pieces of code, that typically do things for other objects or for themselves.

And by the way, this concept of object-oriented started with a similar, in about 1967, and then after that, we got through different type of steps. And at some point in time, we actually created the C++, which by the way, was coming from the C language to be able to convert the C language into an object-oriented programming language. And it did its job, but of course, it has a lot of disadvantages.

And throughout the course, whenever I talk about some of the concepts, I'll also mention-- How many of you have done C++? OK. I'll just mention what are the drawbacks of the C+ language compared to the Java language.

So we, now, make use of object-oriented concepts, folks, and let's go ahead and look, pretty much, at what it is. So what is the difference again? Object-oriented programming differs from the procedural programming because procedural programming typically stresses the sequence of coding steps required to solve a problem. On the other hand, object-oriented programming stresses for the creation and interaction of objects. So now, through object-oriented programming, we achieve modularity where the source code of an object can be written, and maintained, independently of the source for other objects, and of course, after it is created, an object can be easily passed around inside the system.

We also have the information hiding. Again in this case, by interacting only with an object's method, the details of its internal implementation remained hidden from the outside world, and when we get there, we'll talk about this concept of hiding, which by the way, we call it encapsulation. We'll get to that. We also have the code reuse. If an object already exists, then pretty much, you can use that object in your program, and this allows these developers to implement test and develop complex task specific objects, which you can then trust to run in your own code.

And of course, it has that plug ability and debugging ease, so in particular objects is found to be a little bit of a headache, if you can remove it from the application and plug it into other object as its replacement. So this is kind of similar to the concept of fixing a mechanic kind of problem, so you can always, if you have a headache with an object, you can always say, OK, this object is not good. Let me go ahead and take it out and put in a better object that actually works nicely.

It's like when you look at a mechanical problem, like in a car, for example, suddenly it's not starting. Most probably, it's the starter, it's a bad starter or alternator or whatever. We can take it out and put a new one, and boom, it's up and running. So that's what we want to do, folks. We went to mimic the concept of mechanical devices, or electrical devices, and so forth. So remember, we actually decided to treat Java, which is part of software engineering, as an engineering product.

So we put it in the same basket as civil engineering and mechanical engineering and electrical engineering. And the difference between the software engineering and the rest of these engineering fields, like civil engineering or mechanical engineering or electrical engineering, is that when you build an object, you can touch it. You can actually touch it, but on the other hand, software is intangible. It does something for you, but you cannot touch it. You cannot actually touch that object, so we need to remember that.

But the concept is the same, folks. We need to build objects and work with objects, and these objects interact with each other. For example, here, I have a main object, which interacts with this objects, that could interact with this object. Then I have this object, which interacts with this object, which by the way, this object will end up interacting with this object, and so forth.

And we said that Java programming language is a distributed language because the language provides support for distributed network technology. The API that helps us to do that is called remote method invocation. And of course, it was created right after the CORBA language. And let me go ahead, again, and put in a diagram next to that one on the board, so that I can tell you a little bit of history about what happened throughout the years.

So when TCP/IP got created, everybody was quite happy. Why? Because we can actually make two systems talk to each other and exchange data with each other, so everybody was quite happy with that. I don't know, how many of you have actually programmed some TCP/IP application using a C language? Anybody did that? So it's a little bit hard to work with.

And of course, at some point in time, we wanted to create a protocol that allow us to program application in any language we want, but still these applications can talk to each other through the TCP/IP protocol, and that, actually, was the concept of CORBA. And of course, in 1995, when Java became a mature, and then we started working with Java, that's what we said, OK, let's go ahead and create a-- By the way, the typical protocol for CORBA is IIOP, which stands for internet inter-op protocol. course, Java got created, create--

So when Java got into the picture, we wanted to create an equivalent type of protocol that allows Java components to talk to each other through the network, and that's where we created, now, the concept of RMI. And that's how we achieved that. And so that's pretty much why we say that Java is a distributed programming language.

Let's go ahead and continue with the lesson. So again we should know that the terms, Java technology and Java programming language, do not refer to the same thing. Java technology refers to the family of the Java technology products. On the other hand, the programming language is only one part of it.

And we said, folks, that Java is simple. The Java programming language is simple because the designers removed some of the complex and difficult type of programming constructs found in other languages, like for example, C language and C++. For example, the Java programming language does not allow programmers to directly manipulate pointers to memory locations. Again, instead the Java programming language allows programmers to only money manipulate objects using object references, and that's a huge plus.

In addition, if you work with a Boolean primitive variable, Java actually has the values of the Boolean as a true and false, the two strings true and false. On the other hand, other languages use zero and one. So in general, references are used instead of memory pointers, and that's a huge plus because, if you make use of memory pointers like in C and C++, if you want to work with object, particularly in C++, you need to allocate memory. Remember that? You need to allocate memory for that.

Once you finished with the object, before leaving you need to also do what? De-allocate the memory yourself. Otherwise, you're going to have a problem of what? Memory leaks. So Java actually has this nice garbage collector underneath that does all of that for you.

Again, the Boolean data type can have, now, a value of either true or false. And memory management, by the way, is done automatically through the garbage collector. And we also said Java is a multi-threaded type of language. It supports multi-threading, so it allows more than one task to happen at the same time. We gave you as an example, here on the slide, how for example, accessing a database and printing something and maybe creating some graphical user interface, all of that can actually happen at the same time, every one of them handled by a thread.

And we also said that the Java programs are secure because, pretty much, the Java programming language with the environment in which the Java technology program runs, uses security measures to protect your programs from attacks. Again, these typically include prohibiting distributed programs, such as applets, from reading or writing to the hard drive, or for computer, usually an applet always runs on the browser of your system and that's it. That's the concept of sandbox. Everybody heard if the concept of sandbox? That's what we have over there.

Also at some of the measures is very fine that all the Java programming language contains valid code. That's done through the byte code verifier. And of course, it can support digital signature if you want, and that's, of course, a Java technology code can be signed by a company or a person in a way that another person receiving the code can verify the legitimacy of the code, of course, prohibiting the manipulation of memory by using pointers. So all of these, of course, in this case, are advantages that Java has, and it made the Java code quite secure.

In terms of the platform and dependency, and I showed you the diagram earlier on the board, usually, we say Java is platform independent. And unfortunately, a language like C code is platform dependent. So in general, when you write a C language, and you want to run it on a Solaris platform or Linux platform or the Microsoft platform, what you need to do is you need to compile that into the binary code of the Solaris OS, or binary code under the Linux OS, or the binary code under the Microsoft.

And of course, the reason why we say a C language, for example, is platform dependent, is once you create your binary code, then when you need to do, now, is you link it to the OS that you're working with. So in this case, it would be either a Solaris linker, or a Linux linker, or a Windows Microsoft linker. And of course, what the linker does, it will go ahead and create for you, either a Solaris OS executable, or a Linux executable, or a Microsoft Windows executable. Everybody's following, folks? OK, good.

And of course, after that, once you have your Solaris executable, then you can run this only on what? On the Solaris workstation. The same thing if you have Linux executable, you can run it only on a Linux workstation. And if you have it in a Microsoft executable, of course, in that case, you can run it only on a Microsoft Windows station.

Well, folks, something that we do not have in Java, as you see illustrated on the diagram here on this slide, is that a Java technology program can run on several different CPUs and operating systems, like Solaris OS, and on a [INAUDIBLE] or Mac OS, on the Intel chip for Microsoft, on an Intel chip, and so forth. So in Java, what it does, it has this compiler, so the Java programs are compiled automatically if you compile them by the Java compiler. And usually when they're compiled, they're actually the result of the compilation will create file for you that are .class files. So these are, again, what we call bytecode instead of the CPU specific machine.

And of course, after the bytecode is created, it is now interpreted, or executed, by the bytecode interpreter, which is typically called the virtual machine. So the virtual machine is platform-specific program that understand the platform independent bytecode and executes that on a particular platform. That could be a Solaris platform or a Windows platform on a Linux platform and so forth. So for this reason, we say that the Java programming language is often referred to as an interpreted language, and of course, the Java technology programs are said to be portable, or executable on any platform. So for example, now, once you have your bytecode, then on that time, you can go ahead now and pretty much run it on either a Solaris workstation or a Linux workstation or the Windows workstation.

Of course, we should also mention that the Java technology programs needs more than just a Java virtual machine to execute. Again, a Java technology program also needs a set of standard Java class libraries for the platform. Java class libraries are libraries that pre-written code that can be combined with your core that you write on your application. Combined, the JVM software and Java class libraries are referred to, always, as the Java Runtime Environment.

Of course, the Java Runtime Environment are available from the Oracle and many common platforms. We should also note that some modifications might be required to make a Java programming platform. For example, a directory names might need to be altered so that they use the appropriate delimiters and so forth, for the underlying OS system.

Everybody is following, folks? Everybody's with me? Good.

So now, just for completeness, we have a small quiz, and this small quiz says "The Java programming language is said to be platform independent because" of what? We give you A, B, C, and D. Of course, if you take a look carefully, you see that A says "Compiled code runs on multiple platforms with few or no modifications," and of course, that would be the answer. OK? Good.

## 2. Introducing the Java Technology, Part 2 - 19m

Now looking at the next topic within this lesson, and that's describing the Java technology and development environment. Well, just to let you know, folks, Oracle provides a complete line of Java technology products, ranking from kits that create Java technology programs to emulation testing environments for consumer devices such as cellular phones.

Of course, as you see on this particular slide, you will see that we have the Java language that can be used for the Java Standard Edition that you folks are learning. You also can apply Java in the Micro Edition, and that's for what? For wireless devices and so forth.

And you can use it also for Java Cards. And in addition, it has, in fact, for the Java Card, just to give you an idea-- I need, just forgive me, one minute. Let me just grab a--

So here's an example where in my case, this is my former Sun ID that actually has a here, the Java Card. Actually, this is programmed, where I can, for example, go anywhere and slide it into the Sun Ray, my environment will just come up directly. This is what they mean by that. Lots of companies, by the way, use this. And there are millions and millions of these Java Cards that are created every year.

Continuing with that, we also have the Java EE. And at some point in time you will get into the Java EE technology, which is the Java Enterprise Edition technology. This is for building enterprise applications. And as you see, you also can make use of it, of course, with the help of the Java SE. And that's for servers.

You also can use a JavaFX API, which is a rich type of client, creates a rich type of clients, or used on a rich client for creating user interfaces for your Java programs. You also have the Java TV also, which is all technology related to the TV type of technology. And of course, the BD-J. And also the MSA, for mobile technology.

So as you see, there are lots and lots of products that, of course, ship with Java, from servers to desktops to embedded chips-- as you know, we also can use Java to program embedded chips-- to the TV technology to mobile technology to Card technology and so forth. Everybody's following, folks?

Of course, the one that we are focusing in this particular course is the Java SE, Standard Edition. This is used to develop applets and run within a web browser or application that runs on the desktop. In this particular course here, folks, we are going to use the Java SE to be an application that runs on your desktop computers.

We also said that the Java EE technology is used to create a large enterprise server side and client side distributed applications. At some point in time, once you learn about the Java SE technology and you become fluent in Java, then at that time we get to the next level, which is the Java EE. As you know, the Java EE is really the one that makes money. And I bet you that many of you do actually have enterprise applications that you work on in your respective departments or companies.

The Java ME is used to create applications for resource-constrained consumer devices. These are typically used for smartphones and Blu-ray-type disks and so forth. The Java Card is also typically used for to specify identity, like the one I showed you. This is one of them. Security transactions, mobile phones, SIMs and so forth.

Now the question is, how are we going to set up the Java environment, development environment, on our desktop? It is actually quite easy to set up the Java development environment. All what you need to do, ladies and gentleman, is download and install the Java Development Kit, the JDK, from the oracle.com/java website. Set up your PATH to the installed JDK. And compile and run your Java applications using the command line.

Again, to download the SDK, go to the oracle.com/java. Select the Java platform Standard Edition link that you want to download. Again, download the version of your platform, could be Windows version or Linux version or Solaris 11 version and so forth. Follow the installation instructions.

Set up your Java PATH. Compile and run your sample of Java applications. We will get to actually use this. We say that, there's a note, the practice activities for this lesson show you how to complete steps 5 and 6.

Examining the installed Java Development Kit. Well, when you download and install the Java SE Development Kit, typically you have all of these items installed, the Java runtime environment, the JVM for the platform you choose, the Java class libraries for platform you choose, the Java technology compiler, of course, a bunch of additional utilities, like utilities for creating a jar file-- How many of you have actually used jar files before? They are like ZIP files-- and for debugging the Java technology program. You get to actually play with this.

And of course, examples of the Java programs. By the way, when you open a terminal, you can actually write java-version, and you can find out about the version of your Java SDK that you installed.

Now we'll start by running applications from a terminal, folks. It's just because we want you to use an editor so that you can write everything from scratch. But at some point in time, you will migrate to using IDEs. IDEs are quite important and useful for developers, because they do help you build applications quite easily and, of course, fast.

The one that you folks are going to work with is this integrated development environment called the Oracle NetBeans. It is a tool that can assist you with your application development. There are several available ones. The one that we use here is the NetBeans IDE.

We also have JDeveloper. How many of you have used JDeveloper from Oracle? Or Eclipse from IBM and so forth. The features include full integration, easy development, smart editor, easy project development, and built-in source code control, CSVs.

So in terms of where to download the Oracle NetBeans IDE, it is available, by the way folks, free from netbeans.org. Sets the application Java properties automatically. And of course, there are several available bundles. You can go ahead and pick and choose whatever you want.

In general, people have the tendency to download the one to the right because it has everything from, in this case, the NetBeans SDK platform, SDK, Java SE, Java EE, ME, Java Card, C/C++, Groovy, PHP, and of course the servers, which are the Oracle GlassFish application server 3.1, which is the latest one, and/or the Apache Tomcat 7.0.11.

In terms of how to work with NetBeans, you will get a chance to actually play with this. So in general, you go ahead and create your project. Once you've created, after you tell the NetBeans to create the new project and give it a name, then of course at that time NetBeans will create a source tree with an optional skeleton class inside.

It creates a folder for unit tests. It sets the classpath for compiling, running, and testing; sets the Java platform on which the project runs; and creates an Ant build script, build.xml, which contains instructions that the IDE uses when you perform commands on your projects, such as compile or run.

And by the way, just out of curiosity, just to show you this, I'm going to go ahead and start my NetBeans here. So while it's being started, let me just go ahead and continue with the lecture.

And here we have a quiz. This quiz says, the Java technology product group that is designed for developing applications for consumer devices is what? The Java ME. And that's D.

So looking at NetBeans, it looks like it's up and running. So when it starts, I just close this guy here, the start page. And now as you see, I have the Projects tab. That's where I'm going to create my projects. The Files is when you create, if you want to see the file version of your project.

And Services has a bunch of services. You can actually set up the database. You also can go ahead and make use of the application server. And you can go ahead and start this application and so forth. We'll get to see that later on.

But what I'm trying to show you here is I can go ahead and create a new project. And because I'm using Java, I'll go ahead and create Java application, click Next, and then I'm going to call it MyJavaApplication, in this case. And then I'll go ahead and, of course, specify the project location. It says NetBeans, or I can choose wherever I want to put my project. That's the folder.

And what else? I create this. It has a main method. We're going to need the main method. We'll see that later on. And set it as the main project.

If I click here, what's going to happen is NetBeans will go ahead and create the whole-- goes through the whole different steps that we showed you here-- oops-- that we showed you here. All these steps that you see here. All of these are created for us automatically by NetBeans.

And the proof, you see them here. Here is, in this case, the template that it created for you for your class called MyJavaApplication. And that's why at the beginning we didn't want to use the NetBeans IDE. We wanted to use the command line to run your Java class so that you folks can actually use an editor and, of course, create your class from scratch.

And of course, as you see here, we've got everything. Here is the library. If you go to the Programs tab and you open it, you have the NetBeans project. You see the build.xml, the end script that is created for you and so forth. Everybody's following, folks? So we'll get to actually play with this later on.

Now looking at describing the product life cycle. That will be the last topic of this lesson. Well, folks, the product life cycle, or sometimes called PLC stages, are analysis, design, development, testing, implementation, maintenance, and of course, and end-of-life cycle.

So looking at these steps, in general, the product life cycle usually is an interactive process used to develop your new products by solving problems. The first thing you start with is the analysis. And that would be step number one. So what do we do in analysis?

That's where you investigate the problem. And you want to solve this with your product. And of course, among all the tasks in the analysis is clearly defining your problem domain that you want to solve, look at the market niche. Is it worth it to build this product? And is it going to make money for me?

And then identify the key subcomponents of the overall big system. You should know that a good analysis of the problem leads to a good design of your solution and to decreased, in this case, development and testing time.

After that, we get into the design. That's the process of applying your findings to be able to go through the design level and pretty much allow you to design your product. Then after that, the development. That's where you create your blueprint by coding your design, by, in this case, creating your actual component.

After that, you have the testing. That's step 4. That's where you use the individual components, in this case, and ensure that all of them work in the product as a whole and meet all the requirements of your specifications that you described in the design stage. We should note that testing is usually performed by a team of folks other than the team who developed the product, of course. And that's for obvious reasons.

Then after that you have the implementation. That's step number 5. And that would be that we making the product available to the consumer. That's the release of the product. After that, on step number 6, which is maintenance, that's fixing the problems of the product, and re-releasing the product with a newer version and so forth.

And of course, the last step, which is number 7, it is the end-of-life cycle. It's called EOL. Although the PLC, which is pretty much the Product Life Cycle, does not have a separate stage for the start of a concept or project, it does have a stage for the end of the project.

The EOL, of the end-of-life, consists of carrying out all the necessary tasks to ensure that the consumers and employees are aware that the product is no longer be sold and supported, and that a new product now is available. That's pretty much the end. The end-of-life is when, for example, you retire one of the products and you get the new version. And of course, you release the new version. Everybody's following, folks?

So in summary, we looked at the key features of Java. We looked at the concept of the object oriented programming for Java. We looked at the difference between compiled and interpreted languages. The interpreted language is like Java. Compiled is like the C language, or C++.

We looked at how to download and install the Java platform Standard Edition. We looked at how to run a Java application by using the command line. And of course, we looked at using the javac in Java. And we'll take a look at that again in the next lesson. And we looked at identifying the different Java technologies.

We also in the end looked at the Java and related it to other languages. We looked at the concept of IDEs and how they support the Java language. And we looked at how we download and install an IDE like the Oracle NetBeans. And we looked, of course, at describing every phase of the product life cycle.

Of course, we have some practice labs here for this lesson too. And the first one will be running a Java program using the command line. The second one, running a Java program using NetBeans IDE. And if we want to look at the details of these, we can go ahead and get into-- Lesson 1 there is no practice, just the introduction of the course.

And now what we want to do, ladies and gentlemen, is we're going to get into these practices for Lesson 2. First, we make sure that the environment is already installed in terms of JDK and NetBeans, but that's already done in our lab environments. And of course, in Practice 1 of Lesson 2, we're going to run a Java program using the command line. You see we give you a snapshot on how to run these, in this case, using this run and then you write cmd here.

And then, of course, after that, you get the command and you can go ahead and do cd.. And of course, go all the way, in this case, to the-- or we can do directly by doing a cd and then D: backslash labs and then backslash what is that? les 02, I think. And that's it. Now of course, we can do a dir and we see everything over there.

All right. So you guys are going to do this Practice 1 for Lesson 2. And then you're going to get into Practice 2, which is running the program using the NetBeans IDE. So we show you step-by-step what you folks need to do to be able to create the program and run it.

## 3. Practices for Lesson 2 - 28m

Now what we want to do is take a look at practices for lesson 2. So the practices for this course assume that we already have installed the following software that you see on this slide-- the JDK 1.7, the Java API Specification, installed, of course, locally, the Java SE 7 Specification, installed locally, and of course the NetBeans Enterprise Edition, 7.0.1, which, by the way, includes the GlassFish server, Oracle GlassFish server. And of course the Tomcat server-- it's not used in this case. We use the GlassFish server only for this particular course.

Now let's look at practice 2.1. In this case, on this particular practice, what we're going to do is run a Java program using the command line. So of course, in this case, what they're asking us to do is first of all, open a terminal window, a DOS terminal window, and typically we do it through-- let me do it again-- by clicking on run, writing CMD, and now it's over.

So the first thing they want to tell us, in this case, from the Windows startup, we select Select Run, and then enter CMD. And in this case, you will have your a DOS terminal open. And they want us to navigate to folder D column backslash labs backslash lesson 02, or Les02. That stands for lesson 02.

Let's do that. So CD space D column backslash, and then labs, and then backslash, then lesson 02.

And then after that, they said, OK, let's go ahead now and check the contents of this particular directory. And the way we do it on a Windows system is DIR, and of course, I hate that. So that allows us to see that there is only one file here-- it's a Java class, of course, called calcaverage.java.

So continuing with that, and just so that we can see, step by step, what R, the next commands they're asking us, of course, in this case, to run. So first of all, they're telling us, confirm that the system path points to the correct folder location for the Java executable. Again, type path at the prompt.

Let's go ahead and do that. For that, we're going to open again the DOS terminal, and then write path and capital, and then hit Return. And that shows us that it's pointing also to the Java, as you see here, D column backslash program flies Java, and then JDK 1.7.0 backslash bin. And of course, and in the bin directory. That's where we see, as they said here, all the Java executables.

And if it's not there, then of course append this territory to the system path. Variable by entering, again, the following command. You can go ahead and write path space dash, and then percentage sign path, percentage sign semicolon, then D colon backslash program files backlash Java backslash JDK 1.7.0, and then backslash bin. But as you see, we already have that.

Now what they want us to do next is, let just move down a little bit so we can see, again, step by step, what they're trying to ask us to do. Now we are, of course, at [UNINTELLIGIBLE] question part D, 2D, where they're asking us to compile the Java class called calcaverage.java.

Let's go ahead and do that. By the way, in this case, they're asking us to compile this using a command line. So let's go ahead and do that. And pretty much what we want to do is use the Java C, which is Java compiler, and the name of the file.

So let's go ahead and do that. We'll write Java C space, Java C space, and then the name of the file. Calc average dot Java.

Let's go ahead and compile that. And as you see, took some time. And in just a few seconds, a second or two-- and now it came back with the prompt, back to us.

And now what we want to do is check if this file got compiled. And the way we are going to find out if it's compiled is we look, of course that we see an extra file, in this case, and this file will have the dot class extension. That's in addition to the existing file that we already have over there. That's showing us the calcaverage.java.

Let's go ahead and do a DIR to find out about that. And if we hit Return, as you see, we now have two files. So now we can see that there is the calcaverage.class and the calcaverage.java, which means our calcaverage.java class has been compiled by the compiler.

Continuing with that-- now what they're asking us to do is to pretty much run the Calc Average program by invoking the Java runtime executable. Again, we do not need to use the dot class extension for the class. Type java space then Calc Average, and press Enter, and that will go ahead, and gives us-- the program will prompt us to enter three integers. Let's go ahead and do that.

Let me go back to the DOS terminal, and now I'm going to go ahead and use Java, executor of space, and then Calc-- except that they do not want us to use the extension. Just the name of the file.

So let's go ahead and hit return. And that will prompt us exactly with the message that is part of the code, and we'll get to see that in the next practice, where we see that through the NetBeans ID.

So it says here, enter three integers separated only by spaces-- for example, 20, 30, and 50. Let's go ahead and use an example where, for example, I can enter 10, space, I can enter 40, space, and then I can enter, for example, another number. Could be, for example, let's assume in our case it would be 30. Or 40. Or another 40, for example, just out of curiosity.

And we hit return, and that, of course, gives us the average, we use 30. So it added a 10 to 40, and then to 40, which is 90 divided by 3. Of course averaging that would be 30.

And then you see here, as an example, they asked us to enter 246 and 88. We can always do that again, just out of curiosity. So we can always run the file on the class, and then enter exactly what they want us-- as you see here in the command, let's go ahead and enter, for example, 2, space 46, space 88, and then hit return, and that gives us the average-- it turns out that in this average, 88 is 45. So it's 2 plus 46 plus 88, and of course, in this case, the average is 45. So that pretty much sums up the first practice off lesson 2.

Let's go ahead now and get into a practice 2 of lesson 2, where in this case, they want us to run a Java program using NetBeans ID. So in this case, we are using the Oracle NetBeans ID 7.0.1, which by the way is already installed here in the lab environment. What we need to do is double-click on it and start it up, and in this case, it's already up, and following the steps as you see here, we'll go ahead and make use of the--

So first of all, they want us to create a project that includes the calc.java file in its source folder. Again, the way we do it is first of all, we'll go ahead and create a new project-- so let's go ahead and do that-- and then after that, they want us to create a new project wizard to choose, again, in this case, the project step, the categories Java, and the project would be the Java project with existing source. We want to use the existing source, and then next, and then after that, we'll go ahead and, in the new Project Wizard, name and location-- this would be practice 02-- and of course deselect the set [UNINTELLIGIBLE] project, checkbox. That's what we are going to do.

And by the way, I'll go ahead and do that. And then after that in the next step, they will say, OK, in the new Project Wizard, existing sources step, and that would be a Browse to Select the D colon backslash labs backslash lesson 0, and then click Finish, and then the prop window, in this case delete the existing classes would be in the folder, and the new project appears in the project Windows of the NetBeans.

And then after that they want us to select the New Project from the main NetBeans menu. Again, the new Project Wizard opens in the Choose Project [UNINTELLIGIBLE] step of the Wizard, select the Java from the Categories column, select a project with existing resource from the project, and click Next.

And they show us also snapshots of what we see from the Wizard. And as you see, the name and the location, and pretty much showing us a step-by-step, what is it that we are doing? So after we go ahead and name the project Practice 02, and then deselect the set as Main Project, and then after that, in the existing resources, navigate-- in this case, browse and Add by clicking Add Folder, navigate to D column backslash labs backslash 02, and add that folder. And once you add that folder, click Finish, and now, in the new Java project with existing resources, go ahead and click on the Delete button. And then after that, in this case, the content of the project are now displayed on NetBeans. Click the project tab again to see that particular project.

In this case, they want us to modify the properties of this project by going to the properties and setting up the source binary to JDK 7 and looking at the project window library category would be also Java 7, and click OK. And then select the project properties from the main menu, and alternatively right-click the project and select properties, and then select the sources in the category and set the source boundary to be JDK 7.

And we see it here in the Wizard And we should say that NetBeans allows you to specify the lowest Java platform version with which the generated code should be compatible. For example, if you have not changed this setting to JDK 7, you would have seen error messages when using any of the core language changes included in JDK 7. NetBeans would warn you that the court would be incompatible with the earlier question.

And again in this case, we'll go ahead and confirm that the Java platform setting for the practice 2 is 7, and select the libraries to set up that, to look at that. So we'll see all of this when I go through it. Again, they show you either here Wizards on how to do that. You can also go to the tools Java platform on the main menu. Again, this window shows all versions all of the JDK that have been properly installed on the machine. And you will see a window that looks like this.

Again after that, you'll go and review the file, and after that, run it. And I will go ahead and see how we are going to run that. But when we compile it, as you see here, we'll see a .class, calcaverage.class, that is created, and in this case, the build. And that's by clicking on the Files tab, we'll see that. And after that, they want us to run the file, and we go ahead and do that.

Let me go ahead now and go through the steps to do that. So they want us to create a new project, and then, as you see, Java, and then Existing Sources, and then next you'll go ahead and place your project-- name it, first of all, practice 02-- and it says, you cannot place a project in the folder that already contains a build folder. So in that case, we need to change that.

But the reason why it's telling me this is because I already created that. So let me create something like this, just so that I can show you the steps, and then I'll open the one that I created.

Next you are going to add where you navigate to the drive where the labs are-- in this case, it's the D drive-- and then from there, click on Labs, and from there, I highlight Lesson, and then I click Open, and I see the package already used in the project. It's already used in the project, and that's pretty much because I already have it. And then after that, you go ahead and click Finish.

So it turns out that I already have it. So let me go ahead and open that project. Here it is. And of course, as you see here, in this case, you turn out that it's already compiled.

So this is the code that we wrote, and I go through this code in a minute. But let me just go ahead and right-click on the project, and then go to Properties, and just show you what is it that they want us to, again, see in terms of making sure that NetBeans is using JDK7?

So in that case, as you see, when I click on Library, I see that the Java platform is JDK 1.7. That's good. And even in the sources, again, I see that it's here. It's JDK one 7, and not 6, and not 5, and so forth. And that allows me to make sure that, in this case, I checked, and I know that NetBeans is using JDK 7.

One more thing they want us to also check is when we go under the Tools menu and then we select the Java platforms. [UNINTELLIGIBLE] now that as you see here, we have all the-- we see it says that the user use the Java Dock tab to register the API documentation for your JDK in the IDE, [UNINTELLIGIBLE] add platform to [UNINTELLIGIBLE] Java SE, Java ME, and Java FX platform versions. [UNINTELLIGIBLE] here, we have the JDK 1.7 there. So we'll close that.

And now let's go ahead and do a tool just with NetBeans to get familiar with NetBeans. It turned out that here, we have three different tabs. The first one represents the project. So you see, Java-- every type of a project will have its own icon. It turned out that here, a Java application has the icon of the typical icon that we see for Java, which is that mug, that coffee mug that we always see.

And of course, the name of the project, and of course underneath, you would see your source, and then underneath here, you will see the libraries. It turned out that here, the libraries that we're adding is just the libraries of JDK 1.7. And other projects, for example, if there are Java EE projects, you might see other libraries that are required for either web application, or an EJB application. You will see that, of course, when you get into the Java EE courses, the Java Enterprise Edition courses.

You also can see the files all of this project on the Files tab. In the Files tab here, pretty much, we have the source package. That's the origin of 1. And that's your practice O2 project that you have. It's a folder, as you see. And there is a build folder. Underneath, you will see the classes folder, and then underneath, you will see your class. That's the one that exists over there, because we compile the calcaverage.class. Again, the way we compile it is usually go to your project, and then you can actually click on Build, or Clean and Build, or you can even right-click on this and then, of course, compile it [UNINTELLIGIBLE].

But as you see here, ladies and gentlemen, the Compile file is grayed out. Why? Because it's already compiled by NetBeans. In general, NetBeans is smart enough to actually, once you finish the program and you save it, it also does compile it for you automatically. By the way, you can compile by clicking on the F-9 key, too. That also allows you to compile your file.

Going back again to the Files tab, you will see that underneath got your libraries, and this would be only the JDK 1.7. Again, you see all the Jar files that are part-- the API is part of the JDK 1.7. And that pretty much shows us, in general, what we have under this project.

So again, under the file, so under the file tab, you would see that we now see under the build, there is the classes, and under the [UNINTELLIGIBLE] folder, and underneath, you have the calcaverage.class.

In addition, by the way, there is another folder called NB Project that [UNINTELLIGIBLE] project, and underneath, you will see that all of these are files created by NetBeans. You have the config properties, you have, again, in this case, this is a file. You can go ahead and open it, if you want. There is nothing right now, but you can edit it and put whatever you want over there. You will see that maybe in a future implementation your applications. It has the build implementation dot xms. You can open that and see-- that's the build, again, and you would see that one of-- it's kind of similar to the [? end ?] script.

Also, by the way, NetBeans also created the build.xml that you see here, which is quite similar to [? end ?] script. And this is just for this particular product. So this is under file tab. You pretty much can investigate and see all the different files that NetBeans creates for you when you create your projects.

And of course, under the service tab, we also have a bunch of services provided to us by NetBeans. For example, in this particular NetBeans version that we downloaded and installed on this machine, it turned out that it has a database. This database is called the Java DB, which, by the way, it is the Derby database. This is a very, very interesting and nice type of database that actually allows you to create a database in it, from it, and occupy those databases, and use those databases to test your program or your application.

You can also have drivers. In this case, we have all these drivers. The one that we are using is the one that is useful for Derby database, the Java DB embedded in the Java DB network. And you also have JDBC, ODBC bridge, you have MySQL, you have Oracle OCI, and so forth.

But here, for this particular course, we don't deal with the database. But you will get a chance to take courses that actually will involve accessing the database JDBC or JPA, and at that time, you will get to work with this database.

The other thing that I want to show you here, ladies and gentlemen-- here's a connection. Again, this connection is how you populate the database. You typically connect it first, and then as you see first what it does-- in general, by the way, we start the database first. It's already started. Here, when I try to connect, it automatically started the database.

Once it's done, then I can go ahead now and execute command. And when I execute command, that's when I'm going to open the file and execute it so to populate the database. In this case, I don't need it so I'm not going to keep it open.

And the other thing, also, is under here, it's all related to web services. Again, one of these days, when you learn about web services, you will get to use this service. The other one is the servers. It turned out that here, we have a GlassFish application server. You can actually right-click and start it from here, and you can view the admin console and so forth.

Here we have the [UNINTELLIGIBLE] builder, and we have the issue trackers. But of course, in this case, we're more interested by the GlassFish application server and the Java DB, which, by the way, you will get to use in future courses.

And now let me go back to my Project tab, and then try to investigate that file which is the class that we created. Again, this class is called Calc Average, and it has a main method, and inside, we create a new instance of the scanner. Scanner is one of the classes provided by the API, and in this case, we pass to its system.in. We're passing the input stream from the keyboard, and then after that we have a print [UNINTELLIGIBLE] that just prints an empty line, and then after that, it has a system, dot [UNINTELLIGIBLE] dot print LM-- this is the one that, pretty much, in this case, prints that message for you. If you remember, when we run the file, the Calc Average from the command line, we actually got this prompt. Enter three integers, separated only by spaces. Example, 20 space 30 space space 40.

And of course here, what we're doing is when we enter them, it turns out that this class scanner has a bunch of methods. And we'll get, by the way, to see the API later on, in lesson 5. We'll get a chance to actually investigate a little bit the Java API, and look at the existing classes that are part of the API, that would be useful to you when you develop applications, or when you develop Java applications.

So here we have the next integer, what it does. And we invoke it on the reference variable SC of type Scanner. What it does, is it actually grabs the first value that we entered, which is 20, if we enter 20, and save it into this variable of type integer called I1. We do the same thing for the second one, and we do the same thing for the third one.

And then after that-- you recognize this from your calculus, where we declare a variable called average. And we save in it the sum of I1 plus I2 plus I3 divided by 3. That's the average. After that, we'll go ahead and print a new line, and then we'll invoke the print [UNINTELLIGIBLE] again from the system.out, bypassing a string here called average space equal space, and then, in this case, we wanted the average to be printed. So it would be 20 plus 30 plus 40, and the average would be 30.

So in terms of how to run this file, what we do is we right-click this file then click Run. And then when we click Run here, we're provided with the prompt, which is enter three integers separated only by spaces. Let's go ahead and do that. So let's assume I enter 10, and then 40, and then 40, for example. And if I hit return, what's going to happen, is it's going to pretty much print for me. It's going to go through this, first of all, print a new line that you see here, an empty line, and then after that, prints exactly what I wanted it to print here.

And that pretty much summarizes what we wanted to do from for this particular practice. OK? So that's exactly what we've seen, similar to the output that we have seen in NetBeans, which is this one. They just took a snapshot-- let me go ahead and run it again, and then put in 10 space 40 space 40, for example, and then hit return. And you see that this is the snapshot they're showing you here on the book.

And that pretty much ends the practices for lesson 2. Thank you.
