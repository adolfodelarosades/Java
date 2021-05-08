# 12: Threading

1. Threading, Part 1 - 15m
2. Threading, Part 2 - 23m
3. Practice 12-1: Creating and Using Superclasses and Subclasses, Part 1 - 11m
4. Practice 12-2: Implementing a Multithreaded Program - 7m

## 1. Threading, Part 1 - 15m

So OK, folks. So after, of course, we've done now with the practice labs of Lesson 11, let's go ahead and now talk about Lesson 12. And, of course, Lesson 12 covers threading.

So in this lesson we are going to describe the operating system task scheduling, look at defining a thread, we're going to create threads, manage threads of course, synchronize threads accessing shared data, and identify potential threading problems.

Let's start by looking at the task scheduling. Well, as you all know, modern operating systems use preemptive multitasking to allocate CPU time to applications. There are two types of tasks that can be scheduled for execution, and typically they are what we call processes.

A process is an area of memory that contains both code and data. Of course, a process has a thread of execution, that is, scheduled to receive CPU time slices. And processes typically are heavy foot type of threads.

And the other is a thread. A thread is a scheduled execution of a process. Again, concurrent threads are possible, so which means a process can have more than one thread running. And all threads for a process share the same data memory, but may be following different path through a code section.

Why threading matters. Well, to execute a program as quickly as possible, we must avoid the performance bottlenecks. Of course, some of these bottlenecks are maybe some resource contention where two or more tasks are waiting for exclusive use of a resource or data. Or sometimes blocking I/O operations where in this case doing nothing while waiting for disk or network data transfer. That's also an obviously bad performance case.

And the third one is the underutilization of CPUs. And if you have a single-threaded application uses only a single CPU. So if you have more than one CPU, then those are just, of course, underutilized.

We all know, and of course once you folks finish with the Java SE 7 course, obviously the next level is to get into the Java EE technology. When you get into the Java EE technology, you are going to see a bunch of Jave EE components like either servlets or EJBs that, of course, can be in this case multi-threaded. And of course, allow you to run, like for example, servers can process or can service more than one client. And an EJB, like a stateless session Bean, can also service more than one client.

Let's go ahead and look at the thread class, folks. Well, the thread class is a very interesting class, it is used to create and start threads. Of course, the code to be executed by a thread must be placed in the class. And of course, which it does again either one of the following. Either extends the thread class, and this is typically used if you want to write simple code. And, of course, when you are extending thread, the code is definitely simpler.

Or by implementing the runnable interface. Implementing by the way of the runnable interface will end up implementing the run method, it is more flexible. And also, by the way, if you have your class that maybe is going to extend another class, and at the same time you wanted to again be a threader, in that case you are going to make it extend the class and implement the runnable interface.

So that's the second one. Typically it's useful and more acceptable in many applications because we can now use a class and make it extend from any other class that you wanted to use. And then, of course at the same time, making your class implement runnable.

Let's go ahead and look at the example where in this case we're extending a thread. So extending the java.lang.Thread actually, and you can do that and you call override the run method. So here's an example where I have an exampleThread extends the thread class. And here with doing the overriding the run method, where in this case in the run method all what we're doing is using the for loop, and printing the numbers zero through 99.

Again, the code to be executed in a new thread of execution should be placed in the run method like we've seen in this example. And of course, you should avoid calling the run method directly. Calling the run method does not start a new thread, and of course the effect would be no different than calling any other method.

Now remember that we also-- and for those of you who are a little bit familiar with threading-- we also make use of the starting a thread. So again, it's a method called start. After creating the new instance of the thread, again, it must be started by calling the thread start.

And one thing that we should remember that the start method is used in this case to begin executing the thread. It doesn't mean that the thread is going to start executing directly. All that it means is that the thread now can be scheduled by the scheduler to actually run at some point in time.

Let's go ahead and look at an example where we now implement runnable. Well, when we make a class implement runnable, what it means is that we have to implement in this case a run method, we have to override that.

So as you see here, I have an example called ExampleRunnable which is a class that implements runnable, which by the way end up implementing the method, in this case, run. So again, calling here the run method does not start a new thread. The benefit of implementing runnable is that you may still extend the class of your choosing.

Let's go ahead and look at executing runnable instances. Well, after recreating a new runnable, what we need to do now is we must pass again that instance of runnable to the thread constructor. And of course, after that the thread start method begins execution.

So we see it here where, in this case, we create a new instance of the ExampleRunnable. Why? Because the ExampleRunnable as we've seen earlier in the previous slide implements runnable.

And then after that, once we get that instance r1 which is the instance of ExampleRunnable, then at that time we pass it to the constructor thread as you see here. And that pretty much will help us instantiate a new instance of the thread called t1.

After that, all that we do is we invoke the start method. Invoking the start method, what it means here is that the thread is viable. The thread in this case is ready to be scheduled by the scheduler to run at some point in time. So what we mean by that is after the thread is started, the JVM will invoke the run method in the thread's associated runnable at some point in time.

Sometimes we can have a runnable with shared data. So for example, in general, static and general fields are potentially shared by threads.

Here's an example where we have the example runnable class that implements runnable. It has, in this case, an instance, a variable, or rather an instance variable of type integer i. And this, by the way, can potentially be shared variable among different threads. Of course, if it's shareable, or shared, or could be shared by more than one thread, then we have to worry about that synchronization that we're going to talk about in a few slides.

Let's look at the one runnable and multiple threads. After you create a new instance of a runnable, then what you could do is you can go ahead in this case and pass it to more than one to the constructor of the thread and create more than one thread. So an object that is referenced by multiple threads can lead to instance fields being concurrently accessed.

Here's an example where in the main method here we'll go ahead and create a new instance of an example runnable. And then with it we'll pass it to the constructor here to create an instance of the thread t1, and then invoke the start on it. And then we'll go ahead and create another instance of thread t2 and invoke the start on it. And now we have a couple of threads. Now, we should remember that static fields can also be concurrently accessed by multiple threads.

And here's a quiz. And this quiz, of course, tells us about creating a new thread requires the use of what?

Thread.

Thread, which is B. Thank you.

Let's look now at a problem with shared data. This is an interesting problem. Now remember, we're still thinking within the context of the examples that we've seen earlier in the previous slides. Here's one of them, where we created a couple of threads. And also here's the one of them where in this case we know the example runnable that implements the runnable interface, which by the way ending up implementing the run method.

So looking at this example, we see that shared data must be accessed cautiously. Instance and static fields, of course, are created in an area of memory known as a heap space, and can potentially be shared by any thread, and might be changed concurrently by multiple threads. Again, there are no compiler IDE warnings, unfortunately. And of course, safely accessing shared fields is your responsibility.

Here's an example where in the preceding slides we can actually have some anomalies in the creation of these numbers and printing them out. So here, for example, it turned out that this zero got created twice. And also here we have out of sequence. So again, the 12 was printed before 11, and so forth.

So these are typical issues that we have when we have more than one thread sharing data. And that's why we need to somehow resolve this type of conflict.

Now, looking at nonshared data. Some variable types are never shared. And again, the types that typically are always thread safe are what? Local variables to a method. Because once the method is executed, and it's done and exited, of course that local variable is gone. Method parameters that you're passing to a method, and of course, exception handler parameters, too.

And here's a quiz. And in this quiz, of course, we said variables are thread safe if they are what?

Local.

Local and what else?

[INAUDIBLE]

And?

Final.

C, final. They are final. Because if they are final they cannot be modified, you can only read them.

Let's look at the atomic operation. Well, atomic operations function as a single operation. Again, a single statement in the Java language is not always atomic.

For example, if you take a look at the i++ which is the increment of i, typically what happens underneath the hood is that it creates a temporary copy of the value i, increments the temporary copy, writes the new value back into i. So as you see, there's more than one task happening underneath. Of course, we don't see that.

Or for example you have, in this case, a long integer or a hex of a similar number. And of course we say that 64-bit variables might be accessed using two separate 32-bit operations, we can do that, too.

So in general in this case, the issue that we have here, let's go ahead and look at that. Again, the problem that we have, what inconsistencies might two threads incrementing the same field encounter? Again, that could be an issue of maybe not reading the value of the increment. Let's assume it's at two, and we know that thread one incremented to three, but then thread two did not see that. So in this case we would go ahead and increment it to three, and of course that is a conflict.

And of course, if the field is a long integer that's not going to fit in this case within 32 bits. So in that case maybe we need to somehow split the one so that it will fit into two 32-bits to represent that data.

## 2. Threading, Part 2 - 23m

So another problem that we want to look at is the out-of-order execution. Operations performed in one thread may not appear to execute in others if you observe the results from another thread, of course. So in general, code optimization may result in an out-of-order operation, and threads operate on cached copies of shared data also can create an out-of-order execution. And the proof, we just have seen an example earlier in this slide here where we see an out-of-sequence.

So to ensure consistent behavior in your threads, you must synchronize their actions. Again, you need a way to state that an action happens before another one. That's the idea behind that. So one before the other one. And of course, you need a way to flush changes to shared variables back to the main memory. It turns out that we have a very, very nice feature that we actually can use over there.

So again, we see here that for synchronizing actions, every thread has a working memory in which it keeps its own working copy of variables that it must use or assign. Of course, as the thread executes a program, it operates on these working copies. There are several actions that will synchronize a thread's working memory with the main memory. One is making use of a volatile read/write variable, which is a volatile keyword. Anybody heard of volatile keyword? We'll see that in one slide or two.

And of course, the other one is locking or unlocking a monitor using the synchronized keyword. Ken, have you seen volatile? Have you used volatile before?

[INAUDIBLE]

OK, good. Of course, the first and the last action of a thread and actions that start a thread or detect that a thread has terminated. We'll see these in few slides. And the next one is a quiz that says, which of the following cause a thread to synchronize variables?

Reading a volatile field, yes? Calling isAlive on a thread. Yes, because we know if a thread is running. What else? Starting a new thread. Cause the thread to synchronize variables, of course. And completing a synchronized code block. If you complete the synchronized code block, what happens? The lock is returned, right?

Ah, speaking of the volatile keyword. Well, a field may have the volatile modifier applied to it. And for example, here, I can go ahead and declare an integer i, and of course, in this case, use the modifier volatile on it.

Well, what it means, it means that reading or writing a volatile field will cause a thread to synchronize its working memory with the main memory, which means another thread can see what? The changes of what the first thread did. volatile does not mean, by the way, atomic. If i is volatile, i++ is still not a thread-safe operation, because we just have seen the different steps that i++ go through.

Let's see how, again, we stop a thread. A thread stops by completing its run method. For example, here, we have an example class called ExampleRunnable that implements Runnable. And here, we declare a Boolean variable called ToQuit, again, in this case, a volatile one, and set it to false.

And then here, we have the run method that, in this case, prints this message, Thread started, and then here, we say while it's not time to quit, which is what? True. And go ahead and do whatever you want. And then after that, you're finished. So of course, in this case, it will stop if we have a mechanism by which we set the timeToQuit to what? To true.

Stopping a thread. Well, let's take a look at this example where we have a main method. In it, we create a new instance of ExampleRunnable. And we pass it to the constructor of the thread to create a new instance of Thread t1, and of course, call the r in this case the start method on D1. And if you take a look here, we can go ahead and now assign through to the timeToQuit, and of course, that will make the thread to stop.

Let's go ahead now and look at the synchronized keyword. Well, the synchronized keyword is used to create a thread-safe code block. The synchronize code block, typically what it does, it causes a thread to write all of its changes to the main memory when the end of the block is reached.

And of course, it's kind of similar to the volatile. It is used to group blocks of code for execution. And you typically have the thread blocks, and again, in this case, threads block until they can get exclusive access. And of course, it solves the atomic problem.

And to be able to actually understand that, let's go ahead and illustrate this through examples. Here's an example, in this case, synchronized methods. Take a look at this here. We have a class called what? ShoppingCart. And here, we declare an ArrayList of items called "cart."

And down here, we have a method, add(item) that adds the item to the cart. And it's what? It's synchronized. It's the method that is synchronized. And in the second one, we have a removeItem, which is also synchronized, which means whenever this is executing and working with the cart, nobody can touch that cart, right? No other thread.

And of course, we have a printCart here, which is also synchronized. And in this we'll go ahead and create an Iterator on the cart and then use it to iterate through the cart, and of course, print the item and its description.

So typically, whenever we work with synchronization, and particularly with the synchronized keyword, we need to be careful when to use it. If we synchronize a method, and the method takes a little bit longer to execute, that means that the lock is held until the method is finished. And of course, that is going to create what? Performance issues.

So looking at synchronized blocks, we can also synchronize a block of code. Here's an example where in the printCart, again, if you take a look at the example before, we synchronized the printCart method itself, if you take a look at that, except that it's implemented differently. And now here, we can go ahead and now, within printCart method, we'll create a new instance of StringBuilder.

And then here, we have a block of code that starts from here and ends here. And we'll go ahead and synchronize. In this case, if you take a look, you will see that we put down synchronized, and then, in this case, we also passed-- this represents what? The--

[INAUDIBLE]

--current instance, the object. And of course, in this case, we'll go ahead and create an Iterator and iterate through the cart, and of course, append the items and the description to the StringBuilder. And then, of course, at the end, we'll go ahead and print that StringBuilder.

So synchronization in multithreaded applications ensures reliable behavior. Because synchronized blocks and methods are used to restrict a section of code to a single thread, you are potentially creating performance bottlenecks, like I mentioned earlier. So synchronized blocks can be used in place of synchronized methods to reduce the number of lines that are exclusive to a single thread, of course, using synchronization as little as possible for performance, but at the same time, we use it as much as needed to guarantee what? The reliability of data. Everybody's following, folks?

Let's go ahead and look at the object monitor locking. Every object in Java is associated with a monitor, which, by the way, is a thread that can lock or unlock. So the synchronized methods use the monitor for this object. And static synchronized methods use the classes monitor.

And synchronized blocks must specify which object's monitor to lock or unlock. In this case, we decided this. And we saw that in the previous example where, in this case, is the current object, right? Of course, synchronized blocks can be nested, by the way.

Let's go ahead and look at detecting the interruption. Well, interrupting a thread is another possible way to request that a thread stop executing. Here's an example where we have the class called ExampleRunnable that implements Runnable.

And in it, we override the method run, where in this case, we print a message. And then while, again, no thread is interrupted. That is a static thread, in this case, method that you see here. Do whatever you need to do.

And of course, after that, print the Thread finishing. So when a thread is interrupted, what happens? It is up to you to decide what action to take. Again, that action could be to return from the run method or maybe to continue executing the code.

Continuing with that, again, with interrupting a thread, let's look at this example. We said that every thread has an interrupt isInterrupted method. So for example, here, we have a main method. We'll go ahead and create a new instance of ExampleRunnable and then use that reference r1 and pass it to the constructor of thread to create a new instance of the thread t1 and then invoke on it the start method.

And at some point in time, we can go ahead and invoke the interrupt method on the thread. Again, this will interrupt the thread. So using the interruptor features of a thread is a convenient way to stop a thread. In addition to eliminating the need for you to write your own thread-stopping logic, it also can interrupt a thread that is blocked.

Let's go ahead and look at the sleep method. Well, a thread may pause execution for a duration off time. So in our case here, when we look at this example, we'll go ahead and declare a variable of type long called start and call the current time in milliseconds on the system. That's the method that'll get us the current time. And then within the try block, we'll go ahead and have the thread sleep for four seconds.

So in this case, a request for the sleep means that the thread wants to stop executing for four seconds. And by the way, after the four seconds elapsed, the thread is scheduled for execution again. This does not mean that the thread starts right exactly after the four seconds. Instead, it means that the thread will begin executing four seconds or longer after it begins to sleep.

What we mean by that is, once again, in this case, it stops sleeping, it doesn't mean that it's going to run. It all depends on the scheduler, if the schedule will schedule it or not. The exact sleep duration is affected by the machine hardware and operating system and system load and so forth. That's how long it's going to take.

And of course, if you call interrupt method on the thread that is sleeping, what's going to happen in our case here, the code to the sleep method will throw an InterruptedException, which, by the way, must be handled. You have to somehow catch it and handle it. So how you should handle the exception depends on how your application is designed.

If calling an interrupt is just meant to interrupt the sleep and not the execution of the thread, then you might swallow that exception. Otherwise, in other cases, it might require you to rethrow the exception or return to the run method and so forth. So it depends on what you're trying to do.

And of course, after that, you see we have another time here where we take, again, the current time. And in this case, we're going to find out measuring how long it'll take between the start and the time here. So it will be the current time minus the start. And then we'll go ahead and we'll print this. And we'll say this thread slept for this amount of milliseconds.

Of course, we have a quiz here. And this quiz says, a call to Thread.sleep and pass to it 4,000 will cause the executing thread to always sleep for exactly four seconds. Is that true or false?

False.

That's false. Thank you. Let's look at some additional thread methods. There are many more thread and thread-related methods. We see some here, setName, where you set the name of the thread, getName, give you the name of the thread, getId, the ID of thread. isAlive, again, has a thread finished? Is it still alive, still viable?

IsDaemon setDaemon, that would be, again, the JVM can quit while daemon threads are still running. Join, it's a current thread waits for another thread to finish. And the current thread that you invoke on the thread class, again, it's a static method that runnable instances can retrieve the thread instance currently executing.

Of course, the object class also has a bunch of methods related to threading, and they're quite useful. In fact, we use them to avoid or to fix the problem of deadlocks. We have the wait, notify, and notifyAll. Threads may go to sleep for an undetermined amount of time, again, and waking only when the Object they waited on receives a wakeup notification.

Here are some methods that we advise you to avoid, folks. Some thread methods should be avoided, like setPriority and getPriority. It is a bad idea to try to set the priority in general, because it might, again, not have any impact and may cause problems in the sense that the JVM already knows which ones are more important and which ones are of high priority. So trying to actually set the priority might, again, create problems for you.

So in general, it is a good idea to avoid these and let, again, the scheduler of the threads handle that. And some of the methods also are deprecated and should never be used, like destroy, resume, suspend, and stop. These are deprecated.

Now, we mentioned that there are some issues when, actually, we have the concept of deadlocks. And deadlocks, by the way, can be sometimes nasty to resolve. Deadlocks result when two or more threads are blocked forever waiting for each other.

For example, in the first one, we have thread 1 pauses after locking object 1 monitor. And in the second one, we have thread 2 pauses after locking object 2 monitor. Usually, starvation and livelock are much less common a problem than deadlocks, and of course, are still problems and that every designer of concurrent software is likely to encounter.

Starvation describes a situation where a thread is unable to gain regular access to shared resources and is unable to make progress. Again, this is typically related to threads that have lower priority. Again, this happens when shared resources are made unavailable for long periods by greedy threads. For example, suppose an Object provides a synchronized method that often takes a long time to return. Again, if one thread evokes this method, frequently, other threads that also need frequent synchronized access to the same object will often be blocked.

For the livelock, a thread, again, often acts in response to the action of another thread. So if the other thread's action is also a response to the actions of another thread, then the livelock may result. And as with deadlocks, livelocked threads are unable to make further progress. However, the threads are not blocked, and of course, they are simply too busy responding to each other to resume work. But these are issues that we need to deal with.

So in summary, what we've done here is we looked at the concepts of threads. We described the concept of OS system task scheduling. We looked at defining a thread. It turned out that we can define a thread through what? Either by extending the thread class or implementing the runnable.

We looked at creating threads. We looked at managing threads with a bunch of methods, synchronizing threads, accessing shared data, and of course, identify potential thread problems, which is, again, in this case, issues like deadlocks and so forth.

And of course, we have a bunch of practice labs for this particular lesson. The first one is Synchronizing Access to Shared Data. And the second one is Implementing a Multithreaded Program. And of course, if we want to look at it from the activity diagram, let's go ahead and look at that in the activity book, rather, the activity guidebook. And that would be Lab 12. Let's go ahead and get that.

And in these practice labs, first one is Synchronizing Access to Shared Data. Again, you can go ahead and do it using the summary level if you're comfortable with the information they give you here. If you need more information, you can always use the detailed level, which is Synchronizing Access to Shared Data.

The second one is Implementing a Multithreaded Program. Again, if you're comfortable using summary level, go ahead and use that to do your lab. If you need a little bit more detail, you can go ahead and get into the detailed level that gives you more information to be able to do your practice lab.

So let's go ahead and do the practice labs for Lesson 12. And after we're done with this, we'll go ahead and get into Lecture 13, which talks about concurrency. Thank you.

## 3. Practice 12-1: Creating and Using Superclasses and Subclasses, Part 1 - 11m

Now that we looked at lesson 12, which covers threading, where we discussed the OS system task scheduling, defining a thread, creating threads, managing threads, synchronizing threads, accessing shared data, and, of course, identifying potential threading problems. Let's go ahead and look at the practices of lesson 12.

And we start with practice one, where again here we will add code to existing application. We must determine whether the code is run in multi-threaded environment, and if so make it thread safe.

So first, we'll open the project that purchases shirts from a store. Again, the file reading code would be provided to you. And of course your task is to add the appropriate exceptions handling code. So first of all we open, in this case, the project, which is in this case the synchronized project that I already opened here on NetBeans.

And of course, in this case we'll go ahead and complete a bunch of steps for the purchasing agent class which we see here, the purchasing agent class. And what we tell here is that add a purchase method in this case. And then complete of course the purchase method. The purchase method should obtain a store reference. Note that the store class implements the Singleton design pattern.

And so that's how again we see it here, where we have a purchasing agent, we have a purchase method. We get an instance of, again in this case, the thread. Print a message. While in here, you'll get the name and the ID of the thread. And then here we get an instance of the store. Again, by going to this store class, we'll see that this contains a LinkedList of shirts. And of course here it has a private static instance of type store.

And of course it has a private constructor. And it has the static method getInstance. So we did that. And continuing with that again, buy a shirt. So we verify that the store has at least one shirt in the stock by again invoke the get.ShirtCount from the store. Looking at, in this case, the purchasing agent.

So here again, inside. We've got a synchronized. And in our case here we have a get.ShirtCount which is greater than 0. And the authorized credit, in this case, where we passed, calling the authorized credit card, which is part of the store class is going to look at that, his authorized credit that takes into account number and amount.

And then of course here, place called the method to test the workflow. And again, since this would normally communicate with an external source, this method should take longer to execute of course. That's why you put a random value here. And then we did this, sleep for some time. And then of course, in this case return true, which means obviously in this case it is authorized. You see it here in the purchasing agent.

And then we go ahead in this case and take the shirt from the store. Invoke takeShirt from the store. Again, the takeShirt from the store here pops out the shirt. And of course, get the shirt count will get you the size of the shirts in this case. And that's pretty much what we see here.

OK, and then print the shirt is ours. And then of course the message print the shirt. Else print "no shirt for you."

All right, so continuing with that. And after that, so we kind of looked at all of that. So let me just continue. And then of course run the project multiple times. And again, two success managers and two shirts. And of course two success messages on one shirt and one on null. And two success messages on one shirt and one exception. And one success message one shirt and one failure message, desired behavior but least likely.

After that, discover how the purchasing agent is being used. Use a constructor and print statement to discover how many instances of the purchasing agent class are being created when running the application. Again reminder, sometimes objects are created per request. And sometimes an object may be shared by multiple requests. Again, the variation in the model affect which code must be thread-safe.

Then within the purchase method, use again the Thread.currentThread method to obtain a reference to the thread currently executing the purchase method. And use a single print statement to print the name and the ID the executing thread. By the way, we already have seen this. Here it is, line 10 and 11.

After that, pretty much run the project and observe that. After that, open the Store class and add a delay to the authorized class. We already know about that. We've seen this.

Again, option task, use the appropriate static method in the Thread class to delay the execution for one to three seconds. And we already have seen this here.

That's in the store, of course, your store class. And that's where we see here. We're random in line 39. The message on line 40 and of course within the try, we got the sleep when we passed the number of seconds over there-- sleep method.

Continuing with that optional task, what if your delay is interrupted? How can you be sure that execution is delayed for the desired number of seconds? Or should a different action be taken?

Run the project again, you should see a stack trace for a java.util.NoSuchElementException. Locate the line within the PurchasingAgent.purchase method that is displayed in the stack trace. Review the action occurring on that line.

Use the synchronized, that's the key, the code block to create predictable behavior. Modify the purchase method in the PurchasingAgent class to again contain a synchronized code block. So adding the scrutinized to the method signature or using a synchronized block that uses this object's monitor will not work.

So obviously in this case, look what we did. We actually, in this case, put in a synchronized block, as you see here, when we passed the instance to store. And then we synchronized that block that starts from here all the way down to this one here. OK? All right.

Continuing with that, run the project. You should see again the desired behavior in the output window. You should see one success message, one shirt, and one failure. You should note that adding synchronized to the method signature using a synchronized block that uses this object's monitor will not work in this case.

And so let's go ahead and run this. For that, we right click and click Properties. And then make sure that we're calling the right method, SynchronizedMain. By the way, in the SynchronizedMain before running it, here it is where we get an instance of the store and then we add a shirt. And then we create a couple of threads using the instance of PracticeThread, which, by the way, is this one here.

And the PracticeThread class extends Thread. And as you see, overrides the run method where we create a new instance of the PurchaseAgent. And then invoke the purchase method on the agent, which is, by the way, this one here.

And, of course, we need to look at the shirt. The Shirt class we already have seen this Shirt class before. And that's the Shirt class which was pretty much the same as the one we used before.

So again, running this one here, SynchronizedMain, here's what we get. As you see, adding a shirt to the store, it delayed a little bit by one to three seconds. The total shirt in stock is one. Create a purchasing agent. Sleeping for one second creating a purchasing agent.

And again, this shirt is ours. The shift ID, description Polo, color rainbow, and the size is large. Exactly what we have here.

And that pretty much ends this practice. Thank you.

## 4. Practice 12-2: Implementing a Multithreaded Program - 7m

Let's look now at Practice 2 of Lesson 12. In this practice we'll create a new project and start a new thread. Again, you will create a project that slowly prints an incrementing number. Again, a new thread will be used to increment and prints the number.

The application should wait for Enter to be pressed before interrupting any thread. So in this case, we create a new project called ThreadInterrupted. Again, we have this one here.

And of course in this project, we'll go ahead and create a main class called ThreadInterruptedMain. And we set it as the main project in this case-- set as Main-- and create a Counter class in the com.example package in this case. Again we complete the Counter class in this case that should implement the Runnable interface.

Within the run method, we create an int variable called x and initialize it to zero. Construct a loop that will repeat until the executing thread is interrupted. Within the loop, print and increment the value x. Within the loop, delay for one second. Return from the run method, or exit the loop if the thread is interrupted while delayed.

Let's go ahead and look at that. This is the Counter class, so that of course implements Runnable. Here's the run method. We declare x like we said. And while of course in this case, the invoke is interrupted on the method-- on the current thread method invoked on the thread-- while again this is not true.

I print the current value of x is and then increment x. In this case, try again to sleep for some time to catch and interrupt exception if there is one. And of course return. Continue with this practice.

After that we say add, again, the following main method to the ThreadInterruptMain class. Again, create a Counter instance. Create a thread and pass it's constructor, the runnable Counter. Again, start the thread. And of course, run the project.

So first of all, let's go ahead and look at first what we've done in the ThreadInterruptMain. So here it is. We create a new instance of Counter. And that's again an instance of Runnable initialized with the new instance of Counter because Counter-- as you know-- implements Runnable. So that works, OK.

And then after that, we'll go ahead and create a new instance of thread with that reference variable r of type Runnable. And then called start method to make it viable, for scheduling in this case. And then after that we'll go ahead and get a new BufferedReader by passing the new InputStreamReader and pass through it the System.in to the BufferedReader constructor. And then after that, we'll read the Line and catch an exception if there is one.

We'll go ahead and print "Thread is alive:" and print the t.isAlive, which of course returns in this case a Boolean. And of course we now call the interrupt on the t and within the try block will sleep for some time and catch and interrupt exception if there is one. And of course here we have to println, the "Thread is alive:", and then, of course, print that.

Run the project again. You should see an interrupting sequence of numbers within a one second delay between every number. Notice that while the main method has completed, the application continues to run.

Again, stop the project. Open the Run menu. Click on Stop in this case. You can also stop the build/run by clicking the red button along the left-side of the output window.

Again, modify the main method-- in this case in the ThreadInterruptMain-- after starting the thread. Wait for Enter to be pressed in the output window. You can actually see the following code here where I just showed you that earlier in the code and on that means.

You may need to fix your imports and update the project properties to support again the JDK7 also of course. Print out a message indicating whether or not the thread is alive. And of course interrupt the thread and delay for one second. And then print out a message indicating whether or not the thread is alive.

Run your project. You should see an increment sequence number of one second delay between each number. Press Enter while the output window is selected for to gracefully terminate the application.

So go ahead and do that. So of course we've already looked at this code. And now what we're going to do is to click on Properties and make sure that on the run category, we actually calling the thread interrupt Main. OK, that's good.

Now we'll go ahead and run our project. And we see how it's pretty much printing the current value of x which is incrementing and delaying by one second. Of course at some point in time, we can actually stop the application. Or we can do it here too.

And that pretty much ends this practice. Thank you.
