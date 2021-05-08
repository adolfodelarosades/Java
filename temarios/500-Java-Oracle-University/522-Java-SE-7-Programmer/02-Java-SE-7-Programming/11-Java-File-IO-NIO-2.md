# 11: Java File I/O (NIO.2)

1. Java File I/O (NIO.2), Part 1 - 34m
2. Java File I/O (NIO.2), Part 2 - 31m
3. Java File I/O (NIO.2), Part 3 - 27m
4. Practice 11-1: Writing a File Merge Application - 16m
5. Practice 11-2: Recursive Copy - 11m
6. Practice 11-3: Using PathMatcher to Recursively Delete - 9m

## 1. Java File I/O (NIO.2), Part 1 - 34m

All right. So after finishing with the practice labs of lesson 10, let's go ahead and get into lesson 11. Lesson 11, by the way, covers the Java file I/O, which, pretty much, we're going to look at the NIO.2.

So in this lesson, we are going to look at using the Path interface to operate on files and directory paths. We're going to look at using the Files class to check, delete, copy, or move a file or a directory. We're going to make use of the Files class methods to read and write files using the channel I/O and stream I/O. We're going to look at reading and changing file and directory attributes.

We're going to look at recursively accessing a directory tree and then do whatever we wanted to do over there. We'll take a look at some of the nice methods that we actually use there. And of course, we're going to look at finding a file by using the PathMatcher.

So looking at the new file I/O API NIO.2 Well, again, the NIO API in the JSR was established again, in this case, to handle the basis for NIO in Java and typically focused on buffers, channels, and character sets. This JSR 51 delivered the first piece of scalable socket I/O into the platform, providing a non-blocking multiplexed I/O API. Of course, that allowed the development of highly scalable servers without having to resort to native codes. We did not need to use native code, which by the way, calls some of the system methods of the OS.

So pretty much in a nutshell, we have improved file system interface. We have a complete socket channel functionality. And it's also scalable for asynchronous I/O.

So the new API works more concisely across platforms, again, makes it easier to write programs that gracefully handle the failure of your file system operations, provides a more efficient access to a larger set of file attributes, and of course, allows developers now to, of course, build sophisticated applications that take advantage of platform-specific features when it's required. And of course, it allows support for non-native files to be plugged into your, in this case, platform.

Now before, again, looking into this, let's go ahead and look at the limitations of the java.io.File. And it has a bunch of limitations. Folks, let's go ahead and look at these.

Again, the Java I/O File, which is part of the java.io.File, presents a bunch of headaches or challenges for developers. For example, many methods did not throw exceptions when they failed. So of course, it was impossible to obtain a useful error message to find out what is the problem. Again, it has several operations that were missing, like file copy, move, and so forth. And of course, the rename method did not work consistently across platforms.

There was no real support for symbolic links. Again, we're going to look at symbolic links in Unix. How many of you have heard or know about symbolic links in Unix and Linux?

More support for metadata was, again, needed for file permission, file owner, and other-- a bunch of security attributes. And of course, accessing file metadata was inefficient because before, every call for metadata resulted in a system call, which obviously would make it very inefficient. And many of the file methods did not scale nicely. OK?

So it was pretty much impossible to actually write reliable code that could recursively walk a file tree and respond appropriately if there were circular symbolic links. So the overall I/O was not written to be extended. Again, developers requested the ability to develop their own file system implementation by maybe keeping a, in this case, pseudofile system in memory, or by formatting files as zip files and so forth.

So let's go ahead and look now at the NIO.2. We're looking at the file system paths and Files classes. Well, in the I/O, and rather, the NIO.2, both files and directories are represented by a path, again, which is the relative or absolute location of the file or directory. So prior to the NIO.2 implementation in JDK 7, files, again, were represented by the java.io.File class. In the NIO.2, instances of the java.nio.file.Path objects are now used to represent the relative or absolute location of your file or directory.

So the file systems, of course, are hierarchical tree structures. And a file system can have one or more foot directories. Like for example, in the Windows system, you can have a root node C and, of course, a disk root node D, and so forth.

Now let's look at how we look at these concepts of relative path versus absolute path. Well, again, typically, when we work with a path, it's either going to be relative or absolute. What does an absolute path mean? When an absolute path always contains the root element and the complete directory list required to locate the file, or somehow, the complete path that allows you, from root all the way, to locate this file. An example here, home, peter, and then the file this case, statusReport. And of course, in the absolute path, all the information needed to locate the file is contained in the path string.

On the other hand, whenever we make use of a relative path, that, again, somehow, must be-- it gives you just partial information about where the file is located. For that, you need to somehow combine it another file to be able to access that file. For example, if I put down clarence, and then /foo, what we need to combine this path, we need another path to be able to, again, access the file foo and work with it. We'll see how we do that later on.

Now let's talk a little bit about symbolic links. Well, symbolic links are very attractive. And we see them a lot in Solaris or Linux and so forth. So file systems or file system objects are most typically either directories or files. And of course, everyone is typically familiar with this object, which is a file or a directory. Sometimes, by the way, we call a directory a folder.

But some file systems also support that concept of symbolic links. Sometimes, by the way, we call it symlink or soft link. A symbolic link is nothing but a special file that serves as a reference to another file.

An example here, I have my log file. And this would be serving as a link or a soft link to this file, home file. And of course, that home file is located under dir/logs.

So a symbolic link is typically transparent to the user. And when you read or write to a symbolic link, it is pretty much the same as reading or writing to any other file or directory. It looks pretty much the same thing. And here, we show you how log file here represents a symbolic link or a soft link to the true file, which is located near one of the target files, which are now located under dir/logs, and of course, the name of the file. Everybody's following, folks?

Continuing with that, and looking at the concept of the Java NIO.2 in the JDK 7. Well, we should remember that prior to the JDK 7, the java.io.File class was the entry point for all file and directory operations. For those of you who maybe have taken a JDK 6 or Java SE 6 or Java SE 5 course, most probably you have seen, again in this case, some of the features that we covered in the I/O fundamentals chapter or lesson.

With the NIO.2, there is now a new package and classes. Again, here we have the java.nio.file.Path. This pretty much helps us locate a file or a directory by using the system-dependent dependent path. We also have this nice class called, again, in this case, Files, which is under the java.nio.file.

We use a path. And again, then, using a path, it performs operations on files and directories. So we're going to see these operations later on in the slides in this particular lesson.

We also have a file system which is part of the java.nio.file. This provides pretty much an interface to a file system and a factory that creates for us paths and other objects that access a file system. And of course, all the methods that access the file system throw IOExceptions or a subclass of IOExceptions.

Continuing with that, let's go ahead and look now at the Path interface. And in this case, we have the java.nio.file.Path interface, which provides the entry point for the NIO.2 file and directory manipulation. To obtain a Path object, all we need to do in this case is get an instance of the file system.

And this is where we do it, in this particular statement here, where we invoke the getDefault on the file system, to get us an instance of the file system. And then after that, to get the path, all we do is we invoke, in this case, the getPath method on the reference variable to be an instance of file system. And of course, passing, in this case, the path that we see in this case, which is D: and labs, resources, and the name of the file is myFile.txt. We should note here that we escape the backward slash for Windows.

And of course, we have the java.nio.File package. That also provides a static final helper class, in this case, called Paths, to perform the getDefault. For example, here, in this case, we declare a path, p1, and invoke the get method on the class Path. This is, again, a static method, as you see here. And of course, with trying to get this path.

And again, the get method can take, also, a bunch of strings and build from them a path. We also have another example here where it's /temp/foo. And by the way, we can also invoke the get method to, in this case, create a URI that specifies or represents or guides us to some particle file.

Continuing with that, let's go ahead and look now on the Path interface features, where the Path interface defines the methods used to locate a file or a directory in a file system. And these methods typically include, if you want to access the component of a path, getFileName, getParent, getRoot, again, getNameCount. Or to operate on a path, you have normalize, toUri, toAbsolutePath, subpath, resolve, relativize. We'll see, by the way, examples about these methods in the next coming slides.

Or to compare paths, you're going to have also startsWith, endsWith, equals, and so forth. So these are quite, again, useful type of methods, and we'll see them soon in the next few slides. Again, you remember one thing, folks, that Path object can be created from a single text string or a set of components, like we've seen here, we've seen earlier in the previous slide.

Continuing with that, let's go ahead and look at an example of a path, in this case. So again, and like the java.io.File class, files, now, and directories are represented by instances of Path. And you see them here.

So this is a class called PathTest. It has a main method. And inside, of course, we go ahead and invoke the get method on the Paths class and pass to it args [0]. That would, of course, in this case, represent the path that we want to show, again. And then inside, we have a bunch of format methods that allow us to print, in this case, by, for example, getting the file name by invoking, in this case, the getFileName on the path p1, and then getting the parent by invoking the getParent method, getting the name count by invoking the getNameCount, getting the root by invoking the getRoot, getting, again, in this case, finding is it absolute path by invoking the isAbsolute method on the p1, which is an instance that we, again, in this case, initialized through the args [0] that we're going to pass when we are on the class.

We have the toAbsolutePath here. And then, of course, that converts a path to an absolute path. And of course, we have the toURI.

So it turned out, folks, that these methods, and we again specify them here, again, this pretty much returns the Path object. GetParent returns the parent path or null. GetNameCount returns the number of name elements that make up, in this case, the path. And of course, getRoot returns the root in the path.

IsAbsolute returns true if, of course, in this case, the path is absolute. And toAbsoslute returns a path representing the absolute path for the path that you're trying to, again, work with. And the toURI returns, in this case, obviously, an absolute URI. And of course, if you take a look at the example of this one here trying to run this one, java, and then the name of the class, and then, of course, we pass the, args [0], which in this case represents D:/temp/foo/file1.txt.

And of course, now we invoke the getFileName. That gets me the file name. Get the parent, that gets me the parent where the file name is located. Get count, it gives me, like we said, the getNameCount is to return the number of name elements that make up this path. So in this case, it will turn out there are three, which is in this case D, temp, and foo.

And then we have the getRoot. That's D. IsAbsolute, again, in this case, is false. And of course, the absolute path is all of this. And of course, the toURI is represented this way.

Now looking at removing redundancies from a path. Now for those of you who are familiar with Unix, many of the file systems use the "." notation to denote the current directory, and the ".." to denote what? The parent directory. That's what we say, "cd, space, dot, dot," if you remember. That's to get into the parent directory.

And of course, here, we have an example. And in this example that you see here, folks, we have, in this case, a path. Again, this includes redundancy, as you hear. We have a redundancy here. And then down here, also, we have a redundancy, which is peter and then dot dot.

So the normalize method actually removes any redundant elements, like, for example, the dot or the directory forward slash the dot dot. So I know that occurrences, again, how many occurrences these all removed. So for example, in this case, if we now invoke a get method on the Paths class and pass this path that contains redundancy, if we now invoke a normalize method on the path that we created here, what's going to happen, folks? In this case, it's going to get rid of what? Of the redundancy.

It turned out that redundancy could be either a dot or what? Or the directory forward slash dot dot. So in this case, what's going to happen, it's going to get rid of what? Peter, and then what? And then forward slash dot dot. So that's why the output would be home, clarence, and foo.

All right. So again, this is typical, of course, in Unix systems. Continuing with that, and looking at creating a subpath. It turns out, folks that a portion of a path can be obtained by creating a subpath using the subpath method. OK? And of course, we have an example, if you want the syntax, where we have a subpath, that method that returns the path, and we have the beginIndex, and of course the endIndex.

We should also mention that the element returned by the endIndex is one less than the endIndex. So remember that. So for example, in this case, we create a path, p1, by invoking the get method on Paths. And it is D:temp/foo/bar. So of course, the location of temp here is zero, foo is one, and bar is two. Bar, of course, will be, in this case, like we said, the end minus one. OK?

So that's why if I want to now return a subpath that starts from one and through three, so that three over there should be the three minus one. It's always the index less one from it. So in this case, the element name closest to the root has an index, in this case, zero. And the closest one to the root is temp. The root, by the way, is D:.

And of course, the element the farthest from the root would be represented by count minus one. In this case, would be three minus one because we have three levels, so that's three minus one.

So if you want to take a look at this and you want to start getting the subpath, you're going to start from one to two. And that will, again, of course, in this case, give us what? Foo/bar. Because foo represented by one, and bar represented by two. OK? Everybody's following? All right.

Continuing with that, and now look at joining two paths. You remember, folks, how we said when you talk about a relative path, you need to combine it with another path to be able to get what? The absolute path, so that we can access you file. Remember that? Well, here's a nice method that helps us, again, to join two paths.

So if you end up working with a relative path, which is not absolute. As you know, absolute will include the root, the whole path. But if it happens that you have, in this case, a relative path, what we can do is we can use the resolve method, which is used to combine two paths.

So for example, here, we have a path here called p1 that we create using the get method invoked on the Paths. And this fact is /home/clarence/foo. And then look what we do here. On this path here, we'll go ahead and invoke resolve and pass bar to it. What's going to happen here, folks, it's going to go ahead and add the bar path to the existing path, which is what? P1. And that's why now it returns /home/clarence/foo/bar.

So passing an absolute path to the resolve method, by the way, returns always what? The path that you passed in. Because it's already what? Absolute. For example, here, you invoke the path get foo, and then you invoke the dot resolve on the already resolved path, because it starts from the home. And then, of course, it returns that path itself.

Let's go ahead and look now at creating a path between two paths. That also, sometimes, again, can be useful. So the whole idea behind this is that some of the common requirements when, again, we are writing file I/O code is having the capability of constructing a path from one location in the file system to another location, OK? Maybe to move data, maybe whatever.

So we have a very nice feature that we actually can use to accomplish this task. And that is called the relativize method. This relativize method enables us to construct a path from one location in the file system to another location in the other system.

So in this case, for example, if I look at the method, that constructs a path originating from the original path and ending at the location specified by the passed-in path. So if we take a look at these two here, I have a couple of paths. One is peter and the other one is clarence And of course, what we want to do here is we want to have the new path, which is relative to the original path.

So if, for example, these are siblings, and you want to do a p1, and you invoke the relativize on p2, what's going to happen? You're going to get what? The ../clarence, which is what? The parent class of clarence, right?

And then the same thing with the p2. It will get relativize p1. That gets you, of course, the parent class of peter. So that's how you can actually navigate. If you want to navigate from a file to another one, you can go ahead and go up so that we can come down.

Let's go ahead and look at working with links. Well, how many of you have worked with links, soft links and all that? So it turns out that, again, all production systems that make use of Unix or Linux obviously will need this concept of links.

Well, the Path interface, by the way, is link-aware. It's aware of links. And every Path method, again, either detects what to do when a symbolic link is encountered, like either write or whatever you want to do, or provides an option enabling you to configure the behavior when a symbolic link is encountered.

And in general, by the way, folks, looking at this, we have an example where if you want to create a symbolic link, this createSymbolicLink method. We have createLink. This creates a hard link. OK? And then we have a isSymbolicLink that, of course, is detecting if it's a symbolic link. And we have readSymbolicLink. And that, of course, is finding the target of the link.

One thing that we want to tell you, folks, is using, what's the difference between these hard links and symbolic links. If you take a look in general, for those who work with Unix systems, you have tendency to always use soft links. OK? Well, hard links are a little bit more restrictive compared to, of course, the symbolic links.

And the reason why is because the target of the link must exist in the, of course, hard link. And hard links are generally not allowed on directories, so only on files. And of course, hard links are not allowed to cross partitions or volumes.

See, the advantage that you have with a soft link, you can cross a partition or a volume. You just say, I'm going to go ahead and create a soft link. And by the way, a soft link could be to a file or to what? To a directory, too.

So of course, in this case, there are, again, hard links looks and behaves like a regular file. But of course, so they can be, again, in this case, hard to find. And that's also another problem. So due to, again, some of the bad sides of the hard link, due to all these restrictions, that's why folks have a tendency to avoid using hard links and use always symbolic links or soft links.

And of course here, we have an interesting quiz. And it says, given a Path object with the following path, which is /export/home/heiner/..williams/./documents. And the question that we have here, folks, is what path method would remove the redundant elements, again, in this case, either the directory forward slash dot dot, or the dot. That would be what? Normalize, good. So that's why this would be the answer.

Continuing with that-- and let's talk-- here's a very interesting, again, a quiz, too. And we say here, given the following path, which is, in this case, the path-- first of all, we use the get method to create that path, /home/export/tom/documents/coursefiles/JDK7. And the statement, in this case, is we want to create a subpath by calling the subpath method and passing x and y. So the question that we have for you, folks, is that what value of the x and y will produce a path that contains these here, which is documents/coursefiles here?

So what do you think, folks, in this case? It would be B, thank you. OK, what value, so it would be, in this case, B, which is x, in this case, is 3, and y is 5.

Continuing with that, oh, here's another nice, interesting quiz. And it says, given this code fragment, which we have, again, we create path, p1, with a get method invoked on the Paths where we pass this path here, D:/temp/foo/. And then we have this one here, which is ../bar/documents. And then look what we do here. We create a path from the first one, where in this case, what do we do? We invoke p1.resolve, and we pass p2, and then we invoke normalize.

And the question that we have here, folks, is what would be, in this case-- again, of course, we want to print p3. And what is the result in this case? What do you think in this particular case? What is, again, the answer here? I'm sorry? D. Right? OK, good. Good job.

All right. Continuing with that, and now let's go ahead and look at the file operations. Well, some of the file operations that exist, folks, is maybe changing a file or a directory, deleting a file or a directory, copying a file or a directory, moving a file or a directory, managing metadata-- we're going to take a look at metadata-- and of course, reading, writing, or creating files. We can also do random access files, and we create and read directories.

Well, it turns out that we have a very nice class part of the JDK 7, or Java SE 7, java.nio.file.Files. That's the Files class, which is the primary entry point for the operations on Path objects. Of course, static methods in this class allow you to read, write, manipulate files and directories represented by the Path object. And of course, this Files class is also link-aware. So methods, again, can detect symbolic links in the Path objects and automatically manage links and provide, of course, in this case, options for dealing with links.

Let's go ahead and investigate all of these throughout the next few slides. Let's start by checking a file. It turns out, folks, that a Path object represents the concept of a file or a directory location. We already know about that, and that's part of the SE 7. And before, again, you can access a file or a directory, in this case, you should first access the file system to determine whether it exists using, again, the Files methods.

So we have a couple of methods here. One is exists, and it takes a path, a link option, of course, and, of course, this tests to see whether the file exist. By default, by the way, symbolic links are also allowed.

We also have a very interesting method also called notExists. And it takes a path and some option and, in this case, tests to see whether a file does not exist. And of course, by default, symbolic links are followed.

Here's an example, by the way, where we create a path by passing args [0]. And then here, we'll go ahead and call and use the format method to print, in this case, Path, and then, of course, exists. And in this case, look what we're doing. We're invoking the exists method, passing the path, and, of course, in this case, the link option which says, in this case, NOFOLLOW_LINKS, which, that's with, obviously, an option argument.

So remember, again, in this case, when testing for an existing file, the whole idea is we have three different types of possible outcomes. Either the file is verified to exist, or the file is verified not to exist, or the file's status is unknown. Again, the result can occur when the program does not have access to the file.

One thing which is quite important, folks, and I want to mention this, and that's a note that we put down here. That's very important. Remember that note, Files.exists is not equivalent to Files.notExists. Careful with that. So they are actually two different things. They are not equivalent.

See, if both exists and notExists return false, the existence of the file or directory cannot be determined. And why, actually, do we have those different? Well, the example that we showed you here, think about the Windows system.

For example, in the Windows system, it is possible to achieve this by requesting the status of an offline drive, like a CD-ROM, for example. It's there, but it's offline. So that's why they are not equivalent in this case. Be careful with that.

## 2. Java File I/O (NIO.2), Part 2 - 31m

Let's go ahead and look at checking a file or a directory. So to verify that a file can be accessed, the file's class provides the following Boolean methods: IsReadable or IsWritable, and of course, IsExecutable. We should note that these test are not atomic with respect to other files or other file system operations. So that's why we need to be careful. Again, in this case, the results of these tests may not be reliable once the methods complete.

We also have another method called isSameFile, and you pass a couple paths here. What this method does, it actually tests to see whether the two paths that we passed over there point to the same file. Again, this is particularly useful in the file systems that support symbolic links.

So one thing that, again, we want to also advise you here is you should somehow be careful when using these methods. Because of course, when we say, is it readable, and this is on your application. When you're building your application with Java, and, of course, you write if it's readable or is writable, and you find that it's true. But then, remember that these files, also, that you create using your Java API, their metadata can be altered by file systems.

So you can, for example, make a decision, and you decide and you check that it's writable. Somebody else will go ahead and change that through the file system. You can actually do that.

So that's why we say care should be taken when using these methods, again, in the security-sensitive applications. Particularly if you do not want the file to be writable, suddenly somebody changes that. Careful with that.

Let's go ahead and look now at creating files and directories. So files and directories can be created using these methods, which are part of the Files class. That's the createFile, and of course, the createDirectory. CreateDirectories method can be used to create directories that do not exist, again, from top to bottom. So you use the create directories method, and then, of course, you know that these directories do not exist. So it will create all of these, Temp, foo, bar, and so forth.

Looking now at deleting a file or a directory, it turns out that we also have in the files class some methods that help us delete a file or a directory. So here, we have delete path or delete if it exists. This actually is very, very useful, the deleteIfExists.

Now we need to mention to you folks that whenever you use the delete(Path), this actually can throw a NoSuchFileException or a DirectoryNotEmptyException or an IOException. On the other hand, the deleteIfExists method actually throws no exceptions. So the deleteIfExists method pretty much deletes that file. But if the file does not exist, no exception is thrown.

So the question is, why do we want that? Well, usually, failing silently is kind of useful when you have multiple threads deleting files, and you do not want to throw an exception just because one thread did so first. So that's why we pretty much allow that to somehow, in this case, fail silently.

Continuing with that, and now looking at copying a file or a directory. You can actually copy a file or a directory by using the copy path, and then you pass the path, path one and path two, and then, of course, the copy option method. When directories are copied, by the way, the files inside the directory are not copied, OK?

So this copy option, by the way, could be REPLACE_EXISTING or COPY_ATTRIBUTES or NOFOLLOW_LINKS and so forth. There are a few options, and you can actually discover these in the API. And here's an example where in this case, we a copy a source, again, to target, with, of course, these options here, we REPLACE_EXISTING and NOFOLLOW_LINKS.

Now looking at copying between a stream and a path, so in this case, between a stream and a file, for example. You may also want to be able to copy or write from a stream to a file or from a file to a stream. Again, the Files class provides a couple of nice methods to make this task easy.

And these couple of methods are copy with the input stream source and, of course, the target, which is the file, and your copy options. Or you have the other one, which is the source to the output stream. Again, an interesting use of the first method is copying from a web page and saving it to a file.

So here's an example where in this case, we get a path. This path is D:/Temp and oracle.html file. And what we do here, we create a URI by passing, again, this http://www.oracle.com/. And then within the try block, what we do is we create an input stream by doing what? By invoking the toURL on the URI u, and then invoking the openStream to open that, to open an input stream. Once we get that, we can go ahead now and use a copy file that is called on the Files class and, of course, pass to it the input stream, the path which represents the file, and, of course, the standard copy option here, which is REPLACE_EXISTING.

And of course, we can catch more than one exception. In fact, folks, look how we now can use the multi-catch that we discussed yesterday. And we're now in Java SE 7, you can pass what? More than one exception separated by the bar or the pipe sign.

Let's go ahead and look at moving a file or a directory. So you can actually move a file or a directory by using the move method. OK? So we have a move, takes a couple of paths, and of course, copy option. Moving a directory, you, of course, will not move the contents of the directory. Remember that, OK? And here's an example where, by the way, the copy option could be, in this case, REPLACE_EXISTING or ATOMIC_MOVE and so forth. And of course, here's an example where we move a source to a target with REPLACE_EXISTING.

One thing that we want to mention here, there is a bunch of guidelines for the moves. Let's go ahead and look at these guidelines, folks, because they're quite interesting. And we should be able to, again, follow these guidelines.

So if the target path is a directory, and that directory is empty, then the move succeeds if REPLACE_EXISTING is set. If the target directory does not exist, the move, of course, succeeds, and essentially, it is the renaming of the directory. If the target directory exists, and it's not empty, then what happens folks, is a DirectoryNotEmptyException exception is thrown. If the source is a file and the target is a directory that exists, and a REPLACE_EXISTING set, then of course, the move will rename the file to the intended directory name.

Now we should remember that to move a directory containing files to another directory, essentially what we need to do is we need to recursively copy the contents of the directory, and then delete the old directory. So again, we can now perform the move as an atomic file operation using the ATOMIC_MOVE option. So if the file does not support an atomic move, an exception is thrown. Of course, with an atomic move, you can move a file into a directory and, of course, be guaranteed that any process watching the directory accesses, of course, a complete file.

Continuing with that, and now, let's take a look at listing a directory's contents. Of course, we have a way to list what's inside that directory. And of course, the Files class provides this nice method that returns a directory stream, which, by the way, can be used to iterate over all the files in the directory from the path root directory. And of course, we should remember that a DirectoryIteratorException is thrown if there is an I/O error while iterating over the entries in the specified directory. And of course, a PatternSyntaxException is thrown when the pattern provided in this case, which is the second argument, is invalid.

Let's go ahead and look at this example, just to find out. In fact, when we look at this example, just by reading it, I'm going to ask you the question, what is it that we're looking, what is it that we're listing here?

So first of all, we create a path, OK, directory here, which represents the directory called Temp under the D drive. Of course, the directory stream is a stream, so we can use the try with resources that we introduced in Java SE 7 to actually handle the closing when we're finished. So we don't have to actually have a finally in the close.

And down here, look what we do, folks. We'll go ahead, and within the try block, we'll create a directory stream by invoking the newDirectoryStream on the Files class, OK, and of course pass what? The directory that we have here. And then what are we passing here? The pattern.

So just by looking at that, it looks like we're doing what? We're looking for what? We're looking for files that have extension .zip, right?

And then after we get that stream, we'll go ahead and use the enhanced for loop and iterate through that stream and, of course, print. Every time we get that file, we'll go ahead and invoke getFileName to get the file of the name, and of course, catch a PathSyntaxException or a DirectoryIteratorException or an IOException if they exist. Everybody's following, folks? Good, good, good, good, good.

Now let's go ahead and look at reading and writing all bytes or lines from a file. So what we're trying to do here, folks, is we're trying to somehow read the file at once and write the file, of course, at once. OK? So we have a couple of methods which are very useful in this case. These are the readAllBytes or readAllLines methods that, again, reads the entire contents of a file. OK? And then, of course, we have it here.

So here's an example where, in this case, we have a path source. We have a string, a list of strings, in this case, called lines. And then, of course, here, we'll go ahead and get the character set, which is the default character set. And then after that, we'll call the readAllLines by passing the file and, of course, the character set that we're using. And of course, we read all that finds and save it into this array list called lines.

And of course, we can use write method to write bytes or lines to a file. And in this case, we're using the target here. And then we have the write method invoked on the Files class. We pass the target and, of course, the lines that are going to be written, in this case, to the file, and, of course, the character set that we specify, and, of course, in this case, the options, which is either CREATE, TRUNCATE_EXISTING, and of course, in this case, WRITE.

Now one thing that we need to remind you in this case, and this is important folks, is that these methods can actually take care of most of the work, like maybe opening and closing the streams, because of course, they bring the entire file into the memory. And these are really intended for what? They're really intended, again, for handling small files, not large files. So you've got be careful with that. If they are small, then you can go ahead and handle that. But they're not intended for large files.

Ah. Let's go ahead now and look at channels and byte buffers. Where the stream I/O reads a character at a time, and, of course, while on the other hand, the channel I/O reads a buffer at a time. So the ByteChannel interface provides that basic read and write functionality. And what we want to do here, we want to, again, make use of that SeekableByteChannel, which is, by the way, a byte channel that has the capacity to maintain a position in the channel and, of course, to change that position.

We have a couple of methods for reading and writing channel I/O. And these are, again in this case, as you see here, the newByteChannel. And that takes, of course, a path and the option. And then the new byte channel that, in this case, takes the path and, of course, any set of options that extend the open option, and of course the file attribute. The capability to move to different points in the file and read from or write to that particular location helps us achieve what we call random access of a file. That's the idea behind, again, using this. It's pretty much allowing us to read or write, in this case, by making use of that concept of random accessing a file.

All right. Continuing with that, and looking now at, let's dig in to the random access file. It turns out, folks, that random access files permit non-sequential or random access to a file's contents. Again, to access a file randomly, we need to open the file, seek a particular location, and of course read from write or that file. And of course, random access functionality is enabled by the SeekableByteChannel interface. We have this SeekableByteChannel interface.

And the API consists of, again, a few easy-to-use methods. And they are position, that returns the channel's current position. We have the position that takes a long integer, and that sets the channel's position.

And we have the read and passed with the ByteBuffer that reads bytes into the buffer from the channel. And we have write that we passed with ByteBuffer that writes bytes from the buffer to the channel. And we have truncate. And what it does, this one takes along, it truncates the file or any other entry connected to the channel.

Looking now at buffered I/O methods for text files. Well, the new buffered reader method opens a file for reading. OK? So here's an example where, in this case, we invoke newBufferedReader method that is invoked on the class files and passed with the file and, of course, the character set that you want to use. This pretty much returns what? A buffered reader that is, in this case, represented by the reader reference variable here. And then after you get that, after you get your buffer reader, you're good to go to read your lines.

We also have the newBufferedWriter method. And what it does, it actually writes to a file using the buffered writer. And if you take a look here, you will see the example where, first of all, we invoke the newBufferedWriter method on the Files class and pass with the file and the character set. That will, of course, return to us a buffered writer. After that, we make use of that to, of course, in this case, write to a file.

Let's look now at byte streams and how they are handled. The NIO 2, folks, also supports methods to open byte streams. And here's an example where first, we'll go ahead and create a new input stream by passing the file name over there. And this, of course, invoked on the Files class. That returns an input stream. Then after that, we'll go ahead and take that input stream and pass it to the InputStreamReader constructor.

That will get us an inputs reader. And then, of course, we pass that to a buffered reader. And that, of course, will get us a buffered reader. After that, we'll go ahead and use that buffered reader to read line.

And to create a file, append, again, to a file, or write to a file, use the newOutputStream method. That's typically what we do. And here's an example where let's assume we have a path, a logfile, and we have a string, and of course, we have an array of bytes represented by, in this case, invoking the getBytes method on the string. And if you take a look here, you will see how pretty much, first, we go ahead and create a new output stream by passing again, our options here, create and append. And that, of course, is invoked on the Files class.

Then after that, we'll go ahead and pass that to the constructor buffered output stream. And that will us an output stream. Once we have that output stream, we'll go ahead and invoke the write method. And of course, in this case, write the data into the file.

So far so good, folks? Everybody's following? OK.

Continuing with that, let's go ahead and look at the concept of metadata or managing metadata. It turns out that again, we have a bunch of methods that are useful to get some metadata related to directories or files. And let's go ahead and look at them.

Size, actually, what it does, it returns the size of the specified file in bytes. IsDirectory returns true if the specified path locates a path that is a directory. IsRegularFile returns true if the specified path locates a file that is a regular file. And isSymbolicLink returns true if the specified path locates a file that is a symbolic link.

IsHidden, this is known in Windows, returns true if the specified path locates a file that is considered hidden by the file system. And of course, we have the getLastModiedTime and the setLastModified time. This returns or sets the specified file's last modified time.

We have the getAttribute and setAttribute, and that returns or sets a value of a file attribute. And like I mentioned, you have your readAttributes. And of course, in this case, that could take a path string and, of course, the link option. Or it could be a path and some class and the link option.

Let's go ahead now and look at the file attributes for DOS. Well, the file attributes can be read from a file or a directory in a single call. OK? And you can actually make use of that by invoking the readAttributes on the Files class and pass to it the path, and of course, the class representing, in this case, the DOS file attributes.

DOS file system, by the way, can modify attributes after the file creation. And here's an example where we create a file, and then after that, we'll go ahead and set a bunch of attributes. In this case, we decided it's going to be the dos:hidden and the true.

We just want to mention a few things about DOS. The setAttribute method, again, or the setAttribute types for DOS, extends the BasicFileAttributeView, of course, and view the standard four bits of the file system that supports the DOS attributes, which are typically hidden, read-only, system, and archive. Again, other attributes view includes the BasicFileAttributesView. That provides a set of basic attributes supported by all the file system implementation. Or the PosixFileAttributeView that extends the basic file attribute with attribues that support the POSIX family, which is, by the way, the standards for Unix.

You have the FileOwnerAttributeView that is supported by any file system implementation that supports the concept of file ownder. We have the AclFileAttributeView, and that supports reading or updating the file access list, ACL. Of course, the NFSv4 ACL is also supported. And of course, the UserDefinedFileAttributeView, that enables support for user-defined metadata, if someone wants to, again, define these metadata.

Let's look at this example. And in this example, we have a bunch of-- again, we declare a reference to the DOS file attributes. We got a file, OK, represented here by the path. And then, within the try method, we'll go ahead and invoke the readAttributes the Files class and passed with the file and the DosFileAttributes.class, and, of course, catch an IOException if there is an IOException.

Here, what we do is we invoke the create time to, again, get the time when it was created, the creationTime. And we invoke the lastModifiedTime time to get the last modified time. And then we'll go ahead and create the lastAccessTime, again, when is the last access.

And of course, here we say, if, again, attributes, which is in this case represented by the DosFileAttributes, is a directory, then, of course, in this case, go ahead and get the size. And here, we have some DosFileAttributes that adds, again, these to the BasicFileAttributes. So for example, here, we can go ahead and invoke isArchive or isHidden or isReadOnly or isSystem that we've seen earlier.

This is, by the way, about DOS. How about POSIX? Because after all, Unix also does that.

So with NIO.2, we can actually create files and directories on the POSIX file system with their initial permissions set. And here, we show you an example. Take a look, folks, about here, we declare a set of permissions called perms, in this case, for the POSIX file permission. Again, we're using generics here. Before that, we get the path, by the way. OK?

And then here, how do we do that? By invoking the from string on the PosixFilePermissions class and pass to it. So everybody can now remember this, right, in Unix. So we have read, write, execute. And it's typically for the group and the owner and the [INAUDIBLE].

And then down here, we have a method, asFileAttribute, and we pass it with permissions, OK? And then down here within the try method, we'll go ahead and create a file, and we pass, again, the path, in this case, and the attributes that we decided to, of course, use. We created that file, which is p, with optional that we decided to use. And of course, catch FileAlreadyExists exceptions or maybe an IOException, and so forth.

Now one thing that we want you to remember, folks, and we want to, again, just mention this quickly, you can determine whether or not the file system supports POSIX because not every file system supports POSIX. And you can do that programmatically by looking for what file attribute views are supported. And here's an example on how to do that.

Again, we declare a Boolean unixFS and set it to false. And then down here, we invoke the getDefault method on the file system. And on it, we invoke the supportedFileAttributeView.

And then of course, that will get us a set of, in this case, views. And then we iterate through the views, and then we check. If s is, or in this case, the string from the view, is a POSIX, then of course set, now, the UnixFS to true, which means now it is Unix. Everybody choose that? OK.

So again, looking at all of what we have been looking here, folks, is, some of you might say, well, I could do these Unix using the OS system. The idea here is being able to use Java API so I can do all of this at your application level. Everybody's following, folks? OK, good.

Of course, we have a quiz here. And this quiz says, again, in this case, given the following fragment of code, where we have in this case path p1, which represents /export/home/peter. OK? And then we have, in this case, the path p2, which is represented by /export/home/peter2. This is peter, and this is peter2. OK?

And then, of course, what we want to do is we want to go ahead, in this case, and invoke the move. Look what we're doing. Look carefully here. We're moving path p1, which is this path here, and we're passing p2, which is this path here, and, of course, the standard option, which is replace existing.

So the question here is, if peter2 directory does not exist, and the peter directory is populated with sub-folders and files, again, in this case, what would be the result? So go ahead and take a look at that. And tell me, please, which one would be, in this case, the result?

So in this case, it would be? Directory peter2 is created and populated with files and directories from peter. Why? Because remember, we said this does not exist. So this would be the answer. OK?

Here's another nice quiz. And it says here, given the fragment, which is source, represented by the get method that we invoke on Paths and pass with arg0, and target, represented by arg1. And here, look what we're doing. We're invoking in the copy source, target.

Again, assuming that the source and the target are not directories, how can you prevent this copy operation from generating a FileAlreadyExistsException? So what do you think about this? So what would be the-- so it would be add the REPLACE_EXISTING option of the method.

And how about this one here? Again, in this case, we have given the fragment of code, where in this case, again, what we're doing here is we're pretty much trying to assume that. So we have the first one, where we have a source, and the source is /expert/home/mcginn/HelloWorld.java. And then we have the second one, which is a new directory, which is /export/home/heimer.

And then look what we do here. We copy the source and pass the source. We invoke the copy method, pass the source, and then the new directory, and then invoke the get resolve, and pass to it the source.getFileName.

So assuming that there are no exceptions in this case, and assuming that there are no exceptions, what is the result here? Would it be a or b or c or d? C, thank you. OK? It would be this one here.

And of course, we have a practice writing a file merge application. We'll go ahead and look at that in detail in the activity guide once we finish with the lecture.

## 3. Java File I/O (NIO.2), Part 3 - 27m

Let's look at recursive operations. These are also very, very useful. So the files class provides a method to walk the file tree for recursive operations such as copies and deletes. And this method is called the walk file tree. That takes a path start. And of course, it takes a file visitor of some type, t.

So an example here, we have a class called PrintTree, implements the file visitor interface phase that you see. Again, that we passed here, in these case, of type path. And then here, look what we do. We go ahead and invoke p the preVisit directory, and then pass to it the path and the basic file attributes in this case. And then, we have the post-visit directory, then pass the path and the basic file attributes. We have the visit file that takes the path and the file attributes. And we have the visitFileFailed. And pass the path and the basic file attributes.

And of course, in this case, look what what we do in the second class. We have a walk file, a tree example, where in this case we have a method called printFileTree. That takes a path. And look what we do here. We invoke the walk file tree, pass again the p, which is the path, and then, of course, a new instance of the PrintTree that is going to go ahead and print this. Again, the file tree is recursively explored, and methods defined by the PrintTree are, in this case, invoked as directories. And files are resolved in the tree. Of course, every method is passed to the current path as the first argument, in this case, of the method.

Let go ahead and look at, first of all, what these methods mean. So the fileVisitor interface includes methods that are evoked as every node in the file tree is visited. We have the preVisitDirectory. This is evoked on a directory before the entities in the directory are visited, Instead the entire entities inside the directory are visited.

We have visitFile. That again, is evoked for a file in the directory. We have postVisitDirectory, that is again, evoked after all the entries in the directory and their descendants have been visited. And we have the visitFileFail that is evoked for a file that could not be visited. So the return result in this case from every called method is determined, action's taken after a node is reached pre or post.

Again, these are enumerated in the fileVisit result class. And you can have it either continue, that continues to the next node, skip sibling, that continues without visiting the siblings of the file of the directory. Skip the sub-tree continues without visit the entries of this directory. And terminate, of course, terminates that.

Now, we should note that there is a class called, in this case, simpleFileVisitor that implements every method in the fileVisitor and returns, of course, a type all of fileVIsit continue and, of course, already throws any I/O exception. If you plan on using only some of the methods in the fileVisitor interface, then of course this class is easier to understand and override just the methods that you need.

One thing that I want to mention to you folks about this is that the whole idea is being able to use this Java API and pretty much do whatever you typically do when you're using some of the file system commands. So you can actually, in this case, visit a directory structure. And course you, can go ahead and make a decision. Once you have that directory, you can go ahead and make a decision to maybe delete it, or rename it, or maybe get into the directory and find out what other files over there.

Or maybe once you find the file, you maybe want to change some of the metadata of the file, make it read only, make it write only, modify its name, and so forth. So this is a facility that allow you to pretty much do all these type of manipulations within the tree, or the directory and file tree, and do whatever you need to do, OK? That's the whole idea. Let's go ahead and look at the fileVisitor method order.

So we have the preVisitor. In this case, the preVisitor is right at the beginning. So starting at the first directory node and at every subdirectory encountered, the preVisitor directory method again is invoked on the class passed to the walkFileTree method. Again, assuming that the return type from that invocation of the preVisitor directory returns a fileVisit result continue, of course, the next node is explored if you want to go to the next level.

We should also note that the file tree traverser is depth first with the given fileVisitor invoked for every file encounter. Then, of course, file tree transverser completes when all of the accessible files in the tree have been visited. Then, of course, the allVisit method returns a result that says, in this case, terminate, which means we stop. Where a visit method terminates due to a particular I/O exception or an encode error, or a runtime exception, typically the traversal is terminated and the error, or exception, is propagated to the caller of that math. For example, if you're trying to find a file and it's not there.

And let's see how, again, we see how this all works. So you see as in the fileVisitor method order, so you have the preVisit-- this will be a preVisit before this directory. Again, what's represented in yellow is pretty much-- oval circles-- it's pretty much the directory. And then, what's in blue is the file. So you see here, once again, this is visiting a file. Again, this is preVisit. You can also have a preVisit here at the directory. You could also have a preVisit at this dir here. And then, you can have a visit file. And here, for example, you can have a visitFileFailed, where you could not visit. It's unknown. You could not find it. Everybody's following, folks?

Continuing with the fileVisitor method, here's again an example where after you visit everything, now you go up. So this would be a postVisit directory at this level, which means now you know what files are there. And you could decide to make it do whatever you want to do. Or you can have a postVisit. And again, you have a postVisitDirectory here. You also have a postVisitDirectory here, and a postVisitDirectory down here. So it goes, again, up and up.

And here's an example of a walkFileTree example. So as you see here, we have a path that we created here, D:test. And then, within the Try method, we go ahead and invoke the walk on the class files, passed to with the path, and the new instance of the PrintTree class. We'll see that in the next slide. Or rather, we can see that is also in the code. And of course, catch an exception if there is an exception. In fact, we've seen this new PrintTree in the previous slides, right? Here it is. OK, so we've already seen that.

All right, so in this example, folks, the PrintTree class implements every method in the fileVisitor, and of course prints out the type, name, and size of the directory and file at every node. Again, using the diagram that we see here on the slide, and again, the result output would be shown here pretty much where we visited-- if you take a look here. Let me just scroll up so that you can see the whole thing. So you see that the first one, again, the preVisit, it hits this one. So it's known. And then here, we have the preVisit also, which hits D:test, and then bar, which is this one here.

And then, we have the postVisitDirectory, and that hits the D:test bar, which is this one here. We finish with this one. And then, the next one will be visitFile, and then we visit the final one here. And that, you see. And then, after that, we have the preVisit. That's for the foo. And that's what you here, that. And then, of course, we have the preVisit for the a directory that you see here. So now, you see that. And then, we have the visit file. And that would be the file, too, that we see here under a.

And then, we go up. And we have the postVisit, and that would be for, again in this case, test foo, a-- this one here. And then, after that, we'll go ahead and have the post for the foo. And then, after that, we'll go ahead and have the postVisitDirectory-- rather, before that, we did the visit file3 here. And then, of course, the end will be the postVisit of D: backslash test. Everybody sees that?

And by the way, this example is also-- you can find it on NetBeans on walk example. So if you go to NetBeans-- and let me just close this guy here and open the project. And then, you can actually go up. And you could find it and the examples. And of course, we said that it is the walk example. And we scroll a little bit down here. And here it is. So this pretty much shows you exactly what we have done. See, here's the test. And then, of course, here's the PrintTree that we looked at. OK, so you guys can actually look at this and just see how all of this works later on. Again, once you start doing some of the practice labs, you can go ahead and take a look at that, too. You get time to look at that.

All right, continuing with that, let's go ahead and look now at finding files. To find a file, folks, typically you would use the search. You would search a directory. You could, by the way, use a search tool, or a command, in this case, like for example here, dir, and then forward slash s. And then, of course, *.java. We see, in this case, you're looking for all the files that have the extension .java.

This command will recursively search the directory tree starting from where you are for all files that, of course, contain the .java extension. The java.nio.file path matcher interface includes, actually, a match method to determine whether a path object matches a specified search string. In this case, we have every file system implementation provides a path matcher that can be retrieved by using the FileSystem factory. And here it is. So if you invoke the getdefault on the file system and invoke the getpathmatcher, you get an instance of the path matcher, OK? And by the way, here when we invoke the getpathmatcher, we pass again the string which in the syntax and pattern.

Let's look at the path matcher syntax and the pattern. Again, this syntax and the pattern string is of the form syntax:pattern, and where, again, the syntax could be a glob or regular expression. And of course, the glob syntax is similar to regular expression, but it's simple. Again, we see here some of the pattern example. start.java, that would be representing all the files that end with .java. *.*, that matches the files that do contain a dot. *.java and comma class, that [UNINTELLIGIBLE], we're talking about all the files that have .java and .class as an extension.

We have the foo and .?, that pretty much matches the names starting with a full dot and then a single character extension. And then, we have C: back slash, back slash, dot asterisk dot match us the C:foo and C:bar on the Windows platform, again, in this case. And again, not that the backslash is escaped. Again, as a string literal in the Java language, the pattern would be this if you have a string literal.

Here are a bunch of rules that you can use to interpret your globe pattern. So we know that the asterisk means zero or more characters. Star, star means the character matches zero or more characters crossing directory boundaries. We have the question mark that matches exactly one character, often name component. We have the backslash character. This is, again, used to escape character, but would be otherwise interpreted as special character. So when you have the expression backslash, backslash, that matches the single backslash.

And of course, the backslash in these cases matches a left brace, in this case, for example. The open square brackets and close square brackets characters are, in this case, bracket expression that matches a single character or a name component out of a set of character. For example, if you have "abc," back matches a, b, or c. Or you have a hyphen, for example. a-z, that matches, again, all the character a-z. And if you have "a, b, c," and then "-g," that matches a, b, c. And of course, what's between e and g. And that's, of course, f and g.

And of course, if the character after is, in this case, an exclamation mark, then of course this is, again, used for negation. So for example, when you say not a through c, that means it matches all character except a, b, or c. We also have these, again within a bracketed expression, the asterisk, comma, and backslash character by themselves.

The braces characters are a group of sub-patterns, where the group matches if any sub-patterns in the group match, of course. And of course, the comma here character is used to separate the sub-patterns. And of course, groups cannot be nested. We have the leading period dot character in the file name, again treated as regular characters in match operations. For example, the asterisk glob pattern matches all the, again, name, for example, .login. And of course, files.isHidden-- that takes a path-- method may be used to test whether the file is considered hidden. All other characters match themselves in an implementation dependent manner.

Again, this includes characters representing any name separator. Of course, the matching of root components is highly implementation dependent and is not specified. Again, when the syntax is regular expression, the pattern component is regular expression, as defined by the pattern class. By the way, we've seen this earlier in one of the previous lessons. For both the globe and regular expression syntaxes, the matching details such as whether the matching is case sensitive is implementation dependent, and therefore not specified here.

Now, let's look at an example of the path matcher. Again, in this case, we have a code fragment in this slide that pretty much, again in this case, we can look at the complete example later on. In this case, in the directory, you can actually find it through NetBeans. But here's the main method. And then, here we go ahead and get a path, which is root.

So first, again, we check that the first argument is a directory. So we took care. And then here, we create a matcher by doing what? By invoking the getPathMatcher passed to it the globe and whatever argument you pass. And then, that's, of course, invoked on the getDefault, which is invoked on the file system. And then, of course, after that, we have the finder, which is a class that implements the fileVisitor.

So how do we do that? We go ahead and create a new instance of the finder by passing the root and the matcher that we just created here. And then, of course, we need the Try method. We go ahead and now invoke the walkFileTree, pass the root and the finder. And that, of course, will take care of business. And we catch an exception if there's an exception. And at the end, we go ahead and invoke the done, that we are done.

So if you take a look here, of course, the first argument is tested to see whether it is a directory. And of course, the second argument is used to create a path matcher instance with a regular expression using the file system that we've seen here. Of course, the finder class, that implements that fileVisitor interface again in this case so that it can be passed to a walkFileTree. And then, we've seen how it can be done here. This class, by the way, is used to call the match method on each of the files visited in the tree.

Here's the finder class, out of curiosity. Again, here we showed you only a little bit of code in it. But you can see the whole example on NetBeans. And there'll be an example folder. So you have a class, finder, that extends a simple a fileVisitor of type path. We go ahead and declare a path here. And we'll go ahead and declare a matcher. And of course, in this case, we go ahead and declare a number of matches, which is an integer. And then, of course, the constructor stores path and the matcher object. You can see the complete code later on, on NetBeans.

And then, we have the find method. That takes a path. And as you see, we get the file name. And then, after that, we go ahead and say if name is different than null, and of course pass the name to the matches in the method that was invoked on the matcher. And of course, in this case, if that's true, we'll go ahead and increment the number of matches. And at the end, we go ahead and print that. And by the way, you can go ahead and override the visitFile method that returns a fileVisit result. And of course, that takes a file, in this case, and of course the basic file attributes that you're representing. And of course, in this case, we go ahead and pass this to the find method and return continue.

Some other useful nio classes, folks, is the fileStore class which is, by the way, useful for providing usage information about a file system, again, such as the total usable allowed disk space. And of course, we have also an instance of the WatchService interface can be used to report changes to the registered path objects. Again, this WatchService can be used to identify when files were added, deleted, modified, and so forth.

And by the way, this example, a couple of them, they're under the NetBeans. And this one is called the disk usage example. And the other one is the WatchDirectory example. Let's go ahead and just take a look at one of them just out of curiosity. I close this one here, and open a project, and then go down and see, for example, the disk usage. Which, again, in this case, has this class here that you can investigate later on, pretty much similar to what we have seen. If you run it, then pretty much you will see the size, you see?

This is the system that I'm using right now, and pretty much specifying all the disk usage on this. Everybody's following, folks? So it's a good idea to investigate this. You will also get a chance to look at the other one, too, which is the WatchDirectory example. And it may be a good idea to go ahead and investigate this one, too, later on, which is also a very, very interesting class.

All right, continuing with that, let's go ahead and look at moving to NIO.2. A method was added, by the way, to the java.io.file class for JDK 7 to provide forward compatibility with the NIO.2. And again, this is the two path. And this is very useful. It enables you to take advantage of the NIO.2 without having to rewrite a code. Let's assume that you used the NIO.2, the previous one. And then, you want to make use of the new features of this, the one that is provided in the JDK 7.

And then, this is a very nice facility which allows you to pretty much have some very interesting forward compatibility that allows you to run your existing application that you built using the JDK 6 to run on the JDK 7 quite easily. You could also, by the way, replace, in this case, your existing code to improve further maintenance. For example, replace the lead and so forth. So in this case, you can go ahead and use it as an example here where you use the file.toPath, and then you go ahead and use the delete.toPath to, again, delete that path.

Conversely, the path interface provides a method construct, in this case a method, to construct a java.io.file object. And here it is again. In this case, it's called the toFile. So again, the whole idea behind this is one of the benefits of the NIO.2 package is that it enables you to work with the legacy code and take advantage of the new API, the existing legacy code that, by the way, you do not have to rewrite. Everybody's following?

And that's pretty much what we wanted to discuss here. We wanted to take a look at-- in this case, we want to take a look at, in general, the file I/O NIO.2, and we succeeded to look at the path interface to operate on files and directories. We looked at using the files class to check, delete, copy, or move a file or directory. We looked at using a files class method to read and write files using channel I/O and streams. We looked at reading and changing files and directory attributes. We looked at recursively accessing a directory tree. That was very interesting. And we looked at finding a file by using the pathmatcher class. Everybody's following, folks? OK.

Let's go ahead now and look at some of-- actually, the labs that we are going to, again in this case, work with. And that would be the practice labs for 11. Let me go ahead and get to that. And that would be here. So there are some practices for this lesson 11. And the first one, what we're going to do is look at writing a file merge application. So you can actually do this using the summary level if you're comfortable.

If you need more information, then you can go ahead and make use of the detail level by writing a file merge application, again, using some more details given to you in the detail level of the practice one. The next one is working with recursive copy. Again, in this case, the concept is the same. You can make use of the summary level and do your practice. If you need more information, you can always use the details level version of this practice and look at that. And it gives you more information about how to, again, go about doing your lab, of course.

And we have an optional practice lab. And it's using pathmatcher to recursively delete. Even though it's optional, I encourage you to try it, please. And because, of course, it's going to help you just illustrate what we have learned in this lesson. And you can use, again, the summary level. If you need more information, you can, of course, use the details level of this practice. And of course, it gives you more information on how to do that. And it's interesting. And it's really worth looking into it. So let's go ahead and do these practice labs for lesson 11. And after we finish, we'll go ahead and, of course, go to the next lecture, which is lecture number 12. Thank you.

## 4. Practice 11-1: Writing a File Merge Application - 16m

Now that we're done with Lesson 11 that covered Java file I/O, where we discussed the use of the path interface to operate on file and directory paths. We also looked at the Files class to check the lead copy or remove a file or directory. We also used the Files class methods to read and write files using the channel I/O and the stream I/O. We looked at the Read and Change file and directory attributes. We looked at the recursivity axis, a directory tree, and we looked at finding a file by using the PathMatcher class.

Let's go ahead and look at the practices for this Lesson 11. And we start, of course, with the Practice 1. We go to the detailed level. In this practice, we will use the Files.readAllLines method to read the entire contents of the two files, a form template and a list of names to send from letters to. And of course, after creating a form letter with a name from the name list, you will use the Files.write method to create the custom letter. Again, you will also use the Pattern and the Matcher classes that you saw in the String Processing lesson.

So again, in this case, we'll go ahead and make use, of course, of the NetBeans projects in this directory to help understand how to use the files and the readAllLine and Write methods. Of course, those are all examples provided. So we'll go ahead and open, in this case, the project, which in our case here would be the project FormLetterWriter that we already opened. And we say, go ahead and in this case open the file NamesList.txt in the Resources directory.

This file contains the names to send, again, the form letter to. Add your name to the end of the list. Save the file, just so that you can see your name. And of course, open the project, this FormLetterWriter, in the practice, and expand this FormLetter class.

So let's go ahead-- and of course, notice that this class contains the Main method and that the application requires two parameters, one in the path to the FormLetter template and the second is the path to the file containing the list of names to substitute in the form letter. Obviously, in this case, you will see that here's how, again, this FormLetterWriter is.

So again, first of all, make sure that the arguments are two. And then here, we'll represent args [0] and args [1] for the form and the list. And of course, here, we're saying if the invoke is regular file on the file, if it's not, or the second list is not regular file, go ahead and print form template and Name list must be files, and exit.

Continuing with the lab, and after checking the Main method creates an instance of the FileMerge class with the form letter Path object and the list of names Path objects. So of course, continuing with that, just to see this is the FileMerge class that we represented here. You can see it has a constructor, and it has the writeMergedForms method. That's all provided to us. It has the MergeName method. It has the hasToken method.

Continuing with the FormLetterWriter, so, again, in this case, we'll go ahead and create a new instance of the FileMerge passed with the form and the list, and then within the Try block, invoke the writeMergedForms on the instance of the FileMerge, FM. And of course, this will call automatically this while-- rather, the FileMerge. Let me see-- let me go back and we see that, in our case here, we'll go ahead, and we say that in the Try block of the Main, again, calls the writeMergedForms method that you see here.

And of course, we saw that right here where we called the writeMergedForms. And of course, if you go back to the FileMerge, you see the writeMerge. Again, this method takes the form and merges it with the list. It, again, generates a new file with the names from the list.

So first, you open the form letter and read it into the list of strings. And then, after that, read all the names from the list. Iterate through the list of names creating a new customer letter each time. And of course, create a new file name from the name in the Name list. And of course, write the custom form letter out.

Continuing with the practice, expand the FileMerge class. Again, note that the writeMerge method is empty. Again, this is the method that you will, of course, write. And I just showed you how you should have wrote it similar to what we wrote over there. Of course, it could be slightly different, but the concepts are the same.

Again, the MergeName method, use the Pattern object defined in the field declaration to replace the string from the form template, first argument, with a name from the Name list, second argument, it returns a String. For example, it replaces Dear whatever name to Dear Wilson Ball. Again, the HasToken method returns a Boolean to indicate whether the string passed in contains the token. Again, this is useful to identify which string has the token to replace with the name from the Name list.

And of course, in this case, going back, we're just showing you the MergeName method, which produces a new string in the letter that replaces the token with the name, and you see here. And then you have the HasToken determines if the string has the token. This is how we write this. So the MergeName, we pass the form and the name. And then we go ahead and invoke the Matcher method on the reference variable P, pass the form to it, get a Matcher. And of course, by invoking the Replace first, passing the name to that method on the Matcher reference variable.

And in the HasToken, we'll go ahead and invoke the Matcher method, pass the string to it, and that's on the reference variable P. And now you get the Matcher, and then after that return by invoking Find method on the Matcher.

And continuing with that, so code to the writeMerge method, again, we have seen it, but this pretty much tells you the step by step how to code that, where we say the overall plan for this method is to read in the entire form letter, line by line, and then reads in the entire list of names and mirrors the names with the form letter, again, replacing the placeholder in the template with a name from the list and then writing the output as a file. The net result should be that if you have 10 names in the Name list, you should end up with 10 custom letters, files addressed to the names from the Name list.

Again, these 10 files will be written to the Resources directory. Create an instance of the default character set. That this argument is required for the realAllLines method invoked on the Files class. And of course, after that, you have the invoking the default character set from the Charset class. And then that will give you a character set reference variable. Again, read in all of the lines of the form letter into the FormLetter field. And all of the lines from, in this case, the Name list into the nameList field.

We should note that because writeMergedForms throws IOException, you do not need to put these statements into a Try block. The caller of this method is responsible for handing any exception thrown. And you see some code here for the form letter and the Name list.

Create a For loop to iterate through the list of names, nameList strings. Inside this loop, create a new List object to hold the strings of the form letter. You will need this new List to hold the modified form template strings to write out. Again, you see the code, how it should be similar to this. We've seen it, but we'll see it again.

And then after that, we say in Step E, still inside the For loop, you need to create a name for the custom letter. One easy way to do this is to use the name from the name list. Again, you should replace any spaces in the name with the underscores for the readability of the file name. Again, create a new Path object relative to the form template path. And here's some code on how to actually do all of that.

Continuing with that, create, again, another For loop here nested in the first loop to iterate through the lines of the form template and look for the token placeholder using the name to replace with the String name from the Name list. Use the HasToken method to look for the String that contains the token String and replace that String with one containing the name from the Name list. Again, use the MergeName method to create a new String. Add the modified String and all of the other Strings from the FormLetter to the new customLetter list. And of course, we see some code on how to handle that.

And of course, finally, still inside the first For loop, write the modified list of Strings that represents the customized form letter to the file system by using the files.write method. Print a message that the file was successful, and close the outer For loop. Again, this should be some code that looks like this. Again, format the code to ensure that you have everything in the right place. Press the control-alt-F key combination or right-click in the editor pane and choose Format. Again, save the FileMerge class.

Modify the FormLetterWriter project to pass the form letter file and the name list file to the Main method. Right-click on the project and select Properties And of course, in the Argument text field, enter, first, in our case, will be FormTemplate.txt, and then, of course, the names list. Click OK. And after that, of course, run the project.

So obviously, we've seen this code. First of all, we've seen the writeMergedForms method throws an IOException. First, again, we said we'd open the form letter and read it into the list. So here's the code that we have, again, seen in the activity guide. Read all lines. Save that in name lists. And then use the iterate through, in this case, the list of names, creating a new custom letter each time.

And of course, we're getting the path using a For loop here, like exactly what we discussed in the activity guide. And of course, in the FormLetterWriter, that's where we specify that to the form on the list, and on within the Try block, we'll invoke-- again, we create a new instance, in our case here, of the FileMerge passed with the form in the list. And then within Try block, just invoke the writeMergedForms method on the reference variable FM of type FileMerge that we created on line 27, and catch an IOException if there is an IOException.

Of course, when we looked at Properties, and then Run, that's where we specified the FormTemplate.txt, and then second one would be the NamesList.txt. And that's exactly what they want us to do. And then, of course, after that, what we do is, obviously, run the project. And that, of course, will lead us to an output. And with that, it ends also this practice. Thank you.

## 5. Practice 11-2: Recursive Copy - 11m

Let's look now at practice two of lesson 11. In this practice, we arrange our classes that use the five visitor class to recursively copy one directory to another. So first. We open the project recursive copy. And of course once we expand all of that we're going to look for the class called p.java. And that has a main method.

Again, this will have two target sources and target paths. If the target file, or directory, existed the user is prompt whether to override that. Again, if the answer is yes the method continues. And then of course, in this case, we have also the copy file tree.java.

This class implements the five visitor interface. Again, we should know that the five visitor is a generic interface. And this interface is boxed with the path class. Again, this allows the interface to define the type of arguments passed for its method. The copy file tree implements all the methods defined by the file visitor.

Again, our task is to write method bodies for the five visitor directory, five visitor file methods, our other visitor file methods. Again, we'll not need the post visitor directory method. And again, we have been provided a method body for the visit file failed method.

So just looking quickly, first of all, at the copy. How we have a couple of booleans override and prompt. Originally they're initialized with false. And then we check the appropriate number of arguments. Should be, again, if it's less than two then we raise an error. And then here, we go ahead and set the odds to zero to represent source path. And [INAUDIBLE] one to represent the target.

And of course if the file does not exist then of course we raise an error. In this case we'll go ahead and raise an error. Check the second argument. If it is relative path make it absolute and relative to the source, of course. That's through this code. And also, if the source exists, we need more information about what to do in this case.

All right then. Of course I ask if we should override the target and so forth. And by using y then of course we'll go ahead and override that. [INAUDIBLE] an IO exception if there is any IO exceptions else we'll go ahead and create a directory if it does not exist in this case.

So continuing with that, we also have the copy file tree. And we said that it has a source and a target. Implements five visitor interface. So here we have pre-visit directory method. And of course the file visit directory, the post-visit directory, the visit file failed method in this case. That of course, we said, is given to us.

Continuing with that, again, write the method body of the pre-visitor directory. Again, this method is called for the starting node of the tree and every subdirectory. Therefore, we should copy the directory of the source to the target. If the file already exists we can ignore that exception, because we are already doing the copy because the user elected to override.

Again, start by creating a new directory that is relative to the target passed in, and is of course the node name from the source. The method call to do this is what we see here. Result, method, invoked on the target.

In a tribe law copy, the directory passed to our other pre-visit directory method to the new directory that you created. That's done through this code and on part B. And then of course, after that, we can ignore any file already exists exceptions thrown, because you are overriding any existing folder and files in the copy.

And that's why we catch here a file already exists exception. And of course we ignore that. Do, again, catch any other IO exceptions and use the Escape and [INAUDIBLE] of tree return to avoid repeated errors. And that's, of course, specified here.

Just going to look at that. Pre-visit again here. Pre-visit directory, that's exactly following what they asked us actually to do here in step four. And we see it here. So here's the code.

Pre-visit directory, the exit path directory, and basic file attributes. Create, first of all, a path in the target that is relative to the source. And of course we call the copy exactly what we said. Catch a file already exists exception and ignore it. And then, of course, catch IO exception and go ahead and get this message. And return skip underscore subtree. Of course [INAUDIBLE] return.

All right, continuing with that now they want us to look at the method visit file. This method is called, when again, we are at step five here. This method is called when the node reached is of course a file. The file is passed as an argument to the method.

As with the pre-visit directory, you must rationalize the file reached source path with the path that you wanted to for the target. Use the same method call as above, only using file instead of directory. Again we see the code here. The [INAUDIBLE], his method, that is invoked on the source. Passed to the result which is invoked on the target.

Again, as with the pre-visit directory method use the files copy method in a try block. Make sure that you pass, replace, and there's coexisting in as an option to override any existing file in the directory. And of course this is specified here.

You should know that to use the replace existing [INAUDIBLE] type, again you must import the java.n.file.standardcopyoption. And in class using a standard import again like this. Like what we've seen here. Catch an IO exception if there's an exception. Fix any missing import and save the class.

Let's go ahead and look at that. And here's the visit file. As you see, take the path. That the basic file attributes. And we use the result here, And like exactly what we've done. We passed to it the source.relativise and then pass the file to it.

OK, and then within the try block we'll call the copy method. And then catch an IO exception if there's an IO exception. OK?

And continuing with that, test then your application by copying a directory, ideally with a sub-directories, to another location. So it turned out here that I actually created a temp directory under D. So it's already there. And then of course I'm going to go ahead and copy this labs and backslash 11-NIO.2. Which is that directory here.

So in that case, of course, I have it here. And as you see it has examples, practices, and solutions for all those. And I'll go to my net means. I'll click on the project and of course I go ahead and click properties. And then under the run that's where I input and enter.

Now the first one is the 11-NIO2 directory, and then after that space d: [INAUDIBLE]. So already taken care of that. And all what we need to do now is, of course, run the project.

So in this case, when I run the project, it's going to ask me if I want to override and then I say yes. As you see before, there is no information inside this directory called temp. Go ahead and say yes and then, of course, hit return. And that of course says successfully copied In all what's inside the directory 11-NIO.2 to the temp.

Let's go ahead and see and verify that. To verify that, we just open the temp. And if we open the temp you see that now we see the folders, examples, practices, and solutions. That were by the way, that are still in the 11-NIO2 are automatically copied in this case to the temp directory.

And that pretty much ends this practice. Thank you.

## 6. Practice 11-3: Using PathMatcher to Recursively Delete - 9m

Let's look now at practice three of lesson 11. In this practice, we'll write a Java main that creates a PathMatcher class and uses the FileVisitor to recursively delete a file or a directory pattern. And here we open the RecursiveDelete project, which I have it open here on NetBeans. And of course, we'll go ahead and open the Delete.java in this class.

We'll see the main method. Again, the main class accepts two arguments. The first is the starting path and the other the pattern to delete. We must, again, code the remainder of this class.

Again, look at the comments for hints as to what to do. Start by creating a PathMatcher object from the search string passed in as a second argument. To obtain a PathMatcher instance, you will need to use the FileSystems class to get a PathMatcher instance from the default file system. And we see a code that looks like this.

Create a Path object from the first argument. Here it is. After that, in this again, if the starting path is a file, check it against the path using the PathMatcher instance that you created.

Again, if there is a match, delete the file. And then terminate the application. That of course, is looked here, as you see here, the code that should be in your file. In this case, it would be in the class, the Delete.java.

If the starting path is a directory, create an instance of the DeleteFileTree with the starting directory and the PathMatcher object as initial arguments in the constructor. Again, pass the starting directory and the file tree to a walkFileTree method of the class files to recursively look for the path to delete. Again, we see this here.

Of course, fix an existing, and save the file. So let's go ahead and look at that. And here is the class, again, in this case, Delete.java.

It has a main method. First it takes two arguments, OK. Create a Matcher instance using the second argument. OK, we see it here.

And here, again, get the root path. And here, check if the starting path is a file that matches the search string. Here it is.

And use an if statement here. Within the try block, we'll go ahead and delete, in this case, the root, and exit. And catch a minor exception, if there is any I/O exception. Here also, again, this is a directory. So traverse the tree looking for the file to delete.

So again, in this case, create an instance of the DeleteFileTree. Pass the root to the matcher. And get your DeleteFileTree instance.

And then within, you'll call the walkFileTree, pass the root in the deleter over there, which is a reference to DeleteFileTree. And of course, catch an I/O exception, if there is any I/O exception.

Continuing with this practice of the DeleteFileTree class, again, this class implements the FileVisitor. This class recursively looks for instances of files or directories that match the PathMatcher object passed into the constructor.

Again, this class is compete, with the exception of the delete method. The delete method is called by the preVisitDirectory and visit methods. Again, you must check whether the file or directory reached by these methods matches the pattern.

We only want to match the file name of the node. So use the Path.getFileName method to obtain the file name at the end of the full path. So we see the code here, get the file name.

Again, if the name matches, uses the File.delete method to attempt to delete the file pattern and print a result statement or print an error, if an I/O exception is thrown. So we see this in the code. We see how it deleted the File.deleted files.

Save, again, the DeleteFileTree. And of course, run your application using a temp directory. For example, if you completed the first practice, which we did, we can delete all the Java classes, in this case, from the D:Temp, by again, in this case, running and entering this one, a D:, and then, of course, D:, backslash, Temp, backslash, examples, space, asterisk, .class, which is all the, again, in this case, the .class files. Go ahead and do that.

So we'll go ahead and first look at the properties. And as you see here, we have the delete that we're calling. And by the way, just again before doing that, just looking at the DeleteFileTree, let's go ahead and look at, again, this DeleteFileTree that implements FileVisitor.

So it has the DeleteFileTree method that takes a file and the PathMatcher. And as you see here, this is the constructor that initializes that. Here's the delete method that we discussed.

It compares the globe pattern against the file or directory name. So delete takes a file and then gets the file name and then takes a look and matches if the name is different in, again, the matcher.matches name. In this case, is true.

Then, of course, in this case, delete the file. Bring the file. Delete it. Otherwise, if you catch any I/O exceptions, go ahead and print these messages here.

And we said that this delete file is called by the visit file you see here. And it's also called by the, in our case here, obviously, the visit file here that we see how it pretty much calls the method here, delete file, within the visit file that we discussed. Of course, the rest is the same for the preVisitDirectory. And the visit failed, file failed in the postVisitDirectory.

Now let's go ahead and run this project. So we need to specify, of course, the argument over there because, of course, the delete file will take that. So we need to specify that by specifying arg zero and arg 1.

We'll right-click and click Properties. And click on Run. And then down here, we'll go ahead and put in, in this case, the first argument and the second one. Click OK. Then, of course, after that, run it.

And as you see here, it shows us the different files or the .class files that actually got deleted. And I see how the run successfully. And we see the output. And the pretty much end the practice for this lesson or this practice. Thank you.
