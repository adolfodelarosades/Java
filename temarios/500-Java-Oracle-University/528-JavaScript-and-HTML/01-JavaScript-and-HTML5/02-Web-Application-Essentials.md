# 2: Web Application Essentials

1. Web Application Essentials - 57m
2. Practice 2-1: Creating HTML 5 Web Applications with NetBeans 8 - 5m
3. Practice 2-2: Separating JS and CSS Resources - 3m
4. Practice 2-3: Creating a Navigational HTML 5 Application - 4m

## 1. Web Application Essentials - 57m

All right, let's go ahead, now, and get into lesson number 2 where we are going to discuss Web Application Essentials. This pretty much would be the second lesson.

So the objective of this lesson is, we are going to create web applications by using NetBeans-- we'll get to try one-- run the HTML pages, and analyze them by using the browser tools. And then, of course, separate CSS and JavaScript content from HTML pages. It would be nice to put them into their own files. And run a web application by using NetBeans.

So the topics that we are going to discuss in this lesson would be web servers and we have HTTP protocol basics. Web applications, creating web applications and, of course, web application components like HTML files-- in this case, we're going to discuss HTML5 files. Resources could be resources, could be any type of resource including web components like servlets, you know, and so forth. Cascade Style Sheet files, and we'll see here, though, they'll actually help beautify you if you want that and help decided about the look and feel that we have. And then, of course, JavaScript files.

So discussing the web servers, so in general-- and let me go ahead and just share with you an example about that. And for that, let me just, in this case, open my, in this case, my Paint. Let me just go ahead and get my Paint. And I want to open the Paint so I can create an example for you.

In general, you do have a browser. And a browser, in this case, would be any type of a browser and represents what we call a thin client-- a thin client-- which basically, here, representing a browser. OK. And then we have a web application.

This web application would be sitting into what we call a web server. Sometimes, you can use, also, web content out of an app server like a WebLogic or a GlassFish and so forth. So this would be a web server.

OK. And then a web server would contain some components like servlets and JS beans and so forth. Like, a servlet could be maybe calling, in this case, a business component, you know, and the business component calling the database. Let's go ahead and also put in a database here. So let's assume that this represents a database.

And let's make it look like a database. That's to kind of make it interesting, so this looks like a database. And, of course, a browser will connect, in this case, to the web server and the web server also connects to the database. OK. So in this case, we can go ahead and see this. You know, we can call this a database.

OK, and then we do have a mechanism by which we can talk to the database that could be maybe a, in this case, a JPA using an ORM software like Hibernate or EclipseLink and so forth. That's not-- that's covered in-- or JDBC. That's covered in different courses, OK.

But here, you know, the system can access a component in this case, like a servlet. And then the servlet would make a call on a business component which basically acts-- imagine we're getting data from a database-- which access the database, in this case, through JPA or JDBC. And then, of course, grab some data that most probably we'll put in a different type of a component.

Representing this would be a data coming back, in this case, from the database-- oops-- coming back from the database. And then it could be picked here by a web component. That web component can be either, in this case, a JSP. So as an example, where the JSP here can read data from the bean that gets in this case, the data from a database. OK.

So in this case, the JSP can access, in this case, the bean and grab data and then grab it back. And then, of course, build the page and send it back to the client which, in this case, would be a whole or it could be data. It could be also a servlet accessing the data, in this case, and sending the data back to the JavaScript so that the JavaScript will handle that for it. That also another way to do it, too. And we'll see, by the way, this-- we'll see this example where the servlet helps and we'll see that in some of the examples that we are going to see in the cloud, OK. That's the idea behind this.

Let's go back now and continue with our lesson. So web applications are usually stored in web servers and they do handle web requests, store application files, and provide access to resources. So the web architecture pretty much is made of clients.

Well, in this case, you have clients that could be using smartphones, as you see here, or a tablet or desktops or laptops, you know, and so forth. And they access through the network and the web server. And the web server is the one that pretty much processes the request and responds back to the clients. The web server, while responding or processing the response, could be-- may be calling other servers or may be calling the database, you know, and so forth.

So in our case, we showed that in the example that we saw on the Paint. It's that it goes to a database, but you still can be calling other servers that provide data for, in this case, a web server provide data for it. That, of course, will help the web server to create, in this case, a response and send it back to the client. Which, in this case, the client could be either as smartphone or a tablet or a desktop or, of course, a laptop.

So you know how the web server works in general. The client would pretty much send the request to the-- in this case, the web server. The web server will process the request and then build the response and send it back to the client. That's typically how it works. So-- and in some cases-- if, for example, in the previous example that we showed you here, it turned out that the web server has enough information to create a response and send it back to the client.

But in this case, if we want to look at the next scenario where, in this case, a client can request, in this case, send an HTTP request to the web server. The web server makes use, maybe, of some business component that will go ahead, in this case, and grab some data from either, in this case, an outside server on the database and then, of course, bring it back-- bring data that could be coming from an outside server or a database. The server will go ahead or the website will go ahead and use-- or the web server component-- will go ahead and use that data to build the response and send it back to the client. And that's what we see here in this scenario, OK.

So what is a client? Well, a client is an application that runs on a machine that can make HTTP requests and interpret responses. In a sense, it can invoke an HTTP request on the server-- on the web server-- and then will grab the HTTP response and interpret the HTTP response and render the data on the page.

With browsers like Firefox and Chrome and Internet Explorer and Safari and so forth, those are very good examples of, in this case, of browser that can invoke HTTP requests on the web server and get the data back. And that maybe is processed by some JavaScript on that browser-- and then, of course, some HTML also-- and to render the data coming back from the web server.

Other applications that allow you to do that would be a weather application on mobiles that pretty much allows you also to do a request and get the current weather or news readers trying to get the-- read the news information and so forth. OK.

So, for example, if I use an example of a browser, in this case, and access-- just for the example-- access, in this case, Google, so and then I can click a tab here and pretty much-- and get to Google. Google website. And then from there, I can go ahead and say, hey, give me all the news, and that will give me all the news here.

OK, and I can go ahead and look at the technology news just for the example about-- and as you see here, it access different type of servers to get different. So, for example, from CNET to BGR to Hot Hardware to, and so forth, Newsweek, and so forth. OK, that's basically what you get. So that's also another example of how to, in this case, get the information from somewhere else.

So in terms of the-- so in terms of the HTTP protocol, clients always communicate with the server by using HTTP protocol. In general, a client will go ahead and send-- and makes a request and the server will respond with a response. And then, in this case, the client can make another HTTP request and the server will go ahead and returns another HTTP response for that request, and so forth. That's typically how it works. And that client, like we said, could be a smartphone, could be a tablet, could be a desktop, a browser, could be a laptop browser.

So now, discussing the HTTP request, let's just kind of open the HTTP request and see what we have in there. In general, the HTTP request is set on a line. You have a request line where it contains the method. That method could be a get or a post. And then the URI, which is the resource that you're trying to connect to in the server, and then the version of that HTTP, whatever it is. That's the essential request information

Of course, a request, an HTTP request contains some headers information. They're typically name-value pairs. And so these are different the options that the request can use or any additional client information.

And then, of course, it contains a body. That message body could be any additional data that you sent. It should be extra information, you know, which could be optional. Just if you have, for example, a form where you enter all the data in the form and click on the Submit button.

So here is the example of an HTTP request URL. So you have your HTTP, that would be the protocol area. And then, after that, you have a colon forward slash forward slash, that would be a separator. OK, and then after that, you have the address of the component that you're-- rather the application that you're accessing. It could be oracle.com or it could be, for example, an IP for a server. And then colon. In this case, that would be the port separator and 8080.

If you do www.oracle.com, the default would be, as always, port 80. And then, after that, you have what we call a resource that you are trying to access. On the top URL, you have the index.html. That's accessing the index.html which happens to be a homepage of the application. Or if you're using, for example, a server, that would be areas representing the resource operator. And then, of course, after that, the resource you're accessing. In this case, it happened to be the menu.html.

All right, so let's go ahead and look now at the HTTP response. Of course, the HTTP response will have a status line. That would be the version-- you know, whatever version number it has-- and we'll see an example later on. And the status code-- the status codes could be 100, which is informational; 200, success; 300, redirectional; 400, a client error; 400 and 500, a server error.

And reason phrase could be any type of a reason phrase so that the human can read it. You also have some header value pairs, name-value pairs, that would be additional response information. We'll see some examples later on. And then, of course, the body. The body, or the message body, will contain the response content that will be rendered on the browser coming back to the client.

So the response body, let's just kind of get into it because, in general, that's where you get all kinds of information coming back to the browser. It could be documents, just information that-- like with the one that we've seen about the news-- could be images are included. For example, we're looking at the example that we've seen. In this case, that would be related to the images that represent different types of information, in this case, and with the text.

Or it could be audios, could be videos, could be JavaScript files coming back and so forth. So the JavaScript code in the web application is run by the web browser on the client machine which, in this case, would be your smartphone or tablet or laptop or a smart-- a desktop and so forth.

So in terms of looking at web applications, there is a technical definition for web applications which is basically nothing but a collection of files that are stored locally or in a web server that can run on a web browser, OK.

The conceptual definition would be an application that runs on a web browser-- since we're discussing, in this case, HTML and JavaScript and so forth-- that provides the user a solution to a problem. It is self-contained and focused and has a rich user interface. And, of course, it uses the capabilities of the user's device. And that user's device could be a tablet, could be a laptop, could be, you know, and so forth.

So, and looking at the components that we can have for a web application, you have your HTML. And, in our case here, we use HTML5. You have your JavaScript and that, of course, would be used in the browser. You have your CSS that helps you develop a look and feel for your page. You have all the resources that can be used inside the JavaScript, like images and sounds and videos and so forth. But don't forget that there will be, also, some server side components.

In fact, this is what I showed you in the Paint example. So here, in my web server, I showed you some components that do help, in this case, the client. Like a servlet, which is the green one, or it could be a business component like the one that we have here. It could be an enterprise-- our bean, in this case.

And, of course, the connection to the database and then a component that contains data. And then a, most probably, a server returning the-- in this case, the data back to the client or building a page inside a JSP or a JSF-- and build it and return it back to the client. So these are all what we call, in this case-- in our case here-- the server side type of components. OK, that's basically what we discuss as a service type-- server side type of components.

So in terms of the structure of a web application in-- this is again showing you in an IDE-- this would be in NetBeans-- it would be the name of your application, HTML5 application example. And then it has different type of folders or packages. So these folders, like you have the Images, a folder that contains the images. You have so many sources like, for example, in this case, containing an MP4 file. That would be-- and that, of course, could be a JavaScript folder. It contains some JavaScript files. CSS folders contain some CSS files. And of course, a User folder that will contain an HTML file that represents the user. And then, of course, you have some root files like the index.html and the about.html which happens to be just, in this case, HTML files that we have.

So now, let's just discuss the kind of, the comparison of the website versus a web application. Well, there are some similarities between the two because they're on-- all run on web browsers and they have HTML5 and CSS and JavaScript as-- and, of course, additional resources-- that pretty much are used in both websites and web applications. HTML5, CSS, and JavaScript are helpful for the client to pretty much represent data and be able to interact, in this case, with the web server.

Additional resources could be any type of a component, web components, like a servlet or a JSP or a JSF to-- or maybe even a JavaBean that helps grab the data. And of course, these components, some of them can be stored locally on the browser like your HTML and your JavaScript and so forth, CSS. And then you can have, also, some that are saved on the web server. And that would be like your JavaScript files, your-- maybe some other files and HTML files and servlets and JSPs and Java components, and so forth.

So in terms of the definition of a website, a website is nothing but a collection of information organized in pages. It is-- and is navigation-based-- You can navigate from one page to another page-- and does not have much interactivity with the web server, just providing information to you. It's kind of like what I showed you on the Google using the news, just showing you information to you.

On the other hand, web applications have tendency to solve a problem for user. You know, think about banking on the browser. So you connect to a web application to do your banking or pay your bills and so forth. So it's interactive, it's self-contained, and it's dynamic. So in the sense that you log in and you get, in this case, a form. You fill up the form with some data, send it back to the server. The server will build the response, get it back to you, and then you-- most probably-- you get a chance to correct it or modify it or maybe send another set of information, you know, and so forth. That's the idea but the dynamic of it.

So and of course, now, looking at the server side web applications, so looking again at the diagram that we have here, we do have clients that, by the way, can connect to the server and this would be either through the HTML5 or it could be through REST. And we, at some point in time, will discuss also RESTful interaction with the web server. That can actually, in this case, can connect to, in this case, an enterprise server that pretty much can talk to a database.

So in general, on the server side, the web applications, they generate dynamic content from data sources. They generate dynamic pages, images, or resources and so forth. And they also allow you to authenticate to the system.

They allow you-- also, they create sessions and a session management system. Think about the concept of a cluster. Well, in this case, when you connect to a cluster of like, for example, Oracle, you pretty much are assigned a hardware instance. And then, of course, the web server would make a-- create in decision ID for your interaction, the minute to connect to the website until of course, you log out. OK.

And also, it provides security which is a username and password, and your role also. Once you connect your web application, it doesn't mean you can do anything. We'll assign a role to you. So you can go ahead and just do only or handle only the actions that the role allow you. It's stored as user and server information that also can be stored in the server side web application.

It provides, again, XML and REST web services. And this would be either interacting with the web server or through XML at or REST and provides AJAX and WebSocket server endpoint that allow you to allow the client to talk to the asynchronously through AJAX to the web server or WebSockets that allow duplex communication between the browser and, of course, the server.

Of course, at some point in time, we'll get into the AJAX and WebSocket. There's a lesson that covers that and we'll take a look at the details of those. Now,

To create a web application, you create a dedicated folder to store your application-- you know, that would be your package-- and then create the files there for your application. You can create HTML components, files, CSS files, JavaScript files, images, and, of course, organize the files into different folders, pretty much similar to what I have showed you in the previous slide. Somewhere in here, we showed you this, pretty much how we organize all of these.

So let's go ahead and create, in this case, an HTML5 application in NetBeans, right, that we have on the lab machine. So in NetBeans, you select a new project from the menu. You select the HTML5 category and the HTML5 application. And then select the name of your-- and location of your project and click Finish. Just go ahead and do that.

So in that case, I'll go ahead, in this case, an open my NetBeans. And then, let me close this project. And so always close projects. Never, never delete projects. Because if you delete a project on NetBeans, NetBeans will not be able to open it again in the future. So always close it. Never click on Delete. Always click on Close.

So let me go ahead and follow this, so a new project. And we said we're going to do a click-- select HTML and HTML5. Click Next. And we're going to call it HTML5 App because-- let me call it, my application. And then I'll go ahead and maybe save it, in this case, into Labs. Let me go ahead and look for Labs. And then from there, maybe I can save it to Activities. And then I click OK. And then, of course, in this case. next, pretty much showing you need that. There is no template I'm going to use. And then click Finish.

This will go ahead and create an application for me. This is a very simple application because, pretty much, you have nothing. You have a site root, but as an index.html, that you have and that's it. That's basically what we have. OK?

So, and of course, you know, now you want to run the application. NetBeans runs the application on the an embedded web server and opens-- which is inside-- and open web browser windows that can be used for debugging. OK, and of course, we can open that HTML file directly in the browser for testing or uploading it to a web server for deployment.

So pretty much all-- what you're going to do here is going back to our lab environment. So here, we can click on the application. Right-click on the application and just select Run. But as you see here, inside the body, we have to do it right context. So most probably, that's what we're going to see rendered in this case. Let's go ahead and do that. And that's pretty much what you have here. So see? And then it happens and it opens it into a Chrome. And that's what we get, in this case, as an output.

So what I could do here, I can go ahead and change this div information over there-- what's in between the div tags. And then I can say, Welcome to a Java-- JavaScript. And-- oops. JavaScript and HTML5, you know, and so forth, just as an example. And now, when I run it, pretty much that's what I'm going to have as an output. So if I click here, I run it. You see, now it says, Welcome to JavaScript and HTML5. Just as an example, OK. All right, and so let's go back and continue with the lesson.

So, and of course, as you see here, the application files-- we pretty much have seen what we showed you over there-- is we showed you an index.html which happens to be the home page, in this case, for the application. And then when we run it, that's what it says to do right, the content. We just-- I just changed that text to whatever, you know, over there.

And of course, when you look at the browser here inside my, in this case-- so I see, in this case, this information which is localhost:8383-- that's for the local server that exists-- and then the name of the application and then, of course, forward slash, the index.html. That's the one that is called in this case.

And that's what we see here. So the local host, in this case, would be the server address, then the port, and then your application name, and then the file name that you are accessing. And that's what we see here.

And of course, wonderful applications can run on the same server. Now, of course, whenever we looked at those files, we can have HTML files. And these are basically a hypertext, rather a markup language. It is a language used to define documents-- you know, the structure, the layout, the content, and so forth. And documents contain hyperlinks to navigate to all the documents, to include resources, and so forth. And in a web application, HTML defines the page layout links to other pages, references to other files, and, of course, contains forms too.

So here's pretty much the structure of an HTML file structure. So you have-- the HTML files are basically text and define-- that define a document. So we do have-- they contain a bunch of tags, as you see here. We see here, we do have the HTML tag and then the at tag and then the body tag and then other tags inside the title and the meta for the metadata. And then, h1 for the title and all, you know, p for paragraph, and so forth. And br, in this case, for the break and so forth.

So the tags, they contain tags. The tags always are enclosed between a less than and greater than, or in a diamond. And a tag has a name, in general, and it might have a bunch of attributes. For example, here we have the tag that is called meta for metadata. And then the attributes would be character set which is set to the standard UTF-8.

So, the HTML tags are closed by a forward slash tag that matches the name of the opening tag. And what's inside the open and close tag would be a tag body. And it could be like, for example, a title or a paragraph, you know, and so forth. Some tags have no body and may not be closed, OK. And, of course, this would be just tags that have no body. And you, again, may close a tag with no body or rather no body by using the tag name and then forward slash, as an example, OK. And sometimes, some tags do not have a closing tag or no body, if you want.

Now, HTML5 always starts with the exclamation doctype HTML directive. This is the one that tells a browser that this HTML file is an HTML file-- five, rather. The whole document is enclosed in HTML tags, as you see here. OK. Closed and-- and of course, an HTML document has two sections-- the head that contains information about the document and then the body that contains the content of the document itself which, by the way, will be rendered on the browser.

So looking at the HTML tag scope, so you see the-- here, pretty much showing you some scopes. There's the HTML scope. That's the bigger one. And then you have the head scope, and then you have the title scope and the meta scope. And then you have the body scope and inside you have the h1 area, tag scope. The paragraph, the p tag scope, the br scope and so on and so forth. So, pretty much, as you see here, they are all scopes.

And, of course, the header file, if you take a look at the example here, and looking at your HTML5 here, so you have, in this case, a title. Titles are usually interesting or important for search engines. They're useful for search. Here, we have the meta which happens to be the character set which HTML-- in this case, five-- are of the characters set UTF-8.

And, by the way, you can also, from the Tools menu of your NetBeans, you can go ahead and click on Option. Then click on Fonts. And then increase the fonts in this case to whatever fonts you want. Let's use 18, just so we can make and we can see it big. See? Now we can see it a lot bigger. That's nice.

And you see, now, and then the meta, in this case, that is made of the viewport, the content where we say with equal device-- with and then the initial scale which is one, OK, in this case, which is-- there is no, in this case, zooming in and out. We'll take a look at those later on.

All right, so and you saw here the title and the encoding and the viewport size-- we'll take a look at that, some point in time-- and, of course, the style, if you have some style.

So the HTML body contains text; could be containing paragraphs; areas like span, div; forms; tables; scripts; and so forth. So here, we do have a body that contains hello and hi and span. And, of course, which is a paragraph and then some script and so forth.

So the HTML style is embedded in the CSS. The content of the style tags form the Style Sheet for the document. And, in general, it's between the style and forward slash style. So this basically provides a font type, a color, spacing, and display information, and so forth. Here is a family whose area in the background, in this case, is that color. Margin, borders, padding, and the color of your h1, and so forth. And the name space here, that has the font to be bold, and so forth.

You can also, by the way, have JavaScript the same thing. The content of the JavaScript tag includes the JavaScript content which is run sequentially when the tag is reached. And this JavaScript is between the script tags that you see here. OK?

So we have a small example of JavaScript. We get to see these JavaScript-- the details-- in the next lesson. OK. And of course, the application, when you run it, that's where the whole, pretty much, piece-- or if you want-- the whole HTML will run whatever style you have inside to another style here is in the header applied to the whole, in this case, document. And then, of course, inside the body, we do have some JavaScript that we can also run in this case. OK

And then, of course, that produces, in this case, the output which is, Hello, Hi John, as an example. OK. So that's basically what we have here when you run the whole thing.

And of course, in general, what we advise you to do is-- it's a bad idea to actually embed a style inside your HTML5 and JavaScript inside your HTML5. It's just not practical. And if you have to apply it to every single page, then it's pretty much, you know, it's going to be a lot of redundancy, of course. Then it's just not good for maintenance and for manageability and so forth.

So the advice that we give you in this case, ladies and gentlemen, it's a good idea to create the CSS file that contains all the Cascade Style Sheet definitions that can be used inside a style tag. And then you can go ahead and reference them. So to prevent your HTML file from becoming too cluttered with styles and to be able to reuse them, use a separate file for CSS. Put it into a separate file. That would be perfect, OK.

And you can do the same thing for JavaScript. Again, the JavaScript file will contain all your JavaScript code. That can be inside the script tag. And to prevent your HTML file from becoming too cluttered with all these JavaScript that we're going to put everywhere between these script tags, and put it into a file and let the-- and you can reuse it, in this case. That would be good. So put it in a separate JavaScript file.

So, and of course, after that, you can go ahead the link to them. So here's the resource hyperlinking where, in this case, you have your HTML file that can reference resources to add them to their document. Here, it turns out that we do have a link tag, In this case, that represents-- references the, in this case, the style. So you have the href which is the, in this case, the default or CSS file that we accessed, in this case, from the application. And then in this case, the rel, in this case, name would be set to style sheet. OK.

And of course, you can do the same thing for the script inside the body. How you create a script, a tag. And in it, I'll call the file where I put my JavaScript and that's called greet.js, which happened to be under the folder Scripts. OK, that's typically what I have.

And by the way, this is what you folks are going to do in the practice on NetBeans. So let me just go ahead and close this one here because I don't need it anymore and open the previous one. And this is what are you going to do in your practice, in this case. So what we've done here is we created a folder-- a script that contained some JavaScript. OK, this is the one that we embedded before into the HTML document. And then you have under the style? folder, you have the CSS file. And then that's where you put your CSS file.

And then inside your index.html, that's where you are going to now create-- you know, reference the style sheet. Here's the link tag. And of course, you do the same thing. That would be then applied to the whole page. And then, of course, here, you will reference the JavaScript file that we created.

As you see here, here the href represents the file underneath called simple.css under the Styles folder which we see here. And then, in this case also, we've set the SRC to scripts forward slash greeting.js and this represents, in this case, the CSS file that we are, of course, in this case, that we are, in our case here-- let me just, yeah in this case-- that we are referencing. OK. All right. So that's what we have.

We'll take a look at the rest in View area. And then, of course, this is the header information that contains the title and the meta, some metadata, that or some-- a key name name-value pairs for-- to represent the viewport and the content and the initial scale and so forth. All right, and let's continue with our lesson.

So, you know in general, when you try to reference a file-- in this case, that would be either, in our case here, a CSS as an example. And so the reference resource in another server-- imagine that the CSS is in a different server-- then you start the path with the protocol, in this case, www dot whatever, you know, server you have. And then the styles and then use styles or to reference a resource in the same server, you just go ahead and use localhost 8383 styles, and then all that.

Usually, these are what you call absolute paths. So the absolute path is used to reference a static resource in the current server and reference static resource in a different server, too. That's the absolute path. So do not use absolute path for resources in the application in general. We just use, in this case, just a relative path.

Relative paths are used to reference resources inside the same application. Because, most probably, you know, only looks like-- if we take a look at the example here-- the resources are exactly inside your application. Where the greeting.js and the simple.css are inside your application, there is no point. That's why we use the relative path on these here. OK? And to access that, and that's good enough.

So here is just a relative path and how we'll pretty much-- similar to what we say. This is exactly what we have, what we are using here in practice 2. So you have your about.html which is called from the index.html. We'll see how it's going to happen using the hyperlink.

And then, of course, you have your john.html which is under the Users folder. Then you have the style sheet which is and there be a default.css under the Styles. And then you have your greet.js under the script.

OK, so and that's basically what you see. And you see, here, you have your index you know that maybe you can call a john.html through a link. And then, from there, you can go ahead and use the CSS file and the greet-- and the JavaScript file to run whatever and though, here, you're using the relative path.

So in terms of the document navigation, it would be nice to actually navigate from one page to another page. So the anchor tab, here, that says a and then hreference destination represented by this link, here. So in this case, it is used to provide the link to the user to navigate to a different document.

So in this case, for example, in my index.html, I use the href about on it. So I click-- of I click about this application, this will be call-- you know, it will navigate to the about.html, OK. And if I click on John space this will navigate to the john.html which is under the User, in this case, folder.

OK, that's how, typically, it's done and this is how we reference or create a hyperlink to reference in this case here, to navigate to a different page or a document. So let's go ahead and take a look at this as an example.

And for that, let's take a look at our, in this case, console. And as you see here, we pretty much have-- and let me just do a Control plus so I can just increase a little bit the, in this case, the-- so, you know, the font, so we can see.

So here, we do have and an index.html, contains some header information. It contains a body that contains some header, in this case one welcome, in this case, and then a name placeholder that we see here which represents an ID. OK. And of course, in this case, the we do-- call a JavaScript that is here that basically has that placeholder.

And then we add, we learned about get element by ID. And then after that, we'll go ahead and have a name element where, in this case, pass the name to create a text node and then, of course, use that to append it to the name place. And then here, we have the log, the welcome. And then, of course, we have student here. OK. So the name is student and it comes from here. OK, it's a variable name, a JavaScript variable name set to student. OK?

So and that's basically what we see here. OK? And then we have some, you know, in this case, a document that was created. This is under title 2, page 2. And as you see here-- and then after that, we have the paragraph. And we have also a hv as another title. And then, of course, after that, we have a bunch of paragraphs. OK. And Lee takes you to a new line, to List. OK, and that's what we have. And this is pretty much what you see here, OK. That's what you see here.

All right, so and then here we have an hvj console and it has a bunch of, in this case, paragraphs and so forth. We can run it, by the way, in a different page and that's what you see. OK. So it makes use of this Java code that logs the information here to a name-- happens to be, in this case, student. And then of course, it had a CSS that has some font family and some padding left. You know, padding left, in this case, and so forth, some style here which is italic for the name placeholder. That's why the name is written in italics here, as you see here. OK. That's what we have here.

All right, so this is just an example to kind of show you how pretty much we can play with this example. And of course, here, the development tool would be NetBeans IDE 8. You can also use a browser. And the web browser development tool can make use of a page inspector, style inspector, network monitor, and JavaScript debugger and so forth. So this, pretty much-- let me just show you that as, just as an example. But again, we discussed this at some point in time.

So the Tools, I can go ahead and say, I'm just kind of looking at and so-- oops, that's NetBeans. Let me open my browser. So under Tools, I can go ahead and look at web and then I can look at the inspector. Well see, now the inspector gives me information about the network. If I reload, see, it says-- shows how the page is reloaded and the type and the size and so forth.

You can pretty much get-- we can get some console and then run something. And get the console, you can go ahead and use the debugger if you want. Style editor, if you want to add some styling, you know, and so forth. Profiler, and so forth, OK. That's basically what we have here at this point in time. OK.

And you get to-- we'll get to play this-- you know, with this later on. And let me go ahead for now and close it. I don't need it for now, but it's just to kind of show you how we can work with these tools.

All right, and of course, that means also you can debug your JavaScript.

So the NetBeans IDE pretty much is a very, very powerful integrated development environment. Organizes all the application files and settings into your project, automates processes such as like running, debugging, testing, and so forth. An IDE provides many useful feature like multiple languages, JavaScript, HTML5, CSS, and so forth. You can go ahead and check the rules, the match up and so forth.

And of course, the HTML project, as you see, we showed you that. You have the application files, you have configuration files, and we can see that here. Let me open my NetBeans. And right now, what do we have here? Nothing yet. OK.

And then, of course, you can click on the File tab and you can see configuration files, application files, the testing and so on. You can click on the File tab and that shows you that in the form of a file. OK, you have your placeholder, your NetBeans project. Any private properties and index-- private.xml, pretty much information about how your application is built. OK?

And then some properties here, some public pages. In this case, you have your JavaScript and your styles and your HTML files, the one that is under Users folder. And then some test, if there is some placeholder and so forth. That's basically what we have here. OK?

So the NetBeans, basically, is also-- it has a menu. It has a toolbar. It has a project outline and editor. It shows you which open file structure and then, of course, the output of your program if you run it. OK? Those will be the server output or a JavaScript console output. That's what you see over there. And that's what we see, basically, here. OK?

For example, I click on this and that shows me what type of files I have, you know and so forth. OK. Click on greetings, and that's what I see.

This is the editor. This is the, basically, different menus. And then you have the navigation menu, in this case. OK?

And then the output. The output would be here if you have some jconsole, and so forth, it would be down here. But right now, we have anything we did-- we didn't run anything, anyway.

So running your application, well, pretty much, you right-click on the project and run it. You can also run a file.

And here's an example where I can go ahead and run index and run the file. This also will open it. You see? It says, Hello, John. It turns out here-- let me just continue with the discussion here. It turns out that in the index.html, it happens that I have a hyperlink that if I click on about, it to gets me to the about.html.

You click on the user list to get me to the list. And then here, I do have the list, which is this page here, where it has also a link that if I click on go back, it takes me to index. And it basically says user list. And then, the about.html also, it has also another link, hyperlink, that says go back. It takes me to the index. And then it has just the div information that says about.

So that's why, now, when I click this-- we're under the index.html, as you see here, OK, which is this one here. Which basically, in this case, just says hello and then you, in this case. All right.

And then of course, as you see here, we do have it. And then of course, it says here, Hi, John. OK, and this comes from the fact that, in this case, we have a JavaScript. And then we decided that the name span in our HTML is John. That's why we say hi to John.

So my index.html, I can go ahead and use the name span and then that would be, in this case, John. And then we have the hi, here. And that's why you say, hi John. That's what we see here.

And then we have a couple of hyperlinks. One takes you to the about.html and the other one to the list.html and then the Users folder. So if I click on About, this basically takes me to the About. If I cleared that, basically it just writes about any. Click and go backwards. But if I click on User List, that takes me to the list which has a user list. And then if I click, Go Back, it goes back. And that's exactly between the, in this case, the list and the about.html. OK? That's what we have.

All right. This is basically a practice that you folks are going to do anyway.

So the browser development tool, I said you can go ahead and, in this case, click on the-- in this case, go to the Tools. And then you can go ahead and get your development tool. And from there, you can get your developer tool, in this case. And we already kind of showed you this and where you can have here the tools. And from there, you have the web developer tool. And then, in this case, you can go ahead and select which one. Now, for example, I can say open file book and that will open it. And it allows me to test my application. OK? We'll do file at some point in time. All right.

And that's pretty much what I wanted to say about this lesson. These are just, you know, some websites that could be useful to you in terms of the little bit of tutorials.

In summary, we created a web application using NetBeans. We also separated JavaScript in its own files, CSS in its own file, and we referenced them. We looked at the link to all the documents. We've seen that, the link tag. And then we test and debug our application, if you want to just test it.

Some practices that we are going to do, you folks are going to try these practices. And creating-- and, of course, by the way, the practice in this case would be using your, in this case, your activity guidebook. They gave us an activity guide book. And then if you just click on the-- so in the lesson 1, there is no practices. In lesson 2, you folks are going to do some practices and they are using NetBeans.

Practice 2.1, and where, in this case, you create an HTML web application. In number 2, you separate the JS and CS in their own files. And then in number 3, you create the navigational by creating hyperlinks. I went through this example. And that's, in this case, what we are going to do in terms of practices for this lesson. You try them and we'll take a look at them later on.

And the self-study research material here, we wanted to create a simple application by using templates, learn about JavaScript libraries, CSS templates. And, of course, a HTML5. This is on your own, by the way. Just go to Google and do all of that. Here's some self-study assignment that you need to do. OK. So go ahead and try that, just on your own.

And that's pretty much what I wanted to say about this lesson. Thank you.

## 2. Practice 2-1: Creating HTML 5 Web Applications with NetBeans 8 - 5m

Now that we've finished with lesson two, let's go ahead and t take a look at these practices, and we're going to start with practice 2-1, where we create HTML web applications with NetBeans 8. So here, we're going to create a new HTML application using magnets eight with a single HTML file with a JavaScript code and CSS.

So first, we open NetBeans, and then we're going to follow the steps that they give us here. Pretty much the tasks-- you know, task one, open NetBeans creek like select fly on a new project, and then follow basically the-- in this case, the step by step. Let me go ahead and try this.

So here, I already opened NetBeans. So when we open it, it starts with the start page. Let's just go ahead and close it. Click on the Project tab, and then File, New Project. And then, it's going to be an HTML five application. That's what they want us to pretty much do here. So, click next.

And then, they want us to call this lab_02_01. So let's go ahead and call that. So it's going to be called lab_02_01. And then, they want us to put this under the Oracle home, labs, activities. If you don't-- if you find it under the-- another one.

You just go ahead, in this case, and basically change it. You can go ahead and change it from anywhere you want. Here, they want us to be-- I already changed it earlier. That's why it's pretty much defaults to this project location, OK. And then once we do all of this, pretty much they want us to go ahead in this case and finish.

I mean, I could click Next. This would be just if you want to go to site templates. We don't want that. So in that case, we'll just go ahead, in this case, and create a project. So nice created. It's created with the index.html that you see here. Of course, if you run this, pretty much you have an output in this case that says to do right content. Let's go ahead and run this. And that's what we get, to do content, OK.

All right, so, but in the practice, they really want us to do more than that, OK? So pretty much, they want us to somehow add some in this case a-- in this case, [INAUDIBLE] add the Hello, a. You know, h1 had load, in this case, the element and then some paragraph OK? And then, of course, after that, will we'll the-- you know what we had before.

And then they add us. They want us to add some style. In this case. And run the application. And then, after that, they want us to add some JavaScript and then of course run all of that. You turn out that I actually wrote all of this in a file. And here it is, pretty much all of it together. So I'll just go ahead and copy this, and then put it down here in my dot.html.

And so, now I do have, in this case, the-- whatever the one that the style did, they wanted me to add. He's inside the body and wants me to add the H1 and the paragraph that I have here, and then the JavaScript that I wanted. Save it. And then if I run it, pretty much that's what I am going to get.

So I'm going to go ahead and get in this case a page that has hello and then hi, John. And then, of course, the background colors you see here is blue, light blue. Most due to the fact that I have it here, that's the background color. And then, of course, here, I wanted to envy a name span. I want to write a John. And then, of course, in the JavaScript here, that arrived earlier here in the span. It says Hi. And then the span, which in this case, use the ID name spam, which I got it-- you know, getElementById, nameSpan.

And then on it, I wrote down in this case a John. And that's what I have as an output here. And that's basically what they want us to do in this practice. Thank you.

## 3. Practice 2-2: Separating JS and CSS Resources - 3m

Let's go ahead now and take a look at Practice 2-2, where we are going to separate the JavaScript and CSS resources in their own file. Pretty much, we do the same thing, except that this time we are going to in this case create folders, so that means basically all that you need to do in this case is a create a folder and then name them Scripts and Styles. That's what I did.

And then, of course, after that, I put down the CSS file in it, and the other one is the JavaScript file in it. And then of course, in the index.html, now I'll go ahead and link to them. And this all will be represented here, where under the script folder, I do have the greetings JavaScript file. And then under the styles, I do have a simple CSS file. And then inside the index.html, that's what I use, the link, in this case, of line 12, to in this case a reference, be a simple.css file inside the index.html. This would be in the header file, so it's applied to the whole page.

And then in the body, I decided to use this JavaScript code written in the greeting.js, which basically, in this case, has that code that we've seen earlier that we embedded between the script tags inside the index.html in practice in this case, 2-A, in this case, A-1.

And then of course I will go ahead and run it. And this should give me pretty much the same result, except that this time, the CSS file and be JavaScript file are in there under their respective folders. One is under the Scripts folder, and the other one under the Styles folder, as you see [INAUDIBLE].

And that's pretty much what they want us to do in Practice 2-2. Thank you.

## 4. Practice 2-3: Creating a Navigational HTML 5 Application - 4m

Let's take a look now at a practice, 2-3. We're going to create a navigational HTML 5 application, continue with that, except that here we're going to create hyperlinks in HTML and use the CSS codes to create a uniform presentation. So pretty much, we assume that we're done with practice 2-2. OK.

So here, what they want to do is, first of all, create a new HTML file by right-click on the Site Root and creating an HTML file. Call it about.html. And then, of course, add some links to it in this case. And link in here.

We add a link to it, to the index, by clicking on the Go Back. Go back to the index.html. And then, of course, in this case, in the index.html, we're going to add the link to, in this case, the about.html.

And then we'll do the same thing for, in this case, creating a folder. And in this, we'll do the same thing by creating another HTML page called list. And then we do the same thing where we reference the CSS. And of course, we have the index.html that is referenced from the list.

And then, of course, in the index.html, you can also reference, in this case, the User List by calling the list in this case. And after that we create a folder, and that basically allows me so that list in this case is under the Users folder. That's where we create it. So we have to create a Users folder first. And then after that we'll go ahead and create that.

So let me show you that. So here, as you see here, the script file is still the same thing. The JavaScript file. And the CSS file is still there. And in this case, we have about.html that we created that basically has the link to a hyperlink to go back to the index.html.

And then we created another HTML file under the folder Users. And also has a link, as you see here. It also references the CSS, the simple CSS. And also, when you click on Go Back, it goes to the index.html. The dot dot dot you see before that is the parent folder.

And of course, the index.html here, also we created two links, hyperlinks-- one that'll take us to the about.html and the other one that takes us to the list.html and the Users package. And then, of course, here, we make use of the greetings.js which basically is used inside the index.html.

If you run all of this, that's what you're going to get-- this-- except that you have two links here. You have the About that takes you to the about.html. And then when you click on Go Back, that goes back to the index.html. And then, when you click on the User List, that goes back to the list.html under the Users package. When you click Go Back, it will get back to the index.html.

And that's pretty much what they want us to do in this practice.
