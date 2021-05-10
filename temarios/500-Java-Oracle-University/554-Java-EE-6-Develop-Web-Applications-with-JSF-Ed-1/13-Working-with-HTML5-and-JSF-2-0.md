# 13: Working with HTML5 and JSF 2.0

   * Working with HTML5 and JSF 2.0 - 37m
   * Activity 39 - 11m

## Working with HTML5 and JSF 2.0 - 37m

 
All right. Working with HTML5 and JSF2-- the next chapter, 13, we're going to begin with. And in this chapter, see, we are reaching to this point, course road map.

Objective of this chapter, to let you understand the HTML5 features and leverage HTML5 JavaScript API, and to see how it can make HTML5 component be a part of your composites.

So let's continue with the topic one by one. What is HTML5? HTML5 is promoting rich components. Rich internet application components. So you're going to see here several components that have the default supports with the JavaScripting. Not only support, they have default code JavaScript code. You can have the canvas for the freehand drawing. You can create a rectangle and fill them with a red color. You can have a calendar type of components. Lot of components out there.

You can have video components, audio components, so that you can play video and audio. You can pause the video. You can play it from the beginning. That option is there. So when I click on the buttons on the video control, it's calling JavaScript functions, which is built in there, and then work it. So you can say it is really a combination of markup and JavaScript API, which we say, HTML5.

If you want to check whether HTML5 supported on your browser or not, you can take the help of html5test.com today. Almost all the browser that supports HTML5 components. But in case you'd like to check it, go ahead and check it. And it will tell you the current browser is supporting HTML5 or not. It will tell you the complete list of the features-- what of it is supported, what are the features not supported.

See the enhancement? What you're getting it in HTML5 that I'll [INAUDIBLE] use div. We use division to specify header, nav to have this type of options for navigations, articles, sections, sidebar, footer. Now, in HTML5, we have header tag, nav tag for the navigation-related components, article, section, footer, aside is all going to be a tag.

Advantages that you're going to have the clean code. And I do not have to use div block.

Several new components you're going to get it here-- input type, text, required attribute. See? What you're getting in JSF, seeing required equal to true. Now in the HTML components, you can say, Required, which will not let you submit the [? page ?] of your HTML form. Not let you submit HTML form without specifying any value to these components. Make this Required field. That means there's some JavaScripting involved that checking it-- if the user has entered some value or not.

Email. Type equal to email, which will make sure that what you type is going to be an email. Date. Type equal to date, you got it here. But minimum, maximum value. You can specify the minimum, maximum value for the date and a default value for the date.

Type range. You're going to get the slider that can help you to enter the value between 0 to 50. And you can specify default value.

Type equal to search. This is going to give you the placeholder for search options.

Telephone. Input type equal to tel will help you to enter the telephone numbers. And you can get opportunity to type here the patterns.

Color picker. Input type equal to color, which will show you the color palette, so that you can pick up a color from there. Input type equal to number will make sure that you're going to enter only number in this text box, but in this particular range.

Input type equal to month for the date and the year that you plan to enter it here.

See the Text? Email, Date for the date purpose. Range components, Search, Telephone, Color Picker, and the Number. And this is [? word ?] for date in the year. Input type equal to month. Input type equal to-- see? [? That ?] [? say. ?] You can select here the date and the year from the calendar.

So this is rich components which has JavaScripting API supported. It is invoking some functions. It's a collection of HTML and JavaScript API, which is, we say, rich components.

Datalist and list attributes. See now? What we're getting it here, we're getting datalist. It's a components HTML5. You can specify here some ID and give the option. The list of value you can specify-- option one, option two, option three, giving list of value. And this list of value, you can get it associated with the input components. See here? Input ID.

Country name, name equal to country name, type equal to text and say list equal to country. It is something like that in SQL. You have [? the n ?] operator, where you specify the list of value. And you allow to enter only those value which are there in the list. See now? [? L ?] is here in the list. You type here some value.

Input type, text, placeholder. You're getting the placeholder option over there for the text. Auto-focus attributes you're getting in the components. So when you open the page, you will see that component is going to be the current component. Focus will be there. Minimum and maximum attributes are getting it in most of the component to specify the range. That can help you for the validation. Client-side validation. Remember? Set client-side validations. See, HTML components.

Output. We have the output element. They represent the result of calculation, some calculation that you did. Getting the result from JavaScript functions, that you can display it here. Progress and meter components that you have it, that you can use to show the progress to the user. Progress bar or the meter. It is just generic indicator of a scalar measurement.

So progress id bar, value equal to 0, max equal to 100. You can specify that. Value is the current value. And the maximum is the max value. How much work the task indicated by the progress element.

Meter, where you can use a scalar measurement. Let's say minimum, maximum value equal to 2. 2 out of 10, like, this is task completed. 2 out of 3 completed. Or you can use this way to see 50%, 10%, 20% task completed.

Form validation. As I said that, you now have some setup attributes that you can use on the text boxes to validate the data. The client side? Right. And you do not have to type JavaScript in for this purpose. You can use input type, text, required. Client-side validation-- patterns which will make sure that the text that you're going to enter follows same pattern.

We have the audio tag over here that can be used to play the audio. MP3, WAV-- these audio, you can play it. But you need to check that if the browser supports the particular format or not. For this purpose, they have it here. See, song.ogg. It's an audio file. song.mp3 audio file. They specify here audio [? mine ?] type. And they have the audio tag.

So when you open the page containing this audio tag, it will look for this file. If it is supported by your browser, it will start playing it. If not, it will look for the next file, mp3, and will start playing it. If this is also not supported by the browser, then finally you see here the error message, your browser does not support the audio element.

The same way, we have the video. And the video, you will be able to play that as Ogg videos, MPEG-4 videos. You will be able to play it. But you need to check whether it is supported by the browser or not. Like Firefox, you [? can't ?] play this type of the video.

We're going to get the control attributes, which will allow you to play, pause, and give you the volume control. You can, here, see the controls attribute? Say controls. Autoplay, autoplay. That means as soon as you open the page, it will start playing the video.

So let's type that it's a video mp4, mp4 filename. video/ogg. And that is a file name. It will give the preference to first one. If that is not supported, the second one. That's also not supported by the browser. And finally, this message will be displayed.

Canvas. It is, again, HTML5 components which can help you to have a freehand drawing. You can create a rectangle-- create some drawing over there. All right? You can create a canvas with a width and height. Have some canvas, specifying width and height.

And then with the help of JavaScripting, which will provide you the [? contextual ?] Canvas can be useful to create rectangle. You can specify x, y, x, y for this. And x, y for the last one. Coordinate to draw a rectangle. And that you can decide to be full by some color. OK? You can say, fillRect, strokeRect, clearRect. So different types of rectangle you can create it.

That's for the Canvas demo, which I will demonstrate to you. And open an example. OK. Go to Chapter 13 example. Canvas Demo. We see that here, what they have done it, they are using XHMTL. In XHTML, this all HTML5 components. This is the [? H5, ?] [? H5. ?] It's HTML5 components.

But they have made it the part of the composites. They have created composite components using those HTML5 components. So we go to see the composite list. Here they have made this the part of implementations. See the canvas ID. So Canvas is going to be created. And we have appropriate JavaScripting available, which help us to actually draw some diagram on there.

So here we have the method that can help you to find the canvas ID, any HTML components. And then with the help of Canvas.GetContext, you can obtain the context that [INAUDIBLE] [? ctx. ?] And with this, you can specify the storage tile, color, line bit, font that you want to do it. And I guess you can start creating filled rectangle and start doing the painting.

You can simply create HTML file. And you can check it with a browser. But you must have a JavaScripting written, so that you can draw some diagram over there. So clear rectangle with fill. And here, they have drawn some smile. It's some faces. They have drawn it here. Circle and all those things.

So in HTML5, you can also have JavaScripting if you want. You just have to use document.findElement. Here what they're doing is they're dynamically creating audio and video tag. It is also OK that have a JavaScript and JavaScript that you can say document.createElement, specify video tag, video.src, video.controls, true, and document.body.appendChild(video). That's the way we can create HTML components added on the page dynamically using scripting. CreateElement.

We have a JavaScript API available here in HTML5 for the web worker, which allow the tasks to be running in the background without affecting the performance or the pace. So in this case, a separate JS process is going to be started in a separate thread, which will take your process in the background and execute them. All right? So it is not going to block a UI and waiting for the response for the long-running process.

Start-up performance, that's going to be a little higher at the cost. And high-performance cost will be involved, because you are running some process in the background. So what you can do it-- if you want to take the help of this JavaScript API, you can use worker.js, create a worker object. And then you can specify some task to this.

We have a web storage JavaScript API that can allow you to hold some information at the client side or session storage. Now, what happens? See, it is providing local storage and session storage. It is secure and faster. Earlier, the same job was done with the help of cookies. But here you can store the large amount of the data. In cookies, we can just store small amount of data. Large amount of data without affecting the website performance.

Now, see, the local storage stores data with no expiration date. And sessionStorage stores data for one session. So you can select one of the object from here. If you want to store data in the local storage, that will be available every time whenever you-- a client visiting the website. It stores data with no expiration date. Session storage will store the data for a particular session. Like the cookies, it's going to be for the session management. So you can have the session storage there.

Local storage. What you can do it, you can say, local storage. See here? You can specify the attribute clickcount. Clickcount is the attribute, or you can say variable, which is going to be part of the local storage. You visit this, run the pace. Scripting is going to be executed. I call the script. And you can count how many times you are visiting that particular page. So see, it is now going to check existing value of clickcount plus 1.

So every time when you visit the page, it is going to check it and increase the number. My first time is going to be 1. Or you can have some button. On the button you click, click. You call this function and do it. And check it. So you have clicked the button one times, two times, three times, four times. And it just going to show like this. It is local storage. There's no expiration date for this. It will be available next day, next week, next year as well.

Session storage. If you maintain the things in the session storage, it's just going to be for one session. Same job we do it here in session storage, open a browser, Chrome, and have a button to invoke this method. When you're clicking, then you call this. It is going to click the count. Plus, plus. It's going to do the plus, plus.

And say you click one time, two time, three times, four times. Open another browser. And open the HMTL, and click the button to start from the beginning, because that was associated with a particular session. So the new session that we started, you got a new object.

HTML5 feature JavaScript API say geo, geolocation, geographic locations. These days, see, you have a smartphone. And smartphone, you have the application that can read your geographic locations. Or you want to order some food, you want to find locations on the GPS, it can automatically find your current locations. So we have this option here with the help of navigator object that you can use. navigator.geolocations. Call getCurrentPosition to get the users' positions.

But remember, since this can compromise user privacy, the position is not available unless the user approve it. Even if you open Google Map and your Location is switched off, it is going to ask you first. So it is just going to ask you first. If you approve, then it is going to read the locations.

So you can use navigator.geolocations and find the current positions. Call the getCurrentPosition called showPosition here. And this-- here in showPosition, it is going to insert some statement into the HTML components where you plan to type something. It's a span ID. But you want to insert this text value.

If there's an error, see the error type is Permission Denied. Error type is Position Unavailable, Timeout, Unknown Error. These are error code. You can have these functions to tag this error. Is the permission denied? User says no. Position unavailable. They do not have a GPS-enabled system. error.TIMEOUT. And errorUKNOWN_ERROR. Like that type of error messages you can convey to the user.

Let's continue with the next topic, JSF 2.0, Composite Components with HTML5. Composite components work with JavaScripting. So in this case, we will be able to leverage the HTML5 JavaScript API with the composite components. What they want you to-- create composite components that uses audio elements from HTML5. And with the scripting features, which are available to you, you can play the audio on the click or Play button and pause the audio on the click or Pause button.

So very first, they want you to create composite components. As well, you go ahead and create a page, audiobox.xhtml. And in this page, you can have composite interface and composite implementations. Composite interface as well, you're going to list out here the attributes that you like to have it the part of audiobox, which will be used as your composite components.

And in the implementations, what they want you to use-- HTML5 components. Remember, HTML5 components, they are client-side components. Thus, they won't be the part of your [? pace ?] life cycle processing. But see now how the levers in HTML5 components within the composite, they have used here [? up ?] JavaScripting. So they say, outputScript, library equal to js, referring to the source folder JS that they have audio of [? JS, ?] target equal to head.

audio.src, audio HTML5 components. And here, they say, the value which you specify in the attributes will be used here to play the audio. Controls, composite.attrs.controls. The value that you specify here will be used here for the controls.

They have two buttons-- Play and Pause. On click, they're calling a function to play. And in the case of Pause button, they call in a function to pause, which is available to you in JavaScript.

See? This is what the function, what they have it in a scripting file play. And it's just going to find the audio tag. See? The time of render response HTML components will be the part of the response as you type here. But they're not going to participate in [? applied ?] value, validations, update model, all those things.

So client side means on the browser when the information is rendered, and you're going to hit on the Play button, it calls the Play functions on the JavaScript, which will be also rendered to you as a part of HTML response and recalling audio.play. But first they have to find the elements audio within the HTML source code.

Once they find it, there might be multiple audios, elements, and given source code, HTML source code. So that's why they use here index number 0 to find the first element, audio. And they say Play. And input, see. document.getElementsByTagName, input.

First input elements which is for display purpose. And in this, they're displaying the name of the song that you're playing. So [INAUDIBLE] they're again going to find the audio elements in the HTML source. And then they say audio.pause.

In index.xhtml, as well, it's just gonna use here the URI for the composites, have some prefix given to this. Using this prefix, you can use the audiobox, your composite components. Specify the audio that you like to play. controls attribute is equal to controls. These two value that you specify here will be used internally by the audio tag right here. And it control's going to be equal to controls. Let's see this.

So if I take you to HTML5 JS of two example, let's run this. Now, they have here the composite component say Play. This is the input text that shows the name of the song that you're playing it. And you can pause it as well. Pause.

Let's see how it works. If you see that source code which is rendered to you at the client, there we have the audio. It [? sets sr ?] equal to the song name. The URL for the song controls properties as you type there in Composites. And input type button for the Play. And input type button for the Pause, which is calling JavaScript. JavaScript is attached to you here within the head. Here we have set of functions to play and to pause. So that's going to be part of your response.

We see that here, the code. Under Resources, they have here the media. But they have audiobox.xhtml. But they're doing it to attributes to allow you to type the name of the source file to play, and the controls attribute, which you can say, controls equal to controls. So the filename that you type, which will be used here by the audio src. And the controls, it is going to be equal to controls as you type and index.html. Simple one.

This is the song Ogg that you can play on the Firefox. And if have multiple songs, MP3, that you can also include it here.

Now, in index.xhtml, what they did, they're just simply using audiobox from this URI media, under which you have composite component specifying the actual file to be played and the controls pop-up [? teaser ?] called, [? too, ?] controls.

Now, I'll show you some more example. It is given to you in Lesson 13, example. Let's run it. See, there are several examples available to you that you can try. You can say email. It opens emailvalid.html that there, they have email components.

This is HTML5 components, which is not [? JSR ?] [? pace ?]. [? It's HTML pace. ?] It's [INAUDIBLE] [? pace. ?] Input type equal to email. Type some email over there. Let's [? send it in ?] .com, something like this. Submit. It is giving me message. Please enter an email address. So validation going to be happen automatically, because that is the part of your components. Go back.

And you can see the meter. Like this, you can have a meter. You can keep on updating the value with the help of scripting progress. Click this. See, it is now going to show you the progress. Source code, if you want to see HTML. The source code has a progress ID equal to [? bat. ?] Value equal to 0. Max equal to 100.

And this [? pan ?] ID, that shows status. And the script, which is available in main.js. What they're doing, they're finding the elements by ID [? bot ?] for the status as well. And then they're going to display some informations and increase the value. [? Loaded ?] plus, plus. Let's start from 0. And they're going to be one, two, three, four. And that's keep on updating the value of the progress bar.

So a lot of examples out there that you can try [? video out, ?] examples that they have. Here they say the video controls, source type, video MPEG-4. And the source file name that you like to play it. Worker example-- web worker local is also there that you can try it. See, this is what the source code that they have it.

So I can open. This is a source which is available. So if you open video here, link, it opens the actual page. This has not been played here. It's showing MP4. So we can try it on the Google Chrome if it works there. See that? MP4 supported by Google Chrome, not by Firefox. Click the Play, it is not going to play it.

So you have the both options over there to see the source and to run the page. Web is still local. If I click on this-- click me, click me-- it is increasing the value. It's local. But you can try here as well.

See, it's starting from where you left off on the previous one. It is going to be the same for the-- it's local. That means if you try it on different browser, it is going to the same. But if you use-- the session storage, it is all going to be different. With different sessions, it will start from the beginning.

Web worker example is also there. That can let you understand that some background processes going on. We have the option here to handle the background processing. If you want, you can stop it. If you want, you can start it. So we have the options over there to let you understand how you're going to play with the Web Worker JS. So that's one example of the video to play.

Now, since I said that it is not a JS subcomponents, even if you type it in JS [? Server, ?] which allow you to type HTML, it is going to be there. And the time of render response, it will be rendered back to the browser. And you can see HTML5 components.

Any value that you type in HTML5 components or in HTML components will not participate in life cycle processing. Thus, it will not be able to update the model. But you want to. What you can do, you can take the help of setPropertyActionListener. With the help of this, you can assign the value, which you typed there in a text box, to be updated in the model.

For example, here it say input type equal to date, name equal to db, HTML5 components. And this say, setPropertyActionListener target equal to userBean.dob. Management properties. And the value, they say here they're taking the help of param. Implicit object, which is available to you [? referring ?] the HTTP request parameter, .db, db is going to be the parameter value for this input type.

Remember, when I submit this value in HTTP request body, db is going to be the key name. And the value that you type will be there, which you can retrieve using param.db. And that value can be assigned to the model. So that's the way you can take the help of HTML5 components and have the value be updated in a managed bin property.

We have the quiz here. "Which of the following doc types was introduced by HTML5?" All right. That's going to be-- see that? Not A and B. The doctype html PUBLIC W3C DTD HTML 5.0 Transitional EN. Oh, this is going to be that one. This is going to be C, because C says HTML5. There's no need to say HTML5. Here, it's HTML 5.0. But that's going to be the C.

"In HTML5, which method is used to get the current location of the user?" getCurrentPositions.

"Which built-in HTML5 object is used to draw on the canvas?" Canvas. getCanvas. getGraphics. getContent. Congress getContext. All right? getContext. That's what-- all about the chapter.

## Activity 39 - 11m

Let's continue the practice 13. In this practice we're going to use our HTML5 component progress in our DVD library applications for the log in functionality. I just want simple practice for the progress element, and for this purpose they want you to use login.xhtml and remove whatever you have already in the form, and replace them with this content that you need to enter username and password. OK?

So I have here a composite components. We're just going to remove it, because we don't want to see command button. Or you can update your composite components of the moving come within options. But you can do it, you just have to modify your composites. Let's see here. Now we're going to have a text box, a line, paragraph line here. OK? Message pumped.

And for the password box, close the panel grid, and have one more line served to the paragraph. Hide this all within here. Now, what next, they want you to type the ID for the form. ID equal two. Login form. Login form. You know why they want you to type the ID?

Because when the page is rendered to the browser, in HTML you will find the name of this component, which is going to be HTML component, will have the name starting with the form ID login form dot user name. And that is the name you will use to find elements to the Java scripting. OK? Now, what next?

After doing this all, they say add the progress element to the form just after at panel grid. All right? So we're just going to add this progress element, which is HTML5. We do not have to insert any name space for this purpose. Just after panel grid. All right? Progress ID bar var equal to 0, max equal to 100. What they want, they want you to have this pan ID, this pan element of the name is gonna be weight.

You want to insert some text messages to be decided by Java scripting. This pan is going to be useful. And just say before the progress element we will have this pan one. Before the progress element. OK? What else? One more pan, along with ST element to display the status of the progress. All right?

And for this, we will have this just below the progress element. There's a progress element below that. We can have this pan ID, OK? And we can specify here [INAUDIBLE]. ID final message. All right? And the peak is not going to be closed. OK? Have a JavaScript function added so that you can show the progress. And for this you need to type scripting.

Whether you want to insert this as a script, you can insert it within the defining content. All right? The content area. Within that I can have a Java scripting circuit. A script, JavaScript tag, and then you type the whole script that you want. And see that they are here using var loaded equal to zero variable, all right? Function, they have show progress, the passing of the loaded.

And in this function, what they're doing is they are actually reading get element by ID bar. Get element by ID status. And see the document.getElementByID weight, you have the weight element, right? But in the HTML piece of it-- so it will show a piece of it at that place that you have this pan ID weight. The status of index.html, it will show you the loaded value, loaded plus plus percentage. All right?

The bar.value is going to be updated with the loaded value, which you keep on increasing. Going to call this for purpose, all right? Variable was [INAUDIBLE] set timeout. It's a window setting timeout for the timer services so that you can call show progress for 100 milliseconds, all right? This is the milliseconds that you specified.

And it's going to call this show progress for each 100 milliseconds, and is going to update the value of loaded. Loaded variable will be plus 1, 2, 3, 4, 5, 6. And each occurrence of 100 milliseconds, all right, this method is going to be invoked. And once it reads to the loaded value equal to 100, this is going to be started. So see that here in this status?

In a .html show 100, and document.get element by ID status, they would like to say login successful. All right? Go down. You have this status HTML components added here. See the span ID? And that is going to show you login successful. But value is going to be 100, and clear timeout will start the timer, which is, in fact, invoking your show progress. window dot location [INAUDIBLE] will call index.xhtml, all right?

Make a reference to index.html, and you will see the home page. That is what it's going to be through the scripting. OK. Now, when the scripting is done, you should do something in the progress bar so that you can involve the show progress. How are we going to involve the show progress so that the progress bar keeps on updating? We need to take the help of [INAUDIBLE], and what they said.

As soon as you complete typing the password, and you're going to lose the progress on the password box, we want to have [INAUDIBLE] to raise the even to call these JavaScript functions. So I'll just open and close this input box, input second box for the password. And within that we'll type f colon [INAUDIBLE], OK?

What do you want to do when you want to fire the execution process, all right? They say that it is going to be even equal to Blur. On event, which method you want to call on this event, show progress with the value, each value zero, all right? Execute. That means submit username and password for page processing, immediate equal to two. That's all you're going to do here in [INAUDIBLE].

So I just have included this all. And now we are ready to test it, right? We can just save it and check it. Make sure that this name and space is included. Name and space is included, and my [INAUDIBLE] page-- that's why we're not getting any error. Going to say f [INAUDIBLE]. It's all good now. Save it. All right? And hide this on the browser. We can run it from here.

So a browser gets opened with appropriate URL, and right now we do not have a command button to submit the page request for the log in. Rather, we're submitting it to [INAUDIBLE]. Type here the name and password, and as soon as you lose progress, it is going to start your progress bar. It's starting from the zero. It keeps on increasing, because you're invoking this method with each hand at second interval. Hand it millisecond interval, right?

And now we have an index.html, so you can continue, display the DVD library, and all those things you can see there. OK? And it shows the name nitin, because the data that you have typed in your username and password, it has been updated with the [INAUDIBLE] being you set execute equal to username and password. OK? Good. But that's all about this particular practice, and we have no other practices to continue in this chapter. All right?
