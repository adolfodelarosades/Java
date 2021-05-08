# 8: Creating and Using Arrays

1. Creating and Using Arrays, Part 1 - 20m
2. Creating and Using Arrays, Part 2 - 23m
3. Practice 8-1: Creating a Class with a One-Dimensional Array of Primitive Types - 13m
4. Practice 8-2: Creating and Working With an ArrayList - 12m
5. Practice 8-3: Using Runtime Arguments and Parsing the args Array - 11m

## 1. Creating and Using Arrays, Part 1 - 20m

All right, folks. So after finishing with the practices for the Lesson 7, let's go ahead and get into now Lesson 8, which by the way covers creating and using arrays. By the way, arrays are quite important for us as developers.

In this particular lesson we are going to declare, instantiate, and initialize one-dimensional arrays. We also are going to declare, instantiate, and initialize two-dimensional arrays in Java. And then, of course, by the way, later I'm going to tell you that there is no concept of two-dimensional arrays in Java. They are actually arrays of arrays.

And we're going to access a value within array. We're going to describe how arrays are stored in memory. We're going to look at the concept of declaring and initializing an array list. And of course, looking at using the args array that we see in the main method. Now we can learn how to actually pass arguments when we are on a Java class.

So let's start with the overview of arrays. Well, an array is pretty much a container object that holds a group of values of a single type, of the same type. Again, a value in the array can be a primitive or an object type.

Of course, the length of the array is established when the array is created. That's why we have a way to actually get the length of the array. I'll show you that later on.

And of course, after creation, the length of the array cannot be changed. So this is it. So if you work with an array, once you create it and you say you created an array of 10 locations, then this is it. This is how it's gone out, it's going to be. You cannot change it.

So of course, the question is, can I now have an array that can change in size? And the answer is yes. And we'll talk about that.

So every element in the array is called an element-- or rather, every item in the array is called an element. And every element is accessed by a numerical index. And by the way, the index for the first element in an array is always zero.

Now, looking at a one-dimensional array. So we consider here, for example, a program where you store 10 different ages of 10 people. So you could go ahead and declare 10 different variables, with the first one is ageOne, and then Two, all the way to Ten. And then assign to them the different ages, 27, 12, 82, and so forth.

But as you see you here, again, this is somehow not practical, because right now some of you are saying, yes, why not? I could do it this way. But here you have only 10 entries.

Imagine now you want to represent 10,000 ages. What are you going to do? Create 10,000 variables to represent the different ages? That is a bad idea.

So now we need to think of a mechanism by which actually we represent all these 10,000 ages or a million or whatever. In Java, we actually make use of the concept of arrays. Arrays, again, in Java, give you a much more convenient way to work with a set of data. And in this particular lesson, what we do is we learn about arrays and of course see how we can actually manipulate these arrays.

So by the way, creating a one-dimensional array now, in this case, it could be an array of integers, like that we see over there, that would be ages. Or it could be an array of shirts. Or it could be an array of string types, like names and so forth.

So the Java programming language allows you to group multiple values of the same type, again, using the arrays. Arrays are useful when you have related pieces of data but of course you do not want to create a separate variable to hold every single piece of data. So we can go ahead and create an array of primitive types, like ints or characters and so forth.

And of course, here, looking at, again-- an array, like we said, is a container object that holds a fixed number of values if a single type. Again, the length of an array is established when the array is created. We said that later on. Of course, after creation the length of an array cannot be changed.

And in general, the first element of the array is indexed with, again, in this case, the index zero. So for example here, if I have an array that starts with the index zero, then of course the size of this array-- and it stops at seven, the size of the array will be what? Eight.

Because the last element in the array is always represented by what? The length minus 1. That's typically how we see that.

And by the way, you can also, if you, for example, declare an array in this case that's called ages, you can use the length, this is a special type of keyword here. If you used, in this case, ages.length, it's going to give you the length of the array.

Now what we want to do is we want to learn the syntax in Java how to declare, instantiate, and initialize arrays. So here's the syntax so that you can folks can have an idea about how to do that. So if you want to declare an array, you put in the type. And then you open bracket, close square bracket, and then the array identifier, which is the name of the array.

For example, here I declared an array called what? status. And it's going to be an array of what? Characters. And then here I declared an array called ages. And it's going to be an array of what? Integers.

Again, declaring an array of object references and of type shirt and string would look like this. You got the type, which is shirt. You have the open square bracket, close square bracket. And then you have the shirts.

And then of course, in this case, the name of the array is shirts. Except that later on, you are going to see that this is an array, like in this case, it would be the array of the values for ages. But in this one here, it would be an array of references to objects of type shirt.

And of course, here we have also another array, which is called names. And it's of type what? String.

So in general, again, we always-- the syntax is the type, the open square bracket, and of course, the array in this case. The type represents the type of data that you're, again, in this case, putting in the array. And the array identifier would be the name of the array. And by the way, when you declare an array, the compiler and the JVM have no idea how large the arrays will be because you have declared a reference variable that does not currently point to any object.

Of course, the next thing is we need to instantiate a one-dimensional array. The syntax how to instantiate the one-dimensional array is you take your array identifier that you declared in the previous slide. And then now you go ahead and assign to it and new instance of the array.

In this case, we use the new. And we use the type. And of course, in between square brackets, the length of the array.

For example, in this case we declared an array of characters earlier in the previous slide. Now what we do is we instantiate that array that would be an array of size what? 20. Right? And that's how we do it. It's the new and then the type and then between brackets you specify the length of the array.

And then here is the ages that we declared earlier as an array of what? Integers. And now we instantiate this array with a one-dimensional array of size what? Five.

And then here, remember we declared names, which is an array of strings. And now we go ahead and, of course, instantiate it with an array of size seven, of type string.

And then, of course, the same thing here. Shirts, which is an array that we declared of type shirt. And now we instantiate it with, of course, in this case, an array of shirts of size what? Three.

Again, before you can initialize an array, you must instantiate an array object large enough to hold all of the values in the array. Again, instantiating an array by-- typically you define the number of elements in the array.

And by the way, when you instantiate an array object, every primitive element is initialized to zero value for the type you specified. Again, in the case of the characters, which is in this case status, it's initialized with the null character, represented by backslash U0000.

And then of course, for the array called ages, the initial value of an integer in this case is zero. And for the shirt array, the object references will be initialized with null, because they are not pointing to any object yet. Right? Any questions? OK.

Continuing with that, and now looking at, of course, again with the same concept, initializing. So we looked at instantiating. Now we're going to look at initializing a one-dimensional array.

Well, again the syntax in this case is what? It's pretty much you specify the name of the array, the index, and then you specify the value that you want to assign to that particular location. So for example, I can go ahead and say, I initialize location zero with what? 19, because remember that ages are what? They are integers.

And then you initialize second location, which is one, in this case the index one, with 42. And then the third one with 92. And then the fourth one with 33, and so forth.

And by the way, you can also set references to the shirt objects in the shirt array. So for example here, I say that my first location, which is indexed with zero, of my array shirts, will now point to an instance of type what? I initialize it with an instance of type shirt. And I do the same thing for the next one. And then I do the same thing for the next location.

So whenever you have an array of objects the array actually does not contain the objects, but it contains what? The references to the object. Remember that all the time, all the time, all the time. Everybody's following that? Good. Good.

So we should note also that the first element of an array, again, is indexed with zero. And the last element is indexed with what? The length of the array minus 1.

Continuing with that, now what we want to do is we want to declare, instantiate, and initialize a one-dimensional array. It turns out that we actually can do this in one statement in Java. The syntax is type, and then open square bracket, close square bracket, the name of the array, and then a comma-separated list of values.

And here's an example, where in this case I declared, in this case on the left side, an array of integers. And then I go ahead and instantiate and initialize it with what? With this array, which is a bunch of values separated by what? By commas.

It turns out that when I create this array and instantiate and initialize it, it's going to be of size what automatically? Five, because there are five locations. One, two, three, four, five.

I can also do the same thing for the array shirts. I know that it's an array of type shirts. I declared this way. And then here, I initialize it with what? With three instances of what? Of type shirt, which means this array shirts will contain references to three different objects of type shirt. Everybody's following that? OK.

And by the way, one thing that you need to remember. You remember that yesterday we declared an object. And then we instantiated the object. Remember that?

Well, guess what? You cannot do that for arrays. You cannot do this in two steps. This is not permitted. It has to be within one statement. You cannot do it within two statements.

This, what you see now here, is an error. And that means it will scream at you. Right? Everybody's following, folks? OK. Good.

Continuing with that, and now of course, the next step that we want to see here is how to access a value within an array. First of all, I could set a value in an array. For example, I can set location for the status, location will be, since it's of type character, it's going to be containing what? The character 3.

And then I can go ahead and set the first location of my array names to point to what?-- or rather, the second location to point to what? To the string called Fred Smith. I can also assign 19 to the second location of the array ages. And I can assign 9.99 float into the third location of the array called prices.

Got that? This is how to assign, in this case, either a reference variable to an array location or a value to an array relocation if it's a primitive-- Right?-- if it's of type primitive, or primitive type.

Now, looking at getting a value, reading a value. So for example, here I can go ahead and declare S as a variable of type character. And then I assign to it what? Status zero, which means what? I assign to it the value that is, again, in this case, that status, the first location holds. Right?

Here, I go ahead and declare a string, a reference variable of type string, called name. And I assign to it what? The first location of-- or rather the second location of the array names, which means now name, the name variable, will point to the object, which is, again, in this case, represented by the first location of the array names. Everybody sees that?

I can also do the same thing here. I declare age as an integer variable. And then of course, in this case, I assign to it the second location of the array ages. And I can do the same thing here, where I declare price as a double. And I assign to it the second location of the prices array.

So again, every element in an array is accessed using the index. To access a value from an array state, again, the array name and the index number for the element. That would be inside these square brackets on the right side of your assignment operator. Everybody's following that, folks? Good.

Continuing with that now, let's go ahead and look at how actually all of this is done underneath the hood inside the heap and the stack memories. Arrays are objects, folks, that are referred to by an object reference variable.

For example here, first I declare, in this case, a variable of type character. And I assign to it the character L, capital L. This, of course, will be located, in this case, the name is size. And of course, the value is L. And that's always, in this case, saved into the stack memory and/or the memory stack.

And of course, in this case, the second one is I go ahead, in this case and create an array of characters called sizes. And I assign to, again, these elements is going to be of size three. And where the first location contains S, capital S. The second one contains the M character, and the third one contains the capital L.

It turns out that if I do that, first of all, the name of the array, what it does, it represents the reference to the array. So it represents the reference to the array. Again, this is given to you automatically by the JVM. And then, of course, you see that this points to this array that actually, in this case, is located in the heap memory.

Everybody sees that? So far, so good? OK. Good.

Now let's go ahead and look at another example. So first of all, we here declare a reference variable called myShirt, and initialize it with a new instance of shirt. So automatically, myShirt, we're referencing an object of type myShirt that you see here.

How about now if I declare an array of type shirts called shirts? And of course, in this case, instantiate and initialize it with, again, three different references to what? To objects of types shirt.

So the way to-- again, this shirt here will be a reference to the array. And this array contains what? It contains the references to what? To the three different objects that you see.

So you see that the array that you created here called shirts really contains what? The references to the objects, and not the objects themselves. The objects themselves are located where? In the heap memory.

Everybody sees that? Everybody sees that? No questions? OK. Good.

That's important, folks, very, very important.

Does this mean arrays take more memory?

Yes. Again, the question is does it mean that arrays of objects, again, occupy more memory? And the answer is yes, as you see here.

Obviously the array itself contains references to objects, but you have to somehow, in this case, the garbage collector will go ahead and allocate memory for all the objects, again, that are referenced by the locations of the array. Good question.

Continuing on, now we've got a quiz. The quiz says, the following code is the correct syntax for-- and then, an array. And then, of course, we need one which is array, underscore identifier equal new type and length.

And here, they're telling you is it declaring? Is it setting array values for? Is it instantiating? Is it declaring, instantiating, and setting array values for?

Of course, the answer is what? Instantiating. Right? And that's the C. So here we're instantiating this array identifier, again, in this case, by using an array of size length. Everybody's following?

Continuing with that, now I have a second quiz. It says, given the following array declaration, determine which of the three statements below are true. And here we have int. We have an array called automobile of type int. And of course, we, in this case, instantiate it with an array of size what? 13 integers

Again, in this case, how about A, automobile[0] is the reference to the first element in the array. Is that true? Yes.

How about automobile[13] is the reference to the last element in the array? That's not true, because the last element is length minus what? Minus 1. That should be 12.

And how about there are 13 integers in the automobile array? And that is true. Thank you.

## 2. Creating and Using Arrays, Part 2 - 23m

Now let's go in and look at accessing command line arguments. You see, a couple of you folks asked me earlier, and they said again yesterday, and even today when I was discussing it with Atif. And I said-- he was just checking his code. And I said it would be a nice idea. That was about the specifying the time of the day. OK?

And then I said, now he keeps on changing it to 100, which is one o'clock, or 400, which is 4 o'clock in the morning. And I said it would be a nice idea to actually enter this as an argument, and you can enter it any way you want.

Because the way we did it at the beginning is we changed the value of the variable and then we have to compile again and run again, which is a bad idea. We should actually write a program, compile it once, and that's it. That's why Java, we say, is develop once and run everywhere. Right?

So let's go in and look at the concept of args. So we see this args array in the main method. And in general, by the way, if I have a class called ArgsTest, it has a main method. And as you see here, it accepts what? A string, an array of what? Of strings called args.

What we could do here is we can go ahead and when we run the class ArgsTest, we can pass, again, arguments here. This would be the first parameter that goes into the arg zero. So in this case, what we are doing is we're entering them and then we're doing what? We're printing them out. That's all what we are doing.

And then the second, we enter the second one. By the way, they're separated by spaces in this case. The second parameter goes into arg one, and then we'll print it out here. So when you pass strings to your program on the command line, the strings are put in the args array.

Again, to use these strings, you must again, in this case, extract them from the args array. And in this case, the first one represented by arg zero, second one by arg one, and so forth. And of course the ArgsTest class that we see here shown in the slide, it extracts those two string arguments, pass them to, in this case, the command line.

We can pass them in the command line here. And of course, after that, when they're picked up by the main method, they're printed out. That's what you see here. Arg zero is hello, and arg one is 1. That's pretty much executing these two print statements.

So they didn't define the length of the arg?

It is, again, because in this case it is an array. So if you want to get the length of the-- sometimes you write programs where you say, OK, if args dot length is greater than or equal to zero, then go ahead and read. Or if it's less than or equal to zero, then print a message saying you need to enter some arguments, and so forth.

Because it's an array, then the length is automatically created. Remember when we defined arrays at the beginning, we said once the array is allocated, once it's created by the JVM, then, of course, that length is automatically specified. Then we said you can access it through the name of the array, dot, and then length. Remember that? That's how it was.

Here in the argument you can have as many--

As many as you want, of course. Yeah. As many arguments as you want. Good question. So net beans, by the way, does not allow you a way to run the Java class from the command line. But you can also set the command arguments. In fact, in net beans, if you want to do that, let me just, as an example, show you.

Just open any type of project here. And then, of course, if you right click here on click on properties, and then, once you get the project properties, you click on the Run category, and that's where you enter your arguments. See? You can actually enter them here, and of course it will go ahead and use those arguments and work with it. Yep.

Is there an advantage in defining the length of the area? When you're defining it, or rather, leaving it empty--

Well, for an array, if you work with it, you always define a length. The question is that, once you define an array with a particular length to work with it, you cannot change that length. So the question is can I now have some flexibility, where maybe at the beginning I start with 10, and then I realize that I need more space.

We see that towards the end of the lecture, how do we do that. Towards the end of this lesson. Thank you. Continue with that now. Of course, remember, folks, that when you read those arguments, they're always read as what? Strings.

But sometimes when you enter them into your main method, maybe you want them to be represented as integers or as objects of type whatever, employee or any type of-- so what do we do in this case? We can go ahead and create the mechanism by which, in this case, convert those. OK?

So here's an example where, in this case, I have the ArgsTest class, and in it I have a main method. And in this case, of course, I'm inputting a couple of arguments. So I have a system dot out dot println, again in this case, print the total, which is the sum of arg zero plus arg one.

Which means, these guys now, when they're entered at the beginning, they are entered as what? As strings. So I have to have a mechanism by which what? By now converting those into integers, since I want to sum them here.

The way I do it in this case is I take arg zero and pass it to the method parseint on the wrapper class integer. That will go ahead and take the arg zero and convert it into an integer, and of course assign it in this case to int. OK?

And then the same thing with the next one again, in this case, where we do the same thing and convert it into an integer and then pass them. So, for example here, when we have arg zero plus arg one, this is going to print what? Anybody can tell me?

32?

It's going to print 23. It's going to print 2 and then concatenated with the arg, because the two is read as a string, and this one is read as string. And the plus here represents what? It represents the concatenation. So that's why you got the output as two three. I should not even call it 23, two three. OK?

On the other hand, if I now convert this string into an integer, and then convert this inside of it into this variable and then convert this into an integer-- by the way here, the parseint converts that string into an integer-- and save it into arg two. And now if I print this, it's going to print what? Five. See?

Can we have in beginning the main, we are using string in square brackets.

Yeah.

Can we pass int in square brackets too?

No. It's always string. So the question that Vinot is asking here is, can I replace this with an int? And the answer is no. All the time when you read arguments, they are always read in the form of strings. Then after that, you need to do what you need to do inside to convert those into whatever.

Here it turned out that we needed them to be converted into integers. In another application, maybe you want to convert them into doubles or any other type of them. And that is your job as a developer of the application to handle that by hand. Right? Which, by the way, makes sense. Because here we see only examples.

But think about when you get into the enterprise applications. Lots of times, when you fill up a form, you really are inputting some strings. Right? That's from the browser. And then when they click on the Submit button, then that data needs to be somehow converted into objects.

That is, again, the job of the developer to actually handle all of that, either using service and JSPs, or using the JSF technology. Everybody's following, folks? Good. Continuing with that now, let's go out and look at working with two dimensional arrays. So you can actually also store matrices of data by using multidimensional arrays.

Again, multiple dimension arrays have two or more dimensions. Again, a two-dimensional array is an array of arrays. In Java, you always call them an array of arrays. A 3D array will be an array of 2D arrays, and a 4D array would be an array of 3D arrays and so forth.

And in this diagram which shows a two-dimensional array representing in this case some descriptive names of Week 1, Week 2, and then Week 3, Week 4, and then the days, Sunday all the way through Saturday. Everybody sees that? OK, good.

Now we want to see how to declare two-dimensional arrays. The way we do it is again, in this case, we use the type and then the first square brackets and then the second set of square brackets and then the identifier which represents what? The name of the array.

For example, here I have the yearly sale which is going to be what? A two dimensional array. Of type what? Integer. So remember, folks, that two-dimensional arrays require an additional set of square brackets. Again, the process of creating and using the two-dimensional array is pretty much otherwise the same as the one-dimensional, except that the syntax here, you add what? Another set of the square brackets.

And now looking at instantiating a two-dimensional array. Once again we declare that array, now we need to instantiate it by again using the new, the type, and then here, as you see. First you specify the number of arrays, and then here the length of every array.

For example, here we want to instantiate a 2D array that has five arrays and of course four elements. So in that case it will be five arrays. Here's one. Here's the second one. Here's the third one. Here's the fourth one. And here's the fifth one. And of course, of what? Of four elements. Every one has four elements. One, two, three, four.

Got that? And that's how we represent this. Everybody sees that? So it's five by four. So in here the array identifier represents the name, and of course the number of arrays is the number of arrays within the array. And the length is the length of every array within the array.

And by the way, speaking of that array of five by four, let's go ahead now and initialize a two-dimensional array. For example, I can go ahead now and initialize the location zero zero with what? With 1,000. And that would be location zero zero is here. Location zero one would be this one by 1,500. Location zero two would be this one here.

Location one zero would be this one. Location three three would be this one. Right? It has zero, one, two, three, and then here, zero, one, two, three. And that's why you have the 2,000 here. Everybody sees that, folks?

So when setting or getting values in two-dimension arrays, indicate the index number in the array by using a number to represent the row, and of course followed by a number to represent the column. So far, so good? Now, of course, the question is, we've been working with arrays, and it turned out that we create an array of a particular size, we cannot change that size, unfortunately.

Next, now, let's go ahead and look at the array list class. So arrays, then, typically are not the only way to store lists of related data. We have the array list, which is, by the way, one of the member of list classes, and it has a set of usable methods for managing its elements, like add, get, remove, index, and many, many others.

And by the way, in the advanced course, you will be able to see a whole set of collections and work with them. Actually, you're going to work with collections and generics, which, by the way, were introduced in the Java SE5. Let's go ahead and just take a look at the array list out of curiosity.

And this is the array list. It is a class, as you see here. And of course there is an abstract list, again, that is a superclass and there's the abstract collection, and then, of course, there is the superclass object. Just out of curiosity, we click on the link method, and we see the list of the methods here.

So as you see, there is a whole set of methods that are useful. And of course, one of these days, if you use an array list, you'll get to actually choose some of these methods and work with them.

Going back to the lecture, we said that you do not need to specify the size when you instantiate an array list. Again, as you add more elements, the array list grows as necessary. And of course you can specify an initial capacity, but it is not really mandatory to do so. And by the way, an array list can store any only objects, remember that, and not primitives.

So of course, in general, for lists that are very dynamic, it may be easier to work in this case with a specialized list type object. Again, this can free you from having to write code to keep track of index of the last piece of data added, keep track of how full the array is, and determine if it needs to be resized.

And of course, increase the size of an array by increasing a new one and copying the elements from one to another one. So it avoids all these headaches. And that's why array lists are attractive in this case. Except be careful in terms of performance wise, if you are keeping on adding elements, and then need to know something is happening.

In fact, if you take a course that we have, and I talk about that on Friday, it is the Java performance tuning course. And you will see that, we'll mention that to you. Just to make sure that these very dynamic type of collections or lists, sometimes you need to be careful how to work with them, because they might affect the performance of your application.

Now looking at class names and the import statements. Well, array list is of course in the package Java dot util. And by the way, to refer to the array list in your code, you can fully qualify the Java dot util dot array list and then my list. Or you can go ahead and add the import statement of the top of the class.

So in general, you folks have a tendency to import these. Like, for example, Java dot util dot array list. And then of course in your class, you can just make use of the array list, and that's good enough. But lots of times we actually do use that. So remember, folks, that you can go ahead and import pretty much all the whatever classes you need to do.

We just want to also add that classes in the Java dot lang package can be referred to in your code by just their class names. You do not need to import it again. They do not require the fully qualification or use of the import statements.

So all classes other than the packages, again, in this case, for example array list, require that you fully qualify them in the code. Or you can go ahead and use an import statement so that they can again be referred to directly in the code. And here's an example where, in this case, you can go ahead and import the Java dot util dot array list.

Or we can also do this, import Java dot util dot asterisk, which means what, folks, here?

Everything.

Everything under the util package. Thank you. Now working with an array list. Here's an example where, again, we're showing you how to work with it here. We can go ahead and declare an array list this way. We instantiate the array list by making the reference variable my list again equal to new array list.

And then, after that, we can use the add method by adding what? String John and then Ming and then Mary and then Prashant and then Desmond and so forth. And by the way, I can go ahead and now invoke the remove and I pass the zero. And if I do that, then it's going to delete what, in your opinion? Remove what? The first one, which is John. Good.

And then I can go ahead and remove, in this case, the my list dot size minus 1, which is going to do what? It is going to remove this again, Desmond. And then of course I can go ahead and specify the string and say I want to remove directly the string. So I have choices. Either specifying the index, or specifying the string itself. Yes, sir?

So it doesn't say dot length. It says dot size here.

Yes. The array list has dot size. And by the way, we can go ahead and investigate that here. OK? So we have the size here.

When you said remove, it removes the last one?

Well, it all depends what you say. For example, if I say remove zero, that means it's going to remove what? The first one that I entered. And if it's here, my list dot minus 1, because I know the array list also starts with what? Index zero, the first location. So here I'm trying to get the length minus 1, which, by the way, represents what? The last one here.

Or you can specify the name of the string itself that you want to remove. Like in this case, I want to remove the string Mary. Got that? So at the end, we're left with what? Just as a quiz.

Ming.

Ming and what? And Prashant. Thank you. Good job. And we tell you here again, this removes the first element. Again the my list dot size minus 1, this removes the last element because the size gives you the number of elements, and we know that the array list starts from zero to what? To the size minus 1.

And then remove Mary, this removes specific element. OK.

So here, when we say remove zero, does it reduce the size of whatever you stored?

Well, that's done always. So the question is does it reduce that? That's always done dynamically underneath the hood by the JVL. Good question. So at the end, we end up with, again, Ming and Prashant. Exactly what you guys said.

And we have a quiz. And this quiz says a two-dimensional array is similar to a, and then, we pretty much give you all these answers, and of course the best answer here is what? C, which is a matrix, right? It looks like a matrix.

So, in summary, folks, in this particular lesson we looked at an array in Java which is again a data type that is composed of a set of other data types. And we looked at the arrays are created with a specific size. And we looked at every element in an array can be accessed using the index. Again, the first element is zero.

And of course, the first index is zero. And of course the data type of an array can be another array again. And we've seen that. And of course, that's the two-dimensional array concept. And we also looked at the other option which again uses a specialized list, which is called an array list.

Now remember, folks, that we also have a bunch of practices for this lesson. So the first practice of Lesson 8 would be creating a class with one-dimensional array of primitive types. The second one is creating and working with an array list.

And the third one is using runtime argument and parsing the args array again, in this case, making use of the arguments that we should pass to the main method.

Of course, let's go ahead and look now at the details of these practices for Lesson 8, which is creating and using arrays. The first one, again, as you see here, which is Practice 8-1, is creating a class with a one-dimensional array of primitive types. And again, you see them here.

So pretty much we give you hints on all the steps that you guys need to go through to again be able to achieve and do the Practice 1. As you see, a lot of details we give you.

And then, of course, in Practice 2, we create and work with an array list. So you get a chance to again work with array lists. Again, we give you all the details on how to do this practice. OK?

And then the last practice, which is using a runtime argument and passing the args array. Again, you get a chance also to read all the detailed steps on how to finish this practice, the third one. OK?

So let's go ahead and do the three practices for Lesson 8. And after we finish, we'll move to the lecture of the Lesson 9. Thank you.

## 3. Practice 8-1: Creating a Class with a One-Dimensional Array of Primitive Types - 13m

OK, folks so after looking at Lesson 8, where we looked at creating and using arrays. Of course, over there we showed how we declare a one-dimensional array and two-dimensional arrays. We also looked at the concept of instantiating and initializing an array. And we also looked at the concept of the array list and looked also at the enhanced for loop. Let's go ahead, now, and look at the practices for Lesson 8.

And we start with Practice 1, which is 8.1, where we are going to create a class with a one-dimensional array of primitive types. Again, in this practice, we going to create an array containing the numbers of days that an employee the Duke's Choice company receives based on the number of years that the employee has worked for Duke's Choice. Again, here we see a table that says if an employee works up to one year, then they get 10 days. For one, two, or three years, up to three years, that's 15 days. For the folks who actually worked for four or five years, that's 20 days, and for those who works six and more years, those folks we get 25 years.

So again we have a class that is already given to us as an assumption, which is the VacationScaleTest. And the task is to create a new project called Practice08 and set the source package folder to, again, make use of all of the D:/labs/lesson08. And we should also remember to also change the SourceBinaryFormat property, again to the JDK 7.

So let's go ahead, now, and first create a Java class called VacationScale. Again, we declare, but do not initialize, two public fields over there, which are the vacationDays, which is of type Integer that's an array called vacationDays. And of course a variable of type Integer called yearsOfService. Again, they give us a hint, here, using the square brackets next to the data type to indicate that the field is and array.

After that, we get into creating a method in the VacationScale class called setVacationScale, and again, the table below, we give this pretty much the high-level steps for this particular method where, in that case, we initialize the vacationDays array to be of size seven. We also, again, populate every element of the vacationDays arrays to align, again, a number of years of service with the correct number of vacation days, and that of course, comes from the table that we've seen earlier. Now, after that, we use the new keyword to initialize the vacationDays array. Again, supply the size of the array within the square brackets, so again, as we see in step a, 3-1, and then after that, assign every array element beginning with the vacationDays [0] with the appropriate number of days of vacation from the table shown above that I showed you earlier in the previous slide. And then for example, an employee with zero years of service is entitled to 10 vacation days, and then of course, that this will be, again, translated into using vacationDays with zero index, then the location would be equal to 10.

And we continue all of that through the-- so it would look something like we see here in the code. Of course, this is not done yet. Their vacationDays [5] would be 20, and then vacationDays [6] would be 25 and so forth. Now, after that, they said pretty much, again, looking at the details here, where we say create a public method called DisplayVacationDays that display the number of vacation days due to an employee with, again in this case, the years of service indicated in the yearsOfService field.

Again, we use the if if/else construct to check for a valid yearsOfService, and we give us a hint, here. We said we can use a variable within the square brackets to represent the array index number. For example, here, vacationDays array, and between the square brackets, we put that variable, in this case, called yearsOfService. And of course, the method would look like something that we see in that example. Of course, we save, and of course, compile your program, run the VacationScaleTest class to test the program.

We should note, also, that the program as currently written, throws an exception, an error. Again, you fix this problem in the next few steps. And let's go ahead and throw that, and look at that. So the exceptions thrown by the JVM here is an ArrayIndexOutOfBounds OfBounds exception. Again, you're output windows would look something like this, as you see here, and pretty much showing us how, in this case, how all of this looks.

So you see that we have an exception in the main thread, and it says ArrayIndexOutOfBounds exception, and it gives you number 10 of the VacationScale.DisplayVacationDays. Of course, this exception is thrown when an attempt has been made to access a non-existent index of an array. Again, we should notice that the index array that caused the exception is shown in the error message, which is the index 10, so of course, in this case, we should remember that this array has seven elements, and of course, the index by the number zero through six. So why did the program try to access index 10? Again, the answer is, if you look on the DisplayVacationDays method, you see that the yearsOfService field is used as the array index an argument to the system.out.printIn method.

And it is, of course, conceivable that the employee would have more than six years, in this case, which is the highest index, six years of the service. So the DisplayVacationDays method needs to be modified to, again, account for the strictly greater than six yearsOfService. Again in this case, we change the if/as construct to also check for the yearsOfService value that is, again, greater than, or equal to, six or yearsOfService greater than, or equal to, six yearsOfService, again, the same number of vacationDays. So the hint for any yearsOfService value between zero and five inclusive, you can display the value of the array whose index corresponds to that value, and for a yearsOfService of six and above, use the value referenced by the last array index, which should be the array with index six.

And if we fix this, then of course, this is how, actually, we fix this in the code. That would be the solution, and then in that case, of course, whenever we save and compile, it would work properly. Let's go ahead and see that in NetBeams. So again here, they already gave us the VacationScaleTest that was given to us, if you remember. At the beginning of the first practice, we said that this is given to us.

So obviously, this is given to us where this VacationScaleTest, as all the test classes, does have a Main method, and then on line five, we create a new instance of VacationScale and make it referenced by the reference variable myVacationScale. And then inside, on line seven, we have setVacationScale, a method that is invoked on the reference variable myVacationScale. And then we set the yearsOfService to one, and we display, again, we call the DisplayVacationDays. And then of course, we set the yearsOfService of five, and then we go ahead and invoke the DisplayVacationDays so that I can specify that for us. And then we set the yearsOfService to 10, and in this case, we'll go ahead and invoke the DisplayVacationDays on the reference variable, in this case, called myVacationScale.

And of course, what we are interested by here is, of course, the class. This is the class that we developed in this particular practice, so it is called a VacationScale, and as you see, following exactly the steps that they asked us to do, we declared, in this case, a variable of type array of integers called vacationDays. And then a variable here, which is called yearsOfService of [? type ?] integer.

And then here, we implemented the method called CertificationScale. That, of course, in this case, first initializes the array to an array of seven integers, and the size is seven. And then they asked us to follow the table that we looked at the beginning of the practice, where we said 10 to vacationDays [0], and then 15 to vacationDays 1, 2, and 3, and then 22 vacationDays 4 and 5. And then of course, 25 to vacationDays [6], with the index six.

And then they asked us to, of course, implement the method DisplayVacation, where we use the if/else, of course, to find out how many number of vacation days of the employee would get. So of course, we say here, if the yearsOfService is greater than or equal to zero and less than or equal to six or, rather, strictly less than six, then go ahead and print the days of vacation, and then print, in this case, the vacationDays location with, of course, the specific yearsOfService value. Again, the test here would be the first one 1, the second one 5, and the third one 10. And then, of course, after that, following the implementation, and we see else if the yearsOfVacation is greater than or equal to six, then in that case, you print directly the last one, which in this case, is 25, and then else, of course, we say an invalid yearsOfService.

So of course now, what we want to do is, of course, run the VacationScaleTest to test our VacationScale class. Let's go ahead and run that, and as you see this actually works very nicely because for the number of years, one, that definitely fits the fact that, in this case, if it's one year, then it's 15, so you see that. And then, of course, after that, they assign five, and that would be automatically, in this case, 20, and that's why we have 20. And then after that, I know we decided is going to be 10, and then for 10 years, it's going to be, also, in this case, 25 years because, as you see, for the number of years greater than or equal to six, it would be always the six, which is the seventh location because the last location is always the length minus 1. And that, pretty much, ends the practice one of the Lesson 8. Thank you.

## 4. Practice 8-2: Creating and Working With an ArrayList - 12m

Let's go ahead now and look at practice two of lesson eight where we create and work with ArrayList. In this practice, we are going to create a NamesList class and the NamesListTest class in order to experiment with populating and manipulating ArrayLists. Again, there are a couple of sections in this practice. In the first one, we create the two classes and then add a method to the NamesList class to populate the list and display some content. And in the second one, we add a method to manipulate the values in the list.

So the first one we create a new Java Main class called NamesListTest. And of course a reminder in this case, right-click the project name in the Project windows and select, again, New Main class and then, of course, leave the Main method empty for the time being. And of course, we'll add the code later. And then create a Java class called NamesList. Again, in the Name class declare a public ArrayList and call the listofNames. Again, do not instantiate the listofNames field yet.

Note again that when you type the word ArrayList, the editor indicates a warning in the margin of this line. Again, it does not recognize the ArrayList class so you must import this class to make it again visible to the compiler. That's why we put your cursor over the warning icon in the margin to see the warning description. Click Alt-Enter to view and select from the list of hints to solve this problem. Again, select Add Import for the java.util.ArrayList as again you see on this snapshot. Again, the import statement is placed on the top of the Array List class. And it would look something like this.

And then after that, we add a new method to the NamesList class called the setList again. The code, in this case, called the method as described in the table. Again, more detailed steps can be found, again, below the table, in this case. So again the table kind of summarizes the whole thing for us but of course, through A, B, C, D, and E. And if we take a look at the detailed steps again, use the new keyword to instantiate a listofNames. And again, we show you here the example. listofNames equal new ArrayList , again. Invoke the add method of the listofNames object to pass a String value containing the first name and the last name separated by a space. Again, we see the example here in this case in the table. And of course, repeat step B three more times using a different name in every method invocation.

And then after that, again, use the system.out.println to print out all the names within the listofNames object. And again, use a suitable label and concatenate the list of objects to it. Again, example would be system.out.println. And then we put in a message to, again, make the output friendly. And then NamesList colon space and then, of course, print the listofNames. Use the system.out.println to print out the size number of elements. That would be step E of the listofNames object. Again, use the size method of the listofNames object and concatenate a suitable label. And as an example, we see it here in the system.out.println the friendly message system of the ArrayList. And then, of course, in this case we concatenate the size of the listofNames.

And the solution would look something like this with setList. And then you see here how we instantiate the ArrayList reference variable code listofNames within a new instance of the ArrayList. And then we use the add method to add Joe Smith, Mary Palmer, Jose Gonzales, and Linda Baker. And then of course, we apply the to print statement, println statement, that we have seen earlier. Again, save and compile.

And of course, open the NamesList class in the editor, in this case, and in the Main method and instantiate a list, in this case, object called Names using the new keyword. And of course, invoke the setList method of the Names object. Save it and compile your program. And of course, run the NamesListTest class then after that, again, manipulating the ArrayList. That's where we get into creating another method, again, add another method to the NamesList class called manipulateList. Again, the code, again, called the method as described in this table.

You can also look at details shown in the next page. Again, here we have step A all the way through step F. And we see them here in detail where, first, we remove one of the names in the ArrayList using the remove method and passing the full names enclosed in a double quotes. Again, we should note that this method is defined as taking an object as an argument. A String literal, such as the quote-enclosed for name in the object, again, it would look something like this. And like listofNames.remove and then you pass the String, in this case, Joe Smith.

And then of course, step B we use the system.out.println to print the listofNames object. Again, use an appropriate label. And of course, use the system.out.println to print the current size of the ArrayList. Use an appropriate label. And then of course, use the add method of the ArrayList to add the name you just removed back into the ArrayList but at a different location in the list than previously. Again, we should note that the add method is overloaded that it has two different method signatures.

One of the add method takes an object and appends it to the end of the ArrayList. The other method takes an index number and an object. It inserts the object before the referenced index number, again, pushing all remaining list elements over one index number. Again, we use the latter add method as an example, again, is shown below that you see here just so that if you want to make use of the index. Again, in this case we want to insert it in the second location of the ArrayList. And if you remember, we removed it. And Joe Smith was the first one.

And of course, use a suitable label when printing the newly modified content of the listofNames object. Again, under part F use the suitable label when printing the new size of the list object. Of course, an example of the solution would be something like this, some code like this, where first you remove the Joe Smith. And then of course, you print your listofNames and then, in this case, print the size. And then we add Joe Smith in the second location and then print it again. And then of course, here we print the size.

In the main method of the NamesListTest class, invoke the manipulateList method of the Names object. Again, note you may need to click Save so that the compiler can resolve the reference to manipulateList. Again, save and, of course, and compile. Run your NamesList class to test your program. Of course, when you run it, you should be able to see, again, in this case, the output that would be similar to this. And they give you a note here that Joe Smith was previously located in index zero and Mary Palmer was in index one. And then after removing Joe Smith and then Mary Palmer now moved to the index zero and Jose Gonzales was at index one. And then Joe Smith was then added at the index one pushing Jose Gonzales to the index two position, or position two.

Let's go ahead now and take a look at all of this in, of course, in the code. So first of all we look at the NamesList. And you see we declared an ArrayList exactly what they told us in the problem, in the steps that of practice two of lesson eight. And then after that we asked us to create a setList method. See that's where we initialize the listofNames reference variable with a new instance of the ArrayList. And then after that they asked us to add Joe Smith, Mary Palmer, Jose Gonzales, and Linda Baker Strings.

And then, of course, after that, if you remember, they asked us to print the listofNames. That would be the whole list. And then after that they asked us to print the size of the list. And then after that they want us to manipulate the list. So in this case first we remove Joe Smith. And then we print the listofNames. Then we print its size. And then we add now Joe Smith in the second location. And then we print it again and, of course, print the size of the list, too.

So let's go ahead now and look at the test. And in the test you see how we pretty much create a new instance of the NamesList and then after that invoke first the setList method and after that the manipulateList. Let's go ahead and do that. And as you see it exactly does so. First, it looks like we printed this. First, we went through this. So we printed the list as it is. So it's going to be Joe Smith, Mary Palmer, Jose Gonzales, and Linda Baker. And that's exactly what we have here. Of course, the size is one, two, three, four. And that's four.

But then after that we now invoke manipulateList. And that's where, again, in this case it goes to the second method where, first of all, we get rid of Joe Smith and then print it and look at the size. So that's why here, the second here, we have, again, removing NamesList after removing element. So we get this message and then the list where Mary Palmer, Jose Gonzales, and Linda Baker. And then the size is three.

But then after that we made a decision to add Joe Smith in the second position and then print them again. So that's why now, in this case, we have Mary Palmer and then Joe Smith in the second position. And now, of course, you see how Jose Gonzales moved to the third position, which is at index two. And then Linda Baker, of course, the size is four. So you see that this pretty much showed us how we manipulate an ArrayList. And this, of course, ends the practice two of lesson eight. Thank you.

## 5. Practice 8-3: Using Runtime Arguments and Parsing the args Array - 11m

Let's go ahead now and look at the Practice 3 of Lesson 8. And that would be the last practice for Lesson 8. In this practice, folks, they want us to write a guessing game that accepts an argument and displays an associated message. This is a fun exercise, fun practice.

We create a class that accepts a runtime argument between 1 and 5, inclusive. Again, you are strongly-- rather, you are also randomly generating a number between 1 and 5 in the class and compare that value of the argument with the randomly generated number. This just gives us an idea how to actually create a game.

So again, no assumptions, again-- none. And then the task here we create a new Java Main Class called Guessing Game. By the way, we now know how, of course, to create a Main Class. If you remember, we go New File and then we create Java, and then we look for the Java Main Class, and we click Next, and then we put the name and so forth. So we all know about that. OK? OK. Good.

So going back to, again, the steps of this practice, they want us again in the main method to declare two integer variables as one is called "randomnumber" initialize it to 0, and the other one is "guess." And add code to the main method to accept a single argument of any number in the range of 1 to 5, inclusive, or the word "help."

Again, the high level steps are described in the pseudo code below, followed by, again, helpful hints. Again, if you need additional assistance, again follow the steps below in the pseudo code. And hence, that would give you again the best way to actually help you do this or code this practice.

So here's a pseudo code. We're pretty much showing you a little bit. By the way, it's always good to sometimes write some pseudo code to just give you an idea about how the high level of the code should be. And then after that, you get into the details. This is part of the learning process to design and code enterprise applications or object-oriented applications.

So again you get if length of argument is equal to 0 or the value of argument is "help," then print a correct user message. And then as in this case, go ahead and generate a random number between 1 and 5, inclusive. And then of course set that value in this case or save it in the guest variable.

And then of course check if the argument is strictly less than 1 and strictly greater than 5, then put an error message saying "invalid argument." Or otherwise again, go ahead and send. In this case, else check if the random number matches the one that you entered. And of course, if it matches, then you can print a nice message saying hey, congratulations. Otherwise say try again.

Again, they give you a hint here where we use a "compared to" method of the string class. Again, we saw that in this lesson, when we lectured the lesson to match the arg0 to help, and then generate a random number between 1 and 5, inclusive. And then that would be through a random method, which is a static method of the math class.

And then, of course, convert the random argument to an integer. That's why in this, before assigning it to a guest, that's why we cast it into an integer, as you see over there. And, of course, you see how you've got the rand Because the random method always creates a number between 0 and 1.

So, of course, times 5, that would be between, in this case, 0-- strictly less than 1 but we see 0-- and strictly less than 5. That's why we add 1. OK? And since we're converting it, then automatically it's going to shift from instead of 0 to 4, it's going to shift from 1 to 5. That's why we added the 1.

And then convert the runtime argument to an integer, like we said before, in these case, assigning it to-- we can use in this case the Integer.parseInt method to do the conversion. And we see that later on in the code.

So again, if the first argument in the args array is equal to "help," or if the args array is empty, then display the usage of the program. Again in this case, usage-- Java guessing game, argument, whatever-- and enter-- please enter a number between--and 5, that's whatever you want to put as a message. It should be, by the way, a friendly message.

If a 1, 2, 3, 4, or 5 is entered, then, of course, generate that random number and convert that arguments into an integer by using the parse method of the wrapper class capital integer. And then, of course, after that, compare the guess to the random number that you generated. And of course, use the "if" construct to do that. Again, if there is a match, then put in a congratulations message. Otherwise, they say "go ahead and try again."

And this would look something like this, folks. OK? And we see that soon in NetBeans. And then compile the program, and after that, go ahead and test that.

Now we should not also, when using the IDE, you don't have access to the command line to provide runtime parameter. Therefore, you enter. You guess a runtime parameter. So as a runtime property of the project, and then run the entire.

So in this case, you right click your project and then go to the Properties. And then you select the Run category. And then from there you choose the main class. And of course, after that you enter your argument. And we see in this case, a snapshot of that.

And by the way, after that you go ahead and use the icon-- the green icon that you see here inside the red square-- and that's how you run, in this case, your program or your application or your project. And then, of course, keep on running it. At some point in time, it's going to say "great guess" and "you got it."

Let's go ahead actually do that, so that we can see exactly what we are doing. Of course, if it doesn't match, it's going to give us a message "sorry, the number was 3. Try again." Let's go ahead and do that.

And for that, we are going to open the class. So as you see here in the class, it has a main method. We did exactly what they asked us to do-- declare random number as an integer. It's available as an integer.

Type integer and initialize it to 0, declare a variable guess and then after that if now the arg's dot length is equal to 0, which means we didn't enter anything, or the arg0 is compared and it's actually help. Then in that case, you go ahead. And in this case, of course, print this friendly message, uses Java, guessing game, argument, please enter an number from 1 to 5, as you guess.

Else, if you enter it again, a number, else go ahead and generate a number between 1 and 5-- we've seen -- and save it into the random number variable that we created over there. And then, of course, after that, go ahead, in this case and pass the arg-0 that you entered into an integer and save it into guess. And then compare-- do an "if else" here.

If "guess" is strictly less than 1, or strictly greater than 5, this is of course the sign for "or," then go ahead and print invalid argument, enter a number between 1 and 5. Only, else if the guess number is equal to the random number, then say great, you guessed it right. Else of course, you say sorry, the number was whatever you guessed at that time, please try again.

Of course, the way we run this, like we said, folks, and they specified that to us in the activity guide, and of course in practice 3 of lesson 8, first of all, you go to Properties, and then you choose the Run category, and then you have to browse to choose the guessing game class that is going to-- as the selected as a Main Class. And then here you enter an argument.

For example, let's assume that I entered argument 3, and then, of course, in this case, we click OK, and then, now we run the project from this Run Project icon here. So if you run it, so it says "Sorry, the number was 1. Try again."

So it looks like the generic number was 1. We'll try it again. And it say OK, now it actually did it the right way.

And how about, by the way, if I now right click Properties, and then click on the Run category, and now here I'm going to not enter anything. And let's see what happens here. So of course, in this case, it going to go ahead and say usage, which means now the length of the arc is 0, and it's going to print this message for me. And that's why you see it here.

Let's go ahead try it another time, folks. But this time, we are going to click around. And then we're going to write here "help." And then click OK. And the reason why I'm doing that is because we said then even the arg0 is help, then you should print this one again.

So let's go ahead and do that. And you see, it gives me the same message again. Because in this case, it pretty much given me the help. And it's telling me please enter a number between 1 and 5.

So in that case, I'll go ahead and click on Properties and click on Run category. And this time, for example, let me try 5. And then I click OK.

And then I run the project again. And of course, it says sorry, the number was 4 that was generated. So we'll try again.

And then again, it says sorry, and then we try again. And then it says sorry, it's 1. And then we try again.

And then now it actually generated a number 5. And of course, this, of course, would be a great guess. And it says you've got it right.

And that pretty much ends the Practice 3 of Lesson 8. Thank you.
