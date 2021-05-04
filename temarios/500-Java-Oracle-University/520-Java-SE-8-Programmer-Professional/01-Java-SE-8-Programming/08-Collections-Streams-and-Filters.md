# 8: Collections, Streams, and Filters

1. Collections, Streams, and Filters - 24m
2. Practice 8-1: Update RoboCall to Use Streams - 7m
3. Practice 8-2: Mail Sales Executives using Method Chaining - 3m
4. Practice 8-3: Mail Sales Employees over 50 Using Method Chaining - 3m
5. Practice 8-4: Mail Male Engineering Employees Under 65 Using Method Chaining - 4m
6. Skill Check: Collections, Streams and Filters - Score 80% or higher to pass

## 1. Collections, Streams, and Filters - 24m

In the previous chapter we talked about generics and collections. And in Chapter 8 we want to talk about collections and how they have been modified and improved in Version 8. So we said that collections always contain reference items inside of them. And collections, of course, represent something that is in the managed heap.

Well, the nice thing is that in Version 8, every collection was converted. They were uplifted, if you will, so that you could also directly access them as a stream. Now think about that. What that means is that not only do I have things in memory, but I can actually pull them out one at a time, one after the other. And I can do things to them.

So in this particular chapter, we're going to talk about streams. We'll talk a little bit more in a couple of chapters in the future as well about streams. But that also means that we can use filters. So for example, let's say that I have a collection that has let's say 100 elements that are varied but I only want to use a number of those. It's very similar like in the database, where if I have a table of information but I only want a specific set of rows and a specific set of columns, I can use a where clause to identify exactly the data that I want.

Well, by converting a collection to a stream, I can apply filters, which is very similar to a SQL where clause, where I can say I only want elements that meet this criteria. Now, the filters take a predicate. So we've already seen that a predicate is something that allows me to pass information in and it returns a Boolean. Well, that's what the filters work with.

Now, streams can also use methods, final methods or final operations. And it is these operations that we can do. So for example, if I want to count the number of items that meet the filter or I want to sum them, average them, find the max, the min value of them, or for that matter, if I want to just loop through each one and then do something else, the streams provide that opportunity.

So what I'm actually defining and what we're going to see in this short chapter is that it implements something called the Builder method or the Builder pattern. And so what we can do is we can basically chain methods together in a way so that it gives us the need and shortens the syntax. So let's go ahead, talk about this chapter. If we look at the slides we can kind of go through each one of these topics.

So first of all, we're going to describe that Builder pattern and talk about how we can iterate through a collection by using lambda syntax. We'll look at the stream interface, if you will. We'll look at filters and how they use lambda expressions as well. And then we will talk about chaining methods, et cetera. So that's pretty much where we want to go with this particular chapter.

Now, like I said, I can iterate through a collection using a forEach method. Up until now, every time we've looped through or we've iterated through a collection, we used the actual forEach syntax. And in that case, we had to go through every single element. Well, to each of the collections has been added the forEach method, which allows us to iterate through the collection without using syntax. And we can do that using streams and filters as well.

So as an example of this, we're going to introduce the Person class. So basically the Person class will have attributes like as it says name, age, address, et cetera. But this class was created using the Builder pattern, so I will be able to populate a Person class by using a Builder. But also when I put the Person class into a collection, I will be able to identify people that I might want to email, phone, or physically mail. And so I can query for certain groups of people in which to apply different quantifiers.

So for instance in our example, we're going to look at three different groups, drivers, so people who are over 16; draftees who are males between 18 and 25; and commercial pilots, who are people between 23 and 65 years old. So the Person class has these properties. So you can see that they are all in essence private fields that allow us to have information about who they are and where they are and what their email address is.

And so the Builder pattern is something that would look like this. So notice that it says that it's easier to read code. And so when I look at this, previously if we were to create a class like the Person class, and we had all of this information we wanted to use to instantiate that class, of course we would use a constructor.

Now the constructor is nice. But if you have a constructor that has, what is this, seven different-- seven different pieces of information or more, it starts blending in as to-- well, hopefully you know what that is, because it's not as easy to read. Notice here, however, that we can identify specifically what attribute we are setting as part of the Builder pattern.

It also creates more flexibility, because if I don't have an email or I don't have an address or I don't have a city, I just don't include it, which is kind of nice. So it provides a little more fluidity than perhaps a constructor might.

So in this case, notice that I'm calling the Builder method of the Person class. And in that Builder method, I'm going to chain different methods together to, in this case, give a name, the surname, the age, the gender, et cetera. And then once I'm finished with that, I will call a build.

Now, what this does is it instantiates that and then adds that new Person to my collection called People. But in this case, there's a couple of things that are a part of that. Now, everything between the Builder method at the top on line 261 and the build call on 272 are basically called intermediates. They are modifiers that work on what has gone before, so kind of a cool way to do this.

Well, the reason we're bringing up the Builder pattern and how you can do this method chaining is because that has also been introduced to our collections. So when we create a stream from our collection, we are able to chain methods together to get the results that we want.

So let's see one example of how this could be done. So remember I have my Person class. So in this case, I'm creating a List of type Person, so that would be it looks like pl. And then I'm going to create a Short List. So I call a createShortList method of the Person to populate my list here.

So notice that on line 16 this seems to be really strange code, because we've never actually had something like this before, because before we'd have a for and then we'd have our two predicates where we would have pl as the second one. And then we'd have to identify an item of type Person as the element as we loop through. And then of course in that case if we wanted to print it out, we would call the system out print line. And we would pass the individual Person.

Well, we're doing exactly the same thing on line 16. But notice that it doesn't take three or four lines of code in order to do that. So where are we at?

Well, first of all, we're indicating that the List we want to work with is pl. As a collection, it has a forEach method. That's a terminal method that allows me to loop through each Person in the List.

Now what are we going to do with that? Well, it assumes that when we iterate through each item in a collection that I'm going to have that one item. So p here represents a single Person in that List.

So what do I want to do with p? Well, apparently I want to print it out. So this lambda expression makes it much, much easier to work with, even though the functionality is principally the same.

So let's go one step further. We still have the exact same List, Person List here, but we call the stream method. So now we're basically saying we want to take the elements of our collection and we want to stream them out one after another.

Now the cool thing about a stream is at the end of the stream, we're going to identify the elements and what we want to do with them. So notice that with the stream, I have an intermediate here called Filter. Now this case, the filter is saying I only want people from the stream who are greater 23 and less than or equal to 65. So in this case, it looks like we're getting our airline pilots from earlier.

So in this case, only those people who meet that criteria are now going to be included in an internal List class that only has those that meet the filter, at which point then the forEach, being a terminating method, allows me to loop through only those elements that meet the filter qualification.

So what's going to happen each one of those? Well, we're going to call the roboCall method, passing the Person as the one. So apparently in this case we're going to get I'm assuming a phone call.

Well, what else do we have? Well, because the forEach takes a predicate-- or I'm sorry, because the filter takes a predicate, remember in the last chapter, we talked about how we could pass two strings in and we return a Boolean. Well, basically that is a type of interface that we call a predicate.

Now, a predicate is basically this. So if you look here in line 18 and 19, notice that my predicate is basically saying I'm going to pass in a Person. And I'm going to call this thing allPilots. But in this case, the predicate is indicating that only Persons who are between the ages of 23 and 65 inclusive will be included in this predicate.

Well, just like what we had in the previous one where our filter had that information as part of the predicate of that method, notice that here, since I've already defined the predicate, notice that I can pass that into the filter method just as well. Now, the advantage to this of course is that if I have multiple streams all needing that same predicate, I don't have to redefine it each time. I just use the one that I have.

Now, another example that they use in this particular chapter is the sales transaction class. And we don't really have a class that they're showing here. But the class is used in examples and practices to follow. And at least in the sales transaction we're going to have who sold the product, who bought the product, what product was bought, how many, and the price of the product.

And the sales transaction class has been implemented with the Builder class. So in this case, my buyer class represents buyers and their volume discount level. But I also have a couple of enumerations that have been defined, the BuyerClass that we just talked about, a list of states where transactions can take place, and a TaxRate, which would be of course the sales tax rate for each of those different states.

So in my sales transaction, I'm going to use or be able to use an instance of the stream class. So notice that the actual stream class is actually in the Java util package. But as I said, it's a sequence of elements on which various methods can be chained. So when I call stream, I'm basically streaming the information that is inside of my collections one by one, so I will see each element one at a time. But it allows me to call any number of methods on that one statement.

Now the one thing that you need to know about streams is first of all, they're immutable. While you are in the stream, it is recommended that you do not change the elements in the collection. You want them to be the same. Now once the stream is finished, then you can change the things or the elements that are applicable.

After the elements are consumed, they're no longer available from the stream. So just like if you throw something in the river it can't float upstream. It's going to go downstream. Same thing here with this stream.

And because a stream can have multiple methods chained together, these operations can occur only once on a particular stream, also known as a pipeline. So once we get to the terminal method, whatever that is, whether it be a forEach or a count or an average or a min or a max, well, you're done. If you would need to do the stream again, you'd have to get back to the list and call the stream method again.

Now the cool thing is that these streams can be either serial, which is the default, or they can be run in parallel. So let's say we had a gig worth of data that we wanted to work with. Well, if we did that serially, that would take some time, whereas we could just as easily create it in parallel. Now, the cool thing is later on when we are talking about I/O and collections in relationship to that in the concurrency and the forkjoin and finally in Chapter 17 we're going to talk about parallel streams, we will talk about how streams can be used in parallel. So in this chapter we're going to be primarily talking about just serial and for the next couple of chapters.

So once I have a stream which converts my collection to a pipeline, remember we don't want to change the data in the middle of the stream and it can only be used once, but the filter method takes a predicate as its input. And so in this case, notice that I'm basically saying, all right, I'm going to loop through my tlist, whatever elements are in the tlist, I want to filter where t-- I'm going to call the getState method of that. And as long as the state equals CA, it will go on to the next step in the stream.

So the filter is just identifying those elements that meet this predicate. Remember, the predicate returns a Boolean, so it will pass them on. And in this case, it's going to call the forEach method that we saw earlier.

But notice that the syntax a slightly different here. Now normally we would have represented this as t, the arrow, so dash greater than, and then we would say t.printSummary, for example. Well, the cool thing is that in streams, and for that matter in lambdas, if you want to call a specific method, the static method or an instance method, all you have to do is identify the name of the class and then identify the name of the method you want to call. And it will pass everything that is passed to it from the stream. So in this case, if the tlist, the filter allows three items through or three elements through, the printSummary would be executed on each one of those three.

Now in the next slide, it does talk a little bit about how these are all equivalent. So notice in the first case, this is what I was talking about before where you could do the forEach and identify that for each t you're going to call the printSummary. But alternatively, you can use a method reference. So in this case, the sales transaction would be the class. printSummary would be the method.

Now if you're talking about a sustaining-- or a static class, of course, you would have to choose the containing class and then whatever the static method name is with the two colons in between. So this again is a shortcut expression that we can use to call a method.

Now notice that you can use method reference for static methods, for instance methods, like the first example, or reference to an instance method of an arbitrary object of a particular type. So in this case if I wanted to call a method on the String class, notice that I'm going to pass whatever element is in the element to the compareToIgnore class. And it will come back.

If I want to instantiate or call a reference to a constructor, again I just would call new. So a simple way to access method references.

Now in the Activities, at least the solutions, they don't really use this a lot. They use more of the lambda because we're trying to get used to it, of course. But there's nothing to prevent you from playing with this on your own in the Activities. And so you can see in what cases they would work for any method call.

Now the other thing that I wanted to talk about is that in the previous case, we had the stream. We had our terminating forEach. Well, there's nothing that says that I can't have more intermediate methods, more intermediate methods.

So in this case, notice that I'm calling a filter. So I only will pass through elements that meet the State is California. But then I can say, well, is the buyer's name Acme Electronics? Well, as long as both of those are true, then that element or those elements will be passed to the forEach and it'll print out the summary. So it is possible in your pipeline to have any number of filters or intermediate methods in between.

So on this particular slide, it's showing kind of how you could do this a couple of different ways. In the previous slide we saw that on line 22, 23, and 24, where we actually have two separate filters. But in this first one, notice that I could have on line 17 and 18, could've easily called the filter once and just passed a number of predicates. Either one of those would work.

So when we talk about a pipeline, the first thing is that we're going to call the stream method. So that is required on the collection. Now, the source could be a collection. It could be a file. It could be an actual input stream of some type or a reader of some type. So as long as it has a number of elements in it, you could call that as a source.

You can also have zero or more intermediate operations. And in a couple of chapters we'll talk about some of the delivered operations that you can work with. But we've already introduced the filter. And in two chapters we'll talk about the map or the be able to create a completely different stream object.

And then we can have a single terminal operation. And we've shown the forEach. But I've also mentioned the min, the max, the average, the count, the sum are all different terminal operations to work on the filtered collection.

And so in this case, we've talked about the Builder pattern. We've identified that lambda syntax can be used throughout the use of this method chaining, that the intermediates usually have a predicate that returns a Boolean, and the terminal ones can actually be of many different types of interfaces and Builders that we're going to be talking about.

And that concludes the lecture for Chapter 8.

## 2. Practice 8-1: Update RoboCall to Use Streams - 7m

In Practice 8:1, we want do a couple of things. But basically we have an application that already exists and it's used for automating communication with groups of people. And we've kind of seen before much of what it was in the lecture portion. So we introduced for example, the Person class, and we looked at the Builder Method in the Person class.

We also talked about a For Each. If I was using a stream, for example, I can use a terminal For Each to print out and loop through each of these. And of course, we have the Stream and Filter that we talked about in the lecture, as well as the ability to call a method and chain and use Pipeline.

So many of these things we've talked about that we will be using in this particular practice. Now in Practice 1, they want us to open up the Practice 1 activity, and also to open up the Robomail 1 class. And basically, we are going to take out the Mail and the Text methods.

So we've now taken out the Mail and Text methods. They are no longer needed since a stream will be used to filter the employees and a For Each will call the required communication task. All right. So with that in mind, we'll go ahead and save it. But of course that messes up dependent code in the RoboMailTest01.

So in this case what do we have going on? Well notice that down here when we called Mail, when we called Text, these no longer work, because, well, they don't work. In this case we have a Employee list and we have a couple of predicates that we've already created, one called Sales Execs and one called Sales Employees Over 50, that we are working with in this case.

So what we want to do is-- it says, "Your program should continue to perform the following tasks to the following groups." So we're going to create a stream, a filter, and then we're going to perform a For Each on the Mailing and Texting tags of the previous one.

So all right. The first thing that we need to do of course, is that we need to create a stream of our class. So in this case, the Robo is not needed really. But what I do need however, is I need my list. And so in this case, we're going to eliminate-- now before I get rid of that, I will do the p, l, dot, and we're going to go ahead and call it the Stream method.

Now based on that, we did want to filter. And so in this case, we can choose a filter which can be past a 1. And so in this case, this should be my Sales Executives, which we have. So that would be the filter and it would ensure that we only get those in the role of Executive who are also in the Sales department.

And at that point, it looks like we need to do a For Each. And a For Each, because in this case we also want to be able to print this out. So in this case, the Robo, dot-- and what's the method that we want? So we're going to Mail, and Pass T.

And we can do the exact same thing. But in this case, instead of the RoboMail, we want to call the RoboText. So at this point, we can work through each one of these to identify that's how we want it.

Now we would do something very similar if we were working with the Sales Employees Over 50. And so in this case we could just as easily copy these down, and instead of Sales Executives, we can do our Sales Employees Over 50.

And if we did this right, we should be able to Print and say, OK, well here's my Sales Execs, and I'm emailing or I'm texting. And then here's my Sales Team, where I'm emailing or texting them. So that concludes Activity 8:1.

## 3. Practice 8-2: Mail Sales Executives using Method Chaining - 3m

In practice 8-2, we want to open up our practice. And they're requesting that we mail all sales executives. They specify two filter methods to select the recipients for the email.

So in this case, of course, we want to stream our list. So we've done this. And we're going to apply a filter that takes a predicate. Now, in this case, the predicate that we want to work with is that we want only sales executives. Let's see-- sales executive.

So let's go with the department first. So we'll go with the department, Get Department. And we want to make sure that it is equal to sales-- and then a second filter in which we want to also make sure that we only have executives.

Now, in order to determine whether they're an executive we would go with the Get Role. And in this case, it looks like we want to use the role.executive. So this predicate should allow us to work with sales executives.

So next, we want to loop through each one that we receive. And in this case, we would be receiving a person to the for each. So we're going to call the robo mail. And it will provide us with that.

Let me go ahead and format this a little bit nicer so that we can see what's going on a little better. But in this case, this should give us the sales executives who are in this list. And based on the results, there should be one. And there is. So this successfully completes practice 8-2.

## 4. Practice 8-3: Mail Sales Employees over 50 Using Method Chaining - 3m

In Practice 8-3, we're going to do something very similar to what we just did. But in this case, they want us to mail to sales employees over 50, using two filter methods to select the recipients of the mail. So it's very similar to what we just did. We're going to of course call the stream method. And we'll call our first method, and then we need to create a predicate to identify what it is that we're supposed to do.

So in this case, we're going to, looks like, get the department first. Once we have the department, we want to make sure that it equals sales. And so that would be our first filter. Now, our second filter also takes a predicate, in which case we're going to go ahead and, in this case, make sure that the age-- not the address, but the age-- is greater than 50? Yes. Greater than 50.

Now, once we have those two predicates, then the idea is that we can go ahead, loop through each one. And in this case, we can use the robo class to call the robo mail and pass in-- well, in this case, the beginning of the predicate. So each person here will be P, and that should print out all sales employees over 50. And let's go ahead and reformat this so that it looks a little better. And I believe this should work.

Now according to the practice, we should get two sales employees over 50. And that is exactly what we get. So this successfully complete Practice 8-3.

## 5. Practice 8-4: Mail Male Engineering Employees Under 65 Using Method Chaining - 4m

In practice 8-4, since this is the last chance to play with predicates for a little while, I thought we'd play with it a little bit. So we've been asked to send an email message to all male engineers under the age of 65. So I figured we go ahead and stream it. But I'll do the termination now, in which case, notice that I can create a predicate.

Because we know that we want to mail each of the predicates. And I guess that would actually be a person rather than a type. But if we run it as is, this would be the same as if we used a for each loop, right?

So if we go ahead and run this, we can see that there are quite a few-- one, two, three, four, five, six, seven-- eight people inside of this list. Now, of course, that's not what they asked us to do. They didn't ask us to output everybody.

So let's go ahead and deal with the males first. So we're going to do a filter. And in this case, I'm going to use the ability to get gender. And I'm assuming somewhere in here the getGender equals what?

All right, so I believe that's what it is. So let's see if we can get rid of the females here. So that should get rid of-- I'm assuming-- Jane and Betty. But at this point, it doesn't give us anything.

All right, so apparently male is an enumeration, not a string. We should've caught that. And it says that it doesn't like something. So what are we working with?

So is there a gender? Of course there is. And so in this case, now that we have gotten the gender thing right, notice that we now have gotten rid of the females. But that's not all that they asked us to do, right?

So in this case, we're going to go ahead. And let's go with the department. So again, we will provide another predicate for getDept. And in this case, we want where the department is engineering. And so at this point, we don't know who's an engineer. But we've got two.

Now, it also says engineers under 65, and that we're supposed to have three filters. Well, right now I can see that we don't have anybody over 65. So we've met the description. But let's go ahead and finish it up anyway.

So again, we can do our predicate, getAge. And in this case, we want less than 65. And so the final should give us the same result as before. But this is according to what they've asked us to do. So we have now successfully completed practice 8-4.

## 6. Skill Check: Collections, Streams and Filters - Score 80% or higher to pass

Skill Check: Collections, Streams and Filters

View Skill Check
