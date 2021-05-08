# 9: Using Loop Constructs

1. Using Loop Constructs - 36m
2. Practice 9-1: Writing a Class that Uses a for Loop - 4m
3. Practice 9-2: Writing a Class that Uses a while Loop - 5m
4. Practice 9-3: Converting a while Loop to a for Loop - 5m
5. Practice 9-4: Using for Loops to Process an ArrayList - 8m
6. Practice 9-5: Writing a Class that Uses a Nested for Loop to Process a Two Dimensional Array - 12m

## 1. Using Loop Constructs - 36m

After we finished the practices for lesson eight, now let's get into lecturing lesson nine. Well, lesson nine talks about loop constructs, which by the way are quite important to us as developers.

In this particular lesson, we are going to look at creating a while loop and working with it. We're going to look at the concept of nested while loops. We're going to look at developing and nesting the for loop. We are also looking at coding and nesting the do/while loop. And of course we finish by looking at the array list and the for loop. In fact, we are going to introduce one of the for loops that was introduced in the Java SE 5, that's called the enhanced for loop. And of course, compare the loop constructs.

Let's start by discussing the while loop. Well, in general, loops are frequently used in programs to repeat blocks of statements until an expression is false. And there are three main types of loops. These are the while loop that repeats while an expression is true. We have the do/while loop that executes once and then continues to repeat while it's true. And of course, the for loop, which repeats a set number of times.

Now looking at repeating behavior. We give you an example of driving. In driving, are you there yet? Of course, you keep on driving until you get there. Once you get there, then of course you stop.

So in the while loop, in this case, we have a while, and then areWeThereYet. Well, if we are not there yet, what do we do? We read the book, argue with siblings of their kids and ask, "Are we there yet?" And once we get there, once this becomes, in this case, false, then in that case, we'll say, all right, good, we're in, and then we get out of the car. This is just as an example.

So looking at the while loop syntax. The syntax of the while loop always has a special keyword, in this case, which is called while. And then you lowercase, and then you have your boolean expression. And of course you have your code block, which is between the two braces that you see here. And then after you get out of the while loop, you continue with the program.

So in general, again, if the boolean expression is true, this block of code keeps on executing, that you see here. And of course, if the boolean expression is false, then the program continues outside the loop.

Continuing with that, let's go ahead and look at an example of a while loop. What we want to do in this case, folks, is take a look at the example of what? The example of the Elevator class that we've seen yesterday.

Here we have a new method called setFloor(). By the way, this setFloor(), as you see here, takes no arguments and returns void. But we tell you here, normally you should pass the desired floor as an argument to the setFloor() method. However, because we have not learned this yet, we are going to set it up as a specific variable, which is in this case a local variable called desiredFloor.

So we declare a desired floor as a local variable of type integer. We initialize it with 5. And look what we say. We say, while the current floor-- which is equal to what? Wherever we have. We don't know. Maybe it's 1 at that time. At the beginning, it's 1-- is different than the desired floor, which is what? 5 What do we do? If the current floor is less than the desired floor-- well, 1 is strictly less than 5. What do we do? We go up. And we know that goUp() does what? Increments the current floor. Remember that? We've seen it yesterday.

And as you see here, this keeps on until what? Until the current floor becomes 5. Now if the current floor is 5, we say, is it different than the desired floor, 5? And the answer is what? False. And that's why you get out of the loop. Everybody sees that? OK, good.

And you see how now we can make use of the while loop. And in this case, we created a method called setFloor(). And by the way, that setFloor() allows us to either go up or go down.

Now continuing with this, let's take a look now at the class Elevator that includes that method. So again, the class Elevator has a bunch of instance variables, which is the doorOpen, which is a boolean, currentFloor, TOP_FLOOR, which is a constant, and BOTTOM_FLOOR, which is a constant. And of course, initialized to different numbers.

Then you have, again, here a bunch of lines of code that we omitted. These are the different methods-- goUp(), goDown(), and all that. We kind of know about that. And here we have a setFloor() method. And this setFloor() method has a local variable that we declared over there called desiredFloor of type integer. And we initialize it, of course, to 5 at that time.

And then we use the while loop, again, exactly that way that I showed you earlier. If the current floor-- in this case, which is 1-- is different than the desired floor-- and of course, in addition, the current floor is strictly less than the desired floor-- then of course, what we're going to do is we're going to go up. And we keep on going up, until what? Because goUp() increments the current floor, until, of course, the current floor becomes 5. Once it becomes 5, then at that time, we stop and get out of the loop.

Everybody sees that? OK, good.

Continuing with this again, here is another example of the while loop. And in this case, look what we do. We actually declare a variable called square of type float, and we assign 4 to it. And again, this pretty much shows you a code for generating the square root of a number.

And then, of course, in this case we'll go ahead, and this is the number to find the square root. And then down here we'll go ahead and declare another squareRoot, which is in this case the guess variable, and initialize it with the value of square, which is four. And then here we while squareRoot times squareRoot minus square is greater than or equal to 0.001, go ahead and do that.

Go ahead and take the squareRoot and add it to the square root divided by 2, and then divide the whole thing by 2, and of course assign it to squareRoot, and keep on doing that. And print, "Next try will be," and then print that. And then keep on doing that.

Of course, if you run this, first it gives you 2.5, and then after that 2.05, and then 2.0 all the way until you get, in this case, the 2. So while it's less than 0.00, of course, at some point in time, the decimal value will be, in this case-- the difference will be less than 0.001. And of course that's the number that we take. And it turns out that 2 is the square root 4. Everybody sees that?

So this is showing you how we can make use of a while loop. In this case, to look for a square root of a number.

Let's look at a second example. In the second example, we want it also to make use of the while loop. In this example that you see on the slide, it shows us how long it would take to double your money at a particular interest rate. So here's how we do it.

So we have the initial sum. You've got $500. So hopefully we want to double it to become what? About $1,000. And we decided that the interest rate is 7. That's interesting. 7 interest rate. I would love to have an interest rate in the bank of 7%. As you know now, it is not 7%. It's not even 1%.

And then we declare a variable years, and we initialize it to 0. This will represent the number of years. Because remember, we said how long does it take. We want to see that, in terms of how many years.

And then after that, we'll go ahead and take the current cum, and then use the initial sum, which is 500 times the 100 that you see here. And then, of course, after that, we say while the current sum is less than-- because we times it by 100, now it becomes what? It becomes, in this case, 50,000.

So I say the current sum is less than or equal to what? To 1 million. So we'll go ahead and do what? If it is less than or equal, then we'll go ahead and take the current sum. And add to it what? The current sum times what? Times the interest divided by 100. And we keep on doing that, and after that increment the years, in this case, and then keep on doing that all the way until you reach the current sum is equal to 1 million.

So we keep on doing that. And after this reaches, then at that time we'll get out of here-- No, we'll go ahead and print, by the way, the number of years. And of course, the current sum divided by 100. So for example, here on year number nine-- again, we just showed you a snapshot, but some of the results are not shown at the beginning.

So in year nine, you have $919, and in year 10, you have $983, and in year 11, you have $1,050, which by the way now is what? Now, of course, it gets us to less than or equal to. And that will be currentSum greater than what? Greater than the 100,000, because it will be like 105,200 or whatever.

And then in that case, of course, this would be false. And then we get out of the while loop. Everybody sees that? All right. So by the way, here, we converted first the sum, 500, into pennies, and we did the computation in pennies.

Now looking at the while loop with a counter. Here's another example, where in this case we first print [? a note. ?] in this, the loops. But typically, this example, what it does-- in our case here, it will go ahead first and print the /* and then declares a counter of type integer, and initializes it to 0, and then uses the while loop. While the counter is strictly less than 4, go ahead and print what? In this case, a tab and then an asterisk. And keep on doing that. Again, here we printed a tab and then the /*.

So it will go ahead and print the 1, and then 2, and then 3, and then 4. Because once the counter is now 4, because it starts from 0. Once it's 4, is 4 strictly less than 4? And the answer is what? It's no. So that's why you get out of this. And then you'll go ahead and print the last one, which is the */.

Everybody sees that? OK.

So again, in this case we use the while loop, but we can always use other loops. And we're going to discover later on about the for loop and the do/while loop and so forth.

Now let's go ahead and look at how to develop a for loop. Again, in the while loop that you see here, we declared a counter here, a variable, and initialized it to 0. And then we used the while loop, and we said, while that counter is strictly less than 4, go ahead and print again what needs to be printed.

And of course, every time we increment the counter, the counter increment goes in what you see over there, inside after the statement of the print, and then inside the while loop. And of course whenever counter becomes 4-- well, [? 4 isn't ?] strictly less than 4. At that time, we exit the loop.

We can actually convert this loop here that you see into a for loop. The way it's converted into the 4 loop-- again, we'll go ahead and declare a local variable, in this case, called counter. We initialize it to 0, separated by a semicolon. And then you put the boolean condition here, that counter is strictly less than 4. And then the semicolon here, and you increment the counter.

So the way you read it here-- for counter equals 0. And we check first, is counter less than or equal to 4? If the answer is yes, then go ahead and print that. And then after that, increment counter and then go back and check it. And if the answer is true, then go ahead and print the next one, and so forth, all the way until what? Until counter becomes 4. Is 4 strictly less than 4? And the answer is what? No. [UNINTELLIGIBLE] So it gets out of it the for loop.

So far so good? Everybody understands the for loop and how to-- again, some of you are familiar with this, just because maybe you've done it in C language and so forth.

Now, looking at syntax of the for loop-- so in general you have the for loop, and then you have the initialize. By the way, that could be one or more initializations. And then you have the boolean expression, and then you have also one or more updates. And then you have the block of code within the for statement.

So here's an example. Again, the for loops typically are very versatile. You can initialize more than one variable in the first part, and modify more than one variable in the third part. Just to let you know.

And this code that you see here-- again, this is the example that we show you here, which I just highlighted. Again, it declares two strings. And of course, in this case, and as it loops it appends to one string while removing from the other string. That's the whole idea behind this.

So first of all, we declare a string that has a pipe, and then another string called i, and then another string called t that has-- how many dashes? One, two, three, four, five, six dashes. And then we say, while the length of i, which is what? 1 is strictly less than 7, what do we do? We go ahead and append another pipe character or bar character to the string i. And then we again invoke the substring() and text the first character from this string.

And we keep on doing this, as long as what? As long as the length is strictly less than 7, of the string value. Of course, what's going to happen is it's going to delete one dash and add one bar, and keeps on doing that, all the way until the end.

Everybody sees that? And of course, at the same time we are printing the string i and the string t next to each other. And go to the next slide. Everybody sees that? Good.

All right. Now what we want to do is take a look at nesting a for loop and a while loop. So first let's go ahead and look at the for loop. Here's a very good example, folks, where in this case, we have code that has nested for loops.

So first of all, we declare a couple of variables. One is called height, and we initialize it to 4. And the other one is called width, and we initialize it to 10. And then we use the for loop, and inside here we declare a local variable to the for loop, and we call it rowCount. It's of type integer. Initialize it to 0.

And then as long as the rowCount is less than height, which is 4, go ahead and do what? Go ahead and now process another for loop, where we declare a columnCount, which is a variable of type integer. Initialize it to 0. And as long as the column count is strictly less than width, which is 10 in this case, go ahead and do what? And print @.

And then, by the way, when we do the printout, we do it with just a print, not println. Which means it prints all the @s on one line. And then after that, once we finish with the nested for loop, we'll go ahead and print a new line. And then after that, go back and increment the rowCount to one, and then check it again, and then do the same thing.

How many times do you think these lines of airlines of @ character will be printed in your opinion? And we start with 0. Yeah, it's 10 times in a line, but how many lines? How many rows? Four. OK, good.

Now we're looking at the nested while loop. Here's an example, where in this case we have a nested while loop. It's likely a little bit more complex. In this case, the nested loop tries to guess the name by building a string of the same length, completely at random.

We first of all declare a reference variable name of type String, and initialize it with a string, "Lenny." And then also another one, which is a reference variable of type String, and we initialize it with an empty string. And then we declare a number of tries. In this case, numTries. And we declare it as an integer and initialize it to 0.

So first, we have while not guess.equals() the name to lowercase. While [UNINTELLIGIBLE] guess in this case is not equal to the name. And then we make sure that the name is lowercase, in case we enter A in uppercase.

And what do we do in this case? We go ahead and set the guess reference variable with an empty string. And then we use the inner while loop, as you see here. And the nested while loop tries to guess the name by building a string of the same length, completely at random.

So in this case, we'll go ahead and check. So if the length of guess is strictly less than the length of name, go ahead and do that. Go ahead and, of course, a random character. And then append that character to the string, and keep on doing that.

And then, of course, increment the number of tries and keep on doing that, all the way until, for example, in this case, the guess is not equal to the name. Then at that time, of course, we go ahead and stop, get out of the loop, and of course print "Name found after" after a certain number of tries. That's pretty much what it is.

All right. So again, in this case, like we said, the nested loop tries to guess a name by building a string of the same length completely at random, looping at the inner loop. First, the code initializes the character, ascii character to a lowercase letter, randomly. Again, these characters are then added to the string guess, until the string is as long as the string that is being matched against. And of course, we should notice the convenience of the concatenating operator here, allowing the concatenation of a string to a character.

That's the inner while loop. On the other hand, the outer loop tests to see if the guess is the same as a lowercase version of the original name. Of course, if it is not, again, the guess is reset to an empty string, and the inner loop runs again, usually millions of times for a five letter name.

All right. So now that we looked at an example-- again, a slightly complex example-- of the while loop, let's go ahead and look now at using arrays in a for loop. Loops and arrays. One of the most common uses of the loops is when working with a set of data. Again, all types of loops are useful. While loops to check for a particular value, for loops to go through the entire array, and enhanced for loops-- we're going to see that.

Well, let's assume we have, in this case, an array. And this array contains what? It contains the ages of people, for example. So of course, the last index would be the last value. So we use the for loop, and then we say, for i equals 0, and i is less than the length of the ages method. In this case, go ahead and do what? Print [? ages[i], ?] which means the value of the location of the array.

And then, of course, we use a println. So if you run this for loop on this array, folks, you're going to see what? Age is 27, age is 12, age is 22, and so forth. Because you have age. Everybody sees that? Everybody's following? OK, good. Good. So that's pretty much how you work with this.

Now of course, we've seen examples about using a for loop earlier. So the question that you should have for me-- we already have seen this as an example. Why are we seeing it again? Well, really we're setting you up for learning a new way of representing a for loop. And of course now you see that setting values in the array-- this is how we do it.

Imagine that I wanted to do loop through an array and set every element of the array with the integer 10? How do we do that? I use a loop. For i equals 0 and i-- this is a typo here. This should be i strictly less than the ages.length. And we'll go ahead and do that. Assign 10 to ages[i].

So it starts with what? ages[0], and we set it to 10. And then ages[1], said it to 10. Then ages[2], set it to 10. And all the way until what? Until length minus 1. Got that? OK.

Folks, look at that. Now we have an enhanced loop. By the way, this enhanced loop was introduced in the Java SE 5. And by the way, in the SE 7, we call it an enhanced for loop. We also call it a for-each loop, is another name.

So here's how it works. You pretty much access the array and print the elements of the array. So use the for. For int age-- you declare any variable, and then you have a colon, and then ages. So the way you read this here-- for every element, age, of the array, ages, go ahead and what? Print "Age," and of course the age which is the variable.

So what it does here-- it iterates through the array and takes every element, in this case represented by the variable. We could have, by the way, called it x or y or z. And then print it out. So you see, each iteration returns the next element of the array in age. And that this is called an enhanced loop, instead of using all of that. And of course, this works only when you have an array that contains all the elements of the same type.

So by looking at this for loop, and then the classic for loop that we've seen here-- so what is the disadvantage of the enhanced for loop? It's actually good, because you write less code, if you're processing all of the elements of the array the same way. Like in this case, you're just bringing them all.

But one of the problems that I can have with this advanced loop is what? If I'm trying to do what? If I'm trying to access a particular location in an array. If I want to access a particular location in an array and maybe do some changes in that particular location, I don't have an index to actually do that. Everybody sees that?

So in that case, it would be nice to go where? To use the classic for loop. Everybody sees that? But if you're processing all the elements of the array the same way, then it is a very convenient way to actually write the for loop. It's called the enhanced for loop. Everybody's following? Good.

Can we use this for the two-dimensional arrays?

Yes, you can. So the question is, can we use this for two-dimensional arrays? Yes. So at the same time, you'll have two nested loops, of course. One inside the other one.

So looking at enhanced for loops-- and by the way, we can use it also for any other type. So here's an enhanced for loop for an ArrayList. I have an ArrayList of strings that contains names. George, Jill, Xengi, Ravi, and so forth. And then we can use the enhanced for loop to iterate through every element of the array names that you have here, of strings. The element is name, and then what are we doing with that? We're printing it out. We can actually do that too. Right? OK. So we can use all kind of types. There's no question about that.

Let's go ahead and look now at the break with a loop. Remember, we already have seen the break where. In which statement did we actually study that? In the switch statement. Good job.

There are two useful keywords that can be used when you work loops. Again, they are break and continue. The break-- what it does is it enables you to jump out of the loop. On the other hand, the continue sends you back to the start of the loop. That's typically how it is.

So in this case, let's look at an example where we show you how to use the break. So for example, here, we declare a variable called passMark, and we initialize it with [? 12. ?] Again it's of type integer. Then we declare a boolean variable called passed. And we assign to it false. And then here we declare an array of type integer. And we instantiate it and initialize it with this array that contains 4, 6, 2, 8, 12, 34, and 9.

And then here, look at that. We use the enhanced loop for every element, unitScore, of the score array. Checked if the unit score is greater than the passMark, which is what? 12. Go ahead and set the passed boolean to true. And then break out. And then here, print "One or more units passed," and then again, print that passed.

So if you take a look here, the output would be, "One or more units passed," and then "true." why? Because this is actually some number that is greater than 12 in this case, which is what? 34. So we assume here that the code is to find out if any of the scores in the array are above the passMark, which is what? 12. And in here, it turned out that we have one, which is in this case 34, which is bigger than 12. Everybody sees that, folks? OK, good.

Now let's look at the example of the continue. If you remember, we said we use the continue, which is similar to break except that we said in the earlier slide that the continue sends you back to the start of the loop.

So here's an example. Again, in this example is the same [UNINTELLIGIBLE] pretty much, but except that we have in this case the continue. So in this example and the previous one, it is intended only to show you that the function of the break and continue, not to show a particular programming technique. It's just how they work and how we do it.

So of course, in this case, if score i is less, we should again if you use score i then in that case, you need to somehow use the classic for loop. Then, in that case, if it's strictly less than marks 12 then go ahead and continue, which means go back to the beginning of the loop and start all over again.

Let's go ahead now and look at how to code a nested do/while loop. So here's the syntax of the do/while loop in Java. So you have the do, and then you open the curly braces, and then you have your block of code, and then you have the while. And then of course you have your boolean expression. So the condition in this case-- and by the way, the do/while loop always loops one or many times. It's not like the while loop and the for loop. They actually iterate 0 or many times. Those are 0 to many, this is one to many.

And of course the condition at the bottom of the loop-- you see that pretty much is the one that controls the loop.

We should also let you know that, by the way, the while loop always ends with what? A semicolon. There is a semicolon which is mandatory for the do/while loop. Everybody sees that?

And let's go ahead and see an example of the do/while loop. So what we're going to do is we want to define the setFloor() method. Again, we said normally the desiredFloor here should be passed as an argument to the method, but here we declared it as a local variable and assigned to it 5.

And then here we use do-- and again, it's going to at least process once. If the current floor is strictly less than the desired floor, go up, else if the current floor is strictly greater than the desired floor, go down, while the current floor is different than the desired floor. So it processes and it at least it goes up and down at least once, either up or down, before it checks it. So that's why we say the do/while loop gets processed one to many times. Got that? Everybody's following, folks? Good, good.

And now, of course, looking at comparing loop constructs. Here's what we tell you, folks. Use the while loop to iterate indefinitely through the statements and to perform the statements zero or more times. We have a tendency to use the while loop a lot in some systems applications. While it's true, go ahead and do that.

For example, when you open a CMD and you see this cursor just blinking, underneath, it's using the while loop. It's waiting for some commands to write, for example. It's doing that. It will go ahead and execute the dir and then it keeps on waiting forever for you to enter another command, and so forth. That's how it's implemented underneath.

And then you have the do/while loop. The do/while loop again is used to iterate indefinitely through statements and to perform the statement one or more times. We just saw the example of the previous slide.

And use the for loop to step through statements a predefined number of times. So in the for loop, we always specify when to stop, or how many iterations we're going to do.

Everybody's following, folks?

And we have a quiz. And this quiz says, something enables you to check and recheck a decision to execute and reexecute a block of code. And that would be what? It would be loops. It would be C.

And then the next one is, which of the following loops always executes at least once? And that's what? The do/while.

And so in summary, we looked at creating a while loop, nesting a while loop, developing and nesting a for loop, coding and nesting a do/while loop, using an ArrayList in a for loop. We also looked at the enhanced for loop, and we compared loop constructs.

Oh, by the way, we also have here a bunch of practice. So practice one, we're writing a class that uses a for loop. Practice two, we'll write a class that uses a while loop. Practice three, we convert a while loop to a for loop. Practice four, we use the for loops to process an ArrayList. Practice five, we write a class that uses a nested for loop to process a two-dimensional array. Practice six, we add a search method to the class Map.

So if you want to see this in details, we'll just go ahead and look at these practices. So practice one, again, we write a class that uses a for loop. Again, as you see, they give you all the details on how to do this practice. Practice two is writing a class that uses a while loop. Again, we show you all the details on how to do that, that helps you do this practice two. And then practice three, we convert the while loop to a for loop. Again, we show you all the steps that help you do the practice. We give you hints, and so forth.

And then in practice four, we use the for loops to process an ArrayList. Again, all the details on how to do it. And then practice five, we write a class that uses a nested for loop to process a two-dimensional array. This is an interesting exercise. So I look forward for you guys to actually try it. And then of course, adding a search method to this class, Map. Again, it mimics a classroom.

So let's go ahead and do these practices. And once we've finished the practices of lesson nine, we'll get into lecturing lesson 10. Thank you.

## 2. Practice 9-1: Writing a Class that Uses a for Loop - 4m

 
OK, after looking at lesson nine where we used loop constructs like the while loop and the for loop and the do while loop, we also looked at nested loops. And we also looked at working with arrays and looking and, of course, the enhanced for loop that was introduced in the Java SE 5. Let's go ahead and look and, of course, take a look at these practices for lesson nine.

And we'll start with practice one where, in this case, we're going to write a class that uses a for loop. And in this case, we are going to create the counter class that uses a for loop to print a sequence of numbers. And here we create a new project, which is practice nine. And of course, let's set the source package folder to point to lesson nine. Again, remember to also change the Source Binary Format if we need again further details.

In this case, we create a new Java class called Counter, declare, initialize a public final, in this case, field called MAX_COUNT, assign the value 100 to the field. And again in this case, we use the keyword final to, again in this case, designate this as a constant field. And of course, we create a method called displayCount that does the, again, the following counts from one to the value of the max count constant using a for loop increment the value of the loop available by one display, of course, the value of the loop variable if it is divided by 12. Again, we display this on a single line separated by space, which means we're going to use not the println.

Hints, again in this case, use the for loop. For example, you could use that i as a counter. In this case, use the modulus in this case percentage to check the divisibility by 12. Again, if it is divisible by 12, the result of the modulus operation will be zero. And of course, use the print method to keep displaying values on the same line. So this would, again, look something similar to this here.

Of course, the output would be, in this case save and run it, the output would be something similar to this. Now, remember also that we assign the maximum kind to 100. Let's go ahead and look at that and, of course, on NetBeans. So for that we have the class counter. And as you see, the class counter here pretty much declares a final variable max count, which is set to 100. And then the display count in this case, each rate starts from count one and goes all the way to the max and looks for all the numbers between, in this case, one and 100 that are divisible by 12 and print them out separated by a space.

And of course, here we have the test class for that. And all what we do over there is we initiate an instance of the class counter referenced by the variable myCounter and, of course, called the displayCount method on it. So if we do that, that will, of course, gives us 12, 24, 36, 48, 60, 72, 84, and 96, of course, which are all numbers between one and 100 and divisible by 12. And that pretty much ends the first practice of lesson nine. Thank you.

## 3. Practice 9-2: Writing a Class that Uses a while Loop - 5m

Let's go ahead now and look at practice two of lesson nine. In this practice, we write a class that uses a while loop. Again, in this case, we go ahead and create a class called Sequence that displays a sequence starting with the number zero and one and then successive numbers in the sequence that are the sum of the two previous ones. By the way, this sequence is well known as a Fibonacci series. Fibonacci is one of the mathematicians. And of course, we were given the SequenceTest, the class in this case.

So the task is to create a class called Sequence. And in this case, we declare a bunch of fields. We have firstNumber, secondNumber, and nextNumber. These would be fields that we are going to declare. Assign, of course, zero and one to the first number, a variable in the second number, variable or fields in there respectively and, of course, declare a public final int called SEQUENCE_LIMIT how many numbers we are going to write in the sequence.

And we create, of course, a method called displaySequence. Again, we use the high-level steps to code the method. Again, if you need more help, detailed instructions are provided, again, in these steps where, in this case, we print the value of the first number and then the second number to start the sequence, separate all the numbers in sequence by a space, calculate the sum of the first and the second, and assign it to the next number And, again, create a while loop in this case with all these characteristics, boolean expression repeat if the value of the next number is less than or equal to the sequence limit, which is 100.

And of course, the code block where we print the value of the next number, assign the value of the second number to the first and the value of the next number to the second, recalculate the value of the next number to, again, be the sum of the first and the next. And of course, after the while loop, again, use the System.out.println to create a new line. That's pretty much what we are going to do.

So obviously, in this case, you will see that it's going to be pretty much you would see how we get the next number by adding the first and the second. We also see here how the while loop is always while nextNumber is less than or equal to the sequence limit, which is, in this case, we set it to 100. And then within the while loop, we'll go ahead and print that next number and put in some space and then set the first equal to the second and the second equal to the next. And of course, after that we'll go ahead and set the next equal to the first plus second. And of course, outside the loop we'll put in a println to create a new line.

So of course, this would look something like this. And then save and compile and print it. And it should print this one here. Let's go ahead and look at that in the NetBeans. So we have, in this case, a Sequence class. And as you see here in the Sequence class, we declare firstNumber as an integer, secondNumber as an integer assigned zero and one to them. The nextNumber would be the one that is going to be the sum of the first plus the second. And then the sequence limit is 100.

In the display sequence here, we'll go ahead and first print the first set and the second and then after that add the first to the second and assign it to the next. And then let's say while the next is less than or equal to the sequence limit, which is 100, then, of course, at that time we'll print the next number, which is, in this case, I print the next number, put in a space, and then move the second number to the first and the next to the second and then do it again. And then of course, at the end when we finish the while loop, we should go ahead and print a new line, a new empty line.

Of course, they gave us the test and the test pretty much where test class called SequenceTest where we create a new instance of the sequence and, of course, call the displaySequence method, which is this one here. And of course, if you run this, we're going to get rather in this case this one here. We are going to get all the Fibonacci numbers that are, of course, less than 100. And those are zero, one, one, two, three, five, eight, 13, 21, 34, 55, and 89. Of course, now every number is the sum of the two previous one. For example, here 34 is the sum of 13 plus 21. And of course, 89 is the sum of 34 plus 55 and so forth. And that pretty much ends this practice of lesson nine. Thank you.

## 4. Practice 9-3: Converting a while Loop to a for Loop - 5m

OK, let's go ahead now and look at practice three of lesson nine. Here folks, as you see, we call it a challenge practice. Again, when we tell you that, you should check with your instructor for recommendations about which optional practices to do again. Perform this practice only if you are certain that you have enough time to perform all the non-optional practices. So in general, we put these as optional.

And for you folks, again, we advise you to try them. There's no harm in trying them. And again the more you try and practices, the more you learn. So this is my own opinion. And I think you should follow it. Because of course, you're here to learn. And it's a good idea. And the more practices you do, the more, of course, you are going to learn.

So in this case, let's go ahead and take a look at it and see what we are trying to do. So in this case, we're trying to, in this case, create a new class called ChallengeSequence, which is based on the Sequence class that we've seen. But in this case, we're going to modify the displaySequence method to make use of the for loop instead of using the while loop. So in this case, we create a class called ChallengeSequence, copy all the code that occurs between the outer class brackets of the Sequence class and paste it inside the outer brackets of, in this case, the ChallengeSequence class that you created.

And then after that create an additional field called Sequence Count and assign it the value of 10 to it. Again, in this case, be sure that you don't change any of the other field names. Again, in this case in the displaySequence method, modify the while loop to the for loop, such as, again, in this such that only the first 10 values of the Fibonacci series will be displayed. That's pretty much what they want us to do.

So a hint to remember that the first two numbers in the sequence are displayed before the loop begins. And of course, the for loop must display the remaining eight values. Again, there are several ways of handling the discrepancy between the sequence and the score count value and the number of values that need to be displayed within the loop. Again, one approach is to adjust the initial count in the loop . And of course, this now would look something like this.

Since we printed the first one and the second one, then in that case, we'll get the third one. And that starts from two, as you know, from zero to, in this case, to nine. So obviously the first one would be zero. The second one is one if they already printed. And then we'll start the third one. That would be printing the eighth one. And of course, here as you see pretty much similar to what we have seen in the while loop.

Let's go ahead and look at that in NetBeans. And we have a ChallengeSequence, again, that we created here so pretty much the same thing. We declare first and second and assign them to zero and one. We get the next one. And then here we have the sequence limit and the count, which is, in this case, 100 and the other one 10. And then in display method, that's where first we display outside the loop first number and second number. And then of course, we assign the add, of course, the first or the second to get the next one.

And then of course, we'll go ahead and use the for loop. At this time, it starts with two because we already printed the first and the second. And of course, we loop all the way to nine to get all the eight numbers. So again, in this case, we'll print the next number, put a space, and then put the second number into the first, the next number into the second, then do the addition again, and loop again by incrementing the counter to one and checking if it's strictly less than Sequence count final constant over their variable and, of course, keep on doing that. Of course, at the end, we need to print, of course, a line once we print all of that.

So you see we also have the ChallengeSequence test which pretty much is nothing but a class that has a main method. That creates an instance of the ChallengeSequence referenced by the reference variable my sequence and then, of course, in this case, invoke the display sequence method on it. And of course, that, in this case, when we run it, it gets us the first 10 Fibonacci numbers. And that pretty much ends this practice. Thank you.

## 5. Practice 9-4: Using for Loops to Process an ArrayList - 8m

OK, let's go ahead now and look at practice four of lesson nine. Here we're using the for loops to process an ArrayList. Again, in this practice, we create two new methods in two different classes. One of the methods uses a traditional for loop to display the values of an ArrayList. The other method uses an enhanced for loop to display the values of the ArrayList. Again, this practice contains a couple of sections where first we use a for loop with the VacationScaleTwo class. And the second one we use the enhanced for loop with the NamesListTwo.

So first again, in this practice, we're given, by the way, VacationScaleTwo and, in this case, in your project, VacationScaleTwo and VacationScaleTwoTest, again, in this case, and NamesListTwo. So we're using a for loop with the, again, in this case, with the VacationScaleTwo. Open the VacationScaleTwo class in the editor. Again, this is similar to the VacationScale class, again, that you wrote in the practices of lesson eight, except that an ArrayList is used to store the vacation days instead of an Array. Again, add the new method called displayVacationDays .

Again, the high level instruction of this task are provided in the table below. Again, more detailed instructions can be found, again, following. So again this is the table that's pretty much summarizes that. But we can also take a look at the details in the displayVacationDays method add a for loop with the, in this case, with the following criteria for int years equals zero. And the years is strictly less than VacationDays.size. And then years plus plus, again, in this case in the for loop block, use the system.out.println to print the value of every ArrayList element. Use the get method of the ArrayList, again, passing the years variable as an argument. It references the current index, the number of the VacationDays list.

Again, here we have a println statement that prints pretty much, in this case, the vacation for years, again, years of service, again, in get, of course, in this case, the number of years. Again save and compile around the VacationScaleTwo. And it should give print that's pretty much gives us all the output that we see here. Let's go ahead and look at that on NetBeans.

So you see we have the VacationScaleTwo. And as you see, we create a non-ArrayList called VacationDays. And then we use the set VacationScaleTwo, of course, in this case, initialize the array called VacationDays to the ArrayList to size seven. And then after that, we'll go ahead and add on the first element 10 and then 15, 15, 15 and then 20, 20 and then 25 similar to what we've done in practice eight. And then in the displayVacationDays, again, we use a standard for loop to display values for the ArrayList. Again, we use the standard for loop. And then we go ahead and print, in this case, by invoking the get method and pass the number of years in this case. And the number of years, of course, is going to iterate from zero to one less than the size of the ArrayList, which is 260, in this case.

And of course, we have a VacationScaleTwoTest that pretty much creates a new instance of the VacationScaleTwo and referenced by the reference variable myVacationScale and then after that invoke the set VacationScale that pretty much fills up the ArrayList. And then after that, call the display, in this case, method to, of course, display the vacation for the number of years respectively, which is going to be printing 10, 15, 15, 15, 20, 20, and 25. Let's go ahead and do that.

And that pretty much so now it says the vacation for zero years of service would be 10, which means somebody who started for at zero years right at the beginning. And then for one year, once they past the one year and complete the one year, that becomes 15 days. And then it continues all the way to 25.

The next thing-- so let me go ahead and close that-- and now I wanted to, in this case, open this one here. Because this is the one we can, again, talk about next. Next, they want us to use an enhanced for loop. Again, we open the NameListTwo class in the editor. Again, this is similar to the NameList class that we've seen in lesson eight. It has only one method setList. Again, the method initializes the ArrayList and then prints the size of the list. Again, we add a new method to the NameListTwo called displayNames. Again, we use the enhanced for loop in this method to process the ArrayList.

Again, high level instructions are specified in this table. But then we can look at the details where, in this case, we use the system.out.println that pretty much prints the message names in the ArrayList. And then after that we use the enhanced for loop that you see, which I mentioned. By the way, it was introduced in Java SE 5. We should note also that the name variable is a reference to the current element in the list of names, ArrayList for every iteration of the for loop. Again, within the for loop block we use the system.out.println to print the name reference. And it should look something like this where we see here's the enhanced loop. And of course, this is what we're trying to print, in this case.

And of course, we create a main class in the NamesListTwoTest and declare initialize a local variable of type NameListTwo. And then of course, using, again, the typical syntax that we already know about invoke the set list and then invoke the displayNames method. So let's go ahead and see that in NetBeans. So first we have, again, in this case you see how we have the NameListTwo. And it will declare an ArrayList called listOfNames. And then in the set method, we'll go ahead and initialize that listOfNames reference variable with the new instance of the ArrayList.

And then we add Joe Smith, Mary Palmer, Jose Gonzales, Linda Baker to the listOfNames ArrayList. And then after that, we'll go ahead and print the size of the listOfNames ArrayList. And then in the display method, again, we'll first put a message. And then after that we'll use the enhanced for loop to print everyone of them. And of course, in the test class we create a reference variable called NamesListTwo. And then we initialize it with the news instance of NamesListTwo.

And then of course, we invoke the set list first, which goes through, again, setting the ArrayList with Joe Smith, Mary Palmer, Jose Gonzales, Linda Baker Strings. And then after that, we'll go ahead and call the display method. And that pretty much the one that is going to go and, of course, process the enhanced for loop to print those names. Of course, if we run this, we see that, again, the size of the ArrayList is four. And then the names in the list are Joe Smith, Mary Palmer, Jose Gonzales, and Linda Baker. And we use the println so that they all are printed on a new line. And that pretty much ends this practice for lesson nine. Thank you.

## 6. Practice 9-5: Writing a Class that Uses a Nested for Loop to Process a Two Dimensional Array - 12m

OK. Let's go ahead now and look at Practice 5 of this lesson, Lesson 9. So we're going to write a class that uses a nested for loop to process a two-dimensional array. Again, in this practice, we create and process a two-dimensional array using a nested for loop, one loop within another loop.

Again, this practice is based on the scenario of a classroom. The classroom has 12 desks arranged in a rectangular grid, comprising three rows and four columns. Again, students are located at desk at the position found vacant first, again, by traversing every row. Again, we see how it would look, just following this table or this matrix. So you see that every set contains the coordinates of the desk position in the class map, so 0,0, 0,1, 0,2, 0,3, 1,0, 1,1, and so forth.

The assumption in this case is that we're given the class map, test class, so it's already there. And then here, what we're going to do is create a class called "ClassMap." In this class, we declare a couple of public fields.

In this case, one is called the deskArray, which is a two-dimensional array of type strings. And the other one is a reference variable to a string. Again, we create a new method called Set ClassMap.

In this method, we initialize the desk to have the three rows and four columns, again. And we see that here. And we create another, a new method called Set Desk.

In this method, we assign a new student identified by the name field, that is set by the ClassMap test to an empty desk in the ClassMap. Again, define the method according to the steps below. Again, we traverse the deskArray to identify the first vacant element in it. Use a nested for loop for this purpose.

For example, you see 4 and then a row 0 to again strictly less than 3. And then there is a nested loop for the column equal to 0, all the way to strictly less than 4. Go ahead now and check if the deskArray row or column, of course, index row column is equal to null. Then of course, if you find it that it's null, a value again in the map, in the desk map, than in other words, if you find an empty desk, then assign the value of the name field to that vacant element.

Within the inner loop, by the way, for loop, in this case, the one that iterates over the columns of the row, set a local Boolean variable flag to true. If you assign the name to an element, again check the values of the flag variable in the last line of the outer for loop. If it is true, there is no need to continue looping through the rest of the rows. So break out of the for loop.

Similarly, you can check the values of the flag, in this case, after the close of the outer for loop if the value is still false. It means that all desks are taken, no null values are found, print the message indicating that all desk are occupied. Again, print the position of the desk for the student and exit out of the loop. Again, use a break statement to branch out of a running loop.

Let's go ahead and first look at the-- it would look something similar to this. At the desk, and of course, we go through the code later on in, the next piece. Again, you'll note you should test this code again a little later, create another new method called Display Desk Map.

Again, in this method, traverse the deskArray in the same way you did in the last step. Again, for every element in the array, print the name of the element or print null. And of course, the output there should be in the form of a grid.

Again, hint, use a combination of print and println method calls to achieve the grid format. So that you can go ahead and print one row and then go to a new line and then print the next several and so forth. So the grid should look similar to this. We'll see that, by the way, when we're on the application.

And of course, the solution should be something similar to this one here. Again, Save and Compile, and go ahead and of course, try to run that. OK?

Let's go ahead and just look at that for now. We're going to run the whole thing later on. OK? So we have a class called the ClassMap. And it has a deskArray of type strings. It's a two-dimensional array, and then we declare a variable, an instance variable, a name of type string.

And then we have a Set ClassMap, which by the way, first they said we'll go ahead and instantiate and initialize that with a array of size 3 by 4, in three rows by four columns. And then we have the Set Desk. That's where we set a flag to false. And then we go through the nested for loop, start for a in this case for row loop. And this is start for a column loop.

And then inside, we go ahead and check the location is equal to null, then we assign the name to it. And then print. Again, in this case the name and, of course, the value of row and the value of column, and then after that, set the flag to true, and then break out.

Of course, if the flag-- again, this drop out of the loop. Of course, in this case, if the flag is equal to true, then go ahead and breakout. Because obviously in this case, it's all done. And if the flag is equal to false, go ahead and, in this case, print all desks are occupied, which means every desk is occupied.

And then they asked us to create a method called, in this case, Display Desk Method. Well, that we use the nested loops to iterate through the two-dimensional array here. And, of course, print a-- put in a space and then print the value of that particular location, in this case, by specifying the index, by row and the index column, and then a space. And then after that use the printer-- and again, as you see here, ladies and gentlemen, the println is too late to take you to the next row.

And so again, without testing this, let me go ahead and continue. And with the next again which is a Challenge Practice. And by the way, like we mentioned earlier, you can check with your instructor for recommendation about which optional practice to perform. In my opinion, it is worth, again, trying all the challenge practices, because, as I mentioned to you earlier, ladies and gentlemen, trying more practices will only help you learn more of the Java technology.

So again, here we add another method to the ClassMap. And this pretty much searches through the deskArray. Again, the assumption here is that we already finished with Practice 5, and we know that we finished it.

And now, in the class, we go ahead and add another method called Search Desk. And this method, in this case, what we do is we go ahead and create a nested for loop to traverse the deskArray. Again, if the array element is not null, compare the value of the name field with the value of the element. Again, in this case, it would be something similar to this one here if the deskArray row, column is different than null.

And of course, the deskArray row column is equal to a particular name, go ahead and print the position of the desk in this case, if the names are equal. And then print an error message if the name is not found in the desk. And of course, use the break statement to branch out or exit out of the loop, whenever required.

And of course, you would be-- look something like this. And we'll see that in the NetBean soon of course. And in the ClassMap test again, in this case, let's go ahead and now pretty much-- and they say uncomment, but in this case it's already uncommented, and try to run the Search method too. And it should be looking something like this.

Let's go ahead and look at that, just out of curiosity, and see how all of this is done. So again, continuing with the code that we wrote, here is my Search Desk method. And you see, it sets the flag first to false.

And then we use the nested for loops, and then of course, in this case, we check if the desk row column is different than null, and the desk row column-- again, which is the name over there-- is equal to name that you're trying again to, in this case, pass., then go ahead and print the name and the row value and the column value, and said the flag to true and break out. If the flag is equal to true and then break out, of course, if the flag is equal to false, then print again desk not located for that particular name.

Now what we want to do, folks, is take a look at the test. So in the test class, what we do is you create a new instance of the ClassMap. And then, we'll go ahead and invoke the Set ClassMap method on that reference variable called CM of type ClassMap. And then, of course, this will go ahead and call this method that we'll go ahead and set in this case. I call the set and set the desk-- set the desks of the classroom.

And then after that, in this case, we'll go ahead and use first of all, and allocate or rather assign the string "Ann" to the name and then call the set desk, in this case, and then assign a "Bond" and call the set desk. And then assign a "Cindy" to name, and call the set desk and assign "Donald" and then of course call the Set Desk.

This of course is going to populate the first row with Ann, Bond, Cindy, and Donald. Then after that, we'll go ahead and display. So when we call the display method is going to go ahead and call this display desk map that is going to display all of those again in this case positions that filled with names.

And then after that, they want us to get in this case to set now the name to Donald, and then do a search desk. And then that's going to call of course this method, and then find out again if they found Donald, then they want to print Donald and the position where Donald is sitting. And then, of course, after that, they want us to again set the name with Ronn-- R-O-N-N-- by the way, we don't have such a name when we set the desk. And then we do a search. We should be able to say that in this case, we should be able to say that a desk is not allocated for Ronn.

Let's go ahead and run that. And as you see, first it'll go ahead and of course, in this case, takes care of Ann, Bond, Cindy, and Donald by again sitting them down in the row 0,0 and 0,1 ad 0,2 and 0,3. And then after that, display the whole classroom as you see here. And then after that, we'll go ahead and do a search for Donald. We found that Donald is sitting at 0,3. That make sense. OK. That's 0,3. And then we try to again look for Ronn in the classroom. And we could not find Ronn, because of course in this case, we did not assign Ronn a desk. And that's why we say desk is not allocated in this case.

And that's pretty much ends this practice. So as you see, this is a very, very interesting practice. And that's why we advise you to again do the Practice 5 and do the challenge Practice 6, because it is worth actually working with this practice, because it teaches you a lot about what you learn in this course. Thank you.
