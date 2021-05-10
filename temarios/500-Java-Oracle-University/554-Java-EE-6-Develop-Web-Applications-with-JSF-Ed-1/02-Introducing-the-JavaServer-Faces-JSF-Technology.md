# 2: Introducing the JavaServer Faces (JSF) Technology

   * Introducing the JavaServer Faces (JSF) Technology….Part 1 - 54m
   * Introducing the JavaServer Faces (JSF) Technology….Part 2 - 28m
   * Activity01 - 16m
   * Activity02 - 14m
   
## Introducing the JavaServer Faces (JSF) Technology….Part 1 - 54m

Hi. Welcome back. Let's finally start introduction to JSF.

So relating to this point, introduction to JSF technology, and course objective is to let you understand the requirements for the web applications, describing JSF, understanding architecture of JSF web applications, developing view of JSF applications, and let you walk through with a simple JSF application so that you can understand the life cycle of the JSF.

See the main topic here to let you understand how the JSF page is going to be processed. So we'll see that. Let's start.

This is the topic list, one by one that we're going to see here in this PPT. We're going to start with JSF first. JSF, what's JSF? This is a totally object-oriented, component-based architecture for creating user interfaces. With this they want to tell you that all the components that you're going to use to build the JSF pages, they are Java classes. They are server side components. And it is totally object-oriented.

As application developers, we do not have to create JSP and Servlet classes. So if you go back and create a web application using Servlet and JSP you will have presentation logic either in HTML or in JSP. You submit the page that goes to Servlet. Servlet is responsible for controller logic to let the page understand what you have submitted, and what you would like to do with the submitted data. This all we don't need here in JSF.

JSF it is the page templating technology which we say, Facelets. We going to use NetBeans to build JSF. And here we have .xhtml pages as a JSF. So the page that you create, it's going to have extension as .xhtml.

If you see the entire journey when the JSF was started, JSF started with JSF 1.0 in 2004. And in 2006 they introduced JSF 1.2, and it became a part of the Java EE 5 standard. Later in 2009 they introduced JSF 2.0. That became a part of Java EE 6. And now we will use JSF 2.1. There's a minor enhancement that they did it so it's not going to impact if you use JSF 2.0 or 2.1. This minor enhancement is in specifications for better maintenance and for the performance as well.

Goal of the JSF, we will talk about addressing common web application requirements. You're going to use UI components to maintain the sate of the pages, encapsulating markup differences across clients, supporting complex form processing, and a strong type event model.

JSF, it also helps you to provide the capability for data validation, conversion, and error handling. We will see how easy it is to validate the data, to convert the data. At some point you may need to use Java programming if you'd like to go for customizations of validations or conversion logic.

Benefits of JSF, since we know that it is component-based web application framework, and the JSF it is going to separate presentation logic. It is going to have a behavior logic separated. Reduce the amount of browser-specific knowledge. We do not need to have browser-specific knowledge going to be Firefox or Internet Explorer. Or it's going to be Google Chrome. You can instead, start developing web applications without any browser-specific knowledge.

The main purpose here to use object-oriented approach while developing JSF pages. For this purpose we can use JSF components which are totally object-oriented. Because they are Java classes. But you have to use text which will automatically be processed with the corresponding Java classes.

Maintaining a state across HTTP requests, it is also going to be very easy for you. So some data you'd like to hold on for the session state, you can.

JSP knowledge, by using JSP-like tags and unified Expression Language that means if you have worked with the JSP, you're going to have those knowledge we use here while developing web applications. Because JSF tags are similar to JSP-like tag. And we will also use Expression Language, which will be similar to JSP.

We see that advanced type of conversion and validations that is also benefits of JSF in case you'd like to do some modifications and conversion logic, validation logic. You'll be able to do it by creating your own conversion and validations component.

Powerful page navigation again is going to be one of the benefits of JSF that lets you navigate from one page to other page. And that can be possible using dynamic page navigations, static page navigations, programmatically way or you can do it declarative way using descriptive file.

JSF says that to bring consistent look and feel you can take the help of a page template. So you create for the page template, and design the pages that what you want to have on the top, on the corner, on left corner, right corner, at the bottom as a footer. And then you can implement those templates across multiple pages to have a consistent look and feel.

JSF is designed to be extended, enables creation of custom components. You can have custom components created. You can reuse existing components and modify their behavior, using extensions of existing Java classes or taking the help of the API.

As I said earlier that we may need to go for internationalizations. It is web applications. And you may have a client across the globe, and you want to show them information in their-- regional languages, in Chinese or Japanese. You will be able to do it just by creating a simple resource bundle. It supports internationalizations. And of course AJAX is going to be one of the important features of JSF that you'll be able to add it on the page with simple tag.

JSF 2.0 new features say that AJAX tags and framework, see that's what I was telling to you that you can have AJAX tag as a part of the framework. And you can use this tag to AJAX-ify your page. JSF provides a faces-config.xml. It is a descriptor file that can be useful to let your Bean component get registered. And of course for navigations, you can also take the help of faces-config.xml.

Once we start JSF pages developing applications, you will see that most of the time you're going to use POST request, which will not reveal any information in [INAUDIBLE] bar. And thus, you will not be able to bookmark the page. But JSF 2.0 introduced ability to bookmark the JSF pages. In case you like to you can convey this information through the configurations or through the programming. Let the page expose some information into this bar, so that you can bookmark and save it for later purpose.

New default page templating framework, which we say Facelets is available, and intelligent default for page navigation rules that you can get benefit with the JSF 2.0. It's a quiz to say select three benefits of JSF. Object-oriented approach, enhanced database access, powerful page navigation, advanced type conversion and validations.

So the answer is going to be A, C, and D.

There's a first JSF page, this .xhtml file that you can create in your web application for the JSF which will look like this. See that it is totally XML and HTML. We use xhtml syntaxes here for building JSF pages. And we also use some of the JSF UI components, which is from this name, this page http://java.sun.com/jsf/html.

Remember if you're using the new version of JSF that is JSF 2.1, with Java EE 7, this is going to be changed. I'll tell you what it is going to be, JCP, JCP let me change different color, going to be jcp.org/jsf/html if you're using Java EE 7, for Java EE 7 with the new version of JSF 2.1.

But with JSF 2.0 you have to use java.sun.com. Just keep this-- note it somewhere. See that. Here we have the page that says head. It is server side components, body, server side components. So entire page is going to be with the server side components which will be processed at the runtime. Those components which are not from JSF, like html components, let's say title, it is not going to be processed at runtime.

It will be-- straight away going to be merged with the response at the time of render response. Render response, it is the phase where it translates the JSF pages into xhtml and renders them back to the browser. So HTML components will not be part of page processing. All those components from JSF, UI, that is server side components, they are the part of the page processing. We'll see why they have made this head at the server side components. Sometimes you have to include Java scripting. And that needs to be referenced to the JSF components, which will be automatically translated back to HTML. We may put them into head.

If you like to use CSS files, then you can use it here in head. Import them, include them in your JSF pages so that you can have this title sheets added on your page for better look and feel. I thing that's the same, repetition of the same quiz.

Three benefits of JSF, object-oriented approach, enhanced database access, powerful navigation, again it's going to be A, C and D.

That's what are the structure of the JSF applications. When you build the JSF applications, you have web.xml. It is a web descriptor file, faces-config.xml, it is the part of the JSF. Any configuration that you like to convey to the JSF components to the pages, let your custom components be registered. All you're going to do it here in faces-config.xml. Which is, of course, optional. Most other things you can do it with the help of annotations.

Faces Servlet is the controller. That's why we don't need a servlet to write the control logic. It is going to be there always a part of the framework. JSF pages, you have to create it. Managed Beans .java, it is model components which will be used to hold the data, submit the data, and take them for further processing in case you like to communicate with other model components or EJB components for the business logic. At the bottom you see that you have JSF libraries, which we'll take apart in JSF runtime processing.

MVC view of JSF applications, JSF uses MVC architecture, Model, View, Controller architecture. This architecture says that you're going to separate presentation logic, model logic, and the control logic. If you view this MVC architecture in JSP and Servlet, you have to create Servlet as a controller logic. But here FacesServlet, it is a default servlet which will accept the request from the browser, from the JSF pages. And it will be here used as a control logic. You do not need to write the code.

You just have to focus on the presentation logic. And in JSF pages you can use the UI components for designing pages, how your page is going to look like. UI components, like text boxes, drop-down list boxes, radio button, check box, you get can have those here in JSF pages.

With these components, when you're submitting a data, the data will be stored in the Managed Bean. And the Managed Bean can also help you for navigation logic, for validation logic. And of course it can help you to let your data be processed by EJB as well. EJB where you can have the business logic included.

JSF forms, forms it is where you're going to have the components which will be used to submit the data. You see the JSF form is very simple. Here we just have h form. There's no action. There's no input type, I mean method type. It's always going to be POST. Like in HTML see, in HTML you type h form, form, let me just type it here. In html you type form, and then you say action equal to, and specify here Servlet URL. And then use here method equal to either get or post, get or post.

That's not there. It is not HTML component, it is JSF component, the state of an h form. Always going to be post. Method is going to be post type. And action equal to MyServlet. No need to say it here. It's always going to submit your request to FacesServlet.

So I'll demonstrate to you how the pages are going to be processed a little later with upcoming slide. See that here, the UI component output label, for label which will show you enter your guess. Guess is going to be labeled. Input text, it is a text box. And the command button, it is a button for submitting your form.

Here we have the action. This action is useful for navigation logic. You can let your page, let your data be submitted to the bean component. This is a bean component, a managed bean component, which will hold the data. With this data, what you want to do with it, you can decide it here in the action, which is a method type.

If you see the JSF page tag, on the top, when you start the JSF page, you use HTML. It's HTML. But you here include name space URI for xhtml, which is form w.3, www.w3. And java.sun.com/jsf/html it is the name space tag libraries for the UI components, html UI components, those components which will be translated into html at the time of response in the generations.

JSF Tag Libraries, they're server libraries that we can use for different purpose. jsf/html, it is going to be the main library that you will use most of the time to have JSF HTML tags which will be rendered in HTML, back to the browser. And show you components through which the user, end user will interact with.

We have jsf/composite, a tag library that helps you to build composite components. jsf/core libraries are there, which will help you to include any validation-related tags. So that you can check whether your number entered is between 10 or 50 or not.

Facelets it is useful for templating purpose, for creating paste template, you can jsf/facelets. And apart from this, you can also take the help of JSP-provided jstl/core library, and JSP-provided jstl/functions that can also be used in JSF pages.

Tag library documentation, this library documentation will help you to understand available components, and particular JSF specifications. And you'll be able to find available attributes. You can see here the entire details how you're going to use them on the pages.

Managed Beans, managed beans are JavaBeans. They are Java classes. Just like simple Java classes, you can have JavaBeans here containing attributes, which we say a few members can be used to get the data, submit the data from the pages. And here you can have also action process and logic. So when you submit the form, what do you want to do? You can write those logic. And you can also include validation logic in this managed bean.

The JSF user interface interacts with the managed bean. Remember, JSF pages, when you submit the page, they talk to the managed beans. All those information that is submitting will be stored in the managed bean. And how the page is going to be bound with the managed bean, it is using unified Expression Language, EL.

Let's see here. If you have components, input components, you will get the value attributes. And the value attributes you need to type here, pound symbol, to start with EL, braces, bean name, and then bean properties. Remember, when you create a managed bean, have a few members, and have setter and getter included.

There's a main logic. When you submit the form, it is going to call setter automatically so that the submitted data can be stored in a bean object. When displaying your form, it is going to call getter so that it can read the data from the managed bean object, and merge them with the components to be rendered on the browser.

Command button, see the command button, action. Again here we have the EL. And EL, with the EL, you can bind your button action properties with action processing logic. The check answer is the method that contains action processing logic. Value equal to submit, if you want to read the value from the bean properties, you can. Do this same as by typing EL and the bean properties name, or the state where you can type some text that will be displayed on the browser for the buttons, some method.

Now if we see that here, a purpose of a CDI bean is to, a, let's say render HTML for client view; b, validate input values; create a view tree for the client view; and maintain data for the client view. Answer for this is going to B and D, validate input values and maintain data for the client view.

The data that you submit will be stored in the managed bean, which you can use later on to display on the pages maybe on the same page, maybe on a different page. You can maintain the data for a single request response cycle or for the session, or for the whole application scope.

Now we will do the Practice 1 from the Lesson 2. All those practices that you have to do, it is there in activity guide. Why are we going to start with the practices? Because we need server to be configured so that they can create applications, and we can play with some examples as well.

See that here. We have the bookmark in activity guide. Practice 1, there's no practices in the Chapter 1. We will start with Practice 2 from the Lesson 2. This practice, 2.1, we will first configure our NetBeans to have a WebLogic Server integrated.

This practice says how you're going to perform integrations. So if we read the practices one by one, you have to start NetBeans. Go to the Servers tab, Server, Add Server, and then they want you to select WebLogic Server from the list. Find this path. Or you can type it, or you can use the Browse to locate it. And then you will see that your WebLogic Server is going to be integrated.

You also have to provide the user name and password. That is WebLogic, and welcome1, respectively. All right you can, once it is integrated you can start the server. And you can be test it by opening a console application, which is useful for administrations. We're not going to do Administration. But yes we can open this page just to check if our server is started properly or not. That's going to be your Practice 1.

I'm going to demonstrate it here how you will do this. So once you get here to Services, you open the NetBean and you have project file services. If they're not there, you can find it from the window. In the Servers Tab, you have to use Server, Add Server and then WebLogic Server.

Go to the Next. Find the location. As they said in activity guide, it is there in d drive. WebLogic I think here in WLS Server. Just say Open. Continue Next.

Domain, we have to find the domain as well. See that in activity guide what is said domain will be. We can go back. It is going to be d WebLogic domain. Right? So we'll do that here, d drive, WebLogic domain. Open it. User name by default WebLogic, that's good. And you just type here password, welcome1, and say Finish. Your practice 1 is now competed.

You can check it. Just wait for a minute, for a second. All right, right-click, see? The start is now enabled. You can start the server. And once the server is started, you can right-click here and check if your Admin Console is working or not, just to make sure that everything is properly configured.

So wait for some time. You will see here a notification that says server is started in running mode. And once this is stopped here, this process is stopped here, here you will see a green arrow like here. See? A green arrow, which is right now grayed out. That means your server has started, WebLogic Server that we will use to have our application be deployed.

See now, it is green color. Here also see a tiny arrow, rectangle arrow. And just now you can say view Admin Console. It is going to open browser page, Admin Console page. So when you open, this is Firefox that is going to be your default browser. You can close all those additional tabs which are open by default. Just close them. This will also close them. This is your main thing here.

And let's close this first one as well. We don't need it. Now here you can type WebLogic welcome1, and see that you're able to log into Admin Console. We don't have to do anything there. If that works that means your server is properly configured. And you're ready to go ahead with some examples and with the practices from the Chapter 2, second activity, third activity, onwards.

An example for the JSF applications, this example will let you understand that how JSF pages or applications are created. We're not going to create the page right now. We're just going to have a look at how an application is actually created. How it's going to look like? What are the components that you have on the page? And the binding with the managed bean, we're just going to realize what is managed bean, what is a JSF UI component. We're going to see the code, and how it is going to take your request, user request to process the logic.

So this is the example where the server side component which we have is generating some random number between 1 to 100. And we have to enter here some number, so that it can be either less than or greater than, or it's going to be the same as generated number. So you just have to guess the right number which will be generated at runtime by the server, just kind of play.

So I'm going to take you back to the remote desktop, lab environment so that you can see the example. With the Practice 1, 2.1, you already have configured your NetBean with the WebLogic Server. Now you can-- I'll reopen this. You can go to File, Open Project, and Open a Project. From the example folder.

If you see that here in the d drive you have a Lab folder. This Lab folder contains folders, subfolders, and their name based on your lesson, Lesson 1, Lesson 2, Lesson 3, Lesson 4. Each lesson, we see that Lesson one there's no practice, or example. No practice. So Lesson 1 we didn't have any practice. It was just introduction.

Lesson 2, right now we are moving on. And the example is listed here. Open the example. See we're all set now. You're going straight away run it. Just run it. This run will do what? It will deploy your applications on the server, and also open a browser with the first page. Or you can deploy it first. Let's say deploy it.

So either you can use run, or you can use deploy, and later you can run it. So I said what? I said deploy. It is going to be deployed on the server, WebLogic Server. See that? Same deploying guessing game, your applications.

Deployment completed it says. Application is started. It's starting guessing game, and the startup completed. That's where here display the URL for your application. You just copy it. I just copy it. And I'm going to the browser and here open a new tab type the URL. Since I just copied it to clipboard, I can only paste it here. If you want to type, you can.

It's going to be a CTP local host, port number 7001. Once you type it here, local host 7001, guessing game, it's going to open your first page. First page, and see now I'm going to enter here some number, 10. It's says too low. If they're setting the value, we will check the code, how it is created. And then we'll come back and see how it is going to be processed.

In guessing game if you see that here, we have pages. All those pages goes under web pages, index.html, one single page. And since single page contains form, has output text which in fact a label that displays information here. I'm thinking of a number between 1 to 100. Output label, its label into your guess. That display here, label.

Input text, text box, the number that you type in here will be stored in this guessBean.guess. What is this GuessBean? It is a managed bean, which we said CDI bean as well.

If you go to this, see that. A guessBean.java, it is a managed bean class. CDI bean, if you've see this annotation, it is going to be CDI bean. I'll tell you what is the difference. And there's two terminology, managed bean and CDI bean later on.

But this is just a bean. It has two properties, answer and guess. And see that we have setter and getter. Setter and getter. they are properties. And remember what I said that when you submit a form it is going to call setter. When it's displaying the form, it is going to call getter.

Check answer, it is action processing logic. It's a method that contains action processing logic, what you want to do with the data they have returned here, the code. To say guess equal to answer. Congratulations, you guessed my number. If it is less than, greater than, too high, less than too low. And this information they displayed it on the browser with the help of FacesContext that we will see later on in details.

Here there is a method, reset. Reset is the method which is invoked automatically first time when the managed bean is going to be instantiated. This GuessBean is going to be instantiated automatically whenever you generate a request. Request scope means for each request a new bean is going to be generated.

There's some error in this example. Because every time when you make a request either from the address bar or by clicking a submit, it is going to give you the new copy of the GuessBean. I'm just going to change it so that this example will work. Make it session is scoped-- session is scoped that your bean object is going to be there in the memory for the entire session. It is not going to create multiple bean instances every time.

So I'll just make it-- session is scoped. And let's try and check it whether it works right now or not. So we just have to save this, save the changes. So NetBeans has a good feature that whenever you make changes in your application, and application is already deployed. It is going to redeploy it.

But sometimes it didn't work. You may clean and build applications which will undeploy the applications. And then you can deploy once again. Once it is deployed, I'm going to make a first request from the browser. See I'm generating a new request, and say enter your guess, 0.

You know what happens at this point, when you make a request this is bean instance has been created. An object of this bean is created now. Well the initial value of the guess is going to be 0, because it has invoked a reset method.

With a PostConstruct, which is known as lifecycle callback annotations, this helps JSF runtime to know which method to be invoked at the time of instantiation, just after instantiation. I will call this method. The guess is going to be 0. And answer is going to be some random number between and 1 to 100. This is random.nextint. Generate any number between 1 to 100.

What number it generated just for testing purpose, they have included here system.out.printIn, which will produce the output on this WebLogic Server log file. That you can see, that the last one is going to be 12.

Let's submit this and see. It should not regenerate this. For the entire session should have the same number. 12 is the number right now. We will try to enter some number here, 3. Submit. Too low. Well, see now, it's again reset to 0. That had generated multiple instances. So some problem with this example, which will fix it. Just give me a second. We will fix this.

You will be able to understand why I'm changing this a little later when we talk about CDI beans. I just right now say, Fix Import, and I'm going to take the help of this one, and here I'm going to say implements serializable.

Not to worry, why I'm saying this all not to worry? Because you will get to know all those things once we start CDI beans. It seems now OK. And have it can retry. Save it. And this will redeploy it. See it is redeploying it. I'm now going to say Clean and Build. We will try it. Let's see now.

The last number which was generated we'll just clean this all. Do we have options? Yeah. Clear. Let's try once again to check it. It is going to be too low. 45? Too low. Let's say 60. Too high. I think it was 59, right? As I submit, congratulations, you've guessed my number. The last number, which was generated, it was 59. So that is the case. It's going to the same for the entire session.

But when I call reset, if we see the code on the reset here index.xtml. The reset button is invoking a method from the guessBean.reset. When I click it, it just calling guessBean.reset. Which was actually invoked first time at the time of instantiation with the help of PostConstruct.

But now on the click, I'm invoking this method, and resetting the value of guess to 0, and generating a new random number, which will be printed here in the WebLogic log. So that you can check what is the number actually for testing purpose. Try it. See now? It's 0.

Go back, number is 1. That random number generated. Try here something. I'm saying, 5, submit. It said too high. What number you enter from the page index.xhtml, you could see the page over here. The number that you enter that goes to guessBean.guess, when you submit, it calls setter. And the setter updates the value of the guess.

Set guess updates the value of the guess, that has right now value 5, which when you click on the Submit, you said check answer. And the check answer here comparing the value. Number 5 is greater than answer, which is equal to 1. It said too high. And that was produced as an output here.

Same page is the re-render. It said too high. I'm going to say here 1. Congratulations. You guessed my number. So that is the example. We will understand the whole example, how the page is going to be processed with upcoming slides.

So moving on to the next slide, here in the PPT, that's what I explained to you. How this is going to be processed. You have these all components. And they are bound for the managed bean properties. So when you enter, that goes to the managed bean. And when I click on the command button, it is actually going for action plus some logic, and deciding what to do with the data, checking it's less than, greater than, or equal to with randomly-generated data. And accordingly it is going to display the output.

These are the examples of your GuessBean. GuessBean, which is in fact a CDI bean. So you can say they are managed bean as well. We must have a default constructor for this. Because the beans are going be instantiated by the JSF runtime.

You can have setter and getter over there. Setter and getter will make them up properties which will be used at the time of submitting your data, and the time of rendering the data back to the browser. See that there's the whole logic that you have seen at the time of demonstrations, containing the logic checking, it is less than or greater than. And the information that you'd like to display on the browser, you have included this with the FacesContext. What is FacesContext? We see that later on.

Reset is the method that is invoked automatically the first time with the PostConstruct. And of course it is going to be invoked when you click on the button and reset. Now we say deployment descriptor, if you go back to your example here, and see that deployment descriptor files, [INAUDIBLE] XML, it has here Servlet Configurations.

Javaex.faces.web faces servlet is my controller. And it says loan on the startup equal to 1. All the requests that you make from the browser using the URL faces/something, asterisk means anything that you type, will be handled by FacesServlet.

This FacesServlet is responsible for starting JSF runtime. It is responsible for the page processing. Well we have some failures with the life cycle of JSF pages. And step by step it is going to process the page. You will see how the page is processed. Well that is the main point. All the requests that you type it here, saying faces.indexed.xhtml, it is first going to communicate with the FacesServlet.

So I can say that here when we make a request, first time from here that goes to application server, which has FacesServlet. So I can say here we're going to have a FacesServlet. You know, the FacesServlet must be there available in your container. If it is not there, the page will not be processed. Because that is your controller.

It is mandatory to have a FacesServlet. It's a part of the JSF-- it's the soul of the JSF applications. The type request that goes and contact with the FacesServlet, And the FacesServlet does what? It starts the page processing. It's starting the page processing.

We'll see how the page is going to be processed. This is why if you see here, if you see that, your web.xml, if you go back to web.xml here, you can see in this case, it's says load on the start of 1. It must be there. This means you're instructing the container that as soon as you deploy your application, it should immediately instantiate FacesServlet and make it available. So that once you make a request, it will be handled by FacesServlet.

All the requests which will have this URL, will communicate to the FacesServlet. So if I say here faces in the direct system URL, we're going to see here the page of rendered in html. If you just remove this, faces and hit Enter. You see nothing. If you right-click and see the information, what you get as rendered, you see the entire idea JSF component, which was typed and xhtml page is rendered without translations.

And since the browser does not understand what is as body, as form, you don't see anything here. You just see here guess the number game on the top, at the title, which is pure html.

But if you use your faces, then you have the JSF run time has started. Because you included FacesServlet. Enter. Now you right-click and see what you have. The source, you have the complete HTML, which was processed by the JSF runtime.

Let's continue with the next slide that's what here to say Life Cycle. Do you say that when you make a request first time, what happens? When you make a request first time for the JSF page, it communicates to the FacesServlet. FacesServlet in fact is creating a runtime environment which we say FacesContext, under which a page is going to be processed.

What we say, Life Cycle. The life cycle for the page processing is going to big and we have multiple phases. I think there is six phases which involve to let your page be processed. This is a list of the phases in the life cycle. Create/restore view, apply request values, process validations, update model, invoke application, and render response.

Let's see how they are going to be processed. I'll explain this with the demonstrations. We will take care of all those things with the demonstration, how it is going to be a processed. Go back to the page.

## Introducing the JavaServer Faces (JSF) Technology….Part 2 - 28m

I type here http://localhost_7001/GuessingGame. Even if don't hype anything, by default, it is going to be your index.html. See that? Web.XML. You'll see the default pages index.html. We just say Guessing Game. Let's type completely, faces/index.html. Your request is going to be handled by the Faces servlet.

Let's understand that a slide of what they say. We make a first request from the browser that's communicated to local host of Application Server WebLogic port number 7001, which is your web container where application Guessing Game is deployed. That's this rectangle I can say representing my application server-- WebLogic Application Server.

But we already have a Faces servlet. We already have a Faces servlet over there. You know that? As soon as you deploy applications, it's going to be instantiated. And since it's using faces/index.html, it is going to communicate with the Faces servlet first, all right? Faces servlet-- which will do what? Create a FacesContext runtime environment for your page to be processed. I can say this is a runtime environment which was created.

Just give this name to FacesContext. Life cycle is going to be started now . You have requested for index.html-- the first time, what is it going to do? It is going to create and restore view. The first request-- so it is going to Create View. So first time, first request, Create View.

Now, how does it know that it has to create or it has to restore? The first time is going to make a request for the page to be displayed on the browser, the request is to Get type. Any request which is generated from the editor's bar, it is Get type-- Create View or Restore View. So we're just going to go with the Create View first.

What happened to the view structure? It reads your GS sub page. The whole UI component that you have here, it is going to create a component restructure, which will start from the Page View. Your page is an instance of UIViewObject. Inside the page, you have head, and you have the form. Let's start with the form, which we have to understand.

Within the form we have our UI Components, so I can see here the form, which is an instance of UI Form-- UI Form -- Java Class, an object of UIView that represents your page, and an object of UI Form that represents your form components is all going to be created. And under that, you're going to have a label, output text, output text, output label.

You're going to have here output text, output label. I can say input components, Submit button, Reset button. The structure-- I'm just generating the structure. It's not going to be the same. But it will have the hierarchical structure. Right? So let's say this is hierarchy that's going to be generated.

The component tree structures-- we do not have enough space here. So I'm arranging this just like this. And this is what your output text-- you can see this is a UIOutput. Again, this UIOutput. UIInput, which represents your input components-- input text. UICommand, which represents your command button. And then we have UICommand one more, right? Two command buttons.

Generating the tree structures-- that is the Create View. The next time when we revisit the page, it is going to restore the same view, right? First phase. Now what happened after that-- after this first phase, it will immediately to go to the last phase-- the last phase where it will go to the last phase that is Render Response.

The last phase-- it is Name As phase number 6-- Render Response because it is a first request. Get request-- first request-- it goes to the last phase. And remember, when you generated a request the first time, it has also created an instance of the Managed Bean-- your GuessBean, which I will show in different color. An instance of the Managed Bean is created somewhere in the memory.

Let's say this is representing my GuessBean And remember, GuessBean has two attributes-- Number and Answer. And what I said at the time of demonstration, as soon as instance is created, it is going to call the method. Reset because that has annotation at post construct, which will generate a random number. And the random number, whichever it is going back to the value for the answer, right? The value for the answer. Say it is Answer.

The first one is Guess, which will be equal to zero. And Answer is going to be some value. I can say a question mark, some value, random value. At the time of Render Response it is going to translate the page into HTML and while translating the page, it will call Get from the Guess pane.

All those components that you have binding with the Bean properties it will call Getter. Get Guess-- for this we have GuessBean broadcast value pointing called Get Guess, which is equal to zero and let's change this one. From there, it is going to render a response back to the browser.

So you see what it is translating-- Page into HTML. I also am calling Getter from GuessBean. And the value of this is going to be merged with the appropriate HTML response. So the first time when you make a request here, you're going to see zero.

Should we try this? We will save it later on. It'll just stop it. And we'll make a request, right? It's not a [INAUDIBLE], so we can try this with the first browser. Let's take [INAUDIBLE]. And press Enter immediately.

That is going to process the page, and you will see the page render. OK, let's do that. Here you go. See the zero. That's what I explained to you here. Zero. The next time I'm going to type here something, you can check what is the answer generated. We can go back to our page here and just check what is the answer-- the number is 5 right now-- random number 5 is generated.

So let's try this. And now what we're going to do-- we're going to type in some value. Let's assume that I'm typing some value here. Let's set 3. And then I'm going to hit on the Submit button. Hitting on the Submit button generates a post requst, remember? And the form, by default, it is the post.

It is a post back-- request. Post back will do what will continue the page processing. This time, it is going to start with the page life cycle, Restore View. The same view is going to be Restore. And then it's going to start with the next life cycle phase that is number 2. It is Apply Value.

Now, what happened in this phase Apply Value it is simply applying the value that you have submitted to of the component state. Each object, each component that have it here, they are Java objects. And they have the state values. So what you submitted here-- it is going to be stored with the component state. I can say a different color.

The UIInput this time is going to be equal to the value attribute of UIInput is going to be equal to three. Similarly, UIOutput what were the values there . I'm thinking of number-- enter your guess. UI Command Value, Submit, Reset is all going to be applied.

OK, value is equal to 3 that you have submitted, that is the job as here down in Apply Value. So I can save that as Applying the Value-- Apply Values to Component State. Often what would happen-- it is going to process validations. We do not have any validation right now. But I will just include here the phase, which will be processed not [INAUDIBLE]. If there's no validation, nothing is going to happen.

Validation phase-- the next phase is validation. OK? Number 3-- in this phase, it will validate the data. But before validation at the time of Apply Value, it will go for conversion as well, conversion. Conversion will be applicable in this case. All the data that you summoned from the page browser which in fact is a string type. And say it is a string type, which will be changed to the respective data type.

How do they know what data type? It's with the value binding. The value binding here-- it is with the value Guess, which is a type. And this time this is going to be changed to the integer. That happens at the time of Apply Value. We do not have to do anything for conversion when the value is going to be getting to be changed to Java primitive type or a string type, right?

So nothing to be done. It's automatic. After that, it is moving to the validation. I do not have any validation attached to my presentation logic. So it will continue to the next phase. That is Update Model. So this lecture is a little longer because you have to understand the processing. And once you understand this page processing, then this little thing is just going to be a piece of cake for you. You just need to know what are the tags, and where to write, when to write, how to use them, how to implement them.

So now if you see that here, the next phase number four is Update Model. And Update Model is associated Managed Bean will be updated with the value which was applied on the component estate. It will call-- this time it is going to call I will-- this is going to call GuessBean.

For all those components where you have value binding, it is going to update the model-- Calling Setup for Value Binding. The value which was on the component three will be updated into the Guess. Now Guess at this point is going to be equal to 3. That's going to be 3. We can remove this. It's now 3. After you know that, the answer is now 5, right? We have checked that. It is 5.

Now, once it is done, after update model, updating the model-- it will continue the next phase number 5-- number 5 phase that is in fact Apply Value-- Apply Value phase number 5.

In this phase what happened-- it is just going to call your event logic and your application processing logic-- action processing logic. All right? So here it is going to call Action Processing Logic, which we have right now under Submit button, Action equal to recalling the method where we're comparing the value, action processing logic will be involved, right?

If you have any events-- lets say the value change event, any events, that will also be involved. So first, it will go for event processing-- a value Change Event, any Action Event, which we will see later on. I just type it here for your future reference. And at the end, it will call Action Processing Logic where we have some code written.

In fact, we can also decide what pays to be redirected to. OK? Right now if you see the action processing logic, if you go back to your code, I'll stop it, go back to your code, and see the action processing logic here. And the Guess is Check Answer. Remember, you're going to hit on the Submit button. And the Submit button, an index of HTML, action equal to check answer. It's called Check Answer. And the Check Answer returns nothing-- void.

That means you're going to stay on the same page. We will see how to return some values that later on when we have a topic to discuss navigation. But right now, just going to stay on the same page. And here have some processing logic to check the number is less than or equal to. Remember that we're going to hit here 3, which of course is going to be less than the number-- random number generated 5. And it's going to say, Too Low, which will be attached to the phases context. That is your memory under which your page is running. And that information will be the part of the Render Response.

So let's see. After that, it is going to call Render Response. And the Render Response will display the page along with the messages. See that? It's 3, the number here 5-- too low, right? I'll just stop it, try here 3, Submit, too low.

See the code? One more time. This picture-- one more time. If I say here 4 or 5-- if I type here 5, all [INAUDIBLE] the model will be updated with the value 5 answer remains with the 5-- 5 equal to and the time of action processing logic, you determine the value, the respond that you attached has to the phases context. And the same page is rendered with the messages attached at the bottom, which will say, Congratulations.

Let's try this. And here's a 5 Submit. All the messages that you attached to the phases context in action process logic that get attached to the bottom of your HTML response. So that's the way your page is going to be processed. But one thing here you need to understand that if you have any error while processing the page, I'll included here in this picture. Any error, I'll take a different color. Let's say maroon.

And if there's any error at the time of conversion-- at the time of update model, at the time of validations, you will move to render response. So if any error here-- conversion error-- any error the time of validations, update model, you will move to render response immediately. The same page will be rendered along with the error messages.

Remember, JSF runtime as capable to handle the runtime exception error. And the messages would get attached in your response. So here I can type, On Error.

All right, I will save it for the future reference so that I can-- I don't need to redo this all. I can save it somewhere in the desktop-- life cycle. Save it. So if you go back to the PPT, that's what here they explained. They say, convert phases to UI component 3 in the initial view. Restore the previous UI components tree in the postback.

Apply data conversion, for example, String to int. Apply JSF Bean validation for process validations, updating model values, UI Component data to be Managed Beans via EL, and then execute action methods. Not only action methods-- any event handling methods are all going to be processed at this time. Render Response-- read the data from the backing bean, which in fact, is your Managed Beans and generating and sending the output back to the browser.

This is what here they explain as the BY step. The first time I'm going to make a request from the first phase, it is jumping to the last phase and rendering the response, the same page will be re-rendered. It will not go for reply, request, process validation, update models, and invoke application.

But the second time when it generates a postback request, it will continue with each step, each phase, one by one. And that's what I explained to you with the demonstrations. At any point if you have error at a time of conversion-- at the time all validations-- you will jump to Render Response. And the same page will be rendered along with the error messages.

Quiz for us-- given the JSF Facelets is displayed and the user entered data on the form, which life cycle phases are executed when the user clicks the Submit bottom (assuming no conversion or validation errors)? All right, so you need to guess. Assuming no conversion validation error. And what do they say? They say when the user entered data, that means postback request. In this case, it is going to process each phase, A, B, C, D, E.

Whether you have conversion or no validation error, there was a logic, validation logic. You have it. Don't have it. But it is going to parse it A,B,C,D,E. No error, that means it is not going to jump and skip the phases-- A,B, C,D,E. That's all about this chapter. I took a little time here to explain the phase life cycle. That will save time later for understanding the rest of the topic. So thank you.

## Activity01 - 16m

So we're going to do the practices here, Practice 2.2. And in this practice, we have a Simple JSF applications. It already exists, and we will open it, and we will explore the content. We will understand the JSF framework, and the structure of JSF applications, deploy it, and run the applications. I will try to understand what's going on there, once again.

So the first step, here, they're asking you to open the project and expand the web page folder to see it is going to look like the content. You can see the content here. The [INAUDIBLE] bean object here. And thereafter, they want you to export the content of the WEB-INF folder to see the deployment descriptor.

The source package, you will have Java source file. Libraries, note that they want you to observe JSF libraries, configuration file if there's any, and open index.xhtml. Understand what's going on over there. And once it is done, you see that how they have done the page binding. And once you click on the button, you will be redirected to the next page, greeting.xhtml. So we need to understand how the redirection happening here in this existing application.

We will do here-- let me just close this and reopen one more time and discard everything. So File, Open Project, the Practice 2 folder in the Lesson 2 on the left, you will find Simple JSF. Open this. Once you open this, you're going to get your index.html, greeting.xhtml, user.java. If you're not getting it in right hand side, you can double click on the content on the page, and get it open here.

So that's going to be the structure of your applications. In the source packets, com.example, bean is the package. We have user.java. We have two pages, and the library is part here. You see that they have Oracle WebLogic server that is Java EE 6 implementations. And in this server, you have the JSF API available. If you go down, you will find here JSF API available there.

Now, if you open index.xhtml, after this, what they're saying is the first here you have JSF HTML URI. So name is page URI, what we say is a tag library, which will provide JSF components to be used here on the page. Prefix for this is h. It is general convention that we use h, but it's your choice. If you want to change it, you can change it to something else.

Programming convention we use h. That represents HTML. Whenever we type h on the page, and say h:-- see that-- it is going to give you the list of the components available, which you can use on the pages. Like hidden components, password components, text boxes, text area, link, form, data table, command link, command buttons are there.

So what this said, we started with the form here, and before the form, they have here, html, which will not take a part of JSF page processing. Only JSF components will participate in page processing. Page processing means the life cycle, which I explained to you earlier.

They have here little text type. Please enter your name. You can, and input text. Value attribute is bound with the main properties of the user bean. Go to the user bean. It says here RequestScoped. RequestScoped, that means every time you make a request, a new instance of the user is going to be created. The previous instances will be discarded means will be a candidate for the garbage collection.

What is the name that he used in the binding? Default name is going to be just like the class name, in lower camel case. For example, in Java programming, when you create an instance, you create like this, user, user equal to newUser. This instantiation is done automatically by JSF runtime. And this is the name, which is in lower camel case, same as the classname. Only difference in the case, lowercase will be used to refer to that particular object instantiated by the JSF run time.

However, if you want to specify some different name, you can here type some other name. You type in your name. This is going to be name, like that. Since in this application, they have not typed anything, it is going to be default, that is, user. Remember, this part is just for understanding how the instance is going to be created, and what will be the name, reference variable name, to refer to that memory, that object.

This is what the name that you will use here for the binding with the EL. So when I type here pound symbol base is bean name, and then you can take the help of bean properties that you'd like to get it associated with the value properties. They have here new line, and then they have one more command button UI component, value, summit, literal, and action. See, what they say action? Greeting.

Remember, in the previous example, guessing bean, you have invoked a method that contains action processing logic. But in this case, we are not calling any action processing logic, just specifying the name of the page that we like to navigate to. That means when you click on the button, a page processing will start. At the time of invoke applications, a page that will be rendered back to the browser will be greeting.xhtml.

Greeting.xhtml, you don't need to type xhtml. Just say the name. This is known as static navigations. It's always going to be greeting. So here, see, what they say, they say in greeting.xhtml, they're saying welcome, bold, and they're using EL user.name.

This page is going to be rendered. At the time of render response, it will call user.getName. What will the value that user.name properties has stored will be displayed. And remember, in index.xhtml, you're going to type the name. The name that you submit will be stored in this [INAUDIBLE] bean. And this [INAUDIBLE] bean is used only one request response cycle.

What they want next, you to after once you observe everything thing, the content, they want you to clean and build, deploy, and run. When they say run from the application, from the net bean, it will open a default browser and will initiate a request automatically and open the page. You do not need to type it. If you want, you can also type them.

Let's go back and say clean and build. And now, you deploy. Expand it. If it deploys, it's deploying your applications, it's [INAUDIBLE] simple JSF. Now, it says startup completed. Now, you can run. Right click and run.

If you want, you can type this URL on the browser. If I say run, it is going to open default browser. That is Firefox. Initiate a request, and the first page that is index.xhtml is open. Remember, index.html is the default page, which is listed here in web.xml.

So you type here a name. Let me type my name, Nathan, so that you people remember my name all the time. Click on Submit. Submit will do what? It's a post back request. Remember that. It starts the processing. And at the time of invoke applications, action equal to greeting. Means it will get to know the next navigation will be greeting.xhtml. Render response will be done with the greeting.xhtml.

See, the URL is not changed. You know why? Because it is server-side reactions. The server, application server where your application is hosted, JSF runtime page processing is responsible for redirecting from one page to another page, which we say navigations. You navigate it from the server side. The response is from greeting.xhtml that say Simple JSF 2.0 Applications, which is, of course, a title, as well. And Welcome, Nathan. Remember, that was we have entered.

This request you regenerate one more time with one more browser, see? Same browser. If I type it here-- all right, good-- so we type it here and say index.xhtml. One more request, and this time, one more instance of user.javaclass will be created. And that's why you see here it is blank, because it gets nothing. Your value is initialized with nothing, null. It says here, this page you type here, some other name. Let's say Peter. And say Submit. It say Welcome, Peter. You can redo it here, but remember, every time, it is going to create a new instance.

Well, if you want to explore and see what's going to happen when you say session, I can make a little change here. I can say session is scoped. This change it request to session. Fix Import, and select javax.enterprise.context session is scoped. For that we need to implement selectable interface. This is what I'm trying. It is additional to the practice. Just to realize [INAUDIBLE] is different between the RequestScoped and SessionScoped. You may try that when you do the practice, as well.

Save it. Clean and build, and retry. Clean and build. Clean and build. Deploy, and Run. Do this. A page is opened. Type here, once again, that name Nathan. Submit.

Take this URL and initiate a fresh request from another tab on the same browser, and see the text box is showing the name Nathan, which was entered earlier, because we're using the same copy of [INAUDIBLE] bean. SessionScoped. It was RequestScoped It was blank. If you initiate the request with the new browser, it means a totally new session. It is going to be blank. That means a different copy because it's a different session. That's the practice 2,2.

## Activity02 - 14m   

Let's continue with the practice 2.3. 2.3 practice is   going to help you to create a first HelloJSF web applications. Simple web applications. And what they want you to go to NetBeans File, new project, Find Java Web select Web Applications, and click on Next. Give the name HelloJSF. You wish to store them into some folder, they already have created a folder for you. All right, that folder you can select it. Or if you want different folder, you can select different folder.

So that's going to be the screen, HelloJSF. Here you have to specify the folder where you'd like to store the applications. Select appropriate Java EE implementation server. And we can continue with the next one saying here, there's the framework. I'll show you this, and then I'll come back to Activity Guide and we'll continue with the rest of the part of the practice.

So first of all, we'll [INAUDIBLE] everything. Just to avoid confusion, because multiple applications they're going to have the same pages indexed as HTML. And creating new project. Java Web, Web Applications. Next.

You can say here HelloJSF. All right? That's the name that they want you to have it. HelloJSF.

See there, HelloJSF. Continue with rest of the part. HelloJSF, you can here select appropriate location. This suggest you to go for D drive, labs, chapter, chapter they have practice, practice three folder, that you can select it and then say Next.

We just have one server. So by default, Oracle WebLogic server Java EE 6. If you want to use CDI, you can enable it here right now. Or else, you can continue without CDI. It's not mandatory. So we will talk about CDI, and then you will start using them.

Set source level to six. That is what's recommended here. This is a context path. Context path, that means which will be used here with the URL. See? To access the applications, HelloJSF is the context. This time, you can attach JSF framework in your applications. Appropriate libraries supplied by implementation server, that is WebLogic server, will be attached. It has JSF 2.1. Finish.

And see now index.html is by default provided to you. If you see the web INF web.xml, you will find here all those configurations related to [INAUDIBLE] is already done. We do not have here beans.xml because that is useful for CDI. And we have not selected CDI to be enabled. No problem. Index.html is the page that is given to you. Source Package. There's no Java classes that you need to create it. Libraries, WebLogic server, API implementations for Java EE 6 are attached to you for the JSF.

Let's see the next. After doing this all, what they want you to do it, they want you to open index.html and do some changes. Type some title. Have some form.

We can do this all. We can have a title, the JSF version of hello world. All right. Let's see that. Title, we can attach it here, see. This is title. Remove it. And you can here type what they want you to type it. You want to type something different, you can type it.

So I'm typing JSF version of hello world. It's a title. What next? They say this is what the body, under the body you have form. And say please enter word command button value, go, action response. We'll do this all.

Type h-- these are by default included jsf.html tag libraries. So we'll straight away go and say h, and what you want to have? You want to have form. Have a form. Open. Close. Have spaces. And then type here literal string that they want you to.

What did it say? Please enter a word. I'll just copy it and paste it here. So it will take less time. But you don't copy and paste. Try to type it so that you can experience if there's any error while typing.

And see, I'm going to include h input text. When I say space bar, it is going to list-- give me the list of available properties of the text box. We say, v, we have value selected. Equal to, and we can use [INAUDIBLE].

Right now, we do not have any managed bean. We can instead type some variable that will be created in the memory at the runtime, this is going to be used for the requisite scoping. And just close this statement. It's XHTML You have to follow XML rules, all right? Every tab that you opened must be closed.

Please enter word-- h input text word. What else? After that, they say command button value go action equal to response. All right, just type it. H command button I-- this intelligent ID that is NetBeans, it will help you to complete your statement. All right, so value equal to they say go. Action equal to they want you to type response.

What is response going to be? Response going to the page, the next page that you like to navigate. We do not have a page, we will create a page right now. So next. Once it is done, you can continue with the next step. See that's your page should look like this. And here they have explanation what they're doing it with the word, its attribute name, which will be the part of default requisite scope.

And then they want you to create a new page. New, other. And you'll find here wizards where you can select the JSF pages, give the name JSF page response, all right, and then you can have a page created. Or the title they want, you can type it, and you can type-- you enter word with the [INAUDIBLE]. Run this, and check how it is going with. All right?

Let's create [INAUDIBLE] pages. And I'm going to say New. We do not have JSF here in the list. So JSF from entity classes. Leave it. Go to other. Select here Web, and see the JSF page. Give the name response of lowercase. Don't type xhtml. That is going to be default. We want to put them into web pages. That's the location. Facelets, and say Finish.

As well, you can type some title. If you want to type similar to Activity Guide, you can. So in Activity Guide they say something to type. As well you can type it, or you can just type whatever you want, all right, here in the response. Response of JSF hello world. You entered world, and then deploy and run this. OK. So we will see that.

I'm just going to type some title. Say response to JSF world. Type world, or whatever you want. Anything that you want to have a title. The purpose of to display the name that you have stored and the attribute that goes to the memory.

You enter colon, and then stright away use [INAUDIBLE]. And type word. All right. That's what they want you to do it. Can we verify? Yes. Want to say bold, you can attach the bold. And then you can go for deployment and test it. OK?

If you want to beautify, you can use your bold, italic, HTML formatting. You can use it. Once it is done, let's try this. Save it. You can say-- is the first time, you can say build. A WAR file is created, so web archive. Deploy it and run it. Deploy and run it. You run it here, it will open the browser, default browser, and initiate [INAUDIBLE] automatically. You don't want to run it, no problem. You just use this URL and type it in your browser. See I'm going to type it here. It's HelloJSF Enter.

It say here please enter word. Type here. This is my first JSF. Go. So you enter this is my first JSF. OK? So that's all the practice. Here they say enter [INAUDIBLE], and that is what he appended. So just try this, and good luck.
