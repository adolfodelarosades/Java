# 3: Using Operators and Decision Constructs

1. Using Operators and Decision Constructs - 19m

## 1. Using Operators and Decision Constructs - 19m

Using Operators and Decision Constructs.

Now, in this particular section first of all we need to look at the conditionals-- a construct such as if/else and switch case. In the if/else scenario, you're looking at the if condition which is the Boolean expression, followed by a block of code and an optional else clause. It doesn't have to be present.

The logic is pretty straightforward. If the Boolean condition in the if statement results in true, then whatever is in your if block will be executed. If it results in false and you have an else block, then the else block will be executed.

Bear in mind, no matter what you see on a screen it's just it. There is no else/if operator in Java. Just doesn't exist.

You may write another if inside the else. Oh yes, of course you can. But it's not a separate operator type. It's just another if that you can place inside else, for example.

Or, I don't know, you can place an if inside if just embed one block inside the other. That's perfectly fine. So that's something to remember.

Also, although it's a really bad coding practice but you need to remember one more thing, that an if block or an else block which contains only one statement inside does not have to be enclosed in these curly brackets. You actually may skip them for a single statement inside an if or a single statement inside the else.

It's particularly dangerous code in practice because you can easily misread your code. But, nevertheless, expect the exam to have questions like that where it's not necessarily surrounded with curly brackets.

As for the switch statement, now, do you know you can think about it as a kind of a-- maybe it will sound a little controversial, but you may think about a switch statement as a very controlled case of go to.

In a switch itself you have the condition which is not Boolean. It's evaluating something that's an integer or a string or an enum.

And then you have cases where the actual case value is an integer string or any enum and your block of code inside a switch will start its execution. From the case they will be matching the value that you have in a switch. So you kind of jumped to that line of code.

And then you will progress to the rest of the block. You're not just executing that particular case. You're starting from that case.

You're literally kind of doing the go to that case and then you progress to the rest of the switch with all other cases unless-- unless-- you encounter a break inside a case. Oh, well, then you break out of the block.

But if there is no break and you don't have to put breaks inside cases, it's up to you. Then you just progress to the next case and next case if necessary.

So it's not, strictly speaking, exactly same thing as if because you may execute several cases one after another. That's perfectly fine.

Then, of course, if there's a code that evaluated some kind of a switch value that never managed to match any case, well, in this particular situation you can have a default clause in your switch so your code jumps to the default clause.

I think at this stage it's worth taking a look at another short demonstration just to make ourselves a little bit more aware of the behaviors of conditionals in Java. Let's take a closer look.

All right, well, let's take a look at the [? scaled ?] example. As you can see, some tricks done here, we are apparently in this case missing some curly brackets.

So, in fact, what you're looking at is a little bit misleading. Kind of ask yourself this question-- which if statement this particular else belongs to? Is that the first if because it's a line there, isn't it? Or is that that second if?

Well, JDeveloper highlighted it for you. It's actually the second if.

But remember on the actual exam there's not going to be gold highlighting, yeah, so you'll have to figure it out. In fact, the alignment of code in Java is really irrelevant. I mean, you can tab yourself away anywhere you like, so that's the real kind of alignment that should be happening here.

Essentially, the absence of curly brackets is what makes this code confusing. Let's just think about it for a moment. Here, well, I'll run that code for you, so you'll see the output in a moment.

There you go. Yeah. So it says x equals y. We're actually in this particular block, yeah?

But the reality of this code really is that there's a block of code after the if. There's another block of code which using this else clause which contains an if and a block of code. Here.

Let's format that. And the else and the block of code data is off that else statement.

And then finally we close that else block. So that is how the code is actually executed.

But, of course, the curly brackets are missing. So when you were initially looking at that code it might be trickier to read.

All right. Next example. Let's just comment that out and let's take a look at this next example.

What the next example is trying to highlight is that you solve and of an and and/or operators in your conditions. As you can see here, we've got a double ampersand. That's just an and operator. And actually the or will be the double vertical line, yeah, so that there's an or.

Now, in this particular case ask yourself the following question. If x is indeed not greater than y-- well, it isn't, yeah? They're both 5.

Is there any point of actually evaluating the second part of this expression? No. You can predict the result.

Doesn't matter what the second part of the expression is if the first part of the expression is not true. So the second part doesn't need to be evaluated.

The double ampersand will actually cause the second part not to be evaluated if the value of the overall expression can be predicted from the first part of that expression.

In the case of an or statement, if the first part is true what's the point evaluating the second part? In the case of an and expression if the first part is false what's the point evaluating a second part? So hence that's why use the double ampersand and double vertical line.

Because, in fact, there is a single ampersand, a single vertical line operators as well in Java and they do evaluate both parts. Even if the first part results in false, with a single ampersand the second part will still be evaluated.

Now, here's the catch. What if you're doing something completely inappropriate in a second part like and actual action?

Think about it this way. I'm not supposed to combine actions and logic, which is the Boolean logic of a conditional statement together. That's bad coding practice.

But it can. And in this case depending on whether you will have a single ampersand or you would have a double ampersand the x will either be incremented or not.

So, again, if the code inside that if then uses the x-- for example, you use it to print out some values then if the code inside that if uses the x-- for example, we print the x inside that block, then it will matter whether you use a single or a double ampersand.

OK. Finally, the last thing that I want you to remember is this interesting case. Something went wrong here.

I can tell you exactly what went wrong. If you notice, instead of the comparison operator, which is that, I'm using an assignment operator. So this particular piece of code will not compile because I'm trying to perform inside the if block an operation that does not result in a Boolean value.

x equals y is an integers, yeah? They're not Boolean so the result will not compile. Of course, if you're doing a comparison then that will do perfectly fine, yeah. The result will compile.

However let me just change this code a little bit. So we know that if it's an equal sign and there are a pair of integers they don't compile, but what if x and y are a pair of Booleans?

Funny enough, this code will compile because although you're using an assignment operator rather than comparison, rather than double equal sign, the result of the expression is what matters here. And a result of the expression is Boolean which satisfies what if operator expects. Wants to see Boolean there, you've given it Boolean there, so it works.

There's one more thing I'd like us to note regarding the conditionals. As you can see in this particular case, I'm comparing couple of variables, x and y, and actually I'm assigning a z to different value based on the result of that comparison. That is either a 10 or a 5 based on whether x is greater than y or not. Well, obviously in this particular case the output will be 5.

However, what I would like you to note is that that could be written much shorter if you'd use a ternary operator. This is the way the ternary works. You just take the Boolean condition, then you put a question mark.

And in what value would you like to assign to z if that condition is true? So let's say 10. Then column.

And then what value would you like to assign to z if that condition is false? Well, that's fine in this case.

It works exactly like that if/else statement. If you run that that will produce exactly the same output. It's just that if only thing you want to do in your if/else condition is a sign, a variable, then you don't really need to write an if/else.

You can do it in one line. Just put a value on a sign when a condition is true which is after question mark or a value that you want to assign, which is 5, when condition is false after the column.

It's as simple as that. There's no other state here, no third possible state in that expression. Just true or false.

All right. Let's go back to the PowerPoint.

Let's take a look at the list of the Java operators. We just used some of them in the demonstration a moment ago. Increment and decrement, plus, plus, minus, minus operators-- you need to remember their position, in front or behind, prefix or postfix, multiplication, division, remainder of division, the percent sign, addition, subtraction.

Not all of these operators will be in the actual exam. For example, the bit shift. Not really, yeah, so that's-- is in this particular presentation for the following reason-- to remember the order, the precedence of operations. Remember, you can always override that precedence by using round brackets.

Yeah, and then also in this particular presentation you've notice we've used the logical and/or operators and you need to be able to distinguish between assignment and, let's say, comparison operators.

When it comes to comparing things in Java, it's important to remember the difference between comparing primitives and objects. If you want to compare a pair of primitives then you can just use a simple double equals sign operator because all you do is you're comparing values in a stack.

But when it comes to the objects, comparing things in a stack can only tell you if you're pointing to the same object in a heap or not. So, sure, you can use a double equals sign to achieve that, but it would not allow you to compare values in the heap.

So for that, to compare the object content, if two different objects in a heap has the same content, you will have to override the object's equals method. You inherit the equals method from the class object, which is an ultimate grandparent of all Java class' entire class hierarchy.

In this particular case, there's this class called Product. And you don't really say here what it extends so the compiler assumes you're extending the class object.

Let's say you want to compare two products and see if they are the same, if they do have the same name and price. So you [? override ?] the equals method. You do check if it's the same object reference because it kind of makes sense to brush this case aside.

If two different references are pointing to the same object, well, in a heap surely they have the same values and size. So if this equals obj you'd just return true. That's that.

If that's not the case, then you need to compare two different objects in a heap. You could do it by checking if the other object to which you're trying to compare the current one is actually a product. That is achieved by using an instance of operator.

Then you cast the type of the parameter there to be a product so it's safe to cast. You know you've just checked. The instance of operator returns you true, so in that block of code you're safe to cast the type to the product in order to get access to variables name and price.

Now, price is a primitive so you can just compare it with a double equals sign if it's the same or not.

What about the name? Well, name is a string. String is an object so you compare it with an equals method.

Well, fortunately in a string class equal method is already overridden so you can just call it. You could just use an existing equals method to achieve it.

So there you go. You have performed that comparison. And if they're not the same, you return false I suppose.

As you can see in the left-hand side, a code example here. You're looking at a couple of products that have been instantiated. Both of them have exactly same content, both Tea, the price is the same, but they are two different objects in a heap.

And now if you compare them with just a double equals sign, then, well, they are two different objects in a heap. They have two different references.

So the result of the p1 double equals p2 is false. But when we call the equals method because in that case we also compare object content which you would like to achieve I suppose in this case, tells us true that these two different objects actually have same values.

Right. That concludes the section.

We've looked at the if/else and ternary constructs. We looked at a switch statement. We looked at the use of different Java operators and how we can override the order of operators.

And of course how to compare different values using either double equals sign or an equals method. There you need to remember the difference between, let's say, comparing primitives and objects.

Remember, classes such as string already give you the equals method so you're kind of safe there. You can just call it. But, of course, if you write in your own class and you want a content comparison remember to add an equals method to achieve it.

All right. Let's progress to the next section.
