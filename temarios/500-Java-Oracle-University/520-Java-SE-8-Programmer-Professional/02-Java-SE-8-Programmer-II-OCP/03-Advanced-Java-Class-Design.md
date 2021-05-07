# 3: Advanced Java Class Design

1. Advanced Java Class Design - 12m

## 1. Advanced Java Class Design - 12m

 
Section 2-- advanced java class design. Question-- what's wrong with this code? What's one way you can fix it that uses multiple inheritance? Multiple inheritance-- there are three kinds of multiple inheritance.

Multiple inheritance of state, which is the ability to inherit fields for multiple classes. This is not supported in Java.

Multiple inheritance of implementation, which is the ability to inherit method definitions from multiple classes. This is supported in Java SE 8 through default methods. A class can implement more than one interface, which can contain default methods that have the same name. The Java compiler provides some rules to determine which default method a particular class uses.

And multiple inheritance of type-- this is the ability of a class to implement more than one interface, which Java always supported.

Question-- what's wrong with this code? This code validates a phone number-- not very well, but it does it. Answer-- local variables outside the scope of an inner class must be final or effectively final. So the inner class here is PhoneNumber. So [INAUDIBLE] class definition inside another class localClassExample.

We have a memory variable in localClassExample nl. And then nl within the inner class PhoneNumber is reassigned 7, which means that is not final.

Remember what we said about final? What we cannot do with a final variable is we assign it. And that's what we're doing now. Variable is effectively final if it is never changed after it is initialized.

Question, how would you convert local class example so that it uses an anonymous class? Answer, and so check out the highlighted text. So that is our anonymous class.

Anonymous classes, the anonymous class expression consists of the following, the new operator, the name of an interface to implement or a class to extend. In this example, the anonymous class is implementing the interface phone number, as we see there.

Parentheses that contain the arguments to a constructor, just like a normal class instance creation expression, notice when you implement an interface, there is no constructor. So use an empty pair of parentheses as in this example. A body, which is a class declaration body, more specifically in the body method declarations are allowed but statements are not.

Because an anonymous class definition is an expression, it must be part of a statement. So in this example, it's part of an assignment statement. The anonymous class is being assigned to the instance phone number.

And here is a summary of what it said about anonymous classes. Question, what code should you add to get the following output? Ace of diamonds beats king of spades. Answer, note that in this code cards are the same rank. But cards are the same rank, but different suits are not equal.

So a brief explanation about this code, what we want to do is create enumerated types that store not just one value but the value, basically, the text of the card, as well as numerical values so we could sort it.

So a note about enumerated types, all enums implicitly extend Java lang enum. Because a class can only extend one parent, the Java language does not support multiple inheritance of state. And therefore an enum cannot accept anything else.

Note, the constructor for an enum type must be package private, which means, default or no modifier keyword, or private access. It automatically creates a constants that is defined at the beginning of the enum body. You cannot invoke an enum constructor yourself.

Because we want additional data in our enum types for suit and rank, we have to create a constructor for them so that the compiler knows how to create it. So we notice in suit and in rank we have a constructor so that we could specify the suits, texts, diamonds, clubs, hearts, and spades and its ranking.

As well as rank, we have the text for each card, from two to ace as well as a numerical value. So we could sort them. And we also overrated some object methods, equals, hash code, compared to two string. Actually compared to-- it's not an object method as you notice that we implement comparable so that we're able to sort it.

So here is a summary of what I said about enum types. Question, modify anonymous class example so that it uses a lambda expression. And so the anonymous class is highlighted.

Answer, part 1, we first make phone number, the interface phone number a functional interface. A functional interface is any interface that contains only one abstract method. A functional interface remember can contain one or more default methods or static methods. And here is the answer. And so the highlighted text is a lambda expression in use.

So let me back up here to explain more about what we did for the functional interface. So as again, there's only one method. And there are no member variables. Before, a phone number had one member variable because what this interface did was validate a phone number and store it in its member variable. Instead, this interface, the validate method validates a phone number and then returns a valid phone number, or null.

And so now let's look at the lambda expression. A lambda expression implements a functional interface. So in this case, it's implementing the validate method in phone number. A lambda expression consists of the following, a comma separated list of formal parameters enclosed in parentheses.

In this case, the validate method contains only one parameter. And note, you could omit the data type of the parameters in a lambda expression, as we did here. In addition, you could omit the parentheses if there is only one parameter. So we could have gotten rid of the parentheses around n, the arrow token dash greater than sign, and a body which consists of a single expression or a statement block.

Note that a lambda expression looks a lot like a method declaration. You can consider lambda expressions as anonymous methods, methods without a name. And so this is a summary of what I said about lambda expressions.

Question-- will this compile and run? No, change the first line to the second. So let's go back to the code so we can locate this incorrect statement. So incorrect statement is the last statement, string lambda x equals x to x. So we'll change this to func interface 1 lambda x equals x 2x.

Target types, the data type that these methods and statements expect is called the target type. To determine the type of a lambda expression, the Java compiler uses a target type of the context or situation in which the lambda expression was found. So we look at the answer. X to x is not type string. It is actually a type func interface 1.

So additional examples that we saw in the previous sample code, in this method code, the target type of the lambda expression is func interface 1 system out print line my app do something friend. And the second argument is our lambda expression. And in this second method code, the target type of the lambda expression is func interface 2 string system out print line my app do something lambda expression friend.

And so here's a summary of advanced class design-- multiple inheritance of state, the ability to inherit fields from multiple classes not supported in Java; multiple inheritance of implementation, the ability to inherit method definitions for multiple classes supported in Java SE 8 through default methods; multiple inheritance of type, the ability of a class to implement more than one interface. Local variables outside the scope of an inner class must be final, or effectively final.

All enums implicitly extend Java lang enum. An enum cannot extend anything else. The constructor from enum type must be packaged private or our private access.

A lambda expression implements a functional interface. A lambda expression consists of formal parameters, the arrow token and a body, which is a single expression or a statement block. And a target type is the type of a lambda expression.
