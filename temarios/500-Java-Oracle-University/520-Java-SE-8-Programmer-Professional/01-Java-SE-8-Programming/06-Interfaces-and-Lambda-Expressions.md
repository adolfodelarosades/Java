# 6: Interfaces and Lambda Expressions

1. Interfaces and Lambda Expressions, Part 1 - 21m
2. Interfaces and Lambda Expressions, Part 2 - 20m
3. Practice 6-1: Implementing an Interface - 20m
4. Practice 6-2: Using Java Interfaces - 20m
5. Practice 6-3: Write Lambda Expressions - 5m
6. Skill Check: Utilizing Interfaces and Exceptions - Score 80% or higher to pass

## 1. Interfaces and Lambda Expressions, Part 1 - 21m

All right. Great exercise. Let's see what we've got going next.

In the next chapter, we're going to talk about interfaces and Lambda Expressions. So to kind of build on what we've already talked about in a couple of chapters ago, we talked about classes, and we saw that classes generally are fully implemented. So we have fields that are private. We have getters and setter methods, and then the functionality that we want to expose in the class is written in the class.

When I use the class, I'm able to use it as written simply because I am able to instantiate it because it's fully implemented. And then in the last chapter, we basically said, well, wait a minute. In some cases, we don't actually want to instantiate classes. We may want to define a class that isn't fully implemented.

And so we identified that as an abstract class, and we basically said that a abstract class contains zero or more abstract methods, methods that weren't implemented. But an abstract class could have methods that are fully implemented. But we also identified that an abstract class would then have to be subclass to be able to be used.

Well, what if we take that extension one step further? Instead of being partially implemented, what if we have something that has no implementations whatsoever? Now, we could create an abstract class that just has abstract methods in it.

We've identified that. But there is something that allows us to define a number of methods that have no implementations but provide a contract. So if I work with that, then we have no problem.

Now, what is the advantage of working with an abstract class? Well, with an abstract class, we can, of course, extend the abstract class into our subclass and then fully implement it. The idea of the abstract class is that it allows us to have different implementation in different subclasses, but yet we still have the functionality that is available in the abstract class.

Now, the big deal here on the extends is a relationship. The only time you want to use an abstract class is if the subclasses are truly an extension of the abstract class. Now, when it comes to an interface, there is also an advantage because instead of defining a relationship, a interface defines behavior.

Now, what do I mean by that? Well, in our previous examples, we were looking at the abstract class and then we would have a different form. But in this particular chapter, we're going to look at it.

Let's say that we're a seller of products, and those products can be completely different, but we need some way to be able to interact with those products in our sales capacity. Well, the interaction in that case of the selling behavior would be a behavior. There is no relationship necessary between the subclasses that we're talking about. And so in this case, we can define one or more methods that must be in this other class, but in this case, we're defining a behavior, not a relationship.

Now, the other advantage is that if I use the extends keyword, how many classes can I have that extend the main class? Well, we already identified that Java is a single inheritance language. So in the case of a single inheritance, that means that yes, I can have an abstract class. Yes, I can have a subclass. But that's it. I can't extend any more classes that way.

The nice thing about a interface is that it uses the implements keyword, and the cool thing about the implements keyword is that it can be followed by multiple interfaces. So they will be comma delimited, and we'll see that in the slides. So basically, the idea of an interface is that it provides a contract. It provides behavior methods that I need to implement in a class that define our behavior.

Now, in this chapter, we're also going to see that there are default methods that we can declare in an interface. These are new in version 8. We can also declare static methods in an interface.

Now, the nice thing about a static method is, again, just like what we were talking before where if we have something that's static, it belongs to the class. Well, in this case, it belongs to the interface. So we'll look at the advantages there as well. And finally in an interface, we can also define constants that we want to use in relationship to this behavior. And so that can be really advantageous as well.

Now, in version 8, we introduce something called a functional interface. Now, you've probably come across functional interfaces in your designs all over the place, but the definition of a functional interface is it is an interface that only has a single method. Now, the reason why a functional interface is important is because Lambda expressions directly interact with a functional interface. And so in this chapter, we're going to introduce Lambda Expressions that we will be using, well, through many of the next couple of chapters.

So that's kind of where we're going to go, at least in this chapter. So let's go ahead and take a look at the slides. All right. So we've kind of looked at the idea that we're going to, of course, define an interface. We're going to choose between an interface and inheritance, and I've kind of looked at that in orange on the board, and we've talked a little bit about how interfaces can be worked.

We're also going to define a Lambda expression. And so first of all, Java interfaces, as I said, are used to define abstract types. So they basically have these five characteristics. They're similar to abstract classes in that they can contain only public abstract methods.

So the nice thing is on an interface, one, you don't have to declare it as public, although you can, because it is inferred. You also don't have to declare any of the methods as abstract because, again, that is inferred. But it basically gives you the methods that have to be implemented by the class that implements the interface. So methods must not have implementation in the interface, but in the classes that implement it they will.

In addition, we've talked about how it can contain constant fields, how interfaces like abstract classes, and for that matter like superclasses, can be used as reference types. So can an interface. And then we're going to see that these interfaces are essential parts of many design patterns, some of which we will talk about.

So to give you the example, earlier I was talking about how we're going to be working with a company that sells an assortment of products that are very different from each other, but they need a way to access financial data in a similar manner. So the products that we're going to be talking about are crushed rocks, measured in pounds, red paint, which is measured in gallons, and widgets, that are measured by quantity.

So you can kind of figure that, OK, the classes themselves are completely different than each other, but yet somehow we still need to be able to calculate a sales price for each of these objects. We need to define what is our cost on each of these items as well as what is the profit on each of the items. Well, those are similar, and so we will call this our behavior. And so when we look at our crushed rock without an interface, it might look something like this.

So notice that I have a name, a sales price, a cost, and a weight, and when I instantiate my instance of crushed rock, I'm going to pass in that sales price, that cost, and that weight to pass that in. Now, the problem is, when we look at crushed rock, sales price really isn't a characteristic or an attribute of the rock. It's basically something that we have to append in order to be able to work with it. And so in this case, what we're going to do is we're going to create a interface called SalesCalcs.

Now, notice that in this case I can retrieve-- oops. I can retrieve the name of whatever item it is. I can also calculate the sales price, calculate the cost, calculate the profit. And so each one of these, while defined as public, are also abstract methods. There is no implementation here. And notice that the syntax is exactly like what we talked about yesterday in an abstract class.

Now, to add the interface to our class, notice that now I have my crushed rock. I can have any number of information about specifically the crushed rock, but it implements the SalesCalcs interface. And so in this case, I can override my calcCost. Well, notice that in this case that my cost is by weight, but if I were talking about a widget, then I could have my cost by item, or in the case of red paint, I can have my cost by gallons. I can override the calcCost in each of these different items to give me the appropriate value, or the appropriate double in this case.

Now, in this case, of course, I can calculate the sales price and subtract out the cost, and that, by definition, is going to be our profit. So again, this defines a behavior that even though the different classes are completely different, we can still define that behavior. So any class that implements an interface can be referenced by using that interface.

So for example, in this case, notice that I can create a instance of crushed rock by passing in the appropriate parameters, but I could just as easily create an instance of crushed rock based on the SalesCalcs interface. And when I go to print it out, notice that I could just as easily call the CalcSales price on the specific crushed rock instance, or based on the interface instance. They both will have the same method. And in this case, because they are in essence the same amounts, they're going to give me the same sales price.

Now, the other cool thing is that if you're the company and you want to work with these different products, notice that in this case, I could create a list based on SalesCalcs. So in this case, I have five elements. I'm going to give my item report, and I can instantiate each element using crushed rock in some cases, red paint in some cases, and widgets in some cases.

So in this case, my item list is based on objects that implement the SalesCalcs interface, and because of that, as we loop through each item in the item list, each one of them implements SalesCalcs, and so I can use that to print out my item data. So this gives us a little bit of flexibility. So a utility class that references the interface can process any implementing class.

So let's say that I created a class called ItemReport. Separate class, but it allows me to work with any object that is of type SalesCalcs. Well, we've already identified SalesCalcs is not a class, it's the interface. But in this case, I can still get the name. I can still calculate the sales price, the cost, the profit. And the cool thing is that even though the classes that may comprise these are completely different, in the respect of the behavior defined by this particular interface, they're exactly the same.

Now, prior to version 8, when we talked about an interface, what we have just talked about was all there was. It was a description of methods that you had to implement in a subclass. Well, the problem is that too often in our design, we're finding that we implement an interface, and then oops, we didn't really design this as well as we thought and we need to add another method to that interface.

Well, the problem is that if I add a method to the interface, every single one of the classes that implement that interface are now broken. Not only that, but any subclasses to those classes are also broken simply because oops, I changed the interface by adding an additional method. And so there are a couple of things that have been added to version 8 that makes that problem to some extent go away. And one of them is this idea of a default method.

Now, a default method is simply a method that uses the default keyword. So it's a new modifier default. And so in this case, I'm defining a print item report. Now, the only way a default method will work is if the implementation of this will work in every class that implements the interface.

So notice that in this case, I'm only accessing the methods that are in the interface. So getName, CalcSales price, cost, profit, et cetera. I'm only accessing what's in the interface, but now I am identifying that any class that implements the interface automatically has this functionality without me doing a thing in the implementing class.

So default methods are declared by using the keyword default. They are fully implemented methods within an interface, and they provide some useful inheritance mechanics because now, let's say I've just added this particular method. Well now, every class that also implements the interface automatically gets that method without me having to change any of those classes. That is default methods.

Now, in addition, well, here's an example of the default method. So we kind of saw before that we could, of course, create a list based on items that implement SalesCalcs. And in this case, now notice that all I have to do is call the print item report because we know that that particular default method is going to be in every single one of these. I don't have to implement it in crushed rock, red paint, and widget.

Now, in Java 8, it also allows static methods in an interface, and so it's possible to create helper methods as well. So for instance, in this case, notice that in my interface SalesCalcs, I now have a printItemArray, which is a static method, that allows me to pass to it a SalesCalc array. And if that's the case, I'm going to loop through each of the items in the array. I'm going to look at each item, and then again, I can print it out. But in this case, instead of printing out the single item, I can now pass an entire array or collection to this, and it works just as well.

Now, again, we said that interfaces allow us to work with constants. So again, we know how to declare a constant. We're going to use final.

In this case, we also are declaring it static, which means that it is not only available anywhere, but it's also never changing. So in this case, new line feed ==Static List Report==. I'm assuming this is going to be the report title that we want to use probably in our static methods, so this allows us to have that information without having to worry about implementing it in the implemented classes.

Now, interfaces can be extended just like classes. Extends can only be followed by a single value-- in this case, by a single interface. So for example, let's say I wanted to create an interface widget SalesCalcs that extends the SalesCalcs. Well, the extends, of course, means that I get the four methods that I've already talked about, but now we're talking about that we're going to include a method for getting the widget type.

So in this case, this interface would have to implement five methods rather than the four of the SalesCalcs. So as an example, notice that my widget pro class here extends Widget and implements widget SalesCalcs. So in this case, we're going to have, of course, the ability to create a widget.

We're going to work with a specific type, and then we do have to extend the getWidgetType. Now, the advantage of this is widget also extends SalesCalcs, so the implementation of those four classes have already been done for this class. Now, the rest of this chapter is on basically a lead up to the definition of Lambda expressions. So this a real good place to calibrate.

## 2. Interfaces and Lambda Expressions, Part 2 - 20m

All right, continuing the discussion in Chapter Six, we don't want to talk about Lambda Expressions. Before we talk about Lambda Expressions, I want you to know that they're not really different than things that you might have seen before.

And so I kind of want to look at a number of different ways that we could implement basically the same thing. Because as we look at it, we're going to see that this would definitely be easier syntax to do. But yet it does the same thing.

So for example, yesterday we basically said, well, we could create a class that has a completely separate file. We can compile it in. And then, of course, we can use that class in another class.

But if that class is the only place that other class is being used, it really doesn't make sense to have two different classes. Why not just create one inside? Now, we saw yesterday that we could name that class. But then we also saw we could just as easily define it in place. And that was what we were talking about as far as an anonymous inner class.

So why would we do this? Well logically, we're grouping code in one place, where it is needed. It does increase the encapsulation, because we don't have an extra file to worry about. And in many cases, it does make the code more readable.

Now, I'm going to introduce an interface called StringAnalyzer. Now, notice that the interface only has a single method, analyze, that takes two strings in-- one is the target string, and one is the search string. So I'm assuming, based on this, that we're going to take the search string, look in the string, see if it exists or not. And if it does, it's going to return-- well, if it does or not, it's going to return a Boolean.

Now later on, and earlier on the whiteboard, we talked about that-- what this means is this is a functional interface. It has a single method.

Now in this case, across the board, we're going to pass two strings. We're going to return a Boolean. So far, so good.

So let's take an example of using the inner class. Now of course if I'm using an inner class-- notice here, for example, that I have this class called searchArr that takes two strings. And it also takes that string analyzer that we talked about before.

Now, it is this string analyzer. So notice that, basically, starting here and going here, this is an inner class. So it's anonymous, because I'm just using the name of the class. And in this case, I'm overriding the analyze to see if my search string that I just passed in is the same-- or is within my target, which is this one that gets passed in.

All right, so here's my anonymous class. So up here, notice that I can either define an instance of a concrete class. In this case, contains would be an instance of ContainsAnalyzer, my concrete class. And then, of course, I could pass that in the concretely here as the third argument to searchArr.

Well, by doing the anonymous class, of course, I don't even have to create an instance of this class. And I don't have to define it externally. However, there are some advantages to this. And of course, there are some disadvantages as well.

So in this case, the class is created in place. That would be an advantage.

So if I want to use a regular class for my analysis, notice that now I have my class AnalyzerTool. I have my single method, arrContains. Again, I have two strings. I'm returning a Boolean.

And once again, I'm finding out, does the source string contain the search string? Yes or no. Well, of course, the regular class is a completely separate class, different file, different class file, that I have to use.

And so if we were going to run this code in our Z01Analyzer class, notice that I am creating a string array. And in my string array, I'm going to have tomorrow, toto, to, timbukto, the, hello, and heat. And apparently, I want to search for the character string T-O. So searching for that.

So notice that I'm going to create an instance of that external class, AnalyzerTool. And then I can basically say, all right, let's loop through each of the strings in our string list and see, well, based on that instance, calling the arrContains, does this string be contained in that?

We would print out each match. So in this case, it would come out with tomorrow, toto, to, timbukto, all have to. And so it would list those and print them out. So that would be using a regular class.

Well, what if I wanted to use an interface? Well, just like before, we have a class-like structure, in this case StringAnalyzer. But in this case, we're going to be using the method analyze.

We're still passing in two strings. We're still receiving a Boolean. And because string analyzer is a single-method functional interface, then that has certain meaning later on, when we talk about Lambda Expressions. So we'll come back to that.

But replacing the previous example and implementing the interface looks like this. So I have my class, ContainsAnalyzer. Notice that it implements the StringAnalyzer interface. And now, about the only thing that is different is the name of the method.

Everything else is still the same. I'm still searching for the string in the target. I'm still passing two strings. I'm still retrieving a Boolean.

So the change in the actual class isn't much. And if we look at the main method, we can also see this really hasn't changed much, except for now, this is based on the class that is based on the interface. And this one is calling the analyze method of the interface. But everything else is exactly the same.

So what's the point? Well, there are a couple of things that we're going to find later that we can work with, dealing with Lambda Expressions. And so we're going to find that this can work really well. Now the first of these is kind of this idea.

So an improvement to the code is to encapsulate the for loop. So in this case, we have a search array. So we're going to pass in an array. We're going to pass in our search string.

And then we're going to pass in that analyzer class. So now, we can loop through each one. But now, instead of having the loop in the implementation class, I now have it in my analyzer class.

So once again, we still call the analyze method. We still pass in the two strings. And we still print out every single one of these that have it.

Now in this case, notice that this eliminates a couple of methods in our test class, because all we have to do now is called the search array, pass in our array, pass in our search string, and then pass in our analyzer class. So far, so good.

So what if we went one step further? We already saw that we could-- instead of using that separate class, we could just as easily create the internal or anonymous class. So we have our analyze. We pass in two strings. We see that target.contains(searchStr), yes or no.

So it's going to return a Boolean just like the previous one. But it also means that I have a less code to write.

Now, there are a couple of things about anonymous classes that you need to know. Whenever you create an anonymous class, the compiler is going to create a separate class file. But because it's anonymous, it's going to index what that file is.

Now, if you only have one or two of these, that's not a big deal, because you'd look in the package. You would see these anonymous classes. But because you only have one or two, you'd pretty much know what they go to.

Now if you're using a lot of anonymous classes though, you can kind of see that that could be problematic, because there is no name associated with them. So it's not immediately clear which anonymous class is going to which code. So that can be problematic, if you're talking about using anonymous classes a lot and if you're trying to debug.

Well, what we're going to do is we're going to see that, basically, a Lambda Expression is the extension of an anonymous class of, basically, a functional interface. But instead of having to create that class, you can use the interface directly. And so this is what I mean.

So this part, lines 13 through 17-- they haven't changed at all. So in this case, notice that-- well, even 19 and 20 haven't changed. And even on 21, we're still calling the search array.

We're still passing in the string. We're still passing in the-- the list, I mean. We're still passing in the string.

But the third predicate is now using a Lambda Expression instead of that anonymous class and instead of that concrete class that we did before. Now, a Lambda Expressions contains three parts.

The first part is, basically, the predicate string. In this case, basically, this would be our argument list. Now, if you remember the concrete class in the interface in the anonymous inner class-- every one of those, the method was called with two strings being passed in. Well, notice that we have two strings being passed in here.

Now, the Lambda Expression also has this arrow token. So you can see an arrow token. And then, this is what I want to do with my Lambda.

Now, notice that it uses the arguments as part of this. Now, this could be a block. I could have a number of statements joined together. But you get the idea.

So in this case, basically, it's saying take this string called target. And see if this string, called search, is contained within it. Well again, this is going to return a Boolean. Either it contains it, or it doesn't.

Now, the cool thing is that underlying this is not a class. It is a functional interface.

Now in the next chapter, we will get into that. Or let's see-- not in the next chapter, in a following chapter after the next chapter, we will be talking about this.

But what this involves is something called a predicate. It is a delivered interface, a delivered functional interface, that comes with version 8. And so we'll get into that in much greater detail in a couple of chapters.

So my Lambda Expression starts with an argument list, is followed by the arrow token. And then in the body, you identify the block or statement that you want to execute, based on that argument list.

The return is inferred from the interface that it comes from. So for instance, in this case, I'm going to pass in two integers, x and y. And I'm going to add them together.

Or I'm going to pass in two integers. And it's going to infer what these types are-- again, based on the functional interface-- and add them together.

Or I'm going to pass in x and y. And I'm going to print out the result of x and y. Now in this case, depending on whether it infers, whether it's an integer or a string, will depend on what gets printed out.

In another example, I could pass in string s as my-- and in either case, I can see if that string contains the word "word". And again, I can either identify the type, or I can infer it.

So what is a Lambda Expression? Well, a Lambda Expression, like I said, has those three parts. But if you notice, there are some of distinct alignments between the class that we had before.

So in his case, our ContainsAnalyzer, which implements the string analyzer-- it had an analyze method that took two arguments. Well, these two arguments here are identified up here as the same two arguments. So for example, notice that my two arguments in my string analyzer has this.

The t.contains(s) is very similar to the target.contains(searchStr) here. And as it shows here, both have a body with one or more statements.

So a Lambda Expression is, basically, being able to take an interface, or in this case a class, and represent it in a much more abbreviated fashion. So that's kind of the idea behind the Lambda Expressions. Now, the rest of this is going to just look at a couple of examples. Like I said, we will have a number of chapters on Lambda Expressions, and functions, and operations as we continue with this class.

So for instance, on this particular slide, notice that I have the same thing that we talked about. I have my search array. I'm passing in my array, my search string. And then, here is my Lambda Expression.

Now, the cool thing is is, unlike the previous, where I would have had to either change the anonymous class or change the underlying class, if I wanted to work with a different method here. But the cool thing about using a predicate like this, which is what this represents-- a predicate is basically where I pass in arguments and I return a Boolean. And we'll talk about that later.

But in this case, notice that, in this case, I'm looking for whether s is contained in t or whether t starts with whatever is in s. In both cases, I'm passing in two arguments. And I'm returning a Boolean.

So the nice thing about Lambda Expressions is that not only does it shorten the syntax for writing these things, but it also means that I don't really have to change anything here, other than-- I'd just use a different method. As long as that method is going to return a Boolean, I could use any method as part of this Lambda.

So again, coming back down here in my search array-- remember, I'm taking my string, or my string array. I'm passing in a string. And in this case, I am defining search array as taking a string analyzer.

Well, the string analyzer, again, was that functional interface that defined that, I will pass in two arguments. And I'm expecting a Boolean back. That's what this Lambda does for me.

Now, the other nice thing about using Lambda Expressions is that you can treat them like you would any other variable. So for instance, in this case, notice on the right hand side of my assignment operator, I have a predicate that I am then creating an instance of, contains, startsWith. And so just going back to the previous one, notice that I can pass in this instance here, that instance there. And I get, again, the same results.

So Lambda Expressions can be assigned. They can be passed around. They can be reused just like a variable.

And so what we've talked about is we've talked about an interface. An interface is a way for me to define one or more methods that I want to then implement in any number of classes.

We've also seen that the inheritance deals with [? extends ?] and means that there is a relationship. In the case of an interface, however, it defines a behavior. We're just defining the methods that need to be in the implemented class.

We saw that we can extend an interface. And we basically defined, briefly, what a Lambda Expression is. And we will spend a lot more time on this in a number of chapters yet to come.

And so that concludes Chapter Six.

## 3. Practice 6-1: Implementing an Interface - 20m

In practice 6.1 we want to create some interfaces. So in the project, we have an abstract class called Animal. And let's take a look at that. So currently Animal implements a field called Legs, has a constructor that populates Legs. It has a walk method. So this animal walks on so many legs. And it has an abstract method called Eat, which needs to be, of course, populated in other things.

Now, several of the animal classes implement an interface called Pet, which you're going to create. So in this case, we now have, of course, our pet main, which contains our main class, which we will get to. So if we run our project right now, all we have so far is the spider eats a fly. This animal walks on eight legs. The spider eats a fly. This animal walks on eight legs. All right, so not a lot of functionality quite yet. But we get the idea that the spider has eight legs and eats a fly.

So in this case, we'll want to create a-- well, we are going to also review the spider. And notice that spider extends animal, which means that I'm going to call the super method which passes in the eight legs. That's where we get this. And because animal has an abstract eat method, of course I have to implement Eat, which we just saw the spider eats a fly. That is the implementation of that particular method.

Now, we're going to create a new interface. So we're going to create the interface here in this. And so we could choose a Java interface in our Java filter. And in this case, we're going to call it Pet. And so now we have our interface. Now, in the interface it says that we want three method signatures.

So we can say that public, we're going to return a string and call it get name. Pets have names. We're going to be able to set the name. So we can set the name and apparently pets like to play, so we're going to also have them implement a play. So in this case, that would be our pet interface.

And so we're going to create a fish. So a fish is a class. And in our fish we're going to extend animal and implement pet. All right, so notice that once I've done that, notice that fish doesn't like it anymore because, well, it's not abstract and it hasn't overwritten all of the eat methods of animal, nor has it implemented the methods defined in pet.

So in this case, we do want to create a string to hold our name. Because fish have names. And we want to override the getter and setter methods. So we're going to go ahead and insert some code to implement name. So that takes care of that one. And since each of these are in the pet, we have that.

So we also need to be able to have a constructor. So it says to create a constructor, so we're going to create a public instructor for fish. And how many feet do a fish have? I'm going to assume 0. So we'll pass that as our means for fish to ambulate.

And what is left? Well, we still need to insert some code. For the animal. We would need to override walk. Because after all, a fish can't walk. So according to this, we will output instead. We will instead identify that fish, of course, can't walk. They swim.

All right, so we now have our walk method. We also have our getname and setname from the interface. But the interface also requires that we have a play method. So I'm going to go ahead and override the play. And we'll just output something simple like just keep swimming. You get the idea. All right, so fish apparently swim for play, so we'll let that go.

And now we have one additional method that is required based on animal. And that is the eat method. So in this case, we want to eat. And so we will say that fish eat pond scum. Sounds like a reasonable life to me. So at that point, we have now created everything that is required of both an animal, which walks and eats, and of a pet, which has a name that we can get set and can play.

Now in the case of a cat, on the other hand, we'll go ahead and create a new class. And the same thing here. We're going to extend animal. There we go. And implement. And so in this case, looks like our animal, our cat, is also going to have a name.

And we're going to create a couple of arguments. So in one case, we'll pass the name in as the argument. Cats have four legs, last I checked. And we'll just set that to the name we pass in.

Now we also want another public. Let's try this again. All right. We want a cat with a no default constructor or a no argument constructor. So I guess cats by default are going to be called Fluffy.

All right. Now, so far as this goes the walk method for cat works really well, because the cat would walk on its four legs. This helps if you add in the appropriate syntax. So we don't have to worry about the walk method, but we still do have to have an eat method for Fluffy here.

Now, before we do that, I guess I'm going to create a play method. So whatever the cat's name is likes to play with string. So we're going to override that. And like I said, we also need a eat method. And in this case, it looks like cats like to eat spiders and fish.

All right, so at this point, we have created quite a set of animals here. And at this point, we should have all of them done. Yep, yep, yep, eat, play. So we implement animal. So we have walk already, but we do have an eat method, which we have here. And the pet. Ah, I see what we're missing. So in the wherever our cat went. Where did our cat go? And there is one. So we need the getname and the setname is what we needed.

All right, so now we've got everything overridden the way we want it to. And that gives us the opportunity to mess with this. So in the pet main class before, we just were working with a spider or a animal working as a spider. So in the previous example, we had our animal. We had our spider declared. We created our spider. And because spiders basically eat and walk, those are what we had. So we could call walk, we could call eat. We know how many legs there are.

Now, when we create an animal that is specifically a spider, notice that animals also eat and walk. So we are able to call those as well. Well now we have a couple more animals to play with. So we're going to add some additional lines in to see how that works.

So first of all, we're going to create a pet P, or at least declare one. And we're going to have a cat, C. And in this case, we're going to call our cat Tom. So obviously my cat can eat. My cat can play. And my cat can, of course, walk. So all of those are fine. Now, if I were to say, well let's transform my animal as a cat. Now in this case, we're going to assume that this is going to be Fluffy.

Now in this case, notice that as an animal, the animal can only eat and the animal can only walk, because animals don't have the ability to play. On the other hand, if I introduce Fluffy or Tom here as well as a pet. Now notice that in this case, we can set the name. And we're going to call this cat Mr. Whiskers. And Mr. Whiskers, of course, can play. But again, that's the only things that are allowed for a pet.

Now, in addition, we want to create a fish. Now, fish in this case, we will-- now, our fish, of course, allows us to set a name. So in this case, this fish is Guppy. And we can also eat. We can also walk. So we can do all the things that an animal can. But since Fish are also pets, they can also play. So this gives you an idea of what it is possible. Now on the other hand, if I treat my animal as a new fish. Then again, my animal is back to only eating or walking. Always helps if you have the right one.

So it looks like everything's working here. But they also want us to implement a method called play with animal. So in this case, we want to play with an animal if it's a pet. But if it's not, we don't want that. So I'm going to pass in any animal. And of course, I can check to see if it's a pet by just identifying that it is. And if it is, we're going to create an instance of pet. And at that point, of course our pet can play. On the other hand, if it's not a pet we'll give a warning.

All right, so at this point, we can put in our play with animals at the end of the method. So in this case, let's see. We want to pass. S. What's S? Now, we want to pass in our spider. OK. We want to pass in our cat. And looks like we want to pass in our fish. So that looks like that'll work. And so when we run all this, it should give us a number of things.

So we have our spider. We have our cat. Cats like to eat spiders and fish. Tom likes to play with string. Remember that was our cat. And this animal walks on four legs. And then repeat on the cat as an animal. We have Mr. Whiskers here. Plays with string. We also have fish eating pond scum that walk on 0 legs, but they swim, they can't walk, and their method of playing.

Then as an animal, we have this. And then for our play with animals in the case of a spider, it does not implement pet, so it's a wild animal. While Tom likes to play with string and fish just keep swimming. So it looks like we got the results that we were expecting from activity 6.1.

## 4. Practice 6-2: Using Java Interfaces - 20m

In practice 6-2, we want to take an existing application-- the one that we worked with earlier-- and we want to refactor it to use interfaces. Now, in this case, there are two additional files that have been added to our earlier banking application, and we're going to create those. So the account operations and the bank operations are the ones that we're going to be working with.

So first of all, let's go ahead and open up the account, and also the account operations file. So in account, currently, of course, we have our constructor. We have a field that is a balance. We have our get balance, we have our deposit method, and then we have our string method. But notice that we also have to abstract methods-- withdraw and get description.

So we want to copy the method signatures from the account file to the account operations file. So the ones that you want to are Get Balance, Deposit, Withdraw, and Get Description. So we want Get Balance and Deposit. And we want Withdraw and Get Description. All right. So we want to update the checking account to use and implement account operations.

Now, the problem, of course, is that what we need in an interface is we do not need implementation. And while we can use the abstract keyword here, in an interface, we don't have to. So that would be our account operations. It should work. And now in the case of the account, we're just going to implement the account operations. And of course, in this case, the get balance, it's showing now that these are overridden methods, so we can add the appropriate attribute to them.

So where are we at? So we've updated it to implement account operations. And we're also going to want to update the savings account to do the same thing. So if we bring up the savings account class, it extends Account, but it's going to implement Account Operations. And once again, the Withdraw, the Deposit, and the Get Description are a part of that interface and have already been implemented in this particular class.

Now, in the account class, it wants us to go back to Account and remove certain methods. So we're going to remove Get Balance. Deposit. So we're going to get Deposit and Get Description. So in the account, we want to update the toString method to print a message without calling Get Description. So on this case, it looks like we're just going to include information about the current balance. In this case, we could format this if we wanted to. And pass in the balance.

So at this point, our account class looks good. But notice that that has done things to the savings account. But before we do that-- we've saved the account-- we want to edit the checking account, which now has a problem. So why? Well, one, we have to implement the abstract method, so Get Balance needs to be there. And in this case, pretty straightforward. We're just going to return balance. And in the case of the deposit method, we're going to add to the balance the amount passed in.

We're also going to override the toString method, which at this moment we don't have in this class. And so in this case, we're going to return the Get Description, and then add the Get Description Balances, and then we're going to go ahead and add the balance. And we'll go ahead and save that file, and now that's working fine.

But again, we have a problem with the savings account class. So in this case, we also want to pull in the Get Balance, which works. And we're also going to add a toString here as well. And so as part of this, we are going to do what? Return, and get the description, and then append onto that. Same thing-- balance is. So I believe that allows us to have everything there. So we can go ahead and save this, and we can close all the files.

Now, at this point, it looks like our project is working well, but they want us to now change the bank file. So we'll bring in bank, and it's going to implement the bank operations class. So we have that. And we'll go ahead and save it. And we will now open up bank operations. And it's pretty easy to implement an interface that doesn't have any methods. So apparently, we want Add Customer, Get Num of Customers, and Get Customer Methods.

In this case, we'll add the Add Customer, Get Num of Customers, and Get Customer. And that will be our interface. And we can go ahead and save the file. And then finally, we want to work with the customer report. And we're going to copy the Generate Report. And we're going to put this actually in the interface. So to make sure we get all of it. Now, in order for a method to have implementation-- as you can see, this normally doesn't like this-- we will declare this method as default.

Now, it also doesn't have the appropriate import, which is kind of strange, because Bank should be there. So we will change the reference to this. And that works just fine. We should be able to save the file. That should work. If we delete the customer report Java file-- and it is gone. But that caused a problem in the main, so once again, we have to come in here, because there now is no customer report. So we're going to create a instead, change the bank to bank equals new bank. We've got that part. And we're going to change the report code to just bank generate report.

And now everything has been switched. So we're going to update the initialize customers method, make the method static. The method already is that. And note that a bank operations object is passed in. Yes. And if we run this one more time, it should run exactly the same as what we had before. So we have our customer report, each of the different customers, branch information, savings account information, et cetera. So if we go into the customer file, we want to change our account array to an account operations array and fix any resulting errors.

OK. So we have undo. There we go. OK. So I create a new one of those. Which would be my Accounts, Account Operations. I got 10. I have Accounts there. If I add an account-- well, this should be Accounts. There we go. It would have been easier to do a Find and Replace on that one. That would have worked. But in this case, we do have all of the customers correctly updated with the appropriate account types. So that should mean that I should be able to run this.

And when we do-- it always helps if you actually run the right one. All right. So it's saying that somewhere along the line, I have a problem. So with that, where am I? So it's not in this one. All right. So we are in the main method on line 10, so we're generating the report. If we go to the Generate Report, it's saying that we have a problem on line 28. So far, that one should fix it. Let's see what else we have. Yeah, yeah.

There we go. All right. So we get the same output that we did before, but now it works appropriately, and it works with our two interfaces. And this concludes activity 6-2.

## 5. Practice 6-3: Write Lambda Expressions - 5m

In practice 6-3, we want to write additional Lambda Expressions for our string analyzer application. So go ahead and open up your project Lambda Basics 06 03 Practice. And in this case, we're going to expand the directories as we normally do. But we want to open the Lambda test.

Now, we've seen some of this before, where we have our string array here that has a list of words. We have access to the analyzer tool.

And we're going to create an instance of that to search for the to. And we're, of course, searching for to. And we will see using Lambda Expressions, where we can use the contains, where we can use the starts with, and where we can also determine whether or not one is equal to the other.

So in each case, we will be looking at a passing in our string list. In each case of these, we're also going to pass in our search string. And then, our Lambda Expression will give us the opportunity to work with this.

Now, it looks like we are going to write, however, some code. So this does the loop of the contains, starts with, and equals. But we need to write some Lambda Expressions for ends with less than five and greater than five.

Now, the cool thing about Lambda Expressions is that because it is very short syntax, for the most part, you can copy and paste. So in this case we want to write a Lambda Expression that displays strings that end with the search string. So if we were to take this entire result and replace it here, here, and here, the only thing we need to really do is we need to call the ends with.

Now, in the case of less than five, there's a little bit more to it, because we want to, first of all, see if it contains it. But in addition, we want to make sure that the links is less than five.

And then, finally, the expression here, very similar to what we just did. But we can use our Lambda Expressions to also see if the length of the item is greater than 5.

So that basically is it. So you can see that we're calling the same show result method. We're just changing the predicate that is being passed in. And so if I go ahead and execute this, we can see that, like before, we were able to see, well, there are four words that contain to. There are three words that start with to.

The ends with that we wrote, there's only one word that ends with to. Actually, there should be to, because Timbuktu should work there. So we take a look with that. Oh, here's my ends with. The equals is the to. So ends with to, we wrote those.

And words that are less than five characters long. And words that are greater than five characters long.

So that gives us the results that we expect. And that's all we need to do for practice 6-3.

## 6. Skill Check: Utilizing Interfaces and Exceptions - Score 80% or higher to pass

Skill Check: Utilizing Interfaces and Exceptions

View Skill Check
