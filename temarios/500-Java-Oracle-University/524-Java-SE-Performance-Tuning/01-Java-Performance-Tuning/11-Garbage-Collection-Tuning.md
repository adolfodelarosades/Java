# 11: Garbage-Collection Tuning

1. Garbage-Collection Tuning - 22m
2. Practice 11-1: Using JVM Heap Sizing - 7m
3. Practice 11-2: Using GCHisto - 5m

## 1. Garbage-Collection Tuning - 22m

Let's take a look, now, at garbage collection tuning. In this lesson, we are going to tune GC by setting GC generation sizes, compare different HotSpot garbage collectors, select the HotSpot garbage collector based on my application performance requirement, and use tools to monitor GC and interpret the output.

The main advantage of a garbage collector is not having to deal with memory management, like the C and C++ language. Of course, to tune the JVM garbage collectors, you need to understand the basics of how GC works. And lots of times, we have this myth where programmers say, I thought I did not need to worry about memory allocation. Java does that for me.

We, as performance-tuning engineers, we typically answer by saying, most people have the same perception. It is kind of both true and false, except that Java performance much low-level memory allocation and deallocation. And it also comes with a garbage collector, fine. But, however, Java does not prevent you from using excessive amount of memory. That is up to you. OK?

So we know about the size of the heap, Xmx, Xms, the new size, maximum new size, maximum permanent size, permanent size, and so forth. These are, basically, the heap parameters that we have seen earlier, that Xmx specify the maximum size of the heap, Xmx, the initial size of the heap. Xmn sets the initial size to the maximum size. And then you have the bare max permanent size, the permanent size, max new size, permanent new size, and the new ratio, and so forth.

We also seen have different type of heap-sizing tools. We've seen VisualVM, mission control flight recorder, JConsole, VisualGC, PrintGCDetails, -verbose, jstat. We're going to see the GCHisto in this lesson.

Of course, the Java garbage collector, we know that they are serial garbage collector throughput, which is a parallel garbage collector, parallel, parallel compacting. The concurrent collector, which is the CMS, the G1 garbage collector, these are, basically, the ones that we've seen.

And let's take a look, now, at the performance choices. Again, the major factors that influence the choice of a garbage collector would be throughput or responsiveness. We know for the throughput, we're really focusing more on how much work can be done in a given interval of time. On the other hand, the responsiveness is maintaining an elapsed time limit in which the application must respond.

So if we look at the serial collector, we can go ahead and enable it using the UseSerialGC. It's a single-threaded type of young generation collector, single-threaded old generation collector. And it's typically appropriate for a single processor type of core machines, or may be appropriate for configuration of one-to-one JVM to process core configuration. Tends to work well for application with small Java heaps, like 128 megabyte, may work well for a heap up to 256 megabytes. But is really for a single type of a set processor or mapping a JVM per CPU.

So in terms of performance tips, we say that a good throughput performance can be realized with a serial collector. Of course, you have well-tuned type of Java heap, now smaller, like 100 megabyte. The target platform has a small number of virtual processors. And the number of JVMs deployed on a multi-core platform is equal to or greater to the number of multi-core processors.

You can also use the throughput collector. Throughput collector is by making use of the UseParallelGC, which is, basically, running it in parallel without compacting, or UseParallelOldGC. That actually also does the compacting. OK? Actually, the UseParallelOldGC enables the UseParallelGC for the young generation too. This, basically, is useful for significantly reduces garbage collection overhead on multi-core processor systems as they execute in parallel. It's appropriate for applications that are running on multi-processor or multi-core systems.

In terms of the configuration, you can go ahead and, basically, also select how many parallel threads you can use. That's using this command here. You can also find out about how many available processes you have, just by calling the runtime on available process method.

In JDK 6, the number of threads created will be the 5/8, the available number of processors. In JDK 7, the number of threads is equal to the number of processors. So in your configuration with multiple JVM per machine, you go ahead and set the parallel GC threads to a lower value. And if you do that, then it's likely to yield better results.

In terms of performance tips, we tell you that a good throughput performance can be realized with a throughput collector, which is parallel collector. If pulse-times requirement are less important, which means really, really applied for a throughput type of application, which are batch-type of applications, Java heap spaces are well tuned and the application runs on multi-core. OK?

If the full garbage collector cannot be avoided, the multi-threaded old generation collector can reduce the length of your full garbage collection, especially with compact. That's why use the UseParallelOldGC, so which means the parallel throughput, in this case, a collector, is useful for throughput type of applications or batch type of applications.

How about the concurrent mark sweep? OK? This can run in parallel, multi-threaded young for multi-thread young generation. And this is well-suited for responsiveness type of an application. Why? Because it actually runs while the application is running, where you have, in this case, less, in this case, garbage collection type.

The cost of the concurrent collection is you have an additional overhead, about addition 20% of the old generation space. The concurrent mode failure also can happen, OK, where you can go ahead, in this case, and have-- and let me just show you an example where you have, in this case, more of objects are being promoted to tenured, compared to the how many, in this case, objects are being picked up and processed, and so forth.

So this, in general, this actually can cause a problem, which, by the way, can cause a problem. And that's called losing the race where not enough objects are being garbage collected from the tenured space, compared to the number of objects that are being copied from the survivors to the tenured space. That, actually, can be a problem in general.

The initial fraction from where the CMS starts running is about 60%. When the tenured generation is about 60% full, then the garbage, the CMS, starts working. And sometimes when it starts working, it does not, in this case, collect more objects than the number of objects that are being promoted, in this case, from the survivor to the tenure. And that, actually, can be a problem. That's why we say concurrent mode can happen when objects are copied to the tenured space faster than the concurrent collector can collect them.

This concurrent mode failure can also occur from tenured space fragmentation too. And in general, there are different solutions to solve this problem. In many companies what we do is instead of having them, the CMS starting out when the tenure is fall 60% full, we'll try to reduce it to maybe 50% or 45%. And then you can go ahead and start that.

So, again, looking at the considerations and looking at events that initiate concurrent collection cycle, ideally, the cycle needs to start early enough so that the collection finishes before tenured space becomes full. The concurrent collector also starts if occupancy of the tenured space exceeds the initial occupancy percentage threshold. And that's the 60%. So it might be a good idea, in this case, to instead of starting when the tenant space is filled 60% full, why not start at 45% or 50%?

Looking at the consideration for sizing the heap, size for young generation as large as possible, because then, you don't have to pressure the, in this case, the tenureship of those objects to the tenured generation or the old generation. Consider pulse-time requirements. And a small young generation puts pressure on the old generation.

That's why it's a good idea to try to make the young generation as large as possible. And consider heaps profiling, also. Choose tuning survivor spaces to be able to, in this case, find out what's the rate that we're going through by tenuring these objects from the survivors to the tenured generation.

Classes in the permanent generations are not unloaded by default. So for an exceptional case, you might do an explicit GC. And for small Java heap, pulse-time requirements can actually be achieved by using the serial connector. So in terms of the performance tips for concurrent collector, we tell you that good responsiveness performance can be realized with a concurrent collector if pulse-time requirements are more important than throughput and Java heap space are well-tuned and, of course, the concurrent collector is multi-threaded on the young generation collector too.

And, of course, the last one, so the concurrent CMS is definitely good for responsiveness [INAUDIBLE] for an application, like web applications. G1 is fairly new. G1 was created using Java SE 7. It's enabled with a -XX UseG1GC. It's parallel and concurrent young generation collector, single-threaded old generational collector. If application is fully properly tuned, full garbage collector should be avoided. And it's really created for long-term replacement of CMS.

It typically uses the regions. We divide the heap into regions. We already have seen that when we defined the G1. And for multi-processor machine with large memory heap, size of 6 gig or larger, and stable, of course, predictable type of pulse-times. And G1 not a real-time collector. So it needs the set of pulse-times target with a high probability, but not absolutely certain.

Again, in general, the best practice is for G1, do not set the size of the young generation. Let the economics choose that for you opposite of the other collectors. It disrupts the G1 pulse-times goals and prevents G1 from sizing young generation as needed.

Use, again, 90% goal instead of average response time. OK? This, we have the max GC pulse milliseconds, which is the default is 200. Only 10% of responses do not meet the goal, resulting in more consistency than the average. A low pulse goal result in a higher overhead, related to the garbage collector. So the throughput decreases as pulse-time decreases.

In terms of the evacuation failure, the G1 also has its own problems where sometimes, you don't have space where to evacuate or to copy those regions that survived, that basically, are still, in this case, referenced. So you can use a PrintGCDetails. That pretty much reports the two overflow to a space overflow. This typically expensive, so you want to avoid that.

To evaluate evacuation failure, which means we don't have space where to evacuate the objects that are survived, in this case, or if you want that are still referenced, so increase the heap size by using the [? G1ReservePercent. ?] OK? G1 creates a false ceiling by trying to leave the reserve memory free if more to-space is needed.

And start the marking cycle earlier so that you don't have to get into these type of troubles. And increase the number of marking threads by using the ConcThreads, GCThreads. And then you can choose the number. It depends on the application. You can also work with the initial heap occupancy percentage. That, by default, is 45%. See, in the SE 6 it was all 60%.

The G1oldSetRegionLiveThreshold, this is also useful for occupancy threshold for region that is a good candidate for inclusion. In the mixed GC, default is 90. And the G1MixedGCCountTarget, this, basically, gives you the maximum number of mixed GC to be performed after the marking cycle. Default is 4. A value of 4 means 1/4 of the old generation are collected during the mixed GC.

The initial heap occupancy, like we said, by default is 45%. Again, observe old generation heap occupancy. That's also important. Do not start marking too early or too late. This results in a spinning, which, again, reclaims too little or in to-space of low evacuation problem too. So you want a reasonable amount of memory reclaimed.

We can see an example where a customer is experiencing too many mixed GCs. There is a large amount of unused heap size or other heap space. So you set the initial heap occupancy percent to 70. This increases the throughput and reduces the concurrent overhead. Again, setting a value too high result in the to-space overflow. Be careful with that.

The G1OldSetRegionThresholdPercent, the default is 90. Here's an example where we said a customer is experiencing long mixed GC times. Drop the value from 90 to 65. This will mixed GC times drops from 300 milliseconds to 200 milliseconds.

For the G1MixedGCCountTarget, the default is 4. We can show you an example where a customer mixed GC times are increasing with every mixed GC. Worst case, almost 1 second to complete. That's a lot. Increasing the value to 6 reduces the number of old regions collected to only 60%. This reduces the mixed GC types. So these are just different type of options that you can go ahead and use in the G1GC. OK?

Another question that people always have is about the permanent generation. And a lot of people say, well, how about the permanent generation? Would we also be able to do a little bit of, in this case, work to help in the permanent generation? That's basically what I want to discuss.

And so we can tune the permanent generation. And programmers have tended to ask this question. Do I always have to tune the permanent generation? And we, as Java performance engineers, we say some Java application require fine-tuning for the permanent generation space.

An example, can we see an example? In applications that dynamically generate and load many classes need a large permanent generation space than the provided default maximum size of 64-bit. An example is dealing with JSPs. As you know, JSPs are automatically compiled into servelets by the container. So that, sometimes, you might make sure that that takes, of course, a lot of object from JVM to handle that. And that might need a little bit of tuning on the permanent generation.

So the question that we typically have, how do I tune the permanent generation? Well, you can go ahead and perform a bunch of steps, like observe the sizing behavior of the permanent generation. You can increase the size of the permanent generation by setting the max permanent generation. You can also collect the permanent generation by using the command CMSClassUnloadingEnabled. That pretty much will, in this case, [INAUDIBLE] the garbage collector to do a permanent generation.

We know about problem of losing the race is this is where we are not collecting enough objects, more objects than the ones that are being copied from the survivors. You can actually see a concurrent mode failure that can happen when objects are copied to the tenured space faster than the concurrent collectors can collect them. And we can see an error like this, for example, where you have promotion failure.

Another very, very useful tool that we can use is the GCHisto. This is an open source type of a tool that enables comparison of JVM tuning, such a heap sizes or collector types, by comparing the GC logs. Again, the tool summarizes the GC activities obtained from the GC logs. And you guys are going to try this in the practice.

So once you get into the write directory, you start your GCHisto. And then over there, you can go ahead and add the log files. It turn out that we have bunch of log files here that you guys going to try with. And so here, basically, gives you the statistics in terms of the number of, in this case, of the garbage collection, and the total GC, and the average, and the sigma value, and the minimum and maximum, and so forth.

And you can also look at the GC distribution. Here is showing you young and full generation. I can go ahead at look at the full generation. I can also look at the young generation. I can combine both of them. OK?

I can also look at the GC timeline. I can look at it from the full generation file by itself. Or I can look at it from the young generation by itself. Or I can combine them. OK? So you guys get to try this in the practice. And that's pretty much what I wanted to say about this lesson.

## 2. Practice 11-1: Using JVM Heap Sizing - 7m

OK, now that we're done with the lecture of lesson 11, let's go ahead and look at these practices. We'll start with practice 11-1. Here we are going to use JVM heap sizing. In this practice we run the Java2D and try to tune its GC spaces, tune the heap for a serial collector, a concurrent collector, and throughput collector.

The goal is to size the GC heap spaces to avoid the full garbage collection and to keep the young generation and minor GC events rather short. For a GUI application, responsiveness is important. So keep pause times to a minimum. If this were a batch processing engine, pause times would not be an issue. Instead, the focus would be on raw throughput.

These are two different goals and require a slightly different strategy when sizing heap spaces. It is important to note what our goals and pause time requirements are for an application before starting the tuning practice. Again, in tuning Java2D, the goal is to minimize pause times to under 10 milliseconds and avoid all full GC events.

Here we're going to start to the 2D application. We know that Java2D does explicit GC calls by using system.gc to keep the 2D application from responding to those explicit calls at, again, the disable explicit GC. That's what we have.

So we go ahead and first run the application here, using the GC and PrintGCDetails. That's what we want to do. This would be in the first one here, and that's what we see as an output. Again, following here, basically the steps that they're asking us to do-- so we should remember that a permanent generation space may be resized, therefore use a tool to monitor permanent generation Java heap space. And then adjust the size, a permanent generation space.

Remember that you have to set both the max permanent size and the permanent size. You may be able to get by just sizing the permanent size. OK, we should note also that if the young generation or minor collections are too lengthy, you may need to set the young generation space size. You can experiment with sizing the young generation to see what impact it has on the GC types.

And of course, you can try sizing it larger or smaller to see the result, OK? That's basically what they want us to do. And here we see basically the output here, OK? And then we can always change this any way we want, OK?

And again, when we try to a size in this case, or changing the sizes, it will likely affect how often the GC event happens or occurs and how long it takes to perform the GC. And that's what we see here, OK? So here, basically, we have the-- since we do the GC [INAUDIBLE] in the command we have the-- in this case, we're making use of the dash for both GC and the PrintGCDetails. And that's what we see here, OK?

We'll go ahead and stop this application, OK? And then going back to the practice, what we're going to do is repeat the preceding steps by using VisualVM, OK? So let's go ahead and do that. I'll jump to the second one here, tab, and then run the command that they want us to run here, which is this one here, OK?

Let's go ahead and do that. And of course, we now will open the J VisualVM. OK, let's go ahead and open that. So basically, we're repeating, but this time we're using the VisualVM. That's what we're doing, and we're just waiting for the-- and then, of course, here under the application, under Local, we go ahead and right-click and open that.

Here, of course, we're using the Disable Explicit GC, which, by the way, we have it here by doing that. So we already can run that. And then we can use it, and then we see again the behavior of this, using the VisualVM, OK? All right, and see the heap sizing here.

And we can always go to the next one. We'll switch to using the concurrent collector. In this case, we're using the serial. But this time we use the concurrent collector. So let me go ahead and, in this case, close the application by, in this case, doing a Control-C here.

And then go to the third tab, and that's where I have the third one. I use the concurrent mark. So I'll go ahead and hit Return to start it. And then, of course, we'll go ahead now and go back to our, in this case, a VisualVM and open it, OK? And now it's opening a new tab.

And then we'll see, of course, the behavior of that. So we should note that with the concurrent collector, you need a larger overall Java heap space. But you may be able to use a smaller young generation space, and that's what we see here. The behavior, again, here showing us between what I used before, which is the serial collector, and this is the concurrent collector. And you can compare the numbers, OK? And that's basically what they want us to do for this practice.

## 3. Practice 11-2: Using GCHisto - 5m

Let's go ahead now and look at the practice 11-2, where we use the GCHisto. Here, basically, we use the GCHisto to understand the GC statistics gathered from running an application. So here we're going to go into the directory GCHisto. And then from there, we're going to run the GCHisto application.

I'm already there, and I'll just go ahead and start it. So here we're starting the GCHisto application. So they want us to add the-- so we're going to click on the Add button and then load the GC Logs, the 4.txt. OK, we'll go ahead and open that. And here, of course, we have the GC [INAUDIBLE] pane, and so here it is.

And here we basically look at this tab. This pane shows some GC statistics, the GC number, total number and so on for the loaded traces and broken down by GC types getting together all young generation full coverage collection, you know, and so forth. And we can look at the GC Pause Distribution pane, this one here. And this, basically, here shows the pause time distribution for the loaded traces with one subpane per a loaded trace.

A set of check boxes on the left enable you to make individual, in this case, selections and so forth. And then after that, we have the GC Time Pane, and this shows the GC Time Pane for every trace with one subpane per loaded trace. A set of check boxes on the left enables you to see the individual ones and so forth. And then you can combine both, basically, here. And you can zoom on any one of them and get all kinds of information.

You can do the same thing, by the way, by in this case going back and loading the other ones-- the number 1 in this case and with the different tabs. And then you can go ahead and load number 2, pretty much the same thing also, where you have also the different type of information. You can also load the third one, and then this will also give you more information about the young, the full coverage collection, you know, and so forth.

OK, so you can go ahead and look at all of them. And then compare them, if you want, just to look at the data. And as optional, you can always look at the [INAUDIBLE] Trace Management, and then add some [INAUDIBLE] files and then the GCHisto. So add, and then we can go ahead and look at more.

And underneath, you can see now here the different ones here that you can take a look at. This also I will soon show you some more information and so forth. We can also do another load. This is optional, but you can always try it. And so when you select them, you have all kinds of data in this case.

OK, and you can always add this one here. And we'll see again the initial mark and remark and the full coverage and so forth. So you've got all kinds of information-- just you can see more or less what you want to see, OK? You can explore and compare the behavior of these three [INAUDIBLE] collection configuration and determine which performs the best by looking at the numbers in this case. OK, you can select the best configuration and so forth, OK?

And that's basically-- so it just gives you some time to look at the numbers and basically compare all of them. That's the idea behind this, going through every one of them and looking at the different information. And then, based on that, you can make a comparison, which one does better and so forth. And this is pretty much what they want us to do for this practice. Thank you.
