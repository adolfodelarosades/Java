# 10: Why Is There A New Date and Time API?

1. Why Is There A New Date and Time API? - 4m

## 1. Why Is There A New Date and Time API? - 4m

So the new date and time API was introduced in Java 8 as a replacement for the old date and calendar APIs that have been around for a very long time in Java. And so those, the old date APIs, have had a whole series of problems over the years.

And, for instance, one thing that made them very difficult to use was it was a single class that tried to do a whole bunch of different things. And the problem was that this class was mutable. So you create an instance of this class and then you could modify it.

And this causes a whole bunch of problems. For example, in a multithreaded environment, if you have different threads trying to mutate the same calendar object, then you run into problems there.

It also caused a bunch of weird, strange corner cases in the APIs. For instance, if you had a date that represented January 31st, you could set the month to February. So now you get a date that says February 31st and that doesn't make any sense at all. But there were some very peculiar ways that that was handled in the old APIs that could cause errors later on in your program.

So the old APIs had a whole series of problems like that and they just needed to-- at a certain point instead of just fixing them up we just needed to replace the entire APIs with a set of new date and time APIs. So the date and time APIs that were introduced in Java 8 were redesigned from the ground up.

And so the first thing is that they're immutable. And so with immutability you avoid error prone APIs that can cause changes. If one party or program mutates an object, it doesn't have any side effects on other parts. Another advantage of immutability is that it's automatically thread safe.

But, fundamentally, the new Java 8 date and time APIs are broken down into much more fundamental, much clearer objects. So if you wanted to have something that represented just the date you have an object for that, or if you wanted to have something that represented just the time you have a different object for that.

You have a third object that represents a date and a time. And then separate from that you have an object that represents a date and time in a particular time zone.

Those are all actually distinct objects and they need to be handled differently. That's something the old API didn't handle well at all and that's been completely solved with the new date and time API in Java 8.
