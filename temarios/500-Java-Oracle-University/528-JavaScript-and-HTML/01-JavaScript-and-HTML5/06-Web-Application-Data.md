# 6: Web Application Data

1. Web Application Data - 27m
2. Practice 6-1: Creating a To-Do Application with Local Storage - 9m
3. Practice & Solution 6-2: Adding a Remove Completed Tasks Button & Removing Completed Tasks - 7m

## 1. Web Application Data - 27m

All right. Let's go ahead and get into lesson six, where we're going to discuss web application data. Here, we are going to look at converting objects to JSON strings, passing JSON strings into Java objects, again, converting JavaScript objects into JSON, and parsing JSON strings into JavaScript objects, storing objects by using the JSON API cookies and local storage, which is a new part of the HTML 5. OK?

So the topics we'll will discuss in this lesson will be JSON object representation, JSON parsing, JSON generation, JavaScript sandbox, cookies, and local storage. And let's start with JSON. JSON, which basically stands for JavaScript Object Notation, is a simple format to represent objects, arrays, and values as strings. And, of course, JavaScript includes functions to convert objects, arrays, and values to JSON strings and vice versa.

Now, JSON became almost the de facto type of standard to represent messages moving back and forth in interacting with the web server and RESTful web services or in just HTML interaction and other HTTP interaction. And, of course, JSON allows you to represent, in this case, objects as key-pair values and arrays as sequential list of items. And values can also be represented as JSON, allowing you to create all sort of objects by using strings, numbers, and, of course, booleans. OK?

And, of course, JSON is also liked because the JSON objects have a tendency to map directly to the JavaScript objects. And that's also another plus, if you want.

So basically, JSON values are represented, again, in either in numbers, using the Number literal, strings, and booleans. And JSON structures, in this case, are represented in either form of arrays, that you see here, or objects that must be enclosed between curly braces, as you see over there. That's basically-- and there's no way to represent a function in JSON because it is used to represent only data. So that's also another plus.

Now, one thing that we need to remember, folks, is that we always create JavaScript objects. And we always want to create JavaScript objects. And we wanted to convert these JavaScript objects into a JSON. Well, to convert an object or an array from JavaScript to JSON representation, we use a famous method called stringify. Here's an example.

In this case, we do create a Person object. We have a function constructor or constructor function here, Person, that takes a name and an age and uses the name to initialize the name of the current object and age to initialize the age of the current object. It does have a function calculate, which is a prototype.

We go ahead and create a new instance of an object by passing the name and the age that will give you an instance of a person. If you pass that to the stringify, this will go ahead and convert that JavaScript object into, in this case, a JSON object.

And if I now print that JSON object to the console, it will print, in this case, name, which is John, and then the age, which is 32. And that would be, in this case, a JSON object.

We also have a way by which we can parse a JSON object. Here's a JSON object that we have here. And we want to parse it into an object of type, in this case, JavaScript. So we'll go ahead and parse it. Using the parse person.Json object returns an object. If you print that, it would actually print-- the output would be object:object. That's typically what you get, OK?

And when you print that, if you wanted to print the data itself inside the object, what you do is you go ahead and override that toString function. Here it is, where we did override it by saying we'll return the name concatenated by dash, and then the age. So that's why when I now pass, in this case, to the log a method of the console, or the log function of the person.toString, this will go ahead and output "John-32." OK?

So this is basically a way to convert the JSON string into its original object, as you see here. And of course, what we showed you here is that you can go ahead and basically create that object, and then, of course, in this case, work with it.

We do have an example about that. Let's take a look at the code. This would be, in this case, this exercise. This exercise, by the way, they ask you to scan a generator called JSON. So here we tell you, generate the string that generates the commented object for variable JSON object one and JSON array one, JSON object two, and JSON array two. And tip-- remember that object properties have to be quoted.

And then pass the JSON object to a variable and assigned to it the-- assigned it to the object two variable. They asked you to do this previously. And I cannot just put down here we do have a solution for that just to kind of explain to you. But then, of course, you folks are going to try it first.

And so here, we do have, in this case, a JSON object and a JSON array. And then here, we created, in this case, another JSON object two, in this case. And then we create again, in this case, the following array in JSON that you see here. And then here, it allows you to do the parse of that JSON object two and save it into object two, and then after that print it out. And that's exactly what you get here.

So you basically end up having, in this case, the object two that you're logging into this, in this case, console, which, in this case, John, age, and name John, age 32. Level A score we know, in this case, for math is 100, history 75. [INAUDIBLE]

So this will get you to try this exercise. And like I mentioned to you and I just kind of showed you a quick on how it would be written. But then take your time and try it. And then compare your solution.

Now, let's go out and get into the concept of the JavaScript sandbox. It turns out, folks, that for the concept of the JavaScript sandbox, web applications run JavaScript inside the sandbox environment, which provides better security, resource handling, and isolated execution. And then, of course, the sandbox environment has controlled access to resources, preventing applications from breaking the client's machine. That's the idea behind this.

And of course, it comes with its own inconveniences, obviously, in this case. And we tell you that the exchange of that sandbox features, you lose access to features that are found in other languages, unfortunately, and you don't have in JavaScript. So, for example, there is no way to access files or storage in the client machine. So that's the file IO.

Or maybe there is no way to interact with the external devices. You cannot, unfortunately, handle concurrency here for multithreading and so forth. It's not there. You also cannot establish direct connection through a socket to other systems.

You cannot open native windows and external applications in the client's machine. There is no direct access to the database. And, of course, you cannot call remote procedures or interfaces or the, in this case, interfaces of all the servers and machines.

So that's a disadvantage. But remember that even though we say this is kind of a disadvantage that we have here in JavaScript, but we still can save the day by, in this case, looking at some of the features that allows us to do maybe a little bit of file IO, a little bit of threading and concurrency, connection and sockets, and native window or framework.

So although, like we said, JavaScript lacks several of these features, it compensates by sort of coming with these substitutes that we see here. So we can, for the file system IO, use cookies and the local storage, which is new to HTML 5. Threading and concurrency are handled with timeout and intervals. We'll see that at some point in time. We do have a lesson where we cover this.

And connections and sockets, that can be done through web sockets and AJAX technology. And native windows, frames, that can be done through HTML 5 frameworks and popups. So pretty much, we can save the day if you want more or less about how we can take use of these features to allow us to at least have some access.

So the discussion is now about the application data. With the application, it refers to the data that an application can store to preserve user information. So in general, you can go ahead and save that on the server side. And a standalone application is usually stored in flies or wherever.

But in JavaScript, here we can start it either on the server or in cookies on the client side, or local storage on the HTML 5 client side, too. You can go ahead and do that, too. OK?

And let's start with cookies. And cookies have been there for a long time. So it's not something that is new to us. And we know about cookies. So cookies are small files stored on your computer. And they're created as the first solution to store data on the client machine. And their purpose, really, is to save some user identification information on the client machine to resend it to the server through the next request, invoking the next request within the session and so forth.

And so basically, they contain value-pair data. Like, for example, user is John. Have an expiration date that allow the cookie to be deleted automatically. And we see an example of how to do that.

They are isolated to the current application path and secure protocol, either HTTP or HTTPS. And they're limited to about four kilobytes, in this case. And they can have usage restricted to HTTP calls. That's typically what we have.

And the API basically is quite simple. And we can go ahead and look at that, where you can have the cookies are set by using, in this case, the document.cookie and set your cookie string. The cookie string is a string that describes what data to store. In this case, it would be a key-value, and then some expiration date, if you want to put that.

If you want to remove a cookie and use an expire date as an expiration date, for example, you can go ahead and set that to whatever the expiration to be-- 1st of January, 1970. And that will go ahead and, in this case, remove the cookie.

And to read a cookie is very simple. You just go ahead and use the document.cook and, of course, assign that to your variables. This returns all the cookie of the document as key-value pairs separated by a semicolon. OK?

Here's an example, where, in this case, we have a cookie, which is name equals Ed, and then another one username, emr. And then here we go ahead and use the split with semicolon to split that cookie in this case. And we go ahead and declare cookies as, in this case, as an object, an empty object.

And then we use a for loop, and then iterate through the cookie string because we created here a cookie string that split all of these by semicolon. And then we go ahead and set the cookie string with the initial index zero to rawCookie. And then trim that, take the spaces, and split that with a colon.

And then go ahead and do the same thing for the [INAUDIBLE] so forth. So at the end, you can go ahead and do cookies.name. And that returns Ed. And then cookies.username, and that returns a emr, as an example.

OK? In fact, let's go out and take a look at this as an example. And we see it here. So we have the index.html. In the example on the HTML, it has cookies, in this case, as a label. And the ID in this case is a cookie. And then it has an input representing the name and another input representing the text, in this case, the value that you see over there.

And then, of course, we have the input, in this case a button that sets the cookie by calling the set function of the, in this case, JavaScript. And then, of course, a JavaScript function, and then the clear cookie. That clears that.

And let's go ahead and take a look at the JavaScript code. We add the listener, event listener, as always, to load the rendered page. And then in the get element by cookie, that will give me, in this case, this element here. OK?

And then after that, I'll go ahead and get the, in this case, the cookie, and then split that, save it into a cookie string, create an empty, in this case, object, then use the for loop to kind of get these, split those with equal, and then-- pretty much similar to the code that we've seen.

And then we have a set cookie. Get element by ID, which is this one here, which is name. And then that would be the name. And do the same thing for get element byte ID value. And this will get us this one here.

OK. And then after that, we'll go ahead and set the cookie to name, equal, and then the value that we are putting. And then, of course, clear cookie, all that we do is get the element by the name, and then set the name with an expiration date, which is Thursday, January 1, 1970 and zero hour. And that's what's going to happen in this case. 1:00 GMT.

And that's exactly what-- so we'll go ahead and here let's go ahead and set the cookie. So I can say, for example, Joe. And then I put down 10 here and click Set Cookie. And if I run this, I will go ahead and get-- see? Set by equal. That's exactly what we wanted.

I can go ahead and add one here. Todd, and then I put the value, a 16. I'll go ahead and set a cookie. And I'll run it. And you see now I have the second one. And if I want to clear one of them, I can, for example, say Joe. And then go ahead and clear. This will go ahead and run this, which is going to, in this case, remove that cookie.

So I clear. And then if I run it again, now I end up with only one, which is a, in this case, name value, which is Todd 16. OK? So that's the example that we want to show you. OK?

And this is the example that you are trying later on. Now, of course, this is the usage of cookies. And as we said, cookies basically-- when we said they are limited in size, they're up to 4 kilobytes, in this case. On the browser, that might provide more space. But it's 4 kilobytes in this case.

Now what we're going to do is take a look at the local storage. The local storage is a new feature, which is a recent one introduced as part of the HTML 5 initiatives. It's quite good because it's bigger. And it's also a lot smarter. It standardizes the way applications should store data locally on your client machine.

And the key features of this local storage is pretty much, in this case, it has a key string, string value pairs. The size is up to 5 megabyte storage. It's simpler, more focused methods than cookies. And you have the ability to also monitor this storage with events. So that's, of course, an idea.

So you can store information at any time and have a higher disk quota. If you exceed the capacity, you can actually get a quota exceeded error in the next operation. So you get that. So and then, of course, it was created with JavaScript and HTML 5. It has more focused methods and event listeners. And because with cookies, data is stored as key-value pairs, both which, again, must be strings in this case.

So the API basically, looking at it, is pretty much quite useful in this case. And here's an example where we set. We can go ahead and set a value by just using the set item in this case. Go ahead and then you set, and then key value.

You can get a value just by invoking the get item and pass the key this will get with the value. And you can go ahead and add listeners. That's an advantage that you have here by-- you can track changes through the local storage, which is accomplished by using the listener on the storage event in the window object.

Here's an example where we add, in this case, a listener to the window storage. And then get, in this case, for the function. We'll go ahead and look at the on key event, event.key or the event.oldValue, event.newValue, event.url, which is, in this case, the URL that triggered the event, and so forth. OK?

So you can, by the way, use the local storage with JSON, too. So that's the advantage. You can actually save now. You can basically stringify or pass arrays or the same thing with objects. So here, JavaScript objects can be represented by JSON. You can, again, save any string with a key in the local storage. And you can combine to save JavaScript objects in an application.

Here, we have a set. That basically [INAUDIBLE] data. And you can go ahead and stringify an object, in this case, a JavaScript object and save it in the local storage. And you can do a get by passing the data and get, of course, the object. And then, of course, in this case, return it as a JavaScript object by passing the data and get that, and then using the parse method. That converts a JSON object into, in this case, a JSON object, which means you can save this data in the local storage in the form of a JSON object using the stringify.

And you can also use that data. And then, of course, in this case, read it from the local storage and parse it into a JavaScript object and then, of course, work with it.

We do have an example about that. And actually, it's an exercise. You guys are gonna do it. And in this exercise, what they ask you to do is you convert the cookies example using the local storage and get the saved value inside the local storage, key stored object. Pass the stored data using the JSON. And assign it to a storage if it is not empty.

And of course, in the add property function, you can add a property and save it. You can remove property, and pretty much showing you an example of how to do that. This is pretty much what we have here. We have an index.html that basically previews, in this case, what you are trying to add.

So we do have an ID storage. And then we do have an empty object. [INAUDIBLE] We have an input to parse a name and a value. And then, of course, you have a button to add a property and a button to remove a property. OK?

And this is all going to this, in this case-- of course, you guys are going to try it. But here, I'm just explaining to you how it's going to be done. So you get the storage object from the local storage and parse that using JSON. So here, you get the object. And then parse that to get the object, of course.

And then if it's not empty and it's not a stored object, go ahead and put, in this case, an empty stored object. And then get the [INAUDIBLE] storage. And then, of course, stringify that stored object. And of course, here, add a property. Remember we said when we click on the Add Property, calls the add property function.

The add property, what it does, it gets element by ID, num, and value, which are these ones here. And then after that, we set the property in the stored object and save the JSON represented in the local storage. So here we'll go ahead and set the value to the stored object, in this case.

And then call the set item by, in this case, calling the stored object and stringifying it with the key stored object. And then when you click on the Remove Property, we've get to get element by ID. Remove the property in the storage object, and save a JSON representation to the local store, which means here we'll go ahead and delete that.

And then, of course, we'll take the existing one. And then, of course, set that to the local store, the existing one. So let go ahead and try that. Let's see that I put Joe here as an example. And then the value is 10. And we'll go ahead and add a property.

If I run this, I get now one property. I'll go ahead and add another one. Todd, and then I put some value-- 12, for example. And then add a property. If I run it, that's what I get. So now, as you see here, we have this JSON object in the local storage. John, 10, Todd, 12.

I can do the same thing. I can say Paul and the value 14 as an example. And go ahead, add the property. And I run it. And now what I could do is I could go out and say, you know what? Let me go ahead and remove property by putting the key Todd. And then remove property. If I run it, I'm gonna end up with only John and a Joe and Paul as an example.

OK? And this is the example that you folks are going to try in the practice here. So that's the one that I just tried with you.

And these are just some more links to learn a little bit more. In summary, we've pretty much worked with converting objects into JSON, parsing JSON into a JavaScript object, and storing object using, in this case, the JSON API cookies and local storage. Local storage is new. It's part of the HTML 5 initiative, which is really, really good.

And you guys get to do an exercise set of practices here. And they will be on, in this case, a NetBeans. So these are the practices that you're going to try. You're going to create a to-do application with the local storage. So this is a good exercise.

And after that, you have an option where you add and remove completed tasks. So you can also try this. Even though it's optional, we advise you to try it. And here's the solution for that.

And once you've finish with them, we'll, of course, get to go through them later on. I'll go through all these. You will check the solution for this exercise, of course.

And that's pretty much what I wanted to say about this lesson. Thank you.

## 2. Practice 6-1: Creating a To-Do Application with Local Storage - 9m

OK, now that we're done with lesson six, which basically covers the web application data, let's take a look at these practices. We'll start with practice 6-1, where we create a to-do application with local storage. Here, basically, we are going to create a to-do application that saves the list of tasks by using the local storage and JSON.

So they will ask us to-- they asked us here to open NetBeans and create a project, which I already did, OK? And then, of course, in the index.html, we modify the index.html to add this code, which is-- it has a title To-Do List, and then the UL, in this case, element to which is a to-do list, and then another H2 title, Add New Items. And then we have an input, which is the task title, in this case, and then, of course, a button that adds, in this case, the task, OK?

And then, of course, we add the tags script to reference, in the case, or call the code.js. And then we go ahead and open the code.js and add some code to it. So we are going to pull all these tasks one by one, 10, 11, 12, and so forth to be able to write the code-- inside the code, in this case, the code.js.

I already wrote it. And let me go ahead and show you pretty much, in this case, what we have. So we start, in this case, by-- first of all, in task 10. What they asked us to do is, in this case, add a function to create a Task object constructor. Here it is, kind of following exactly want they tell you every single task here in your activity guide for the practice 6-1. And that's what I'm doing here.

Then, of course, after that, they want to create a new array to contain all the tasks. It's called allTasks. And after that, we go ahead and add a new window on mode listener. That's what we have here. And then inside that, a listener, we add the code to load the saved tasks. And that's what we have here.

So we do the parse, in this case, and get the local item tasks, you know, from the local storage and pass that into object. We call it local tasks. And then after that, if it's a-- again, in this case, if not load tasks is true, go ahead and create an array. And then after that, for each of the loaded tasks, we invoke a function to add the task to the application, and we create that through these steps here that we see through the for loop.

Then after that, we add functionality to the addNewButton to add the new task to-do list. Here, what we do is we get the button by ID, OK? And then after that, we'll go ahead and add a click listener function that you see here. And then, we get the task title element. Here it is in this line here, 19.

And then after that, we'll go ahead and create a new task object by using the task title. This would be, in this case, on line 20. And then after that, we basically, optionally, in the-- and add the task they're using by calling the-- invoking the task, OK? Except that we did not see the addTask function yet. And then optionally, we arrange the content of the task item input by setting it to the empty string. That's what we have here in line 22.

Now, they'll ask us to create, in this case, the addTask function. And it starts here on line 26. That's where, first of all, they ask us to push the task to the allTasks array. OK, that's the line 27. Then after that, they want us to obtain a to-do list UL element. That's basically what we have here. And so, we do create that. In this case, a list container getElementByID, toDoList.

Then after that, we create an LI element. Here it is. Then after that, we create the checkbox element. Here it is where we can create element by-- create element-- document.createElement, input, and set it to the checkbox variable. We set the attribute type to be checkbox. And then, check if it's done. We set the attribute again. In this case checked will be checked.

Then after that, add a change listener to the checkbox, in this case, element. Well, in this case, we'll go ahead and set the task done to the not task done to toggle the done property. Checks whether the task is done, check whether the task is done here. And if it is done, go ahead and set the attribute, in this case, to checked. And checked attribute to checked, else go ahead and remove the checked attribute that you see here.

And then after, I call the save function, which we'll see later on. I did not see that update too. After that, we append the checkbox to the task node. That's what it is line 46. And after that, we'll go ahead and create a text node with the task title, value, and append it to the task node. That's through these two lines of code here, 48 or 49.

And then after that, we create a Delete button, input elements. That's where we create that input element, delete button. Set the type to the button and then set the attribute value to be removed, OK.

And then after that, we'll go ahead and add a listener to the delete button. And that's what we have here. And inside that code, we iterate through the allTasks arrays. If the iterated element is equal to the task, remove that from the allTasks array by using the splice, index, dot-- you know, so here, we iterate. And then, if it's equal, we'll go ahead and remove, in this case, the task by using the splice, index, one function and add a break, in this case, in the break iteration.

And then, of course, after that, we'll go ahead and remove the-- in this case, the task node from the list container. That's what we have. And then click on the save button. And that's what we see here.

After that, we'll go ahead and delete the button in this case to-- append rather-- append the task node to the-- in this case, to the-- or the delete button to the task node. And then after that, we'll go ahead and append the task node to the list container, OK? And then, that calls the save function.

Now, what we need to do-- what's left for us is just to create a save button. And here it is, save button function. Here, we use the local store to set item. The key is represented by tasks, and then the value is represented by the old task that, of course, is now stringified, which means converted into a JSON object, OK?

Now, all what you need to do is run it. And when we run it, pretty much here's what we have. And they turn out that we already have some items over there. Imagine I delete all of them. And you know, when you run it for the first time, you see this.

So I'll go ahead and add item one. And then, I can go ahead and add item two, item two. And go ahead and add it. I can also add item three. And then, I can always remove an item. If I wanted to delete, I just click on Remove, and then boom, that's gone, OK? And that's pretty much what they want us to do in this practice. Thank you.

## 3. Practice & Solution 6-2: Adding a Remove Completed Tasks Button & Removing Completed Tasks - 7m

Let's take a look now at practice 6-2. This is optional, but we advise you to try it. Here we going to add the remove completed tasks button. We add a button to remove the completed tasks, OK? So we opened the index.html and add the input button.

And let's take a look at basically how we-- so here, we have a id, removeCompleted, which basically the value remove completed tasks, OK? And then, we add a new item here by having the name, title, task, and then, of course, the button, which is add that allows you to add a button, like the one we did in 6-1 to add items [INAUDIBLE]

And of course, going back to what they asked us to do, here we said open JS and add an ID field to the Task object and add a lost ID global variable. In the addTask method, set the task ID to a last ID plus plus. And that's the ID of the LI elements to the task plus task.id. Add the click listener of the button inside the load listener for the window. Iterate the tasks, and if the task is completed, add it to the temporal array to remove it in another loop.

Again, this is done because removing items while iterating them can lead to unstable behavior. You create another array to iterate it and remove items from the old tasks array. Again, we iterate the newly created arrays that contain the tasks to remove the elements from the old tasks array. Using the tasks.id, locate the LI element and remove it from the to-do list element.

Call the same function. Optionally, create a removeTask method to remove duplicate code from the remove and remove all completed button. Of course, the solution of all of this is in this code. OK, this is the index.html and how we did it. And this is the code of your code.js.

Let's go ahead and take at that. So this is your index.html, which, by the way, now we called it challenge1.html, OK? That's the HTML page change. As you see here, we have an input button for the removed completed, OK? Compare to the old one, where we just have add a new item. So we don't have that input [INAUDIBLE], so we added that here obviously on line 13, OK.

And now, we look at the code, OK? So in the code.js-- so now, we do have basically a-- we added the task ID as you see here, because in the old code.js, if you remember, code.js, we didn't have that. So now, in the challenge one, which is the new one, that's what we have here, OK?

And then we have last ID. And pretty much kind of following what we needed to do. So pretty much here, we get the local storage JSON. We iterate to add all of those to the tasks. And here, we add a new button, pretty much similar to what we have done before.

And here's where we have now the remove completed button. This is something new that we added. So we did getElementByID, removeCompleted, which comes from this HTML code here. removeCompleted ID here.

So we'll go ahead and add the listener to the removeCompleted button. So we have the task to remove, which is an array. And we iterate in this case and look at the allTasks, i, you know, with the index i. If it's done, we'll go ahead and push the allTasks, i, in this case, of the task to remove array.

And then here, we iterate through the whole thing and call the removeTask function. Here is the function addTasks, and I've seen it before, OK. And pretty much that is similar. And pretty much, some code here similar to everything. Here's the deleteButton, if I remember. We've seen that. And then here's the removeTask.

So if you look at the index.html-- the code.js rather that we've seen over there, you have the addTask. And then you have the-- so we took a look at that. And then we have the save button. But in the challenge one-- in the second one, in this case, in-- well, now we have the removeTask. Get that element ID, and then, of course, getElementByID, task, task.id. Test that, and you use the splice. OK, remember that.

And then, of course, in this case, we called it, pretty similar to what we-- and then save. Here's the save button. This is kind of similar to what we had before except that this time we have the removeTask, OK? Master one that-- and if you take a look here, because now we do have this new input, in this case, button that we created, which is basically-- is related to what you see here to remove the complete button that you see, to remove all of them.

So now, what we're going to do is just run it, run the challenge1.html. I'm going to go ahead and run it. So basically, we already have those item. If you remember, we added those earlier. So I can go ahead and add item four just as an example. And then, we can go ahead and click remove all-- in this case, I can go ahead and basically make sure that we can go ahead and remove the completed tasks. Boom, and it's all done in this case. And that's what they want us to do in this practical practice. Thank you.
