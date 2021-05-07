# 12: Building Database Applications with JDBC

1. Building Database Applications with JDBC - 5m

## 1. Building Database Applications with JDBC - 5m

As I said before, Java DB does not have an S-Q-L or SQL create database command. To load a JDBC 4.0 driver, you call the DriverManage.getConnection method. You don't have to specify it with a method class for a name, as with earlier versions of this driver.

Question-- given inventory, how would you create a table populated with data from inventory.txt and then print its contents? And you've seen the contents of inventory.txt before.

Answer-- let's see what this code is doing. It first takes a connection object, which was created previously. With the connection object it creates a statement object. Note that this statement object is created within a try-with-resources statement. That means the statement object will be closed at the end of this code. So you don't have to close it yourself.

Next, it invokes Execute Update to create a produce table with a SQL statement specified in a string create. Then it calls files Read All Lines from the Java file I/O to read inventory.txt-- then it invokes Execute Update Again to add each line from inventory.txt to the table. Last, it creates a results set to retrieve the contents of produce in order to print them out.

Question-- how do you reduce each of the prices in the PRODUCE table by 50%? Answer-- the code looks very similar to the previous code. We create a Statement object from the connection object Con. Then we use a ResultSet to retrieve the contents of a table. However, when we create a statement object, we have to specify two attributes in order for us to be able to update the contents of a ResultSet.

First is the type of the ResultSet, and we're specifying here TYPE_SCROLL_SENSITIVE. This means the result can be scrolled. It's cursor can move both forwards and backwards. And the ResultSet reflects changes made to the underlining data source while the ResultSet remains open. And we specify the concurrency level. In this case, it's CONCUR_UPDATABLE. That means the ResultSet object can be updated using the ResultSet interface.

There are three different ResultSet types. TYPE_FORWARD_ONLY-- this is the default. The ResultSet cannot be scrolled. Its cursor moves forward only from before the first row to after the last row. TYPE_SCROLL_SENSITIVE-- the result can be scrolled. Its cursor can move both forwards and backwards. And the ResultSet reflects changes made to the underlying data source while the ResultSet remains open. And last, TYPE_SCROLL_INSENSITIVE-- the ResultSet can be scrolled. Its cursor can move both forward and backward. In general, the ResultSet does not reflect changes made to the underlying data source while the ResultSet is open.

There are two concurrency levels-- CONCUR_READ_ONLY, which is a default-- the ResultSet object cannot be updated using the ResultSet interface; and CONCUR_UPDATABLE-- the ResultSet object can be updated using the ResultSet interface.

So here's a summary of the classes we've seen for building database applications with JDBC-- Connection, DriverManager, Statement and ResultSet.
