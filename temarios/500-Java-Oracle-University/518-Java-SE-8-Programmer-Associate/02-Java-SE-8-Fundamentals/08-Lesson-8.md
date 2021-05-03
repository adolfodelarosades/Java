# 8: Lesson 8: Creating and Using Methods

1. Lesson 8: Creating and Using Methods, Part 1 - 26m
2. Lesson 8: Creating and Using Methods, Part 2 - 31m
3. Lesson 8: Creating and Using Methods, Part 3 - 3m
4. Practices for Lesson 8 - 19m
5. Skill Check: Creating and Using Methods - Score 80% or higher to pass

## 1. Lesson 8: Creating and Using Methods, Part 1 - 26m

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

## 2. Lesson 8: Creating and Using Methods, Part 2 - 31m

 
Now that you've finished Practice 8-1, we're going to start talking about static methods and static variables. I hope that you've given Java Puzzle Ball a try, and as you're playing, thought about the questions of what happens when you rotate the blue wheel and how else can you affect the rotation of bumpers. So actually, I'll demo that for you right now just to get everyone on the same page.

Ooh. OK. So let's try Basic Puzzle, Basic Puzzle 8. So what do we got here? We have to think about what happens when you rotate the blue wheel, and how else can we rotate the blue bumpers? Keep those in mind. So let's see. What do we do here? If I let the ball go, it's just going to go straight down. I don't want to do that. Maybe I can go on and deflect it this way. But if I deflect it this way, it's just going to go off to the right. I don't think there's anything I can do to get it-- I can't get it directly to Duke, so there's something else I've got to do. Let me think.

I have this fan right here. Let's see what that does. OK. So that'll blow the ball down, so I'm like halfway there. So what else can I do? I have this one. OK. So maybe I can have it go this way and make a square and come around. Let's see if that works. Ding. Ding. Ding. Whoa, that one rotated. Ding. Ding, ding. Ding.

OK. So we got the ball to Duke. But I noticed that while I did it, one of these was rotating. Let's see. Was this how I had it set up? Let me-- oh. That's not how I had it set up. But anyway, yeah. What's going on is I have one of these rotating, and some of them aren't. So it's doing them one at a time. Sometimes that's OK, but I don't want to do that this time. So it looks like there's two ways I can end up rotating these guys. I can do all of them at once, or I can do one at a time if the ball happens to strike that part.

Well, that was an interesting puzzle. I wonder how that applies to Java. I'll tell you how it applies to Java. So let's debrief now from what you've observed. First of all, what happens when you rotate the blue wheel? You notice that the orientation of all blue bumpers changes. All blue bumpers share the same orientation property as the wheel. Orientation can be represented by a static variable. How else can we affect the rotation of bumpers?

Well, we saw that after the ball strikes the rotation wall, the rotation of individual bumpers changes. So rotation can be represented by an instance variable. Taking a closer look-- static variables, orientation-- what does this mean? The same orientation was shared by all instances. Static variables are properties or fields that belong to the entire class, not to an individual instance. So that's why we saw when we rotated a wheel, all of these rotated, not just a single one-- all of them. Therefore, a static variable may be changed only once in order for every instance to be affected.

You may have observed, if you were playing Puzzle 11 on your own, that rotating the red wheel changes the orientation of all bumpers. That's what this screenshot is from. It's from Puzzle 11. OK. Interesting.

How about rotation? Rotation is an instance variable. What are instance variables? They are unique to every instance, and they exist for every instance of an object. Therefore, instance variables reflect properties that need to be changed one at a time for each individual object. You may have observed while you were playing Puzzle 11 that individual red bumpers' rotation was changed after being struck by a ball.

See, if you look at the diagram here, actually, the ball was almost going like this, I think. Wait. If the ball was going like that, and it strikes right here, it'll cause this to rotate 90 degrees. But that's just the one instance. It won't have any effect on this one at all-- just the instance, just the one instance variable, just the property belonging to this particular object.

So the static modifier is what makes this happen in Java. It can be applied to methods or variables, which means you could have a stack method, or you may have a static variable. It means that the method or variable belongs to the class and is shared by all objects of that class. It is not unique to any specific instance, and it could also be accessed without instantiating a class, so you don't need to create any sort of instance. It's just there, because it belongs to the class, and the class exists, because you wrote it.

By comparison, a static variable, which is shared by all objects in a class-- compare that with an instance variable, which is unique to an individual object. Here's an example of this actually done in Java code. We have our clothing catalog, and we're saying we want static variables. All you've got to do is just add the static variable to where you're declaring it. We're saying that medium, M size, medium-- we want the string for this to be Men's Medium. All right.

So we have our variable, and it's within the ItemSizes class. Well, if we want to use M Medium, if we want to use this variable, don't need to create an instance? And the answer is no, because when you want to reference a static variable, you do that by calling the class directly. ItemSizes isn't a reference to any item, any object in particular, any instance in particular. It's the actual class, so when we say a variable belongs to the class, that's what we mean. That's how you reference it. You reference it by the class.

To create a static variable or method, just add the static keyword either before-- well, actually, you can put it anywhere. You could be right here also if you want, but I prefer to do it at the very beginning. But yeah, so just add the static keyword so you're declaring the variable as a static keyword to where you're declaring the method. To access the variable or a method, if you're in another class, then you need to type in the class that the field belongs to. You need to type the class that the method belongs to, and then follow that with the dot operator and the field or method that you want.

If you happen to be in the same class as a static field that you want, then you don't need to type in the name of the class, because you're already right there looking at the fields that you want. So if you're in the item class-- excuse me. If you're in the ItemSizes class, and you want to reference M Small, the static variable, just type M Small. If you want to reference the static method, just type Set M Small. Treat it like it's any other method or any other field in that class.

Although that's the one caveat that I'll get into in a bit later, which is when to use static methods and fields, which I'll get into a bit later. But basically, if you have a static method, you don't want to be using instance variables. Static methods are for handling static variables. I'll talk about that more in a little bit.

So when would you ever want to create and use a static method or a static field? It's helpful to do this when you're performing an operation on an individual object or associating the variable with a specific object type that's not all that important. Also, when accessing the variable or a method, before instantiating object is important. Why? Because when you're using static variables, you don't need to create an object.

Also, the method or variable does not logically belong to an object but is possibly a part of utility class like in Java, Java provides you with a Math class, and you can find more information on this in the Java API. What the Math class has is a bunch of methods for doing math. You also have a bunch of constants like Math.PI, or there's also Math.E.

If you want to use those variables, just type the name of the class, Math, followed by the field. You don't need to create a new math object in order to do math. That would be kind of tedious actually, so thankfully, you don't have to do that in Java. And here are some rules about static fields and methods. Instance methods can access static fields or methods, but static methods can't access instance methods or fields. Why is that?

If you look at the code example below, the instance variable is associated with a particular instance, but you may not need to create an instance to work with a static method. So how are you going to get the ID of an item that doesn't exist? So here's another way to put it. Let's say I want to know the name of my friend. I'll turn and say, hey, friend, what's your name? There's no one there to answer.

So the field name-- it's a silly question. There's no person. There's no name. So I shouldn't be doing that. I also shouldn't wonder what the name of my friend is, because I should know the names of my friends. Anyways, here's a couple more use cases that I'll explain.

Static fields and methods versus instance fields and methods-- if you look at use case number one, the reason why this is permissible is we have a static-- we're within a class. We're referencing a static item ID. We can do this. The reason why-- because it exists, and it's only static, which means it belongs to the class.

If you look at use case number two, instance item ID equals 3, we can't do this from the main method. And the reason why is because we actually need to create an instance first in order to get a value from that instance. Like something that doesn't exist can't have a property, and that's what we're actually trying to do here in case number two.

So we're not allowed to do that. Likewise, if we were to call a static method, same thing. We can't call-- excuse me. If we were to call an instance method, we can't do that without an actual instance being created. So this isn't allowed. If it were static, we could do it, because the class would exist, but not an instance. We have to actually have an instance.

And that's what four shows. You look at four, we have our object reference. It's item01, and then we're allowed to call methods on it. If you're looking at a particular instance, if you're looking at the actual class, so here we have a whole bunch of instances that I created. And are we allowed to print a static item ID? Yes. Why? Because even if we don't have instances, it's still going to exist, because it belongs to the class.

How about six? Can we do six? Yes. The reason why-- because right here, this entire box is showing yes, this is our instance. So by definition, yes, since it exists, of course we're going to have properties for it. So that's why this is good.

So what I've shown you up until now is mostly how to go about referencing and using static methods and variables in classes that you've written yourself. But there are also static methods and variables found in classes that Java provides, and you can get more information on this from the Java API.

I mentioned the Math class before. You'll find that there are methods in the Math class, which are helpful for working with exponents, for logarithms, for doing trigonometry, or random. If you need to randomly generate numbers, the Math class is good for that too. Or if you need to, again, access mathematical constants like Math.PI, Math.E, and that's all done by typing Math, dot, and then helpful [? nothings ?] will come up on the list of all the things that you can do.

There's also the System class. You use this for system.out.printline. So what else is this good for? What else is system good for? System is good for retrieving environment variables. It gives you access to input and output. We're very familiar with this already-- and to exit the current program. If you ever type System.exit, that'll end your program.

If we were to look at the Java API documentation on System, we'll find it in the java.lang package, System class. And you'll notice that when you go to get more information, Out is shown as a static field of the System class, and it's an object reference to a PrintStream object.

And so that actually makes sense, because when we write System-- where's a good place to write this? When we write System, S-Y-S-T-E-M, right. System.Out, without being an object, that means you can type the dot operator again. You can find even more-- we find specific methods associated with the out object.

Let's say we want to understand more about out. The diagram shows the field summary of the class system. Here, you'll see that there is, indeed, a field, Out, right here, and it's of type PrintStream. Yes, it is. By clicking PrintStream, you can now see the details for the class, and if we scroll down to the Methods summary, those being down here, if you scroll down to the Methods summary, you'll find among the many other methods, you'll find Print method and Print Line method.

The Print method is pretty similar to the Print Line. The only thing is that Print Line automatically creates a new line at the end of the statement. Print, on the other hand, doesn't create a new line. So if you would have two just regular Print statements, they'll actually run together. And I think you've seen that already in an earlier exercise.

There's other static fields and methods in the Java API that you may be interested to know about, and these are called wrapper classes. And they're each associated with a particular primitive data type. And the key thing here is when you create them, they actually begin with a capital letter. So we have capital B, capital D, capital I, so capital B Boolean contains a single field of type Boolean with the primitive.

Capital D Double contains a single field of type Double, the primitive double. Capital I Integer contains a single field of type Int. And you'll also find that these classes, the wrapper classes, have additional methods they can use to work with the fields inside.

So how do you go about converting the data? And this is actually something we're thinking about doing with the phone number scenario. A little while back, we were wondering, how do we take these substrings and convert them from a string into an Int? So that's actually what we're showing how to do on this slide.

If you want to convert a string to an Int, here's the syntax for that. Create an Int. To hold the new data, myInt1, and then you type Integer, so this means we're referencing a static method in the integer class, the dot operator. Dot operator followed by the static method, parseInt, and then we just put in the string that we want here.

Same idea if you want to convert it to a double. You have the wrapper class, and then the dot operator, and then the static method that you want. The class name, the dot operator, and the static method that you want for Booleans as well.

Moving on to describing how arguments are passed to a method. An object reference is not the same as an object. It provides a reference for access to that object instead. This is similar to the way a house address provides directions for painting a particular house. If you pass the address of your house to a painter, so the painter doesn't actually have your house. He just has your address number. And he uses that to locate what he needs, what he needs is the house. So using the address, he goes to where the address is telling him to go. And then once he has arrived, he paints your house.

But what if there is a new object? Suppose the owner of the house moves to another house before the job is finished. Will the painter be able to find the owner's new house and paint it? Here you are moving to new house. Will he be able to find it? The object reference, myHouse, has changed to point to a new house. And the address for this house is different now. Now the address is 102.

So the painter still has the old address, and he's going to go paint the old house. Meanwhile, you're going to be very upset, because he doesn't have the new address. And that's all caused because of the new keyword. I'll show you using some memory diagrams why this is the case. So here's us debriefing from the first scenario, and then I'll show a diagram of this afterwards.

If you look at line three, we create a new house. Excuse me. We create a new shirt. The new shirt's going to have its own address in memory. By default, shirts are going to start off with a color code. It's going to be U, single character, U. I think we decided to call U undetermined or undeclared. Either other one is fine. Or unnamed-- that works too.

Anyways, yeah. So we go to print it, line four. We'll go to U, shown here in the output. Moving on to line five, we're going to change-- we're going to run Change Shirt Color. Run that method. So we end up passing a reference to that object to the method down here, along with the new color code that we want. In here, we do the work. The shirt color code equals color.

So even though theShirt and myShirt-- they're two different variables, but they both point to the same object. They both point to the same shirt. And so what we're going to find in output once this method returns and we go to line six, that same shirt is going to have a new color, color B. And here's what it looks like in memory.

We have the original-- wait. Which one's the original? myShirt's the original. So we have our original myShirt, and we have its address in memory. And it's pointing to-- there is the object in the heap memory. When we create this variable, theShirt-- and remember, this variable only exists within the scope of this method here-- the variable is created with the same memory address, and it's going to point to the exact same object in the heap memory. So whether or not we do a change using this reference variable, whether we make a change using this reference variable, they're going to be the same. It's pointing to the exact same object.

However, let's say in our method instead in Change Shirt Color, if we instead create a new shirt, and then change the color of that new shirt, the new keyword-- this is where the trouble begins. Well, this is the whole cause of the trouble using the new keyword. We don't need to create a new object. We already have our object up above. MyShirt is what we want. As soon as we do New, what's going to end up happening is we create a completely new object with its own location and memory.

Coincidentally, they're both going to have the same properties, but they're different objects. So if we go to change the color of myShirts-- excuse me. If we change the color of theShirt to blue from U to B, that's going to happen on this shirt right here, and this is only going to exist within the context of this method. So the scope of the shirt only exists here, and then it goes away forever.

So we're not doing the work that we want on the right object. We've done work here on this temporary shirt, and then it goes away. And the real work that we wanted to happen, we wanted to change myShirt to blue, but we didn't. Why? Because we used the new keyword. So in this case, we don't want to use the new keyword.

Moving on to the final topic, overloading methods-- so there's a couple of things to note about overloaded methods. They all have the same name, but they're going to have different signatures. And what a method signature includes is the number of parameters, the types of parameters, and the order of those parameters. They may have the same functionality or a different functionality. What we mean by functionality is so here's our scribble, scribble, scribble, method declaration. Within the curly braces, this is our functionality.

They may be similar. It may be different. It's up to you. But overloading in general is a technique that's widely found throughout Java. So here's an example of that. We have the sum method in the Calculator class. Three different versions of a sum method, actually, and their method signatures differ. Here's a version at the top. This version has an Int argument-- excuse me, an Int parameter-- and then another Int parameter.

The second version has a Float parameter and another Float parameter. The third version has one Int, one Float. So is this different enough? They differ by the type. So that actually works. And when you go about calling these methods, Java is smart enough to know by the arguments you provide which version of the method you want. If you look here at this line, we're providing two different integers. And Java looks back at the methods that it has and tries to find the best one, and it can do that. Why? Because there's only one version of the sum method that has two integers-- this one.

Likewise, we can have two floats. There's only one version of the sum method that has two floats. If we provide one Int argument, one Float argument, would Java know what to do? Yes, because there's only one that matches that signature. What we can't do, though, is we can't do F-L-- Float Total Four equals Calculator.Sum. What we can't do is this. 12.8 F, 2. Why can't we do that? So it is different.

It is different enough. We've changed the order of our arguments, but we haven't written a method back here to accept the order of Float Int. We have Int Float, but that's not going to work. Java's going to be very particular about the order. If you look at the Print Line method, so this is a method that you guys are familiar with. This is also an overloaded method.

You have Void Print Line with no arguments, and this terminates the current line by writing the line to a separate string. You have another overloaded method that takes a Boolean argument, which prints a Boolean value, and then terminates the line. We have-- here is another variation, another overloaded version.

And what makes this one different is that it accepts a different kind of argument, a character. And it prints the character and then terminates the line, and then finally, we have a character array. And this version prints an array of characters and then terminates the line. That brings us to Practice 8-2. Again, there are a couple of pages. So there's two parts to this. Give it a try. This one's about overloading.

## 3. Lesson 8: Creating and Using Methods, Part 3 - 3m

Now that you've created your own overloaded method, that brings us to the end of this lesson. So you should have learned everything you'll need for the homework, which includes how to add an argument to a method, how to instantiate a class and call a method, overload a method, which you just did, work with static methods and variables, and convert data values using the wrapper classes Integer, Double, and Boolean. The one thing left to do for this lesson is to complete the homework assignment, which is practice 8-3, Using Methods. In this practice, you are asked to enhance the soccer league application by removing much of the logic you've already written in the main method and including it as part of the methods in other classes.

So you can consult the activity guide for more precise information on what you'll need to include, what your program needs to do. But it'll be up to you to figure out the implementation details. One other thing worth noting is that you're asked to create a new package. And within that package, we provide you with the file GameUtils.java. So just be sure to add that file into the new package.

I'll give you a brief overview of what your program is supposed to do. But again, it's intentionally created to be open-ended, to give you the opportunity to build your understanding and to be able to find a solution that you feel is best. So what your program ends up doing, though, is you go to run it and we have a goal scored by a player on a team. And this is actually meant to be randomly done now. So you'll have random goals at random times by random players. But this is also done consulting the GameUtils, which is going to be a database of possible player names.

I think that's all that there is to tell you. Just consult the activity guide for more detailed information. And you have everything you need to know. And if there are things that are new, we'll be sure to include those in the documentation. Good luck.

## 4. Practices for Lesson 8 - 19m

Practice 8-1 is to declare a setColor method. I hope you've tried this on your own. But if you couldn't figure out how to do this, this video will give you a walk-through.

So the first thing you got to do is open the project Practice_08-1. In the Item class, you need to declare a setColor method that takes a character as an argument-- like a color code-- and returns a boolean. Return false if the color code is space-- or a blank. Otherwise, assign the color code to the color field and return true.

In the ShoppingCart class, what we need to do is call the setColor method on item1. And if it returns true, print the item's color. If it returns false, print an invalid color message. And we'll test the setColor method with both a valid color and an invalid one.

So I have this pulled up in NetBeans. Let's give this a try. So first we want to look at the Item class. And what we need to do is we have to create a method for setting color. And it's supposed to return a boolean. So I have to make sure its return type to set to bool. boolean setColor.

And I think I want to take one argument because I need to know what the color it's supposed to be set to is. So I'll have to add the parameter for a character. Call that colorCode.

And the character colorCode is going to exist in between these curly braces. It won't exist anywhere outside, such as here. So System.out.printline. If I go to print colorCode-- actually, I want to demo for you why this doesn't work. But now, it's going to complain for another reason.

The reason why it's complaining is because I'm missing a return statement. I have to return a boolean. Just for now, I'm saying it's going to return true.

And so why does line 12 not work? Line 12 doesn't work because colorCode isn't recognized. It has no idea what it is because colorCode doesn't exist outside of these curly braces.

So getting back to work, what we need to do is examine if the color code is a space. So if we need a test values, we do that using an if statement. Let's see, we have if(colorCode == ' '-- then, what are we going to do? Then, we're going to return false.

I remember in lesson 9, I said that it was not OK to put any code after the return statement, but we're going to have to have an else. The reason why this works. Let's say, else return true.

The reason why this works is because we're providing scenarios where the code can end. If you were to write any code underneath this like System.out something, it'll complain because this code is going to be unreachable. Yeah, unreachable statement. Why?

Well, there's only two pathways where the code can go. It can go-- line 9, line 10, line 11. It'll either end at line 11 or it'll end at line 14. All this here is unreachable. And it's because we did the if else statement that allows us to have two return statements. If there was only one return statement, then nothing after that return statement could execute.

Back to work again. So otherwise, what do we do? Our else scenario is this.color has to be equal to the new color code. And then, we return true. I'll save it.

And now we got to test this. And we test it from the main method, which is written in our shopping cart class. So what do we need to do here? First, what we have to do is create an instance, but that's done for us.

Then what do we do? Let's see if this works. I'm going to try and set the colorCode for item1. So that's going to be item1.setColor.

And what should we have. Let's say we have 'B' for blue. I actually need to print out if this worked or not. Let's see, so I'll go System.out-- Item1.color-- this will be our heading.

We're going to print out whatever the color was. Let's see if that works. That worked.

What if we set it to the thing that we want to check that we're not setting it to. What happens then? We get a blank. We actually don't want to print out a blank, though. That's why we had a boolean.

So now, in order to work with the booleans, we have to create another if else construct. So if item1.-- actually, I could just do this.

If it's blue, what do we do? Then, we have to print out what the color is. Cut that. Paste it there.

Now, we have to provide an else statement. Else, what we do? Else, we'll say-- and we have to print out that it's invalid. "Invalid color code". That's what's going to happen if we get back false.

Why is it complaining? Let's take a look. I pasted, so I'm missing a parenthesis. Now, this should work.

So that scenario works. And then, what happens if we did get a color code that we don't want? Invalid color code. So that's all we've got to have for this practice.

I hope you find that helpful. Practice_08-2 is to overload a setItemFields method. If you try the practice on your own and still haven't found a solution, this video provides you with a walk-through.

The first thing you need to do is open the project, Practice 08-2. In the item class, write a setItemFields method that takes three arguments and assigns them to the description, quantity, and price fields of that class. The method should return void.

Step 3 is to create an overloaded-- it's going to blow-- create an overloaded setItemFields method to take four arguments and return an int. The method assigns all four fields. Although, a single space is going to be considered an invalid value for a colorCode argument.

If that's the case, if the colorCode argument isn't valid, return minus 1 without assigning the value. Else, if the colorCode is valid, assign the colorCode field. And then, assign the remaining fields by calling the three argument method.

What does this mean? It actually means that methods can call other methods. So one overloaded version can call the other one. Next, in the ShoppingCart class, called the three argument setItemFields method. And then, call item1.displayItem(). 5, finally, call the four argument setItemFields method and check the return value.

If the return value is less than 1, print an invalid color code message. Otherwise, call displayItem(). I have this to NetBeans for you. Let's see if we can figure this out.

So what do we have to do first in an item? We have to write the public three argument method. So you have to write public. It's supposed to be void return.

Called setItemFields. And we need three arguments. So you have to set the three fields above.

So that would be String desc for description. We have int quantity. We have double price. That's all three.

Then here are the curly braces for our method. So let's get to write an actual body of the method. So I want to set these fields up here.

To do that-- in order to reference those fields, I have to type this. So it's this.desc equals the parameter desc. And then, we just repeat that. this.quantity = quantity;

Then this.price-- the price field is supposed to be equal to the value of the price parameter. So there's that method. Now, we have to overload it.

We do that by public-- and this is supposed to be an int return version. setItemFields. And we need to overload this by having four parameters. So for that, we'll have String description, int quantity, double price.

And finally, to differentiate it, we have a character, which is going to be colorCode. So first we have to check to make sure that it's not an invalid color. So invalid's supposed to be a single character space.

How do we compare values? That's done with an if. I want to check to see if the colorCode is not equal-- so not equal means exclamation point and then equal.

Say, it's not equal to that-- the invalid one, the space. The one that we don't want. As long as that's the case, we're free to set the color code as we want. this.colorCode=colorCode.

And then, we need to set the rest of these. We can do that by actually calling this method up here. There's no need to repeat these steps. We don't have to write this, again. All we have to do is call that version of this method.

So for that, we'll type this.-- there it is. That's the one that we want. The menu popped up and surprised me. And then, were supposed to return 1. So a value that's greater than 0.

And now, we have to prepare for our else statements. And that will be else-- what else do we do-- because we've got to return something else. And that's why we have a complaint down here. It's because we're not returning anything because it's possible we could go to a scenario where this doesn't evaluate to true.

Then we go to the else. But we're not returning anything. But we have to return something. We have to return an int. So then we just return negative 1, a value less than 0.

Now we've got to test this. So let's go to the ShoppingCart class and test what we've written. First thing we have to do is call the three argument setItemField method.

We have already created our item. So I'll go item1.setItemFields-- let's call this a "Belt"-- quantity, 1. Price, 29.99.

It's a great deal, actually. No, that's a terrible deal. item1.displayItem-- parentheses.

Let's see if that works. Let's see if we're doing this right. OK, these are the results that we want. We should actually set the colorCode though.

So how do we go about doing that? So I actually want to know what the return code is. This is the number that we're getting back. I'd rather store that as a variable rather than trying to retype-- us having to test this because to test it, here's what we would do.

If we had like-- it would be item1.setItemField("Shirt", 1, 34.99, " ");. So I don't have to retype this. I just want to store it as a variable. So I'm going to go int return-- should I say, returnValue? Yeah. returnValue.

And now, I can go about using that in my if statements. If return-- I just didn't want to type all of this in my if statement. If I need to do this anywhere else, I didn't want to have to retype it.

So if returnValue is less than 0, what do we do? System.out-- complain. "Invalid color code. Item not added." Why are we getting a complaint? Let's find out.

Can't find variable return symbol. Oh, I typed retrun. OK, that's better. Thank you, NetBeans.

So we have one more complaint. What did I do wrong, this time? Incompatible-- oh, because I put a String, but I need to put a character. It complained incompatible types. String cannot be converted into a char. OK, I should've done the single quotes.

So now, I we'll just finish this off with our else. Else, what do we do. Else{ item1.displayItem()-- Run that. There we go. So those are the results that we want.

Let's say we actually do enter in a valid color code for-- 'B' for blue. What do we get? There we go. All right. Our code seems to be working. I hope you enjoyed this and found it helpful.

## 5. Skill Check: Creating and Using Methods - Score 80% or higher to pass

Skill Check: Creating and Using Methods

View Skill Check
