# 16: The Fork-Join Framework

1. The Fork-Join Framework - 19m
2. Practice 16-1: Using the Fork-Join Framework - 15m
3. Skill Check: Utilizing The Fork-Join Framework - Score 80% or higher to pass

## 1. The Fork-Join Framework - 19m

All right, congratulations, doing great work. Let's go ahead and look at activity and chapter 16. Now this is an extension of what we talked about before. So the whiteboard work and everything that we were talking about-- threads, et cetera-- are the same.

But what is really cool about this fork/join framework is that it gives us the opportunity to use the executor service. But as part of the executor service, it also allows us to divvy up the work that might be done by threads. And it gives us a lot more efficiency when it comes to the threading. And so the objective in this is to apply the fork/join framework, so it's a relatively short chapter. So let's take a look.

Now parallelism just simply means multithreading. What I want is I have a task. Let's say it's a task to process a million rows. And if I were to just use one single processor and one single thread to do those millions of rows, they would take some time to do.

And so, of course, the idea is that if I wanted to divide that processing up into multiple threads, then each of those threads could be operating at the same time. And if I'm working with a multiprocessor system, then of course that could even be done faster, because it's going to take care of it. So parallelism is the use of multiple CPUs to take advantage of processing power in the system that requires you to access and execute tasks in parallel. All right, so that's parallelism-- is we're going to now optimize the use of multiple CPUs.

Now there's a couple of things that we can do to do that. First of all, we can divide and conquer. So if I know that I have a system that has four CPUs, instead of having one processor do a million rows, I could potentially just divide that or partition those million rows up into a quarter of a million lots, and then have each CPU work with that.

Well, that's actually known as naive parallelism. And we'll talk about that in a second. But it's also the divide and conquer strategy. I'm going to divide up my data, so that each processor can work on a smaller set of data.

Now some problems can be difficult to execute as parallel tasks. Well, that is true. Let's say I wanted to process those million rows, but ultimately what I wanted to do was to sort them.

Well, while yes, I could potentially sort them by threads, the problem is that then when I recombine the threads, then I'd have to resort them again. And that may not be the best way to go about it. So there are certain things that parallelism may not be the best way.

Some problems are easier. Servers that support multiple clients can use a separate task to handle each client. Well, that makes sense. If each client is actually asking for different things or performing a different task, in that case we can have multiple CPUs-- multiple threads-- dealing with those distinct tasks.

Now the other thing is what I was saying before. Let's say I have a million threads that I need to process. But I only have a single CPU. Would it be faster to process those million threads in one thread or to break it up into numerous threads, even though the same CPU is processing?

Well, the answer to that is in that case, it would probably be faster with a single thread. So you have to be aware of your hardware. And if you schedule too many parallel tasks, it can negatively impact your performance.

So here's kind of a pictorial view of what I'm talking about. So let's say I have some task. And it looks like in this case, we want to find the highest value in an array.

Now if I have a multi-CPU system but I only am writing my application as a single thread, you can kind of figure that OK, well, I'm not using all the resources that are available to me. But at some point, this will get the task finished.

So another possibility that I was talking about before is all right, let's break it up. Let's make sure that I have a thread operating on each CPU. And then when we come back together, we compare just the four answers from each of the threads. And then we pick the one that is the highest.

Well that works, but it's known as naive parallelism. And the reason why it's naive is because there's nothing that's going to guarantee you that one CPU is going to work as fast as another CPU. Some of them have different clock speeds. There's nothing that says that even if I evenly divide my data-- 250,000, 250,000, 250,00-- that each row is going to be processed at the same speed. So in that case, it might be that I'm still waiting on one or two threads that haven't finished, even though two or three others may have.

And then we also have the possibility that in some cases CPUs are optimized that if they're the only ones running, they actually will run faster. So according to the slide here, CPUs may run at different speeds. Of course, non-Java tasks may require some CPU time and reduce the amount of time that a CPU or two or three or four may be able to spend on my task. And then of course, the data may take longer or shorter to process.

And so that's the reason why we'd need a fork/join framework. Rather than defining it myself at runtime when the data could potentially change between now and when I need to run it, we can do something called work stealing. Now the idea of work stealing is that rather than me dividing or partitioning up my data, I can actually use the fork/join framework-- through the executor service-- to break up the task into appropriate units.

And so for instance, instead of maybe I have four CPUs, but let's say I broke my data up into eight or 16 different sets of data. Now the cool thing about the framework is that it allows that if a CPU finishes a task, it can actually steal work from other threads. And so we can divide the data into a large number of subsets, assign the data subsets to the threads processing queue, so each thread will have many subsets queued. But again, if one thread finishes early, it can steal subsets from another thread. The idea is to optimize, so that all of the threads are continuously working until they are all done.

Let's give an example. Now if I had a single threaded example-- let's say I have a integer array that holds a gigabyte of data-- and I use a thread local random class, which is a thread safe way to get a random number. And I'm going to populate each element in this gigabyte array with an integer.

Well, let's think about that. That's a lot of data there. We've got over a million rows of data or elements that we're working with. Well, this right here could be done in parallel, rather than having one thread do it.

And then finally, if I want to look at each integer in that array, and see, well, is that the largest number I've come across so far, well, that in itself could also be done in parallel. There's nothing that says that I couldn't. But in this case, of course, it's going to take however long to populate a gig of integers. And then it's going to take however long to process that same gig. So that would be the threaded or the single-threaded version.

If we use the fork/join task, there are actually two different subclasses to the fork/join task. The fork/join task will take a generic as its input. So a fork/join object represents a task to be executed in the executor service. A task contains the code and data to be processed, very similar to a runnable or a callable. And so you can create any number of tasks that can be processed by this fork/join pool.

Now the cool thing is that there are two ways that we can do this. I can use a subclass of the fork/join task called a recursive action, if I don't need to return a result. Now our example returns a result, because we want to know what the largest integer is. So that wouldn't be the appropriate task for-- or in that case, that wouldn't be the appropriate action for that particular task. That would require a recursive task that expects a result to be returned.

So let's take a look at it. So if we're going to do a recursive task, we're basically saying that we are expecting that there will be something returned. And we can define what that something is by defining what the value type is.

So in this case, my Find Max Task class is going to extend the recursive task interface and identify that it's going to return an integer, in this case the largest integer. Now in this case, we're going to identify at what level-- how many elements do we think that would be more optimal for a single CPU to do than for multiple CPUs. The research that I've done seems to say that if you have fewer than 1,000 elements to process, a single thread would probably do that as efficiently as multiple threads. Of course we have our array, that's the data that we're going to process.

And then we're going to identify a couple of other variables that allow us to split up the array if we need to. And so in the Find task, we're going to pass in the array, the start, and the end, and the threshold. And we need to have a Compute method. So the Compute method is what comes with the recursive task.

So once we have that class, this would be kind of the pseudocode for what the compute would look like. So we're going to break it into two parts. In the first part, we're going to basically say, if we figure that it can be done optimally without breaking up the data, we can say that if the data is small enough whatever that is, we can do whatever is necessary to process the data as a single thread, return the result, we're done.

However, if the data is too large to do on a single thread, then we're going to go ahead in the Compute, in our Else, we would split the data. So we'd have basically two halves. And in one case, we would create a task that would handle the left portion of the data. We would call the fork method, which basically is the same as a thread start. So this asynchronously executes that task. And then we're going to set another thread to do the right task.

And so notice that I'm going to call a Combine, which allows us that once the compute is finished and once we have called the join-- which is basically going to block until the compute is completely done-- we can finish. Now the cool thing is that if you've noticed T2 calls Compute again, which means that this is exactly what we said. It's a recursive task. And so it might split the data. And if it's still too large, then it might split the data again and split the data again, until it meets the threshold that we've passed in.

So what that might look like in code is here's my Compute method. And so notice that in my first part, we're going to decide what the threshold is. And so we're going to say, all right, as long as the number of elements in our array is less than the threshold, we're going to go ahead and identify our integer. We're going to loop through each one. We're going to determine if that's the largest number so far.

And if so, we're going to set up to the max. When we're finished, we just return that value, we're done. That's a single thread.

On the other hand, if we need to-- if we go beyond the threshold-- then notice that we can just write the code. So in this case, the end minus the start is not less than the threshold. So at this point, I'm going to determine where is the halfway part. So we break it up into two parts.

We find out where is that middle part. And so notice that now I can create a Find Max task. I can then pass in the array with the original start-- my new midway.

And then I can pass in a threshold again. By calling the fork, this goes ahead, calls the compute on that first task. And so again, if it's too big, it'll split it again and again and again, until it's the right size to process inside of the fork/join.

The second one, we're going to do the same thing. We're going to create another Find Max task that calls the compute method again. And at that point, we're going to call the Max method, pass in the results of A2, join in the results of A1. It will then give us the final max value. And so that will work as our compute example.

So in this case, we're looking at-- now that we've got our task, this is how we would work with it. So notice that I'm going to create an instance of my fork/join pool called Pool. I'm going to create an instance of my task-- so I pass in the data. My starting point at this point is 0. And whatever the length of the element is minus 1 would be my end.

And in this case, it looks like I'm just going to say, I don't care how much data is in there. I'm going to divide it by 16, and that's going to be my threshold. So you can see that in this case, we're going to force the fork/join pool to break it up into groups of 16.

At this point, I can then call the Invoke method of the fork/join pool and pass in the task. It's this invoke that calls the Task Compute method. And once it's done, it will come back with the appropriate integer, and we're done.

So that kind of shows you that there are a number of ways that we can work with the fork/join pool. And it will make the decision-- or the determination of whether or not the data is large enough or small enough to work with multiple threads or a single thread.

Now a couple of things on the fork/join. It says to avoid IO or blocking operations. The problem is that if you're accessing resources that are outside of the JVM, you don't have control over those. And they could potentially slow your multi-threaded operations down.

By the same token, if you truly only have a single CPU on your system-- let's say it's a smartphone or a tab-- then often the fork/join solution is going to perform more slowly, because there is a slight amount of overhead to it. So you do need to know your hardware. And the research that I've done says that basically if you don't have at least four CPUs, the fork/join may or may not be optimal for you.

So for example, some CPUs increase in speed when only using a single core. So that could offset some of the performance gains. There's other tricks. You can look in the documentation. You can also look up on online some of the tricks that people have found to use the fork/join framework.

But the idea here is again there are certain problems that may not be a good solution or a good fit for the fork/join framework. So you need to know your problem as well.

So in this chapter, we've talked about the fork/join framework. We've seen how we can create recursive tasks or create recursive actions. And so now it's your opportunity to work with the fork/join framework in practice 16-1.

## 2. Practice 16-1: Using the Fork-Join Framework - 15m

In Practice 16.1, if you look at the student guide, or the activity guide, it looks like there is only a detailed level for this particular practice. So while I would usually recommend that you try to do the summary level as best you can, in this case, it looks like you have no other option.

So in this case, we're going to use the forkjoin framework. And then I'm assuming that because we didn't really give you a lot of instruction in the slides itself, we're just going to provide much of it for you. So let's go ahead, open the practice. We expand the project directories and open the main class and review the code within the main class.

Take note of how the FindMaxTask class is called. All right, so in this case, notice that we have an integer array that we're going to populate with 512 megabytes of data. We're then going to loop through each one of these and use the ThreadLocalRandom class to fill it with an integer.

Now at this point, we are populating this with a single thread, which is probably not the best way to go about it. We also have a ForkJoinPool that we're creating. We're creating a FindMaxTask in which we're going to pass in our data, et cetera, split it into 16. And then we're going to invoke the task.

And then we'll print out the max result here. Personally, I'm going to go ahead and switch this out so that we can actually see it a little more clearly. But I would assume that the maximum value will be somewhere around 2 billion something.

Now, we're also going to open the FindMaxTask class and review the code within the class. Take note of the for loop used to initialize the data array with random numbers. All right, so FindMaxTask, looks like we are going to-- well, in our compute method. It looks to me like we're returning the maximum value, dum, dadum, dadum.

So take note of how the compute method splits the data array if the count of elements to process is too great. All right, fine, well, in this case, we do want to create a new Java class, which we are supposed to call RandomArrayAction.

All right, so we did say that a recursive action is something that we can use. So in this case, it looks like we are going to add four fields here. So we'll do a private final int called threshold, a private final int array called myArray, and then a start and an end value.

All right, so we want to add a constructor. And in our constructor, we will pass that information. So we will pass the array first. And we'll save their values with the field. So this dot-- well, it always helps if you actually use the right stuff. All right-- much better when you do it the right way.

All right, so in this case, we are going to modify the class signature to extend the RecursiveAction class. So we will extend the RecursiveAction class, which means that we now do not have the appropriate method. So let's go ahead and implement the compute.

And in the case of the compute, we want to write some code. So we're going to begin the compute method. If the number of elements to process is below the threshold, you should initialize the array, all right, so if end minus start is less than the threshold.

All right, so we now know what a thread local. And it says, basically, instead of the math random, the math random doesn't scale when executed concurrently by multiple threads and would eliminate any benefit to applying the forkjoin framework for this particular task. So that's why we're using it.

Now, we're going to complete the compute method if the number of elements to process is above or equal to the threshold. We're going to find the midway point in the array, create two new random array action instances for each section of the array to process, and then start each random action.

So we saw that in the previous exercise. So I'll do our else and create that block. And so once again, we want to find the midway point, which would be the end minus the start, divide that by 2 plus the value for the start. That equally divides it. And then we're going to create a random array action that we'll call r1 and pass in my array, start, end, and threshold.

And we will also create r2. And in this case, we want to start with the midway plus 1. And so in this case, we're going to end with midway. And so that gives us our two random array actions. And then we need to invoke them. And we can pass in r1 and r2 to them.

All right, so at this point, we have everything that is on that page. So next page-- modify the main method of the main class to use the RandomArrayAction class. So we're going to comment out the for loop that we already have, and after the line that creates the ForkJoinPool, create a new random array action.

In which case, we're going to pass the data, the start, the-- well, they already have the good stuff there. So we'll just go ahead and use it. But in the case of the threshold, we'll do the same thing that they had in the previous example.

And then we need to get the result. And then apparently we wanted everything else there anyway. All right, so in that case, the action is going to populate our thread. And then the rest of it is going to work with the rest. All right, good, in the case of the start, we're going to start at that, subtract one off. And I believe that will give us the opportunity to invoke the action.

And so once we have populated it using the multi-threading, then we'll go ahead and use multi-threading to also find the result. So now we can run it. And it should run faster, unless of course there's an error.

So we have a problem in the random array action line 33. And if you use the right syntax, it always works much better. All right, so let's try this again. There we go, all right, so I put the parentheses in the right place. It's amazing how things work.

So notice that it's 2.1 billion something. And it's always going to be probably really close to that. But notice that the final number, 636, 605, 634, it's going to change each and every time. Because obviously, it's populating the array with random numbers. So with that, it looks like we have successfully completed Practice 16.1.

## 3. Skill Check: Utilizing The Fork-Join Framework - Score 80% or higher to pass

Skill Check: Utilizing The Fork-Join Framework

View Skill Check
