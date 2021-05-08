# 9: Exceptions and Assertions

1. Exceptions and Assertions, Part 1 - 13m
2. Exceptions and Assertions, Part 2 - 26m
3. Exceptions and Assertions, Part 3 - 13m
4. Practice 9-1: Catching Exceptions - 10m
5. Practice 9-2: Extending Exception - 12m

## 1. Exceptions and Assertions, Part 1 - 13m

OK folks, so after looking at the practice labs of lesson eight, let's go ahead now and get into lesson nine, which, by the way, covers exceptions and assertions, which are quite interesting.

So in this particular lesson, we are going to define the purpose of Java exceptions. When I use the try and throw statements. When I look at the concept of using catch multi-catch and finally clauses.

We're going to look at these autoclose resources with try-with-resources statements, which, by the way, is new in Java SE7. We're going to look at the recognizing common exception classes and categories.

We're going to look at creating custom exceptions and auto-closeable resources. And, of course, test invariants by using assertions.

How many of you have heard or used assertions before? Assertions were introduced in Java SE5.

So continuing with our lecture and, of course, talking about error handling. Well, as you know folks, applications will encounter errors while executing. And, of course, reliable applications should be able to handle errors as gracefully as possible.

And, of course, in our case, errors should be the exception and not the expected behavior. And, of course, they must be handled to create reliable applications. And, by the way, errors can occur as a result of application bugs.

They can also occur because of factors beyond the control of the application, which are what we call, runtime exceptions, like database becoming unreachable due to some network or whatever, hard drive failing and so forth.

And, of course, when a method you are writing in Java fails to executed successfully, we typically consider the exception generating and handing features available in the language, instead of using a bunch of return values like we've done before in a C language.

Now looking at exception handling in Java. When using Java libraries that rely on external resources, of course the compiler will require you to handle or declare these exceptions that might occur.

Again, handling an exception means that you must add in some code block to handle that particular error. And, of course, declaring an exception means you declare that a method may fail to execute successfully and thrown an exception.

Well, in general, many libraries that you will require knowledge of exception handing include, for example file I/O, or the NIO, or the java.nio database access using Java SQL, and so forth.

And usually handing an exception means you are using the concept of try-catch statement to transfer control to an exception handling block when an exception happens.

And declaring an exception, what it means, it means you are going to add a throws clause to a method declaration indicating that the method may fail to execute in this particular way, of course.

To state it another way, handling means, it's not your problem. And, of course, it would be thrown to the next level, which is the next level of the method or the calling method that needs to handle that.

Using the concept of the try-catch statement. Well, the try-catch statement is used to handle exceptions. So when an exception occurs inside of a try block, of course, the execution will automatically transfer to the try-catch block.

And any lines inside the try block that appear after the exception are automatically skipped and will not be executed. And the catch clause is used to either to try the operation or try an alternate operation or gracefully exit and return

Avoid having an empty catch block. I should handle the exception. Here's an example that we have here, where we have, within the try block, as you see here, which I just highlighted. We've got a printIn statement at the beginning.

And then we create a new instance of the file input stream by passing the name of the file to the constructor of the file input stream. And then, after that, we have another statement which prints the string file open.

And within the catch block, we catch an exception. If an exception is thrown, then add the file exactly at this file input stream, then automatically this statement that you see here, where it prints the file open, will be skipped.

And here in the catch, you catch an exception. And here, we're putting some information that prints like, something went wrong, or whatever you want to print over there. So this line runs only if something went wrong in the try block.

Looking at exception objects. Well, a catch clause is passed in reference to the java.lang.Exception Object. The java.lang.Thowable class is the pattern class for exception, and it outlines several methods that you may want to use.

In fact, let's just take a look at that. And for that we're going to look at throwable in Java SE7. Oops.

So looking at throwable in Java SE 7, you will see that here are the list of the methods they are discussing. So we got addSuppressed, fillInStackTrace, getClause, getLocalizedMessage, getMessage, and getSuppressed and so forth.

So we have an example where you have some try, and then in here you catch an exception. So in our case here, we'll go ahead and print, invoke the getMessage. And we know the getMessage is inherited from throwable and returns the detailed message string of this throwable.

And in here, we can go ahead and invoke the printStackTrace. And we can always go back and see what the printStackTrace means. Prints this throwable and it's set back traced to the standard error stream.

So when things go wrong in your application, you will often want to record what happened. And typically developers have a choice of it using a bunch of libraries that exist. For example, how many of you have heard of Log4J, which is widely used.

In middleware applications, some of the middleware applications use the Log4J help you collect all that information into files. And then after that you can open a file and you can go ahead and see what type of information is there.

It helps a lot, for example, for troubleshooting or having information of what's happening behind the scenes in your applications. A good example is the server.log that we have in WebLogic or GlassFish and so forth.

And there are different groups of exceptions. The java.lang.Throwable class forms the basis of your hierarchy of exception classes. Again, there are two main categories of exceptions.

We have what we call the checked exceptions, which, by the way, must be handled or declared by the user. And we have the unchecked exceptions, which are not typically handled or declared.

So here in the hierarchy, we have throwable and from it, we can have error or exception. And from exception, you have a runtime exception, which, by the way, are unchecked exceptions. And you could have also checked exceptions, like SQL exception, I/O exception, file not found exception, and so forth.

So just so that we can understand a little bit the concept of this checked and unchecked exceptions, in general, we say that the unchecked exceptions, they are the java.lang.RuntimeException or the java.lang.Error. And their classes are categorized as unchecked exceptions.

These types of exceptions they should not normally occur during the execution of your application. So hopefully, you application should not throw these exceptions.

And, by the way, you can use the try-catch statement to help you discover what they are all about. But in general, we don't again throw them, or we don't catch them, sot they're automatically caught by the system.

And the error sub-classes represent errors that are beyond your ability to correct such a problem. For example, it could be a JVM running out of memory, could be, and so forth.

So the common runtime exception that you may have, two terms should include the ArrayIndexOutOfBoundsException, which means accessing an array element that does not exist. Or the NullPointerException, which is using a reference that does not point to an object. Or ArithmeticException, which is dividing by 0.

And here's a quiz. And in this quiz, we have a question that says, a NullPointerException must be a caught by using a try-catch statement. What do you think?

False.

False, that's B. Thank you. Here's another quiz. Which of the following types are all checked exceptions instanceof? So what do you think?

[INAUDIBLE]

So we have B, which is throwable, and D, which is exception. Good.

## 2. Exceptions and Assertions, Part 2 - 26m

Let's look at handling exceptions. Well, like we said folks, handling exceptions are part of what we call checked exceptions. So you should always catch the most specific type of exceptions. And of course, multiple catch blocks can be associated with a single try.

Here we have an example where we have the try in the try block. We print a string. And then we create an input stream, using the file, missingfile.txt, that is passed to file constructor file input stream. Then we print a string here. And then here we are reading data from the input stream. And we close the input stream.

Here we have an some catch statements. First, we can catch a FileNotFoundException. And here we can catch an IOException. So we want to tell you folks that order is important.

You must catch the most specific exception first, which is the child class before the parent class. Why? Why is it that we want to catch the more specific exception first, if you want to catch that, before catching the parent class?

The parent will tap through everything, and you won't know what the others are.

Thank you. Thank you, Mike. The answer is that the parent will hide the exceptions of all the children. It was going to hide that. So that's why it is a good idea to always catch the more specific exception first, before getting to the next high level exception.

So here we have the FileNotFoundException, and we have the IOException. And in general, we whenever we use the try-catch and especially if we are opening or using some resources, it is a good idea to actually release those resources.

We always handle that in the finally clause. So the finally clause is also very interesting. And it is a good idea to sometimes use it. Here is a complete, if you want an example, where we first declare an input stream here and then here, within the try block, we'll go ahead and print a message about to open a file.

And then initialize this input stream reference variable here, with a new instance of FileInputStream and passing the name of the file over there. And then, after that we'll go ahead and putt in another message, print another message that says file open. And then we'll go ahead and read the data from input stream.

And we can catch an IOException, and then we can handle it here by printing that message. We also have here a finally block. And this finally block or clause runs regardless of whether or not an exception was generated.

And the bottom line here, you always want to close the resource. And we do it here within the try-catch. Again, we can add the try-catch within the finally, if we have a problem closing, for example, a resource.

We're trying to close the resource at input stream, and it has a problem, we can always catch an exception and handle it here, failing to close the file and so forth.

So, in general the finally block will execute all the time. In fact, it will execute no matter what happened, if you have an exception or it's successful. The only time where the finally clause will not execute is when you have some kind of a system problem, when the whole JVM shuts down. Then it will not run.

But other than that, finally clause runs a regardless of whether or not an exception was generated. Everybody's following? So remember this finally folks, because later on, in few slides, we are going to look at the new feature that is now introduced in Java SE 7, and that avoids writing this finally. You don't need to do it. It's actually done for you automatically. And we see that in few slides.

In fact, this would be the next slide. It's called the try-with-resources statement. This is a very, very interesting feature, which introduced in the Java SE7. So this SE 7 provides a new try-with-resources statement that autoclose your resources.

So the try-with-resources statements can eliminate the need of the lengthy finally block. Resources opened with the try-with-resources statements are always closed. And any class that implements the java.lang.AutoClosable close can actually be used as a resource.

So if the resource would be autoclose, it's reference must be declared withing try statement parentheses. And we see it here, where we have within the try block, we see what's inside this red rectangle. It's a creating an instance of the input stream.

And then, after that we'll go ahead and read data. And if you take a look here, there is no finally where there's a catch statement or catch close is case we have a FileNotFoundException or and IOException. But we don't see the finally anymore. Why? Because this case is all done for you automatically.

Multiple resources can be opened if they are separated by semicolon. If you open multiple resources they will be closed in the opposite order in which they were opened.

Looking at the suppressed exceptions. Well, if an exception occurs in the try block with a try-with-resources statement, then an exception occurs while closing the resources, the resulting exceptions will be suppressed.

So the question, can we now get that? You can actually read that information by invoking the getMessage. So here's an example where I catch an exception.

I go ahead and print the getException. I can run and use the advanced for loop, where for every instance of throwable, I go ahead and iterate through, when I invoke getSuppresed method will return ordered list of messages.

Let's go ahead and take a look at that. And you will see that here the getSuppressed returns an array containing all the exceptions that were suppressed. And they typically by try-with-resources statements in order to deliver these exceptions. So you will go ahead and return all the exceptions that were suppressed.

That's why, in this example here, we said that you can go ahead and read those exceptions, once we get the suppressed, which is the array containing all of the exceptions that were suppressed.

So if you use an advanced for loop, you can go ahead and get the array of these suppressed exceptions. And print them out by just first getting the throwable, and then invoking the getMessage on them, and that prints all of them. Right?

Continue with that, and let's look at the AutoCloseable interface. Well, the Java API documentation typically says, about the AutoCloseable which is typically used in this part of Java SE 7, may throw an exception.

And we should note that unlike the close method of the closeable, this close method is not required to be independent. So, in other words, calling this close method more than once may have some visible side effects on your application.

And unlike Closeable.close, which is required to have a no effect if called more than once. However, what we could do is we can have implementers of this interface to make there close methods independent.

And by the way, we have java.io.Closeable. And this is refactored in the JDK7 to extend AutoCloseable. And again, it may throw an IOException. Here's the interface AutoCloseable. And it has the close method that can throw an exception.

Something new folks in the Java SE 7. And it's catching multiple exceptions. If you take a look at the previous example. And let me just go back just a few slides. Here it is. You see how, before, in Java SE 6, when we catch more than an exception, we have more than what? Catch block, right?

It turned out that in Java SE 7, we enhance that. Now, Java SE 7 provide this nice mechanism by which you can catch more than what we call a multi-catch clause. We have a multi-catch clause that can catch more than one exception within in one catch block.

Let's look at this example where we have a try block. And we try, in the try block, to create a new instance of the input stream. Then, after that, we'll pass that input stream to the constructor ObjectInputStream to get an object input stream.

And then we use that ObjectInputStream to read an object, cast it into an object of shopping cart, and use it to initialize the shopping cart that we declared earlier.

And here, what we could do folks is we can go ahead and catch what? Catch a ClassNotFoundException or and IOException and so forth.

So multi exception types are separated by what? The vertical bar. That's again fairly new in Java SE 7. So now you can go ahead and catch more than one exception. And they all will be located in the same catch block separated by this vertical bar or sometimes called the pipe character too.

And this is a very interesting something that we did not have in the previous Java SE versions, like as SE 6, and SE 5, and so forth.

Declaring an exception. What does declaring an exception mean? Well, you may declare that a method throws an exception instead of handling it. That's what it means.

So when you use the throws clause, a method may declare that it throws one or more exceptions during the execution. If an exception is originated while executing the method, the method will stop executing and the exception will be thrown to the caller.

By the way, overridden methods may declare the same exception, or fewer exceptions, or more specific exceptions. But not additional or more generic exceptions. So when you override the method, it needs throw a more specific exception, and not a more generic type of exception.

So for example, if you throw an IOException method in the super class, then, if you override the method that inside the sub-class to override the method, is should not throw exception. Because we said in the parent class it throws an IOException, because exception is a parent to the IOException.

Maybe you can throw a file not found exception, that's again a descendant of the I/O exception. Everybody understand that?

Continuing with that, now looking at handing declared exception. Well, the exceptions that methods may throw must still be handled. Declaring an exception just makes it someone else's job to handle or someone else's problem.

So for example here, within try, we have readByteFromFile. Which we already know here, the readByteFromFile throws an IOException. So we can go ahead now in this, and handle it. So we go ahead and catch that exception and print the message related to that exception.

Now remember one thing folks, and I want to mention this, that adding throws or throws clause to a method, just delays the handling of that exception. In fact, an exception can be thrown repeatedly up the call stack.

And the standard Java SE application must handle any exceptions before they are thrown out of the main method. Otherwise, what's going to happen, you are going to risk having your program terminate abnormally, simply because it reached all the way to the main method, then you know after the main method, it's system, right?

Oh by the way, it is possible to declare that the main method throws an exception, and in general we have tendency to avoid to do that, because obviously, if you throw an exception, it's going straight to the system. Because, after all, the JVM starts running your program from the main method.

Throwing exceptions. Well, in Java SE 7, you actually can rethrow an exception. Let's go ahead an look at that. So you could rethrow an exception that has already been caught. And we should note that there is both a throws clause and a throw statement.

So here's an example where we have a readByteFromFile that throws an IOException. In the try block we create a new instance of the input stream, pass the name of that file to that constructor. And then we'll go ahead and print a message. And then we'll read the data, returning the data, which is an integer.

And then we can catch an IOException, read it, and then we can throw that exception. So what we want to tell you folks, and this is important, pay attention to this. And let me just focus on it here in the second half of the slide.

Java SE 7 supports rethrowing the precise exception type. So here's an example that would not compile with Java SE 6, because the catch clause that receives an exception, but the method throws an IOException.

So here's an example, readByteFromFile throws an IOException. And then here we have the try block that will go ahead and create a new input stream. And then, after that, print the message and read the data, returning the integer.

And then here, we can actually catch an exception. And then, after that, we'll throw that exception. So if you take a look here, this actually can be done without any problem in the SE 7. In the SE 6, you cannot actually handle that.

So what is the [INAUDIBLE]

In our case here, look at this one here, throws an IOException. I could catch an exception, and I can still rethrow it again, to a higher level. In What we're saying here, we're half handling, if you want. We go ahead and get the print the stack, but then we throw it to calling a method to deal with it. Whatever we want to do with it. Yes?

What would you do to change that to work with 6? Would you throw in an exception?

There is actually an update. If you check the latest. Again, the question what do you too actually to make it uses with 6. I think the latest update of the 6 supports that. Is it update 20, 24, something like that? I think.

[INAUDIBLE]

Now, let's look at the custom exceptions. These are user defined exceptions. Well, you can create custom exception classes by extending the exception or one of its sub-classes.

Here's an example where we wanted to create our own exception. And that is called what? A DAOException. That's a good example, because we have already seen the DAO pattern. And we've seen DAO examples before, in the previous lessons. So this would fit very nicely.

In fact, by the way, later on when you do the practice lab for this, you will also get to play with this exception. You'll get to create this exception.

So we have a class called DAOException that extends exception. Again, as you see here, it has a constructor DAOException that pretty much calls the super. Which means what? It calls the constructor of exception. Thank you.

And of course, you can also have another-- this is, the default constructor that you want to write-- and this another constructor that takes the string, which is the message, and pass that to the constructor of the super.

So custom exception classes may override methods or add new functionality. Against the rules of inheritance are the same, even though the parent class type is an exception. And because exceptions capture information about a problem that has occurred, you may need to actually add fields and methods, depending on the type of information that needs to be captured.

Of course, if a string can capture all of the necessary information, then you can go ahead and use the getMessage method that all exception classes inherit from the throwable. Of course, an exception constructor that receives a string with start it to be returned by the getMessage.

And we have a small quiz here. That says which key word would you use to add a clause to a method stating that the method might produce an exception?

C.

C, thank you. C. Good job.

Let's go ahead and look at wrapper exception. Well, lots of times we want a hide the type of exception. To hide the type of exception being generated without simply swallowing the exception, we use a wrapper exception.

And for that, let's see the example. So we have a DAOException that extends exception. And we have the constructor that takes a throwable, which is the cause, and pass it to the super.

Or we have another constructor also, we are overloading constructors, where it takes a message and throwable cause, and use it to call the super or the constructor of the super class.

The throwable class contains that method called a getClause method that can be used to retrieve the wrapper exception. So for example, you wrap it up in the exception, whatever cause it is. And then you can invoke getClause method and that is used to retrieve a wrapper exception.

For example, you can go ahead and say, in here, we wrap the exception in the DAO, so I'll catch a DAOException. And then what I do is I invoke getClause, and I'll go ahead and get what? The throwable.

Let's go ahead and revisit the DAO pattern that we've seen in the previous lessons. Well, the DAO pattern uses abstraction, and we should interface, to allow implementation substitution. Of course a file or a database DAO must deal with exceptions. We have to make it deal with exceptions.

So a DAO implementation may use a wrapper exception to preserve the abstraction and avoid swallowing the exceptions. And we show you here a very nice example to actually handle that.

So we have an employee, find by ID. That throws a DAOException. And then within the try block, we go ahead and return the employee, which is located at the index ID in the employee array.

And we'll go ahead and catch an ArrayOutOfBoundsException. And then throw a new instance of DAOException by passing a text or a message and the exception that we're having. So what we did, we wrapped our exception into what? A DAOException.

So a file based DAO must deal with IOExceptions and a JDBC based DAO must deal with the SQL exceptions. So if these types of exceptions were thrown by a DAO, any clients would be tied to the implementation instead of an abstraction.

So by modifying the DAO interface and the implementing classes to throw a wrapper exception, which is the DAOException, you can now preserve the abstraction and let the client know when a DAO implementation encounters a problem.

So in a sense, we do not want to tell the client, hey, look at the details. I've got and SQL exception. All what we want the client to know is we've got a DAO exception. And that's wrapped. And we don't have to again show the.

So we're abstracting even the exception. The exception, also, we can actually wrap it up. And we don't have to show lots of details. In fact, in enterprise applications-- and I know after you finish with this Java SE course, you want to get into the Enterprise Edition, where you're going to get into the Java EE technology.

And you will find out that we have one best practice and one advice that we always tell our clients. That whenever you're dealing with errors never, never again show the stack trace of errors to your client.

By showing that, that's a breach of security. Then following the stack, they have an idea how your application is built. And if they have an idea about how your application is built, then they can get into it. So it is one of the advices, of many, many advices that we tell you, when you are building enterprise applications using the Java EE technology.

## 3. Exceptions and Assertions, Part 3 - 13m

Let's look now at assertions. Well, assertions are also quite interesting, ladies and gentlemen. Assertions are used to document and verify the assumptions and internal logic of a single method. So assertions they do not focus on exceptions because we have exceptions that handle the errors and the exceptions. What we are interested by here is by checking our logic when we are building our business logic, so our assumptions, if you want.

And again, these we verify the assumptions and internal logic of a single method where it could be an invariant, an internal invariant, could be a control flow invariant, could be a postcondition in a class invariant and so forth.

And by the way, looking at inappropriate uses of assertions assertions, by the way, can be disabled at run time. In fact, they are disabled by default. OK? So do not use assertions to check the parameters of a public method. That's a bad idea. Instead use what? Exceptions.

And do not use methods that can cause side effects in the assertion check when you know any method that causes it, because when you are-- you use assertions only when you are what? Developing and testing.

Once it's all clean, and now you passed everything, the staging, if you want, level of the staging is passed, and then, of course, without any errors, then now you go to the production level. In the production level assertions should be disabled. OK?

So like we said, you can use assertions to add code to your application to ensure that the application is executing as expected, pretty much as. And we use it typically to in this case debug-- what debug our logic, debug the expectation that you should have from your application. And by the way, we said assertions are disabled by default. OK?

Here's how we typically handle the assertion When the syntax of the assertion is ASSERT, and then your Boolean_expression. Expression. By the way, your Boolean_expression evaluates to false. If it evaluates to false, then an AssertionError is thrown. So that's the first one.

The second one is you have ASSERT Boolean and you have some detailed expression. Well, this second argument, which is the detailed assertion is the string that is used as descriptive text in the assertion_error. so again, in this case, you can have an example where if assertion are enabled, then again, AND/IF condition is equal to false, then throw an AssertionError.

Assertion_Error is a subclass of error, and therefore falls in the category of unchecked exceptions. And here's where we can find we can use assertions. For example, let's assume that we have a problem here. This is an invariant, internal invariant problem. So we know that x, if x is greater than 0, go ahead and do this, ELSE do that.

What we could do with here is you could say, again, if x is greater than this do this, ELSE we ASSERT. If x is equal to 0, OK, then do that unless it is negative. Because of course in this case if it's equal to 0 and then do that. And of course if it is-- so if it's not, if it's not positive and not equal to 0 then it must be what? Negative, right So now you're trying to make sure that the value of x is in this case whatever you wanted it to be.

We also see it in a control flow. Here's for example one that is used in the SWITCH statement, where we say if for example it's not club, it's not diamond, it's not heart, it's not spades, then of course we can ASSERT false here, and we say again, unknown playing card, so which means it has to fall here where we said ASSERT false. And then in this case it has to be either this or this or this or this, but it cannot be this, because we just checked here that if it's this it's going to of course throw what? An Assertion_Error.

Here's another example where we can use it in postconditions and class invariant. So here we have a pop method. You folks know about the pop and push in the stack. So here we, again, get first of all get the size, which is the current size of your stack. You have to count them.

If the size is equal we know we can throw a runtime exception, right? And of course if not, then we'll go ahead and retrieve the, again, the popped element and put it here.

Here what we could do is we can test the postcondition, which means what? I'm asserting that if the size is-- get the count. If it's equal to size minus 1 then what? Then of course this has to be true. If it's false that means what? It is empty. Good.

Let me just, again, show you and let me go ahead and finish with this and show you an example in that means about that. Controlling runtime evaluation of assertions, if assertions checking is disabled, the core runs as fast as if the check were never there.

Assertions checks are disabled by default. Enabling assertions can be done either through a command like this one here, -EnableAssertions or -EA. Assertions, by the way, checking can be controlled on class package, and a package hierarchy basis. Again, you can read about assertions following This link.

And we have a quiz here that says assertions should be used to perform user input validation. What do you think about this? False. And before again talking about the summary, let me go ahead and just show you an example about assertions. And for that, let me show you this example here. It is a class called Assert Demo1, and these are just examples, where I have a function here, static function f, and you need-- well, what do I do? I ASSERT false. OK?

then in my main method I'll go ahead and now you're within the TRY block. I call f. And if I catch an assertion, if I call f and ASSERT it false, if I catch an exception it's going to what? Is going to print exception and of course Assertion_Error, right? And of course it's going to print Hello anyway.

Let me go ahead and first show you how to enable and disable assertions. Let me go right click on the project, on NetBeans again, click on Properties, click on Run, and then under the option, add the minus if you want to enable the assertion. Let's assume that I want to disable it.

Let me go ahead and run this. If I run it, you see that in this case, obviously it prints Hello, because in this case we did not enable the assertion, right? So it's going calling f but it's not, even when f is calling, it's not reading ASSERT false, right?

Let me go ahead now and right click and ASSERT and of course enable the assertion. I can enable it at the VM option -EA, exactly like we showed you on the book, which is this one here. OK? All right. So let's go ahead and do that.

And take a look at what's going on. So I did that. Click OK. And now I right click, and I will go ahead and run it. So as you see it's picked up now. It actually read what's in f, executed f, and it read that its ASSERT is false, and that's why it throws this exception. Everybody sees that?

Let me show you another example, which is also quite interesting. Here's an example that has it's called Assert, the class is called Assert Demo2. It has a main method. And then look what we do here. We declare a Boolean enabled and assigned to it what? False. And then we go ahead and call ASSERT, and of course in this case set enable to true. Right?

If the assertion is enabled, which in this case it is, because we just did it, look what happened. It's going to print "Assertions are," in your opinion would be if I read ASSERT here then of course enable would be what? True. So if it's true then it's going to print what? This, because I'm using here the question mark column. So it's going to print this.

If I disable this, disable assertion, then of course in this case enabled is false and it's going to skip this because the assertion is disabled. And it's going to print what? Disabled. Let me go ahead and run the first time while the assertion is on.

So you see assertion is enabled. Why? Because it's reading ASSERT, but then after ASSERT I'm setting enable to true. If I set enable to true, then when I check is enable to true? It is. Yes it is. Then I print this. Right?

Let me now disable the assertion. Properties, file, and then I go ahead and disable. Let me go ahead now and run this. Of course, it's going to print what? Assertions are disabled. Why? Because if it's disabled it's going to skip this. Enabled, of course, is false, so it's going to print "Assertions are," and then is enable false? Yes, it is so it's going to print this. Got that, everybody? So these are a couple of examples that are really quite interesting and worth looking at how actually you use assertions.

Of course, in this particular module we looked at defining the purpose of the Java exceptions. We looked at using TRY and THROW statements. We looked at the CATCH, MULTI-CATCH, and FINALLY closers. We looked at the auto-close resources with the TRY-WITH resources statement, which is part of the Java SE 7. We recognized common exception classes and categories. We looked at creating custom exceptions and auto-closeable resources. And of course, we looked at testing invariants using assertions.

Now remember we also have a bunch of labs. And these are, again, practices for lesson nine where we first look at catching exception, again, to give you a summary level for that. Or if you, again, if you're comfortable to do the summary level as it is then it's good. Otherwise if you need a little bit more details you can go ahead and look at the detail level and where they give you more information about how, again, more help about how to do it.

And we also have the next practice would be extending exceptions. Again, they give you a summary level. If you're comfortable with it go ahead and use it to do your-- practice your lab. And if not you can go ahead and use the detailed level exception, which actually give you a little bit more information in that, compared to the summary level.

OK. So let's go ahead and do this practices for lesson nine. And after we finish with this, we'll go ahead and get into lesson 10.

## 4. Practice 9-1: Catching Exceptions - 10m

Now that we're finished with Lesson 9 that covers exceptions assertions, where we defined the purpose of Java exceptions, we made use of the Try and [UNINTELLIGIBLE] statements. We've made use of the catch, multi-catch, and finally closers. We looked at the auto-close resources with Try and with Resources statements that is part of the Java SE 7, looked at recognizing common exception classes and categories, and we looked at creating custom exceptions and auto-closeable resources. And of course, we tested invariance by using assertions.

Let's go ahead and look at the practices for this Lesson 9, and we start by looking at the Practice 9.1. And we're going to look at the detailed level of that. So in this practice, we're going to create a new project in catch checked and unchecked exceptions. Again, we will create a project that reads from a file. The file reading code will be provided to you.

And of course, your task is to add the appropriate exceptions and laying code. So we create a project called ExceptionPractice, and we already have that on NetBeans here. And then, of course, after that, we'll go ahead and look that creating a class called ExceptionMain under the package com.example. And of course, in the Main method, we have a println statement reading from a file with args [0], which is the-- args [0], rather.

And again, we should note that a command-line argument would be used to specify the file that would be read currently. No arguments would be supplied, so do not correct this oversight. So if you're on the project, you would see an exception in the third main says java.lang.ArrayIndexOutOfBoundsException.

Continuing with this practice, after that, we surround the println with a try-catch statement. And of course, again, the Catch clause should accept a parameter of type ArrayIndexOutOfBoundsException with the message "No file specified, quitting," and exit the application with an exit status of 1, using the system.exit pass 1 to it method. So in this case, it will look like this Try block here, where we have a println of reading from a file message, again, catch the ArrayIndexOutOfBoundsException and print the message "No file specified, quitting." And of course, call the system.exit, and pass 1 to it.

We should note that since the compiler did not force you to handle or declare the ArrayIndexOutOfBoundsException, it is an unchecked exception. Typically, you should not need to use a try-catch block to deal with an unchecked exception. Checking the length of the args array is an alternate way to ensure that a command-line argument was specified.

Run the project. You should be able to get an output that looks like this error message. Add a command-line argument to the project, right-click, again, the exception practice project and click Properties. And that's where now in the Properties, you're going to click on Run category. And then in the Argument field, put down, again, where the file is located, which is the file is called DeclarationOfIndependence.txt.

Run the project. Run the line again. Running the project is not the same as running the file. The command-line argument will only be passed, in this case, to the main method if you run the project. And again, this code that you see here, and that'll pretty much allow us in the main method to create an instance of the BufferedReader where we pass a new instance of the file reader and pass args [0] to it, which represents the name of the file.

And then declare a string s, and use the While loop to read lines and print them out. Again, run and fix the imports wherever you need to. Again, you should now see the compiler errors in some of the lines that you just added. Again, these lines potentially generate checked exception by manually building the project or holding your cursor above the line with arrows. You should, again, see a message similar to what you see here. Let me just highlight what you're supposed to see, something similar to this one here.

And then after that, again, we say modify the project. Let me go back, continue. So modify the project properties to support the try-with-resources statement. Right-click, again, in this case, the ExceptionPractice and select Properties. Again, in the Properties dialog box, select the Sources categories, and of course, select Source Binary Format.

Again, drop down list, and select JDK 7. Obviously, all of this is done. I'll go ahead and show you this and look at the sources and look at the libraries. So you see, it's JDK 1.7. And for the sources, it's also, in this case, JDK 1.7, as you see. So that's all done.

Continuing with that, so the IO code provided in step 8 with the try-with-resources statements. And let me just slowly scroll down so I can continue with that, step 12. And of course, the line that creates and initializes the BufferedReader should be automatically closed resource. And of course, the catch clause for the FileNotFoundException within the catch clause, print, "file not found," and then args [0].

Exit the application, add a catch clause for an IOException. Within the catch clause, print error reading the file, along with a message available in the IOException, and exit the exception. Again, it should be something similar to what you see here, try, and then you create, of course, and then you catch a FileNotFoundException. Again, print "file not found" and then args [0], and exit your application.

And for the IO, pretty much "Error reading file," and then get the message from the e and exit, and run your project with that. So let's go ahead and do that. So first of all, let's take a look at the code. So here's my ExceptionMain. It has a main method. First, I go ahead and print "Reading from file," args [0], and catch ArrayIndexOutOfBoundsException, and print "No file specified, quitting."

And then, of course, the try here where we create an instance of the BufferedReader and by passing, again, the new instance of the file reader that takes args [0] to the constructor BufferedReader and out of that declare a string s, initialize it with null, and then use the While loop while again, the b.readLine is different than null, go ahead and print that string. Catch a FileNotFoundException, and print this message, and exit the application, or catch an IOException, and print this message, and exit the application on line 28.

So first of all, we use the Properties and the Run and Args, we see the file here. Let me go ahead and just create a typo in this file. Instead of txtl, just put tx, click OK, and now run it, run the project. And of course, as you see, I see "Reading from file" and then args [0] with the end tx that you see here. And of course, "File not found." And obviously, that's not the file in this case.

So what I do is I go back now and click on Properties, go to the Run category, and then, in this case, write the right spelling of the file. Click OK, and then now I'll go ahead and run it. And if I run it, it's going to run, as you see, and it gives us the output. And it prints the different, again, lines that we write. And all the way until the end of the Declaration of Independence. And that pretty much ends the Practice 1 of Lesson 9. Thank you.

## 5. Practice 9-2: Extending Exception - 12m

Let's go ahead now and look at Practice 2 of Lesson 9. In this practice, we will take an existing application and refactor the code to make use of custom exceptions class and a custom auto-closeable resource. Again, we have been given a project that implements the logic of a human resources application. The application allows for creating, retrieving, updating, deleting, and listing of employee objects. This is the same project that we competed in the Applying the DAO Pattern practice.

Currently, the only exception generated in the DAO implementation, which is the EmployeeDAOMemoryImpl, are unchecked exceptions such as ArrayIndexOutOfBoundsExceptions. Future DAO implementations should not require any rewiring of the application logic-- again, the employee test interactive-- however, some DAO implementation would generate checked exceptions that must be dealt with by creating a custom-checked exception that will be used to wrap any DAO-generated exceptions, all DAO implementations can appear to generate the same type of exception. This will completely eliminate the need to change any application logic when you create database-enabled DAO implementation in later practices.

So in this case, what we were doing is we're opening, again-- open the DAOException project. And of course, what we are going to do is create a DAOException class in this and under the DAO package, which is under com.example, and of course, complete the DAOException class. In these case, it should extend the exception and contain four constructors with parameters matching those of the four constructors present in the Exceptions class.

For each constructor, use the Super to invoke the Parent class constructor with matching parameters. And here, we show you how the code is going to look like. So of course, in this case, looking at that class, here it is and extends Exception, we have a DAOException. That's the default that calls the default Super.

And then after that, we have the DAOException message. So that takes a message and passes that, takes that message and calls the Super. And then the one that takes Throwable cause and then passes the cause to the Super constructor. And then the one that takes the message and Throwable, and of course, passes the message and the cause to the Super, which is the constructor of the Super class, in this case, which is Exception.

Continuing with the practice, modify all the methods in the EmployeeDAO interface. All methods should declare that DAOException may be thrown during the exception. Extend the AutoCloseable interface. Let's go ahead and look at that.

And for that, we have the DAO that extends AutoCloseable And you see how, in this case, all of these, now, methods extend-- see, the first one, DAO extends AutoCloseable. Methods throw DAOException here, as you see all of them, delete, add, update, FindById, ID and getAllEmployees.

So continuing with that, modify the Add method within the EmployeeDAOMemory implementation class. Declare that a DAOException exception may be produced during exception of this method. Use an If statement to validate that an existing employee will not be overwritten by the add if one would generate the DAOException and deliver it to the caller of the method.

Again, the DAOException should contain a message String indicating what went wrong and why. Use the try-catch block to catch the ArrayIndexOutOfBoundsException, which is an unchecked exception that could possibly be generated. Within the catch block that you just created, generate DAOException and deliver it to the caller. The DAOException should contain a message String indicating what went wrong. And here is, again, in this case, how the code should look like.

OK, continuing with that, and here's the rest of the code. Modify the Delete method within the EmployeeDAOMemory implementation. Again, declare that DAOException, in this case, may be produced during the execution. That's why we say throw DAO. And of course, in these case, throw a new instance of the DAOException. And within the Try, we'll go ahead and catch an ArrayIndexOutOfBoundsException.

We'll do the same thing for the FindById, and we override the Close method, and of course, Modify. So let's go ahead and do that. Take a look at that, all of this. That will be here, where as you see, in this EmployeeDAOMemory implementation, that implements a DAO.

So you see how the Add can throw a DAOException. Exception And then here, see how we throw it with an If statement that we have here, like they told us. And within the Try, how we can catch an ArrayIndexOutOfBoundsException, and of course, throw a new instance of DAOException. We do the same for the Update method, same thing for the Delete method, same thing for the FindById method, where in this case, we catch an ArrayIndexOutOfBoundsException. And of course, we override the Close method.

Continuing with that, now they are asking us to modify the EmployeeTestInteractive class to handle the DAOException. So first, we import the DAOException and then modify the ExecuteMenu method to declare and that it throws an additional exception, which is the DAOException. And that, again, in this case, should look like this. It should look like the one here on Part B of 12.

Continuing with that, remove the Throw statement from the Main method. Modify the Main method to use the try-with-resource statement. Surround the do-while loop with the Try block. Convert the EmployeeDAO and the BufferedReader references with auto-closed resources.

Add a catch clause for an IOException to the end of the Try block to handle both the I/O errors thrown from the ExecuteMenu method. And when auto-closing the BufferedReader, add a second catch clause for an Exception to the end of the Try block to handle errors when auto-closing the EmployeeDAO. And of course, the code should look like this.

And at this point, the application will compile and run, but the DAOException instances generated will cause the application to terminate. For example, if you create an employee with an ID of 100, the application will break out of the do-while loop, and of course, pass it to the catch clause. Add the nested-- that would be the last piece here. Add the nested try-catch block in the Main method that handles Exceptions of the type DAOException that may be thrown.

And you see here how we have it here. And attempt, in this case, when you run your project, and of course, what you need to do is attempt to delete an employee that does not exist. You should see a message similar to what you just saw over there.

So let's go ahead and take a look at this code. And that would be here, so you see, in the EmployeeTestInteractive. But in the Main method, we create a new instance of the EmployeeDAOFactory and have the Boolean variable, TimeToQuit initialize to false. And within the Try, we create a Factory. And of course, we'll go ahead and get a BufferedReader and call the ExecuteMenu method and catch a DAOException if there is a DAOException and print this message, while, of course, the TimeToQuit is not true.

Catch an IOException if there is, and print these messages. And the same thing, catch an Exception and print these messages. The ExecuteMenu method takes a BufferedReader, an instance of the EmployeeDAO. And as you see, it also throws-- let me just move a little bit this one here so that we can see the code. And of course, I slide this way, so I throw as an IOException and a DAOException that you see here.

And then, of course, the rest is kind of similar to the ExecuteMenu method that we've seen earlier, if it's a C or an R and so forth. The same concept, pretty much the same thing. Here is the InputEmployee method that is overloaded three times. And we've seen earlier, in the previous labs, we've seen this method anyway.

And of course, running it now-- and let's go ahead and select Delete. Hit Return, and then EmployeeID, we'll put 1. And hit Return. Of course, as you see, error, and message, Error detecting employee in DAO, no such employee ID, exactly what, of course, they predicted would happen and exactly what we see here. Pretty much we have the same thing here, in the NetBeans when we run the EmployeeTestInteractive. And that pretty much ends Practice 9.2, or the second practice of Lesson 9. Thank you.
