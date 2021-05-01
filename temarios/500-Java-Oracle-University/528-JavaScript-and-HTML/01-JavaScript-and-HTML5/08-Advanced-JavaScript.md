# 8: Advanced JavaScript

1. Advanced JavaScript - 1h 25m
2. Practice 8-1: Painting in an HTML5 Canvas Element - 7m
3. Practice 8-2: Creating an Interval to Paint in a Canvas Element - 6m
4. Practice 8-3: Implementing Drag and Drop to Paint Images on the Canvas - 7m
5. Practice 8-4: Painting the Canvas with Mouse Gestures - 6m

## 1. Advanced JavaScript - 1h 25m

All right. Let's go ahead and get into lesson eight, where we're going to talk about some advanced JavaScript. These are just more features in the JavaScript.

So here, pretty much, we are going to define functions as value types, create closures, and explain the variable scope, take a look at writing JavaScript functions as modules, creating the drag and drop interaction with JavaScript, creating JavaScript timers and delays to create animations in this HTML, and using HTML5 canvas object to draw, in this case, on pages. And the topics that typically we are going to, in this case, work with, would be the JavaScript functions, where we define functions as values, and functions and variables scopes, and then of course, discuss modules. Then after that, we get into prototypes, into HTML5 drag and drop, into delays and intervals, and of course, talk a little bit about HTML5 canvas.

Let's start with the JavaScript functions, and where we discuss functions as values, and functions and variable scopes, and modules. The JavaScript functions as values, basically, a function in JavaScript typically is another value that, a value type rather, that can be assigned to variables.

So here we do have a function that is assigned to a variable sum. And that function takes a-- it's [? anonymous ?] function that takes a and b and returns a+b. And a function can expect a function as a parameter. Here's a very good one. And that you can again see, in this case, where pretty much in this case, we have the function invoke that function as a variable and returns that function and it passes to it 2 plus 3, as an example. And you can use a function as a parameter too. So for example, invoke here, the invoke, and then you pass to it sum, which happens to be a function in this case, that takes a and b and returns a+b. b

So let's take a look at the keyword, this, which is also quite interesting. In JavaScript, all functions have a, this reference. And of course, this, reference of all functions pretty much stores the object, or the context, in which the function is, in this case, called.

So for example, if you invoke, in this case, an object method, then the, this reference, will be the object itself. Or if you call a function, in this case, by using the new operator to create a new object, then, this, will be referencing, in this case, the newly created object. Or if you call a global function, then the, this reference, will be the function itself. So here we show you an example where we have a function, fun, which in this case, returns this.toStringk, The, this, reference to the object that is used to invoke the function.

So here for example, we have an object that has a property value, 12 and then an object method, fun, which happens to be a function that returns the value, which is 12. So if I now call object.fun, it will go ahead and return 12 because that's exactly what the object method, in this case, is returning, is the value of the current objects, this.value.

We can also, by the way, use function methods. And here, we can make use of the call and apply methods, invoke a function by setting this property for the current invocation. Function methods, what they do is they allow you basically, to modify how function works. So the call and apply are good examples that enable you to, in this case, set the context that the function will use.

So we can make use of that call and apply. And in general, both of them are kind of similar. They both take, in this case, the first argument would be the context object. And in this case, the second one would be-- if you want to parse-- it would be a bunch of arguments. So the difference is that between the two, in the apply and the call, is that the apply takes all the arguments in one array.

So here's an example where I have a function, myFunction. And then of course, in this case, we'll go ahead and print the property of the object. So I've got an object that has myProperty, which is 15. And I can go ahead, in this case, and use the myFunction and use the call, which is myObj. And of course, because I'm using the context, in this case, of the myObj-- which has a property of 15-- we know that the myFunction returns this.myProperty, which means, in this case, the call will return 15. And the same thing will be applied.

So continuing with the function methods, we do have, by the way, in this case, a couple of functions-- if you want-- the toString-- that could be a prototype function-- and the bind.

And the toString what it does, it actually returns a string with a source code of the function. An example here that we have it, where in this case, we have outer.toString and then the outer function, in this case, would be the function that has var x. And then it has an inner function that logs the inner. So if I now apply the outer.toString, what it's going to do in this example, it will go ahead, in this case, and return also basically, the code, or output the code to be a string of that function.

You also can make use of the bind. And the bind function is quite interesting. And we can have function.prototype.bind. And what the bind does is returns a new function. So here example, I have a myObj that has a property, myVar, which is, in this case, set to Hello there! And then I have an object method function, which by the way, has, in this case, a [? anonymous ?] function that takes a name represented by an agreed variable, which prints the value of myVar plus, again, this name.

And I can go ahead now and call the innerGreet.bind, then pass to it this, which is the current object and then space Duke, which means when I do myObj.greet on this one here, it returns Hello there!, which is the first myVar, and then a question mark exactly what it is, and then space, and then Duke. So here, the bind method pretty much is used to-- in our case here-- to somehow reach that-- or if you want-- take the, in this case, the value of my case here, which is the myVar. And then of course, concatenated to the, in this case, the name. And that bind over there, what it does, it binds, in this case, the current object to the name that we are passing. In this case, which happens to be space Duke. And then of course, because the greet in this case has a function that basically prints this.myVar concatenated by the name. And that's what we have over there.

So we should note that in the bind method, we basically are specifying one argument to send by default-- which is the Duke-- and then to the innerGreet function. And when we call the innerGreet function in this case, this argument will always be sent, even though we do not send any argument when the function is called, as you see in this example. What we do is just myObj.greet read and then this will always be passed as a default.

Now let's go ahead and talk about function default values. One quick way of having default values in functions is to be able to represent these as a default value. For example, here we have a function x, that takes an a. And then here we can assign a to a, or if a is not there, then it will assign a default value. And then we do console.log(a), which prints that out. So we should remember that we may need to check for specific values sometimes. Because the statement that we see here on the slide will set the default value for a parameter for all values that evaluate, in this case, the false. Want to evaluate the false. For example, in the first one, we call x and we don't pass anything. Of course, the output will be the default value. Or we can pass null, which happens to be false. That will get default value. And if you pass a you get a. If you pass false, of course you get the default value.

All right. Let's go ahead now and take a look at the callbacks. We'll see examples about these soon so that we at least can understand the output from a demo example that we see on our console. So let's just talk a little bit about callbacks. Functions, they are nothing but functions as parameters are commonly called a callback. So whenever you pass functions as parameters, they are commonly called callbacks. So callbacks are functions that are invoked when a process is complete or some condition is met. And we actually have been using these callbacks for a good chunk of time in the HTML5 events. Where, if you remember, we do windows add listener. And then, of course, what we do is we are passing a function when we do the load. So callbacks are by the way, widely used in JavaScript because they allow you to provide a function as a parameter to another function. That's why we like it.

So here are some examples of the callback in this case, where you can even declare the callback function separately. So here for example, I have a function, which will declare the variable-- and assign it to the variable onWindowLoad. And then I can go ahead and pass it with that parameter that you see here. The one thing that we ask you to pay attention to-- and sometimes people make mistakes-- is that whenever they pass that variable, in this case, to that function, people have a tendency to make a mistake by saying, OK, since it's a function, I'm going to go ahead and add in this case, open parenthesis, close parenthesis. This is a common mistake that people do when invoking functions when it's used as a parameter instead of sending a function. So be careful. Always pass it with the variable. And there is no parenthesis next to the variable. That's what I mean by that.

And let's go ahead and take a look at an example about that. And for that let's go ahead and look at, in this case, JavaScript variables and functions. So here we do have a function in this case. And the catch e or var function, in this case, that catch an exception, if you want. And then here we have a var fun, which happened to be a function that logs a, in this case, a variable, a function. And then here we do have a fun, which logs the function. And we see that.

And of course, we can go ahead and look at an inner function here, the one that we know so and so here we have an outer function in this case. I am declared as an outer function. And then we have an inner function that prints x. So if you look at this, and I that would be in the output here. You can go ahead and see that. That's on line 26 and so forth.

And let's continue with this. So here I have my function. And I have that [? prints out ?] this property. We see this example. And then I go to my option. And here I do the call and my object, so 52 and 53 prints a 15. Here we do have a, in this case, a function prototype toString. So this is the example where we told you, call the outer toString.

But then in this case we specified that we have a my object hello there, and we have a function. And of course, a greet and then the bind, in this case. So if you take a look here, you'll see that on a-- here on line, in this case, 61 will print outer toString. And that returns the whole-- which, by the way, here we show it. This is basically, in this case, my outer function. OK.

And then of course, in this case, what I want you to do is-- and I call outer-- [INAUDIBLE] what I'm doing here is I'm calling outer toString. And that should print the function. And that's what it is here. See it? OK. So it's printing basically the code of the function, which is all of this one here. And that's what I see. And then I see it's printed here. Another-- sorry, it's this one here. That's what I meant to say.

And as you see here, it's pretty much printed here. This is the example that we've seen. And then of course continuing with that, that's was on line 61, which we already showed you. Here I do have a my object, and that says my [INAUDIBLE] there. And then a greet defined by a function that's an object method. And then of course here I have an inner bind. And we said that in the inner bind function-- function bind prototype-- it will go ahead and print, in this case, a hello there, Duke. And that's what we see on line, in this case, 74. And that was we see here.

We also want to show you another example, the default values. So here I have a function greet that takes a message. And that would be the message or no message in this case. And then we print, in this case, the message. And then here I can call greet by itself, which, by the way, in this case, returns no message, the default. Or with null does the same thing. All right.

Let me just go ahead and put it at its-- and then hello returns hello. False returns no message. True returns true. 1, 2, 3, 1 2 3 returns 1, 2, 3, 1, 2, 3. And then the next example is I have a function param test, I have a message in this case. And I use the for loop and then see how many arguments we're passing. And then we should be able to print, in this case, those arguments between square brackets.

And then we can do it on the first one and that gives me nothing. And then 1, 2 returns 1, 2. And then a nulled and defined for 3 returns that. And that's what we see here. OK. Let's continue. Let's continue with this lesson. And now we're going to get into-- so these are the examples that I just went through. Go ahead and try them.

And let's go ahead and continue now with JavaScript array extended API. This callback API is especially useful when, in this case, dealing with arrays of objects and because you can operate on the object instances and get access to their properties. So here this JavaScript array contains many methods. And we're going to take a look at some of them here.

So one of them is the sort that takes a callback. So that callback-- in this case, a method-- will be a function, in this case. [INAUDIBLE] that a function, it's a call back that takes two variables. And then the callback returns 0 if the values are equal or positive values if a value 1 should go before value 2 or negative if value 1 should go after a 2, and so forth.

So in your book, in your student guide book, you'll see examples about that. And that will return you where you do the comparison. The callback will be a comparison of a names of two persons or the comparison of the ages of the two persons. You guys can see that as an example. You also have the next slide that you have the foreach again. In this case, the foreach takes a callback with a value, an index, and an array. It executes the callback for every element in the array.

The foreach is very useful when you want to apply a function to all the elements of the array. And the also one is every, also that can take a callback. The callback here is takes the value, an index, and an array. This returns true if the callback returns true for all the elements in the array. So this basically a-- in our case here, this every. So basically what it does, it tests all the object that meets a certain condition defined in the callback and returns, of course, in this case, a true if all the elements in the array meet that condition.

In our case, for example, in the case of the body showed you on your book what we do is we use the-- for every person, check if the age of the person is over 10. And you can take a look at that as an example. Another set of a function that we can use is the sum. And the sum takes a callback, which takes a value, an index, and an array. Returns true, the callback returns true for at least one of the elements in the array.

This is basically at least one element of the array meets the certain type of a condition. Here, for example, in the student guide, we use the trying to find out if someone is age is greater than 18, as an example. The filter is also well known. And we can use it. It basically creates a new argument with the element that meets certain condition defined in the callback function.

So all what it does, it creates a new array with the elements that meet the condition defined in the callback function, whatever it is. That's what it does. And we also have the map. The map is also quite interesting. The map method, what it does, it converts an array of objects to another type. You can use it to extract data from elements or to convert objects.

So it creates a new array with the results of the callback when he's called for every element of the array. Reduce is also interesting. Reduce creates a single value from an entire array. So it applies the callback method function for every element in the array, returns a single value based on the accumulated result of the callback. It would be nice, for example, to use this reduce to maybe add the values of the array, in this case, and sum of them and put them in a value.

So we have to start with an initial value, in this case, which, for example, we sum of all of them it would be 0. And then we sum all those to it. Now, the good thing about using all these JavaScript array extended API methods that you see, or functions-- we can actually chain them and use the method chaining for them. Here's an example where, in this case, I take an array and I use the filter method by passing the filter callback that will filter all the information that, in this case, is needed.

So it's going to create a [INAUDIBLE] array with the elements that meet the condition. And then we do a map, in this case, by doing a map callback. And then after that we reduce it by specifying the reduce callback method and the initial value. And then of course because reduce returns one value, that's why the whole thing is assigned to one value, as an example. OK.

So in your student guidebook, you have an example where you filter. You get all the persons that are greater-- where the age is greater than 18. All people over 18. And then you can go ahead and get all their ages. Map returns their ages. And then the reduce will go ahead and add all their ages. So here we have the sum of all the ages of all the persons that are 18 or more. That's basically what it means. Or rather, more than 18.

And let's see an example about that. This basically will look at the array extended API. And this is basically what we show here. Index basically has nothing. It's just called the code in JS here. And in the code JS here I have a person, a constructor function in this case, has a name and an age, and the two string in this case that prints the name and the age. And then, of course, after that we have an empty array. And we create new persons and we add them to the array and then print the persons.

So that would be the beginning. OK, so add 31. And then John age 22, Peter and so forth. And then after that, sort these by age. So we can ahead and sort them by age. And then we can go ahead and pretty much after that-- so here's an example about that. Here we can use the every. And then we go ahead and print that. So that's on line 33, which we see here.

Everyone is at least 10. That's true. And then here check if someone is greater than 18. That's true. And then here we get all the list of people who are over 18. OK. And of course, we see we're trying to then do the filter here. We're getting all the people after 18 and then get their ages and sum all of this and print it out. So on line 64, we should get this. Total age is 97.

And then here some utility method, print. And then here you have the header. And then log that information and print it out. And so that's basically what we have that as an example. All right. So this is one example that is good to see based on the discussion that we had. So that's the example. We do have, also, an exercise that we try which is making use of the extended array. And this would be this exercise. OK.

And I already did it. So you just read the instructions and try it. And this is basically the solution that you see. And this is, again, the preview in what you see. So go ahead and try it and then we'll discuss it later on. Now let's continue with our lecture.

Let go ahead and continue with our lecture and now we're going to get into function scopes. Or rather, function scopes and the-- so that's what we are going to discuss. So because a function can actually be inside other functions, an inner function has access to the parameters and variables of the outer function. And so that's basically what we have.

And of course, we can tell you that an inner function has access to the variables of the function in which it's nested, or the outer function. So here I have an example where I have function x. And then it has a variable name set to John. And then a function inside, which basically, in this case, wants to print n.

So the variable can be resolved because it is declared in an outer function, which is John, and then it prints John. Here's another one where I do have outer, that has a value, a variable x. And then inside the inner, I'll go ahead and print that. And of course, this will go ahead and access the x and print it out. So again, no problem with that.

Now one thing that you need to remember-- and it's a little bit interesting-- is in the next slide here where the function scope and this reference. So be careful with this. Here's an example where I have my object and it has a property, a name, myVar, which is set to "Hello there." And then we have an object method represented by the variable greet that is a function.

And then inside I have an innerGreet, which is inside an inner function of the function-- in this case, a method-- that will print the-- we want to print the myVar to the console. Be careful because due to the fact that the reference to an object is lost within the inner function-- so in this case the innerGreet is the inner function in this example. And because we lose it, it might be a good idea in this case to save it. So here we save it because in the first level you can access it. But then on the inside, an inner function you want.

So if we save this into that and then use it, and that would work without any problem. Now looking at overriding variables, you can override variables by declaring them again in an inner scope. Here's an example where I have a variable name, which is set to Ed. And then in my inside function, I have a name set to John.

If I log the value in the name, it would be John in this case. And then after that outside the function I'd go ahead and call log. So now if I go ahead and call the log and pass name to it, this will return Ed because this is outside the function x.

But if I call x, it's going to go ahead and print John, which means we did override the variable inside the inner scope. In this case, name inside the function x will be John. But then outside if you call the console.log dot name, that would be Ed.

Let's look at scopes and variables. Here I have a global variable name set to Ed. And then inside I have function x that prints that. So if I call x, this will print Ed. If I now change the name to John and then call x it will be John. If I change, again, declare a variable name and set it to Peter, if I call x it would be Peter. OK. So after it is declared in a scope, re-declaring a variable will have no effect. So it will work like a simple value assignment. That's what it does.

Now the next thing that we want to discuss here is the closures. And closure basically is a mechanism by which we create a new inner scope in JavaScript. So here a function inside another function is called a closure. Here's an example where I do have add that takes number1 and number2 and then inside I have a do function-- doAdd, rather, which is a function that returns number1 plus number2.

And then I'd just call the return doAdd. If I now call add and then pass 1 to 1, it's going to go ahead and pass a 1 to number 1 and 1 to number 2 and then add them and that returns 2. So a closure has access to the outer variables. In this case, the outer variable is number1 and number2. And the closure which is toAdd has access to that, so we'll go ahead and add them in this case.

And often callbacks are declared as closures. Now what becomes interesting is take a look at this. So here-- so take a look at this. So if an outer variable change, your closure variables will change, too. So here's an example where, in this case, I do have a tricky add that takes number1 number2. And I have a closure, which is toAdd that adds number1 number2.

But then outside the function, in this case, I'll go ahead and add 1 to number1 and 2 to number2. And then I return toAdd after that. So now if I code the trickyAdd and pass one to one, it's going to actually return what? 5. Why? Because closures have access to outer variables and as such, any changes made to them in any outer context will alter their values here. It turned out they will change them in the outer function by adding 1 to the original 1. That becomes 2. And that into the second one, that becomes 3. And that's why 2 plus 3 becomes five 5. And that's why we get 5.

So in this example, basically we have the closure add. toAdd uses the outer variables and invoking the trickyAdd here invokes the closure, but not until it changes the values, which is a 1 plus. And that's exactly what we did here. And we can see an example about that. That's the closures.

And so you see that pretty much here we have trickyAdd 1, this would give us definitely a 5. And then after that we do have this log x. And that basically prints "I am declared." And then here we have in this and that. And of course, we'll go ahead-- in this case, I have hello there. And then do the save this into that. And then call that. Then as you see, it will still print it without any problem. And that's what we have here about the closures.

Let's continue now. And this is pretty much what we wanted to see as an example. Go ahead and see it. I just showed it to you. And let's continue now with the private scope and closures. So using closures and scoping variables you can create a private scope on a certain variables and functions. So here's an example where I do have here a function that creates an object with some methods. Again, the object's methods invoke closure of a function and use the variables inside the createObject function.

So we have here createObject. And we set the value in these. We have variable value set to 0. And then we have an inner function sum that returns a plus b. And then here we return add 2, which should happen to be a function in this case. That's exactly what we said. We said that it returns some methods. That takes a var return the sum of 2 plus val. And add10, that takes a val and return 10 plus val.

Increment basically takes a val and return the value plus the val and then the get, which returns the value. So now that we have this createObject, let's go ahead and use an example on how to actually work with this. For that here we go ahead and create the object. And then object value, this will return undefined because at this point in time, as you see, the value is 0.

And then next we get the value. So if you get the values we're going to return 0, of course, because the value is 0 here. And then after that, we'll go ahead-- so object, that value, we'll return undefined. But the get value we know that it returns the value, which happens to be 0 at this point in time. And then if I now do an increment and then pass the five to it, it will be a-- remember that the increment takes the value plus the val that you're passing. So 0 plus 5, that becomes 5. And when I do a get value, it returns 5.

But if I do an add 2 and then pass the 5 to it, what's going to happen here, it's going to go ahead in this case and use this, which takes the 2 and then pass the val to it, which happens to be 5. 5 plus 2 is 7. And we can do the same thing at 10. And because the original value is 10, 10 plus 10 is 20, and that's exactly what we get.

So we can go ahead and look at an example about that. And here it is, pretty much exactly what we have done. And you see that the output, we wrote exactly what I showed you on the slide. And the output exactly what we were discussing. So that's all good. OK.

So go ahead and take some time and look at what I just showed you here and play with it a little bit. Here let's take a look at returning functions. So because you can have functions as variables, you can also have functions that create other functions. So the createFunction is a closure, and thus has access to all the outer variables.

So here's an example, what I have here, createIncrementByNumber. That takes a number and returns a function that returns number plus x. So now if I call the create increment by number and pass 2 to it and call it inc and then to it I pass, in this case, 3-- so it will go ahead and add 2 to 3. And that makes it 5.

What I can do in inc 10 and adds two to 10. That becomes [INAUDIBLE]. Then create a new one with the value 10. And then I do inc 3. So that will add 3 to 10. That becomes 13. And then increment 2 and pass to it a 10. That's 10 plus 10. We become 20. And that's what we get over there.

And let's go ahead and look at an example about that. And that's exactly what we have. And if you take a look at what we wrote and then the output, you'll see that exactly creates the output that I was just discussing with you. So go ahead and try it, just so you can see for yourself. OK.

And now we're going to go ahead and look at closures with loops. This is an interesting type of a problem using closures with loops that can lead to some unexpected bugs. So be careful with that. So here I have a function in an array which happens to be an empty array. And I use the for loop for i equal to 0, i less than 5, i plus plus. I'll go ahead and push in this case, call the push method, and call the function console.log i, which prints the value of i.

And then I have a for loop outside that for our t equals 0, t less than the length of the array, t plus plus, I'll go ahead and call the function array t as a function. So what's interesting here is that closures in this example are created for every iteration on the loop but they lose a variable i that is declared in the for loop that you see here. So in this case, the value of i changed in every iteration that we see here, and therefore, invoking a closure will result in all of them printing the same value. And that's why we have all print 5 in this case.

We expect that we're going to print 0 through 4. But in fact, it's going to print 5. This is because unfortunately, in this case, all of this happens, you know, everything happens in the same scope. And that's why we have this. Which means it increments and goes i to 5 and then it will go ahead and print. For every time we have the same scope, which is prints the same value 5.

And the question is how can we now solve these type of a problem? And one way to solve this problem is to use the anonymous functions. Remember, we discussed the anonymous functions last time when we introduced the function in the previous JavaScript lectures or lessons. And this is pretty much a very, very quick way to create a new scope just by go ahead and by, in this case, using the anonymous function. This is basically a function that is created and invoked immediately after. That's basically what it is.

So here we have an anonymous function which is declared and used immediately. And usually its purpose is to create a new scope. So we have a function and then between parentheses we go ahead and pass [INAUDIBLE] and then invoke it.

You can set a new scope to a variable in this case, so for example, the variable a here. And this would have a new scope every time. Or you can store the variable state like in this case. So this is pretty much what [INAUDIBLE] as you see here. You look at the entire statement is enclosed in parenthesis that you see here.

And of course, take a look at the parenthesis that come after the curly braces that you see here in green. All right. So it turns out that this is a very, very nice mechanism. So to solve the problem, the previous problem that we have here, and try to print 0 through 4-- because remember, i is strictly less than 5-- what we do is we use the loops with anonymous functions. So you can actually use anonymous functions to create a new scope that store the state of some variables by copying them to the newly-created scope. That's basically what it is.

So you see here, I put all of this and then pass to it-- so this function here, I put parenthesis, close parenthesis, here. And then I pass i to it. OK. So here the closure that is stored in the array is created inside the anonymous function. Which means a new scope is created. And the scope declares a new number variable as the argument of the anonymous function. And every time it is called, a new value of that variable i Is copied into the new scope.

So which means the closures can use now the new copied values that are stored in the anonymous context. And this actually works without any parameters, which means a new scope is created that stores the value of a variable i in the current iteration. And that's why when you now iterate through it, it was going to print 0 through 4. That's kind of nice to see that.

And let's take a look at this as an example. And for that, let's look at loops and closures. And you'll see that's exactly what happened. So here I'll go ahead and create it the original way without the anonymous function. And we're going to print 555. And that's exactly what we see.

And now we'll go ahead and use the fixed-- the one that we've extended version. And then that basically use the anonymous and has a new value for every new scope for the value i. And this allows me to print 0, 1, 2, 3, 4. And that's easy. So that's exactly what we wanted.

And that's basically how we fix this problem. So you can go ahead and take a few minutes to just take a look at it. Now let's take a look at copying values. So here's an example, pretty much kind of similar to what we have seen before. Remember, we've seen this example earlier in one of the slides earlier, except that here we create new scopes by using anonymous functions.

So take a look at it. This function here, we open parenthesis, close parentheses. And then we pass number 1 and number 2 to it. So which means here when I click call trickyAdd with this anonymous function, it's going to create the new scope. So these will be lost. And then we have the new scope values for number 1 and number 2, which gives me 2.

So here, because we are creating new scopes by using a function-- and this, again, to do this, we copy the values of the outer scopes and return the values that these variables had when the anonymous function was invoked. And that's why these are returned. And then because the function returns-- the 2 returns a new number plus new number 2, new number 1 plus new number 2, and that's going to be 1 and 1. OK.

Now, let's take a look at the concept of modules. Modules are independent piece of code that run in their own scope. And we use anonymous functions to accomplish this. So anonymous functions, what they do is they create new isolated scopes that can basically effectively copy variables from outer scope, keeping their values when the function is invoked.

So when we use these functions, what we can do is we can create code that can declare any variable or function without risking interference with the other code. And again, the coding side, the anonymous function runs in its own scope. So if it is a module, because it can be run in any application without interfering with other files. And that's the good thing about it. So we use the anonymous functions.

And let's see how actually we can use that. So here's a very good example where we use modules. This you can create objects in module code then return the objects to use the module anywhere. So here you can go ahead and if you want to keep adding functionalities to a module, you can return an object in the anonymous function and use the same object as a parameter. That's exactly what you have. OK.

And so you return-- it returns the module. And then we pass that module. And then here we have the module.method, which is a function. And the module.variable, which is a. And we have a module private variable, which is b. And then return the module. So see? And then of course, this takes a module or anything-- any extension that you want to add in this case.

And let's see an example about that. So here take a look at this. It's quite a good example. So here we have an add event listen that loads the function. Here we have console module dot getName. So let's take a look at the module. So we're going to go look at the module.js. And the module.getName here is a function that [INAUDIBLE] name, which happens to be module 1, so which means it should print module 1. And that's exactly what we have.

Then after that, we'll go ahead and call the public variables of the module, which happens to be a. And then I'll print it out. It's going to go ahead and print a. That's what we see here. Now what we're going to do is module.method. So we're going to call a method.

So the method here happens to be a function that returns, in this case, that prints method exclamation. And that's what we see here. And then after that, we'll go ahead module extension. So we're going to now call an extension. Let's take a look here. It turns out there is no extension here. But remember, we can pass the module any extension that you see here.

So we look at the extension, it turns out that extension is here, which are represented by a function that prints extension and then the name ext1. And that's exactly what we get here, see? When it came to calling the extension, it could not be found here. So we added it here. And that's how it's now called. And of course, it will print extension, colon, space, and then the ex1, which is this one here. OK. That's a good example.

So go ahead and take a look at it just to kind of have an idea about it. OK. All right. Let's continue with our lesson. And now we're going to take a look at some prototypes. So we know that all objects in JavaScript have prototype property. You can assign an object to prototype and you can chain prototypes, too.

So here are some prototype functions. You can add the function to an object by using function a. And then that has the getName, which happens to be a function, returns a. Again, with the prototypes, we can use this syntax when we can say function a and then say a.prototype getName, and then returns a. So here we use the prototype.

Using prototypes, you can also declare functions outside the constructor function. Again, the difference in this case between declaring functions inside the constructor and outside it is that declaring object function inside creates a new function reference for every object that is created. So here let's look at the prototype dynamic object modification.

And of course, by using prototypes with objects, you can actually declare methods that will take effect even in the existing objects that were created before the function declaration. So adding properties and methods to the prototype will affect all the instances. Here as an example, I have a function a. And then I have instance one, created using a, and instance of creating using a. Then we have the getName, which happens to be, in this case, a function that returns a.

So we find now a log instance.getName it will return a and instance to getName will return a. So even though we created the instance one instance two before we specified the getname prototype function that you see over there. So that's why we said by using a prototypes with object, you can go ahead and declare methods that will take effect even in the existing objects that were created before the function declaration. And that's what we have here, as an example.

We create an instance one and instance two before the getName was declared. And then as you see here, it works without any problem. All right. Now looking at the prototype chain-- well, JavaScript, actually, prototypes can simulate the concept of inheritance that we have in Java.

So you can assign an object to another object prototype. And JavaScript will go ahead and make a simple lookup when you try to access property from an object. So here we have a function a. And then we have the getName, which [INAUDIBLE] return proto. And then here I have function B, and then the prototype b which creates a new object, A. And then if I use now a B to create an object B, if I now do a B.getName, what happens in this case is that JavaScript will go ahead and look at it.

If the method is not found in the object, it will go ahead and search in the object prototype to find it. It turned out not here because B was created with the prototype a. And because we're looking for the getName, it was not found in B. But we found it in a because B was built with a. That's what it is.

And we can see an example about that. And here it is. So pretty much we create an instance. We go ahead and, in this case, log the getName. Here's the getName even though we created it after we create the instances. And we'll go ahead and print proto A. And here we go ahead and create the b function that-- and then we have prototype b, which is a new A. Then we create B and get the name. And that, of course, will go ahead and print proto a.

You can go ahead and try this. I just showed you this example. Go ahead and try it, just to kind of see how it works. And now let's start talking a little bit about the HTML drag and drop. So the drag and drop interaction are included in HTML5 by using JavaScript events. It's kind of nice. And in general in drag and drop operation, usually two elements interact. OK.

So the drag and drop operation are meant to transfer information from one element to another one. And you can think of a drag and drop like copy and paste that we all know about that. You copy and then you can go ahead and move down and then drop it. So the drag and drop content is stored in the data transfer.

And using the data transfer, multiple elements can react to the drag and drop operation. So the idea here is that the drag-and-drop operation uses the data transfer object, which is equivalent to the clipboard of the copy and paste operation. That's what it is. OK.

And we can go ahead and use the dragstart, dragover, and drop event. So when the dragstart function, the drag event, sets the data transfer object, in the dragover, what it does, it reads the data transfer to allow the drop on the element. And then in the drop, the element reads and uses the data transfer object to access it and drop the data.

So data can be stored in the data transfer. And then of course by using the set method type of data, you can go ahead and set it. And then to retrieve it, you just use the get method. We'll see that in a couple of slides. Let's start with the start-- in this case, start with the dragstart.

So the HTML element here that can be dragged to add the following events and sets the dragable attribute, we see it here. So we have the ondragstart, which is the drag that takes event. And then we have draggable set to true. And then the value is dragme. The JavaScript code for the handler sets the data transfer, as you see here.

Takes the event, and we have such that the decks, which happens to be dragged. And then, of course, we have a dragover. And the dragover in this case-- basically the element may receive drag and drops, need to add, again, this dragover, which again, [INAUDIBLE] drop here. And the JavaScript code follows where you have the dragover event, which, by the way, invokes the prevent default.

So in this case, the code that we see right now on this slide that you need to add to the element that can retrieve the drag. So the JavaScript function must invoke the prevent default to allow the drop. That's what we see here, prevent default. OK. Of course, this event will happen when the mouse button is still pressed on the cursor and is hovering over the element, whatever element you have.

And then we have the drop. So of course the elements that receive the drop must add the listener. So ondrop, and then, of course, we have the ondrop that have the drag event. And then, of course, the JavaScript will be drop, and then the event brand, and then the alert, which is the event.DataTransfer.GetData("test").

So what you see here, what's in bold, is the ondrop event. And this basically shows that you must, again, add to an element which is after accepting a drop by using the ondragover event. It executes a function when the dragged element is released on the target element. Again, the drop here will trigger when the JavaScript code is executed. And that's what you see here.

And let's see an example about that. And here it is. So here I don't have an HTML page which happens to be having the dragme, which has, again, the ondragstart and the dragevent. This function is the draghere that basically sets the data, the text we dragged. And then I do have here the second one, the date which has the ondragover that basically has the text, the dragover event, which is this one here, dragover function event.

And then that's where you invoke the prevent default to allow you to drag this and to drop it. And then after that I have the ondrop here. And drop here. And that would be the drop that prevents the default. And then use the getdata to print that. And all what you do here, you click on this and then drag it. And then the minute you release it, you have thee dragged text that is printed out over there. And that's exactly what we have here.

And that's basically the example, again, by looking at the both. The set the debug console for the drag and drop. And then we have the two divs here that you see with the function drag. And the function, in this case, dropover, and the function drop, which are created here. Drag, dropover, and drop. And if we do it, that's exactly what happened. And then you see the message.

Now, let's go ahead and take a look at delays and intervals. So to execute a function after a set period of time, we used the setTimeout, with a function and then some delay. So the delay or the timeout function is executed after a certain amount of time. It executes a function after a delay in milliseconds.

And of course, we should note that the setTimeout is not a blocking call. So here's an example set and then the function that logs timeout after 1,000 milliseconds. That's what we have here. This will print after timeout. And a second later, it will print the timeout. And let's go ahead and look at this in the example.

So we have an index.html and I will start with a start time out here. Click on the Start Time Out. That calls the start time out. And the start time out here-- we'll go ahead and use, in this case, this one here-- I'm sorry, the start time out which is this one here that has a set the timeout takes a function, and prints a timeout after 3,000 seconds.

So I'll go ahead and do that. So I'll see setting timeout, which is printed out. And then after timeout. And then after three seconds, it will print timeout. That's what we see. Let's clear this.

Now, we can also use the interval function. That also can be used. And interval function is similar to the timeout, except that the callback function, it executed at a point in the future. But then the difference is that the interval are expected periodically to repeat until they are canceled. So here I have this set interval function and then the delay. This will execute the function with a delay of this much milliseconds, delay milliseconds.

So here is set interval and we have the function. And this will print interval every 1,000 milliseconds. And of course, until we cancel it, this will print after interval. And then every a second 1,000 milliseconds, we'll go ahead and print interval. And we see this here.

So I have here in the index and I have a start interval, which is this one here, which calls the start interval. We should go ahead and set the function interval with a delay of 1,000. And then print that-- so it prints after interval and set print on interval every second-- of course, until I cancel it. So I'll go ahead and do that.

And this will keep on going on and on. It will never stop until I cancel it. It turns out that we wrote the cancel interval. Let me go ahead and stop it and then show you the cancel. Which, by the way, here you just call on the cancel. So you can cancel an interval and timeout. So here clear the timeout through both setInterval and setTimeout. Clear the timeout by passing timeout or clear interval.

And we can go ahead and look at them here. So in my JavaScript code, here's my cancel timeout. And then here the cancel interval, that basically defined the interval ID to undefined and then that would stop it. And that's what we have here. This will clear the time out. And this, so for example, it can go ahead and do a start timeout. And then you can cancel to timeout. So start and then cancel it.

If I cancel it, I don't even see the output. But if I start the timeout and wait a little bit, it's going to go ahead and print, then be clear, timeout after some time. Let me go ahead and clear this guy here. And I'm going to start the timeout and cancel it right away. See, I don't see anything. I don't see the timeout.

When I start the timeout and I don't cancel anything-- let me just clear this first-- see? I get the timeout. Let me go ahead and clear up, clear the console. And then I start the timeout. And I'll wait. After a certain time, I see timeout. But I imagine now I'm going to clear the console. I start it and then I cancel it right away. So I would never see the timeout.

But then if I start the interval-- let me clear this-- and you go ahead and print interval all the time. But then I can go ahead and click cancel interval. It will go ahead and stop it. And this is the cancel timeout. And this is how you write the cancel interval. So you can go ahead and take some time to do it. OK. Try it on your lab machine.

Now let's take a look at JavaScript concurrency. JavaScript is not multi-threaded and every function is executed sequentially. You can simulate concurrency by using intervals and timeouts like we've seen earlier. But it's not recommended. JavaScript does not provide direct control mechanism because there are no blocking calls.

But in HTML5, workers actually are introduced to perform processing without blocking the UI. Workers execute a separate JavaScript file. Workers communicate by using messages. And workers cannot manipulate DOM elements. And workers cannot access the window document or parent objects. And they are executed as a separate system thread.

So we should say that although the workers are on different threads and JavaScript does not provide a thread safety mechanism, we can go ahead and look at scenarios where concurrency problems that are scarce because of the sandboxed environment of workers. So remember that.

And let's see how we can actually do that in HTML5. So here are examples where workers are typically really simple to use. And you just need to load the JavaScript file. So the worker will run in the worker a object constructor. Now here's an example where I could create a new instance of worker and pass the JavaScript that we want to use it.

It turned out that to listen to workers' messages, you use the on message that you see here. So what we tell you in this case that if you want the workers, that we run and you want to add the on-message listener to the worker to receive messages from the worker. You can go ahead and use the on message handlers. In this case, it has a function that takes an event which logs that information.

And to start the worker and send messages to workers, you can use the postMessage that you see over there. So to send messages to worker, use the postMessage method in the worker. You can actually use workers in different instances within HTTP requests when AJAX technology are creating timeouts and intervals or clearing the timeouts on intervals or getting the location object, which is read-only, or spawning other workers.

And let's show you an example here. Here we do have a JavaScript code that basically has a-- so here I have an index.html, which happens to be to have in a button called Start Worker. And when I click on it, it calls the Start Worker function. The start worker function creates a new worker and pass to it the worker.js JavaScript here that iterates through the for loop and prints i.

So here we do have-- we log the information event.data. And that basically prints that. OK. And then of course here we go ahead and start the worker. And then call the post processing by passing a string. And then to it we have the for loop between 0 and 10. And then log the value of i.

Remember that in this case this will go ahead and has the post that prints an empty space and then i. So if I now run this, click on Start, it will go ahead and show me. Take a look here. So first of all, I have the log 0. And that comes from this that it prints log i, which is log 0 through 9. And then, of course, after that, we have the message i message from, in this case.

And so this comes here where I have the message from and then the event data, which is worker 0, worker 1, worker 2, and so forth, that I see here. And that's basically what I want us to show-- what they want to show us as an example in here.

So you can go ahead and try it, just to kind of see the example. And now what we want to do is take a look at HTML Canvas. So the HTML5 Canvas element is a blank placeholder with a defined width and height. It is basically usually rendered as a white or transparent block on your page. So here's basically what we have-- Canvas and then width 300. The height is 200.

The id is basically here HTML5 Canvas, which basically has a text that Canvas is not supported, as an example. If the Canvas is not supported, the body of the Canvas element is rendered, which Canvas not supported. And here's an example where here we use a JavaScript to paint the Canvas element. So to paint that, again, you must get the Canvas element.

So here Canvas element, by getElementByID. And use the context to paint. So first of all, you need to get the 2D context from the Canvas element by calling the get2D, get context 2D. And then you can go ahead and call the fill style and fill it up. And filling a rectangle you specify the fill rect. And then you pass xy and width and height to it as you see over there.

So here is a Canvas space. Again, most paint functions work on the Canvas by providing the coordinates in this case. And we can see an example of view that can set a style for a stroke and the fill of figures painted on the canvas. And here, as you see here, we can have the context and then the stroke, a style which-- whatever you want in this case.

And then here we specify line width, which is 3, and then that's the line. And then after that, the line cap can be a butt that you see here, or round, or a square that you see. And by the way, all of this are examples that we can see later on. So here we do have a Canvas stroke, that's basically showing you in index.html which is a canvas 300 by 200. And then we have a JavaScript code that will go ahead and create those. Going back and continuing with this.

Here we have Canvas fills. You can have a solid color, like the one that you see here. Or you can use an RGB. Or you can use the gradient. The gradient fills are a little bit more complicated. You create a gradient object by using the create linear gradient. You pass to it the coordinates. And you add the color, the color stop, by defining the gradient. Could be 0, or a certain-- a gradient, by the way, value would be between 0 and 1. That's the value that renders.

For example, here is 30%-- that's why you see the grayish-- And then of course, one, which fills up the whole thing. That's why, for example, if you take a look at this example, it starts all the way from black and keeps on going all the way and goes through the green and goes through the light green all the way into the white. That's what we see here.

OK. You can actually see this in the practice-- rather, in the lab machine. Here's the example. That's why. Here's the index and I'll create a Canvas. And then in it we'll go ahead and run this JavaScript code. OK, so the first one is in red. Second one here we do have in this case a grayish type of--

And then we have the gradient. The gradient is the third one. Starts from black, goes through a dark green, keeps on going through light green, all the way to white. Here's another example of a text on Canvas, which is really simple. So fill in style here, for example, black, and then [? read ?] the font and then fill in the text-- add a particular coordinates 10, 10.

So here is the example. I can go ahead and always change the coordinates if I want to. So for example, I can go ahead and say just instead of 100, 100 I can go ahead and say 100, 100 and then go and run it. And see now the hello starts at 100, 100.

And I can always change also the pixels, the fonts to a 100. And that maybe could be a huge one. So it's just too big. Maybe something a little bit smaller, 50. And so forth.

You can go ahead and create paths and strokes. You can create paths to paint complex objects. It begin the path and fill in path and stroke. When using path, think of how you would move through the shape using the movement instruction to draw a shape. Here's a good example.

So let me go ahead and-- so here's an example. Here we go ahead and begin the path. And then we move the pen to start the point at the figure 10, 100 coordinates. From there, we'll go ahead and draw a line to 60, 10. And then after that-- so here's drawing the line from 60 to 10.

Then after that, we'll go ahead and draw a line from 110 to 110. And then after that we'll go ahead and finish with 10 to 100. OK. And then after that fill the whole thing with, of course, a particular color. And do a stroke. OK. And that's what we see at the end.

So let's go ahead and see this in the example. So here it is. See? Now I can go ahead and change, I don't know, the color. I don't like, like FF and see what happened. So you see that what I can create in this case is 0, 0 here and see what happened. And so forth. I can change the color any way you want.

So here, looking at path curves-- so again, in here, a curve follows the same rules as lines. But they have, in this case, curves. So start when the cursor was moved last and from there. And then the coordinates given will generate the curve. So here, for example, we have a quadratic curve that has one point here which basically represents the curve.

Or we have what we call a Bezier curve that has two points for the base. A quadratic uses a control point and the destination point. And the Bezier uses two control points specifying-- so this would specify this curve. And this would specify this curve in this case.

You can work with shapes-- stroke, rectangle, and fill up the rectangle, or circles here, arc, xy radius, the angle, and the start angle, end angle, and so forth. You could draw a circle by doing xy radius and then 0 and then 2 times pi, whatever it is.

You can also, by the way, paint an image in the canvas by using the IMG element. So here's an example. Get element by ID and then draw the image that you see over there starting at the xy, as an example. So all of these are basically the one that I showed you earlier. And then of course the Canvas. And that's showing you in the HTML the two curves within the 400 pi 200 Canvas. And then we have the two curves here that we created.

And that's basically the difference. So go ahead and take a look at every one of them. And so I went through the Canvas stroke, Canvas fills, Canvas text, Canvas basic path, and then the Canvas curves. You can go ahead and try them.

And this is exactly what I wanted, pretty much, what I wanted to say about this lesson. So pretty much we went through defining functions and use them as values. We created closures with appropriate variables. We looked at the JavaScript function as our modules.

We looked at the concept of drag and drop interaction with JavaScript. We looked at the JavaScript timers and delays to create animations in HTML. And then, of course, we use the paint on the HTML5 Canvas by using JavaScript. We tried all of that.

It turned out that we have some nice practice. And this will be on Netbeans, which is really quite good. So you're going to create a new application with the Canvas and painting a curve with a button using the interval to paint random circles on the canvas, implementing drag and drop to paint stickers on the canvas, and of course, implementing the mouse gesture to paint on the canvas with a mouse.

So looking at the activity guide, this will be number 8 where we have a-- first we're painting in the HTML5 Canvas. We go ahead and paint the circle. After that, we create an interval to paint in the Canvas randomly some circles. After that, we implement the drag and drop.

And after that, we paint the Canvas with a mouse gesture. So when you do the practice, it would look like this. I kind of did it. So here's your index.html. Go ahead and try it. This is pretty much what it is. And then, of course, here's your JavaScript code that you are going to write. See? You got your clear Canvas, draw a circle, draw dots. This is what we do in the first exercise.

In the second one, you do the draw dots. In the third one, you drag and drop. And in the fourth one, you have the mouse down, mouse up to write with the mouse. And then we make use of some pictures here and so forth to drag and drop. So if I run this-- and so that's what I have in this case. I have a Canvas.

If I click on a circle, it will go ahead and create a circle for me. I can go ahead and use my mouse and for example let's assume that I want to write Oracle with a mouse. That was the exercise number four, practice number four. I can drag and drop, see, and on and so forth.

And then the last one is when I do a dot. This would be the second one. When I click on dot it creates random dots everywhere. They're random circles everywhere. OK. So this is kind of nice. Try it and then we'll take a look at the solution. Every practice that you try we'll provide you a solution for it.

And that's pretty much what we wanted to say about this lesson. So it is actually an excellent lesson. It has lots of nice new features that we've seen. Go ahead and try them in the different exercises that we have on the console, and then of course on NetBeans, which is the practices 8.1, 8.2, 8.3, and 8.4. Thank you.

## 2. Practice 8-1: Painting in an HTML5 Canvas Element - 7m

OK, now that we;re done with the lecture in lesson eight, which is related the advanced JavaScript, let's go ahead and take a look at its practices. And we start with practice number 8-1. Here, we are going to paint in an HTML Canvas element. OK, that's what we're going to do.

So we create an HTML5 Canvas application with buttons that draw and clear the canvas. After you completed your application, you should look, again, similar to what you see here, OK? Clean and circle, OK?

And then, of course, we're going to open the NetBeans and create a project. This project is going to be called, in this case, lab_01. So I create that and pretty much will add code to it. You know, modify the index.html file, change the title of the page, HTML5 Canvas and JavaScript. And then, of course, add a script-- a reference to the code.js to handle that, the head section of the file is.

Inside the body, add a div element with a palette ID. Inside the palette div, add two buttons, a clear button that has an onclick event that calls the clearCanvas JavaScript function. And then circle button that has an onclick event that calls the drawCircle JavaScript function.

Add an element with a content ID. Inside the content div, add a Canvas element with a board ID with property of 640, and of course, a high property of 480. Again, optionally, add a div element that encloses the compass element and add a style attribute to add a border to the canvas. So that's basically how it's going to look, OK. And which, by the way, in our practice would be this. OK, that's what we have, except that we have and addition here.

So we have the head HTML5 title, HTML Canvas and JavaScript. And then we have the meta character set, the name, viewpoint, and then the script. You know, in this case, JavaScript code. And then, of course, we do have, in this case, a palette that has the button clear and circle.

Here, if you take a look, we do have extra buttons for the dots. And then we do have the images. These are just for the next exercises. I cannot put everything-- and then I'll go through them step by step in every single exercise. So right now, we're just focusing on a exercise or rather practice 8-1. You know, every time I say exercise or practice, I mean the same thing, OK?

So let's go back to our-- so now, of course, we're going to write some JavaScript code for it, OK? And let's go ahead and take a look at what we've done. Here in the code.js, I pretty much have the code related to practice number one, which is this one here. Let's go ahead and go through it. And then after that, in a practice number two, I will go through the-- so in the section practice 8-2 and so forth, OK?

So let's start with the first practice, where, in this case, we declare a variable canvas. And we add the window load listener and assigned to the canvas variable the value of documentGetElement, board. That's what we have here.

And then after that, I go ahead, in this case, and create a new clear canvas function, which is this one here. This basically-- what it does, it gets to the context of the Canvas element and assign it to a new variable named context. That's what I see here on line eight. Then after that, I'll go ahead and assign the field style property when the context, CTX, the value FFF, VC here. And then to set the field color to solid white, that's what I have here.

And then after that, I'll go ahead and, in this case, call the fillRect function in the Canvas element to paint the entire canvas, OK? As you see here. And then, all what I need to do now is create a draw function with the draw-- rather a draw certain function. That's what I want to create.

So we get the 2D context of the Canvas element and assign it to a new variable CTX. That's what we do here on line 14. And then, we assign the stroke style property of CTX to the value 000, in this case, to set the stroke to block. And then after that, we'll go ahead and call the beginPath to start the path.

And then, we create arc in the middle of the canvas. You know, here we specify the x-coordinates equal to the canvas with-- divided by two. And then the y-coordinate is equal to canvas with divide by two. Height, rather, divide by two. Then the radius is set to 45. Then the initial angle is-- I arrived at a zero here. And then the final angle is two times pi, the math pi.

And then after that, we'll go ahead and call the stroke to paint the circle on the screen. And that's, again, in this case, what they want us to do, OK? And then, of course, after that, we run the application.

So if you run the application, now we have a-- if we click on the circle, it draws the circle. And then, we can go ahead and clear it if we want. That's what we have.

We ignore the dot button. That's for the next-- one of the next practices that we have. We also you ignore all these images here. We don't have them right now that we see. Originally, you don't see that. But I put the whole thing together, so that I can go sort of them one by one. This is pretty much what they want us to do for this practice, which is practice 8-1. Thank you.

## 3. Practice 8-2: Creating an Interval to Paint in a Canvas Element - 6m

Let's take a look now at practice 8-2. Here, we're going to create an interval to paint in a Canvas element. So in this practice, we create an interval function to paint dots in the Canvas element in random position, OK? After, again, we finish where application will have an extra button that paint circles in random positions at a fixed interval when it is first clicked and stops the interval when it is clicked again, OK? So this we have the dot.

So in this one, we'll open the index.html. We add an input button in this case, div id palette, the onclick when I draw dots. OK, that's basically what we're going to have here. And let's take a look at that.

So if I-- and let's take a look at that. So in this case, if I-- so that's basically what we have here as an extra line, OK? We ignore this img tags for now, and they will be part of the next practice, OK? But right now, that's what we have, OK?

And then, of course, we'll open the code.js, a file. And now, we'll go ahead and add some code. So this, again, is related to practice 8-2 or the set of code that I'm showing you here would be related to the practice 8-2, OK?

So here, in this case, in the code.js-- yes so we create a global variable named last interval, OK, to store the ID of the current interval. Again , do not set any value on it right now. Then after that, we create a draw dots function. Here, you see. And so, of course, we check whether the last interval variable is defined and invoke the clear, in this case, a interval and passed to it the last interval, then-- and set the last interval variable in this case.

And so, this is basically what I have here. And then a-- if that's so-- if that, we'll go ahead and clear the last interval, and then we said the last month to have divide-- else-- in the else statement, what we do is we assign the-- in this case, the last internal variable to the result from calling the set interval a function, OK, with anonymous function for-- as parameter that we have here. So inside, what we do is we'll go ahead and get, in this case, 2D contacts from the canvas and assign it to a new contact CTX variable. And that's what we have here on line 29.

And then after that, we set the CTX stroke style to 000. And the CTX failed start to a property. So that's what we have here.

And then we go ahead and invoke the CTX beginPath. And then we create the next variable, and this would be the position. And assign the random value zero and, in this case, and the converse with to it, OK.

And then we'll go ahead and create a variable y, and assign a random variable zero, and a Canvas. Height to it. And then we called the arc a function to draw the circle, OK, in this case. And by passing through it, as you see here, the x and y and then a-- you know, the radius, in this case, 10, OK? And then 0 for the starting angle, and then the last would be 2 times a pie. But not that PI, OK.

And then after that, we'll call the field to create a solid color code. And then after that, we call a stroke to outline the circle, OK? And then, of course, after that-- and a-- in this case, we passed with 215 clothes. The anonymous function and set a second parameter to the setInterval, in this case, function to a number of milliseconds that the interval function would be invoked. That's sweet to have that many seconds.

And then, of course, after that, we'll go ahead and test the application. And now, if we click on that, it's going to go ahead and create run demands. And then if I click on it again, it will go ahead and stop. If I it again, it will keep on creating random circles. Enough, click again, we'll go ahead and stop. I can go ahead and do a clear, by the way, to clear everything. All right. And that's, A, what they want us to do in these practice. Thank you.

## 4. Practice 8-3: Implementing Drag and Drop to Paint Images on the Canvas - 7m

- Let's take a look now at Practice 8-3. Here we're going to implement the drag and drop to paint images on the canvas, OK. So we create a image elements that can be dragged over the canvas to paint them after we-- we've finished, we can go ahead and drag and drop stickers to the canvas, OK.

So here, what we do is pretty much following the tasks. So we open the index, we got to see add-- add one or multiple img elements to the Div ID. OK, so we got the for each the-- img element, we have set the source how to be-- to be to one of the sticker images that we copied again in this case in step 1.

And then of course because we did all this copying in the beginning. And then of course set the draggable attribute to true and then set the ondragstart, in this case event to a drag-- a function, JavaScript function. OK.

And of course set the ID of the, in this case, of-- set the ID of the element to something unique, such as like a sticker1, sticker2, and so on. Make sure that you do not repeat the IDs of the img elements.

Set, you know, alt attribute, in this case, to be something, you know, descriptive-- descriptive, rather. OK, we can-- may leave in this case, this attribute empty. Use again this type of code there to put down this here, OK.

And that's what we're going to do. And then of course set the ondrop here, modify the canvas, set the ondrop to drop(event) JavaScript function and set the ondragover element to the allowDrop function [INAUDIBLE] an event, JavaScript function.

And use again this code there to, you know, for reference to add, you know, all of these attributes as highlighted here. That you see here. OK, let's see now.

This is pretty much would be all the code in the index.html. OK, that's what we have here. OK. And then of course here is the-- pretty much the type of code that they want us to add for sticker1, sticker2, sticker3, sticker4, but we have to go to 8, OK.

And then here we have the canvas. You see here with the width, 640, and the height, 480, ondrop, ondragover, and on mouseDown. That's what we have here.

And on mouseMove, on mouseUp, you know, and so forth. That's what they want us to do. And then of course now they want us to open the Code.JS and add some code to it.

OK, so that's where it say open the Code.JS and then create a drag function. OK. Created-- let's go ahead and take a look at this code. So this would be here related to practice number 8-3.

So here we first create a drag. A-- a [INAUDIBLE] event function. So what we are going to do is get the ID of the drag, in this case, a element by using the event.target.getAttributes ID. And then we go ahead and, in this case, in the drag and drop interaction you store a value in the data transfer object that is sent from the element that starts the drag to all objects that can receive a drop.

Set the data here. We'll go ahead, and in this case, so that's how it look-- looked like. Where we call the event.dragTransfer in this case a dot-- set data on text and then element ID.

We'll now create allow a drop, and that takes an event. The allowDrop function is code with the ondragover event by default. This event prevents dropping-- drop operations. To allow this operation, you must again in this case code the event.preventDefault, and that's what you see here.

Then after we create the drop function. That's an event. So here we go and the draw function is executed where-- where-- when the cursor is released. By default the drop operation does nothing and is not allowed to allow the operation called the prevent default at the-- as the first is taken over function.

To get the ID in this case, here is the element ID. You know, in this case, that-- in this case, get the element-- get data text in this case. That's what we have. And here we do get element by ID.

OK, that's it. So [INAUDIBLE] to get the ID of the element that will drive-- you know, get the data you stored in the drag function by using the event.dataTransfer.getID text, that's what we have here on line 54.

And then after that, get the img element by using the ID that you just retrieved from the data transfer. That's what we have here. And then get the 2D context canvas element. And then after that, get the canvas, the bounds of the canvas by using the canvas.getBoundingClientRect. And then after that, go ahead and calculate the x-coordinate by using event.clientX minus the canvasBounds.left.

Then we do the same thing for y. And then after that, we'll go ahead and in this case invoke the draw image. And in this case where we pass, in this case, the element and the x-y coordinates.

And then after that pretty much we're done with the code of this practice. Now what we're going to do is just try it. And you see now I can go ahead and drag and drop any type of sticker. OK, and so forth.

And I can drop it anywhere I want within the canvas. And that's what they want us to do in this practice. Thank you.

## 5. Practice 8-4: Painting the Canvas with Mouse Gestures - 6m

Let's now take a look at the last practice, which is 8-4. Here we're going to paint the canvas with mouse gestures. In this practice, we create a mouse event for the canvas element to simulate the effect of painting with a paintbrush.

And so, of course, after we finish, click and drag your mouse with paint as a paintbrush. That's basically what it is.

So, for this, we go ahead and open the index.html, modify the canvas element where we set the on mouseDown event to mouseDown on mouseMove, mouseMove and then on mouseUp to mouseUp. And then we use the-- a code, in this case, that you see here to reference the added attribute that are highlighted in bold like you see here. OK?

And so this would be all in the index.html, and let me show you that. So this is pretty much what we have in this case. And so, as you see here, a-- this is the code that, basically, they want us to look at from a-- drop on mouseDown, on mouseMove, on mouseUp. You know? So OK. All right. Which, by the way, we already have seen kind of in the previous practice.

And now, after that, going back to-- then they want us to pretty much open the code.js and start creating a new global variable, isdown, and so forth. Let's go ahead and take a look at that.

So let's go ahead and take a look at that. So we go to the code. and then we look at the code, in this case, related to a practice eight, which is this one here.

So here what they want us to do is create, in this case, a global variable, isdown. OK? And set it to false. That's what we have here.

And this variable is used to know whether the mouse button is pressed on the canvas or not. And then we create a mouseDown, a function. The mouseDown function here takes an event, and set the isdown to true. And then here we create the mouseUP. Now, that takes an event, and set the isdown down to false.

And then out here we going to create a mouseMove function that takes an event. So this function paints the canvas when the isdown variable is set to true because you cannot know if the mouse button is pressed or not in this event handler.

So the first thing we do is get the-- in line 75 here, we get the context from the canvas object. And then we go ahead in this case and a-- get the canvasBounds, OK, by calling the get a bound-- a other-- a bounding a client rect. OK. That's what we do here.

And then after that, we calculate the x-coordinate, which would be the a-- calling the clientX minus the canvasBounds.left. Then we do the same thing for y, and then we go ahead and call the-- a fillStyle. Set it to rgba in this case. And, in this case, what we're doing is we're setting the fillStyle of the ctx object to a translucent color by setting it to rgba zero, zero, zero, and 0.3.

After that, we'll go ahead and a-- basically, draw a small circle in the xy-coordinate with a radius-- in this case, three-- filling it with a preceding color. That's what we have here, beginPath. And then, of course, we call the fill in this case a function. OK?

And then let's go and run it. And now a-- by holding the mouse, I can actually do a paintbrush. So, for example, here I can go ahead and create O, a R, a A, as an example, and C, L, and then an E. And that, basically, would be, in this case, a Oracle as an example.

Pretty much, you can go ahead and use it as a paintbrush and do whatever you want to do with it. And that's what they want us to do in this-- a practice. Thank you.
