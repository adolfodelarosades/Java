# 3. Methods in Interfaces

1. Methods in Interfaces - New - 13m
2. Methods in Interfaces (Part 2) - New - 11m
3. Methods in Interfaces (Part 3) - New - 15m

## 1. Methods in Interfaces - New - 13m

In this lesson, we are going to discuss methods in interfaces. Well, methods in interfaces have evolved since the Java SE 7. Of course, you should understand now how to write and use methods in interfaces. There are abstract methods that many of you would know.

And then we are going to introduce static methods, default methods in Java SE 8, and private methods in Java SE 9. So simply saying that interfaces can now implement method doesn't do justice to the evolution that's been taking place in interfaces since Java SE 7. Nor does it give you the insight you need to understand why each type is beneficial.

To fully understand and appreciate why these are beneficial, we need to re-examine the original purpose of interfaces and how they were written in Java SE 7. So here's the concept of Java SE 7 interfaces, one of the scenarios where we see a program abstractly and avoid a multiple inheritance complication.

So lots and lots of times, we have tendency to say program to an abstraction or interfaces. Interfaces originally contained variables that are typically public static final and abstract methods. So here, for example, we've got an interface A that has a static final variable X, which is of type int, and set it to 10. And interface B, that has a static variable X that is set of 20, which is also final. And we have a couple of abstract methods, m, [INAUDIBLE] and both interfaces.

Now we can decide to create a class called D that implements A and B. So we need to implement the method m. So that method m is implemented, and we can assign, for example, the value of X in A to the variable from A, and the value of the X in B to the variable from B.

So when you say inheritance in Java, we mean inheriting from multiple interfaces like this. So problems exist in other languages like C++ when you try inheriting from multiple sources, and there is a conflict in deciding which source should provide the data and methods. In Java, static variables are safe in case of multiple inheritance. Like in this case, we are implementing two interfaces.

Remember, static variables belong to the class or interface. To call them, you need to reference the interface anyways. So, in other words, you are explicitly saying which value to go with. All interface feeds are static final even if you augment the static final keywords.

So abstract methods are also safe. There is no conflict in knowing which implementation of abstract methods to go with. Because, by definition, abstract methods have no implementation. It's up to you to explicitly write in the subclasses how you want these methods to behave. That's typically how we see it.

So now, looking at implementing Java SE7 interface methods. Here's a scenario, an example where we have an interface called Accessible, and it has a static final double variable called OVERDRAFT_FEE that is set to 25. And then, we have a couple of abstract methods, verifyDeposit and verifyWithdraw. By the way, all abstract methods in interfaces are abstract even though you don't use the keyword abstract in front of them. So that's optional.

So this interface is meant to be implemented in classes for financial products where people access money through deposits and withdrawals. A non-accessible financial product would be a savings bond. You're not able to access the money after the bond is purchased.

So another interface could outline how interest should be earned. Again, this would be implemented in savings accounts, bonds, and certificates of deposits. Multiple inheritance would occur with accounts like a savings account, which must implement two interfaces to make the accounts accessible and earn interest.

So let's see how we implement abstract methods. So we can now think of creating a class called BasicChecking that implements Accessible. So we can now implement the abstract method verifyDeposit and withdraw, which happen to be two methods that take two parameters, or arguments, amount, which is double, and the pin, which is an integer.

So we can go ahead and implement them. Here, we just wrote a comment. We know what should we implement over there. So we can verify deposit. We can verify the pin. We can just write some code that verifies the pin and write some code that verify the amount is greater than 0.

In the verifyWithdraw, we can write code to verify the pin, verify the amount is greater than 0, and verify the account balance won't go negative. So now, by looking at the implementation of these methods, we can actually see some duplication of logic. So the same logic is largely duplicated by other classes. For example, here, I can see the first one is BasicChecking.

The second one happened to be RestrictedChecking class that implements Accessible. And I see, again, in the verifyDeposit and verifyWithdraw, we see some code that is common to the ones that we've seen in the previous one, which is the BasicChecking where we do verify the pin, verify the amount is greater than 0, and so forth.

So the question here is, we have this duplication of code, and how do we deal with this? Well, we can go through it and use it as a quiz. And where it says, what is true about code duplication? And we give you a few answers here, and of course, we're going to select the right one.

So these questions, occasionally you see them in some of our courses, they really are used to kind of understand the concepts. You won't see such questions like these on the certification exam. So, for example, here, we said the first answer, A, duplication makes your code longer. This is good because it makes your colleagues believe you're really smart and capable of handling complex code. Obviously, that's not a good idea. That's not right answer.

Duplication is good because it builds redundancy into the system. That also is a bad idea. If you need to make an edit, you will have to search all the cases where the code is duplicated. This is tedious and inefficient. That's true. So the answer would be C in this case.

And, of course, duplication is an elegant substitute for version control. That's not true. So this will lead us to this kind of quiz, where we're given an interface called TestInterface that has an abstract method called calculateTax. And we're asking you to find out which two classes compile.

So let's take a look at the first one. First one, which is A, says that this class called TestClass, it has an implementation of a method called calculateTax that returns a double. And the question is, would this compile? And the answer, yes, why not? Because this TestClass has a method called calculateTax that implements something and return a double. And it has nothing to do with the TestInterface. It's not implementing it, so we've got no problem. It complies.

How about B? We made the TestClass implement TestInterface, and here we have a calculateTax that takes a double, as you see here, and returns a double. So here, of course, it's also correct. Yes, you can say, OK, I can implement a calculateTax, a method that takes a parameter double and would be overloading. Why not?

But in this case, at the same time, this class implements the abstract method and the interface, TestInterface. But we don't see the implementation of that method, which is a method called calculateTax as you see here. And this does not take any parameter. Because this class does not implement the calculateTax that takes no parameter, then, of course, it will not compile.

How about C? Well, C, in this case, we've got a class, TestClass implements TestInterface, and we have that abstract method. Here, this will not compile because the TestClass is not an abstract method. So you cannot, in this case, have an abstract method in it, because it's not an abstract class.

How about D? And so, in D, we have a TestClass, which happens to be abstract, implements a TestInterface, and it has this calculateTax, and that takes a double. So this apparently, because it's an abstract class, it should work without any problem. When you are ready and you have a concrete class that implements the interface, then you need to implement the method calculateTax that takes no parameter. So this would compile.

And the last one, which is E, we have that abstract class TestClass that implements TestInterface except that in this case, the calculateTax that we see over there. It is a method that returns void when we know that, in the interface, the calculateTax return needs to return a double. And that's why this will not compile.

## 2. Methods in Interfaces (Part 2) - New - 11m

Now, we said starting Java SE 8 interfaces now may implement special types of methods, which are either static methods and default methods, and both are public. So static methods are no different than those in a class. We know about that, so there's no problem for that. And default methods help you minimize code duplication, of course. So that's-- they provide a single location to write and edit code, they can be overridden later if necessary, and they're overridden with per-class precision. It depends what you are, in this case, doing.

Now, looking at implementing default methods. So in this case, we have an interface called Accessible, and in it we are going to implement two default methods-- verifyDeposit and verifyWithdraw. Both methods take amount and pin. Amount is a double and pin is an int. VerifyDeposit will verify the pin and verify the amount is greater than zero. The verifyWithdraw will verify the pin, verify the amount is greater than zero, and verify the account balance won't go negative.

So adding the public is optional for default methods. A default method is always public. Later on, you are going, in this case, to create a class that implements Accessible. So for example, this class called BasicChecking implements Accessible. It will automatically end up-- this BasicChecking will automatically end up accessing the default methods implemented inside the Accessible.

You can override default methods and call the interface's implementation. Here's an example, where in this case we-- in the restrictedChecking class that implements Accessible-- we override the verifyWithdraw by, in this case, taking an amount and passing an amount and the pin. And in it we can access the verifyWithdraw of the interface Accessible by writing Accesible.super.verifyWithdraw and pass the amount and pin. You can later on write more logic to support the features of the restrictedChecking class, if you want.

Some of the rules, in this case, discuss the problems of multiple inheritance. So for example, for multiple inheritance we have the type-- a class can implement, in this case, multiple interfaces. And in terms of the behavior, we say a class implements interfaces containing multiple default methods. Special rules exist to prevent complications. We'll take a look at these rules in the next few slides. In terms of the state, a call to a variable cannot have multiple potential values, so we need to be careful with that. This is exactly why multiple inheritance is problematic in C++. We don't have that problem within Java. A single inheritance in Java class can implement more than one interface.

Let's see this question. So here we have-- we basically tell you-- given that you have an interface called Black that has a method getColor that prints the black string. And then we have the interface Red that extends Black , and it has a getColor that prints red. And then we have an interface Gold that has getColor that prints gold. And of course we have a class here, Colors, that implements Black, Red, and Gold interfaces. So we have a main method, we create an instance of colors, and we call the getColor. So the question here-- what is the result of running this code?

So if you look carefully, you will see that there has to be some kind of rules to follow to be able to see if it prints black, prints red, or prints gold. Or maybe there's an error, a compilation in the error. To be able to answer these questions, let's go ahead and take a look at the rules first. So the first rule, which is Rule 1 in this case-- in terms of the rules of default methods-- we tell you that a superclass, or rather a superclass method, takes priority over an interface default method. So the superclass method may be concrete or abstract. Only consider the interface default if no methods exist in the superclass. This is the Rule 1.

Here's an example, where we have a class A that has an implementation of the method m and interface B that has an implementation of the method m. So if now we create a class D that extends and implements B, so which one, in this case, D will be using. So that's why we have the rule here that says a superclass method takes priority of an interface. So that's why, in this case, the method in the superclass is the one that takes precedence over the one of the interface. So if you instantiate an instance of D and call method m the version of the method that is used comes from the superclass A.

There is another rule called Rule 2. In Rule 2, here, we have an interface B that implements method m-- default method m. And then we have an interface C that extends B and implements its own default m. And then we have D that implements C. So how does it work? So now if you instantiate an instance of D and call method m, which one is going to be called? Well, the rule says that a subtype interface default method takes priority over a super-type interface default method, which means when you instantiate an instance of class D and call method m, the version of the method that is used comes from the interface C, which is the sub-interface in this case-- subtype.

We have another rule called Rule 3. Here, imagine you have two interfaces-- A, or rather B and C. And both of them implement the method default method m. And we decide to create a class that implements B and C, both interfaces. So the question here, which-- if you instantiate an instance of D-- which one is going to be called, the one of B or the one of C? Well, here's what Rule 3 says. It says, if there is a conflict, treat the default method as abstract. So the concrete class must provide its own implementation. This may include a call to a specific interface implementation of the method, if you want.

Like in this example, you implement the method m. If you want to call the default method in B, just go ahead and write B.super.m and this will be calling the default method of B. So that's why, if you want, if you instantiate an instance of class D and call method m, you will need to specify within the class D how the method should be implemented.

Now we all know that, in this case, Java does not support multiple inheritances. OK? So we cannot have class-- for example, I have two classes, B and C, happen to be abstract. And I create class D and extend B and C. This will not happen. This, basically, does not work. A class cannot extend multiple abstract classes. And the class-- in Java, class can extend only one class. It cannot-- that's why we call it single inheritance.

Let's go back now-- let's go back now to our question. Based on the rules that we just saw in the previous slides, now we can answer this quiz. So you've got interface Black that prints black-- that has method getColor, prints black. And interface Red that extends Black. It has method getColor that prints red. And then we have Gold that gets color-- has a getColor, in this case, and prints gold. And we create a class called Colors that implements Black, Red, and Gold interfaces. And as a main method, we create an instance of Colors and we call the getColor.

So here, what is the result of running this code? Now look carefully. If you apply rule number 2 that says that, in this case, a subtype interface default method takes priority over the subtype interface default. That, of course, works without. Which means, now, the getColor of Red takes priority over the getColor of Black, because Red extends Black. That's good.

But then we made class Colors implement, also, the Gold. But look carefully. The Gold has a getColor but it's a static method. Aha. It's not a default method, it's static method. That's why, in this case, the answer would be B, it prints red. OK? Just because of Rule number 2. OK?

## 3. Methods in Interfaces (Part 3) - New - 15m

Let's take a look at this quiz. Which two cause a compilation error? Let's look at these.

So the exam wants you to know the difference between abstract classes and interfaces-- what's allowed and what's not allowed. This also means understanding key words and how they're used. So let's take a look at A.

A, we've got a class, an abstract class called testClass. It has a field, tax rate, set to 0.5-- which is double-- and it has a method implemented in this case, an increased tax, where, in this case, we modify tax rate by adding 0.1 to it. So this abstract class has a double incidence field and implements a method. You need to remember, it's OK to implement a method in abstract class, and abstract class may contain both abstract and concrete methods-- so no problem with this.

Now, let's take a look at B. In B, this abstract class has a double instance field and an abstract method. This does not compile, because the abstract method, by definition, has no implementation. Here, it happens that we have an implementation of it. So that's not right; we should not have the keyword abstract in front of it. So that will cause compilation problem. It will not combine.

How about C? The interface, this interface is similar. It has a double field and implements increaseTax as a default method, as you see here. The problem here is that any interface fields must be static fields. Even if you don't declare them staticfinal, they automatically will be. So you're not allowed to change the value of a final field like this, because this-- or, in this case-- will not compile.

Another clue is that a scenario like this could lead to multiple inheritance of state if tax rate and a variable like it could exist as instance variables. So in this case, because the tax rate is a final, you cannot modify it. So this would not compile. So B and C will not compile.

How about D? D works, we have an interface. It has a tax rate, which is double set to 0.5. Even though you don't explicitly declare it as static final, it is automatically static final. And then, it has a method, increaseTax. Even though we don't put the abstract keyword in front of it, it's still being looked at as an abstract method.

And the last one is E. And this distracter is kind of similar. It wants you to think that just because a static field isn't declared final that it's not invalid. But it's invalid. You're allowed to omit either keyword, and a field still will still be static final.

In this case, we put a static. We do not put the final, but still, that's considered as final. So E in this case has no problem. So the two ones that do not compile are B and C.

What if a default method duplicates logic? That could happen. And in this case, here's a scenario in our case here where, in this case, we have an interface accessible that has a default method, verifyDeposit, that takes an amount and a pin, and then we have a verify-- with [INAUDIBLE] here, we have some duplication of the code. Verify pin, and verify amount is greater than zero. And we see this code with both methods-- verifyDeposit and verifyWithdraw.

So duplication between default methods. One strategy is to put duplicated logic within its own default method. Here's an example where we pushed, in this case, V, a verified pin and verified amount is greater than 0 inside its own default method called verify transaction, except that all default methods are public. So this approach might be a problem.

So default method must be public. They can be called from almost anywhere, so returned values may not mean anything outside the context of other methods. It's dangerous if the method returns information you don't want to expose.

So how do we fix that? OK, so in this case, we're telling you that what if verified transaction were overridden somewhere in the program to always deposit $1 million into an account? As long as the method remains public, this bad behavior remains a possibility. So how do we typically fix that?

So here's an example. We're showing you where, in this case, you can go ahead and modify that. One way to fix this problem is to create a private interface method. This was introduced in starting Java SE 9. So in this case, we're now starting Java SE 9. We can create a private method-- like in this case, verifyTransaction happens to be private-- which means, if it's private method interface, it can be accessed only within the interface, and that's it.

So this definitely is the best solution, which means, in this case, verifyTransaction can be accessed only within the two default methods, which are verifyDeposit and verifyWithdraw. And that's it. And you call it, but the implementation is hidden inside the interface as a private method, and nobody can access that. So that is good.

Some of the rules about these Java SE 9 interfaces-- so we put it in a summary. So here, we specify the methods type, and then the supported, and the the notes. So for public abstract, yes, keywords are optional. Abstract, private abstract compiler error. Public default, yes. Public keyword is optional. A private default, and [INAUDIBLE] we get a compiler error. A static public, public static yes, private static yes, private yes. And, of course, one of the fields, static final, yes, keywords are optional. Instance fields are not accepted in interfaces.

Let's take a look at this quiz. In this quiz, we are giving you an interface called TheInterface that has a field, in this case, set to 99, and a field A, and a method-- an abstract method-- and then an abstract class called TheAbstract. It has a field. So the field inside the interface is-- we know that is going to be a static final, even though you don't, in this case, specify it explicitly.

In the abstract class-- that is this field-- int field is set to 1983, and it has an abstract method. Now, we can create a concrete class called TheConcrete that extends TheAbstract and implements TheInterface. And in it, you can implement the method, which basically prints "balloons." So in this case, I mean a-- so what does compare-- where, again, why does the computation fail in this case? That would be a question.

And we give you a few answers, and we need to select the right one. So the first one, we say, multiple inheritance of a state from field. So multiple inheritance of a state does not quite happen here. The field from the instance is static, and the field from the classes and instance field, it's not a recommended practice to name variables the same like this, but it's still valid without any problem. So A is not in the answer.

How about B, "multiple inheritance of behavior from method"? So again, multiple inheritance of behavior is allowed, but it's not a factor in the scenario. Both methods are abstract and require an implementation to be written in a concrete class, which does occur, no problem.

The C, when we say a concrete class using the wrong access modifier and method. This, let's take a look at this carefully. So this, a method inside the concrete class, happened to be, in this case, a default method-- rather, a default access modifier. That's what it has, a default access modifier. It's not public; it's not private; it's not protected.

So the abstract methods are public in the interface. The problem in this case is that the concrete class is attempting to assign more restrictive access privilege to an inherited method, which is, in this case, method. The method designated as public, but you are attempting to make it package access and word default access, you're allowed to loosen or weaken access privileges to increase visibility with inherited method, but you're not allowed to have more restrictive access.

To make this code compile. We'd want to declare the method in the concrete class as public for this to work. So C, in this case, is-- in this case, allows no compilation, in this case. So definitely, it's not that [INAUDIBLE] the problem about the compilation problem.

And D, "interfaces cannot instance fields." It's true, interfaces can't have instance fields. However, the interface does not attempt to create an instance field. Interface fields are implicitly a static final, even if you don't use those keywords, OK? So in this case, C would be the concrete class using the wrong access modifier for the method. We need to choose that for this to work. Otherwise, it will not, in this case compile. That's what we mean by that.

Another quiz, given an interface that has, in this case, an instance field set to 99, and the method and default method that prints the field, and then another InterfaceTwo-- that's InterfaceOne. InterfaceTwo has, also, a field. Rather, it's not an instance field. It's an abstract, rather a static final field, OK? Because if you don't even specify the types, a static final, it's, by default, automatically these fields in the side interfaces are static final.

So in interface one, you have the int field set to 99 and a default method that prints field. And in InterfaceTwo, we have the field, which happened to be static final and set to 1983, and the method happened to be, in this case, a private method system.out.print(field). So it's a private method; it's not a default method.

And then, we create a class called TheConcrete that implements InterfaceOne and InterfaceTwo. So in the main method, we create an instance of the concrete class called TheInstance, and we call the method. And the question here that we have is, what is the result of running this code. So should it be print, in this case, we're calling the instance method.

So obviously, in this case, if you take a look, you will see that in our case here, because the method inside the InterfaceTwo is private-- so obviously, the class cannot access it-- so in the instance, we'll access the method, which happened to be default, because we know that default, by definition, is public. And that's why it's going to call the default method of the InterfaceOne, which prints field, which is, in this case, 99, OK?

So in this case, a multiple inheritance in this case. And our case here pretty much shows us that, in our case here, Z, if we look at the answer, we see that one thing that we want you to remember is that private methods don't follow the special rules set devised for the default method, because they can't be called outside the context of their own interface. There is no conflict here when [INAUDIBLE] method from two different interfaces.

One method is default; the other is private. The only one, the concrete class C, is the default method. This is the implementation the class uses, which means our code, in this case, which creates an instance and calls this method will print 99. So A is the correct answer in this case.
