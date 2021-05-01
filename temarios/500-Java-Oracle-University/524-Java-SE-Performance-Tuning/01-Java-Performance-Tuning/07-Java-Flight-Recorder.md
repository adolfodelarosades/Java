# 7: Java Flight Recorder

1. Java Flight Recorder - 18m
2. Practice 7-1: Starting a JFR Recording from Mission Control; Practice 7-2: Reviewing the Java Flight Recorder General Tab Group; Practice 7-3: Reviewing the Java Flight Recorder Memory Tab Group; Practice 7-4 Reviewing the Java Flight Recorder Code Tab Group; Practice 7-5 Reviewing the Java Flight Recorder Threads, I/O, and System Tabs; Practice 7-6: Reviewing the Java Flight Recorder Events Tab Group - 16m
3. Practice 7-7: Save a Template File - 3m
4. Practice 7-8: Start Flight Recordings from the Command Line - 6m
5. Practice 7-9 Manage Flight Recordings with jcmd - 3m

## 1. Java Flight Recorder - 18m

Let's go ahead now and take a look at Lesson 7, where we're going to discuss the Java Flight Recorder. In this lesson, we're going to describe the Java Flight Recorder. We're going to describe the Java Flight Recorder architecture, start the flight recording, manage a flight recording, and of course, analyze a flight recording.

So we just said that in this performance tuning course, we do a little bit of monitoring. Then we do a little bit of profiling. Profiling would be very useful where you save some events of the JVM so that we can go ahead and do some analysis. Recording and analysis tools for Java JVMS basically records the JVM events in the background, operates unobstructively with minimal impact on the performance, and creates, of course, detailed recording of JVM events.

And then after that, we analyze the recordings in the Mission Control Management Console, again, which provides us with detailed information and analysis tools and, of course, covers almost every aspect of JVM activity.

So here is how the Java Flight Recorder works. So you've got your Java events, or Java API events, or any type of Java events happening under JVM. And all of those events are pretty much copied into a global buffer. And then all are connected together and saved into a file in a disk trunk.

So for the flight recordings, they're nothing but events that are recorded. We can specify the duration event that has the start time and a stop time, or an instant event that only one time, or requestable events that are polled with a certain frequency, or a timed event like a duration but with a threshold.

All the recording, by the way, files or the JFR recording files will end up having a .jfr extension. In fact, before starting this lesson, that's exactly what I did. I actually went ahead and did a recording of five minutes. And now I have basically the event now recorded. And then we can go ahead and do some analysis on that.

Basically, these recording files, they are .jfr extended. And they are binary files. And they're self-contained and self-describing. And as you know, the type of recording, you can have continuous or timed.

And of course, what you need to do to start the Flight Recorder, first of all, the flight recording can be started, in this case-- and you must have, by the way JVM 7 update 40 and up. So you can start it from the Mission Control.

And that's what I did, in the Mission Control, that's basically what I did. I just went to my browser. And then I went ahead and clicked on Start Recording. And then I decided about that it's going to be five seconds. And then I decided to profile on the server.

And then, next, I basically captured everything you know heap statistics and class loading, and so forth. And I can go ahead and do it on exceptions and errors, if I want, on the whole thing. And then pretty much making sure that I got the whole Java exceptions enabled, and so forth. And so I already did that, so I don't have to start it again. And that's what I ended up with.

You can do it from a command line using the UnlockCommercialFeatures, the FlightRecorder command, then the FlightRecorderOptions. You can also use the jcmd, which again allows you to start, stop, and check on the flight recording for the JVM. You can also start multiple flight recordings that can be simultaneously started and are working at the same time.

And of course, looking at the JFR user interface, basically, we use the Mission Control. That allows us to start, stop, and monitor the recording. And the flight recording user interface has a bunch of tabs, the General tab, the Memory tab, the Code Threads tab, the I/O, the System, and the Events tab.

And so this is basically how we start the recording. And I just did it for five minutes. And then this is pretty much what I ended up with. OK, let me just go ahead and-- I would rather look at the one that I did, rather than going and looking at what's going on here in the screenshot that were taken a while ago.

So this is basically my recording that I've done. This is the General tab. As you see here, the General tab, basically a group pretty much gives you the default view of your JFR after you open the flight recording. And the tab shows CPU information, along with general affirmation, about the JVM. That's what we have here.

And of course, we have a range navigator that we can go ahead and make use of. And in the range navigator, I can always move this range navigator too. For example, maybe 1 minute at a time. Let me go ahead and make it like that's 1 minute, 12 seconds. Let me go ahead and go down all the way to 1 minute right now, like that. And that's what I have. And now I can slide this and see pretty much what happened 1 minute at a time, if you want.

OK, I can keep on sliding it and see the behavior, in this case, of my application and all the events that are happening, while of course, moving it, sliding it a little bit at a time. And so far, that's basically what we're doing here. You can double-click on it, and you get the whole range. That's basically what happened.

And if you take a look here, I keep on clicking and moving. So what I was doing, I was just running my application and moving from one tab to another tab and changing some of the parameters so just to have an idea. Sometimes I can add more clips, and so forth. And basically, that's what I was doing, and looking at the Composite, looking at Clipping, looking at Colors, looking at Images, maybe a little bit of Contrast, up and down, and so forth.

I'm moving this a little bit, going back to Transforms, maybe adding a little bit of Images. So that's what I was doing. And that's exactly what you see here, how basically I keep on doing it. That's what happened. That's why we get this type of a graph.

Now let's click on the Events. And the Events tab basically provides detailed information about the events captured in the recorder. As you see, you can notice that the event types browser is populated in this screenshot. And of course, the event type browser enables you to select or deselect the event information that is displayed in this [INAUDIBLE] group. That's what we have here. That's the overview.

Of course, you can take a look here at the Log tab. And the Log tab, what it does, in this case, it shows the log of all events from the recording. Events can be filtered and examined individually, if you want. So here is one example, one event. Here's another event, and so forth.

We can also look at the Graph. And the graph shows the event activity grouped by threads. And here we have the Main. And you can look at some of the events under the Main. You're also under the Runtime. And you can take a look at some of these, and then of course, under the System. That's what we have here.

We can also look at the Threads. And this gives us the number of events that happened for every thread. Again, the total amount of time consumed by the events is also shown here about all the threads that were running. OK. All right.

And we can also go and select the Memory tab. And that gives us also information about the memory-related events during the recording. From there, we can look at the Garbage Collection tab. And that tells us about-- the Garbage Collection provides an overview of garbage collection during this recording. Again the Heap graph at the top of the page shows Committed Heap, as well as Used Heap. Of course, the garbage collections and their times are superimposed in their graph, as you see here.

You can also look at the GC Times. The GC Times basically displays detailed information about the GC statistics. Here are all of them, and [INAUDIBLE], and so forth here, the Young generation, how many? 46. The Old generation is 63. The Average Time, and the Maximum Time, and the Total Time, and then here, All Collections Total Time, 109, the Average GC Time on both the Old and Young generation, the Maximum, and so forth. OK.

You can look also at the GC Configuration. The GC Configuration shows configuration related data for this JVM. As you see here, we have the Young generation and the Initial Heap Size, the Minimum Heap Size, the Maximum Heap Size, and on and so forth.

We can also look at Allocations. And Allocations basically shows the memory allocation that took place during a recording. Allocation statistics are divided into allocations that are inside the Thread Local Allocation Buffer, which is TLAB, the TLAB that you see here.

TLAB Count, which is basically the Thread Local Allocation Buffer, which we see here, TLAB Count and the Maximum TLAB Size, and the Minimum TLAB size, and so forth. We can actually select here, Object Allocation. This is TLAB Allocation, and so forth. You can combine both.

We also can look at Object Statistics. And the Object Statistics here shows information about the amount of memory used by objects on the Java heap. Again, the top in this case, a Grower table shows the object types that grew the most from the beginning of the JFR session in this case. There I am. So that's what we see here. OK.

All right, and we can also look at the code. And the Code tab provides basically information about the amount of execution time that was spent on various pieces of code, as you see here, Java [INAUDIBLE] the pipe, the swing, and on so forth.

We look at the Hot Methods. The Hot Methods are the methods that the application spent more time on, either would be the ones where the applications spend more time, in this case, so those methods like getEntry, and so forth, that you see here.

You can look at Exceptions. And that shows us all the type of exceptions, and of course, the stack of exceptions that happen. And you can go ahead and look at every one of them and look at the Stack Trace, and so forth.

You can also look at the Threads. And the Threads also provides an overview of the thread activity during the recording. You can look at the Hot Threads, which is basically here, showing you the-- similar to the Hot Methods, where you see where most of the hot threads are being used in this case. As you see here, the event queue is a good chunk of it, and so forth.

And we can look at the Latencies. The Latencies basically shows where the applications spend most of its time waiting based on events. Here we have the Wait and the Sleep, and so forth.

We can also look at the Thread Dumps. And these are thread dump compiles, a thread dump that occurred during the recording. Again, selecting a thread dump shows you a detail of that. Here is, for example, one of them. You see the detail of the thread dump. And you can select another one, and so forth.

You can look also at the I/O Socket Read, if you want, File Read and File Write, and so forth. And here's the Socket Read. But basically, it shows you if there is any type of-- all my reads here. We don't have much.

We could also select the System. And that also basically gives us information about the system that we are using in the operating system, and so forth.

So what I have done here is I just went through the example that I went through, that I recorded, and basically went through all the different tabs and the different subtabs, and so forth. You can try this. By the way, there's a bunch of practices on this. So it would be nice to try those.

And of course, in the lesson, that's what they want us to go through, more or less, the different tabs, except that instead of going through the ones that are already-- the screenshots of the ones that were done a while ago, I just went through the example that I went to and that I just created in the lab machine. That's basically what we have done.

Of course, configuring your Java flight recorder is important. So you have a template file that determine which events are recorded. Again, you have the full templates that allow you to do continuous recording. Or you can do profiling, and so forth. And you can customize this template too, customizing events through Mission Control interface can be done. Or you can go ahead and use the template file itself. And where you save a session to a file and create your .jfr file, of course, you would use your XML in the file, which is editable by hand. Then you can change it any way you want.

Some of the JFR pitfalls that typically we want to avoid, sometimes not accounting for thresholds. Thresholds are very useful for keeping performance up while still detecting outliers. So interpreting results can be confusing without threshold accounting.

Example, thread T has been running for two minutes, and a sum of latencies is one minutes. So what happened? Was thread T running unblocked for one minute? Of course, in this case, there must be some kind of an exception where the scheduler just suspended that thread.

Or not accounting for CPU load. Again, do not make a decision based on method profiling data if there is no lead, or rather, no load. That's what I meant to say. And if you have a full load, looking for latencies may be a waste of time too. So be careful with that.

And basically, when you're reading [INAUDIBLE] my data through the socket, it might be a good idea to read the whole data and then process it, rather than processing one record at a time. That can take longer, in this case.

And that's pretty much what I wanted to say about the Java Flight Recorder. Now don't forget we have really quite interesting type of practices. Please try them. They're really quite good. And we'll take a look at them later on. Thank you.

## 2. Practice 7-1: Starting a JFR Recording from Mission Control; Practice 7-2: Reviewing the Java Flight Recorder General Tab Group; Practice 7-3: Reviewing the Java Flight Recorder Memory Tab Group; Practice 7-4 Reviewing the Java Flight Recorder Code Tab Group; Practice 7-5 Reviewing the Java Flight Recorder Threads, I/O, and System Tabs; Practice 7-6: Reviewing the Java Flight Recorder Events Tab Group - 16m

Now that we're done with the lecture in lesson 7, let's go ahead and take a look at the practices in lesson 7. We'll start with practice 7-1. Here, we are starting the JFR recording from the Mission Control, basically, following through the steps here. I already recorded that ahead of time, so I already have it.

But basically, the recording pretty much straightforward. You right-click and click Start Recording. Here, they want us to put five minutes and then they want us to a profile on the server. And then, of course, they want us to select exceptions, including errors.

And then select, of course, the heap statistics and the class loading to make sure that in this case, we do have both enabled and stock trace under the Java exception. I already did that, so I don't have to click. And that's what I got as a recording.

Now in practice 7-2, they want us to review the Java Flight Recorder General Tab Group. Basically, following through these are basically tasks in 7-2. They want us to basically, look at the General Tab Group, which basically shown in Overview tab, in this case, by default.

So we do see the performance dials that you see here throughout the five minutes. And of course, we do have, in this case, that's the overview that we see over there. And we can see pretty much also the CPU usage here and the heap usage that you see here. That's the two tabs that we have here.

And then, of course, we do have under the JVM information, we have all the JVM information related here-- basically, more details about the JVM, which is displayed here. Under the system properties, we also have here, information related to the property set on the JVM.

We do have a filter here, that allows us to filter all kind of information. For example, I can go ahead and put star VM, and that will give me information about the VM here-- specification name, the vendor, the version, and so forth.

We can also, under the filter, we can pretty much also look at different type of information. That's basically, what we have here. And of course, that's what we have-- all of that-- here. Here's the recording tab. And then, the recording tab, we can review the event settings in the middle page here.

We have all these events that we see here. We can scroll through the values to which options were enabled and so forth. We can do all of that. And you can go ahead and look more into this if you want.

And going back to the, in this case, the General tab overview, one thing that we can do is we can go ahead and shrink and synchronize the section any way we wanted. And we can set it, for example in this case, for one minute. Let me just make it a little bit here, close to one minute.

That's it. And then, we can scroll right through the different times, one minute at a time, and see the behavior of my CPU usage in this case, and also the heap usage too, and so forth. So as you see here, it changes from one to the other one and so forth. If you double-click on it, you pretty much go back and see the whole range.

So then, of course, in a practice 7-3, they want us to review the Flight Recorder Memory tab in this case. So following the steps, basically, we are going to click on the Memory button. And then of course, this basically, gives us some general memory-related information display that you see here.

And we can click on the Garbage Collections. And here, we can also basically, review the information related here about the heap information, in this case. And we do have the default graph that shows two graphs, in this case. And the heap memory used is superimposed with the paused times for the garbage collection.

And we should note that every dataset on the graph can be unchecked, and checked, and rechecked. Some of the items, if you want, on the graph, you can go ahead and do that, and so forth. So basically, this allows to review the garbage collection table that you see here.

And of course, here, we basically can look on and sort the garbage collection table by longest pause and so forth. So we can basically, sort it any way we want.

We can click on the GC times, and this of course, allows us to review some of the range navigator features. And we should note that only GC post times are shown in this graph. We can identify a high activity area, in this case, in the range navigator. And we can just go ahead and work that any way we want.

We can click on-- and basically here, allows us to see all kinds of information on the collection post times here, and the GC pauses per GC, in this case, that you see. Here's the young collection total, the old collection, and then the total overall total.

So for example, the young 78, the GC count for old is 11, and the total is 89. And then, you have the average time for every one of them and the average time for the overall all the collection total time and so forth.

We can click on in this case, pretty much identifying the GC configuration in this case. And so this again, will display some information. We can click on that Allocation tab-- here, Allocations tab. And again, we should note that there are three tabs right under the range navigator here. Here are the tabs.

So these are basically, again, showing us different type of information that we can investigate in this case, based on the classes. You know, here is the class chart, and then the invocation event, the short, the long, and so forth.

In practice 7-4, we want to review the Flight Recorder Code tab. So we can go back, in this case, following these steps. We can click on the Code button. And then of course, over there pretty much we should see the hot spot packages and classes for our application. Here, they're all displayed, as you see here.

We can click on the hot methods, and this basically shows us here, that the hot methods that the application spends the most significant amount of time executing in this case, and they're all displayed as you see here-- these methods.

And basically, that kind of gives us a little bit in this case about how actually all of this is in this case. And you can click on any one of them and see the different methods and how they're called-- which one calls the other one and so forth,

We can click on Exceptions, and again, we should notice here, that the information about exceptions encountered during the recording is displayed. And we can select an exception, any one. And then, we can click also the stack trace. And how all of that is in there basically. You can actually investigate this any way you want.

And then after that, they want us to look at practice 7-5. Here, they want us to review the Thread, the IO and the System tabs. So again, following these steps, basically, this will allow us to first look at the threads. And then, so that's basically the information about the overview of the threads information here.

So that's again, pretty much this shows information similar to the hot methods, but data is grouped by threads here. We can click on any thread and then work with it, in this case. So here are the hot threads. And we can click on any one of them and see basically, the information related to those threads.

We can click on Latencies. And this latencies basically, shows us the stack trace provided a list of methods in this case. So we have the wait, and then here is basically the stack, all the methods being called here.

We can click on the IO button. And this again, we should note that there is no file activities in for this application. Basically, we have we have nothing here. We can take a look at the socket overview, just if you want to look at the socket read.

And then of course, we again the socket reads occur during the duration of the recording. [? And so forth, ?] you can [? have some. ?] But you know, there's much information, especially in this application.

You can also click on the System button. This will give us, of course, detailed information about the system on which the recording was made. And we can look at the processes in this case, and the environment variables that we work with, and so forth.

In practice 7-6, they want us to look at the Event tab group. So following these steps, we can go ahead and click on the events. And again, we should note that the page displays information about the types of events recorded during the session.

And we should also note that the event browser on the left, basically, in this case, we see allows us to select which events are shown in the view, and other GFR tabs, and so forth. And let's leave the [INAUDIBLE] and so forth.

And we can click on the Log. And the Log tab here, basically, it would be showing us a log of all recorded events is displayed here, as you see-- every one with the event attributes. So that's what we have here.

And we can of course, click on the Graph tab. And the Graph tab here, basically, displays groups of threads and the events recorded on those threads. And as you see here, we have the main. And in the main, we have all these. And then, under the Run Time, and then of course, under the System, we've got all of these.

And we can click on the Histogram. And so here, we can click the Group By, and we can go ahead and basically, group them by any way and select the class that we wanted, in this case, to group by. We click on the Overview tab. And then, we can go ahead and filter events to see what data is displayed.

And as you see here, we can select basically, anything we want here. So this is more or less, just a way to look and see what we can get as information here related to this practice.

Of course, you're welcome to investigate this more and work with it, by basically, selecting anything you want and see what's interesting and what you can see in this. And that's what they want us to do in this practices, all the way until from 7-1 to 7-6. Thank you.

## 3. Practice 7-7: Save a Template File - 3m

Let's go ahead and take a look now at practice 7-7. Here, we're going to save a template file. So here, we create a template file from a previous flight recording. So we'll follow these steps where, in this case, these tasks will say go ahead and click on the JVM browser, expand the entry to the JVM running mission control, and then of course, select the-- in this case-- a flight recorder. And we go ahead and right-click and start the flight recording.

So here, it shows us that, in this case, the Event setting would be the one that we selected last. And of course, here, we go ahead and click on the Template Manager. And then, we select the setting for the My Recording Last Started. And then, we click on the Export file.

And then of course, this will open that small window over there, save the template-- in this case-- in your document directory, which is My Recording in this case. This basically saves the file as myRecording.JFR. And then, we click OK. And then, we click another OK.

And now, we open the G Edit-- which basically would be this one here-- and then, open the My Recording, which in this case, would be under Oracle. There it is. And we open it. And now, you see it here. And which is an XML file. We're going to view the file to see if we can find any of the selections that we've done before, and just by kind of looking at it.

And basically, here, we see the name sampling interval, and thread [INAUDIBLE] interval, and so forth. So you can just look at it more or less and see what all kind of information in this XML file. And that's why they want us to do in this practice, which happened to be practice 7-7. Thank you.

## 4. Practice 7-8: Start Flight Recordings from the Command Line - 6m

Let's go ahead now and take a look at practice 7-8. Here we're going to start the flight recordings from the command line. So we are going to start first running the-- start basically this Java2D and a JFR continuous recording. That's what I basically have done here in my command line, already did that, started my, also, a flight-- a mission control, rather.

And if you follow the steps here, they want us to basically locate the JVM for the Java2D demo and then expand the options. And then we can see that the continuous recording is indicated by the infinity symbol, which, by the way, we see here, just by expanding these and so forth. And I can go ahead and right-click and stop it here if I want, and that would be stopping the recording.

Or I can go ahead and right-click and select Dump. This will give me the Dump Recording window that you see here, dialog box. And From the Dump Recording, you can go ahead and choose to save the entire recording or only part of the recording that we want here, the whole recording or part of the, and so forth, or interval recording, whatever we want here. OK, and of course, once we made the selection, we can go ahead and click on Finish. And this will, of course stop the recording, OK?

And alternately, if you right-click the recording and select Close, that also will do it, OK? And then just close, and that will also stop the recording. And that's what they want us to do in the first part.

And then after that, they want us to start now the Java demo, so I'll go ahead and stop, in this case, my Java demo in this case by doing a Control-C and stopping it. Let me do a Clear here. But this time I'm going to run it using this command here, OK? And that's what I have here, and that's basically what I have here in this case.

And this is used in the second command here, which, by the way, will start the Java2D with a continuous recording that dump, rather dumps its content to a disk on exit. So we go ahead and start that. And then so we let the recording run for a couple of minutes, and then we stop that if we want, OK?

So that's basically what we have done here. You still, by the way, can see it here. This is-- no, let's ignore this. And you will see that there is a continuous recording here, indicated by the infinity here that you see, OK? So you run it just for a couple of minutes, whatever it is, and then stop the demo.

OK, so just taking some time here, just to give it some time to run-- that's basically what we're doing here. And then we can always, in this case, that's what they want us to do, and then after that, we stop the demo. That's exactly what we are doing here. So basically, run it for a couple of minutes, and then stop the demo. That's what they want us to do, OK?

And, of course, let's go ahead and stop this demo, in this case, just by clicking on Control-C. That is stopped now. And then, of course, we can go ahead now and look under the Documents. And in our case here, and just again following the steps here, look in the Documents directory for the recording. It should be there, named with the current date and time, and that's basically what we see here.

Here it is, that we just created here. And we can do a fixed, a timed two-minute recording with the next command. And this is basically following the next command here. And we can do the same thing.

So we'll go ahead, in this case, under the-- first of all, we'll select the next one, which is this one here. And that's the one that they want us to run here, but this time using two minutes. So right-click and Copy. [INAUDIBLE] do a clear here, so that list, and then paste that. That makes it two minutes here, as you see here.

And then we'll start it. And then, of course, in this case we let it run, OK? So we do a fixed two-minute recording with this command and then exit the Java2D. And that's what they want us to do in, basically, the last part of this practice, OK? And that's what they want us to do from this practice, which is 7-8-- thank you.

## 5. Practice 7-9 Manage Flight Recordings with jcmd - 3m

Let's take a look, now, at a practice 7-9 where we manage the flight recording with jcmd. Here, we're going to first start the Java2D demo and JFR continuous recording using this command. So in this case, I just copied it from the last one here for 7-9. And then I have it here and go ahead and start my application. OK?

And then, of course, after that, they want us to run the jcmd to get, in this case, the PID for that 2D. So let's go ahead and do that. This would be in the second part. What I do, run the cmd jcmd. That gives me, in this case, the PID for that Java2D demo that I'm running. OK?

Then after that, they want us to use, in this case, get the list of the JFR commands that you want to use. So I did run this before. And I can go ahead and just, in this case, can I use the upper key to get it. And that's the jcmd Java2D help. This will give me a whole list, in this case, of the commands, JFR commands.

And I want to go ahead and do a check. So I'm going to use the JFR check, in this case, which I already used before. And this basically gives me here, the recording. OK? The maximum age is basically five minutes. And it's running, as you see here.

And I can always stop it, so by doing a JFR and then do a stop. Again, I'm just following the steps here in what they tell us. So I'm right here, here. OK? And that's basically what I have here. And I'll go ahead and click on it. And then this provide either name or a recording, in this case. So this will stop the recording. OK?

And, of course, we can review the options to start, you know, if we want to start, in this case, the recording too. We can go ahead and do that too. And, again, start the recording, no limit, duration, and so forth, in this case. And then, of course, after that, they want us to exit the application. Control-C, this will exit the application. And that's what they want us to do in this practice. Thank you.
