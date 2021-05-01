# 2: Java Virtual Machine and Performance Overview

1. Java Virtual Machine and Performance Overview - 27m
2. Practice 2-1: Log into Oracle Linux; Practice 2-2: Open Terminal Windows in Oracle Linux; Practice 2-3: Add the Java bin Directory to the Path; Lesson 2-4: Open a Text File in Oracle Linux; Practice 2-5: Start NetBeans and Open a Project - 6m

## 1. Java Virtual Machine and Performance Overview - 27m

Let's take a look at the Java Virtual Machine and Performance Overview. In this lesson, we're going to describe the key features and architecture of the Java Virtual Machine, the JVM. We're going to describe common performance principles. We're going to list common application performance problems. We're going to describe a standard performance methodology and describe how to incorporate performance into development.

While getting into the lesson, I always like to go through some of the concepts that you will be asked to know in the practice. For example, in the practice, in this case, they ask you to edit the .bashrc and add the last line, which is export Path/usr/java/default/bin/Path, and so forth. I already did it. And so there's no point of trying it again. And you will try it later on.

And if you take a look after I did the edit, I also sourced that file by writing source space .bashrc. And so we can go ahead and ask all kinds of commands over there. We'll get to that. In fact, why don't I just start NetBeans in the background, NetBeans space and %. And I let it start and continue with the lesson so that when it's time to take a look at the NetBeans, I'll go ahead and look at it, especially to open the 2D application that I'm going to show you later on.

So basically, continuing with that, the objectives of the course, we said we're going to describe some common performance principles. We're going to list common application performance problems. We're going to describe a standard performance methodology, describe how to incorporate performance into development.

So discussing Java, we can tell you that Java has a couple of key components. They are the programming language, which by the way, we have to master to be able to write code in Java and develop an application in Java. And then the virtual machine itself, the virtual machine is quite important, because on the top of it, we'll go ahead, in this case, and take a look at how we apply the-- how we run the application on the JVM.

So looking at the HotSpot, which is the JVM, we know that, in general, when you work with a job application, you have first of all a hardware platform, which is your server. And on the top of that, on that server, you must install an operating system, because after all, that operating system is the one that needs basically to, in our case here, run your hardware. So that's your OS system.

Lots of times, in our case here, we'll use Linux or any type of a flavor, if you want, of Solaris or of Linux. So that's your operating system.

And then on the top of that, you are going to install your JVM. So you're going to install the JVM so you can run Java applications. That would be basically your JVM sitting down here. OK. And then, of course, after that, you are going to build your application and run them on the top of your JVM. And these would be all your Java applications that you are going to write.

And of course, what we are going to do is we are going to tackle the performance tuning at the JVM level. We're going to look some monitoring and all that at the OS level. And then, of course, we're going to look at the application itself, which is, in this case, the code that you write. That's what we are going to tackle in this particular course. Of course, all of this sits on a hardware platform, which is your operating system.

So Java is an object-oriented programming language that, of course, improves on C and C++, which was basically built based on C and C++. What's good about Java, it has garbage collection, which is automatic. So the Java source code is compiled into bytecode. And then the bytecode is stored into .class files which, by the way, are loaded into the JVM through the ClassLoader and then executed. And we should remember that a separate JVM is created for every application in this case.

This is more or less the architecture of the virtual machine. So you've got your ClassLoader that loads your classes, which are the compiled classes, the bytecode. And then you have a runtime data area, which is made of the method area. And that basically would be related to any type of a method related to the JVM itself.

Remember that JVM is written in Java. So whenever it's helping to run your application, some of the objects are created at that JVM Level 2. And that's called the permanent generation. And we'll talk about that later on.

You have the heap. And you have your Java threads. And you have your program counter registers and some native internal threads. Of course, the execution engine, that makes use of the JIT-- the Just-In-Time compiler. The just-in-time compiler is the one that compiles some of the code in Java into microcode so it will go ahead and run faster on the JVM.

And of course, the garbage collector is the one that allocates memory for brand new objects that are being created and then, of course, cleans up the memory on all those objects that are not useful or not referenced anymore, not used anymore.

So basically, the focus of course, we are going to focus more on the heap and the JIT compiler, and of course, the garbage collectors. And Java actually has a heap which is a little bit of a, slightly, if you want-- here's the memory area of the Java, if you want, and just to give you an idea.

So Java memory is made of, one, you have a stack memory. And the stack memory, basically, in this case, contains all the primitives. All the primitives are located in the stack memory. And then all the references to objects also are located inside the stack memory.

And then it has another area which is the heap memory. And the heap memory is bigger. And that's where objects, by the way get created. So that is the heap memory.

All right, so if you want, an object can get created inside the heap memory. But then a reference is always located inside the stack memory, so which means, in this case, we can look at this as a reference to an object. So the reference to an object can sit inside the stack memory, which points to the object located inside the heap memory. OK.

All right, so let's continue with our lecture. And lots of times, we have this question, which is, what is performance? So the aspects of performance include memory footprint, how much memory you are consuming, in this case, in the heap, when you are running your application.

Startup time, which is very important because of the JIT compilation. And typically when you start your application, it takes a little bit of time at the beginning for the JIT to do its job so that you can take advantage of the JVM at the time, running your application.

Scalability is also important. It's part of the performance. And then you have responsiveness and throughput, which I'll explain in a few slides. responsiveness is when a response is being billed to answer requests and in real time, as fast as possible. And then the throughput is pretty much the batch work, how much work can be done per unit amount of time.

So starting with the memory footprint, this is pretty much the amount of memory used by your application and your JVM on a system. So lots of times when you think about memory footprint, you might consider including asking yourself a bunch of questions. Does the application run on a dedicated system? Does the application share the system with other applications or JVMs? This is when you are using virtualization.

As a memory footprint grows, does the virtual machine-- rather, the virtual memory swap to a disk? If there is a swap into a disk, then this is really, really bad. Java hates swapping. Java loves physical memory. So we need to avoid having swapping in Java, because that's a bad idea.

Accessing data in a virtual memory that has been swapped to disk is much slower than accessing data in RAM directly. That's why, for Java applications, we always have to have and make sure that we have enough memory, enough physical memory. That's what I mean by that. If you don't, then you'll have a huge problem from the performance point of view.

The startup is the time taken for an application to start. For a client application, this could be very important. And for several applications, it is more or less less important, because like I said, it's batch work. So the idea about startup time is the time until performance. This is where the JIT takes a little bit of time to basically, in this case, does some JIT compilation over there so that we can convert some of the bytecode into microcode to run the application faster at the hardware level. That's what it is.

And scalability is how well your application performs as the load on it increases. So an application may perform well in development but poorly after it is deployed. So if an application response time grows exponentially when under load, then we can definitely say that it has a very, very poor scalability, no question about that. If an application response time, on the other hand, grows linearly when under load, then we can say that the scalability is not that bad. It's good. So scalability can be measured at a many level levels in a complex system.

Here's basically a diagram that gives us an idea about that. If we take a look here, [INAUDIBLE], you see that a curve that is in gray, which basically tells us that whenever the load or the number of users increases, you will see that the response, in this case, time will increase also exponentially, which lead us to say that this has a very poor scalability, no question about that.

On the other hand, if you take a look at the other applications which are represented by the red graph, then you will see that the load in this case and the number of users, the more it increases, you see that response time sits under a certain cap, for example, here, under 100 milliseconds. So that is growing linearly, which makes sense. And that actually is good for scalability.

In terms of the responsiveness, I said, any application that actually looks at how quickly a response or a system response with respect to a piece of data, we call this a responsiveness stuff on application. Example, a desktop user interface responds to an event. A website returns a page, especially in the web application. You click on the link, and you want the data to come right now, in real time. That's what we mean by responsiveness, which means the amount of time to get the answer should be extremely small. If it takes long to get a response to a request, then of course, we've got a problem here. A database returns query results [? in another ?] example.

So long pause times are not acceptable in the [? responsiveness ?] of that [INAUDIBLE] application. What do we mean by that? When the garbage collector takes longer to garbage collect, for example, either the minor for the young generation or the [? full ?] for the [? full ?] generation, which by the way, we'll see the other for the old generation, then definitely, we've got a problem over there.

So we want the post times-- because remember, when a garbage collection is running, especially the serial and parallel, it uses what we call stop-the-world. Stop-the-world means that your application threads get suspended. They get suspended while the garbage collector is doing its job.

So once the garbage collector finishes doing his job, then at that time, the application continue running. So we've got a problem about that. So the response in this case is very important. And that's why the focus is on responding in a short period of time to that request that you have. So all web applications are all responsive type of an application.

And you have the throughput. The throughput is the other way. The throughput is basically looking at the amount of work by an application in a specific period of time. Examples of these type of throughput applications will be the number of instructions per second that can be executed or the number of jobs that a batch program can complete in an hour or a day, whatever, or the number of database queries that can be completed in an hour or a day or a few hours, or whatever.

So in this case, the high pause times can be acceptable, because we're looking at the overall amount of work per unit amount of time. That's what we're looking at in this case. And lots of times, it's applicable to batch work, like we said. So the focus for throughput is on how much work can be done over a longer period of time. That's what I mean by that.

So of course, the question is, what are we going to focus on in this course when it comes to this performance? We're going to focus in this course on the Java application performance, optimizing the JVM for maximum throughput and responsiveness, both applications, throughput applications and responsiveness type of applications. And discovering troubleshooting and tuning the Java performance issues.

So the Java performance issues covered, again, in this course will be memory leaks, lock contentions between threads, tuning heap sizes, and optimizing JVM garbage collections. And we're going to look at all of these throughout this court.

Some of the issues that are not covered in this course but covered in other courses would be the vertical versus horizontal hardware scaling. This is when you are doing clustering and load balancing that has nothing to do with this course. We do have courses, by the way, that handle this, if you're using WebLogic, and so forth.

Network tuning and design, we do cover this in our Linux and Solaris course. Poorly designed AJAX/JavaScript web pages, these are covered in our web application courses. And database optimization, we do have a lot of excellent courses in database optimization.

Of course, the question that we have right now is, how do we go by-- what type of methodology we are going to follow to be able to learn the performance tuning for our applications. Well, in this course, we're going to start by doing monitoring first. And we're going to do monitoring at the command level and also at the user interface level, both. So GUI monitoring, and then command level monitoring.

Then after that, we're going to learn about profiling. Then after that, we'll learn about tuning. We're going to look at some definitions, and so forth.

So what is it that we're going to do in monitoring? Well, the act of monitoring is pretty much a non-intrusive type of a collection and observations of the performance data from an operating system running the applications, or your JVM running your applications. So usually, when we monitor, we don't be too intrusive, in a sense, by collecting lots of data. The idea is to observe how your application is running in real time.

And this will help us identify problems for troubleshooting, determine problem characteristics. And then, of course, for development you test to ensure that your application meets all the requirements. And you test both your responsiveness type of an application and your throughput type of an application. And by the way, because these are the two types of applications that exist, either responsiveness, like a web application, or throughput, like a batch type of an application. We do have a operating system in JVM tools that we are going to use in this course.

In terms of the profiling, what we do-- the profiling is a little bit more intrusive, because we're collecting data. So we collect the data, and then we observe the performance of data from an operating or running application point of view. The profiling is a little bit more intrusive compared to monitoring, because you are, in this case, collecting data. And we see, by the way, this in using different tools. One of them is the Java Flight Recorder that we are going to look at. And in general, this performance profiling is commonly done in qualification and testing and/or development environments.

And then also, after we do monitoring and profiling, then the next thing is tuning. What is tuning? So what is it that we do in tuning? Well, we are going to change some tunable source code or configuration attributes for the purpose of improving the application responsiveness or application throughput. Based on the analysis that we did in monitoring and profiling, then we can make a decision that we should do a little bit of tuning, either the source code or some configuration attributes, to be able to, of course, improve the application responsiveness or the application throughput.

So we rely on performance requirements. We require monitoring or profiling activities to do that. And of course, the goal is to make sure that your responsiveness type of an application is running perfectly with a good performance. And then of course, we maximize the throughput for any type of a batch application or throughput application.

One of the typical mistakes that people do when they are going through the development process, people have a tendency to start the problem, go through the analysis, do the design, do the coding, and do the testing, and then do the QA, in a sense, that you do the testing and the QA only at the end. And that is a bad idea.

Our advice to you is to do monitoring and profiling throughout all the different steps in the design and implementation of your application. Do the monitoring and profiling at the analysis level, at the design level, at the code level, and at the QA level, to make sure that we basically are capturing all issues right from the beginning. That's what we mean by that.

And don't wait until the last minute and then start doing some monitoring and profiling after the whole application is done. Then if you find a big huge problem, what are you going to do? Refactor the whole thing? That's going to take more money and more time. Be careful with that.

So which means, when you are building your enterprise application, and you are handling use cases one at a time, go ahead and monitor and tune every single use case that you're finished with before integrating the whole thing together. That's what we mean by that. So it's really quite interesting that you basically follow these steps because at the end, they will be very, very useful to you.

And that's pretty much what I wanted to say in this particular lesson. But in this lesson, you also are going to play a little bit with the practices. And in the practice of Lesson 2, what you're going to do in this case is you are going to open NetBeans. So I started NetBeans earlier.

And when you start it, you always have the Start page, just the X next to the Start page. Go ahead and click on it. And then they'll ask you to open a project. This project is part of the labs. It will be in Lesson number 2. And this would be the Java 2D application that they asked you to open. So we'll go ahead and open it. And it's going to take some time to open and scan.

And so as you see, here it's opening the project. And then all what they ask you to do is to run this application. That's basically what they're asking you to do here. And so you see now it's opened.

You can open it and take a look at the code. Don't change any code, by the way. But the reason why we selected this application-- it's called the Java 2D, which by the way, you can download. This comes with the JVM. And so it says, please wait, class scanning in progress, and all that. So it's doing some work. So it did not finish the whole scanning, as you see here. It's only 94%.

But so we'll wait a little bit. But you can take a look at the code inside. Basically, there is a README file, if you want to just read about it a little bit, and so forth. That's basically what it is.

But it is a-- see? Now let me go ahead and-- so it does look like I started it. And so basically, it creates all kind of animation and 2D graphics, and so forth. And while doing this, it creates lots and lots of threads that we can go ahead and use them in our-- while using our monitoring and profiling type of tools that we are going to use. That's basically what it is. And that's what they want us to do in this Lesson 2. Thank you.

## 2. Practice 2-1: Log into Oracle Linux; Practice 2-2: Open Terminal Windows in Oracle Linux; Practice 2-3: Add the Java bin Directory to the Path; Lesson 2-4: Open a Text File in Oracle Linux; Practice 2-5: Start NetBeans and Open a Project - 6m

So now that we're done with lesson 2, we know that lesson 1 has no practices. Let's go ahead and do the practices of lesson 2. So in 2.1, they just ask us to log into our lab machine, which I'm already in.

And then after that, they want us to open a terminal. So we send the application system to the terminal. So we got this terminal opened. And then after that, they want us to run some commands if you want on Unix commands.

And then after that, they want us to gedit the .bashrc. So gedit .bashrc. OK, so basically they want us to edit this which is the bashrc. Just go ahead and do that.

And then they want us to add the command export line at the end, which I already did. And then I already did it earlier. And then click Save. And then after that my advice to you is to source this file, .bash, OK. And that's basically what they want us to do.

And then after that, they want us to look at the README file in the home. So just basically nothing really into it. So we got to the labs and then we just look at the README file. And just edit. And it says basically the practices and so forth.

And then after that, they want us to start NetBeans and open the project in lesson 2 and run it. Just so that you can also explore the user interface and so forth. Just go ahead and do that. So first I start NetBeans in the background using the ampersand.

So I'd go ahead and start it. I already started it earlier. So most probably better a project want to be opened over there. And I will just go ahead and close it, because I was lecturing with it. So that's why. So here is the project. We'll go ahead to close this guy here.

And if you started NetBeans at the beginning, it would look like this. So we just close the stock page. Then you can always reset this. And this will reset it. And then we'll open a project. And there's lesson 2 which is the Java 2D.

When you open it for the first time, just give it some time to scan. That's the README file of the Java 2D. That's what I was reading about. And then they want you to run it. So go ahead and run it. And that basically is going to open a 2D graphics type of animation and so forth. You can play with it any way you want, just add more shapes or strings or images, you know, maybe make the animation a little bit faster, and so forth. And that's what they want us to do.

You can also look, by the way, just out of curiosity. You can look at the different classes. And here are the images and the composite and paint, and the transformers and so forth. Just to see what type of a class exist over there, which is all copied and written. That's basically it.

Then once it's all good, we'll go ahead in this case and close the project. In this case, don't leave the project. Always close it, because, otherwise, NetBeans. Would not be able to open it next time. And then close the NetBeans. And that's pretty much what they want us to do in these practices of lesson 2. Thank you.

