# 7: Exceptions and Assertions

1. Exceptions and Assertions - 6m

## 1. Exceptions and Assertions - 6m

Section 6, Exceptions and Assertions. We are more than halfway through our slides. Question. Why doesn't this code compile?

Answer. So there's two reasons here. If a catch block can handle more than one exception type, then the catch parameter is implicitly final. So, as we see in this catch block, the first one is able to handle exceptions of type A and C. E is implicitly final, which means we cannot assign it to a new exception.

Number two, the second catch block will never catch exceptions of type B. It's because the first catch block will catch exceptions of type B because B is a subtype of A.

Question. What is the output? So the output here is closing A closing B IOException thrown, IOException thrown. Let's go back to see the sample code to see what's actually happening.

Let's go straight to the main method. We invoke test. So test we have a try with resources statement. We'll create an instance of B called myB and an instance of A called myA. Then we'll immediately throw an I/O exception.

When this happens, the close methods of A and B are invoked in reverse order that they are created. So it will first call the close method of A. So that's why we see it closing A first. And then it will try to close B. Then we have closing B first.

And then it will throw that new I/O exception. So we'll see IOException thrown. And then we see IOException thrown again because in the main method, it prints the IOException.

However, now the question, what happened to the runtime exception? So if we go back to the sample code, we see in the close method of class A, it throws a runtime exception. So the answer. If an exception is thrown from the try block, and one or more exceptions are thrown from the try with resources statement, then those exceptions thrown from the try with resources statement are suppressed. In order to get these suppressed exceptions, you call the method get suppressed from the thrown exception.

So you see here our main method. And after we print out the I/O exception, we call get suppressed from this I/O exception. And that's how we get the runtime, or how we access the runtime exception thrown from the closed method of class A.

Question. What is the output, provided that you run the code with the -ea option, which is short for Enable Assertions, and what is wrong with the code? Answer. Divisor 1 equals 1, and we get an assertion error at 9. Let's look at the code to see what's going on.

So at line 6, it will try to do the assertion. If divisor 1 is not equal to 0, then increment it by 1. And so we get divisor 1 equals 1. Then in line 9, it will increment divisor 2 by one. And then assert if that is not equal to 0. It's not equal to 0, so we get an assertion error.

What's wrong with this code? Assert expressions should be free of side effects. Evaluating the expression, such as divisor 1 or divisor 2 is not equal to 0, should not affect any state that is visible after the evaluation is complete. So if we run this code without the -ea option, we'll get divisor 1 equals 0, divisor 2 equals 0. And, as you see in the code, in both assert statements, divisor 1 and divisor 2, their values change and they're both incremented by 1.

And here's a summary of what I said about the sample code. So here is an summary of exceptions and assertions. Multi-catch blocks. If a catch block can handle more than one exception type, then the catch privater is implicitly final. Suppressed exceptions thrown from the try resources statement, and assertions.
