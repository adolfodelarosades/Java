# 12: Lesson 12: Working with Arrays, Loops, and Dates

1. Lesson 12: Working with Arrays, Loops, and Dates, Part 1 - 11m
2. Lesson 12: Working with Arrays, Loops, and Dates, Part 2 - 3m
3. Lesson 12: Working with Arrays, Loops, and Dates, Part 3 - 19m
4. Lesson 12: Working with Arrays, Loops, and Dates, Part 4 - 14m
5. Lesson 12: Working with Arrays, Loops, and Dates, Part 5 - 4m
6. Practices for Lesson 12 - 20m
7. Skill Check: Working with Arrays, Loops, and Dates - Score 80% or higher to pass

## 1. Lesson 12: Working with Arrays, Loops, and Dates, Part 1 - 11m

This is Lesson 12, Working with Arrays, Loops, and Dates. What we're going to talk about in this lesson is an introduction to creating LocalDateTime objects to show the current date and time, how to parse the args array in the main method. So what that actually means is if you look at the main method, we have public static void main, then string args.

We're going to go over what this means. You've been typing it the whole time, but now you get to understand it. We'll also talk about how those to correctly declare and instantiate a two-dimensional array. Ooh. We'll talk a bit more about while loops, for loops, do/while loops, and how to evaluate what the best kind of loop is given your program requirements, and we'll also introduce the array list and how to use that to store and manipulate objects.

So to start off with, we have working with dates. Java provides classes to help you model a local LocalDateTime, and this is found in the package java.time. One of the methods found in the LocalDate class is the .now method, which here we can see is a static method. And what we're doing in this line of code, we're declaring a variable myDate of a LocalDate type, and we're assigning it a value from the static method here, LocalDate.now. It's a static method, because we don't need to create an instance of a LocalDate class. Instead, this is more like utility method, where we're just calling the class directly like we would with, say, math.pi. Math.pi returns a number. Here, we're returning a local date. And then we're printing that.

This example, though, it uses the default format for formatting time zone. There's more to it than just LocalDate though. There's a lot more that Java has to offer. But what I'll talk about first though, I had mentioned the package, java.time. Any time you work with classes that aren't in the java.lang package, you have to write an import statement at the beginning of your class, which can be found here.

The reason why you don't have to do this with java.lang is because this is automatically imported. And this is going to-- java.lang includes things that are essential to Java like, for instance, strings. You don't need to import strings. You automatically do when you're automatically able to work with them. Local dates, on the other hand, aren't. So at the very top of our code, we'll have to write import java.time.LocalDate. That's saying to import, look in the package, java.time, and then we want the class, LocalDate.

There's a lot of other classes that are available in the package, java.time, so if you just want to import all of those at once, instead what you would write is import java.time.*. If we have this line instead, our code below would still work, the reason being * means import everything. And included in that everything, in the everything in the time package in that folder is going to be our LocalDate. And then once they do that, you're free to create LocalDate objects and use the methods and fields that are associated with the LocalDate class.

Java.time-- that's the main package. That's the main package for the date and time classes. And there's a bunch of things found there. We have LocalDateTime, LocalDate, LocalTime. Another example is Format. Format contains classes with static methods that can help you format the dates and times. It's going over briefly what some of these mean. LocalDate is an immutable date/time object that represents a date, often viewed as a year, month, day. Other date fields, such as day of the year, day of the week, or week of the year can also be accessed. For example, the value the 2nd of October, 2007, that can be stored in a LocalDate.

LocalDateTime is very similar, the key difference being the word "time." What you do with this is you can add an additional time component onto that date, so instead of this being-- LocalDate being the 2nd of October, 2007, here we have 2nd October, 2007, plus an additional time, which would be-- so one example of this would be if you're on a 24-hour clock, it would be 13:45.30.1234, if you want to get really, really precise. It just add this little time component here.

LocalTime, what we're doing there is we're taking out the date part, and we just have this little time component here. And then finally, we have format.DateTimeFormatter. What that does is it allows particular methods for formatting your DateTime, and here's an example of that right here. DateTimeFormatter.ISO_LOCAL_DATE_TIME. ISO_LOCAL_DATE_TIME is one of the many formats that are available to you.

Another way to format it though would be, say, you want a Japanese date, and Java provides ways to do this as well. The default calendar that Java uses, though, is a Gregorian calendar. If you need non-Gregorian dates, you would java.time.chrono. Use that class, the Chrono class, and they have conversion methods in there.

So for example, looking at the example down here, we're converting a LocalDateTime-- excuse me-- a LocalDate. You take a LocalDate, reference variable, myDate. Then we pass that down here to our static method, Japanese date from my date. And from that, we're able to generate a Japanese date object with the reference variable jDate. Then we go to print that jDate, and this is what would appear down here-- our Japanese date.

Some methods that may become useful when you're working with local date are found below. We have minus months. If you have a date, and you want to subtract some months from that, you can. If you want to add a few days, you can do that as well. Those are instance methods, which means you have to create an instance of a LocalDate object. Otherwise there are static methods, which don't require you to create an instance. We have of-- pause. Unpause-- which obtains an instance of LocalDate from a year, month, and day that you provide.

We have parse, which obtains an instance of LocalDate from a text string by a specific formatter. And then we have now, which is going to look at the current date, the current local date. If you need more information on this, thankfully, the LocalDate API documentation is available.

Here's some examples of how to format a date. I had talked about ISO format before, and here are some examples which show what this would look like. Looking at line one, in line one, you get a LocalDateTime object that reflects today's date. Line six, six through seven, you get a string that shows the date object formatted in standard ISO time format. As you can see from the output, the output down here, the default format, when you print the LocalDate object, it uses the same format.

On the other hand, though, if you look at lines 11 through 12, you call the of localized DateTime method of the DateTimeFormatter to get a string representing the date in a medium localized DateTime format. The third line of output shows the shorter version of the output. This is what you'll get. This is the medium format. And now I'd like you guys to give this a shot. Try experimenting on your own with the LocalDateTime.

## 2. Lesson 12: Working with Arrays, Loops, and Dates, Part 2 - 3m

Welcome back from doing practice 12-1. I'm glad you guys gave this a try on your own, because when it comes to understanding things like LocalDateTime, especially in this case, it's very helpful if you're able to get your hands dirty on your own and use the lecture notes as just that-- notes, just reference to help you get started and push through actually making something, actually coding something. But now we're going to move on to a different topic.

I'm going to tell you about the much-overlooked args array. So inside every main method, you've been typing String, brackets, args. So that means we're actually passing in an array of strings with every main method.

In order to access that array, you access it like it's any other array-- args, and then in the brackets, you say the indices that you want, which would be in this case 0 and 1. But how do we go about actually passing in strings into this array? How do we fill up those indices? That's what I'll show you how to do next.

You do this actually using NetBeans. This is one way to do it. You find your project in NetBeans, you right-click it, and you select Properties. You select Run, and then you navigate to the arguments. And this is where you can type all the argument that you want. And they're separated by spaces, not commas. And then once you're done, you click OK.

But the thing to remember here is that they're strings, not integers. So if you actually want to do any kind of math with the arguments, you first need to parse them-- make them into integers. That's what's being shown right here.

Otherwise, what happens is, if you look at this line of code, we think that we're going to add them. We're adding the argument in index 0, adding the argument in index 1. So we think we're adding 2 and 3, but we're not. Instead, were actually concatenating them.

And we get a result here of 23, which works for strings, but it doesn't work for math. 2 plus 3 does not equal 23. Instead, we have to convert them into integers. And then, using our integer arg1, arg2, we're able to do math. And that gives us the mathematical correct answer of 5.

Now, it's your turn. Try practice 12-2, Parsing the args Array.

## 3. Lesson 12: Working with Arrays, Loops, and Dates, Part 3 - 19m

In practice 12-2, you've got to experience parsing the args array. The args array was actually what we call a one-dimensional array, which means you have one dimension of data-- one, two, three, four, five, one dimension in this way. But what if you wanted to store two dimensions worth of data and do that in an array? You can with two-dimensional arrays.

So you can think of two-dimensional arrays, if you want to, as a matrix. But what's important to understand is you're actually just representing two dimensions worth of data. And the way you go about doing this and declaring it is you have two brackets instead of just one. A one-dimensional array would've been int into years, and then we'd have our array of years.

But now we're actually going to have two dimensions-- years and sales. And there yet, other than that, it's exactly the same. You have your array identifier, which is going to be the variable that you're going to reference. So you have the type. It could be int. It could be whatever you want it to be.

So how do you actually picture this? There's not exactly a right or wrong way to go about picturing this. You could think of it as having five different arrays of four elements, so if you look down low, five different arrays. One, two, three, four, five-- they're all year arrays, and it's going to have four elements for quarters-- one, two, three, four. You could think of it as four arrays, as five arrays of four elements. You can think of it as four arrays of five elements.

You can think of it as an array of an array. You could think of it as-- if you wanted to draw the picture down here like we did, you would assume that five represents the number of columns. Four represents-- no, wait. I'm even confusing myself. You could think five represents the number of-- one, two, three, four, so these are rows, five rows, four columns-- column one, column two, column three, column four.

Or if you flip this around, instead of having five by four, have four by five, you can do that as well. So it doesn't really matter. The important to remember is just to be consistent, and if you decide to visualize it one way, be consistent and continue visualizing it that same way. And that's helpful for when you go to actually enter in data for your two-dimensional arrays.

Here, we have an example year. We've created our two-dimensional array. Five is going to represent-- wait. Let's see if I can get this right now. Five is one, two, three, four, five. We have five columns. Actually, you could consider this as X. This is going to be our X. Y for four-- one, two, three, four. OK. So now we're going to go about entering data, and this is done individually for each slot that we want.

So if we look at 00, this is actually-- I'll get rid of that here, make this wide, because our origin or our 00 is going to be here. So we have 00. We move along the X zero. We move along the Y zero, so we have 1,000 as our entry. 01, so X would go down, zero, zero, one, two, three, four. So we go along X, zero. We go along Y, one. 1500 for this entry. That's right. Our next entry is going to be 1800, and that's that zero, two. So go along, X, zero, two, zero, one, two for Y, 1800, so that's right.

1,000 is going to be entered in, so increment Y by one, so there's one, and then zero. Zero for Y, so that's correct. And then 2,000 would be a three, three. So we go down zero, one, two, three. Zero, one, two, three. OK. That's right.

Let's continue on to alternating looping constructs. There are new types of loop constructs that we're going to talk about. In this topic, we've already talked about the for loop. I'm going to introduce you to another type of for loop and additional loop types, which are while and do/while. A while loop repeats while an expression is true. A for loop simply repeats a set number of times, and the variation of the for loop that we've been playing with is called the enhanced for loop. A do/while loop executes once. It'll be at least once, and then continues to repeat while an expression is true. I'll go into more detail on each of these.

But to understand looping conceptually, think back to, say, when you're going on vacation with your parents or with your family, and you're in the car arguing with your sibling. While you weren't there at the destination, well, are we there yet is not true. What would you do? You'd have some behaviors that you would repeat over and over and over.

You would maybe read a book. You would argue with your sibling. You would ask, are we there yet? And this would keep going on until this condition was no longer true, until you actually were there. And then you were able to resume new behaviors like saying, woo hoo and get out of the car and enjoy the vacation.

Let's take a look at the while loop. Here's an example. We have our while declared here, and then we have a Boolean expression. The while loop is going to continue looping as long as this expression here remains true. We have while. We have our parentheses. Then we have our opening brace, and we have our closing brace.

And inside both of these braces, this is what's going to end up repeating. In the case of the elevator, which is shown in this example, if you're not on the current floor, check to see, are you lower than you should be? Then go up. Are you higher than you should be? Then go down. And this is going to continue until you're at the floor that you want.

When you're coding, yeah, just like I said before, here's the overall syntax, just a bit simplified. You start with while, open, close parentheses, and you'd have some Boolean expression, which is going to evaluate to true or false. As long as this evaluates to true, you'll loop through and do over and over again all the behaviors that are found inside these curly braces. This is your code right here. This is what's considered your loop body. And the only way to escape this loop-- well, there's actually a couple. But one way to escape the loop is when this statement no longer reads true.

You could also work with a loop counter when you're using a while loop. Here, we're creating our counter, line number two, Int Counter equals zero. As long as this counter remains less than three, we're going to do these lines of code. However, one of these lines says we're going to increment the counter one by one, so each time we loop through, the value of the counter is going to go higher.

So our first loop is going to be zero. Our second loop is going to be one. Third loop is going to be two. We've reached the end of our second-- we reached the end of that. Then the counter gets set to three. This is null. Our Boolean expression here is no longer going to be true. Three is not less than three. Three is equal to three. So then we break out of our loop, and we go to line seven.

And then this is pictured here. As long as we're looping, we're going to be printing out the stars. It happens right here. This is actually loop zero, loop one, loop two, no loop three, because if counter equals three, then our Boolean here is no longer true. The standard for a loop-- and this is a new variant of the for loop, one that we haven't talked about yet-- the standard for loop repeats its block code for a set number of times using a counter. So we explained a bit about the counter already in the previous slide. Here what we're doing is we're declaring that counter as part of the loop. Instead of doing it before, we're doing it right here.

So Int I-- this is our loop counter, I. Then the next car, this loop right here, this is our Boolean expression. Our loop is going to continue looping as long as this evaluates to true. Finally, we increment our counter. This is what's going to happen at the end of every loop-- I++. You should also note that each little component right here is going to be separated by a semicolon. That's actually a bit messy. Let me write it out again for you. Int I equals one. I less than five, semicolon, I++. Here we have our first part. This is going to be creating your counter, followed by a semicolon.

Our second part-- continue this loop as long as this condition is true, as long as this Boolean is true, followed by a semicolon. Then whatever you want to happen at the end of each loop. In this case, to make I an actual counter, we have to increment it. And then we have our opening brace, our closing brace. And inside here, this is all the code that we want to loop.

Let's compare the standard for loop to the while loop. They're pretty similar. They both have an initialized counter. Here, the counter is created as a variable that's part of the for loop, which means it's only going to exist within the context of the for loop. If we wanted to say num++ outside of the for loop, that won't work, because the variable is out of scope at this point. Or we are out of scope at this point. Num only is this within the for loop, and then once you're done with the for loop, it goes away.

On the other hand, if you look at the while loop, here, we're creating Int I before, so if we try to do I++ outside of the loop, it'll work. And the reason why this is bad is because it's not as efficient with our variables. We only created I to be our counter. And once we're done with our loop, we don't need a counter. But the counter sticks around, because we declared it before our loop. That's why the for loop is a much more appealing alternative.

Other of similarities between the two-- we have our Boolean expression, and in this case, we're checking to see if the variable is less than three. And then we finally increment our counter, Num++ or I++. We've used the enhanced for loop before, and I'll explain where it actually came from. It's very common to want to iterate through an array or through a collection of objects of values, and so the syntax for that with a standard for loop right here are you create a variable, what is going to be your index, on the array.

And then you keep looping through that array as long as your index is less than the length of the array you're examining. And then each time at the end of the loop, you increment that index. So that ensures you're going through each index one at a time in this array, the Names array. And here's where you check out the index.

This is done so often in Java, it became much more appealing to create a shorthand way of doing this to create a way to do it with less code. So that's why we call it the enhanced for loop, which you're already familiar with. What you do in the has for loop is first, you make up a variable, and this is going to be the value you're looking at in the collection, in the array of names.

And then all we're doing is we're printing out that individual value, that individual element within the names array. We also have what's called the do while loop, which is very similar to the while loop with one major difference in terms of how it functions. It means that when you have a do while loop, your looping body is going to execute at least once. And the syntax for [INAUDIBLE] the while loop is different as well, different from the while loop. You write do. Then enter in the curly braces for your loop body. You enter in the code that you want it to have loop through, and then you put the actual while component. While a particular Boolean expression is true, and then you have to add the semicolon at the very end.

This is different than our other loops. When you write a for loop, you'll have for blah, blah, blah. You enter in the curly braces. You don't enter in a semicolon here. Similarly, with the while, similarly with the while, you have your while. You have some Boolean. Then you enter in your curly braces. You don't put a semicolon here. The only time you do a semicolon when you're working with loops really is the do while loop. Semicolon would go right here. And I'd like to use this slide to recap the loop constructs. One is advantageous to use one or the other.

You would use the while loop to iterate indefinitely through statements and to perform statements zero or more times. Use the standard for loop to step through statements for a pre-defined number of times. You also use it when you don't want to have a counter that's sticking around after you're already done with the loop. Use the enhanced for loop to iterate through elements of an array or array list, which we'll discuss later. And finally, use the do while loop to iterate indefinitely through a set of statements, but you do this when you want your statements to execute at least once, one or more times.

There are a couple additional keywords when it comes to working with loops. We have break, and we have continue. Break, we talked about already. What that does is it causes the loop to exit or at least the current block of code. Continue is a little different. Continue means it causes the loop to skip the current iteration and go to the next. If you look at the code down below here, say we do line one. We do line two. We do line three. If this IF statement is true-- let's say it is-- we go to line three. Continue means stop the loop, the current loop. Go all the way back to the beginning. Any of the code that's found below like line four-- that won't execute, at least on this iteration.

If, on the other hand, we don't have continue, if we have break, that would mean you exit the loop. This is another way to exit a loop, by the way. And you go all the way to line 06. The loop is done. We have the break statement. Now it's your turn. Try Practice 12-3, Processing an Array of Items.

## 4. Lesson 12: Working with Arrays, Loops, and Dates, Part 4 - 14m

Now that you've finished Practice 12-3, we'll move on to the next topic, which is nesting loops. What is nesting loops? It's a loop inside of a loop. And you can keep doing this. You can put a loop inside of a loop inside of a loop. You could put a for loop in a while loop, a while loop in a for loop, inside of a why loop inside of a for loop.

You can keep doing this with your code. The problem is that if you do too much of it, your code becomes unreadable even to the person who wrote it. You can come back and look at your code and you're like, what does this mean? I have no idea. It makes it pretty complicated.

But it can come in handy, just be careful about how you use it. The reasons why it can come in handy is because it's useful for processing multi-dimensional arrays, like 2D arrays. It gives you the ability to sort and manipulate large amounts of data.

How it works, here's an example, an abstract example, actually. Your first iteration of the outer loop triggers the inner loop. Then your inner loop goes through. You're done with that.

Then you go back to the next iteration, the second iteration of the outer loop. Then you go through the inner loop again. You go through the third loop, the third iteration of the outer loop. Then you do the inner loop over again, and so on. Keep repeating that.

So here's an example, a more concrete example. I'll show what that looks like. What this code does, if you look at the innermost loop, the job is to create a row of at symbols here. And it's going to repeat this for a width of 10, so we have 10 at symbols being created. And the outer loop is saying, I want you to do this for height, for the height, for 4, so you're going to create 10 at symbols, do that 4 times.

And here's an example using a nested while loop. This one's a bit more complicated. What this code is trying to do is it's trying to guess your name out here by supplying random characters. And hopefully as it goes it'll gradually hone in on what the correct name is.

Here's another example with processing two-dimensional arrays. The innermost for loop prints all the quarters. It'll print Q1, Q2, Q3, Q4. And it's going to do this for however many years there are, years being determined on Line 5 by your outer loop. Here we have 4 quarters, 3 years.

One other thing worth mentioning is you notice the loop counters, i and j. Here's i. Here's j. These are really common in for loops to have really small names of variables, i, j, and k.

I know earlier we said to be descriptive with the variable names. And you can do that. That may be one way to actually help clarify what is going on with all this text here. But if you do you want to do just i, j, k, it's pretty well understood that those are going to be your loop counters.

What this code ends up looking like here is you have Q1, Q2, Q3, Q4. The results are printed. This is our innermost loop.

And then we do that four times against, excuse me, three times for each year. This is Year 1. This is Year 2. This is Year 3.

Moving on to the ArrayList class. Arrays and ArrayLists are two different things, but they have similar purposes. Arrays are not the only way to store lists of relevant data. An ArrayList is one of several list management classes that Java provides. And it comes with its own useful methods, like add, get, remove, indexOf. And these are all found in the Java documentation.

However, unlike arrays, an ArrayList can only store objects, not primitives. Here are some examples of that. Say we create an ArrayList to hold shirts. The variable for that will be shirts. And then we dot add and we're adding our object. We're adding shirt04. We can do that. Shirt is an object, and we're allowed to add objects to an ArrayList.

If we look at our second example, we're removing strings. And this is how you go about that. The name of the ArrayList, the dot operator, followed by the method that you want, remove. And we're removing a string. And yes, we can store strings in an ArrayList, because a string is an object.

Here's what you can't do. You can't store a primitive. 5, an integer, is a primitive. You're not allowed to do this.

What you can do, though, there is a work-around. You use the integer wrapper class. So a capital I Integer, create a new instance of that, that can be stored in an ArrayList. That's a way around it. That's OK. That's allowed.

There are benefits to ArrayLists that arrays don't offer. For instance, you can grow your ArrayList as you add elements to it. You can automatically shrink your ArrayList as you remove elements. It's dynamically being resized. Unlike an array, where you have to specify the actual size, you don't need to do that with the ArrayList, although you can if you want to.

How do you go about creating an ArrayList? Here's the syntax for that. You'd write ArrayList.

And then within what's called the diamond operator, you specify the type of objects that you want your ArrayList to contain. In this case, we want our ArrayList to contain a string, all strings. We have the name of our ArrayList. And then you type new ArrayList, like it's any other object.

And how do you go about calling methods from an ArrayList? Again, it's like any other object. We have our reference variable states dot size, size being a method for the ArrayList class. That works.

We could call states.get 49. What this does is it returns the 49th element in the ArrayList. And since ArrayLists contain only objects, these objects are going to have their own properties and behaviors. They're going to have their own fields and methods. So we can type the dot operator again and call whatever method we want, whatever public method we want that that object type would have, in this case length.

However, if you want to work with an ArrayList, you need to import java.util.ArrayList. If you forget to do this, NetBeans may remind you, which is great.

And I think the only other thing to be aware of is that an ArrayList may contain any object type, including a type that you have created as your own. If you write your own class, you can store that. It's not just the stuff that comes with Java, not just a string, not just the wrapper classes. If you create your own shirt class, you can store your own shirts in an array.

When it comes to working with ArrayLists, what do we have to do? First, as shown in Lines 1 and 2, just declare an ArrayList and specify what you want the ArrayList to contain. Then, like it's any other object with its own object reference, you type the object reference, followed by the dot operator and then the method you want to call.

Here we're adding objects. We're adding strings to the ArrayList. In Element 0, we're adding the name Jamie to our ArrayList. Line 5, we're adding Gustav to the ArrayList. And this will appear as Element 1, element at indice 1.

We add Alisa. That appears as 2. We add Jose. That'll be 3.

What we can also do, though, is when we're adding, the add method for ArrayList is overloaded, so we're also allowed to specify the indice where we want to add our object. So Line 8, what we're doing is we're adding Prashant as an object and we want that object to be located in the ArrayList indice 2.

We can also modify our ArrayList. We can do this by, for instance, removing elements. Here, Line 10, we're removing the element at the 0 index. In Line 11, we're removing the element-- clever. We're removing the element at the size minus 1.

So just like an array, the size or the length-- yeah, this is actually where it gets tricky. Length is for-- this is why I kept making the mistake too. Length is for arrays. Size is for ArrayLists.

But in both cases, it's going to be one more than the final element. So if our size is 5, that means our last element is actually going to be stored at indice 4, because our first element is actually going to be stored at indice 0. So here what we're saying is the size minus 1, which is going to get us the final element, the last element in this array list.

What you could also do, shown in Line 12, is you could specify the actual object that you want to remove. So here we're specifying Gustav. We want that removed.

And there's even more methods you can use with the ArrayList. The get method you may find handy. What this does is it returns the element at a specified position in the list.

So here we create our ArrayList. The reference variable for this is going to be names. We add a name Jamie. We add a name Gustav. Now we want to get that name, get whatever object is located at indice 0.

And the result of this is that we're printing Jamie. Why? Jamie was the first one added. It'll be located at indice 0.

Gustave was the second one added. It will be located at indice 1. We want what's at indice 0. We get the first thing we added, and that's Jamie.

You may also find the toArray method useful. That returns an Object array containing all elements of the list. Here's the code example for that.

Again, we create our ArrayList. We add our names. Then, this is the syntax for saving that ArrayList, converting it into an array.

Also what you need to do is be sure to cast the results here as a string array. So yes, you can cast primitives. You can also cast objects. So if you try to do this on your own and you're struggling to figure out, I definitely recommend referencing this slide here, because this has a syntax already worked out for you as far as how to use the toArray method goes.

One last method to cover is going to be contains. For the contains method, you provide it with an object being the reference type, object being anything in Java, any object, actually. And it will return true if the list contains the specified element.

So here we are again. We're creating our ArrayList. We add the name Jamie. We add the name Gustav. And then we want to see does names, the reference variable for our ArrayList, does this ArrayList contain the object, contain the name Damien. It doesn't, therefore this is going to return false. And the value of b, our Boolean, is going to be false.

That brings us to Practice 12-4, Working with ArrayLists. As you go through this practice, I think you'll find the previous slides are going to come in very handy, so I highly recommend referencing them if you get stuck. Good luck.

## 5. Lesson 12: Working with Arrays, Loops, and Dates, Part 5 - 4m

You finished practice 12-4, working with arrays, so that means in this lesson you have learned how to create a LocalDateTime object using the current date and time, how to parse the args array of the main method, understand how to nest a while loop, develop and nest a for loop, code and nest a do/while loop, and use the ArrayList to store and manipulate objects.

There are a couple things we'd like you to do before the next lesson. The first is play time. Try Java Puzzle Ball inheritance puzzles one, two, and three before the next lesson using inheritance. And as you play, I want you to think about what inheritance is, what that term could mean, what makes these inheritance puzzles.

And then we have one homework assignment, practice 12-5, iterating through data and working with LocalDateTime. In this practice, you're asked to enhance the soccer league application to create teams from a database of names-- and that means we will provide you a file which is going to be that database. It'll be a .java file-- and have all teams play each other. The program must also assign a date to each game and print the length of the season.

These features are best implemented by iterating through arrays and ArrayLists and using LocalDateTime, but it's up to you to figure out the implementation details. The practice also recommends that you consult the Java documentation on StringTokenizer and Period classes, which aren't discussed in this lecture. I'll pull that up in NetBeans for you to show you what the program does.

Here I've opened up playerdatabase.java. This has all the names that could be used within our program. When I go to run the program, I'll show you was changed since last time. Double click to expand. Looking at each game here, each game has a date associated with it. And at the beginning of the season, we're saying how long the league is scheduled for. Oh, and finally, we're also saying, here are the players that are being drawn from our database of players. Actually, I think I may have read a book by this guy.

See just consult the-- there's more information on what you need to do in the activity guide, so give that a read and good luck with this practice.

## 6. Practices for Lesson 12 - 20m

This Practice 12-1 is on declaring a LocalDateTime object. I hope you've given this a try on your own, but if you can't figure it out, if you've gotten tuck, this video will provide you with a walkthrough. The first thing we'll do is open the project Practice_12-1 or you could create your own for Java Main Class.

Two, declare a LocalDateTime object to hold the orderDate. Three, initialize the object to the current date and time by using the now() Static method of the class. Four, print the orderDate object with a suitable label.

Five, format order Date by using the ISO_LOCAL_DATE static constant field of the DateTimeFormatter class. Six, add the necessary package imports. And seven, print the formatted orderDate with a suitable label.

So I've already created a TestClass in NetBeans. So we can get started right here. The first thing we need to do is declare a LocalDateTime object. So let's do that. We'll have LocalDateTime. Call this orderDate.

And NetBeans is going to complain. Why is it complaining? Probability because I didn't import. Yeah, OK. I clicked here on the light bulb and here NetBeans suggestions, add import for LocalDateTime. OK, and we'll do that.

And there is our import statement up above right here. So let's keep going. Initialize the orderDate to the current date and time and then print it. So let's see-- orderDate. We have to initialize it-- capital D, capital D, capital D. There you go. Equals-- you have to do this using now-- LocalDateTime.now. No, not name-- now. There you go.

And then we want to print that-- s out, tab, orderDate. And I want to print out the orderDate. We'll see if that works. Yeah, there it is, down there. So that's working. Let's move on to the next part.

Format the orderDate using ISO_LOCAL_DATE and then print it. OK. So let's see-- String fDate. This is going to be a variable for our formatted date. I want to set that equal to orderDate, because we're going to take orderDate and we're going to format it.

And the format is going to be the DateTimeFormatter-- DateTimeFormatter.ISO. There's a lot of formats here. ISO_LOCAL_DATE. That's what we want. Now finally, we want to print that out-- s out print. Formatted order date-- that's going to be fDate.

Nah, but we have another complaint Did I forget to import something else? Yeah, I did. All right, and that works. Let's run it. OK, yeah. So that's correct.

Practice_12-2, parsing the Args array-- if you've tried this practice already on your own but have gotten stock or couldn't find a solution, this video will provide you with a walkthrough. The first thing you'll need to do is open the project Practice_12-2, array or create your own project with a Java Main Class named TestClass.

Two, parse the Args array to populate name and age fields. If args contained fewer than two elements, print a message telling the user that two args are required. And remember that the age argument will have to be converted into an int. And a hint to do that is use a Static method from the Integer class to convert it.

Three, print the name and age value with a suitable label. So I've gone ahead and created this practice already in NetBeans. Let's go and see if we can figure this one out.

What we need to do first is actually, I'll assign some args. So the way we do that is I go to right click on Windows the practice, go to Properties. Go to Run and then we'll enter in our arguments which are going to be, I'm assuming the first one is going to be name.

The second one is going to be age. So our first arg will be PirateDuke. His age, let's say 20 and then click OK. And remember, they're separated by spaces not commas. OK, so let's get started. If args.length-- I keep confusing length and size.

If the length is less than two, which means you don't have enough arguments provided, then we have to give a little error message saying hey, we need more arguments-- invalid arg list. Walk the plank. I'll put in a real one. It'll be there must be two arguments. It's OK to be playful but for an actual user, they won't know what walk the plank needs. So if I say there must be two arguments, that provides enough useful information to people.

Else the name variable is going to be set to args 0. And our age variable is going to be set to args 1, the second entry. Why is it complaining? Oh, it's complaining because we have to parse it. Right now it thinks we're assigning a string to an int. Yeah, we can't do that.

So what do we have to do first? We have to do, using the Integer Wrapper class, referencing the Static method parseInt. We really want to be sure to parse that int as a string. Did I spell something wrong here? What's going on? Yes, I added an r and then I didn't type the t. OK.

So that should work now. Now let's print it, see if this works right. The name is going to equal list name. And we'll add in our age. And then we insert the age variable. This should work. Let's run it. Yar-- name PirateDuke, age 20. Fantastic. We are done with this practice.

Practice 12-3 is processing an array of items. If you've given this a try on your own but have gotten stuck or couldn't find a solution, this video will provide you with a walkthrough. The first thing we need to do is open the project Practice_12-3. Then in a ShoppingCart class, code the displayTotal method. Use a standard for loop to iterate-- standard for loop-- to iterate through the Items array.

If the current item is out of stock, call this isOutOfStock method from the Item class. Skip to the next iteration of the loop. Then if it's not out of stock, add the item price to the total variable that you declare and initialize before the for loop. And finally, print the Shopping Cart total with a suitable label.

I have that in NetBeans. If we go to the Item class, there aren't any instructions in the Item class because all the work is already done for us. The Item class, it has its own fields. They're marked as private. It has its own constructor. It has the getters and setters for those fields. And it has a checkStock method.

Typically we'd query a database here. In the database we'd have information on what items are in and out of stock. But instead what we're going to do here is we're going to resort to mocking. We're going to mock up the process just using NetBeans, just using this class.

Going to the ShoppingCart class-- ShoppingCard.java-- we have to write our displayTotal method. So what do we do here? First, we have to create a total because I remember, one of the numbers said so. And at the very end, we have to print what the total is going to be. It'll be double total. And I'll set the initial value to 0. And then, we'll add stuff onto it.

Using the standard for loop, we're going to loop through our Items array up here. So for int i-- this will be our counter-- we're going to initialize our Counter variable with the value 0. And we'll keep looping as long as i is less than items.length. And at the end of each loop, we're going to take i and increment it by 1.

Add our curly braces and here's where we're going to put the body of our loop. Now we have to check to see if the item is on back order. Because of it's on back order, then we can't add it to our title. So that check would look like if item i-- sorry, it's items plural. If the Items array at index i doesn't exist or dot is on back order-- type the dot operator, is on back order. All right.

If it is on back order, what do we do? Well, so we don't want to count that as the total. Let me come back to this actually. Normally what we would want to happen is we want to have total is going to equal the total's previous value plus items one. I want to get the price-- getPrice. OK.

So we don't want this line to execute if it's on back order. So how do we tell the for loop to not do this line-- to go back and check the next items. That's done using the continue keyword. Let's try this-- see if it works.

Pants is on back order. All right, now I have to actually print out the total-- s out, Total in Shopping Cart. Then reference the total variable. Now it should be printing our total. There you go-- total in shopping cart 0.

Why is it saying 0? Because I typed a 1 instead of an i. So now every time we iterate through the loop, we're adding item 1 the wristband, which actually doesn't exist, OK, or it has a price of 0 that is. So we need to have that be i. Now let's try it. OK. yeah.

Now I see pants are on back order and the total in the shopping cart 25.6. That make sense. What happens if we run this program again? I think it's working right. I just want to check-- 25.6, 61.59, 25.6. Pants oh, and wristbands are a backorder now. OK.

So what's going on here? Well I'll take a look at Item class. I see. So it's ran. OK, this make sense. We're getting different numbers because we're randomly determining what's on back order, what's not; what's available to us, what's not.

All right. So that all makes sense. That means that our program is done. Everything seems to be working properly. That ends this practice.

This is Practice 12-4, working an array list. If you've tried this practice on your own and have gotten stuck, this video will provide you with a walkthrough. The first thing we have to do is open the project Practice_12-4, then create a string ArrayList with at least three elements.

Be sure to add the correct import statement and then print the ArrayList list to check our code. Three, add a new element to the middle of the list. And here's a hint to help us with that. Use the overloaded Add method that takes an index number as one of its arguments. And then print the list again to see the effect.

Four, test for a particular value in the ArrayList and remove it. Hint for that is to use the Contains method. It returns a Boolean and takes a single argument as the search criteria. And then finally, print the list again.

So I have Practice 12-4 open already in NetBeans. Let's navigate to that and try and figure this out. The first thing we need to do is create our ArrayList. ArrayList, and it's going to be an ArrayList of strings. We'll call it items-- equals new ArrayList.

And NetBeans will complain because I have to make an import Thank you NetBeans, for telling me where I need to make that import from. All right. Let's get to adding items to the ArrayList. We have to add a few items, at least three-- items.add.

What should we add? We'll add, since this is a shopping cart, I'll add in a shirt. Items.add, I'll add in wristband. And I'll add in items.add, I'll add pants-- no, great pants.

And then what we need to do is if you want to print all the items in this ArrayList, we'll do system.out.println and we'll print the items. Let's see what we get now as a result. All right. We've got our shirt, our wristband, and some great pants.

The next thing we'll do is we'll add in item. We'll add items.add. And we need to specify the indice where we want to add it. So add it in the middle. At 2, add in a belt. It didn't print out the ArrayList, so print out items. All right. Yeah, here's 0, here's 1, here's 2. Belt is added there. All right.

So then there's one more thing we got to do. The next part is check for the existence of a specific string element. If there is, we have to remove it. Let's check to see. I don't know if there is some shirt in there.

So if items, if it contains, what kind of object do you to check-- for shirt? We'll check for this object, the shirt string. If it's there, then we have to remove it, which is items.remove. Remove the shirt and test to see if this works.

So we have our print statement. We'll print out our Items array. So there should be no shirt in the last one. And there is no shirt. Perfect. That's the end of this practice.

## 7. Skill Check: Working with Arrays, Loops, and Dates - Score 80% or higher to pass

Skill Check: Working with Arrays, Loops, and Dates

View Skill Check


