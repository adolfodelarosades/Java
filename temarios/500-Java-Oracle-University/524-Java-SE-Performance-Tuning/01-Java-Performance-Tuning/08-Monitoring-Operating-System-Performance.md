# 8: Monitoring Operating System Performance

1. Monitoring Operating System Performance - 23m
2. Practice 8-1: Identify LWP ID by Using the ps Command - 4m

## 1. Monitoring Operating System Performance - 23m

Let's go ahead now and take a look at Monitoring Operating System Performance. That would be Lesson 8. Here we're going to monitor the CPU usage, monitor processes and process CPU usage. We're going to identify potential contention issues, look at monitoring network I/O, monitoring disk I/O, monitoring virtual memory usage, and of course, describe desktop monitoring tools for different operating systems.

So starting with monitoring CPU usage, in general, the rationale behind monitoring the CPU usage is to get a big picture view of the CPU demand, and of course, get per-process measurement of CPU usage.

And the whole measurements of the CPU usage will be related to the user time, which is where the applications spend your time, the system time, where the application-- rather, the CPU is spending time on the system, which by the way, we want it to be as short as possible. The user time, we want it to be as maximum as possible.

We're going to look at the idle time. And then, of course, voluntary context switches and Involuntary context switches, which we'll discuss later on, in a sense that for the voluntary context switches, it's basically when a thread is given a certain amount of CPU time to run, the thread, of course, voluntarily [INAUDIBLE] the CPU after running for its scheduled time. And then the involuntary context switch is when a thread is given a certain amount of time to run, the thread is interrupted, and [INAUDIBLE] the CPU before completing its scheduled run time.

Now looking at the performance indicators, the kind of CPU statistics that may require additional review would be high system/kernel CPU and idling CPU time too. These are not liked. And we want these to be as minimum as possible.

There are different tools that help us monitor the CPU usage. One of them is the vmstat. Vmstat is an interesting type of a command. And it says that it obtained time-base based samples of CPU usage. Again, these samples provide an overview of the percentage of CPU user time, system time, and idle time. OK. And of course, that's one of them.

And we can go ahead and run it. Let's get it and just run it inside our machine. And just go ahead and use vmstat, and I run it every five seconds. And that would give me the System Time, the User Time, and of course, the Idle Time, OK, ID for Idle Time, System Time, and the User Time. So just to give you an idea here about some of the numbers that we see here. And of course, let's go ahead and stop it. OK, that's done. That's good enough.

OK, this is an example where, again, in this case, you see User Time, System Time, and Idle Time on the slide. Of course, we want the User Time to be as big as possible, and the System and Idle Time to be as small as possible.

So here is another example where, again, here we're just running it for where we get-- here, the User Time is bigger. That's not bad. The Idle Time is almost zero. That's also not bad. And the System Time, it should be lower than this, hopefully.

Another command also that we can use is the mpstat. The mpstat is useful. It captures the CPU statistics for a virtual processor. Again, a virtual processor is defined as a hardware thread. And we can also run it, as you see here. And so we can do an mpstat. Let me just go ahead and try to run it on my machine, mpstat. And then run it every five seconds. That also can give me some information output here, pretty much what we have, a User Time, and System Time, and so forth. OK, that's also useful.

Go ahead and stop it. Control-C, stop it. So the mpstat here, for example, we applied it. And basically, you can launch it with the -B on 2. And on a Linux system, the output is slightly different. But this would be on a Solaris machine. Then you can go ahead and run this. And the whole idea is to get user time and system time, and of course, a idle time.

Looking at monitoring processes and identifying potential contention issues, this again, a process basically allow us to-- there are some process monitoring tools that we can use, which is top, is one of them, ps, prstat, pidstat, on Linux and prstat on Solaris. These also can give us a very good idea about monitoring processes and identifying potential contention issues.

Context switching, which is VCX, Voluntary Context Switches versus Involuntary Context Switches. You can identify contention issues, which would be CPU usage and context switching. And you could also monitor individual threads, if you want. Top is one example that sometimes people use. It's a command that you can try. And then you can go ahead and run it on Linux. You can actually run it on Linux, as an example. OK.

You can also-- here's the top that I just ran in front of you. Top is basically also useful because it's available on most Unix distributions. And it displays detailed information about per-process CPU usage, which is also very, very interesting.

Ps is another one. Here's an example where I can go back to my-- and just do a ps -ef, for example. And I grab Java as an example. And I see all the Java processes that are running. In this case, it turns out that I have the 2D application that is running. OK, so I can see it there.

So pretty much, prstat is also very useful. It's known in Solaris. You also have a version of Linux for it. Let's go ahead and run the Linux version for it, which is the pidstat. Let's go ahead and run that. So I could do a pidstat -u -h 3. And this, of course, gives me also-- displays the CPU usage and process information for every CPU that you see here. So you've got User, System, and so forth.

Sometimes also, we can look at the voluntary context switch versus involuntary context switch. Here's a diagram where pretty much here we have some vertical bars representing a time quantum, of course, which is the amount of time the operating system scheduler makes available for an application thread to run.

And the voluntary context switch is that-- in the voluntary context switch, what happened is the thread will run until it ends. Lots of times when you write your code and synchronize, for example, the method, and the method will run until it's all done. And sometimes if it takes longer to run, it might cause some other threads to starve. So voluntary context switches are well known by sometimes causing thread starvation. And that's not good for performance.

Involuntary context switches, on the other hand, is slightly different. An involuntary context switch is slightly different, because what happened in this case is that the thread will go ahead and, of course, execute. And of course, a second thread is interrupted and is not allowed to finish its time quantum.

So that leads us to actually what we call a context switch. Context switch is a waste of a large number of clock cycles, where CPUs do all their computations and they're just ideally data for these as just as retrieved from the CPU cache. But if the data is not in the CPU cache, then the CPU must waste clock cycles to retrieve the data from memory.

So the context switch can cause data fetching from memory. And that's why it's sometimes very costly, because it can cost. In this case, the cost of the thread context switching is very expensive and can cause performance issues. That's why having too many involuntary context switches also can cause a performance problem.

The other command that you could run here, which is Solaris command prstat -Lm. That also can be used where the -m option provides microstate information, which provides VCX and ICX data. And the -L option here shows you information about every lightweight process or thread, in this case. For example, here we see Java thread, lightweight pid, in this case, 3 and 46, 45, and so forth. And you can go ahead and get these and pretty much show you the number of threads or basically the different type of Java threads that are running here.

You could do, by the way, a pid on Linux. And that gives you similar information too. And we can go ahead and run, for example, this on our lab machine, where we can do a pidstat with a -u option, -w -t -h and 3, as an example. And that also brings much the equivalent to the one that we've seen on the prstat -Lm. This gives you also information about the different Java threads that are running. We can do a Control-C here and stop it.

In terms of the lightweight processes, they are pretty much nothing but threads in Java. In Linux, you can get them. You can use ps minus eLf. And that's one example. We can try that. So ps -eLf. In fact, you are going to do this in the lab. And that pretty much shows you all the Java threads that are running.

We've done the pidstat -u -w -t -h, we've seen that. In Solaris, you can do a prstat -Lm. That also works.

Mapping Lightweight Processes to Java Threads. This is quite interesting. So in the HotSpot, you can use a jstack command to dump the thread information. You guys are going to do this in the practice. And then you can go ahead and convert the lightweight process, say a ID from decimal to hex, to find out about which method is basically running.

And you could do this. By the way, I did this in the practice. You guys are going to do this in the practice. I also tried it earlier. And let me just-- yeah, here. So I did run the command jstack and the pid. And then I dumped all of that into that demo.txt under Documents.

And then, if I want to look at it, this is what-- in fact, the the decimal number that I used was-- let me just scroll down here, and I'll tell you which one-- up, actually. Yeah, no actually, let me see. I'm going to tell you which one I was just showing you here. And this would be this one here. It is the object weight. OK, that's basically what I did when I did the conversion. You guys are going to try this in the practice anyway.

Now looking at monitoring the network I/O, the data of interest in the network I/O would be the network usage in terms of Transmission Control Protocol, which is TCP statistics. Some of the tools that allow you to monitor the network would be the netstat, which can, by the way, run on Solaris and Linux, and the NetHogs, which runs also on Linux.

Some of them are not installed on this because we don't have any labs on them. Let me just try the netstat, if the netstat works. Netstat, yeah, it's working. And for the Linux, so it shows you all the ports basically, and so forth. OK.

Under the NetHogs and the Performance Monitor on Windows, I can go ahead and try this just on this lab machine, just so we can have an idea about the performance on the [INAUDIBLE] Windows. So if I write a taskmgr, and let me start the taskmgr here and then look at the performance. And then here it shows that I have four CPUs and the CPU usage on every one of them and, of course, the memory. You can see that in Windows.

Here's a NetHog that can show per-process TCP statistics. I don't think the NetHog is installed. Let me just try it. I don't think it's installed, because I tried it sometime earlier. Yeah, it's not. Yeah, it's not found. But it can be installed, and you can make use of that.

And this is basically an example where it shows the SSH receiving the 40,954 kilobytes of traffic. You can also do a monitoring the disk I/O. The date of interest for the disk I/O would be the number of disk accesses and the latency and average latencies.

Tools that actually help you monitor the disk I/O would be iostat is one of them, iotop, pidstat, Performance Monitor-- Windows, DTrace, iobar, and so forth. And you can try some of this. Let me just see if the iostat is actually on. So here's an iostat command again to give you. You could run that [INAUDIBLE]. Its actually working.

So the iotop, like we said, pretty much is very interesting. And it also gives you some information. Here it turns out that there's nothing happening.

You can do also monitoring of virtual memory. Monitoring of virtual memory, you typically observe, in this case, the page in and page out and the page scan. Page scan is the rate at which the operating system scans for free pages. Lots of times, it is important to fix these type of swapping problems, if we do. Sp swapping is actually really, really bad for Java. Java likes physical memory.

So some of the tools that help us with the virtual memory would be vmstat, top, Performance Monitor of Windows, and so forth. So you can go ahead and look for the taskmgr. Taksmgr would be a good example. And then from there, pretty much, you can look at the processes that are running, performance, and so forth. Here's the memory performance just to look at how your memory is being used on your Windows machine. You're now looking at the memory on your Windows machine.

And here's an output of the vmstat, if you run vmstat. That also can be useful. Let's go ahead and do a vmstat here every five seconds. This gives us the page in, page out, and so forth. We'll do a Control-C and stop it. And the scan rate, and also, it shows you all of that. That's on the Solaris. [INAUDIBLE] also under Windows. OK.

Of course, here's the vmstat that gives you the page in, page out, and the scam rate. And if you watch, from line three all the way to line six, there is an increasing trend. So most scan rates are fine, if they occur infrequently. But if they say, in general, if you see some increasing trend, you need to do a little bit of monitoring and find out what's the problem.

Looking at fixing the swapping problem, in general, make sure you have smaller Java heaps. Add physical memory. Reduce the number of applications running on machines. And of course, any one of these recommendations can fix the problem. This is where I told you it's important to add physical memory, especially for Java applications. Java applications hate swapping. So you have to have enough physical memory for Java applications not to have any issues with the swapping.

You can do some desktop OS monitoring, like Linux uses Gnome, or Solaris uses cpubar, iobar. Windows has the Task Manager. Mac OS has the Activity Monitor, and so forth.

I just showed you-- this is the Gnome, as an example, one that you can go ahead and try on Linux. Another one is the cpubar on Solaris that also is available on Solaris versions.

You also have the Windows Monitor. And I already showed you this earlier. This is just by looking for the taskmgr, which by the way, you can start. And this is what I-- showing you that's more or less what it is. So it's also very useful. Here's the Mac OS, an activity monitor. I'll also give you a little bit about what's going on on the Mac machine.

And that's pretty much what I wanted to say about this lesson. So in here, we just looked at some monitoring the CPU usage, processes, looking at contention, ICX versus VCX, monitoring network I/O, disk I/O, virtual memory, and so forth.

We do have a very nice practice in this lesson. So please go ahead and try it, and we'll take a look at it. Thank you.

## 2. Practice 8-1: Identify LWP ID by Using the ps Command - 4m

So now that we're done with the lecture of lesson 8, let's go ahead and do it's practice. It has one practice, which is A-1 where we identify the lightweight process ID by using the PS command. First, we'll run the Java 2D using this command, which I already did. It's running now. And then of course, in the second tab, in this case, I went ahead and run the jcmd.

And then of course, I mapped it down here. This is it, the pad of that Java 2D, which I already did. It's all basically in the previous commands that I already run. And then after that, that's basically what it did.

And then I do a PS minus ELF. That's basically the output that I see here. And then after, that I run the J stock with that P ID, which I already did here, which is moved to the demo 1.txt.

And after that, I'll go ahead and basically, I also selected here a process ID B for the Java thread. And then I use the start of the basic calculator. And then converted that decimal point into a hex number. I already did that in the using basically, in this case, the command. And then after that, I moved the-- basically here-- so I did the conversion.

And that was in this tab. And that's the number. And then after that, in mine, in this case, I can do it, by the way, through the G edit. G Edit, and then a-- just so I can see that. Demo 1.txt.

And then I just look for the number that I, in this case, converted. And this will give me my, in this case, answering back to looking in this case, and displays the-- in this case, the Java thread that I'm running in this case. And I scroll down and basically, going back to what I have found earlier.

Then it's 3969. And I have 3968, which is up somewhere in here. And that's what I have. Anyway, so that's what they asked you to do in this practice. Thank you.
