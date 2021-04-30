# 01 Course Introduction

1. Course Introduction - 16m
2. Practices for Lesson 1: Overview - 6m

## 1. Course Introduction

Hello, my name is Vasily Strelnikov. I'm a senior principal training consultant working for Oracle for 22 years now and I'm about to present to you a course which is called Developing Applications for the Java EE 7 Platform. So there's a lot going on but we'll start with an introduction here.

The purpose of the course is to help to get our head around technologies that comprise Java EE. It's a variety of things. It's a back-end and front-end Java EE technologies, including things like coding in Java EE 7 containers, with POJOs, with Enterprise Java Beans, with SOAP and REST services, Java Messaging Service, working with Persistence API, with Java Persistency. Right in front-end parts as well, Java server faces, Java server pages, WebSockets.

Some of these technologies are quite new. They were kind of adopted in recent Java EE releases. Some of them were significantly changed in the Java EE 7 as compared to the older versions of Java. Also in this course, we're going to take a look at the ways of securing Java EE applications and deployment concepts.

Now in order to understand and be comfortable with this course material, participants were assumed that they have prior experiences with Java SE in the first place. Of course, Java EE 7 release is based on Java SE 8 as kind of a base version of Java. So reasonable experience with that would be required, in the scope of Java SE 8 Programming course, possibly if you already certified Java SE 8 Professional. That might also be helpful.

Now it's important for this course to have a reasonable experience with the basics of Java language. With things that are new to the Java SE 8, for example, lambda expressions, they're not explained in this course but they are certainly used in exercises and in pathways. You'll find them quite a few times. So new bits of Java SE 8 are important, of course.

Apart from Java, well that would be XML, and I suppose basic understanding of SQL. Well, we're doing persistence, so part of the course deals with Java objects mapped to database objects, so hence, some understanding of what's going on in the database might be beneficial. There's one more thing that's formally not in the list of the course prerequisites and that is JavaScript. Now there are a few exercises in the course and a couple of presentations that reference JavaScript here, although this particular course does not really explain anything regarding JavaScript.

So we kind of just use the technology, but we will offer you another training course which would be quite useful in that area. It's called HTML 5 and JavaScript. So we have the course in that area which specifically focuses on the JavaScript side of things. So for this particular training, we sort of assume you miraculously have a background in it. Or maybe you've taken the course. All right.

Now, in terms of the course environment, the labs that you are doing-- the practical exercises-- are based on JDK 8. We're using NetBeans 8:1. We're using WebLogic Server 12c. And for the database, well, we really-- it's not particularly important because what we're trying to do is write a courseware that will be as vanilla in terms of the software providers as possible, so we're trying not to impose too much of an Oracle onto you, and therefore, we're using quite a basic database, which is called Derby, and it's part of the installation of the NetBeans anyway. So kind of available out of the box.

Course structure. There are several blocks to the course. First block is understanding all of the Java EE platform-- overall understanding of Java EE platform. The purpose of Java EE containers. What are the APIs? What are the services? How your code is structured for deployment. How it is deployed. How components are interconnected between each other, including different ways of new sort of interconnectivities that emerged in recent versions of Java EE, such as the use of CDI annotations, but also kind of a more traditional approach with just a basic JNDI lookups. We're taking a look at both.

Then there's a set of presentations that are focused on the back-end part of Java. Persistency API, implementing business logic with Enterprise Java Beans, using Java Messaging services, and using SOAP web services. After that, we progress to the front-end part, which deals with presentation technologies. And that will be servlets, Java server pages, Java server faces, REST services, and WebSockets. Of course securing the code is another important point that we need to make, so we discuss that. There will be a chapter on that.

Practical exercises. The practices for this course are written to create a progression, where the later exercise is actually based on the earlier exercise. So you could continue with your practices to an extent. Of course, for every exercise, there's a rescue application provided, so if you've failed to complete some practice-- you had a problem with that-- there is a solution. So you can always load the solution.

On that note, I need to point out that the practice for Lesson 1 is not really a practice. In the manual, the practice for Lesson 1 is a rescue procedure. It's not something you need to do as a practical exercise unless you want to load a solution for a later lab. So at any stage in the course, you figure out you have a problem, you want to load a solution, look at the exercise for Practice 1 and that tells you what you need to do.

With one exception and that is the exercise for Lesson 2, which you really honestly need to complete because that sets up your environment. You have to set up your NetBeans. You have to set up the WebLogic server before you do anything else. You have to set up your database. So these are the setup steps. They're covered by Practice 2. And after that, the exercises pretty much build on previous labs and you could sort of continue with the same setup.

Now what it is that we're doing in the course of the labs. First, we will set up things. That's in access Practice 2. Remember, Practice 1 is just rescue procedure. Then we deal with Persistence API, so writing Java persistency code. Then, Enterprise Java Beans. We cover the handling of business logic. Then Java messaging services.

And as you can see from this page, it says here, models of technology. Let's try annotation. It's all about products. Hey, hey. Right. So it's kind of the theme for exercises is a product management system.

The idea is that we have some kind of a database, which stores information about products, and then we have some business logic around them. Prices, discounts, just querying and editing these products. These sort of things. So for example, we expose some of our business logic as a SOAP web service, which allows us to create product quotes. We build user interfaces for managing products.

Now the UI part of the course is rather interesting. The chapters that are covering the user interface development practically repeat the same exercise for servlets, Java server pages, and Java server faces. The idea is to show you not just how to use these technologies but demonstrate on a specific example, like product management, what are the pros and cons and differences between these different approaches? What is beneficial with regards to servlets or what's beneficial with regards to Java server pages or Java server faces? Why would you utilize one or the other technology? What are the circumstances where you'll find them useful?

So to achieve that, exactly same business logic, exactly same UI will be implemented in the exercises several times. You build it with one technology, then with another, then with another, so you can basically look at it side by side, compare, and see what's what. And, you know, why would you choose, let's say, GSFs over GSPs or vise versa? Because it really depends upon your task, isn't it? Well.

Another interesting example with regards to the exercises will be the use of REST services-- Representational State Transfer-- and that's with the product discount. So we'll try that out. And use the WebSockets. I was just thinking about what could be fun about the lab on WebSockets and I think the good thing is that you're doing something quite interactive-- chat between users-- which is not precisely the example about products, but later on in the course, you'll see why. There is a genuine lack of rationale behind using WebSockets for something as basic as just editing a product, but implementing a chat, on the other hand, that's where the technology seems to be more applicable. And it's fun to play with, I suppose.

Now, during the exercises, what we're going to try to do is to show you how to write as less code as possible. Java EE 7 is designed to cater for automation of your code-writing process. To help you with that. And if you can achieve something declaratively, if you know how the container behaves by default, then it all helps you to write less code.

So the exercises are kind of trying to be minimalistic in the way that you form your code. You code only when you need to. When a container does something for you, we try to fall back on the existing container functionalities to achieve it. Right.

Well this is a course schedule. Just a progression of chapters, really. Introduction is what we're doing now, followed by 11 more chapters, which is Introduction to Java EE, then several back-end technology chapters on Java persistency, on Enterprise Java Beans and Messaging services and SOAP services, then our front-end set of chapters which covers servlets, GSPs, REST services, Java server faces, WebSockets, and of course security. Securing the Java EE applications.

Apart from these chapters, the course also contains the appendices. Now the point of appendices is to give us information on the technologies that might not be immediately used in your exercises. The reason why these things are in appendices might not be because they are not important-- no, no, no. These are important things but the chapter focuses on the topics that are crucial for understanding of a particular area in Java EE and to be able to complete the lab, whilst the appendix shows you additional bells and whistles which is very important but maybe not necessarily immediately concerned with an exercise.

With one exception. That's Appendix A. You see, Appendix A is about Java Logging API, and the reason why the Appendix A is here at all is because it is not covered by the Java SE 8 programming course. It's really an SE 8 topic. It's a Java Standard Edition thing, right in the log file, but you see, in Java EE, it's all over the place. We need to write logs. And because we formally didn't introduce that API in Java SE programming course, we need to make sure that, at least on a basic level, you understand that. So we've put a relevant appendix into this course.

Appendix B covers advanced topics CDI Beans. Appendix C talks about bean validation and use of that technology, together with some more advanced features of Java Persistence API. Appendix D talks about two APIs-- batch API and concurrency API.

Appendix E talks about JAXB annotations and JAXB API. That's for mapping XML and Java. A good example of the use of that technology would probably be web services, where you need to map XML artifacts and Java artifacts. And finally, Appendix F. Do you know what? It's really how not to code these days. It shows you what you had to do in earlier versions of Java EE, before we have an opportunity to use the CDI Beans.

And it was quite a handful, coding-wise, so I think the main reason for Appendix C is sort of to give you a bit of a scare, you know, like ooh, with CDIs, it's that much easier. Yeah? So just a quick example of what it was like before. But I suppose there's another reason. You might have to deal with a legacy code. There might be Java EE applications already using that API-- you know, the older sort of approach-- so you understand what's going on, and maybe if you're updating the code, replace the older API approach with a newer API approach. So you see both in this particular training.

Right. That's it for our first introductory presentation, just to make sure we understand what sort of a structure the course has and what things are covered and what is expected from you in terms of prerequisites and what do you expect from the course in terms of presentations and practices. Right, thank you. Let's progress to the next session.

## 2. Practices for Lesson 1: Overview - 6m

In your manual, you find practices for every lesson of this course. However, Practice 1 is not really a practice. It's not something that you need to do unless, in a later practice in the course, you encountered some problem and you decided you don't want to complete a particular exercise, so you want to load the exercise solution instead.

So this practice for Lesson 1 isn't an exercise as such. But instead, it's the walk-through-- the procedure that allows you to load a solution project for a later exercise. If you want to do something like that, then that means you have to first close all currently open projects and then open whatever project you want to open. Each practice has a solution. So there's Lab Solutions folder-- so appropriate practice subfolder.

For example, practice for Lesson 7 will be in a Practice 7 subfolder. There will be solution for Lesson 7. If you want to, for example, start from the beginning of Lesson 7, then I suppose you need to load the solution for Lesson 6.

Select all the project's in appropriate subfolder and make sure you tick the required project checkbox as well. So let me just show you that. First, I go to [INAUDIBLE] and I close any currently open projects. Then I go and open a project. And I go to the Labs Solutions folder. I select whichever solution I like, so-- I don't know-- solution for Lesson 5, for example.

Select all folders here. Make sure Open Required Project checkbox is ticked. And then open them. There you go. So that allows me to start from a particular end of a particular exercise. OK, so that's part of the procedure. So you opened the necessary projects.

Now, this rule has a couple of exceptions. To start practices for Lessons 4 and 7, the solutions folder contains additional subfolders-- Start of Lesson 4 and Start of Lesson 7. So that allows you to start these two from scratch from this particular [INAUDIBLE] application folders. Again, procedures-- same-- make sure you open the Required Projects checkbox.

If you deploy onto your server, in a WebLogic server, an application which is from the different solution folder and such application is already deployed-- so for example, you're getting an error message that looks like this-- product app cannot be deployed because it's already deployed-- which could happen if you start overriding deployment from one project with solution from another.

So just in case-- OK, if that happens, you can go on a WebLogic server console and simply un-deploy whatever applications. It's pretty straightforward. Just open a browser. Go into the console. Tick the checkboxes-- which applications you want to get. Read off. And un-deploy them. Just hit Delete button. And then start the deployment of whatever you want to deploy properly.

So we could go to our WebLogic console. This [INAUDIBLE]. You might have to log in first, of course. And then look at the list of deployments. And if you want to un-deploy any applications, just delete them, like so. That's it. Or whichever one is causing the conflict-- I suppose you don't have to un-deploy them all.

Now, there is a lot of exceptions from this particular walk-through. So that's generally how you restore things. However, if you did not successfully complete practice for Lesson 2 or Practice 5, part 1, then appropriate solutions will not load, because both practice for Lesson 2 and 5-1 require you to go to the WebLogic server console and configure resources.

Practice for Lesson 2-- you configure a database and the data source. Practice 5-1, you configure [? whichever ?] message in queues-- Java message queue-- so JMS system. And of course, you won't be able to deploy, let's say, a message-driven bean, if you don't have a JMS queue for it that it references. Or you won't be able to deploy Java Persistence API code if you haven't can configured your database.

So these are the two practices that you really have to complete. Everything else can actually be loaded from solution, just as I've shown to you a moment ago. Well, that is it for this particular practice, which isn't really a practice but, rather, a rescue application for further exercises, should you run into any problems.
