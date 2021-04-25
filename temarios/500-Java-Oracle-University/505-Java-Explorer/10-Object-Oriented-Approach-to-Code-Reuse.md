# 10. Object-Oriented Approach to Code Reuse

Use inheritance to implement polymorphism and reuse code. Use interfaces to share common behavior among classes.

## 01. Title and Objectives 1m

Java Basics, Object-Oriented Approach to Code Reuse. In this module, we'll look at object-oriented design and specifically, we'll look at reusing code through inheritance by extending classes. We'll see what the super object reference does and how to use it. We'll define subclass constructors, override superclass methods, explain what polymorphism is and how it works in Java. We'll see how to define abstract classes and methods, and how to implement common behaviors using interfaces.

## 02. Inheritance 12m

Using Inheritance. Previously, we talked about the fact that certain types of objects seem to have behaviors in common, and can we leverage that to increase reusability? For example, a camera object can be turned on and off. It can also be told to record. A TV object can be turned on and off and potentially other things like increase volume or change channel. So how can we leverage that and make the code more reusable? To do that, we can use inheritance.

So to reuse common behaviors, we can use inheritance to refactor the common code up into a common superclass. For example, both cameras and TVs can turn on and off. So we could say that cameras and TVs are types of gadgets. We can create a new class called Gadget, which would be a superclass to camera and TV, and Gadgets have only two behaviors, on and off.

Now, actually turning the implementation of on and off would be different for the camera class and the TV class, and we'll talk about that later. But for now, we can create a object variable, remote1 of type Gadget, and store and object reference to a camera in it because a camera is a type of gadget.

And we can create another object variable, remote2 of type Gadget, and store a new TV object in it. Then, if we call remote1.on, it will tell the camera to turn on or off. If we call remote2.on or off, we can tell the TV to turn on and off. What we can't do, however, with a gadget is we can't tell remote1 to record and we can't tell remote2 to change a channel because gadgets don't record and they don't change channels. The Gadget, the superclass, is the more general form of the code. And the subclasses, camera and TV, are the more specific.

So you can reuse inherit attributes and behaviors across a class hierarchy. And in Java, we establish a class hierarchy by starting with Object, which is the superclass of all objects in Java. Java is what we call a single-class inheritance hierarchy, as opposed to something like C++, which is not. Object has a subclass of Customer, another subclass of Clothing. And then Clothing can have a subclass of Tailored Clothing and Standard Clothing. This establishes the class hierarchy.

Classes then form hierarchical relationships. The superclass or top-level class is a more generic parent type. For example, Clothing might have attributes and methods of, for example, price, description, and-- for example, Clothing might have attributes like price, description, and size. And we'll see that Tailored and Standard may have different ones.

The superclasses define the common attributes and behaviors, whereas a subclass represents a more specific child type. So there could be any number of levels in the hierarchy from very generic to very specific child types, though typically we don't see more than about three or four levels in business programming. Object is a top-level class in the Java class hierarchy, and all other classes extend from Object.

So, for example, here is public class Clothing, and that's why we would code this class. And then if we wanted to extend it with Tailored, we could write public class Tailored extends Clothing. Then the Tailored class would inherit the attributes and behaviors in the Clothing class.

Let's take a look at how we can extend classes and reuse the superclass logic. So we would say that a subclass inherits the code of its parent's superclass. For example, public class Clothing extends Object. And therefore, public class Clothing would inherit all the attributes and methods of the class object.

Now, when we say inherit, at runtime, it does not mean that two different objects are instantiated. We don't get an Object Object, and we don't get a Clothing Object. Instead, what happens is the Clothing object gets created with the attributes of its own and its parent. And we'll see this more in a moment.

Now, you'll notice that this is in a weird font or color, and this implies that in Java we don't actually have to write the word "extends Object." That's assumed by the compiler. We do, however, have to write "extends Clothing" for Tailored. So public class Tailored extends Clothing. And because it's extending a class that's not object, we have to tell the compiler that. Now, notice that Tailored has a private double fee and we have a method called getFee.

Subclasses can override parent class methods. A subclass can define a method whose signature matches the parent class method. For example, here we have public class Clothing and we have a public double price method.

Then public class Tailored extends Clothing and we override-- and there's an annotation. This is information for the compiler, the little at sign that we can do in Java to give information to the compiler that this getPrice method is overriding the public double getPrice method from its parent. We can provide an alternative or augmented algorithm for the parent class method.

So let's say that when we're talking to our business and writing the code, they tell us that when we have just a general piece of clothing, then we can simply return the price, and that will be the price of the piece of clothing. However, they have tailored clothing, which also has a fee.

So now the business has told us that when we get the price for a piece of tailored clothing, we should include the price for the item and the fee together. Now, to do this, what we want to happen is for the Tailored class to actually access the price variable. And what we do is we use super to do that.

So when this code executes, when we create a new Tailored object, it's going to have a price and it's going to have a fee, because, remember, it inherits the values from the superclass. But because price is defined on the superclass, we have to tell Java where to look for it. super.getPrice causes Java to go up to the getPrice method in the superclass, retrieve the price value, and add that to the fee and return that value.

So when we create a new Tailored object, jacket of type Tailored, and say new Tailored and call jacket.getPrice, what happens is control goes to the getPrice here. super.getPrice says, call the getPrice method on Clothing, which returns the price, and then add fee.

Polymorphism, which means literally many forms and is a fundamental principle of object orientation, in Java means that a method declared in a superclass could be overridden in a subclass to change the behavior. A subclass version of the method takes precedence and typically has more specific behavior for the subclass.

So here we have public class Clothing, which has private double price and a public getPrice. And we extend Clothing with Tailored, adding a fee and overriding how price is calculated. We call getPrice, which calls super.getPrice. It goes to the superclass to execute the code, returning the price and adding the fee to it.

But notice, public class Standard does not extend Clothing. Notice that public class Standard does not override the getPrice method, because for a standard piece of clothing, the getPrice method as coded is sufficient. Now, the benefit of this is we can, in the program, work with a collection of superclass items. Our application has been asked to simply print out a list of all the prices for all the different clothing items.

So we can create an array of super types-- in this case, clothing array items-- and we can create a new array of two elements. Element of zero would get a new Tailored object. Element of one would be pointing to a new Standard object. And then we can start our loop and loop through and call getPrice.

Now, this is a bit contrived, and normally the code would be a little bit more robust and we'd be getting data from databases or web services or files or other places. But the basic idea is sound. We're creating instances of Tailored and Standard objects, storing into an array of Clothing items defined by a superclass, and now we know we can call getPrice.

Now, think about that for a moment. How does the compiler know that no matter what, whether it's a Tailored object or Standard object, that getPrice will work? Because the compiler can see that Standard extends Clothing, Tailored extends Clothing, and therefore, by definition, they both must have a getPrice method. Now, Tailored actually goes ahead and overrides the getPrice method, but it's still there, and that's the important point.

So let's see how polymorphism works. When we enter the for loop, we have our items array. And therefore, item will point to the first item in the array, which happens to be item sub zero, a new Tailored object. We call item.getPrice.

Now, the Java virtual machine, at runtime, looks at the item and asks it, what are you? And the item would say, I'm a Tailored object. So the Java virtual machine goes over to the Tailored class and looks to see, is there a getPrice method? There is, so it executes the code, which calls the superclass to retrieve the price and then adds the fee to it.

But notice, when we go to the next element, when item becomes an item of one and we're now looking at the Standard object, when we call item.getPrice, the Java virtual machine looks at the item, says what are you? And item says, hey, I'm referencing a Standard object.

So the Java virtual machine comes to the Standard class and looks for a getPrice method and doesn't find one. Not a problem. It looks up in the class hierarchy to Clothing and says, do you have a getPrice method? It does, and therefore uses the superclass getPrice method in this case. This makes for a much more flexible and extendable type of design.

Also, notice, if we had another type of clothing-- maybe we had an exceptional type of clothing, public class Exceptional extends Clothing-- this would all still work because Exceptional Clothing would extend Clothing and have a getPrice method, which we'd either override or not. But later, if we added an Exceptional Clothing object into this array, it would all still work because Exceptional Clothing items which extend Clothing would have a getPrice method.

Or if we extended Tailored, for example, and we went further with Tailored-- maybe we had super tailored clothing-- and that maybe even override to getPrice again. The whole model still works. So using polymorphism and using inheritance, we can write very flexible, very extendable code.

OK, we've got a quiz for you. Take a look at the code in the main and the two classes, Clothing and Tailored, and see if you can figure out what's going to be printed. Pause the video. And when you're ready, go ahead and resume.

OK, so let's see what the answer is. It says the answer is C. Let's see why. So we create a Clothing array of items with two new Clothing objects, a new Clothing object and a new Tailored object. So we have item sub zero is Clothing. Item sub one is Tailored. And if we print out itemsub1.getPrice, what would we get?

Interesting. Let's see. Well, item sub one is Tailored, which calls getPrice here. Now, getPrice, in this case, would call super.getPrice, and the super price is 10. So it returns the 10 and adds the fee. The fee is 0.99. So 10 plus 0.99 would be 10.99, and that is exactly what we get back.

## 03. Abstract Classes 5m

Abstract classes. We continue our discussion about designing with object orientation. We looked at inheritance and polymorphism previously. Now we go a little bit further and start working with abstract classes and methods.

The abstract keyword is used to encourage class extensibility. For example, a class cannot be directly instantiated if it's marked with the abstract keyword. And we use abstract essentially as a placeholder for methods that will be implemented in the subclasses. The abstract class purpose is to be extended by one or more concrete subclasses, subclasses which can be instantiated.

The abstract methods provide the method signatures without a method body and supports polymorphism. So for example, here we have public abstract class Clothing. Now, by putting the word abstract on it, we can no longer say "new clothing." It now becomes a design structure and a placeholder for code that we want the subclasses to specifically implement.

And putting the word "abstract" on the method refund means that we don't have any implementation code, no curly braces here. And it will require a subclass like Tailored that extends Clothing to implement the method "refund." And the compiler will enforce this. And this is what I call compiler enforcement of good program design.

So here is public class Tailored, which extends Clothing. And we have to include "public double refund." If we did not include this method, it would not compile because as soon as the compiler saw that Tailored extends Clothing, and Clothing has an abstract method "refund," it will require you to have that method defined. It doesn't necessarily have to do anything, right? It's just returning 0 in this case-- but it does have to exist.

So a concrete subclass must override all abstract methods of the abstract parent. So the reason for this is for placeholders and for polymorphism. Remember what we said before. We could have collections of superclasses and call methods on that superclass, and it actually ends up calling methods on the subclass automatically based on the type of class.

So here's an example where we say, you know, we know all clothing items are going to have to be able to be refunded, but they're all going to refund differently. For example, tailored items, which are especially tailored, will be refunding zero. You get zero back for a tailored item. But a standard item with simply refund the price. So we know that both Tailored and Standard should have a refund method, but there is no code to put in it at the Clothing level that makes sense for both.

So we put this in as an abstract method, which is a placeholder to enable design and polymorphism. So if we were to create a new clothing object called "Jacket" and try to say "new clothing," the compiler would reject this. We can't instantiate the Clothing class. It's there as an abstract class to help with design.

We could, however, create "Jacket2" of type clothing and store a new Tailored into it, and we could call methods like "refund" or methods like "get price" or "description." And we could create "Jacket3," which is of type clothing, and store a new Standard object in it. Now, this is very common to take the superclass, especially an abstract superclass, to see these types of objects so that we can call the correct method, "refund," and the correct method will be executed at runtime. In other words, if we were to call a Jacket2 refund, it would go to the Tailored class and call the refund method on the Tailored class. If we were to call refund on "Jacket 3," it would go over to the Standard class and call the refund method and return the price.

This all happens automatically, I should say auto-magically, and is one of the aspects of design and object orientation and one of the things that makes Java so powerful. It's recommended that all your Java classes override some operations defined in the Object class. Remember Object is the ultimate superclass of all classes in Java. A good example is the toString method.

The toString method produces text values for the object. Various operations in the classes, for example, println, use the two-string operation. Public class Clothing would override the toString method and add its own definition, return a description and a price. Then in our main method, if we create a new clothing object called tShirt and create a new Standard object, when we call System.out.println with tShirt, it'll actually print the description and the price.

We have an exercise for you to play with the overwrite of the toString method. You can override the toString method in the Clothing class and print all the fields in the comma-delimited format. And you kind of see that on the previous slide, right? That's kind of what they're starting to do here, description plus comma plus price. That's concatenating all those strings together.

Then in the main method of the ShopApp class, modify the statement that prints all clothing item fields to take advantage of the toString method that you just provided. Now, we're doing a very simplistic type of example and exercise here because really doing object-oriented analysis, and design, and inheritance, and all those types of stuff can get more complex. And this, of course, is what we cover in depth in the Java Learning Subscription.

## 04. Abstract Classes Demo 5m

Exercise 8-1-- Override the toString Method. We're going to override the toString method in the Clothing class and print all of its fields in the comma delimited format. Then in the main method, we'll modify the statement that prints all the Clothing items to take advantage of this new toString method that we just provided.

This will show a simple example of inheritance, because we'll override the toString method that is inherited from the object class. So we need to go into Clothing class and make a change. So here we go into the Clothing class. And we're going to add a toString method.

And it's going to return a string. And we also want to use the @Override annotation. This is a good idea to use, because then if you get the method signature incorrect the compiler will tell you at that time. Now, what we're going to return-- I'm going to grab that, actually, from here where we're printing the items. We're really grabbing it from that line there.

So I'm just going to grab that and just use it as the bases for my Clothing. And I'm going to paste it in. And of course, I don't need the System.out.println or items or any of that. Or, I just need the description. So I'll call my own description.

And then there's a comma. And we'll call getSize. Notice I can take off the item variable. Of course, this is in the class itself. And now we should be good. Return getDescription plus getSize plus getPrice. And I think I have an extra paren. There we go.

So I'll show you a trick on how to count parentheses. When I used to program in LISP, we were taught how to count parentheses. So here's how you do it, because you can get very confused.

Now clearly, you can click on this and see where the parentheses match up. And it's nice if your IDE does that for you. And there's one at the end. We're missing something.

But here's how I learned to count parentheses. You start with zero. And each left paren, you add 1, each right paren and you subtract 1. And you should come back to zero when you're done. Let's see if that works.

We start with 0, 1, 0, 1, 0, 1, 0, negative 1. OK, so we're 1 off. And it's very easy to catch that. So there we go. Take that off.

And now we've added our toString method. And if we come back to the Shop class, then we can actually take this line out, and we can simply say-- I'm just going to comment it right now, comment it out. And we can simply print out, do something like System.out and say item, and then just say plus item.

Now, the toString method will get called automatically. It still should put out the items correctly. And indeed it does. And there is the output just as we expected. And I'll show that this is actually correct by just putting that in there. And that's the item output.

So there's your item output-- blue, orange, green, blue. And that works fine. And again, it calls the toString method. So now what you're seeing is we're overriding superclass methods.

Now in this case, we're doing a complete override. We're not calling super, because there's nothing in the superclass that we want to use. If there was something in the superclass we wanted to use, we could call super, call the method in the superclass, return the value, and then use it in our method down here.

So in the main method we modified the statement that prints all the Clothing items. We take advantage of the toString method, and it simplifies our code considerably. Now our application is starting to look more professional, and we don't have these hardcoded concatenations going on.

And as I mentioned before, it would be rare, if at all, that you'd ever print to the console or in an application directly with System.out.println. I usually use it for testing and debugging purposes. Normally you'll be reading and writing to a file, a web service, or a database, or your service is going to be called and you have to respond back with a value, or you'd be working with some kind of user interface, maybe JavaScript or a servlet in JavaServer Pages, something like that.

OK. And with that, that completes exercise 8-1.

## 05. Interfaces 7m

Working with interfaces. An interface defines a set of features that can be applied to various other classes. Now, specifically, an interface is a way to abstract out or define behavior that's common in multiple classes, specifically classes that are not part of the same class hierarchy, meaning we when we can't use inheritance but multiple classes have the same behavior, a Java interface is a way to define that.

The Java interface has instance methods which are, by default, public and abstract. Those methods would have to be implemented by the class that implements the interface. They can contain concrete methods, but only if they are either default, private, or static. They can contain constants, but they cannot contain variables because interfaces are not instantiated. Unlike classes, interfaces cannot be instantiated and simply exist to define reusable behaviors and potentially constants.

So here is a public interface. We generate the name, and we can have constants, abstract methods, default, private, and static methods. So for example, we create a public interface Recyclable which has a single method, recycle. It doesn't return anything. It simply recycles the item.

Now, if clothing items can be recycled, we can indicate that public class clothing implements recyclable, and the compiler will force us to write a definition of the method recycle with an implementation. Of course, that implementation should be specific to clothing items. Now, another developer might be creating the bottle class, and bottles can be recycled as well. So that developer, she would say that bottle implements recyclable and would write the code for the Recycle class with the bottle specific implementation.

The benefit here is we can use polymorphism with interfaces as well. Sometimes inheritance is not very flexible and doesn't meet our needs for our application. Depending on the point of view, a given class could potentially require different parents to be of more than one type. Different features can be defined by different interfaces, and a class can implement as many interfaces as required. While a class can only extend one class in Java, it can implement many different interfaces.

So for example, here is public class Clothing which implements Recyclable and Comparable. The recycle method would allow it to recycle an object, and compare allows you to compare one object with another and is very useful when sorting collections. We can create an array of objects that implement the recyclable interface. We can create arrays of objects that really have nothing to do with each other and yet be able to leverage the common behavior.

So we can create an array of objects that implement the recyclable interface, called Rubbish, and we can instantiate that array. Now, some of you, I know, are really saying, wait a second. Wait a second, Joe. You said you can't instantiate an interface. That's correct. That's not what's happening here. We're not instantiating an interface.

Notice the square braces. We're not calling a constructor. We're instantiating an array of recyclable object type references, and we're going to have three of them. So we create a new tailored object and store it into rubbish of 0, a new standard object, store it into rubbish sub 1, and a new bottle object, and store it into rubbish sub 2. This would all work.

Now, if I had another class here-- like, let's say order, new order-- that doesn't implement the recyclable interface. And therefore, if I tried to store that into rubbish of 2, for example, the compiler would catch that and not allow it. Now, when we go into our loop, we can loop through the rubbish items, looking at each item at a time. First time through the loop, item would reference rubbish sub 0, which would be a new tailored object.

And we'd call item.Recycle, and the Java Virtual Machine would say, hey, item, what are you? And it would say, I'm a tailored object. And it would call the recycle method from the Tailored class. Then we go to the next item, which is standard. And it would say in the loop-- the Java virtual machine would say to item, what are you? And it would say, I'm a standard object. And then the recycle code for a standard object would be called.

Then we go to the next item, rubbish sub 2. Item is now pointing at a new bottle. And again, we call item.Recycle. Java Virtual Machine asks item, what are you? It says, I'm a bottle. And now we call the recycle code for the bottle. We can also-- because we implement the compareTo method and the comparable interface, we can also go to the Arrays class and use the static method sort to sort the entire array.

All right. Quick quiz. Here we see we have public class Clothing Implements Recyclable and Comparable. Which objects can be placed into the rubbish array? Take a look at that. Pause the video. And when you're ready, please resume.

All right. So let's see here. Public class Clothing implements Recyclable and Comparable. OK. Public class Tailored extends clothing, so it gets Recyclable and Comparable because it inherits all the implemented interfaces from its superclass. Public class Bottle implements Recyclable and Comparable. Great. Public class Battery implements Comparable.

OK. Let's see what we can put in here. So we have our array of objects that implement the recyclable interface. And I'm deliberately saying it that way so you understand how we think about things. We create a new array with five elements that'll hold only objects that implement the recyclable interface.

Rubbish sub 0 equals new clothing-- does that work? Yep. Clothing implements Recyclable. We're good. Rubber sub 1 equals Tailored-- does that work? Yep. Tailored works because it extends Clothing and therefore inherits Recyclable. What about rubbish sub 2, new bottle? Yep, that works because Bottle implements Recyclable.

What about new Recyclable? Nope. That doesn't work because there, we're actually instantiating, or trying to instantiate, an object of an interface type. There is the actual parentheses, and that would not be allowed.

Then what about new Battery? Well, we certainly create the new Battery object, but Battery does not implement Recyclable, and so this would not be allowed either. So the correct answers are A, B, and C.

We have a little exercise for you to play with sorting clothing items. You'll implement the comparable interface in the Clothing class. Your algorithm should sort clothing objects by their descriptions. Look up in the Java documentation to find out how the comparable algorithm should be implemented.

In the main method of the ShopApp class, add an invocation of the sort method on the Arrays class to perform sorting of the Clothing items array before processing it in a for-each loop.

## 06. Interfaces Demo 6m

 
Exercise 8-2, Sort Clothing Items. In this exercise, you'll implement the Comparable Interface in the Clothing class. The Comparable Interface has one method. And if we search for it, we will see, indeed, that the Comparable Interface takes a type that it will compare. In our case, that will be clothing.

We're going to compare clothing items. And it has a single method called compareTo. What compareTo does is it takes one object and compares it with another and returns a negative integer, a 0, or a positive integer, based on whether the object is less than, equal to, or greater than the specified object.

So for us, we're going to add a new method that's going to compare one clothing object with another. And we're going to compare the description. If one description is less than or smaller than another, it comes first. Then in the main method, we'll invoke the sort method on the arrays class and pass the Clothing items array. And it'll sort it before the processing in the loop.

So if we look at the code, what we see here is that there is a method that I've added called compareTo. The compareTo method actually comes from the Comparable Interface. So if I write implements, Comparable, and what are we comparing? So we're comparing our Clothing items. So once I spell it correctly, then it compiles.

So what this is doing, this right here is called a generic. And it's a way of telling the compiler what type of object Comparable it's going to work with. And it makes it much easier to work with objects, rather than having to provide even more information to the compiler about what type of object it works with.

We now have the ability, this came out with Java 6, I want to say. We have the ability to define the type of thing that we're comparing. And we don't have to keep redefining that throughout the code.

So down here in the compare method, notice override now looks OK. This says, when we call compareTo on an object, a Clothing object, and pass another Clothing object, we'll take this Clothing object's description and compare it to that Clothing object's description. And they'll either be less than, equal to, or greater than.

Now, the way this is used by the sorting algorithm is the sort algorithm, when we pass the array of items into the sort method, the sort method will automatically look at each pair of elements, element 0 and 1, element 1 and 2, element 3 and 4. And it will call the compareTo method. And if the description of element 0 is less than the description of element 1, it'll stay in its right place.

But if the description of element 1 is less than the description, and by less than, I mean as a string and comparing the string characters. There's a numeric comparison that can be done on strings. A, for example, is less than B.

So if the object is actually, if the c.description is less than the object we're comparing it to, it flips the two objects. So think about a deck of cards you're looking at that are shuffled. You'd look at two cards at a time. And if the first card is less than the second card, it stays where it is.

If the second card is less than the first card, you flip them around. And if they're equal, it doesn't matter. You'd make a whole pass through the deck. And you'd keep doing that. And eventually, the entire deck would be sorted.

So we added our compareTo method. We implemented the Comparable Interface. We went to the Java docks to see how to use a Comparable Interface. It takes a type. And it's going to also use the compareTo method that has a return an int.

Now, in the main method of the app, ShopApp class, we'll add an invocation on the method sort of the Arrays class to perform the sorting. Let's go take a look at that. OK, so the code to do this looks like this.

It looks like arrays.sort. And then we pass in c1.getItems. Now, when we do this, NetBeans notices that Arrays is actually a class in the Java.util Arrays package, Java.util package. If we click OK, it'll do the import for us.

So if we look up here, it certainly did. It imported Java.util.Arrays. That's where arrays come from. Now, what we're going to do is take c1. We created a bunch of items.

And we pass those items into the Customer, add it to the Customer collection of items. We then come back. And we get the items back, and now we can sort them. If we run it, it'll sort the items. We, of course, see the don't divide by 0.

If we then print out those items again, so we can do that with, let's see. So notice, the first time before Sort, blue, orange, green, blue, but after sorting, blue, blue, green, orange. And there you go, works just fine.

So again, the reason it works is when we pass the Array to the Sort method, the Sort method is coded to call the comparedTo on every pair of objects. And so, for example, it looked at blue jacket and orange. And it said, well, blue comes first, so we're fine.

Then it looked at orange and green. And it said, well, green comes first, so it flipped the two. Then it looked at orange and blue, and blue comes first. So it flipped those, went back and did it again, and eventually ended up in the right order. And with that, that completes Exercise 8-2.

## 07. Summary 1m

In this module, you got started learning about object oriented design. We saw how to reuse code through inheritance by extending classes, and using the super object reference to reference the superclass methods. We also saw how to find subclass constructors and how to override superclass methods, as well as what polymorphism is and how it works in Java, how to define abstract classes and methods to help with design, and how to implement common behavior using interfaces.
