# 5: Lambda Built-In Functional Interfaces

1. Lambda Built-In Functional Interfaces - 3m

## 1. Lambda Built-In Functional Interfaces - 3m

Section 4, Lambda Built-In Functional Interfaces. So remember from collections example, we just saw this recently. So we have ArrayList::new, this method reference. The target type of ArrayList::new is Supplier. And so, this is one of the built in interfaces that come with the JDK.

So consider this stream that prints the names of produce whose country of origin is Canada. Question. What is a target type for this three lambda expressions. Answer. The first one is a predicate, which takes one argument and returns a Boolean variable, a Boolean value. The second is a function, where it takes one argument and returns a value. And the third one is a consumer, which takes one argument and returns void.

Question. What is the data type of the argument for mapToDouble. Answer. The data type for mapToDouble is ToDoubleFunction. ToDoubleFunction is a functional interface, as you see below. The STK-- the JDK-- sorry-- contains many a convenience functional interface that replace type variables with a primitive type.

So as listed here, these are all the functional interfaces that replace type variables with double. And here's a summary of lambda built-in function interfaces. So we discussed predicate, function, consumer. We also discussed supplier, which is not listed here, and ToDoubleFunction.
