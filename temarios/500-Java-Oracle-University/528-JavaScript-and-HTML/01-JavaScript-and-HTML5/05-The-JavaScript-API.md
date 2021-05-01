# 5: The JavaScript API

1. The JavaScript API - 1h 10m
2. Practice 5-1: Bill Calculator by Age - 15m
3. Practice& Solution 5-2: Changing Inputs for Birth Dates - 9m

## 1. The JavaScript API - 1h 10m

OK, let's go ahead now and get into the next lesson, which is lesson 5, and this talks about the JavaScript API. So in this lesson, pretty much we are going to validate user input with JavaScript and regular expressions. We're going to handle multiple values with JavaScript collections and manipulate dates with JavaScript date API. So the topics that we cover in this lesson would be parsing and validating, URL encoding, strings, dates, regular expression objects, JavaScript arrays and collections, and of course, finish the lesson with objects.

Let's start with, in this case, parsing and validating data. So the JavaScript API basically contains a set of functions and objects that, of course, we can use to perform a number of different tasks, like converting text to numbers because, after all, we're always inputting data in the form of strings, text. And then we need to have a mechanism by which we convert that text or those strings into numbers.

Check types-- like such not a number, NaN stands for Not a Number, and infinity. Infinity means dividing by 0. Obviously we cannot divide by zero. Manipulating text data, validating input, and that's kind of important to make sure that whatever data we're parsing, it needs to be validated, and then creating collections of data. So accessing the browser window's parent document and so on will also be touched here in this lesson.

So let's go out and just discuss, in this case, just the scenario. And the idea here is because-- the whole idea is to use an example to be able to, in this case, teach you the concepts in the JavaScript API that we're trying to, in this case, cover. And of course, we know that a JavaScript allows you to convert numbers to strings and parse strings to numbers. We know about that.

So here, the scenario is we want to know how many years the user has left until he or she become a 100, or 100 years old. So here we have a div, in this case, code, a div type code, where we have a label that says years until you are 100 years old. And then we got an input. This is, of course, all HTML5 input that has a type text, and then the ID is represented by the age input, and then of course an input type which represents a button. And that button has a value called calculate. And of course the idea here is called age button. And then of course, we have the ID age output. That will, of course, here output the calculation that we have.

The calculation comes from the JavaScript function that we are going to look at. So this example basically is here. And let's go ahead and take a look at it. Well, in this case, we do have an index.html where we see basically the div that we are talking about, of course, that you see here. And then as you see here, we're dealing with an ID age input and the ID age button and then, of course, an ID age output. And somehow we need to somehow look at some JavaScript code that allow us to work with those.

Let's go ahead and continue with the lesson. So we know from previous lessons that we can add events to DOM. We know about that. And we know that basically we can add listeners to the page using JavaScript. And we saw the example where we can add a listener to the window object, and we can see it here, window add event listener. And then this is on load, which means when the page is rendered, in this case, or finished rendering, you can have access to all the DOM elements in this case. And here we have in the second example, we have a get element by ID age button. And then while on that button, we add the listener, which means when I click, there will be a function, in this case, that would be executed.

That would be a JavaScript function. And we also have seen before where we can add a listener. This is a load you has a function that pretty much, in this case, will execute when the page is loaded. And we can also, here, look at the code where we combine both together here, where we add the listener when we click.

Again. In this case, there would be a JavaScript function that would be executed. And then as you see here, we do have how we close the button-- event handler-- and then how we close the event-- the window event handler. So the idea is we want to look at an example about this. And if you take a look at it, pretty much here it is.

So first of all, in this case, JavaScript function that we, in this case, use, let's go out and go back to the exercise. So here we said this is the index. So they're pretty much covering all this, in this case, part of the code, which basically will be related to the top, in this case, part of the page of the Preview page that you see here. So go back to the-- in this case, click on the code.js tag, and we see that we have a windows listener load the function. And then here we get element by ID, which is the age button, which is this one here, that you see here. And so we get that button. And then to it, we add an event, a listener that represents the click here. And then, of course, when we click on, in this case, would be the button, which is the calculate, we have a function that says first of all, we get the element by ID age output, which represented here.

That's where basically where we are going to output the result of clicking on the button. That would be the result that is printed over there. And then we have-- we save that into the age output element variable. Then we also get the element by ID age input.

This is the one that allows us to enter the data. This is basically the age input which happens to be a text And it's an import. And so we see it here. And then after that, we'll go ahead. Then what we do is now we take the age text element, and we get the value part of it. And then, of course, after that, when we put it, we save it into the age text value variable. And then after that, which is JavaScript variable. And then after that, we'll go ahead and use the parse function to convert that into a number. And we use, in this case, the radix, which is 10.

So this will give us-- we'll save that into the age. We'll go ahead and declare, in this case, a variable result. And we set it to, in this case, an empty string, as you see. And then of course, now we go out and check.

We check if the age is-- is the age a number? Not a number rather, NaN, Not a Number. If it's not a number, we should do somehow set or assign the string input and number, please, which means if people are not inputting a number and inputting something that's like characters on any type of character, a special character or a letter, then, in that case, of course, an alphabetic letter. That's what I mean by that.

Then we need to have a mechanism by which we can go ahead and tell the user, hey, please enter a number. And that's what we mean by that. And then of course, we go ahead and set, in this case, the value to an empty string.

Else, what we do is we go out and compute the 100 minus the number that you entered that would be the age of the person. And then of course, we say that would be the number of years to turn, in this case, you turn 100. And then we print that out to the console. And then, as you see here, we also print that out inside the [INAUDIBLE] value.

We've taken the age output element here. And then we use its [INAUDIBLE] HTML to print it out inside the page. So let's go out and just try one. And in this case-- so going back to the index.html, I'm going to go out and say here, let's assume it's 32. The age is 32.

And I'll go ahead and click on Calculate. If I click on Calculate, it is going to basically, in this case, call this function that, in our case here, will go ahead and do all these computations and print, in this case, the difference of the age right inside the page, which is right below here, which is the output, the age output or, in this case, represented by the age output element. And then, of course, it will also be printed to the console because we decided to also output it to the console.

So let's go ahead and do that. And that's exactly what happened. So it says 100 minus 32, 68-- 68 before he turn 100. And then we see it. So we see it here in the output. And we see it here too, of course. So this is basically the example that we want to show you, in this case, for this particular, in this case-- so this is basically what we want to do.

So we want it to pretty much-- so this is the code that we have seen. And we just showed it to you in a slide. So the idea here is to use the parse in. That takes a string and takes a radix. And radix here is using 10. And of course, you can parse a string in any radix using the radix argument. And here we use the 10 because that's typically how we count, we human beings count.

So continuing with that and now looking at another example, just again dealing with the, in this case, parsing data and validating data. Here we wanted to have another scenario that said you and some friends go for lunch and opt to divide the bill and add 10%, in this case, tip. So this again, in this case, we're using the parsefloat.

We're going to do a parsefloat function. We're going to use the parsefloat function, or JavaScript function. So we have a div here which is a tip calculator. We do have an input that represents the tip total, bill, in this case. And then we have another input which represents, in this case, the tip number of people. And then we have a button that says Calculate, which has an ID, by the way.

So it says here ID tip total bill, tip number of people, and tip button. And then we have a tip output. That would be the output that represents, in this case, how much everybody will pay. That's the idea behind this. And here the purpose is to use the parse in string to convert that into float. Because, after all, when we deal with money, it's always some number of dollars and some number of cents so that's why you get 23.24. This would be $23.24, as an example.

So let's go out and take a look at how we actually do that. Pretty much, in this case, here's, more or less, the code that we are going to write in JavaScript. And instead of looking at it on the slide, it would be nice to look at it as a demo, in this case, on your lab machine.

Let's go ahead and do that. So here we're looking at the second part of the Preview page, which is the tip calculator here, which, by the way, in the index.html will focus on this part here, where we do have an input text representing the tip total bill. We do have an input text representing the number of people that are having lunch and then, of course, together, or eating together, and then the button representing the calculate. And they all have IDs in this case.

Let's go back to now our JavaScript code and see how we write all of this. This will lead us to this set of code, where, in this case, we do that. We add the listener on the load, same thing basically to load that when the page is rendered and load it on the browser. And then of course, here we do have, in this case, a get element by ID Tip button. And to it, we add, in this case, a listener click and then the function, where we get the tip output to get element by ID so that we're basically getting this one here, the tip, in this case, output. And then we do the same thing in this case and go back and save that into the tip output element. And then we do the same thing, get the tip total bill, and that will be, of course, in this case, getting this one here and then going back and doing the same thing for the next one, the tip total bill.

We save all of in these variables. And then after that, we go ahead and parse that total, tip total bill, a value into a float and save it into the bill total variable. And then we do the same thing by parsing that into a float and getting the number of people. And then here. we'll just go ahead and first get the-- once we get the total bill, we need to add to it 10% for tip.

So that's what we have here. And then after that, we'll go ahead and divide that total bill with tip divided by the number of people. And here you have to pay attention. So first of all, we check is the divide-- rather, divide the total bill, is it not a number?

If it's not a number, then we go ahead and, in this case, set the tip output element to please enter numbers just to make sure that you're entering numbers. And of course, we also check if it's finite. Then we'll go ahead and say, each will pay, and then print it out.

But if it's now dividing by zero, then, of course, we say you can't divide by zero. That's the idea behind this. So let's go ahead now and enter a total bill. Let's assume that the total bill is $124.55.

So when we click on the Calculate, of course, it's going to basically execute this JavaScript function, which basically enters the $124. And let's assume there are four people who had lunch together, or dinner, whatever. So in this case, so the computation, $124.55, we'll add the 10% to it. And then we divide that by the number of people. And then of course, we'll go ahead output that, in this case, to the page. And we save that into the tip output element, which is, by the way, represented by the tip output ID that we see here that basically outputs the information down here.

Let's go ahead and do that. And that's exactly what we get. So now we have the [INAUDIBLE] each will pay, in this case, $34.25. Obviously here, it would be nice to actually cut these decimal point digits because in general, when it comes to dollars and cents, it's always two digits after the decimal point. It's always one cent or zero cents all the way to 99 cents. After that it will be $1.

So we do have a way to actually cut this. And we see that in the next few slices of the lesson. So of course, imagine that now we wanted to just divide by zero. And let's see what happened. So you see, you can't divide by zero.

Or imagine that we put some kind of a letter here. And then it says, please import numbers and so forth. So we have a mechanism by which we can control and validate all that input data. And that's all written, as you see here, in JavaScript, in this case, API.

So let's continue with our lesson. And of course, now let's go ahead and discuss about the function called toLocalString. We use the toLocalString to convert numbers to strings with added localization information.

Localization information is what we call internationalization to represent, for example, dealing with currency. It would be representing, in this case, the currency in dollars or euros or whatever type of currency you're using and which country you are in. So usually the toLocalString takes local.

Local basically represents in this case, for example, in our case here, US, English US-- that's what we see here-- and then the option and then the style here, which is currency, which is the currency is the US dollar. And then of course, in this case, the option what we say is the maximum fraction digit is two. Remember how I said it is a good idea not to represent-- and this was in the example that I showed you in the demo. And I said it would be nice to represent the number of cents to be only two digits after the decimal point on the right side. And that's what we have.

So the options is JavaScript object that provide specific parameters that are used to display the number here. We decided that the maximum fraction digits will be only two. That's the idea behind this.

So all of this is so that if we take a look at your activity guide book, you will see we put an example over there. Instead of having 15.2532, we'll just have $15.25. That's what it means.

We can also use, by the way, in this case, the number format. To reuse the formatting setting, you can use the, in this case, Intel, for international, number format object. And this pretty much also can create, in this case-- this is all part of the API for localizing strings, which is, in this case, inside the int number format or int number format object.

You can go ahead and create the format object and use them with the numeric values in your application. So here, for example, we go ahead and create a new instance of that object, represented by number format, and pass to it the en-US, which is English US. And then the style is currency.

The currency's representing the US dollar. And then the maximum fraction digit will be two. And we can go ahead and do that. So this basically, also, another mechanism by which you can go ahead and also use the number format to represent your data locally to wherever localization you are using. Here we just saw the example of the US dollar. But nothing prevents you from doing that in Europe for using euros and the UK using the pound and so forth, the British pound, and so forth.

So in addition to the number format, we can have also a date, a time format, and so forth. That's basically what we mean by that. And so the idea here is that we can go ahead and control, in this case, the number of fraction digits after the decimal point.

HTML5 numbers input and JavaScript are quite used and always and typically we tell you whenever we work with numbers input or number input in JavaScript, it would be a nice idea to safely ensure and make sure that you always parse the values by using JavaScript. For example, you can use input type number and then the ID number input. But in general, we ask you to do it the second way, where we always parse values, even if you use the HTML5 number input, like we've seen here in the first one. And, of course, the HTML input elements store their values as string.

So we'll go ahead, in this case, get the element by ID number input. And then over there, we'll just go ahead and look at the values of the element and then parse it into an integer and save it into a variable. This is a lot safer. So that's basically what we advise you to do. And we can see an example about that. And that, we just have seen here. And we actually have seen a couple.

One is using, in this case, the years until somebody becomes, in this case, know whatever, 100. And then the second one is basically having a total bill and then the number of people and then trying to calculate, in this case, how much with the tip-- how much everybody will pay. And as you see here, 30.195, most probably this will be converted into 30.19 if you are using, in this case, the localization API that we've seen.

So-- and this is the one that we want you to, of course-- I spend more than two minutes explaining that because it was worth it. You can do the same thing and try it, in this case, more than a two minutes just to try it.

So now looking at the URL encoding, well, in general, here's an example where you construct a URI by using JavaScript, but it contains special characters. Here, for example, you're trying to, in this case, use this URI here. And you parse order. And then it says by space name.

So the space here is a special character. So it's like spaces or symbols. You need to somehow decode URI with the spaces and symbols to get the parameters that the URI has in general. When you have a special character like that, the process is to go ahead and escape all the special characters by using the encoding, and we see it here.

So here we just use the encode URI, parse the URI to it. This will get it and encode the URI. And then you go ahead and print it out. So when you print it out, you would see that the space now is encoded as a percentage 20. And then the decode basically would be taken encoded URI and then you pass it. And it will get decoded. If you print it out, now it becomes a space, which means when the URI is moving or communicating or moving from one side to another side, the example here shows you you replace the percentage 20.

The space is encoded in percentage 20. And with, again, in this case, this [INAUDIBLE] code, the four space and then how you use the decode URI, in this case, to decode it back to the space. That's basically what it means. And we can see an example about that, the same example. And as you see here, pretty much this is when we can clear, in this case, the console. And then you see I encoded this URI. And then using the encode URI and then print it. And then, of course, you should print this.

This is just commented. And then when you do a decode, it should print this. And let's go ahead and do that. And that's exactly what happened. If you take a look at the output here, pretty much exactly what happened. And that's what we mean by that. And let's go ahead now and take a look at--

Let's go ahead now and continue. And so this is basically the example that you guys are going to see. I just showed you. And let's now deal with strings.

So strings are interesting because we human beings have a tendency to, in this case, work with a string because we read text. And text is nothing but string. So here we show you how we create a string. We can use the literal, in this case, a creation. We'll use a little string and assign it to an array.

Or we can use the new keyword, new, and then string, and then you go ahead the string object and create a string object. And to create strings you can use literal or within a value with a simple or double code. So it's up to you here. It can have the double or the single code.

We also here tell you about how you can also use, what we call in this case, escape sequence, so if you want to escape a single code or a double code or a backslash, and so on. In fact, on your book, we show you a list of how you escape a single code, a double code, the backlash, a new line, a carriage return, a tab, a backspace, a form feed. You can go ahead and take a look at all of that. It's in your student guide. And of course, you can also use strings to represent international characters.

Here, an example where we show you a few different examples, in this case, where we do have different languages, from Chinese to maybe Indonesian to maybe Spanish to maybe a Russian to maybe-- and so forth. And here we use the Unicode to represent all these characters because the Unicode allows us to represent all these characters in the way they, of course, they would look like.

Continuing on with our lesson, let's look at string manipulation. Of course, here, pretty much we want to see some methods that allow us to manipulate strings. So one of the most common operations that you perform [INAUDIBLE] the string is to be pretty much looking at a concatenation.

We know that we can concatenate the two strings with the plus, in this case, a character or a splash operator. We can also use the chartAt function. And the charAt, what it does is it returns the character in the given index. You can use an indexOf. The indexOf returns the index of the first occurrence of the matched string or minus one, if the string is not found.

You can use replace. And replace, what it does is replaces all the occurrences of a string with another, in this case, if found. And we see an example here. And we see all different examples. In this case, we're replacing, for example, here "world" with "John." And then of course-- so that we can have the output hello John. And then with split, split returns an array with strings that result from splitting the original string by using the provided separator. In this case, we are using the space as split separator.

You can also see some other, in this case, functions, like substring. And the substring returns the string from the start at a given index. Here, for example, we wanted to get the substring that starts from 3.

So we missed the 0, 1, 2, 3. That's why we have, in this case-- that's from O and then onward. The toLowerCase basically returns a string with the letters in lowercase. The toUpperCase returns the string with letters in uppercase. The trim-- what the trim does, it removes the trailing and leading spaces and tabs from the string. And we do want to give you an example about that, where, in this case, we do have a data that is provided to you in comma-separated values. And you must display it in your application.

So here we gave you a string made of John comma Doe comma 32 comma 1982 and so forth. And most probably we want to split this into representing the name and the age and so forth and so forth. So that basically would be-- this is an example. And this is actually presenting an example that we do have here. And we want you to by-- the instruction here is to-- you parse this data and then be able to create an object from it, where you're first one representing the first name, and then the second, the last name, and then the age, and then the credit, and then the rating, and then the last one, which is basically the birth date.

So you need to write this code. Of course, you can go ahead and here's basically a solution for it. And so it's a good idea to actually, in this case, try it first. And then after that, and then try to do it by yourself and then compare that to the solution. And this is pretty much what we have done, so split data zero and split data one, and then split data two, split data-- and so forth.

So we're trying to-- and then, of course, after that create a new date. And then if you run this, that's exactly what it does. So it's going to go ahead, in this case, as a preview. It's going to go ahead and basically solve the problem. It's a good idea to try it first. And we'll talk about this at some point in time.

So we always talk about your practice that you do later on. But right now we're just going to ask you to try these by yourself. And then after that, we'll cover them. And this is basically the code that you guys need to-- so then we help you with the code. And we work on the slides. So you can go ahead and do it. And again, this is using the split method. You can separate data from a string.

Now let's take a look at dates. Dates also are important to work with. JavaScript provides an API to work with the date object for handling dates also. So JavaScript let's you create date and manipulate that.

So the first one, for example here, we create a new instance of a date. This creates a new date with the current date and time, or a new date with the value, passive value. The value must be a numeric integer value representing the number of milliseconds since January 1, 1970.

Or you can go ahead and use the new date and prase a date string to it. The data string in this case must be a string in the IETF compliant RFC 2822, which is basically the standard format. Or you can use a new date, and new parse to it the year, the month, that day, the hour, the minute, the seconds, and so forth. You can go ahead and do that too.

So you can create a date in this format, where you can have August, for example, of month 9 and the day and the date or maybe the name of the day, 09 August and then 2014 and so GMT or maybe-- so on and so forth. So we have different-- so that's the RFC 2822 or the ISO 8601, that present them with the year of the month and then that day, as you see here. You can work with, in this case, a date object. And create a date object to other objects, to manipulate date, using dates, you have a method to get and set specific fields in the date.

Here's an example. We create the new instance of a date and then by parsing that string. And then, of course, we can go ahead and invoke get a date. This pretty much would go ahead and return, in this case, the 22, which is, in this case, the day of the month. And by the way, if you go to your student guide book, we'll also get the full year, if you want to get the full year, get the hours, get the milliseconds, get the minutes, get the month, get the seconds, get the day, get the time, and so forth. So you can do that, too.

You can go ahead and modify a date. So he is where you set the time stamp here. For example, like [INAUDIBLE] set the date to parse 14. This means that he sets the day of the month to be 14.

We do have also the methods, and they are listed in your student guide in that lesson, in this lesson, lesson 5. Or you can set a date, number 1 through 31 for the day, or set the full year, four digits, or set the hours between 0 and 23, and set the millisecond, set the minutes, set the month, set the second, set the date, set the time, and so forth. You can also try these if you want to look at them. We

Do have, by the way, also, date operations. And here's an example where we create a new date when we get the start date and then do whatever we need to do. And then at some point in time, we go ahead and also create another date at the end. And then we can go ahead and calculate the elapsed time between the two dates, the starting and the end as an example.

Or you can go ahead and say-- it is pretty much the same as the last one that we have here, where we look at the end date getTime minus the start date getTime. And this would give you the elapsed, also, time. And we can see on an example about that.

This would be the date example. And here we do have an example where we wanted to see hours until your next birthday, as an example. So we do have an index.html. And this is pretty much an HTML5.

So here we have a label. That's the title, hours until your next birthday. And then after that, we do have an input that basically input the months 1 through 12. By the way, in JavaScript we, input one [INAUDIBLE] month. And that's basically how we humans know January's 1 and then December is 12. And then we go ahead and input the number of days.

So this is the ID month and ID date. And then here we have a calculate, a button with the ID age button, and then here the age output, which will be represented down here. And so what's going to happen is we are going to run some JavaScript code, where we add event listeners at the window level using the load, in this case, which allows us to, in this case, load the page on the browser, rendered and loaded. And then on the button, we go ahead and getElement by ID, the button from the age button, and then add the listener to it when we click.

In this case, it would be clicking the button. We get the age output, getElement by ID output month and day. And then we save them into these variables. Then we get an instance of the next birthday, the new date, which is the current date.

We go ahead and convert, in this case, the next birthday that you see here, the date element in this case, which is this one here, the day, and convert that into, in this case-- rather, in this case-- into an integer, and then use the setDate to set the date. In this case, it would be the day. Then we do the same thing.

But this one, as you see here, when we parse the month element, we subtract minus one, you see. And the reason why is because JavaScript treats always the month 0 through 11. But we human beings, we always enter 1 through 12. So we need to subtract 1 to represent the month, in this case.

So if, for example, we enter 2, it really means February, which is 1 in JavaScript because it starts from 0. And we said the hours, the minutes, and so forth. And then after that, we'll go ahead and check if the getTime is less than the date now, which is the-- it is on the next year, then go ahead and set the full year, in this case, plus 1, which is going to be the next f year. And if not, in this case, we go ahead and get, in this case, the time in milliseconds minus, again, computing all of these, the getTime of my next birthday from the current date right now. And so if it's, for example, less, that means-- let's assume that I say right now we are in April.

So let's assume that I set, in this case, the date of birthday would be in March or February or January. Then, in that case, we need to add one, which means the next birthday would be plus one year. That's what it means. And then, of course, what we do here? We take that millisecond, divide it by the 1,000 times 60 times 60 will get the hours. And then if you divide it by 24, we get the number of days. And then we go ahead, in this case, and set me a number of hours and days left for your birthday and then go ahead and print that to the output. That's what we do.

So here let's assume that the month of my birthday will be [INAUDIBLE] September, in this case. And then the number of days-- let's assume it's the 12th. And then if I calculate, it tells me there are 3,520 hours, which is 147 days left for the birthday.

Now, let's assume that I'll put my birthday, which is February, and the day, for example, 14. So this will add one more year. And that's why it goes to-- that's the plus here that we're talking about. Because right now currently we are in a month April. So I had to add one year so that we can go to the next. That's why it's-- the next one would be 302 days, which is 7,240 hours. And that's the example that we wanted to show you. And so this would be the example that we want to show you.

You can go ahead and take a look at it, of course. I took more than two minutes just to explain. And this is the sample code that I just went through just to explain to you the concept. And by the way, you also get to do the exercise that I went through, which is the split. That's the solution of a JavaScript string manipulation that I showed you earlier.

Now let's go ahead now and get into the regular expressions. Regular expressions are interesting. And in JavaScript, they allow you to match strings and perform parsing or replacing and search operations and so forth. And regular expressions are common in other languages still. We can use them in many, many different languages. In fact, regular expressions are used in JSP, JSF Component, Java, and so forth.

Here we are going to try them in, of course, a JavaScript. Regular expression in JavaScript uses the standard notation for regular expressions. So here we have a-- they're independent, totally independent of the JavaScript. So here's how it we could represent it with a new keyword and get your regular expression, which are whatever patterns you want with the flags that you want.

Or you can just go ahead-- alternatively, you can go ahead and use a regular expression literal. And that's what we're going to do. We're going to use the a regular expression literal. That's what we're going to use just to explain that.

So here is an example where, in this case, we show you, in this case, a regular expression that says, it is the pattern is represented, in this case, as you see, between forward slash and forward slash. And the pattern should be Oracle. But then we also add a flag in this case.

The flag i, in this case, what it represents, it represents, in this case, ignore case. That's what it means, which means when we look at the strings and I'm trying to, in this case, search for Oracle, I find it. And then it doesn't matter if we have it in capital cases or lowercase cases.

So you do have these flags, for example, where G represents a Global a match; I, Ignore case; M, Multi-line; and Y, [INAUDIBLE], in this case, sticky and so forth-- sticky, which is used to match only, in his case, from the index that is indicated by the last index property of a regular expression. Here's another example. In this example here, we have a regular expression that says, the pattern is all lowercase letters. That's what it means.

So we have A dash Z. And so when you have A dash Z and then an asterisk next to it, what we're doing is we're adding what we call a quantifier to specify, in this case, how many times a character A class is to be, in this case, matched. So in our case here, when we have A dash z and then between two square brackets and, of course, after that the asterisk, what it means is that it matches zero or multiple lowercase letters. That's what it means.

So if you take a look at this, you will see that we'll basically go ahead and get all the lowercase characters. Any capital letter character will not be, in this case-- will not be the match. That's what it means. And by the way, A dash Z, instead of having the asterisk that you see here, maybe you want to have the plus.

The plus means it matches one or multiple lowercase letters. And that's what it means. And here's another example. And then also you can have maybe a lowercase a, capital A, or lowercase a to z or a capital A through capital Z. And then we then with asterisk, what it means is that it matches all the words that start with at least one capital letter A or lowercase a.

Here's an example where, in this case, we are using the regular expression that says O plus, and between parenthesis, r i. What it means is that the pattern is one or more O's a followed by an R. And some match would be one or more O's at the beginning of the pattern. And of course, the I, Ignore cases-- that's what it means.

So here we can see that whenever we have an O followed by an R, we go ahead and find that. So we take a look at that. And I, by the way, stands for Ignore cases, which means you can use lowercase or a capital case. Good.

So this is just to show you some examples of regular expressions. And here we're using a literal, or rather regular expression literal. We also do have regular expression methods that we can use. Exec, what it does, it executes a search in the string for the pattern, returns an object with information about the search, and updates the regular expression object.

Test, which returns a Boolean in this case, returns a true if the string contains one or more matches of the search pattern. We also have, in this case, a string, rather replace. Replace, in this case, a method that allows you-- or rather we're using the regular expression object that can be used again, in this case, in the string method, so a string replace, which in this case, replaces all the matched instances of the pattern with the new string, in this case, and the regular expression in the string.

We also have a function match, which returns an array of strings with all the matched patterns. And let's take a look at an example. Here's an example where we have a scenario. We want to validate an email.

So you take a look here. We do have the match email name followed by an at followed by a host name and then followed by that, two to four characters, like a com or co and so forth. So we do have an example about that. And let's go ahead and take a look at it. And here it is.

So here we have an index.html that basically has, in this case, an ID text, a IDE [INAUDIBLE], and then the button that if you click on Validate, it calls a function called validate email. This validate email that you see here get the element by ID and the output, in this case. And then we use, in this case-- we take that email string and, in this case, save in it the email element, in this case, the value of the email element. And then we'll have a regular expression on here which we test that, in this case, is following that regular expression. And then, of course, we get this.

So let's go ahead and try one. And let's assume we just put some letters, just like that, and click Validate. And see, it says invalid email. Or I can go ahead and put smith@example.com And then we click Validate. And see, it says a valid email, as example. And that's the example that I just went through. So go ahead and try it.

Now let's take a look a little bit-- now let's take a look at string arrays, other JavaScript arrays, and collections. So let's go ahead and take a look at JavaScript arrays and collections. So here, JavaScript arrays as collections-- so here, JavaScript arrays as collections allows us to modify arrays and treat them as collections.

You can use several methods. Pop removes and returns the last element of the array. Push adds the value at the end of the array. Shift removes and returns the first element of the array. Unshift adds the value at the start of the array. Splice removes and replaces items. Index of gets the index of value. Joins-- join, rather, joins all the items into the array into a string. So these are the methods that are worth, in this case, looking into. And we show you examples.

So here we see a pop. We have an array made of strings, triangle, circle, square. And if we do a pop, that will take the square, and we're left only with triangles, circles. Push pushes, in this case, the April, May, June at the end of the array, as you see here.

Shift, in this case, takes the first element of the array, as you see here. Unshift adds whatever, in this case, like fifth element at the beginning of the array. That's what we see over there. A splice is used to add and remove elements at a certain index. Here's how it's written, in this case. And of course, here we have the syntax index and remove count, the element 1, element 2, and so forth, as you see.

So pretty much this allows us to, in this case, add elements at a particular index and replace an element, and removes all elements after an index and so on. So you can go ahead and use it any way you see fit. Join also it's very interesting. And join, what it does, it creates a string representation of the array content. And here's an example, where, in this case, I take that array, invoke the join on it. And I want to convert all of-- take those elements and convert them into a string separated by "a" comma space.

So you see 1, 2, 3, 4 end up with this string here that you see. Or maybe I take this array here and use the join and separate these by a dash, as an example. And this would be also another string.

The index of is another example, where, in this case, we have an array item, pencil, scissor, eraser, and tape. And then we want to find the index of eraser. If you take a look here, you would see that the index in this case would be a two because it starts-- the array always starts with index zero. This is zero. This is one, and this is two. That's why it returns two. And for example, if we use, in this case, an element that doesn't exist, the index is-- what it returns is minus 1, which means it's not there. And we can see a scenario about that.

Here's the scenario. Well, in this case, the user selects elements from a list. And you want to, in this case, display the elements that the user selected. Here we just show you a snapshot of the JavaScript.

But let's see this as a table inside your lab machine. Let's go ahead and take a look at some examples about that. First of all, we discussed the arrays. And let's take a look at the example here of the arrays.

Here we show you examples where we can use the different methods, or functions, that we've seen in JavaScript, functions from the push to the, in this case, pop, to the splice, to the, in this case, the next one, which is the shift, unshift, and so forth. And you would see, like if you follow the examples here, pretty much follow step by step and see what happened in this case and as a result of what we discussed. And we apply them here. So we can see that basically what we have explained makes sense.

The other example that, also, I want to share with you-- and this would be related to the JavaScript erase. And this is related to-- this is related to this code where we read and parse HTML list with JavaScript arrays. Let's go ahead and take a look at that.

So here we have an index.html, where, in this case, in the body, we do have a dev. Inside, we do have an [? H4, ?] which represents, in this case, the title that you see here, select elements, use control to select multiple. And then here we have a select ID, which is a list element, and the size is five. So we have, in this case-- and then the multiple is set to multiple. And then here we have options, JavaScript or HTML, CSS, and so forth. And then, of course, here we have, in this case, a button, this button that print out the output that we see underneath.

Now, we'll go to the JavaScript code and see how we do that. So we add the listener to the window, as always, to load the page. And then we get the button. And then we add the listener to it you. We click, in this case, on the button, we get the output element by ID. We set it to the output element.

We get the list, in this case. So the list is here by selecting one or more through the Control key. And that would be down here. And then, of course, we create, in this case, an empty type of, in this case, a variable, set it to open a square bracket, close square bracket, an array. And then we go ahead and add to it.

That's an empty array. We add to it, in this case, the list of the elements, how many. Then we'll go ahead. If they're selected, they're added they're pushed inside-- get their values and push them inside the array. And then after that, we'll take that, in this case, output that into the inner HTML of the output element by, in this case, looking at that array and do a join, and join them through a semi-colon space.

Let's go ahead and do that. I'm going to select HTML, and CSS, SE, and EE. If I click Calculate, that's exactly what happened. I'm going to end up with a string made of HTML comma space, a CSS comma space, Java SE comma space, EE. And that's exactly what we wanted to show you here in this particular example. And this is exactly what we want you to, in this case, try. And we tell you about it so you can go ahead and--

So first we showed you the JavaScript arrays with the push and pop and then shift, unshift, and so forth-- splice and so forth-- and then the example that I just showed you, in this case. And this would be the solution for that, as an example-- pop and push for the JavaScript arrays that we showed you. And now we finish this lesson by discussing some objects concept.

So we have, in this case, different ways to be create, in this case, JavaScript objects. And this is just a refresher because we already have seen this earlier before. So in general, there, we show you here a couple of different ways to create objects, or in this case, in JavaScript.

You can use the inline direct instance, in this case, singleton, which is, in this case, just an object. And then we have your properties-- first the property and one with some value, and then after that, you have an object method called method with the function whenever it is. In this case, it doesn't. Then, of course, we have another property2 with a value.

Or you can use the new keyword, and then you have your function that sets the value1 for a property1. And then you got your method, in this case, represented by a function. And then of course, you have value2 set, in this case, to the property2, in this case, of your property of your object.

Or you can use a class function declaration, which basically would be a constructor. Here we have a class name. And inside that class name function, we set the value1 to property1. And then we have the method or, in this case, the object method represented by a function. And then we set the value2 to property2.

So using a constructor, every object that is created with a new prototype, in this case, that is accessed by using, in this case, whatever. But in this case, we have a new object that we use in the class name and then by access by the class name dot prototype, what the prototype is. This, again, is shared for all instances.

Here are some static methods, or static object methods, that can be used. And we've seen some of them, by the way, earlier when we were a trying different examples. Here's an object that has a property a 45. And here we'll go ahead and use a object-defined property.

So we have defined property, in this case, which is the static method. Defined property can be used in this case. And like, for example, this, that we see here, which is this defined property, is used to define a new property on an object and can be used to define a get and set if you want to. And here's an example, define property, where we, in this case, takes an object double a represent the get, which basically, in this case, returns the value, a, in this case, times 2, or define another property, which, in this case, called modified a, which are presented by set, where, in this case, if you parse an x, it will go ahead and subtract the x from a.

So the getDefine property is used in our case here to define a new property on an object. And in this case, we saw the example on how it's used to define its get and set method, object method, that you see here. We do have a create.

Create basically, we know that is used to create an object. And so you know we already have seen this before. And then we have also the getOwnProperty descriptor that you see here. And the getOwnProperty descriptor returns a property descriptor for an own property.

In this example, if this method is called, then it would be maybe pass into it, in this case, the object and then double A representing, in this case, the get method. You also have the getOwnPropertyNames. That also can be used. And the getOwnPropertyNames returns an array of strings with the own properties of an object. And you also have the getPropertyOf, which is the last one here. This basically returns the prototype of the specified object.

So the discussion of prototypes-- basically all JavaScript objects have a prototype property. Methods and static values are usually declared in the prototype. And of course, a class function declaration by using a prototype can be used. And we can see an example about this.

So here we have a class name, a function, that basically assigns value1 to property1 of the current object and value2 to property of the current object. And then after that, we'll go ahead and set a prototype method, which is some function. And then we can go ahead and create a new-- use the new keyword on the class name and the create an object. And in general, the name of the prototype is different for every constructor function you have. And of course, using object literals will set the prototype of these objects to a default object prototype.

We do have, by the way, object methods that are inherited from the object prototype. And so these are the methods that are inherited from the object prototype. They are available to all, in this case, the objects that are created. And then, of course, here we see the is property of type-- we've seen this, actually, example before-- and toLocalString and then toString and then valueOf.

So looking at the is property type of, this basically checks whether an object exists within another object's prototype chain. That's what it means. And then we have the toLocalString. This basically returns a string representation of an object but, again, sensitive to the current local, in this case, localization for internationalization in which country and which language you're on and so forth.

The toString returns a string representation of an object. And the value of what it does, it returns a primitive value of the specified object. So here is an example of that toString object. Here's an example of the toString object method.

This, pretty much what it does, it overwrites the toString a method to provide an easy way to represent objects as strings. Here's an example where I do have here a function person that takes a name, and underscore name underscore last name and use the underscore name to initialize the name of the current object and this underscore last name to initialize the last name of the current object. We do create a prototype, in this case, toString function, which basically returns the last name concatenated by comma, space, the last name.

So now if I pass John and Doe to the constructor person, this will go ahead and create a person. Now, if I want to call the toString method on person, it's going to return John comma, space, Doe-- or rather, Doe comma, space John, rather. And that's because of the fact that we did override the toString here. And we actually can see this as an example. And this would be the object method. And we see an example about that here.

So here I do have an object a 45, pretty much the same. And then we define a property, the get double A, which returns a times 2. And then we also define a property with a set that we got, in this case, return a minus x. And then here we go ahead and first print object a, so that's 45. And then we'll go ahead and call the double a on it.

So that will return, in this case, a. And so that's what we have here. And so that's 2 times 45 is 90. That's what we see because it returns a times 2. And then here we go ahead and modify the a. Now it's 40. And then after that, we'll go ahead and pretty much, in this case-- so we do that. And then we log that value.

So that's in line A 14 that we see here. It's five. And then after that, we'll go ahead. Because when we parse the 40, what it's going to do is we have the modify a, which, in this case, subtracts an x that we parse, which is 40, from 45. So 45 minus 40, that's 5. And that's why we have the output here is 5. And then after that, we call that on double A. And 5 times 2 is 10. And that's what we get here. And that's basically the example that we wanted to show you. And so this is the example that I just showed you. And then you can go out and take a look at it.

Of course, here you can learn more with these links. And the summary-- we kind of looked at parse and validate users. We looked at parsing and manipulating dates. We were storing multiple values and objects inside the JavaScript arrays and used them as collections and, of course, add and modify existing object method by using prototypes.

So these exercises are on your activity guide, more practices. And here they are. So here, basically in practice 1, you're going to use NetBeans and create an application that does the [INAUDIBLE] calculator by age. And then the second one, which is optional, changing inputs for birth dates. And you can go ahead and try that too.

So try it. And then, of course, we do have solutions for these, too, by the way, in this case, in your practice. And if you take a look here, on NetBeans, you can go ahead-- under the Windows, in this case, Menu you can select Favorites. And then you can right click and select the last one, Remove From Favorites, not delete-- Remove From Favorites. And then you right click inside, and then Add a Favorite. And then go ahead and add the labs here as favorites. And then this will actually allow you to see the solutions of every one of them.

So here, for example, number 5, it's now 5-1 solutions, and then this is 5-2 solutions. And you can open these, by the way. This is the JavaScript code. And then this is the index.html. And then for the optional, you can also open the JavaScript code and then, of course, the index.html solution, if you want, just kind of compare, if you want to compare what you did versus what they did in the solution. And that's basically what we mean by that.

So you folks are going to try these exercises. You do have some assignment overview. This is just self-study assignments. Go ahead and read it if you want to try it. And that's pretty much what I wanted to say about this lesson. Thank you.

## 2. Practice 5-1: Bill Calculator by Age - 15m

OK. Now that we are done with the lecturing Lesson 5, which is related to the JavaScript API, let's go ahead and take a look at its practices. So in the activity guide, you will find that you will have, in this case, a Practice 5-1, where it's related to the Bill Calculator by Age. If you remember, we have done a similar example when we were lecturing.

So in this practice, you created the JavaScript code that is required to calculate how the bill is divided, based on the age of people. So you will go ahead and create a project. And following, again, the tasks in the activity guide, and select the HTML5, HTML application. I'll name it, and, of course, Lab 501, which basically gets you the indexed HTML.

We gave you, in this case, the index.html code that basically you see here. Here, pretty much, we see the new code, which is highlighted in bold. Let's go ahead and take a look at that in the practice. So this is what we have here, basically. And that's what they want us to add.

So if you take a look here, you will see that we have this new code here, which, by the way, we showed that to you in your book in bold. OK? And we try to just highlight it here. And then, of course, I'll go ahead and highlight it into the lab machine on [INAUDIBLE]. So here I already created the project. And I put down the index.html that you see here.

So as you see here, we have the title, Tip Calculator, the ID personList. We have an LI tag here that basically has an input, which is a name. But input, in this case, the age. OK? Size, in this case, too. And then we do have an age reference here. And we have this give the total bill that we are going to enter, as you see here.

And, of course, as you see here, there's a tip that you go ahead and enter here. And these are just labels. And then, of course, we have the input that makes use of a Calculate button called, in this case, Calculate. I will go ahead and we try it.

Of course, continuing with this practice, later on they want us to, in this case, create a JavaScript file called js, and that's where we are going to enter all the code. OK? So basically, following the activity guide, let me go ahead and guide you how you go by creating that code. So here's the code js where, in the first set of lines, we add the code to add the basic window and event, an element listeners.

And that's what you see here, basically, this code here, where we have a window at listener and we have get element by ID personList, which is, in this case, would be this id here, personList. And then, of course, after that, a get the element by ID at Tip, which basically would be, in this case, this one here that you see. OK? And so basically, just kind of showing you what we are trying here.

And so, and here we have, when clicked, there's a function. And then here, a getElementsByTagName, li. And we can just go ahead and look at that, which is basically, you know, the li that we have here. And to it, we'll go ahead, in this case, and create an element input, that's remove button. And set the attribute type, and in this case, the type is button values remove. And then, of course, we'll add the listener here.

When we click, we have a function, Remove the child element, in this case, by parsing the new element over there, that we have. And of course, we have add remove button to it. So, and this is pretty much kind of, and we also have some comments here that basically guide us, you know, in your book, in your activity guide book, where we add an element with Remove button, that we see here. And then we pause and calculate, in this case, the go to person.

Going back, in this case, and following pretty much what we have, in this case, a done. And then, of course, after that, what I wanted to do is kind of continue with that. So we need to add some code to add the person constructor and the toString function. And if you scroll down you will find it. This is the, in this case, the code for the person constructor function, that you see here. And then we have the toString method, which is this one here. OK? That is a function.

And basically here, what we do is we change for a better string representation of numbers. That's what we have here. So we have a bill, this bill, toString in this, in local here, which is the US, you know, English, and of course, assigned currency, and so forth. That's what we have here. And following, again, what they pretty much told us to do, step by step. This would be just basically following your book, kind of reading your activity guide exercise, and then going step by step.

Here is creating input feed when the user clicks the add person link. And let's go ahead and look at that. So here, we wanted to, in this case, create a value of a new element, which is equal to list element. And so that's, basically, here it is. And then, of course, from there getElementByTagName. So this is, again, locating that. And add that code here to create a new person list element, that we see here. OK?

And we go ahead, in this case, and as you see, it will create it. And we append that new element here, new element to the list elements. Then we add the code to add and remove the button. And we already have seen this earlier, but I just want to go through it again. So here we create a remove button. And then, we set the attribute, in this case, a type button and value remove. And append that remove button that you see here. OK?

Then we enter, again, the code to add the remove behavior. And this is, again, in this case, where we have the Remove button, in this case, this remove button, as you see here, this one here. Add a listener. And we parse the, again, in this case, the parameters, click. And then the function that, basically, in this case, remove a child from the list element and parse the new element. OK? And that's basically how the complete code would look like. Again, following just basically what they asked us to do.

And then, after that, they want us to parse the person fields, again, right following pretty much what we have, what they asked us to do here in the activity guide. Here, we're going to parse person fields, thus, again, following step by step what they asked us to do here. And you take a look and you will see pretty much, in this case, they want us to, first of all, to parse the form and calculate the bill total and add again. So we need to add the code to handle that.

So first of all, we create a new total age variable and we set it to 0. Here it is. And then after that, we iterate the element inside the HTML5 lists again, with this for loop here that you see. And inside the for loop, we'll go ahead, in this case, and create, in this case, input elements, which is this one here, and which is a [INAUDIBLE] element i.getElementByTag.

We'll parse the input tag over there. We'll create a new person object by, again, in this case, creating this line here, line 21. And then we iterate the input elements by using, again, the for loop that we see here. And then, of course, we check the name of the current input element. If the name is name, then set the person.name to the value of the input element.

If the name is age, set the person.age to be the parsed value of the input element and add the age to the total, in this case, age variable. And this code is all here, OK, that you see here, pretty much. And then after that, we push the person, in this case, in the result array, which [INAUDIBLE] result array here, which is this one here. We push that to it. And pretty much, this is how the code looks like.

Then after that, we get, following in your activity guide, we calculate the total value to pay the bill. OK? So in that case, of course, we'll go ahead and put a bill value. So we'll parse the element with the bill total. And this contains, again, the total of the bill. So here we have the bill value. And we set it to parse float and getElementByIDTotalBill, you know, get its value. And then we parse the element with the tip percent, which is, you know, written here in line 34.

Pretty much the same thing, parse in and document getElementByIDTipPercent and then a value. And then after that, we calculate a total bill. And that's basically the total bill here plus the, in this case, the tip percent that we wanted to add. And then, of course, after that, we'll go ahead and divide that by the total age. That's what we have here. And then after that, we iterate the result array. And for each person object, the result array, set the bill property to be equal to the [INAUDIBLE] bill times the result i.age property.

And that's basically what we have here, OK, and as you see here. And then after that, again, you know, all of this, basically, the code that they want us to do. And then after that, a change toString method of the person, a prototype to display the bill value in currency format. And that's basically what we have done here in the toString. And we've seen that earlier. Of course, save, in this case, and we'll quit it. OK. So this is the remove person.

So now, if I run around this, I go ahead and run the index.html, and this is basically what it gives me. OK? So I can go ahead and enter a person name. And let's go ahead and enter Joe, age, for example, 32. Add more, you know, let's go ahead and now Tom, and age is maybe 42. And then we can go ahead and add one more, and that would be, in this case, maybe a John, and age is maybe 35, as an example. OK? So these are.

So here we can put the total bill. And let's assume the total bill is, for three people, is $97.88. And let's assume that you want to give a tip of 15%, as an example. And if we click Calculate, so if we take a look here, there is the index.html, and we can click the Calculate, in this case. And that goes back to the JavaScript, which will go ahead, in this case, and does the competition following this JavaScript code that we already wrote. Let's go ahead and do that.

And as you see here, we get now this, you know, how much Joe can pay and Tom, and then how much John will pay. It looks like Joe will pay $33.4. So we do have some number of decimal points. We can go ahead and use the local functions like we've seen, you know, earlier in the-- or we've seen in one of the lessons-- and we'll go ahead and basically use the number of digits after the decimal point, which is typically two. It's always dollars and cents.

And then we found out that Tom-- so whoever is older pays more money-- that's $43.37. And then, of course, John here, because John is 35, and that's the, John pays here $36.14, as an example. So this is basically what they want us to do in Practice 5-1. Thank you.

## 3. Practice& Solution 5-2: Changing Inputs for Birth Dates - 9m

Let's go ahead now and take a look at practice 5-2. Here, we're going to change inputs for birthdays. So in this case, we're going to modify the HTML form that we used in 5-1, replacing the age inputs with multiple inputs to handle and parse dates. And of course, based on these dates, we calculate the age of the person to divide the [INAUDIBLE].

So they want us to open the index.html, replace, in this case, the age input with three inputs, day, month, and year, and open the JavaScript code, and also change a little bit, in this case, the Person function and add the birthdate property we have a value of Date.now that gets you the current date. Option of set milliseconds, second, minutes, and hours to zero. And then modify toString Person.prototype function to output the birthdate property. And then, of course, in the click event of the calculate a button, add the now available with the value new dates after the total variable, because we need to replace the parsing of the age input element with three conditions for the inputs, and that would be set the day by using the person.birthdate.setDate, and set the month by using the person.birthdate.setMonth, then set the year by using person.birthdate.setFullYear.

And, of course, in this case, set the age, person.age, to now.getFullYear minus the person.birthdate.getFullYear. Again, optional, we can validate that a birthdate which is not greater than the current value in order to prevent negative values. And of course, optional validate the birthdate that has passed in the current year to calculate the--

So this pretty much allow us to write such code. So they gave us actually the code for the Person function, for the toString function, and for the passing the inputs, and, of course, for the validating-- calculating and validating the age. Let's go ahead and look at that in the practice machine. It turn out that here-- let's go ahead and basically look at, in this case-- we put it in here. That's for the solution. You know, I went ahead and put it in a challenge one, which is part of 5-2. So even though, by the way, 5-2 is optional, you're encouraged to try it.

So here, as you see, we have now the name and the day and the month and the year. We can input that, OK? So we do have, in this case, the day, you know, size two, and the value in this case. A one and then month. And then, of course, the year here is size two, and then, of course, the value is 1900.

And then, of course, in this case, the total bill and all that is kind of similar. That's why we add that to the HTML file to make it interesting. And then, we also modified the code JS. And I called it, in this case, challenge1.js. Pretty much we have the same type of code, and then here we have getElementByID.

And what we've done here is we now get a new date. And then here, for the personElement in this case, length-- we'll go ahead and get the element by a tag name. This for the-- pass the input to it, create a new person, and then we use the for loop. And then we get the name in this case, and we specify the day, the month, and the year. We go ahead and process that by calling the setDate, setMonth, and setFullYear.

And then, of course, here, we have the getTime is greater than the now.getTime for the birthdate. Then we go ahead and say invalid one, so we're doing a little bit of a validation here, OK? And so, that's nice. And then, of course, here, we'll go ahead and compute the age, OK.

And, of course, here, we have also parsing the total bill, percentage of that. And this is where now we have the person and the toString also. So in the person, we have set birthdays or get the new birthday, new Date, and then setMilliseconds. We set it to zero. Remember, when we set hours and minutes, set all to zero, OK? So that's basically what we have here.

Following the code again that they added-- that they asked us to add, so it's all in here. Just pretty much following what they asked us to do here. You know, adding all the code that we see is the toString. And this is the input. Remember, we now input the day, the month, and-- so we-- I showed you all of this in this text editor that we see here inside the NetBeans.

And now, if I run it-- I'll go ahead and run the challenge1.html. If I run this file, that's what I get. This time I get the name. I get to input the name. And also, I get to input the day. Let's assume that the date is a 12, and the month is a 11, and the year is a-- whatever. You know, a 1998, as an example.

We can add another one. And let's call this second one Tom. And let's put the day a six. And then, in this case, that would be six. OK, 06 [INAUDIBLE]. The month, let's give it a 10. And then the date of birth here, let's put it '97, as an example, or '96.

We add another one. And let's call this a Linda. And let's go ahead and put the date of birth. Let's put 21 day. And then the month, let's go ahead and put July. And then the date of birth, let's put '99 as an example.

And then we put the total bill. Let's assume that it's 100 and 45 cents. And let's give a good tip, 20%. And we'll go ahead and calculate this. And that, of course, shows us here how Joe happened to be 19, OK? Pays $39.49. Tom is older and 21, so he pays, you know, $43.64. And Linda, who's the youngest here-- she's 18, and she pays, in this case, $37.40 as an example, OK?

So this is pretty much a-- you know, kind of showing us the-- how we can go ahead and write the code now and put down a mechanism by which we can enter the date-- the name, date, and month for the-- and then, of course, we change the JavaScript code to compute all of that, OK? This is basically how we compute the age in this case.

And now-- and of course, in this case-- and of course, following here the-- all the code that pretty much-- you know, and you see how we enter the person once it's all computed. And then the code, again, to compute the-- get the total bill and the tip, and then compute the partial bill. It's all pretty much the same, OK? The only thing is we changed here the person that allows us to, in this case, get a new date and then set all those to, you know, the milliseconds, hours, minutes, and seconds to zero.

And then we also changed a little bit, in this case, the toString. So I can go ahead and specify here the age and then, of course, the pays and then the bill that we're trying to pay here. And that's pretty much what they want us to do in this practice. Thank you.
