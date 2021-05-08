# 2: Java Syntax and Class Review

1. Java Syntax and Class Review, Part 1 - 37m
2. Java Syntax and Class Review, Part 2 - 39m
3. Practices for Lesson 2 - 7m

## 1. Java Syntax and Class Review, Part 1 - 37m

So after the introduction of this course, folks, let's go ahead and look at module number two or the Lesson 2 that talks about the Java syntax and class review. In this lesson, we are going to look at creating simple Java classes by looking at creating primitive variables, manipulating strings, using the if-else and the switch branching elements, looking at iterating with loops, creating arrays. We'll also look at using Java fields, constructors, and methods. And we'll finished by looking at what's a package and how do we use it and what's an import statements and of course how do we use that.

Let's start by looking at the Java language review. Well, this lesson is a review of the fundamental Java and programming concepts. And it's assumed that, of course, you folks are familiar with these concepts, which is the basic structure of the Java class, program block and comments. You should be able to, again, by now be familiar with variables, the basic if-else and the switch branching constructs that you folks must have seen in Java, an introduction to Java or in languages like CNC and C++. And of course, familiar with iteration with for and while loops.

Let's go ahead and look at the class structure. Well, as you see here, in the class structure we always start by first defining the packages. And packages are always defined by the keyword package, right at the beginning of the file on the top. That's actually the first thing that comes into the file. And that, by the way, folks, before the import statements. And then after, that the package name. The package name has a tendency to maybe contain a path to the folder because it could be a package inside another package inside another package. Right? OK.

And then we have import keyword. The import keyword, again, defines a bunch of other classes and groups of classes that you are using in your class. Again, those classes could be coming from the Java API classes or different packages, or it could be packages that you already built. Because you could be building an application or a set of applications that are set in one of the packages, and of course you are going to use those packages to help you build your newer application, which means your newer application depends on the classes existing in the packages that you folks implement.

You also have the next thing is the class keyword. And the class keyword, by the way, is important because the class keyword here pretty much precedes the name of the class and tells the compiler that here what you're building, the construct you're building here, is a class. OK? In this case, you're declaring a class that will be called the class name. And by the way, we also added, in this case, the modifier public. When we added the modifier public here, what it means is that this class can be accessed from anywhere outside.

And then if you take a look at the class, it always, by the way, is located between a couple of curly braces, open curly brace and closed curly brace. Than inside the class that's where we have now the declaration of your variables, also known as fields. By the way, lots of time we call them instance variables.

And you have your constructors, OK? And these are the constructor methods. Constructors are a little bit of a special type of methods. When we get there, we'll talk about them. And most probably, you folks have an idea about some of these constructors, because you worked already with Java and you have some basic knowledge of Java. And you have also a bunch of other methods. These methods here, folks, will be your business logic type of methods that allow you, of course, to handle any functionality that you want this class to handle for you.

Continuing with this now looking at a simple class, again, in this simple class, which is a simple Java class with a main method. So as you see here, we have a class called simple, and we have the keyword class in front of it. We have also public, which means it has a modifier as public. It can be accessed by anyone outside. And in addition, by the way, it turns out that this class has a main method. OK? This main method, by the way, is automatically called when the class is called from a command line. Again, the command line arguments are passed to this main method through the arcs, the array of strings here called arcs that you see here. That's the arcs array.

Of course this method, which is, in this case, a public static void, and that's, again, we always defined it this way. And the fact that we made it static, the keyword static is right in front, that, of course, has a meaning. And when we get into the static portion of the course, we'll talk about what it means by that. So of course, in this case, we on purpose made this main method static, again, which is, in this case, involved without a reference to a particular object. So static methods are invoked without instantiating objects, and when we get into that lesson that talks about static keyword, then at that time we'll, of course, expand on that.

Now looking at the code blocks. Again, every class declaration, like I mentioned to you folks, is enclosed in a code block, and that code block is a represented by a couple of curly braces, open curly brace and closed curly brace. We can see it here in the class SayHello which has this external curly brace which is closed by this curly brace that you see here.

And then of course, method declarations are enclosed in code blocks too. And here' a main method which, by the way, has its opening curly brace and then closed curly brace, and this is called the body of the method. And of course, Java fields and methods have block or class scope, so in a sense this method has a class scope. And of course code blocks are defined in braces too. You can go ahead and define any set of statements or Java statements within a set of braces, like we show you here. Again, this would be only review for you.

In terms of the primitive data types, it turns out, folks, that, like I mentioned to you, Java has eight primitives. The integers one are byte, short, int, and long. OK? And the floating point types are float and double. And the character has a char type. And the Boolean, which by the way could be true or false, that's the values, in this case, its is represented by the Boolean type.

In terms of representing data for the integers or the integer types, so it could be either irregular decimal numbers or it could be, for example here, in hex number, that's for a binary for bytes. And in general, by the way, integers are by default initialized to zero. The floating points, which are double or float, and you can represent, for example, float number by 3.0, we added F here, folks, because if you write only 3.0 it is treated as a double. OK? Any number or any floating point number, if you do not, in this case, use the F to the right side of that value, then it's like it is a double. So the default of an integer is always int and the default of a floating point in Java is always double.

And of course for characters, you can specify a value of the character, like here lowercase a, or maybe the code of that particular character, or maybe a backslash n. Backslash n, by the way represents what? Anybody? A new line, OK, float those over. And by the way, the default value of the char is, again, this default value here. And for the Boolean, also, the default could hold a true for a value or a false, but the default value is always, like I told you, folks, an uppercase or a lowercase, lowercase l, capital L or capital F. You can append those to the number to specify either a long integer or a float number.

Again, here we show you just examples. And by the way by, a byte always fits within eight bits, a short fits within 16 bits, and an int fits within 32 bits, and the long integer fits within 64 bits. And for the floating point, we have the float, which uses 32 bits and the double which uses 64 bits. And we actually highlight this for you just to see it.

The same thing with the character. Typically we have a tendency to look at the characters and we say that the characters fit within 16 bits. And that's because of the fact that we wanted some of the international standards to actually also, in a sense, represent those language where the characters fit within more than 8 bits, within 16 bits, and those are like Japanese or Chinese and so forth.

The Boolean type, again, can hold true or false for these value. And we said that, by default, it holds a false value. And we represent this. And of course, we said that a character holds the default value backslash u zero, zero, zero, zero. Continuing with that and looking out the Java SE numerical literals. It turns out, folks, that the SE 7, and SE 7 later versions, they actually have a new mechanism by which we use any number of underscore characters that can appear between digits in numerical field. And this is used to improve the readability of your code, quite useful.

For example, if you want to read a credit card number-- this is, by the way, a new feature in SE 7. Those who are used to the SE 5 and the SE 6, most probably you have not seen this. So as you see, this is quite nice, and it improves the readability. So instead of writing 1234567890123456 and L next to it, what we do here, we separate them with four digits at a time, and we separate them with this underscore. And by the way, this is perfectly normal. SE 7 will not scream at you if you write a long integer like this. And you can also, by the way, specify this either for hexa decimal values, or hexa decimal words, or maybe like hex numbers, like in this case, or even in bytes.

We also now can represent a binary number using the 0b. 0b is for binary number. If you remember before in the Java SE 5 and Java SE6 we had only 0x for hex and then for octo, what is that? 0o remember that for octo. But now we can use a 0b, and you can actually specify those numbers in binary. That's also fairly new. So there are a couple of things that we just added to the SE 7. You can use the underscores to separate a big long number so that, for readability, you can read them one group of numbers at of time or digits at a time. And also now, we can also represent a number in binary, and here's an example that you there. Everybody's following that?

The only thing that we want you to remember, folks, is that you can place underscores-- and there are some rules for the literals-- only between digits. You cannot place underscores in the following places, which are what? At the beginning or the end of a number, you cannot do that. Adjacent to a decimal point in a floating point literal, for example, the dot, if you want to put an underscore, that's not going to be accepted by the compiler. Prior to an F or an L suffix. Again, you cannot do that. And of course, in positions where a string of digits is expected, of course. OK? So you cannot do that. So remember that all the time.

But remember also Java is case-sensitive. For example, representing a variable credit card number here with some of the letters here lowercase is, of course, different from this one which has all of them in capital case. We all know about that, about the case sensitivity of Java.

Continuing with that and looking at the binary literals. this is something that I just discussed with you, and I'm repeating if here. Java SE 7 and later versions now have binary literals that can also be expressed using the binary system by adding the prefix 0b, like I mentioned to you, or 0B, either lowercase b or capital B. So for example, now I can have, in this case, this binary number, and just because it has 0b in front of it, so that is, again, in this case, 00100001. And I can actually cast it into an object of type byte and then, of course, use it to initialize with it this variable called aByte.

I also have here a 16-bit short value, which is represented in binary. I can go ahead and cast it into the type short and use it to initialize with it this variable of type short called aShort. And of course, I can use it for some 32-bit integers. Well, in this case, I have a binary number, which is, again, represented, in this case, in binary.

And we also make use of the underscore so we can read it four at a time, four binary digits at a time. And then we can assign it directly to the A anInt1 here, which is a variable of type Int. And that works very nicely. The same thing with, again, this example, and the same thing with this example, where capital B here. And the B can be uppercase or lowercase, so that also works nicely.

These are fairly new, by the way. This is in 7. So as you see here, working with binary numbers and being able to manipulate binary numbers inside using Java quite interesting, in case you need it. Yes.

When you first throw, you don't need to cast it to byte, right?

Still. Yeah, Yeah. You're right. The question is, you don't need to cast it to the byte, and the answer is, of course. In this case, it would go ahead and be accepted. Good.

All right. Continuing with our lecture, now we look at operators. Now again, we can have a simple assignment operator, and that's using the equal sign. For example, we assign the right side to the left side. OK? We also have your arithmetic operators, same as in the C language C++ which is a plus for addition, minus again, the dash, for subtraction, and multiply or division or the remainder.

We all know the remainder, right? The modulus. What is five modular three? That's two. Good that's the remainder.

And you also have the unary operators, which is, again, here you have the unary plus operator indicates a positive or the unary minus negates the expression or the plus plus, that's increment by one and the minus minus, that's decrement by one. And of course the exclamation mark, that's the logical complement operator that inverts the values of a Boolean. So we can use the exclamation character and then use a binary number. And what's it going to do? It's going to, of course, change it.

You folks remember the two's complement where you flip the whole binary number and add the one, remember? So you can actually do that also. Good. And of course you can read about all these operators in the tutorial if you are interested. But of course, I know that you folks have already a background about that.

Continuing with this, now let's look at some examples of a string. So just to discuss with you, here's an example of a class called strings. It has a main method. And inside here, I declare a character variable called letter and initialize it with the character lowercase a. As you see, when we use characters, we represent characters, we always use the single code to represent that. On the other hand, here we have a string that we declared here called string1. It's a reference variable to a string. And then we initialize it with the string Hello. In this case, as you see, we use double quotes. And this is just to represent in a string that we're using in this case.

And the same thing here. We declare a string2, which is a reference variable, and initialize it with the World. And of course, we declare a string3, we initialize with an empty string. And by the way, we can also use this one here, New, and then call the constructor string and pass to it, in this case, a string which is Bad Practice.

The only reason why you put it as Bad Practice is because whenever you work with strings, we advise you to do it this way, where you declare a string, and initialize it with the string double quotes. You do not want to use the new constructor and new operator here and use the constructor of the string because that is a little bit of a bad idea when it comes to the performance of your system. Why? Anybody knows about that? Anybody has an idea about why is it that we advise you not to do that? Again, here we say string literals are automatically created as string object.

[INAUDIBLE]

Yeah, exactly. So when you use this type of statement here, it actually ends up creating for you more than one object. To be able to create this string called Bad Practice, it creates more than one string object inside the memory. And that is inside the heap memory space, and that is a bad idea. OK?

And here's how, again, you can't go to concatenate strings. For example, I can here have string1, which represents Hello, and concatenate it with string2, which is World, and then use it to initialize assign it to string2, which by the way, originally was an empty string. And then after that, we'll do a println where we print here. Here's a string that we passed. And then here we're printing the string concatenated by a space concatenated by the letter, which is the character A. So if you take a look at the output, it would be all of this.

One thing that we tell you, folks, here which is quite important, we say caution. Strings should always be initialized using the assignment operator equal and the text quotation marks, as shown in this example, like this one or this one here. The use of the new to initialize the string is strongly discouraged. And for example, in this case here, the example here the Bad Practice in line 10 is a string literal of type string. Again, using the new keyword simply creates another instance of functionality identical to the literal. Again, if this statement appeared inside the loop that was frequently invoked, again there could be a lot of needless string instances that are created in your heap space. So that is a bad idea.

In fact, last week I was looking at the Java performance tuning. And I was actually lecturing that Java performance turning. And one of the issues we discussed over there is not using this bad practice that people always use because to you it looks object-oriented and very attractive, but underneath the hood, it's actually consuming a little bit of space over there and performance. Everybody's following here, folks? Good, good, good, good, good.

[INAUDIBLE]

Yeah, if you want. And then you have to use that one and copy it into the don't do this. Yeah. Underneath. So again, coming back to what Manjeet was saying here is that you create two strings for the purpose of creating one string. So in this case, it is a bad idea. Why not use it like a string-to-string equal double quotes between double quotes put Bad Practice. Got that? Good, good, good, good.

Continuing with that, and now getting into the string operations. String operations, also, here's a class, a very nice, simple class called string operations. It has a main method. Here we declare a couple of strings, one is string2 and assign to it World, and the second was string3 assigned to it an empty string. And then down here, we assign to string the Hello string dot concat and then pass the string through. So these string literals are automatically created as a string object automatically if we use these. OK? So that's why we advise you to use this.

And here we use the methods like the concat method. The string, by the way, has a bunch of methods, the string class, and we can go ahead and make use of that. So for example, in the next example, just to give you an example so you'll see that in this example here, we print the length, and then we call the length method on string1, and that gives us the length of string1. And of course in here we have a substring, for example here, we're printing substring. And in this case, the substring is evoked by passing zero, which is the first location and five, the number of characters that you're trying to extract from the string3. and then print that.

And of course here, we have the two uppercase which converts the characters to uppercase. If you look at the output of this class here, of the println statements here, you will see that the first one, this one here prints string3, which is the concatinations of string Hello and string2. And that, of course, would be Hello World. And then here prints the length of the string1, which is in our case here starts at zero and ends up Hello. So that's a zero, one, two, three, four, five, so again the length here is five characters.

And here is a substring which starts at zero and then stops after five locations, so that starts with zero, which is H. And then E, then L, then L then O. And that's five. OK. That's five there. So you extract this Hello, and then it prints it out. That's why you see this.

Continuing with, again, some of the basic concepts of the Java, the beginning, we also can look at the if-else example. And in this example, we pretty much demonstrate the syntax on how to write, in this case, the if-else statement or the if-else construct in Java. So we have a class called if-else. And this class, as you see here, folks, it has a main method. Inside we declare two local variables.

Everybody knows what these are, local variables, right? We'll get into that later on. These are local variables to which method? The main method. By the way, for local variables in a method, what is it that we need to do to those variables to be able to use them in that particular method? They need to first be what? They would be initialized with values. Otherwise, of course, the compiler would scream at you.

So in this case, we declared A as a long integer when we assign one to it and B as a long integer. We assign two to it. And then here, we use a small if-else statement where, first of all, we say if A is equal to B, go ahead and print this. Else, if they are different, again, go ahead and print this one. Of course, the output of this one would be what? False because we know that one is different than two. Right? Because A is one and B is two.

Looking at some logical operators. Again, this slide pretty much shows you a summary of the logical and conditional operators in Java. Some of you must have seen this before, even in other the languages like C++ and C language. We have equal equal. OK. That represents equal to. The exclamation mark equal, that's not equal to. Then you have the greater than, you have the greater than or equal to, you have the less than, you have the less than or equal to.

And then the conditional operators, the ampersand ampersand represents the conditional and. The pipe pipe represents the conditional or. And the question mark and colon, that represents the ternary, which is a shorthand for if as. By the way, this ternary is well known also in C language and C++. Probably most of you folks have seen that.

And also, we have the type comparison, which is quite interesting. That's called the instanceof. This instanceof, ladies and gentlemen, which actually compares an object to a specified type. We're going to use this, it will be very, very handy in polymorphism. When we get into polymorphism, this will be used. Remember that, and I'll remind you when we get there.

Continuing with now looking at the arrays and the for-each loop. Ah, this is a very interesting example that actually talks about a very nice construct that was created and added in the Java SE 5. So in this example, we have an array of operations class, and it has a main method. Here we declare a reference variable string called names of type again. And then, of course, we initialize it with a new array of strings of size three. Right?

And then on lines six through eight, we'll go ahead and initialize the different locations of the array, in this case, where name zero would be a reference to the string Blue Shirt, name one will be a reference to the string Red Shirt, name two will be a reference to the Black Shirt string. And then of course, we also declare a new array called numbers of type integers.

And we initialize it with 100, 200, and 300. The fact that we initialize it with the 100, 200, and 300 that you see on the right side, we automatically created an array of size three with a difference of three integers. The first one, located at the first location, is 100, the second one is 200 and the third one is 300.

Here we are using a very, very interesting new advanced. It's called advanced-for loop. We also call it the for-each loop. And it has a for, and it has, again, the type here is string, and then it has a variable called name and the colon, and then right another variable representing the name of the variable. Here, this is a very, very nice example. How many of you have seen this or heard of this advanced-for loop? OK, good. So a couple, two, three. OK.

So in this case, as you see, what it means here is that the loops defines pretty much a variable here, in this case, called name. And that variable, again, in this case will be used to iterate through the array names. And of course, in this case, for every variable of the array names, in this case, which is pretty much a reference to the objects referenced by the different locations in the array names and will iterate through these and of course print them out, in this case, each one of them on a new line. OK?

So every array is iterated through using the Java for-each, again. The loop defines an element, in this case, which will represent every element in the array. And of course, the output in this case will be every name of the array names. And you'll go ahead and print it out. And that, of course, will print, in this case, Blue Shirt, as you see here, just as an example, Blue Shirt, Red Shirt, and, of course, Black Shirt. And of course, we see here the name. This name here and space. That's because we wrote it in every one.

And the same thing, by the way, here. We use the enhanced-for loop, or what we call the for-each loop. And we'll go ahead and iterate the array through the array here called numbers. And of course, in this case, for every number of the array, we'll go ahead and print it out. OK? So that's the advanced-for loop. And it's used a lot.

So just before getting into my question, I would love to ask you a question afterwards, but instead before asking that question, let me go ahead and go through the classic for loop. You folks knew about the classic for loop. And in this case, we have for loop class, and it has main method. And then within the for loop that we all know, we declared an int, an integer here, I, and we initialize it to zero. And we, of course, say, create a condition here for I strictly less than nine. Go ahead and do that in this case, print I, increment I, and then keep on doing that, of course, in this case, 10 times because it's zero through nine, in this case. Which is, by the way, in this case, nine times.

So you see this is the classic for loop, right, that you folks have seen either in the C or C++ language or even Java because many of you do have some kind of a background in Java. So the question that I have for you here, ladies and gentlemen, is looking at the enhanced for loop, or what we call the for-each loop, using this new enhanced for loop and this one here, what is the difference between the two? And what is the inconvenience of this one here? What is it that we cannot do with the enhanced for loop?

The index.

Yeah, the index. If, for example, you are interested by one of the locations of the array and maybe changing it or doing something to it, of course the enhanced for loop would not give you that index. So again, just keep this in mind when you're building your applications. You know that if you are processing the elements of the array the same way, then in that case the for-each or the enhanced for loop would be good.

But if you are getting into the different locations in memory and maybe doing something at some point in time, you're trying to get into a specific location and change it, then, in that case, it is a good idea to use the classic for loop. Everybody's following, folks? Good. Good, good, good, good, good good.

Let's go ahead and continue. And now look at an example of the while loop. The while loop is also interesting, and some of you must have seen this before. And so here's an example. It's a class called while loop. It has a main method. Here we declare a variable of type integer I, initialize it to zero. We declare an array called Numbers and initialize it to 100, 200 and 300. And then here, using the while loop and say while i is strictly less than the length of the array ray. You how we can access the length of the array through the dot length in this case.

Go ahead and do that. In this case, print the Numbers i, which is, again, the first location, which is going to be 100 increment i. And then check it with the length. And as you see here, this will iterate and print all of these numbers for us or the locations of the array for us in the array Numbers. And it's 100, 200, and 300 on different lines.

So this is called a while loop. I just also want to show you an example of the do-while, by the way. And some of you must have seen this before. Here is an example of the do-while where, in this case, we have a class called do-while demo. It has a main method. Inside we declare variable of type integer called count and initialize it to one. And then we use the do. So do and then print count, increment count, and then what? And then check the count.

By the way, remember one thing, folks. Pay attention to these folks. There is always a semicolon. Do-while always finishes with a semicolon. So remember that.

And the other thing that you want to see, if you want to compare the while loop to the do-while, folks, what is it that you see as a difference here? It turns out that the while loop gets processed zero or many times. The for loop gets processed zero or many times. On the other hand, the do-while gets processed what? One or many times. One or many. So if you have zero, too many for the for and the while loop, and then you have one too many for the do-while loop. Just to keep in mind. OK? We'll add that. All right.

## 2. Java Syntax and Class Review, Part 2 - 39m

Continuing with the lecture, now let's take a look at the switch statement. How many of you have switch statement before? Good.

So here's a very nice example that's called the switch string statement. It has a main method. And down here, we actually-- this is also quite interesting. So far folks, what did we do? So far, we showed you a couple of new things in Java SE 7 using the underscores in a long integer to separate, again, the numbers so we can read them one group at a time. So it's good for readability.

We also found out that we could represent a binary number using 0B, capital B or lowercase B. We also now, this slide introduces us to some new feature that actually was introduced in DSEE 7. So let's read the example and see what is this new feature.

So this example declares a string, a variable in this case, called color and initialized to the string "Blue." And then a reference variable shirt of type string initialized to the string " Shirt."

And then here, we use the switch. And then when we use the switches, we're using what here? We're using what? We're using a string. So this example shows a switch statement in the Java using a string.

This, by the way, prior to the SE 7, we couldn't do that. Prior to SE 7, we used only like either enums, byte, short, character, or integer. That's all what we could do. Now, we added one more nice feature. Now, we can use string.

This is really big, folks. I mean, think about it. Think about how many times you would love to actually write a switch statement using strings. And now, of course, you could not do that, and now it's available to you, and you can actually use it without you trying to write extra code to be able to convert those strings into integer, whatever you want to do.

So in that case, just so that you can work either with enums, or byte, or short, or characters, or integers. Now, it is obviously there and is supported by the SE 7. Everybody's following, folks? Good, good, good, good.

Continuing again with lecture, now looking at the Java naming convention. Well, usually what we tell you folks is that the class names are nouns. It's good to have them as nouns in the upper camel case. So in a sense that classes have tendency to always start with, in this case-- the first letter always should be uppercase. And then, after that, you go ahead and capitalize also the internal words.

And by the way, we ask you always to please use, in this case, again the fact that you have the first character capital case and then every word inside the name of the class is capitalized at the beginning. Actually, that approach is called what we call the upper camel case. And also, the nouns or the names of the classes should actually have a very, very good, nice semantic definition your application.

For example here, since I'm talking about a credit card application, it's a good idea to actually call the class CreditCard. It would make sense. It is a bad idea to call it Class X or Class Y because then, of course, it would not give us a good understanding on the semantics of the application itself.

And methods also should be verbs in a mixed case. Usually, the first character is a lowercase. But then after that, you could capitalize any word inside. And also, use names that do make sense with the semantics of your application.

Like for example here, we have a method getCharges-- makes sense. Or maybe disputeCharge. That make sense. So again, these are methods that do make sense when you are working with.

Variables, by the way, also are names. And they usually also use some names, in this case, to declare some variables. Again, they are names that are short. But they have to be meaningful and have some meaning when it comes to the semantics of your application.

For example here, we have expDate. That stands for expiration date. And by the way, some of the variables could be constants too. For example here, I have a VISA, capital V-I-S-A. And we initialize it to 5001. So again, these constants should be declared in an uppercase always to make the difference between regular variables versus constant variables. And they always, in this case, should be initialized with some value.

And by the way, to make sure to prevent these constants to actually be modified, there is later on a special keyword that we have to add in front of it. Anybody remembers that? Just before we see, we'll look at it anyway.

What is it that, again, prevents the constant variable to be modified later on? You just mentioned it, [? Das? ?] Final. OK. So we'll see that later on. Good, good, good, good, good.

Continuing with this and now looking at a simple Java class. And this class is called the Employee, so now, we're getting a little bit into some classes that are user defined and they have a meaning for our application. So in this case, we have this nice called Java class which, again, is often used to represent some concept. And that's how a class actually-- you write the classes. The whole idea is to represent some concept. And it could be a business concept, for example.

And in this case, we have the package which is com.example.domain, and in it, we have a class called Employee. That's the class declaration. And then down here, we actually declare a bunch of fields, fields or instance variables. And that's the employee ID, and name, and a Social Security number, and a salary.

And we have a constructor-- again, this is a default constructor-- of the class because it has no arguments passing to them and pretty much-- by the way, default constructors are always there. If you don't provide them in a code like this one here, the compiler would provide that for you.

And we have a method, in this case, called getEmpId. And this method, getEmpId, returns an ID, in this case, an integer which represents the ID, in this case, will return the employee ID.

Constructors, by the way, ladies and gentlemen, they are unique methods in Java. And because the return type is always an instance of the class-- and by the way, you always write declare constructors without, again, any type that you return. So there's no return type for the constructors. And constructors always hold the name of the class, all the time, all the time, all the time.

Continuing with the lecture and looking at the employee class methods. So, now that you have-- again, when a class has some bunch of data fields, a very, very common practice is to provide methods for storing data. And these methods are called setter methods, and retrieving data which, by the way, are called also getter methods. Sometimes, by the way, we call them accessors and mutators.

And here's an example where I have a class Employee in this case. And inside, we have an employee field here, which is an empId and a bunch of other fields. And here, we have a method called setEmpId, that, of course in this case, takes a parameter of type integer representing the employee ID. And I use it of course in this case to initialize with it, in this case, the employee ID.

And if you take a look here, folks, you will see that there is something quite interesting and it's actually written here. And we circled it with a red box in this case or red rectangle. And this is the this keyword. Anybody knows about the this keyword? You guys have an idea about this keyword.

This keyword allows the compiler to distinguish between the field name of the class, represented with this here, represents a reference to the current object, and of course the parameter name that is being passed to the method. For example, it turns out that here, the reference variable here is spelled the same way as the parameter that you're passing to the method. So to make the difference between the two, we use the this in front of the empId here which represents, by the way, the instance variable of the current object of type, in this case, employee. Everybody's following folks? Good, good, good, good, good. Yeah.

Is there any reason why the fields are declared public here?

Good question. So [? Das ?] asked this question, ladies and gentlemen. He said, is there any reason why the fields are declared public? And when we started, we assume that we put it on purpose so that later on when we get into encapsulation, we say, oh, by the way, you remember what we wrote earlier? That's a bad encapsulation. That's bad OO concept in terms of designing your class. So always, always make sure that your data is always private or your fields are always private.

OK? So we'll get to that when we get there. So this is done on purpose so that it will remind you later on that, by the way, what we have done before was a bad idea. See here, all of them are public. Especially that you already specified this set method and the get method to return the employee ID. That's exactly the way to do it. The only thing, this should be private. Good, good, good, good. Thank you, [? Das. ?]

Continuing with that and looking at creating an instance of an object. So how do we create an instance of an object? If you take a look here, folks, in this case, let's assuming this is within another class or a main method. So what we've done here, we'll go ahead and use and declare reference variable called emp of type Employee. And that's on the left side.

And on the right side, we'll go ahead and use the new operator and of course the class, in this case, name, which is the constructor. And in this case, what we are doing is we're creating a new instance of type Employee and use it do initialize with the reference variable here called Employee. OK?

And of course, in here, what we've done is, again in this case, we went ahead and initialized the employee ID. And if we tell you here, we say that this is legal if the field is public, but again, not a good object-oriented practice. Remember that? So that's the idea why actually we did that.

So this, on the other hand, if we use the setEmpId, and we pass this value so that the setEmpId will go ahead and initialize the employee ID, then that actually would make more sense. And also, we can go ahead and set the name and set the Social Security number, and set the salary, and so forth.

So what we're telling you here that in this code, in this Java code, again, we created a new instance of the employee class and assigned the reference to the new object to a variable called the employee. That's what we've done here. So the employee ID will be the reference to that object that way. And then after that, we went ahead and we can assign values to the employee object. In this case, we assign 101 for, in this case, the ID, and then John Smith for the name, and then 011-22-3467 for the Social Security number. And the salary, which is whatever, 120345 and so forth.

That's pretty much what we wanted to-- now, speaking of constructors. Well, we said that constructors are special type of methods. Sometimes also, we call them a setter method that create instances for you. Again, in the Java programming language, constructors are methods with the same name as their classes, and they're used to create instances of objects for you.

Constructors, by the way, are always invoked using the new keyword all the time. So for example here, I have a class called Employee and I have a constructor here, this is a default constructor, a no argument constructor which is typically called a default constructor. And then later on, we can go ahead and use the new operator with the name of the constructor here to instantiate a new object of type of employee and make it-- again in this case, use it to initialize this reference variable, which means this emp reference variable will point to the instance of the object.

Pointing is like address. It's like pointers. But because Java ignores pointers and we don't have to memory allocate, it's all done dramatically underneath the neighborhood by the garbage collector or the GC. That's why, in this case, we save a reference variable then rather than a pointer.

Of course, the value returned from the constructor is a reference to the object, or the Java object of the type created, in this case, is the object of type employee. And by the way, constructors can take parameters. We can actually overload constructors and we see that later on.

Looking at the package. It turns out also that packages are very, very useful, ladies and gentlemen. Why do we like packages? Because again, packages have tendency to group a bunch of classes together, especially if those classes are related-- related to an application we are building and so forth.

So the package is implemented as a folder and, like a folder, provides a namespace for to a class. So for example here, I have a package, com.example.domain. And in it, we have instances of managers. And here, in this case, we could represent these Java classes, the employee and manager. And they're underneath the package domain which is underneath the example which underneath, of course, com in this case.

So packages are very, very useful and they are a convenience. And what they do is they typically create a namespace. And they typically group a bunch of collection of classes that we can work with. And the package declaration is always on the top of the class, all the time, all the time. That's the first thing that you have to put.

The import statements also are very useful, folks. And the import statement is a keyword which is used to identify the classes you want to reference in your class. Again, these import statements provide a convenient way to identify classes that you want to reference in your code.

For example, you can import java.util.Date. You can import a single class or an entire package. Here's an entire package that has all the classes inside. You can also include multiple imports. So you can important this, then I could import this, and so forth. So it is a good practice to use the full package and class name, rather than the wildcard to avoid class name conflicts or class-- yeah.

So here's a very good example. Imagine I have here an object, I want to create an object of type java.sql.Date, and I have the over one which is java.util.Date. So in this case, it would be nice to actually specify the full path so that we won't confuse it with either the java.sql or the java.util. Everybody's following here, folks? So sometimes, you actually need to do that.

And by the way, modern IDEs like NetBeans that you folks are going to use here or Eclipse automatically search for and add your import statements on the fly. In fact, in NetBeans, if you do Control Shift I, it will go ahead and insert for you the needed import that needs to be added at the beginning of your class, right after the package.

All right. More on the imports. Again, imports statements, like we said, follow the package declaration and precede the class declaration right at the beginning and right after the package. An import statement is not required, but you can go ahead and use that. By default, by the way, your class always imports java.lang.* all the time. So we don't have to actually write that specifically, explicitly. Implicitly, it's important.

Again, you do not need to import classes that are in the same package. There's no point of importing that. But for example here, I put the package, and then here. I import the classes that are under the package called Manager which is under domain, which is under example, which is under com.

Let's look now at Java and the pass-by-value concepts in Java. Well, the Java language, unlike C++, uses the passing for all parameter passing. So to help understand and visualize this again with parameters, let's go ahead and use this example where, in this case, I declare x as a variable of type integer and initialize with 3. And then here, I declare y as an integer and initialize it with x. So the value of x now is copied and passed to 3, so which means a copy of it is passed to 3 as you see here. So if x is modified, for example, and set to 5, the value of y remains unchanged because that's the value that you passed, OK? So the Java language in general uses the pass-value value for all assignment operators.

Again, what it means is that the argument on the right side of your equal sign is evaluated, and then the value of that particular argument is assigned to the left side of the equal sign all the time, all the time. By the way, for Java primitives, this is pretty much straightforward. And of course, Java does not pass a reference to a primitive in general, but rather just a copy of the value.

All right. Now, continuing with the pass-value, but now, we also look for object references. So for Java, objects-- again, the value of an object reference is the memory pointer to the instance of the employee object in this case, for example. So of course, the value of the right side in this case of the assignment is a reference to the memory that stores the Java object. So again, in this case would be this one here which is a reference to the object of type employee.

And then look what we do. We go ahead and declare a reference variable of type Employee code y and initialize it with x. What does it mean? What it means here is I'm making the address or the reference of x would be exactly like in y because I assigned x to y. So we see that here I made x and y point to the same object, in this case, Employee object. That's what I did.

So we should note that an object is a class instance or an array. And of course, reference value are nothing but pointers to these objects. And of course, a special null reference means what? Means that the reference points or refers to no objects.

Object passed as parameters. So sometimes, we see that. For example here, whenever a new object is created, a new reference is created. For example, in this case, I have a new object that's created in each, and it's referenced by the reference variable called x here, object reference variable. And then I take that x and pass it to foo. So here's my foo method that takes an instance of type Employee.

So down here, for example, I created a new instance of Employee and use it to initialize this local variable that I passed here to the foo employee. And then after that, I'll go ahead and set the salary to 100K, for example here.

So in this case, what happened in this case is that-- in my case here, I have this x points to this object. But then e points to a newer object in this case, which by the way, has a different address, as you see here. The 42 and 99 are just used just to specify that they are two different addresses. That's what I mean by that. And of course in this case, when we look at this, we say that x, in our case here, is unchanged. But then of course, the salary of the e object here has changed to 100K.

Now, think about if we get rid of this. Let's assume that this statement here is deleted. If you delete that over there, then in that case, of course, the one that is going to be affected is the x, right? Why? Because I'm passing x to foo, and of course, it would be the salary of x that is going to be altered in this case. But just because I declare, in this case, this is a local reference locally to the method, then of course in that case, x will not change in this case. But then if I delete this, then x would be changed. Everybody's following? OK, good.

Of course, the question is how to compile and run Java? Well, to compile Java, most probably, you folks already know about that, you use the javac, Java compiler. You're going to specify the class path to the other classes, the -d for the output of the classes where you're going to put them, and of course, the path to where the .java class is out there.

You can use the CLASSPATH environment variable to the directory above the location of the package hierarchy. After compilation, what's going to happen is there would be a .class file that were created. Of course, to run your application, all what you do is run it using the interpreter, in this case, the Java interpreter.

So you'd use java, that class, and then the other classes, and then the package, and of course the class name in this case. The only thing is when you run it, you run it without the .class extension, OK? Just the name of the class.

Compiling and Running: Example. Assume that the class shown in the notes is in the directory D: backslash test, backslash com, backslash example. So if you want to compile it, then of course, you have here -d and then wherever you want to put your classes. And then of course here, we specify the class. Here, we're specifying through the full path where it's located, HelloWorld.java.

To run the application, you use the interpreter and the fully qualified name. So for example here, java, and then the -class, and then of course, in this case, the name of the class. And that of course will go ahead and return whatever needs to be returned.

And by the way, you can also run this class and pass an argument-- let's assume that it takes an argument-- pass an argument Tom. And then of course, this would be the default, Hello World! But he could pass an argument zero in this case, and that would be representing, in this case, whatever name you chose, in this case is Tom.

The advantage of IDEs like NetBeans is that the management of the class and the compilation and running the application are all handled through the tool. The IDE does all of that for you. That's the advantage that you have.

And of course, whatever the output that we have here is based on the class that we created here, which is called HelloWorld. That takes, in this case, the arg-- if the length of the args, which is the array, is less than 1, which is I didn't change anything-- I didn't enter anything, then in this case, go ahead and print this. Otherwise, if I enter a name, that interprets entered by arg 0 which is the first location of the array. And then of course, in this case, I'll write this and then the whatever name I entered in this case is Tom. And then after that, an exclamation mark.

Now, let's look at the class loader. Well, during the execution of your Java programs, the Java Virtual Machine logs the compiler Java class using a Java class of its own called the class loader. It's called java.lang.ClassLoader.

And to be able to understand that, let me just show you a very nice diagram here that kind of gives us where the class loader fits. So if you take a look here, you have a Java class here. And once you use the javac, it becomes the .class file. And then of course, this would be loaded by the Class Loader, again towards the Bytecode verifier which verifies that, and then it passes to the Interpreter and the Runtime, and of course runs on the Hardware. This is just a diagram to show you a little bit how actually all of this is done.

So when an object is instantiated, the class is loaded. That's typically how it's done. OK? And in general, the class loader is called the load-- again, is called to load the class into memory. So for example here, you have Test.class. ClassLoader. load the class. And then you can go ahead and log in. So you can actually write it this way too where in this case, what it does-- yes.

So if you don't write the new body, just define the parameter of emp will it still load the--

No. This is because it's a method here. Whenever you declare a local variable or local reference to a variable, you have to initialize that to be used. If you don't, if you just declare here reference variable in this of type without initializing it. Again, the question is related to the initialization of can I use, can I declare employee as an e and that's it? Would be that enough? Would it be enough to load the class? The answer is no. Your compiler actually would give you an error here.

Remember that whenever you work with local variables, they have to be initialized before you work with them. Got that. Good. So the compiler will stop you actually over there.

So typically, when you use the class loader, it is completely invisible. But you can actually use the -verbose. If you use the -verbose-- everybody heard of the -verbose? It gives you more information. It can actually show you what's happening. And in this case, it gives you all this information that shows you what was loaded and so forth. Got that? Everybody sees that? The whole stack.

So later on, you can actually try this if you want in your environment just to give you an idea about what is it that you get if you specify the -verbose. You can also do it on NetBeans by the way. And I show you that later on.

For example here, you're passing it as an option. And if you open your NetBeans, and if you right click in this case-- let me just take a look at-- if you right click here, this-- oh, up here. Right click and click on your properties of your project. And then under the Run here, you can actually see the options that you want to add. You can put the option here. OK?

All right. Garbage collection. When an object is instantiated using the new keyword, memory is automatically allocated for that object. Again, the scope of an object reference depends on where the object is instantiated. So in this case would be the scope of the method.

So when someMethod, for example, completes, the memory referenced by e, which is this one here, local, is no longer accessible. And I'll tell you why in this case. Like [? Magit ?] was mentioning earlier, that's because this is a local reference variable to the method. Once the method executes any exit the scope of the method, that is automatically garbage collected. It's always gone.

So the Java's garbage collector recognizes when an instance is no longer accessible and automatically frees this memory. That's kind of nice, actually, to see that. So of course, those of us are learning Java on the beginning, we all kind of like this. And then of course, when we work with Java, even the advanced topics like we're going to see in this course, of course, we're quite happy because we know that the garbage collector will handle that.

But we just want to let you know, folks, that at some point in time, once you learn all of this and then when you are working with an enterprise application or a big, huge application that you build using Java, you need to also look into the garbage collector and see how you can actually tune that and fine tune that garbage collector. We actually have a course that covers that. And I'll talk about that on Friday.

So in summary, we looked at the concept of classes. We looked at the concept of primitives, manipulating strings, the if-else, the switch statement. We looked at some of the iterative loops, like the FOR loop, the WHILE loop, the DO-WHILE loop. We also looked at working with arrays. We looked at Java fields, constructors, methods. And we looked at the concept of packages and imports. Everybody's following, folks? OK, good.

And now what we again finish with, just some of the concepts that we were again discussing here. And these are just a bunch of quizzes that we want to show you here. And you folks can go ahead and go through these quizzes and have an answer for all of these.

So the first one is in the following fragment, what three issues can you identify? And just by looking at this, what do you think? Is it a, b, c, d, e, or f? Anybody? Go ahead. We all do that together.

So what is it that we're-- so it's c? What is it? String s is created using new. OK, so that's an issue. What else? f you said? The integer value i is assigned to a double. Yeah, so you see double here? So that's definitely a problem. What else, you mention?

The Boolean value is assigned to a string. Is that true? Is this true or false? That is true because this is, of course, a string that obviously-- good, good, good, good.

How about the next one? Using the Employee class defined in this lesson, determine the value of e.n in the following fragment. So we have here a changeName, text, an employee, e and a String name. So here, I take the name and, of course in this case, assign it to e and return e.

In another class, we have a new instance of e, and we assign Fred to the e.name. And then of course we invoke the changeName and pass Bob to it in e. And then the System.out.println.

So what do you think, folks, in this case? First of all, is this right? It's not, right? Because we're passing a string and all that.

So what would be the value here? So look at that. We passed the-- so in another class here, is this allowed?

But it's public.

If it's public, yes? Right? If it's public, it's allows. But if it's not public, it's not allowed. So what do you think, folks? So let's assume it's public, then which one is the solution here? Fred. And if it's not public, then which one is-- Have the println e.get/Name assumed. I'm sorry?

Null.

Then it is null if it's all good. Here's another one. The following fragment, what is the result in this case? You've got a fragment here of course. You have average and an array of integers, values. Here you, again, declare result as a float, set it to zero. And then down here, for i = 1, i less than the length of values, go ahead and add that to the result. And then of course, return results divided by the length.

So what is the result here?

[INAUDIBLE]

Say it again.

What is the argument [INAUDIBLE]

Where is the argument?

Yeah, the System.out.println.

Yeah. And we have an average--

Oh, an average.

[INAUDIBLE]

OK, good.

Is it nums?

The average here, avg, OK?

a typo?

It should be-- it is a type. It should be actually num in this case, yeah. Good. OK, good. So that's because we're using a float and we have integers over there to handle. OK, good.

And by the way, we have a set of practice labs that we do for this lesson. And in this practice labs, we are going to create a Java class using the NetBeans IDE, create a Java class with a main method, write code in the body of the main method to create an instance of Employee object and print values from the class to the console, and compile, of course, test the application using NetBeans IDE.

So just before getting into this, just showing you the IDE and a tour on the IDE. How many of you have used NetBeans IDE before? OK. So it is very user friendly. Again, this NetBeans IDE belongs to Oracle. And it has as you see here three different tabs.

The first one is a Project. That's where you create your own project. So if you want to create a new project, you can go ahead and create new project. For your particular course here, you're always going to end up creating a Java application. And then after that next, you go ahead and name your package. And then of course after that, click Finish. OK?

And here, turn out that I have a package here. And once you have the package, you go ahead and create new, and then in general, you folks are going to create Java classes. So we specify the name of the class, which package you want to put it in and so forth, and then you click Finish.

And then what happens is the NetBeans will go ahead and create a-- it's a framework, create that class for you, creates most of the template for you, and then you fill it up with whatever it needs to be filled up in. A good example, for example, I have a ForLoop here. It's a class that pretty much-- this, we've seen in the class where, in this case, it's a ForLoop, it has a main method. And it has a ForLoop that, in this case, iterates through zero through eight and prints them out in the new line.

So if you right click in this-- by the way, you can print it from here, you could run it from here, run the file from here, or you can right click on this one here and just run it down there. And then the output, you would see it here. OK?

Another example just out of curiosity, let's look at the string operations. We've seen this example before. So again, in this case, using the different methods like length and substring and all that. So the same thing in here. So this is something that we've seen in the lecture.

So if you run this, of course, what's going to happen in this case, it's going to write exactly what we've seen in the lecture. Everybody sees that? These are examples, by the way, that you can see on your book too.

And here's an example of the switch string statement. So this is the one that we've seen earlier. So as you see here, there is switch string statement, has a main method. You declare a couple of strings here, color and shirt, and initialize them respectively with the string blue "Blue" and the string " Shirt".

And then here, within the switch statement, we have a color. And then of course we check it. If it's blue, we'll go ahead and print this-- sorry, assign blue. And the shirt, again, +shirt to it. And then if it's red, assign red and the shirt to it. And then at the end, of course, print the shirt type and ID.

So of course, if you right click this guy here and run it, it's going to go ahead and print. In this case, shitr type is blue shirt. Why? Because at the beginning, I initialized the string color with the string "Blue". Everybody sees that?

And that's why in this case it falls down here. And then of course, all what you do here is you go ahead and print, in this case, the shirt type, and then you print the shirt which is as it turns out here is called Blue Shirt. OK?

All right. So of course, you have a WhileLoop example also, which pretty much does this. In this case, we'll go ahead and print these out 100, 200, and 300 on different lines. So you can go ahead and run this guy here. And pretty much, that's what it gives you.

## 3. Practices for Lesson 2 - 7m

After looking at Lesson 2, which is related to the Java syntax and class review, in this particular lesson we looked at creating simple Java classes. We looked at the concept of manipulating strings using the if-else, the switch statement, iterating with loops, creating arrays, working with Java feeds, constructors, and methods, and making use of packages and import statements.

Let's look at practices for Lesson 2 in this case. And for this one we have, again in this case, we want to mention that there are two levels of practice for most of the practices of this course, practices that are marked "Detailed Level" provide more instructions, and as the name implies, and at a more detailed level. Practices that are marked "Summary Level" provide less detailed and likely will require additional review of the student guide material to complete it.

So the end state of the detailed and summary level practices is the same. So you can go also use the solution end state as a tool to guide your experience, too.

So for practice 2-1, which is a summary level, we create a Java Classes. In this case, let's go ahead and look at the detailed level where we create an employee class, create a class with a main method, to test the employee class, compile and run your application.

First, we start by creating a new project called Employee Practice. And then in NetBeans-- in this case, we'll go ahead and this is showing us the steps of how to create a new project. So obviously, in this case, just File, click New Project, and so forth. So it's showing you how it starts from File, New Project, and then the name, and then you follow the steps that they're asking you to use, in this case.

And then after that, once we finish with, in this case, creating the package, then we'll go ahead and create, first of all, the class employee that has an employee ID, an employee name, an employee social security number, and employee salary, as, of course, feeds. And then it has a constructor. And in addition, we set the setters and getters method for that class.

Let's go ahead and look at that in the NetBeans. And you see that here is the class employee. It has, again, these employee ID, name, social security, SSN, and salary as feeds. And they're respectively of type N string, string, and double. And by the way, they're set to Public.

We, in general, do not like the idea of, in this case, defining these attributes with the modifier Public. It should be private for encapsulation. We'll talk about that later on. And then it has a bunch of setters and getters method, set employee ID, get employee ID, get name, set name, get salary, set salary, get SSN, and set SSN, for social security number.

Continuing with this practice, then after that they're asking us to, in this case, create a class called Employee Test with the main method, and, of course in this case, caught this by creating a new instance of the employee and then calling the different methods, set employee ID, set name, set social security number, set salary, bypassing the following parameters that you see on the slide of the activity guide.

And then after that they want us to print use println statement to print the employee ID, name, social security, and salary by invoking, in this case, the get name, the get, rather, methods on the employee reference variable EMP, a reference label of that employee. And we should be able to, in this case, print. It should print all of this for us. Let's go ahead and look at that on NetBeans. And for that, we are going to look at the employee test, which is, by the way, created under the package com.example.

And for the employee.java I created, enter the com.example.domain. Here's the employee test. Well, in this case, we create a new instance of the employee, and invoke the different set of methods, and then print the information from the employee ID, to the name, to the social security, and to the salary of the instance of the employee.

So if we run this, by the way, if you want to compile as you see here is greyed out, because NetBeans has a tendency to compile automatically the file once it's saved. The same thing in here, OK? But we can always, by the way, right-click the package and click on Clean and Build. And that will go ahead and pretty much compiles the application for us, in this case, JAWS, the JAW files together for deployment.

And in our case here, we want to run the employee test. And as you see here, it gives us as an output exactly what we said, the employee ID's 101, the name is Jane Smith, and the social security number, and of course, the salary.

So that's for practice, again, 2.1. That pretty much what we have for the second practice of this lesson. So the practice of this lesson, which is the second practice for the course. Thank you.
