# 11: Working with Selected Classes from the Java API

1. Working with Selected Classes from the Java API - 29m

## 1. Working with Selected Classes from the Java API - 29m

Working with selected classes from the Java API.

Well, it's just a case of really picking different types of classes and looking in more detail into what they do, how they work, how they behave. The first one of these different types of classes that you require to appreciate for the exam purposes is string.

Let's take a look at this example. We have string s1 and string s2. Both initialize as some text which is acme. Well, just any text really.

What if I'll compare them? I'm comparing s1 and s2 with a equal equal sign. Now, really if that would be just a regular other object, let's say two products or something, the double equals sign will not tell you that they're true because we'll be talking about two different objects in a heap.

With strings the strange thing is that actually they're allocated just once in this case. s1 and s2 really are pointing to the same object. It's almost as if you'll just write s1 is acme and then you write s2 equals s1.

They really behave like the same thing unless you explicitly used a string class constructor, as in the case with the string s3. There we have this character array and we initialize a string with that content.

And in this case because you use an explicit new string constructor, you're forcing the Java runtime to actually allocate it as a separate object. So that's why s1 equals equals s3 is not true. It's actually false.

You can compare strings just like you compare any other object with an equals method, of course. That solves the problem.

But you need to remember that occasionally if you forget about the fact that you should be calling an equals method and you just compare a thing with double equals sign, for a string it kind of behaves like a primitive. So it occasionally works so long as you didn't initiate the string with a new string constructor, of course. So that's a catch and you kind of have to be aware of that.

Whatever operations you perform on a string, you need to remember they result in a new string object. The strings are immutable. You cannot possibly modify them.

When you say s1 dot substring you're actually just creating another string. The s1 is not changed. It remains the same. The substring operation returns you a new object but it's not changing the original.

Strings are indexed just like a arrays in Java. They're indexed from zero.

So the substring method here parameters are 2 and 4. So you're trying to take characters for all two positions, from position 2 to position 4.

Right, in the word acme a is 0, c is 1, m is 2. So you've taken here the first character m. Then you take the character e, acme. So m e.

You end up with two characters, m e. That's position 3. The position 4 is not inclusive to the result. So it's not taking that in.

So when you take a substring from a particular position, say to length, you don't really need to do length minus 1. So you don't end up with an index being out of bounds.

Your last valid index position in a string, acme, is really 3. There's no index value 4 there because the index started on 0. So substring from 2 to 4 does not throw any exceptions because the upper bound is not inclusive to the result. You end up with the word "me."

Let's take another line of code there. So we concatenated strings s4 and s2 whichever way you want. You can concatenate with concat method.

You can just use a plus sign. The result is just the same. You end up with a new string which is a concatenation of previous strings.

An index of method returns you the position of a substring within a string. So on s1 the index of me will be 2 because the character m in the substring me occurs at position 2 in the string acme.

And also you can grab a character at specific position. So s1 char at 1 will get you c. In the word acme 1 is c because a is 0 remember. All right, so that's list of basic manipulations with a string you need to remember.

Because string is immutable you cannot change the contents of a string once it's allocated. It might not be very efficient if you need to handle a large and complex text manipulation. So you can use an alternative to the string class, a class called StringBuilder.

StringBuilder allows you to allocate a storage for text that you can then modify. You can append, replace, insert characters within it.

So by default you get a StringBuilder allocated to 16 characters. Surely you can allocate a bigger portion of characters, I don't know, 42 characters or whatever you like. Or you can allocate StringBuilder with some predefined text in it. That's entirely up to you.

But the thing is you can keep on modifying it. You can append characters, replace them, insert them. You can check the capacity of a StringBuilder, check how many extra slots for content you actually have inside. Or length, you know, which is amount of characters you actually use in a StringBuilder.

The important point is that you're not recreating the string objects here. You're still operating on the same object, just modifying its internal content.

If you want to allocate more text than was the initial capacity of a StringBuilder, internally StringBuilder will perform system array copy for you. So it will reallocate the internal char rate, internal storage, to add the extra capacity for you to put more text in it if necessary.

OK. Change of subject. Another API that we need to be aware of. It's a new API in Java 8 and it's LocalDate, LocalTime, LocalDateTime classes. There's also zoned date time, but, anyway, that's time zones. But these are the ones that you need to be aware of for the certification purposes.

The older API that we've used prior to this point used the class Date, which was kind of a time stamp, just a point in time containing the information about both date and time. And then there was another class Calendar with which we turned that point in time into calendar time, into something that's specific to a given way of expressing dates.

Think about it this way. In a particular point in time could be expressed very differently based on where you are in the world.

What time is it now? Well, which time zone you're in, right? What date is it today? Which calendar are you using? So this could be very complicated.

And the idea is that latest incarnation of the date-time API helps you sort out these problems.

Another important point about the LocalDate, LocalTime, LocalDateTime classes is that they are all immutable just like a string actually. So, in other words, once you've allocated a LocateDateTime object, a LocalDate, a LocalTime object, you can't really change what time it represents or what date it represents. It stays the same.

Here's some examples. We've allocated here a local date. We use a method now which basically just returns you an instance of date, which is right now. Today.

It does not have a time portion to it. So it's just the day. We don't know what time we mean by that. It's not a timestamp of now. It's the today date.

And you can do certain operations with that. This is just an example. For example, add weeks-- plus weeks or months or, so, perform some manipulations. I don't know, we want to calculate best before date for the product or something like that.

Oh, most certainly you can construct a specific point in time. April the 1st. How about that? So LocalDate of method will allow you to do that.

Quite similar to that, you work with LocalTime. The time comes with no date portion. If you say LocalTime now, well, you get exactly what time is it now but you won't get the date for it. Just the time of the day.

And, again, a very similar sort of approach. You can add minutes, subtract minutes, hours, whatever you need. So kind of there's a little earlier LocalDateTime object here that you're returning from minus 5 minutes. Code example.

You can construct a specific point of time, of course-- LocalTime of. So it's 12:30.

All right, now when you are working with a combination of date and time, you can take a particular date-- let's say the earlier one, date created object. And then there's a method at time that allows you to sort of append time to it and then with combination of date and time in one object.

Of course, you can just straight ahead create a combination of date and time as in the next example, LocalDateTime of method that allows you to specify the year, month, date, hours, minutes, whatever you need. All right.

Finally, you can nicely present the date and time values for users by formatting them. You can help yourself with a class which is the DateTimeFormatter that allows you to format things in ISO format or actually in specific localized format.

So different country and language styles maybe-- place and day in front of the month or place and month in front of the day. Whatever you need depending on the country and language for which you're localizing your application. So that's a format methods.

OK. Another important additional class that you need to study for the exam is ArrayList. It's one of the classes in the collections API.

There's a big collections API available in Java. It's located in Java.util package. And one of many collection classes is the ArrayList.

Now, other collections are covered in the second certification, the Java Programming 2, the next level. But in associate-level, Java Programming 1, you still need to be aware of collections API, although in a smaller scope.

As you can see in this particular case, we're looking at a pair of products that we placed into the array. We decided that array isn't flexible enough for us, maybe because we would like to be able to resize it and create operations around it that will allow a more flexible management of content. And for that purpose we could use the ArrayList.

You can allocate the ArrayList explicitly as a new ArrayList object or you can convert for only array to ArrayList with this interesting method called-- a class called Arrays.asList method. That performs the conversion of existing array into the ArrayList for you.

You can then add extra elements, actually as many as you like. Internally the ArrayList will reallocate the storage to allow you to add extra elements.

So internally the ArrayList class will perform system.arraycopy for you if you start adding more elements than its initial capacity. By the way, the initial capacity of ArrayList is actually 10 elements, but you can specify it in a constructor if you like.

OK, now accessing elements in the ArrayList could be done just with a simple index. Get me the element at a particular position. Get me element position zero returns you the reference for the first element. And then you can just call operations upon it, use it anyhow you like.

You also got operations that help you to check if a certain object is in the ArrayList. The method called contains allows you to make that check.

Remember, in order to implement the ability to search through the array you really need to place subjects there that do have a means of comparing themselves. So overriding the equals method maybe. That's an important point.

So you're placing some elements into the array and then you look in whether the array has some element in it or not. There's an index of method which is doing a similar thing that returns you an integer index.

And if the element is not found, the index will be minus 1. And if the element is found, well, it will tell you where it is in that particular ArrayList.

Most certainly can also remove elements from the list as well. You can remove elements by using the index position or you can actually remove the element by matching the object reference. OK.

Another exciting new area of Java 8 is the ability to use lambda expressions. There will be a lot of information that you will have to learn about lambdas for the Java Programming 2 certification.

But on the associate level, in Java Programming 1, which is this particular certification, you really just need to understand the concept of lambda-- why it's there, what its purpose, what's its syntax, and some basic use cases. As I said in the second part of the certification and the next step, you will have to learn more about lambdas and get more realistic use cases.

Anyway, let's take a look. We have here an example where we build ourselves an array list of products. We add in some products to it-- the food, the drink products, whatever they are.

All right, now we'd like to remove a product from that list based on a condition. Now, what's happening here is kind of an interesting piece of code. The second block of code that you're observing here, the removeIf method with a new predicate, that's where you're looking.

The predicate is an interface but you're creating here an actual implementation of that interface. You're saying new predicate and then you're actually providing a block of code with opening and closing curly brackets which is an anonymous inner class.

You implicitly created here a class. You created a class that implements the predicate. That opening and closing curly brackets are actually boundaries of that class' body.

Class has no name, but it is an implementation of the predicate interface. And you override there the method-- well, it's an interface. It gives you an abstract method that's called test. The method returns Boolean and accepts product as an argument in this case.

And we're performing some kind of conditional check there. So we're saying remove me those products from that ArrayList which price is bigger than 2. OK.

So that's the idea. For every element of the array, the predicate test will be applied for you. If the predicate returns a true, if the test returns a true, such element will be removed. If it returns a false, it will be retained.

However, writing an anonymous inner class is kind of a lot of work. You know, you're writing all that code, you're making it look cluttered, convoluted.

So is there a way to simplify that? Lambda expression.

So after this or statement, you've got exactly same logic but expressed via lambda. To understand what is happening here think about it this way. You are just writing the definition of the method test.

The predicate interface requires you to override method test and that's exactly what you're doing. So you're saying method test will accept Product as an argument-- round brackets, product p. Yeah, that's your parameter list.

Then you have dash greater than signs. And after that you place your method body. So the method body of the test method is returned-- p.getPrice greater than 2. So you've implemented there an actual method body.

Result is you're creating an anonymous inner class. But you're not creating an anonymous inner class directly in the code. You're getting the same logic but you're not writing all of that wrapping code around it.

And you can make it look even shorter. So you can just simply say I'll call the parameter p and my method body will check if p get price is greater than 2. That's it. You don't even have to write the return statement in that case because it kind of implies that that's what the method does.

So the lambda gave you this shortcut way of really implementing an interface and just simply overriding a single method in it which is doing exactly what you want in this case, provisioning, let's say, the condition to remove something from the array.

There are lots of other examples of lambdas, but, for starters, the predicate is the first thing you really need to look at. That is a simple way of writing the lambda expression giving you Boolean test result.

There's another one though and it's called a UnaryOperator. OK. Similar thing. So we have this array list of products, we added some drinks and foods there. Now I would like to use a different method there. It's called replaceAll.

The unary operator, unlike a predicate, has a different method. It's also an interface but it has a method called Apply. And it accepts an object as an argument and returns an object as a return type. So processing things there. So accepting a product, we're returning a product.

What are we doing here? Looks like we're changing a price, right? Writing some discounts.

Well, instead of writing it as an anonymous inner class, which is the first example, you're shortcutting the code by placing a lambda expression instead. So we're just saying we'll accept the product and then we'll provide the method body there which is p.setPrice, return p.

All right, or even shorter, you don't really have to redeclare the product with round bracketed parameters. You can just I'll call parameter p and then just write a method body. That's lambdas for you.

So I suppose the whole point is that they declutter your code. Hopefully they will make it more readable because the code looks more like a task that you want to perform, like an expression that you want to apply, rather than an actual arrangement of an anonymous inner class implement in the interface.

Let's take a look at the code examples that illustrate the APIs we were just discussing. So first, this example of LocalDate and DateTime.

We take the object of now, local date now. We subtract a couple of months from it and we add 10 days. And that will allow us to construct a different point in time.

Now, what if we're interested in finding out what's actual distance between points in time? So there's another one called period. Let's try to use that. Let's just run it for a moment to see what will happen.

Period is one month and 19 days. Ah. All right, so that would allow us to calculate specific time difference.

And another example here. It's pretty straightforward. Just getting the LocalDateTime and then printing it out as is in ISO format followed by the printout of that using a localized format.

Well, this particular computer has an American locale, hence it prints out the month before the date when I ask the localized format to be printed. And it prints out the ISO format if I just print it as is. So that hopefully helps you to appreciate exactly what sort of activities you do with LocalDate, LocalTime, period, et cetera classes.

Now let's progress to another part of the API chapter demonstration, the one that covers lambdas. OK. So there will be few things here.

First of all, there will be this ArrayList example where we've added some foods and drinks and products. And then with the help of a predicate we look into what's in that array. And then we use that predicate and remove if.

As you can see, we actually form a separate object out of it, that p is a predicate object which is actually implementation of a predicate interface which is, in this case, anonymous inner class implementing that.

Just to see what will happen at the end, I'll scroll down here. And I'm comment that for loop for you just simply iterating through the collection of products just printing every product. Nothing much.

So let's see what's going on. We applied to remove if of a predicate if a price is greater than 2. And there you go. We just end up with a Tea.

Now let's comment this block out and replace it with that single simple line. This hopefully illustrates exactly the point of why would you use the lambda. Because you achieve exactly the same result with less coding.

OK. And then the other example here is of a UnaryOperator. Let's un-comment that. This is an example of unary where we're changing the product prices.

Let's run that piece of code. So we're updating-- oh, I should call it, should I, yeah? That's a good idea, to actually make an invocation past the UnaryOperator object to the replaceAll method. Then that will make a difference.

That's much better, yeah. So we discounted our products.

And then we could have written it much shorter without actually having to implement an anonymous inner class. But instead we could have done it in a simple line like this.

OK, so let's run that. That's the same lambda expression. Doing exactly the same thing as the UnaryOperator in the previous example.

Let's go back to the PowerPoint. In this section we looked at the string class that allows us to create immutable text objects. We looked at an alternative of a StringBuilder which helps us to create more complex manipulations with a text.

We looked at LocalDateTime API. We looked at collections, specifically at ArrayList. And, finally, an exciting new feature-- lambda expressions.

All that's really left to say is just a few words about the overall approach to the certification. You need to review the topics obviously.

Just the advantage of taking the online video-recorded course is that you can pause any time. You can go back any time, just check things, look for further examples maybe.

I would advise going to the Java tutorial available on the web as well. We will put a URL for that tutorial in the page. And to sort of practice a little bit with the topics that were covered by this particular training.

Well, thank you very much for attention and good luck with your exam.
