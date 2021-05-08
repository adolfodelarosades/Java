# 10: Working with Methods and Method Overloading

1. Working with Methodsand Method Overloading, Part 1 - 23m
2. Working with Methodsand Method Overloading, Part 2 - 25m
3. Practice 10-1: Writing a Method That Uses Arguments and Return Values - 8m
4. Practice 10-2: Writing a Class That Contains an Overloaded Method - 7m

## 1. Working with Methods and Method Overloading, Part 1 - 23m

All right, folks. After we've done with the practices for lesson number nine, let's go ahead and get into lecturing lesson number 10. Of course, lesson number 10 talks about working with methods and method overloading.

In this particular lesson, we're going to look at declaring methods with arguments which are values. Aha! Something new. Now we're going to look at methods that take arguments and, of course, methods that return values. And we're going to look at declaring static methods and variables. Now we're going to look at the static key word and looking at creating and overloading a method.

So let's start by creating and invoking methods. Well, the syntax-- again, we've seen an example before, and we've seen some methods before-- but in general, the syntax is the method identified. That's the method name.

And it's typically, here, you put down in front of this return_type, what is the type of the value that it returns. And then, again, this could be optional. Usually, if it does not return anything, you will write what?

Void.

Void. And then the modifier, which, by the way, could be public. And right now, we know public. Later on, we can learn about private and so forth.

And then here, again, between parentheses, we put between square brackets arguments, which means a method can take arguments. Again, this is optional, OK? But it can pass arguments to the method. And then, of course, here you have the method code block that, of course, executes.

Now here's an example. And we've seen this before where we've seen, in this case, the display method takes no arguments. Again, this is an empty parentheses, so it means no arguments are passed to the method. And then, of course, here I see a void which means what? A void means that the method, in this case, returns nothing.

And then inside, we have a block of code. And that would be the code inside the display method. Everybody's following, folks?

Now looking and invoking a method in a different class. And we did that all the time when we worked with classes. We create a class. And then we create a test class. And then, in the test class, that's where, in the main method, we first declare and initialize a reference variable of type theClass.

And then, of course, we use that reference variable and call what? And call the method. So the way we call the method here is always the reference variable, dot, and then what? Dot, and then the method, otherwise, called the dot operator.

So in this case, we're calling the display method on the object referenced by the reference variable called, myShirt, right? Everybody's following? OK, good.

By the way, whenever we work with methods, there is always what we call a caller method and a worker method. Here, we show you how a caller method, in this case, somebody trying to eat something. And then the worker method would be the waiter or the waiter will start trying to serve that person. So in general, you always have the main method.

By the way, it's referred to always a calling method because, within the main method, we call another method. For example, in this case, this main method calls this method here. This would be the calling method. And this would be what? The worker method, right?

Again, in this case, we call them calling method and worker method. But later on, when you get into the Enterprise Edition or the enterprise applications, we have a tendency to call them services, a client and a service, OK?

So in general, again, in this case, you have the main method, which is a calling method because it's invoking or calling a method referenced by a reference variable. And of course, the worker method, in our case here, would be the display method. And by the way, when a calling method calls a worker method, the calling method stops execution until, of course, the worker method is done. And after the worker method has completed, then the program flow returns to the point after the method invocation and continues, right?

And by the way, whenever a method calls another method, you can also pass arguments. So passing arguments and return values, in general, in this case, you have values that are passed from the caller method to the worker method. And then, of course, those are received by the worker method. And then the computation is done. And then, at some point in time, the worker method will return the value, which is the answer, for example, if you want an answer, right?

So here, creating a method with a parameter. So for example, here, again, within the context of theElevator, is remember, we saw the setFloor method. You remember that? And we said, that setFloor method, it would be a nice idea to pass an argument to it specifying the floor, the desired floor that you want to go to.

So for example, here, I can go ahead and create a new instance of theElevator, called the reference variable, referenced by the reference variable, theElevator. And it's initialized with a new instance of theElevator.

And then, down here, we'll go ahead and call the setFloor on that reference valuable and pass 4 to it. Again, a call to the setFloor method passing the value 4 of type integer, in this case. And that would be in the worker method. Again, this is in the calling method, would be, for example, in the main method.

In the worker method, look how we implement it. We implement it in such a way that it takes what? An argument of this case of type what? Integer. And it's represented by what we call, desiredFloor. In fact, when you write it down this way, this also plays the role of a local variable to the method.

And then, here, we'll go ahead and say, OK, we passed the desiredFloor, which is 4. And then we say, if the currentFloor is different than the desiredFloor, we know that the currentFloor, at the beginning, is what? 1.

So is 1 different than 4? And the answer is yes. Is the currentFloor less than the desiredFloor? It's yes, because the currentFloor is 1 and the desiredFloor is what? Is 4. Then we'll go ahead and goUp. And we're going to goUp how many times? Again, 4 times.

Again, 1, 2, 3, 4, so we'll get to the 4, OK? Everybody sees that, 4? Everybody understands this?

So we can pass an argument to a method. And we can pass a value, when we call it. And of course, that will be used, again, to do the computation.

We should know that a variable defined in the method declaration is called a method parameter. Whereas, the value passed into the method is called an argument. So the variable here, that we declared here, this would be called the parameter. On the other hand, this one here, 4, that we passed, is called what? An argument, right? OK?

Again, this is just specifying the jargon language, again, the jargon language of the Java technology. Everybody's following, folks? Good.

Now continuing why, again, creating a method with an return value. Here, for example, I can go ahead and have another method within theElevator that says, checkDoorStatus. And this method, what it's going to do is, what's called on the reference variable of theElevator, called theElevator.

And then, of course, it's going to return a boolean, in this case. And we'll use it to initialize with it what? The isOpen, which is of type boolean, or save it into the variable isOpen, which is of type boolean.

Let's go ahead and see how actually we see this in the worker method. So this is, again, in the caller method, which would be, by the way, here, the main method of the test class. In the class Elevator, I declare doorOpen, set it to false, OK? And then here, I declare control, set it to 1.

And then here, I now create a new method called checkStatus. And this method returns what? It returns the doorOpen, the value of the doorOpen. At this point in time, the value of the doorOpen is what? False. So of course, that's exactly what is being returned.

And once the false is returned, it's going to be, of course, in this case, used to save it into this variable that we declared here, local to the main method. And it's called isOpen. And it's of type boolean, right? Everybody's following? Again, we should note that, because the method has been declared with a return type boolean, then that indicates an error if there is no return or if the return is an incorrect type.

Now looking at, of course, invoking a method in the same class. By the way, if you want to invoke a method in the same class-- and by the way, we've seen this earlier-- if you invoke a method in the same class, you don't have to use the reference variable dot. You don't have to use the dot notation. You can call it directly.

In this case, for example, in this class, Elevator, where we declared a doorOpen as a variable of type boolean initialized with true, false, we declared a reference variable, in this case, or other, an instance variable, currentFloor of type integer, initialize it to 1. And then we have a couple of constants here, topFloor, constant variables, topFloor and bottomFloor.

And then here, we have the openDoor method inside. We check, "if check status door", we call this method. As you see here, when we call this method, this evaluates to "true", if the door is closed.

And of course, this one here, as you see, we've put a note in front of it. What it means here, it means that, of course, in this case, we are calling the method because it exists within the class. When you call a method inside the same class, you just call it by its name directly. You do not have to create an instance to actually call it, right?

By the way, we can also call it this way too. It turns out that, again, if you have a local variable with similar names and you want to make it obvious that your code is accessing a field or a method of the current object, you can actually use this keyword called, "this".

The "this" keyword is used as a special key word in Java. And it represents the current object, the current object that is [? there. ?] For example, if I want to call this checkDoor status, I can call it this way or I can call it this way too, when I use the "this".

And "this", by the way, always references what? The current object that is working in memory. The current object. In this case, we create a new instance of theElevator. And that current object I can actually work with it. And the way I can work with it is if I use the "this". The "this" key word, pretty much, in this case, references the current object.

Everybody sees that? The current object that, right now, is alive in the cache, right? Everybody's following? OK, good, good, good, good, good. So remember "this", the "this" key word. You will learn about it, of course, later and then, of course, in the advanced course.

Now how arguments are passed to methods. Of course, when a method is invoked, the values of the arguments are used to initialize the newly created parameter variables of the declared type before execution of the body of the method or the constructor. Again, later on, we're going to see the constructor.

And this is true for both, primitive types and, of course, reference types. Again, what this means is that, in the example of the slide that you see here, the reference, myShirt. So let's go ahead and look at that.

I have a class, ShirtTest. In the main method, I create a new instance of type myShirt, referenced by the reference variable myShirt. And then go ahead, in this case, and print the color code of that.

And then I'll go ahead and call the, in this case, the changeShirtColor. And when I pass the object or reference to myShirt called myShirt, and then, B, to change the color into B, for blue. And then print that color.

And then, of course, here I have a method that I have it here. And this one is called changeShirtColor. It takes the reference to the shirt and, of course, the color and then uses that reference that I passed, .colorCode, and changes that color code. In this case, it's blue, right? Everybody sees that?

So again, what this means is, in this example, is that the reference, myShirt, is passed by value into the changeShirtColor method. Again, the reference thisShirt inside the method is a different reference than myShirt because, again, "this" is a local variable to what? To the local reference variable, to the method, changeShirtColor.

Again, by the way, in this case, they both point to the same object. So the change to the color made, again, using theShirt, is printed out through the myShirt. And of course, it would be, in this case, the same. And it would be B, because we changed it to B, right?

So looking at passing by value, here's the example where, in this case, we declare a reference variable to a new instance of myShirt called myShirt, the instance of Shirt called myShirt. And then we call the changeShirtColor method, pass the reference variable to the Shirt, called myShirt, and of course, and the color, B.

So what's going to happen here in this diagram, it shows how the value of the myShirt reference passed into the changeShirtColor method is used to initialize a new shirt reference, in this case, called theShirt. So as you see, this one the here, that we've seen here, which is a local variable, this one, this shirt that I passed here and the myShirt that I have here, they both, again, reference exactly the same object.

And that's why, when I change the color to blue, actually you could see it. And I can print that, this shirt, through the myShirt. Everybody sees that?

When you change, when you pass a reference variable to an object to a method, the reference, the address reference never changes. But you can access inside, the contents of the object, and change it any way you want.

Here's another example with a small change in the code of the changeShirtColor. Again, in this example, the same. Again, you see we have a ShirtTest. We have a main method. We create an instance or a reference variable of type Shirt, called myShirt.

And then, again, we print the color. And then we'll call this here. Again, in this case, we call the changeShirtColor passed with the reference to myShirt, reference variable myShirt, and the character B, capital B. And then we'll go ahead and print this.

And of course, it turned out that here is how we did it here. Now what we did is we passed the parameter, theShirt, and then the character color, OK? And of course, in this case, we'll make the thisShirt instantiate or initialized by a new instance, called newShirt. And then we'll go ahead and assign the color to it.

So the fact that I now instantiated, in this case, a new shirt, so this shirt will point to a new shirt, a new object, and not the object, again, the current object that we're talking about. That's why, when we, in this case, pass B, of course, it will change the color code of the instance referenced by the thisShirt, which is local to the method changeShirtList.

And of course, later on, if you want to print the color shirt, you see that you get the original one, which is U, which is the one that you had originally. Why? Because when I did this, in this case, I made sure that the reference value passed into the method is assigned to a new shirt. Again, then as before, the color now of the shirt object is changed to B, but that's only local to the method.

Now remember also that, when you print that, the color code, you will find the original color code, which is capital U. This pretty much illustrates to you the fact that the reference, myShirt, is indeed passed by value, OK? So changes made to references passed into a worker method do not affect the references in the calling method, in general.

And of course, again, we should note that this discussion is about changes made to the references passed into the method and not to the object they point to. So again, here, if you take a look at the previous code, here in this method, we passed the myShirt. And then we use that, again, when you pass it to myShirt, here, within the changed shirt, it becomes theShirt. And I use it change the color code to B.

That works without any problem. But on the other hand here, which means, now, when I have this, then myShirt and thisShirt point to the same object. On the other hand, in the next, in this one here, it doesn't do it any more.

Now I made thisShirt point to a new instance, locally, within the method, changeShirtColor. And of course, in this case, when I change the color, the color of the object inside, or the local object that was created inside the changeShirtColor, that's the one that has its color changed to B, the color code changed to B.

But the instance, myShirt, will keep the original color code, which is, in this case, capital U, right? Everybody's following? And this is exactly how we illustrate this, so if we look at that.

So when we call this one here, the myShirt still points to the original one. But then, inside the method here, inside the method changeShirtColor, then we have a new object here. This new object, again, is pointed to or referenced by theShirt. And of course, it is this color that actually changes, and not this one here.

Everybody sees that? Everybody understands that? I'm going to quiz you on that. OK, good.

So again, in this case, you see how that, when myShirt is passed into the changeShirtColor method a new reference variable, in this case, called theShirt, is initialized with a value of the value of myShirt. But initially, again, in this case, this reference points to the object that the myShirt reference pointed to. But after a newShirt is assigned to theShirt, then any changes made using the theShirt affects only the newShirt object and not the original one, right?

What are the advantages of using methods? Well, methods are very, very useful in our programs. They make programs more readable and easier to maintain, OK? They handle functions, functionalities. And they make development and maintenance quicker.

They are, again, central to reusable software. When you write a method, you can use it again and again, if needed. And they allow separate objects to communicate and distribute the work performed by the programs.

For example, that's how we now have a calling method that calls what? A worker method, a client calling a service. Got that, folks? Good.

And of course, we have a quiz here. And it's just, which of the following statements are true? Choose all that apply.

First one, a class can contain only one method declaration. That's not true. B, a method must always specify return type. Yes, including void. Well, void means what? It's not returning anything.

C, the same method can be both a worker method and a calling method. Yes it can. A method can be called by another method. And it can call another method.

And the last one, arguments need not be listed in the same order in the method invocation as in the method signature. Method signature, by the way, is the way it's declared, the way it's defined. Of course, that is false. It has to match the same signature.

So invoking method, in summary, so there is no limit to the number of method calls that a calling method can make. You can call as many methods as you want. The calling methods and the worker method can be in the same class or in different classes, of course.

And the way you invoke the worker method is different, depending on whether it is in the same class or in a different class from the calling method. If it's in a different class, you need to call it through what? A reference variable of an object. If it's inside the class, you call with its own name, right?

You can also invoke methods in any order. Again, methods do not need to be completed in the order in which they are listed in the class where they are declared, again, the class containing the worker method. All arguments passed in a method are passed by value. We all know about that, including primitives, by the way.

## 2. Working with Methodsand Method Overloading, Part 2 - 25m

Now we want to see something interesting and something new, and that's called the static method and variables. Now, remember, we've already seen a static method. What is that static method that we've seen already?

Main.

The main method. Good job. Now, looking first at some math utilities. It turned out, folks, that you guys already used the practice lab where you created a random number. The guessing game that you folks have done.

If you remember, use the while loop, while the guess is not equal to the name that you're trying to guess, go ahead and, in this case, initialize the string guess. And then while, again, the length of the guess is strictly less than the length of the name string, go ahead and, in this case, create a character.

Look what we do. We call the random method, but look how we call it. We call it through the class. You see that? Math dot random. OK? So the fact that we call it through the math dot random, that means that the random method is a static method. And you can actually see that here too.

So let me just go to the math class and take a look, in this case, the method, and I wanted to see again, in this case, random, right? I wanted to call random. Go ahead and get into random. So you see that random is what? By definition of the API, it is static.

Which means it can be called through the class name, and you do not need to create an instance of the class to actually call it. That's what it means. That's why we call it a utility method. Everybody sees that? OK, good. All right.

So continuing with that, again, looking at the static method in the math. So like we said, random, it turned out that it's static. So again, the fact that you see the screen shot, and I just showed it to you again in this case. OK? I just showed it to you here. I can go back also and I can see it here too.

This is the one that they showed you on the slide. So, it shows again, in this case, the different methods of the math class. And the method in focus in this case is random. And again, it returns a double between zero and one. So again, to generate a double between zero and 10, simply multiply that by 10. So again, in this case, math dot random, then multiply by 10.

And then, of course, to generate a double between one and 10, multiply by nine and add one. So of course, often you will want an integer rather than a double. So you will need to, in this case, cast that into an integer, and that's exactly what we've seen, of course, in the code. In this case we want to cast it into a character.

And we should note also that this method is static, as, again, indeed, are all the methods is in the math. Again, this means that the math does not need to be instantiated to call any of its methods. And again, in this case, pretty much the math class cannot be instantiated.

So again, in this case, you can call the static method a class method. And the way you call it is always through the class name, dot, and then the name of the method. That's what we call a utility class and a utility method.

So, creating static methods and variables. When methods and non-local variables-- which are, if they are non-local variables means what? They are not local variables to methods or a block of code. They are actually what we call instance variables, right? They can be static.

If they are static, what does it mean? They belong to the class and not to the object. Remember that. They belong to the class and not to the object. They are declared using a static keyword, in this case, for example, on the properties, we have get properties, and this is static. It returns the properties of your system, your OS or whatever. That's a static method.

And it to evoke a static method, you always use the class name and then the name of the method. And by the way, to access a static variable you always use the class and then the attribute name. For example, if I want to access pi, you guys know what pi is, it's 3.14 and so forth.

I now write math dot pi and then I've got it. In fact, it's already there. In fact, it's already there. If I scroll up here and I look up fields. You see that this is a pi and it's static. Right? So I can access it through the class name. And by the way, to access a static variable in the same class, you just use the variable itself.

Everybody sees that folks? So whenever-- yeah.

Can a constant be static?

Yes. You can have a constant that is static. Yeah. You can have that. Good. So remember one thing, folks, that a Java programming language allows you to create static variables or class variables. And it allows you also to create class methods or static methods. We call them static methods or class methods. And for the variables, we call them static variables or class variables.

And they are accessed without creating an instance of the class. They are accessed through what? Through the name of the class. If it's within the class, you just access them directly through their name. Right? Everybody's following? OK, good.

So now looking at creating static methods and variables. Here's an example where, in this case, we have a method called what? convertShirtSize. And it returns a character, takes an integer, which is the size. And it's what? Static. And then it has, if the numerical size in this case is less than 10, we return S character, which is small.

If the numerical size is less than 14, that's a medium, we return M. If the numerical size is less than 18, that's a large, else it's what? It's an extra large. And by the way, I can now call this method directly through what? Let's assume that this method now is in the shirt class. Then I could call it through what? Through the name of the class, which is by the way called what?

Shirt.

Shirt. So that's why I can have it now. I can declare a character size because I know it has to be returned either S or M or L or X. So I declare a character size, and then I call this the convertShirtSize, pass 16 to it. And I look how I call it through the name of the class. What's the name of the class in this case? Look at that, what I just highlighted. It's called shirt.

So I don't have to create an instance of shirt to call this method. I'll just call it through the name of the class, OK? What does it mean? It means that this method is available to all objects of what? Of the type shirt. So a static variable is kind of similar to the global variable.

Remember that Java does not have a global variable like the C language. So we can think of a static variable as what? As a global variable. Why? Because it is common to all instances of that type of class. And a static method is a utility method that can be called without instantiating the class. Remember that, folks. Right?

A class can hold non-static methods and static methods?

Yes, of course. We already have seen non-static methods. Like what? Display, remember? Set the floor, remember that? Go down, go up. All of these are non-static methods. Static methods should always have what? A static keyword in front of it.

Now here is again talking about static variable. Static variables also, again, can be, as you see here, here we declare a variable called salesTAX and it's double. And then we decide it's static, and it's 8.25. And then the way you access it through the class name and then the variable. For example, in example we accessed the pi. We already have seen that. OK?

So we can use the static keyword to declare class variables. Again, this means that there can be only one copy of the variable in the memory associated with the class, rather than a copy for every instance. So it's one copy that is common to all instances.

And of course, in example here, the salesTAX is a static variable. You can access it from any method in any class by using the class name of its class in this case. And we assume that it is a class that in this case, called TaxUtilities for example. If we assume that, then of course, the way we call the salesTAX is going to be the name of the class, dot again, and the salesTAX.

Of course, if the TaxUtilities class has methods, those methods again, static or instance, can access the variables by, again, name without the class name because it's inside the same class. We should also know that variables can have both static and final modifier to indicate that they are what? They are only one copy of the variable, and that the content of the variable cannot be changed.

This is exactly what you were mentioning earlier. So pi is a variable, and the math class is a static final variable in this case. So pi, which is a variable in the math class, is a static final variable.

Continuing with static methods and variables in the Java API. Again, some functionalities of the math class are exponential, logarithmic, trig, random, access to common mathematical constants like pi, and so forth. Some functionality of the system class are retrieving environment variable, access to the standard input and output stream, and exiting the current program, like system dot exit.

All these are static methods called through the class. Either the math class, or the system class. So I showed you here, as an example, all the methods that are static of the math class. And I could do the same thing here by looking for the system class, which by the way, I could find it quite easily just by searching it. System in Java SE7.

And here's the system class. And of course, I have it here. I could go ahead and look at its methods. And here are the methods, and, as you see, they are all static. And if you remember, we said get properties. That's the one that returns the current system properties. Did you see that? You see, all of these are static, and there are lots of them. Right? Everybody's following, folks?

So certain Java class libraries, such as the system or the math class, contain only static methods and variables. Again, the system class contains utility methods for handling operating system specific tasks. For example, get properties. And of course, the system class gets information about the computer that you are using.

The math class contains utility methods for math operations. And they can be called without instantiating the classes. They can be called through what? Through the class name. Everybody sees that? They are called utility methods.

Now looking at static methods and variables in the Java API. When to declare a static method or a variable? Typically, when you are performing the operation on an individual object, or associating the variable with a specific object type, it is not important at that time, of course. You go ahead and use the static.

Or when you're accessing the variable on a method before instantiating an object. It is important. Then in that case you can go ahead and use static variable or static method. Or when the method or variable does not logically belong to an object, but possibly belongs to a utility class, such as a math class, included in the Java API. Or the system class. Right? Is everybody following?

Now we're going to look at the last topic of this lecture. And here we're going to look at the method signature. Again, in this example, where we see the method signature will be representing the types of the parameters that you're passing here.

Again, in this case, we show some code. Again, in this case, on the loop. So this method is called getYearsToDouble, that we've seen earlier. Again, this is just to double your capital amount that you have. And of course, obviously, in this case, this takes two parameters. They both turn out to be of type integer.

And of course, in this case, the declaration of those parameters is called the method signature. And of course, in this case, it returns what? It returns the type. The return is not important, the return type. What's important is the parameters that you're passing.

So those parameters that you are passing, their type and of course their order is very important. That's the one that defines what you call a signature of a method. So from now on, when I tell you, what's the signature of the method, how are you going to actually discover the signature of the method? What do you do? What is it that you need to do to tell me about the signature of the method?

[INAUDIBLE]

Again, the method signature of a method is the unique combination of the method name and what? And the number, comma, types, and the order of its parameters. So that's pretty much what represents the signature of the method, is the name of the method plus the number of the parameters, how many are passing, their type, and their order, the way they are passed into the-- that's what represents the signature of a method. Right?

So in this case, the fact that the method is called getYearsToDouble. And then it takes this parameter which is an integer, and then the next one is a parameter of type integer, then I called this the signature of the method. But not the return type. That's not important. Right?

Again, the method signature does not include the return type. We already said it here. Now the question is, how do we overload a method? Well, overloaded methods, what do they have? They have the same name, but they have different signatures. So in a sense, the parameters, the order of the parameters, the number of the parameters, and the type of the parameters must be different, but the name of the class must be the same.

Question. Did you folks see any method-- we actually have seen a method that is overloaded, and we've been using it for a while now. What is that?

Println.

Println. Thank you. Remember Println, we found 10 of them. Remember? Good. So different numbers or different types or different order of parameters. And, by the way, overload methods may have different functionality or similar functionality. And they are, again, widely used in the foundation classes. You will see them a lot in the foundation classes. Right? OK.

So now, let's go ahead and use this method overloading. It turns out here that we have a class called what? Calculator. And this class has a method called sum. And it turned out that it is what? Static too. So it must be a utility method, right? And then here, the first sum takes what? Takes an integer and what? And another integer.

So number one and number two which are integers. And then prints a message. And then it returns what? It returns an integer, it returns the number one plus number two. We also have another method, the same name, but now it takes what? Two float parameters, right? And then, of course, prints the message and then returns the sum of those, because here it returns a float.

And then here I have another method that takes an integer and a float and then adds them, and of course returns a float. Because we know that when you add a float to an integer, it's promoted to what? To float.

So you see now in this example we show you these methods. Again, there are, as you see, three of them. They have the same name, but except that their signature is different. The first one takes what? Two integer parameters. The second one takes two float parameters. And the third one takes what? One integer and one float parameter. And they must be different for us to overload the method.

So instead of writing too many methods with different names, what we do in this case, folks, is we just use the same name and overload it. And that is a very, very nice mechanism for using the method again and again. So it's kind of good for usability. Everybody sees that, folks? OK. Good.

And of course, to invoke any method, any of some methods, the compiler will compare the method signature in your method invocation against the method signature in the class. And that's how it knows which method it will execute. Right? Everybody's following? Good.

So, for example, in this case, this is the class that we created, calculator. Let's go ahead and create a class called calculatorTest to test this one here. Take a look, folks, here. We have a main method. First here in this, we declare a local variable called total one, advantage there, look at that.

We call now the sum through what? Through the calculator class, because it is a static method. And here we pass two and three. Which method do you think it's going to call? The top one, the middle one, or the bottom one? The top one, because we're passing two integers. Good job.

How about the second one? We declare a local variable called total two of type float, and we call the sum method, which is static, through the class name, and then we pass to it two floats. So in your opinion, which one is called here? The second one.

And then the third here, we declare a local variable called total three of type float. And of course, in this case, we invoke the sum through the calculator class because it's a static method. And we passed to it what? An integer and a float. And in this case, which one do you think will be called?

The third one.

The third one. Why? Because the compiler compares the method signature in your invocation, in this case, in the calculatorTest against the method signature in the class, which is, in this case, in the calculator class. Right? It matches the signatures and it knows which method it's going to call? Right? Everybody's following overloading methods, folks? Good job.

And by the way, we mentioned to you that method overloading in the Java API, there are a lot of methods in the Java API that are overloaded. And speaking of what we just saw yesterday when we went through, again, the Java API and we found out in the output class, it's in the system dot out, in this case. And we found out that there are 10 different methods.

And this one, again, takes nothing. This one takes a boolean. This one takes a character. This one takes an array of characters. This one takes a double. This one takes a float. This one takes an integer. This one takes a long. This one takes an object, and this one takes a string.

So in this case we see how the system dot out dot Println in this case obviously is overloaded. Right? Because it's the same name, different signatures. Everybody's following that? So speaking about what was said earlier, these methods do not belong to the string class. Remember that. You said the system dot out, I think. Yeah. OK, good. Right?

And we have a quiz. The question here, which method corresponds to the following method call? In this case, we have myPerson dot printValues, and we pass an integer, then a float, then a string. Which one do you think the one that matches nicely here? If we take a look, it would be this one here, right?

That takes a parameter pantsSize of type integer, then another parameter ageInYears of type float, and then another parameter of type string called favoriteColor. So, of course, this is the solution for that.

So in summary, we looked at declaring methods with arguments and return values, we looked at the concept of static methods and variables, and we looked at creating and overloading methods. Everybody's following, folks? Questions?

It turns out that we also have a bunch of practices for this lesson, too. So the first one, we're going to write a method with arguments and return values. The second one, we're going to write a class that contains an overloaded method. And that's pretty much what we want to say.

And of course, if you want to, now, look at the detail practices of Lesson 10, let's go on and do that. So in the first practice, which is 10-1, we write a method that uses arguments and return values. Of course, we give you all the details on how to do this practice.

And then the second one, which is pretty much a challenge practice. Again, we write a class that contains an overloaded method. Again, we give you all the details on how to do that, except that it's a little bit of a challenge.

So, let's go ahead and do the practices for Lesson 10, there are two of them. And after we finish, we'll move to the lecturing Lesson 11. Thank you.

## 3. Practice 10-1: Writing a Method That Uses Arguments and Return Values - 8m

So after looking at, of course, Lesson 10 where we discussed working with methods and method overloading and so forth, let's go ahead now and look at the practices of Lesson 10. And particularly, we start with Practice 1, where, in this case, we write a method that uses arguments and return values. Of course, in this practice, we create a class to order more than one shirt and then display the total order value of the shirt.

So again, in the practice we assume that we have these classes Order.java and Shirt.java. So we create a new project, in this case, from the existing source again, called Practice 10. And pretty much at the folder D:/labs/lesson10. Again, we open the shirt class and examine the member fields and the methods it contains. And we open the order class and we examine its members, fields, and methods. Let's go ahead and do that.

So here's, again, like it mentioned to us, they wanted us to look at the shirt class and the order class. Right? So let's go ahead and look at that. So here is the shirt class. So pretty much, again, similar to what we've seen earlier. We went through this shirt class many times. So you've got a bunch of instance variables, shirt ID, description, color code, price, and quantity in stock on the display that displays, of course, the shirt ID, description, color code, price, and quantity in stock.

And they also want us, in this case, to look at order class. In this case, it has an instance variable of type double called double price. And second one, it has a method called addShirt. Ah ha. Interesting here, folks. Look at how these method takes an instance of type shirt, as a parameter and then returns a double. So what it does over there is inside the method we'll go ahead and add to the total price the price of the shirt and then return the total price. That's what it does.

Continuing with the practice, again we create now the new Java main class called order test. And then we add the code to the main method that adds a shirt to a new order and displays the total amount of the order. Again, in this case, the high level steps for this are provided in this table. Again, in more assistance is given following this table.

For those who are comfortable with what's in the table, go ahead and do that. Otherwise, again, you can read the details. For details, here we have the documentation for the add method that pretty much, again, adds a shirt to a list of shirts. So the syntax is we have a method called addShirt that takes an instance of a shirt. Parameter, in this case, shirt, and object reference to a shirt. And then return the total current amount for the order.

Again, the solution would be something quite similar to this where, in this case, we can add an instance of an order, and instance of a shirt, and initialize them with, in this case, or reference variable order and shirt initialize them with a respective view and an instance of order and an instance of shirt. And then we declare a variable called total cost of type double and, of course, initialize it with 0.0. And then after that, we decided to set the price of the shirt to $14.99. And then, of course, after that we'll go ahead and invoke the addShirt on the order by passing an instance of the shirt that we have here, and then of course print, in this case, the total cost. And it should be something similar to this.

Again, in the main method of the order test, we create an additional shirt objects, assign a value to the price field of every new shirt object, and add the shirt objects to your order by invoking the addShirt. Again, we should remember, there's a note here that says that the addShirt method adds the price of the shirt argument object to the total price field of the order object. Therefore, the total price value grows with every addition of a shirt. Again, you only need to capture the return value of the final addShirt method called to get the total cost value.

Of course, this would be something that looks like this. So in the test class, we created, in this case, a shirt then a shirt 2 then shirt 3. And we decide that the first shirt would have a price to be $14.99. Shirt 2 will have the price $23.55. And shirt 2 will have, in this case, the price of $49.99.

And then we'll go ahead and pass the shirt to the addShirt method invoked on the older reference variable. And then, of course, we do the same thing by adding shirt to the same thing. And then of course, here we'll go ahead and call the third time the addShirt and pass the reference variable shirt 3. And whatever it returns in this case, we'll go ahead and now save it in the total cost and print the cost. Of course save and compile.

Let's go ahead and look at that in NetBeans. So in NetBeans now, we have, in this case, the order test. And as you see in the order test, pretty much exactly what we've seen in the Activity Guide. So we create three instances, of type shirt, one is called shirt, shirt 2, and shirt 3. And then we create new instance of the order, and referenced by the referenced variable order we declare a variable of type double, in this case set to 0.0. And then we decide to set the price of shirt to $14.99, the price of shirt 2 to be $22.55, and the price of shirt 3 to be $49.99.

And then we call the addShirt method three times, again. In this first couple of times, we did no, we did not want to save the total cost at that time because we are interested by the last one. OK? And then when we call it the third time, and in this case and pass shirt reference shirt 3, which is a reference variable to the shirt 3, then on that time we want to save the total cost in the local variable that we declared here of total cost. And then, of course, after that we want to print it out.

And if we run this, it gives us exactly, in this case, the total price, which is $49.99 plus $23.55, plus $49.99. Of course, what it's doing here every time it's calling, in this case, the method addShirt. And every time it adds the price of the shirt that we are adding or what we're passing to the addShirt, or the argument that we're passing to the addShirt method, of course to the total price. And that's why we have a total of, in this case, $88.53. And that's due to the fact that, in this case, we have three shirts. One is $14.99 plus $23.55 plus $49.99. And of course that gives us a total amount for the order to be $88.53.

And that pretty much ends this practice for Lesson 10. Thank you.

## 4. Practice 10-2: Writing a Class That Contains an Overloaded Method - 7m

OK. Let's go ahead now and look at Practice 2. And as you see, ladies and gentleman, even though it says challenge practice I know my advice to you is please try it. Let's go ahead and try it, writing a class that contains an overloaded method. So in this case, of course, in this practice, we write a customer class with an overloaded method called set customer info. So again, the assumption is that we assume that the customer test is already there.

So here we create a class called customer, declare, again, the fields that we have here, customer ID, name, address, phone number, and email. As you see, the customer ID is an integer, but the other ones are, of course, strings. And we give you some initial values for every one of them. Again, this would be the high level instruction.

Again, in this case, we wanted to add to overloaded method called set customer info to this class called customer, again depending on how to set the customer info method, it is called again. It does, again, one of these set the ID, name, address, phone number for a customer object. That's the first one. And the second one says the ID, the name, the address, the phone number, and the email address. OK? That's the difference.

So in the details instructions, again, the first one, as you see here, set customer name for the same name, but the signature is an integer for the ID. In this case, a string for the name, a string for the address, and a string for the phone number. On the other hand, the second one will have a different signature that takes an integer for an ID, a string for a name, a string for an address, a string for a phone number, and a string for an email. So again, within every method, assign every argument in the method to its corresponding field. Again, in this case, we create a display method to display the values of all of the member fields of the customer class. Again, save and compile.

Of course, in this case, open the customer test, modify the main method. As again you see here, create two object references to two different customer objects. Again, in this case, use every variation of the set customer info method to provide information for a customer object. And display the content of every customer object. So we see here where we declare a couple of customers, in this case C1 and C1. In this case, of course initialize with two instances of the customer, and then, of course, we call the set customer info on C1 by getting, in this case, passing one for ID, name, and then, of course, address and phone number. On the other hand, the second one, C2, we'll go ahead and call in this case set customer info. But this time it passes what? The ID, the name, the address, the phone number, and the emails. OK? And then after that, involve the display method. And of course, we should see that.

Let's go ahead and look at that in NetBean. So first of all, we want to look at the class customer. So you see it has this instance variable, one is customer ID initialized to zero, and then four different instance variables of type string, especially initialized to the values that you see over there, for the name, it's name required, for address, it's address required, for phone number, it's phone number required, then for email, again, it says email optional.

Then we have a set customer info method that takes an integer. And in this case, three strings, the first one for a name, the second one for the address, the third one for the phone number. And then we use, again, all these values that we passed here to, again, initialize the customer ID, the name, the address, and the phone number.

And then we have another one, in this case set customer info, which is the same name but it's overloaded. And it has a different signature because here this one here takes an integer and four strings, and the fourth one representing the email. Of course we have the display method, in this case, that displays the customer ID, the name, the address, the phone number and the email.

And of course, in the customer test we created two instances of type customer, referenced by C1 and C1. And then we see how we call. On C1, we call the first one set customer info and the senders. And on C2, we call the second one that, of course, includes the email. And then we call the display method. If you take a look here, folks, the compiler, or the JVM, would actually understand, in this case, that because this method here we passed to it an integer and three strings then automatically is going to call, in this case, the first set customer info here. And then in the second one, we're calling the set customer info and passing to it one integer and four strings, and of course it would know that it's going, in this case, call the second one that takes one integer and four strings.

And of course, if we test this, you will see that, again, for the first one it called the one that takes one integer and of course and three in this case and three strings are representing the name, the address, and the phone number. And as you see here, it also prints the email, but it prints the default value for the email, which is, in this case, email optional. But on the other hand, the second one it has, again, in this case, customer ID too, and then the name Sally, the address, the phone number, and plus in addition now we now have an email because we passed it. OK? And that of course is shown here in the test class.

And that shows us how actually we can overload methods in a class. And that pretty much ends the second and the last practice for Lesson 10. Thank you.
