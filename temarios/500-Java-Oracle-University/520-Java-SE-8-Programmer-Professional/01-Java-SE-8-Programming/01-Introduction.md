# 1: Introduction

1. Introduction - 15m
2. Practices for Lesson 1: Introduction - 10m

## 1. Introduction - 15m

Welcome to Java SE 8 programming. My name is Doctor Steven Watts. I will be your instructor for the next five days. And as such, what we're going to be covering is that-- as you can see on the board, we have a lot of material to cover.

The purpose of this course is to make sure that you are comfortable with Java from not only a fundamental level all the way through the beginning advanced levels. So what we're going to be talking about this week is we need to review what you should already know.

In the Java Fundamentals course, we talk about classes and how they're used. We talk about encapsulation and subclassing inheritance. And we talked to some extent about polymorphism, different ways that we might want to work with classes. But we're going to quickly go through those just to make sure that you feel comfortable and that we don't assume things that may not be true.

But once we've reached there, then we're going to start introducing much more advanced concepts, things that are much more interesting, but also look for reuse. So we're going to introduce this idea of nested and abstract classes. What do those things do?

Now in design patterns, we often use abstract or nested classes in the past because there really wasn't a better way to do this. However, in SE 8, what is introduced is this idea of lambdas.

Now, what you're going to see is a lambda is basically an extension on the use of abstract classes and an extension upon abstract classes. And so we're going to introduce the use of interfaces and how those work with lambda expressions.

We will see how collections and collection streams, which are also new in version 8. And we will also introduce you to the delivered functional interfaces that belong to lambda, as well as the delivered operations-- what can we do?

From an abstract, from a generic standpoint, lambdas are just simply a logical extension of what we are going to learn in generics. The ability to type something at the time that we need it at design instead of at runtime.

We will then shift gears. We'll talk about exceptions. How do we handle what goes wrong inside of our programs? And also, how can we test the logic in assertions?

We'll also introduce, also in version 8, new date/time API. So again, an extension on what we've had before.

We will introduce you to input and output, but focus primarily on the files and the files classes and the path classes that are in nio2.

We'll get into multi-threading and how that can work as well as using the new-- relatively new. It was introduced in version 7, the fork join framework. So how can I make the system work for me? And then that extends into parallel streams.

Once we have covered the multi-threading portion of the class, we will get into, how do I persist to the database? And then finally, we'll look at, how can I localize my application?

Right now, let's go ahead and look at the slides. Now if you notice on slide 1 here, there is an introduction. And what we want to look at are the course goals.

Now, the course goal is to prepare you for the Oracle Certified Exam. Basically, the Java SE 8 Programmer Exam. And so as part of that, each one of these chapters will give you the information that you need and the skills that you need to be able to know to pass that examination.

Well, that and some experience. We're also going to talk about how we can leverage object-oriented features of the Java language, how we can execute Java applications from the command line. And then of course, how we can work with collections, lambdas, and exceptions.

So we've kind of looked at what these objectives are on the board. And so we'll be looking into how to make that happen.

Now, we're going to assume that you have a certain amount of experience. And so you should have completed the Java SE 8 Fundamentals course or have corresponding experience with the Java language.

We expect that you should be able to compile, to write, and execute programs. And you should have at least experience with one programming language, so the concepts will be very familiar to you. That includes object-oriented language and experience with a database. At least some prerequisites.

Now, as far as the prerequisites go, this slide identifies what those prerequisites are. So to successfully complete this course, you should be able to compile and run Java applications, create Java classes. But as you've seen, we're going to ensure that you already know how to do that.

And we're also going to make sure that you know how to use the new keyword, the difference between a Java primitive and a reference type. We'll also look at how to create methods. We'll look at some of the conditional statements, like the if or the switch. We'll also look at the three looping constructs. And we'll also see that you can work with simple collections, like arrays. And finally, we'll also introduce you to the Javadocs.

And at this point, I'm going to go ahead and demonstrate for you. In this environment, we're going to have a number of things that we're going to work with. Now, mostly we're going to be working from the desktop. We're going to be working with NetBeans. That will be our development environment in this particular situation. And so I'll go ahead and open that now.

Now in addition to NetBeans-- so while we wait for that. Whoops, here it is. So we're going to be working with NetBeans. But behind the scenes, we also have the Java Developer Kit version 8. These are the primary tools for this particular class.

Now, later on we will be working on the database. And so we will be using the Java DB. Firefox will help us to test certain conditions. And in this situation, we are working on an Oracle Linux box. But primarily, we're going to be focused on working with the Java Developer Kit.

Now, once you bring it up, you're going to see that over to the left is our project workspace. And then here will be our development workspace where the Start page is.

Going back to the slides. As a quick reminder of what we're talking about when we talk about creation of a application in Java. What we're talking about is the creation of a Java file.

Now, the Java file has an extension of Java. And we will be creating some of those shortly. But we will then apply that Java file with the compiler, the Java C.

Now, the Java compiler allows us to convert the Java file into a byte code file or a class file.

Now, with a class file you can run this on any platform. It doesn't matter if Linux, Solaris, Windows. It doesn't really matter what workstation. In fact, we could put this in an embedded device very easily. But it is this class file that will run on the Java Runtime Environment on any platform.

Now, the Java Runtime Environment includes two main pieces, the Java Virtual Machine, the JVM, and also the class library. In our case, we're working with the Standard Edition, or SE. But once again, once we have that JRE, it will run any class file.

Now, in this class we're going to be focusing primarily on the Java language. So what's the syntax? How do we work with the different elements that constitute this? And we're going to be focused on Java SE, or the Standard Edition.

Now, it is possible that we could have a subset of Java SE called Java ME, which is the Micro Edition. Or, if we are working on an enterprise level application, it is possible that we would build on top of the Standard Edition for the Enterprise Edition.

Now, the focus in this class is that we are going to be working with version 8 of Java. Now, Java has been around for a number of years. And as part of that, we generally have a standard upgrade about every two or three years. And so version 8 is the next one in line.

Now, in order to do this at home, for example, if you wanted to be able to work with Java not inside of the class environment and you wanted to work with the NetBeans environment, all you'd have to do is go out to either downloads.oracle.com and you would be able to get that. Or you could go out to netbeans.org. And in that case, you would be able to download not only NetBeans, but you would also be able to download the embedded JDK.

Now, once you've done that, then your environment would be very similar to what we're going to have in the classroom environment.

Now, there are additional Java server environments that we might be working with. Primarily in this case, however, we are going to be working with the application level. But Java, of course, can be used at many of these different levels that we see here.

The point of Java is to give us the ability to work with any number of different devices. And this slide shows a number of different devices based on the cloud. And anywhere from cars, to voice over IP, to data and applications. And Java can give you the platform to be able to write programs for any of these different things. It's called the internet of things.

Also, as part of Java of course, we have a community. I'm not going to cover each and every one of these, but you can see that Java is not primarily or even principally an Oracle product. It is a product that can be used across the board and is available.

And so as part of the community, there is the Java Community Process which allows us for-- how does Java continue to grow? If there are demands, how do we get those included as part of Java? When we talk about lambda expressions and lambda functions, those are new and were proposed as part of the Java Community Process.

Now, the open JDK is, of course, an open source implementation of Java. It is the basis for Oracle's JDK and is available across the board for a free download. You can work with this. And that's what we're going to be working with in this particular class.

In addition, not only is it free of charge, but of course Oracle does have some pay-for Java solutions. And they're listed here if you have an interest in those products.

There are a number of places where you can go to get additional resources for what we're going to be talking about as we go through the class. Some of them are shown on this particular slide.

And so as a summary, this is going to be a fun class. There's going to be a lot of material that we're going to cover. And I think you're going to learn an awful lot.

## 2. Practices for Lesson 1: Introduction - 10m

All right, let's go ahead and do practice 1. In practice 1, we're basically getting ready and just looking at the environment, getting familiar. Some of you may not be familiar with a Linux environment. So the whole point of the practice is to get you involved.

Now in this case, what we want to look at is first of all, is that we're going to do a quick overview. Now if you are not logged into the Oracle Linux 6 environment, you would click on the Oracle user name that is on your screen, and that will provide you the opportunity to insert the password, Oracle, as well. So that gives us this.

Now in activity 2, it introduces how can we use the command line in Linux. And so in Linux, the command line is accessed through applications, system tools, and terminal. And then it also has a number of commands here, that you can use in Unix that are similar to the commands that you would have in DOS. We're not probably going to have to do a lot of this. But it does give you the opportunity to see what that's like.

So in this case, if I go to Applications-- that's up here in the upper left-- go down to System Tools. And we will choose Terminal, which is Linux's form of the command line. In this case, we want to bring up the editor, which is gedit.bashrc.

And at this point, it's showing our classpath for the course. And what we want to do is we want to enter the line export path equals slash USR Java JDK dot 1 dot 8 dot zero bin. And we'll go ahead and save this. And then we will finish it up.

Now the last thing that we're going to do in this particular activity is to start NetBeans and open a project. In this case, opening up NetBeans we do have an icon on the image itself. So if we double click, it will go ahead and start up NetBeans. It may take a little bit of time the first time you bring it up. And like I said, it's going to give you-- or bring you to this start page, which we can pretty much close.

Now just to take a look at it, what we have here, our projects work space here is where we're going to be working with our various projects, as we go through the class. Now we can get to our projects either by creating a new project-- some of which we will do. And in some cases, we will already have an existing project on the file. And so we'll open the project by using Open Project. If you prefer the toolbar, to create a new project would be the second icon over, and to open a project will be the third icon over.

Now in this case, it basically says that we want to open a NetBeans project. So let's go ahead and click on Open Project. And you'll notice that there are a number of files that you can access.

So in this case, under the Oracle directory there is a Labs folder. And if we double click on the Labs folder, notice that it does show us a number of-- well, pretty much every chapter has its own folder here. And so inside of the Intro, there is a Practices directory.

And in the Practices directory, we want to access the Java 2D project. Now you can tell the project because it has this little Java icon. And so in order to open it, we'll just go ahead and click on Open.

And notice a couple of things. There is a Java file that shows up here in the work directory. Over to the left, we see our project. And in the project, we will normally have two folders.

Under libraries, we will generally see the JDK 1.8. That's what we're going to be working with in this class. And then under Source Packages is where we will often see the packages that we will create, or that we will be working with. In this case, it doesn't have us actually working with any of those. So we'll get to that a little later.

Now when you have a Java file open, you will see that if it's Comments-- for example, this here-- they will be a little washed out, but you'll be able to read them. And so if we go down further, you'll identify that the first item is the package. We'll have any number of imports, and in this case, you can see that there are quite a few imports that are going on. And once again, back to a comment of who created this and then our class declaration that we're going to be talking about in the next chapter.

Now in this case, it looks like we are declaring a number of static fields and in some cases, static arrays. We also have a number of private fields that are available here. And then our constructor, in which it's going to create-- it looks like it's going to create a graphical user interface.

Now if we keep going down, there are a number of ways-- and this is a best practice, if we're talking about a GUI-- to be able to access each of these directly and create the Run window, start the Run window, et cetera. You can see over here in the navigator that each one of these methods are shown as members in this particular demo.

And so if we wanted to be able to run this, we could either click on Run at the top to run the project. Or you can also see that this would be a F-6. If we want to clean and build the project, that would be a Shift-F-11. So I'm going to go ahead and just hit F-6, and let's see what happens.

So you can see that, well, there's some distinct functionality going here, some graphical effects that are a part of this. It identifies certain things that are going on, some of which, we'll actually talk about in this class. But there are number of ways that we can work with this particular demo. And so you can see all of these can be done in Java SE 8. And so there's a lot of things that we can do inside of Java.

At this point, however, we're not really going to be talking about those. So I'm going to go ahead and close the output. And then I'm also going to close the project.

So if you're finished with the project, and you are wanting to work with another project for example, you can just go ahead and right click on the project, click on Close, and we're back to the beginning. And that is the end of practice 2.
