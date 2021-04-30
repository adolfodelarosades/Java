# 2 : Project

1. Project Description New 6m
2. Demonstration of IntelliJ IDEA New 30m

## 1. Project Description New 6m

Java on OCI, Developed Microservices. Lesson 2, Project Description. In this project, you're going to create a REST resource service class to support URLs that will perform basic create, retrieve, update, and delete, called CRUD, functionality on the back-end database using Java Persistence API. Your resource class must reply to each of these different URLs.

GET /employee/all would return a JSON representation for all employees retrieved from the database. A GET with id and the ID value returns the employee with that ID, or an error message if there are no matches. GET employee and the last name returns an employee based on the last name.

The POST adds a new employee via an insert. And the PUT updates the employee via a merge. The DELETE employee would remove that employee from the database. The GET department/all would find all the departments and return the JSON representation for each department.

The GET department/id would return that specific department based on the ID. GET department/id/salary finds the total salary for all employees by department and returns the total salary for that specific department. And GET department/id/employees finds all the employees for a department by department ID.

For this course, we're using the HR schema from the Oracle db-sample-schemas, which are available on GitHub for free. You can download it from https://github.com/oracle/db-sample-schemas. And there is instructions on that page on how to install them. So you can install these on your own database and try it yourself if you want it on your own machines.

Note that we are simplifying the employee department relationships. We're keeping simply the one to many relationship from department to employee. And we are removing the recursive employee to employee relationship for manager. And we're removing the relationship where an employee manages multiple departments.

This is an effort to keep the redundancy and repetitive coding to a minimum. Of course, if you want a greater challenge, once you have the assigned project specs working, you can go back and add these additional relationships and implement them if you wish.

Here we present the suggested methodology for solving the project. Overall, you'll start by using Helidon MP QuickStart to create the initial project. You'll open the MP QuickStart project in IntelliJ and this will hold the monolithic application. You'll code placeholder methods for each of the URLs to support and confirm the URLs work before adding the JPA code. The URL should simply send back a simple JSON message indicating that the URL works.

You'll use the IntelliJ tooling to generate a JPA persistence unit and mapping the database tables in the form of Java entity classes. You'll create a manager class which will encapsulate that JPA functionality. Then you'll test your JPA functionality and confirm that you can find, save, update, and delete entities. You'll then code a class to encapsulate that JPA entity manager code and then amend your resource class that's handling the REST calls to use the manager class to provide JPA support to the resource URLs.

You'll return all your results from your REST service in JSON format. You'll also accept inputs in JSON format. And you do the conversion between the two, though most of that's done for you by the framework. Specific formats that you're supposed to meet are in the activity guide. You'll also include error handling when an entity is not found, returning an appropriate message.

Once the monolith is working, you'll create two new projects-- one for the employee microservice and the other for the department microservice. You'll refactor and copy the monolith code into these two separate services and confirm that both services run in separate servers with different ports-- 8080 and 8081, for example-- at the same time and work correctly.

You'll want to consult the activity guide for more steps and more defined formats. Remember, the steps focus on what you should build, not step by step how to do it. For that, you must use your own experience and supplement it as needed with additional digital learning from the Java Learning Subscription. But the coded solutions as well as step-by-step solution videos are provided if you get stuck and need a bit of help.

We'll close this lesson with a full demo of how to use IntelliJ IDEA IDE. We'll see how to open a project and adjust project settings, manage run configurations, use an Oracle database as a data source, and create our JPA mappings, and then modify the required persistence unit. We're doing this because while IntelliJ IDEA is very popular, not all students may be familiar with it and may not have used it for database and JPA tooling. So we'll show how to do that as part of the demo. Thank you and good luck.

## 2. Demonstration of IntelliJ IDEA New 30m

Welcome. We're going to take a look at the use of IntelliJ here in the lab environment, and see how to use its basic services. Now, to get started, we're actually going to create a Helidon project first. And Helidon has a nice Getting Started link here. And if we go there, there's two Helidon SE, Standard Edition, and MP, Micro Profile, that's what we're using. So we'll click on Get Started.

And it gets you started by giving you a demonstration project that you can create. So Maven is already installed here. And if we run this Maven arch type, then we'll see that we can actually generate a project. And of course, you can change these settings. And you'll do some of that in the actual lab exercises.

So I'm going to go over here and open up a terminal. And simply Edit and Paste what I copied. There it is. Press Enter. And you'll see it run a bit.

Now, if for some reason, you already have a Quick Start MP folder, it'll give you an error. And you'd have to delete it, or rename it or something. But here, we don't have the folder. It should run all the way through and, basically, generate a project for us.

Now, we can, per the instructions, go on and build the project with Maven and run it and test it and do all that kind of stuff. And even you can go further and build the Docker image and play with Kubernetes. Now, we're going to do all that in a later course. For now, we just want to get started with Helidon and our REST services.

So we have our project. And if we take a look, if we come over here and do an LS, we'll see that, indeed, it generated a project called Helidon Quick Start MP. OK? Now, what we're going to do is we're going to start up the IntelliJ IDE. And we're going to open that project. And we're going to make some changes to it. I'm going to show you how to do the various changes that you need in IntelliJ.

Now, you might already be familiar with IntelliJ, so maybe you don't need to watch this as much. But if you're new to it, then this is probably going to help you some. Now, IntelliJ, in this environment, has not been configured and installed yet. That's something you need to do.

So we're going to CD. And this is in the lab instructions to do as well. But I'm just going to show it to you. I'm going to CD to IDEA. And then I'm going to CD to bin. And that's where the binary file is.

And sure enough, we can see there's an idea.sh file that we want. And so we're going to run that. So I'm going to type sh ./idea.sh. My microphone's kind of in the way, getting in my way of typing. Let's see, will that work? Yeah. OK, so this is going to start up IntelliJ. It's using an OpenJDK server, but we're going to change that when we get into IntelliJ.

Now, the way this is set up in the lab environment is you're going to confirm the terms of the agreement, if you agree to it. And it's fine. We've worked with JetBrains, and they're allowing us to do this. We're just installing the evaluation version and using it for 30 days. You may not need it for all 30 days.

All right, so click Continue. And then, I'm going to say yeah, send anonymous statistics so the product gets better. And let's see, there we go.

Next, the desktop entry. I like the light mode. But if you like dark, that works as well. So desktop entry, yes, we want to create a desktop entry. That will give you an icon on the desktop. So we do want that.

And then launch your script. There's nothing special that we're doing here. So we'll go to Default Plugins. Many default plugins are already installed. The ones that we care about, Java Frameworks, for example. OK, that's all we're going to use.

But notice there are version tools for GitHub. There are application server tools, build tools. We'll be using the Maven tools for that. Those are already built-in.

And then the Feature Plug-ins, there's one called IDE Features Trainer, which we will install, which will give us hints on how to use the IDE itself better. You don't have to do this. That's completely up to you. All right, and also learn the IntelliJ shortcuts if you want to do that as well.

All right, so I'm going to click on Start Using IntelliJ. Now, what you'll see is a screen that'll come up saying this is an evaluation version. Do you want to evaluate it? And you will say yes. So you'll click Evaluate For Free. And make sure you click on the Evaluate button.

Once you do that, IntelliJ starts. There we go. Now, once IntelliJ starts, you're going to notice that if we stop it, that we should have the program icon. And we do. It's actually not on the desktop. It's under Programming. It's right here.

And you can just simply drag it to your desktop, like I'm doing. It doesn't specifically put it on your desktop. I misspoke. It does create the icon for you. And now, you can use it by just double-clicking.

So what we're going to do now is open a project in IntelliJ. And we're going to open a Maven project. And we'll see what that looks like.

So the first thing we'd like to do is to get this Helidon application running in IntelliJ. And we'll see how to do that. Then we'll add the JPA bits. And we'll see how that works as well.

Now, this is really meant more as an introduction to IntelliJ. This is really not about the lab exercises. The solution to the lab exercises and going through the various activity guide practices, that's done in a separate solution video.

All right, we want to Open or Import, so we'll click on that. And it'll pop up a window. And if we take a look at everything we've got there, we want to go to the Oracle directory. And when we open the Oracle directory, we'll see, after a moment, sure enough, there is a Helidon Quick Start MP folder.

You'll notice a little icon in the corner indicating that this is a Maven project. And it can be opened by IntelliJ. So we'll select it. Click OK, because it has a POM file, which defines the Maven dependencies. It actually sees that file, and then opens it for us. And there is the POM file being opened.

Now, the first time you open this, it's going to do a lot of background scanning so just be patient for a couple of minutes, and it'll finish. Look in the lower left corner, and you'll see you'll be doing all kinds of things, like updating indices and stuff like that. It also gives you the tip of the day. I like tips. So I keep it turned on. You can also go to next tip if you want. I'll get and close at this time. It's still indexing dependencies. I do recommend you wait until it's completely done before proceeding.

The next thing we want to do is we want to make sure that the JDK is the correct one that we want. And we also want to take a look at our source code. Notice it's also resolving Maven dependencies. So the Maven dependencies are being read and downloaded and brought into the project.

All right, so it's still downloading. It's going to take a moment. In the meantime, we can go to File. And we can go to Project Structure.

OK, so first thing we see is there's no SDK selected. So we're going to go ahead and select that. And we want to use the 11 version, 11.0.4. So the first thing you got to do is make sure you select version 11.

OK, and then Project Language Level, you want 11 as well. So you want 11, 11.0.4, which is already installed for you. There's your local variable. That all looks good. Click OK. This should take care of a lot of errors or things you might see in the source code. Let it finish downloading the plugins. And now, you can see the project starting to open up.

We now see that it's indexing JDK 11. This will take a few more minutes. And once that's done, we'll be ready to proceed.

All right. IntelliJ is finally done indexing. We can see the project structure here. I'm not going to go through all the different windows and how the UI in IntelliJ works. You can go up to IntelliJ and read about that if you want to. And there's other things to look at as well.

All these things that you see here are basically windows that'll open that you can look at more information on. Here's our project window. We expand the Helidon Quick Start Project shown as a series of folders. Folders are composed, in this case, of Main and Test. Main has Java. Java has the entire package in it. io.helidon.examples.quickstart.mp.

There are two classes initially-- a resource class, which handles the actual URL calls. Here, for example, is the path annotation for the greet portion of the path. And a greeting provider, which provides the code to actually carry out what the actual requested calls do.

There's also a test folder in here, which has a Main Test. And you can use this if you want to test the class. Although, it has other annotations in it that will just do the test and then stop the server. If you want to keep the server up and running, we have to do it a little bit differently. And we'll do that shortly.

OK, so we have opened the project. We've looked at it. We'll double-click on the POM file. I'll show you that as well. So here, you can see the POM for the Maven project.

Now, if you make changes here, you can either right-click. Right-click is your friend, so a lot of good things are available under right-click. Right-click. There's a little bit of delay because of the VM that I'm using.

But if you come down to Maven and come up to Reload Project, it'll do just that. It'll reload, re-scan all the Maven dependencies. Now, there's a shortcut to doing this. If I make a change, for example, I'm just going to arbitrarily change that from zero to one. Notice it turns red because right now IntelliJ is saying, hey, I don't know that dependency. And this little icon up here to load the Maven changes as a convenience is there.

If I click it, it'll try to load the Maven changes. And of course, it will find that you can't just arbitrarily say 2.1.1. That's not a valid repository artifact ID.

So I go back and put in the zero. Again, it was just to show you how it works. And how the errors pop up. Re-scans. Error goes away. And then we're done with the window. OK? All set. And again, you can close the window if you want. In this case, you can just simply hit the Minimize button. There we go.

OK, so that's the POM. And that's the portion of the project. And then what we see here to run this is we have to run a main method. Now, Main Test doesn't actually have a main method, as such. It's doing it through test annotations. So we're going to create a different class up here in our Quick Start. And I'll create a new Java class called Main. And that'll have our main method in it. There we go.

All right. Now, the first I want to do is add a main method. Now, IntelliJ has a nice ability to let you type a few key letters, and then when you hit Tab, it fills it in. So there you go. There's a whole public static void main.

And this even works with system out print lint. SOUT will print out an entire system out print lint. And I'll just put test here just to show how it works.

All right. And there's others. If you go up into Tools and Preferences and things, you have all kinds of settings and things you can look at in the IDE. We're not going to cover that here. What I do want to do is copy some code. I want to take these two variables and paste it in. OK?

And then I want to get the code to actually start the server. So the code to actually start the server is here-- server.servercreate.start. There's also configurations you can define. Lots more things you can do when starting up the Helidon server, which is what this does.

The way this code works is it starts up the Helidon server, which then listens for requests. And when a request comes in, it'll resend those requests to resource classes that can handle those URLs. So I'm going to take that code and come over to my main and just simply paste it in. There we go. And that's pretty much it.

Strictly speaking, we don't need the server URL, but that's fine. We just really need this. And I'm going to run this file. Now, to run it, just right-click and select Run. That works. And it'll actually run the file for you. Notice it'll actually give you the name of the class that's running up here in the Run Configuration.

It'll do a build the first time we're running it. So it'll do a build for us. And then build and stuff is available under the Build menu here. OK, so it started. Helidon server is coming up. It's outputting information. There is the test. That was the initial in the main method that I printed out. There's a test.

And what we're looking for is a URL. And when we see that URL right there, server is started. The server is started and running. So now, if I click on it, it will open up a browser, which, of course, will say that it doesn't have a handler for path/.

But if I put, for example, /greet-- whoop, let's try that again. I messed something up. There we go. That was it. OK, there's my greeting, Hello World.

And if we do health-- whoop. OK, there's our health done as JSON, how the server is doing. And there's also one for metrics as well. We're not going to work much with metrics or health in this course. But in later courses, we'll come back and use this to help run our Kubernetes cluster and see our services are doing and stuff like that.

OK, so Helidon runs. It works. It's fine. You stop it with the Stop button here. That stops it running.

Notice that by running that class, it gave us what's called a run configuration. If I click on Edit Configurations, then you can create other run configurations if you want. Notice it picks up the main class as the default, but you can certainly change that. And you can put in VM options and program arguments and things like that. OK, nothing that we really need to do now, but that's fine. Everything works.

So we can run Helidon. We can run the application. It looks good. We can open the project in IntelliJ. We can run it.

Note, please, that there's also the ability to debug it. If you click on Debug, and you put in breakpoints, you can do that. Not going to go through how to do breakpoints and do all of that. I would leave that to you. If you want to learn that IntelliJ, then certainly that's available for you.

So with that, what we want to do next is move on to the database portion. Now, when working with database, there's two issues when working with a database in an IDE like this. One is you need a database connection at runtime for the application that's running in the Java virtual machine to connect to the database. That's one database connection. And that's really the one that you use at runtime and the most important one.

But tools, like IntelliJ or Eclipse or NetBeans, they have tooling built into them that will actually go out and, at design time, connect to the database and read the database metadata and generate Java classes that represent the mapping to the database tables. This is what we call object relational mapping or Java persistence architecture, which are the Java classes with annotations that represent the tables in the database. Now, clearly, you want to start with a understanding of the database and your tables and the relationships between them so you can set things up correctly.

And you don't need to use the tooling in IntelliJ. You could hand code all the annotations if you want. Personally, we think that's not a great use of your time. So we're going to show you the tooling that's built into IntelliJ to do it.

So the first thing we need to do is we need to add the ability for this project to have persistence. Right now, if you look over here on the left, there's a Structure tab that shows the structure of something that you're looking at in the Editor window and a Favorites tab that you can look at for favorites, but there's nothing about persistence.

There is, over here on the right, however, a Database tab. And if you click on it, you have the ability to create a new database connection, a data source, what we call a data source, which will be Oracle data source. Now, this is used at design time to do the mapping.

It will also provide information for the connect string at runtime as well. So we'll start here with the data source. And so over here, over here on Database, Data Source, scroll down to Oracle. OK, it's going to pop up and go, OK. So what information do you want for your Oracle database?

Now, in this course, for simplicity, we are using a local 18c XE database. It's very easy to install. It gives you full Oracle capability. And we didn't really need all the features of 19 or 20. Now, in later courses, you'll be using the autonomous transaction database in the Oracle Cloud infrastructure as your database. Here, we wanted to use a local database not to complicate things with working with Wallets and things like that.

OK, so the first thing I need to do is give it a name. I'm going to call it HR_XE because it's my HR schema on the XE database, although, technically, it's on the XE PDB1 service, which I will then change. So we're using a containerized database, a pluggable database.

The actual container database is XE. The pluggable one that we're connecting to is a service name. And the service name is XEPDB1. You don't have to remember this. This is in the lab guide. And we talk about that.

Local host, that should be fine. User, HR. And password, HR. And then we come down here.

Now, notice before we can test the connection, we need to download missing driver files. You only do this once. Click Download. And it will try to download the actual files necessary. And it did. That's, for example, the OJDBC files and such that Oracle needs.

Now, if we click Test Connection, it comes back and says it connected to the database. It all works. 270 milliseconds for a ping. And we're all good.

So now, we have a data source and a driver. We click OK. And we get a couple of things. In this case, it wants access to the login key ring. So we use our password. Try that again.

Yeah, so it's not wanting to store it in the key ring. And if that happens to you, don't worry about it. Just Cancel. That's not an issue. It will store the password in the persistence file. And I'll show you that in a moment. But you can try connecting, but I think it wants the actual root password, not the Oracle password that I was giving it, but, again, not really necessary.

So now, we've got our HR_XE. And there's a console here as well. So we can do actual SQL here. We can do SELECT, for example. Let's see SELECT* from Employees.

And if I execute that, potentially. Let's see. I think it's hr.employees. Yeah, hr.employees. We should be able to run it. What do we got?

Let's see. Zero so far. Oh, it didn't like the password. Let's see. There we go. OK, so it took a couple of tries, but you did see the query goes through. And it does work. So you can use the console if you want to execute queries.

And here, over on the right here, we can actually, in theory, we can actually expand things out. And we can see the data source properties. We can refresh it. Refresh the connection to the data source.

So I think maybe I didn't save the password when I set this up. Let me go back and try to fix that. And let's see here. HR, and it's hidden. HR, that should be fine. Save forever. XEPDB1. All looks OK. Apply.

Oh, it's not saving the password. That's why. So it'll ask me for the password each time. Let me try the root password and see if that'll fix it as well.

No, it's not working. OK. Hopefully, this will get resolved in the lab environment that we provide for you. But notice it is actually seeing what it needs to see now. It's seeing the tables. You can actually drill down into the countries. You can actually double-click on this, and it'll show you data coming up.

It may keep prompting for the password. That won't be an issue when you run the actual application because the password will be supplied. It's mostly because of the IntelliJ tooling. All right, well, that's neither here nor there. So that's OK. It's not a problem.

What we're going to do now is work on the JPA mechanism. By the way, I don't use this inside of IntelliJ, this portion inside of IntelliJ. I use SQL Developer. So we do have SQL Developer free download free install from Oracle that gives you access to the database. And in the lab environment, you actually do create your own connection. And I use SQL Developer for this sort of thing. And don't have those kind of issues.

Now, this is done in the lab guide. I'm just doing it to show you. And here we want HR and HR. And here, I want-- whoop, where'd it go-- HR. And save the password. Local host is fine. Service name is XEPDB1. Test. Success. Click Connect.

And now, you can just drill into the tables here. And this is actually what I do. I don't normally use it inside of IntelliJ. One, because that key issue. But that's not a huge issue. And it's easy to get around. And you get a look at the different tables. And like, we'll work with employees and departments.

And if you know SQL Developer, that's great. If not, in the activity guide, I have a link to a little tutorial. But you can see the columns. You can see the data.

You can do all the kind of work with data that you want. You can add rows, remove rows, all that kind of stuff. OK. And we'll use this throughout the lab exercises in order to test your inserting or updating and making sure that's working correctly.

All right. Let's see. So from here, we go back. I'm going to actually just cancel out of this. I'm not going to worry about the console and all the database stuff. So I'm going to close that.

We do want the database connection for the mapping that's coming up. Now, for the mapping, we need to add a framework support. So we right-click on Helidon Project. Right-click. And after a moment, it comes up. We want to add framework support. Select that.

And then the one that we want is Java Persistence. So if we scroll all the way to the bottom, sure enough, there is Java EE Persistence. Select it. And it's going to ask you, first of all, what version do you want? 2.0 is fine for us. If you had other versions you wanted to work with, you could select that.

And what provider? Here, we're using Eclipse Link. That is the reference implementation for Java Persistence Architecture.

But you if you're familiar with Hibernate, you could use that. If you're an Oracle person, and you have access to Oracle Toplink, you could use that. We're just going to use Eclipse Link.

And I'm going to click Configure because this will download the necessary libraries. So it'll download the right libraries. Click OK. Copies of files. Give it a second and should be good.

All right, and there's a little bit, as I said, a delay in this environment. So I'm just checking to make sure it does run. Looks like it did. I'll click OK.

OK, so what happened as a result of this? Well, what happened is if you look over here on the left, there's a new tab called Persistence. And if you click that tab, you will see that you now have a Persistence XML file called New Persistence Unit. Double-click on the Persistence XML file. And what we're going to do is you can change the name if you want.

Also notice that you have a Persistence JPA persistence provider. We have to update the POM in order to be able to see that. Now, we're not going to do all that here. That's something you do in your lab exercise. And we talk about adding that, for example, and going to the POM. And we give you what to actually put in for the Oracle database dependencies and for the Eclipse Link dependencies.

Then notice here under User, we'll type in HR for the username and HR for the password. And of course, there are other ways of making passwords and usernames available to JPA. And then here, you'll get the JDBC URL. That's the connect string and then the driver. All that will get filled in. So that's actually how we go ahead and do that portion.

Now, once that's done, once those are set, what we'll do is we'll click on the Persistence Unit. And we'll select that we want to do generate persistence mapping. And down here, we'll do by database schema. If you're using Hibernate, use Hibernate Mappings. I'm using by database schema.

I select that. And it pops up. And we get this nice little mapping dialog. Make it a little bit bigger. First of all, what's the data source? If it doesn't come in with the data source selected, then select the HR data source we already created. Notice it'll scan the tables out there. Make sure to click on Show Default Relationships. That'll include foreign key relationships.

It'll want to know what package to put it in. And so we'll go out, and we'll find the package that we want is IO Helidon Examples Quick Start MP. Now, you can, of course, put it wherever you want. I'm going to put it into a sub-package called Persistence. And I'll just type that in.

OK, notice it's in red. It'll create it for us later. It's asking us do we want a suffix for our entity classes. I don't use suffixes in my entity classes, so I'll remove that. And notice how it removes on the mapping.

First thing we're going to map is departments. So I'll click Departments and expand it. I do want the employee to department collection mapping. This is the one to many. All the employees for a given departments. So for a given department, it'll retrieve a collection of employees that are assigned to that department.

Now, I don't like naming my entities plural. I see my entities as the rules for what it takes to be a member of that class or that entity. So I make them singular. Again, this is personal preference and stylistic.

We'll keep the Department ID and the Department Name. We do want the Employee Department by Department ID. We don't want Employees Managing the Department. And we don't want Job History or Locations. You can add all that later if you want. But for now, to get started, that's fine.

Next, we'll go to Employees. Click on Employees. Expand that. And now, we do want to name the employee singular. So I'll change that since I like to do that. And here's my Departments Employees by Department ID. So for a given employee, it'll retrieve the department for that employee. Remember, this is a many to one relationship. And that's what we want. It also, however, selected for us the Employees by Manager ID, the many to one to a manager. We're not working with that here. So I'm going to unselect that.

A couple of other things I would do here. First of all, Salary, in this case, is a long. Actually, that's fine. And then the other one is the Commission Percent, which is not a long. It's actually a double. So I'm going to change that here. Notice you can actually change some of these here.

And I'm even going to change the Hire Date to be a date, because you're not going to use time. That's what it defaults to. But we're going to use date. All right, and you can also change this later on if you want. Now, there's other tables and columns and stuff like that.

OK, so that's good enough for now. Notice, by the way, that we're not bringing over department ID. You might wonder, well, what happened with the foreign key? That's going to be seen as the Department Entity.

All right, we want the JPA annotations. We will go ahead, all the rest looks good. And click OK. And it will go ahead pop up a window saying, OK, do you want me to go ahead and do this? Where do you want it stored? It's about to generate the or mapping. Yes. Go ahead and click Yes.

Now, where do you want to store the actual files? You want to put it in Source Main, not Test. Source Main is where you want these files to go. That will be up here. Otherwise, it's going to be in your Test folder, and that's not going to work for you. Click OK. And give it a moment. And let it finish. Notice that it adds the two Department Employee right there.

And it puts in the URL. And puts in the driver. Takes care of all that for you. At runtime to make this run and compile, you'd need to update the POM. We have that in the activity guide of how to do it.

Now, if we come over here, sure enough, there's now a folder called Persistence that's been created. And we see that we have a department and an employee. If we look at the department, it comes in with an at entity annotation, indicating it's a JPA entity. It has a table name mapping to the table name on the schema. Catalog, in this case, is not using the Oracle database. So you can choose Remove that if you want.

All the rest of the mappings are there. There's the primary key. There's the column name. This is a basic column. This is our get employees by department. This is the one to many. It returns a collection of employee objects. And that would be our collection of employees coming back for this department.

When we look at the employee class, same thing. There's our entity annotation. There's our table name. We don't need the catalog. We'll just clean that up. Doesn't hurt to leave it on. It won't hurt anything.

But there's our ID, primary key. There's the different column names. Let's see, the hire date is a date. That's great. And salary, commission percent came in as a double. That's great. Because it's is point something something.

We also come down here, and we see that there's a many to one and a join column. Now, this is joining the employee table with the department table. And this what returns a single department for a given employee.

So now, at this point, I have my classes mapped and the mapping done. The next thing I would do is I would create a main class, or maybe even use this main or a different main to test that I can create an entity manager or use injection to create an entity manager. And once they have the entity manager, I can test all the different CRUD operations-- FIND, INSERT, UPDATE, DELETE. I would test all those, and then I would start working on updating my resource class.

So that I'm going to do in the solution for the actual lab exercises, which would you have access to. This was intended as an introduction to IntelliJ and how it works. And how to do the JPA mapping.

Remember, as we said, we assume you have background and understanding of JPA. You know what an entity manager is. You understand what entities are. You understand what mapping is.

If you don't, if all that JPA is new to you, then I do recommend looking at the JPA section in the Develop Java EE Applications course as a start since you need to be familiar with all that to accomplish this lab. And with that, that completes this demo. Thank you.
