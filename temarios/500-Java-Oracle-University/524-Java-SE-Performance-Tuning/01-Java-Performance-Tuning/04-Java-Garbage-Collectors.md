# 4: Java Garbage Collectors

1. Java Garbage Collectors - 22m
2. Practice 4-1: Discovering Ergonomic Selections; Practice 4-2: Obtaining Detailed Ergonomic Information; Practice 4-3: Examining JVM Garbage Collectors - 10m

## 1. Java Garbage Collectors - 22m

Let's go ahead now and take a look at Lesson 4. Here we're going to discuss the Java Garbage Collectors. We're going to look at the garbage collection performance metrics. We're going to look at the garbage collection algorithms and describe the types of garbage collectors and, of course, make use of a very, very interesting property of the JVM called the JVM ergonomics.

So whenever we talk about garbage collection, we always are thinking of performance metrics. Basically, they are ways to measure garbage collection performance. For throughput application, we're looking at the percentage of time that is not spent in the garbage collector over a long period of time, because remember, it's a batch type of application.

On the other hand, the responsiveness, we want to look at how quickly an application responds in a given scenario. We need to also look at the footprint, which is the overall memory that is required for a process to execute.

Of course, there are many, many correct ways to size the generation. And of course, you should choose a way based on your application usage.

And of course, here, they're focusing on applications that focuses on the throughput. The highest priority for throughput of our applications, the raw throughput of the information or data being processed. In a sense, we're looking at maximizing the throughput of the application event at the expense of responsiveness. In a sense, we are going to tolerate the response, or high pause times to maximize the throughput, in a sense, to maximize the amount of work that is done on long periods of work-- rather, a long period of time. That's what we're looking at, which is basically related to batch work.

On the other hand, if you want your application to focus on responsiveness, then the high priority is to service all the requests within a predefined maximum time. In a sense, we want the answers, and we want it in the near real time. That's what we want. We want the response in the near real time.

So the raw throughput of data and speed of request processing are secondary to the goal of the maximum response time. That's basically what it is. So here, we need to be careful, because the application would be very, very sensitive to the garbage collection pause times. The pause times have to be very, very short and very small.

So lets now choose between garbage collector algorithms. We're going to look at serial versus parallel, stop-the-world versus concurrent. Stop-the-world means suspends all the application and threads while the garbage collector is running. Minor garbage collection has a tendency to do that. And the concurrent is allowing the garbage collector to run while the application is running. And then when we look at it, we're going to look at compacting versus non-compacting versus copying.

Let's look at serial versus parallel. In serial collector, we're using one hardware thread for the garbage collection task. In parallel, what we want to do is we want to use multiple hardware threads to handle the garbage collection task simultaneously, which means we can now use more than one thread to handle the garbage collection. That could be very interesting. It could be to us. Why? Because you could shorten the pause time.

Stop-the-world, what does it mean? The execution of the application is completely suspended during the garbage collection. It's quite simple to implement. But of course, you have more pause times.

Concurrent, on the other hand, is that one or more GC tasks, or Garbage Collection tasks, can be executed concurrently while the application is running. So of course, here you have less pause times but additional overhead, in the sense that you can have a couple of hardware threads handling the garbage collector and a couple handling the application, as an example. In general, you have less number of threads handling the garbage collector and a bigger number of threads handling your application, or running your application.

Compacting versus Non-Compacting. Compacting, you move all the live objects together and completely reclaim the remaining memory. We like that a lot better than non-compacting. Non-compacting has a tendency to have fragmentation of memory. And that's a bad idea, because that's why compacting is the way to go. Copying is when moving the objects from the Eden space to the survivors or the survivors to the old generation.

Now the types of garbage collection that exist are the serial garbage collector, which makes use of one hardware thread. Parallel collector, which uses more than one hardware thread. Parallel compacting, you use more than one [? half width ?] thread, plus it compacts the space. Concurrent Mark-Sweep collector, it runs while the application is running.

And the G1, we kind of have an idea. It also runs while the application is running. But it uses regions. We'll take a look at that. We looked at that early in the earlier lesson.

Let's look at the serial garbage collector. The serial garbage collector pretty much is a default for the client-style machines in Java, Standard Edition 5 and 6, it is used for both young generation and old generation garbage collector, using a single CPU. It's used for most applications that run on client-style machines and do not have low pause requirements. And by the way, you can explicitly implement, rather configure it using the -XX:+UseSerialGC.

Now let's take a look at the parallel collector. Throughput matters here. So it uses multiple hardware threads for young generation garbage collector and thus increases the throughput, no question about that. It's used for Java applications that run on machines with very large physical memory, multiple threads, and of course, that do not have low pause time requirements. And you can explicitly configure it using the -XX:+UseParallelGC. The serial garbage collector is still used on the old generation, if you want.

Ah, let's take a look at how when you run a garbage collector using a single-threaded versus multi-threaded.

The parallel collector uses a parallel collection algorithm on the young generation. So the diagram that we show here, how the parallel collector differs from the serial. If we take a look here, you will see that if you use a single-threaded, it takes longer stop-the-world pause times. On the other hand, if you use a multi-threaded, the pause time is a lot shorter. So that's why running the young generation or the minor garbage collector in parallel would be very interesting. And we would love to use that, because it definitely shortened the stop-the-world pause time.

To enable the parallel collection on the old generation, we can use-- we already said, -XX:+UseParallelOldGC. The ParallelOldGC, what it does, it actually is a compacting collector. That's the one that handles also the compacting, two at the same time. So if you use the UseParallelOldGC, it would also do the garbage collecting in parallel. And at the same time, it does the compacting for you.

And by the way, whenever you configure your garbage collector, in this case, for the old generation to be used, ParallelOldGc, it also enabled the ParallelGC for the young generation collector too.

Ah, the Concurrent Mark-Sweep, or what we call CMS. This is used when an application has a shorter pause time and can share processor resources with garbage collectors when the application is executing, which means while the application is executing, your garbage collection is running behind the scenes too.

It can be explicitly requested using these couple of command configurations, where the first one is -XX:+UseConcMarkSweepGC. That basically is to make sure that the CMS would be running. But then, since it's running while the application is running, we can also decide how many hardware threads are running the CMS. So this is handled by the second configuration here, a command that says, -XX:ParallelCMSThreads=n. And you set it to a certain number of threads-- 4, 8, whatever you want.

Saw the CMS is also called the Low Pause Collector. Why? Because it has really low pause, because it's running while the application is running at the same time. So that's why it's quite interesting.

So as you see here, the CMS also has five phases, similar to what we've seen in the G1 GC. So you have the initial mark. And that's stop-the-world. This is when it starts doing the marking. And then it has the concurrent mark. And then it has remark. This is because remark is done on the objects that we missed while doing the first initial marking. And then you have the concurrent sweep, which is basically sweeping the whole thing. And then the reset to get ready for the next sweeping.

So the initial mark, basically, objects are marked as reachable. And then in the concurrent mark, it traverses to find reachable objects. And then in the step phase 3, you find objects that were missed by the initial concurrent mark. We go out and mark them. And then in step four, we'll go ahead and collect the objects identified as unreachable during the marking phases so we can go ahead and clean them up. And then we prepare for the next concurrent collection. And that's basically what happens.

We know that for the G1 GC, it is a service-style type of garbage collector that is targeted for multiprocessor machines with large memories. And it means the GC pause times goes with a high probability, while achieving high throughput. So it operates also concurrently with the applications like the CMS.

And it compacts free space without lengthy GC-induced pause times, because it works on regions rather than the whole heap. And it provides more predictable GC pause times. And you can go ahead and explicitly configure it using the -XX:+UseG1GC. That's how you configure that.

And if you want to look at a table that the characteristics of the garbage collectors, here you're pretty much looking at-- on the column side, you have Serial, Parallel, CMS, and G1. And then on the row side, you have Parallel. Parallelism is handled by the parallel garbage collector. And also, CMS and G1 both can run it in parallel.

Concurrency basically is handled only by CMS and G1. Basically, concurrency means the garbage collector is running while the application is running. Young Generation actually can run on the parallel garbage collector or CMS or G1. And the Old Generation can run in parallel, using the parallel garbage collection, of course, and Serial using the serial. By the way, the Old Generation can also run in parallel and concurrent, which means while the CMS is running, and parallel and concurrent while the G1 is running.

Now some people might say, well, you know what, it might be a good idea to configure a little bit the size of the heap. It turns out that we do have some of the configurable variables [INAUDIBLE] to beat, if you want, that can help us configure the size of the heap. For example, we can have the initial size of the heap of the Young Generation handled by the -XX:NewSize. And then you have the -XX:MaxNewSize for the Young Generation.

We also can look at the initial size of the heap which is made-- of the Young Generation and the tenured-- using the -Xms or the -Xmx, which by the way, in this case, considers the maximum size of the heap size which is made of the Young Generation and the Old Generation.

And by the way, if you want high performance, you always make Xms equal Xmx. You also can specify the initial size of the permanent size using the -XX:PermSize and then the maximum perm size using the -XX:MaxPermSize.

So these basically are the heap parameters and their effect on memory partition. So we have the -Xmx, that's the maximum size of the heap size. That basically includes the Young Generation and the Old Generation. The Xms, is the initial heap size. The Xmn sets the initial heap size and the maximum heap size to be the same value. In general, we do that for performance.

You have the MaxPermSize. That's the maximum size of the permanent generation. You have the PermSize. That's the initial size of the perm generation. You have the MaxNewSize. That's the maximum size of the Young Generation. The NewSize is the initial size of the Young Generation.

Another nice ratio that we also know about is called the NewRatio. That's the ratio of the Young Generation space to tenured space. So these are good heap parameters that, actually, you can work with, and you can specify to, of course, improve the performance of your application.

One interesting property that was introduced for the JVM was actually introduced starting Java SE 5. It's called ergonomics. What does it do? Well, it evaluates the system and automatically chooses defaults for the HotSpot JVM. No tuning is required.

It relies on definition of "server-class machines"-- two or more processor cores and at least two gig of physical memory. And the server-class machine uses the -server JIT compiler. And the non-server-class machine is considered to be "client class."

This ergonomics is really, really useful. Starting like I said, JDK 5, we introduced that, basically. And the server-class machines default to the, again, server JIT compiler, throughput collector. It has an initial size heap, which is the Xmx, to be 1/64 of the physical memory, up to a maximum of 1 gig. And the max heap, which is the -Xmx, which is 1/4 of the physical memory, up to 1 gig, a maximum of 1 gig.

If the machine is not identified as a server-class, it is a client class machine, where the client JIT compiler is used. And of course, the default serial collector is also used.

Now the good thing about this ergonomics is you have actually a command that allows you to basically give you information about what is it that the JVM has selected in terms of the sizes of, in this case, the maximum heap size, and which garbage collector you're using, and so forth.

And we can see this as an example in your labs, you guys are going to do this. And you're going to try this here, a command at the command line. Let me run it and see how it gives me now the initial heap size, the maximum heap size, and so forth. So it basically is giving me all of this information. You guys are going to try this in the practice anyway at some point in time. All right, so again, this is an example of a two socket, 3.0 gigahertz hyper-threaded Intel running Solaris with 4 gig of RAM.

You can also, by the way, get some details using the ergonomics. You can use the -XX:+PrintFlagsFinal to get a detailed list of the options that were changed. And the options that were changed, they always have colon and then equal next to them. In fact, in your practice, you guys are going to try these. And you can do this, and then there other ones that you can try later on. But we're just showing you some examples here.

And if you take a look here, and you scroll up, you will see the ones that were changed. And they have colon equal. Here is one of them. And we've seen that, the [INAUDIBLE], and so forth. Here's another one, the NLog Diagnostic VM Options, some of the changes that we've done. Anyway, so we'll get to play with this in the lab. And that's a sample output similar to that we got when you run a command in the lab.

Some of the details-- again, continuing with this economics, types of data produced, PrintFlagsFinal. So you got your type OptionName and the value. I did a type, for example, here boolean or unsigned integer or an integer, and so forth. And OptionName, in this case you can put any OptionName and the assignment. So this would be a default value. And this, the option was modified from the default value from a command line by the ergonomics. And that's what we were looking at earlier.

And of course, in terms of the category, you can have diagnostic, product, or manageable. And you can have, again, in this case, modifiers, like a client and server, and so forth. Then the platform dependency, and so forth.

And that's pretty much what I wanted to say in the practice-- rather, in this lesson. And in the practice of this lesson, they'll also ask you to run the Visual VM with a different garbage collector. For example, let me just try this one here for the fun of it. Let me see if it's already there. Yeah, so let me try this using the G1 GC. So I'll play with it a little bit, and then I'll open it in the Visual VM.

And what they want to tell you here is basically look at some of the information. They want you to look at this information here, related to the different types of garbage collection that you are going to use. And they're going to ask you to basically try these and look at the numbers, whenever you use a serial garbage collector, a parallel, parallel compacting, concurrent mark-sweep, and G1 GC.

Quite an interesting type of a practice. Please try it, and we'll take a look at it later on. Thank you. And that's pretty much what they want us to do in this lesson. Thank you.

## 2. Practice 4-1: Discovering Ergonomic Selections; Practice 4-2: Obtaining Detailed Ergonomic Information; Practice 4-3: Examining JVM Garbage Collectors - 10m

Now that we are done with the lesson 4, let's go ahead and do its practices. We start with practice 4-1 where we are going to discover the ergonomics section. Here, we're going to open a command line windows and run this command, here, OK, which we'll do. And so we're going to start the first one.

And just run it. And that's what we get. So, of course, it produces the output that we see here, and pretty much telling us about the initial size of the heap, and the maximum size of the heap, and so forth. And it uses the default garbage collector here, which, by the way, we do not see here. OK?

So, again, we should identify the initial size maximum heap and the garbage collector used. And here, we use the default garbage collector of the ergonomics. And that's basically what they gave us as information.

In the next practice, 4-2, they want us to obtain detailed ergonomics information. Here, we obtained detailed information about the command line option and default ergonomics choices that are selected in the JVM. Yet, again, in this case, we make sure that we are in the home directory. So we do that first. OK?

And then after that, we're going to run the command, this command here, which, by the way, we see here, also, here. So we'll go ahead and run it here. OK? And that's what we see here.

So here, basically, once we run that command, it's kind of lengthy. And we open that command and, in this case, and put it inside the-- we're going to dump all of this into flags.txt. We'll go ahead and do that. And this would be here.

So we put all of this into flag.txt. And then after that, they want us to open the flag.txt. Let's go out and open it, gedit flags.txt. And that's what we see. OK?

And so we open, in this case, the command line and, of course, and enter the command line that you see here. So let's go ahead and do that. This would be the one, in this case, that we're using, which is this one here.

And that pretty much here, what it does is the outward displays only the JVM options that were set on the command line or by an ergonomics. And that's what we see here, which is the initial size, the maximum size, the print flag here, a final DAM log, diagnostic VM options. And they use compressed [INAUDIBLE], OK, that we see here. They all have colon 1. And that's what they want us to do here.

After that, they want us to open the command line window and open the JVM. So let's go ahead and do that, another visual VM. So we'll go ahead, in this case, and basically, open using the serial. But we're going to part, add this, and apply this to the parallel, and the parallel old GC, the concurrent mask sweep, and then, of course, G1GC. OK?

So they want to, basically, run this. And right click. And then visual GC, and deselect the histogram option. And then after a period of time, about 30 seconds, recall the collection of times for the next three minor garbage collections.

So we start with the first one. And we'll go ahead, in this case, and run it. And at the same time, open it here. And in the [INAUDIBLE] GC, deselect the histogram. And you see all the data.

And so that's one thing. And then we can do the same thing. So this would be-- then I just close it and keep those numbers like that. And then after that, I can go ahead and do it for the parallel GC.

And we have here a transform. And we're going to open it. OK? And this would be, again, the same thing. Except that this time, it would be for the parallel GC numbers. And I just close it.

And I can do the same thing for the next one, which is using the parallel compacting. And that's what I'm going to get, in this case. And then, of course, we're just going to go ahead and open it in its own tab. And that's what I get here for the second one, which is the parallel old GC, which is the compacting. And then I'm going to stop it.

And I'm going to continue with the next one, which is using the concurrent mask sweep. And let's do that. And the same thing, we'll wait until it starts. And then we'll open it inside the visual VM under the GC histo. And this is what we get as numbers. Go ahead and close it.

And then after that, we'll use the last one, using the G1GC. And then we'll go ahead and open it. And then we do the G1GC here, of course, same, pretty much. OK? And see again. You have to wait like 30 seconds. And then close that.

And, basically, following here, they want us to repeat all of these for every one of them and record all the collection of times so that we can basically-- and similar tests can be performed for all generation. And the idea is, in this case, to be able to find out about the numbers. Are they close to each other? Are they similar to each other, and so forth. That's the idea behind this. OK?

And that's basically what they want us to do in this particular practice. So you just go look at the numbers. This is for the serial for the parallel, for the parallel compacting, for the concurrent mask sweep, and then for the G1GC.

Some numbers are similar to each other. Some numbers are slightly over from each other. But in general, give it some time so you can see they're slightly different. Because remember, this is a 2D application, not much difference, like related to the applications that you are working with at work, OK, your production application, and so forth. And that's pretty much what they want us to do in these practices of lesson 4. Thank you.
