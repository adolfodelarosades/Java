# 4. Lambdas and Streams

1. Lambdas and Streams - New - 14m
2. Lambdas and Streams (Part 2) - New - 13m

## 1. Lambdas and Streams - New - 14m

In this lesson, we are going to discuss lambdas and streams. We start with a quiz. Given the interface FuncInterface that has a couple of static final feeds, some in divisor, and an abstract method on line 14, a default method on line 15, an abstract, [INAUDIBLE] abstract method on line 16, an abstract method-- rather, a static method on line 17, and a private method on line 18. And they have a question for us that says, which three lines prevent this code from working as a function interface?

Before answering this question, what we are going to do is we are going to a first look at some concepts. So first, what do lambda expressions come from? That would be a good question. Where do lambda expressions come from?

Well, lambda expressions are enabled by functional interfaces. In fact, we created a whole set of them in the package [INAUDIBLE] function, and we provided this starting Java SE 8. And a function interface, it's an interface that has exactly one abstract method-- only one. The remaining methods, if any, they are either default, static, or private.

So here, we give you an example. You can use the available ones in the API, or you can create your own. Here, we created our own called FuncInterface. It has one abstract method called AbstractMethod that takes an integer and returns a double. In the TestClass, top right, you will see that we declare a variable called lambda of type FuncInterface, and we initialize it with a lambda expression that takes x as the parameters, left to the arrow token, and then multiplies that x by 2.0.

Additional absract methods ruin the functional interface and break code as well. We see an example in the bottom where this FuncInterface, it has two abstract methods. One, abstractMethod, takes an integer and returns a double. And the other one is called abstractMethod2. That takes an integer and returns a double. In the test class below, you will see that this will not compile because of the two abstract methods.

So in terms of data types and generics, types used in lambda expressions come from the abstract method of your functional interface. That abstract method can take parameters which determine the amount and types used in the lambda left side, and then a return type will determine what type the lambda right side evaluates to. So in our case here, on the left side, we have that funcInterface. You see how explicitly that abstractMethod takes an integer x and returns a double. In the lambda expression on the right side top, you will see that we pass x as an integer, and the A-- in this case, the body of your lambda expression 2 times x, will return a double.

You can use generics, by the way, too. So the type as specifiers through generics or inferred from object used in lambdas. So we show you the bottom example. We show you a funcInterface that has two generic types-- T, text t and return R. And this is shown by the abstract method that takes in a T and returns an R. So in the TestClass, you will see that we declare that lambda as a variable of type, in this case, Integer,Double, comma Double, which means it takes an integer and returns a double.

Functional programming-- well, functional programming, basically, is very, very useful, and it saves-- you can save and pass the lambda logic as if it were data. So you can declare a variable and initialize it with a lambda expression, you can pass it any way you want. So here, we have a main method, and we have, in the bottom, a TestClass. This test class we declare a lambda variable of type funcInterface-- the previous one that we've seen in the previous slide-- which is set to the expression x, arrow token 2 times x.

And this TestClass has a couple of methods. One is called the callAbstractMethod that basically calls the abstractMethod of the funcInterface which is implemented through the lambda expression that we see over there-- x arrow token 2 times x. We pass 3 to it, so the value of x is 3, and print it out. And then, in the change lambda, it takes a variable of type funcInterface called Lambda and initializes the lambda of that class. That's why we have this.lambda equals lambda.

So going back to the main method, we create an instance of TestClass, and then we call the callAbstractMethod. We know that callAbstractMethod will go ahead and call that abstract [INAUDIBLE] 3 to it. And we know that the lambda expression is represented by x arrow token 2 times x, which means this will return 6 on 0 as a double.

In the line where-- in the fourth line, in this case, is some of the upper code, we have changeLambda. We're calling changeLambda method on the instance. But this time, we're passing, because that changeLambda takes a variable of type funcInterface. We are changing that to be a lambda expression that says x arrow token 3 times x, which means we pass-- we change the logic, the business logic of the lambda expression. Which means now, when we call the abstract method, when we pass the 3, it's going to be passed to that lambda expression that was changed, which is now 3 times x, 3 times 3 is 9, and that's why it prints 9.

So there are a lot of built-in functional interfaces that you should know. There are many functional interfaces built into Java, and we highly advise you to know about them. Of course, the more you work with them, the more you get familiar with them.

Most are a mix of return types, parameter types, parameter numbers, and so forth. You don't need to memorize all of them, by the way. But whenever you need one, just go ahead and look at the API and use it. That's why we tell you the API is your friend. You should at least know these types and their methods, including abstract and default.

So here is, for example, the few examples that we showed you in this table. Function, that's a lambda. That's a function interface. It takes T an R. So it has an abstract method called Apply that takes T and returns R. And we show you an example on the right side of it. And we have linearly operated that extends function. That's also another one.

Predicate-- predicate, is widely used. Consumer is also used. You have a Supplier that gives you an object all the time, creates an object for you. Runnable, I know we are all familiar with runnable interface. That's part of the threads, OK? Runnable-- and we saw that in threads, especially the old threads. And now, of course, you can go ahead and it's called an abstract-- rather a functional interface-- just because it has one abstract method called run.

There are variations of these function interfaces, and we use the prefixes to change their names, and they may influence the parameter types, the parameter numbers, and result type. And they have slightly different methods compared with their nonprefixed siblings. For example, here, we show you a list. We've got the consumer, and we have the DoubleConsumer. That, of course, takes a double. We have the IntConsumer. That takes an integer. We have the LongConsumer. That takes a Long. And we have a BiConsumer that, basically, accepts-- in this case here, the accepted takes two types, T and U, as an example. So you see, there are variations, and you should know about these.

Let's go back now to our quiz. We're going to take a look and see which lines, in this case, [INAUDIBLE] prevent this quote from working. So we look at line 12, that's basically a field of type int. But the fact that we did not specify static final, that's not a problem, because we know all interfaces fields are automatically static final. So that's good.

13, we go ahead and declare divisor as a static final variable-- no problem. 14, we have an abstract method. So far, it's only one. That's good. 15, it's a default method product. That's good. 16, we have another abstract method. Now, if you take a look at 14, the keyword abstract is not 4, is not there. That's OK, because every abstract method inside the interface implicitly is abstract. So you can write explicitly abstract in front of the keyword, though you don't have to.

So now, we ended up line 14 and 16-- which is, in this case, C and E-- we ended up with two abstract methods. And, obviously, this is a problem. That's not going to work as a functional interface.

Now going, continuing with that, on line 17, we have a static method. Again, no problem with that. And 18, we have a private method. If you look at it, it looks like we have no problem with it, but be careful. It's trying to increment sum.

Now, we know that sum in line 12, that is actually a static final variable. And we know that a final variable cannot be changed. So obviously, this definitely is not going to allow this code to work-- so just because you're trying to, in this case, increment a final variable.

Here's another quiz. Here, we give you four different types of statements, and we tell you which statements cause a compiler error. That would be-- let's take a look at that.

So looking at A, we've got a DoubleFunction of type Double. Area, and it's initialised with a two-dot lambda expression. So the function requires two types we specify through generics. The first is the input parameter type. The second is the result. A double function does not mean we are doubling the number of parameter of results. Instead, it means the input parameter must be doubled. The only thing we need to specify through the generics is the return type, which, in this case, is also a double. This option compiles correctly, no problem.

How about B? Well the prefix Bi in the BiFunction that we have there-- we have a BiFunction that takes Integer, Integer, Integer, and we initialize that. The variable name is divide. We initialize that with that lambda expression.

So the prefix Bi in a BiFunction means there are two input parameters. Each must be specified through generics. We also must specify the return type. This means a BiFunction should have three types specified through generics. This option compiles correctly, no problem.

How about C? Well, let's take a look at C. You've got a DoublePredicate, Integer, Integer, test, and we set it to that lambda expression. We try again, in this case, to check the equality of x and y.

Well, a predicate requires the input parameter type be specified through generics. The output type is always a Boolean, because you're testing equality between values, and yet, there is two types in the generics. Both A and C, of course, can be correct.

In this case, a option wants you to think that double prefix means the predicate should have two generics. What it really means is that the input type is a double. This of course, does not comply. So does C does not compile.

And the last one, D-- so as you see here, we found out that C is the one that does not ever create compilation error. And the last one, we have IntPredicate test. Again, this wants you to believe the absence of genetics means the statement is automatically wrong, when it's not. In this case, that will compile without any problem.

## 2. Lambdas and Streams (Part 2) - New - 13m

Let's take a look at some rules. We start with parenthesis on lambda expressions. Parentheses are only optional with a single implicit parameter. Use parentheses when expressions have more than one parameter or expressions explicitly declare the parameter type.

We show you examples here where, in the first line, we have one parameter that we're passing, no type. That's acceptable, or we can use parentheses-- they're optional-- in second line. In the third line, we're specifying a type, and that's why that's not good. You need parentheses. We fixed that with line four.

In line five, we're having two parameters, x and y passing. And because the parentheses are missing, that's not good. And we fixed that in line six, where we put parentheses. And the last one, we passed x, and we specified the type of x, but we do not specify the type for y. And that, of course, is not good.

Braces-- well, braces on lambda expressions are optional if a lambda expression contains only one statement. Enclose multiple statements within curly braces. Include a semicolon after each statement and at the end of the lambda expression. We show you some examples here on the slide. First one, because it's only one statement, you don't need braces, or the second one, you can put braces. That's OK; it's optional. Third one, because we have two statements, you must have the braces. And as you see, every statement has a semicolon at the end, and, of course, a lambda expression has a semicolon at the end.

Include a return statement for expressions that return values. For example, here, we want to return the PI of the Math class, so we use Return. Method reference for lambda shorthand-- so sometimes, the lambda expression simply calls an existing method. For example, here, we have, we call, the toUpperCase. So the method reference offers a shorthand syntax that you see over there, where we can call it string::toUpperCase. Because the toUpperCase is a static method, we call it [INAUDIBLE] the class-- string::toUpperCase.

For a particular instance-- for example, here, city, we declare city as a reference of type string, initialized with the string Munich, and then we declare lambda as a supplier of that string. And as you see here, we can go ahead and set it to city::toUpperCase, which means it's going to change the string city to uppercase. And then, later on, we can call the GET method to get us that, Munich in uppercase, and print it out-- pass it to the system.out.println.

The last example, we have city. That has a variable of type String. And we initialize with Munich. We can go ahead and create a lambda that is equal to city::toUpperCase. We can also overload that by using the Apply method and pass it with a Locale.GERMANY.

More method references for Lambda shorthands. It can be used for static methods-- for example, here, Integer.toBinaryString, or Integer::toBinary, or for printing, for example here, System.out.print, and then x, we can also call system.out::print. That works.

So the general rules for this, a method reference, is that we have the kind of references. You can use it, for instance methods, of an arbitrary object of a particular type. We saw an example over there ContainingType::MethodName, an instance method of a particular object containingObject::InstanceMethodName. Static method, a constructor, ClassName::new, and so forth.

So here's a small quiz. In this quiz, we tell you which options show a valid syntax. So we get A, B, C, and D. Let's take a look at these.

In the first one, A, we do have a function that needs a return value. When you're writing a statement with a block like this, you must explicitly write a return statement. This does not compile because the return statement is missing.

How about B? B here, we declare a city as a reference variable of type a string and set it to the string Munich. And then, we have a BiFunction, in this case. And this BiFunction of the expression variable is set to string::substring.

So the generics of these a BiFunction provide for three parameters-- the start position of the substring, the end position of the substring, and the return value of the string. The problem is that substring is an instance, a method, but it's being called like a static method. Instead, it should read, in this case, a lambda equals [INAUDIBLE] colon, substring, substring. So that, of course, is we definitely got a problem.

Let's look now, at C, OK? So in C, we have a BiConsumer. And in this case, of course, this BiConsumer here, we have it String, String, and it's a variable-- in this case, lambda-- and set to that lambda expression. So you may remember for earlier that we said that you can't mix implicitly and explicitly-type parameters in lambda expressions. So obviously, here, we have string x, comma, y. We did not specify the type of y, so this will not combine.

And D, we have a Consumer. Again, not only you do need a semicolon at the end of each statement in the block, you also need them at the end of the overall statement. So this is done correctly, as you see, and without any problem. And a return statement is necessary because the consumer does not return anything. So this option is correct-- option D is correct-- and works without any problem.

Now, let's take a look at streams. Collections are converted to streams, standard or parallel, in the sense sequential or parallel. Stream methods are chained together, and stream methods take lambda expressions as arguments.

So streams are pipelines of data. So here in this example, we have a list of strings called series, and we use the of method to create a list, in this case, of strings-- Berlin, Hamburg, Munich, Cologne, Frankfurt. And we take that and we convert it into a string. And then, in this case, we'll go ahead and use some filtering.

So first, we get the cities, all cities, the cities that contain E. And so we look, and we have Berlin, and then, also, cities that contain either L or, in this case, or A. So in our case here, in our case here, because we have the first .filter predicate has a predicate, [INAUDIBLE] second has a predicate, and then we have the .ForEach that prints that city, and because we have at the end here that the city has to contain and E and an L or an E and an A. So that's why, in this case, we get Berlin and, in this case, Cologne as the result when we use the .ForEach to print, in this case, the city.

And so just because of that, and between the first filter and the second filter, then, in second filter, we have either L or A. But if you take a look at Frankfurt, it has, in this case, and A, but it does not have an E. And that's why it's not used. On the other hand, Cologne has an L and an E. That works. And then, Berlin has an L and an E, and that also works. That's the output in this case, would be Berlin and Cologne.

Now, looking at intermediate and terminal operations, we can use intermediate operations that can be chained, like filter, peak, map, flatmap, and so forth. Terminal operations terminate the chain, like forEach, findFirst, findAny, anyMatch, allMatch, noneMatch, count, max, min, average, sum, and so forth. And here, we see an example where we have a cities.stream, and so we convert that list of cities to a stream and then use some couple of filters and use the forEach and findAny. This, actually, will not compile, because we're trying to use the forEach, which is a terminal operation, inside as an intermediate operation, and that will not compile.

Returning values as optional-- some terminal operations return values, like findFirst, findAny, [INAUDIBLE], and so forth. They return, in this case, as an optional. An optional is a wrapper object that protects against null values. And here, basically, we have cities that we convert as a stream, and we use a couple of filters, and we use the findAny.

So a findAny, we know that, in this case, it returns an optional. If you wanted to, in this case, get the string-- which, in this case, represents the city-- we know about the optional cannot store, in this case-- so in our case here, that lambda expression, rather, cannot store a string. So in findAny returns an Optional. So if you want to return a string, then you use the get method of the optional class. This, basically, will find out if the string is variable, you will you work with get, return that string, and assign it to the result, in this case.

Let's take a look at this quiz. In this quiz, we have a list of cities. OK, well, we use a constructive City, that takes, in this case, the name of the city and the population. So we take that list, and we convert it to a stream, and we use the filter that basically finds the list by getting the population. The population should be less than 100,000-- rather, 1 million, OK? And we use the .findFirst, and we use the .orElse in this case, all right?

So what is the origin of the .orElse? That would be the question here. So this is on the other side of what you can expect from a certification exam. You need to know where .orElse comes from and what it returns, because that controls what methods we can call if you continue to chain. The .findFirst method returns an Optional. Therefore, the next method that gets called in the chain has to be from the Optional class. It returns a City object in the event that no City is found from the string.

You should be familiar with many of the methods in the Stream interface and the Optional class. You will encounter many questions on these APIs in the exams. So remember that.
