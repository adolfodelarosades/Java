# 6: Lesson 6: Describing Objects and Classes

1. Lesson 6: Describing Objects and Classes, Part 1 - 16m
2. Lesson 6: Describing Objects and Classes, Part 2 - 17m
3. Lesson 6: Describing Objects and Classes, Part 3 - 9m
4. Practices for Lesson 6 - 11m
5. Skill Check: Describing Objects and Classes - Score 80% or higher to pass

## 1. Lesson 6: Describing Objects and Classes, Part 1 - 16m

Lesson 6 is on describing objects and classes. So the things we want you to come away understanding from this lesson is just to get an understanding of what objects are; what instances are; understanding of classes-- these are all pretty important keywords-- to understand how to access an object's fields, methods; how describe an object; how they're stored in memory; how you create an array of objects, and how to work with that array, how all this stuff is stored in memory.

So let's get started by describing objects and classes. So by now, have you play through Basic Puzzle 5? I hope you have. But if you haven't, I'll demo it for you. So let me just pull this up here. Launching Java Puzzle Ball, which is a game-- by the waw-- written entirely in Java, JavaFX to be more precise.

So here we are on the main menu of Java Puzzle Ball. We're going to ask you to go to the basic puzzles and go 1 through 5. I'll pick up 5 for now. And so here's a puzzle. We have our ball, we have Duke-- we're tickling Duke-- and somehow we have to get the ball from here to Duke inside his glove. So let's run it, see what happens.

That button looks suspiciously like the Run button in NetBeans. But I run it, the ball goes up, it's not going to get to Duke. So I've got to figure out something else I can do here.

I've got these things here. Maybe I can drag these around. Oh, Duke's saying drag that icon to the slot instead and they're flashing. So, yeah, OK. I drag that up there.

And let's see, what can I do with this? I can rotate it. Maybe I can get the ball to bounce off of these here and get into Duke's glove. Bing, bing. And then it just floats off into space.

So the first one works-- it goes up, it goes to the right, and it's going towards Duke. But this one here is in the way and I can't figure out a way to get rid of it. Just assign this behavior for deflecting the ball. There's no way to give it to just one; it looks like it has to appear on both of these blue bumpers. So maybe there's something else I can do.

Well, I've got the red ones and I have this icon here. So maybe I can do a bit more bouncing off of those. Bing, bing, bing, bing. All right, so we've got the ball to Duke, we solved the puzzle.

I'll go back to the slides now and explain why we did this, go over some of the observations you may have had. So we ask you to consider the following. We ask you to think about what objects you've seen on the field of play and we also ask you to think about what happens when you put a triangle wall or a simple wall icon on the blue field.

So what objects did you see on the field of play? There were a lot. There were balls-- well actually, only one ball-- there was Duke, there was level geometry or the walls, there were the red bumpers, and there were the blue bumpers that we found.

In these objects you will have noticed that the ball, for instance, could interact with any of these in no prescribed sequence. It could go bounce off of Duke-- and that'd be great, because we win-- or maybe it could go bouncing off the wall, or it could go bouncing off the red bumpers, or maybe it goes to the blue bumper, it never reaches the red bumper. There's no prescribed sequence. It could be any order.

As for our second question here, what happens when you put the triangle wall or simple wall on the blue wheel? When you do this you'll notice that a wall appears on every instance of a blue bumper objects. Here's our instance right here of a blue bumper. Here's another instance. And here you'll find that wall. It's appearing on every instance.

Walls give bumpers behaviors that deflect and interact with the ball. And all blue bumper instances share these same behaviors. As much as we wanted to, there was no way to get this behavior on one but not the other there. There was no way to do that.

If you want to try and describe a blue bumper by its properties, by its behaviors, you notice for properties, what are some of the properties? Here's a hint-- it's in the name blue bumper. We have color, we have the color blue. That's a way to describe it, by its color as a description. We have its shape-- you'll notice we have the little rectangle shape here. And likewise, if you were to look at the red ones, you'd have the star shape instead. And we have the x position and y position. This is where these instances are located on the field of play. think of a coordinate system, Cartesian coordinates in math.

But we also have behaviors. And so what are behaviors of the blue bumper? There was making the ping sound, which I made because I don't know if you guys get audio on this. But if you played it, you would have heard the audio. You also saw the bumpers flash. We also saw behaviors for deflecting the ball using the simple wall or through the triangle wall.

So why does this all matter? Because from playing you to learn any Java syntax. But I assure you that your observations are very important. And what you've seen are important aspects of object-oriented programming. One, authors can be described as a combination of properties and behaviors. Two, there are many instances-- there may be many instances-- of the same object type, because we saw many different blue bumpers and many different red bumpers; they're all the same object type, there's just different instances of them.

And three, all instances of the objects share the same behaviors. In this case, it was behaviors for reflecting the ball. But in Java, this could be any kind of behavior that we write. And we're going to go more in-depth into how to write behaviors for your Java objects.

And so another reason why this is important-- after you understand these principles conceptually, after you learn by doing, learn through playing-- it's simply a matter of translating your ideas into Java syntax and into Java terminology. It becomes so much easier to do that, to understand all this technical content, once you get your hands dirty and experiment and play. So just moving forward, remember these observations. Because as lessons and exercises become increasingly technical, your observations are going to come in handy to try make sense of what's going on, to make sense of all the technical details.

And additionally, your challenge as a Java programmer is going to be similar to what you faced playing Java Puzzle Ball. Because when you're a programmer, what you need to consider is in your program what type of objects may exist in your program. You have to consider the properties and behaviors of these object types. And to design your code with the understanding that every instance of an object will possess the same behaviors and the same properties.

And some behaviors may not be appropriate for the given object type. In the last puzzle that we did, if we assign a triangle onto the blue bumper, that would be inappropriate in the sense that it doesn't give us the solution that we want, the solution being the end result of getting the ball to Duke.

In your Java programs, it may be something else. Or let's say you have a shopping cart. Your shopping cart is supposed to be responsible for containing all the items. It would be inappropriate for your shopping cart to have money. That would be something for a wallet class, or some sort of payment class, but not the shopping cart which is strictly for items.

And additionally, finally, just consider how objects may interact. That will help you figure out what behaviors these guys need to have.

So getting deeper into Java. Remember-- we said that Java is an object-oriented language, which means interaction of objects occur and there's no prescribed sequence for how these objects may interact.

So let's look at another scenario. I talked a little bit about a clothing catalog in this lesson and in previous lessons. So here I'll set up a scenario for you and I'll show you how these observations in this scenario can be implemented using actual Java syntax. So we have Duke's mother right here. This is Mrs Duke. And here we have Duke. Duke is the Java mascot and has been the Java mascot since the days of Sun Microsystems, were Java was created.

So in this scenario we have Duke. He has his Duke's Choice clothing catalog. And his mother is his best customer because she finds his clothes absolutely adorable. But there's a lot of steps involved in the Duke's Choice ordering process. You have Mrs Duke, she finds some items that she likes, she fills up her shopping cart. The next part she decides, oh, I like these, I'll check them out. And as she's checking out, she decides to use her credit card to submit her payment. And then finally she takes the items home and she's happy with them.

So in this scenario we noticed a lot of different kinds of objects. And these objects could be physical, they could be conceptual. A shirt, for instance, a shirt is physical, it's tangible-- you can touch it, you can do things with it. An account may be conceptual. You can't physically hold a user account on an online catalog. But you know it exists, and it's going to contain-- in this case, it's going to contain payment data or data on the clothes in the catalog. Not something tangible, something conceptual.

Objects are also going to have properties. If you take a look at Mrs Duke, her name, Mrs Duke, that's a property, her name. If you look at a shirt, the shirt's color is red. That's a property of a shirt, it's a way to describe it. So here we have size, we have shape, we have name, we have color, any sort of way to describe an object.

Objects are also going to have behaviors. In the case of Mrs Duke, she was shopping. She decided to put the items in the cart. She decided to pay for those items.

When you're writing your software, you have to design these classes. If you have a class that represents Mrs Duke, a class that represents a person or a customer in general, they need to be capable of these behaviors-- of shopping, of putting items into a cart, of paying. And every customer is going to be capable of these behaviors.

And what you'd have in Java is what's called a class. A class is a blueprint or a recipe for an object. And from this class here, which is made up of properties and behaviors, you're able to create instances of different customers, instances of different customers in the customer class. Or it could be instances of blue bumpers, it could be instances of whatever you name your class, whatever you design your class to be. You can do what's called instantiation, or creating instances.

So here we know what we want our blueprint to be. Our blueprint is going to be of customers. And then we create all these different instances. Here is a very gentlemanly customer. Here we have Mrs Duke. And looks like we have someone that likes to go hiking. The important thing to remember here is that you have your class, it describes the properties and behaviors. And you use it to create instances of objects.

Now I'll go more in-depth into fields and methods. These are two terms that I haven't used yet, but I'll explain them in a minute. So looking more closely at this scenario, if you look at a customer, what are the properties and behaviors of a customer? If you look at properties, what can you think of? How about we could have a name, we could have a customer's address, we could have their age, we could have their order number, or we could have their customer number-- customer number being, you could also say, their account number, some sort of unique integer identifier as a property, that's fine.

We also have customer behaviors. What are those going to be? What kinds of things can customers do? How do they behave?

Well, a customer may decide to shop. They may need the ability to set their address. If they decide to move, you have to change that. So that's why you need the ability to set the address. They could add items to the cart. They could ask for a discount-- I'm a loyal customer, I need a discount. Or you could decide to display customer details.

So what does this look like in terms of actual Java syntax? We've done the work here of mapping out what we want things to do. Now we just have to translate that into Java syntax.

And so this is how it could look. This is your introduction to Java syntax as a class. Up here at the top, this is where we have our fields, which are also known as properties or attributes. Fields is just the official Java terminology, but if you keep calling it properties, it's not inaccurate. There's just a more technically accurate way to do that to say it in the context of Java. So fields is the official word. If you look at the behaviors, those are known as methods. And here we have the syntax for that.

And finally, the only other thing to be aware of is what's called our class declaration. Here in line one, which is public class customer-- it's convention you have your fields at the top and then you have your methods down below. I'll go more into detail on fields and methods coming up one by one.

But even when you're typing your code, it's important to map out what you want these things to be. Even if it's just quickly writing it down, you want to know what your class is going to be, you want to know what your fields are, you want to know what your methods are. Just think to yourself plan ahead, carefully consider the design of how you're going to go about implementing things.

And this is where I want you guys to take over. I want you guys to start on practice 6-1, creating an item class. So this will be your first official Java class that you write. So open up NetBeans and good luck.

## 2. Lesson 6: Describing Objects and Classes, Part 2 - 17m

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

## 3. Lesson 6: Describing Objects and Classes, Part 3 - 9m

Now that you've finished Practice 6-2 and been able to modify the shopping cart to use and work with the Item fields in the Item class that you wrote, I'll take this time to talk a little bit more about working with arrays. So did you know that arrays are objects? I sneakingly got you to work with arrays-- with objects the whole time. Arrays are handled implicitly by the Array object. The Array variable is an object reference, not a primitive data type, which means it needs to be instantiated just like all other objects.

So there's a couple ways of doing this that I've already shown you. You are able to do it throughout a couple lines, where first, all you've got to do is say what you want the size of your array to be, and then in the subsequent lines, you say, OK, let's individually set each array element, or you could do it-- take advantage of a shorthand way of doing this. Do it all on one line.

Going a little bit deeper, let me just show you, here it is again. We're using strings this time. You could do it all on one line, or you can do it over multiple lines. Going a little deeper, you'll notice that, hey, it's the new keyword. That's important, because that appears when you're creating new instances. So that's sort of your little hint that yes, arrays are, indeed, objects after all. What's not permitted, though, is if you try to treat an array, declare and instantiates, closer to how we do with other types of objects. Something like this isn't going to work.

So there's no new tricks when it comes to declaring and instantiating arrays. What you know is enough to work with it. So just be aware of not doing this thing that I'm just showing you now not to do. Just don't confuse yourself in the future. Taking a closer look at how arrays are stored in memory, so I said before that arrays are not primitive, so what's a primitive would be an integer. It would be a Boolean. It would be a float. An array is an object, so when you create an array like in this line, what you're doing is you're just-- in the stack memory, you're just pointing to where the real information is being stored in memory, where it's being stored in the heap memory.

If you want to compare-- this is where it gets pretty interesting or a little bit more complicated. If you have an array of objects, you can do that too, by the way. You can have an array of primitives. You can have an array of objects. So here we have an Item object. We have some Item class written somewhere else in our code. New item, new item, new item-- hm.

So that's actually what it references, by the way. If you just do new item, you can do items, items zero. These don't go away, and the reason why is because you really do have a way to reference them. And that's what this is right here, reference item zero. That's all because you have this Items array. This doesn't go away. You have something pointing-- this is what's pointing to these new items.

So if you take a look in memory, the simplest view is you have one item. You have the object created. You have the reference, the pointer that's pointing to where it is in the stack memory. There it is right there. If you have an array of these, you'll have your pointer here, and that'll point to an array of pointers. And those pointers are pointing to other kinds of data.

So actually, if you want to do this, if you want to get more specific and reference these individual items, what you'd have to do is write-- let's see. It's Items zero, dot, and let's say price. So that's how you would end up getting this number right here. That's found in the heap memory.

I want to quickly introduce this soccer league use case. The soccer league application-- we designed the this to be longer, more open-ended homework assignments, where at the end of each lecture, starting with lecture six, we provide an open-ended challenge, open-ended homework, where we give you the information that you need to be able to find the solutions to these practices. But the actual implementation details are up to you.

So starting with lesson six, you'll be working on the soccer league application, and a few of the things that the soccer league application will do over time as we build it up are you'll form any number of soccer teams, each with up to 11 players. You'll create an all-play-all league. You'll use a random play game generator to generate test games, and finally, determine the order of teams at the end of the session.

The output for what you're going to create would just be found in the output window of NetBeans right here. Well, not here. This isn't actually NetBeans, but this is the output window. And you'll see the results of your running code as text, and be sure to commit your homework assignments to the repository when you're finished.

You don't need to do that for the smaller exercise that we've done earlier in this lesson, the ones that were just about the shopping cart, the smaller ones in NetBeans. What you do need to worry about, though, are these homework assignments, these larger practices that are found at the end of each lesson. And eventually, towards the end of the course, your application will take advantage of web services. And what that means is coordinating the application between the client and the server.

So to summarize, in this lesson, you should have learned how to describe the characteristics of a class. [INAUDIBLE] putting checkmarks is an achievement. Great job learning this. Define an object as an instance of a class. Instantiate an object, and access its fields and methods. Describe how objects are stored in memory. Instantiate an array of objects. Describe how an array of objects is stored in memory, and finally, declare and instantiate an object as a field.

The only thing left to do as far as this lesson is concerned is to let you get started on Practice 6-3. This is where you'll start creating the soccer league application, and the goal of this is to begin creating an application that describes the objects that you're going to be working with, and start writing those classes. So you're told what basic objects must be modeled by figuring out the implementation details, figuring out the best way to go about doing this. That's up to you.

## 4. Practices for Lesson 6 - 11m

This is practice 6-1, Creating the Item Class. I hope you've tried this on your own. But if you got stuck, I'll provide you with a walk-through in this video. The first thing that we have is open the the project, Practice 06-1, and then create an item class as a plain Java class. I'll walk you through how to do that. Just get that from the menus.

And then once we have that actual class set up-- actually, after we set up the .java file, we have to create some public field, these fields being an integer for an ID, string description, double for the price, and quantity. You won't be able to test what you've done in Item class until practice 6-2. What we're doing right now is just setting things up for that until we learn how to go about instantiating our objects.

So let's get started in NetBeans. I've already created the project here. So the first thing we need to do is I've gone to the package in Windows. I'll right click, go to New, Java Class. And this Java class is going to be the Item class. Click Finish. And that should appear for us. Whoa, that's a lot of stuff. I just wanted to remove those so we can get started.

So we have a couple fields that we have to do. The first one is Public Int Item ID. Second, Public String Description. Our next is going to be a price. That's a double, so syntax for that is Public Double Price. Last one is Quantity. So that's going to be a whole number, because we wouldn't want to have like half a shirt or something. So that is Public Int Quantity, semicolon, and that's it.

This is practice 6-2, Modify the Shopping Cart to use Item Fields. If you try this on your own and gotten stuck, I'll provide you with a walk-through in this video, but I do hope you try it on your own, because there's a lot of learning that can be done from that. So what we'll do in this video, what I'll do in this walk-through is first we'll continue editing Practice 06-1. We could also open up Practice 06-2. We could open up that project, but I think I'm going to go with this one-- keep editing what we have.

So what we want to do here is create a new Java Main Class called Shopping Cart. This class contains a single main method, and the rest of this exercise is going to be spent on modifying that. Three, we're going to do declare and instantiate two objects of type Item. Initialize only the Description field for each using different values for each.

Four, we're going to print the description for each item and then run the code. I'll go through the optional step two. This is step five. So above the code that prints the descriptions, we can see what happens when we assign item2, assign that reference variable to be item1, and then run it again. So let's get started in NetBeans. I still have the project up from before, 6-1. So what we need to do now is end this package on Windows. I'll right click, New, Java Class. I'll right click on the package, go to New, and I want a new Java Main Class, which I don't see here.

So in that case, I'll go to Other, and here we go-- Java Main Class. That's what I want. Next-- and this is going to be Shopping Cart. And just to reiterate, the beginning of your class, by convention, it starts with a capital letter, and it's also camel case, so any new word is going to be capitalized as well. So I'll call this Shopping Cart. Click Finish, and here we have our Java Main Class. I'll just clear out some of these comments for you just to make it neater. And it's called the Main Class, because we have our main method.

So what do we need to do here? We need to declare and initialize two item objects. Let's get started doing that. We have item1. Items are type. Item1 is going to be the reference variable. That's going to equal a new item. What'd I goof up there? Why is it complaining? Tell me why, NetBeans. Oh, OK. It's expecting the parentheses. Yeah. Got to add that. And let's do the same thing for another item. Item2 equals new, item in parentheses this time. So now we have our two objects. What's the next thing we have to do? We have to assign a value to the description of each item.

Right so for item1, we'll do item1, and then we press dot, the dot operator. And look. All these are available to us now. So I'll go with description. That's what I want. I press Enter, or you could just type in D-E-S-C. So you have item1.description, and I want to set that to be a shirt, semicolon. Item2.desc-- that's going to equal some pants.

And let's try printing these out now. S out, and I press Tab. And we have our print statement. I want to say, item1 is going to be-- I want to actually print the description out, item.desc. All right, item1. I keep goofing up the name of the variable. I tell you Java's very picky about what you name things. About misspellings, that is.

And then we have system out, item2. That's going to be item2.desc. Yeah, that looks right. So now let's run the program. Oh, right. We have to tell it what we want our main class to be. Well, we want it to be Shopping Cart, of course. Here we go. If you look below in our output, we have item1, the description is shirt. Item2, the description is pants. So now there's just one more step that you have to do. It's the optional step to say, hey, what happens if we set item1 to end item2? What happens if we set item1 to be item2? So let's do that.

Item1=item2, semicolon. So we should get the same when we run this. Yes, item1 is pants. Item2 is pants. We have two reference variables here that are pointing to the same object. So the object that had this description as shirt, that one completely goes away. And we're left with two references to the same object. And we're pointing the description to that same object, which happens to be pants. And that's the end of this practice.

Welcome to the workforce. We have an exciting new project for you. Our client is a regional soccer league. They're asking us to create an application for their league that will track the statistics and rankings with an all play, all league. I want you on this project. What that means is in this practice, you're asked to begin writing an application that will attract the statistics in a soccer league. You're told what basic objects must be modeled. But figuring out the implementation details, that's up to you to figure out on your own.

So the details on what you need for this are shown in the Activity Guide, which should be this document here. When you consult this document, you'll see the requirements that your program needs to have. So you'll see that we need a player class, team, goals, game, league, and all the details are available to you. The actual solution is going to be up to you, so I'm not going to cover. I'm cleverly hiding the solution by the output window. But what you should get at the end is when you go to run your program, be able to print the names of the people on the team and the goals that have been scored.

So again, implementation details are up to you. It's up to you to figure out how all the features can be best implemented. You have everything you need to know to be able to complete this assignment, and much like the real world, figuring out the implementation details is up to you. There's just one more thing I'll add, which is we also mentioned that we want this committed to the Git repository.

So for that, we recommend creating a soccer league project here somewhere within your Git repository. And the reason why is because it takes advantage of version control, because each assignment like this, each practice, each big practice at the end of the lesson is going to be you iterating, and improving, and evolving the soccer league application. So each time you do this assignment is an opportunity to commit to iterate on the project that you have. So definitely make sure you do that. Take advantage of the Git repository. And with that, good luck on this assignment.

## 5. Skill Check: Describing Objects and Classes - Score 80% or higher to pass

Skill Check: Describing Objects and Classes

View Skill Check
