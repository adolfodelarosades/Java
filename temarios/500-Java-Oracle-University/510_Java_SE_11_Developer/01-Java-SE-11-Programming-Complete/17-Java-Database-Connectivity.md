# 17: Java Database Connectivity

1. Java Database Connectivity, Part 1 16m
2. Java Database Connectivity, Part 2 20m

## 1. Java Database Connectivity, Part 1 16m

Let's take a look at Java Database Connectivity. In this lesson, we're looking at a Java Database Connectivity-- JDBC-- API structure. What is it doing? How do we use it to manage database connections, execute SQL statements, process query results, manage transactions?

But also because JDBC is designed to work with different databases, it's designed to work with whatever database, really. So when you are connecting to a certain database, how do you know what it is and what it's capable of? For that, you need to be able to discover database metadata, interpret that, and also to be able to dynamically discover information about the structure of the query results, so you can dynamically adapt to the way you're processing queries.

Right. Well, let's take a look. So we start with a general sort of overview of the place and role of Java Database Connectivity. JDBC API provides us with an interface to interact with databases. On one side of the connection, JDBC driver will manage the connectivity with a database using native database protocol, whatever it is. It depends on which database you're connecting to.

On the other side, the JDBC driver gives you a standard interface through which you interact with the driver. That standard interface is described by a Java SQL package. The Java SQL package contains a list of interfaces that describe how you work with whatever database. Driver is a set of classes that basically implements these interfaces.

And you'll have a driver per database type. So you've got an Oracle driver. You've got a Derby driver. You've got a Db2 driver. You've got an mSQL driver or whatever, depending on which database you want to connect to. So the job of the driver is to basically provide database-specific native protocol implementation, but you won't really need to know that, because your code will be written against the interface's written part of the Java SQL package.

You code to the interface type. And then that interface, implemented by the driver, will be physically provisioning you the connectivity with these or the other database type. The driver will handle that for you.

So to be able to select which particular driver you'd like to use, you need to make sure the driver, first-- the actual JAR file archives that contain the driver-- are in your class path-- or a module path if you're using modular deployment. So you place the driver archives into the module class path. And then within a program, you select which driver you would like to use by using JDBC URL.

So the JDBC URL starts with the protocol, which is JDBC. Then the type of driver-- for example, provider of that driver is Oracle or provider of the driver is Derby-- it's just another database-- so which particular provider you're using-- some providers give us variants of drivers. For example, Derby doesn't really do that, but Oracle does. Oracle has several different variants of how exactly would you like to connect to the database. And a most commonly-used variant is called Thin, Thin driver.

Anyway, and then there is the identity of where the databases-- what's it called, which host, which port it's on. That part, the connection details part, may vary, because it depends upon which provider, which driver, you're using. What is the database? It depends. But that's generally the syntax of the JDBC URL. You're selecting which provider you're using. You're selecting the driver. And you're telling it where is your database, basically, where do you want it to connect to.

Of course, nodes here contain information about an older style of load and JDBC drivering, earlier versions of Java. There was a slightly different mechanism, but you can find it in Notes. Now, your application logic can then interact with the JDBC API and eventually get down to the level of the database through that JDBC API. However, there is another layer of code, which we actually don't discuss in this course at all.

And that layer of code is called JPA-- Java Persistence API. Now, that is an automation on top of JDBC, basically. So JPA allows you to map Java objects to your database tables and interact with your Java objects. And then, the JPA API will translate these into the actual JDBC underlining statements. So you would not be writing the JDBC low level code. You will be interacting with JPA objects-- just normal job objects, basically. And then these interactions will be translated into the actual actions against your database. So you'll be able to query data, save data, but you won't need to actually write low level JDBC code, because JPA can shield you from that.

Well, that is covered in another course, Developing Applications for the Java EE7 Platform, if you're interested in the that-- in the JPA. And it's a great automation, but on this particular course, we are looking at sort of the basics. We're just looking at what if we don't use JPA, then how do we deal with JDBC directly.

I suppose it may also give us some insight as to what JPA does for us. If you understand the JDBC API, then in the future, you'll probably better understand exactly the type of automations JPA performs for you. OK, well, what is the structure of JDBC API? So this is the stuff you'll find in java.sql package, right?

There is a class called Driver Manager. And from that class, you can actually obtain your database connection. From the connection, you can obtain statements. You can create and prepare statements.

The three types of statements you could define-- there's a basic SQL statement, there's a prepared SQL statement, and there's a callable statement. EDs recommended to use prepared and callable statements. It's highly not advisable to use basic statements. So prepared and callable are much more advisable. Callable statements are used to invoke stored procedures or functions. Prepared statements, pretty much for everything else.

If a statement that you are executing-- statement, prepared statement, whatever-- if a statement that you are executing happens to be a select statement, a query, then it returns a ResultSet, which is a representation of a set of records that is a result of your query. So you can process the ResultSet. You can step through the records and do things about the results of the query.

All of these objects implement AutoCloseable interface. So actually, you can use a try-with-parameters block, because it will create implicit finally. If you don't, if you create your own finally block, you really, really have to close this. Also, it's important to understand that the closure order is absolutely important. If you are closing these objects, you must manually. If you write in your own finally block, and you're manually closing that-- so you're calling results that close, statement close, connection close-- if you do that, you must close results at first, statement second, and connection third. You mustn't do it the other way around.

Why? Because you won't get any errors. If you just close the connection, from the Java point of view, everything will be fine. You close the connection, fine. OK. But the database never received a notification to close cursors and flush the cache. So the database will have dangling resources. The fact that you close the connection in a Java program doesn't mean that your database performed the appropriate cleanup. Closing a results set and closing a statement isn't just something that you do locally in your machine. You're actually signaling to the database as well so that the counterpart, the server side, will also release resources.

So if you forget to do it in appropriate order, then you will really annoy your database administrator, because you will be eating into the database resources without closing them properly. Although, seemingly, within your Java program, everything may look just fine, but the new database [INAUDIBLE] won't be. So please make sure you're actually closing them in the reverse order. So if you open connection first, you prepare statements, you execute a query, then you first close the ResultSet, then close the statement, then you close the connection. That is very important.

And then finally, all of these different actions may throw you SQLExceptions, which just-- really just one of many Java exception types. It's a checked exception. You're supposed to catch it or explicitly throw it to the caller, but eventually, I guess, catch it somewhere. In addition to your normal Java exception-handling stuff, like error message and these sort of things, you also have an additional couple of methods that are called getSQLState and getErrorCode, which indicate the SQL state and error code of the database. So that translates the database error information into the Java world.

So that's your API structure. Now let's take a look at how to actually do these steps. So we start with obtaining the connection. You prepare JDBC URL, and here are a couple of examples-- a URL that goes towards the Derby database, a URL that goes towards Oracle database. Derby is a very basic Java database that can be embedded inside a Java program. It's really kind of minimalistic. It's really, really basic.

Anyway, if you're using pre-JDBC 4 driver, there's an extra step. And it's notes how to actually load the driver first. But if you're using post-JDBC 4 drivers, which in this course we certainly are, then you just do that URL. And that's that. You don't need any extra steps.

You may identify your user and their password with the database. And then you use DriverManager class, getConnection method. And you pass these URL, username, password. And you connect to the database. That initializes and obtains a connection for you.

So there you go. Connection object is initialized. Now what? Now we use that connection object to actually execute some statements. So you've got different types of statements. As I say, there's basic statement, there's prepared, and there's callable statement. And it's generally recommended you use prepared and callable statements.

But before we get there, before we get to prepared and callable statements, let's just take a quick look at the basic statement first. So connection.createStatement-- that gets you a basic statement. Then you describe what you want the statement to do. And it could be a query, insert, a date, delete, whatever-- just any SQL, whatever you like. It's a string-- just text, really. And notice-- it's important-- notice that you're actually concatenating parameter values right into the string.

OK. Then you decide how would you like to execute that statement. You can execute the statement using the method executeQuery. That returns your ResultSet object, which represents the records returned by the query. If the statement is not a select statement but anything else-- and it doesn't matter what it is, update, delete, whatever-- doesn't matter-- insert. For all other actions except select, you use method executeUpdate. And that returns the integer number of rows affected by the statement, how many actual records were affected.

If you want to, you may use a generic method called execute which returns your Boolean true if that statement happened to be a query, false if it happened to be anything else but the query. It's sort of date, delete, create, alt, drop, whatever. So if it is a query, you get a ResultSet. And then you decide to process that. And if it's not a query, you can get the UpdateCount, how many records are affected by the statement.

So that was the basic statement. However, you're highly recommended to use prepared statement instead. Notice the crucial difference. Prepared statement is not concatenating parameters. Prepared statement is using parameters as substitution parameters. So you have these question marks where the parameter positions are.

You prepare the statement beforehand-- connection.prepareStatement. Specify what these statements should be. And then before you execute the statement, you supply parameters. There are two styles in which you can do it. There is one style which is setObject, parameter position, variable you want to put into that parameter, what value do you want to put in, and the parameter type.

Notice that parameter positions are indexed from one, not from zero. I know. Everywhere else in Java, the zero-based indexes are used. But in JDBC API, one-based indexes are used. That's just life. That's historical reasons, whatever. So first parameter, first question mark, is actually position one rather than position zero. It's slightly odd, I know.

Alternatively, instead of setObject method, which allows you to qualify the value and the type, you could use this set and then the type method. In which case you qualify what position then value. You don't need to qualify the type, because the type is essentially qualified by which method you are using. setBigDecimal, [? setInt, ?] set [INAUDIBLE], setDate, whatever you need. So these are the other alternative approaches, really. And then you can execute your statement, executeQuery, or executeUpdate or use generic execute. Just as we discussed on a previous page, there's not much difference here at all.

## 2. Java Database Connectivity, Part 2 20m

OK, now, what about callable statement? Well, that is what you do if you want to invoke stored procedures or functions. So you describe the way you want to call whatever store procedure or function. Again, you can use-- this question mark says your parameters. You prepare a call. Then you register.

Here's an interesting one. Which one of these question marks, if any, is an output parameter? So for example, this could be what your function returns. So you're saying, oh, OK, well, the first question mark, suppose that's you output parameter. And then you say, what type should I expect?

When I call that store procedure, it should return me VARCHAR. Fine. And then you set up values for input parameters. You can use the style of setObject, parameter, index, parameter value, parameter type. Or you can use the style of set specific type, version method, yes, a date whatever, position and value. It's up to you, whichever way you want to do it.

OK, so you could set values. You can register output parameters. Then you execute the code. Execute that call. And then you get whatever you described as an output parameter, you get it back. Again, you can say, get me object on a given position, expect certain type. Or you could just say, get me string, for example, and then qualify the position. And so that's how you execute callable statements.

Now, let's assume that your statement is a query. So you are executing the statement. It happens to be a select statement. So you're doing this execute query. And you getting resultSet. You're getting resultSet. So you set up your parameters, you execute the query, you get resultSet. Fine.

Then you can step through the resultSet using method next, which does two things. It checks if the next record actually exists. Because you may have a situation where query returns no records at all. Or you may have a situation when query returns certain number of records, but then sooner or later, you run to the end of the result.

So how do you know you don't have any more records? Well, the next method will return you false if that's the case. What else next method does, it actually fetches the next record. It moves a marker to the next record. So within that while loop, in every duration, so long as the method next returns you true, the marker will be moving from one record to another, to another, to another. That's the logic.

So doing this next method call, and then you can retrieve values from your record. There are, again, several ways in which you can do it. You can do the getObject-- which implies that you need to specify position and type-- or name of the attribute from a query and type. It works either way you want. So you can use positions or names. Or if you don't want to use getObject method, you can say, use getInt or getString. But again, you specify the position or the name of the column you're trying to retrieve. So column names here are ID name. Position starts from 1, not from 0, just like parameters. Please note that.

OK, so that is a forward only style of behavior. That's the default behavior. There are apparently other options. But by default, the query will be processed in this forward only style. So that's kind of it. That's how you form statements and that's how you process the results.

Now, at this stage, I would like to highlight the reason why basic statement is something that you are advised not to use. Any you're advised to actually use prepared statement instead. So if we go back a couple of pages, we'll look at the difference between prepared statement and a basic statement. We notice that prepared statement uses these question marks, substitution parameters. And the basic statement doesn't. It uses concatenations.

So with a basic statement, you have to concatenate values in before you execute the query. You don't have a phase of actually setting parameters. So that basically means that a query is recreated physically as the entire string is recreated, reparsed, and recompiled every time you specify different parameters and you proceed to the execution.

With the callable or prepared statements, that's not the case. You prepare the statement first. It's parsed, compiled, and validated before you even set any parameter values at all. So by the time you set these parameters, these parameters are treated as pure values. They are not treated as part of a statement, as such, which means that you're preventing code injections. There is a problem called SQL injection.

What if the text concatenation that contains the parameter value, as you use in a basic statement, what if that value of the parameter actually contains the next sequence statement? What if the user, instead of typing somebody's product price or something, what if they type the entire SQL statement there? Then because it will be concatenated into the string, passed, and compiled, it will appear that it will just execute an injected statement. So that's the security hole of massive proportions.

The substitution parameters used by prepared or callable statements avoid the problem, because the statement is precompiled beforehand and a value will not be treated as another SQL statement. So there you go. It actually safer. And mind you, the prepared statement or callable statement is compiled earlier, and you only specify parameter values later. So again, there's a performance advantage here.

All right, so we approach the part of this presentation where we have some understanding of how we connect, how we create statements, and how we actually execute them, how we process query results, for example. What about transactions? What if you want to actually control transactions? Well, you find out the JDBC driver, by default, is in the AutoCommit mode. Every time you execute the statement, your JDBC connection automatically commits.

Well, you may wish to change that behavior. And to change that behavior all you need to do is set out to AutoCommit faults. Tell the connection, don't commit automatically. Fine. In which case you may decide, oh, I want to play some savepoint, and I can actually roll back the savepoints. Or I just want to commit the transaction or just want to roll back the transaction. You control it now. It does not automatically try to commit after every statement execution. By default, it does. So I suppose, if you have a problem like an exception of something, then you can roll back.

OK, this is a really important point. If you perform normal connection closure, if you just do connection close, like in [INAUDIBLE] block for example, even if you turn AutoCommit off, even if you turn AutoCommit of, if you did not explicitly roll back, if you just proceeded to close in the connection, the database will assume you want to commit, because you didn't end up with terminated connection with exception. You ended up with correctly closed connection.

So the environment around your program has no reason to suspect something is wrong. The database will think, oh, well, everything is fine and the commit will happen. So probably you want to be mindful about it. And when you come to the point when you close the connection, just make sure you know what you want to do. You can explicitly commit or you can explicitly roll back depending on circumstances. Don't leave it to chance. That's what I'm trying to say, I suppose.

When you connect to the database, you may wish to discover what your database is capable of. Because so far, except one place in a program, which is the JDBC URL itself, which is really just a string, nowhere else did you really write any code that's database-specific. Yet you can write code that's database-specific.

What if I want to write some SQL statement that only works in, say, Oracle database or only works in MS SQL database. So yeah, sure, why not? You may wish to do that. But in order to do that, you have to first check where are you connected to, which database, what it's capable of. So you wouldn't do something that a database does not support.

So for that, connection object gives you the method getMetaData, which returns your DatabaseMetadataObject, which has dozens of methods, lots and lots of methods that tell you what the database supports, what the database is capable of. Here's a small subset of these methods, just some examples. Like what's the database name and version? What are supported SQL keywords? Does this database support auto joins? Does it support safe points, et cetera, et cetera? So there's lots and lots of methods you can dynamically interrogate your database and find out what it can do and how does it actually work.

Likewise, you've got an ability to interrogate the resultSet object. When you run an SQL statement as a query, you've already noticed that you can form these queries dynamically, because they're just strings. So you can dynamically form an SQL statement. You prepare it, then substitute parameters, and off you go.

But the question is, if you dynamically form an SQL statement, then how do you know how many columns you've got, what are the column names, what are the column types? Well, there you go-- metadata. ResultSetMetaData object, you could find out column counter for every column. You could find out its name, its type. So now you can write code that will dynamically adopt to the structure and nature of your query, even if you form the SQL statement on fly.

OK, now remember we were talking about a resultSet, and we said that, by default, resultSet reversal direction is forward only. We mentioned that. Well apparently, you can change it. You can make it not just forward only. And there are some other things you can change in a behavior of resultSet. So these results are type, which determines the resultSet traversal order.

And also, there's one more thing the resultSet type does. It will determine the way in which the changes in the underlying database are reflected in the resultSet. Let me put it this way. Imagine you run a query on a table. So you execute a SELECT statement. You're getting your records back. And whilst that is happening, in the database, some other transaction just modified a record, and committed it. So another transaction made some changes and committed these changes.

Question-- should you see that record? Should you see the change? Or should you see the state of the record as it was at the beginning of your query, rather than the state of the record that emerged after your query already started? Now we're not talking about looking at uncommitted changes.

No, no, no, we're looking at changes that were committed by the transactions. Still, the question remains-- which state of that record set would you like to observe? And different databases can work out that question differently. It depends on the database type. But it also depends on what type of resultSet behavior would you like to qualify. So you have some control over it.

Then there is another question, which is the resultSet concurrency. Do you want to be able to update records in that resultSet, updatability of these records? So to be decided. And finally, resultSet holdability-- if I get the resultSet, if I get records, mm-hmm, and then I do some actions, and then I can commit, does the commit automatically cause the resultSet to close or not? Again, it depends on the database.

Some databases can do retention of results that overcommit. Other databases can't. They can't retain it. But again, if the database can retain it, do you want to enable that? Don't you want to enable that? So you can play around with that. This is something you can set on a statement level for prepared or generic statement. So these are the parameters you can set. [? Fallen ?] pages explain these options in a little bit more detail.

So let's take a look. This is a resultSet type. ResultSet type by default is forward only. So that basically means that the only method that will work is the method next. Also, the reflection of changes in the aligned data source will be database-specific. So if another transaction changes records and commits them whilst you're going through the set of records, whenever you would see these records changed, or you'd see records as they were at the beginning of your query, will depend upon which database you are connected to. So some databases could do it one way. Other databases could do it another way.

If you set the resultSet type to be scroll insensitive or scroll sensitive, then you enable, in addition to method next, other methods, such as previous, well, next, first, last, absolute, and relative. So you'll be able to go forward and backward in that resultSet and navigate around roles. Insensitive option will basically ask the resultSet to present you the data set without reflecting changes that were occurring in the underlying database. And scroll sensitive version will ask you to present resultSet which does reflect changes that occurred in the underlying database.

To find out if your database actually supports these options, you should call DatabaseMetaData.supportsRestultSetType method, because then it will tell you what the database does. You would know if it supports these regimes. The default option works with any database. But then these other options, well, that depends. So you can check the resultSet type support for that database.

ResultSet concurrency, that's pretty straightforward. It could be concurrent read-only or concurrent updatable. If it's concurrent read-only, which is default, then you just get records. You're not supposed to update them. If it's concurrent updatable, then you get the resultSet objects, and you can actually change them. So that's the idea.

ResultSet holdability, that controls the retention of a cursor or closure of a cursor across the commit. So if you're committing if your resultSet stays open or not. So possible values hold cursors over commit or close cursors at commit. The default behavior is database-dependent. It depends. Some databases may, by default, hold curses over commit. Some databases may close cursors by default upon commit.

How do you know what your database is doing? Ask DatabaseMetaData object. They will tell you, So you could find that out by requesting that information from the metadata. And it will tell you what the database would support.

These are fairly advanced sort of tuning topics. But then again, they're practical. Because I guess, quite often, you would want to write code in the JDBC that exploits database-specific features for performance reasons, tuning reasons.

And yes, otherwise JDBC code is kind of portable across any database in the world. But then you wouldn't take-- if you would not consider these features, then you won't be able to take advantage of performance or enhancements that a particular database would provide. The code will work across databases, but it will work in kind of a vanilla way, whilst these options allow you to customize it a little bit more.

All right, well, that's the end of this presentation, where we've observed what the JDBC protocol generally does, how it can manage different database connections, execute different SQL statements, process query results, manage transactions, discover metadata, and we know why it's important now, and also customize the query result processing. That's pretty much it. I guess from here onwards, the things to look forward to is to study further automations on top of the JDBC, such as JPA, which we've mentioned earlier in this lesson.
