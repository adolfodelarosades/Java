# 13: Handling Errors

1. Handling Errors - 42m
2. Practice 13-1: Using a try/catch Block to Handle an Exception - 16m
3. Practice 13-2: Catching and Throwing a Custom Exception - 9m

## 1. Handling Errors - 42m

All right, folks. So after, of course, we've done with the practices of lesson 12, let's go ahead and get into lesson 13, which by the way is quite interesting. It actually talks about handling errors.

Now remember, folks, whenever you design object-oriented applications, in general you're given a problem in what we call, by the way, a vision document, and then of course you go through these system requirement specifications where you identify your services, which by the way later on will be converted into use cases.

And whenever we talk about use cases, again, at the beginning there are high-level use cases. You will get to actually learned this in the architecture and design of enterprise applications. And of course, after that, when you get those high-level use cases, you need to somehow refine these use cases. Typically we refine use cases using the concept of scenarios and activity diagrams.

Scenarios-- what do we mean by scenarios? Whenever we have a use case, we always think about what? The rosy way, when things work without any problem. And we also look about what? When things do not work the right way.

So that's why, whenever we say we're refining use cases, we're looking at when things work well and there's no problem. But then we need to also consider when things do not work well. When things do not work well, what we need to do is we need to fix the problem. And that, of course, is related to errors, related to exceptions in Java.

So let's go ahead and look now at, of course, what we're going to cover in this particular lesson. And this lesson describes the different kinds of errors that can occur, and how they are handled in Java. And of course, describe what exceptions are used for, in Java, determining what exceptions are thrown for any foundation class. And of course, write code to handle an exception thrown by the method on a foundation class, which is the API.

Let's go ahead and start by looking at handling errors. And we're just going to have an overview about that. And for that, again, typically sometimes you get a coding mistake. Again, in this case, of course, when you make a mistake in the coding, in general, in the output in the console, you've got an exception. For example, that says here, Java.lang.ArrayIndexOutOfBoundsException. Just by looking at this code, can anybody just tell me what happened here? Why did we get this exception?

Thank you. Again, thank you, [UNINTELLIGIBLE] Thank you. [UNINTELLIGIBLE] I agree with you. As we know, we know that the last element in the array is always the length minus 1. So that's why, in this case, of course, it is screaming at us and telling us that this is an error.

Continuing with that, and of course in general what we want to do is we want to, again, report exceptions. So here's, in this case, a very similar example, except that in this case, this time the code creates the array and tries to assign a value to a nonexistent element that, again, has been moved to a different class.

So here we create a new instance of a TestArray called myTestArray. We initialize it with a new instance of TestArray. And then, of course, in this case, we'll go ahead and invoke the addElement by passing the 5 and 23 to the myTestArray, in this case.

And here's the class where we have a TestArray, and it has an integer, and it has a constructor-- in this case, TestArray()-- that takes an integer and uses it to, in this case, initialize the integer array. And then we have the addElement() that of course takes the index and then, of course, in this case, a value, and tries to assign the value to the array at that particular index.

So again, we should notice how, in this case, the error message in the console is almost identical to the previous one. But this time, the method, main(), of the test exception, again, in this case, would be, in our case, in this main method that we have this code here. And then, of course, it would be in the addElement() method in the TestArray. Again, the [UNINTELLIGIBLE].

So you see something like this. Exception in the main, java.Lang.ArrayIndexOutOfBoundsException. About And then put the 5 at the TestArray.addElement() that we were, again, trying to do here. And of course at the TestException.main(). So here it talks about the main() method. That calls, of course, the method addElement(). OK? Everybody sees that?

So pretty much what we want to use in this case, or learn in this lesson-- we learn why that messages is printed to the console. Again, we also learn how we can catch or trap the message so that it is not printed to the console. Of course, and what other kinds of errors are reported by Java.

Now how exceptions are thrown. Normal program execution-- a caller method calls a worker method. A worker method does the work, and of course the worker method completes the work and execution returns to the caller method. That's how, typically, we know how actually Java works. And of course, when an exception appears, again, the sequence changes.

Again, the exception is thrown. Either a special exception object is passed in these cases to a special method like a catch block in the current method, or execution returns to the caller method.

In terms of the exceptions that exist in Java, the three main types of exceptions are the error-- the error is typically an unrecoverable external error, and it's unchecked. Again, there are checked and unchecked exceptions. So the unchecked is a system exception, and in this case, typically an error exception happens when of course you're out of memory, when it's really serious business of the system.

Then you have runtime exceptions. They're typically programming mistakes, but they're also unchecked. For example, if you want to divide by zero, that's of course a runtime exception.

And then we have the rest, which is an exception. Exceptions typically are recoverable errors. So in a sense, you need to write code so that you can recover from those exceptions. For example, I could be accessing a website, trying to buy something, and they run out of that item. So I get an exception, and of course, they'll give me, in this case, a message saying that you cannot get it right away but we can do a back-order and you'll get it in a couple of weeks.

So checked exceptions must be caught or thrown. You have to catch them and take care of them, or throw them to the caller. That's what it means. And by the way, the three main types of objects that can be thrown in this way, all are derived from the class Throwable. All the exceptions are derived from the class Throwable.

Now here's an example of OutOfMemoryError. So again, usually you can go ahead and write a program. Here we declare an ArrayList called theList, and we initialize with an ArrayList. And then we look at that. We use while(true), which means it's going to be forever.

We'll go ahead and do that, assign a string to the testString reference variable, and then add that string to the list. And then, again, in this case, we'll go ahead and make sure that the size is modulo 1 million-- if it's equal to 0, we'll go ahead and stop and then it will print the size.

And if you take a look here, you will see that at the beginning, the list now has 240 million. But at some point, in time, we are going to get an exception that says what? java.Lang.OutOfMemoryError. Because you're using an infinite loop and it keeps on going on and on and on. So at some point in time, of course, we run out of memory. And then in that case, we get an out of memory error.

And of course, we should not do something like this. But if out of curiosity, by the way, you want to check it on your system, you can go ahead and try that. And you will see that once you run out of memory, you will get a java.Lang.OutOfMemoryError.

And these are typically unchecked ones, and of course what's happening is it's going to exit your application and give you the whole stack of what happened.

OK. Everybody's following, folks?

So now let's go ahead and look at the propagation of exceptions. Because remember that exception method can call another method, which calls another method. And the idea is we can actually propagate the errors. So that is why, for those of you who are part of a QA team, this is usually what you do. You look at the stack of the errors.

And by the way, in general what we tell you as a good practice is that those stacks need to be seen only internally. So you don't want to, for example, throw that exception to the client. Because if the client sees all the stack and how it's all coded, they have an idea about how your application Is built, and they can actually hack into your application and it can do damage.

So that's why one of the best practices, in future courses when you learn some of the advanced courses, we actually tell you, be careful with that. You don't want to show that to the client.

In general what we do if there is an exception, we send a remote exception to the client saying, hey, the system is down here. We are very sorry. If you connect in one hour, we'll help you. We don't want to tell them what's the problem and give them the whole stack of errors. That's a bad idea.

Now looking at the method stack-- so again, in this case, to understand exceptions, we need to think about how methods call other methods, and how this can be nested. deeply. Of course, the normal mode of operation is that the caller method calls a worker method, which in turm calls another caller method. And of course it calls another worker method and so on. So that's the idea behind this.

And here is an example, where we have a method called doThat(), which calls doThis(), which calls the main() method. Or rather, in this case, the main() method in the test class calls the doThis(), which calls the doThat(). And then, of course, the doThat() returns something to the doThis(), and the doThis() returns something to the main() method. And the main() method, of course, gives you the output.

Imagine now that we have an exception. So for example, an exception can be thrown from the doThat(0 to the doThis(). It returns an exception. And then, of course, the doThis() can return that to the main() method. And by the way, if you do not handle it-- for example, if there was an exception to the doThis() and the doThis() does not handle the exception, it can say, OK, I'm not going to handle it. I'm going to just throw it back to the-- my caller in this case is the main(0 method.

And of course, in the main() method, you have to handle that exception. Because if you do not handle that exception, then the main() method will give it what? We'll give it to the system, and the system is going to say, oh, we've got a problem. We're going to go ahead and exit. We're going to stop the application. So in general, we need to somehow and handle the exception at some point in time, particularly a checked exception.

So again, we should know that as far as how methods call and return, and of course as far as how exceptions are thrown, the fact that there is one class method here and two instance methods on the same object is, of course, immaterial.

Now let's go ahead and continue with the call stack. And now we're going to see an example. So in this case, for example, we have a main() method. And within the main() asset, we create a new instance of the class Utils. And after that, we go ahead and invoke, on that reference variable, the doThis() method.

So the doThis() method now, as you see here, which is in the utility class in this case-- we'll go ahead and right some coding. And then now we'll call the doThat(), which is a method within the Utils class. Of course, by calling that, then of course we have the doThat(), and the doThat(), by the way, can throw what? It can throw an exception. So if this exception is thrown, it's going to go back to what? In this case, to the doThis().

And the doThis() can go ahead and handle that exception, or it can also do what? Throw it back to the main() method. Everybody's following?

So looking at throwing throwables. So when the method finishes executing, the normal flow in this case goes back to the calling method, and continues execution on the next line of the calling method. Again, when an exception is thrown, the program flow returns to the calling method, but not to the point just after the method call.

Instead, if there is a try/catch block, for example, it is thrown back to the catch block. And of course, that is associated with a try block. And that contains the method call. And if there is no try/catch block in the calling method, the exception is thrown back to its calling method.

So in the case of a checked exception, this happens because the programmer is forced to explicitly throw the exception to the-- in this case, if the programmer chose not to catch it. Of course, in the case of the exception that is a runtime exception or an error, the throwing of the exception happens automatically, whether or not the try/catch exist.

So what do we mean by that? When you have an unchecked exception, it actually can be thrown. It all depends. If you have that error, it's automatically thrown. It doesn't matter if you have a try/catch block or not.

OK. Everybody's following? OK, good.

So in this case, when I have a doThis() exception thrown to the doThat(), execution returns to the doThis(), but not via the normal return mechanism. The doThis() in this case must go ahead and cache the exception and handle it, or otherwise throw it back to the main() method. Right? Everybody's following? Let me know if you have any questions.

So again, continuing with that, this diagram shows us an exception originally thrown from the doThat(), being thrown to doThis(). And then the error is not caught in the doThis(). What's going to happen is now thrown to the caller method, which is the main() method. So you see how the exception is thrown from the doThat() to the doThis(). We see it here. And then the doThis() decides not to catch it. It will go ahead and throw it in the main() method. Of course, in this case, the main() method has to deal with it. Otherwise it goes where? To the system.

Now working with exceptions in NetBeans-- here you can see some of the code that the Utils class shows in NetBeans. And let me just go ahead and increase this a little bit. So just to show you pretty much how we can go ahead and show this. And of course, in the first screen here, we have the class Utils that had a doThis(). And then inside the class, we have a doThis() and a doThat().

And in the doThis() here-- let me just make this a little bit bigger. So in this case, there is no exception thrown. Again, nothing needs to be done in this case. But here, in this case, for example, the NetBeans uses a tooltip to give you a couple of options in this case. And it turns out that throwing an exception in our case here, within the method, requires a further step, which is throw an exception, in this case.

So of course, in our case here, in the first screenshot that we've seen, no exceptions are thrown [UNINTELLIGIBLE] So NetBeans shows no syntax or compilation errors. But in the second one, the doThat() throws an exception. So automatically NetBeans flags this as something that needs to be dealt with by the programmer. Of course, it gives you hints. And that's what we mean by that.

And as you can see from the tooltip in this case, it also gives you a couple of options that a programmer must choose, from either handing the exception or throwing it back. So this is just to show you how NetBeans or IDEs are smart enough. Again, in this case, it says, unreported exception java.Lang must be caught or declared. in this case to be thrown. Everybody sees that?

Catching an exception. So again, in this case, we see in this example here we have the doThat() that have been added. Adding "throws Exception" to the doThat() method signature ensures that it is thrown to the caller. In this case, doThat(). And of course, in this case, adding a try/catch block to the doThis(), so that, again, the try block contains the call to the doThat(). Of course, the catch would be set up with the parameter, Exception.

Let's go ahead and just blow this up a little bit, so that we can see what we're trying to discuss here. So you see now, here, I have the doThat() that throws an exception. Again, no exception needs to be dealt with in the doThis() in this case. Of course, the doThat() now throws an exception, and here within the try, it's a catch. That's where, in this case, we'll go ahead and catch that exception here. Everybody sees that?

So of course, in this case, we have to catch that exception. And then in this case, we're handling it by doing what? By printing that exception. Everybody sees that? OK.

[INAUDIBLE] exception [INAUDIBLE] print what [INAUDIBLE]?

Yeah. The question is by doing the println here that we see in this case--let me just make it bigger and bigger-- it's pretty much printing the message that you have in that exception. So most probably, there is a constructor that actually builds that. Or course, in general, these are part of the Java API.

Uncaught exception. What happens if none of the methods in the call stack have try/catch blocks? That situation is now illustrated by the diagram that we see here on this slide. In this case, because there is no try/catch blocks, the exception is thrown all the way up the call stack.

And again, what does it mean to throw an exception from the main() method. This causes the program to exit. And of course, the exception in this case, plus the stack trace for the exception, is printed onto the console. So if you're not, again, catching this exception and it goes all the way to the system, then in this case your application will exit. And then of course, in this case, you get a whole stack of exceptions that are printed to the console, saying that is the issue.

Everybody's following, folks? OK, good.

Now of course, in general, you see that exceptions can be printed to the console. And an example here, you can see what happens when an exception is thrown up to the call stack, all the way to the main() method. Again, in this case, obviously, you will see that the exception is written on the console. And here is an example just showing you how actually all of this is done.

So here I have the main method. It throws an exception, just as an example. And then of course you see how this is all thrown. So the main() is now set up to throw an exception. Because the main throws the exception, it now prints the whole stock into your console.

And by the way, when you are debugging your applications, your programs, a lot of times it might be worth looking at the stack, just to see what's going on. Everybody's following, folks?

So summary of exception types. Again, a throwable is a special type of job object. And of course it is the only object type that is used as the argument in a catch clause, the only object type that can be thrown to the calling method. And of course, it has two subclasses, the error which is automatically thrown to the calling method if created, and the exception that must be explicitly thrown to the calling method or caught using the try/catch block. And of course, it has a subclass, runtime exception, that is automatically thrown to the calling method.

And again, here, just out of curiosity, if you want to now look at the hierarchy of the exceptions. Let me just-- "exception in java se 7." So it should be-- or maybe let's do "throwable." And that gets us the whole thing. Again, I can also click on the runtime exception, by the way, which is an exception, and then you have the throwable, and then it goes all the way to-- and these are direct known subclasses of this.

And as you see here, it's serializable. It implements the interface, serializable. Remember, I mentioned that the serializable interface is a marker interface that the data is going to be serialized or the object is going to be serialized, but it has no methods to implement.

So as a quiz, which one of the following statements is true? A runtime exception must be caught. That's not true. A runtime exception must be thrown. That's not true. A runtime exception must be caught or thrown. That's not true. A runtime exception is thrown automatically. That it's true, because it's an unchecked exception.

Which of the following objects are checked exceptions? Again, as you see here, it's not A. It's not B. It is C. All objects of type exception that are not type of runtime exception, which is, by the way, what we call checked exceptions.

Everybody's following, folks?

Now looking at catching and throwing exceptions. So exceptions in the Java API documentation-- again, you can go ahead and look at them. And there are lots of them. And here we just show you just snapshots. And I just show you this so you can go ahead and click on-- in this case, go to the API, and pretty much you can find the I/O exception, security exception, runtime exception, and so forth.

So I showed you an exception, and the runtime exception we have all of this. And then the exception-- again, you have all these exception. So you can pick and choose.

And just out of curiosity, they were talking about-- let me just choose some of these exceptions so that we-- because all of these are pretty much exceptions. And we can pick and choose any one of them, just out of curiosity. I'm just trying to look at-- here's an SQL exception, for example. [INAUDIBLE] since we all deal with the database. So just as an example.

And of course, calling a method that throws an exception. So here's an example where we have a testCheckedException(). Again, in this case, we have a constructor that causes no complication problems. But then down here, in this case, it creates a new file and can throw a checked exception.

So it must here throw or catch an exception. So just to give you an idea about that. So this is pretty much a way to actually show us how a method can actually throw a checked exception. So it must, again, throw it or catch it, of course, in this case.

OK. Moving along-- so again, in this case, looking at continuing. So again, in this case, we tell you that in the second example, create can thrown an IO exception. And that's pretty much what we see here. Let's go ahead and magnify this. So we can see that. And of course, in this case, it says, "Unreported exception. The java.IO exception must be get caught or declared to be thrown."

Working with checked exceptions. So catching an IO exception, for example, here. I can have a main() method in this case, where I go ahead and within the try I call, testCheckedException(). Again, here's a method. This testCheckedException() throws what? It can actually throw an IO exception. Or here, what we do is we create a new instance of a file, in this case, referenced by the reference variable of type File called testFile.

You will, by the way, learn about these IO APIs in the advanced courses. The next course, the Java SE Programming course.

And in this case, we'll go ahead and on the testFile, we'll create a new file. And of course, in this case, we'll do a println. We'll print if the file exists.

So in the main() method here, we call this testCheckedException(), and because we call it here, we know that it throws an exception. That's why, within the catch, we can do what? We'll go ahead and catch that IO exception. OK. So again, in this example, it pretty much shows us how to handle a possible exception-- in this case, throwing the exception from the testCheckedException() method.

Again, we catch the exception in the caller method. So in this example, the catch method catches the exception, because the path to the text file is not correctly formatted, for example, and so forth.

So you see how now we can go ahead and catch the exception, of course. And we will go ahead and print that message. Everybody sees that? So for example, the message would be, java.IO exception, and then the file directory name or volume label, syntax is incorrect. That would be a message that would be printed. Everybody's following, folks?

Best practices. Well, here's what we tell you for best practices, ladies and gentlemen. We say, catch the actual exception thrown, not the Exception or Throwable superclass. Always catch the actual, specific exception. Don't try to catch a superclass of that exception.

Again, examine the exception to find out the exact problem, so that you can recovery cleanly. And you do not need to catch every exception. Again, a programming mistake should not be handled in this case. It must be fixed. And of course, ask yourself, does this exception represent behavior I want the program to recover from. That's typically the question that we have.

Which means don't start throwing any type of exception that you want. Just focus on the ones that are quite important to your application.

Bad practices. These are bad practices. This is a very good example. Again, the code that you see in this case illustrates two poor programming practices. The first one is the catch clause, in this case, catches an Exception rather than the expected exception from a calling create method-- rather than doing the IO exception. So we catch this Exception.

If you catch this Exception, again, this is the superclass, which does not give us the right information. We want the subclass that is specific. I would like to see that it's an IO exception, because I'm dealing with files. I'm trying to create a file. So when I catch Exception, an Exception could be anything. I just showed you here, an exception could be any one of these. That is a lot.

So we want to be specific in this case. We want to say, hey, I want an IO exception. That's what I'm looking for. And that's why in this case it is a good idea to actually make sure that you're throwing or catching the right exception, and not of course a superclass exception. OK? Everybody sees that?

And of course, the second one is the catch clause does not analyze the exception object, and instead simply assumes that the expected exception has been thrown from the file, and by the end, printing this again. "Problem creating the file." That's not important. That's not going to help me. No processing of the exception object. That's not helpful.

For those of you who actually have done C-- how many of you have programmed in the C language? Remember that famous error that we get from the C language, segmentation fault. Remember that? What does it mean? It could be anything. So we would like to be more specific, so that we know what is the problem, so that we can go ahead and fix it. Right? OK, good.

Again, here is another bad practice. In this case, again, we catch an exception that you see here. And of course, we go ahead and catch the exception. Again for create, what is the object type? And of course, in this case, the toString() is called for the object. And of course, in this case, we're not getting enough information.

So in our case here, putting a few System.out.println calls to the createFile() method may help clarify what is happening in this case. Again, the output is the file does not exist, or the text file exists-- is it false or true, and so forth. Or again you have the ArrayIndexOutOfBoundsException [UNINTELLIGIBLE] and so forth.

So if the file is being created and you can see that the exception is actually an ArrayIndexOutOfBoundsException that is being thrown by the final line of code in the createFile()-- again, in this example, it is obvious that the array assignment can throw an exception. But it may also not be so obvious.

So in this case, the createNewFile() method of File actually throws another exception, a security exception. So because it is an unchecked exception, it is thrown automatically. If you, again, check for the specific exception in the catch clause, you remove the danger of assuming what the problem is.

Everybody's following, folks?

So again, the bottom line to showing you all of this is we want to tell you folks, be specific. If you're targeting a particular exception, go ahead and use it. Don't start using these super exceptions, and don't start also not showing too much information. Because not showing too much information can actually be a problem.

In fact, we have some practices, or what we call [UNINTELLIGIBLE] that you learn in one of the advanced courses. And that's called the head in the sand. It's kind of like the ostrich. It's so big, and the head of the ostrich is so small, if they are trying to protect herself by hiding her head in the sand, that's not enough. That's the head in the sand.

And looking at multiple exceptions and errors. So again, here's an example. In our case here, in this example in this slide, it shows a method that could potentially throw three different exceptions. It uses the createTempFile() method that creates a temporary file. In this case, it shows that each call creates a new and different file, and also can be set up so that the temporary files created are deleted on exit.

The three different exceptions that we can catch here are the IOException-- again, in this case, the c:/notWriteable directory. It's a directory, but it's not writeable. So this causes createTempFile() to throw an IOException. Again, it's checked.

And then you have the IllegalArgument that you see. So this pretty much, again, tells us about the IOException here. And then the next one-- in this case, we have an IllegalArgument that you see here. And of course, in this case, the first argument passed to the createTempFile() should be three or more characters long. So in this case, if it is not, the method throws an IllegalArgumentException. And we see it here.

And then the third one here that you see-- again, this is an ArrayOutOfBoundsException. We've seen this earlier right? An ArrayIndexOutOfBoundsException. And as in the previous example, trying to access a non-existent index. Remember that the last element in the array is always the index length minus 1. So in this case, we ended up having this exception that is, again, called an ArrayIndexOutOfBoundsException.

So what it's trying to show you here in this example, that here we have a method called createFile(), and it has the potential to throw how many different type of exceptions? Three. The first one related to the IOException, the second one related to the IllegalArgumentException, and the third one related to the ArrayIndexOutOfBoundsException.

Right? Everybody's following, folks? Let me know if you have any questions, please.

Catching a IOException-- again, here's an example. In this example, it shows, again, the minimum exception handling. So here we have a main() method, createFile(), and we can go ahead and catch another exception. Again, we have here the createFile(). That throws an IOException.

And of course here we have a bunch of code, where first we create a new file. That's the test file. And this is the temp file. And of course, this in a printout. So pretty much here it shows us, in general, how for example when the directory set, which is shown here, I this one here-- again, the output of the slide, in this case, could be java.IOException, permission denied.

Again, in this case, however, is the file is set to writeable then in this case, the output is now "Exception in the thread main. IllegalArgumentException," and so forth. And then of course, you see all this stuff in the main method. So again, the argument to here causes an IllegalArgumentException to be thrown. And because it is a runtime exception, it gets shown all the way out to the console.

Following, folks? Good, good, good.

Catching IllegalArgumentException-- here's another example, where, again, in this example, it shows an additional catch clause added to the catch, to catch the potential IllegalArgumentException. So we see that. So we have a catch here. We can also add another catch here.

It turns out, by the way, that in the Java SE 7, we can actually avoid having too many catches. We can actually now have one catch, and then we can actually separate the exception inside, between parentheses, in the catch, using the pipe or the bar. So we see that in the advanced course. This is a very nice new feature. It's called the multicatch feature in the Java SE 7.

Here you see that we have this one and then this one. We can have as many as we want. That's how we did it in the SE 6 and before. Now we can actually have one exception, and inside we can catch more than one exception, all separated by the vertical bar, or the pipe.

Everybody's following, folks?

Catching remaining exceptions. Again, in this case, for example, I can go ahead and catch an IO and then after that, I can go ahead and catch an IllegalArgumentException. And then after that, I have an exception. If you take a look here, by the way, you got to be careful. The first exception that you want to catch-- you don't want to catch, in this case, the superclass Exception. Because otherwise it's going to hide all the detailed exceptions.

For example, here, the IOException inherits from Exception. So in this case, of course, we've got be careful with this. Of course, if we pass this first, then of course we'll not be able to see the IOException. Everybody sees that?

So how [INAUDIBLE]?

Well, it's pretty much the same thing. But again, when we get there-- the only thing, like I mentioned to you, for the 7 is that you can have only one catch instead of many catches, one after the other one. When we get into that advanced course, you will get to see it, and you'll get to actually learn about that. Good.

So in summary, folks, we looked at the kinds of exceptions. It turns out that we have what? We have errors of type Exception. The second one is what? Runtime exception. And the third one is exception. So errors and runtime-- they are unchecked exceptions. And of course the exception is a checked exception. Now remember that a runtime exception also inherits from exception. But it's an unchecked exception.

We looked at how exceptions are used in Java. We looked at the concept of throwing an exception or handling an exception. And of course we looked at code to handle an exception thrown by the method of a foundation class, like IOException for example.

And of course, we do have a bunch of practices for this lesson. Again, practice one would be using a try/catch block to handle exceptions. The second one, of course, catching and throwing a custom exception. Let's go ahead and look at these practices in detail.

Around so, practice one, again, we give you all the steps, [UNINTELLIGIBLE] using a try/catch block to handle exceptions. So go ahead and follow the steps to do that.

And the second practice and the last one is catching and throwing a custom exception. In fact, in this case, we make use of all the classes that we've seen in the practice of lesson 12. So you folks recognize Employee and EmployeeTest and all that. So in this case, you are going to have to a setSkill() method that in this case throws an exception. So we'll go ahead, and then of course work with that.

So you see it throws a user-defined exception which is called InvalidException. So you will be given that exception, by the way, which is this one here. InvalidSkilledException. And that's a user-defined exception. It's a checked exception. So this is, again, a very good practice. So please go ahead and try it.

So this would be the last practice for the course. So go ahead and try that, and of course enjoy this set of practices, which are very useful. And they of course help us illustrate what we just learned in lesson 13. Thank you.

## 2. Practice 13-1: Using a try/catch Block to Handle an Exception - 16m

After looking at the Lesson 13, where we discussed the handling the concept of errors, we looked at the TRY Catch concept, and so forth, and of course, the exceptions in general, and of course from the errors to the checked exceptions to unchecked exceptions, and so forth. Let's go ahead now and look at the practices of Lesson 30. And we start with the first one, when in this practice, we're going to use the Java API documentation to examine the simple date format class, and of course find the exceptions thrown by its parse method, of course.

And then, we create a class that calls the parse method, and of course, in this case, using the TRY Catch. That's the idea, again, what we're trying to do here. So in general, so this is pretty much what we're trying.

So in the practice, we're given the test dates. So of course, in this case, the test date is given to us. So this is it. That's given to us.

And of course, and that means we create a new project, in this case, called Practice 13. We said the source package, in this case, 2.2 the Lesson 13 in the labs. And of course, remember that to set the binary source format, like we've done earlier, in the previous practices.

Again, there are many flaws in this project. Only the data stays relevant to this practice. Again, we opened the API documentation, in this case, by using, in this case, the shortcut on the desktop. And of course, in this case, find the simple date format, and, in this case, class, in the Java.text package.

So we can go ahead and, of course, take a look at that. Or we can always, again, like I mentioned earlier, it is a nice idea to always look it up quite easily. And I can go ahead and this and say in Java se 7. And then, of course, this will get me straight over there, and then now I have it in front of me.

All right. So again, this allows us to pick a standard date format that will then be applied during both formatting and parsing. For instance, again, you format the String output of a date object, and you parse, or create, a date object based on a formatted String representation of the date. Again, the steps again that we see here pretty much allow us to examine the simple date format documentation.

Again, find a [? particular ?] parse method. So we'll go ahead and do that. So we'll click on methods. And then we go and look at the parse method. And of course, in this case, just continuing with that. So and we'll go ahead parse method.

As you see, this method takes two arguments. And here it is. And you see it here. Where is my parse method? And I just found it.

So it takes two. Again, I can go ahead and-- wait a minute. I'm going to click on the method itself. And here it is.

And so they're telling us that this parse method, again, in this case, that takes, like we said, two arguments in this case, like we said. And of course, looking at pretty much what does it do, so again, in our case here, we say that we invoke the parse method that belongs to that super class date format instead of the parse method that we see in this case. The super class method is private and, of course, is therefore available to the, again, in this case, simple data format.

And of course, in the specified by section, we'll click on the [? past click ?] and show, again, below to go to the, again, the date format documentation, and of course, find that. So here it is in this case. And I just showed you that, in this case, on this browser here.

And of course, if you take a look here, you would see that, again, in this case, we're talking about this parse here, the parse method that you're talking about here. And that would be, again, in this case, the parse method that we see down here. That's exactly what they're trying to get us to, in this case, again, in the Java doc in this case.

And now, displays similar two-argument parse method in the date format. Again we scroll up to the one-argument parse method, in this case, and of course, directly above this one. And we can go ahead and see it here. So we should not [UNINTELLIGIBLE] the parse method, accept the single-String argument, and return the date object. Well again, what, if any expression, again, does it throw in this case? Well, what exception does it throw? Let's go ahead and look at that.

So you'll see now, of course, again, by looking at this, pretty much, we're looking at, in this case, at the particular, again, in this case, by looking at the date, and then looking at the method, and looking at going back, of course. And again, in this case, just showing yes, pretty much-- let me go back-- and showing us, again, this parse method, and just following, again, the steps here that they want us to get at. And so again, in our case here, they're telling us that now when we go ahead and look at that two-argument parse method in the date format, if we scroll up, we can look, actually, the method of the one argument.

So we'll go ahead and scroll up a little bit. And here it is. This is the one, OK the parse method that takes only one argument. And then, of course, continuing this, we should, again, see how this parse method takes one String. And we see it here. Takes one String. And then the question that we have here, ladies and gentlemen, is what, if any, expression does it throw?

And if you take a look here, you will see that it actually throws a parse exception. You see that? It throws a parse exception.

So continuing again with that, so in the parse exception, in this case, which is a checked exception, and then we click on the parse exception link to see its hierarchies. Let's go ahead and do that. So we go ahead and click that, and we see, again, its class hierarchy, which pretty much inherits from exception, which inherits from [UNINTELLIGIBLE], which inherits from object. So that's exactly what we've seen here.

And of course, we click on the browser Back button twice, again, to-- in this case, you'll return to the simple format documentation. So again, we can do that. One, two. And we go back to, again, in this case, this simple date format that we see here.

Good. So again, we find the format method. Again, this format accepts three arguments, so we can always go back to that. And then we look now at the format method. And it takes three arguments. Here it is. This is the format method that takes a date, a string buffer, and a field, and a field position.

And of course, again, in this case, they want us to [? install. ?] Once again, there is a simpler version of this method defined in the date format class, then, that you can use in this practice. So click on the Format link under the specified-- in this case, by heading to the view of the date format documentation on this. Again, in this case, and of course, here's the date format. And this is the one that they want us to use.

So again, in this case, pretty much showing us that date format that we want to use in this case. So again, continuing with [UNINTELLIGIBLE], and looking at, again, just by scrolling down to find, again, the one-argument format method. So we can go ahead and find it, again, in this case, quite easily by just, in this case, looking at the methods, and then scrolling down again all the way until we find, of course, in this case-- or we can go back and then click on the methods here, and then looking at the format that takes this one. And that's the one that they're looking for, the one that, of course, in this case, takes one argument.

And then here it is. And we see it here. That takes an instance of the date and returns a String.

So now we've got an idea. And of course, the question is does this format method throw an exception. The answer, it does not. And we can see it quite easily here that it does not throw any exceptions, ladies and gentlemen. Good.

So continuing in that means we create a new Java class called Date Manipulator. And we [UNINTELLIGIBLE], again, field declarations indicated in the table here. So in that case will be the class called Date Manipulator. So we'll go ahead and look, in this case, and find that Date Manipulator. And here it is.

Let me go ahead and open this. And this is pretty much what they want us to create in this case, folks. So continuing with that, again, in this case, you can go ahead and use the table, or you go through the, again, the details, declare the field of type data using the variable my date. We can see that again on [UNINTELLIGIBLE] here. And here it is.

And then, of course, continuing with that, with the steps, declare a field of type simple date format. And again, going back, and here it is here. And continuing with that, they want us to, again, in this case-- which we call the simple DF. And if you take a look here, here it is, simple DF.

And then continuing with that, they want us to, in this case, initialize it with a new instance of simple date format and parse it with a String MM/dd/yyyy. And that's exactly what we see here. Going back to [UNINTELLIGIBLE] and exactly what we see here on the line 17. And of course, continuing that again, click their icon that appears again to fix that.

So obviously, this is for the import to make sure that we import the Java.util.Date. And it turn out, by the way, folks, that we already have this. And we imported this here. So that's good.

And then, of course, we should note that this method creates a date object instance by invoking the parse method. It formats the date object according to the default format of the single date format object, and of course, in the display, the resulting String, of course. It also displays the native date format of the object for comparison. In addition to this, the method handles the parse exception using the TRY Catch blocks. So again, in this case, you will see it.

And that means how, again, of course, continuing with, of course, with the-- so we have the parse date method. And we have the TRY here. And we have the Catch. And you see how we catch the parse exception here. And then, of course, we print that exception.

So let's go ahead and continue, again, in this case. And pretty much following the steps in the table that you see here. That's how you call your parse date method that I just showed you. And you can look at the high level in the table, or of course you can look at-- which is continuous here-- or we can go ahead and, of course, follow the different details here, step by step, showing you pretty much what it does.

So of course, step by step, we'll go ahead in this case and show that. And that means, in this case, we'll go ahead and create a String called formatted date string. And what we do is we'll initialize the MyDate by, again, in this case, invoking the parse method, and parse the date String to it on the simple DF reference variable of type simple date format. And then we'll go ahead and print the parse if successful, and then, after that, we'll go ahead and print the date with the native format and print that, my date.

And then, of course, down here, we'll go ahead and invoke the format method and parse the instance of my date [UNINTELLIGIBLE] format method is invoked on the reference variable called simple DF of type that we created earlier of type simple date format. And of course, this format will return String, and then we save it into the String that we declared here called formatted date string. And then, after that, we'll go ahead and print it out and catch an exception if there is an exception. That's pretty much what they're trying to tell us in this case, step by step through the steps A, B, C, D, E, F, G, of course, and H and I.

And of course, this, again, end up having this method that you see here. And I just showed you that. And that means save [UNINTELLIGIBLE] end and compile. And then open your test date's class. Again, examine. Substitute your own date between the quotation, again, and [? marks ?] in the parse display call again, use the format that you see over there. And of course, click Save and compile and run your application. In this case, run your file, which is date.test.

And of course, in this case, you will see that, for example, here, the parse is successful. And then, of course, if you enter [? Run D ?] again, in this case, the parse exchanger will be thrown if at this time, of course, in this case, if you now, again, change the argument to the parsed dates and just [UNINTELLIGIBLE] the parse method in the test, in the date class, and revert it to being just an empty String, and save and compile. And of course, you get an exception.

Let's go ahead and see that in, of course, in this case, and here it is. So of course, in this case, you can go ahead and parse. If you parse, for example, 08/22/2011, and then, of course, if you run now the date test, of course, this is going to compile, and it's going to say parse successful. And it's going to print all of that.

Let's go ahead now and put it back to an empty String. And now we'll go ahead and, of course, run it this time. And as you see here, ladies and gentlemen, it pretty much gives us that exception, which is the parse exception. As you see here, it says, impossible date. And of course, an empty String is impossible.

So again, in this case, again, you will-- as you see, we noticed that the parse successful message does not appear in this case. And in this particular case, it occurred in this line immediately following the parse method. Again, when the parse method throws the exception, the program, again, went immediately to the cache block. And of course, the remaining lines of this quote in the TRY block were not executed.

So that's pretty much, again, showing us how all of this works. And now, of course, the next step in this case, just showing us how, pretty much, in our case here, how we can see how working with, for example, in this case, the concept of TRY Catch, and how if something happens in the TRY block, then in that case, we'll see how the exception is caught, and of course, how whatever is caught, you'll-- automatically jumps to the caught statement, and how the rest of the statements within the TRY block are not executed. And that pretty much ends the practice, in our case here, the first practice off Lesson 13. Thank you.

## 3. Practice 13-2: Catching and Throwing a Custom Exception - 9m

OK, after we've done with the practice one of lesson 13, let's go ahead and look at practice two. And by the way, it would be the last practice for the lesson and also for this particular course. This practice, again, in this practice we're going to catch and throw a custom exception. Again, in this practice we use a custom exception called InvalidSkillException that we're going to create. We use this with the employee tracking implication that you designed and built in practice 12-1 and 12-2. Again, we throw this InvalidSkillException in one of the methods and catch it in the calling method. Again, a new set of Java source code files for the employee hierarchy are provided for your use in this practice.

Again in this case, we assume that we have all the classes from editor, Employee, EmployeeTest. And we're going to create a GraphicIllustrator again. We have it here over there, rather we already have it. We have the InvalidSkillExveption, Manager, rather a class and the Printable class, the Printer class , the SkilledEmployee class, and the TechnicalWriter class.

Again, the tasks here, folks, is that we assume that there's a list of valid skill types that can be associated with a particular job role in the employee tracking system. And of course, in the setSkill method of belonging to the SkilledEmployee class, again, some validation is required to determine whether the skill argument passed into the method is valid for employee's job title. Of course, if the skill is not valid, the method will throw an InvalidSkillException. The calling method in the EmployeeTest class must then catch an exception.

Again, we should note that in our example the validation in the setSkill method will be greatly simplified and does not represent the robust, again, thorough type of validation that would occur in the real world application. Again, in this case, our purpose here is to focus on catching and throwing exceptions.

And so we open the InvalidSkillException and examine the code. It Is very simple. The only, again, thing that makes this function an exception is that it extends an exception. Of course, we should see a public no-argument constructor and also a public constructor that accepts a String argument. And of course, that argument is the message that will be displayed when the exception object is printed. Of course, let's just go ahead and look at that. And of course, here it is. This is the name of the class. It extends exception. We have, again, this constructor here. And we have a second constructor that takes a String. And of course, it uses the super class constructor to, again, in this case, create or initialize the message in this case.

And continuing with again the practice, we now open the SkilledEmployee class and modify the setSkill throw method as described, again, in the steps below where, again, in this case, the solution of the setSkill method is shown, again, in following the steps of that. So we add the throw clause to the method declaration so that it throws an InvalidSkillException. We see that again in NetBeans when we look at that. And it's already here. So it throws an invalid. So we have the setSkill that throws an InvalidSkillException. That's exactly what they want us to do. As again, in the first line of code in the method, we declare a boolean valid, a variable called valid, and initialize it to throw when we see that in NetBeans. And pretty much this is it and as you see here.

And then continuing with that, folks, the next thing you use the if else construct to set the value of the valid variable to false if the skill argument is null or has a length of less than five characters. Otherwise, we set the valid again to throw. And of course, after that use another if else construct to test the value of the valid variable. Again, if it is true, add the skill to the skillList. If It is false, throw a new instance of the InvalidSkillException using the constructor that takes a String argument for the exception message. Again, the message should, again, show the skill argument that caused the exception and concatenate that to the string literal that indicates that this is an invalid value for an employee with the particular job.

Again, also display the employee's job title using the getJobTitle method invokes under this reference. And of course, this would look like the method that we see here. Save and compile. Again, we should open the Employee class test, in this case. And we should, again, now see the red error that, again, icon in the left margin of every line of the code that calls the setSkill method. Again, in this case, what we do is we click on one of the icon to read the error description and see the option it offers to help again solve this problem. So you see it here. And you can see it also on your activity guide.

Again, when you compile the SkilledEmployee, again, you, in this case, your SkilledEmployee class, you made NetBeans aware of the fact that the setSkills method throws an Invalid Exception. Of course, the compiler is now checking this again. Of course, we should remember that this is checked exception. And of course, it expects you to either catch it or throw it like we discussed it in the lesson so whenever again you invoke the setSkill method.

Of course, none of the suggestion option that will well in this particular situation. So we can go ahead so we add the try catch block in ourselves. And so again we get a surround every set of setSkill method invocation with the try catch block in the catch block and then, of course, display the exception again. You will have to add the try catch block for myEditor, myGI, myTW , and so forth, of course, which is a technical writer. Of course, an example you will see it here. Again, change the String argument in one of the setSkill calls to, again, shorten String less than five characters and try it and you will see an Invalid Exception thrown.

So let's go ahead and look now at NetBeans. So now for, of course, following the setSkill you see that, of course, an invalid was thrown a new instance of the InvalidSkillException and, of course, concatenated by, again, this information. And of course, in the employee test that's where now pretty much, again, in this case, we'll see that whenever we see the setSkill we're, again, in this case, catching an exception. And we want to make sure, by the way, the setSkill method takes a String that is bigger than five characters.

So you see now, again, just to show you how we can actually go ahead and make use of that. So we're just showing you here this as an example. And we see here how the setSkill here is technical illustration, video production, media authoring, and so forth. And of course, if we run this, obviously, in this case, and it works without any problem. But now let's assume that, again, in this case, we'll go ahead. And let's assume that we use something like this. And then we save it. And then of course, we go out and go ahead and run it. And you see that, again, we have now an Invalid Exception that is thrown. That's saying, of course, in this case that just because the size of the String is less than five characters.

And that's pretty much what we wanted again to cover in this case. And this pretty much ends the last practice of lesson three and, of course, the last practice for this particular course. I hope you enjoyed all the practices of this course, which are actually quite interesting and really, really useful. Because they do illustrate exactly what we learned in the lesson. I thank you so much, folks. And I look forward to seeing you again in another course at Oracle University. Thank you.
