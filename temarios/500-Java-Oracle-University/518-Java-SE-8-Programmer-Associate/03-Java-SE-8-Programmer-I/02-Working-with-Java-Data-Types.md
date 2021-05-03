# 2: Working with Java Data Types

1. Working with Java Data Types - 28m

## 1. Working with Java Data Types - 28m

Let's take a look at different Java data types. Well, in Java all classes are data types but not all data types are classes. Some data types are known as primitives.

The difference really is in how they're stored in memory. A primitive is just a value stored in a stack while an object is a reference stored in a stack through which you access the actual object that is stored in a heap. So you need to bear in mind the difference.

Now, in this particular section let's start with primitives. And these are the primitive types. There are four numeric types in Java that represent whole numbers. From smallest to largest, these are byte, short, int, and long, which is obviously 8 bits, 16 bits, 32 bits, 64 bit.

Then there are two types for floating point numbers. That's float and double, 32-bit and 64-bit number.

Char, representing a character which is actually 16-bit really. We kind of compare that to a number in a sense because it's a character code that you're storing in a char type. And finally, Boolean, which can store true and false values.

So these are ranges of values as you can see presented for you. These are the possible ways of expressing values.

Oh, bear in mind in this particular PowerPoint just to save space I've recorded the values for whole numbers only on the first section there where the byte is. But really you can specify the value for short and int and long in exactly same way.

So you can record the value as just a decimal number as a binary number that 0b as an octal number or as a hex number. It's up to you, really. The values could be expressed in all these different ways.

The long value can be distinguished from an int by putting an L at the end. You can use upper or lower case L. Very much doubt you rationally want to use lowercase L because it looks like 1. It's not very readable.

Float can be distinguished from double using the F at the end. Again, you can use either upper or lowercase.

And with a char, as you can see, you can specify the value as a character itself as a Unicode character code or as an Ascii character code or actually as one of these shortcuts, you know, like slash and carriage return slash T tab.

Another important point to remember is the default value that variables do have. If the variable is declared as an instance or a static variable then its initialization, if it's not done explicitly, will be implicitly performed to a value of 0 for all the types apart from Boolean which will be false.

If the variable is local, then it will be your responsibility to explicitly initialize it before you use it. If you don't use it you don't need to initialize it. But a compiler will actually check if you've declared a local variable have you actually initialized it.

All right, now, this is an interesting set of examples that we need to go through. They are about primitive type castings.

Several examples here. Let's look at the first one. Byte x 1 and y 2 and y z. And there's an arithmetic expression there, x plus y.

Now, what do you think? Will this code compile? You can pause if you like.

And now let me reveal the correct answer. It won't. You see, the x plus y is an arithmetic operation and an actual result of any arithmetic operation in Java performed on any data type smaller than int is instantly an int.

So byte z will be too small to accommodate the expression of x plus y. It would have to be an int z in order to compile in this case.

Or you will have to typecast the other side of expression which is actually the second example here. So having an int in left-hand side works perfectly fine.

Or typecasting the result of the expression on the right-hand side will also do the trick. So you have this x plus y casted t to byte first.

Now, what about the next one? So you have this integer x which is 7 and y which is 5 and you're doing a division. You're assigning result to the float variable.

Would it compile? They will, but what would be the result? It might not be what you want. It will be zero.

Because, you see, x divided by y, an integer divided by an integer, we just mentioned it. Any arithmetic operation in Java on any data type smaller than int, including the int, will result in an int not in a float. So you'll get 0 at the right-hand side of that expression.

At least one participant of the expression has to be bigger than int-- well, float for example-- in order for this to produce you an actual floating point result which is exactly what the last example here does. You're casting one of the participants to a float.

Now, bear in mind that it has to be not the result of expression but one of the participants, either x or y. But let's take a close look at this demonstration which might help us to appreciate better exactly what's happening in typecastings.

Remember, I turned off the code assistant in JDeveloper. So this example would not highlight you the error. Although, of course if I'll try to round code. Let me just try to print out that z variable for example.

Obviously that's going to be a compiler issue, as you can see. The compiler tells me that typecasting would be required in this case.

However, this is what I want you to note. If I will, in fact, narrow down the type to byte, the code will compile. Oh yeah. Absolutely. You run that and it produces a result of two.

But there is a potential danger of which you need to be aware of. What is going to happen if I will try to initiate one of these variables let's say like this, to 128. There will be a compilation error. The compiler will say, well, you cannot possibly assign 128 to the byte because beyond the byte's precision.

However, if it's 127 that's still within the range of values for the byte. So you kind of think you're safe. Well, at least the compiler would not really argue with you. Run that. Has an interesting output-- minus 128.

Now, that's because you've overridden the compiler's default assumption of x plus y being an int and you narrowed down to a byte. An actual value exceeds the limit set for the byte type so it kind of starts circling around. You add plus 1 to it, it sort of starts from the minimum possible value and goes up because you've overflowed the type.

That's why the default assumption made by the compiler is to cast any arithmetic to an int just in case. So you wouldn't accidentally overflow the type.

Now let's take a look at the next example here. I'm operating here on a char. I got character 8. I'm going to assign it to an x variable. Interesting enough, I'm performing a plus plus operation on it.

Now, what it will produce me as a result? Well, you may pause the video and think about it. And I'm going to reveal the correct answer.

And the correct answer is B. It's the next character in the alphabet. You incremented essentially a character code. So that's perfectly plausible assumption.

However, bear in mind that this is not going to do the trick. I'm trying to add plus 1. I'm not doing the plus plus. I'm adding plus 1 to it.

And as a result, you may guess what's going to happen is that that will be treated as an arithmetic operation. Hence, the result will be an int. The code is not going to compile.

So see the difference is that operations such as plus plus and minus minus, they do not change the type of your variable. They're modifying the variable recursively. They're not modifying its type.

You're still staying at the same time being it byte or char or whatever it is. But any other arithmetic actually results in an int type for any operation that's smaller than an int.

Well, of course you can cast it back to char exactly as we did in the previous example. So that will produce you B. But you need to kind of bear in mind the fact that this typecasting will be required if you're doing just plus 1. But it won't be if you're doing plus plus.

OK, let's take a look at the next sample here. That's the example with a float. Let's play around with that.

I've got this 7 and 11 and I divide them. Well, the result will be 0 as we've just discussed. And in order for the result to become an actual float, I need to cast one of the participants to float. Could be either x or y actually. Doesn't matter.

So this particular casting could occur on either side of that. It's just one participant has to be bigger than an int in order for the result to be casted to the biggest participant type. And that will get your floating point number aligned.

Now, the other thing that you need to watch out is that it's the participant that you need to cast to require to type not the result. If you're casting the result to that type it will still be zero because within these brackets, the x and y are actually producing near zero results so you can cast it as much as you like. Isn't going to help.

So if you want to do something like that it has to be one of the participants you see. OK, well, just bear that in mind.

The other important point about Java arithmetics, which I'm sure you wouldn't have any problems with at all, is the use of brackets. You need to remember the order of operations.

The only tricky bit that might be a little bit outside of the basic school math boundaries is the use of plus plus and minus minus. The plus plus and minus minus are evaluated earlier than, let's say in this particular case, multiplication. Because otherwise the order is multiplication first then, yeah, so the kind of usual order of operators. And, of course, you can override it.

So, again, just take a moment, think about it, pause the video if you like. Think what's going to be printed. Out of these two lines, what would be the value of x and what would be the value of y? And then I'll reveal the correct answer.

And I'm revealing the correct answer. Let's run it. 11 and minus 53.

That's because of the use of brackets in this case and the use of plus plus. Yeah, that you sort of need to be aware of that. It's important.

OK, so that's the order of operators. Next.

What if in the story about the order of operators into your mathematical equation a concatenation sneaks in? That could confuse things a little. You see, in this particular case there's a plus sign which is essentially a string concatenation but there is also a plus sign which you expect to be an addition operation.

So, again, which order they will be evaluated is important because you get a different result. Feel free to pause the video, think about what's going to be printed in these two lines of code, and then I'll reveal the correct answer for you.

And the correct answer is-- hm. In the first case the string concatenation occurred in this line first. So, hence, the rest of the line was treated as just a concat. So you've got the x and y concatenated together as 4 and 2, 42.

However, in the second line, the valuation of an addition operation occurred first. So, hence, it actually valuated the 6 and then you had the concatenation. So the order in which it is done is important and to override the order most definitely you can always use brackets.

So after this demo we're back to our PowerPoint. Let's just progress further a little bit.

Not always would you actually operate directly on a primitive. Sometimes you would like to use an object wrap around it. In which case, well, fortunately, for us Java can actually automatically convert the primitive to the object and the other way around, a feature known as auto-boxing and boxing.

Now, in code examples here you can formally construct a wrapper with a, say in this particular case, integer value. Or you can maybe, for example, parse some text and turn it into an object or a primitive. Could be done via parsing method, for example, or could just directly pass the text into the constructor.

The interesting things do happen when you make errors input to these parse methods or maybe errors input to the constructor. As you can see here, we're parsing an integer ACME.

Well, we don't stand much of a chance with that, do we? Or constructing a new integer with null as an argument. So you need to be obviously aware that in these particular cases you will get a number format exception so you won't be able to construct these particular statements.

But they do compile. Don't get me wrong. From the compiler point of view, everything is fine. It's just a runtime problem. It's an issue when you actually try to handle, say, a user input which happens to be wrong.

However, although you can explicitly extract the primitive out of the wrapper like in the next line of code and the integer x6. You don't really have to do this sort of wrapping and wrapping of a primitive and an object explicitly.

As you can see in the next lines, auto-boxing and boxing will work perfectly fine. You assign x2 which happens to be, remember, an integer object to an x7 which is actually a primitive.

And the other way around works just as well. So the explicit call to the int value method or explicit use of the integer constructor is not actually required.

Now, there's an important point about a Boolean which might a little bit blur things for you. So we're constructing a new Boolean value here. There's a case where we are constructing it with the Boolean true. So z3 will have a value of true.

And z4 will not throw you the exception. The z4 line where we construct a new Boolean with a string ACME will actually not produce an exception.

Neither will it produce an exception to line on z5. They'll simply be initialized as Boolean false. That's kind of important to point out that there is a distinct case here where the Boolean will simply say, well, you know, it's not a true value so it's false. OK?

While we're passing parameters to methods, there are different cases here. We need to remember the difference between passing parameters that are object references, passing parameters that are primitives.

Let's take a look at this particular example closer. So first we create an instance of a product which is that cookie product. Then we passed that product p as an argument to the addProduct method.

Essentially what is happening here is that we are ending up with a new reference towards the same object, that product p here, which is the parameter of that product market. It's just referencing exactly same place in a heap where the product has been stored initially.

So, therefore, if you call an operation upon it like setting a price, watch for the number. 2.99 is changing to 1.15 because we have modified the same object in a heap for this particular statement. So both of these pieces of code reference the same memory area.

When it comes to handling a primitive, it's actually rather different. The primitive is not stored in a heap. It's actually in a stack.

So that float value of 2.99 is just it. It's the value. So when you pass that float 2.99 to another method like calculate tax, you're actually ending up with a copy of a variable value in a stack, just another value in a stack. So that's a second kind of [INAUDIBLE], if you like, of that float value.

And, hence, in a calculate tax within that method, when you're performing the recalculation of the value-- you're calculating 10% of that or something-- you're modifying a parameter float value. A local variable inside the calculate tax is changed.

So that's now .0299f, yeah? But the original variable is still 2.99. It hasn't been changed in any way.

So that's essentially the behavior that you need to be aware of, the difference between case when you pass an object reference as a parameter then you essentially create a copy of a reference but the object in a heap remains the same. And when you pass a primitive as a parameter, in which case you're creating a copy of an actual primitive value.

Another point to remember. Accessing static variables and methods.

So there's a couple of examples of code here. There's class Product.

As you notice that an ID in a product is instance variable and max ID static. There's a static method to get max ID. And there's a set max ID, but that's an instance method.

So how do we use that Product class and what's happening here? We're trying to instantiate it, we're trying to get the max ID, we're trying to get it in different ways via the p reference-- p.getMaxId-- or via the Product class reference, Product.getMaxId. And also we're trying to set them. There's two different ways.

Let's take a look at which bits of code here will work and which won't. First of all, that's not going to work. You're trying to access an instance context out of a static method.

And it's inherently ambiguous because how many products can you create? You can instantiate lots of products but there will be only one static context shared between them all.

So when you are inside a static method and you try to access an instance variable or an instance method, the obvious question is which instance you're talking about. This keyword isn't possible inside a static method, by definition. So this line of code will not compile. Of course, if you remove it, your code compiles then.

Accessing the static variables. Yeah, that's perfectly fine. Out of static context you can certainly access static variables and methods.

What about the other way around? If we're inside an instance method like setMaxId here?

That's perfectly fine as you can see. You can inside an instance method access both instance and static variables because from point of view of an instance of an object, it's not ambiguous which static context you're talking about because there's only one static context for this class anyway.

So there you go. On the left-hand side here we instantiate a product. We're trying to get the max ID. We're trying to get the max ID through the instance reference. It's a static method.

Yeah, it works because it's unambiguous. There's only one static context for all the instance methods anyway.

All right, and what about the accessing of getMaxId for the class reference? It's perfectly fine as well. It's a static method. You can do that.

With the setMaxId you're using an instance here. It works. But setMaxId is an instance method. You cannot possibly call it through the class reference.

That's not going to work because, again, that's ambiguous. Which instance you're actually talking about is unknown.

Operating on static methods via instance references works. It's just maybe confusing to read but it's perfectly fine. And, of course, the other way around is not going to work.

All right, so summary for this particular section. What have we discovered here? The way to declare and initialise variables. How do we differentiate between the behavior of those variables that are objects versus those that are primitives?

Access to the instance or static fields or methods. The instantiation of an object and how it is allocated into the heap. And how it can then we pass the reference to this object around a program.

And one more thing to remember about it which is regarding the object life cycle, you need to remember how the objects are de-referenced. The object will be eligible for garbage collection, will be eligible to be scrapped from memory when there are no more references pointing to it.

Doesn't mean that the object will actually be scrapped at that stage, no. But that's something that will just happen some time later, I don't know, when the garbage collector will decide to clean that particular memory.

But, otherwise, the object is still being accessible by your code if there is at least one reference somewhere in your program still pointing to it. It could be passed as an argument to some other method. It could still see that particular object. We've looked at that example as well.

And one more small point that nevertheless is quite important. The behavior of a primitive and the wrapper classes. The auto-boxing and boxing, the way parse tax to turn it into a primitive or the way you convert the primitive to a wrapper or the other way around.

All right, let's progress to the next section.
