# 11: Using Encapsulation and Constructors

1. Using Encapsulation and Constructors - 36m
2. Practice 11-1: Implementing Encapsulation in a Class - 9m
3. Practice 11-2: Adding Validation to the DateThree Class - 9m
4. Practice 11-3: Creating Constructors to Initialize Objects - 7m

## 1. Using Encapsulation and Constructors - 36m

OK, folks, after we finished with the practices for Lesson 10, let's go ahead now and get into Lesson 11. Of course, this lesson in 11 covers encapsulation which, by the way, quite important in object-oriented programming and analysis, and of course constructors. Constructors are also quite important, because we need factories to build objects.

So in this lesson, we're going to get a look at the concept of the use access modifier. We're going to look at describing the purpose of encapsulation. We're going to implement encapsulation in a class, and of course, finish by looking at something called the constructor. By the way, we've been using constructors. We just did not name them yet.

Let's go ahead and look now at the concept of encapsulation. Well, encapsulation, what it means, it means hiding object fields by making all of the fields private. And of course, the whole idea behind this is to secure your code, folks. So remember when you get later on in more of the advanced Java SE 7 course and where you build a little bit bigger enterprise, rather the object-oriented applications. Plus you also are going to get into the enterprise edition where you build applications or enterprise applications.

You should also worry about securing your applications. And there are many, many different ways to secure the applications. And among them, it is a good idea to hide the objects and provide an interface to the client, through which you have control of what the client is going to access and how the client will modify the data and so forth.

And that, of course, would be through the methods that you write, and the code that you write over there, now that we know the if/else construct and we know how to control the process or taking care of any type of task. And that, of course, typically done when we've done that in the application of the elevator class. You remember how we used the if/else construct to actually fix the problem of not having the elevator going to Level 0, which by the way, we don't have.

So we encapsulate the object fields by making them all private. So now we're going to hear about the modifier "private." And of course, we use setters and getters methods. So getting and method setters are the get method and set. Method. Getter methods as used to read data. And setter methods are used to modify data. Again, in the setter method, we use the code to ensure that values is valid.

For example, if I want to do withdraw of money or transfer of money, I need to make sure that I have enough money in the account from where I'm going to withdraw, from where I'm going to transfer. Right? I cannot transfer $1,000 if I do not have $1,000 inside the account.

And of course, encapsulation mandates programming to the interface. Of course, data type of the fields is irrelevant to the caller method. It doesn't care about that. And of course, class can be changed as long as interface remains the same. And of course, encapsulation typically encourages good object-oriented design.

Now looking at public modifiers. So here, for example, if you remember, we have a class called Elevator. And this class, by the way, we decided that the variables are-- and by the way these fields are-- they're are also called what? Now that we know the jargon of the Java e-technology, you see me calling them what? In addition to fields? There are instance variables. They're instance variables.

And then of course, they're all public as you see here. And we have the go up method that again checks in this case if the currentFloor is equal to the top floor, then you cannot go up further. And of course, if the currentFloor is less than the top floor, we can go ahead and increment the currentFloor by 1, and then of course print the currentFloor, right?

So in this case, of course, we have the currentFloor and of course, it can access the currentFloor field without any problem, because it's within the same class. And then, of course, in this case, in the code that we've seen, the above method can be circumvented again. There is nothing to stop us from again setting the currentFloor to another value.

Why? Because it is public. It is public. So we can modify directly from outside. And that's exactly what we do not want. And then we'll take a look at that throughout the next.

So, for example, outside, I can go ahead and create a new instance of the elevator referenced by the elevator reference variable. And I can go ahead and assigned to it 15, in this case, to change the currentFloor to 15. Of course, this would not make sense, and would cause a problem.

Why? Because we already know that the top floor, it has to be what? 10. And of course the bottom floor is-- the lowest floor is 1, so it has to work between Floor 1 and Floor 10. So when we assign 15 here, obviously this will cause a problem.

Continuing with that, and now looking at the concept of private modifier. So in this case, what we do, ladies and gentlemen, we decide in this case that this elevator now, all these instance variables, in this case, we're going to now declare them as what? Private. And that's exactly what we want. This is the concept of encapsulation. Encapsulation is hiding the information and then having an interface through which we can access the application.

And a good example is the ATM machine, folks. When you folks go to an ATM machine, put your ATM card inside, and of course, you will have a specific interface that allows you to interact with your balance or account, where, first of all, they ask you to input the code, the secret code that would be getting you authenticated.

And then after that, you'll go ahead and get a menu. Of course, from the menu, they ask you that you have a choice. You either withdraw money or of course, deposit money or transfer money or get the balance. That's typically what we have. And, of course, when we go through those methods, of course, they control us.

For example, in that case, when I deposit the money, I need to sign the check and put it in. And of course, someone is going to check if I really-- and if that money is transferred inside in my account, inside my balance. So I don't have access to the balance directly. Otherwise, I would just add a few 0s to the right, and then I'll become a millionaire and I'll retire, and that's it. I'm just kidding.

So that's the idea behind using the private modifiers for these instance variables. This way, we cannot access them from outside. And we cannot modify them from outside. We have to what you find through what? Through methods that are public inside the class itself. So what it means that when you have private fields, that means they can be accessed only by methods within the class.

Now looking at trying to access a private field. So, for example here, because we decided that the current flow is private, if you and I try from outside in this method, this could be the main method of a test glass, where we declare an instance of the elevator referenced by the reference variable called the elevator, and then access it through the dot notation and try to, of course, in this case, assign 15 to it. And that is not permitted. So if you do that, obviously in these case you will get an error or NetBeans will scream at you and will show you an error over there.

So, of course, now the private modifier and other call methods-- you, by the way, can also apply a private modifier on a method itself, which means that this method should be accessed only by what? By the methods within the class, and that's it. You cannot access this from outside. This is, again, well known in general.

Later on, when you get into the advanced course, you will learn about a pattern known as a singleton pattern. How many of you have heard of the singleton pattern? And over there, a singleton pattern again specify that you can have only one instance of that class.

So over there, the way we actually handle that is we make the method private, so that in this case, you can actually create only one instance and no one can create another instance of that singleton. You will get to learn about that in the advanced course.

Now, again, in this case, the setFloor ( ) here, in this case, we made it private, which means now with a private modifier, it means that it can be accessed only by the methods within the class. And that's it. So in these case, we cannot-- for example, in the requestFloor ( ), for example, a requestFloor ( ), we can go ahead and pass it-- I can go ahead and access the setFloor ( ) method inside.

But we should also know that again when a method is declared as with a modifier public, that means it can be accessed from outside. Right? Everybody's following? Yes, sir.

In the overloading concept, can you have the same method, private and then public?

Yes. It doesn't matter. You can make a decision. So again, Sanjay, in this case, is asking about how about if methods are overloaded or the concept, again, the modifier is the modifier. OK? In this case. So for example, if you want a bunch of overloaded method, that again will be private, it's totally up to you. Then they will be called only from inside.

So the whole concept of interface and implementation, again, when classes are encapsulated, other objects interact with only a few parts, methods of every order class. Again in this example of the elevator, the control program that is triggered by the buttons can only call the requestFloor ( ) method of the elevator.

So of course, in this case, as long as a elevator implements this method, it does not matter exactly how it is implemented. Of course, the method in this case could store a request in a binary array, where setting an element to indicate in these case that there is a request on the floor with that index or an arrayList that could be used to store the numbers of the floors requested.

And of course, there might also be a moveElevator ( ) method that is triggered by something perhaps by the door closing. And of course, again, as long as this method, moveElevator ( ), is implemented. It's, of course, implementation can be changed to change the way in which the elevator responds to a request coming in at the same time from different floors.

So of course, the idea here is I have an interface and I can go ahead and access this elevator, but inside, I don't care if it's again built this way or built this way. That's not important to me. Right? What's important is the interface.

And by the way this is also another pattern that we always use. And that's called the session facade pattern, where in this case, we have the client invoke a coarse grain method on the session facade. And it's up to the session facade to handle that coarse grain request inside the business deal without you knowing about the details on how the business deal is implemented.

And that's typically what we do. again. In addition to simplifying how the client access your application, we also, by the way, do not want to show how our application is implemented inside, because that also could be a security breach.

Now using the getter and setter methods. So again when you make your attributes private, how can another object access them? That's the typical question we have. And in general, when, for example, in this case, we have a class called shirt, and we have these now attributes, now we change them from public to private.

So which means now, we can access them only through the public methods of the class, in this case. So another object from outside will be able to access, for example, the color code by invoking what? The getColorCode method. And that will return the color code or set the color code by passing a color code, and in this case, of course, assigning the-- passing the parameter and new court to, of course, in this case, assign it to color code.

So again, you can have a setters and getters method for the shirtID, the description, the price, and so forth. So again, using setters and getters methods are quite important. Here is, for example, an example where I have here the shirt test again, using it to test this class.

And if you take a look here, folks, you see that in this case, I go ahead and create a new instance of the shirt called the-- referenced by the reference variable theShirt. And then here I declare this variable.

And how do I call this variable inside the main method? It is what? It is a local variable. It is a local variable. That's why you're not allowed to put any modifier in front of it. You cannot put public. You cannot put private. And we said that sometimes in the previous lesson. So a local variable should not have a modifier. Your local variable to a method.

So again, here, look what we do. If I want to set the color, look what I do. Now I'll go ahead and take the reference variable to the shirt, and then invoke what? The setColor and pass to it. That's exactly how I actually do it now. And of course, if I want to read it, I'll go and involve the getColorMethod on the reference variable and get the color, and then of course, save it in the local variable that I have here. And then after that I can go ahead and print that colorCode if I want.

And again here, how about now if I want to now set a colorCode, and then I of course it set it to Z. Now remember that Z is invalid. Because we have only the range which is what? R for red, B for blue, and the other one is what? G for green. That's all what we have.

Now we're putting Z in. Of course, that does not make any sense. That's why we say not a valid code. Now what we could do is we can actually implement the setColorCode not to accept codes other than what? R, G, or B.

So again, we can go ahead and read the colorCode, and of course I can go ahead and print this. So in this case, without setting up, it's going to go ahead and print the colorCode Z, which by the way is invalid it does not make any sense in our application. Because we manufacture only shirts that are what? Blue or red or green

that's why in this case we can go ahead and fix that problem. How do we fix that problem? We can now control what's inside the setColorCode method, in this case, we say it's going to take a character, and then we say OK, let's go ahead and use the switch statement. If the new code that you're passing in this case is, of course, a R or G or B, then we're good. Then we'll go ahead and assign that code to the colorCode.

Otherwise, break and say what? Invalid code, please enter R, G or B. Now we have what we call a smart method. Everybody sees that? So that's exactly the purpose of actually using encapsulation.

We also provide these interfaces through which you are modifying the public data. This, again, would be methods. And then we can control what happens. So, for example, if you remember, when I was saying about the ATM machine. If I now want to transfer $1 million from one account to another account and I don't have it, of course, I will get a print out that says you don't have that money. Insufficient funds. So that's why we can control what the client is trying to do in this case.

And of course we give access to the client only what we wanted to give it. Nothing else. Everybody understands this concept folks?

Now continuing with the using setters and getters now, how about if we now use shirt test to test the class, but then using this method now, which is the setColor that actually has a switch statement that controls what we are trying to assign for the colorCode for the shirts.

So if we do that, of course, in the main method, we'll go out and create a reference variable to the shirt called theShirt, again, instantiated with the new instance of the shirt. And then down here, we can go ahead and print the colorCode. And then down here, of course, if we now call the set, Color Code and pass Z to it, of course, in this case, what do you think is going to happen? It's going to print this message here, right?

So then of course, in this case, you will see that, and then after that we'll go ahead and try to read the information. Now we know that before the colorCode was U. And then in this case, of course and then it says invalid. It will go ahead and print this message that you see here. Invalid color code. Used R, G or B.

Of course, you see how now it is here. And of course, afterwards, it did not pick up the colorCode Z, but the colorCode stayed as what? As U, thank you.

And that's exactly what we wanted. That's why we said before the code to the set, it shows the default value U, and then after that, call to the setColor prints the error message. And then after that, the colorCode not modified by invalid argument pass to the setColor, it stays as it was before which is capital U. Everybody's following, folks? Good, good, good, good, good.

Continuing with that, and now of course, looking at the encapsulation summary. So encapsulation, folks, protects data. By making all fields private, now we can make use of getters and setters methods. And of course in the setters method, we also use what? We use code to check whether values are valid, exactly like we've done it here, folks. We use code to make sure that it is valid. Whatever we're passing, it is a valid colorCode.

And by mandating programming to the interface, data type to the field is irrelevant to the colorMethod. And of course, class can be changed as long as an interface remains the same. And of course, by encouraging good object-oriented design, encapsulation is definitely the winner here. Everybody's with me? Good, good, good.

Now let's go ahead and look now at constructors. Well, lot of times, folks, whenever we build objects or instantiate object or create objects, we want to initialize their attributes or their fields. And by the way, this would make sense in even everywhere.

Let's assume that we have a factory, like GM, for example, that manufactures cars. We never saw a GM manufacturing a car that has no colors. It has to have a color, before it gets out of the factory. It's going to be either red or green or blue or black. But it has to have a color.

And of course, it has to have a bunch of seats. And then there are options as you . We can have a car that has leather seats, or just regular seats, or maybe an ABS system, or maybe alloy wheels, or maybe-- you know how they-- But of course, those data members of the car or of the fields of the car has to be initialized, including the color. Right

So in this case, we have a shirt test. And it has a main method. We'll go ahead and create a new instance of the-- again in this case, of the shirt. So of course in this case, and then after that we have the setColorCode and setDescription and setPrice and all that. So we can go ahead and do it this way. So in this case, we went ahead and created a new instance of the shirt. And then we use the setters methods to actually set what in this case the colorCode, the description, the price, and so forth. We can do that.

Or maybe what we could do is we can actually use the Java construct that tell us Java provides a much more convenient way to instantiate and initialization an object, using the constructor, using a method or a special method called constructor.

Now let's go and understand what are these constructors. Well, constructors are method-like structures in the class. They look like methods, because they have open parenthesis and closed parentheses. The only thing that you need to understand about the special methods, which are called constructors, is that they have the same name as what? As the class. By definition. Same name as the class. They are usually used to initialize fields in the object. We'll see that.

And they can, by the way, receive arguments. You can pass arguments to the constructor. And by the way, they can be overloaded too. And something else too. Constructors do not return anything, including void. You have nothing returned in the constructor.

But they hold the same name. So now if you take a look here, you will see that this is really a constructor, because it holds the same name as the class, shirt, and of course, it has open parentheses and closed parentheses. And of course, all classes have at least one constructor. That's called the default constructor.

Again, if there are no explicit constructors, if you don't write them, the Java compiler supplies one to you. That's called the default constructor, no-argument constructor. If, again, this is exactly what we've done here, in the class shirt, if you take a look here, in the class shirt, we did not provide a constructor.

So what happened is the compiler provides for it a different code. That's why, for example, in here, when I instantiate-- want to create a new instance of the shirt, I use shirt ( ), open parentheses, closed parentheses, And that's the default constructor provided to me by the compiler.

And of course, if there are one or more explicit constructor, no different constructor will be supplied. So, for example, if you make a decision and say I'm going to provide more than one constructor that take, by the way, arguments so that I can then use them to visualize the instance variable or the fields.

Then in that case, the default constructor doesn't work anymore. If you use it, it will scream at you. The compiler scream at you. It says no. Unless, of course, you specify it. Unless you write it down. Unless you define it in the class.

So the question is what is the syntax of the constructor method, or the constructor special method. So here, we have a ClassName. It has a modifier. The modifier could be what? Public or private? Now, we know it's a private. By the way, class can be private too.

And we have here the constructor. It holds the same name as the class. You can pass arguments to it. But of course it has a modifier. Could be what? Public or private. But then it has no what? No return type. And then inside, you have the code that initializes the fields of the instance or the instance variables. Right?

Excuse me. Can the class be public and constructed in private?

We'll talk about that later on. It's a good question.

Now let's go ahead now and look at creating constructors. So, for example here, we have a class Shirt that has, of course, a bunch of what? Public instance variables. And then of course, as you see, we initialize them at the beginning. This was 0. This is-- we can do that too, by the way, initialize the instance variables at the beginning.

And then here, we have a constructor. Why do we call this a constructor, folks? Because it has the same exact name as what? As the class. Same as the class. And then, it returns nothing, and by the way, it's public, which means it can be called from outside.

And by the way here, it takes what? It takes a character. So it looks like this constructor initializes the character code or in this case, the colorCode, by again calling the setColorCode court and of course passing the colorCode to it.

So in this case, obviously, we want to set the colorCode and-- by the way, we call the setColorCode that we already implemented, because it ensures that an invalid code cannot be set. I cannot pass Z or D or F, and you accept it. Because we already wrote the switch statement that says it has to be what? R or B or G. Right? OK, good.

Initialize a Shirt object by using a constructor. So by the way here, based on the class that we've seen earlier, now we can go ahead now and create a new instance or declare a reference to a shirt object called theShirt. And now, of course, initialize it with the new object of the shirt, but this time we use the constructor that we already defined in the class, which is a constructor that takes what? A character. In this case, we pass G. And you see now, I can go ahead and I know that this here will be calling this constructor that takes care of business. Right?

And then after that, we'll go ahead and invoke the display method to display the information again. The display method will display the ID which is 0. It was 0. And then this will be a description acquired, and then here this one is not going to be Capital U anymore. It's going to be what? G, Capital G, because that's exactly what we did. And of course, the price is 0.0, because that's exactly what it was here, 0.0 initially. Right? Everybody's following? So far, so good. Good, good, good.

So you see now constructors are very, very helpful. Constructors help us do what? Initialize the instance fields or the instance variables of the instance that you created or the object that you created.

By the way, you can have more than one constructor. You can say, actually, we can say that we are doing what? Like we said yesterday, if we have more than one method that holds the same name with different signature, we call it what? That concept is what? Overloading. We could also overload constructors too.

So let's go ahead and take a look at this example, where in this case, we have a Shirt class. First of all, we defined constructor here that takes no arguments. And what it does, we decided that it's going to play the role of our default constructor here.

And then we have a constructor that again takes what? Takes a character. So now I am overloading the constructor. Why? It holds the same name as the class, and this one takes no arguments, and this one takes what? A character.

And also I have another third constructor. This one takes what? A character and then what? And a double. It uses the character to, in this case, initialize, in this case, the colorCode. And then it takes the price to, again, initialize.

Look what do we do here. Look what we do. In this constructor, I use this. When I use this, what it means, it means that it's calling the constructor that takes one argument which is a character. Which one? This constructor is calling this constructor. This constructor will initialize the colorCode. And the set price initializes the price. Did you see that? And I represent this through this. Everybody sees that?

So here we say you can change the constructors by calling the second constructor in the first line of this third constructor using the this key word, and then pass the argument. This is a special keyword that in a reference to the current object.

So in this case, we're saying that this third constructor uses the second constructor while we represent this through this. And then that takes, of course, a colorCode. Everybody sees that. So you are going to use "this." The "this" keyword, you're going to see it, as long as you're dealing or you're developing in Java.

So if you opted to, again, in this case, use Java in your careers, you're going to see this. So we get to see this in the advanced course. We also get to see something else, another one "super." "Super" keyword. Everybody understands the concept here? Good, good, good, good.

So remember, folks, that the technique of chaining constructors is especially useful when one constructor has some, again, in this case, perhaps quite complex code associated with setting fields. And of course, you would not want to duplicate this code to another constructor. And so you would chain the constructors.

Now we have a quiz. The quiz says what is the default constructor for the following class? Again, in this case, we have a class called Penny. And of course, it has an instance variable of type-- string called name, referenced by the reference name and initialized by the string name.

Again, what would be, again, in this case, the default constructor? Of course, it would be the constructor that holds the same name as the class and, of course, takes no arguments. And that would be what? B.

So in summary, we looked at the use of the access modifier. Now we know what? Public and private, right? We also looked at the concept of encapsulation. What's encapsulation, folks?

Making it private.

Hiding data. Making it private. Good. And of course, if we hide it and make it private, then we need to provide what to access that data or modify that data? Getters and setters, of course, that has to be public. And what it means is that private fields now, if they are private, they can be accessed only by the methods within the class.

And of course, we looked at implementing encapsulation in class. And we looked at creating a constructor. So can somebody summarize what's a constructor?

For initializing variables.

Yes. So it is a special method to initialize the instance variables, and something else too. What's special about this constructor?

They have the same name as the class.

Thank you. Thank you, [? Somi ?]. It holds the same name as the class. OK? Can you pass arguments to the constructor? Yes, you can. And can you overload the constructor? Yes, you can. And by the way, it's a special method that returns nothing. And a constructor, by the way, can be public or private. But right now, for this course, we use public.

Of course, Lesson 11 has practices too. So Practice 1 says implementing encapsulation Competition in a class. Practice 2, we'll go ahead and look at adding validation to the DateThree class. Practice 3, we create constructors to initialize objects.

So let's go ahead and-- so let's go ahead in this case and look at the details of these practices of Lesson 11 in the Activity Guidebook. So first we have Practice 1, that says please implement encapsulation in a class, and we'll give you all the details how to do this practice. See? And we give you hints and all that. And then after that, Practice 2 is a challenge.

By the way, even thought it is a challenge practice, I advise you to please do it. So they say, check with your instructor for recommendation about which optional practice to do. And the recommendation of this special instructor is to do every single challenge practice.

It does help you, folks. The more practices you do, the better you become in the Java language. And then, of course, we'll give you all the details on how to do that. Again, in this case, remember the leap year that I was talking about? It turned out that we give you the algorithm here to actually help you. Also, take into account the leap year. As you know, this year is a leap year.

And of course, Practice 3 is creating the constructors to initialize objects. Again, we give you all the details on how to go and do this practice. So let's go ahead and do these practices for Lesson 11. And then once we finish with that, we'll get into Lesson 12.

Thank you.

## 2. Practice 11-1: Implementing Encapsulation in a Class - 9m

So after looking at the lesson 11, which, of course, covered the encapsulation and constructors, let's go ahead now and take a look at the practices for this lesson. Let's start with the first one where we wanted to implement the encapsulation in a class. Again, in this practice, we create a class containing private attributes and try to access them in another class. Again, this practice has a couple of sections implementing the encapsulation in a class and accessing encapsulated attributes of a class.

For the assumption, we are given the DateOneTest Java class, the DateTwoTest, and the DateThreeTest Java class. So the first one we create a new project. And this project in this case is going to be called practice 11. And we create a Java class called DateOne and declare three member fields of type integer, which are day, month, and year and, of course, give them public access in this case to all the member fields. Then after that we open the DateOneTest class.

And of course, in the main method, what we do is we create and initialize an object of type DateOne, assign different numeric values to the member fields of the DateOne, display the value of the member fields of the data object in this DateOne object, congregate them into a single string with your choice of date formatting in this case. We should note that in this case the back slash character is a special character in the Java language called an escape character.

If we want to use it as part of your date format, then, in this case, we use two back slashes together to have one of the back slashes appear in the string, again, an example like we see here date continued to the string two back slashes next to each other and then continued to the month. That would result in a single back slash between day and month. So we can actually now looking at the solution it would look something like this if we're using the forward slash.

Again, save, compile your program. And of course, after that we'll go ahead and run it. So let's go ahead and just take a look at that. And that would be in NetBeans. So I'll go ahead and open DateOne. And you see we did exactly what they asked us to do where we created a class called DateOne. And we declared three variables of type integer. In this case, they are fields or instance variables of type integer. And we, of course, assigned them to be public, day, month, and year.

And then in DateOneTest that's where we created a new instance of the class DateOne. And then because they are public, we could actually access the day, the month, and the year fields through the date reference variable. And we assign to them 16, 10, and 211 respectively. And then we use the println statement to print, in this case, the date. Of course, if we run this, obviously, we get, in this case, DateOne and 16, 10, 2011, which is, in this case, the day's the 16th, 10 is the October, and the year is 2011.

Continuing with this practice and then after that they asked us in this case to open and create and another class called DateTwo similar to DateOne but with the fields day, month, and year. But this time we're going to declare them as private. We're going to use the concept of encapsulation that we learned in the lesson. Of course, we open the DateTwoTest class. And then we try now to access them. And of course, if we access them, in this case, we will get an error. And let's go ahead and take a look at that just to see that is actually true.

And for that let me go ahead and close these couple of files. Because we already finished with these two files. And then now we'll go ahead and open the DateTwo. And as you see, the only difference is that we now made a decision that the day, month, and year fields will be private. And then of course, in the DayTwoTest, what we do, in this case, is we write a class. And as you see here, we commented this. So if I comment this, of course, you see how now NetBeans is screaming at us and saying that we've got a problem here. And you cannot access a private field directly through the reference variable of an instance of type DateTwo.

So you see if I hover my mouse on that it says day has private access in the DateTwo. And of course, that is a problem. So that's why it would not compile. So let me go ahead and put back the again, in this case, the comments, the three lines this way we don't have to see those red buttons. And that shows us that when you declare a private field, you cannot access it directly, which means it can be accessed only by the methods within a class.

And that lead us to, actually, the next part of this practice, which in the next part we say, OK, in this task we go ahead and create now, in this case, a class called DateThree and add, of course in this case, a bunch of getters and setters to be able to access the private data so get day, set day, and so forth. Again here the hint is that most IDEs automatically create the get and set methods for private fields in the class.

Again, this is part of the feature called refactoring. And of course, in NetBeans you can take advantage of this feature by selecting, in this case, highlighting one of the private fields and right clicking, again, it and, of course, selecting refactor encapsulate fields from the context menu. And you get this, again, similar to what you see here that window that opens. And then you click on refactor. And then you click, in this case, on-- let me just going to make it slightly bigger-- it says encapsulate fields. And of course, the encapsulate fields here windows open select the get and the set method.

To check again let me go back down here. And that's where we, in this case, selecting this. So you see it here on this wizard below that says select the get and set methods check box for the remaining fields. Again, you may want to also set the Java doc setting turn on to streamline your method code. And of course, click refactor to close the window and create the methods. That's pretty much what you see here. And again, just so that you can see it a little bit better, of course, they are on your activity guidebook but you still, again, to just show you how actually this would look. So that's the idea, again, behind all of this.

And of course, after that you will see these getters and setters methods that I created for you on the fly by the NetBeans IDE. In the main method, and again we open now the DateThreeTest class. And in the main method, we declare an object of type DateThree called Date. And then could then, of course, after that using the, in this case, what are the DateThree object reference, we invoke the set method and on the month, the set months and day set here. And of course, we assign to them respectively 10, 16, and 2010, of course. And we'll try to print that.

Let's go ahead and just investigate this and how we have done this in NetBeans. And for that, let me go ahead and just to close this one here and now open DateThree class. And as you see here, you would see that you have now the private data. And now you have a bunch of setters and getters that actually will handle all of this. And then, of course, after that you have the DateThreeTest that, of course, you see here where, of course, you are using the set methods to set the month, the day, and, of course, the year.

And that works very nicely because these methods are public. And because they're internal to the class, they have access to the private data. That's the idea behind, again, doing all of this. And then you save and print. And that's what you typically get.

## 3. Practice 11-2: Adding Validation to the DateThree Class - 9m

And next, we look at this challenge practice, that would be the next one, where we add validation to the Day 3 class. In this case, again, this practice, and they typically ask you to and they let you know that you should check with your instructor. And again, my advice to you folks here is to give it a try. OK? We already discussed earlier in the previous practices that it is a good idea. The more practices you do, of course the more you learn about the Java technology language.

So in this case, continuing with the exercise in the Day 3 class, add a public, we're going to add a public set date, month that takes three arguments of the type integer. Again, these values are assigned to the day, month, and year field, respectively, as you see it in this statement here. And then perform the validation indicated in the table below before assigning the arguments values, again, in this case, to the field. So the detail is that valid values of the year between 1,000 and 10,000, valid values between the month is one and 12 and valid values for the day field would be 30, 31, 28, and 29. Aha, now we are actually looking at the 29, which is a leap year.

So the idea, again, is to create something that would look like this, using an [? if is ?] for the year. If it's strictly greater than 1,000 and strictly less than 10,000, then go ahead and assign the Y2 year, else, of course, we say it's an invalid year. And of course we create a suite statement that allows us to now, again in this case, iterate through the different months, again, one, three, five, and seven and eight, 10 and 12. Those are 31 days, which are January, March, May, July, August, and of course October and December.

And then we do the same thing for this. In this case, we should print the month or, again in this case, the number of days in the month is 31. And then we continue. So it would look something like this where, in this case, we can go ahead and say we pass the switch again, to the switch we pass the m-variable, in this case, which is an integer.

And we say for case one or three or five or seven or eight or 10 or 12, we assign, again, the n to the month. And then of course, if the day is greater than zero and strictly less than 32, then we can go, in this case, and assign a D to the day and then print that date. And look and break out. So that's the idea behind, again, doing this.

And continuing with that, now we look at also the concept of testing if it's a leap year. Again, if it's a leap year then the argument of, in this case, for Case 2 which is February would be 29. And that's where now we can go ahead and specify this. So if it's greater than zero and strictly less than 29, then we go ahead and specify that.

Now here, we're going to check if it's equal to 29. So in this case, how do we do it? The year has to be, again, divisible by four. Or the year has to be divisible by 100, or rather divisible by four and not divisible by 100. We got to be careful with this, how to read this.

So again, the first one is the year is divisible by four. And this year is a year not divisible by 100. Or again, the year is divisible by 400. Then in that case, it will be a leap year. Otherwise, we say an invalid date. OK? And the date cannot be 29 unless the year is a leap year.

And then, of course, we go through the switch statement where, in this case, if it's four, six, nine, or 11, then we know that the month has 30 days. Otherwise, of course, we say that the month is invalid. That's the whole idea behind this.

And of course, after that we add one method, again, to the class, which is display date. And this is pretty much just to display the date. So as you see, if the day's equal to zero or the day's equal to month or the day's equal to year, we say that it's invalid date. Else, we go ahead and print the month, the day, and the year. Of course, following the format that we want, determine all that here, we want to separate these using forward slashes.

Of course, we open the Day 3 test, and then we'll go ahead and test for a bunch of valid and invalid months in that case. And if you take a look at NetBeans, this is what we've done. So if you take a look at, first of all, the Day 3, you will see that we took care of that set date by writing all the code that you see. Here

The year has to be between 1,000 and 10,000. And then in case of the day has 31 days, then this is pretty much the test. And then here we test for if the year is a non-leap-day, then likely it has 29 days. And now here we test if the year is a leap year, then of course February will have 29 days. And then, of course, here we test for the months that have 30 days. And then, of course, here we go to default in case we enter an invalid value.

And of course here we have the method that displays, again. We want to make sure that we do not enter zero for a day or zero for a month for a zero for a year. That would be an invalid date. Otherwise, whatever we entered should be printed out, if it's valid.

And then down here, we now will go ahead and enter a bunch. For example, this should be acceptable. Oh, rather, this is the Year 12. So it should be, again, 31 days. So this should be, again, a problem. In this case again here, we have 14. And do we have a month that actually is 14? We know that the months has to be 1 through 12.

And then you see here also we have a problem. We don't have 35 days. And then here we have another problem, which is what? The year has to be between 1,000 and 10,000.

So if we run this, then you see that the first one, Day 16, that works very nicely. Day 12, 30, 21, again, 14, again in this case, that again is acceptable. Why? Because in this case, the month of December has 31 days. And we are on December 30. That works very nicely.

On the other hand, here we entered an invalid month, and it says an invalid month here, as you see. And then, of course, that's an invalid date. 35 is then the next one here, which again we decided that the day is 35. And of course we say that is an invalid day for the month of five, which is May. And then down here, we entered also 200, and we said that's an invalid year because we know that the number of years has to be between what? Or that the value of the year-- and we wrote it down here-- that it has to be between 1,000 and, of course, strictly less than 10,000.

So this pretty much allows us, in this case, to test, again, in our case here, our date. So as you see, the set date we created the validation code over there to make sure that we enter only the validated field. If we enter an invalid value either for the day of the month of the year, we see that we get, in this case, a message saying that it's invalid.

So of course, by running this, again, we print this out. That's acceptable. And then after that here, we get into this one. That's acceptable because here we are on the December 30, 2011.

But on the other hand, here we've got a problem. The month cannot be 14, and that's why you see the message. And here we've got a problem because the day cannot be 35 for May, which is the fifth month of the year. And then down here we got a problem with the year because we made a decision in the set date that the year has to be between 1,000 and 10,000.

And that's pretty much ends the Practice 2 of Lesson 11. Thank you.

## 4. Practice 11-3: Creating Constructors to Initialize Objects - 7m

Let's go ahead now and take a look at the third practice, or practice three of lesson 11. And in this case, we create constructors to initialize object. Again, in this practice we are going to create a class and use constructors to initialize objects. The assumptions that we assumes that the RectangleTest class, again, appears in the practice. So pretty much we have that. And we see it here in NetBeans. That creates a couple of instances of the Rectangle class. We'll see that in a while again we continue with the practice.

So first we create a new class called Rectangle with two private fields, again, of type integer. And they're called width and height. And then of course, we add a constructor with no arguments in this case. And the table shows us how in this constructor that takes no arguments. We decide to initialize the width to 25 and the height to 10. And then of course, in this case that would be the default of, in this case, we put in the message that the default rectangle created has a width of 25 and the height of 10.

Then after that, again, we use the println to do that. Now after that we add a second constructor. And this constructor takes a couple of arguments of type integer called W and H. And of course, we should make sure that based on the table that we have here that the H and W should be, again, strictly greater than zero and strictly less than 30. And of course, display a message if the numbers are invalid.

And then they asked us to use an if else statement to ensure that the values that you pass to the constructor are within the acceptable range, which is one through 29. And of course, after that we assign the values and print the message. Then so that, again, would look something like this where we have a constructor that takes the width. We make sure that they are 1 through 29. And then, of course, after that we'll go ahead and print them out. Otherwise, we'll print the message that says you have to enter an integer between again, in this case, it has to be positive and less than 30.

After that we'll go ahead and create a method called getArea that pretty much returns the area of a rectangle, which is typically the width times the height. Then after that we create a draw method that prints the rectangular shape and, again, is determined by its width and height in a series of rows containing asterisks. That's the idea behind this.

So in this case, we'll go ahead and use two nested for loop statements where, in this case in the method, the draw will go ahead and in the outer loop we use the row count to be set to zero and strictly less than the height. And then the other one iterates through the columns and each, of course, initialize column count initialize to zero and strictly less than the width. And of course, within this for loop we'll print the asterisks. And then at the end when we get out of the inner loop, we'll go ahead and print the new line and then continue to print the next line and so forth.

And they ask us to save and compile your program. And then we open the RectangleTest class. And that's where we create two instances of the rectangle, one with the no args constructor and the other one with the, again, the constructor that takes two arguments. And it should be something similar to what you see here. And then, of course, after that we'll go ahead and print the area and call the draw method to draw the rectangle, the couple of rectangles that we create. Let's go ahead and take a look at that in the NetBeans.

So first of all here's my rectangle class, again, that you see. It has, again, in this case a couple of private fields, width and height. And then we have the constructor, the first one that takes no arguments and initializes the width to 25 and the height to 10. And we'll go ahead and put a print message above that. And then after that, the second constructor that takes two integers, the width and the height, that actually goes through, in this case, the test to make sure that whatever we're entering for the width and height has to be between, again, zero and 30 strictly not included or what it means one through 29 inclusive.

And then we go ahead and use the W and H to initialize respectively the width and the height and then, of course, print them out. And else we'll go ahead and put an invalid message, again, in this case and then, of course, an error message, which is invalid. And then we have a method getArea that returns the area of a rectangle, which is the width times the height. And then the draw here that's where we use the inner for loops, again, nested for loops in this case rather. And then of course, one iterates through number of rows. And then the inner one iterates through the number of columns to, again, in this case print the asterisks in a row. And of course, in this case we are going to end up having a rectangle made of this rows of asterisks and, of course, separated by an empty line in between.

And of course, in the test rectangle we first create a new instance of the rectangle using the constructor that takes no arguments, of course. And when we draw it, we should be able to create a rectangle that is, again, in this case 25 by 10. And the reason why is because what we put down here. And then the second one in this case rather going back would be a rectangle that is going to be 15 by five and thus recalling the constructor that takes two integers.

And then after that we'll go ahead and print the area. And by the way, we're calling the draw method r1, which is a reference variable to the rectangle. And then we call draw method on r2 so we could print them out both. So if I run this, you see that pretty much this shows me-- let me just scroll up this here to see-- that the first one gives me a rectangle of 25 by 10. You see this one here. And then the second one it gives me a rectangle which is, again, 15 by five. And as you see here, we also printed the area and exactly what we wanted in this case from the rectangle test class. And that pretty much ends the third practice and the last practice of lesson 11. Thank you.
