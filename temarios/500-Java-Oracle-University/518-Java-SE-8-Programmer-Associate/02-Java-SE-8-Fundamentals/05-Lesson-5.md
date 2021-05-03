# 5: Lesson 5: Managing Multiple Items

1. Lesson 5: Managing Multiple Items, Part 1 - 6m
2. Lesson 5: Managing Multiple Items, Part 2 - 9m
3. Lesson 5: Managing Multiple Items, Part 3 - 9m
4. Practices for Lesson 5 - 13m
5. Skill Check: Managing Multiple Items - Score 80% or higher to pass

## 1. Lesson 5: Managing Multiple Items, Part 1 - 6m

Lesson five is on managing multiple items. So what do we mean by managing multiple items? It means if you need to ever compare values, this is done using if/else statements. You could also have an array of different data, types of data-- excuse me-- an array of data. We're also going to cover the for loop, which is used to iterate through and examine an array of data.

So getting started on working with conditionals. What do we mean by conditionals? This is something that you would come across in your everyday life. So let's pretend you're here. You're driving in the car, and you've got to decide which way you want to turn out at fork in the road. So your goal for the day, let's go to the candy store. And so you have to ask yourself, which way is a candy store? If I get to the intersection-- if the candy store is to the right, go right, else go left.

So we'll check to the right. No candy store. Go to the left, then we'll find the candy store, so else go left. I don't want to go right, because there's no candy store there. Also, maybe, what else could be there? The pain store, don't go there.

So this is what that looks like in actual Java code. We have our if statement right here, using the keyword if. And then we have some sort of condition in parentheses. And then we use curly braces, opening curly brace, closed curly brace. And inside here, the do something, this is the code that's going to be executed if that condition is true. Otherwise or else, we have our else statement here, and we'll perform some other actions.

This is considered an else block. We have our if block here, our else block, and what we call a Boolean expression, which I'll explain in a bit. This is going to be our condition. If that condition is true, then we execute some code.

So talking a bit more about Boolean expressions, what are they? Well, we know that Booleans are a special data type that has either a true or false value. A Boolean expression ends up evaluating to either true or false.

So if you look right here, here's an expression that may evaluate to true or false. Is the length greater than 10? That could be true. That could be false. Is the size less than or greater than the max size? That could be true. That could be false.

Is the total price equal to cost times the price? That could be true. That could be false. So what's an example of something that's not a Boolean expression? Let's say, do you want candy? And we'd expect a yes or no. But if the answer is seven-- no that, that doesn't work. It has to be yes or no.

So to do these comparisons and our Boolean expressions, we have a bunch of operators that we can to consult. First of all, and probably the one the new most explanation is ==, equals to. This checks to see if a value is equal to another value.

So here we have I. Check to see if I == 1. So this is not to be confused with the single equal sign, I=1. a single equals means this is your assignment you're assigning a value == 0 is a for comparison. You're checking to see it two different values are equal to each other.

If you do end up confusing the two, NetBeans will give you a little helpful hint to try and fix their code. So other that, we have !=. The exclamation point in Java is not. So if we add the exclamation point just first and then have the equal sign, we're checking to see if something is not equal to. So an example that we is I != 1.

And here are some other operations you're probably familiar with just because they're found in mathematics. You have < than. You have < than or ==. You save the equals for last. You have > than, and you have > that or ==. In all this case, you have the = at the very end.

And sometimes there's a quicker way to meet your objectives instead of putting a Boolean expression directly into the if statement. You can do this, by the way, if you want to. You can do it either way. I'll show you. You could put the Boolean expression right here directly in the if statement. Or alternatively, you could create a variable and have that variable be equal to the expression.

And then a set of plugging in instead of having attendees greater than or equals to five, you just put in a large venues into an if statement. So what I'd like you to do now is try to practice 5-1. In this practice, you'll start building a familiarity with Booleans and Boolean expressions.

## 2. Lesson 5: Managing Multiple Items, Part 2 - 9m

Now that you've played around with if statements in Java, I'm going to show you a bit about working with arrays, how to work with an array of data. So let's say you're programming and you want to keep track of a whole bunch of items in your shopping cart. And if you want to have a description on each of those items, the old way of doing this is if you were to declare each description one at a time.

So you have description 1, description 2, description 3. And if you wanted to have a very big shopping cart, you'd have to do this 100 times or 1,000 times or however many you want. And it's really not practical to be able to do this, to have to declare and keep track of hundreds or thousands of variables. It becomes a huge nightmare.

So instead, what you can do is use what's called an array. So here, instead, we've taken what's done in three lines and we've done it all in one. We have our string array. Putting these little brackets right here, this helps signify that we're working within an array. So we have an array of items, and these are the values of that array. We have the shirt, the trousers, the scarf, all done within one line.

So an array is an indexed container that holds a set of values of a single type. For instance, if you have a string array, you're only going to hold strings. If you have an integer array, you're only going to hold integers. And each item in that array is called an element. And the elements are accessed within that array based on their index. And the index is a number.

So everything's shown here in green. So those are the indices. And below are our values. And every time you have an array, the very first element is actually index 0, show right here. I'll show you in a bit how to go about accessing individual elements. So like I said, you could have an array of integers, you can have an array of strings, but you can't mix both of them.

The syntax for declaring an array is, you have your type, and then you must put the open and close braces right there. And then you have your array identifier. This is your variable name. And it's just like creating any other kind of variable.

And then one thing you can do is have a comma-separated list of your values, which is shown right here. So a couple of examples of that would be here, we have the first example. We have our string array names, names 1, 2, 3, but they're actually indices 0, 1, 2. And then we have our int array of ages, so here is index index 0, this is 1, this is 2. And these are all done in a single line.

If you want to get the length of your array, say you have int braces ages equals-- and then we'll just say we'll list them all right there. Don't forget the semicolon. If we do that, and then we were later going to type ages.length like we do right here, we're going to end up getting a length of 8 even though our last element is only at index 7. This can be a little bit tricky when you're programming, so it's just helpful to remember that your final index is actually going to be one less than the length of your array, because the array is starting at index 0. Semicolon.

So I showed you how to do it all in one line, but you can actually do it using multiple lines, do a multi-step approach. So if you want to do that, for instance, with an integer, what you have to do is-- setup is pretty similar. You have your int, then your brackets, and then your ages, the name of the area that you want, and then you say it's equal to new int, and here we have 3. The reason we did 3-- so this is where you say your size-- or wait, no, length. This is your length. Size actually has a different meaning for something else.

So here's 3. We want the length of our array to be 3. And then one at a time, we assign each index the value that we want. So here in line 2, we're saying index 0 we want to have a value of 19. Index 1, we want a value of 42. Index 2, we want a value of 92. And this is the exact same as doing it on one line of int ages equals 19, 42, 92. It's the exact same thing.

So why would you want to do it one way or the other? The reason why you may not want to assign the values to the index right away is because maybe you don't know them. Maybe they're things that need to be calculated later. Maybe they're things that occur based on the behavior of users or from user input and then you're dependent on getting that input from the user. So what you have to do in the meantime is just make the space for it, know that you're going to save this data later, but leave the index empty until the time comes when you need to fill it, and then one at a time, assign the value as needed.

And you can do the same thing with strings, too. And it's pretty similar. All you're doing here is instead of saying int, you're saying string. You say new String, then you have the length of your array. And then one at a time, you're assigning the value.

If you want to get the values instead, what you can do is, same as before, you have ages, for instance, index 0, age is 0. What that's going to do is, it's going to look at the array, you have indices 0, 1, and 2, return that value of 25. So here, our 25 comes down, and we have a new variable, myAges. The value of myAges is going to be 25.

Similar idea-- we have another variable, yourAges. If you want to store that value, ages 1. So what's index 1? We have 0, we have 1, 27. The value of yourAges is going to be 27. And then when you go to print it, looking at our print statement, we have System.out.println("My age is"-- ages index 0, that's going to be 25.

You're also able to set the names individually. And that's something we talked about already. Even if you set the values before of your array indices-- so here, we have index 0, that's set to Mary. We can change it to Gary. We can change them individually. We can do that.

Same idea here. Take a look at names 1 equals Rob. So look at index 1. We're changing Bob to Rob. We're changing Gary to Mary.

So you can access this data and you can change the data in an array. And I'd like you guys to try and experiment with arrays now. So try out practice 5-2, using arrays. Become familiar, build your confidence, and just get your hands dirty with arrays.

## 3. Lesson 5: Managing Multiple Items, Part 3 - 9m

Now that you've done practice 5-2 and you've become familiar with how to set up your own array, I'm going to take a look at how to process the items with an array. So say, for instance, you have an array of names. We have String names, and then just pretend here we have all the names that we want.

In order to read out these names, you may need to have a separate print statement for every one. So we have System.out.println names 0. And then we'd have this summary line, except with names 1, names 2, names 3, names 4.

And this can get a bit tedious to have to write the same thing over and over. And it doesn't make for very flexible programming. And the reason why is because sometimes, we could be in situations where we don't know the length of our array or an array list, something that we'll cover later. If we don't know that, then our program isn't all that flexible, because it's saying, yes, we have to have five, we have to do line by line, everything.

So there's a way to go through your arrays, to process the array in a much more programmer-friendly, programmatic way, and that's by using loops. What are loops? Loops are used in programs to repeat blocks of code, repeat blocks of statement.

So here we have our print statement here. We're repeating it over and over and over and over and over. And this is just really inefficient. So if we use a loop, then we don't have to write all this. We can just write it once.

And here's how loops work. So loops work as you're iterating through your code and you keep looping until an expression is false, or you can loop for a specific number of times. For instance, this is good for if you want to print each element in an array, which we do, in this case, or if you want to print each element in an array list, which I had mentioned. But that's not done in-- I'll explain array lists more in the lesson titled Working with Array Lists, Loops, and Dates.

So just taking a look at arrays for now, here's our array of names. We have George, Jill, Xinyi, and Ravi. So here we have our for loop-- keyword for, and then in parentheses, we declare a string name.

A name is just a fake variable they we're using. This is going to represent the current name in the current iteration. And this is done within-- dot dot-- the names array. So actually, let me write that up above. We have String names equals, and here are our string of names. And they are separated by commas. And we have quotation marks.

So that's it for our top line here. And then we have names here in our for loop. It's referencing names up here. The little variable here-- name, singular-- is pointing to the current name, or the name that we're looking at in the index of the current iteration.

So for instance, the first time we do it, the name is going to be George. The second time we go through the loop, it's going to be Jill. The third time we go through the loop-- in other words, looking at index 2-- we're going to get this name, and then the final name on the last loop, which is at index 3. And here we have our output right here.

So in this case, I don't even need to know the length of the array. I'm just going all the way through until we're done. And I only have to write this line of code, this print statement, once. It's much more efficient.

But you're also not locked into having to iterate through all the indices. If you want to ever take a break and stop, you're allowed to do that as well. And that's done using the break keyword.

So here we have our array of integers. We have scores-- 4, 6, 2, 8, 12, 35, 9. If we ever want to, say, OK, 12, yes, that means 12 is enough, we need to stop, let's not do that anymore-- if we ever reach to the value of 12, a score that's greater than or equal to 12, then we know that it looks like in this case a pass has occurred. And then we're just going to break.

What does break mean? It means get out of the loop. Stop looping. No more loops after this. Get out and resume whatever lines of code are found after this loop right here.

So after the loop is going to be-- this is our loop right here, the for loop. How do I know that? It's because the spacing is actually done pretty nicely in this example. We have our opening brace here and then we have our closing brace, which is on the exact same line. It has the exact same amount of spacing here as our for loop, so that's actually pretty handy to have. So after we break out of this loop right here, we're just going right to line 10. And we resume the rest of the program from there.

Why don't you guys give this a try now? So in practice 5-3, continue adding the code that you had done in practice 5-2. And loop through the array of data that you've created.

And just to finish up, because there aren't any more practices after this that we want you to do, there's no more open-ended homeworks at the end of this lesson, so that's the only thing you need to do. But one more thing I do want to add, which is, just to prepare yourself for the next lesson, I want you guys to open up Java Puzzle Ball, which you guys should have found with your eKits. It's a game that we made for teaching object-oriented concepts. And we use it throughout this course at various times. We'll ask you to play and just consider a little question as you play.

So try basic puzzles 1 through 5. Your goal is just to design a solution to deflect the ball to Duke. And as you play, just consider to yourself the following, which is what objects do you find on the field of play? And what happens when you put a triangle wall or a simple wall icon on the blue wheel?

So I'll show you. You'll find when you play you have these icons down here. And what you want to do is take them and drag them up there.

A little bit about Java Puzzle Ball-- it's used throughout the course. The goal is just to play a set of puzzles and become familiar with the mechanics of the game. It's not as necessary for you to beat the level, but if you do, congratulations. And they are made to be beaten.

Just consider the question as you play. And when you get to the next lesson, I'll debrief you on what you would have observed. And I'll try and explain why what you observed is applicable and why it's relevant to Java programming concepts. Then we'll get more into the technical details and I'll show you why what you've done can be valuable to understanding Java.

A couple of notes-- in order to play, you need to have Java 8 or higher installed on your machine, which you probably do by now. I don't think anyone would be doing this course on Java 7. You're probably running Java 8 or higher. And if you happen to be working on Oracle University lab machines, you may prefer to work on your own machines, because the game would have better performance there.

So in summary, in this lesson, you should have learned how to use Boolean expressions, create a simple if/else block, describe the purpose of an array, declare and initialize a string or int array, access the elements of an array, explain the purpose of a for loop and iterate through a string array using a for loop. So that's the end of this lesson. So again, just for next time, give Java Puzzle Ball a try before you start the next lesson and finish up practice 5-3.

## 4. Practices for Lesson 5 - 13m

This is practice 5-1 about Using if Statements. I hope you've tied this on your own, but if you need a little help, I'll provide you with a little walk-through here to help you get started. Or actually, a bit more than getting started, but let's get started. Blah. So the first thing you've got to do is open up the project, practice 05-1. Then we're going to use an if statement to test the quantity of an item.

So we're still dealing with a shopping cart scenario. And what we're going to try and do here is correct our grammar. If there's more, if there's greater than one item, we're going to add an s onto our message, just make it grammatically correct. Then we're going to create a Boolean, outOfStock, to see if this item is out of stock. If it is, then we'll let the user know. If it's not, they'll we'll go ahead, display a message, and let the user make the purchase. So let's get started.

I have it booted up here in NetBeans already. I've already opened the project. So the first thing we have to do is test the quantity and modify the message if the quantity is greater than 1. So the way we go about doing that is first, with an if statement. We'll write if(quantity > 1), we have to add an s to the end of our statement, at the end of our message.

So we can do that by typing our new messages is going to be the same as our old message. But then we're going to add an s at the end of it. You've got to remember the semicolon. And actually, let's-- I want to test that to see if it's right. Let's see if it's working properly. System.out, system.out message. So let's give that a try. So we have the quantity at 2. So now, it should produce an s at the end. Yeah, there we go. OK. So we know that works. So let's keep going now.

We have to declare a Boolean outOfStock. So let's do outOfStock. Set the equal to false for now. And now, we've got to test to see if it's out of stock. And then based on the results of the tests, we're going to display something different, display a different message. OK, the way we test is using an if else statement, if else construct.

So if-- and there's a couple ways to do this. You could do if(outOfStock == true), then we'll end up printing a statement which says the item that you want and description is out of stock. OK. Let's give that a try. We'll let's say, nah. To make this work, you have it change it to true. Yeah, so we'll change it to true, run it. It should say that's it out of stock. Yep, sure it is out of stock. Actually, comment this out here, because we actually don't know if we want to purchase it yet. Yeah, it's out of stock.

Something else we can do, instead of saying == true, for shorthand, we know that this part here, outOfStock, is going to evaluate the true. So we don't even need to say == true. We could just do it like this. And the code's going to run exactly the same. yeah, shirt is out of stock. If it's false, then it won't run at all, and we actually shouldn't print anything. Yeah, nothing. OK.

But we don't want to print nothing if it is not out of stock. We want to print something if it is available. So to do that, we'll add an if-- sorry, we'll add an else, the else that is going to directly follow the if. You can't have an else without the if. So let's see. We'll type system. This is an of out print line. We'll print our message. Well, that's actually we had here. Oh, well.

We'll print our message. And OK, we would also print the total, as well, allow the purchase to happen. Total cost with tax is going to be total. Let's run this. It should work. Yeah, there we go. So this price is the same as before. And now we have two shirts. And it's plural.

So one last thing to note is that if you take a look at this if statement right here, any of this code right here within the if statement, within the if block, within these curly braces, none of this is executing. And the reason why is because we're not out of stock. So what's happening is the program is going line by line, looking at, say, say we were at 25.

We set our Boolean. We go to the next line, go to the next line, go to the next line. Check to see line 28, are we out of stock? No, we're not. So this whole thing is skipped. And then we skipped directly down to this else statement. And here we go and do our print messages. And that's the end of this practice.

Practice 5-2 is about using an array. So I hope you'll try this on your own. But if you get stuck, I'll walk you through it. So the first thing you have to do is open the project, open practice 05-2. And in this practice, what you want to do is create a string array. And this is going to be like a shopping cart. This is going to be all of the items, all the descriptions of the items that you want to have. So we're still in the same scenario, the shopping scenario.

And then the next thing we have to do is change the message to show how many items a customer wants to purchase, in other words, how many items are in this cart. How long is this array? A hint, use .length. And then finally, we'll print just one element of the array. And then to goof around, we're going to see what happens if we try to print an element that doesn't exist, something in index number 4.

So I've already opened this in NetBeans. So let's get started with it. The first thing we have to do is declare and initialize the item string array with four item descriptions. So to do that, we'll do String items equals-- and what could these items be? These items are going to be a shirt, socks, scarf, and a belt. OK, that works.

And they're all different items. So if we ever going to check an indice, it'll help us know which one we're referring to. If there's duplicates, then we could be getting one of the other. But very unique, so that shouldn't be a problem.

Next thing we've got to do is change the message to show the number of items purchased. OK, so let's do message equals custName +-- actually, let's just copy this because that value is never ever going to get printed. So I'm just going to copy and paste it here. So we're going to have-- it's going to be customer name, and the customer wants to purchase, instead of several items, we have to be more specific here. So we're going to do items.

Oh, wow. Thank you, NetBeans. This just gave me all these cool things I can do. So items.length, that is what we want.

All right, so we have that. And then to complete the message, we have to, in quotation marks again, concatenate a little bit more. I say we did. Yeah, I'm missing-- I have to concatenate even more. Yeah, I forgot that little plus. OK, so that should be good. And we go to print our message. So this should work. Let's give this a try. Yeah, OK, four items, one, two, three, four, that works.

Now, if we want to print an individual item, here's what we do. We have our print statement. We are going to say items. Now, let's try item two. How does that work? Does it work? It does. Yeah, item 2, we have item 0 is shirt. Item 1 is socks. Item 2, element 2 is scarf. And then we're printing scarf down here. So that works.

So let's try-- so we have 0, 1, 2, 3. We don't have 4. There should be no indice 4. If we try to print 4, we're going to get an error message. Yeah, OK. So if you do look for an array element that doesn't exist, this is what you're going to end up with. You have NetBeans complaining that you have an ArrayIndexOutOfBoundsException. That is the end of this practice.

Practice 5-3 is about using a loop to process an array. So in the previous practice, we created an array. And now, we're going to use a for loop to iterate through that array and print all the item descriptions. So we either do this by continuing practice 5-2 or opening-- if you want to start clean, you can open 5-3. But what I'm going to do, I'm going to demonstrate by using the previous one.

After that, just precede the list of elements with the items purchased, just a nice little header, so we can know what's actually being printed. So I will demonstrate this for you. And you should be watching this if you get stuck. But I think you'll learn a whole lot more if you give it a try yourself first. But if you do get stuck, here's the walk-through.

I have it here in NetBeans. This is a continuation from practice 5-2. And instead of printing an individual item, what we need to do is go through and print the entire array of items. So I'll do that by creating a for loop for. And this will be-- let's see-- for(String item) for just an individual item. And this variable's only going to exist within the context of the for loop. And this is going to be, you know, the particular indice that we're looking at here. So you got for item in the items array.

And what do we want to do? We want to print out that item. So-- oh, I hit a typo. OK. And then we want to print out that item. Oh, and we also, just to make it more known what our list is, add the print statement per items purchased. All right, and let's run this, see what we get.

Oh hey, that worked. The solution that I have here is just a little bit different from what you're going to find in the activity guide that has the other solutions. The one difference I had here is I'm actually printing line. What they have is just a print statement, which you can do that too. I'll show you what that looks like.

Yeah, so it's running all these together. The difference between system.out.println and system.out.print is the ln means line. And so at the very end, you're going to start a new line. With print, you don't create a new line. So everything you have is going to be on the exact same line, like we have here.

But unfortunately, it's smooshing it all together. So in order to compensate for that, I just have to add a little something. Let's just add a comma, see what that looks like, no a comma and a space. Yeah, that will probably look good. Yeah, OK. There we go. And that's much more-- that's much easier to read. So yeah, that is the end of this practice.

## 5. Skill Check: Managing Multiple Items - Score 80% or higher to pass

Skill Check: Managing Multiple Items

View Skill Check

