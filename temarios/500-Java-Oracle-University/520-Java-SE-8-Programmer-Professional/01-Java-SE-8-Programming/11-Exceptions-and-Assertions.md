# 11: Exceptions and Assertions

1. Exceptions and Assertions - 28m
2. Practice 11-1: Catching Exceptions - 13m
3. Practice 11-2: Extending Exception and Throwing Exception - 16m
4. Skill Check: Applying Exceptions and Assertions - Score 80% or higher to pass

## 1. Exceptions and Assertions - 28m

Excellent, excellent-- well, we have covered lambdas, at least for now. And we're going to shift gears a little bit in this chapter. What we want to do is we want to introduce you to exceptions, and then a little bit on assertions. And that's as it should be.

Now, weirdly enough, most development languages, most development classes, emphasize the syntax for the creation of code, but they don't ever talk about-- well, what happens when things go wrong? For example, if you've been working along with us, at some point or another, you've probably seen in your output window some nasty red, and it's telling you that you've had an exception. Well, that's what we're going to be talking about in this chapter.

Now, the first thing you need to know about exceptions is that every exception is extending the throwable class. Now, inside the throwable classs-- the throwable class is actually the super class for two different types of things. The first is an error. I've got it in red over here because usually if an error has occurred, it has absolutely nothing to do with you.

So if you get an error, it's because the system ran out of memory-- I mean, talking about the server, not JVM. So it's usually something that is completely outside the scope of anything you can do about. And I'll clue you in-- there is absolutely nothing you can do to handle it. So you get an error, your program's coming down.

Now on the other hand, exceptions are a completely different thing. So you will never, probably, see an error, unless of course your program is terminating. But you will see exceptions. The exception is the super class for everything else that we're going to be talking about. But exceptions come in two types. They're still exceptions, but we have unchecked exceptions, and we have checked exceptions.

Let's talk about the unchecked first. An unchecked exception usually comes because you've written something wrong. In other words, they are bugs. Now most of us euphemistically call bugs features, but no, this is where you've actually written something that is not correct, and is not functioning the way, logically, you thought you wanted it to.

And so, for example, if I were to divide two numbers together, and I hadn't checked to make sure that the denominator wasn't zero, I'm going to get a runtime exception because one of the exceptions that are subclasses of the runtime exception is an arithmetic exception. Which means that I divided by zero.

Well, ultimately what that's going to do is it's going to run me out of memory, and I'm going to have-- it's an exception, but there's really nothing that I can do about it. Unfortunately, if you've run out of memory in the JVM, there's no recovery. Your program is going to terminate. And so a runtime exception usually comes, or at least some form of runtime exception, usually becomes because of poorly written or badly written code. So the idea of an unchecked exception is you should fix it-- it has nothing to do with taking care of it.

On the other hand-- so what we really want to focus in as programmers, is we want to look at the checked exceptions. Now the checked exceptions are usually because a resource is unavailable. For example, maybe my hard drive crashes, or maybe the database I'm trying to access isn't available or is down at the moment. So something that I want to use or need to use in my program is not available, and so I'm likely to get an error.

Or, perhaps I wrote some SQL that was wrong. Well, in that case, it's not my program that's going to terminate, I'm just saying that whatever I was trying to do isn't going to work. So in this case, when we talk about a checked exception-- which might be an IOException that we'll talk about in a couple of chapters, or a SQL exception, which we'll talk about toward the end of the class, or any number of other sub exceptions-- these are things that we expect things to work.

But if they don't-- so for example, if I'm trying to access a file, and I need that file to continue running my program, well, if that file isn't there, obviously my program isn't going to go much further. That would create something called an IOException. It's a checked exception, because it is expected that since it's an external resource, that it may not be available. So I want to be able to check for it.

Now the reason why I talk about and make this big emphasis on checked is this green arrow here. Whenever you have a checked exception in your program, it is expected that you're going to either handle that exception, or declare it. In the slides we will talk ad infinitum about handling versus declaring, but basically, at this point, I just want to introduce you to if you're going to handle your checked exception, you're going to use one, two, or all three of these keywords. So we're going to look at the try, the catch, and the finally.

Now, we're also are going to introduce a new resource as of version 7, the try with resources, which is kind of cool. If we decide not to handle the checked resource locally where the exception occurs, then in that method, we're going to have to declare that an exception is going to be passed up to the calling method. Well, in that case, we're going to declare it by using the throws keyword.

The throws keyword comes after the method, after the arguments, and it just identifies the exception or exceptions that potentially could be passed from that method, because we have chosen not to handle it. On the other hand, there are times when perhaps I will catch the exception, but then I'm going to throw another exception. We'll talk about that, as well. In that case, the throw exists in the method, the throws keyword exists as part of the method declaration.

So that's the introduction to Chapter 11, Exceptions and Assertions. Now, an assertion is a different thing. Assertion is for testing-- testing of logic. And so if I put in an assertion, what's going to happen is I'm going to put a condition that I expect to be true. Now that condition may or may not be true, and if the condition is false, it's going to give me an assertion exception.

Well, the good news is that assertions are only turned on if you tell it to be turned on-- which means that most programs never, ever run with assertions enabled. So they never actually see the assertions. And so it's not something that you probably will use a lot, but there are three reasons why you might use an assertion, and we'll talk about that in the slides as well.

So let's look at them. OK, so we've talked about the objectives, and for the most part, we've talked mostly about all of everything that is here. So with that, like I said, applications sometimes encounter errors while executing. And reliable applications should handle those errors as gracefully as possible. If your program does not need to terminate, especially for checked errors, then you should be handling them, or at least identifying them correctly.

So it should be an exception if an error occurs, and it should not be expected. Remember almost a couple of decades ago now, some programming languages would use basically errors to indicate that something was negative, and was actually a part of the code. That is very poor practice, and it is not something that you should use in Java.

Now, to create reliable applications, errors must be handled. Some, like I said, are the result of application bugs. So the runtime exceptions, for example, are usually because you've miswritten something. But others can be because of factors beyond your control.

But as a developer, even though the exception is beyond your control, there's no reason why you should not be checking to find out-- did that actually occur? And it gives you a couple of options there.

So like I said, if I have a checked exception, then the compiler is going to require me to either handle the exception, or declare the exception. And so handling an exception means that you must add in a code block to handle the error-- we'll talk about that. And declaring an exception means that you declare that a method may fail to execute successfully, so that the caller of that method is aware that that may happen.

So let's talk about handling first. Handling is usually done inside of a try-catch statement. The idea here is that after the try keyword, I'm going to have a block. And this is my executable code-- this is the code I expect to work. And so we're going to do whatever it is.

So in this case, it looks like we're going to work with a file input stream, we're going to point to a particular file. And if the name of the file is any indication, that file may not be there. And so in that case, the instantiation of this input stream is not going to work.

Well, if that's the case, then it's going to produce an IOException. Well what happens in that case is if an exception occurs anywhere inside of the try block, it immediately jumps to the catch block. As we will see, there's any number of catches that I can put here-- it's kind of like a switch. And you want the most specific exception first, and then to the most general exception last.

Well in this case, since we only have a single catch, the most general exception is the one we're going to do. Now I'm not saying that this is the best way to handle an exception-- just printing out something went wrong-- but it does handle the exception. So in this case, the IOException will not be propagated up to the main method and terminate our program. So the catch only runs if something goes wrong. If it works perfectly, it gets to the end of the try block, jumps out, and continues executing.

Like I said, an exception object is the subclass of a class known as throwable-- which is the parent class for all kinds of different things. And we've looked at this particular hierarchy already. If you go out to the API documentation under exceptions, there are dozens and dozens of exceptions. These are only some of the major ones. So these give you an idea, if you will.

And in fact, notice that the IOException, among the exceptions that are subclasses of an IOException, is a FileNotFoundException. To handle an exception, like I said, you can have any number of catch blocks. But only the one catch block that is most specific to the exception executes-- which is, again, why order is important, because you want the most specific type before the more general type. So FileNotFoundException, of course, is a subclass of IOException.

And so in the case where if I can't find this file, that would be a FileNotFoundException. If, however, I couldn't read the file, in that case that would be an IOException. And so you can separate out and determine what, specifically, it is that went wrong, which means that you could log it, and hopefully do something about it.

The try-catch can have a third clause, and I mentioned it earlier, which is the finally clause. The finally clause up until version 7 was problematic in some cases, because-- well, let me explain what it is first.

The finally clause always executes. So whether your try block executes successfully, or whether there's an exception and you have the catch blocks that executes, the finally block is going to execute after either one of those. And so usually, the finally block was put in there to close any resources that had been opened, just to make sure that everything is consistent and good.

The problem is is that if I'm closing things that may or may not have opened, well, here I've got another problem, because if I try to close something that isn't open then that gives me an exception. And so usually in the finally block, we would have nested try blocks inside of there to take care of it. And so to get around that in version 7, and to make coding more streamlined, they created a product called the try-with-resources statement.

Again, same syntax as before-- notice that we still have our try, we still have our catch. But now, before we get to the try block, in parentheses we can indicate any number of objects that we want to instantiate. So if I want multiple ones, I can separate them by semicolons. So in this case, I'm going instantiate my file input stream. If it works, no big deal, it will then print out file open, we'll attempt to read it.

If not, then it will go ahead, jump to the catch automatically, and away we go. But again, if the input stream was created, it will automatically close at the end of the try block, or at the end of the catch automatically. Now the reason for that is the only resources that can go into this parentheses is a class that extends the autocloseable interface.

The autocloseable interface requires a single method called close. So in this case, the input stream does implement that interface, and so we could put it in there.

Another thing that has changed in version 7 of Java is that in the past, I would have to have a separate catch block for each and every exception that I wanted to catch. In version 7, they did make it possible that I could use an oar, or a vertical bar, to identify multiple, possible exceptions. And in that way, I only have to write the code to handle it once-- at least if I want to handle them similarly. So that's handling.

All right, let's talk about declaring. So I said that, OK, if I do you handle it, I don't have to declare it in the method because, well, that's the whole point of handling it. Well, what if I don't handle it? So notice here, I do have might try block, and I even I have my try-with-resources going on. But what happens if this fails?

Well it obviously won't be handled here, because there is no catch block. And so what that indicates is that I have to indicate in the method that this method could potentially throw an IOException of some type. So that's known as declaring-- I'm not handling it locally, I'm just passing it up the chain so that something else can handle it.

So for instance, if I go ahead and call the readByteFromFile method that we just looked at, that we declared, if I just put this line in alone, the development environment is going to say, hey, wait a minute-- read byte from error could potentially pass an IOException. Don't you want to nest this in a block? And so, in this case, I would of course handle that exception in this try block.

Now sometimes the exceptions that I get, well, they're not really well named, and they're not really user friendly. And so sometimes it might be helpful for me to catch an exception, but then throw one that's a little bit more useful. So for instance, in this case if I say that this read file method is going to throw a FileNotFoundException, well, notice that here I'm basically saying, well, if not found, I want to throw this FileNotFoundException, passing the error message, "Missing File." That way, if this file is necessary for this program to run, we can notify in the logs, we can notify what's going on, we can fix it.

So that's kind of the idea. So notice the difference though-- in the method it's throws, plural. And within the method, it's throw, singular, to actually do the throwing.

Beyond the use of exceptions that exist in the system-- the JVM has a number of exceptions that you will become familiar with-- it is also possible for you to create your own custom exceptions. Why would you want to do this? Well, sometimes code that you have in your applications may be perfectly acceptable to the compiler, but from a business logic standpoint, they don't make any sense. And so in that case, we might pass our own custom exception.

So for instance, here I have a invalid password exception. It extends the exception class, as we would expect, and the cool thing is is that there are four constructors that you can pass to every exception. You can pass it without a message, or you could pass it like we did in the previous slide, we can pass an error message in.

If, however, we want to wrap another exception, and then pass a more user-friendly error message, if you will, we could always pass that message here. In which case we throw the cause, and we can pass the message to exception. So creating custom exceptions is very straightforward and simple to do in our programs.

Now, like I said, an assertion allows me to document and verify assumptions and internal logic of a single method. The point is-- and we'll take a look at every one of these invariants-- but the idea is that if I enable assertions, it's going to check each assertion clause. The assertion clause will be followed by a Boolean, which, if true, nothing happens, it just goes on. So in that case, I'm going to identify my assumption. And if it's true, then everything's good.

However, if the assertion is false, it will raise an assertion exception, and away we go. Because assertions have to be enabled, you do not want them to have side effects, you don't want them to do any processing in your code, because in that case if they're not enabled, then that doesn't get done. So you definitely don't want to do that.

So here's how you would do it. There's two ways you can assert-- you can either follow would be it with a Boolean assertion, and while it will give you an assertion error, it does not pass an error message. So if you would like an error message as part of the assertion, you would follow the Boolean expression with a colon, followed by the message you want to pass to the assertion error.

For example, an internal invariant would be a situation where let's assume as a developer I wrote some code, and my assumption is that, in this case, x should never be negative. If I wrote the code, that's probably a decent assumption. But what if I want to make sure?

So notice that in this case, I can see, well, if x is greater than zero, I can check to see if x is equal to zero. But notice that in this case, I'm saying, assert x greater than zero. That doesn't make a lot of sense, because I've already checked if x is greater than zero. I'm thinking that they meant here that x is less than zero, because in the main method, we're going to call this method, passing a negative number. So I'm assuming that this should have been less than. And in that case, this word violate that assumption, or assertion, and it would give me an assert error.

So in that case, my assumption is that x should always be greater than or equal to zero, I'm assuming. In this case, this would be false. And so-- actually this was written correctly, then. Because this is the condition I expect. If I find that the condition is not true, it's going to give me the assert exception.

Other ways that I might use an assert are in situations where, let's say that I'm passing this as a string, or perhaps as a constant. Well, the problem with constants or strings in switch is that yes, you might get what you expect, but you might get something that you don't.

And so, in this case, if I pass in something other than clubs, diamonds, hearts, or spades, it's going to be known as an unknown playing card. So in this case, I'm actually checking to determine, as far as I'm concerned, the default should never execute. I'm just making sure that that is true. Of course, the way we could get around this is making sure this is an enum, and then we don't have that problem.

Another possibility is that if I'm going to check someone's age-- let's say I'm assuming that the age of this person is going to be greater than or equal to 18, and less than 150. For most, that would be a pretty easy assertion. But if the person has an age outside of those ranges, again, the assert would give me an error.

So in each one of these cases, I'm checking assumptions that I've made as part of my program. Like I said, in order to turn on assertions, you have to use the Enable Assertions flag as part of the command line. So you can either use the enable assertions flag, or the dash ea. And if you do, then any assertions, if they are violated, will execute.

So basically, in chapter 11 we talked about exceptions, we talked about errors, we talked about handling verses declaring, resources, we talked about the try-with-resources statement that is relatively new, we talked about different exception classes and categories, and we also talked about assertions. So now it's time for you to do the lab for practice 11.

## 2. Practice 11-1: Catching Exceptions - 13m

In practice 11-1, we are going to catch some exceptions. So the first thing they want us to do is create a new project. Haven't done that for a while. So we're going to click on Next, and we're going to call our project CatchingExceptions11-01. What a catchy name.

And then we're going to put it-- yep, that looks like that's in the right place, or is it? No, that's not the right place. Let's put it in the right place. So we'll put it under Exceptions. And we're going to also create a main class that we are going to call something other than this. So let's see. com.example.ExceptionMain. Perfect.

So now we have us a main class, and what are we going to do with it? So we're going to add the following line to the main method. Fair enough. So Reading from a file colon space is %in. And then we're going to pass in args[0].

So where does arg[0] come from? Well, yes, that is exactly right. It's coming from the string array that we pass in, which means that we're assuming that there will be something passed in. Well, right now we don't have anything passed in. So if I go ahead and run the project, you can assume that there will be an exception.

Of course, it might be nice if it would actually run. There we go. So we have an exception on line six in the main method, ArrayIndexOutOfBoundsException. Now, this is the exception that we're going to get any time we try to access a collection or an array and what we are asking for that element does not exist. So in this case, we have no array args because we didn't pass any information in, so at this point, of course, it's going to give us that exception.

So what can we do to fix that? Well, it says that we're going surround this with a try block. So we surround it with our try block, and we're also going to do a catch. And we're going to catch us an ArrayIndexOutOfBoundsException that I'm going to call e. Now, what do I want to do if that happens?

So apparently we are going to say "No file specified, quitting. And we're going to go ahead and exit. And our status in this case is going to be 1, which means we're going to just stop. So if we run the project here, of course, we still haven't provided, so we get our "No file specified, quitting and our Java result is 1, because that's what we passed.

So what if we added a command line argument to the project by right clicking on the project? So basically they want us to pass an argument in. So to do that, we'd go to the Properties for the project. We'd go to the Run Node, and here's where our arguments can be.

And apparently in this case, we are going pass in the root directory home/oracle/labs/resources/DeclarationofIndpendence.txt, and if I spelled that correctly, we're going to do really well. So if I click on OK, we go ahead and run this. Notice that it identifies, hey, we're running. So that does also indicate that it found the file and is not going to catch the problem there.

So running the program is not the same as running the file. Now notice that, if I run the file here-- run the file-- apparently it doesn't want me to run the file. Anyway, if I tried to run the file, it would give me an exception because the file doesn't have access to that command line argument that we just did.

So basically it says to add the following lines of code to the main method below your previously added stuff. So in this case, we are going to create a BufferedReader, and we're going to call our BufferedReader b. And in this case, we want to access that file.

Now, the way we're going to do this, since we haven't really talked about IO yet, is we're going to create something called a instance of a FileReader. And once again, we still need to tell it where to get the file. We're going to, in this case, pass in arg[0] to identify that we want to do that. So why doesn't it like this? File not found. Must be caught or declared. So at this point, obviously we don't have that passed in, so it's not necessarily going to see that, at least yet.

We're also going to create a string, s, and we're going to read from the BufferedReader a line at a time. That's one of the advantages of a BufferedReader-- is it will read a line until the carriage return. So as long as it does an equal null, we're going to run the code. And in this case, just read whatever is in the string.

So what's wrong with this one? Incompatible types. Boolean cannot convert to string. There we go. So we want to do the readline, and then we wanted to see if that readline is not equal to null. Still not quite sure what this is. Must be caught or declared. I got you.

So at this point, apparently we're not going to do that yet, but as it says in the next slide, we're going to run the fix import wizard by right clicking the right source code window. So we have a FileReader, specifically a BufferedReader. Passing it in. At this point, I'm going to assume that it's still working, but because we are trying to do this readline, it doesn't like that. So notice that I can say to surround the statement with a try catch, but in our case, we're going to use a try with resources.

So rather than this, we-- let's see-- run the fix. You should now see compilers in some of the lines. We do. And so we're going to modify the project properties to support the try with resources statement.

And in this case-- so we want to go to the Project Properties. We want to make sure that our source binary format is JDK 8, which it is, and so it does support the try with resources. And so what we want to do is-- up here we're going to try our try, and we're going to put this inside of that. We're going add an additional level. And you can see most of that has gone away, except for it doesn't like this because I've got it the wrong class. There we go. That's a little better.

And what else do we have going on? We're going to put in a catch in the appropriate place. So if I go with a FileNotFoundException, I can say-- well, let's say file not found. So "File not found colon". So if the file isn't found, it's going to put that out, and once again, I'm going to go ahead and do an exit, passing a 1.

Now, I also want to catch a more general exception, the IOException, which we'll also call e. And in this case, we're going to identify that the error reading the file. And so we'll pull the message out, and again, we will terminate gracefully.

So at this point, it looks like we have no more exceptions, because now we've identified that, hey, this is an auto closeable resource that is now inside of a try. And we're also reading inside of a try, so that, if there's a problem, it will catch it. So if we run the project, it should read from the Declaration of Independence, which it does. And it kept working until it got to the end. And so this successfully completes activity 11-1.

## 3. Practice 11-2: Extending Exception and Throwing Exception - 16m

In practice 11-2, we want to extend the exception class and we want to modify some of our classes to use it. So the first thing is, of course, we're going to open up our project and expand the project directories, and we're going to create a new invalid operation exception class. And we're going to put it in the com.example package. So we've done this before. So we will call it invalid operation exception. Sounds fair.

And so here's our new class. And in this case, we want it to, as we said, extends exception. And in this case, if we want to insert some code-- in this case, some constructors-- there are a number of different ways that we can create this, and they're indicating that we should be taking the first four. So yes, yes, yes, yes, yes. So we'll go ahead and create those.

And so in this case, looks like our no argument is going to call super, and in this case, super is going to pass the message, the message and the cause, and the cause itself. All right. So far that's good. Now, now that we have this exception, we are then going to also change the employee empl task.

And in essence, what we want to do is we want to change each of these methods so that we are declaring that something could potentially go wrong. So we're going to declare that an invalid operation exception may be produced during execution of the Add method. So we can do that. But we're also apparently going to be putting something inside of this code.

So according to this, I use an if statement to validate that an existing employee will not be overwritten by the add. If one would generate an invalid operation exception deliver it to the caller of the method. The invalid operation exception should contain a message string indicating what went wrong and why.

So in that case, well, this is obviously an if, so we're going to check the employee array, and get the ID, but you have to actually have the proper ent to do that. So we'll get the employee ID, and we're going to first of all see if that is not equal to null, because that would indicate that it already exists. So if so, we're going to throw a new invalid operation exception, and we're going to pass to it a message.

All right. So that should be new, so what am I missing? All right. So it's either expecting a close parentheses or a end parentheses, so what am I missing? I've got that. I've got that. I've got that. So that should be right. Invalid operation. Throw new. That's appropriate.

All right. So apparently it's not lining up the way I expect it to. That's because this is here. I get it. That's what's missing. All right. So with that, it's always fun to have just a small typo. But now our if is good, and so we're good so far. Now, it also says to use a try catch block to catch the array index out of bounds exception unchecked exception that could possibly be generated. All right.

So it is possible that I'm asking to put this somewhere where it doesn't belong. And so in this case, employee array, get the ID, and we're going to, of course, set this equal to emp. And if that is not correct, we have an array index out of bounds exception, which I can do something with.

We're supposed to do the same thing. Throw new. And apparently, we're going to pass another message specifically error adding employee. ID must be less than, and we want to see what it should be less than, so employeeArray.length. There we go. Yup. Not what I meant.

All right. So in this case, we have caught our if it's out of bounds, but we do have to identify what the problem is. All right. So at this point, we have set it up so that if it works, we will set it. If it's no, we will throw an invalid operation exception, and if it is out of bounds, we can do that as well. Now, the next step is that we are supposed to do similar things to the Delete method.

So first of all, we're going to identify that the method itself can throw an invalid operation exception, and then we want to use an if statement to validate that an existing employee is being deleted. If one would not be, we're going to generate an exception. So it should be very similar to the one we had before.

So check that it's there, add if it is not there. Then we want to throw an exception. And again, we'll put in a message so error deleting employee, no such employee. And we'll just pass the ID.

So that's good, but we also want to make sure that we're not trying to delete something that is outside of it, so again, we're going to create a try block to make sure that we can delete it based on ID equals null. But once again, if it's an index out of bounds exception, we also want to throw a new invalid exception, throwing a string, and so that looks very similar to what we've already seen.

All right. So that gives us our Add and Delete. That also says that we want to change our Find By. So we're going to declare that it also will throw this potential exception, which also means we're going to use a try catch block to catch the array index out of bound exception, and that's it. So all right. So this is pretty straightforward.

So we are going to put a try block around the return, and then catch the exception if one happens. In this case, it looks like it's pretty much the same, but error finding. All right. So that way if we can't find it, we are going to notify, and that brings us down to anything else. Apparently, we also want to handle in the employee test, we want to handle any of these.

All right. So at this point, we now have a valid employee empl, and so let's go to the employee test. Now, notice that in this case, that the Add method is now changed slightly. So we're going to add the throws statement from the main method. That doesn't happen a lot, but all right, that works. So that means we don't have to handle it.

And so what do we have? We have an Add. So if we wanted to check this out. So if we run it now, we've got employee zero, one, and five. So if I tried to delete employee seven, that should give me an invalid exception. No such employee seven. So that makes sense.

If we wanted to add another one, so let's say we wanted to add employee zero again. And so at this point, we have a error on line 19, which is what we would expect. Let's try that one. There we go. So employee already exists. And then finally, if we also tried to do a Find By, and we wanted to find, let's say, three.

It doesn't find it. Then we say to do something if it didn't find it. Index out of bounds. So in that case, invalid operation error finding employee 10. So any one of these, the Delete, the Add, or the Find By, if they are outside of the appropriate bounds, they do get the appropriate invalid operation exception, which is what we we're going for. And that completes practice 11-2.

## 4. Skill Check: Applying Exceptions and Assertions - Score 80% or higher to pass

Skill Check: Applying Exceptions and Assertions

View Skill Check
