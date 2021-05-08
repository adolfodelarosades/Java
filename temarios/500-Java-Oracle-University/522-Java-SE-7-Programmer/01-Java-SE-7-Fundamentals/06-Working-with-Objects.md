# 6: Working with Objects

1. Working with Objects, Part 1 - 26m
2. Working with Objects, Part 2 - 26m
3. Working with Objects, Part 3 - 7m
4. Practice 6-1: Creating and Manipulating Java Objects - 11m
5. Practice 6-2: Using the StringBuilder Class - 13m
6. Practice 6-3: Examining the Java API Specification - 5m

## 1. Working with Objects, Part 1 - 26m

Let's go ahead and get into lesson six, which pretty much talks about working with objects. In this lesson, we are going to look at declaring, initializing, and of course, object reference variables. Now we're going to talk about object reference variables. We're going to compare how object reference variables are stored in relation to primitive variables that we've seen earlier in the morning. We'll look at the access fields on objects. We're going to look at calling methods on objects.

We're going to also look at creating a String object. So that is a special String. In fact, yesterday I had a question from [? Vibol, ?] who, again, in this case, was asking me or was telling me, this String is not a primitive. So what is this? And I said, this is a special type of a class in the Java API. And we'll talk about it today.

We're going to look at manipulating data by using, again, the String class and its methods. And we'll also look at manipulating data by using the String builder class and its methods. We will also look at the Java API documentation to explore the methods of the foundation classes that exist as part of the Java SE 7 API.

Now looking at declaring, instantiating, and initializing objects. Well, in general, again, working with objects. So objects are accessed via references. In Java, we call them references. For those who know about C language and C++, we call them what? Pointers. So objects are instantiated versions of their class. They're instances of the class.

And we also discussed yesterday that the class is the blueprint that allows us to, of course, create objects. And also, we call it instantiating objects, too. And objects consist of what? Attributes and operations. So in Java, again, these are the fields and methods.

And now we want to talk about object references. And to be able to actually somehow visualize that and understand the concept of a reference and working with objects and what we need to access them through the references, a good analogy, ladies and gentlemen, here, is to use a remote control to operate, for example, an electronic device that you see here. So of course, the buttons on the remote control can be used to modify the operation of your device, like for example, a camera here. Example, you can use the remote to have the camera stop, play, record, by, again, interacting with the remote interface.

So look at the camera as the object that is accessed through its reference. And its reference here would be the remote control itself. And that's so the remote is like a reference used to access the camera object.

So we already have seen the example of the Shirt class. In here, we give you again the example here, where this Shirt class has a bunch of attributes. All of these are, again, from the shirt ID to the description to the color code, and of course, in this case, to the price and so forth.

And of course, we have a method. And we used to call that method "display information." Here now, we decided to call it just "display," which is OK. And in the method, what we're doing is we're using a bunch of printlns to print, in this case, the shirt ID, the description, the color code, the price, and so forth.

Now, looking at working with object references. Well, working with object reference variables, in general, there are three steps to getting an object reference. The first one is we declare the reference. And this is how typically we see it, where we've got an identifier and we have the class name followed by semicolon. This is pretty much a declaration.

And then, of course, after that, what we need to do is we need to instantiate an object. Instantiating an object, this is a code fragment that creates an object. You always have this special keyword-- "new"-- and then, of course, after that, followed by the class name, followed by open parenthesis and closed parenthesis and the semicolon. This is typically how we create a new instance of the class or create an object. And of course, later on, we're going to see that this is nothing but the constructor of the class, which, by the way, holds the name-- it's a special method that holds the name of the class and has the same name as the class. Same spelling also.

And of course, after that, we need to do is we need to assign the object to the reference. So in this case, after that, what you'd do is you'd go ahead and assign the new instance, in this case, of the class, which is the new instance of the object, you assign it to the object reference. By assigning it to the object reference, in this case, that means you're making the reference point to that object.

So here, again, in this case, the object would be the identifier from the declaration step. And then, of course, that would be the object reference that we see here. And of course, the equal is the assignment operator. And here, to assign to a reference creation, an assignment must be in the same statement, like we've seen here. So again, the way that the assignment operator here works requires that the reference and the newly created object must be in the same statement.

And by the way, we should again make the difference between the assignment operator and then the equal equal, which, by the way, checks the equality of both symbols, in this case, of references.

Continuing with the lecture, now getting into declaring and initializing example. So declaring and initializing a reference variable is very similar to declaring and initializing a primitive type variable. So here, in the first line of the statement here, we've declared a reference for the object of type what? Shirt. And then, in the second one here, we'll go ahead and first create the object instance of type Shirt using the new and the shirt name, followed by open and close parentheses. That would be the constructor of the class Shirt that we are going to discuss at some point in time.

And then, what do we do is we assign it to the object reference, which means now that object reference called My Shirt will actually now point to the instance of the shirt that we created on the right side. So to declare and initialize an object reference variable, first we'll have to declare reference to the object by specifying its identifier, which is its name, and the type of object that the reference again points to. In this case, it would be the class Shirt.

And then the second step is to pretty much create an instance or the object instance by using the new keyword that you've seen over there. And then, of course, number three, we'll initialize the object reference variable by assigning the object to the object reference variable like we've seen in this particular slide.

Continuing with that, and now looking at working with object references. So again, the diagram that you see here pretty much shows us how, in our case here, the first line declares and initializes the object reference in a single line. So we actually do that in a single line.

If you take a look here, we did it in a couple of statements. In fact, we can do it in one statement by, in this case, declaring a reference variable of type called My Shirt of type Shirt, and then initialize it with a new instance of Shirt. And that's done in one line.

And then, of course, once we've done that, now we can go ahead and, for example, declare a variable, in this case, of type Integer, called "Shirt ID." And then what I could do is I can access now the shirt ID of the instance My Shirt through the documentation to actually assign the shirt ID to this, in this case, variable that I've declared here, which is also called the same thing-- Shirt ID. So I can have that.

There's no conflict in names in this case, because on the right side, I'm getting the value of the shirt ID field of the object and assigning it to a variable that I just declared. And I called it shirt now that I called it Shirt ID. And fine. It's not a big deal in this case. So there's no name conflict in this case.

So that what I'm trying to, again, specify here, folks, is that we should note that the use of the dot operator, which, by the way, in this case, pretty much tells us with an object reference, again, it's an operator with an object reference to manipulate the values or invoke the methods of a specific object. You will see that later on if you want to, in this case, modify an attribute of the class.

If you want an object, we can go ahead and use that, the dot operator, to access that attribute or field. Or maybe we can call a method, again, that we defined in the class on a particular object in this case. So the example here, the slide uses the documentation to access the field of the object, again, in this case, assigning it to a valuable named Shirt ID.

And of course, the next statement here is calling the display method in this case. Again, here, we're calling the display method on what? On the object reference, in this case, called My Shirt ID.

So continuing with working with object references, again, let's now return to the concept of the analogy by using the remote control to operate an electronic device. Again, here, to operate an electronic device with a remote, you need to pick up the remote and possibly turn it on, press the button on the remote to do something on the camera.

On the other hand, for the Java object, again, to do something with the Java object, you need to first get its remote, which is called the reference, and then, after that, press the button by calling what? The different methods. That's how, if you want to compare these or create an analogy. So on the left side here, we show you how, again, in this case, a remote control controls the camera. On the right side, we show you how we create a shirt object and get a reference to it.

And then, after that, we show you how we call a method again to have the shirt object do something, in this case, display the information. Right? Everybody's following? OK, good. Let me know if you have any questions.

Continuing with working with the object references, we see here a diagram that shows another important aspect of how references work. In this example, we have a camera object, which is created, and its reference assigned to a camera reference, remote number one. And then, of course, in this case, this reference is then assigned to another camera, in this case, reference remote two. And of course, now both references are associated with the object camera.

So again, in these methods, called on either reference will affect the same camera. So in this case, what we're trying to say is we can have two references that point to the same object. That can be done. So in this case, for example, we create a new instance of camera. And then, at the end, of course, in this case, we make it referenced by the remote one.

And then, after that, we declare another reference called remote two of that camera. And we assign to the remote one, which means now both the remote one and remote two reference objects point to the same instance of the camera, which, by the way, is a unique one. It's the only one that we created.

And by the way, later on, we can go ahead and invoke the play method on remote one. Also, we can invoke the stop method on remote two. And that's going to stop the camera, right? OK.

Now, we could also have references to different objects. Here, for example, we have a camcorder. And it has its own camcorder remote. But also, we can have a TV. And it has its own television remote.

So again, in this case, the whole idea behind this is that every object, you can create an object reference for it. And of course, in Java, you need a reference of the correct type for the object you are referencing. Again, you can ignore the fact that there's such thing as universal remote control. And the whole idea behind this is to discover that Java has also the concept of references that are not limited to a single object, in this case, type. So it could be more references to all the different type of objects. Everybody's following? OK, good.

Again, this is we represent this, for example, in Java. Let's assume that I go ahead and declare reference variable of type Shirt called My Shirt, and then I initialize it with a new instance of shirt. And again, my reference in this case is My Shirt. And then, of course, I can go ahead and display it, call the display method on it.

But I can also create another reference object called My Trousers, which is a reference of type what? Trousers. And I go ahead an initialize it with a new instance of type Trousers. And then, of course, in this case, I can go ahead and call the display. But this time, it's called on the My Trousers, which is a reference variable to the second object.

These are two different objects, by the way, folks. And maybe their characteristics are different, too. A shirt has different characteristics than a pair of trousers. And of course, the whole idea behind this is having the flexibility that is a great strength for Java. Again, you learn more about the concept of, in these cases, describing advanced object oriented concepts later on in this particular lesson.

Ah, now what we want to do is we want to visualize the concept of object references and objects and, of course, in memory. What is this happening over there? And of course, many of you are going to say, well, this typically happens underneath the hood. I don't see that. But it's a good idea to actually have an idea about what's happening underneath the hood.

We all own cars. And we really do not need to know much about cars, except know how to interface with them and drive them. But lots of times, we want to have an idea what's underneath the hood, just so that we can maintain our cars. For example, we know that there is fuel injection. We know that there's some oil that the engine uses for the pinions and all that. And we know that there is an oil filter. We know that there's an air filter.

It's just an idea so that we know, for example, every 3,000 miles or 4,000 miles, we need to maintain the car. We need to go and change the oil and the-- even though we don't do it. But it's just having an idea about, so that we can keep our cars maintained and, of course, in good shape. And they last longer for us.

The same concept in here. When we work with objects of type software, we want to know how, again, in this case, objects are created underneath. And then, of course, we'll have an idea. There is a heap memory, and there is a stack memory. And of course, the memory stack and the heap stack that we're talking about, of course, how many objects we are going to create over there.

So we need to somehow have an idea so that, later on, we can put just enough objects and don't overload that heap memory with lots and lots of objects. And if we are creating lots and lots of objects, chance is that we need to do what? Have a bigger space in the heap memory and so forth, right? That's the idea behind this.

OK, let's go ahead and, of course, investigate this through this slide. Well, in this case, we first of all declare what? A variable called counter of type integer and initialize it to 10.

Whenever you work, of course, that would be a primitive, right? A Java primitive. Well, it turns out that whenever you declare a primitive in this case like it's a local variable, it's automatically always again created in the stack memory. And of course, its value in this case is 10. And so as you see here, it shows you how, pretty much, when you declare a primitive variable and, of course, assign a value to it, it automatically in this case would occupy the stack memory space.

And of course, the next step is looking at a couple of-- the next one is we declare now an object reference variable, in this case, called My Shirt, and it's of type Shirt, and initialize it with the new object of type what? Shirt.

So it turns out that this one here will be assigned some hex value. This represents a hex value. That is now up to the JVM to assign that address, not us. So it's just out of curiosity, imagine that in this case, the address is in 034009 in hex, in hexadecimal.

And by the way, again, as you see, the JVM also will go ahead and assign, in this case, a space in the heap memory. And of course, that space represents, in this case, the object that you just created of type Shirt. It turns out that it has a shirt ID 12, the price is $15.99, and the color code is B for "blue." Just out of curiosity.

And then, by the way, you could go ahead now and declare another reference variable called New Shirt. And we initialize it with a new instance of shirt, except that this is a totally different instance, even though they're the same. They're like twins. But they are two different objects.

And in this case, It's Your Shirt. And the address is 99F311 in hex. And of course, it points with the red arrow to this object now here in memory. So again, the diagram here, that shows us the two types of memory that you use, the stack and the heap. And of course, the stack holds, like I said, local variables, either primitives or reference types, while the heap holds objects. Again, later in the course, we'll learn a little more about local variables. But for now, it's sufficient to know that local variables are not fields of an object. Everybody's following?

Real quick question. In this shirt, "Your Shirt," we initialized like My Shirt, Your Shirt is equal to My Shirt.

We can see that in the next slide. Again, the question that Vinod is getting at is, how about if I want to assign Your Shirt reference variable to My Shirt? Let's see that in the next slide. Good question. In fact, we thought about that. And we actually provide an explanation about that in the next few slides. Thank you. Good question.

Ah, speaking of what Vinod just mentioned. It turns out that we can assign a reference to another reference. And here's an example, where here, after the previous slide, we decided to assign, again, Your Shirt to My Shirt. What does it mean? Again, in this case, what it means is now we're making the My Shirt point to the same object that Your Shirt points to. That's the idea behind this.

So in this diagram, we see how now we assigned to Your Shirt to My Shirt. Again, when this happens, the My Shirt reference now will drop its current object that it's pointing to. Remember, that's this one here. It's going to point in-- that's why you see it here, it's grayed out. Did you see that? And that's on purpose.

And of course, now it drops that current object and be assigned to the same object as the one of Your Shirt. Of course, as a result now, the two references, My Shirt and Your Shirt, now point to the same object in this case, which is the one in the bottom in the heap. So any changes to the object made by using one reference can be addressed again or accessed using the other reference and vice versa in this case.

Of course, the other question that we have here, again, by assigning the reference Your Shirt to My Shirt, is that if, again, the previous object referred to My Shirt has no other references, what happens now is it will now be inaccessible. You see it here? Now it's inaccessible.

So in this case, again, at some point in time, the garbage collector will get in and, of course, garbage collect it for it. It will go ahead and clean up, which means now its memory will be available for future objects. Yes, got a question?

So now, in this case, myShirt.shirtID and yourShirt.shirtID, will it have the same value?

Yes, of course. Now, again, let me repeat. So the question here by Vinod is he's saying, myShirt.shirtID and yourShirt.shirtIT, will it refer to the same idea? And the answer is, yes, because both of them at this point in time will refer exactly to what? To this object, which, in this case, the shirtID is 12. OK? Good.

So two references, one object. Here's an example. Again, speaking of manipulating data through the different references, let's assume now we'll go ahead in this case and read this code fragment. First of all, what are we doing here? Anybody can tell me?

Again, let's go ahead and use now the jargon of the Java language. If you take a look here, you will see that now I am saying all the time the same thing. And it's a special type of a language that belongs specifically to Java. Usually, when you have a special type of a language, we call it the jargon language.

So usually, the way you read this in this statement that I just highlighted here, ladies and gentlemen, is first you say, I'm going to declare a reference variable called My Shirt of type Shirt. That's on the left side. And this is typically what happens underneath the hood.

And then, on the right side, I'm creating a new instance of type Shirt. And then, when I now assign the right side to the left side, what I'm doing here is I'm initializing that reference variable, making that reference variable, My Shirt, point to the object of type My Shirt. Got that?

We do the same thing here. And we know that Your Shirt now will point to another object of type My Shirt. And we've seen that, by the way, earlier in this example. So you see now, specifically shown in this diagram here in the memory heap, in this case.

Then, after that, look what we do. We assign Your Shirt to My Shirt, which means now My Shirt points to the object pointed to by Your Shirt. And referenced by the Your Shirt. It's a good idea to use reference.

And of course, after that, look what we do. Now I'll go ahead and access the color code through My Shirt reference and assigned to it R. And then, after that, I'll go ahead and access the color code through the Your Shirt, reference and assign G to it. And the question is, let's go ahead and now do a println, where we're going to print the color code.

G.

Then, of course, in that case, the answer is G. Good. And why? Because both reference variables now in this case point to the same object. So I can actually modify. And so you see in this example, of course, in this case, making a change or getting a field value by using one reference is exactly the same as doing it with the other reference.

Continuing with that, let's go ahead now and assign a reference to another, again, reference. So here's an example where, in this case, I have, if you remember, because My Shirt and Your Shirt now refer to the same object after the code in the previous slide that we've seen, the color code field now of the object will be G. We already know about that.

And of course, you will get the same result, whether you print My Shirt color code, or the println Your Shirt color code, because it's exactly the same. Why? Because both references, My Shirt and Your Shirt, again reference exactly the same object. OK? Good.

And now we have a quiz. So the quiz says, which of the following lines of code instantiate a Boat object and assign it to a sailBoat object reference? So you see here, we, again, in this case, instantiate a new object of what? Of type Boat, and assign it to a reference variable, again, called sailBoat, of type what? Boat. So of course, this would be the answer, right?

## 2. Working with Objects, Part 2 - 26m

Continuing now, let's talk about the String class. OK, good. So String class supports some nonstandard syntax. A string object can be instantiated without using the new keyword. It is, by the way, the preferred way to create a String object. So we declare the String as-- the reference variable is called hisName. And we assign to it, of course, in this case, "Fred Smith," which means it's going to point to the String called Fred Smith.

By the way, you also can use the new keyword. The new keyword can be used, but it is not the best practice. If you can also do it this way, where in this case you're declaring herName as a reference variable to a String. And then, of course, we'll use the new and we pass "Anne Smith" to it. The reason why we do not like to do this and use this, folks, is because underneath the hood it creates two Strings to be able to create that.

So when you are dealing with a lot of Strings in your application and using this method to create Strings, what's going to happen is there is more work that is done underneath, and more space in memory that is also taken. So that's why the best practice is always this one here. That's the preferred practice. At some point in time, in some advanced courses you will see that. In fact, we also have a performance tuning, the Java performance tuning, of course, that actually also covers this. And we show you one.

And by the way, another thing that we want you also to remember in this case is that a String object is immutable. That's important. It's immutable. So its values cannot be changed. So that's an important thing. So creating an object, again, in this case, like I said, using the new keyword creates two objects in memory, while creating a String object using the String literal, like I showed you here in this case, that creates only one object. Therefore, of course, we always use, in this case, the best practice is this one here.

And by the way, a String object can be used with a String concatenation operator, which is plus. We can actually concatenate two strings using the plus, which is the symbol for concatenation of two strings. Yeah?

What does immutable [UNINTELLIGIBLE]?

Immutable means you cannot change it. And once you create the String, it cannot be changed. It's going to be always that. Let's go ahead and use a couple of slides so we can understand what it means.

Let's go ahead now and concatenate Strings. When you use a String literal in Java code, it is instantiated and becomes a String reference. So concatenating Strings. For example, imagine now I declare a reference variable called name1 of type String, and I initialize it with what? With the String "Fred."

And then now, I'll go ahead and use another String. Again, let's assume that this is already declared. There's names. And then look what I do. I concatenate name1, which is what? Fred. And plus, and concatenate this String here, which is space and space. And then I concatenate it with what? With Anne Smith. So at the end you're going to have what? Fred and Anne Smith.

And by the way, whenever I created this, I cannot go and change it. I cannot go change this String here, name1. It will always stay there. I created a new String from it. But the one that I created will always have that value. You cannot go back and change, for example, Fred to something, or E to something else, and so forth. That's the idea.

So the concatenation creates a new String, and the string reference "theirNames" now points to the new String. Right? So again, because a literal string returns a String reference, string literals and String references can be intermixed in an expression that concatenates a number of strings as shown in the slide that you see here. Got that?

Now let's go ahead and-- and it's even better. You're going to see it on the diagram as a picture, too, into [UNINTELLIGIBLE]. So we always say a picture is better than 1,000 words. So you'll see now how we actually can see by, again, concatenating strings. Let's assume now I declare a String reference variable called "myString," and I initialize it to the String Hello. Can you see that?

So again, in this case this is what is going to happen. So because String is immutable, concatenating two strings require creating a new string. But you cannot modify the existing string. Got that? OK. The diagram shows a String object concatenating the String "Hello," in this case. And this case is only the [UNINTELLIGIBLE] containing the String "Hello." All right.

Of course, after we finish with this, the next question is, if you now-- you can ask this, and you say, Joe, if you're telling me that the String is immutable, imagine I want to actually change the String. Is there any way I can do that? And the answer is yes. We have our other classes that handle that, and we see that in a couple of slides. Everybody's following? OK.

Now, here's, again, an example where, in this case, we declared a String reference variable called "myString," and initialize it with the string "Hello." Everybody sees that? And then the second one, look what I do. Here's an example where, in this case, I'm going to go ahead and use my String and use the method, concat, by the way which belongs to the class string. So I can actually do that. And I have the contact. We'll see that later on. And then I'm passing to it "space World" string. And I'll assign it to myString.

What's going to happen now, it's going to go ahead and create a new String that has what? Hello concatenated with World. But as you see, the old one is not changed. Now the new myString is going to point to the new String, but the other one is, of course, still exists over there. That's what we say Strings are immutable.

So here is the string "World" being concatenated to the original string. The concat method is being used here, but whether you use that or use the concatenater operator plus, a new String object is created, and a new String reference is returned that points to the newest String. Of course, the old one, as you see, it did not change. It's immutable.

You get a new string created, of course this one here, no reference variable for it. So at point in time, it's going to what? It's going to be garbage collected. Everybody sees that? So as you see here in this diagram, the myString is no longer, again in this case, the address that we've seen earlier, which is the zero, three, whatever that we've seen earlier. This one here. But now it's a new address that points to the new string. Got that? Everybody's following?

So whenever we say strings are immutable, you folks need to understand that, which means here it was not changed to a new string called Hello. Well, in fact what happened, a new string got created, and now the reference variable points to the new string. Everybody understands that? Remember folks, I'm going to quiz you on that. Just kidding. All right. So remember that, OK?

Continuing again in this case and looking at concatenating, again concatenating strings. In this case we go ahead and declare a String reference variable called "myString." And we initialize it to the string "Hello." And then after that we'll go ahead and concatenate the World, in this case, a string to the myString. And then, of course, after that we use the concatenation operator to concatenate, again, the same thing, the question mark.

So as you see, there's always a new string that is created. And for example, here we mixed and matched. We concatenated the concat method, but also we concatenated the string with the plus operator, which by the way, that represents the concatenation operator, and that of course works without any problem. So a new object in this case is created, and the reference for this object is assigned to myString. Everybody sees that? Good, good.

All right. Continuing with that, and now looking at string method calls with primitive return values. So a method called can return a single value of any type. For example, here we have a method of, again, a primitive type "int." So in this case, I declare a String reference variable, "Hello," and I initialize it with the string called "Hello World."

And then, of course, now what I do, I can go ahead and invoke the length method on the reference variable, and that of course is going to return what for me? An integer which would be what? The length of the string, which is what? The number of characters in the string. Everybody sees that? So in this example, we use the reference "Hello" to call the method "length." Again, because by the way, the method "length" is part of what? Of the string class.

And it's in this case because the object in this case, this reference in these case refers to the string "Hello World." Again, this method code will return the value 11. And that's of course the size of the one character. We'll start here with the first one. One character, two, three, four, five, six, seven, eight, nine, ten, eleven. OK? All right, good. And that, of course, in this case the length method returns an integer.

Now looking at, again, string method calls with object reference values. So again in this case we have this example that you see, in this case, on the slide. First the string "space HOW space." If we invoke "trim" on it, it's instantiated. And the trim method, what it does, the trim method is a very interesting method.

What the string method does, it actually removes the spaces in front and in the back. So for example here, whenever we invoke "trim," so what happened is this space is gone, and then it removes the space, too. So it removes the front and the trailing spaces. They're both removed. So that would be, again, myString, which is HOW.

And then after that, I declare a String reference variable called "lc," and I use the greet, and then I concatenate it with what? DY. And then of course use the two lowercase to, again, do what? To convert the DY. Right? Everybody sees that? OK, good. And of course, at the end it's going to be what when I come in? It's going to be HOWdy, except that the H-O-W are in capital case, but the "dy" are in lowercase. Why? Because I invoke the two lower case on them, on the string. Everybody sees that? OK, good.

And of course, after that we'll go ahead now, and that's what it would be. And here's another one where we can go ahead and declare a reference variable, in this case of a type string, and then of course concatenate the greet with the DY. And that would be HOWDY in capital. And then invoke the toLowerCase on them, which means now it's going to print for me what? Or if I want to print that? It would be howdy, everything-- what?-- in lowercase. And that's what you see here. howdy in lowercase.

So the first one, this one here, where it produces howdy with H-O-W with capital S and dy in lowercase. And then this one here, because we use the parentheses it said, then the toLowerCase is applied on the whole string, the final one. And then of course in this case it would be howdy, everything in lowercase. Everybody sees that? OK, good, good.

Now look here. Continue with method calls requiring arguments. Method calls may require passing one or more arguments. We can actually do that. And here's an example where we pass a primitive. Here we have a reference variable, or a String reference. We declare a String reference variable called theString, and initialize it with thte string "HelloWorld." And then here we'll go ahead and first declare a reference variable called partString, and then invoke the substring and pass six to it.

Well what do think this is going to happen? So in this case what happened? So it returns a new string that consists of the-- again, since using the substring method that you see here takes an integer, and now again needs an index to indicate whether to split this string. So it returns a new string that consists of the remaining part of the string, in this case starting with what? With W, because of course you're not going to count the first-- in this case-- six letters. So in this case it returns world. It returns world. Got that, everybody? All right.

And so that's, again, the substring. So if again, like we tell you here, the substring index from zero and begins with the character of the specified index and extends to the end of the string. So w in this case is the index six. Everybody sees that? OK, good.

We also have another example where-- in this case, pass an object. So for example, here we declare a boolean, a variable called "andWorld." And then of course we'll take the string "Hello World," and we invoke the endsWith, and then we say "World." So again, this ends with-- it requires a string, a reference, to be passed as an argument. So in this case it returns a boolean, because it simply determines if the string ends with the sequence of characters "world."

And of course in this case it does, so automatically a "true" now is assigned to the end World boolean variable. Everybody sees that? So here we show you how a method can take what? Primitive value. Or can take what? An object, in this case. Obviously it's taking a reference or a String reference.

Now we want to investigate the Java API documentation. So the Java API documentation consists of a set of webpages-- again, a list of all the classes in the API, description of what the class does, list of the constructors, the methods, and fields for the class. Again, it's highly hyperlinked to show the interconnection between classes and to facilitate the lookup. And usually you find it through this link. OK

The Java technology class libraries are documented in the Java API documentation for the version of the JDK that you are using. And of course the class library specification is a series off HTML webpages that you can load in your web browser. Again, the Java class library specification is a very detailed document outlining the class in the API.

Every API includes documentation describes the use of the classes and their fields and methods. Again, when you are looking for a way to perform a certain set of tasks, this documentation is the best source of information about the pre-developed classes in the Java class libraries.

And here we show you, again, a snapshot on how to look at this. So it's as you see here in terms of what are you guys going to do. On the top here, left, this says you can select all the classes off a particular package from here. That represents the package. This represents the list of classes inside the package. And of course this represents the details about a particular class. OK?

And of course, again we can look at the main panel on the right. That contains a lot of information about the class. So you need to scroll down to be able to see the rest of the information. And looking at summary, you can also look at the method summary. And let me just move it up and then scroll it, zoom in a little bit.

So you see here you have the type of the method and what it returns in a character. And then of course here we have the name of the method. And of course here, the type of the parameter that must be passed to the method. So you can see a lot of details like this. Right?

And of course you can look at the method details. Again, the method name and the parameter types are hyperlinks so that you can go ahead and get some more details. For example, here we show the detailed description of one of the indexof method of string.

And let me go ahead and just share with you that. You should know that I have it here. And this is pretty much showing you, this is all the [UNINTELLIGIBLE], this is all the packages that you have. And this is the different classes that you have on the particular package. And of course, this is the [? AOR. ?]

Let's assume that I just want to investigate the string class. If I click on String, then I'll get the details of our string. I can go ahead and look, for example, here, just by looking at the different hyperlinks. For example, look at the fields. What are the fields of the string class? Here they are. And then the field comparator.

And then you can go back, and I say, by the way, what are the constructors? Later on we'll [UNINTELLIGIBLE]. All these are a list of constructors. Again, you can scroll down and see all the list of the constructors. Let me go back, and how about the methods that exist? Let's going ahead and look at the methods.

Oh, by the way, we just used some methods, right? Remember how we used the concat? Let's go ahead and find-- and here it is. Here's a concat. See how we concat? We pass a string to it. If you want more information about the method, click on it, and then it gives you more information about the path. Look, it's show you examples and so forth.

This is pretty much-- we call it the Bible of Java. If you really want to use Java, this should be handy. By the way, you should go ahead and bookmark it, and you can go ahead and use it any way you see fit to help you implement the code.

We also have seen-- what else have we seen as methods? We've seen length, right? Let's go ahead and see length. As you see, it;s in alphabetical order. Here's the length. Remember that? This returns the length of string. The length is equal to the number of Unicode character units in the string. Got that?

What else have we seen?

Substring.

Substring. Let's go ahead and look at the substring. Thank you. So we'll go to S. Substring, see? And we use the index, remember that? One integer. So it returns a new integer that is a substring of this string. Again, the substring begins with the character of the specified index, and ends and extends to the end of the string. That's why we've got "World" over there. Yeah?

So in the example of when you referenced the semantics, didn't use the fully qualified name? You just used dot--

Yes. That's how typically you call them, through the dot. That's how you call them. Good question. You call them through the dot notation. That's exactly what we've seen here. Let me go back. See? The dot notation. Got that? Using the dot notation. Everybody's following? So far, so good? OK. So of course we'll get to investigate this, by the way, in the practice. So we went through this.

And now let's go ahead and look at the system.out methods. By the way, folks, remember how we've been using the system.out.println for a while. Let's go ahead and investigate this. Well, to find the details about the system.out.println, consider again the System class in the Java.lang.

And then after that you have the out is the field of the System, and out is a reference that allows the calling the println on the object type it references. And to find the documentation, go to System class and find the outfield, and then go to the documentation for that field and review the methods.

Lets go ahead and do that. So we look at System. So I'll continue, and it should be S-Y-- and here it is. And now if I look at the fields-- ah, you see? I now have the out. If I click on out, then pretty much it's going to show me all the different types of method that you use over there. Everybody sees that? Good job. So far, so good?

So again, here showing you the println, and then you can go back. And in this case I get into all of this-- for example, in this case the PrintStream, and then looking at the methods, and then scrolling down you have the print. And here you will see, you will discover the println, all the print type of methods.

Here's the println. It turned out that it starts here. It starts here, so this one and then this one here, that prints your boolean. A character, an array of characters, a double, a float, an integer, a long, an Object, a String, and so forth. So how many of them? One, two, three, four, five, six, seven, eight, nine, ten. Got that?

Later on when we learn about it, remember that this method has the same name, but it takes different type of variables. The fact that it takes the same name and you pass different types of arguments inside to the method, that's called overloading a method. We'll learn about that later on. Everybody's following? Good job.

So again, continuing, you can have a print, a println. The println method, in this case you can again pass the data to print. Example, you want to print again-- whatever you want to print. Here's an example where they have the print. By the way, the print prints whenever you want to print, but it does not take you to the new line. println, it takes you to a new like.

For example, if you want to do, it will print this first: "Carpe space diem," and then, after that you pass, "Seize" and then the end of "the day." That's why at the end it says "Carpe diem space seize" and then "the day." You see that it all prints it in the same line. Why? Because the print here prints a string, but does not take you to a new line. Got that?

You can actually discover this here, too. You can look at the print. Here's the print. And you could say that it's a string. If the argument is null again, then print null. Otherwise the string characters are converted into bytes according to the platform default character. And again, these bytes are written in exactly the same manner. But it doesn't take you to a new line. Everybody's following? Good.

## 3. Working with Objects, Part 3 - 7m

And now looking at StringBuilder, so the StringBuilder, so some of you could ask me the question and say, wait a minute, you're telling me that a String is immutable. But I really want a mutable alternative to a String. So we actually created other classes. And one of them that we show you here is StringBuilder. StringBuilder provides what, a mutuble alternative to a String.

So StringBuilder is a normal class. Use the new to instantiate it. It has an extensive set of methods, insert and delete and, of course, has many methods to return a reference to the current object. There is no instantiation cost . Again, it can be created with an initial capacity best suited for your needs. Again, a String is still needed because, of course, it may be safer to use an immutable object. Of course, a class in the API may require a String. And of course, it has many more methods not available in the StringBuilder.

But a StringBuilder, it's pretty much not a replacement, by the way, not a complete replacement for a String. But it's more suitable for many modifications that are likely to be made to the String represented by the data type. And by the way, you can go ahead and find it. You go back. And you can go and you look at the StringBuilder. You can go up and find it. So here is a StringBuilder. And you will see it has it's own methods. And here are the methods, append and there's all kinds of methods, in this case. You can scroll down and see the whole list and, of course, understand every one of them, if you want to read about them just by clicking, of course, on the method itself if you want to look at the details of the method. Everybody's following? Good, good, good, good good, good, good, good.

Now, looking at StringBuilder advantages of a String for concatenation or appending, let's assume now we declare a String called myString , again, for a reference variable called myString and initialize it with the String Hello. And then here look what I do. I'll go out and concatenate the word to hello. Of course, I'm going to have a new String. We already have seen that. The old one, of course, in this case it stays dangling. At some point in time it will go ahead and get garbage collected. But as you see here a new string is created. And the reference for that object is assigned to the myString. Everybody's following that?

Now, let's go ahead now and use the StringBuilder so declare and instantiate. See here I declare a reference variable to a StringBuilder called mySB and initialize it with new StringBuilder called, what, Hello. Right? So now I know mySB points to this String. Got that? OK. Now, what I'm going to do is I'm going to go ahead and append space World to it. If I invoke the append on the reference variable mySB, what's going to happen is it's going to append the space myWorld do the Hello and now, of course, will work on the same exact String. So you see the address is at 34009. And here is the same one. Got that?

So to append a String World all you need to do is call the append method and pass the String World to it. Again, we should note that no assignment is necessary because there is already a reference to the StringBuilder object again. And this StringBuilder object now contains a representation of the combined Hello and World. Right? Good, good, good, good, good, good. Everybody sees that? Now everybody knows the difference between String and StringBuilder. Right? OK, I'm going to quiz you on that.

And we have a quiz. Which of the following statements are true? Choose all that apply. First one, a dot operator creates a new object instance. That is not true. How about B? The String class provides you with the ability to store a sequence of characters. Yes. How about C? The Java API contains documentation for all of the classes in the Java technology product. Yes, that's true. How about the fourth one? String objects cannot be modified. Yes, of course. So that's true.

So in summary we looked at objects that are instantiated version of their class. We looked at objects that consist of attributes and operations. We looked at, again, they are called fields and methods. We looked at accessing the fields and methods of an object and get a reference variable to an object. And we all looked at an existing object's reference can be reassigned to a new reference variable. We've seen that. We also saw the new keyword instantiating a new object and returns a reference. Everybody sees that.

And of course, we have a bunch of practices in this lesson. First, we create and manipulate Java objects. We also in this case used the StringBuffer class. And we examined the Java API. Let's go ahead, of course, and see these. Let's go ahead and see these in details.

So practices for lesson six would be the first one creating and manipulating Java objects. Again, we give you all the help to do that. Second one using the StringBuilder class and we give you all the necessary to do that to do the practice. And then the third one examining the Java API specification and we tell you, of course, what to look for. Everybody's following? So let's go ahead and do the practices for lesson six and, of course, after that continue lecturing lesson seven. Thank you.

## 4. Practice 6-1: Creating and Manipulating Java Objects - 11m

After working, after going through the lesson six, and that, of course, covered working with objects. Over there what we have done typically we looked at accessing object by using a reference. We looked at the concept of declaring and initializing objects. We looked at working with object references. We looked at, again, references to different objects. We looked at the concept of assigning a reference to another reference. And we looked at the concept of a String class, concatenating String classes. We looked at the String is typically immutable object. We also looked at the Java SE 7 documentation. We also looked at the concept of the println methods that, of course, we've been using in the Java SE documentation. And we also looked at the StringBuilder class, which also has a bunch of advantages over the String class.

Let's go ahead now and look at the practices for lesson six. And for that, we'll start with practice one. And again, in this practice 6-1, we'll create and manipulate Java objects. So again in this case, the idea is this practice has a couple of sections. In the first one, we create an initialized object instances. And in the second section, we manipulate object references.

So the first thing is as assumptions they gave us the Customer.Java class. This time, if you take a look here, ladies and gentlemen, they did the opposite. See usually what they do is they give us the test class and we create the class so that we can test it. Here in this case, they gave us the class. And they want us to create the test class. So the class here is Customer. And as you see, this Customer class is provided to you. And again what do we need to do is create, compile, and execute a CustomerTest class.

Of course, the way we do it in this case, we'll go ahead and create a new practice called practice06, typical what we've done before using the Source Package Folder and set the Source Package Folder to the D: back slash labs back slash les06. That stands for lesson six. And of course, we also remember to also change the Source Binary Format property to, in this case, SE 7. And then we open the Customer.java in the editor and examine its member feeds and its methods and so forth. So let's go ahead and do that first.

So right click Properties. And then we make sure that it's already changed to 7, JDK 7. OK, that's good. And also this is JDK 1.7. So that's good. And then of course, they want us to look at this Customer class. So when you take a look at this Customer class, it has three instance variables. The first one is called CustID. And it's of type integer initialized to zero. And the second one is a String, in this case, called Name. And of course, it's initialized to a Name required String. And the third one it's a String, again, Email here, of course, in this case, rather an email address variable of type String and initialized to Email required.

And we also see a method, in this case, displayCustomer that, of course, in this case has a first println method that prints this message. It's just to make the output friendly. That's all customer information. And then after that we print the customer ID, the customer name, the email address. And then we finish by, again, putting all this row of asterisks so that the output will look good, will look friendly, and will look beautiful.

Now, continuing with, again, this practice they want us to, step three, create a CustomerTest class as a Java Main class. Again, since this class is run executed by the Java executable, it must contain a Main method. So the way we do it, in this case, is we'll go ahead and, in this case, create a new Java Main class from the menu. So let's go ahead and do that. We right click the project just to show you it's already there. But right click and then create New. And you don't create a Java class. You want to create, in this case, in our case here would be the Java Main so, of course, in this case, would be the Java Main class.

So click on all those. And we'll go to Java. And then of course, we'll go ahead and see here's the Java Main class. And that's the one that we want. We'll click Next. And then we give it a name. And you see that it's going to have, in this case, it's going to be CustomerTest. And then of course, I specify the package and click Finish. And so this way we know that the class test or rather the CustomerTest will contain the Main method.

Continuing with that, again, this actually how they also show you a snapshot of what you see. So that's pretty much what you are going to see. And then of course, it gives you the class test template that is already created for you. As you see here, there's a Main method. And it's empty for now.

The next thing is they want us to now, of course, develop this or code this class called CustomerTest. So first of all we declare two instances of type customer called cus1 and cus2. And that would look something like this. And then, of course, after that initialize them within the instance of Customer and then after that, again, within the Main method they want us to now assign values for the customer ID and the name and the address and so forth.

And then of course that's within the display information. We'll go ahead and print like, in this case, customer ID one. The name is Mary Smith. And that would, of course, will be for both, for cus1 and cus2, which are references or reference variables of type customer. And then, of course, after that we'll go ahead and run the CustomerTest. Let's go ahead and do that just out of curiosity. And here's my CustomerTest. So we take a look here. That, of course, let mean just comment this.

So we have the customer test. We have the Main method. First, we declare two instances of type customers called cus1 and cus2. And then we initialize them with instances of type customer. So we did that on, again, line 17 and 18 here. And then after that look what we do. We'll go ahead now and assign a bunch of variables to the customer ID or other bunch of values to the customer ID name and email address.

For example, the first one we said that the customer ID is one. And the name is Mary Smith. And the email address is marysmith@gmail.com. And then the second customer, which is cus2. And that would be this one here. Again, as you see we specify the customer ID to be two. The name is Frank Jones. And the address is frank.jones@gmail.com. And of course, now what we do is we display the information of the customer one and customer two or cus1 and cust2. That's why we call the display customer information twice, one on the cus1 and the other one on cus2.

Of course, if you run this, what you're going to do is you are going to get as an output the exactly the first one, which is the customer ID one and then, of course, the name Mary Smith and the email of Mary Smith and then the second one, second information about cus2, which is, again, in this case, an instance of that customer. And the ID here is two. The name is Frank Jones. And the email is frank.jones@gmail.com.

All right, continuing with that and now what we want to do next is, again, we edited the Main method of the CustomerTest to assign one object reference to another object reference just, again, above the first line of the code that, of course, in this case invoked the displayCustomerInformation method. And we want to add this. So what we want to do, if we now assign cus1 to cus2, ladies and gentlemen, and we've seen this in the lecture of less than six. What we're doing here is now we're making cus2 reference the same object as the one that cus1 referenced.

So now we're going to end up with cus2 and cus1 referencing the same object. And by the way, would be the first object in this case that would be Mary Smith. So the way we do it in this case we'll just go ahead and, if you take a look earlier, I actually commented this. So what I'm going to do is just end commented. And then we do it exactly like you see here, ladies and gentleman, before calling the displayCustomerInformation.

So in this case, the way it's going to work is we know that cus1, obviously, points to the object that has this information. And then now we making a cust2 also points to the same objects, which means this one here is not going to have any reference in this particular example. And if it's not having any reference, at some point in time the garbage collector will garbage collect it from the memory, the heap memory, of your JVM.

Let's go ahead. And now, of course, if I click on save that pretty much handles the compilation. You can also compile it, too. And then I right click now and, of course, run the CustomerTest. Now remember, in this case what's going to happen is, as you see, now we print exactly the same object, the first one because we call the first one on cus1. And that would be, again, this one here. And that, of course, prints exactly Mary Smith information. And then the second one, because now we made cus1 and we assign cus1 to cus2, then cus2 will, again, point to the same type of object with the same, again, information, which is the customer ID is one and the name is Mary Smith and the email is mary.smith@gmail.com.

So this pretty much shows us how, in this case, it pretty much illustrates what we learned in the lesson when we assign a reference variable to another reference variable. And that's pretty much ends the practice one for lesson six. Thank you.

## 5. Practice 6-2: Using the StringBuilder Class - 13m

OK, so now, let's go ahead and take a look at Practice 2 of lesson 6, where in this case, we are going to use the StringBuilder class that we learned about in the lesson. What we're going to do here is illustrate what we have learned, folks. So the assumption is we have, in this case, the person to test. That's our file that appears, again, in the folder.

And here, what they're asking us to do is to create a new class called PersonTwo, and we declare [UNINTELLIGIBLE] two member feeds of String fields to hold the person's name and the phone number, respectively. And of course, for the name field, initialize the capacity of the StringBuilder object to eight. Again, use meaningful field names. And that's how it would look something like this, for example, where we have the name and again in this case, we said that the capacity will be eight. And then for the phone number, we just make it, in this case, reference a new instance of StringBuilder.

After that, they ask us to create a method called displayPersonInfo. In the body of the displayPersonInfo method, we [UNINTELLIGIBLE] and then display the Name object. Again, we ensure that the total number the characters in the name exceeds the initial capacity of the object, again this case, which is eight. And of course, this table here provides a high level steps for this task.

Again, a multi-tenant structure can be found later on, so that's pretty much showing us, in a nutshell, what happened in the table. And you can go ahead and take a look at it and read it. It's straightforward, of course, from Step A all the way to Step E.

Of course, we're using the Append method of the StringBuilder class to append a first name, again for example in this case, append Fernando, and we use the same method in the two separate invocation to add the first, again, a space, and then add the last name. Again of course, ensure that the total number of characters that you have added to the name exceeds eight, in this case.

Then we should know that you can accomplish the same thing by using a string object and concatenating additional values. However, this would be inefficient because a new object is created with each concatenation since object capacity cannot be increased as strings are immutable, as you know. That's why we're using the StringBuilder, and we discussed this in the lesson if you remember.

So let's go ahead and then in Step C, we use the system that [UNINTELLIGIBLE] method to display the entire name value. And you can also embed the two String method, in this case, of the Name object within the system.out.printIn method, and it would look like something like this. Again, at some point in time, we'll look at that two string method.

And then we display the capacity of the Name object using the Capacity method, and of course, the StringBuilder object has dynamically increased the capacity to contain all the values that you have appended. So it would look something like this, where display person information method. We append Fernando, a space, and Gonzales, and then of course, we display here the name. And as you see here, we calling the two string method on the object reference Name.

And then of course, in this case, display the capacity by doing what? By again, in this case, calling the Capacity method on the Name reference variable. Again, we click and save, run the PersonTwo, and the output, again, should look similar to what we see here. And we should notice again, in this case, that it means, pretty much, something would look like this.

And if we now, obviously, in this case, let me just, in my case here, just comment these. And then of course, because so far, that's what they asked us to do, so you see, we have a PersonTwo. We create two reference variable name and phone number of type StringBuilder. They ask us that the first one will pointing to a StringBuilder of type of capacity eight. The second one, they didn't see anything, so it's just a references, a new instance of the StringBuilder.

And then here, we have a display person information, where they asked us to append Fernando as a first name to the StringBuilder name, and then after that, we append the space, and then we append the last name, which is Gonzales. And then after that, they asked us to print the name by, again, in this case invoking the two string method on the name, and then the second one, print the capacity. OK? So if you, again, were on this and then here's the person test two. That, of course, is provided to us again.

This in the PersonTwoTest class, it has a main method. We create a new instance of the PersonTwo referenced by, in this case, reference variable myPersonTwo. And then, of course, after that, we'll even go over the displayPerson. So if we run this, then of course, in this case, you see how the name is Fernando Gonzalez, as you see printed, and then the name object capacity is 18, in this case. All right, now, of course, this is using the debugger if you want to out of that.

OK, continuing with the practice, let's go ahead, now, and go to the next step. In the next step, look what this tell us, ladies and gentlemen. Populate and manipulate the phone number object.

Again, here you append a string of digits, and then use the Insert method to insert dashes of various index locations, achieving the formats of, again, some numbers and then dash and then some numbers, like looking at the phone number, for example, 617-324-1416. This is how, typically, the phone numbers in the United States are, the first three digits specify they area code, and then the phone number is made of seven members, the next three and then four digits.

So that's pretty much what they want us to do, so in that case, again, we use the append method all of the string. We represent this, by the way, in a summary on this table, where we show you the high-level instructions, but if you want to dig into the detailed instructions, just keep on reading the different steps.

So the next one, we use the append method of the StringBuilder to append the string value consisting of 10 numbers, and then after that, we insert the dash. And of course in this case, the dash at the offset position three, and then put again the dash at the fourth position in this string, pushing all the remaining character over one position. Again, the syntax of this method would look something like this.

OK, and again, as an example, we consider this phone number, for example, where we offset, in this case, position three occurs at the number one. Of course, the index number begins with zero. If the dash is asserted at the offset position three, it pushes the number currently at that position, and of course, all the remaining number over to the next offset position. And then we insert a dash at position seven, where the number in this case, four, is currently placed. And then of course, we use the [UNINTELLIGIBLE] to display the output from the StringBuilder object to the String.

So of course, the solution would look something like this, where you see how first of all, we append the string. And then we insert, in this case, the dash of the three characters, and then another one after, again, in this case, insert the dash after seven characters. And of course, we'd go ahead and print this, again, by invoking the two string method on the phone number reference variable.

We click on Save and run the PersonTwo.java, and then we check that, in this case, the output would look like what we have here. OK? And of course, let's go on and do that on [UNINTELLIGIBLE]. What I want to do now is, of course, in this case, just end comment what I commented before. And that, pretty much, what we have here.

OK, so we have first append this phone number, and then we insert the dash after the three characters, and then we insert the last one to keep the last four digits, keep them together. And then we'll go ahead and print the phone number. So of course, here, what we're going to do is run, in this case, the PersonTwoTest. So if you run it, of course you see here, how now we have the phone number, and it's exactly 555-123-4567.

Now, remember, folks, that in this case, we're just trying to, again, represent the output of phone number. That typically is how it's represented, if you want to look it up on the web or print it out and so forth. So it's always the first three characters that represents the area code, and then a dash, and then and the next three characters, then the dash, then the next four digits. In this case, since they're a number, we call them digits. Good.

Continuing with the practice, now, what we want to do, folks, and that would be step number seven, we want to use the substring method of the StringBuilder class to get just the first name value in the name object. Again, we use the substring method that takes the start index and the end index of the substring, and of course, we display this value using the system.out.printIn. So the syntax would look like what we have here, the object reference, a dot, the substrate method, and we represent the start and the end index. We should give you a note here that says indexes of characters in the StringBuilder class must, again, much like array indexes, are zero-based.

Again, the first character in the substrate is located at position zero, that would be the index zero while the start index of the substring method is inclusive. Again, it is the actual index of the first character you want returned. To the end index is exclusive, and of course, it is the index all the character just to the right of the last character of your substring. So the solution, in this case, would be, in our case here, if we want to, in this case, assume that the first name is Fernando.

So again, the first name here, and we'll just go ahead and invoke substring, and we say, again, this case zero eight. So again, pretty much trying to, in this case, print Fernando for us again. And of course, you see here we have 1, 2, 3, 4, 5, 6, 7, 8.

We save the file, and of course, we'll go ahead and test it and print it out, so that's it, in this case. Let's go ahead and do that. And for that, what I'm going to do, ladies and gentlemen, is just end comment what I already have here. So in this case, we'll go ahead and invoke the system.out.printIn method, to which we pass, again in this case, just a string concatenated by the name and invoke on it what the name we know. In this case, it's Fernando, space, Gonzales.

And then we invoke the substring method, pass zero and eight to it, and that, of course, will take care of business for us. Let's go ahead and run that, and of course, as you see in this case, it gives us exactly the first name, prints out exactly the first name. And that pretty much ends the second practice of lesson 6. Thank you.

## 6. Practice 6-3: Examining the Java API Specification - 5m

OK, now, let's look at the third practice and the last practice of lesson six. And here we examine the Java API specification. And in this case, we'll go ahead and take a look at the Java SE 7 API, which is installed on your machine. So again if you take a look here and on the browser, we have it here. So as you see on the top left here we have all the packages. And then on the bottom we have the classes that belong to a particular package. And then here we have, again, the different, in this case, packages and class at the beginning.

So continuing with the activity, particularly the practice three, and so, again, this is to view pretty much your Java SE 7 API. And of course, in this case, they want us to take a look at the Java doc link package. So we'll go ahead and click on that. And of course now going back, so let me just look it up. So if we just go a little bit, so here's java.lang. Here it is. So and of course, this shows me all the java.lang classes.

And then down here they're, of course, continuing with that. They want us to find the Math class and click it to display the documentation in the mainframes. So let's go ahead and do that. And for that we link on the Math class and as you see specifies now the class Math, which is, by the way, extends object.

All right so continuing with the practice, so this is exactly what we see. And then here it says, answer the following questions about the Math class. How many methods are there in the Math class? How do we do that? In general, what we do is once we have the class, we have actually hyperlinks so here like we showed you in the lecture. So if you click on Math here, that gives me again, in this case, the list of the methods. If you count all of these folks all the way one by one all the way until the end, you are going to find out that actually we have 54 methods.

And then of course, they want us to say how many fields are there in the Math class. Again, that would be easy. All we're going to do is go back, in this case, to the Math class and click on the field here hyperlink. And that gives me a couple of again, in this case, fields. And this is the one e and, of course, the pi. And as you see, these are the couple of fields. And if you take a look here, that was exactly the same.

Then it say here select several other classes in the classes panel. Again, they need us to answer, again, this question. What class does every class in this case refer to at the top of the page? Hint, what class is the super class of all these classes? We'll take a look and talk about this super class later on in one of the lessons that are coming.

So we take a look here, folks and just out of curiosity, if we take a look at the Math class, you see that this is a pretty much the super class. Let's go ahead and take a look at another class just out of curiosity. Let's say number, for example. And you see that it has also as a super class also the object class. So what it tells us here folks, and you can go ahead and look at any other class. Just scroll down and just select something else. How about the string?

Again, if you take a look at a string, again, the super class is always object. And so pretty much the class object is really the super class of all the classes that exist in Java. Again, when they tell us find the string class and identify the methods in the string class and, of course in this case, which methods enable you to compare two strings. And that's the compare to. Let's go ahead and do that. So here's the string class. And then we click on the methods. And then here's the compare to. You see here's the compare to. And here's the compare to ignore case and so forth.

And continuing with that, of course, and then after that they ask us to close the practice project on NetBeans practice six. Let's go ahead and do that. So we right click and we can close. And that is closed. And of course, this is so to prepare ourselves for the next practice, which will be the practices for lesson seven. And that pretty much ends the third practice and the last one of lesson six. Thank you.
