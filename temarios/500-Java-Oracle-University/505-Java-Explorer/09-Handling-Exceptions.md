# 09. Handling Exceptions

Handle errors and exceptional conditions in Java using a try/catch block and exception handlers.

## 01. Title and Objectives 1m

Java Basics, Handling Exceptions. In this module, we're going to take a look at how to work with exceptions in Java. We'll describe exceptions. We'll describe the effect an exception has on program flow of control. And we'll see how to use a try/catch construct to handle exceptions.

## 02. Handling Exceptions 9m

Handling exceptions, Java handles unexpected situations using an exception. Something unexpected happens in the program, and Java doesn't know what to do. Therefore, it must take some kind of action. What it does is it creates an exception object containing useful information.

For example, your code starts to try to read a file, but the file doesn't exist, and, therefore, it can't read the file, can't open it. That would be an exception. Or your code tries to write to a database, but can't connect to the database because maybe it's down. That would be an exception.

So, when something happens-- an unexpected situation happens in the program-- then you need to decide what do you want to do with it, as the programmer. Exceptions are very nice, clean way to handle this. So, when something unexpected happens, Java will create an exception object and pass or throw that exception object to the code that invoked the problematic method.

Now what that means is, if my code is calling a method that is going to try to read from a file, and that file could potentially not be there, that code could throw an exception back to my code. And I need to write code to address that if that happens. What would I do? Notify the user maybe that the file is no longer there, or create a new file, or write a log or something like that.

So we have different types of exceptions in Java, some of which you can deal with in code and some of which you can't. We have different types of exceptions in Java. Here, for example, the ArrayIndexOutOfBoundsException occurs when you try to access a non-existent array index. For example, if you have an array of three elements, then index 0, 1, and 2 are the only valid indexes. If you try to access element 4, index of 4, that would be an ArrayIndexOutOfBoundsException.

A NullPointerException, here you don't have a valid object reference. You have an object-- a variable with a null value, and you're trying to call a method on it. And that call causes a NullPointerException.

ArithmeticException, this is a division by zero. Now notice a careful programmer who tested their code or tested their values better would be able to prevent any of these from happening. These are all preventable. So some types of exceptions are preventable by, basically, coding better, and some are not preventable. The ones you deal with, as a programmer, are the ones that are not preventable.

In other words, if you try to write code that's going to read from a file, and the file was there yesterday, and, today, somebody deletes it, you can't prevent that in your code. You can detect the fact that the file is gone and no longer there and catch the exception and handle it, but you can't mitigate the fact that the file has actually been taken away.

So coding mistakes, such as an attempt to access a non-existent array index, causes an exception. Here we have an array of ints called intArray, new intArray 5. So, of course, we know that the element indexes will be 0 to 4. The length of the array is 5, but the indexes are 0 to 4.

So, if I were to write code to access array of-- intArray of 5 and store the value 27, it'll throw an exception. So it won't ever get to the System.out.println. It'll simply throw an exception and possibly stop executing. So it produces an exception that terminates the normal program flow, and then the exception handling flow is triggered.

Let's see what happens when exception flow handling is triggered. Here, in public class Test, we have a main method, a static void main method, and we have a static divide method. Inside the main method, we set x equal to 5. We set y equal to 0.

And then we call the divide method. We call the divide method, pass in x, which is 5, y, which is 0, and attempt to do the division, x divided by y. This generates an exception. When it generates an exception, control returns to the code where the actual call was made, which is right here. As you can see, we returned to line 5.

And then, because it's an exception, and there is no exception handler, the program, basically, goes to the end of the method, the end of the main method, and quits and prints out exception in thread "main" ArithmeticException by zero and tells you the actual line where it occurs, right, line 9. Right here is where it occurred.

And it tells you the method where it occurs. And so it creates a stack trace that walks you through the path of execution. If no exception handler is found, and that would be done with a try-catch block, which we don't have here, then the program will print the stack trace and exit.

So what happens is we come into the main. Line 3 executes. Line 4 executes. We go to line 8. We try to execute line 9. That throws the exception, and it immediately returns to where it was called from and skips the printing out println(z). That just gets skipped.

So this is what we mean by breaking the normal flow of the program. We've detected the fact that an error has occurred. An exception has occurred. And we don't want to continue processing. We either want to handle that exception or simply stop. Typically, you handle the exception.

The try-catch block is how we handle an exception. We examine the exception to find out the exact problem so we can recover more cleanly. And we don't need to catch every exception, just the ones that we think we're going to throw or that are important for us.

Here, for example, we have a Clothing array items, and we're going to access the description of item sub 0. And this could potentially throw a NullPointerException. If it does, we want to catch it here. So the try block starts with the curly brace here and ends with the curly brace here. And the catch handler starts with the curly brace here and ends with the curly brace here, here.

And then we have another catch handler that will catch all types of exceptions. So we have the ability to catch specific exceptions, like NullPointerException or FileNotFoundException or something like that, or we can catch any generic type of-- any type of exception at all. And this would work for any type of exception handler.

So we don't need to catch every exception. A programming mistake, for example, should not be handled. It must be fixed. This is a programming mistake. NullPointerExceptions are considered programming mistakes on the part of the programmer because, if they were more careful, they could check to see does items of 0 actually have an object there before accessing the description variable.

Remember, from our discussions on array of object references, once the array is created, it's all an array of nulls. And, therefore, until we actually put a new Clothing object into the array, there's nothing at item sub 0. So this could potentially throw a NullPointerException, and I would not code this.

I would write my code differently to make sure I don't access a null pointer variable, and then I can get rid of my catch NullPointerException. But we did this intentionally to show you what that looks like. So you need to ask yourself, does this exception represent behavior that I want the program to recover from?

OK, we have a quiz for you. The question is, which statements are printed? Choose all that apply. Look at the code. Try to follow the code. And see which of these statements would be printed.

We have three different print statements-- null, arithmetic, exception, and everything is perfect. You choose which ones get printed. Pause the video. And, when you're ready, go ahead and resume.

OK, so the correct answer here are b and d. And let's see why. We enter our try block. There is a curly brace starting our try block code. We said an integer variable k is equal to 10/0 to force the division by 0. Now, again, you would never really do this in code, and a good programmer would test the divisor to make sure that it's greater than zero, but, nonetheless, this forces the exception for the purpose of the quiz here.

So now what happens? Well, that division by zero causes an ArithmeticException, not null pointer. So we don't catch that exception. We branch down to here, and we print arithmetic.

Then the actual block is done, and so we just drop through. The actual block of code that we're executing starts here with the try and ends here with the last catch handler. Everything after it is additional code. And, therefore, everything is perfect prints as well, hence, b, arithmetic, which is the exception, and everything is perfect, the code that comes after the try block.

All right, we have an exercise for you. You're going to add an algorithm that will calculate an average price for all Clothing items owned by a given customer. And you'll print the calculated average value.

However, you're going to modify the average calculation so it only calculates the average price of items for which the size is L. Therefore, this should produce an ArithmeticException because there are no such items in the array. And it will, essentially, be doing a division by zero.

Create a try-catch construct to intercept this exception and print the error message. Then consider how could you change the algorithm to avoid this exception. In other words, how do you detect the fact that the divisor is zero and then not do the division?

Hopefully, using the coding examples in this module, you can write the code for the exception and get it to work. If not, as always, take a look at the video. Look at the solution, and follow along.

## 03. Handling Exceptions Demo 5m

Exercise 7-1 produce and catch an exception. Add an algorithm calculating an average price for all clothing items owned by a given customer and print the calculated average value. What this would look like is let's say for example, create an integer average and account. And since average is the sum of all the prices divided by the count of all the items, then we should get the correct average.

So we're going to start a loop. We're going to call C1. Get items, which returns the array of items that the customer has. C1 is a customer. Item will be our iterator. We'll increment count plus, plus. It goes up by one each time.

We'll take the item price and we'll add it into the average and store it back into the average. That's the plus equals. So basically, it's the same as average is equal to average plus item dot get price. So we're going to loop through the item array in the customer, retrieve the price for each item, add it to the average, increment the count, then divide the average by the count, and print the result. If we run that, we can see that we have an average price of 13 and a count of 4.

Now modify the average calculation so it only calculates the average price of items whose size is large. And this will produce an arithmetic exception, because there are no items in the array, and therefore, the advisor of the dividend will be 0. So I come over here and say-- and add the code. OK, I've added the code. If item dot gets size is equal to L-- so we look at the item that we're currently iterating on-- ask it for its size.

If the size is equal to L, get size returns a string. So we'll use the equals method not equal equal. If the size equals Large, then we increment the count, and we add to the average.

Now remember, the count is zero to start with. Now when we come out of that loop, if we don't have any items that equal L at all, then counts remain zero. And when we get down to this line of code, it will cause an exception. If we run it, sure enough, that's exactly what we get. There is our exception.

So there is an exception in thread main. It's a java dot lang dot arithmetic exception, division by zero. It tells you the line that it occurred on. The following error occurred in executing the line.

Let's see. The line is here at 111. And that's actually in another class, in the run XML class. For us, it's in line 61 right here. And sure enough, that's exactly where it occurs.

Now to fix this we're going to add a try catch block. So the next part says create a try catch construct to intercept this exception and print the error message. All right. So to do that, we're come down here and I'm going to add a try block.

Try curly brace. That begins the block. And we'll move this code up into the block, reformat. All right. Now our catch in this case, we're going to catch and we want an arithmetic exception.

And what we want to do in this case is just system println. And we'll just say don't divide by zero. OK? Let's run it and see if it works. Yeah, it does. There's our don't divide by zero.

So what happens is we set the average to zero, the count to zero. We enter a loop. As we go through the items, none of the items are equal to L, so we never increment the count. We never increment the average. Nonetheless, average equal to average divided by count would throw an exception.

It throws the arithmetic exception, which sends us down here to arithmetic exception. And then it prints out don't divide by zero. Notice it never prints the average price. It will never print this line, because it branches around it.

So with that, you've seen how you can produce and catch an exception. Something to think about is how could you change the algorithm to avoid this exception? And of course, what you'd want to do is test your count first. You'd want to say if count is less-- is count is equal to zero, then don't divide by it. Either use something else like use one, or throw-- you'll throw an exception or send out a different error message.

For example, if we were to use this line of code instead, average is equal to count equal to zero-- if it's equal to zero, then just return to zero value, otherwise, return average divided by count. That way average will take on zero when there are no numbers. And it will take on the actual average.

And it'll avoid the-- void the exception. OK. So with that, that completes exercise 7-1.

## 04. Summary 1m

In this module, you learned what exceptions are. You learned what the effect of an exception has on the flow of control of the program, and you saw how to use a try_catch construct to handle exceptions.
