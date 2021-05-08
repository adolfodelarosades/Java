# 7: Using Operators and Decision Constructs

1. Using Operators and Decision Constructs - 35m
2. Practice 7-1: Writing a Class that Uses the if/else Statement - 10m
3. Practice 7-2: Writing a Class that Uses the Switch Statement - 5m

## 1. Using Operators and Decision Constructs - 35m

Practice is for lesson six, let's go ahead. And of course lesson seven. Lessons seven, again, covers using operators and decision constructs.

Well, in this particular lesson, we are going to make use of relational operators. We're going to look at testing equality between strings. Ah, now we're going to test equality between strings. Use a conditional operator, create an if and if-else construct, nest an if statement-- again, it would be one inside the other one-- chain the if/else statements, which by the way sometimes it's not likable, and that's why we now replace it with the switch statement.

Now of course, for relevance, we have a couple of questions here, folks. And we say, when you have to make a decision that has several different paths, how do you ultimately choose one path over the other paths. So again, it all depends on the conditional statement that you have.

For example, what are all the things that go through your mind when you are going to purchase an item? Usually you ask these questions. Is it good? Is it worth it? Am I really making a good investment here? And so forth.

And let's look at the use of relational and conditional operators. And for that, again, here is a relational operator. Think about you folks driving down here. And then of course in this case, he can go either left or right. So it all depends on what he is trying to do.

This picture here reminds me always of the movie Castaway. How many of you have seen Castaway before? And if you remember, at the end, he would drive down and then he looks at left and looks at right, and that's how the movie ends. So you are driving, you're lost, and then the question is, should I go right or should I go left to get to wherever you want to get.

So the whole idea behind this is whenever you write your programs and try to calculate anything, lots of times you are going to evaluate the condition and depend on the result of the condition. You can go ahead and execute either one branch of the code or the other one.

And for that, we typically use the if-else. So like I mentioned to you, I'm going to introduce you to a new class. In this case, this class is called Elevator. And it kind of mimics the elevator that we all use. An elevator has many functions. We begin with an elevator that has only the following functions that you see here, where in this case the door of the elevator can open, the door of the elevator can close, the elevator can go up one floor, and the elevator can go down one floor.

We will see a bunch of variations of the elevator class throughout the different lessons that we are going to see tomorrow and the day after, all the way until the end of the week.

So here's a class. And this class, in this case, has a bunch of instance variables. The first one-- it turns out that it is what? It is a variable of type what? Boolean. It's called doorOpen, and it's initialized with what? The value false.

And then the next one is a primitive variable called currentFloor, of type integer, and initialize it to what? Most probably what it means here is the elevator on the first floor, right? And then of course here we have a variable that we, by the way, decided to create with capital-case characters, called TOP_FLOOR. And we declare it as an integer and initialize it to 10.

And also we have now a modifier called final, which means what? It is a constant. In this case, an immutable. You cannot change it. So that would be telling us that the elevator has been 10 floors.

And then here, the minimum floor in this case is an integer. And of course it's final, initialized to 1, which means the lowest floor would be floor number 1. This building does not have the basement. Right? OK, good.

And then we have a method here called openDoor(). Look what openDoor() does. First of all you put a message, "Opening door." And then after that, you assign true to doorOpen, which means in this case the door is open. And of course, after that, you go ahead and print another message that says the door is open. And this is pretty much mimicking how the door is open. Everybody sees that?

And then the same thing with the closeDoor() method, where we put, first of all, a message that says "Closing door." And then after that, we assign false to openDoor, which means now the door closed. Then of course after that we print a message called, "Door is closed." So it's just mimicking how an elevator works. Everybody sees that?

The complete elevator example code for this lesson is as follows. So you have the class, Elevator. You have all of these instance variables that you see here. You have the openDoor(). We've just seen it. You have the closeDoor(). We've just seen it.

How about goUp(). goUp(), what it does-- it prints a message saying, "Going up one floor." And then after that, it does what? It increments the currentFloor. Remember that, initially, the currentFloor is equal to what? One. And then we increment it. Now it becomes what? Two. And then after that, we'll go ahead and print "Floor" and then the current floor, is now floor number two.

And then the goDown() prints a message, "Going down one floor." and then we'll go ahead and decrement the currentFloor and print it out, which means if it was two and goes down, it becomes what? One. Everybody sees that? Just mimicking.

This elevator is a special elevator. It goes only one floor at a time, up or down. Of course, later on, we're going to somehow modify it and tune it so that it can work like every other elevator. And the whole purpose is to learn the whole steps, one by one, to get into that. Yes, Jane?

If the default is 1, and there's a decrement, it [UNINTELLIGIBLE]?

Yeah, so if the default is 1, and then you have a decrement, then that currentFloor will be equal to what? 0. But then we don't have a 0 floor, so we've got a problem here. So let's see how we can fix that. OK?

And by the way, this is a class, right? And we mentioned to you that in this course, whenever we create a class, if you want to test that class, we always create what? A test class. And then inside that test class, we put the main() method, and create the instant of that. Let's go ahead and-- of that class.

And here is the ElevatorTest.java. Do you see that? So in this case, we have a class-- in this case, called ElevatorTest. It has a main() method. Everybody sees that? OK. And then here, look what we do. We'll go ahead and create a new instance of the Elevator and reference it by the reference variable called what? myElevator. Everybody sees that? You see how we do it now in one statement [UNINTELLIGIBLE]. We declare a reference variable of type Elevator called myElevator and initialize it with a new instance of the elevator.

And look [UNINTELLIGIBLE]. Once we have now the reference variable, we can go ahead and call callOpenDoor(). Let's follow that. openDoor(), and then what? That means that the variable openDoor will be set to true. Then closeDoor then, we'll set to what? To false, exactly following what it does, right? The doorOpen, and the door-- and then after that, we'll go ahead and goDown().

If we goDown, then what's going to happen? In the goDown() here, the currentFloor is what? It's one. Going down is going to decrement the floor by one, which means now the currentFloor is equal to what? To zero.

Of course, then we go up, and then we go up an increment and increment that. Open the door, close the door, go down. And then we've got a problem here. We have that tendency to sense that it is a problem, because we said that the minimum floor would be what? Would be one. But now I have the currentFloor, which is one here, and now we're going down, and that's going to be decremented to zero. And that definitely, logically, wouldn't make any sense.

So continuing with that, and now looking again at the relational operators. Let's go ahead and investigate the relational operators first. Well, the equal-equal means what? It compares what? If it's equal. If it's equal, this is how it's presented, with equal-equal operator. So if I declare i as an integer and set it to one, and now I say, is i equal to 1, the answer is what? True.

How about now the not equal? It's an exclamation mark and then equal. So now I declare i and set it to two, and then I say, is i different than one? And the answer is yes.

How about strictly less? I declare i as an integer, and of course initialize it with zero. Is zero strictly less than one? And the answer is yes.

How about less than or equal? I declare i as an integer, and initialize it with one. Is one less than or equal to one? And the answer is yes.

How about strictly less? I declare i as an integer and initialize it with two. Is two greater than one? And the answer is yes.

How about greater than or equal. I declare i as an integer, initialize it with one. And then I say, is i greater or equal to one? And the answer is yes. Right?

Now one thing that you folks remember-- that this equal-equal has nothing to do with the equal sign. The equal sign is used to make what? An assignment. Right?

Now testing equality between strings. Here's a very good example, where in this case I have a class called Employees. Inside, I declare a couple of instance variables of type String. One is called name1, and I initialize it with a string, "Fred Smith." And the second one is name2, and I initialize it with the string, "Joseph Smith." Everybody sees that?

And now I declare a method. In this case, I define a method called areNamesEqual(). And look what I do. Now I go ahead and use, if names.equal(), and then a passed name. So I'm using what? The equals() method of the String class.

So in this case, if I click on the String class, and I click on Method, it turns out that actually there is a method called equals(). Here it is. And it takes an object. So what this [UNINTELLIGIBLE] compares the string to the specified object. The result is true if and only if the argument is not null and a string object that represents the same sequence as this object.

So here I'm trying to compare what? name1 to name2. And it's going to either print "The same" and if it's not equal-- if this is equal, if name1.equals(name2) is true, then I print this one. Otherwise I print this. Of course, in your opinion here, what's going to be printing? Different. Why? Because Fred Smith is different than Joseph Smith, as strings. Everybody sees that?

So if you want to test the equality between the strings of characters, such as in this case the name "Fred Smith," then use the equals() method. By the way, if you want to compare the reference variables, then you can use equal-equal. We'll see that later on.

Now let's go ahead and continue with some conditional operators. In this case, if you want to use AND, this is the AND. For example, here I declare i as an integer and set it to 2, I declare j as an integer and said it to 8, and then I say, is i less than 2? Is 2 strictly less than 1? The answer is false, right? 2 is not strictly less than 1.

And j is strictly greater than what? Than 6. So again, in this case, is 8 strictly greater than 6? Yes. But then, because of the end, everything has to be what? False. And of course, in this case, let me just go ahead and use the board to actually put in a table for you to understand the concept of AND and OR. So let me go ahead now and take a look at the board, and work on the board to be able to show you that.

And for that, let me just stand and go back to the board. I'm going to first erase this. And then show you the table.

So let's assume I have A and B. And let's assume that first I have A false and B false-- F for false and T for true-- or A false, B true. Or A true, B false, or A true, and A true.

So if I want to use A and B, I should say that false and false means what? False. And false and true is what? False. And then true and false is what? False. And true and true is what? So this is the only one that actually will become true.

Also, on the slide, we also have the A, then of course we're taking a look at the slide. The OR is represented by the two vertical bars. Again, here, if we want to say, false or false, gives us always what? False. False or true gives us what? True. True or false gives us what? True. And true and true gives us what? True.

All right. And then, of course, the other one is the NOT. And this is represented as this one here. NOT. So I have not A. Not false becomes what? True. And not false becomes what? True. And not true becomes what? False. And not true becomes what? False. So this is just, again, logic that most probably you folks know about that, from some discrete math that you took somewhere in college.

Let's go ahead and continue now. And now we can go ahead, and in this case look at the ternary conditional operator. The ternary conditional operator, which is the question mark and colon, says, some condition, if it's true, then take value one. Otherwise take value two. It [? remakes ?] the if/else.

Now let's go ahead create if and if/else constructs. And for that, we'll go ahead now and take a look at an if statement. And of course, an if statement executes a block of code, if the expression is true. We'll start with the if construct. And the syntax typically is, if boolean expression is true, go ahead and execute the code block. And that's typically how it works.

So if you remember, folks, when we worked with that elevator, we have opening the door, and then the door is open, and then closing the door, and then the door is down, and then going down one floor, and then here we see that the floor in this case is zero. You remember that was an issue that Jane mentioned earlier.

And this was an error in the logic, because of course when we looked at the elevator class, we decided that the minimum floor is one, and the maximum is 10. And the current floor at that time was one. So if you decrement one to zero, of course logically that floor does not exist, because this building does not have the basement.

So obviously this is an issue, and can we now find a way to actually resolve this issue? That's the idea. Now that we learn about the if construct, we can go ahead and use that to fix this problem.

That leads us to, in this case, saying-- now if you take a look, we're going to go back to the goDown() method and look what we do. In the goDown() method, we are going to use the if construct. We say, if the current floor is equal to the minimum floor, then we can print a message, which is-- by the way, minimum floor is what? One. So in that case, we're going to say, use the System.out.println and say what? "Cannot go down." Now we've created a mechanism by which we have control over this, and we cannot go down before that. Logically, this would make sense.

After that, if the current floor is greater than the minimum floor, then we're good. Then we'll go ahead and create "Going down one floor," decrementing that, and printing the current floor. This is a better goDown() method, right?

So now what we're doing through this, folks, is telling you, and of course teaching you, how you can use some common sense-- and of course, with the Java construct that we learned, we can now write smart methods, methods that guard against what's not supposed to happen. Right? OK, good.

And now we can see the variation of the new Elevator. In fact, this class-- now we call it the IfElevator, because it uses the if statement. It pretty much has the same type of instance variables-- openDoor set to false, [? currentFloor ?] set to one, TOP_FLOOR set to 10, MIN_FLOORS set to 1. Right?

And of course, we have the openDoor(). That's pretty much the same method that we've seen before. The only modification that we did is in what? It's in the closeDoor(), where now we'll go ahead-- rather, not of the closeDoor(). The closeDoor() is good. And then goUp() also is good. It is in the goDown() where we did the modification.

So in the goDown(), in this case, we actually now put a guard where we say, OK, if the currentFloor is equal to the minimum floor, we better put a message saying that goDown() cannot go down. Else, if the current floor is greater than the minimum door, which means at least what? Two. Because I know that the minimum floor is set to one. So in that case, we'll go ahead and put a message, "Going down one floor." And then we decrement the current floor. And then we print it out. Right? So this makes sense.

And now, by the way, remember if we are on the ElevatorTest that we've seen before, and we run it, you will get actually this message that says what? "Cannot go down." So again, in this case, the elevator logic prevents that problem. Remember that? So we prevented that through the if statement. Everybody's following here, folks? Good, good.

Now looking at the nested if statement-- here's an example, where we said, OK, goDown() method. If the current floor is equal to the main floor. go ahead and do what? "Cannot go down." now. We have an if inside an if. If the current floor is greater than the minimum floor, we want to check something else too.

And if the door is not open-- see how we see the exclamation mark, not? If it's not open, then we do what? Then we can go ahead and go down. So what it means here is the door is closed. Then we can go ahead and write the message, "Going down," and of course decrement the current floor and print it out.

This is called a nested if statement. Right? And in many cases, we might end up doing that. And by the way, we could also use an if/else construct or a nested if/else construct later on, when we work with our elevator.

And now let's look at the nested NestedIfElevator. This is a new variation of the Elevator class. And we called it now, in this case, NestedIfElevator. Again, same instance variables. Same openDoor() method. Same closeDoor() method. Same goUp() method. The only method that is now changed is the way we saw it in the previous slide, where we use a nested if statement. Right? Everybody's following? Good, good.

Now we look at the if/else construct. Well, the if/else construct sometimes-- we also use it. Here, for example, it says, if (boolean) block, code block one, else-- again, code block two. And that's how, typically, it's done, where in this case, boolean_expression is a combination of relational operators, conditional operators, and values resulting in a value of true or false. And then code block one represents the lines of code that execute if the expression is set to true. And the code block two represents, in this case, the lines of code that are executed if the expression is, of course, what? It's false. Right?

Let's see an example. Look at that, folks. We have a goUp() method. But let's look at the goDown() method. goUp() is pretty much printing a message, "Going up," incrementing the floor, and then in this case printing the current floor. But let's take a look here at the goDown().

First of all, we say, if the current floor is equal to the minimum floor. Then in this case, if this is true, then we go ahead and print this. "Cannot go down." Execute that statement. Else look what we do. Else we go ahead and print a message, "Going down one floor," decrement the floor, and print the current floor. Again, this is executed in the case of what? In the case this is false. If this is false, then we'll execute this.

And if you take a look here, we always enclose the block of statements between the double curly braces. And we do the same thing here. OK. By the way, in the first one, because we have only one statement, we didn't have to put this, if you have only one statement. If you have more than one statement, it's good to put them into a block separated by the curly braces, so they're all enclosed in the curly braces, so that they all execute in one block.

Everybody sees that? Good.

Now we see the IfElseElevator example, where again, the instance variables are exactly the same. The openDoor() method is exactly like we've seen it earlier. The closeDoor() is exactly the same. And the goUp() is exactly the same. But the goDown() now has an if/else. And if the current floor is equal to the minimum floor, go ahead and print this. Else go ahead and print the message, "Going down one floor," decrement the current floor, and print it out. Right? OK, good.

Now of course, if we run this, then if we use the same test, the ElevatorTest, of course, it's going to prevent that, because we took care of it through the if/else. Everybody's following, folks?

Now let's go ahead and chain the if/else statements. Lots of times, by the way, you can have if boolean expression, go ahead and execute the code block one. Else if another boolean expression, go ahead and execute that, else execute block three. Where the boolean expression is a combination of relational operators, conditional operators, and values resulting in a value of true or false.

Code block one represents the lines of code that are executed if the expression is true. Code block two represents the lines of code that are executed if the expression is false and the second condition is true. And code block three represents the lines of code that are executed if the expression in the second also evaluates to false. Right? Everybody's following? Good.

Let's look at an example. Here I now have a chaining if/else construct. So here I have a method called what? Calculate number of days. So first I say, if the month is equal to 1, or the month is equal to 3, or the month is equal to 5, or the month is equal to 7, or the month is equal to 8, or the month is equal to 10, or the month is equal to 12, then I'll print, "There are 31 days in the month." So [UNINTELLIGIBLE] represents what? January, March, May, July, August, October, and then December.

And then else, if the month is equal to 2, then I'm going to go ahead and do what? Print, "There are 28 days." Of course, some of you say, wait a minute, [? Joe. ?] This year, it's a leap day. How can we handle that? Don't worry about it. We'll give you that as a practice. It's a lab that you guys are going to do. But we give you the formula. It's well-known. You can Google it. It's on Wikipedia too.

Else, of course, if the month is equal to 4 or 6 or 9 or 11, then of course we print that there are 30 days in the month. Else we say it's an invalid month. Imagine you input 13. We don't have month number 13, even though sometimes we need a month number 13.

Everybody sees that, folks? So again, here, this will execute if the statement here is true. And this will execute if this statement is false, and this is true. And this will execute, the last one, if what? If this is false and this is false, then of course this will execute. And this one will execute if none of these are true. Got that? Everybody sees that?

Of course, as you see, if/else, if/else, if/else-- sometimes people don't like that. Sometimes developers say, well, a lot of if/else. It's not readable. I don't like that. Don't worry about it. We created a construct in Java that actually simplifies this. Let's go ahead and look at that.

And that is called the switch statement. And by the way, it's similar to-- how many of you have seen switch statements in the C language and C++? Kind of similar.

So the switch syntax takes a variable, and then it goes through cases. If the case literal value is this, then go ahead and execute the code and break out of the code. By the way, this is optional. That's why we put it between square brackets. Another case-- again, you go ahead and execute the code. And then, of course, in this case, we'll break out. And the default would be another code.

So we see the literal value is any valid value for that variable that might contain. You can also have a case label, for every value that you want to, in this case, test. Literal values cannot be variables, expressions, strings, or method calls. By the way, they can be strings, and that's new. The new feature of the switch statement in Java SE 7-- you can work actually with, also, strings in addition to integrals.

And the break statement is an optional keyword that causes the flow of code to immediately exit the switch statement. Again, without the break statement, all the code statements following the accepted case statements are executed.

And now, let's take a look at the example of the switch statement. So now we have a class called the SwitchDate. We go ahead and declare a variable of type integer called month, and then assign 10 to it. And then we have a method here, calculate number of days. It uses the switch statement that uses an integer here, and goes-- for case 1 or case 3 or 5 or 7 or 8 or 10 or 12, we go ahead and print this statement, then break out of the switch statement.

Now one thing, again, as you see here-- pretty much the calculate number of days method here in the SwitchState class uses the switch statement to branch on the value of the month variable. If the month variable is 1, 3, 5, 7, 8, 10, or 12-- either one of them-- then of course the code in this case it jumps to this statement here and prints the, "There are 31 days in the month," and breaks out of the switch statement. Everybody sees that?

And here is the complete class. So in the complete class, as you see here-- let me scroll down so I can see the whole thing. So you have a SwitchDate. You declare an instance variable, in this case a primitive month of type integer, and initialize it with 10. And then we have the calculate number of days that uses the switch statement. Pass the month to it, and of course, in this case, because month is 10, it's going to go through this case, and then it's going to print this one and break.

And of course, if you have case two, where the month is two, we print this one. If it's 4, 9, 6, or 11, you print this one. Otherwise, you print "Invalid Month." And every time, you break out of the switch statement. Right? Everybody's following?

So when to use the switch construct? When you have equality tests or testing against a single value, such as a customer status. By the way, you test against the value-- it could be an integer, or a short or a byte, or a character. This is fairly new. The string is added in the Java SE 7. If you use the string in the switch statement in SE 6 and before, it's not going to work. Again, it test against the fixed value known at compile time. Right? Everybody's following the switch statement? OK, good.

Here's a quiz. What is the purpose of the else block in an if/else statement? What would be the answer here? Yeah, you just said it. B. Thank you. To contain code that is executed when the expression in an if statement is false. Thank you.

Second quiz. Which of the following sentences is suitable for testing a value in a switch construct? Again, we'll tell you the switch construct tests whether values are greater than or less than a single value. Again, it is correct, A, because a relational practice should be used to test whether values are greater than or less than a single value. How about B? The switch construct tests against a single value in the variable, and that is true.

Of course, C-- the switch construct tests the value of a float, double, or boolean data type and a string. Again, here, it is incorrect, because the switch construct tests against what? A character, a byte, a short, integer, and a string.

So in summary, we looked at the use of relational operators. We looked at testing equality between strings. We looked at using a conditional operator, creating an if and if/else construct, nesting an if statement, chaining an if/else statement, and using a switch statement.

Of course we have a bunch of practice labs for this lesson. First one, you're writing a class that uses the if/else statement. Second, writing a class that uses the switch statement. Of course, what we're going to do now is look at the details of the activity guide.

So again, let's go ahead and look at the details in the activity guide. And this, of course, would be practices for lesson seven. So the first one would be writing a class that uses the if/else statement. Of course, in this case, we'll give you all the steps, step by step, the detailed steps how to do this practice.

And then the second one, writing a class that uses the switch statement. And in this case, you'll see how, step by step, we'll show you what is it that you need to do. Step by step.

So let's go ahead and do practice one and practice two for lesson seven. And after we finish with that, we'll go to lecture lesson eight. Thank you.

## 2. Practice 7-1: Writing a Class that Uses the if/else Statement - 10m

OK, let's go ahead now and, of course, after looking at lesson six, where we discussed using operators and decision constructs, we were there. We discussed the relational operators. We discussed the relational and conditional operators. We looked at the common conditional operators. We looked at the eternally conditional operators.

We looked at the if construct. We looked at the if-else. We looked at the chaining if-else constructs. We also looked at the concept of the switch construct.

Let's go ahead now and take a look at and do the practices for lesson six. And we start with, of course, practice 7.1, which would be the first practice in this case for lesson seven. And this course practice, again, will have us work on writing a class that uses the if-else statement. So in this practice, we create classes that use if and if-else construct.

There are two sections in this practice again. In the first section we create the date to class that uses if-else statement to display the day of the week based on the value of the variable. In the second section we create a clock class that uses the if-else statement to display the part of the day depending on the time of the day. In this case, by the way, as an assumptions they gave us the clock test and the day to test classes. So the test classes are given to us.

Starting with the first one in this task, we create a day two class that evaluates a numeric field in order to determine the day of the week that corresponds to that number again. We use the if-else construct to do that. In this case, step one, we create a new project that will be practice seven. And of course, set the source package, in this case, to point to the D:/labs/les07. And that stands for lesson seven. And we should remember to also in this case change the source binary format property, and so forth.

So again, in this case, it would look something like this. And then we create a new Java class called day two, and we declare again and initialize a member field for this class called day number. Number, of course, the value assigned should be a number between one and seven inclusive, and of course where the number one represents Monday, beginning of the week, and seven represents Sunday. Again, hint, use the int data type.

After that, we'll go ahead and create a display method in the day two class, again, in this high-level instruction of this are provided in this table that we see here. And pretty much in this case, the sort of code that also helps us create this code in the method is the display day method, uses the concept of if condition, and that should check the value of the number again. Hint, here we use the equal sign within the if block, and then, of course, print out the day of the week. It's Monday, Tuesday, and all that.

So it should look like this. If condition one, go ahead and print corresponding day. Else, if condition two, go ahead and print the corresponding day, and so forth, all the way down. Of course, if day number again is not a number between one and seven inclusive, then in that case we should print an error message, in this case, saying that, of course, it's an invalid day and so forth. And then save, compile, and execute your class.

Let's go ahead and then of course in this case take a look at how we rewrite all of this. So for that, again, we want us to create a new project, again, Java from existing next. And then we call it practice seven. And then of course next we'll go ahead and add the folder D:/labs/les07 and click finish. It turned out that I already have it, so I'll just open it.

And of course, inside, as you remember, they give us the day two test. It's already there. And what they ask us to do is create the day two. So you see here, we first create an instance variable called day number and initialize it to one, and it's of type integer. And then we have the display day method that of course goes through a bunch of if-else chaining if-else for the first one.

If day and number one is equal to one, then we'll print Monday. Else, if day number is two, then we create Tuesday. We create print Tuesday. If, else if day number is three, we'll print Wednesday. Else, if day number is four, we print Thursday. Else, if day number is five, equal to five, we print Friday. Else, if day number is equal to six, we print Saturday. Else, if day number is seven, we print Sunday. Else, of course, if it's not a number between one and seven inclusive, we will print a message that says the day that you entered again, in this case, let's just assume 15, entered, this is not a valid date. OK?

And of course, they want us to test it. And for that, we have a class given to us called day two test. And what we do over there, we create a reference variable of type day two called my day two, and of course, initialize it with a new instance of date. And then after that, invoke the display method or the display day method on the my date two reference.

And of course, if we run this, and since, by the way, in this case, in this class, we decided the day number is one, then in that case when I run it, it should print Monday. Let's go ahead and do that. And as you see, it's Monday.

Let's go ahead and change this, just out of curiosity. Change it, for example, to six. And then of course, by clicking, by saving it, it automatically compiles it. And then, of course, in this case, I'll go ahead and run it. And that, of course, prints, in this case, Saturday.

But let's now print a real type of a number. Let's put 14, for example, in this case. Save it to compile. And then we go ahead and run that. And if you run that, of course, you see that says 14 entered. This is not a valid date.

Next, what they want us to do in this practice is they want us to now write another class that uses the if-else. And in this case, the class is called clock. And that uses if-else statements to display part of the day, depending on the time. If it's again, in this case, as you see, we use the typical military time.

And in this case, 08:01 to 12:00, that's morning. 12:01 to 17:00 is, in this case, afternoon. 17:01 to 24:00 is evening. And 00:01 to 08:00 is early morning. So we create a new Java class, in this case, called clock, that contains of course an integer field called current time, and initialize this current time, again, to hold the hour of days, in this case in general. If it's 04:00, it means four o'clock, and 15:05 means 15:05.

Of course, in the clock class, we create a display part of the day, and it displays the part of the day associated with the value of the current time field. For example, if the current time field is equal to 21:00, you display evening. And of course, you need not check the values outside the range of one to 24:00. Again, hint here, we use the if-else construct. And it should look something similar to what you see here, folks, OK?

And so when we save, and of course, we execute that. Let's go ahead and just try to look at this and run it. So again, they gave us the clock test, as you see. And here, it's already there. And now here's the clock class that we created. So as you see, it has a instance variable of type integer called current time.

And by the way, here we decided it's going to be 21:00, which is, by the way, 9:00 PM. So most probably, this will print evening. And let's take a look at that and see if that's true.

So in the display part of the day, we say if the current time is greater than or equal to 08:01, which is eight o'clock and one minute, and-- you see how easy now the conditional and here-- and then if current time is less than or equal to 12:00, we print morning. Else, if the current time is greater than or equal to 12:01, and of course, if the current time is less than or equal to 17:00, then we print afternoon. And of course, else, if the current time is greater than or equal to 17:01, and the current time is less than or equal to 24:00. then of course it's evening. Of course, else would be early in the morning. OK?

And then, of course, and now let's go ahead and run this. And based on the current time here, if we run it, it's going to give us, like I mentioned-- oh, sorry. We need to run the, again, the class that has the main method, the test class. If you run that, of course, you'd see that it's in the evening. We can always change this, by the way.

How about if we just put, in this case, 100? Let's see what this gives us. And I save, [UNINTELLIGIBLE] compiles, and then I go ahead and run it. And as you see here, it says early in the morning, OK? So why? Because it doesn't fit in any one of these if-else, and it goes to the last one, which is, of course, in this case, it would be early morning. And that, of course, pretty much ends the practice one of lesson seven. Thank you.

## 3. Practice 7-2: Writing a Class that Uses the Switch Statement - 5m

OK, let's go ahead now and take a look at the second practice and the last practice of lesson seven. In this practice, we create a class called Month that uses switch statement. You see how in this time, folks, we are now using the switch construct that we learned in the lesson, of course, to display the name of the month based upon the numeric value of a field. The assumption here is that we already have the MonthTest class. Of course, that appears in the D: back slash labs back slash les7, the lesson seven.

And so the task is we create a new class called Month. And we declare an n field in the Month class call month number. We assign a value to the field that is between one and 12 inclusive where one represents the month of January and 12 represents the month of December. Then we create a method in the Month class called displayMonth. This method uses a switch construct to inspect the value of the month number field and display the corresponding name of the month. Again, the displayMonth method should also display an error message if the month, of course, is invalid.

And that we know the hint is we use the switch statement as you see here where we have switch in the variable. And then we see the case. If it's case one, again print, in this case, the January instance all the way through December. And of course, if it's outside, we should print that there is an error or it's an invalid month. And they asked to, again, in this case save, compile, and execute that. And let's go ahead and do that.

And so we have the month test. This is given to us where we just create a new instance of the month referenced by the reference variable by month. And then of course, we call the display month. Let's go ahead and take a look at the Month class that we created. So you see here's the Month class. And this Month class, again, has an instance variable called month number of type integer. We again assign it six here, which most probably will give us month number six, which is June. And then we inside the displayMonth method, we'll use the switch statement here where we make use of the month number as a variable.

And then we say, if it's case one, print January and break out again. Break means you break out of the switch statement. If it's two, print February and break out. And if it's three, again, print March and break out. If it's four, print April, break out. And keep on going all the way until if it's 12, in this case, then go ahead and print December. Of course, if it's not a number between one and 12 inclusive, it should print this number that you entered and it says it is not a valid month.

So for now it has the month equal to six. So just out of curiosity let's go ahead and test this. And if you test it, it says June. How about now if I wanted to enter in this case 10? Again, I save it so that it gets compiled automatically. And then I go ahead and run it. And if I run it, it says month of October. Now how about if I want to put a number, for example, in this case 17? And then I save. And then I'll go ahead and run now. And of course, this should give me an error message. Let's go ahead and run that. And it says 17 is not a valid month.

So as you see this switch statement is a very, very friendly type of a Java construct that, of course, shows us, again, the code here that is clearly readable compared to the if as if as if as. Folks have tendency or developers have tendency to make use of the switch statement, in general, which is, again, the preferred construct over the if as if as if as and so forth. So that pretty much ends the last practice of lesson seven. Thank you.
