# 2: Java Syntax and Class Review

1. Java Syntax and Class Review, Part 1 - 26m
2. Java Syntax and Class Review, Part 2 - 37m
3. Practice 2-1: Creating Java Classes - 15m
4. Skill Check: Consolidating your Core Java SE Skills - Score 80% or higher to pass

## 1. Java Syntax and Class Review, Part 1 - 26m

OK. In Lesson 2, we want to make sure that what our assumptions are for you are correct, so we want to make sure that we go over the syntax that is necessary, the basic syntax of classes, primitives, reference types.

But before we go into that and I get to the slides, there is something that I want to share with you. Now, one of the most important things that you can do in Java is to understand how the memory works underneath. Every application is, well, dependent on the memory that is involved. Now, when it comes to Java, there are a number of places or types of memory, most of which we're not going to be talking about or even interested in in this class.

But in this class, we do have two that are very, very important for us. And so whenever I talk about memory, I'm going to represent it as a square. And you can think of this memory as that when the JVM opens up, when the main method starts, it's going to set aside enough memory in the JVM to be able to run the program.

Now, when it starts up, it is going to segment the memory into two. Now the first part we're going to call the stack, well, because that's what it's called. And the second part, the larger part, is actually known as the managed heap. So this is pretty straightforward.

Now, as we go through this particular chapter, we're going to talk about the syntax of how can I work with primitives and what are the primitives, et cetera. Well, the most important thing is that when you're talking about primitives, the primitives are held on the stack. And so for instance, if I wanted to create a field that held some value-- and let's say that that field is an integer type. So let's just say int i equals 5. Well, this is a primitive.

So what does this have to do with this? Well, very simply, when I declare it, basically what this declaration does is it says to the JVM, set aside enough memory on the stack to hold this value. Well, in this case an int is a 32-bit number, so it's going to set aside 32 bits on the stack. And then it's going to label that stack i. And so any time later on when I say i, it knows that I'm talking about this particular memory location.

Now, when I say equals 5, it makes the assignment and it says, all right. The value of that memory location i is 5. And so the most important part of this is any time I'm working with a primitive, the name of the field and its value are held exclusively on the stack.

Now in a minute we'll be talking about reference types. But let's kind of introduce one. Let's say that I have a class called, well, shirt. So if I were to say I want an instance of class shirt-- and let's call that, I don't know, let's call it sh-- well, just like with primitives, what this tells the JVM is it says, all right. Set aside enough memory space on the stack to hold a reference for shirt. Again, that's a 32-bit number.

But in this case, there's a slight change. Because this is a reference type, it is not exclusively held on the stack, because as soon as I use the "new" keyword, what happens is it says, OK, in the managed heap, I need to set aside some memory. So "new" just simply says set aside some memory on the managed heap.

Now what am I doing? Well, I'm going to call the shirt class's constructor. And let's assume in this case that it's a default constructor. The constructor is going to initialize the shirt in the heap. So if there are fields in the shirt or whatever that need to be initialized, they're going to be initialized at this point.

Now, what is the assignment then? Well, the assignment is that once I have that initialized object, it's going to assign it. And so this requires some memory on the managed heap.

And it is that memory location-- it is that memory location that is going to be placed on the stack. And so when we're talking about a reference type, a reference type the field or the label is going to be associated with the stack. But the value itself is actually a reference to memory on the heap.

And so that's kind of what's going on here, is that any time we're talking about a primitive, the value and its label are associated directly with the stack. When we talk about a reference type, it's called a reference type because the value on the stack is a reference to the memory location of that object on the heap. And so with that in mind-- and we'll come back and revisit this as we go through the class. But with that in mind, that's when I want to go ahead and let's go through the different slides.

All right. So first of all, according to this we want to create a simple Java class. We want to create primitive variables. And we talked about how primitive variables act in memory. We're going to talk about operators, one of which is the assignment operator, but there are of course others. And we're also going to be looking at strings.

Now, strings are kind of interesting. Going back to the board, when we talk about a string, a string is interesting simply because it is a reference type, but it's a reference type-- it's a unique reference type, because it's been set up in such a way that rather than treat it as a reference type, we treat it as a primitive.

And so for instance, if I want to say create a string, well, it is a reference type, so if I call my string s-- so just like before, it's going to set aside enough memory to hold that reference on the stack. But instead of using the "new" keyword, when we talk about a string, we can do a direct assignment. And so for instance, if I were to pass in the string "Hello world," what's going to happen is "Hello world" is going to be put on the heap. And it's only going to set aside enough space to hold those, what, 12 characters?

Now, when I do the assignment basically, just like before, the value that is in there is going to be the reference to that memory location. Now, strings are a little different. And they don't really talk about this in the chapter, so that's why I'm bringing it up now. But strings are a little different because when I do that assignment, let's say I wanted to change this a little bit. So let's say that later on I decide, all right. I'm going to write s and I want to append to s my own name. So I'm going to append "Steve" to "Hello world."

Now, strings are immutable. Now, immutable just simply means that once I have identified the memory location for this string, I cannot change it. Well, wait a minute, Steve. You just said that you're going to change it. Well, how's that work?

Well, the way this works is that basically it doesn't change this memory location. What it's going to do is it's going to copy what is already there. And then it's going to append the new stuff. And so that's my new string.

But what's the problem? Well, the problem is that the string is still pointing to the other one. And so once again, we're going to make the assignment. It will eliminate that reference and update it to the new location.

Now, can you see a problem potentially with those? Well, if you're doing a lot of this, notice that this particular object is now an orphan. And if I did that again and again and again and again, I would have a bunch of these orphans taking up space in the managed heap that have no purpose. I can't use them because I don't have a reference to them. But they're taking up the managed heap.

And so it is because of that that of course there is a process, a process of the Java Virtual Machine called the garbage collector or garbage collection. And so because this is no longer-- well, it's an orphan, it's no longer having a reference to it, the garbage collector can come along and reclaim that memory at some point.

But the problem is that string manipulation is bad. And so because of that, in a future chapter we're going to talk about a better way to go about manipulating strings. But I wanted to introduce that, because that's what we're going to be talking about.

Now, also in this particular chapter, we're going to be talking about branching statements, the if, the switch, we're going to talk about the loops, the while loop, the do while loop, and the for loop. And we're also going to be talking about other things that we're going to work with and other important syntax that are very basic.

So with that in mind, let's talk about the basic structure of a Java class, program blocks and comments, what variables are the branching statements, et cetera. So with that, when we talk about a basic Java class structure, it's going to involve these keywords here.

So the first thing in a file-- so let's assume that this slide represents a file that has a dot java extension. And the first thing that will appear in that file that is executable will be the package keyword. Now the package keyword or the package_name that is identified here is just an identification of the file structure.

So this dot java file is going to be somewhere in the hierarchy of the folder structure. Well, the package_name lets us know what is that structure. So this package basically identifies where is this file in relationship to other Java classes.

Now, the import statement is optional. You don't have to have even a single import. But the idea of the import is that it can identify where other classes are in relationship to this class. So if they don't exist inside of the classes that we're talking about, then we can point to and say, oh, this is where this class is.

Now, do I have to have an import? Well, I said it's optional. If I wanted to, I could just have the fully qualified name for that class every time I want to use it in the class. But in that case, I would have to identify not only the entire package but also the name of the class itself. By doing an import in the class, all I have to use is the simple class name.

Now, once I identify where other packages may be that I want to use inside of my class, then the class structure is pretty straightforward. It will begin with a modifier. Now, this modifier normally is public. But it can be other things that we'll talk about a little later in this particular chapter. But public just means universally available. If a developer has access to this particular Java file, they have access to be able to do anything they want with this particular class, at least as far as it's been created.

Now, the modifier is followed by the class keyword. Now again, the class keyword, like all keywords in Java, are lowercase. And then following the class will be the actual class name. Now, a class name, the best practice is that the class name should be uppercase. So notice that Class is capitalized, as is Name, so that basically that would be upper camel case so you just run all the words together.

Following that, you will have a beginning brace and at some point an end brace. The beginning and end brace are known as a block. So any time I have paired braces, we're going to be talking about blocks. And in this case, everything defined inside of that block belongs to that particular class.

Now, inside of a class, there are three things that you can work with inside of a class. The first, of course, is that you can identify any variables. Now generally, we call them fields. And so in the case of a variable, we'll talk about defining those in a second. But I gave you a couple of examples already.

In addition, inside of the class we can also define the constructors. Now the constructor or constructors are special methods that have the same name as the class name. And as I identified when we were talking about shirt, when I call the constructor I am initializing my class.

And then finally we can also define other methods inside of the class. And that would be the functionality of the class. So this is a simple Java class structure.

And for example, here would be a very simple class. So notice that I have defined the class as Simple. I've identified the modifier as public, universally available. And it has a single method inside of it.

Now this method is very important, because this is the main method of the class. Now you already know, of course, that this is the entry point for my application. If I have a main method that has the three modifiers, public and static-- well, public, universally available; static meaning that I can access it without having an instance. We'll get into that more as well.

The main method always returns a void, meaning that once the program is over, there is nothing left in memory. ' And the main method will always take a single argument, which is a string array, often called args. So anything that occurs in the following block of the main method would constitute my application. So this would be a simple method and would be very easy for me to work with.

Now if I were to bring up NetBeans-- while that comes back I'll come back to my PDF. When I come in the NetBeans, let's say that I wanted to create a new project. So I'm going to go ahead, create a new project. I'm going to identify it as a Java project. And in this case, I'm going to go ahead and just say that it's a Java application. Yeah. That'll do.

And in this case, I'm just going to call my project Example, simply because we're not going to use it later. And in this case I'm going to not create a main class. So if I click on Finish, over to the left you will see that it will create Example. It will create those two folders that we talked about earlier.

And it will identify something called a default package. Now at this point, we really have no packages. So if I wanted to create a package, I could right-click, go to New. And notice that I could choose a Java package.

So let's say I want to create a package called, I don't know, example sounds good. So we'll go ahead and create a package. And notice that it shows up there.

Now, there's still nothing inside of package, so let's go ahead, right-click, and let's create a class. And in the previous example, we called the class simple, so let's just go with that. I can click on Finish. And notice that it will come up with some comments that we can change if you want to. And it actually shows you how to do that here.

Notice that it identifies the package where this file is, shows who I am. And in this case, it just has the class structure.

So let's say I wanted to create a main method like we did before. Well, if you go to Help and you click on the Keyboard Shortcuts Card here, it will show you two pages of shortcuts that you can use in NetBeans. And one of those is that if I say Public Static Void Main, so PSVM, and I hit the Tab key, notice that it will automatically create the main method for me. So that would be an easy way for us to remember Public Static Void Main without having to do a lot of typing.

All right. So if we go back, that would be the entry point for my application. But generally applications are going to work with a number of different classes. So in the case of Java, we would have our class. So let's say we have a credit card class. Now, remember I said that classes usually are upper camel case.

If we have a final modifier, final indicates that it cannot change, meaning that this would be a constant. So constants are usually declared all uppercase. And finally, variables are usually camel cased so the first letter is lowercase and then any other words run together with capitalization. So in this case, camel case. Notice that the methods are also camel cased, as are any arguments or parameters to those methods. So in this case a number of different things that you can do as far as naming.

Now how would I go about running this? Well, this slide shows how I would go about running it from the command line. So the first thing I would need to do is I would need to call the Java C utility, the compiler.

If there are other classes that I need to identify, I would identify each of those using the cp flag. And if I want to output to a completely different location, that would be the dash d flag. And then I would identify where my Java class is.

Once I've done that, it's going to create a file. For example in the case of the previous one, simple, it's going to create a file called simple.class, which then I can access using the Java utility.

Now since we're going to be using NetBeans, there is nothing actually here. So if I were going to create this class-- let's go to the files. You'll notice that at this point, I have my source. I now have my example. And I now have simple. But there's really nothing else here.

Now if I wanted to go ahead and build this, I could go ahead and right-click and compile the file. This is exactly the same as the Java C. So let's go ahead and do that. And it says that it's successfully compiled.

So if we go back to the files, notice that now not only is there an SRC folder where the Java files are, but there's also now a build folder. And if we look under classes, we would still see the example package, but now we have the simple class. And so this would be very similar to what we had before.

Well, in this case, it's not doing anything. So let's do a very simple one. Now another shortcut is the S out. And if I hit the Tab key, this is what gives me my access to the out class.

And I'm going to go ahead and just do the simplest program in the world. We're going to go with a Hello world. So if I go back to my project, well, what if I don't want to compile it separately and then run it? What if I just want to run it? Well, in that case, I can right-click and choose Run File, in which case then I will be able to not only compile it, but it will also run.

So let's go ahead and do that. Well, notice that it outputs my "Hello world" that I tell it to. And then it's finished. So that's an example of compiling and running from within NetBeans.

Now it's also showing a number of different things. In this case, they called the Java file HelloWorld and it did very similar to what I did. But again, the advantage of the NetBeans ID or any others is that it goes ahead and manages the class path. It manages the compilation. And it also handles the running of the application.

So let's go ahead and take a short break. And then we'll get right into the next step.

## 2. Java Syntax and Class Review, Part 2 - 37m

All right, so let's talk a little bit about blocks and how that works. Now remember earlier I basically said that any time you have a beginning brace and an ending brace, it's considered a block. So every class declaration is going to be enclosed in a block. Method declarations are enclosed in blocks. But there are also other pieces of syntax that will be or have block scope as well.

And so, for example, on this particular slide of course my class is SayHello, and you can see the class block. And then inside of that class block would be my method block. Now, whenever we talk about primitives-- we talked earlier on the board about primitives and how not only is the label associated with the stack, but the value is held on the stack as well.

Well there are eight different primitive types. The eight are located on this particular slide. So half of them deal with whole numbers, integers. And the only difference between these four is the amount of memory space that is allocated on the stack. For example, if I identify an integer type of bite, it's going to set aside eight bytes or eight bits on the stack.

On the other hand, a short would be 16 bits. An int is 32 bits. And a long is 64 bits. Now the compiler, if you just have a whole number but you make no other indication whatsoever of its type, it's going to assume that it's an int. So 32-bit is the default. So for instance, if I were to make an assignment like what we did on the board, if I make an assignment of 1, 2, 3, 42, 6,248, doesn't matter. As long as it's a whole number, it's going to assume it's an int.

On the other hand, if I attach an L, whether it would be uppercase or lowercase, it's going to assume that it's a long. OK, so, in order to identify a long, you do need to identify what type it is. Now we're also going to see that it is possible for us to represent ints in hexadecimal or in binary as well. And we'll see examples of this a little later.

Now two other types of primitives that can be held on the stack are floating point primitives. The float is a 32-bit number, and the double is a 64-bit number. But in this case we're talking about holding decimal points. Now, the double is the default. So if I represent a floating point number and do not represent it in any other way, it's going to assume that, for example, this and this are a double.

On the other hand, if I end the number with an F, either capital or lowercase F, it's going to then assign it as a float. Now, the other two types are pretty straightforward. There is a char-- C-H-A-R-- type, and the char is a 16-bit memory space that holds a single Unicode character. Now you can make assignments to chars by either in single quotes identifying the specific letter or number or symbol that you want. Or you can identify it based on the Unicode character designation. For example, this represents a new line feed.

And then finally, well, this one actually represents a lowercase a. And then finally, there is the boolean primitive type. Now the boolean primitive type also is held on the stack, but it can only have two possible values-- either true or false. So unlike other technologies where the boolean could be also null, that doesn't exist in Java. It is either true or false. And if you don't set the value, it's going to assume that it's false.

So primitive data types, very simple, but those are held completely and exclusively on the stack. Now we talked a little bit about these, and there are some additions that have come along. For example, in version 7, the underscore character was introduced so that it can help developers to more easily read numbers. So, for instance, if I were going to give a credit card number, and all I had was 16 numbers, that's a heck of a lot harder to read than it is that if I break it up into segments of four and indicate hey, this is a long number.

Or, the same thing with the social security number. Notice that I can use the underscore to break it up so that it's a little bit easier to work with. Or if I'm working with hex bytes, hex words, if I want to output in hexadecimal, or, for that matter, if I want to output in bytes, the underscore just allows the developer to easily read it.

Now during compilation time, the underscore is ignored. So from a compiler standpoint and from an execution standpoint, it has no meaning whatsoever. Now, the only limitations to the underscore is it cannot appear at the beginning of a number. It cannot appear at the end of a number. And if any of these were decimal-based or floating point numbers, you couldn't have the underscore around the decimal point.

Now, operators, most of these have been in Java since version 1. We've already seen that the assignment operator is a single equal sign. If I want to mathematically manipulate any of my variables or fields, I can have a plus sign, minus sign, multiplication, division. The only limitation on the division is that if you divide two integer numbers, the result will also be an integer. So, in other words, 5 divided by 3 would result in 1. So you have to kind of watch that.

But because of that, if you're doing integer division, the percent sign can be used to also determine what the remainder of that would be. So in this case, if I had 5% 3, the result would be 2. That would be the remainder of the division. Now, in addition it is possible to indicate whether a number is positive or negative. That is possible. And it is possible to increment or decrement by one by using the plus plus increment operator or the minus minus decrement operator.

Now, in situations where you want to flip a boolean to, well, basically to a not, that would be the exclamation point. Now, in addition to the regular operators, there are also some logical operators. Most of them you are I'm sure aware of. But anytime you want to check to determine whether something is equal to or equivalent to something else, you can use the equal equal, not equal, greater than, greater than greater than, or less than less than. OK, those are regular logical operators that don't really change much.

Now, in situations where you are testing multiple conditions rather than just one, you can also use the conditional operators. The ampersand ampersand indicates an and, whereas the two pipes-- in other words, the Shift-backslash-- would indicate an or condition. So, for instance, if I were to have a test condition and I needed for them to both be true, then I would use the ampersand ampersand between them.

Now a shorthand version of an if-then-else statement is the ternary operator. It's the only operator that takes three predicates instead of two in that prior to the question mark would be your test condition. If the test condition evaluates to true, then the condition, or usually it's a message that you put between the question mark and the colon, would execute. And finally, if the test condition is negative, the statement or the message following the colon would execute.

Later on, when we are talking more about reference types, we will introduce the instanceof, but this allows us to make sure whether or not an instance of an object is of a specific type. So we'll talk about that as we go as well.

Now introducing the various branching statements. The simplest branching statement is the if. So in this case, for example, if we declare two longs, a and b, notice that with the if I'm going to start with the if keyword followed by parentheses. Now in the parentheses I can have any test condition. It can be as complicated as possible, or it can be as simple as is a equal to b.

So, in this case, I'm going to test is a equal to b. Well we know here that it is not. And so if this were true, it would print out the statement or statements in the block immediately following the condition. Now, the else is an optional keyword, so I could just have a positive block. But, in this case, if I wanted something happen, if this is negative, I would include the else, and then I would have the else block that would also be there. So in this case, this is going to print out False.

Now if you want to have something, and let me show you this in a second. All right, so for instance, a simple if, I can say if some condition. So let's say the condition is true, then I could identify that, well, if true, then we're going to print out Hello World. Well, as we saw before, we can go ahead and run this file, and of course it's going to work because the condition is true.

Now, it is possible not only to do an else and an else block, but you could just as easily include an additional if. And in this case we could do something and have some condition in which we could identify--

So the idea is that I can have any number of these else ifs that I want, but I can only have a single else. So, in this case, of course, I would never get to here because this will always be true and it will always print out Hello World. But there's nothing that says that I can't have additional conditions as I go. And I can also have a default if I want to as well. So this would be a number of ways that you can work with this.

Now, a switch statement can be used in situations. Unlike the previous one, where I would have multiple conditions that I would be testing the switch statement can be used in situations where perhaps you have multiple possibilities but you only want to evaluate a single value. And so in the case of the switch I'm going to pass a value that I want to be able to evaluate.

Now, color in this case could be an in, a byte. It can be a short. It could be a boolean. But it also could be a-- as I showed you before-- but it could also be an enumeration that we'll talk about later. And, as of version 8, it can also be a string. And so, in this case, notice that I can evaluate whatever color this is. And inside of the switch block, I can have any number of case statements.

Now the case statement is followed by the specific value that I'm interested in. In this case, since it's a string, I'm looking for blue or red or whatever. And then following the colon, so case, value, colon, I can have any number of statements that will follow this that will execute if that case is true.

Now another thing about the switch statement in Java is that if I do not have a break statement, not only will it execute the case that is true, but it will also fall through to the next and following cases until it meets a break statement. And so there is the principle of fall through in a Java switch. Now the break statement just simply says let's drop out of, in this case, the switch with the block that I am currently in. And then in this case it would identify shirt type is whatever it is.

So, in this case, we have two cases, but we can also identify that if none of the cases are true, then we can go ahead and execute the default. Now, there are also in every programming language three loops. And the decision to choose a loop is usually a foregone conclusion. 95% of the time, you should be using a for loop. The reason is because 95% or more of the time you know how many loops you're going to have.

The only time you should use a while or a do loop are in situations where you're not quite sure how many loops you're going to be testing. So, for instance, in this case, if I say that x is 10, and while x is less than 20 I'm going to increment x. This is not really a proper use of the while. The point of the while loop is that you don't know how many loops that there are, but also it is possible that this could optionally be false already.

The idea of the loop is as long as this test condition is true, it's going to continue to execute the statements that are inside of the loop. So in this case, it's going to output value of x. And then whatever that value is, increment it, put a new line feed out, and then it'll start the loop one more time. As soon as x is 20, so after 10 iterations, it's going to stop the loop. So this is not a good example of the while loop. But it does show you the proper syntax.

On the other hand, there is the for loop. And the for loop is what you would normally use. Now the reason for the for loop is it has three predicates. The for loop will initialize a variable. Now this variable is initialized as soon as you go into the loop. So notice that we have the for keyword followed by the parentheses that identify the three predicates that are necessary. And the initiator identifies any variables that I want to initialize at the beginning of the loop.

You follow that with a semicolon, and then you have a predicate that is your test condition. The test condition will be checked at the top of each loop. And so, in this case, while i is less than 9, it's going to continue to output the appropriate values. Follow that by a semicolon, and then of course we have the incrementer.

Now once we get to the end of the for loop, that is when the incrementer gets called. And so this is at the beginning of the loop before the first loop, this is at the end of each loop, and then of course it tests at the beginning of each loop. It is for this reason that we would normally use a for loop, simply because it has a lot simpler syntax.

So, for example, let's say that I wanted to create two arrays. And this first one on line four here I'm going to create a string array called names. And the string array is going to have three elements. Now those elements of course are called 0, 1, and 2. So these are indexed elements. And I'm going to put an appropriate string in each one.

So this shows where I can declare my array using the square brackets. I can initialize my array. And then, in this case, I'm going to initialize the values inside of the elements. On the other hand, if I wanted to declare them instantiate and initialize on the same line, this syntax would be useful. So, in this case, I have another integer array, or int array, called numbers that will also have three elements. But in element 0, I will have 100. Element 1, I would have 200. Element 2, I would have 300.

Now, in the previous slide, we identified that we could have a for loop and that it would have three predicates. Now in this case we're identifying that we have a for loop with two predicates, and instead of semicolons we're actually using a colon. And this is called a for-each loop. And so normally what you would do in this case is that if you have a collection or an array that you want to loop through, you can identify that you want to loop through that particular array, and then you would identify what you want to call each element in that array.

So in the case of names, the first element, of course, is 0, which has Blue Shirt. Well, in this case, this would represent Blue Shirt in that particular instance. So it's going to go to name colon Blue Shirt. And then the next loop, name colon Red Shirt. Next loop, name colon Black Shirt. Same thing with the numbers. I identify the array that I want to loop through, and then a representation of each of the elements, in this case an integer. And then I can do the same loop. So anytime you want to work with a collection or an array, the for-each is a good way to go about doing that.

Now we've talked about strings. And the difference between a car that can only hold a single Unicode character and a string is that, well, a string can contain a list of or array of characters. So in this case, string1 would hold the five characters Hello, string2 the five characters World. And, at this point, string3 won't have anything.

Now I've identified, and the reason why this is a bad practice earlier when we talked on the board. And the reason is is because when I call new, remember, it sets aside memory on the heap. The problem is that because strings are immutable, I cannot use that original string. And so it involves an update of the reference before I can even do anything with it. So this is not a good way to go about doing a string. But as I showed you earlier, we can treat a string as a primitive, and that's perfectly acceptable.

Now, what do I want to do if I want to manipulate a string? Well, let's just look at an example. Some I'm going to get rid of this. Let's say that I want to create a string. Now a string is capitalized. It is a reference type. And so if I want to say Hello World, I can do so no problem at all. Now the cool thing about a string is that if I do a period here, notice that there are a number of methods associated with the string.

In this case, for example, I could pass in an index value and say, well, what's the character at, let's say, index 4. Or I can compare my string to another string. Or I can see if the string contains some character sequence. Or I can concatenate this string with another string, or whether the string ends with something, et cetera. You can see that there are a number of methods associated with string. There are almost five dozen here, including I can convert it to lowercase. I can convert it to uppercase. See if it starts with something. So a number of different things that we can work with on the string.

Now the cool thing is is that I don't even have to have a string to do that. If I have a string literal, notice that I get the same exact methods that I would working with the string itself. So there are certain reasons why I might want to use a string. Now, on the other hand, there's also a class called the StringBuilder. And in this case, I can identify-- let's try this again. No, that means I want you to go.

All right, so if I have a StringBuilder, notice that I could potentially identify how many characters I want to set aside on the heap to hold this string. And the cool thing is, once I have the StringBuilder, while I have different methods than I have for the string, so for example, I could append any number of items to my string. I could also delete a certain set of characters inside of it. I can of course insert, so I'm identifying where I want to insert and what I want to insert. I can reverse it. I can replace things in it. And, of course, I can convert it to a string.

The nice thing about the StringBuilder is that it gives me a lot of opportunities to manipulate strings without the cost on the heap that we were talking about with strings. So, for example, if I were working with this StringBuilder, notice that I can say OK, let's set aside those five spaces. But there's nothing that says that I can't append a value. There's no cost here because it's the same memory space.

Or, I can append, and then append, and then append, no problem at all. As well as I can say hey, let's go to the 12th character position, and let's append a how. So in the previous example I had hello world exclamation point space are you question mark. But then-- whoops, forgot the How. I could insert it in, no problem at all. In addition, I can identify how many characters are currently in the StringBuilder, how many are allocated. And I can also go into the StringBuilder and identify, in this case, I want the first five characters.

So a number of things that I can work with and do with the StringBuilder. It allows me to manipulate strings without the expense as far as updating and changing references. So, bringing this, we have a couple more concepts in this particular chapter. But let's talk about a simple Java class. Now we talked about the syntax for the class declaration. We've identified the syntax for our fields. We would have a modifier. We would identify the data type of the field. In the case of a primitive, we would use the primitive type. In the case of a reference type, we're going to use the name of the string.

And then we've also identified that we can name them CamelCased. We've also talked about the constructor and identified that the name of the constructor will always be the name of the class. And so, in this case, we will have a modifier, the name of the constructor, and in the parentheses we can pass any arguments that are required for that particular constructor. And then, finally, we also identified that with methods, we'd start with zero or more modifiers, identify the return type for the method, the name of the method, and then, again, in parentheses, any arguments we want to pass to the method.

In this case, since we're indicating that we are returning an integer, we do have to include the return keyword and identify what value that is that we want to return. Now, to fill out that, or flesh out that, when we talk about methods we identified that the method name can be followed by any number of arguments. In this case, for example, our argument name of empId will have a type of int. And in this case we're indicating that this particular method will return no value whatsoever.

In the case of the getEmpId, we're identifying we're returning a value, but taking no arguments. So this is off-- this is usually a best practice, where if I have a field called empId, it's not usually a good idea for me to set this as public. We'll talk about that in the next chapter. But we will generally have a getter or an accesser and a setter or a modifier to access that.

Now to create an instance of a class-- we talked about this earlier on the whiteboard-- I would use the new keyword to set aside space in the heap, and then I would call the constructor to initialize it. At that point, I would normally call the setters to either pass in values, or, as we will see later, I could potentially initialize from the constructor.

While in the previous example it is legal to go ahead and make this assignment, it is not a best practice. And we'll talk about it. So with that, we've talked about constructors. Generally we would create any number of constructors in a class. But if we do not provide a constructor, the compiler will provide one for us, and it will be this no-argument constructor, which is the reason why it's also called the default constructor.

However, if I create a constructor, I have to create all of them. It will no longer be provided for me. Earlier we talked about packages and I said that a package identifies basically a namespace. So in this case, I have two classes, Employee and Manager inside of the com.example.domain package. This is what I would see in Java. But, in the file system or in the folders, we will actually see a com folder, an example folder, a domain folder, and then my Java classes would be inside of that particular folder. So this is just the way for me to know where things are.

Earlier in the discussion, we talked about the import keyword. And identified that import allows me to use the simple class name for a class when I instantiate it, rather than the fully qualified name, which you see here. So, in this case, if I say java.util.Date, in my class I can use the class name Date and the compiler will know exactly where that is.

While it is possible, if I have multiple classes in a particular package, I can use the asterisk for that, but it is not a best practice. And the reason is is because if I identify specifically which classes are being used inside of my class, it's really good for documentation. So it's best to avoid the wild card for documentation purposes as well as to avoid class name conflicts.

And so, as an example, when we are in our package, the package would always be the first executable line in the file. And then I would have an import statement. Now, in this case, if you have a class in the same package, an import is not necessary. It is always available. If you have five classes in the same package, each of those five classes are aware of the other classes in the package.

So a couple of final things. When we talk about Java, and we say that basically arguments are passed by value, and that doesn't matter whether it's a primitive type or a reference type. Now the reason of this goes back to the discussion we had on the whiteboard. In the whiteboard we basically said that we have the stack, we have the reference type. And so if I have a primitive, as I do here, notice that if I assign the primitive to another primitive, it's going to take the value that's in the stack for x in this case, and it's going to put it in the stack as the value of y.

They are completely separate from each other. If I change in x or y after this particular statement, it's only going to change the one that I assign. However, what happens if I pass a reference type? Well, in this case, if I have I've instantiated x, and so I know that the value of x here in the stack is actually the value for the reference, well, when I make an assignment, so I say x, or y equals x, I'm basically saying take the value of x in the stack and copy it to y.

Well, if I take a reference value and I copy it, in essence, now I have two variables that are pointing to the same value. They have the same reference. And so in that case, even though I passed by value, because what I passed was a reference, now I have two objects that are in essence the same object.

And so the only way to get around that is to use the new keyword to separate them. So in this case, for example, if I create an instance of my ObjectPassTest, I create an instance of my Employee, I can call my setter on x. I can also pass x to the foo method of Employee. Well, notice that in foo it takes a reference type. And so if I were to set the salary here on e, because foo has a reference to the very same object as x does, of course it's going to increase the salary.

On the other hand, if I call new on e, this separates those two because now e has a new location in the hash, or in the heap, and so if I set the salary again, it's setting it on this e, but it no longer has a tie to x.

Earlier I talked about garbage collection and I said that garbage collection occurs that any time I orphan an object-- now that orphaning of an object could be because I set it equal to null, or it could be because it just simply goes out of scope. In this case, I'm creating an instance of Employee for the use of some method. As soon as some method stops executing, e is removed from scope. It still exists in the heap, but that will allow the garbage collector to be able to work with it.

And so that concludes our review of the syntax that you hopefully already know. But, if not, then we have an activity that allows you to work with it, kind of refamiliarize yourself with it, and we can go from there.

## 3. Practice 2-1: Creating Java Classes - 15m

All right. Now the first thing I want to do to introduce you to the labs, from this point on there are going to be two levels of labs. So if you notice on the activity guide, if we go to Practices Two and we open it up, we see that there is an overview, which we can see. But to the left in the bookmarks, you can see that there is a Practice 2.1 Summary Level and a Practice 2.1 Detailed Level.

The difference is the summary level just tells you what it is that we want you to do. But it doesn't go into a great depths of how to do that. On the other hand, the detailed level not only gives you what it is we want you to do, but it also identifies the steps to doing that.

Now what I would recommend is that you attempt to work it from the summary level. The reason for that is that in the human brain, there are a number of different possibilities for learning. The problem is is that if you use the detailed level, you're using the anterior integrative cortex, which means that you're not learning as much as you think you are.

Any human being can follow instructions and get something done. Now that's not a bad way to learn. But if you're going to use the detailed level, I would also recommend that once you get to the end of a group of steps, you go back to the beginning and remind yourself of what it was that you just did. On the other hand, the summary level is helpful to you because it uses the frontal cortex, integrative cortex, which allows you to learn this is what you're going to be using next Monday when you are after the class and you're expected to actually know this stuff.

So I'd recommend that you use the summary level as best you can. If you get to a step or you get to an instruction that you're not really sure how to do, then I would recommend go to the detailed steps. Follow the steps. But then remind yourself of what you just did and move forward.

Now with that introduction, let's go ahead and look at Practice Two. Now in this, we're supposed to create a new project. We're going to create a package. We're going to create a main class. We're going to add some other packages. And then we're going to run it. We're also going to pass some command line arguments to the main class.

So with that, I'm going to go ahead and get rid of the practice package we have here. And I'm going to go ahead and create a new project. Now in this new project, we want it to be called Employee. And let's see. Where do we want to put this? We're going to put it under Labs, and then under Review. And this will do here.

And let's see. It says we want to create a main class. So we'll do that. And in this case, we're going to call it-- no, actually it looks like we want to completely change this. So com.example.employeetest. And we'll go ahead and finish this up.

Now notice that because I identified that the name of the class was employee test but I had identified two packages associated with it, it automatically created those for me. Also, because I identified that I wanted that to be a main class, it also created the main method for me as well.

So at this point, we're pretty good. And we're going to set the source binary format to JDK eight. To do this, we can go to our project and right click and go to Properties. Now in this case, it identifies a number of different nodes that we can work with. But in this case, notice that my source binary format down here at the bottom of the dialog already says JDK eight. So that is exactly what we want it to do.

Now we are going to also create another package called com.example.domain. So in this case, I will go with that, call it domain. And in this case I'm going to go ahead and click Finish. So notice that it understands that com.example.domain is under the com.example example package. And we want to create a new class inside of here.

Now I'm going to right click New Java Class. And I'm going to call it Employee. And I'm going to go ahead and just finish. So in my employee.javaclass, I want to create a couple of fields. So I come in here. And apparently we're going to make these public of type ent and imp ID will be the name of the first field.

I'm going to also create a string field called Name, a string field called SSN, and a double called Salary. That also indicates that I want to create a constructor for the employee class. Now of course, I could type this. Or I could just click on Insert Code and say that I want to create a constructor, which exists here.

Now notice that if I wanted to pass various values to the constructor, I could choose those. But in this case, I'm just going to go ahead with the generate. Now in addition, I can also identify that I want to create getter and setter methods. Again, there's nothing that says that I couldn't type this. But I could just as easily insert code, getter and setter.

And we're going to identify that we want them all. So I'm going to go ahead and generate. And so notice that now I have a method that allows me to get the employee ID and to set it, to get the name and set the name, to get the social security number and set it, to get the salary and also set it.

So now that I have this, it's not quite what we want. And later on, we will be modifying this a little bit. But for now, this will work fine. So I'm going to go back to the Employee Test. Now notice that in the Employee Test, I want to be able to create an instance of Employee and test it. So in order to do that, I do need to identify well, where is that class? And of course, I can do that by identifying the class that I want to work with.

And then in the main method, I'm going to go ahead and create an instance of Employee. Now once I have an instance-- it always helps if you don't hit the wrong key-- once I have a instance of the employee, of course I can set values. So notice that just like before, we can identify we have four public fields. But in this case, I want to use these setters.

So I'm going to pass in 101 as my employee ID, set the name as Jane Smith, set the social security number as 012-34-5678, and set the salary as 120,345.27. All right, so that is our main method. Now of course, if we run this at this point, it doesn't do much for us.

And in the book, it does say that we are going to use the system.out.println. Now I rarely use the system.out.println simply because-- all right, come on-- yeah, I've got to have a method. So in my main method, there we go, I'm going to go ahead and print this out. I'm going to change this a little bit. We'll go ahead and we're going to format this.

And I want to output the employee ID. And then I want to have the name and the employee social security number. And we want the employee salary. Now of course, that's just the string. So in order to be able to actually do this correctly, I'm going to need to use the getters. So we're going to get the empl ID.

And it looks like I also need to word wrap this. So let's go ahead and set that up. So in the editor, ta, da, ta da, ta dum. [HUMMING] And now I need to remember where this is. Actually, I don't remember where it is at the moment. But we'll turn it on a little later.

So I'll go ahead and finish this, imp. We need the name. So getname emp. And we need the social security number, so we'll get the social security number. And finally, we will get the salary. So this will output the appropriate information that we want.

So if we go ahead and save this, we should be able to run this. And we see that, well, things are not lined up the way I would like. But I'll take one out. It's really close. So I'll get that. So we can try it again. OK, we're really close.

And so you can see that you can play with it until you've got it correct. But that's the idea behind this one. So in this case, we created a test class that has our main method in it. We have our class that we want to test, the employee, created four fields. We identified a constructor. And we also created our getters and setters. We then provided a way for us to see this information as output to our output window. So that concludes Practice Two.

## 4. Skill Check: Consolidating your Core Java SE Skills - Score 80% or higher to pass

Skill Check: Consolidating your Core Java SE Skills

View Skill Check
