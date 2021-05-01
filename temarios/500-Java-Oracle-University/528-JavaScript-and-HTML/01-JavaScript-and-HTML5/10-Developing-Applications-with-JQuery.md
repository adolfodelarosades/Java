# 10: Developing Applications with JQuery

1. Developing Applications with JQuery - 51m

## 1. Developing Applications with JQuery - 51m

Let's go ahead and take a look at lesson 10, which is the last lesson for this course. This is pretty much just an introduction to jQuery. And we wanted just to show you some of the features of jQuery as a library in case you want to use it. And we call it Developing Applications with jQuery.

So here, pretty much, we are going to add jQuery and jQuery User Interface library for your projects. So you need to do that first before using the jQuery. We use selectors and DOM manipulators to handle documents. We handle events with jQuery. And we animate elements and apply effects in the document and handle AJAX response on the server. Or what we want to say-- AJAX server responses.

We start by adding the jQuery to your project. And this is typically how it's done. Basically, jQuery is nothing but a JavaScript library that helps in dealing with common tasks when you are working with web pages. With jQuery, you can go ahead and refer elements in the document and manipulate them by adding content, and edit CSS styles, and a define event handlers, and create animations, and so forth. And this is pretty much-- that's what we are going to look in in this lesson.

And of course, jQuery helps us deal with incompatibilities between browsers, because it includes methods for each browser. And to use it, pretty much, you need to install it. And by the way, jQuery is an open source under the MIT license. And if you need to include jQuery in your project, you can go ahead and relicense the jQuery under the new public license.

And here is basically what we have here-- script src. And as you see here, within your DOCTYPE component, which is the HTML5 component. And here we make use of jQuery 1.11.1.js. That's what we are using here.

And now let's just discuss this jQuery. Particularly we are going to get into the selectors and DOM. Selecting DOM elements, we just want to show you the syntax, basically, here. Because jQuery is focused on queries. So we use selectors or expressions to identify the target elements on a page. So syntax would be dollar sign, the selector between parenthesis or jQuery(selector). Here, for all the rest of the examples, we're going to use the dollar sign between parentheses.

Example-- here we have a dollar sign, and then between the parentheses we put p. This selects all the paragraphs. Or maybe we pass to with the #section-1. This selects the single element with the ID-- particular ID here is section-1. Or a .advertising-- select all the elements that have this class. And of course, we can go ahead and select, for example here, h1 and h2. That will be selecting all the h1 and h2. Or select an input type with an attribute that is set to a particular type, like in this case, text as an example.

Here are other examples where we can create custom jQuery selectors. Here, for example, I have the header:has(h1). And this basically selects all the elements that match the selector that is sent as a parameter. In this case it is h1. You can also use the contains. Here's an example, p:contains. And this selects all the elements that contain a specified text. Here is Proin nonummy as an example.

We can use the eq, the equal. And it selects all the elements of the index, in this case, for example. And here is one. And this text, don't forget that it starts with 0, here selecting the second paragraph. Because it always starts with 0, the index in JavaScript.

You can use the not. And here's an example where it says input:not and then colon required between parentheses. This selects all the inputs that are not required. Colon file selects all the elements with the type file. Or colon button selects all the elements with the type button. Colon input selects all the input elements. Select all elements of type submit.

So these are all examples. And we can go ahead and look at other examples. We're here inserting DOM elements, as you see here. So we can use the append, appendTo, insertAfter, after, and so forth. Here are some examples that we show you here.

The append, then you pass the content to it here, to the paragraph, p. What it does, it inserts content at the end of the matched element-- in this case the paragraph. Or the second one is appendTo. appendTo serves the same purpose as append, except that the syntax is different, as you see here.

insertAfter-- here's another example of the insertAfter. It inserts the element after the target specified. To insert before the target, you can use the .insert and then particular target.

We can see the after. After also can be used. It inserts content after the matched element.

And you can use the HTML here. That's the second example-- or rather, in this case, the fifth example. That would be queries and search the HTML content of an element, HTML. Of course, with no arguments it returns any HTML content of the first matched element, as you see here. You can pass an argument to it.

We can use the text in this case, in this example that you see here. And that queries and assesses the plain text of an element. You can use a wrap. And the wrap, a text selector in this case, wraps an HTML element around each matched element. That's another example.

So these are all examples. And you can try them then at some point in time. And I'll show you how to try some of these later on on your lab machine on the JSConsole.

Here are some examples related to replacing and removing DOM elements. So again, here, in the first example, we have the replaceAll, and then passed through it h1. replaceAll, and you pass the target-- what it does is replace every target element with the matched element that we have, as you see here. You can also have replaceWith. A replaceWith serves the same purpose as replaceAll, except that the syntax is different, as you see here.

We also can use the-- for remove we can use empty. And the empty removes all children, including text nodes of each of the selected elements. We can use, also, remove. And remove removes all elements in the jQuery object, including the element itself. By the way, we can also use a detach. And it's the same as remove, except that it returns the detached element for further manipulation, whatever you want to do with it.

So these are all good examples that you can use in jQuery. And that's basically what we're doing. We're just showing you different examples on how to make use of the syntax in jQuery. Let's see more of these.

Here's setting tag attributes. So here, for example, we can deal with classes. And for classes, we can use addClass. And this basically adds the specified class or classes to the matched elements. We can use hasClass. And that returns true if the specified class is assigned to at least one of the matched elements, as the example here, the second one. That checks about the advertising.

We can remove a class by using removeClass in this case. This removes a class or classes, or all classes, from the matched elements. And of course, if no classes is specified as parameter, all classes are removed, like in this example here.

We can also use CSS. And CSS here allows you to get or set to the CSS size of an element. It returns numerical values are strings. We can also use-- and here's a couple of examples here-- see, this is getting and this is setting the background color to be cyan.

We can also use the attributes where we use the attr method. That gets and sets HTML attributes of matched elements. You can set several attributes simultaneously also. You also can use removeAttr, which removes an attribute from the matched element, as an example.

More of these jQuery syntax examples-- here, traversing DOM elements. So again, here we can use children, siblings, nextAll, next, previous, parent, add, and so forth. So here we see some examples.

The first one is children, as you see here. Children are returns the children of the element, whatever it is. Siblings returns the siblings of the elements. Here's one. And then we'll go ahead and set the background color to be cyan for them.

nextAll returns the following siblings of an element. Or you have next, which returns, in this case, the next sibling of the element. In this case, for example, li:first. And next, and then set the background color to be red.

Previous, in this case, or prev, returns the previous sibling, in this case, of the element. Parent returns the parent of the element. And the add adds an element to the set of matched elements. Again, it creates a new set. It does not alter the origin of the set. Remember that.

More of these traversing DOM element examples-- and here we see also the find-- find, then you pass a selector to it, like the first example here. This is similar to children. It returns the descendant of the matched element, except that the find method creates-- or rather searches through all the levels, which is a child, grandchild, great grandchild, and great grandchild, and so forth.

We also have the equal. And we pass an index to it like in here. This returns the element of the index position of the set of matched elements. Remember that the index starts always at-- zero base starts at zero. First it returns the first element of the set of matched elements in this case.

And last returns the last element of the set of matched elements. We could also use map. And we pass a callback function to it. This applies a callback function to every element of the matched element. Of course, it returns a jQuery object with-- it returns values.

You can try all of these on your lab machine and on the CSS console, and in the different examples of lesson 10. And we start with the first one. Let's go ahead and do that.

So in this case, you can go ahead and click on the first one, jQuery. And then you'll run this on a browser. And then you can go ahead and open the Firebug. Open Firebug.

Let's clear this. And here we can go ahead and try these examples. So in general, if you don't have it like that, if you just find it like that, just open it. And then you get your text area or the editor, where you can try your examples. Then I've copied a few of them here from the activity guide book on your lab machine. I copied a few of them and put them into this text file.

And we can go ahead, for example, and try one. In this case, the first one here is section one header, sibling. And then get the background as cyan. Let's go ahead and do that. So we copy this. And then go back to my, in this case, Firebug. And then paste it here. And then run it.

And as you see here, I see my object p1, p2. And I see they are, in this case-- the background color is cyan. Exactly what we did. I can scroll this down here and just basically show you. That would be on section one. And I can see that the background color is cyan, as an example.

I can clear this here, and clear also the console. And I can go ahead and try different examples. So you get to try all of these if you want. So let's go back to our text file and use another one.

Here's another one. We can try this here. And then run it. And see, now it gives me, in this case, the li that we have. And if we take a look here, this is basically going through this index.html. And I have a list here, li here, and that shows me this. And the home-- including the home. And rather, in this case, basically, particularly I'm using for this section. That's what I'm trying here, section.

And then if we go back here, you will see it. And you see speaker and workshop, and that I set, in this case, the background color to be, in this case, red. Clear this one here. And clear this one here. Oh. Let me clear this one here. I just ran it again. So let's go ahead and clear, also, the console. And then reload the page so that we get rid of that.

And we can try other examples. We can try other examples just by opening-- and I can try-- let me try this one here just as an example. And let me try it here and see what happens. And boom. Now we get the last one. The workshop is the last one. And that's what I have here as a background color. Clear this. And clear this. Reload it.

And I can also try another one. For example, here, find the paragraphs and under section one. Find p in the section one. I'll run it. So that'll get me all the paragraphs, as you see here, as an example. We can clear. We'll leave this one here.

And you pretty much can try all kind of examples. Here's another one here, just for the fun of it. Let's try this one here. And we'll run it. And that gives me, as you see here, the h2 where the background color I have to be cyan. So we decided that the background color is cyan. And that's what we have here. So as you see here, it's all there in our p.

What did we get? We can clear this. And then, of course, clear this. And then you can try as many examples as you want. And if you want to stop it, just click on F12. This will stop the file pop. So you can try as many as you want later on.

So this is the ones that we told you, pretty much, take a few minutes and try different ones if you want. Now we're going to get into the events. So here we are going to handle some events in jQuery. And with jQuery it is possible to set up event handling in the web application.

Again, the type of events in jQuery are categorized in the browser. Document loading form-- keyboard, mouse, and so forth. For example, on the keyboard by key down, key press, and so forth. And then by the mouse-- mouseenter, mousemove, mouseout, mousein, mouseover, and so forth-- mouseover and so forth.

So we can go ahead and handle this. And in this particular case, we use a couple of examples. We use the bind function and the delegate function. And we can also use the on function, too. This pretty much-- we can use the on, the bind, and the delegate functions to bind event handlers to events for predefined and non-predefined events.

So you can bind more than one event handler to the same event by using the bind function that we see here. Basically, what the bind function does-- it accepts three arguments-- the event type, the data, and the function handler. And basically, in our code here, that we see on the slide, we use the text identified by a #myText to increase its size when a user clicks on it. Because we have the click as, in this case, the event type.

And by using the unbind, by the way, you remove any binding of your events. You just use an unbind. You also saw an example here using delegate, which is the second one here. And delegate also is used where you can bind handler independent of whether the DOM element exists or not.

And you see an example here that we show you here on the slide, where, in this case, the first argument in this case looks up a parameter, which is the p, presenting the paragraph in this case. And we attach a move over event handler to every new paragraph created by clicking the Add Paragraph button that we see here. And that will increase the size.

We said that I can use the on. The on function also supersedes the bind and delegates. And again, so in general, you can try it also. Here it is, where you have the click and so forth. And here's an on also, where you can use it.

You can also use the trigger. And the trigger, basically, if you want programmatically to execute event handlers without the need for the event to happen, with the triggers, you can, which executes the event handler for an event type. So we see here the trigger.

So when using the trigger, you can go ahead and build this object by calling, in this case, the event. So here's an example of trigger by using the click. Let's go ahead and take a look at an example about this handling event in jQuery. And we'll look at that in our lab machine.

So we'll go to our jConsole application. In the lesson 10, we click on the jQuery event. And here's an example that we have. So we have an index.html here that basically has some text represented by the myText ID. And then when we click on that button, in this case, we actually call a function called addParagraph, which is right here inside the file.

So basically we create a paragraph element. The variable contains a reference to the p element. In this case, we'll get element by p-- by element rather-- create an element p, in this case, new paragraph. We've seen this example before. And then we'll go ahead and create a text-- pass the mouse over this to enlarge it.

And then of course, in this case, we go ahead and create a text node with it. And then insert the newly created text node into the tree node by, again, appending it to the new paragraph element. And then, of course, here we get, in this element, my ID, in this case, which is my paragraphs. And then append to it the new paragraph element that we created.

So that's the ID here, which means when I click on the-- in this case, that will add the paragraph element that we created, which basically contains the text that says "pass the mouse over this to enlarge it." But then after that, we make use of the code.js, in this case, file. Well, in this case, we'll go ahead and-- we called already. And we have a function that we'll use, the bind, to add the class to increase the size. And we have to delegate by, again, doing the mouseover to actually increase the size. So let's go ahead and try that.

So in this case if I pass over, you see, hovering it, you will increase the size. And then when I hear-- it says when you click, you go ahead, in this case, and increase the size on, in this case, this myText that I have here. Let's go ahead and do that. And when I click on it, it increases the size. And that comes from the fact that, in this case, it says click and increase it. So that's what we see here.

Now let's make it a little bit more interesting. And what we are going to do here is basically, in this case-- I'm going to start all over again and comment this code that we have here.

So here, for the myText, which is here-- this myText here, formed by the ID myText that I see here-- what we're going to do is, when you click on it, not only it increases the size here, but also it changes the color. And then for the other one, when we do move over, when we add the paragraph-- moved over, it will increase the size but also changes the color. And let's see if that works.

So we'll go ahead and run this. And then, now we add the paragraph. And then when we move over it, it's going to increase the size, but at the same time, it's going to change the color. Is that true? Yes. That's what happened.

And then for the myText, it's going to increase the size. But also, it's going to do what? Change the size if we click on it. Let's do that. And that's exactly what happened. So this is a very good example, where, in this case, you will see how this works very nicely. And the style basically here is just showing you the color that-- if you increase the size, this is the one that-- because here we said increased the size. So this increase in size will be, in this case, 300. And then the color that we're using-- change the color we represented by here, #ff9951.

And this is the example. So this is a good example. And now try it, please. And I can always click here on revert everything, and that goes back to the original. And you can run it, and then you can try it again if you want. But if you want to run this, you need to uncomment it.

So take a few minutes-- I just showed you that-- and try it. That tells us about the jQuery event on your lab machine. Now let's take a look a little bit at animation and effects.

Here we are going to make use of the jQuery, which provides a set of methods for animating elements in the document. So here is an example where-- here, for example, we have a document ready function. And then we have the myText, where we hide the text. And also, when we click on this, also, we can also show the text.

So the show displays the matched element. You can also, by the way, accept the duration of the effect as a parameter in milliseconds. And then we have a hide that hides the matched element. And we saw here. And then we have a token that displays and hides the matched elements. So that's the toggle, which means displays and hides. You click on, it displays. You click on it, and it hides, and so forth. We'll see examples about that soon.

We also have other jQuery methods that we can use, slideDown and slideUp. So the slideDown displays the element with a sliding effect. Here's an example. The slideUp hides the elements with a sliding effect.

The fadeIn displays the element with the fade effect, makes the element opaque. And the fadeOut hides the element with the fade effect, makes the element transparent. Again, the duration parameter on the callback function can also be used as a parameter in these functions.

We also have the animate, which is also another custom effect type of a function for the jQuery. The animate function enables you to create your own custom animation. And we can see here on the slide where, pretty much, you have the animate and then the property value-- in this case, whatever duration, easing, and callback. So here's an example that we see here.

So this function receives a bunch of parameters that you see here. And one is the object of type properties and values, which are the properties to animate whatever you are going to do in this case. And so here we have a height and width. Height-- 400. Width-- 400.

We've got, also, the duration that optionally can pass it-- in this case, like 2,000 milliseconds. And then we have the easing argument that you can also add. The easing arguments is optional, which determines how fast the animation runs in this case at a different point of time.

So here's also another set of examples that use queuing. Again, it's part of the custom effect, where here we do have an example where my queue animation button, on click, will go ahead and animate, pass the height. And in this case, and with 1,000 milliseconds, and in this case, of the duration. Animate on the width the same thing. And then here, we added that the opacity, which is, in this case, about 75, and then of course, the duration.

So this is pretty much showing you some chained animation, where each animation starts after the previous animation is completed. And of course, a similar effect can be used by using the queued animation. So in this function here, and this example, we should see that the queue-- put something as the cue that must, again, be called immediately in order to run the animation.

And then you go ahead and animate this. And then we'll do height 400, with 1,000 milliseconds for duration. And then use the queue. So basically, here you have the similar effect of queued animation, which is released by using the queue functions.

And looking at continuing with this, here's an example where, in this case, we have another animate. This one, again, in this case, has the height and then the duration, which is 1,000, the queue, which is set to false, and the easing, which is linear. And then you do your animate. So these are options we can add. Animate the width and then the opacity, in this case.

So in this case, of course, the code snippet that you see here shows how the height, in this case, property, in this case-- the animation is queued by setting the queue-- setting to false. In addition, the setting of duration and easing, we can see that.

And you can go ahead and stop animation. And stopping the animation, you can use the finisher stop. Stop any currently executing animation on the matched element. And then we can use that finish-- basically, it causes all the queued animation to jump to their end values. Again, we can try these here. We just see an example of the stop. And let's see examples about that.

For that, let's go ahead and take a look at the example of the-- so we have, in this case, in our JavaScript code pretty much all of the show and hide and toggle and slideDown, slideUp, fadeIn, fadeOut, animate, in this case, with an easing. And in this case, on click, you have this animate also for the height, the width, and the opacity.

And you have different examples here using the dequeue and queue, and then, of course, examples that use the parameters duration and the queue forms. And kind of similar to what we've seen in the lesson-- stop and finish, and so forth. And let's run this in its own.

So of course, here we have the index.html that pretty much shows all the different buttons. We have set of buttons here, which are these ones here. And then we have all the sets related to the animation. These are related to show height, toggle, show by height, sliding, hide by sliding, show by fading, hide by fading, and so forth, and the chaining effect.

And all of these are basically represented here. Here's a set of buttons that you see here. And then we have several buttons related to the animation, which are here. And then we have the JavaScript code here that pretty much shows this. And this is just the style.

So let's go ahead and look at this example. So here I can show some text, that I'm working with some text here, which the files are all hear, so the text files are all here. And let's go back to our example. And we can hide. So it hides that. We can toggle, show, and hide. Basically all are implemented here in the code.js. Toggle and then slideDown, slideIn. And let's see those.

So show by sliding, hide by sliding, show by fading, hide by fading, and then the chain, which basically-- they are all chained together. And you can see this example of the chain here. Somewhere in here-- oh, here it is. That's what it does.

And then we show you, also, examples about related to the other ones, which is pretty much the animate. So here we have the animate image. See how it's animated. And we can do a reset.

And this is basically showing us, in this case, and in the index, which is, in this case, the animate image, which is my animate image ID that you see here. And then you can see it under code.js-- in the code.js, which basically, here, shows the-- here's myQueueAnimateButton, which we see here-- my animation, myQueueAnimateButton that we have here. So we have animate, QueuedAnimate, and so forth.

So here we do have the animateButton. Here it is. That does the animate. That's the one that I just showed you. You can do an Animate Queue button, Manual Animate, and the Non-queuing Animate button, the Stop button, the Finish button. And they're all here, as you see here. When you call them, they pretty much are all here.

Here's a Queued Animate button. And let's reset the Manual Animate button, which basically is here, which is this one here. And reset the Non-queued, which is this one here. And let's reset.

And then, of course, you have the Stop. See, it stops. And finish, we'll go ahead and finish the whole thing. Reset. So I can always stop this at some point in time. That's it. And if I don't stop it, it will go ahead and continue all the way, and so forth.

So you can go ahead and try. These are pretty much straightforward examples. And that's why people like jQuery. Pretty much, you have all these functions that are created for you that can go ahead and make use of them.

So please go ahead and take a few minutes and pretty much go through the example that I've just showed you, which is the jQuery events in your jConsole application. Now let's take a look at the AJAX. AJAX is also used in jQuery. And the syntax is basically using your AJAX and URL settings, or AJAX, URL, and then your URL and a bunch of settings, whatever you have in this case.

Here's an example where I have AJAX button on click. We have a var my request, AJAX, and then we specified the URL which is accessing the file, underscore, dot html. The method is get. The data is some HTML data.

And of course, here we have the DOM that takes that data, a function, and then, of course, in this case, uses the html function and passes the data to handle that. So we learned already, AJAX, in the earlier lesson, that that uses JavaScript and so forth. Here, jQuery really provides that AJAX method but also provides wrapper methods to implement the AJAX.

So the AJAX method enables you to, in this case, make AJAX requests but, again, with more flexibility and control. That's basically why we like it. And your AJAX method returns an XMLHttpRequest-- in this case, object, which basically contains a bunch of several methods that you can use.

So we can also, by the way, make use of a other function. Again, some of these shorthand functions that we can use is the load that you see here. So the load function loads the data from the server and places the returned HTML into a matched element, whatever it is in this case. We also have the getScript. And the getScript, what it does, it loads a JavaScript file and executes it. And here's an example of where it loads the myscript and executes that.

We also can make use of the getJSON. And the getJSON method also is used, again, order to load the JSON encoded data from the server. You can use the getJSON that you see here. And then you specify, in this case, the file or, in this case, the JavaScript JSON that you're getting.

And then, of course, you can make use here of a function which accepts URL data and a callback as parameters-- what we see here. So we can go ahead and, in this case, get the data and render that data, in this case, by appending the key value pairs that you have in the JSON object. We'll see an example about that later on.

We also can make use of the get. That's again continuing with handling server response. The get method here for a typically generic type of request-- we can use the get and post. And the get here sends and receives data by using HTTP GET method. We specify the URL, which represents the file to get; the data, which is an object that can be sent to the server; and then the success, in this case, the callback function to execute the on success; and then the data type, which basically specified the type of data expected from the start of it. Here's an example.

In this case, we have a on click function and get this data. And then, in this case, then we'll go ahead and pass that to the html function. So the get, by the way, enables you to chain multiple callbacks if you want. Let's see an example about this AJAX.

So here we have an index.html that happened to have different buttons. And of course, we have the ajaxButton id, id loadButton, scriptButton, jsonButton, getButton, and clearButton. And they are all connected through the-- or if you want, you can access them through the different buttons that we have. So the AJAX request, or the load request, and so forth.

And then in my, in this case, code.js-- so I get my ajaxButton, which means, in this case, I am getting in the first one here, which represents the first button. And as you see here, it uses AJAX by getting that HTML file-- one, which is this one here. Somewhere in here it has-- so it's data we already created for you. We do the get, and then with the dataType html. And then we use the HTML so it'll pass that data to render that on the page.

And we have the load, which is this one here, the load basically calling this button here, the load request, which-- by the way, in this case, loadButton, that loads the file, and then of course, in this case, will go ahead and load the data from the file underscore dot html, which we have here. We have the script that executes the script myScript, which is this one here. But actually, what it does is loads that data. And then we'll try these in a minute.

And then the next one, we have the getButton-- or jsonButton first. The jsonButton here, as you see here, gets some JSON button, and then uses the function to represent all of that. This would be my, in this case, jsonButton that you see here.

And then after that, we have the getButton. So here's my getButton here that loads the data and passes it to the HTML, of course, to handle it. And then we have the last one, which is the clearButton. And the clearButton, what it does, it will go ahead and basically empty the content. And that's it.

So let's go ahead and run this in its own-- in this case, in its own file. So AJAX will go ahead and get the text. This is the HTML one-- text that we pretty much read. This will be the first one. And then we'll go ahead and just load it on the page.

And then we can do the same thing with the other ones. Let's go ahead and clear this. We can do a load, and it does the same thing pretty much. Clear that. Get requests, getScript, we'll go ahead, in this case, and execute this file, which basically does nothing but loading the data. And then, once it loads it, then at that time, you can go ahead, in this case, and render that. Let's go back and clear.

The getJSON request also can be used, as you see here, which basically gets some getJSON object. And we can go ahead and run this. And run this in a new page. And try it. Here's my-- and that gets Peter, Mike, Tom, Matt, and Cindy, which are some JSON data that we have located here. This is the JSON list that we have. And we do a clear.

And then we can go ahead and get the request that pretty much, in this case, gets the whole thing. The get request in this case is calling the getButton, which basically reads all the HTML file and then loads that to the HTML to load it. And of course, this one always will clear up things. And that's what we see here. So this is a good example to try.

So please take a few minutes and try it. It's the jQuery AJAX, which is a good one. Just kind of understand the whole machinery, how it all works. And of course, we do have a jQuery exam. So remember that, when adding the jQuery UI to your project, you can go ahead and add that. So here we do have the jQuery UI library that you add. And of course, in this case, it would be the CSS for CSS information, and then the JavaScript that you need to add.

And we do show you an example here. This is just an example that you can go ahead and try. And let me show you this. It's on your lab machine. That's the last one. This is pretty much showing you what we can do with jQuery.

Here's an Accordion. That pretty much allows you to access any. Autocomplete-- we can have all our Autocomplete examples, or whatever you want to use in this case, and so forth. You can click a Button element. Here you have different sub-buttons that you can use. Here are Tabs. We can click on different Tabs. You can open the dialog box, and you work with it, and so forth.

And here are some Overlay and Shadow classes that you can use, Framework Icons, also, that you can use, and so forth. Slider-- just so I can use-- also, a Date Picker, and so forth-- Progress Bar, select Menu, and so forth. Spinner pretty much allows you-- Menus and sub-menus, and so forth-- Tooltips, and so forth.

So this is just to kind of show you how you can use the jQuery. And it allows you to pretty much create all kind of DOM elements and components on your page. That's basically what we want to say here. Just some examples here. And there are other website resources if you want to learn about jQuery or API, or jQuery User Interface, or jQuery User Interface API, and so forth.

So in summary, what we have done here is we went ahead and added jQuery and jQuery User Interface library to your project. We used selectors and DOM manipulators to hand documents. We pretty much handled events with jQuery. We handled animation-- animate elements and apply effects in the document. And also, we saw how we can use AJAX in jQuery.

And that's pretty much what we wanted to say about this lesson. Now, we should say that this lesson does not have any practices. It's just examples, and that's it. So we just wanted to introduce you to jQuery. And that's basically what we have done. And you can learn a lot from the examples that I showed you in the JSConsole on your lab machine, just to try the different examples and so forth. So it's worth looking into jQuery, and see if it's worth using it for your application. If it is, then it's a good idea to download it and make use of it.

And I want to finish this caused by introducing you here to the Oracle University website. And this basically, if you go under the training, and software and Java, you have Standard Edition Java courses that you can go ahead and try for your needs. This pretty much covers all the Standard Edition 8, and even the latest one here.

You also can get into the Enterprise Edition. And the Enterprise Edition contains all the Enterprise Edition courses, including, by the way, the Web Services course and so forth that I mentioned, the back end and the front end, and so forth. So this is just to kind of guide you if you are looking for any type of training on Enterprise, Java, or Standard Java. Basically, the Oracle University website will basically guide you to any course that you're interested in, and then to register in it and take it. Thank you.
