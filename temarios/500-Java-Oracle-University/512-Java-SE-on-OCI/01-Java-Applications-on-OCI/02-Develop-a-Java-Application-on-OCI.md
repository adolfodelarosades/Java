# 2 : Develop a Java Application on OCI

1. Develop a Java application on OCI 23m
2. Solving the warranty claim problem 10m
3. Solution for the warranty claim application 12m

## 1. Develop a Java application on OCI 23m

Module 2, develop a Java application on OCI, the Oracle Cloud infrastructure. After completing this lesson, you should be able to analyze requirements and develop the design for a Java integration application. You'll be able to open, read, and print files, implement application logic, connect to and test a REST service, and connect to and read/write to an Autonomous Database. In this application you're going to batch process a set of CSV-based file records. These are comma delimited records.

You're going to process those records, initially looking for any records which have the wrong format. Records that have the wrong format will be logged and not processed. The records that have the correct format will then be validated against a Warranty table. So this is basically a set of claim records of customers wanting to make claims against warranties, and so we need to check with the serial number to make sure the serial number and the warranty are valid. This will be done through a lookup in the database table.

For any claims that have a valid warranty, then you will go out and read the web service in order to retrieve additional country information and add that into the record that will be written to the database. So that's augmenting the valid warranty information with the country information. The augmented claims are stored in the database with a status of new. Any claims that are not valid would be written and logged out as invalid claims, as well.

So basically, the batch processing is to read the file, process the records. If they're invalid formats, write them to a error file. Check to see if they're valid warranties against the database. If they're not, write them to an error file.

If they are valid, then go ahead and augment them with information from the RESTful web service. Take all that together into a new record, and write that out to the database. That's what your application is going to do.

The expected output from the application would be a file with the invalid format records, a diff separate file with invalid warranty records, and then the claim records with the valid warranty and the augmented data written to the database if there are any. And there will be some. At the end, the Claim record in the database should have the information from the CSV, comma delimited initial record, the warranty, and the data retrieved from the REST endpoint.

You'll be able to go in and look at the files to make sure they have the right data, and that will be one way to check your output. And of course, you'll be able to look at the records in the database to make sure the record's being written correctly. That's how you'll check your program.

Because this is a batch program and we're not focusing on user interfaces for this, there won't be a graphical interface to look at the results. But of course, that could be created and added as well. The CSV comma delimited file has a following structure.

The claim record structure, as you can see here, has a customer ID, in this case, 1896, the customer name, in this case, John as the first name and then, Doe as the last name, then the customer email, then the product ID, then the product name and the serial number. And it's the serial number that we're going to tie to the warranty record.

We also have the claim date, as you can see here. You can see the subject of the claim and the summary. This is shown again in the activity guide, as well.

So you'll create a file with this structure, comma delimited, and seed the data with some sample data yourself. We give you the record structure. You create the data to test your program.

The warranty record structure starts with the product ID and then has a serial number, the warranty number, the date open, and the expiry date. So for example, if the claim here is 6/11/2020 and this was opened on 6/6, and it's good through 2025, then the claim would be valid. If, however, it was only valid through, let's say, 6/6 of 2020, then a claim of 6/11/2020 would be invalid. And finally, the country code record structure that comes back from the RESTful web service will have the country code and then, the region.

So that's the structure of the file that we're going to use. You'll start off by creating a file that'll have a number of records like this. Some of those should have a valid format, some that'll have an invalid format so you can test your code. You'll also have a warranty record structure, as well. And then, you'll have the country code record structure, too.

All right, so in terms of building this application, there's many different ways to go about it. We make some suggestions to give you some methodology and structure to your work, but again, you can build this however you wish. It's open to you.

We recommend that you work iteratively and incrementally. I would not recommend trying to write the entire application all at once. That would be a bad idea. Instead, write the code for one logical portion and test that that works sufficiently before going on to the next. For example, you may wish to write the code that reads from the input file first and get that working, then write the code that writes to the output files, gets that working.

Now, for provisioning, which you did in a previous module, you created a virtual machine and Autonomous Database. You configured SQL Developer to connect to the database. You created a database user for the application. You created the database table and populated it with sample data. And you created CSV file, and you'll populate it with sample data.

You didn't do that as part of the provisioning, but you'll do that as part of this lab exercise. If you completed Lesson 1 and Module 1, then you should have done the provisioning at this point. Now, once it's provisioned, you can create the project in an IDE like NetBeans.

You use your TigerVNC or VNC client to connect to the virtual machine environment. You already have NetBeans there and configured. You start up NetBeans and write your code there.

We recommend that you configure your application properties. Think about your file names and paths. Think about your record structures. Think about the database connection information. Some of the database connection information is very specific, and we will give that to you as a guide.

Now, you'll then want to start off-- and I recommend first thing you do after you create your project and think about your application properties, create and test a class to read your input file. And then, create and test classes to write your output files. Make sure you can read your input file and write your output files.

Once you can do that successfully, then go on create and test a class to connect to the database. Read a record, and then write a record. When you can do that, move forward and write a class. Create and test the class to make a RESTful web service call and return the result.

When you can do all that, now you can use a separate main class with a main method that would bring all these other classes together and provide their application logic. Now, you can test these other classes a number of ways. One thing you can do is you can actually put a main method into the class that's going to input and output your files. Doesn't mean you'll call the main method in production, but you can use it to test that code. And when that code's working, you'll simply call that class and create an instance for that class from your application itself, and we'll show you that a little bit as we go along.

Now, as we go through this, there's going to be a set of accompanying videos. And we'll do two sets of videos. One will be hints videos. These will be videos where I'll go through each of these different sections, and I'll suggest hints on how to do things and then stop so you can try to follow on and solve the problem yourself. If you're totally stuck and you can't move forward, then there are solution videos, as well, that will show you exactly step by step how to solve this problem.

Now, there's nothing embarrassing or bad about not being able to solve the problem. There's always learning that's happening, and no knowledge is lost. So if you can't get a certain piece to work, that's fine. Watch the solution video. Make sure you understand why the solution works the way it does, and maybe try to replicate that yourself.

Now, connecting to the database from within a virtual machine in the Oracle Cloud can be a little bit more complicated than just a normal database. And what we're going to do for that is use a wallet. So a wallet is a zipped up file that you can download directly from the database instance in the cloud infrastructure and add that to your connection information when you connect to your database from your Java code.

I'll show you where that wallet appears, and you'll see where you can download that wallet. The nice thing is inside your VM, you can go ahead and connect to the OCI cloud. You can then download the wallet directly to your VM and then make that VM a part of your NetBeans project. And then, when you create your URL for connecting the JDBC, you'll notice that you'll have the name of the database, you'll have TNS_ADMIN, and then the directory of and the path to where the actual wallet file is that you downloaded.

And now, accessing a service URL. We're going to access a REST service. That's something you do quite often. You may not have learned how to create and work with REST services yet. That's taught in the Java EE course and the web service course, but it's still pretty straightforward to write a client to call a RESTful web service.

For simplicity's sake, we're just going to use a very simple web service here, and we're going to hard code the actual end point, which is USA. And that will give us the information for the United States. The way this service actually works is if you put in restcountries.edu/rest/v2/alpha/ and then put it in another country, like gb for Great Britain or it for Italy, it'll come back and show you all the information for that country.

Now, normally, we would not hard code a parameter like USA into a properties file. Instead, we would retrieve that from somewhere else, and we would just add that to the URL and then make the call when we need to. And I'll point that out when I look at the code. For our purposes, for simplicity, we're just going to hard code the whole thing into our properties file and not have to worry about adding an end point.

So a little bit about REST-- a REST service application represents a resource. In this case, the example here, the resource is a information about a country. But resources can be all kinds of things. You could use it for downloading JDKs. You can use it for looking up information on the web.

When you type in a URL, you're accessing a resource in the world wide web, and rest services can work that way as well. So when you access a REST service, the code on the other end will carry out what you're requesting it to do. What you're requesting it to do is typically one of these four different HTTP type options.

Get will query that resource and retrieve a representation of it. So for example, the get will retrieve me information on a country. Post will create a new instance of a country. So if I wanted to add a country to that service, I could.

Put will allow me to update an existing country. So if there's a change to a country code, we can update it. And delete, of course, would remove that element.

So REST web services are a way of sharing code and allowing multiple users to make requests to the same code and have that code handle each request separately and do it using HTTP protocols that are part of the web. This is covered in much more depth in the Java EE7 development course and the web services course. The way this works is you make an HTTP request, and an HTTP request is dispatched using a method.

So we have a get or a post or a put or a delete, and a response to that request comes back-- 200 if it's OK. 404 is not found. These requests and responses contain headers, which is information that describe metadata about the request itself, like the content type, the length, the character encoding, the date and the time.

So what we see here is that when we make a request and we basically go into a browser or any type of application that can make an HTTP request, so the ability to make an HTTP request programmatically is something we'll need to do in our Java code. But keep this in mind for now. Through a browser, if we enter this URL, it will go out to that website and see it.

We're going to do a get request. This is what actually is received by the remote server. The client, the browser, generates this get request to this URL, using HTTP 1.1, and here's the host. And that is received by the server.

The server has code, which generates the response, in this case in a JavaScript Object Notation format, a JSON format. And then, the server sends back the response. And what we get back is a 200 OK.

The content type here is text/plain. Content length is 1354. And of course, there's many, many other types of content types. And then, we have the actual payload itself, where the name field has a value, "United States of America," and there's more to it as well.

Note, please, that these HTTP-based RESTful web services are a very popular protocol choice for many Cloud-based applications. And many, if not all, of the services that you're going to use in the Cloud are going to appear as RESTful web services for you to call. Now, the details of doing that, how to work with that, and build those services and all are taught in other courses. But here, we're going to access the service.

So now, let's take a look at the code in Java that allows us to make this RESTful web service request and receive the response back in a form that we can use. So this is a code that we're providing for you. This comes from the JAX-RS, which is Java API for XML RESTful specification. That's the specification for the RESTful web services.

There's also a JAX-WS API for SOAP-based services. We cover that in our web services courses. So here, what we would see is in order to call the RESTful web service, we assume we have an end point URL. This is just a plain string that would contain all of this, https://restcountries.eu/rest/v2/alpha/usa.

So that is what's contained in the end point URL. That's the string. We start by going to the ClientBuilder class, and we create a new client object.

Now, client and ClientBuilder are part of the JAX-RS API and allows a client to make a URL type call to a REST service. Once we have the client object, as we have here-- object reference, we can then call its target method. And that's where we point or pass the endpoint URL to.

By passing the endpoint URL to the target, as we see here, we can then make a request, saying that the application JSON is the media type. Data will come back in JSON JavaScript Object Notation format. There's other formats as well, as I mentioned. We could have XML or plain text.

In this case, the code is coming back in JSON format. And we have a get, so that's the actual operation being done. If we're doing a put or a post or delete, you would see a method for each of those.

So one of the nice things about this client is that it gives you methods that correspond to what you're trying to do with the REST service. So here's our target-- makes total sense. This is where the end point is. This is the nature of the request and the header information we want to add, and this is the actual operation that we're doing, a get.

Now, the country class here-- this is a separate class that was created for this application. It stores information about the country code, the country name. Now, the nice thing about this is if we pass in a reference to the class itself, which is what we're doing in our get, then the code for the client will read the JSON information that comes back, the JavaScript Object Notation information comes back as the response, and automatically instantiate it in instance of the country class for us, and populate the fields in the country class by calling the set methods with the value coming back from JSON. In other words, it converts the JSON data into an actual Java object, which we can use going forward. And that's what you see here.

The getManufacturerCountry method returns an instance of a country object-- the country class. The country object here is first initially set to know, and then we assign it the value coming back from our JavaScript Object Notation get. Now, if it fails-- we get an exception-- then we would not convert, and we would just return the exception. We could just return the country as null, and if we see a null country coming back, we know it didn't work.

This is all the code you need. What you will do when you execute this code is you will now have a valid Java country object with the correct information for the country that is necessary. That's all you have to do.

Now, of course, there are some imports you have to bring in, and you want to double check those and make sure they work correctly. But again, as I said, this is all the code you need to get this to work. Now, if you're still kind of stuck with this, please take a look at the hints and the solution, and that will help you along.

So the application logic itself should start by opening and reading a CSV file that'll have claim records that are batch processed. In other words, you're not going to process records one at a time. You're going to read the entire file in, and then, filter and parse them into a claim object-- and a collection of claim objects, I should say, and you'll use the Java Stream API for doing this. So this is the Java Stream classes that you learned about. So you can stream and filter and map and do things like that.

Then, any wrong format records will get logged. And then, records that have the right format will be parsed. And the claim objects are validated against a Warranty table. What that means is you take the claim, you take the serial number, and if the warranty exists, validate that it's not expired.

So you'll do a query using the serial number on the Warranty table, and if that serial number is found, then check the dates. And if the claim date is within the expiration date, then the warranty is valid. If not, then it's expired, and it is invalid, and you'll log back. You'll want to then attach the warranty number to the claim when it has a valid warranty.

So if you go back for a moment, just to show you the data so you can be clear about what I'm talking about here, notice that the claim record does not have a warranty number. It has a serial number. So the serial number's right here, 3650.

So what you'll do is you'll read this record. If it's formatted correctly, you'll take that 3650. You'll do a query. You'll select against the database, looking for a record that has 3650 as a serial number. That will be the warranty record, and you'll retrieve that record and then compare the date of the claim, which is this, against the start and end date of the warranty.

One of the nice things about this is if you're not quite sure what we're asking you to do, you can go back. You can relisten to this. Also, I'm going to record a series of hint videos that will show you comments for the classes you could be creating and give you hints as to how those classes should be coded.

Again, if you feel pretty comfortable building this, just go off and start building it and doing it yourself. But if you get stuck or you want guidance, we're going to create helping videos first, which will give you hints and suggestions for how to solve the problem. And we'll also do a set of solution videos that'll show you what the problem looks like when it's solved if you need to see the actual solution.

So at this point, you've processed the set of claim records, filtered out the ones that are not formatted correctly. You're then checking each record one at a time against the Warranty table to see if the warranty is valid and not expired. And then, for valid warranty records, for each record that has a valid warranty, that's where you'll call the REST end point to get the country code and the country region. You'll update that claim with the country code and region, and then you'll write that to the database with a status 'new,' and that's a new inserted record.

You are strongly encouraged to try your best to solve the problem before referring to the solution. There's many things you can use that will tell you how to solve these various problems and how to design this. You can use your notes from the Java Programming Complete course. You can Google help and the web. You can look at other Java courses as part of the Java learning subscription. You're welcome to use any types of resources you want.

We would encourage you not to just copy the solution from someone else, and to try to work it out yourself. A solution is presented as a series of recorded video hints, and the sample code solution is also provided in the java-oci-solution.pdf file. So if you're completely stuck or you don't know how to go on, or there's a bit that you can't get working, take a look at the solution.

As I said, there's no problem looking at it. There's no shame with that. You get as far as you can.

Learning happens at all levels. No knowledge is lost. So do the best you can, and then look at the solution if you need to.

We included an optional extra challenge. It's completely optional. If you don't want to take it on, that's fine. But some students may have found that this exercise is doable for them and doesn't really stretch them maybe as much as they'd like, and they'd like to stretch a little bit more, so we're suggesting a change to requirements. Once you have the application working completely as specified earlier, then go forward and see if you can implement this application change.

Again, I strongly recommend, do not do this extra challenge until the rest of it's working. When I used to teach in the university, I did have students who would do that. They would look at the extra credit and try to get the extra credit going as well as the main assignment, and they would run out of time and not have enough time to get it all done.

You don't really have time constraints. You can take what time you want to do this. We think it takes, probably from start to finish, about maybe 8 to 16 hours, depending on your experience and coding experience to code this and get it going. Could be a little bit more, depending on things go. Could be less.

However, my point is go ahead and get the basic programming assignment going first, working correctly. Then, when it's working correctly, if you wish to, stretch a little bit more and do a little more work. Then, what we're going to say is change the application.

Right now, we are hard coding USA into the end point, but that really isn't how we would do it in real life. In real life, we would code the URL but leave the endpoint off. And we'd put the end point into the claim record.

So now, the claim record has, let's say GB or USA, that represents the actual country. You would take that value and append it to this string and use that as the new endpoint URL when you make the REST call. So very nice optional extra challenge if you want to go further with that. So hopefully, this provides a nice optional extra challenge for you to stretch yourself with.

In addition to this video, I'm going to record another video, which will go through the activity guide. It'll take you through the basic structure of what the lab does in more detail. And then, I'll also have a set of hint videos, which will give you hints to solving the problem, and then solution videos, as well. And with that, we wish you good luck.

## 2. Solving the warranty claim problem 10m

Welcome. In this video, we're going to look at hints for solving the warranty claim problem from the develop Java applications on OCI course. In this video, I'm going to show you some suggested hints that maybe help you get over a hump or get unstuck if you're having problem moving ahead with your solution.

Now the way we're going to do this is look at the different classes and look at comments in those classes. We're not going to look at implemented code. That, we do in the solution video. We decided to do these videos separately, so you could watch the hint video to get an idea of how to move ahead and try to solve the problem yourself. But if you were truly stuck and could not move forward, you could look at the solution video and hopefully solve one portion at a time and get you going again.

Now a couple of things. The solution that we show here is one possible solution. It is not the only way to do it. We opted for multiple classes, one class, basically, for each logical thing we're working with. You could do the whole thing in one application with the main method and just use other methods or even just do it all in one main method, which isn't a great design, of course. But never reusable, hard to maintain, but it could work.

And potentially, if you don't want to go the whole class route, you could just do it all in one main method right here. And then when you're ready, refactor that code out into other classes. So there's a number of different approaches. So our goal here is to help you get a sense of how to solve the problem and hopefully get you over any humps or blockages you have.

So the first thing we see when we open this project in NetBeans is that there is a resource bundle. And that resource bundle called app.properties has a number of different properties in it. And those properties are used to represent things like endpoints, file names, et cetera.

I'm not going to show you all that. But I am showing you that this is how we did it. We did a properties file. Now we did cover how to create and work with a properties file in the Java programming complete class. You'll also notice that there's a wallet here that came about from downloading the wallet from the database instance and adding it to our project.

Now here in the source packages, we have a number of different packages. We have warranty management, management database, IO, model, and rest. Let's take a look at the management first. That has the main, warranty management app.

So here, we put comments in to, basically, guide you to what to do in the application. The application should load the property bundle first, then open up a CSV file with the batch claims, stream the file contents, filter and map those to a new record. Now any claims with an invalid format are logged to the output file. Claims which are valid format are then parsed and validated against the warranty, so essentially, a warranty database.

What this means is doing a query on the warranty database for the product ID and serial number. If you get a record back, that will have the warranty number. And that's what you need.

If valid, class claims are augmented with the warranty number coming back from the database. Invalid warranty claims are logged. Valid claims are then augmented with an additional call to arrest data source, which returns a country code and a country region. Finally, the newly created or the augmented claim object is written to the database.

So some basic comments. Get your app properties first. Set up your file reader. Read the claims. Create a file writer for the class. Here we go, file writer. Write claims with the wrong format to a local file.

For the warranty validation, create a class to establish a database connection with the database settings from the properties file. Verify each claim has a valid warranty. Write claims with an invalid warranty to a local file. For valid claims, go ahead and call the REST API for each claim. Get the code and the region. Add them to the file. And then save the augmented claim to the ATP database.

I know the rest call is fairly simplistic and rather silly. It's just calling the same thing over and over again. And we mentioned in the second video that you could extend this exercise and actually recode this yourself to pass the country code in the claim record in the CSV file and then use that to build up your endpoint URL. Again, I recommend you getting the basic exercise going first and then add other things to it.

Now we did have an application configuration class. And this is a class that's used to read the properties file. So there is a properties file. It has a get config method that returns a properties object. And that's how the properties file gets loaded.

Let's look at the data. We're to look at IO first. Let's look at the claim file reader. Now you see all the imports. And the claim file reader has a constructor that will take the desired data format, a method that, given a file name, will read the claims and return a list of type claim.

There is a parse data, which will parse the actual text from the file, returning an array of objects. And there's also a get failed record. So once the file is parsed, you can call read claims. And that will retrieve the red claims that were valid. And then anything that failed, you can call that and get a list of the failed records. So those are some of the things you could do in the file reader.

In the file writer, you have the ability to write an invalid format. So if you have an invalid format record, you can pass in the list of claim records that are invalid with the file and the file name, and it'll write out that file. If you have invalid warranty records, then, again, you can pass in those claim records. And those will be written out as well. And here, we simply get the output file name and retrieve that based on the file path and the string file name. So claim file writer is a lot easier, just writing out the two collections of invalid records, invalid format and invalid warranty.

For the database, there is a database processor. And what this does is it will actually attempt to save claims. And so if you have a list of claims, so if we pass it in a list of claim objects, it will write that to the database. And then the save claim would be called by the save claims, or the save would be called by the save claims, which would save one record at a time. So this would loop through the list and then call save claim, one way to do it.

Notice the constructor for claim DB processor takes the database connection as an inbound argument. There's also a warranty database class. This warranty database class gets the connection and sets up the database. This is one that is setting up a pool data source for a universal connection pool. But you don't have to do that.

You can use just a plain database connection, JDBC connection. And you can set that up. You'll have the username, the password, and the URL for the database. So you don't have to use pool data source if you don't want to. And if you haven't worked with one before, I recommend just sticking with just the raw plain JDBC connection.

And lastly, there's a warranty validator. And what this does is it validates the warranty. So one, we pass in the database connection. The database connection will go out to the database. And given a list of claims, it'll take each claim, go out, and go to the database, and query the warranty.

Given the product ID and the serial number, it should come back with a warranty object. Then the find warranty, given the query string and the product ID or the serial number, will actually find the warranty. So a couple of differences here.

One is you actually have a query string. This does the actual search. This builds up, actually queries the warranty. You may or may not find that you need both classes and both methods and how those are going to work. There's also a get invalid warranty claims, which you'll get back a list of all the claims that have an invalid warranty.

Continue on to our model. We have three classes, a claim class, which, basically, just has getters and setters and a toString method to create a claim object, as you can see here. We also have a country class, which allows us to get the set name for country information. And that's what we'll populate with the rest service.

And then we have a warranty class, which stores information about the warranty itself. Notice these are basic domain classes, simple setters and getters, just to store the data. And then these will get used later when writing to the database.

Now if we're calling the RESTful web service, we showed you all the code for this. And the main code is actually right down here in the get manufacturer country. So the idea here is that you have an endpoint, and you would create a new manufacturing client class with an endpoint. That endpoint would be the URL that you're going to call, which you read from the properties file.

Then you would come down and need to augment your claim data. So given a list of claims, if claims are equal to null, you stop. Otherwise, for each claim, you call get manufacturer country, which is down here. That actually makes a call to the RESTful web service, as we discussed, and passes back a country object. We get a country object back. And now we can add that country object in to set the country for the claim itself and then return the claims.

So very, very basic class to do all that. So those are the hints necessary to get started. You saw a sense with the different classes do. You saw how we did the architecture and the design. We built this, got it working, and then just took the code out, leaving the comments. Hopefully, this gives you some ideas and some hints going forward. And with that, that completes this hint video.

## 3. Solution for the warranty claim application 12m

Welcome. In this video, we'll look at the solution to the warranty claim application being done for the Java on OCI course. In NetBeans, if we open the solution, we'll take a look at how this has been done. Now, I'm going to go through this a little at a time, doing one section at a time, thus giving you a chance to maybe just look at that one section and go back and try it yourself if you need to before watching the entire solution.

First thing is the properties file. So you'll notice that we have a properties file here, and if we double click on it, you can see what the properties file looks like. We have basically a key value pair-- key on the left, value on the right.

We have the batch file name. We have the format. We have the output file name and the output file name prefix. We have an output warranty file and an output warranty file name prefix. So we have our batch input file and two output files, the invalid format and invalid warranty claims.

We then have the URL to connect to the database. Of course, yours is going to be different. But I did download the wallet and added the wallet here, and so that's going to pick up the correct wallet with the correct number. Notice the wallet has the correct number over here. And then, we see the APDB username is Java dev, and the database password.

Now, there's other ways to get around putting passwords into property files, but for simplicity, that's what we're doing here. And we're hard coding the end point. So that is how the property file works. I'll give you a moment to pause and think about this.

OK, next up, we're going to take a look at the main method. This is the main application. So what we did here was we started off by creating a number of private final static strings. That's the claim batch file name. And we're putting in the prefix for all of these, and then, we're going to look that up in the properties file.

So rather than hard coding this into the file, we are hard coding the key name but not the value. We have the database, URL, username, and password. Again, those are all coming from the property file. And then, we set up logger for doing logging to the command line console.

So first thing we do is we call the app configuration get config, and the app configuration is here. It's a very simple application class file, which is going to do a get-config, look for the properties file, and return an instance of a properties file as a result. Next up, we're going to create the claim reader. Claim reader, we're going to pass in the config.getProperty for CSV data format. We're going to create the claim reader and tell it to read the claims, again passing in the get property with the claim bat file name.

So here's the format it's going to be set up with. Here's the file name. And we get back a list of claims. Now, we create a new claim writer. And now, we're ready to actually write out the invalid claims.

Now, interestingly enough, what we don't see here is how the invalid claims get found. That's actually done in the claims files. We'll come back to that-- or the claim input and output classes-- but we would get the claim writer, and then we can say to the claim reader, get the failed records. That's where it actually retrieves the failed records. And then, we're going to say to the claim writer, write your invalid format, passing in a list of the failed records.

It iterates through the failed records and writes them all out. So now, we have read the input file. We have our list of claims. We've obtained our invalid list of claims and written those out.

Next up is the database. We're going to create a new warranty database, using our configuration of dburl and the username and password. And now, we have a warranty database connection. Now, we can go to the warranty validator, pass in the connection, get the connection, pass it into the constructor, and get back a warranty validator.

Now, we have a validator class that will do the validation for us, and we take the claim list that we got from processing the file and pass that into the validator. The validator or will validate those claims and then pass back a list of valid claims. Also, we can call invalid warranty claims and get back a list of the invalid warranty claims to print those out with the claim writer. Notice we are also taking a different output file. So we're using the same output class but different file names, and so we're using the same output class but different file names for different locations.

So we've gotten the valid claims. That's there, and we've written out the invalid claims. So now, we need to go through and we'd call the REST API. And so what we're going to do is get a new manufacturing client, which will take the API endpoint that we get from the properties file, giving us the manufacturing REST API.

We call Augment Claim Data and pass in the valid claims. It will go through each object, and it will add data to that claim object with the correct country code and country name. We get back from that, the augmented claims list of claims, print out any errors we've got, and now, we've got the augmented claims. And the last thing to do is to call the claim db processor, pass in the connection again, and this time, pass in the augmented claims to the save claims method.

Save claims method is going to iterate through the augmented claims and is going to write those out to the database. And that is basically the entire application. I want to go one step further. Notice it writes out how many claims were saved to the database, total claims stored.

I do tend to put one more thing at the very end of my processing, and this is an old legacy thing, but what I tend to do is report complete or something like that, or end or something. And the reason I do that is if this program were to abort or not complete correctly, how do you know it finished correctly or if it didn't? And so I like to put something at the end of a program, like a batch program, to indicate that all processing completed and the processing is done-- not required and old school, but just wanted to mention it.

OK, let's take a look at the database classes. The claim DB processor is here, and we'll look at the code. And the claim DB processor has a logger and a status. It has a connection object. We're going to pass in the connection, and that will give us a connection object back, making sure it's not null.

Then, we're going to look at our saved claims, which it's going to iterate through the list of claims, and for each claim, it's going to call Save. So in the save, we pass in the claim object. We build up a string for a SQL insert. We're using a prepared statement, so we can simply call the GET method to retrieve the object and set the values in the prepared statement. That's what all the question marks represent-- the different positions within the actual SQL statement.

Now, this is a much safer way of doing things than using a raw SQL statement because it allows you to reuse it. It gets preparsed. There's a number of nice benefits to using a prepared statement.

So what we're doing is going to the claim object, getting the customer ID, and using that to set the ID for the first field, and then, the name for the second, last name for the third, and on and on. This sets up the entire insert statement. And when that's done, we can then Execute Query, and that'll actually do the query, or you could also do Execute Update. That would work as well, and that would do an insert for us. And then, we close the statement when we're done.

So the save writes each one out, and then, the loop simply loops through. And for each claim, we're calling Save Claim. Bingo. Database gets written out.

Now, Warranty Database is going to have the ability to create the database connection. Now, this is doing a universal connection pool. If you're not doing universal connection pool, your code is going to be a lot simpler than this. You're simply going to load the JDBC driver, connect to the database, and get back a connection object. And that's all you're going to do.

That's what they're doing here. This is using Universal Connection Pool, and it would be worth learning about it and seeing how to use it. And there's lots of documentation out there on how to do this-- not something we're going to cover in here at this point.

The warranty validator, then, is what's going to validate the warranty. And the way we do this is we pass in a list of claims, and the Validate is going to create an array list of valid warranties and another array list of invalid warranties. And now, it's going to loop through the claims list, and it's going to do a search. Do Query Warranty for this claim product ID and serial number.

The Query Warranty actually goes out to the database. It will actually generate the select statement. And then, the Find Warranty will actually take the select statement and the product ID and serial number and generate the actual query and bring the results set back.

So that's how the two work together, and they're building it up in pieces. So they have one method that's going to loop through each claim and turn around and call the Query Warranty as you see here. That will check and generate the actual select statement, and then the Find Warranty will actually go out to the database.

I might have done them backwards myself. I didn't write this solution myself. Others on our team did this. Just looking at it now, I might have put Find Warranty here and Query Warranty here, because that's closer to what's happening in the database, but it's a minor nit. That's just very stylistic stuff.

So that's the warranties process through we query the database and retrieve the statement and retrieve a warranty object with the updated information. For I/O for the claim file reader, here's a claim file reader. As you can see here, we have our MessageFormatter, DateTimeFormatter. We have our Read Claims, which is going to read through the claim list and process the lines and create two arrays for us, or two lists, rather-- array lists.

One would be the claim list, and then, the other one is generating as well, which you see here claim.add. So failed records is not actually here. Failed records actually becomes a new array list here, and then, we call Parse Data. So when we call Parse Data here, it parses through the data and returns a data formatted object array. However, if records fail the parsing, then, they get added to the failed records down here.

Now, one thing I want to mention about doing an add to a collection inside of a stream, which is what's happening here-- and if we were doing parallel processing, this wouldn't work very well, because we're not using a thread-safe method. But since we're doing only sequential processing here, this is fine. But again, it's not a good practice to actually call an Add Method on a collection inside of a stream. There's a better way to do this, and there are actually methods that'll do this in a thread-safe manner.

OK, so this reads the claims, produces the failed records list array, and produces the claims list array. Then, the Claim File Writer is going to be created with the file we're going to write to. And it's basically doing the same thing, a BufferedWriter, newBufferedWriter.

We take the claim records for each one. We go through. We write out the carriage control line feeder at the end, as you see here. So very straightforward. And all we do is pass in a different in the constructor-- or rather, when we pass in the claim records and the string file path name and file name, we can write to a different file with a different path name and record. So this is a very general purpose file output utility.

We talked about the model before. Basically, these are just simple, what we would call plain old Java objects or POJOs, or what we call domain classes or business classes. These handle the actual customers, country, and warranty, and they're simply a bunch of getters and setters. There's no real business logic going on in here right now, though of course, you could do that if you needed to.

And lastly was the REST Client, which we've already looked at in the hint video. So hopefully with this, this gives you an idea of how this can be solved. And you can go back and watch this and try to code parts of it. And of course, remember that there is a PDF file with all the source code in there as well, as reference.

Again, good luck. And we wish you great success. Thank you.
