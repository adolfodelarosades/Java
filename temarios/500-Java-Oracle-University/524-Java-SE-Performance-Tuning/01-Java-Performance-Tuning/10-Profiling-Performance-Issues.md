# 10: Profiling Performance Issues

1. Profiling Performance Issues - 11m
2. Practice 10-1: Profiling Heap Memory with jmap and jhat - 7m
3. Practice 10-2: Performing Memory Leak Profiling - 10m
4. Practice 10-3: Using jhat to Detect Memory Leaks - 8m
5. Practice 10-4: Profiling Memory Leaks by Using VisualVM - 7m
6. Practice 10-5: Profiling with NetBeans Profiler's HeapWalker - 10m
7. Practice 10-6: Analyze a Memory Leak by Using MC/JFR - 7m
8. Practice 10-7: Observe Application Contention by Using MC/JFR - 7m

## 1. Profiling Performance Issues - 11m

Let's go ahead now and take a look at profiling performance issues. In this lesson, we're going to profile the JVM to improve application performance, profile applications to find memory leaks, profile applications to identify lock contentions, and identify anti-patterns in a heap profiling.

So the tips for profiling, we could do a CPU profiling. We can do a heap profiling. We can do a memory leak profiling. You could do lock contention profiling. And we can select different type of profiling tools that we can make use of.

So starting with the heap profiling, the heap profiling is necessary or beneficial when, of course, you observe frequent garbage collections and application requires a large Java heap and you want better CPU usage or application throughput and responsiveness. When allocating objects or collecting them takes less time, more CPU time can be spent running your application. And, of course, we know about how the heap is divided into young generation made of the Eden and the survivors and the old generation made of that tenured space and, of course, the permanent generation, which is part of the JVM objects.

So looking at our strategies for heap profiling. Again, the same thing here. We start with a holistic approach to isolate major memory allocators. If a holistic approach is too intrusive, it might be a good idea to profile a subset of your application.

NetBeans, that's an excellent tool, and it's an excellent tool that does an excellent job. And what is it that we're looking for when we do heap profiling? We look at our objects with large amount of bytes being allocated.

We're looking at objects with a high number of object allocations. We're looking at stock traces for locations where a large amount of bytes are being allocated. And we look at the stock traces for allocations where a large number of objects are being allocated.

So again, continue with strategies. Look at cross-reference CPU profiling with heap profiling. Look for alternatives, like classes, objects, or maybe possibly caching approaches, where a high number of bytes is being allocated. And consider profiling what an application is running, because then it gives you-- and then observe.

You can observe the memory allocation and have a good idea. A good example would be either through the Mission Control or the Visual GC or the NetBeans Profiler and so forth. We can do heap profiling with jmap and jhat.

Basically, jmap has the tendency to collect the heap information. And this technique is not as sophisticated as NetBeans profiler, but it's quick and easy. You can go ahead and take snapshots, and it's easy to view and to find out what's going on. You can look also at the stock traces for allocation location.

In terms of strategies, again, for these jmap and jhat, focus on large amount memory allocators. Capture several snapshots. Compare top memory allocators. Again, these snapshots may be intrusive, but overall, it gives you good information about what is it that you need to do to, of course, fix these type of problems.

You can do memory leak profiling. Again, for the memory leak, a situation in which a reference to allocate objects remain unintentionally reachable and, as a result, cannot be garbage collected. So memory leaks typically lead to poor application performance, can lead to application failure, and can be hard to diagnose.

Some of the tools that help us in the memory leak would be the Flight Recorder, the NetBeans Profiler, VisualVM, jmap, and jhat. These are all excellent tools. And you get, by the way, to do a lab about the jmap and jhat in this lesson.

Looking at the memory leaks, strategies for using NetBeans and VisualVM. View live heap profiling result while the application is running. And pay close attention to the surviving generations, where an increasing object age can indicate a memory leak. And, of course, use HeapWalker to traverse object references. You get to do this practice in one of the practices, the HeapWalker.

You can use the strategies for memory leak using jmap and jhat, capture multiple heap profile, and compare footprints. You can use, by the way, the HeapDumpOnOutOfMemoryError. That also can be useful option. And use the jhat query language to query with a interesting state information. The jhat has an Object Query Language, which is kind of similar to SQL.

You can do a lock-contention profiling. Use of the Java synchronization can lead to highly contented locks. So observing high values of voluntary context switches can be an indication of a lock contention. The Flight Recorder is very useful for identifying Java objects that are experiencing lock contention, so that's another good tool. You get to play with this in the lab.

How to reduce lock contention. Make use of the java.util.concurrent API. It's very, very useful. When writes are infrequent, use the ReentrantReadWriteLock. Again, favor synchronized over the java.util.concurrent logs for equally weighted guarded reads and writes.

Sometimes you have biased locking. HotSpot JVM biased locking can also improve synchronized collection performance. You usually use the biased locking, where what you have here is the last thread that-- in this case get the lock will be the one that will get it again.

But in some cases, actually, it does not do a good job and might give you misleading information. That's why sometimes this UseBiasedLocking might be a good idea to unlock it, to rather disable it. Because it's enabled by default on Version 6. Inlining effect. A JIT optimization in which the code from a called method is included in a calling method.

In some rare cases, inlining a produces profiling results that are misleading and confusing. It might be a good idea now to disable the inlining, where a method calling another method. It might be a good idea to exclude and/or look at the methods.

Because sometimes you have a method, A that calls method B and C, which are the worker methods. Method A, all that it does is just call the method. So if you're profiling A, you might be getting misleading information, because maybe the cause is not in this method B or method C.

Some of the anti-patterns that we identified in the heap profiling, which is working with strange collections and control flow. When it comes to a large number of strings or array of characters, a possible overallocation of strings, especially strings are immutable. And you're trying to modify all these immutable strings, you might create a lot of object underneath the hood. Might be a good idea to actually instead of using a string, maybe use a string buffer or a string builder.

But the string buffer and string builder might also have a problem for resizing if you don't choose the right size from the beginning. But in general, if you reduce the array of characters or strings allocation, it's likely to reduce the garbage collection frequency. Look at hash tables, too. Possible candidate for hash map if synchronized access is not required and possible candidate for concurrent hash map if the synchronized access is required. Again, trying to further a partition in your hash table may lead to a fine-grained synchronized access and less contention.

Observing a vector. A possible candidate can be an array list if synchronized access is not required. If you require synchronization, then consider using some of the data structures that we see here, which are part of the concurrency API. LinkedBlockingDeque, ArrayBlockingQueue, ConcurrentLinkedQueue, LinkedBlockingQueue, and so forth.

Allocation of exception objects. Do not use exception in a flow control, in an if/else or in a switch statement or for loop. Avoid in this case using exceptions, because it's going to view a big stack of exceptions, which is very, very expensive from this point of view.

And that's pretty much what I wanted to say in these lessons. In this lesson, you folks are going to do more practices, which are very interesting. We get to look at them later on. Thank you.

## 2. Practice 10-1: Profiling Heap Memory with jmap and jhat - 7m

Now that we're done with the lecturing of Lesson 10, let's go ahead and look at these practices. We start with Practice 10-1, where we do profiling heap memory with jmap and jhat.

Here we're going to run the Java2Demo with this command. And then we click on the Transform, which we already did here. And then, of course, after that, they want us to use the jcmd to get the PID of the Java2Demo and then run the jmap a command, and then after that run the jhat command.

And I've done all of this here. So I did a run the jcmd, then the jmap command, and then of course the jhat command and now the server. And then, after that, basically following the steps, I go to the browser and this is what I get.

I can scroll up and down here, showing you me all the packages and the classes, and so forth, of the different packages. And then of course, following the steps that they're asking us to follow here, they want us to under the other queries, they want us to click on Show Heap Histogram. And that's what we have here, Show Heap Histogram. And then after that, they want us to click back. So this basically shows the whole histogram in this case. And we can scroll down and see all the classes here.

And then they want us to go back. And then after that, they want us to click Execute Object Query language. This would be this one here. And here they want us to basically again, following the steps here, they want us to run this command here. It turned out we already have it written. So what do we do is just copy and paste from here, and that's what we have here.

And then after that, we'll click on Execute. And now you see pretty much following in the book in this case-- rather, the exercise in the activity guide-- we see basically that we can look at it and we can try any one of them in this case. And so all of these are basically-- and we can pick and choose any one of them. So you see here-- and you get the whole list.

We can do the same thing now, but this time we can run this command that selects a S from java.lang.string. And we can go ahead and try that. Now we can look at it, which is already here, or we can just go ahead and type it. Let's go ahead and just type it. Select S from-- and then here, we use java.lang.string. That's what they want us to do, select S from java.lang.string, space S, then click Execute. And this, as you see here, pretty much will show us the whole in this case string component created, and so forth. So you can scroll down and see all of these.

And then, of course, after that we want us to close the browser. And then of course, close the in this case, the jmap/jhat command, which is Control+C here will stop it. And that's what they want us to do, OK?

Now after that, they want us to start the jvisual VM. Let's go ahead and start this guy here. That's what they want us to do. And again, it's the visual VM. We click on the file load, and of course filter by heap dump to find in this case the heap dump information, so just by in this case writing here the heap dump in this case, and that, you see, we find it here.

And so we sign that and then-- so that's what we have in this case to find that. And when we hit Dump Loads, again, we can see that some of these we are going to the click OK. And then we wait a little bit, and then we see the Heap Summary event you see here.

So click on the classes, and this page pretty much displays basically all the Heap Profile per class in a traditional heap profile manner, and so forth. We can right click on any class, any class here, and we can show the instances of view here as an example. And then after that, they want us to basically close the visual VM utility. And that's basically what they want us to do in this practice.

## 3. Practice 10-2: Performing Memory Leak Profiling - 10m

Let's go ahead now and take a look at practice 10-2, where we do perform memory leak profiling. Again, for background, you need to read about this [INAUDIBLE]. This is based on actual usage of NetBeans Profiler as part of the development and testing of production application. So you can read through this, and it gives you good information.

And, well, we say one additional note on the sample application-- it does not require a web server in order to run. An HTTP unit has a nice feature where if what you want to test is the response from a servlet, it can host a servlet for you in the same JVM as your test application. Therefore, the sample application consists of the servlet, and that returns the JavaScript that has an error.

The main method, of course, in this practice demonstrates some key features of the NetBean profile. Anyway, so you open the HTTP unit. I actually opened it, and I found the problem with it. And then I just go ahead and click on Resolve and follow the steps, step by step. And that solved the issue of a resolution, OK?

Now we have it, which is this one here, basically. That's the project, and it has all kind of code inside. And you right-click on this and just following, again, the steps-- that's what I'm doing here, OK, in the tasks. So they want us to, in this case, right-click on this. And, of course, click Profile.

And then we select Memory in this case, and select, in this case, Record Full Object Lifecycle, which is selected in this case. And select Record Stack Trace for Allocations, which is already selected. OK, and make sure that the Use Defined Profiling Point option is not selected, as you see here. And then click Run, OK? And it will go start running again.

We should note that this is a sample test application that emulates the behavior that the developer of this application saw. It basically uses the HTTP unit to process the HTML that is returned by a servlet request being repeatedly sent to the servlet by tests, OK? So click the VM Telemetry Overview. Here's the [INAUDIBLE] that you see here. And so make sure that we use a defined profiling.

So also here, they want us to basically look at the VM Telemetry Overview, which is already here, OK? All right, and that, you see again, we observe the purpose of the-- we can always look at it. Here's the VM Telemetry Overview. OK, this shows us the VM telemetry. But again, [INAUDIBLE] to see basically how the heap now is behaving, what you see here.

We can always click on the Live Results, and that shows me also the live results here. The Live Results window shows activities on the heap. And, of course, the column on the left contains, in this case, the class names, OK? And that's basically what we have here, OK?

And we click on the Generation tab, and in this case, we see the column to sort the display by generations. You should note that two of the classes have huge values for the generation in comparison to all the other classes. OK, there's a lot over there that it would be a nice idea to read about it, OK? [INAUDIBLE] here.

And just so that we can-- now after that, they want us to right-click on the string and select, in this case, take a snapshot to show our location stack traces. So it would be this one here, and then we just did it, OK? And then we select profile and stop the profiling session.

And in this case, that's basically what we're doing here. And then we stop [INAUDIBLE] basically that profiling a session. So we just did, OK? Here's the to string, but they want us to look at it, OK? And they want us to expand it. We should note that the only string that's located in the string builder, to string, with a large value for the generation count are the strings that resulted from calls to the StringBuilder, .toString by a call from the HTTP unit code that you see here, OK?

So we right-click on the main main. Let's go ahead and look at that. OK, going back here, and here's the [INAUDIBLE] unit. OK, we've got all of these now, all these classes. OK, and here's the main main in this case. And they want us to right-click on the main main in this case, and they want us, in this case, to go to the source, which, by the way, we already see here.

We could have done it this way too, go to the source, either way. OK, and so we can go back, in this case, to all the different methods or classes running, in this case, that you see here. OK, and we see all of them here. Or we can go and see them the other way too, OK, either way.

And we examine the different methods here, pretty much. We have basically all kinds of-- we can go back to the top of the stack, and then you can handle script exceptions and so forth. So this is pretty much all by just looking at every one of them and selecting whatever you want to select here, OK?

And if you continue through these basically step by step, next you can go ahead and observe, in this case, the Clear Error Messages and the Find Usages. And click on that, Clear Error Messages, to see source code and so forth. So basically, pretty much the steps are straightforward here, OK?

And after you follow with all of this, finish with all of this, then at that time, you can go ahead and close NetBean and you're done. And that's what they want us to do in this practice. Thank you.

## 4. Practice 10-3: Using jhat to Detect Memory Leaks - 8m

Let's go ahead now and take a look at Practice 10-3, where we use the jhat to detect memory leaks. Here we asked us to go to this directory, which I already did. And then after that they want us to run this command, which I already did. And then, of course, after that they want us to enter the one million here and enter that number, and then click on Calculate Prime Numbers, and that's basically what I did here. And then, of course, the result would be this number here, which I see here on the screen. 999,983. That's what I have.

And then after that, they said click on the prime numbers button repeatedly, and we should be able to, in this case, see an [? R ?] of memory. So if we keep on doing that, we'll get an Out of Memory error, which, by the way, we see here. OK?

And then after that, they want us to go ahead and kill that, so we should be able to kill this. [INAUDIBLE] not killed. OK, That's what we did. OK. And then after that, we look for a file, [? we then h ?] in the current directory. So if we do [? an ls, ?] we should be able to find the file here, which is this one here. OK?

And then after that they want us to run jhat on it. So jhat, and then Java, and that's what we have over there. So we go ahead and run that. Server is ready.

And then after that we open the browser. Let's go ahead and open the browser. And then of course look for that localhost 7000, and that's what we see here. Package primenumbers and so forth. OK?

So here it says, show the [? heap ?] histogram. That's what we see here. It is basically a histogram that we have seen. You can scroll all the way down and see it, OK?

And then after that they want us to go back, and now click on Execute Object Query Language. And here they want us-- so maybe we can find it here, or we can go ahead and look at it here and then write it down. Select, basically following the command here that they want us to do, which is use this one here.

So "select i from" In this case, [INAUDIBLE] where" oops. Space. "Where i length greater than 1,300." OK. Again, the purpose of this step is to formulate an execute a query that identifies [? references ?] to end arrays larger than 13,000, rather, not 1,300. Add a zero over there. And that's basically what we have here.

So the query in this case returns a web page containing references, OK? You'll notice, again, there are two of these end arrays that are referenced by the HashMap entry. Now of course, the next step is to identify who has references to the HashMap entry. So we perform again actions on the HashMap entry.

If you continue to click on the reference to this object-- in this case, it would be this one [INAUDIBLE] the HashMap entry, OK? And so of course, [INAUDIBLE] and you will see again by the HashMap entry might be referenced by another HashMap entry and so forth. OK? That's basically the idea behind this.

Now what they want us to do is open the prime numbers project in NetBeans. So far that we are going to start NetBeans. I have it. [INAUDIBLE] go ahead and start NetBeans and open the prime numbers here.

So we're just waiting for NetBeans to start. There it is. And then we open the, in this case, the project. And then we go up and then go under Prime, and Prime Numbers. We open this one here. That's what we have. Open the primenumber.java and the prime calculator.

So we have the primenumbers.java. There it is. [INAUDIBLE]. And then a prime calculator, which is this one here. OK?

Again, we look at how prime numbers complete results is used, in this case, just by looking in this case, [? as the code underneath. ?] OK? So here we look at the prime numbers, and then here we have the calculate. And then we have the process request. We have the process result, action performed, and basically all of the different type of a [INAUDIBLE] here.

And then of course after that we just go ahead and close the browser windows and exit the jhat. And that's what they want us to do in this practice. Thank you.

## 5. Practice 10-4: Profiling Memory Leaks by Using VisualVM - 7m

Let's go ahead now and look at a practice 10-4, where we profile memory leaks using VisualVM. First we start the VisualVM, and we load, in this case, the .hprof file, which, under the prime-- which we already generated before, when it was out of memory. I already did it, so just by doing load and then look for it, and select it, and then loaded it. This is what I see.

And again, just following here the steps-- so here we tell you that you should see a summary. And that's basically what it is here, where it shows the heap dump on out-of-memory exceptions that we have here. This is when we are calculating the primes for 1 million. Remember that.

And then after that, just following, again, the steps here and reading through, we click on Classes button on the right and then, of course, look at the order by size. So here are the classes, and then we have the order by size here, OK? And we should note that the same int array pattern is covered in the previous practice, if you remember, OK? And we have it here too.

Again, we select that int here. And we can just look for it, and this is the char. But we can always select the int just by looking for it. Here it is, OK? And then right-click and select Show in Instance Views.

And here, basically, is what we see here, OK? We can select the top instance, in this case, and then you will notice that the reference panel in the lower right shows the instance with the most bytes allocated in the array of integers as a hash map entry. OK, here's my hash map entry here that you see, OK?

And so that's basically what we have here. Again, we select a right and right-click on the int or either the hash map entry key or the hash map entry value and select Show Nearest GC Route. You can do either one, and that basically gives us the information here, OK?

And for a second use case, we keep the VisualVM running, and we go back to our, in this case a command line, in this case a terminal. Oops, a-- is it an S-- And then here we run-- so we do java space dot capital XM, X12M, megabyte space, dash jar and space prime numbers dot jar, OK? They want us to run this. We'll go ahead and run it.

And we should notice in the left a panel that the visual remote [INAUDIBLE] discovers the prime number GUI. Again, we select and right-click the prime number GUI in this case, where we want here. And then we can go ahead and, basically, we should notice that we have that. And we can select the prime number GUI and Java application icon in the left panel of the VisualVM, and select, in this case, the Enable.

So we can go back, and here's the prime numbers in this case that we see here. So we can right-click on this and click Enable Heap Dump on the OOME. Again, the prime numbers application will create a heap dump when it experiences an out of memory. Select that, OK?

Again, we can enter here, inside, a 1 million, OK? And then, of course, after that we'll go ahead and generate, calculate that prime number. And we can try again to a point where we get, in this case, an error, out-of-memory error. OK, and we can go ahead and look at it, and we'll find it.

So the location of the heap file is written to a terminal window. And we should again note this in the practice, where it's going to be written here. And we can find it, basically, in this case under tmp visualvm and so forth. So you can just do, in this case, a-- go one level up, one level up, one level up, one level up, all the way up.

And then from there, we can look at the tmp. And here's the tmp. And from there, we can look at the visualvm.dat, the visualvm.dat. And then from there, we'll look at the local host, wherever, and then we find it. See, here it is, OK?

We can go ahead and kill that, so let me kill this guy here. I don't need it anymore. And then after that, we can load that heap dump, if I want. Load, and then I'll just go under, in this case, a tmp. From there, I'll look for the visualvm.dat-- where is the-- here it is.

Then from there, local host, and then we can go ahead and load this guy here. And now it is loaded. And as you see, it gives me an out-of-memory exception too, OK? And that's basically what they want us in this practice, OK? Thank you.

## 6. Practice 10-5: Profiling with NetBeans Profiler's HeapWalker - 10m

Let's look now at a Practice 10-5 where we profile-- and that means profile a HeapWalker. The HeapWalker provides a complete picture of the objects on the heap and the references between the objects. It is especially useful for analyzing binary heap-- dump files produced when Out of Memory error occurs. Again, the Find Nearest GC Root feature can help track down memory links by showing the reference that prevents an object from being garbage collected. This feature is similar to the VisualVM.

So we're going to start the NetBeans and open the PrimeNumbers project-- and then, a Profiler at least once to add the profile target to the build.xml, which I already did, by the way. OK, I already did that. And now, they basically want us to right-click on this project and select Properties, and then select Run. We should be able to see the VM option already set here to the -Xmx12 minus XX Heap Dump Out of Memory Errors that we already have seen there. So this is pretty much following all the steps here, so I click Cancel.

And then we right-click and Profile this. Let's go ahead and do that. So right-click and click Profile, and then we click Run. And now, of course, it's going to start running. And here, we're going to get the input. And then, they want us to enter one million, like before. OK, so I have that. And then, they say calculate the prime. And as you see here, we see now the prime number is computed 999983, which is basically what we found.

And then after that, they say, Click the Calculate Prime Number again. And that's where we can get into trouble, where, in this case, we have a-- in this case, an issue with the-- in this case, with-- when we click on the second time in step 11 here, we'll see that, in this case, the application dies with the Out of Memory, in this case, error. So Profiler application crashed and generated heap dump. Do you wish to open the HeapWalker, if you want? Why not? You can go ahead and do that, if you want, and look at it.

And going back to the IDE in this case, the dialog box is displayed, asking whether you want to open the heap dump. And we click Yes. You should note that the Out of Memory error was thrown, so the Profiler requested a standard binary heap dump snapshot from the JVM. And then, we can open it in the Profiler HeapWalker to look at what is in the heap.

So the HeapWalker in this case, click on the Summary view-- so here's basically what we see. And that's what we see here. OK. And we can click on Classes. And that, of course, shows us, in this case, the-- and then, of course, click that over there on the size. And then, we show us this by size. OK. Again, we should know that this is a list of all the classes that are on the heap, along with the number of object instances of each and the total size occupied by those object instances.

So we can click on the first line, for example, here. And it indicates to highlight it. And it looks like most of the heap is taken up by int arrays-- look at the object instances in the int, so you have all of those. And we can right-click on the int array and show instances. Again, that's what we see. OK. We can go ahead and expand here-- zero please, just expand these, and see, basically, all the information here.

Again, because this is an array, the list of fields is actually a list of array indexes in a group of 500-- that's what we see here. And we scroll down the list, in this case. Again, this array holds all the prime numbers less than the requested value, with the placeholder entries for integers that are not prime. OK, that's what we have here. We can close that int. Go on. OK.

And can right-click the entry for this. We can go back, for instances, and here's the entry for this, in this case. And show the nearest GC roots. We're going to go ahead and do that, so we see it here. OK, the nearest GC root. Garbage collection roots are the objects that are never removed from the heap. They are the starting point for the JVM-- garbage collectors.

And, of course, any object that is reachable from a GC root cannot be removed from the heap. And the display expands, so that the entry for Prime numbers is shown, and so forth. All right. And that's what we see here. We can always close on that. And, basically, we have all kind of information that we can see here. Go ahead, and close this guy here. And look at-- go back, and look at the whole thing.

And here, we can scroll down and see all kind of information, if we want. OK. We can always look at the-- go back, and look at the a prime a numbers.java, which we see here. OK.

And this, basically-- on line A21, here-- we have the complete results. We can right-click on this, and find Usages. So, interesting, this is a map where will we see where it's used in this case. So when the Usage window, again, opens in this case, we see it. We double-click the only result. You know, which, really, is this one here.

And this is, basically, the current project, and so forth. And, now we find it. All right. So, of course, a-- we can always select a profile, if you want to a profile. Or you can click on Profile here, and then load the Heap Dump. And there it is. And then, of course, here, we'll just go ahead and look for it. And we'll load it, which is basically under the-- a, and let's just-- and should be under the-- or we can go ahead and look at it from the way we look at it at the beginning.

That's, basically, we load it, which, by the way, I can have it here. So it's under temp. And then virtualvm.dat. And then, we have it. OK. And we can just go ahead and load it. Here it is. And that's, basically, what they want us to do in this practice. Thank you.

## 7. Practice 10-6: Analyze a Memory Leak by Using MC/JFR - 7m

Let's take a look now at practice 10-6, where we analyze a memory leak by using the Mission Control Flight Recorder. Here the Mission Control and Flight Recorder are also excellent tools to analyze memory leaks. In this practice we use two applications to analyze a program that is running out of memory. The sample program analyzes random numbers generated between 1 and 100. Any number that is not between 1 and 5 generates an error message.

So we, first of all, go ahead and run that memory leak, which I already did, OK? By the way, it's run out of memory, so I did that. And then after that, I started my Mission Control. And I kept and I started my recording in this case, which, by the way, stopped by just right-clicking and doing the same steps-- basically, following all these steps here.

And then after that, I went ahead and-- when I started the Mission Control, I went ahead and pressed Enter, following the way we did it in step 3. And then I kept on watching until, of course, we ran out of memory. And you can see that here, OK?

And that's basically-- so it says Problem Occurred, and we ran out of memory. That's basically what happened. And you can see it also here in the output here. That says Out of Memory, OK? That's basically what we have here.

And then, of course, after that they want us to open that. So we'll go ahead and open the file, which is under Document. And it's the last one, which is basically the 2m.jfr here, OK? That's what I have here. So I go ahead and open it, and that's basically what I end up with.

It's just loading. OK, and that's basically what I have here. So if I click on the memory, in this case, and click on the garbage collection, I see, in this case, how basically the memory activity and the GC pattern has a more and more-- heap, when it was used, we can see that, OK? So it basically went crazy, OK?

We can click on the Allocations tab. And that shows us, of course, in this case that basically the allocation in new TLABs sometime here, and that in this case, we see that-- which, by the way, classes were experiencing the most pressure and so forth. And we basically, here, can see how it became really an issue in this case, for this particular example here.

Here is the allocation outside, the allocation inside, and so forth, the general one, OK? And so this just pretty much shows us some object statistics. Here's the object statistics here and, again, which classes were the largest to grow and so forth. So we can click on all of these.

And basically here, I don't know if memory in the application stops. That's why we don't see much here, OK? And so that's, again-- we want to start NetBeans. Let's go ahead and start NetBeans. Let's go ahead and start that.

Oops, OK, and then open the leaky project. So let's go ahead and wait for that, and open the leaky project. So it's with a little bit, and we can close this project. I don't need it any more. Then let's wait, and then it scans and all that.

And then we just close this guy here. We don't need it. OK, enough of that. They want us to open a project. We go a level up, and this is under the practice leak, and that's the leaky project that we see here.

And we can open here the-- classes, we have the leaky test and the leaky Java. And look at the-- in this case, they basically asked us to, in this case, examine the source code, looking specifically for methods and classes that your investigation indicates could be suspicious and so forth, OK? That's basically what we have here.

And so that's what we see here as an example, OK? And this is the leak test that creates a new instance, in this case, of the scanner, and then of course a new instance of leaky, and then start the leaking here, which is coming from the startLeaking here, which caused leaky loop, which loops in this case and goes through this, OK? And that's what they want us to do in this practice. Thank you.

## 8. Practice 10-7: Observe Application Contention by Using MC/JFR - 7m

Let's take a look now at practice 10-7. Here we are going to observe application contention by the Mission Control and Flight Recorder. So we have an overview. Your coworker, a Bob Doe, was working on a special project for a client named Jack. Jack is in the business of creating and selling multicolored magic beans.

Bob was creating software to count these beans, based on their color. Jack has looked at an early prototype of the application, and it seems to be running at a very high CPU usage already. So because Bob is on vacation, you have been asked to see what is going on. His notes seem to mention something about load testing, but that is all. Use Mission Control and Flight Recorder to analyze Bob's application.

So here we are going to run this, which, by the way, already ran before, OK? And so it's stopped, by the way. And then, following the steps here, so I entered, and then I started the Mission Control. And then I basically set up the Flight Recorder and did record the whole thing, OK? This is when it stops, of course.

And then after that, following the steps-- so I waited until, of course, it's done. The recording now is created under the Home Oracle document, so we can go ahead and open this new recording, Open File. And then we go under Oracle, and so that's basically the one that was created.

And the last one that was created here, I assume it is-- let me just look at the latest here. And let me just, just to be on the safe side, let me just see here a date and look at the time. It says 19, so it must be the last one here, which is this one here, OK-- 19:14, because if I take a look here, that's the day right now in 19:17. So that's basically what it is, OK?

So I go ahead and click OK and open it. OK, so I have it here. And so it's just loading right now. OK, here it is. And I click on the code, and that's what you see here.

So click on Overview, and again note which classes are the hardest in this case-- [INAUDIBLE] here. And the other ones are all here-- java.util.Random and com.example.Factorial. OK, so if you click in this case on a thread, we see also the hot threads also to here and which ones, basically, are being used. So we can look at the hot threads and see the ones that are being used here, OK?

And we can look at the Contention tab. That shows us, of course, in this case the bean counter and how it's being called, OK? All right, look at the lock instances in this case. And here it is, basically. And again, we see here, basically, a different type of a stack trace here, OK?

And we should examine again the source code here, just so we can see that we can do through the NetBeans, just [INAUDIBLE]. Go ahead and start the NetBeans. And but then, of course, open the bean counter project. And we'll just wait for NetBeans to open, and then we look at the code-- almost there, OK.

And then, of course, we close this one here. We don't need it anymore, because we already worked with this earlier. We just closed these projects here, and then we open the project. But this time, it's under the bean counter one level up, and that's our bean counter.

Here we open it, and then they will just want us to-- here's the bean class, and here's the bean counter. It has, in this case, a bean-counter class, and it has the count method. And then we have the bean-counter test. And then we have the bean generator and then, of course, a factorial, OK? So basically, here just looking at, in this case, the idea to see the classes that we are working with, and that's what they want us to do in this practice-- thank you.
