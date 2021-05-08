# 4: Introducing the Java Language

1. Introducing the Java Language, Part 1 - 21m
2. Introducing the Java Language, Part 2 - 15m
3. Practice 4-1: Viewing and Adding Code to an Existing Java Program - 8m
4. Practice 4-2: Creating and Compiling a Java Class - 6m
5. Practice 4-3: Exploring the Debugger - 11m

## 1. Introducing the Java Language, Part 1 - 21m

So now that we, again, went and finished with the practices for lesson three, let's go ahead and get into lesson four. And lesson four has the title "Introducing the Java Language." So now we're going to introduce the Java language.

So in this course, we are going to define a class-- rather, in this lesson, we're going to define a class. We're going to identify the components of a class. We're going to explain the term "object." We're going to also describe the purpose of a variable.

We're going to look at discussing methods and describe how to use a main method. Remember that the main method I was just discussing with you in the morning. We're going to look at describing the elements that comprise a Java class, such as declaration, return values, and the proper use of brackets and braces. We're going to also look at identifying keywords and describe their purpose. We're going to test and execute a simple program. We're going to describe some common causes of syntax errors and finish by describing the purpose and features of an IDE debugger.

Let's start by looking at defining a class, identifying class components, and making use of variables. So of course, this lesson, what it does for us, it provides us an overview of the component of a class. Again, it also describes how to compile and execute a Java technology program that consists of multiple classes. And of course, we need to understand what developing and testing classes is all about.

So the question that we typically have is, how do you test something that you've built, such as a house or a piece of furniture or a program? Again, remember that we pretty much are mimicking the other engineering fields. And now a program is nothing but a component that can be tested.

And of course, we said there are many different ways to test a program. And you can, of course, test different components using the unit test. You can also test the entire item by seeing if it fits into the environment and so on.

Now, identifying components of a class. So typically, classes are, like we said earlier, folks, they're blueprints that you use to create or define objects in your program. For example, in the figure that you see here, some objects that might exist in order, again, in this case, to take care of the order entry program of Duke's Choice. And you see here, we have the order entry. That's an object. And it interacts, for example, in this case, an order. And then the order will have a bunch of shirts. And of course, the order is for a customer. And the order was created on-- and then give it a date.

Also, in this case, the entry itself, it has what? A window. And in the window, it has a bunch of buttons, for example, and text fields and so forth. That's the idea. So the idea here is to combine these objects. Some of them, again, are graphical user interface objects. Some of them are just regular objects that we work with or data objects. And of course, combining all of them will help us create this Duke's Choice application or other system. Everybody's following, folks? OK, good.

Continuing with that, let's go ahead and look now at structuring a class. It turns out that whenever we work with classes, we need to declare them first. So classes are pretty much composed of some Java code, which is required to instantiate objects, like a shirt, for example, object. And of course, in this course, it divides the code into Java classes in our file, of course, into a bunch of different sections.

First of all, you declare the class. And then, after that, you declare your fields or attributes or variables that hold values for particular objects. Then you declare methods. By the way, they're optional, but you still have to declare them. They are methods that handle the operations. And of course, comments, it's a mechanism by which you comment your code.

And by the way, did you know that a class does not have to contain both methods and attributes? There are actually classes that contain only attributes. And usually, classes that contain only attributes, they're called object-based classes, because there's only data.

But then also, we have classes that actually are presented you learn that you want to tackle us and then there are classes that contain data and methods, or just method by itself. Those are called behavioral classes. Or sometimes, also, they're called if they have only methods. Or sometimes they're called also object-oriented classes.

All right, continuing with that, let's go ahead and look now at structure and class. Ah, now we've got there. So now it turns out, folks, that we have here a class. If you take a look at the class, the way we declare a class, we use, again, in this case, you have public class Shirt. So definitely, this is a class declaration.

And down here, this keyword here is specific, by the way. This tell the compiler that, hey, this structure is a class. And it's called Shirt. So that's pretty much all. Again, in this case, it shows the example of the Shirt class.

And of course the first set here, these are representing what we call the fields of the class, or the feed declaration. It turns out that we declared here a shirt ID, and it's of type what? Int. And it's public, so anybody can access it. And we initialize it with what? Zero.

And then, if you take it here, forward slash, forward slash, whatever you write in that line after the forward slash, forward slash, that's commenting, which means the compiler of the JVM will skip that.

Then here, we declare a description each of type what?

String.

String. And we initialize it with a String called what? Dash description required dash. And then here, we have-- how do you call this? Comment. And then here, of course, we have here, we declare color code as what? Of type what?

Character.

Character. And we initialize it with what?

U.

The character capital U. You see how, whenever we initialize the String, it will be between double quotes. And when we work with character, it's only what? Single quote. Did you see that, folks? OK, good.

And then here, we declare a variable called Price of type what? Double. And we initialize it with what? 0.0. Again, this would be the default price for all shirts. And then here, we declare an integer called what?

[INAUDIBLE].

OK, good. Initialize it with 0. And then down here, we have a method. First of all, there is a comment here that says the method displays the value for an item. And then what's the name of the method, folks?

Display method.

Display method. It turns out that this method, as you see, it has open parenthesis, close parenthesis, which means it's not taking any what? Arguments. And then we'll see this again later on. And then what does it return? Nothing. When you want a method to return nothing, you write what in front of it? Void. And by the way, can anybody access this method from outside? The answer is, yes. Why? Because it has the modifier called what?

Public.

Public. Good job. And then here, we have a bunch of statements. System.out.println does what? It prints out to the, again, standard output. And here, what are we printing? This shirt ID String, in addition to what? The value of the shirt ID. And then the description with a value of the description is what? Description required. And then the color code, in this case, String, and then the color code would be what? U for now.

And of course, the price in this case, it should be, by the way, this shirt price, which is, in this case, what? A String that is going to be printed as it is, as it's written here, Shirt space price colon space. And then, of course, it prints the price, which is right now what? 0.0. And then it prints the quantity in stock. And that's, of course, in this case, what?

0.

0. Good job. And of course, every time you print a value, you have the N at end. And that means what? Once it prints, it takes you where? It takes the cursor to what? To the new, next line. Good job.

Ah, now we are going to look at the symbols used in defining a Java source. It turns out that we have the curly braces. And this signifies what? A block of code. And then we have what? So the curly braces enclose the code for a specific method or a code for an entire class.

For example, here we have the braces that starts here and ends here. That's the one that contains the class. And then we have one of the method that starts here and ends here. In fact, we put some comment here. This is the class. And this ends what? The display method. Everybody's following? Good.

Then you have the parentheses. And parentheses, they're used to indicate an input data, also called arguments, that can be passed to a method. Turns out that right now, in this example, we don't have any arguments to pass yet. But we'll see examples later on where methods take arguments.

We also have commas. And again, in this case, pretty much, comma-- or rather, before, let's look at the semicolon. Well, the semicolon represents what? It signifies the end of a statement. A Java statement always ends with a semicolon, all the time, all the time, all the time. Everybody's following? OK.

And the comma, what does it represent? It can separate multiple arguments and values. It can actually declare more than one attribute separated by commas.

And then we know that the single quotation marks represents what? Defines a single character. On the other hand, the double quotation mark defines what? A String of multiple characters.

And then the forward slash forward slash indicates what? A single line comment. Everybody's following? OK, good.

Now, putting it all together, here's an example where the syntax, for example, to declare a class, you will have the class identifier. Again, that represents what? The name of the class. You have this class here, which is what? A special keyword that tells the compiler the code block is a class declaration.

And then you have the modifier. And this modifier, by the way, which is sometimes optional, is a variable that determines the accessibility that other classes have to this class. Again, public means what? Everybody can access it. We'll see later on about some other modifiers, like private, protected, and so forth. Everybody's following?

Of course, the class modifier represents the name of the class. For example, in this case, what would be the name of the class?

[INAUDIBLE].

It turns out, by the way, that a class always starts, by convention, with capital character. That's, again, the convention all the time. So typically, the first character of every word capitalized. That's, again, the convention.

And of course, here, what does this keyword say? What does it mean? That Shirt is what?

Class.

Is a class. That's what it tells, tells the compiler that, again, the code block, in this case, is a class declaration. Then here, we have public, which means that this instance of this class can be accessed. And then down here, we declare what? An attribute, in this case, called what? Or an instance variable or a field called price. And it's of type what?

Public.

Public. And what is the access modifier?

Public.

Public. Double is the type. And then the modifier, in this case, is public. And then it has a method. What is this method? What's the name of it?

[INAUDIBLE].

Does this method take a parameter, an argument? The answer is, yes. What is this argument? What's the name of it?

PriceArg.

PriceArg. And it's of type what?

[INAUDIBLE].

Good job. And then does this method return an argument? No. Return a value, rather? It does not return a value. That's why it has Void in it. And then inside, there's only one statement, which means what? We use that priceArg that we passed. And we use it to do what with it here? To assign it to the field price that you see over there. Everybody sees that?

Remember that a class always starts with a curly brace and closes with what? Curly brace. Turns out that here, we have another curly brace here. And that's for what? For the body of the method. Everybody's following, folks? I'm going to quiz you later on. I'm just kidding.

OK, continuing with that. Again, we've seen the example where a shirt, in this case, represents a class. The public is modifier. The class keyword followed, in this case, by a class name on the shirt. And of course, we saw curly braces that close and open the block of the code of the class. We also saw curly braces that open and close the method body.

Now, some requirements for your source file. In this course, you will be developing your classes so that the Java technology programming language code that you write for every class is in its own text file and a source code file. Again, in the Java programming language, source code file names must match the public class name in the source file and, of course, must have the .java extension. For example, to Shirt class must be in the file called what? Same name as the class, plus the extension .java. So class always will be in the file that holds the same name as what? As the class with the extension what?

.java.

.java. Good, good. Everybody's following, folks? Ah, we've got a quiz here. Select the class declaration that conforms to the class naming guidelines. Look at this carefully. Would you think that a? Yes. Why? Because it does not have a public. That means it's default. It's package friendly. You learn about that later on.

How about the second one?

[INAUDIBLE].

Is it good, or no?

No.

Why?

[INAUDIBLE].

A capital. Good job. How about this one?

No.

No. Why?

Class is [INAUDIBLE].

Class keyword is missing. How about this one? Same problem, right? Good. So a would be the solution.

Ah, now we're going to get into field declarations and assignments. The field declarations, folks, and assignment block follows the first open curly brace, typically. And of course, generally, what you do, you set up all of the attribute variables for the class after the curly brace.

So again, we should notice the semicolon at the end of every line of code in this particular example. This is one statement. This is another one. This is another one. This is another one. And this is another one. Got that?

So here we declare fields or field declarations. And we initialize those fields also. As you see, we initialize the shirt ID with 0, description with a description required String, character code with the U, capital U, price with 0.0, and the quantity stock with 0.

Commenting. Well, you can comment in a single line by using what? //. You can also, by the way, comment the traditional way, /*, and then */. That's using what? C-like commenting. It's also accepted in Java. Right? Good. Everybody's following?

And of course, the traditional commenting, using a forward slash asterisk, and then asterisk forward slash. And you could put anything you want in it. That's the traditional one.

And we want to just add some comment here. Did you know that there is a third type of comment called documentation comment. You can use the Java technology tool and the Javadoc tool to create documentation of any of your classes that you write, again, to be used by other programmers.

In fact, all the class library documentation that comes with the Java SE SDK was created using the Javadoc tool. Documentation comments must, again, in this case, begin with the forward slash and then a couple of asterisks, and end with an asterisk and a forward slash. So in the previous example, in this case, of a traditional comment, it would be a valid documentation in this case, because obviously, you see that it has // at the beginning. That's also acceptable here.

Now that we've discussed the variables, or the fields, let's go ahead and look now at methods and the use of a main method. Let's take a look at the method. Well, a method is, by the way, folks, the syntax of the method. It has the modifier, return type, the name of the method identifier, the arguments, and of course, the method code block.

And the modifier represents what? The server-unique Java technology queue has to represent what? The access to the method. Is it public, is it private, and so forth.

And then, of course, you have return type. That again indicates the type of value that is returned from the method. And then you have the arguments, which represent what? The arguments and the type of arguments that you're passing to the method.

And of course, you have the block code of them. Here, for example, I have a display information that takes-- how many arguments it takes? Zero. None. And then returns what? Nothing.

And then inside, we have some print and a statement that allow us to print what? Shirt ID, shirt description, shirt color, shirt price, and the quantity in stock. Everybody's following? So far, so good? OK, good.

That's the idea, again, behind doing all of this. So again, this is just a continuation of what we're trying to explain in terms of the syntax of a method. Everybody's following, folks? Good.

## 2. Introducing the Java Language, Part 2 - 15m

Let's go ahead now and look at the next topic. And that will be identifying keywords. Now remember, folks, that keywords are what? They're special to the Java language, which means we cannot use them to represent any variables or any name of a method and so forth. Let's go ahead and look at that.

Here are some of the keywords that we have. Abstract, default, for, package, synchronized, assert. We're going to see a good chunk of them in this course.

But then there are other ones that you will see, of course, when you take the next advanced course. Like synchronize, for example, you will see it in the next advanced course. This is to synchronize a block of code when you are handling what we called multi-threading. Everybody is following? OK. Good.

So keywords are special, reserved words in the Java programming language that give instructions to the compiler. Keywords must not be used as identifiers for classes, methods, variables, and so forth. Remember that. And of course, if you make a mistake, usually the compiler will scream at you, give you some errors. And then you realize that, oh, I made a mistake here.

Let's go ahead and look now at testing and executing a simple Java program. So creating and using a test class. Remember, folks, that most of the classes that you create throughout this course cannot be executed by themselves directly. Instead, what we do is we execute them in another class and that class is called the test class.

In general, for example, when we created Shirt class, what you're going to do is you're going to create a ShirtTest class that will go ahead and create an instance of Shirt. And that's where you are going to test the Shirt class. Everybody sees that? This is how typically it works.

So always when you have a Shirt class, you go ahead and create a ShirtTest. Again, the test class has a couple of distinct tasks to perform. Provides a starting point, in this case which is called the main method of your program. And then creating an instance of the class that you are trying to test, and its methods.

All the time, all the time, all the time. Everybody sees that? OK. Good.

But before getting into the test class, let's go ahead and understand about this main method. If you remember, I was saying that the main method, folks, is a special method. Why? Because that's the JVM, the Java Virtual Machine, recognizes the starting of your program or a starting point of every Java technology program that runs from a command line from where? From the main method. All the time, all the time.

So it's a special method that the JVM recognizes as the starting point for every Java technology program that runs from a command line. For example, here is how typically you have this main method. It always-- this is pretty much the same text.

Well, as you see here, it pretty much has the main method that contains two required modifiers, in this case public or static. And again-- rather public and static, these are required. It has to be public, because the JVM can access it in this case.

And it has to be also static. And static is a special word that we're going to see later on. It means it's a class method. And you do not need to instantiate an object of type your class to be able to actually run the main method.

And the main method, by the way, does not return any value. It always, always returns void. All the time, all the time. Plus, the main method accepts zero or more. In this case-- let me go back.

The main method always accepts zero or more objects of type string. And that's represented by the array of strings called args all the time. Again, this syntax allows you to type in values on the command line to be used by your program while it is running.

Now looking at compiling a program. So of course, the first thing that you need to do to compile a program is go to the directory where the source code files are stored. Enter, again, the following command, which is javac. Again, javac stands for what? Java Compiler.

And then the file name. File name is always with a dot java, all the time with the extension java. Like for example here, javac. And I'll compile it using what? Shirt.java. Everybody sees that?

So after the compilation has finished, and assuming that no compilation errors have happened, you now should have a new file, in addition to the class that you have dot java. You're going to have a class name dot class in your directory. And that represents the byte code that was created for you.

So when you, again in this case-- oh, by the way, you can go ahead and later on you will see that in the ShirtTest.java, you create an instance of the Shirt so when you combine the ShirtTest.java, it also compiles the Shirt for you too. Why? Because the ShirtTest class depends on the class, the Shirt class inside. We'll see that later on. And of course, it creates too Shirt.class and ShirtTest.class.

Now of course, the question is how to execute the program, test it. Again, go to the directory where the class files are stored. And enter, again, this following command, java classname-- classname without extension, without the dot java extension, folks. For example, here, Java space Shirt dot Test.

And of course, it will go out and print all this for me. Everybody sees that? So far, so good? Good job.

So pretty much this is how we say an example when you are on the java space ShirtTest, it's going to go ahead and print these for you. And those come from where? From the instance of the Shirt.

You can also, by the way, compile and run a program using the ID. In fact, that was a question asked this morning by Vinod, when he says, Joe, I'm trying to compile this class but it's grayed out.

So again, in this case, you right-click the file and then, of course, compile it. And you can compile the file. And sometimes also when you build the project, building the project also compiles all the files inside the project.

And so it's the same as, for example, javac. And of course, after you do it, you right-click on the file. And of course, you go ahead and run it. So here just to show you, yo know Save All will go ahead and compile it automatically.

You can also right-click and say Compile. OK. And then here, when you right-click on the file and click Run, this is similar to what? To using the Java command and then the name of the class. Right? Everybody is following?

And we say be sure to observe any red bubbles, indicators that you got a syntax error and you need to fix that before running it. Otherwise it's not going to run.

Now let's go ahead and look at describing some common causes of the syntax error. Again, NetBeans IDE, and maybe other IDEs too, will give you hints on what's the problem.

To avoid syntax problems, again, in this case, take a look at these little red bubbles that you see. And sometimes it's underlined. If you hover your mouse over that red, it will give you, again, a suggestion. In this case, it says, expected what? Semicolon.

So again, to avoid syntax problems, be sure that you, again, observe any red bubble indicators in the code editor to locate syntax errors, have a semicolon at the end of every line where it's required, and have an even number of symbols, such as curly braces, in this case, and brackets and quotation marks and so forth. Either single or double quotation marks, because there is one that closes the other one, all the time, all the time. Everybody sees that?

So in this case, we'll see that in this statement like we have here, we forgot what? The semicolon. And that's why it's screaming at us. Everybody sees that? OK. Good.

Well, usually when I see a red thing like that, I call it screaming. I'm calling the compiler screaming at us, saying, you guys can't do that. And we need to fix it. Everybody is following, folks? Good.

Let's go ahead now and look at describing the purpose and features of an IDE debugger. Well, working with an IDE debugger is very, very interesting. Why? Because it helps you debug your program.

A debugger lets you place breakpoints in your source code, add field watches, and step through your code, run into methods, take snapshots, and monitor execution as it occurs. Again, you can also attach the NetBeans debugger to an already running process.

Usually, again, other features include a configurable debugger where you can configure the breaking-suspending behavior, specify variables, formatters, and skip methods and packages by using the Step Filters. You can debug making use of Debugging windows. The Debugging window integrates the Sessions, Threads, and Call Stack views.

Configurable breakpoints that, again, you configure these custom breakpoints to be triggered by conditions and events such as an uncaught expression, class loading, and variable access. And expression evaluation that evaluates the Java syntax expression assigned to watches and conditional breakpoints, live, while stepping through your code. It gives you, again, the intermediate operations, like what you see here, computations and so forth.

Expression stepping steps over individual expressions within a statement. Multi-session debugging debugs several processes at the same time. And HeapWalker, watch references to objects while debugging a program.

Again, some of the features, you don't see these here in this particular course. But of course, the more you get into Java, like threading and all that, you could actually use the debugger that helps you pretty much go through the details and find out what is wrong with your code. Everybody is following, folks? OK.

Again, in the screen we see a program in the middle of the debugging session. Again, the arrow in the left pane indicates that the IDEis stepping through the code. And of course, we see it here. OK. The left.

And of course, pretty much stepping through your code. And this again, is the next line that, again, would be executed. And of course, in the Variable windows, at the bottom of the screen, you will see the fields of the class that are currently being executed. And of course, in this case, referenced by the keyword. We'll see this later on.

Again, during a debug session, you can change the values of these fields and try again to see different scenarios and how it behaves. And that's pretty much what I showed you here. Everybody sees that? OK. Good.

So in summary, what we have done, ladies and gentlemen, we looked at how to define a class now. We looked at identifying components of a class.

We looked at objects. And we created instances of objects. The purpose of variables, the purpose of the main method, the elements that comprise a Java class, like declarations, return values, and the proper use of brackets and braces and so forth.

Keywords. And we looked at keywords and their purposes and testing and executing a simple Java program. We looked at an example of some syntax errors. And we looked at the features of the IDE debugger. Questions, folks?

It turns out that we have practices for the Lesson 2. We have Practice 1, Viewing and Adding Code to an Existing Java Program. Practice 2, Creating and Compiling a Java Class. Practice 3, Exploring the Debugger.

And by the way, from the Activity Guide, we can see now where first you'll go through the steps to view and add code to an existing Java application program. See, they show you step-by-step. Practice 2, you create and compile a Java class. And they show you step-by-step how to do it.

See? Step-by-step. And then the last one, again, exploring the debugger. Again, they show you step-by-step how to do that. So it's actually worth going through this to learn what's going on.

And that's pretty much what we wanted to do . So folks, let's go ahead and do practices for Lesson 4. There are three of them. And then, of course, once we finish, we'll continue with Lesson 5, lecturing Lesson 5.

## 3. Practice 4-1: Viewing and Adding Code to an Existing Java Program - 8m

After looking at lesson four where we discussed the introduction to the Java language, we pretty much looked at the concept of identifying the components of a class. We looked at the concept of the symbols used in defining a Java source. We, again, looked at the concept of field declarations and assignments. We looked at the concept of some of the, again, methods and attributes and keywords. We looked at creating and using a test class. Again, we create a class. And then we test it with a test class. We looked also at some of the concepts of the syntax of attributes and methods and so forth.

Now, what we're going to do is we will go ahead and do the practices for lesson four. And we'll start with practice 4-1. In this case, we wanted to view and add code to an existing Java program. So the assumption is that we have a Quotation.java and a QuotationTest.java that appear in the folder of the practice. Again, in this case, they asked us to create a new project from the existing Java source just as we did in practice 2-2.

Again, the high level steps are shown in the table here where, again, in this case, we have the Menu, New Project, and then New Project Wizard, choose the Project step, in this case, Java and then the Java Project with Existing Sources, and then Next. And then after that we'll go ahead and create a new project with Existing Sources Wizard, in this case, name and location. In this case, the project name is Practice04 and Next. And then after that we'll go ahead and choose the existing source file here, which is a D: back slash labs back slash lesson04, and then click Finish and then, of course, Project Property Windows make sure that we have the source binary format to be JDK 7 and click OK.

So that's all done. And then of course, once we see that practice, it would look like this where we have a Quotation.java and the QuotationTest.java. We can double-click on it to open it. And let's go ahead and, of course, in this case, obviously, after that we identify the fields and the methods contained within the class using the table that we see here. And then of course, the solution would be the code and the method name in display.

Again, in the display method, what we do is we want to pretty much print the code field that we have in this case. And the code, of course, in this case, is String. And it's initialized with this String. And then of course, the display we'll put in system.out.println. And we display, of course, try to print the code .

And then, of course, after that we want to go ahead click on the Save button to save that file and then open the QuotationTest in the editor and examine its main method. It creates an instance of the Quotation class and then calls the display method, in this case, on the reference variable to the instance of type Quotation. Then after that we want, of course, run the test. And then after that they ask us to edit the code and then run it again. And that's what we going to do.

Let's go ahead and take a look at that. And for that we are going to look at, here's the quotation. As you see, it is a class called Quotation. It has an attribute or, in this case, an instance variable called a code that is of type String. And we initialize it to the String, welcome to Oracle, the new home of Java. And then we create a display method. And this display method takes no arguments and returns void, which means it doesn't return anything. And in it, we just use the system.out.println that will go ahead and print in this case. And we pass code through it so that it will go ahead and print the code for us.

And then in the QuotationTest and as I mentioned to you folks in the lecture, I said that from now on in this particular course every time we create a class we always create another class to test it. And usually the name of the class that tests it is always it holds the same name as the class plus the word test with a capital T next to the name of the class. And here's an example, QuotationTest. As you see, it has a main method. And in it, we'll go ahead and declare a reference variable of type Quotation called myQuotation.

And then after that we'll go ahead and create a new instance of the quotation by using the new keyword here. And then of course, the name of the class followed by open parenthesis closed parenthesis, that is called the constructor. And we'll get to see it later on in the next lectures. And of course, we'll understand starting lesson five we'll go ahead and understand what is this statement all about. And then after that, once we created a new instance called, in this case, a reference variable called myQuotation, which is initialized with the new instance of the class Quotation.

Now, we'll go ahead and invoke the display method on the reference variable myQuotation And that, of course, should, in this case, execute the method that you see here by printing the code. Let's go ahead and do that. And of course, as you see, it's now prints welcome to the Oracle, the new home of Java, which exactly this one here. And we did it from the QuotationTest by calling the display method on the reference variable called myQuotation, which is a type, in this case, Quotation initialized by a new instance of that Quotation.

And then after that what they want us to do is to alter this. So we can always say, welcome to Oracle, the new home, and I can say, the source, the source for the Java technology or the Java technologies. So we can do that. And of course, after that we'll go ahead. And in this case, if we, again, in this case as you see, just by saving, then it's all compiled automatically. And then we'll go ahead and run it, again. And as you see now, it is pretty much printing exactly what I changed, again, welcome to Oracle, the source for the Java technologies. And that pretty much ends the practice one of lesson four. Thank you.

## 4. Practice 4-2: Creating and Compiling a Java Class - 6m

Let's go ahead now and get into practice four two, which is the second one of lesson four. In this case, what we're doing is we're creating and combining a Java class. And in this case, we create a new Java class in practice four project using the NetBeans wizard. Again, the high level steps for these tasks are shown in the table below just to show you again. You're creating a class called Shirt. And we give you snapshots of the wizard on how to do all of that.

And then of course, as you see after that, again, we call this class Shirt, which, by the way, belongs in this case to the Shirt and the location would be the source package. And then of course, I would click Finish. And then after that, we'll go ahead and create and when we click on the class we'll see the Shirt and the method and the different attributes on the left side. I'll show you that. And then after that, we'll go ahead and create another class in this case called the Java Main Class. And that would be, again, the ShirtTest, again. We say the Java Main Class because it will have a main method. That's the one that we'll use to test our class Shirt.

And then of course, that's called TestShirt. And of course in this case, we'll go ahead and in the Shirt Test we'll create an instance of the Shirt and then, of course, call the display method information on the reference variable of type shirt called myShirt. And then we'll see this output. And then of course, when we click on the file tab, we'll also see all the classes over there. Let's go ahead and pretty much do all of this on NetBeans.

So I already have it. But let me just show you how to actually create a new file. So you can go ahead in this case and create a new file. And then you'll go ahead in this case and click on Java. And then after that we'll click on Java Class and click Next, name the file, whatever, let me call it myShirt just as an example because I already created that. And then, of course, it's highly recommended that you do not place the Java classes in the source package. They want you, default package. they want you to create it's own package. But it's OK. It's just a warning. So I'm OK with that.

And then of course, in this case, you'll go ahead and click Finish. And it will create a class for you. It turn out that this class that we already created is this one here. And as you see here, this is pretty much the similar code that we've seen in the lesson. Class Shirt, it has a bunch of attributes, Shirt ID, description, color code, price, and quantity in stock. And by the way, we initialize them respectively with either a zero for integers, a String character like U for the character code, and 0.0 for a double, and a zero for the quantity in stock. And it has a display information method that, actually, in this case inside we have a bunch of printlns that allow us to print a Shirt ID and description, a color code, the price, and a quantity in stock.

They also asked us also, in addition, to create a new file. In this case, again, we click on Java. But this time we want to create the Java Main. Click Next and call it ShirtTest and then, of course, after that click Finish and it's created. But it's going to create this because we use the Main so it automatically is going to have a Main method in this case because we said we wanted a new Java Main Class. Of course, it turn out that I already have this created.

And as you see here, it's called a ShirtTest . And it has a Main method inside. We'll go ahead and declare a reference variable of type Shirt called myShirt. And then on line 16 we'll initialize it with a new instance of Shirt. We'll learn about that in lesson five. And then after that we'll call the display information. Of course, the display information is going to go ahead and call this method and prints in this case all the values of these different attributes or instance variables of this class.

And by the way, if you click on Shirt here, and you see that it has a display information. That would be the method. And it has also the different attributes that you actually declared in the class. Those are the members of the class. We can also look at the Test Shirt and you see it has a main method in this case. It does not have any instance variables in this case. And by the way, the fact that I saved all of this, it's already compiled, if we go to the File tab and then click on Open Practice and then click on Build and then click on Classes, you will see all the classes over there, Quotation.class and QuotationTest.class that we've seen earlier. And you have the Shirt.class and the ShirtTest, that, of course, we just looked at.

Now, the next step is going back to project. And now what we want to do is run the ShirtTest to test that. So let's go ahead and do that. We'll right click and click on Run File. And that, of course, is going to print us exactly the Shirt ID, which is zero, the description with description required, the color code U, the price 0.0, and the quantity in stock is zero. And where did we get this from here?

Again, what we did is we run this one here where we created a new instance of the myShirt reference by the variable myShirt, again, in this case and rather a reference variable called myShirt of type Shirt. And we initialized it with a new instance of Shirt. And then we called the display information method that, of course, in this case displayed the information related to the initial values of the attributes that we have in shirt.java. And that pretty much ends the second practice of lesson four. Thank you.

## 5. Practice 4-3: Exploring the Debugger - 11m

Let's go ahead now and take a look at practice four, the third practice, which is 4-3 where in this case we're exploring the debugger. So this is an interesting type of a practice. So virtually every Java ID provides a debugger. And of course, NetBeans also provides us with that. So what I'm trying to do here and, again, the purpose of this practice, ladies and gentlemen, is to pretty much show you how you work with the debugger of NetBeans, of the Oracle NetBeans IDE.

So you're going to set the breakpoints, examine field values, and modify them as you step through every line of the code. So in the first step here what they want us is set a break in the ShirtTest class. Click again in the left margin of the editor next to the, again, the line which is, in this case, myShirt equal a new shirt. Let's go ahead and do that. And again in this case, so that's what they want us to do. And I just did it. So now this is what you see.

Now, what they want us to do is-- let me go back and read-- run the debugger by right-clicking the ShirtTest file in the project windows and selecting the debug file. Let's go ahead and do that. And of course, click on, in this case, the bug file. And now you see that and now it is running. So we see that. So that's kind of similar to the snapshot they showed us here. So let me just scroll up a little bit to follow with the different commands of this particular practice.

So the next step is, again, the debugger starts the program and stops at the breakpoint, again, in this case. In the editor panel, again, in this case, you should now see a different icon, in this case, that points to the green arrow or to the line of code. Let's go ahead and see that. And that's exactly what we see this here so the green exactly. And then if I hover over it with my mouse, I see ProgramCounter at a breakpoint.

Continuing with that and now, of course, what happened is several other changes have occurred in the NetBeans IDE window. A new tabular, again, a new toolbar rather appears containing buttons that you see when debugging. Again, here's are the new ones that we see here, all of these here. And again, when you hover it with the mouse usually it says this finish debugger session or click shift five. This one here is the pause. This one here is the continue. This one here is the step over. This one here is the step over expression. This one here is step into. This one here is step out. And this one here is, of course, run to cursor. All right.

And of course, let's continue with, again, so here, again, we explain to you step by step. Again, move your cursor over every toolbar button to read, again, the toolbar tips explaining what each button does. Again, in this case, we describe every one of them. The first button finished the bugging session, stops the debugging session. Second one, the second button, again, pauses the execution of the debugger. Third, again, the third column continue the execution either to the next breakpoint or to the end of the program.

Four, again, the fourth button, step over, moves the program forward to the next line of the code in the current class. Again, in this class would be the ShirtTest. Again, the fifth button, step over expression, allows you to step over the entire expression to the next line of code in the current class. And then the third one would be the, again, the sixth button would be a step into that allows you to step into another class referenced in this current line of code. The next one, the seventh button would be step out allows you to step back out of the class that you stepped into. And then the last button would be run to a cursor, which, again, takes an execution to the line of the code where the cursor appears.

Oh, by the way, we also have the panel at the bottom of the window that changes, in this case, to show debugging output and variables and other useful information during a debug session. Again, in this case, in the variables panel you see all the variables that are visible to the current class. Remember, again, that the expression will stop before the Shirt class object has been instantiated. So consequently you do not see the myShirt variable in this panel. And then so pretty much this is exactly what you see here. And notice we have the button. That's exactly similar to what we've seen in the activity guide.

And now what they want us to do, ladies and gentlemen, is they want us now to go to step five where we say click the step over button to move to the next line of code. And by the way, we also give you the icon that looks, again, the picture of the icon. So we'll go ahead and do that. And that would be, again, in this case, it would be this one here, step over. Go ahead and do that.

And in this case, of course, just looking at in this case and you see the arrow now points to the line of code that calls the display information you see on the green over there a method on the myShirt object. Again the values in the values window, you now see the myShirt variable. Again, of course, expand it to see all the fields of the Shirt object. So as you see here and, of course, in this case, obviously, you will see that pretty much you will see all the variables, shirt ID, description, color code, price, and quantity in stock.

Now what they want us to do is to click the step into button to step into the display information. Let's go ahead and see the icon just so that, of course, when it's new to you, ladies and gentlemen, maybe you will not remember all these, of course, icons at the beginning. That's why we put a picture of it next to the command so that it would be easy for you, of course, to work on in this case. Let's go ahead and do that. And that would be, again, this one here. And if I hover over it, it says step into. Let's go ahead and do that. And now you see now I am actually in the display information method.

Continuing with that and now going to the next step, which is step eight, again in this case the arrow icon is pointing to the first executable line of the code within the display information method of the Shirt class. Again, in the variable window, expand this to see the fields. Let's go ahead and do that. And of course, you'll see now the fields that you see here. Let me just scroll this up a little bit so that we see everything. And continuing again with the lab so you see that pretty much shows us exactly what we have seen.

So in the Value column double-click every field value and edit it to change the value. Ensure that you use the correct value for the data type expected to enclose any character data types with the type of quote mark indicated. Again, after editing the final field, click the tab button so that the next, again, in this case, the text you typed into the editor buffer is accepted. So of course, in this case, let's go back to NetBeans. And then we can go ahead and, for example, click on the, in our case here, we'll go ahead and, of course, change that to, for example, 15.0. Click OK. And now you see now it is, of course, in this case the value is 15.0.

And then, of course, click the step out button to return to the next line of code in the ShirtTest class in this case. And then of course, the display method will, of course, in this case have completed. Now we look at the step out. So again this is the step out. And you see now it is all completed. And of course, again, we should notice that the Shirt object field variables reflect the changes you made. And click continue, again, in this case, a button to finish the execute it. And then of course, this is the continue and that pretty much stays. And as you see here I changed the value price. It was for 0.0. Now, of course, it's 15.0. And that's exactly what I see as an output as an example on NetBeans.

And that's pretty much summarizes and ends the third practice of lesson four. And as you see, ladies and gentlemen, we went step by step through this debugger, which is quite fancy of the Oracle NetBeans IDE. And I hope you'll enjoyed this practice and, of course, the rest of the practices of the different lessons of this course. Thank you.
