# 4. Handling Text and Numbers

### Description

Create and work with variables, primitive data types, String, and expressions.

## Title and Objectives

Java Basics, Handling Text and Numbers. In this module, we'll get started programming in Java. And to do that, we're going to get started working with variables and data types of those variables. So we'll start by talking about the purpose of a variable in the Java language, which is to hold values.

Secondly, we'll list and describe four of the common data types that we use with variables. And we'll see out of declare and initialize strings. Strings allow you to hold characters and arrays of characters and work with strings, a very common thing in our programs. We'll see how to concatenate string variables, combine multiple string variables to create larger string variables, using the plus operator. And we'll see how to make variable assignments, assigning values to variables, creating expressions, and assigning variables to other variables.

We'll see how to declare and initialize int and double variables-- int stands for integer. We'll see how to modify variable values using numeric operators, like addition, subtraction, multiplication, and division. And we'll see how to override the default operator precedents using parentheses.

## Variables

Variables-- a variable refers to something that can change. In a computer program, variables hold values that can change over time. We can do math with those values, we can do comparisons with those values. Those guys can be numeric, they can be strings, they can be dates, they can be many different types of data types. But a variable is the thing in a computer program which holds values which can change.

Also, variables can be initialized with a value. When you first declare or tell the computer to create your variable, you can have it given an initial value. That value can be changed over time. This is why we call it a variable.

So, for example, a variable here, we see the String firstName has the value "Mary." And we see we can change that over time. So a variable also holds a specific type of data. Java is what's called a strongly-typed language. That doesn't mean you push hard on the keyboard when you type, it means that you have to declare the type of variables when you declare a variable.

So in Java, if I want a string variable, I have to tell it the type first, indicate the type first, which is String, then the name of the variable-- in this case, firstName-- and then assign it a value. Now, I may or may not initialize a variable when I first declare it, but that is possible.

So here, we've declared the variable firstName, and it basically is holding the value "Mary", or pointing to, or referencing the value "Mary." Then we can simply assign it a different name. We can say firstName is assigned the value "Gary." And the way this works is, everything on the right-hand side of the equal sign is evaluated first and then assigned to the variable on the left-hand side.

Java, being a strongly-typed language, requires us to declare the data type of a variable when we declare the variable. Now, here, for example, are common data types that we work with. Here's one-- a String.

A String represents a sequence of characters, in this case, enclosed with double quotes. We can have ints, which are numbers that have no decimal place. It can be negative, 0, or positive, and they can be very large as well. And you can even use an underscore to increase readability of the number.

We can have doubles, which have decimal places. And so we can have 2.00, 99.99, and even very large and very small numbers, and also scientific notation. And we can have a boolean conditional-- true or false. Notice, true and false do not have quotes around them. They're not Strings, they're actual reserve words in Java which allow us to declare something to be either true or false, or test it to be true or false.

If uninitialized, variables have a default value. Strings get the value null, which means no value at all. There is nothing there at all. ints get the value 0, double gets the value 0.0, and boolean gets initialized to false.

When we name a variable, we begin each variable with a lowercase letter. Subsequent words should be capitalized. Now, this is more of a stylistic thing, but it is something that all Java programmers have agreed to do. It's not a compiler requirement. The compiler doesn't actually care how you spell your words and such. You have to be consistent, but by convention, in Java, we declare variables with a lowercase first letter, and then each subsequent word has an uppercase.

So here, we see an m, lowercase, and then, uppercase V. Names are also case-sensitive. And names cannot be keywords by themselves. So I cannot have a variable called int, or true, or break, for example. Although I could have a variable called int5 or trueAndFalse. But the actual keywords themselves cannot be variable names. Compiler will get confused.

And names must not start with a numeric character-- with an underscore, numeric character, or include a white space. So, we can use some special characters and some with some restrictions. We want to frequently choose names that are mnemonic and that indicate the intent of the variable. So, we want to do a little bit better than single-character variables like A, B, C. We'd like to actually live a little and have variable names that are indicative of what they're actually representing.

So here, for example, we have a boolean variable. And the name of it is outOfStock. And it's either true or false. We're either out of stock or we're not. And String, in this case, is an item description. It would be a longer description of Strings-- characters-- that would describe the item.

Now, when we use variables, we use variables to hold data. Here, for example, we have String name equals "Jerry." And then we have a double, which we have price. We'll take the value 12.35. We can set outOfStock equal to true to say we're currently out of stock. And then we can set quantity equal to 23.00. So again, everything on the right-hand side of the equal sign is evaluated first and then assigned to the variable on the left.

Now, in this case, there's no evaluation going on, we're simply assigning values. But when we get to expressions in math and things like that, then we'll see that start to happen. We can also assign the value of one variable to another. Here, we've taken the value of the variable name, which is "Jerry," and we're assigning it to a new variable called name1, which is also of type String. So now, name1 would have the value "Jerry," and name would have the value "Jerry."

Also, please note, the equal sign here is assignment. It's not an equality test. We'll talk about that more when we get to conditionals.

Also, we can represent values with a mathematical expression. Here's a very simple one. We can take the quantity, which is, right now, 23. And we can take the price, which is 12.35, and we can multiply the two. The asterisk is what we use for multiplication. Quantity times price is evaluated, and then the result, 12.35 times 23, is assigned to total.

We can also print the values to the screen, as we've seen using System.out.println. We can simply pass it a variable, and it will print the value to the screen.

So when we work with variables, we can declare them, and assign them, and do various combinations. First of all, a single variable can be declared and initialized at the same time. We have an address variable of type String, which will be assigned the value "123 Oak St." Note the double quotes.

We can also have a single variable that's just declared. Here, we have String customer. Currently, it has a value null, it has no value yet. We could also declare multiple values on the same line of the same type, for example, String name comma city.

Although, honestly, I don't tend to do this. I tend to break them all up. But that's an older habit of mine for readability. But the compiler is fine with that.

Two variables of the same type can be declared and initialized together, like String country equals "USA" state equals "CO" and previously declared variables can be initialized. So, for example, we declared String name and city. They're both null right now because they weren't given values, unlike address, which was given a value when it was declared. But we declared the variables here, and then we initialized it down here-- city equals "San Diego" which actually happens to be where I live.

So we've got an exercise for you. First one is working with String variables. We're going to ask you to create a new Java Class, and that Class Name should be Customer. Then, we're going to ask you to put it into a package called duke.choice, which you should already have. Then we're going to add a name property to the Customer class, and that property will be called name, and it'll be a String.

We're then going to use the Customer in the main method of your ShopApp application. What we want you to do is add a variable type of Customer named c1 to the main method of a ShopApp class. Now, to do this, go back and look at code examples here in the lesson and see if you can make the code work the way it's described.

Initialize this variable to reference the new Customer object. So essentially, you're going to create c1, which would be of type Customer, and you'll assign it a new Customer object. And we have seen how to create new objects. We saw that in a previous module. Once you do that, set the customer name to be "pinky".

Now, we have this exercise recorded as a demo, and you can go through it and watch it if you get stuck. But really, I would encourage you, if you can, look at the notes, try to get this to work yourself. If you get stuck and you can't get it to go, then, of course, take a look at the solution. Lastly, you want to print the message that greets the customer.

Quiz time-- which of the following variable declarations and/or initializations is correct? Go ahead and pause the video, think about it, come up with your answer. And when you're ready, play and continue.

So the answer is d. The answer is d because boolean complete equals true works because true is a reserved word, and we're assigning the boolean value true to a Boolean variable. c does not work because when we put "false" in double quotes, that makes it a String, and now we're trying to store a string into a boolean variable, and that is not allowed.

Here, we see that b is not correct because String is a class and should be written with an uppercase S. Now, we haven't gone over this in a lot of detail, so if you missed this one, don't worry about it. But String is a class, whereas, int and boolean are not classes, they're what we call primitives. And we will talk about that in a later module.

int count equals 5 is fine, but with the semicolon instead of a comma, it won't set quantity equal to 2. Because that basically looks like two lines of code to the compiler, and it'll tell you, you didn't set the type for quantity. So that's probably a typo, let's say, and should be a comma, indicating that both count and quantities should be integers. And count gets the value 5, and quantity gets the value 2. How did you do?

## Variables Demo

Exercise 3-1, Using String Variables. In this exercise, we will create a new Java class called Customer in the package duke.choice, add a name property to the customer class, and then create an instance of the customer class as an object and set its name to be Pinky and print the message.

So going over to NetBeans, we come down into our application that we've created previously. Here is duke.choice. Right-Click, select New Java Class called Customer. Check to make sure it's in the correct package. It is duke.choice as you can see here. Click Finish.

And there is a customer class. The exercise says-- create a property called name of type string. So we'll do that. Inside the class, we want a string called name semicolon. And then we want to add a variable of type Customer called C1 to the main method of the Shop class.

All right, so over here is ShopApp. And we'll add a new customer variable. C1 is equal to new customer. Now, we haven't talked actually about how to create new objects yet. We're doing now so we have objects to work with in the exercise and throughout the rest of the course.

But essentially what's happening is we're creating an instance of the customer class using new customer. That creates an instance of the object in memory, which is essentially a memory structure to hold the data values, like the name. And C1 is now a reference or a pointer to that object. Now, to use that, once we have an object there, we can call c1.

And by doing period, it'll drop down and show me all the available methods, for example, name. Select name. And we'll say, c2 name is equal to, quote, Pinky. And now we've assigned the name. And then we can print it out using System.out.println. And we'll say, customer is-- and we'll concatenate that with the name.

All right, so with that, if we run this, we should now see that indeed customer is Pinky. So we completed the customer class and we completed the exercise. We have the variable created with Customer and the message is being printed. That completes Exercise 3-1.

## Data Types and Constants

[MUSIC PLAYING]

Data types and constants, Java has, basically, two different types of data types, primitive data types and objects. Objects are things like strings-- cat, dog, animal. But we also have what are called primitive data types, which are not objects, but allow for easier and more efficient code.

The integral types of byte, short, int, long are different length integers. The ones you'll work with most often is int. Floating point types can be float and double. You'll most likely work with double. Your textual types can be a single char or character. And your logical type is boolean.

Int and double values, int, which stands for integer, int variables hold whole number values between negative 2,147,483,648 and positive 2,147,483,647. Now you might look at that and go, why isn't it 648? Remember 0 as well. So examples-- 2, 1343387 written two different ways to show you you can use an underscore to break up the number for readability.

double variables will hold larger values containing decimal portions and can be very, very large numbers or very, very small numbers. We use these when we need much greater accuracy. So integers are typically used for counting or things like that where you don't need decimals, and you don't have extremely high or extremely small numbers.

When you do have very big numbers-- you have to calculate the distance to the sun or what does an electron weigh or whatever it might be-- then doubles are what you're going to use. Here's some examples of doubles. As you see, they can get very, very large, including, over here on the far right, can be positive, negative. And, over here on the far right, we can see that 2.1E12, that's 10 to the 12th. That's a very large number.

Now, to work with these numeric values, we can assign them, as we've seen before. Here we declare an integer quantity1 and assign the value 10. That compiles and is fine.

Here we create a variable called quantity2, which is of type integer, and try to assign it the value 5.5, but the compiler would not allow that because quantity2 has been declared as an integer. And integers cannot have a decimal portion. And, in order to make 5.5 fit into the-- into an integer, it would have to truncate or lose precision and it would change it from 5.5 to 5, and then the number is invalid. So the compiler simply won't do it. And you, as a programmer, would have to figure out what happened and what to do.

If you really wanted to use 5.5, then quantity2 cannot be an int. In that case, it'd probably be a double. So, if I had written double quantity2 equal 5.5, that would be fine.

Down here, we can write double price equals 25.99. It works fine. We can even write double price2 equals 75 without the decimal, and it'll be filled in for us because 75 and 75.0 are equivalent.

We can also assign one variable to another. price2 can be assigned to price1. Now we don't go into it here in this high-level overview course, but, in the real courses inside the learning subscription, we go into a lot more depth with this. There are all kinds of situations.

How do you store doubles into ints and ints into doubles? And what if you're doing a calculation with an int and a double? And what do you get back and all that kind of stuff? We don't cover that here, but we go through that thoroughly in the learning subscription.

Now it's legal to write the right-hand side is evaluated and assigned to the left. And we put this in specifically because this will sometimes make people kind of go wait, scratch their head, and go what's going on. How can you do that?

Again, don't get confused. Remember, always, the right-hand side is evaluated first. So we would retrieve the value for price1 and assign it back to itself. Now this actually means nothing. This is really goofy, and you wouldn't do this because it doesn't actually do anything, but you could do something like price1 plus 1.

So now, if I were to write price1 equals price1 plus 1, I've incremented price1. It takes the value of price1, which I believe right now is 25.99. And we could add 1 to it, taking it to 26.99, and then store it back into price1. And that's what they're really trying to show here.

Lastly, we'll talk about constants. We've been talking about variables up until now, but there are a number of situations where we have values that must not change within the program. Examples of that would be like number of months-- you can't have more or less than 12 months-- and pi. Pi is 3.14 blah blah blah, and that doesn't really change either.

So, to create a constant, we use the keyword final. So here we have double salesTax equals 6.25. And salesTax gets assigned the value 23.5. So it's now changed, changed from 6.25, and we assign 23.5 to it.

Then we declared a final int NUMBER_OF_MONTHS to be 12. And the convention for constants is to put underscores between the words and make the words all uppercase. So now, if I try to assign the value 13 to NUMBER_OF_MONTHS, it will not compile. So, with that, we've seen how to declare variables and work with data types and also work with constants.

## Operators

Operators. Up until now, we've seen how to create variables and constants, and we've seen how to assign values to variables and work with constants and such. But we haven't really talked about the mathematical operators and what's available in Java. Java supports the standard mathematical operators-- addition, subtraction, multiplication, and division. And examples are shown here.

We'll start by assuming that we have an int result equals 0, an int num1 equals 11, and an int num2 equals 2. So now if we come to our first example, result is equal to num1 plus num2. Well, num1 has a value of 11. num2 has a value of 2. 11 and 2 is 13. So the value 11 and 2 is summed together, added together, and assigned to result, and result becomes 13.

If we then take result and add 1 to it and store it back in, it takes the value 13, adds 1 to it, and stores it back into result, which becomes 14. Now, a shorthand way of doing this in Java is to write plus equals. And it's equivalent to writing result plus 1. So it takes a value result, which currently is 14 from what we did here, add 1 to it, it becomes 15, and store it back in result.

There's also another way to increment, is to use the plus plus. So plus plus takes the value of the variable and then adds 1 to it-- increments it. So it was 15 here, result is now 16. Down here, if we take num1 minus num2, num1 is 11 minus num2 is 9, and store the value 9 back in result. num1 times num2 gives us 22, and store that back in result. And num1 divided by num2 gives us a result of 5. The remainder of the division is discarded, because result is an int. Careful with this. And this is one of the things to watch for, and something we go through in more depth in the Java learning subscription. Also remember, division by 0 will throw an exception. That should never be allowed to happen.

Now, as you know, there is a sequence to how mathematical formulas are executed. And by default, it is multiplication and division first. Well, it's left to right, multiplication and division first, and then addition and subtraction. So now given that, what is the value of this expression? There's a number of different things you can come up with. You can come up with 34 or 9.

I'll give you a moment, and then we'll see what the answer is. All right, so using the rules of precedence, operators within a pair of parentheses are executed first, then increment and decrement operators-- if you have a plus plus or a minus minus-- then multiplication and division operators are evaluated from left to right, then addition and subtraction operators are evaluated from left to right.

So if we go back to our original example here, let's see what we get. Well, using the standard operator precedence, we would actually-- so we take a look at this. All right, so we go left to right, multiplication and division first. There are no parentheses, and there's no plus plus or minus minus. So we would start by multiplying 5 times 4, which is 20, and then divide by 2, which gives us 10.

So 25 minus 10 would be 15, minus 10 is 5, plus 4 is 9. So using the standard rules for precedence, the answer here is 9. But what if you don't want to use the standard rules of precedence? What if you'd like to override those rules of precedence? Which you can do with parentheses.

So here, if we rewrite this with parentheses, we could say, OK, why don't we want to take 25 minus 5, multiply that by 4, then take all of that and then divide that by 2 minus 10, and then take all of that and add 4? That gives us 25 minus 5 is 20, times 4 divided by 2 minus 10. So we get 80. Divided by 2 minus 10 plus 4. 80 divided by minus 8 plus 4 minus 10 plus 4 is actually negative 6.

So again, we use parentheses to enforce a different order of evaluation. Computer programs have the ability to make a decision-- choose between two things. Is this true or is false? And take different actions based on that. The Boolean data type, which is what we use for that, has only two possible values-- true or false.

A Boolean expression is a combination of variables, values, and operators that evaluate to true or false. For example, we can use the greater than sign here and ask is length greater than 10? And we don't see what the value of length is. And it doesn't matter. This is more of a syntactical example. So we would look at length. And length is either greater than 10 or it's not.

And if it is greater than 10, it returns a value of true. And that would be stored into longer. If length is not greater than 10, meaning it's equal to 10 or less than 10, then the value false would be stored into longer. Again, remember, everything on the right hand side is evaluated first and then assigned to the variable on the left.

Here, we're taking the values of the variable size and asking, is it less than or equal to max size? Well, it either is or it isn't, and so true or false gets stored into smaller. And here we get a little fancy here. We're actually going to multiply cost times price. Everything in parentheses is evaluated first, then the rest is evaluated.

Now, in Java, the equality comparison is equal equal to avoid an accidental assignment, like they could potentially do in C. So here what we're saying is is total-- is the value of total-- equal to the value of cost times price? Again, it either is or it isn't, and true or false would be stored in the same value.

So this gives us a number of different ways to do comparisons and make decisions based on that. We'll see conditionals and if statements and things a little bit later on. So when working with relational operators and doing comparisons, we can compare whether two things are equal with equal equal. If int i equals 1, then i equal equal 1 is true.

Is not equal. We can use the exclamation point, also called the bang symbol. Exclamation point equal is not equal. So i equal 2, i not equal to 1 is true. Less than. We can have a less than test. Less than or equal to, greater than, and greater than or equal to. And those are your standard relational operators. We'll see more about these when we start talking about conditionals and ifs a little bit later on.

Now, because primitives are not Java objects, they can only be compared and manipulated using relational operators and the mathematical operators. So for example here, we see price1 is equal to 9.99, price2 is equal to 12.99. And remember the comma here, so they're both doubles. We can then say, is price1 greater than price2?

Well, let's see. price1 is 9.99. price2 is 12.99, so that's false. And we would get back a false for cheap. price1 is not more expensive than price2. Objects-- for example, strings-- can be compared using operations. So when working with objects, if we're going to manipulate them, we have to use behaviors, operations, functions, or what we call methods in Java.

So here we see that we have name1, which will be a string, and we give it the value Pinky. name2-- note the comma-- will be a string as well. And it will get the value pinky, but a lowercase p. Notice the lowercase p. Now we can create a Boolean variable sameName1, and we can actually execute an operation-- execute a method called equals.

So what this does is it goes to the name1 variable, which is currently of the value Pinky with an uppercase P, and asks it, if I pass you the value of name2, are you guys equal? So we pass the value of name2, which is pinky with a lowercase p, into the equals operation. And it looks at the value of name1-- or I should say, name1 looks at the value passed in, and it either says yes we're equal or no we're not. And if they're equal, you get back a true. Which by the way, they would not be equal, because uppercase P and lowercase p would be declared not equal.

However, we have another operator, or another method to deal with that, called equalsIgnoreCase. Let me try that again. We have another method that can do comparison ignoring case. Here is one called equalsIgnoreCase. We can do a test and ignore the case sensitivity. Here, for example, if we take name1 and call the method or operation equalsIgnoreCase and again pass it name2, then this operation, this function, and this method will ignore the fact that p is uppercase and lowercase, and simply look and see if they're the same letters. In this case, they would be equal, and sameName2 would be true.

String variables can be combined or concatenated using the plus operator. For example, if I create a string variable called greet1 with the value Hello and greet2 with the value World, I can call greet1.concat(greet2). There is a method for the string class. Remember, greet1 is now a string object. So we're essentially saying to the string object, concatenate with greet2.

Passes the value of greet2 in, combines hello world, and the result of that would be string message1, which is now a new string, which is the concatenation of hello and world. By the way, neither greet1 nor greet2 change as a result of this line of code. Now, if we come down here, we can do it a different way. We can write greet1 plus-- which is a concatenation symbol, and does the same thing that this does-- with quote space quote.

So we get like a space there from greet1, then a space, then greet2. So we would essentially be building up hello space world, and then we concatenate an exclamation point at the end. Or greet1 plus space plus greet2 plus another space plus 2014. Now, you might look at that and go, is that going to add 2014? No, it's not, because the compiler is going to see that these are all strings, and it'll convert 2014 into a string at that time. And it all becomes concatenated together.

So Java provides many different classes for doing many useful things. For example, string. Each class that Java provides or someone else provides or that you write for yourself will provide multiple methods that perform useful operations and creates the interface of the class, and is the way that you get that class and that object to do things.

The Java documentation provides the reference for the classes and their operations. For example, here we have string hello, and it gets the value Hello World in quotes. We create an integer stringLength to hold the length of the string. We take the hello variable and we execute the method length against it, and we basically tell the hello variable, look at your string and tell us what the length is.

And so it counts the number of characters-- one, two, three, four, five, six-- the space counts as one-- seven, eight, nine, 10, 11-- and returns the value 11 into string length. We also have another operation called trim, which will trim off blanks. So if we start with space HOW space, and we execute the code trim against it, it will remove the beginning and ending spaces.

Here we are going to convert something to lowercase. We take greet. greet has a value HOW. And then we're going to concatenate DY. But before the concatenation occurs, we execute the method to lower case against the DY object. Now, you might be saying, how do you execute code against a string? It's not a variable. True, it's not a variable. But internally, inside the computer, it will see this as a string object when it's executing this, convert it to lowercase-- lowercase dy-- and then concatenate that with greet.

But that's going to look weird, right? Because H-O-W from greet will be uppercase, d-y from being converted to lowercase will be lowercase. So it'll have uppercase HOW and lowercase dy, and maybe that's not really what we wanted. So instead, what we're going to do is use parentheses to change the order of evaluation. We're going to first concatenate the trimmed HOW with DY, and that creates a new string. And then we're going to ask that string to convert itself to lowercase. The returned lowercase string gets stored into lc2.

Lastly, we can find the position of characters or strings within other strings for doing string manipulation, which is a very, very common use case in business data processing. Here we have hello, the hello string variable. And we're going to ask it to look for the index of the o. Now, this may come as a surprise to you, but the first character in a string in Java is the index of 0. So h is position 0.

Lastly, we're going to see that we can find the position of characters within a string. Here, for example, we have the hello string variable, and we're going to ask it to find the index of o within itself. So we take the string variable, and we call the method indexOf on it, and pass in the o. And what it does is it goes through and figures out the index of the first o. Now, in Java, strings start with an index of 0. So h is 0, e is 1, l is 2, l is 3, o is 4. So index of o would return 4, even though it's actually at the one, two, three, four, fifth position, from an index perspective in Java, it is at index 4.

OK, quiz time. Which of the following statements are correct Java code? Choose all that apply. Go ahead and take a look at this and pause. And then when you're ready, resume, and we'll see what the answer is. OK, which of the following statements are correct in Java code? Let's see. We have an integer count equals 11.4.

That won't work, because remember, we said count is an integer, and it would try to truncate, and that the compiler won't allow that. So a is wrong. double amount equals 11.05. Yeah, looks good. Integer cost equals 133_452_667. Yep, that's fine. It's still an integer, we're just using the underscores for readability. And lastly, 1.05 times amount works just fine. We're multiplying a double by a double and storing it back into a double. Great.

Another quiz. OK, here we have string name Bob. And so name is going to have the value Bob. And we're going to string message, which right now has nothing. We haven't assigned it anything. And an integer num equals 3. Which of the following statements correctly assign the value Bob wrote 3 Java programs to the message variable? Look carefully, and very carefully look at the characters, because this can be a little tricky. Pause the display, and when you're ready, resume and see what the answer is.

Well surprisingly, the correct answer is b or c. b and c are correct. Now, you look at a, and you're like, what's wrong with that? Well, we're taking the name. OK, that's Bob. Plus we're going to concatenate the word wrote. So far so good. Plus we're going to concatenate num, which is 3. So far so good. And then oh, no plus. So syntactically, we're missing the plus here, so there's no concatenation, and the compiler would fail.

Down at the bottom, we take name, concatenate wrote. Now we're concatenating 2 plus 1. And what will happen here is the compiler will see 2 as a string and 1 as a string and concatenate them together. And we'll get Bob wrote 2,1 Java programs, which is not what we want. OK, so to make that happen, we see what's going on here. We have to put in parentheses Bob wrote. And now 2 plus 1 gets evaluated.

Remember, things in parentheses are evaluated first. 2 plus 1 gets evaluated to 3. Then we get Bob wrote 3 Java programs. c is just fine. And of course, b is fine, because we're taking Bob wrote and the number 3, which is convert it to a string. Great. How did you do?

All right, we have one last exercise for this lesson. And this is going to create a new Java class. And we're going to work with numeric and text variables. We want a new class called Clothing. We want a package. Put in a package called duke.choice. Add properties to the Clothing class. We want a description, a price, and a size.

Description is a string, price is a double, and size is a string. Initialize size to be M for medium by default. Then use Clothing in the main method of your ShopApp. Add two variables of type Clothing to the main method of your ShopApp class. Call these variables item1 and item2, and initialize these variables with a reference to the two new Clothing objects. So item1 is equal to new Clothing, item2 is equal to new Clothing.

Then set the clothing item properties for description, price, and size something like this. For the first item of clothing, it should be Blue Jacket, 20.9, and M. For the second item of clothing, it should be Orange T-shirt, 10.5, and S. Then print the details of these clothing items as a common delimited text.

Lastly, introduce a double variable called tax in the main mass of the ShopApp class. Place this variable declaration as a first line of code within the main method of the Shop class. Set tax to be the value 0.2, which represents a 20% tax rate. Add a double variable called total to represent the total amount a customer needs to pay for purchases. And then calculate and print the total amount, including tax, that a customer needs to pay.

Assume the customer has purchased two T-shirts and one jacket, and calculate what the total would be. Place this logic just after the code that prints clothing object details and store the result of the calculation as the total variable value. Finally, print the total amount. Now, hopefully you can use what you've learned in this module and other modules to get this code to work. But again, if you can't, there is a solution for this where I go through it and I demo writing all the code and setting it all up in NetBeans. Give it a try first. But if you get stuck and you need help, feel free to look at the video. Thank you.

## Operators Demo

[ORACLE AUDIO TRADEMARK]

Exercise 3-2, Using Numeric and Text Variables. In this exercise, you'll create a new Java class, called clothing, add properties for the description, price, and size, and set the initial size to N by default. We'll also use clothing in the main method of the shop class, add two variables to represent clothing item1 and item2, we'll set the clothing item properties, and we'll print details of those clothing items as comma delimited text. Then we'll add a variable called tax, and we'll calculate tax based on the total items purchased.

OK, let's get started. First off, create a new Java class. So we come back here to duke.choice, right-click, New, Java Class. This one is going to be called clothing. It'll be under duke.choice. So we'll call this Clothing. And it is under duke.choice. It looks good. Click Finish. There's our clothing class.

And now we need-- let's see, description, price, and size, String, double, and String. So we need a String description, a double price, and a String size.

All right, and it says, size should be initialized to M by default. So we'll say size equals, quote, "M," unquote. Make sure it's uppercase M. And it is. And we're good.

All right, Save our work. We've compiled correctly.

Next up, use clothing in the main method in the ShopApp. We're going to create two variables of type clothing, one called item1 and item2. And we'll reference them as new clothing objects.

So similar to what we did for the customer, we'll come over here, and we'll come down here a little bit. And we'll say, OK, we need clothing item1 equals new clothing. There we go. And then the second item will be clothing item2 equals new clothing.

OK, so we created two variables, item1 and item 2, and we have them pointing to clothing objects. Now we're going to set the clothing properties for description, price, and size. First item should be Blue Jacket, 20.9, and M. So we'll come down here and we'll do item1, dot. And when I do dot, there is the description. So that would be equal to Blue Jacket. And then next one is price, 20.9.

And lastly a size. And that's equal to M. Now, as you might have noticed, with it already being M by default, we don't actually have to set the third one. But I'm doing it to be consistent. For the second item of clothing, we want an orange T-shirt, 10.5, and Small. So now we'll come down and we'll do the same thing for item2. There is description equal Orange T-Shirt. There we go. And 10.5 for the price.

OK, so now we have everything. And print details of the clothing items as comma delimited text. OK, so what we want to do is we can do System.out.println. And we can say item1. And we'll say item1, and then plus comma, plus item1.description plus comma, plus item1.price, plus comma, plus item1.size.

All right, so let's see what that looks like. And there's your comma delimited string-- item1, Blue Jacket, 20.9, M. Now, I'll just copy this and simply replace item1 with item2. Now of course, in programming, there's easier ways to do this. And there's ways to do this automatically. And we'll see some of that as we go through the course. Right now, we're pretty much doing what's considered hardcoding the values in. And it doesn't make for a very flexible program, but it does work. And it will show the right results. And there we go. There's the right result.

So that's the comma delimited text. OK, that's number five. And then number six, introduce a double variable, called tax, in the main method. And make that value 0.2.

OK, so we're going to come over here, and in the main, I'm going to add a variable-- double tax equals 0.02. All right, let's see. And all right, that's good. Oh, sorry, 0.2, 20%. So I was off by a decimal. There we go.

Now, add a double variable, called total, to represent the total amount the customer needs to paid for purchases. So we'll go on and we'll-- we can actually even do it on the same line, just to show you different syntax options. Comma-- this will be a double as well, called total-- and we'll say total is 0.0, because initially the total is zero. So just showing a different way to do it.

Now, calculate and print the total amount, including tax, that the customer needs to pay. Assume the customer's purchased two T-shirts and one jacket. So we're going to basically create-- we're going to create two T-shirt objects and one jacket, and sum up their total. And we'll put that into the total variable.

All right, so if we come down here, we see that there are two-- let's see, so we have one T-shirt right now. That's item2. We need another T-shirt. So we'll create another T-shirt here. And that'll be item3. We'll create the next clothing item. OK, so that's item3.

This will be another orange T-shirt. And actually what we're going to do, rather than having to create a brand-new object all over, I think we can simply reuse it. Because it already exists. We don't have to create a brand-new object. So what we're going to do instead, to do the total, total is going to be basically something like this. Total is going to be equal to total plus the costs.

OK, so the first one is going to be the price for the blue jacket. So remember, it said that they have two T-shirts and one jacket. So we're going to add in the total for one jacket, which is a jacket is item1. So we need item1.price plus item2.price times 2. Remember, there are two of them.

And then we also want to take 20% of that. So we're going to take the total-- let's see, so we don't even have to do a plus. We'll just say this. We'll say total is equal to item1 price plus item2 price times 2, times 1 plus tax.

All right, let's see, that should be about right. I was doing it as a comment first. And then take a look at the code. So let's see, does that work? Does it compile? We do a Save. That looks good. OK, so let's go and say the total, which we defined up here-- total is right up here-- total is equal to the item price, item1 price, 20.9, plus item2 price, 10.5 times 2-- that's two of those items-- times 1 plus the tax. So if the tax is 20%, 1 plus 20% would be 1.2. And if you multiply all that by 1.2, then you'll know-- actually, I think we just want the tax. We have to apply tax. So that adds an additional 20%. We're not just calculating the tax, we're adding it on.

So let's go ahead and print that out. And we'll say total equals-- and we'll just go ahead and say plus total. And let's see what we get. So 42.1, is that correct? Let's see, 20.9, it's about 42-- oh, sorry, 20, 30, 40, 42. And 20% of that-- hmm, I think it might be off by a little bit. Let's see, let's make sure this is working correctly. We want item price times 2. Let's run that again. Yep, still 42.1. So this seems to act correct.

So item price-- oh, that's what we have do. We have to make sure the addition occurs. That's what's going on. OK, much better. OK, that's much better.

Because what was happening is the order of precedence, is the 1 was being multiplied by all this, and then the tax was being added. That is incorrect. And we don't need the parentheses, actually, inside here. So let's run that again.

And later, when you use other kind of classes like formatter classes, you can get this down to 50.27 or 50.28. It was supposed to be a two-digit decimal like a number for a total amount.

OK, so we printed the total amount value, we store the calculations in total variable, and we've completed the lab exercise. And with that we complete exercise 3-2.

## Summary

Summary, what you learned in this module. In this module, you learn to describe the purpose of a variable in the Java language, list and describe four data types, declare and initialize string variables, concatenate string variables with the plus operator, make variable assignments, declare and initialize int and double variables, modify numeric values using operators, and how to override the default operator precedents using parentheses.

