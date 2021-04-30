# 1: Introduction

1. Introduction - 7m

## 1. Introduction - 7m

Let's go ahead now and get into the lectures of the Java Performance Tuning with Mission Control and Flight Recorder. We start with the introduction where basically we discuss a little bit the goal of this course. And we tell you that the main goal of this course is to pretty much teach you how to manage your profile and tune the performance of Java applications.

Well, after completion of this course, hopefully, we'll be able to describe the basic principles of a performance, look at the garbage collection schemes, monitor performance of the JVM, monitor operating system performance on Solaris, Linux, OS, 10 of Mac, and, of course, Windows, provide the performance of a Java application, tune garbage collection in a Java application, tune the performance of Java at the application level, apply Java development best practices for performance.

So the typical audience of this course basically is Java SE developers. So if you are a Java SE developer, then it would be nice to look at this code just to give you an idea how to monitor profile and enhance the performance of your application. It's also extremely useful for Java EE developers, those who develop enterprise application, a class type of applications on, of course, deployed on WebLogic, for example, application server. Of all the app servers, then this would be definitely an excellent course to look into. And, of course, all the folks who are Java technical architects, this would be very useful to them too.

So the prerequisites for this course are pretty much you must know how to develop applications using Java programming language, use object-oriented programming techniques, administer operating systems from a command line, and apply basic networking principles to a system. This is basically the course map where first, we start with a bunch of concepts where we cover the Java virtual machine and performance overview, the JVM and Java garbage collection, and, of course, the Java garbage collectors themselves.

Then we get into monitoring. In monitoring, we're going to look at command line monitoring using the command-line JVM monitoring, mission control, and, of course, a VM monitoring, which is graphical user interface monitoring, Java flight recorder, which is really quite useful. We'll take a look at that. This basically gets into trying to save or record all the events of your JVM. And, of course, we'll also look into monitoring the operating system performance.

After we finish with the monitoring, we get into the profiling and tuning. That's where we going to look at some basics of a profiling. Then, we're going to look at profiling performance issues. We'll tackle all of those issues. And then, we'll discuss the garbage collection tuning. And we'll finished the course by looking at some language best practices where we apply, in this case, some of the best practices at the application level and concerns and garbage collection.

So the topics of this course, basically, in this course, we master the Java SE performance monitoring by looking at what and where to monitor, what to provide, and which tools work best for different use cases, look at commonly observed patterns indicating performance issues, look at got how Java hotspot the VM garbage collectors work and how they are tuned, look at what you need to know about the JIT, the just in time compiler, and how JVM ergonomics works, and, of course, how to tune the JVM for specific hardware platforms.

This is more or less basically the schedule of what we do in day number one and day number two and day number three and so forth. In terms of the environment, you would be given a machine that has the JVM already installed. You have your Firefox. And, of course, you have a bunch of performance tools that are installed that you're going to work with. One is the VisualVM. And the other one is the Mission Control and the Flight Recorder. There are some other ones too, and we'll take a look at those.

Of course, here, here's the lab machine environment that I connected to. And if you right click on a computer and click on Browse, then from Oracle, you can actually get to the student guide, then the activity guide if you want. And then, of course, there are other basically tools that we are going to discuss. You can also open up a terminal from System to Tools and then Terminal. They can go ahead and open a terminal, which I already did.

And we'll discuss that, of course, with that throughout the lecture. And then, of course, we get to start the IDE NetBeans. We'll take a look at that at some point in time. These are just some additional resources in terms of training and documentation and product downloads and articles and support and so forth-- tutorials and so forth. That pretty much covers the lesson one, which is introduction. Thank you.
