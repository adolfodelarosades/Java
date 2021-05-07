# 10: Java File I/O (NIO.2) 

1. Java File I/O (NIO.2) - 6m

## 1. Java File I/O (NIO.2) - 6m
Section nine-- Java file I/O (NIO.2). Question, what is the output? Only inventory.txt exists. The directory another user does not. Answer, so the sample code simply demonstrates several methods that retrieve information about a particular path.

One thing to point out is calls to getName. So getName(0) returns the root directory. GetName(1) returns the following directory. getName(2) returns the third component of the path, p2. So that would be the file named inventory.txt. And getNameCount returns the number of components in the path. So for p2, there are three-- Users, Public, and inventory.txt.

Question-- how do you implement this copy method with methods from the Files class? So this is the same signature that we've seen in the previous section. Answer-- so, here are two ways to do it. The first one uses a copy method that takes two arguments-- a FileInputStream and a path. And the second one is much simpler. It just takes two paths.

Question-- what is the output if you run the following code twice? Assume that inventory.txt exists but output.txt doesn't. Answer-- so in the first pass, the code throws an AccessDeniedException, and in the second pass, the code throws a FileAlreadyExistsException twice. So let's look at the code and see what's going on.

So in the first pass, inventory.txt exists but output.txt doesn't. It first sets inventory.txt as read only, copies inventory.txt to output.txt, deletes inventory.txt. And what's happening is it tries to delete it, but because it's read only, you get an AccessDeniedException. And in the second pass, both inventory.txt and output.txt exists. So when the code tries to copy inventory.txt to output.txt, it throws a FileAlreadyExistsException. Here's the output again.

Assume inventory.txt Arctic the following. So these are produce items that we've seen before. Question-- how do you create a List<Produce> that contains the data in inventory.txt? And the code for Produce is here again.

Answer-- so we could use File's readAllLines to read each line of inventory.txt line by line. Then we take this List, call the stream method, and use a stream API to go through each element and create a new Produce instance from each String.

Question-- what does this code do, and what's the difference between Group 1 and Group 2? So check out the highlighted code at the end of the sample.

Answer-- they both traverse the files in a directory tree, including files and subdirectories, and find files that match the given regular expression or the pattern. After that, they print the number of files that match the regular expression. The difference-- Group 1 keeps on traversing files, even if an exception is thrown, while Group 2 stops if an exception is thrown.

So let's check the sample code. So in Group 1, it calls the method Files.walkFileTree. And a second argument for walkFileTree implements-- or rather, extends-- the class SimpleFileValidator, which overrides several methods that specify what happens if something goes wrong, so if it encounters, for example, a missing directory or is unable to read a particular file or directory. Group 2 calls the method Files.walk. This method is much simpler than using walkFileTree, but you are unable to define the behavior if something goes wrong. Here's the answer again.

So here's a summary of the Java File I/O (NIO.2). So we looked at Paths.get, Files.copy, Files.setAttribute, Files.delete, Files.readAllLines, and the difference between SimpleFileVisitor and PathMatcher.
