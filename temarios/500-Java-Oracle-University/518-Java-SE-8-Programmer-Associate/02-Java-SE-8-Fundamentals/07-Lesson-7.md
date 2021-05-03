# 7: Lesson 7: Manipulating and Formatting the Data in Your Program

1. Lesson 7: Manipulating and Formatting the Data in Your Program, Part 1 - 16m
2. Lesson 7: Manipulating and Formatting the Data in Your Program, Part 2 - 6m
3. Lesson 7: Manipulating and Formatting the Data in Your Program, Part 3 - 36m
4. Lesson 7: Manipulating and Formatting the Data in Your Program, Part 4 - 4m
5. Practices for Lesson 7 - 14m
6. Skill Check: Manipulating and Formatting the Data in Your Program - Score 80% or higher to pass


## 1. Lesson 7: Manipulating and Formatting the Data in Your Program, Part 1 - 16m

This is Lesson 7, Manipulating and Formatting the Data in Your Program. What we're going to talk about in this lesson is we're going to go more in depth on to the String class. We'll talk about the JDK documentation. And that's where you can go for more information on the classes that Java provides to you, including the String class. There's also StringBuilder, which is an alternative to Strings. We'll also explain what a constant is, and the difference between promoting and casting variables.

So yeah, let's get started talking about the String class. So yes, strings, there is a String class. And that means strings, unlike integers, unlike doubles, unlike floats, unlike Booleans, strings are objects, although they are extantiated similarly to a primitive. And here's the syntax for doing that.

You could also instantiate a string using the new keyword, like you would with any other object, although this isn't recommended, because it's not the most efficient thing to do with memory. So if you're tempted to instantiate a string like you would any other object, don't do it.

OK. What else? Strings are immutable. So what that means is the way strings are handled in memory in Java is a little different. Even if you concatenate it using the plus operator or there's a concat method, they're treated-- I'll show you how this is done, actually.

So here we have a string we're instantiating, myString. And its value is Hello. When we do this, what we have is in the stack memory we don't have the literal value Hello. All we have is a memory location. And it's pointing to an address in memory, in the heap memory. And that's where we have our value Hello. That's where that's stored.

If we were to concat or change the value of this variable, what we're actually doing is creating that string in a totally different location in memory. The original string, the original Hello, that goes away. The original memory location, we don't care about that any more.

Instead we have a new location in memory here that's created, so we actually have a completely new object. So this is the case when you use dot concat. It's the case when you use plus.

This is Java trying to be smart about how it allocates memory in terms of strings. Strings, Java puts a lot of effort or a lot of consideration into how strings are handled. They're pretty important objects in Java, although Java-- there are many different types of objects, though, that Java provides for you. The string has-- there's a particular emphasis or focus on strings.

But yeah, like any other kind of object, strings are going to have methods. They're also going to have fields. And these methods, they'll do what's called returning a value. And this could be-- in this case, we'll look at how to return a primitive value, how to return an integer.

So here we have our string Hello World in this line. And we're going to call a method. Here's our reference variable. We're going to call a method on this reference variable. So we'll type in dot length. And what that does is it gets the length of the string.

So let's see. The length of this would be 0, 1, 2-- oh, wait. Don't start with 0. It's 1, 2, 3, 4, 5, 6 for the space, 7, 8, 9, 10, 11. OK. So here this is going to end up returning a value of 11.

So this is just like we're going to write int StringLength equals 11. Same thing. That's what it means to return a value. Here this is just 11 right here.

Likewise, we can also have methods in the String class that return objects instead of primitives, object in this case being another string, if you look at the examples below. So here in this line, we're using the trim method, so we typed dot trim. And what that's actually going to do is it's going to chop off-- the first character here, we're going to chop off this space. And we're going to chop off the end space.

So we're actually going to set the value of our greet variable. It's just like we're saying String greet equals HOW. OK. Moving on to the-- actually, what I would do here, though, just to make it a little more clear, I would add in some parentheses, just to help it look a little more organized. You don't have to do it. I'd prefer to do it, though.

OK. If you look at the next line here, what we're doing is we're using the toLowerCase. And actually, because we don't have any parentheses here, the toLowerCase is only being applied to the DY. So it's just like we're saying instead Stringlc equals greet plus lowercase d, lowercase y, which actually means lc is going to equal-- so we have HOW-- H-O-W-- and then little d, little y.

Yeah. So I recommend putting in parentheses, like we do in the example below. That way, anything inside the parentheses is going to have this method applied to it. So instead, if you look at this line, what we're actually doing is it's like we're saying Stringlc equals h-o-w-d-y, all lowercase.

Moving on to the Java API, this is where you can go to get additional information on all of the classes that Java provides for you. It provides a description of what the Java classes do. And this includes constructors, methods, and fields. It's highly hyperlinked. It's highly hyperlinked, which means it shows the interconnections between classes to facilitate lookup.

What does that mean? It means it's just like Wikipedia. So say you come across something you think is interesting, you want to get more information on it, there are links throughout the documentation where you can just click and say, ooh, I want to figure out more about this. Let's go there. Ooh. This looks interesting. Let's go there. So that's all that that means.

And it's available to you from this address. Actually, I'll pull that up for you right now and we'll take a look at the API. Oh, I didn't define API. Right. So API is Application Programming Interface.

OK. So here we have-- here's the Java API. Right here if you look at this top corner, you have all the packages that are available in Java, or that Java provides to you. And the classes are organized by package, so within each package, you're going to find particular classes that Java provides to you.

So let's scroll down actually here to look at the individual classes. I want to find String. We can get more information on the String class. Almost there. Sure is a lot of stuff.

OK. String. OK. Here we have the documentation on the String class. We have a brief overview of the String class. We have some examples of how to go about using the String class.

We also-- if we scroll down, it'll show us the fields that are available, the constructors. Constructors are something that we'll talk about in an upcoming lesson. And we have the methods. These are all the methods that are available to us.

Alternatively, what you could actually do, what I like to do in NetBeans is if you type the dot operator-- well, first you declare a variable, then you type the dot. And then it gives you a list of all the possible methods, all the possible fields that you could use with that object type. And the reason why that works is because-- look here, it's referencing the documentation. It's the same information, so either way, I find it tremendously useful.

So yeah, if you take a look here, you have the methods summaries. If you look at the charAt method, what this does is we have our method named charAt. And it returns the character value at the specified index. Sometimes when you're working with methods, you need to provide additional information. We call this an argument. So this method takes one argument. It's an integer-type argument of the index.

You need to specify what index you want to look up, what index you want to provide information on which character should I get? Which indice should I look at? That's what it's specifying. And it's returning a character value, which means it could be a single code character, an a, b, c, all of our friends from the alphabet.

All right. Let's keep going. All right. Let's say we want even more information on the charAt method, so let's drill down, get a little more specific.

So this is where you can find an overview. We have a little summary. We have details on the parameters, details on what's returned from the method. This comes in very handy.

Let's get back to the presentation. The reason why I bring this up actually is because in an upcoming exercise, they're going to encourage you to consult the documentation, because since there's so much that Java provides to you, the documentation is so helpful. If you're thinking, hmm, is there a way to do this or that already, maybe there is and the documentation will help you pinpoint a method that may be appropriate for whatever it is that you're trying to do. Or you could try writing your own methods. But no, let's just work with what Java provides for right now.

OK. Let's keep going. Let's examine a couple other methods here. So say we have for instance a string that's a phone number. And we want to actually turn this into an integer.

In order to do that, we need to take out some of the characters that aren't integers, like the little dashes here. Dashes aren't part of numbers, so we've got to take that out. And the first step to doing that is identifying the index where these dashes occur, so that's what Line 2 starts to do. We're using indexOf, this method that belongs to the String class, to find the first occurrence of the dash in this string, which is going to be right here.

So what we're actually going to print out is going to be-- let's see. We have 0, 1, 2, 3. OK. So the value of idx1 is going to be equal to 3. And in our print statement here in Line 3, we're just printing out index of first dash is going to be 3. OK. And then we do that again, because we've got to find the second dash.

And here's something that we actually call overloading a method. You may find the same method name, indexOf, may take a different number of arguments. So here we only have one argument up above, which is a character that we want to find. Here we have two arguments. We have the character we want to find and we have an index.

So what this is actually saying is, find me the index of the dash character after this particular index. Actually, it's going to be 3 plus 1, so 4, so it's going to be from 4 onward. Yeah. And so that'll assure that we're actually finding the second dash and not the first. So that would be-- let's see. We have 3, 4, 5, 6, 7. Wait, is that right? 3, 4, 5, 6, 7. Yeah. 7.

So the value of this variable, idx2, is going to be 7. So if you look at Line 7, it's like we're just printing out second dash index is 7. So yeah, this is actually the first step in the process.

The next thing we need to do is to isolate what are called substrings, which are just little pieces of an overall string. And now that we know where the dashes are, those are going to be like our bounds. We know where we want to look. So we need to actually get this substring here, this one here, and then this one here, three separate substrings. And we know where we need to not look, where we need to be careful not to get their characters from, because we don't want the dashes.

And so right now I'd like you to experiment using these methods and consulting the documentation. Try playing around with indexOf and with substring in this practice.

## 2. Lesson 7: Manipulating and Formatting the Data in Your Program, Part 2 - 6m

Lesson 8 is on creating and using methods. In this lesson, we're going to talk about how to instantiate a class and call the methods on the object. We're going to talk about the purpose of the constructor method. I've teased about constructors. I'll go more in-depth into them in this lesson.

We'll talk about creating methods-- creating your own methods-- that take arguments and then return a value. We'll talk about the static keyword and how static variables are different than instance variables. We'll also talk about how to overload a method. It's going to blow, it's overloaded.

All right. So let's get started with using methods and constructors. If you were to go about writing your own method, this is the basic layout, how it would look. So you have here, you have public void display. Void is the return type. Display is the name of the method.

We have some parentheses here, open and close, which means that there's no arguments that are being passed in. And then we have our curly braces here and here. Everything within these curly braces, this is the actual work of the method. This is what the method is going to be doing. I'll talk a little bit more-- I'll go more in depth into all of the new-- I threw out a lot of new terminology, so I'll go more into depth about what each of those mean.

If you want to call a method from a different class, here's the syntax for that. Take a look at line 3. What we end up doing here is we're creating an instance of a shirt. We're calling it myShirt. Then on line 4, we take that reference variable, myShirt, the reference variable, and we follow that with a dot operator. That allows us to call any of the methods or fields that are accessible in that method.

And we happen to be doing, in this case, display. And that's going to be calling what we saw in the previous slide, the display method. And this is what the output will look like. OK. And we have little quotations here. So we have the short description plus the actual description.

Take a look at this line, item description. Oh, actually, this here should actually say item. But yeah, item description, description required, color, color U for the next line. Is that what the next line says? Yeah, color code, and then U would be the color code.

And then shirt price. Do we have a line for shirt price? Item price, OK, yeah. So this should actually be changed to item. But I hope you guys get the idea that it's just rough going back, referencing this method that we wrote earlier.

Just to get a sense of what's going on here, the previous example in the shopping cart class calls the display method on the shared object from within the main method. The main method is referred to as the calling method because it is invoking or calling another method to do some work.

Much like the illustration here, the caller's saying, worker, do something for me. What can he do? Bring me better food. I should have said return me better food. That'd be funny. I'll explain why in a minute.

OK, so let's take a look at the worker now. Conversely, the display method is referred to as the worker method because it's doing work for the main method. So it's going to do the work. So what's he going to say? Yes, sir, I'll do your work.

I also teased about a constructor method. A constructor method is a special kind of method that's invoked when you create an object instance. And the thing is we've been using constructors all along. This is what it looks like here, a constructor call.

It's purpose is to instantiate an object of the class and store the reference in a reference variable. The reference variable being here, myShirt. Another very common use for a constructor is that it's used to assign the initial values of fields. And so I'll show that to you in the next slide.

All right. So here we have our Shirt class. And we've written here our constructor method. The syntax for a constructor method are a little different. First you write Public Shirt. There is no return type, so the void that you see down here for display, there won't be any of that. So it's just public and then shirt.

It has to be the same-- the name of the constructor method has to be the same as the class that you're writing it in. So our shirt is called class, our constructor method has to be called class. Then we have parentheses, curly brace, then we have our closing curly brace. And everything within these two curly braces, this is what's going to be our constructor.

And inside the constructor, what we're doing is we're setting the values of our fields. Our fields are here. We have description, color code, and price. What are we doing in the constructor method? We're setting the value of description, color code, and price. That's a very common use case.

The way this is executed is-- so Java is going to first look at your main method. The main method's starting up here. Look at line number 1. So we start line 1. We go to line 2. We're creating a new shirt. So then after we do that, our code jumps all the way down here to line 8. Then we execute 9, 10, 11, 12. That's the end of our method. And then we go back to our main method.

You're also allowed to call other methods from the constructor. If you take a look here inside of the blue box, you're finding that the display method is also called within the constructor. And there's two ways of doing this. The first way to do it is just to call display, then parentheses, semi-colon. Or you could type this.display.

"This" is another important keyword in Java. It refers to the current object. So the current object is just going to be-- what is it? Well, it's an instance of the Shirt class. So actually, so say we're outside of the Shirt class in the main method. We'll end up instantiating a Shirt, so that will look like Shirt-- let's call it Shirt S1 equals new shirt.

If we wanted to call the display method, we'd do S1.display. And you can't call this, because when you called this, you're actually inside of the main method. But what you can do is, if you're inside of the Shirt class, this refers to what? The current shirt, the current object. So that's when it's OK to do this.display.

You could also access fields. Like if you're outside of the Shirt class, you'd have to have your reference variable, S1.price to access the field. But now that we're inside of the Shirt class right here, we're able to use this, which is this.price, referring to the current object.

Let's take a closer look now at examining method arguments and return values. I had mentioned before that methods are allowed to return values, and that you provide arguments to methods. I'll go into more detail about what that means. So a little bit about terminology.

An argument is a value that is passed during a method call. So if you look at this line of code right here, we have a couple of arguments that we're passing to the calculate method. We're passing in our integer 3. We're passing in a variable, which is actually 2.0 from up here.

So we pass those along to our method. A parameter, on the other hand, is a variable defined in the method declaration. So here, this is where we're writing what-- well, say we have some sort of Calculator class. Now we have a calc method within that Calculator class. It's going to be taking two arguments. And in order to say, what are we going to do with these arguments, that's when you use parameters.

These are just variables that are going to-- they stand in for the numbers that are going to be passed in later. And you use zeros to say, what do I do with these numbers? I've got to calculate them somehow. And so x and y, they are just referencing the numbers that you're going to be working with. In this case, we're dividing right here. And that's fine. So all we're doing here is we're taking 3, we're taking 2.0, we're passing those down.

Method parameter examples-- you can write methods to have any number of parameters. You could have zero parameters inside the parentheses. You could have one parameter. Those are also found in parentheses. It's a variable that you're defining right here into x. You could have two, shown in the calculate2 method. You could have 3. You could have 4. You could have any number.

Similarly, methods can have whatever kind of return type you want. Variables can have-- so for instance, if you look at a variable, variables can have any kind of value you want. A variable can be-- I'm sorry. There are many types of variables. You could have an int type variable. You could have a double type variable. You could have a Boolean variable. You could have a variable, a reference variable, for a shirt object.

Likewise, you can write methods that return will these values. So you could write a method to return an int. You could write a method to return a double, return a Boolean, return a shirt object, or return maybe a string object. Yep, there's a string object.

So how do you go about writing a method to return a particular value? What you need to do is include the keyword return. As long as it's not a void. Void methods don't return anything. They don't need the return keyword. Any other kind of method that you want to write, you need to include the return keyword.

So what does this look like? If you look at the first example here, this is our void type-- public void printString. All we're doing is printing something. We're not returning any kind of value. Returning a value occurs in the next example.

So say you want to return a string. We write, at the very end of our method, returnString. And by the way, this has to be the last line. Well, not necessarily. But it's often the last line in your method, because when you write return, it means OK, go back to whatever was calling you. So if you have any kind of code after this, it's probably not going to get executed.

All right. Looking at the third example, public int sum, we have a method of int type. And that means we have to return int value. So all we're doing here is adding two integers. We can do that. That works.

Likewise, example four, we have our Boolean. isGreater is a Boolean type method. And it's going to return a Boolean. Is x greater than y? That could be true, that could be false. That's a Boolean. So that works.

So the following code examples produced equivalent results. If you look at the first example, first example up here, what we're doing is we're declaring a couple of integers. Then we're adding them. We're storing that result in the result variable. And then we're printing it.

If you want to take this work right here of adding two variables, input that in a method, we can do that. So down below, we've written what we call the sum method. And all we're doing here is adding a couple of variables. It's the same work. And then we're returning it.

So what does this look like in terms of the execution of the program? I'll show you a little animation to help you visualize that. So we start here with the main method. Then we go to the next line. We create a couple of variables, int num1. Set the value to 1. int num2, set the value to 2.

Move on to the next line again. We're going to create a variable result. And we want the value of result to be the sum of num1 and num2. So what happens if we run the sum method on num1, num2? At this point, our program jumps down.

Oh wait, sorry. We're passing in the values 1, we're passing in the values 2. And then at this point, our program jumps down. We jump down to where our method is located. So the arguments 1 and 2, those now become the values of the parameters x and y.

Then moving on to the next line, we have x plus y, or 1 plus 2. What does that equal? It equals 3. And then we take that 3, and then we return it. We pass it back to our original line that we were at, original line being up here.

And it's just like we're writing int result equals 3. So then the value of result becomes 3. And our last line of code, we print the result. We end up printing 3.

So here's another illustration to just help try and get the point across. Step one in the process is you pass a value from the caller method to a worker method. Then the code jumps to where that method is located. And then it starts executing, line by line, that method. That's step two.

The value is received by the worker method, and the worker method is going to start doing work. In the previous example, it was calculating. But you could write it to be whatever you want. OK, step three, the value is returned to the caller method. So we found out before, oh, hey, it was 3. 2 plus-- what'd it say, 2 plus 1? Yeah, 2 plus 1.

Oh, cut. I goofed that up. I should have gone back. OK. Sorry, I have to redo this one.

So pick up slide 8-16?

Yeah.

Here's another diagram just to help get the point across even further. If you look at step one, what's happening is the value is passed in from the caller method to the worker method. The values that we're passing in are 1 and 2 from the previous example. Our code then jumps to wherever our method is written.

This is the worker method. It's going to receive the values and go line by line, do its work. And this work happens to be adding 1 plus 2. That brings us to step three, where the value is returned. 1 plus 2 is 3. We return 3. And then we go right back to the same line we were at before.

So here's another example. If you take a look here at line 4, what's happening is we have an instance of a customer, and the reference variable is cust. And then we call the method isNewCustomer. So our execution jumps down from this four to that line 4, and we run the method isNewCustomer.

And then what we're going to return is a Boolean, because we've declared our method to be a Boolean type. So is it new? Well, that method gets returned and the code keeps executing. So let's say, for instance, that it is true. Our code then goes to line 5, to line 6.

And so we're calling the sendEmail method of the Customer class on our cust instance. So then our execution, again, goes from here, goes to seven, and we're just going to run this method. Now, this is actually a void method, which means there is no return statement. All we're doing is sending an email.

We didn't actually write the code for this, though, so we just have a comment for sending email. But this is where you would write it. And there's no need to return any value. And so once that's done, our execution, it just goes right back to line 6, and we resume the rest of the program here. Go for 7, 8, if there was a 9, if there was a 10, then we just go down like that and continue.

One of the biggest advantages of using methods is that it prevents you from repeating yourself. So we've done a lot of similar work here. If you look at these lines, 7 to 9, if you look at lines 11 to 13 here and here, it's a lot of the same work. We're setting the description and we're setting the color code, we're setting the price for all of our shirts.

So there is a principle in Java called-- or in programming in general-- D-R-Y, dry, which means Don't Repeat Yourself. Don't repeat yourself. I don't repeat myself. The reason why it can be problematic to repeat yourself like this is, say we want to add in a fourth field you want to adjust. If we have a million objects, we'll have to add that in a million times. And it's just not practical to do that.

So instead, use methods to your advantage. So this is what our code will look like if we used methods instead. All that work that we repeat, it can be stored within a method. So this logic is just done once. Once right here.

If you look at line 7, what we're doing is we have shirt01, and we're setting the fields. And then we have our arguments of what we want that to be. We have the description. For a Sailor kind of shift, color code B for blue, price is 30. So we're passing this here. The parameter desc becomes Sailor. The parameter color becomes blue. 30 for the price.

We use the rest of this method to set the values of what we want our fields to be. We call-- remember the keyword "this" references the current object. So this.description, we're saying the value of description. this.colorCode, we're setting the value of the color code. this.price, we're setting the price.

Actually, if you take a look at price, we have a couple of prices going on here. So that's why this keyword becomes really important. We have the price here. This is our parameter price. But we also have the field price. So which one are we talking about below?

So that's why we use the this keyword. If you use this, it refers to the field of the current object. Without this, then you're referring to the parameter. It's also very helpful that NetBeans color codes this for you.

Although, what would be even better than trying to do this, if you wanted to save even more space, because right now we are using eight lines, or however many objects we want to have, we're having twice as many lines. We're doing work once to create the object. And then we're doing work again to set the fields.

Wouldn't it be great if we do this all in one line? That's why a constructor can be so handy. So here we're doing all of that work in just a single line. It's much better than-- see how long and how verbose this was. We're doing all that work in just so much of a smaller space now.

If you look here at the constructor, this is probably the most common use of a constructor is to set the value of your initial fields. So we're taking Sailor as a value, we're taking blue as a value, we're taking 30. We're passing that down to our parameters. And then we're setting the values.

Much, much easier. And if we do we need to make any changes, we only have to make the changes once somewhere down here, somewhere in the Shirt class. We don't have to make it four times, or a million times, however many objects we want to create. Just make the changes once. If you need to change the logic, you don't need to change it in a whole bunch of places. So that is why it's important to not repeat yourself.

One other thing that I'll go over is called variable scope. The scope of fields, these are called instance variables. And their scope, or where in the code you can call them from, is going to be as soon as they are created throughout the rest of the class. The rest of the class being shown by here's our opening brace and our curly brace.

Description, so it's from 2 onward. 2 all the way down until the very end until 16. However, if you look here, we're creating another variable later on as String theColor. This is a parameter. And the scope of a parameter, a parameter may only exist within the scope that is created. So we have our opening brace here, our closing brace here. That's the scope. It can't exist outside of the scope, so we try to call the color here, but that just doesn't work.

Just to recap the advantages of using methods, methods are reusable. You can reuse yourself. You don't have to repeat yourself and do the same work, write the same lines of code. Or write similar lines of code over and over. No need to do that.

It makes programs shorter and more readable. It makes development and maintenance quicker. And it allows separate objects to communicate and distribute the work performed by the program.

Now, I want you to try Practice 8-1 to declare a setColor method. And just so you know, there are two parts to this. So you'll need to consult both slides. Here's the first one, and here is the second one.

Yeah. because I know you guys have tried practices before where you work with creating the fields. Now is a chance for you to work with creating methods. So I'd like you guys to give this a shot.

## 3. Lesson 7: Manipulating and Formatting the Data in Your Program, Part 3 - 36m

All right. Now that you've played around with strings and you've played around with string builders, I'll show you how to do more with primitive data types, because there are secrets I haven't told you yet about primitive data types.

So the primitive data types that are included with Java are we have integral data types, which include-- these are just numbers, whole numbers. So we have byte, short, int, and long. We have floating point numbers, so these are numbers that have decimal points or floating point precision. Those are float and double.

We have textual types. And the only textual primitive type that Java offers is char or character. And then finally, we have logic types, Booleans, whose values are true or false.

If you look at the integral primitive types in Java, byte would be the smallest. And Java reserves 8 bits worth of space for byte-type primitives. So a byte could be anywhere from negative 2 to the 7 to positive 2 to the 7 minus 1.

So it's actually splitting those 8 bits' worth of values. It's splitting it-- so here's the number line. And here's 0. We have 8 bits to work with. We're splitting half of it on numbers greater than 1. And then we're splitting half of it on numbers that are less than 1.

And then we also have 0, of course. So this is actually-- we just cut 1 of the positive and then use that for 0. So the maximum is actually going to be 127, and the minimum is going to be negative 128.

We have 256 spaces' worth of possible values. And 256, that's what 2 to the 8 is. So that's what we mean by 8 bits' worth of space.

Short is a little bit bigger. Short is 16 bits. We have integers, 32 bits; and longs for really big numbers. Longs are 64 bits.

Most of the time when you're programming, you won't use a byte and you won't use a short. The reason why these exist are because computers have come a long way in terms of the amount-- their computational abilities. So bytes and shorts were useful when you were dealing with devices that didn't have as much memory, didn't have the robust processing ability that modern-day machines do. So even though you can use a byte and a short, you really don't need to, because devices nowadays have a lot more memory. Instead, you'll be spending most of your time working with ints, and some of your time working with longs if you really need to.

If you want floating point precision in Java, you have two options. You have float, which is 32 bits. That gives you 32 bits' worth of precision.

If you want double the precision of a float, you have the double. That's where the name comes from. And that is 64 bits, double being 32 times 2 equals 64. Yay. Although it's especially the exponent, so it's not linear. But anyways--

When you go to create a float here, you just want to be sure to add capital F to the end. But most of the time, you won't need to work with float. Most of the time, you're actually going to be working with a double. So there's really no need to-- so say you want this to be a double. We'd get rid of the F. We'd change this from float to double.

Continuing on with textual data types, remember strings are objects, so we're just looking at primitive data types. And character is the only primitive that offers textual data. So the key word for that is char, C-H-A-R. And it is used for a single character with 16 bits' worth of space being reserved for those characters.

Another difference, when you want to create a char, when you want to create a string, chars use single quotes, shown right here. Actually, maybe I should circle these. I've got to be really precise with this, because they're so tiny.

OK. There's one. There's the-- OK. And if you were to use that as a string, you could do this. You could have a single character as a string.

You could have a single character as a char. What you can't do, though, is have a char that has multiple characters. You can't do that. This has to be a string.

And now just to go into a little trivia, did you know many older computer languages use American Standard Code for Information Interchange, or A-S-C-I-I, an 8-bit character set that has an entry for every English character, punctuation mark, number, and all that. So A-S-C-I-I, that is 8 bits.

Unicode, on the other hand-- and this is what Java uses. The Java programming language uses 16-bit character set called Unicode that can store all necessary display characters for the majority of languages used in the modern world. And also, Unicode actually contains a subset of all the ASCII characters. So here we have 8 bits. And then we have contained as part of Unicode, which is 16 bits.

Constants. You have in Java the ability to make a variable constant, meaning it's not going to change. And you do that by using the final keyword when you're creating that variable. So if you were to actually go and try in the next line to change this to say NUMBER_OF_MONTHS equals 13, you can't do this. NetBeans will complain. Let's see. Oh, by convention, anything that you want to be final is going to be in all uppercase and the words are going to be separated by underscores.

Yes. So again, variables change. Variables vary. Constants, they are constant. They cannot change. And the keyword to do that is final. And make sure it's all uppercase by convention.

OK. I also want to talk about the remaining numeric operators. I showed you a few, but there's more, like the mod operator, or modulus, which is the percent symbol. And all mod means is finding the remainder.

If you divide 31 divided by 6, you're going to get 5.16666 repeating. And this actually means 5 and 1/6. And the 1 is what we want, so if we were to write 31 mod 6 int x equals 31 mod six, it's just like we write int x equals 1, because mod is the remainder.

So actually, in this case, possible values that you're going to get if you have 31 mod anything, possible values are going to be you could have 0. You could have 1, 2, 3, 4, 5. It won't be 6, because if it's 6, you actually just go back to 0, because there are no remainders, because this is another case where you can divide by 6 one more time.

OK. There's a few other mathematical operators. And these are actually helpful shortcuts, because there's some things that you'll do in Java that you do over and over. So we've provided helpful-- Java's provided helpful ways or little shorthand ways to do it.

So say you want to do-- something that happens pretty often is say have int a and you want to add-- a is going to equal its previous value of a, but also plus b. So a equals its old value plus the current value of b. If you want to do that-- this happens so often if you want to do that using shorthand, using a shortcut to do that, you write a plus equals b.

These two statements, this one, this one, they're exactly the same. It's like one-- semicolon. Ha ha. They're exactly the same, except one requires less typing. That's why it's a handy shortcut, because you don't have to do as much work. You don't have to type.

So you have that-- that's available to you for addition, plus equal. You can do the same thing with subtraction, minus equal. So it would be like instead of saying a equals a minus b, you say a minus equals b right here.

And you can do the same thing with multiplication. You can do the same thing with division. You can do the same thing with the mod operator.

We also discussed incrementing and decrementing, but depending on where you put the plus plus, depending on where you put the minus minus, your results may vary. So in the first example, first example being right here, we're doing what's called pre-increment. So if you look at this example, id is initialized to 6.

In the next line, you see newId equals plus plus id. Because the operator, the plus plus operator, precedes id, this increment is immediately evaluated. And therefore, the value of newId is going to be 7.

So in other words, it adds first-- we take id. We increment it first. We increment it from 6 to 7 and do that first. And then we assign the value of newId to be 7. So in this case, both id and newId are going to equal 7.

There's what's called post-increment if you decide to put the operator after the variable. What's going to happen here is that first it's going to save this until the very end. So with that being the last step, newId is going to equal the current id, which is 6. And then once that's done, then you increment id, which allows id to be 7.

And the same principles apply if you don't want to increment, if you want to decrement. Same idea. If you put the minus minus at the beginning of the variable, it would do that first, called pre-decrement. If you do it afterwards, post-decrement.

And here's an example. Let's actually see if I can try and walk through this, trying to figure this out, because yeah, some of these examples are-- they're tricky. And you may not necessarily ever code something like this on your own. It's more to test your knowledge.

So let's see if we can actually walk through this. So we have count is going to be set equal to 15. We look at Line 3, so we take count and then we increment it last. So a is actually going to be 15 here. a equals 15. I think count is going to be-- yeah, count is going to equal 16.

Then we go to the next line. OK. We don't do any sort of math, so we're setting b is going to be count, which is 16. And then count stays the same.

Next line, Line 5. OK. The first thing that we do is increment count. So that means count equals 17. And then c is going to be equal to that, so c would be 17.

d, Line 6, we do nothing different, so count equals 17. d also going to be 17. Let's see if I got that right.

So a 15, got that right. b, printing out b, we got 16. That's right. Printing out c, that's 17. Yeah. That's right. Oops. c, d, 17 and 17.

Yeah. OK. I got that right. It just took me-- it will probably take most people a while to walk through this, because it's a bit more complex than you'd normally do.

Yeah. Try and make your code as simple as possible, as elegant as possible. Otherwise you may have to slowly walk through some of these things.

All right. So the final topic that I'll discuss now is promoting and casting variables. Promotion. Promotion is usually automatic with Java. And it occurs if you assign a smaller type to a larger type.

An example of this would be you have an integer here, but you actually want to promote that to a long. That should be shown right here. Yeah.

We have an integer. We want it to be represented or contained by a long. You can do that. And this is the syntax of how that automatically happens.

Likewise, automatic promotion also occurs if you assign an integral type to a floating point, that being done here in the second example line. We have our integer 3. It's an integer because it's not taking advantage of decimal precision. That won't happen until we store it as a double right here, so then it becomes 3.0.

But yeah, it's completely doable. We're not losing any precision by doing that. We're actually gaining precision. And that's what promotion means.

But you have to be cautious. But you have to be cautious when you're using promotion. And here's an example of that. You have an equation, 55,555 times 66,666. The answer to this is going to be a really big number. It's so big that integers can't contain it.

So what ends up happening is when you do this, you're going to get-- you're actually going to get a negative number, a pretty big negative number actually. This issue occurs because Java, it tries to be efficient with how it handles memory. And so it's not going to allocate additional memory until it absolutely has to.

So if you look at how some of these-- how Line 4 is done, what's going on is you have num1. num1 is an int. You have num2. num2 is an int.

Java's going to keep working with ints, because it has no indication that it needs anything else. It's not going to provide any additional space. So it's going to try and do the math working with ints here.

If you try to do that, you'll get a negative number. And then it stores that as a long. It'll store this negative number as a long.

Actually, I should talk about why that's the case. All right. I'll draw a little number line for you guys.

So here we have-- this is the number space that's available to ints. You have 0. You have the max value, you have the min value that an int can contain. If you try to have a value that is greater than the maximum, like way off the charts, way out here, if you try to do that, a long would have a much higher maximum, much lower minimum. But integers, integers can't handle that.

So what actually ends up happening is it'll wrap around. This value gets wrapped around. And then you're back to the minimum, and then maybe you have a negative number right here. That's what's going on. That's why we're ending up getting a really big negative number right here.

So in order to avoid this, you need to let Java know that I need more space. I need to work with 64 bits' worth of space, not 32 bits. And you do that by including a long in your equation.

So if you look here at a potential solution in Line 2, one of the numbers that we're working with is a long. They're not ints like before. We have one long.

So what we're doing here is we're multiplying one integer times a long. And by doing this, you're telling Java, be ready, because you're dealing with a long, so I need you to prepare the space for dealing with a long. And then we get the correct answer, which is a really big number. And we're storing that again as a long.

It's not enough just to store your values as a long. You have to make sure that the calculations are also being done with the proper amount of space available. Wow. That is one marked-up slide.

All right. Here's another example of why you need to be cautious with promotion. So you have 7 divided by 2, which mathematically is going to be 3.5.

An example of a potential issue that could occur is if you divide 7 by 2, if you're still working with ints, you're going to get 3.0, because again it gets chopped off. The 3.5, Java just gets rid of it and then-- it gets rid of it, and then actually right here we're saying, OK, store it as a double. So how do you convert 3 into a double? 3.0.

Why does it do that? Because when it's doing the math, it's not prepared for the space or for the precision that a double can offer. So what you need to do instead is perform math with at least one double in the equation. And the solution to that, shown here, Line 2 is the key line, one of the numbers that you're dealing with is going to be a double.

So here you're saying, I need the amount of space available to handle the precision of a double. And then that gives you the correct answer, 3.5.

Type casting, when to cast. And casting is the opposite of promoting. But casting is not done automatically. Casting is something you have to do manually using special syntax right here.

So in parentheses, you have parentheses and then long. So you're taking an integer-- and that's actually what's happening right here. Sorry. You're taking a long and then casting it down to be an integer.

Similarly, if you assign a number that has floating point precision, you assign that to an integral type. The syntax for that is you just have some parentheses here that say convert the next number into what's going to be a short. And then you can just store that data as a short.

You also need to be careful with casting, though. And so here's an example of a potential issue. The space available for a long, this number, this is a really big number. And it's bigger than what an integer can contain.

And so again, when you cast it down, you try to take something that's much bigger than an integer can handle. It's likewise getting chopped. And then-- chopped in the sense that, again, you have your number line and then this really big number is getting wrapped around and put into where-- and put as an integer. So that's something to be aware of.

And I don't-- it's probably not a really good or elegant way around this. I'm not sure if there's a way around it at all. So you just need to be very careful when you're casting like this.

And just to be on the safe side, you can do this as long as you work with numbers that both an int and a long can handle. 99, an integer can handle 99 no problem. So that's why when you cast right here, no problem. We have 99 before. We have 99 after.

Likewise, be careful about the loss of precision when you're converting from numbers that have decimal precision to an integer, because anything that's beyond the decimal point, that's going to get chopped off. And you end up with-- here you end up with 51 as your answer. You've lost that precision, which if the decimal precision doesn't matter to you, then that's fine.

But if it does matter, you've just got to be careful, because remember, it's not rounding. Even if you have 51.0, 51.1, 51.5, 51.9, you're not going to round. The decimal in all cases is just going to get chopped off. So if you ever get errors in calculations while you're casting, this could be the reason why.

Another thing to be aware when it comes to using promotion and casting-- I'll show you another scenario. So here we have two integers, integer here, 53, another integer here, 47. And we want to add this, add these two, store that as a byte. num3 is the byte. We're adding two ints.

So remember, the maximum number for a byte is 127. If you add 53 and 47, you'll get a number that's less than 127. So in theory, this should work. But it doesn't.

And the reason why is because Java doesn't-- it's not looking at the actual result. It's assuming that if you have a number that takes up 32 bits, add that with a number that takes up another 32 bits, no matter what it's going to be so much bigger than what 8 bits can store. Java's not even going to take the chance. It's not even going to bother adding the numbers. It just assumes, yes, it's way too big so I'm not going to do it.

This leads to a compiler error. And so you'll get a complaint from NetBeans. There's a couple of solutions.

One would be to store the data as an integer. So instead of having-- Line 3 instead of having num be a byte, have it be an int. That way, you can be sure you're just adding 32-bit to 32-bit. Store it as another 32-bit. That should be OK. Java will let you do that.

Another solution is casting. If you do the math here and then you cast whatever that result is to a byte, then you can store it as a byte, num3 being a byte. That will work too. Again, just be careful that you're not-- if you try to cast a number that is larger than what a byte can store, then you're going to get-- you risk getting a number that's not mathematically correct, because it's wrapping around to the space that a byte can store.

So I talked about this a bit already, but I'll go more in detail about compiler assumptions for integral and floating point data. Most operations that you do will result in either an integer or a long. So that means that bytes, characters, and short values are automatically promoted to integers before the mathematical operation is done, although if an expression contains a long, then the entire expression is promoted to along. And likewise if an expression contains a floating point, then the entire expression is promoted to a floating point.

And all literal floating point values are viewed as double. I'll show you a couple of examples to show what I mean. But actually, what I'll say right now is that say you have a decimal, float x equals 8.0. This is actually going to try and store it as a double, so you actually really need to put the F and that will tell it to be a float. You have to actually specify that it's a float.

OK. So here's an example of automatic promotion and what can go wrong. We have three shorts, a, b, and c. a and b are actually automatically promoted to integers.

So when you try to do the math, when you try to add a, you try to add b, you're actually adding integers and then trying to store that as a short. And Java doesn't like that. Why? Because shorts-- a short is 16 bits, an int 32 bits.

And so Java again is just not going to bother looking at the end result. It's just going to assume, no, you're adding 32 bits to 32 bits. There's no way I can store that in a space that's reserved for 16 bits. So what you have to do is to either make sure that c is an integer or cast your result to a short and then store it as c, which would be a short in this case.

OK. In this code, what we're trying to do is we're calculating somebody's age, but we're storing that age as seconds. Instead of saying, how many years old are you, it's how many seconds old are you? And that's going to be a really big number.

If you look at the math here, we're multiplying 365 times 24 hours, 60 minutes, 60 seconds. So yeah, that's going to be a big number. What you want to do here is make sure at least one of these numbers is an l. That's done by using the l character. Just add the l at the end of your number.

That makes sure that the entire expression here, it's telling Java to reserve enough space to be able to handle the long. You just need to do that for one of the numbers we're working with. And then at the end here, if you look at Line 10, you'll print out a really big number, which I don't want to calculate, because that's huge.

OK. And using floating points, I mentioned this a bit already. Here what we're doing is this line, we're adding numbers. We're adding 1, 2, 3, 4, and then we're adding a float. And this causes a compiler error. Why?

Because in this expression, Java is reserving enough space to be available for working with a double. But integers cannot store doubles, so you get an error. And even if you use parentheses like this here, you're still going to get an error. Why?

Because 1.0, no. We can't do that. That's saying the entire expression to be a double, and integers just can't handle that. They can't handle the floating point precision.

So there's a couple solutions here. One, you could store this data, store these calculations, store those calculations as a double, change num1 from an int to a double. Same idea with-- excuse me num1, and then change double-- change num2 to be a double. That way you can be sure your variable is going to be able to accommodate all the space.

What you could also do is you could cast this expression here to be an int, actually, cast both instructions to be an int, shown right here. But when you do that, you're chopping off the decimal point. So you would have had 10.0, but no. You chop it off. You truncate it. It goes away. So you lose the decimal precision, which I guess in this particular expression doesn't really matter, because it's 0.0 anyways. But if you're writing more complex programs, more complex calculations just be aware of that.

All right. And finally, here's an example that can occur with floating points. Why? Because if you try to store information as a float that has floating point precision right here, 27.9, you get a compiler error.

And the reason why is because Java automatically assumes that any number that has decimal precision is going to be a double. It thinks this here is a double. And floats, being only-- so floats only being 32-bit, yeah, 32 bits, can't handle the amount of precision, double the amount of precision, found in a double, which is 64 bits.

And so Java, again, it's just not going to bother finding out the final value. Is not going to bother doing any kind of calculations like this. It's just going to say, nope. Not enough space. Can't do it. Compiler error.

So there's a couple ways to fix this. One, again, you put the big F and that makes sure that it tells Java that, no, you're not dealing with a double. You're dealing with a float. Or what you could do is cast this to a float and then store that information as a float. Then you're able to do that.

That brings us to Practice 7-3, which is Declaring a Long, Float, and Character. So I've told you a lot about the data types already in Java. Now you finally have a chance to experiment on your own, to get your hands dirty and play around with all these data types. So I think you'll enjoy that.

## 4. Lesson 7: Manipulating and Formatting the Data in Your Program, Part 4 - 4m

I hope Practice 7-3 went well for you, because that brings us to the end of the lesson. And just to summarize what we've covered in this lesson, we've covered being able to describe the string class and some of its methods, use the JDK documentation to search for and learn how to use a class, use the StringBuilder class to manipulate string data, create a constant by using the final keyword in the variable declaration, and finally, describe how the Java compiler can promote or cast to interpret expressions and avoid a compiler error.

There's a couple things that I want you to do before you start with the next lesson. First is to play a bit more with Java [INAUDIBLE] Basic Puzzles 8 through 11 a try before the next lesson, the next lesson being titled, "Creating and Using Methods." So we talked a bit about methods in this lesson, but we'll go even more in depth in the next lesson, because there's other secrets I didn't tell you about methods too. And yeah, just as you play puzzles eight through 11, consider the following. Think about what happens when you rotate the blue wheel, and think about how else you can affect the rotation of blue bumpers.

Just keep those two things in mind as you play. And again, it's more important that you become familiar-- it's more important that you get experienced playing around with the mechanics of the game. It's not as important that you beat the level, but if you do beat the level, congratulations. And there's one homework assignment that we have for this lesson. It's Practice 7-4, Manipulating Text. In this practice, you continue working with the soccer league application. If you have something in Git from the previous assignment, keep working with that. This will be your new version, your updated version.

You were asked to experiment implementing features in the main method of your program, but even though we tell you the user stories, we tell you the features you need to have, figuring out the implementation details is something you'll have to do for yourself. Also, this assignment is going to encourage you to use the Java documentation.

I'll show you a little bit about this assignment, just what the results are. But again, it's open-ended to allow you the opportunity to figure out a solution and come up with an implementation that you feel is best. But here are the results. I'm cleverly hiding it here. But when you run it, your output is going to show-- we ask you to find a particular player, and that's shown here. And then we also ask you to print players in reverse order, meaning last name and then first name.

There's more details found in the document associated with this assignment, so that's what you need to consult in order to get started. I hear your boss has exciting plans for this application.

## 5. Practices for Lesson 7 - 14m

Practice 7-1 is to use indexOf and substring methods. I hope you've given this a try on your own. If you've gotten stuck, this video will provide you with a walk-through.

So the goal of this practice is to display a customer's first name. And to do this, first open up the project Practice_07-1. Use the indexOf method to get the index for the space character within the customer name. And then you assign this to the space index variable.

Then you use the substring method and the space index to get the first name portion of the customer name. You assign it to firstName and then print the first name. So I have this project up in NetBeans already.

This is what you start off with. We provide you a little something to help you get started. First thing that we have to do is now we have to find the index of the space. And we know when we do that, we're going to get an integer in return. So we have to store that as the integer space index.

So I'll say spaceIdx is going to equal-- we want to take our customer name and then from that we want to get the index of-- wow, look at all those. Thank you, NetBeans, for providing me a list of all these things to choose.

So I want to get an index of a particular string. Yeah. So let's see. We have index of. I don't want customer name as a string. I want the space. I want to find out where that space is.

OK. And so I should get a number back from that. Let me actually just see if that's right. See if I get the correct number. Idx. Yeah. I'll just run a Quick Print to see if I'm getting the correct number. 5. So let's see, this is index 0, 1, 2, 3, 4, 5.

Yeah, that's correct. OK. So we know this method is working properly. Next thing that we have to do-- let's see. Just isolate the first name. We want to take that part out. And then we're going to save that as the first name variable.

firstName equals customer name. Looking at the customer name, see if we can take out the substring. Yeah. So we want substring. We're going to provide the substring that we want and we want to provide the index that we want to look at. So we actually want to choose this version right here. So we actually need to provide two arguments.

OK. So we want 0. Starting with 0 and then ending with Idx. So it's actually going to get the substring from 0, 0 being the first position, and then we cut it off right here just before the fifth one. Oh, right. Semicolon. And then let's print this.

I want to print just the first name. Let's see if that worked right. Yeah. There we go. We're printing Steve. So we've isolated the substring Steve and we're able to display that. All right. So that is the end of this practice.

Practice 7-2 is to instantiate the StringBuilder object. I hope you've given this a try on your own. Even more than that, I hope that you've been able to find a solution. But if you haven't, we can use this video to provide a little walk-through to guide you through it.

So to get started, the first step is to open the project Practice_07-2, or you can continue editing the previous exercise. Two. Instantiate a StringBuilder object called sb. Initialize it. Have its initial value be firstName, and then do that using the StringBuilder constructor, which I explained what the constructor was earlier in the lecture.

Three. Use the append method of the StringBuilder to append the last name back onto the first name. Last name back onto the first name. You can just use a string literal for the last name and then print the StringBuilder object and test your code. It should show the full name at the end.

The optional step-- and I'll walk you through this as well-- the optional step is to figure out can you append the last name without using a string literal? Let's find out.

I'm actually going to keep editing the existing project. And I still have that up in NetBeans. So let's see. What do we have to do first? First thing we have to do is create a StringBuilder, a new StringBuilder. StringBuilder is called sb.

And like most other objects in Java, we need the new keyword to create a new instance. New StringBuilder. And we need to set its value to the firstName. So this right here, this is actually what's called the constructor column. And we'll go over constructors coming up pretty soon.

All right. So we have our new StringBuilder. What else have we got to do? We have to append. OK. So in lecture, we saw the append method. So we take our object reference sb dot-- whoa, look at all those appends. All right.

So let's see. It said we can do it just using the string literal. So let's give that a shot. Smith. See if that prints. Print dot sb. Do we have it? Yes.

So we've added the names back together. Cool. And so I think there is one more step. Yeah. It's the optional step. Can you append the last name without using the string literal?

Let's see if we can do that. So I want to sb. Actually, don't do it that way. Let's do it the new way. sb dot append. So how do we do this? So we know that we have the customer name variable.

So can I work with that? I don't want to append the whole name. I just want to append the substring. Substring being the last name. So maybe I can just somehow draw from that. I have the name and then I want-- let's see-- I want the substring from that.

And I already have the space index. Yeah. So I can just have-- let's see-- substring starting at the index. If you only have one argument, then that means starting from this index. And so we have space index. Yeah. That's what I want.

And if I do that, let's see if it prints both names together. Print sb here. Do we get both names together? We do. All right. So that was the solution.

Oh, one other thing that I should add. For the smaller practices like this, don't worry about committing them to the Git repository. That's just for the larger assignments that appear at the end of each lesson. So yeah. Here's your solution and we're good to move on with the rest of the lesson.

In practice 7-3, we'll start to experiment with longs, floats, and characters. I hope you've given this a try on your own. But if you've gotten stuck, this video will provide you with a walk-through. The first thing that we have to do is open the project Practice_07-3.

Second, declare a long using the L. This indicates that we're working with a long value. And make it a very large number. Something in the billions. Something big. Something huge.

Three. Declare and initialize a float and a char. OK. Four. Print a long variable with a suitable label. Five. Assign the long to an int and correct the syntax error that's caused by casting the long to an int.

And then finally six, print the int variable. I'll point out the results because there's going to be a change in value when you run the program. But yeah, let's go take a look at that. I have it pulled up here in NetBeans.

First thing we've got to do, we have to declare a bunch of variables. So let's start with our long. Call it long1 equals-- what's a really big number? 99-- and I use the underscore just so I know how it's easier to read. Something in the billions, right?

So we have-- is this in the billions? We have hundreds, thousands, millions, billions. OK. Yeah. 99 billion. Why is it not doing-- oh, it's complaining because I didn't add the L. Duh.

Let's keep going. Float. Float1. We're going to call this 13 point-- assign it a value of 13.5. Why is it complaining again? Oh, because it thinks it's a double. So I have to add the f. Ha, sometimes I make mistakes on purpose because they're teaching opportunities.

No. Let's keep going. Char. Ch1 equals-- actually, I'll call it char1. Short enough name. Char1 equals-- I want it to be u. Oh, why is it complaining now?

Tell me why, NetBeans. Oh. String can't be compared to a char. Right. So I've got to use single. Single, not double. Single quote, not double quote. All right.

Now we have to print the long with a suitable label. Long1. So that's the label. And this is going to be the actual variable. Long1. See if that works.

It does work. There's our long. And you also see that the underscores, they get taken out of the number. They're just there to help make the number much easier to read. All right.

The final part here. Assign the long to an int. So we have int. Int1 equals long. Oh, NetBeans is complaining again. Why? All right. The int can't store. Wait. No. I goofed that up.

It's got to be called Long1. Right. OK. Oh. All right. Int1 is already defined. We'll call it int2. Incompatible types. Right.

The integer can't store. Beans can't store long values. Let's see. I want to convert this to-- let's cast it and then print it. With the label long, assigned to int. And the result is plus int2. What do we get here?

OK. This is definitely not 99 billion right here. And the reason why is because it's so big that the number, it just wraps around in the space that's provided for an integer. And we end up getting a number that's not mathematically accurate. And this is just to illustrate why you have to be pretty careful when you're casting between certain types.

All right. And that ends practice 7-3.

## 6. Skill Check: Manipulating and Formatting the Data in Your Program - Score 80% or higher to pass

Skill Check: Manipulating and Formatting the Data in Your Program

View Skill Check

