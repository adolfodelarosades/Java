# 3: Encapsulation and Subclassing

1. Encapsulation and Subclassing - 27m
2. Practice 3-1: Creating Subclasses - 27m
3. Skill Check: Using Encapsulation and Subclassing - Score 80% or higher to pass

## 1. Encapsulation and Subclassing - 27m

All right. Welcome back. In this particular chapter, we want to talk about encapsulation and subclassing. Now before we go to the slides, let's talk a little bit about what does that mean from an application standpoint.

In our previous application, we created an employee class. In that class, we created four public fields. Emp ID, name, SSN, and salary. We didn't really create any methods that went outside of these.

Now when we talk about encapsulation, the idea is that we want to keep as much information hidden inside of our class as possible. And in fact, we would like to make it such that our class is as immutable as possible. And we'll be talking about that in the slides.

Now one of the problems that we have currently with this class is that we created these fields as public. Now, what does that mean? Well, let's think about this.

In my application, I'm going to create instances of employees that I'm apparently going to work with, right? Now once I create an instance of an employee, how often do you think I'm going to change that employee's employee ID? Well, probably never, right? Once an employee has an employee ID, we're probably not going to change it.

Well, by making this public, think about this. That means that any developer out here can access my class and could set the employee ID, not only because I have a setter method, but because I've made this public. So there's nothing that says I can't say emp ID equals 6. So that's one potential problem.

The other problem, however, is there's nothing to prevent me from setting the employee ID equal to. Actually, that wouldn't work so hot, but this one would. All right. Any integer number would work for the employee ID, including a negative number.

Well, usually when we're creating employees, we expect that there is going to be a limited range of employees that there are going to be and they're probably going to be a positive number. The problem is though is that in my class if I make something as a public field, I have to accept any value that is valid for that particular type. In this case, plus or minus 2 billion or so.

Same thing with the string. If we went through this class, we could think about how often is somebody going to change their name. Well, if someone got married or whatever, it's possible that their name might change. But how often is their social security number going to change? Well, probably never.

And same thing with a salary. It's hopeful that most companies will increase salaries, but probably won't decrease them. So maybe I want to expose the salaries slightly different than just getting it or setting it. So that's a couple of things that we might think about.

And so if we were going to create this class, we would probably say, hey, let's make these private, meaning that they are only available from within the class. I can't do this anymore. But the other thing is that it allows me-- if I do it this way-- it allows me to validate what it is that I'm passing in and if this isn't an appropriate value for what I'm expecting, it rejects it.

And so in this case, I might have all of my getters, so I'd still want probably get emp ID, get name, get SSN, get salary. That's possible.

But from a method standpoint, we've already indicated that, well, once we have the employee ID, we probably don't want to change that. And so we probably want to-- we might say, well, let's set the name. And well, salary, let's say that we want to raise the salary. But in every other case, we really don't want to change the values once they are set.

Now how is that going to work? Well, we can write these methods. So the getters and setters that we currently have probably don't work as well as we would like. So we can work on that.

But if I can't set the employee ID or the social security number through these methods, then what's left? Well, in that case, I might want to make sure that I have a constructor that allows me to path in the ID, the name, the social security number, and the salary right upfront so that when I create an instance of it, it automatically has that information for me. And then at that point, my class is as immutable as possible.

Users of the class cannot set these fields directly. They can only do the class what I have identified for it to do. For example, I might even validate on the set name to make sure that something is being passed in or in the raise salary that, perhaps, it's a positive number. But I can validate to make sure that this is exactly what I expect my program to do. And then I can create a constructor that allows me to do these things really well.

Well, this is known as the principle of encapsulation, the hiding of both information and of implementation. Now in addition, this particular chapter is about subclassing. So let's say that I have another class in this chapter. We're going to be looking at, well, how could I use inheritance?

Well, let's say that I have a manager. And every manager also has an employee ID. They have a name. They have a social security number. They have a salary.

But in addition, they will have a department that they manage. So let's call it dept name for the lack of any other idea. And a manager is probably not going to change departments, at least in our program. So let's just say we will allow the ability for us to access that information. And perhaps, we also want a constructor that allows us to create the instance of manager.

So in this case, we would represent this in a class diagram by representing that manager is going to extend employee. What that means is-- what this notation means here is that the manager class is going to have everything that you see here. The only thing that is not extended are the constructors. When you have a constructor, you have to create your own here.

And so in this particular case, we now have a manager class. It has most of the functionality of employee plus some. This is the principle of subclass. So in this case, this would be known as my super class. And this would be my subclass.

You'll notice that the relationship here is this is a more general version. This is a more specific version. And in this case, by using subclasses, I could also create other employee types. So I might have full-time employee, part-time employee, admin, engineer, whatever. And regardless of what implementation I need for those specific employee types, they would still have this functionality.

So that's kind of what we're going to be talking about in this particular chapter. So let's take a look at the slides.

So the principle of encapsulation is one of the four fundamental object-oriented programming concepts. Three of which we're going to be talking about in great detail in this class. Of course, in this case, we're talking about inheritance from the subclassing. We're also going to be talking about encapsulation. The other two would be polymorphism that we will be talking about in the next chapter, and the principle of abstraction, which is, in most cases, subsumed in the concept of an encapsulation.

Well, what do I mean? Well, an abstraction basically says that I only am interested in what is important to the use of my application. So in the previous example on the board, we were basically saying that I don't want to change the employee ID. I don't want to change the social security number.

And so in those cases, that functionality is not important to our program so we don't include it. That's abstraction. So in the case of abstraction, we're only going to present functionality that is important to the use of our program. Now the term encapsulation means to enclose and encapsule or to wrap something around an object to cover it.

So in the case here, I performed encapsulation in a number of ways. First of all, I marked all of the fields as private. Now private means that I can only access them within the class itself. They are not accessible from outside of the class.

And so on the board when we were saying we could set the employee ID directly, by making it private it prevents that from happening. In addition though, encapsulate means that I'm going to have some means of implementation. Now from a generic standpoint, we would call that an interface.

For example, I travel a lot and weirdly enough no matter where I go, no matter what car I happen to get for my rental car, I can drive them. Why? Well, because when I get down behind the steering wheel, there is a wheel. There is a dashboard that gives me information that remarkably is similar between no matter what model or make that we're talking about. And the pedal arrangement on the floor is generally the same.

The radio? That's another matter. But the fact is is that that is my interface. To me the driver, I've got a steering wheel, I've got an accelerator pedal, I've got a brake pedal, and that would be what I interact with.

Now what goes on behind the firewall can be completely different. It could be a diesel. It could be a rotary. It could be a V8, a V6, a V12. It could be any number of things.

Well, that's the principle of encapsulation in a nutshell is it doesn't matter what the implementation is. What matters is the interface that I work with. And in the case of our classes, what it is that developers of our class will be able to interact with. In this case, the methods.

So methods are the functions in Java. They provide an explicit service to the user or the object, but they hide the implementation. So as long as the service-- as long as that interface doesn't change, it doesn't impact our applications whatsoever. And as we go further on in this class, you're going to find that we will change implementations in a couple of places. But because we don't change the actual interface, our applications just continue to work.

So with that in mind, here's the example that I used on the board. I have the four fields that allow me and I will create them as private. And in this case, well, instead of set name, we're going to change name and raise salary. That's the functionality I want to expose.

And so to do that, there's a couple of steps. Now on the whiteboard, I identified that if you represent something as public it is universally available. And if you represent a field as public then that means that you have no control over either the accessing of that information or the setting of that information.

If I wanted to make something inaccessible, if I marked it public, I just can't. There's no control over that. On the other hand, if I mark it as private, no one except the instance of the class has access to that information. So the private keyword can also be applied to a method to hide implementation detail. So you could create a helper method, for example.

Now so like I said, there's a couple of steps to encapsulation, most of which I talked about on the whiteboard. But step one is to mark your fields as private. And so later on, if I tried to set directly any of these fields, the compiler would not allow me to do it because at that point, it would be an illegal operation. So that's step one.

Step two would be that I would remove any setters that aren't ones that I expose. So in our example, we're going to get rid of the set social security number and set employee ID. Step three is we're going to change the names to something that is more applicable to our application. So in the case of change name or raise salary, it makes more sense in the context of an employee to have methods with this name than set name, set salary because that's not really what we would be doing.

And then finally, we would create a constructor that allows us to create the instance upfront, pass in the appropriate ID, name, social security number, and salary. So notice the syntax. Public employee. So my constructor has the same name as the class.

I'm passing in four different variables. And I'm going to use those variables to set our private fields. Now in order to separate the arguments in the constructor from the fields that are declared in the class, I'm going to use the this keyword, which allows me to obtain the instance of that. And then, of course, I'm going to implement change name, implement raise salary at which point, we've pretty much done what we need to do to make our-- let's go the other way-- to make our class as immutable as possible.

In other words, we want to make sure that other developers can only use our class the way we designed it to be used. Having been a developer for 30 years, I know that it is very possible to use things in ways that they really weren't designed to be used. So as a developer, you really don't want that.

Now we've also talked about the best practices of naming. We did that in that chapter 2. And so when we have the fields, we've talked about setter methods. We can allow other classes, et cetera to change it.

Now the two best practices are to hide as much or as many of the implementation details as possible, but also name the method in a way that clearly identifies what it will be used to do. So in this case, we're basically saying, OK, we want to change our employee class so that it has a more appropriate named method, but doesn't have methods that we're not going to use.

So in a nutshell, the benefits. Protects an object from unwanted access by clients. Prevents assigning undesired values. We can validate using encapsulation. And we can also change the implementation without modifying the client interface whatsoever. We'll see that as we go forward.

Now concept two that we also talked about is this idea of a subclass. So for instance, we talked about the manager class. And I basically said hey, let's say that the manager class also has an emp ID, a name, a social security number, a salary, and a department name and, of course, a constructor, et cetera. Well, wait a minute.

This looks really close to the code we've already created. So the question is, why would I want to create the same code over and over and over in other classes? And then the second question that I'd want to ask is, is a manager an employee? If the manager has the same implementation and functionality, or at least similar to another class and there is a relationship between them that one is a more specific type of the other, then that's when we can implement this idea of a subclass.

So rather than writing the manager, we can do similar to what I was talking about before where the employee class can be my parent class or my super class, and the manager can become my subclass or the child class. So in this case, notice that my syntax would use the extends keyword. And as soon as I declared public class manager extends employee, then the manager class would have all of the fields, all of the methods that are available in the employee class, all the functionality if you will. And then all I have to do is write the code that goes beyond what is in the employee class.

So I would have to identify a constructor in the manager class. And I would have to get the accessor for the department name. So with that, like I said, a subclass inherits all of the methods and fields from a parent class. It does not inherit the constructors.

So there are two ways that you can do this. You can either write your own, which is what we're going to do, or you can use a default constructor. Now the default constructor is the one that has no arguments that we saw before. And if you do not provide a constructor, it will be provided for you.

But as soon as you create even a single constructor in the class then no other default constructor will be provided. You have to write it yourself. And so to work with this, in the constructor I do have to access the parent class. So in order to do that, I would use the super keyword.

Now the super keyword simply calls the constructor of the parent and so it would take the same arguments as the parent. So in this case, and. Then I would add whatever other methods are there.

Now to construct it, notice that I would declare it just like I would any other object, call the constructor. And in this case, instead of passing in the four fields of the employee, I pass in the five fields, which means the manager would still have the raise salary. It would have the change name. But in addition, it would have the additional accessor to the department name.

Now the last principle we want to talk about-- this is actually dealing more with polymorphism, which we will be focusing on much more in the next chapter-- is this idea of overloading methods. Now overloading has nothing to do with subclassing. You can overload methods in any class. But what it simply means is that you have multiple methods that have the same name. However, the rule is that while the method name is exactly the same, the arguments between methods of the same name have to be different.

Now they can be different in two different ways. They can be different because of a different number of variables that we're passing or because I'm passing a different data type. So the example that we see on the screen here follows that second one where the first print passes in an integer. The second print passes in a float. The third one passes in a string.

This is perfectly acceptable because in this case the argument list does differ. However, the other thing that you need to know is that the return types, they can be different because the compiler is looking at this part of the method signature. The name of the method and the arguments. It does not look at the return type.

And so if you look at this, we have the same number of arguments of the same type. The argument list is not different. And look at it from a compiler standpoint.

In this case, how does it tell the difference between the two to be able to return nothing or to return a string. It really can't. And so that's why this is illegal. You can't do it this way.

So the idea of an overloaded method is just simply so that I can provide additional functionality and additional flexibility for developers to use the method in the way that where they have information. Well, I can also overload a constructor. And so overloaded constructor is called based on the parameters specified when you pass new.

So for instance, let's say I have a class called box. Well, if I say box B equals new box and I pass no parameters, it would go ahead and pass or call this constructor. And so I would have a box with height, width, and length all equal to 1.

On the other hand, if I passed in a number of box then it's going to use this constructor in which the height, width, and length are going to all be the same length, but it's going to be based on the value that is passed in. On the other hand, if I pass in three values then it would call this constructor. So this is an example of overloading a constructor where as long as the number or the data type of the arguments are different, it's perfectly acceptable.

Now a couple of other things that we want to talk about. Well, actually, one thing in this chapter. And that is that Java is a single inheritance language. Some other languages allow to extend multiple classes to comprise a single class. Java does not allow that.

So in this case, for example, if I have employee and manager, the manager can only extend the employee class. It cannot extend other classes. And so in this particular slide, we're seeing that the manager can extend employee, but if I then want to add more to the manager I can create a director class that extends manager.

On the other hand, my admin and my engineer over here directly extend the employee class. And so this recaps all of the information that we would need to know or we should have known about encapsulation and subclassing just to make sure there we're all on the same sheet of music. And so this concludes chapter 3.

## 2. Practice 3-1: Creating Subclasses - 27m

All right. In Practice 3, it basically wants us to create a number of subclasses to get familiar with this. So we're going to create subclasses of employee, including Manager, Engineer, Administrator or Admin, and we're also going to create a subclass of Manager called Director. And then we're going to create a [? S ?] class.

Well, if you still have the previous practice's project up, you could use that if you want. However, in the task, it does say to open a new project, go to the labs file, and open up the Practice 1. In this case, however, I'm just going to go ahead and open up the employee class that I already have. And I'm going to take out some of the comments here.

Now remember, in the lab, we talked about a number of different things. And we said that the first step of creating any encapsulated class is that we want to make sure that the fields are private. So I'm going to go ahead and do that.

We have a constructor here already, and I'm not going to worry too much about that at this moment. But we said that we wanted all of the getters that we had before, but then we're going to eliminate some of the setters. So we don't want the set Employee and we don't want the set Social security. number anymore.

But we did want to have two setters still, but we wanted this to be called changeName and raiseSalary. So it looks like so far we are doing well, but that also means that, of course, we need an employee ID. So in this case, we're going to-- let me go ahead and take a look at where we're supposed to be.

So we're going to go ahead and create an int, which we'll call EmpID. We're going to pass in a string for Name. We're going to have a string for Social Security number, and pass in a double for salary.

Now because we use the same argument names that we have for field names, it is always a best practice that we can identify that we want to use the field using this. And then we're going to use the local variable or the local argument EmpID. So we'll go ahead and keep working with this.

And so what that means when I create an instance of Employee, it's going to automatically fill in the fields with the appropriate values, and the getters allow me to access those values easily, but I will only be able to change and raise the salary. So in this case, for the changeName, it doesn't look like we're going to-- at least in this practice-- we're not going to add in any additional. But in the case of the raiseSalary, we're going to add whatever is passed in to the current salary. Now in addition, it looks like they want us to create a method that is going to allow us to print out information about the employee, so we're going to go ahead and call this printEmployee. Employee Take no arguments, but we are going to pass in some values.

Now in this case, it looks like we're doing a lot of system outs. And so rather than having to redo that, we can do the same thing that we had before, but we can just use the same printf what we used in the previous example as well. So does this work? Well, it doesn't exactly work because if you notice that, before, we had an instance, where now we don't. But since we are in the same class, we don't need an instance because each of these will access the appropriate field just by simply calling them.

All right, so at this point, we now have a print employee that will output the appropriate pieces of information for us. But it looks like in this case we're going to, for the getSalary, we're going to do a little bit of fanciness. Instead of passing a number here-- so where before I had to format it by using my float, in this case, we're actually going to format it before we pass it in.

So how do we do that? Well, we're going to use a number format. Yeah, one of those. We're going to use a number format, and we're going to call the number format's classes getCurrency. There we go-- getCurrencyInstance method. And we're going to pass to that method.

Once we have that method, we're going to pass a format. And in this case, we're going to format the use of a double. So we're going to pull the salary, convert it to a editable, format it as currency, and then pass that as a string to our method. And so that should allow us to be able to print out the employee.

It's going to ask us to resolve any missing import statements. Let's see if we have any. Apparently not, because it went ahead and inserted the number format when I did my Control-Spacebar when I set it up here.

So in that case, I'm going to go ahead, save our employee.java file. And now I want to create a Manager. Now the Manager is pretty straightforward. We're going to create a new Java class, call it Manager. It looks like it's going to go in the same package, so we'll go ahead and finish.

And in this case, to get the exact same functionality that we just had in Manager, we're going to go ahead and say extends Employee. Now the reason it has this red squiggly is because there's a constructor in the Employee. You also have to have a constructor in Manager.

So we're going to go ahead and add that. So public Manager. And in this case, we are going to pass in the EmpID. We're going to pass in the name. We're going to pass in the Social Security number, the salary, and we're also going to pass in a string as the department name.

Now it's still complaining simply because at this point, because I've extended it, I do have to call SUPER. It has to be the first thing that goes in here. And so in this case, I'm going to pass the employee ID.

I'm going to pass in the name, going to pass in the Social Security number, and I'm going to pass in the salary as my call to SUPER. And then I'm also-- looks like I want to create a getter for department name. So in this case, before we do that, let's go ahead and create a private field called department name.

Going to go ahead and add in my getter here. So I now have a department name. And so at this point, I will set the this.deptName equal to the one that was passed in.

And so now my Manager class has been properly extended and has also been encapsulated. So we'll save that. So far, so good.

We're also going to create two additional subclasses of employee-- Engineer an Admin. But it doesn't look like based on the lab that we're going to do much with them other than create them. So I'm going to go ahead, create a Java class called Engineer. And Engineer extends Employee and of course, I have to have a constructor.

In this case, we're only going to pass the appropriate information. And we pretty much have our Engineer. And we will do the same thing with the Admin class.

So pretty much the same thing that we've done a couple of times now. Stop that. All right, so we have our-- it always is helpful if you don't add additional things to it. So we now have our two subclasses, Engineer and Admin.

And then it says we also want to create a subclass of Manager called Director. And we're going to put it in the same package, so we can do that. So new class, Director.

All right, now in this case, the Director-- instead of extending Employee-- is going to extend Manager. Now in this case, we still have to have the same information passed in, so we'll create that first. But they also want us to add an additional constructor for, looks like, Budget.

So there's our field. Now in this case, SUPER does require the five. And then, of course, we can add the Budget. And that gives us our current director.

And then it says that we need a getter for the Budget, so let's go ahead and insert that code. And that is our Director class. So now we have employees, we have managers that have departments. Now we have directors that are managers that have a budget. All right, so that kind of gives us around that.

And so now we want a Test class. Now in the Employee Test before, notice that because we changed the Employee to be encapsulated, we no longer have this setEmpID or this setSocialSecurityNumber, so all of this no longer is valid-- or at least much of it. And notice that the constructor is also no longer valid because now we're creating something else.

So in this case, we're going to create-- let's see, we're going to create an instance of Jane Smith, same as before. But now, notice that I can just pass this information as part of the constructor. So I've got an instance of that. Apparently, I want to an instance of Manager. And in this case, pass in Employee.

All right, so now we have created-- what doesn't it like? Can't find the symbol. Well, that's because in my import, I don't have that. So like I said, makes sense for us to include each of these as we go.

All right, so I also want to create an instance of an Admin, so let's go ahead and do that as well. And I'm assuming I'm going to be doing the others, so I might as well add those in. All right, so at this point, it's showing that those have not been used, but we'll take care of that in a second.

So if we have an Admin-- notice that I can do an Admin the same as I would a Employee. And we also want to create a Director. And this is a double, so we'll pass that in.

All right, so the next step in the lab says to delete the print line statements to display the details of it. And the reason we can do that, of course, is that because our Employee object now has this as a method. So we can eliminate that. And so all we're going to do is we're going to-- let's see, we're going to have our-- I guess the first one's supposed to be an Engineer.

In that case, let's make-- and what's the method? We want to print the Employee and Manager. Print the Employee. And Admin, print the Employee. And Director, print the Employee.

All right, so that will print out each of the employees one at a time. In addition, they're asking us optionally to use the raiseSalary and setName methods on some of your objects to make sure these methods work. So all right, let's identify that we are going to-- and so, we're going to do a-- come on.

I want to changeName. That's what it's called. So in this case, we'll give Barbara a hyphenated name, and we'll raise her salary while she's at it. She's doing a great job. And then we'll print it out again.

All right, so if we save this, we should be able to test to make sure this is working. Now for some reason, it doesn't like my Engineer, so let's see what's going on. It's not public in Engineer. Well, let's go back to Engineer and see what we've got.

Well, absolutely right. Now later on, we're going to talk about the default accesser, which is what that was using. But the problem is is because it wasn't public, it was not visible outside of the same package. Now in this case, notice that as soon as I made it public, it went away.

So all right, good. Everything else seems to be liking what we've got. So let's go ahead and see if this works. So I'm going to go ahead and run it, and then I'm going to run it from here. So I'll just run the file.

All right, well, except for the fact that it would be really nice if this had an extra line feed after each one, notice what I've got my Employee, my Employee, my Employee, my Employee. We verified the setter method, and now we have Barbara Johnson-Smythe-- same Social Security number, but now her salary is $10,000 more. And that's exactly what they asked us to do.

Now it says, optionally, improve the look of the salary print output by using the number function class. Well, I already did that one, and did that one. Add additional business logic to your Employee class. So it says that, basically, at the end, we can prevent a negative number.

So we don't want a negative salary in our raiseSalary field. So in this case, for example, we can say if salary greater than or equal to-- well, greater than. It did say "greather than." So greater than 0, then we'll go ahead and execute it. Otherwise, if the salary is 0 or less, it won't run.

And what else does it want us to do? Prevent a null or empty value for the setName. Well, once again, from a validation standpoint, this makes sense. So I can check to see if name is equivalent to nothing or my name is equivalent to null.

Let's see. If it's nothing, then I don't want this to happen, right? So in this case, I would want the negative. Let's say, I want this here, this here.

So in this case, if the name is not equal to null or not equal to an empty string, then it will go ahead and work. In addition, it would've been nice for the prints to have an additional line feed, so I'm going to add that here. Let's just do one more test to make sure that everything's working the way we expect it to. So in this case, it indeed is. And that concludes Practice 3.

## 3. Skill Check: Using Encapsulation and Subclassing - Score 80% or higher to pass

Skill Check: Using Encapsulation and Subclassing

View Skill Check
