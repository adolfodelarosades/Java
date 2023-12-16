# Table of Contents

Copyright

Brief Table of Contents

Table of Contents

Praise for the previous edition, Java 8 in Action, by Raoul-Gabriel Urma, Mario Fusco, and Alan Mycroft.

Preface

Acknowledgments

About this book

About the authors

About the cover illustration

## 1. Fundamentals

### Chapter 1. Java 8, 9, 10, and 11: what’s happening?

* 1.1. So, what’s the big story?

* 1.2. Why is Java still changing?

   * 1.2.1. Java’s place in the programming language ecosystem

   * 1.2.2. Stream processing

   * 1.2.3. Passing code to methods with behavior parameterization

   * 1.2.4. Parallelism and shared mutable data

   * 1.2.5. Java needs to evolve

* 1.3. Functions in Java

   * 1.3.1. Methods and lambdas as first-class citizens

   * 1.3.2. Passing code: an example

   * 1.3.3. From passing methods to lambdas

* 1.4. Streams

   * 1.4.1. Multithreading is difficult

* 1.5. Default methods and Java modules

* 1.6. Other good ideas from functional programming

* Summary

### Chapter 2. Passing code with behavior parameterization

* 2.1. Coping with changing requirements

   * 2.1.1. First attempt: filtering green apples

   * 2.1.2. Second attempt: parameterizing the color

   * 2.1.3. Third attempt: filtering with every attribute you can think of

* 2.2. Behavior parameterization

   * 2.2.1. Fourth attempt: filtering by abstract criteria

* 2.3. Tackling verbosity

   * 2.3.1. Anonymous classes

   * 2.3.2. Fifth attempt: using an anonymous class

   * 2.3.3. Sixth attempt: using a lambda expression

   * 2.3.4. Seventh attempt: abstracting over List type

* 2.4. Real-world examples

   * 2.4.1. Sorting with a Comparator

   * 2.4.2. Executing a block of code with Runnable

   * 2.4.3. Returning a result using Callable

   * 2.4.4. GUI event handling

* Summary

### Chapter 3. Lambda expressions

* 3.1. Lambdas in a nutshell

* 3.2. Where and how to use lambdas

   * 3.2.1. Functional interface

   * 3.2.2. Function descriptor

* 3.3. Putting lambdas into practice: the execute-around pattern

   * 3.3.1. Step 1: Remember behavior parameterization

   * 3.3.2. Step 2: Use a functional interface to pass behaviors

   * 3.3.3. Step 3: Execute a behavior!

   * 3.3.4. Step 4: Pass lambdas

* 3.4. Using functional interfaces

   * 3.4.1. Predicate

   * 3.4.2. Consumer

   * 3.4.3. Function

* 3.5. Type checking, type inference, and restrictions

   * 3.5.1. Type checking

   * 3.5.2. Same lambda, different functional interfaces

   * 3.5.3. Type inference

   * 3.5.4. Using local variables

* 3.6. Method references

   * 3.6.1. In a nutshell

   * 3.6.2. Constructor references

* 3.7. Putting lambdas and method references into practice

   * 3.7.1. Step 1: Pass code

   * 3.7.2. Step 2: Use an anonymous class

   * 3.7.3. Step 3: Use lambda expressions

   * 3.7.4. Step 4: Use method references

* 3.8. Useful methods to compose lambda expressions

   * 3.8.1. Composing Comparators

   * 3.8.2. Composing Predicates

   * 3.8.3. Composing Functions

* 3.9. Similar ideas from mathematics

   * 3.9.1. Integration

   * 3.9.2. Connecting to Java 8 lambdas

* Summary

## 2. Functional-style data processing with streams

### Chapter 4. Introducing streams

* 4.1. What are streams?

* 4.2. Getting started with streams

* 4.3. Streams vs. collections

   * 4.3.1. Traversable only once

   * 4.3.2. External vs. internal iteration

* 4.4. Stream operations

   * 4.4.1. Intermediate operations

   * 4.4.2. Terminal operations

   * 4.4.3. Working with streams

* 4.5. Road map

* Summary

### Chapter 5. Working with streams

* 5.1. Filtering

   * 5.1.1. Filtering with a predicate

   * 5.1.2. Filtering unique elements

* 5.2. Slicing a stream

   * 5.2.1. Slicing using a predicate

   * 5.2.2. Truncating a stream

   * 5.2.3. Skipping elements

* 5.3. Mapping

   * 5.3.1. Applying a function to each element of a stream

   * 5.3.2. Flattening streams

* 5.4. Finding and matching

   * 5.4.1. Checking to see if a predicate matches at least one element

   * 5.4.2. Checking to see if a predicate matches all elements

   * 5.4.3. Finding an element

   * 5.4.4. Finding the first element

* 5.5. Reducing

   * 5.5.1. Summing the elements

   * 5.5.2. Maximum and minimum

* 5.6. Putting it all into practice

   * 5.6.1. The domain: Traders and Transactions

   * 5.6.2. Solutions

* 5.7. Numeric streams

   * 5.7.1. Primitive stream specializations

   * 5.7.2. Numeric ranges

   * 5.7.3. Putting numerical streams into practice: Pythagorean triples

* 5.8. Building streams

   * 5.8.1. Streams from values

   * 5.8.2. Stream from nullable

   * 5.8.3. Streams from arrays

   * 5.8.4. Streams from files

   * 5.8.5. Streams from functions: creating infinite streams!

* 5.9. Overview

* Summary

### Chapter 6. Collecting data with streams

* 6.1. Collectors in a nutshell

   * 6.1.1. Collectors as advanced reductions

    * 6.1.2. Predefined collectors

* 6.2. Reducing and summarizing

   * 6.2.1. Finding maximum and minimum in a stream of values

   * 6.2.2. Summarization

   * 6.2.3. Joining Strings

   * 6.2.4. Generalized summarization with reduction

* 6.3. Grouping

   * 6.3.1. Manipulating grouped elements

   * 6.3.2. Multilevel grouping

   * 6.3.3. Collecting data in subgroups

* 6.4. Partitioning

   * 6.4.1. Advantages of partitioning

   * 6.4.2. Partitioning numbers into prime and nonprime

* 6.5. The Collector interface

   * 6.5.1. Making sense of the methods declared by Collector interface

   * 6.5.2. Putting them all together

* 6.6. Developing your own collector for better performance

   * 6.6.1. Divide only by prime numbers

   * 6.6.2. Comparing collectors’ performances

* Summary

### Chapter 7. Parallel data processing and performance

* 7.1. Parallel streams

   * 7.1.1. Turning a sequential stream into a parallel one

   * 7.1.2. Measuring stream performance

   * 7.1.3. Using parallel streams correctly

   * 7.1.4. Using parallel streams effectively

* 7.2. The fork/join framework

   * 7.2.1. Working with RecursiveTask

   * 7.2.2. Best practices for using the fork/join framework

   * 7.2.3. Work stealing

* 7.3. Spliterator

   * 7.3.1. The splitting process

   * 7.3.2. Implementing your own Spliterator

* Summary

## 3. Effective programming with streams and lambdas

### Chapter 8. Collection API enhancements

* 8.1. Collection factories

   * 8.1.1. List factory

   * 8.1.2. Set factory

   * 8.1.3. Map factories

* 8.2. Working with List and Set

   * 8.2.1. removeIf

   * 8.2.2. replaceAll

* 8.3. Working with Map

   * 8.3.1. forEach

   * 8.3.2. Sorting

   * 8.3.3. getOrDefault

   * 8.3.4. Compute patterns

   * 8.3.5. Remove patterns

   * 8.3.6. Replacement patterns

   * 8.3.7. Merge

* 8.4. Improved ConcurrentHashMap

   * 8.4.1. Reduce and Search

   * 8.4.2. Counting

   * 8.4.3. Set views

* Summary

### Chapter 9. Refactoring, testing, and debugging

* 9.1. Refactoring for improved readability and flexibility

   * 9.1.1. Improving code readability

   * 9.1.2. From anonymous classes to lambda expressions

   * 9.1.3. From lambda expressions to method references

   * 9.1.4. From imperative data processing to Streams

   * 9.1.5. Improving code flexibility

* 9.2. Refactoring object-oriented design patterns with lambdas

   * 9.2.1. Strategy

   * 9.2.2. Template method

   * 9.2.3. Observer

   * 9.2.4. Chain of responsibility

   * 9.2.5. Factory

* 9.3. Testing lambdas

   * 9.3.1. Testing the behavior of a visible lambda

   * 9.3.2. Focusing on the behavior of the method using a lambda

   * 9.3.3. Pulling complex lambdas into separate methods

   * 9.3.4. Testing high-order functions

* 9.4. Debugging

   * 9.4.1. Examining the stack trace

   * 9.4.2. Logging information

* Summary

### Chapter 10. Domain-specific languages using lambdas

* 10.1. A specific language for your domain

   * 10.1.1. Pros and cons of DSLs

   * 10.1.2. Different DSL solutions available on the JVM

* 10.2. Small DSLs in modern Java APIs

   * 10.2.1. The Stream API seen as a DSL to manipulate collections

   * 10.2.2. Collectors as a DSL to aggregate data

* 10.3. Patterns and techniques to create DSLs in Java

   * 10.3.1. Method chaining

   * 10.3.2. Using nested functions

   * 10.3.3. Function sequencing with lambda expressions

   * 10.3.4. Putting it all together

   * 10.3.5. Using method references in a DSL

* 10.4. Real World Java 8 DSL

   * 10.4.1. jOOQ

   * 10.4.2. Cucumber

   * 10.4.3. Spring Integration

* Summary

## 4. Everyday Java

### Chapter 11. Using Optional as a better alternative to null

* 11.1. How do you model the absence of a value?

   * 11.1.1. Reducing NullPointerExceptions with defensive checking

   * 11.1.2. Problems with null

   * 11.1.3. What are the alternatives to null in other languages?

* 11.2. Introducing the Optional class

* 11.3. Patterns for adopting Optionals

   * 11.3.1. Creating Optional objects

   * 11.3.2. Extracting and transforming values from Optionals with map

   * 11.3.3. Chaining Optional objects with flatMap

   * 11.3.4. Manipulating a stream of optionals

   * 11.3.5. Default actions and unwrapping an Optional

   * 11.3.6. Combining two Optionals

   * 11.3.7. Rejecting certain values with filter

* 11.4. Practical examples of using Optional

   * 11.4.1. Wrapping a potentially null value in an Optional

   * 11.4.2. Exceptions vs. Optional

   * 11.4.3. Primitive optionals and why you shouldn’t use them

   * 11.4.4. Putting it all together

* Summary

### Chapter 12. New Date and Time API

* 12.1. LocalDate, LocalTime, LocalDateTime, Instant, Duration, and Period

   * 12.1.1. Working with LocalDate and LocalTime

   * 12.1.2. Combining a date and a time

   * 12.1.3. Instant: a date and time for machines

   * 12.1.4. Defining a Duration or a Period

* 12.2. Manipulating, parsing, and formatting dates

   * 12.2.1. Working with TemporalAdjusters

   * 12.2.2. Printing and parsing date-time objects

* 12.3. Working with different time zones and calendars

   * 12.3.1. Using time zones

   * 12.3.2. Fixed offset from UTC/Greenwich

   * 12.3.3. Using alternative calendar systems

* Summary

### Chapter 13. Default methods

* 13.1. Evolving APIs

   * 13.1.1. API version 1

   * 13.1.2. API version 2

* 13.2. Default methods in a nutshell

* 13.3. Usage patterns for default methods

   * 13.3.1. Optional methods

   * 13.3.2. Multiple inheritance of behavior

* 13.4. Resolution rules

   * 13.4.1. Three resolution rules to know

   * 13.4.2. Most specific default-providing interface wins

   * 13.4.3. Conflicts and explicit disambiguation

   * 13.4.4. Diamond problem

* Summary

### Chapter 14. The Java Module System

* 14.1. The driving force: reasoning about software

   * 14.1.1. Separation of concerns

   * 14.1.2. Information hiding

   * 14.1.3. Java software

* 14.2. Why the Java Module System was designed

   * 14.2.1. Modularity limitations

   * 14.2.2. Monolithic JDK

   * 14.2.3. Comparison with OSGi

* 14.3. Java modules: the big picture

* 14.4. Developing an application with the Java Module System

   * 14.4.1. Setting up an application

   * 14.4.2. Fine-grained and coarse-grained modularization

   * 14.4.3. Java Module System basics

* 14.5. Working with several modules

   * 14.5.1. The exports clause

   * 14.5.2. The requires clause

   * 14.5.3. Naming

* 14.6. Compiling and packaging

* 14.7. Automatic modules

* 14.8. Module declaration and clauses

   * 14.8.1. requires

   * 14.8.2. exports

   * 14.8.3. requires transitive

   * 14.8.4. exports to

   * 14.8.5. open and opens

   * 14.8.6. uses and provides

* 14.9. A bigger example and where to learn more

* Summary

## 5. Enhanced Java concurrency

### Chapter 15. Concepts behind CompletableFuture and reactive programming

* 15.1. Evolving Java support for expressing concurrency

   * 15.1.1. Threads and higher-level abstractions

   * 15.1.2. Executors and thread pools

   * 15.1.3. Other abstractions of threads: non-nested with method calls

   * 15.1.4. What do you want from threads?

* 15.2. Synchronous and asynchronous APIs

   * 15.2.1. Future-style API

   * 15.2.2. Reactive-style API

   * 15.2.3. Sleeping (and other blocking operations) considered harmful

   * 15.2.4. Reality check

   * 15.2.5. How do exceptions work with asynchronous APIs?

* 15.3. The box-and-channel model

* 15.4. CompletableFuture and combinators for concurrency

* 15.5. Publish-subscribe and reactive programming

   * 15.5.1. Example use for summing two flows

   * 15.5.2. Backpressure

   * 15.5.3. A simple form of real backpressure

* 15.6. Reactive systems vs. reactive programming

* 15.7. Road map

* Summary

### Chapter 16. CompletableFuture: composable asynchronous programming

* 16.1. Simple use of Futures

   * 16.1.1. Understanding Futures and their limitations

   * 16.1.2. Using CompletableFutures to build an asynchronous application

* 16.2. Implementing an asynchronous API

   * 16.2.1. Converting a synchronous method into an asynchronous one

   * 16.2.2. Dealing with errors

* 16.3. Making your code nonblocking

   * 16.3.1. Parallelizing requests using a parallel Stream

   * 16.3.2. Making asynchronous requests with CompletableFutures

   * 16.3.3. Looking for the solution that scales better

   * 16.3.4. Using a custom Executor

* 16.4. Pipelining asynchronous tasks

   * 16.4.1. Implementing a discount service

   * 16.4.2. Using the Discount service

   * 16.4.3. Composing synchronous and asynchronous operations

   * 16.4.4. Combining two CompletableFutures: dependent and independent

   * 16.4.5. Reflecting on Future vs. CompletableFuture

   * 16.4.6. Using timeouts effectively

* 16.5. Reacting to a CompletableFuture completion

   * 16.5.1. Refactoring the best-price-finder application

   * 16.5.2. Putting it all together

* 16.6. Road map

* Summary

### Chapter 17. Reactive programming

* 17.1. The Reactive Manifesto

   * 17.1.1. Reactive at application level

   * 17.1.2. Reactive at system level

* 17.2. Reactive streams and the Flow API

   * 17.2.1. Introducing the Flow class

   * 17.2.2. Creating your first reactive application

   * 17.2.3. Transforming data with a Processor

   * 17.2.4. Why doesn’t Java provide an implementation of the Flow API?

* 17.3. Using the reactive library RxJava

   * 17.3.1. Creating and using an Observable

   * 17.3.2. Transforming and combining Observables

* Summary

## 6. Functional programming and future Java evolution

### Chapter 18. Thinking functionally

* 18.1. Implementing and maintaining systems

   * 18.1.1. Shared mutable data

   * 18.1.2. Declarative programming

   * 18.1.3. Why functional programming?

* 18.2. What’s functional programming?

   * 18.2.1. Functional-style Java

   * 18.2.2. Referential transparency

   * 18.2.3. Object-oriented vs. functional-style programming

   * 18.2.4. Functional style in practice

* 18.3. Recursion vs. iteration

* Summary

### Chapter 19. Functional programming techniques

* 19.1. Functions everywhere

   * 19.1.1. Higher-order functions

   * 19.1.2. Currying

* 19.2. Persistent data structures

   * 19.2.1. Destructive updates vs. functional

   * 19.2.2. Another example with Trees

   * 19.2.3. Using a functional approach

* 19.3. Lazy evaluation with streams

   * 19.3.1. Self-defining stream

   * 19.3.2. Your own lazy list

* 19.4. Pattern matching

   * 19.4.1. Visitor design pattern

   * 19.4.2. Pattern matching to the rescue

* 19.5. Miscellany

   * 19.5.1. Caching or memoization

   * 19.5.2. What does “Return the same object” mean?

   * 19.5.3. Combinators

* Summary

### Chapter 20. Blending OOP and FP: Comparing Java and Scala

* 20.1. Introduction to Scala

   * 20.1.1. Hello beer

   * 20.1.2. Basic data structures: List, Set, Map, Tuple, Stream, Option

* 20.2. Functions

   * 20.2.1. First-class functions in Scala

   * 20.2.2. Anonymous functions and closures

   * 20.2.3. Currying

* 20.3. Classes and traits

   * 20.3.1. Less verbosity with Scala classes

   * 20.3.2. Scala traits vs. Java interfaces

* Summary

### Chapter 21. Conclusions and where next for Java

* 21.1. Review of Java 8 features

   * 21.1.1. Behavior parameterization (lambdas and method references)

   * 21.1.2. Streams

   * 21.1.3. CompletableFuture

   * 21.1.4. Optional

   * 21.1.5. Flow API

   * 21.1.6. Default methods

* 21.2. The Java 9 module system

* 21.3. Java 10 local variable type inference

* 21.4. What’s ahead for Java?

   * 21.4.1. Declaration-site variance

   * 21.4.2. Pattern matching

   * 21.4.3. Richer forms of generics

    * 21.4.4. Deeper support for immutability

    * 21.4.5. Value types

* 21.5. Moving Java forward faster

* 21.6. The final word

### A. Miscellaneous language updates

* A.1. Annotations

   * A.1.1. Repeated annotations

   * A.1.2. Type annotations

* A.2. Generalized target-type inference

### B. Miscellaneous library updates

* B.1. Collections

   * B.1.1. Additional methods

   * B.1.2. The Collections class

   * B.1.3. Comparator

* B.2. Concurrency

   * B.2.1. Atomic

    * B.2.2. ConcurrentHashMap

* B.3. Arrays

   * B.3.1. Using parallelSort

   * B.3.2. Using setAll and parallelSetAll

   * B.3.3. Using parallelPrefix

* B.4. Number and Math

   * B.4.1. Number

   * B.4.2. Math

* B.5. Files

* B.6. Reflection

* B.7. String

### C. Performing multiple operations in parallel on a stream

* C.1. Forking a stream

   * C.1.1. Implementing the Results interface with the ForkingStreamConsumer

   * C.1.2. Developing the ForkingStreamConsumer and the BlockingQueueSpliterator

   * C.1.3. Putting the StreamForker to work

* C.2. Performance considerations

### D. Lambdas and JVM bytecode

* D.1. Anonymous classes

* D.2. Bytecode generation

* D.3. Invokedynamic to the rescue

* D.4. Code-generation strategies

Index

List of Figures

List of Tables

List of Listings
