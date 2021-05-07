# 6: Java Stream API

1. Java Stream API?. Part 1 - 2m
2. Java Stream API?. Part 2 - 9m

## 1. Java Stream API?. Part 1 - 2m

So the streams API was introduced in Java 8, and it gives developers the ability to express operations on an aggregation of data as a single operation. So if you have a collection or an array, instead of stepping through that array with a loop and operating on each element one-by-one, by using a stream you can operate on the entire array as a single operation. And the link to lambda expressions is that those operations are expressed in the stream API using lambda expressions. So now once you've gotten to this idea of doing an aggregate operation on a whole bunch of elements all at once, that's an easy lead in to parallelism. And so you can easily express parallel streams operation using the streams API and then take advantage of multicore machines that are becoming more and more popular these days.

## 2. Java Stream API?. Part 2 - 9m

Section 5, Java Stream API. Question. What is wrong with this statement? Answer. For each is a terminal operation, but peak is not. It is an intermediate operation.

So we could change for each to peak. And we'll get the expected output. It will print out the prices of the elements of the stream before it computes its average.

So here is a list of other methods that extract data from an object, such as peak and map. And it also includes printed versions of the map method. Here are other methods that search for elements in a stream. So the first one, findFirst, find the first element, findAny, and a bunch of other methods that find certain elements in a stream.

Question. What's wrong with this code, and how do you fix it? Answer. The code throws a NoSuchElementException. To fix it, you check if the value returned, which is actually an optional double, contains a value before calling getAsDouble. So in this case, we call the last statement there. We call the method isPresent. And if it's true, then we finally call the method getAsDouble.

So here are other methods that use the optional class. So getting the maximum value and getting the minimum value, and reducing a set of elements into one value with the reduce method.

There are many stream data methods that calculate specific values or group elements into a collection. We'll focus on the Collect method for the next several slides.

So here's a simple use of the Collect method. And we've seen this before. Convert collection to another kind of collection. So we have a list of integers. And then we'll convert it to a tree set. And we've seen this before.

Question. How do you group Produce instances by country of origin? Here's the answer. This stream returns a map. The keys are the countries and the values are lists of produce that belong to the key, which is, as I said before, the country.

And let's work a bit backwards now. So we have collector is groupingBy. So it will group produce elements by their country of origin, which is specified by the method reference Produce::getCountryOrigin.

Question. How do you compute the average price of produce that come from the same country? Answer. So the following stream returns a map. The key is the country, and double is the average price of those products that come from the specified country.

So we have the same groupingBy method. This groupingBy method takes two arguments. The first argument is a method reference getting the country of origin. And the second one computes the average value of the data being retrieved, which is the average price, which is specified by the method reference Produce::getPricePerKg.

Question. How do you group names of produce by country of origin? Answer. So this stream returns a map. The first key is the country of origin, and the values are lists of produce names whose country of origin corresponds to the key.

And we do this through the Collectors Mapping method. The first argument is a method reference that retrieves the name of produce elements. And the second element puts these strings into a list.

Question. How do you partition produce between inexpensive, less than $2 per kilogram, and expensive, more than or equal to $2 per kilogram? Answer. This stream returns a map. The key is a Boolean value. So there's going to be only two keys, true or false. And the value is a list of strings that correspond to whether it's inexpensive or expensive, or basically that satisfy that Boolean statement that you see in the fourth line.

So we have the method partitioningBy. The first argument is a Boolean statement that returns true or false. And the second, as we've seen before, Collectors Mapping, which will take the name of the produce and then collect them into a list.

Question. How do you sort a stream of elements, such as a stream of produce elements? Answer. We just call the sorting method. And we use as an argument Comparator to specify how we want these elements be sorted. Note that you could use sorted with no argument or void only if produce implements comparable. And we've seen how to implement comparable before with standard playing card.

We call the following statement that groups produce by country of origin, creating a map of lists. Question. How would you use the flatMap method to print the produce elements in this map?

And so here's the answer. So we've seen this before. Because map does not implement collection, the map interface does not have a stream method. So we have to first call entry step. Then we could create a stream for this. Then we could finally call flatMap. And then flatMap basically does what it says, flatten everything out.

So we're taking a map of what we had before, strings that represent the key to the countries, and a list of produce corresponding to those countries. And then we get the value of the list, which is basically produce elements. And then we, for each, print those produce elements. And so, in this case, we're printing the name and the country of origin for each of these elements.

So here are other flatMap methods in the Stream API. We've seen the first one, flatMap. The other three are convenience methods if you want to map something to a specific primitive, double, int, or long.

And here is a summary of the Stream APIs we looked at-- Peak, Map, mapToDouble, Average, Collect, Sorted, and flatMap.
