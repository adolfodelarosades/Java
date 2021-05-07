# 1: Utilize Java Mission Control

1. Introduction to Java Mission Control - 24m
2. Mission Control, JMX Console - 19m
3. Mission Control, Flight Recorder Installation & Usage - 32m
4. Mission Control, Flight Recorder Analysis - 52m
5. Mission Control, Plug-ins - 21m
6. Utilize Java Mission Control - Score 80% or higher to pass


## 1. Introduction to Java Mission Control - 24m

Hi. My name is Marcus. And I'm working with the Java product group. And this session is going to be about Java Mission Control and the Flight Recorder. This particular session is going to be an introduction to Java Mission Control. And after this session, you will know what Java Mission Control is and what Java Flight Recorder is and why you might want to use Java Mission Control.

You will know how to start the Java Mission Control application. And you'll be able to navigate locally running Java processes. And you'll also be able to connect both locally and remotely to running Java processes.

I'm starting with a slide with a lot of quotes, very recent quotes, from people saying nice things about Mission Control. And the reason I'm doing this is while it's very nice with nice quotes about Java Mission Control, but also, it kind of shows what Java Mission Control is actually being used for out there.

And what you can see here is it's used for troubleshooting and it's used for profiling. So those are two major, major areas where Mission Control shine. And here are some internal quotes from within Oracle, different people using Mission Control.

And there is slightly more focus, I'd say, on troubleshooting here. What Mission Control is, is it's a tool suite for production use. The entire objective of Mission Control has from the ground up been to focus on the production use.

So it's very fine to use it in development, too. There are a lot of people using it in development not only because it's free-- but, of course, that is also a reason-- but because it produces very nice data. It has a very low observer effect.

So what does it do? It provides you with basic monitoring capabilities. So you can hook up to JVM and see what's going on in the JVM. It also provides production time profiling capabilities. So even if you're running a heavily loaded server, you can get profiling data from it, which is very accurate. And you can do diagnostics, which is find problems in your production time application.

So I included a quote, a quite recent quote, from Tony Printezis, who is a JVM engineer on Twitter. And at the end of his talk, which was called "Life of a Twitter JVM Engineer," he said that the performance of the JVM is nowadays pretty good. That is not the main problem they have at Twitter.

The challenge, the big challenge, is not performance. It is profiling, and especially profiling in production. And that is something that we've done within the JMC and [INAUDIBLE] for quite some time.

So Mission Control helps you to resolve problems faster because you don't need to rerun the program to find your problems. It helps you to find bottlenecks in the applications. It doesn't even need to be your application. You could have an application running that somebody has provided with you and you might be unhappy with the performance.

And then you can do a so-called flight recording and send the recording to your ISV. You can even do post-mortem analysis. So even if the JVM itself crashes, you can find out what was going on up until the crash.

So again, a focus for Mission Control has been extremely low overhead. It's built into the JVM and JDK by the people developing the JVM and the JDK. It has a built-in high-performance flight-recording engine that performs the data collection.

So the reasons why we can keep the overhead so low is that we have access to data that is already being collected by the runtime. And we collect things in thread local native buffers. We are using invariant timestamp counters for the CPU architectures that support that.

We have quite accurate method profiling. We won't be biased with safe points. And we do faster and more accurate allocation profiling than most other tools. One reason is that we won't undo optimizations like scalarization.

Some other key points is that it's safe and reliable to use in production. It's being developed by the JVM team. So it's part of the normal standard testing that every release of the JDK goes through. We're testing these things, as well, at the same time.

And the low overhead means that you can have this functionality enabled pretty much always. So low overhead and reliability means that you can have it always on, which provides you with a sort of time machine. So you can go back in time and figure out what was happening several minutes ago or hours ago in your runtime.

It also allows for faster interaction with Oracle Support. So one of the first things that you might be asked when you interact with Oracle Support for Java support is that they will probably ask you for flight recording.

The Mission Control tool set as delivered in the JDK 7u40 was a JMX console. And that's-- you can think of it as JConsole on steroids. You use it to monitor some key indicators of the Java process in runtime. And the implementation in Mission Control is quite good. It has quite a lot of features that you don't have in JConsole.

And the big-ticket item, the thing that we do license, is the Java Flight Recorder. And that one is analogous to a data flight recorder in a modern aircraft. It records what is going on in the runtime whilst the process is in flight.

And you can dump it at any given time to find out what is going on in the runtime. And this is the thing that allows you to do profiling your diagnostics of running production systems. It gives you very good information and detailed information about the runtime.

Then there are some plugins to Mission Control. And there are different reasons why they might not be part of Mission Control. They might be experimental. They might not adhere to the low overhead part of the basic Mission Control design.

But they are very useful for solving some very specialized cases and provide some very specialized functionality. So anyways, I will be talking more about the plugins in a later presentation. So that is a separate one.

The supported platforms-- the client is supported on Windows, Linux, and Mac OS X, not Solaris. If you would want to run Mission Control on Solaris, you could try using the plugin version. So if you have a Solaris Eclipse and you install Mission Control in that Eclipse.

But we don't ship it on Solaris. The server-side parts, though, are supported on Windows, Linux, Mac OS X, Solaris, and pretty much anywhere you would finally find the Oracle JDK-- the support.

Installing Mission Control is very simple. You simply download and install the JDK on one of the platforms where the client is supported. And it's going to be there. It's in the bin folder of the JDK home.

If you want to install the Eclipse plugin version, you need to go to an update site on OTN. And it's a pretty long URL. So for me, it's much easier to just remember oracle.com/missioncontrol. And there will be links from there to the update site. So that's what I do myself.

Starting the Mission Control client is as easy as just double-clicking on the JMC icon in bin. Sometimes, you might want to have some additional information about what is going on in Mission Control, maybe for troubleshooting. And then it might be good to know that you can start it from the command line with the arguments -consoleLog -debug.

And on Windows systems, you would also want to redirect standard [? error ?] to stand out and maybe pipe it more. So there is more information on my blog. So I have a blog on hirt.se/blog. And there's the link to the blog concerning this troubleshooting.

You can also change what logging properties are being used by [INAUDIBLE] logging. There is a menu in Preferences where you can point to your own settings file and thereby control the logging mode specifically.

Connecting to a process-- well, the entry point to all things, all tools in Mission Control, is really the JVM Browser. So on the left in the Mission Control client, there is this tree or list, depending on the configuration, that shows you by default the locally running Java processes.

By default, it's flat. It just shows everything that you know about. So if you have provided your own connectors, it will show those in the flat list together with all the locally running JVMs and the ones that have been discovered by JDP.

So if you want to be able to autodiscover remote processes with Mission Control, you should look up the documentation for the Java Discovery Protocol. That would provide that feature.

Anyways, if you do have them in that list, it might be a little bit hard to discern which ones are local and which ones are remote and which one you provided yourself. So there is a little tree icon you can click on which will split them up so that you will see the JDP ones in a separate part of the tree and the locally discovered ones separate, et cetera.

So here is an example on how Mission Control could look when it's running. You have the Java Mission Control client running. And then you have a bunch of locally running Java processes.

You might be transferring a Java flight recording from one of them, or you might have opened a file. Somebody sent you a flight recording and ask you for a second opinion, maybe.

You could have a cloud of remotely running JVM processes that you have hooked up to. You might be transferring a Java flight recording from one of those. So this just an example of what a running client might look like.

So starting the management agent for remote access, you use the normal standard properties for controlling the JMX RMI agent. So com.sun.management.jmxremote properties is what you would use. And there's the link to the documentation for how to use that.

And since 7u4, we migrated a feature from JRockit which allows you to set the port of the RMI registry and the RMI server to the same port, which helps for tunneling purposes. So that might be good to know. And here are the flags for enabling JDP.

So if you want the management agent to be discovered on the network, you would set auto-discovery equals true. And you can set an hierarchical name that controls where it would be ending up in the JVM Browser in Mission Control.

Some tips for using the remote management agent-- unless you're doing some experimentation or you're doing some development, you should always, always, always enable authentication and encryption. So that is happening by default. There are a lot of examples-- and I'm guilty of this, as well-- of the internet in blogs, et cetera, that gives example on how to start the remote management agent.

And they all basically say authentication equals false and SSL equals false. And this is because otherwise, you need to set up a trustStore and keyStore, and maybe also trustStore.

And this, of course, takes a little bit of effort. But this is something you should always do. So unless you're just playing with this, you should always enable authentication and encryption.

And another one is sometimes, RMI will get the hostname wrong. So if you start this up and you get an error says that you can't find localhost or it went with 7001 or something similar, it could be because you're either on a multihome system, you have your host file wrong, or there's some other configuration error, which means that RMI have just basically picked up the wrong hostname to use in the stub.

So to fix this, you would set java.rmi.server.hostname to whatever you want the client to hook up to. So the hostname of the client should use to connect to your server-- that is what you would put there.

If you aren't allowed to keep an open JMX agent port on your system, there is still one of three things you could do. You could run JMC locally, so the Java Mission Control like a client locally. And this is, of course, not to be recommended on production service because the client itself will steal resources from whatever critical thing that service is doing-- so not recommended, but certainly possible.

You could also use something called jcmd. And I will talk a little bit more about jcmd later. It's a command-line tool that you can use to access the Flight Recorder data. So you can dump flight recordings. You can start new flight recordings with the jcmd command.

And you can also use the jcmd command to temporarily start the JMX agent. And this is opening a port. And you can open an unsecure port using the jcmd command. And this is, of course, not recommended, either. If you plan on bringing up this port every once in a while as part of starting your JVM, you should really have configured the trust and keyStores beforehand and use them.

Connecting tools-- there are two ways to connect a tool to JVM process. You can either go to File, Connect and then you're going to be shown a wizard where you pick the JVM you want to connect to in the tool and go through step by step. And there is a more direct way, which is to just select a JVM process in the JVM browser and then use the context menu in the tool to select whatever tool you want directly.

And what tools are available from that context menu depends on the kind of connection you are using. Some tools might only be available for local or locally running JVMs. Such tools might rely on touch, for instance.

And it also depends on the plugin that is installed. So plugins can extend Java Mission Control with new tools. So for instance, if you've installed a plugin called JOverflow, you will be able to do heap dumps and analyze them for bad patterns of memory usage, memory waste. And so it depends what tools are available.

The protocols involved when running Mission Control is Java Attach. And this is only for locally running JVM processes. It's used for local discovery of the locally running JVMs.

It's also used for starting the local JMX agent if there is a tool that wants to use JMX later on when it's being used. It's used directly by some tools. So for instance, when starting up the external JMX agent, we are using Attach directly.

JMX-- normally JMXRMI, but that can be configured. And you can follow the link to the JMX documentation that I showed previously. But you can configure it to use other protocols. But it's normally JMX over RMI. And this is the protocol that is being used most by most tools for communication and for the transfer of data.

And you can actually use JFR without ever opening up a JMX agent. You can just use a j command and/or various command-line options to control the Flight Recorder-- so no ports needed.

And this is a schematic picture of the various protocols involved. You have the Java Mission Control client, which connects to locally running JVMs using Attach. It might start up its JMX agent, local JMX agent, for the local running JVMs for which Mission Control can connect and-- yes.

And we also have j command, which you can use to control the Java Flight Recorder. And Java Flight Recorder can spit out [INAUDIBLE] recording files that you can then just open up in Mission Control directly. So they should probably be [INAUDIBLE] directly from the file to Mission Control, also.

So I'm going to move over to demonstration on how you can start JMC and how you can use the JVM browser, both as standalone tool and in Eclipse. So I've opened an Explorer in Windows on my JDK. And as you can see, we have the bin folder here.

The bin folder itself contains one launcher for Mission Control called jmc.xc. So starting it is as simple as just double-clicking. And here we go. We're starting up Mission Control.

I don't have that file open anymore, so getting rid of that. And this is what you would typically show by default. Actually, the first time you start, you're going to have this welcome screen showing you.

And from here, you can go and look at some examples, go to documentation, et cetera. The normal thing that most people do here is just close that thing and get into the tool itself. And here we have the JVM browser.

And as I said during the slides, we can now see that we have two running locally processes. We have an Eclipse running and we have the JVM that is running Mission Control itself. So what you can do for trying out Mission Control is to just hook up to this yourself, basically, and try the different tools.

I said that there were different ways of starting the tools. One of them is to just select Connect. Connect says that, well, there are two locally running JVMs. And here you see the tree-- so two local running processes. And you can select one of them.

Then you can select what tool you would want to do, like starting the JMX console or fiddle with a remote JMX agent or start a flight recording. And then you select Next or Finish, depending on if you have more choices to make. In case of this JMX console, that would be it.

And click Finish. And voila, we started the JMX console. And you now start seeing runtime data continuously. So that is how you would start and connect.

This little tree icon shows you if there are locally running JVMs or if you have made your own little connectors. Making your own would be if you wanted to connect to a remote JVM. Then you have a little wizard here where you can specify the host, the port, or even go with a custom JMX service URL, which you would do if you were using other protocols than JMX over RMI.

And credentials and whatever you might need. So in this case, when you go Next, it will test the connection. I don't have anything open there. So it will fail. But I can still finish and have it in there. Now when we see the tree here, we'll see that that one is not only the locally available connections or running JVMs.

So Mission Control can be installed as a plugin, a set of plugins, into Eclipse. So it looks very similar to what it looks like as a standalone application. As you can see, here's Oracle Java Mission Control running as standalone application.

And here is the Java Mission Control perspective opened in Eclipse when we have the Eclipse plugins installed. And you have the browser, again, to the left. And you have the connect. So everything is pretty much exactly the same.

You do get some small benefits when running Mission Control as an Eclipse plugin. So one of them is you can actually jump to classes. So if you see a class name or something-- a method in a stack trace, for instance-- you can jump to that method by just right-clicking it and select Open Method.

And if you have the source in your workspace, it is going to open up on that line. So that can be useful. But otherwise, it's pretty much the same.

And for most of the demos in this series of sessions, I'm actually going to use Mission Control as a set of Eclipse plugins just because it's easier to jump to the source, and also because I will have all my demos in a workspace. So it's much easier to find them.

So there are some resources for getting to know more about Mission Control. You have the Java Mission Control home page at oracle.com/missioncontrol, from where you can find resources as forums and the update sites for installing Mission Control inside Eclipse. And you also have my blog, where I blog extensively about all things Mission Control and Flight Recorder and other serviceability features in the JVM.

There is also the official Twitter account for Mission Control, @javamissionctrl, and my Twitter account, hirt. And then there is this JMC tutorial, which is a very good introduction to how to use Mission Control, how to look for problems using Flight Recorder, and other things.

So as a summary, in this lesson, you should have learned what Mission Control is, what Flight Recorder is. You should be able to start Java Mission Control, the client application. You should be able to navigate locally running Java processes and connect a tool to them. And that should be it. Thank you.

## 2. Mission Control, JMX Console - 19m

So hi. I'm Marcus. And this is the second part of the Java Mission Control Flight Recorder series of presentations. And in this session, I'm going to be talking about the JMX Console.

So after this session, you should be able to start the JMX Console. You should be able to know how to use the various part of the JMX Console. And you should also be able to add Custom JMX Attributes and monitor them.

So there are multiple ways that you can start the JMX Console. You can either drag and drop a connection from the JVM browser to the editor area in Mission Control. This, I think, only works on the standalone version of Mission Control.

You can also Right Click on a JVM from the JVM Browser and select Start JMX Console. And you can also expand the JVM in the JVM Browser, and you will be able to see something called the MBean Server. And if you just Double Click that, the default action will be to start the JMX Console.

So after you connect, you will be continuously fetching data from the JVM process. And you will keep doing that until you close the JVM the JMX Console. So the JMX Console would typically be used to monitor a set of JMX attributes in real time. And there is a simple rule system that you can use to take some actions when a user-defined condition occurs.

So you could, for instance, say that when the CPU load has been over 95% for two minutes, I would like to dump the Flight Recorder and get some more detailed information. There is a content type system built into the Mission Control JMX Console that allows you to work with units of measurement in a much better way. So if you need to set a memory limit, for instance, you can set it in megabytes or gigabytes or a unit that makes sense to you.

And you will also see the unit of measurement for common attributes. So everything that is in the platform MBean Server has been updated to have these content types. Unfortunately, not on the server side, so we keep this information client side so far. But hopefully, in some update for JMX, there will be content types, one could hope.

We could also execute JMX operations with more complex our arguments. So you can build up arguments and send them to operations. You could also configure update intervals on a per attribute basis.

So let's say that you're only interested in fetching the system properties once, because you don't feel that they will change very often. Then you can do that or fetch them once every 10 minutes. You might want to fetch the CPU load more than once per second. Well, then you can just do that.

And there are some nice features in the graphs. So you could add any attribute that you're interested in to existing graphs. Or you can add new graphs. And you can zoom in and zoom out of graphs, freeze graphs, and hover over points in graphs and get more details-- so some nice features.

And there is also a dedicated tab for running Diagnostic Commands. So I briefly mentioned there is command line tool that you can use for sending asynchromous commands to run in locally running JVM calls jcmd. Well, if you want to send them remotely, this is the tab that you would use. So just hook up to remote process and then run the commands from within this tab.

And there is also a data logger, so you can configure what attributes to record. And there is also a log viewer. So once you have logged a lot of data, you could just show them, those log files in Mission Control. Typically though, you may want to consider using Flight Recorder for such things.

Then there's some meta plug-in for running JConsole plug-ins available for download. I will talk a bit more about that in the plug-in session. And some other plug-ins for more specific purposes, like Coherence.

So the first thing I'm going to do is start up a local running process, giving a little bit of load periodically to the machine, so that we have something interesting to monitor. So I'm going to have it right here, just going to run load and deadlock. And load and deadlock is there and picked up in the JVM Browser. And then I'm going to start the MBean Server-- sorry, the JMX Console. And here we go.

So what you see from the start is a dashboard, where you can see how the heap is being used. And you can see that we have a few megabytes of Heap Memory, 474 in use. We can see that the max that we have ever gotten when running this program is 826. We can see that the CPU usage is quite low. It was a little bit higher for a little while. We came up to 55.8.

These little dials, they can be reset. So if we want to reset the watermark, that would be how we do it, just clear statistics. And then you're done. The Live Set Fragmentation doesn't show anything right now, because we haven't had a garbage collection. So we don't quite know at this point in time.

And we can see here, the CPU load, we have a little bit of an idle period of time. And then we hit a few-- well, 30 something percent. We can zoom in if we want to. So like this, boom, here we zoom in. And now, if we hover over a point, you can see what the CPU usage actually is in detail at those points. We can do the same for Heap Memory, like that.

And if we want to start getting updates again, we can do that. Then we still keep the zoom in we had. Or we can do Show, Last Minute, or whatever range we want to have. So we can go in Last 10 Minutes of data. And it would look like that. That would be where we decide that.

It can also depend, if we don't want to have the wide range being fixed to 0% to 100%, we can go auto. And we can also change the Labels and other things. We can also Export these graphs as images, if we would want to.

By default, we don't show all attributes in these. So let's go to Last-- Show, Last Minute maybe. So there's more information that we can enable if we want to, such as the Max Heap size set and the Committed Heap size.

And you can also add your own. So clicking the plus here is going to let you choose attributes. So you might note that some of these are not possible to add to the graph. And the reason why they aren't is that they are of different content types.

So in the Memory graph right now, since we only have things of the memory content type, you can only add memory stuff. So you can something like that FreePhysicalMemorySize. Boom, here we go, FreePhysicalMemorySize, I seem to have 8 gigs free.

You can also log. And here, we can see what attributes we would log if we turned on logging. And this would be the icon to activate the logging. So that would be the overview.

Then we have the MBean Browser. And one thing you very quickly note about the MBean Browser is that it doesn't look quite like other MBean Browsers. And one reason is you can see you would normally have a very big number here. In most MBean Browsers, you will see 8 509 960 192 as a number. There would not be unit of measurement. I wouldn't know what content type this is.

But in Mission Control, you will see this. And for your own custom attributes, you can set it. So you can define what the content type actually is. Just Right Click and select Interpret Value As. And then you select an appropriate content type and then your unit of measurement.

You can also set the update interval. So you can see that there are some things here. Like the Name of the operating system is only fetched once, because we don't expect that to change during the run when we are connected to this running job process.

We can also invoke operations. So let's say that we wanted to do a full thread dump, we could do that like this. And we would get back the composite data and just be able to browse it like this. So even complex data and composite data can be browsed like this.

And you can keep the result around like this. So if we want to do some comparison, we could just execute again. And we would get a new tab with the result. So that's for executing stuff. We can also-- maybe not that interesting-- but you can be sent Notifications. Subscribe to them, and you would see the results.

So Triggers, you can build your own Rules that take action when something happens. So in this case, for instance, when the CPU for the JVM becomes high enough, we could decide to take some action. So let's see, when it goes above, say, 20%, we do an Application alert. So I'll set the trigger value, 20%. Done.

Doesn't need to be Sustained for anytime at all, just as soon as it hits, and enable-- oh, there we go. It was right there. And then we get a notification. And we can see when it happened and what the condition was. So in this case, the actual trigger value was 25%. And our limit was 20%, so well above.

And this can be logged. There are various actions. And you can actually plug in your own actions. So if these aren't exactly what you would be looking for, you can hack your own.

But we do have some nice ones. There's one for doing a HPROF Dump. There is one for Invoking a Diagnostic Command, so you can set up the parameters that you want to invoke and have it invoke it, whenever the condition is met.

You can Log to a File. So for instance, this, if you're running within Mission Control, you can have it in a specific project, the log file. And it will be continuously updated also. So you will be able to see the log being updated. You can Send emails. And you can start-- well, you can Control the Flight Recorder. So that would be the rules.

The system, well, here, you have some information about the system that you're connected to. You also see the System Properties. There are some nice features here. So when you're filtering, for instance, if you just want to see everything that starts a d-w-t, you just type it there.

By default, it's a clean star. So sun, no nothing like that. Let's see what we have, class, so implicit, clean star on the end. So if you want to have more specific control over this, you can type regex colon and write a regular expression, so maybe class. There you go, anything containing class. And this is something you can use in any such filter, filter editor.

Next is memory. You can get heap histograms, but you need to turn them on, because this actually can be a little bit expensive. For every histogram we fetch, we will be doing a mark face of the garbage collector. So this is something you need to turn on.

So you do get a little warning if you enable this. But here again, here you go. So we now have Heap Histogram. And every time we refresh this, we calculate the delta here. So you can see where we have an increase. You also get some detailed information about the garbage collector, the different memory pools available and how they're being used.

We have thread information. We normally don't show the thread graph. You need to expand it if you want to see it. You can see what the different threads are doing. And in this case, I've actually added another column that isn't shown by default.

You can change what columns are shown by clicking table settings here. So I'm showing the Lock Owner Name. And if we turn on Deadlock Detection, we can see that, yeah, we have deadlock here. And we can see that Thread-4 is waiting on Thread-3 and Thread-3 is waiting on Thread-4. So that would be how you would detect deadlocks.

We also have application profiling, so you can see how much has been allocated in total by the different threads. So this value is all the allocations that have taken place, reclaimed garbage or not-- just a way of seeing which thread is doing a lot of allocations. And you also have CPU profiling per thread, so probably not that exciting for this application.

But wait for a little while, and we look at one of those periods when we do have a little bit more action. We'll probably see that one of these move up a bit. And see if we can-- yeah, there you go. Here, Thread-2 seems to be the-- seems to be some action going on there.

Anyways, then last but not least, we have the Diagnostic Commands. So here, you could run them. So we could Execute thread stack dump command and get a full thread stack dump.

You could control the Flight Recorder through Diagnostic Commands. But that is, of course, much easier using other features within Mission Control. And see the uptime, simply a very easy way to invoke diagnostic commands, especially if you're trying to do it remotely.

So let's just go back in and I just wanted to show one last feature that I forgot to talk about, which is these graphs also have a numerical representation. So that could be interesting sometimes. You get some statistics for the different attributes in the graph.

So if you turn on Accessibility mode, you do get the standard deviation, and min, max, and average of what we have seen so far. So I just wanted to show that, because it's a feature that many people don't know about.

So in this session, you should have learned how to start the JMX Console and how to use the various pages or tabs in the JMX Console. And you should also be able to add your own attributes or other attributes than are currently being displayed in the different graphs and tables.

## 3. Mission Control, Flight Recorder Installation & Usage - 32m

So hi. My name is Marcus, and this is the third session in the series about Java Mission Control and Flight Recorder. And in this one, we are going to start talking about Java Flight Recorder-- how to configure and use Java Flight Recorder.

So after this session, you should be able to enable the Flight Recorder in the Oracle JVM. You should be able to configure the Flight Recorder to get expected results. And you should be able to produce Flight Recorders in various, different ways. Next part is going to talk about how to analyze the result in Flight Recording sims. This is more about producing recordings.

So the Java Flight Recorder a high performance event recorder built into the JVM. It produces binary recordings because other formats would be too verbose-- big. And it produces chunks that are self-contained and self-describing, which means that the chunks of data contains everything that we need to be able to resolve the data, and to be able to describe the data for somebody consuming the data. So for example, the data types that are presented, and also textual descriptions that somebody might want to use to make sense of the data.

Flight Recorder helps you to solve problems faster because you can leave it always on and keep it capturing data. Which means that when something happens, you can actually go back to the time when the problem occurred and look at what was going on the JVM. You don't need to try to reproduce a problem to get relevant data.

And you can always capture these recordings and send them to somebody else for a second opinion. You get a physical artifact that you can send to somebody. You don't need for everybody to have access to the production servers.

It will help you to find real bottlenecks in your applications. It has been designed, from the very start, to be a production time tool, which means that the observer effect is very low. So data will not be skewed by safe points. We will not undo optimizations such as scalarization. So you will actually get data for how the JVM plus your application actually behave in runtime.

So you will be able to find bottlenecks in not only your code, but other people's code. We are instrumenting everything running in the runtime. So you could find a problem and send your ISV-- the recording of the problem-- and they could start looking into it.

You can also do post mortem analysis, even from crash dumps. So crash the JVM. For now you might need to send it to Oracle. In JDK 9, there will be a tool that allows you to extract the data yourself.

The low overhead is achieved by several different means. We have built in the recording engine into the Java runtime, which means that it's easy for us to get access to data that has already been collected. The JVM is dynamically optimizing runtime. It is already collecting some information that it needs to be able to do its job well. And that data is something we can easily just output.

We are recording into thread local native buffers. We are using invariant time stamp counters for the CPUs that support it. And we-- our method profile isn't safe point biased. And we also have faster, more accurate allocation profilings that won't undo scalarization and other things. So there's a wealth of data in the Flight Recorder, and the recording engine itself is very performant.

There are two different kinds of recordings. We have continuous recordings, and those are recordings that have no end time. And you, as a user of Flight Recorder, will need to do something to dump them.

So you might use Mission Controls to dump it. You might use J Command. You might have configured the JVM of command line to dump it, maybe when the process exits. There are various, different ways you can do this.

And then we have time fixed recordings, and those are sometimes known as profiling recordings. Those have a fixed time. You say that, I want to do a recording for one minute. And once it's done, if you initiated the recording from Mission Control, it can be downloaded into Mission Control, opened up, and it will display the recording for you.

So there are two different kinds of recordings we will be talking about. When I say recording, I will mean one of two things. And it will-- you will know from context.

A recording can both mean the ongoing recording in the server, as well as the fiscal recording file that has been produced. And I think that, when thinking of recordings, it might be easier to think of the server side ongoing recording as a named collection of event type settings-- a description of what to record. And that thing is active for a certain period of time.

So for example, if we have a recording running in the JVM that we start at T0-- it's a continuous recording. We keep recording from the start of the JVM to the end of time. And then at T1, we start a time fixed recording-- a profiling recording.

So we may enable certain events types that might be a little bit more expensive. We might lower thresholds. We might do something to capture some more information. And that recording ends at T2.

So later, we decide that we want to dump the continuous recording. And we take two times that are between T0 and T1-- the first one. And the second one, sometime in the middle of the R1 recording. What will the dump contain if we do this dump?

And the answer is it will actually contain information from both recordings. Because it's just using one set of buffers-- JFR. And this is for performance reasons. We will record everything into the same thread local buffers, and everything to the same global buffers.

And you will get at least-- the contract is that you will get at least what you asked for. If you have multiple users in the system using it, and they are performing recordings left and right, you might actually get more than you asked for. But you will at least get what you asked for.

So there are different kinds of events. We have instant events, and those are just a data point in time-- so timestamped data. We have requestable events, and those are events that are initiated from separate threads. They have a user configured threshold-- period of time. So it could be, pull the CPU load every second.

We have duration events, and those are events that have a start and a stop time. So it could be time spent waiting to enter monitor. And then we have timed events. And those are exactly like duration events, but they have a user configurable threshold.

So let's say that you only want to capture outliers. So only monitor waits that have taken longer than 15 milliseconds. Well, then you can set a threshold to 50 milliseconds, and you will only capture the outliers.

This is very much used by default in the templates. Because for example, monitor enter events happen so often, and there will be so many of them if we didn't have a threshold. So that we use the threshold to keep them out of data down.

So the inner workings of Flight Recorder. The overhead is extremely low because of what we have been talking about earlier. We are using data has already been gathered. We have this high performance recording engine built into the Java runtime.

There are two different ways to enter events. There is a native API and JVM that is used for producing events, and there is a Java API. So through this APIs, we fill up thread local buffers. And when those get full, we copy them into a circular arrangement of global buffers. And depending on how we have configured Flight Recorder, we might either emit the Flight Recording events to a file, or just keep overriding these buffers.

So configuration of the Flight Recorder, then. You need to use-- you should probably use-- JDK u40 or later. You can get recordings from 7 update 4 or later, but and they are not on par event-wise with what we had in JRockit in the old days. So if you want full functionality, you should use at least 7u40 or later, or JDK 8u40 or later.

And you start the JVM with -XX UnlockCommercialFeatures in Flight Recorder to enable the functionality. Strictly speaking, you don't need that in 8u40 later. It will be dynamically enabled if necessary.

But this is still a good idea to do. Because if you know that you will use the Flight Recorder, or maybe if you will turn on the Flight Recorder-- a recording using command line flags-- you will need these anyways. And also there is certain things that JVM can set up from the start. Doesn't need to do quite as much work as if you set it up later.

If you need remote access, you will start up the JMX agent with appropriate com.sun.management flags that we talked about in one of the earlier sessions. And again, you can use JDP for easy discovery of the manageable JVMs on the network.

So the flags on the previous slide will enable the recorder, but it won't really start an actual recording. So to do that, you need to do one of following. You can either use Mission Control, and that is very easy. You have graphical user interface, you get wizards. But for several reasons, that might not always be possible.

And then you can use JVM command line options to preconfigure the JVM to do a recording. And there are several different things we can do there. I will talk about those in a bit.

We can also use the jcmd command line tool to control the Flight Recorder, do dumps. But those are only locally. So jcmd can only be used on locally running JVMs.

Unless you hook up with the JMX console. Then you can do that. But if you have JMX access to the process, it's much easier to just use the wizards to do exactly the same thing for when in Mission Control. So I will talk about these different ways in the next few slides and explain their strengths and weaknesses.

So the easiest way is to use Mission Control. Just find the JVM, and you either use the connect wizard, or you double click on the Flight Recorder node under the JVM. And then you just follow the wizard through to select what options you want for your recording. And then you're done.

This is by far the easiest way to get started with using Flight Recorder. It does require JMX access to the JVM process. It's very convenient if you need to do several profiling recordings and experiment a little bit with what you want to have in the recordings. This is also a very good way to record.

Then we have them matter of Flight Recorder templates. A template contains information about what event types to enable. So when you go through the Flight Recorder wizard in Mission Control, you will basically use a pre-defined template as a start, and then you can do changes.

So there are two templates by default included with JDK. You have a template that is used for continuous recordings. That is the default.jfc template. If you don't specify anything, that is the one that will be used. And then we have a profiling template, and that is the one that would be used when you want together a little bit more information.

So we've done some testing in house, of course, of the overhead of using these. And the continuous template-- it's sometimes quite hard to even notice any impact. If you are using the profiling template, you would use-- you should have less than 2% overhead. And sometimes, people actually use the profiling template in production systems as well. You can find these templates in the jre/lib/jfr folder of the JDK.

If you make some changes to one of these templates, and you think that this is something that you would like to use from the command line as well-- well, then you can edit them and export them from within machine control itself. So there's a template manager. You go there, and you click export. And then you have something that you can use from the command line.

JMC, when you start recording, will list all the templates that it can find server side by default. It will also list all the locally stored templates so that you have easy access to them. And you can use the template manager to delete the ones that you are not interested in anymore.

So first, I'll go ahead and demonstrate how to create recordings using Mission Control. So first of all, I'm going to start up our good old friend the load and deadlocked program so that we have something to connect to. And do these recordings on. Here we go.

So instead of using the MBean server and starting the JMX console, I'm just going to double click on the Flight recorder node. And here we go. This is what the wizard looks like.

So we can name the recording, which is usually a good idea if several other people would connect here. So this will be my Continuous Recording by Marcus. I select continuous recording. Here I can restrict the maximum size when I-- storage disk that I will use, and the maximum age so that I don't keep around old data.

And the events settings. So it says dash on server for the ones-- templates that I found on the server. And I'm going to use the continuous template-- that is the default template-- on the server for this recording. And I'm going to just use the default settings.

If I wanted to, in the next step of the wizard, I can do some very detailed configuration here. So I could for-- Java Monitor Blocked, for instance. If I wanted to lower the-- let's do that for fun. 10 millisecond threshold for Java Monitor Blocked. And finish.

If we expand the node for the Java Flight Recorder now, we're going to see that we actually have this continuous recording running now in the background. I could start another recording if I want to. So let's do profiling recording here. Time fixed for a minute.

And let's enable everything like this. Go. Now we can see that it is running in the background, and we have the counter that counts down until the time it will fetch the recording and show it to us.

So I talked about J Command, this wonderful little tool for us to send commands to locally running Java processes. So if I just run that without any arguments, I will be able to see that there are a couple of Java programs running. One is the 8740 one, which is our load and deadlock. I can now see what we have-- what commands are available by using help.

And I can do jfr.check to see what recordings are running. And we can see that we have two recordings running. One is my profiling recording, and one is my continuous recording. And in a few seconds, it is going to be downloaded here in the background and shown to us.

So here is my recording. It's being loaded for us now. And here we can see that we have a little load every once in a while, just like the console showed. And now we can go look into the details about what was going on for this application if we want to.

The continuous recording keeps running in the background and will keep running unless we actively stop it. And we can, at any given time, select that recording and select dump. And there are a few different alternatives, one that will bring up a wizard that will tell us exactly what time span for the recording we wish to dump. So we are not going to be analyzing in thing in this part of the presentation. That is the next presentation.

As you can see, for J Command, there are actually commands for controlling Flight Recorder in various, different ways. So we can dump, we can start recordings, we can stop them from J Command here-- the command line.

So another way to control the Flight Recorder would be to use command line flags when you're starting up the Java process. And this is very useful for enabling continuous recordings on startup, or for enabling features like being able to produce Flight Recording whenever you exit the Java process. So here is an example of what that could look like.

In this particular example here on this slide, we start off with one minute recording 20 seconds after starting the JVM. And you can see that there is a delay argument there, 20 seconds. We do the recording for the duration of 60 seconds. We have name-- we have a file name where the actual recording would be output. And we have a settings parameter which decides what template to use.

And you can either use a name, and then it will look for a server side template with the name in the lib jfr folder. Or you can have a full path to the template. Both works. If you want more information about what is going on in the Flight Recorder, you can also change the log level so that you will see some information on the standard out when things happen-- so like when it starts a recording after a delay, or when it writes the actual recording.

So the typical configuration for a production system would be to start the Flight Recorder with a continuous recording running. So you would use the command line flags to enable the Flight Recorder, and to also enable recording to be running from the start. That enables you to be able to dump the recording whenever you want to, and go back in time and see what lead up to a problem.

You would typically use the default template unless you have some very specific demands. And you have two examples here. One example is just enabling the default recording, and also enabling the dumping of the Flight Recording when the process exits. This can be very useful-- for example, when you're doing J Unit testing or other things.

What you can see from this is that we have dump on exit true. We have the default recording equals true. Default recording is a special recording with ID 0. This is going to change in JDK 9, but that is how it works right now.

And then we have the dump on exit path, which tells where to output the recording that will be dumped on exiting the process. And the next example is using max age to control how much data to retain, or rather, how old data to retain. It might be a little bit more than that, but approximately.

So I'll just quickly go through the different flags-- well, some of the flags. Not all of them. I will point to the documentation for the rest of them. But these are the ones of main interest.

So disk true or false. If this is true, when the buffers get full, JFR will output data to disk. If you don't have this true-- if you have it to false-- JFR will just continue to override buffers. And the amount out of data that will be retained depends on how much buffers you have.

Max age equals time is only relevant if you have disk enabled. So this will remove old chunks from the repository. And this is not strict. So it depends on the chunk size. You might get up to chunk size minus 1 more data kept than max age. Well, that's for max size.

So max size is only relevant if disk is equal to true. This will also remove chunks from repository when we have max size amount of data in the repository. This is also the same deal here. You might get up to chunk size more data kept than max size here.

Default recording true or false. If you have this true, this will enable the special recording with ID 0. And this special recording will use the default template. It will only work with dump on exit and dump on exit path. That's the only reason for existence for this flag.

If you want to use other templates or configure other aspects of the recording, you should also start a recording. So use the dash x flag start Flight Recording also, and configure another recording. So you will have two recordings running, but that doesn't matter as they are all using the same buffer.

So dump on exit path is where to output the recording. Stack depth is quite important, and Mission Control will warn you if you hit the stack depth. So by default, the maximum sampled stack depth for method profiling data, and for any stack traces is, by default, 64.

This can be increased. So you can set it yourself using this parameter. And if you want to know more about these different flags, there is a link at the bottom of this slide that shows you all the flags and what they mean.

I'll do a quick demonstration of how to use these options. So for the demonstration of the command line options, I've prepared a little command line here for dumping on exit. And the arguments here are the same as in the slide.

We do unlock commercial features. We enable the Flight Recorder. We have the default recording enabled, and dump on exit true, and the path to which we will write the recording. And we also have an extra flag for starting a new Flight Recording with some settings here that enable the heap statistics. So that's a template that I've created using Mission Control and just exported to this place.

So I'm just going to run this program. Here we go. So it says we've started recording. Da-dada-dadum.

And I'm going to press Enter here to exit my program. Then we can go to the demo folder. And the most recent file is dump on exit. It was just written. Opening this with Flight Recorder.

And now we can see that we actually have the object statistics events enabled here. And that was because we weren't just using the default recording. We started another recording as well with the template that enabled these particular events that are somewhat costly. You would probably not use them in production unless you really want the data. So that is all that I'm going to be saying about command line options.

So the last option to control JFR is jcmd. And jcmd is a command line tool for sending commands to locally running JVMs. I've been mentioning it a few times, and I even showed it when we started the Flight Recordings from within Mission Control. So this is going to be a little bit more detail about that command.

So the base syntax is jcmd, and the PID of the process that you want to talk to, and the command that you want to send to the process. If you just send jcmd without any parameters, it is going to list all the locally running JVMs. If you send the command help, it will list all the available commands available in a runtime.

And this might differ. So you can use the same jcmd command to connect to various versions of the JVM. And depending on the version of the JVM-- if it's JDK 9, JDK 8-- the list of available commands can differ.

If you send the PID 0, you're going to send the command to all discovered JVMs. So for instance, jcmd 0 thread dot print is going to dump the thread stack dumps for all the discovered locally running JVMs on the system, executing as the same effective user as the user executing jcmd. So that's an important thing to mention.

So this is an excellent way of controlling JFR when you, for instance, only have ssh access to server. You don't have access to the MBean server through JMX or RMI either. There is no access through, or you can't run Mission Control or the graphical user interface locally. Or you don't want to because you don't want to steal resources from the server running your critical system. Then this is a good way to access Flight Recorder.

And here's an example for how you can start your recording. So jcmd and the PID of the process, then jfr.start, name for the name of the recording. It's usually good to set something there so that others can identify what's going on. Settings is the template to use.

You can use a delay so that you don't start the recording immediately. And you can select a duration after which it will be dumped. And the file name-- you know, where to store the dumped recording. You can use jfr.check just like I did during the demo to check what recordings are running. And you can also dump the recording using jfr.dump.

So in this session, you should have learned how to enable the Flight Recorder, and how to produce recordings in various, different ways. Thank you.

## 4. Mission Control, Flight Recorder Analysis - 52m

Hi. My name is Marcus. And in this session, we will be talking about how to do analysis of flight recordings. This session is going to be mostly me demoing because it's much easier to show you this visually within Flight Recorder itself. But I do have a few slides.

So after completing this session, you should be able to open flight recording files with Mission Control. You should be able to navigate the JMC Flight Recorder user interface. And this is the 5.5 version that I will be using. JMC 6, the next upcoming major version, is radically different in every way. So forgive us for that.

And we will also be looking at various different prerecorded recordings to analyze them for commonly encountered information that people are using to solve problems in flight recordings. And finally, we'll be using the unsupported design view to redesign parts of the Mission Control Flight Recorder user interface to fit our usage better.

So there are a few different ways to open flight recordings in Mission Control. As you have seen during other demos, they can be downloaded and opened when they have been initiated from within Mission Control itself automatically.

They can be dragged and dropped into the editor area. So just pick up a file and drop it into the editor area. If it's a flight recording file, it will be opened with the Flight Recorder editor.

And you can also use File, Open File. Just open a flight recording from the File dialog. And you can double-click on a recording, which I think I've also done during the demos.

So flight recordings come in two different forms, depending on how you have configured the Flight Recorder. One is BZIPed because even though they are binary, there is some sparse information in there. So you can usually bring them down even more by zipping them.

And they can be compressed. So you can configure Flight Recorder to produce compressed recordings. And there are uncompressed ones. And both forms usually have the suffix .jfr.

So you won't really know. The Flight Recorder will just look for the magic number and know and handle it for you. So you don't really need to know.

If it is compressed, the actual binary file might be up to 10 times larger. If you try to use the Flight Recorder parser in the JDK, for instance, to export to XML, it will get way larger than that.

So opening large flight recordings-- if you do enable the Flight Recorder to write a file or if you have really low thresholds for frequently occurring events, you can get really large recordings. If the large recording is too large to fit in memory, Mission Control will bring up a dialog when you try to open the file and ask you which portion of the file to open. There is also a command-line tool for splitting JFR events along chunk boundaries, which you can find on my blog there.

If you need to, you can give JMC more memory by just increasing the maximum heap size. If you just want to do this for one off when you start Mission Control, you can add -vmargs to the launcher. So -vmargs, for instance-- four gigs would be -Xmx4g.

And if you want to keep the settings between runs and if you always want to give that kind of memory to Mission Control, you would edit the corresponding party of the JDK_HOME/bin/jmc.ini file. So in that file, there is already, I think, a -vmargs portion. And you just add Xms and Xmx to that file.

So navigating the JMC user interface-- there are a few different relevant windows by default. The first one and most apparent one is the editor window. That is the window in the center of Mission Control, and it shows you a visualization of the recording.

And you can have multiple recordings open at the same time, and they will have their own editor windows. And you can dock those so that you can show them side-by-side or above each other and the standard features for editor windows in Eclipse.

And it's split into multiple areas. So there is this vertical tab group that is the major areas of the recording. And each such tab group is split into several tabs. And those tabs are at the bottom of the [INAUDIBLE]. And again, it's easier to just show you this. But we'll get there.

We also have the event types window, and that's a window on the left that is going to show you which types of events are available in the recording. And those are only available for the Events tab group, so with the last tab group, which is really tabs that are all about doing general purpose investigations. And the event types window acts as a filter. So you can enable and disable groups of events by enable, disabling their event types.

So the main tab groups are General. So there, you will find key indicators, basic information, the CPU load memory, heap charts, things like that, and data about the environment of the recording.

Then we have Memory, which will deal with physical memory allocations, heap statistics. We have a Thread group, which show you thread statistics, lock contention, monitor details.

We have an I/O group, which show you file Socket.IO; a System group, which shows you running processes and environment variables; and the general purpose Events tab group, which you use for general investigation-- when you need to solve harder problems, I'd say.

There are some common features available in all tabs. So almost all tabs at the top has a range selector that you can use to filter in on a specific time range. And those can be synchronized between all tabs. They are, by default. So if you switched the time range, that will occur for all the tabs.

If you wish to have a separate time range on a separate tab, there is a little check box that you can use to disable that synchronization. It will also show you what you have in your Operative Set. Operative Set is an advanced concept that we will discuss a little bit later.

And again, in filter boxes, just like we did in the JMX console, you can use regular expressions if you want to. Again, performance-- if you have a lot of events, you may suffer a little bit.

I have prepared a bunch of recordings here so that we don't have to wait for a few minutes on everything. So these are here by default in my little Eclipse workspace. And I'm going to open one up.

And here to the left, you can see the tab groups that I was talking about, the main areas of the recording. You will see here that I have installed some plugins so that I have a WebLogic one. That is for WebLogic-specific information.

I have one for JavaFX events. And at the very bottom, we have the Events one, where I see the general information. And when I switched to that tab group, you could see that the Event Types window got highlighted. So I can enable specific events or groups of events. And you can see how it changes, when I do that, contents of the tabs.

And for each of these tab groups, you can see that there is a range selector at the top. So I can change and look at specific parts of the recording to see what's actually in there. Every of these tab groups are divided into tabs. So you can see here that we have one tab for JVM information, system properties. We can see what options were enabled for the various different event types. So you can see here that the file read event was turned on, it had stack traces enabled, and that we had a threshold of 10 milliseconds for those events. So this will be the major parts-- the range navigator, the synchronizing selections, the choosing the major parts of the recordings, going into specifics, using these tabs.

Moving on-- so analyzing flight recordings-- flight recordings contain a lot of detailed information, and some of that information is very specialized. It has very, very specifically with how HotSpot, the HotSpot JVM, works. So it can be hard to know exactly what to look for and to know what information is relevant.

I am going to show you only a few of the capabilities of the flight recordings during this analysis session. And those, I'd say, are the most commonly used ones. There are more esoteric ones that are really important, but there are a lot of detailed concepts involved.

In the next version of Mission Control 6, we are doing automated analysis of the flight recordings. So at the very end, I might start up a beta version or alpha version of JMC 6 and show you what such an automated analysis might look like. It's going to help you with those more specialized forms of information that are present in the flight recordings.

There is a tutorial available that helps you to try to go through these features and try out analyzing a few recordings. And that tutorial is available on my blog.

There is a power feature available in the Flight Recorder UI called the Operative Set. It's sort of a power feature. But if you know how to use it, it can be extremely useful.

So the Operative Set is a global set of events. It's one per recording. And events can be added or removed to the Operative Set from the Context menu.

So you can add events to the Operative Set through relations, for instance-- so things like add all the events with the same servlet URI to the operative set, or add all the events waiting to enter the monitor on this address to the Operative Set.

The Events tabs have a check box to only show events in the Operative Set. So by default, it shows everything. But it can filter out only the events in the Operative Set. And you can use such filters to just very quickly narrow down things in the Operative Set.

The common workflow is that you find something of interest in one of the static predefined views, and then you add that to the Operative Set. And then you use the Events tabs to hone in on and do more detailed analysis in the Events pages.

So the first recording we'll start analyzing and look at. So in this case, you can see that the CPU load generated by the JVM and the application is bottoming out. We are saturating the CPU. We are running as fast as we can. Presumably, if we had faster hardware, we would run faster running this application.

Another way to get things to run faster would be to optimize it. So what we would like to know is to see where we're spending the most time executing Java code in this application. So let's take a look at the code.

We seem to be executing stuff in the java.util package, and more specifically, in linked lists. If we look at the hot methods, can see that it's really index of, which is being called by contains in link list, which is being called by count intersection in the initiator class.

So Java being open-source and all, we could change the implementation of linked list. That would probably not help us, though. So let's see what we could do with this count intersection method.

Actually, there is one more thing we could do. If we want to turn the tree upside down and just go from the roots and see what is being used the most, we can see that it's a thread run, worker run, initiator count intersection, initiator calling into contains checks for a linked list.

So let's open this method and see what's going on. So what we seem to be doing here is to add a lot of unique elements to this collection, which is a linked list. And then we try to see what they have in common.

So we have two linked lists, and we try to find the intersection. And there are various different ways we could make this perform better. One of them would be-- so linked lists, to find out if an element is contained in the linked list-- that is an operation that is proportional to the number of elements in the list. So [INAUDIBLE].

Since there are unique elements, we can find a better way. One of them would be to have a HashSet instead, which would be able to tell if an element is in the set in constant time on average.

So just by changing linked list here to HashSet, we would get much better performance. So when you want to find out when you have saturated the CPU-- we are executing a lot of Java code-- the best way to start analyzing such a recording would be to look at the code and see where we're spending the most time executing Java code and see if there is something we can do to either call along the path here less-- so less calls to this count intersection method-- or make whatever work it's trying to do more efficiently.

So in this case, we changed data type of the underlying collection. So this was an example in how Flight Recorder can be used for method profiling.

I'm going to open up another recording, which in a way is the flip side of the coin. So here, we have a recording where we can see that the CPU isn't saturated. And we have spent a lot of time trying to make this application parallelized. But even so, we don't get more performance.

So we're wondering why don't we? And then we can look at this Threads tab to see if we have any contention on any locks. And that we do. We have a lot of contention on this lock, which is a logger.

And if we look at particular lock instances, we can see that there is just one instance of this monitor. We can see that they are all waiting to enter this log method that takes a string, and it's all these different threads waiting to get in there.

If we use the General Events tabs, we can see that we have a graph here. So we can get a visual representation of what is going on, where the events are. And we can see these salmon-colored regions are the Java monitor-blocked events. So just by looking at this, we can see that we seem to have a synchronization problem. There is a lot of red.

So you can see here, here are all the Java monitor-blocked events. So the next step would be to just go to this method where everybody's blocking and see if there's something we can do about it.

So this is admittedly a silly little example. So there are several different ways we could solve this problem. One would be to not log, and that is actually quite a valid one. I've used that-- at a big Japanese bank.

So presented with a flight recording, it was logging that was the problem. I asked if this particular line really needed to be logged, and they said no. And that was the end of their troubles.

So that is certainly an option. Another one would be if we are just synchronizing too widely here, we're doing things that don't really need to be synchronized, and we're using the Flight Recorder event API to record custom events here and producing new log event objects.

That doesn't really need to be protected. So we could remove the synchronized keyword here. It doesn't give us anything.

We could give each thread its own logger instance if we, for some reason, wanted this to be synchronized. Normally, if this was a logger, of course, there would be some synchronization further down in the logging framework, and probably we'd end up synchronizing somewhere else.

But if we do something about this-- if we change the way we handle this in either of those ways-- we would get a recording that looks quite differently.

So I'm going to dock these side-by-side so that we can compare them a little bit better. The first thing we can see is that yes, now we are saturating the CPU. So I don't think this is a synchronization or a blocking problem anymore. It's not a lock issue. So we are executing as fast as we can.

And if we look at the graphs here, we can see that there is actually no red. There's no blocking here anymore. So that's good.

And we can also see that in these critical regions, actually that were simulated by sleep, you can see that they are executing in parallel now. So there you go, just like we want. There is nobody waiting on anybody else.

So this would be an example in how you can use Flight Recorder to find out where you have latency problems. So next example-- so the next example is about garbage collections and allocations. So there is a cost associated with allocation and keeping references to objects in Java-- that is, that once you're done with your objects, they need to be garbage-collected.

And the more garbage you create, the more work the garbage collector need to do. So keeping down your allocations is normally a good thing. You shouldn't do it to the extent that go produce horrible designs that are unmaintainable. But a healthy balance is probably good.

So in this case, we have a recording where we are garbage collecting like crazy. So looking at the garbage collections here, we can see that yes, they are happening all the time-- very, very frequently. So we are obviously creating a lot of garbage, or we have some other problem.

Let's take a look at the longest pause here. We have an old collection here. And we can see the different pauses, the phases of the garbage collector. And we can see that it's not like we're spending a lot of time handling soft references or weak references or doing anything other funky than what we would normally do for a garbage collecting.

So this is just us creating immense amount of garbage. The individual garbage collections themselves aren't that long-- and not for the young ones. So what would we do then?

Yes, we would probably want to know how to allocate less objects-- so to see if there is some way we can keep the number of allocations down without affecting the semantics of the program. So in this case, we seem to be allocating a lot of integers. So almost all allocation pressure is from us allocating integers.

In Mission Control at least 5.5, we are treating object allocations in thread local area buffers and outside of thread local area buffers in different parts of the UI. This could be interesting for, for instance, tuning your [INAUDIBLE] size.

But in this case, it does really matter. We have integers even outside of [INAUDIBLE]. It's all about these integers. So the total allocations are mostly happening inside of their local error buffers and its integers. So let's see what we can do about that.

We can see that most of these allocations are taking place in value of in the integer class. So this is a normal pattern. Let's see if we can find out why this is happening. Allocator.go is a class that is ours. So let's see if we can change anything in our code to make this not happen so much.

Actually, there is one thing that might be useful to know here. In stack traces, as you saw now, we just jumped to the method declaration here of the method to go. We didn't end up in the actual line where these things are happening.

So let's distinguish the stack frames by line number so that we get line numbers in the stack trace instead. Then we can see it's actually line 30, the normal one where we end up doing this.

And now if we jump to the method, we will see we will end up on the actual line, not just the method declaration, which might be too general for us to start our own investigation. We want to know which line in that method this is happening.

And it seems to be happening here where we do-- contains keys check in a HashMap. And what is happening here, then? Well, so we have this [INAUDIBLE] class with a primitive int for ID. And we are doing a lot of lookups on that ID.

So what happens when we use a primitive int as an argument to a method that takes an object? Well, it will be autoboxed. So that primitive int will become an integer object every time we try to do a lookup by ID. And this is going to cause all these allocations.

So what we could do-- if we know that this is going to be used as a key in HashMaps, instead of using a primitive int, we could change this to an integer object instead. So just change this to integer.

Actually, this would be the most horrific thing we could probably do if we end here because now we'll get a primitive int, which will be autoboxed into an integer object, which will then be converted to a primitive int, which will then be autoboxed every time we do the lookup. So we probably won't [INAUDIBLE] there. We probably want to change this to be integer.

Could probably end here because the autoboxing is just going to be once when we invoke the constructor now. But just for-- this is probably the way we would want it to look.

So we now have these integer objects being just used whenever we run this. And they will just be autoboxed once on creation of this, myAlloc-- so of myAlloc instances.

So what would it look like, then? If we do these changes, do these optimizations, what would we end up with? Well, actually, let me open up a recording that I've done when I done these changes.

So let's have them side-by-side like this. So previously, our garbage collections looked like this, and we had a gazillion of them. And now with the changes we've done, we have none. We actually have two.

This is also a good point to make. We've removed basically all the garbage collections by doing this change. But we still have two left. So let's see why we have them.

We can see that the GC reason is heap inspection initiated GC. And this is because I did enable the expansive heap statistics. So for this recording, had I not done that, we wouldn't have any at all.

So don't create garbage unnecessarily because that is going to have a profound impact on your poor Java Virtual Machine that needs to get rid of all the garbage, which gives you pause times that you don't want.

So I will be talking more about the plugins later. But there is one thing that I would like to show, which is the advanced concept that we talked about, which is the Operative Set. And I am going to use the WebLogic plugin very briefly just to show you this.

So the Operative Set that I mentioned can be used from the Context menu. And it can be used to finding things that are related. So in this case, I'm going to take all the events that is related to a certain enterprise context ID in WebLogic Server.

So the first invocation of view [INAUDIBLE] I want to see all the related events. And if you look closely up in the range navigator, up here at the top, you can see that part of that range now is turquoise. You can see that it's highlighted in bluish color up here.

So let's see what we now have in the Operative Set in the General Events view. I'm going to enable so that we see all the events. And there are a bunch of them. But I only want to see what's in my Operative Set.

Now we can see that we have a bunch of events here-- transaction events, servlet events, JDBC events. And we can see them in this log, like this. Here is the transaction from the beginning with the servlet request run all the way to the end, when we're sending the servlet response.

And we can see this graphically, if we want to, also. If we show everything, there's going to be quite a lot to look at. If we say that we just want to see what's in our Operative Set, we only get the stuff related to the invocation of the servlet, which is what is going on right here.

So this was boring. But we can see that there is a servlet filter thing happening, and some Enterprise JavaBeans stuff. We could add what is happening in the same thread during the same time to get some lower level information, as well-- see if there is something funny there.

So Operative Set, add concurrent. Then we can see that there are allocations happening here-- creating some HashMap entries, loading some classes, blah, blah, blah. So here, we get some more information about what is happening. That is also visualized now so that we can see if we want this on the timeline. So that is how you can use the Operative Set to hone in on things with certain properties.

We also have Java Flight Recorder integration with JavaFX. So if you download the JavaFX plugin, you will be able to see what's going on or how long the different phases of a pulse is. So let's take a long one.

That was a boring one. Let's take this one instead. And so we can see the pulse starts. We do a CSS pass. It's pretty quick.

So it's probably not a CSS-- one optimized problem with CSS we will start with, and then other JFX-related phases happen. We can also look at the input to see where user input was happening and what kind of user inputs we got.

So Flight Recorder also captures information about exceptions throw, which can also be useful. You have to configure it. It normally just captures errors. But you can have exceptions, too, if you enable it.

And in this case, let's see. Here we go-- exceptions. Here we have two different kinds of exceptions being thrown. The scary exception thrown ones and the exception, thrower exception, thrown a few more times. And we can see what messages were for the exceptions and the stack traces for them.

So I think that will do for demonstrations of the Flight Recorder analytics. There is, of course, much more information in the flight recordings that you can use, and very detailed information about VM operations, for instance. But that will have to be for another day.

So there are some common pitfalls when working with flight recordings. And one of them is to not account for thresholds when looking at the data. So thresholds are very useful for keeping performance up, but still be able to detect outliers.

But they can also be a little bit confusing. So for example, if you have a thread that has been running for two minutes and the sum of the latency events is a minute, was the thread really running unblocked for a minute? And the answer is, of course, it depends on your thresholds. You don't really know.

So what you will find is this-- you will know that it has at least been blocked for a minute. And you will have found the big outliers, the things that made it block for a long time. But there could have been a lot of blocking events just under the threshold that you didn't see.

So of course, you can do more recordings with lower thresholds to see if that is the case. But you're usually in a good place just starting with the longer threshold events, the longer latency events, and start your investigations there.

Another one is not accounting for CPU load. So if you have method profiling data but you have no load whatsoever, that is not really your problem. If you start optimizing your application based on the data that you get from the method profiler, it's most likely not going to have to have any impact on your application.

What you need is to have a recording from the fully loaded application. And on the other hand, if you have a recording where you are saturating the CPU and you're running as fast as you can, then starting to look at latencies might be a waste of time because again, that's not where you're bottoming out.

Now, there are some unsupported features in Flight Recorder. You have features that allow you to produce your own data into the Flight Recorder. There is a Java API that is not supported. It will be supported, but different, in JDK 9.

There is also some features for changing the UI of the JMC Flight Recorder part with an integrated editor. That is also quite useful for customizing the UI. So I do know that there are some people-- one of those hate it or love it features is the dials in Flight Recorder.

I just did some interviews for our next-gen tool. And one of the comments was that people were missing the dials, which we have now removed. Anyways, so you can change that. You can edit the user interface yourself and export them through your changes as plugins and share them with others.

So I'm going to show these features. They are unsupported-- just wanted to say that. So recording your own events is-- this is what it would look like.

So you would have a producer. It would create a producer. And then you would have an event class. And the event class would extend one of the event classes, such as timed event, or duration event if you don't want to be able to set a threshold. And then you would use annotations to provide the metadata.

This code is wrong. So you would actually need to register your producer. You don't do that here. So do my producer [INAUDIBLE] and you should be fine. But otherwise, it's fine.

So in the doStuff method here, we have an event. We do event begin when we want the first timestamp to be taken. We set our text string here, our text field in the event. And then we end the event. That is when we do the second timestamp for our duration.

And then we commit it to the buffer by doing event commit. So this is how it would look like. This is all the code you would need except for the code for registering the producer.

If you want to minimize object creation, you can actually just create the event once outside of the scope of the method, and then reuse it. So you would do an event reset every time. And that's a small optimization not necessary with the new APIs in JDK9.

And then you could programmatically analyze flight recordings, which is also unsupported. So if you wanted to have a script that looks at certain aspects of flight recordings and sends you reports, there are two different parsers that you could use for programmatic analysis of flight recordings.

There is one parser included in the JDK, and that's a parser that gives you a callback for each event. You can think of it as a SAX parser.

Then you have the parser included with Mission Control, which parses into an object model. And that is maybe more suitable for complex analysis. And there, you can think of it as a DOM parser.

And there is more information on my blog on how to use this. But again, these are unsupported. So if you want to use supported ones, you'll have to wait a little bit more.

And then we have the built-in GUI editor, also unsupported. So there is a built-in designer that you can use to customize an existing UI and even produce use new tabs and tabs for your own custom events that you have produced using the unsupported APIs for producing events.

And these UIs you can also export as plugins and share. So you just put them in the dropins folder in Mission Control and other people can use them-- really quite useful. And for all the haters of dials, this is a very easy way to get rid of them.

So I thought I'd just quickly show how you can use the UI editor to get rid of the dials. I'll start Mission Control. And I'll open a recording, whichever. Let's take the dump on exit 1.

And here we have the dials. Let's wait for it to complete. So here, you have the dials. They give you an overview of the heap usage and the CPU usage and pause times. So it gives you a quick indication of how things were going in the runtime.

But we think that they take too much screen estate. So we just want to get rid of them. We go to Window, Show View, Designer. And it says unsupported. So if you get hurt by this, not my fault.

We go to the Overview, and we stop that UI. Stop. And then we start deleting these guys. We don't want the dials. We don't want a space for the dials, either-- so removing them all. Press play. No dials-- have a custom user interface.

So I like this so much that I want to share it with everybody. And then I click on the root node of the Flight Recorder and export UI to plugin-- export UI to plugin. I select my overview.

And then I select a plugin name and bundle name and version. Version is important if you want to be able to send out updated versions because the version with the highest number will be the one that is used. So versioning is important.

And then I press OK. And I get to save this plugin wherever I want to. And voila. So I've now exported this fantastic overread and overview without dials so that others can use it. And they would just need to put this plugin into their Mission Control dropins folder and it would be activated.

So if I'm not happy with it, if I think that those dials weren't that awful, anyways, I could get everything back to normal. I could reset the user interface if I wanted to. And the way I would do that is to go to the Window, Preferences, Java Mission Control, Flight Recorder, and Reset User Interface.

[BEEPING]

It says that I must close all flight recordings before I can reset the user interface. So let's do that. Close. Window, Preferences, Reset User Interface.

[BEEPING]

Yes, no more customizations. Everything is gone. So now I can open up my recording again, and voila. My dials are back. And so you can safely experiment with this and always reset to the default.

So I thought I'd show you a little bit from the future, so show some of the features that are available in an upcoming version of the JDK, JDK 9 and Mission Control 6. But before I can do that, I need to show this disclaimer slide, which says that I'm outlining some stuff that might happen in the future. It's not a commitment.

Things might change. Oracle might decide to not release this. Oracle might decide to release it at some other point in time. So this is the standard disclaimer.

So in JDK 9, the plan is to have a supported POJO API for controlling the Flight Recorder. And this is something that you would use in-process. We will have a supported JMX API for controlling the Flight Recorder when you want to control it remotely. And there will be a supported API for producing custom events.

So the example that I did with custom events-- that is going to be supported. And there is going to be a new API that is really quite much easier to use and even more performant. So that is something to look forward to in JDK 9.

For JMC 6, we will have a greatly revised user interface, especially for Flight Recorder-- is going to be quite different. And we are going to feature automated analysis of flight recordings. And I thought I'd give you a very small, tiny little preview of what that might look like.

So going to give you a very quick demo. So this is what JMC 6 would look like if you just open it up. It's at this point similar to JMC-- that is, you have your JVM browser.

And I'm just going to open a recording that is an actual recording from a production time problem that we had. So in this case, we've done in an automated analysis. And you can see the results of the automated analysis here.

So one thing that we've picked up on is that we have VM operations taking quite a lot of time. So VM operations are internal operations for the runtime. Most of them will be stop the world and try to stop all the threads.

In this case, we have had a blocking VM operation that was quite long, several second-- five seconds long. And we can see that the VM operation was of type thread dump, and that it was initiated from the Oracle WebCenter default timer.

So we can go look at into more detail. We can see that there were two of these for a total duration of 10 seconds. You can see where they were happening. And so problem solved. We stop doing thread dumps from there, and things will be a little bit smoother.

So for these results, we try to provide you with information on why we think this might be a problem and links to more documentation if you need to learn more about the concepts involved. So that's all I'm going to be showing from the future.

So to sum everything up, in this session, you should have learned how to open flight recordings with Java Mission Control; how to navigate the JMC Flight Recorder user interface for the version 5.5; how to look at some commonly interesting data, such as method profiling information, information about allocation, GCs, and some other data sources. And you should be able to use the unsupported design view to get rid of the dials, should you not want them.

And that's it for this session. Thank you.

## 5. Mission Control, Plug-ins - 21m

Hi, I'm Marcus and this is the last, the very final session on Java Mission Control and Flight Recorder. And this one is going to be about plug-ins. So there are plug-ins on different levels for Java Mission Control. After completing this lesson, you should be able to install the Eclipse plug-in version of JMC into the Eclipse IDE. You should be able to install experimental plug-ins to the standalone version of Mission Control-- so plug-ins that extend the functionality. And you should be able to do the same for the Eclipse version of Mission Control. And you should be able to know the basics of using some of the most commonly-used plug-ins for Mission Control.

So installing Mission Control into Eclipse gives you a very similar experience to running the standalone version of Mission Control. You have some advantages. You will be able to jump to source. And there are some additional experimental plug-ins available-- for instance, plug-ins that help you to build plug-ins-- so a PDE plug-in.

So the main difference to keep in mind is to remember that you need to switch to the JMC perspective. So usually, the workflow is that you do whatever you need to do in the Java perspective, or whatever other perspectives you're using. And then when you want to do profiling or diagnostics, you just switch to the JMC perspective in Eclipse. And that would be the biggest difference. You can install this from an update site. It's listed on the Mission Control home page, which is on Oracle.com/missioncontrol. And for JMC 5, you have the full update site URL there, on the slide.

So I'm going to do a quick demonstration on the workflow, for installing and using Mission Control from Eclipse. OK. So typically, the first thing you would do when you try to install this would be to go to Oracle.com/missioncontrol. So let's go there. And then you click on the Eclipse update site, like this. And here you are, at the landing page for the update site-- which, incidentally, is the same thing as the update site URL. So I'm just going to copy that thing.

And then I go to Install New Software in Eclipse, and I just add the site. I've got to call that JMC 5.5. OK. And then I decide what I want. And I want the Eclipse integration. I don't want the translation stuff. I just want that thing. And here we go. Install, install, license agreements, running, and running, and running-- and it is now installing Mission Control in Eclipse. Restarting-- here we go.

And now that I start it up, I will not see any difference except for a little icon here, for connecting the connect wizard. And also there will be a new perspective called Mission Control. And if I select that perspective, there were [INAUDIBLE] running JVMs. But here you would be able to see everything. If this happens to you-- if you don't see any locally-running JVMs, and get that warning, it is because you have started Eclipse with a JRE. In this case, I did start with a JRE instead of a JDK. So just change that, so that you start Eclipse with a JDK, and you won't get that error.

Anyways, Mission Control is now installed, and will work pretty much in the same manner as if I was running the standalone version. So that is how you would install it. OK.

So if you want to install experimental features into Mission Control, and in future versions, if you want to install supported plug-ins, you do that from the Help Install New Software menu. There are two classes of experimental plugins in 5.5. So there are features that we thought might be useful, but that we want to have feedback on, and features that are not necessarily for J2SE users-- so things like plug-ins for WebLogic server that not everybody might want to use, or Coherence plug-ins and other rather product-specific plug-ins. So those you need to select to get installed.

And this is all preconfigured, so it's very easy to do. Going to give you an example on how that might look. So this is the prior version of Mission Control, but that doesn't matter. The process is quite the same. So we go to Help, Install New Software, and you are going to see a wide range of plug-ins that you can install. So for Flight Recorder, for instance the WebLogic [INAUDIBLE] or the Java [? FX ?] one. For the console, you will see things like ThreadLogic, which is a thread dump analyzer for the console-- very useful together with WebLogic.

You will see the JConsole plug-in, which is a meta plug-in for running JConsole plug-ins. I'll talk a little bit about that one in a bit. Right. So just check the ones that you want and then click Next. And they are going to be installed for you. To install experimental plugins in Eclipse, you install it from the update site that is listed in OTN for experimental plug-ins. And again, for experimental plug-ins-- they are not as thoroughly tested as the base plug-ins in Mission Control, and they are not supported. So your mileage might vary. But here is what you would do.

You would go to the Experimental Update site on the Mission Control homepage. And again, the landing page and the update site URL is the same, so you can just take that one. You start up Eclipse. And then you go to Install New Software, add the update site URL, and JMC 5.5 Experimental, for instance. Go OK, and now you have a variety of plug-ins that you can install.

This is a superset of the plug-ins that you have available to you, if you install from within the standalone version, because there are some IDE integrations that are obviously not available from the standalone version. And there is also some PD integration that allows you to develop plug-ins for Mission Control.

So the JConsole meta plug-in is a plug-in for the JMX Console that allows you to run JConsole plug-ins inside of Mission Control, and by extension inside of Eclipse. So after the installation, you need to configure a folder where you put your JConsole plug-ins, so the JARs. And they will be picked up and showed in Mission Control.

So I thought I'd do a quick demo on what this might look like. So we have a Mission Control here. I'm going to install the JConsole plug-in, support like this-- yes, I accept, Finish. So I'm going to need to restart. Here we go, starting Mission Control again. And now Window preferences-- I'm going to need to provide a folder for the JConsole plug-in where I have my plug-ins. So I actually have one here. So there is a JConsole plug-in provided with the demos, in the demo package for the JK. So I'm just going to point one out here. And I'm going to update that thing once a second. And I'm just going to hook up to myself, to see if I now have some plug-ins.

So no, we usually don't have several tab groups in the JMX console, but now we do. This one says that I don't have any plug-ins. Couldn't find any valid plug-ins in demo management. OK-- going to have to re-do this. Hmm. Let me see why. Oh, there you go. So [? JTop ?] is under the [? JTop ?] folder. So my bad-- just going to reconfigure that thing. Window preferences-- there we go. [? JTop, ?] and here we go. We now have a JConsole plug-in running inside of the JMX console, in Mission Control.

There are some other plug-ins. So most notably, the WLS ThreadLogic plug-in that you can install is utilizing the JConsole meta plug-in. So if we install new software, and we install that ThreadLogic plug-in-- Next, Next, Accept, Finish. It's a bigger plug-in, so it takes a little bit longer to install. Restart, OK. And then Connect, and now we can see that there are two different JConsole plug-ins running. We have the ThreadLogic plug-in, and we have the [? JTop ?] plug-in. So that is how you would use the JConsole plug-in to run JConsole plug-ins in Mission Control.

The next plug-in is the JOverflow plug-in. And that is a plug-in for analyzing heap dumps, so it is looking for anti-patterns of how you're using the heap-- and more specifically, for places where you are wasting heap-- so where you could save heap memory. And it calculates how much memory you could potentially save by avoiding using that anti-pattern. And there are several different ones, like duplicate strings, looking for spares collections, and a lot of other ones.

It adds a tool for the JVM browser, which performs a heap dump. So you can do heap dumps from the JVM browser, only for local-running JVMs. But for a locally-running JVM, the heap dumps will be opened in Mission Control, automatically. And there are a few things to note about heap dumps. They can be quite large, is one thing. And they do contain information about the objects on the heap. So if you have sensitive information, never, ever let these heap dumps slip away to people you don't trust-- you could have customer information in there, bank accounts, everything.

And when you do the dump, it's going to stop the JVM. And it can take some time to dump the entire heap, so the performance penalties of doing heap dumps can be quite severe. But I am going to demonstrate how to use this.

So we're going to start up, starting up the Mission Control again. And we are going to install new software again. And we are going to install the JOverflow heap analyzer. Oh, actually, it might already be installed. It's already installed. Good, excellent. So I'm just going to dump myself-- dump heap. Here is a heap dump of myself, Mission Control. And here you can see that we could save 12% by not under-utilized collections. There are some duplicate strings that we could possibly save some memory by not using. There seem to be Eclipse-related ones, so maybe it's not for us to save.

Well, we have some spares collections-- some large ones, some small ones, unused collections a little bit, some duplicate arrays, etc. And we can see what's holding onto these. So let's take these 12% for this guy, the Java [INAUDIBLE] Attributes Map, being held onto by a JAR manifest. So yeah, might not be able to do too much about that guy. [INAUDIBLE] stuff. Anyway, so here you could find out where you could potentially save some memory. There is nothing obvious here for Mission Control itself. So unfortunately, it's not so much fun analyzing that.

So I'll instead try to open up something that might be more of interest for analysis. So I'm going to take another heap dump instead, from an early version of Mission Control where we were wasting quite a lot of memory. And we had these circular, pre-allocated arrays, where we wasted 16% of the heap memory. And they were being held on in our subscription engine here. So one good way to make JMC 4.1 more memory efficient would be to stop using these circular arrays. We aren't using them anymore. So, yeah.

OK, so I'm just going to show one last example for fun stuff to look at. And this is an old recording from an old version of Eclipse. And in this recording, you can see that we have a lot of duplicate strings. And looking at those duplicate strings, we can see that there are path elements that are duplicate, and quite common. And there are lots of them. So system users, Eclipse, all these-- so, yeah. That has actually been fixed in later versions of Eclipse. So these path segments are, I think, [INAUDIBLE] now. So you don't see that in later versions of Eclipse. But it's just a fun thing. That concludes the demos of [INAUDIBLE].

So there are additional plug-ins, and some that weren't covered in this session includes the WebLogic Server plug-in. You saw a little bit of it briefly, when I demoed the operative set in the previous session. That is, of course, most useful for people that use WebLogic Server. There is also a Coherence plug-in for the JMX Console. That one has been greatly enhanced in JMC 6, so it's very different.

There is a PDE plug-in that you can use to create JMC plug-ins, such as the Coherence plug-in. But note that the APIs for extending Mission Control is changing for JMC 6. So there is, I'd say, a high chance that they won't be compatible with Mission Control 6.

And there is a DTrace plug-in that you can use for recording and analyzing DTrace data from within Mission Control. And because there hasn't been that much interest in the plug-in, that one is going to be discontinued in JMC 6. So if you do like it, let us know. And if you want us to reintroduce it, let us know. But for now, we're not going to include that in the JMC 6. If you want to know more about how to use the DTrace plug-in, you can go to my blog, listed in this page.

So for summary, in this session you should have learned how to install Eclipse plug-ins in Mission Control, how to install experimental plugins in both the standalone version of Mission Control and the Eclipse version, and how to use some of the most commonly-used plugins in Mission Control-- or at least gotten an introduction to them. So thank you very much for watching, and if you want to get in touch with me, you can reach me on Twitter, @hirt. You can reach me by e-mail, which is marcus.hirt@oracle.com. And you can also-- there's a lot of information on my blog, hirt.se/blog. So thanks.

## 6. Utilize Java Mission Control - Score 80% or higher to pass

Utilize Java Mission Control

View Skill Check
