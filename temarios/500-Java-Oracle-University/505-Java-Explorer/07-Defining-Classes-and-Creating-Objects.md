# 07. Defining Classes and Creating Objects

Define classes and instantiate them into objects to do the work of the program.

## 01. Title and Objectives 1m

Java Basics, Defining Classes and Creating Objects. In this module, we're finally going to look at creating objects and working with classes directly. We'll start by listing the characteristics of an object-- what makes an object an object? Then we'll see how to define an object as an instance of a class.

We'll see how to instantiate or create a new object and access its fields and methods. We'll see how to instantiate an array of objects. We'll describe how array of objects is stored in memory. And we'll declare and instantiate an object as a field.

## 02. Modeling Classes 7m

In this module, we'll look at modeling classes. Previously, we discussed the fact that Java is an object-oriented language and can benefit from the interactions of objects. One of the questions that come up is, how do we design and build objects for our applications?

Remember, objects have no prescribed sequence, typically, where one object can use other objects in whatever combination or sequence it needs to carry out the work of the program. And the benefits of object orientation include modularity, information hiding, the ability to reuse code easily, and the ability to maintain the application easily.

So where do the objects come from? Where does this all start? Well, technically, objects are based on classes. Objects exist at runtime. Classes are used for design. OK, where do the classes come from? Well, by performing analysis activities, we can analyze how the system's going to be used and the requirements of the system to see what the major classes or things that we're going to work with.

For example, we start with a narrative of what the actual application's going to do. Here's one function is to select and put a clothing item into a shopping cart. Another might be to inspect a clothing item and see what's the cost, what's the size, information about the clothing item. Once the clothing item's been selected, then taking those clothing items and submit them for payment-- and so now you can buy them and you can walk out and leave the store.

So this normally starts in things like use cases where we describe the interaction between the end user and the system and we look for nouns. The nouns are typically going to become classes. Those classes have behaviors and data that we need to keep to make the application work correctly.

Some terminology, then-- let's define a class. A class is a blueprint or a template or a recipe for an object. It describes the object's properties, and it has the code for the behavior. And it's used at runtime for the computer system, the Java virtual machine, to create new object instances.

So classes have properties, which are data elements which can represent the state of the object, and behaviors, which are implemented as methods, and it's where we put the executable code. Objects, however-- an object is an instance of a specific class, and it's created by the Java virtual machine in the memory part of the computer when the actual application executes.

So when we get started, we're going to do a little bit of object-oriented analysis and design with you and get you to think about, what are the appropriate properties and behaviors for the customer class? Now, admittedly, we haven't really done a very thorough analysis. We don't have use cases and all of that. But just take your best guess.

Given that you've got a customer, your customer's going to be buying items in your store, what type of properties-- what information about the customer might you want to know? And what behaviors or code might you have to have for the customer to be able to do that? Go ahead and put this on pause, think about this, and go ahead and resume when you're ready, and we'll look at some of the answers.

One possible answer might be that a customer needs a name and an address and a size, right? So if I'm a customer, I have my name, Joe, my address, San Diego, and my size, which happens to be extra large. And then behaviors-- what do I want that customer object to be able to do? Well, I need to go to the customer object and say, what's your name? For reports or for checkout or for billing, I might need to know the name of that customer.

Or maybe the customer moves and we need to change their address in our system. So we call setAddress and put in the new address. Or the customer maybe has changed their size and they're now a different size. Maybe they've lost some weight and they're a little bit smaller or gained some weight, as in my case, and are a little bit larger. So the setSize method would allow me to change the size. inspectWardrobe might be a more complex behavior that allows me to look at the different items that I have that I want to purchase.

Now, clearly some of these behaviors are definitely more complex and some are definitely more simple. But the point is that the manipulation of the object happens through the behavior. If we want to change the name or the address or the size, we don't want to let people access those variables or properties directly because they could change over time, which would break other people's code. Instead, we define an interface for this class, which is how we manipulate the class objects, call getName to get the name or setName to change the name or setAddress to change the address or setSize to change the size.

Now, we use the Unified Modeling Language, UML, as a diagram to graphically represent the structure of class. Here you can see we're using a rounded rectangle with three sections. The top section has the name of the class, Customer. The middle section has the fields. The variable name is name and the type of string.

Now, I know you're looking at that and you're saying, but wait a second, in Java, you write stringName. That's correct. The Unified Modeling Language, however, can be used with any type of object-oriented language. Could be C-Sharp, C++, other types of object-oriented programming languages. So they took a generic form of representing the name of the variable and the type.

Here we have our setSize method. We're going to have an attribute called-- or parameter called newSize of type string, and we'll return a value void. We haven't talked about return values yet, but we will shortly. We have another method, getSize, that returns a string.

So we can easily define the class name, the fields, and the methods. And modeling like this allows us to do a lot of what-if scenarios before we actually start writing a lot of code. As you might know, if you write a lot of code and you find out later that the code is incorrect, doesn't meet the specifications or requirements of the application, it can be a lot of work and very costly and time consuming to change all of that.

However, by modeling first and kind of doing back of a napkin kind of diagrams and discussions among the development team and sharing this with the users and the business, we can get closer and closer to the true requirements and therefore make sure that our code that we produce is a correct implementation of what the user wants.

The actual UML model would contain descriptions of data types, method parameters, other classes and relationships between classes, and so on. But we wanted to show you a very basic structure to get started with to give you a sense of what it's like to model classes.

## 03. Define Methods 10m

 
In this module, we'll look at defining methods. We've talked about the components of a class before. We have the class name that you see here at the top in the part of the class declaration. We have variables. Here we have name, which is a string, and size, which is a string and is initialized to the value S.

We also have methods, and methods are where the executable code reside. We have a method called set size, which if we pass it in a string called new size, we'll assign that value to the size variable, allowing us to change the size for a customer as needed. We can also find out what the customer size is by calling get size, and it returns the value of the size variable for us.

OK. So let's see what this looks like. The basic definition of a method is the method name, a return type-- methods either return a value or they don't, and if they don't, we have to signify that. And we specify whether or not that method is accessible within our class or from outside our class. Public methods that other people or other programmers or other objects can call to make our object do something are considered public, and ones that are within only our class for us to use are considered private.

It gets a little bit more into object-oriented design, and we don't really go into that here in this course. But we cover it fully in the learning subscription. There's also an optional parameter list. You have to have the parentheses, but you don't necessarily have to pass in a parameter.

Then you have the body of the method. That's where all the executable code goes. And if your method returns a value, you'll have a return statement. So a method definition-- oh, my gosh. That's a very busy screen. Let's see here.

So we have our access modifier public. So we here have a method called print wishlist. We have a wishlist, and we want to print it. Now, since it's printing to the console, it's not going to return a value. So in this case, the return type is void. That is a keyword we use when we say this method does not have a return, and it's not going to return a value to the caller.

What's going to happen is the caller is going to call printWishlist. This will execute and then return back to the caller in terms of control, but no data goes back. So here we have a string list array-- Golden Hat, Iron Boots. We have our for loop. We're going to loop through the list. Each idea is going to reference each element one at a time, and we're printing out the ideas. That's the method body.

Another example of a method is get total. Now, this one takes parameters. Notice the printWishlist did not take parameters. This one, however, if you pass in a double price and an integer quality quantity, it will multiply price times quantity times tax, producing a new total value, and then return that total a result of calling the method. Because we are returning a value and that value is a double, we indicate that the return type is double.

Now, any type can be used to describe a method parameter or return a value. And a method can have zero or more parameters. We saw an example of that on the previous slide. Now, a method with a void return type does not return a value. We still have to specify the return type, which in this case is void, but it does not have a return in the code.

You must return a value of the appropriate type. If, however, your method is not void and does return a value, you must return a value of the appropriate type. So here, for example, we have the class clothing. We have a string size. We have a fit method which is Boolean, is going to return Boolean. So if we pass a customer object to the clothing object and ask it, does this customer size fit, we can actually execute code that says, take the size of the piece of clothing. Does that size equal the customer's size?

Well, it either does or doesn't. And so if it does equal, it comes back true, and if it doesn't equal, it comes back false. So now we can take a piece of clothing and pass a customer object to it, and they can tell us if that piece of clothing will fit the customer. We can also use the getSize method to retrieve the size as a string. Notice we take no arguments because getSize works with the object that we would call it against.

And the setSize method would take a new size and return a void. It doesn't return a value. It simply sets the size. It changes the size value in the variable size to new size. And the setSize method, notice, takes a string newSize, returns a void. It doesn't return a value. It simply takes the newSize and assigns it or overrides the value that's in the current value in the size variable.

The setSize method takes an argument newSize and uses that to update or change the value in the size variable inside the Clothing object. And it returns a void. The setSize method returns nothing in this case but does take in a new size value as a string and uses that to replace the current size value in that piece of clothing, a piece of clothing object.

Now, I'm going to stop for moment because this can start seeming a bit confusing. Because you're starting to think, what object? What are you talking about? And this is one of the aspects of object-oriented programming that can be a little challenging at first-- mentally separating out the difference between what the class looks like at design time and what the object will look like at runtime. Hopefully as we go through this, you get a better sense of this. But this is one of the things for new object-oriented programmers to kind of get used to. But you do, and you'll be able to code appropriately.

So how does this work? If we look at the ShopApp class in the main method, we can see that we're creating a new variable called jacket of type clothing. And then we instantiate a new clothing object. New causes a clothing object to be created in memory, and a reference is passed back. And now jacket as a variable is essentially referencing that object.

So now, if we use measure and we ask the jacket to measure itself, and we pass a value of 12, then that specific object that's in memory is what's executing the code. It takes in the value 12, and if the value is less than 10-- it's not, so what does it return? Well, it's not less than 10, and so that piece of clothing, that jacket, will have a size of M for medium.

Then right after that, we'd like to see what the size is, let's say. So we can call jacket.getSize, which returns the size, which is M, and we can store it into our own size variable in our program. At runtime, the Java Virtual Machine has to resolve which method call to invoke on a class. The method invocation is resolved based on the method name and the types of the parameters.

Now, no two methods with the same signature can exist, even if they have different return types, because the signature is the name of the method and the type of parameter. So you see here we have a problem. We have two methods, both spelt F-I-T, fit, both of which take strings. And therefore, the compiler will now allow this to occur because at runtime, the Java Virtual Machine would not know which method to invoke.

Please note the return types are irrelevant. They're not part of the method signature. And the names of the parameters are irrelevant. It is the number of parameters, their type, and their sequence. This is called method overloading where a class can define several methods that have the same name with different signatures. The signatures differ based in the number, type, and sequence of parameters.

Overloading is very convenient for developers who are invoking methods on that class. For example, here in our ShopApp, we are going to create a new variable called jacket of type clothing and instantiate a new clothing object and assign it to jacket. Then if we call jacket.fit with a value 6, the runtime Java Virtual Machine can look down on the Clothing class and say, is there something called fit that takes an int? Oh, there is. I'll execute this code here.

Then the next line takes the jacket object and calls the method fit with a string. So again, the Java Virtual Machine looks in the clothing class and says, is there a method with fit and a string? Indeed there is, and it executes this code, and so on and so forth. By doing this, it makes it much easier for the developer to have to remember just one method call and know it can pass the correct data type, and the right method will be called.

OK. We've got a quiz for you. Here we have an object myPerson, and we're calling a method on it, printValues, and we're passing it some values. Now look at those values and think about which method declaration below correctly corresponds to this method call. Put it on pause. Think about it. And when you're ready, you can resume.

Well, the answer in this case-- if we look at the data types, printValues has an integer, then a double, then a string. Is there a method below called printValues that has an integer, a double, and a string? Let's see. Integer double-- nope. IDS-- don't even know what that is. You can't use abbreviations, so that wouldn't compile. Let's see. Integer double string-- looks good to me. Double string integer-- nope, that won't work because it's the wrong sequence. Sequence does matter. Therefore, the correct answer is C.

## 04. Scope and Access 12m

In this module, we'll look at scope and access. Variables have scope-- that is, where that variable can be seen and referenced within code. Instance variables, defined at the level of the class, store information for the overall object. For example, the price variable is an instance variable and therefore is visible throughout the entire Clothing class and object. We can reference price here. Price equals newPrice. We can reference price here in our test. We can reference price here as part of a calculation, and we can reference even return price here.

Local variables are those variables defined within a given method. So for example, fee, in this case, is a local variable, and newPrice is a local variable because it's a parameter. And parameters being passed in are essentially local variables. So we can reference fee and newPrice and use it within this method just fine, all the way up to here. We can even use it down here in the if statement. We cannot, however, use fee or newPrice down here in the getPrice method because fee and newPrice are only valid or only have scope within the setPrice method.

Variables can also have a scope of a specific block of code. So notice here, inside the if statement, we have a block of code starting with a curly brace. Ending with a curly brace, we have a couple of lines of code here. And we've defined a double discount. That discount can be used within that block, but it would cease to exist once we left the if block. So even though this is within the set price method, we would not be able to access discount, let's say here at this line of code. As soon as we exited the block, discount would be thrown away.

Now, as we start passing parameters, we run into a situation where a parameter that we pass in could be spelled the same as an instance variable. Now, personally, I find that mostly a stylistic thing, and I never do this. I make a point of not spelling my parameters the exact same way as my instance variables, and I avoid this entire slide. However, you should be aware that this is in the language and what it does.

So what this is doing, if we had a piece of code like this-- public void setPrice. Pass me a string called price, and I'll replace the value of the price variable, the instance variable with the value passed in by the parameter. Well, if we didn't have the word "this" here and just had price equal to price, it would basically set itself equal to itself in the parameter and we wouldn't see any change. By putting this dot on the front, this references a current object. So now, this disambiguates which price are we talking about.

So now, in this line of code, this.price is referring to that variable in the object. This price is referring to the parameter. So when we come down into our code, we can see Clothing item1 equals new Clothing. Clothing item2 equals new Clothing. We have two clothing objects. Now, item1.setPrice(1.99), we call the setPrice method, passing in 1.99. And this.price is referring to this price variable in this object, which would get set to 1.99. It would start at nothing, 0, and be set to 1.99.

And then item2, we call setPrice passing in 2.99. It's the same code, but it's on a different object-- same code in the class but different object. So now the 2.99 that gets passed in will set the price for that specific object. So this-- and all object-oriented languages have the idea of referencing the current object; Java uses the keyword "this"-- allows us to reference the current object and disambiguate from other parameters.

In Java, we have the ability to restrict or control access of who sees our classes, variables, and methods. This is not applicable to local variables or inside of a given method because they're not visible outside that method, anyway. We use what are called access modifiers. public says that anyone can use that parameter-- excuse me, public has a scope of class, which means if we declare a class variable or method public, all other classes can access it and use it. private is the most restrictive. It's within the same class only. So if we declare a variable or a method private, then only that class can use those variables and those methods. Nobody else can. Only public and private access modifiers are covered in this course.

Now, we use access modifiers to enforce encapsulation. One of the fundamental principles of object orientation is encapsulation. This is to make sure that we hide the actual variables that we're working with, and they cannot be accessed directly.

In order for someone else to work with our object and change the internal state of our object, they have to use the defined interface, the methods that we've created. This creates a much more stable, much more solid design. And it means that I can make changes to my design and recompile my design without breaking the code of other people who are using my code and leveraging my classes.

So here we have public class Clothing with a private double price. private means that price can only be seen within the class. Well, then, how do we manipulate it? Well, we have a setPrice method. Pass me in a new price. I'll check to see if the price is valid, and I'll replace price with the new price. There's also a getPrice method that will return a price plus price times TAX.

Now, if we look at the code in the Shop class, we can see that we have a main method. And here we call-- we create a new Clothing object, and we call c.setPrice. This works because we can pass 0.99 into the set price method, and that will change the price internally.

We can also call c.getPrice and return the value and put it in from our getPrice method and put it into a new double total variable. But if we try to access the price variable directly, it will not compile. If we try to write c.price and access the price variable directly, it fails because it's marked private.

Now, c.MIN_PRICE being set to 2.0 fails for a different reason. Yes, MIN_PRICE is public, and so syntactically that would work. But did you catch the fact that MIN_PRICE is final? Therefore it's a constant and cannot be changed. It is customary at times when we want to that we can take constants and make them public, because they can't be changed and we can access them directly. So trying to write c.MIN_PRICE equals 2.0 fails not because price is private. It's not. It's public because it's final, and we can't change the value.

We've got a quiz for you. We have a class here, public class Clothing, and we have some lines that we've defined. Take a look at the code, and ask yourself which line uses the same version of price that is declared in line n0. Put this on pause, think about this, and when you're ready, you can resume.

The correct answer is a. And let's see why that is. a says line n1. So let's take a look and see what's happening here. We want to see which line uses the same version of price that's declared here. So this is an instance variable for the class. Here, public double getPrice returning price would return the instance variable. And so that's referencing the instance variable price, and so that's line n1.

Down here, we have price, but that's a parameter. And price equal price is really setting the parameter equal to itself. We would need to say this.price to be referencing this variable. And in our findTax, we've now declared a local price variable that would basically take the place of or be seen first before it sees this price up here. When we reference price locally, the Java Virtual Machine is going to look for the first variable it sees that matches this. We just declared price, and so it's going to be the one that we're going to use. If we wanted to reference this price, again, we'd have to put this dot on the front.

One more quiz. Here we have public class Store with a main method. We're creating a new customer, and then there's a line here. We'd like to know, how would you attempt to get the item's price from line n1.

So here we have our customer. Here we have line n1. Customers have a Clothing item inside them. They have a getItem method. And Clothing has a price, which is private, but it has a getPrice method which is public. How would you do it? Think about it, and resume when you're ready.

Well, the correct answer, actually, is e, and here's why. We create a new Customer object. The clothing item, which we have to go to get the price, is private, so we can't access it directly. So cust.item won't work. That won't work because we can't reference item directly. We can call getItem, however, and that will return us a reference to the clothing item. So we can do cust.getItem. That would work. But then .price fails because price itself is private. Instead, we need to call getPrice. And therefore, cust.getItem, which returns a clothing item, which we can then call get price on to return the price of the Clothing item, works just fine. And this is a very common thing to do in object orientation. We typically start with an object, call a method on it, which returns another object, which we then call another method on.

We've got some exercises for you. And so exercise 5-1 to apply encapsulation, you'll encapsulate all the variables in both the Customer and Clothing classes, providing accessor methods, what we call getters and setters. And this can be done automatically inside of NetBeans. And taking a look at the solution in the demo that I walk through, you can see how it's done.

Use the Insert Code context menu to generate the getter and setter methods. So if I come down here and I right-click and select Insert Code and then I select Encapsulate Fields in here, then it will go ahead-- if I do Encapsulate Fields and choose all the fields, it will replace all the direct Clothing and Customer variable references in the main method of the ShopApp class with the corresponding set and get method invocations.

We also want you to add two constants to the Clothing class to represent the minimum price and tax rate set to be 10 and 0.2, respectively. Add logic to the setPrice method that ensures the price is never smaller than the minimum value. To test this, make sure that at least one item price is set to a value less than 10 in the main method of the ShopApp class. Then add logic to the getPrice method to automatically add tax. You can now remove the line of code that adds tax to price when calculating the total value in the for-each loop within the main method of the ShopApp class.

Exercise 5-2 has you overloading a method. You'll add a new method to the customer class called setSize. It should be similar to the existing setSize method, except it should accept the int measurement parameter instead of String. And we saw an example of this in the slides.

Move the switch statement from the main method of the ShopApp class into this new method in the Customer class. Change the setSize method calls within the switch to a simple size variable statement. And in the main method of the ShopApp class, invoke this version of the setSize method, passing the value of 3 as an argument.

As always, you're encouraged to try to write the code yourself and get it to work based on the examples in the coding you've seen in the slides. But there's also a solution if you want to follow along and see how this is done.

## 05. Scope and Access Demo 1 10m

Exercise 5-1, Apply Encapsulation. In this exercise, we'll encapsulate all variables for all variables in both customer and clothing class and provide accessor methods called getters and setters for those variables. We'll use the Insert Code context menu to generate getter and setter methods.

We'll make sure to select Encapsulate Fields, which will replace the individual reference with a method reference. NetBeans will replace all the direct Clothing and Customer variable references in the main method with the corresponding set and get method invocations.

Then we'll add two constants to the Clothing class to represent minimum price and tax rate. We'll add logic to the setPrice method to ensure price is never smaller than the minimum value. We'll add logic to the getPrice method to automatically add tax. And then we can remove the line of code that adds tax to price when calculating the total value.

OK, so first of all, we need to encapsulate the getters and setters for Customer and Clothing. So if we first look at the Customer class, Customer has two variables, name and size, and those variables are being accessed directly here-- for example, in the main method.

So to do this-- very simple-- we right-click and select Insert Code. Notice there's a getter and setter option. And when I choose that, I can choose that I want to do this for both name and size. So notice that we're doing it for both, name and size.

Also, we're going to choose Encapsulate Fields. If you don't encapsulate the fields, it won't replace the calls. It'll just simply create a getter and setter. In this way, NetBeans will look for all direct calls to the attributes-- to the variable's name and size and replace them with the correct set and get methods-- in this case, get methods.

Click Generate. Notice there's my getName and setName, getSize and setSize. So those are my accessor methods that access the name and size variables. That allows them to remain private so they can't be accessed directly and people can't violate the encapsulation of my class.

And you'll also notice that over here some things got changed. I thought they got changed. Let's see. Oh yeah, that's Item. So we've only done Customer yet. So here's Customer. And sure enough, c1.setName takes Pinky. c1.setSize takes S. If we come over to Clothing and then do the same thing-- right-click and Insert Code-- again, getter and setter. We want for all of them, in this case, and we want Encapsulate Fields. Click Generate. Generates getters and setters for each one.

Now, admittedly, a getter and setter isn't really doing much for you other than hiding the internal representation. But they can do a lot for you, as we're going to see. The setters can be used to validate data that's being passed in. The getters can be used to format or manipulate data as it's being passed back. If we come over here to our Shop class, then sure enough you'll see that description, price, and size have all been replaced with the setDescription, setPrice, setSize.

So it has done all that for us successfully. We've completed step 1. Now, step 2-- add two constants to the Clothing class to represent minimum price and tax rate of 10 and 0.2. Now these are supposed to be constants. So remember, we're going to use final and a special spelling convention.

So this will be private. Sorry. This will be-- yeah-- private. Let's see. They are minimum price and tax rate. So they should both be doubles. Private double min-- and we'll do this. And I actually, of course, want to do final min. Minimum tax is 0.2.

Save that. Looks good so far. All right. So now, add logic to the setPrice method that ensures the price is never smaller than the minimum value. To test this, make sure that at least one item price is set to a value less than 10 in the main method.

OK, so this gets a little tricky with the logic. And what they're asking you to do here is to compare the price that's being passed in in the setPrice method to make sure it's not smaller than the minimum value before you use it.

So we're going to start off, and we're going to-- let's see. Make sure that at least one item price is set to a value less than 10 and in main method of the Shop class. So what this is going to do is-- when we pass in a value with the setPrice method, we're going to say, if the price that's being passed in is less than the current minimum price, we'll use that.

So in setPrice, when the price comes in, we're going to look at it. Now, if that price is greater than the minimum price, then we'll use that price. If the price passed in is less than the current minimum price, which is 10, then we'll use the minimum price. In other words, if you pass in a price of, say, 3, that will be less than the minimum price, and the minimum price of 10 would get used. If you pass in a price of, let's say, 11, that is greater than the minimum price and 11 will be used.

OK, so we add logic to the setPrice method to do that. So we can come in here and write code. And we can say, for example-- we can use an if, but we can also use the ternary expression. So for example, we can say, this stock price is equal to.

So what we can do is compare price greater than min price. If the price being passed in is greater than the minimum price, then return price, and that becomes the value we set the instance variable to. Otherwise, return minimum price. There you go. Now you're making sure that no matter what price is passed in, it won't be less than the minimum price, which is 10.

Add logic to the getPrice method to automatically add tax. OK, so we're going to add tax to the getPrice method. So we need to take price, and we need to add 1 plus minimum tax. So remember, we want to do 1 plus the minimum tax. And then we want to multiply that by price. I used the wrong symbol there.

OK, I double checked and reread this. And let's take a look at the instructions. Add logic to the getPrice method to automatically add tax. Ah, to add tax, then, what we want to do is we want to take price, multiply price times min tax.

Now, if you do that, if you do that, then price times the minimum tax will be 20% of the price. Let's say the price was $10. Minimum tax would be 20% of that. So that'd be $2. We need to add that into the price. So we need price one more time.

So what we're trying to do here is we're saying, take the current value of price-- let's say the current price is $11. And then we're going to take price times minimum tax. We want that to be calculated first. So let's say $11 times 2 is 2.2. Then we add that to price, and that gets us to 13.2. So that's calculating the price correctly. So we're adding-- we're calculating the tax, price times tax. That's the tax. And we're adding that back into the price itself.

Now we can remove the line of code that adds tax to price when calculating the total value in the for-each loop. So we come back to our ShopApp for-each loop, and we can take that out, because now the calculation's being done for us. I'm just going to comment this out.

So line of the code that adds tax to price-- did I do that? Let's see. I think I did not do that. Hang on a second. Let's see. Remove the line of code that adds tax to price when calculating total value in the for-each loop. I might have missed that from an earlier exercise. I know I was doing total is equal to item plus price, but did I miss something?

Go back and take a look. Let's go back and take a look briefly. And 5-1 looks correct, and we're calculating. So this would probably will be back in Lesson 4. One moment. I will check and will come back in a moment.

OK, we're resuming. And I double checked the lab exercise, and indeed I missed something. So there was a line of code I should have added, and some of you might have noticed that. In practice 4-3, we actually took the total, and we said total is equal to total plus total times tax. And so it'll still run. It'll still work correctly. But what's happening is that we got the total is equal to total plus item price, and then we needed to add in the tax, and I missed that in the lab exercise.

OK, so if you need to, go back and add that line of code in. And if you caught it and I didn't, then good for you. I missed it going through. It is easy to miss these types of things. OK, I believe that's it. That's the end of exercise 5-1, apply Encapsulation.

## 06. Scope and Access Demo 2 5m

Exercise 5-2 overload a method. We're going to add a new method to the Customer class called set Size. It'll be similar to the existing set Size method, except it will accept an integer measurement parameter instead of a string.

Let's go do that first. So we need to come over to the Customer class and grab set Size. So here's Customer class. Here's your set Size.

And we're going to create another method. So we're going to do the same signature basically, or same definition, public void, set Size. But now it's going to take an int size, in this case, and then our curly braces. So now, it'll take an int measurement parameter instead of a string.

We're now going to move the switch statement from the main method into this new method, and use the switch code to determine the size. So we go back to shop app, and we take the switch statement, which is all of this right here. And I'm do a X to take it out, go back to customer and do a Control-V to put it in. Now notice it has a measurement. So we're using the name there.

I'm going to copy and change the parameter value, because that's really what's happening. We're passing in a measurement. We're passing in a measurement. And then we're going to check the measurement to see is it case 1, 2, 3, or 4? Now in this case, we don't have to call C1 dot set Size because, this code is executing in the customer class itself.

And we'll be executing against the customer object that we're calling it on. So all we have to do is just call the set Size method. So in this case, we're calling our own set Size method. And notice it now compiles.

So we pass-- we call a set Size. And if we pass in an integer, this method will be invoked. If we pass in a string, this method will be invoked. And what it does is it allow us to take an integer measurement, and replace the value or convert that into a string of a Small, Medium, Large, or X.

All right. We added our switch statement. Change all the set Size method calls within this switch, to simple size variable assignment, which is exactly what I did, simple set Size. Or you can even have just-- you can do that, or you can even just do this. You could just do size equals S.

You can do that as well. I tend to like to call my own setter and getter methods, even within my own class. But you don't have to do it. But one reason to do it is if you were doing something with a-- for example, size-- and with a set Size here, because this is actually, if I call set Size or call this method-- if I was doing additional code up here, and I just accessed the variable directly, I would bypass the validation logic. So I tend to use my own getters and setters.

So I did number 3 and number 4 in the main method. Invoke this version of the set Size method passing the value of 3 as an argument. So if we go back to our shop app, then right there is where we set up measurement. And now we can go ahead and we can call the customer.

And now we can do set Size with a measurement. And we'll pass on the value measurement. And there we go. We should be all set.

Right click and run the file. And I believe it works correctly. We get one back with us, Small. So that takes the measurement value. And that should set the correct value for the size for that customer.

So if the measurement is 3 on that first customer, then we should be getting size of Small, which is exactly what we get. And the customer size is Small. Are we printing the customer size? Let's see here. I don't think we actually are.

So let's do that, just to double check our work. So right here, where we're printing customer, let's go ahead and add to that. OK. Let's run it, and we'll see what we get. And exactly as expected, pinky, yes.

There we go. So pinky is a Small. Now if we were to change this, of course, test that it works-- if we change that measurement let's say to 8 and run this again, we should see a different value. And let's see. Did we get it?

Did it work correctly? Let's take a look at customer. 8 should be-- 7, 8 should be set Size out. Now that's interesting. I'm going to pause and take a look at this and see, because it should have created a customer, unless it's already been set. I'm going to take a look at this and I'll be right back.

OK. So I'm looking at my logic. I realize I'm looking in the wrong place. And maybe some of you have realized that as well. I'm actually doing a system out println the customer up here.

But I'm doing that right after I set the size to S and before the measurement is done. If I move it down here and run it, we should get the right value. And sure enough, there is pinky L. So 8 is correct. And that gives us an L.

By the way, I noticed that I wrote this incorrectly. And should be XL for Extra Large. I think it just had an X in the lab guide. But XL would work as well. And you can put that in.

OK. So with that, that completes the exercise. And it works correctly. That's exercise 5-2.

## 07. Objects 5m

 
Working with object instances. In the public class ShopApp that you see here, in our main method, we create two customer objects. We instantiate a new customer, and customer 01 points to that. And we instantiate another customer object, and customer 02 references that. So we've created two new instances in memory based on the customer class, and customer 01 is the object reference that's referencing or pointing to that object. Customer 02 is referencing or pointing to customer 02.

We have access fields here. We can say customer 01, name equals Duke. Customer 02, name equals Marvin. You'll note, by the way, that we're not observing the encapsulation in this case. We'll add it a little bit later. We can also call customer01.getName to retrieve the name or customer02.producePayment. In the class customer, you'd have all these different methods that you'd be invoking.

Now let's take a look at object instances and the instantiation syntax. The simplest syntax is simply new and the name of the class. You can also create a variable of that type, as we do here-- declare the variable and then later assign a reference to it. Customer 01 is of type customer, and then we can simply, later on in the code, create a new customer object and pass a reference back to it. Or if we know that we want a new custom object at time we declare the variable, we can do it all at the same time. Customer type customer 02 is a new customer object or receives a new custom object reference.

The dot operator allows us to access fields and methods of an object. Here, for example, we have our customer class with name, address, and size and methods of set name, get name, set size, get size, and produce payment. In our main code, we can create a new instance of the customer class and store the object reference in customer 01. We can call customer01.name when we call System.out.println, and that will retrieve the name.

Now, at this point, again, these are all public, and we're not worrying about public and private, which we would go into more detail and be much more careful about in our actual courses. Here we have customer01.size is equal to S. Now, again, we're not observing the set size, get size, which normally we would do. We can also call methods-- customer01.setAddress, pass in a value for 21 Hobbiton, or customer01.getSize.

Now, this specifically doesn't make a lot of sense because you're calling getSize, but you're not storing the value anywhere. So normally when you call getSize, it's going to return a value. You're going to store it into another variable. Syntactically, that would work, but it really wouldn't do very much.

Now, we do have the ability to have one object reference other objects as a property. For example, the customer class-- or at runtime, the customer object-- can contain within it an array of clothing items. And therefore, we will have a reference to a bunch of clothing objects which are separate from our customer object. So one object is able to reference and access another object.

So here we created a new customer. And since customer has an items array, we can go ahead and iterate through that by just calling getItems. getItems returns the items array. So now for that customer, we can iterate through the customers get items-- the items array-- looking at one item at a time, calling getPrice on each item one at a time. The 1 in this case indicates that a customer, one customer object, can have a reference to multiple pieces of clothing.

All right. We have an exercise to work with customers in clothing. We are going to add a private instance variable called items to the customer class to store an array of clothing objects. You'll provide a public method called addItems in the Customer class that accepts clothing arrays as an argument and assigns it to the items instance variable. You'll provide a public method in the customer class that returns an array of clothing items.

You will provide a public method called getTotalClothingCost in the Customer class that calculates and returns the total cost for all clothing items of this customer. Hint-- there is an algorithm that calculates the total of all clothing items already present in the main method of the ShopApp class. So consider moving it into the method within the Customer class.

Then in the main mass of the ShopApp class, pass an array of clothing items to the addItems method of the customer object. Then remove the logic that calculates the total from the for-each loop in the main method of the ShopApp class. Retain the functionality that prints all clothing object details.

Replace the printing of the total variable with an invocation of the getTotalClothingCost method on the Customer object. As always, try to do this with the code you've seen in the slides. If you need help or if you get stuck, take a look at the solution.

## 08. Objects Demo 13m

Exercise 5-3-- associate customer with clothing. We have a customer class, and we have a clothing class. And we'd like create a relationship between the two such that a customer can keep track of the items of clothing that they purchased.

So we're going to add a private instance variable called items to the customer class to store an array of clothing objects that the customer has. We'll provide a public method called addItems in the customer class that accepts clothing arrays as an argument and assigns it to the items instance. So we're going to have an addItems method.

And we'll have a public method in the customer class that returns an array of the clothing items. So what this allows us to do is add items into the array by using the customer. And then I'll be able to get that array back out to print with it or do calculations.

We're then going to provide a public method called getTotalClothingCost in the customer class that calculates and returns the total cost of all clothing items for the customer. Also, in the main method, we'll pass an array of clothing items to the add items method of the customer object. We'll remove logic that calculates total from the for-each loop. And we'll replace printing of the total variable with an invocation of the getTotalClothingCost.

Now, this is a good example of good programming practice. We don't want to do business coding, business logic, calculations and all in the main program. We want to do that in the customer class where it really belongs and simply ask the customer then for the total cost and let it calculate that.

That way, if the implementation of the customer class changes, the code that's calling the customer class doesn't have to change along with it. All right, let's start with a private instance variable called items in the customer class to store an array of clothing objects. So here's our customer class. We need a private array.

Now, some of you might have said, couldn't you just take that from the ShopApp? And indeed, I could. So you'll notice that there is a clothing array items here, but I'm not going to disturb that.

I could reuse that, but I'm going to take the clothing array items. They're named items. It could have been something else. It could be customer items.

And that will be a instance variable to store an array of clothing objects. We don't tell you how big an array to be. So let's just figure 10 just to be safe.

Now, normally, I'd initialize this. However, if we go back and look at this again, we're going to have a private instance variable inside the customer class to hold the clothing items. We're going to have an addItems method that accepts a clothing array as an argument and assigns it to the item.

So in that case, I don't have to pre-declare it. I can simply assign it or declare the size of it and all. I don't have to do that, just private clothing array items.

And then I'm going to add an addItems method. So now, public method called addItems-- and I'll just put that here. It's not void. It's going to return a clothing array of items.

Whoops, sorry, no. That is void. Sorry, that is void. This one is void, void addItems. It takes as an argument a clothing array some items and then curly braces.

All right, now, it says addItems will accept a clothing array as an argument and assign it to the items instance variable. All right, so we can then do items equals some items. I personally don't like having this dot on the front of instance variable names.

It doesn't hurt anything to do it. I don't particularly like it. I like spelling my parameter names different than my instance variable names, but that's a stylistic thing.

OK, next up, provide a public method in the customer class that returns an array of clothing items. So now, we've got our addItems. And this will return a clothing array.

Now, we're just completely going to return items. Very common thing in Java-- to put things in arrays, pass arrays around. They're very efficient to pass around.

Let's format, make sure everything looks good. OK so far and saved, great. So that's through that step.

OK, so we have both those methods. Provide a public method called getTotalClothingCost in the customer class that calculates the returns of total cost of all clothing items of the customer. Now, have we done this already?

Actually, we have. The algorithm that calculates the total of all clothing items is already present in the main method. So we are going to move it from the main method to the customer class.

So we need a new method called getTotalClothingCost. And since it's a total clothing cost, it's going to be a double, so public double getTotalClothingCost. And we don't pass in any value, but we are going to return total.

All right, now, total hasn't been defined yet. So we're going to have to do that. Let's come back over to our shop code, and let's take a look at how total was calculated. And it's right here.

Now, we already have the code to iterate through an array of clothing items. If the items size is equal to the customer, then we're going to include it. So we're going to take all this code as it exists.

The entire block of code is from here to here. So I'm going to take all of that and take that out, move it over to customer, reformat. OK, now, let's see what we need and don't need.

All right, so to finish this up, then we're going to remove the logic that calculates the loop in the main method, but we want to print all the objects. OK, so let's go back for a second, put back in what I copied and took out. So what we're going to do is we want to just print it out.

So we're going to get rid of all of this. And we're going to get rid of this. And we're going to get rid of this. We just want to print stuff.

OK, did I get that right? Let's see here. What did I miss? Well, that one would go. I pressed the wrong place. There we go.

Let's see what else we're missing. Yeah, so where does this go? That's the for statement. That's the method.

That's that main method. You can see, actually, it gets highlighted up at the top when I click on it, which is really nice. So this has to be inside of a method somewhere. I'm going to get rid of that.

And we don't need the extra curly brace now. So we do a Save. And we do a Format and looking better.

All right, so this will loop through the items and print out each item. Now, if we look at the customer class, there is our loop. And we're going to use that as well.

So going back to what we need to do, we want to get the total cost. So it doesn't say anything else about matching size or any of that. So I'm going to take that out for now.

We do need the loop, so that stays in. I don't need that. And I want to find the closing curly brace before I blank it out.

So this line gets eliminated. And I think we said that line. Is that correct? Yes, that line.

OK. So now, we have total equal total. OK, so now, we do have to define total. We haven't defined total yet, so let's do that.

And we will define total here. And we'll say that's a double total equal to 0.0. And now, we can say total is equal to total plus the item price. So we'll get all the items for that customer.

We don't have to print out, so I'll blur that out. And then total equal total plus tax, I'm not sure if we need the tax or not. I'm going to leave this in, although tax is not defined.

So since tax is not defined, how do we get it? I'm going to take that out now, because we don't know how to get the tax yet. And we're not going to do this either. We're not going to break if the total is greater than 15. And I'm just going to comment that out.

All right, so it should compile, and it does. And it should run. And we should be able to call getTotalClothingCost.

Now, to do that, in the main method of the shop class, pass an array of clothing items to the addItems method of the customer object. All right, so once we've created the array of things, we need to add it to the customer. So that would be c1 dot.

Notice there's an addItems. And now, I can add in items which happens to be the actual array. And it's able to figure that out. And so now, we passed in the array.

Next is to remove the logic that calculates total from the for-each loop in the main method, but retain the functionality that prints all the clothing object details. And that's what we have. That's all the clothing object details.

OK. Now, replace printing of the total variable with an invocation of the getTotalClothingCost method upon the customer object. So what we want to do here for each customer is we're going to also do plus comma plus. And I'm going to say-- oh, that's the item. We don't want the item. We want the customer.

So let's get rid of that. And let's get the customer where we're printing the customer, wherever that might be. I guess I moved that. And I can just recreate it.

Oh, it's right here. OK. So let's grab this guy, and let's put it inside for-loop. Let's reformat to make everything look good. There we go.

So customer is, there is the name. There is the size. Let's go ahead and add to it a comma. Let's add to that c1 dot. And now, there should be a getTotalClothingCost, perfect.

It looks like I misspelled it. And so let me come back here and just fix that uppercase L. And of course, now, it doesn't compile. But I'll fix it here as well.

OK, so now, if we run this, we should see Pinky. And we see the same customer over and over again. And that is because, oh, we're looping through the items and not looping through the customer.

So that's the deal. So remove the logic that calculates the total from the for-each loop in the main. Retained print all clothing object details. Ah, OK.

So what they want you to do here is print out all the clothing items. Now, to do that, what we did here is we added in the items to the customer. And what they'd liked to do here is just get the items back from the customer.

Now, this is a little contrived. But if you do c1.getItems, that will actually return the array. And now, we should be getting the items for the customer. So if we write this and run, we should now see Pinky.

And we see the customer numerous times, because the customer is not changing. So strictly speaking, what we need to do is print the customer once. So we're going to remove this. That will print the customer.

And now, we want to print out other items. So now, we can do system.out.println. And we can say items.

And we can say plus. And we can do item itself and item.getName somewhere-- I'm sorry, getDescription. That's it.

OK. Now, if we run this, sure enough, there's the customer Pinky. And there is the four items that they have. So the secret here was repositioning things, so that things were working and printing as you expected.

So what we want to do is print out the customer is and then their name, their size, and their total clothing cost. That causes the method getTotalClothingCost to execute. We loop through all the items that the customer has, get a total price, and then we return that total price.

Now, once we have the customer, we can call getItems, get a list of all their items. That's what comes back here. Use the item as an iterator to iterate through it.

And now, we're getting the description for each item, perfect. All right, that is everything we need to do. And that is the end of exercise 5-3.

## 09. Summary 1m

In this module, you learned how to describe the characteristics of a class, define an object as an instance of a class, instantiate an object and access its fields and methods, instantiate an array of objects, describe how and array of objects is stored in memory, and declare an object as a field.
