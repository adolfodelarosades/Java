# 9: Basics of Profiling

1. Basics of Profiling - 11m
2. Practice 9-1: Application Profiling Using NetBeans Profiler - 6m
3. Practice 9-2: Profiling root Methods - 5m
4. Practice 9-3: Exploring Thread State with NetBeans Profiler - 3m
5. Practice 9-4: Modifying the NetBeans Profiler Session - 4m
6. Practice 9-5: Attaching the Profiler to Another JVM - 3m
7. Practice 9-6 Profiling a Web Application with NetBeans Profiler - 6m

## 1. Basics of Profiling - 11m

Let's go ahead and take a look at lesson 9, where we do some basic profiling or basics of profiling. Here, we're going to profile an application using the NetBeans Profiler, the Flight Recorder, jmap, and jhat. We're going to describe the profiling features of Oracle Studio and profile the CPU usage to improve application performance.

Let's start with tools for profiling an application. One of them is the NetBeans Profiler, which is an excellent tool. We'll take a look at that. We also have Oracle Solaris Studios. That's another one. Jmap, jhat, which are command line. And DTrace, which is, by the way, also another tool that we don't cover in this course, but it does its own courses. OK?

And, of course, we do have free tools like Oracle JDeveloper, the Flight Recorder, which we have seen previously. Let's take a look at the NetBeans and NetBeans Profiler. You know, the characteristics, it would be allowing us to do CPU profiling using bytecode instrumentation. It has a very low overhead profiling. Thus, people like it.

And pretty much, it has very, very excellent capabilities. You can do method profiling, where you select all the methods for profiling or select specific methods. You can also limit everything except JDK classes. You can do memory profiling and heap profiling. You can also do memory link detection.

And to use NetBeans, basically, install it on any platform that you are working with-- either Solaris, Linux, Windows, or Mac, and so forth. And the NetBeans is available. And you can go ahead and do that. Let's go ahead and do-- you guys are going to do a NetBeans profiling on your application. But let's go ahead and try this.

So first, you run your application for some time. Just to kind of create some threads and so forth. OK. And then, you close it. And then, you right-click on the project and, of course, click on Profile. Here, we're going to do a quick profile. We're going to do some CPU profiling. We're going to provide only project classes, OK?

And under the filter-- so we can go ahead and pretty much, in this case, under the Edit Filter-- it shows that we're excluding, in this case, the Java core classes. We're doing all of that. And then, we just click on Run. And that will start the profiler, OK?

Here's your application starting. OK. You can go ahead and basically-- and then, you can scroll down and see, in terms of the number of total memory, and memory usage, and so forth, and under the, of course, VM telemetry, you can see, in this case, in terms of the number of-- you know, the way it's being used in this case.

And if you scroll up a little bit, you know, here, you can take a look also at the threads. But what we're interested by, if I scroll up, I'm interested by the live results, OK? This shows me the different type, you know, in this case, of methods that are, in this case, running. OK. So and you get, of course, there all the questions that it goes through. And you will get to play with it in the practice.

You can do also the Java Flight Recorder. And we've seen that earlier when we went through the flight recording lesson, where we can profile details and excellent profiling capabilities. You can use the profiling template, you know, slightly more intrusive.

But you can go ahead and record all kind of JVM events of your application, either continuous or timed. And you can use it to do some analysis, where you can look at the hot methods, the heap, the object allocations, the contentions and locks. Really, really quite powerful.

You can also use the Oracle Solaris Studio, which is also useful. It basically allows you to collect and analyze. It has Collector and Analyzer capabilities. It brings you some statistic CPU profiling. You can specify, in this case, the sampling interval-- 1 second. Users and system CPU time can be used. And you can use it inclusive or exclusive in terms of the methods, OK?

You can find out the time spent in locks, view the Java bytecode in User more, in Expert mode. You can also view the JIT compiler, generated assembly code in the machine. You know, it supports specific CPU counter collections, too.

So and the way you run it is just collect dash j on the Java batch processor and go ahead and run it, OK? And we don't have any practices in this course about it. But it also is an excellent tool that you can actually make use of. It runs on Linux, too, by the way.

And once you get that, you can look at the Analyzer. The Analyzer is Graphical User Interface Analyzer that allows you to see all kinds of information. It's basically a tool that is graphical user interface tool that competes with many, many graphical user interface tools.

Another set of commands that are useful for you to do a little bit of profiling is the jmap and jhat. Jmap, what it does, it produces the heap profile. And jhat is the one that allows you to analyze, read and analyze the data, OK? We do actually have a practice on that at some point in time. So this jmap and jhat, they shipped with the JDK, starting JDK 5 and up, OK? It's a command-line tool, you know, it does heap memory profiling, permanent generation statistics, and supported on all platforms.

DTrace is another tool. It's not covered in this course, you know, the detailed coverages is beyond the scope of this course. But, you know, we do have a course about it. But it's also an excellent tool that is quite comprehensive and that helps you troubleshooting your kernel, your application problems and on the production system. It was originally developed on Solaris, but it also runs on Linux, and it's also an excellent tool that you can look into it, too. And, of course, Oracle provides that. And it has its own course, too.

In terms of the CPU profiling, what does CPU profiling typically do for us? You know, it basically provides information about where an application spends most of its time. CPU profiling is needed or beneficial when there is either a poor application throughput as measured against the pre-determined type of target or benchmark.

Maybe you have saturated CPU usage. Maybe have you have high system or kernel CPU usage. Maybe you have high lock contention. All these are different types of problems that you might have, OK? Or maybe idling problems and so forth.

In terms of the strategies on how to go about doing CPU profiling, we tell you, start with a holistic approach to isolate major CPU consumers or hot methods. Look at methods with high user and/or system CPU usage. Look at both inclusive and exclusive type of method times. And if the holistic approach does not give you a good result, then, go ahead and profile a subset of your application.

Again, this is best when the holistic approach is too intrusive. And by the way, the subset of a profiling is easily done through the NetBeans Profiler. It can profile a set of methods, a package, and so forth, class, and so forth. Some of the anti-patterns that we identified and we'd like to discuss, and they're related to the maps and high CPU usage.

So observe when you work with maps, sometimes, you want to look for data, and you say, does the map contain the key? So look at a stack trace for unnecessary call flows, for example, here, if I do if map contains the key, go ahead and get that. So it might be a good idea to just read the value. And if the value exists related to the key, then, that's good. Work with it. If you get a null, that means it does not exist.

Rather, if you do an if and try to check, that's going to consume a lot of cycles and might be affecting the performance of your systems. Other use cases using map methods would be put the same thing and remove and so forth. That may be also eliminated.

Again, looking at the anti-patterns in method profile, we tell you, observe your high system CPU times. Look for a monitor contention. And monitor contention and high system CPU have a strong correlation. So consider alternatives to minimize your monitor contention in this case.

Example, if you are reading too many data through a socket, it might be a good idea to use a non-blocking socket channel to read the whole data at once and then, after that, process that. And that's pretty much what we're going to say about profiling. You guys get to do a bunch of practices here where you're going to use some of the tools to handle-- to do the profiling for an application. One of them is the NetBeans Profiler.

## 2. Practice 9-1: Application Profiling Using NetBeans Profiler - 6m
## 3. Practice 9-2: Profiling root Methods - 5m
## 4. Practice 9-3: Exploring Thread State with NetBeans Profiler - 3m
## 5. Practice 9-4: Modifying the NetBeans Profiler Session - 4m
## 6. Practice 9-5: Attaching the Profiler to Another JVM - 3m
## 7. Practice 9-6 Profiling a Web Application with NetBeans Profiler - 6m
