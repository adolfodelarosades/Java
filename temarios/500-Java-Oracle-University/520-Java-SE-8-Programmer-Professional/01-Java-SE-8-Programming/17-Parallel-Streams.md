# 17: Parallel Streams

1. Parallel Streams - 25m
2. Practice 17-1: Calculate Total Sales without a Pipeline - 4m
3. Practice 17-2: Calculate Sales Totals using Parallel Streams - 5m
4. Practice 17-3: Calculate Sales Totals Using Parallel Streams and Reduce - 4m
5. Skill Check: Using Parallel Streams - Score 80% or higher to pass

## 1. Parallel Streams - 25m

Alright. Excellent job. Let's move forward. In chapter 17 we're going to talk about parallel streams.

Now this should not come as a surprise to you. We've indicated that we've been working with streams all along. And in chapters 8, 9, 10, we've introduced the use of streams. And those streams were sequential.

Now we call those streams pipelines, as well. So they're kind of synonymous when we talk about that. And in this chapter we're also going to be talking about streams. But while sequential is the default for a stream. So in other words, it's going to look at each element in a collection, or each item that is brought in from a file, or wherever we're performing the stream, it does it sequentially by default.

However, in this chapter, we're going to talk about how can we create parallel streams. Now a parallel stream is an extension of what we've just talked about, because under the covers, parallel streams use the fork/join framework. But the difference is that with the fork/join framework there's a lot of boilerplate code, as you saw. And there's a lot of extra stuff going on.

In this case, we will use the syntax that we've talked about using the lambdas, et cetera, to determine all we have to do is say that we want to create it parallel. Now there are some limitations. There are some things we need to consider. But that's what this chapter is about.

So let's go and look at the slides and see the details. So in this case, the objectives are to review the key characteristics of streams. So we're going to remind you of what it is we've already talked about. And we're going to look at what is an old style loop versus using a stream. And we'll also move see the key assumptions that are needed to use a parallel pipeline.

And then we're going to introduce something called reduction. Now reduction, I think of it as an aggregate. You basically have a number of elements that you want to reduce to a single value of some type. So we're going to give you some examples of that.

But we're going to see that reduction requires something called an associative function. So what do I mean? Well, let's say we have 100 numbers. And they can be random numbers. Doesn't matter. But if we want to get the average, we want to get the sum, we want to find the smallest or the largest value, in that case it really doesn't matter in what order we want to look at these numbers. They're going to be the same. The answer will be the same at the end.

And so we could also say that an associative function is also deterministic. And so that's what we're going to be talking about. So we're look at the process. We're going to look at some key performance considerations for parallel streams, because parallel is not always fastest. But there are certain considerations we might look at.

So in the past we saw that a pipeline of course, is multiple streams passing data along. And operations can be lazy. We saw that, for example, if we create a termination that it can shortcut as soon as it has the right answer, or an answer. It can stop. We also saw that we have a source. We have any number of intermediate operations. And then we would also have a terminal operation.

We also identified that we should not use streams to change data. That is a improper use of a stream. And so once elements are consumed, they're no longer available from the screen. And as we've identified before, they can be either sequential-- which is the default-- or parallel.

So with that in mind, let's think about this. Now in the past we have used any number of collections to be able to iterate through the collection. But I want you to think from a point of view of, if I wanted to execute this iteration in multiple threads, how easy would that be?

So in this case we have a list of employees. We're going to look at each employee. We're going to see does that employee come from Colorado? Is that employee an executive? And then we're going to print that out and also sum up the salary of those employees.

Now the problem, of course. In this case is that if I have 1,000 or 1,000,000 million employees in E list, it's going to iterate through every single one of them. So that's the first thing that comes to mind. We could use the exact same situation, but in this case, using a stream.

And in this case, the only elements that even get to this peak to print out are only those that meet the criteria. We don't even operate on any that don't meet the criteria. And then we can always then after we've printed out the summary, we can then create, in essence, a separate collection, which is then something that we could get the salary of, and then sum them together.

So very, very easy. So the code reads like a problem. The focus is not on what I want the code to do. The focus is on what I'm actually trying to do with the data. Now what we haven't talked about is that the operations can be serial or parallel. So that's kind of nice.

Now it is possible for us to of course use the stream class. So rather than what we did before, notice that I create a stream, I instantiate it. Then I can use that stream to filter and create another stream. And then I can use that stream to filter to create another stream. And I can use that stream to peak to identify what I want to work with. And then I can use that stream to find the salaries, and then loop through all of those to get the sum.

This is what we would normally call classic Java, as far as getting the answer. But I can tell you that what we were looking at-- oops, going the other way-- what we were looking at here would process much, much faster. And like I said, this could be done in parallel, where this could not.

So while we could use the stream class, streams are much easier to work with. So when we talk about imperative programming, or classic coding, the code deals with individual data items. It's focused on how we need to write the code. But it doesn't read like a problem. The steps are all mashed together. You might have extraneous details that are coming through that aren't necessary. And as we saw before, it's inherently sequential. We have to iterate through every single element.

Well, in the case of streams, the code deals with the data set. So we're focused on what it is that we are wanting out of the code. The code reads more like a problem. I want those executives. I want those from Colorado. And it allows us to create situations where we don't have to have all of these different variables to hold things. We can create a single variable that we're using. And as we're about to see, the code can be rendered in parallel as well.

So how do we do that? Well, OK. We know how to create a stream. And we know that in parallel it's possible that we could get a better performance, because there's nothing that says that we couldn't use all of the cores on a machine. We can use maps. And as you'll see soon, we'll be able to use the reduce method.

And while we've seen that the fork/join can break up our data into smaller units that can then be worked on multiple threads, we found that that can be a lot of coding underneath the hood. Well, the cool thing is that the stream uses the fork/join under the hood, but you don't have to write the code. All you have to identify is the items that you want to work with, and in the way that you want to work with them.

So of course, data size, decomposition, the packing, how many cores are on the particular computer that you're working on, or server, all of those can affect performance. The nice thing is that with parallel streams, you don't have to worry about that as a coder. The fork/join framework under the covers is going to do that for you.

Now we've always emphasized that parallel is not always faster. There are certain operations that are sequential and should be sequential. For example, if you have a non-associative function. So if it's important that you go from step A to step B to step C to step D, you should not use a parallel stream for that kind of processing. It will probably be slower.

So let's take a look. So how can I create a parallel stream? Now there's two ways that I can do it.

Before, when we had a collection, remember we called the stream of it. If I want to be able to work with multiple cores, and I want to work with multiple threads, all I have to do is say that I want to create a parallel stream. So that's one way that I can do it.

But notice that my intermediate steps don't really change. And for that matter, my terminal methods don't change. Now that's one way.

Now I could just as easily, in this case from a stream, I could have a stream. And then I just identify that I want it to be run in parallel. Either one of these are true.

Now it says here that I can specify parallel or sequential. The default is sequential if I don't put this. But your choice applies to the entire pipeline. So whether I call this a parallel stream up here, or whether I identify that the stream will be parallel at some point along the way, the entire stream will be either sequential or parallel. And in this case, the last call wins. So if I said it's sequential before this, this is actually how it's going to be.

Alright. So the fine print. We've already seen that the pipelines are like builders. They add a bunch of intermediate operations that then will execute. But they cannot branch. You can't reuse the pipeline. We've seen in our practices that if we need to reuse a pipeline, we have to write additional code to do that.

Also, we want them to be immutable. We don't want to modify the source in the middle of the pipeline, which means that it should be stateless. So the parameters must be stateless. You don't access any state that might change. Because if you were to write your code in a way where the state could change in the stream, despite even if you asked for a parallel stream, it's not going to give you one. It will give you a sequential stream. So that kind of gets rid of this idea of you don't want side effects going on.

Alright. So embracing statelessness. So mutate the stateless way. So in this case, notice that I am defining that I want a parallel stream. I only want to see elements where the department is engineering. And then I'm going to go ahead and collect those that meet that criteria. I'm going to collect that into my list.

And in this case, here's my list. This is stateless. It is part of Elist. I have not changed that particular list. I'm actually creating an additional or a new list if I want to change things.

On the other hand, notice that in this case I'm basically saying, well let's add an element to new list. Well this would be a situation where even though I've called that I want a parallel stream, because I am not stateless, it is going to require that it's run sequentially. So this is not a best practice. And it's not going to parallelize.

Now we talked about deterministic. And deterministic is a situation where if I put in the same arguments, I will always get the same value. So for instance, if I sum all the numbers between 1 and 10, I will always get 55.

So the idea here-- I don't think it's 55, actually. But you get the idea. But you always get the same answer with the same input.

And so when we are talking about streams, we want that kind of thing. So for instance, if we call a stream and we say that the stream is going to be sequential, but I'm calling a sum, it really doesn't matter in what order I add numbers together. A sum is always going to give me the same answer.

So if I run it sequentially or if I run it in parallel, the answer here-- R1 and R2-- is going to be that they are the same. So that's what we are talking about. Now when we say that streams are deterministic, we're in essence saying that they are also somewhat associated.

Now not all streams are deterministic. They don't have to be. And the reason I say that is if I were to look in here-- and notice that I'm going to create an optional from my stream-- and it looks like I want to get an executive, but in this case I'm basically saying, find any.

Well, if I'm doing this on a sequential, it's going to look at each element and find the first executive. But if I'm running this in parallel, I might have multiple threads that are looking for an executive, which means that the first one may not be the one that is found first. In which case, the one from E1 and the one that I get from E2 may not be the same employee. It may. But it may not be. So in that case, it's not deterministic. But we are not changing the state anywhere in here.

Now let's shift gears a little bit. And let's talk about reduction. Now the reason we brought up the idea of deterministic is because in reduction you need to make sure that the function is deterministic.

So an operation that takes a sequence of input elements and combines them into a single summary result by repeated application of a combining operation is what is known as reduction. And it uses the reduce method.

So think about it. Again, if I were to want to do a sum, an average, a min, a max. All of those are aggregates, which means that they would work as a reduction.

Now the cool thing about them is regardless of how I feed the variables in, I will always get the same answer. And so that's what they're identifying here is that if I'm going to add any sequence of any sequence, I could write this sequence as this. My starting value, or my beginning value, is zero. I'm going to have two values, and I want to add those together.

So in this case I'm saying we'll add a one to zero. And then the sum of that I will then add to A2, A3, A4, et cetera. And so this would be a perfect example of a reduction where I'm going to sum a group of numbers.

Now, here's the limitations. If the combining function is associative, reduction parallelizes cleanly. So again, as long as it's associative, as long as it's deterministic, it doesn't really matter the order. So associative means the order does not matter. The result is the same irrespective of the order used to combine the elements. And I've already given you a couple of examples there.

Now if you pass-- and this is the warning in a reduction-- if you pass a non-associative function to reduce, you will get the wrong answer. If order truly does matter, and you pass it to reduce, it's not going to work. It's not going to give you the answer that you want.

So let's give you a really quick example. So notice in this case, I am going to use the rangeClosed method on my internal stream. And rangeClose just basically says, give me all of the numbers between 1 and 5 inclusive. And I'm going to do this in parallel.

So if I call the reduce, I'm basically saying, starting with zero-- so that is my original sum-- here's the value that I want. And here are the elements that I'm going to do. So I'm going to basically add my element to my sum, and give the result of the reduce.

So in this case I have the numbers between 1 and 5 inclusive. I want to sum them all together as part of the reduce. And then go.

So obviously, in the first case, if I add zero to the first element, I get 1. 2 to the first element, I get 3. Well 3 plus 3 gives me 6. 6 plus 4 gives me 10. 10 plus 5 gives me 15. That would be the result of the reduce.

Now what's going on under the hood? Under the hood it really doesn't matter in which order my threads are combining data together. And so the fork/join framework that's working under the hood is going to split it out into however many threads will optimize getting this done. And then it will combine all of those threads back in the result.

And so for example, once again, running it in parallel we're going to add the numbers from 1 to 8. We're going to do a reduction. So in this case, if I'm doing it in parallel, it splits them into two groups. It might re-split them into four more groups.

And so this would be my reduce. Well, it could be that I might add one and two together, and three, and four, and five, and six. So you kind of see how it's going to work that.

And so if it combines the second one there, and the third one. So as we go, it might combine them in whatever order it happens to do. And so we get it. And then we get our final answer.

This would be the idea of parallel execution, where each thread is doing what it's supposed to do, but ultimately it will reduce to the single value. One thing we need to know, and we're emphasizing again and again, is that you can't assume that parallel is always faster. It's not always the right solution. And sometimes it is slower. And that's because the underlying resources may not be conducive to parallel.

And so does the stream source decompose well in a reduction, because of the way we want to work with items. Does it cost more than it's worth? Terminal operations have achieved, or expensive merge operations. Well in the case of adding two numbers, pretty cheap. But in the case of a sort that we were talking about before, well then you have to start looking at how does that combined work.

And so stream characteristics can also be there. And so you could have certain streams that are larger than others. And we've also seen that boxing and unboxing can negatively impact performance. So if I'm working between primitives and reference types, again that can be an issue.

So with that, this last slide here identifies that there are certain considerations that you want to look at. Now any time you want to look at the cost of a pipeline, you need to know how many data elements are we talking about? And then what is the cost per element as it works through the pipeline.

Now N is pretty simple to figure out. We usually know what that is. Q, well not so much. We can estimate it, but we're not really sure.

So if you're going to use parallel, they usually recommended that the number of items has to, or should exceed 10,000. If you're using parallel with less than 10,000, the fork/join framework may choose to just run it on a single thread anyway.

And so if you're using reduction using sum. Not a big deal. It's low cost. It can be done pretty quickly. It may use a single thread.

On the other hand, if you have filters, you have limited operations, if you're working with group by, that makes the cost of each thread higher. But that means that also the higher the cost of the pipeline, the more likely it is to use parallel.

Also, in the testing that I've seen and the reports that I've seen, if you have fewer than four CPUs, you may or may not find reduced time and increased performance using the parallel. So you have to know your hardware to some extent.

But that brings us to the end of parallel streams. But you can see that we've already learned the syntax. Now it's just a matter of looking at the context to see if this is the best way to implement your streams.

And so with that, let's go ahead and attack the three practices in 17.

## 2. Practice 17-1: Calculate Total Sales without a Pipeline - 4m

In practice 17-1, we want to calculate total sales without a pipeline. So we're going to open our project here. And we're going to expand the Project Directories and edit the Calc Test class to perform the steps in the practice. So we want to calculate the total sales for Radio Hut using the stream class and Java statements.

So similar to what we saw in the slides, we want to do it the long way. So we're going to create a stream from t list and assign it to stream sales transaction S1. So I guess we're going to put our code here where it says to. So stream sales transaction, S1 equals t list.stream.

All right, then, we want to create a second stream also using sales transactions. I call it S2. And we're going to use S1, I'm assuming, to filter something.

All right, so let's see. We're going to filter for Radio Hut transactions only, so our predicate will be get buyer name. Sounds good. Let's see if it equals-- see if it equals. There we go. And we want Radio Hut.

All right, so at this point, we should have that one ready to go. And apparently, we need another one. Yeah, there we go.

All right, and so, the next one, create a third stream and assign the results from a map to double method that returns the transaction total. So we want a double stream that we are calling S3. And basically, as we do pipelines, this is exactly what's going on behind the scenes. But we just don't usually have to instantiate them.

So we're going to map to double. And we want to pass the get transaction total. Fair enough.

And then finally, sum the final stream and assign the result to double T1. Well, I guess that's this one here. So if we say S3.sum that gets us what we want.

So based on this, notice that the printout we're identifying that we want to double. So we will run it. And the total is 3,840,000, which is what is also in the book. So it looks like we have successfully completed practice 17-1.

## 3. Practice 17-2: Calculate Sales Totals using Parallel Streams - 5m

Practice 17-2 is where we're going to, again, calculate sales totals. But instead of using individual stream classes or stream instances, we're going to use parallel streams. So if we open up our practice and expand the project and bring up the calc test class, it says in number four there to calculate the total sales for Radio Hut, Price Co, and Best Deals.

So for Radio Hut, calculate the Radio Hut total using a parallel stream method. The pipeline should contain the following methods-- parallel stream, filter map to double, and sum.

Well, we kind of know how that goes already. So let's put that here. So of course, we're going to use tList. And it says to use a parallel stream, in this case. So we can do that. And let's filter so that we only get Price Co. Or we only want Radio Hut, I guess, in this case.

And so once we've done that, then we want to get the transaction totals. So that would be a map. And the transaction total is a double. And once we have that, then we're going to go ahead and sum it.

All right. So that should give us the transaction totals for Radio Hut, which were asked for. We also want the same thing for Price Co so rather than belabor the point, I'm going to go ahead and copy the code.

But we are going to have to do some changing, because in this case, they've asked us to use the parallel method, which means we are using a stream instead. Let's see. But we are also using a filter map to double parallel sum.

So in this case, we will-- so what am I missing? Yeah. That helps if you get the right one. And So we're going to add in a parallel. So we want, of course, Price Co here. So we are filtering on Price Co, mapping the transaction total, doing it in parallel, which will make the entire stream parallel like the first one. And then we'll go ahead and do a sum.

And then for C, calculate the best deals total using the sequential method. The pipeline should contain the following methods-- filter map to double, sequential, and sum. Well, in that case that's very similar to this one, so no sense in reinventing the wheel. The only thing is we want to change this to a sequential one. And we want to make sure that we are summing best deals instead.

Everything else, I believe, is exactly what they've asked us to do. So if we print these out, we will get the same results they have indicated in the book, which means that we have successfully completed practice 17-2.

## 4. Practice 17-3: Calculate Sales Totals Using Parallel Streams and Reduce - 4m

In practice 17-3, we want to calculate the sales totals, similar to what we've done, but this case, we're going to use parallel streams, and we're going to use the reduce method. So again, let's open up our practice, open up the calc test class. And in this case, number four, calculate the total sales for Price Co using the reduce method instead of sum. All. right.

So at this point, we're going to kind of miss this. So we're going to take the list. We're going to do a stream. We're going to filter on the company. We're going to identify that we want the buyer to be Price Co.

And once we have the filter, it says to map to double. And in that case, we want to get the transaction totals, of course. And so once we have the transaction total, it says that we want to run this in parallel. Simple enough. But instead of using the sum like we did before, we want to use the reduce, giving our identity and our binary operator.

So in this case, we're going to start with 0. And we're going to do sum, pass in both sum and E. And what do I want to do with that? I just want to add them together. So with the reduce, we're going to start with 0 and take each element one at a time. And then since the map to double only has the transaction total, it's going to just continue to add each of those together one at a time and output it as Price Co's total.

Now, in C, in addition, calculate the total number of transactions for Price Co using map and reduce. All right. Now, the cool thing about that is it's very similar to what we've already done, just a couple of minute changes.

So we'll take the stream. We'll filter on Price Co. We're still going to get the transaction total. Actually, we don't want to do the transaction total. We want to count, right? So in this case, a count would be an integer.

So we're going to get one for each. So in other words, for each transaction from Price Co, we're going to just count 1. And so then it's just a matter of adding them together. So we'll start at 0. Each transaction will be passed in as a 1. We're going to sum the 1 to the 0, keep going until we know how many transactions there are.

So if we have done this correctly, we should be able to run and find that the total transactions are still the same from the previous one, but in this case, there are four transactions, which is what the book tells us there should be. So we have now successfully completed activity 17-3.

## 5. Skill Check: Using Parallel Streams - Score 80% or higher to pass

Skill Check: Using Parallel Streams

View Skill Check
