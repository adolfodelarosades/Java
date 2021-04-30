# 1: Introduction and Practices

1. Introduction 10m
2. Practice 1-1: Set Up the Development Environment New 7m
3. Practice 1-2: Create and Test a QuickStart Helidon MP Project New 13m
4. Practice 1-3: Create Resources and Test in Helidon New 7m
5. Practice 1-4: Create and Test Java Persistence Mapping (Part I) New 15m
6. Practice 1-4: Create and Test Java Persistence Mapping (Part II) New 14m
7. Practice 1-5: Implement Resources to Use Java Persistence New 16m
8. Practice 1-6: Migrate the Monolithic Service to Two Microservices New 6m

## 1. Introduction 10m

Welcome to Lesson 1 of Java on OCI, Introduction to Develop Microservices. This is the next course in our Java on Oracle Cloud Infrastructure OCI learning path. This series of courses encourages you to use what you've learned about Java, databases, and developing for the Oracle Cloud infrastructure using Cloud native services and platform as a service integrations to ultimately customize and extend the Oracle software as a service applications using the Oracle recommended and supported workflows and techniques.

This course challenges you to use what you've learned or need to learn to practice full stack Cloud Developer skills using standard services, tools, and techniques. This course follows on from our Java Standard Edition SE on OCI course that introduced developing a Standard Edition SE Java application to run in the Oracle Cloud infrastructure, OCI. That course introduced you to how to provision and configure a working virtual machine compute environment to write your code, and an Oracle autonomous database to use for storage. This course builds on that with Java Enterprise Edition development on OCI, which, in this learning path, specifically means web services, and in particular, REST web services using JavaScript Object Notation, JSON.

In this course, you'll configure the tools and use an OCI Compute VM instance to develop RESTful web services using JAX-RS. You'll use a Java Persistence API, JPA, to read and write Java objects to an Oracle database. These are core fundamental skills that you will use repeatedly as you develop your Java enterprise applications throughout the learning path.

You will start by developing a monolithic REST application to handle client requests and use JPA to retrieve and save client requests from and to an Oracle database. You will create the code needed to handle a master detail relationship, also known as a one-to-many data relationship, in the database. In these REST services, you'll receive and return requests in the form of JavaScript Object Notation, JSON. You'll also parse and handle JSON requests.

You'll use the Oracle open source product Helidon Microprofile MP The Enterprise Edition for hosting the microservices themselves. Once you have the service working as a monolithic service, you'll break the monolith up into two separate microservices. You'll use these services in later courses and their labs.

This learning path of courses was designed to be different from the typical training that you've taken. In this learning path, you're presented with a design and programming challenge, like a case study, that requires you to leverage skills acquired in other courses to assemble an application. So the intention is that you practice and sharpen the skills you have and acquire new ones as needed to solve the challenge.

You have the opportunity to work with standard popular industry tools, like IntelliJ IDEA, for the integrated development environment, the IDE, Eclipse Link for the Java Persistence API, Maven, JDF 11, Java Enterprise Edition 8, the Oracle database 18C, and SQL Developer, and you use Postman on cURL for testing your services. Using the skills that you have already or have newly acquired, you'll practice full stack Cloud Developer skills that are both standard practice in the industry-- so what you practice here can be reused in other environments-- but also are specific to the Oracle Cloud, both of which are very marketable skills.

Helidon MP is Oracle's open source microservice hosting product. We will use that to deploy our REST services. We'll get introduced to Helidon in this course and use more and more of its features and capabilities in future courses. Now, where you do not have experience, or maybe you lack the training for certain aspects or concepts, you have access to digital training to support you to fill in the gaps. The entire Java learning subscription that you've subscribed to and all of its content is available to you as a subscriber.

This course prepares you for the following courses. These dive deeper into the Cloud native platform as a service and software as a service customizations. And we'll use DevOps continuous integration, continuous deployment, CI/CD pipelines for our deployments.

These courses were designed with a student who has or is acquiring the following skills in mind, basic Java SE programming from the Java Programming Complete Course. Again, you can either take the course or have equivalent skills. This would include collections, interfaces, and streams. And then Java EE, this can come through the Develop Applications for Java EE 7 Course or the web services courses.

We also expect the student to have exposure to Java Persistence API, to be able to save and retrieve Java objects to a relational database. Also some basic experience with Oracle database skills, introduction to SQL, tables, columns, keys, a basic familiarity with JSON, JavaScript Object Notation, and experience with some type of integrated development environment. We use IntelliJ IDEA in the course. Some exposure to Maven POM dependencies would be useful as well. You're not going to have to write much code. It's done for you. But a basic familiarity is assumed.

Now, the work for this course is inside of a project. In the project for this course, you will first create a single monolithic REST application with all the code in one class or related classes, depending on how you design it, running together in one server in one memory space. You will use the Oracle classic Emp and Dep, employee and department master detail schema data from the Oracle sample schemas. You'll design and code the needed resources for the REST calls and implement the indicated URLs.

You will develop the project in IntelliJ and deploy it to Helidon MP all within the lab environment. You will use IntelliJ tooling to generate the table to class mapping for the JPA entities. Once you have all this working and tested, you'll then split this into two separate projects, as two separate microservices, each running in its own server. You will add error handling for the data that is not found and return the appropriate message from the REST service.

You should read the activity guide first carefully, which will provide guidance for the various steps, what you need to build, as well as what needs to be tested. You will use a self-directed approach to completing this project. As we've said, this learning path of courses is different from other courses in that we leverage what you already know or are learning to assemble and modify an enterprise Cloud application. We do not reteach concepts that have been covered in other courses, and we do not present step-by-step, quote-unquote cookbook style lab practices, as we do in other courses.

Instead, we use an open-ended practice format where we present the problem to be solved and the specifications and the outputs, and you design and build the solution. We also supply solutions for all exercises, and we have recorded solutions where we talk through how the solution was coded and why. This format meets a number of needs voiced by our students. Some students simply want to watch a step-by-step tutorial and find our recorded solutions to meet their needs. Other students want to bring their different skills together to solve a single project problem. You're encouraged to do this yourself as much as possible, but the solution is provided as well, if you need help.

To get started, you'll want to read the Activity Guide to get a more detailed look at the project requirements. Look for topics that you are not familiar with and make a note of them. Use the Java learning subscription to take modules from other Java courses that will teach you what you need to know for this project. Most of the Java you will need is in the first three courses in the list. But of course, you can access any course in the Java Learning Subscription to help you out.

For courses outside the Java Learning Subscription, like, for example, introduction to SQL for the database training, these are available at other learning subscriptions. If you have subscribed to those learning subscriptions, then you'll be able to access the content from them as well. If not, then you might want to consider subscribing to that learning subscription to get access to all of its content.

You will also have access to the Java forum at the URL shown here. This is a great place to post questions, get help from instructors who monitor the forum, and also to help others as well. While it may seem that the project is trivial to some students, we have included some nice surprises that you will have to deal with in the JPA mapping and JSON conversions.

The time limit on this is 30 days from when you start up IntelliJ in your lab environment. That should be plenty of time to get this all working. Completing this project serves as a baseline from which to move on to the next course and build on the skills that you practice here. Lastly, you can upload your completed projects to GitHub to save for later. You'll need to provide your own GitHub account to do this.

## 2. Practice 1-1: Set Up the Development Environment New 7m

Practices for Java on OCI-- Develop and Deploy Microservices. In this series of videos, we'll present the solution to the lab exercises presented in the course.

There are six different practices-- 1-1, where you set up the development environment; 1-2, where you create and test the QuickStart Helidon MP project; 1-3, where we create our resources and test deployment and running in Helidon; 1-4, where we create and test our Java persistence mapping, JPA; then 1-5, where we'll implement our resources to use the Java persistence. And that will complete our monolithic service. Then in 1-6, we'll see how to break that monolithic service up into two microservices.

This first exercise, practice 1-1, is to confirm that your environment is set up correctly. First of all, you want to test the JDK version. Open a terminal window and type java version. Let's go ahead and do that. You can open a terminal window by right-clicking, selecting terminal. And then we want java and the version, so java and version. Here we go. And this is running 11.0.4. So that's good. That's correct.

Next we want to check the Maven version. For that, we can do mvn version. And we see we have version 3.6.3, which I believe is the current production release.

Now, SQL Developer. We include SQL Developer as a convenience for you to work with the database. Since your code will be reading and writing data from database tables and you'd like to confirm that inserts, updates, and deletes were done correctly, using SQL Developer can be helpful as well as seeing the structure of the database tables. SQL Developer should be an icon on your desktop. And you can start it by double-clicking. And it'll pick up and start SQL Developer.

OK, so here we have SQL Developer. Now, if you watch the demo that I did of IntelliJ, I did create the HR account in the demonstration. I'll show again what the settings are. You should already have the system account set up. So the HR account is done by clicking on New Connection. And then when the new connection pops up, you want to give it a meaningful name.

All right, so creating a new connection, you put in the name of the connection, the username, the password, save the password, possibly change the type of role, and then your connection type. We'll use basic, but there are others as well. Notice, by the way, that we could use wallet if we're working with an ATP autonomous database.

All right, so, in our case, we already have HR created. So I'm going to right-click on that and select Properties. And under Properties, we'll see that we've named this HR XE, because it's an XE database. Username is HR, password is HR, save the password. The hostname, we're just using localhost is fine. We did change to a service name since this is a pluggable database. And the name of the pluggable database is XEPDB1. Test the connection. Of course, we see that it works.

Now, once we connect, we' get a worksheet pop up. And here you can execute SQL and PL/SQL statements. But you can also expand the hierarchy here and see your tables. And under tables, you can expand the employees or departments table to see the columns. And double-click on the employee or department tables to see the columns, the data, the constraints, et cetera.

In the lab guide, you'll notice that we have a screenshot showing what the connection should look like and a couple of questions to let you investigate the employee and department tables. We also have a link to the Oracle Online Learning Library, OLL, which has a tutorial for SQL Developer if you need a little bit more help with it. For example, it'll take you through how to create the database connection.

Lastly, for IntelliJ, we're going to start IntelliJ and confirm the configuration settings. Now, the first time you start it in your environment, it's going to prompt you for a number of these settings-- user agreement, anonymous statistics, the UI theme, the desktop entry. I showed this on the demonstration as well. But this is a one time only, and I did that in the demonstration. So now when I go into the lab environment, it won't ask me to do it again.

But I'll show you what it looks like anyway and how this gets started. What you have to do is start it by running the idea.sh file. And you do that by opening a terminal window and typing sh space home/oracle/idea, then the rest of the folder name, and then bin and then idea.sh. And that will start IntelliJ.

So I'm going to pop over to the lab environment. Now, you'll also notice that for my demo I actually have the icon on the desktop for IntelliJ. If you don't have it on yours, which you won't, we'll get that in a moment.

So to start IntelliJ, the initial start, we just type /home/oracle. And you can use the Tab to fill in the paths for you. And then idea-- there's the idea. And then bin. And then you want idea.sh. Let's do sh to run that. And that will start IntelliJ.

Now, in your lab environment, it will come up and start asking you for all the prompts that we saw here, meaning what you'll see the first time you do it is accept the user agreement, send anonymous statistics, et cetera. And, again, we saw that in the demo. Here, IntelliJ will just start. And since I don't have any projects open, it'll just start up. And now I can create a new project or open and import a project.

So that's as far as we wanted to get with this. We wanted to get IntelliJ open, running, and the evaluation copy going. And then the last thing we can do is drag the IntelliJ application icon from the application programming menu to the desktop for convenience. When you accepted creating a desktop entry, what it does is it gives you an entry under the Applications menu, under Programming, there is IntelliJ.

And what I did in the demo and with the result of that is dragging that-- just click and drag it. So drag that to the desktop. See? And then you get an icon. So you'll have an icon and you can start IntelliJ going forward. So the next time you want to start IntelliJ, you don't have to do the command line, you can just simply double-click on the icon.

So at the end of this, you should have SQL Developer, a connection there to use. You should confirm your Maven and Java versions. And you should have IntelliJ running. And that completes this practice.

## 3. Practice 1-2: Create and Test a QuickStart Helidon MP Project New 13m

Practice 1-2. Create and test a quick start Helidon MP project.

In this practice, you'll start out by creating a default Helidon quick start app, and then create another one named the way you want for employee and department monolithic application.

You'll then open that app in IntelliJ and see how to run it, and also look at the outputs and how to test it. And lastly, you'll look at some of the annotations being used in the application.

Let's start by opening a browser and navigating to Helidon.io. So here we are. Here's Helidon.io. And it has a really nice Getting Started option here.

By clicking on it, we can get started with Helidon MP, which is the Enterprise version that we want. We'll click on Get Started. And you'll notice that it has a way to generate the project from a Maven archetype. We'll select it. Copy.

Now this is going to take the default name of Helidon quick start MP. We're going to change that in the next one. And this is a nice way to get started.

And of course, you can create your own projects and set up your own POM files and do all that. But this gives you a nice starter project to get started with. And you can, of course, make changes to it as you go. Let's go ahead and paste. And then run that.

So one of the things is, if there's already a directory there, then you're going to get an error. And I think from an earlier demo that's exactly what happened. So I'm going to go in and actually remove that directory and just run this again. We have a File Explorer for you on the desktop. So let's go in and take a look. There it is. I'm going to go ahead and delete it. And let's try that again.

OK. This time it worked all fine. If we do an LS, we can see that there is a Helidon quick start. And then you can follow the rest of the instructions here to actually build the project. CD to Helidon quick start MP. Then you can package it using MVM Package. That will all work right there. You can then run the actual JAR file. Then you can test it with cURL commands, or we also have, you can use Firefox the browser if you want for that. And we also Postman, which we talk about in a later exercise. But here's Postman if you want to test using that.

So a number of different ways you can test. You can also look at health and metrics. And that's where we stop. The quick start here goes on to building a Docker image but we stop there. We'll do Docker and Kubernetes in a later course.

So that goes ahead and creates the actual quick start for us. And that's as far as we want to go. But we're going to create another quick start project. This time we're going to name it for our application.

So in this case, we're going to name it helidon.empdept.mono.mp for Monolith. And we'll see both of those. So now what I'm going to do is take that text that I got and put it into a little editor.

There we go. And then just make a couple of changes to it. I want to change it from Helidon quick start to helidon.empdept.mono. OK. So we're just going to change this. And we're going to change this. Make sure that's right, helidon.empdept.mono.mp.

Get rid of quick start. There we go. Empdept.mono.mp. Empdept.mono.mp. OK. It looks good. All right. So take this and copy it. And this will create the actual project that we're going to edit. We're going to use that as the starting point for the lab exercise.

This should give us another folder in the directory-- in the root directory where we are in our Oracle directory. That will be named appropriately. Let's take a look.

OK. It looks like the build is done. And sure enough, there is helidon.empdept.mono.mp. And notice that this has its own POM file underneath it. So that would be seen as a Maven project. So to have it seen, we'll go ahead and start up IntelliJ. I'm going to use the icon on the desktop.

And we'll see how to open that project in IntelliJ and then run it. So that's the next step here. Once you create the empdept project, you'll open the empdept.mono.mp project in IntelliJ. You'll click the Open or Import. Select that project you created. It'll take a few moments while it scans the folders and files.

And we'll see any status messages. We'll get to that in a bit. OK. So there it is. And what we want to do is Open or Import. Select that.

It'll show us a directory of the file system. We want to make sure we're looking at Oracle, which we are. And then look for-- make sure you get the right one, helidon.empdept.mono.mp. Notice the icon on the folder indicating it has a POM file and can be opened as a Maven project.

Select it. And it will go ahead and open. The first time you open it as it scans and reads files, you're going to see messages appearing in the lower right-hand corner. It may take a few moments for it to scan, do indexes and things like that.

OK. If you were done, and we now have the code here-- let's do a couple of things. Let's make sure that the project has the right settings. We'll go to File and I'll go to Project Structure. And from here, we'll take a look.

And make sure we're on Java 11.04. Version 11. That all looks good. Notice, you can change project name here if you wanted to, if you needed to, if you misspelled the name.

Then if we open up the source code, there's not much here. There's the two classes necessary that we saw in the demo. Here is our greeting provider and greeting resource. And then we have a test folder as well, and that has a main.test. The main.test is using annotations to do a full test of the server.

When we go ahead and run our server ourselves, we're not going to do it using the test annotations. So we're going to come over here and look at the greeting resource first. This is the first class that's provided that will respond to the forward slash greet URL.

And it will just reply back with a greeting message. And then there's also one with a name. And if you pass a name in it, it'll add that to the greeting message. You can play with these and such.

What we want to do here is create a run configuration. And we want to run the server and see how to manage that. So we've seen that we can open a Helidon application, quick start application inside of IntelliJ.

Notice there are some annotations like application scoped. This would be a service that is created once and then is reused throughout all the calls for a single application conversation.

There's also an add inject annotation, if you want to inject configuration properties or other classes. We're not going to go through the add inject in detail here. Helidon does support CDI. And if you want to use it, you can. And we will use injection in later courses and later exercises.

So if we look at the greet resource, you can see the annotations here at the top. There is a path greet. This is request scope. So a new instance of the greet resource will be created for handling each resource. And it will simply use this persistent instance of the greeting provider.

And notice it's using at inject as well, in order to get a reference to the greeting provider class. Again, you can do it that way, or you could actually instantiate it yourself.

We're going to use the instantiation method. But inject works just fine and has certain benefits as well.

So now we've imported it. And we want to run this. But what do we run? There is nothing to run. There's no main.

So we're going to add a main class here, which will have a main method. So I'll right click on it and select New. And then I want a new Java class. And we're going to call this main.

And we're going to use some of the conveniences in IntelliJ. Just type M-A-I-N and then tab. And it spells out main for me. And then I'm going to put it in SOUT for system.out.println. And there's my println. There's my test.

And this is basically what I did in the demo as well. So it's pretty much the same thing.

What we want to do now is we want to run this as a server. And the server code is in main test. So I'm going to take these two variables-- and I also want to start the server, which is right here.

OK. Very straightforward. We start the server. Server starts listening.

Now what happens when the server starts is there's a number of ways of telling Helidon what classes you have registered that are supporting resources.

By default, if you don't submit to Helidon what you're exposing, it'll scan all the classes looking for resource annotations. And it would find one class in this case. But you can also use an application class to register specific resource server classes as well. We'll see some of that as we go along in the later courses.

All right. Well this will get the server working. So to make it work, we right click and select Run.

Another option is create a configuration. If I click on Add Configuration I can create a run configuration. And there's a series of templates.

In my case, I want to run it as an application. And then it's going to ask, OK, what's your main class. Now you can set all these up yourself manually. Or, anytime you right click on a class that has a main method in it like this one does, and then select Run, as I'm doing, it'll create a run configuration for you.

And as you can see, it created one called main, according to the name of the class. It's doing the build and then doing a run.

So we have loaded the project as you see here. We did not see a setup SDK message because I actually did that during the demo. If you followed along with the demo, then you chose your SDK for IntelliJ. If you did not, then you may see the setup SDK message in the corner of IntelliJ.

Simply click on it. Select 11.0.4 your JDK. And you should be all set.

Here's where we're creating the main class as I mentioned. And we add the code to run the server. And you see all of that. Then we right click and run the main program to test the service. It's running when you see the URL here. It says server started.

And then confirm that it works. Test the following URLs in a browser or in cURL, or in Postman, whatever you want to do.

So right now we go back. And sure enough, it has started. You can even just click on the URL. And it'll open a browser for you.

And of course, there's no path for just the host and the port, but if we do forward slash greet, then we can see that it does work.

So the service works. I do encourage you to test out some of the other aspects of it. Play with Helidon on a little bit, get comfortable. Look at the annotations. Look up the annotation documentation in Helidon. We have a link to that for you right there in the browser. So if you click on Helidon introduction, that's where the documentation starts.

This can be a nice thing to read through and get familiar with. This is not specifically a course on Helidon as such. We teach different parts of Helidon in different courses. The web service course teaches one aspect. This course teaches different aspects. And then of course, there is the Getting Started and the documentation.

So with that, we will stop the server. And to do that, we simply come over here. And the controls of the server in the upper corner.

We can rerun the server. Very handy if you've made some changes to your source code, want to just simply rerun the server.

You can stop it with the red square. And then you can also use the debug. You can set a breakpoint. Put a breakpoint in for example, by clicking in the gutter here. And then put on debug. And when it gets to that line of code, it will stop.

I trust that all of you have worked with a graphical debugger before. If not, again, there's good tutorials out there on working with the debugger in IntelliJ. And it can be very useful to step through and see your code.

And this will work even with the Helidon server running. So there's our system.out.println. Then our various commands down here to step over, for example. That will actually create the server, which right now doesn't exist. Notice you can see here in the variables. We step over. After a brief pause, the application is running.

And now the server is running. And we can go back and test the server. And this completes this practice.

## 4. Practice 1-3: Create Resources and Test in Helidon New 7m

Practice 1-3-- Create Resources and Test in Helidon. In this practice, you'll create the employee and department resources and annotations using JAX-RS and then test those resources and confirm the URLs work as expected when deployed and running in Helidon. You'll start by creating a resource class to support the defined use cases. As this is a monolithic application, there should be one class named, for example, EmpDeptService that'll handle the REST requests.

Now, you can do this a couple of different ways. And there's many different ways to design this. We're taking a very straightforward approach. One service class to handle the URLs. One class that'll handle the interactions with the database. But there's many different variations on that.

We're going to first of all create the EmpDeptService class. So I'll go back into IntelliJ. I'm going to come down here to my project and package, right-click, and select New, Java Class. And we'll call this EmpDeptService, but you can also call it something like HR or something like that. And create it as a class.

I didn't create the project package first, so you'll notice that it's sitting here. But I'm going to move it into a service package. And I can do that by refactoring. I can create the package, but I'm going to move the class. And it's going to ask me where to move it to. And I would just put it in the new one at the end. So we'll call this service. Refactor.

And package doesn't exist. Do you want to create it? Yes. If you create it in the main, make sure you create this in the main that's in this folder here, not test. Click OK. You could even get rid of the test folder if you wanted to.

All right, so now we're all set. There's the service class, and there's EmpDeptService. Now, I already have the code from a previous solution. I'm not going to write all that code out. I'm going to simply copy it and just paste it in here.

So now things look a lot better. We have the annotation request scope. So each time a request comes in a new EmpDeptService will be created. It has the root path, forward slash, which is saying that we're going to start listening for requests that start with a forward slash. Then we have our employee URLS-- employee/all, employee/lastname, with lastname as a path parameter.

And then we're going to see here, we have employee/id/id as a path parameter. Then just employee, which will allow us to do a POST and create a new employee. Then we have just employee which will do a PUT. So notice that we're distinguishing here not based on URL, but based on the actual HTTP operation being done. And as you'll recall, that's the two things that have to be different. You cannot have two methods with the same HTTP operation and the same path, because then the server won't know what to call.

Down here we have employee with a missing E. I'll go ahead and put that in. That's something I missed earlier that, of course, would cause the URL not to work. Employee and then ID. And then we have our department-- /department retrieves all departments. /department and then the department path parameter and employees retrieves all the employees for a department. department/department path parameter slash salary retrieves the total salary for that department. And department/id as a path parameter returns that specific department.

So the first thing I want to do is get this working and get all the paths working and get it deployed and running. So what we're using here is just a very simple JSON object. We're returning a JSON object. And if you use a JSON object, make sure you have the right import-- json.JsonBuilderFactory. And you can then return Json.createObjectBuilder.

And you can then add basically everything you want to the message. Here I'm just adding an employees element and a value of all. So it's going to build up the JSON for me. You can have as many adds as you want there, and then just make sure you end with a build. And now you can have a complete message coming back.

So this one just simply returns employees. This returns last name. Notice we're also using a path parameter here-- based on last name-- which has to match the spelling in the path parameter and then the variable lastname or parameter lastname that we get passed in, which we can use, actually, in our creation of the message.

There's the ID, same thing. There is the employees, same thing. So very, very simple. At this point, it's just testing to make sure that all the URLs work. Let's go ahead and run this and make sure that it does work. So I'll right-click and select Run. Or, again, you can click the Run button up here on the right. That works as well.

OK, when we see the URL, like we see here, then we know that it's connected. I'm going to use Postman, which is on the desktop. Double-click to start it. I tend to like Postman a little bit more when I'm doing lots of tests and calls, because it remembers all the URLs and makes it a lot easier to work with.

But again, you can, of course, use whatever you want. I think we also have SoapUI on here as well. So there's the SoapUI on the desktop if you prefer to use that. Or you can use a browser or curl, but whatever you'd like.

So here we're going to start-- I already have one in there-- localhost. One of the things I like about Postman is it keeps track of all the different calls that I've done. And let's see. So here is employee/all. And click Send. And there we go-- employees/all, and that's what I would expect to get back. And sure enough, employees and all.

And if I do a last name like for example employee and we'll say Ripley. And the last name Ripley. So you want to test all those different URLs. Make sure each one works, each one comes back, works correctly. And once you have that, that is what we want for this lab exercise.

So you need to support all these URLs as they're shown here. We give you the code for the JSON object if you need that. You'll create a main class if you haven't already with a main method with just the code to run the Helidon server. Create a run configuration. Confirm that all the URLs work. And that completes this practice.

## 5. Practice 1-4: Create and Test Java Persistence Mapping (Part I) New 15m

Practice 1-4, Create and Test Java Persistence Mapping. In this practice, you'll add persistence support to your IntelliJ project, create a data source for use with the JPA mapping, in IntelliJ create a JPA mapping for employee and department and create the actual employee and department classes, and then test the provider functions.

The first thing we need to do is add the JPA framework to the project to allow us to support JPA. To do that, we're going to right-click on the project name and then select Add Framework Support. Here's the project name, right-click.

And by the way, if you look at the user interface for a moment, in the lower left corner, you see two items-- Favorites and Structure-- nothing else. Once we have the framework support, a new tab will be added for persistence. So Add Framework Support, and then scroll down to the bottom. And sure enough, there is Java EE Persistence. Select that.

Select your persistence version-- 2.0 for us. Select your provider. It could be EclipseLink, or Hibernate, OpenJPA, or TopLink, depending on what you're using. We're using the reference implementation, which is EclipseLink. We'll click Configure so it'll download the correct library files. And then click OK.

All right, so that worked. And we know it worked, because if I come over here to the left and click on Persistence, then sure enough we'll see that there's a new persistence unit. So right now we've added the framework support. And we've downloaded the JAR file.

Now we check to see if the persistence unit is there. It is, but now, to configure it, we're going to use the Oracle data source. Now it is true you can do all of the JPA work you want hand-coding it. You can write your own annotations. You can do all of that yourself. However, many tools-- and IntelliJ's one of them-- has built-in tooling that will do a lot of this for you.

So what IntelliJ will do is it will actually go out and it will read the metadata from the database about tables, columns, and keys, foreign keys, and primary keys. And it'll retrieve that information and then generate persistence entities, entity objects-- one for department, one for employee, in our case-- that'll have the correct JPA annotations so that at runtime those objects can be read and written from the database.

So first thing we're going to do is create a data source. To do that we'll come over here to the right where it says Database. Open that, and we're going to create a new data source in this case. And the one that we want is Oracle. Though, there are other options as well, of course. Click Oracle. And now we need to fill in the connection information for the Oracle database.

Now, we're using a local database in this case as opposed to an autonomous database-- one, to make it simpler and easier, two, because the tooling in IntelliJ was found not to work correctly with wallets in the autonomous database, which is the way to connect to it. And three, we found that is more typical of developers to use a local database rather than a full-blown production database to do their development work.

All right, so, in this case, we're using a locally installed Oracle 18c XE database. That's sufficient for our purposes. We don't need the newest version for this. We're going to call this, the schema name, HR_xe, which is the database.

The connection type is to a pluggable database, so it'll be through the service name. We'll remain localhost. That's fine. Port is 1521. The service is actually called XEPDB1. It is a pluggable database in the XE database. Username is hr.

And, normally, if you save forever, it will try to store this. But in this environment, we're having some problems with the keyring, so you're going to see that come up. Normally, this doesn't happen. This happens to be in our environment.

Now, if you're doing this for the first time, you may see a missing, or you will see a missing, JDBC driver message down here. Click on that and load it. And you saw me do that in the demo. I've already done that now, so I don't need to do it again.

I'm going to click Test Connection and make sure it can connect to the database. And sure enough, it does. Great. So we click OK. And we're done. Now, it is asking me to store the password in the login keyring. Now, I'm going to try it. It doesn't typically work for me, because I don't think we have this set up correctly. And two tries, and then I'll just say it doesn't work. And I'll click Cancel.

Now, what it means is it didn't say the password. And when we use this part of the IntelliJ tooling, it will prompt us for the password. That's not going to happen at runtime. That's going to use a different database connection. This database connection is being used at design time. And this is going to generate our JPA mappings.

And notice it can see our schema, HR. It can see our tables and on from there. And we have a console window here, where we can execute queries against it. But if we do this, it's going to try to use that password and keep prompting us.

So that's part of the reason I don't do it here in this lab environment. But also I tend to use SQL Developer for the sort of thing as I find it a better tool. But it's nice that IntelliJ has that built in. And you can keep canceling it. And it'll actually run. It just won't save the password. And it'll prompt you for it each time. Fortunately, we don't need it. We have the database connection done. We can go ahead and close that.

And now we're ready to come over to our persistence unit. And if we expand that out, we see that we have a new persistence unit called NewPersistenceUnit. If we come back to our lab example, then-- We created our database data source connection. That's fine. Oh, we do have to add our Maven dependency. So let's do that now.

So there are two dependencies we need to add-- a dependencyManagement dependency, which is like a parent dependency for the Oracle database JDBC dependencies. I'm going to copy that, come back to my project, and scroll down in the window here on the left in the project pom.xml. Double-click.

And you'll notice, by the way, that persistence.jpa.PersistenceProvider is in red. It can't resolve it. It doesn't know where it's coming from, because it's not seen in the project. We're going to fix that now.

We're going to add the dependencyManagement right here before dependencies. Right-click and paste. And that's the database dependency. And the other one we need is for the database artifact, ojdbc10. This sets up the version in a higher level group so we don't have to keep repeating a lot of this information like version information. This is just how Oracle's doing it. But we do need the database JDBC dependency. And we need the eclipse.persistence dependency for the JPA.

So I'll take both of these from within the dependencies section of the XML. And please make sure you get this correct. Remember, there is a solution. If you go out to your Home and go out to labs, there are solutions for all the different parts. So the initial code, which we saw in labs 1, 2, and 3, is here. Lab 4, which is what we're working on that has the JPA code, is here. And lab 5 as well. And then lab 6, where we split them into microservices.

OK, so I need to add my dependency. So I'm going to come down here, scroll to the bottom, just to show you. OK, this time everything's fine. No errors. Do the reload with Maven.

OK, so now we've added the dependencies. And I'm guessing that, if I go back to persistence.xml, the red goes away. Great. All right, now we loaded the Maven changes. That's all fine. Now we're going to open our persistence window, which we did. We're going to change the persistence unit named EmpDeptUnit and add a user and password of HR.

So let's change that to EmpDeptUnit. Again, I like naming things according to how it's going to be used. And our username is HR, and our value here is HR. And, of course, there are other more secure ways to specify user and password for Java persistence. But for now, that's fine.

Now we'd like to assign this as a data source. And when we do that, that's going to make it easier to do our mappings and all. So I'm going to come down here to our EmpDeptUnit, right-click, and select Assign Data Sources. So in the window here, in Assign Data Sources, which you can see, are the data sources you have available-- in this case, just one, HR_xe. Select that and click OK.

And now what we're going to do is we need to do our mapping. The goal here is to create an Employee class and a Department class that'll have the correct JPA annotations to allow to be used with an entity manager in JPA to save and query the database. So to do that, I can either create the classes myself by hand and do the annotations by hand. Or, with tools like Eclipse and NetBeans and IntelliJ, it has tooling built in that will do this for me. It runs utilities that will do this for me.

So to do that, I'm going to right-click on the persistence unit name, scroll to the bottom where it says Generate Persistence Mapping. And, by the way, if your screen is too small, and it cuts that off, you can use the up arrow and down arrow on your cursor to be able to move up and down. So if you can't quite get to it-- and I've seen that happen-- just get down to it with the down arrow and then to the right with your right arrow.

We're using a database schema mapping here not Hibernate, because I'm not using Hibernate. Now this pops up a window that's going to ask me to map out my tables. And what this is going to do is, when I choose my data source, it'll scan the data source. Please make sure you have Show Default Relationships turned on. And there are the tables in my schema.

I'm going to first add the package where I want these to go. So I want them to be in io, helidon, empdept, mono, mp. I'm not going to put them into service. I'm going to put them in a new package called persistence, which I'm going to just type in. Notice that it comes in red. It'll create that for us.

I can also define an entity suffix or prefix. Some people like putting prefixes or suffixes on their entities. I don't. I like them singular, because for me an entity defines the rules of what it takes to be an instance of that entity. So I have singular, whereas things like table names for me are plural. But again, that's a personal preference. People do it different ways-- stylistic thing.

First table we need is DEPARTMENTS. Click DEPARTMENTS, expand it out. And we're going to move this over so we can see it more easily. The first relationship that we want is the employees by department ID. This will return a collection of employee objects. So I do want that. I'll click that on. And I don't want to see employees by manager ID. I don't need to see the department that is managed by an employee. We're not going to do that.

I'm not doing job history either for a given department, though I could get back a collection of job histories. And I'm not going to work with location. You are encouraged to do all of that as you go forward in order to add more complexity if you wish. But get the basic project working first. And then, if you'd like to add on to this and make it a more robust HR application, those relationships are there and can be added later.

All right, we're not going to bring in LOCATION_ID or MANAGER_ID. DEPARTMENT_ID, DEPARTMENT_NAME come over. That's fine. Let's move on to EMPLOYEES. Select that, and then expand it out.

Now this one's a little more complicated. There are two relationships selected. One is the employees by department. This is the department object that corresponds or is assigned to a specific employee. That we want. And that'll return a department object. The employees by employee ID is going to return the employee who is a manager of this employee. And employees by manager ID returns a collection of departments that would be managed by that employee.

And there is also an employees collection, as you can see here. This would be the employees managed by a given employee. We're not doing any of those. It adds-- we really thought just mostly redundancy and repetitive coding. But, again, you can come back and add that and create a nice HR type application.

Now, one thing we do want to include is the JOB_ID. And we're going to need that because we're going to do some work with the JOB_ID ourselves locally. Now, normally, I would've picked up the JOB_ID this way through the jobs and job by ID. But I'm doing it more manually in this case as an example.

All right, the rest of this looks good. A couple of changes I want to make here. The commission percent is actually a double. So I'm going to change that to a double. And the date is actually java.sql.date, not time. So I'm going to change that here. Now, if you don't make these changes here, you can make them later after the classes are generated.

So we are here in the workflow. We right-clicked. We had it assign the data source. We right-clicked EmpDeptUnit. Select Departments and Employees. We changed the map name. You can do that or not. That's what I did.

For Departments, we leave the attributes as they are. We picked up commission percent. We picked up-- I don't think I have it here on the screenshot, but we changed the time to date. And we'll put these into the source main folder.

OK, let's go ahead and click OK. It'll ask, "Do you really want to do this?" The answer will be yes. Yep, I want to continue. OK, where do you want the code to go? Again, we want it in the main folder, not the test folder. So we'll select OK.

We'll see that it'll generate some classes for us. It puts the classes up here into the persistence unit. Those are the entities that the persistence unit knows about. And it went ahead and it created our connect string and our driver for us.

So it created all the mappings for us. We want to ensure that the @Entity is there. So let's take a look at each class. Here's our persistence package. Here's Department. Department has @Entity. Great. Table name. We don't need the catalog, so we'll take that off.

And we see we have the collection of employees. That's the employees that are assigned to this department. We see the primary key for the ID. We see that column name. We see the basic columns. We also see the one to many returning the collection of employees for a given department. And that's the relationship that's being implemented.

For Employee, we see pretty much the same thing. We see that we have the @Entity annotation, the table. We again don't need the catalog in the case of Oracle. We do have our job ID, which is a string. We have our primary key. We have our basic columns. All that's what we would expect.

We also have our many to one relationship, which says that this employee relates back to one and only one department, thus retrieving a department object for us. And that's how we can get the department ID and department name automatically as part of this employee.

All right, so we changed the hire date to java.sql.date. Let's just double check and make sure that was done. Yep, hire date is java.sql.date. And we changed the commission percent and removed the catalog. All right, next up, we're going to create a class called Employee Department Manager to manage the JPA access. And we'll see that in the next video.

## 6. Practice 1-4: Create and Test Java Persistence Mapping (Part II) New 14m

We'll pick up in here, step 6, by creating a class called EMP/DEPT Manager that will manage the JPA database access. This is a common pattern to create a class that contains the EntityManager code and manipulate the database and then call that class from other classes that want database access.

In our case, we'll use the EMP/DEPT resource class to call the EMP/DEPT Manager class to do the actual database work for the REST resources. So we'll start by creating the EMP/DEPT manager class. And we'll start by creating our EntityManager factory and EntityManager.

So in this case, there's a number of things it doesn't know about. So we need to load a number of classes. So just hovering the mouse over it will give us the option to import the class.

This will be Java.util of course. All right, well, that's good. So that got rid of a lot of errors. A couple down here, the JSON object I'm going to talk about later, this has to do with some of the peculiarities of the JSON conversion code. The framework that we're using that is being used to convert between Java and JSON has problems with nested hierarchical relationships. And we have one of those between department and employee.

So what we found to make this work was we had to hand code the JSON object that represents a full department, a department and all the employees for that department. We'll come back to that a little bit later on. Also right now, department 2 does not have a get total salary method. We need to add that because the Department will have a transient attribute of total salary. It isn't stored in the database. It's a derived value that's calculated on the fly.

So with that, let's start with the Department class. And I'll come over here, and I'm going to add a new attribute called salary. OK? And I'm also going to generate the getters and setters for it. Now, technically I'm just going to generate a getter. Because you really shouldn't be able to set the salary. Salary is calculated. So I'm just going to do a getter method.

And I want it on total salary, which is long. Click OK. There we go. Get total salary. Now if we go back to EMP/DEPT Manager class, we should see the get total salary is now no longer red. We have no errors. And we're all set,

OK. Let's look at the code and see what this class is doing. First of all, it creates an EntityManager factory. And from that it creates an EntityManager. Now, this could easily have been done with an injection annotation and inject the actual persistence unit name. And you're encouraged to try that if you wish. We want to do things that are very straightforward and very simplistic, and then we'll add more complexity as we go. If you wish to use the injection, you're welcome to do so.

The first one we have get all employees. This method returns the list of employee objects by doing a Quick Create query on the EntityManager selecting E from employee and returning a result list, which is a list of employees from the query. Get By Last Name takes a last name, uses that as a bind variable-- notice the colon on the front-- creates a query and then returns all the employees with the same last name, since more than one employee might have the same last name. Here, get employee by ID takes an ID, parses it into a long and uses the Find method on the EntityManager to retrieve that object.

Here for Save, we have a Save employee passing a new employee object. We'll start a transaction context going, persist at using the EntityManager and then commit the transaction context. This is a fairly fine-grained local way to do it. And using a Java transaction API object would be a better way to go.

We'll see examples of that going forward a little bit later in other courses. Here we find the employee. So once we've committed and put the employee out there, we test it by getting that employee by that ID and returning the ID. So if it worked, we'll see that ID come back.

For the update, we pass in an employee object. And we use the merge to merge that employee object thus overwriting or merging any changes with what's already in memory. And then writing that to the database. For the delete, we pass in the employee to be deleted. And we call remove, and it removes the actual employee object. For the departments, we have a GET Department's method that we retrieve a query of select D from department D. All departments return a list of department objects.

Get department by ID, if we pass in an ID, we can use a find and pass back that specific department. And then down here, get employees by department leverages that method to get the Department by ID and then call GET employees by department ID on it to retrieve a list of employee objects.

The issue here is that if the Find by Department ID doesn't find a department, then the actual department object will be null. And this would fail. So one of the things you want to do in your validation and error checking is make sure that when you're searching for things, if you don't find anything, don't call methods on it.

So you might, for example, return a null here, for example, as opposed to actually calling the method. You might say, if the Department ID is null, then just return a null value, something like that. Then the resource manager, or the EMP/DEPT resource can see you got a null back, and it can choose to pass back a message saying, no department found, something like that.

Here we have the Department. We're going to return the salary by department, passing the Department ID. Find that specific department and call, get total salary. Now, the code for get total salary is simply sending back the salary variable right now. We're not actually calculating the value. We'll replace that with an actual calculation a little bit later.

As I mentioned, when we want to return a full department, that is, a department with a list of all the employees, we have to hand code the JSON object. So what we do here is we first of all get the Department by ID. Then if the Department is not null, notice we're checking for that here. Then we'll say, get us a list of employees. So we call department.get employees by department ID, cast it to be a list. And then we see that we get back a list of employee objects.

Now, if the list is not null, and the size of the list is greater than 0, meaning, we have at least one employee, we create an array of those employees. We create a JSON array Builder. We create the array Builder. And then we iterate through the collection of employees, adding a JSON object, creating the object Builder, adding the ID and the employee ID, first name, employee first name, last name, email, build that, add it to the EMP array and then go back to the next loop.

And what this will do is create a number of different JSON representations of the objects for the employees. Then we'll add the Department ID, the name, and the employee's array to the final JSON object. And that's what comes back. And you'll see that when you actually run it.

Now, what will happen is, when you start to test this, you're going to see that you're going to run into errors when you actually try to retrieve data from the database with a department and employee and then try to get JSON from it. And the reason has to do with the fact that the JSON libraries don't handle the recursive relationships very well. Meaning, when you retrieve the Department, it retrieves a collection of all the employees.

And for each employee, it retrieves the Department for that employee which then retrieves all the employees for that department. And it keeps going back and forth and eventually just blows up. And I'll try to show this to you as well.

So our solution then was to hand code to get full department and hand code the JSON object with arrays and all. And we thought this was a good exercise for you because this is something that you do have to do from time to time. We have coded the EntityManager. We have all the methods coded. And now we want to test them and confirm that they work.

So I'm going to create a new class here called test JPA. And this one we're going to use to test the actual code, so test JPA. And I happen to have one right here as you might expect. And I'm just going to copy all the code, all right. So let's see how we did.

So all this looks pretty good. There's my EMP/DEPT Manager. Here's where we're going to call get all employees, get employee by ID. We ran into an issue here. We created a new constructor for employee. Neither department or employee have an constructor right now. They have a default no argument constructor, as you can see, no constructors.

So that's kind of an issue. So let's take a look at how we're going to fix that. We need to add a constructor to the employee class that does all that. And of course, I happen to have one handy, all right. That looks good. So we've got our constructor. It's going to take an employee ID, first name, last name, email, phone number, hire date, salary, commission percent, job ID, department by department ID.

Now, this one is important. It does not take a department ID as a foreign key value. It takes an actual department object. Now, that will be important when we try to save a new employee. Because we'll have to associate an existing department object with that employee for the creation to work. And we'll point that out a little bit later, OK. So that's a constructor.

Our test JPA code should be good. It all works now. Great, and if we run this, we should see an output. The build may take a moment as you can see in the lower right corner. There we go. So a couple of things. You'll notice you get some warnings. Eclipse linked JDBC ORL as a property has been deprecated. It tells you what the correct one is. You can fix that if you'd like.

We do get all of our employees. Right now we're getting the hash value, if you will, for the employee. If you wanted the employees to actually show up as employee data, which you might, and it's not a bad idea for debugging purposes, you can easily add a toString method, which I'm going to do now.

So I'm going to come down here. And to do this, I'm going to right click and select Generate. And I'm going to select toString. And everything selected, that looks good. Click OK. There's my toString. And I'll do the same thing for employee. Then we'll run this again, we'll see some actual data. So I do it for Department, OK. Let's see.

It wants getters and setters. But I don't think we need to actually do it. It looks like it's compiling and running just fine. So I'll put this in, use it to generate, toString, click OK.

Now that we have the toString method printing out the Department, we're going to go ahead and write the code for the get total salary method. This is going to use the employees by department ID, which is a collection of employees. It's a variable with a collection of employees for this specific department.

We want to iterate through that collection of employees summing the salary as we go. Well, we could use a for loop to do this. Instead, we're going to use a Java stream which is more elegant and potentially a simpler solution, OK.

So first of all, we replace the get total salary method with the public long get total salary with an at transient annotation. This tells JPA not to save this value to the database. As I mentioned, this is a derived value. It's a calculation we're doing on the fly.

We start by setting total salary to zero. And now employees by department ID is actually a collection. And with a collection, we can ask it to see it as a stream. So this returns a stream representation of the collection. Then we can map the salary. We can call E dot get salary on each individual employee as it goes through the stream.

We can take the salary and map it to a long value so we get a whole set of maps of long values. And then finally, we can sum that map together into a sum of salaries. And that's what we return, return total salary. So stream is a way to do it. You could also use a for loop if you wanted to.

Hey, much better. There we go. Employee, first name, all that kind of stuff. That's great, OK. So Good. So we saw the data out there. We see the department's, employees for department, indirect list not instantiated. That's representing where it says indirect list not instantiated.

That has to do with whether or not the object on the other side of the foreign key is going to be read at that time. And we get into things like eager and lazy, loading and things like that. And we'll talk about that some as we go along.

But right now we can do everything we want. We can create a new employee, which we did right here. We can update the employee. So all the methods work. At this point, we've gone through, and we've tested that all the methods work.

We've created the class with the main method to test the JPA. They all work. And now we're ready to implement the REST resources that use this code. And that completes this practice.

## 7. Practice 1-5: Implement Resources to Use Java Persistence New 16m

Practice 1-5. Implement resources to use Java persistence.

In this practice, you'll implement the code for each resource and URL that'll look to use the EmpDeptManager to access the database and then test each URL.

Now previously, you added the code to the EmpDeptManager class to access the database. Now we need to call the EmpDeptManager class from the EmpDeptResource class which will then ask it to work with the database based on the URL requests that come in.

So we'll start by adding code to the EmpDeptResource class to call the appropriate code from the instantiated EmpDeptManager class like you did in the JPA test code.

So here's the EmpDeptResource, as it now exists, with a bunch of returning JSON objects. Now what we'd like you to do is rewrite this code so the implementation of those methods and the return types are more appropriate.

This has been done. And let's take a look at the result.

OK. Same basic class. We start off with a JSON builder factory to be able to create JSON objects. And we'll see how to work with that later.

We create the EmpDeptManager class. Now the EmpDeptManager class again, could have been injected. You could use injection here of the persistence unit-- excuse me, not the persistence unit, but of the EmpDeptManager class itself. We're not for simplicity.

All right. Here's our employee all path. Now we've replaced the JSON code just returning employees and all, with a different return type, a list of employees, calling the EmpDeptManager to get all employees, which will get back a list of employees. If the emp size is greater than zero, then return employees. Otherwise, throw a new web application exception with a response status of not found. So the web application exception is a nice convenient way to send back a response status of your choosing.

Next one, employee by last name. Again, basically the same code. Get by last name in this case. If employee size greater than zero, then there are some employees there. Go ahead and return just the first one. Now you can choose to make that a collection or a list of employees if you have multiple employees with the same last name. We opted for simplicity. Just return the first one. And then throw a new web application exception if not found.

For the employee with the ID, same basic thing. Get employee by ID. So what you're noticing here is that all the real major work is being done by the EmpDeptManager class. The resource class might do some validation, might possibly do some business logic potentially. But mostly it's delegating calls to other classes.

Here is our post. And in this case, we're going to create a new-- now we're calling create employee from JSON request. This is the one exception that you've got to watch for. Because the request as it comes in does not look like a actual employee or department object.

So what we had to do in this case was take the request that comes in in JSON and hand code it to be able to extract the data from the actual request. Now, there's a couple of workarounds for this-- other things you could do.

You could, for example, create one department persistence class and maybe a department JSON class, and an employee JSON class. And those classes are what you'd use to actually convert to and from JSON. And you simply write code to move data from your department and employee entity into your department JSON and employee JSON class.

Again, we didn't do that for simplicity. We also thought it was a good idea to have you get experience in actually pulling apart a JSON request, and working with the different fields.

So here's our JSON reader that will read the request coming in. This is when we're doing a Save-- or an update. We read the object, extract the Java object, the JSON object, the Department ID in this case, to get the Department ID.

We get the employee ID-- first name, last name using JSON object.get. We then get the JSON object for the string date. We convert the string date to a SQL date.

We get the JSON commission percent. We find out if the commission percent is null. If it's not, we return its value as a double. If it is, we just return a null. We get the phone number, the salary, and the job ID.

We then go look for the department-- as I mentioned, we need to take the Department ID, go find a department object, and use that in the constructor.

Now, this is a new constructor. And we don't have that constructor yet. And we need to go to the Department class and add a constructor that does this. We'll do that shortly.

So that's the actual coding for the entire EmpDep resource class. If we go to department, then we just need to add that constructor.

And notice our error goes away. OK. So now we can create a new department with a department ID and department name. And we can work with that if we need to. So there's a new department.

And then we can use that new department as the basis for building a department and creating a new employee. So remember as I said, when you create the actual employee, we don't pass the Department ID. We pass the Department object, which is used by JPA to extract the Department ID and use a correct foreign key value.

All right. Let's see how we're doing. So we show you the code to replace it and what that code may look like. Again, remember, we're expecting that you have experience with JPA, you have experience with REST annotations. If you don't, there's additional training that you can take in order to be able to pick up and fill in those gaps, and then come back and complete the lab exercise.

All right. We noted the inclusion of the web application exception to generate a status code of not found if the collection of employees comes back empty for example. Consider similar error handling for all the methods in case something fails.

When you run some of the methods, like get all employees, you'll see a recursive error when the Department object is retrieved. Which then retrieves all its employees, which then retrieve their departments, causing an infinite loop that then errors out.

To prevent this we add the at JSON B transient annotation to the department's get employees by department ID method, which tells JSON converter that it's transient and not to do the actual conversion.

Now, because of that, we have to manually create the Department with its employees. But that's an option we select in this one case.

We code each Handler method calling the EmpDep manager object like we did in the JPA test. And that's why we had you do the JPA test first. Because then it's a very easy method to copy the code from the test into the actual resource handler and use it there.

Now, when working with the employee, the save and update methods cannot convert a JSON request into an employee object because the JSON for the post and put request is slightly different than the JSON for the employee class itself. You heard me mention this.

You can handle this in different ways. The practice solution uses JSON object to build a custom Java object from the JSON request before saving or updating the employee to the database. This was selected to gain experience working with JSON object and JSON array, so you can manipulate those structures.

Alternatively, as I mentioned, you could create a separate employee class that mirrors the JSON exactly, and write code to move data between the persistent employee entity object and the JSON employee object. And then the JSON can create objects from the request.

Both solutions have advantages and disadvantages, although the separate JSON employee class tends to be the better option overall. And this is an optional advanced challenge that you can try after you get the application working as required.

Now, my recommendation is get one URL working at a time. When that's working, go on to the next one. Don't try to get them all working at once. It can be a big confusion.

Also, it's going to take you longer to get some of this working than you think it will. For example, you're going to run into the issue of trying to convert the department employee into JSON. And it's going to error out. And you won't know why. And when you scroll down and look at the error, you'll see it's recursive. And we'll see if we can replicate this for you.

Remember your tables have foreign and primary key constraints. So if you insert a new record, and you try to insert a new record again, it's going to error out because it already exists. So for example, if you insert a new record then call the delete right after that, or go into the SQL Developer and delete it from there as you're testing your insert and your update.

When all the URLs are tested and work correctly, congratulation. When all the URLs are tested and they work correctly, congratulations. You're now ready to take your monolith and break it up into microservices. And that'll complete this practice.

Before we do that, I want to go and show you what happens when you try to generate JSON without a Jsonb transient. OK. Let's take a look at that.

OK. Let's test this and see what happens. By the way, some of you might have noticed that when I added the department constructor that takes arguments, I didn't add a no argument department constructor. And you do need to do that, or you get an error. OK.

Let's take a look at the EmpDeptResource. And in EmpDeptResource, when we request, we're going to do this. We're going to request the department department ID employees. And this is going to return-- go out and find all the departments-- sorry, all the employees for a department, and try to create a list of all the employees for a given department. And we'll see what happens.

Now, if we run this-- and that could mean going to main, right clicking, and select Run, or using the run configuration up here in the corner-- when this runs, and we test it, we're going to see that we get the recursive problem.

So like I said, there is a known issue with recursion conversion in JSON, in the JSON libraries. Now there may be other JSON libraries that work better. The one that we're taking is the default, or the default one that comes with the project. But you can choose other libraries by changing your Maven dependencies, of course.

All right. Let's go ahead and test this. And in Postman, it would look like this. We want department 60 for all employees. Click Send. And after a moment--

It blows up. We get a 500 internal server error. And as I mentioned, recursive reference has been found in class EmpDeptPersistenceEmployee because it's trying to pull department. So department is trying to-- it can't serialize department correctly, because of the recursive nature. Because as it retrieves department, it retrieves employee, which retrieves department. And I think you can see this if you go into debug mode, where you can see it.

If you go into debug mode and debug say about like right here, you can see that the department is composed of employees. And those employees have departments. And those departments have employees. And it just explodes.

So to get around it, we hand coded the JSON to do it. And I've talked about how to do that. We need to put the @Jsonb annotation on get employees by department ID.

So we go over there to the one to many. That's on department, if I remember correctly. Is it right? One to many. Yeah. So it goes here.

And what this will do is it will prevent the recursion from happening. Though we won't get the right output in that case. And that's why we have to hand code it. But we can try re-running it. That just reruns it. Go ahead and stop and rerun. Very nice feature-- it will just rerun it for you, stop the JVM and rerun it. And let's see if that fixes our problem.

It does. Sort of. And what you see here is what we get back is the department and the employee repeating over and over. Now that's not exactly what we want. And this is why we hand coded it. By hand coding it, we can get the department once, and an array of employees. And this is why we hand coded it, because of this.

It didn't create it correctly by putting on the Jsonb transient, it doesn't keep going back and forth and back and forth. It just picks up each one and repeats it over and over. And that's why we hand coded it.

Now, my suggestion is, there's a number of subtleties and things going on here that you may want to play with. There is, for example, use of eager and lazy, for the one to many and many to one relationships.

There's also crafting the actual JSON object itself from the department and the employee. There's other methods you can implement as well.

You might also consider creating a class called HR resource and using that to handle all your resource requests, and using an employee resource class, and a department resource class to handle the individual resource requests using sub-resource locators in that case.

There's a number of different design patterns that you could go through. The point here, though, is really to get this working. Get your JPA working. Get your JSON working. Get Helidon working.

You have a deployed RESTful web service that does everything it's supposed to do with error handling, which you can use in future classes as you go ahead and add new things to it. For example, in the follow on class to this, we're going to take the code you wrote here and deploy to Docker, and then to a Kubernetes cluster.

We're going to use API gateway to define the service interfaces. And we're going to use continuous integration, continuous deployment, a CI/CD pipeline, to do the deployments. So each of these courses build on the previous course.

This gives you the fundamental labs that you need in order to do the work following on. The next one is containers. Then after that infrastructure. And then we add as we go along, and learning it more and more as you go.

Ideally, when you finish this series of courses in this learning path, you'll have used all these different techniques in context of a single application that eventually is used to extend, customize and enhance a software as a service application in the Oracle Cloud.

All right. Last thing I want to mention is that you can save all your work to GitHub if you wish. And you should be able to access GitHub through your browser. You'd need your own GitHub account. Log into it and then you can post your code to it. So if you built it here, you can take it with you.

As we wrap up this practice, we've seen how to code each of the different handler methods. We talked about having to use JSON for the post and put requests, and be able to pull the request apart itself. We talked about alternatives of creating a separate employee class that mirrors the JSON and a separate department class and moving the data back and forth between the department and employee entities and the JSON classes.

So once you have each of the URLs working, and do each one at a time-- get that working completely before you go on to the next one. Each URL should work. You should test them. You should also use SQL Developer to refresh the views of your employee table so you can see the immediate effect. So when you do an insert, you'll see the row appear. If you do a delete, you see the row disappear. If you do an update, you see the row updated. Use that to check your work.

Also, keep in mind that the tables have foreign and primary keys. So if you try to insert the same employee twice, you'll get an error on the second one. That will be a database error. So remember, after you do an insert of employee, that you want to delete that employee potentially before you do another insert.

So when all the URLs are tested and working correctly, congratulations. You're now ready to take your monolith and break it up into microservices, which is what we'll do in the next practice. And that completes this practice.

## 8. Practice 1-6: Migrate the Monolithic Service to Two Microservices New 6m

Practice 1-6-- migrate monolith service to two microservices. In this practice, you will migrate your monolithic EmpDeptResource service into two separate microservices. You'll create two new projects, one that will implement the employee resources and one to implement the department resources. You'll need to create two different managers, one for the employee and one for the department. For simplicity in this course, you'll use the same database and account, HR, for both services, though typically in microservices, you do use a different data store for each.

Now, each project will need its own main method to start its own instance of Helidon. Remember to change the port for one of the servers in the microprofile-config.properties file to a different port other than 8080 and we'll show you where to do that. Once you do that, you should be able to run each service in its own server instance, yet the URLs will still work, just on a different port. And once you have that working, that completes the practice for this course.

All right, so here I've duplicated the Helidon EmpDept mono project, and I've named it Helidon dep department mp. One thing I need to do is to change its actual name here. So I'm going to right click and select Refactor, Rename. And now I can change it to the-- so I can change the module name.

So what happens is the project name is helidon-department-mp. I'd like the module name to be the same. So I'm just going to change that to department. And we're all set. And there we go. So now we're good.

So this is basically what we already had we had. We have the EmpDeptResource. We've got all that. We've got the department. We've got the EmpDeptManager. So really what you would do is you'd create two projects-- one called Department, one called Employee-- and just remove what you don't need.

You will need the Department and Employee entities, because they're using each other. But for example, the EmpDeptManager could be renamed to just DeptManager. And the nice thing about the refactor is it'll change it everywhere, and it'll all still compile and work.

Now, in the DeptManager, clearly we don't need things like get all employees, so you could just take all this code out. You're just going to take all this code out, and get you down to where you get into departments. Now clearly, you would do something similar for the employee one. You would go to the Employee project, refactor EmpDeptManager to EmpManager. And then in the EmpDeptResource, you would rename this guy to DeptResource.

And that's really all we're asking you to do in this case. We're not going to be doing any interservice communication. We're not going to be doing stuff like that. So we'll do some of that in later lessons and later courses. We just wanted you to get started with the basic resources here and get used to the model that we're using.

So I'm going to change this, then, to DeptResource and refactor. And of course, you notice you got all these errors. But that's because it's accessing employee stuff, which it shouldn't actually do. So we'll take out all the employee paths, leaving just the department. And that, sure enough, is what we've got. Great.

Then at this point, the one thing we have to do is make sure that our config file is correct. There is a microprofile-config.properties file. Now, we don't go into all the layers of configuration changes and where they get overridden, but there's several layers. But by default, you can put configuration properties into the microprofile-config.properties file, and reference it based on the name here to get the value there.

For example, if you want to get a greeting there's an app.greeting property that you can retrieve which would retrieve Hello. Now in this case, the server report is being set to 8080. Well, that's in the Department project. In the Employee project, I'd go into the same file, but change that to 8081. Clearly, if I'm running two instances of the server-- one for department service, one for employee service-- those must run simultaneously and listen on different ports. Once you have that set and running, you should be able to start each of these projects.

They should both be able to run. You should be able to make the queries to your employee-- queries to your department and be all set. And that's really all we're looking for. And then what you can do is you can use your browser, and you can log into your GitHub account, and you can upload your-- I would say compress your projects first, and then upload them to your GitHub account. And you could potentially use them in later courses.

Lastly, what I want to say is that there's a lot of other design patterns you could use here. For example, you could have a single HR resource that handles all the incoming requests. And then that HR resource calls the Department resource or calls the Employee resource to handle those specific requests. And those could use a department manager as a service or an employee manager as a service and be able to see how those services were called. And you can start up a little service mesh that way as well. We'll see things like that in later courses.

So with that, we've seen how to take a Helidon application, a monolithic application, handle REST requests, handle JPA requests, split that into microservices, get both running at the same time. And with that, that completes the practice for this course. Thank you.
