## 01. Introduction to Java

* 01. Introduction to Java, Part 1 21m
* 02. Introduction to Java, Part 2 24m
* 03. Introduction to Java, Part 3 26m
* 04. Practice 1-1: Verify the JDK Installation 4m
* 05. Practice 1-2: Create, Compile, and Execute a Java Application 6m
* 06. Introduction to Java - Score 80% or higher to pass

## 01. Introduction to Java, Part 1 21m

Introduction to Java-- in this first lesson of the course, we're looking at the overall course goals and objectives, what we're going to learn throughout the training, and that would be object-oriented programming approach that Java presents us with, explain Java syntax coding conventions, use a variety of different Java constructs and operators, use core APIs, such as collections, streams, input/output concurrency, et cetera. And also, we look at how we could package and deploy Java SE applications. Before we talk about the details of the course itself, let's just very quickly highlight the target audience for which the course is intended. This would be anybody who has some non-Java programming experience, or maybe basic knowledge of Java, and you want to improve that. Also, this course is designed to be complete enough to give you grounds, the basis for the preparation, for the Java SE 11 certification exams.

Looking at the course structure, we can see that there are 15 main lessons within the course itself, starting from this introductory lesson, and then proceeding to learning things about Java primitive types, operators, and flow control statements. Then from there, we take it a notch further, and we'll look at more complex types, such as dates, text, time, numeric objects. Then we'll look at the ways in which we design our classes and objects, improve the class design, study inheritance interfaces, looking at arrays and loops, and Java collections API, a way which we can write nested classes, and how we can utilize lambda expressions. We'll look at Java streams API and ways in which we can handle exceptions and debug the program. And then finally, looking at the Java IO API input/output concurrency, multi-threaded APIs, and Java modules.

In addition to the main structured lessons, the course comes with several appendices. They are advanced, various advanced, topics, or topics that maybe are not associated with any specific exercise, and that's why they're an appendix rather than a normal lesson, or topics that may be outside of the scope of the actual certification exam. That's why they could be an appendices. Now, let me be a little bit more specific about it.

Appendices A, B, C, and D, Annotations, JDBC API, Security, and Generics are actually in the scope of certification exam. They simply just don't have specific exercises. Or like in the appendix, which is the Generics Appendix, that's a very advanced topic.

But when it comes to Appendix C, that is actually out of the scope of the certification exam. But what it does is that it shows us how we can think about the application, not just as a standalone Java application running in your client, but also the application that can be deployed to the cloud, and what that deployment entails-- how the cloud deployment is different from any other deployment situation. So that's Appendix E.

Well, in terms of the exercises for the course, as I say, all lessons come with exercises. And the exercises look at the way in which we explore our Java features that are covered in the lessons in more depth from a practical angle. There would be a lot of things that the lesson doesn't-- a lot of detail that a lesson might not necessarily go into, but the exercise does, so a practical angle. Or ways of exploring the code and just seeing how you can write a code this way, you can write the code another way-- what are the similarities and differences between these approaches. So having a hands-on experience in addition to some presentations is obviously quite useful.

Practices are done in the following tools. We use JShell, which is part of JDK, in our case, JDK 11, JShell command line tool, which allows you to experiment with Java code. It's not really writing like proper Java programs, but if you want to try out certain constructs, just see how they function, see how they work, do a bit of scripting, then JShell could be quite useful. And then the Integrated Development Environment, IDE, NetBeans 11, which is where we do most of our exercises.

NetBeans is an open source IDE currently under the ownership and development from Apache group. It's one of the Apache projects now. And it's an open source, a very basic IDE, but for the purposes of this course, that should do. In production, you may use more advanced IDEs, and there are plenty of them. You can choose from a variety of different IDEs. But what we're trying to do is keep this course as vanilla as possible without having to go into any proprietary integrated development environments, well, because we need to support a certification program that would be same for everybody regardless of which specific providers they work with.

Why the choice of JDK 11 for this course? Well, that's what we consider to be long-term support edition of Java. As of version 8 onwards, so after version 8 and later versions, so versions 9, 10, 11, 12, 13, 14, et cetera, all Java versions are released at a six-month release cycles. Every six months a new version of Java emerges, but not all of these versions are considered to be long-term support versions.

Actually, they contain many features that are consider to be experimental features, and they're around for like six months, and then the next version is released. And actually, many experimental features may be gone in the next version. They're not necessarily even present, but they're there to try things out and to see how the language can be evolved.

SE 11 specifically is a version that was chosen to be long-term support, to be a bit more stable than other versions. So its features are not going anywhere. And hence, it makes sense to get a deeper understanding of that. And obviously, that is a clear migration path.

For example, if your Java application is currently in the earlier version, like 8 or earlier, then the next logical step is to move it to 11. And after that, to the next long-term support version, which would probably be 17, but we'll see when that will be released.

So in terms of what we're going to study in the first lesson, we start straight ahead with learning some things about Java language, so why Java is the way it is. And to understand that better, we need to quickly look at some of the language origins, and use cases, how Java implements portability and provide neutrality features, explain some of the basic object-oriented concepts-- well, we need to start somewhere-- and look at the syntax coding conventions, and eventually, get ready to write our first basic Java program with main method compile and run it.

Let's take a closer look. So what is Java? It's a general purpose programming language. It's syntactically very similar to C or C++. It has a lot of features with these two languages in common.

Conceptually, actually quite different, but still, you can find obvious similarities. And if you previously learned any of C family languages, like C, C++, maybe C Sharp, or Objective C, then Java will be fairly straightforward and similar to what your previous experiences were. So it's the same big family of languages.

In fact, there is a very good reason the guys, who created Java language back in 1995 in Sun Microsystems, intended it to be syntactically similar to C as possible. So they wanted to that compatibility in terms of the syntax and the logic of the language in general. But then they changed it, and they introduced some other important concepts, which, obviously, we'll study throughout this course.

Java happens to be object-oriented language, but again, there's an interesting point about it. Object oriented is one of the ways in which Java can be used. If you closely look at the Java language, you'll find there are procedural capabilities, traditional structural programming features.

In modern versions of Java, with the introduction of lambda expressions, there's a huge chunk of the language which essentially is functional programming. So object-oriented is one of many styles of coding, which, obviously, Java supports. But then as we progress through the course, we'll find out that you could do other styles of programming in Java. It's not purely just object oriented.

So like I say, for example, lambda expressions and functional programming, which is, again, a big area of modern Java in the language, and it's quite useful. You'll find out later. It is also platform independent, meaning that you can run Java program, compile it, and without any further recompilation, run that program on a variety of different platforms.

In fact, that was the whole premise behind the Java design in the first place. Because it was originally intended, back in 1995, to be used as a program language for consumer electronics. And obviously, portability between different consumer electronic providers, well, that's a challenge, right? So they are not in any way happened to be hardware or software compatible, so you have to overcome that incompatibility, and that was the design goal of the Java language-- how to figure out that platform independence, that portability of compiled code, across platforms and providers.

Modern users of Java include Internet of Things, cloud computing, so all sorts of server side applications, consumer electronics as well actually, and so on-- different areas where the Java could be used. As I already mentioned, this course is based on Java SE, Standard Edition, Version 11, as a long-term support Java edition.

Now, we need to say a few words about what are the Java editions, so what flavors Java comes in. So Java SE, or Standard Edition, is the one on which any other editions of Java are based. So Java SE is like the core language itself.

So any other edition of Java will be built on top of Standard Edition, if you like. Now what are the other editions? There's an edition of Java use the smart cards.

Every sim card, every credit card, there's a chip that you have in a card-- well, that one-- actually runs Java applications that are written for these chips are written in Java. But obviously, it's a very minimalistic version of Java environment. You don't have much hardware capability there. This is a very basic device.

And yet, it can execute Java code. So for that basic environment, we use a special edition of Java called Java Card. Java ME, or Micro Edition, that's for various consumer electronic devices, like Internet of Things, or maybe, I don't know, things like smart tallies, or maybe mobile devices in some cases-- so these sort of platforms.

We've mentioned Standard Edition is the basis of everything else. Micro Profile-- well, Micro Profile is a service side edition of Java. You could think of Micro Profile as a subset of another edition, which is an Enterprise Edition, which is, well, not strictly speaking what Micro Profile definition is, but you'll find a lot of similarities between Enterprise Edition and Micro Profile Edition. A lot of technologies are actually the same.

But what Micro Profile is designed to do is to give you enough features to run server side Java code and host microservice applications. So it's for micro services. And Enterprise Edition is a kind of a full-blown, big enterprise-level environment hosting server side job applications.

So that's not just for micro services, although it could be used for that purpose as well. But I guess it's for any other server side Java deployment where you require a more complex server side to support complex business processes. So that's Enterprise Edition.

So that's a bit of what Java is all about. Now, how Java actually works. So we mentioned that Java is portable across different platforms. But how it actually physically functions?

Well, first, we wrote Java source code, and that's just plain text. And frankly, you can use any text editor you like. Of course, you'll probably use some kind of automation and form of Java IDE, Integrated Development Environment, but the basic source code is just plain text file.

And you create these Java sources. They must be saved in files with extension .java. That's actually a requirement. You have to save them in files that have extension, .java.

Now, otherwise they're just plain text. And you type the source code of the program. Then you compile that source code.

The compiler, javac, or Java C, is a tool that comes with the Java Development Kit with your development environment which allows you to compile your Java program. So you tell it which source code you want it to compile. As a result of the compilation, javac tool, Java C tool, create a class file. A class file is an actual binary code formed from your source code based on the source code.

However, that binary code contains instructions that are actually different from your usual kind of executable is that you have for your operating system. And the differences that, say, for example, you're compiling a C program. You also end up with byte codes, and these are the byte codes that can be executed on a specific platform for which the C program has been compiled. So they are for a particular computer.

Now, Java byte codes are not for a specific platform. They're not for a given computer type. They're for a fictional computer called Virtual Machine. So Java Virtual Machine provides an environment which basically takes the byte codes that are of a fictional machine, basically a virtual machine, and translates these byte codes on the fly to a specific machine where that Java program should run to the way in which the binary code is executed on a given platform, which is different for different platforms.

So the job of Java Virtual Machine is to provide this environment which allows the same compiled code to be translated differently to whichever current target platform you want to run that code on, and therefore, make Java program portable across all these different platforms. So the exact same shape of Java byte codes will be translated differently to the current platform codes, depending on which platform you run and the program. And that translation is what the Java Virtual Machine would do.

To launch Java Virtual Machine, you simply use a program called Java that launches the JVM, and you tell it which particular Java program you would like to run. And it will start interpreting these byte codes as appropriate for whichever target platform the program is hosted on. Now, there is something very profound about this virtual machine invention, which probably explains why Java became so popular. So that's a brief moment of history on the subject.

Originally, the idea of Java Virtual Machine was just that. You take the byte codes of an abstract machine and translate it to whatever current platform. But there's something else Java Virtual Machine does. It organizes the entire memory management of the program, the entire environment which hosts your code.

And I suppose the great invention about Java was the idea of taking that Java Virtual Machine and not just running it as a standalone program on your computer, but actually embedding it into other programs. The first example of that was Java embedded into the browser. That was done by the Netscape first, and then that started opening up this idea of embedding Java into another piece of software.

So you have Java now in various devices, and you've got it in databases-- everywhere pretty much. And that is possible because of the way Java Virtual Machine isolates your code from the environment and environment from the code. It would not be safe to just take any program and run it inside another program, because of the obvious repercussions to the memory, potential memory corruption, potential conflicts. But if the program is well-isolated from its environment, which is precisely what Java Virtual Machine will do, then it becomes a supportable solution.

And that explains why so many different companies took Java on board, because it allowed them to create an environment where it takes programs written by third party programmers, third party software, and embeds it inside their own software in a way that's safe and supportable. And that is a really unique proposition of Java. It's not just the fact that you could put it on a platform.

It's also the fact that you can put your program into an environment which is of another provider and it will be hosted within that environment. So that's a unique Java proposition here. So portability, not just across platforms, but I'd say probably across providers as well, which is an important facet.

## 02. Introduction to Java, Part 2 24m
## 03. Introduction to Java, Part 3 26m
## 04. Practice 1-1: Verify the JDK Installation 4m
## 05. Practice 1-2: Create, Compile, and Execute a Java Application 6m
## 06. Introduction to Java - Score 80% or higher to pass
