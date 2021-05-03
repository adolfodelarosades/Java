# 14: Lesson 14: Using Interfaces

1. Lesson 14: Using Interfaces, Part 1 - 26m
2. Lesson 14: Using Interfaces, Part 2 - 9m
3. Lesson 14: Using Interfaces, Part 3 - 4m
4. Practices for Lesson 14 - 11m
5. Skill Check: Using Interfaces - Score 80% or higher to pass

## 1. Lesson 14: Using Interfaces, Part 1 - 26m

Lesson 14 continues discussing polymorphism inheritance by going into interfaces. After completing this lesson, you should be able to override the toString method, which is found in the Object class; implement an interface in a class; cast an interface reference to allow access to an object method; and write a simple lambda expression that consumes a Predicate.

All right. So let's continue our talk about inheritance by discussing polymorphism that's found in the JDK foundation of classes. And this comes in the form of Object.

So all objects that you create in Java, they implicitly inherit from the Object class. Even if you don't, you don't even have to write at the very top-- [? extends ?] Object. It's automatically done for you. So all classes have Object at the root hierarchy. This means that all classes have access to the methods of Object, being the root of the Object hierarchy.

Object does not have many methods-- only a few basic ones. But one of the most useful ones is toString. The Object toString method gives very basic information about the object. Generally, classes will override the toString method to provide more useful output. System.output.println uses the toString method on an object passed to it to output a string representation of that object. I'll discuss more about this in this slide right here.

So if we take a look at the first example, here we have System.out.println. And we're passing in a new object. The results of doing that though is if you look down below here at the output, look at the first line right here.

So here's what's going on. An object object. This calls the toString method of the base class. It returns the name of the class [? java.lane.object ?], an at symbol, and a hash value. You could also think of this as like a location [? of ?] memory. It's pretty close of a definition. But, yeah that's how I like to think of it. So it returns a hash value of the object. It's a unique number associated with that object.

If you look at next example here, we have StringBuilder, a new StringBuilder object that's being printed out. And the output for that is here, Some text.

What's going on here is that our StringBuilder object, the StringBuilder class overrides the toString method. And as a result, instead of printing out what we have before-- the class name, the hash value; instead of printing out that, which you could think of, hmm, this might be gibberish-- it prints something useful. What it does, it returns a string, which happens to be this string right here.

If you look at the next example, so the first object is a fake class. We made it up just for the slide. But what's going on here is that first doesn't override the toString method. So the toString method called is the one inherited from the object class. So what we have, we have the class name, the at symbol, and then the hash value.

The final example, the second class, and the second class is something we also made up for the slide. This one does override the toString method. And instead of printing out gibberish or techno babble, or the hash value, we're printing out useful information.

All right, let's keep going. What I'm going to talk about now though is how you go about overriding the toString method.

Here's an example. This is our share class. And all you have to do is write public String toString. It's just like overriding any other method. And then you have to be sure to return a string value, which is what we're doing right here.

The output of System.out.println shirt, because this here is in the Shirt class. If you don't override toString this is what you'll get. You'll get the package name, the class name, the at symbol, then a hash value.

If you do override toString, like we do right here, this is the output that you'll get. You'll get something that's actually readable, that could actually be useful to the user. So we get the string, "This is a T-shirt." Here's our price. Here is the color. This is actually useful information for the average user. It's not the techno babble that you see right here.

Let's continue on by talking about interfaces. So here's the dilemma. Say you want to inherit from two different classes. You have the Red Class. You have the Blue Class.

In each of these classes [INAUDIBLE] has a method print that we're implementing. One says the implementation for print in the Red Class has a printout "I am Red." Implementation in the Blue Class says, "I am Blue."

Let's say we have Purple Class. And it's going to extend both Red and Blue. If we go to call the inherited print method, which print method is going to be called? Is it going to print out "I am Red"? Is it going to print out "I am Blue"?

This is a dilemma. And what Java does to get around this is it says, no, you can't extend more than one class. You pick one, and that's it.

So this syntax right here actually won't be allowed. We'd have to choose do we want to extend Red? Do we want to extend Blue? But we can't do both.

Instead, what Java provides if you do want to get functionality from two different places, it provides what are called interfaces. A Java interface, it's similar to an abstract class, only that methods are implicitly abstract, which means you don't have to include the abstract keyword.

And here's an example of that if you look below right here. We have our interface in line 1. And they're declaring it just like a class. But instead of saying public class Printable, you say public interface Printable-- printable being the name of the interface.

And if you look at line 2, here we have a method-- public void print. And it's implicitly abstract. We don't have the abstract keyword. We do have a semicolon. And we have no curly braces, because there's no implementation.

When you want to have this functionality somehow inherited, you, instead of writing extend, you write implements. And this is shown in line 1 right here-- public class Shirt implements Printable. And you may implement more than one interface.

But one thing that you have to do when you implement an interface, you must provide an implementation of the methods from the interface. That's why the term "implements" is kind of a giveaway there, saying what you need to do.

So here you have, from this interface, you have a method that's not implemented. What do you need to do if you implement the interface? You need to provide an implementation, which is found here.

So now we have public void print, and then we have our implementation. We have some functionality. The curly braces, and then the code we want-- printing out a Shirt description.

So the one other thing I'll add about interfaces is that you actually do have an option of having what's called a default method in an interface. And for that you just add in the default keyword public, default void.

And this allows you to provide an implementation. But if you ever do come into a situation where you are implementing two different interfaces-- like say we had interface Red, interface Blue, and they both had a default method for print, if you go to implement both of them, the result is the same. You need to provide some clarification to Java.

And you do that by providing a new implementation in the class that's implementing both in interfaces. So you'd have to write your own implementation of the print method within that class to avoid any of the conflicts.

Essentially it's Java saying, well, I'm getting this method from both Red and Blue. I'm going to throw them both away. And it's up to you to figure out, to be the voice of reason, to say what you want the actual functionality to be.

OK. Multiple hierarchies with overlapping requirements. Let's say the [? Duke's ?] Choice clothing catalog wants to support both clothing and outdoors. Something that may be unique to outdoor equipment is that outdoor equipment may have a weight to it that you need to take into consideration. But if you look at something that they'll all have in common, if you look at shirts, trousers, tents, the camp stove-- these are all items that you may want to be returnable to the store.

Stove fuel would be different. That wouldn't be returnable. The reason why is once you use it, it's gone. There's nothing to return.

So you don't want to duplicate your code in order to facilitate that cut-off functionality. So what's the best way to make sure that these objects here are able to be returnable, and without duplicating your code?

So let's think of a few ways that we could possibly do this. One is a new superclass. A new superclass won't work, because a class can only extend one superclass. And currently they're all either extending either outdoors or clothing. And we can't extend more than one. So that won't work.

We could create a new field called Returnable, and add that to all the classes that we want to be returnable. The problem with this is even though it's possible, there's no single reference type to be passed to the method that instantiates or processes a return. So that wouldn't be the best option.

The best solution is to make use of an interface. Any item you want to be returnable should implement the Returnable interface. The diagram in the slide shows all returnable items implementing the Returnable interface. Which means all of these items right here, all these classes, they now have access to the doReturn method, the methods that are found in the returnable interface.

They, of course, need to implement. So it's a default method. They need to provide an implementation for this method. But now you're able to also instantiate these objects as returnable, or pass returnable type object reference into methods, which helps a lot with being able to process things that you want to be returnable.

So how do you go about implementing the Returnable interface? That's shown in this slide. The first thing we have to do is have our interface.

Look at line 1 at the top. We have public interface-- instead of writing class, we write interface-- Returnable. And then we provide our method, the doReturn method, which is implicitly abstract. We don't have to write abstract, like you would with an abstract class.

But there is no implementation. Instead of having the curly braces followed by your implementation, we have a semicolon. And then in the Shirt class, or any other class that we want to implement the Returnable interface, we write implements Returnable.

And then the last thing we have to do is provide an implementation for any of the unimplemented methods from that interface. So if you look here at line 7, 7 through 10, here we're implementing our doReturn method. That's the only method that we're getting from our interface.

So we have to provide our implementation. That's down here. All we're doing is just returning a string. "Suit returns must be within three days." So that's what we do here for this particular case. But you can provide whatever implementation you want.

If you want the implementation of this method to be different in the Shirt class, be different in Trousers, different in Tent, different in Camp Stove, whatever kind of differences you feel are best, whatever sort of differences you need to accommodate, that's fine. You don't have to provide the same implementation. If you did want to provide the same implementation, though, that's where default method can be handy.

Talking a little bit more about object reference types. The reference used to access an object determines the methods that can be called on it. So in the case of an interface reference type, in this slide, Returnable is going to be our reference type. So our reference variable is going to be r1.

r1, these objects only have access to the methods that are found in the returnable interface. That's shown right here. If you have an object r1, the only thing you're able to do with that is r1.doReturn. You're not able to type r1.getFit. You're not able to type r1.getId. The reason for this is getFit, for example, is part of the Trouser class, and getId for example, is part of the Clothing class.

If you were to create an object using Trousers, so we have our Trouser reference type with a t1 variable, because Trousers is going to extend Clothing, and it's going to implement Returnable, a Trouser reference type object is going to have access to all of these methods. It's going to have, of course, it's naturally going to have access to its own methods, which are found here.

Then, because it's implementing Returnable, that gives it access to the Returnable methods. And because it's extending Clothing, that's going to give it access to the superclass methods here-- Clothing.

The final example is clothing reference type c1 variable. So for that you only have access to the methods found in Clothing. That would be right here.

So you would be allowed to type c1.getId. But you wouldn't be allowed to do c1.getFit. Why? because getFit is not found in the Clothing class. It's found in Trousers.

So remember, because objects Returnable only have access to the doReturn method, you're not allowed to type r1.getFit, because getFit belongs to trousers. This isn't allowed.

But what you can instead do is cast. Use casting to access methods defined outside of the interface. So that would be parentheses Trousers, the type you want to cast to, the reference variable. And then, if you want to go ahead and call any methods found in the Trousers class, be sure to include additional parentheses, then the dot operator, and then whatever method it is that you want to call.

But to be sure that you're doing this safely, make use of the instance of keyword, and perform your check to make sure it's a valid form of casting.

Moving on to using List interface. Moving on to using the List interface, the collections framework is located in the java.util package. The framework is helpful when working with lists or collections of objects. It contains interfaces, abstract classes, and concrete classes. An example of this would be the ArrayList class.

Some of the best examples of inheritance and the utility of an interface and abstract types can be found in the Java API. The ArrayList class, for example, it extends AbstractList, and AbstractList in turns actually extends AbstractCollection. AbstractCollection implements the List interface, which means that ArrayList also implements the List interface. And an ArrayList object reference can access methods of all the interfaces and the superclasses that are shown on the slide.

As a matter of fact, ArrayList implements a whole bunch of interfaces here. One of the interfaces that the ArrayList class implements is the List interface. The List interface is actually implemented by many classes. This means that any method that requires a list may actually be passed a list reference to any objects of these types-- just not abstract classes, because those actually can't be instantiated.

So for example, you might pass an ArrayList object using a list interface. Likewise, you can assign an ArrayList object to a list interface variable, as shown in the coding example below.

If you look at line 1, an ArrayList of string objects is declared and instantiated using the variable "words." And then line 2, the words reference is assigned to a variable type List.

The java.util.Arrays class has many static utility methods that are helpful in working with arrays. One of them gives you the ability to convert an array to list. So here is a code example of that. Here we have our array in line 1 of numbers-- well, strings that are numbers-- one, two, and three.

And then line 2, we're converting this to a list. So List is our reference type. Our reference variable is myList. And here's the syntax that actually does the work of converting the list to an array-- excuse me-- converting the array to a list.

This was where num goes, nums being our string array. Then asList. This does the work of returning a list. And then we're saving that, of course, as a list.

List subjects can be many different types. But what happens if you need to invoke a method belonging to an array list? So in the first example, you can do this. So this is myList. You can call myList.replaceAll. And the reason why you can do this is because replaceAll, this method is coming from the List interface.

What you can't do, though, is removeIf. Can't do this. The reason why is because removeIf doesn't come from the list interface. It's something that comes from collection. Collection happens to be a superclass of the ArrayList.

But yeah, the important thing to note is that, no, you can't do this. Why? Because it's not implemented in List, or it's not available in List, even if it's not implemented. It's just not there.

But what happens if you want to convert an array? You have an array. You convert that to list. But maybe you want to work with that as an ArrayList, because that would give you access to a bunch of other methods shown here, like this. So what if you do want to take advantage of removeIf?

What you need to do is there's a couple ways to go about this. The first is done in three lines. You take your array. You convert that into a list. And then you take that list, convert it into an ArrayList.

There's a shortcut to doing this, though. And that's shown down below. And what's going on here is the first line is the exact same thing as the one above. We have an array of strings. And then we're creating a new ArrayList here. So ArrayList of Strings, myArray equals new ArrayList.

And then you just copy the same syntax that's shown up above. It's returning a list, but that's OK. You can do that, and then have that be stored using an ArrayList reference type.

And that brings us to Practice 14-1. So referencing the past few slides, I want you to try for yourself converting an array to an ArrayList. And just remember, there's two parts to this practice. So be sure to get to both.

## 2. Lesson 14: Using Interfaces, Part 2 - 9m

Now that you've finished practice 14-1, we're going to move on to lambda expressions.

OK, here's an example. Suppose you want to modify a List of names, changing them all to uppercase. Does the code below change the elements of the List?

If you look here at lines 4-- sorry, no, 5, 6, and 7. So what's actually happening here is we have our List-- mylist-- we're looking at each individual String s on the list. And then we're printing out the toUpper version of those.

So yeah, you will get the printout where they're all caps, but if you go to print out the values again after the loop is concluded in line 8, you'll find that the actual strings, they haven't changed. They haven't been put into toUppercase.

The reason why we get uppercase here is we're not working with the List. We're working with s, s being a temporary string that was created just for that for loop. And then once the for loop has executed, those temporary values, they just go away. And instead, the original strings, those remain unchanged.

Now, what you could do to change them is you'd have to create a new string and then put those into the List. But that's a bit cumbersome, and it takes a few lines of codes to do. So what if I said that all that work could be done in just a single line of code? It can. And that's done using lambda expressions.

ReplaceAll is actually a default method in the List interface. It takes a lambda expression as an argument. So here we have our ArrayList of strings, mylist. And we're calling replaceAll. And then we have our syntax for a lambda expression.

For every String s, change those to be toUpper. And we don't even-- we actually don't even need to say what kind of variable the s is. We know it's a string. And the reason why Java knows it's a string is because mylist was declared earlier to be a List of all strings, to be an ArrayList of all strings. So that's why it's not even necessary to write String here, because we've already said it's a string. So Java's smart enough to know what's going on.

Lambda expressions are like methods used as the argument for another method, and they have everything a method has. It has input parameters here and here. It has a method body which would be shown up here and down here. And it has a return value.

And so even though these-- both statements, the long version and the short version, they're both the same. I've mentioned before, you don't need to specify that s as a String. The reason why is because we've already said what we're dealing with in mylist. Because when we created the List, we said, yes, we're going to be dealing with strings, so there's no need to define them again. So you can write String if you want to. You can do this. But you don't have to. You could just write s.

And likewise, you don't need to have a return statement. You can if you want to. But because Java knows what ReplaceAll is supposed to do, it knows that it's supposed to return a string, you don't need to write the return statements in the lambda expression. You can if you want to, but there's no need to.

There are three enhanced APIs that take advantage of lambda expressions. In this course, we'll talk about just a few that are found in java.util.functions. These provide target types for lambda expressions.

The other things that are listed here are beyond the scope of this course. But if you want to find out more information, there is the Java SE 8 programmer course and Java SE 8 New Features course.

But just real quick. So as of Java 8, we have java.util.stream, and this provides classes that support operations on streams of values. And then in java.util, java.util has existed already, but it's been enhanced so that interfaces and classes that make up the collection of framework have enhanced use of lambda expressions, and this includes Lists and ArrayLists.

Oh, know what else you can do? There are the lambda puzzles in Java Puzzle Ball. So that actually talks a bit more about streams. It gives you syntax that you could-- if you want to give those puzzles a try, try to make sense of the syntax.

I think that's something that you guys could do. They're also fun puzzles. So I definitely recommend giving that a try if you have some free time.

As far as lambda types, a lambda type specifies the type of expression a method is expecting. ReplaceAll, that we've talked about, takes a UnaryOperator type expression.

All of the types do similar things, they just have different input statements and outputs. In general, if you want more information on lambda types, you can consult the Java documentation in the func java.util.functions package. There's a great many of these, and they're actually all interfaces. They specify the interface of the expression, and much like a method signature, they include the input statements and outputs for the expression.

Going more in depth into the UnaryOperator. It has a single input and returns a value of the same type as the input. So for example, with replaceAll, a String goes in, a String goes out.

The method body acts upon the input in some way, returning a value of the same type as the input value. Yes. Other words, String goes in, String goes out. ReplaceAll being the example, here's our input string. The output is going to be a string, which happened to be converted all toUppercase. Like this sort of format, this sort of syntax, this is what we consider the UnaryOperator, the type of lambda expression.

There's another type of under expression, though, that we'll cover, and that's called the Predicate lambda type. A Predicate type takes a single input argument and returns a Boolean. So for example, String goes in, Boolean goes out.

RemoveIf is an example of this-- it's an example of a Predicate type expression. RemoveIf removes all the elements of an ArrayList that satisfy the Predicate expression. So for example, we have our ArrayList, mylist, removeIf, and here are our lambda expressions, and they're of the predicate type.

So what do we check? Check for each string in this ArrayList. If the string equals Rick, remove that name for the ArrayList. And that changes the ArrayList such that Rick is no longer there.

The second example, removeIf, check each string to see if the length of the string, see if the length is less than 5. If it is, remove that from the ArrayList. So this lambda expression ensures that all the tiny names are completely gone from our ArrayList.

And that brings us to practice 14-2, using a predicate lambda expression. Give this a try, and then we'll come back for the conclusion of the lesson.

## 3. Lesson 14: Using Interfaces, Part 3 - 4m

After finishing practice 14-2, that takes us to the end of the lesson. In this lesson, you should have learned how polymorphism provides the following benefits-- that different classes have the same methods, that method implementations can be unique for each class. Interfaces provide the following benefits-- you can link classes in different object hierarchies by their common behaviors, an object that implements an interface can be assigned to a reference of that interface type. And lambda expressions allow you to pass a method call as an argument to another method.

The homework for this lesson is to do practice 14-3, Overriding and Interfaces. In this practice, you are asked to enhance a soccer league application by finishing the if notation features mission in previous practices. It's up to you to figure out the implementation details, though. But what I will do is, I'll do a quick comparison of this version versus the previous version of the soccer league application. I'll show you an example of some of the features that were left incomplete.

You should consult the homework for all the details. I'll just show you a more obvious example of what we need to enhance. So if you look at the previous version of the soccer league application, we go to run this, and we'll notice that-- here's our output. A couple things that are not so good about this-- we don't have a very good label for differentiating goals and possessions. It's a bit messy. And so that's something that needs to be cleaned up.

We were also counting possessions as goals. And there has to be a way to differentiate the two. Right now, in this game, there's only one goal, but it's counting both the other possessions as a goal as well. So that's something that has to be enhanced.

What you should have at the end of doing the homework assignment is-- here's an example of it being fixed. Possessions and goals now have a much neater label. We just call them "Possession" and we just call them "Goal." We don't have a hash value or the package followed by the class. None of that messy syntax. And we're also differentiating possessions from goals. There's only one goal in this game, and that's reflected accurately in the score.

So those are a couple of examples. There's more things specified in the document for this homework. So it's open-ended and it's up to you to figure out what you feel the best implementation is. We've given you all the information you need to know in the lesson to be able to find a solution. So good luck.

## 4. Practices for Lesson 14 - 11m

Practice 14-1 is Converting an Array to an ArrayList. If you've given this practice a try on your own and you've gotten stuck and couldn't find a solution, this video will provide you with a walkthrough. The first thing you'll need to do is to either open the project Practice_14-1 or create your own project with a Java Main Class called TestClass. In this video, I already have Practice_14-1 pulled up in NetBeans, so that's how I move forward.

Step 2 is to convert the days array found right in that class, convert that to an ArrayList. Use Arrays.asList to return a list. Use that list to initialize a new ArrayList. And preferably, do this all in one line.

Step 3 is to iterate through the ArrayList. Step 3 is to iterate through the ArrayList, testing to see if an element is sunday. If it is sunday, we'll print that out, convert it to upper case, and do that using a couple methods, the Boolean equals method and the void toUpperCase method. Otherwise, we'll print the day anyways, but we won't convert it to upper case.

And then Step 4, after the for loop, print out the ArrayList. While within the loop, was sunday-- a couple things to ask while within the loop. Was sunday printed out to upper case? Was the sunday array element converted to upper case? After this video I'll explain what was going on in the next topic.

All right. I have the project in NetBeans, so I'll pull that up. And here we have our array of days. The days aren't in any particular order either. And now I need to convert this into an ArrayList and try to do that all on one line.

So the syntax for that is ArrayList, String. We're going to call this dayList. All right. dayList is going to store our ArrayList. That's going to store the ArrayList which was converted from an array.

Create it as a new ArrayList? All right.

And now we have to do the work of actually converting the array into a list. So that is Arrays.asList. And what's the array we want to convert? days, right here.

All right. So we've done that all in one line. And NetBeans is going to complain because it wants me to do the import statement for ArrayList. OK. That was easy enough.

All right. Let's keep going. We have to set up a for loop, because we've got to iterate through the ArrayList. So we'll have for-- for every string s found in dayList, what should we do? Well, we have to find out first if it's a sunday, so if s.equals sunday-- "sunday" in quotes-- then we'll print it to upper case. s.toUpper. All right.

Else-- so what else we have to do is have to print it anyways, but we don't have to turn it into capital. We don't have to capitalize it. So we have out and then-- let's see-- System print line dayList. No? s. We just want to print out s. Right. Yeah. That looks right. So print that element, just don't cover it to upper case.

And then at the very end, we're going to check each element in the ArrayList again. And the reason why we're doing these is we want to see if they've changed, if sunday actually becomes to upper. In other words, are we actually changing the entry in the ArrayList to be upper case?

All right. So now lets' run the program. So why isn't this working? Because I should have converted sunday-- because I'm not supposed to capitalize sunday. OK. Because yeah, they're all lower case in the array.

So no let's run it. Now we should get-- OK, yeah. Sunday, that is capitalized. And that's happening when we're running through the for loop. But at the very end here, where we're going to print out the array, sunday hasn't changed. Hmm. I wonder why. And that's something we'll explain coming up in lecture. That's the end of this practice.

Practice 14-2 is Using a Predicate Lambda Expression. If you have tried this on your own and have gotten stuck or couldn't figure out a solution, this video will provide you with a walkthrough. To get started, open the project Practice_14-2. And then in the ShoppingCart class, take a look at the code and you'll see that an items list has been initialized with two shirts and two pairs of trousers, two shirts, two pairs of trousers.

In the were removeItemFromCart method, use the removeIf method, which takes a Predicate lambda type, and remove all items whose description match the description argument. And this will be something that we're passing to the method. We'll pass the description to the method. Then based on that description, the method will remove all of the items that match that description.

Step 4, we'll print the item list. And we'll do that using toString. Use the toString method from the item class, which has been overridden to return the item description. 5, we'll call the removeItemFromCart method from the main method. And we'll try different description values, including ones that would return false. And yeah, next step is just to test the code.

I have that practice in NetBeans, so let's see if we can figure this out. What we have here is we have our item superclass. And then item is being inherited by shirt. It's being inherited by trousers. That makes sense, because trousers and shirts, those could be types of items.

In here we have our ShoppingCart class with our main method. What we're doing here is we have an ArrayList that's going to contain items. And then for filling that cart, we're filling the cart in the main method with a bunch of different items. So we have a couple shirts. We have a couple trousers. And the reason why we're able to do this is because shirts and trousers, they're all items, so they'll all fit in an ArrayList meant to contain items.

So let's get to work on the removeItemFromCart. We have our description argument. That's done for us. Excuse me. We have our description parameter that can take arguments. That's done for us.

Next thing we need to do is to write a lambda expression that will remove any items that match that description. So the syntax for that is items.remove-- items being the ArrayList, remove being the method that takes a lambda expression-- removeIf, and it takes a Predicate.

So in here, what do we write? We write i. i is just going to be an item and we don't have to specify that it's an item type. Java knows that already. i for every item i, I want to call i.get-- get description, and if that description equals this description.

And then finally, we want to print out the shopping cart, just to see the results of what this does. Shopping Cart after removing Trousers. And we're removing the trousers because I hate trousers. I hate them so much. Then we'll print our items.

All right. Let's try this. All right. So Shopping cart after removing Trousers, we only have shirts. That works.

Now let's try it the other way around. Try removing the shirts. No. Its description has to be shirt, singular. All right. Try that. Yeah. Then we just have trousers.

And what happens if we remove something that just doesn't exist? I'll remove gibberish. That shouldn't remove anything. Yeah. OK. And there we have our shirts. We have our trousers. Nothing's been removed from our shopping cart.

And that was pretty quick. It was all done in just a single line of code and then another line of code to print out and test our results. That's actually the end of this practice.

## 5. Skill Check: Using Interfaces - Score 80% or higher to pass

Skill Check: Using Interfaces

View Skill Check
