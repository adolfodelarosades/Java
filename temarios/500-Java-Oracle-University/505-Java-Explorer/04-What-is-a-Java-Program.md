# 04. What is a Java Program

DESCRIPTION

Learn the basics of what a Java program is, how it works and how to compile it and are introduced to Classes and Objects in Java.

## 01. Title and Objectives 1m

Java Basics, What is a Java Program? In this module, we're going to look at the basics of Java and getting started with the programming language. We'll talk about the purpose of the Java Virtual Machine to run your code. We'll also look at how to use the javac and java executables-- javac compiles your code, and java executes the Java VM and then executes your compiled code.

And lastly, we'll see how to create and run a Java program using NetBeans. This will allow you to work with the IDE, the integrated development environment, that's in your lab environment that you installed in the previous module.

## 02. Java Language 10m

The Java language. A computer program is a set of instructions that run on a computer or other digital device. At the actual chip level, the machine level, the program consists of binary instructions, 1's and 0's. This is what we call machine code, and it's the sequence of 1's and 0's that causes the hardware to actually execute the code.

However, it's both tedious and difficult to write programs in 1's and 0's. And while it was done in the early days, now we tend to write code in high level languages like Java, which is human-readable, and then it's translated into machine code. Then the machine code is executed.

Here's an example of a C program, a classic C program, that's going to print "hello world" to the console. If I want to compile the C program and run this-- if I want to run this on a Linux machine, I would need a C compiler written for Linux. If I want to run it on a Macintosh, I need a C compiler written for Macintosh. And if I want to run it on Windows, I need a C compiler for Windows. This is because C programs are compiled down to machine language, and the machine language needs for Linux are different than Mac OS and Windows.

So then what is Java? Where does that fit in? Well, Java is a general purpose programming language with a syntax and structure similar to C and C++. It's object oriented and platform independent. Whereas C is platform dependent because it is compiled down to machine code, Java is platform independent because we compile it to an intermediate form of code called byte codes.

It was originally designed at Sun Microsystems in 1995 for use in consumer electronics and embedded devices, and it's still used for that today. But it's also used for a lot more as well. Modern uses include writing applications for the Internet of Things, cloud computing, web services, graphical applications, primarily back-end processing-- accessing data, creating web services, things like that.

Now, this course covers Java Standard Edition version 11, which was the last long-term support release. There are multiple Java additions, but you start learning Java with the Java Standard Edition because this is the base addition that represents the core of the Java language. All the other Java additions represent more specialized use cases of Java that are targeting particular environments, such as SIM cards that use Java Card, smart TVs that use Java ME, and application servers like WebLogic that use Java Enterprise Edition.

The key features of the language that we're going to focus on here are the fact it's platform independent and object oriented. Now, remember, we said that Java code is written as source code in high-level code in plain text in .java files. So we create our plain text, and we save it in a file with an extension of .java. Then, we compile that source code into byte codes, the intermediate form of codes, and this is saved in a file with an extension of .class. The name of the file will be the name of the class itself, and it'll have an extension of .class.

Now, the Java Virtual Machine itself must be installed on the target computer, and we must write the Java virtual machine as a platform-dependent piece of software. And that's actually where it comes into play. So in other words, we created a Java Virtual Machine for Linux and a different Java Virtual Machine for Mac and a different Java Virtual Machine for Windows.

And the role of the Java Virtual Machine is to read the byte codes and translate them into the actual machine code for that specific environment. So the Java Virtual Machine is platform dependent, and because it is, the byte codes can be platform independent.

So the Java executes-- the JVM executes your application by translating the Java byte code instructions to platform-specific code. Let's see how that works. So here we come along, and we create the HelloWorld.java file. Here's our class, class name HelloWorld, stored in a file called Hello World.java. We submit it to the compiler by invoking the compiler with javac and telling it to go compiler file called HelloWorld.java. Note, you have to have .java on the end of the file name to submit it to the compiler.

Then, the output of that is HelloWorld.class, and these are the byte codes that represent the intermediate form of compiled code. We can't execute it on a computer directly yet. For that, we go to our Java Virtual Machine. Remember, we have a JVM for each environment-- a separate JVM for Linux and a separate JVM for Mac and a separate JVM for Windows. Now, if we go to that JVM and we put our file over there, our HelloWorld.class file, now I can invoke that on any of those platforms. I type java, which invokes the Java Virtual Machine.

And we submit the HelloWorld.class file to it, and it goes ahead and executes the code. Notice, we don't include .class on the end of the file name in this case. We do do that with .java when we compile. We don't do it when we submit it to the Java Virtual Machine because the JVM is coded to expect that to be a .class file, and that would be redundant and unnecessary. So now, I can actually write my code once and run it in multiple places without having to recompile it each time.

Also, as we said, Java is an object-oriented language. It's based on the interactions of objects. One object invokes actions on another object.

There's not necessarily a prescribed sequence. One object could use another object in different ways and different applications. Let's say we have a person object and a dog object, and the person object here requests the dog object to bark. Then the person object requests the dog object to sleep, because that's what that application requires. A different application may have that person object telling the dog object to bark first and then run and then sleep.

The benefits of Java start with modularity. I can make changes to code in my code that make up my classes that define my objects without breaking other people's code. I can make changes. I can recompile. I can change the implementation of my class without affecting or breaking, hopefully, other code in the system.

Also, it implements information hiding. And what this means is the implementation of the code is hidden. People who are using your class and creating objects from it can't actually see the implementation of the code. But more to the point, the internal state of the object-- the data, the variables that make up the state of the object-- for example, with a person object, probably has a name and address, a phone number. A dog object probably has a name and a weight and a height. Those values are hidden but behind methods. We write methods, which becomes the interface of our class, and we use those methods to effective internal state of our objects.

Also makes it easier to reuse code. I can reuse classes that I've created in other applications. I can reuse other people's classes by creating instances of them as objects. So code reuse is made much easier.

Lastly is maintainability. For me, the big benefit of Java programming and object-oriented programming has been the benefit at the time when I'm doing maintenance. When I'm trying to maintain a program, fix something, I can make a change to my code without breaking other people's code, or I can go ahead and extend the code and have it create new classes that share code. All that's possible through Java.

So the Java classes themselves are the building blocks of the Java application, and they represent things and concepts with which your program operates. Here we see we have an order class that contains code that will store items and allow processing of purchased items. And we could have a customer class that would do things like store customer details, such as name or address, and allow modification of details, such as changing address.

The class structure-- a class consists of the class name-- in this case Customer. It will start with an uppercase letter. Also the body of the class surrounded with curly braces. Here is where the class definition starts. Here is where the class definition ends. It will also contain data, variables and values that represent the state of the object called fields or attributes. And the behavior of the implemented code will be in what are called methods. These are the operations or functions that the application-- that the class is able to carry out.

A Java package is a way of organizing related classes. It represents the folder in which the class will be saved. The folder name, the package, is used to uniquely identify the class. So package names are typically in lowercase. And as an example, we can see here we're creating a package called duke.choice, representing there'll be a duke folder and underneath that a choice folder. And inside of the choice folder, the Customer.java class file will be stored. Well, technically, at runtime it will be the Customer.class file, but nonetheless at compile time it finds it, too. The class's full, unique, qualified name would be duke.choice.Customer.

Now, as we said, the point of object orientation is to create objects, and so we can create Java objects from classes. Classes describe fields and methods that are relevant for a specific type, and an object is an instance of that specific type. Now, to get you started, we're kind of throwing you in the deep end of the pool here and telling you how to create a new Cusomer object. And we'll go into this in a lot more detail in the rest of the course. But for now, this gets you started in your lab exercises.

So here, we're creating a new Customer object that instantiates, creates a new Customer object in memory, and makes customer01 variable point to it. And we have another new Customer object here, and customer02 is pointing to that. And then we can execute behavior. We can come here and tell customer01, set your name to Brain, customer02, set your name to Pinky. So this shows you the basic syntax and how we get started working with classes and objects.

## 03. NetBeans Intro 9m

Introduction to NetBeans-- NetBeans is an Integrated Development Environment, an IDE. It's composed of several windows that allows you to perform useful operations in writing, compiling, testing, and debugging your Java code. The first window is the Project window, and this is where you see your source files and the various libraries that make up your project. A project is the organizational structure that NetBeans uses together all your related files together.

Second is the Editor window. This is where you'll actually type in your code and edit your code. And you can copy and paste and do all the typical type of editor things, plus more.

Then we have a navigator, a very nice way to inspect your code to see what your methods are, your variables, what they're spelled, where they are, be able to access it very quickly, so a very nice, easy way, kind like a table of contents if you will, for your class.

And lastly, there's the output. The Output window is where we'll see the output of compiles, in this case, a successful build. And we'll also see the output of the program when it runs.

In addition to the windows, NetBeans also has a set of toolbar actions. You have the ability to create a new file, so if you needed to create a new Java file or new Java class. You have the ability to create new projects. You can open existing projects.

You can do a clean and build, which does the compile of your class. You can run your class, and that will both compile and run your class. And you can debug as well. You can use the debugger to step through your code and look for errors.

To get started, we'll create a Java project. And that means we'll go to the File menu and select File, New Project. There's many different types of Java projects that we can create. We'll choose Java application.

Now, as I go through these steps, bear in mind that the exercise that comes along with this has you do this. And we have a video as well that shows you a lot of these various aspects of NetBeans and doing this. So you can look at that as well.

But this is also a good reference when you get ready to start your exercise and work on your own. Then you want to name and set the location for the project. Here, the project name is ShopApp. And the project location is home/oracle/labs.

And then you can see the project folder as well. And then do you want a main class? Well, we're writing Java Standard Edition, SE. And so to execute our code, we need to have a class with a main method in it. And that's typically the starting point of the application.

So in our case, we'll click Create Main Class. Then we click Finish. This will create the project for you and open the project files in NetBeans, although there won't be much there.

Now, that we have our project, we can start creating Java classes for our application. Start by selecting the project and the Project window and then invoking File, New File, or click the New File button. Choose that you want a Java class, and the Java Class Wizard will appear.

Name the class. In this case, it's Customer. And assign a package, in this case duke.choice. And you'll see that's going to create a file called Customer.java. Notice the uppercase C and the uppercase C match.

And it'll put it here in under home/oracle/labs/ShopApp source, src, then duke/choice. Remember, we said that packages are actually files in the file system-- sorry, folders in the file system. There's a folder called Duke. And inside of that, there's a folder called Choice.

And that's exactly what you see here. And then inside of Choice is a Customer.java file. The benefit of NetBeans in the IDE is it keeps track of all this for you and makes it much easier to work with.

Click Finish, and that creates the Java class for you. Now, it's empty. You have to, of course, write all the code for yourself. But it's a starting point.

Now, if you have an existing Java project, you can open that in NetBeans and continue working with it. To do that, select File, Open Project from the menu. Or click the Open Project button.

Navigate to the directory that contains your projects. In this case, we navigate to Home Oracle, Java Basics. And then we're in lesson 2. And inside of Lesson 2 folder, there is ShopApp.

And notice it has a little coffee mug on it. That indicates that this is your actual project folder. So you select that, and then select the project, in this case ShopApp. And then click Open Project, and it opens the project.

At times, you may need to create a new package. For example, here, we have a requirement to create a new package to hold payment related classes that will be called duke.payment. So in NetBeans, we'll right click our project.

We'll select New Java Package. We'll name the package, in this case duke.payment. And then we'll click Finish. This creates the package. And now, we can move or copy files into the package or add new classes to it.

Now, as we mentioned, we need a main method for Java SE application, because that's how the Java virtual machine is going to start our program. So when we're creating Standard Edition, SE, type applications, we'll typically have a main method as a starting point for a Java program. The method body contains the program logic, and this is where execution begins. And it's enclosed in curly braces.

So we can see here that we have a curly brace that starts our code and a curly brace that ends our code. And here's our main method. For now, don't worry about the other reserved words and what they mean or what this stuff is. We'll explain that as we go through the various modules.

So here's a more full class example. Here we have a class called Hello. Note the uppercase H.

Notice it'll be in a file. Now, think about it. What would the file name be for this class when we save it?

Remember, the class name is going to have to be the same name. The file name has to match the class name. So there'll be a file in the file system called Hello.java, and it'll have an uppercase H as well.

Then inside of that class, we have a single method, in this case, called main. And we have some comments. It's the entry point to the program. Write your code here. The slash slash indicates a comment.

And then we call system.out.println. Remember, the dot notation is how we invoke behavior on another object. So we're taking saying to the system object, find your out object-- or system class, rather.

Find your out object, and then call the println method. And pass the string to it, and it will print that out to the console. So speaking of program output, where does an output go? What do we do with it?

Well, system.out.println is going to print that program output to the console. But there are other places that you could send output to. You could send your output to a file or a database-- very common to send output of your program to a database and save the state of your objects in your data when your program is done.

You can send it to the console. That's what system.out.println does. It sends that and types it to the console.

But more typically, what you're probably going to see today is a web page is going to interact with your Java program. And your Java program will send data back to the web page. Very common design today is to use something like JavaScript for the web page interface, and then use your Java code to do all the business logic.

Now, of course, we want to avoid syntax errors. Syntax errors tells you that you've type something incorrect or done something wrong. And the Java compiler and NetBeans will tell you if this occurs.

Here, for example, I typed the line system.out.println hello world and left off the semicolon. And immediately, NetBeans flagged that with a red warning sign. And when I put my mouse over the red line, it told me a semicolon is expected. And if I tried to compile it, it tells me an error as well, that the semicolon is expected.

So NetBeans is able to run the compiler for me and give me compiler messages all in the same integrated development environment, very convenient. So some of the common errors that you get started with, you would be using unrecognized keywords.

If you were to spell the word new with an uppercase N, that would not work. Or if you're missing closing quotation marks or unmatched braces or missing semicolons, those are the most basic types of syntax errors. There are, of course, others as well.

So as we come to the end of this module, we're going to have our first exercise for this module, which is going to create a new Java application using NetBeans. You're going to use the Java Application Wizard under the Java with Ant category in NetBeans. Your project name is going to be ShopApp.

You're going to create a main class called duke.choice.ShopApp. You're going to then print the "Welcome to Duke Choice Shop" message from the main method. And you're going to run the application.

Now, if you think you can, try to do that in NetBeans just with the instructions you see here and what the instructions that you saw in this module of working with NetBeans. If you get stuck or need help, of course, we've recorded the solution for the lab. And you can watch the solution and go through it, and you can see how it's done and follow along.

## 04. NetBeans Intro Demo 3m

Exercise 2, creating a new project and Java class. In this exercise, we'll create a new job application using NetBeans, using the Java Application Wizard under Java With Ant category. We'll name it ShopApp, and we'll create a main class called duke.choice.ShopApp. We'll print "Welcome To Duke Choice Shop!" message from the main method and run the application.

Looking at NetBeans, once we have NetBeans started, we can create a new project by going to the icon for a new project, or we can use the File menu. We're going to create a new project. It will be Java with Ant, Java Application, and we'll click Next. And we said we're gonna call this ShopApp.

Notice I have a couple already, so I'm going to call this ShopAppExercise to distinguish it. The other ones are solutions I have and other demos that I'll be doing. We also want a ShopApp application with a main. There we go. Click Finish, and it creates the basic project for us. There it is.

So it gives us a main method, and it gives us the basic class. Let's go back for a second and make sure we have everything we want-- Java application, ShopApp, duke.choice.ShopApp. Let's check this thing.

OK, so the package is wrong. If you get the package wrong, it's actually pretty easy to change. You can right-click on it, and select Refactor, and then Rename. We want to call it duke.choice.ShopApp. Sorry, duke.choice. OK, so I'm going to change that to duke.choice. And notice, it renames it both the package, and it renames it in the file itself.

All right, last thing we want to do is we need to print out, "Welcome to Duke Choice Shop!" from their main method. So to do that, we can actually write the words system out println. However, there are conveniences and code templates that are available. So if you press, in this case, S-O-U-T, for system out println, and then press Tab, it writes the entire phrase for you. There are other things as well-- IF statements, and other things we'll see later.

All right, so for this, we want it to say, "Welcome to Duke Choice Shop!" OK, and then we can run it by clicking the green Run button. And it says, Welcome to Duke Choice Shop. So we've got our project. Project works. Works in NetBeans. And we're all good. That completes this exercise.

## 05. Jshell 3m

 
JShell-- JShell is an interactive Read-Evaluate-Print Loop command line tool to light a test out Java code without having to write full programs. You can learn the Java programming language and even prototype Java code very simply and easily. It will evaluate declarations, statements, and expressions as they're typed in, as they're entered. It will show you the results immediately.

So looking at an example, we can invoke JShell by just typing JShell at the command line. Then if we type int x, indicating we want an integer x variable equals 1, it will assign the value 1 to x. Then if we say int y equals 1, it will create an integer y variable and assign it the value 1.

And then if we type x plus y, it'll add the two together. 1 plus 1 gives us 2. To exit JShell, we just simply do a forward slash exit. And that exits JShell back to the command line.

Here's a reference for you if you need help and you want to play with this. Here's the slash exit that gets you out, slash list. Notice all the commands have a slash on the front. And you can do other things like edit, save, open, create variables and methods. And you can have a lot of fun with this without having to write full-blown Java programs and be able to test out code.

OK, we've got a quiz for you. We have quizzes throughout the modules. The way we do this is that the quiz answers are on a separate slide. So after I read the question, you can pause the video and think about what the correct answer is and then when you're ready, resume the video and see if your answers match up.

OK, which of the following are correct? Choose all that apply javac space OrderClass, will that work? java OrderClass, javac space OrderClass.java, java space OrderClass.class.

OK, go ahead and pause the video. Think about your answers. And when you're ready, hit the Resume button.

OK, so the answers here are b and c. Well, let's see why that is. OK, Java itself invokes the Java virtual machine. And the rule is, when you invoke the Java virtual machine, you pass in a class file. And since it has to be a class file, the .class is assumed. So b will work. d will not because of that very reason. We do not put .class on the end.

However, almost the reverse is true with javac. javac is the compiler. And when you call a compiler, you have to pass it a file with .java as an extension. So a does not work because we don't have the Java extension.

So b works because we pass an order class without .class to the Java virtual machine. And OrderClass.java with javac works because that invokes the compiler correctly. How did you do?

## 06. Summary 1m

In this module, you learned the purpose of the Java Virtual Machine, the purpose of the javac and java executables, and how to create and run a Java program using the NetBeans integrated development environment.
