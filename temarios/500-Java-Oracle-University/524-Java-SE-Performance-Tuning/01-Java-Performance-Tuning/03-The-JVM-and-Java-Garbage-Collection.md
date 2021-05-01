# 3: The JVM and Java Garbage Collection

1. The JVM and Java Garbage Collection - 27m
2. Practice 3-1: Setting Up VisualVM and VisualGC; Practice 3-2: Examining VisualVM; Practice 3-3: Examining Garbage Collection Basics - 5m

## 1. The JVM and Java Garbage Collection - 27m

Lesson 3, where we just got the JVM and garbage collection. So in this lesson, we are going to define garbage collections, describe the advantages of generational garbage collectors over non-generational garbage collectors. Describe the components and operations of the HotSpot generation garbage collectors. Look at the garbage collection process, and look at the G1 GC, the G1 character, which is by the way, fairly new, introducing Java SE 7 and up, and of course, SE 7, 8, and 9, and so forth. And describe the garbage collection process with the G1 collector.

So let's start with the basics. Garbage collection is a way in which Java reclaims the space occupied by the objects that are no longer in use. In general, a garbage collector is responsible for three tasks. One is allocating memory for new objects. Second, ensuring that any referenced live objects, if you want-- they are still being used-- remain in memory. And then, third, recover memory used by objects that are no longer reachable, which means they are dead objects. They're not used anymore.

So that's basically the sum of the three tasks that the garbage collector is responsible for, is the memory allocation for new objects, making sure that all referenced objects remain in memory, and then recover memory used by all of those objects that are no longer referenced, and of course, which means they're dead. You cannot use them anymore.

So the garbage collector first performs what we call marking tasks, where it is going to go through all the objects and mark the ones that are still referenced. Every object the garbage collector encounters is marked as being used and will not be deleted in the sweeping stage.

So for example, on the top here, a diagram you see before marking, going through all of that. So all the ones that are still alive, the garbage collector will mark them as, of course, in this case, alive. So here, we put them in the color blue. And all the ones that are in color, like pinkish or reddish or whatever, those are referenced objects. And we don't need them anymore. And then, of course, what's in a dark gray, that's basically memory space.

So which means, at the end, if you take a look at those pink or reddish type of spaces, they need to be garbage-collected. So now you end up with these spaces, you see? Here, the big, pink space on the left, and then the one slightly narrow, and then the next one, and so forth. So the deletion of objects takes place automatically.

The traditional way to delete objects is to let the allocator method use complex data structures to search the memory for the required free space. So again, here the memory allocator holds a list of references to free spaces and searches for free space whenever an allocation is required.

But if you take a look at this type of deletion, well, we don't like it. Why? Because it looks like it's fragmented. And that's not a good idea.

It might be a good idea to actually use what we call deletion and compacting. So we do have actually a mechanism by which we can use a garbage collector that not only does the deletion, but also handles the compacting, compacting the memory by moving objects close to each other. Object allocation becomes a lot faster. So the memory allocator holds the reference to the beginning of the free space and then allocates memory sequentially, starting at that point. So we like the garbage collector that does compacting.

Now let's discuss a little bit the non-generational garbage collection which basically, what it does, it carries through the whole heap. So a large number of objects could reduce the performance. And of course, this pretty much allows you-- it makes the garbage collector go through the whole heap. Let me just show you an example about that.

So think about if I have now in this case-- let me just use this as an example, and let's assume that I'm sweeping all of this and going one after the other one and just sweeping the whole heap. And this is going to take a long time. See? A long time to sweep the whole heap. So that's basically the non-generational garbage collector, which we do not like.

All right, so what we need to do in this case, it might be a good idea to use the generational garbage collection, which improves definitely on this. So that's why we divide-- if we take a look at the heap that we had over there, how about now if we'll go ahead and divide the memory into what we call a young generation.

And the young generation will be made, in this case-- OK, let's assume that this is the young generation, which we'll divide, by the way, into an Eden space, and then to survivors. So here we have the Eden space. And then here we have a Survivor0. And this one here will have it in Survivor1.

And then we'll have another space which represents now the tenured, or old generation. That's what's called the tenured generation, or old generation. And then the third region, in this case, is the permanent generation. And the permanent generation represents all the classes of the JVM itself that is running your application.

That's basically how we divide the heap. And that's exactly what you see here. So you have the young generation made of the Eden space and the two survivors. You have the old generation made of that blue space, which is, in this case, the old generation, or the tenured. And then you have the permanent. So this generational collector is definitely extremely, extremely good. And we'll take a look at that.

So the memory space now is divided, like we said, in three sections-- the young generation made of the Eden space and the Survivor0 and Survivor1, which is what we call "from" survivor and "to" survivor, the old tenured generation which contains all the old objects, and the permanent generation, which is the one that contains metadata, classes, and so on, that belong to the JVM that is running your application.

Features of the Young Generation Space. Garbage collection occurs relatively frequently. And the GC is fast and efficient because young generation space is usually small and likely to contain a lot of short-lived objects. So objects that survive some number of young generation collection are promoted to the old generation. That's why we call them tenured. They get tenured to the old generation.

So looking at the features of the old generation space, the old generation is typically larger than the young generation. Its occupancy grows more slowly, more or less. And the garbage collector for the old generation space is typically infrequent. But it takes a significantly longer time to complete than the garbage collector for the young generation. So GC for the old generation space should be minimized, somehow. We'll take a look at how we're going to do that throughout the different lessons.

And the generation garbage collection basically works where the brand new objects are first located into the young generation. And then after a certain number of sweeps by the young generation garbage collection, they'll get promoted to the old generation. That's the idea behind this.

We can look at this in detail. And so let's assume that your application started for the first time. So new objects are allocated for the first time to the Eden space, as you see over there. So you see that the Eden space is being filled by these objects that were created. And when the Eden space is full, that's where a minor garbage collection is triggered.

When that minor garbage collection is triggered, it actually invokes what we call the stop-the-world event. What does stop-the-world event means? What it means is that all the threads of your application are suspended.

So all the threads of your applications are suspended until the garbage collector does its job. It goes through all the objects that were created. And then marks the objects that are alive. The ones that are not, it will not mark them.

So which means you're going to end up doing this, where what's going to happen here is all those blue objects that you see in the Eden space, these are automatically copied into the Survivor0. So all referenced objects are copied to the survivor space and have their age incremented. So if the age was zero, now it's one And then we end up with this space, which means the application keeps on running.

And of course, because the Eden space is clear now, new objects basically have a space where [? to, ?] in this case, get created. So it's going to keep on going. And then once the Eden space is full again, now what's going to happen is the minor garbage collector is going to run, not only on the Eden space, but also on the Survivor0, because remember, Survivor0 had objects before, those four objects that survived the first sweep. And they get copied in Survivor0.

So the minor garbage collector is going to run on the Eden space and then on the Survivor0. Any object that survived, which means it's still referenced, all of those are copied from the Eden space to Survivor1. And now the Survivor0 is called the "from" survivor space. And the Survivor1 is called "to" survivor space.

So all those objects-- like in this case, there are two objects that survived the Eden-- the next garbage collection. So those are copied into the Survivor1. And their age is incremented by one, so now from zero to one. And then two objects from the Survivor0 also survive. They're still referenced. So they're automatically copied to the Survivor1. And their age is also incremented, so from one to two now. And then we're going to end up with this.

Of course, your application is still running, which means new objects are still being created inside the Eden space. Of course, at some point in time, the Eden space is full again. That's where the minor garbage collector is going to run again. And this time, it's going to run on the Eden space and Survivor1. And any object that survived that garbage collection will be moved from the Eden space to the Survivor0. Now the Survivor0 becomes the "to" survivor space. And the Survivor1 becomes the "from" survivor space.

And then all the objects that survived that garbage collection from Survivor1 space will be copied into the Survivor0 space, with of course, their age will be incremented. So the two becomes three. The one becomes two. And of course, the one that came from the Eden space, its age becomes one, because originally it was zero.

And so these keep on going back and forth until a threshold. There's a certain age threshold. When the age threshold is reached, objects are promoted to the tenured space. So for example, here, we are saying that after 8 garbage collections, any object that survives 8 garbage collections will now be promoted to the tenured space.

And by the way, the default is 15, just to let you know. The default is 15. Here we just used 8, but in general, it is 15 for the objects to get promoted to the tenured space. That's the idea behind. So that's kind of nice to actually see how this works. And it works very nicely, because it makes it a lot faster. So that's why we like-- we said that generational garbage collection is the way to go.

So in summary, the process repeats every minor garbage collection. And when objects reach an age threshold, they are all copied to the old generation. That's basically what we have here. Here we decided that the threshold will be 8 sweeps, which means sweep number 9, those objects are promoted to, in this case, the tenured generation.

So in review, we tell you that the young information is made of the Eden space, the survivor spaces, and then of course, where objects age. And the minor garbage collection is always stop-the-world all the time, which means it suspends all the application threads. And minor garbage collection can be single-threaded or multi-threaded. We'll discuss about single-threaded threaded or multi-threaded, which is in parallel events. We'll talk about that at some point in time in some of the lessons later on.

In terms of the old and permanent generations, we said that the old generation contains objects that have reached the minor garbage collection age threshold. And we said that the default is typically 15. And major garbage collector is time and resource intensive. The major garbage collector, no question, it's time and resource intensive. So that's why we need to somehow work on it to shorten that time so that we can, of course, improve the performance. We'll see that in some of the lessons later on.

On the other hand, the permanent generation, which is in green here, this contains the metadata acquired by the JVM, class objects and methods, and interned strings, and all that. All those are part of the JVM. And those are all generated inside the permanent generation.

Of course, some of you might say, well, can we tune this? Yes, we can. We'll talk about that at some point in time, meaning the permanent generation. We'll talk about that at some point in time.

Now let's just have a discussion a little bit about the G1 GC. OK? But before the discussion of the G1 GC, I would just want to go back and take a look at your lab machine and just look at an application. You guys are going to do this in the practice. But I just want to start it and see how. So I'm going to start my 2D application and play with it a little bit, click on Transforms and Clipping, and maybe Images, and then maybe Composite, and then maybe go back to Transforms, and so forth.

And now I go back. So by the way, you are going to make use of jvisualvm. The Java Visual VM, I already opened it. And I already, by the way, installed the plugin, which is you just click on Tools and Options-- rather, not Options, Tools and, in this case, plugins. And then from the Downloads, you can go ahead and basically add the plugin, and so forth, this one here.

So it's really quite straightforward. They tell you how to do it. But right now, I have my 2D application, and I want to open it. So I'm going to open my 2D application. And then I just want to see how my Visual GC-- because I installed the Visual GC. This just gives you an idea about how the Eden space-- I can play, actually, with this application a little bit. So I just-- to show you how actually the Eden space, we see that in real time. How about that? OK.

And see how the Eden space is basically being filled up. And then at some point in time, you see how it gets garbage collector. And it moves to Survivor0 and Survivor1, and so forth. That's the idea behind this. But you guys are going to do a practice about that at some point in time. So we'll try that. You folks will try that later on.

Let's go back and continue with our lesson. Now we're more interested about this nice Garbage-First garbage collector, or what we call G1 GC. This is a garbage collector that was introduced in Java SE 7 and up. It's a server-style garbage collector targeted for multiprocessor machines with large memories. It basically meets the garbage collection pause-time goals with a high probability while achieving high throughput.

The G1 is designed for applications that can operate concurrently with applications threads and, of course, like the CMS collector, we'll talk about the CMS collector later on. And it's basically a compact free space without lengthy GC-induced pause type of times. It's basically useful for if you need more predictable GC pause time directions. And of course, it must not sacrifice a lot of throughput performance.

Again, you do not require a much larger Java heap. And why? Because this garbage collection is very, very interesting, because it actually-- the heap itself is a single memory space that is split into regions. So that's what we do. We split it into regions.

And so young generation memory comprises a set of noncontiguous regions. And this makes it easy to resize when needed. Of course, young generation GCs are stop-the-world events all the time. And the young generation is done in parallel using multiple threads. And of course, live objects are copied to a new survivor or old generation regions. So now we're going to work with regions.

So what we do is pretty much take the heap and split it into many fixed size regions. Region size is chosen by the JVM at startup. And of course, the JVM generally targets around 2,000 regions, varying in size from 1 megabit to 32 megabytes. And you're going to end up with pretty much a region that looks similar to this one here.

Now what's interesting here, ladies and gentlemen, is that these small regions that you see over there, they basically can be next to each other. So for example, here I can have Eden space next to the old generation, next to the survivor, and so forth, as you see here. That's the interesting idea about this.

And of course, the young generation basically, in G1 is made-- like for example, we can look at it here, what is made in the green regions. So here, for example, we have what's in gray is non-allocated. What's in green is the young generation. Watts in blue is the old generation. And then, whenever the garbage collection runs, the G1 running, you can actually now have what we call a darker green representing recently copied in the young generation. And then dark blue, recently copied in the old generation. That's basically what it is.

So whenever the G1 is running on the young generation, what's going to happen, it's going to take a look and mark all the objects, or in this case, in the young regions that are still alive and then copy them into, in this case, a darker green region, as you see here. That's the idea behind this. And then you do the same thing for the blue ones. So the blue one also, the ones that are still alive, they are copied now into a darker blue.

The G1 concurrent mark phases are five. And it has phase 1, which is similar to the CMS. We'll take a look at the CMS later. You have the initial mark, which is the stop-the-world, basically, when you're going through the young regions and trying to mark all the objects that are still alive.

Then you have the root region scanning. That's where you're going to do the scanning to be able to find out which objects need to be deleted. Then you have the concurrent marking that is done in parallel. But remember that this actually runs when the application is running at the same time. So which means when you are marking some of the young regions, all the young generation regions are being filled, because the application is still running.

And we need to somehow catch those objects that got created new or were newly created while we were sweeping the young regions. So if you have to mark them, we call that remark, which is Step 4, where we go through the ones that we missed, if you want, while we were marking the previous regions. All the objects got created. So we have to mark them too, so we call them remark. And it's also stop-the-world, because they're fairly new. They're just created.

So then after that, we do the cleanup. That's Step 5, where we have a stop-the-world event and a concurrent that is basically cleaning up the whole thing and does the copying, the light green into the dark green, the light blue into the dark blue, and so forth. That's basically what it is.

So let's take a look at these phases. Here are the initial markings. So the initial marking phase will go ahead and basically handles, in this case, any type of marking on the young generation. And then it does the concurrent marking phase that is done also on the old generation too, at the same time. In any region, any objects that basically are not referenced anymore, they will be deleted. That's basically what happened.

Then while this is done, other new objects were created. So that's why you need to also mark them too. That's called the remark phase. And then, of course, after that, you do your cleanup. So what you do in this case, the cleanup will be done on the young generation regions and all the old generation regions.

That's why, for example, when you do all of this, you get rid of all the light green ones that basically are marked, and then, of course, the light blue ones. And that's why they're all copied into the dark green and the dark blue. That's after copying and cleanup phase, and it's all done. And the whole process starts all over again. That's basically the idea behind this.

So it turns out that G1 is really, really quite an interesting type of garbage collection. We'll come back, by the way, to it at some point in time in one of the lessons later on, just to see some of the configurations that we can have on that G1. But it's really, really useful because first of all, you focus on smaller regions, rather than the whole heap.

And it does an excellent job. It's way, way better. In fact, it was created for the purpose to replace-- it's for long-term replacement of the CMS, which we'll discuss at some point in time, the concurrent mark-sweep garbage collector.

So here in this lesson, what we have done, ladies and gentlemen, we basically defined garbage collection. We looked at the advantages of generational garbage collection. We looked at how actually the whole garbage collection mechanism works. And we described the garbage collection process. And then, of course, we introduced the G1 GC, the Garbage-First garbage collector.

And that's basically what we wanted to do in this lesson. We do have a practice on this lesson. Try it. Of course, that would be practice of Lesson 3. And then of course, there are practices, actually. And then we'll take a look at them at some point in time. Thank you.

## 2. Practice 3-1: Setting Up VisualVM and VisualGC; Practice 3-2: Examining VisualVM; Practice 3-3: Examining Garbage Collection Basics - 5m

OK. Now that we're done with lecture three, let's go ahead and do its practices for lesson three. We are going to start with Practice 3.1, where we set up the VisualVM and VisualGC.

Now, I've done this, by the way, before I started teaching this lesson, so that I can do a demo for you over there. So I do a J VisualVM. And I started that, which is already done, by the way. It's not going to give you those warnings and so forth, because I already worked with it. So it's all done. OK? That's why you see basically the VisualVM. So and then I added the plugin, the VisualGC plugin. So I did that.

In the second exercise, we now examine the VisualVM. So here, they want us to examine the VisualVM user interface. The assumption that VisualVM and VisualGC plugin are installed. And of course, in our labs we should again, see this, a command line example, which by the way I'll see it here in my lab three. And then I see this one here, and I'll just open it with the AG edit. And here it as a command, you know, basically that I can go ahead in this case and run in the-- that's what they asked me to do, if you take a look here. OK?

So we run it and then of course all the local JVMs are listed on the Application tab. I know they're on the left. Open again any of the running JVMs. Right click on 2D and open it. So if I take a look at this and basically let it run. And minimize this, I don't need it any more. This one also. And I right click on the 2D and open. And now it's going to open for the two dimensional application.

So we'll notice that a new tab is created and the JVM along with several subtabs is created. And again, the Monitor tab shows graphic display, CPU usage, along the memory usage. OK? We're going to take a look at the Monitor tab. That basically shows here the CPU usage, along with memory usage. OK? The heat, and so forth, the classes, and threads, kind of similar with J console.

And we can also look at the thread, you know, a section of the monitor, you know, that show us that different threads are running. And then of course, the sampler, the Sampler and Profiler tabs are again, discussed in more details later on in the practice. OK? All night.

And in the practice 3.3, they want us to click on the VisualGC. OK? And of course, examine the VisualGC that is now running in the right panel. And should not see the graphs on some systems. Deselect the histogram option if you want. OK? And click on the transforms just so you can see. It's already clicked on the transforms. OK? And pretty much you can observe in all generation increasing, you know, and so forth. That's basically what we're doing here.

That would be what they want us to do in practice 3.3. OK? And that's what we see here in-- so we can always, by the way, deselect. So we can deselect the graphs and just see only the in-space versus the old generation, the survivors, and the permanent generation.

We can add the graphs here. That pretty much gives us the compile time, the class loader, the GC time, [INAUDIBLE] space, the five O zero survival one time, the old generation, permanent generation, and so forth. We can also add the histogram if we want to. And that's pretty much what they want us to do in this practice. Thank you.
