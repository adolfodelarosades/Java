# 4: Generics and Collections

1. Generics and Collections - 16m

## 1. Generics and Collections - 16m

Section 3, Generics and Collections.

Question. Can you fill in the blanks? The output is First number, 1.

Answer. The highlighted text is there. You can substitute a type parameter with a parameterized type. And so the parameterized there is Box integer.

Question. Two of the test methods cause compilation errors. How do you fix them?

Answer. So we'll go through each of these test methods. So right now we have test1, List question mark. Question mark matches any type, including Object and null, and including class C.

test2, question mark extends IntB, matches IntB at any subtype of IntB. Class C implements IntC. IntC extends IntB , and so C is a subtype of IntB.

So there's an error in test3. Question mark super E, this matches E or any supertype of E. D is not a supertype of E. E implements IntD. It does not extend D.

The correct answer would be question mark super F. D is a supertype of F. F extends D.

test4, U extends IntB. U can be IntB or any subtype of IntB, so C implements IntC. IntC extends IntB, so C is a subtype of IntB.

Here's another error. For test5, U extends IntB and D. U must be a subtype of D and IntB. If one of these bounds is a class, like D, it must appear first. So the correct answer would be to exchange the positions of D and IntB.

Question. What's the difference between ArrayList, TreeList, and TreeMap, or what happens when you print the elements of these collections in order? In this case, we're using that Stream API to populate an ArrayList, TreeList, and TreeMap, and to print them out.

Answer. So we notice that for the TreeSet, the numbers are in order and there's no duplicate numbers. However, in ArrayList and ArrayDeque, the order of the numbers is preserved.

So here are some differences between ArrayList and TreeSet. In an ArrayList, duplicate elements are allowed. In a TreeSet, no duplicates allowed.

ArrayList elements are not ordered automatically by natural ordering. You have precise control overall where in a list each element is inserted. In a TreeSet, elements are ordered by their natural ordering or by a comparator provided at set creation time, depending on which constructor is used. In an ArrayList, you can access elements based on their numerical position. You can find the location of the first occurrence of a specified element. And in a TreeSet, you cannot access elements based on their position in the set, nor find the location of a specified element.

Here are some deque methods. So with a deque, you have a lot of flexibility of inserting, removing, and examining elements at the beginning or at the end of the deque.

Question. How would you make this code compile and run?

And here's the answer. The Map interface is not a sub-interface of Collection. Maps are not iterable, nor do they have the Stream method. To iterate over a map, you must use a collection view. This example calls entrySet, which returns a set of key value pairs contained in the map.

The Map interface provides a small nested interface called Map.Entry, the type of the elements in this set. So we could look at the highlighted text. We have a lambda expression, so we take the col5, call entry.Set on it, which creates a stream of elements. Then we do forEach on them. And for each of these elements in the stream, which is an element of Map.Entry, we print the key and the value of each element.

And here is a summary of what I said about maps.

Question. Reconsider the StandardPlayingCard class, but with the following code and output. How you can sort a list of StandardPlayingCard elements by rank, irrespective of suit?

So here is the output of the code excerpt we see here, king of spades, two of spades, king of hearts, ace of diamonds, jack of diamonds. So these cards are being sorted by suit first, then by rank. And check out the highlighted text. Collections.sort, myDeck, so all the cards are being sorted as specified in StandardPlayingCard.

Answer. You implement the Comparator functional interface with a lambda expression. This interface compares its two arguments for order. It returns a negative integer, zero, or a positive integer if the first argument is less than, equal to, or greater than the second. So we could call the sort method as follows, the lambda expression subtracts the values of the ranks of the cards. And so we have the output. Everything is sorted by rank, irrespective of suit.

So here are the differences between the interfaces comparable and comparator. Comparable compares itself with another object. It's used by collections to sort objects and it specifies default or natural ordering. So StandardPlayingCard implements comparable.

Comparator compares two objects and enables collections to sort objects in an order other than the natural ordering. So we demonstrated this in the previous slide.

One thing you could do is to improve readability, you could use a Comparator.comparing method instead. So we have Comparator.comparing and the lambda expression a at a.getRank. And then we could replace this lambda expression with a method reference, StandardPlayingCard getRank. And method references will be discussed later.

Question. How do you complete the code to get the desired output? So what we want is the average price per kilogram for Canadian produce. And we have a Produce class here, which stores the produce's name, price per kilogram, and country of origin.

Inventory contains a list of produce items. We have a banana, an apple, and a fiddlehead-- or fiddleheads. It should be plural. And the apple and the fiddlehead, they both come from Canada.

Answer. So we have a stream pipeline that calculates this. So what we do is we create a stream from Inventory. We filter these results and take only those that come from Canada. We get the price per kilogram from these elements. We compute the average of these elements. And we get this value as a double value, and so our output is average price per kilogram for Canadian produce, $2.63.

So here's our pipeline again. And this slide will discuss what a pipeline is in more detail. A pipeline is a sequence of aggregate operations. It consists of a source. This could be a collection, an array, a generator function, or an I/O channel. The source is Inventory, which is an instance of list Produce.

Zero or more intermediate operations. An intermediate operation, such as filter, produces a new stream. Filter and mapToDouble are intermediate operations.

A stream is a sequence of elements. Unlike a collection, it is not a data structure that stores elements. Instead, a stream carries values from a source through a pipeline.

And a terminal operation. A terminal operation, such as average, produces a non-string result, such as a primitive value, like a double value, a collection, or in the case of forEach no value at all.

Method references are compact, easy-to-read lambda expressions for methods that already have a name. You can use a method reference where you can use a lambda expression. There are four kinds of method references, reference to an instance method or a particular object, reference to an instance method of an arbitrary object of a particular type, reference to a constructor, and reference to a static method. The following slides will discuss the first three.

Question. Reconsider the Produce class, but with the additional code ComparisonProvider. How do you sort a collection of produce elements by country of origin?

Answer. Collections.sort inventory and the method reference myCP compareCountry. So this is the example of a reference to an instance method of a particular object. Its structure is the name of the comparing object, a double colon, and the instance method name. The containing object is myCP, an instance of ComparisonProvider.

The instance method name is compareCountry. You could replace this method reference with a lambda expression. And in this case, we have the formal parameters a, b, and the body a.getCountryOrigin compared to b.getCountry Origin.

The second argument for the sort method is not an int, but an instance of Comparator. And there is Comparator as a formal parameter of sorts. Comparable, as we've seen before, is a functional interface. And the parameter and return types of compare match those of the instance method named compareCountry, so we can use compareCountry as a method reference.

So here's an example of number two, the second type of method references, a reference to an instance method of an arbitrary object of a particular type. So the example here is Collections.sort myDeck Comparator.comparing StandardPlayingCard getRank. So this is sorting playing cards by rank, irrespective of suit. The containing type is StandardPlayingCard and the method name is getRank.

You can replace this method reference with a lambda expression, as we've seen before, a to a.getRank. The argument for comparing is not a Rank enum, but an instance of Function. As we see here, in method signature of comparing, we see the Function there. And Function is a functional interface, so that means we could use the method, the instance method getRank in the class StandardPlayingCard as a method reference in this context.

The third type, reference to a constructor. So we've seen this before in the code sample that's comparing different kinds of collections. So we have our list of integers. And we're putting that into an ArrayList. And the method reference here is ArrayList, double colon, new.

This ArrayList, double colon, new method reference could be replaced with a lambda expression, empty set of parentheses, to new ArrayList Integer. The argument for toCollection is not an ArrayList but an instance of Supplier. And as we see in the toCollection method, it takes a Supplier and Supplier is a functional interface.

So here's a summary of advanced class design. Generic classes, we looked at type parameters and parameterized types; wildcards; the collections ArrayList, TreeSet, and ArrayDeque. To iterate over a map, you must use a collection view. You can use an entry set.

A comparable compares itself with another object. It's used by collections to sort objects and it specifies a default or natural ordering. Comparator compares two objects. It enables collections to sort objects in an order other than the natural order. A pipeline consists of a source, zero or more intermediate operations, and a terminal operation. And you can use method references where you could use a lambda expression, and there are four kinds.
