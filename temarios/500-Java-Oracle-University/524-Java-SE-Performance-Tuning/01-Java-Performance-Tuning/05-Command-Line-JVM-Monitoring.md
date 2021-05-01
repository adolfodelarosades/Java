# 5: Command-Line JVM Monitoring

1. Command-Line JVM Monitoring - 16m
2. Practice 5-1: Using –verbose:gc; Practice 5-2: Using –verbose:gc with the G1 Collector; Practice 5-3: Using -XX:+PrintGCDetails; Practice 5-4: Using -XX:+PrintGCDetails with ConcMarkSweep; Practice 5-5: Using -XX:+PrintGCDetails with the G1 Collector; Practice 5-6: Obtaining Application Stopped Time; Practice 5-7: Using jstat to Monitor GC; Practice 5-8: Examining JIT Compilation Activity - 24m

## 1. Command-Line JVM Monitoring - 16m

Let's take a look at a less than five. Here, we're going to look at command-line JVM monitoring. Earlier, we looked at some of graphical user interface monitoring like the visual VM. And we're going to look at more using the flight recorder and the of course, the mission control. But right now we're going to focus on some of the command-line JVM monitoring.

So in this lesson, we are going to monitor the JVM garbage collector with command-line switches. We're going to look at few of them and monitor the JIT compilation, identify the running JVM with JPS and JCMD. Get some JVM details with the JCMD, and of course, monitor the JVM with jstat.

Why are we monitoring anyway? So the idea is to understand the problem, identify the symptoms of poor performance, and based on the symptoms diagnosis, diagnose rather the problem, we'll go ahead and make decisions in this case. It's kind of like going to a doctor. You do all serious type of testing. It could be blood testing, and it could be some MI testing and CAT scan. And then based on that, they can go ahead and make a decision on the type of treatments the patient will have.

So what is it that we need to monitor? Well, two major areas to monitor in the JVM level would be what? Garbage collector and the JID compilation. And the data of interest that we're looking at in this case, or looking for, would be frequency and duration of collections, Java heap usage, and number of application threats.

Here are some of the tools for monitoring the garbage collection. We're going to look at the dash verbose gc, the print gc time stamp, the print gc detail, the print gc application stop time and concurrent time, jstat JPS command line, and some JIT compilation monitoring. Let's start with the dash vebose. This is a really an interesting type of command. It actually gives us information in this case, about the size of the heap before, the memory before garbage collected and after by garbage collected, the overall size of the heap, and then how long the garbage collection it actually was running. That's basically what it is.

And we do have actually an example about that. Let's start the first one here. That's the examples in the lecture. You can open them, by the way, in your lab machines. And you see now-- I think I copied the wrong one. And let me do it again.

I need the dash verbose. And so let me run this, the dash verbose. So let me close this one here, and then try it.

And if you take a look, you will see actually here, the heap. And let me just stop it. So you see you got the size before the memory, before garbage collector, after. And then the overall size, and then how long for the garbage collector it took in this case.

And you see here for the minor garbage collection. And then for the full garbage collection for the tenured generation. As you see here, it takes longer to run the garbage collection on the tenured generation rather than in this case, the young generation, which makes sense.

We also can make use of the print gc time stamp. The print gc time stamp will also in this case, will print how long the application has been running. That's also very, very useful. And you can run this using the example, which is a print gc time stamp. Here it is.

And let's go ahead and run it. And this time, not only we get the how long the garbage collection was working, but also how long the application was-- Oh, actually this is the print gc date stamp. This actually gives us also be a date and time. That's what we're looking for. And so you can actually use the time stamp, which is this one here.

And let's go ahead and run it. And that tells me how long the application is running. See? On the right side here. So that's basically what it is.

Let me stop that. You guys going to try this in the practice. And then when you use the print gc date stamp, we'll also print the date in this case. And it gives you the whole date here.

So you can combine print gc date stamp and time stamp. And this will give us the date and also how long the application has been running. That's basically what it is.

Plus of course, the post time is also presented in the garbage collector, like for example is this one here, what you see here. And it tells you about both. If you take a look here, we've seen examples where it tells you about the full garbage collection too that you see here.

Another command, which is very, very useful is print gc detail. This actually is widely advisable for many, many of our clients and engineers to use that just because this print gc detail will give you more information which is related to the younger generation, to the full generation, and to the permanent generation. So in a sense it will go ahead and look at the young generation, the tenured generation, and the younger generation here, and the tenured generation, and the permanent generation. Gives you lots and lots of information.

And we can look at it here. And we choose the print gc detail. This is the last one here. And let's go ahead and just try it. And as you see here, it gives me lots and lots of information related to, in this case, the young generation, the tenured generation, and sometimes the permanent generation too.

And if something happened in the permanent generation, you can actually see that too. And that's what we see here. And I can go to the transform and just play with it a little bit. Add some string and images and so forth, just to make it a little bit interesting. And you can see that.

And basically you can go ahead and look at time related to the tenured generation. And sometimes you also see a information related to a permanent generation.

So these are excellent command-line tools for the JVM monitoring. A couple of other ones that are really interesting is the print gc application stop time and the present gc application concurrent time. The printer gc application start time-- this pretty much present the amount of time an application has been paused for a safe point operation. In the print gc application concurrent time, this is the amount of time the application runs between two save points. In a sense, it's been running without being interrupted by another garbage collector.

These objects can be helpful when you tune your application that are sensitive to post time. It's really, really useful. And you can, by the way, try them in your practices. And at some point in time they'll ask you to run them. Here's the example of both concurrent time and start time.

And you can run them here. Here's a command. Pretty much gives you lots of information related to the start time, concurrent time, and so forth. He's going to try this in the practice. And that's what we're doing here.

So we can also look at monitoring the JIT compilation. They are tools for monitoring JIT compilation like jstat, jconsole is another one, visual VM, visual gc, and so forth. So I can go ahead, and for example, start the application. And then let just open a second tab here. And let me start, in this case, your application, just to the application.

And then here I want to start the jconsole. And the jconsole is another tool that you can start. And let's go ahead and start that for the two connected to the 2D application. And we see now it gives you memory usage, graphics thread, behavior, classes, and of course, CPU usage, and so forth. And you can play basically with the application, and then see what type of output you will have here on, in this case, the jconsole.

I can focus on memory. You can focus on the threads. You can focus on the classes. And the VM, in this case, summary, it can take a look also at the VMs that you are using. So this is also a good tool that it might be a good idea for you to try.

And it helps in the JIT monitoring. Visual VM, you can also make as a visual gc. The print compilation can be, again, in this case, a mildly a little bit of a intrusive 2% of CPU.

DTrace is another tool we don't cover this in this lesson, but it's another tool that Oracle has. It was created at Sun Microsystems. And the date of interest, when it comes to a monitoring the JIT compilation, is frequency, duration, possible optimization and de-optimization cycles, and of m failed compilation, here's an example where here we show you some blue text added to the output here that tells you about that equals that keeps on a optimize then the optimized again and again.

So in general, if you have these steps, especially on the older version of the JVM, you have this type of a problem, it might be a good idea to exclude that method from the JIT compilation. So to turn off the JIT compilation in the specific methods, use again-- it's used very rarely. Especially in the latest JVM, we don't need that. You get into the hotspot compiler file, and that's when you go ahead and exclude those. So JIT compiler is a basically a de-optimization re-optimization cycle.

And we do not again, if reducing bad code, that might be a good idea to disable that method. Here's how we disable it, by doing and excluding then, the path to that method, for example here, Java.util.hashmap clear. You can go ahead and exclude that.

In general, like I said, you rarely do that. And especially in the latest JVMs like 7 and 8, you don't have to do that. It's all [INAUDIBLE].

JPS is another command utility that helps you find Java processes that are running. It's included in the hotspot JDK. And it's capable of local and remote monitoring to find out how many Java processes are running. It's like similar to PS in Unix.

jc command is also another utility to send diagnostic command to a running JVM. It gets a list of the PIDs again, as JPS does, and provides a many query options for running JVMs. The basic usage is in JCMD or JCMD PID command, you know, and so forth.

Here are some list, getting a list of options in this case. So you pretty much can run it using the help. The VM uptime, the VM command line, the VM version, and the system properties, and so forth. Or if you use the thread print, it will show all dead logs if they exist for the threads. Here's an example where you look at this gc class histogram.

That also gives you a very interesting type of information. When you got your const method class, and your instance class. In this case, your constant pool cache class, and so forth.

Jstat is also a very interesting command utility that runs on a local or remote JVM. It included in the JDK. This also gives you a very, very interesting statistic information about the CPU use, or of your Java processes running. You can run it with different type of options.

Like I showed you earlier in this practice, you will get to try all these type of command-line tool for the JVM. And you can run it on basically by getting the gc ware [INAUDIBLE], or the print gc times, the print gc dates, the print gc details, which gives you more information about the young generation, [INAUDIBLE] generation, the permanent generation. You can also run it for to get the application start time and the application concurrent time and so forth.

So at some point in time, we look at these practices. And that's pretty much what we wanted to say about this lesson. Basically we went through the JVM garbage collector at command-line.

And we looked at examples. And that of course, you folks are going to run in the practice. Thank you.

## 2. Practice 5-1: Using –verbose:gc; Practice 5-2: Using –verbose:gc with the G1 Collector; Practice 5-3: Using -XX:+PrintGCDetails; Practice 5-4: Using -XX:+PrintGCDetails with ConcMarkSweep; Practice 5-5: Using -XX:+PrintGCDetails with the G1 Collector; Practice 5-6: Obtaining Application Stopped Time; Practice 5-7: Using jstat to Monitor GC; Practice 5-8: Examining JIT Compilation Activity - 24m

Now that we are done with the lecture of lesson 5, let's go ahead and take a look at these practices. We start with practice 5-1 where in this practice, they want us to obtain and interpret GC output that is produced by the dash verbose calling GC option of the Java command. So in the task we going to run the command.

And by the way, we are going to use all these commands which are already inside. You just open them. They are under the practice 5. You just going to right click and open them using the G Edit. That's what I did.

And I'm going to start by running the first command here. And that's what I get here. Of course, I stop it and just show you the output here. So going back to your practice, they want to tell you to observe a command-line window for output after launching your application. They want us to click on the transform which I did.

And basically when you run your application, the dash verbose-- And then once you have it, you click on Transform, let it run for some time. And then you can go ahead and close it. And then we can look at the interpretation of the output. So basically it gives us here the time-- the time since the application was running, the size of the, in this case, size before garbage collection, other garbage collection, and the overall size, and how long it took in the garbage collection, for the garbage collection to take place. And that's what you see here.

And this is related to the garbage collector for the young generation. And then of course, for the full garbage collection, which is related to the tenured space. That's what you see over there. And you, of course, do a little bit of reading here, because pretty much they tell you every line of the output indicates the garbage collector has done some work where again, in this case, you have the first line, which is the number of seconds for the application was running, and how long the garbage collection was running. And you can do that for the young generation and for the full garbage collector, which is for the full generation.

That's basically what they want us to do in this practice. And continuing with that, and you will see there is a whole list afterwords. I just stopped it. And that's what they show you in the next page, where pretty much again, we should note is that there is an increasing trend of Java heap space usage, culminating in the full garbage collector, and then repeating itself several times. Tuning Java heap spaces would likely help the performance of this application.

And that's what more or less the trend shows us here. So all of this, by the way, whatever they ask you to read is really quite important. So go ahead and read through it, because it helps you understand the concepts of all these commands that we are running.

In practice 5-2, here we can obtain and interpret the garbage collected output produced by the GC verbose option of the Java command-line by using the G1 GC collector here. So if we go back to our labs, and pretty much in this case there were clear. And then after that, go to the second one where this time started actually we are going to do it using the G1, 5 to G1 GC, but using the print GC time stamp also for the year for the G1 GC And we run that. And that also gives us some information. Always on the transform.

And we see some information happening over there. And so we observe the command, and click on transform. And then of course, GC output interpretation nodes, that's what you see here. And that's what we see here. And I can always do a control-C and stop it.

But then of course, going back, this is exactly what it shows you. And that's what you see here. Of course, we notice that all the stages included in the system guide are shown in the output. Some of the descriptions, they show you some of the descriptions, if you go through all of these, where in this case, you have the scan survivor regions for references to the old generation. This happens while the application continues to run.

And you can find the live object over the entire heap. Again, this happens while the application is running. Again, we would also look at the cleanup in this case. And basically, if you follow here, the mark-- every mark, and so forth. If you let it run for a longer time, again, you can see all kind of mention related to-- which by the way, is all interpreted here in the practice.

In practice 3-1 they want us to do a the print GC detail, which is quite interesting. So let's go ahead and try that, the print GC detail. We can do a clear before that. And then of course, a run it, just using the print GC detail, which, by the way, will give us lots and lots of information. We click on Transform here, let it run for some time, and just read it through here.

So every line of the output indicates, in this case, as you see in this practice, indicates that the garbage collector has done some work. Again, these lies are interpreted again, as follows where the GC label in the first column of the output indicates that a minor garbage collector was performed. Other values for the first line are full GC, indicating the full garbage collector event. And the full GC system indicating that the full garbage collector was provoked by a explicity Java source code, code for the system.gc in this case. Again, going back to what you will see that it's still running.

I can always stop at Control-C, just because we have enough information here. But you can have it go in as fast, as far, as long as you want. We've got no problem with that. And that's basically here, you're trying to-- can I explain to you the information similar to what you have seen, and where you look at the output portion of the DefNew, which indicates that the minor garbage collection eventually recovered about 90%, 98% of the young generation heap space and took up approximately 46 seconds. You can actually follow this all in your lab machine.

And you read through all of this basically, and it gives you lots of information that you could read for about the full garbage [INAUDIBLE] indicating and the full garbage collector, or the full GC indicating that the full garbage was provoked by an explicity system GC. And you look at the DefNew indicates the young generation collection, the tenured indicates the old generation collection, and the permanent indicates a permanent generation collection and so forth. This, you will again, get a follow. Or you will see just by looking at here's the tenured. And sometimes you have the full and the permanent generation you answer for.

It all depends on how long you've been running this application. If that's what it is. And that's again, looking at the collection patterns to watch for. When examining the garbage collection output you should watch again, frequent collections and or increasing all generation heap sizes. You can actually look at the full garbage collected events that include system label, indicating that the application is explicitly calling system.gc.

Permanent generation being resized could mean explicit resizing or permanent generation might be useful. And of course, many or lengthy full garbage collector indicate an application in need of Java heap space tuning. And of course, when finished, exit your to the application.

And that's what you did here. You can let it work all the way, and then get all that information. That's pretty much what they want us to do in this practice.

In practice 5-4, they want us to, in this case, use the print gc detail with the conc mark sweep. And this would be in 5-4 using the conc marks sweep. Pretty much the same except but here we using the conc mark sweep. So we can do a clear in this case. And then we can run it using the conc mark sweep.

Let me try it again. Oops, there's a typo. So let's go ahead and do it again here. Unable to access Java. There is a typo here.

So we need to fix that. What we could do is we can go ahead and use the first one and then change it with the uses conc whoops mark sweep GC. And that's basically-- We'll go ahead and run it again. In this practice, there you see the output. And then you do a little bit of interpretation where you look at again, at each line of the output indicates that the garbage collection has done some work.

And look at the CMS permanent indicates conc mark sweep collection activity in the permanent generation. CMS initial mark indicates the start of the concurrency. The conqueror mark indicates the end of the concurrent marking phase. CMS concurrent-- a pre-clean indicates work performed concurrently in the preparation for the remark.

Again, we should note that a minor collection occurred concurrently with the CNS remark. And that's basically what they want us to look in this practice. Of course we'll stop it whenever we're done. You just follow these.

And then after that in a practice 5-5, they want us to use the print GC details for with the G1 collector. They wanted to do it. But we using in the G1 GC collector. So we do a clear here. And then we go ahead and run that.

And that's basically what we have here. That's what we have here. So GC output contains lines such as like what you see here. That's what we saw at the beginning. And of course, they want us to do the typical log and evaluation pause, in which again, live objects are copied from one set of regions to another set.

It is stop-the-world activity. And all the application threads are stopped at a safe point during this time. This is the highest level of information telling us that it is an evacuation post that started at a certain number of seconds. And GC is still running. And of course, they want us to pretty much look at the parallel time in a total elapsed time span by the other prior GC workers threads.

And it gives us basically the time span by every worker threads counting the root global registers, threads, stacks, and VM data structures. And we follow through this and get all those [INAUDIBLE] information, the process buffer at discount rate, the object copy, the termination, termination attempt, and so forth. So that's pretty much allows us to do a little bit of detail. So it's good to read through all of this and understand the data that you got from there.

And then after that, they want us to try a practice 5-6 where we want to obtain the stop time. So let me go ahead and close this application and do a clear. And then this time they want us to, in this case, look at number six, where we want to look at the stop time. There is a typo here. I can see where is the typo.

And that pretty much also lead us to run it and then observe the command. Again, observe the time. So I can see that. And then of course, after that we shut down your application. That's basically what we have.

And now is what they want us to do in practice a restart your UGV, but this time using the conc marks sweep. Pretty much the same concept. So you can do that, but this time using the conc mark sweep. Let's go ahead and do that. And pretty much the same thing.

And we want you to read through that and observe again, what happened in terms of the output. Keep an eye again, on the time on the output here. And that's what they want us to do. Let's just go ahead and stop it here.

And the idea here is you should observe an output similar to again, what you see here, the application thread steps, stop pause about a seven seconds. The application run for about 90 minutes, seconds since the last GC. And when we're done, you exit the demo. So we already done that. And in 5-7 they want us to run this command.

Let me just do a clear here. And run it is an [INAUDIBLE] then here. So we run that, our application. And now after that, they want us to do a JCMD. So we'll go ahead and do a JCMD.

--a new tab and run a JCMD. So we have it here. And then after that, they want us to do a jstat, and a minus GCU-- let me go back and write it down nicely-- minus GCUT. And then the 10189, and then area 1,000. That's what they want us to run.

And that of course, we observe the command-line output. And here it gives me the survivor information, Survivor 0, Survivor 1, the hidden space, the older generations, and the permanent generation. That's what I have here. And of course when I'm done with it, I will just stop the application. And then, the last practice of this lesson is examining the JIT compilation activity.

Again, here for background, there are ways to monitor hotspot dynamic JIT compilation activity, although the result of dynamic compilation result in a fast running application. Dynamic compilation requires computing resources such as CPU cycles and memory to do its work, therefore it is useful to observe dynamic compiler behavior. Monitoring dynamic activity is also useful when you want to identify methods that are being optimized, or in some cases the optimized and the optimized. The method can be optimized and optimized when the dynamic compiler has met at some initial assumptions in an optimization that later turned out to be incorrect. To address this scenario, the hotspot dynamic compiler disregards or discards the previous optimization, and re-optimizes the method based on the new information that it has obtained.

So here they want us to run the Java demo using the last command, which is this one here. Let's go ahead and do that. So let me just make sure that I do have-- I think I do have a typo here. If it doesn't work, then you just need to delete this. And then put the Java file like that.

And this would make it work. Cause he knows some of the dashes is longer. That's why it doesn't work. And then after that they want us to launch the visual VM, J Visual VM. So we try to launch that.

And that's always starting. And then of course we open the 2D. So here it is. In here, basically showing us the compile time. So when we watch the compile time graph on the right, we observe a spike or a blip associated with every line that a compilation activity takes place.

That's basically what you see here. So we quit the Visual VM. And then after that we run the JCMD. And then after that, we'll go ahead and do a jstat.

And minus a print compilation minus print compilation space, and b 1010269 and than 1,000. And then here we see again, in this case, the print-- the JIT compiler method in every 1,000 milliseconds duration window, this information is of limited interest because indicates merely that the JIT compiler did something. And that's what you see here.

And that's pretty much what they want us to do in this practice. And this of course, we can go ahead and do the same thing, restart the Java 2 demo with the print compilation. And then of course, look at the output, just so we can have another idea if you want to do that. And that's pretty much what they want us to do for these practices of, in this case, less than 5. Thank you.
