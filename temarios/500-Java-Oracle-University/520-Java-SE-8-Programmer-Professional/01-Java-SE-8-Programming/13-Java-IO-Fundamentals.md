# 13: Java I/O Fundamentals

1. Java I/O Fundamentals - 35m
2. Practice 13-1: Writing a Simple Console I/O Application - 13m
3. Practice 13-2: Serializing and Deserializing a ShoppingCart - 21m
4. Skill Check: Java I/O Fundamentals - Score 80% or higher to pass

## 1. Java I/O Fundamentals - 35m

All right, in Lesson 13 we want to talk about input/output. So we're going to shift gears a little bit. We talked a little bit about the utility classes and lambdas. And now we want to talk about, all right, what happens if we want not to work inside of our memory, but what if we want to pull information either into memory, into our JVM, or we want to persist what's here out? And so that's the I/O portion, is the input/output fundamentals that we are going to cover.

Now, the good thing about input is that I can retrieve information from files, from the database, from other threads, from memory. And if we're talking about input, these would be considered the source, and then my program would be considered the sink. On the other hand, if I want to be able to persist items inside of here, I can persist those items by using output, in which case then my program is the source and the output items are the sink.

Now, in this particular chapter, we're going to talk about a number of different types of streams. Now when we are pulling data in, or when we're pushing data out, there are two different ways that we can work with data. First of all, we may work with streams. Now this is slightly different than what we were talking earlier in lambdas about the stream method and the stream class, but very similar. In the previous one, we were talking about pipelines, and we could just as easily consider these a pipeline as well. So same type of information.

Now the cool thing about the streams is that they work with bytes. So if I am either retrieving byte by byte from my source, or I am outputting byte by byte to my sink, I can then go ahead and use a stream, either an input stream or an output stream. On the other hand, if my input is characters, so I'm working with character by characters, in that case, I would be using something that would have reader somewhere in it.

By the same token, if I'm outputting characters, then that would use some form of writer. So that's where we're starting. Now we'll also see that it is possible for us to have persisted, for example, an object in one of these sources, and we could pull in that object known as deserialization. Or, if we were outputting the object, so we wanted to save an object in memory outside, we would be using a serialization in order to do that.

So in this chapter we're going to be talking about the different types of streams. We're going to be talking about serialization and deserialization. So let's go ahead and get started, and let's look at the slides and get into more depth.

So the first thing we want to look at, of course, is our objectives. I've just covered. So let's just move forward. And so the Java programming language provides a comprehensive set of libraries to perform both input and output functions. So Java defines and I/O channel as a stream. And I/O channel represents either an input source or an output destination. And an I/O stream can represent many different kinds of sources and destinations. And I've represented some on the board, but they're talking about disk files, devices, other programs, memory arrays, et cetera. And they also support different kinds of data.

So we've talked about simple bytes, but we can talk about localized characters. We can talk about primitive data types. And I also mentioned objects at the board. So when we're looking at a stream, like I said, it is a situation where, for example, in an input stream we're going to read data from a source, one item at a time, either one byte at a time or one character at a time. And if we are outputting data, we're going to write one character or one byte at a time.

Now, you could probably figure that working with data, either a byte by byte or character by character, can be a pain. Well, the nice thing is that as Java has progressed, there are other streams and other readers and writers that make this so much more painless. Now we've talked about where we can put these out. I didn't mention the console, but in the case of the output, We've? Used for example the out field of the system class to output to our output window. We've also seen where errors have been output to the output window.

And in the previous chapter, in the previous lab, we also used the ability to type in the keyboard and enter that data into our program. So that would be a form of input as well. So, like I said, there are two types of streams-- character and byte. Input and output of the character data is handled by readers and writers. Input and output of byte data is handled by InputStreams and OutputStreams. So we've kind of well looked at that.

And so any time you see a class that has the word "stream," you can be assured that that is handling byte data. Whereas the terms "reader" and "writer" associated with the class would be dealing with characters. So, in this case, let's introduce you to a number of methods there are pretty straightforward. So, for example, if I had an InputStream, we would have a number of different read methods. Now if I call the read that has no arguments, I am literally saying give me a byte. All right?

Now, on the other hand, it is possible for me to pass in a byte array, which then allows me to pass in a number of bytes, depending on how big the array is. Now, it is also possible not only to pass in this array, but to also identify that perhaps I want to skip the first so many elements, that would be the offset. And then I can also identify that I only want to read so many bytes. So, in some cases, for example, I might read a file, and the first so many characters might represent information that I don't want to use, or perhaps I don't want all of the information in the line, I can use the offset in length to identify exactly what I want to work with.

Now, of course, an InputStream is something that not only can I create, but I can close. It is auto closable, so I can use it in a try with resources situation. I can also identify exactly how many bytes are available for reading. Now, in some cases, skip is kind of interesting because perhaps I want to discard or I want to jump a certain number of bytes. So I can use the skip method to do that.

Now, if we're talking about an OutputStream, as you would suspect, instead of reading bytes, we're going to write them. And so I can either write out a single byte or a byte array, and just like with the read, I can also tell it to ignore certain elements or only include certain elements. I also can have a close method for my output stream. And, if I want to ensure that the bytes have been forced to be written to the stream, then I can call to flush method.

So, let's look at an example. All right, so if we were to look at this code, we can see that we're working with a FileOutputStream and a FileInputStream. In this case, notice that I am going to define a byte array that can hold 128 elements. And in my try with resources, I'm going to it create an InputStream that is going to read from a file that I will pass into my program.

I will then write to a file that has also been passed in as an argument to my profile. At this point, I could say bytes available, and it will tell me. And I'm going to start a counter and I'm going to define a variable to hold how many bytes I'm reading in that particular read.

So notice that in my InputStream I'm going to call the read method, and I'm going to populate the first 128 elements or bytes or less, and as long as I don't have a minus 1 coming back, which is the end of file character, it's going to populate my read. So that tells me how many bytes I read. And I'm going to use that to then write to my output file the byte array.

And then I'm going to add to my counter the number of bytes that were read. Now you can see that, in this case, I'm simply taking whatever the data is in my input file and transferring it to my output file. But at the end, I can identify exactly how many bytes I worked with. This is an example of a byte stream, both input and output. But you can see that that can be kind of interesting to work with.

And so there's other things that we can work with, but before we do that, let's talk about character streams. And so like I said, every reader that's there has a read method. But in this case, notice that instead of a byte array, I'm actually working with a character array. Same situation here, I have a close, I can determine whether or not my reader is ready to read. I can also skip a certain number of characters if I want.

But one of the cool things about a character reader is that because it acts as a stream-- if you remember in our stream class, we said that there was a peak method that allows us to look at something but not really go past it. Well, in the case of stream readers and writers, some of the readers are supported, or support marking. And so the idea is if my stream starts here and works on, I can basically mark a position in that stream and, as part of that, I can determine, well, does it support marking in the first place.

But I can say let's mark it, and then as I go along, I can say how many characters can I read. And anywhere in that read ahead limit, I could call the reset, which would take me back to the mark. Well, that's the idea here, where I can determine does this reader support that? And if so, I can call the mark to set that point and I could call the reset to go back to that point as long as I'm within a certain number of characters.

Now for a writer, very similar to what we talked about before. The only difference is not only can I use a character array to write, I can also use a String. And same example as we had before. In this case, we're going to create an instance of a file writer and a file reader using arguments from the command line to identify the different files. Start my counter, start my read, and notice that in this case I'm populating a character array instead. We're doing the same thing that we did in the previous one. In fact, the code is exactly the same with the exception of the type that we're working and the data that we're working with.

So earlier I was saying that working with bytes and working with characters can be a pain. And so if we look at this, we will generally find that if we are working with this, we will chain different readers or different writers together. And the reason is because the FileInputStream here is exactly the one we just talked about. It's working with one byte at a time, or at least an array of bytes at a time.

Well, if I want to work with a single row of data inside of a file, I can actually nest a FileInputStream inside of a BufferedInputStream. Now the BufferedInputStream allows me to work with a line at a time. And then finally, very similar to what we're going to see in the JDBC chapter, where we can identify specific, in that case specific columns in our rows, well a Data Input Stream nests a BufferedInputStream and allows me to identify, OK, I expect an int. So I can say next int or I expect a double. And I can call next double or whatever I'm expecting.

And so the Data Input, instead of working at a line at the time, it actually allows me to work with specific data types at a time. Now the Output Stream Chain works the other way around, where in this case if I wanted to write out certain character or certain data types in a particular order, I could use my Data Output Stream, which nests an internal BufferedOutputStream, which then identifies a line at a time, which then will nest a FileOutputStream that then converts that into byte by byte by byte, which then is what gets passed out.

So, many cases you will find this. Now in future chapters we'll also talk about ways that we can do this in parallel. We'll look at ways that we can not only work with specific data types, but we could, for example if it's a small file, we could actually pull everything from a file in all at once and work with that. So, a number of different possibilities, but this is the fundamentals.

So, an example of a chained stream, we don't have one that has a data buffer, but we do have a BufferedReader and a BufferedWriter. Now notice that when I instantiate the BufferedReader, I will pass a FileReader as an argument. So this is the one that will actually connect to my files, my input and output files, but then I will be able to read lines at a time. So notice that when I actually do the read, instead of doing a read I can say readLine, and it's going to pull in all of the characters that are on a single line up to the next line feed. And as long as that isn't null, then, of course, I can write it out or I can output a line feed character if I need to.

So chained streams are easier to work with, but there are other methods that, or other classes, that are even easier to work with. So with that, let's talk a little bit about, well, something that we've already been doing in the class up until now, and that is working with the console. Every time we have done System.out.PrintLine or PrintF or Print, we have been outputting to the System.out field, which is represented by a PrintStream object. And that PrintStream object writes to the standard output, which in the case of a development environment, is the output window of that development environment.

Now the System.err field does the same thing. It writes to standard error, which also means it's going to go to the output window, at least by default. Now by default the System.in field is an InputStream object that works with the keyboard. And so, by default, if I type on the keyboard, that would be the System.in. I could, of course, change that to be a file or anything else we've talked about.

So, a number of different things that we can do as part of our printing. And so on the slide 88 here it basically says that the print line and the print methods are part of the PrintStream class. They're not actually part of the in and the out fields that we've been working with, but those in and out fields represent a PrintStream type.

Now we've already seen that the print line outputs whatever we pass as an argument and then appends a line feed to it. On the other hand, the print just prints out whatever we pass it, but the cursor stays on the last character. Now, each of these are overloaded. I believe print line is overloaded with nine different methods, and the print is something like 11, if I remember. So a number of different possibilities that you can do.

And so, in this case, notice that I've got a program that reads from the console, similar to the activity we just performed. So notice that I have an InputStreamReader that is identifying that it wants to read from the keyboard. And then I have a new BufferedReader, which basically says that I can type anything that I want until I hit the Enter key, at which point it's going to pass those values into the BufferedReader. So notice I'm going to print out Type xyz to exit, and then here is where we're going to, on line 13, is where we're going to read the field.

And as long as I pass something into that value, it's going to output. So I'm going to output Read colon space, and then whatever I've entered without any spaces at the front and the end. That's what the trim does. If what I've typed is xyz, it's going to terminate the program. Or otherwise it's just going to keep reading and writing out what it is that I've done.

All right, so in version 4 of Java, a channel reads bytes in characters in blocks, rather than one byte or character at a time. I told you that there were other classes that allowed us to work with larger groups than what we've been talking about, and one of those is this idea of a channel. So notice that here I am working with a FileChannel object.

And so, for example, notice that here I can say, OK, I want a FileChannel in, which is creating a FileInputStream. I can then pass the argument for well what file do I want to read? And I can just call the getChannel method. Same thing if I want to output. But notice that in this case I can basically say, all right, we're going to create a byte buffer called buff, and we can identify, well, what size do we want?

Well, notice that the size that I'm saying is the actual file. So in this case, I'm actually going to input all of this file all at one time so I can read and write it in a single operation. So I'm going to read it, position this back into my buffer, and then I'm going to write it. So this does exactly the same as the other, and you can really tell the difference in the code, but with the exception instead of having to loop through either 128 bytes at a time or 128 characters at a time, or a line at a time, this just does a single read, a single write.

All right, now with that in mind, let's take a look at some other issues. When we talk about persistence, what we're talking about is saving data to some type of permanent storage, all right? So an object that is persistent capable can be stored on a disk, a storage device. It can be sent to another machine, to a database, whatever. So a nonpersistent object exists as long as the JVM is running, meaning, it exists in your application, but as soon as your application completes, it's gone.

So the idea, if I want to maintain or persistent objects from memory so that I can retrieve them at a later time is the process of serialization. And so in serialization, it's the standard mechanism for saving an object as a sequence of bytes. Now, that's important. It only outputs as bytes. It does not output as characters that can then be later rebuilt into a copy of the object, which would be the process of deserialization.

Now, in order to serialize an object, it has to implement an interface called Serializable. Now Serializable is a special type of interface. We talked about functional interfaces in an earlier chapter where a functional interface has a single method that needs to be implemented. Well, a Serializable interface is called a Marking interface, which means it has no methods whatsoever. It is identifying something that' a class can do. It's marking the class.

And so, for example, if I'm going to work with an object, let's say Object A here, and let's say Object A creates instances of Objects B and C, and Object C creates two instances of Object D. Well, when we serialize an object, first of all, only things in memory are serialized. Well, think about that. That means that anything in the stack that has a value could be serialized. But it also means that because the stack could reference an object, those objects and their stacks can be serialized as well.

Well, when we talk about that and all of the references, that's known as the object graph. And so the idea here is when I serialize, it's going to serialize everything that is in that class. Well, there are a couple of instances where that might not be a good idea. For example, let's say Class C here didn't have the Serializable interface. Well, the problem is, if I serialized A, it would try to serialize C. C couldn't serialize, and so nothing gets serialized. So that could be a problem.

In other situations, I might have information in the class that is context specific. It might only work right now. For example, let's say I had a stock portfolio. Well, there are certain things about a stock that don't change-- the name of the stock, the number of shares you have, et cetera. Those don't change. But, the price of the stock, well at least when the market's open, changes constantly. And so, if I were to serialize my Portfolio, and then bring it up even tomorrow, it's very likely that those prices would be different.

So it doesn't make sense for me to save those pieces of information. And so what we can do is we can use a keyword called transient to identify those fields or those objects that we do not want to serialize. So, in that case, if C was not see Serializable, we could mark the reference to Object C here, we could mark it as transient. It wouldn't even attempt to serialize it. Now if I did try to serialize it, then I would have a NotSerializableException that would be thrown, and again, it wouldn't persist my data.

So here's an example. Now there's a couple of other things that you need to know. Everything that is static will never be serialized. Why? Well, going back to our earlier discussion in the first couple of chapters, static belongs to the class, and there's only ever one possible value for it. So if I am deserializing this object, it will reinitialize that value, or pick up the value that already exists in the system.

So, in this case, base would not be serialized. Now notice that in this case my inputFile is also marked as transient, as is my totalValue. Well, if this is my Portfolio, like I said, the value of my stocks are going to change constantly, and so there's no reason for me to save that information. But what I do want to serialize are each of the individual instances of the Stock inside of my Portfolio.

So, static fields are not serialized or transient fields are not serialized. Now, another thing that you need to know before we get into serialization is there is a field. It's a hidden field most of the time called serialVersionUID that is associated with every object that is serialized. Now, the reason for that is when I serialize an object and then I deserialize it, what's going to happen is the system is going to check the serialVersionUID of the deserialized object with the serialVersionUID of the class that it is trying to reconstitute.

So what that means is if I've changed this class since this class was serialized, it is possible that they wouldn't be the same value. And so if you ever expect to update a particular class, it would make sense for you to include this with a specific number. That way you can determine that even though you've updated the class, it's still going to be able to deserialized. If you don't do that, if you tried to deserialize a class that is no longer relevant, then you would get this InvalidClassException that's in the slide.

All right, so let's go back to our example of the Portfolio. So notice that in our Portfolio we identified that our value isn't important, et cetera. But the only thing that we're going to be serializing are our set of Stocks. Now in the case of the Stock, the symbol of the Stock, the number of shares that I have, the original purchase price of the Stock, those are pieces of information that I need to retain. But the current price is not. That's going to be different when I deserialize it, anyway. And so we'll mark that as transient.

We'll also mark both Stock and Portfolio with the Serializable interface so that we can serialize them. So, here's basically how this would work. So if I were to create three instances of Stock-- Oracle, Apple, and Google-- I'm going to create an instance in my Portfolio, passing in those three stocks. And, apparently I want to output, or I want to serialize to this file. So I'm going to pass that in as one of my arguments.

And I'm going to create an ObjectOutputStream. Now the ObjectOutputStream is exclusively used to serialize. So, in this case, we're going to identify the file that we are outputting to and the object that we want to output to. At that point, we just say we want to write the object. Which object? Well, we're writing our Portfolio, meaning it's going to serialize our Portfolio and the internal Stocks. That's all there is to serialization.

Now, on the other hand, if you are going to deserialize it, notice that I'm pointing to the same file. But in this case, I have an ObjectInputStream. Again, it's a deserialization object. So notice that with my ObjectInputStream, I'm going to call readObject. Well, the readObject is explanatory. It is coming in as an Object, not as a Portfolio. So in order to create or reconstitute it, I do have to cast it as a portfolio. So at this point, I now have my Portfolio back into my system.

Now, let's think about this. All right, so I have this, but remember I set the current price as transient, which means that I've reconstituted, and it's got my symbols, it's got my original price, it's got the quantity of stocks I have. But currently, the current value is null. Well, that's not really a good thing.

And so there are two methods that you can use where you can add additional things that you want to have happen when your class gets serialized or gets deserialized. And so, for example, if this is my class implementing Serializable, I could override the method writeObject. Not required, but if there is additional things that you want to have happen, either before this file gets serialized, or after the file gets deserialized, you would either overwrite the writeObject to identify what you want to do instead.

So this would be my normal serialization. It just serializes the Object. But notice that I'm also saying, hey, wait a minute, in that same serialization file, I want to include a current date. On the other hand, in my deserialization, notice that in this case I could do a readObject. I could call the defaultReadObject, but I could also just as easily read this additional date and say, hey, this was originally serialized on some date.

So that's the idea behind these serialization methods. And this gives you a good idea. So in this case, on the readObject for my Portfolio, I'm saying OK, reconstitute the Portfolio. But again, we have a problem. We don't have current values. And so, inside of the readObject method, I say well let's call the setStockPrice method, which will then go out and get the current price for each of my instances of Stock.

And so, in this class, we talked about input. We talked about output. We talked about various streams-- byte streams and character streams. We talked about the ability to serialize and deserialize. And while basic, as we continue, there will be additional things that we are going to be talking about. But right now, it's time to do Lab 13.

## 2. Practice 13-1: Writing a Simple Console I/O Application - 13m

In practice 13-1, we want to write a simple console app in application. So we're going to read from and write to the system console. So we'll go ahead and open up the practice project and open up the file scan interactive class.

And in this class, you'll notice that there is already a count tokens class written that takes two string. One that represents the file that we are going to be looking at, and one that represents what we are looking for. Now notice that in this case, the file reader will connect to the file.

We're going to use a BufferedReader to read one line at a time. And then we're going to create an instance of a scanner to be able to look at what it is we pass in. Now what we're looking for in the document is anything that is not white space. So it's going to break up our document into words. And then we'll look through each of these to search.

Now notice also that we're using the Equals Ignore case method, so that it doesn't really matter how we type it in. It will look just for the letters and the words that we're looking for, nothing else. So our job is to code the main method here.

So the first thing it says is the main method is past an array of strings, which is common. And we're going to use the length attribute to determine whether the array contains less than one argument. So I'm assuming that that means that we're going to do a If there, so the test is-- and we'll get the length. And do we want, if we have less than one-- because in this case, we need to pass in the argument.

So that takes care of that. So what do we want to do if we don't have a file? So print a message, if there is less than one argument, use the system exit to return an error code.

All right, so we've figured out how to do a print message so far. And so we're going to indicate that when we use this that we need to be passing in the file that we're going to search. And then we'll go ahead and exit the system as an error.

So step four, save the first argument passed into the application as a string. So if it works, we're going to go ahead and do that. So we'll call it our file and take the first argument as a string.

Number five, create an instance of the file scan interactive class. You will need this instance to call the count tokens method. All right, simple enough. We know how to do that.

So we'll take an instance. What do we want to call it? Scan sounds like a good deal. And so we have our instance.

Then it says to open the system console for input, using a BufferedReader. All right, so in that case it gives us the note that we should use a Try with Resources to open the BufferedReader. So we can do that.

And so let's see, a BufferedReader-- BufferedReader and we want the system in. So a BufferedReader isn't sufficient into itself. We need to get an input stream reader that uses the system dot in field. That'll do.

And once we have that, what are we supposed to do with it? Let's see, well, it doesn't tell us yet. But it says be sure to add a Catch statement.

So in this case, we're going to check catch an IOException and do something with it. So we'll just do something really simple with it. So if there's a problem, we're just going to shut down.

All right, so in the try block that you created, add a while loop. So we have a While loop. The While loop should run until a Break statement. I can do that part.

Inside the While loop, read from the system console into a string, until the string queue is entered on the console itself. You can use equals, ignore case to allow your users upper or lowercase, use the trim to remove any white space. OK, sounds like a plan. So it doesn't look like we have a condition here. So we'll pass true.

And we do need to instruct our users to do what we are. And let's see, we need a variable to hold our search. So search equals-- we'll use the BufferedReader, and we will do our readLine. And it does say to use the trim. That's the one we want.

So if we ignore it, in that case we will do the break, if it's on the queue. And then what? If the string read from the console is not the termination character, call the Count Tokens method, passing in the file name and the search string.

All right, so if we have a count, use the scanner. We're going to call the Count Tokens method. We will pass in the file, which is that and the search, which is that, sounds good.

And print a string indicating how many times the search token appeared in the file. We know how to do that, so-- and so we are looking for search and count. And add any missing import statements. Well, we didn't do that, because just by using the Control Space bar adds those for me.

And so if we go ahead and save the file interactive class, and looks like we want to have a compilation. All right, we're going to compile our file. Didn't get any compilation error. So that's always a good thing.

And so if we run from-- according to this, we want to go to the Project Properties. We want to go to the Run node. And in the Arguments, we're going to add the file information. So in this case the root directory home, Oracle labs resources and then declaration of independents dot text. And if I have spelled that correctly, we should be able to run this pretty well.

So in order to run it, we need to run it from the project, so that we can pull in that argument. And so it's searching the file. And it looks like I need to put some instruction in there, as to what it is that I'm supposed to do.

But let's see, in the Declaration of Independence, I know there is an in, so-- OK, that works pretty well. Events is in there once, all right. Of, though, yep, that didn't happen, so I guess I'll quit now.

All right, so the program works. But it's obvious that at this point it would be really nice if we ask the user to tell us what's going on. So perhaps we could say please enter a word to search in the following file.

So in this case, it looks like we're going to have all of that. And it did work properly. So that successfully completes practice 13-1.

## 3. Practice 13-2: Serializing and Deserializing a ShoppingCart - 21m

In practice 13-2, we're going to serialize and deserialize a shopping cart. So we're going to write a Java object to the file system, serialize. And then use the same stream to read the file back into an object reference. And we're then going to customize the serialization and deserialization of the shopping cart object, by adding an additional date.

So in this case, we're going to open up our project. And it identifies that there are two main classes-- serialize test and deserialize test-- that we're going to be using to write. And so the first step is to open the serialize test. And you'll notice that there are a number of things already there for us.

So read through the code. You will note that the class prompts for the cart ID and constructs an instance of the shopping cart with the cart ID in the constructor. So in this case we have our directory, which identifies where we want to store this. We're going to start the cart ID, enter the ID for the cart or Q to quit. And then we've seen are BufferedReader, so here's where we create our BufferedReader in a Try with Resources block. And then here's where we're going to populate the cart ID.

If the cart ID equals Q, then we're going to go ahead and exit without error. Otherwise, we're going to go ahead and use the cart ID to create an instance of our shopping cart. Once we have the cart, we're going to add, looks like, three items to the shopping cart.

And at this point we have a print-- shopping cart such and such contains so many items and shopping cart total. And then we're going to get the shopping cart total method. So at this point, it looks like our code is going to go here.

So with that, we now have a cart file. So we're going to use the directory. We're going to call it Cart plus whatever the Cart ID is. And then end it with the serialization.

So we're going to create a try block to open a file output stream chained to an object output stream. The file name is already constructed for you. And so it's going to go in the comment line, great. So let's go ahead and do that.

Now we know how to go with a Try with Resources block, so we'll start there. And we've already said there we're going to create a file output stream. And a good enough name is any, file output stream. And we're going to pass in our cart file to point to that.

Inside of that, we are also going to create a object output stream, which I guess we'll just call O, and is going to take the file object. And so inside of our Try with Resources, we are then going to just call the Write object. And the object that we are going to write is the cart.

Now we also need to write the catch part of this. So we're going to catch the IOException, if one happens. So we want to add the Cart file and pass in the e. And we'll just go ahead and exit at that point, with an error.

The next step says that we're going to add a success message before the method ends. So where is our method? That's the end of the method, so, all right. So we'll put in a success-- successfully did something, serialized shopping cart with ID, get cart ID.

All right, so that allows us for the success. And if we go ahead and save the file, this should be all there is to a simple serialization. If we go to the deserialize, we find that we have very similar information. We have a BufferedReader, but in this case, it's going to read from the file that we just did. We're going to pass in the cart ID.

And so we'll read that in. And as long as there's not a problem, we'll go ahead and reconstitute it. So here's our directory cart with the ID we pass in. So it's going to be looking for the same file that we just serialized.

And so according to this, your code will go in the comment line at the bottom. So we're going to open a file input stream. And in fact, this will look very, very similar to what we just did. But in this case, of course, we are reading or deserializing, then serializing.

So we're going to go ahead and create our Try with Resources. We'll have our catch. And according to this, we're going to be looking for both a class not found and or an IOException.

And so-- something like cart file. So pretty much what we did in the previous exercise. So that takes care of our-- if something goes wrong, we'll also go ahead and print out that it successfully worked. I apparently can't type today, so deserialize-- there we go-- shopping cart.

All right, so what do we need to do inside of here? Well, according to this, we're going to create a file input stream and pass the input stream to the object input stream, to read the serialized file. So I'll write File input stream. We'll call this F-I-S new file input stream. And we need to pass the file.

And once we have that, we need an object input stream. Same thing, but in this case we pass our file input stream. With that, we now can reconstitute our cart. So we'll say cart equals-- I'm going to need to cast it, so I believe that's a shopping cart. And in this case, we're going to read our object input stream and call the read object method.

And I believe that follows the instructions. So it looks like we're good to go. So finally, we want to print out the results of the cart, all of its contents, and the Cart Total cost.

So with that, so let's see if we need our contents. Our shopping cart contains items, Get items will work. And once we've done that, we can loop through each of the items. And I guess we're going to just print it out.

So with a number format, we can get a currency instance. And with that, we can then format it. And this should be from the cart, get cart total. And looks like that should work, so let's go ahead and save it.

So at this point, we can open the shopping cart Java. And you will customize the serialization and deserialization of this class by adding the two methods called during serialization and deserialization. So I'm going to add a method invoked during serialization that will add a timestamp data object instance to the end of the object to stream.

So if we recall from the lecture, the method that we're going to be working with is the right object. That would be private, void. And we need our object stream, no, not our object. We need our output stream, and this does throw an IOException.

So we want to make sure that it does what it's supposed to do. So default write object. And then we're going to write out an object, which will be a new date.

So in my serialization file, I will have not only my shopping cart, but I will also have an additional date to work with. And then in the shopping cart we want our deserialization, which would of course be the read object method. And let's see, the read object method also takes a stream. What's wrong with this. OK, that's fine, and that's fine.

So the first thing we're going to do of course, is just read the object. Yes, the default read object. And then we're going to need to look at the date. So let's see, deserialize the fields from the object stream. Recalculate the total value of the current cart contents.

So in this case, that means we need to-- so we need to see if it is large, if it has anything in it. And if it does, we need to loop through it.

So that will give us our cart total and then get the data object from the serialized stream and print the timestamp to the console. So object input stream, read object. You'll notice there's no read date, so can't use that. And then we're going to identify when that was.

Now we've done the Get Date instance before. So we're going to format our date. We'll fix the import and apparently save the shopping cart. So let's see what we've got.

So the read default object-- unreported exception, ClassNotFoundException must be caught. All right, so let's see.

So in this case, we can declare that there are more than one object or more than one exception that could be thrown. That takes care of that one. And I know that.

All right, so looks like we're good. So now it's time to test and see if the application actually runs. So in step 9, test the application. The application has two main methods, so you will need to run each method in turn.

So we will go to the serialize test first. And in the serialize test, we'll go ahead and run the file. And so we will use the year for that. All right, so for shopping cart 2015 contains three items, total cost $58.39, successfully serialized shopping cart with ID 2015.

All right, that looks like that is what is supposed to have happened. So let's see if we can do this. Now if we go out to the files under practice-- it looks like practices, practice. These would be our classes. So that's not where it was going to hold it.

I guess we'd have to go to the System Tools to find it. I'm not going to do that at this moment. But let's see if it actually works.

So if we right click here and run the file, we can enter in the correct cart ID. So that restored the shopping cart from today's date, 2015. It contains these three items, and the shopping cart total is $58.39. So it does appear that we have gotten a successful run. So we were able to serialize the object-- the shopping cart-- and then deserialize it successfully, which means that we have successfully finished practice 13-2.

## 4. Skill Check: Java I/O Fundamentals - Score 80% or higher to pass

Skill Check: Java I/O Fundamentals

View Skill Check
