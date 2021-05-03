# 8: Handling Exceptions

1. Handling Exceptions - 14m

## 1. Handling Exceptions - 14m

Handling exceptions. I suppose things can go wrong in our code. Exceptions might be produced. We need to figure out what we're going to do about them.

Exceptions in Java are represented as a class hierarchy. For every exception type, you'll find some class. They all descend from the class Throwable. The ultimate parent of the class hierarchy is of course the class Object. But exceptions specifically descend from the class Throwable.

So the Throwable has two immediate children, a class called Error and a class called Exception. The Exception class is then extended by the class called RuntimeException. And we need to know these types, because apparently they represent different categories of exceptions. They're known as checked, or unchecked or runtime exceptions.

Those exceptions that are children of an Error class, for example out of memory error, that's eventually through the virtual machine error extending the Error class-- and those that are children of RuntimeException-- there's quite a few there, NullPointer, Arithmetic. As you can see, there's a whole class hierarchy extending RuntimeException.

Those two types, the Errors and RuntimeExceptions, are known as unchecked. You are not obliged to write an actual catch block for them, so you don't have to try-catch them. But those exceptions that are direct children of an Exception class-- so let's say, I don't know, bad string operation, SQL, I/O, whatever they are, so quite a few again-- they are the exceptions that you have to catch. If your code can you produce you an IOException, for example, you actually must write a catch block.

Think about it this way. Every time you access the object, theoretically you can end up with NullPointerException. But it doesn't mean that you have to write a NullPointerException handling in each and every place in the program. No. You don't have to.

The thinking behind why you have these two different exception types is really to indicate that some exceptions are cases where you don't really need to do anything coding-wise in your program. If you program had an, I don't know, out of memory error, there's nothing you can possibly do about. Your program just crashes. That's it.

If you program ends up with NullPointerException, well, what's the point of catching it? You should just go back to the code and fix the logic. You've made some kind of logical error.

However, those exceptions that are children of Exception class, they represent genuine issues. Your user typed the wrong thing. I don't know. You tried to access the file and there is a hard drive failure. There's absolutely nothing wrong you've done in your program. These are other circumstances that may generally occur.

You have a SQL error in a database. You have an I/O error with a file system, for example. And you have to write the code to handle these problems.

All right. So for the purposes of the exam, you need to be able to distinguish these exception types. Let's take a closer look at how you're going to throw and catch them.

OK. Let's play kind of a game here. There is the method doThings. We declare that it can potentially throw us a SQL exception. There could be a throws clause and a list of exceptions you can throw out of the method.

So presumably inside the doThings method, these operations, a, b, c, d, e, I don't know, whichever, some of these operations may produce a SQL exception. OK. Operation b and c are included inside a try block. The assumption is that we would like to catch certain exceptions directly in the method doThings. We don't want them to be propagated to the caller, so that's why they're not listed in a throws clause, because we want to handle them locally inside this method.

Specifically, we're after some FileNotFound and IOExceptions here, IllegalArgumentException, as well, so a few exceptions that we'd like to handle in this case. Then there is a finally block. A finally block is executed no matter whatever exceptions do or do not occur in a try block. If the try block throws you an exception, the finally block will be executed. If the try block does not throw the exception, the finally block is still executed. And then there is this method h, which we call at the end of the method doThings.

We invoke the method doThings from the main method here. That is some kind of tester. Again, we have a catch there, try-catch. And we're looking for a SQL exception, because that's what we're not catching in doThings. We just let it pass to the calling method and we do some actions there.

Now I'm going to show you how to play a small game here. OK. Let's assume that we are in a situation when a method b throws you IllegalArgumentException. Method b throws IllegalArgumentException.

So the game goes like this. What will be executed in this case? Mm-hmm. Let me give you the answer, straight ahead. a, obviously; partially b, because it then failed. c is not going to be executed. You terminate the try block at that point, because b failed with IllegalArgumentException, so c will not be executed.

f will be executed, because that's the contents of the catch there, so it's a fictional method, of course, we're talking about. g will be executed, some finally block logic. And because you have handled the error, h will be executed as well.

So everything is fine. You fixed it. You caught it. You did something. The rest of the method can proceed.

If you didn't want h to be executed in this case, what you could have done-- I suppose you could have placed it in a try block, so like c, which was not executed when b failed. But you decided to place it afterwards, implying that probably you've already fixed the problem in the catch, so you can proceed to the rest of the code.

All right. Now think about what's going to be executed if b will throw you FileNotFoundException. If you'd like to pause the video, you can pause, and I'll reveal the answer for you. And the correct answer is a, partially b, d, g, and h.

OK. Let's try another one. What will be executed if b will throw you NullPointerException? You can pause the video. Think about it. And I'll reveal the answer in a moment.

So b throws you NullPointerException. There is no catch for it. You're not required to write it. You don't have to.

So a will be executed, b partially. c will not be executed. g will still be executed. The finally block is still executed, even though you didn't add a catch to catch that exception. And because you never had a catch, then h will not be executed.

All right. So that algorithm will not proceed to the h method, because essentially the method will terminate. The only thing that will be executed even if the method terminates is the finally block.

OK. Another one. What if b throws you SQLException? Again you can pause it. Think about the answer.

And I'm going to reveal the correct answer. a will be executed, of course. b throws you SQLException, so b will partially be executed. g will be executed, because that's the finally block. It's executed anyway. And then the control will be passed to the calling method, where i will be executed and then j.

All right. Lastly, what if no exceptions were produced whatsoever? Everything is fine. No exceptions are produced. What's executed then?

Pause. Think about it. And I'll reveal the answer. And the answer is a, b, c, g, h, and in the calling method j, I suppose. There you go.

All right. So I hope you enjoyed the game. So that will help you to understand how the control is passed around your code when you are producing exceptions, catching them, and actually handling the sort of cleanup of your method in a finally block.

One more thing. What if I will swap around these two catches? What if I write the catch of FileNotFoundException after catch of IOException? So just I swap around these two blocks.

Hmm. I'll tell you what. The code will not compile. Let me go back one page.

Do you see in this page the FileNotFoundException extends IOException? So that is the reason why if you will swap around these two catches, the code is not going to compile, because you will end up with an unreachable catch. Your child exception type must be handled first before you catch the parent. Really, if you didn't want to handle FileNotFoundException at all, you didn't have to have the catch, because FileNotFoundException extends IOException, so it's technically enough for you to just catch IOException.

I mean, theoretically, technically it's enough for you to catch just Exception. You can have just one catch block, capture an exception. The problem is you wouldn't really know what type of exception occurred, so you'll have to write extra code about it. That might not be very convenient. If you want to do different actions for different types of exceptions, that's why you have different catches. So a more specific catch must be placed before the more generic catch. That's the important point to remember.

One more example. What if no exceptions would be produced at all? Which methods will be executed in that case?

OK. Let me reveal the correct answer. There will be a, b, c. No exceptions were produced, so catches don't fire. Finally block, however, still fires, g, h. Well of course, the method doThings completes successfully. No catch block is executed in a main method, so the j just proceeds to the remainder of the method.

All right. That's it for this particular section. We've looked at the difference between checked and unchecked exceptions, and also the type of exception which we know as an Error, which is really a variant of Runtime unchecked case. We looked at how we write try-catch blocks, how the program flow is passed around, how the exceptions are handled, the fact that we have this whole hierarchy of distinct exception types that match different cases in a program, how to pass the exception to the calling method, and well, just sort of looked at examples of common exception classes that frequently occur in Java. Let's take a further look at the next section.
