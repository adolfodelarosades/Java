# 14: Building Database Applications with JDBC

1. Building Database Applications with JDBC, Part 1 - 19m
2. Building Database Applications with JDBC, Part 2 - 30m
3. Building Database Applications with JDBC, Part 3 - 20m
4. Practice 14-1: Working with the Derby Database and JDBC - 5m
5. Practice 14-2: Using the Data Access Object Pattern - 9m

## 1. Building Database Applications with JDBC, Part 1 - 19m

So after we've done the practice labs for Lesson 13, let's go ahead now and look at Lesson 14 where we are going to take a look at building database applications using JDBC. So in this lesson we are going to be able to define the layout of the JDBC API, connect to a database by using JDBC driver, some queries and get results from the database, specify JDBC driver information externally, use transactions with JDBC, using JDBC 4.1 RowSetProvider and RowSetFactory. This is actually a very nice new feature part of the Java SE 7. We'll take a look at that. And of course, we'll finish by taking a look at revisiting the Data Access Object Pattern that will help us decouple the data and the business methods.

So so far, what we've been doing folks is we've been looking at all of the concept of the Java SE 7 throughout all the lectures or the lessons that we saw before. But right now, what do we want to do is say, OK, now we'll go ahead and use our Java technology to be able to access the database and access records in the database and maybe manipulate those records in a database. That's the idea behind what we're trying to do here.

And we start by using the JDBC API. At some point in time, folks, when you get into the Java EE technology, you will get a chance to take some courses in the Java EE 6, for example, which is a current spec of the technology. And you will learn that if you want a business out component to access the database, we typically know the steps exactly the steps. The steps is that first you would do a look up, which could be through JNDI or look up all the annotation to get the data source, the reference to the data source, which is your database. That's actually an automatic creation of a pool of connections from the app server to the database.

And then, of course, after that you declare connection. And the connection will ask the data source to get a connection for it. And then once the connection is acquired from the data source pool, then at that time from it you declare a statement and the statement will ask the connection to create a statement for it. After the statement is created, then you will invoke the execute method to execute, in this case, the query and get your results set, if you're doing a select, for example.

And you will see it here in this diagram, folks, where we have the driver manager. And that's pretty much that allow you to get a connection. Again, this is part in here. And so on step number one, we take a look at that later on. And then, once you acquire the connection through the getConnection method through the driver manager, then at that time, and by the way, in this case, once you get that connection, then at that time, you'll go ahead an create a statement through the create statement. And by the way, in this case, you can use the create statement that is specific to a vendor connection.

And then once you get that statement, you'll go ahead and invoke the execute query, which will be used using the vendors type of statement that you have, because it all depends what type of database you are accessing. It could be Oracle database or MySQL or Informix and so forth. And then after that, once again you return results set. You will go ahead and iterate the results set and get your information. So in general, again, we want to look at it from the steps point of view, we can say, in this case, that the JDBC API is made up of some concrete classes. Again, such as a day, time, and SQL exceptions, and of course a set of interfaces that are implemented, in this case a driver class that is provided by the database vendor, like Oracle, for example.

And because the implementation is valid business all of the interface method signature, again once the database vendors driver classes are loaded, you can now access them using these steps here. Where first we use the class driver manager, again we've seen this in the diagram up here, where we've seen how you access the driver manager here. And so we have that step where to obtain a reference to a connection object using the getConnection method.

And by the way, the typical signature of this getConnection method is you pass to it a URL, a name, and a password, where the URL is the JDBC URL, and we'll see later on an example of that, and the name and a password would be a string that the database will accept for connection. And then after that, we use the connection object which is implemented by some class that the vendor provided. And this is of course, to obtain a reference to a statement object through the create a statement method. OK?

So the typical signature of this create method will be with no arguments. And then after, we are in the early step two here where, pretty much, we say how we invoke the create statements, in this case, on the connection to go ahead and create that statement. And then after that, we use the statement object, in this case, where it's going to be a statement object that obtain an instance of the results set through, again, which method? Through the execute method that takes query. Again, this method typically accepts a string, which represents the query. And by the way, a query in this case is static string SQL.

So using a vendor's driver class, we typically see that, first of all, the driver manager class is used to get an instance of the connection object using the JDBC driver named in the JDBC URL for example here. And in the practice labs, you are going to make use of the Derby, in this case, JDBC URL, which are represented by JDBC:derby://localhost:1527 the port and, of course the name of your database. It turns out that it's going to be called EmployeeDB.

And by the way, in the practice lab, you are going to populate your database. They give you, in fact, in the Practice 1 of this particular lecture or lesson, you will see that you will create a connection and you also create a database. And you, of course, populate that database with a script that you're going to open, and you will also be able to view the data inside your database through the NetBeans ID.

And in this case, what's going to happen is you invoke the getConnection method on the driver manager and you pass the URL string to it. And that will give you an instance of the connection. Of course, the URL syntax for the JDBC driver is typically JDBC and then the driver then some kind of subprotocol then the database name and a bunch of attribute values if you have them. Again, every vendor can implement its own subprotocol. Then of course, after that you have the URL syntax for an Oracle thin driver would be JDBC:Oracle:thin:@ and then your host, port, and service. Example, JDBC:Oracle:thin:@//myhost:1521/orcl.

Now remember one thing, folks, and I want to just discuss this piece here with you, any JDBC 4.0 drivers that are found in the class path are automatically loaded. of course, the driver manager dot getConnection method will attempt to load the driver class by looking at the file, which is, in this case, META_INF/services/java.sql.Driver. Of course, the file contains the name of the JDBC driver's implementation, which is the java.sql.Driver. For example, the contents of the META_INF could be services and then java.sql.Drive file in the Derbyclient.jar file. The Derbyclient.jar file is related to the database that we have plugged into the NetBeans. And of course, it contains the org.apache.derby.JDBC.client driver.

So drivers prior to JDBC 4.0 must be, again, loaded manually using this type of statement. We're actually using, in this case, the four-name method of the class. And we should also mention that driver classes can also be passed to an interpreter on the command line too, using the option that you see here.

Continuing with this and now looking at some key JDBC API components. Well, remember folks that every vendor's JDBC driver class also implements the key API classes that you will use, of course, to connect to the database and execute query and manipulate data. And of course, the java.sql.connection is a connection that represents the session between your Java application and the database. And in general, the way you get the connection by invoking the getConnection passed the URL to use the name and the password. And of course, this getConnection is invoked vote on the driver manager. Of course that will be returning a connection.

The java.sql.statement, that would be nothing but an object used to execute a static SQL statement, and of course returns the result. And the way you, again, got that statement is invoking the create statement method that on the instance or the reference to the connection. And that will, of course, in this case return the statement to you.

And also, we have the java.sql.results set. And that would be an object representing a database results set. And the way you do it typically is, by first of all, you create your query, and that would be your string representing your query. And then after that, we'll go ahead and invoke the execute query method and pass the query to it, which is that string. And then this would be invoke on the statement that we got from the connection. And of course, that will return a results set. Everybody's following, folks? Good, good, good, good, good.

All right. Moving along and now looking at using a results set. So again, we've seen this in these couple of statements previously in the previous slide, and that pretty much returns a results set. And again, as you see you here, usually the results set cursor or at least the first next method invocation returns true and the results set points to the first row of the data in this case. So if you incremented by next, it would get right there to the first row of the database. And of course, the last next method invocation returns a false, and the results set instance is now null, which means we've finished, we're done now with the iteration through the results set.

One thing that we want to say about the results set, folks, is that the results set, and again, this is an interesting type of information that I want to share with you, is that the results set maintains a cursor to the returned rows. Of course the cursor is initially pointing before the first row. That's exactly what we've seen here. Pointing, again, before the first row that you see here.

And of course the results set next method that is called to position the cursor in the next row, so in this case would be the first row of the database. The default results set is not updatable and has a cursor that points only forward. And by the way, it is possible to produce results set objects that are scorable and/or updatable. So again, in the fragment code that we see here in which the connection is a valid connection object, it pretty much illustrates how to make a results set that is scrollable and sensitive to update by others and that is updatable.

So you see that we have a create statement invoked on the connection. And you pass through it the type scroll insensitive and of course the concur updatable. And of course, after that we have the execute query where you pass your statement to it and invoke the execute query on the statement which returns the results set. We should also note, folks, that not all databases supports global results sets. The end results sets has accessor methods to read the content of every column returned in a row. And of course, they have getters methods for every type. We'll see, again, examples about this in the next few slides.

Let's go ahead and put the whole thing now together. And putting the whole thing together here, we see, folks, that we have a class called simple JDBC test, where in this case we have a main method. OK, again, this would be an example of a JDBC application, and of course a simple one that reads all the rows from an employee database and return the results set as strings to the console. So in this case, we have, as you see here, on line 15 through 16. OK?

That's where, folks, we use the try-with-resources. And we already know with a try-with-resources statement, which by the way was introduced in Java SE 7, we discussed that earlier in one of the previous lessons. And this try-with-resources statements is used to get an instance of an object that implements the connection interface. On line 17 here, we now use the object to get an instance of an object that implements the statement interface from the connection object. Now remember, also, that before that we somehow declared the bunch of strings where the first one we initialized with the URL and we called it URL, the second one, username, the third one, password, again they're public tiger, and the query, which is select everything from employee table.

And of course, we have line 18 here. And that pretty much creates a results set by executing the string query using the statement object. Now we should remember that, in this case, we have coded the JDBC URL, username, password. And of course, this is, typically, all practical. In general, you use a console to read this information, username, password, URL, and so forth. OK? But this is just for the purpose of, pretty much, illustrating what is it that we want to show you here.

Again, continuing with putting it all together, so once we return the results set, the next thing we need to do is iterate the results set and get the information. So here, again, we loop through all of the rows of the results set. That's how RS.next. And then what we do here is we invoke the getInt and pass the ID to get the employee ID, invoke the getString and pass the first name to get the first name and then do the same thing for the last name and then for the birth date and of course for the salary. So we've got everything. Again, here we are using methods on the results sets, getInt, getString, getData, getFlood.

And then after that what we want to do is we want to print that information and, of course, catch an exception it there is and exception. Everybody's following? So far, so good? OK.

## 2. Building Database Applications with JDBC, Part 2 - 30m

Of course, we're interested by writing portable JDBC code. Well, the JDBC driver provides a programmatic "insulating" layer between the Java application and the database. However, we also need to consider SQL syntax and semantics when writing database applications. So again, most databases support a standard set of SQL syntax and semantics described by the American National Standards Institute, which is ANSI, SQL-92 Entry-level specification.

Of course, you can programmatically check for support for this specification for your driver. And how do you do that? By, in this case, again, getting a connection, by invoking the getConnection on the DriverManager. And then, after that, of course, you'll go ahead and invoke the getMetadata on the connection.

That gives you, what? A database metadata. And then after that, what you do is you check if, again, you invoke the supportANSI92EntrySQL method. And of course, folks, this is invoked on the reference valuable to the database metadata. And of course, if it is true, that means it supports, again, support for the Entry-level SQL-92 standards. That's how we check, again, in this case, if your driver supports the ANSI SQL-92 standards.

Continuing with that, now, let's go ahead and look, of course, at the SQLException class. It turns out, folks, that SQLExceptions can be used to report details about resulting database errors. Again, to report all exceptions thrown, you can actually iterate through the SQLExceptions Exceptions thrown.

Well, we'll just mention to you folks that an SQLExceptions is thrown from errors that occur in one of, again, the types that we see now later on, which would be, again, some of the actions could be driver methods, could be methods that access the database, or an attempt to get a connection from the database. That's how you get your SQLException.

Of course, the SQLExceptions, in this case, it is a class. And it also implements Iterable. So we can actually iterate through it. So exceptions can be chained together and return a single object.

Also, SQLExceptions is thrown if the database connection cannot be made due to some incorrect username or password information, or simply a database is offline. We also know that, again, SQLExceptions can also result by attempting to access a column name that is not part of your SQL query. And of course, Exceptions is also subclassed, providing granularity of the actual exception thrown.

And here, we have an example where, in this case, we catch an exception, which is, again, in this case, SQLException. And we use the while loop, and we say, while that exception is different than null, we'll go ahead and do that. Here, we're printing, for example, the SQLState by invoking the getSQLState on the exception. And of course, we're printing here the error code by invoking the getErrorCode method on the SQLExceptions.

And here, we're printing, in this case, the message. And of course, these typically are vendor-dependent state codes, error codes, and, of course, messages. In this case, we'll go ahead and get you the message. That's, of course, by evoking the getMessage method. And of course, you can go ahead and invoke the getCause on the exception to get the throwable.

You can now use the while loop and iterate through this throwable, and of course, print the cause in this case by invoking the getCause method on the throwable and get whatever cause that you have. And of course, you can go ahead and invoke the getNextException to get the next exception. Now, we should note, folks, that the SQLState and SQLErrorCode values are database dependent. So for Derby, the SQLState values are defined, again, in this case, in the URL that we showed you here.

Now, looking at closing JDBC objects. Well, closing a Connection object will automatically close any Statement objects created with a connection. Of course, closing a Statement object will close an invalid-- rather, invalidate any instances of the rule set created by the statement object. And of course, resources held by the ResultSet may not be released until garbage is, of course, in this case, collected.

So it is a good practice to explicitly close ResultSet objects when they are no longer needed. And of course, when the close method on the ResultSet is executed, external resources are also released. Again, we show here that you don't close only the Connection.

It's also important to close the Statement, and of course, close the ResultSet. And by the way, you can also specify, using the try-with-resources that also can handle that. ResultSet objects are also implicitly closed when an associated Statement object is reexecuted. So in summary, it is good practice to explicitly close JDBC Connection, Statement, and ResultSet.

Let's look at the example of the try-with-resources. This, by the way, is a feature that was added in the Java SE 7. So if you take a look here, folks, you will see that pretty much we declare a Connection. And then we'll go ahead and invoke the getConnection method on the DriverManager and initialize it with that Connection.

And then after that, we have the createStatement invoked on the Connection that gets you a Statement. And then after that, we'll invoke the executeQuery and pass the query to it on the Statement, and that, of course, gets us the ResultSet.

Now, when we use the try-with-resources Statement, what happens, folks, is the compiler checks to see that the object inside the parentheses implements the java.lang.AutoCloseable. We've seen that earlier in one of the previous lectures. Again, this interface, what it does, it includes one method, and that would be, again, the close method.

So the close method, what it does, folks, it's automatically called at the end of the try block, in our case here, for example, And in the proper order, and of course, last declaration first to be able to close everything. And of course, multiple closeable resources can be included in the try block, separated by semicolons.

Let's look at this. This is a typically bad practice that sometimes people do. And we should actually pay attention to this, and we should not do this. A lot of folks saying, OK, I have now the knowledge in Java. It might be a good idea to compact my Statement, which, by the way, vis-a-vis the Java, you're doing well. You're actually within the rules of Java.

In this case, look at what we've done. Within the try block, we'll go ahead and declare a ResultSet. And what we do is we use the DriverManager, invoke the getConnection on it, pass the URL. And then wherever we [UNINTELLIGIBLE] invoke the createStatement on it to get the Statement, and then, on that Statement, invoke the executeQuery and pass the query. So that's just exactly one Statement. Everybody sees that?

Well, we've got a problem with this, folks, if you're trying to use the try-with-resources. And here, what happened is, if you use this, only the close method of the ResultSet is actually called, which is, again, everything else is not called, which is a bad practice. So always keep in mind with resources, you need to close when using the try-with-resources.

So in this case, of course, it is a bad idea to actually compact this. Instead, write them like we wrote them earlier like here. This way, we know that the compiler checks to see that all of them implement the AutoCloseable, and, of course, the close method is automatically called at the end of the try block in the proper order, again, last declaration to first. So we should avoid this.

Continuing with the lecture, looking now at writing queries and getting results. Well, to execute SQL queries with JDBC, what we need to do, folks, is we must create an SQL query wrapper object, and of course, an instance of the Statement object. So in this case, we'll go ahead and invoke the createStatement on the Connection reference object to get the Statement. Again, then, we use the Statement instance to execute the query. And of course, in this case, we pass the query to it.

We should note that there are three Statement execute methods. We have the executeQuery that returns ResultSet, and it's for the SELECT statement. We have the executeUpdate, that takes an sqlString, and then, of course, that pretty much returns an int to the number of rows affected. And this, by the way, can be used for INSERT, UPDATE, DELETE, or, again, a DDL. And of course, the execute, this pretty much returns a Boolean that says true if there was a ResultSet. And this could be used for any SQL command or statements.

So again, we see this down here where we specify this for you. And this is return ResultSet object. This, again, is used typically for INSERT, UPDATE, or DELETE and returns an integer, again, in this case, number of rows or zero when the statement is a Data Definition Language, which is DDL statement, such as CREATE TABLE. And the execute, in this case, would be used for any statement that returns a Boolean indicating if the ResultSet was returned. Again, multiple SQL statements can be executed with the execute method. Everybody's following, folks? Good.

All right. And of course, we have a practice here. And this would be working with the database and where you start your database, and you populate the database, and you run the SQL, and of course, compile and run your sample. Just to show you a little bit how this works, I already created this. But you folks are going to follow the activity guide to be able to do that.

They'll ask you to click on the Services, and of course, they ask you to open, in this case, the Databases link, and underneath, they have your database DB. We called it DB, but this is really the Java DB. You right-click, in this case, and you will start. It's already started. You start the server.

And then after that, they ask you to Create Database. Again, when you put in the name of the database, which is, in this case, "Employee DB," username is "public," password is "tiger." Confirm the password "tiger," and then click OK, which is done for me.

And then after that, they ask you to go ahead and Connect the Connection. At some point in time, by the way, you will see this getting created. And of course, after that, you right-click on it, like this one here, and you click on it. So it's already connected.

And then after that, they'll ask you to open a file. And go ahead and go under the Labs Resources and select the script, and then open it. And then after that, when you open it, in this case, let me just go ahead and, just out of curiosity, open that.

I already ran it, so I am not going to run it again. And then after that, they ask you to select your connection, this one here, and then you click on this to run this script to populate your database. It turns out that I already did that.

Once you do that, they ask you now to open the connection. And by the way, it's a good idea to refresh the connection, right? Click on Refresh the connection. You will see that there is a new table here, public. You see how it's highlighted here. You open this one here, and then you open the tables, and you see the Employee table.

You now right-click on this, and you click View. And that allows you to view the data. This is how we populated the database. Everybody sees that? So you folks are going to, again, do this as the Practice Lab number 1 for this.

After this, again, the Practice 1, then after we're done with the Practice 1, let's go ahead now and continue with the lecture. Now we're going to look at the ResultSet metadata. Well, there may be a time where you need to dynamically discover the number of columns and their types. So sometimes, again, we want to get that ResultSet metadata.

And for that, folks, typically, this ResultSetMetaData class is obtained from the ResultSet. Again, we use the getColumnCount. That returns the number of columns returned in the query that produced the ResultSet. And of course, the getColumnName and getColumnTypeName methods return strings. Again, these could be used to perform a dynamic retrieval of the column data.

We see an example here where, if you take a look here, we have, first, on the ResultSet, we invoke the getMetaData. That pretty much gets us the metadata. And on it, we invoke the getColumnCount, and that gets us, in this case, the column count.

And of course, down here, we'll go ahead and create an array of strings. One is called Column names. The other one is called Column types. And then, of course, we initialize them with the arrays of strings. Again, one has the size of a number of columns, and the other one has the size of number-- again, number of columns.

And then we use the for loop to iterate between zero and the number of columns, strictly less than number of columns, and in this case, what we do is we'll invoke the getMetaData on the ResultSet and invoke the getColumnName name, and pass, in this case, as you see, i+1.

Why? Because we should note that these methods are indexed from one and not zero. That's why it's plus one. Remember that, because at some point in time, we are going to see a quiz about that.

And of course, here, we invoke the getMetaData on the ResultSet and invoke the getColumnTypeName, and of course, pass to it i+1. And then after that, we'll go ahead and print the number of columns and print, of course, here, the message. And of course, we iterate through the using a for loop by printing what? The column types.

So we should note folks, that, again, these methods use one to indicate the first column, not zero. And then, of course, given the query SELECT everything from Employee and the Employee data table, again, from the practices, this fragment produces this result. You folks are going to see this later on in the practice and wherever you've seen in the practices of this particular lesson. So it produces, pretty much, the number of columns returned is five, and of course, the column name types are returned would be, here, be INTEGER for the ID, and then VARCHAR for the first name, and then VARCHAR for the last name, and the DATE for the birth date, and, of course, REAL for the salary. Everybody's following?

Now, getting a row count. Well, a common question when executing a query is, how many rows were returned? Now, we should also, folks, let you know or remind you, recall that to create a ResultSet that is scrollable, you must, again, define the ResultSet type in the createStatement method. And if you remember, we've seen this earlier in one of the previous slides.

So again, there is another technique, again, for the non-scrollable results. And again, this is using the SQL COUNT function on, again, one query determines the number of rows, and a second reads the number of results. We should be aware that this technique requires locking control over the tables to ensure the count is not changing during the operation. And you see it here where this one here gets you, in this case, SELECT COUNT from the employee, and that would be returning the number of rows. And then, of course, executeQuery returns the ResultSet for the results.

And of course, looking at the code, now you see how we have a method called rowCount that takes a result set and returns, of course, integer the number of rows. So we declare rowCount, and we invoke the getRow method, in this case, on the ResultSet and save it into the variables of type integer called current row. And of course, we have to check for validity of ResultSet. And then here, we say why it's not last, again, return minus 1. This moves the cursor to the last row. And this method, again, returns false if the ResultSet is empty.

And then, of course, on line 6, we'll invoke the getRow method on the ResultSet that, again, you use it to save it into the rowCount. Again, we return the cursor to the current position and by, again, if the current row is equal to zero, go ahead and invoke the beforeFirst. Else, invoke the absolute and pass the current row. And then, of course, at the end, we're returning the current row. So again, returning the row cursor to its original position before the call is good practice.

Continuing with that, now looking at controlling ResultSet fetch size. By the way, folks, by default, the number or rows fetched at one time by a query is determined by the JDBC driver. Of course, you may wish to control this behavior for large data sets. For example, if you want to limit the number of rows fetched into the cache to 25, then you can go ahead and set the fetch size using the method setFetchSize that you invoke on the ResultSet and pass to it the number, in this case, 25.

Calls to the ResultSet, next method returns the data in the cache until the 26th row, at which time, the driver will fetch another 25 rows. By the way, normally, the most efficient fetch size is already the default for the driver.

Let's go ahead and look now at the PreparedStatement. Well, the PreparedStatement is a subclass of the Statement that allows you to pass arguments to a pre-compiled SQL statement. Here's an example where we declare the value here 100,000. Again, you see how we use the underscore, and that is acceptable in 7, right?

And then here, we go ahead and create a query. And the query here is to select the employees that their salary will be greater then 100,000. Again, in this case, the question mark represents the parameter for substitution.

And if we make use of the PreparedStatement, pass the query to it, that, again, will create a PreparedStatement. But now look what we do. Now we can go ahead and substitute the value for the first parameter in the PreparedStatement using what? The setDouble that you see over there.

Everybody sees that? That will be, again, the first parameter, and the value is the 100,000. And then we'll go ahead and execute the query.

Now, remember one thing, folks, that in this code fragment, a prepared statement returns all columns off all rows whose salary is greater than $100,000. And of course, the PreparedStatement, by the way, is useful when you have SQL statements that you are going to execute multiple times.

Now we'll look at the CallableStatement. Well, the CallableStatement allows non-SQL statements, such as stored procedure, to be executed against the database. How many of you have known or heard or seen or worked with stored procedures? So here's an example where we have a CallableStatement that we get through calling the prepareCall method on the connection. And we pass here, of course, the call to what? To an employee age count, where again, in this case, takes a couple of parameters. Got that?

So again, the first is the age. We set it to 50. And the second one, again, where we set the integer 1 to the age. And then, of course, execute the query and return ResultSet. And of course, here, we invoke the registerOutParameter to get the second one, which, by the way, is of type integer, the second parameter. And of course, in this case, we invoke the execute to return the result.

And of course, after that, we'll go ahead and invoke the getInt on the CallableStatement, pass 2 to it. This would be the OUT parameter that is returned from the stored procedure. And of course, that would give me the count. And then after that, we'll go ahead and print the count, and print, of course, the age.

Stored procedures are executed on the database. Let's go ahead and look at the Derby stored procedure example. Well, in the Derby database, folks, you're using the Java programming language for its stored procedure. Again, in the example shown in the slide that we just have seen here, the stored procedure is declared using this syntax here, where we have create procedure employee age count, again, that we have seen here.

And then we pass the age, which is an integer, and of course, the number, which is an integer. Again, here, we have a dynamic result set to 0, the language is Java. External name is DerbyStoredProcedure.countAge. The parameter style is Java, reads SQL data.

Again, of course, a Java class is loaded into the Derby database using the following syntax, for those who are curious about how this is done in the Derby database. And of course, the call would be, in this case, using syscs_util.syscs_set_database_property. And you pass your derby.database.classpath and the PUBLIC.DerbyStoredProcedure.

Continuing with that, now looking at the Java class stored in the Derby database that performs the stored procedure calculates a date that is age years in the past based on today's date. And of course, the SQL query counts the number of unique employees that are older or equal the number of years passed and returns that count as the second parameter of the stored procedure. Of course, the code in this example would look like this, where you have your imports.

And then your DerbyStoredProcedure, which is a class. Again, in this case, we'll go ahead, and we have a method, countAge. It's a static method. Takes, of course, an age and the array of integers count. And then here, we declare a URL specifying the jdbc:default:connection. And then, of course, we go ahead and get a connection from the Driver Manager. And then we'll set the query, in this case, this query.

And then, of course, after that, we'll go ahead and create a PreparedStatement. And then after that, we call the getInstance of the calendar, which is the date. And then after that, we'll go ahead and invoke, in this case, the add method on the instance of the calendar by passing, by the way, to it the Calendar.YEAR and the age*-1.

And after that, we'll go ahead and create the new instance of the Date. And that would be that we use it to save it into the instance type Day past. And then we set the date, again, in this case, the parameter first one to pass, and then we invoke the executeQuery. And then, of course, if the ResultSet next is true, then we'll go ahead and get that. And that will be a count (0).

Else, of course, we put 0 in the count, and of course, close the connection. So by the way, you can consult the Derby Reference Manual and the Derby Tools and Utilities Guide for more information about creating stored procedures in the Derby database, which is open source, by the way.

Now, what we want to discuss, folks, is transactions. Transactions are very important when you're accessing databases. Why? Because they help you preserve the integrity of data. Well, a transaction is nothing but a mechanism to handle groups of operations as though they were one.

Of course, either all operations in a transaction occur or not occur at all. That's the concept of the two-phase connect. So the operations invoked in a transaction might rely on one or more databases.

And we can see in the example, for example, transferring money from a bank to another one where the first one, you debit the money from the first bank, and then in the second bank, you will go ahead and credit the money in the second bank. Of course, whenever we talk about transaction, we should also not forget, folks, the ACID properties of a transaction. Well, a transaction is formally defined by the set of properties that is known by the acronym ACID, where A stands for Atomicity, which means a transaction is done or undone completely. In the event of failure, all operations and procedures are undone, and all data rolls back to its previous state.

And what does C stand for? Consistency. Well, consistency means what? A transaction transforms a system from one consistent state to another consistent state. And I stands for Isolation where every transaction occurs independently of all the transactions that occur at the same time. And of course, D stands for Durability, which, by the way, means that completed transactions remain permanent even during system failure. And that's pretty much persisting the data in a database.

## 3. Building Database Applications with JDBC, Part 3 - 20m

Now looking at transferring, in this case, money without transactions. Well, of course, looking at these cases, we can look at the first case where we have a couple of accounts, one has originally $500, the other one has $1,000. We'll go ahead and withdraw $100 from Account 1 and deposit that $100 in Account 2. So in the end, Account 1 will, of course, end up with $400 and Account 2 $1,100. This works without any problem. No problem whatsoever. OK?

The issue that we have is whenever we have an unsuccessful transfer. For example, in this case, somehow we withdraw the money, but then the deposit failed. So again, what we need to do in this case, we need to specify a mechanism by which, of course, we control this so that we can preserve the integrity of data. So if the deposit did not happen, we should be able to, again in this case, reset the data to its original state, right?

That leads us to the concept of handling a transfer with transaction. So you handle it with the transaction, then of course if it's successful, then the changes within a transaction are buffered. Again, that would be A where you pretty much subtract $100 from Account 1 and deposit it in Account 2. And of course, that's good. If a transfer is successful, then the changes are automatically committed and that becomes permanent. And that's the Case B, where again now the Account 1 will have $400 for good, it's permanent, and Account 2 will have $1,100.

The issue that we have, again in this case, we use the comment here, the issue is imagine there was a problem. So that would be looking at the unsuccessful transfer. But this time, we preserve what? We preserve the integrity of the data using transactions.

So again, in this case, step one, changes, again, within the transaction are buffered, except that in this case it turns out that we have what? A problem. OK? The $100 could not be deposited into the Account 2 due to some exceptions. So in that case, what we need to do is we need to apply what? The roll back. Rolling back means what? You are going to put back behind $100 in the original account. And of course, it will end up with $500 and, of course, roll back the Account 2, which will have its original state or the amount of money, which is $1,000.

We would like to do this. We would like to use transactions, folks, whenever we are manipulating data to preserve the integrity of data. It is OK to fail, but as long as you roll back and you get to the original state of the data, then we're in good shape. Everybody's following, folks? OK.

Now looking at JDBC transactions. By default, when a connection is created, it is in auto-commit mode. You have every individual escape statement is treated as a transaction and automatically committed after it is executed. Now to group two or more statements together, you must now, in this case, disable the auto-commit mode. So again, you disable it through the set auto-commit, and you passed the force to it.

You must explicitly call the commit method to complete the transaction with the database. And this is the commit. And of course, you can also programmatically roll back the transaction in the event of failure. And that's con.rollback OK? So that's pretty much what we wanted to achieve from that.

Now remember one thing also, folks, that we should know that JDBC does not to have an API to explicitly begin a transaction. The JDBC JSR 221, again, provides these guidelines where we tell you when an auto-commit is disabled for the connection object all subsequent statements are in a transaction context until, again in this case, either the connection commit or roll back method is executed. And of course, if the value of auto-commit is changed in the middle of the transaction, the current transaction is committed.

In addition, of course, the Derby driver documentation adds another route here where the transaction context is associated with a single connection object, which is a database, and the transaction cannot span multiple connections, in these case. So the database pretty much is done for the purpose of developing and testing your development. That's all. You also know that there's an example about the JDBC transaction example that you see in the example directory.

Now looking at RowSet 1.1, again where we see the RowSetProvider and the RowSetFactory. This is a very interesting feature, folks, that was that introduced new in the Java SE 7. And these again, they're the javax.sql.rowset.RowSetProvider and javax.sql.rowset.RowSetFactory classes.

These two classes are used to construct instances of row sets. And we'll see these in the next slide. So again, in this case, we said that the RowSetProvider is used to create a RowSetFactory object, and we can see it this way here. By invoking the new Factory method on the RowSetProvider to get you a RowSetFactory. And of course, the default RowSetFactory implementation is pretty much com.sun.rowset.RowSetFactoryImpl.

And the RowSetFactory is used to create one of the RowSet 1.1 object types. Let's investigate this in the next slide. So using the RowSet 1.1, which is the RowSetFactory, RowSet is used to create instances of RowSet implementation. Again, the we have the RowSet type, which is the cached RowSet. This provides a container for rows of data out that caches its row in the memory.

We also have a filtered RowSet, which is a RowSet object that provides methods for filtering support. We also have the JDBCRowSet, and that's a wrapper around the RowSet to treat results set as a JavaBean component. And we have the JoinRowSet, and this is pretty much a RowSet object that provides mechanisms for containing related database from different RowSet objects. And we also have the WebRowSet, and that's a RowSet object that's supposed to send that XML document format required when describing a RowSet object in XML. Again, we tell you here about some of the descriptions. Pretty much what I have discussed here is a summary of the different RowSet types that we have.

Now let's go ahead and see an example of using the JDBRowSet. Well, in this code fragment on the slide here, what we do is we create a JDBCRowSet instance from the RowSetProviderFactory. So we'll go ahead and do that. OK. And then after that, what we do is, again in this case, we'll go ahead and said the URL on this JDBCRowSet, set the username, set the password, set the command, and of course execute the JDBCRowSet.

Now what we're going to do is treat that JDBCRowSet like exactly a RowSet where we iterate through it, of course, and get the ID by invoking the getInt on the JDBCRowSet, get the first name, get the last name, get the birth day, and get the salary. So pretty much what we've done here is we treated the object like a RowSet JavaBean. And of course, in this case, we use the set of methods to set the username, and the URL, the password, and, of course, we executed the SQL command later on. And of course we obtained the result set to retrieve the column values. And we have an example in the example folder that actually represents this type of code. It's called SimpleJDBCRowSetExampleObject.

Now what we want to do is we want to go back and revisit, folks, the data access object. If you remember, when considering an employee table, like the one in the sample JDBC code that has, again, employee, it has an ID, a first name, a last name, a birth date, and of course a salary, by combining the code that accesses the database with the business logic, the data access methods and to the employee table are now tightly coupled. That's a bad idea. That's not good. That's a bad cohesion.

Any changes to the table, such as adding a field, will, of course, require a complete change to the application. And that's also bad. So of course, employee data is not encapsulated within the example application. So what we need to do is we need to think of a mechanism where we separate these. We'll use some separation, in this case, where we put the business logic on one side and the data access logic on the other side.

That leads us to the typical diagram that we've seen earlier when we discussed the data access object patterns. So you see here, we have a client. And the client, of course, in these case, is some employee testing interactive client. And then here, look what we do. We actually now make use of the employee DAO Factory, and of course we make the client rely only on the interface DAO, which again has all the abstract methods here. And then we'll go ahead now and implement our employee DAO interface anyway we want. Here it turned out that we're employing it, we're implementing it for what? The employee DAO JDBC implementation.

If you remember in the previous lecture when we discussed that, we implemented it using just a file and memory. Now here, we're implementing the DAO JDBC implementation version, in this case, of the employee DAO. And of course the client makes use of the Factory to create a new instance of the employee DAO JDBC implementation and then of course give that reference to it. That's pretty much what we wanted to do.

And by the way, we all know that the employee DAO, in this case, and it's from the auto closeable. And this is to use what? The try-with-resources, to be able to use the try-with-resources all of the Java SE 7, which again will, in this case, help us to avoid writing all those closed methods at the end. And so, again, what we're going to do is we are going to, in this case, to get into the practice labs to be able, again, work on implementing this employee DAO JDBC implementation.

So in summary, what we've done, folks, here, we looked at defining the layout of the JDBC API, we looked at connecting to a database using JDBC driver, we looked at submitting queries and getting results from the database, we looked at specifying JDBC driver information externally. We also looked at using transactions with JDBC, we looked at using JDBC 4.1 RowSetProvider and RowSetFactory. This is a new feature that is added in the Java SE 7. And we looked, of course, at here using a data access object pattern by decoupling the data and the business methods.

Of course, we have a bunch of quizzes. Let's go ahead and look at these. The first one, again, in this case, that says, with the statement method executes SQL statement returns the number of RowSet. Again, which statement, in this case, method executes an SQL statement and returns the number of RowSets. That would be, of course, B. Thank you. The executeUpdate.

And of course, the second one, let's going to look at the next quiz where it says, when using a statement to execute a query that returns only one record, it is not necessary to use the result sets next method. What do you think? Is this true or false?

False.

False. Thank you. And continuing with that, the next one, in this case, is looking at the following try-with-resources statement, again, will properly close the JDBC resources.

True.

False.

Again, in this case, what do you think? That is true. OK? So in this case, again, the following try-with-resources that you see here statement will properly. And that is, of course, true. Again, this illustrated a good practice, explicitly closing the result set so because we created here a statement.

[INAUDIBLE]

Yeah, well, it's just a snap code of that. We're talking only about this school, the one that we have here.

Here's another nice quiz. And in this case, we have a code fragment. Look what we do here, folks. We declare an array of strings, Bob Smith. And then we declare a query, select item account from a customer, again, where the last name is, and the last name is. OK. And then here we'll go ahead and within the try, a block we'll go ahead and create a prepare statement by invoking the prepare statement past the query to it, and of course invoking it on the query. And then we use the for loop to iterate, again, these through the parameters and, of course in this case, set the object. OK? In this case, set the parameters.

And of course, after that, we'll go ahead and invoke the execute query and the return result set. Again of course, after that, we'll go ahead and iterate the result set, and of course print by invoking, in this case, the getInt and passing the item count on the result set. And print that.

So assuming in this case that there is a valid connection object and the SQL query will produce at least one row, what is the result here? Take a look carefully. Again, we just processed that a little bit. And tell me, what do you think about this? We've got a problem somewhere, and you should be able to actually identify this in one of the statements. A hint is somewhere towards the end, maybe the second half.

[INAUDIBLE]

Yeah, exactly. The indexing. Thank you. So there will be a runtime error here. And the reason why is because of line 15 here. Remember we said, in this case, the index is 0 when, in fact, we said it has to be always what? 1. So in this case, it has to start with i plus 1. Everybody see that? Good, good, good, good, good.

And of course, we have a bunch of practice labs. We have using the data access object project patterns. OK. That would be, again, the next practice lab. Let's go ahead and open for that the Activity Guide. OK.

OK. So let's go ahead. And again, we have a bunch of practices for Lesson 14-2 where we deal with building database application with JDBC. And this one here, again, we have the working with the Derby database and JDBC, which by the way was the one that, again, we discussed earlier, and that was to create a database and populate the database. And then after that, again, you have the detail level, but pretty much you have the summary level. I you think that this information is good enough, then that's good. Otherwise, you will go ahead and look at the detail level where it gives you more information about how to go about doing this practice.

And of course the second one would be using the debt access object pattern. That's where, in this case, you are going to implement the employee DAO JDBC DAO access, which pretty much the implementation of the employee DAO interface. Again, you have the summary level, or you can use the detailed level, which by the way they provide you with a more information to be able to do your practice lab.

So let's go ahead and do these practices or practice labs for Lesson 14. And after, of course, we finish with this, we'll go ahead and get into Lesson 15. Thank you.

## 4. Practice 14-1: Working with the Derby Database and JDBC - 5m

Now that we looked at Lesson 14 that covers building database applications with JDBC, where we looked at defining the layout of JDBC API. We looked at connecting to a database using JDBC drivers, submitting queries and getting results from the database, specifying JDBC [? driver ?] information externally, using transactions with JDBC, using the JDBC for that one rowset provider and rowset factory. And we also looked at using a database access object pattern to decouple data and business methods.

Let's go ahead and look at the practice of this Lesson 14. And we start with, of course, the practice for that one. Where, in this case, we'll go ahead and click on the Services tab, and starting the database, and creating a database table, in that case. So we'll go ahead and look at that.

Under the Services first, we'll go ahead and start the database. And then after that, they're asking us to create a database. That's where we put the information, EmployeeDB. And then, of course, it's already there. So let me go ahead and first, it's already created. And so that's why it's telling me here that it's already there, OK? Because I already created it.

EmployeeDB, and Public, and then here, Tiger, or a password. And to confirm, Tiger here, or a password. But it's already created. We don't have to, again, worry about that.

And then after that, they want us to work with a project called SimpleJDBCExample. Let's just go ahead and take a look at that in the code here. [? Turns ?] out that it has a SimpleJDBCExample.java. So this class, again, in the main method, we get the url, we get the username, and the password. And we invoke here the Select From Select All the Employees.

And here we try a connection. Let me just move this so I can see the whole code. First, we go ahead and get a connection [? bypassing ?] the URL, username and password. And then after that, we'll go ahead and create a statement. And then after that, we'll go ahead and creating [? statement ?] has been working to create a statement on the connection that we've got.

And then after that, execute the query bypassing the query that we wanted, in this case, this would be one. And then we use the While loop here to iterate the result set that we got here on line 26. And grab the ID, the first name, the last name, the birth date, the salary, and print all of that. Print the employee ID, the employee name, the birth date, and the salary. And running it would be just a right-click and [? you're ?] running this file, which is, in this case, straightforward.

And here's, again, a summary. If you want to add a record, you will go ahead and get the query insert into employee value to handle bill, [INAUDIBLE], and then the date of birth, 1950 09/21. Again, execute the update. And if this one has failed, then, in this case, if it's different than one, then we'll print, failed to add a new employee record. And catch an SQLException if there is any SQLException.

So as you see, straightforward code for JDBC and just so that, as an introduction here in this practice, one of Lesson 14 of the JDBC API. And that pretty much ends the practice one of Lesson 14. Thank you.

## 5. Practice 14-2: Using the Data Access Object Pattern - 9m

Let's look now at Practice 2 of Lesson 14 where we are using the Data Access Object pattern. In this practice, you will take the existing Employee DAO Memory implementation and refactor that code to JDBC instead. The solution from the "Exceptions and Assertions" lessons has been named to EmployeeDAOJDBC.

Again, you will need to create an EmployeeDAOJDBC implementation class to replace the EmployeeDAOMemory implementation and modify the EmployeeDAOFactory to return an instance of your new implementation class instead of the memory version. Again, you will not have to alter all the classes. This example illustrates how, again, a well-designed Data Access Object can use an alternate persistence class without significant changes.

Of course, in this case, we'll go ahead and look at the EmployeeTestInteractive class. Here it is. And of course, in this case, this class contains the Main method and provides a console-based user interface. Through this user interface, you will be able to create new records, read all the records, update a record, delete a record from the Employee database. Note how the Main method creates an instance of the Data Access Object.

Again, in the com.example.model package, look at the Employee class. This class is a Plain Old Java Object that encapsulates all the data from a single employee record and the row in the Employee table. Note that there are no set methods in this class, only get methods. Again, of course, once the employee object is created, it cannot be changed. It is immutable.

Expand, again, the package DAO and look at the Employee DAO class, and you would see that the methods and implementation of this interface is expected to implement each of these methods through a DAO exception. Note that this interface extends auto-closeable. Therefore, you will need to provide the Close method to satisfy the contract with auto-closeable.

Look at the EmployeeDAOFactory. You see that this class has one method, getFactory. Again, that returns an instance of the EmployeeDAOMemory implementation. Look at the EmployeeDAOMemory implementation. This class is the workhorse of the DAO pattern. Again, this is the class that the EmployeeDAOJDBCFactory returns as an instance from the createEmployeeDAO method. This is the class that you will replace with the JDBC implementation.

Again, create that EmployeeDAOJDBC implementation, and then, of course, in this case, change this class again to implement EmployeeDAO. Implement the method signature defining the EmployeeDAO. Again, the class must implement all the methods in the interface, because this is a concrete class. Again, add the connection, write the constructor class for that, and open the connection that, like we see here, using the URL, username, and a password, within the Try block, go ahead and, of course, get a connection.

Write method body for the Add method. And as you see here, delete the boilerplate code created the NetBeans and then for the End method. And of course, we'll go ahead and write pretty much all the JDBC code for all the different methods of that DAOJDBC implementation. And we should be able to see this all in the NetBeans. Write the body.

So there are a few methods that we are going to look at. And let's go ahead and pretty much look at all of that. So here we have the-- let's start with the EmployeeDAO. As you see, it extends auto-closeable. We already know about that. The DAOFactory, that's the one that will get us a new instance of the EmployeeDAOJDBC implementation.

And this is the one, actually, where we do most of the work. That's where here, in the constructor, you go ahead and initialize the URL, the username, and a password. [UNINTELLIGIBLE] block, you get the connection with the URL, username, and password. And then the Add method here, you see how now we code it to create a statement and then, of course, get the query, and then execute the Update method by passing the query.

And for the update, it would be the same thing, again. Adding would be inserting in this case. And updating, in this case here, where it pretty much creates a statement, and you have the Update statement here in SQL and execute that.

Delete will be the deleting. So you have, again, in this case, the Delete statement. You have to create a connection and the query delete from the employee where ID is wherever. And then for the Find By, where you do a Select-- so you see here, you createStatement, and then Select, and the invoke the executeQuery and pass the query to it.

And of course, that will give you a result set. [UNINTELLIGIBLE] getAllEmployees, that will be a Select. And as you see here, we use the While loop to, again, iterate through the result set and get the names of the employees and their IDs, first name, last name, birth date, and salary. And here's the Close method that actually allows you to close the connection.

Of course in the EmployeeTestInteractive, that's where, in this case, in the Main method, we create a new instance of the EmployeeDAOFactory, we have a Boolean timeToQuit set to false. We involve the createEmployeeDAO on the factory to get an instance of the DAO. And then, of course, here, we'll go ahead and create a new instance of BufferedReader and invoke the executeMenu method, which, by the way, would be this one here that takes the BufferedReader and EmployeeDAO, and that's where it goes through, of course, in this case, the interface that we already provided when we ran this before.

Again, use the Switch statement. I pretty much code similar to what we've seen earlier when we did this, of course, for the "Exception and Assertion" practices. Here are the inputEmployee that is overloaded three times. We already have seen this earlier. And of course, to run it, you just, in this case, Properties, and then Run, and then it is specifying that, and of course, right-click and run the project.

So this pretty much gives us a very nice idea on how to actually implement the DAO that makes use of JDBC. And that's the one that replaced the EmployeeDAOMemory implementation that we've seen earlier. So you see that the code right now is easily changeable to, actually, instead of working with the memory persistence, now we have a database persistence using JDBC API. That pretty much ends this practice. Thank you.
