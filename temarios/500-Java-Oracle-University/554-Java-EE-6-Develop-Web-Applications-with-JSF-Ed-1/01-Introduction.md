# 1: Introduction to the Course

   * Introduction to the Course - 13m

## Introduction to the Course - 13m

Hi. We're going to start with Lesson 1, Introduction to the Course. There are 15 chapters to be covered in these four days. The first chapter is about introduction. This is the curriculum part that we're going to start with. We will start with fundamentals and programming, all those things. And you're right now at this point, Java E6, Developing Web Application with JSF.

Pre-quiz. That means if you know all those things, it's going to be better. But if you don't know, we're going to teach you how to use CDI beans, how to create composite components, custom components, JSF templates, Facelets, navigation events, AJAX, and HTML5. All those things you're going to see here in this course.

So first of all, we'll see what is AJAX, what is Facelets. Facelets are actually the JSF components, JSF pages templating. And any third party libraries like [INAUDIBLE], we will see how to use them in our web applications.

Course goal is very simple, that you can start developing web applications first have a pages template, have some custom components, composite components using Facelets. We will see how to take the help of CDI named beans, process data conversion and validations, handle events in JSF web applications, and of course how to secure your web applications.

Objective of this course is to let you learn web application designing and development, and all those things through the JSF. So from the day one onwards, we will start using JSF, creating pages, implementing expression language-- that's what here they say EL, Expression Language-- and, of course, designing custom components using Facelets.

You will also see how to have a standard, consistent look and feel across the pages, and for that, we will take the help of templates. We will see how we will be able to integrate external resources like JPA within web applications. So web application, that doesn't mean that you're just going to have some simple pages. It's dynamic page. We may need to interact with the database as well. So for that, we will use JPA in this course, Java Persistence API, so that we can insert the records in database, we can retrieve the records from the database, and all those things-- deleting, updating-- all those things you can do through the pages with the help of JPA.

Sometimes we have to navigate from one page to another page. We will see how navigation works in this course. And the entire architecture of the JSF, which is based on MVC architecture we will also explain in this course.

So I'm sure that at the end of this course, you're going to have enough information with us that we'll be able to start developing web applications with JSF. Let's see here what we're going to have, additional things that we can AJAXify our pages for asynchronous communications. AJAXify means that you would like to have asynchronous communications-- send request but do not want to wait for the response if the response is going to be longer.

There are several third party libraries available in the market. How we're going to take the help of them and have the custom components to be added in your applications to get some additional functionalities on the pages. We will also secure our JSF applications.

Audience for this course. You must be a Java developer. You must have experience of developing web applications like JSP, [INAUDIBLE], all those things. That's going to help you to understand this course better.

Prerequisite skills. You should already know object-oriented programming techniques. You should be developing applications using Java programming, understand how to implement interface and handle Java programming exceptions, and integrating existing Java code so that you can reuse the code if it is required.

JSF 2.0 features. We will start with JSF, JSF 2.0. Now, when we say Facelets is the principal view declaration language, that means what? That we're going to have XML-based languages, which we say Facelets in JSF for creating pages, for designing pages.

It is a comprehensive composite component model. That means all those things that you type in JSF pages, they will be components. You type in XML, in HTML, but behind that, they are the Java classes. They are server side components, and you're going to implement them for designing pages.

AJAX request processing for partial page updates. That is the feature of JSF 2.0 that helps you to AJAXify pages so that you do not need to wait for the response immediately. You can go and continue something else. Partial state saving, we will talk about that as well.

JSF 2.0 says that HTTP GET now fully supported in JSF life cycle. When you make a request from the address bar, it is GET request. When you submit a form, it is going to be post request. In the previous version, we just had the post request submitted for the data submissions. But here, it is going to support get. So in case you'd like to bookmark some of the information, you can take the help of the get request so that information can be exposed in the address bar and you'll be able to bookmark them.

Annotations to simplify configurations. That is again a wonderful feature of JSF 2.0 that you do not need to use the complex descriptor files to configure your JSF page or JSF components. You'll be able to take them with the help of annotations. So whenever you use some Java classes, creating managed beans, CDI beans, securing your beans, all those things you'll be able to take the help of annotation. Exception handling, that has been improved in JSF 2.0.

That's the course roadmap. We will start with introductions. And right now, we're just going through the introduction chapter. Chapter 2 onwards, we'll talk about JSF frameworks, creating JSF pages, developing CDI named beans, working with navigations, creating and adding message bundles. That's what I was talking to you will be helpful for creating a localized page.

For consistent look and feel, you can take the help of JSF templates. We'll see how to create them, how to use them. And of course, we'll talk about converting and validating data. So it's not only creating the pages. You enter the data. You'll be able to validate them. You'll be able to use conversion logic so that [INAUDIBLE] data can be converted to any other type.

Working with data tables. You have the collection of data retrieved from the JSF pages and you want to show them on the pages. We have a data table with us in JSF that you can use to display number of records on the page.

Handling events-- again, a wonderful topic. Hitting on the buttons, action events. You may have a drop down list block. When you change some value, it's a value change event. We'll be able to handle those events here in this chapter.

Extending JSF. In this category, we will talk about using JSF and composite components. You know composite component means that multiple components can be grouped together and named under a single name, and that name you'll be able to use across multiple applications, multiple pages to bring all those composite components together, paste it on the page.

Creating custom components. Sometimes, you may need to have new components. Maybe you would like to modify existing components functionalities, add some new behavior, or you'd like to have totally new Facelets. We will see that here in this chapter. Working with HTML5 and JSF 2.0, we'll see how to take the help of HTML5 components and make them a part of a JSF page. We will talk about that in this chapter.

Configuring and securing JSF applications. So we will see how to secure your JSF web applications, letting the user enter username and password and allowing this access. If the user is not allowed to view the page, they will not get the access. We will see that in this chapter.

The last chapter is about additional JSF libraries. That's what I was talking to you in the introductions, that in some cases, you'd like to take the help of third party libraries which already exist in the market and take their components to be added in JSF. You will be able to do this in this chapter. So that's all about the course roadmap.

First day, we will see here one, two, three, four-- four chapters. The second day, again, four chapters, and third day, again, four chapters. And last day, we're going to take care of three chapters. So four days are scheduled in front of you. We will see one by one each and every chapter. You know that right now we are there with chapter one. So in fact, we just have three chapters to be completed on the first day.

Course environment. We're going for the practices. You can get them. You can have a request for the course environment for doing practices. The course environment has all those things preinstalled-- JDK 7, NetBeans, Java EE 6, Java DB for database so that you can implement JPA and retrieve requests from this. We have WebLogic server here as application server where we're going to deploy our applications.

I'll demonstrate to you the environment that contains example folders, practice folders, solution folders, and how they're going to be helpful for you in learning JSF. That's all about this chapter.

