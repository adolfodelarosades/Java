# 5. Arrays, Conditions, and Loops

### Description

Make decisions using if/else, store multiple elements in an array and perform iteration using loops.

## Title and Objectives 

Java Basics-- Arrays, Conditions, and Loops. In this module, we're going to take a look at creating a simple if/else statement to make a decision, describing the purpose of an array, declaring and initializing a string or an int array, accessing the elements of an array, explaining the purpose of loops, and iterate through arrays by using for and for each loops.

## Flow Control

Controlling program flow. One of the things we need to do in computer programs is to control the flow of logic, that is how the program executes. One way to do that is with an if/else statement, which can make a decision. Using the if statement, we can evaluate a condition, and if the condition is true we would take whatever programmed action that we have.

Optionally, we can also have an else condition so if the condition being tested is false, we would do the else block. This is optional and not required. But typically, you'll see both an if and an else together.

We use our conditional operators in order to help write the conditional expressions. For example, we can use the logical AND, OR, and NOT. AND says if both conditions are true then the whole expression is true, if any part is false then the entire expression is false. OR says if any part of the expression is true, the entire expression is true.

For example, here int i equals 2, j equals 8. If i less than 1 AND j greater than 6. Well, i is not less than 1, 2 is not less than 1, although j is greater than 6. So in this case, it would evaluate to false.

If, however, let's say that it said i greater than 1. Then it would have been true. That would have been true, and the j greater than 6 would have been true.

Looking at the OR, again, i is 2, j is 8, and with the same expression, if i is less than 1 OR j is greater than 10. Now, in this case, again, i is not less than 1, and also j is not greater than 10. So both conditions are false, and the entire expression is false.

And lastly, we can use the exclamation point or bang symbol to represent NOT or inversion. For example, if i is equal to 2, we can say if NOT i less than 3. So again, we evaluate in a parentheses first, i less than 3. i is 2, less than 3 is true. If we then NOT the true, it converts it or inverts it to a false.

For example, here we have a number of attendees. The number of attendees are 4. And we have a Boolean, largeVenue equals false. Is this going to be a large venue needed or not? And we have a fee of 42. So we can write an if statement that says, if the attendees, which is the number of attendees, is greater than or equal to 5 AND the fee is greater than 25, then large venue equals true, and we would generate a largeVenue.

Now, we can also say else largeVenue equal false. However, logically that's not necessary, because largeVenue is already false. So if largeVenue is greater than 5 and greater than 25, we set largeVenue to true. Otherwise, it remains false and we don't have to execute this remaining code.

Another way to do it is actually part of an assignment. So we can actually put everything in a parentheses on the right hand side of an equals, and it acts just like it was in an if. It will return a Boolean true or false. Remember, largeVenue is Boolean and must accept true or false only. So here we have attendees greater than or equal to 5 and fee greater than 25-- either true or false.

There is another shorthand expression for if/else, and that's what's called the ternary condition operator. If the condition is true, assign the value of value1 to the result. Otherwise, assign the value value2. Now, this is for a narrow range of cases but can be very helpful when you have simple if/else statements.

So here we have if x equal 2, y equals 5, z equals 0, and the syntax is, what's the condition we're testing, question mark, if it's true return the value in value1, else return the value in value2-- very useful when you have to select one or two values. So how would this look in an if/else?

Well, we could write it as if y less than x-- here's our curly brace-- z is equal to x in that case, else z is equal to y. So we want to set z either equal to x or y depending on the value. So if y is less than x, then we're going to assign x to z. Otherwise, we're going to assign y to z. The equivalent construct would be to have the test here-- y less than x-- and if true, return x to be assigned to z. Otherwise, return y.

Another way to handle flow of control is with a switch statement, which basically allows us to write an easier to read, easier to maintain set of if statements. So here we have double price equals 1.99, double discount equals 0, string condition equals used. Now, let's go to our switch statement and test the condition.

And if the condition is damaged, then we'll set discount equal to price times 0.1 and then break out of our switch. If the condition is used, we'll set the discount to price times 0.2 and then we'll break out. Otherwise, if it's neither, we'll just set the discount equal to the price.

Quiz time. All right. What is the purpose of an else block in an if/else statement? Think about that, put this on pause, and when you're ready, resume and see the answer.

Correct answer is B. The purpose of the else block in an if/else block is to contain code that is executed when the expression in an if statement is false. It doesn't contain the remainder of the code for the method, and it doesn't test that the expression is false. It's not testing. It's simply being executed when the if is false. The if does the test, the else does not.

We have an exercise for you using switch statements. You'll start by adding a string property called size to the Customer class. Name of the property will be size, property type will be string. You'll use the Customer in the main method of the ShopApp class.

In the main method of the ShopApp class, set the size property for the Customer Pinky. Place this logic immediately after the initialization of the customer name. Set the customer size to be S for small. Then create a measurement variable of type int and set it to the value of 3. Lastly, add the switch statement that derives a customer's size based on a measurement value.

As always, use your best effort to write the code from based on what you've seen in the lesson and seen so far. And if you get stuck, feel free to look at the solution.

## Flow Control Demo

Exercise 4-1, using the switch statement. In this exercise, we'll add a string property called size to the customer class. We'll use a customer in the main method of the ShopApp. In the main method of the Shop class, we'll set the size property for the customer Pinky. We'll place this logic after the initialization of the customer name, and we'll set the customer size to be "S."

We'll create a measurement variable of type int and set it to the value of 3. We'll add a switch statement that derives the customer size based on a measurement value. In case measurement value is 1, 2, or 3, the size will be "S." If it's 4, 5, or 6, it'll be "M." 7, 8, 9-- it'll be "L" for large. And in all other cases, the size of the customer should be "X." Let's get started.

First, we're going to add a string property called size to the customer class. So off we go to the customer class, and we'll add a string size. Now, we're doing this for convenience and also because this is an introductory course, and we're not covering all the various topics. But there are better ways of testing whether something is a specific value than doing a string comparison.

While a string works, it does come along with a number of problems. In the Java programming complete course, you'll see how to use enumerations, which allow you to create predefined values, if you will, that can be tested. They're not just plain strings. But in this case, string size works fine.

All right. In the customer main, we're going to set the size property for the customer Pinky and set the customer size to be "S." So back we go. Here's our ShopApp. Here's c1 name, Pinky. So now we can do c1 dot, and size should be there. And we'll say size equal "S." There we go. We set the size. We'll create a measurement variable of type int and set it to a value of 3. Actually, I'll put it down here at the bottom. And that-- let's see-- measurement is an int. And it gets the value 3.

All right. Now add a switch statement that derives a customer size based on the measurement value. OK. So we need a switch statement. Now, if you don't remember how the switch statement works, you can certainly go back and look at an example. And there are examples of all of this in the course notes. So we need to do a switch on measurement. Remember, the thing being tested is inside of the parentheses.

We start our block, and our first case statement will be case. And let's see. I think we said-- now, for the case statement, if we go back to our exercise, it says, in case measurement value is 1, 2, or 3. OK. So if measurement value is case 1, 2, 3-- and looking back, we're going to see that we have case, then what we're testing on, then a colon, then the code, and then break to get out. So case 1, 2, 3, colon. Then we have our block.

And so we said in the code that we want to set customer size to "S." So we can do c1.size equals "S", and then break. Remember, we need to do a break at the end. There's an equal sign that I'm missing. There we go. Next up, we want case 4, 5, 6, colon, and then c1.size equals "M," and then break. And we'll reformat this to make it look a bit better. If we come down here to Format, it'll indent things nicely for us.

Then we can come down to case-- and notice how it moves it for me as well. Nice-- 7, 8, 9, and c1.size equals large. All right. And then there's our break. And then the last one is default. So if we go back for a second and look at it, you can see default at the very bottom here. So in default-- so we've got to spell it correctly-- then we said c1.size equals "X."

And that should compile. It should be the end of the block, which it is. Let's just clean that up a little bit, reformat. And there we go. Notice that means you can click the starting and ending curly brace to tell you where you are. And that looks like everything we need to do. All right. Perfect. All right. That completes exercise 4-1.

## Arrays

In this module, we'll take a look at working with arrays. An array is a way to manipulate multiple values or objects programmatically. For example, an array will hold a number of different objects, as you see here, each one at a different index.

So for example, we can see here that at index 0, which is an int, we have a string object with the value Shirt. At index 1, we have a string object with the value Jacket. And at index 2, we have a string with a value of Scarf.

There are actually three elements in the array. The first element index is 0. The last one is 2.

If we didn't have an array and we wanted to create multiple items, we would have to create item one, item two, item three. And if you're working with tens or hundreds or thousands of different items, which is certainly possible in large scale applications, that doesn't really scale. And it doesn't really work.

This is where an array comes in, because we can store the items in the array and then programmatically address or reference each item as we want to using a loop and using a variable. So here, we see that we're going to create an array. And we're going to see the syntax for it uses these square brackets to define the fact that we're going to create an array of strings called items.

So we can create arrays of primitives, like an array of ints that you see here on the left. Or we can create arrays of objects, as you see here on the right. They look fairly similar, but they are actually different.

With the int, the int is stored actually at the index value, whereas in the case of the object, Mary is actually an object. And we can reference that object. And we can call methods on it. Remember, we can't use methods with primitives.

Now, to create an array of strings, we would say we want an array of strings. And the square brackets indicate it will be an array. We have a variable name for it.

And in this case, it's plural. Because typically, arrays hold multiple things. So the names for the array should be plural. And we're going to assign it the value Mary, Bob, and Pinky, which causes three string objects to be created, one with Mary value, one with Bob value, one with Pinky value, and assign that to the array.

In the integer case, we can just simply put in the integer values, 25, 27, and 48. That declares the array and actually sets it up to be an array of ints and called ages and puts the values in.

Now, to use these, we can reference them a couple different ways. Here, for example, we can create a new integer array. We want an integer array that will be empty with three elements.

So new is the keyword that creates new objects. Now, I know I said that the array contains primitives, and that's correct. In this case, the array here contains primitives. But the array itself, the structure in Java that holds the primitives, is an object itself. And I know that sounds odd, but that is how it is.

So we are going to create an array here, an array of ints called ages. But we're not, at the time that we declare it, give it any values. We would give it values later.

So to do that, we simply tell the computer and the Java virtual machine we want a new integer array with the size of three elements. Then later, we can assign the values to those elements by simply referencing them in the index.

We use the name of the array, square bracket, the index value, close the bracket, and then assign it a value. This puts 19 into index of 0, 42 into index of 1, and 92 into index of 2. We can do the same thing with strings.

Here, we have a string array called names1. And it's now equal to a new string array of size three. This creates a string array of size three, and we can assign Mary, Bob, and Pinky.

Now, if you happen to know what the values are that you want to put into the array at the time you create the array, you can declare, initialize, and populate the array at the same time. Not all that often, it really depends on the nature of the application. But it is possible.

So again, int array ages2 is equal to 19, 42, and 92. It does the exact same thing as this code for ages1 at the top. And string array names2 equal to Mary, Bob, and Pinky does the exact same thing as this does.

The difference is we declared the array first, which set it up in memory. Then we could access the values later on. Here, it creates the array assigns values at the same time.

Now, you might be thinking, well, why wouldn't you do that always? What if you're reading these values from a database? You know you're going to read three values. You don't know what they are. You would need to declare the names array first, then start reading the values from the database.

So we can use the values from the ages array as well. Here, we're creating again an integer array called ages with the values 25, 27, 48. And now, we can reference a value, ages of 0. That's how we say it. Ages sub 0 or ages index of 0 would be the value 25, and that would be stored in my age.

So we can use array values like we would any variable. We can even do math with it. Here, we can say ages of 0, which is 25, returns the value 25. And we add 10 to that, and that gives us the value 35. So much older would get the value 35.

We can also use values from the names array, very similar way. Here, we see, for example, we have the string array names gets Mary, Bob, and Pinky. And then we create a string name variable, and we assign the value from names of 0.

What do you think name would take? Well, name sub 0 is Mary, and so name would get the value Mary. We could also go to names sub 0 and ask for its length.

So name sub 0 is a string object, Mary. And we are sending it the message or asking it, what is your length? And it's responding, in this case, with the value 4, 1, 2, 3, 4. The length is 4.

Yes, the first element in the letter in the word Mary is 0, but there are 4 letters in the word. And that's the length. And that would come back as the length.

Then if we wanted to change the actual value names of 2 and make that Brain, we would go ahead and do that. Now, if you think that would change Bob to Brain, you'd be wrong. Because, remember, Mary is index 0. Bob is index 1. Pinky is index 2.

This is saying, go to the names array at index 2 and replace whatever is there with the value Brain. We would end up with Mary, Bob, and Brain.

Now, you've seen the main method, and you've seen that there's an array of strings in the main method. And this allows us, when executing at the command line, to type in arguments that we can then receive into our program code. So here, we have an ArgsTest class. And we're going to pass in two values, hello world.

The first parameter would be hello. Second parameter would be world. And we want to print that out. So the code for this looks like this. Here's our public class ArgsTest.

It has a main method, which takes a string array called args. And you can actually call it anything you want. The convention is to call it args, short for arguments.

Then we can simply say System.out.println first parameter and then args sub 0. Arg of 0 would be hello. And second parameter args of 1 would be world.

And so we can easily print out those arguments. Now, of course, the benefit of this is you can pass parameters and commands to your programs at the command line. Not something we really see all that much anymore, because, again, most of the Java being done today is all back end running inside of containers and application servers.

OK, quiz time, why does the following code fail to compile, integer array lengths is equal to 2 comma 4 comma 3.5 comma 0 comma 40.04. Pause the video, think about that, and resume for the answer.

Well, it doesn't compile, because the array was declared to hold int values, int array called lengths, but double values are not allowed. So 3.5 and 40.04 are not allowed. 2, 4, and 0 are fine.

OK, one more quiz question, given the following array declaration, which statements are true? Choose all that apply. Integer array class size equals 5, 8, 0, 14, 194. Think about that, pause the video, and resume when you're ready.

The answer is A, C, and D are true. A is true, because class size of 0 is the reference to the first element in the array. Class size has 1, 2, 3, 4, 5 elements. Element 0 is the value 5 here.

Class size 5 is a reference to the last element in the array. That's not true. The last element, in the array is 0, 1, 2, 3, 4. So class size of 4 is the reference to the last element in the array.

It is true the length of the array is 5, but the index value only goes up to 4, because of the 0. There are 5 integers in the class size array. That is correct.

classSize.length is equal to 5. That is correct as well. How did you do?

We have an exercise for you using an array. You'll create an array of clothing objects, and you'll populate it using existing clothing object references that you already have. This array should be added to the main method of the ShopApp class, and you'll then declare and initialize a variable called items.

You'll have a clothing array, an array of clothing items. And it'll be called items. This code should be placed after the existing clothing items are created and before the code that does the total calculation.

As always, please try to write the code and get it to work on your own using what you've seen in the course. And if you can't or if you're getting stuck, feel free to look at the solution. Thank you.

## Arrays Demo

Exercise 4-2, using an array. We're going to create an array of clothing objects, and populate it using the existing clothing object references called item 1 and item 2. This array will be added to the main method, and we'll declare and initialize a variable called items of the different items from the clothing array. We'll place this code after the existing clothing items are created, but before the code that does a total calculation.

So what that means is coming down here and finding our main, which is right here, and where we create our clothing items, item 1 and item 2. So here, we can simply paste in a line of code. We want a clothing array, square braces, called Items. And we'll set it equal to item 1, comma item 2.

This declares the array, initializes it with those two object references. And we're all set. That's all we have to do. That's declared the array.

By the way, while we're here, I want to talk about something. If you look further down on the page-- and you might have noticed this-- my CASE statement is throwing an error. Actually, what it's telling me is that I'm using a new feature that's due out in Java where you can actually have multiple case labels, like case 1, case 2, case 3, and you don't have to keep repeating the word case.

So the new syntax that's coming out can be written as case 4, comma 5, comma 6, but currently, the way to write it is case 1 colon, case 2 colon, case 3. So I'll rewrite these so that they're correct. I shouldn't be using features that are in preview mode and are not out yet.

So the way Java gets released is that there are interim releases with new features that are tested and tried. And then there is a production release that comes out later. Notice I'm doing a Save. And that's doing the compile. And that's what's getting me the case issues.

So case colon, case colon. let's see. So case 7, case 8, case 9. Do I have it right?

Let's see. Case 7 colon, case-- oop. There we go. Just got back a little bit. Case 8-- 8 colon, and 9 colon.

Save. Looks great. OK. Now it's fine. It compiled. Everything works correctly.

As I said, that's the current older form of switch. And coming in Java-- I want to say Java 14-- we'll see that we can have the commas. It does compile and you can actually make NetBeans work with it, but I didn't want to-- I don't want to have red lines in my code. OK. So with that, then that completes exercise 4-2.

## Loops

In this module, we'll learn about loops and iteration. Previously, we talked about controlling program flow with if-else and switch statements. In addition to making decisions, we can also repeat blocks of statements repeatedly, called iteration. We use loops for this in our computer programs.

Loops are used then to loop and repeat a block of statements until an expression is false. As long as the expression is true, the loop keeps executing. For example, reading records from a file, process reading all records until there are no more.

You read the first record. Are there more? Yes, read the next one. Are there more? Yes, read the next one. Are there more? No, stop.

For a specific number of times, we can process each element of an array. So, with loops, we can run the loop until an expression is false, or we can run the loop a specific number of times. So we could run the loop 10 times or four times. And, when we run the loop, we can use the loop to figure out what part of the array we want to reference.

This is really the power of arrays, and it addresses the point I made when we said arrays can be addressed programmatically using variables. And that occurs within loops and can occur within loops. It could occur other places too, but, primarily, within loops.

OK, so what does this look like? Well, at a pseudocode kind of level, this is saying while we're not there yet, so while this expression is true, enter the body of the loop. Do something like read a book, argue with the sibling, ask are we there yet. And this kind of a joke, right? Are we there yet? Are we there yet? We were trying to show you a way to get the idea of what a while loop does.

So the while tests the condition. And, while it's true, the loop keeps executing. So are we not there yet? Nope, we're not there yet. So we read a book, argue with the sibling, ask are we there yet, get to the bottom of the loop, go back up, and start again. Are we there yet? Nope.

At some point, something in here would, no doubt, say that we are there. And, once we got there, then notThereYet is false. And, as soon as that is determined false, we drop out of the loop, go to the next line of code, and now, woohoo, we get out of the car.

OK, let's see types of loops. A while loop repeats while a Boolean expression is true and is very good when you don't know how many times you want to loop or if conditions change while the loop is executing, or there's multiple conditions you need to test. Maybe you want to loop while there are more records, and the highest total in a record is less than a certain amount, something like that.

A do-while loop executes at least once and tests at the bottom of the loop. So the while loop tests first. And, if the test is true, they enter the body of the loop. If the loop tests false, we never enter the loop.

This is why you see while loops used a lot more in programming than do-while loops, especially in business-type programming, because, typically, you've got to see did-- if I go to read a record to process it, did I get a record? If there were no records in the file, and you started processing the while loop, and there was no records there, it would throw an exception.

A for loop is used when we want to repeat the loop a set number of times. Now that set number of times could be an absolute value like 10 or 9, or it could be based on a variable or an expression or a calculation, but it will loop a certain number of times.

A for-each loop is a special enhanced version of the for loop, which automatically iterates through a collection of values. Now I know you might be thinking what collection of values. What are you talking about? That's what an array is. Remember, an array is a collection of values.

So now, using a for-each loop, we can simply and easily iterate through that collection, doing things to each element. The for and for-each loops are covered in this course. To learn about while and do-while, you'll come back and take the Java programming complete in the Java learning subscription.

OK, the standard for loop repeats its code block a set number of times using a counter. The basic syntax is for, and, I mean, it's really doing a test. So it appears in parentheses because it is doing a Boolean test. It initializes the variable i as an integer value with a value of 1. Then we have a semicolon.

It's going to test whether i is less than 5. And it does that at the start of the loop and then at each iteration. And then, at the end of each iteration, it's going to add 1 to i, i++.

So it's going to start out. i gets set to 1. Is i less than 5? Yes, 1 is less than 5. So we enter the body of the loop. We print out i is 1 and a space. And that's what you see-- i is 1 and a space.

And then let's see where the comma is. We don't see the comma in here. I think we might've left the comma off, but the comma wouldn't be there like that without actually putting it in. Java won't put a comma in there without us telling it to.

So I think we're supposed have a comma here at the end. We left that off. Hopefully, some of you caught that. That'd be really good.

OK, we get to the bottom of the for loop. Go back up to the for loop. Now i++ occurs, and i now goes to 2. It's tested again. Is 2 less than 5? Yes, it is. So we enter the body of the loop, print i. i is now 2 and then 3 and 4.

Now, when we get here, and we increment i++, and it becomes 5, then i 5 is not less than 5, right? 5 is not less than 5. And so we would simply exit the body of the loop.

So, a standard for loop now compared to an enhanced for loop, what if we wanted to loop through the names and just print them out? We have an array of names, and I just want to print them out. Using the standard for loop, I would have to declare the idx to be 0, test if idx is less than names.length, the length of the array, which would be 3, and then idx++, and then print out names(idx). And that is how we did it for a very long time in Java.

When the enhanced for loop was introduced into Java, it helped a lot because all I have to do is say, what am I looping through? Names-- that's the array I'm looping through. That's the collection of the elements I'm looping through.

What's the type of elements? They're all strings. How do I know? Because it says String array called names. So, therefore, it must be a string.

And now I can use any variable I want here. We use name. And I know it kind of seems a little confusing, but it could be x or y or my name or the name or whatever. The point is you need a variable to hold the value that's currently being iterated over.

So the way this works is we start with names, and the code will look at the names array and say are there more elements in the array. Well, the first time into the loop, of course, there are. We're looking at Mary. So we print out System.out.println. Name is going to have the value of Mary, and we print out Mary.

Bottom of the loop, back to the top, we now go to the next element, which is Bob. name takes the value Bob. There are more names in the array, and so we print out Bob. Go to the bottom of the loop, back up here, now name takes on the value Pinky. We print out System.out.println(name), get to the bottom of the loop, come back.

We have now looped through the entire array. We're done, and we exit the loop. All of that is done for you automatically. So, truthfully, I haven't written a for loop to manipulate a collection in a very long time. I do it all through the for-each loop.

All right, now break is a way of terminating the loop when there's no need to proceed because, sometimes, you're in a loop, and let's say you're searching for something. And the algorithm or the formula that you're using or steps you're using is, OK, as soon as I find something, stop. Search this array. Find something. Stop.

Well, knowing what we know about the for loop, it's going to automatically go through every single element, and we don't need to do that. So here we're going to set an integer value of a passmark is 12. We've got to have at least the value 12.

We'll set the boolean value of passed to be false. At this point, nobody has passed. And we're going to see did anybody pass the test. At least one person passed.

So we have an integer array called scores with the values 4, 6, 2, 8, 12, 35, and 9. Then we enter our enhanced for loop, for-each loop. We have our integer unitScore because it's an array of ints.

So we have unitScore, which will be the int. scores is the name of the array. We're going to loop through it. unitScore takes the value 4. Is unitScore greater than or equal to 12? No, so it's not. So we don't do the if statement.

We go to the bottom of the loop, back up here. Now unitScore gets a value of 6, OK? Into the if test, is unitScore 6 greater than or equal to 12? No, so we don't execute the if statement. And we keep doing this through 2 and 8, and then unitScore becomes 12.

Now we do the if test. If unitScore is greater than or equal to 12, which it is, we said passed equal to true. And now we can stop. We don't need to look at 35 and 9, and we break.

Break breaks us out of the loop, and we can print out "At least one passed?" And we can say true. So the output, "At least one passed?", will show the value true.

OK, quiz for you, here we have an integer array called sizes with 4, 18, 5, and 20. We create a for loop, a for-each loop, of integer size with sizes. And, if size is greater than 16, then break.

Now what would the output be if you ran this code? Think about it. Pause the display. And, when you're ready, you can resume.

The answer actually is a, and let's see why that is. So we have integer sizes array 4, 18, 5, and 20. We enter the enhanced for loop. I call it for-each, but enhanced for loop. And size takes on the value 4 because that's the first element in the sizes array.

If size is greater than 16, then break. Hmm, well, it's not because 4 is not greater than 16. So we don't break, and we go to the next line of code.

Now be careful here. Some of you might have gotten confused and missed the fact that there's a curly brace here, which defines-- oops, sorry about that-- a curly brace, which defines the actual statement. That's the end of the statement, and that's the end of the if statement. And there is no else.

So you're going to be printing out System.out.println as long as that loop is running, no matter what. So, when size is the value 4, and it's not greater than 16, we don't break. So we drop down to the next line. We print out size, and size is 4. And there's our comma. So we see size colon 4 comma.

But wait. We now go back into the loop. int size takes the value 18. You can see what's coming. We drop into the if statement, if size is greater than 16. And it is. 18 is greater than 16.

So now we execute the break, and that breaks us out of the loop. And we don't print anything else. So the answer is a.

OK, we have an exercise using a loop to process an array. You're going to remove code that calculates the total. You'll retain the declaration of the total variable and the code that prints the total value. You'll place comments on the existing lines of code that calculate the total and ensure that you still have the total variable declared and set its value to 0.

Then iterate through this array, and calculate the total cost of all items including tax. So you went from hard-coding the total value to actually doing it in a loop. Create a for-each loop that iterates through all items in the Clothing array that you created previously and calculates the running total price for these items including tax. Then remove code that prints details of individual clothing objects. In a loop, print the details of each clothing object, and place this code inside the loop before the total value calculation.

So what you're doing is you're removing the line by line, individually working with individual items, and moving to you working with an array. Although, you're still doing the same basic thing. You're still calculating the total. You're still printing them out and the details, et cetera.

We also have an exercise for you using an if statement to control flow. Here you'll change the calculation of total value to only include those clothing items that match customer's size. So you're going to have to test whether or not the clothing item that you're looping through and iterating through matches a customer's size. You'll place this if code inside the loop before the total calculation because you have to see whether you going to do the total calculation or not, based on the if statement.

You'll add an if condition that checks if the customer size is the same as the clothing size. You should only print information and calculate total for those items where the customer size is equal to the clothing size. Then add two more items to the clothing array.

Add two variables of type clothing to the main method of the ShopApp class. Initialize these variables to reference two new clothing objects. Then set the description, price, and size properties as "Green Scarf" for the description, 5 for the price, "S" for size, and "Blue T-Shirt," 10.5, and "S" for those properties for the second item. Then add these items to the clothing array. Change the logic in the for-each loop to exit the loop when your total is greater than 15.

As always, please try to write the code based on what you've learned in the module. And, if you need help or need guidance or get stuck, of course, feel free to look at the solution. Thank you.

## Loops Demo 1

Exercise 4-3, Using a Loop to Process an Array-- in this exercise, we'll remove the code that calculates the total, but we'll keep the declaration of the total variable and the code the prints the total value, and we'll place comments on the existing lines of code to calculate the total. And we'll ensure that we still have the total variable declared, and we'll set its value to 0.

Then we're going to iterate through the array and calculate the total cost of all items including tax. We'll create a for-each loop that iterates through all the items in the Clothing array, gets the total, gets the price, and adds that into the running total for the price. We'll remove code that print details of individual clothing objects. And in a loop, we'll print details of each clothing object. We'll place this code inside the loop before the total value calculation.

So first, we retain the declaration of the total variable and the code that prints the total value. So, what that means is, this is the code that's doing the calculation, but we're going to keep this line here. So we're going to keep the total. And I'm going to split these out so it's a little bit easier to see. I was just showing earlier that you could do it this way. But now, as we go through, it gets a bit harder to read.

And place comments on the existing lines, which we did, and ensure the total variable is declared and set it to 0. And that's what we have. It's declared and set to 0, and I've commented out the line that does the calculation.

Iterate through the array and calculate the total cost. So to iterate through an array, what we need to do is, we need to do a for loop. So we're going to come down here outside of our switch statement. And we'll do a for.

And now, the name of the array-- I always start with the name of the array, which in our case is items. Then I back my way into it. I'm going to use an item called item-- oop, colon. And then I need the type of item. The type of item is Clothing. So items is an array of clothing items. Item will be the iterator, and so, clothing is the type.

So now we've got Clothing of type item with items. And now we've put in our curly brace. And now we want to iterate through all the items in the Clothing array and calculate the running total price.

All right, so a running total is the total equal to itself plus whatever you're adding to it. So total will be equal to-- and by the way, I can do a plus equals as well, though I'm not going to-- is equal to total plus. And now, as we loop through, I want Item dot.

And what do we want to retrieve from the Item? We want the price. So what this is going to do is, as it loops through the Items array, it's going to grab the price of the item. The first item will be "Blue Jacket." The second item will be "Orange T-Shirt." We should end up with something pretty close to about-- what is that? 30-- 31.4, something like that. That will give us a total for the price.

And then it wants us to remove code that prints details of the individual clothing objects. And so, that would be this one and this one. And by the way, you can use this little guy up here that says Comment. It will comment the line for you, very handy.

In a loop, print the details of each clothing object. Now, notice it's not actually telling us to print the total, though you can do that if you want. And I will go ahead and do that right after that. So I'll do system out. And actually, I'm going to move that total. It is already set up, I'm just going to move it. So I'm going to take this one and move it, select it, and put it down here.

And let's see, do our format-- nice, and then run it. Total 31.4-- that's about what we planned. So it looks like that's working correctly.

And then it wants a second loop to print the details of each clothing object. Place this code inside the loop before the total value calculation. So, this is another loop. And so, we'll do a for. And we're going to, again, we want to loop through each clothing object. So we are going to loop through the array.

Now, technically we could have done it up here. We could have printed it as part of the price. I'm just doing it separately just see another array, although we don't actually need it-- item of type items. Actually, this can be very repetitious to create a brand new loop. I'm simply going to put it here.

And so, now, I'm going to do System.out.println. And we'll say item. And that will be item-- I'm sorry, that will be, right, that will be the item itself that we're iterating through. And we want to print the details of each clothing object.

So what I'm going to do is, I'm going to actually take this line of code, and copy it, and replace this line with it. Because what I want to do is, I want that comma delimited output. But we don't know which item it is. It's going to do item plus. And then it's going to give us the item's description. Because item is the iterator that we're using. So as the item changes, we'll get a different line printed.

Let's see, what did I mess up? No semicolon at the end, and you can tell because you look at it, it says no semicolon. All right, there we go. Now, if we run it, we should see the two items are printed, and the total is printed, and we're good. So it does everything we're supposed to do. We have the print outline, we have the total, and we're printing the total at the end. And that completes Exercise 4-3.

## Loops Demo 2

Exercise 4-4-- Using if Statements to Control Flow. We'll change the calculation of total value to only include those clothing items that match the customer's size. We'll place this code inside the loop before the total calculation. We'll add an if condition that checks if the customer size is the same as the clothing size and only print information and calculate total for such items.

Then we'll add two more items to the clothing array. So we'll add two variables of type Clothing to the main method. We'll initialize those variables, one for green scarf, one for blue t-shirt. We'll add them to the Clothing array. And then we'll change the logic in the for-each loop to exit the loop when the total is greater than 15.

All right. So let's first go change the calculation of the total value. So where we're going to place this code inside the loop, we're going to write an if condition that checks if the customer size is the same as the clothing size. So over we go to our code.

And now we're going to put this in the loop here. So before we do-- let's see. So before the total value calculation. So in other words, if the clothing size doesn't matter, it doesn't get added to the total price.

If-- there is our test. And we want to say our customer in this case-- we do have a customer-- so we have one customer c1. So if c1 dot-- and since we want the size, and the size is a string, we're going to call the equals method on the string. Strings we use equals with to tell if one thing is equal to another.

Now, what it's going to be equal to is item.size. We need to test to see if c1-- I'll put in some space here-- if c1's, the customer's size, is equal to the item size, in that case then what we want to do is we want to-- checks if the customer size is equal. Only print information and calculate total for such items.

So if true, we're going to take both these lines of code and simply move them up into the if statement. We'll reformat so it's easier to read. And now we can see clearly that the for loop has an if statement. So for each item that we loop through, we're going to ask, is the customer's size equal to that item's size?

If it is, we add the item price to the total. And we print out the item description and the price and the size. OK. So let's see. Let's go ahead and run this and see what we get. Right-click and Run.

And sure enough, only one shirt-- or it comes back where the shirt size matches the customer's size. Remember, the customer size in this case is small, and we only have one shirt that's small, the orange t-shirt. But that is correct, and it prints out correctly.

Next, add two more items to the Clothing array-- one for green scarf and one for blue shirt. All right. Now I'm going to show you a couple ways to do this. But one way to do it is to take our Clothing array, which is called items. And we know we want to add an item to that array.

So now what we're going to do is back off this a little bit. I can't put it here, because items has already been created. Instead what I'm going to do is do this part of the creation up here.

So I'm actually going to go in here and do new and Clothing. Now I'm giving my third Clothing object. And new Clothing, now I'm giving my fourth Clothing object. So now I have four Clothing objects.

Although item1 and item2 have been set, now we need to set the values for item-- for basically the third and the fourth item. Now, it says the third one is green scarf, 5, and small.

So in this case, we will access the items of-- now, what would the index be? If this is 0, 1, this would be 2. So items of 2-- and there's the description. See, it looks it up and says, oh, you're an item. So it has a description. And that description is going to be green scarf.

And items sub 2 dot price will be 5. And items sub 2 dot size will be equal to small. So I'm doing this to let you see how easy it is to access variables or access parts of an object that's in an array, in this case the Clothing object.

And now for that other items I'm just going to copy the code. And that will be items sub 3. Now, I know you're looking at this and saying, but wait a minute, there are four items. How can that be sub index of 3? Because remember, the first index element is 0-- 0, 1, 2, and 3.

So this one should be a blue t-shirt, 10.5. 10.5. Let's see. There we go. And I believe, small. All right. Now, if we run this again we should now get a different output.

And we do. We have our orange scarf, we have our green scarf, and we have our blue t-shirt. Those are all small. And notice the total changes to reflect it.

OK. So we did that. We changed the logic in the for loop to exit the loop when the total is greater than 15. Let's add that.

So here is our loop. And so now we come down to our total. And I would say you want to print it if you get the total. But then I would say, if total greater than 15, curly brace, break. And that'll break me out of the loop as soon as we get past that.

So let's see. Let's run it this time. And we only get 2 this time, because we hit first 15.5 on the total. 10.5 plus 5 is 15.5. We're greater than 15, and we break out of the loop and print the final total. And with that, that completes this live exercise, exercise 4-4.

## Summary

You learned to create a simple if/else statement, describe the purpose of an array, declare and initialize a string or int array, access the elements of an array, explain the purpose of loops, and iterate through arrays using for and for each loops.
