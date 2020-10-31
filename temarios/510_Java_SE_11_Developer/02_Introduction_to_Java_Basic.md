
# 02. Introduction to Java Basic

### Description

Overview of the Java Basics course, audience, cloud lab environment and where to go for more information.

## Java Basic Overview

Introduction. This learning path is designed for beginners, novices, and those students beginning their study to become an Oracle-certified professional. Now, beginners should have basic mathematical, logical, and analytical problem solving skills, and novice programmers are those who've maybe programmed a little bit and want to started at an introductory level.

For students who are starting their path to become an Oracle-certified professional, this Java basics course feeds into the Java Standard Edition 11 Programming Complete course, which covers all the topics necessary for certification and as part of the Java Learning Subscription and the Java Standard Edition learning path.

In this course, you'll be exposed to basic programming concepts. Things like loops, and variables, and arrays, and if statements, and decision making. And you'll also be exposed to how this is implemented in the Java programming language, and you'll learn about classes and objects.

The format for the course includes both lecture, a student guide and presentations, recorded presentations like this, and exercises that you perform inside of a lab environment, and quizzes to test your knowledge. At the end of the course, there is a case study where you can actually experience more hands-on learning working with Java code and programming at a larger scale.

The course environment is hosted on an Oracle Cloud Infrastructure VM Compute Instance. If you don't have one, you'll arrange to get a free trial account in order to run the course. With that OCI account, you'll provision a compute instance, and that instance will already have JDK, the Java Development Kit, installed. You'll then install NetBeans and use that to do your lab exercises.

It's actually fairly straightforward to do this, and we take you through this with detailed instructions and a video. So what do you do when you want to learn more after this course? Well, the next course after this is the Java Standard Edition 11 Programming Complete course, which is a much more comprehensive course. It's been designed for experienced programmers.

You, having gone through the Java basics course, will have gained some experience and can take the Java SE 11 course. This is for those who want to learn the full Java programming language, all the different constructs, work with collections, concurrency, work with I/O, classes and objects, and utilize the core language APIs and modularization.

It is designed for those with an existing knowledge of computing. Also those who need to learn all the aspects of Java SE. Students practice those skills in each lesson, and it's based on the current long term support version of Java Standard Edition 11. After you complete this course, you're well on your way toward attempting your Java 11 certification. In addition to this course, however, we do recommend additional study and coding to prepare for the exam.

Now, also to learn more about Java, you can use the Java API documentation. The API documentation is presented as a set of web pages which lists all the classes, and packages, and modules in the Java application program interface, with a description of what the class does and examples of code.

It also lists all the methods, the operations, the fields, the data, all the details for the class. And all the documentation is tightly hyperlinked, so you can easily move between classes and facilitate lookup to see how one class relates to another and how they all tie together. The documentation is available at this website.

You can also search for it on the web by searching for Java SE 11 Docs API, and that'll get you there as well. So in summary for this module, what we saw was we reviewed the course objectives and we got an overview of the computer environment that will be used in this course.

## Provision Environment

[ORACLE UNIVERSITY JINGLE]

Exercise 1. In this exercise, you're going to register for a free Oracle Cloud Trial Account, if you don't already have one. You'll connect to that Oracle Cloud account. You'll run the keygen program to generate public and private keys, if you don't already have them.

You'll provision the VM compute instance with the Oracle Cloud Developer Image, which will have very useful software on it for you to use. And you'll set up VNC access. You'll connect to the virtual machine using something like Tiger VNC, or whatever you choose.

You'll download NetBeans into the virtual machine. You'll set the proper JDK in the virtual machine. You'll install NetBeans, and you'll test whether NetBeans starts and runs.

So we have this all broken out in detailed steps. And so when you look at the video for the exercise, you can follow along with it. And we'll take you through the steps one by one for registering for the free Oracle Trial Account. Once you have that account, you'll connect to the account, you'll provision a VM compute instance, and you'll do all the rest of your work in that VM compute instance once you connect using the VNC. Good luck.

## Provision Env Demo

Welcome to Java Basics, lesson one, exercise one. In this lesson, we'll see how to register for a free Oracle trial account for the Cloud if you don't have one, connect to that Oracle Cloud account, run keygen to generate public and private keys for SSH access, provision a VM compute instance, where we'll do our work, set up VNC access and connect to that virtual machine using Tiger VNC, download NetBeans into the virtual machine, set the proper JDK, Java Development Kit, for the virtual machine, install NetBeans, and test that NetBeans starts and runs correctly.

If you access oracle.com or go to cloud.oracle.com, you'll access this page where you can access a free Oracle trial account. Now, because this is a free Java course, we decided that the students could bring their own trial account with them and use their own account. Oracle is not providing an account for you for this course.

But you can simply go to the trial Oracle Cloud tier, click on that, go in and click on Start for Free, and then fill out the pages necessary to create an account. Put in a territory, an email address, click Next, put in your identifying information. You will need to submit a credit card for authentication purposes.

And you're given free credits, $300 in free credits and access to all these free services as well. Once you sign up for the account, and it takes only a few minutes, and the account is provisioned, you'll see an email come through that looks something like this. It'll say that your account is now fully set up, you have $300 US in credits that you can use toward any Oracle account Cloud services.

So now if you click on Sign in to Oracle Cloud, we'll be able to sign in. They're going to want my user name, so I'm going to select that right now so I can just paste it in. Click on Sign in to Oracle Cloud account.

I was already signed in, so it just brought me in. But if I was signed out, and I'll show you that here. I'll sign out and try to sign it again. Click, and it should take me right to the page. There we go.

All right, so username and then password, which I happen to know, since I created it. I do recommend saving your password for this sort of instance, because you can copy and paste from a number of places. So here we are.

Once we're inside of the Cloud, we can see we can create a virtual machine. That's where we do our work, install software. We can create a database. We can work with networks. We can also get an introduction to Application Programming Express, which is a low code development environment, or a demo for working with things like microservices.

Over on the far left, you have access to all the different compute features, file storage, object storage, databases, different types of databases, different types of data systems, analytics, email, application integration, developer services, marketplace with different applications like WebLogic that you can-- and SOA Cloud Service that you can install, different platform services for developers, identity services.

So a complete Cloud native development environment. For our purposes here, we're a lot more simple. So all we need is a virtual machine. So for class, we're going to click on Create a VM Instance, and it'll take you into a screen here. We're going to call this Java Basics VM.

And I'm going to change the actual image being used here, and I'm going to change the shape, and I'm going to change that to Oracle Images and come down and select Oracle Cloud Developer Image, which is a free image. There's no license required for it.

Click Select Image. Now let's take a look at that image. If you go out and you search, for example, for Oracle Cloud Developer Image, there's a very nice blog post that should come up first that lets you see things like what's installed for you. So they have, for example, Java virtual machines installed, Python, Node, Go, Oracle Client, SQL Developer, the Oracle Cloud Infrastructure, command line tools, Python tools, other JDKs.

Also it has-- sorry, system development kits. It has VNC Server installed, which we'll use. It also has Eclipse. So you're welcome to use this, and this is a great environment to get started with in terms of doing development. Also, it has some nice instructions for how to connect your lab environment, including how to connect through a graphical interface through VNC, and how to set up Java correctly inside the environment. So this is a really nice blog post to go to.

All right. So at this point, we have our instance and we changed our shape to Cloud Developer. I'm going to show the shape right now. And right now, we're using AD 3. That's fine. And I'm going to change my shape. Right now it's an AMD instance, but I'm going to change that.

It's a little low on memory and a little low on CPU, so I'm going to change the shape of that. And I'm going to actually take that on up and make it an Intel, and I'm going to-- actually, oh, I have to upgrade the paid account. That's why. There we go.

So we'd have to upgrade to get something different. That's fine. Let me cancel this and come back again, and we'll try changing the shape. I'm going to need little bit more CPU, so I'm actually going to bump this up to two CPUs, 16 gig of memory, and it will perform a lot better than what we had specified initially.

OK. Click Select Shape, so now I'm going to have a two core CPU with 16 gigs of RAM. That'll be great. I'm going to take it as a public IP address, take the rest of the default settings, and I need an SSH key pair. Now, to create the key pair, if you right click and select Open SSH Key Pair, it'll take you through how to actually do this.

Here's the actual steps for doing it right here. Now, I'm on a Mac, so I'm going to open up my terminal. And notice on my terminal, I have my command, ssh-keygen -t, using the RSA algorithm. I'm not going to supply the password right now. I'll do it later.

It's going to be called Demo SSH, and I'm going to put it under Users/Joe/DemoSSH, because my actual keys are under a .ssh folder, and I don't want to mess those up. Now, if I run this and press it, it'll say, OK, generated. And it says, OK, there's no such file directory, because I don't really have it on my system.

But normally, you'd use your normal .ssh folder, or wherever you want it located. You can put it wherever you wish. All right. Once you run this, it will create two files for you. It'll create a public key and a private key, and I'll show you what those look like.

Now, these are the ones, my normal ones that I normally work with. As you can see, I have two files, id_rsa and id_rsa.pub. I was just showing you what the command line looks like here, just as I was showing you what it looks like here on the page.

You do need to do this. You do need to generate a public key and a private key. And then in my case, I like to drag and drop. And so I am going to come down here and simply drag and drop my public key. You won't see this happen, because it's on a different monitor.

But I'm going to drag and drop my public key onto the spot right there. You can also paste in the key. Open an editor and paste it in, or you can click Browse and go out and see it in the file system that way. And this works whether you're working on Macintosh or not.

I'll click Create. And what will happen is it'll now start provisioning that environment for me, and it'll take about maybe five minutes to provision. You can see here, Java Basic VM is provisioning. I have a terminated one that hasn't been cleared out yet. We'll come back when the provisioning is done.

OK the instance is provisioned, and you can see that it's running, green, running, and it has a public IP address, so we can access it. We can click on the instance name itself, and you can see the public IP address, which you can copy if you need to paste, which we probably will, as well as other information.

Now, to get started with this, we'll go back to the Oracle Cloud Developer Image page and it'll say, getting started, you first have to connect with SSH. We have the key set up. So now I need to run this to connect to the actual image. We're going to do that to set up VNC.

So over here in my terminal, I've typed in ssh -i, then the path to my ID RSA file, which has Users/Joe/.ssh/id_rsa, then OPC, which is the admin password, admin account we're going to use, and the IP address. The IP address, again, comes right from here. Remember, I copied it.

And so I now actually have it here. And when I paste, it works just fine, OK? Press Return. Now it says, all right, can't verify the authenticity of the host, because it's the first time it's seen that host. Do you want to continue? Yes. OK. Now, what is the passphrase?

This is where I'm going to use the password. You won't see it, but I'm going to use the password that I used when I set up the key. And there we go. I'm logged in. So I'm connected into Java Basics VM. You can tell because there's the name right up there, Java Basics VM, and I'm logged in as OPC.

Now, going back to the commands here, the first thing to do is to configure VNC password by typing the VNCPASSWD. My password, I'm going to use the same password that I used for the instance itself. You can use whatever you want. I don't want a view-only password, so no for that.

And now I'm all set. The last thing I need to do is to start the VNC server. So I type VNC server as it says here, and it says it doesn't exist. It creates it because it's the first time. For the first time the instance is being accessed, it's going to listen on 5901 its port, and now I'm all set.

Now, I need to exit for this next bit. Make sure I'm not connected to the machine itself. I'm still back on my local machine. And now I'm going to do this command that you see here. I'm going to tunnel through using SSH and create a connection to that machine, and then Tiger VNC will be able to use that tunnel to connect to that remote machine.

So SSH, L for my tunnel, 5901:localhost:5901-i, and then the location of my ID file. There we go. ID, and then where is it going to? OPC at-- and then I'll go grab the IP address from here. Press Enter.

And it likes that, so now it wants the password phrase. And I'll use the pass phrase that I used before. And now I'm connected. Now, don't do anything more with this. What I do is I bring up Tiger VNC. So Tiger VNC is here, and I want to connect to local host 5901, because it says it's telling us down here. So again, the instructions are right there on the page as well if you want to go back to it later.

Click Connect. It should ask me for a password. That will be the same password that I used to log in with. Simply paste it, and bang, there we go. I am connected to a virtual machine. I will click Next, Next, turn off the location services. I don't care for this. Skip.

I'm ready to go, and there's my machine, very quick. Again, notice it's quick because we chose the two CPUs and the additional memory. That one gig is too small, so be careful with that. Right click. We're going to change the background, because I find that red annoying. You don't have to do this. I'm just doing it because of myself. Click Select and there's the background.

Now, one more thing we need to do. Down here where it says you can switch between various installed versions of Java SE, if we right click and open up the terminal and type Java Version, when it comes back, maybe. That's unusual. Let's try that again.

OK, so it does see Java. And it sees Java version-- there we go. All right. So version is 1.8. We want 1.11. So to do that, we're going to type in sudo, because this is a root user command. So sudo then alternatives, space, hyphen, hyphen, config, space, Java.

Now, notice when it comes up and says the current Java version is this guy down here, which we don't want. We want this one up here, User JDK11. So we're simply going to type in the number 1. That'll set the new JDK. And now if we redo our Java version, press Enter, we're now seeing it's 11. Yay, that works great.

OK, now the JDK is set. What we need to do now is download NetBeans. Go here to Application, Favorites, Firefox. I'm actually going to drag this to the desktop for use later, and then double click on Firefox. OK. Firefox came back, and what we're going to search for is Apache, NetBeans, Apache now owns NetBeans, and so we'll go for Apache NetBeans.

And click on Download. Welcome to Apache NetBeans. Click on Download. And then we want the newest release, 12, so click on NetBeans 12, long term stable release version, LTS version download. We're on Linux, so we're going to download Linux. If you're on Windows, you can download that, or you can download a Mac version if you're on the Mac.

Again, you don't have to use this virtual machine in the Cloud if you don't want to, but we thought it was a good way to get introduced to the Oracle Cloud. You get free access to all the services. You can work with that, learn, use that going forward. And, of course, you can use it for this class as well.

But if you don't wish to, again, you can simply download NetBeans, for example, to your local machine, as you've seen me do here, and then close the window. And because I'm on Linux, I'm going to open up a terminal window, go to my Download folder, because this is where it downloaded to, and the run sh./apache.

That's it. So just CD to your Downloads folder, and then do the install. This will take a moment. OK. It will install the basic IDE, Java Standard Edition and Enterprise Edition. Excuse me. OK, we're not going to customize anything, so we'll click Next. And we'll accept the license agreement and click Next.

Now, for this, you can put it wherever you wish. If you want put it somewhere else, NetBeans 12 is fine. I make sure of choosing 11. Come down here to JDK 11. One moment, please. By choosing 11, I know that I'm going to get JDK 11 and it will work correctly.

Otherwise, I'm not sure. It might choose 12, or 8, or something else. OK. So I'd make sure I'd choose 11. 11 comes up. I click Next. Check for updates, it's fine. Click Install. Now, this will take a few minutes, and it may even look like it hangs for a moment. But it's fine. It will install and it will complete.

OK. NetBeans installation is done. Completed successfully. Click Finish. And then we can close our terminal window, and you can get rid of the desktop file if you want. You don't have to. Now, if I go to Applications and come down here to Programming, there is a new option. Notice Eclipse was already there, but you can come over here to Apache NetBeans and just drag it onto your desktop.

There we go. Now, to start it, let's start and make sure it runs, and there's one configuration we have to do. And the first time you start NetBeans, it does a little bit of housekeeping things locally, so it's a little bit slower to start up. But what we want to do is go to File, New Project, all of our code lives in Projects.

We're going to use a Java with Ant project. Take the default Java application. Click Next. Now, the first time you install NetBeans and the first time you do this, you get prompted to install the NetBeans Java C for the compiler Java C editing support library.

You do want that. So click that on, and then click Uncheck Java FX. We're not using that. And then click Download and Activate. And yes, you want to click Next, and yes, you want to accept the terms of license agreements and install. And this will install the NetBeans Java C plugin to allow NetBeans to edit your Java code correctly.

Click Finish. It's now basically done. Give it a moment to activate Java SE. Now, it's going to create a project, and it's going to put it in a certain location and create a main class, none of which we've talked about yet, so don't worry about that for now.

Want to just make sure that NetBeans runs correctly and that you're configured correctly for the remainder of the lab exercises. Click Finish, and it creates a project for us. It also creates a first class file, which has a main method. The main method is where code is executed.

I'm going to come in here and actually put it in just a little bit of code just to write out to this console. And I'll just say, hello world. And then to run this, we come up here to the green Go button that says Run Project. Click it, and you'll see that the output window appears. It says, hello world, and the application works.

So I have a fully configured virtual machine where I have NetBeans installed and I can do my exercises from the class. I also have access through my Cloud account to all the different Cloud services that Oracle provides, so you can play with those. There's many tutorials. Oracle has many tutorials. Oracle has courses and certifications on all that.

For now, that's enough to get going, get started with our course. That completes this exercise for lesson one. Up next, lesson two, we'll get started working with Java. Thank you, and I hope you enjoyed this video.

