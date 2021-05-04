# 10: Lambda Operations

1. Lambda Operations - 20m
2. Practice 10-1: Using Map and Peek - 11m
3. Practice 10-2: FindFirst and Lazy Operations - 13m
4. Practice 10-3: Analyze Transactions with Stream Methods - 8m
5. Practice 10-4: Perform Calculations with Primitive Streams - 7m
6. Practice 10-5: Sort Transactions with Comparator - 7m
7. Practice 10-6: Collect Results with Streams - 3m
8. Practice 10-7: Join Data with Streams - 3m
9. Practice 10-8: Group Data with Streams - 7m
10. Skill Check: Lambda Operations - Score 80% or higher to pass

## 1. Lambda Operations - 20m

Well, welcome back. It's time to extend our discussion of Lambda and Lambda functions. In this chapter, we're going to talk about Lambda operations. So we have a good idea now what Lambda is, what the built in functional interfaces are that were dealing with.

And so this chapter, basically, just extends what we've been talking about. So because of that, I'm just going to get back into the slides.

So when we talk about Lambda, we're going to talk about this idea of-- well, think about it. When we're talking about a stream-- so we have a collection. Or we have some data source with multiple elements in it.

Well, what if I want to extract some of that data and be able to store it in some other collection?

In this case, we're going to talk about a map. We're going to talk about different operations that I can do with that. Some of those operations we've talked about.

For example, we've looked at, the forEach. We've looked at the filter. But we really haven't focused too much on anything else. So that's what this chapter is about.

In addition, sometimes when we perform an operation on a stream, it's possible we may not get anything back. If I do a filter, and none of the elements match the filter, well, you can imagine that if I try to then do something on nothing, there could be a problem. And so as part of that, we're going to talk about the optional class.

The optional class is exactly what it sounds like, where if there's something in it, then the continuing methods will occur. If there's nothing, then it doesn't perform an operation.

Now in Lambda, they also talk something about lazy processing. Now to me, it sounds more like a shortcut operation. For example, you know that you can have two ampersands to represent an and. But you could just as easily use a single ampersand to use an and. And it's called a shortcut operation.

For example, if I'm looking at an and-- if the first clause is false, then it doesn't matter what the remaining clauses are. The result is going to be false. And so we can shortcut that, unless there is a specific reason we want it to evaluate each clause.

So that's kind of the idea of lazy processing. So we'll see that there are methods that allow us to find, for example, the first item that matches our description. And then it stops processing.

Also, we talked earlier about how we can sort collections. Well, it is also possible for us to sort a stream. And so we'll get into that.

And then finally, if there's a situation where I have one collection or one data source, and I want to do whatever operations on that, but then I want to collect whatever it is that I get at the end of that stream into another object, we can do that as well, as part of the collect method. So kind of a cool chapter. It has a lot of things that we can do. So let's take a look at it.

So on slide 293 here, it says that streams are based on the java.util.stream class, which of course, we know. And it is a sequence of elements on which various methods can be chained, which we have experience with. And we've identified that the stream class converts a collection to a pipeline, which we've already talked about, which means that the data is immutable or should be treated immutably and can only be used. And of course, we can do the method chaining, some of which we've already done.

And so what they're telling you here is the Java API doc is your friend. What they're saying is that each one of these classes has tons and tons of methods that we can work with and a number of streams.

And so for example, they're identifying that I can create a stream that only holds doubles, or only hold integers, or only holds longs. So a number of different classes that we can work with when we convert a stream. Right now, all we've ever done so far is to call the stream method, which invokes the class and outputs whatever it is. But we can get much more specific.

Now, in the next succeeding slides, we're going to be talking about a number of different operations. That's what this chapter is. So we're going to take a look at filter, map, peak.

We also have some terminal. Remember there can be any number of intermediate methods. But we can only call one terminal method on a operation. So forEach, we've already worked with quite a bit. But notice that there is the count, sum, average, min, max. And we will also talk about the collect.

I also talked about some of the shortcut operators. So the findFirst, findAny, et cetera. These are all terminal operations. So there can only be one per stream.

So for instance, let's say that I wanted to take a function as an argument. That would be the map function. So remember, a function takes one reference type and returns another type.

And there are a number of primitive versions that allow us to convert a stream into a map. So mapToInt, mapToLong, mapToDouble are, again, different versions that we can use.

Now, peak is kind of interesting. We've already seen this briefly. But the idea is that we can look at an element and see what it is but yet not pass it in the stream. Since the stream is one-way, the peak allows us to take a look and then get back to the stream.

The peak does take a consumer. Remember, a consumer is a situation where I'm going to have an object passed in. But it doesn't return a value. So for example, if I wanted to look at the intermediate results after a filter, and I wanted to take a peek and then print whatever it is that I saw, the peak is perfect for that, because it is not a terminal method.

Now, the other search methods that we looked at-- for example, findFirst-- that's somewhat obvious. We're going to return the first element that meets a particular criteria.

An allMatch is-- well, I'm checking. Does every element match the criteria? And noneMatch is do none of the elements meet the criteria? So the cool thing is that, for example, in the allMatch, if you find something that doesn't match, it immediately terminates that operation, because if one of them doesn't match-- or in the case of the none, if one of them does-- it doesn't really matter what the other elements are, because it's going to return false automatically.

Now, search methods are nondeterministic. In other words, if I pass the same elements, it does not necessarily mean that I'm going to get the same results. Why?

Well, remember I said that these streams can be done either serially, or that can be done in parallel. Now, we haven't talked about parallel, because we're going to talk about that in a later chapter, in parallel streams. But the idea is that if I'm doing a findFirst, and I have, let's say, four threads then I'm actually searching on, the findFirst is going to return on the first one that is found, despite what thread it is.

And so if I run it three or four times, it is very possible that I could get a different answer each time. So the search methods are nondeterministic. If they are run serially, they will usually provide the same answer.

But for example, a findAny could be run in parallel. And so the first element that meets the criteria is going to be returned. Or the anyMatch returns true if any elements meet the criteria. So there, again, the result may always be true. But how it arrived at that true could be different.

So let's talk about the optional class. Remember I said that the idea is, of course, as we filter and work with streams of data, it's possible that-- well, it's possible that I'm going to be working with data that may not exist. So simple example, if I had a filter that's looking for the state of California, but none of my elements have the state of California, well, then once I get past the filter, there's nothing there.

Well if I tried to operate on a null, that can give me an exception. And so I can use the optional class that has a type that-- it's a container object that may or may not contain a non-nul value. If a value is present, then we can use the isPresent. And it'll return true. And then we can also use to get to return what that value is.

And so it is possible for us to use a number of optional classes, especially the optional primitives that they're listing here. But that goes back to our statement that the API documentation in this case is definitely your friend. There are tons of these classes that allow you to work.

Now, I indicated that streams perform lazy operations. And technically, what that means is-- getting it straight out of here. Technically, what this means is that as soon as the first element is found, the iteration stops.

And so in this case, we're showing a couple of different possibilities. The one on the right is basically showing that the stream starts. And then even if it finds one, it's going to keep executing until it gets through every element.

The one on the left-- if this is a findFirst, it's going to execute till it finds the first one and then terminate the operation. So lazy operations, they can be optimized. And they perform only the required operations at the time.

For example, we've seen filter, for example. The stream may have 1,000 different elements. But if none of the elements pass the criteria in the filter, then no operation is going to happen on anything except what passes the filter.

And so as part of this, we indicated that you can get a count. So I can do, for example, maybe a filter and then do a count. And it would identify, of course, how many elements pass the criteria or the max.

Now, the max could potentially do, with no comparator-- meaning that it's going to do a natural order. And we've seen what that means. Or we could pass in a comparator class to indicate how we want that to be sorted, based on what is the max and based on the comparison.

Same thing with the min. And same thing with average and sum, where it's going to return the arithmetic mean of the elements that passed any criteria or the sum of the elements. And in any of these, we could use different primitive streams, depending on, again, the type of the stream that we're working with.

Now when we looked at collections, we looked at that the collections class has a static method called sort. Well, even though we're working with a pipeline, even though we're working with a stream, it is possible to use a sorted method, so that we can get whatever meet the criteria. We can sort them either naturally, if we pass no comparator. Or if we pass in a specific comparator, it will sort it based on that criteria.

And then finally, the cool thing about a stream is that not only can I do a single sort. But I can also do secondary and tertiary sorts, by indicating, well, if I want to compare, notice that I can pass in a function. So the function, of course, will take in a value and then return some other reference.

So you can specify any field to sort on, based on a method reference or a Lambda. And there are, again, primitive versions of the function, which we talked about in the previous chapter.

Well, if I want to sort and then sort on something else, notice that I have an additional thenComparing method that will then specify any additional fields that I want to sort on. If I want a descending sort as opposed to an ascending sort, I can use the method reversed.

So lots of things that we can do with streams, with a pipeline, including if I get to the end of the stream, no matter what the intermediate is-- if I then want to take whatever elements are left and place them in another collection, I can use the collect object to do this. And then I would identify the type of the collector. Now, this is going to rely on the collector's class that we're going to talk about next. But pretty decent idea.

So for instance, here's my stream. I say collect, Collectors. And notice that I could do it to a list. I could do it to a map, et cetera. So a number of different things that are possible.

But this allows me to work with the resulting collection as opposed to the original collection. Now, there are number of other methods that are possible with the collectors class.

For example, we can get the average. We can do any grougBys. We can actually join multiple strings together or concatenate the input elements into a string. We can partition the input elements according to a predicate.

So again a number of operations. Pretty much anything that you could think of that you would want to do with a resulting stream, you can do using the collectors class.

And in fact, let's say you don't have a data source. And you want to create a data source to use as a stream. That's what the stream.of method uses.

So notice that in this case, I've misspelled Wednesday here. But Monday, Tuesday, Wednesday, Thursday act as our data source. We can put in the appropriate intermediate methods, in this case, filter. We can use whatever terminal operation we want, in this case, the forEach.

And so we can say Matching Days that start with T. So this should say Matching Days Tuesday, Matching Days or Thursday. Wednesday doesn't start with a T, right? So you get the idea. And so the stream.of is a quick and convenient way to create a short stream that you can use in your programs.

Now another possibility is-- let's say that, for example, notice here I am actually accessing a file using a file object. And once I have this file object, I'm going to convert it to a path. And we'll talk about paths in a couple of chapters.

And then once we have that path, notice that I can use the files class, which we will also talk about. And this is going to define each of the lines in that file. Well, the lines method allows me to basically create a stream, where I'm going to look at each line of data in my file as if it's an element in a collection.

And at this point, notice that I'm going to use a flat map to flatten this by converting each line into its respective words and collect it as words. And so basically, when I get to this first filter, it's looking at each word in this file as opposed to line by line.

And so at this point, it looks like I'm looking for any word that contains my, at which point I can peak, see, well, does it match? If it does, notice that I can go ahead and print it out in the peak. And then once I finish that-- so I'd print all the words that have M-Y in it, and then I'd get a total count at the end, because the count is the terminal method. The peak is the intermediate.

So we've talked about a number of different possibilities when it comes to a pipeline or the use of the stream class. We've seen that there are a number of methods. We've seen that there are a number of classes that we can work. There are ways that we can sort, compare, collect into a map.

So a number of different things we might want to do. And so now it's time for us to do the eight practices of Chapter 10.

## 2. Practice 10-1: Using Map and Peek - 11m

 
In Practice 10-1, we're going to use the Map and Peak functions. So according to this, we are going to open our 10-1 practice sales transaction. We're going to review the code for sales taxation. Now, you can see that when we go to this, that there are a number of members that are available here-- a couple of constructors including one with a builder, we've got, of course, all the getters, we have a print method, a print summary method, we have a number of fields, and we have our builder syntax. And if you haven't built a builder before, this is really good stuff to look at, so you might want to take a look.

Now, it also indicates that there is a Buyer class enum, so basics over gold, platinum. And there is a state enum. Apparently, there's only three states-- they haven't gotten the memo. And there is a tax rate enum. So apparently, each state, of course, has a different tax rate. And so what they want us to do is modify the MapTest Java file, in which case we have our sales transaction and we have where we're ultimately going to print out what it is that we're going to do, but they're asking us to filter the transactions for the following. So there's going to be a couple of filters, looks like there's going to be a map, and then we're going to print out the report.

Let's see if we can print out the report first. So the first thing we want to do is we want to create a stream, so let's get our tList there and let's call the stream method. And then I'm going to end up with the report, so we're going to loop through each one. And in each case, we're going to have an amount. Seriously? Apparently it does not want to do that today. And so we're going to print out something like-- it says that they want Transaction Tax, colon, $% comma, 9.2f%n comma. And then the argument is going to be the amount that we pass in. All right. So for some reason, it doesn't like this. There's the forEach. There we go. All right.

So if we were to run this, of course it's going to output every single one. Apparently it just doesn't want to run for me today. All right, so it doesn't like something. We're on row 11. System.out. System.out.printf. We've got our amount. That's the forEach. "Illegal format conversion." So apparently at this point, it doesn't know what this is because we haven't done the map yet.

All right. Well, that's exactly what we should be getting at this point because we haven't done the map, so let's do the map. Because remember, the map is a new stream that we're going to create, and the map is going to take a predicate in. So let's get the transaction. Apparently, it doesn't like that either, so apparently we're going to have to do the filter first. Sounds fun.

So in the first one, it says that we want to filter transaction from the state of California. So that should be simple enough, right? So t.getState. Make sure it equals State.Ca. And if we do a filter, the second filter says that we want to do what? Transactions for the Widget Pro product. So t.getProduct, I believe, and we're going to make sure that it equals Widget Pro.

So at this point, we should be able to get a map, and we need to have a function. So now we can get the transaction total, multiply it times the tax rate by state, and we are wanting to get the state. And so now we should be able to loop through each one of those. Now that we have it in the map, we're going to take that amount, print out the taxes. And so perhaps in this case, since we want to print this out underneath this, I would assume that means we want this to be here. So let's make it pretty. And at this point, we should be able to actually get something since the map should now give us the appropriate information.

So according to the report, I should have two. Yes, that has $36,000 and $180,000. Excellent. And now what? Copy the main method from MapTest class to the PeakTest Class. And the main method-- so we've done that. So the PeakTest-- then update your code to print more detailed information about the matching transaction using the Peak method. The consumer's provided for you that adds the following. So the last part of this activity is that we should use the consumer that is provided in the PeakTest-- so here's our consumer-- but before we do the map, we want to take a peek and print out some additional information.

So at this point, we're just going to go ahead, add in, look at the Peak, and in this case, it takes a consumer which we've already created-- or was created for us in this case-- to output the transaction ID, the buyer, and the transaction total. Now, I would have done this slightly different. So, what the heck-- we'll do that. So that should work for us. So let's run it and see what we get. So in this case, not only do we get our earlier, but we get the ID, the buyer, the transaction amount, and the tax. And it looks like we are getting the exact same results that they are showing in the practice, so this successfully completes practice 10-1.

## 3. Practice 10-2: FindFirst and Lazy Operations - 13m

In practice 10-2, we want to findFirst first lazy operations. So it is assumed that we already have a little bit done here. So we have a couple of Consumers, quantReport that gets us the seller and buyer's name and quantity. We have a stream start that gives us the salesperson's ID, and-- well, the sales person and the ID, a state search that gives us the sales person and the state, and a product search.

So we already have certain things going on here, and so the first thing we want to do is we want to edit the LazyTest Java class to perform some simple steps. So the first thing is-- after the consumers down here where it says, well, we're going to do Widget Pro Quantity in CO-- is we're going to create a filter to select all Widget Pros. So let's see. The object that we're interested in is the list. So we're going to stream it.

And so we're going to pass into the filter the Widget Pro. So we'll go ahead and get product and specifically the product Widget Pro, and that gives us that one. And it also says to create a filter to select transactions in the state of Colorado. So we can do that. And by now, we should know how to do this one. So we get the state. We'll make sure that it equals the state and then specifically Colorado.

So now we should have only the product sales of Widget Pro in the state of Colorado. And then it says to iterate through the matching transactions, print a report similar to the following using the quantReport in the foreach. Well, that's easy enough. So foreach, and then we already have the quantReport.

So what is it that it doesn't like now? getProduct in class sales transaction cannot be applied to given types. Well, that is absolutely true, because you get product needs to equal Widget Pro. So what doesn't it like for the foreach? Takes a consumer of type, which we have. And let's see if we can type it again. I have it misspelled slightly.

That works a little bit better, and so at this point, if we ran this, we now get-- as it shows at least some of this, we get 20,000, 6,000, 20,000 for Betty and Dave. Looks like we are having some problem with our quantReport because we don't have a dollar sign in front of the quantities, so let's fix that. And probably would have done this a slight bit different if I were doing it, and since we are in the middle of the product, why not?

So the sales person, of course, is an S, but looks like it's going to take up 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11-- let's give it 14 spaces, and let's already add the buyer up here. And the buyer name would also be S and 1, 2, 3, 4, 5, 6, 7, 8, 9, 10. Let's give them 14 spaces as well, and then we will talk about the quantity.

If we're going to do this, might as well make it look right. So let's see what we have here. So if we go ahead and run this, it should run the same way, but now it's a little easier for us to look at.

I would prefer, however, that our quantity is to the left. So to do that I'll do that and run it. That looks a little bit better.

So with that in mind let's tackle the next part. So it says perform the same search in the previous step, but this time use the Peek method to display each step in the process put a peak method call in the following places. So basically right after the stream, after the first filter, and after the second filter.

Well, no sense in retyping this since we can just as easily copy some of this. So we have that, but now it's saying that we want to Peek here, and we don't want a parallel. We want a Peek, but how does the Peek look?

Well, we already have a consumer up here called Stream_start that we've already got, so no sense in wasting that. And let's see. The TransactionID is what? TransactionID is along. So that should give us a Stream_start, so at this point, it should print out what we have at that point. They then wanted after each filter.

And so we also have the-- well, let's see. The first one would be the Product Search, so let's make the Product Search a little nicer. Print out Product Search. Well, that's about as nice as you can get, and we'll do the same thing here.

So at this point, we have a Peek after the Product Search and then before the foreach. Now, in this case, it should probably give us exactly the same thing we had, but this would be what? The stateSearch. And we're still going to print out based on the quantity report, so let's go ahead and run this and see what we got.

So we ran the first search, got the same thing, but now we have in the Stream_start-- notice that we have three. For the stateSearch we have Betty meets our state, and then Betty also, of course, is the stream. We have a state and a Stream_start of Dave and a state again on Betty. And then we see Samuel, but we didn't do it.

So notice that we didn't do anything with Jane. We didn't really do anything with John, but Betty came along and matched the criteria, so that was passed through to both the stream and the state. So gives us a little look at what's going on. Looks like our Product Search, however, doesn't have the appropriate per set. So it looks like we need a new line feed there to make that look better, and here. | So it looks like we got the results we wanted-- not quite formatted the way we want yet, but we'll take care of that on the next run.

So it says copy the code from the previous step so you can modify it, so that's easy enough. So we're going to do it down here, but we want to add the following code. So we want to use an Optional that apparently we're going to call ft. So that would go here. So Optional that takes a-- what is it? Sales transaction. And we're going to call it ft. And so that's going to be populated by our stream.

And then we're going to write an if statement to see if the ft. Is present. So if ft is present, this is what I want. Option-- not an option. It's an Optional. And then in the final one, we are not looking for a foreach. We're actually looking for the findFirst. So either we have a first or we don't. If we do, we're going to populate the FT, which now means that we should be able to get the is present. And if that's the case, we're going to then call our quantity report, call the accept method, and we're going to pass in, but we don't actually get it until we call the get.

Looks good. So let's see. Your output should look similar to the following. So let's go ahead and see it. So in the previous example, we now have a better look so that we have our Product Search or Stream_search, et cetera in situations that actually met. It goes through the entire process. And those that don't, it doesn't.

And then in this final case, it looks like we get the appropriate information. Betty is the first one that matches, and so it outputs the first one that matches all the criteria. So that is the findFirst, and that is the conclusion of practice 10-2.

## 4. Practice 10-3: Analyze Transactions with Stream Methods - 8m

In practice 10-3, we're going to analyze transactions using stream methods. So we want to count the number of transactions, determine both the min and max values in the collection for transactions involving Radio Hut. So in this case, we're going to open up our practice.

So we're going to open up our practice, open up our Radio Hut test. And we're going to perform the steps. So we're going to the stream Lambda Expressions to print out all the transactions involving Radio Hut.

So we're going to use a filter to select all Radio Hut transactions. And then use the Radio report consumer to print the matching transactions. And your output should look like what's in the book.

So Radio Hut transactions-- we'll start with, of course, the list. So in this case, we will do a list. And we need the stream method. But we only want elements that are from Radio Hut.

So we'll go filter, I'll identify a list. And in this case, we want the buyer name equal to Radio Hut.

All right, so at this point we should have all of the transactions from Radio Hut. And then it says that we're supposed to print it out. So in that case, we can do a For Each and pass in our radio report. And that should output the appropriate transactions.

Let's go ahead and run it, and see if we get what they say. In the book, it says we should get one, two, three. And we got one, two, three. So that looks really good.

So now that we have the Radio Hut transactions, then it says we want to know how many transactions that is. Well, we could count them there. But apparently, we want to programmatically do that. And we want the largest and smallest.

So I'm assuming the largest would be the seller Jane Doe, and the smallest would be Betty Jones. But let's do this programmatically. So the first thing we're going to do is we want a total.

So in this case, we're going to take our total, and we'll call it T count. And in this case, we already have this part, so no sense in changing that. But how do we get account? We tell it that's what we want. And so that should give us the count of transactions.

How about the largest transaction? The largest transaction would be-- well, it potentially might not be there. So let's use our optional, and let's see, what do we want to call it? They don't really say in the book, so we'll just make it T Large.

And we're going to set that equal to-- pretty much we can use the same stream. But in this case we want the largest, so that would be-- OK, T List Stream filter-- why doesn't it like optional? There we go, works better.

And let's see, what are we passing in here? Well, we want a way to compare. And according to this, the comparison is going to be the comparator. And we're going to use the Comparing function.

And so what are we going to compare? Well in this case, we're actually not going to compare. We're going to use the Sales Transactions method, get transaction total.

All right, so that should give us the optional. But the problem is that we don't know whether the optional exists or not. So we can say if T Large is present, then what do we want to do. Well, if it's present, then we want to do the Radio report.

Radio report has an accept method, and what does it accept? In this case, it'll be our T Large. But we need to retrieve it. And so that should give us the largest transaction, the max.

The nice thing is that for the most part we can do exactly the same thing. The difference is of course, we can't use the same name. So in this case, we're going to choose T Small, T Small, T Small.

And instead of using the max, we want the smallest-- or the min. And if we format that, that should be the appropriate information to get the count-- the max and the min. Now we've already seen that our bet should be that the max would be Jane Doe, and the min should be Betty Jones, and that there should be a count of three. But let's see.

All right, so let's see. Total transactions, I don't have an output. At least I don't think. Total transactions, Radio Hut largest-- I guess we just never actually output it, so we'll do that. There we go.

All right, so let's try this again now that we've actually told it. All right, so we get our three transactions. We said the Jane should be the largest. We said that Betty should be the smallest. And they are, so we got the results that we were expecting from the practice, which concludes practice 10-3.

## 5. Practice 10-4: Perform Calculations with Primitive Streams - 7m

 
In practice 10-4, we're going to perform calculations using primitive streams. So first of all, we want to calculate the sales totals and average units sold from the collection of sales transactions. So first of all, we're going to open up our project. And we're going to open up the Calc Test class. In this, we need to calculate the total sales for Radio Hut, Price Co, and Best Deals, and print the results. And according to this, we don't have any consumers. So apparently, we want to just print them out using a print F it looks like.

All right, so in this case, our double here is going to start with our list. So let's go ahead and get our list. Cast it as a stream. Filter it. And filter based on-- let's see, we wanted the Radio Hut. So let's see, that would be get the buyer name. Make sure it equals Radio Hut.

And then, we want map it to a double. And they give you that in the book. So map to double with the appropriate-- let's see, t.get transaction total. And then, once we have that, then we want to sum them.

All right, so at this point, Radio Hut total should be-- and then, it's going to output a frame for us. All right, now, the nice thing is is that the rest of this we can copy and just change the name of what we're looking for, so Price Co and Best Deals. Although, it does help if we don't have extra semicolons.

All right, so at this point, looks like we are doing well. But now, we want the average unit count. So while we have an optional double called A1, instead of A0, we do want to have appropriate results. I'll copy to this point anyway.

So in this case, instead of the buyer's name, we want the product, so t get product. And it says that the product that we're interested in is Widget Pro. So that should give us our filter.

And again, we're going to map to double on that. And pass in the get unit count. And once we have the unit count, apparently, we want to pull the average.

So what am I missing here? I tend to do that, don't I? Equals, much better.

All right, so in this case, our product is Widget Pro. We get the unit count. We're going to get the average of the transactions. And that will output it. It looks like with no return.

All right, now, the other one will be exactly the same, except for we are wanting-- we didn't want Widget Pro, did we? Let's try this again. Yeah, I did want that.

So we want the Widget Pro, but I thought the other one wanted something else, so Widget Pro and Widget. Well, in that case, then, this is exactly the right thing. But up here, apparently, we don't want--

Well, that's not what it says. It says Widget Pro here. And it says Widget here. So all right, we'll take it that way.

We also don't want the zero. And looks like everything is looking at design time like it's good. So let's go ahead and run it and see if we get the same results as the practice. So the transaction totals has Radio Hut, Price Co, and Best Deals, average unit, 21,143 and 12,400. Looks like we got the right results. So in that case, that is the successful end of practice 10-4.

## 6. Practice 10-5: Sort Transactions with Comparator - 7m

In practice 10-5, we are going to sort transactions using a comparator. In this case, we want to use that to use both the comparator class and the comparing method and the sorted method-- not sordid as in dirty, but sorted as in order.

So in this case, we're going to bring up our project. We will open up the Sort Test Java file. And you'll see in that file three different places-- so Price Co transactions, Price Co transactions reversed, and triple sort transactions.

So according to this, we want to use streams and lambda expressions to print out all the Price Co transactions by transaction total in ascending order. The sorted method should look something like this. And then use the trans report variable to print the results.

All right. Simple enough. So let's create us a stream first. So that is our data source. And of course, we will call the stream method.

Now, once we do that, we do want Price Co transactions. So we will apply a filter. And we should be getting pretty good at the filtering part, anyway. So in this case, we want the buyer's name. And in this case, we want it equal to Price Co.

All right. So at this point, we only have elements that are for that particular buyer name. And then it says that we want to use sorted. And it fortunately enough gives us that information.

So let's see. We're going to use the comparator, using the compare ring method. And specifically, we are going to use a method from sales transaction called Get Transaction Total. And then once we have that, what are we supposed to do with it? We're supposed to print out the results using the trans report.

So we know how to do that, at least if we put it in the right one. And that should print out the transactions. So while we're at a good stopping point, let's go ahead and run that. And it does seem that we are getting the results so far that we expect.

So let's then say, all right, well, what if I want the transactions reversed? Well, we still want Price Co and we still want the transaction total. The only difference is that now we want it to be reversed. So I'm just going to copy this entire thing down here.

So what we need to do? Well, in our comparing, right here between the two, right before we end that section, we're going to use the reversed method. And it should print out in descending order as opposed to ascending order. It looks like it's working well, so let's see what we can do about the third one.

So we're going to print out all the transactions sorted using the following sort keys. So we want to sort on buyer name first, then sales person, then transaction total. OK. Now, in that case, it looks like we are using similar syntax. So no sense in reinventing the wheel.

But in this case, once we have Price Co, we have our sorted. We have a comparator, et cetera. We're not doing it in descending order this time. So we'll get that.

And we're not doing a sales transaction first. We are doing sales or buyer name. So Get-- is there a buyer name? Yes, there is. So that would be our first one.

And then we're going to use comparing. And we want, of course, the sales transaction. And we want the salesperson name. And then we want to compare and same. And in this case, we want the transaction total.

And so now, we are sorting by buyer then by sales person then by transaction total. And then we're going to print it out. According to this, that should be the entire thing. So let's go ahead and run it and see if we get the results based on what is in that.

So I have Dave Smith and John Adams. Now, if we weren't-- because in this case, the buyer name is the same across the board, because we have Price Co. So what if we took this filter out? How would we get a different result?

Well, we should. So let's see what we have. All right. Well, on this case, notice that now buyer is in alphabetical order. But when the buyer is the same, then our seller-- now, in this case, seller is the same, so then by amount.

But down here at Price Co, we are by seller and then by amount. So it looks like we've gotten the results that we were expecting. And that concludes activity 10-5.

## 7. Practice 10-6: Collect Results with Streams - 3m

In practice 10-6-- practice 10-6, we actually have to be looking at what we're looking at-- we're going to collect results with streams. So in this case, we're going to use the Collect method to store the results from a stream in a new list. So sounds good, how do we do that?

Well, we're going to filter the transaction list to include only transactions greater than 300,000, sorted in ascending order. That sounds pretty easy. So here's where we're going to do this. So we're going to create a list based on the T list. So I'm going to stream the list.

And we did want to filter it, so we'll filter it where the transaction total is greater than 300,000. So once we have the filter, it says we wanted to sort based on a comparator. And what do we-- transaction total. All right, so comparator, so that would be the sales transaction, something like that. And we already know the Get Transaction total.

All right, so at this point, we have sorted transactions that are greater than 300,000. And we want to collect them into a list. So we can collect.

And in this case, the R list is actually a list type. So we will use the collectors to convert it to a list. All right, so at this point, we should filter our transactions, sort them, collect them into the R list. And apparently it's going to print out each one in turn. So let's see if that happens.

All right, so in this case, it looks like we are going from smallest to largest. And that's exactly what it is, every one of these is greater than 300,000. So we have successfully completed practice 10-6.

## 8. Practice 10-7: Join Data with Streams - 3m

In practice 10-07, we're going to join data with string. So we're going to use the joining method to combine data returned from a string. So in this case we still have our tList. And we're going to edit the join test class to perform the steps in the practice. So we want to get a list of unique buyer names in a sorted order. Foloow these steps to accomplish the task.

So the first thing is we're going to use a map to get all the buyer names. All right, so if our result is here, we will use the tList for that. And of course, we're going to use the stream method. And then it says here we want to get all the buyer names. So in that case, we want only certain things. So we will call the map and get the buyer names, all right?

So that gives us an output of just buyer names. And it says we want to use distinct. And so we can use that method. Then it says use sorted to sort the names. It's assumed in natural order. And use joining. Now, joining is not done here. It's actually using the collect. And we would use the collectors to do the joining.

All right, so what are we doing? We want a character sequence, because we want a comma space between each of these. And that completes what we're asked to do. So when they're complete, your output should look similar to the following. So in this case, it should say buyer list colon. And then it should output each of the different buyers in alphabetical order.

So let's see if that's what we get. All right, so Acme, Best, Great, Mom and Pop, PriceCo, Radio-- looks like it's in alphabetical order to me. So that successfully finishes practice 10-07.

## 9. Practice 10-8: Group Data with Streams - 7m

In practice 10.8, we're going to group data with streams. So in this practice, we're going to create a map of transaction data using the grouping by method from the collectors class. So first of all, open up the practice. We're going to edit the group test Java file. And in this, we want to populate the map.

So in this case, the T map here. Populate the map by using the stream collect method to return the list elements grouped by buyer name. All right. So let's go ahead and do that. So T map equals-- we'll get it from our list. We're going to stream. And we're going to use the collect method.

And in this case, we're going to use the collectors to group by. So grouping by. And specifically, it said that we wanted to group by the buyer's name. So once we've done that-- so that will populate the map with-- well, the buyer's name will be the key. And the rest of the transaction information will be the value.

And so then it says to print out the results using the print summary method of the sales transaction class. All right. So since we already have a T map to do this, nothing says we can't just loop through each one of those. And we're going to pass in a key and a value. So that will be our map.

And so in this case, we are going to-- I hate it when it does that. We're going to print out-- let's see-- the buyer's name. So let's see. Does it even show us? Oh, it shows it on the next page there. So we want the buyer on a new line. And so we're going to pass in each buyer's name. It looks like we need a couple of things going on here.

So I'm going to go ahead and print out the buyer. And I'm also going to print out each one of these. So we use the sales transactions print summary method, is what they said.

So what do we have? We're expecting another one. So let's give it what we would want. All right. So why is it not giving it what it wants? All right. So we've got that. It's matched to that. We've got that, and it's matched to that. Ah. Because actually, this needs to go down here.

OK. But that's inside. Yeah. That's right. All right. That should be right. All right. That's what we want. All right. So at this point, we should be able to get the results that are on page 27 in the book. So let's check it out. Apparently not. All right. So what do we have going on? Missing formatter on line 24 of the group test.

So we'll take a look at that. All right. So blah, blah, blah. Missing format operator. That calls the hashmap, which gives us the print screen. So it doesn't know what that is. Ha. Well, it doesn't know what that is because I have my parentheses in the wrong place. All right. Good place.

All right. So that's how you would-- how you could troubleshoot that. But here we go. This is what we were really looking for. So it looks like we are going to buy each buyer. So we have Price Co. It looks like it would be nice, however, if we also put it at the end. And then we're going to put out each sales transaction.

So it looks like we've got this right. So Price Co is first and has the different sellers, Acme Electronics, Radio. All right. It looks like we got the results that we were supposed to get with activity 10.8. And so this completes the practice.

## 10. Skill Check: Lambda Operations - Score 80% or higher to pass

Skill Check: Lambda Operations

View Skill Check
