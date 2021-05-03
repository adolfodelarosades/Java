# 7: Working with Inheritance

1. Working with Inheritance - 36m

## 1. Working with Inheritance - 36m


Working with inheritance. Well, in this section, we're going to continue the topic that we've sort of started in a previous section, which is what happens when you're extending the Object. So when one class extends another, when you're extending the class Object, or when you're extending your own classes, what is really happening in this process?

Now, the idea is that a Java class can have only one immediate parent. Your extends clause can't be a list of different things. It has to be just one clause. Let's say, Product extends Object, Food extends Product, Drink extends Product. So you have only one immediate parent.

The purpose of extending a class is to really reuse the code that has been provided by the parent class in your child class. So you inherit the code of an object in a product. You inherit the code of an object, a product, together in a food or a drink.

So you inherit a code from the entire chain of your parents. Your child class gets whatever code the parent class has. And a parent class gets the code from its parent, et cetera, all the way up to the Object class, which is ultimately the parent class of everything in Java.

OK, let's take a look at what happens when you instantiate a class and that class extends another class. And what happens in this process? When you're creating an instance, how do you fire the constructors? How do they initialize that object of yours that you're creating at this stage?

Take a look at the example of the Drink class. Drink extends Product. OK, let's say it has some kind of internal variable, soft drink-- a Boolean, soft drink, true/false. And then it has to initialize the contents of the Product as well. That would be Product thing.

So the Drink class has a constructor that accepts the name, which is-- it's just passing it on to the parent, super(name). It passes it on to the parent class. And then it initializes whatever the content it has. So the first thing your constructor must do is call a constructor upon a parent.

Now, here's the thing. What if you didn't put this super(name) line of code into the Drink constructor? The code will still compile. But the assumption will be made that you're calling a parameterless constructor in a product. That is this assumption the compiler will make. In another words, if you don't explicitly in your constructor call a superclass constructor with whatever parameters, then implicitly you need to remember you are essentially running the code that will call a parameterless constructor upon a parent.

Take a look at the Product now, the Product parameterless constructor. First line of code-- super, round bracket, semicolon. What's it calling? It's calling a parameterless constructor upon the Object, which is what the Product class extends.

Remember, if you don't write what are you extending, the default assumption, you're extending the class object. So public class Product really extends Object. That's what you assume. You can write it explicitly, of course.

Now, the first thing you're doing there, you're calling a constructor upon the object with no parameters. Then you're incrementing some IDs, et cetera. OK. But the Drink class is designed to call the constructor of the Product with parameter. It passes the name to it.

So hence, the Product accepts that Product constructor with string name. Then it calls the constructor with no parameters-- this, round brackets. Then that calls the constructor upon the object. And then the rest of initialization unfolds from there.

Here's the illustration of this process. Let's say I'm creating a new drink-- a cup of tea, how about that? So what is it that will end up in memory in my heap when I'm creating this new drink? I will end up with the Object that contains everything from the Object, everything from the Product, and everything from the Drink. That's where we'll be in a heap. So that needs to be properly initialized.

Hence, when I call this new Drink thing, the first constructor that will fire-- so there will be a call of super to super, so it will kind of climb up the hierarchy. So the first constructor that will complete its work is the constructor on the Object. When that finishes, the constructor on the Product will complete. When that finishes, the constructor-- well, when the other Product constructor, because one calls the other, yeah, that will complete. And finally, whatever remaining code in a Drink constructor, that will complete.

So that's the order of a completion of constructor operation. You call the constructor on Drink. That calls the constructor on Product. That calls another constructor on Product. That calls a constructor on Object. And then the Object class constructor finishes. Then a Product class constructor finishes. Then a Drink class constructor finishes. So that order has to be taken into consideration. That's rather important. OK.

So a few words about using references. The code example here operates on a same Drink object-- new Drink("Tea"). But what can I assign that Drink object to? What kind of references can I assign it to?

It's perfectly valid to assign it to a reference type of object or a reference type of product or a reference type of drink. So I can declare r1, r2, r3 variables-- whatever I want, really. And this new drink can be assigned to either type of the variable.

Essentially, because a drink extends Product and a product extends Object, we can say that drink is an instance of Drink. It's an instance of Product. It's an instance of Object. It's an instance of all of these types. And that's why these three assignments will succeed.

If you decided to narrow down the type, then you can always do that. You can declare an additional variable-- let's say, type of drink. And you can typecast the r1 variable to Drink Type or the r2 variable to Drink Type. So you're narrowing down the type.

The only thing you need to remember about that whole process is that it does not have any effect on the object in a heap. What is actually happening is that you are changing the reference type in a stack, but you're not changing what the object is in a heap. Think about it this way. When you allocated a new drink-- that tea thing-- it's stored in somewhere. If you have a variable r1, Type of Object, you'll only be able to observe some of the drink's operations-- those that belong, that are declared on the object-type level. So through that reference, r1, you will be able to see methods toString(), equals(), hashCode(), because they all are methods declared on the level of the object.

For the variable r2, you will be able to see more. You will also be able to see methods getId(), setId(), getName(), setName(). These come from the Product. And from the variables r3, r4, and r5, you will be able to see them all, and these isSoft sets of tea operations as well, because they are specific to the drink.

Think about it as the window through which you're looking at things. Your window could be very narrow and you can only see part of the landscape outside of your window. Or it could be made wider and you can see a bigger part of the landscape. That doesn't change the landscape, though. Things are there regardless of whatever you can see them or not.

These operations like getId(), setId(), getName(), setName(), isSoft(), setSoft(), et cetera are still present in memory regardless of the way in which you point to the object. It's the case of can you see them or not? OK. So it's a visibility.

Now, in this particular case, which is rather important, the case of assigning references-- let's say we created ourselves a new drink, Tea. All right, there it is. Then we created a new food object. It's a tea with a cookie. Lovely. So that's a food object.

Now, as you notice, on the left-hand side, either type of reference is declared as Product. We know that Food and Drink are subtypes of the Product. So that's a perfectly plausible way to assign the references. That's perfectly fine. You won't be able to see the methods that are specific to Drink or Food. But you'll still be able to see all the methods that are just generic for these references.

Now, on the next line, we're taking the p2 and we're assigning it to p3. And this is what's happening. We're not creating a new cookie. Oh, no. That's just another reference to the very same cookie. So in a heap, that's the same object.

Remember, that is essentially exactly what happened when you pass parameters, that p3 could have been a parameter in another method. You're just creating a second reference to the very same object.

All right, what about this p1 equals p2? p1 was pointing to Tea, and not anymore. So we dereferenced the Tea object. It has no reference leading to it anymore. And we just created a third reference, reference in the cookie. So we have three different references to the cookie, no references to the tea, well, in which case, the Tea object will be actually eligible for garbage collection, because nothing points to it in this problem any longer.

It could theoretically be scrubbed by the garbage collector. It doesn't mean it will be immediately scrapped from memory. No. That will happen sometime later. But that's not the point. It's now dereferenced. That's the point.

Another important thing that you gain when you are extending Java classes, you gain the ability to override their methods. And there are some typical things you tend to override-- for example, methods of the Object class such as toString equals hashCode() are very likely methods for you to override. In this particular case, I've just selected one of these methods, the method toString(), and decided to play with overriding that across this class hierarchy.

In the Object class, the toString() method performs some kind of text output-- getting the class name, working with this hashCode() and just sort of concatenating that into text and returning it to you. However, I decided that I fancy returning something else out of the Product. I don't want to return that class name and hashCode(). I want to return product ID and name.

So hence I override the method toString(). I create a method with exactly the same signature as the method in the Object class, just a different method body. That's what override actually means. We were substituting a new method body.

And in the last example, in Drink, I'm doing the same thing again. I'm overriding the method toString() again. But note, this time, I also call super toString(), which basically means I'm kind of recycling the code that the parent class provided. My subclass, Drink, didn't just disable the parent class' functionality on its toString() method. It's sort of added to it. So we reused whatever the parent was doing.

So when you override in a method, semantically, you may do it from two different perspectives. You may say, I'm overriding it because I just want to have a new method body. I don't like what the parent class is doing. I want to have my own stuff there. Or you could say, I'm overriding method because I want to add to what the parent method is doing, just add extra stuff, in which case, you're obviously likely to call super dot that method from the overridden version of the method.

Please note one more thing. The way in which I reference the Drink object, that top left corner-- I reference it as Object r1, because I am talking about a method here which is declared at a level of the object class. So I don't need the reference to be type of product or type of drink, because the method I'm about to use is generic and exists at the level of the Object class anyway.

And what will happen if I'll call r1.toString()? I will actually invoke the lowest available implementation of that toString() down the hierarchy. It wouldn't call the toString() method upon the Object. It will call the toString() method upon a drink. That's the output you will get.

That is known as polymorphism. And polymorphism essentially implies that so long as you can see the method declaration in a parent type-- like the method toString() is declared on the level of the object-- you don't really need to cast the reference to the child type in order to be able to invoke such a method if it's overridden by a child. The child version of the method is automatically substituted. So that's that. All right.

So let's take a closer look at the cases where you do need to cast reference types. In this particular case, we have this instance of Drink. And we reference it with a variable declared as being type of object. So to call a toString() method, we don't really need to do any typecastings.

The method has been declared at a parent level. We can see it. We will automatically get the lowest available implementation of that method down the hierarchy invoked for us due to the polymorphism principle.

But what about calling methods such as setName() or isSoft()? They're not declared at the level of the Object type. They're declared at the subclasses level. So in order to be able to call such methods, we will have to check if that variable r1 is actually an instance of Product, let's say. And if it is, cast it to the product type. Then we will be able to see that extra method. It appears on that level of a type of product.

The same thing happens with a drink in order to be able to call the method isSoft(). We'll have to check if what we're looking at is actually a drink and then cast the type-- so declare, maybe, an extra variable, r3-- and assign and reference to it. It's not creating a new object. It's just basically changing the way you look at it. The object in a heap is still the same. All that's happening is that you're sort of widening your window through which you observe it.

You will be able to see those operations that have been declared on a relevant subtype level, not just on a parent type. So that will require to do the explicit casting. And the reason behind the instanceof operator used in this case is just safety precaution.

If what you're trying to do, like cast r1 to type Product, is not really compatible with the type of object you've instantiated-- maybe it's not a Product object, maybe that r1 is just something else-- well, in that case, you'll end up with the exception, ClassCastException. So that's why you first, for safety, do the instanceof check, make sure that what you're looking at is actually a product. And that it's safe to do the downcasting. Then you could see the extra methods that the subtype sort of brought into the mix.

Now let's take a look at the abstract classes. The class Product in this particular code example has a keyword abstract in its definition-- public abstract class Product. In all other respects, it could have been a normal class with variables, methods, constructors, all the usual code. But putting a keyword abstract onto this class definition will prevent me from actually instantiating it directly. I would not be able to compile a code that does this-- new Product. That would not be allowed, because the Product was made abstract.

The purpose of an abstract keyword is to prevent certain classes a your class hierarchy from being directly instantiated. The idea is that you then extend this class-- you create Food and Drink classes that are subclasses of Product-- and you instantiate them. You have instances of Food. You have instances of Drink. But you won't directly instantiate a Product, because you deem the Product class to be too abstract, too high-level in the hierarchy to actually have concrete instances.

It's like I'm coming to a shop and I'm asking for "the product." And they will have a very surprised look on their faces, I suppose. But if I will go to the shop and ask for food and a drink, well, I suppose that will make more sense. These are real things rather than the concepts. So that's why you can mark some classes as abstract to prevent them from being directly instantiated. And the intention is that you will extend these classes.

One thing you can also do in the abstract class, although being it that's optional, you can also add abstract methods there, like this one, method getTax(). Of course you cannot possibly create an abstract method in a normal class, in a concrete class. Nah, you won't be able to do that. You have to make sure the class is abstract first. So therefore, an abstract class can have normal methods, can have normal variables, can have constructors, and may also have abstract methods.

An abstract method is an implementation placeholder. We're saying we want to override it. Remember, the purpose of an abstract class is to be extended. The purpose of an abstract method is to be overridden.

Now, ask yourself why we want to do that. Because you declare the abstract method on a high enough level in the class hierarchy. Although you don't have an implementation of the method at that level-- the method getTax() is not yet implemented-- you're saying that if you will override it in a child, you will still be able to use a reference of a parent type. That's the difference. If the Drink class or Food class will declare the method getTax() and it wasn't present in a Product, in order to call getTax(), you have to cast the type to Food or Drink.

But this way, you see, you can have a declaration of the method in a parent. So you won't need to cast the type to child types to invoke the implementations of that method. The child will simply override it.

Moreover, because the method is abstract, the child will be required to override it. A class will not compile if it extends the abstract class and doesn't override the abstract methods that it has inherited from it. It just simply won't compile. So you are obliged to override it.

I suppose you can have a child class that's also abstract. But eventually you get to the level of a concrete class. And there you have to override whatever abstract methods you have inherited from your class hierarchy.

So here is an example of extension of an abstract class. As you see, the purpose of it is to be extended. And then you have to override its abstract methods.

The class Food overrides the method getTax(), passes some calculation of a tax figure. When you create an instance of Food-- new Food ("Cookie"), that's the bottom left corner of this example-- you declare here the variable as being a type of Product. And that's perfectly fine. Cookie is a Food, Food is a Product, so you're OK.

And I call a method getTax() upon it. Of course, the getTax() method in a Product is abstract. But you're actually invoking, due to the polymorphism principle, the lowest available implementation of that method down the hierarchy. So it all works. You get your tax from the Food. That's the idea of an abstract method override.

Interfaces-- you can think about an interface as kind of a fully abstract class. Well, in a sense. The interface can only have public static final variables-- in another words, constants-- and public abstract methods-- in another words, the interface is fully abstract. It has no concrete code.

The funny thing about it is that if you don't write that a certain method is public abstract or a certain variable is public static final in the interface, it's actually assumed-- the compiler assumes that the methods are all public abstract. So that listDiets() is public abstract. That integer VEGAN is public static final, even if you didn't actually write it explicitly.

Does that create a problem for you in the exam? Oh, yes it does. Think about it this way. You're looking at the class and at a method or a variable that has no access modifier. What's the default access modifier in that case?

Well, that's default. So it's visible to members of the current package only. You're looking at the interface and you've got a variable or a method with no access modifier-- it's public. It's visible to everyone. And you have to remember that, of course.

Now, here's the class Product for you. Obviously, it can extend whatever you like. If you don't say what it extends, it's implied that it's extending the class Object. But it could extend whatever else you want.

And then after the extents clause, I have the implements clause. And there you can have a list of different interfaces, just comma-separated. So you can say, oh, I'd like to implement this Dietable interface and call my next interface and next interface, as many as you like. And then the idea is that you simply override whatever abstract methods you've got from these interfaces.

So let's say this applyDiet() method, we just sort of operate on it just to have some implementation logic there. We have a listDiets(). Again, we just added some implementation logic there. OK, so the class Product becomes the implementation of a Dietable interface, but overriding its abstract methods.

As I've mentioned a moment ago, the class may implement as many interfaces as you like. Here's an example. There's a class ATM, cash machine, whatever you call it. We decided we'd like to extend the class Banking here. Well, fair enough.

But equally so, we may say that ATM is not just the type of bank. Maybe it's also the type of security device or type of computer. So all of these different other parents are equally plausible in this case. You can argue that ATM is a computer or a security device or a bank. Either way, really. So therefore, if we want to inherit functionality definitions from these different parents, we can achieve it by just implementing a number of interfaces.

So we decided we'd like to extend Bank. And we decided that we'd like to implement Securable or Computer interfaces as well. Notice anything strange about the ATM class? Look at the acceptInput() method in there. That matches the accept input from the computer class. Notice the acceptInput() method in the ATM. That matches the acceptInput() in the Computer interface. So we implement that.

But where do we implement authenticate() and authorise() methods that we must implement in the ATM, because we've got them from the Securable interface? And that's an interesting thing about the method implementation. In a Banking class, we have a method called authenticate() and a method called authorise(). And I match the signatures of the methods that we meant to implement from a Securable interface.

Because ATM extends Banking, it actually inherits the authenticate() and authorise() methods-- method implementations-- from Banking. So therefore we end up with an ATM object actually having the implementations of authenticate() and authorise(). This code will compile, although the direct implementation of the authenticate() and authorise() methods is nowhere to be found in the ATM. But it is there via the inheritance from Banking.

Let's take a look at the code example here, which is similar to what you've just observed in a presentation. We have this interface called Dietable, with applyDiet(), listDiet() abstract methods. And remember, they are abstract even if you don't say they are. And they are public even if you don't say they are. So are your constants here.

And then we have the Product class implementing the Dietable interface. Well, let's say we'd like to override the method to apply the diet or list diets. We just work here with some arrays. And what exactly we do inside these methods matters not.

And then we create an instance of the Product. And we apply the diet to it. And then we print out-- well, the two string method just prints the name, the price, and whatever contents of the diets we've got.

So let's run this example first. And that's what we got here. Tea, 199, and 1 as the value of the vegetarian diet, of which this particular product happens to be. I don't know. Tea's vegetarian. Some are.

Now, let's break this code a little bit. Let's first of all forget that this particular access modifier is are actually public. You know, you look at the method. You're saying that this particular method has no access modifier. And you forget that that's an interface you're looking at.

So you forget that implicitly, the modifier is public. And when you override it, you don't put the public keyword here. You will end up with a compiler error. The compiler will tell you that you cannot narrow the access modifier.

You promised the entire world a presence of a method, applyDiet(). This is implicitly public, even if you don't say it is. So that's what you promised, because that's the kind of implied code. And then you broke the promise by not making this method public.

Now, of course, if that would have been not an interface but an abstract class, there, you could have a method that has no access modifier and it implies as default method. And if you were extending an abstract class, then you would be able to override it with a default access modifier. That wouldn't be a problem.

What you need to remember is that when you override a method, you can make the access modifier wider. For example, if a parent class defines the method that is default or protected, your child class can override it as public. That's perfectly fine. But you cannot make it narrower. If your parent says the method is public and the interface implicitly says it's public, then your child must uphold the promise. It must make that method public as well. Otherwise, it's not going to compile.

And one more tiny thing-- that instruction here that you notice on these methods, the override instruction-- OK, let's run this code. I fixed the problem. Let's run this code. So we see something printed out here.

Now, let's remove the override instruction from the code. Just let's get rid of it, comment it out. Run the code. Hmm. Works just the same. Well, it should, because override instruction here, this particular annotation, isn't actually doing anything at runtime. It's helping you to do things correctly at design-time.

Let's say I made an error. I'm thinking I'm overriding the method toString(). Well, I'm not because, I've typed it in a wrong case. In the class Object, the toString() is spelled capital S, and here it's lowercase s. There is no compiler warning or an error or anything, because I'm not saying I'm overriding a method. I'm just creating a method that looks like another method, but it's not actually an attempt to override it.

I run this piece of code. What do I get? That's a default implementation output from the toString() method of the Object class. So that's not what I wanted, because I haven't overridden the method. I just created some other method that looks like it but it ain't.

So let's return back the override instruction. Now you see the purpose of it, because now the code will not compile. The override annotation helps you to detect the case that what you've written is actually not an override of the method. So it's not used at runtime. It's just use at design-time to help you to identify the case where you are not really overriding what you're supposed to override.

OK, so now it works, obviously. We restored the code to its former glory. And we're printing out this vegetarian tea. Lovely. Thank you. Let's get back to the PowerPoint.

So in this section, we've observed how the polymorphism works. We've overridden some methods. We played around with abstract methods that we've implemented from abstract classes from interfaces, determined whenever we need to cast the reference type or not. So long as we can see the method on a parent level, we know that the lowest available implementation of the method will be invoked down the hierarchy automatically for us. So we don't need to cast the type for that. But of course if we want to call a method that is just in that child, then we might have to narrow down the type of reference to a relevant type of the class.

I suppose the whole point of this section is to help you get your head around the cases where you use inheritance, where you use abstract classes, where you implement interfaces. All right, let's take a look at the next section.
