# 5: Declaring, Initializing, and Using Variables

1. Declaring, Initializing, and Using Variables, Part 1 - 16m
2. Declaring, Initializing, and Using Variables, Part 2 - 11m
3. Operators to Modify Values, Use Promotion and Type Casting - 22m
4. Practice 5-1: Declaring Field Variables in a Class - 10m
5. Practice 5-2: Using Operators and Performing Type Casting to Prevent Data Loss - 19m

## 1. Declaring, Initializing, and Using Variables, Part 1 - 16m

Let's go ahead and take a look at Lesson 5. We're going to look at, again, declaring, initializing, and using variables. So in this lecture, we are going to identify the users of variables and define the syntax for a variable.

We're going to look at listing the eight Java programming language primitive data types. We're going to look at declaring, initializing and using variables and constants according to the Java programming language guidelines and coding standards. And we're going to, of course, modify the variable values by using operators, and of course using the promotion and type casting.

In terms of the relevance, we have a couple of questions here that we want to, of course, answer through the lecturing this lesson. First one is a variable refers to something that can change. Variables can contain one of a set of values.

Again, where have you seen variables before? I bet you that we use them on maybe a daily basis. So, for example, I could look at myself as an object of type human being and I have a bunch of variables-- my name, maybe my height, maybe my address, and so forth.

And it could be any type. It could be a laptop that you have. It has this much memory and this much RAM and this much cache, and so forth. So all of these are variables. And of course they hold values for a special type of objects.

And the second one is what types of data do you think variables can hold? So I was just mentioning would-be values for different type of-- variables for special type or different type of objects.

Let's go ahead and look at identifying the use of the variables and define the syntax for a variable. For that, we'll take a look at this example where this class called "shirt" and we've seen this shirt. And of course, we use variables for storing and retrieving data for your program. Objects typically store their individual states in fields.

And fields are also called, lots of times, instance variables because their values are unique to every individual instance of a class. So folks, we've been calling them fields yesterday and attributes. And today, we are going to start calling them instance variables. They are the variable of the instance. Why? Because they hold unique values for every individual instance of the class.

For example, for a shirt, I could have a particular variable that says the color is red, which means the shirt is red. I also can say that the quantity in stock is seven, when by the way, another shirt that has, for example, the variable "long sleeve" and the shirtID, xyz. And then of course I can say the color is green, and I say, by the way, the stock-- the number in stock in this case or the quantity in stock would be, for example, 100, which means I still have 100 to sell in stocks. Right? OK.

Continuing with that, now look at identifying variables using the variable use and of course the syntax. So here's an example where I have, in this case, a display description. And of course, this is a method. And if you take a look here, we are missing the open parenthesis and the closed parenthesis that should be there. So that obviously that's a typo.

So your program can also have variables defined within methods. By the way, ladies and gentlemen, pay attention to this one. Because I'm going to quiz you about that later on. OK. I'm just kidding.

So these variables that are defined within a method, they're typically called local variables. They're called local variables. Because they're local only to the method. Because they are available only locally within the method in which they are declared.

Once the method exits and finish execution, those variables are automatically gone. They're automatically deleted by the garbage collector. OK. That's what we mean by that.

So throughout the course, the term variable or fields are used to refer to variables. And if the situation requires local variables, we typically call local variables. By the way, sometime, local variables are also called automatic variables. Just a nickname for them. Because they're used automatically by the method. And then they vanish automatically. Right? They're known only locally to the method.

Continuing with that, now looking at the uses of variables. We typically use variables to do what? Hold unique data for an object instance, assign the values of one variable to another one, representing values within a mathematical expression, printing the values to the screen-- we already have seen the println and how we print that-- and holding references to other objects. We'll see that later on. OK? We'll see that later on.

And we see how we printed here the variables, price and, for example, shirtID. Price is a double, and shirtID is an integer.

Continuing with that, let's go ahead and look now at the variable declaration and initialization. The syntax, typically, the way we write it down is you've got the modifier-- modifier, give me an example of a modifier.

Public.

Public, good. And the type? Give me an example of a type. Int or double. And the identifier would be what? The name of the variable and then here-- whenever, by the way, you see in the syntax in Java, whenever you see between square brackets, what it means folks is optional. In this case, optionally, we can do what? Initialize that variable with a value. Right?

And of course, looking now at the local variable. A local variable, as you see here, we have a type, the name of the variable, and then initialization, if you want to initialize that.

So just to let you know, folks, that whenever you work with local variables-- local variables, by the way, do not have a modifier. You cannot put a modifier in a local variable inside a method or a block of code. Here's an example of a bunch of variables or instance variables. We've seen that shirtID-- here, you can put a modifier, because they belong to the class.

But on the other hand, if you want to declare a local variable within the method, then it cannot have a modifier. And by the way, a variable can be used only if it's what? Initialized. It has to have a value, right?

So there are some default values at the class level, when you have a instance variable, but then-- we'll see that later on-- but then locally inside the method, you have to initialize the variable before using it. Otherwise, if you don't do that, then the compiler will scream at you.

And, again, here's what we say. A note, do not use modifiers with local variables. Again, variables are declared within methods. Identifiers is the name of the variable. And the value is whatever value you want to give it. And here's some declaration of fields or instance variables that we've seen in the shirt class. Everybody's following?

Ah! Now we're going to see the list of the eight Java programming language primitive data types. And these are the primitives. For integral types, we have a byte, which is an integer but small. We have a short. We have "int" for integer and "long" for long integer. These are the integral types.

We also have two floating point types. These are the ones that have decimal point. And they're called "float" and "double." Again, in this case, the seventh one would be a textual type. That's a character. And the last one, which is number eight, would be the Boolean type.

Now, of course, some of you are a little bit interested and curious about what's the size of these types. And you should be able to ask this. So let's go ahead to look at the next slide to actually define all of this. Let's go ahead and look at that.

Let's look at the integral primitive types. We said that the byte, typically, the length is what? 8 bits. And of course, here's an example. 2, -114, and so forth.

Now, in addition, we have a short. And then, a short is of 16 bits. And again, an example of a short is 2 or -32669. And then we have the int, which is the default type by the way for the integral literals. That's the default for the JVM. That's 32 bits. And again, we show you here examples about where it-- As you see here, we put this integer, which is 147334778.

Some of you might be curious and say wait a minute, I have not seen this before. What is this 123_456_678? Can we do this in Java? And the answer is yes, starting JDK 7, starting-- I know, this is a new feature. So what are we going to do now is we're going to start looking at the new features.

Starting now that there's a new feature that actually, in this case, that I see here. That's a binary number. We could not do this, by the way, represent a binary number in Java SE 7 and before. OK. We used to represent a binary number in a hex, hexadecimal format, or octal format. But we could not do it in a binary format. Right?

So, for example, and let me just go to the board, so that I can talk a little bit about the binary numbers. It turned out that, for example, a binary number, for example, 2 is represented this way, as you know. 1 is represented this way. And 3 is this way. One more. and then 4 is 0100, and so forth. And 5 is 101. And then 6 is 110, and so forth. Right? Now we can actually represent these in Java SE 7 in our programs.

Going back to the slide. So it turned out that this is a new feature that allows you to express any integral type in the form of binary, 0s and 1s. For instance, a binary expression of a number 2 is again shown as an allowed value of the byte integral type. Again, this would be represented this way. 0b representing the binary, and 10 representing number 2. This is fairly a new part of the SE 7.

The other thing that is part of the SE 7, another new feature, is now you have the ability to include underscores in a lengthy integer number or long integer that helps you with readability of the code. So instead of-- it's like phone numbers, you know, 123 dash and then 345 dash 2-- that's the idea behind this. And all the credit card numbers, and so forth.

So now we have where we can put in the underscore in between and of course, the JVM SE 7 would understand that. Everybody's following, folks? Good, good, good, good.

Now looking at the integral primitive, last one is long. And long is 64 bit. And by the way, if you want to represent a long number, you also need to add a lowercase l or capital L next to the number to specify that it's a long integer. You should also note that for the byte and short-- some of you are again looking at this byte and short-- let me show you that in the slide before the byte and short, 116-bit and the other one 8-bit that you see here. And some of you might be saying why do we need this?

Well, the only reason that again we created these a while ago in Java, short and byte, is because at that time, we wanted to save memory. Memory was expensive. And that's why we used that. But nowadays, because memory is inexpensive, then whenever folks, you know, people, write typically programs, or developers write programs, they always use integer and long integer. We see rarely folks using byte and short. That was really when memory was expensive. Everybody's following? Good, good, good, good.

Now looking at the floating point primitive. There are two types of floating point primitives. They are the float, which is of size 30, again, in this case, 32. And by the way, we always represent a floating number using an F next to it. Because what happened, because the double is 64 bits, and the double is what? It's the default type for floating point literals. So

If you want to represent a number, a floating point number, as a float, and if you just, for example, you write it as 33.4, for example, and if you don't put an F, the JVM will treat it as what? A double. Because that's the default. That's how it sees a floating point number. Right? OK, good. And so we use again the double type, when a greater range or a higher accuracy, of course, is needed.

Let's go ahead and look at the textual primitive type. Well, the only primitive textual type is the char, or what you call the character. It is used for a single character of 16 bits. An example here, I declare the color code-- we've seen this by the way in the shirt class-- and initialize it with the what? With the character, and by the way, you always enclose the character within what? A single quote, all the time. And on the other hand, we include string within what? Double quotes. Thank you.

And again, one more thing, and did you know-- again, many computers or computer languages use the American Standard Code Information, which is an interchange, which is the ASCII. And that's an 8-bit character set that has an entry for every English character, punctuation mark, number, and so on.

Java, on the other hand, ladies and gentlemen, uses the 16-bit character. That's the Unicode. Why? Because Java is also used by many older languages that need 16 bits to represent their characters. For example, Chinese, Japanese language and so forth. Hebrew language, and so forth.

Now looking at the last one, which is the logical primitive type. The only data type is Boolean. And by the way, it can store either one of true or false. Those who are used to C languages, C++, the 0s represent the true, and 1 representing-- or rather, 0 representing the false, and one representing the true.

Of course, in Java, you can actually use the values directly true and false. Again, it holds the result of an expression that evaluates to either true or false. Everybody's following? So for example, here, if I set answer to 42, and then if I say if answer strictly less than 42, I know that 42 cannot be strictly less than 42. Then of course, this evaluates to what? False.

## 2. Declaring, Initializing, and Using Variables, Part 2 - 11m

Ah. Let's go ahead now and look at declaring, initializing, and using variables and constants. Everybody's following, folks? Everybody's with me? Good. Good.

Now looking at naming a variable. Well, the rules, by the way, to name a variable, a variable identifier must start with either an uppercase or a lowercase letter. And of course an underscore, you can use that, or of course, a dollar sign.

Variable, by the way, identifiers cannot contain punctuation, spaces, or dashes. And the Java technology keywords can not be used too as a variable. For example, new, class, right? What we have seen, you cannot use that.

Another thing that we want to add to you here, did you know that many programs allow the combination of using the first character of the type as an identifier like int, I, or float and so on, to be able to represent in the type I for integer and f for float and so forth? Again, this convention is acceptable for small programs and are easy to decipher.

But generally you should again use more descriptive identifiers. That's how typically we say it. Again, use those descriptor identifies that, of course, follow the semantics of your application. Right? Good. Good.

Here are some guidelines in naming variables. So we tell you, we advise the folks, begin every variable with a lowercase letter. Subsequent words should be capitalized. For example here, myVariable, with a capital V. We've seen this again in some examples.

And of course, choose names that mnemonic and that again, indicate to the casual observer the intent of the variable. For example, if I want to look at ID, I say myID for example, or the item ID, I say itemID and so forth.

Now look here on assigning a value to a variable. Once you declare a variable, you can go ahead and assign the value to it. For example, here I declare the variable price as double and assign to it $12.99. Or I can go ahead and declare a Boolean called isOpen and a variable of course, I now go ahead and assign to it false.

So remember that the equal operator, what it does, it assigns a value on the right side to the item on the left side. You should also know that fields are automatically initialized. And integral in the class, the integrals are set to zero. The floating point types are set to 0.0. The character types are set to backslash U, which is, in this case, the null character.

And the Boolean is initialized by default to false. Remember that all the time. Everybody's following? So far, so good? Let me know if you have any questions, please.

Continue with that. And now let's go ahead and look at declaring and initializing several variables in one line of a code. It turns out that we actually can do that. You can actually declare one or more variables on the same line of code, but only if they are all of the same type. Of course, the syntax of declaring these is what we see here.

So pretty much what we do in this case is declare them and, of course, separate them by what? By comma. That's how they are separated. So for example, here I declare the type, identifier value, comma, identifier equal value, whatever and so forth.

So example here, I declare price and initialize it to zero. And then wholesale, initialize it to 0.0 and so forth. Wholesale price and so forth. Everybody sees that?

So you see that I can declare them as long as they are of the same type. And I can separate them by what? Comma.

Now looking at additional ways to declare variables and assign values to variables. Well, again here you see we can assign literal values directly to the variable. For example here, I declared ID as an integer and initialize it to zero.

And I declare pi as what? A float. And you see how I assigned to it 3.14 and then put the f next to it. I have to put the f next to it why, folks?

Imagine I did not put the f over there. The JVM will treat it as what? A double, because that's the default. That's why we have to put an f, to make sure that this is a float and not a double.

Here we declare a character called myChar, and of course initialize it with what? The letter capital G. Here I declare isOpen as a variable type Boolean, initialize it to false.

Again, assigning the value of one variable to another variable, you can do that too. For example here, I declare capital ID as a variable of type integer, initialized to zero. And then when I go ahead and declare the second one, which is what? sales ID, and I can go ahead and initialize it with what? The value of ID. I can do that. Right? So far, so good?

Now looking at additional ways to declare variables and assign values to variables. Again, assigning the result of an expression to an integral can be done, or a floating point, or a Boolean expression.

Here's an example where I declare a variable called numberOrdered, of type float, and initialized it with what? With 908.F as a float number. I can do the same thing with the second one, casePrice. And then of type float, and initialize it with 19.99F for float.

And then here, I can go ahead and declare a float called what? Price, and then initialize it with what? With an expression, which is-- in this case, the expression will be what? The multiplication of the two variables casePrice, which is 19.99 times the numberOrdered, which is what? 908.5f. I can do that. I could also here declare a variable called hour and initialize it with 12.

I can even do something else too. I can go ahead now and declare a variable in this case of type Boolean, called isOpen, and then initialize it with the execution of this expression, which says is hours greater than 12? Is that true?

Yes, because hour we assigned 12 to it. And 12 is strictly greater than 8. Makes sense. So that is, of course, we'll assign true to the Boolean variable called isOpen.

So assigning the return values of a method, again, called to a variable. Again, assigning the return value to a method called to a variable, this approach again is described later on in this course.

Ah. Let's go ahead and look at constants now. Well, a variable typically can change. For example, here I declare salesTax to be 6.25. But then later on I can change it anyway I want.

Imagine now I do not want a variable to change once I assign a value to it or initialize it with a value. Can I do that? And the answer is yes.

But what is it that I need to do to be able to specify that the value of that variable will be a constant and should not and cannot be changed later on in the program? What I do in this case, again, constants typically cannot change. And then I declare the variable and then, of course, it's of type integer, and assign to it 12.

And to make sure that no one is going to change this, I'm going to go ahead and what? And use the final keyword here. The final keyword tells me that whenever I declare that variable called NUMBER_OF_MONTHS, that, of course, automatically in this case-- and of course initialize it to 12, which means it cannot be changing. Because the number of months in a year is 12. So obviously, nobody should tell me that is 11 or 13, right?

Even if we declare this as a non [UNINTELLIGIBLE]

Yes. Within the method. Yes. You can do that.

Yes. Within the method. So even locally you can go ahead and decide, but just throughout the method.

Guidelines. Constants should be capitalized all the time. And we would separate them by underscore characters.

So in general, when you declare a constant as a variable, then of course in this case it should be capitalized. And also, they should be separated by underscore in this case to represent the different words within the name, in this case, like NUMBER_OF_MONTHS. OK. But in general we use constant always in the class.

Now we want to see where to store primitives and constants in memory. So when you use a literal value or create a variable or a constant and assign a value to it, the value is stored in the memory of the computer. Again, this figure, what it does, it shows us a couple of areas in this case. One is the stack memory and the other one is called the heap memory.

So again, in general, all the primitives, local variables declared inside the method, they're all in this case located where? In the stack memory. So this way when the method is executed, boom, they're gone. They're deleted automatically.

On the other hand, objects and their fields and methods are usually stored in the heap memory. Again, heap memory consists of the dynamically allocated memory chunks containing information used to hold objects while, again, they are being used in this case in your program.

Other variable are usually stored in stack memory, like what? Primitive variables. They're all stored in the stack memory.

By the way, the reference variable to an object also is stored in the stack memory. Stack memory stores items that are used for only a brief period of time and again, in this case, shorter than the lifetime of the object, such as variables declared inside the method and so forth. Right? OK.

And we have a quiz here. The quiz says the variable declaration public int myInteger equal 10 conforms to the variable declaration and initialization syntax. Is that true or false? Of course, it is true.

## 3. Operators to Modify Values, Use Promotion and Type Casting - 22m

Let's go ahead and look now at modifying variable values by using operators. So the operators that we know, folks, in Java are what? Addition, plus, subtraction with a minus operator, multiplication, division. We all know about that, right? For example, here I have, just for the division, I have number one divided by number two. Let's assume number one is 31 and number two in this case is what? 6.

So if you divide, you always get what? You get 5. You don't get the floating point value, you just get the integer part of it. So division returns an integer value with no remainder.

We also know about the remainder, or what we call modulus. So, for example, what's 5 modulo 2? That's the remainder of dividing 5 by 2 which is what? 1. OK? What's 7 modulo 4? 3. And so forth. So you guys know about that. Good. Usually the percentage sign is also known as modulus.

Now, looking at the increment and decrement operators, they are also very useful. For example, when you have an age that you want to increment by one, you could write it this way, that's the long way. Or decrement, OK, you can write it this way. But in general we're interested by using the plus plus and minus minus, which means increment or decrement.

Except that we need to be careful how to use them. Again, this states the pre-increment and the post-increment. Let's take a look at this, folks, at this example. Here, I declare i as an integer, initialize it to 6. And then after that, what I do is I'll go ahead and pre-increment i and assign it to j.

The fact that I put in pre-increment, what's going to happen is i first gets incremented and then assigned to j. So which means at the end, i is 7 and j is what? It is 7. Let's now see the post-increment. Again I declare i as an integer and initialize it with 6. But down here, look what I do. I now assign i plus plus to j.

The fact that I put post-increment, what's going to happen here, it assigns first i to j and then increments i. That's why now i is 7 and j is what? 6. So when you do the pre-increment, again in this case, the assignment is done first, then after that, you do the post-increment Got that? OK, good.

We see it also for the decrement, the same concept. So for example here, I declare i as an integer and assign 6 to it. And then down here, I'll go ahead and decrement i first, and then assign it to j. Why? Because it's pre-decrement. So automatically i is 5 and j is 5.

On the other hand, in the next one, what I do is I declare i as an integer and assign 6 to it, but in this case I'll go ahead and assign i to j and then what? And then decrement it. So that's why we need to post-decrement, usually the value of i gets first assigned to j. And then after that you'll decrement i. So that's why j will be having 6 as a value, and i of course becomes 5, because we decremented i. Got that?

So here's an example. In this case, we declared, in our case here, count as a variable type integer, assign 15 to it. We declare a, b, c, d as integers, and then look what we do. We assign count to a, but then with the post-increment, we assign count to b. Then we pre-increment count and assign it to c, then we assign d.

So the question is, when we do a print like that to print a, b, and c, and d, what would be the value of a, just by looking at this?

15.

It would be 15. Why? Because it's a post-increment, right? And then what would be the value of b in this case? 16. What would be the value of c?

17.

17, because we do a pre-increment first and then assign it to c. And what would be the value of d?

17.

17. Good. And you see that here. Right? So here's another example. What I have here, i is initialized to 16, and then here we're printing. What do you think here it's going to be printing?

17.

17. Why? Because we increment. How about this one?

17.

How about this one?

17.

Nope.

18.

18. Got it? Everybody sees that? So let's go ahead and see that. First you do a pre-increment, so that becomes what? 17. And then it gets printed. Then this one here, we're doing a post-increment. So this will get printed first, which is 17, and then increment, which becomes what? 18. And then you print the value of i, which is currently now what? 18. Got that? Good job.

Ah. Now we're going to look at operator precedence. Well, here's an example of the need for the rules of precedence. Again, is the answer in this case 34 or 9? Again, it all depends what you're doing, which one goes first. OK?

So first of all, let's take a look at the rules and then come back and do this example. So first of all, the rules. What the rules of precedence says. Operators within a pair of parentheses will go first. Then after that, increment and decrement operators. Then after that, multiplication and division operators, evaluated from left to right.

Then after that, addition and subtraction operators evaluated from left to right. Again, if standard mathematical operators of the same precedence appear successfully in a statement, then the operators are evaluated from left to right. Right? Let's go in and look at that now.

Now you see, the following example demonstrates the need of the operator precedence. In this example, it is not clear that, again, what the author intended. So the result can actually be evaluated in two ways. Either to 34, when it's evaluated strictly left or right.

Or, again, the actual expression results when it's evaluated again, strictly, in this case, according to the rules, then this is how it's going to look. Well, first, again, in this case, you will have the 5 times 4, that's 20, divided by 2, that's 10, then 25 minus 10 is what? 15. And then minus 10? 5. And then plus 4? And that's how we got 9. Right?

So here is pretty much what we're trying to get at. So your expression will automatically be evaluated with the rules of the precedence. However, you again should use parentheses to provide the structure you intend. If you use the parentheses, then, of course, it will be a lot clearer. Like in this example. Got that? Everybody's following? Good.

Now we're going to take a look at promotion and type casting, which is an important topic in this lesson, and in Java in general. Using the promotion and type casting. Assigning a variable or an expression to another variable can lead to mismatch between the data types of the calculation and the storage location that you are using, in this case, to save the result.

Specifically, what we mean by that is the compiler will either recognize that precision will be lost, and not allow you to compile the program, or the result will be truncated or incorrect. So, to fix this problem, variable types have to be either promoted to a larger size type, or type cast to a smaller type.

Again in this example, we consider this example where, in this case, we declare number one of type integer as a variable and assign 53 to it. That's a 32-bit. We also declare number two as a variable of type integer, assign 47 to it. And then, of course, we declare here a number three as what? A byte.

Now, what's the size of an integer? 32 bits. What's the size of a byte? 8 bits. And then now, what I do is I want to add number one to number two, which, by the way, are integers, and try to save them in number three, which is what? Byte. And of course I'm going to have what? A compiler error.

Now the compiler is screaming at me. You cannot do that. So an example again, in this case, a solution for this is to what? Obviously, in this case, to maybe declare number three as an integer and that fixes the problem. Got that?

And of course, pretty much showing you now a byte is smaller than an integer, but is large enough to actually hold 100 in this case. But again, in this case, we need to worry about such operations if you have different types, and there's a mismatch of types.

Continuing with that, let's look at the concept of promotion. Well, here's what we say, folks. There is automatic promotion, which is what? If you assign a smaller type to a larger type, it's automatically promoted to what? To the larger type, size. And of course, if you assign an integer type to a floating point, it's automatically, in this case, promoted to a float. OK?

For example, here I am assigning 6 to what? 6 is an integer. To a long variable in this case, or a variable of type long. So automatically this 6 is promoted to what? To long. OK? That's typically how we do it again. The promotions include if you assign a smaller type to the larger type, then, of course, it's done. And if you assign an integer type to a floating type, of course, that's done automatically.

Caution. Prior to being assigned to a variable, the result of an equation is placed in a temporary location in memory. The location size is always equal to the size of an integer type, or the size of the largest data type used in the expression or statement. For example, if your equation multiplies two integer types, again the container size will be an integer type or 32 bits.

So if the two values that you are multiplying yield a value that is beyond the scope of an integer, such as, like, in this case, 55,555 times 66,666 and then it gives you all of this big number. And we know that this is too large to fit within 32 bit. So the int, again, value must be again truncated to fit the result into the temporary location in memory.

Of course, this calculation ultimately yields an incorrect answer, because the variable of your answer, in this case, was truncated. To solve this problem, what you need to do is set at least one of the variables in your equation to a long type. If it's a long type, then it's promoted automatically to what?

To a long type. And we know that long integer fits within 64 bits. Everybody is following? Everybody's with me? Good. Let me know if you have any questions, please.

Ah. Looking at type casting. Well, type casting lowers the range of a value, again, quite literally chopping it down to a smaller size. By changing the type to the value, again, in this case, for example, by converting a long integer to an integer, that's typically how we do it.

You do, again, this so that you can actually use methods that accept only certain types of arguments, so that, again, you can go ahead and, in this case, assign values to a variable of smaller data type, so that you can save memory. Again, in this case, we saw a couple of examples in this case.

And the way, by the way, we represent the syntax is identifier and then the target type which is between parentheses, and the value. Here's an example where I declare number one as an integer and initialize it with 53, number two as an integer and initialize it with 47. I declare number three as a byte.

And then, of course, now, we said that this will cause a compiler error. We could actually solve the problem by doing what? By taking number one plus number two and cast it into what? Byte. That's again, in this case, automatically will convert that. Here, there is no loss of data, because 100 still fits within a byte, so that's good. But sometimes if the number is too big, then it gets truncated. Right? Good.

Casting will be very important in Java, folks. You will get to learn about casting in the future too, in the advanced course, and even in the Enterprise Edition of the Java technology. So again here we just showed you the rest of the example that I showed you on the slide.

In addition, by the way, there is a caution here that I want to mention it here is that, use the type casting with caution. For example, if larger numbers, like for number one, number two, were used, the type cast to a byte would truncate part of the data, resulting in an incorrect answer. Remember that. Right? Everybody is following? OK, let me know if you have any questions, folks.

Now looking at type casting, for example. Let's continue with that. Here I declare a variable called myInt of type integer. I also declare a variable, myLong, of type long, and then assigned to it 99 L for, again, the long value. Here what I do is I'll go ahead and take myLong and, of course, cast it to an integer, and then assign it to the variable that I declared here of type integer.

Again here, no data loss, only zeros. And a much larger number would result in a data loss. An example here, just to show you that. So I declare a variable called myInt of type integer, and then I declare a variable called myLong of type long integer, and assign this big long integer to it.

Then after that, I take that myLong and cast it into an integer, and assign it to myInt variable. Of course, the number is chopped. Right? So the number in this case, of course, is chopped. So we've got to be careful with that. Everybody's following, folks? OK.

And by the way, if you type cast a float or a double with a fractional part to an integer, such as an int, all decimal values are lost. However, this method of type casting is sometimes useful if you want to truncate the number down to the whole number. For example, here I want to truncate 51.9 to just 51. Sometimes it's useful to do that. Everybody's following, folks?

Now look at our compiler assignments for integral and floating point data types. Here's again the example of potential problems. I declare a, b, and c as variables of type short. And then I assign 1 to a. So this is automatically promoted to what? To integer, because 1 is an integer. And then 2 to b. b is automatically promoted to what? To an integer.

And then now, even though I declared them here as short, but they changed, by putting these two statements in Java, they automatically changed to what? To integer. Why? Because 1 and 2 are by default treated as integers by the JVM. Everybody's following?

So now I'm in trouble. I'm trying to add what? Two integers and save them into a short. But of course, this one's going to give me a compile error. Everybody sees that? All right. Good. So again, in this case, we need to somehow think about what is it that we need to do to fix that.

So again, example of potential solutions. Declare c as an int in the original declaration in this case, or what? Or type cast a plus b to what? To a short. Everybody sees that? OK, good.

Looking at promoting floats. If an expression contains a float, the entire expression is promoted to float. Again, all literal floating point values are viewed as double by default, unless you specify otherwise through what? F. OK? By using the F next to the value.

Again here we just show you how the example that we went through through the short and then finding the solution. Either declare c as an integer or type cast the addition a plus b to a primitive of type short in this case.

Now, looking at floating point data types and assignments. Here an example of a potential problem. I'm now declaring a float one as a variable of type float and assigning 27 to it. Why do we have a problem here, folks? Why it says compile error? Because we said when we represent a floating number value, it's always treated as what by default?

Double.

Double. So 27.9 is treated as double by the JVM. So now we're trying to assign it to float, and of course it would get what? Automatically promoted. To a double. So now we're trying to assign, in this case, a double to what? To the float. And of course the compiler is automatically complaining here.

Here is another example of potential solution. What we could do is we could put the F to notify the compiler that 27.9 is what? Is a float. We can do that. Or what we could do is we take the 27.9 and type cast it into what? Type float, and then assign it. So that also works. Everybody sees that, folks? OK, good.

And pretty much, we'll also tell you about the whole story here down. So here's an example. I have here a class called what? Person. Inside the class person I have an instance variable called what that I declared? AgeYears, and it's of type what? Integer. And of course I initialize it to 32.

And then I have a method called what? Calculate age, which takes-- does it take any parameters? No. Does it return something? No. Inside, look what I do. I So these are treated what as variables? They are called what?

Local.

Local variables. Thank you. I declare a variable called AgeDays, and of course assign to it the AgeYears, which is this one here, I can read that, 32 times 365. That's still an integer, that's good. On the other hand, I declared the second variable called AgeSeconds, and now it's of type long. And then I multiply what?

AgeYears, which is 32, times 365 times 24, which is a long integer, times 60 times 60. So that's going to be a long integer, but it's good. This fits very nicely because there won't be any complaints because I declared the left side of type what? Long. So I'm good with that. Right?

And then after that I do a print statement on both, again, in this case, to print first the AgeDays, that's the age in days, and then, of course, the second one, the age in seconds. Again, the code example uses principles from this section to calculate a person's age in days and seconds. Everybody understands this example? Yes.

How come you have L only for 24 and not for 60?

Well, one would be enough to promote the whole thing. Good. And we have a quiz here. The quiz says which statement is true? First one is there are eight primitive types built into the Java programming language. Is that true? Yes. And then b. Byte, short, character, long are the four integral primitives that are types in the Java programming language. Again, b is incorrect, it should be byte, short, integer and long.

And then the next one is a Boolean type variable holds true, false, and nil. That's not true. Only true or false. And d, long equal 10 is a valid variable name that conforms to the variable declaration and initialization syntax. That is also, of course, incorrect. Why? Because long is a reserved key word. Right?

And in summary, so what we've done, we identified the uses of variables and defined the syntax for a variable. We listed the eight Java primitives, data types. We looked at declaration, initialization, and using variables and constants according to the Java programming language guidelines and coding standards. We looked at modifying variable values by using operators. We looked at using promotion and type casting.

## 4. Practice 5-1: Declaring Field Variables in a Class - 10m

All right. So after looking at the lesson number 5, where we looked at declaring, initializing, and using variables, we pretty much identified variable use and syntax. We looked at the concept of variable declaration and initialization. We looked at the concept of the primitive data types in Java. There are eight of them.

We looked also at the concept of declaring and initializing several variables in one line of code. We looked at the concept of storing primitives and constant variables. We also looked at some standard mathematical operators. We looked at the concept of increment and decrement. Then we also looked at the concept of promotion and type casting and so forth.

Let's go ahead right now and take a look at the practices for this lesson 5. Well, the first practice, which is 5-1, says declaring field variables in a class. And in this case, we create a class containing several fields. We declare the fields, initialize them, and then test the class by running the customer test program.

So of course, in this case, we assume that the customer test java source file appears in the practice folder for this lesson. If we just switch to NetBeans we'll go ahead and see that. OK, so obviously it's there, which is this one here. OK?

And of course, the task is we close any open projects in NetBeans, and of course, in the project window, where I click the project and then name and of course select close from the Context menu if there's anyone that is of course still open. And they want us to create a new project from existing Java source using the values that you see here on the table, where in terms of Step A, I choose Project Step where the category in these case is Java. The project is Java Project with Existing Sources.

And Step B, Name and the Location step would be the Practice 0-5-- that's the name of the project-- and then the existing source step that we are, in this case, adding would be d://les05 for Lesson 5, and of course, Step D, the Properties windows we set the source binary format property to JDK7. And we've done this earlier in some of the previous practices.

So again, looking at the solution, the project window, should now again in this case should show for Java source a file again beneath the default package. And that would be the customer test, the order test, the person test, and of course the temperature test. So the test classes are given to us.

And the first thing they want us to create a new Java class-- and again, in this case, just the steps. This table specify the steps where first of all, you go-- Step A would be going through the Menu, and we choose a File and then you go to New File. Step B, you go ahead and in this case, a New File window will open, and from it, you choose Category Java. And the file top is Java Class. Click Next. And then you get into the next, in this case, step where you pretty much specify the class name and click Finish.

So in NetBeans, these would look like Open, again, a new, in this case, obviously they want us to-- we can actually-- we have it a [? couple ?], so we cam actually right click here and click New, and then Java class, and from it again, specify the name of the class. And then of course at that time, we specify the package when it's going to, in this case, would be the default package. And then we click Finish, and of course it appears.

And continuing with the steps, the next thing is, again, with have the customer dot Java open for editing. Now what they want us to do is add, in this case, a bunch of field variables, or instance variables. One is a customer ID of type integer. And again, the default is your choice. And the status which is those character of type character. Again, you specify your choice. They suggest either capital N for New or capital O for Old.

And of course, the third instance variable is called the total purchases, and it's of type double. And the initialization here or the default value would be 0.0. Again, the syntax would be they're showing you in the Step A, the syntax and how it would look, the modifier which is public. The type could be int character double, or of course, the variable and the initial default value.

And of course, here we give you also some assumption that we assume that all fields are public. Again, this public-- right now we're specifying the fields are public. But then later on, you will see that we will change our opinion in later lessons. And you will see that this public is a bad idea. And we'll take a look at. That's of course when we discuss encapsulation.

And of course, they give you also a hint on how a solution would look like. And then they want us to add-- this is again one example but then we do it for the status and for the total purchases too. And then here they said add the method called Display Customer Information. And of course, this will contain the system dot print dot LN. And of course this would print the information about the customer.

So of course it would look like something like this, where we, for example, print here customer ID. But we don't have to actually-- we can add those. So system.out.println to print the status and to print of course the total purchases. So we save that, again, and then, of course, after that, we'll go ahead and run of course the customer test. That's what they want us to do. And of course we should be able to find similar output to this one.

Let's go ahead and look at that in NetBeans. So here's the customer class. As you see, we got a public class customer. And as you see, this is a class that does not have a main method.

So here's the instance variables-- on line 12, 13, 14-- we see the instance variables. The first one is customer ID of time integer. And we initialize it to 0. Can we declare that as a public, which means it could be accessed from outside, and then of course the status which is a character, and we initialized it with the character capital N.

And then the next one which is the total purchases, which is, of course, of type double here. And we initialize it with 0.0. Plus, they asked us to develop a code, a display customer info method, that of course takes no arguments-- no arguments, of course, returns void. It returns nothing.

And here, we add the system.out.println to print, of course, in this case, the customer ID, the status, and the total purchases. And if you take a look here, we also made it a little bit friendly, in the sense that we see that in this case we put a message here that will be printed out, which is customer ID: and then you print the value of the customer ID, which by the way, is going to be 0 in this case.

And then the second one status: and then the status which would be capital N. And then the third one, which is purchases: which would be in this case 0.0.

Let's go ahead and now of course run the customer test. In the customer test, we have the main method. We all know that the JVM always start running a class from the main method. And then in this case, in the line 5 here, that statement, we'll go ahead and first of all on the left side, we declare a reference or reference variable to an instance of type customer, called My Customer.

And then we initialize with the new instance of the customer on the right side. Of course, the assignment operator here shows that now My Customer will be a reference for the instance, a new instance of type customer.

And then after that, on line 7, we invoke the display customer information on, of course, the reference variable. And of course, this will go ahead and execute the display customer info method. Let's go ahead and run that. And as you see, this will give us the output that is expected.

So that pretty much sums up the practice number 1 of lesson 5.

## 5. Practice 5-2: Using Operators and Performing Type Casting to Prevent Data Loss - 19m

So now let's go ahead and get into practice 2, which is 5-2, of lesson 5. In this practice, they're asking us to use operators and perform typecasting to prevent data loss. In these case, the assumptions that we already have, the PersonTest.java class, the Test.java class, and the TemperatureTest.java class. Most probably, just by reading this, ladies and gentlemen, it looks like we're going to end up creating a person class, an Order class, and of course, a temperature class.

Now let's go ahead and start with [UNINTELLIGIBLE] the first one, which it says, calculating age using operators. That most probably will be related to the class Person. So in this case, they say, go ahead and create a new class called Person. And then of course go into a Select File, New File from the menu to create a new Java class called Person.

So of course we already have to tried this a few times-- let's go ahead and try that again. New file, and then here you the click on Java, and you click on Java class, and then of course next is the name of the Java class, and of course in this case, the package is here. You see a warning that says "highly recommended" that you do not place Java classes in the default package Y. Because later on, when you learn the advanced Java class, and then get into the Enterprise Edition of the Java technology, you will see that in an application, there would be lots of classes, and what we do is we separate them into different packages.

And after that, click Finish, and then we're good to go. It turned out that we already have it. And by the way, you can also create the class from here, too, by right-clicking the project, and say, OK, New, and then Java class directly, and that will give you the same exact thing. Again, these are just shortcuts that we're trying to show you in this case.

Continuing with the practice, so they want us to create this Person class. And then they say, using the editor, add the bunch of fields here to store are in the years, days, minutes, seconds, and milliseconds. And if you take a look here, we actually provide that A table to guide you to do that. The first one, years, which is an integer, makes sense, because somebody's age can be-- what's the maximum? 100 years, or over 100 years? That's typically the maximum-- maybe a little bit more over 100. That's the maximum age that a human being can have. And then of course later, we can specify in days-- it still maybe fits within an integer, as you know, when we learn in the class that an integer fits within 32 bits.

But on the other hand, if you want to specify the age of a person in minutes or seconds and milliseconds, that would be a bigger number, or a bigger integer, and that's why we decided to declare these as long, to be just on the safe side. This way we know that the number fits, because I know we know that the long integer fits within 64 bits.

And again, they give you a hint here. You can declare multiple variables of the same type in one line, separated by a comma, and so forth.

Continuing again with the concepts here, then they ask us to create a method called "calculate age." And this method will calculate the age in days, minutes, seconds, and milliseconds, again, assigning the value the relevant fields that you use in these case. The days will be representing the number of age in days, seconds, the age in seconds, and minutes, and so forth.

And they also here gave us the idea of how to order the expression, how to find out the age of a person in days. We know that if you know the number of years, we know that every year has 365 days, so that pretty much if we multiply the number of years by 365, that gets us, of course, in this case, the age in days.

The same thing with seconds. Number of days, and one day has 24 hours, times, in this case, 60-- that's, in this case, specifying 60 minutes in an hour, and then the next 60, specifying 60 seconds in a minute. And obviously here, if you wanted the age in minutes, we just multiply the age in seconds, or rather, divide the age in seconds by 60, and that gets us the age in minutes. And if we want to get the age in milliseconds, we just multiply-- we know that 1 second contains 1,000 milliseconds. That's why we want to multiply seconds by 1,000. And that gets us the age in milliseconds.

So after you do all of that-- and then they give you an example, how you specify, and how you're going to look at the age, and how the output would be. And of course here, we see what the method will look like.

So after that, they say, save it, and of course compile and test it. And they say test it with different, again, values. Let's go ahead and go back to NetBeans and open that customer, that Person class. And here it is.

So you see that it is a class that has, in this case, these instance variables. They're all of type primitives. First one is age is years, and we initialize it to one. And then the integer, the second one, age in days. And then the third one, you see how, because age minutes, age seconds, and age milliseconds, they are all of type long, we can actually declare them in one line separated by commas.

And then here's the, again, the calculate age that pretty much calculates, in this case, the age in days, age in seconds, age in minutes, age in milliseconds. And of course we save them all in these variables-- age days, age seconds, age minutes, and age milliseconds-- and then we'll use print and then a statement to print them out.

So of course, if we now run, and we were given the PersonTest. In the PersonTest it has a main method where in the first, we create a new instance of the person referenced by the reference variable called My Person, and then we invoke the Calculate Age method on the reference variable My Person, and that should of course execute the Calculate Age.

Let's go ahead and do that. And as you see, here is pretty much-- again, we gave as an example that that would be the number of years which is, again, in this case, one. So that gives us the number, the age of somebody-- if they are again, one year old, they are 365 days old, and so forth.

What if we want to change this and then make it, for example, 20? So again, I save, and you know when I save the file, it means, of course, it automatically compiles also the files for you. Let's go ahead and run it now, run the Test class. And as you see here, that gives us the age of a person who is 20 years old. In number of days, it is 7,300 days, and then, of course, you see the age in minutes, seconds, and milliseconds.

Continuing with this practice 2, what they want us to do now-- and maybe again, in this case, a good idea that I, again, close person test and person-- of course, close the output, too-- and then we'll go ahead now and continue with the practice.

Now they want us to use the concept of casting to prevent data loss. And in this case, they want us to create a new class called Order. And in this class, we have a bunch of fields that we are going to create for Instance Variable. The first one is Order Value of type Long. We initialize it to 0 long. And then the second one, the variable name is item quantity of time integer, and we initialize it with this number.

By the way, if you take a look here, ladies and gentlemen, we are actually using the underscore to make it readable. In this case, for example, it's $10 million. And that is acceptable why? Because this is a new feature in the Java SE 7. And we discussed this in the lecture.

The third one we create another variable called Item Price of type Integer, and of course we initialize it, in this case, with 555_500, which is 555,500. So it would also tell you here the underscore used to initialize the int value improves the readability of your code. Then we said that this is a new feature in the Java SE 7.

And then after that, we create a Calculate Total Method, and that calculates the total order value by, in this case, multiplying the item quantity by the item price, and then print it out. So this is, again, now we're pretty much able, based on what we've done so far, to actually write it, and it should look like this.

And if you take a look here, ladies and gentlemen, at this statement, which is an interesting statement, you see that we're multiplying item quantity times items price, and since item quantity and item price are bigger numbers, so we know they're both of type integer, you see how we use the cast here. We're casting, again, this item quantity of type long so that the multiplication in this case will fit within-- if it's a bigger number, we're trying to say here that it's going to fit within 64 bits, and the number will not be truncated.

Of course, after that, we save the [UNINTELLIGIBLE] Java, and we test this. Now go ahead and go back to NetBeans and take a look at that.

So here's my Order class. And if you take a look here, pretty much we did exactly what they asked us to do where we declared the instance variables here order value, and we initialize it to 0 in long. By the way, it's of type long. And then a couple of variables of type integer, one representing the item quantity initialized to 10 million, and the other one, item price, initialized to 555,500.

And then what they specify here, the Calculate Total Method, that of course in this case, you see how to make sure that-- because remember, the item quantity and the item price are both of type Integer, but they're both bigger numbers if we multiply these two numbers In this case, of course, the number will not fit within 32 bits. That's why we made sure, in this case, to cast the item quantity of type long, and then multiplying by the-- which means now the right side will be cast into a long integer. And of course we are signing it all to the order value, which is already of type long. And then after that, we'll print it out.

So let's go ahead now and, again, take a look at order test. And the order test is kind of similar to what we've seen as a test classes that we've seen earlier. For example, the customer, and for other classes that we created, [UNINTELLIGIBLE] and so forth.

In general, a class test always has the main method, and in it, we create a new instance of the class that we want to test. In this case, the class that we wanted to test is the class order, so we create an instance of Order, and we initialize it, again, referenced by the reference variable My Order, initialized by the new instance of Order. And then after that, we'll invoke the Calculate Total method on the My Order reference variable, and of course, what it's going to do-- it's going to execute the method in the Order class. Let's go ahead and do that.

And of course, this will give us as the Order total to be all of this big number. And this again, in this case, is exactly the result that we're supposed to have, because in this case, we make sure to handle the casting, and in this case, we are in good shape.

And continuing with the same-- again, let me just go back and do a little bit of cleaning here, where I've done with this, I'll go ahead and close it, I'm done with this one also, I'll go out and close it, and then I'm done with the output, and I'll go ahead and close it.

Now next, what we want to do is we want to continue. And in this case, they want us to create a temperature program. So in this case, we create a new Java class called Temperature, and add a member field to the Temperature class that stores the temperature in Fahrenheit, declare the field variable in with appropriate types such as Int, float or double or whatever, and then after that, they want us to create a Calculate Celcius method. And this Calculate Celcius method will convert the temperature, a Fahrenheit temperature to Celsius. In general, by the way, the formula, the way you do that, is we subtract 32 from the Fahrenheit temperature, multiply it by 5, and divide it by 9. And that, of course, will convert it into Celsius.

We also give you a hint here. We say that the rules of precedents are listed here for your convenience. Operators within a pair of parentheses in increment and decrement operators, then multiplication and division operators evaluated from left to right, and addition and subtraction operators evaluated left to right. By the way, we already covered this in the lesson.

And then, of course, just by reading that, in this case, the class would look like this, where we declare a temperature, a Fahrenheit temp, a variable of type float, and we initialize it, in this case, with 78.9 Fahrenheit.

This is actually a very nice temperature, very comfortable. Here in the United States, we get this type of temperature, for example, in San Diego. San Diego is a very, very nice city to live in, because you get this friendly temperature that, of course, is always there, around the whole year.

And then after that, we have a method called Calculate Celsius. And what we do here, we try to, again, in this case, compute the Fahrenheit temperature, convert it into Celsius, and then, of course, print it out. What we've done, is we've passed the whole expression-- see, we can do that, folks. We can pass the whole expression here into the print LM.

So in this case, what happened is that first, these parentheses are from here all the way to here. This will, again, be computed in this case here with Fahrenheit temperature minus 32, and then we multiply by 5 and divide by 9.

Of course, we'll go ahead and compile test it. Let's go ahead and see that in NetBeans. And we already created that. Again, by now, we already know how to create a new class-- new file, and then Java, and then Java class, and then Next, and then the name and so forth. We already know about that.

So let's go ahead and look at this temperature class. And as you see here, here is the class. And of course, as you see, we declare an distance variable called Fahrenheit temp, and it's of type float, and we initialize it with 78.95 Fahrenheit, and then after that, we create a method called Calculate Celsius. And what it does-- actually, we use the formula says that we need to subtract 32 from the Fahrenheit temperature, multiply by 5, divide by 9, and that, of course, pretty much converts it into the Celsius.

So just out of curiosity, let's go ahead and test this and see, what is 78.9 in Fahrenheit? As you know, here in the United States, we make use of Fahrenheit for a unit to measure the temperature. Of course, in Europe and in Asia, they use Celsius. And for us, we can go ahead and convert this back and forth without any problem.

Let's go ahead and do that. And for that, we have a TemperatureTest. And here's a TemperatureTest that has a main method. And as you see, all the time, we create a new instance of the class that we wanted to-- in this case, test-- and this would be the temperature. So we'll go ahead and create a reference variable to an instance of type Temperature, and it's called My Temperature. And then we initialize it with a new instance of the Temperature, and then after that, we invoke the Calculate Celsius method on the reference variable called My Temperature.

And of course, if we execute this-- in this case, you would see how we print the temperature now in Celsius. You turn out that 78.9 Fahrenheit is equivalent to 26.05 Celsius.

And that pretty much ends practice 2 for lesson 5. Thank you.
