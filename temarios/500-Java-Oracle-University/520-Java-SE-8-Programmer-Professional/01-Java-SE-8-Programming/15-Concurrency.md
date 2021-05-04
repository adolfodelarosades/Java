# 15: Concurrency

1. Concurrency, Part 1 - 35m
2. Concurrency, Part 2 - 8m
3. Practice 15-1: Using the java.util.concurrent Package - 6m
4. Practice 15-2: Create a Network Client using the java.util.concurrent Package - 25m
5. Skill Check: Utilizing Concurrency - Score 80% or higher to pass

## 1. Concurrency, Part 1 - 35m

In chapter 15, we're going to shift gears somewhat. Up until now, everything that we've done has executed on a single processor. Now, in the past, when most systems only had a single processor, that really wasn't a big deal and there was only a few things that would require concurrency or multi-threading. And in the past, it was somewhat difficult to execute those in a timely and worthwhile manner.

But there were developers who-- they did it a lot. They knew exactly how to work with multi-threading, and they knew the issues and the possible problems, but it was something that was more of an advanced skill. Well, the problem is that times have changed. Most systems, even tabs nowadays, may have more than one processor.

And so the issue now is that if I have an application, I want to make sure that it uses all of the resources available to it, but I want to make sure that there aren't problems that slow things down. And so one of the things that we have is this idea of, well, if we have multiple processors-- let's say we have two, or four, or eight, or whatever-- and I have a program that is only using one of those, then I'm not using the resources that are available to me properly. That would be like if I had several gigabytes of memory, but I only said, OK, my program can only use 512 meg kind of deal. It just doesn't make a lot of sense.

And so in concurrency, we're going to talk about a number of things. First of all, we want to talk a little bit about what runs on our processor. Now, the processor is-- what actually executes on the processor is determined by the scheduler. Now, I can't tell you exactly how each scheduler is going to work because each operating system is slightly different in how that goes. But the idea is, of course, that each processor can only run or execute a single process or thread at one time.

Now, the idea of a multi-processor system is, of course, we have multiple processors, which means that multiple things can be executing at the same time. However even when we had a single processor system, it appeared as if multiple things. I can run any number of applications even though I only have a single processor. Well, what made it work was the scheduler, because that way, I could have any number of processes and threads that wanted to execute at any time, but it was the scheduler that determined exactly which process or which thread it is that executed.

Now, associated with each thread or process is not only the execution itself, the code, but it is also associated with a bit of memory, basically a cache of the fields, the variables, the information that is associated with that thread. And so when the scheduler says, OK, your turn to run thread, it takes that cache, it loads it into current memory in the processor, and then it executes the code until the scheduler says, OK, time out, at which point it then takes its current memory, places it in this cache. And then the scheduler says, OK, thread to, your turn, which loads the cache and then executes the code.

So you can kind of imagine that if I have a single processor and I have the scheduler saying, OK, timeout, timeout, timeout, your turn, timeout, your turn, timeout, your turn, you can kind of imagine that it's going to run slower. Now, for my master's degree, my thesis was to determine yes, if I have multi-threading, it is going to run slower. It's just a given if I only have a single processor, but what is the perception to the user?

Well, the perception to the user is because the scheduler uses time slices that are so minuscule to us that I can run multiple applications. And to the user, it appears as if they are all running concurrently. Well, so that's the whole point of concurrency.

Now, the thing was is that I had to write my applications well so that they worked in tandem. Well, Java has realized the times have changed. And like I said, at this point, we often have multi-processor systems that can be rather numerous. And so introduced in version 7 was something called the ExecutorService.

Now, the ExecutorService is basically a thread pool. And so I could create threads in the background, save them in this pool, and then when my JVM requires a thread to use, it just pulls a thread-- it doesn't have to create it-- and then it can execute. But the cool thing is, the ExecutorService can also look at the operating system and say, hey, I've got four processors here. I'm going to use them all.

And so the ExecutorService means that I no longer have to physically create specific numbers of threads, but it also means that I don't have to determine what I think will be the best later during runtime. The ExecutorService does that. Now, in the past, pre 7, we only had the runnable interface and we only had the thread class. That was the only way we could create a thread, and the runnable interface had the run method, which was the code that was going to execute on each thread. Well, with the ExecutorService, we can still use runnable classes, but we can also use callable classes.

Now, the callable has a single method called call, which is what the ExecutorService executes on the thread. But the cool thing about a call is that when that code finishes, it can populate a future. So the future is an instance that I can say, OK, populate this at some point in the future, and at point, then I can pull the get method of the future to get those results. So I'm making it a little more asynchronous so that my program can continue running, and then when I need it, I can make it available.

So threads, processes, and the ExecutorService we're going to introduce in this particular chapter, but there's one other thing that has always been a source of problems for threading, and that is as long as each one of these caches is working with separate data, we don't have a problem at all. But the problem is what if this thread and this thread are trying to access the same object, or the same data?

Well, because there is no guarantee that one thread is going to execute before the other thread, I mean, even if this thread was started first, and this thread was started second, there's no guarantee that this thread will actually execute first because again, it's up to the operating system scheduler as to which thread will go first or second, or if a thread will execute at all. So you can kind of see that I have no guarantees, which means that as I'm running against-- if I'm trying to access the same data-- there is the potential problem that, well, maybe I was starting to change this value, but I didn't quite get finished with the change before the next thread picks up and is trying to work with data that isn't completely finished yet. And so there are some issues that you can deal with and you have to know about with threads.

So we're going to talk about also ways that we can get around that problem of shared data. Now, the number one rule is that if you do not have to share data, the number one rule is don't. But if you have to share data among several threads, the ExecutorService is really good at that, but you still have to write the code well so that, for example, maybe I want to lock that object and create an affinity to a single thread, which means that any other thread tries to access that object will be blocked until that thread is done. So we're going to look at different ways to work with that. And so let's go ahead, get to the slides, and see in more detail what we're talking about here.

All right. So our objectives in chapter 14 is, well, pretty much what I just said-- describe the operating system task scheduling, create worker threads using both runnable and callable, use the ExecutorService to concurrently execute tasks, identify potential threading problems, and then like I said, there are a number of ways that we can protect shared data, including the synchronized keyword, and there are a number of classes that provide atomic ways of managing.

Also, we're going to talk a little bit about locks and at what level we can provide locks on objects, and we'll also introduce a little bit into collections. The collections we talked about in the collections chapter are not thread safe, meaning that they could have some problems if I have multiple threads trying to access the same collection. And so what we will see is that in the concurrent package, there are thread safe collections.

So with that, let's talk about scheduling. Now, I use the terms on the whiteboard, I use the term processes and threads, and modern operating systems use preemptive multitasking to allocate CPU time to applications. That's kind of the time slices that I was talking about.

There are two types of tasks that can be scheduled for execution. Now, a process is an area of memory that contains both code and data, and I represented that with my lines in my little cache. And a process has a thread of execution that is scheduled to receive CPU time slices. Now, a thread is a scheduled execution of a process. So concurrent threads are possible in a single application, and all threads for a process share the same data memory, but maybe following different paths.

So for instance, let's say I had a graphical user interface. I may have the interface working on one thread, the primary thread. And then if the user clicks on it, or if the user is interacting with it, I may have a separate thread that is monitoring the events and the things that the user is doing, and perhaps if the user engages something that's going to take more processing, then I can create other threads to take care of that in the background.

Now, the cool thing with that is that means that the interactive thread is always available to the user, and so they're constantly able to interact even though other things may be going on in the background. So that's kind of where we're talking about as far as applications that use threads. Now, prior to Java 5, the thread class was used to create and start threads.

So the code to be executed by a thread is placed in a class, which does either of the following. It either extended the thread class. Now, they say that this was simpler code, but I was always taught that you probably shouldn't do that unless you actually want to change how the operating system runs a thread, but you shouldn't extend the thread class, mainly because the thread class and the runnable interface both have a single method called run. Now, the nice thing about implementing the runnable interface is that it saves the extends to another class, and the runnable gives you the run. So it was much more flexible, and it allowed me to create a subclass out of the thread.

So really quick, we'll look at this. So for example, if I'm going to create an example thread class that extends thread, and I'm going to overwrite the run method. Now, as I said at the whiteboard, the run method is just simply the code that I want to execute on a separate thread. In this case, it looks like we're going to count from zero to nine and print out. So not a really heavy duty thread, but you get the idea.

Now, just as easily, I could implement a example runnable class that implements runnable. And in this case, you can see that once again, I have a run method. The two classes, the example runnable and the one that we just saw in the previous slide, the example thread, they both do exactly the same thing on their threads. Now, in Java 5, the concurrent package, which contains classes that are useful in concurrent programming, were included, and that includes collections that are now thread safe. Also, this ability to synchronize objects.

Now, there's a number of ways that we can synchronize. Now, what synchronize simply means is that if I'm working with an object on let's say thread one, it's going to lock that object so that other threads can't access it, at least while this thread is working with it. And so there are a number of locking alternatives that we have, but then as we've gone with version 6 and version 7, like I said, in version 7, we have dynamic thread count pools available. We have this idea of the Fork-Join framework that we'll be talking about in the next chapter, which was introduced in version 7.

So what's the recommendation? Well, traditional thread related APIs are difficult to code properly, and the sad thing is that if you are not really good at threading, it's possible to create situations where you may get an error, but the error may occur once every 100 times, once every 1,000, sometimes even once every million times, which makes it really, really hard to track down what is the issue because it's not repeatable. So that's why they recommend anymore that you should use this ExecutorService.

Higher level mechanism used to execute tasks, it can create and reuse threads for you, and it allows you to just submit the work and then check on the results in the future, and that's that idea of working with the callable and then populating a future once the callable has completed executing. In addition, like I said in the next chapter, we're going to talk about the Fork-Join framework, which provides an opportunity where-- well, we'll get to that in the next chapter.

So the ExecutorService. Like I said, used to execute tasks, but it eliminates the need to manually create and manage threads. So you are no longer tasked with deciding do I need three threads. Do I need two? Do I need four? The ExecutorService will determine the optimal number of threads to get the work done that you've submitted.

Now, tasks might be executed in parallel, and the ExecutorService may just figure that it actually will run faster if you just do it serially, or it may run it in parallel. Now, like I said, the ExecutorService can run any runnable class or any callable class. So in order to do that, to create an instance of an ExecutorService, notice that you just call the newCachedThreadPool method on the executors class. The newCacheThreadPool is exactly that. An ExecutorService is simply just a pool, a thread pool.

And so for example, if I were to do this, I might create my ExecutorService, and then I might call execute. So in this case, I'm going to create one runnable task that will do something in the future. I have another runnable task. And then when the time comes that I don't want to accept any more calls to the service-- in other words, these are the tasks that I want to create-- then I will call shut down.

Now, this doesn't really-- it says that it shuts down the executor, but what it really does is it prevents it from accepting any new calls. It will continue to execute what has already been there. And so if there comes a point where you want the ExecutorService to be finished, you can call the awaitTermination. And so in this case, while it's going to stop accepting callables at shut down, I'm going to give it five seconds to complete everything that it has already got, and then at that point, I'm going to move on.

So let's talk about this callable. Now, we've seen a runnable. We saw that it's a run method. That's all there is to it. But the callable's a little interesting because it runs on generics.

So notice that in this case, my callable interface throws an exception. It has a single call method, but this call is going to return a type. Now, any more that type is usually a subclass of future, but we can identify specifically what that type is by passing it in. So it also-- and every one of these also throws an exception, so they're much safer to work with.

Now as an example-- so let's say we have an example callable here. It implements callable. It looks like we have a couple of names and links. We have a sum. We have our constructor, and then we have our call method.

Now, this is what's going to execute on the thread. So in this case, we're expecting that it's going to return a string. And in this case, we're going to, again, go from zero to looks like whatever the link is.

So we're going to increment through that, and we're going to sum everything, and we're going to return the string that has sum colon and then whatever the sum is. So we're going to return a string from the task, which is the sum of the series. So that would be my callable task.

Now, a future is also in the concurrent package, but the future interface is used to obtain the results from the callable's call method. So notice that in this case, I'm saying, OK, let's submit this callable and populate this future. Now, notice that the future allows me to identify what is going to be passed back.

So I can submit as many callables as is necessary in my ExecutorService. I can shut it down when the time comes. But when I need the results of this call, I just identify my future.

I called the get method, and the nice thing is is that if I call the get and the thread's not finished yet, it's going to block-- in other words, it's going to stop at this point-- until we get the result. And so with the result, we can do whatever it is that we need to do with that result. So kind of a cool thing.

So here's a full example of what we're talking about. I'm going to create my ExecutorService. I'm going to submit two example callables. I'm going to then call the shutdown. I'm going to give it five minutes to do something, and then I'm going to say OK, future one, give me the result. So here's the first string. Give me the second string, and I'm printing those out. And so that is basically how it works.

So the executor service identifies do I want this to run in parallel? Do I want this to run serially? It will go ahead and execute as necessary, and then I get the results through the futures.

Now, earlier, I said that there were some concerns with threading. Now, one is that classes should continue to behave correctly when accessed from multiple threads. So I want my class to execute as if it's running on a single processor.

From a performance standpoint, there are generally two things that could be problematic. One of them is this idea of deadlock. Now, deadlock is a situation where let's say I have two objects, object one and object two. Let's say object one is also running on thread one, object two is running on thread two. The problem is is that object one needs to use object two and object two needs to use thread one, or object one.

Well, in that case, one isn't going to be released until the other is, and so in this case, we have a deadlock simply because there's no way, at least without help from the ExecutorService, there's no way that one can release so that the other can use it because they rely or are dependent on each other.

Now, another possibility is something that's even more interesting is this idea of live lock. Let's say that we have an application that uses a specific service a lot, and so I'm calling it, calling it, calling it, calling it. Well, the problem is that any new threads that are trying to access that system or that service can't get it.

I mean, I can spin up as many threads is I want to do it, but because it's so busy, it never has the chance to actually answer those threads. Well, they're not dead, but they still can't perform their work, and so we have a restriction in resources. So that can be a concern with threading as well.

Now, the most difficult thing to write consistently and well in threading is this idea of shared data. Now, at this point, we're going to just increment i. And most people, you'd look at this and say, hey, this is only a single statement. Surely there won't be any problems.

Well, the problem is that any time I do an increment of any number-- of course I have i in the stack, but then when I do the ++, it's going to create a temporary position. So that's step one. It then copies the value of i into that temporary position. That's step two. It then increments the temporary value, so that's step three. And then step four is that it then copies that now incremented temporary value back in.

Well, the problem in this case is that, well, what if I'm in the process of-- after the copy or after the increment, but I haven't finally copied it back. And then the scheduler says, OK, time out. Let's shelve that. Well, what's the value in the stack?

Well, the value in the stack is not what we think it is because it hasn't finished the increment. And so if the next one is trying to do an increment as well, there are some potential problems because I'm trying to share the same data between threads. And so this slide shows a couple of the problems that might happen. And so we've kind of talked about that.

So down here at the bottom, let's say I just have two threads that are working with that previous class. Well, notice that the problem is that, like I said, maybe it still thinks that at zero, even though the other thread has started the increment, or there's nothing that says that the threads are going to necessarily output the output in an appropriate sequence. So that can be the problem with shared data is that you have contentions between threads and no consistent state.

So with that, there are a couple of things that you don't have to ever worry about between threads. There are certain things that are never shared, no matter how much you work with threads. One of those is local variables.

Local variables, of course, are block scope variables, and so those variables are always consistent inside of the block. Same thing with method parameters. You pass in an argument to a method that is, in essence, a local variable to that method, as are exception handler parameters.

Now in addition, now with the use of lambdas, most lambdas are immutable. That's the way they are designed, and so they are by nature thread safe. So you don't have to worry about those in threading. They're always thread safe.

But as I indicated, an increment is not necessarily an atomic operation, atomic meaning that there is no possible way for me to access a value that is not consistent with what it should be. Now, another possibility, however, is that if you're working with 64-bit variables, different operating systems handle that differently.

And in some cases, they're actually working with two 32-bit operations. So it may copy the first 32-bit, then be copying the second 32-bit, and then applying them together. And because they're not atomic, again, it is a problem that perhaps you're not going to get the values that you expect. Same thing with a long field.

Now, we also talked about there's the possibility of the execution being out of order. So operations performed in one thread may not appear to execute an order if you observe the results from another thread. So there are a number of things that we would need to do to be able to work with this so that we can ensure that we get the execution that we expect, and that's the idea of synchronicity.

All right, so there's a couple of things that we can do. Like I said, one of them is that I can use the synchronized keyword. Now, the synchronized keyword is used to create a thread safe code block, all right. So in a code block, it causes a thread to write all of its changes to main memory when the end of the block is reached. Well, that's not really surprising because that happens anyway.

But it is also used to group blocks of code for exclusive execution. So for instance, if I've defined on thread one that I want object one to be locked so that no other thread can access it, then I can go ahead and put that in a synchronized block, which means that no other thread will be able to access it, which obviously solves the atomic problem because I can't access the object until it is in a confirmed state.

So one way that I can use synchronized is by actually applying it to a method. So in this case, since we're doing increments, decrements, and getting a value, because I'm using the variable i and it's static, I want to make sure that it is always in a consistent state. So I am indicating that any call to any of these methods is going to lock the variable i until the thread completes.

Now, if my method-- if I don't want the entire method synchronized, it is possible for me to also use the synchronized keyword to define a specific block. Well, in this case, any item here that I'm accessing inside of the block is also prevented from other threads accessing it until I get to the end of the block. Now, I can do this at two different levels.

If it's a static variable, then I can use a static lock. Or in this case, since count is apparently an instance variable, I can identify that I want an instance block. So it's only going to block on that particular instance. But if I had other instances that were being used in other threads, they are not going to be blocked. And so that's the idea of this object monitor.

So like I said, synchronized methods use the monitor for the instance object, and the static monitor is used for static shared variables. And so synchronized blocks must specify which objects monitor to lock or unlock. So by identifying this, we're basically identifying what it is that we are blocking other threads from accessing.

All right. So to execute a program as quickly as possible, you have to avoid performance bottlenecks, and it identifies a couple of bottlenecks that we've already talked about to some extent. For example, I said the under utilization of CPUs. If you are writing your application as a single threaded application, but your application will be consistently used on a multi-threading system, you are obviously underutilizing the resources of those systems and intentionally slowing down your application.

By the same token, we've talked about resource contention where perhaps two or more tasks are waiting for exclusive use of a resource. When we use a synchronized lock, that's what we're doing is we're saying, well, I know we're supposed to be multi-threading, but nobody can touch this until I'm done. So you don't want to do that very much. Or if at all, you don't want to do it at all.

But sometimes, for example on I/O, if I am accessing a file on one thread and I need that file for another thread, that's the situation where you can get live locks where if the file that I'm processing is much larger than we were expecting, then other threads might starve because they can't get access to the resource. So each of these can create a performance issue inside of your program.

So here again is the idea of the deadlock where I have object one that is synchronized and is trying to access object two. But in another situation, perhaps I have object two that is locked until it can get object one. This would be a situation of deadlock, and to get around that, you would actually have to use the ExecutorService.

There's a method that can be used to basically switch the threads. And we've also talked about the idea of starvation and live lock. So with that, well, let's take a short break.

## 2. Concurrency, Part 2 - 8m

 
All right. Welcome back. We want to talk a little bit about some of the classes and packages that are available in concurrent. Now, there are far more than what we're going to be talking about. But we do want to at least introduce a couple of them.

So in the Java.util concurrent package, the classes there are used for concurrent applications. So in the succeeding slides, we're going to talk about, for example, the atomic package and the classes that are there. We're also going to introduce something called a cyclic barrier. Now, a cyclic barrier is a class that is going to block until a specified number of threads are waiting for the thread to complete. So in other words, we may be wanting to wait until some threads complete. As soon as a certain number of threads complete, then we will go ahead and proceed. And we will also talk a little bit about concurrent collections and how those work. Now, there are a number of these classes beyond what we're going to talk about. But this gives you at least an idea of what to look for in the API documentation.

So, for instance, in the atomic package there are classes that support lock-free thread-safe programming on single variables. Now, the reason is because the methods inside of them are atomic, meaning that no other thread can access that specific variable until that particular method finishes. So as an example, they're showing an example here on the slide of an atomic integer. Now, in this case, the atomic integer is representing the number of 5. But notice that when I print it out, I'm basically saying increment and get. Now, an atomic operation increments the value to 6, and then returns the value. If I'm anywhere in the middle of that increment or in the get, it's going to prevent any other thread from accessing AI.

Same thing here. The get an increment. The get an increment. So in the get case, it's going to give me a new value each and every time. So kind of interesting that we can use atomic classes if you are concerned about shared data.

Now, another possibility is something called a synchronizer. Now, there are number of synchronizers, for example, the phaser class is really helpful. Not phaser as in Star Trek, but phaser as in something that allows me to register or unregister threads at any point. And I can then define certain phases to my application.

Now, a cyclic barrier is similar to a phaser. But unlike the phaser, where you can register classes and unregister threads, the cyclic barrier is defined that it has to wait for a certain number of threads to call a wait before it unblocks. So in this case, for example, my cyclic barrier barrier is going to wait two threads before it blocks.

Well, one problem with the cyclic barrier, and the reason why the phaser class was actually created, was that notice that in this run, I have one call to await, but there isn't another one. And so in this case, this will continue to block because it never reaches two. So another example, OK, so I've got my cyclic barrier example instance. I call Submit on one. Not a big deal. But if I don't remove the comment from line 19 here, it will never get to the shutdown.

So cyclic barriers are static in that you define how many awaits are going to happen or how many submits are going to happen, because the await will occur. Once the Submit is finished, it will call the Await. But, in that case, if you never reach the two, then it never continues.

Now, the two is kind of interesting, because it will unblock on two, four, six, eight. So every two, it will unblock.

Now, the collections that we talked about in the collections chapter are not thread-safe. I already said that. So to use collections in a thread-safe manner, you can either use synchronized code blocks for all access to a collection if a write is being performed. You don't have to worry about reads, because the reads will always be consistent. It's the write that you're most concerned about. But if you're going to be doing a lot of writes, and you want to do them across threads, there is the collections package. And there are collections that are specifically designed to be synchronized. So for instance, in this case, the synchronized list will take a list, and it will ensure that it is thread-safe.

Now, the note here-- just because a collection is made thread-safe does not mean its elements are thread-safe. So if you are working with a specific element and incrementing a specific element, you still have to include that in a synchronized block or a call to volatile, for example.

So as an example, I'm going to create a instance of copy on write array. Holds a string, which is going to be my word list. Create my executor service. I've got my test array list test class. And notice that I'm going to submit one thread, two threads, and then shut down. And so in my run, I'm going to add A, add B, add C. Now, these are going to be across, because I'm doing these across two threads. We can't determine which thread is necessarily going to do which add. But because we're doing a copy on write array list, it is synchronized, which means that Thread 2 can't access while Thread 1 is working. Thread 1 can't access while Thread 2 is working. And so it will properly add them in the correct order.

So that brings us to the end of this particular chapter. We've introduced threads. We've introduced different classes that we can use across the board. We've also introduced the executor service. We've talked about potential threading problems, from resource contention to I/O blockage to shared data. And we've shared a couple of ways that we can work with that shared data, and how we can better write our threads. And we've also talked a little bit about concurrent collections and how we can work with those.

So now, it is time for us to work, and do Practice 15.

## 3. Practice 15-1: Using the java.util.concurrent Package - 6m

In Practice 15-1, we are going to use the Java.util.concurrent package to create a simple multi-threaded counting application. But instead of manually creating the threads, we're going to use the executor service. So the first step, it says to open the project, to expand the project directories, and to open the count runnable class. And we're going to create a constructor to initialize the count and thread name variables.

So it looks like we have two variables. And we need a constructor. So in this case, we will create our public instructor. And it says we want to put in the count. And we want the thread name.

And so inside of the constructor, we will set the count equal to the count and the thread name to the name. All right. So in that case, it looks like we've got that. And in the run method, set up a loop. Let's see-- set up a for loop to print out the thread name and each number counted. So I'm assuming that has to go here. So we know how to do for loops, so let's then output thread. I'm going to just format it. Easy enough. So thread and a thread name. And the value of i.

So once we have that, it says that we should open the main class. So I'm assuming that this is good. I also do want to override it, so I'll put that in. And we'll go to the main class. And in the main class, we want to set up the executor. So the executor service, and we'll call it ES. And from the executors, we are going to get our new cached thread pool. And then we want to submit our runnables. So with that, we're going to submit. And let's see. We want a runnable, so that'll do. And so we're going to create a new count runnable, pass in 20 as the count. And the name is going to be A. So we'll do something similar.

So in this case, we want to pass in thread A, thread B, and thread C, and then we want to shown down the executive service, so I'm assuming that means they want to shut it down, which we can do. And run the project. You should see each thread count to 20 because of out of order processing, the counts of the three threads should be all jumbled together. Let's see if that is true. All right. I'm not seeing that it's being counted. So let's see what's going on.

So I put in the count. And so that's the count. So while i is less than or equal to the count-- ah. Simple things like using the wrong variables makes all the difference in the world. So let's see what we do when we actually have it correct. So if we go back up, notice that A starts counting, gets to-- well, all the way through before B starts. B gets to 6 before C starts. C continues, and then it goes back to B. Well, that's kind of strange.

But the cool thing about these is that as you run these, it will actually do it completely different each time. That's the whole point of a multi-threaded application. But in this case, it looks like we have gotten the results that we expect, which concludes Practice 15-1.

## 4. Practice 15-2: Create a Network Client using the java.util.concurrent Package - 25m

In practice 15-2, we want to create a network client using the concurrent package. So we're going to convert the current package from using a single thread to creating a multi-threaded networking client that will rapidly read the price of a shirt from several different servers. Instead of manually creating the threads, we're going to leverage the executor service in order to do this.

So of course the first thing we want to do is we want to open up the project and open up the directories. And we're going to go ahead and run the main servers. So in this case on one side we will have a server that will give us the random price of a shirt. So we're going to go ahead and just run that. And so in this case, notice that there are a number of threads that are possible for us, each accepting on a different port.

Now once we've got that running, then we're going to open up the network client main. And we're going to-- so we're going to go ahead and run that. Now this is just showing what the possible responses are supposed to be. So we're going to identify the host, the port, and then the response would be the price.

And you can see that if we're doing this on a single threaded, that this can actually take some time. So the point is that if we're doing it serially and it takes two seconds per, you can see that it can take-- well, in this case, 20 seconds.

So what we want to do is we want to fix this, so that instead of running it as a single thread, we want to be able to run it as a multi-thread. All right, so the first thing is in the Network Client Callable class that we're supposed to create-- so I'm going to go ahead and create a new Java class and call it Network Client Callable. And in this, we are going to go ahead and we're going to extend-- or actually, we're going to implement the callable interface. And in this case, the callable is going to bring back a request response that we already have in our project.

So in this case, of course, it's not abstract, so we're going to implement all the abstract methods, which would be the call. But in addition, we apparently want to create a constructor and a field to receive and store the request response reference. Let's go ahead and do that.

So let's see, we want a field. So let's say that it's a request response. And we'll just call it lookup. And it always helps if you spell the keywords correctly.

So we have us a final. Now this of course means that we have to have a constructor as well to be able to run this, which is going to take a request response. So we will set the value, based on the lookup we passed in.

So at this point, we've accomplished that. So 6-b, implement the callable interface with a generic type of request response, which we did. And let's see, we want to implement it-- or complete the call method by using a Java.NET.socket and a scanner to read the response from the server. Store the result in the request response object and return it. You may want to use a Try with Resource statement.

All right, well let's see what we've got here. So in this case, we're going to do a try inside of our call. And in this case, it's actually probably going to return an IOException. So it makes sense for us to do that.

So we're going to do a Try, and so we want to use a socket. And since it's not going to know what a socket is, I'll right click and fix that import. And we'll call our socket, sock. That sounds like a good plan.

And in our socket, we want to pass in the value for the host and the value for the port. So we're going to create the socket. We also want, they said, to create a scanner. And we'll go ahead and fix that import as well. And yes, that's the one we want.

And so we'll try our try. All right, so what do we want to do inside of here? We want to get the response.

So we're going to use Lookups, Response. And we're going to set it equal to the scan.next. So we want to get our next. And then in this case, since we have to return that request response, we'll go ahead and return the Lookup.

I believe that is what we want to do. So it also says that we need to modify the main method of the network client main. So at this point, we do have everything appropriate for our callable request.

So if we go back to main-- now in the previous one, we looped through each of the ports, and we populated our request by passing that in. So pretty much what we just did-- and then we did the next. So now instead of doing that here in the main method, we're of course doing that in the client callable.

And then we're going to have to print certain things out. At some point I'm sure that we're going to do that as well. But it says here to comment out the contents of the main section. So I'll do that.

Now I'm sure that we're going to still have to declare the host. So we'll do that. And at some point, we're going to have to print out the stuff and probably look for an exception. So no reason to comment that out.

And for that matter, there's probably at some point where we're going to have to loop through this. So we'll just get rid of that. All right, so now that we've commented out the contents, we're going to obtain an ExecutorService that reuses a pool of cached threads. And the executor service would not necessarily be inside of a loop.

So apparently it doesn't know what an executor is yet, so let's fix that. And apparently it still doesn't know-- executors. All right, and as we look at this, we can see Can't find the symbol. So we know that we have our executor service.

We have our executors, it is the appropriate one. So I would think that it should pick it up. I'm not crazy about this one down here.

I understand. This is a factory method, so there is no-- there we go. That makes sense. All right, so we have obtained an ExecutorService that reuses a pool of cached threads.

We want to create a map that will be used to tie a request to a future response. So the map needs a key and a value so that we're going to do the request response as our key. And then we will put our future as the value.

So to do that, we'll just put that here. Let's see, we need a map. And we said that we are going to use the request response as our key. And we're going to use a future as our value. And the future is also going to be returning a request response.

And so what do we want to call this. Does it say? Yes it does. In fact, it gives me the code, so I guess we can just go ahead and use that.

So let's use the hashmap. OK, fair enough. And apparently it didn't like this one either, so let's fix it. All right, we have that.

So we're going to code a loop that will create a network client callable instance for each network request. So I've got a loop. I've made my requests already. So now all we have to do is just get rid of the stuff that was there for the single loop.

And we'll say, all right, let's do a request response. We'll call each one of them lookup, so that this will go away. And so we'll do a request response. And we will pass in host, which we've defined and port, which we have also defined.

So we have a network client callable instance. And the server should be running. We did that. Submit each network client callable to the executor service.

All right, well we need a network client callable. So we'll do that one, network client callable, which we will call callable. And in this case, we do want to pass the lookup as the callable.

And so finally we want to submit each network callable to the executor service. So with that, if we're going to do that we need a future. And in our future, we're going to expect that we're going to get a request response back. We'll call our future, future, because I'm so original.

And we're going to call the executor service, call the Submit. And we are going to push in the callable.

So in this case, we're going to loop through all 10. And we do need to also put this in our map. So let's see, we're going to submit and put it in the map, all right. So the map was called-- what did we call it? Callables.

All right, so we're going to put this in callables, which means we need to do a put. We're going to identify that the first one, it'll be the lookup. The second one will be the future, how convenient.

And at that point, we can shut down the service. So that loops through. Once we have made all 10 requests, we call shutdown. And then we're going to await the termination of all threads within the executor service for five seconds. We saw how to do that in the slides.

So we'll do a try, which I think is going to be this try, if I think it through. So we're going to do ES await termination, five. Yeah, we don't want to wait five days. Let's wait five seconds.

And then we're going to loop through the future objects stored in the map, print out the server's response. Sounds like a fair trade. So let's see if we do a try inside.

Now I'm going to eliminate some things here. All right, so at this point we've shut it down. We've got our callables. We want to loop through the callables.

So before we do that-- so at this point, now we're going to do a loop. So we'll loop through each request response in the map. But in this case, we only want the key set. And look at each one.

And what we want is the lookup. So at this point, we're going to populate our future by calling the Get method. And at that point-- now that doesn't make sense either. Yes it does.

So I've done so far the loop through the future's objects. But now I need to figure out how to print them out. All right, so fine. So if I am doing a four loop, I'm going to loop through each one. I'm going to get each future.

So at this point, we need to try to get it, because we don't know if it's done or not. So we'll do a get. And if it works, then we'll print it out.

So in this case, we want the host, the port, and the response. And if there is a problem, that problem could be either an execution exception, or it could be an interrupted exception. And in that case, I just want to say something went wrong.

All right, so error talking to-- and so again, we want the host. And we want the port.

OK, I believe that I've done the loop. So if we run this, we can select Run from the right click. And we can see if we get the same results that we did before. But it should be faster. So we could do that as well, but let's run it.

And so apparently, we've got a problem. So let's see, if I look at the problem in the main client main our network client main on 44. So here's the problem.

Apparently I have said that something is a string that is not. So I know the host is a string, local host, 1,009. So either-- all right, string and string. So the response is a string. So that's the problem.

All right, looks good, let's try it again. Now if you notice that instead of taking 20 seconds, it now only takes the two, because it now runs these in multiple threads. So since that is what we were expecting-- is that it should do the same thing-- output the same information. But-- well, at least similar information-- but run it faster, then we have successfully run and executed activity 15-2.

## 5. Skill Check: Utilizing Concurrency - Score 80% or higher to pass

Skill Check: Utilizing Concurrency

View Skill Check
