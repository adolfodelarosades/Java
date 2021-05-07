# 11: Java Concurrency

1. Java Concurrency - 12m

## 1. Java Concurrency - 12m 

Section 10, Java Concurrency. Question. What's wrong with this code? Answer. Deadlock. Two or more threads are blocked forever waiting for each other. The following is the output of this code.

So let's look back at the sample code. When one thread is executing the synchronized method for an object, all of the threads that invoke synchronized methods for the same object block or suspend execution until the first thread is done with the object. When the thread invokes a synchronized method, it automatically acquires the intrinsic lock for that method's object and releases it when the method returns. As long as a thread owns an intrinsic lock, no other thread can acquire the same lock.

So let's look at the code. The first thread locks c1 and the second locks c2. So let's look at the main method. So the first thread in a state bit new thread. And it's be a Lambda Expression.

So remember thread takes an argument of runnable. And runnable is a functional interface. So that means we could use a method Lambda Expression in its place. So, again, the first thread locks c1 and the second thread locks c2.

The first thread tries to call f2 on c2, which is locked by the second thread. The second thread tries to call f2 on c1, which is locked by the first thread. So here's the output again. And here is a summary of what I said about synchronized methods and what's going on in that code sample [? with ?] fc.

Question. What threading problem does this code have? So it's a Livelock. If another thread's action is also a response to the action of another thread, then Livelock may result. Livelock threads cannot make further progress because they are simply too busy responding to each other to resume work. And here's a sample output.

So you have two threads who are trying to get the same resource. And the thread will only run if it owns a resource. But each thread is giving the resource to the other thread before running. So let's look at this code in detail.

So look at the main method. The first thread, c1, calls f1 with c2. The second thread, c2 is also calling f1 but with c1. For the first thread, the method f1 will call resource operate only if resource get user c1. f1 will exit after calling the method resource operate. And then c1 is ready will be false.

However, the method f1 will first assign the resource to c2 if the second thread isn't completed. So what's happening? The second thread is doing the same thing, assigning the resource to c1 if the first thread isn't completed, thus, both threads are preventing each other from ending. So here is the output once again. And here's a summary of what's going on in the sample code.

Question. What threading problem does this code have? Answer. Race Condition, occurs when two or more threads can access the shared data and they try to change it at the same time. So here's the output. Let's check out the code to see what's going on.

So we have two threads that are incrementing the member r 10 times. So we expect that r at the end of the code should be 20. But as we look at the sample output, in this case, it's only 14.

Let's add a cyclic barrier to better see what's going on. The cyclic barrier is a class of blocks until a specified number of threads arrive at await. So we add a CyclicBarrier cb as a member. And when a code arrives at await, it will block until two threads arrive there. And we specify two because we only have two threads running on our code.

So the output with this addition is as follows. In this example, cb, our cyclic barrier, blocks until two threads reach it and then prints a value of r. So in this sample output, in the highlighted output, both threads access r at the same time. They both get the value of r incremented by 1 and then reassigned a new value to r.

So it's doing this at the same time. So the new value of r is 3, not 4. Question. How would you fix this code? Meaning, ensure that r is 20 when the code finishes.

Answer. You use an atomic variable. So instead of a regular integer, we'll use an atomic integer. Atomic variables. Classes in the java.util.concurrent atomic package contain classes that support lock-free, thread-safe programming on single variables. And the previous code example, atomic integer that we used, is like a synchronized integer.

Question. What is the potential threading problem in this code? Answer. There's no problem, but there are things to watch out for.

So the output, we have two sample output. And the values of r vary. In this code, 2 threads increment an atomic integer 10 times. Instead of running threads with a start method, like we see in the previous examples, this code uses an ExecutorService to manage threads. The value of r obtained from the runnable run and the callable c can vary depending on which task ends first.

So here is a summary of what we've seen in the previous code, in particular the ExecutorService in the Future class. The ExecutorService, it eliminates the need to manually create and manage threads. Tasks might be executed in parallel, depending on the ExecutorService implementation.

Tasks can be runnable or callable. In the previous code examples, we've been only using runnable. Callable it's like runnable except that it can return values.

Implementing instances can be attained with executors. And you must shut down an ExecutorService or else your application won't terminate. Futures, they block when you obtain a value from a callable.

Question. What's the missing statement? Answer. invoke.All.

The invokeAll method forks the given tasks, meaning that it will asynchronously, a, run the task, or b, split a task and fork them. For using a parallel fork join method, you could either use RecursiveAction or RecursiveTask. So in the first case, RecursiveAction compute returns no value. But RecursiveTask compute does.

So let's look at the sample code to see what it's doing. So we start the main method. We have an array of integers. Then we want to compute. And we look at the code.

And what it's actually doing is it's incrementing each integer in this array by 1 rather than doing a 4-loop and going one-by-one. We are using the fork join method to split this task into two parts. So let's look at the code we've added.

So what invoke all is doing in the example, it's a running the example with the first part of the array and the last part of the array. So it splits the array into two parts, then runs the computer task, which increments each member in this array by 1.

Question. How can you do the same task with parallel streams? Answer. Question mark. In the first case, we simply add the parallel method to the stream pipeline. So this method will do what a fork join is doing for you except that you don't have to specify how these tasks are being forked or split into smaller tasks. It all does this for you.

However, the output, if we print the elements in order that they're processed, is unpredictable. So if we want to process the elements in a predictable order, we add an addition for each order. And then now we have more predictable output.

Here's a summary of Java Concurrency. Deadlock, two more threads are blocked forever waiting for each other. We've looked at synchronized methods and their intrinsic locks. Livelock, if another thread's action is also a response to the action of another thread, then Livelock may result. Livelock threads cannot make further progress because they are simply too busy responding to each other to resume work.

Race condition, two more threads can access shared data. And they try to change it at the same time. The class CyclicBarrier, a class that blocks until a specified number of threads arrive at await. Atomic variables are like synchronized variables. We saw the ExecutorService and Future, the Fork/Join framework, and the Stream Parallel method.
