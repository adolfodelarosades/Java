# 8: String Processing

1. String Processing, Part 1 - 30m
2. String Processing, Part 2 - 32m
3. Practice 8-1: Parsing Text with split() - 5m
4. Practice 8-2: Creating a Regular Expression Search Program - 5m
5. Practice 8-3: Transforming HTML by Using Regular Expressions - 7m

## 1. String Processing, Part 1 - 30m

Let's go ahead now and get into lessen eight, which of course covers string processing. As you know, folks, strings are important. And they're important in the applications, and of course either Java SE standalone applications or Java EE Enterprise applications.

So let's go ahead and investigate some of the features that are offered by the Java API to process strings. So in this particular lesson, we're going to look at reading data from the command line or searching strains, passing strings, creating strings by using the StringBuilder, looking at searching strings by using the regular expressions, also passing strings using regular expressions, and of course replacing strings by using regular expressions.

Let's look at the command line arguments. Probably many of you have already written Java classes or Java programs of course that have a main method that accepts some command line arguments. So any Java technology application can use a command line arguments.

And of course these string arguments are pretty much placed on the command line to launch the Java Interpreter after of course the class name. Usually we see it this way-- Java, the name of the class, and then of course your arguments, in this case arg1, arg2, and another argument, and so forth.

So each command line argument is placed in the args array, which is this one here, of the main method. And that is passed, of course, to the static main method that you see here. And of course in general these are all pretty much strings that you enter into the, of course in this case, that you will use and pass to the static main method.

Continue with the line arguments. Again, these command line arguments are always passed to the main method as strings, and by the way, regardless all of their intended type. So if, for example, you wanted a different type other than string in your application, then in that case you must implement your application so that it converts those strings to whatever types you want in this case.

For example if you pass an argument to your method and then you want to treat it as an integer, then it might be a good idea to use the "parseInt" method of the integer class to be able to parse our string into an integer in this case.

And here's an example where we have a class called "TestArgs". And this class has a main method as you see here. And of course it has a for loop. That pretty much iterated from i equals zero to-- in this case-- strictly less than the length of the args-- which by the way, it is an array of strings.

And what we want to do here is we want to print in these case the arguments that we are entering. So obviously in this case, if one executes this and pass to it this string and then this number and then-- which is an integer-- and then this double here, then of course what's going to happen in this case-- we'll go ahead and print them-- in this case, the first one exactly the way we want to print them.

Here you will see that arg0 is "Ted Baxter". Second one is "45". And the third one is "100.25". And of course this is some nice feature that we want to, of course, be able to use if we want to pass arguments to-- in this case-- the main method of our class.

And by the way, even on NetBeans you can go ahead and specify the arguments by right clicking the project, clicking on Properties. And then of course when you click on the Run here, you will go ahead and see that you can enter your arguments here, right? And then of course you click OK. And then you're good to go.

All right. Let's go ahead now and continue. And now we want to talk about properties. Well the java.util.Properties is used to load and save key value pairs in Java. So it can actually be stored in a simple text file or in general the file name ends with ".Properties".

And of course the five can be anywhere that the compiler can find. So as long as you specify the pathway where it's located you can go ahead and use it. By the way this properties file is very, very useful. And you can actually use it. Lots of times we use it for localization where we specify localization. Also sometimes you use it for maybe configuration of your application. And the convention for this properties file is usually the file name dot properties. But by the way, this file can have any extension that you want.

Now looking at loading and using a properties file-- well here we have an example in where pretty much we create-- in this case-- a properties object. So we have a main method. And in it we create a new instance of-- in this case-- of new properties and have it referenced to by the My Props reference variable.

And of course in here we use a try block. And in the try block here, what we're trying to do that, of course, ends down here, we open a file relative to the source files-- in this case-- in your NetBeans project. So in this case, we're invoking the constructor of the file impulse stream, pass to it the name of the properties file. And now we get, of course, a file input stream.

And then after that, again, we go ahead and load it on line five by invoking, in this case, the load method, and pass to it the instance or reference to the file input stream, which is represented here by the reference variable called "fis".

Of course, when it is loaded then name value pairs are available to use in your application. And then of course here got you an exception and there is an exception. And here we're printing a bunch of values. For example here we can go ahead and print the server named by passing the host name here to the Get Properties method that is invoked on the My Props reference valuable or to the properties that we defined online too, and the same being getting the user and the password.

So properties' files enable you to easily inject configuration information and, of course, other application data into the application, including-- by the way-- localization. Now we said here, as you see, in the previous slide we loaded that through the load method that you see down here.

You can also-- by the way-- load properties from command line. And to load properties from a command line, in this case that property information can be passed through a-- by using the minus d option to pass the key value pairs. Here is an example where you have Java, and then minus d property name value wherever it is, and another one, of course, and your application.

Again you can also pass one of the previous values that you have here, which is the user. The one that you have seen earlier in the early example, we can now pass it in these case using the minus d option. And by the way, you also have the Get Properties method in this case or the Get Properties-- the data from the system. You can actually have it by invoking the Get Property method on the system class in this case.

And of course in this case we're using, we're passing the user name for that. So the advantage of passing properties from a command line is, of course, the simplicity. It's quite simple. And by the way, we do not have to open a file and read from it. And in general-- again of course-- but if you have more than a few parameters, then a property file would be the idea or the ideal to use.

Let's go ahead now and look at the print writer and the console. Well if you are tired of using System.out.println to print any text to the console, you have an alternative where in this case you can actually create a print writer.

So here's a class called "PrintWriterExample". And in the main method, look what we do. We invoke the constructor, "PrintWriter," passed with the system.out and of course the boolian "true". And this will allow us to create a print writer, that of course here we initialize with it the reference variable, pw, for that.

And then after that we can go ahead and use this print writer and evoke to it println and print whatever we want it to print. So in this example it shows how again pretty much you create the object. And of course the "true" option that you see here-- it is required to force the print writer to flush every line printed to the console.

Many of us do actually know about the printf format. And this printf, by the way-- it is well-known in the C language, right? And of course you can perform any printf format using the-- again, in this case-- string class and any output stream.

And what we see here on the slide is a bunch of different string formatting examples. And if you take a look here, you would see that, for example, in the first one I have a class called "printfexample," has a main method. And here we'll go ahead and create an instance of the print writer.

And then, of course, we declare a bunch of variables here. They're instance variables. One is a double called "price," and initialize it to 24.99. The second one is an integer, quantity initialized to 2. And the third one is a string initialized with the string blue.

And then after that we use the printf. And if you take a look here and use the prints, you will see, for example, this percentage, and then in this case, 03, for example d, and then percentage, s, and all that. So the percentage, s, is used for strings. The %d is for decimal. %f is for float. Of course looking at this particular example, you will see that if you were to run this example, you will go ahead and print the following that you see here. That would be the output.

Let's go ahead and look at this quiz now. And this quiz says which two of the following are valid formatted print statements? They have a, b, c, and d. Of course in a, we make use of the printf. In b we make use of the format. And of course, in c, we make use of the println. And in d we make use of the print.

And if you remember in the previous slide, we said that Java provides many ways to format strings. And we said here printf and, of course, format. And of course, looking at this quiz, the answer would be a and b.

Let's go out and look now at this string processing. Well here what we're going to do is we're going to look at the StringBuilder for constructing string. Again, this does built-in string methods for-- again in this case-- searching, passing, extracting, substrings.

And of course we could also make use if you want to parse a string. Like we said, you can go ahead and use the StringBuilder toward constructing strings. You can go ahead and use a building string methods that are part of the string class that for searching, passing, extracting substring. And also you can parse, by the way, strings using StringTokenizer. So we'll go ahead and look at these in the next-- of course-- slides to just show you how we can handle string manipulations.

Looking at the StringBuilder and StringBuffer. Well the string builder and string buffer are the preferred tools when, again, the string concatenation is nontrivial. So these StringBuilder and StringBuffer are way more efficient than the concatenation as operator plus.

And of course in terms of concurrency, remember one thing, folks-- that the StringBuilder is a non thread safe. And the StringBuffer is a thread safe. And you can set the capacity to the size you actually need in this part. So the only thing that we want to-- again-- advise you about or warn you about is that constant buffer or sizing can also lead to performance problems. So you've got to be careful with that.

And let's look at an example of the StringBuilder. So here's a very nice example where, as you see here, we have a class called "StringBuilder". It has a main method. And then down here we'll go ahead and create in this case, a new instance of StrinBuilder of size 100. And that's referenced by the reference variable sb.

And then to it we are going to append what? We're going to append the string, comma, space, and then "the lightning flashed," and the number, "and the thunder rumbled". This is d, of course, the string that we are passing. And by the way there is a backslash n, which means what?

The new line.

The new line. And then after that, look what we do. We can now use the insert method of the StringBuilder, and of course parse to it zero, which has specifies what? The index, the position. And we want to, of course, in this case insert this string. And then after that, we want to go ahead and append an appending, in this case this string with a backslash n.

And on it we'll append also the open square bracket space and then use the for loop to iterate through numbers 1 through 10 in this case. And inside every time we append the number, we'll go ahead and append it with a space. And then at the end, we'll go ahead. And once we finish the loop, we'll append that with closed brackets, and then space, and then times.

And then after that we'll go ahead and print of course. That will pass that StringBuilder. And of course we invoke on it also the two strings. So if you take a look at this, you will see that the output would look like this. So this is what we appended at the beginning, right? This is because of this statement here.

And then the comma, space, and then this one all the way and then the new line. This is because of the first one here. And then this one here, "the lightning struck"-- that starts here, and of course ends all the way down here. And that's exactly what you print. Everybody's following?

Good, good, good, good. Continuing with that and looking at a sample string methods. Well of course here we have a class, also an example of a class has string methods example. It has a main method. And of course, in it we'll create a new print writer, "system.out," and pass through the "true". We already know about that.

So and in here we create a couple of strings, tc01 and tc011. It says "it was the best of times" string. And the other one, "it was the worst of times". And then here in the "if" statements, we'll go ahead and use the equals.

So the equals, by the way, is useful. And we've seen that earlier, folks. And it's useful for what? Anybody? To compare what?

The contents.

The contents of objects. How about if you want to compare the references to the object? What do we use?

The operator.

The operator equal, equal. Good, good, good, good. And of course to test the equality of the contents of the two strings using equals. And of course this is preferable to the equal, equal, which by the way, tests the two objects if they point to the same reference.

So of course if these are equal, then print this or otherwise check if tc01 contains this string. It was. Then go ahead and print. It was found. And then after that we'll go ahead and use the replace method that is going to replace in tc02 string here, a w with a zw. And of course, after that we'll go out and print this string that we created here on line 11. And then at the end of host in this case we print a substring between-- of course-- that is going to start from location five and ends at what? R12.

So we know that contains searches string to see if it contains this string provided. Or a place searches for the string provided and replaces all instances with the target string provided. Again there is a replace first method for replacing only the first instance. And of course substring returns a string based on its position in the string.

So obviously the return, again, would mean when you run if you run this program-- so what's going to give you as an output is going to give you this. It was found because we know that it was exist in the string tc02. So that's good. And so we have it here. And then, of course, after that and we have printer lan takes you to a new line. And then down here we want to replace the w by zw and then print it out.

And then we save it into the temp string and then print it out. And that's why we now see this and now the tc02-- that has changed now, and became the temp, which now dw is replaced by zw. And of course, after that they want us to print a substring that started at five.

Location zero, one, two, three, four, five. So it starts at five. That's s. And then five, six, seven, eight, nine, ten-- in this case-- eleven, twelve. Twelve is up to the w. That's exactly what it's going to, in this case, print out. And that's why you see this. Everybody follows? OK, good.

Continuing with that, let's look at the split methods. Split method is quite interesting too. Well here's a very nice example that we have here. We have a class called "StringSplit". And it has a main method. And we declare here, in this case, a string called "shirts," reference variable "shirts". And we initialize it with this string here. That starts with "Blue shirt," comma, space, "Red shirt," comma, space, "Black shirt," comma, space, "Maroon shirt".

And then down here look what we do. We invoke the split method then you pass to it comma, space string. So in this case, of course, we say that the split pretty much is one of the simplest ways to pass a string. And of course we call the method with the character or characters that will split the string apart.

And of course the result will be captured into an array. And then, of course, after that, that array will use the advanced for loop to iterate through that array and, of course, print every token over there. So what we're doing in this case is the delimiter here that we're using in this case is comma, space.

So that's why it prints the first one. And then it hits the comma, space. And then it prints the second one. And then hits the comma, space. Print the third one. And then hits the comma, space. And then prints the fourth one. And that's why the output looks like this. Everybody see that? OK, good.

Continuing with that. And now let's look at parsing with StringTokenizer. Well we have a class here called a "StringTokenizerExample". It has a main method. We'll go ahead and declare a string "shirts," initialize it with a string that you see here on line three. And then down here look what we. do.

We'll go ahead and create a new instance of StringTokenizer, and pass to it the string, "shirt," and then what? And the comma and the space string here. And that would be my instance referenced by the instance reference variable called sd, which is of that StringTokenizer. And then here I use the "while" loop. And then I say, of course, yst dot has more tokens. Go ahead and print st next token.

We turn out, folks, that the StringTokenizer class does also the same thing as split. But it does it in a slightly different way or different approach. Again, in this case, we must iterate the tokens to get access to them. And in this case, the delimiter is that we represented here, which is comma, space. And in this case what does it mean?

Well it means that we use both commas and spaces as delimiters. So that's why now this "blue," and then space-- there is a space here. So that will be a delimiter. And then this one is a delimiter. Then this one is a delimiter, OK? This one is a delimiter, and so forth.

So you see now if you take a look at this and you see what's the output of this example, you will see that it will be the list of all those words that you have in this case in the string separated by either, what? Comma, or? Space. Right? OK. And that's what you get. Yes.

How is it either comma or space? So it just takes [INAUDIBLE]. So it takes both comma and space as one delimiter?

Yeah, exactly. And then, of course, whenever it hits the space, it does that. Whenever it hits comma, space does that.

So will just the comma by itself? It will take that too?

Mmm hmm, sure.

Is there an [INAUDIBLE] to this [INAUDIBLE]?

I'm sorry.

[INAUDIBLE]

Yes.

You are roviding the limiter here. So two delimiters there that have been provided here. One is a comma--

One is space, yeah.

So is it taking an array of delimiters?

Yeah, of course. That's what it does. It typically takes an array of delimiters, yes. And you know delimiters can be strings, can be characters. You could choose anything you want. Continuing with that, let's look at scanner. How many of you have worked with scanner? Anybody worked with scanner class? OK, good.

So a scanner class is also very useful if you want to tokenize an input stream or a string. So again lots of times some folks use it. And a scanner, by the way, can be used to tokenize numbers and convert them into any primitive number type that you want to work with it.

So let's take a look at this example. We have a main method. In it we declare a line to, a reference to, an instance of type scanner. And then on line three, we'll go ahead and create a StringBuilder of size 64 referenced by the sp reference variable.

Then in line four, we'll go ahead and declare a string and initialize it with the string on the right side that you see here. And then on line five, we'll declared a float and initialize it with 0.0. And then look on line seven what we do.

On line seven we'll go ahead and create a new instance of the scanner. We'll pass through it line 0,1. And then we invoke on it the use delimiter. Well in this case, it's going to do what? It's going to go ahead and use the delimiter, which is comma, space. Everybody see that?

And then within the try block that you see over there, we'll go ahead and use that scanner, referenced through the scanner, s. And, of course, if it has next float, go ahead and grab that next float. And save it in this float, f. And then, of course, what we do is we add that float to the sum. The first one will be 1.1 added to the sum. That's 1.1.

And then, of course, after that, what we do? We now take the reference to the StringBuilder and invoke append to append f to it, and then append the space. And then, of course, after that we'll go ahead and print the sb, that which is the StringBuffer, in this case. And that's why you get as the output this one here.

And then, of course, after that you will go ahead and print the sum. And that would be the sum of 1.1 plus 2.2 plus 3.3. And then of course this would be the sum. Everybody sees that? So what's the advantage of using a scanner to tokenize a string or a stream? What is it that is interesting here?

In addition to the tokenization, what does it do also? It converts them into what? Any primitive number type that you want. Everybody's following, folks? OK, good, good, good, good, good, good.

What is this extra form there?

Say it again? Why there is in the f sum [INAUDIBLE] 6.6?

Oh, that's just a calculation by, again, the interpreter in this case, or Runtime. This is what it gives you. So lots of times when you're doing computation, it depends on the precision that you are trying to use. Good.

## 2. String Processing, Part 2 - 32m

Now what we want to do is take a look at regular expressions. A regular expression is pretty much a language for matching strings of text. And of course, they work with a very detailed vocabulary. And they help us search, extract, or search and replace. And of course, with Java, the backslash is no fun.

And what we're going to do is we want to use a bunch of objects, these Java objects, which are Pattern, Matcher, PatternSyntaxException, and of course, the java dot util dot regular expression, which, by the way, is the one that uses, typically, regular expressions. How many of you have used regular expressions before? They're quite interesting.

So let's go ahead and look now at the couple of classes here, in this case, Pattern and Matcher. What does Pattern do? Well, Pattern and Matcher objects, they work together to provide a complete solution. Pretty much the Pattern object defines the regular expression that will be used for the search. So as you see here, we have in this class called PatternExample, and we have a main method, we first declare a string "t" and initialize it with a string "It was the best of times."

And then down here on line 9, if you take a look over there, you see that we are, first of all, declaring a reference variable of type Pattern called Pattern. And of course, we, in this case, assign to it the invocation of compile method and pass to it, in this case, the string "the." So you see that, in this case, in this example, a regular expression can be as simple as just a word or phrase.

Here, again, it would be this string here, or a word, that says "the." And then, of course, remember that the Matcher object is then used to select what? The target string to be searched. So again, in this case, a number of methods are available in the Matcher. And we'll see them in the next slide.

But here, what we're doing here is we'll go ahead and now create a Matcher. An a Matcher, in these case, is specifying the target string that is going to be searched. And in this case, it is what? It is this string, "t." So what we're trying to do here is we're trying, of course, in this case, to find the Pattern "the" inside the string "t." Everybody sees that? OK.

And we do that using this fine method. So within the if statement here, we say, if matcher.find, then of course, this is true, we'll go ahead and do what? Print "Found match." So of course, in this case, what it's going to do, it's going to take this Pattern and find out if it exists in this one.

It turned out that the find method is going to look, it's going to start with "it" and all that. But at some point in time, it's going to find it. And that's why the output will be what? "Found match." And that's why you see it here. Everybody sees that, folks? OK. Good.

Continuing with that, let's go ahead and look now at the character classes. So if using the dot character, what does it mean, ladies and gentlemen? What it means is that it matches any single character, letter, digit, or a special character, except end-of-line markers. So again, it matches any single character, letter, digit, or a special character, except the end-of-line marker.

How about if you have, like for example in this case, abc between square brackets? What does it mean? This would match any a, b, or c in that position. How about if we want to use the caret sign in front, in this case, same, but you have a caret sign in front? What does it mean? Again, it would match any character that is not a, b, or c in that position. Everybody's following that?

And of course, here, the next one is between the square brackets, we have a-c, which means what? It is a range of character, in this case, a, b, and c, which ranges, by the way, from where? A to c Included, right? And then, of course, this pipe sign, or vertical bar sign, it is pretty much an indicator of what? an indicator of "or." So character classes enable you to match one character in a number of different ways. So far so good?

And by the way, for those who are looking at it for the first time, it might be a little bit-- you might always to refresh your mind. Maybe you forget about what does a particular character mean. So it's OK to look it up and find out about that.

Continuing with that, we see an example here where the target string, in this case, is "It was the best of times." And then the Pattern, if we have the Pattern a.s what does it mean? It means that any sequence that starts with a w followed by any character, followed by s. And for example, here, we found that it is, in this case, the word "was." And of course, if you have a w, and then followed by characters that could a, b, or c, and then an s, then of course, that would be the same thing. It would be this one here.

And then of course here, we have a t, and then, in this case, between square brackets, we have caret, a, e, o, and then we have m, e, s at the end. So of course, this would be any sequence that starts with at t followed by any kind of character that is not a, not e, and not, of course, or o, followed by the letters m, e, s. And of course, that will find you "times."

And by the way, we have an example about that on NetBeans, just to specify that. And you folks can actually take a look at that later on. And let's go ahead and then look at that just as an example. So this is called CustomCharClassExample. Let me go ahead and look at it. And here it is.

And you see, pretty much, it's an example that has main method. It has, of course, the string. And then, of course, now what we want to do is, first of all, we compile the Pattern, right? And then we create the Matcher, which is, in this case, the target, which is t.

And then we'll go ahead and use the find method. And of course, if it's printed, we'll go ahead and use that. Of course, we have the group here. In a couple of slides, we'll see that.

So if you run this, and of course, the same thing if you follow this one here and then follow this one here. By the way, when I run this, you will see the output. And of course, as you see here, pretty much the m group allows you to actually print, in this case, the Pattern.

Then, of course, in this case, we found a w followed by any character by s. Here, a w followed by a, b, or c, by s. And then, of course, down here a t followed by a non-e, non-o, non-u, and of course, followed by m, e, s. And that's what you see over there.

How do you specify a space?

We'll look at that in a few slides. So let's wait a little bit. And we'll look at all of that in a couple of slides. So far, so good? Everybody's following? So we'll get to see that in a few slides.

And here's the example that I just showed you, where, of course, in this example, it will print twice "was," and of course, and "times" once. Again, to match this, or to make this happen in Java in general, we create a Pattern object to store the regular expression that you want to search with. And we already did that. And then after that, you create a Matcher object by passing the text to be searched to your Pattern object and returning a Matcher. So we did that.

And then after that, we'll go ahead and call a find to search the text with the Pattern you defined. So we've seen this here, we've seen this here, and we've seen this here. And then, after that, you call the group method to display the characters that match your Pattern. And that, in this case, would be the ones that you found, which is what? "Was" and what? And "times."

Speaking of what Majid just asked, here's the slide that actually covers also how we represent, in this case, a white space. So here, we have predefined characters.

The backslash d is used for digit. And that, of course, the character class be zero through nine. And by the way, the backslash capital D means what? Non-digits-- non-zero through nine. And then you have the backslash w, which stands for what? A word character. And that would be either lowercase a through z or capital A through capital Z, or zero through nine.

And then, of course, the capital W means what? None. And you see how we see the underscore here? That's because lots of times, in our names, we use that underscore, right?

So underscore is included in--

Included, yeah. And speaking of what, again, Majid just asked earlier, how do we represent a white space? Well, white space is represented through what? Backslash, lowercase s. And by the way, here you can have, actually, either a backslash t, which represents what?

Tab.

A tab character. Backslash n represents what? A new-line character. Backslash r represents what? Carriage return. Backslash f represents what? A form feed. And backslash x0B represents what? A vertical tab. Good. And of course, the space is represented here, right? OK, good. Everybody's following, folks?

Continuing with that, let's look now at some predefined characters. So let's assume we have all character class. We have, Jo told me 20 ways to San Jose in 15 minutes. So again, here, we have the Pattern that you see here that represents, again, find any two digits. So that would be this one here, for example. And then, this one here, which is the backslash s and "in."

So again, this is find "in" surrounded by two spaces. And then the three characters here, it's this one here, which is, in this case, surrounded by two spaces. And then here, we have the backslash capital S. Capital S means what? It is now surrounded by two characters, but they are not what? They are non-spaces. That's why you see this.

And by the way, we have an example here. And this example is called Predefined Character Example. Let's go ahead and look at that in NetBeans. Predefined-- so here it is. And you see pretty much the example that we just have done.

And of course, you see how here, we're look for the two decimal numbers next to-- exactly what we were saying in here-- two digits next to each other. And then after that, the "in" surrounded by two spaces and the "in" surrounded by a non-two-spacer. And of course, if we run this one here, this is what you get, exactly what we were just discussing earlier.

Continuing with that, let's go ahead and look at now some quantifiers. These are also used in regular expressions. Let's go ahead and look at these quantifiers. And we start first with the asterisk. OK, what's that? What does it mean? It means that the previous character is repeated zero or more times.

And plus means what? The previous character is repeated one or more times. And the question mark means what? The previous character must appear once or not at all. Once or not at all, which means what? Zero or one. Good.

And then here, between curly braces, you have n. What does it mean? It means that the previous character appears exactly n times. And how about curly braces, and you have m, comma, n. What does it mean? The previous character appears from m to n times. So if you have two to five, it means what? It appears two to what? How many times? Five times.

And then here, you have m, comma, space. What does it mean? The previous character appears m or more times. And then here, you have, again, some xx between parentheses. And then, in these case, the n between the curly braces. This group of characters repeat how many times? n times. So this group of characters repeat n times.

Quantifiers enable you to easily select a range of characters in your queries. Let's look at this example. Here, we have an example. And of course, the target here these is, Longlonglong ago, in a galaxy far far away. Well, let's look at this here. Ago, dot, and star.

So now, we can have-- a dot means what? It means what? It means any character, right? Any single character. And then the star means what? Zero or more. So here, we say, find Ago, and then zero or all the characters remaining on the line, right? And that's why we see this.

And then here, we have gal.(3). What does it mean? It means it matches gal string or Pattern, plus the next three characters, in this case. And of course, this replaces the dot, dot, dot that we've seen earlier. So in this case, it will be gal and then the next three characters, which are a, x, y.

And how about this one here? Find long that repeated how many times, folks? A long with lower case l. So that's why, if we look at it, we find all of this. Again, there is an example related to this, if you are on NetBeans, that's called QualifierExample. Let's go ahead and look at that. QualifierExample. And here it is.

And pretty much, you will see that this, again, has the string here. We create a Pattern, in this case. And then we'll go ahead and try to match it against the Matcher here and of course, print it if it exists. And then the same thing here. We now create another Pattern here.

And we do the same thing, and we create another Pattern here, and we do the same thing. So of course, if you run this, folks, you find exactly what we just said, Ago, and then, in the galaxy far far away, and then galaxy, and then longlong. Everybody follows that? Good.

Continuing with that, ah, this is interesting. This is interesting, folks. This is called greediness. Let's understand the concept of greediness. Well, a regular expression always tries to match the characters that return the most characters all the time, all the time. And of course, this is typically known as what we call the "greediness principle." So we all know that a regular expression always tries to grab as many characters as possible.

Now, when we use the character question mark, which is the operator question mark, we use it to limit the result to the fewest characters needed to match that Pattern. So let's go ahead and look at how we actually use this. Let's look at an example.

The target string, by the way, folks, here, Longlonglong ago, in a galaxy far far away. So if we have this Pattern-- let's take a look at this carefully, folks-- ago.*far. This is a regular expression that always grabs the most characters possible. It starts with what? Ago, any character, and then what does star mean?

[INAUDIBLE]

Zero or more. And then far finishes with what? Far. But then here, we try to grab as many characters as possible. That's why it starts from ago and finishes what? It does not stop here, but it goes all the way down, as much as we can. We got that? Everybody's following?

On the other hand, let's take a look at the second example. This one here is ago.* and then a question mark operator. So what does this question mark operator mean? It means that question mark character essentially turns off the greediness, which means what? Grab the fewest characters needed to match the Pattern.

And here, the fewest characters to match the pattern is the first five that we hit. The first five that we hit, right? So that's, again, what we say. We say here, we are turning off the greediness. Everybody follows that, folks? Good.

And by the way, we have an example about that. It's called GreedinessExample on NetBeans. Let's go ahead and look at that. And here it is. So pretty much exactly what we have seen on the slide as an example, except now it is put in the form of a class. Class is called GreedinessExample. In the main method, we declare a string and initialize it.

And then we'll go ahead and build a Pattern here. And to compile a Pattern, the same here, we'll go ahead and create a Matcher. And then, of course, we use the find method to find out if it exists, and of course, print it out if it exists.

And the same thing with the second one. And of course, folks, if you run this file, what going to happen? It's going to give you exactly what we have seen on the slide. Good. Everybody's following, folks?

So regular expressions are very, very powerful. Let's look at this quiz. Which symbol means that the character is repeated one or more times?

Plus.

Plus. Thank you. Good job, Bea. Let's go ahead and look now at boundary Matchers. Well, boundary characters can be used to match different paths of a line. So we have the caret, and that matches the beginning of a line. We have a dollar sign, which matches what? The end of a line.

We have the backslash b, which matches the start or the end of a word. And we have the backslash capital B, which does what? Does not match the start or the end of a word.

Let's look at examples related to what we just looked at the previous slide. So the first one, we have caret it, and then dot asterisk and the question mark times. What does it mean, folks? It is the sequence that starts a line with I-T-- it-- followed by some characters and times with the greediness, of course, what? Off. So that's why it starts it, and then of course, It was the best of times. And then it stops here.

And then how about if we now use this one here? First of all, backslash s means what, folks?

Space.

Space. Thank you. And then it.*times, and then, of course, here, we have the dollar sign. And by the way, the dollar sign stands for what?

Ends with.

OK, good. Ends with. So now, we say the sequence that starts with "it," followed by some characters, and ends the line with "times." And of course, in this case, would be this one here, because we have a space in front of it, right? OK, good.

And then down here, we have the backslash b. And by the way, backslash b means what?

[INAUDIBLE]

We can always refresh our minds. Matches the start or end of a word. Like I told you, if it's fairly new to you, it's OK to look it up. And of course, we have "or" and then backslash B dot 3. What does it mean? Find "or" surrounded by word boundaries plus what? The next three characters. And then, of course, here, it would be what? "Or" and then the next three characters, space, "it." Got that?

We actually have an example of that on NetBeans that pretty much matches what we're doing here. And that's called the Boundary Character Example. Let go ahead and look at that. Boundary Character Example. Here it is. Now, you folks can take a look at that later on.

And you'll see that, pretty much, we have a class called BoundaryCharExample. We declare a string and initialize it. And then here, we create a Pattern, the one that we've seen on the slide, and a Matcher, and of course, try to find it. And the same thing with the next one, and of course, the third one. If you run this file, you'll find exactly what we have seen on the slide, right? OK, good.

Of course, we have a quiz here. And this quiz says, which symbol matches the end of a line?

C.

C. Thank you. Good job. Now, let's look at matching and groups. So here, the target, by the way, string is what? This email, george.washington@example.com. Again, here, we tried to match the three parts, which is what? George and then Washington and then example.com. We can actually group these into calling the first one group one, two, and then the third one three. And of course, here is the Pattern that you're following.

By the way, backslash capital S means what?

[INAUDIBLE]

Good. So again, with the regular expression, you can use parentheses to identify part of a string to match. So like here, for example. Again, this example matches the component parts of an email address. And as you see, we can see that every pair of parentheses is numbered, one, two, and three.

So in a regular expression, by the way, when you see group (0), what does it mean? Group, and you pass zero to it. What does it mean? It means it matches all the text matched when groups are used. And we have an example here called the MatchingExample. And this is pretty much trying to match what? The email.

So we have the MatchingExample. We have a main method. Here's my string representing the email. I go ahead and create a Pattern. Here's my Pattern. So as you see, in this case, starts with no space. Again, in this case, a plus and question mark means what?

[INAUDIBLE]

Question mark does what? Turns off what? The greediness. And plus is one or more. And the dot, again, is the dot that we have here. And then the at is the at that we have over there. And then, of course, the other ones are the same.

So first of all, we could create a Pattern, p1. And then we create a Matcher, which is email. That's this string here. And then after that, we use the find. And we use the find, first, we print group one, which represented the first one. And then the second, group two, and then the third one, group-- and then after that, when we print group zero means what? Print everything, right?

Let's going and see this. It turns out that it's an example on NetBeans. Let's go ahead and see that. It's called MatchingExample. And here it is. So we'll see it's exactly what we have seen on the slides.

If you run this one here, this file, you will see that it returns, see, first one, group one. And then the second one, and then the third one, and then, of course, if you now want to print group zero, it will print the whole thing. Got that, everybody? Good.

This is also interesting. Using the replaceAll method. Well, usually, just by looking on its name, pretty much that summarizes it. And that explains it. So we can do a search and replace by using the replaceAll method after performing a find.

So let's take a look at this example where we have a class ReplacingExample. It has a main method. We'll go ahead and declare a string called "header" and initialize it in some HTML code. You see that? This is HTML.

And then here, we'll go ahead and create a Pattern, h1. And then we'll create a Matcher, in this case the target, which is the header, which is this string here. And then we'll use the find method to try to find it. Whenever we find, again, the Pattern here, we say m1.replaceAll, and it's going to do what? It's going to replace all the h1s with what? With p. And then, after that, we want to print it out. And if we print it out, this is what it says.

So if we take a look at this example, ReplacingExample-- should be down here. We should find it. And pretty much shows us exactly what we have on this slide. So if we run this, obviously, it's going to give us exactly the output that was stated on the slide. Everybody's following, folks? Good.

Continuing with that, now, we just want to somehow, again, finish by summarizing this module, which is quite interesting, really, looked at very, very nice features and constructs from Java that allow us to manipulate and process strings. We looked at reading data from a command line.

We looked at searching strings. We looked at passing strings. We looked at creating strings by using a StringBuilder. We looked at searching strings by using regular expressions. We looked at parsing strings by using regular expressions. And we looked at replacing strings by using regular expressions. Any questions? So far, so good? Of course, we have a--

Are all these SE 7 features?

No, actually. These features, they exist from SE 6. And looking at the practice labs, we have also some interesting practice labs that are very, very nice, and of course, illustrate exactly what we learned in this particular lecture. And Practice 1 pretty much covers the split method.

So you are going to use the split method of the String to parse the text. The second one creates a regular expression search program. The third one, transforming HTML by using regular expression. And of course, if we want to look at it on the activity guide, we start by-- and by the way, every practice has its summary level and detailed level.

So it all depends what you folks want. You can use the summary level if you want to do the practice directly. Or if you want more information, you can use the detailed level, and that gives you more information and more code to do your practice, your lab.

And in Practice 2, again, where you're creating a regular expression, we have the summary level version of it, if you want to use this and you're comfortable to use this. If you want more, again, details, you can use the detailed level, and that gives you more information to be able to do your practice lab.

And the third one, the same thing, Transforming HTML by Using Regular Expressions, will give you a summary level. If you're comfortable, you can go ahead and use that. Otherwise, you can go ahead and use the detailed level, which gives you more information to do this particular practice lab, which, again, in this case, are related to the same topic, which is Transforming HTML by Using Regular Expressions. So we'll go ahead and do these practice labs, and then after that, when we finish, we get into the next lesson. Thank you.

## 3. Practice 8-1: Parsing Text with split() - 5m

After looking at Lesson 8, which covers string processing, where we discussed reading data from a command line, searching strings, parsing strings, creating strings by using string builders, searching strings by using regular expressions, parsing strings by using regular expressions, and replacing strings by using regular expressions, let's go ahead and look at the practices for this lesson, 8. And we'll start with Practice 1, where we look at the detail level.

In this practice, we parse the comma-delimited text and convert the data into Shirt objects. Again, we've been given some comma-delimited Shirt data. Parse the data, store it in a Shirt objects, and print the results. Again, the output should be looking like this here.

So first, we opened the StringPractice01 project. In it, we have a class called StringSplitTest.java. It has a main method. We parse every line of the Shirts array.

Again, create a Shirt object for every line and add the Shirt to a list. Again, we used the enhanced for loop to, in this case, iterate through the strings. And of course, that represents Shirts.

And in this case, we'll use the split method that is invoked on the curLine, which is the instance of, in this case, the elements of these Shirts, or the array of strings, Shirts. And, of course, we split them through the comma. And then, after that we'll go ahead and add to the Shirt list, which is an ArrayList that we're going to create, a new instance of Shirt that represents E0 for, again, in this case, the ID, e [1] the name, e [2], the color, and of course, e [3], the size of the Shirt.

After that, we'll go ahead and print that using an enhanced for loop by, in this case, calling the two-string method on the Shirt instance, and pass that to the printer line. Let's go ahead and see that in the next beans.

Here's pretty much, in this case, the Shirt class. So we kind of have-- we are familiar with it. It has an ID, description, color, and a size. It has a couple of constructors, a bunch of getters and setters methods. And of course, it has this two-string method, which is overwritten.

And for the String Split Test-- that's where in the main method we first declare a Shirt as an array of strings and initialize it with a new instance of the string array of size 11. And then, we declare a string list and initialize it with a new instance of ArrayList of size 11, again, of type Shirt Generics. And then, we initialize the different elements of the Shirts array with these strings representing the Shirts. First is ID, then the name, then the color, and then the size.

And then, we use an enhanced look where-- this enhanced look, we iterate through the Shirts array. And for every element, we'll call on it the split method and parse through it the comma. And then, after that, we'll call the add method on the Shirt array and parse through it the new instance of the Shirt. Then, we parse through it the e [0], e [1], e [2], and e [3], where e [0] represents the ID, e [1], the name, e [2], the color, and e [3], the size.

And then, after that, we'll go ahead and print those Shirts by using an enhanced for loop. And of course, we call the two-string method on the reference variable to the Shirt, and of course, pass all of that to the printer line. So if you right click on this, and run it, you'll see the output that, of course, will give us the same output that we've seen in the Activity Guide where it lists the Shirts that we built from the different strings that, of course, we processed in this case.

And that pretty much ends Practice 1 of Lesson 8. Thank you.

## 4. Practice 8-2: Creating a Regular Expression Search Program - 5m

Let's look now at practice two of lesson eight where we create a regular expression search program. In this practice, we create a program that searches a text file by using regular expressions. And we create a simple application that will look through a text file and search for a text by using regular expressions. If the desired text is found on a line, print out the line number and the line text. For example, if you perform a search on the <h4>, the output would be what you see over there.

So the task here is to open the [? StringsPractice02 ?] and again make a bunch of changes. Again we should note that the code to read the file has been supplied to us. It's the file gettys.html which is located in the root of the project.

So we go ahead and edit the FindText and create an instance of the Pattern and the Matcher object that we see over there. Outside the search loop, we'll go ahead and initialize the Pattern, in this case with for example over there is <h4>. And then inside the search loop, we'll go ahead and create a Matcher based on the supplied pattern object, like we've seen over there on step four.

And then inside the search loop, we search every line for the Pattern supplied. Print the line number and the line that has the matching. That's like we show you here on step five. After that, we are on the FindText again and search for the Patterns. The first one, for example, that they see, all the lines that contain <h4> and so forth.

So let's go ahead and take a look at this class called FindText. First of all, we declare a string called fileName and assign to gettys.html. And then we declare an instance of a Pattern and declare also an instance of a Matcher. In the main method, we'll go ahead and create a new instance of the FindText. And we'll reference it by the reference variable find. And then it will invoke the execute method that we see here.

Here we decide about the pattern and we invoke the compile method and pass through it with this pattern here. Within the try, a block will go ahead and create a new instance of the reader buffer by passing through it the new instance of the FileReader and pass through it the fileName. Declare a string called line, initialize it with an empty string, declare a variable of type integer, initialize it with the one, and then within the while loop, we'll go ahead and read the line.

And then, of course, after that, we go ahead and invoke the Matcher method, pass the line to it, and use it to initialize an instance of the Matcher m. And then, of course, assign it to m. And then we'll go ahead and invoke the find method and do a println in this case by printing the line number and of course in implementing C++. Catch an exception: if there is an exception here, it would be the FileNotFoundException or the IOException. OK?

So let's go ahead and run it first. Run this program using this pattern that we see here. And of course let's not forward slash anything. And then after that is greater than sign. If we run this, of course, we see that in our case here- Rather, I should be running the FindText not the other one.

So if I run this, of course, I find the lines 18, 26, 27, and 28, which makes sense. Now let's go ahead, in this case, comment this and comment this one here. And then, of course, in our case here, we'll go ahead and run the file. But this time we're looking for the pattern <h4> again, which is in between less than and greater than signs. It's going to run that. And as you see when you run this, we find that it's line nine and line 10 in this case.

And that pretty much ends the practice two of lesson eight. Thank you.

## 5. Practice 8-3: Transforming HTML by Using Regular Expressions - 7m

Let's look now at Practice 3 of Lesson 8, or which by the way covers transforming HTML by using regular expression. In this practice, we use regular expressions to transform the less than <p> greater than tags into the <span> tag. From the <p> tags to the <span> tags.

Again, we have decided that you want to change the formatting of the gettys.html file instead of using a <p> tag, a <span> tag should be used. In addition, you think that the value for a class should be "sentence" instead of "line."

Again, use regular expressions to find the lines that you want to change, then use regular expressions to transform the tags and the attributes as desired. These transformed lines should be output to the console. Again, the output should look like what we've seen here.

So one approach to the problem could be to break the algorithm into three steps. Break the line into three parts, the start tag, the content, and the end tag. Replace the content tags with the new tag, replace the attribute value with a new attribute value. Again, then return the newly formatted line.

The method signatures to replace the tag and attributes might look like the one that you've seen here. And, of course, a replaceTag, this is the replace method. And this is the replaceAttribute method.

So the tasks in this case is to open the project which is called StringsPractice01, and make a bunch of changes. We should note that the code to read the file has been supplied to us. So again, edit the SearchReplace.java, and create a pattern object to match the lines that you see here.

And then as again we loop through the file, again we create a matcher to match the current line that we've seen over there on step three. Execute the find method to find a match. If there is a match, replace the start and the end tags, replace the attributes. Again, we see that the way it's done here through the code in step three.

OK, then after that we create a method that will replace the content of any tag. And we see how it's again specified here in step number four. replaceTag, that takes again a tag, a stringTag, targetTag, and of course replaceTag. And we work the compile method on the pattern past the targetTag.

And of course we work the matcher method on the pattern, and pass the tag to it, that'll get us a matcher. Then use the find method when if statement, and of course return in this case by calling the replace first method on the matcher instance, and passed with a replaceTag. And of course return the replaceTag.

After that, we create a method that would replace a tag's attribute, and that's called replaceAttribute. That takes a tag, an attribute and a value. And in this case, it calls the compile method on the pattern.

And of course, the matcher method on the pattern, in this case, pass the tag to it. And call the find method within the statement and return the replace first. In this case, invoked on the instance of the matcher and pass through it in the attribute in this case and run it.

So if you take a look here you will see that pretty much here's the SearchReplace method that we discussed here. And as you see here, we used the file in the main method, we created an instance of the SearchReplace and then within the run method that's where first we'll go ahead and create a BufferedReader.

And after that we declare the targetTag, end replaceTag span and the attribute class and the value sentence. And of course we declare a line initialize it with a sting in this case, of course. Declare an instance or a variable of type so you can initialize it to one.

Core the compile method on the pattern, and then of course passed with on the pattern class. Pass through it again in this case in our case here of course this string here representing again this case, and then the target tag and this string here, and then the target tag and this string here. You see?

After that, we go ahead within the why local reader line and call the matcher method on the pattern one, and pass through it line and use it to initialize the instance of the matcher and use the defined method on the matcher. And then call the replaceTag method, and that will get us the newStart. And then call the replaceAttribute against the newStart.

And of course in this case call the replace tag and that gets the newEnd. Of course after that we'll go ahead and use the newStart. And with the again calling the group method passed through to it on the end and then the newEnd, that would be on my new line. Print again the new line increment C and catch an exception if there is an exception.

A replace tag is the method that we've seen similar to what we've seen in this case, of course in the activity guide. The same thing with the replace attribute. And then of course now what we are going to do is run it.

And if you run it, you see how we replaced again in this case a span. And we see the span in the sentence that appear now in the HTML text. And that, of course, with this ends the Practice 3 of Lesson 8. Thank you.
