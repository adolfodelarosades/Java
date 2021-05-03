# 13: Lesson 13: Using Inheritance

1. Lesson 13: Using Inheritance, Part 1 - 21m
2. Lesson 13: Using Inheritance, Part 2 - 8m
3. Lesson 13: Using Inheritance, Part 3 - 13m
4. Lesson 13: Using Inheritance, Part 4 - 8m
5. Practices for Lesson 13 - 21m
6. Skill Check: Using Inheritance - Score 80% or higher to pass

## 1. Lesson 13: Using Inheritance, Part 1 - 21m

After completing this lesson, you should be able to understand and define inheritance in the context of the Java class hierarchy, be able to create a subclass, override methods in the superclass, understand the keywords, understand the effects of inheritance, the being polymorphism, understand how to use the instanceof operator, how to cast superclass references to the subclass, explain the difference between abstract and nonabstract classes, and create a class hierarchy by extending an abstract class.

I went pretty quick by that, but don't worry. Let's get going. An overview of inheritance.

So have you played through Java Puzzle Ball, the inheritance puzzles up to Inheritance Puzzle 3? As you did, I wanted you guys to consider the following. What is inheritance? And what makes these "inheritance" puzzles? What makes them different?

So I hope you've play them on your own. I'll quickly go through them just so we can all be on the same page. But I think people learn a lot more when they're able to get their hands dirty and try it on their own. So I definitely hope you guys have given this a shot.

So let's go to Inheritance Puzzle 1. And let's see what makes this different. I got to get the ball to Duke. If I press Play, the ball just goes up and nothing really happens.

All right. If I try assigning this to the green, the ball just going to go up. It's not going to touch it. So this isn't going to work I have to assign to the blue bumpers instead.

Oh, well, hey. I went to assign this behavior for deflecting the ball. I assigned that to the blue bumpers, but it's also appearing on green. That's different.

So the question is, what makes these puzzles different? What makes them "inheritance" puzzles? It looks like this behavior for deflecting the ball, I assigned it to blue, but it's being inherited on green.

OK so let's see what can I do to get the ball to Duke? I'm pretty sure it's going to go up and around. Bing, bing, bing, bing, bing. Yeah, now it's just going to go down. So it gets stuck around here. Is there something I can do differently?

OK, I think this will work now. Bing, bing, bing, bing. All right. Puzzle solved. Nicely done. Let's go to the next one.

So what can you do here? If I get the ball going, it'll just bounce off of this wall and bounce back. So I got to do something else here. Maybe I could-- if I blow it up, will that do anything? Ding, ding. It just goes down. So then I've got to blow it sideways.

Can I redirect the fan? OK, I can do that. Where does that get me? Bing, bing, bing. [EXHALE] [EXHALE] Bing, bing.

All right. So I'm almost there. It's right-- I just got to get it to bounce to the right a little bit.

So what can I do? I got the triangle wall to work with. Can I do something with that? Maybe get that to green?

Ah, so here we go. So I'm able to assign methods for deflecting the ball onto blue, have that inherited. But then I can also assign behaviors for deflecting the ball-- assign methods for deflecting the ball to green. And those aren't shown on blue. So that's only-- so that looks like it's not inherited. It's only on-- what do I call it? The child class or something?

Bing, bing, bing, bing, bing. Yeah, OK, that worked. Cool. I guess the big takeaway from this is, yeah, I can put things on-- I can give methods or behaviors to the green bumpers, not have those inherited.

All right. Let's try one more. I'll try Puzzle 3.

What happens if I set the ball going? Yeah, it just bounces off. What can I do here?

So I want to get it to-- I guess I want to have it go down a little bit, but how do I do that? Maybe this will work here. OK, but see, now this gets in the way. So I want to have it actually rotate out of the way.

So I think this will work here. Bing, bing, bing, bing, bing, bing, bing, bing, bing. See I didn't-- bing, bing.

See, I don't want these walls here. They're just getting in the way. But what can I do to get rid of them because they're being inherited?

So I need these two on the blue bumper class in order to get the ball going further south. But then when I get to the end, I actually don't want them. But there's no way to-- like, I can't uninherit them-- at least I don't think I can.

Oh, well, here we go. Looks like I can replace one of them, or override one of them. So will this work? Bing, bing, bing, bing, bing, bing, bing. Raowhr. Kapow. Bing.

All right. That worked. Nice. Those are some interesting puzzles. What a neat game.

So why do we do this? Why does all that matter? And what are some of the things that we observed?

We asked the question, what is inheritance? So when you're playing, did you notice the blue shapes appearing on green bumpers? Yes, we did notice that.

Inheritance in Java allows one class to be derived from another. A child class inherits properties and behaviors from the parent. A child class inherits the fields and methods from the parent class.

The parent class is known as the superclass. This is the official Java terminology. And the child class is known as the subclass.

From playing the game, you may have noticed, you may have observed and come to understand three key aspects of inheritance and the relationship between superclasses and subclasses. So what are those key observations?

First comes from Inheritance Puzzle 1. In the game, you may have noticed that methods for deflecting the ball that were originally assigned to the blue bumper class, that were originally assigned to blue bumpers, are also found on green bumpers. In Java, what this means is the subclass shares the same methods as the superclass..

The next thing you may have noticed comes from Inheritance Puzzle 2. In the game, green bumpers contain methods from blue bumpers plus methods unique to green bumpers. In Java, a subclass may have additional methods which aren't found on the superclass.

And a final thing you observed came from Inheritance Puzzle 3 where in the game if green bumpers inherit unwanted blue bumper methods, it's possible to override or replace those methods. What this means in Java is that a subclass may override the methods it inherits from the superclass.

So keep these observations in mind as we move forward because it will help make a lot more sense of the syntax and help you better be able to plan and design your programs around these observations and around these mechanics that occur in Java. When it comes to implementing inheritance, this is done using the extends keyword. You put this in the class declaration of your subclass.

We have our subclass Shirt. And we have our superclass Clothing. And what we want to happen here is that these methods that belong to the Clothing class, we want those to be inherited by the Shirt class.

And just because these aren't written, just because, say, for instance, display or setSize isn't written explicitly in the class, that doesn't mean we can't call these methods. In fact, we do call these methods right here. We instantiate a Shirt-- myShirt being the reference variable-- and then we call the method setSize. And this method is coming from the Clothing class.

The code works. It's totally legitimate. Here are some more facts about inheritance as far as using official Java terminology.

A subclass has access to all the public fields and methods from the superclass. And a subclass may also have unique fields and methods not found in the superclass. If you look at this example down here, in our subclass Shirt, what we're doing is we're inheriting fields and methods from Clothing, but then we're also giving Shirt its own unique fields, its own unique methods, these being a unique private integer field for neckSize. And then we have some methods, getNeckSize, setNeckSize. These all belong to the subclass, not the superclass, not the parent, not Clothing.

So here's some more information on working with subclasses and superclasses. And this is how we go about thinking about inheritance and why it can become useful. In the Duke's Choice clothing catalog, we have a lot of common behaviors, a lot of shared behaviors.

If you look at Shirts, if you look at Trousers, there is a lot of things we may need to know from both of these. We need to know the IDs. We need to know the price. We need to get the size, get the color, get the fit.

One thing we don't need from the Shirt, though, is the gender. But we do need to know that for the Trousers. So here is one thing that's not shared. But between the other stuff, yeah, there's a lot of stuff that is shared. All of these are shared. Here's our method, another method, display. That's shared, too.

So how do we normally go about writing this? We could duplicate the same code. In other words, write the same logic, type the exact same things in two different places. But that's not efficient. If we realize, for instance, we need to make a change in one place in how we implement this, then we have to make a change in a whole bunch of places. Again, that's being very inefficient.

Code duplication, this is why inheritance can become very important. However many objects we want to have, why do we need to duplicate our code a whole bunch of times for all these shared objects or all these shared methods, all these shared behaviors?

So instead, what we do is we have a parent class. And we're calling this Clothing. And the Clothing class is going to contain all the methods, all the fields that are shared. And this leads to a lot less code duplication and makes it much easier if we need to make any changes.

So if, for instance, we want to change our display method, we want to display a different sort of heading before we print out a value, we only need to make that change once. And we make that change once in the Clothing class. We don't need to make the change here and then there and then in Socks and every other item of clothing that we have. We don't have to do that over and over. We just have to do it once. This is much nicer for the programmer.

So here is an example of our Clothing class. We have a bunch of fields. And we have our constructor.

The fields are going to be inherited by our subclasses. And that's where the extends keyword comes in. We have Shirt. We extend Clothing. And then we give Shirt its own fields starting in line 02, its own field being a character for fit.

And then we have a constructor, line 04, constructor for the Shirt class. We take in a bunch of arguments. So here are our parameters, parameters for itemID, description, colorCode, price, fit.

And then here's some new syntax. Line 06 is new. We're calling super, and then we're inputting these parameters. What we're actually doing here is we're referencing the superclass constructor. And this is something you have to do at the beginning of every constructor of a child class. You have to call another constructor.

So super, all this means is it's referencing the constructor that we have one slide before, Clothing. And we're just passing in-- when we call that constructor, we have to have our ID, description, colorCode, price. All right, these are our three arguments, passive parameters for ID, description, and color and price. So this is a valid call.

Then once this code finishes running, we go back to our Shirt class. And then we continue execution with line 08. Line 08, we have the this keyword. this.fit references the current object in the variable fit. So then we're setting this value right here.

And we thought it would be helpful to put these two keywords on the same slide just to help you differentiate or make it more clear the difference between these two keywords-- super, referencing the superclass, this referencing the current class. And then following that we have methods, methods that are unique to the child class, to the Shirt class.

We put an animation on this slide to help make it more clear how the code is flowing in terms of methods being called and constructor calls with inheritance. If you look up here at the top, we have the start of our main method. And say this isn't some kind of a test class.

This is where our program execution starts. When we create a new shirt, we call the constructor. We're passing in two arguments, 20.00 and the character M for medium.

What happens is these arguments get passed down to the constructor in the Shirt class. So for price, we're going to have 20.00. For fit, we'll have the character medium. Then we have our superclass constructor call.

So the execution of the code goes from this line here down to this line here. Then we're calling the constructor on the parent class, on the superclass being Clothing. So our value price is being passed down here.

So then this becomes 20. And this is how we set the value of the fields that we're inheriting. Price is a field that's inherited from Clothing. And we're passing the value down for what we want our price to be from 20 here to the subclass constructor, then to the superclass constructor. And finally, we set the value of the field.

I may have said that the first thing a constructor needs to do in a subclass is call the constructor in the superclass. There is one exception to this. And it's when you have overloaded constructors. And I'll show you how that works with this animation.

Let's say we're in our main method. And we create a Shirt. Shirt 01 equals New Shirt. Then we pass in an argument M for medium. There's two possible constructors that we can make use of for the Shirt class. One has a single parameter for fit. And then one has two parameters-- one for price, one for fit.

Since we're only passing in one argument, the first constructor here, this is what's going to execute. But if we look at the first line here, what we're doing is instead of calling the superclass-- because, again, Shirt is extending Clothing. Instead of calling the superclass, what we're doing is we're calling the other constructor. And this is completely valid.

So code execution goes to our next constructor here. We're passing in two arguments now. So for price, we have 15.00. And for fit, we have single character M for medium.

And then, as long as we're not calling another constructor, we have to call the superclass constructor. That's done on this line. So we're passing in price. Our code execution goes here to the constructor found in the superclass. So then price is 15.00. And then we set the value of the price of the field in our superclass. And then once that's done, once this line executes, we go back up here and set the value of the fit field, the fit field being unique to the subclass Shirt.

And that takes us to Practice 13-1, Creating a Subclass. I'd like you guys to give this a try. This will be the first class you've created that deals with inheritance. And by the way, there are two parts to this. So make sure you get to both.

## 2. Lesson 13: Using Inheritance, Part 2 - 8m

Now that you've created a subclass, let's examine how subclasses override methods from the superclass. Overriding, something that we've observed before in Java Puzzle Ball, is when a subclass implements a method that has already been implemented by the superclass.

You are allowed to override methods as long as they're not private. Other access modifiers for methods that you could override are public, which means the method is accessible by anyone; protected, which means it's accessible only within the class and subclass as long as it's in the same package; and then not listed here is package access, which means it's accessible to the entire package. So all those access modifiers, those methods can be overwritten, just not private.

Additionally, you could override variables in fields. It's just not recommended. I'll talk about methods.

So let's review. Consider the three classes in the Duke's Choice clothing catalog. Here's where we had our duplication. And here's where we have all of our unique methods.

But let's say for instance with display-- display is actually a good example. display in the clothing class, it would print out all of the fields from the clothing class and that works in that scenario. But for Shirt, Shirt's a little different, because there's additional fields in the Shirt class that we'd want to be displayed. And so it would make sense to have a method in the Shirt class to somehow reflect and print out the additional information that's relevant to shirts.

Let's take a closer look at how this is implemented in Java. If you look at Line 29, we have our display method. And it's displaying the Item ID-- well, it's calling the getters, but the getters are displaying the Item ID, the description-- Item ID, description, price, and Color code. And then we have a method here for setting the ColorCode.

This is the clothing superclass. If we go to the subclass, the Shirt class, we've overwritten the display method. And the way we do this is-- there's no special keyword to be able to do this. All you have to do is pretend like you're just writing the method there. You type in public void display. And then you write the new implementation that you want, the new behavior that you want.

And so it's the same as before, except now we have an additional line right here to display Fit, because the fit is something that's unique to shirts. And you may be thinking to yourself, well, why do I have to rewrite these four lines of code. I thought the goal of inheritance was that I don't have to rewrite my stuff. I can be much more efficient.

And you can, and there's a way to do this. It's using super. It's using the super keyword. If you call super, followed by the dot operator-- actually, if you were to call-- instead of writing these four lines of code, if you were to write super.display, this would call the display method found in the superclass. In other words, it would call these four lines of code which are already written. And we do this because why rewrite the same code again?

If you look at Line 28, the reason why it may be advantageous to override setColorCode is because maybe there are color codes in the Shirt class. Maybe there are new colors for shirts that wouldn't necessarily be applicable for all other types of clothing. Before for clothing we had color codes Red, Green, Blue.

But what if we want other colors, like we want to have Yellow? We want to have Magenta. We want to have-- what else is a color? Polka dot? Not exactly a color though, but maybe we want to have our shirts reflect that. So you'd override this method in order to have the different logic, logic that would be unique to shirts.

So how does Java know whether or not to call-- how does it determine, do I call a method in a subclass or do I call the same method in the superclass? That's what this graphic illustrates. So say we have shirt.display-- we should actually have-- it was missing the parentheses and the semicolon.

So say we call shirt1.display. Java asks, is this method-- is display in Shirt? If it is, then it's going to call display in the Shirt class. What you write in the subclass is going to take priority over the parent, over the superclass.

Java will only read the methods from the superclass if it doesn't exist in Shirt or if Shirt explicitly calls super.display. Those are the only two ways. Otherwise, by default it's going to look at the superclass. I mean, excuse me. It's going to look at the subclass, the child.

So let's pretend there is no display. If there is no display in the child, then the parent or the superclass method of display is going to be called. So is it in clothing? Well, it has to be, or else NetBeans won't let you type in shirt1.display. But yeah, then we call the display method of the clothing class.

And I'd like you guys to see the effects of this for yourself, and do that by giving Practice 13-2 a try, Overriding a Method in the Superclass.

## 3. Lesson 13: Using Inheritance, Part 3 - 13m

Now that you've finished overriding a method in the superclass, there's just one other thing I felt like I should clarify. It's the subtle differences between-- and just to avoid confusion between overriding and overloading. When you override a method, that refers to replacing something found in the superclass. You replace it in the subclass. Overloading means replacing or running another version of a method. You replace that in the same class. All right. And that is the end of that topic.

I'll continue on with introducing polymorphism. Polymorphism means that the same message to two different objects can have different results. For instance, saying good night to a child may mean "start getting ready for bed." Actually, no, it means-- I'll say it means jump on the bed, because soon you have to go to sleep. And then saying good night to a parent means "read a bedtime story."

In other words, the same message, the same command, the same language results in different behaviors, different outcomes, different actions for two different types of people, two different let's say objects. In Java, it means the same method is implemented differently by different classes. And this is especially powerful in the context of inheritance. And it relies on the "is a" relationship.

Use the "is a" test to decide whether an inheritance relationship makes sense. And you'd want to do this because inheritance should only be used when it's completely valid or unavoidable. Taking a look at the examples below, which phrases express a valid inheritance relationship? Does it make sense that a shirt is a piece of clothing? Or a hat is a sock? That doesn't sound right.

Equipment is a piece of clothing? Equipment. That could be-- what could equipment be? A baseball bat. That's not quite a piece of clothing. So I'll say no to that.

Clothing and equipment are items. So clothing is item. Equipment is item. That sounds right. OK. Yeah, those are our answers. Cool.

So far you've referenced objects only with reference variables the same as a class. So looking up here at this example, to use the Shirt class as a reference type for the Shirt object, we type Shirt, myShirt being a reference variable, equals new Shirt, calling the Shirt constructor. So we've typed Shirt twice. We actually don't need to do that.

You can also use the superclass as a reference. So here we could say Clothing, set that to new Shirt. Clothing garment2 could also be a Trouser.

So why would you ever want to do this? And the answer is, it's helpful when you're dealing with inheritance, arrays, and array lists. Say I create an array of Shirts. A-R-R for array. Array1 equals-- and then we put in our shirts.

I can only put shirts into this array. I can't put trousers. Same thing with trousers. arr2, Array 2, equals-- I can put all the trousers I want into this array, but I can't put shirts.

If I were to have a Clothing array, that works. arr3 equals-- I can put all the shirts I want into here. I can put all the trousers I want into here. Why? Because shirt is a type of clothing. Trousers is a type of clothing. So both types of objects, both trousers, both shorts, they fit in a clothing array.

Polymorphism is achieved by invoking one of the methods of the superclass, in this example the Clothing class, the reference variable c1. This is a polymorphic method method call. This a polymorphic method call, because the runtime engine doesn't know, or need to know for that matter, the type of object, sometimes called the runtime type. The correct method that is the method of actual object will be invoked.

In the example in the slide, the object could be any subclass of Clothing. This could be a shirt. This could be trousers. It could be anything.

Recall that some of the subclasses in Clothing implement display implement setColorCode. So we have display setColorCode, thereby overriding those methods from the Clothing class. Here you begin to see the benefits of polymorphism. It reduces the amount of code duplication and it allows you to have a common reference type, being Clothing, a common reference type for different subclasses. And again, this is why it becomes so advantageous if you want to have-- if you have arrays, if you have array lists, you have these common set of methods you can use to work with them, the common set of methods being in this case display and setColorCode.

So when you have an example like this, Clothing c1 equals new Trousers, you are-- since your reference type is Clothing, you're allowed to call all of the methods found in the Clothing superclass. So it's totally fine to call getId. It's totally fine to call display.

It's not OK to call getFit. And it's not OK to call getGender. The reason why is because these methods here don't exist in the Clothing class. And our reference type c1 only allows us to work with Clothing. Usually this isn't a problem, because you're most likely passing Clothing references to methods that don't require access to any of these other methods here. For example, a purchase method could receive a Clothing argument, because it's needed across only--

In this code example, we have our reference type Clothing, and our reference variable c1. Even though we call the Trousers constructor, what's more important is that our reference type here is c1. Our reference variable c1 is Clothing.

What that means is the reference variable, if you call c1.getId, we can do that. If you call c1.display, we can do that. What we can't do is c1.getFit.

The reason why, c1 being a Clothing reference variable, it only permits these methods to be called here. It doesn't permit us to call the methods found in Trousers. And usually this isn't a problem, because you would intentionally have set up c1 as a Clothing reference variable, because you're preparing it for methods that would take a Clothing-type argument. For example, if you had a method that would do some sort of price manipulation, all you really care about is the getPrice method. And so it makes sense to be able to take in Clothing, any kind of clothing.

If you do need you get access to the methods found in Trousers or any of the subclasses, there's a way to do that. It's called type casting. And I know you've seen casting already with primitives. The way this is done, the syntax is very, very similar.

Say we have a reference variable c1, Clothing. That's the type that it is. Well, we can type cast that by in parentheses saying Trousers. And then we cast c1. It's just like, for instance, you would have double x equals 2.0 int y equals int x. The syntax is very similar. It's just the parentheses, what we want to cast this variable to, and the parentheses followed by the variable that we want to do.

The one exception that we have to do here is we have to add another set of parentheses. And the reason why we do that is because it makes it more clear-- well, it's a bit more than that. But as a programmer, for me it makes it a bit more clear and less error-prone when we go to call the actual method on this new kind of object that we've casted. So here we have in these parentheses, this is going to be our totally new Trouser object. And then once we have our Trousers, then we call the dot operator getFit or any of the other methods that are in the Trouser class.

It's also important to make sure that you're casting appropriately. And that's where the instanceof operator comes in. instanceof returns a Boolean. And here's an example of where you'd want to do it.

You can cast Clothing to Trousers. That make sense. It doesn't make a lot of sense to cast Clothing to Hamburger, because they have nothing in common with each other. One couldn't possibly be an instance of the other.

So if you try to do something as absurd like that in Java, Java won't let you. That's why you use instanceof. instanceof provides you with a check to make sure that your program doesn't crash or that NetBeans doesn't complain.

So here we have our if statement. We're checking to see if c1 is a instance of Trousers. If it is, then we know we can safely do the cast and there won't be any errors. Nothing will go wrong with our program since we did this check.

And I'd like you to give this is a try now. In Practice 13-3, try using the instanceof operator. And also note that there are two parts to this practice, so be sure to go through Part 2 as well.

## 4. Lesson 13: Using Inheritance, Part 4 - 8m

I'm glad you got a chance to play around with using the instanceof operator. That brings us to the end of this topic. There's one last thing we need to cover in this lesson. And that's creating and extending abstract classes.

What do we mean by an abstract class? If you think about a shirt, trousers, socks, those are concrete. Those are things that you can hold. They're tangible.

You could say to someone, give me a shirt. Create a shirt. Or give me trousers. I want socks. You can't go to someone and say give me a clothing. And you can't exactly visualize what a clothing will look like either. That's something that's a bit more abstract.

And we're able to capture that abstractness in Java as well. So what exactly is an abstract class? We use the abstract keyword to create a special class that can't be instantiated. If we were to go create a clothing, we can't do that. Likewise, if we were to go to a person and say, I want a clothing, give me a clothing, they can't really give you one either. It's too abstract. It's really more of an idea.

Abstract methods, they may contain concrete methods, shown here. You can have public int getId, return id. That looks like a normal regular method like we'd find in any other class. And you can totally do that in an abstract class.

What you can also have in abstract classes though are what are called abstract methods. These are methods that are declared but they're not implemented. Not implemented.

And when you do this, all it's saying is that, yes, I know I want there to be a method here eventually that's going to get inherited, like all articles of clothing. Sure, they're going to have a getPrice method. And sure, they'll have a display method. But the exact implementation details, maybe it's too soon to tell what that's going to be, so that's why you leave it as abstract, when you have some idea that it's going to occur but you don't know exactly how to go about that.

But something else is that when you add the abstract keyword to these methods, it means that the subclass, whatever implements it, as long as the subclass isn't also abstract, you have to implement these methods. And here's an example of that. Here we have our Clothing class. It's abstract. And we have our abstract getPrice, abstract display. These must be implemented in the subclass.

Socks extends clothing. Socks is our subclass. We have to provide an implementation of getPrice. And we have to have implementation of display. And here is our implementation right here.

And one last thing. As far as syntax goes, if you look at abstract classes, we have the abstract keyword. And instead of putting braces, we have a semicolon. Again, abstract, keyword, and then a semicolon. There's no curly braces, because when you have the curly braces, this here, this is your implementation.

So with our concrete methods, yeah, we have the curly braces right here. And then we have our implementation. So those are the key differences as far as syntax goes with abstract classes, abstract methods.

So in summary, in this lesson, you should have learned how to-- we should have learned that creating hierarchies with subclasses and superclasses helps to create extensible and maintainable code by generalizing and abstracting code that may otherwise be duplicated, allowing you to override the methods in the superclass, allowing you to use less specific reference types, for instance having an array of all clothing, all articles of clothing rater, and that would include all shirts, all trousers. It gives you the freedom to be able to do that.

And finally, an abstract class cannot be instantiated. But it can be used to impose a particular interface on its descendants, interface being here are the abstract methods or here are the methods that you must have, that must be implemented.

Your homework assignment is Practice 13-4, Creating a GameEvent Hierarchy. In this practice, you are asked to enhance the soccer league application so that it supports an abstract GameEvent superclass with Goal and Possession subclasses. But it's up to you to figure out the implementation details, although I'll show you in NetBeans the results of the program. But yeah, it's up to you to define the implementation that you feel would be best.

So here's our project in NetBeans. Its currently labeled as Practice 13 underscore-- it's currently labeled as Practice_13-4_Solution. And you'll notice that we have different classes here. We have our GameEvent. Here we have our Goal. Here we have our Possession.

When I go to run it, what you'll notice is that-- OK. We have games that are creating goals, that are creating possessions. But it's not doing it properly. And it's OK for right now. We'll actually end up fixing this in the next lesson.

But if you take a look here, what's going on is we have our possessions. We have our goals. And there's only four goals. But the program believes that there are actually six, so it's actually counting possessions as goals, as the same thing.

You'll also notice that the way it's labeling these, like soccer.Possession at 506e1b77, that's not a very user-friendly thing to print out. It's OK to do that for now, because you're able to see that it's randomly generating and differentiating goals and possessions. It's OK for right now to leave the label messy like this. That's something that we'll also revise in the next lesson. Just take a look at the instructions for this and give it a try. Good luck.

## 5. Practices for Lesson 13 - 21m

The first thing we'll do is open the Practice_13-1. Then, we'll examine the Item class and pay close attention to the overloaded constructor and the display method. Then, in the Practice_13-1 package, we'll create a new class called Shirt that inherits from Item . Then, we'll declare two private character fields, size and colorCode.

We'll create a constructor method that takes three arguments, price, size, and colorCode. And the constructor should call the two argument constructor in the superclass, pass a String literal for the description argument-- we'll have that be a Shirt-- pass the price argument to the constructor, and then, finally, assign the size and colorCode fields. Then, in the ShoppingCart class, we'll declare and instantiate a Shirt object using the three argument constructor. And then, call the display method on the object reference. And also, pay close attention to where the display method is actually written.

These steps are actually being done so we can test the code that we've written in the Shirt class. So let me pull up NetBeans. So I have the Item class up in NetBeans. And you'll notice that we have two constructors in the item class. Here's the first one.

It's a 0 argument constructer. And it looks like it's setting-- well, it calls, setID, setDescription, setPrice. It's setting them using default values.

And then, we have default values being things that we know couldn't be right. Here's "no description assigned", and 0, which isn't an actual price, but it works for setting up our object.

And then, we have our second constructor. First constructor, public item. Second constructor, public item. Named the same as our class.

So in the second constructor, we have two parameters. We have a String for description and a double for price. This constructor sets the ID. Then, it sets the description and sets the price based on the arguments that are provided-- so based on the values of these parameters.

And then the display method. The other thing to really observe about the display method is where it's written. So it's written, here, in the Item class.

The next thing we need to do is create a new class. So I right click in Windows. Right click on the package. Go to New Java Class. This is going to be a Shirt class.

I'll get rid of the comments here just to make it neater. The first thing is we have to make this subclass of Item. In order to do that, to make sure this inherits from Item, we have to type extends Item.

And we want to have two private character fields. First one being size. Second one being colorCode.

The next thing we need to do is write our constructor. So we'll write public shirt. And then, we need to have three parameters, price, which is a double, size, and we need one for the colorCode.

We also need to then set the fields for size. Set the field colorCode. So this.size references the field in the current object. And then = size for the parameter size-- here, the variable created for the method.

And then we have this.colorCode = colorCode;. I'm actually surprised NetBeans let us get away with this because you're supposed to call the Super Class constructor first. I purposely ignored it because I wanted to see if NetBeans would complain.

There's a couple arguments we have to pass, one being "Shirt", which is our description. And we have to pass in price. I'll save that. And we'll test what we have written by going to the ShoppingCart class, and then instantiating a Shirt object.

So we'll say, Shirt shirt1 = new Shirt. And let's say it's for 25.99. size medium. colorCode 'P'. 'P' for purple. And I'll call shirt.display-- shirt1.display. That's what I named it. Run that. So we have our item description, our ID, our price.

So even though the Shirt class doesn't have a display method written in it. That's OK because this method is being inherited from the superclass. It's being inherited right here from Item. And that's the end of this practice.

Practice_13-2 is overriding a method in the superclass. If you've given this practice a try on your own, and you've gotten stuck, and you can't figure out a solution, this video will provide you with a walk-through. To get started, you could either open Practice_13-2 or continue editing Practice_13-1. In this video, I'll keep editing the work that we have from before.

Then, in the Shirt class, what we have to do is override the display method to do the following. Call the superclass's display method first. And then print the size field and colorCode field. These are both found in the subclass. And then finally, run the code and notice if there's any differences in the output from the previous exercise.

I have the program here in NetBeans. This is 13-1 from before. And it wants us to override the display method, found here in the superclass. So to do that-- override it, we'll have to type public void display.

And then, we have to call the superclass display method because that method does a lot of things that we like already. We like that it's printing the item description, the ID, and the price. So I don't want to have to retype this. Even if I were to copy and paste it, I don't want to do that because, even though it is quick, if I had to go back and make a little change, I end up making the same changes twice. And I don't want to do that.

So instead, I'll just call the superclass's display method directly by typing super.display. And then, we'll add our own functionality here. We'll type-- because, now, we want to print out the fields that are associated with the Shirt class.

One other thing. They're doing-- slash t means insert a tab in a print statement. Slash t-- size.

And then, finally, slash t-- this is going to be colorCode. Save that. Let's run it. See if there's any difference in the output.

There is. So before what we were doing is we were just printing out this little part here. Now, we've extended it to include the size and the colorCode. And that ends this practice. Practice_13-3 is using the instanceof operator.

To get started with this practice, we could either open Practice_13-3 or continue editing practice Practice_13-2. In this video, I'll continue editing Practice_13-2, which is actually 13-1 because I continued editing that one, as well. So this video is for if you've gotten stuck and you can't figure out a solution. This video will provide you with a walk-through.

Next thing we'll do is in the Shirt class. We'll add a public getColor method that converts a colorCode field into a corresponding color name. So for instance, if the code is 'R, that'll return a string, "Red". And we have to include at least three colorCode color combinations. And we'll use a switch statement in the method to return the colorCode string.

Then, in the ShoppingCart class, we'll modify the Shirt object's declaration so that it uses an Item reference type instead. We'll call the display method on that object. We'll use instanceof to confirm that object is a Shirt.

If it is, then we'll cast the object to a Shirt and call the colorCode method, and then, assigning the return value String to a String variable. And then we'll print out the color name using a suitable label. But if it's not a Shirt, then we'll print a message saying, hey, this is not Shirt.

And then, finally, we'll test the code, using test scenarios to see if it's-- what happens if it's not a Shirt object or what happens if it is a Shirt object. So I have this in NetBeans. We'll continue editing what we had before.

Here, I am in the Shirt class. And what I need to do is add in a switch statement. It's going to return a String. So we have public String getColor. This will be our method and it's going to return a String. And I'm actually going to create that String up above at the very start of the method. I typed in "start" because I said "start".

String color. Now, for our switch statement. And the switch statement is going to examine the colorCode. And what should our first case be?

I'll go with the case that was outlined in the slides. So this is going to be colorCode of 'R'. And we know that it's supposed to return-- or at least set the color to-- color = "Red". And then put in a break. You have to remember to put in a break between every case.

What's our next one? Next case, how about 'B' for blue. color = "Blue"; break;. Another case. 'g' for green. color = "Green"'. So now, we're setting the color variable that we created up here. We're setting that green. break. I'll try one more scenario.

'Y' for yellow color = "Yellow";. And then break. And there's one more thing I want to include. Let's say, someone enters in a color code that's not valid. Like before, we entered in 'P' for purple. We don't want that to be valid. Maybe, they enter in gibberish. We don't want that to be valid either.

So we need a default case to handle all of these undesirable scenarios. So for default, what are we going to do? We're going to say color = "Invalid color";.

And there's one last thing we need our method to do. And NetBeans is giving us a hint, actually. If you look down here, it'll say, we're missing a return statement for this method. So we have to return a String. And that string is going to be color, which we created at the top, right here.

I saved it. And now, we're ready to work in the ShoppingCart class and test what we've written. Right now, if we were to call shirt1.display-- we have four items that are printed out here, in the description. So we know that it's calling display, found here in the Shirt class.

We have our size. We have our color code. We have our size. We have our color code.

If we were to change this-- the instructions say to change this to an item-- what do we get instead? We have size and colorCode.

So we're still calling the display method that's found in the Shirt class. [INAUDIBLE] just keep that in mind. See what happens later, if we turn this into an Item-- we turn this into an Item, that is.

Anyways, let's get back to testing our code. So what we need to do is call getColor. If we were to take shirt1 and then call .getColor, the method we just wrote, we can't do that. The reason why-- getColor-- this doesn't exist in the Item class.

The reason why we could call display is because the display method did exist in the Item class. We can't call getColor because that doesn't exist in the Item class. It only exists in Shirt-- the Shirt class. And right now, Java thinks we're working with an Item.

So in order to get this to work, we have to cast our reference, shirt1. We have to cast that to a Shirt. But in order to do that safely, we have to check to make sure that shirt1 actually is a Shirt. So that's why we need an if statement that's going to make use of the instanceof keyword.

So we have if shirt1 is an instanceof Shirt. Now, we know we can safely cast. So let's see.

The syntax for that is parentheses Shirt another parentheses. But then, we want to have this entire reference here-- this entire Shirt reference also in parentheses. That allows us to call getColor on it.

Then we'll have a print statement just to confirm that this is working. Plus color. Why is that not working? Right. It's not working because I actually had to setColor as a variable. So that'll work.

Then, we need an else statement. And the else statement is to handle what happens if it's not an instance of a shirt. And that's pretty simple. It's just an else and then a print statement saying, hey, this Item is not a Shirt. That works.

Now, let's try running it. What do we get? We have our description here with one, two, three, four-- four fields, size, and colorCode. So we know that's working properly.

And then, we have invalid color. Why is it invalid? Because we have 'P' for purple.

We didn't want that. So let's see what happens if we change to something that is a valid color-- or change it to 'B' for blue. Finally, at the end here, we have color blue. That works.

Now, one other scenario I can think of testing is what happens if, instead of a shirt, we have an item. So an item that won't be able to be converted to a Shirt. It won't be able to cast it. And let me remember what the constructor is for Item. Go back and check.

We have description and price. So description-- our description is "Not a shirt!". Very obvious description. I'll go to a store and buy "not shirt". And then we have our price.

What happens if we run this? Now what? Our display method-- it's calling the display method found in the Item class, where we just have our description, item, and price. Run that again, actually. Description, item, price, itemID.

And then, finally, we have NetBeans printing out "item is not a shirt". So what's actually happening there is we're detecting, hey, is it an instance of a shirt? No. Go down here. And print "Item is not a shirt".

So everything seems to be working. And I think those are all the scenarios that we need to test. So that brings us to the end of this practice.

## 6. Skill Check: Using Inheritance - Score 80% or higher to pass

Skill Check: Using Inheritance

View Skill Check

