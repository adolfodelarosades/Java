# 4: Lesson 4: Storing and Managing Local Data

1. Lesson 4: Storing and Managing Local Data, Part 1 - 15m
2. Lesson 4: Storing and Managing Local Data, Part 2 - 10m
3. Practices for Lesson 4 - 9m
4. Skill Check: Storing and Managing Local Data - Score 80% or higher to pass

## 1. Lesson 4: Storing and Managing Local Data, Part 1 - 15m

Lesson 4 is on storing and managing the data in your program. The objectives that we have for this lesson are that first we want you to become familiar with the different types of variables and what a variable is in the Java language, to understand how to work with and manipulate strings of text, how to concatenate text, and how to do math with the different kind of variables that represent numbers.

So starting off I'll introduce you to what is a variable. So in Java, variables hold very specific types of data. And these are things that you can reference later on in your program and they can also be changed. That's what change meaning vary, [INAUDIBLE] variable. So the syntax for doing this is that first you declare the type of data that you want. So in this example, we're declaring a variable to be a string type. And then we say what our variable name is going to be.

Here we have a variable name, firstName. And then we set a value for that variable, which in this case, being a string, we have double quote Mary double quote again. And then, of course, semicolon at the very end. And now that we have this variable first name, this variable is going to exist anywhere in our program from now on. And we can end up using this or changing the value of this variable.

So if you look here at the next line, we take firstName and instead of calling it Mary, we're going to set it value to Gary. And there's many different types of variables in the Java programming language. We have strings. We have talked about before, all a string is is you take characters, you take letters, and then you string them together. And this requires a double quote at the beginning, double quote at the end.

We have int, which is an integer. And these represent whole numbers. These can either be negative, zero, or positive. If we want decimal precision, then we need what's called a double. And here you can see our decimal precision-- 0.00, or 0.99, or 0.09. It can go a lot further, too, if you want to do like point, like say you have 3.000001. You can do that too with a double. And then finally we have a boolean. All boolean values are is true or false, only two possible values for boolean.

If you decide to create a variable without assigning it a name, meaning you do, let's say, int x, and we don't assign x a value, what that will look like is int y equals, I don't know, 2. So here, the first line, we're not assigning value the second line. We are assigning a value. If you decide not to assign a value to your variables, depending on the type of variable that you have you're going to get different results.

For a string, we have what's called a null value. A null has a special meaning in Java we'll talk about a bit more later on. We have for an integer, our default value is going to be zero, zero the whole number. For a double, if you, the default value is going to be 0.0. We're still going to have that decimal precision. And for boolean, if you decide not to assign a value, the default value we're going to get is false.

When it comes to naming variables, you want to begin the variable with a lowercase letter. An example below, we have myVariable. The m is in lowercase, the very first letter. And the subsequent words are capitalized. So the V, the V is capitalized. And we call this camel case. So why do we call it that? So if you take a look at a camel, you have its hump. Let's see how good I am at drawing a camel. Pretty terrible camel. But here you have my V for Variable. So the reason why we call it camel case is any letter that's capitalized is going to rise higher above any of the letters that are in lowercase. So it looks like the hump on a camel where you have this letter rising above all the other ones.

The names that you give your variable are going to be case-sensitive, meaning that if you have something called my lowercase variable, it's going-- that is completely different than my variable with the uppercase. We've actually created two separate variables if you do this. So when I say typos are a common mistake in Java, that's one instance of that, where you misspell something or you have a lower case where we should really have a capital. Java is very, very picky about if you have a capital letter or not.

You also have what's called white space and names can't include any white space. What white space is if you have my space variable, you can't do that. It'll think my is going to be the name of the variable, and it'll have no idea what you mean by variable here. So you actually-- we don't want to have this space here. You want it to be all one word in camel case.

And it's also helpful to choose your names mnemonically, or just choose it in a way that it's easy to understand the intent of the variable just by looking at it. If you take a look at these examples here below, you have outOfStock and itemDescription. So I'm going to guess, just by looking at this, it references some kind of shopping application-- outOfStock, maybe that means is there any inventory? itemDescription, that'll probably be a text description saying what the item is. Is it a shirt? Is it blue? Do people like it? I don't know, but all that kind of information could be stored in a string.

So just by reading it, I get like this baseline understanding of what it could be. And as tempting as it is to, like maybe if you were to say int and then, I don't know, blah, blah-blah, give it some gibberish name. And that might be funny to give it some kind of gibberish name, but when you come back and look at your variable, you're going to have no idea what it means. Or if any of your coworkers or your friends look at your code, they're also going to be confused and have no idea what it means. So that's why it's important to choose variable names that help give an understanding of what the variable represents.

How we use variables in Java-- there's a few ways to go about it. The most common reason why you would want to have a variable are to save data, save numbers, save text that you want to reference later. So here we have the name Sam. Maybe somewhere in your program, you want to repeat the name Sam, over and over and over and over. With the variable, if you want to change the name Sam to-- say you want to change the name Sam to Alex, all you would do is write Alex here. Otherwise, if you didn't have this name stored, anyplace you had text, any place you had the names Sam written, you'd have to go back and change that again and again and again. And there's a chance you may miss one.

It's pretty tedious and error prone, so that's why variables can actually be very, very helpful to hold the data that you want to use later. So we'll do the same thing here, same idea. You can do that with a string. You can do it with a double. You can do it with a boolean. Very helpful technique.

You could also assign the value of one variable to another. So here we have a string variable. We presume that there's some variable elsewhere that's called stringname1, and that equals-- I don't know-- test. So when we do that, we're actually assigning the value of this variable name to be whatever the value of name1 is.

Another reason why variables can be useful is you can do math with them. So say you've calculated the quantity of items that you have in a shopping cart, for instance, and you have the price of what those items are, doing a little math, you can find the total. And finally you can print out those values of a variable. Here we are, printin name. And what's the value of name going to be? It's going to be whatever-- in this case it's going to be whatever name1 is, but if you ever need to get output to figure out what is the current value of these variables, print statements come in very handy for that. And if you just insert a value, you'll be printing whatever value calculated, or whatever value your code happens to assign to those variables.

There's a couple ways to go about declaring and initializing variables. The important thing, though, is if you were to do it all in one line, you have to declare your type. The Java is what's called a strongly-typed language, meaning that any kind of variable that you have, you have to say what type it's going to be.

So we just declare a type here to be a string. We add what's called an identifier or the variable name, which in this case, is the address. And then we assign our value here. This is how you do it all in one line. It's a pretty basic example, and it's the example that I've been relying on thus far. But there's other ways to go about doing this.

So for instance, if you wanted to, you could declare one variable. Don't assign a value, come back to that later. If you want to declare many variables of the same type, you can do that as well. All you have to do is separate the names of the variable with a comma. And of course, yes, semicolon, always semicolon at the end.

You could also declare many variables and assign them names at the same time. See we have country equals USA comma state equals Colorado, CO. And we could keep doing this for as many variables as they want. Just be sure to add a semicolon at the end and declare the type of variable that you want at the beginning. What we could also do is come back later, take a variable that's already been declared-- like city. We declared city, but we never initialized it, never gave it an initial value. We can come back later and decide to initialize it, give it a value later on. So that's what's happening here at the very end.

When it comes to working with string variables, working with strings is a little different than working with numbers. So when you add-- in math you would think this is add, but it actually means concatenate when you're working with strings. So what we can do with strings is we can concatenate, add them together. You have two variables here in this example, greeting, greeting part one, greeting part two. We have Hello, we have World. We can add these together.

Here's another variable message. We take greeting one, we add a space. We take greeting two, add that, and then we add an exclamation point. Or, if you want to add numbers to that, you can do that as well. In this case, it's thinking 2016 is a bit of text and not a bit of numbers. And the result of that is shown on this slide.

Here we have our variables greeting one, greeting two, Hello, Hello World. And then we have another variable, which is going to be our message. We're adding these together. So we take this variable and we decide to print it to a print statement. And here's our print statement-- System.out.println-- and then in parentheses, we have our message. We have that variable, same variable. And what we end up getting in this case is printing-- actually, in this case, it should actually be printing Hello World, this one at the bottom here.

Or likewise, you don't have-- you could just do the concatenation within the print statement. You're allowed to do that as well and we get the same results, Hello World. You should ignore that, ignore the first line.

Now I want you guys to give this a try for the first practice in this lesson. What I want you guys to do is open the practice and then declare and initialize a couple of String variables-- customer one, itemDesc. Declare the String variable message, but don't initialize it yet. Assign the message variable, the concatenation of the customer name and itemDesc. So you combine these two together to get a description like this, Mary Smith wants to purchase a shirt. And then you print that output.

## 2. Lesson 4: Storing and Managing Local Data, Part 2 - 10m

Now that you've finished the first practice of Lesson 4, you should be pretty familiar with how to work with strings. But what I'll do now is I'll show you how to work with numbers as well. So if you take a look at the int, integer variables are able to hold values between negative 2,147,483,648 and positive 2,147,483,647. These may seem like pretty random numbers, but I'll explain where they're coming from.

So you may have heard of like 32-bit processors, 32-bit numbers. So basically, what this means is the space that's provided for an integer has to fit within 32 bits worth of space. So here, this is actually the value of negative two to the 31 power, and this here is positive two to the 31 minus one. So you combine these two together, and you have as many numbers that are possible in two to the 32 amount of space.

So don't worry about that for right now. You probably won't need numbers that are much bigger $2.1 billion for the programs that we'll be doing in this course. So for most of the numbers that you'll be doing in this course, the kinds of integers-- you may have like a two. That's one example. You may have something a little bit longer.

But there's actually no commas involved, and that can make it difficult to read. So instead, what you can do in Java is you can add an underscore. You have an underscore here, underscore there. That's where a comma would normally go. You can add it into your integers, and that just helps make them a lot easier to read.

For doubles, doubles give you floating point precision. So if you ever need accuracy with decimal points, that's what you can use. So here, we have a pretty big number for decimal point precision. We can put our decimal point, anything we have, whatever we want, to the back end of that. You can also choose not to take advantage of the decimal point precision. That's fine too.

Although when I say Java is a strongly typed language, what that means is that integers are only capable of handling whole number values like a 10. If you try to give an integer decimal point precision, NetBeans will complain, and you'll get a compilation failure. Doubles, on the other hand, you are able to do that. You have decimal point precision, but if you don't want to take advantage of that, that's fine as well.

But when it comes to manipulating numeric data, there's a bunch of operations that are made available to you. You have the basic addition, subtraction, multiplication, division, and those are pretty straightforward. So for example, say you have sum, our variable intsum. We declare that, and then we have sum equal to whatever these other variables are. Say num1 and num2 are defined elsewhere. If we define those as 10 and two, our value for sum is going to end up being 12.

Similarly subtraction, that's pretty straightforward. If you want to do multiplication, we have our product. Division-- division is a little bit different in Java, especially when you're working with integers. So if we divide 31 by 6, the answer is actually 5.16666 repeating. What Java is actually going to do is if you're working with an integer, it's just going to get rid of all the decimal point stuff. So we actually get five, and it doesn't matter if it's 5.16. It doesn't matter if it's 5.5. It doesn't matter if it's 5.9999. All these values, the decimal point precision is just going to get chopped off. You're going to be left with five.

I think the only other thing to be aware of when you're working with division is if you divide by zero, so 5 divided by 0, that's going to create an error. So just be careful of situations like that in your program.

Incrementing and decrementing are very common in Java. So the way you may think about normally doing this is you have a variable age, and you set age to be one more than its previous value. This is incrementing it. This is done so often that Java provides a shorthand way of doing that. And that's with ++ right here. So writing age++ is the exact same thing as writing age = age+1. And likewise, we can decrement. Instead of saying count = count-1, instead of saying the current count is going to equal the previous count minus 1, just decrement it like this-- count--. Same thing. We're just lowering the value of count by one.

Operation precedence-- so the way Java does math is similar to how we would do math in school, if you remember. PEMDAS, I think it is-- parentheses, exponents, multiplication, division, addition, subtraction. So same idea. So let's try and do this one. See if we can figure out what the math is. So I get-- let's see. It's 5 times-- so this is going to end up being 20. Divide 20 by 2. We get 10. So we have 10, and then we have minus 10, minus 10. So that's 0. So 25 minus 0 plus 4. That's going to equal 29.

So let's see. The question asks, is the answer to the following 34 or 9? Well, I got neither. I got 29. So I probably did something wrong. And that's why it's pretty important to consider the order of precedence when you're doing Java and being able to use parentheses and being able to increment and decrement to your advantage. So if you take a look here, here's a helpful use of parentheses and going from left to right. So if you end up doing the math here, you'll see that the value is actually negative 6.

So the takeaway from this is just be sure to use parentheses wisely. Be careful about how you do it, because it can get pretty messy fairly quickly. And likewise, same idea as curly braces, where you need an opening one and a closing one. You also need to have corresponding opening and closing parentheses.

So in Practice 4-1, you became familiar with how to manipulate and work with strings. I want you to continue editing that program, and this time, familiarize yourself with how to do math, how to work with numbers instead. So we have continue editing. Declare some variables like price, like tax, like the quantity, and be able to change your message. So Mary Smith, now she wants to purchase one shirt, and you've got to figure out how much that's going to cost her.

So I'd like you to give this practice a shot, because that's the end of the lesson. So you've been able to meet all the objectives. We've described the purpose of a variable. We've listed and described the four main types of data in Java. We've declared and initialized a string variable. We've concatenated a string variable. We've made variable assignments. Declare and initialize int and double variables. Modify numeric variables, and override default operator precedence using parentheses.

So you're familiar with all the things that you need to be able to complete the final practice. There aren't any practices after this that we wanted to do for homework, so just focus on getting done with Practice 4-2.

## 3. Practices for Lesson 4 - 9m

This is practice 4-1, using string variables. The goal of this practice is just to get you familiar with and build competence with how to work with strings. I'll give a walk through about how to do this, but I hope you'll be able to do this-- you've already done this exercise on your own, because you get to learn a lot and build your confidence really well from that.

So the first we've got to do is I want to import the project into NetBeans. And just make sure that they're unzipped. Extract it here. Yeah, and make sure they're unzipped so you're able to open them in NetBeans.

So let me just find the file. And I put that on the desktops, just so i knew where it was, but where it's going to be for you may be a little different. No, actually, no. Here it is, Java Cloud fundamentals, that's where I put it. So go to [INAUDIBLE]. Yeah, OK. So here's our project. Practice 04-1.

Open that up, here is our package, and here's a class that we want. This is our main class, which has our main method. And there's a couple of things that we've got to do. We have to declare some string variables. So let's do that.

We have our customer, so that would be String custName equals Mary Smith. One R. And then we've got to remember to put our semicolon at the end. Our next string is for the item description. D-E-S-C. And that's going to be-- lets buy a fancy shirt. And then the last one we have to do is message.

But I don't want to give message a value, what I actually want-- yet-- what I want to do is assign a value that is a concatenation of customer and the item description. So lets do that here. Message is going to equal custName plus wants to buy-- or wants to purchase. "Wants to purchase a," and then will add on to that the item description.

Now we want to print our message. So that is System.out.print print line message, and then add a semicolon. Lets run this, see what it looks like. OK. So we have our output down here, but it doesn't look as good as I want. I want to have a space in between "Smith wants" and then "a shirt," so I just have to add a space there, space here.

Yeah, that's something just to be careful of when you're concatenating. Make sure that your words don't run together. So I run that again. OK. So now I have the output that we want, "Mary Smith wants to purchase a shirt."

Practice 4-2 is about using and manipulating numbers. In practice 1 we worked with and became familiar with working with strings. Now we're going to do the same thing but with numbers. So I'm actually going to continue with my project from before, and just keep editing this one.

So what we have to do is we have to declare a price quantity tax and total. And I'll walk you through how to do this, but-- in case you had trouble-- but I hope that you had given this to try on your own first.

So what I'll do is I'll say, we have to add in a price. So our price, I think, would be a double. So we can have something like double price equals-- for the low, low price of $29.99. I have to use the double so I can get in the $0.99.

And then we'll have quantity-- and that's going to be a whole number. You probably would have a half a shirt that you want to buy. Quantity equals-- so you want to buy 2 shirts. And then we have tax rate. Double tax equals-- let's say it's 4%. And then we just have to have a total.

The total is also going to be a double. But I'm not going to assign it a value, because this is something that we actually want to calculate later. So the first thing we have to do is modify our message to include the quantity.

So we have our quantity variable, and now we just have to edit the-- we have our quantity variable here, now we just have to edit the text to incorporate and reflect that. So we have the customer wants to purchase-- instead of saying "a," I'm going to say quantity. Oh, I have to remember to add in a space as well. So that you want to-- wait did I spell-- why is it complaining?

"Cannot find symbol quantity"-- Oh, I probably spelt it wrong. Spelling it's such a common error. No. What did I do? Oh, right. I have to add in the plus. Yeah. Concatenate the additional space there. OK. And then we will be able to print out our message here. Put those two together.

And I'll just run it now to see if it works, because it is good to check every so often to see-- well, once you think you've reached like a point where your code reflects the changes that you want or you have something meaningful that you think you're code can show. It's always good to take a look and see if it works.

Yeah, there we go. "Mary Smith wants to purchase 2"-- and the grammar is a bit off, but we'll worry about that on different exercise. All right, let's keep going. Now we have to calculate our total.

So what's our total going to be. That's going to be-- total is going to equal our quantity times the price. And then also times the tax rate. And then system-- actually, now we have to do a print statement, because I want to print out the total.

There's actually a trick you can do, instead of typing out System.out to print line. You can actually, in NetBeans, do S-O-U-T and then Tab, and that quickly gets the statement done for you. The reason why they give you the shortcut is because print statements are so common. They just want to provide a way to save you some time, just because it's done so often.

So at this print statement we'll say, total cost with tax and then we'll concatenate or add on our total. Let's give that a try and see if it works. OK. The total cost with taxes $23.992, but that can't be right because the shirt by itself is going to be almost $30. So we need a number that's more than 30.

So why did it goof up? Oh, because I'm multiplying by something that's actually less than 1. So just for the sake of this what I am going to do is have it be 1.-- oh, wait. I actually wanted 4% not 40%. OK. So, Yeah, I think I made the changes now.

If I had it at just 4%, we get a really small number like $2-- yeah-- $2.39, which is way too small. So just to make the math work I have to add in a 1 for the taxes. Yeah, that sounds right. It's a little bit more than twice, so double shirts I'd expect like $60. And, yeah, they're $62, so the extra $2.37 would be for the tax.

Yeah, that all looks right. And that is the end of this practice.

## 4. Skill Check: Storing and Managing Local Data - Score 80% or higher to pass

Skill Check: Storing and Managing Local Data

View Skill Check
