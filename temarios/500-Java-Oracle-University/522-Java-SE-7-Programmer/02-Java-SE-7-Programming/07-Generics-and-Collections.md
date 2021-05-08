# 7: Generics and Collections

1. Generics and Collections, Part 1 - 13m
2. Generics and Collections, Part 2 - 21m
3. Generics and Collections, Part 3 - 20m
4. Practice 7-1: Counting Part Numbers by Using HashMaps - 7m
5. Practice 7-2: Matching Parentheses by Using a Deque - 7m
6. Practice 7-3: Counting Inventory and Sorting by Using Comparators - 11m

## 1. Generics and Collections, Part 1 - 13m

All right, folks. So let's go ahead now and now that we've finished with the practice labs for Lesson 6, let's go ahead and get into Lesson 7, which covers generics and collections. These are quite interesting topics. And so the objectives this lesson is we are going to look at creating a custom generic class. We're going to look at using the type inference diamond to create an object. By the way, this is part of Java SE 7, so now we have a new feature that we're going to cover now in this lesson on what's coming, what's new in the SE 7.

Create a collection without using generics. And then after that, create a collection by using generics, and we see the difference in why generics are important. And we're going to look at implementing an ArrayList, we're going to look at implementing a set, implementing a HashMap, implementing a stack by using a deque, and of course using enumerated types.

So what are generics. Well, folks, generics provide a flexible type safety to your code. And by the way, they were introduced in the Java SE 5. OK? And they many common errors from runtime to compile time. That's the whole idea. Because before generics, we actually caught a lot of errors at runtime. Now we can actually catch them at compile time, and that's really good.

They provide a cleaner, easier way to write code. And they reduce the need for casting with collections. We're going to see that soon. And of course, they are used heavily in the Java Collections API.

So you're going to have a good time with this topic, simply because it's quite interesting. And chances are you're going to use what you're going to learn in this lesson when you go back and implement using Java. Let's go ahead and look at a simple cache class without generics. Here's a couple of classes, one is called CacheString, where, in this case, we'll go ahead and declare a message of type string, which is encapsulated and initialize it with an empty string. And then here, it has a method that adds a string and uses it to assign it to the string of the current object. And of course it has a get method that returns the string, the message.

We also have another example, which is called the CacheShirt. And look what it does here. Here we declare an instance of type shirt. That's the instance in this case. And of course it has a method that takes a shirt and uses it to save it in the current shirt reference variable. And it has get, which returns an instance of shirt. So again, as you see here, even though every class is very simple, a separate class is required for every object type. And that's going to be a little bit of a headache.

So instead, here's what we've done in Java SE 5. We actually created this concept of what we call a genetic cache class. If you take a look at this one here, you will see I have now a CacheAny class. And again, to create the genetic version of this CacheAny class, we make use of the variable named T, which by the way is added to the class definition, surrounded by angle brackets. That's very important, surrounded by angle brackets. That's actually what defines generics.

And of course, T stands for type. OK? And then of course, down here, we can have any object of type T, in this case, as a reference variable, in this case, an instance variable. And we have the add that takes an instance of type T, and we use it, in this case, to initialize the reference variable of the instance variable T of the class CacheAny. And it has a get method that returns an instance of type T. That's pretty much how we represent this.

So again, we're looking at this example. You see that the code has, again, changed to use this T instead of a specific type of information. And of course, this now looks like a generic type of a class that can be used for all kinds of types. Right? So I can now replace T with what? String or capital integer, employee, or whatever we want. OK? So we should note that we can use any identifier we want. But usually, these following values are merely strongly suggested, where we represent T for type, E for element, key for key, V for value, and then S, U, and SU and so forth, they're used if there are second types, third types, and more.

Would you say some of it is similiar to templates?

Pretty much. So the comment that Das was mentioning here is, is it similar to templates in C++? Kind of similar, yeah.

Now looking at generics in action, this is quite interesting, folks. Let's compare the type-restricted objects to the generic alternative. So here's an example where we have a main method. Inside the main method here, again, as you see, the first one here, we created two instances. The first one on Line 2, we declare a reference of type cache string, and we've seen this class, by the way, earlier. And we initialize it with the new instance of type cache sting.

And then in the second one, again, we're declaring a reference of type, again, in this variable of CacheShirt called MyShirt and initialize it with a new instance of type CacheShirt. And this is the typical. This is, by the way, before we use generics.

Let's go ahead now and represent this in generics. So if you represent this in generics, look what we have now. We have now a reference variable of MyGenericMessage of type what? CacheAny, and of course it takes as type string. And now we can go ahead and initialize it with the new instance of type CacheAny, of course this four strings. And we can do the same thing if we want to use the TypeShirt.

And of course, in this case, if I have a method, if I'm using the old, which is using before the generics, then in this case, of course, it would be add, and then I pass the string, in this case. Or I can go ahead and use the new one, and of course I pass the string. So if you take a look here, folks, you will see that the add method in this particular case before the non-generic and generic looks exactly the same. The only difference is, of course, what now is circled, or rather inside this red rectangle.

That's how we make use of generics. So generics, of course, of the class can replace any number of type-specific cache and classes in this case. And of course, the add and the get function work exactly the same way, generics or non-generics.

Now looking at generics with type inference diamond. This is actually a very nice feature that we created starting Java SE 7 JDK SE 7. So the type of inference diamond is a new feature of the Java SE 7. And of course, in the generic code, we see how actually it's written, we should notice that how the right side, in this particular example here, we declare a reference variable of type, again, CacheAny of string. And then, on the right side, we do not actually have to write again that string on the right side using, in this case, the diamond sign that we see here. So again, we should notice in this case that the right side is always equivalent to the left side by definition.

And of course, in JDK7 or Java SE 7, we now use the diamond, which is this one here, to indicate that the right type definition is equivalent to the left type. So this is good for what? To avoid writing a lot of code. Of course, you see it here this is simple. You can say, OK, I'll just go ahead and add. But imagine that you have more than one type, like you do with HashMap and so forth. Then in that case, it would be very, very useful to actually do it this way. OK?

So actually, if you take a look at this example here, we should note that it works in the opposite all of the normal Java type of assignment. For example, if I declare reference of type employee, and, in this case, I'll go ahead and initialize it with an instance of type manager, this makes an employee an instance of type manager, which means in this case, it makes the left side type of the right side. On the other hand, using the generics, it's different. Is pretty much making the right side of the type of the left side. Got that? That's the idea behind, again, using these concepts of what we call generic with type inference diamond. Everybody follows that?

So the syntax of this, it would be always there is no need to repeat types on the right side of your statements. And of course, the angle brackets that you see on the right side indicates that the type parameter is mirrored. It of course, is used to simplify generics declarations and save typing. That's the whole idea behind this. Everybody sees that feature, folks? Good.

And of course, we have a quiz here that says, which of the following is not a conventional abbreviation for use with generics?

A.

A, T: Table, of course.

Continuing with that, let's go ahead and now look at collections. Ah, OK. So now we're going to look at collections. Well a collection is a single object designed to manage a group of objects. Again, objects in a collection are called elements, and primitives, by the way, are not allowed in collections. And by the way, we have various collection types that implement many common data structures, like stack, queue, dynamic array, hash, and so forth. And the Collection API relies heavily on generics for its implementation. why? We'll see that soon.

Let's go ahead and look now at the collection type hierarchy. So if we take a look here, a collection is an interface. Again, it has a bunch of methods, add, remove, size, is empty, contains, and so forth.

And if you take a look here, you will see that the interface set inherits from collection interface. And of course, the interface lists and edits from the collection interface. But on the other hand, you see how here, the class has set implements what? The set.

And the SortedSet interface inherits from set. And the TreeSet class implements the sorted set interface. And of course, in this case, we have the ArrayList implementing the list interface and the LinkedList implementing the list interface.

What we should add here, by the way, to this one also, folks, is that a bunch of characteristics of the implementation classes. We should remember that a HashSet is a collection of elements that contains no duplicate elements. Remember that. And the TreeSet is a sorted collection of elements that contains no duplicate elements. And an ArrayList is a dynamic array implementation, and a deque is a collection that can be used to implement either stacks or queues. We also should note that a map interface has a separate inheritance tree and is discussed later on in this particular lesson.

## 2. Generics and Collections, Part 2 - 21m

Let's start by looking at the List Interface. Well, folks, the List is an interface that defines generic list behavior. It's pretty much an ordered collection of elements. And by the way, the List behavior includes what? Adding elements at a specific index, adding elements at the end of a list, getting an element based on an index, removing an element based on an index, overwriting an element based on an index, and getting the size of a list. And of course, we use the list as an instance object to hide the implementation details.

Let's go ahead and look now at the ArrayList implementation class. By the way, folks, everybody's following? So far so good? Let me know, folks, if you have any questions. Of course, the ArrayList Implementation class is a dynamically growable array.

The list automatically grows if an element exceeds initial size. And for some of you, by looking at this, you will be quiet happy that you actually don't have to use an array, because if you use a simple array, you have to specify the initial size of the array. And then that's it. You cannot change that size.

So it does look attractive right now. But I just want to warn folks that, careful, later on, if you make use of ArrayList that dynamically change with size, this can actually hamper also the performance of your system, because changing the size takes time. So there is a balance that we have to look at, based on if we want to, again, in this case, tune our application. You typically find that and learn about that in a course that we offer called the Java Performance Tuning class. And you can find it in the Oracle University website.

And by the way, an ArrayList implementation also has a numeric index. Again, elements are accessed by index. Elements can be inserted based on an index, and elements can be overwritten. And by the way, it also allows duplicate items.

Let's go ahead and look at an ArrayList with our generics Here's a very good example where in this case, we have a class called OldStyleArrayList. It has a main method. And on line 3, we'll declare a partList reference variable and initialize it with an ArrayList of type, in this case, of size 3.

And then after that, look what we do. We add to this partList that we created, ArrayList. First an integer, than another integer, then another integer, then look what we do here. We add a string. And by the way, it is OK, because we said it extends dynamically even if it exceeds the size. We know about that, right? So that's not a problem.

And down here, look what we do. We now create an iterator element, and then we use it to iterate through, again, the list, and in this case, grab those elements, pass them into an object of type Integer, and of course, save them into a reference variable of type Integer. So the issue that we have here is, again, we can get errors here, as you see online 12. Why, folks? And we can get a runtime error that would occur on line 12. Why? Anybody can see why is it that in this case, again, we can now get a runtime error that would occur on line 12 that I just highlighted?

[UNINTELLIGIBLE].

Yes, because, one of them, again, is string. So that's, oops, a string. And of course, in this case, obviously, you would have a runtime, because a string is not what? It's not an integer. So that's why, again, we have this problem.

In addition, so you have a code from line 10 all the way to 16, and that's, again, with the non-generic collection, that's an iterator which is used to iterate through the list of your items. You should also notice that a lot of casting is required to get the objects back out of the list so you can print the data. So for example, here, get object, cast it, and so forth.

And then after that, that object of type capital Integer, you invoke the end value to extract the integer part of it, cast it into a primitive int, and of course, use it and then print it out. Wow. That's a lot of sweating here, right? So the whole idea behind this-- and by the way, if we comment line 8, and of course we print this, it will go ahead and print this list for us that we see here.

Of course, this is just not a friendly way of doing things, right? Let's go ahead now and take a look at how we can actually enhance this ArrayList by making use of generic. So if you take a look at this example, folks, you will see now that in my generic ArrayList class, I have a main method.

And on line 7, what did I do? On line 7 now, I am making use of generics and creating an ArrayList that is going to hold only what? Integers, right? OK, good. And now, if we get to line 12, we've got no problem, because the ArrayList can grow. So there's an auto-grow over there, so it relays auto-grows no problem. And of course, if we go ahead and print, for example, the first element, get [0] on the partList, and then we'll go ahead and print it.

And of course, we'll go ahead now, and we can add an Insert an item by index. We can go ahead and do that. And now, if we try to do that, what's going to happen, folks? If we now try to add a non-integer, non-capital Integer object, like in this case, we're trying to add a string, what happened here, folks? Obviously, this is going to give us what? A compile error.

And we like that, by the way. We like that it's a compile error so that we don't have to deal with what? At runtime. Everybody sees that? Generics are included in the Java SE certification exam. Everybody's following? Good.

So of course here, on the line 7, the ArrayList is assigned to a List type. Again, using this style enables you to swap out a List implementation without changing other code.

In the previous example, why can't you do it on line number 8?

Oh, that's because here, we added an integer. And of course, now, if we read that integer and try to cast it into a capital Integer, of course, there will be, in this case, a runtime error. Got that?

But you can still have the-- the line number 8 is still valid.

Yeah, at compile time, there is no problem. The issue that we have here is a runtime error would occur at line 12, right? And it is a good idea, [? Majid, ?] when you write your code, to actually catch the error at compilation time. And then you're all set. It's all behind you, rather than dealing with it later on at runtime. You see the difference? OK, good. Good question, though.

So now, using generic ArrayList, and of course, looking at iteration and boxing. Well, here's an example where, in this case, we use the enhanced for loop, where in this case, we iterate through the partList that we've seen earlier. And what we're doing over there is, of course, we're taking that part number and, of course, assign it to the primitive variable of type Integer here called Part number. By the way, this is auto-boxing-- or rather, auto-unboxing, where in this case, we're converting an object of type capital Integer into a lowercase integer, and that's done automatically.

So first of all, the enhanced for loop, or sometimes called the for-each loop, provides cleaner code. And also, in this case, as you see, there is no casting here. Why? Because of the autoboxing and auto-unboxing. By the way, autoboxing and unboxing was actually created and, of course, added in Java SE 5, which means you do not need now to cast. Remember how we've seen earlier, how we have to cast and all that. And you have to also invoke an int value to convert that capital Integer object into an instance of type primitive int. Got that?

So the autoboxing and unboxing, that, of course, now takes care of that. The only thing is we tell you, careful with autoboxing and unboxing. If you do a lot of it, it also can hamper what? The performance of your system. Everybody understands that, folks? Everybody's following here?

How many of you have heard of autoboxing and unboxing? That is done automatically. It was introduced in Java SE 5, where now, the Java converts a capital Integer into a primitive or vice versa without, again, you having to cast or whatever. All right? Everybody's following that? Good.

So no casts are done because of the autoboxing feature of Java. So here is, again, speaking of autoboxing unboxing, pretty much, it simplifies the syntax and produces cleaner and easier code to read. So here's an example of a class called AutoBox. It has a main method.

I create an instance of type capital Integer and use it to initialize the reference variable intObject. And then here, I declare a primitive of type integer, initialize it with 2. And then, of course, in this case I declare a reference variable of type capital Integer, and of course I declare a variable of type int.

And now, before Java SE 5, if I want to now take that int primitive that I have here, and I wanted to assign it to this one, I have to first pass it to the constructor Integer to create a new instance of capital Integer and use it to, again, initialize tempInteger that I declared here. And the same thing if I want to now, again, convert, if you want, in this case, take that int object that I have here and use the int value to extract from it the primitive value of type int and then cast into an int and use it to initialize tempPrimitive that I declared here.

You do not need this anymore, folks. Starting Java SE 5, you just do it this way. That is done automatically for you. Everybody sees that? So you can assign a capital Integer to a lowercase integer, and vice versa. That's called autobox or auto-unbox.

We just want to tell you about one thing, and we need to tell you about this, because we want you to be careful, folks, when using autoboxing in a loop. There is a performance cost to using this feature, so be careful with that, because you take it for granted, and you don't have to do anything, but inside, it's actually, in this case, affecting the performance. There is a performance cost to do that. Everybody's following, folks?

And of course, we have a quiz here that says, which of the following declares an Integer ArrayList with the three elements? What do you think here, folks? Which one is the solution here?

D.

D. Thank you. Excellent. Let's go ahead now and look the set interface. Well, a set is a list that contains only unique elements. Again, a set has no index. And duplicate elements are not allowed in a set. And you can iterate through elements to access them. And by the way, TreeSet provides a sorted implementation of a set.

Let's go ahead and look at an example of a set interface. Here, we have a class called SetExample. It has a main method. And on line 3, we declare a reference variable of type set. Again, we're using generics here. And then, of course, we'll go ahead and initialize it with what? With a TreeSet.

Sorted.

Sorted. And by the way, you see how we use the diamond here. That's the inference, and we can go ahead and use that. And starting Java SE 7, we can go ahead and do that. And then we add what? A string to it, then one, and then two, then three, and then we add another three, and it says what? Not added, because what? It's unique. It does not allow duplicates.

And here, we use the enhanced for loop to iterate through, again, the elements of the set and print them out. If you print them out, they look like this. Everybody sees the example of a set? Ah, now that we're finished with collections, let's go ahead and look at-- yes, you've got a question?

So, in the previous example, so when the [INAUDIBLE] list gets added, it's all alphabetically sorted, right?

Yes, of course.

It's not in the same order that it prints out.

Say again? Yeah, it's sorted. See, always first, and then TH, and then TW. So that works.

It's not in the auto directory?

Yes, it's not in the auto directory. Of course, yeah.

Can you have a set of any type?

Yeah, of course.

So you can do a set with--

With T, when you write it. Yes, of course. And then after that, of course, at the runtime, you have to specify which type you're working with. We've seen that at the beginning, remember? The cache example. So any other questions? Good questions. Keep on asking, folks. Good. I like the questions. So please, anytime you have a question, please go ahead and mention it.

So let's go ahead and map interface. Well, a collection that stores multiple key-value pairs is pretty much a map. It has a key, which is a unique identifier for every element in a collection. And it has a value, which is, again, stored in the element associated with the key.

Of course, lots of times, maps are called "associative arrays" in other languages. And here is an example of a map. Key, 101, the value, Blue Shirt, 102, and so forth. So a map is a good for tracking, by the way, things like part lists and their descriptions and so forth.

And here's the map types hierarchy. It turns out we have an interface called "map" that, by the way, has a get method. It has a put method. It has a keySet. It has a value. KeySet returns the list of the set of keys. And values returns the collection of the values.

We also have a SortedMap, which, by the way, an interface that inherits the Map interface. The HashTable implements the map. HashTable-- or rather, HashMap, implements the map. And the TreeMap implements the stored map, and the properties inherits from the HashTable. So we should also remember that a TreeMap is a map where the keys are automatically sorted.

And the HashTable is a classic associative array implementation with keys and values. HashTable, by the way, is synchronized. On the other hand, the HashMap is an implementation, just like the HashTable, except that it accepts null keys and values, and also, it is not synchronized.

Let's look at an example of a map, again, in this case, interface. In this example, we have a map example that has a main method. And on line 3, look what we do, folks. We actually declare an instance of type Map that takes a couple of strings for the key and values. It's called partList. And we initialize it with a new instance of what? TreeMap.

And then we'll go ahead and take that TreeMap and put in it the key-value pair on line 4, and then another one on line 5, and then another one on line 6. And then, after that, if on line 9, we'll try to go ahead and, of course, add with the key value as 002, a Black T-Shirt, what's going to happen is it's going to override what? The Black Polo T-Shirt that you have over there. Everybody sees that?

And now, we'll go ahead and now invoke keySet method on the partList. And we know that it returns what? A set of keys. So that's why now we use it to initialize with it the reference variable keys of type SetString And of course, we go ahead and print-- in this case, use the enhanced for loop to print the keys.

And then what? And invoking the get method by passing the key. So we print what? The keys and their values. And that's why we see this. Everybody sees that?

## 3. Generics and Collections, Part 3 - 20m

Ah, let's look at the deque interface. Well, it is a collection that can be used as a stack or queue. And by the way, what does it mean? Well, it means double-ended queue. And, by the way, and lots of times, the way we pronounce it is deck. And the queue provides the first in, first out operations. It has the add, and remove, and so forth. And the stock provides the LIFO, which is last in, first out operations. Which, by the way, has the push and the pop.

Deque is a child interface of a collection. And, by the way, a queue is often used to track asynchronous messages request so that they can be processed in order. And a stack can be useful for traversing a directory tree or similar structures.

Let's look at an example of a stack with a deque. Here's a class called TestStack. It has a main method. On line three, we will go ahead and declare a reference variable of type deque. Again, using the generic string in this case called stack. And we initialization it with a new ArrayDeque.

And then after that, we'll go ahead and, of course, in this case, push on it to 1, 2, and 3. We will go ahead and set the size, wihich is the stack of the size minus 1. And then we use the while loop and do what? And, of course, invoke the pop method on the stack and to keep on deque [? amending ?] size. Doing this, of course, in this case, does what? Print the elements in the stack. Everybody follows that?

Now look at-- let's look at ordering collections. How many of you have heard of comparable and comparator interfaces? These are quite interesting, folks. Let's take a look at this and pay attention carefully to these.

The comparable and comparator interfaces are used to sort collections. They both are implementing using generics. And we use comparable interface to override, typically, the compareTo method. We see an example soon. It typically provides only one sort option for a class. By the way, that's called typically the natural sorting. And many, many of the classes of the API do actually implement this compareTo. Like what? String, date, and so forth.

We also use the comparator interface. And the comparator interface is implemented by using what? The compare method. It pretty much enables us to create multiple comparator classes.

So if you want to customize your comparisons of objects, of type, or particular class, and more than one-- I can, for example, take two students and compare them based on their GPA, or based on their first name, or based on their last name. Then, in that case, I should use what? Comparator, right?

It enables you to create multiple comparator classes. And it enables you to create and use numerous sorting options. So, in general, we say that the comparable is a natural sorting and the competitor is customized sorting. Everybody is following, folks? Good. And both interfaces can be used with sort collections, such as TreeSet and TreeMaps.

Let's start by covering be comparable interface. Quite interesting. Comparable interface does what? It overrides the compareTo method. And, of course, provides only one sort option. For example, here, we have, like I mentioned to you, a TreeSet of students. And we make, of course, in this case-- we will go ahead and create a comparableStudent class that implements comparable, which, by the way, ends up implementing the compareTo method.

Let's go ahead and look at an example to be able to understand what is it that we're doing here, folks. Illustrate the concept of comparable interface. For that, let's take a look at this example.

Well we have a class called ComparableStudent. And what it does, it actually implements the comparable interface. Again, in this case, we are using generics. Which means we're comparing objects of type what? ComparableStudent. Got that?

On line two, we declare a field called name of type string. An integer idea of type long. Initialize it to zero. And a double GPA, again, a variable GPA of type double. Initialize it to 0.0.

And then on line four, we have what? A constructor. Constructor that takes a string, representing a name, an integer, and a double, representing GPA. And of course, we put all the code here that will initialize all the data members over there.

And then after that, we have a method, getName. And that returns, of course, the name of the current object. We can go ahead, by the way, and add additional code here. But what we are interested by, in this case, folks, is what? Is the compareTo method. This is the method that needs to be implemented by the class that implements comparable interface.

It turns out that here, we're comparing objects of type what? ComparableStudent. So we pass an instance of the ComparableStudent to, again, the compare method. And then, of course, in this case, what we do is we'll go ahead, first of all, and invoke the getName on the ComparableStudent. And, in this case, by calling in our case here, what we're doing, is we're using the name of the current object and calling what? Calling the compareTo method and passing the name of the student to it. Why? We're making use here, folks of what? Of the compareTo of the string class that is already provided to us.

Because I know as getName name will return what? A string representing the name of the class. It turns out that, by the way, it turn out just out of curiosity. And let's go ahead and see that. OK. Let's go ahead and look at the string. The string in class in Java SE 7.

And if you look at the methods of the string, you would see-- going back. You would see the list of the methods. So if you take a look here, you would see pretty much all the methods including the comparable.

So, of course, in this case, we take-- again, we're comparing here the name of the current objects to the name of the comparable object that you are passing. And, of course, the result is greater than zero return one. If it's less than zero return minus 1, and if it's equal, return zero.

So we know that a negative number says [? S ?] comes after the-- rather comes before the current element. After the current element if, of course, if it is positive. If it's negative, [? S ?] comes before the current element. And if it's zero, [? S ?] is equal to the current element.

Everybody's following, folks, here? Now let's go ahead and test this. To test it, we create a class called TestComparable. It has a main method. First, we'll go ahead and create a list in this-- a studentList. Again, it's a set of type ComparableStudent. And, of course, we initialize it with a new instance of TreeSet.

Then after that, we add a new instance of ComparableStudent, Thomas Jefferson. And the ID 1111 and the GPA 3.0. And then we add another ComparableStudent, John Adams. ID 2222 and then the GPA 3.9. And then we add another-- a new instance of type ComparableStudent. George Washington, ID 3333, and, of course, the GPA 3.4

And then here we use enhance for loop. And where we, again, integrate in this case, through the studentList list. And print those, again, every student information on the list.

So if you take a look at this, look what we see. We see this output. Where, in this case, we compared what, folks? We compared the students based on what? The names, right? Because we implemented the compareTo to it. So that's why we see George Washington first, and then after that John Adams, and then Thomas Jefferson.

So the ComparableStudent class overrides, of course, by the way, the two string method. Everybody sees that folks? So, obviously, in this case, after the list is initialized, it is sorted using the comparable interface that, by the way, we implemented here in the previous slide. Got that? Everybody's following?

Let's go ahead now and look at the comparator interface. Now we said using the comparator interface is typically implemented by using the compare method. And it enables you to create multiple comparator classes. And it enables you to create and use numerous sorting options.

So now we can look at the example where, in this case, we can go ahead and make use of the-- obviously, in this case, of the comparator interface. And make the class implement the comparator interface. And we can have more than one that implements the comparator interface. For example, we can have a NameComparator that implements the name. Compare the implements to comparator, which means it compares the students by name. Or GPA comparator that implements the comparator interface. Which means here we could have more than one class that implements that comparator interface. Which, by the way, end up implementing the compare method. Got that? Everybody's following?

All right, let's look at an example of how, actually, we do that. And for that, let's go ahead and look at this StudentSortName that implements comparator. Here it's sorted by what? By name.

Look how, now, we go ahead and implement the compare method that takes two instances of student. Everybody look at that. Look what we do here. We actually are making use of what to handle this combare method? We're calling the compareTo of what? Of the string. OK, to compareTo strings. So that, of course, in this case, we have a getName. As to getName, that would be passed to compareTo to compare it with the s1.getName.

And, of course, you get the result. If it's different than zero, return the result. As, of course, if it's zero, and, in this case, do more comparing. Do more comparing means what? Return zero, do more comparing. Do more comparing. Can we actually, now, be used through the concept of StudentSortGpa that implements the comparator. Again, in this case, what we're doing is we're implementing the compare method that takes the students S1 and S2, and then, of course, compare their GPA.

So S1.getGpa and compare it to S2.getGpa. If the S1 GPA is less than S2 GPA, return one. If S1 GPA is greater than S2 GPA, return minus 1 as we turn zero. Everybody sees that?

So we turn out that here we have two classes-- StudentSortName and StudentSortGpa. That, of course, in this case, allow us to, in this case, implement the comparator. This one compares the students by name. This one compares the students by GPA. Right?

So it turned out that the string, like we said-- we said it implements the interface serializable character sequence. But it also implements what? The comparable interface. Did you see that? OK, good. Everybody's following, folks?

And here's how we test the comparator. So we have a test comparator that has a main method. We'll go ahead and create a list of students, called studentList. And it's pretty much a list that has-- of size three. An ArrayList. And then we'll go ahead and create a new instance of comparator of student called sortName. That sorted, again, comparator in this [? queue ?] reference variable of type comparator student. And initialize it with a new instance of the StudentSortName. Which, by the way, we implemented here. And then we'll go ahead and create a-- declare a reference variable called SortGpa of type comparator. And initialize it with a new instance of StudentSortGpa. Which, by the way, we implemented here.

And, of course, we have a bunch of initialization that we do here. And then look what we do now. Now, we call the sort method collections. And we pass to it what? A studentList. OK, and of course the sortName. This, of course-- now if you use the for loop to, again, print the students. It's going to print them based on what? Sort it based on name, because we're passing the sortName here. This one here.

And now, if we do the same thing. Call the sort method, pass the StudentList, and now sortGPA. And if we use an enhanced loop to print the students, obviously, this is going to print the students based on what? Sort it based on what? GPA.

And, of course, in this case, you will see how this, the first output is the output of this one here. And the last output which compares the students based on their GPA would be, again, produced by this one here. Everybody's following, folks?

There is a note that we want to tell you here that collections utility class provides a number of useful methods for various collections. And these methods, again, could be-- include min, max, copy, sort, and so forth. And, of course, the student class has overridden the two string method. Everybody's following, folks? So far so good? Good, good, good. Any questions?

And we've, of course, we have a quiz here that says, "Which interface would use to create multiple sort options for a collection?" Comparator, and that's, of course, C, right?

And that's pretty much what we wanted to say about these generics. So, as you see, generics are very powerful. And also it's interesting to see the comparable and the comparator, right? Why do we use comparator anyway? To implement multiple comparators, class.

And, on the other hand, why do we use comparable interface? To create a natural way of sorting objects of type particular class, right?

So in this lesson, of course, we looked at custom generic class. We looked at the type inference diamond to create an object that was introduced in the Java SE 7. We looked at creating collections without generics. And then we looked at collection using generics, and we saw the difference. There is a huge difference, by the way. Avoids all kinds of coding, and makes it flexible, and so forth. We looked at implementing an ArrayList, a set, a HashMap. And we looked at implementing a stock by using a deque. And we looked at the concept of enumerated types.

Of course, we have a bunch of practices, in this case, or practice labs. First, we look at the counting part numbers by using a HashMap. Then we make use of matching parenthesis by using a deque. Then we look at counting inventory and sorting with comparators. And that's pretty much what we want to see in here.

So, again, looking at not your activity guide. In this case, folks, you are going to first start by doing the first practice lab, which is related to counting part numbers by using HashMaps. Again, we give you a summary level. If you are comfortable with this, you can go ahead and use that. If you need more information, more details, then you look at the detail level of this practice.

Then the second practice, which is, again, related to matching parentheses by using a deque. Again, in this case, we give you a summary level, but if you're interested, you can go ahead and look at the detail level. That gives you more information to do your practice lab.

And of course we looked at, now, the next one, which is counting inventory and sorting by using comparators. And, of course, you have the summary level, but you could always make use of the detail level if you want more information. And that's pretty much what we wanted to do for this practice.

So let's go ahead folks and do the practice labs for lesson seven. And, of course, once we've finished, we'll go ahead and continue with lesson eight.

## 4. Practice 7-1: Counting Part Numbers by Using HashMaps - 7m

After looking at Lesson 7 which talks about Generics and Collections where we discussed the concept of creating a custom generic class. We looked at the type and [INAUDIBLE] time and to create an object. We looked at creating a collection without using generics. We looked at collections by using generics. We looked at implementing an array list, a set, a HashMap. We also looked at implementing a stack by using a deque, and of course making use of enumerated types.

Let's go in and look at practices for Lesson 7. And we start with practice number one, and we look at the detailed level of it where here we're counting part numbers by using HashMaps. So in this practice, we make use of the HashMap collection to count a list of part numbers.

Again, we've been asked to create a simple program to count a list all part numbers that are of an arbitrary length. Again, given the following mappings of part numbers to descriptors, count the number of every part, produce a report that shows the count of every part stored by the parts product description.

The part number to description mapping is what we see here on this table. The 1S01, blue Polo shirts, 1S02, black Polo shirt, 1801, red ball cap, and 1M02 which is the Duke mug. Once completed, your reports should look like this.

Task again, in this case open a generics-practice01 project, and make again the following changes for the product count class. In this case, add two private map fields. The first map counts part numbers, and the order of the keys does not matter. The second map stores the mapping of the product description to a part number.

Again, the key should be stored alphabetically by description for the second map, and here it is. Again, in this case, we'll see-- so we have them here. One is the HashMap, and the second one-- again, one is the product count map, and it's an instance of type HashMap. The second one is the product names, it's an instance of the TreeMap.

And, of course, we create in this case a one argument constructor that accepts a map, and here it is. Of course the accent is the solve the TreeMap in this case. And we have the process list method to process a list of string part numbers. Use a HashMap to store the current count based on the part numbers.

So we have the product count, but there's a new instance of the map, and use it to initialize the product names. And then the process list which, by the way, it's defined here that there's a list. Has a local variable curVal which is a long integer, and then use the enhanced four loop to iterate.

And then, of course, it says if the productCountMap contains the key item number, then go ahead and get that. In this case, invoke the get and pass the item number to get on the product count map.

And get the current value, income and lot converted value, and then put it inside the product map with a new-- again, where we put the item number-- a new instance of the long wrapper class, bypassing the current value. Else go ahead and put in the item number, and of course any instance of the long way we pass an integer.

And we have the print report method here. Continuing with that is the print report method, that of course we have it in, and which is again located in this case here where we put a message and we use the enhanced form loop to iterate and print the key, and the count of that.

After that, we'll go ahead and add the code in the main method where that creates an instance of the product counter. And then, of course, in this case call the process list and pass to it and invoke the print report method.

And of course, after that we'll run the product count. So let's go ahead and see that. By scrolling up and going to the main method, where here first we have an array of strings that represent the product numbers.

And then after that, we create an instance of the TreeMap that, of course, we make a reference by the product names, reference variable of type map, but string for generics. And then we put in it the blue Polo shirt with this ID 1S01, a black Polo shirt with 1S02, red ball cap with the ID 1H01 and the Duke mug which is 1M02. And that's the code where we create a product counter object and process.

And then, of course, after that we're are on this file of the product count that's going to do that. And that's what we get. That's exactly the output that they asked us to generate. And that was right at the beginning when we started with this practice that was here. And, of course, as you see here it's down here.

And that pretty much ends the Practice 1 of Lesson 7. Thank you.

## 5. Practice 7-2: Matching Parentheses by Using a Deque - 7m

Let's go in and look at Practice 2 of Lesson 7 that talks about matching parentheses by using a deque. In this practice, we use the deque object to match parentheses in the programming statement.

So use this deque data structure as a stack to match parentheses in a programming statement, and we will be given several sample lines containing logical parentheses. Test the lines to ensure that the parentheses match. Of course, in this case return if they do, false if they do not. For example, the output from the program might again look like the following.

Open the Generics Practice 2 Project. Again, we modify here the process line method in the parent or the parent matcher.java to read a line in and convert the string into an array of characters. Again, a clear, the stock, and then of course convert the line to a character array. And that's pretty much what we have as a code over there.

Continue with that, and of course in the same method, look through the array. Again, we have the push the parenthesis onto the stack. That's the open parenthesis. When the closed parentheses is encountered, a pop of an open parenthesis from the stack.

If the open parenthesis is left on the stack, or you attempt to perform a pop operation on an empty stack, the parentheses do not match, return false. Otherwise, return true. To do this again, we add the code that you see here on the slide here where we have C: for the four loop character a colon curve, it's an enhanced loop curved line, switch.

And then we have the case if it's open parenthesis. And then of course push the character and break if it's closed parentheses. If the size of the stack is greater than zero, pop that as return force and break. If the size of the stack is greater than zero, return force missing match and valid expression, else return true. Of course, we're on the matcher to ensure that the program for this is the design output.

Let's go in and see that. And here's the matcher that creates an array list. Rather, an instance of deque called stack, it's a type of array deque. And then of course I will go ahead now and declare an array of characters called curLine.

And we have the processLine method that, of course in this case, takes that curLine and takes the line and calls the two character array. And use it in this case and initialize all of that, initialize the curLine with it, or rather save it in the curLine before we clear the stack.

And of course, after that we have in this case the enhanced form loop that we've seen over there with the switch statement. And we have the processArray method that takes on an array of strings and goes through using the enhanced for loop.

And for every string of the array lines, we'll go ahead and call the process line method, and print again. If it's true, we print the line and the count which is valid, otherwise we print the line count is invalid-- an increment account. By the way, the count already of course it's an integer that in our case here a local variable that is declared here.

In the main method, we create an instance of the pattern matcher, and we create an array of strings called expressions of size for. And then we initialize every element of the array with the strings that we have over there. And then after that we pass the array of strings to the processArray, that will go ahead and take care of business and process that.

So if we now run this, we're pretty much going to see that it gives us now-- let me just scroll down a little bit so I can see and compare where we have an output in this case. So on our output here, you would see that in the first one there's definitely a mismatch, and that's why we have zero. Or rather, there's a matching because when we're following this method here, says if it's valid or not.

And the second one, obviously it's invalid because as you see here we have one, two, three. And then the closing one, two, three, four. And so one, two, three, four, five, six, and then that's the opening. The opening is one, two, three, and the closing is one, two, three, four, so there's a mismatch.

Second one also there's a mismatch. Let me just scroll down this guy here so we can see that. And we can see it all the way when counting the number of parenthesis. And of course the last one, which is valid.

And that pretty much ends the Practice 2 of Lesson 7. Thank you.

## 6. Practice 7-3: Counting Inventory and Sorting by Using Comparators - 11m

Let's look now at practice three of lesson seven, which talks about counting inventory and sorting by using comparators. In this practice, we process shirt-related transactions for Duke's Choice Store, compute the inventory level for a number of shirts, and then print out the shirt data of store by description and by inventory count.

In any Duke's Choice stores, in this case, a number of products, including shirts, in this practice, we process the shirt-related transaction, and calculate the inventory levels. Once the levels have been calculated, print a report stored by description and report stored by inventory count. You will create two classes that implement the comparator interface to allow sorting shirts by count and description.

For example, the output from the program, again, might look like what we see here, the inventory report description, where we have a shirt ID, description, color, size, inventory. And, of course, the same thing with the second one, and third one. And in this case, it's, of course, the inventory report is by description.

And continuing with that, that'll be the output. The tasks, of course, here is to open that project, Generics practice 03, and, of course, review the shirt class in elementary count interface to see how the shirt class has changed to support elementary features. That's going to look at that, the [? shirt and ?] elementary counts.

So let's see the shirts class. Here's the shirt class. And that [INAUDIBLE]. Here is the shirt [? implements ?] inventory count interface. And here's the inventory count interface that has the getCount, the addItems, and the removeItems methods that are abstract, needs to be implemented again in the shirt class. And because the shirt implements inventory counts, so that's why now we implement, of course, the methods that we see in here, which is getCount, addItems, and removeItems.

So we see these in the shirt. Shirt has an ID description, color, and, of course, size. And it has a couple of constructors, and it has, of course the getID, getDescription, getColor, getSize. The two-string method of overriding the getCount. Here, it's overridden. The addItems, it's overwritten. And the removeItems, which is also overridden.

Ok, the addItems takes the long integers, and then the removeItems takes the long integer, and tries to remove them. OK? And, of course, we have to first find out the [? compromise ?]. This stuff [? minus count ?] is non-zero, and do that. Otherwise, [? it'll give you ?] an inventory number error. So we cannot do it.

Continuing with that, review the Duke transaction class to see how the transactions are defined in this program. It's going to see that. There it is. OK. So we have the Duke transaction. It has, by the way, product ID, transaction time, and count. And then it has a createTransanction method, that takes of course, in this case, a product ID, a product transaction type, and a count. And then, of course, creates an instance of the Dukes transaction, fast product ID, transaction type, and the count. That gets me a new transaction. That's, again, in this case, the method createTransaction over there. And then return the new transaction. It has a getProductID, getTransactionType, and getCount.

Please continue. Again, update the SortShirtByCount comparator class to SortShirtByCount. You see, we should be able to have this. And let's go ahead and look at the sort bar, ShirtByCount. Let's go ahead and look at that. SortShirtByCount, which is this one here. And, as you see, it implements the comparator, where it implements the Compare method that takes two instances of this shirt, S1 and S2, and, of course, gets the count from both. And cast those into an object of that Long, C1 one C-- and save them into C1 one C2, that are of type Long. And, then, of course, use the compareTo method to compare C1 and C2, in this case.

Continuing that, again, sort by shirt by description, and [? showing ?] the code here. And, pretty much, it's-- when I look at that. Well, in this case, we passed two shirts, and then we'll [? always ?] compare two on-- first we invoke the getDescription on the S1. And invoke the compareTo and pass, of course, the getDescription of S2. And that, of course, the compareTo will compare descriptions in this case.

And then after that, they want us to update the TestItemCounter class to process the shirts and transaction, and produce the desired output. And here, we look through the transactions, and update the appropriate shirt object contained in the Polo's map. This would produce an inventory count for every product. And count the shirts.

And we use the For loop. And here's For loop. And then I look at the transactions, and go through, again, the transaction. For every Duke transaction, go ahead, in this case, and look at the-- use the containsKey method on the Polo's. And, of course, after that, we'll go ahead and involve the getMethod when we pass to it the getProductID invoked on the transaction. That gets the current shirt. As, of course, printIn(*error:Invalid Number.

And we use the Switch statement here by invoking the getTransaction type on the transaction. If it's a purchase, we would go ahead, in this case, and so for the case of purchase, of this current shirt, we'll add the item. If it's the sales current shirt, then we'd go ahead and remove the item. Otherwise, the default, which prints Error: Invalid Transaction Type, Continue.

And we print the list of shirts by description. That's been given to us through this code, here, where we got an array list of Polo's. It's called the poloList. And, of course, first create an instance of the SortShirtbyDescription and a new instance of the SortShirtByCount. And, of course, both are referenced by sort description and sort count reference variables.

Print the results, sort by description. And that's where we invoke the sort method on the collection. In this case, it [? passed ?] with poloList and the sort description. Now we'll go ahead and print the inventory ports sorted by description. And, of course, we use the enhanceFor loop. And iterate through the poloList. And, of course, print, in this case, the shirt.

Then, after that, we'll go ahead and print the result sorted by count, where, in this case, we call the sort method on the collections, and pass the poloList and the sort count. And print again, in this case, an inventory report sorted by count, by invoking the enhancedFor loop, and printing the shirts, in this case. But they're sorted by count.

And, of course, they ask us to run the item test. So let's go ahead and look at that. And for that, we'll go to the test item. And, pretty much, here, we create, first of all, a bunch of shirts. And then, after that, we'll go ahead and, in this case, create an array list called Transactions of size 20, and add to it all the information that you see over there in this case, on the editor on that [? means ?]. You see enhancedFor loop. And iterate through the transactions. And, of course, in this case, get, a product ID so that we can identify, in this case, the current shirt and use it to save it in the current shirt reference variable of the Switch statement that goes through the, again, in this case, if it's purchase or sales, or, in this case, the default.

And here we create an array list of, in this case, called poloList of size-- again, by invoking the values on the Polo's. Create a couple of instances, one of the SortShirtByDescription, and the other one, SortShirtByCount. Both referenced by the reference variable sortDescription and sortCount. And then after that, we'll go ahead and print first the inventory sorted by description. And then print that sorted by count. And of course, all of this is done, is, of course, shown here in this code.

The last thing is to, of course, run this. And if you run it, you will see that, in this case, we first go ahead and sort this by description. And you see this sorted by description. And then after that, sorted by count. And that pretty much ends the practice three of lesson seven. Thank you.
