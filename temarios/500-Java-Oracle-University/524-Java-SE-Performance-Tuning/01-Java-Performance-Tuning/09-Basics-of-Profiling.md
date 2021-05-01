# 9: Basics of Profiling

1. Basics of Profiling - 11m
2. Practice 9-1: Application Profiling Using NetBeans Profiler - 6m
3. Practice 9-2: Profiling root Methods - 5m
4. Practice 9-3: Exploring Thread State with NetBeans Profiler - 3m
5. Practice 9-4: Modifying the NetBeans Profiler Session - 4m
6. Practice 9-5: Attaching the Profiler to Another JVM - 3m
7. Practice 9-6 Profiling a Web Application with NetBeans Profiler - 6m

## 1. Basics of Profiling - 11m

Let's go ahead and take a look at lesson 9, where we do some basic profiling or basics of profiling. Here, we're going to profile an application using the NetBeans Profiler, the Flight Recorder, jmap, and jhat. We're going to describe the profiling features of Oracle Studio and profile the CPU usage to improve application performance.

Let's start with tools for profiling an application. One of them is the NetBeans Profiler, which is an excellent tool. We'll take a look at that. We also have Oracle Solaris Studios. That's another one. Jmap, jhat, which are command line. And DTrace, which is, by the way, also another tool that we don't cover in this course, but it does its own courses. OK?

And, of course, we do have free tools like Oracle JDeveloper, the Flight Recorder, which we have seen previously. Let's take a look at the NetBeans and NetBeans Profiler. You know, the characteristics, it would be allowing us to do CPU profiling using bytecode instrumentation. It has a very low overhead profiling. Thus, people like it.

And pretty much, it has very, very excellent capabilities. You can do method profiling, where you select all the methods for profiling or select specific methods. You can also limit everything except JDK classes. You can do memory profiling and heap profiling. You can also do memory link detection.

And to use NetBeans, basically, install it on any platform that you are working with-- either Solaris, Linux, Windows, or Mac, and so forth. And the NetBeans is available. And you can go ahead and do that. Let's go ahead and do-- you guys are going to do a NetBeans profiling on your application. But let's go ahead and try this.

So first, you run your application for some time. Just to kind of create some threads and so forth. OK. And then, you close it. And then, you right-click on the project and, of course, click on Profile. Here, we're going to do a quick profile. We're going to do some CPU profiling. We're going to provide only project classes, OK?

And under the filter-- so we can go ahead and pretty much, in this case, under the Edit Filter-- it shows that we're excluding, in this case, the Java core classes. We're doing all of that. And then, we just click on Run. And that will start the profiler, OK?

Here's your application starting. OK. You can go ahead and basically-- and then, you can scroll down and see, in terms of the number of total memory, and memory usage, and so forth, and under the, of course, VM telemetry, you can see, in this case, in terms of the number of-- you know, the way it's being used in this case.

And if you scroll up a little bit, you know, here, you can take a look also at the threads. But what we're interested by, if I scroll up, I'm interested by the live results, OK? This shows me the different type, you know, in this case, of methods that are, in this case, running. OK. So and you get, of course, there all the questions that it goes through. And you will get to play with it in the practice.

You can do also the Java Flight Recorder. And we've seen that earlier when we went through the flight recording lesson, where we can profile details and excellent profiling capabilities. You can use the profiling template, you know, slightly more intrusive.

But you can go ahead and record all kind of JVM events of your application, either continuous or timed. And you can use it to do some analysis, where you can look at the hot methods, the heap, the object allocations, the contentions and locks. Really, really quite powerful.

You can also use the Oracle Solaris Studio, which is also useful. It basically allows you to collect and analyze. It has Collector and Analyzer capabilities. It brings you some statistic CPU profiling. You can specify, in this case, the sampling interval-- 1 second. Users and system CPU time can be used. And you can use it inclusive or exclusive in terms of the methods, OK?

You can find out the time spent in locks, view the Java bytecode in User more, in Expert mode. You can also view the JIT compiler, generated assembly code in the machine. You know, it supports specific CPU counter collections, too.

So and the way you run it is just collect dash j on the Java batch processor and go ahead and run it, OK? And we don't have any practices in this course about it. But it also is an excellent tool that you can actually make use of. It runs on Linux, too, by the way.

And once you get that, you can look at the Analyzer. The Analyzer is Graphical User Interface Analyzer that allows you to see all kinds of information. It's basically a tool that is graphical user interface tool that competes with many, many graphical user interface tools.

Another set of commands that are useful for you to do a little bit of profiling is the jmap and jhat. Jmap, what it does, it produces the heap profile. And jhat is the one that allows you to analyze, read and analyze the data, OK? We do actually have a practice on that at some point in time. So this jmap and jhat, they shipped with the JDK, starting JDK 5 and up, OK? It's a command-line tool, you know, it does heap memory profiling, permanent generation statistics, and supported on all platforms.

DTrace is another tool. It's not covered in this course, you know, the detailed coverages is beyond the scope of this course. But, you know, we do have a course about it. But it's also an excellent tool that is quite comprehensive and that helps you troubleshooting your kernel, your application problems and on the production system. It was originally developed on Solaris, but it also runs on Linux, and it's also an excellent tool that you can look into it, too. And, of course, Oracle provides that. And it has its own course, too.

In terms of the CPU profiling, what does CPU profiling typically do for us? You know, it basically provides information about where an application spends most of its time. CPU profiling is needed or beneficial when there is either a poor application throughput as measured against the pre-determined type of target or benchmark.

Maybe you have saturated CPU usage. Maybe have you have high system or kernel CPU usage. Maybe you have high lock contention. All these are different types of problems that you might have, OK? Or maybe idling problems and so forth.

In terms of the strategies on how to go about doing CPU profiling, we tell you, start with a holistic approach to isolate major CPU consumers or hot methods. Look at methods with high user and/or system CPU usage. Look at both inclusive and exclusive type of method times. And if the holistic approach does not give you a good result, then, go ahead and profile a subset of your application.

Again, this is best when the holistic approach is too intrusive. And by the way, the subset of a profiling is easily done through the NetBeans Profiler. It can profile a set of methods, a package, and so forth, class, and so forth. Some of the anti-patterns that we identified and we'd like to discuss, and they're related to the maps and high CPU usage.

So observe when you work with maps, sometimes, you want to look for data, and you say, does the map contain the key? So look at a stack trace for unnecessary call flows, for example, here, if I do if map contains the key, go ahead and get that. So it might be a good idea to just read the value. And if the value exists related to the key, then, that's good. Work with it. If you get a null, that means it does not exist.

Rather, if you do an if and try to check, that's going to consume a lot of cycles and might be affecting the performance of your systems. Other use cases using map methods would be put the same thing and remove and so forth. That may be also eliminated.

Again, looking at the anti-patterns in method profile, we tell you, observe your high system CPU times. Look for a monitor contention. And monitor contention and high system CPU have a strong correlation. So consider alternatives to minimize your monitor contention in this case.

Example, if you are reading too many data through a socket, it might be a good idea to use a non-blocking socket channel to read the whole data at once and then, after that, process that. And that's pretty much what we're going to say about profiling. You guys get to do a bunch of practices here where you're going to use some of the tools to handle-- to do the profiling for an application. One of them is the NetBeans Profiler.

## 2. Practice 9-1: Application Profiling Using NetBeans Profiler - 6m

OK, now that we're done with a lecture of lesson 9, let's go ahead and look at its practices. We'll start with practice 9-1, where we basically do an application profiling using NetBeans Profiler. So we start NetBeans, which I already did, an open the project and run it first. OK, and then I start the application.

And then now we can go ahead and, again, following the steps here, just reading steps step-by-step and continuing with these-- so what I do next is I right-click and then select Profile. And then, of course, here we're going to do a quick profile on the CPU profile in this case. And we select all profile, all classes. OK, that's what we have here.

And then we click on the Edit Filter Set, and we should see that in this case, the Java core libraries are excluded by default. So we click OK here, and we're good, OK? And then we go ahead and click on Run. OK, and then here, basically, now we have the application running.

OK, we can click on a few tabs here, just so that we can make it a little bit interesting and so forth. And then they want us to click on the Colors tab, so I just did here. OK, and then, of course, they want us to switch back to the IDE and scroll down the profiler and look at the basic telemetry here. It gives us basically, in this case, some information-- the number of threads and some visible information that you see over there, OK?

And we can scroll up and now click on the live results. And that will open, in this case, the live results of the different methods that you are basically working with here. And then we'll go ahead, in this case, and stop the profiler. There's a Stop here that will stop the profiler, OK?

Now we want to profile the entire application with instrumentation. So we'll right-click on the Java2D. Go back to the projects. And then we'll go ahead and click Select Profile, but this time we are going to click on the, in this case, select the Advanced setting that we see here. OK, and we click on the filter, edit the filter set, and check the Java core classes, OK?

And then click OK. And then, of course, select Profile All Classes, and then, of course, we'll go ahead and click on the Run. And so that's basically what we have here, and I'm running the application. OK, we can click on View tab, so it's just basically running right now. So let's go ahead and give it some time.

So it's running the application. We can see here that it's basically running the application. But this time, because we selected all the classes and we had checked the core classes, that's why there is lots and lots of work here. And it is just going through the whole application, starting it-- and because there's so many classes involved here, because we inject the core class, so that's why.

And then they ask us to click on a few tabs here and so forth. And then after that, they want us to click on the Colors tab, and then they want us to scroll down. And you see that we have here a tremendous number of, in this case, methods, under the VM telemetry. So here, basically, we have all this information, and that gives us lots and lots of, in this case, methods. See, this is over 20,000 methods.

We don't need to see this right now. So when I chose that, we have lots. And we also can click on Live Results, which, by the way, I already have it here and so on, since I was working with it, OK? So that's comparing-- in this case, you can see that you have more methods that we can see here. It's over 20,000 methods that are running, and that's a lot, OK?

So that's why you can pick and choose what you want to profile in this case. And sometimes picking up an application would be a lot better, so you can see more information, in this case, related to whatever you are a trying to profile here. That's what they want us to do in this practice.

## 3. Practice 9-2: Profiling root Methods - 5m

Let's go ahead and take a look at Practice 9-2 where we do profiling root methods.

In the last practice we demonstrated that some providing tools force us to define the filters of the package and/or class names for what should or should not be submitted by the profiler. And then the profiler supports filters, but it also has a more powerful feature-- the root methods.

So here they want us to open the rotator 3D under the package java2demo.colors. We have it here. And basically, what I'm doing is following these steps here, OK? You guys are gonna to do this in the practice too.

So we locate, in this case, the Render method. And we right click and select Profiling. And then we look-- Add as a Profiling Root Method. This again, will open this window. We'll go ahead, in this case, and selective the Analyze Performance, in this case, and click OK. And we do the same thing for-- repeat the same thing for the Step method, OK, where we have a Profiling, Add a Profiling, and then we click OK, OK?

So in the project, again, we right click on the 2D application, in this case. And we select Profile. And we'll go ahead, in this case, and select the Advanced option, in our case here. So we already did that, OK?

And then from the filter, a drop down list-- in this case, we'll go ahead and select the Profile Only project classes. So that's what we did. And then we can run.

Of course, we clicked on-- so we'll go ahead and click on Run. So it's going to start the application. That's what we're doing right now. And we click on View Tabs. That's what they want us to do-- you know and so forth.

And then they want us to click on the Colors tab, switch back to the IDE. And then they want us to scroll down to the basic telemetry. And you see that the number of methods here is much smaller. It's 1,263 methods, OK? This is because the profiler examined the application starting at the root methods. It has instrumented those root methods and then examined the methods that they call and instrumented them. Then it examined the methods that those methods call, and so on, OK?

So in the profiler we can click on, Take Snapshot button-- here, OK? Again, we should not-- with less instrumentation there is less data to look for. Here the Render method is taking up more time than the steps that you see here, OK?

And then, of course, after that, we'll go ahead and stop the session. OK, and that's what we just did. And we can go back to the-- in this case-- the rotator 3D application. And so we can go ahead and save the snapshot, whatever. For now let's just cancel and go back.

And then, of course, we right click the Render method, and then we do a profiling. But this time we insert profiling point, OK, in-- OK, next, of course, in this case, in the description box dialogue, we select each option and notice the action that it takes, OK-- whatever option here we have, and so forth, OK? Then we click on Cancel.

And that's basically what they want us to do in this practice.

## 4. Practice 9-3: Exploring Thread State with NetBeans Profiler - 3m

Let's take a look now at practice 9-3 where we explore thread state with NetBeans profiler. Here we're going to Restart the Profiling, rerun the session. So this is basically rerun the last profiling session. And we have it now up and running. And of course, we go to the Provider tab in the upper left here and a we scroll down to find the View, subarea here, which is this one here, a subpanel. And then, of course, over there we click on Threads.

And here Enable Thread Monitoring in the right panel. Let's go ahead and do that. We see here the Thread Monitoring. Enable Thread Monitoring in the right panel to enable, again, in this case. So of course, we should note that the thread state is easily observed with the state information color-coded as you see here.

And basically, we can go ahead and select one of them. For example, here if we select the Event Queue. That's what they want us to select here. And we can go ahead and scroll down and basically and see all kind of details in this case about what's going on for that Event Queue.

And we click on the Details. It show us when it started, when it ended and so forth. We can click on the Timeline. That gives us, again, what's going on in this case in terms of the timeline.

So they do not want us to stop the profiling session for this practice. They want us to leave the session running. And that's basically what they want us to do in this practice, which is the 9-3.

## 5. Practice 9-4: Modifying the NetBeans Profiler Session - 4m

Let's continue now with the practice 9-4, where we modify the NetBeans profiler session. Here, we're going to continue to work with NetBeans and the same project from the last practice. And that's what we have here. And again, we're going to follow these steps here.

So if we move here, we see there's a button here that says Modify Profiling Session. That's what they want us click on it. And then, click on CPU. And then, basically, following just the steps that we have here. And then, click on the Quick, in this case, option. And then, click the Run button.

And so of course, in this case, NetBeans profilers can change the profilers in those settings as directed without having to restart the application. By switching to a monitor-only mode there is no instrumentation that allow now-- and of course, but the installation at all now-- and of course, the entire application is running at full speed, as in example.

To show the heat profiling, we can clip on a memory. And we can also see some information over there. So here, VM telemetry. And you know of course, we have a choice here to show the profiling if click on Memory and then running it.

So we can always modify this, by the way, just the threads that we already have seen. But I can always modify this. And then instead, we can go ahead and click on Memory in this case. And then, of course, click on Run. This will show us the information related to the memory.

And we can go ahead and look at the live results here. And of course, in addition to reporting the CPU performance, the profiler reports detailed monitoring of our application memory usage. This of course, especially helpful for tracking down memory leaks. It also helps identify areas of access object on locations.

Access object on location can be an issue when frequent garbage collection events happen or when trying to reduce the frequency of the garbage collections. We can scroll down to the telemetry or the basic telemetry that we see here.

And then, of course, we can see here is basically the VM telemetry that we see here. That also gives us some information in this case, basic. And here, we see the number of threads, the total memory here, and the used memory, and so forth, that gives us good information.

And then, of course, after that, they want us to select profile and stop the profiling section-- which we'll go up. And then, here, we'll stop that. That's going to stop that. So we also have this, which is the reset collector result buffer and so forth, so we'll stop this here. And that's what they want us to do in this practice.

## 6. Practice 9-5: Attaching the Profiler to Another JVM - 3m

Let's go ahead now and take a look at Practice 9-5, which will help us attach the profiler to another JVM. We pretty much are going to run the Java2D using this command, which I already did. So it's up and running, which we have it here up and running. Then we go back to the NetBeans again, following all the steps here.

And in my in this case Main Menu, they want us to select the profiler, and attach a profiler, so we click on Attach Profiler. So the Attach Profiler task dialog box in this case opens. And of course, we should note that NetBeans Profiler also supports attaching to any JVM. It shows you the JVM command line flags that are needed and helps edit a start up script for you to use.

So we select the quick in this case, and profile all classes. We already have it there. And we should note that at the bottom of the dialog box, there is an attach mode that we see here. And in this case, we click the defined link in this case. And the attach settings dialog box appears that you see here.

We should note that the various ways that you can connect to the running JVM for our purposes, the default values are fine. So we click on Cancel, just so that we know. And then of course, we click on the Attach button in our case here, which we already in this case did. And of course, select the local dynamic, in this case, local dynamic, which is already selected, and then click OK.

And of course, select the running Java2D in this case application that we see here, and then we click OK again. And basically, this is the same way that debugger attach to a JVM.

And then from the Main Menu, we can select in this case a profile. And then we can also select the Detach here. And when we select the Detach, we go ahead and close the application by clicking in this case Yes. And this completes basically our work in this practice.

## 7. Practice 9-6 Profiling a Web Application with NetBeans Profiler - 6m

Let's take a look now at practice 9-6, where we profile a web application with NetBeans profiler. First, they want us to add the GlassFish-- basically, going through all the steps which I already did. Then after that, they want us to configure the HTTP monitor for the, in this case, the server will come with the GlassFish server to run on HTTP Monitor tool.

And we basically go through all the steps, here, which I already kind of let me go ahead and try it here. So they say right-click on the GlassFish in this case and select Properties. And then, here, inside, we go ahead and select Enable HTTP Monitor. And they tell us that click the OK to dismiss the Warning message, which we see here. We click OK.

And that's basically, what they want us to do here. And then, we close this guy here. And after that, we go ahead and start the server. Right-click on the GlassFish and start it. This will start our application server. So it's in the process of starting here, as you see here. Basically, we see all the steps here.

So now, it's up and running. It has the green triangle next to the fish-- a icon that you see over there. And then after that, again, following just the steps that we have here. Now, we're going to create a simple web application. That's what we're doing here. Let's go ahead and do that, so just by following the steps, basically.

So here, we'll go back to the Project tab and we'll go ahead and create from the file we create a New Project. We, in this case, expand the sample that we see here. And then from expanding the samples, we select the Java EE.

And then on the right side, we go ahead and select the Servlet Stateless. Scroll down here. We should be able to see Servlet Stateless, which is this one here. OK, then, we click Next. Again, the name of the project here will be servlet stateless as you see here. And then, we click Finish.

And then, you see now, slowly, slowly, it will go ahead and open the project. So that's basically, what we're doing here. And that's what we're doing. So now, you've done Open. And then, we right-click on this-- they asked us, again, following only the steps here.

So when I click on this and select Run, and of course, they tell us to wait about 10 to 30 seconds in this case. So we'll just wait. You know, it's just starting right now. And so the application is starting, it's just taking some time. And now, it's deployed the application, so I have it here.

And now, we're ready to profile. So in this case, we go back to our NetBeans. Then, you right-click in this case, and click Profile. And then, of course, we profile the stateless, which is displayed, and select Quick in this case. And then, of course we'll go ahead and run it.

So it may take, again, 30 to 60 seconds to start and deploy the application, and that's what it's doing right now-- just waiting for the servlet to deploy 30 to 60 seconds, basically, based on what they tell us here in the next page. That's what we have here.

So it may take 30 to 60 seconds to deploy to the application server. That's what we have here. Here is my output, here. It's still deployed in this case. There was some initialization and so forth. And now, it's deployed. And of course, they want us to go to this, in this case, servlet URL. Again, following just the steps here. We are here.

And then, they want us to enter some data here. So enter Tom and submit query. And then, it says hello, Tom. And we can examine again, all of this inside here by looking at the right results. And you see how the say hello, that was called in this case, by looking at the live results.

And then after that, we'll go ahead and stop the profiling. So as you see here, that's basically the live results that we see. We stopped-- they asked us to stop the profiling. And of course, stop the application server, which basically, you right-click on this and stop the application server. And that's what they want us to do in this practice. Thank you.
