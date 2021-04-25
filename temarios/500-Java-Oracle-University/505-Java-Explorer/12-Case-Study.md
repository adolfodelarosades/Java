# 12. Case Study

## 01. Overview 3m

Java Basics, Capstone Case Study. This capstone case study is not just a step-by-step exercise as you saw in the lessons in the course. Rather, the intent is to recreate a real-world programming assignment. We give you the basic specifications in an open-ended way and challenge you to use what you've learned in the Java Basics course to analyze the requirements and design and implement a working solution.

This programming challenge is slightly larger than you experienced in the exercises. You'll need to think about the solution, review the course content, and even augment that with additional research and study as needed. We think that by taking on and conquering this challenge, you will gain a deeper understanding of Java, and it will also point you to other areas you might want to investigate more fully. And the Java Learning Subscription has the courseware to supplement that study.

As you have seen, the Java programming language provides a robust application programming interface, API, that helps you write your applications. In this case study, you will write an API that others could use to develop a human resource application. These classes form the basis of what we call domain or business classes, classes that provide functionality that support the problem domain and business with business logic and rules as opposed to utility classes, like string or the Java collection classes, which provide utilitarian functionality that is not business or domain specific.

For this case study, you will analyze, design, and implement two classes, Employee and Department. The Employee class holds information on employees, and the Department class has information on a department and a collection of employees for that department.

Now, you might be wondering, how did we pick Employee and Department? Or maybe you're not wondering that. But we picked it because, if you've been around Oracle at all in the past, you may recall that many of the database examples used in documentation and training use emp and dep, employee and department. This has been the classic example used for decades to illustrate a one-to-many relationship.

In this case, one department may have many employees assigned to it, and each employee is assigned to one and only one department. We decided to continue this illustrious tradition here. We will go into the specifications and requirements in more detail in the following recordings.

When you test, you will test with another class that will have a main method. This is a very common way to test domain and business classes, which do not have main methods themselves, as they're intended to be used from within an already running application. This is what we call a test harness. So the third class will contain the main method, which will then instantiate and test and work with your employee and department classes.

## 02. Methodology 5m

Case study methodology. Here we'll present a set of steps and hints and tips to get you going writing the application. Read through the description until you feel you have a good understanding of what is being asked. Begin to design the department and employee classes. Start by asking what fields and methods will they have.

Create the project in NetBeans and the HRApp class with the main method. Test that it compiles and runs and prints an initial message. Then create the Employee class and add fields and methods you feel confident about. Test creating and printing instances of the employees from the main method.

Create the department class. And you'll do this iteratively and incrementally, adding new methods as you need them to code and test. Start with the methods you feel most comfortable with and get those working first. Then turn to the more difficult methods. Use the recorded solution only as a last resort if you get stuck. All the code needed to solve this case study has already been presented in one form or another in the actual course materials. Feel free also to research on the web to get help if you need it.

All right. Let's look at the employee class in more detail. Each employee has an int identification number, a string name, and a double salary. You will encapsulate all the fields and provide getter and setter methods for each. You'll initialize these fields with a constructor.

You'll override the toString method to print these fields. For the department class, you'll create additional fields as needed as you write methods to process the department data. All fields must be private. Your program must not crash as a result of calling these methods.

Create a private employee array field inside of a department to store all the employee objects for that department. The department should have a capacity of 10 employees. Now, in a real application, it would be much larger than that, but for this purpose, that's fine. Provide a method to add an employee to the department. Ensure the number of employees does not exceed the department's capacity.

Provide a method to return an array of employees in the department. This array must not contain null values. And provide a method to return the number of employees currently in the department. Continuing with the department class, you'll need to provide a method to identify an employee based on our identification number. You basically want to search for it. Return the employee object if it exists. Provide a method that returns a total salary of all employees in the department and provide a method that returns the average salary of the employees in that department.

Now, the HRApp class will contain a single main method, and this is where you'll test the API that you've written. This includes testing for scenarios where the code may be vulnerable to crashing. Create a print statement to say the application is starting so you know the application starts and then create a new department object.

Call toString to print the information about the department. Create a few employee objects and add them to the department. Locate an employee by their identification number. Call toString to print the information about this employee. Get every employee in the department and print their information. So you're going to loop through all the employees in the little collection. Print the total salary for that department and print the average salary for that department.

Your program output should look something like this. It will print HRApp Starts when the application starts. It'll print out the information on that department then loop through the collection of employees in that department, retrieving each employee and printing out the detail for that employee. Then it will print the total salary and the average salary. We haven't really seen how to format numbers yet, so don't worry about all the decimal places.

Again, we suggest that you do your best to try to write the code little by little, test, write some more code, test, write some more code until you get this all working. Now, if you're really stuck or you don't know how to proceed, that's fine. There are solutions for this, and we've recorded the solution. And it can be educational watching that as well.

## 03. Grading Rubric 6m

 
The grading rubric. In this practice, you're asked to develop an API for creating a human resource application. And we've assigned point values for the case study so you can grade yourself on how you did. We told you what features your code must implement, but the final decision on how to implement this functionality is your decision.

Use this grading rubric to assess your decision-making. Now, this is a self-assessment only. You will not submit this for actual grading. It does outline point values associated with each feature and scenarios your code should be capable of handling.

Now, by going through this, it actually gives hints to how to write the code. So we, again, really suggest that you make every effort to read the requirements in the previous videos and solve the problem first. Only come back to the rubric afterwards to check your work or if you get seriously stuck and need hints.

The point values-- there is 100 point values total. The Employee class is worth 19 points. The Department class is worth 78 points, and the HRApp class is worth 3 points. Now, no written solution is provided. There is an accompanying video where you can watch the solution being created. You're strongly encouraged to attempt to solve the problem yourself before looking at the video.

The video has breakpoints within it at logical sections to allow you to pause it, try to solve the problem for yourself before watching the solution. So when we recorded this, that's how we did it. We said, OK, this is what you're going to do. We give you some hints, give you a chance to try to write it yourself, and then we go on and show the actual solution or one possible solution.

The Employee class is worth 19 points. You give yourself 1 point for creating a private field that represents an employee's ID number as an int, 1 point for a private field that represents an employee's name as a string, 1 point for a private field that represents an employee salary as a double, 5 points for a public constructor that accepts all three arguments and sets the initial values of each field, 3 points for a public setter method for each field, so a setter method for the identification number, name, and salary, 3 points for a public getter method for each field. It accepts no arguments, and it returns the data for that specific item. So there is a get method for identification number, get for name, and get for salary. 5 points for a public toString method that overrides the version inherited from the object class. It accepts no arguments. It returns a string which is a concatenation of all employee field values.

The grading rubric for the department class. The department class is worth 78 points-- 1 point for a private field that represents the department name as a string, 5 points for public constructor that accepts one argument and sets the initial values for the department name, 1 point for a public setter method that exists for the name field that accepts one argument and has a void return type, 1 point for a public getter method that exists for the name field that accepts no arguments and has a string return type, 5 points for a public toString method that overrides the version inherited from the object class. It accepts no arguments and returns a string, which is the name field value. And 5 points for a private field that stores an employee array.

However, there's more. There are 5 more points for a public method that adds employees to the employee array. It accepts one argument for an employee object and has a void return type. 5 points-- this method prevents the number of employees from exceeding the capacity of the department, which is the capacity of the employees array. 5 points for a public method that returns an array of all employees in the department. It accepts no arguments and has an employee array return type.

5 points to write this method to return a new array that contains no null values. This is done by looping through the Employee array field to spot the null values. So as you see here, some of these methods get a little bit more complex, and there are more points for it. So as you add more complexity and more sophistication to it and more intelligence, you get more points.

5 points for a public method that returns the number of non-null elements in the Employee array. This method accepts no arguments and has an int return type. 5 points for a public method that returns an employee object based on an identification number. The method accepts one int argument and has an employee return type. It loops through the Employee array, trying to find the correct match, basically searching for the employee. When it finds it, it stops and returns the employee.

5 points so that a NullPointerException does not crash the program when no matching employee is found. 5 points for a public method that loops through the Employee array field to return the total salary. It accepts no arguments and returns a double. And 5 points to make sure the program does not crash when there are no employees in the Employee array field.

5 points for a public method that returns the average salary within the department. It accepts no arguments and returns a double. And an additional 5 points if this method does not recalculate the total salary. Instead, it calls an existing method to get this data. And 5 points that the program does not crash when there are no employees in the Employee array field.

Lastly for the HR class, it's worth 3 points. You get 3 points for the class to contain a single main method, which is used for testing your API. Good luck.

## 04. Case Study Demo 27m

 
This is the solution to the Java basics capstone case study. In this case study, you will create an API for a human resources program. You'll create classes to model an employee and a department. And the methodology is to read through this description until you feel you have a good understanding of what is being asked then begin to design your Department and Employee classes, what fields and methods will they have. Then when you're ready, create the project in NetBeans and create an HRApp class with a main method and test that it compiles and runs and prints the initial message.

So we're going to go off and do that. So we're going to go over to NetBeans. And I'm going to create a new project by going to File, New Project. And this will be a Java with Ant Project of type Java Application. Or the category is Java with Ant, project is Java Application. Click Next.

Call this HRApp. And I'm going to call it HR app case study to distinguish it from the other one I have. Now, you'll see it's actually putting a package name on the front, and this is kind of an oddity about NetBeans. But it will create the class-- and I'm just going to call it HRApp, not hr case study for the class name-- click Finish, and it creates a project for me and creates the HRApp class.

But notice that the package is not correct. So we're going to change the package name. We prefer to use periods rather than underscores. I'm going to right-click, and I'm going to go to Refactor, Rename. And we'll change that to hrapp.case.study. There we go.

It doesn't like the periods, I think. We'll just change it to hrapp. There we go. And that'll be fine. All right. So there we go.

So there's a hrapp. And now what I want to do is put in a system println to let the know the program is starting. So I'll do System.out.println. And we'll say "HRApp Starts." And then right-click the green Run button or right-click and select Run. And it runs.

OK. So when I get started, I like just doing it with app starts so I know the app compiles, it runs, it starts. And now I'm ready to do the rest. Let's go back and see what's next.

All right. So I've got the NetBeans application project, and the HRApp class, and the main method. Now I'm going to create an Employee class and add fields and methods that I feel confident about. So to do that, I'm going to come over here to HRApp, right-click, and select New Java Class. And we're going to call this Employee and click Finish.

OK, there's Employee. And it said that we want-- Employees have, let's see, an int ID number, a string name, and a double salary. So everything should be private-- int ID, private string name, and private double salary. Double-check, string name, double salary.

OK. And we want to encapsulate all the fields and provide getters and setters. All right, easy enough. Remember, all we have to do to access our getters and setters is right-click, select Insert Code, select Getter and Setter, choose everything in the Employee, click Encapsulate Fields, and click Generate. Great, so there's only getters and setters, yay.

And next up was initialize the fields with a constructor. So we're going to add a constructor that takes all three fields. So we right-click again, Insert Code, Constructor. And we want all three. And we'll click Select All and click Generate. Bing, and there's my constructor. All done.

And we want to override the toString method to print these fields. ToString method has a signature of-- or is written public String-- that's not actually part of the signature. But toString, that's part of the signature. That's the method name.

And it's going to take no arguments, and it's going to return a string. And we're going to return the ID, the name, et cetera. So we're going to say quote, "Employee" plus-- and I call my own getters and setters. So I'm going to call getName plus, let's see, quote space quote plus get-- let's do getID first-- getID, getName, getSalary.

By the way, as a trick, if I had done this dot, it would have shown me all the methods within this class. I just don't like using this if I don't have to. As I said, that's a pet peeve of mine. But that concatenate the ID, the name, and the salary, there we go, and returns it.

And let's see. And we override the toString method, OK. So let's go back to our methodology and see-- it says, now create the Employee class, add the fields, and then test creating and printing an instance of Employee from the main method. OK.

So what that's going to look like is going back to the main method and creating a new Employee object. So create an Employee object e1 is equal to new Employee. And we have to give it a ID. So we'll give it 230 as the ID. And we need to it a name, Jerry. And we'll give it a salary, 333998.

There we go. All right, semicolon. And that should work. And then I should be able to do System.out.println Employee. And now we call e1. It should call e1 toString automatically for me. Let's run it, see what we get.

Yep, there we go-- "Emp Employee 230 Jerry," and it's all correct. Wonderful. OK, so that works. Let's do one more. Of course, make that e2. And we'll say 420 and Gracie and, there we go, something close. All right. And then we do e1, and we do that again with e2.

Again, this is a nice way to check your work, make sure things are working the way you expect, and that your methods are working the way you expect. And there's the two Employees and it's correct. OK. Wonderful. Good, good, good.

All right. So at that point, we now have completed step four and step five. We're now ready to start on the Department class. I'm going to pause, and I'll resume in a moment. And you can go work on the Department class and come back if you need to check your work.

OK. Now that you've rejoined us, we're going to create the Department class. Now, the Department class is more complex than the Employee class. We'll start by creating the private fields. So we're going to create a private Employee, and then we'll also create the Employee array field.

Now, Department has-- let's see, where is the department detail? Department class-- that's not it. Where is it? I'm missing it. Oh, so Department has a unique name which can be retrieved, and it has an array of Employees. OK, pretty straightforward.

So now we're here. And we're going under Department. So we're going to create the private name, and we need a private array of Employees. So over the NetBeans we go. And we go here to create the-- first we're going to create the class. So right-click on the package, New, Java Class. And this is going to be Department.

And we'll click Finish. There's my Department class. And we want a private string name. And we want a private Employee array. Employee array-- there is the array called emps-- is equal to new Employee array of 10. OK. So far so good.

All right. So we created the private array to store all the Employees. Provide a method to add an Employee to the Department. Now, let's go and do the accessors first. So I know I'm going to need one for name, to set and get the name for the Department.

So let's do that, because it doesn't specifically say it, but everything else has to do with adding Employees and all. But we do need to do the basic data field. So we need the one for name. So I'm going to go ahead, come up here, and I'm going to right-click and say-- select Insert Code.

We'll start with Getter and Setter. Not emps right now, although we can, but we're going to do it differently. I'm just going to choose name, encapsulation, click Generate. There's my name. And I'm going to pick up the constructor now as well.

Seems like things have frozen a bit. Be right back with you. OK, it seems to have unfrozen. So now I'll go ahead and put my constructor in. Right-click, select Insert Code, select Constructor.

And we'll take a constructor that just takes the one name field. Click Generate. All right. So now when we create a compartment, we can pass in the name, and it'll set the name for the Department.

All right. Next up, create a private Employee array-- we did that. Provide a method to add an Employee to the Department. Ensure the number of Employees does not exceed the Department's capacity. OK so let's take a look at how that's going to work.

OK, I've added some code to make this work. So I've added the method addEmp. And it's going to take an Employee to add an Employee in. Now, the way this works-- and actually, I should change my names here. So I'm going to change that to employees so it'll match. There we go.

All right. Now, way this works is we're going to use the lastAddedEmployeeIndex to indicate the position in the array of the last Employee who was added. Since we haven't added anything yet and the first one we add will be at position 0, we'll set it to negative 1 initially, because the code to add the Employee says, is the lastAddedEmployeeIndex less than the length of the Employee array?

Let's say the Employee array was 2. If lastAddedEmployeeIndex was 0, we could add 1. If it was 1, we could add 1. But it was 2, 2 is not less than the length of the array, and therefore it would not be true. So as long as we have more room in the array, we can go ahead and use the index.

So if the lastAddedEmployeeIndex is less than the length of the array, and we're still within the bounds of the array, increment it, and then use it to simply assign the Employee that we were passed into that position in the employees array. So we increment the lastAddedEmployeeIndex and add an Employee to this position in the employees array.

When adding a new Employee to the employees array, consider the length of the array. You can simply stop adding extra Employees once you've reached your Employee array capacity. So that's our add employee method.

Now, provide a method, return array of all Employees in the Department. And this array must not contain null values. OK, let's take a look at how that's done.

OK. So getEmployees, first of all, is public, returns an array of Employees-- that's a valid return type-- and we call it getEmployees. The idea is we're going to create a new array called actualEmployees, and we're going to set up that array to be the size of Employee plus-- whatever the last employee index was plus 1.

So let's say the lastAddedEmployeeIndex has gotten to 0-- so we added something at 0 and we added something at 1-- so lastAddedEmployeeIndex would actually be at 1. And so we would actually create a new array of one element-- well, plus 1.

So lastAddedEmployeeIndex would be at 1. Plus 1 is 2. We've created an array with two elements, because that is true. Even though the employees array is provisioned to be or set up to be 10 elements and a bunch of them are nulls, only two have valid values, let's say. We're going to set up an array just to mirror those two.

Then in a loop, we're going to loop through the array, and we're going to start with i is equal to 0, because i would be the first element in the array, inside the employees array. We want to say, go up until the actualEmployees.length, so whatever the length of the actualEmployees array is. In this case, it would be 2 in my example. Then we're going to increment i when we get to the bottom of loop. We take employees of i and assign to actualEmployees of i.

So imagine two arrays, and we're just copying values from one array to the other as we loop through. If the employees array had two valid values in it, then the actualEmployees would be of size 2, and we copy employees sub 0 into actualEmployees sub 0, and employees sub 1 into actualEmployees index of 1. And that would populate the array, and then that's what we return back. And now we have an array of the actual elements.

OK. Next up, provide-- we did that. Array must not contain null values, it doesn't. Provide a method to return the number of Employees currently in the Department. Think about how you do that, and then we'll return in a moment and see the solution.

OK. So how do we get the Employee count? Well, the variable called lastAddedEmployeeIndex indicates the last valid-- couple of typos there-- last valid position in the employees array. Because the array indexing starts at 0, you have to add one more to get the number of elements.

So in other words, if your lastAddedEmployeeIndex had a value of 1, you've added something at position 0 and position 1, there are two elements but the lastAddedEmployeeIndex value itself is 1. So if you're going to return the Employee count, you have to add 1 to it. So if we added to employees, lastAddedEmployeeIndex count is 1. But by adding 1 to it, it gets to 2, and now we know that the correct getEmployeeCount is 2. And that's it.

All right. Next up, provide a method to identify an Employee based on their identification number. Return the Employee object if it exists. So we're going to search through a loop through the employees array looking for an Employee whose ID matches the one that we pass in. Think about how we would do that. And then I'm going to pause, and we'll come back and see the solution.

OK. So here's our getEmployeeByID. It's public. It's going to pass back an object of type Employee. And it's called getEmployeeByID, and it takes an int empId. Now, there's two ways to do this. Basically, we're going to loop through the employees array, iterating with emp as our iterator, asking, is the current emp's ID equal to the empId that we passed in? If it's equal, then we just return the Employee and we're done.

Now, another way to do it is, you could also say if they're equal, then set the result equal to Employee-- create a result variable and set result equal to Employee and then call break. And that'll break out of the loop and simply return result. Now, in this way of doing it result is null. You set it initially, because of course you haven't searched yet, so of course the result would be null. Before you start searching, you don't have a result yet.

You set up a for-each loop to loop through Employees, getting back emp as the iterator, and then an emp.getId is equal equal to empId. If true, result then is pointing to the emp that we currently have, and we break out and return result. But you could just as easily just say return the Employee when you're done.

Now, some of this is stylistic I've been taught at times in programming that you want to return from one place in a method if possible, which this would allow. We're always going to return at the bottom. We're going to set up the return variable and then just pass it back. Or in something simple like this, simply return when we find the Employee. If you go all the way through the loop and don't find it, then you'd be returning a null.

Two different ways. One is not necessarily better than the other. I would probably code it with the break and just have a single return at the bottom. I tend to want to do that if I can without making things more complex. So we have now successfully coded the getEmployeeByID method.

The next method is go get a total salary of all Employees and then an average salary of Employees. Think about how you would do that. We're going to loop through the array of Employees inside Department, and we're going to sum up the salary, and that'll give us our total salary. We also need a count of the Employees to be able to divide the total salary by the count to get the average.

Think about that, and we'll be back in a moment. Here we see that we have a getTotalSalary method. It's public, returns a double. And here's the method name, getTotalSalary. Because employees array may be partially filled with values-- you might have some nulls that you haven't replaced yet. You created an array of elements but only put two Employees in, the others are now null. We need to stop at the end. We start at position 0, this must be the first one, and we'll stop at the element indicated by lastAddedEmployeeIndex.

So let's say we have two Employees added. And lastAddedEmployeeIndex started at negative 1 and went to 0 for the first one, then it went to 1 for the second one. So right now, lastAddedEmployeeIndex is the correct index for the highest index.

So we created double totalSalary. And we're going to loop for int i equal 0 while i is less than the lastAddedEmployeeIndex. As soon as it becomes equal to it, we stop. Then i plus plus. TotalSalary plus equals employee of i dot getSalary.

So i starts at 0, we get the salary for the first Employee, add it into totalSalary. Then we go to the next, i becomes 1. Right now, lastAddedEmployeeIndex, let's say, is 1. So i is equal to 1, i less than lastAddedEmployeeIndex.

So let's see. In this case, it would be 1. And 1 is not less than 1, so we would not get the totalSalary. I think that is actually not correct. I think you need one more than that. We'll play with it and see. I think you need the lastAddedEmployeeIndex plus 1.

Because lastAddedEmployeeIndex will tell you the index where it is added to either less than or equal to. We'll try both ways and see. I think that's actually a typo on my part. Now, average salary is to calculate-- the average salary, we should take the-- if the lastAddedEmployeeIndex is greater than negative 1, meaning we actually have an Employee, then we can get the total salary, which will call this method, and divide by lastAddedEmployeeIndex plus 1.

All right. That's pretty much the end of it. So we need to now create a new Department, which I'll do. And the Department will be Education. All right. So there is the first Department. And now we're adding our first Employee.

Notice when I do dot, it brings up the addEmployee method. And that wants an Employee object, so I can put e1 in. I want that for the first one. And we'll do it again-- addEmployee and e2.

All right. Let's see if it runs. So far it looks good. And we're printing out the two Employees. I'm going to move this down here. And now let's loop. Let's get back the array from the Department. We can use the getEmployees.

So we'll say Employee emps-- Employee array, rather, emps-- is equal to dept dot-- and there should be a get-- where is it-- getEmployees. There we go. So that returns me the employees array.

And now we can loop through it. So I should be able to do for, and there will be an Employee called emp. It's looping through the array called emps. So here's my block.

And what I should be able to do is just move these lines of code up and do a formatting real quick. So now I should be able to do-- it should be emp. And I should not need the second one. All right. Let's see what we've got.

Yeah, looks good. Two Employees, and there we go. Let's do a third one, just to make sure it does work-- dot addEmp. And we'll actually create one inline here. So I'll do new Employee, which we can do. If we don't need an actual reference to it-- which we don't, because it's in the array-- I'll just say new Employee, and this will be 772, Jack, and here we go, semicolon, and-- what did I do? Add, not app-- addEmp, there we go.

And then I should be able-- so now if we do it and run it, let's see what we've got. We should see three of them. And we do. That all works correctly. OK, so that's good.

Now, what we haven't done yet is we haven't gotten the total salary. Let's try that. And we should be able to just do department dot and do getTotalSalary. And does it run? It does. And where's my total? Is the total correct? Total doesn't look like it's correct.

I think it's because it's only picking up the first one. So I think-- oh, wait. Actually, let me move that outside of this. So let's do that. We don't want to print it each time. I don't think that's correct. So let's change the code a little bit.

I was thinking you have to do index plus greater-- less than or equal to. Let's see if that fixes the problem. I'm not sure. OK, I've got to take a look at it. That might actually be correct, actually, come to think of it.

So I think that helped a little bit. Let's go back and see if that change really made a difference. So what was that? 3729819. All right. Let's run this again. Yeah. So the other was 3729819, which is not correct, so this code is off by a little bit.

And again, how did I know it was off? Well, just logically if we start at 0, and we've got two Employees in there, and lastAddedEmployeeIndex is 1, and it stops when it gets to 1, we can't get that very last employee index. So common thing is either do-- I would do less than or equal to. Or you could also do plus plus, but that's not a good thing to do, is actually changing the actual test variable you're looking at. It's better to test the-- change a relational operator.

OK. Last one is to then also print the average salary. So we'll do this, copy this, and getAverageSalary. And how did we do? Looks about right.

OK. Three of them, looks all right. Yeah, that's right. OK. So with that, we have actually solved the problem. We created the Employee class with fairly simple getters and setters. And we-- I don't know if we did a toString, though. Did we do toString? I forget. Let's see.

OK. I think we need a toString for Department. I don't think I did that. So we'll go in and do a toString for Department. I don't think I have that. If we look in the list over here-- oh, there is a toString. And there it is.

Oh. So right now, it's just Department plus name. And let's see. That's not the right class. So here we are in Department. And in this one I don't have a toString. OK. So I'm going to add the toString method. And say return.

And we can just return, you know, just return the Department name. That would be fine. OK. So with that then, we've solved the problem. That's the end of the exercise.

We have being able to create the Department class and the Employee class. We created the HRApp. We have our main method. We're creating Employees, we're creating the Department, we're adding the Employees to the Department. We're getting the Employee array back.

I didn't do the search. I didn't test the search. But that would work as well. If I came in here and if I did getEmployeeByID, we should get an Employee back. So if I were to do something like emp-- and we're going to say a plus-- and actually, you can do dept dot, and I can do it all right there in the method.

Don't always do this, but in this case I am. GetEmployeeByID, we'll put in 420. And if we run this, we should find somebody. And we did. There's Gracie, so it's right. I got a little typo there, but-- so that works.

So the getEmployeeByID works. And if we use an ID that's not there-- oh, look at that. No pointer exception. OK. So if we try to go after Employee that doesn't exist, it's not working correctly. And so in this case, if we're saying if Employee ID is equal equal-- now, problem arises is, what if we go past the number of Employees that there are?

So this is going to loop through the entire array. However, if you get to a point where you have Employees in the array that are nulls, which is what happened, then the call won't work. So the way to fix this-- and it's a little bit more complicated-- is to test the thing to see if it's null first.

So for example, if I did if emp equal equal-- I would say, emp not equal to null-- if emp is not equal to null, then go ahead and do your if statement. And if you reformat this, if employee not equal to null, then if emp.getID equals employee ID, return employee. Let's see if that fixes the problem.

And it does. Employee null. So that's one thing we're missing. So we didn't put that IN but I wanted to show you how that would work. And again, this is a very common situation. It's also the reason why when we were creating the array we made sure we passed back-- we created a new array of just the actual Employees. Remember, we checked the length and made sure there's an actual Employee object there.

Here, if you're iterating through a collection and you could have nulls in it, you do have to test to see if a specific instance you're looking at is null. And if it's not, then you can go ahead and use it.

All right. And with that, that completes the exercise and solution. Hope you enjoyed it, and hope you enjoyed the class, and wish you good luck in your Java programming. Thank you.
