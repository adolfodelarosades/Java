# 14: Deploying and Maintaining the Duke's Choice Application

1. Deploying and Maintaining the Duke's Choice Application - 32m

## 1. Deploying and Maintaining the Duke's Choice Application - 32m

OK, folks. So after we've done, of course, with the practices for Lesson 13, let's go ahead now and take a look at the last lecture, which is Lecture 14. And, of course, it covers deploying and maintaining the Duke's Choice application. In this lecture, we are going to deploy a simple application as a JAR file. JAR, by the way, stands for Java Archive File, and it's like a zip file. It zips, pretty much, the Java classes. And we're going to describe the paths of a Java application including the user interface and, of course, the back end. And we're going to describe, of course, how classes can be extended to implement new capabilities in the application.

Let's start with packages. It turned out that actually, we have this concept, or this construct, also, in Java, which is called, in this case, packages. So classes are grouped into packages to ease management of the system. Of course, there are many ways to group classes into a meaningful packages. And in general, when you have big applications, it is highly advisable to, again, in this case, divide your classes into packages. And of course, those packages need to be similar, or handing the same functionality, and all that.

It turned out that lots of times, when we've built enterprise applications, or maybe even object-oriented applications, we have tendency to follow the concept that you folks are going to see later on in the future classes, some advanced classes. It's the concept, and sometimes it's called also the architecture pattern, MVC. Anybody heard of MVC?

Model view controller where, again, in this case, we have the model representing data, and the business logic accessing data, and the view representing the interface on how, again, to view the data, and the control, which represents the business logic that manipulates data. So lots of times we have tendency to do that. So here, for example, we decided to create packages, for example, under the Duke package, which is the original package.

And by the way, in Java, packages are similar to folders. And in fact, they're nothing but folders. And then underneath, we have the item folder. And underneath we have the clothing, the shirt, the trouser class, the tent, the camp stove, and the returnable. You folks remember these, of course, from the previous lectures that we looked at. And then here, you have the purchase that has a customer order and shipping classes, and then under the utility, we have the convert size, which is a utility class, in this case.

So all these packages are contained in the top level package, called Duke, in this case. So if you want to look at them in the hierarchy, they would look like this, packages, directory structure, and so forth. It turned out, for example, that-- just to let you know that we have an example, and that would be-- and if you take a look at your, in your case, at the D drive, and then you go underneath, and then once you get into the labs, if you go to the examples, you actually see the example that we're going to talk about. That's the Duke Choice. You can actually open it and create it.

I created a package. And then of course I see it here. And you'd see under the source package, we have all these-- they look like as packages. We can actually see them even better if, now, we take a look at the File tab, under the File tab, and we click down, you'd see under the-- they look like folders here.

You see, they look like directories here, and under the Duke, you have, again, the init that contains the Duke's Test and the Duke's DB. And then under the item, you have all the items, which are the campstove, the camping, all the different examples, the returnable, the searchable, the shirt, the socks, the suit. And we'll get to see that.

And then, of course, under the purchase package, we have the customer, the order, the payment, the shipping, the shopping cart. Of course, now we creating a shopping cart, too, that we typically know how to use. And then under the utility, we have the convert size. And we have, also, the display util class. So everybody can see that.

So it's just, again, out of curiosity to pretty much show you how we can create so many packages, and of course to maintain our application, and of course put all the different classes that are alike, or the same family, and so forth. Everybody's following? All right.

So again you see them. So I just showed you how, actually, they would look, in this case, in terms of the directory structure. Now looking at, again, packages in NetBeans, I just showed you, again, how you click on the File tab. And that's how, again, in this case, you will see, under the File tab, you see all the different-- and when I showed you this earlier, you will see all the different folders that represent, of course, the packages. And I showed you that directly on NetBeans through the File tab, and that's how you see all of them, again, here.

So again, continuing with that, and now looking at the packages in the source code-- in the source code, by the way, we always write the package right at the beginning of the class all the time. If you decide a class-- and by the way, we always advise you-- if you remember, when you create a class, and we always give you a warning in the wizard that says, please don't use the default package, use a specific package. They're advising you, in this case through NetBeans, that it's good idea to use a specific package with a name. In this case, the package is duke.item, which is the package's item under the package, in this case, duke.

So again, the hierarchy here, how you present these with a doc notation, similar to, again, like in Unix you have the directory, for example root, forward slash, OTP, forward slash temp forward slash and so forth. So that's pretty much how [UNINTELLIGIBLE]. So the package that a class belongs to is defined in the source file in this [UNINTELLIGIBLE] code and it's typically always at the beginning of the class all the time here. At the beginning before the imports and before the code itself.

Now, of course, most probably some of you have heard of JAR files. JAR files and the deployment are also important. And by the way, all the classes now can be actually jarred into a JAR file. And that JAR file contains all the classes or the class directory structure, plus the manifest file. The manifest file is typically the, again in this case, contains the metadata of how actually all those files are jarred.

So you can create a JAR file by using the command line tool using the JAR command. But also you can use IDEs. And the IDEs actually, by the way, create your jar files on the fly. If you, for example, right click and Build and Clean and Build or Build, then of course in that time, it will go ahead and create the jar file for you.

And continuing with that again, and you folks also remember how we went through and you did a lot of labs about that. If you want to specify the main class, again, you right click on the project properties. And then you click on the run category, and then you select here under the main class which main class you are going to run. And then after that, you click on "OK."

You folks did that in the practice that actually was about what? Anybody remembers which practice actually we had to do this? For which practice? That exercise was the name of that class. It's the guessing game, remember that? OK, good.

And again, in this case to create a JAR file, like I told you folks, all what you do is on the project, right click the project and Clean and Build, and it's going to build it. That's pretty much what it is. And then, of course, after that you will go ahead and create the JAR file for you. For example, we can see that.

And again, on this project, I can open one of the previous projects that we already worked with, like for example Project 12. And then if I right click now and say "clean and build," you will see that of course it's going to go ahead and create the Jar file. So, of course, later on if you want to take a look at that JAR file, you just go ahead and get in here and then of course you will find the JAR file already created by NetBeans in this case. All right. Under the Build, you will find all four of the classes and, of course, the JAR file that you already created.

All right. Continuing again with this lesson. So again, clean removes any previous builds. And builds creates a new JAR file. Creating a JAR file again with the NetBeans. So of course, here we just tell you where you're going to find it. So again, in this case let's go ahead and [UNINTELLIGIBLE] under the file system. And under the distribution, you can actually find in this case your JAR file.

So we can go ahead and try it in NetBeans. If I now do it in business is going to go ahead and pretty Clean and Build. And then if I go under the [UNINTELLIGIBLE], or rather the file, and then of course I'll click under the Build. And that's what I see again the JAR file. Or rather, under the distribution. I'll go ahead and see the JAR file. And if you take a look here, here's my practice work JAR file.

And it can also create, in this case, when I open the Duke's application, I can do it the Duke's Choice. I can go ahead and click under the distribution and then I see it here, which is the Duke's JAR file. Of course, I can go ahead and take a look at that. And you see that it has all the JAR files inside. It bundles all of that. It jars them. It kind of zips them. Everybody's following? All right.

What is manifest file?

Well, manifest typically it is when you have an enterprise application and you want to JAR an enterprise application. Again, we're discussing the manifest. And that pretty much, a metadata that tells you how the JAR files are jarred. That's pretty much what it is.

And in an enterprise application, you have typically the WAR file, the web archive, and you have the [UNINTELLIGIBLE] JAR file and you have resource archive file. And they're all bundled where? Into an EAR file, an enterprise archive file. You will get to see this in the Java EE courses.

Continuing again with the concept of deployment and applications and so forth. Let's go in and look at the concepts of two-tier and three-tier architecture. So looking at the client/server two-tier. So in general, client/server computing involves two or more computer sharing tasks.

Of course, every computer performs logic appropriate to its design and stated function. And the front-end client communicates with the back-end database. Client requests data from the back-end and the server returns the appropriate results. And of course, the client in this case handles and displays data.

So again, the client/server concept will be like this, where you have a presentation, and that's through the interface. And then presentation will be the graphical user interface. That could be a web or could be any user interface. The business logic would be, again, defines the business rules. And of course, the data tier would be again this, where they have the data source where all the data is hidden or saved or persisted.

Now looking at Duke's Choice application. Well, if you take a look at Duke's Choice application, we are going to, again we have abstract classes. If you remember, we have the clothing and the camping. So the clothing extended by shirt and other clothing classes. And then the camping extended by tent and other camping classes.

Also, if you remember, in the Duke's Choice example, we also can have an interface like Searchable. All purchasable items implement Searchable that he can search, for example for an item, or Returnable. We saw the Returnable if you'll remember. Items that can be returned implement Returnable. And then Shippable. Items that can be shipped implement Shippable interface.

These, if you want, they are candidates of interfaces in the Duke's application. And if you take a look, of course, here if you go back to the project and you look at these, you can actually see these under the Duke. And then you see here, for example let's just out of curiosity go ahead and look a-- let me just close this guy, this guy, close this one here, close this one here, and close this one here.

And then, of course, let me go ahead and look at Returnable. Returnable is an interface. I can also look at Searchable, and that's an interface that has display, get price, get description, get ID, and so forth. You can search-- again, it's called Searchable interface.

Continuing with that, now let's go ahead and look at the clothing class. We've already seen the clothing class before. And we also see now that in terms of the clothing class in this case, we see that it is an abstract class that implements Searchable and Shippable. We can do that. So of course, it has a bunch of what? Fields. Again, in this case.

And of course it has a constructor. This is a constructor. And of course that initializes all the different instance variables off the clothing class. Continuing with the clothing class, we can also have a getDisplay that takes a string separator. And then in this case, it will go ahead and pretty much declare a string called "display string" that you pass with the SKU. And then the getSKU and the separator and then the item, then the description, then a separator, and so forth.

So you can actually go ahead and build this getDisplay method that has again been added to return, in this case, a string. Again, this allows the method to be called by different clients. And of course, it takes one argument in this case. And of course which is a string that determines how the individual attributes of the item are separated. For example, they could be separated with a new line in the console version of the application. Or, again with an HTML element for the web application.

Now, looking at the tiers of the Duke, we can have the presentation and that would be whatever JAR file is [UNINTELLIGIBLE] in the presentation. And then you have the business logic. And of course, in this case you have the data. So in the interface, you could be, for example, a graphical user interface in this case, where now we can have a drop down and choose which item we want to buy. And that would be here. Let me just grow this a little bit so that you guys can see that.

And there are two possibles. So you could be just through a text or a simple application, or it could be through a graphical user interface. You will see this later on, by the way, when you get into the Java EE courses. And, of course, the business logic and then data.

Again, in this case there will be a Duke's db, database. And then you can add an item, find an item, remove an item, and so forth. That's the idea behind specifying the user interface and the back-end. So here we can look at this as the view, and we could look at this as the controller, and we could look at this as the model.

Running a JAR file. By the way, we can run a JAR file. And to run a JAR file, with the way we do it in this case is we use the Java command and dash JAR for the option. And then we can go ahead and run the JAR file. You can, by the way, run the JAR, the whole classes together, and you can run the JAR file this way. And the output again in this case, whatever the output is going to give you in this case-- find the item or remove the item or whatever.

Listing items from the command line. You can do that too, again by just using the Java command minus the JAR option and then the path to your JAR file. And then use the Find. And then here, if I want to find, for example, all the items that have ID what? 111. So it could be 111R or 111B, R for maybe red and B for maybe blue and so forth. Everybody sees that?

Again, listing items in the Duke's Choice web application. You can go ahead and do that, by the way, using-- if you have a web application, then you will look like this, where the search space has a drop down. [UNINTELLIGIBLE] to search it. So again you see here, the current items in stock are shown here, which is trousers, shirts, socks and so forth.

And then here, for example, let's assume I select casual shirt. Then in this case I see what? I see the list of the casual shirts, which they have a price and how many are available. In this case, the 111R is 63 and for 111B 20. Everybody see that?

Again, listing items in the Duke's Choice web application. By the way, now we've seen it as a list in terms of just script, just a text. But we can also look at it using also the picture. So in this case, for example, we could look at it where again you have casual shirt. And then we have the details of the shirt including how many are available.

But in addition, also, they show us what? They also show us a picture of the shirts that we have. So in general, we see that nowadays for those who actually buy items on the web. And we have tendency now to do this a lot because it's a lot practical and so forth. Especially for those of us who are busy, it becomes handy to actually do that.

And now of course, looking at application modification and enhancements. We can always enhance an application. So we say that well-designed Java software minimizes the item required for maintenance, enhancements, and upgrades. Again, the Duke's Choice here, if we take a look at it as an example, it would be easy to add a new item to sell. So we just add some business logic.

And you will develop new clients, so we can always create a new type of presentation. For example, we can have a Swing type of-- Swing is, by the way, a Java API that creates the interface to a user interface or are a graphical user interface. But we can always add, for example, browser-based clients or any other type of clients.

So again, we take the application. We can also add smartphone type of application. In fact, if you want to use smartphones, something like the one that I have here, then in that case, a very good technology that allows you to add or render to all kinds of clients is the JSF technology. By the way, we have a course on the Java Server Faces technology, building web applications with Java Server Faces technology. And it's an excellent course and you can actually learn about the whole technology and how actually it helps you build web applications.

And of course, we have the servlets and JSPs course also, which is covered in five days. And you can also learn how to build web applications using servlets and JSPs. And you can find them on the Oracle University website.

And of course, we can choose the storage system. For example, let's assume we used to use Sybase and now we wanted again Oracle database because it's a better, flexible, and more robust database. In that case, we can go ahead and do that quite easily.

Adding a new item for sale. You can go ahead and do that. It is possible to add a new item for sale by extending the clothing or camping class. Remember how we made it abstract? So the fact that we made it abstract, we can always do what? Add a subclass to it. And we can extend the clothing class any way we want.

For example, let's assume now-- if you remember, throughout the different lessons that we went through, we always had classes that extend clothing like shirt, trousers, we can add hats. What else we can add? Polos and so forth. Dresses and so forth. And then the same thing in the camping. We can always add new items to sell. Again, adding a new, unique feature for the item or adding some of the new items to the data store, that's quite easy.

Adding a new item for sale. For example, let's assume now just out of curiosity I want to add a suit. I want to sell suits. So I say suit extends clothing and implements Returnable, and then I'm good to go. So in this case again, I'll go ahead and have the suit, which is off that clothing, and I have Returnable, return are permitted. And of course I have the Returnable, which is again an interface and that must be implemented.

You see how NetBeans is giving me that hint, so I can go ahead and implement the method of Returnable. Which in this case, in the suit class I need to implement the method called what? DoReturn. Remember that? Good. That's pretty much how we show you the flexibility of Java.

And here's, for example, if you want to implement Returnable, we say, OK, suit extends clothing, implements Returnable. And in this case, what we do is we implement the doReturn. Again, in this current implementation, Returnable provides a marker that the item can be returned and also returns a string with a condition for returning the item.

Again, in this case, suit returns must be within three days. Otherwise, it's not returnable. So you can have all these kind of conditions set by the stores. In this case, it's Duke's Choice.

And we also can implement the constructors. [UNINTELLIGIBLE] now that because we created a suit that extends clothing and implement returnable, so we can always implement the constructor. In this constructor, we have what? Item, description, color code, price, type, and of course, the quantity in stock.

So I can go ahead now and make use of super, which, by the way-- super does what here? Super calls the constructor off the superclass. Thank you, good job. And then after that I have a new type that I added here, and I'll go ahead and set now the type by calling the set suit type. And then, of course, in this case set the SKU and so forth. Everybody's following, folks?

And by the way, we can override the getDisplay for the suit class too. So we'll have getDisplay. That takes the separator. And then I can go ahead now and add to it what the type. The type was not there. Now it's added. And that's how in this case we are overriding the getDisplay of the suit.

And of course, so that later on when you run the class in this case, when you're on the application, Java does JAR. And then your JAR file, you will find again in this case that you have the SKU, the item, and then of course the color, the type is D, and the price. And of course the availability, how many are available.

So in addition now we have this type D or S and so forth. Everybody see that? OK, good. I don't know what D stands for a suit. Anybody knows? Or S? Maybe something, I don't know.

And we also can implement getters and setters. So a suit extend clothing, implement Returnable, so we have a getsuitType, returns the type. And then, of course, we have the setsuitType, and we can even do better here. It takes a character and then we say, if the suit type is different than D and the suit type different than b, then go ahead and create a new illegal argument exception.

We're being fancy here. Now that we learned about exceptions, we can actually create our own user-defined exceptions. And in this case, you will see that we create a new instance illegal argument exception. And then of course we paste in the message. And then now we're in good shape.

[INAUDIBLE]?

Yeah. And then we say it has to be D or it has to be in this case-- oh, I see. We understand now what D stands for. D is double-breasted and then S is single-breasted. How about that? Now we're learning something else too. So that's good. Thank you. Somaia. Found that. Thank you, Somaia.

So now again you see how we can also work with exceptions because we learned exceptions and now we know how to make use of exceptions. Updating the applications with a suit class. Now what we do is from the command line you create a new JAR file, optional copy to a new location on the file system or another machine.

And then of course for web application, create a new JAR file. And then copy it to the directory that is used by the application server for library files. Again, just to add what we added. So in this case, just go ahead and add and create a new JAR file.

Again, testing the suit class from a command line, you can just do it from here. Java dash minus JAR, And then of course the JAR file. And then find, for example, in this case the item that has the SKU that is 400. And we see that whole list here. Everybody's following, folks? Good.

Now, testing the suit class. Again, you can go ahead and do it from a command line. And this is typically what we did in this course. But remember, folks, that you are going to take the advanced SE 7 course, which is the Java SE 7 programming. And then after that, when you get into the Java EE technology, you are going to learn also how to use an interface as a graphical user interface, using typically browsers.

In this case, using the browser. And you see that, for example, in this case the user interface is a web application, where now of course you see that in this case it's on the browser and you have a drop down. And you can choose, for example, in this case, hey, give me the dress suits, and what do you have? So we have all of this here. And we show you the price of every one of them.

So you see that this is more of a user-friendly type of interface. And that's why, when we get into the enterprise applications, you will see that the interface is always a graphical user interface, using the browser. The thin client.

And of course, adding a suit class to the web application, we can even do better. Now, as you see, it's even better. Now we can go ahead and you see how to return to the main page. And now we have a dress suit. And then in addition to the details that we give here because we did the override getDisplay method to ensure that the suit type is displayed. And then you see now we even have what? Pictures of the suits. And that, of course, is a lot user-friendly because now we know exactly what we are buying. We have a very good idea about that.

So again, in summary, we looked at deploying simple applications of JAR files. We described the part of the Java application including the user interface JAR file interface and the back end. We described how classes can be extended to implement new capabilities in the application. Of course, don't forget folks that in this case you can actually open it and create a new project and then in this case do the Java project exist. And then click Next and then name it in this case, for example, Duke's Choice. And then after that, click Next and then Import.

When you import it, you go typically to the D drive. And then you go to the labs. And under the labs, you go to examples and then select 14 and click Open. And that will go ahead in this case. It's already existing, so I already have it. And then you click Finish and that's how I actually created the Duke's Choice. And then you can see all the code over there. Right? Everybody's following?

And in this particular lesson we have no practices, so the purpose is right now, once we've done with lecturing all the lessons, please go ahead and get into review more your practices for all the different lessons. Try them again or finish whatever needs to be finished. And that pretty much ends the course.

So hope you enjoyed the course, and I will look forward to again seeing you in the next course, which is the Java SE programming, or maybe other courses like Java EE courses or web services courses. We have a whole set of curriculum. Please take a look at the Oracle University page and select the course. We have lots and lots of very interesting and excellent courses that help you get trained and be ready for your work. Thank you.
