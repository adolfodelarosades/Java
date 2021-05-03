# 5: Using Loop Constructs

1. Using Loop Constructs - 13m

## 1. Using Loop Constructs - 13m

Using loop constructs-- well, there are different types of loops available in Java. However, when it boils down to it, they really are just different sort of ways of doing similar things, iterating through a bit of logic, executing it several times I suppose. But just you sort of organize the code around it slightly differently.

The choices or you can use while loop, do while loop, for loop, or what we call an enhanced for loop. Let's just take a quick look at these options of ours

First of all, we need to declare the iterator variable. In this example, I'm using an iterator variable called i. That's the bit that I highlighted in green. Then we want to define a termination condition. We want to terminate the loop, and the condition there is i less than 10. So for as long as i's not less than 10, we keep on iterating. And of course we must not forget about the actual iterator progression, increment and decrementing it, making sure we're actually stepping through the loop content.

Now please note, the really small difference between while and do while loops, in a do while case, you put a do in front, and then a block of code. And then you check the while condition, and you end it with a semicolon as you notice. So that means that a do while case will go through the loop content, the loop body, at least once, even if the condition might be false straight ahead. Whilst of course in a while loop, you never enter the loop body in the first place if your condition evaluates to false.

All right, well the for loop just really, on a same line, combines the declaration, the termination, and the iterator. So you're kind of combining all of these things in one place, which is, I suppose, quite useful if you really have a large loop body. You don't want to scroll up and down your source code to look for where do you declare your iterator, where do you increment it. It's all in the same line, quite concise and easy to read and easy to understand.

Lastly, the enhanced for loop can be a quick and easy way of iterating through a collection such as an array, for example. So in this particular case, I have an array of values, one to three. I simply step through the array content element by element. I'm just getting every element out of it. This int value column values allows me to just basically retrieve every next value out of the array. And a value variable can be referenced inside the block of code, the loop body, to access every element, without you having to maintain the iterator explicitly. That makes your life easier, I suppose, when you're stepping through a collection or array.

If you want to break out of a loop or skip an iteration in the loop, you can use break and continue statements. Breaking out of the loop will terminate the current loop. If you want to break out of the outer loop, you could do that, but then you need to place the label in front of the outer loop. And when you break, you use that label. So break followed by the label.

Same with a continue operation. You could break out of the loop, which means you terminate it, or you can continue in the loop, which means skipping the iteration. And if you want to skip the iteration, not in the inner loop, but in the outer loop again you could use the label there.

At this stage, I'd like to show you a demonstration of how it actually works. Well, let's just play around with some of the loop examples. This is a very simple example of the while loop, just like you've observed in PowerPoint a moment ago. So printing out the values between zero and nine.

However, let's just try to convert it to the for loop for a moment, just to see some of the interesting things about a for loop notation. So we're placing here the declaration. Then we have our Boolean condition of course. And then we also add, at the end here, the iterator. So there you go.

This for loop does exactly the same thing as the previously observed while loops, so printing values between zero and nine. But the point that I'd like to make is a very strange use of the operator which is this semicolon. Semicolon is normally treated as a statement terminator. But in a for loop, it's actually kind of separating these three positions. It's separating the declaration, the termination condition, and an iterator.

And that means that when you write in code, you can observe code like this, where a position is not actually used. That works exactly the same. But you sort of put in an empty semicolon to indicate that that particular position of the for loop notation is just not used by you. I mean, you can even degrade the for loop back to the state of the while loop, which is completely pointless, but syntactically correct. You're just using sort of empty positions at the declaration and at the iterator here, which is a little strange of course. But that's theoretically plausible.

Bear in mind that this could be taken to quite an extreme. The fact that the semicolon is now used not as a statement terminator but as a position iterator can actually be exploited. Let me show you an example here. Imagine some kind of variable. Let's call it sum. Imagine another variable i. So we're starting from zero here.

And then, at a section where we're doing the increment, the i++, we'll do this. sum plus equals i++. No semicolon at the end because that is apparently-- remember, semicolon there is a separator of positions in the for loop.

So I'm not really having to do the increment in a loop body anymore. But you see the point is that I'm doing here an action, an actual action. It's not just printing all the i's. It actually could be used to compute, let's say for example, the total sum of these i's. Let's run that. So 45 is the sum of all numbers between zero and nine. Well, that's what this code example is doing.

How about if I would not really need the intermediate prints of the i self. Funny enough, that's what you can do. You exploit the fact that the loop increment is not just a simple increment operator, but a slot of code where you can put logic. So that basically means you can write a loop without body. It's the same as writing the loop with an empty body. But you could just explicitly say no body, semicolon, terminate it. And that will print you the total sum of all numbers between zero and nine. That's perfectly valid code. That will work. So this is how you need to understand what's happening in a for loop, that you're actually using this positional notation, which is rather unusual in Java.

And then the other example that I want us to take a look at is the example with the continue and break statements. So let's iterate from nine to zero and from zero to nine. So we kind of ascend and descend iterator. And we're skipping certainly iterations when i is divisible by two with the remainder of division. So that's odd number. And we then skip that iteration. And in the other case, we break out of the inner loop if we have the i which is equal to j.

We printed out the values. Now we're printing a new line on every outer loop, and printing out the i and j values in the inner loop.

So here is how the code will run. Study it. You can pause the video at this stage, study the output to understand better exactly which cycles I'm skipping and which cycles I'm just entirely breaking out of that inner loop.

But one more thing that I want us to quickly note is the use of the label. Say for example you want to break out of the outer loop, or skip the outer loop iteration. Put a label in front of the block of code which you want to break out or in which you want to skip the iteration. And then use that label in the break or in continue.

Let's say let's break out of it here. So this break previously was breaking out of the inner loop. And now it's breaking out of the outer loop. Let's give that a try. You see, when I reach the certain case here, while i equals j, I don't really continue to the rest of the outer loop at all. Previously I was just breaking out of the inner loop, and now I'm breaking out of the outer loop. So that break statement returns the control to my program, to the curly bracket right after that end of the for loop. That's where I end up when I break out of the block labeled by the word ACME. Well, label is just an arbitrary word. Use anything as a label.

All right, let's get back to the PowerPoint now. So that concludes our section on loop constructs. We've looked at the while loop, do while loop, for loop-- with this very interesting sort of positional notation if you like, compared these loop constructs-- the enhanced for loop, remember, where we iterated through the collection array content. And also we looked at the break and continue statements including the labeled break and continue, which allows us to break out of more than one block in one go or continue in the outer loop if necessary. Let's take a look at the next chapter.
