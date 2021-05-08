# 1: Introduction

1. Introduction - 17m
2. Practices for Lesson 1 - 5m

## 1. Introduction - 17m

So let's go ahead and start talking about this course, which is the Java SE 7 Programming. And we'll start by looking at the Module number 1, which is the introduction to this course.

So the course goals is that this course covers the core APIs that you use to design object-oriented applications with Java. This course also covers writing database programs with JDBC.

We also use this course to further develop our skills with the Java language and prepare for the Oracle Certified Professional Java SE 7 Programmer Exam.

In terms of the course objectives, after the completion of this particular course, we should be able to create Java technology applications that leverage the object-oriented features of the Java language, such as encapsulation, inheritance, and polymorphism.

Being able to execute a Java application from the command line. Being able to create applications that use the Collections framework. And, of course, being able to do implement error-handling techniques using exception handling. And being able to implement input and output functionality or the I/O to read from and write to data and text files. And understand, of course, the advanced I/O streams, which is the NIO.2.

We'll also manipulate files, directories, and file systems using the JDK NIO.2 specification, like I mentioned earlier. We'll be able to perform multiple operations on database tables, including creating, reading, updating, and deleting using the JDBC API.

We'll also process strings using a variety off regular expressions. We'll create high-performing multi-threaded applications that avoid deadlock. And we look at localization in Java applications. Again, localized Java applications. And that is part of internationalization.

In terms of the audience, the target audience, in this, case includes those who completed the Java SE 7 Fundamental Course, or have experience with the Java language, and can create, compile, and execute programs. Those folks who have experience with at least one programming language, like C and C++ language, for example. Folks who have an understanding of object-oriented principles. And of course, folks who have experience with basic database concepts and basic knowledge of SQL.

In terms of the prerequisites for this course, you must know how to compile and run Java applications. You must know how to create Java classes. Know how to create object instances using the new keyword. Know how to declare Java primitive and reference variables. Know how to declare Java methods using return values and parameters.

Know how to use conditional constructs such as if and switch statements. Of course, know how to use looping constructs as for, while, and do loops. And of course, declare and instantiate Java arrays.

Also, being able to use the Platform, Standard Edition API specifications, which we typically call the Java Docs.

In terms of the course environment, well, this course again, the lab environment would have the JDK 7 installed. That's the Java Standard Edition development kit that includes the command line Java Compiler. And of course, the Java Runtime, JRE, which supplies the Java command needed to execute your Java applications. A web browser, like Firefox. And of course, NetBeans IDE 7.0.1. Which by the way, is a free open source software development tool for professionals who create enterprise, web, desktop, and mobile applications. Again, the NetBeans 7.0 fully supports the Java SE 7 platform. And supports, of course, is provided by the Oracle's Development Tool Support.

And of course, the Java DB, which is an open source type of a database. It's actually the open source Apache Derby, which is 100% Java technology database. And is, by the way, transactional, secure, easy-to-use standards-based SQL, JDBC API, and Java EE yet, of course, is small, only 2.5 megabytes.

We also know that Java programs are platform-independent. As you all know, the Java programming language is a platform-independent type of a language. And of course, once you have your Java class, and you compile it, then becomes a bytecode. And that bytecode pretty much can run on any type of an environment that, of course, have the JRE running. And that could be a Solaris platform, could be a Linux platform, or could be Windows platform.

And in general, the way we look at it this way is pretty much you have your Java code that once it's compiled, it becomes .class. Which, by the way, can be, again, loaded through the class loader in the Runtime. And of course, then after that it goes through the bytecode verifier, which handles security. And then, of course, after that, it passes through the interpreter and the Runtime and the hardware.

In terms of the Java technology product groups, as you know, based on the Java programming language, we have the Java Standard Edition. And that, again, allows developers to build standard applications, standalone applications, like [? APEX, ?] for example. And we have the Java Me, Micro Edition, and that is typically dedicated for wireless type of devices. And Java Card, which is also related to the card technology. And the typical enterprise applications make use of the Java EE, which is the Enterprise Edition. And that, by the way, the Java EE also gets help from the Java Standard Edition that we are going to look at and investigate during this week.

We also have the Java FX, which pretty much helps us build desktop applications. And of course, we have Java TV and BDJ, that are pretty much related to the TV technology. And MSA for mobile type of devices.

So as you see, Java is used almost in every device nowadays. And in fact, there are millions of developers of Java. And of course, there are billions and billions of Java applications on the different devices in the world.

Let's go ahead and look at a little bit of history about the Java Standard Edition platform versions. Well, we started with version 1.0 and that was in 1996. After that, in '97 we got the 1.1, which is an update. That's all part of platform 1. In 1998, that's where we introduced the platform 2, which is the Java 1.2.

After that, in 2000, we got the update 1.3. 2002, we got the update 1.4. And 2006-- 2004, rather, we got the update 1.5. And that actually, it had a lot of nice features introducing the 1.5. In 2006, we enhanced it to 1.6. And of course, in 2011, we released the 1.7. In fact, 1.7 or Java SE 7 was released the 7th of July 2011.

So, you can actually download and install these JDK. Typically, you go to the site that I see here and I'm highlighting here, to download your Java SE or JDK. Again, choose the platform that you want to use in this case. If it's a Unix system, or either Linux or Solaris on Windows, download the version that is appropriate for your OS systems. Follow the installation instructions. And of course, set your path.

Now looking at the Java in the server environment. Of course, we developed Java Standard Edition applications. But also, we can build enterprise application using the Java EE or the Enterprise Edition of Java.

Java, of course, is common in enterprise environments. And we see it on the Oracle Fusion Middleware, where we can see it again making use of GlassFish application server or WebLogic application server. They're both Oracle application servers. And of course, in database servers, handing MySQL or Oracle Database.

And of course, at a very high level, Java community is the term used to refer to the many individuals and organizations that develop and innovative and use the Java technology. Again, this community typically includes developers as individuals, organizations, businesses, and open source projects and so forth. So here on this slide we show you just a few examples of these type of groups, from Oasis to the NetBeans group, to the OpenJDK, to the Java.net, to the Eclipse Group, to the Java Community Process, and so forth.

Now, the Java Community Process, which is typically called JCP, is used to develop new Java standards. Again, it has its own website. And of course, you got free downloads of all Java Specification Requests, JSRs, easy access to specifications. And of course, it's public review and feedback opportunities from anyone who's actually willing to do that. And of course, we have open membership for all of that. And the whole idea is to achieve the transparency, where again, in this case, transparent development is now the recommended practice.

Participation. All kinds of individuals can participate in the Java users group. And are encouraged, of course, to become active in the JCP. And the agility is that again, slowly moving JSRs are now actively discouraged. In the sense that, obviously, we can go ahead and get all kind of-- in this case, of help from anybody who's willing to, of course, give help or any type of opinions.

In terms of the governance, the Java SE and ME expert groups are merging into a single body.

OpenJDK, by the way, is an open source implementation of Java. And you can find it on this link here. Again, GPL licensed open-source project. And of course, it has a JDK reference implementation where new features are developed. Of course, it's open to the community contributions. And of course, its basis is, in this case, for Oracle JDK.

So because it is open source, open JDK, enables users to port Java to operating systems and hardware platforms of their choosing.

For the Oracle Java SE, which is the Standard Edition support, of course Java is available free of charge us as we all know. However, Oracle does provide paid for Java solutions. Again, the Java SE support-- we have the Java SE support program that provides updates for end-of-life Java versions. And we have the Oracle Java SE advanced and Oracle Java SE Suite, and that's where you have your JRockit mission control, memory leak detection, low latency garbage collection suite. And of course, the JRockit Virtual Edition suite.

So we can say that, of course, the fact that Oracle offers these advanced commercial solutions at cost. Of course, in these case, it allows pretty much-- if you're interested in getting support from Oracle, obviously, just contact the service folks. And of course, you will be able to get a-- and of course, an advanced commercial solution at cost.

Here are some additional resources. And these are, if you're-- again, for the education and training is represented by the education.oracle.com. For product documentation it's under the oracle.com technology documentation. For product downloads, it's under the oracle.com technology software. For the product articles, it's all under the oracle.com/technology/pub/articles. That's pretty much all articles related to the Java technology. Product support is under the oracle.com support. Product forums, it's under the forums.oracle.com. Product tutorials, it's under all the oracle.com tech network tutorials. And the sample cord is under the samplecode.oracle.com. The Oracle Technology Network for Java Developers, that's under the-- in this case, the oracle.com tech, the tech network Java. And then, of course, the Oracle Learning Library, and that's under the oracle.com go to [? op. ?]

So this pretty much gives us a summary on the course objectives. The software used in this course, which pretty much the Java SE 7. Of course, NetBeans and the browser.

We looked at the Java platforms, which are the Java ME for Micro Edition. The Java SE was for Standard Edition. And the Java EE for Enterprise Edition. Of course, we looked at the Java SE version numbers. And of course, throughout the history and when were they created. And of course, we looked at how we obtain a JDK. We also looked at the open nature of the Java and its community. And we looked at the commercial support options for Java SE offered by Oracle.

## 2. Practices for Lesson 1 - 5m
