# 9: Java I/O Fundamentals

1. Java I/O Fundamentals - 4m

## 1. Java I/O Fundamentals - 4m

Section 8, Java I/O fundamentals. Question. Can you complete the code using the classes FileInputStream, FileOutputStream, FileReader, FileWriter, BufferedReader, BufferedWriter, and PrintWriter? So the following excerpt has four methods that do the same thing, copies one file to another.

Answer. So there's many ways to copy a file. You could use FileInputStream and FileOutputStream, FileReader and FileWriter, wrap a FileReader and a FileWriter with a BufferedReader and a BufferedWriter, respectively. And wrapping the same FileReader and FileWriter with a BufferedReader and a PrintWriter. Notice copyfil4, the method, it copies a file by line rather than by a character by integer, as in the previous copy file methods.

Question. What two things are wrong with the following code? It uses the same Produce class as we've seen before. Answer. Two things. First thing is the Produce class is not serializable. In order for you to save an instance of a class, that class must implement the serializable interface. And all you have to do is add implement serializable to the class.

Two, the code will throw a null pointer exception when it tries to print the password because the password member is transient. So let's see the sample code again. And note that password is defined as transient. So what happens is that when the code saves an instance of the customer, it will not save the contents of password because it's transient. So when me look at the output, and it tries to print the contents of password, we get an exception, null point exception, because no value was stored for this member.

Here's a summary of the classes we've seen in Java I/O fundamentals. Byte streams, InputStream, OutputStream, FileInputStream, FileOutputStream; character streams, Reader, Writer, FileReader, and FileWriter; buffered streams, BufferedInputSream, BufferedOutputStream, BufferedReader, BufferedWriter; formatting, PrintWriter and PrintStream; and object streams, ObjectInputStream and ObjectOutputStream.
