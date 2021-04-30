# 1: JDKs Beyond Java SE 11

1. JDKs Beyond Java SE 11 - New - 5m
2. Switch Expressions - 5m
3. Helpful NullPointerException - New - 3m
4. Text Blocks - New - 10m

## 1. JDKs Beyond Java SE 11 - New - 5m

JDKs Beyond Java SE 11. After completing this lesson, you should be able to describe the JDK release model and describe new features added after Java SE 11. There are two support models to be aware of. The first is long-term support.

New long-term support versions released every three years. Starting in September 2018, this is JDK 11, which will be followed by JDK 17, followed by JDK 23. They're supported by Oracle for personal and commercial use for many years, and it provides you with a stable set of specifications that you can plan around. In other words, you'll know how the language is supposed to behave.

If any sort of issues come up, like security enhancements, you'll be supported with those updates. And there won't be the risk of breaking code, which is often feared when upgrading JDKs. These JDKs are good for projects that are expected to be in development and production for a long time.

The other model to keep in mind is short-term support. New short-term support versions of the JDK are released every six months, in March and September, between long-term support releases. These are supported by Oracle for six months. Say for example, you're using JDK 15. There is a feature you don't like. You wish it was enhanced. Those changes may be coming, but they're not going to be in JDK 15. You'll have to upgrade to the next version, 16. Outside of that six month window, JDK 15 has no support and no significance.

This model also helps guard against situations where smaller features may be bottlenecked by larger ones. For example, if you think back to JDK 9, modularity took a while to develop. And in the meantime, all of these other little features were ready, but because more work had to be done on modularity, all of the features were held up until everything could be released at once. By having a shorter, faster release cycle, a smaller number of enhancements will be ready much sooner than before. That's part of the rationale here.

So why two support models? To answer this we have to think about the nature of updates. What are they? There is going to be under-the-hood optimizations. There's going to be features that are added, modified, and removed. So one audience sees this and they think, I have some concerns about C and D. You're going to modify stuff? You're going to remove stuff? What are you doing? Leave my code alone. Don't break anything.

This is the long-term support audience. They need that stable set of specifications so they can be sure that products that are in development or in production for a long time aren't at risk of breaking, and you get the benefit of ongoing support for bugs and security, things like that, without the risk of getting to change JDKs or refactor your code for the specs of the next version.

Now there's a second audience who will say regarding A, B, and C, these under-the-hood optimizations, you're adding some features, you're modifying others? Well, these sound great. I can't wait. I want to use them right away. This is the audience who the short-term support version is intended for, where you can get the latest and greatest sooner. This will include standardized and preview features. Preview features are to test and refine specifications before they're standardized.

Let's look at an example of how this might play out. Let's say we have this hypothetical preview feature in JDK 12. This preview feature, it will start with one set of specifications and that'll give developers a chance to play around with it, test it out, and we'll get feedback on what they like, what they don't like, what they find confusing, and where can we enhance this. And so based on that information, in the next JDK-- 13, for example-- we'll have a second preview, where the specifications are refined.

Now it may be that old code using the JDK 12 specifications of the feature are going to break. For example, let's say the JDK 12 version had a keyword, and people that understand that keyword. So in JDK 13, we said, OK, we'll get rid of the keyword. So any code that's going to use that is going to be broken, and you'll have to refactor it. And again, this will give people a chance to test the feature out. We can gather data on where people get stuck, what they like, what they don't like.

Eventually, we should be able to refine the specs enough so that we have something that's intuitive and robust enough. So by JDK 14, for example, a feature becomes standardized. Later JDKs should be backward compatible with the work you did in JDK 14, meaning that old code shouldn't break now that the feature has been standardized. In this lesson, we'll only examine features which have been standardized.

## 2. Switch Expressions - 5m

Switch expressions. To appreciate the benefits of switch expressions, it helps to look at their ancestor switch statements. Here, we have an example of a switch statement. It looks at an integer month.

Depending which case is true, it will print the number of days associated with that month. If month, defined elsewhere, equals 12, this first case is triggered, and 31 days is printed. And then, we'll break out of the switch statement.

Now, if that break isn't there, we'll have a fall through behavior. 31 days is printed. Then, the next case executes. 30 days prints.

So we're printing both 31 and 30 days. That's not the behavior we want. In fact, we'll most likely always want to write break statements within our switches. If it's something that we know that we're going to almost always need, why not have that be the default behavior? Why have this additional keyword in there?

The reason dates back to the early days of Java. The intention was to model what was familiar to developers writing in C++. Adoption of Java would be less difficult if it was based on what's familiar. Fall through may be useful for writing low level code, such as parsers or binary encodings, which is how C++ is often used. But in Java, switch is mostly used in higher level contexts, and this fall through behavior is rarely necessary.

Although the intention was to give developers a flexibility to use a fall through behavior or not based on a simple single keyword, the reality is it's unintuitive and rarely used in Java. Developers may miss a break, the code ends up being very verbose or difficult to read and debug, and so this flexibility is just not worth the overhead.

This is where switch expressions come in. They have no break statements, and no fall through behavior, and they look a lot cleaner. Case labels are written as case, then the label, then the arrow. A case may list several values that are comma separated.

A true case may execute one line, which is written directly after the arrow, or it may execute a block of code contained within curly braces. Often, you'll use switches to set the value of a variable.

What this looked like before was you declare a variable, and then within each case, you'll set a different value for that variable. This is a lot more concise with switch expressions. Think of a switch expression as yielding a returning value. You can declare your variable and set it equal to whatever that switch evaluates to or yields.

The simplest case is just to write that value following the arrow. If a case requires a block of code, you need to use the keyword yield. Yield only has special meaning within switch expressions, which means if you happen to name a variable elsewhere yield, your code won't break when you upgrade your JDK. All cases must yield the value one way or another. Remember to add the semicolon at the end.

Variable scope differs between switch statements and switch expressions. In switch statements, a variable scope is the entire statement. For example, here, we're declaring a string variable message1. If we try to declare that elsewhere, we'll get an error message-- variable message1 is already defined.

On the other hand, in switch expressions, a variable scope is only the case where it's declared. In this example, if we declare a string variable message1 within one case, there is no issue with declaring a variable with the same name in another case. The scope within cases is distinct.

## 3. Helpful NullPointerException - New - 3m

Helpful NullPointerExceptions. It's common to have objects with object fields. These fields could be individual instances, arrays, a collection, et cetera. This example represents a scenario slightly exaggerated with individual instances. In this example, class A is going to have a B field, class B is going to have a C field, class C is going to have a D field. You may find yourself using the dot operator several times on methods that return object values until you eventually drill down far enough.

We have our instance A, which is trying to get B, which will get C, which will get D, and then perform some action. Any one of these objects could be null. The usual NullPointerException message is too generic to be of much use. As a developer, you still need to investigate each object in the chain to determine where the null occurs. If this occurs in production rather than in development, debugging is going to take even longer when there's no additional information to help the developer reproduce the issue. Now, you could try, instead of having this chain, create a reference to an object of type A, [? create ?] [? a reference ?] to an object of type B, C, and D. That's doable as a developer but probably not doable once your software is in production.

You can reveal more detailed information, but should you? Yes, it may be worth doing if it will help you with debugging if that additional information and the output reveals what class or method produces the exception. If that's the case, you need to set the VM option to include -XX:+ShowCodeDetailsInExceptionMessages. This is turned on by default as of JDK15+. The answer may be no if this more detailed information represents a security risk because it reveals sensitive information about the inner workings of your program. If that's the case, turn off this VM option. Minus to turn the option off. Plus to turn the option on.

How do you disable this option to prevent Helpful NullPointerExceptions? In NetBeans, right-click the project. Select Properties, select Run, and then in the VM Option box, write the appropriate command. Then click OK.

If we try running this code again, we get more detailed information. So here's where things go wrong in our chain. This instance of object C has a null value for its D object field. As a result, calling .geD() returns the null value. And when you have a null, you're not allowed to call any methods on that instance.

## 4. Text Blocks - New - 10m

Text blocks-- let's talk about the readability of string literals. Here, we have an example string that's being prepared for a SQL query. Our query requires us to write double quotes around certain items. We can't do that in Java without signifying the end of the string literal. To get around this, we include the backslash escape character followed by a double quote to create an escape sequence.

If we were to write all this code on a single line, it becomes difficult to read and analyze. You need to scroll to see new code. But you also need to remember what's offscreen.

To make this string more readable, it should be written across multiple lines. We need syntax to signify these line breaks and concatenations, but multi-line strings begin to look cryptic with escape characters, concatenations, and things like that. If we make a mistake in our code, troubleshooting requires us to wrestle with both the Java and SQL syntax.

Readability improves because text blocks remove the need for such syntax. It creates a situation where, essentially, what you see is what you get. Troubleshooting this code is largely an exercise in parsing SQL, not Java.

Text blocks are denoted between matching triple quotes. Text blocks are handled by a Java compiler algorithm, which first addresses whitespace, followed by escape sequences. Let's demonstrate this in JShell.

We'll enter our text block. Although the source code is written neatly as a text block, the resulting string is represented as something more traditional, with proper whitespacing and escape characters. They are string literals with access to all the same string methods.

And speaking of methods, it may be the case that you'd like to supply some dynamic input into a string. The new method formatted accommodates this. Include the proper notation in your text blocks. Call the formatted method on the string, and supply the necessary values. Values are plugged in in the order you supply them to this method.

Here, for example, we want to dynamically include a variable city, rather than the hardcoded Indianapolis. We have our %s call the formatted method on the string, and supply it with a string city value. This last example expands on this idea, because the formatted method accommodates an unspecified number of arguments.

We have a %s for a string, a %f for a floating point value. Formatted is called, and it's supplied with a city string and a floating point salary. Just be sure the order and type of these values properly correspond to the order and type of what's found in the string.

What about all this space that seems to be included in the string literals? The compiler algorithm differentiates incidental whitespace from essential whitespace. Incidental whitespace, shown as dots in these examples, are omitted from the string literal. Essential whitespace is retained by the string literal. Whichever line has a non-whitespace character positioned farthest left denotes the beginning of essential whitespace.

In this first example, there are a few lines with the same amount of whitespace before you get to meaningful characters. In the resulting string, these lines are snug right at the beginning of the lines. If you need additional leading whitespace, a simple trick is to use the triple quote. If we move this text four spaces to the left, we reduce what's considered incidental whitespace. The resulting string is indented by four spaces.

Writing the triple quote on a new line concludes the string literal with a new line. What if we don't want this additional new line? Writing the triple quote on the previous slide avoids this. If you relied on the triple quote to mark the beginning of essential whitespace, you can use the indent method instead.

The first example uses the triple quote to create a new line and signify four spaces are used as essential whitespace, just like before. The second example creates a string that is still indented by four spaces, but does not conclude with an additional line. This is done by writing the triple quote on the previous line and using the indent method, where indentation is added after the fact.

You may have written extra spaces at the end of each line. This is known as trailing whitespace. Trailing whitespace is also stripped out by the algorithm. It can be preserved if necessary. One tactic to do this is to add dummy characters and replace them after the text block has been processed.

This example uses the dollar symbol and replaces it with a space afterwards. This example creates a character fence, where the or symbol denotes the right edge of the text block. Keep in mind that the resulting string literals created by text blocks may contain line breaks. We'll need to replace or backslash n with backslash n.

Another tactic is to utilize the new backslash s escape character to insert a space. This works because of the Java compiler algorithm for text blocks. Whitespace is accounted for first, meaning the space indicated by this escape sequence. And escape sequences, in general, aren't affected yet.

Yes, escape sequences are allowed in text blocks, but they should be used sparingly to avoid convolution. The intended benefit of text blocks is to cleanly present text in a way that minimizes mental parsing and deciphering-- in other words, ensuring that what you see is what you get. Escape sequences offer the opposite. If you do decide to use escape sequences, be careful that they don't compromise readability. New escape sequences exist for text blocks.

We've discussed backslash s to insert a space. Backslash at the end of the line prevents automatic line breaks in the resulting string literal. And if you really want to write a triple quote within a text block without signifying the end of the text block, use the backslash triple quote. You can see the effects of these escape sequences in these code examples.

Both show how the escape sequence for a triple quote can be written in the text block. Backslash s shows how to insert a space. And backslash at the end of the line shows how to disable the automatic new line. The Java compiler algorithm for text blocks has several steps. This includes stripping whitespace and translating escape sequences.

New methods in the string API allow you to leverage these components of the algorithm on your own strings. This can be helpful when dealing with programs that read text as input data, where there is naturally uncertainty from the human element of what in the world our user is going to input into this program. StripIndent identifies what would be considered whitespace and removes it. translateEscapes escapes allows whatever escape sequences are found in a string to take effect. You can see the differences here when the tab is inserted into this text.

Just a few concluding tips and guidelines-- avoid mixing use of the Space key and Tab key on your keyboard to insert whitespace. Mixing spaces and tabs may produce inconsistent and unexpected results. You can use the flag minus Xlint colon, text-blocks to spot and warn of space/tab combinations.

There are style guidelines written by Java engineers. This slide shows one such guideline, just to give you a sampling of what you can expect from this resource. For example, avoid aligning the opening and closing delimiters and the text block's left margin. This requires re-indentation of the text block if the variable name or modifiers are changed.

What does this mean? Let's say we write our text block like this. If we decide to modify the declaration, the text becomes misaligned, and we have a bunch of edits to do to realign everything. It's better to write the text block like this, where we indent as if it were a new block of code. If the declaration changes, nothing else gets misaligned.

That takes us to the end of this lesson. You should have learned how to describe the JDK release model and describe new features added after Java SE 11.
