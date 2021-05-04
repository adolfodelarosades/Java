# 7: Generics and Collections

1. Generics and Collections - 38m
2. Practice 7-1: Counting Part Numbers by Using HashMaps - 15m
3. Practice 7-2: Implementing Stack using a Deque - 9m
4. Skill Check: Generics and Collections - Score 80% or higher to pass

## 1. Generics and Collections - 38m

For lesson 7, we want to cover some additional topics that are going to prepare us for things that are coming down the line. Specifically, the lesson is called Generics and Collections, and so let's talk a little bit about what each of these are. Now a generic is often, when people think of generics, they often think of collections because that's where generics are obvious. But generics are basically a way to-- it's a coding technique so that, basically so that when I create a class, I don't have to type it.

So basically what I'm going to do is I'm going to create a class that will accept any type, and then when I want to utilize it, I'm going to define what that type is at design time. And so it's kind of a coding technique that allows me to wait on types. And I think that that will become much clearer as we look at the slides.

Now a collection, so far we've talked about and worked with an array. Now an array is not a collection. Now the reason why it's not a collection is because an array can contain both reference types or primitives. When we talk about a collection, it is always a reference type. And so collections, when they were first created contained only objects. That was the type. So no matter what specific instance you might place into a collection, it was basically converted to an object.

Now the problem, of course, with that is that that's great going into the collection, but what if I want to pull that now object out? Well, now I have to cast it back to the type it was. Now, collections were hard to work with. And it just involved an awful lot of code. With the introduction of generics in version 5, what we created were collections that we could actually say this is the specific type that this collection will hold.

So for instance, if I was creating a collection that held strings, I could identify using generics that what is going into the collection will be a string. And then that way when I pull it out, I don't have to cast it because it already knows. Now in this particular chapter, we're not going to go in great detail over every single collection that exists in Java because there are dozens of them. However, we will talk about the three main types of collections, basically the interfaces that are implemented throughout.

First of all, we will talk about the List interface. And we will see a list contains ordered items. In other words, as I enter the items in, they are in that order. So very similar to an array in that way. And, like an array, they are also non-unique. There's nothing that says that element zero an element one can't have the same value. So that's the idea of a list. It just gives me the opportunity to put this in. And there is a list called the array list that is very array-like.

The big difference, however, is that a list is always dynamic. You can either add elements or remove elements at any time, unlike an array. Now something that is similar to a list but is slightly different is something called a set. Now a set and a list, we're focused on the value that is being held. The difference is, in a set, it is unordered. When you put something into a set, and it's going to store it however is most efficient to the system. And so you have no control necessarily over its ordering, at least in a basic set.

But it also is basically saying that each value in the set has to be unique. There cannot be any repetition in a set. And so depending on your utilization, what it is that you're working with, you may want to provide a list or a set. Now another one is that if I'm not only interested in a value, but let's say I'm interested in both the index or the key and the value. Well, in that case, we're talking about using a map.

A map is basically a collection that contains both a set of keys and a set of values that are, we would normally call them an associative array in other technologies. Now, in some cases, we've talked about ordering. Well, many of these have implementations that allow us to be able to sort the elements inside of our collections in one way or another.

Now there is a natural sorting. We're not going to really talk about that because that happens naturally, automatically. So we don't have to do anything about that. But let's say that we wanted to make sure that the items that were placed into our set, or our map, or our list were ordered in a specific way. List, not so much. But set, even though it's unordered, there are versions that can be sorted or ordered. In which case then we can use one of two interfaces.

Now the Comparable interface is implemented in the class that I'm planning to sort. So let's say I have a set list, or a set tree, that would be a good example. A set tree is actually an ordered set that also has unique items. So let's say I want to make sure that they're sorted in a particular item. Well, based on what the set tree is based on, in the class of whatever it is that I'm putting into the set tree, I could implement the Comparable interface. And there is a compare method that I would then use as it's going into the set tree.

On the other hand, if I don't want to place it in the class that is being sorted, if I want to create separate classes to make this possible, I could create a class that implements the Comparator interface, and in that case I can use the compareTo method and it would also identify how these are sorted. So that's what we're going to be talking about as we go through the slides. So let's see how that all works together.

So our objectives are that we are going to introduce you of course to generics, to collections of specific types, one of those is the TreeSet that I just talked about. But we're also going to introduce another type of collection called a Deque. Now a Deque is two things built into one. Basically, it acts as a stack, or it can act as a tube. We'll call it a stream. But it'll act like a stream as well. So we'll look at that, and like I said, we'll talk about ways to order these collections as well.

So as we work through this, we've kind of talked about the various topics already at the whiteboard. So let's just get into this idea of generic. So generic provides flexible type safety to your code. Like I said, it's a coding technique that allows you to create classes that are not typed when you create them. Now what this means is that you're going to have your errors at run time rather than at compile time. So that's a good thing.

It also means that your code is going to be easier to read, and once you're used to it, is also very plain and cleaner. Also, remember I said that when you put something in an old collection, it went in as an object, which meant that you had to do a lot of casting or recasting when you pulled it out. Well, generics eliminate that. And so the reason why most people think of generics in terms of collections is because, as it says here, they are heavily used in the collections API.

So to demonstrate a generic, this isn't a great example, but it will give you hopefully the idea. In this case, on this slide, we're talking about two classes that we are creating. But if you were to look at these classes other than the type, that is, that they're dealing with, you could see that in essence they function exactly the same. And so, for instance, in my class on the left, the CacheString, I have a private field of type String that holds a message. I have an add method that takes a String as an argument, returns a void. And then I have a get method that returns a String.

And so in this case, you can see that, well, the CacheString, it's specific about working with strings. On the class to the left, however, we have CacheShirt, so we're going to have a field called Shirt. We have an add method that takes a shirt. We have a get method that returns a shirt.

So if we were to take typing out of these cache classes, you could see that they were exactly the same. Well the problem is is that until generics in version 5, we couldn't take the type out. We had to declare each and every class that was hard typed. Well, this slide represents how we could represent both of those particular classes with a single class. And for that matter, any other class that we needed to have those two methods and a field could be represented by this cache in a class.

Now notice that here there is a diamond-- and that's what they call it-- there's a diamond after the CacheAny that has a capital T. Now the capital T does not have to be there, it could be any letter that you wanted to. But, from a best practice standpoint, we usually use a capital T for type. We use a capital E if we're talking about a collection, for example, and we want to type an element, we would use a capital E.

In the case of maps where we have key value pairs, we would use a capital K and a capital V to represent the type of key, the type of the value, et cetera. And if there are more types that we need to work with, we will usually use S or U, et cetera. That is the best practice. But, again, is not required.

Well the cool thing is is that if I am working with this generic class, for example, on this particular code, notice that on line two and line three I'm using those specific classes before, so we're creating an instance of both CacheString and CacheShirt. These are hard typed classes. But on lines six and seven here, notice that I am doing, in essence, the same thing, but in this case, the class is not hard typed. I'm using the generic class and identifying that my generic message is going to hold a string, where my generic shirt is going to hold an instance of a shirt.

But, when I call it, so on line nine, of course, I am using the instance of my message instantiated on line two. On line 10 I'm using the instance that we created on line six. And in both cases they would, well, they would actually do exactly the same thing.

And so the idea of a generic is, like I said, it's a coding technique that allows the developer when they need to use the class to identify what type or types they're going to be working with. Now, when it comes to the syntax, as of version 7, there's no need to repeat the types on the right side of the statement. So, for instance, in this case, when I declare CacheAny that it's going to be of type String, or that's what it's going to cache, then, when I say new CacheAny, I can just represent empty diamonds because, as it says here, it will indicate that the type parameters are mirrored.

So this does simplify generic declarations a little bit, saves you a little bit on typing. But it still has the same effect of the previous code. Now, shifting gears slightly, although collections do use generics, a collection is a single object designed to manage a group of objects. Like I said, a collection is similar to an array in that it can have multiple elements but have one variable name. And just like with an array, objects in a collection are called elements. But, unlike an array, primitives are not allowed in a collection.

So various collection types we're going to be talking about deal with a stack, "queue" is the word that I was trying to think of earlier, dynamic arrays, hash tables, et cetera, are various things or collection types that we might use. And as I indicated, it uses generics a lot. So, for example, here is how each of these different collections work together.

Now notice that both my list and my interface both extend the collection interface, and so they have very similar methods. In the case of the set, which, remember, I said was an unordered unique list. For example, the hash set would create a list that is unordered, but has to have unique elements and each element has to be unique. But notice that I can also extend the set into the sorted stat. So in the case of a tree set, it is both ordered and all of the elements have to be unique.

On the other side here, where the interface, the list has many of the methods of a collection, but in the case of a list, is an ordered list, but the elements don't have to be unique. And so a linked list or an array list are examples of specific concrete collections that you can use in that way.

And then, like I said, a map is a completely different interface altogether that we'll talk later. So for instance, when we talk about different interfaces, there are four of them. The deque would be the fourth interface. And there are specific implementations that you can use that are some of which are listed here.

So let's talk about a list. Now a list defines generic list behavior, and like I said, is an ordered collection of elements. But the list of behaviors include adding elements at a specific index, retrieving an element based on a specific index, removing an element based on an index, or overwriting the value of an element based on the index. And there's also the ability to get the size of the list. But a list allows duplicate elements. So you can put the same information in multiple times into a list.

So, for example, the ArrayList, for example, is an implementation of the List interface. Now the List will automatically grow if elements exceed the initial size. So unlike an array, which is a fixed element, once you define how many elements it has, that's how many elements it has. Using an ArrayList is a dynamic list. Now, the index for each element starts with zero and increments with each element that is added.

So, for instance, on this first line we can see that we have a List that we're defining. That is the interface. And specifically in this list we are going to place Integer objects. And we're going to call the List a partList, but we're going to do define it and instantiate it as specifically as an ArrayList. Now in this case it's going to be initialized with three elements-- 0, 1, and 2.

And so when we add the first integer in, it's going to add that in element 0, the second element in 1, the third element in 2. But then when we get to adding the fourth element, it is going to create another element. It will place 4444, in this case, into element three. And so it will continue to grow as I indeed elements.

Now, in addition, my add method could, instead of taking a single argument, could take a second argument. Now the first argument in this case would indicate which element do I want to add. So before element zero had the value 1111, and now after this last command, it would have the value 5555.

Now, the nice thing about this, though, is that if I were to try to enter any other type than an integer, it would actually catch that at compile time. So I would already know that it had an error and I could fix it. Now, in the past, there were large and great discussions on the principle of autoboxing and auto unboxing. The syntax for auto unboxing and boxing is cleaner and easier to read. But what the concept is is that if I'm going to autobox, what I'm saying is I'm going to take a primitive type and I'm going to convert it to a reference type.

So I'd take an int and convert it to an integer. An unboxing would be the situation of going from a reference type back to a primitive. Now, in version 8, there's no problem with that. In fact, it will do it automatically. It will do it implicitly. So instead of, for example, in this case, creating an integer object and then passing it the value, or taking the reference type and calling a specific method to retrieve the internal value, you could just set them equal to each other, and the compiler knows exactly what that is and we'll do it for you.

So, not a big deal. However, when we get into lambda functions, we will see that there are some lambda operations that will help us to do this to get around the overhead of autoboxing or unboxing. So, going back to my previous discussion at the whiteboard, I said that old collections took objects. And so notice that the line three here is basically creating the same thing that we had before, but there's no diamonds involved.

Well, because of that, because there are no diamonds, there's no generics. And so, in this case, my partList would accept any reference type. So I can add an Integer, add an Integer, add an Integer, add a String. Well, a String is a reference type. And so it would work until run time, in which case I would the loop through each of the elements of my partList. And once I have it, when I try to take that element and convert it to an integer type, well, of course the first three would work fine, but the String would not. And that would cause a runtime error. Well, basically a ClassCastException error.

And so, prior to 1.5, instead of pushing it to runtime, in version 5 with generics, by adding the generic to line three, then we would already know that line eight is not going to work for us. And we could fix it at compile time. So, for example, like I said, if I try to put in a String here, when I tried to compile it, or if you're using a development environment, you get a red squiggly on line 8 here, you wouldn't have to worry about it all.

But the other nice thing is that when you were trying to pull the value out, you could just go ahead and set that value without casting. So as a part, notice that in the previous one, we were showing you that, well, on line 13, we were setting this as an integer type and then we were calling the method to get the internal value. Well, it didn't have to do that. You could just as easily set the reference type to the primitive, and it would auto unbox and use it.

This would be a situation where we're actually autoboxing because we're passing a primitive to something that is expecting a String, so it autoboxes in that case.

All right, shifting gears, we're going to talk about the Set interface. Now, like I said, a Set is similar to a list, but it can contain only unique elements. A Set has no index associated with it. Duplicate elements are not allowed. And you can iterate through the elements to access them, just like we can any other list. Now, the TreeSet provides a sorted implementation of a Set. So, by default, a Set is not ordered. The elements aren't sorted in a specific order. But in a TreeSet, it will actually look at the compare or the compareTo methods and it will identify which objects should go first in the sorted list.

So, for instance, in this TreeSet, notice that I'm basing it on the Set, saying that this Set will hold Strings, and I'm going to instantiate it based on a TreeSet, so it is a sorted List. In this case, because I'm not passing a comparator into it, it's going to perform a natural sort, which would be alphabetical order.

So when I add one, that, of course, goes in the first element. When I add two-- so O is before T in the alphabet, so that would put two in the second element. And then when I add three, well, three is actually alphabetically before two, so it's going to the third add on line seven there, will put three in the second element and two in the third element. Now, notice on line eight, I'm trying to add an element that is already there.

Now that is not going to cause an exception. However, it's not going to add it to the list either, since it already exists. And so when we loop through the set in this case, it should say Item colon one, Item colon three, Item colon two, because of the natural sorting.

Shifting gears a little bit again, let's talk about the Map interface. Sometimes it is that you want to have an associative array. You want to associate a key with a certain value. It might be that you have a description for a key, or something like that. And so by creating a map, you're actually defining both the values that your keys will have, but also the value that your values will have.

Now to do that, you would be using, of course, the Map interface. And there are a couple of those that directly implement the Map interface. And then we could also have a SortedMap. So if you insert an item, or add an item to the sorted map, it's going to automatically sort them in an appropriate order.

So, for example, in this case we're using a TreeMap. And if we saw, the TreeMap is the one that is sorted. So, in this case, we are identifying that our Map is going to have a key that is a String and is going to have a value that is a String. So when I do a put on my Map, it's going to put in the first element the key S001, and then put in the value Blue Polo Shirt.

It will then put in S002, Black Polo Shirt, and then it'll put in H001. Now, in this case because a comparator was not sent into this instantiation, it's going to again order the keys based on natural order. So a capital H comes before a capital S, so it will put that in the first one. By the same token, if I do a put and reuse a key that already exists, this is a way that I can modify the value associated with that particular key.

Now, the good thing about a Map is that it has a method called keySet here on line nine. So notice that I can go into my part List and say OK, give me just the set of keys. Well why is it a set? Well, it's unique. And so at that point notice that I can define it as a set and that I can use that for my loop.

So in this case I'm going to loop through each of the keys, so H001 would be first, and say part number what the key is, space, and then based on that key, I can then pull out the value Duke Hat, and then it will continue to loop. So the TreeMap is both easy to work with putting values in or retrieving values.

Finally, we're also going to talk about the Deque interface. Now, the deque means double-ended queue. Now, the weird thing is that the deque can be used as either a queue or a stack. Now the difference is, of course, with a queue, we have a first in, first out. So you put in an element in one in, and it's like when you pull it out, it's always going to be in the same order in which you included them.

So if I do an add, then any remove was going to take the first element that was added first. On the case of a stack, however, in that case we're putting elements on top of the other, so in that case, as I push, it's going to add elements to my deque, but as I pop, it's going to remove the last element that was there. So last in, first out.

So as an example. Notice here I'm creating a deque that I'm going to call stack, and specifically I'm going to use the implementation of the ArrayDeque. So in this case I'm going to push on one, push two, push three. So at that point, I have three elements-- one, two, and three. I can identify the size of my stack by calling the size. It'll give me a three. I'm going to subtract 1. So in this case I'm going to save while 2 is greater than or equal to 0, I want to pop. Well, in this case, the pop will remove the last element. So three will be first, and since I'm in a print line, it's going to output three, and then two, and then one, because I'm decrementing the size at that point.

So I'll go two, one, zero. Now, with the sorted Tree and the sorted Map, we saw that there were ways that I could sort, and so there are two ways-- like I said on the whiteboard-- there are two ways to identify how I might want to sort a class. Comparable would be something that I would implement in the class that I'm going to sort, where Comparator interfaces are usually added to classes that are external to the class that I want to sort.

Both are implemented by using generics, we'll show you that. And like I said, the Comparable interface uses the compareTo method, but because it is existing in the class that I am specifically sorting, I only have one sort option. That's it.

On the other hand, the Comparator uses the compare method, and in this case, I could create any number of Comparator classes that could tell me how I want to sort a specific class. So I have numerous sorting options.

So, for example, let's say that I want to compare students. So in this case, my class is ComparableStudent that implements a Comparable. Now what am I going to compare my ComparableStudent with? Well, I'm going to compare it with another ComparableStudent. So notice that in my ComparableStudent I have a name, an id, and a gpa. So in my-- yeah, those things-- in my constructor I'm going to of course construct my student. I have my getters, et cetera, to do this, but I do have to override the compareTo because of the Comparable interface.

Now notice the Comparable, compareTo only takes a single variable-- ComparableStudent s. And so notice that in this case I'm going to compare the name of my Comparable to the name of the one I'm comparing it to. So in this case I'm comparing the names of these two. And I'm basically saying that, well, either the result is greater than 0, less than 0, or equal to 0.

Well, the cool thing is that based on String comparison, it's basically going to see is one name less than the other name. Well, in this case we want to order in alphabetical order. And so what we're going to see is that the one that is returning 1, is going to be after the one that returns negative 1. If they are the same, then they have the exact same name.

So if I were to use this ComparableStudent in a test, notice, for example, I can in my set here, studentList, I can say let's add a new ComparableStudent, Thomas Jefferson, well, since that's the first student of course that will be in the first element. But then when I say well let's add John Adams, well capital J is before capital T, and so in that case John Adams would go into the first element, and Thomas Jefferson would go into the second element.

When I add the third one, George Washington, capital G is before J, so in this case, when I print them out, George Washington would be first, John Adams would be second, Thomas Jefferson would be third.

Now, the problem, of course, was that in that case I can only compare based on alphabetical order of the name. Well, what if I wanted to be able to compare based on gpa? Well, in that case, I couldn't use the Comparable because I've already used that one up, so I can use the Comparator interface that implements the compare method. Now in the compare method it takes two parameters, both the same type. So notice that in this case I'm going to create one that says, OK, StudentSortName will be the class. It implements the Comparator, and the type that I'm comparing is Student.

So in my compare method, I have Student 1 and Student 2. The results in this case are exactly the same because I'm using the same method. But notice that, at the bottom of the slide, I'm also saying, well, let's sort based on the gpa. Still going to compare students, but in this case, notice that I can say, well, is the gpa for the first student less than the gpa for the second student? If so, that will be one.

Well what this means is that the higher the gpa, the higher in the sort it's going to be, the lower the gpa, the lower in the sort it's going to be. So in other words, this is doing it in descending order.

So, to give an example, of course if we did the same thing we did before, notice that I can create my studentList. I can create instances of my two Comparators. And then to be able to sort them, all I would do is here on line 9 and on line 14, call the Collections class, called the static sort method, pass in the List, pass in the Comparator, and in that case, it's going to sort them based on the logic that we've already done.

So in the first case, with the student name it's still going to be an alphabetical order. But in the case of the gpa, it's going to be in descending gpa order. So, using the previous one, then it would say, it looks like John Adams would be first, Thomas Jefferson would be second, and George Washington would be third in that example.

So in this case we have talked about generic classes and what they mean. We've looked at a number of different types of collections-- Lists, Sets, Maps, as well as, yeah, those other things, the text and we've also shown you ways that we can order collections.

## 2. Practice 7-1: Counting Part Numbers by Using HashMaps - 15m

In practice 7-1, we've been asked to create a simple program to count a list of part numbers that are of an arbitrary length. So given the following mapping of part numbers to descriptions, we want to count the number of each part, produce a report that shows the count of each part sorted by the part's product description. The part [? number to ?] description mapping is as follows.

So in our activity guide, it gives us a number of things that what we want to come out with. So let's see what we can do. So if we go ahead and open up the Generics HashMap Practice, we can do that. And then, we're going to open-- in this case, there is only one file in there. And you'll notice that it already has a string array that is already there that has the various part numbers. We also have a declared map that has both part name and part number.

And so what we need to do, then, is write the code that is missing where we're going to look at and count each one of these. Now, the best way to do that would probably be to create an additional map. So according to this, we are supposed to create two map fields. So I'm assuming that would go right here. And so let's see. We'd want a private map.

And in this case, the first one will take a string. That will be the actual product. And we are also going to return a Long because that's going to be our count. So we'll call this product "count map." And specifically, we're going to use a HashMap. There we go. Much better.

And what don't you like? Ah, you don't like it because you're in the wrong place. That does make sense. So let's put it up here. So that's our counting map.

And then, next, we also want our name map. So in this case, both the name and the map are the values. They're both strings. So we'll call these "product names." And since we want this one sorted, we're going to use a tree map for that one.

All right, so that takes care of that step. We want to create a one-argument constructor that accepts a map as a parameter. So in our product map, outside of that-- so our constructor will be a public product counter. And we said one argument.

Oh, I suppose that it already exists there, right? So rather than redo it, we'll just use the one that's already there. All right, well, in that case, then this dot-- product count map? No, we want productNames-- is going to be what we pass in.

All right, now there is also already a process list. So I guess I don't have to type that one either. But in this case, it says that in the product list method, we want to process a list of string part numbers, using a HashMap to store the current count based on the part number.

All right, so in this case, we've already defined what we're going to call that, the product count map. So all we have to do is figure out how to do that. Now, the first time we come across it, the first count will be one. And then, we also need to find out, well, is that object in the map or not.

So I'm going to go ahead and figure out what the current value is, because if the current value doesn't exist, we want to do something different. And I'm going to loop through each object. And so let's see that. Product count has a string. So for each string in our list-- all right, so that's our string array.

And we're going to check to see whether our count map contains this one. So notice that the first method is "contains key." And we'll just check to see if it has an item number. If it does, we want to increment. But before we do that one, if it, however, does not, we're just going to go ahead and add that item number as our first one. And we're going to just pass the value of one if we want this.

Right now, it's basically saying, hey, wait a minute. This is supposed to be a Long, right? So all right, we'll make it a Long. So in this case, we're saying that if the item doesn't already exist in our product count map, we're going to add the item, and we're going to identify the count as one.

Now, in the other case, we do want to identify how much is already there. So in that case, we will identify the current value, go into the count map, get the item number. And then, we will increment the current value. And at that point, then we will do the same thing as we had before. So item number and curVal sounds like a really good thing. All right.

Product count map. What doesn't it like? Ah, because I didn't call the right method. There we go. All right, so at this point, we have everything set up to process the list. So in this case, this should allow us to access how many times each one of these products is here, so as we loop through each one of the different products.

So the next step is we are supposed to create a print report method to print out the results to look like what we saw earlier. All right, so the first part is easy because, in this case, we just want to output something specific. So the product report title is pretty straightforward. And then, we want to loop through each one.

And let's see. We're going to loop through what? We need the key set. So the key set of the what? Now, we get our product names from Product Names. And then, we can call the key set method to identify the order that those come in. And so at this point, we're just going to go ahead and output, looks like, name. But in this case, we are not going to print that out.

What the heck? I'm just going to go ahead and-- based on this, we have a name colon. We're going to have the key with just the string. And then, looks like after the key, we're going to have a tab. So tab looks like good. And then, we want the count. And then, after the count, we actually want the actual numbers. So how are we going to get that? Well, in this case, the number is going to be a digit. And then, we'll do that.

All right, so the first one-- pretty straightforward. Should be just the key. So that's all right. And the second one should be, if I do it right, productCountMap. Do a get. And to get the key, I'm going to know what the product names, get. And in that case, it is the key.

All right, so in this case, I passed the key to the product names, which allows me to get the count from the map. And that will provide my digit, except for this is a Long-- OK, so that should work.

All right, based on that code, apparently we're not finished quite yet, because we also want to add some code to the main method. All right? So we're going to go back up to Main. And we're going to do what? Create the product count object. All right, So the product count object, product counter, and good guess.

And so with the product counter, we're going to process the list first. And in this case, parts is good. And then, we're going to-- helps if we do the right one. We're going to print the report. All right, based on the code, we can process the list. That will get us the count. And then, we will print the report that should output the count.

So if we run this, weirdly enough, it looks like it gets it in the order which we were supposed to do. And it looks like we get the same results that they had. Now, to fully test it, we could just as easily change things out, add in some more items like that, except for apparently I didn't pull in the right thing.

So I need that all the way to there. So we could add some items to it and run it again. And the values should change, which they did. So there we go. That concludes activity 7-1.

## 3. Practice 7-2: Implementing Stack using a Deque - 9m

In practice 7-2 we are going to use a DAC to implement a stack to support both Push, Pop, and Peek. In other words, we want to look at how do we implement this stack side of the deck.

So in the first case, it says to open up the project. So go ahead and do that. Expand the project directories, go ahead and do that. And open up the Integer Stack Java class in the editor. Make the following changes.

All right, so we're going to implement the Push method to add an integer to the stack. So add an integer to the stack, all right, something like public void push-- it helps if I spell it correctly. And apparently we want to push an integer onto the stack. So we'll just call it I.

So in my integer-- that's probably not a good name since it's not a primitive. So we'll call it-- element will do. All right, so in this case we already have our deck instantiated. So data, and notice that I can do an add or an add first.

Now in this case, because this is going to be acting as a stack, we want to add to the first element each and every time we add it. So I'm going to go with the Add first element. So that is the push.

Now it says to implement the Pop method that deletes an integer from the top of the stack. All right, so in that case, it returns the type integer. It returns the type.

So let's see, and the method is Pop. And so in this case, we're going to check-- well the easiest way would be to return data dot, and we will also peek first. That's not the peek. We're going to remove-- there we go. We're going to remove the first.

So in the case of the Push, we're going to add an element to the first element. In the Pop, we're going to remove the first element. Now the problem is is that if I call the Pop and there isn't a first element, it's going to give me an exception. So it probably makes sense for me to check to see if there's actually something there.

So if data dot-- now notice that there is an is empty, then I can check for that. And I can say that the stack is empty. So that should help with the Pop. And it did say something about what-- implement the Peek method, that's the one.

So in this case we'll go ahead, take the peek. Now the peek also returns this without removing it. And so in this case, we're going to return data and peek first. It sounds like a good one.

All right, so now we have the ability to put things on, take them off, or to look at them. And then it says to override the toString method. All right, we've done that before.

So of course, the toString method returns a string, takes no arguments. And what do we want to do? Now we want to return the deck itself.

All right, so apparently inside of this class they want us to create a main method. So we can do that. And in the main method, we're going to create a instance of this. So integer stack. Let's create an instance and then perform various operations on the stack by invoking various methods-- Push, Pop, and Peek.

All right, sounds like a good deal. So the best way to populate is to go ahead and create a loop. So we'll say let's push five items on the stack. Push works. And we'll push I.

If we wanted to test how many items there were, we could do that. And let's say we took one. So we do the Pop, see what goes. I can also after-- and we can see what it's like after we pop three elements.

It still should have something in there. So let's see what we got. So we'll do a peek. And what do we have? And at that point, we should still have the same thing. So that should give us a good test of what's going on.

So if we go ahead and run it, after we push the five elements we have, of course, elements four, three, two, one. We popped element four, because that was the first one. And then we popped elements three and two, so we had one and zero left. We could peek at the next element, so we still have one and zero at that point.

We have some difficulty with the spacing. But other than that, it looks good. So I'll run it again. And this concludes activity 7-2.

## 4. Skill Check: Generics and Collections - Score 80% or higher to pass

Skill Check: Generics and Collections

View Skill Check
