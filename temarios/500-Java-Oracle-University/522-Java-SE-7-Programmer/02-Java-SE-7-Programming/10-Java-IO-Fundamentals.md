# 10: Java I/O Fundamentals

1. Java I/O Fundamentals, Part 1 - 20m
2. Java I/O Fundamentals, Part 2 - 23m
3. Java I/O Fundamentals, Part 3 - 13m
4. Practice 10-1: Writing a Simple Console I/O Application - 10m
5. Practice 10-2: Serializing and Deserializing a ShoppingCart - 14m

## 1. Java I/O Fundamentals, Part 1 - 20m

After we went through the practice labs of Lesson 9, let's go ahead now and get into Lesson 10, which covers Java I/O fundamentals. In this lesson, we are going to describe the basics of input and output in Java, read data from and write data to the console, use streams to read and write files, and read and write objects by using serialization, which, by the way, we discussed earlier a little bit in the previous lessons.

Looking at Java I/O basics, where the Java programming language provides a comprehensive set of libraries to perform input/output functions. Then Java defines an I/O channel as a stream, and I/O stream represents, of course, an input source, or an output destination. And of course, a stream can represent many different kinds of resources and destinations, including disk files, devices, other programs, memory arrays, and so forth. And streams support many different kinds of data, including simple bytes, primitive data types localized characters, several objects, and so forth.

Let's look now at the I/O stream. In general, a program uses an input stream to read data from a source on an item, one item at a time. So here's a data source, in this case on this side, and of course it reads in this case. The stream allows you to read data to your program. And of course, the program reads data from the stream. And the program uses an output stream, again in this case an output stream, to write data to a destination, which is a sink-- we also call it sink-- one item at a time.

Again, no matter how they work internally, all streams represent the same simple model to programs that use them. A stream typically is a sequence of data, and a stream flow of data, pretty much a stream can come from a source, or can be generated to a sink. A source stream indicates the flow of data, also called an input stream, and of course a sink stream terminates the flow of data, and of course is also called an output stream. And, by the way, usually our source and sinks are both node streams. And the types of node streams that we have could be files, could be memory, could be pipes between threads and processes, and so forth.

Now, looking at the I/O Application. It turns out that an application developer typically uses the I/O streams to read and write files and to read and write information to and from an output device, and of course, something like a keyboard or a console. The keyboard for the standard input, and the console for the standard output. And of course, it could be three writing into a socket for internet communications. So usually, you write to a file or directory, you write to a console, standard input or standard output. Standard input would be the keyboard, or it could be a socket-based type of source. In fact, folks, and let me just show you the last one on the board, which is the concept of sockets.

And in the concept of sockets, we typically have a client side, and we have a server side. And in general, we open sockets. So on the server side, we open a socket, and the socket is always open with a couple of parameters, which are what? The IP and a port number. And then, on the client side, we also have a socket with an IP and a port number. On the server side-- again these are system calls. On the server side, we always bind a socket to socket address. And on the client side, the client will go ahead and attempt to connect to a server. On the server side, the server binds the socket to socket address and then starts listening to a certain number of clients.

Of course, when this guy tries to connect, this guy will go ahead and accept the connection, acknowledging, hey you can talk to me. At that point, the client will go ahead and write a command, can you do something for me, please? And then, of course, this will be read by the server. The server processes the command, and then writes the answer. Of course, in this case, the client reads the answer and does what it wants to do with it. That's, in general, how TCP/IP works. So you can see write and read and so forth. This is again at a high level.

Let's go ahead now and continue with our lecture. Looking at the data within the streams. Java technology supports two types of streams, characters and bytes. Input and output of character data is handled by readers and writers. On the other hand, input and output byte data is handled by input streams and output streams.

normally the term steam refers to the byte stream, and the terms reader and writer refer to the character streams. And that's why you see them here in this table, where for the source stream, we have an input stream, and of course, for the character stream, we have a reader, and then for the sink streams, we have output streams for the byte streams, and of course, writer for the character streams. Java technology supports both types of data input streams, raw bites and Unicode characters. And typically, the term stream refers to the byte streams, and the term reader and writer refers to the character streams, like I mentioned to you.

Looking at the byte stream InputStreams methods. As you see here, we have three basic read methods. They are read, read byte read, and the read pass buffer, or read that takes a buffer, an offset, and a length. And there are other methods that include close, available, skip, markSupported(), mark(), reset(), and so forth. In general, the read method returns an integer which contains either a byte read from the stream or a -1, which indicates the end of the file.

And we should also note that for efficiency, always read data in large, practical blocks, or in buffered streams. And, when, in this case, you have finished with a stream, close it. If you have a stack of streams, use filter streams to close the stream at the top of the stack. This operation also closes the lower stream. We should also note in Java SE 7, InputStream now implements AutoCloseable, which means that if you use an input stream, or one or more of the subclasses in a try-with-resources block that we've seen earlier in the previous lecture, which is Lesson 9, the stream is automatically closed at the end of the try and we do not have to use the finally close.

We also have a method here called available method, which reports the number of bytes which are immediately available to be read from the stream. An actual read operation following this call might return more bytes. Of course, the skip method that you see over there, that discards the specified number of bytes from the stream. We also have the markSupported(), the mark() and reset(), which are related to the push-back operations. Let's go ahead and say something about them.

The markSupported(), mark(), and reset() methods perform the push-back operations on a stream. It's supported by that particular stream. Of course, the markSupported() method returns true if the mark() and reset() methods are operational for that particular stream. And the mark() method indicates that the current point in the stream should be noted and a buffer big enough for at least the specified argument number of bytes should be allocated. The parameter of the mark() method specifies the number of bias that can be read by calling the reset(). After subsequent read operations, calling the reset() method returns the input to-- rather, the input stream-- to the point you marked. If you read past the marked buffer, reset() has no meaning.

Let's look now at the byte stream, which is the OutputStream method. Again, as you see, there are three write methods. And one that gets an integer, the other one gets a buffer, and the third one gets a buffer of bytes, and of course, an offset, and a length. A bunch of other methods include close, which is automatically closed in try-with-resources, and the flush, which forces a write to the stream.

Alright folks, let's go ahead and look at an example of the byte stream example. But to actually look at it in a-- why don't we look at it in NetBeans. This way, we can go ahead and run it if we want. So, it's pretty much the same as in the slide, except that we want to look at it in NetBeans. So, we have a ByteStreamCopyTest and we have a main method, and in it, in this case, we're passing a couple of arguments, args[0] and args[1], where args[0] plays the role of the input file, and args[1] represents the output file.

So first, we have a message, in this case, which says ByteStreamCopyTest, and then, of course, your original copy. And after that, we declare an array of bytes, b, of size 28, and then we declare a variable, integer b then, that will be the length of your array b. Of course, in this case, the example uses InputStream methods. When we need the try block we'll go ahead and create a new instance of the file input stream and pass args[0] to it. That specifies the name of the input file. And that, of course, would be my FileInputStream. And then of course, the FileOutputStream, which is also built through the constructor file InputStream, and we pass to it args[1], representing the output file.

And after that, here, we have a message that says print available, again, bytes available, and then by calling the available method on the FileInputStream, that of course, the available method returns for us the number of bytes. Available bytes to be read. And then here, we declare a counter, a variable of type integer, and we declare a variable, read of-- or read of type integer, initialize both of them to 0, and then we use the while loop. As you see here, when we use the while loop,

Well, again, within the while loop, we are first of all reading the information in the byte array through the FileInputStream, and as long as this is assigning it to read, and then, as long as this different from -1, then we say OK, if read is less than 1, the length of the array, in this case, we'll go ahead and write that into the FileOutputStream. And we'll go ahead and write that into the array into the FileOutputStream. What we want to do here, because that gives us read, now would give us what? What is that, the value of read, is the number of bytes read. So, we added to the count and of course at the end, what we want to do is print the count, which represents what? The total number of bytes read.

And of course, we catch an exception if there is an exception. First, we catch a couple of exceptions here. The first one is the FileNotFoundException, and the second one is the IOException. We could have, by the way, used a multi exception here, a multi-cache exception, because NetBeans here supports the Jave SE 7. Everybody's following, folks?

Alright, continuing with that, now looking at character stream reader method.s What the three basic read methods here are the read method, and read that takes an array of characters, and read that takes an array of characters, an offset, and of course, a length. We also have other methods like close, ready, escape, markSupported(), mark(), and reset().

Continuing with this, let's go ahead and look now at character stream writer. Looking at the character stream writer methods, we have the write methods that are write that takes an integer, and of course the write that takes an array of characters, a write that takes an array of characters, an offset, and a length, a write that takes a string, and a write that takes a string, an offset, and a length, and of course, a bunch of other methods, which are the close and the flush. The methods are analogous to the the OutputStream methods.

And here's an example. It turns out that this is an example related to the character stream examples, where, we'll go ahead and-- let me just make it slightly bigger so we can see this. So we see that we have a class called CharacterStreamCopyTest, where we have a main method. First we go ahead and declare an array of type characters, and get the declare-- in this case, this is of size 28-- and declare a variable of type integer that will be the length of that array, c. And of course, here, we're using FileReader.

So, first of all, we create a FileReader where we pass to the constructor FileReader, args[0] representing the input file. And, in the second one, we'll go ahead and create an instance of FileWriter and pass to it args[o] to the constructor representing the output file. We declare a count variable and initialize it to 0, we declare a variable read and initialize it to 0, and then within the while loop, we'll go ahead now, and of course, kind of similar to what we've seen earlier on NetBeans using the InputStreams and OutputStreams, in this case, we're using read and of course the FileReaders and FileWriters.

So we'll go ahead and write that to the FileWriter, and if the read-- rather, the read is less than the c then, which is the length of the array, and else, we'll go ahead and use the write method on the FileWriter to write that array. We add the read to the counter. And again, in this case, rather than a byte array, this version uses a character array. After that, we'll go ahead and print the count, the number of characters that we wrote, and then we catch a FileNotFoundException and an IOException.

So far, so good? Everybody's following, folks?

## 2. Java I/O Fundamentals, Part 2 - 23m

So that's kind of nice to actually see this. Let's go ahead and continue now and see the concept of the I/O stream chaining. Well, typically, a program rarely uses stream objects. Again, instead, it chains a series of streams together to process the data. Of course, here, what we've done is we looked in the top image here, on the top diagram that we see here, related to the input stream chain that we see and I just highlighted.

The slide pretty much demonstrates an example of an input stream, in this case, a file input stream is buffered into the buffered input stream, and then, of course, converted into a data input stream that is read by your program. And in the one below here, it is the other way, where your program now, in this case, pretty much shows a data output stream, which is buffered to a buffered output stream, which is then passed to the file output stream to, of course, pass into a data sink.

We use this buffering for efficiency, folks. Let's look an example of a chained stream example. So again, if we take a look at this example, and just so that we can see what they're trying to do here, first, the class is called BufferedStreamCopyTest where we have a main method.

And of course, in this case, we'll go ahead and first of all create a BufferedReader by doing what? By first of all, creating a new instance of the FileReader, pass args [0] to it. And then we wrap it up inside a BufferedReader. So the end, we are creating a BufferedReader. So here, what we've done is we use the FileReader chained to a buffered file reader. Again, this allows the use of a method that reads a string.

And then here, in the second one, we do the same thing where we create an instance of the FileWriter using args [1] representing the name of the output file. And then we wrap it up into a BufferedWriter to create, of course, a BufferedWriter here. And then after that, we declare a string called line, initialize it to empty string.

And then after that, we use the while loop, again, to read the line in this case. So the character buffer here replaced by the string. And also, we should note that the readLine here uses the line character as a terminator. Again, therefore, in this case, we must add that back to the output file.

So again, we do that. And in this case, we'll go ahead and write that into the BufferedWriter that we have, and of course, within the newline. And of course, we catch an exception, if there is an exception. That would be a FileNotFoundException an IOException. Everybody sees that? OK, good.

Continuing with our lecture, let's look at some of the processing streams. Again, in this case, we see the functionality. This table represents the functionality, the character streams, and byte streams. It turns that if you want to handle buffering with stings, for character streams, you can use BufferedReader, BufferedWriter. For byte streams, you can BufferedInputStream or BufferedOutputStream.

For filtering, you can use FilterReader, FilterWriter for character streams or FilterInputStream, FilterOutputStream for byte streams. For conversion byte to characters, we can use InputStreamReader and OutputStreamWriter. For object serialization, we have ObjectInputStream and ObjectOutputStream for byte streams. For data conversion, we have it for byte streams, which is DataInputStream and DataOutputStream.

And for counting, we have on the character streams, it is LineNumberReader. And of course, on the byte stream, it's LineNumberInputStream. And for the peeking ahead, we have the PushbackReader on the character streams and, of course, the PushbackInputStream on the byte streams. And for printing, we have PrintWriter for character streams, and of course, PrintStream for the byte streams.

Let's look now at the I/O Console. Well, it turns out that the System class in the Java language package has three static instance fields, out, in, and err. The System.out field is a static instance of a PrintStream object that enables you to write to a standard output.

Of course, the System.in field is a static instance of an InputStream object that enables you to read from a standard input, which is, by the way, what? A keyboard. And the System.err field is a static instance of the PrintStream object that enables you to write to a standard error, in this case, would be the error that represents that you print to the standard output.

Let's look at the java.io.Console. Well, in addition to the PrintStream objects, System can also access an instance of the java.io.Console. The Console object, by the way, represents the character-based console associated with the current JVM.

And of course, whether a virtual machine has a console depends on the underlying platform and also upon the manner in which the virtual machine is invoked. Again, NetBeans, by the way, does not have a console. To run an example in the project-- like SystemConsoleExample-- you need to use the command line.

And here's an example using the console. So here, we create a new instance of the console. Again, in this case, if the console is different than null, we go ahead and make, use, create a couple of strings, userTyped and password-type-- pwdTyped for password. And then here, within do-while loop, we'll go ahead and do what? First, we'll go ahead and readLine, in this case from the console by reading the user name first and assign it to the userTyped here that we declared as a string.

And then here, we'll go ahead and create a new string, to which we pass readPassword on the console. And that will go ahead, and of course, create for us an instance of the string representing the password. Again, readPassword does not echo the character typed to the console. And then, of course, use it to initialize the pwdTyped string that we declared here.

Then after that, we use the if statement. We say, OK, if the userTyped is equal to "oracle," and the pwdTyped is "tiger," go ahead, in this case, and set the userValid to true. Else, print an error, in this case, or a message saying that "Wrong username/password, try again." And of course, that's while the userValid is not valid.

We should note that you should pass this username and password to an authentication process like what? Like the Java Authentication and Authorization Services. Everybody's following here, folks? Good.

Now, looking at writing to a standard output. Well, typically, folks, we use the println and the print method that are part of the PrintStream class. The println method, by the way, print the argument and a newline character, which is the backslash n.

The print method, on the other hand, prints the argument without a newline character. The print and println methods are overloaded for most primitive types, Boolean, character, int, long, float, and double, and of course, for the array of characters, Object, and String. And of course, the print (Object) and the println (Object) methods call always the two-string method on the argument. Everybody is following, folks?

Let's go ahead and look now at reading from a standard input. So again, in this case, we are using the try-with-resources statements, in this case, on line 6. So we don't have a finally block, and we are not closing that.

Let's go ahead and look at this example. We have a keyboard import. It has a main method. First of all, we go ahead and chain a BufferedReader to an input stream that takes a console input. This is how we pass the console input to the constructor InputStreamReader.

And we pass the whole thing to the constructor of the BufferedReader to end up building what? A BufferedReader. We declare a string, initialize it to empty string called s. And then we read each line and echo it to the screen by doing what? Using the while loop.

While s is different than null, go ahead and print what? Type again xyz to exit. We'll see how that is taken care of. And then here, what we do is we'll go ahead and involve the readLine on the input, and then we evolve the trim. What does the trim method, by the way, do of the string? It would go ahead and get rid of the--

Excess space.

Exactly. Excess space. And then after that, we'll go ahead and, of course, print, in this case, the string that we read. Now look at that. If now the s is xyz, then we call System.exit (0), which, by the way, does what? Exits-- quits the application. And of course, catch an IOException if there is an IOException.

So as you see here, we are making use of the try-with-resources statements, because here, starting at 6, where we do not close the input stream here, we don't have to, because it's closed automatically. And that's, of course, supported in the Java SE 7. Everybody's following, folks?

Let's look at the channel I/O. Well, this channel I/O was introduced in JDK1.4. And of course, channel reads bytes and characters in blocks, rather than one byte or a character at a time. Again, in this example, a file can be read in its entirety into a buffer and then written out in a single operation to a file.

So here's an example. Let's go ahead and look at this example, just out of curiosity. And in this example, we have a ByteChannelCopyTest where we have a main method. First, we'll go ahead and within the try block, we'll go ahead and create a new instance of FileInputStream passed to its args, and then invoke the getChannel to get us a file channel.

And that represents the input file channel. That would be the file input channel. And then, of course, in this case, we'll go ahead and use the FileOutputStream constructor and pass to it args [1], representing the output file and invoke a getChannel to get the file channel out.

Then, after that, we go ahead, and in this case, call the allocate method and pass to it the size of the function input on, of course, the ByteBuffer that creates a buffer sized the same as the file size and then read and write the file in a single operation. So you get your byte buffer.

Then, after that, you go ahead and read that. You read the whole file in one to the ByteBuffer. And then, of course, after that, go ahead and call position so we get the position 0 in the buffer. And then we'll go ahead and write all of that to, of course, the output file and catch a FileNotFoundException or an IOException if there is an exception. Everybody sees that? OK

And of course, we have a practice. We'll talk about that practice later on, where in this case, we're writing a simple console I/O application. Continuing with that, let's go ahead and talk now about persistence, because after all, we are interested in persisting data, especially when we talk about I/O fundamentals.

Well, saving data to some type of a permanent storage is called "persistence." Of course, an object that is persistent capable can be stored on a disk, or any other device, or sent to another machine to be stored through, for example, a socket.

A non-persistent object exists only as long as the Java Virtual Machine is running. And of course, Java serialization is the standard mechanism for saving an object as a sequence of bytes that can later be rebuilt into a copy of the object. Of course, to serialize an object of a specific class, the class must implement the java.io.Serializable interface, which, by the way, we have seen earlier in one of the previous lessons.

Let's look at serialization and object graphs. It turns out, folks, that when an object is serialized, only the fields of the object are preserved. Of course, when the field references an object, the fields of the referenced object are also serialized, if, of course, that object's class is also serializable. So again, the tree of an object's field constitutes the object graph. So in this case, if an object is serializable, of course, the serialized object is referencing also would be serializable.

Let's go ahead and look now at transient fields and objects. By the way, folks, some object classes are not serializable because they represent transient, operating-system-specific information. For example, if the object graph contains a non-serializable reference, a non-serializable exception is thrown, and of course, the serialization operation fails.

So fields that should not be serialized, or that do not need to be serialized, should be marked with the keyword what? Transient. And this is exactly what we discussed before. So if I want, for example, C not to be serialized, then I'll just mark it as what? As transient. Everybody's following, folks?

Let's look at the transient example. Here's an example, folks, that I have a class called Portfolio that implements Serializable. Here, we go ahead and declare an inputFile of type, again, in this case, a FileInputStream, and we mark it as transient. And then here, we have a static variable base, which is initialized, in this case, to 100. Static fields, by the way, are not serialized, by definition.

And of course, here, we have another variable, totalValue, which is an integer, initialized to 10. And what did we do here? We, of course, decided that it's going to be transient. Transient means what, folks? It's not serializable. Again, in this case, serialization will include all the members of the stock array. So if I want to decide that for example, here, this one here, it is serializable because we did not state that it is transient.

Again the field access modifier, which could be protected, private, or public, has no effect on the data that is being serialized. The values stored in the static field, of course, are not serialized. And when the object is deserialized, the values of the static fields are set to the values declared in the class. And of course, the value of the non-static transient fields is set to the default value for that type.

One more thing, folks, is during serialization, a version number, which is a serial version user ID, is used to associate the serialized output with the class used in this serialization process. This is used pretty much as a correlation between, in this case-- to associate the serialized output with the class used in the serialization process.

Again, upon the deserialization, the serial version user ID, which is a unique ID in this case, is checked to verify that the classes loaded are compatible with the object being deserialized. So it is like a marker, if you want, to make sure that whenever you are deserializing, the serial vision unique ID, or UID, is checked to verify that the classes loaded are compatible with the object being deserialized.

Of course, if the receiver of a serialized object has loaded classes for that object with different serialVersionUID, then the serialization will result into what we call an InvalidClassException. A serializable class can declare its own serial version unique ID by explicitly declaring a field name called serialVersionUID as a static field, and of course, of type long, and we see it typically like this. In fact, you'll get a chance to actually work with this.

There is a note in the Java documentation that is also quite interesting, and I would like to actually state it, because I think it's important. You also can find it in the Java documentation. And it's on the java.io.Serializable states-- and it says the following, if a serializable class does not explicitly declare a serialVersionUID, then the sterilization runtime will calculate a default serialVersionUID value for that class based on the various aspects of the class, as described, of course, in the Java Object Serialization Specification.

However, it is strongly recommended that all serializable classes explicitly declare the serialVersionUID values, since, of course, the default serialVersionUID computation is highly sensitive to class details that may vary depending on compiler implementations, and of course, can thus result in an expected InvalidClassExceptions during deserialization. Therefore, to guarantee a consistent serialVersionUID value across different Java compiler implementations, a serializable class must declare an explicit serialVersionUID value.

It is also strongly advised that explicit serialVersionUID declarations use the private modifier where possible. Of course, since such declarations apply only to the immediately declaring class, then serialVersionUID fields are not useful as inherited members. Of course, array classes cannot declare an serialVersionUID, so they always have the default computed value. But of course, the requirement for matching serialVersionUID values is waived for array classes.

So the bottom line was saying that it's advisable that you declare a field name and serialVersionUID, and of course, as a static find and then work with it.

So what do you mean by array class?

The array class, again the classes of the arrays that we typically work with, arrays that hold different types of data.

Are you declaring an ID in a class that I can't serialize? Or that I can serialize, but I can't do my numbers?

Yeah, exactly. It takes the default serial ID. Let's look at a serialization example. In this example, a Portfolio is made up of a set of Stocks. So we have a Portfolio made of a set of Stocks. Again, during serialization, the current price is not serialized. Let me go ahead and just do it so we can see.

So again, in this case, the current price, which is this one here, we marked it as transient, which means it's not serialized, and of course, is therefore marked transient. However, we do want the current value of the Stock to be set to the current market price upon deserialization.

## 3. Java I/O Fundamentals, Part 3 - 13m

So let's go and look at, again in this case, an example. Writing and reading an object stream.

So looking at this example, in the main method, first we declare instances of stocks S1, S2 and S3. Again, all initialized with Oracle stock, Apple stock and Google stock.

Here we create a new instance of portfolio, passed with the stocks here. That portfolio is a root object. And down here within the try method, we go ahead and create an instance of file output stream representing arg zero.

And then, of course, pass that to an object output stream constructed to get an object output stream.

And then after that we'll go ahead and invoke the write object method on the object output stream. Again, the write object method writes the object graph of P to the file stream.

Of course, catch an exception, and I/O exception if there is an I/O exception.

Here, within the try block below here, we create an instance of a file input stream bypassing the arg zero, representing in this case the name of the file.

And then, of course, after that we'll go ahead and-- in this case-- pass that file input stream to the constructor object info stream, to get an object info stream.

And then, of course, after that, we'll go ahead and-- in this case-- invoke the read object that you see here on the input stream. And that will read-- again this real object method-- will go ahead and restore the object from the file input stream.

So once you get that object, you cast it into an object of that portfolio, and you have it, and now you work with it.

So this is pretty much showing us what? The serialization and deserialization. As you see when you read it back, to deserialize, you need to of course get that object and cast it into object that you are working with.

Remember that at the beginning the object that we worked with was P. So when we write it into a file-- in this case rather to the object output stream-- we'll go ahead and pass that. And the write object in this case pretty much writes that object graph of P to the file stream.

And then here we're showing you how when you read it from the object input stream, you pretty much not are reconstructing the object by getting that object. And of course, in this case, casting it into an object of that portfolio, and then use it to initialize this new P, which is pretty much an object of type portfolio.

And then after that you can go ahead and work with it. So what we're showing you here is that, again from line six to line eight here, is pretty much the file output stream is chained to an object output stream. And this allows the raw bytes generated by the object output stream to be written to a file. Through the what? Through the write object method.

Again, this method pretty much walks the object graph and writes, in this case, the data contained in the non-transient and non-static fields as raw bytes.

And then later on-- in this case from line 12 all the way here to line 14-- to restore an object from a file, the file input stream is chained to an object info stream. And of course the raw bytes in this case read by the method read object. Method restore an object containing the non-static and transient data fields. And of course this object now must be cast to the expected type. In this case we casted it into an object of type what? Portfolio, so that it could work with it.

So here you will see how an object is marshalled into bytes to go out to the output stream, and then how it's marshalled to come back, of course, and cast it into an object that it can work with. Everybody sees that? K good.

Let's go ahead and look at serialization methods. When an object being serialized or deserialized can control the serialization off its own fields. In this slide, we have an example of a class called MyClass that implements serializable. It has a bunch of fields that we don't see here. And then we are interested by this method called writeObject, that takes of course an object of type object output stream.

Of course here, the default write object that you see here is called to perform the serialization of this class fields. Of course, after that we can have write and save additional fields. And if you take a look here, for this example in this class the current time is written into the object graph. And we see it where we invoke the write object on the object output stream, and pass through it a new instance of date.

And of course during the serialization a similar method is of course invoked in this case. It's a read object, but it's an object input stream that you see here. Of course, what we need to remember folks in this case, is that the write object method is invoked on the object being serialized. If the object does not contain this method then the default right object method is invoked instead. And of course we saw this in this example.

Of course, this method must also be called once and only once from the object's write object method. Of course, during deserialization the read object method is invoked on the object being deserialized. Of course, if present in the class file of the object.

Now we also should remember that the signature of the method is quite important. And now we can see, again, the newer version of the read object that we've seen here, which is an expanded one. We have the read object method that takes an object of type object input stream, and of course here as you see, we call the default read object on that object input stream reference variable.

And then of course after that we go ahead and print the date this object was serialized. And we do that of course through the println that we have here.

Let's look at a read object example. Well in this example, we have a class called stock that implements serializable. Again, in this stock class, the read object method that we see here is provided to ensure that the stock's current price-- which by the way decided that is going to be transient here-- is set by the method set stock price. After of course deserialization of the stock object.

We should also note that the signature of the read object method is critical for this method to be called during deserialization. Again here, just in this example, we see how we have a stock that implements serializable. And in this case we have of course a serial version, a UID, that of course is a long, static final variable. And we initialize it to-- in this case-- 100.

And then we declare a string symbol. And of course shares, which is an integer. And the purchase price, which is a double. And then of course the current price, which by the way we decided is going to be transient.

So in the constructor here, we pass through the constructor symbol, again the shares, and of course the purchase price. And we use them to initialize, of course in this case, the assemble, the shares, and the purchase price.

And if you take a look here, we see that the stock current price is set by the what? By the method set stock price during creation of the stock object. But of course the constructor is not called during deserialization.

And here, again, this method is called post-deserialization, which is read object. It takes an object of type object input stream. And of course, as you see here, it would go ahead and call the default read object. And of course perform all the reserialization.

And here, you see that we also call the set stock price. Again the set stock price in this case will set the current stock after the other feeds are deserialized.

So, in summary, what we have seen in this lecture is we describe the basics of input and output in Java. We read data from and write data to the console. We again used streams to read and write files. And of course we did write and read objects by using serialization.

And of course, for this particular lesson we do actually have also a bunch of course practices for this particular lesson. And those are the practice labs for lesson 10, which is the Java I/O fundamentals.

So in these practices, the first one we ask you to write a simple console I/O application. Again we give you this summary level, a version part of it. And of course if you're interested by just using enough information here to do your practice lab, that's good. If you need more information, you can get into the detailed level where you make use of the-- again in this case-- more information to be able to do your practice, related to writing a simple concept I/O application. As you see here, we give more information.

Practice two for again the I/O, would be serializing and deserializing a shopping cart. Again, we give you the summary level, and if you're comfortable, you can go ahead and do your practice with the information given to you here.

If you want more information, get into the detailed level, and that gives you more information to do you practice.

So we'll go ahead and do the set of practice labs for lesson 10. And after we finish we'll go ahead and of course get into lesson 11. Thank you.

## 4. Practice 10-1: Writing a Simple Console I/O Application - 10m

After we looked at Lesson 10-- that covered Java I/O fundamentals, where we described the basics of input and output in Java, we looked at reading data from and writing data to the console, we looked at using streams to read and write files, and we looked at reading and writing objects by using serialization-- we're going to look at the practices of Lesson 10. And we of course start, in this case, with Practice 1, which is the 10-1. And we of course use the detailed level in this case.

With this practice, we will write a simple concept-based application that reads from and writes to the system console. And that means, of course, the console is opened as a window in the IDE. So the task here is we open the Project File Scanner. And we open the File Scanner Interactive.

Then we should notice that the class has a method called countTokens already written to you. This method takes a string file and a string search as parameters, because the method will open the file passed in, and use an instance of a Scanner to look for the search token. For each token encountered, the method increments the integer field instanceCount. When the file is exhausted, it returns the value of instanceCount. And we should note that the class rethrows any IOException encountered, so you will need to be sure to use this method inside a try-catch block.

Cause looking at NetBeans is the countToken method that of course we discussed here in Step 2 in the lab in the practice and on your activity guide. And pretty much, you see how it takes a file and, of course, is trying to search. And this will count the number of occurrences if the string search in the [UNINTELLIGIBLE] file name is, of course, that.

And so you see, we declared this instance count, initialize it to zero as an integer here, change a file reader to a buffer reader to a scanner. So we see that within the try-block. And, of course, we use the while loop in this case by getting the next token and training invoking the tree method. And how we, of course, in this case, if it has that, we'll increment the instance count. And at the end, you return the instance count.

Continuing with, of course, the code the main method to check the number of arguments passed. The application expects at least one argument string representing the file to open. If the number of arguments is less than one, exit the application with an error code, (-1).

The main method, of course, is passed an array of Strings. When, of course, the length attribute to determine whether the array contains less than one argument, print a message if there is less than one argument and use the System.exit to return an error code. Of course, - is typically used to indicate an error. And of course you would see the code, it should be similar to what we have here in step 3.

Save, of course, the first argument passed into the application as a String. And, of course, create in this case an instance of the file scan interactive class. You will need this instance to code the countTokens method. And that's how you see the code, how we did that. And down here.

And, of course, open the system console file using a buffered reader. And use a try-with-resources to open a buffered reader chain to the system console input. Again, we call that a system.in. It is an input stream connected to the system console.

Be sure to add catch statement to the try block. Any exception returned will be an IOException. And, for example, you see code similar to this one here.

And step 6b. In the try block that you created, add a while loop. The while loop should run until a break statement. And, of course, inside the while loop, read from the system console into a string until the string q is entered on the console by itself.

Again, we should note that you can use equalsIgnoreCase to allow your users to enter an upper or a lower "q" case. Also, the trim method is a good choice to remove any white space and characters from the input. If the string read from the console is not the terminal character, call the tokenCounts method, passing in the file name and the search string.

Again, print a string indicating how many times the search token appeared in the file. Your code, again, inside the try block should look something like what you have here. Well, again, here you have the search, and then the [UNINTELLIGIBLE], which should pretty much give you a message.

Searching through the file, whatever file you have, and then while true, go ahead and print, enter the search string or q to exit, and of course, invoke the readLine and trim on it, and use an if statement in this case. And of course, if it's in this case q, then obviously break. And otherwise invoke the countTokens on the reference variable scan past the file and search string. And of course, at the end print how many times this search appears in your text. Add any missing imports and save. And of course this class.

And obviously, in this case, all of this is in the main method. Where, of course, here, the code that we see earlier, if the length is less than 1. Again, the file name is represented by args[0]. Create an instance of the file scan interactive. And then use the try block again to create a buffer reader. And use the, again, the while loop to read, and in this case to enter, the search string. Otherwise, [? hit ?] [? q ?] to [? exit. ?] Or to break out. And of course, call the countTokens that we've seen earlier, the countTokens method, to of course find out how many times the word that we're searching appears in the text. And catch any exception, IOException, if there is any exception.

Continuing with that, now, of course, after everything is done, they want us to run the application. But they want us to also enter, in this case, in the argument on the Run category the file name and its location. And, of course, run the application. And we should get an output similar to this one here. It's going to look at that.

For this, we'll first right click the project and click on Properties. And then we go the Run category and then we see that the name of the file, obviously, it's already input over there. I added it earlier. And then, of course, click OK in this case.

And then if we run it, as you see here, it gets us the prompt. And let's assume, they say look for "when." So let's go ahead and look for the "when" word and hit return. Again, as you see, it says that the word "when" appears three times in the file. How about if we look for "rights"? And then we hit return. And then we see that it also appears three times in the file. And how about the last one, which is "free"? And if we hit return, then we see that it appears four times. And of course, if you now input q, and of course it's going to break out.

And that pretty much ends the Practice 1 of Lesson 10. Thank you.

## 5. Practice 10-2: Serializing and Deserializing a ShoppingCart - 14m

Let's look at Practice 2 of Lesson 10. In this practice, we use the Java.IO.ObjectOutputStream class to write a Java object output stream class to write a Java object to the file system to serialize, and of course, then use the same stream to read the file back into an object reference. Again you will also customize the serialization and the serialization of the shopping cart object.

Well this practice, the task is that we open the serialized shopping cart project, suspend it of course, and end of become that example but this package take a look at both serialized test and the serialized test and we will be writing the code in these main classes to serialize in this serialized shopping cart objects.

So first, we open the serialized test. We'll write the methods in this class to write several shopping cart objects to the file system. Read through the code. Again, you will note that the class prompts for the cart ID. And of course, instructs an instance of the shopping cart with the cart ID in the construction.

Again the code then adds three item objects to shopping cart. The code then prints out the number of items in the cart, and the total cost of the items in the cart. Again, look through the shopping cart and item classes in the com.example.domain the details of how these classes work. You will be writing the code to obtain an object output stream and write the shopping cart as serialized object on the file system.

So we create, the in this case, trial blot to open a file output stream chained to an object output stream. Again, the file name is already constructed for you. Your code will go where the comment line is at the bottom of the file. Open the file output stream with the cart file stream the try-with-resources block.

Pass the file output stream instance to an object output stream to write the serialized object instance to the file. Write the cart object to the Object output stream instance by using the right object method. Be sure to catch any I/O exception and exit with an error as necessary. Add a success message before the method ends-- in this case, success will be serialized shopping cart with the ID, whatever, then, of course, called the get cart ID on the cart. Save the file.

So let's go ahead and look at that. And that means, first of all, let's take a look at the item class, which is again, implements serializable. It has a serialized version UID, again, which is a long integer, and, of course, it has an ID, named ID variable, it has a description and a cost.

You've got the constructor. And you have getCost, setCost getDescription, setDescription, getID, setID, and the two string method which is overriden. And then they also told us to again, look at the shopping cart class which is implements serializable. It has, of course, the serial version UID here, which is again equal to 23.

It has a cart ID. It has an Array list items. It has an item count and it has a cart total.

And here we see the constructor. And we have a getCart total, getCartID, addItem, getCartSize, getItem, readObject method. This method is, off course, only called during deserialization. And, of course, writeObject with this method is only called during serialization.

And for serialize, here is again the class, where obviously the SerializeTest, as class that we discussed. First of all you have the directory, which is going through, again in this case, the directory D://labs/10 for lesson 10-IO_Fundamentals//practices. And by the way, on your system, it could be-- your project could be located anywhere. So the directory made might not have this path.

The cartID has a cartID issuing the ShoppingCart. We would declare they know again the cartID as a string, or reference to a string, and a ShoppingCart is referenced to a ShoppingCart. The printIn message, enter the ID of the cart and so forth. And again, use the try. That's where we said we wrap the System.in input stream with a buffer reader to read every line from the keyboard, and you see that here, the cord is here. I'll just move this here a little bit so we can see that.

And then after that, we'll go ahead and initialize the ShoppingCart with the new instance of the ShoppingCart here. That's on 26. Catch an IOException or a NumberFormatException here. Again as you see here, we have multi-exception, or rather multi-catch. Attach that catch model Exception separated by this vertical bar. This is by the way supported in SE 7. And then here, we addItems. If you remember, we said we created sold Item 101, Item 103-- 123 and 45. We add those to the cart. And then of course we go ahead and print some messages about the cart.

And then, of course, after that, we'll go ahead and now serialize the cart. Where in this case, we'll go ahead and concatenate these strings and assign them to cartFile, and then within the try block, we'll go ahead and create a new instance of the FileOutputStream. And pass it to the ObjectOutputStream constructor to create an ObjectOutputStream. And then use the writeObject to write that and catch an IOException if there is any IOException. And of course print the message at the end that it successfully serialized.

Continuing with the lab with a practice, now open the deserialized class. The main method in the class reads from the console for the ID of the constructing cart, in this case, customer shopping cart to deserialize. Your code will go where the comment line is in the bottom of the file. Open a FileOutputStream with the cartFile. Again string in the try with resources block. Pass the file output stream instance to an ObjectOutputStream to write the serialized object instance to the file. Read the cart object from the object output stream using the readObject method. Again, be sure to cast the result to the appropriate object type. Again you will need to catch both ClassNotFoundException and IOException, so we'll use the multi-catch expression which is part of Java SE 7. Finally, print out the results of the cart, all off its content, and the cart total cost using again the following code that you see.

Save the file. Then also let's go ahead and take a look at that. That's the deserialized. So first of all again, we specify the directory, same, and like I said, on your system maybe line 16 would be slightly different, because the path could be slightly different than what we have here on the lab environment machines. And then, we put a message, and then we wrap this System.in InputStream with a BufferedReader to read every line from the keyboard. That's done here. And of course if we enter q, that's to exit. Catch an IOException if there is any IOException. And then we attempt to open the file, and deserialize it into an object. So of course here, we specify the cartFile, we declare a ShoppingCart reference variable, and then we use here-- we first get the file input instance of the FileInputStream, bypassing the cartFile to construct a FileInputStream.

Then after that, we pass that FileInputStream reference variable to the ObjectInputStream and that will get us an ObjectInputStream. And then after that, we'll go ahead and invoke the readObject on the InputStream reference variable, and cast it into an object of type ShoppingCart and use it to save it into the-- or use it to initialize, in this case, the cart reference variable. Catch any ClassNotFoundException or IOException. And of course here, we go ahead and print message "successfully deserialized" plus some information related to the shopping cart. Plus in addition, the shopping cart total and so forth.

Continuing with this practice, now they're asking us on Step 7 to open the ShoppingCart class. You will customize the serialization and deserialization of this class by adding the two methods called during serialization/deserialization. First add a writeObject method invoked during serialization. This method should serialize the current object fields and then add a timestamp, a Date object instance to end of the object stream.

OK so, let's go ahead and in this case, and look at this write method in the ShoppingCart. So here it is, of course just following exactly what they told us here, which is the writeObject method. That we see here. And now we see it here. Where again it takes an instance of the ObjectOutputStream, throws IOException, and as you see here we invoke the default writeObject method on it, and then, of course, after that we go ahead and invoke the writeObject method bypassing a new instance of the Date.

And then after that, they want us to add a method to the ShoppingCart class that is, again, invoked during deserialization. We call this method add a readObject method with the appropriate signature. Again the method will recalculate the total cost of the shopping cart, and prints the timestamp that was added to the stream. Again, save the file. And of course, in this case-- I'll go ahead and move a little bit-- and in this case obviously we see it here, readObject takes an instance of the ObjectInputStream, throws IOException or ClassNotFoundException, and then of course we calculate the total cost if the cart was deserialized. And thus we use the if statement here. If the cartTotal is different than zero and the size of the items is greater than zero, go ahead and use an enhanced loop and iterate through the items, and of course get the cost and add it to the total cost.

And then, of course, after that to go ahead and readObject method, invoke it on the IO stream, and then cast it into an object of type Date, and save it into an instance of type Date. And then of course, after that, print, restore ShoppingCart, and then of course too, if you concatenate in this case, first use the Date format. Invoke on it the getDateInstance and on it invoke the format and pass the Date to it. That of course would format the date.

And then, of course, after that we'll go ahead and run the SerializeTest, and then do the same thing by-- and of course you would see a message that looks like this. And then you do the same thing when of course you run the DeserializeTest. Again you input them, then we see a message that looks like this. And that of course will be related to running the SerializedTest and DeserializedTest.

And that pretty much ends the practice 2 of Lesson 10. Thank you.
