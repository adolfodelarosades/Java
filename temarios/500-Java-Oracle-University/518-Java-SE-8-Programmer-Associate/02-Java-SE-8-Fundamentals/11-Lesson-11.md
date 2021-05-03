# 11: Lesson 11: Using Conditionals

1. Lesson 11: Using Conditionals, Part 1 - 10m
2. Lesson 11: Using Conditionals, Part 2 - 10m
3. Lesson 11: Using Conditionals, Part 3 - 8m
4. Lesson 11: Using Conditionals, Part 4 - 12m
5. Practices for Lesson 11 - 18m
6. Skill Check: Using Conditionals - Score 80% or higher to pass

## 1. Lesson 11: Using Conditionals, Part 1 - 10m

Lesson 11 is Using Conditionals. We've played around a bit with conditionals already, conditionals being if/else statements, but there's actually more you can do with if/else statements. There are additional conditionals like switch and the [INAUDIBLE] expressions, which we're going to talk about in this lesson.

So let's get started with relational and conditional operators. That's our first topic. Let's review some relational operators. We have ==, which means equals to. We have not equals. We have less than, less than equals to, greater than, greater than equals to. I'm sure you guys remember these. These are our friends, the operators. Let's take a look actually how strings are compared, because strings are a bit different in Java.

You don't want to use == with strings, and I'll tell you why. It's because of how strings are handled in memory. What you're probably interested in when you're comparing strings is the content of the string, not location in memory of the strings. If you use ==, this means you're checking on the location in memory, and you're not checking out the content. What you instead want to do is use .equals. .equals looks at the actual content of the string. This is the stuff that you'd probably be interested in.

So if you look at the code below, in the are equals method, here we're checking to see if the content of the strings are equal. It's not, so then we go to our else statement, and we say that, yes, these are different names. You also have the option-- here is another method that Java provides you that's associated with the string class. You have .equalsIgnoreCase.

So if you have two strings, you want to check if the content is equal, and we don't care if it's uppercase or lowercase. Uppercase F, lowercase f, uppercase S, lowercase s-- though that doesn't matter to us. We just care about the actual characters. So if those are the same, which they are, then this line will print here, same name.

Here's an example where-- you really shouldn't do this though. You shouldn't do ==. And this will work because of how strings are handled in memory, in Java. In order to save memory, Java is going to create two different reference variables that point to the same location in memory. So you actually in the heap memory, you only have the entry Fred Smith.

That exists there only once, and instead you have two references to that same content. This can get a bit tricky, because if you end up changing, if you do, say, name2= something else-- if name2="Bob," then these two references are no longer going to be equal. They'll be pointing to different locations, different content in the heap memory.

If you choose-- no, you should never do this either. You should probably never instantiate a string using the new keyword. If you do it this way, you'll tell Java to create two different entries in the heap memory. So you're going to have two distinct objects when you use the new keyword, but it's less memory efficient. And if you go in to check to see if they're equal, even though the content is equal, Fred Smith, and the content is what we care about, Java is going to say, no, these are actually different names. Why? Because == means you're checking on the location in memory of the object.

Instead, they are going to have different locations in memory. So therefore, we're going to have-- Java's going to take that we have different names. You can go a bit further with conditional statements if you're using if. If you're using else, you can end up comparing two different conditions.

So here we have &&, which means it's going to check to see two separate conditions. We're going to check to see in this example, is I less than one? Is J greater than six? And if both of these evaluate to true, then the overall expression evaluates to true. If just one of these evaluates to false, then the overall expression evaluates to false.

We also have or, ||, and what that means is it's going to check to see, is I less than one? Is J greater than 10? If just one of these is true, then the whole expression evaluates to true. If they're both true, that's even better. The overall expression will still evaluate to true. The only way this evaluates to false is if both statements are false.

And then finally, we have NOT. This is one that we're more familiar with, because we have != as well. But essentially, what you're doing is when you have NOT, you're taking the opposite. So let's say I less than three evaluates to true. By putting !true, this actually ends up evaluating to false. We also have what's called the ternary conditional operator, shown here, which means if some condition is true, then you assign a variable to be the first value here. If the condition is false, then you assign the variable to be equal to the second value.

Here is our example. We have a statement, check to see if y is less than x. If it is, z is going to be set to the value of x. Otherwise, if this is false, set z to be the value of y. And this is exactly the same as this if/else statement written right here. You get the exact same results. The advantage, though, is that this is-- let's see. It's one, two, three, four, five, six. This is six lines of code, whereas this right here is done in only one line of code. So you may prefer to do something like this, because it's quicker to write.

So again, yeah, the advantages-- it's usable in a single line. Another advantage is that you can place this statement directly within an expression, shown here. We have our print statement, and we're checking to see the number of goals. If the number of goals is equal to one, then we don't want to add-- actually, I'll write this out. I scored number goal or goals.

If this value is one, then it's grammatically correct to say I scored one goal. If it's a number that's greater than one like two, then it's grammatically correct to say I scored two goals, the plural form. So what we're able to do with the ternary operator is insert this directly inside of our print statement here. And depending on how this evaluates, depending on the number of goals, this is going to end up producing a value of either the string goal or the string goals.

A disadvantage, though, with the ternary operator is that you can only have two potential values. This here is a Boolean, the condition that we're checking, which means it's going to either evaluate to true or false. There's nothing to trigger a third value. So you can either have true, or you can either have false. There's nothing you can really do to get-- even if you wanted to have a third value, there's no way to get to it. I want you to try and give this a try now. Use the ternary operator, and reproduce the same logic that you have here. But instead of doing it using if and else, do it using the ternary operator.

## 2. Lesson 11: Using Conditionals, Part 2 - 10m

Now that you've had a chance to play with the ternary operator, let's get back to the lesson, and we'll cover our next topic, more ways to use if-else statements, because there are secrets about the if-else statement we haven't told you about yet.

So we asked you to play through Java Puzzle Ball Basic Puzzle 12. I'll go through that right now and then debrief you on what you may have observed. And as we play, just keep in mind what happens if the ball strikes the blade. I hope you guys have tried this on your own, but I'll do a little walkthrough here just so we can get everyone on the same page. But I should say that if you play it on your own, being able to discover and play and get your hands dirty, there's such a great benefit to that.

But anyways, let's get to it. So here we are, Basic Puzzle 12. I've got to try and figure out a way to get the ball to Duke.

There's some new things here. I like the sharp one. I want to see what I can do with that. Neow. OK. Looks like it turned the ball.

If the ball strikes the blade, it turns into a blade. What does that do? Let's see. I'll send the ball down. Pew.

OK. It destroyed-- if the ball is a blade, it destroys-- pew-- the next object it touches. If that's the case, why would I ever want to use the blade? Maybe if there's like something blocking me and I need to get through?

Is there something else I can do with it, though? Let's see if the fan does anything, because it's not-- it shouldn't actually touch the fan. The fan's going to be blowing it. Whoosh.

OK. So if the ball is a blade and it touches the fan, it doesn't-- it gets deflected. It doesn't turn back into a ball and it doesn't destroy the object. But it should still destroy the next thing it touches, right?

Whoosh. Pew. OK. So it's checking to see if it's anything other than a fan-- pew-- or a blade, I imagine, because it's already a blade. You don't want to turn it back into a blade. OK.

So I think I'm understanding some of these conditions, but let's get back to the lesson and sort of debrief on what we've observed. So what happens if the ball strikes the blade? If the ball strikes the blade, it transforms the ball into a blade. If the ball is a blade and and it strikes the fan, the ball is blown in the direction of the fan. Means it will come down here, transform, get blown, and keep going. If the ball is a blade and and it strikes any object other than the fan or or the blade, destroy that object and then transform the ball back into a blade.

So when I read this slide, it sounds pretty abstract. That's why I wanted you guys to actually play the game, because you build learning by doing. You'll build your understanding much, much more effectively than just going over a bunch of text here. But the reason why we provided this text and provided the summary is to show you that this is a bit more complex level of thinking. But it's a complex level of thinking that you are definitely capable of.

When it comes to handling complex conditions with a chained if construct, the chained if statement, what that does is it connects multiple conditions together into a single construct. And this allows you to have much more complex logic. It often contains nested if statements. What that means is you have an if statement, if here's some condition. Within that if statement, you have another if statement and it's nested within the original if statement.

And it tends to be confusing to read, like I talked about on the previous slide, and hard to maintain. But don't let that discourage you. Just try to be careful about how you end up writing this.

So I'll give you another example. How many days are in a month? And this is something that we're all pretty familiar with. The code for that is written here. And it looks a bit complex.

It's actually kind of easy. It's harder to look at it when it's done if you didn't write it. If you're the one who was actually writing it, who's programming it, then since it's your creation, it's easier for you to understand all the bits and pieces, because all the bits and pieces were coming from you. But yeah, let's take a look.

Starting Line 1, we're looking at certain months. We're looking at month 1, 3, 5, 7, 8, 10, 12. All these months, what do they have in common? They all have 31 days.

So if we're looking at a month which is month 1 or 3 or 5 or 7 or 8 or 10 or 12, these are all the possible scenarios where a month will have 31 days. And we only need one of these statements to be true in order for our month to have 31 days in it.

Else, if our month doesn't have 31 days, let's say our month is February, here's that condition if our month is 2, if it's February. Well, then we have to go a bit further to say, is it a leap year or is not a leap year? If it's not a leap year, then we know February is going to have 28 days. Else, it'll have 29 days.

OK. So we've covered our months that have 31 days. We've covered our months that have 28 or 29. There could be some that have 30 days. We'll need another else-if statement right here to continue on to check months 4, 6, 9, or 11 to see if that has 31 days. Then we'll print that out.

Otherwise, there's one last thing we have to cover. We have our final else statement at the end. If we're looking at a number-- this is for if we're looking at a number that's not a valid month, like if we are looking at month 0, month 13. A year doesn't have 0 months. It doesn't have a 13th month. It doesn't have negative months.

So we need this last statement right here to anticipate that scenario. The code is a bit complex, but in order to simplify-- here's a simplified version of that. When you're creating an if-else construct, you first start with your if here in Line 1. You have your initial condition that you're checking. And then you have some code, the code that you want to execute.

You follow that with an else-if statement where you check another condition and then you execute a bit of code. You can have as many else-if's that you want. They just have to follow an initial if. So you always have to start with an if, but then you can go else, if, else, if, else, if. You can do else-if as many times as you want.

And then finally, you have your last else. With your last else, you don't have to specify any condition, because this is what's considered your default code, or if there's any condition that you haven't thought of, just perform these actions right here. There. There's our final else. And you can only have one else and it has to be at the very end.

I'd like you guys to try experimenting with this now. Try creating your own chained if statements in Practice 11-2.

## 3. Lesson 11: Using Conditionals, Part 3 - 8m

Now that you've finished Practice 11-2 and created your own chained if statements, I'll show you how to do the same thing using switch statements. Handling complex logical conditions with a switch statement offers a few advantages. One is that switch is a streamlined version of a chained if statement. That makes it easier to read and maintain, and offers better performance.

Here we have the same-- so this code does the exact same thing as our code before. We get the same results. But you'll notice that this may be a little bit easier to read.

It's also a bit more efficient as well, because what our code does, it looks at month. Say we're provided with the month February. It'll know right away what month that is. It'll know right away that's it's 2. So our code just goes right down to executing this scenario.

We also have another keyword, break. What break does is that it tells Java to break out of the switch statement, so we'll break out and we'll start executing whatever is below Line 18. Let me actually-- I can demo this in NetBeans for you guys, actually.

All right. So here we have the code. We have our month up here, month number 2. And it is a leap year. LeapYear is set to true.

We go and run this and we find out that there are 29 days in Month number 2. All right. What happens if we don't have the break statement, though? Break statement tells it to exit, but what happens if we don't exit, because none of these other cases are going to be true, right?

Let's see what happens then. Now we're printing two things. We're printing that there are 29 days, but then we're also printing that there's 30 days. So why does this happen?

This demonstrates why it's necessary to have to have break statements, because if you don't, the switch statement would just go on and continue executing all of the code in the following cases, even if that's not that particular case. So even though it's not February here, the Java is just going to keep on executing this code here, ignore the cases. So that's why it's important to have the break.

A couple other things to note. We have default down here. And this is just like our final if statement. All it's saying is, if none of these cases are true, then we're going to say it's an invalid month.

So if we have Month 20, there's not 20 months in a year. Invalid month. If we have Month negative 2, can't have a negative month. Yeah. Invalid month.

The one thing that we can't do with-- well, there's a couple of drawbacks to the switch statement. We still need to have an if-else statement here, because you can't do nesting like you would with if-else.

And also something you'll notice is we're evaluating a single month. There isn't a way to end up evaluating if it's a month or isLeapYear. We're not allowed to do this. The switch statement is only allowed to handle one particular thing. You can only test against one value. And that's the reason why we need to have the if-else construct in here.

All right. Let's keep going. This is a bit complex the way it's all written out. If you just need like a general formula to understand the general syntax, here's a simplified version. Here we have our switch statement, Line 1. And in our parentheses, we provide the statement with whatever variable or expression we want to test. That's where we entered in our month variable, our integer month variable.

And then we list out our cases and what those values are going to be. We're dealing with an integer, so we're going to specify our cases are going to also be integers. They'll be 1, 2, 3, 4. You can keep doing that. You can keep doing cases as many times as you want, just like you can continue doing else-if's as many times as you want.

At the very end, if you want to provide a default statement, you can do that. Default is going to be for any scenarios, any cases that you haven't yet specified. And then it'll just execute the code there, and that will be the end.

One last thing to note, though, is be sure to include your break statements. Now, you don't have to include break statements. But I demonstrated what happens if you don't. And sometimes there may be an advantage to writing your code that way. And sometimes there won't be. So if you are writing a switch statement and you're wondering why is my code behaving funny, chances are that you may have forgotten to include a break statement just before the new cases start.

So when would you want to use a switch statement? You want to use a switch statement when you're testing equality, not a range. The reason why is because you need to specify every particular case. You're not allowed to specify a range. That's why switch statements, they work with integers, shorts, bytes, characters. These are things that are definite.

You're not allowed to use for instance a double. Why wouldn't you want to use a double? Because you have to specify each case. So say you want to do-- if you're working with a double, there are many possible values. If you want to evaluate something that could be a double, there's 1.1, there's 1.2, there's 1.200001. There's no way to specify every possible double scenario, so even if the switch statement could support doubles, you wouldn't want to do it because it's just way too much work.

You also want to use a switch statement when you're testing against a single value. In this case, our single value is month. And you want to compare that against fixed known values at compile time. What that means is you're just specifying each individual case, 1 3, 7, 8, 10, 12. We know what our cases are going to be. They're going to be the 12 months of the year. So this becomes a very practical way to write our code, using a switch statement.

And the following data types are supported, int, short, byte, character. You could also use strings or enums, enumerators, which is something we're not discussing in this course, though. You can also use it with wrapper classes, such as capital I Integer, short, byte, and character.

Practice 11-3 is about using switch constructs. In this practice, you'll do the same thing that you did in Practice 11-2, except this time using a switch statement.

## 4. Lesson 11: Using Conditionals, Part 4 - 12m

Now that you've finished Practice 11-3, we're going to skip to a completely different topic, which is using the NetBeans debugger. Ah! It's a bug. Got to get rid of it.

Most IDEs provide a debugger. They're helpful for solving any logic problem, such as if you ever ask yourself, why am I not getting the results I expected or any sort of runtime errors, it's good for helping with that too, like a NullPointerException.

Here are the basic things you need to know when it counts debugging in NetBeans. First are breakpoints. Breakpoints are stopping points that you set at a particular line of code which stop the execution at that line so you're able to view the state of your application. State refers to the state or values of your variables.

You can step through code, which means after stopping at a breakpoint you can walk through your code line by line to see how things are changing, to see what the values of your variables are with each line of execution. Variables, I've mentioned that a lot. Those are very helpful, because NetBeans allows you to view or change the values of the variables at runtime.

And you have your output, which allows you to view the system output at any time. This is a separate window. Variable and output are separate windows in NetBeans. I'll actually pull that up. That should be helpful for you guys.

Again, instead of going over the slides setting a breakpoint, I'll show you how to actually set a breakpoint in NetBeans. So here we are at our switch statement. We're going to click anywhere on the numbers to set a breakpoint. You can set one breakpoint. You can set two. You can see three, four. You can set as many breakpoints as you want. I just want to set one for right now.

And once you set a breakpoint, instead of running the program like you normally would, by pressing the Run button, I'm going to debug the project. I go to debug it, and here below I see a tab for Variables. And it's showing me the value of all the variables.

I have month, int. That value is 11. I have isLeapYear, Boolean. That value is true. The values won't change over time in this case. But if you were to have a statement that changes the values, then you'd see that reflected down here.

So I walk through line by line to see what happens. Whoa. We jump right from this line-- from Line 8, we jump right to Line 22. And this is what I mean when I say that the switch statement is more efficient. It knows exactly what it wants and it goes right to it.

OK. So what does that look-- and then we go to the break statement. And then we break out of the switch construct. What does this look like for if-else instead? Here we have 11 for our month. We'll set a breakpoint by clicking and then go to debug it.

So I'll walk through line by line. It looks like I'm at Line 8 now. I walk through. OK. Now I go to Line 11. Now I go to Line 19.

And it's checking to see if the value of month is equal to 4, is the value of month equal to 6, is it equal to 9, is it equal to 11? It should be 11, so then we should be able to go inside of this. Yes. OK. Now we go to Line 20 and we're running the code right here.

And this is demonstrating why the if-else construct is less efficient. This is demonstrating why the if-else construct it less efficient. Instead of going right to the line we want, we have to check each individual if-else statement until we finally get to the code we want. And then once we find it, then we're allowed to break out.

But I also told you that we're able to see the value change over time, so let me actually demonstrate that for you. month plus, plus; month plus, plus-- I forgot the semicolon-- equals 100. OK. And so I'll walk through this code line by line so we can see what's happening, see the changes.

So I go to debug this code. Here we are at Line 8. We see that our value for month is 11. After Line 8 executes-- OK. Now it's become bold. That's to show us that the value has changed. We've incremented it by 1.

Let's keep going. After Line 11 executes, it gets incremented yet again. OK. Let's keep going. We're at the beginning of Line 10, and after 10 executes, now we've set the value to 100. And that's being shown down here.

You also have the ability to change this value directly through debugging. So if instead of having it be 100, let's set it back to a better number, a more realistic number. We'll set it back to 4. And then let's run our code, because otherwise we would have gotten our invalid month message.

But let's see now. Are we going to get invalid month, or are we going to get, there are 30 days in this month? We'll keep stepping through. And what is our output?

Go to the Output tab. Looks like it's triggering it in Line 26. Yes. There we go. OK. So yeah, we're working with a real number, not a fake month. And that ends the program.

One thing that we can't do, though, is as we're running the program-- and I'll show you this. Say we start with month 100. We go to the debug, and so we know we're going to get an error. So we'll go through the code a little bit.

And then I'll say, hmm, no. I don't want my code to be-- I don't want it to be 100. I want a real number. Let's go with 11.

If I continue running the code even though-- if I continue running the program even though I've changed the code to reflect 11, it's not going to execute that. It's going to go to an invalid month. So you're not allowed to change your code after it's compiled like that.

So that's why if you notice this in Java Puzzle Ball, if you go to change your program, if you go to change some of the behaviors that you've assigned while it's running, it won't let you do that. It'll just restart the level. So that's where that rule came from, in order to accurately reflect what's happening in Java.

Let's get back to the presentation. Getting back to the presentation, I've demoed how to set breakpoints and how you can set many breakpoints. During the demo there were also a few buttons in NetBeans that you may have noticed as well that I haven't explained.

Button 2 is the Stop button. That stops the debugging completely. 3 just pauses it, and 4 resumes it. If you did pause, then you'd go back to hit Resume.

5 means stepping over. If execution has stopped just for a method invocation, you may want to skip to the next line after the method. This is the button that I was hitting while I was demonstrating NetBeans debugging to you. But you have a few other options available, which are 6, stepping over an expression. If execution has stopped just before an expression, you may want to skip over just the expression to see the final result.

7, right here, which is stepping into, you may prefer to step into an expression or a method so that you can see how it functions at runtime. You can also use this button to skip into another class that is being instantiated. Then finally 8, step out of, that would be this button here. If you have stepped into a method or another class, use this button to step back out into the original code block.

And I've also shown you about how to view variables. All you have to do is go to the Variables tab, and then you'll see the values of variables here. And you also have the ability to manipulate the values of these variables while you're debugging, through down here though, not up here. Red right here would show where you set the debugging to start. And then this green line right here or the arrow shows the current line of execution.

So in summary, in this lesson, you should have learned how to use a ternary statement, test equality between strings, chain an if-else statement, use a switch statement, and understand how to use the NetBeans debugger.

Your homework for this lesson is explained in Practice 11-4, Using Conditionals. In this practice, you are asked to enhance the soccer league application to keep track of points and goals of each team. These features are best implemented using conditional statements, but it's up to you to figure out the implementation details.

What your code should do in the end is-- I can show you the output. Let's say you go to run the code. And it's at the end of each game, what you're doing is you're totaling each team's score and displaying it. You're providing a little header at the beginning to say which team is playing which other team. And then at the end, you're displaying for each team the number of points that have been awarded based on wins or ties, and the number of goals scored. And then finally, you announce who the league champions are.

## 5. Practices for Lesson 11 - 18m

In practice 11-1, use the ternary operator to duplicate the same logic shown in the if/else statement here. Hopefully you've tried this on your own. But if you've gotten stuck and can't find a solution, I'll provide you with a walk-through in this video.

Let's open up NetBeans and see if we can figure this out. What we need to do is-- let's see, what is the ternary operator? We have our condition and then we have two values that we want to do, or two operations we're going to perform. So the first one is going to be-- let's see-- I'll just do this to set things up.

And then we have some condition. So this is what it's going to look like. So let's see. What are the two things that happened here in the if/else statement. So the first result could be x plus equals y, which means x is going to equal its previous value plus y. So I'm just going to copy that, paste it here.

And this is the other possible scenario. x is going to equal its previous value times y. And then we need our condition, which seems to be-- this looks like our condition right here. So let's pull this up, copy, and paste that. I should put that in parentheses, too, but it's not quite right yet. We have to say x equals this.

What's wrong now? Oh, semicolon. Right. It's such a common mistake. And then we just have to print our result. So I'll print out after ternary operator x equals and then we'll print our variable x. So we should get the same results here.

Ah, we don't. Why not? Oh. Because the if statement is still here and it's ending up changing the values of x and y. So OK. Just to make sure we're starting with the same values, I'll copy that from up here. So we have two separates where we're resetting the values of x and y to what they were originally. See if that works.

Now we should get the same values. And we do. OK. After we run the if statement, x is 13. After the ternary operator, x is 13. Perfect. So we get the same results. That's the end of this practice.

Practice 11-2 is chaining if statements. If you haven't found a solution after trying this on your own, we can use this video to provide you with a little walk-through. The first thing we'll need to do is open the project practice 11-2. In the Order class, complete the calcDiscount method so that it determines the discount for three different customer types.

And these different scenarios are nonprofits get a discount of 10% if their total is greater than 900, else the discount is 5%. Private customers get a discount of 7% if the total is greater than 900, else they get a discount of 0%. Corporations get a discount of 8% if their total is less than 500, else the discount is 5%. And then finally in the ShoppingCart class, step three is to use the main method to test the calcDiscount method.

So let's pull up NetBeans and try and figure this out. I have the project opened already in NetBeans. The first thing you'll notice is at the top of the Order class, we have a whole bunch of fields. There has been quite a bit of work that's already done for us. But what we really care about is down here, the calcDiscount method.

And we'll happen to use some of the fields up here within this method. So let's see. What is our first scenario? And I'll start off using if. Our first scenario is for-- it's the customer type. The customer type is equals equals nonprofit. OK, what do we do then?

Well, in that case, we still have to check their total. So then I'll have to use another if statement. Have that be nested. If the total is greater than 900. If the total is greater than 900, our discount is going to be 10 for 10%. Discount equals 10. There you go

Else. Else discount-- un-pause-- else discount is equal to 5. And actually, I want to see if this works right here. So we can test that from our ShoppingCart class. I have to make sure that it's a nonprofit. Is it a non-- it is, OK.

So let's run it and see if we can find the discount. 10%. All right. That looks right. What if we change that? Is there a way to get the next one? So we have to make sure that the order is less than 900.

So if it's less than 900-- we'll say it's 800-- then we should get a discount of 5. All right. That works, too. 5%. There are a couple options you have when you're using if/else. So I ended up putting some curly braces, but you actually don't have to do that if the lines following the else statement are just a single line.

Same thing with if. I do it because I think it makes my code look more organized. But if you feel that there is a better way to organize your code, you are welcome to not do that. So here I've removed the curly braces. Yeah, I should get the same number.

And this works, again, because there's just one bit of code that we have after our if statements. If we had a whole bunch of lines, then it would only execute the first line. But I'm going to leave these in. But if you do you ever see it without the curly braces, you'll know why it still works or perhaps know why it doesn't work.

But let's keep going. So we'll get out of this first if block because we've already taken care of the nonprofit scenario. There's three more we have to work out. To do that, we'll start with if-- sorry, else if cust type. And the next one we have to check out is private.

If it's private. Now we need to do the same thing that we did here, a few more checks. So we need another nested if statement. So if the total is greater than 900-- so more curly braces-- if it's greater than 900, the discount is equal to 7. Otherwise, else discount equals 0.

And then let's jump back out. There's one more scenario we have to look at which is else if. And I'll go ahead and specify it. I could just go with else but I'm going to do else if because I'd rather specify it now just in case we have to go back later and add a third kind of customer type. Sorry, add a fourth customer type.

Cust type equals. Ah, it's just corp. OK. And then we have if their total. We got to check what their total is, too. The total is less than 500, then we give them 8% discount. Equals 8. Else discount is going to be 5. Equals 5 semicolon.

Scroll down. So let's see. It's complaining. Why is it complaining? Do I have a mismatched curly brace? Character cannot be con-- oh, I did equals instead of equals equals.

So what it was complaining about here was that character cannot be converted into a Boolean. So it was trying to assign a value that's just not doable. But I don't want to assign. I want to compare. So that's why I need double equals.

So our code should run now. But now to test it, I'll go back to the ShoppingCart class and I'll see. Test some of these other cases. I'll make it a corporate kind of order. See if that works.

The discount is 5% for corporate. Is that right? Yes. Because his order is greater than 500. He's going to get 5%. Let's say it's lower. Let's say it's 400.

Let's say it's lower. Let's say it's 400. We go to run our program, we should get a different discount. And we do. 8%.

All right. So all of our code seems to be working. That's the end of this practice.

Practice 11-3 is to use switch constructs. We're going to do the same work that we did in practice 11-2, but this time instead of using if and else, we're going to be using switch. So we can either continue editing practice 11-2 or open up practice 11-3.

For this video, I'll continue working on 11-2. What we need to do in the Order class is to rewrite calcDiscount to use a switch statement, use a ternary expression to replace any nested if logic. For better performance, we'll also be using break statements. And we'll include a default block to handle any invalid customer types.

And then again, we'll use the shopping cart class. We'll use the main method there to test our calcDiscount method. Again, this video, hopefully you've tried this on your own. If you've gotten stuck, this video will provide you with a walk-through.

Let's get back to the practice. So here's what I have at the end of practice 11-2. I want to keep working on it. I don't want to completely remove this because it's going to help tell me what I need to do in this exercise. But I don't want it to disappear entirely.

So I'm going to do what's called commenting out. I'll make it a comment. And this makes sure it doesn't execute anymore, but it's still going to hang around. So this little symbol right here means to start the comment. This little symbol right here means to end the comment.

So now I can get to work. Hopefully the braces match up. They do. All right. So let's get started with our switch statement.

So what we need to evaluate in switch is our customer type. And the scenarios we want to look at, the first case is going to be case non-- oh, should be all caps. case NONPROFIT. If it is a nonprofit, then your discount is going to be-- see. So we know it's either going to be 10 or it's going to be 5.

And that's based on a condition. The condition is if total is greater than 900. Oh, I you just have to add the equals and a semicolon at the end. And then we want to be sure to break. That's it for that case.

Let's work on the next one. Another case, which is private. Private's shown up here. If private, our discount could either be-- what could it either be? It could either be 7 or it could be 0. 7 or 0.

And this is based on the condition that-- what's our condition-- the total is greater than 900. I'll copy that, paste it there. Got to remember to add a semicolon. And then be sure to break.

Our final case that we know we need is case CORP. And our discount is going to be equal to-- what do we want our discount to be equal to? I want it to be either 8 or 5. And what's that based on?

It's based on if the total is less than 500. Got to remember to add a semicolon and then break. And there was one last case that the instructions wanted us to specify, actually. It's the default case.

So we type in default system out print line. We need some sort of error message. Invalid cust type. All right. So now we have our code here where we're using a switch statement to examine a character.

And I don't need this anymore. I could remove it if I want to have it stay around. I could keep it there, too. It's up to you, whatever you guys would want to do. But now let's test it.

We go to run our program and you get 8%. Is that right? He's corporate and it's under 400. If we're corporate and we're-- oh, sorry. Under 500. Yeah. 400 is under 500. So this evaluates to true. We should get 8.

All right. That works. Cool. I think we've got this all right. So that ends this practice.


## 6. Skill Check: Using Conditionals - Score 80% or higher to pass

Skill Check: Using Conditionals

View Skill Check
