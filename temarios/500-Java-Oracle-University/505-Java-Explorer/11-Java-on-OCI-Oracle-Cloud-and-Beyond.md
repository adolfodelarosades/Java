# 11. Java on OCI	- Oracle Cloud and Beyond

Convert a Java SE application to respond to a web request instead of the command line.

## 01. Title and Objectives 1m

Java Basics, The Oracle Cloud and Beyond. In this module, we'll take a look at how we can deploy Java SE Applications to the Oracle Cloud, and how to create a Basic REST Service using Helidon.

## 02. Prepare for Cloud Deployment 7m

Prepare for Cloud Deployment. In this module, we'll take a look at how to package and deploy an SE's Standard Edition application to handle web requests. Technically speaking, Java SE applications are not generally deployed to the Cloud because they don't normally handle web requests. For that, we use Java EE, Java Enterprise Edition applications. Those are normally deployed to some type of server like WebLogic or Helidon. And then they can handle web requests.

But to give you a feel of what your SE application can do if it had the ability to handle web requests we're going to use the Helidon SE portion, which will embed a server into your Java SE application. It'll run in its own Java virtual machine, and it'll handle web requests.

Now a Java EE server, like for example, WebLogic or Helidon, provides more sophisticated application management and multiple different frameworks for application development. However, we thought this would be a great opportunity to give you a feel for what it's like to write an application that can handle web requests. And it's a good stepping stone to creating your first web service, like a REST web service.

To prepare for this exercise, you must download a zip file, unzip it, and create a library of NetBeans. Then you can add the code as shown in the next module. What you're going to do is download the helidon.zip file that we've created for you that contains all the Helidon libraries required to make this work in your application. That helidon file is located at the URL you see on the screen, https://github.com/oustudent/helidon_support.

When you go to that you URL, you'll be able to download the libraries as a single zip file. You will then go into NetBeans, and you'll create the library. And we'll cover how to do that next.

After the library is created and you added it to your project, then you can add the code that's shown in the next module, which will use the Helidon library in order to run a little Helidon server. And rather than operating at the command line, you'll be able to bring up a browser and talk to your SE application and have it handle requests.

So now, when you test your application, you're running a Java SE web server inside of your main code. It listens for requests from the browser and then will respond with the output of the program displayed on a web page rather than at the command line. This is a very basic type of example, but it does show you the basics of what's going to happen when you go into more sophisticated type of web applications and enterprise applications.

So the steps to add a library NetBeans, well, first of all, we've got to get the JAR files necessary for the library. So you will open a browser in your lab environment. You can open Firefox. And then access the site, https://github.com/oustudent/helidon_support. You will download the helidon.zip file from GitHub and unzip it into the /home/opc directory.

Now technically, when you look at this in the File Explorer, it would just show you /home, but it is /home/opc. We'll see that in a moment. Once you've downloaded the helidon.zip file and unzipped it into the /home/opc directory, then you're going to go into NetBeans and create a new class library named Helidon.

You'll add the JAR files that you've downloaded and unzipped. And then in your ShopApp, you'll add the helidon library to the project. And we'll go through and show you how to do that. Once you've done that, you're ready to proceed with the coding that's shown in the next slides and the next module.

OK, so to get started, what it's going to look like-- go into your lab environment, open up Firefox, which is an icon on the desktop, or you can go to Applications, Favorites, Firefox, and then you're going to want to download the helidon.zip file from the URL that you see here. I'm not going to read it again.

Now you can see here the first-- what you see here when you go to GitHub is you'll have a little green box with a little down arrow that says Code. Click on the green box, and down at the bottom it'll say, Download the zip file.

So just select Download zip, and that will download the zip file. It's fairly small, so it'll happen quickly. And then inside of your environment, it'll pop up and say, what do you want to do with this? You want to open that with the Archive Manager, which will automatically unzip the file for you.

When you select that and click OK, it'll take you to a window that shows you /home, and you should see Desktop, Documents, Downloads, Labs, et cetera. There's your NetBeans installation, for example, a NetBeans projects. Go ahead and click the Extract button, and it will extract the Helidon folder into this directory.

Now technically, we did say it's being downloaded into /home/opc, and that is correct. However, they're not showing you the opc part here. /Home, in this case, is really /home/opc.

Once you've downloaded and unzipped the heldon.zip file, you're ready to create the library in NetBeans. Return to NetBeans, and then select Tools from the menu, and then Libraries as an option. Then you'll click the New Library button at the bottom left of the window, name the library Helidon. Make sure Library Type is Class Libraries. Then you're going to add all the JARs from the Helidon folder. And we'll show you this in a demo coming up in a moment.

What you'll do is you'll select the first file. You'll navigate to Helidon here, which is where you unzip the Helidon files to. You'll select the first JAR file, and then scroll over and select the last using a Shift-Click to select all the files.

Then you'll select Add JARs/folder, and that will add all those JAR files to the Helidon library. You should see something like what you see here on the right. You'll have a library called Helidon. You'll see all the files highlighted. And now the library has been created once you click OK.

Once you've created the Helidon library, you're ready to add it to your project. Right-click your project. The name is here, ShopApp. Right-click ShopApp. And in the pop-up menu, select Properties.

Then in the window that appears, select Libraries. Then click the Classpath ellipse button. That's the small button to the right of the word "Classpath" with the three dots on it. When you do that, you'll see an option to Add Library.

Select Add Library, and the window of libraries will appear. Select the Helidon library that you previously created. Now click OK, and then in your ShopApp class, you'll add the line to import the io.helidon.webserver.Routing class. And you'll see that here.

Once you've added it, you should see that it compiles, and your library is now added. We'll take a look at a demo of doing this. And then we'll go forward to see how to modify the code and be able to make it run and handle web requests.

## 03. Create REST service 4m

 
Creating a REST service. You're going to create a new class and add it to your shop app project named ItemList to handle the new web request. Here we go-- public class ItemList implements Handler. That's an interface that you have to implement. That's the interface here.

And this is part of the code that you downloaded. Now we're not going to go into how the code works or any of that. That's all covered in various courses, like web service courses, where we teach this in more detail, in the Java learning subscription. Our goal here is just to give you a taste of what this looks like.

So public class ItemList implements Handler. We talked about interfaces before. And therefore, it must have a method called accept. The Handler interface has a method called accept.

At implementing the Accept method, it will accept a request, and it will generate a response. These are two different types of objects-- server request object, server response object.

A response dot status will set the status code for the http response. Response dot headers will set the header for us, and then we'll simply say items dot toString. And we'll do send, and that'll convert it to text and send it back to the web page. And it'll go back to the browser. You're going to add a single method accept, which will implement the interface.

So to do this, you're going to modify your ShopApp to include a web server. You need to go into your ShopApp and add this code that you see here. Enter the code into your ShopApp and run it.

You'll see the output appear in the output window as usual. But it will also run the web server, and it'll listen for your request coming in from the browser. So you need to add the code that you see here in red-- the imports-- and the code that you see down here.

In addition to printing out to the console, we're also going to create a list of items, set up a routing, set up the server configuration, bind to a port 8888 on the local host. And this actually starts the web server. So web server ws.create creates the web server, ws.start starts the server.

The web server is now running and listening for requests. You'll start a browser, make a request to port 8888. And you will see the response of the items coming back.

So what does this look like at runtime? Well, when you run the app, you're going to notice in the output an IP address. Now your will be different. This should be the IP address of your virtual machine. It might be 10.0.0.9 or whatever.

Take that IP address and the port and put that into a browser. Open your browser, enter the URL-- 10. whatever it might be. Again, this is an example. Don't expect it to work for you. You need to look at your own IP address in your output window.

So you'll take the IP address. You can actually just copy it an paste. You can just copy that and paste it into the browser, and then put on forward slash items, which will retrieve the list of items. And you'll see the list of items appearing in a web page formatted for you, where you actually didn't really have to do anything other than get the web server going.

So that's a very simple, very high level example of how to create a working web service. Come back for the Java learning subscription. And we'll talk more about SOAP, and RESTful web services, and how to implement them.

## 04. Cloud Deployment Demo 21m

Prepare for cloud deployment. In this module, we'll take a look at how to pack and deploy an SE, Standard Edition, application to handle web requests. Technically speaking, Java SE applications are not generally deployed to the cloud because they don't normally handle web requests. For that, we use Java EE, Java Enterprise Edition, applications. Those are normally deployed to some type of server like WebLogic or Helidon. And then they can handle web requests.

But to give you a feel of what your SE application can do if it had the ability to handle web requests, we're going to use the Helidon SE portion, which will embed a server into your Java SE application. It'll run in its own Java virtual machine. And it'll handle web requests.

Now, a Java EE server, like for example WebLogic or Helidon, provides more sophisticated application management and multiple different frameworks for application development. However, we thought this would be a great opportunity to give you a feel for what it's like to write an application that can handle web requests. And it's a good stepping stone to creating your first web service like a REST web service.

To prepare for this exercise, you must download a zip file, unzip it, and create a library in NetBeans. Then you can add the code as shown in the next module. What you're going to do is download the helidon.zip file that we've created for you that contains all the Helidon libraries required to make this work in your application.

That Helidon file is located at the URL you see on the screen, https://github.com/oustudent1/helidon_support. When you go to that you URL, you'll be able to download the libraries as a single zip file. You will then go into NetBeans. And you'll create the library, and we'll cover how to do that next.

After the library is created and you added it to your project, then you can add the code that's shown in the next module, which will use the Helidon library in order to run a little Helidon server. And rather than operating at the command line, you'll be able to bring up a browser and talk to your SE application and have it handle requests. So now when you test your application, you're running a Java SE web server inside of your main code. It listens for requests from the browser and then will respond with the output of the program displayed on a web page rather than at the command line. This is a very basic type of example. But it does show you the basics of what's going to happen when you go into more sophisticated type of web applications and enterprise applications.

OK, so the steps to add a library in NetBeans, well, first of all, we've got to get the JAR files necessary for the library. So you will open a browser in your lab environment. You can open Firefox and then access the site https://github.com/oustudent1/helidon_support. You will download the Helidon zip file from GitHub and unzip it into the home/opc directory. Now, technically, when you look at this in the File Explorer, it was just show you Home. But it is Home POC. We'll see that in a moment.

Once you've downloaded the Helidon zip file and unzipped it into the Home OPC directory, then you're going to go into NetBeans and create a new class library named Helidon. You'll add the JAR files that you've downloaded and unzipped. And then in your ShopApp, you'll add the Helidon library to the project. And we'll go through showing you how to do that. Once you've done that, you're ready to proceed with the coding that's shown in the next slides and the next module.

OK, so to get started, what it's going to look like, go into your lab environment, open up Firefox, which is an icon on the desktop, or you can go to Applications, Favorites, Firefox. And then you're going to want to download the helidon. Zip file from the URL that you see here. I'm not going to read it again.

Now you can see here the first what you see here when you go to GitHub is you'll have a little green box here with a little down arrow that says Code. Click on the green box. And down at the bottom, it'll say Download the Zip File. So just select Download Zip, and that will download the zip file. It's fairly small, so it'll happen quickly.

And then inside of your environment, it'll pop up and say, what do you want to do with this? You want to open that with the archive manager, which will automatically unzip the file for you. When you select that and click OK, it'll take you to a window that shows you Home. And you should see Desktop, Documents, Downloads, Labs, et cetera. There's your NetBeans installation, for example, and NetBeans projects.

Go ahead and click the Extract button. And it will extract the Helidon folder into this directory. Now, technically, we did say is being downloaded into home/opc. And that is correct. However, they're not showing you the OPC part here. Home, in this case, is really Home OPC.

Once you've downloaded and unzipped the helidon.zip file, you're ready to create the library in NetBeans. Return to NetBeans and then select Tools from the menu and then Libraries as an option. Then you'll click the New Library button at the bottom left of the window. Name the library Helidon. Make sure library type is Class Libraries. Then you're going to add all the JARs from the Helidon folder. And we will show you this in a demo coming up in a moment.

What you'll do is you'll select the first file. You'll navigate to Helidon here, which is where you unzip the Helidon files to. You'll select the first JAR file and then scroll over and select the last using a Shift Click to select all the files. Then you'll select Add JAR/Folder. And that will add all those JAR files to the Helidon library.

You should see something like what you see here on the right. You'll have a library called Helidon. You'll see all the files highlighted. And now the library has been created once you click OK.

Once you've created the Helidon library, you're ready to add it to your project. Right click your project. The name is here, ShopApp. Right click ShopApp. And in the pop up menu, select Properties.

Then in the window that appears, select Libraries. Then click the Classpath ellipse button. That's the small button to the right of the word Classpath with the three dots on it. When you do that, you'll see an option to Add Library. Select Add Library, and the window of libraries will appear. Select the Helidon library that you previously created.

Now click OK. And then in your ShopApp class, you'll add the line to import the io.helidon.webserver.Routing class. And you'll see that here. Once you've added it, you should see that it compiles. And your library is now added.

We'll take a look at a demo of doing this. And then we'll go forward to see how to modify the code and be able to make it run and handle web requests. OK, so let's take a look at that.

All right, so from here, I don't need this anymore. I'm going to go over to NetBeans. I'll leave the browser up because we're going to need it in a bit. I'll go over to NetBeans. And from here, we're going to go to Tools and Libraries.

Now I've already created this. So I'm going to remove the Helidon library. You don't need to do that. I'm going to do it to show you how it goes. So New Library. And I'm going to call this Helidon. So the only difference was mine already existed because I tested the demo first. Click OK.

And now we need to add a JAR and folder. So you click the Add JAR/Folder button and go out and find a folder called Helidon. Now, you're going to have to look in OPC because that's actually what's underneath Home. It's Home then the name of the account, which is OPC.

Just scroll over. And sure enough, there's a Helidon folder. Double click it. It should take you in. And then just select the first one and scroll all the way to the end and then hold the Shift key down and select the last one. And everything should be selected.

OK, may take a couple of tried. But you want to do Add JAR/Folder. And you should have all those JARs and folders. At that point, click OK. And we've added the library.

OK, so all the JARs from the Helidon folder have been added. And we're complete. We've added the library in NetBeans. Now we need to add the Helidon library to our project.

So we're going to right click the project. So Project ShopApp, we're going to right click. And then from the pop up menu, select Properties. And then we're going to select Libraries. And once you select Libraries, it will take you to a screen that looks like this.

You're going to click the Classpath button, which is this little button with the three dots, the ellipsis on it. That will drop down and ask you to choose Project, Library, or JAR. You want Add library. Select Add Library. That'll bring up this window. Add Library. Select the Helidon library you just created. And that'll add it to the project.

Then I have a test in here to make sure you can see the library correctly by doing an import. We'll get back to that in a moment. OK, so let's go take a look.

So now if I come over to my application. Here it is. Right click and select Properties. Very easy. Then over here, we select libraries. And of course, Helidon is already there.

So what I'm going to do is show you what it will look like when it comes in. When you first come in, it's going to look like this. It'll look blank like this. Then click the little button Choose Add Library and simply select Helidon. Click Add Library. And you're done. You're good. That's all that has to be done.

OK, we're going to click OK. And that adds a library to the project. And now we're going to add a line of code to test to make sure that the library works correctly. So I'm going to add a new import. I'm going to add an import, spelled correctly, from io.helidon.

Now, notice when I do it in introspect to that and you get a little guy right here that says Remove Unused. So that's good. I'm going to keep going then dot. And you should see a little pull down. There's a number of sublibraries underneath Helidon library.

We want, in this case, let's say, Web Server. And then under web server, we want Routing. And you can also just type the whole thing in if you want. Semicolon at the end. And if it worked correctly, you should see that it compiles.

Don't worry about the message that says it's an unused import. It'll get used later on. So success. We now have a successful addition of a library. The library has been added to the project. We can import from the library. That's all we need to do at this point.

OK, so in the Shop class, we added the import io.helidon.webserver.Routing. We should see it compiles. And it does. The library is added. OK, now we're ready to add code. And the code we're going to add, we're going to add one new class and some code.

This new class is an item list class. And what this is going to do is implement the handler interface. We talked about interfaces a bit. And the handler interface has a single method called Accept that takes a server request object representing the request and a server response object representing the response.

Then we go to the response. And we send it a status of 200. So when we accept the request, we'll send back OK. Then we'll add a header indicating that the content type is text. And then we're going to just call our items. And we're going to call to string and convert all the items into a to string. And then we're going to send that back as a response.

OK, let's go in and add this code OK, so here is the code. And as you can see, I've added a new class called item list. I've added some imports. Although, NetBeans will do that for you. There is fixed imports you can use. And if you're missing imports, they'll try to figure it out for you. Or you can just put them in yourself.

Here's our class item list. It implements handler. Handler comes from Helidon. That's the handler interface. We create a clothing array called items. We call, in this case, we have an item list and that's the constructor which will take in a list of items. So we'll pass in a list or an array of clothing items, and then we'll store that into our local items.

And now we have our accept method. Here's the request. Here's the response. There's the status there's the header. We're using a StringBuilder to build up the result. But it's not required. You could use just plain string.

So now we have the result. And what we're going to do is append the items into the StringBuilder. And so it appends the items in a loop. And when you're done we've appended all the items that were in the item array. And then we send back the result as a response. And then that response will be rendered by the web page.

OK, so I'm going to stop here and give you time to catch up and put in the code. And it should compile and should work OK. And so you should be able to get a clean build and compile and should have a clean compile. Yep, there we go. Clean compile. OK, and then we'll pick up with the next slide.

OK, now that we've added the item list class that will actually produce the output, we need to add the code that will actually include a web server and actually get a web server running. So here, I took a screenshot of the ShopApp.Java class. And you'll notice at the top, there's a bunch of imports. And you're going to enter those yourself or you'll be prompted for those.

And at the bottom, we have some new code that we're adding. Now, in my example, you can go ahead and comment out the other printing methods. It doesn't matter. They're always going to write to the console. It won't interfere with what the web server is doing. It really doesn't matter.

But you want to add this code. And let's walk through it and see what it does. We have a try catch block because there's a possibility that you can get an unknown host exception when you try to access a host. If that host is not available, it'll throw an exception. It's going to be a local host. And it will be available. So that won't happen.

So we'll start off with a new item list called list, which is a new item list. And then we have initialization for it. And you can see here's the item list. And we're passing in items. So we're just going to initialize with items.

Then we're going to do the routing. We need a routing to handle the routing of the request. We have a routing object. It's going to call the builder method to create its own object. It's going to build that with the get method that looks for slash items in the URL. So when we submit a URL and we have slash items in the URL, this routing class will receive that request and then will go ahead and handle the request by passing back the list. And you see the list right there.

Next up, we need to configure the server. We create a server configuration object reference of type server configuration. We call ServerConfiguration.builder to build the actual server.

The bind address is the local host address. Though, of course, you could choose different addresses if you want. We're defaulting to port 8888. And then we're causing it to build. That builds the server configuration object. Builder is a special pattern for creating objects similar to but more robust than a constructor.

WebServer ws, we need a new WebServer.create. We create a new web server instance with the config that we created here. That's the server configuration and the routing object that we created here, passed both of those in the create method.

WebServer, of course, is a capital W, capital S. So that's a class name. And we know the classname.method is a static method. We're not creating an instance of the web server. We're asking the web server to create an instance for us. And it does. It passes as back an instance of the web server ws. And then we simply call ws.start. And that starts the server.

Now, if you're running this, you won't see any output. There's no output at this point until you test it with the browser. And when we test it with the browser, it'll look like this. We'll come back to this in a bit.

OK, let's go ahead and add the code and see what it looks like. OK, so here's our ShopApp class. Here are the imports that we need. Here's our main method. Here's where we're printing out Welcome to Duke Choice Shop.

Here's our clothing, creating four clothing items. We're creating an array of items and putting each item into that. And then this is a code that we're adding. So we're adding this code here.

Now, you may wish to pause this video and try typing this in yourself. Make sure you get it correct. Look very carefully. Syntax is critical here. So once you type all this code in, we have our item list.

We're simply going to pass in items in this case. And of course, remembering that, in this case, items is the local array that we have. There's our routing object being created. There's our config being created. And you can even put blank lines between this if you want to make this more readable. That's perfectly fine. There we go. Those are the logical lines of code that we need.

OK, so there's the routing object. And then there's our get for items, for the items resource. Then our server configuration, 8888. There's our web server create ws start. And we have our stack trace if we got an unknown host exception.

So at this point, we've added the code. And now we're ready to test. So we're going to run the app. And what you'll see is an IP address appear. That is the local host machine IP address. Of course, it will be different on your machine. And the port that you selected.

Then we're going to open a browser and just put in that IP address. It's :8888/items. Remember this is looking for a resource that has forward slash items on it. If you don't put on forward slash items, you won't see anything. Once you put on forward slash items, then it'll go ahead and submit the request of the class or retrieve the items and display them for you. Let's take a look.

All right, so here, I'm going to come down and just right click and select Run. And as I said, I actually commented out all the other print statements that were down here in the code. So there's no output. But there is a Welcome to Duke Choice Shop. And then here's our channel information. And there's the IP address.

And actually, all I have to do is just select that and then right click and copy. Copy. And go back to my browser and paste that URL in. Too many different operating systems. All right, so that didn't work. Let met try it again. Let's see here.

No. I'm missing something. OK. Let me try that again. Copy. Of course, I can just type it in. But of course, now I just want to see. So let's see. There we go. OK.

Now, as I said, if you just press Return, you're not going to see anything. It'll say no handler found for path forward slash. Remember the code is actually listening for slash items. So now we've got to make sure to put slash items on it. And there you go. There is the output.

So what it's actually doing, it's sending a request to that URL, to that IP address and that port. And that's being received by the routing object. And it's checking to see if forward slash items is on it. If it is, then it returns the list.

Now, notice this is the beginnings of what we call a RESTful web service. We're using the web to make requests to handle logic and sending responses back to us. In this case, we're getting back a list of all the items. But it would be very easy to modify this and say, for example, just give me the ID of the item. And I'll just pass you back that one item, for example, or the name of the item or something like that.

Now, creating web services and doing things like that come in the later classes as part of Java EE and as part of web services. But this gets you started and gives you a sense of what you can do. So at this point, we've run the app. We noted the IP address. We put the IP address in. We did forward slash items. And we see the output coming back.

So with that, that completes our Java Basics course. Hopefully you got a nice chance to dip your beak into the wide amount of knowledge and technology that's available through Java. We have a number of certifications. We have a Java SE certification. That allows you to get certified in Java Standard Edition. The basis for that is the Java programming complete course, which is the next natural follow on course from this course in the Java learning subscription. There's also a Java EE, Enterprise Edition, certification. And we have a Java EE course for that as well.

Now, please bear in mind, simply taking these courses may not be sufficient to pass the certification exam. The intent is that you would take these courses, study, read, practice with some code before you take the exam. Now, for the cloud side of things, we have a web service-- sorry. I should mention we also have a web services developer course. There's no certification associated with that, but it teaches the basics of SOAP and RESTful web services and microservices as well using the Helidon server we just saw.

We also have certifications and development tracks for cloud application developers. So on the Oracle Cloud infrastructure, the cloud application developer looks at things like the cloud-native services, streams, events. And so there's a certification for that as well.

There's a cloud DevOps developer doing things like continuous integration, continuous deployment, working with products like Jenkins and Maven. And there's a certification for that. And then there's the cloud integration developer working with the Oracle Integration Cloud to integrate applications as well as process automation. And again, there's a certification for that.

So with that, we hope you enjoyed the course and this chance to get introduced to Java and Oracle corporation's and Oracle University's course materials. We hope to see you again in a later class Thank you and good luck.

## 05. Summary 1m

In this module, you learned about deploying a Java SE application to the Oracle Cloud and how to create a basic REST service using Helidon.

