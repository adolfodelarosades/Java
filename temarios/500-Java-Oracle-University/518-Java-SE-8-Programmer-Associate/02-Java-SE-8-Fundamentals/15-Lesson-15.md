# 15: Lesson 15: Handling Exceptions

1. Lesson 15: Handling Exceptions, Part 1 - 20m
2. Lesson 15: Handling Exceptions, Part 2 - 13m
3. Practices for Lesson 15 - 4m
4. Skill Check: Handling Exceptions - Score 80% or higher to pass

## 1. Lesson 15: Handling Exceptions, Part 1 - 20m

 
Lesson 15 is on handling exceptions. So the things we'll talk about in this lesson are describe how Java handles unexpected events in the program, list three types of throwable classes, and we'll talk about exceptions in general-- what causes them and what options you have available to you when things go wrong in your program.

The first topic we'll cover is handling exceptions. This is just going to be an overview.

So what are exceptions? Java handles unexpected situations using exceptions. Sometimes something unexpected happens in the program and Java doesn't know what to do about it. So, as a result, it creates an exception object containing useful information and then it throws the exception to the code that's invoking the problematic method.

And there are several different types of exceptions. What are they? Here are some examples.

We have ArrayIndexOutOfBoundsException, and this occurs when you attempt to access a nonexistent array element. So say you have an array of length 5 and you try to access element 100. Java's not going to let that happen because you're trying to get to something that doesn't exist.

We have ClassCastException, which occurs when you attempt to cast on an object to an illegal type. So say, for instance, you have your trousers class and you're trying to cast those as a hamburger. That doesn't make sense and Java won't let you do that either.

We have NullPointerException, which occurs when you attempt to use an object reference that has not been instantiated. An example of that is say you have a string and you never give it a value, and then you attempt to-- so, actually, I'll write this down for you.

String x. We're not going to give it any kind of value. And then we say x.length.

Well, there's nothing to actually get the length of, so as a result Java doesn't really know what to do here. This leads to a null pointer exception. You're asking for information about something that doesn't exist. You're pointing to information that's null or not there.

And finally, you can also create your own exceptions too, and the reason why you can do this is because an exception is just a class.

So to create your own exception-- this is something we'll talk about a bit later-- you write it like it's any other kind of class except you're extending the Exception class. Here's an example of an exception, and I talked about this a bit already. If you look at line 16, 17 here, we have an array and we give it a size of 5.

But we also attempt to assign the fifth element of value of 27. But if you remember the way array lists are organized is you have element 0, 1, 2, 3, 4. There's no fifth element.

Even though we have a size of 1, 2, 3, 4, 5 items, there's no fifth element because the first element is actually 0 so 5 would be way outside the bounds of the array. And this leads to the ArrayIndexOutOfBoundsException.

This is the output of your program. You'll also notice here java:17. 17 is referring to the line where things went wrong. It's giving you, the programmer, useful information so you can try and fix whatever is going on here on line 17.

Here's another example. The code right here is in the main method. We create a test array and we add an element in slot 5, give it a value of 23. All right, so we have to go and find the test array class, which is actually pictured right down here. Find the addElement method. That's here on line 18.

When we try to add an element here as something to index, index 5, well, there is no index 5. It has a size of 5, but the last element is actually going to be in index 4. So this isn't going to work. And as a result, here we have-- if you look at our stack trace, the output-- we're going to get some errors.

The first-- the bottom part right here-- actually, no. Yeah. The top part, duh.

Top part right here is giving us information on the TestArray method addElement. TestArray method, addElement. Here is where things went wrong. This is located in the TestArray class line 19.

The line below is saying-- it's going back even further saying what this method is calling, this problematic method. And that's located here, TestException, the main method, the TestException found in line 20. Yes. So this is line 20. This is where things go wrong if you take a step farther back.

Types of Throwable classes. Exceptions are subclasses of Throwable.

And there are three main types of Throwable. First we have Error which is typically an unrecoverable external error, and it's what's called unchecked, meaning there's nothing you can really do about it. So it would be, for instance, you run out of memory, your computer explodes. [AUDIO OUT]

We have RuntimeException. This is typically caused by a programming mistake and this is also unchecked. Although ideally as a programmer, this is something you should be checking, making sure that you're doing things OK.

Like, an example of this would be casting properly. If you tried to say I want my pants to be cast as a hamburger, that can't do that. That doesn't make any sense. So that causes an exception.

We have just a regular exception, and these are recoverable. And these are what's called checked, which means you have to add a little bit extra-- if you want to, what you can do is you add a little bit of extra syntax to either catch it or throw it. And I'll tell you more about what this means.

But an example of an exception would be say you're looking for a file. You need to read a file because that file has information you need to do your work. And you know where you think the location of the file should be, but if that file isn't actually there, then that's going to lead to problems.

So what you can do in your code is you could try and work around that, define what's going to happen in your code. If that file isn't there, what am I going to do? So that's what we mean by checked. You're actually checking to see is it there, is it not there. That's one example.

Here's another example of out of memory. What's going on here in the code is we have in line 2 a while loop.

And this is what we call an infinite loop, which means it's going to loop forever because it'll loop as long as the condition is true, and the condition that's true is just the Boolean true and that will always be true. So this is going to loop infinitely also because we have no break statement, by the way.

But, yeah, this loops infinitely. And what's going on here is we have an array the step above and we're looping through and adding items to the array list and we're not stopping adding items to the array list. Every million items then we're printing out the size of the elements in the array list. So this leads to the output, you know, 156 million elements, 157 million elements.

And if you keep going like this, you're eventually going to run out of memory and this leads to the exception being thrown right here. The output Exception in thread main java.lang out of memory Java heap space. So I'll talk a little bit more about how these exceptions propagate-- here's how things go awry.

Here's the normal flow of the program execution. You may start in your main method and the main method acts as like a caller to some sort of worker method. We'll say the worker method is doThis. So main will call doThis, doThis becomes the worker.

And then doThis-- maybe within that method, you have a call to yet another method which is doThat. All right, so once doThat wraps up, once it finishes doing its work, once it finishes executing all the lines of code, control goes back to the caller method. It goes back to doThis.

And then once all your work is done there, we go back to the main method. Maybe the main method calls some other things, but let's say it doesn't. Then you main method just ends.

You've reached the end of your program and, you know, congratulations. Everything worked as it should. Your program did the work you intended. That's great.

But we have an exception. That flow is disrupted. When an exception occurs, the sequence changes and an exception object is thrown. And either it's passed to a catch block in the current method or it's thrown back to the caller method.

All right, let's talk about catching and throwing. OK, working with exceptions in NetBeans.

So here you can see the code for the Utils class shown in NetBeans. In the first screenshot, no exception is thrown so NetBeans shows no syntax or compilation errors.

But in the second screenshot, shown here, doThat explicitly throws an exception. The text is actually-- yeah. There it is. Throws an exception and NetBeans flags this as some of it needs to be dealt with by the programmer.

As you can see from the tooltip-- this would be the tooltip right here, this yellow box. It gives the two options for handling the text exception. You could either catch it using a try/catch block or allow the method to be thrown to the calling method.

If you choose the latter option, you must declare in the method signature that it throws an exception. And that's something that would actually go right here. But I'll show you actual syntax on how to do that, not just using my arrow.

So here's the first option. Option one, the try/catch block. If you are writing code that you think is going to be problematic, that you think is going to be risky, you put that within what's called a try block.

So you write the keyword try, open curly brace, closing curly brace. And within those curly braces, within that block, you have all the risky code and anything that may cause a problem, anything that may cause an exception.

You can follow that with a catch block, and you want to specify the exception. And within that catch block, you're opening curly brace, closing curly brace, is the behavior that you want to occur when you catch an exception.

Say, for instance, you have a string and you want to get the length of the string. String x, and you want to say int-- or you want to store it as a variable so you can do math with it later. Int y equals x.length.

The problem is if we don't define what x is going to be, this leads to a null pointer exception because there's no actual text for x. It's is just some empty place in the heap memory. And so if we need to do any kind of math with that length, we can't do it.

So one thing that you may want to do in your catch block is to provide a length, provide a value for y. So if you need to set that to zero just so you can do a little bit of math, go ahead and do that there.

Alternatively, we have option two which is to throw an exception. There's a couple things you have to do here. First you have to declare that in the method signature that you're actually going to throw an exception. So you just add this little bit of syntax here. And I'll talk a little bit more about throwing exceptions.

So here we have a code example. This is going to be-- let's say this is our main method up here. It is our main method. It says so right there. Great.

Go to line one, create a new Utils. Go to line two, theUtils.doThis. OK, so now we're calling a method doThis for the Utils.

So where is doThis? It's somewhere in the Utils class. Here we have it right here.

All right, so then controller goes down here. So we go from that line to line 4. Line 5 we have our risky code, doThat.

All right, so now we have to go find the doThat method, which is somewhere down below in our class. Here is doThat. And it throws an exception. It's going to do something bad, whatever that may be.

So once the exception is thrown-- it's thrown by typing a keyword thrown and then new exception. And then once that's done, control goes back to the catch block. The control again goes back to the main method. And, as a result of this, the output is going to be essentially shown right here.

What's the order of the statements that are going to be printed? Well, since we're going-- before we print anything, we go into one method, we go into another method. And so the very first print statement we encounter is actually found right here per statement one in line 13, which is doThat in the doThat method.

Then once control gets given back to that caller method, doThis, this is the next print statement we encounter-- number two found on line 08. Yeah, and it's in doThis. And then finally, we don't get to line three of the main method until the very end. And that's where this first statement is coming from.

So the goal here is to show you-- well, for us a little bit of the syntax of what you need to do to be able to throw an exception. You just add in throw the exception and then you throw, keyword throw, and create a new exception. And two, the other thing to take away from this slide is an understanding of the flow of the program-- what gets executed, what gets printed when.

So what happens when an exception is thrown? I had mentioned earlier that if you have an exception, it messes around with the normal flow of the program.

So when an exception is thrown, the program flow returns to the calling method. In this case, it would be doThis. Flow returns to doThis but not at the point just after the method call.

Instead, if there's a try/catch block, the program flow goes to the catch block, not the try block, which kicked off control to the caller method, doThat. So we skip ahead a few lines.

But, as I'll show you in the next slide, what actually happens is if you don't have a try/catch block in doThis. This diagram illustrates an exception that was originally thrown in doThat. It's being thrown to doThis. And if the error is not called here, it gets thrown to the caller method, which in this case is the main method.

And the thing to remember is that the exception will continue to get thrown back up. It'll keep being thrown until it's caught. So you need to have a try/catch block somewhere.

If the exception isn't caught and it gets thrown all the way up to the main method, this is what's called an uncaught exception. And all this throwing up is pretty gross. If it's not caught in the main method, this causes the program to exit and the exception plus the stack trace of the exception is printed to the console.

And here's an example of that. When the exception is thrown up to the call stack without being caught, it eventually reaches the JVM, and the JVM will print the exception. It prints the exception's output to the console and then exits.

So one reason why it's important to try and catch these exceptions before they make it all the way to the main method is, do you want your program to end? Probably not. You probably want to have some sort of elegant way for handling exceptions so that your program doesn't stop executing, at least be able to do some work instead of stopping altogether.

So in summary for exceptions, a Throwable is a special type of Java object. It is the only object type that is used as an argument in a catch clause. It can be thrown to the calling method.

It has three subtypes. Error-- errors are automatically thrown to the calling method if created. Exception, which must be explicitly thrown to the calling method or caught using a try/catch block. And Runtime Exception, which is automatically thrown to the calling method.

Now is your chance to give practice 15-1 a try, catching an exception. This will be your chance to work with exceptions, handling for the first time.

## 2. Lesson 15: Handling Exceptions, Part 2 - 13m

Now that you've finished Practice 15-1, Creating an Exception, let's continue on the lesson. As you may be starting to suspect, there is a lot of different types of exceptions in Java. And when you're working with any API, it's necessary to determine what exceptions are thrown by the auditors, constructors, or methods. The example on this slide is of the File class. And you'll notice that there's a bunch of different exceptions that can be thrown.

The Files class could throw, as shown right here, an IOException, I/O meaning In and Out for information. Then we have SecurityException, which occurs if a Security Manager exists or the method is denied access to write a file. So these are more specific than Exception that we've been dealing with before. But the reason why they're useful is because they provide specific and helpful information to tell the programmer what exactly is going on, what could be done to fix the application or what could you work on.

In the first example the File object is created using the constructor. Note that even though the constructor can throw a NullPointerException if the constructor argument is null, you're not forced to catch the exception. However, in the second example, createNewFile can throw an IOException. And NetBeans shows that you must deal with this. This is NetBeans' little hint right here. Unfortunately, the hint is actually covering up a bit of text. So you'd want to have-- right here specify that you would want to throw and then specify the exception.

Oh, yeah. Here we go. So this is the bit of information that was missing from the previous slide. It was just covered up by the NetBeans hint. You just need to specify that the method is going to throw the IOException. The example in the slide is handling the possible raised exception by throwing the exception from the testCheckedException method and catching this in the caller method being shared right here.

So in this example, the catch method creates the exception because the path to the text file is not formatted correctly. So here we have two slashes. We should really have one. That's going to be the reason why it can't create the file.

System dot out dot print line e, right here, this calls the toString method of the exception and gives a more useful output. And the reason why you want to be more specific with your exceptions-- the downside of doing-- instead of doing IOException, if you were to just do Exception being the Exception superclass that IOException inherits from, this is a lot less specific and it's going to give you less useful information. So you want to try and stay away from this. You want to be as specific as possible with the exceptions and that's going to give you the most amount of useful information.

And this is considered a best practice. What you want to try and do is catch the actual exception being thrown, not the superclass type. And again, the reason why is if your program's just going to say, error, there's an error, something went wrong, that's not all that helpful. If you were to get instead more useful information, like this path is wrong or this directory doesn't exist or something more specific, that becomes a lot more helpful.

Another best practice, examine the exception to find out the exact problem so you can recover cleanly. And this is again why you want to give more information to yourself, because it helps you know how to recover.

And also, you don't need to catch every exception. A programming mistake should not be handled. It should be fixed by the programmer. And you also need to ask yourself, does this exception represent behavior I want the program to recover from? Does that need to be included in the design of your program? Sometimes yes, sometimes no. Depends on the situation.

Here's a bad practice. Here we have we're catching an exception, but it's the superclass, the generic exception. And we're giving an error message, error creating a file, shown right here.

There's a couple reasons why this is not very desirable. One is it could be that the information is just too generic when you use the superclass exception. Another reason why is this particular language is misleading, because we think something went wrong when we were creating file, so as a programmer that makes me think, is the path not right? Does the directory not exist? Is there something wrong with how I'm formatting my data when I'm writing to the file?

And that's actually not the case. What's really happening, though, is shown down here, lines 13 and 14. We have an array. We set its size to 5. And then we try to add something to the fifth element, to the fifth indice, the 27, which doesn't exist. 5 is going to be the last index in the array. 4 is going to be the last index in the array. 5 doesn't exist.

So instead, we actually have an array out of bounds exception. And what's actually being thrown is the IOException. This is-- it's no wonder this slide is called bad practice, because there's a lot of bad things and misleading things going on here. Try to be a lot cleaner with your code and be more specific.

Here's a somewhat better practice at least. You still have the exception caused by the array, so that's why it's somewhat better and not best. What is going on, though, is that you're at least printing out information to give yourself a chance of understanding what's going on. Print statements can be actually very helpful for debugging.

But here's why-- and this is actually somewhat better too. Instead of just giving a generic message saying, hey, there's a problem, we're actually printing out the error. This is actually calling toString on the Exception object, so it's giving you somewhat useful information on what's going on. But it's not-- it's better to be more specific.

Instead of doing the superclass exception, be specific. Say IOException. Say array out of bounds exception. It's somewhat better, because you're doing a few good things down here, but not really. No.

Let's continue on with the last topic, multiple exceptions, because I said be specific about what's going on. We saw that there were a couple bad things going on, but we're only catching one, so how do we go about catching many bad things that could occur? That's what this next topic is about.

In this example, we have multiple things that can go wrong. We have a potential IOException, which could be-- this could occur if the directory isn't writable. We have IllegalArgumentException, which may occur if say we need an argument that's three characters. This one's only two, so our program's not going to be able to work with that. That leads to IllegalArgumentException.

And finally we have ArrayIndexOutOfBoundsException, and for the exact same reason in the slide before. We have an array that's a size 5, so the last index is going to be 4, and we're trying to assign a value to the fifth index, which doesn't exist.

So we have three possible errors. How do we go about handling all three of them? Here's how you handle one of them, at least. We'll start with this and then we'll gradually improve our code. We have our try block right here, and we're trying some bad code.

We're catching one exception, catch IOException. And then we call the toString method on ioe. This is going to be the IOException. So this will print us information that's specific to that particular error and give us useful information.

OK. Let's continue on. What do we do if we want to catch two exceptions? Ah. We just add another catch block. OK. Here's a second exception we want to be able to handle, the IllegalArgumentException. And all we're doing here is we're printing out what's going on. This is our IllegalArgumentException object. We're calling the toString on it, which is going to give us information that's particular to this kind of exception.

All right. And so we have two out of the three. What do we do if we want to have a third exception? OK. We just add another catch block.

OK. So this actually isn't the array out of bounds. This one is the generic exception. All right. Here's why you'd want to do that.

Sometimes it becomes difficult to anticipate all the possible errors, all the possible things that can go wrong. And I do this too as a programmer. One thing that we do is at the very last catch, we just have an exception. And this is like your default. It's like your else.

If anything else goes wrong, if there's something I haven't anticipated, well, I'll at least do this and get somewhat useful information. And then maybe later on I can go back and improve my code. But this is kind of like the best you can do given the uncertainty that you have. It can be somewhat useful, so it is worth doing, absolutely.

So in summary, in this lesson, you should have learned how to describe the different kinds of errors that can occur and how they're handled in Java, describe what exceptions are used in Java, determine what exceptions are thrown for any foundation class, how to go about understanding what exceptions are thrown for classes found in the Java API. And this is going to be shown if you take a look at the Java documentation. And then finally, how to write code to handle an exception thrown by the method of a foundation class, anything in the Java API.

That brings us to the homework for this lesson, Practice 15-2, Overriding Interfaces. In this practice, you're asked to enhance the soccer league application to anticipate a scenario where there aren't enough players to fully field every team. You should create a custom exception to be able to do this.

When the exception occurs, it should be thrown all the way up to the main method. But again, it's up to you to figure out the implementation details. I'll show you the end result, though. I'll show you the output of what this program does.

So I have it here in NetBeans. I go to run it. All right. And now we have-- here's our error message, utility.PlayerDatabaseException. Not enough players in the database for teams requested. We've created our own error and it's giving us useful information, and that's great. That's all you need to do for this homework. So give this a try and good luck.

## 3. Practices for Lesson 15 - 4m

Practice 15-1 is catching an exception. If you've tried this on your own and you've gotten stuck or can't figure out the solution, this video will provide you with a walkthrough. The first thing we'll do is we'll open the project Practice_15-1. In the calculator class, we'll change the divide method signature so that it throws an arithmetic exception.

The reason why we're going to do this is because we're actually going to try, with division, so we have x divided by y. If y equals 0, then we're dividing by 0. And you can't do that in math. You can't divide by 0.

In the test class, we'll surround the code that calls the divide method with the try/catch block and then handle the exception object by printing it to the console and then finally, we'll run the test class to view the output. I have the project already open in NetBeans. so the first we need to do is make this method throw an arithmetic exception.

And that's easy enough. To make it a thorough arithmetic exception, we type in part of the method signature arrow arithmetic exception. So what happens if we go to run it now? Ah, so we know we have the arithmetic exception divide by zero. So that's right. We have to do a bit more work though and put this in a try/catch block.

Because since we're not doing that what's happening is we're throwing all the way up to the main method and then it just ends the program right there. So you have to make sure that the main method can handle it. All right. So do a try/catch block. And this is, by the way, the risky code that we want to have execute so this is what we're going to put in our try/catch block, on the try block, that is.

So try. Indent that a little bit. All right. And now it's going to complain, hey, you need a catch block. Yeah. Try without a catch, can't do that.

And within our catch block, we'll catch arithmetic exception. Oh right, and then have to have an actual object. Right. So our arithmetic assumption object is going to AE and then we'll just print it out. And we'll call toString on that.

It sends it out to print line. AE is our exception object. This is calling toString on it. This should work now.

Yeah. So, yeah. We tried divide by zero, won't let us do that, and the program is allowed to continue executing. So the way I can tell is there's nothing red. But also if I wanted to do something else, I say we've recovered from the error. And we've gotten past it.

We're ready to move on. Yeah, all right. So we're elegantly handling the error and we're just going to continue on with our program. Very nice. That was exceptional work. Let's get back to the lecture.

## 4. Skill Check: Handling Exceptions - Score 80% or higher to pass

Skill Check: Handling Exceptions

View Skill Check
