# 1: Introduction

1. Introduction Part 1 - 2m
2. Introduction Part 2 - 3m
3. Java Basics - 23m

## 1. Introduction Part 1 - 2m

As a software developer you might ask yourself why you should choose Java over some other programming language or platform. Java, by most any measure, is the number one programming platform in the world. A variety of surveys come out about different programming languages, and Java is almost always at the very top, or if not at the very top, then it's very close to the top.

And it's been very consistently at the top over the past several years. Java is 20 years old now, and it's at the peak of its game. It's not slowing down at all. The popularity of Java is probably as high as it's ever been, and there are 10 million Java programmers out there. And the reason for that is that there's huge demand from businesses that need software development.

And when they need software development, they know that Java programmers-- there are a lot of Java programmers out there, and they can find the expertise that they need. So if you're looking for a programming job, then Java is clearly the place to begin. And the certification programs that are offered give you a leg up as a software developer against other developers out there, if you have that certification.

## 2. Introduction Part 2 - 3m

Hello. My name is Vasily Strelnikov. I'm a senior principle training consultant working for Oracle for the last 20 years and I'm about to present to you Java Programming 1 Certification Preparation Workshop.

Well, let's take a look. This should be exciting.

First of all, kind of a quick word about why it's worth to get Java certified. Let's suppose it's a self-confidence thing. You just kind of prove that you do understand the concepts of Java and be able to work with it.

But there's a massive community of people out there who are certified in Java and that's the market which you are about to join.

There are two exams for Java SE Certification track. There's associate exam and then you can progress from there to the certified professional. And obviously this particular training that you're taking should help you pass the first one of these two exams, which is the associate.

The exam has quite a few different things in it and it's kind of broken down into nine sections, 42 topics within them. It requires you to really have some kind of a practical angle on Java, to understand it conceptually and also to have practical skill set to operate with the compiler and write the code.

But, nevertheless, it's still the associate exam. It's still sort of focused on mostly basic things about Java.

The second tier of the examination which is the Programmer 2 exam, the professional level, will get you to more advanced things. Format of exam is multiple-choice questions.

And at this stage I'd like to show you the actual web page where you could find the information about the exact exam topics and some of the tips that you need to be aware of while you're approaching the exam.

## 3. Java Basics - 23m

Well, let's take a closer look at the actual web page for the exam. By the way, you're going to find the URL for this page on your screen so you'd be able to navigate to it yourself.

Anyway, so the exam preparation tells you that you're actually recommended to take some training as in Java SE 8 Fundamentals course as a part of your preparation for the exam.

Bear in mind, this particular presentation that you're looking at now isn't really a replacement for the course. We assume that you do understand the fundamentals topics, just kind of helping you to focus on the specific angle that the exam will require you to understand.

Let's note important things that you need to assume about exam questions. First of all, the code fragments that you're presented with within these questions are not necessarily complete.

They're might be bits and pieces missing about them such as, for example, missing import statements or package definitions. Unless the question is specifically asking you something about the packages and the imports just assume that they all are in place.

Same thing happens when you are looking at the sample code and you need to make an assumption about the paths where these classes are or what location in the file system. Just assume they're in the same folder or even possibly in the same file. So long as the code would compile that way. So that's the assumption you need to make.

The code might not be formatted perfectly. There might be unintended line breaks, just sort of tabulations might not be what you'd normally make them.

So the wrapping around of lines of code could be just anything, really. It does make your life a little harder when it comes to reading and understanding the question but, hey, that's the assumption you need to make.

The code might not necessarily be complete. The course author may present you with just an extract of the code. It may be that certain things are omitted from it.

It may be just a comment maybe saying, I don't know, something like getters and setters methods go here, in which case you just assume that the code would be complete. You just don't see the extra bits about it.

So generally when you're reading the question, try to focus on what exactly you're asked-- what the question is all about-- and then focus at that. If you are in any way not happy about your understanding of the question I think a good suggestion could be to mark it for review, proceed to your other questions, answer as many as you can, and then return back to the questions that you marked for review.

And then of course there is a list here of an exact topics that exam is going to cover. Scoping of variables, structuring of the class, import statements. It's quite a lot of different things. That's in a basic section.

Then there will be section on working with Java types, declarations of variables, objects' life cycles, et cetera. Operators, decision constructs, working with arrays, working with various loops constructs, working with methods and encapsulation.

I must point out that there are certain bits in these sections that do overlap. For example, the bit about working with-- the Java basics bit, which part of it contains the description of scoping of variables. Would also be partially repeated in a section about the methods encapsulations. So there are certain overlaps between these areas which you kind of need to be mindful of.

All right, working with inheritance, extending classes, implementing interfaces, handling exceptions. And there's some selected APIs that are covered by this course. We're looking at local date time API, we're looking at array lists.

Oh, and most exciting, new feature of Java 8. We're looking at lambda expressions.

I must say that you'll find much more lambda, much more in-depth coverage and more practical angle of that in a second tier of the examination in a program or two in a professional track. But even in an associate level you still need to understand some basics about lambdas.

Maybe not very realistic use cases, but really what the lambda expressions are and general sort of syntax and maybe some obvious use cases for them. And for more advanced lambdas, you probably have to dig into the second tier of examination, the Java Programmer 2 tier.

All right, well let's get back to the PowerPoint. So let's take a look at the first point in this particular section-- what is Java?

You need to remember Java is object-oriented language. It's platform-independent. You will be writing your source code as just plain text dot Java file then compiling it on a command line with a Java compiler, Java-C, Javac, whatever you call it.

And then execute and decode through the command line Java runtime. Since this is Java Standard Edition, Java SE is just command line Java runtime you need to be aware of at this stage.

Just simply run in a class which presumably has a main method in it from which the rest of your program logic will unravel. You will be instantiating other classes. They will be interacting with each other as Java objects in memory of your runtime.

Now, the other thing that you need to remember about how to execute a Java program is of course how you pass parameters to it through the command line. Here's the catch. What's actually that string array of arguments that you observe in the main method? It's essentially a representation within your program what is a space-separated list of parameters from the command line.

So in this particular example, we're running some kind of a Java class called Shop, shopping. It's exciting stuff.

So shopping, we pass some parameters. You know, you're in a programming course so sooner or later somebody shows you Hello, World. Yeah, it's inevitable.

So there you go. We pass some various parameters there and we access the list of parameters through the string array that we accept as an argument in the main method. Just iterate through the print-out values.

You need to be aware of a fact, for example, that that comma there is not a parameter separator. The space is. So actually if you want a space to be part of your command line of arguments, you know, the value part of the value, then you can enclose the parameter itself in quotes as in the last argument in this case.

The structure of the Java class is another thing that you need to keep in mind. Java classes can be placed in packages.

It's kind of optional. You don't really have to do it. But, on the other hand, you really want to do it because apparently the class name and the package name, they kind of form a unique global identity of your class.

So the class name itself is not unique but the class name within the package is unique. Hence, you are advised to really put your classes in packages. And then if you want to access a class that's in another package you can always use an import statement for that.

Now, important point is that having imports in your source code does not really affect anything but just the way you write your code. When the code is actually compiled, the compiler replaces all imports with full class name-- well, which is the package name and a class name in your future compiled code.

The imports are not present in the actual compiled result. So they're just there for your convenience. If you don't want to type the package name in front of the class name every time, well, you don't have to. It's just a convenience trick.

You can, of course, import specific classes but you can just do this import star. That will do the trick just nicely.

Let's take a look at a structure of a class and the structure variables within it. Instance variables such as ID, name, price, static variable which has a class context rather than an instance context such as max ID, and some local variables. For example, the string other.

Now, bear in mind parameter such as, for example, string name in the set name method is essentially also a local variable. So you treat the variables declaring assigned methods and parameters in pretty much the same way.

Logically, really, they're either way a local variable. So you need to remember the difference between these.

Now let's take a look at the important point of variable access modifiers. Oh, actually it's not just variables. It's methods as well. But at this stage let's take a look at the variables for a moment.

So the access modifiers are public, protected, default, and private. Remember, public means that a particular variable's visible to the whole world. Protected means it's visible to members of the same class and subclasses.

Default, which is actually an absence of any access modifier, means that something is visible just to the classes in the same package. And private obviously is just visible to this particular class only.

Now, for encapsulation reasons you probably want to make your variables private most of the time. Initialize them through constructors and if you need to access these variables, provide setter methods, getter methods to operate on them.

Of course, that's not a requirement from the Java compiler point of view. You don't have to make your variables private. But remember, if you don't, then you can have really nasty side effects in your code.

So let's take a look at some demonstration that I've prepared for you. We'll switch to JDeveloper and we'll study some code which will allow you to appreciate better exactly what these two PowerPoints were just covering.

Let's take a look at this demonstration that I've prepared for you. It's in JDeveloper and I've laid out some class code in front of you.

First of all, what I will do is make it a little closer to what you expect to get on the actual certification course. First of all, I'd like to make it a little bit closer to what you expect to get in the actual real exam.

I will turn off the code assistant because on a real exam no issues or errors or sort of things will be highlighted for you. You essentially will have to act as a human compiler, kind of understanding what compilers are going to do about the code.

So the ID such as JDeveloper is giving you that help. It highlights where possible issues in a code are. In reality in the exam you won't have that assistance. You will have to be able to spot it in a code yourselves.

So this is an example. There's a class product here which has ID name price. There's a class food that extends product.

Oh, odd. Also has price, yeah? Bear in mind the access modifiers are also important.

And, finally, there is a class shop where we're instantiating some object type of food. We'll create a new cookie and then we just print out the values of price, of tax, ID. So we operate in some variables and some methods.

What I'd like you to do at this stage is pause the video and try to guess what is going to be printed out in these statements. So read through the code and try to understand what's going to be printed. This is kind of realistic take of what you expect to do on the exam.

And then once you've made your educated guess, then unpause the video, resume it, and I'll run it for you. We'll see what the result's going to be. OK? Your turn.

Now let's see the result. Just run that shop application. And I'll try to understand what is actually printed here.

So we've got here the first printout of a food price and it counts out as zero. Well, hold on a second. Aren't we actually trying to set a price here? Oh, we are.

So instantiating the food object, we pass on a price. That price is supposed to be passed to the superclass constructor. OK.

So we're passing it to superclass constructor, which in this case here in a product class, and we're assigning a price to the instance variable, which is this variable. Yeah, this.price.

But what are we actually printing? We're not accessing the method to get the price. Oh no. We're accessing a variable directly. It's public in the food.

So, hence, that's we're actually adding and we never initialized that variable. An instance variable, which is a primitive that hasn't been initialized as a float variable, would have a default value of zero. That's what we're getting here.

Please note that when it comes to a variable being placed into a superclass and a subclass in a way that's not private, i.e. both variables are kind of visible, is essentially you need to remember that variables are not polymorphic like methods. Variable in a child does not override the variable in a parent. They both exist at the same time.

This is what we can classify as a case of shadowing. So that is what could be confusing about accessing the variable price, for example. You kind of see two incarnations of the price variable depending on whether you're referring to a superclass or a subclass.

Now let's take a look at the tax. Well, really same story. You're calling this method and you're accessing the price variable and just happens to be your local variable price and it just happens to be your instance variable price in the food class.

And that's, again, that's why you're getting a zero. Obviously you're not actually accessing the superclass here.

You get into food, get ID. That is actually accessing the superclass so that's why you're getting the ID of 2.

Now let's try to understand why 2, how the ID was actually calculated in first place. The max ID static variable is zero by default. And then the ID, which is an instance variable here, is initialized in a constructor as plus plus max ID. So it becomes 1.

However, scroll a little bit down. That's ID plus 1 in a getter method. That's why we're getting 2 there. That's why the ID is kind of changed.

Now, how about the 2 string method here? What does that print?

Prints the ID all right, name, and price. This time the price is 1.99, exactly as we set it.

But what about that ID value? It's 1 not 2. But, of course.

Essentially you need to remember that this expression of ID plus 1 in a getter method never actually modified the ID variable itself. The ID variable itself stayed 1.

That's why the 2 string method points 1 because this is essentially implicitly a creation of another local variable. It's the same as if I write, I don't know, integer b equals ID plus 1 and then I return b.

You kind of imagine for a moment you actually deal with a local variable here. That is what you are modifying. The ID itself, which is the instance variable in this case, is never reassigned. It's never changed.

And it's similar to another point that you need to bear in mind-- why name cookie comes out in mixed case. It may seem like you are modifying it, like you're making it to upper case. Well, you're not. String objects are immutable.

Oops. Sorry. I don't need to declare it again. I just need to reassign it.

If I'll be reassigning it, that's another story. Then I will be actually changing a variable name.

I could have just done directly this dot name equals name to upper case. I don't really need to do it in two different lines of code. But that will show you the name in uppercase.

Let me just show you that. Let's just run that. Why it's not coming up in upper case? Let's think.

So we have a parameter name. We're changing it to upper case, we're reassigning. It should come up in upper case.

But did you actually ever call the set name method in the first place? No, you didn't.

In the constructor here I'm just using the direct variable assignment. So the method set name is [INAUDIBLE]. Try that. Cookie's uppercase.

So that is the kind of stuff you need to look into when you're looking at the exam question. Of course, in this particular case, several different questions are mixed together. That's what makes it so difficult. Normally you will just have one of these tricks or two of these tricks embedded in the exam question.

But this is the process to which you need to work. You read the code, you try to understand what's going on here, you check what is odd about the code, access modifiers, assignments.

And, yeah, it's kind of typical tasks. What will be printed out? Or will this code compile? You know, these sort of things

OK. Well, let's get back to the PowerPoint. All right, so that was the demonstration. And hopefully you've enjoyed the inquisitive nature of it.

As for the summary for this particular section, well, we need to sort of understand things such as--

As for the summary of this particular section, we need to understand things such as encapsulation, platform independence principles, the fact that Java is object-oriented language.

Remember how to compile, execute the program, run it from the command line using the main method. Pass parameters to it. Produce the console output, system [INAUDIBLE]. And distinguish different variable scopes-- static variables, instance variables, local variables, parameters which are essentially local variables.

Remember about structure of the Java class, how to handle imports. The fact that the class name and a package name form the unique global name which is actually what you reference.

One more thing. Some of the stuff that we've looked in this particular section specifically about access modifiers is also important in a later section in this particular course which covers the inheritance-- how one class extends another.

Probably noticed that with a food and a product class as you've seen in the demonstration, that some of the variables were actually having the default access modifier and, hence, were visible to members of the same package. And it could be a permutation of that particular code example where you would deal with variables that are only visible to subclasses that might be in a different package with a protected access modifier.

All right, well, let's go to the next section.
