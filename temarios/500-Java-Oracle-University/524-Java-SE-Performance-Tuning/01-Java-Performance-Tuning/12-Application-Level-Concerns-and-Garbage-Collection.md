# 12: Application-Level Concerns and Garbage Collection

1. Application-Level Concerns and Garbage Collection - 12m

## 1. Application-Level Concerns and Garbage Collection - 12m

Let's go ahead and take a look at this last lesson. This last lesson is basically a discussion about Application-Level Concerns and Garbage Collection. And it has no practices.

Here, we're going to describe some best practices for object allocation. Explain why garbage collectors should not be explicitly invoked. Describe reference types in Java. Look at the use of finalizers in Java. Avoid unnecessary allocations. And use synchronization appropriately.

Looking at object allocation best practices. Object allocation is generally inexpensive, about 10 native instructions in the fast common case. And reclamation of objects is also inexpensive. Young garbage collection is generational systems.

There is no performance drawback in allocating small objects for intermediate results. Use short-lived immutable objects instead of long-lived mutable objects. Small immutable objects would be like strings. And use clearer simple code with more allocation instead of more obscure code with fewer allocations.

Working with Large Objects. Of course, large objects are expensive to allocate, expensive to initialize. And large objects of different sizes can cause fragmentation. Be careful with that. For non-compacting or partially compacting collectors, you have this problem. Avoid creating large objects, as simple as that.

Do not use system.gc, unless really, really there is a specific use. In fact, in the latest JVMs, we strongly advise you against it. Let the ergonomics handle that for you automatically.

Disable the explicit garbage collector by using the -XX:+DisableExplicitGC, because a system.gc does a stop-the-world, and that's not good. And when using JDK 6 and the concurrent collector, you can use the explicit GCInvokesConcurrent.

Avoid frequent resizing. That's a bad idea. So when you create an array list, or any type, specify the size from the beginning. It means so if you don't specify the size of it, then you keep on adding more data to it, it gets resized and creates more objects in the heap.

Also, whenever you work with object references, we have three types of objects. We have soft references, weak references, and phantom references. Let's take a look at these.

And we start with, first of all, every object has a reference. So and then, of course, whenever we create a weak reference for the object, that means that object will be automatically a garbage collector.

In general, objects, they're queued so that they can be marked in this case, either as current objects that are still being used. And so that's why you need, in this case, to reference them.

Soft references, they are used, in general, for cached data. And you reclaim soft references only if there is memory pressure. But if not-- but in general, they're very useful for caching data.

Soft references are kept alive longer in the hotspot. In general, the default is about 1,000 milliseconds. We can second-- you can change that any way you want. This specifies the length of time in milliseconds that a soft reference will be kept alive for every megabyte of free heap space after it is no longer strongly reachable.

They're widely used for caching information. And in general, we got rid of that cached information if the information now is stale, old.

Weak references, on the other hand, tell me the object has been reclaimed by the garbage collector. Do not retain this object because of this reference, in the sense that if it's weak, it will be automatically [? garbage-collected. ?] We just show you an example here.

Phantom reference, on the other hand, it keeps some data after the object becomes unreachable so that it can use that data to clean up after the object. Lots of times it's used, for example, enterprise of Beans, where some of the data is kept to clear or release resources, if you want.

In terms of memory link, memory link is when we run out of memory. Or there is a temporary increase and decrease or burst of increase and decrease of the memory size.

Here's a very good example, so simple. We create an array list from integers. And within some method, we use while(true). And then we keep on adding integers to them. So we increment the counter, and we create instances of integer objects and keep on adding. At some point in time, we run out of memory. And we're going to end up with this type of error that says, out of memory error. So small, simple examples like this can actually shut down your application just because you run out of memory, because here we're doing a while(true), so which means we keep on adding data to the array list forever.

Finalizers. Objects with finalizers have significant overhead compared to objects without finalizers. Finalizers create more pressure on the garbage collector. And finalizable objects are retained longer. The following basically are not guaranteed-- when a finalizer is called, whether any finalizers are called, and the order in which finalizers are called. In fact, we tell you, as simple as that, in the object class, there is a finalize method. We advise you against using it, which is a method called by the garbage collector on an object when a garbage collector determines that there is no more references to the object.

Comparing Finalizers to Destructors. Some programmers think that finalizers in Java are like C++ destructors. And the answer from the performance point of view is really not at all. Finalizers are not like C++ destructors. In fact, in Java, the closest concept of C++ destructor is the finally clause, where you basically close all your resources.

So when creating strings, avoid again using the new keyword. Bad idea, because it creates two objects in the [? middle out. ?] Always create a string using a string literal. That's a lot better.

Reusing Objects. Again, mutable objects can be changed. JDK methods return copies of mutable objects to ensure encapsulation. Here's an example where, in this case, I have isLevel3EmployeeBad. And I create an object of Employee inside. So every time this method is called, an object is created. I mean, if it's called a million times a day, there will be a million objects created.

It might be a good idea to create the object outside the memory-- rather, create outside the method and then make use of it that's a lot better so lev3, and then go ahead and getSalary, instead of every time you call the method, you create a new object-- bad idea.

Primitives Versus Objects. We strongly advise you to use primitives. Avoid using wrapper classes-- bad idea, because of the boxing and autoboxing and autounboxing which, by the way, can incur a lot of performance issues. That's why it's always a good idea to use primitives.

Use exceptions only for exceptional situations. Never, never use exceptions for ordinary control flow-- bad idea, like a while loop here, and you catch an exception. That's not a good idea. Or maybe catch an exception using within a for loop-- bad idea. Don't catch or never use exceptions for ordinary control flow.

In terms of thread synchronization, frequent use of synchronized keyword does not ensure that your code is thread safe. Be careful with that.

Synchronization has a cost. Methods execute more slowly because acquiring and releasing the monitor will be expensive. So synchronization can cause deadlocks. So that's why whenever you use the special key word, synchronized, use it only for a critical section to hold the lock for the shortest amount of time. That's what it is.

In general, we ask you to use immutable objects that do not require synchronization, synchronize critical sections by using blocks, use thread-safe wrappers for collection, and use the concurrency API. Like in this case, the thread pools, the executors, and the collections, they are very, very useful for a thread synchronization.

Use static factory methods of the collection. For example, here, a list that synchronizes an array list for you. The user must manually synchronize on the returned list when iterating over it. Here is an example, where [INAUDIBLE] synchronized and then pass the list to it. Failure, again, to follow this can result in non-deterministic behavior, which is not good. That's why we use synchronize and pass the list to it.

Managing your own memory can lead to memory leaks. Again, if you use data structures that require developers to manage memory, memory leaks are possible. Again, if the map that you see here is not cleared, memory leak happens. So you work with a map. But then you need to have a mechanism or a method by which you clear, in this case, the map, not like the code that we see here.

Also, if you want to copy an array, it's a bad idea to write low-code to try to copy, in this case, an array, bad idea. Use the arrayCopy. It's a lot faster. It's way, way better for performance, arrayCopy.

And that's pretty much what I wanted to say about this lesson. It's just a little bit of some of the best practices that we want to advise you to use when you are coding. And that's what we wanted to say about this lesson. Thank you.
