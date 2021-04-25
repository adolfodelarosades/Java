# 08. Working with Objects

Manipulate objects via references, how objects are stored in memory. How to initialize objects and use data and behavior that apply to all objects.

## 01. Title and Objectives 1m

Java Basics, Working with Objects. In this module, we'll take a look at how to work with object references in more detail, become familiar with memory allocation for objects, initialize objects using constructor methods, and work with static methods and variables.

## 02. Working with Object References 11m

In this module, we'll look at how to work with object references. An object references a variable that has a reference to an object in memory. Here, we see that we have a TV remote control class, and we have remote1, which is the variable name that will store the object reference.

We create a new TV object here with new TV. As we've said, "new" instantiates the object. So now we have a new TV object, and remote1 is acting as an object reference to point to that TV object. If we call the on method for the remote one, it will turn the TV on. So remote1.on would turn on the TV.

Here, we can see that we can have two remotes, both of type TV. remote1 is of type TV, and it will be pointing at a new TV object here. We have the second variable, remote2, which will also be pointing to another new TV object here. So now you can see we have two separate object references-- two separate objects, two separate variables, two separate object references. If we issue the on method for remote1 and call remote1.on, this TV will turn on. If we go to remote2 and call on, this TV will turn on.

Now, that might not be very surprising for you, but we'll see some differences going forward. In this example, we create a new variable, remote1, of type TV, and we instantiate a new TV object and pass the object reference to remote1. remote1 is now pointing to the new TV object. We create another variable called remote2, also of type TV, but in this case, we assign the object reference in remote1 to remote2.

Now, when we issue remote1.on, the TV turns on. And it happens to be the same TV object that remote2 is pointing to. So now, if we issue a remote2.off, the TV will turn off, because both variables, both object references, are pointing to the same physical object.

In this example, we're going to see that there's a new type of remote-- a camera remote. . So here we have a camera class, and remote1 would be a variable of type camera. And we point it to a new camera object that we instantiate here. And remote2 will be of type TV, and we'll make it point to a new TV object that we instantiate here. So we now have remote1 pointing to the camera and remote2 pointing to the TV.

Now, if we call remote1.on, that would turn the camera on. If we call remote1.record, that will cause the camera to record. And if we call remote1.off, that will turn the camera off.

If we go to remote2, we only have two methods here, on and off, to turn the TV on and off. Now, we'll come back to this and revisit this in a later lesson when we talk about object-oriented analysis and design and see how these two are related and what we can do to leverage them. Because clearly, if you look at it, they're related, right? Both cameras and TVs can be turned on and off, but cameras can also record. Think about what we talked about, inheritance and more specialized behavior, and we'll come back to this in a later module.

Let's take a look at how variables and object references work within memory. There are two areas of memory created by the Java Virtual Machine when it starts-- the stack and the heap. Variables are stored in the stack. The heap stores objects.

So first of all, we create a new variable of type double, and we assign the value 3.14. That gives us a total variable in the stack with a value of 3.14. Then we're ready to create an object.

Now, in this case, we create a new clothing object, and new objects are created on the stack. The structure of the object is determined by the class, and the class, in this case, indicates that it has a description, a price, and a size. So the Java Virtual Machine allocates the memory for the object and assigns the hexadecimal value of where that object lives in memory to the actual object reference.

So in our case, the object reference is effectively a pointer to the object structure on the heap. Now, if we issue item1.description = "Jacket", it'll change the description to jacket. If we issue item1.price = 15.5 and itemsize = "M," you can see these change in the object.

So the object reference is here. And when we issue a method against it, it's able to find the object in memory. Now, we do this again with item two, and we create a new clothing object. So a new clothing object is allocated. But right now, because of how the class is designed, when the object is instantiated, the description is null-- hasn't been given a value yet-- the price is 0, and the size is null. We'll see how to deal with that a little bit later.

So what we do is we issue item2.description = "Socks" to this item2 object here, and that causes the description to change to Socks. Now, let's take a look and see what happens when we start working with multiple objects. If we assign the object reference of item1, which was 34009, to item2, then both variables will have the same object reference, and both are referencing the same physical object in memory.

If we issue item2.price = 2.99, then the actual value will change to 2.99 on the total as we-- excuse me, item price would change to 2.99. We don't see it here, but it would change to 2.99. And we can set total equal to item price, and then total becomes 2.99.

You might be wondering what happens to the object over here, 99f311, that was being referenced by item2. Well, if there's no other object reference that's referencing that object, then that object can be garbage-collected, recovered by the Java Virtual Machine, if necessary.

Now, we've mentioned before that arrays are actually objects. You can have an array of ints, of primitives, or you can have an array of objects. But the array itself is an implicit array object, and the array variable is an object reference. It's not a primitive data type.

So what that means is when I create an integer array called items, I'll have the variable items here, but the physical array is allocated on the heap as an object. And we can see index 0, 1, 2 has the value 1, 5, and 6 respectively. Now here, if I create an integer variable called size and ask it for what's the value in item sub 1, then the value of 5 that's currently at position 1, index 1 in the array will be copied into the size variable.

So with arrays, because they're objects, they have to be instantiated just like other objects. And you can either do it with new, or do it with a convenience by actually typing in the values at the time you create the array. So what does this look like when we're storing arrays of object references?

We'll start by creating a new array called Items, which will be an array of clothing objects. Then we'll instantiate two new clothing objects and assign it to the array at the time the array is declared. So here we see on the stack is the Items variable, and it has a reference to the array in the heap, the array object. And the array object has two elements, 0 and 1, pointing to the two objects that were created.

So the first new clothing object here was created as 074 here, and element 0 is pointing to that, and it gets the value for it. So notice, the actual object reference for the object is in the array. Also, the second new clothing object is created 99f311 here and stored in index one of the array.

Now, if we issue item0.description = "Jacket", then Items is the array, and it will point to the array itself, and then the items of 0 would be this object in the array, and we're telling that object to change its description to Jacket. We can do the same thing with price. Go to items.0, which would be this element, and then change the price, and then change the size.

Now, if we issue item sub 1, that description equals Socks, then the object pointed to by the element 1, as we see here, will change to the value Socks. Notice that the price is still 0 and the size is null. And we'll see how to deal with that in a later module.

All right, let's take a look at a quiz. So here we have our clothing array items, and we have two new clothing objects. And we say items of 0 description equal "Jacket", item sub 1 description equals "Socks". Look at the code and try to figure out which gets printed when this code is executed. Go ahead and pause the recording, and resume when you're ready.

All right, the answer is e. And let's see why that is. So e says it should print Socks, Socks, Hat. Let's see what it actually does.

We create a clothing array called items we have the new clothing object, new clothing object. Items sub 0 gets "Jacket." Items sub 1 gets "Socks." Items sub 1 description gets set to the same description as items sub 1. So now what had been "Jacket" had has been replaced by "Socks." So items sub 0 is now "Socks."

If we then print that out, we'll get socks, and the socks description, and a space. So we'll get the socks. So we know it's going to be one of these three, right? At this point, we know it's not A, B, or C. It has to be D, E, or F.

Now, next up, we said item sub 1 is now equal to "Hat." So we are actually going to go in, and we're going to go to the Items Object that was "Socks," and change it to "Hat", and then print items sub 0.

Now, notice, we're not printing items sub 1. We're printing items sub 0 again. We're doing the exact same thing we're doing here. We didn't change anything, so it should print "Socks" again. And sure enough, it prints socks.

Now, the last one takes a value at item of 0 and assigns items of 1 to it. And then, say print out items sub 0. So now items sub 1 had been "Jacket", right? Here, items sub 0 had been "Jacket," and then items sub 1 was "Socks." Then we changed items sub 1 to "Hat," and now we store items sub 1 into item of 0. If we reference item 0 description now, it should be "Hat." And that is exactly what we see, and therefore e is correct.

Now, as you're falling through this, if you find this difficult to follow, you might try to, on a piece of paper, draw out the actual memory structures and the pointers, which is how I teach this one I'm teaching live and show students how to actually track what's going on. If you're new to programming and all, this can be very, very confusing to try to follow. So please feel free to draw a diagram, and show what's calling what, and use some of the diagrams you saw back in this lesson.

## 03. Constructor 4m

Here, we'll take a look at initializing objects using a constructor method. When we create a new object, one of the things we need to do is potentially initialize values for the internal variables. For example, here we have a public class clothing, and it has a description and a price. Now right now, if we create a new clothing object, then the description will be null and the price will be 0, because they're not initialized to anything.

So typically, what you're doing to get started is you'd create the new clothing object, have the object reference in item 1. And then call item 1. Set description, item 1 dot set price, et cetera, et cetera, et cetera.

Now as a convenient method, you can actually do all of that at the time you instantiate the object. This is using a method called a constructor. A constructor is a special method that's called just once at the time the object is created, and is extremely good for initialization and housekeeping in the object as the object is first created. So what we did was we have a public constructor here as you notice called public clothing. Notice that the constructor does not have a return type.

The return type is assumed to be the same type as the class. Also notice it takes no arguments, and there's actually no implementable code inside of it. It actually does nothing. And that's what we call it, a no argument do nothing constructor. But it is still required. You have to have it.

And one way or another, you have to have it in order to create the object. But you can write another one here called public clothing that takes an argument list. Here, if you pass a string description and a double price, then we can take the description and assign it to this object's description. We can take the price that's been passed in and assign it to this object's price.

This way we can initialize the object at time it's created. And that's exactly what we see here. So here, we create a second clothing object, new clothing jacket 20.99 M.

And now item two is pointing to that new object and it's already initialized. There is a lot more to this. And there are subtleties and ways of working constructors, but that's basically how it works. And if you remember, this is leveraging something we saw earlier called method overloading.

We have an exercise for working with constructors. First of all, your added constructor to a customer class to initialize the name field. And hint to do this is use the insert code context menu, right click in your code, and then select Insert Code.

And then you'll see other menu item to generate a constructor. Select the name checkbox, because we're going to create a constructor that will take a name, and it'll initialize a name for you. Then remove the invocation of the set name method for that customer object in the main method of your shop app class.

Then add a second parameter to the customer constructor to accept an integer measurement value, and invoke the set size method from the customer constructor passing measure measurement as an argument. Then modify the instantiation of the customer object inside the main method of the shop app class to use pinky as a customer name and 3 as a measurement value. In our second exercise, you'll add a clothing constructor. Add a constructor to a clothing class to initialize description and price fields.

Then add an extra parameter to the clothing class constructor to accept the value for the size field and initializes field, modify the initialization of all clothing objects in the main method of the shop app class to use this newly added constructor instead of set methods. Now as before, do your best to try to code this based on examples you've seen in the lesson. And if needed, please go ahead and take a look at the solution and follow along with that.

## 04. Objects Demo 1 6m

Exercise 6-1-- Add a Customer Constructor. We're going to add a constructor method to a Customer class to initialize the name field. We'll use the Insert Code context menu to generate the constructor methods for the Customer class. We'll select the name checkbox only.

We'll remove invocation of the setName method for the Customer object in the main method of the ShopApp class. We'll also add a second parameter to the Customer constructor to accept the int measurement value. We'll also invoke a method setSize from the customer constructor, passing measurement as an argument. And lastly, we'll modify the instantiation of the Customer object inside the main in order to use the Pinky as a customer name and 3 as a measurement value.

OK, let's take a look at the code. So what we need to do is change the constructor create a constructor for the Customer class. So we're going to add a constructor to the Customer class to initialize the name field. So we're coming over here to Customer class.

We like to make constructors at the top typically. So right-click and come down to Insert Code. And sure enough, there is Constructor. Now, when you have multiple variables you can create a constructor with one or all or any combination.

And it depends on how your object's going to be created by your end users, the users who use your classes. They may say when they create instances of the Customer, they'll know the name, the size, and that's all. They won't have the items yet. So we want a constructor with, let's say, just name and size.

If you knew the name, size, and items at the time the object was being constructed, then you could have a constructor that took all three fields. In our case, per the lab guide we're going to just work on-- use name. So I'm just going to select name and click Generate. And sure enough, it creates a constructor. Public, same name as the class and no return type. And simply take name and assign it to this.name.

Now, we're going to remove invocation of the setName method for this Customer object in the main method, because now that's being done for us. So if we go to ShopApp and we come up here, you'll notice that this line of code no longer compiles, because we now have an actual explicit constructor.

So we're going to remove invocation of the setName method for the Customer object. So right now we do have a setName method. We're going to remove that. So that's because we're going to create the Customer object and use the name at the time we create it. We're not quite there yet.

Now we go on, and we're going to add second parameter to the Customer constructor to accept an int measurement value. So off we go back to Customer. And we're going to add another value to the constructor, comma int measurement.

And we're going to invoke the method setSize from the Customer constructor and using measurement as the argument. So this will allow us to set the size. So we'll call our own setSize method. And we'll pass in measurement.

Remember from a previous exercise-- spelling counts. From a previous exercise, we replaced the setSize with one that takes an integer, and we use our switch statement to figure out what the size is based on the integer value. So in the case where they pass in a string name for the Customer and an integer measurement, we can set the size for that Customer.

All right, we did that. And then lastly, modify the instantiation of the Customer object to take Pinky and 3. So we go back to our ShopApp. We currently have-- this is currently, of course, incorrect. So we can turn that off, because that will get set for us. And now we want to put in the name, which is Pinky, and the integer value, which we'll say is 3.

So now if we run it, we should still see that indeed-- it's pinky, lowercase p. So that needs to change that. And run it again. There's our upper case P. And of course, we can change this value as well. And notice it changes to large.

If we went even larger, we can get extra large coming back. I think maybe it has to be larger than 14. Let's take a look at that real quickly. That's a switch statement.

Let's see. 5, 6, 7, 8, 9-- interesting. 14 should have caught on the measurement and we should have gotten a default size of XL. I'll have to take a look at that and see what's going on with that. One moment.

OK. So I found the error in the code. And what's going on is this is correct. This is working, and it's setting the size to extra large. However, you may have noticed down here, I set measurement and passed that in here again.

Now, if I did not do that-- that's what's causing to come out with a small. If I did not do it, there is the extra large. So I missed that line of code and had to go through and read through and try to find it. Once I did, it was fine.

OK. So at this point, we've completed everything necessary. We've instantiated the Customer object with Pinky as a customer name and 3 as a measurement value. And with it, that completes this exercise.

## 05. Constructor Demo 5m

Exercise 6-2, Add a Clothing Constructor. We'll add a constructor to a Clothing class to initialize the description and price fields. Then we'll add an extra parameter to the Clothing class constructor to accept a value for the size field and initialize this field. And then we'll modify the initialization of all Clothing objects in the main method to use the newly added constructor.

So we need to add a constructor to Clothing class to initialize description and price. So we go back to NetBeans, and we go to Clothing. Remembering what we did, come down a little bit from our variable declaration. Right-click and select Insert Code. Select Constructor. Select Description and Price. There we go. Click Generate, and there's our constructor. Great.

Add an extra parameter to the Clothing class to accept value for the size field and initialize this field. All right, so we're going to add an extra parameter to take the size. And we don't have a getter and setter for size. Sorry, we do have a getSize and setSize method, but we didn't add that in to the constructor. We took the description and the price. Here we're adding this by hand. So this needs to be a string size, I believe. Double check. OK.

And then in there, we'll go ahead and set size. I can now do my stylistic stuff. I started my object-oriented programming in a language called Smalltalk, and there, for parameters, we tended to use aSize or aCat or theCat for our parameter names, and that's just always stuck with me. Also, it means I don't have to use this dot in front of the variable name. I can do size equals aSize, and then there's no confusion about what value's being set. So this sets the size, and we can go on from there.

By the way, you may have noticed, when I was creating the constructor for Clothing, I wasn't given an option to set a value for size. And the reason for that is its size already has a value up here. It's already set to M. And so NetBeans being sees that it already has a value, so it doesn't include it in the constructor. That's why I had to do it myself by hand.

So now that I have a constructor and I know that you can create the object and pass the size in, I could actually change this and take this out, and then it would have seen it as part of the constructor. But you can do it manually, and that's just fine.

OK, so now we need to modify the initialization of the Clothing object. So if we go, now, back to ShopApp, then we'll see indeed that we have errors on the initialization of Clothing because an empty constructor no longer is defined.

So now we're going to come in here and add clothing. So in this case, we want a string followed by a price. And you'll notice, I'm doing this specifically by copy and paste to show you that what we're doing is replacing these calls to all these different variables-- or sorry-- all these different methods with the constructor call. And then I can get rid of this. Nice, right? And same thing for the next one.

OK. And then I'll do the same thing down here. So green scarf for-- let's go this one-- and five oh. OK, so we can get rid of this. And then the last one.

But now that it works, all the errors go away. And when we run it, it looks just fine. Perfect. Very good. OK, and with that, that completes Exercise 6-2.

## 06. Static 8m

Static methods and variables, there's a modifier in Java called static that can be applied to a method or a variable. Using the static modifier means that the method or variable belongs to the class and is shared by all objects of that class. It is not specific to any object instance.

For example, in the Clothing class, if we have a minimum price-- that is the price for any piece of clothing can't really be below that-- that would be a good candidate for a static variable because it's true across all object instances. It doesn't make sense to have each object instance have its own minimum price, which is going to be the same across all of them.

Now this is the subtlety in design that can be a little bit difficult to grasp, but hang in there with us. These static methods and variables can be accessed without using new. You don't have to instantiate an object to access those variables or methods. So the class acts as a kind of single point of contact for variables and methods that are true across all objects of the class.

For example, what if you wanted to keep track of how many object instances were created? That is, each time you issue new and create maybe a new piece of clothing, you want to keep track of that counter. Well, where would you keep that counter? You can't really keep it in the object itself because one object can't really see another object in that sense, but the class could have a counter, a static variable counter, and we could increment that counter every time we issue a new.

For example, a static variable value is shared by all objects of the class. A good example of that, as I said, would be like the minimum price for a piece of clothing. An instance variable value is specific to each individual object. So the actual price of an actual-- of an individual clothing object is an instance variable value and would be different, potentially, for each object instance. But the minimum price would be the same across all the object instances and, therefore, is a good candidate for a static variable.

Also, a method or a variable that does not logically belong to an object, but belongs to a class, can be static as well. For example, all methods and constants defined by the Math class are static. They essentially act as a series of functions or procedures that you can call.

So you access static methods and fields without instantiating the class. There's no need to say new Math to be able to find out what the value of pi is or new Math to be able to get a random number generator. You can simply call Math.PI, and it will return 3.14 blah blah blah, or call Math.random(), and it will generate a random number for you.

As a matter of fact, you already have been using static. That's in the main method. So, if we look at our main method, we can see public. We said, OK, that means anybody could call this method.

Void means it returns nothing. String array arguments are the command line arguments that get passed in. main is the name of the method. And static indicates that this is a main method on the class, not on an object instance. So, when the Java virtual machine runs your class, it simply takes your class and calls the main method. It doesn't actually instantiate your class.

OK, we have an exercise to work with static constants. We're going to have to modify the MIN-PRICE and TAX_RATE constants in the Clothing class to be associated with a class, rather than an instance of Clothing. This is a good example of getting started with static variables because we can create a constant, and constants are very common to use those. They can't be changed, and you can easily put them up on the class side because minimum price would be true for all types of clothing, and tax rate, potentially, is true for all types of clothing.

In the main method of the ShopApp class, before you have instantiated any Clothing objects, print the message containing the minimum price value. So that's going to be Clothing.MIN_PRICE.

All right, we have a little quiz for you. Here we have a Clothing class with a private String description and a public getDescription() and a public HatMaker class with a static variable and an instance variable and a static method. Take a look at the question.

Which statements are valid at line n1? What could I put here at n1? There may be more than one that applies. Think about that. Pause the recording. And, when you're ready, resume.

OK, so the valid statements are a, c, and d. And let's see why that is. Now here, inside the static method, we cannot access any instance variables. Classes cannot actually see the object references themselves of the objects that were created based on that class. The object itself has a reference back to the class so that the Java virtual machine for a given object can find the class implementation for the code to execute, but the class itself does not have any knowledge of the objects that have been created and, therefore, has no access to the their internal variables. So what does that mean for us?

Well, we're passing in a Clothing object, cloth. And, if we call .getDescription(), that would work because Clothing object has a public, non-static getDescription() method. So, if we pass in Clothing object and call cloth.getDescription(), it works just fine.

Next up, hatID=nextHat, now hatID is an instance variable, but is being called in a static method. And, as I just said, static methods cannot see instance variables. Therefore, b will not compile and work.

nextHat++, that would work because nextHat, in this case, is a static variable, and static variables can be seen by static methods. And so we can increment it, and that would work.

And, lastly, if we call the Math class, the power, raise 2 to the power of 5, that will work as well because, again, we're using the correct static method, Math.pow(2,5).

OK, one more quiz for you, here we have public static void main with a string array of arguments. We're creating a new Clothing object, setting the description, going to our ScarfMaker and creating items. We're doing various things. Go through this, and figure out which value gets printed at this System.out.println, OK? Go ahead and pause the recording. And, when you're ready, resume, and see how you did.

OK, so here let's see what happens. Which value is printed? The correct answer is d, and let's see why. We start in our main, and we have a new class called ScarfMaker that has a static method called toScarf(). Pass me a Clothing object, and I'll take that Clothing object and set its description to Scarf. So let's see what happens.

We create a new Clothing object and initialize it with the description to Hat. That's using the constructor that takes the description. Then we can call item.setDescription("Jacket"), and that changes Hat to Jacket.

Then, if we pass item to the ScarfMaker.toScarf(), then that item comes in, and we can change the description to scarf. And, when it comes back, it actually would be scarf. But then, if we were to set description equal to Socks, OK, doesn't matter because it's just a distractor. It doesn't have anything to do with our object. We print item.getDescription(), and we get Scarf back out.

And, by the way, this is a very common thing to do in object-oriented programming in Java is to create a class that have methods to do useful things for you without having to instantiate that class. Notice we didn't instantiate ScarfMaker, right? We just have ScarfMaker dot, and that calls the static method without instantiating it, very similar to what we did with Math.power in the previous slide.

So ScarfMaker.toScarf(), calls this method, passes the object in, does what it's supposed to do, and then comes back. Many classes in Java are like this, for example, formatter classes where you pass in an object. It'll format the object for you and pass back a formatted value, very, very common thing in object orientation.

## 07. Static Demo 3m

Exercise 6-3, use static Constants. We're going to modify the min price and tax rate constants in the clothing class to be associated with the class, rather than an instance of clothing by making it static. And then in the main method, before we've instantiated any clothing objects, we'll print a message that contains a minimum price value.

So we return to the clothing class. And you'll notice, of course, that we have our minimum price and minimum tax, which are final, making them constants. But we also want them accessible through the class. So we're going to change this from private to public.

So now we can access it. And accessing constants are fine. And we're also going to make it static indicating that it belongs to the class, rather than the instance. So now to access this variable, all we have to do is reference the class name itself. We can do clothing dot min price or clothing dot min tax and access those values.

Since they're constants, they can't change. And there's no reason to use a getter and setter because they can't be manipulated. OK so first off we added the min price and tax rate. I guess I called it min tax, and it should've been tax rate. So let me go ahead and change that just to be consistent. Some of you may have noticed that, and that's fine. Just grab this guy. And yes, I can do a global search and replace too, of course. And there's only two places it used. And we do a compile. All right

Now, if we come back here, it says in the main method, before you instantiate any clothing objects, print a message with the minimum price value. So right before we create any clothing objects, which is right here, we'll do a system out. We'll say minimum price and concatenate that with-- now, notice how we do it.

Clothing, the class itself, not the instance, dot, and sure enough, there's minimum price and tax rate. Because they're public, they're available. And because they're constants, it's safe to use them like this. And just represent it. And if we run it, we'll see that, indeed, minimum price is 10. Nice, and there we go.

So very easy to use static variables. Static variables now allow me to have variables to go along with the class. Each instance doesn't have a min price, but the class itself does, and, therefore, I don't have to instantiate an instance of the clothing class in order to access price or the tax rate. And with it, that completes exercise 6-3.

## 08. Summary 1m

In this module, you learned to work with object references in more detail. You saw how memory was allocated for objects and variables. You saw how to initialize objects using constructors. And you worked with static methods and variables.
