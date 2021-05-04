# 14: Java File I/O (NIO2)

1. Java File I/O (NIO2) - 30m
2. Practice 14-1: Working with Files - 14m
3. Practice 14-2: Working with Directories - 10m
4. Skill Check: Java File I/O (NIO.2) - Score 80% or higher to pass

## 1. Java File I/O (NIO2) - 30m

All right. In the previous activity and in the previous chapter we were talking about how we can pull information into our program or how we can persist information out of our program. We also extended that with serialization and deserialization.

But in this chapter we want to talk about a specific way that we can pull information in or persist information out. And that's through the use of the file system. Now of course each system, each operating system has a different mechanism and different things, different roots, et cetera. There are differences.

However, working with the file system in Java has up until Version 7 been an issue. And we'll talk about some of those limitations. But prior to Version 7, so from Version 1 up, we had a single class that allowed us to work with the operating system, which was the File class. Well, the File class had a number of limitations, which we will go into in much more detail in the slides.

So in Version 7, a new package was introduced called NIO.2. Now, there is an NIO.1, but that's not really for file access. That has a number of classes that are helper classes, but not really something that we would be working with a lot.

And so in NIO.2, there are a lot of classes that we could talk about. But the ones that we're going to really focus on in this chapter are Path, which represents either a directory or a file in the file system, and the Files class that gives us the opportunity to do pretty much anything that we would like to do with either a file or a folder. And so in the slides we're going to introduce the advancements that we have in Java with working with file systems.

So in the slides, our objective, of course, is to use the Path interface to operate on file and directory paths. We're also going to use the Files class to check, delete, copy, or move files or directories. Now we're also going to see that in NIO.2, there is the streaming API. Now we are already somewhat familiar with streaming, because we've already talked about it in previous chapters.

But basically as it shows on slide 109 is that we have improved file system interface. We have complete socket-channel functionality. And we've talked about how we can create channels to work with larger blocks of information. And it's much more scalable than it was before.

Now when we talk about limitations, some of the limitations with the previous File class are on slide 110. For example, it says that it does not work well with symbolic links. So what is a symbolic link?

Well, in some operating systems-- it doesn't exist in all-- you may have a folder structure where you have a file that has of course certain characteristics. But many of the people that maybe need to use this file don't have the access that is necessary to access it. But you don't really want to give them access to the directory in which that file exists.

And so what can be done in some operating systems is that in a folder that they do have access to you can create a symbolic link that looks like, acts like, works exactly the same as if that file were in this folder. But actually what's happening is when you work with this, it's interacting between that link. Well, in the previous version of the File class, if you could get it to work, it was onerous. And it didn't work really well.

Now, some other problems with the previous file system or File class was that let's say I wanted to know when was a file last modified, who updated it, and what was the size of the file. So I wanted to basically know the metadata of that file. Well, the problem was that each one of those was a separate call to the file system from the JVM. So it was a lot harder to work with and it did not scale well.

Now, that also included the performance issues. There were a number of things that just added up when it came to performance of working with the file system. And in addition the File class only had access to only a half-dozen or so metadata attributes, all of which had to be accessed separately. So it was very basic system file access functionality. But it just wasn't very developer-friendly or system-friendly or for that matter user-friendly.

Now with NIO.2 both files and directories are represented by an object called a path. Now, that path can be either relative, meaning that it's relative to the context we are talking about, or it could be an absolute location, meaning that it includes the root.

Now, different operating systems like Solaris, Linux, et cetera, their root is actually a forward slash. That's what we have in this class. However, in Windows, the root class may be a named drive, usually C or D, followed by a colon. And so because operating systems are completely different, or at least have specific differences, the nice thing about a path is that you can create one to identify specifically the path to a particular resource, whether that resource be a file or a directory.

Now we probably know the difference between a relative path and an absolute path. The absolute path, of course, always contains the root, in this case the forward slash, whereas a relative path needs to be combined with something else to actually know exactly where a file is or a directory.

So in NIO.2, like I said, the File class was the entry point prior to NIO.2 for all files and directory operations. However, in NIO.2, we not only have the Path and Files class that we talked about on the board, but we also have a FileSystem class. So if I want or need to work with the file system a lot, I'm actually going to work with the FileSystem class to represent the interface to that file system. And it also it is a factory for the creation of Path methods, or Path objects. So all the methods that access the FileSystem will throw either an IOException or a subclass thereof.

So let's talk about the Path. So the Path interface provides the entry point for the NIO.2 file and directory manipulation. And there are two ways that you can instantiate a Path.

In the first example here, we're going to create an instance of the file system. Now of course when you are working with the JVM, there is only one file system in context. And so this is a factory method. We're going to have access to the specific file system we're working with.

so notice that on the FileSystem, I can call the getPath method here and then pass in the absolute path to that particular path. And I can have an instance of that path. Or I can use the Paths class and just call the get to identify that I want to instantiate a Path object. And there's a number of ways.

Now, what does the Path give me? Well, the Path gives me a number of methods that allow me to work with, for example, components of the Path. So for example, getFileName, getParent, getRoot, getNameCount, or to manipulate or operate on the Path. And these we will cover in succeeding slides.

And then finally, we may want to compare paths, so are two paths equal? Are they the same? Do they end with or start with things? So a number of features to the Path.

So rather than belabor the point, on this slide they just to show you some examples of, OK, if this here is the path that I'm passing into my program and I say, all right, I'm going to create a path based on that, then when I call getFileName, well, what do we get? Well, when we get the file name of course we're getting the one with the extension. On the other hand, if I say to getParent, well, the parent part of it is everything up until the file or directory we're talking about.

The getNameCount identifies, well, how many directories are there between the file name and the root? So in this case, if we look at this, we can say, well, we've got the root, we have home, and we have oracle, so there are three directories.

Of course, the getRoot, pretty straightforward. If this were a Windows system, it would give me C colon or D colon, whatever the root is. In the case of Solaris or Linux, for example, we will get the forward slash.

We can also determine whether the path is an absolute or a relative path. In this case, that is true. And if I had a relative path, I could actually convert the path to an absolute path. And so of course, that gives us that.

Now, the other nice thing about a path, however, is that if I needed to create a link, for example, in some output, notice that I can use the toUri method. And it will append the protocol in front of-- or the appropriate protocol in front of the path. So a lot of things that we can do with the path.

But some other things are kind of nice. For example, let's say a path is using some notation, so current context or move back to the parent directory. In some cases, the path is going to have that because there might be a symbolic link involved, in which case you do not want to call the normalize method, because that will often break the symbolic link.

But let's say that we do have, for example, this. Well, basically what this does is the dot dot eliminates peter. And so if I were to call normalize on that, it's just going to normalize it to what it would resolve to without all of the notations. So we can remove redundancies from the path by using the normalize method.

Now we can also create a subpath. Now, this is a strange method because it seems to count things differently depending on what you're looking at. So the subpath method does exactly what you would expect. You're going to get a relative path based on what you call, just like a substring gives me a part of a string.

Well, in a subpath you're going to pass two numbers, the beginIndex, which indicates, OK, where do I want to start, or which directory do I want? So for instance, in this case I'm saying, OK, I want to start at 1. Well, you would think, OK, the root is 0. Home is 1.

Well, notice that, no, that's not the case. In the case of the beginIndex, the root is ignored. Go figure.

However, it also says, well, this is the endIndex. Now, if this were counting the way we would expect, we would say all right, well, if Temp is 2, then foo should surely be 3. So we should think that, OK, that would get that.

But actually, what the 3 says is the 3 is not inclusive, meaning that I want to stop before I get to 3. I didn't design it but that is the way this works. So in this case, if I say subpath 1, 3, then I would get oracle slash Temp only.

Now the resolve method allows me to take two Path objects and create a third combined Path object. And so for instance, if I have Path 1 here that is the root home clarence foo and I say, well, with Path 1 I want to resolve bar, what that's going to happen is it's going to append bar onto foo and give me the entire path.

But it does depend on where the resolve method is called from. So for instance, in this case, if I say, all right, get foo, well, in this case here we are, and then resolve home, clarence, well, from foo, if I'm resolving home, clarence, then all I'm getting is the root, home, and clarence. So kind of interesting how you can work with different paths.

I've kind of talked about already what symbolic links are. So like I said, if this is the link that the users can't get to because they don't have access to the logFile because of security considerations, an administrator could create a symbolic link to the home logFile in another directory that a user does have access to. And in this case, I could just as easily open it, manipulate it, et cetera. But any change to this file also changes this file. So that's the idea of a symbolic link.

Well, in this case, the Path interface is link-aware. It is able to work with those links. Now, there are a number of ways that we can do this.

We can create symbolic links by identifying, well, the path to the path that will represent the symbolic link, the path that represents the actual file, and then any attributes that I might want to pass in in relationship to that. Now, once I have a link, I could also determine, is that a symbolic link? Or I might want to actually find the actual target to the link. I can also create something called a hard link, so I'm linking one path to another path. So there are number of things that I can do using the Path.

Now, when we talked about the Files class earlier, the Files class works with Path. But with the Files class, notice that I can check to see if a file or directory exists or not. I can delete files or directories, copy them. Now, of course a copy means that the original remains but then I'm going to make a copy in another directory. Or in the case of a move, it existed in one place at the beginning but it is deleted from the original place and moved to another place in the move.

When it comes to metadata, if I want to know about a directory or a file's metadata, the nice thing is that when I get that, I access it as a Properties class, which means that I only have to access it once. And it's also possible for me using the Files class to read to, write to, or create new files. And we've seen that, for example, in the previous activity. During the serialization we created a file. Now, we didn't use the Files class, but it's a similar process.

Now in some cases we also have classes that will allow us to be able to randomly access within a class. And of course, we can also create and read directories. So there are a lot of things that we can do with the Files class. And so let's talk about what some of those are.

So the Path object represents the concept of the file or the directory. And so before you can access a file or directory, you should first access the file system to determine whether it exists or not. For example, if I try to open a file but it doesn't exist, we've already seen that we're going to get a FileNotFoundException.

Well, rather than catching that exception, wouldn't it be more prudent to just see, does that file exist anyway? So in this case, we can use the exists or notExists method of the path or of the Files class to determine whether or not a path actually exists.

Now in addition, there are additional options that I could potentially pass into the exists or notExists. So if we look down here at the bottom, notice that I'm creating a path based on an argument that I pass in. And I'm just going to use the exists method of the Files class to determine, does that path actually exist? Now, in this case, I'm also saying, however, if this path represents a symbolic link, I do not want to follow the link. And so again it's going to determine whether it exists as a file directly, not as a symbolic link.

Now, other things that I can do with the Files class. I could determine, is a particular file or directory readable? Is it writeable? Is it an executable?

And in some cases, if I'm working with symbolic links, I can determine, well, if this is a path to the hard file and this is a path to the link, by using the isSameFile I can determine, are these truly the same file that are being represented? So that's kind of convenient.

Also we can talk about, like I said, if we are creating files or directories we can create a file using the Path to identify what that is. Or we can create a directory using the Path. Now the cool thing about createDirectories is that if you pass the directory, and let's say that only this currently exists, well, the cool thing about createDirectories is it will then create the foo directory. And then inside of foo it will create the bar directory. And inside of bar it will create the example directory. So it can create multiple directories all at once from top to bottom.

Same thing with deleting files. You have two options. When you want to delete a file and you know that it exists, then you can just call delete, pass the path, it will go ahead and delete. The problem, however, is that if the file does not exist, it is going to throw a NoSuchFileException or if you're trying to delete a directory you might get a DirectoryNotEmptyException. And so the delete, if that's what you want, that's a great way.

But there is also the deleteIfExists, where if it exists it'll delete it. If it doesn't exist, no harm, no foul. It's not going to throw an exception. It's just going to continue on.

Now, copying a file or a directory, pretty straightforward. You can copy a file or directory by using the copy method. Now, notice that in the copy I'm identifying where it's coming from and where it's being copied to.

Now in addition, I can also identify that I want to replace the existing. So I'm going to copy it and if it already exists in the target directory, it'll go ahead and replace everything. In addition, usually when we do a copy the new directory will show the current date as far as the update goes. If I use the COPY_ATTRIBUTES copy option, it's actually going to take the attributes from the copy and put it in the new target. And then finally, we've already talked about the NOFOLLOW_LINKS. So that is also possible here.

Now what this is showing down here at the bottom is that I can have my source path, my target path. And I can use any number of standard copy options to indicate exactly what I want to have happen with the copy.

Now, moving a file is similar to the copying. But in the case of the move, of course, the original file or directory no longer exists. So again, source, target. But the nice thing about this is there is one additional standard copy option parameter for the move. And that's this idea of an ATOMIC_MOVE.

Now, why would I do that? Well, the reason why I might do that is very simple. If you've ever noticed, for example, on a download, if you look in the directory where the download is going, you're going to see the file. Now, it may not be complete, because it's still downloading. But the file is there.

The problem is that with a move, that always happens. So the file is showing here even though it hasn't completed, which means other users of the file system may attempt to work with that file even though it's not complete. So by saying that you want the copy option of ATOMIC_MOVE, you're basically saying that that file or that directory cannot be accessed until the move is complete. So that's kind of cool. And so again, we can use the Files class to do that.

Now, a couple other things that we can do. There is a list method on the Files class. So notice that I can basically say, OK, here's my path. Use the get method. And then I can basically say, well, get the current context. Well, in this case, it's going to get a list of the files in the current directory. And at this point, as we've seen, we can use the forEach to then in this case print out each one of those files.

Now, another possibility is the walk method. Now, the walk method is kind of interesting, because it will say, well, starting with this directory, and it will walk the directory structure. So it will look at every directory and subdirectory and subsubdirectory. And it will look at every file as part of the walk. And then you can identify exactly what you want to have happen as that walk progresses.

Now in the previous activity, we created a file reader that looked at-- in fact, we were looking at the input stream reader. But basically we had a way to access the file. And then we nested that inside of a BufferedReader so that we could work with each line. And in this case, notice that it allows me to use the lines method to convert a BufferedReader into a stream.

So where before we had a collection and we said, collection dot streams, or just dot stream, this does very similar. So now I'm converting literally my file into a stream that I can then work with my lambdas on.

So as an example, the lines method can be called using NIO classes. So notice that in my try with resources I'm going to create a-- well, in this case a stream collection of strings that I'm going to call lines. I can say, well, let's get this file, call the lines, so that's going to populate my Lines class. And so now that I have a stream, I can do just like what we've talked about in previous chapters. I can do my intermediate methods and my terminal methods.

So another possibility, of course, is we know that an ArrayList is a collection. So if we're not talking about a stream, we want to do it into a collection, well, notice that in this case, all right, I have my path called file. And in this case in the Files, I'm going to call the readAllLines based on that file. And I'm going to populate this list.

So at that point, we've already seen that, of course, if we have a collection, we can call the stream. But notice here, again we can use the filter. we. Can use the forEach. So everything that we've learned in the previous lambda functions, built-in functions, and lambda operations chapters we can do just as well with files or with collections.

Now, every operating system has different metadata that is possible. And with the NIO.2, it is possible to access all of that metadata. But across the board, every operating system has these methods, this metadata available to it. And so with Path, we do have the ability to work with, is something a directory or is it a regular file or a symbolic link? Many of these we've already seen. But they can provide a lot of information for what we're working with.

So we've visited the symbolic link again. And so in this lesson, we did talk about the Path, what they represent, some of the methods that we can work with the Path. We looked at the Files class and how it is that we can access and do pretty much anything we want to both files and directories using the Files class. And we've also seen that in Version 8 of the Files class, we now are able to convert that file representation into a stream so that we can treat it with lambda expressions.

And so now it's time for us to do the Practice for 14.

## 2. Practice 14-1: Working with Files - 14m

Practice 14-1 allows us to work with some files. Now, what we're going to be working with is an excerpt from the play Hamlet. And the excerpt is already in the root directory of the project, which means that we will be able to use relative rather than absolute access to that path.

So if we open the LambdaFiles project, there we can edit the P01BufferedReader class to perform the steps. So using the Reader in a Stream read in and print out the Hamlet text file. The output should look like the original text provided on the previous page.

So we'll do that one first. So in this case, what we're looking at is that we've got our BufferedReader already. It's going to pull in the file reader. So we just want to print out our file here.

So we already have the Reader-- and apparently, there we go-- we have our Reader. And if you recall from the lecture, we've already indicated that we can use the lines method to treat this as a Stream, which means that now we can basically do pretty much what we were doing in previous chapters.

So we'll do the forEach, well identify what we want to do. And in this case, all we want to do is print out each line. So that should do it.

All right, so just to see if it does what we expect, let's go ahead and run it. And according to this it does do the entire file, blah, blah, blah. So it looks like we have done well on the P01.

All right, so the next step is to edit the P02NIoRead class to perform the steps that follow. So we're going to use, let's see, a path file and files classes and a Stream to read and print the contents of the Hamlet text file. The output should look like the original text provided above.

OK, so it sounds like we are going to pretty much do what we just did. But in this case, we are going to do it in a different way. So in our try with resources, we're going to want to create a Stream of lines.

And let's see, we want the lines method. And we're going to get the path. So path dot get-- yeah, that's not what I want.

And that's because I've got the wrong class. Paths, that's better. And then we'll pass in the string.

And what is that we want to pass? We want to pass in the paths. So that would be what? Hamlet.text.

All right, so once we've done that we want to output the entire file. So it looks like that goes here. And we can do our forEach.

And so each line-- now, basically the same thing we just did. And so in this case, this line 19 here is exactly the same as the previous. The only difference is is that we want to pull it into this collection first and then print it out.

So hopefully with that, we can run it. And it does do exactly what we expect it to do. So excellent. So that's the P02NIoRead.

All right, so the next step is to look at the P03NIoReadAll. All right, so in this case, what does it say? We're going to, using the NIO Features and Streams, read the contents of the Hamlet file into an ArrayList.

And then we're going to filter and print out the lines for Rosencrantz. For example, string dot contains Ros, the output should look similar to the following.

All right, well in that case, that's piece of cake, right? So let's take out the comments. That gives us at least the start of what we're interested in.

And so I'm assuming that we want to read our file here. So we're going to use the file array that we've declared at the beginning. We'll use the files class. And we're going to read all lines and pass in the file, which we already have denoted here as well.

All right, so now that I'm going to look at the file, it's going to pull all of the lines into my list. So we're going to output Rosencrantz, which is what we're supposed to. And so now, we can use the file array.

Well, what do we do to create a Stream? Now, as you can see we can use the Stream method. But it says that we only want to have those that are from Rosencrantz, so we want to filter.

And in this case, each line is going to need to start with Ros. And then we're going to loop through each one and print out the line.

So that should do it. But we want to do the similar thing to Guildenstern. So we're going to go ahead and pull that down here.

But in this case, we don't want Ros. What was it that we had? G-U-I-L period. There we go.

All right, so at this point, we have the ability to read the Stream for Rosencrantz, for Guildenstern. And if we run this, it should show us only the lines for each. So it looks like we get the first one done. And it looks like the second one is also appropriately done. So that would be P03.

Now, the last thing is that we are going to do the P04. I'm going to go ahead and remove the contents here, or the comments. And we're going to create a file array. We've already looked at that before.

So again, we have our file array already defined. Now, we're going to read all lines, pass in the file itself. So that works with that.

And so according to this, we want to-- so we pull it into the in ArrayList, which we have. And then we're going to filter and print out the word lord and the word prison and get a count.

Well, we've done something similar to that before as well. So let's create the first one. So wordCount is going to equal what?

Now, we already have our file array. And in this case, we're going to use the Stream method. And so we want to create another collection, because we want to be able to look at words.

And so that would be the flatMap method. And in this case, for each line we want a Stream of-- and what do we want?

So basically, we want to split it, so that we can look at each word. Now once, we have our each word, then of course, we can filter. And we want to filter on the word lord.

So let's see, word dot contains-- always helps if I actually use not the line we're representing. Now, we're representing each of these as a word. There we go. And we want the word lord.

So at this point, we now have a different collection that has our words. We filter on each word to see only those that have lord, at which point we want to be able to print them out.

Well, we can't print them out, we can't do a forEach, because that's a terminal operation. And what we really want is the count. And so we'll go ahead and do a peak.

And so for each word that has passed the filter-- yeah, well I don't want that one-- we're going to go ahead and print out that word. And then we're going to present the count.

And that's what it is that we want to have here and what is going to be printed out there. All right, so at this point, it looks like we should have all of the lords there.

And we can do something very, very similar for this one. But so we're going to split it into a different collection that only has words for each word. But in this case, we are interested in the word prison, print out each one. And then we can give it a count.

And so based on what is in the book, if we run this, it looks like we get a count of seven, which is in the book, and a count of three, which is what the book says we should be having. So it looks like we have successfully completed Practice 14-1.

## 3. Practice 14-2: Working with Directories - 10m

In activity 14-02 we have three small things that we want to do working with directories. So first of all we're going to open up the practice and we're going to edit the DirList class to read all files in the current directory using the list method. All right. So if you notice, in the main method they've already done some of this for us. So I'm going to get rid of the comments that they have.

And they've already given us the catch method. And apparently we need to add our try-with-resources to access the directories, and then we're going to go ahead and print them out. So of course the try-with-resources goes here.

And so what do we want? It says, read all the files in the current directory using the list method. Well the list method, of course, is on the files, and it will return basically a number of path objects, so we'll just call it that.

And so we will call the list method as it says and in this case, we're going to use the Paths get. And in this case we want to get the current directory, so that looks like we are good. And it's saying that we haven't used the files, yet, so let's go ahead and take care of that.

So in this case the files, now that it is a collection, we can do a forEach. So we're going to loop through each one. And in this case we can use a lambda expression to output each line. And get rid of that.

All right. Looks-- so what is the error we have here? Can't find variable line. Oh. Mainly because in the lambda I named it incorrectly. All right. So there we go.

So if we go ahead and run this, it should get the current directory where the project is and output it. So let's go ahead and run it and see if it gives us what we think. So in this case we have our hamlet text, our manifest. So looks like we have-- one, two, three-- six directories, which are pretty much what we were asked to do before. So in this case looks like we're doing well.

So next we want to do the dir walk class. Right. So I've brought up the dir walk class, and once again we've got some code already written for us. And so we're going to add our try-with-resources, and then print it out, apparently. Although I think this is the next part, so we'll go ahead and comment it out anyway.

So before we get to that, we're going to do a try-with-resources. But in this case it says that we're going to use the files walk method. So instead of the list, we're just going to go ahead and walk, but it gives me the same kind of things. So we can use the same situation, but in this case we are going to use the walk. And in this case we only want a single path, so we are not providing any options.

Ah. Yeah, I need a path there. So paths.get. OK. So in this case their path is the current path. We're going to use the walk to populate the files. And so at this point, we will print them out the same as we did before. So we can use the forEach. And in this case, we're just going to print out each line. All right.

So at this point we have identified that we want the current context, we want all files instead of just directories, and we're going to print them all out. So we run it. Notice that now it has traversed the entire, and so instead of just looking at the top level, now it is walking the entire thing. So that looks good. Print the result, should look like that, and it does.

So the next step is to walk the directory tree and filter the results so that only paths containing "build" are displayed. If you notice down here in the commented section, we have that. So in this case we still have our try-with-resources and that works the same as what we have up there. Now we have our files. We're going to filter so that it only contains "build", and then we're going to print each one out. So here again we can run it.

And so now only those with the word "build" are there including that one. So that works.

Now the last part is we want to edit the dir find class, and in the dir find class we are going to use the files find method to search the directory structure for entries that are directories only. So I'm going to go ahead and remove the comments. And I'm going to create my try-with-resources here.

And based on this, it should be pretty much the same as what we've done before because the only thing we're changing is the method. So we'll call it files equals files. And then we want the find method. But in this case, we want the path, and we've identified that in this case, we want the current context. The maxDepth-- does it tell us? Not really. So let's just go ahead and make up the number. I would say nine would be good.

And then we need a predicate. All right. So our predicate is what is going to give us our option. So let's see. By predicate takes two. Takes two arguments, and what we want is only those that are a directory.

All right. So at this point, for as far as nine levels down, it's going to only find the directories. And so just like what we've done before, we can go ahead and use the populated files class, do our forEach, and in this case it's basically the same that we've done before.

So if we have done this correctly, we should be able to run it, and it will only show us directories. Which it has. So it looks like we have successfully completed practice 14-02.

## 4. Skill Check: Java File I/O (NIO.2) - Score 80% or higher to pass

Skill Check: Java File I/O (NIO.2)

View Skill Check
