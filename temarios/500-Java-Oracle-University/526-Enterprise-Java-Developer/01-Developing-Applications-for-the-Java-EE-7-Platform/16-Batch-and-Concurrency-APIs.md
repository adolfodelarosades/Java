# 16: Batch and Concurrency APIs

1. Batch and Concurrency APIs - 21m

## 1. Batch and Concurrency APIs - 21m

Let's take a look at the batch API and also the way in which we use concurrency API in Java EE. There are two parts to this presentation.

First part looks at the concurrency in Java EE with concurrency utilities and with managed executors. The second part of the chapter looks at the batch API and how that can be used to define batch jobs, how to run them.

Well, step at the time. Let's start with concurrency. Let's take a look at ways of executing code in your Java EE environment concurrently.

Well, you see, concurrency API is really something that is covered in the Java SE course, Java programming course. So you may wonder why am I talking about concurrency in the context of Java EE course.

And the reason here is because Java EE server manages concurrency for you, but which way you want to achieve the concurrency? Which technique would you like to apply? Well, that depends.

So you need to be aware of what are the choices, and obviously, what are the use cases for these different ways of managing concurrency.

Generally speaking, it's all about taking advantage of your service capabilities to do things in parallel. Supposedly, you're running a server side machine that is multicore, that's capable of executing things at the same time, so it makes sense to take advantage of that.

Java EE server provides us with several mechanisms that allow us to execute the code concurrently. First, it's of course message-driven beans.

We've been talking about these in the use in Java messaging service chapter, but obviously, the idea is that whoever publishes the message into the topic in a queue could just put the message in and let the message-driven bean pick it up and handle in its own timeline. So the publisher could go away and do something else in parallel with a bean that is handling that message.

Another option is, of course, the use of asynchronous enterprise Java beans, again, something we have discussed in the earlier chapter about enterprise Java beans. So we can call an enterprise Java bean method in this shoot and forget style and let that method execute in its own timeline in parallel with the code of the invoker. You've seen these examples as well.

So the last option is what we haven't talked about yet in this course. And that's the use of concurrency utilities in Java EE. Once again, the basic use of concurrency utilities is covered in a Java SE programming course, but Java EE environment automates some of the aspects of the use of the concurrency utilities. So they are giving us mechanisms to control threads to execute tasks in parallel. And that's precisely why this appendix is here, to make sure we cover that extra option that we have in the Java EE world.

So there is a service provided by the Java EE server which is called executor service. You can get your hands on the executor service through the Java name and directory interface look up. You can describe the executor service in either web XML or ejb-jar XML So give your executor a name, and then look up that name through the resource injection in your code.

Now, what the executor service would give you, it will give you the managed executor service in this example. Alternatively, it could be scheduled or manage scheduled executor services.

The difference is how would you like to execute that bit of code that you want to run in parallel that task? Do you want it to be based on a schedule, or do you want it to be one off execution of the task, or do you want it to be a mix of these? So execute it now and then repeat it with some schedule.

So in this particular case, this is just the managed executor service example, so it means one off execution.

The task can be configured to work with either a callable or runnable object. Callable means that you are creating an object that overrides the method call that can potentially return your value. Runnable means that your method that you're overriding is run on its void method is not returning a value.

So it depends what you want your task to do. Do you want it to be just shoot and forget, or do you want a task to execute something and then yield you the result? Yes? In this case, you would use callable.

It's quite simply this. Just use the submit method to trigger the task execution. And then it will return you-- well, in this case, it's a callable object, so it will return you the instance of future, which contains the result. Well, initially doesn't contain the result, but when that task will produce a result, it will appear inside a future object so you invoke or can fetch that result.

It's a little bit more sort of a low level coding compared to, let's say, asynchronous enterprise Java bean, but then if you need that ability in your code to define your own tasks, to sort of control the execution of these tasks from within your classes, you see Java EE environment just provides you with these three types of services. Just inject them into your code and off you go. Execute the tasks which will run in a parallel thread to that one of the color of a task.

If you want to control the task lifecycle and find out what's happening to the task as it unfolds, you may create a manage task listener. A manage task listener gives you an opportunity to work with these methods known tasks submitted, task aborted, task done, and task starting. They are lifecycle methods of the task, and they help us to react to the events that occur with the task.

So for example, when you call the method submit upon a task, that will trigger task submitted method. And guess what? There are more methods that the managed executor service provides you with, so abilities to abort tasks, et cetera. So it's not just the submit method, so you got a control over the task execution, and from within the task object. There you go. You could react to these events, pass the task object as an argument, and then internally it has these lifecycle methods that react to the events that occur with the task.

OK. So that was a story about concurrency. Now we're going to change some [INAUDIBLE], and we're going to talk about batch processing. Batch processing is an API that allows us to execute a series of tasks to process some data. The point of the batch is that it's a non-interactive processing. No user interaction is required, no UI such. So maybe some kind of long running process intensive manipulation with information that you want to perform in background of your application.

Potentially, it's something that you may wish to distribute across multiple machines to gain more processing power. If the data set that you need to handle is large enough, then you may wish to exploit the Java EE distributed capabilities.

So batches are suitable for non-interactive, bulk-oriented long running processes. Examples, I don't know, end of month generation of bank statements for your bank. I guess it's a lot of stuff that you need to process. May be quite intensive thing to do. And [? of day ?] jobs of all sorts, interest calculation for banking accounts at the end of every day, or any other extract transform and load ETL transactions or data warehousings, loading data in a warehouse, processing data, these sort of things. So bulk load of information from one system to another, et cetera.

Execution of the batch can be performed in a sequential or parallel fashion. So that's another interesting ability, to parallelize that execution, or it could be decision based so you can make forks in the batch algorithm and decide whenever a certain chunk of the batch should be executed sequentially or parallelly.

Let's take a look how it's actually done. First, you need to create a job description. And you're doing it with an XML file, job specification language XML file. Now, this is a general structure of that file. There will be an example in a moment, but let's first try to get our hands around what, generally, you'd expect the job to have. Right?

So the root element there is a job, and within a job there are multiple other elements. What are they? Inside a job, you may create different steps.

A step could be just a regular step, an action that you want to do within your job, but it could also be a decision point, a fork in the algorithm, which way the job goes. Could be a split, which allows you to create parallel flows of actions, for example, which, in turn, the flow could contain further steps, or further flows, or further splits. So that could kind of branching into further sub elements.

To control the transition from one step to another, you can use transition elements that could be associated with your steps. For example, what's the next step? What step to take if this step fails? Start or end in particular flow. So these are transition elements.

A dashed line indicates that this is an optional part. So you may-- well, you definitely have to have at least one step, but you don't have to have transition elements if the logic is not requiring such transitions.

Steps may be associated with partitions, and partitions can be mapped to different execution areas. So you could basically distribute the execution of steps. You could use data collectors, reducers, or data analyzers with partitions, and that is the part that's, again, optional as used for distribution of your batch job, if you want, for example, to map it to different machines. So potentially something that you may wish to do.

Now, each step could be either a batchlet or chunk. Batchlet is really simple. It's just an action you want to do. So imagine a bad job comprised of multiple steps. Do this, do that, do that, do that, just one step after another. And if it's a batchlet, then each step will simply contain one action. Just do something.

A chunk is a more sophisticated type of step. It can be associated with a reader, a writer, and optionally, a processor. A reader is a component that reads information. A chunk may be associated with multiple readers. For example, read 10 products, which means read one product, read another, read another, read another, et cetera. So multiple reads.

If you want to, then process each one of these items that you've just read. Then you may associate it with a processor. So processor will be invoked, again, as many times as a reader. So for example, you'll invoke processor within that step 10 times.

And finally, writer will be invoked once per step, at the end of the step. So when you read things and you process things, before you complete the step, you then write them. So if we have a chunk that was doing 10 product reads, then it will do one write of whatever is the result that you end up with after processing.

The chunks are designed to control steps in a batch job which are grouping things together into kind of a transactional checkpoint. So basically, the idea is if something goes wrong, you may create a handler for a chunk that says, this is when I roll back the chunk. This is where I retry the chunk. This is I can skip the chunk if something is not up to scratch with that particular mechanism. OK.

So by default, basically, each chunk causes a checkpoint, although you can override your checkpoint algorithm and supply custom checkpoint handler.

Finally, all of these elements, as in all of them, may contain listeners, event listeners, and may contain extra properties. Properties are just arbitrary properties, whatever you want to associate the element with, you know, any kind of custom additional descriptors. And listeners are event listeners you may associate with relevant parts of this batch descriptor.

So that's what you need to do first. Once you've described the batch, then you start coding the Java part of it, which will be handling the actual batchlets, chunks, steps, all of that stuff.

Well, that's the batch API structure. An example on top here is batchlet. Very simple, just a process method. Yeah? So batchlet is a simple action, process something, process some item. Batchlet has an ability to be terminated. So it has a stop method if you wish to terminate the batchlet.

Chunk is comprised of reader, optionally processor, and writer. The reader allows you to start reading something, open the reader, and there's a closure method as well. The opening of the reader-- the reader creates a serializable checkpoint, and then you read something. You read an object. Process that object in a processor if you want to, and then write not that object, but a list. There's one invocation of writer per chunk, although there might be multiple invocations of reader and processor for that chunk. OK.

So the writer concludes that process. Yeah? It's the last thing the chunk will do. There you go. Your choice, which way you want to code your batch, is it simple batchlet or more complex chunk processing, and you can also optionally supply here checkpoint algorithms, listeners, decision making constructs, which step is a decider, which forks the algorithm. And if you want to control the batch job from that code, you can inject the job context object that allows you to gain control over what's happening to the batch programmatically.

Let's take a look at a way of actually describing an example of a batch. So this is the batch job. We'll give it a job ID. This is called product load job. It's described in the XML file. And then you describe there-- well, this is just one step here, but it could be more steps.

Anyway, so we describe one step. We're saying the step will contain a chunk processing 10 items, 10 products, so there will be 10 invocations of reader, 10 invocations of processor, and one invocation of writer. That's the chuck idea. Yeah?

And then we create classes to implement a reader, a writer, processor. And how do we associate these classes with the steps in a batch? By using a simple named annotation and a ref property. So we match them, assigning them, if you like, to handle the reading and writing and processing of that chunk. There you go.

No override methods in this reader, writer, and processor, exactly as was described by a previous page, which we're seeing the methods that we're supposed to override. That's the batch example.

How to run the batch job? OK, so we need this batch runtime component, for which we get the job operator. Optionally, we can form a collection of properties, if you need any properties, and then you basically start the job.

That's your job name, as described by the XML file. Now, when do you start the job, you're getting back the job ID. So if you need to fetch the job again, get the reference to the job, you can access that and then you can control what's going on with that job.

There's an example here that's checking the status, but you've got other things like start, abandon, stop, I don't know, checking the status, creation time, end time, last updated time, so on. Yeah? So quite a few different things that you could do with this job execution component. Yeah? These are the operations that are available for you so you control the way the batch runs.
