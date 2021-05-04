# 18: Building Database Applications with JDBC

1. Building Database Applications with JDBC - 26m
2. Practice 18-1: Working with the Derby Database and JDBC - 9m
3. Skill Check: Building Database Applications with JDBC - Score 80% or higher to pass

## 1. Building Database Applications with JDBC - 26m

All right, well, for chapter 18 we want to build database applications with JDBC, so we're switching gears. We've talked about how we can access files, we've talked about different means of persisting information from outside of the JVM. Now, we want to talk about, well, how do we persist it inside of a database, a relational database?

Now, the cool thing is that there are any number of databases that we can access. Obviously, there's an Oracle database, but there's also DB2, Informix, Sybase, SQL Server, any number of databases that we can persist information inside of. Now, the cool thing about Java is that they created a number of interfaces that allow us to access any of those databases without really changing our code much.

And so when we look at the API, and we'll get into this more in the slides, there are basically these four main classes. Now, there are others that we're going to talk about, but these are the main classes, and this is how they tie together. We're going to have a DriverManager. Now, the DriverManager is specific to the particular database that we're going to be talking about. And so each of these are interfaces that the vendor then implements so that we can access the particular database that we're talking about. Now, we use the DriverManager to identify where the database is, what port it's listening on, what its name is, et cetera.

And through using the DriverManager, we're actually going to create a connection object with that information. Now, once we have a connection object, what that does is, of course, create a pipeline to the database. We're going to create some kind of statement. Now, there a number of statements that we will talk about, but the statement object is what I can use to execute my structured query language or SQL information. Now, if my statement is going to execute a query, it will also result in a ResultSet.

Now, the ResultSet is a pipe to the that there is on the database, which allows us to pull a row at a time into our program. Later in the chapter, we'll see that there is also a class not called the ResultSet but be called a RowSet that allows us to do all of this internally. But it also means that it pulls the data directly into the JVM. So kind of a cool thing. So let's go ahead and get started. We'll talk about it through the slides.

All right, so in chapter 18 we're going to, as I said, we're going to define the layout of the JDBC API. The white board indicated mostly what that is about, so we're going to look at how do we connect to the database? How do we submit queries ? Get results? How do we specify JDBC driver information externally? And then finally, how can we do inserts, updates, deletes, alters, creates, and drops using the JDBC API?

And just like on the whiteboard, like I said, the API was created through the use of interfaces. And then each vendor is going to identify a vendor specific JAR file that includes the specific implementation of these different interfaces for to working with their particular database. And so in turn, what we're going to look at is, first of all, by using the DriverManager class, we can get an instance of a connection object.

Now, the way that we do this is, as it shows down here, we're going to start this syntax with JDBC a colon and then we're going to define a driver or, in some cases, a sub sub protocol. And so, for example, if I were going against an Oracle database, and I was using a Java client, then I would use the Oracle colon thin driver. And this is the client driver. Now, after that, we're also going to identify, well, where is this? So in the case of the Oracle driver, we would identify the host, we would identify the port, and then we would also identify the database name or, in the case of Oracle, a service.

So in this class, we're going to be using the derby driver, we're going to be accessing the local database on port 1527, and specifically, we want to work with the employee database. Now, we're going to create this as part of the lab, and so once I have this URL string, in some cases, you're also going to pass the user ID and password, but there are best practices for obfuscating that. We're not going to talk about those in this particular class, but they are there.

And so, for example, if I were going to access an Oracle database on a machine called my host, then I might do something like this. So once I have the URL, notice that I create my connection using the DriverManager, and then I call the getConnection method, pass in that URL. So once I have the connection, the next step in the process is that because each vendor's JDBC driver class implements the key API classes, you're going to use the methods, of course, are going to be there that we could switch between databases very simply by simply changing that URL. So, in this case, we create our connection, they're showing the passing the username and password in this case, but there are other ways to do it.

But once I have that connection, then the next object in the chain is that I want to create a statement. Now, in this case, I'm going to use a simple statement. Now, a simple statement is very simple because it allows me to have three distinct execute methods. And so, for example, if I'm going to execute a query, I can use my statement, call the execute query method, and then pass the SQL string that will execute this. So, in this case, select asterisk from employee would allow me to execute that query on the database, create the cursor on the database server, and then I would have a pipeline to it through my ResultSet.

So once I have the ResultSet, I can work with each row. We'll talk about that in just a moment. But first of all, let's talk about the methods that I was talking about here. Now, like I said, if you are executing a query and you want to return a ResultSet, you would use the execute query method. But that can only be used for select statements. If you're working with insert, update, delete, drop, add, or-- drop, create, or alter, then you can use the execute update method.

Now, again, we're going to pass in a SQL string, but in this case, it only shows the number of rows that are affected. So it's going to return an int. And then finally, you could execute any statement using the execute method. Doesn't matter what it is. You can execute it as long as it's SQL. But in this case, it's going to return a Boolean. Now, the strange things about the return of the Boolean is that it is always false, unless it's a query, in which case, the Boolean will return true.

So with that in mind, notice that I can, from my connection, I can create my statement. From my statement, I can execute. Now, if I'm executing a query, I can populate a ResultSet and, like I said, once I have the ResultSet, it is a pointer or a reference to the database cursor, but it isn't pointing at a row. In order to point at the row, I would have to call the next method. And so the next method, the first one will point to the first row, and then the second, third, fourth, et cetera. Now, once I call next and there is no row, it's going to set the ResultSet equal to null, but it's also going to return false to the next method to indicate, OK, I'm done.

So the ResultSet object is an easy to work with, and so once I am pulling that, this might be what it would look like from the start. All right, here's my URL, here's my user name, here's my password, here's my query, and notice that I'm going to do this in a try with resources block. So the first thing is I'm going to create an instance of the connection by using the DriverManager. Once I have the connection, I'm going to create an instance of the statement using the connection, the connections create statement method. And then I'm going to create an instance of the ResultSet by using the statements execute query method.

Now, this is a best practice. We'll talk a little bit more about why you would want to create all three of these instances in the try with resources, but for now, we'll just say that this is a best practice. Now, once you have the ResultSet, notice that I can call next, and because it is possible for me to iterate through any number of rows, it's best to put this in some kind of a loop. So we're putting it in a while. Now, notice what we can do next.

With the ResultSet, as long as we know what the type of the column is, we can identify what that type is so, in this case, we want the ID column, so that would be getInt. We want the first name so that would be getString. We want the birth dates so we can call getDate. We want the salary, so we're going to call getFloat. And so notice that we can instantiate primitives from the data that's being pulled from that particular row. And then, in this case, it looks like all we're doing is printing it out. But, of course, we could manipulate it or do whatever it is that we need to do with it.

If there's a problem with the next or with the SQL, it is possible for us to get a SQL exception. So with that, another possibility, all right, same situation here. We've got our try, we're creating our connection, we're creating our statement. But in this case, notice that my query or my-- well, my query, my SQL statement, is actually an INSERT statement.

So in this case I'm going to do an execute update, that's used for DML and DDL, and I pass the query. And as long as it's greater than zero, meaning that it affects at least one row, then I'm going to say a new employee record is added. And, at this point, I can do a select asterisk, and I can do a execute update to determine what that is. And then, of course, write the code to display the rows that I'm interested in to verify.

Same set up for a update. So we still have our connection, the connection creates the statement, the statement executes. So, in this case, we're executing an update setting the salary for, looks like, employee 500 here, and it looks like a pretty good salary. They ought to do that to my salary. Even if it was for a week or two, that would be good. So in this case, an existing employee was updated, and then, again, we could execute and make sure that the update occurred appropriately.

And then finally, same code. Notice the same pattern. We create our connection, we create our statement, we use our query, which in this case is a delete. Now, this wouldn't be good if you just got a raise and then suddenly you're no longer an employee. That wouldn't be too good, would it? But we're going to execute the update, pass in the query, again, as long as there is an employee that can be deleted. We'll print it out, and then, of course, we can write code to verify.

So if you notice, the pattern is exactly the same in each one of these cases. It's not really too complicated to work with. Now, earlier I talked about the SQL exception, and how if there is a problem with the execution of your SQL, it will return back. Now, the strange thing about a SQL exception is that it can be a nested exception, and so not only are we going to get the error message like we would any other exception, or via error code, we're also going to get something called a SQL state.

But in addition, because it can be a nested-- so for example, if I had try to update something, it's possible that because I'm trying to update a number of things, I could get a number of exceptions all wrapped into this exception. And so to access those wrapped exceptions, I can call the getCause method. Well, of course, in this case, I can loop through each of these causes and get to basically each one of them. So this could be a good way to identify all of the errors that are occurring if I'm trying to access the database.

All right, now, earlier, I said that there was a best practice way of closing JDBC objects. Now, one way is that I could create a connection, create the statement, create the ResultSet, which, of course, allows me to do something, and I could only close the connection. Now, the problem with that is that severs the connection to the database and it invalidates the ResultSet, but it does not close the statement or the ResultSet. And so neither of these resources would be released until an extra iteration through the garbage collector, which is not a good way to do it.

And so the best way is that you would want to close the ResultSet, then close the statement, and then close the connection, in that order. By going backwards, it allows for each one of these to be closed. Now, earlier we were talking about the try with resources and why it is important for us to create each one of these objects in the try with resources. Well, the reason is because in the try with resources, I can instantiate any number of objects that implement the AutoCloseable, and when I'm done, it's going to close each of those objects in reverse order.

So in this case, it would close the ResultSet, close the statement, and then close the connection without you having to do anything at all. Now, as opposed to, if I did this as a single string, because there's nothing that says that I couldn't say, DriverManager.getConnection, blah, blah, blah dot createStatement, and then pass in a statement dot execute query, pass in the query, et cetera, and then set that equal to the ResultSet, where the ResultSet would be the only object created. Again, that would be a bad practice because in that case, only the ResultSet would get closed, the connection would not. So that could be problematic.

Now, earlier at the white board, I also said that there were three different types of statements. We've seen one of them, so let's look at the other two. Now, the PreparedStatement is a subclass of statement that allows you to pass arguments to a pre-compiled SQL statement. So let's say that I know that I want to do the same update a number of times with different individuals or whatever it is that I'm updating, well, I could create an instance of that statement, in this case, called a PreparedStatement, and then I could just call the execute a number of times passing different parameters.

So how might that work? Well, we're going to pass in a parameter called value, and in this case, the value looks like 100,000. So the query that we're going to run is select asterisk from employee where salary greater than, and notice that I'm just going to put a question mark to represent the parameter that I'm going to pass in. So to do that, I can instantiate my PreparedStatement, so notice that I pass in the query, it parses the statement on the database. So it's ready to execute, but because I'm using a bind variable, it doesn't execute anything.

So notice that since I know that the first value is going to be a double, I would then say setDouble, identify the first parameter, and that's the one thing you need to watch out for. In JDBC, the collections are one based, so you want to make sure that each parameter has a positive number greater than zero. So in this case, the first parameter is going to take the value of value, and then notice that I can execute the query, populated my ResultSet, and in this case, I will get every row where the employee has a salary greater-- excuse me, than 100,000.

So that's the idea of a PreparedStatement is that I could go ahead and do this. Now, the nice thing is is after I worked with all the 100,000 ones, I could change the value of value and execute again without having to reparse without having to reinstantiate my PreparedStatement. So that's the advantage. So, for instance, if I were going to, let's say, in general, there's going to be a set method for each type in the Java programming language.

So the first argument indicates which question mark placeholders to be set, the second argument indicates the value. So we saw earlier the setDouble, notice that there is a setInt, a setString, and so we can identify which bind variable do we want to set? And then what is the value? And, of course, this value could be a variable. It could be a literal. It could be the result of a method call, as long as it returns the appropriate type, you're good to go.

And then finally, once you've set the-- this looks like the same slide as the previous one, but once you've set it, than all you have to do is call the execute, and depending on if it's going to return a ResultSet or not, you set it to the appropriate value. So here's an example of a PreparedStatement using a loop. So notice that I'm going to say update employee, set salary equal to some value where employee name like some value. So we have two parameters that we're going to pass in.

We're going to go ahead and create our PreparedStatement, so that's going to be called updateEmp. We're also going to have a integer array of salaries, so we have five different salaries, and we have a string array of five different names. So I'm to loop through each one of these names, and so notice that I'm going to call updateEmp, I'm going to set the first one, the first parameter, to a salary based on which one we're talking about. I'm going to set the string equal, the second, bind variable to the appropriate name, and them I'm going to go ahead and just call executeUpdate.

And so in this case, David, Tom, Nick, Harry, and Mark are going to-- looks like, going to have their salary set to whatever the values are here. Now, that isn't the only way that you can call and make things happen on a database, of course. And so that brings up the third-- that brings up the third statement, which is the CallableStatement.

Now, in the case of the CallableStatement, the idea is that you can execute non-SQL statements against the database. Read that as stored procedures. So, for instance, in this case, notice that when I create my CallableStatement, I'm going to call the prepareCall method, and I'm going to pass in a call to a stored procedure that takes two parameters, all right? So in the first case, I'm going to set the age variable equal to 50, and I'm going to set the first variable. So in this case, it's an integer. It's the first parameter, and I'm going to set it to the value of age, so in this case, we're going to see how many employees have an age greater than 50, is what this particular stored procedure does.

All right, so notice that I could execute the query because, at this point, the other one is an output variable. So I could execute the query to get the ResultSet of all of the employees who are greater than 50. And so that would be my ResultSet, and I could do whatever I want to do. Now, if I actually wanted to access the second parameter, however, I would have to call the registerOutParameter. I would identify which parameter am I talking about, in this case, two, and I would identify it's type.

Now, the reason for this is because SQL types and Java types are not exactly the same, and so I need to tell it what type it is going to be in Java. So in this case, notice that I can execute the query again. And in this case, I'm looking for a Boolean result. Well, if it, in this case, the results should return true because I'm executing a query, and so, in this case, I can basically say, all right, let's get a count, so how many are there?

So the second parameter is getInt, and I'm going to say, well, give me the value of the second parameter, and that's going to be my integer here. So I could say there are however many employees over the age of, and in this case, it would be 50. Clear?

So that brings us to the end of lesson 18. We're looking at how do we create a connection, how we can use the connection to create some kind of a statement, either a PreparedStatement or CallableStatement. And then we can use those statements to execute, and in the case of queries, we can return a ResultSet, and so we've shown all of the ways that you can use that, and so that brings us to practice 18-1.

## 2. Practice 18-1: Working with the Derby Database and JDBC - 9m

In Practice 18-1, we are being asked to work with the Derby database and JDBC. So before we even work on the project, we do need to create the employee database by using the SQL script provided in the resource directory. So the first thing we're going to do is we're going to click on the Services tab. And we're going to click on Databases.

And if you notice, there is this Java DB. So if we right click on it, we can start the Java database. And it looks like we may have a problem or not. But it looks like it's running, so we'll assume that worked well.

But in this case, we're going to right click again and we're going to Create a Database. So the name in this case they've given us is EmployeeDB. Our username is going to be tiger. And our password will be Scott.

So if I click on OK, then it should create the database for us. OK, that looks good. And so you should see an additional link here that points to your EmployeeDB on Tiger.

So in this case, we're going to right click the connection. And we're going to click on Connect. Looks like we're good to go so far.

So if we open that up, we should now see Tiger. But before we do that, we are now going to right click and we're going to-- OK, apparently we're not going to right click, we're just going to go to File, Open File. And we will go to the Home Directory. Go to Labs. And then under Resources, we have our EmployeeTable.SQL script.

And when we click on OK, it executes or it opens up a Employee Table. And in this case, we can choose that we want this script to connect to the EmployeeDB. Now once we've done that, we can go ahead and run the script.

I'll go ahead and click on the icon. It looks like we had a single error. Let's see what that is.

OK, the attempt to drop the table didn't work because, well, it didn't exist yet. So that's OK. And so we're going to expand our connection.

And at this point if we look under Tables, we do have an Employee Table. And if we look in the Employee Table, we do have an ID first name, last name, birth date, and salary column. So that looks good.

If I go back to this and I want to execute a command for example, if I want to select asterisk from employee, I can go ahead and execute it and it appears to be giving me 18 rows here. So it looks like we have some data in our Employee Table, so that's a good thing. So now what?

So now we have our project. So if we go back to Projects to the simple JDBC 18 Practice, and we open that up, and we open up the simple JDBC example Java file, we could go ahead and run this right now. And it looks like it allows us to access each of the employees there. It looks like I have not got the date correct-- mainly because I did the time instance, rather than the date instance.

All right, let's try this again with the right code. So yes, in this case we get employee ID, name first name, and last name, birth date, and salary. So that looks good so far. And so what else do they want us to do?

So it says to add a SQL command to add a new employee record. All right, so right underneath the while clause that we currently have written, we're going to go ahead and add some code to add an employee. So what would that be like?

Well, we already have a query. So let's replace the query we've got. And let's see an insert-- I think that they've given you this. So insert into employee values. Did they give us values? They do.

All right, so we're going to include in 400 bill Murray, social security number-- or phone number, or whatever that is-- 195009-- OK, that must be birth date. OK, excellent. And we're also going to pass in 150,000.

All right so at that point, that would be our query. So to execute our query, we could do a execute on the statement that we already have. But in this case, let's see, this query would not return. So you don't want to execute query.

So we want a execute update. We're going to pass in the query. And so in this case, if the execute query works-- or let's see, if the execute query isn't equal to 1, then let's go ahead and say that something didn't work.

And we already have our other exception. So if it works, great. And then it looks like we can rerun of course this and get the opportunity. So this should work for us.

So if we run this again, we have every button that we had before. But if we run it again, it's going to give us an exception, because obviously now it has bill in there. So let's try it again.

All right, so here's our addition from the previous one. But it of course tried to add bill again in this run, so it gave us an exception. So looks like it worked well. And that completes Exercise 18-1.


## 3. Skill Check: Building Database Applications with JDBC - Score 80% or higher to pass

Skill Check: Building Database Applications with JDBC

View Skill Check
