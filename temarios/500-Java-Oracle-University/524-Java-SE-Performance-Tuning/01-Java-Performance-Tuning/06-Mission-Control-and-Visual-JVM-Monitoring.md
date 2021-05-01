# 6: Mission Control and Visual JVM Monitoring

1. Mission Control and Visual JVM Monitoring - 14m
2. Practice 6-1: Examining VisualVM Capabilities; Practice 6-2: Examining VisualGC Capabilities - 17m
3. Practice 6-3: The Mission Control General Page - 3m
4. Practice 6-4: Mission Control MBeans Page - 9m
5. Practice 6-5: Mission Control Runtime Page - 4m

## 1. Mission Control and Visual JVM Monitoring - 14m

Let's go ahead now and take a look at Lesson 6, where we're going to discuss Mission Control and the VisualVM monitoring. So we earlier did some monitoring of the JVM using command line monitoring. Now we're going to do some graphical user interface monitoring.

So in this lesson, we are going to monitor the JVM garbage collector by using VisualVM, monitoring the JVM by using JConsole, and analyzing garbage collection data using GCHisto, and, of course, monitoring the JVM using the Mission Control. We're going to identify general information, identify the MBean information, and identify the runtime information.

So we already have looked at VisualVM, and we've had examples before. This basically graphical JVM monitoring tool is very interesting. It's included in JDK 6 and up, starting update 7.

It's an open source type of a product, integrates with all the JDK tools, and includes, of course, analysis and troubleshooting abilities. It can be enhanced with the plugins, and we actually use it with the visualgc plugin, if you remember. So this is the visualgc plugin, which is a standalone type of a plugin, not included in the HotSpot, visually observes garbage collection behavior, and includes information about class loading and JIT compilation. We've seen the example earlier.

JConsole, also, which I ran previously, it's a graphical monitoring and management console. It is included in the JDK, can attach multiple JVMs locally and remotely. And the graphical view, again, can help us see the heap memory, the threads, the CPU usage, and the class loading. And multiple JConsole sessions can attach to a single JVM.

I ran this earlier. GCHisto is another one, which is really an open source type of a project. Not included with the JDK. It summarizes the GC activity obtained from GC logs.

We do have a practice about that in one of the lessons later on. We'll take a look at. It allows you to compare multiple logs.

Ah, the Mission Control. It is basically a group of management and monitoring tools, and, of course, it is quite useful. It has a management console that uses JMX-compliant monitoring tool.

It has a flight recorder that records and analyzes the JVM and the running application. The Mission Control is now HotSpot-enabled, in the sense you can actually use it in the JVM HotSpot. And, of course, we're going to make use of that.

And now the JMX and MBeans. The Java Management Extension dynamically monitors and manages the JVM, and it's built into the JVM. And you have the MBeans, which are the managed means. They are objects that manage the JVM resources. They're stored in the server, and they're managed by the JMX agents.

Again, the JMX connectors connect to agents. So let's go ahead and take a look at it in the practice machine. It would be a lot better to look at it over there. So here, I just started the mission control by just running the command, in this case a JCM.

I also need to run my application, turn on my application first, using the unlockCommercialFeatures here on the Flight Recorder command. And that's what we have here. And then, of course, I can go ahead and restart this, if you want, just so you can see it.

So it's going to start my Mission Control while my application is running, in this case. Let's make it a little bit more interesting. So we have it here.

And all we're going to do now is right click on the 2D and start the JMS Console. And then we see, in this case, the overview, a diagram that we've seen in the lesson. So it's just doing it [INAUDIBLE].

Now we pretty much have it. And you can go ahead and pretty much open all the dials, if you want. For example, here, under the dashboard, if there's a plus here, if I click on this plus, I add a dial.

And it says in this case, for example, I can go ahead and select here. And then here, I can go ahead and look at the attribute name. So I can go ahead and look at the operating system.

If I scroll down here and look at the operating system, here it is. Under the operating system, I can go ahead and look at these system CPU load that I see here, and then I click OK. And then I click OK here.

And that will give me a fourth dial that I see here, pretty much. That's what I could do. I could also, by the way, add in this case a chart. I could do that, too. So in the overview, in this case, tab, I can go ahead and click on the plus here to add a chart.

So I added it, as you see here. And then by now clicking on the Add button, I can go ahead in this case and also choose whatever I want it to show in this case. Imagine, for example, I go under java.lang and then from there I go to the memory pool.

And then from there I can go to the Eden space. And then from there, I can go ahead and look at the usage. And then from there, I can go ahead and look at the used, and then I click OK.

That will give me, in this case, a graph that looks for the used space, used memory in this case-- just as an example. And that's basically what we have here. So it's really quite interesting to see all these type of ways to work with this.

It's really quite interesting as a tool, and we advise you to use it. And by the way, I can reset all of this. If I move, in this case, my image up here-- and this is where it says reset to default control.

If I click on it, it says this will reset all attribute subscriptions in the control to the default ones. Do you want to continue? And say OK and then basically end up with your original one. That's basically what we have here.

And so you can click on the server information, and the server information basically gives you, in this case, information about the server that you use, the operating system, the type of OS architecture, and so forth. So you have all of this, server information, that is showing you the current OS that you're using. We can click on the MBean here, and we can see also all kinds of information here.

That's the MBean type of browser tab. So this, again, provides access to detailed information about the selected JVM that we see over there. From there, I can look, for example, in this case at the Operations tab.

This basically gives me the architecture of the chip and the committed visual memory size and the free physical memory size and the free swap size and so forth. I can click on the Operations tab. This also can give me information about, in this case, the Operations tab, where I can look, for example, here at-- and I can take a look, for example, at the operations here, dump the heap, get VM option, and so forth.

And I can go ahead and look at the Notifications tab. This enables you to, again, subscribe to attributes that periodically publish data. You can go ahead and look at that, and basically you can subscribe to any type of information that you want in this case.

So you can subscribe to this and then get information periodically about what's going on. Basically, that's how it is. Let me subscribe here. You can look out at the Metadata type of a tab.

This basically shows you detailed information about every attribute and so forth. You can look at the-- we can look at the triggers. And the triggers basically enables you to set triggers based on the JVM events, whatever you wanted to, in this case, set as a trigger.

And you can just add these type of triggers and so forth. You can click on Add and do whatever you want to in this case and select whatever you want to select and add, in this case, JVM triggers based on the JVM events. We can click on basically the Runtime tab.

The Runtime tab contains general information about the JVM. So here we have the process usage, in this case, JVM statistics, and some system properties here. You can look, in this case, at the Memory tab. The Memory tab shows you information about the heap and memory.

So here's how the heap is being used, and then here, the free Java heap memory, the used Java heap memory, free non-heap memory, and so forth. You've got all of this. And then the same thing here, the JVM memory statistics and the system memory statistics also gives you the same information about the system.

You can look at the Garbage Collection. That also tells you how the behavior of the garbage collector or the number of collections as well as time-related information-- total collection time, collection count, GC start time, GC end time, GC duration, and so forth. Same thing, this would be on the copy, and this would be on the concurrent mass sweep that you are running-- as an example.

We can also look at the Memory Pool. This is basically similar to what we've seen in the Visual GC on the VisualVM. It tells us about how Eden space and the survivors and the tenured generation and the permanent generation has been used, so it's nice.

As you see, real time here since it's running. So it's kind of nice. Gives you good information about that. We can look at the threads. And this also basically tells us about threads that are running in the JVM, from the CPU usage to the debt loss to memory allocations and so forth.

And we can take a look at every one of them and see the different type of information about all the different threads that are running. And pretty much what I went through this is whatever they want us to go in this case, instead of going through the slides one by one. And these are basically screenshots that we took earlier.

So I actually showed you the ones that are basically in real time in the live machine. That's what I have done, instead of showing you the slides here. So I wanted to try it on the machine. It's better.

And so that's what we went through. And that's pretty much what we wanted to say in this case. So you folks are going to do a practice related to the Mission Control also in this lesson. So, of course, we'll get to take a look at that practice later on.

So here, in this lesson, we looked at basically what we call graphical user interface tools to handle our JVM monitoring, so the VisualVM, JConsole, Mission Control. And we said that the GCHisto, we do have a practice about that. And we'll look at it in one of the lessons later on. I think it was lesson 11.

In any case, try the practices for the lesson, and we'll take a look at them later on. Thank you.

## 2. Practice 6-1: Examining VisualVM Capabilities; Practice 6-2: Examining VisualGC Capabilities - 17m

Now that we are done with the lecture of lesson 6, let's go ahead and take a look at its practices. We start with practice 6-1 and 6-2. Well, in practice 6-1, we're going to examine the visual VM capabilities.

We first are going to run the command that will help us run the Java 2D demo, which is this one here. Of course, I opened the example commands for the different practices of lesson 6. And I copy and paste the first one in the terminal.

And now I've got my application, in this case, running. And of course, they want us to start the visual VM, J Visual VM also. We go ahead and start it.

And so that's what we are looking at here. So as you see here, this is a Visual VM. We can see the Java 2D application on the left side, as you see here.

And we have it, as you see here, in the choices we have local. And which is the local node shows the auto discovery Java processes that can be monitored. In this case, of course specific JMX connections can be added locally or remotely. And then you have the remote also, which the remote node list Java processes running on remote hosts.

We also have the VM core dumps node. This enables viewing of the VM core dumps. And then we have the next one, which is the snapshots. And the snapshots node enables profiler a snapshots to be saved and reopen later. So what are we going to do here is we right click again.

We're just following basically what we are doing in practice 6-1. And then we will go ahead and right click and on the Java 2D, in this case, a demo. And as you see here, we also have choices, in this case, that we can use. So we have different options that you see here from a sample to a profile to the thread down to the heap dump. Applications snapshots enabling heap dump on the OME.

And then of course properties. That's basically what we see here. And of course, in our case, we can go ahead and open the application. So this basically allowed us to open the application in this case. So we should notice that on the overall pattern for the Java 2D demo application open in the right side that you see here.

And then of course, this contains a subpanels, what you see here there that we can go ahead and pick and choose. And we're running the application. So here we do see, for example, in these a six subpanels, which is the overview, and the monitor and the threads and the sample profiler and the visual gc.

So let's go ahead now and just take a look what the applications. So going back to my, in this case, applications. So we take a look at just to kind of look at the different panels. So we look at we have the Overview tab that provides an overview information about the running application and the JVM. So basically all this information here.

And then, of course, if you click on the Monitor tab, this basically gives us now the graphs showing some of the information about the JVM. This includes the CUP utilization and the heap memory, of course, utilization, the number of classes, and of course the thread count. And of course in the Thread tab it provides detailed information about the Java threads in the application.

Then you have the Sample tab. And the Sample tab looks at and acts very similar to the Profiling tab, but there's a big difference. The Sampler tab gets its information by pooling application thread dumps and memory histograms. Therefore no instrumentation is added to the application that has minimal impact on the performance. Of course, this tab is very quick [INAUDIBLE] as a way of getting CPU and memory information.

And then we have the Profiler tab. In the Profiler tab, it provides the ability to do either CPU profiling or heap memory profiling. Then by default, the profiler is not running when you select the CPU or a memory profile.

The visual VM adds instrumentation code to the application that affects the performance of the application a smaller account of, or a large amount in this case, either a small amount or a large amount depending upon the number of methods profiled. Of course, the subject is explored in more detail later on in the profiling lesson. Then we have the visual gc, which by the way, we'll take a look out in the practice 6-2.

And so that's basically what they want us to do in this. Then going back to 6-2, here what we are doing lady and gentlemen, we are actually examining the Visual gc capabilities. That's what we're doing here. So we run the application, which I already did.

Basically running it, in our case here, the terminal. So it's already running. So we go ahead in this case and go back to our visual VM. And here we basically, in our case here, what we want to do is kind of launch the visual VM and we open the application. And of course, here we just kind of do a little bit of overview of the visual gc.

And we go back to my application and just see how we can, in this case, take a look at that application and maybe run it again. Let me do that just so I can go ahead and do a controlled c here. And then run it again. So now it's up and running. And maybe I'll click on transforms just to make it a little bit interesting, in this case.

Going back to my, in this case, my visual VM. I'll go ahead and open it. And that's basically what I have here. And now what I'm going to do is click on the visual gc so I can basically see a little bit of information about the visual gc. So that's basically what we see here.

And if you take a look at the Visual GC tab here, on the right side we see some information, which is quite interesting. Basically, the overview basically displays two or three sections in the right panel, depending on the garbage collector being used by the JVM. And so that's basically what we have here. And then, of course, the whole idea is to basically look at this right side here.

And of course, see how we can again, going back to practice 6-2, they want us to look at the different spaces. So that's basically the, in this case, the panel that I see on, in this case, on a right side of my visual VM. And if you take a look here, you will see spaces. And this is the area that represents spaces. And this spaces section provides a graphical view of the garbage collection spaces.

So this panel is divided into three vertical sections, as you see here. And first to the left side, you have the permanent a section, a permanent space. And then in the next one we have the old or tenured space. And then after that you have the young generation, which is made of the Eden space and then the two survivors. Of course, the screen area is here representing all three spaces are sized proportionally to the maximum capabilities of the spaces as they are located by the JVM.

Now focusing on the young generation, which you see here, and the relationship between the sizes of the spaces in the young generation, a proportion of the visual VM frame is usually fixed in a size. The two survivor spaces are usually identical in size and fully committed. So the even space may be only partially committed with a committed portion of the space represented by the dark gray portion of the grid that you see over there. And then of course after that, we do have the graphs area. The section of the graph basically plots performance statistics as a function of time for the historical view.

Again, this section displays garbage collection status along with dynamic JIT compiler and ClassLoader statistics. And of course, the resolution of the horizontal axis in every display is determined by the interval command-line argument. And of course, the graphs section has a bunch of displays. So basically it displays the compile time, but you see the first one here.

And this graph plots the amount of time spent committing a Java byte into a native code. And the height of the display is not scaled to any particular value. And then after that you have the ClassLoader time. And this graph plots the amount of time spent in a class loading. And loading activities, the height of the display is not scaled to a particular value.

And then after that, you have the gc time. That's the third one. This displayed the amount of time spent in garbage collection activities. The height again, of the display is not care to any particular value. A non-zero value in this graph indicates that the garbage collection activity occurred during the last interval.

Then after that you have the Eden space information. This [INAUDIBLE] much which is the fourth one here, this displays the utilization of the Eden space over time. The Eden space, of course, here is one of the three spaces that make up the young generation. The height again, of this display is fixed, and by default, the data is scheduled according to the capacity of the space.

Then you have the Survivor 0 and Survivor 1 information that you see here, the next ones. And this basically display the utilization of the two survivor spaces over time. The survivors spaces are the remaining two spaces in the young generation space. Of course, the height of these two display is fixed, and by default the data is scaled according to the current display of the corresponding space.

Then after that we have the old generation. This displays the utilization of the old generation space over time. The height of the display is fixed, and by default the data is scale according to the capacity of the space. The current capacity of the space can change depending on the collector being used as the space shrinks and grows over time.

And now after that you have the permanent generation. That's the last one. This displays utilization of the permanent generation space over time. Of course, the height of the display is fixed, and by default the data is scaled according to the current capacity of the space. And the current capacity of this space can change depending on the collector being used as a space shrinks and grows over time.

And so basically the Eden space, Survivor 0, Survivor 1, old generation, permanent generation display can be updated to a show reserved memory utilization by right clicking any of these spaces in the graph window and selecting the show reserved space checkbox. That's basically what it is. And so here, show reserved space as a checkbox if you want, and so forth.

So this basically is a quite interesting type of, in this case, a display because it gives us a lot of information. Another thing that is also quite interesting is the histogram, which by the way, we can go ahead and select it. And that's the one in [INAUDIBLE] over there. For the histogram, the survivor age histogram section show know basically the spaces and graph sections. And so you do have, in this case, in that section, you have parameters.

And the this panel basically for the parameters that we see here, the panel displays the size of the survivor spaces and parameters that control the promotion behavior of the young generation. Every young generation collection objects that survive the collection but are not promoted remain in the survivor spaces of course. And an object's age is incremented every time the young generation collection until the object's age reaches the maximum age as defined by the turning threshold variable, which by the way, varies between 1, in this case, and the maximum tenured threshold minus 1, depending on the utilization the survivor space. If the survivor space overflows, the oldest objects are promoted to the old generation and the utilization of the space does not exceed the desired survivor size.

And then after that, below you have again, the default is always 15. And then you have the histogram. This panel displays a snapshot of the age distribution of objects in the active survivor space after the last young generation collection. The display consists of a 32 identically sized region, one of each possible object age. Each region represents 100% of the active survivor space, and is filled with a colored area that indicates the percentage of the survivor space occupied by objects of the given age.

So as you see here, pretty much it is really a quite an interesting type of a display that allows us to basically investigate and look at how the Visual gc gives us very, very pertinent information in relation to how our application is behaving vis-a-vis the garbage collection that we are using. And that's basically what they want us to do in practice 6-1 and 6-2 of the lesson 6.

## 3. Practice 6-3: The Mission Control General Page - 3m

Let's go ahead and take a look at practice 6-3. Here, we're going to work with the Mission Control General tab. So we're going to start the Java2Demo with this command, and then after that start the Mission Control. Let's go ahead and do that.

So I already ran this application. And then let me go ahead and start, in this case, the Mission Control. And that's what they want us to do in practice 6-3. So it's on the way up and running.

So now I see the Java2D. It will ask us to right click and start the JMX console for it. And now, soon we're going to see the general overview, a display that you see here. So basically, that's what we have. They'll ask us to start to a new dial, so we can go ahead and click on the plus in the dashboard and then click on the Select.

And then over there, they want us to scroll down to the operating system and select the system CPU load and click OK. And then click OK. This will give us a full dial. They'll also ask us to do the same thing by creating a chart.

So under the Overview part, we click on the green plus. That will add us a chart. And over there, we go ahead and click on Add. They want us to go java.lang, a memory pool in space, the usage, and then look at the used. And click OK on it.

This basically displayed the amount of memory used by the hidden space in the real time. We see it now running. And then after that, they want us to see if we can reset everything. So on the Overview section, there is this button here that says Reset to Default Control.

If we click on it, then, of course, it will give us this message that you really want to do that. And then if we click OK, now it's back to the total reset. And that's basically what they want us to do. And that's what they want us to do in practice 6-3.

## 4. Practice 6-4: Mission Control MBeans Page - 9m

Let's go out now and take a look at practice 6-4. Here we're going to explore the Mission Control MBeans page. So while running the application 6-3, we continue following the steps here. Pretty much straight forward.

So first, they want us to, in this case, click on the MBean button. And then from there, they want us to go from the Java lang dot memory pool. Eden space, and from there go to the usage and use used, and then click and visualize that. And then from there, they want us to add a chart. So if we go back to the general overview, we see that chart now is created, My Chart 1.

Going back to the MBeans, what they want us to do this time is go back to the Eden space and, of course, in this case, select the collection usage that you see over there. Right click on-- and the clipboard setting, we want to select the Copy as CSV. So now it's selected. OK, we have it. And then, of course, after that, they want us to right click and copy this. And then of course, [INAUDIBLE] already did that here.

And then after that, they want us to click on the Operations tab and then go to com.sum.management. Select the Hotspot Diagnostic. In the get, they want us to put a value set with the value for these to be a thread stack size that you see here. Thread stack size. [INAUDIBLE] on that.

And then they want us to execute. So that's basically-- so for p0, the value would be thread stack. Thread. Let's go ahead and spell it right. Stack size. Click on Execute. That will give us, of course, here the value on the writeable.

Then after that, they want us to change this to a max tenuring threshold. Max tenuring thread. Threshold, rather. So let's make sure it's all spelled. Max tenuring threshold. Now it's basically what we have, and then we click on execute. Then, of course, here we see the values. Value 15. That's the default. I said that in the lesson.

Then after that, they want us to click on the Set VM option. But this time, they want us to put for the p0 value would be the print GC details. Just make sure that it's well spelled. Print GC details. And then for p1, it is true. And then, of course, we click on the Execute. And so let's see that. There is a typo here. Let's make sure that you have no typos. And then, of course, now it's executed.

Of course, they want us to go back to the terminal. And now we can see the information here about the print GC detail information given to us here. In this case, in the terminal. So we see that, as you see here. And so basically, that just to see the print GC detail information.

Now, they of course, want us to go back here and go to the MBeans page. And then here we're going to turn on the notification for the JVM. So in this case, we select the com.sum.management.garbage collection aggregated tree. Click on the Notification tab, which we are already in.

And select the com, in this case, .sum.management.gc heap live set. Do you see here? And of course, check the subscribe. All right. And now you see some subscription. That's basically we have here the subscription of the data that we see here. And so we can go ahead and then check it.

And after that, they want us to look at the metadata. And the Metadata tab, we can select an attribute and click on the metadata information about it. So that's what we have. We can also click on the triggers and then click on the General page. And so basically, we can set the triggers for anything we want, in this case.

Basically, we can look at the CP usage here and the trigger to it, as an example. So it's already there. Go back to the original tab and see in this case observe the JVM CP usage as an example. And of course, we can go ahead and add basically alerts and so forth. So you can go ahead, for example, go back and then select one for the too low as an example here. And we can label the CP usage for that, if we want.

The idea here is just to kind of play with the different type of [INAUDIBLE] constraints. In the constraints, again, we should notice that the date and time triggers that you can set here. OK, whatever, you want here. Date span or day of the week and so forth. Time span and so forth. We can also click on the alert if we want to, in this case, set any type of alerts too.

And so we can click on the Export button. And we can select the rule that we created and make use of that also. Select whatever we want here. And whatever in this case, whatever we want. And just to kind of give you an idea about how we can make use of that. So in any case, play with it. And it's really an interesting type of a practice. And that's what they want us to do in practice 6-4.

## 5. Practice 6-5: Mission Control Runtime Page - 4m

Let's take a look now at a practice 6.5. Here we're going to explore the Oracle Mission Control Runtime Page. So continuing with what were doing in 6.3 where we started the application and we started the Mission Control, and we opened the JMX console. We started it for that application. And then we're going to click on the Runtime button, basically for what we're doing here.

So here, we're going to look at the System Properties section here, which allows you to filter and search the JVM properties. For example here, we enter under the search here OS. This would give us the OS architecture, the name, and the version. And, of course, a bot basically allows us to filter any information we are looking for in this case.

And we can explore the memory if we click on the Memory tab. Again, this information pretty much is displayed related to the memory where some of the data is submitted to the data on the Overview tab but, of course, with a little bit more detail about the size of memory in the JVM and the system. You can also explore the garbage collection by clicking on the tab. This basically also gives us some detailed information about the number of garbage collections and garbage collection times are displayed, so you see all of these here.

And we can also explore the Memory Pools tab. And this Memory Pools tab basically gives us various memory areas in the garbage collector that are displayed. You can also sort the data in any column, as you see here. So basically, we have the code cache in the Eden Space, Survivor Space, and, of course, Tenured Generation, and Permanent Generation.

We can also explore the threats. And under the Threats Tab, we provide detailed information about threats in the system. All the columns are sortable, in this case also. And, of course, we should note that we can turn on three options to provide more information about the threats in this case and so forth. And we can enable CPU Profiling here that you see here. We can sort by total CPU usage and so forth that you see here.

We can enable a deadlock detection. And this basically, in this case, there are all deadlocks in this application. And we can also enable the allocation. We can sort the threats by memory size and so forth. And that's what they want us to do in this practice basically that you see here. And that's what I went through. I went through all these steps. Thank you.
