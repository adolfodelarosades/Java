# 3: JavaScript Fundamentals

1. JavaScript Fundamentals - 1h 1m
2. Practice 3-1: Passing JavaScript Tests in JSConsole with Jasmine - 7m

## 1. JavaScript Fundamentals - 1h 1m

All right, let's go ahead and cover now lesson 3, which pretty much starts the JavaScript programming. And we start with lesson JavaScript Fundamentals. The objective of this Lesson to start writing JavaScript code by maybe declaring variables, creating objects, creating and calling a function, creating and iterating through an array, writing JavaScript arrays to store data, defining JavaScript objects as key value pair store, and then, of course, access the properties of an object by using the get and set.

So we start with the part I. So we divide it into the couple of parts. The first one, we'll cover the grammar by going through variables, types, expressions, operators, statements, and loops. And then the second one would be discussing the objects and, in JavaScript, the arrays and functions.

So let's go ahead and compare JavaScript to Java. Now, one thing that we need to mention in this case, ladies and gentlemen, is that JavaScript has nothing to do with Java in the sense that, yes, you could call a Java from JavaScript. But they're totally two different languages, you know?

The name JavaScript was given to it just for a marketing word. That's all. OK? So, for example, in Java, you can declare a variable var x and and set it to five as an example.

In Java, it's basically a type tight. So in a sense that int x, you know, you have to assign an integer to it. But on the other hand, when you declare a variable in JavaScript, you can put anything you want in it.

And we can go ahead and create user constructor to create an instance of a car in Java. In JavaScript, we have another concept which is creating a prototype, a car prototype to create an object, you know, and assign it or kind of save it into the variable or assign it to the variable car. And then, of course, Java has the concept of inheritance.

JavaScript does not have the concept of inheritance. Instead, it has the concept of prototype, you know, which kind of similar. It has some similarity.

You can create a method or a function in Java. In this case, we have my function that is a method that returns void, which means nothing, and, of course, the print state, println, a statement to print hello world to the console to the screen. You know, in JavaScript, we can go ahead and create a function.

In this case, it turned out that the function we create is called a my function. And you see we have the keyword function in front of it. OK. So that's basically what we have. And then we'll go ahead and the output of the console of JavaScript-- hello world, an example.

So let's examine a little bit the grammar of JavaScript. JavaScript is case sensitive, which means there's a difference between getElementById with a lowercase d versus getElementByID with a capital D. OK? And then, of course, you can go ahead and see the escape sequence is set by the backslash u. Here are some examples about how we can use a line field-- in this case, the backslash u00A which is allowed in comments to, in this case, allow you to go to the next line.

You can comment you're JavaScript either through // and then one line at a time for comments, or you can put the comments between /* and */, pretty much similar to, in this case, the comments that we put in C language in Java. So the literals basically represent values in JavaScript. And you can have a null value, or you can have a string.

String, by the way, in JavaScript can be represented between double quotes or single quotes. True in this case would be a Boolean value. And 15.5 would be pretty much, in this case, a numeric value. OK?

In JavaScript, you can go ahead and declare a variable and set it, for example, to a number-- in this case, 15.5. And actually, you don't have to put the semicolon. The JavaScript will insert the semicolon for you. OK?

Except that-- be careful with that. We typically advise you, it's, you know, highly recommended, that you provide an explicit semicolon, you know, in every statement or JavaScript statement. That's a lot better.

And because, you know, the first one, of course, we can go ahead and use it and then a semicolon is automatically inserted after the 15.5, but in the second one it actually can be misleading. For example, here, I have a equal c plus c. And then, you know, the second line it says between parenthesis, d plus e.

So in this case, the semicolon is not inserted. Because the interpreter thinks that c is a function. Because it's followed by open parentheses, and then you have e, d plus e. So that's why, in general, it's a good idea to always put in a semicolon. This way, you know, explicitly, you don't have this type of an error.

And in Java, we can go ahead can pretty much use any type of identifiers, you know, in this case to represent the name of a given variable or a function, you know, and so forth. And so these identifiers can contain underscores, as you see over there. The underscore character can also contain a dollar sign.

And also, you cannot use the reserved words as a identifier for variables or functions. So this reserved word that you see in this table-- break, do, instance, of, type, case, you know, type of, as new, and so forth, you know, all the way in-- these are reserved words. And these JavaScript reserved words cannot be used as identifiers. That's basically all we tell you.

All right, but in general, you know, these are you can have underscores or you can have a dollar sign. That's pretty much you can start with an underscore or start with a dollar sign and have an underscore in between. That's all acceptable in JavaScript for identifiers, which are names of variables or functions.

OK. So remember that. Because at some point in time, I will go through examples. And then I'll most probably ask the question. And, you know, you need to, you know, kind of think about the answer for all that.

So examining the grammar of JavaScript, again, continuing with that, you know, we do have also another example where, you know, in this case I have a function called findPrice. And then I use the use strict. The use strict in this case you can go ahead and use it. Pretty much it's called strict mode.

And if you put it right at the beginning of a file, you know, the strict mode what it does, you know, it is basically a secure and robust and error-free type compared to the normal JavaScript. For example, in this case, I put down use strict. And then I put a variable price set to a 1,200.

This will cause an encode reference error, which means we're trying to, you know-- pretty much, in this case, you will get an error. Just because, you know, you did not define the price as a variable. You know, so that's why whenever you use the use strict, you need to somehow use var price and then whatever set to 1,200.

On the other hand, in the non-strict mode, which is the normal mode in Java, you can go ahead and use a variable just directly like this and then set it to whatever value. This line does not cause any error just to let you know. OK?

Now, looking at the variables and types-- well, JavaScript has six, in this case, types of values. So it has undefined. And undefined types have one, in this case, value each undefined and [INAUDIBLE].

And then you have the null. In this case, example is var b set to null. You also have a Boolean, which is either true or false. You have a string, which is, again, a string between the double quotes or single quotes.

You have a number, which is any number either contained decimal number or just a whole number, and an object. Of course, an object here is composed of properties-- name value, a properties. So here, we're just creating an object for the object for the type.

So now looking at, in this case, declaring a variable, so here are examples on how we declare variables. OK? I can just go ahead and declare just a variable, and that's it. Or, like in this case, var a, OK, which means, you know, it does not contain, so which means a is, you know, the value of a is undefined.

Or I can declare x and set it, you know, to 15.5. Or I can declare variable y and set it to a string total. And usually, you know, when you declare a variable, you can maybe later on assign a value to it. That's OK. OK?

Now, let's take a look at variables in functions. In general, a variable, it can have a global scope, which is defined at the browser level, at the window level of the browser. Or you can have what we call a variable in the function or functional variable. OK?

So, for example, here, I do have a declared variable as a function. And then between curly brace here and then the curly brace here, it has an if true. And then it has a variable x set to the string declared in a block of a code.

And then later on outside, in this case, the curly brace, we go ahead and try to, in this case, print the value of x. And when you call this declare variable, well, believe it or not, x will actually be printed. And the reason why is because, in this case, x, even though we declared that within that a block, it's still visible throughout the whole class-- rather than the whole function. OK?

That's what it is. So what it means is that if a variable is declared in the block of code, you know, like the one that we have here which is the x, then in that case, you know, there is no blocks called, which means that the variable is now accessed throughout whole function that you see here. And we can show you an example about that.

So I can look at this first one here, variables and types. And if you see here, I do have a variable x that I declared within that block. And then I want to print it out. Well, believe it or not, it gets printed out.

And then let me just close, in this case, this. And then you see that I have it here printed out, OK, as you see here. So any variable you declare and set a value to it within a function, it's basically visible throughout the whole function. That's what it is. OK?

Let's continue now with our, in this case-- let me just click on this example, so I can go back and look at it. And now, let me go back to my lecture. So this is pretty much what I just showed you here. You just take a look at it later on.

Now, let's look at expressions and operators. Well, you know, creating an array on an object. Here's pretty much how we create an array on an object.

We have a couple of ways to do that. We can use initializers. And we can go ahead and create arrays. For example, the first variable courses is set to an array, which is made of an array of strings, Java, JavaScript, Web Services.

And the second one, which happens to be an array, it's called students. And it's made of numbers, 12, 5, and 7. And I also can create an object through initializers where the object is here is course.

And this course here is a JavaScript object, which is made of the name value pairs name JavaScript, student 5, :5, and then frequency:daily. So this is made of three properties-- name, which is with the value JavaScript, students with the value 5, and frequency with a value daily, which is, in this case, a string. Or we can go ahead and create an array using the new keyword.

So the first here, the students_new and then I use the new array, what this is going to do is create an empty array. OK? That's what it's going to do. Or I can go ahead, and you say students_new_init. And then I'll go ahead and create a new array and pass 12, 5 into it. This would be an array that contains the element 12, 5, and 7.

I can also create, in this case, an object by, in this case, just calling the courses, you know, in this case, a constructor. That basically would be a function constructor that we created called courses. Or we can go ahead and use the new keyword, in this case, and pass the 12, 5, and 7 to it. So this, pretty much, we'll go ahead, in this case, and assign the 12, 5, and 7 to the properties of the object.

So let's see how we access an array and an object. So let's assume we have the example here where it says my object, in this case, var myObject, is a JavaScript object. It has the name:Ring in name:Ring that's property, which is the property name, is name and the values, the string ring. And then the delimiter-- [INAUDIBLE] diameter, which is 12.

And then the specs-- the specs, in this case, has two properties. One is the material, which is wood, and the waterProof, which is false. So I can go ahead now and also create an array by, again, through initializer 1, 2, 3, 4, and 5.

As you see here, this array can contain strings or numbers. By using the dot notation, I can only access, you know, only for objects. So I can go ahead and access. So, for example, here, object.diameter, this would get me the value of diameter which is 12. Or object.specs,waterProof, this get me a false, because that's the value of it.

You can use brackets, too, to do that. So here's an example where, in this case, I put between, in this case, brackets, diameter. This will return, of course, the value 12. And then between, in this case, brackets are spec and material. That returns wood.

We can also look at my array. You know, by the way, the index of the arrays in JavaScript is always 0 all the way till the length minus 1. So that's why if I now write my array is 0, this will go ahead and return 1, because that's the first element of the array.

And then my array 5, you know, this will turn and define, because this would be 1 for the index 2, 3, 4, and 5. And so in this case, our other a is 0, 1, 2, 3, 4. That's what I meant.

So the index 0, and then 1, and 2, and 3, and 4, which means if we're going to get the value in index 5, it's undefined. We don't have it. That's what it means. OK.

Now, we can also declare in this case a function. We declare a function with the keyword function. And the name of the function, it turn out that this takes two parameters, x and y. We go ahead and declare a variable result and said x times y took it, and then return the result.

Now, we can go ahead and call multiply pass 135 and 6 to it. This one multiplied them and returned the value 6 times 135. And this, of course, would be returned and assigned to total.

These are some working operators that you can work with. You know, the arithmetic, the plus plus increment, the decrement, the addition, subtraction, multiplication, division, remainder. Relational one-- equal or not equal. This ===, this is special, OK?

And what it means is that, in this case, the === specify also the type. The type has to be declared-- or not equal, greater than, less than, you know, and so forth. The logical-- and, or, not, and then the ternary.

And then, of course, the assignment, Bitwise, which is in this case, you know, an ampersand and so forth. And then, of course, in this case, the special type of operators like delete, in instance, or void and type, and so forth, type of and so forth. OK?

Now, working with the operators, you know, for example, here, I can go ahead and say 9 minus 5. And that will give me, in this case, a 4 or between, in this case, quotation, 9 and then multiply by 5. And 5, in this case, is a string. So in general, and the JavaScript has tendency or tries to convert a type of operands according to the operator used. OK?

So, for example, in the 9 times, you know, 5, because of the operator, you know, it takes that string 5 and make it, in this case, a value. So 5 that's 9, that's 45. Or if I, for example, use a string that contains the character 9, and then I do a plus, this looks like a concatenation. And that's why concatenation 9 to 5, that's what you get.

And in terms of the equal, so here I can go ahead and try to compare 9 to the string 9. This would give me true. On the other hand, if I do a compare with the three equals, this is pretty much what we call a strict equal, which means the 9 and then what's between double quotes-- or rather between single quotes 9, those are of different type.

One is a string. The other one is a number. And that's why this gives you false, which means the difference between the == and the ===, three times, is that the === is a strict equal. The other one is a flexible equal, the ==. OK?

And you can also use logical operators, like here a string and another that will return another or a string or another that return, in this case, is string and then the not a string, which is a false. Because the value of string is-- you cannot assign, by the way, assignment operator. You assign b to a or ax plus equal 1.

This a is exactly like you're writing x equal x plus 1. You can do a Bitwise & here, like the 101 and 116. 101 is the 5 in binary. And 116 is 6.

And then we want to do an &. So 1 and 1 is 1. And then 0 and 1 is 1. And 1 and 0 is-- rather 0 and 1 is 0. And then 1 and 0 is 0. That's why it's 100.

Ternary also is sometimes useful. So you have a condition question mark and then expression_1:expression_2. So if the expression is greater than, the major is set to the status. And if it's false, the minor is set of status, the way you see it here. These are pretty much straightforward. OK?

You can also make use of special operators. You know, you can have comma operators. In this case, we have var i = 0, j, 9, i less than or equal to 9, j++, and then i++ and j--. And then we go ahead and print i and then concatenate it with the space comma space, and then j, as an example.

This is for loop where, you know, we iterate through in this case and work with it. You can also have the concept of a delete operator. OK? And here we do have an object i that has key value pairs property a 5, s string, and then b 15.

If I delete the s, then we return only the a:5 and b:15, because this is deleted. You know, and then we can check is b in i. And as you see, it's true, because b is there. But then is s in i? And the answer is no in that object.

You can also use an array that is represented by the variable i. And it has the values 5, string, and 15. Delete i 1 will return, in this case, a 5 and undefined. You see, when you delete a value, you still have the same, in this case, size of the array.

So it would have 5 undefined, because that was deleted, and then 15. So is 0 in i? And the answer is, of course, in this case, true, because undefined the value 0.

And then is 1 in i? And the answer is no, because you have 5 undefined and 15. They're not 1.

All right, so pretty much you can also have the void operator. The void operator is quite interesting. You know, so for example here, in my [INAUDIBLE] of href=javascript:void, then I have the link, this link does nothing. Which means, if I click on that link, I get nothing.

You know, it stays on the same page. OK? But, in general, we specify the method that we want to specify over there. So, for example, if you put avoid and then you pass that method, then when you click on the link, that method is called. OK?

So a type of operator-- so the type of undefined is undefined. The type of Hello is a string. The type of a is an object.

And the type of a0 is a number, a number inside the array. In this case, it's 1. Because a0, the first value of the array, is 1 as an example.

And let's just take a look at an example about that. For that, we'll show you this one here, which is pretty much this one here that says a expression and operators. And that's where pretty much we show you-- so here's, by the way, just [INAUDIBLE].

When you have a JavaScript void 0, if you click on it, nothing happens. It just stays on the same page. That's exactly what we said.

Now, of course, we are referencing a Java code source. And here it is. Pretty much here, we go ahead and do a local a. And then to print, in this case, the beginning, we clear that And run it. And that's, in this case, the output.

So creating an array, and then after that, we go ahead and create an array. So an array, and then print it out. That's what you see. And then here if you want to print an object, it will give you object object. We'll talk about that later on.

And later on, if you want to, in this case, create a course and go ahead and print it out, that would be in line 11. And that's what we get, object object. And then, of course, after that, you create an array, an empty array, and then an array of 12, 5, 5.

And then you create an object that gives you object object. Every time print an object, it's always object object. We come back and talk about this later on.

And then you can also see some other values that assign an array to an object. Here's an example, where in this case we'll go ahead and create that and then create an array. And then we [INAUDIBLE] object diameter, which is on line 39.

That creates diameter 12, you know, and so forth. So you can just look at these examples, just [INAUDIBLE], you know. So here, for example, we take the object spec waterProof, which happens to be in this case false. And we assign to it and so forth.

So you can go ahead and try these. OK. Here's a function, multiply. You can go ahead and multiply these and then print them out. On line 54, that's what you get, a 10.

And then we can go ahead and use some operators here, 9 minus 5. And then, you know, 9 times 5, even though it's a string, it's going to be used as a number. Or 9 plus 5, that's 95, which is a concatenation, because 9 is a string at the beginning. And then-- of course, the strict comparison of 9 and the string 9. OK?

All right, so these are all good examples. We can try them. And that's what we see here pretty much. OK?

So if you just kind of, you know, try them one by one-- pretty much straightforward. But, you know, it's a good idea to try them. And that's what they want us to do in this example. OK?

Now, let's go back to our lesson and continue. So let's basically spend a few minutes to try all of this. Now, let's look at statements and loops. OK?

So in JavaScript, statements are basically commands to be executed by the browser. And here, you know, could be more than one statement. A declaration of variable is 1, or it could be an expression and then statement one and statement two. You know, so for there, they all have all kinds of statements. OK?

You also have the switch statement and break. So this is pretty much switch break takes an expression and checks. If the case level one, go ahead and execute statement one and break out. Break out is basically break out of the loop. That's what it means. OK? All right.

And you can go ahead and write all kind of statements. You know, continue, you know, here is one example, a function multiply and [INAUDIBLE] return result. So I can go ahead and use the with. The with, by the way, is also used in this case and pretty much adds the members of an object to the current scope.

So, you know, with, by the way, cannot work in this case in the strict mode. So with the object-- statement calling the properties of the object as an example. We'll see more about the with at some point in time.

We also can use, in this case, a try throw. So here, I have my function. And then I try to call the function can throw an exception.

And then if the condition is true, go ahead and throw my exception. And then you have catch e that pass it to the logError, and then finally closes all the files, kind of similar to what we do in Java. OK? So close files will close always the files no matter what happened. OK?

All right, so now looking at label statements, sometimes you label the statements. OK? And, for example, here function iNeedToStopHere, I have a debugger call it. And then I do, again, debugging stuff like in the example.

The continue, also, is useful. And continue, what it does, it actually continues the loop. That's what it does. So here, for i=0, i less than 10, and i++, you know, check if i is equal to 5, then continue. Otherwise, in this case, continue means what?

Means continue. Skip the 5, and then continue. Don't print that out. That's what it means.

So in this case, what is the for loop from i=0 to 10, when I set to 5, so I start with 0, it gets printed. 1 gets printed. 2 gets printed. 3 gets printed. 4 gets printed to the console.

And then when we reach out, we say continue. If i is 5, which means 5 would not be printed. And then [INAUDIBLE] 6, 7, 8, and 9 will be printed, OK?

You also can use the while loop here. We set i to 0. And while i is less than 10, go ahead and print i plus 1.

You also can have a do/while. Which, by the way, the while loop runs 0 many times. The do/while runs one or more times. So it has to first print i+=1, which is i equal or i plus 1. And then after that, it checks if i is less than 10. OK?

You can also use the for loop. For i=1, i less than 10, go ahead and print i. You can also have, in this case, an object which happens to be called myObject. And it has two properties-- one with a value of property one and two with the strict value of property two.

What I could do is I can check use the for loop. Instead of the classical one, like this, I can use [INAUDIBLE] for my variable, which is in my object. Go ahead and check if myObject has a property, which is the myVar. You know, I if it is, go ahead and print it out. That's what it means.

So in this case, the last for loop over there for in, what it does, it will go ahead and iterate through the property names and finds out if a particular property or that object, you know, has its own property myVar. If it is, go ahead and print it out.

And now, let's take a look at the examples of, in this case, statements and loops. And these are the statements and loops. And if you take a look here, we just use examples.

So for example, here, I first use the for loop to print i through a-- 0 through, in this case, 9. But then I did the continue, which means it's going to skip the 5. That's why you see 0, 1, 2, 3, 4, period. And then it jumps to 6 and continues.

This is the while loop printing 1 through, in this case, 9, you know, and then the for loop and then whatever we did. And then you see here, if one and two are part of the object, go ahead and print them out. And that's true. That's why they're printed.

OK. And so that's the statements and loops. All right, let's continue with our lesson. So that's basically take a few minutes to take a look at it.

So here, looking at objects, OK, we can create objects. OK? And JavaScript, basically, allows you to create a object. So here's an object, you know, using, in this case, the [INAUDIBLE].

So you can either create an empty object created this way or by using the new keyword and then the object-- in this case, constructor. Or you can go ahead and use the create only object and pass null to it. All of this would create empty objects.

Or you can have create an object-- here, person-- that has a full name called call John Doe and then an age, which is 35, the address, which is made on the address line, and then the postal code. But the question that I have and I said I'd come back when we were talking about identifiers, if you look here, you see that the full name is between double quotes. Why?

Because there is a dash, you know. And we said that the dash is not recognized an identifier. So to be able to make it, go ahead and put it in double quotes.

So the space-- see for the number address_line, you get no problem with this. But this one here has to be within double quotes. And then because it has dashes, same thing this one, because it has a space. That's basically what it means. OK?

All right. So now, creating an object-- you can go ahead and create an empty object like this. You can create an object like the one that I just showed you here in the bottom. And you can also, by the way, use what we call a constructor function.

And the constructor function pretty much, by convention, we use the capital T for it. So here, constructor function Tree takes a type, a height, and an age. Type will initialize the type of the current object. This represents the current object. Height, I assign it to the current object height. And age-- the same thing.

So now, I can call it with a new keyword. And I'm calling here what we call a constructor function and pass to it the value for a type, which is a Big Leaf Maple. The height, which is 80, was probably 80 feet. And then the age, which is 50, was probably 50 years as an example. OK?

So here, we now found out that we create an object using what we call a constructor function. So creating an object with prototype syntax, would we like what we see here-- Object.create and then pass whatever prototype and properties you want. Example here-- I create an object with a prototype all. You know, and that's called myChild.

And then after that, I go in and create an object that is made of a 10 and b 30. This will create an object that has the properties a set to 10 and b to 30. I can now get an object my object and assigned to it, you know, and have two, in this case, properties, a 10 and b 30.

And I can now pass it to my create method on the object to create what we call, in this case, myChild object through the prototype object. And then if I now call myChild.a would be 10. And myChild.b would be 30. Because I made use of my object create the object and assign it to the variable myChild-- or rather, here to myChild representing, in this case, the object. OK?

And here's an example of accessing, in this case, object properties. Here, I have my object, which is made of a name luggage, the length 75, and the spec, which is made of material leather. And the waterproof is true.

Here, we'll look at getting and setting properties. So to read the value of myObject, in this case luggage, you can put it between square brackets or using the dot notation. So the object between [INAUDIBLE] name, that would be luggage. And this object.name is luggage.

And the object.spec.material is leather. You can see it here, the object.spec.material is leather. And the object.spec.material, you can write it through the dot notation or between square brackets. Leather-- the width, in this case, in turn out that there is no width here. So this will return undefined.

But if you want to get object.tags.numbers, both of them do not exist. The tags doesn't exist in the number. This will get you at TypeError thrown.

And you can assign, for example, a suitcase and then assign it to object name. This, which means it changes the name from luggage, in this case value, to the suitcase. And I can go ahead and read it.

I can do the same thing if I sign for it width, which doesn't exist. This will create a new property. If I try to assign 6 to tags.number, both tags and numbers do not exist. So that will give me a TypeError in this case. OK? All right.

And by the way, you can work with objects. Here, for example, I can look at the delete object length or delete [INAUDIBLE]. This, basically, sets you through, even though it does not exist in the object.

Because it's not there. But as you see here, the length is there. But the height is not there.

Testing and enumerating properties-- for example here, myObject that has a 1 and 2. So I could say for the var, myVar in myObject, go ahead and check if it has [INAUDIBLE]. Then go ahead and print that var. OK?

So one thing that we want you also to understand, which is really very useful, is that in JavaScript, JavaScript access, or rather allows, access to properties without requiring the use of explicit method calls. This, typically, is possible way the get and set keywords. OK? So JavaScript invokes these functions as methods of the object on which they are defined.

So here's an example. What I have here-- object and then the property a for the value 45 and then the get which represents the function that returns this a times 2. And then we have another one a set 45 that basically subtracts x from a.

So I can do object a. And that's 45. Object double_a, that multiplies 45 times 2. That's 90. I can do a modify 40.

Now, of course, in this case, because we're subtracting in this case, x which is 5 in our other, in this case, x from a and we subtract 40, in this case, from the 45, then what's left, you know, for a is 5. OK? And then we can double that, you know, could call the double function. That would be a, which is the value, in this case, 5 times 2. That makes it 10. All right.

So in JavaScript also, actually, objects, you know, can have what we call methods. And they are what we call a function as property of an object. So here's an example.

Well, in this case, I have my object that has, in this case, a property as a function, or in this case, a function as a property, rather. It has a function as a property. So it's referenced by the name print. And then it represents the function, which prints Hello World. So if I do myObject.print, this will print Hello World.

And let's take a look at an example about that. So here, I'm going to go ahead and look at an object. And here, I can go ahead and create an empty object, an empty object this way, an empty object this way. And this, pretty much, will represent all of the objects.

So if I, you know, in this case, [INAUDIBLE] object a and then to source, then we'll go ahead and empty the object in this case. I have an empty object in this case. And here, I have an object person.

And then I can go ahead and print the source. That would be my, you know, object that I created, which is all of this. It's printed here. That's one I created here.

And then after that, I'll go ahead and create an object, in this case, through the tree, which happens to be a constructor function. And then I print the source of it. So that's what I see.

And then, of course, after that, I go ahead and then, of course, continue with this and create an object and then read a and value a and b to it. I can, in this case, create an object and then, in this case, from it create an object through the prototype and then get the myChild, print the myChild, which is, in this case, an object. It reprints object. Every time you print an object, you print object object.

I can print child a, child b. That's 10, you know. And I can go ahead, in this case, and print object name or object.name between the brackets, pretty much trying to see and define what we have them over there, too, you know, wherever we learned. And then you can find pretty much print all of this. OK?

And see, we get all pretty much the-- I know we can delete the object length and delete. And then after that, you can have [INAUDIBLE] and then print those, in those one and two that you see here, you know, and so forth. OK? This is the last one that we did. And they are all printed here.

So it takes some time. And then just go through the code here. And then look at the output. And you can find, by the way, the output quite easily.

For example, here, if I wanted to find out about the code in this case, in line-- just move this a little bit, so I can see. Or even better, I can go ahead, in this case, and fit it, so that I see the whole thing, OK, and this way. And then, for example, here I do a console.

On line 102, you can find it here. And then console, in this case, went away. You can find when one [INAUDIBLE] here is just [INAUDIBLE] and then and so forth.

So here, I have log Hello World. If I called the print, it will go ahead and print Hello World. And that's what it is. Because this is what we call an object method. OK?

All right. And that's, basically, what we looked at. and. We could do the same thing by continuing and looking at, in this case-- so we just, you know, went through these objects. And we know now.

We said that objects can have methods. And they are functions as property of an object. So they are what we call function properties of an object.

And here's the example that we looked at. And now, let's take a look at arrays. You can also create an array through initialization by creating an empty array or an array that has some values, OK, like in this case or some data.

You can create an array using the keyword. This is an empty array. This is an array of size 15. And this is an array that contains 1, 2, 3, 4, and the string 5. OK?

You can access array elements. Here, for example, I can create this array and say the length is 4. And then I can assign y to a value 20, so which makes, in this case, the size of the array 21. OK. Because 0 through 20 makes it the length 21.

And I can go ahead and use the for loop. And then print the values of the array. Or I can use the for i in c and then print all of those. OK?

And I can go ahead and work with multi-dimensional arrays. So here it is. For i=0, i less than 10, i++, you know, go ahead and create an array of size 10. And then for i=0, j=0, j less than, I go and create my array of ij. And this would give me-- later on in one of the labs, when we get into web [INAUDIBLE], we're going to create an array that represents a tic-tac-toe game.

And yous can see the example of an array is like that. So I go back here and look for arrays. And this is pretty much what we have here.

So we have all the example, an empty array. And every time, for example, I can go ahead and print the array here, you know, and so forth. So you see pretty much you go through these examples.

And then every time, you print the element, then try to find [INAUDIBLE] i. For example, you're printing the length, which is on line 22. And that, the length is 4.

And then we assign y to 20, so that makes it 21. And then we can go ahead and pretty much continue with this. Line 29, in this case, we have an array and then c. And then we can go ahead and pretty much print its elements.

And those are blue, red, green, purple, and so forth. And so we have, because here which [INAUDIBLE] we have blue, red, green, purple. That's what we have and then undefined, undefined and then the number 20, which is white.

You can go ahead and create it a 2D array and then specify the ij for that. That will be from 00 all the way to 999. OK? Because it's 10 by 10.

Here's a tic-tac-toe array that was created. You can print it out. That's what you get and so forth. So these are just you guys can try these step by step and see what your output. OK?

Let's go back and see the lecture. So that's about the arrays. And, of course, the last piece here is about functions. So in functions, you can go ahead and create a function with the keyword function and the name of the function and the arguments you're passing. And then, of course, you have the body of the function. OK?

So the bodies declare a variable result and assign x times y to it return the result. So here, I can call multiply and pass 135 and 6 to it. And that would return, in this case, the value.

One thing that you could do in JavaScript, you can create what we call an anonymous function. An anonymous function has no name. That's what it means. OK? Anonymous functions are commonly used for in line callbacks. And we see that in lesson 3, the advanced piece.

All right. And so you can go ahead, in this case, and call in a function [INAUDIBLE] basically, in this case, a function as a method. So here, we do have a function as a method print function that takes a message and prints the name Hello World and the message. OK? So for example, here I have myObject.print.

This will print a Hello World and then space JS Robot. So that's just a function and creating and calling it. This would be a function as a method.

This was what we call a property, in this case a function property of an object. And we can also use a function as a constructor, a tree that takes a type and a height and assign type to type, and then height to height of the current object. And we can also create, in this case, a get type function which is a prototype for the tree, which returns the type.

Here, I can go ahead and create a new tree with a Big Leaf type and then the 80, which is the length. And then I could call my tree getType, which returns Big Leaf. Because we said that the getType returns the type. OK?

By the way, in JavaScript, we are going to take advantage of a very, very nice feature of a function called the self-invoking functions. A self-invoking function, you can specify that function and invoke itself by appending the parentheses to it. For example, here it appends this parenthesis to it.

Which means, we put it all in pass in between parentheses. And then we can go ahead and execute. This will execute immediately. So self-invoking, you can specify that function invoking itself by appending the parenthesis to the function as you see in this case in this slide. OK?

And you also can make use of the argument's variable. So all the arguments of a function are available through the arguments object. And this object has a length property, of course, which is a number of the received arguments.

And we see an example here that pretty much shows us how, you know, it's done. And by the way, we should note that the JavaScript does not check the type of the argument value passed in a function. So here, for example, they have the argument length.

And then we go ahead and add the argument values to the total and then return the total as an example. One more thing that we can use when we talk about functions, we can use recursive functions. Recursive functions are known in many, many other languages, like, you know, Java and C language and so forth.

And one thing that you may remember about the recursion is that, you know, a recursive function is when a function calls itself. It has nothing to do with another self-invoking. It has, you know, nothing to do with it. This is just a self-invoking function.

Here, it's a factorial. If we want to look for a factorial of a number, we say if it's less then 2, return 1. Otherwise, it would be the number times the factorial of the number minus 1.

For example, factorial 5 is 5 times 4 times 3 times 2 times 1. You can do the same thing with Fibonacci. You know, I don't know if you know about Fibonacci numbers-- and here, if it's less than 1, then the number, and then the Fibonacci number minus 1 plus Fibonacci number minus 2.

So it's typically 1 plus 2, you know, which is 0, 1, which is 0 plus 1, and then 1 plus 1, and the result 1 plus 1, and the result 1 plus 2, and so on and so forth. That's basically what it is, Fibonacci. Fibonacci numbers are used to count, for example, a population of rabbits, you know, and so forth, animals.

All right, so this is about recursive-- or rather recursion. OK. And one thing that we want to discuss here is just the concept of scopes. In JavaScript, there is a couple of scopes.

One is the global scope. And the other one is a function scope. Whenever you have the global scope, what it means is that the variable is not defined inside the function.

It's outside the function. And it belongs to the object window. Object window, by the way, in this case represents the browser. So example here-- I declare x, you know, with the variable I am a global variable. And it's outside of function.

So this will be logged to the Windows object. So windows.x basically get me that variable. Or I can declare a variable inside the function. That's called the function scope, which is available throughout the whole function. OK? That's what it means.

And we do have an example about that. And here it is. So pretty much, the examples that we've seen, you know, when we were looking at the lesson-- you have them here.

This is when you have a function that has a name. And then you can go ahead and, you know, pass to it 135 and print it out. Anonymous function is when it has no name.

You still call this function and assign it to multiply. You can go ahead and print multiply. And we'll go ahead and pretty much call it through the name of the variable.

Here's an object that has a method, in this case, a function, a method property. And you can call it. OK. And this should print, in this case, line 31, Hello World JS Robot.

And here, pretty much, we have a function as a constructor that we can use. And then just [INAUDIBLE] also create a prototype for it that getType that will go ahead and return the type. And if you return the type, it will be, in this case, Big Leaf Maple, which we see on line 46, which is this one here.

And then you can have a sum function that, in this case, takes the arguments 1, 2, 3, 4, and add them. OK? Factorial-- you can go ahead and do the factorial here. We're looking at the factorial, Fibonacci. And then factorial 10 and Fibonacci of 10 if you want to print them out.

And then, of course, we have here the global variable versus, in this case, the function variable. And you can go ahead and try all of these and look at the output. Pretty much, it helps you kind of visualize what we just learned. OK?

And that pretty much tells us about, you know, the concepts that we learn in this lesson. These are just the example of the functions that we want you to take a few minutes and take look at it. Here are just, you know, where you can learn more, so just links.

So in summary, we kind of introduced JavaScript. We looked at how we [INAUDIBLE] with the variables, creating objects, arrays, creating a function and calling a function, defining a JavaScript object that has a key value store, you know, and so forth. And then we used the get and set that allows you, in this case, to print, you know, information.

So, for example, here, earlier we looked at this. And let me just show it you again, where we could have, in this case, a function presented by the get and then the set that sets that. Properties get a set.

Of course, a practice will be, in this case-- practices that you are going to do, in our case, here-- so you're going to do them. They are part of the JConsole, which by the way you will see here. So you know, the way that we give you the practice is we give you the practice. And we give you the preview here.

And then we tell you what to do where we say complete this by defining a, in this case, as an undefined, b at type null, and c of type Boolean, and a d of type string, and then e of type number. So you can try them. And by the way, you can also look at the solution here under this.

It says View Solution. We show you how you pretty much specify these, you know, if you want to define a, b as a null, and c as a false and Boolean, and d as a string, and an e as, in this case, a number. OK? So try these.

And then the next exercise or practice is, again, in this case some preview. And we tell you what to do what every one of them-- case one, case two, case three, all the way to case six, seven, eight, and nine. Try them.

And then, by the way, we also give you a solution for these. OK. Here are the solutions. But you try them first before, you know, checking to your solution.

And then a third practice-- pretty much the same thing. Again, we ask you what to do for every case, case one, case all the way to case four. And then you try them.

And then, of course, here, you have a solution for that. Now, at the beginning, you might need a little bit of solution. Because sometimes when this says specify the prototype sum of function, maybe look at it, maybe did not also grasp that. You can go ahead and get some help from there.

And that's what we mean by these practices. OK? Once we're finished with this, of course, we'll take a look at them at some point in time. OK? And that's basically what we wanted to say about this lesson. Thank you.

## 2. Practice 3-1: Passing JavaScript Tests in JSConsole with Jasmine - 7m

OK, now that we're done with lesson three, let's go ahead and get into its practices. So we do have a practice here for this lesson three, which is 3-1. And that basically tells us that we need to do these practices on the JS console, a application that we have, OK? So where we do the practice one using JavaScript variables and types and then JavaScript objects and then JavaScript functions. Basically, that's what we are going to do.

So pretty much we'll start with practice one, where, in this case, they asked us to-- this is, of course, the solution-- to declare a of type undefined and then set b of type null, and C set it to type Boolean. And set it for them to false, and d to a string, and then e to a number, like 14.18, or so forth.

And of course, here, as you see, it says all of them are passed, OK? And then in the next practice-- in this case, they want us to add some code. Then we-- they created some use cases in this case. And the test case one, where we create three objects-- empty objects-- try to create every object with each different available way to do it. And this is basically initializing it, the new keyword, and of course, the object create. And that's what we did here, OK? Using the first one, which is initializing, and then the new keyword, and then the create by passing a null to it. We've seen that in the lesson.

After that, we create a constructor called hat. That's a constructor function. But takes two parameters, type and size. And then use them to initialize-- they receive type and size, and use them to assign them to the type of the current object and the size of the current object. And then after that, we'll go ahead and create an instance of that, passing the type cowboy and the size medium.

The third test case is a comment, again, what the line below and assign the value of the main parameter of my object to the name variable below. Again, it can be done by using the dot notation and the bracket. Here, I use the dot notation. OK, here I have an object. And then, of course, if I want to access it, that's basically what I have.

After that, they want us to uncomment the line below and assign the value of the type parameter of my object to the type variable. In this case, type is computer table. So this would be object. And then dot spec and dot type, because the spec in this case is made of two different properties, material and type. And that's how we do it.

We could have used, by the way, the brackets too. Square brackets, rather. And here, we delete the height property from my object. So delete object height, and then it gets deleted. It's basically this one here, which is on line 30, gets deleted. And that's how we write it. And then here, use the static method object defineProperty to create a new property in my object called sold, OK, which is a Boolean type. And here, by the way, we used a defined property, which is static method of the object.

And at some point in time, we learn about this in one of the lessons later on. And as you see here, it's a TXT object. And then, in this case, the property sold and then the value, which happened to be false. OK, and that's how we write it. OK. And that after that, they want us to create an array called numbers with a length of three elements containing a one, two, and three. And that's what we have here.

Now, after that, they want us to uncomment the line below and assign the fourth value-- fourth element in the array to the fruit variable. So zero, one, two, three, that will be this one here. That's how we do it. It's the fourth. Fourth is always the index three, because in JavaScript, array starts with index zero.

And the last one is for the myTwoHundredArray below. Convert it to an array of 200 elements containing the numbers zero through 199. And that's how we do it, OK? And we push all of that zero through 1999, because it's strictly less than 200. And we use the push, in this case, method-- I push all of that to be arrays.

And that's basically they want us-- what they want us to do this in this practice. And then the next practice, which is the last one of these, number three, lab number three, is, again, the same thing, practice. Except that here we have also different cases. Here we create a function named sum that sums two parameters and returned the results. And that's how we create that, OK.

And we can go ahead and call it. And in this case, for example, a and b, which is 15 and 67. That works. The second one is create a function named sum that sums the two parameters and return the result in this case, but this time as a method of an object, this method object. And here it is, sum, call, and then the function. And that's how we do it.

And then, I can go ahead and call it the object and save the result inside a result variable. Then next, we add a function named sum to the prototype operation. This is, again, we do it. Operation prototype sum, and then we go ahead and create that.

And then the last one is a to add complete again the function below to throw an exception. And that's what we have here. And that's pretty much throw an exception that we see over there. And that's pretty much what they want us to do in these practices of lesson three, which are basically three practices. Thank you.
