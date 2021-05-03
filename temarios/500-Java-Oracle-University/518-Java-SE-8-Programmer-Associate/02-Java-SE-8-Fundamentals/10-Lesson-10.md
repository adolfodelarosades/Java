# 10: Lesson 10: Using Encapsulation

1. Lesson 10: Using Encapsulation, Part 1 - 15m
2. Lesson 10: Using Encapsulation, Part 2 - 9m
3. Lesson 10: Using Encapsulation, Part 3 - 3m
4. Practices for Lesson 10 - 8m
5. Skill Check: Using Encapsulation - Score 80% or higher to pass

## 1. Lesson 10: Using Encapsulation, Part 1 - 15m

 
Lesson 10 is using encapsulation. So before, if you wanted to create a field, what you may have done is written public int x. Public, this keyword, is what's called an access modifier, and what we're going to talk about in this lesson is using a different access modifier, private, and applying that to fields and methods.

So we'll cover how to create get and set methods to control access to private fields. We'll define encapsulation as information hiding and show you how to go about implementing encapsulation with NetBeans, and finally, create overloaded constructors.

Let's get started with access control. Access control allows you to hide fields and methods from other classes, determine how internal data gets changed, and how to keep the implementation separate from the public interface. So what is the public interface? The public interface is what you see when you look up a class in the Java documentation. You get just the information you need to use a class. That is the signature for the public methods and data types for any public fields, but not the private stuff.

The implementation, on the other hand, the implementation of a class is the code itself. It's also any [INAUDIBLE] methods and fields that are used by that class. These are the internal workings of a class, and it is not necessary to expose them to other classes. That's what private means is let's not expose elsewhere. These have to be private. These are for us alone.

So let's talk about access modifiers. You're familiar with public already. Public means that the data-- that the methods can be accessible by anyone. Private, on the other hand, means it's accessible only within the class. So if you see this field here in line three, we have private double price. That means that the price variable is only accessible within the item class.

If there's a customer class, they're not able to access the price. And the reason why you'd want to have it that way is say you have a customer. If they were able to get access to price, that means they'd be able to edit it however they want, and they'd probably set the price of clothing to zero, which is great for the customer, not so good for the store.

So instead, if you take a look at line five, if a customer needs access to the price, we have what are called getter and setter methods. Line five offers you the ability to set the price. That is a customer can modify the price in a safe way. For instance, the method checks to see if the customer has a loyalty discount, and if that's the case, the price is modified, but it's done so in a safe way by making it 85% of what it was before.

Here's an example of another class trying to access the fields from the idle class. If you look at this line right here, item.price, that will compile. It will cause a compiler error, and the reason why is because item.price is trying to get this right here, a private field, which is not allowed anywhere outside of the item class. So if you would do another class, if you go to order class, this won't work, because you're trying to get to something that's meant to be private, that's only meant to be seen in item class.

So instead, what you have to do is go to the next line here. This will work, calling item.setPrice, and then passing it to customer. This works, because what you're doing is you're calling a public method. Public methods are accessible outside of the class, where they're implemented. Another benefit to having a setter method is that it allows you to perform any additional work, any additional calculations that need to be done before you set the value of a variable. If you look at the code example right here, line one, we have an int phone number, but here in line two for setting a phone number, we're actually taking in a string argument, string s number. And this is just like the example that we saw earlier. Same scenario.

What we need to do here in the implementation of the method, we have to do a little bit of work to remove the dashes out of the phone number and just take those substrings. And then once you have those substrings, we go to line five, and we convert that string into an integer. And then once that's done, we're able to save that integer as a value for the variable phone. So now phone has what our value is being returned from this method. You could also apply the private access modifier to methods. This is useful for any methods that you don't want the outside classes to know about or something that's only meant to be called once outside of a constructor.

So if you look here at line 13, we have our private method set ID. The reason why it's private is because it's something that we want to happen only once. We don't want this to be called ever again outside of the constructor right here. So by keeping it private, what that means is you can call this method anywhere in the item class. You're not allowed to call it anywhere outside of the item class. And that gives this class-- it gives you control over when this method is going to be called. In this case, we only want to call it once, which is here, line eight in the constructor.

Encapsulation-- encapsulation means hiding object fields. This is done using access control, which means making use of the private keyword. Encapsulation provides safe access using getter and setter methods. If you have any fields that need to be accessed, getter and setter methods allow you to control how this data is accessed and how this data is modified. Setter methods, in particular, ensure that only valid or only desirable values are assigned to fields and make sure that they're not changed in a way that could compromise the program, cause things to go awry, or just values that don't make any sense, things like that.

Encapsulation mandates programming to the interface. For example, a method can change the data type to match the field, and this is our phone number example. We have our data, which is we're getting a string, and we do a little bit of work, a little bit of processing, little bit of math, and we end up getting an int from that process. Initially, a class can be changed as long as the interface remains the same, and in general, encapsulation encourages good object-oriented design.

So we'll first talk about getter and setter methods. You notice here that all of these fields are marked as private. The reason why is because it limits the chances of anything going wrong, of data being used or manipulated in a way that's not desirable. If any of these fields do need to be accessed, that's when you provide a getter method, shown here in line seven. If the color code needs to be seen outside of the Shirt class, a public getColorCode method allows the value of Color Code to be returned. And that's what a lot of getter methods are actually. They're a method type that matches the type of data of the field that you're trying to return, and they're usually pretty short too.

If you look at line 10, line 10 provides a setter. You would want to write your own setter method, if the data that's being set-- if you want the data to be changed outside of the class. Another benefit of a setter method is that it gives you the ability to dictate how you want this data to be set, to make sure that it's not set in a way that-- if for Color Code, for example, we would want to make sure that we don't get any bogus values, any values that aren't, in this case, aren't red, aren't blue, aren't green, aren't unset. Make sure that's a value that's actually usable within our program.

What we have here is a pretty simple setter method, because all it's doing is providing you the freedom to, hey, let's enter in a new color code, and then we set the value. It's not doing anything to make sure that our values are set to values that we want, which would be red, blue, green, unset. It could be anything. So even though, yes, we do provide a setter, there may be a more sophisticated way to go about this, and I'll show you that in an upcoming slide.

The danger of what we have right now, though, is shown in this example. Take a look here at line six. What we're doing here is we have a shirt. We're setting the color to red, the color code to R, R for red. Then we have this little temporary variable here, color code red, and we're setting the value of that to the getter. So we can call this, because it's a public method, even though we're not in the Shirt class. We're in the Shirt Test class instead. We're allowed to call it getColorCode on a shirt, because it's public.

So we do that, and we're returning a value that can be stored in this variable, Color Code-- the value being the character R. And then when we go to print it out in line eight, this is what we get. Color code R-- that works. But take a look at line 10. What we're doing is we're setting the color code to something that's not going to be a valid color. Z doesn't represent a valid color, but there's no checks or anything to make sure that we're actually setting the color code appropriately. So we end up assigning at the very end color code Z, which doesn't make a whole lot of sense.

What you do instead is rewrite the setColorCode method to perform some checks to make sure that we're setting the values correctly. So here, we're checking to see if it's an R. If not, OK. Maybe it's a G instead. No. Anything else? Could it be B for blue? No. And if not, then we're just not going to set the color code. It's going to remain as a U, and then we print out an error message saying, hey, that's an invalid color. It has to either be red, green, or blue.

If we do put in a valid value, however, like say we put in G for green, what's going to end up happening is we'll perform the first check here. Is it a G? No. OK. Let's move on. Is it an R? No. Let's move on. Is it a G? Yes, it is. All right. So now we can set our color code safely and know that we're working with a valid value. So line 17, this color code actually refers to this dot color code, which is the field. Then you return.

So you actually can have returns in void methods. You just can't return a value. So in this case, what's happening here is when you type in return, that just ends the method. So all this stuff down here-- that's not executed. Returned just ends it.

So here's an example. Now that we've modified the setColorCode method, here's the same example again. If we tried to set the color code, line seven, to something that's invalid, we'd get our error message. And the color code stays U. It stays undefined or unset. Now I'd like you guys to give encapsulation a try in Practice 10-1, and try encapsulating the Customer class.

## 2. Lesson 10: Using Encapsulation, Part 2 - 9m

 
Practice 10-1 allows you to encapsulate your class manually. So I personally prefer to do it manually, but we also promised to show you how to do this automatically using NetBeans. So I'm going to pull up NetBeans, and I'll show you that trick. So here we have our shared class in NetBeans. And what I'm going to do is show you a trick. On Windows, I'm going to right click, pull up a menu, go to Refactor, and then Encapsulate Fields. So all these private fields that I have, I'm going to create getter and setter methods for these automatically.

So I'll select all, Refactor, and look. There they all are. I don't have to type all that. The setters that NetBeans provides, they're pretty simple. So if you do want to provide any additional logic for being able to [INAUDIBLE] set these values like the color code, for example, you'd have to do that work yourself. But if you just want a pretty simple, straightforward setter, simple getter, NetBeans can do that for you.

And it's a feature that you're welcome to take advantage of. Personally, I prefer to type it all manually, though, because it gives me more control. Let's get back to the lesson.

We're going to talk about overloading constructors. If you look at this code example, lines six through eight, we're setting the values of a shared object. We're setting those one by one. And you can do this, although it's more efficient to do this using a constructor. That way, all the work can be done in a single line. And this is the most common way to use a constructor. Constructors are usually used to initialize fields in an object. They receive arguments. When you create a constructor with arguments, it removes the default, no argument constructor.

So I'm sure if you remember earlier when we created objects, we would do something like this. We'd do Shirt myShirt=newShirt. So this is what we call a zero argument constructor. If you decide not to write a constructor of your own in the Shirt class, Java will provide one for you, and it's going to be a no argument constructor. That allows you to call this to instantiate your new objects. This is a constructor call, and we're calling default constructor that Java provides.

If you decide to write your own constructor, then this goes away. You'll actually have to fill in, provide the arguments that you want. So here's the code example of what I mean. Lines eight through 12-- this is a constructor that we write. So we no longer have Java providing us the default constructor. Instead, we have a constructor here, where we, in order to call it, need to provide an argument for color code, need to provide an argument for description, need to provide an argument for price. And those values are all set here in the constructor.

Yeah, and the default constructor-- it'll go away, which means this is now invalid syntax, so anywhere in your Java code, where you had previously called that constructor, NetBeans is now going to complain. It'll say that it can't find the symbol, meaning I can't find this constructor written anywhere.

So you have a couple options. You need to either call the other constructor, call the one that has the arguments, so you do myShirt=newShirt, and then you provide arguments like color code, B for blue, description, fabulous, and what's the last one? Price, $19.95. So you have to provide these additional arguments.

Another thing you can do is write the no argument constructor yourself. The one that Java automatically provides goes away, but that doesn't mean you can't write your own. So really, you can do what's called overloading constructors. Continue to overload them, and provide different variations of the same constructor. They all need to start with public shirt, shirt being the name of the class. That part's going to remain the same. What's going to differ is like any overloaded method, the number of arguments, the order of arguments, and the type.

So here, we have-- these are actually varying by number. This here, we have one argument. In this example here, we have two arguments. And when you go to call these constructors, Java's going to be smart enough to figure out which one you mean. So here's the question. Why would you ever want to go about doing this? Why would you ever want to overload a constructor? Why would you ever want to overload a method in general?

I'll show you an example using Java Puzzleball actually. So when I was writing Java Puzzleball, I added these little lights here at eight different points, and the reason why I added these, I thought it would help people realize where these slots are going to snap to. Because they snap every 45 degrees, so if you do something in the middle, it won't stay there. It'll snap to the nearest 45 degrees. So I thought having eight little marks, I thought that would show you where it would snap, and then I thought, if I had one of the lights glow to light up as yellow, I thought that would be easier to show people which one it's going to snap to.

So when I instantiate these, I'm calling the constructor, but in eight of the nine cases, they're going to be created not lit. Only one out of nine of the times is it going to appear lit. And so when I was writing it, I got a bit lazy. I thought, I don't want to have to type additional information to say it's going to be lit or if it's going to be not lit.

Most of the time, it's not going to be lit, and I didn't want to provide that extra Boolean to say it's going to be lit or not lit. So I wrote one version of the constructor, where I didn't have the Boolean. I just set the value automatically in the constructor to false. And then I overloaded that constructor by providing an additional argument to say whether it is lit or not.

So what that does is it saves me time. It means eight of the nine times, I don't have to type a little something extra. And that brings us to Practice 10-2, creating your own constructor. You can continue with your code from the previous practice, or you could open up Practice 10-2. So I'd like you to give this a try.

## 3. Lesson 10: Using Encapsulation, Part 3 - 3m

Now that you've completed practice 10-2 on creating a constructor, that brings us to the end of this lesson. And in this lesson, you should have learned how to use public and private access modifiers, restrict access to fields and methods using encapsulation, implement encapsulation in a class, and overload a constructor by adding method parameters to a constructor.

There are a couple other things we want you to do before the start of the next lesson-- the next lesson being more on conditionals. Try Basic Puzzle 12 and we're going to talk about it briefly in the next lesson. And the question I want you to think about is what happens if the ball strikes the blade? And to do that, you'll need to make sure you're making use of this icon.

And there's one homework assignment. It's practice 10-- one more homework assignment. It's practice 10-3, Using Encapsulation. In this practice, you're asked to encapsulate the code you've written in the soccer league application. This includes creating constructors. You're told what must be encapsulated, but figuring out the implementation details is up to you. You're also asked to remove some methods-- a method from GameUtils.java and to test your code by printing four games instead of one. Although in theory, your code should be able to accommodate any number of games.

I'll show you what the output looks like in NetBeans. But again, we've written this to be open ended, to give you a chance to figure out the solution, to implement your code the way you feel is best.

So if we go to run the code, you'll see that-- OK, here four games are being created. If you go to run the code again, OK, well these games are different. Our first game not only has one score, let's run it again. OK, now our first game has a ton of scores. So these games are being randomly generated. This is what the output of your code should look like.

So with that, good luck on this practice.

## 4. Practices for Lesson 10 - 8m

Practice 10-1 is to encapsulate the customer class. If you try this on your own but can't figure out a solution, this video will provide you with a walkthrough. The first thing you will need to do is to open the project Practice_10-1. Two, is to change access modifiers so that fields must be read or modified through public methods. Three, allow the name field to be read and modified. And four, allow the ssn and field to be read but not modified. This is otherwise known as read only.

Let's go to NetBeans and try and figure this one out. So the first step in encapsulation is making sure that instead of having the public access modifier, we use the private keyword. Now we need to provide, let's see, so name is supposed to be read and write. So we have to provide a getter and a setter. OK, so the type is a string, so we need a public String getName method.

And getters usually don't take any arguments. In this case, I don't see us needing one. And then, we have to return. Since it's a string kind of method, we have return a string. And that's going to be the value of name. And we have to provide a setter now, public void because it's not going to return anything-- it's just going to do some work, and that's going to be the end-- setName, and we have to provide an argument here. So we'll write a parameter (string n).

This we're going to be setting the name to. Then within our curly braces, this is the body of the method, we'll type name =. So the new value of name is going to be set to whatever the value of n is. We could have also written this.name. It's the same thing. Ah, but not .name name. One last thing. We have to work on encapsulating ssn because this is supposed to be read only.

So that means we don't provide a setter. It doesn't need to be modified, just needs to be read. So for that we need a getter, which is public, it's a String getSSN. And then, we have to return a string. We're going to return the value of a ssn. There, that's it. That is a solution for this practice. Although, we won't be able to test it until the next one where we start modifying the shopping cart. That's OK, let's get back to the lesson now.

Practice 10-2 is to create our own constructor. If you've given this exercise a try but haven't found a solution, this video will provide you with a walkthrough. The first thing we need to do is to continue editing practice_10-1, or open practice_10-2. I'm going to keep editing what we have already though. Two, in the customer class, add a custom constructor that initializes as fields. Three, in the shopping cart class, declare, instantiate and initialize a new customer object by calling the custom constructor. Finally, four, we'll test it by printing the customer object name.

So let me pull up NetBeans and try and figure this one out. So here is where we left off before. I'm going to keep editing practice_10-1. So we need to create a constructor. Constructors usually are written between the fields and the other methods, or at least that's how I like to do it. So to create our own constructor, it's going to be public. And the constructor has to be called the same thing as the class we're working on.

So it's going to be public Construct-- no, why did I do that? Not constructor. Customer. No, I spelled it wrong. OK, and we need to provide some arguments. What arguments do we need to provide? We need to create parameters for String name, and String ssn. And then, we need to set those. So we'll set this referencing the current object, the current customer.

Then dot, and we'll see its fields. So we want name =. The field name is going to be set equal to the parameter name. And the field ssn is going to be set to the parameter ssn. That's all the work we need to do in the customer class.

Moving on to the shopping cart class, now we're going to be able to test what we've written. So let's create a customer. Customer cust1 = new Customer. And I tried calling the default constructor. This doesn't work, because now we've written our own and we need to provide arguments for it. So let's see, what should our name be? It'll be Bob Miller? OK.

And ssn, let's make up something, 55-44-3212. OK, let's go with that. And now we have to do a print statement to test what we've done. System.out.println("Customer name"), and that's going to be cust1.-- so this menu popped up, and I don't see anything here that says I can access the name field directly. And that's what we want. The name field is private, so it's not going to appear to any classes outside of the customer class.

Right now we're working with the shopping cart class, which means, no, we're not going to see anything private in the customer class. Shopping cart doesn't have access to the customer private stuff. But we do have a public getter method. So we'll call that and see if our program runs. Oh right, we have to select a main method too. Yeah, Bob Miller, that's our name. All right, so that is a solution for practice 10-2.

## 5. Skill Check: Using Encapsulation - Score 80% or higher to pass

Skill Check: Using Encapsulation

View Skill Check

