# 9: Lambda Built-in Functional Interfaces

1. Lambda Built-in Functional Interfaces - 26m
2. Practice 9-1: Create Consumer Lambda Expression - 3m
3. Practice 9-2: Create a Function Lambda Expression - 4m
4. Practice 9-3: Create a Supplier Lambda Expression - 5m
5. Practice 9-4: Create a BiPredicate Lambda Expression - 4m
6. Skill Check: Lambda Built-in Functional Interfaces - Score 80% or higher to pass

## 1. Lambda Built-in Functional Interfaces - 26m

All right. Excellent. In Lesson 9, we want to continue the discussion that we had, of course, in Lesson 8 on collections and using streams. Well, if you remember, in the stream we were able to take the elements of a collection and output them. And we basically used a lot of filters. And the filter took a predicate. Now, I wasn't using that term just to make it up, or as a different term for an argument. What I was mentioning was that I was identifying that there are certain built-in functions in lambda that allow us to work with various, well, arguments, if you will.

Now, the cool thing about a lambda, and what I'm hoping that we'll get out of this particular chapter, is that a lambda is, in essence, an extension of generics. Think about this. How many methods do you know of that pass one variable or pass two variables, and then return either void or they return a specific type? Every single one of those methods could be abstracted into a generic. And so there are certain built-in functions that come along with Java 8. They're delivered.

And in, for example, our filter method in the stream, we used a predicate. Now, a predicate is one of the built-in functions that are delivered. And it specifically returns a Boolean. So it either returns true or it returns false. Now, as you saw in the last chapter, we could have a single value that we're passing to the predicate. Or, in the previous chapter, we were passing two values to the predicate. But the idea was that the output was a Boolean.

Now, also in the last one-- I didn't mention it specifically-- but when we have a stream, when we get to the terminal operator-- in that case, we were working with individual people-- well, that was actually a consumer that was the last thing. So when we said for each, and then we had that argument that was passed that was, what, called the robo mail? Well, that was something called a consumer.

Now, the consumer's kind of interesting, because it takes a reference in-- in this case, a person-- and returned void, because, remember, we were just going to print it out. And the Print function didn't have a return value. And so that's the perfect example of a consumer function.

Well, there are two additional functions that we're going to talk about in this chapter besides the predicate and the consumer. There is a function function which takes a reference in. So a reference type is going to go in, but it returns a reference type. Now, usually, I pass in one reference and get out a different reference in return. But in some cases, you might pass in something, change it, and then return that same something type back out. So that would be a function.

Now, going back up to the predicate, which returns specifically a Boolean, because there's a lot of that. There's also this idea of a supplier. Now, in the supplier, it doesn't really matter what we pass in. But the supplier function is going to return a reference to something.

Now, in addition to talking about more specifically these functions, we're also going to talk about some primitive variance. So far, I've been talking about ref, ref, ref, ref, et cetera. That means a reference type. Well, what if I want, instead of a reference type, I want to output a primitive? Well, that's what these primitive variances are, is that it allows me to use these built-in functions, but specifically output a primitive. Why would I want to do that? Well, we talked a little bit about boxing and unboxing, auto boxing and auto unboxing. The problem is that when you do that, while it doesn't cost a lot, there is a small piece of efficiency that is lost because of the performance that goes into that. And so these primitive variances eliminate that casting.

And in some cases, we also have binary variance. Now binary, not as in binary code, but as in we're going to pass in two possibilities to these variants.

So this is what we're going to be talking about in Chapter 9. So let's go ahead, take a look at slides, and see what they have to tell us.

So we've already talked about in the objectives, we're going to list the built-in interfaces. And all of these interfaces are in the Java.util.function package. We're also going to talk about the primitive versions of base interfaces and the binary versions of base interfaces. Now, remember, we basically said that lambdas are built on top of functional interfaces, interfaces that have a single method. Well, these aren't any different. So let's go ahead, take a look.

So like I said, lambda expressions rely on functional interfaces, which is important to understand what an interface does. And remember, so when I implement an interface, I'm defining that there will be at least one method in the class for each method that is defined in the interface. Now, that does make the concept of a lambda easier to know that lambdas are built on functional interfaces.

So in this case, we want to focus on the purpose of main functional interfaces. Again, the idea is that I can use any method that as long as it meets the criteria of whatever I'm passing in or whatever I'm returning, I could just as easily use one of these functional interfaces to work with that.

So lambda expressions have properties like those of a variable. So you can use them when needed. They can be stored. They can be reused. And we've seen examples of that earlier in the class.

So this slide is the same thing that we looked at on the board. So we want to look at each one of these in turn.

So first of all, before we continue, if you look at the slide on page 269, it identifies that there are two declarations that we're going to assume that the other examples are following. If I'm working with a list or I'm working with a collection, I'm going to assume that it's a list of sales transactions, which we've called tlist. And we're going to generate this transaction list from some data source. If, however I want to work with a single sales transaction, we're going to assume that that sales transaction is the first one. So the first one in the collection.

All right. So with that in mind, this is the interface for a predicate. Notice that it's in the package we talked about. And notice that it is a generic. So in this case, my interface is going to take a certain type, which is going to be passed into a method called Test. Now, whatever Test does, the result of Test will always be a Boolean. So that's the idea of a predicate.

So in the previous example on the filter, we were passing in an age, or we were passing in a department, or whatever. And if that met the criteria of our filter, it returned either true or false if it didn't meet the criteria.

So for instance, if you recall, we had something similar to this in the practice where we created a predicate. We identified the type of object that was going to be held in the predicate-- in this case, a sales transaction. And we created an instance of it. And then, we defined the predicate. So in this case, we're going to pass this instance of sales transaction, retrieve its state, see if it equals Massachusetts, in this case. And if it does, it will return True. If it doesn't, it returns False. And we also saw that we could just as easily use that predicate instance in our filter method, as we are here on line 21.

Now, it is just as easy, although you can see, if you look at lines 19, 20, 21, and 22, they're actually doing the same thing as lines 24, 25, 26, and 27. Now, it looks a little different. And the syntax is a little easier, perhaps, to read with the predicate. But notice that in this case, I could loop through my tlist, give each instance of sales transaction is t, and see, well, does this mass sales pass the test? In other words, does the Get State equal Massachusetts? And if so, we're going to print out the summary.

The difference, however, with the stream is that rather than having to iterate through every single element, the filter only is going to pull those elements out of the list or out of the collection that match the predicate, which means that we have a lot less effort going on, or at least potentially a lot less effort going on in lines 20 through 22 than in lines 25 through 27. So that's the idea of a predicate.

Now, a consumer is a simple interface. The consumer takes a type in. So notice that in this case, the consumer has a single method. It is a functional interface. And the method is called Accept. It takes a type in, but returns a void. So in other words, it's going to do some operation, but that operation does not require the returning of a value. So with that, any function that uses that can work.

So for instance, in this case, I'm going to do a Print Line. The Print Line doesn't need a return type. And so in this case, notice that I'm going to say ID, and I'm going to get the transaction ID, buyer, I'm going to get the buyer, and then, finally, get the buyer's name. And I'm going to print that out. That will be my consumer. Now, what is passed into the consumer is the sales transaction itself. And it will be passed to the predicate as t.

Now, just like before, I could use this consumer instance, buyer consumer, as part of my for each. Now, remember I said for each takes a consumer, in this case. And so we can stream it. We can loop through each sales transaction in our list. And it's going to print out the transaction ID and the buyer's name.

Now, on the other hand, if I passed the first sales transaction, notice that I could just as easily call the instance of buyer consumer, call the Accept method, and pass in the sales transaction, and I would get the same information for that first transaction.

Now, the function is interesting. It takes two inputs. T, in this case, notice, is our input. So we have a reference type going in. And the method associated with the function in the functional interface is called Apply. And so we're going to pass in a type T. And we're going to return a type R.

So as an example, I'm going to create an instance of a function. And in this function, the item, or the reference, that I'm going to pass in is my sales transaction. And I'm going to pass out a string. That's going to be my result. In this case, the function will have its instance, buyer function. And so once I do, I'm going to get the sales transaction, get the buyer, get the name. And it is the name that string that I'm going to return. So once again, in my print line, I could use that function instance, buyer function, to call its Apply method, and then pass in, in this case, the first buyer.

And then, finally, we also have the supplier. Now, the supplier, as you can see, has a Get method. The Get method requires no value being passed in. There's no input argument. But it does return a specific type, which is defined as part of the supplier interface.

And so once again, if I want to create an instance of a supplier, well, notice that in this case, I can create my supplier by calling my builder. And so the predicate that I'm going to get is actually going to create this sales transaction 101, salesperson John Adams. The buyer is going to be Price Co. They're buying a widget for cash. It looks like for 20. Et cetera, et cetera, et cetera. And then they build this supplier.

Well, when I get to my sales transaction list, tlist, I can add add. I can go to my sales transaction, or my transaction supplier, which is my supplier instance. And I can call the Get method. It is at this point that this is going to instantiate. So lines 16 through 29 aren't even going to execute until line 31, at which point, it will create the sales transaction, and add it to the list. And then, of course, I can print out all of the sales transactions that are in the list.

Now, like I said, each of those are the main built-in functions that are a part of that package. But there are some primitive versions of all of these interfaces, and because you see a lot of these in methods calls. And so the idea of a primitive interface is that rather than return a reference type, or rather than accept a reference type, as the case may be, I'm going to return a primitive.

So, for instance, the two double function is a functional interface that the return is actually a primitive double. Or if I want to consume a primitive, we have the double function. Again, it's a function. But in this case, what is returned is-- well, what is taken in is the double. And then, I'm going to return some other type. Now, what this does is it eliminates the need for auto boxing or auto unboxing when it comes down to the use in the method.

So for example, earlier we talked about the to double function. Now, I'd recommend you to go to the API documentation of the Java.utils.function package, because there are a number of these interfaces. But I did want to show you a couple of these. So notice that in this case, my to double function takes in a type. And that is your input type to the Apply as Double. So I'm going to pass in a type, whatever it is. Let's say it might be a sales transaction. And I want to get the actual price. So I could pass in the sales transaction, and then in my code, I could implement it to return the primitive that is that price.

And here's a good example. All right? So I'm going to create an instance of my to double function called discount function. And in there, I'm going to pass in a sales transaction. I'm going to then get to the sales transactions transaction total and multiply it times the discount rate. And that will be the double that gets returned. So in the case of line 24 here, I'm going to pass in my first sales transaction. And I'm going to get whatever the appropriate discount rate is on the transaction. So that's an example of a primitive type.

Another possibility. We've already seen something similar to that. So we can, again, return a primitive type for that. Well, how about processing a primitive type? Well, notice that in this case, the value that is going into my double function interface to the Apply method is a primitive. So the value getting passed in is a primitive, but the type that is being passed out and that is identified in the interface itself is the type that will be returned.

So as an example, let's say we have our double function. That is going to return a string. So in this case I have Calc, is what I've called it. And my lambda expression says that, all right, when I pass in my value of t, I'm going to multiply it times 3. And that is going to be converted to a string. And that's going to be returned back. So in this case, this doesn't execute. Line 11 and 12 does not execute until I get to line 14 where I call the Apply method of Calc, pass in the value of 20-- that's my double. The double gets passed in as t. Multiply it by 3. So it gets the result of 60. And it'll say new value is 60. So that's how we can process a primitive type.

Now, like I said, a binary type is very similar. The only difference is is that instead of passing in a single type to a predicate or a single type to a function, in this case, we are defining that there are going to be two values passed in. So for example, the bipredicate-- now, remember the idea of a predicate, whether it's a bipredicate or a regular predicate-- is to return a Boolean. But in this case, we're going to pass in two types. And those two types are also passed in as arguments to the test. So you can see-- and you'll see this pattern as you go back to this function package-- but the idea is to create generic interfaces that allow us to call any method that takes those kind of arguments, passes that particular type.

So for instance, notice that I'm going to create my sales transaction list, tlist. I'm going to get grab my first one I'm also going to have a state, CA. I'm assuming California. So notice that in this case, I have a bipredicate, which passes in my sales transaction, passes in a string, and in that case, I'm going to get the state from the sales transaction, and see if it equals whatever the string's value is. OK. Pretty straightforward. Again, line 19 does not get executed until line 23, here, where I can use my State Bipred, call the test method, passed in first, which is, of course, my sales transaction, and my string test date, at which point it will then identify whether or not that sales transaction is in California.

Now, a unary operator is interesting, because, like I said, it extends a function. But in this case, the function not only is the input type the same, but it's the same as the output type. So notice that in this case, when I use my unary function, the first t is passed in to the Apply method. The second t is returned. But they are always the same type. So in this case, the unary operator interface only requires a single type to be passed in.

Wouldn't you like to know what that one is? Well, here is an example. I'm going to have a unary operator. I'm identifying that the type in passing in and passing out will be a string. Now, that's not saying it's going to be the same string. It's just saying that the types are going to be the same. Now, that happens a lot, right? So, for example, in this case, I pass in a string, I convert it to uppercase, and that would be the string that I would pass back. So here, by using my unary string operator, then I can call the Apply method of that unary operator and pass in the name of my first buyer. The return would be that name in all uppercase.

Now, the last thing we want to talk about is they want to identify that, well, you know, this can be a lot more complicated than what we've talked about. So far, we've basically just passed in a single reference type. Or we've identified a single reference type coming out. But it is possible in generics for us to identify a whole class or set of subclasses that might be interesting. So in this case, they're used extensively in generics. And so instead of a single t, I could use question mark super t. And in this case I'm basically saying, this class as a subclass and any class it extends will be acceptable as a type. On the other hand, the question mark extends t basically says, this class and any subclass that extends it would also be acceptable as a type. Or any sub-subclass that extends that.

So in this case, going back to our original rules back in Chapters 3 and 4, we use the most abstract or the most general class possible so that we can not have to rewrite code. So that's the idea of the wild card generics review, is that it is possible to do many other things using wild cards and passing in generics.

So at this point, we talked about the four built-in functions, or built-in interfaces, that are a part of the Java.util.function package. We talked about some of the primitive versions of those interfaces, as well as a couple of binary versions of those base interfaces as well. And so now, it's time to do the practices for Lesson 9.

## 2. Practice 9-1: Create Consumer Lambda Expression - 3m

In practice 9-1, we want to create a Consumer Lambda Expression. So in our project, we're going to open up the Consumer Test. In the main method, we have a list of employees, and we've grabbed the first employee from the list. We are then supposed to create a Consumer Lambda and then call that consumer later. So the first thing is, of course, we need to set an equals, so we need an assignment operator, and we need to build our Lambda.

So the first part is pretty straightforward, but the next one says when the Consumer Lambda Expression to print data from the first employee in the list. The data printed should be the following. So in that case, it looks like we're going call the print method, so I'm going to go ahead and print it. And we're going to say, all right, let's get the name and put that out, the person's role, and looks like the salary. And we'll end with that.

And so let's see, to get the name we need them first dot. We'll go with surname, why not? And we will get the role, so first dot-- actually, it's not first, is it? It is E. So E dot get role. And the third one would be the salary, so get salary.

So at this point, we should have a good to work consumer. So it says to call the consumer here, so that would be E cons dot. We have an accept method, and we're going to pass in the first employee, which it was nice enough to give us. At this point, that should be the appropriate code to get this done. In the practice guide, it does say that we should be getting Baker, staff, and whatever that is, $40,000, it looks like. So let's see if that's what we get. And it is, so looks like we did activity 9-1 correctly.

## 3. Practice 9-2: Create a Function Lambda Expression - 4m

All right, in practice 9-2, it says that we want to create a function lambda expression. So the first thing it asks for us to do is look at the bonus enum. And you can see in the bonus enum that there are three possible values-- staff, manager, and executive.

And apparently, that is their bonus percentages. It figures that the people that aren't doing the work are the ones that get paid the most. So that sounds good.

But anyway, we also have-- let's see-- a constructor. Of course, it's private, or in this case, protected. We have a percent, which gets returned. And we have a by role method that identifies what the bonus percentage is based on the role that is passed in. So OK, good enough.

In this, it says to open up the function test. And we're going to make the following updates. So we're going to write a to double function lambda expression to calculate the bonus for the first employee on the list.

So in this case, this would be where this is supposed to go. So let's make an assignment. And we will create our lambda. And according to this, we are going to take the salary and we're going to multiply it by the enum bonus dot by role. And in this case, we're going to see what the role is by what we pass in.

So all right, at this point, we have printed that. And so we will use it by using the bonus and write a statement to execute the lambda on the first. All right, so in this case, we want the eFunc. And we want to do the apply as double, pass in the first employee, and that should output what's going on. Now, since this is-- I'm assuming-- a number, let's go ahead and properly formulate it.

And so if we run this, according to this, the salary and the bonus are going to be there. So let's see how well it works. All right, so according to this, we have the right information. We have the salary of 40,000 and a bonus of 800.

And of course, the print summary is going to use the previous values for that. So according to this, we have the results that we are expecting to get from our two double function, in which I've passed an employee object and have received a double in return.

## 4. Practice 9-3: Create a Supplier Lambda Expression - 5m

Now, in practice 9-3, they do you want us to create a Supplier Lambda Expression. Now, remember, the Supplier is what returns a type, but there is no return type. So in this case, we're going to go into the practice and open the Supplier Test Java file, and make the following update. So we're going to write a Supplier Lambda Expression to add a new employee to the list, and the employee data is as follows.

Now, notice at the bottom of this listing, it says her data is almost the same as her sister Jane and can be found in the employee.java file. So I did bring up the employee.java file because much of this can be done there. But basically, when you're creating a Supplier, we're going to make an assignment, but the strange thing is the assignment is based on a method. And so at this point, we want to create a new employer-- let's see, that's not Jane, that's John. Let's try this one.

So at this point, we have our Supplier code. We want to create a new employee. There we go. Create a new employee. All right, so now we have Jill instead of Jane, and Jill is a year older than her sister, female staff. She is in sales. The local date is going to be-- OK. And the salary is the same. And, of course, we have a slight email difference, and a social security number difference.

Weirdly enough, they have the same social security number. No, that's the same phone number. Got it. They live in the same place. Yes, yes, yes. All right, so we now have Jill, but we also need to add Jill to our list. So our list is e list dot. We're going to go ahead and add, and in this case, of course, we add a Supplier.

And let's see, in this case, we want to write a new employee to the list, so that would have been first. No. The new employee, so in this case, that would actually be e sup. And then we'll call the get method. So at line 35, the code for lines 14 through 30, will execute, at which point, then we should be able to print out in the Employee List after, we should now have Jill in there. So let's see if that's actually what happens. So and before, we've got Bob through Betty, now we have Bob through Jill. So it looks like our code has successfully-- OK, so that is practice 9-3.

## 5. Practice 9-4: Create a BiPredicate Lambda Expression - 4m

 
In practice 9-4, we want to create a BiPredicate lambda expression. In this case, it's similar to what we saw earlier in the lecture, where we have a list of employees, we have a single employee, and then we have a search state. And so according to this, we want to write a BiPredicate lambda expression to compare a field in the employee class to that string.

And so the first thing we need to do, of course, is we need to create the BiPredicate expression. So in this case, let's call it b. And in this case, we want to-- or actually, we want to pass in two, right? So we want to pass in e and f.

And so what do we want to do? We want to see if the first name-- or no, if the state-- so let's go with getst equals, in this case, f. So in this case, we'll take e's state to see if it equals f. And if that's true, then we'll come back.

And so the next step of the process is to write an expression to perform the logical test in the for loop. So we're always apparently going to run this. So rather than that, we will see that we want this.

So we'll pass test. We'll pass e. We'll pass search state. So in this case, if the search state is the correct, then it will go ahead and print out the summary. Otherwise, it will not.

All right, I believe we have everything that we need. And so according to this, we should have three responses. And in this case, that's exactly what we get. And we get the right ones. So it looks like we have successfully created a way that we can pass in two arguments, one an employee, one a string, compare them and return a Boolean. And so that finishes that practice 9-4.

## 6. Skill Check: Lambda Built-in Functional Interfaces - Score 80% or higher to pass

Skill Check: Lambda Built-in Functional Interfaces

View Skill Check
