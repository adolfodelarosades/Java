# 2. Local Variable Type Inference Local Variable Syntax for Lambda Parameters

1. Local Variable Type Inference Local Variable Syntax for Lambda Parameters - New - 12m
2. Local Variable Type Inference Local Variable Syntax for Lambda Parameters (Part 2) - New - 17m

## 1. Local Variable Type Inference Local Variable Syntax for Lambda Parameters - New - 12m

In this lesson, we are going to discuss local variable type inference, local variable syntax for lambda, and parameters. Well, for the local variable type inference, we know that previously all local variable declaration required an explicit type on the left side, exactly like on the example that you see on the slide, where we declare a reference variable of type ByteArrayOutputStream. And we initialize it with a new instance of ByteArrayOutputStream constructor.

Now, the explicit type can be replaced by the reserved type name var. The compiler infers the variable type from the initializer on the right side, exactly like you see in the example in the slide. We have our outputStream equal new ByteArrayOutputStream.

Examples of the benefits. Well, the networking in IO APIs use an object wrapping idiom. Each immediate object must be declared as a resource variable so that it will be closed properly if an error occurs while opening a subsequent wrapper. The conventional code for this requires the class name to be repeated on the left and right sides of the variable declaration, resulting, of course, in a lot of clutter, exactly like you see in the top example in this slide. [INAUDIBLE] to read line of a text from a socket using try with resources in this case, like you see.

So obviously, we specify the type on the left and on the right. Well, with the local variable type inference, we actually can use var instead of the type on the left side. And as you see in the example below, this works properly. So using the var reduces the noise considerably, a lot of that code cluttering. So this reserved a type name var can be used.

We already know that keywords cannot be used for variable names-- example, int else-- as it is a keyword, we cannot use it. So that's not valid. And var is not a keyword, by the way. It's basically a valid but not recommended.

All code like this, like here when you declare var type int and set it to 20, this could be an old code that was maybe created before in 8 or 7, SE 7 or SE 8. So this old code like this won't break under the Java SE 11. If you upgrade to Java SE 11 and up, it will not break.

So the var for type inference is only used when we know we're looking for type information. For example, here var x, and we set it to 30, this works without any problem. Because the compiler will infer that x would be an integer, because 30 is treated by the compiler as an integer.

Where can it be used? Well, you can use it in local variable with an initial value. Here's an example where we declare item description of type var. And we assign to it a string Shirt. This is inferred as a string, no problem.

Enhanced for-loop index, in this case, also it works var item [INAUDIBLE] from the array itemArray, this is referred as an item object because of the item array that happened to be an array of items of type item. Traditional for-loop index variable also, you can use, in this case, the var-- for example here, for var i equals 0, i less than 10, i++-- this also is inferred as an integer. That works without any problem.

Some non-denotable types, like intersection types and anonymous class types, can also be discussed. So the [? insertion ?] times, for example, if you need to infer a type that implements more than one interface, you can, in this case, use that anonymous class type source. So for example, it lets the compiler insert the proper reference type to access unique fields and methods within an anonymous [? inner ?] class. So these are cool tricks, but they're not in the exam.

Where can it not be used? Well, declarations without an initial value. For example, you have a var price. Well, there's no way the compiler is going to infer what would be the type of price, because it's not initialized.

Or when you initialize with a null, that also is not allowed. Because we don't know if it's initial. We don't know what type price would be. Or compound declaration here, we declared var price, set it to 9.5 and tax, set it to 0.5, that also is not acceptable.

Array initializers also, the way you see as the example, that's also not allowed. You also cannot use var in fields of a class, and also as a parameter to a method, or as a return type. Those all cannot be used. Why not? That would be a good question. Why not?

Well, consider this bad example where we have a method that get something, that returns a var and takes a variable something of type var. Oh, my goodness. There's no way the compiler is going to infer what would be the type of something.

So how should this compiler know? And what type of value it has returned? This is pretty much impossible to infer. So something could be anything.

So type interference typically is an algorithm, not magic. So the goal of this feature var is to let v more quickly read and understand the code. As you can see based on this example, both humans and the compiler require context for understanding.

Let's talk a little bit about the context. Can we infer something from somewhere else? That would be a good question.

Well, for example, we see the example getSomething and pass a string to it, or getSomething and pass a double to it. And that also does not work. So that's why we basically warn you about preventing action at a distance issues.

So we tell you, don't allow code elsewhere to conflict on what type to infer. So the type must be inferred where the variable is declared. So you need to look at this very carefully.

Here's a good question. This question is a class called Pet, some code representing a class called Pet. It has a bunch of fields in this class, a few fields.

One is named breed and then a list of pets. And it has a constructor. And it has a method, printPets that uses a for-loop, an enhanced for-loop.

So the question that we have here-- which use of var is valid? Is it A, line 11; B, line 12; C, line 14; D, line 20? Now, we just want to warn you that other questions may number code lines of code like this. When you're taking an exam, just be careful confirming which line numbers align to which answer.

So questions on variable type inference will make you identify what you can and can't do with this feature. So when you skim this code, which pretty much shows us that we got a class called Pet, it has a few fields, a constructor, and a method. So looking at line 11, which is in this case answer A.

So this uses a var declare the name field. This is not enough context to infer what data type this field should be. It's just impossible.

How about looking at B, line 12? In line 12, we got var breed. And we set it to the string German Shepherd. So by looking at this, we say, OK, this uses var to declare the breed field.

Well, at least in this example, which is on line 12 rather in this line 12 code, at least this time we have enough context in this case to pretty much say that this, in this case, breed, supposed to be a string, just because we initialize the reference variable breed with the string German Shepherd. However, var still is not allowed for fields.

Remember, we discussed that in previous slides. And as a best practice, the scope of var should be extremely limited. But the scope of fields is not extremely limited. In fact, it's pretty big and spans the entire scope of the class.

Now, let's take a look at line 14, which is in this case part C, answer C, line 14. Well, in line 14, in this case, we use var to declare as a parameter. This is getting into the action at a distance issue where we are dependent on code elsewhere to infer type. Because of this, var is not allowed for parameter types.

So now let's take a look at the last one, which is line 20. That's answer D. Well, we can say that by process of elimination, D would be the answer.

But in this case, can we figure it out? And the answer is yes. We are allowed to use a var within a a for-loop. And the type is inferred based on the collection we specify when the for-loop is declared.

So in this case, we already know that the pet list is an array, a list of type pet. So obviously in this case, this would work. And D in this case is correct.

## 2. Local Variable Type Inference Local Variable Syntax for Lambda Parameters (Part 2) - New - 17m

Let's go ahead and debate this var type. Well, arguments against this feature is that useful information will be hidden and readability will be impaired. And, of course, bad developers will misuse and overuse this feature to write really bad code. On the other hand, the arguments for this feature is that redundant information is removed and code is more concise and readable. But what I want to say here is that bad developers will write terrible code no matter what happens.

So, like all features, we advise you to use it with judgment. And guidelines show how to effectively realize the benefits of what's allowed. In general, you can go to some style guidelines and frequent ask questions for local variable type inference in Java under the openJDK.java.net website.

So let's take a look at these guidelines. In general, we tell you-- don't worry too much about programming to the interface with local variables. A common Java idiom is to construct an instance with a concrete initializer type, but assign it to a variable of an interface type. So binding code to the abstraction instead of the implementation, of course, offers flexibility to change the initializer type with minimal complications.

Here's an example. We have a list-- in this case, reference variable of type list string. And we initialize it to an array list of, in this case, a string. So this is not possible with local variable type inference. So the potential issues that can be easily avoided or mitigated, because list is a local variable whose scope should be extremely limited. So for example, in this case, we have var list, when each [INAUDIBLE] of an array list of type string. So this will basically look like the list is inferred as an array list, not a list. So that's why we need to be careful in this case.

Another guideline-- take care using var with diamond or generic methods. So consider the statement that we have here, which we have a reference variable called item queue, which is of type priority queue of type item. And we initialize it with a new instance priority queue of type item. The diamond feature lets you omit explicit type information. So like the example over there, we can actually avoid writing the type item on the right side. We know this from Java SC7.

And we also can tell you that the var also lets you omit explicit type information. And take a look at the example, where we have var item queue, which is initialized with an instance of priority queue item. And that also works without any problem. But using both strips the statement of context, unfortunately. So here you have var item queue equal to new priority queue.

This will automatically look at the item queue as a reference to an object of type priority queue of type object. And that might not be helpful to you, because imagine that you actually wanted to work with really the object of type item and not object. So that's why we need to, in this case, tell you that or warn you, be careful.

Let's take a look at some guidelines that take care of using var with literals. So if you take a look at the first, the top example, there is no issue with Boolean character, a long, a string literal-- no problem. Take a look at before and after in the first, top example. You can declare ready of type Boolean, or ch of type char, or some of type long, or label of type string.

We could replace those types, left side types, with var, and the-- in this case, the compiler still can infer that ready is of type Boolean because of the value true. And then ch, which is a character and sum, which is a long integer, and, of course, because of 0L, and the label, which is a string because of the initialization of that label with the string wombat.

In the second set of examples, whole numbers require care, because they may be inferring, in this case, in integer type. So take a look, for example, byte here and short and base, which is of type long. If we use the var, then the flags, since it's set to 0, 0 is treated by the compiler as an integer. So that will be-- flags will be looking as an integer. And the same thing with base. Var base set to 17-- this would look like an integer.

Floating point numbers require a little care, too, if you, again, in this case, previously mixed types. So for example, f1 on the left side. F1 is declared as a float initial with 1.0f. So that works. If you use var, that works. The second one, float f2 and set at to 2.0. If you use var, and the 2.0 is treated by the compiler as a double, so that's inferred as a double. Third one, a double, that works. D3 set to 3.0, that works. The fourth one, the last one, double d4 equal 4.0f. This, if you use var, is actually inferred as a float because of the 4.0f.

Let's take a look at this question. This question says, which two cause a compiler error when written in the main method? In this case, we're looking at the code in A, B, C, D, and E. Let's take a look at the first one. Well in the first one, which is A, the first line infers list1 type based on the ArrayList instantiated on the right side, which happened to use the empty diamond. Then we add an object to the ArrayList. And of course, the third line tries to save a character from the first element of the ArrayList.

Well, the problem here is that this is an ArrayList of objects, not strings. So the charAt method call isn't valid. This may have worked once, when the ArrayList was declared as a list of type string. Here, now that that we are using var, there is not enough context to say this is a list of string objects. So this will not compile. Let's take a look at B.

Well, B-- this does provide enough context to say that we have an ArrayList of string objects, because we say new ArrayList of type string. The final line is valid because of this. And we're, in this case, able to infer the data type as a char.

Let's look at C now. Well, rather than creating an ArrayList to hold names, this creates the string directly. We infer each type as a string on the first line. And we infer a char on the second line. Let's take a look now at the, in this case, D. Well in D, in this case, this uses a var type inference on a variable named var. Keep in mind that the var is not a keyword, it's a reserved type name. That means this line of code is valid.

And how about, in this case, the last one-- E. Well E, in this case, we have something like double alternatively. So, in D, double here is a keyword and we remember that we are not allowed, in this case, to name a variable after a keyword. This will not compile.

So in our case here, we found out, in this case, that D-- or, rather, E, in this case, will not compile. But I should say that D and E might sound silly, but you should still expect to see this on the exam. So this is just kind of like a hint for you.

Local-variable syntax for lambda parameters. So the lambda expressions could be explicitly typed. My example, item x has a parameter, integer y. And then we have the arrow token, x process y. Lambda expression could be implicitly typed. We just pass x and y and that, also.

Now, lambda expressions can also be implicitly typed with the var syntax. Here's an example. Var x, var y, and arrow token x process y. Of course, the question that you should [INAUDIBLE] here, is what are the benefits of this? Well, uniform syntax for local-variable type inference is a benefit.

So here, var x new BigClassNamesMakeReadingHard, OK? And we have var x, var y, x process y. And look at-- previously, annotations and modifiers required explicitly typed lambdas. So, as you see here, in the example @Nonnull BigClassNamesMakeReadingHard, x, and then final int y, x process y. The var provides the more readable implicitly typed alternative, as you see here. And we write it in the last example.

But take a look at this, where actually you see that these will not compile. You could never mix implicitly and explicitly typed lambda parameters, like the example. Item x and then y, that's not acceptable. Will not compile. You also cannot mix var and non-var in an implicitly typed lambda expression, exactly what you see over there. Var xy, that's not also going to be compiled.

You cannot mix var and non-var in explicitly typed lambda expressions. So var x and then int y, that's not going to be working. There's no way, will not compile. And you cannot omit parentheses for single explicitly typed or var parameters, like what you see over there. So that also will not compile.

Let's take a look at this question. This question says, which two statements are valid? OK. So from A, B, C, D, E, F, two are valid. Let's go ahead and take a look at these Well, questions on local-variable type interference with lambda expressions will also make you identify what you can and can't do with this feature.

So let's take a look at A. A, here we have consumer string con1 equal final string x and arrow token system.out.print x. This explicitly states the variable type in the lambda expression as a string. It also tries to make the variable final. This would be acceptable, except parentheses are required.

In fact, we can eliminate, in this case, B and C for this same reason. So take a look at B. This is wrong for the same reason as A. And take a look at C. This is wrong for the same reason as A. It is also wrong because you can't have modifiers like final or annotations without declaring the parameter type explicitly or as var. That also cannot work. So that's why you see here, this will not work.

Now, let's go ahead and take a look at, in this case, D. So the parameters are surrounded by, in this case, parentheses, OK? Their type is inferred. So BiConsumer, string, string, biCon1. You have var x, final var x, final var y, and then system.out.println x+y. And of course, since they're-- we're, in this case, declaring them with var, we're welcome to also declare them final. So the answer, in this case, is correct for D. OK? How about B-- or rather E.

Let's take a look at E right now. In this case, E have BiConsumer, string, string, biCon1 and then we have final var x, y, comma y. And then arrow token, system.out.println x+y. Well, the answer here wants you to think that just because you don't declare a parameter final, it's OK not to declare it with a var either. But this is not the case. If you declare one variable with a var, you must declare them all with a var. So that, of course, in this case, will not work.

Let's take a look at the last one, OK, which is F. BiConsumer, string, string, biCon3, final var x, var y, and then system.out.prinln x+y. This answer corrects the mistake from E. And the answer, in this case, is correct. OK.

So if you take a look here, we looked at every one of them. So of course, when you look at these type of questions, part of these questions' challenge is that it's tempting to think one answer from ABC is correct and one from DEF is correct. You should analyze the code and not rely on assumptions, because this might not necessarily be the case.

So if you think one option from A, B, or C is correct, there should be a good reason for it. And that's why, take a look carefully and read carefully before you make, in this case, a decision about these type of questions. So by looking at these, this would be a very, very good type of question, in this case. Thank you.
