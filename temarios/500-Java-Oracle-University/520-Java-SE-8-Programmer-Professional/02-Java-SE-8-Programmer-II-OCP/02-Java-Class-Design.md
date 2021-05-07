# 2: Java Class Design

1. Java Class Design?. Part 1 - 20m
2. Java Class Design?. Part 2 - 2m

## 1. Java Class Design?. Part 1 - 20m

First section, Java class design. Question. How would you modify this code to demonstrate encapsulation? Pause the video and try to figure it out before I go to the next slide.

Answer. So data encapsulation is one of the fundamentals of object oriented programming. It refers to the hiding of the internal state and requiring all interaction to be performed through an object's methods.

So this class implements two things. First, it declares all class members with the private modifier, so there was only one class member. It's greeting and that's private. And it defines getter and setter methods to access and modify this class member. So note that we have a setGreeting method and a getGreeting method.

So here is a summary of what I said before about encapsulation.

Question. This code won't compile. How do you fix it without changing the main method?

Answer. Implement interfaces with default methods instead of extending classes. The code prints out "My body temperature is 39.2. My owner is a human." You specify that a method definition in an interface is a default method with a default keyword at the beginning of the method signature. So we have two default methods, getBodyTemperature and getOwner. And they both have the default keyword.

Note that all declarations, all method declarations in an interface, including default methods, are implicitly public, so we could omit the public modifier. So we could have dropped the public key word from getBodyTemperature and getOwner. Remember to add the public modifier when implementing a method from an interface, although this code doesn't do that.

A few other things about extending an interface that contains a default method. You could do this. You could not mention the default method at all, which lets your extended interface inherit the default method. Two, redeclare the default method, which makes it abstract. And three, redefine the default method, which overrides it.

And here is a summary of what I said about default methods.

Question. What is the output? Answer. "I am an animal. I prefer Fred over Felis catus. I am a cat. I prefer George over Panthera tigris."

So let's go back to the code and see what's happening. This is an example of overriding and hiding methods. An instance method in a subclass with the same signature, which is the name plus a number and the type of its parameters. And return type as an instance method in a superclass overrides the superclass' method.

If a subclass defines a static method with the same signature as a static method in a superclass, then the method in the subclass hides the one in the superclass. The version of the overridden instance method that gets invoked is the one in that subclass. The version of a hidden static method that gets invoked depends on whether it is invoked from the superclass or the subclass.

In this code, we have two classes. We have the class animal and the class cat that extends animal. animal has two methods, a static method named getIdentity and a regular instance method, getName. cat hides the static method getIdentity but overrides the instance method getName.

In the main method, it creates an instance of an animal named myAnimal. When myAnimal invokes getIdentity, it invokes the one in the animal class. Then we have an instance of cat. And when the instance myCat invokes getIdentity it invokes the method in the cat class. Both instances, myAnimal and myCat, invoke the getName method in cat.

So here's the output once again.

And here's a summary of what I said about overriding and hiding methods.

Question. What is the output? The output is "I am a horse." Instance methods are preferred over interface default methods.

So let's look at the code. We have two methods that the main method could pick from. We have identifyMyself in Horse, which is an instance method, and identifyMyself, which is a default method. Because instance methods are preferred over interface default methods, the code calls identifyMyself in Horse. Let's go forward. So here's the answer once again.

Question. What is the output?

The answer, "I am able to lay eggs." Methods that are already overridden by other candidates are ignored. This circumstance can arise when supertypes share a common ancestor.

So let's see the sample code again. So once again, there are two methods named identifyMyself in Animal and identifyMyself in EggLayer. So the main method has a choice between one of these two.

Because identifyMyself in EggLayer overrides identifyMyself in I am an animal, the one EggLayer is invoked. Once again, here is the answer.

Question. Does this compile?

Answer. No. Change the first line to the second, System.out.print line myApp.getScientificName to System.out.print line Mammal.getScientificName. Static methods are never inherited. The second point, inherited instance methods from classes can override abstract interface methods we'll get to when we look back at the code.

So here's the code. So let's focus on the issue about static methods are never inherited. We have an interface named Mammal, a class named Horse, and a class Mustang that extends Horse but implements Mammal. What we're trying to do here is trying to access the static method getScientificName from Mustang. However, Mustang cannot inherit the static method getScientificName, so we get a compile error.

However, inherited instance methods from classes can override abstract interface methods, so we have identifyMyself and we have identifyMyself in Horse. But currently there is no connection between Horse and Mammal. But those two classes and interfaces are connected in Mustang. So in Mustang, the method identifyMyself in Horse is overriding the default method identifyMyself in the interface Mammal. So here's the answer and the two points I discussed.

Question. The following code won't compile. How can you fix it?

One way is to implement all methods in Fish. The second way is to make Goldfish an abstract class. An abstract class is a class that is declared abstract. It may or may not include abstract methods. The purpose of an abstract class is to be extended. They cannot be instantiated.

An abstract method is a method that is declared without an implementation, without braces, and followed by a semicolon. So in the interface Fish we have two abstract methods, getName and isEdible. Note that there is no implementation, so no curly braces. And it's followed by a semicolon.

If a class includes abstract methods, then the class itself must be declared abstract. Methods in an interface that are not declared as default or static are implicitly abstract, so the abstract modifier is not used with interface methods. It can be used, but it's not necessary.

So in our example code Fish, the abstract modifier is not in getName or isEdible. It is possible, however, to define a class that does not implement all of the interface's methods, provided that the class is declared to be abstract. And that's what example we have here now. Because Goldfish is abstract, we don't have to implement getName nor is Edible.

So here is a summary of abstract methods and classes that I just described.

Abstract classes compared to interfaces. So the similarities, as I said before, you cannot instantiate them. And they may contain a mix of methods declared with or without implementation. The difference is abstract classes you can declare fields that are not static and final, and define public, protected, and private methods. You can extend only one class, whether or not it is abstract.

Interfaces, all fields are automatically public, static, and final. And all methods that you declare or define as default methods are public. You can implement any number of interfaces.

Question. The output of the code is similar to the following, WordGameTile at some memory address false. How do you make it print a1 true? So this code is describing a tile in a very popular crossword game in which each tile has a letter and its value in points.

Answer. Override the methods equals, hashCode, and toString from the object class. So toString is relatively straightforward. How do you represent this class as a string?

The equals method tests whether the object references are equal, that is if the objects compared are the exact same object. To test whether two objects are equal in a sense of equivalency, meaning containing the same information, you must override the equals method. So in this example, it compares whether the letter of this tile is equal as well as the value of the tile.

The value returned by hashCode is the object's hashcode, which is the object's memory address in hexadecimal. So by definition, if two objects are equal, their hashcode must also be equal. If you override the equals method, you change the way two objects are equated and object's implementation of hashCode is no longer valid. Therefore, if you override the equals method, you must override the hashCode method as well. So if you look at the sample code, it takes the value of letter, casts that into an integer value, adds this to a large number multiplied by the point value of the tile to ensure that we have a unique code for each possible tile in this crossword board game.

And so here's a summary of what I said about the hashCode, equals, and toString methods from the object class.

Question. How do you modify this class so that it demonstrates the singleton design pattern?

Answer. And so this is how we implemented the singleton design pattern. A singleton class is a class implementation that can be only instantiated once. And there's this answer, implements four things.

First, it uses a static reference to point to the single instance. So in this case, our member instance is static. Two, it adds a single private constructor to the singleton class. So we look at the constructor, the Dictionary method. There's a private keyword right in front of it.

Three, a public factory method that returns a copy of a singleton reference. So we have the method getInstance that does this, which is static. And four, we create the instance, the Dictionary instance, at program execution. So we look at the declaration of instance. And it's assigned to the creation of the Dictionary instance with a new operator, so we do it there. So this is called eager instantiation-- sorry, initialization. Sorry about mispronouncing that.

We could also use lazy initialization, so we'll look at the next slide. And so in this case, we'll only create an instance of Dictionary when the getInstance method is invoked. So check out point number four. So this slide summarizes the four points I just discussed.

Question. What's wrong with this code?

Answer. So I highlighted mistakes here. So the first thing, we declared a Final class as final with the final key word. However, you cannot extend a class defined as or declared as final. And so we note that a Final subclass extends Final class.

As we go lower, we have the line, this.FinalInt equals new Integer i. A final member cannot be reassigned, because it's assigned right at the beginning when it's initialized at the top. And a third thing we have the method updateInt, which is declared as final, but you cannot override a final method. And the class Final subclass does that, overrides update Int.

I'll go to the next slide. So the final keyword. Use the final keyword in a method declaration to indicate that the method cannot be overridden by subclasses. Methods called from the constructors should generally be declared final. If a constructor calls a non-final method, a subclass may redefine that method with surprising or undesirable results.

Note that you can also declare an entire class final. A class that is declared final cannot be subclassed. This is particularly useful, for example, when creating an immutable class like the String class.

Let's go on. The final modifier can be applied to variables, as we've seen in a code sample. Final variables may not change values after they are initialized. However, final references must always reference the same object, but the contents of that object may be modified. Final variables can be class fields, method parameters, or local variables.

Immutable objects. An object is considered immutable if its state cannot change after it is constructed. If you want to enforce immutability, you must ensure that all subclasses are immutable or make your class final.

So here's a strategy for creating immutable classes. One, don't provide setter methods. Two, make all fields final and private. Three, don't allow subclasses to override methods. The simplest way to do this is to declare the class as final. Four, if the instance field includes references to immutable objects, don't allow these objects to be changed.

Here's a summary of Java class design. Encapsulation using the private modifier and getter and setter members. Default methods, define methods in interfaces. Use the default keyword. Overridden versus hidden, static, methods.

Polymorphism, abstract classes versus interfaces. If your override Object.equals, also override object.hashCode.

Singleton class, a class implementation that can be instantiated only once. And the final keyword, a class that is declared final cannot be subclassed. A final method cannot be overridden. And a final member can be initialized only once.

## 2. Java Class Design?. Part 2 - 2m

Default methods were introduced in Java 8 to help library developers maintain and evolve their libraries. If you have an interface in Java, historically, it hasn't been possible to add methods to an interface. So if you needed to add a method, you'd have to add a new interface alongside of the old interface that has that new method. Then if you wanted to add another method later on, you'd have to add a third interface. And so what you'd get is a proliferation of related interfaces that just really cluttered up your library API and required your applications to do some casting and instance of operations.

And so in Java 8, default methods allow you, the library maintainer, to add a method directly to an existing interface. And so in doing that, we avoid this problem with interface proliferation and allow existing interfaces to have new functionality added to them. And so we took advantage of default methods in Java 8 by adding a bunch of new methods to, for instance, the collections interfaces. So new default methods were added to collections to add new operations on those collections that weren't there before, and also to provide a bridge between the Collections APIs and the new Streams APIs that were also introduced in Java 8.
