# 1: Lambda Expressions for Cloud Services

1. Lambda Expressions Overview for Cloud Services - 25m
2. Lambda Expressions Case for Cloud Services - 19m
3. Lambda Functional Interfaces for Cloud Services - 22m
4. Lambda Operations for Cloud Services - 24m
5. Lambda Collections Processing for Cloud Services - 15m
6. Lambda Parallel Stream for Cloud Services - 21m
7. Skill Check: Utilize Lambda Expressions for Cloud Services - Score 80% or higher to pass

## 1. Lambda Expressions Overview for Cloud Services - 25m

In this series of sessions, we are going to look at the Lambda Expressions and see how Lambda expressions can actually help build a robust and performant cloud services applications.

In general, when we discuss these cloud services, we have in mind that we are actually looking at-- in our case here-- at cloud applications which are typically installed and run over a JVM. So in general, we have this stack where we have a hardware server. On the top of that, we have our operating system, which is typically Oracle Linux. And then on the top, we have our JVM Installed. And on top of the JVM, will do make use of the cloud applications. And of course, we build our up application to run over the JVM.

Using the object-oriented concepts to actually build enterprise applications, we have a tendency to make use of the heap, where in general the memory in Java is made of the stack memory, where the primitives and also references to objects sit. And then you have the heap memory, where objects are created. We'll be, of course, sitting over there.

The idea is to be able to write efficient code, to have less objects created in the heap, and also avoiding the garbage collector to clean up the intermediate objects while doing any type of computation on cloud services data. So let's go ahead and get into these Lambda Expressions. And, of course, the focus is on cloud services.

Historically, cloud services have evolved with time from the silo computing, where it's pretty much a basic type of a computing that we do have, and where the basic computing with a dedicated type of physical hardware. So for example-- the physical hardware that we have here, that would be a standalone system.

And of course, from there we move to the grid computing. In this case, we solve large problems with parallel computing-- having the systems running in parallel through a centralized control to improve the performance.

Through that, we got into a utility type of computing, where now we offer a bunch of resources as a metered type of services-- for example, electric grid, where people make use of the electric grid and they're obviously billed based on their usage.

Then we move to a software as a service computing. In this case, we do have a network based subscription to applications, where people actually can go ahead and subscribe to whatever application they need, and make use of it.

And the idea behind the improvement of the cloud computing is to get into the next generation internet computing, and next generation data centers, where we can go ahead and offer a different type of platforms or different type of services to the users.

So this will lead us to looking at the components of the Cloud computing. We do make use of client computers. These are typically standalone laptops or other systems, or maybe smart phones, or maybe tablets, and so forth. That would be representing the client. We do actually make use, also, of distributed servers-- where, here, the servers are most probably located geographically all over-- in different places all over the world. And the good example is the cloud the Oracle Cloud Services, located everywhere.

But, of course, the server acts as if they are next to each other. And, of course, we also take advantage of the data centers. And we'll go ahead and make use of the data center, where these data centers can actually be a bunch of servers where applications are placed, and they are accessed via the internet. And the data is also available through the internet.

So the typical characteristics of the Cloud is that we can allow a on-demand type of services. And of course they are available all through the network. There is a huge rapid elasticity on how actually we can set up any size of the Cloud Services represented to the user.

And we can go ahead and service these clients by measuring the usage of the customer, and then billing the customer only on the services that were used. So we actually can measure that throughout the cloud services. And of course, we can go ahead and allow the users to configure their CPUs, their memory usage, their applications, their middleware cloud services-- all of that can be configured any way they want to adapt to their needs.

And the idea is paying as we use. That's the idea behind this. And of course, all of these applications do have interfaces so that we can interface to them without any problems. So what we did for the Cloud Services Model-- we went ahead and put that into three different tiers, where you now have the application tier, and that would be represented as Software as a Service-- we can call it SaaS-- and then you have the platform.

And a platform, in this case, would be a database, a middleware, analytics, integration type of a service. And all of this would be represented as a Platform as a Service. And then, of course, we make use of the infrastructure, where this infrastructure could be a storage. It could be a computing machine. It could be a network as a service or any type of service. And all of this is represented as what we call infrastructure as a service.

So what we are doing in this case-- we are introducing a new technology that is part of the Java Standard Edition 8 that allows us to actually write smart code and performant code-- and robust-- and this is called Lambda Expressions.

So the question I would typically have-- what is the Lambda Expression? Well, pretty much, in Lambda, an expression is nothing but a function-- a method. And a function is a computation that takes parameters and returns values. Typically we know about that, OK? And, of course, enter Java SE 8-- functions can only be implemented using methods. And the only way to pass a function or a method to another method is by creating an instance of an object, and passing that object. And then, through that object, we go ahead and invoke the method.

So Lambda Expressions now helps us, or enables functions to be passed around and stored like data. So we can go out and create a function, and store it in a variable, and pass it anywhere we want. That's the advantage that we have with the Lambda Expressions.

So let's just take a look at an example where we can go ahead and think about what is it that we were doing using the old Java Standard Edition-- which is 7 and 6 and before-- and how we can actually convert it to actually make use of the Lambda expressions. So let's assume that we have a class in this case, and this class is called Person. And the class Person has a string name, and age, and it has some getName and getAge and so forth.

And what we want to do is create a list of persons, and of course we want to sort this list. So the idea is we want to sort this list. So somehow we need to pass some kind of a sort mechanism that allows us to sort this collection. Sorting a list of objects-- we can go ahead and-- for example-- if we wanted to in this case sort it any way we want, we know that in Java, we have the Comparable interface that helps us handle what we call the natural ordering. And then we have the Comparator, which, of course, helps us to create more than one way to order data-- or to order a cloud data, in our case here.

So here, for example, we created a class called ComparePersonByName, and we made it implement the Comparator. And then, of course, if you implement the Comparator, you are actually implementing the compare method. So in this case, we implement the compare method. That compares couple of Persons. Here we wanted to compare the Persons by name, just as an example, OK?

So we can go ahead and maybe make use of an instance of this class, and try to pass it to the sort method, to be able to sort the list of persons by name. And here is the ComparisonPersonByName, which is a class that implements the Comparator, which ends up implementing the compare method. And now we can go ahead and pass the list to sort the list. And then, create a new instance of the ComparePersonByName, which implements the Comparator to sort that list by name. OK, that's pretty much how we have been doing this all the way into SE7.

So what we could do, also, is we can go ahead and instead of creating a class that implements the Comparator, we can go ahead and use the anonymous inner class, where we'll go ahead and pretty much create an instance of the comparator on the fly, and then pass that to the sort list. So this class new Comparator implements on the fly the compare method. And as you see here, we pass it. That's why you see, here, the parentheses. We passed that instance of the anonymous inner class inside of that comparator.

So this is how we did that in the past. Of course the idea is to be able to get rid of this complex type of code and somehow simplify it using the Lambda Expressions. So here's what we have done. Underneath the hood in our JVM SE 8, we now can go ahead and get rid of all that code that you see here-- so new Comparator, all of that-- and maybe keep only the parameters p1 and p2 that we are passing, and then return only the comparison between p1.getName() compared to p2.getName().

And then what we've done is we now can even do better by now introducing this row token that we see here. So now, on the left side of the row token, we have these parameters that we're passing. And on the right side, we have this body that is made of the comparison, here, of the two names.

Even better-- because in that interface we know that the type of p1 and p2 is Person, and the Comparator knows that by inference, why not then just pass the parameters p1 and p2 on the left side of the arrow, and then on the right side we have the body of the Lambda Expression. This is exactly a lambda expression, in this case, where on the left side we pass p1 and p2, and on the right side we return the comparison of the name of p1 and the name p2. Of course, in this case it would be either true or false.

So what we have been doing before is we've been using inner classes. So here's an example where I have an outer class. And this outer class has a private field-- message. And then, inside I have an inner class. This inner class-- here-- it has a print method inside. And if you take a look here, this inner class actually can have access to the private data of the outer class. This is actually one of the advantages of using inner classes inside Java.

So we can go ahead now, and have a main method. We'll create an instance of the outer class, and then we'll go ahead and call the print method. By the way, this print method that you see here will go ahead and print the message, and then create a new instance of the inner class, and then call the print of the inner class-- which, by the way, prints the message even though it's a private field in the outer class. Still, the inner class can access that.

I know some of the advantages of using it in your classes is localizing all the code in one area, in one class-- plus, in addition, having the inner class accessing the private data of the outer class. So we can go ahead and make use, also, of anonymous inner classes. Here's an example where I do call this method-- setOnAction. And then I'll go ahead and use anonymous inner class, and pass that to the setOnAction method.

So typically, when we use this type anonymous inner classes, we do have some drawbacks on this. And the drawbacks for this is that the problem is not vertical, OK? And also it's a tricky syntax, so you've got to be very careful how to actually make use of this anonymous inner class and pass that setOnAction method.

And then, of course, reusing the code is pretty much not possible. And, of course, when it's compiled, it always generates separate classes. The classes are always generated inside. So to solve this type of problem, we introduced the concept of Lambda Expressions. So we take a look here, where we'll go ahead and pass the parameter which is the action event. And then, of course, the body that happened to be printing this message that we have here.

And the Lambda Expression makes use of this row token, which we'll discuss in a couple of slides. So now, by using the Lambda Expression, we see that lots of problems that we had before now are solved. So now the vertical problem is solved. You know, it's really a clear and very clean type of syntax. And of course, it can be reused. This Lambda Expression can be saved as a variable, and we can go ahead and make use of it. We'll take a look at that later on.

So introducing this Lambda Expression-- which are really really a quite important, especially for if you're dealing with a tremendous amount of data and you want to improve the performance of your applications-- and of course the performance of your cloud services-- then definitely it's a very nice idea to implement your application or your cloud application using Lambda Expressions.

So a Lambda Expression, typically, is made of an argument list, and then the row token, and then the body of a Lambda expression. We see some examples about these Lambda expressions. For example, here we're passing a two integers-- x and y-- and then when we're adding them. Or here, we go ahead and pass in our x and y. And we call the println. That will print their sum.

Or-- even better-- we can go ahead and pass x and y as they are because, by inference, the compiler knows about the types of x and y. And then, of course, you have the row token. And then we have the body of the Lambda Expression. This is really a magic, where now we can take advantage of these interfaces-- and by the way, from now on, starting in Standard Edition 8, every time we see an interface that has one abstract method, we call that a functional interface.

So, here, this event handler is an interface. And the characteristics of this code here inside this interface is that it has one abstract method. And because it has one abstract method, from now on we'll call it a functional interface.

So a functional interface pretty much is an interface with a single abstract method. We call it the SAM Class. And this common type of pattern in Java-- they're very useful for graphical user interface listeners. Runnable is also another good example of functional interface, because it has one method called run, which is the abstract method that needs to be implemented. And Comparator, also, is another functional interface, because it has one abstract method, which is called a compareTo. And we could also take a look at Callable. Callable is also another function interface that has one abstract method called call.

Let's go ahead and take a look at a demo to introduce these Lambda Expressions. Here we do have a simple class called Lambda test, and it has a main method. First we'll go ahead and create a list of strings. This list of strings has a bunch of strings-- "tomorrow", "to-to", and "to", and "timbuktu", and "the", and "hello", and "heat". These are pretty much an array of strings called a string list-- in this case, 01.

And then we'll go ahead, and we do have a search string that has "to". And then, of course, what we want to do now is create-- in this case, we have the AnalyzerTool. This AnalyzerTool, as you see, it is a class that has a method-- showResult.

And then we have a StringAnalyzer. And StringAnalyzer is a functional interface that has one abstract method called analyze. Let's go back to our Lambda test. So here, we wanted to make use of the Lambda expressions. So in this case, we are going to create a new instance of the AnalyzerTool, which is this class here. And I already showed you it has a method called showResult that takes an array of strings, the search string, and then an instance of the analyzer. And we know that the analyzer-- the StringAnalyzer-- is actually a functional interface that we have here, OK?

So what we want to do now is-- and then, when we pass that, we'll go ahead and here we are using the old code-- the foreach loop that pretty much iterates, and then calls the analyze method. And then, of course, print the match.

In our case here, in the Lambda test, what we are going to do is we are going to call that showResult method. We pass the list of strings, the search string, and then we pass a Lambda Expression. The Lambda Expression here-- we pass as parameters a string t, and then a string s, and then we find out if t contains s, using the string method contains.

So this is one. And then the second one, we can go ahead and call the showResult. But this time we pass the Lambda Expression that allows us to check if the string t starts with s. And then, in the next one we just want to see if string t is equal to string s, all the Lambda Expressions. With the next one, we'll find out if string t ends with s. In the next one, we'll find out if I contains s, and the length is then five. And then the next one is if t contains s and the length is greater than five.

So you see how we can pass these Lambda Expressions to this showResults method without passing objects to it. Instead, we pass Lambda Expressions. So we can now pass code to code. That's the advantage that we have with Lambda Expressions. And we can go ahead and run it. And if we run it, it tells us as the output, here, that there are-- let me just go ahead and open this. So we searched on the one that contains "to", the ones that start with "to", and the ones that are equal "to", and the ones that end with "to"-- the ones that contain "to" and are less than five, and then the ones that contain "to" and greater than five characters as a size.

So this is just an example to introduce you to Lambda Expressions. Before, we could not do this. Before, we had to actually create a new instance of the AnalyzerTool and pass that as an instance of the AnalyzerTool. That's the only way we could do that. But as you see here, now we can go ahead and use Lambda Expressions, and we don't have to create those objects. We just pass the Lambda expressions to the ShowResult method. And, of course, it will do the job for us.

## 2. Lambda Expressions Case for Cloud Services - 19m

All right. Let's go ahead and make a case for Lambda Expressions for Cloud Services. Well, the issues that we had with imperative programming is that some of the issues that we have is that, we have the dry principle. The dry principle is do not repeat yourself.

You know, it's not [INAUDIBLE]. They know every method repeats a looping mechanism. And a method must be written for every selection criteria. And the code, of course, is difficult to maintain. We know if a selection criteria is changed, a number of changes in the code would be, of course, required to do. For example, changing drivers age would require update for every driver method if we have, for example, in this case examples of contacting drivers and so forth.

So we started making use of the interfaces. So an interface that performs a test and returns a Boolean would be represented this way. You know, for example, the interface is called MyTest. And it has a method called test, which checks an object T and then returns a Boolean.

So what we have done in the Java Standard Edition 8, we created a package, a whole package called java.util.function. And this contains interfaces with Lambda Expressions. [? So ?] we can go ahead and make use for Lambda Expressions. And of course, Lambda Expressions have a type. And there are all kind of, in this case, function interfaces that will be located inside the java.util.function.

And we said that function interfaces are interfaces that contain one abstract method. One of them as example is the predicate.java. So this a predicate interface is located under the package java.util.function. And it's pretty much an interface that has one, in this case, abstract method, that needs to be implemented called a test, which takes an object T and return a Boolean.

So we can go ahead and, of course, in this case, look at how we can replace the anonymous inner class with the Lambda Expression. So here's an example where let's assume that we call, in this case, a method called mailContacts, you know, which is called through an instance called robo. And this will take a list of the persons, and of course, a new instance of the anonymous inner class Predicate. Well that of course, implements, in this case, the test, which returns, in this case, all the persons that have the age between 23 and 65. Those will be, in this case, contacted through mail.

So what we have done is we got rid of all of this. And we replaced that with the Lambda Expressions, where we can go ahead now and have the method mailContacts that you see here, text the list of the persons. And then text the Lambda Expression, which is for every person, we'll go ahead and check if the age of the person is between 23 and 65. That's the idea of replacing an anonymous inner class with a Lambda Expression.

So finally, what we have done is pretty much we replaced, in this case, we could have gotten a class called Pilots that implements the Predicate, which implements in this case the test method. So we took care of all the replacement of all of this with what? With one, in this case, a Lambda Expression. See how the code is way, way, way streamlined compared to the way we actually implemented before.

Of course, we want to somehow compare the Lambda Expressions to, in this case, the imperative program that we use to do. So for example here, just by comparing, in this case, the Lambda Expression to, in this case, the class Pilots that implements the Predicate interface, we now, we see that both Lambada Expression and our class that implements the interface, both of them have parameters.

So the Lambda Expression has this parameter. Of course, in this case, the parameter that we are passing, in this case, would be this p of type Person. If we take a look here, we didn't even put the type of p here, because the compiler knows that by inference. And then of course, both of them have body. In this case, they both have a body.

And the Lambda Expression has this body, and then which by the way, in this case, the class that implements the interface has this body that you see here. So and if you take a look, you see the difference between the two. Obviously, this is way, way streamlined. Plus in addition, you know, it's short. And also it's very effective.

So to recap, you know, about the concept of Lambda Expressions, Lambda Expressions have a type, which is the target typing. And Lambda Expressions can be saved as a variables, inside variables. And so we can reuse them. That's why we can promote reuse. They're very easy to maintain, and there's way, way less code to write.

And we do have a building a functional interfaces that we added. In the Standard Edition, you can find that in the API on the web. And they're all under the package java.util.function.

So and let's go ahead and just kind of follow what we added also as features inside of Java SE 8 that could be very, very useful. And so we do know from Java concepts that any class that implements an interface can be referenced by that interface itself. So and here is an example where, for example here, we do have a class called CrushedRock. And that this CrushedRock will implement an interface called a calc, in this case, SalesCalcs.

And this SalesCalcs has the method that calcSalesPrice, the method that can be referenced by the CrushedRock or the SalesCalcs that the interface which is implemented by the class CrushedRock. So we can go ahead and use a reference rock1, which is of type a CrushedRock when we go ahead and create a new instance of the CrushedRock. Or we can go ahead and make use of rock2, which is in this case, of type SalesCalcs, which by the way, is the interface that is implemented by the class CrushedRock.

And then of course, inside we'll do a println. And we'll go ahead and call the calcSalesPrice on the rock, on rock1. And also we do the same thing on rock2. And if you take a look at both, you will see that the output would be exactly the same. Why? Because in this case, we can have a class could be referenced by the interface that is implemented by that interface itself.

So the idea behind this is pretty much taking advantage of these interface reference. And so any class implementing an interface can be referenced by that interface. And we take a look here for example, we can create a list in this case, an array of SalesCalcs. And we'll initialize it with an array of SalesCalcs of size 5. And then we go ahead and create an instance of the report, a class in this code called ItemReport.

And then what do we do is, we can go ahead and initialize the item list, which is of type SalesCalcs with instances of CrushedRock, just because the CrushedRock implements the interface SalesCalcs. And also RedPaint, and Widgets, because these classes also implement the forEach interface. And then we can go ahead and use, in this case, a forEach loop to iterate through all of them and print of course these items.

So following the interface code flexibility, a utility clause that references the interface can process an implementing class. So here's an example where in my ItemReport class that we've seen earlier, in this case where we create an instance of it, now we see it here. Where this actually ItemReport class has a printItemData, a method that takes instances of SalesCalcs, and of course, print the information of that item, where we get the name, and the price, and in this case, calculate the cost, and of course, and the profit, that's one, and print the profit.

So what we could do, we can go ahead and earlier what we have done is pretty much we created this ItemReport, an instance of ItemReport. And then we used it to call the printItemData to pass those items, which could CrushedRocks or RedPaint, or Widgets, you know, and of course, iterate through them, and print that information.

Now, what we have done in Java SE 8 is instead of creating a separate class that has this printItemData, a method, and we make use of an instance of it to be able to, in this case, the print the information of all the items, what we did is in Java SE 8, we added one nice feature that is very, very useful. We added what we call a default methods. This is a new feature in SE 8.

And so for example, here we have an interface SalesCalcs. And then in the interface, we can now add a default method. Here's a default method. It's an implemented method called printItemReport. And we put just the keyword default in front of it. And these default methods are already declared by using the keyword in this case default.

And they are fully implemented methods within the interface. And pretty much allow us to provide useful inheritance mechanism, where all the classes that implement the interface can actually make use of this method. So instead of using that class before ItemReport, now we can go ahead and use directly this default method, as simple as that.

So here is an example where we can make use of that default method that we created here. So now we go back to the example that we've seen earlier in the previous slides. We have now an array of SalesCalcs of size 5. We go ahead and initialize this array with references to CrushedRock, and RedPaint, and Widgets. And then now to print the information, instead of calling the class that we, instance of the class that we created before, which is the ItemReport, we can go ahead and take advantage of the default method that we created here and use it. And this is exactly what we see here.

So you see now that we use the forEach loop. And then instead, we'll just go ahead and call the default method printItemReport that we implemented. And that you know of course, avoid creating instances of that itemReport class to of course, print the information. So this a useful addition to the Java SE 8, which is default methods, turned out to be really, really quite interesting, and quite helpful, and of course, quite efficient.

In addition to the default method that we added, we also added you know the in addition to the default method that we added to the SE 8, we also added the static methods. So Java SE 8 now allow you to add static methods to an interface. So it is possible to create helper method. And this is pretty much how it's done.

So here's an example where, in this case, we have our interface SalesCalcs. But instead, now instead of creating the default method, now we create a, in this case, a static method printItemArray. And of course, that will go ahead and print, in this case, the information about the items-- report title, you know, iterate through the items, print their name, their price, their cost, profit you know, and so forth.

And we can go ahead and call this static method through the class, in this case, through the interface name. So you know this is a very, very convenient feature. And now, you can include a helper method like what you've seen in the static method or a default method in an interface, instead of a separate class. That's the idea. Instead of separate class, that's very important.

You know, when you create separate class, you'll always have to create instances of that class to be able to run it. And that's, of course, those instances have to be garbage collected, which we avoid all the headaches of garbage collecting because that can affect the performance of your cloud services applications. So and you can go ahead and call, like I said, you can call now the static method just through the name of the interface.

So it turns out that the Lambda Expressions, you know, and the default methods, and the static methods actually are a big plus. Because now, we can avoid creating all these objects in the heap that need to be garbage collected at some point in time. So we avoid all that headaches, you know, all that time of the cleaning up all that heap.

That is a huge, huge plus in terms of performance. Now when we are working with cloud services, and we're building cloud services making use of Lambda Expressions, and different methods like this, and static methods can be very, very helpful in building a very, very efficient performant, robust cloud services.

Let's go ahead and take an example. Let's go ahead and look at an example about the Lambda, the case of Lambda Expressions. Here, we are looking first of all, we have a class, in this case, called a Sales Transaction. Turns out that this has a bunch of fields, transaction ID, sales person, a buyer, product, payment type, unit price, unit count, a transaction date, city, state, and code.

And in this case, a class, what we do is we use a builder in a class, a builder pattern, following the builder pattern in our class that helps us build, in this case, a transaction or sales transactions. So it has this, it has different methods, the builder pattern, a pattern has different methods. And of course, here we do have a constructor, as you see here, the sessions [INAUDIBLE] private, which takes instance of the builder that allows us to build that.

And here are some getters methods that we have for the Sales Transaction. And then of course, we do have a Print method here, that allows a printSummary, that does the print. And then get a summary strings also that returns a string. And then we have the toString implemented.

And then down here, we do make use of a static method called createTransactionList. And that's the one that uses the builder pattern to actually build, in this case, this Sales Transactions. So the first one, Jane Doe, and the buyer, and Acme, the product widget, so on so forth. So we create a few of them.

And then we're going to take advantage of the Lambda Expression. We're more interested by the Lambda Expression. Where here, first of all, we'll go ahead and call the create a transaction list as a static method on the Sales Transaction class to create a list of, in this case, of sales transactions. And then we'll go ahead and get that list and use the forEach method. So we do actually have a forEach method that was implemented through the collections.

And this will take, in this case, a transaction for every transaction, it'll call the printSummary method that we've seen in the Sales Transaction to print that information. And so and this will go ahead and pretty much print all the list. This is how we do it if we were to use, in this case, a Lambda Expression that calls the println and gets, in this case, for every transaction, get the transaction ID, and the seller name, and the buyer name in this case, and the total transaction amount.

If you right click on this and run it, this is pretty much what you get as an output. We get, in this case, the list. So we do it using the printSummary. This is using just the simple printSummary that we've seen in that, which is this one here. This one here. And then the second one is using, in this case, Lambda Expression that uses the println and prints all of those.

And as you see here, the second one would be this one here. And so we show us how actually we can now write a simple short code, as you see here, and pretty much iterates through the whole list, and you know, pretty much, operate on that list and do whatever we want. Here, we're just printing, in this case, the information about the list of the sales transaction. Thank you.

## 3. Lambda Functional Interfaces for Cloud Services - 22m

Let's go ahead now and get into some building lambda types, which help us build robust performant cloud services. And pretty much, why not jump into cool collection stuff, where now, we're going to use the lambda the expressions, which rely, by the way, on functional interfaces. So it's important to understand what an interface does. An interface has some abstract methods that can be, of course, implemented. Those abstract methods can be implemented.

And lambda expressions make use of those. So we're going to focus on the purpose of the function interfaces and be aware of many, many of these that are part of the API. Plus in addition, we'll go ahead and look at some of the primitive versions of them.

So lambda expressions have properties like a variable. We can go ahead and save a lambda expression to a variable and use it any way we want. We can store it or use it anywhere we want.

And the focus is on the Java interfaces. Of course, we know that Java interfaces are used to define abstract types. They're kind of similar to abstract classes. But they contain, of course, public abstract methods.

And of course, methods must not have an implementation in this case between the curly braces. And they can contain constant fields. And they can also be used as references to classes that implements those interfaces.

The focus, of course, for us here is the function interfaces, because the function interfaces are the ones that do actually have single abstract methods. And they're the ones that lambda expressions can use. We can see them in the graphical user interface.

We can see them-- Runnable is one example of the function interface, because it has one abstract method it could run. Comparator also is another one that has the compare to method, abstract method. Callable also is another abstract interface that has the call method which is abstract.

So what we are going to do is we're going to look at, in this case, the java.util.function package, which we added, by the way. And you can go ahead and find these in the API. So these are all pretty much in the API package that contains the function interfaces.

We're not going to see all of them. But we're going to see just a few of them to give you an idea. But you can go ahead and pretty much click on any one of them and understand the definition.

For example, we're going to start on Predicate, just go ahead and click on Predicate. See the definition, and go ahead and make use of it in your lambda expressions. So that's pretty much then. So we do have ones. And then we have also primitive versions in this package.

And of course, the idea behind this is to be able to now make use of-- so we're going to make use of the Predicate, which is an expression that returns a Boolean; Consumer, which is an expression that performs an operation on an object as an argument and has a void as return type.

And then we have, in this case, the function interface. So pretty much, we're going to look at the Predicate. We're going to look at the consumer.

We're going to look at the function interface, which transforms an object T into to a U. We will have a Supplier, which provides an instance of T, such a factory. And then we see some primitive variations of these and some binary variations of these too.

So let's start with the Predicate. So the Predicate is part of the package java.util.function. It's an interface that has one abstract method called test, which takes an object T and returns a Boolean. And here's an example of how to make use of it.

So for example, here, we went ahead and we created a variable called massSales. And it's of type Predicate of the generic type Sales Transaction. And this is pretty much we save in it this lambda expression that you see here, which for every transaction, we get the state of the transaction and compare it if it's the state of Massachusetts, as an example.

And as you see here, we'll go ahead and take-- so first of all, we'll go ahead and create a List of the Sales Transactions. And then now, we're going to invoke a method called stream. This stream method, what it does, it converts the List into streams, into a pipeline of data.

Then we invoke the filter method on it and pass to it this massSales, a variable, which represents this, in this case, a lambda expression, which pretty much, in this case, selects all the Sales Transactions that, of course, are from the state of Massachusetts. And then for every one of them, we'll go ahead and print a summary by using the for each method.

Here, we're using the chaining method-- so method chaining, the concept of method chaining-- by having the List, invoking the .stream on it to convert into a stream. And then after that, invoking .filter to filter and then filter out. And if you want, in this case, the Sales Transactions that are not in the state of Massachusetts and keep the ones that are part of the state of Massachusetts. And then use the for each, in this case, for if you want them to print a summary.

We could have done it the old way by just using the forEach loop iterate through it, and then call the test method, and then call the printSummary. But as you see here, this is the way to actually write it using the lambda expression.

The next function interface that we would like to look at is the Consumer. Consumer has an abstract method called accept, which takes an object T and returns void. Let's take a look at an example of how to do that.

So here's an example where, in this case, we declare a variable called buyerConsumer, which is of type Consumer a Sales Transaction as a generic. And this will be equal to this lambda expression that we have here, which for every transaction, we'll go ahead and print the transaction Id and the Buyer name, as an example.

And then what we do is we take a list, in this case, of a transaction of the Sales Transactions, convert it into a stream by invoking the stream method on it, and then use the for each to actually, in this case, print the transaction Id and the Buyer name.

We could have, by the way, use it using the, in this case, accept method, if we wanted. Here, we, for example, used the accept method for the first transaction of the List as an example.

The next interface or function or interface is the Function interface. This Function interface works with two objects, takes two objects. So it pretty much has an abstract method called apply. This apply takes in object T and somehow transform that into an object R, returns a object R.

Here's an example. So here, what we do is, we'll go ahead and declare a buyerFunction variable of type Function interface that uses a Sales Transaction in a String. And then we'll go ahead and set this variable to this lambda expression that says, for every Sales Transaction, we'll go ahead and return the Buyer Name, which means, we take an instance of the Sales Transaction and return a String.

That's what we're doing. We could have done this using the apply method. And we apply it to the first element of the List, as an example.

The next example that we would like to look part of the function interfaces is a function interface called Supplier. This function Supplier takes a nothing-- as you see here, it has a get method that takes nothing-- and return an object T. Let's see an example. So with this supplier, we can play the role of a factory. That's what it is.

So here's an example where, in this case, we'll go ahead and create a List of transactions calling the create Transaction List, which is a static method, calling it through the name of the class. And then here, we declared a transaction Supplier a variable of type Supplier of type Sales Transaction. And as you see here, it takes nothing. So you see, it takes no parameters-- open parenthesis, closed parenthesis-- and returns an instance, a new instance, using the Builder pattern, a new instance of a Sales Transaction by specifying the transaction Id, the Person "John Adams", of course, the product,

The Buyer, in this case, would be "PriceCo". The product is "Widget". The payment is "Cash". The unit is 20. And, of course, click the build and build all of that.

And then once we've got that, we'll go ahead now and invoke the get method on it to get the instance that we built and then add it to the list. And then we can go ahead and use the List to invoke the stream on it to convert it into a stream, and then invoke the forEach to go ahead and print, in this case, the summary, in this case, of those transactions, Sales Transactions. Here, we are using the colon colon, which is another way to, actually, reference methods.

Here are some primitive, in this case, interfaces. So primitive versions are useful, because they make use of primitives-- example, the ToDoubleFunction or the DoubleFunction, and so forth. So in general, we advise you to use primitives rather than wrapper classes simply to avoid the auto-boxing and the unboxing, which is, by the way, in this case, very, very costly.

Here's an example of a primitive type of a function interface. This is called a DoubleFunction. This takes an object R, in this case-- rather, a double value, takes a value, and returns a R. So the DoubleFunction is returning an object R.

So here, I do have an Apply a method, which is an abstract that takes a double as a value in this case, or as a variable, and returns an object R. And let's see an example about that.

So here's an example about, in this case, DoubleFunction. So we'll go ahead now and create a reference variable, in this case, or a variable of type DoubleFunction of type String, and then assign that to, in this case, a lambda expression that, in this case, takes a value t and then uses t times 3, and then pass that to the valueOf a method of the String class.

The valueOf takes a double-- in this case, this one here-- and returns, of course, a String. So we can go ahead then, for example, apply it for 20. So this will take 20 as a value t.

So the 20 times 3, that's, of course, in this case 60. And then, of course, apply the apply. And that returns, of course, the result in the form of string, which happens to be, in this case, 3 times 20, which is 60.

Another example of a binary type of function interfaces, that's called the BiPredicate. What the BiPredicate does here, it has, in this case, an abstract function that takes an object T, an object U, and then test them, and then somehow return a Boolean, as an example.

So let's go ahead and take a look at an example about that. So here, we'll go ahead and create a List of a Sales Transactions. And we get the first element, in this case, of the List. And then we set the String testState to CA for California.

And then here, we'll go ahead and create, in this case, a variable called state Bi Predicate of type Predicate, but takes, of course, a Sales and a String. And for, in this case, of this Sales Transaction and String, we'll go ahead and get the state of, in this case, the Sales Transaction and try to find out if it's the state of California. An example here, we're just trying to test if the first element of the List, actually the state would happen to be state of California.

We can make use of a UnaryOperator. So if you need to pass in something and return the same type, we can use a UnaryOperator. Here's an example, where, in this case, we use a String of type UnaryOperator of type String.

And then, we, of course, assign to it this lambda expressions, which says, for every s, string, go ahead and convert that into an UpperCase. Here's an example, where you can go ahead and get the first name-- the name of the first, in this case, transaction list, and then when invoke the apply to it, to convert that into an UpperCase String.

Let's go out now and take a look at a demo about these function interfaces. So we start, of course, with the Sales Transaction class, which we know it's built using the Builder pattern, is a Builder class inside. And we'll go ahead and build a list of that.

It actually has, in this case, a create Transaction List static method that allows us to create a list of these a Sales Transactions, using the Builder pattern. And let's go ahead and, in this case, use the example of Predicate. So here, first of all, we get a list of in this class called, in this case, Predicate, A01 Predicate.

It has a main method. So we'll go ahead and get a list of the Sales Transaction by calling the create Transaction List. And then we'll go ahead and declare a variable massSales. And we assign to it the lambda expression .test if the Sales Transaction is actually from the state of Massachusetts.

And then we take that list and invoke the stream and then pass to it this lambda expression, which, by the way, we'll go ahead and print the summary on all those. And we can do the same thing here using the forEach loop-- we do it the old way. If you run this, then you see that we can go ahead and, using the lambda expression, print pretty much does the same job like we'd use the forEach loop and print, in this case, the Sales Transaction that are from the state of Massachusetts.

Let's see another example, which is, in this case, the function interface. So in the function interface also, we do have this class called Function, which, by the way, does the same thing, create a List of the Sales Transaction and get the first element from the List. We declare, in this case, a buyerFunction variable of type Function that takes Sales Transaction in a String.

And then for every transaction, we get the Name, which means takes an instance of the Sales Transaction and returns the name, which is a String. And we'll go ahead and apply that to the first element. If you Right Click on this and Run it, it will print, in this case, the Buyer of the first element of the List, which happened to be Acme Electronics.

Let's see an example now of, in this case, a Consumer. So same thing, in this case, we have a class called A02Consumer. It has a main method. We'll go ahead and create a List and get the first element.

Here, we are going to declare a variable of type Consumer of type Sales Transaction. And it takes the Sales Transaction and, of course, called a method to print the Id of the transaction and the Name. We can go ahead and use the forEach, and, in this case, convert the List into stream and call the forEach and pass to it the buyerConsumer variable that represents that lambda expression that prints the Id and the Buyer name.

We can also here use it to print the Id and the Buyer name of the first element of the List. Let's go ahead and Run this. And that's pretty much what it gives us and gives us the list of all of them and then the one where we just print the Id and the Buyer of the first element of the List.

Let's see an example now about the Supplier. So here, in the Supplier example, we pretty much, in this case, get the List and then declare a variable transaction Supplier of type Supplier of type Sales Transaction. And then as you see, it takes nothing, but creates a new instance of a Buyer.

Then we get that instance of that Buyer from the Sales Transaction Supplier and add it to the List. And then after that, use the List wanted to convert into a stream, and then the forEach and print. Here, we are using a reference method to print the summary of every one of them.

So the one that we added is "John Adams". And the Buyer is "PriceCo", "Widget", and so forth. If you Right Click on and Run it, we'll see that that's exactly what we did. So you see, the whole list. And then this is the last one that we created and we added to the List. And as you see, here is part of the List.

And let's see an example about a DoubleFunction, which is, in this case, the primitive version of those function interfaces. Here, we go ahead and declare a variable calc that takes a value t, and then times it to 3, and then uses the value of that, converts that double into, of course, a String. So we can go ahead and apply it here for 20. And if we Right Click here and Run it, it's going to print the string 60.

And let's go ahead now and look at an example of the Unary, in this case, a function interface. Same here, we get a List of the Sales Transactions and the first element. We'll go ahead and declare a Unary string that takes a String and convert it into a UpperCase.

And what we do here is we're going to apply this to the first, in this case, a Buyer. So the first element in the List has the Buyer called Acme Electronics. We should be able to see the Acme Electronics in uppercase, just because we are applying the toUpperCase method.

So let's go ahead and Run this. And that's exactly what we get, in this case, Acme Electronics in uppercase. Thank you.

## 4. Lambda Operations for Cloud Services - 24m

Let's go ahead now and take a look at trying to investigate some of the operations with Lambda Expressions for Cloud Services in this session. So we still know that we make use of the Stream API, which is part of the package java.util.stream, which is nothing but a sequence of elements on which various methods can be chained.

And of course, the Stream class converts that collection to a pipeline of data. Now, this data is typically immutable. And it also can only be used only once. And we can apply method chaining to that. And of course, to look at all these methods, we advise you in that take a look at the Java API. We say that the Java API here is your friend. And just look at the package, and you will see all of them.

And of course, the different classes that I have. You can have, for example, a primitive version part of them, DoubleStream, InStream, LongStream, and so forth.

So some type of the operations that we can use. Some of the intermediate operations are filter. We've seen filter. There's also another method called map that we can use. We can also use peek.

Some of the terminal operations are like forEach. We've seen forEach. There are other methods like a count, a sum, average, a min, a max, a collect. We'll see a collect later on.

There are some also terminal short-circuit type of operations, like a findFirst, which typically finds the first element. Or findAny, or anyMatch, or allMatch, or noneMatch, and so forth. These are called a short-circuit type of terminal operations.

Let's take look at the map. As you see here, the map takes a couple of objects, a T or a super class of a T type of function. And then the same thing here, A and R, or any extended class of R as a mapper.

So a map takes one function as an argument, and a function takes one generic and returns something else. So we can also, by the way, have a primitive version of them which is mapToInt, mapToLong, mapToDouble, and so forth.

We also have the peek. And a peek, of course, is in case take an instance of a consumer or a super class of that. So the peek method, what it does, basically it performs the operation specified by the Lambda Expression and returns the element to the stream. So it's great, really, for handling intermediate operations. For example, printing intermediate results, as an example.

Other methods that are typically search methods. And these search methods are the findFirst, which pretty much returns the first element that meets the specified criteria. We have the allMatch, which returns true if all the elements meet the criteria. We have the noneMatch, which returns true if none of the element meet the criteria. And of course, all of these above methods that we've seen are what we call short-circuit terminal operations.

So in the search methods, some are non-deterministic methods. And for the non-deterministic, the effect, it affect situations where parallel are more effective. So in a sense, if they are non-deterministic, then the results may vary between invocations, between executions.

A couple of examples of this non-deterministic search method. findAny. What findAny does, it returns the first element found that meets the specified criteria. And as you see, the results may vary from one-- in this case, a parallel execution to another one. And that's due to the fact when we run it in parallel, multi-threads are running and threads never run the same way.

It all depends on the-- and anyMatch-- that's also another one which is a non-deterministic-- this returns true if any elements meet the criteria. The same thing. Results here may vary when performed in parallel.

One interesting class that can be used is the optional class. This optional is pretty much a container object that may or may not contain a non-null value. If a value is present, then we can make use of the isPresent, a method that will return true. And of course, for example, we can use also the get method to return the value. It's typically found in the java.util package.

There are, by the way, primitive versions of it. And the primitive versions of it are the optionalDouble, the optionalInt, the optionalLong. These are as example the optional primitives version of this optional class.

Some of the stream data methods are, for example, the count. What the count does in this case, it returns the count of the elements in the stream. We also have the max. And the max typically returns the maximum element of the stream according to the comparator that you are passing in this case to the max. And you have also the min, which pretty much returns the minimum element of the stream according to the provided comparator that you are passing to the min method.

Another method is the average. The average pretty much allows us to perform calculations. It returns in Optional describing the arithmetic mean of the elements in the stream. It returns again an empty Optional if the stream is empty. And of course, the time return depends on the primitive class.

You also have the sum. This returns the sum of the elements in the stream. And of course, there are also primitive versions of that, where you can use DoubleStream or InStream or LongStream. That typically the methods that actually where the sum can be useful to add a bunch of doubles or integers or long integers, and so forth.

Some of the methods or the functions that can be used for sorting. We have the sorted. This pretty much returns a stream consisting of the elements, but this time they're sorting to what we call the natural order, which means the sorted actually makes use of the comparable interface. And we also have sorted that takes an instance of a comparator. This returns a stream of the elements sorted according to the comparators that you are passing to the sorted method.

Let's take a look a little bit at the comparators. Actually there are a couple of methods that are very useful. One is the comparing, a method. Or the comparing function. This allows you to specify any field to sort on based on a method reference or lambda. And you also have primitive versions of it.

And you have the thenComparing. This pretty much specify additional field for sorting. You also have the reversed, and this reverse the sort order by appending to the method chain. So it all depends. If it was, suppose, in ascending, it becomes descending. It if was descend, it becomes ascending, and so forth.

Let's take a look a little bit and see these higher order type of functions for using comparing. Let's assume that here we're sorting a list based on this lambda expression that we're passing, which is again in this case based on comparing the names of the persons.

So we can go ahead, and instead using the comparing method. So use the comparator. Use the comparing method. And that will compare, in this case, the objects by name.

And here's a two-level type of sorting. Let's assume that we want to do a sorting. This pretty much the old way, where we use the sort method and we pass a new instance of the comparator. And of course, in this case what we wanted to do is we wanted to do a comparison by looking at-- create a new instance of the comparator, and then using the compare method to, in this case, compare the persons by name-- rather by age first.

And then after that, return that comparison by, in this case, additional comparisons which is by name. So if you take a look here, you will see that first of all we pass a new instance of that comparator where we use the compare method to, in this case, use the compareTo method that compares the ages of the persons. And then we add another comparison, which is comparing the persons by name.

So here, what we are doing is pretty much trying to make use of a first comparator to compare the persons by age. That's actually what we have done here. And then the second one is use a second comparator to compare the persons by, in this case, name. And that's what we see in the second one that we have seen here.

So taking a look at, in this case, the two-level sorting. So we can create a new comparator by sorting first with the first comparator, and then we combine that with the second comparator. And that's exactly what we've done here, where we did the first comparison comparing these persons by age. And then after that, we used the second one by comparing the persons by name.

So what we could do in this case is we can use the chain method to actually handle that. So we can use, in this case, in the sort we pass comparator.comparing. And of course, here we make use of the age. And then after that use the dot-- the method chaining-- then comparing. And then, of course, in this case use the getName to compare them by name.

So as you see here, this is obviously way, way more compacted where we can use comparing. And then we can comparing to handle the first comparator. And then we can combine that with the second comparator by using the thenComparing.

So if we combine this, it would look something like this. For example, here. Sort. A comparing. And then we pass the getAge. And then the thenComparing using the getName. But we're using here the comparing and the thenComparing. With a static import, we can also write this this way too, pretty much.

So if you want to do now a comparison of the old way versus the new way. So you see the old way represents all of this, where we pretty much write everything using anonymous inner class, and do the comparing by age and then by name. Or we can go ahead and just now write it compactly, where we use the comparing method and then the thenComparing.

So use the comparing here, and then the thenComparing by specifying the getAge in order to do the first comparison, and the second age to combine it with the getName, and we're good to go. So obviously this is way, way compacting and way, way better.

Sometimes when you perform any type of operation on a stream, you want to maybe save the data from that stream. Lots of times, that stream is performed or processed inside a multi-CPU type of machine, and you want to grab the final result and you want to save it in, for example, a data structure, in a collection.

So we now can make use of the method collect. That allows us to save the result of the stream in a new data structure. Pretty much relies on the Collectors class. That's the one that is being used.

So as an example, I can do a stream on a list, and then dot, and then collect, and then use the Collectors class, and call the toList to collect it into a list. Or maybe use the collect here and pass the Collectors toMap to collect that into a map, and so forth.

So looking at the Collectors class. So it has actually this type of method. It has the averagingDouble. This averagingDouble produces the arithmetic mean of a double valued function applied to the input elements.

It also has a groupingBy. The groupingBy operation, of course, on an input elements of type T. Grouping elements according to the classification function, and returning the result in a map. So pretty much based on whatever grouping function that you are using.

You also have a joining function or method part of the Collectors class. This concatenates the input elements into a string in, of course, an encounter order. So it takes elements of the stream and then form them, put them into, in this case, a form of string.

You also have partition and partitionBy, or partitioningBy. This again takes predicate. This partitions the input elements according to the predicate that you are passing.

Let's go ahead and take a look at a demo about these operations, lambda operations. Here, we are going to make use of a class called Employee, which is also built. This Employee class has fields representing given name, surname, age, gender, role, department. You know what department, where they work. Start date, salary, email, phone, address, city, state, and code.

And we use the builder pattern. We have an inner class called Builder, a static class in here, that pretty much help us build a list of employees. It has its own methods. And then, of course, the constructor of the employee. And then a bunch of, in this case-- here's a sort by salary method, and some getters methods of the Employee class.

A getSummary. A print method. printSummary. printLambda. A two string method is also overridden for this class. And then here is a class called createShortList of employees, which happens to be a static method. And we create an array list, and we use the Builder pattern to build, in this case, the list of these employees.

So let's take a look now at an example in this case about-- we know we'll start by looking at the example of a map test. So here, first of all, we'll go ahead and create a list of employees called eList by calling the createShortList method. We'll take that eList and convert it into a stream by calling the stream method on it, and then we filter.

Here, we're getting all the employees that are executives. And the second filter that specify that they are from the state of Colorado. And here, we use the map, in this case, to compute, in this case, their-- get their salary, their bonus. By getting the salary of the employee.

And then of course, we compute that bonus by, in this case, the role. And then we use the forEach to print the bonus paid for these employees. So this was done for the Colorado bonuses of the executives.

The second one, we want to, in this case, do the same thing, but this time for the engineering managers. So we'll go ahead and get the eList convert into a stream. And then do the couple of filters to get the managers that are engineers. And then use the Map method to compute the bonus. And then print that. So using the forEach.

If you run this, that's pretty much what we have here as a list. The Colorado bonus versus the engineering manager bonus.

Let's look now at an example of the peek. So for the peek, we have again in this case a class called a MapPeekTest. In the main method, we'll get a list. And then here from the list, we create a stream. Again, in this case what we're doing is we're getting the bonus of the executives from the state of Colorado.

But this time, we add a peek. This peek, what we do is we print an intermediate information of, in this case, the name of the employee and the surname. The given name and the surname. And then do a map to compute the bonus. And then the forEach to print that.

And we can see that here for-- we do it for the Colorado executives, and for the managers that are engineers. And if we right click this or Run it, that's what we get. So we get also in addition the print of the first name and the surname of the-- or the first name and the last name-- of these employees, the Colorado executives, and the engineers managers.

Let's look at another example, which is the findFirst. Here, what we are doing is we'll go ahead and in this case get a list. And then convert that into a stream. And then a filter, get all the executives from the state of Colorado and find the first one. And save it into this optional employee.

And then check if it's present. Go ahead and print it out. That's what we have here. If you right click and Run this, we get again, in this case, the first one. findFirst.

Now let's take a look at an example of anyMatch. Here, we got the same thing. We go ahead and create a list of employees. We apply the stream, and then we find any match. Any, in this case, employee from the state of Colorado.

And in this case, in the second one we'll go ahead and convert the list into a stream, do a peek to print a stream, and then do a filter to get all the executives from the state of Colorado, and find the first one. Now Run it, and pretty much that's what you get. So you have the stream that is print a few times in this case. And then of course we find the first one I printed out.

This an example about, in this case, the Optional class. So we have, in this case, a list of employees. And then we convert that into a stream, and we get all the executives from the state of Arizona. And find the first one. And then here with the flat map, that allow us to, again in this case, use the off method of the Optional to get the summary from there.

Else we say that it's not found. Let's find out if there are executives from the state of Arizona. As you see here, it's not found. So we don't have any executives from the state of Arizona.

Another example about stream data. Here in this example, we get a list. And then first we want to count the number of executives using the count. So get the list and convert into stream, and then filter get all the executives and count them.

Here, we want to, in this case, get a list. And filter, get all the executives and find the maximum salary and sort these by salary in this case. And so as an example. And then of course, here we just print in this case the name, given name, and salary of the employee, the highest one.

And here, we do a minimum where we compare, in this case, the employees by a salary and get the minimum, and then print the lowest staff salary. If I right click and Run this, so I'll get now the list of these executive count, which are three of them, the highest paid and the lowest paid.

Here's an example of the calcSum. But in this time, we want to get all the list of the executives from the state of Colorado, get their bonus, and sum all of these together. Here we do something similar, except that we do a filter of the executive of Colorado, do a peek to print all of them, and then a peek to print the bonus paid, and sum all of those together. If I right click and Run this, this is pretty much what we get here. The total, in this case, bonus.

And here's a last example. Well, in this case we get a list. Let's go ahead and look at the calcAverage example. And here, we're going to use the average method. So first of all, we get a list. We convert it into a stream. We look for all the executives from the state of Colorado. And of course, get the bonus salary, and look for the average of the bonus salary.

Pretty much here also we do the same thing, except that we use the peek inside just to print that information. If you right click on this and Run it, this pretty much gives us the average bonus in our case here. How many of each one of them got a bonus, and then the average of the bonuses. Thank you.

## 5. Lambda Collections Processing for Cloud Services - 15m

Let's go ahead now and take a look at Lambda Expressions for collections. You know, the idea here is to use collection of data, you know, of cloud services, and apply, in this case, Lambda Expressions to them, to course manipulate them any way we want.

So here's an example, where we do have a class here called RoboCallTest, as an example. It has a main method. And first, what we do is, we go ahead and create a list of persons. This pretty much creates a list. Here we say short list. Could be a huge list, it doesn't matter. And then what we want to do is we will go ahead in this case, and on the list. we'll use the forEach and then pass to it, in this case, this Lambda Expressions that says for every person go ahead and print the information about that person.

So in this second class called RoboCallTest07, what we want to do here, we'll go ahead and create a list of the person. And then we create an instance of this RoboCall05, in this case. And then what we do is, we take that list, in our case here, and first convert it to a stream, you know, a pipeline of data.

And then after that of course, by invoking the method chaining, you know, and then after that invoke the filter to get all of the persons that have the age between 23 and 65. And then what we do is, for each one of them, we go ahead and invoke a RoboCall on them, by for every person, you know, call the RoboCall, and pass that person to call every one of them, in this case, for those persons between 23 and 65.

And in this a class called RoboCallTest08, what we're going to do in this case, we'll go ahead and create a list of persons and then create an instance of RoboCall. And then what do we do here is we'll now decided to create or create a reference, a variable, in this case, called allPilots. That's a variable of type Predicate Person. And then of course, a assigned to it this Lambda Expressions. For every person get the person that has the age between 23 and 65, all those persons.

And then at the bottom here on the list, we'll invoke the stream to convert that into a stream. And then invoke the filter, and pass to it this is variable called allPilots that pretty much represents this Lambda Expressions here. And then invoke the forEach for all of them and, of course in this case, by invoking the roboCall called on every person who's between 23 and 65.

So we know about the builder pattern. The builder pattern allows object creation using method chaining, makes code easier to read, more flexible object creation, object returned itself, and of course, uses of the fluent approach. This is the one that we used to build the list of persons.

We make use of the builders, and then we'll go ahead and create, use the builder, which is an inner class inside the Person class that creates for example, in this case, persons that a given name Betty, surname, which is the last name Jones, the age, gender, email, phone, and so forth. And build that and add it to the list.

So we've been taking lists and invoking the stream method to convert that into streams. So it turns out, streams are part, by the way, of the package java.util.streams, which are new in SE 8, and pretty much a sequence of element on which various methods can be chained. That's what we've been doing.

And the multiple methods can be called in one statement. So the good thing about the streams is that they are immutable. Once elements are consumed, they are no longer available from the stream. And a chain of operations can occur only once on a particular stream or a pipeline of data, and of course, can be serial or can run also in parallel.

And the idea here is that we wanted to pretty much convert into the stream. And if we have, for example, a very powerful server that has multiple CPU hardware, you know, CP hardware, then, or hardware CPUs, or what we call multiple cores, or hardware cores, then we can go ahead and take advantage and pass the stream to the multi CPU to be processed all in parallel.

So we made use of the filter method. The stream class typically converts a collection to a pipeline, which is an immutable set of data. And can only be, by the way, used only once, and that's it, and then of course, tossed. And filter method use a Predicate lambda in order to select a syntax.

Here's an example for example, where in this case, I have a list. I'll go ahead and then use the stream to convert that into a stream, and then apply the filter. Here we wanted, for example, all the transactions that belong to the state of California, [INAUDIBLE] a transaction, make sure that the state of that transaction you know or sales transaction will be the state of California. And then after we do that, we'll go ahead and invoke the printSummary.

If we take a look here, this is a new type of command that we use which is the name of the class, Sales Transaction, and then ::, and then the PrintSummary, which happened to be a method that is actually part of the Sales Transaction class. That method, actually, is called now a method reference. So in some cases, the Lambda Expression merely calls a class. For example, for every transaction we call a printSummary.

So alternatively, what we can do is, we can use now what we call a method reference. And the way we call a method reference is this way, by using the name of the class:: and the printSummary. We can actually, by the way, use this method reference in many different situations. We can use it to reference as static method.

We can use it to reference an instance method. We can use it to reference an instance method to an arbitrary object of a particular type, for example string, call, compare, and so forth, compare to it, in our case. We can use, it by the way, to reference a constructor, example here, ClassName::new and then the name of the constructor. So this is something new in Java SE 8, where we call it the method reference.

And we know that the pipelines allow method chaining, like a builder pattern. So these methods include filter and many others. And here's an example where, for example, we have a list here. This list will go ahead and convert into a stream and then apply on it a filter, the first filter here that will go ahead and get all the sales transactions from the state of California.

And then we apply the dot next filter, which pretty much get us a name, in this case, of the name buyer, in this case of the filter, which has to be, in this case, Acme Electronics. And then so we wanted all the sales transaction, in this case, from the state of California and the buyer name would be Acme Electronics. For every one of them, for each one of them, we'll go ahead and call, in this case, the printSummary. And in our case here, we're making use of the methods reference that you see here.

So following this method chaining, we can go ahead and use compound logical statements, and we can select what is best for our situation. Here's an example where, for example, in this case, we got a list. And we'll go ahead and apply a stream on it. And then we apply the filter. But this filter here contains, in this case, the first predicate, which is every transaction state has to be the state of California and the buyer name of that a transaction needs to be Acme Electronics.

So we can put these two in [INAUDIBLE] can pass these pretty much with an [INAUDIBLE] to the filter method. And then for each one of them, call the printSummary. Or what we could do is, we can split these two into two filter methods, apply use the stream to actually, in this case, convert the list into a stream. And then apply the first filter, which basically chooses all the sales transaction from the state of California.

And then apply the second filter, and again method chaining, to get the buyer name that has to be equal to Acme Electronic. And for every one of the sales transaction from state of California and the buyer name is Acme Electronics, go ahead and call, in this case, the method reference to printSummary for every one of them.

So if we want to look at this pipeline and define that, we say that the stream pipeline consist of a source of data, 0 or more intermediate operations, and one terminal operation. Example, we have a source collection, could be a file could be stream, could be in any type of data, or it could be data coming from a database, and so forth. Immediate operations can be, for, example, filter or map, you know. And then a terminal operation could be 4. And of course, you can see more examples later on about when we look at a different type of a methods, like a map and so forth in the next session.

Let's go ahead now and take a look at a demo about the lambda collection processing. Here, we do have an example, first of all, a class called Person, which pretty much has a given name, an surname, an age, a gender, an email, a phone, an address, city, state, and code. And we use the builder pattern to build a list of these persons.

So here, we have an inner class builder that helps us build, in this case, instances of a person. And then of course, add them to a list. Here's the constructor, some getter methods of the Person class, print method, toString method, overridden. And of course, here is a createShortList that is a static method that help us create a list of persons.

And we make use of, in this case, the builder class to build instances of persons. So here are these persons that we built and add them to the list. Let's start with the first example, the example for that RoboCallTest06 that we looked as an example. Here, we'll go ahead and first create a list of persons. And then we use the forEach on that list and pass to it this Lambda Expression that prints the information about these persons.

So it calls System.out.println and pass the instance of the p. And because println takes the toString method, then it will return, in this case, and we did override the string method for the Person class. Then we'll go ahead and shows us how we print the information about this persons. If I right click and run this, this will give me the list of the persons that I have in the list. All right.

The second example that we want to look at is, it's in RoboCallTest07. This same thing, we'll go ahead and create a new instance of a person through the createShortList static method. And of course here, we're going to go ahead and create an instance of RoboCall05. This RoboCall05 is a class that we already have it, which is pretty much a class that has a method, a phone contacts, email contacts, mail contacts. and this is again, it has a roboCall, a roboEmail, and a roboMail.

So going back to our RoboCallTest07 that we have, so we create a new instance of that RoboCall called robo. And then here, we'll take the list that we created and we apply stream, a method on it, to convert that into a stream pipeline of data, and then invoke the method chaining here. Well, first of all, we invoke the filter and get all the persons that are between 23 and 65.

And then, of course, for each one of them, we'll do a roboCall. We call the roboCall method, which is pretty much this one here, that we have here. So if I right click on this and run it, and this get me the list of the persons between 23 and 65. And of course, we'll go ahead and we just put here a message calling Jane Doe, and John Doe, James Johnson, and Phil Smith.

And let's look at the last example, which is RoboCallTest08. Same thing here, we'll go ahead and create a new instance of a list of persons. And we pretty much call the createShortList static method to, in this case, pick that list for us, create an new instance of the RoboCall05.

Here what we do is, we take this Lambda Expression and which is looking for the person between 23 and 65 in age, and save that into the allPilots. And then after that, we'll go ahead and take the list, and convert into a stream, and then apply the filter by passing the allPilots variable, which represents this Lambda Expression that looks for the persons between 23 and 65.

Then we invoke the forEach method to actually call every person of that, in this case, between 23 and 65. So if you right click and run this, that of course, will get me the list of the persons that, in this case, that we're calling and of course, that have the age between 23 and 65.

## 6. Lambda Parallel Stream for Cloud Services - 21m

Let's go ahead and take a look now at Parallel Streams with Lambda for Cloud Services. Here, we want to take a look at the concept on how to use parallelism with streams. And the idea is to take advantage of the multicore hardware service that we have to, of course, process Cloud Services applications, which by the way achieve high performance.

So as an example, we saw the Unary example. And if you need to pass in something and return the same type, we use the UnaryOperator. Here's an example where, for example, we use the unary string variable of type UnaryOperator of type string. And then we save into this lambda expression, where for every string we convert to uppercase.

So we can go ahead and apply this to the first-- for example, the name of the first element of the list, which is the name of the buyer, which happens to be a string. And then this would be converted into an uppercase.

Just do a little bit of some reviews. Pipeline multiple stream, again, pretty much is a stream of data, multiple streams passing data along. Operations can be lazy. Lazy means like using short-circuit type of method, like findFirst. And we also can use intermediate, terminal, and short-circuit terminal operations.

And in terms of the characteristics of the streams, we said that they're immutable. And once elements are consumed, they are no longer available from streams. And of course, can be serial or it can be also parallel.

So here's the old style of a collection processing. So for example, here we get a list and we iterate through the list using the forEach method. And then we'll go ahead and use the if statement to compare. If the state is Colorado and the role is executives, and then we'll call the printSummary to print all of that.

And also, we can go ahead and get the salary and add all of that to sum. And then at the end, print, for example, the sum as an example. So this is the old way of coding.

The new way using the style collection processing is actually the way to go. So here, we take that eList and convert into a stream. And then invoke the filter method to actually get the, in this case, the employees from the state of Colorado. The second filter gets us all the employees that are executives.

And then we do a peek in this case, to print a summary for every employee who's an executive from the state of Colorado. And then do a mapToDouble to again get all the salaries in this case. And sum all of them, as an example. And then of course, at the end print the result.

So what are the advantages of, in this case, working with streams and the new lambda expressions? Code reads like a problem. It acts on the data set. Operations can be, of course, lazy. And the operations also can be serial or parallel.

So now comparing the two styles. The old imperative programming versus the stream type of a program using lambda expressions.

For the imperative programming, we said that the code deals with individual data items. It focus on how. The code does not read like a problem. We said that. And steps mashed together. And of course, leaks extraneous details. And inherently sequential.

On the other hand, for Streams, the code deals with a data set. It focuses on what. And code reads like a problem. Well-factored. And the good thing also which is very important to performance is no garbage variables or temp variables leaked into the scope. And of course, the code can be sequential or parallel.

So looking at parallel streams. The idea behind using parallel streams is to be able to take advantage of the multicore hardware machines. Or multi-hardware core machines. So it may provide, again, better performance. Many chips or cores per machines, or GPUs. Map/Reduce in the small.

And of course, it takes advantage of the fork/join algorithm, which was introduced in Java SE7. So it takes advantage of the fork/join algorithm. But this fork/join algorithm is too low level, and you have to code it. And it's a boilerplate of a code.

And the good thing about it is that Streams use the fork/join algorithm under the hood. You don't have to implement all of that. It's just by invoking the parallel method, and there you're good to go.

So of course, many factors affect performance. Data size, a decomposition, the packing, number of cores, so on and so forth. Unfortunately, not a magic bullet. So basically parallel is not always faster. Especially if you have one CPU in that CPU machine, then obviously it's useless in this case. You have to have really a powerful machine with many, many hardware core. In this case, CPUs.

And how do we now take advantage of this, in this case? We said the stream uses the fork/join algorithm under the hood. So there is nothing to actually do. We don't implement that.

So the good thing about it is by making use of methods like this one here. So in this case, we'll get a list. We invoke the .parallelStream on that list to convert that into a stream that is going to be, of course, a process in parallel. We do a filter in this case to get all the employees from a state of Colorado.

And then, of course, another filter to hand-- to get all the executives from this, of course, in this case, employee.executives. Do a peek just to print intermediate information about them. And then the mapToDouble to get the salary, and sum all of them.

So this, of course, potentially is going to run in parallel, especially if the list is huge. And just because we actually now made use of the parallel stream that we invoked. This is a method that we added to the Collection interface.

We can also, by the way, use another method which is part of the stream, and this is using parallel streams from the stream. So here, we have a list that we convert that into a stream. We apply our filters to get the executives from the state of Colorado. We do an intermediate printing using the peek. And then we do a mapToDouble to get the salary.

And then this time, we're going to run this in parallel. So we invoke the parallel here, which is part of the stream, in this case, interface. Which means the sum of the salaries now is going to be computed in parallel. So we can specify a .parallel or .sequential. If you don't specify anything, by default it's sequential. And the choice applies to the entire pipeline.

So looking at the fine print of these pipelines, stream pipelines are like builders. Add a bunch of intermediate operations, and then execute. Cannot branch or reuse pipeline. Do not modify the source during a query. And operation parameters must be stateless. Again, do not access any state that might change. This, of course, enable correct operations sequentially or in parallel. And of course, it is best to banish side effects completely.

One thing that we want to tell you and we want to emphasize when you are using parallelisms. Avoid statefulness, please. And let's see an example about this.

Here, we have a list of employees. And then here, we declare a couple of lists. A newList01, which is an array list. And then a newList02, which an array list. And then here, we take our list and we invoke the parallel stream. So hopefully to get that into a stream that we're running parallel.

We'll do a filter to get all the employees from the department of engineering. And then here, look what we do. And then we use the forEach. And then what we decided is to take every employee, and then add that employee to the list. That is a bad, really a bad way to actually-- so what we're doing is we're taking the intermediate type of employees and saving them into a data structure, which happened to be an array list.

So if you try to use this type of a methodology where you actually save the intermediate operations, in this case in newList, then of course we advise you not to do this because this does not parallelize at all. So that's a bad idea.

Of course, the question is how do we solve-- how do we get rid of the statefulness and apply statelessness? That's what we want. Well, here it is.

So here, pretty much we have an array list that we declared. A reference variable to an array list. And what we do is we have to do the whole computation first. So we'll go ahead and take a list and apply the parallel stream to convert that into a parallel stream. And then do our filtering. Get all the employees that are engineers.

And then now we can use of the collect method where we apply, in this case, the two list method of the Collector class where we convert this stream into a list, and then save that into the newList. What we're doing here is we're saving the final result of the stream into a list. That actually is excellent. That's what we call a good parallel way to do that. So the above one is definitely the preferable one, and it is designed to parallelize.

And in general, streams are indeterministic for the most part. So here's an example. We have a list. And we'll go ahead and apply a stream to a list. Convert, rather, the list into a stream. Do our filtering, getting all the employees from the state of Colorado. Get the salary. And then sum that in sequential.

We don't have to put sequential. In this case, we could have written just a .sum and that's good enough. We can do the same thing where in this case we convert the list into a stream, do our filtering to get at the employees from the state of Colorado, get their salary, and sum them. But this time, we want to sum them in parallel.

So because sum is deterministic, the sum method is deterministic, so if we execute this in sequential or in parallel the result is always the same. It doesn't matter. Because all what we're doing is summing all the salaries of the employees of the state of Colorado. So it doesn't matter which one we start with if we run that in parallel. That's what we call deterministic.

But we also have sometimes non-deterministic methods. Here's an example, where in this case we have a list. We convert that into a stream. And then we do a filter to get all the employees that are executives. And then here, we run that in sequential and findAny. findAny would be any one that you find, the first one.

And here, we do the same thing. Convert the list into a stream. And then get all the employees that are executives. Run this in parallel, and findAny. This actually is non-deterministic. Why? Because in this case, the result of this execution can be different from one execution to another one.

Now let's take a look at reduction. Reduction is an operation that takes a sequence of input elements and combine them into a single summary result by repeated application of a combining operation. For example, we can implement it using the reduce method.

Example of reduce method would be the sum. Sum is a reduction with the base value 0, and combining that function would be 0. And then adding the values a1, a2 to them. So the sum will be equivalent with the initial value 0, and then adding every element to it. So it looks something like this, with the sum, and then every time you add an element to it. This is how we write that in a lambda expression.

So if the combining function is associative, then reduction really parallelize very, very nicely. That's what we like about that. So associative means what? It means that the order does not, in this case, matter. So associative means what? It means that the order does not matter. The result is the same irrespective of the order used to combine the elements.

Examples of, in this case, functions that actually give us a very, very nice reduction. Sum, min, max, average, count, and so forth. And warning. If you pass a non-associative function to reduce, you will get the wrong answer. The function, again, must be associative. Otherwise it would not work.

So if you want to look underneath the hood and find how, actually, the pipeline is decomposed into sub-pipeline, every sub-pipeline produces subset. And subsets are combined at the end. So for example, if you do, in this case, a sum, and you want to run this in parallel, you see how it's divided into subsets. And then all the subsets are summed together. And at the end, all of them the results are combined together to get the final result.

So a little bit of discussion about the performance. Again, do not assume that parallel is always faster. You know, parallel not always the right solution. Sometimes parallel is actually slower than sequential.

So that's why you need to somehow, from the qualitative consideration, you need to ask these questions. Does the stream source decompose well? That's a good question. And do terminal operations have a cheap or expensive merge operations? That's a good one too.

And what are the stream characteristics? You know, filter change size there, example. And primitive streams, by the way, are provided for performance. Remember that. So avoid to use upper classes, because the boxing and auto unboxing negatively impact the performance.

And to, of course, finish with this. We typically say-- and take look just a simple performance model. Imagine you have a source of size N. Data set. And then let's assume that Q represents the cost per element through the pipeline. So N times Q represents the cost of the pipeline.

And we typically tell you that larger N times Q, which is again higher change for good parallelizing performance. So it's easier, again, to know N than Q. The number of data than Q, the cost.

So in general, we tell you that qualitatively when you look at it, let's assume that for Q equal 1, we tell you that if N is greater than 10K-- which is 10,000. So if the stream is bigger than 10,000, then in that case we'll have a good parallelism. And it will make sense to combine this or compute this in parallel because we can actually achieve performance with that.

So what we mean by that is the streams, or if you want the stream size, has to be bigger for us to take advantage of the parallelism of our hardware machines, using multi-core hardware CPUs to be able to take advantage of, in this case, the performance of that machine.

Let's go ahead and take a look at a demo about this parallelism stream, parallel streams. So we'll start with the class Employee, which we know that is built through the Builder pattern. We do have an inner static class Builder that helps us build this employee list.

So these are the methods of the Builder class. And then here, we go ahead and have the constructor of the employee. We have the sortBySalary. And we have some getters methods of the Employee class. And then, of course, we have the compareTo method, which is overridden. The print, print method, printSummary. A printLambda. And of course, a two string method overridden.

And here is the static method called createShortList. That gets me a list of employees. So here I'll go ahead and get this list called People, and then use it. Use the Add method, and then the Builder pattern to build, in this case, a list of employees.

Now, let's take a look at the example of the parallel, in this case, class. So here I have a class called A04Parallel. Has a main method. I get a list. And then I take that list and apply the parallel stream to convert that into a stream that is going to be computed in parallel. And do a filter, couple of filters, to get the employees that are executives from the state of Colorado.

Do a peek to print the summary for every one of them. Get the salary and sum that. This, again, because by default this will be sequential. In the second part here, we do that using the parallelism. So we convert the list into, in this case, a stream. Do the filtering to get the employees that are executives from the state of Colorado.

Do a peek to print a summary for each one of them. Get the salary, and sum all of them. But this time, we run it in parallel. And then we can do the same thing by applying the sequential here. But because the list is so small, there is not much difference in this case.

But if you run it, you will see that pretty much gets us the same, in this case, result. Where the sum is pretty much the same, and it doesn't matter if you run it sequentially or in parallel. That's what I mean by that. Because the sum is deterministic.

Here's an example of reduction. Well, in this case, we have a class called A08Reduction. And what do we do here is we'll go ahead and use an inStream. And we want to, in this case, run, or if you want, add these. Reduce this by adding 1 through 5. Run this in parallel.

And over here, I'll do the sum in this case. And then print out that. And then, of course, do the same thing here by using the sum. Pass that to the reduce, in this case, function. And run that in parallel.

And if we run this, pass to me that we get the same result here, obviously. Because in this case, we have both a reduce-- except that here we see user sum. And then at the end, we pretty much save all of this into R1 and R2 and print them out. Print the first one. Using the reduce.

And then here, we using the sum that we passed to the reduce. That, of course, will pretty much print the same thing, which is summing 1 through 5. We sum 1 through 5. It is 50. Thank you.

## 7. Skill Check: Utilize Lambda Expressions for Cloud Services - Score 80% or higher to pass

Skill Check: Utilize Lambda Expressions for Cloud Services

View Skill Check
