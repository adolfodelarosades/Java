# 4: Java Class Design

1. Java Class Design, Part 1 - 16m
2. Java Class Design, Part 2 - 22m
3. Java Class Design, Part 3 - 31m
4. Practice 4-1: Overriding Methods and Applying Polymorphism - 10m

## 1. Java Class Design, Part 1 - 16m

All right folks. So let's go ahead and now and look at Lesson 4, which related to the Java class design. Well, after to the completion of this session, hopefully we should be able to use access levels, private, protected, default, and public, override methods, overload constructors and other methods appropriately, make use of the instanceof operator. If you remember, we discussed that earlier in the morning. And I said we'll get to see it again in polymorphism.

So we're going to look at the instanceof operator to compare object types. We're going to make use of the virtual method invocation and use the upward and downward casts. We will also look at overriding methods from the Object class to improve the functionality of your particular class that you are implementing.

So first, let's go ahead and start by looking at access control. So we've seen so far, by the way, the public and private. Again, there are four access levels that can be applied to data fields and methods. And in this particular table, we want to look at the access to a field or methods marked, of course, with the access modifier in the left column. So if you take a look at this and you will see folks that, for private, only the methods that belong to the same class can actually access that either private field or private method.

The default, which by the way, means nothing. You have no modifiers. That typically means that all the methods that belong to your class can access the fields or the methods, and of course with the default modifier, or the methods that belong to the same package. OK? So again, methods that belong to a class with the same package also have access to your default fields and methods.

For protected, on the other hand, if we take a look at this, you will see that for protected it means that all the methods that belong in the same class can access your protected fields or methods. Or all of the methods, in this case, that belong to classes in the same package also have access to the you're protected, in this case, fields and methods, of course, or subclasses in other packages. OK? So what we've saying here, folks, is that the protected keyword is applied to keep access within the package and subclasses. And of course fields and methods that use protectors are said to be subclass friendly.

And adding, again here we put an asterisk down next to the yes here under the subclass in another package. What it means is we put a note about it where we said protected access is extended to subclasses that reside in a package different from the class that owns the protected feature. So as a result, protected fields or methods are actually more accessible than the ones marked with default, which makes sense, as you see here. OK? In default, only those methods that are in the same class or in the same package can access, in this case, your fields and, of course, your default fields or methods.

On the other hand, for protected, in addition you have all the subclasses that reside in a package different from the class that owns the protected feature, in this case. And of course, public, as you see, everything. That's the last one. And that pretty much says that it's the universe. Anybody can access that. Everybody's following folks? OK. Good. Good.

Continuing with that, and now looking at an example of protected access control. So if you take a look at this example, you will see that we have a package demo, a class we have here called Foo. In this class, what we did is we declared a field, in this case, or an instance variable of type integer called result initialized to 20. And look what we did. We actually declared it as protected, which means in this case it's subclass-friendly declaration.

And of course, here we have also another variable, but this variable is called other, which by the way, is of type integer. And we initialize ti with 20. But look what we've done here. It has no modifier, which means what, folks? It means it's the default.

And then down here, in the below, we have, again, in the package test where we imported the Foo class, in this case, that we built in package demo, we have a class Bar that extends Foo. So in this case, we declare a private, again, variable. And this private variable here is called sum of type integer, initialize it to 100. And then down here, we have a method called report sum.

And of course, this we'll go ahead and use as a result and add it to the sum. OK? Result, as you know, is protected, which means it can be accessed by the extended class. So that makes sense.

But then look what we've done here. Now we decided to add other to sum. And you see we wrote it in the red. And we said it would give us compile error. Just by looking at this, why do you think we actually have a compile error here? Why is it that, again, because the other field is declared as what?

Default.

As default. And if it's declared as default, we know that declaring a field as default can be accessed only by what?

[INAUDIBLE]

By methods that belong to the same class or methods that belong to classes within the same package. So that's why, in this case, because the other variable here is declared as using default access and is only available to classes and subclasses declared in the same package. So in this case, of course, it gives us a compilation error.

Is default like protected or private?

Well, default is default. It's not protected, it's not private. Let's go back. So the question, is default protected or private? Default is the one that, again, is unique. OK? It's not private, but it's not protected. OK?

So if you take a look at private, it's accessed only what? Only by methods that belong to the class. On the other hand, default is accessed by the classes and subclasses that belongs to what, in this case? To the same classes that belong to the same package that we mean by that.

On the other hand, protected, what it means, it means that it is accessed by the methods within the same class, the methods within the classes of the same package, or some classes in different packages. It could be in the same package or different packages. So it's different. It is the default, which means it is just package-friendly. Got that, [? Majeet? ?] OK, good. Thank you.

Continuing with that, let's go ahead and look now at-- so everybody understands this concept? Everybody understands why we get a compilation error here? Because we decided that other is what? Package-friendly in here. OK? It is default. So automatically, in this case, when we add it to this one here, of course, this extended class does not have access to this one.

If this was declared as protected, then in that case it would work. Got that? It's like the one that we declared here as protected. And then of course, in this case, can be accessed by the subclass, and that's why we could add it to sum without any problem. Good.

So we said, again, in this case, that the field other is declared as using a default access, which is only available to classes and subclasses declared in the same package. OK? But because this is declared in this package called test and the other one is demo, they're two different packages. That's why you cannot use others. Got that? OK, good.

Now let's look at the concept of field shadowing example. That's also a very nice example. Let's go ahead and look at what we've done here, folks. First, we declared a class called Foo2, and it's, in this case, in the package demo. And then in it, we declared a field result of type integer and it's protected, and initialize it to 20. And then down here in package test-- and of course, we imported the class Foo2, rather, that belongs to the package demo-- and then here we made the class Bar2 extends Foo2. OK?

And of course, now what we're doing is if you take a look here, we declare a private variable, in this case, or a private field of type integer called sum. And of course, we assign it to 10, or sign to it or initialize it with 10. And then down here, we went ahead and declared a result, another field, in this case, or attribute, if you want, of name, in these case, with the name result, and it's of type integer. And we declared it as private, and we assigned 20 to it.

So in this case, you will see that pretty much in this class called Bar2, it declares its own field, and its own field in this case, which is on line five, it turned out that it has its own field. And that field has the same name as what? As the field that you have in the superclass. So again, the consequence is that the field result here that you see it from class Foo2 is, in this case, shadowed by the field result in Bar2. That's the idea, again. So this thing here shadows the parents result that you have here.

OK. So in this case, what is the sum in this example? Again, the sum, in this case, now of would be, if you take a look here, it would be 10 plus 30. That would be 40. OK? And by the way, modern IDEs like NetBeans detect shadowing and produce a warning. They always do that to you. So everybody understands the concept of shadowing here? Good.

So methods with the same name are not shadowed but are overridden. That's what we mean by that. We learn about overriding later on, overriding a method. Continuing with that, let's go ahead and look at the access control. But this time, we're going to look at what we call a good practice, folks.

So a good practice when working with fields is to make fields as inaccessible as possible. That's the good practice. And of course, and provide a clear intent for the use of the fields through a bunch of methods. So here's an example where, in this case, we have a class called Foo3. And in this class, we declare an attribute or a fields result of type integer. And we make it private, and we initialize it with 20.

And then here, we use a method called getResult, which, by the way, returns an integer, but then we declared it as what? Protected. So the first one here on line three means what? Anybody can tell me? It means that that particular field, since it's declared private, can be accessed only by methods within the same class, Foo3. Got that? Which means this method has the right to access the result, and that's why obviously it takes the value, in this case, and uses it to assign it to result.

But then this is protected. What does protected mean? It's accessed only by the methods within the class or methods within the subclass or methods within the subclass that, even if they are located in a package other than where the class is located. OK, good.

In this example where we have now package test, and, of course, we imported Foo3, and then here we create a class called Bar3 that extends Foo3. OK? So pretty much this is a slightly modified version of the example using protected keyword. And of course, here we go ahead and declare this Bar3 has its own private data number, in this case, which is sum, initialized to 10. And it's an integer.

And then here it has a method called reportSum, which is, by the way, public. And what this does it actually calls the getResult and get that value of result and add it to what? Add it to sum.

So in this case, again, what we're seeing here is the idea is to limit access to the field the result to classes within the package and the subclasses, again in this case, package protected. And in this case, you should make the access explicit by defining a method purposefully written for package or subclass level access.

So lots of times, if you want to control which method you want to access, and of course within the inheritance, then in that case you, can make use of the concept of protected, which means we know now that this method can be accessed by methods of the extend the class. But it cannot be accessed by what? Outside classes.

[INAUDIBLE]

Yeah, of course. In this case.

And the getResult--

Oh, well, here reportSum has a void. So that's not a problem.

No. In 4-3 getResult method--

Yeah.

Yeah, returnResult must be there.

Yeah, of course. Return result must be there. Yes. Yes. Yeah.

## 2. Java Class Design, Part 2 - 22m

All right, let's look at overriding methods. Consider a requirement to provide a string that represents some details about the employee class. So here's an example. Well, in this case, we have an employee class. And this employee class has an employee ID, which is private. And we have an integer, by the way, and also a field of type string, which is also private. So it has a couple of fields, one representing the employee ID, which is an integer, and the other one is the name, which is a string.

And then here, it has a method. It has also a bunch of other methods and fields that we don't specify in here. But down here, take a look, folks. We have getDetails. And this getDetails is a method that returns a string. And look what it does. It concatenates this string, employee ID, colon, then a space, with the employee ID. Plus, it concatenates, in these case, concatenated with a space, employee ID, name, colon. And then, of course, this is the employee name. And then, with it, it concatenates the name.

So we see that in this case, we have a method, getDetails, that returns pretty much a string representing the details about the employee. That's pretty much what we have in this case. And what we could do now is we can take this getDetails method. What want to do is we want to somehow apply it to the manager class, which, by the way, extends what? The employee class. We already have seen that in the previous module, in the previous lesson.

So in addition to adding fields or methods to a subclass, we can actually also modify or change the existing behavior of a method of the parent class. And we do that where? In the subclass, right? Let's go ahead now and see how we can specialize this method to describe the manager object. Now remember, folks, that this gives the details of the employee.

The first one, this getDetails here, gives us the employee ID and the employee name. We do know that the manager, in addition to the employee name and the employee ID, they also have what? A department to manage. So let's look at that in the next slide.

So if you take a look at the next slide here, in the manager class, again, what we could do here is we could go ahead and create a method with the same signature as the method of the employee. But in this case, we are overriding that method. We overriding it means what? We're changing it, modifying it to fit, of course, the needs of the manager class, right? Manager or the instances of type manager.

So in this case again, we have a manager that extends employee. And of course, in addition to all the fields that it inherits from the employee, it also has an extra field, in this case representing the department name. It turns out that is a straight. And it's private, also, which means it can be accessed only by the methods within the class. Got that? OK, good.

So now we have a method, getDetails. And this one returns a string, OK? And here, look what we do. Now, we actually-- if you remember last time when we discussed super-- we said super can't actually call the constructor of the super class, of the parent class. But also, we said, through super, we can also call what? Methods of the parent, class, OK? Or fields of the parent class if they are public, of course.

But it turns out here that here, we're calling-- when we say super.getDetails, it's really calling what?

The parent.

It's calling the parent getDetails method that we've seen, by the way, earlier in the previous slide. Got that? It's calling this one here. OK, so we do that. And then, we concatenate it. So that's going to return, of course, this one.

What it does, ladies and gentleman, is going to return this. But in addition, what it does, it will go ahead and concatenate that with the department, space, department string, colon, space. And then, in addition, it concatenates that, the department number. So in this case, when we call this, the getDetails on an instance of type manager, what's going to happen is it's going to give us the details of the manager. Which means it's going to call the super.getDetails, which gives you the details of the employee. In addition also, it will go ahead and concatenate that with the department name. Got that? OK.

So again, in this case, if, for example, a class declares two public methods with the same name and a sub-class overrides one of them, the class still inherits the other method. Remember that. Continuing with that, and of course the question that always people have is, how can this now overridden method be invoked? How can we invoke an overridden method?

So of course, during runtime, the JVM invokes the getDetails method of the appropriate class. And that's during runtime. Of course, if you comment out the getDetails method in the manager class again that we've seen earlier, then what happened in this case? Of course, it's going, in this case, to print what? The details of the employee.

Let's go ahead and see this example. In this example, we go ahead and create a new instance of employee by calling the employee constructor and passing to it the ID, the name, the social security number, and the salary. And then, down here, we'll go ahead and create a new instance of manager and pass to it again the ID and name, social security number, salary, and of course the department. And then, down here, we want to print. This will print the details of the employee. And this one will print what? Of course, the details of the manager.

So the question that we have here, we said, if you comment out the getDetails method of the manager class shown in the previous slide, which is this one here-- if you comment this one here, you comment this method. So the question is, what happens when getDetails is invoked? Of course, the answer is what?

We should recall that methods that are inherited from the parent class-- so we know about that. So at runtime, the getDetails methods of the parent class, employee, is executed, which makes sense. Because we know that a subclass always inherits what? All the methods of the parent class. Got that? Everybody's following, folks? No problem? [? Majit ?], is it sinking, no problem? [? Govin ?]? Good, good.

Let's go in now at look at virtual method invocation. Well, this is also a quite interesting topic. And we would like to, again, investigate this. And the question here is, what happens if you're having the following? I have a reference variable, e, of type employee. But I initialize it with a new instance of what? Manager.

Is this acceptable, ladies and gentlemen? Yes, of course. Because we know a manager is what? An employee can be a manager, right? And a manager is an employees. So that's no problem.

And then here, we now go ahead and do a print. OK, now we're printing. So what happened in this case? So in this case, during execution, the object runtime is determined to be a manager, which again in the manager. So it's an object that has an ID, an employee name, and of course a department.

So the compiler is satisfied because whenever you compile this, the compiler is satisfied because the employee class has a getDetails method. And of course, I will get no problem. And at runtime, the method that is executed is referenced from a manager object. Again, this is an aspect of polymorphism called virtual method invocation.

So again, we're going to see this. And by the way, in Java, it's well-known, the behavior, like we said because the object you created was a manager object. And at runtime, when the getDetails method was evoked, then the runtime references, again in this case, it would be to the getDetails of the method of a manager class even though the variable is e. Why? Because we know that e here is a new instance of type manager. And we know that the manager class has the getDetails method. So in this case, no problem. This works without any problem, right?

This behavior is referred to as virtual method invocation. This is well acceptable. The only thing that we want to remind you folks for those who have done a little bit of C++, that if you are a C++ programming, if you want to get this behaviors in C++, you have to declare the method as virtual. Otherwise, it will not work. But in Java, it's natural. It's understand. No problem. Everybody's following that? OK, good. This is quite interesting, folks. This is a concept that is very, very important to understand and grasp.

Continuing with that, let's look now at accessibility of overridden methods. Again, to override the method, the name and the order of arguments must be identical. So here, we have, in this case, an overridden method cannot be less accessible than the method of the parent. For example, in this case, look at that. We have an employee class. And we have a method, getDetails, which, by the way, returns a string. And then, of course, it's public.

And then, in this case, we have a manager that extends employee. And in it, we have getDetails. But this time, we declare that as what using the modified private. So obviously in this case, if we have another class called overriding test, where in this case we go ahead and create the new instance of type employee and initialization with a new declared reference of type employee, e, and instantiate it or initialize it with a new instance of manager.

And now, if I invoke e.getDetails, of course, it's going to be illegal. Why? Because I declared this as what?

Private.

As private. So obviously, an outside class, I cannot do that. So in this case, of course, this would be illegal simply because I declared the getDetails, of course, as a-- So that's why we say, in this case again, an overridden method cannot be less accessible than the method of the parent because the method of the parent is what? Public here. So this cannot be less accessible than the method of the parent. Which is, if it's private here, that's not acceptable. Got that? Right? So that's why we say that an overridden method cannot be less accessible than the method in the parent.

So by changing the getDetails method to a private, only that class can execute the method. Which means only the methods inside can access that. So again, the language semantics of the execution, e.getDetails, dictates that the manager getDetails method is executed. But we know again, in this case, we have the result, of course, would be at runtime error.

So what happens if you now make the employee method getDetails private, and the manager public? What happens in that case? Yup?

So which one-- because we have the method in the manager class, or the method in the override--

The method in the manager class should not be private. It should not be less accessible than the one in the parent class. So how about this question? Thank you, that's a good question.

So the question again, which one is the issue? Because we circled it anyway with a red rectangle showing you that that's not-- and we also told you here. An overridden method cannot be less accessible than the method in the parent class. The other thing that is quite interesting, folks, is this question here. In this case, what happens if you make the employee method getDetails private and the manager method public?

[INAUDIBLE]

Again, because the compiler does type checking, the compiler complains that you are attempting to access what? A private method in the employee. That make sense. Everybody following? Good, good, good. So everybody is understanding the concepts, right? It is extremely important to understand the concepts. So please, please feel free to ask any questions related to this visualization, or what we call polymorphism.

Now, the advantage for those who have done C++ and have done C++ extensively before, you will see that this is a lot easier to work with. Again, I mentioned earlier when I asked, how many hands went up for those who have done C++? So again, yeah, a few of you. So obviously, you will see that there is a slight difference here. And that's why Java is attractive.

Continuing with that, and let's go ahead now and talk about applying polymorphism. Polymorphism is also an interesting concept. And let's go ahead and look at that.

So suppose you are asked to create a new class that calculates a stock grant for employees based on their salary, and of course, their role as either managers, or engineers, or admins. So we can write a class, for example, which by the way, this is not really a good object oriented type of a class. It's not very object oriented. But let's go ahead and just take a look at it for the purpose of understanding what is it that we need to do? Not to, again, get into trouble like this. Not to get into bad practice like the one that you see in this current slide.

So we have a class called EmployeeStockPlan. And this class, again, in this case has a bunch of methods. Again, in this case, we have grantStock method. That takes an instance of type manager and performs the calculation for a manager and returns an integer. This would be, again, in this case calculating the stock grant for an employee based on their salary and their role. And then, we have another one that takes an engineer and does the same thing for an engineer. And we have another one that takes an instance of an admin and does the calculation for an admin.

So if you take a look here, folks, this looks like what? We've seen this already. This method that has the same name and different types. We pass different types of parameters. What is that?

Overloading.

Overloading methods. OK, so of course, consider now what happens if now, of course, you have more than three types of employees? Imagine you have now salesperson. You have technician, and so forth. So of course, you need to add all these different methods. So obviously, this is going to be lots and lots of methods, which, by the way, is against the concept of what? Of object oriented. So clearly, this is not a good way to actually solve the problem.

OK, so let's go ahead because obviously there is-- the code, of course, in this case works. But unfortunately, this is not an easy way to read. And it's likely to create much duplicate code. So can we now avoid this?

And for that, folks, we're going to apply the concept of polymorphism. So a good practice is to pass parameters and write methods that use the most generic form of your object as possible. So whenever we talk about the most generic object, so most probably we're talking about an object of type what? The class that is on the top is called what? Parent class, right? The super class. So every time you say more generic, it's like generalization. That's the idea behind this because we all know that an engineer is an employee, a manager is an employee, an admin is an employee, a salesperson is an employee, a director is an employee, a vice president is an employee, a president, and so forth. So now, let's go ahead and look at the example here.

So in this case, again we have an EmployeeStockPlan class. And we are going to create one math called grantStock. And look what we do, folks. We pass to it what? An instance of type employee. Got that? OK, so good. And of course, employee is a good base class to start from. but of course, in this case, the question will come back to, how do you know what object is passed in? So again, in this case, we need to find out how do we do that. Let's go ahead and see how we can apply this.

So in another class, if now we create a new instance of type EmployeeStockPlan reference by the esp reference variable in this case. And then, down here, we create a new instance of type manager. And then, to it, we pass the reference variable, m, of type manager to be able to-- and of course, once we pass that, the question is, how do we know what object type is passed in? The answer for this is in the next slide, folks. Let's go ahead and look at that.

If you remember, earlier in the morning when we were, again, learning lesson number two, we actually saw this keyword called instanceof. And if you remember, I said, folks, when we get into polymorphism, I'll remind you it's a very, very useful operator. And when we get there, I'll show you how that works. Well, this is it now.

So in the Java programming language, it provides this instanceof keyword which, by the way, helps us determine an object's class type at runtime. So in this case, what we could do is we can go ahead now and rewrite our class, EmployeeStockPlan. And in this case, again, we have the method grantStock. That takes an instance of employee. And look how we do it.

Now, we say, perform a calculation based on the employee data. And then, after that, we say, if e that I'm passing as a parameter here is an instance of manager, then I process the manager, the stock grant of a manager. If the e that I'm passing is an instance of an engineer, then I go ahead and process the engineer stock grant. And if the instance is an admin, then I'll go ahead and run the code to handle that. Else, again, I say perhaps an error. And of course, it would be a generic employee. So you see how this actually works very nicely. So you there now the grantStock method uses the instanceof to determine what type of employee was passed to the method.

Of course, another approach to actually solve this problem is to use the capabilities of the Java SE 7, which is the switch statement using what on strings? Let's go ahead and see this. It turned out that because-- take a look, folks. Just because we added the string to the switch statement in the Java SE 7, now we have a very, very nice solution for this type of a problem, something that we did not have, by the way, before when we used Java SE 5 and Java SE 6. Now, we have it in the Java SE 7. And it's quite straightforward. And by the way, it's very useful and very friendly, user-friendly, as you see.

Here, we go ahead and first get the class, invoke the getClass on, in this case, the reference variable of type employee. And on it, I invoke getSimpleName, so I'll get that. So that would be the, again in this case, the name of that type, which is going to be either what? An employee or a manager. And of course, I use that string now in the switch statement and say, if it's an engineer, then go ahead and process engineer. In the case of admin, I process the admin. In the case of manager, I process the manager. In the case of director, I process the director. And of course, the default, I would say, it's an error.

So we see that now, we just found out, ladies and gentlemen, that a very nice feature that actually we didn't have before, and we had to use the instanceof, if, else, if, else, like you see over there. Now, we can write a very nice switch statement that makes use of the string. And that actually can fix the problem quite easily. Everybody's following, folks? So this is some of the features that we're showing you that will be very helpful to you once you build your applications in the future using the Java SE 7. So far, so good?

## 3. Java Class Design, Part 3 - 31m

Now let's look at the casting object references. That also is a very nice topic. It's one of my favorite topics. And let me go ahead and go through it because it's also fun to actually learn how casting object references work.

So after using the instance of operators to verify that the object you received as an argument is a subclass, again, in this case, so you can access the full functionality of the object by casting the reference. So that's how, typically.

We say, modifyDeptForManager. We pass an employee and the string, which is the name of the department. We say OK, if the e is an instance of Manager, so first of all, we'll go ahead and do what? Cast that instance into an object of type Manager.

And then, after that, pass that, again, invoke the setDeptName and pass the department to set the department for that manager, OK? And again, in this case, without the cast to the Manager, the setDepartment method would not compile. So remember that all the time, all the time.

So in this slide, what we've seen, again, we needed, again, in this case, the setMethod, in this case, of the Manager class. We needed to make sure that that object is of type Manager to be able to set the department for a particular manager. And of course, to satisfy the compiler, we needed to cast a reference from the generic superclass to what? To a specific class. That's exactly what we did here. To be able to satisfy the compiler, we, in this case, casted an object of type Superclass, in this case, which is e, employee, to an object of type SpecificClass, which is, in this case, Manager.

And by the way, there are a bunch of rules related to forecasting references. Let's go ahead and look at these in the next slide. Here's a very, very nice picture. And we always say, folks, that a picture is better than 1,000 words. This is just explaining how the casting rules work.

We always tell you, folks, in Java that upward casting are always permitted and do not require a cast operator. You don't have to do that. For example, if I want to cast an object of type Manager into an object of type Employee, that is OK. No problem. I can do that.

By the way, here, I'm assigning a new instance of type m, in the m, which represents, again here, I declare a d as an instance of type Reference, variable of type Director, and initialize it with a new instance of type Director. And then, here, I declare a reference variable, m of type Manager. And I initialize it with a new instance of type Manager, OK? And then, now I can actually assign m to a reference variable of type Employee.

This is perfectly acceptable. Why? Because I know a manager is nothing but a what?

An employee.

An employee. That works without any problem. And by the way, even here, I can go ahead and now assign d, which is an instance of type Director, to a reference variable of type Manager. Why? Because I know a director is what? Is also a manager. That's how we found it in the class hierarchy in one of the previous slides.

And I also can do this, I can now assign d to a reference variable of type Employee. Can I do that? Yes I can, because I know that a director is nothing but a manager. And a manager is nothing but an employee, which means a director is nothing but a what? An employee. So that works without any problem.

Got that? Everybody's following? Good, good, good.

So upward casting is straightforward. And we always don't specify that, unless, again, only in special cases. There are special cases where we actually need to, even though it's upward casting, we still need to specify that. And that's to avoid the compiler getting confused.

I'll show you an example in the next few slides about that. Everybody is following? OK, let's go ahead and continue that.

So now, let's look at casting rules. So again, for down casts, the compiler must be satisfied that the cast is at least possible. So imagine I declare an instance, a reference variable of type Employee and initialize it with a new instance of Manager. And then I declare a reference variable of type Manager and initialize it with a new instance of type Manager. So this is, again, without any problem.

So telling you a little bit about the casting rules, folks, we say that, a down cast, the compiler simply determines if the cast is possible. If the cast down is to a subclass, then it is possible that the cast will be succeed, OK? So in this case, we've got no problem.

And of course, we should note also that, if at runtime the cast results in a java.lang.ClassCastException, if the object reference is of a superclass and not of a class type or a subclass, so in this case, we know that the employee of type Manager can be cast at the known object of type Manager. Again, this would work if, of course, e was a Director object.

And of course, here, we have an m which is cast into an object of type Director. This, of course, fails at runtime. Why? Because? You know, at the compile time, et cetera. But at runtime, if I want to use a method, in this case, on the manager, and it does not exist in the class Director, then, of course, that will scream at you.

And by the way, we also said, again, in this case, that the cast of a variable, e, to a Manager reference satisfies the compiler, because the manager and employee are the same class hierarchy. And the same thing with a manager and a director. We know about that.

The problem that we have here is, imagine now, I take an instance of type Manager. And I want to cast it into an instance of type Engineer. Can I do that? And the answer is, no. Why?

Because even though Engineer and Managers both inherit from Employee, but they are two different classes. They have nothing to do with each other. A manager is not an engineer. And an engineer is not manager.

Of course, that's why you put the X here. Again, in this case, they are two different classes. Obviously, in this case, the compiler will fail.

Got that? Everybody's following? OK, good, good, good, good good, good.

What else? OK, so we discussed that. That's good.

Now let's look at overriding object methods. One of the advantages of a single inheritance is that every class has a parent object by default. And by the way, the root class of every Java object is called java.lang.Object.

So again, you do not have to declare that your class extends Object. Implicitly, it extends Object. You can go ahead and write it explicitly.

And writing this is really equivalent to this. As simple as that. Everybody knows about that? Writing, again, class Employee is equivalent to class Employee extends Object. Exactly the same.

So the root class, by the way, contains several non-final methods. Non-final means what? They can be overridden.

But there are three that are quite important to consider. They're the toString, the equals and the hashCode. So out of curiosity, let me just show you this class. By the way, you can Google it or you can get it on the API.

Here is my class Object. And this class Object, we said it is the root of the class hierarchy. Every class has Object as a superclass. All objects, including arrays, implement the methods of this class.

And by the way, this exists in JDK 1.0. So some of you want to see, for example, the methods of this class. It turned out that the methods of this class are all these methods.

Clone, that creates and returns a copy of this object. Equals, this is the one that we're interested by, indicates whether some of other objects equal to this one, OK? This is useful.

Finalize is called by the garbage collector on an object when a garbage collection determines that there are no more references to this object. The hashCode returns a hash code value for the Object.

Again here, we're going to look at equals, which, pretty much, equals, in this case, can compare the contents of two objects, OK? And then, in this one, then we have the hash code. The hash code returns a hashCode value for an Object. Again, this method is supported for the benefit of hash tables, such as those provided by the HashMap. And by the way, it also assures the uniqueness in the comparison.

And the other one, which is also interesting, is the toString. This toString can be implemented to return how you want your objects to be represented when you bring them off a particular class, OK? That's the toString.

A lot of times, when you create your own classes, you have tendency to, by the way, override the Equals method, the hashCode method and what else? And the toString method, so that you can print it any way you want. Everybody got that? And of course, there are other methods, notify, notifyAll and wait and different waits and, of course, finalize and the getClass, which returns the name of the class of this object and so forth.

Let's come back now to the lecture and continue with that. So we said that Object defines a bunch of non-final methods that are designed to be overridden by your class. Again, there are equals, hashCode, toString, clone, finalize.

And we said the ones that we're really interested by, in this case, are the equals, the toString and the hashCode. Let's continue with that, and take a look at these. Let's go ahead and look at the first one, which is the toString method.

The toString method is called whenever an instance of your class is passed to a method that takes a string such as a println, OK? And here's an example, when I declare a new instance of Employee. And of course, after that, I'll pass it to print it. So automatically, again, in this case, the toString is passed.

You can actually use the toString to provide instance information. So for example, you could then override your toString so that you can print it, you print the information the way you want it yourself. That's the idea behind, again, in this case, overriding the toString.

So I can go ahead and say, return Employee ID, space. That's the string concatenated by employee ID, then a backslash, which means what?

New line.

It takes me to a new line. I decided that is going to happen like that. And then, after that, which means I print the employee ID on one line, and then the employee name on another line.

I could do that. That is up to me. Got that? All right.

So again, this is a better approach to getting details about your class than creating your own getDetails method. So you can just override the toString. And that pretty much does the job. Because, every time you want to print your Object, you pass it to the println, which, by the way will call the toString method because, obviously, it calls the toString method of your superclass, which is Object.

So in this case, if you override the toString method over your class, then you don't have to provide that getDetails. Everybody's following, folks? Everybody's following? So that's the idea behind, again, all of this.

Now how about the equals? The equals also is a very, very interesting method. And the Object equals method compares only Object references, if you have it in the Object class, OK? It compares only references.

Again, if there are two objects, x and y, in any class, and x is equal to y, and only if x and y refer to the same Object, that's what it means. OK? And that's if you take that equals as it is from where? From the Object class. Got that? OK.

Now in many cases, ladies and gentlemen, we really do not want to compare the references. But we want to compare the contents of the Objects. Got that?

In general, in Java, if you want to compare references to objects, don't use the equals. Use what? Equal, equal. Equal, equal is the one that compares references to objects. If you want to compare the contents of the objects, then, in that case, you need to override the equals method so that you can compare what is it that you're comparing as contents of the two objects. Got that? OK.

So let's go ahead. Let's assume now that we have two objects of type Employee. But then we want to compare, for example, their contents. Which, by the way, comes to what? Comparing their fields, maybe an employee ID, maybe the names, and so forth.

So as you know, in many cases, in the same company, we have people that have the same last name and the same first name. So how do we make the difference between the two? Then what we could do is we can go ahead and compare the employee ID or maybe the middle name.

As you know, this is one of the issues that we had in the beginning for when we travel. Remember the non-fly list? And you know, some people have the same last name and the same first name. And then, the next possible way to actually find out that the person is not the right person we're looking for, we look at the middle name. We look at the date of birth and so forth.

So remember one thing, folks, once you implement the equals method that allows you to compare the contents of two objects, how do you now compare references to two objects? Using what? The operator is equal, equal. Thank you. Good job.

So let's go ahead and look at an example where we override this method called equals. Here is an example of overriding the equals method in the Employee class. Again, it compares everything. Look how we do it.

We now have the equals method that, by the way, always returns a Boolean. It takes an object. So in this case, again, we declare a local variable of type Boolean called result. And we set it to false at the beginning.

And then, after that, we'll going ahead and say, if the object is different than null that we're passing and, of course, the object is an instance of type Employee, look what we do. We'll first cast that object of type Employee. And then we do what? Then we compare the ID.

Is the ID is equal and the name equal and the social security number equal and the salary equal, then we do what? Then we go ahead and set the result to true and return result. Got that? OK, good.

And that's how, again, we pretty much define-- here we did it, by the way, for what? We did it for the instances of type Objects. Let's assume that we wanted to compare two objects of type String. What is it that we're going to compare over there?

Remember that the equals, if we want override the equals to compare two strings, we're going to compare what?

Characters.

The characters that are inside the two strings. That's how we do it, OK? So it's always the equals, if you override the method, equals to compare the contents of two objects. Got that?

So for example here, for Strings, you should, again, use the equals method to test the string characters by character for equality. Everybody's following, folks? Good.

Continuing now. And by the way, another thing that is also quite important, folks, is overriding Object hashCode. Again, the general contract for object states, that if two objects are considered equal using the equals method, then integer hashCode return for the two objects should be also equal.

So by the way, we need to actually implement this. So the Java documentation for Object class states that it is generally necessary to override the hashCode method whenever the method equals is overridden so as to maintain the general contract for the hashCode method, which states that equal objects must, again, have equal hash codes. That's the idea, which means preserving the uniqueness of the equality. Got that?

So the hashCode method is used in conjunction with the equals method all the time and, of course, in the hash-based collections like HashMaps or HashSets or Hashtables. Tables And by the way, in general, because some of you might be saying and, in general, people have a tendency to say, oh, I do not know how to implement this hashCode method. We just want to let you know that the good news is that most all of the modern IDEs like NetBeans can actually generate hash code for you on-the-fly.

So here's an example where we have a hashCode method. Again, it returns an integer. Here it goes ahead and sets a variable of type Integer called hash. And then here, it will go ahead and it multiplies the hash by 83 and then adds to it the employee ID.

This one here, again, it calls the hashCode, then passes the name to it. And this one calls the hashCode method, because these are strings which compare them, again, to integers. And then here, this one here, it takes an integer and, of course, adds it to the hash code.

And then, down here then, of course, in this case, we'll go ahead and use the salary. And we have the [UNINTELLIGIBLE], of course, in this case. And then we have the shift.

So this here, by the way, is what we call the XOR. How many of you know about the XOR? OK, the XOR operator here, represented by that caret that you see over there, and of course here, we take that salary and cast it in the object of type doubleToLongBits. And here, this is, by the way, shifting. We're shifting to the right by 32 bits.

So hashCodes have tendency, like I told you, to be a little bit complex, right? But luckily, IDEs will build that for you. And the whole purpose, by the way, for overriding the hashCode method is preserving that uniqueness that, if two objects are equal, then they must have the same hashCode, which preserves the integrity of the equality of the two objects. Everybody's following, folks? Good, good, good, good.

And in general, by the way, we give you a bunch of steps to create your own hash function. Again, we tell you, go through this following steps that will help approximate a reasonable hash value and equal instances. First, you start with a non-zero integer constant. Again, prime numbers result in fewer hash code collisions, OK?

And of course, for every field used in the equals method, compute an integer hash code for that particular field. Again, we should notice that, for strings, you can go ahead and use the hashCode method for a string. Of course, after that, add the computed hash code together and, of course, return that result. And that's exactly what you've done over there.

Everybody's following, folks? OK, good. So in general, again, what we have done here is we looked at the concept of access levels. We have private, protected, default and public, OK? So what does default mean, by the way?

It's the same class and same package.

Same class and same package. Good. Overriding methods, we looked at overriding methods. We looked at overloading constructors and other methods appropriately.

We looked at the instanceof now. And through the instanceof, we found out that a very nice feature which we can use, which is what? Which is what? The switch statement with String. Remember that? Which works very nicely, OK?

We looked at using virtual method invocation in polymorphism. We looked at the upward and downward casts. And we looked at overriding methods from the Object class to improve the functionality of your class. Got that? All right.

Let's go ahead and look at a quiz, in this particular case. And in this case, again, suppose that your account has an Account class with a withdraw method and a Checking class that extends an Account and that declares its own withdraw method. What is the result of the following code?

Again, suppose that you have an Account class with a withdraw method and a Checking class that extends Account class that, again, declares it's own withdraw method. What is the result of the following code, where we declare a reference variable to the account and, of course, in this case, initialize it with a new instance of the checking account, and then we call the withdraw method? So again, in this case, we have A, B, C, D and E. What do you think, folks?

Isn't it B?

E.

[? It isn't B? ?]

[UNINTELLIGIBLE] Again, which one is this called here?

That is checking.

I'm sorry?

Checking.

The checking account. So the checking account will, of course, execute here. Which is what? Which part?

E.

E.

E Thank you. Got that? OK.

Next, suppose that you have an Account class and a Checking class that extends Account. The body of the if statement in line two will execute, OK? What do you think? Is this true or false?

If Account is an instance of checking account, will this block run?

It is true? It's true.

I'm sorry?

It's true?

Remember that, if an account is an instance of Checking, what is it that we need to do, in addition to that?

Casting.

Casting. We need to cast first. So we need to cast in the account into an object of type what?

Checking.

Checking. And then do that. Did we do that here? We didn't do it. So that's why, again, in this case-- got that-- it would fail. Got that?

I'm sorry, [INAUDIBLE PHRASE]

Yeah, we need to cast the object to be able-- you know, here, once we use the instanceof to find out if the account is type Checking, for you to work with that Checking object, you need to cast it into an object of type Checking. Got that? Here, we don't see it.

It still executes, but it's still true. The body of the if statement in line two will execute. But it will execute, again, in this case, if the code is related to this checking account. Then, in that case, you need to cast the account of type Checking. And then you work with it.

Get it.

Got that? OK, so you have to do the casting before it is. So that's why we said it's missing here. Got that? You need to do the casting. Right, Ian?

We don't have to.

Well, you know, you can tell me, for example, in the code, we already did that. But obviously, we didn't see it. We're trying to tell you that, specifically, you have to do that. Got that? Good.

Here's another example. Suppose that you have an Account class, a Checking class that extends Account. You also have a Saving class that extends Account. What is the result of the following code?

So what do you think, folks? I declare a reference variable of type Checking Account and then initialize it with a new instance of type Account, initialize it with a new instance of Account. Is this good? Acceptable? Yes. How about this one?

No.

Because Saving also extends Account. So that's good also. That's acceptable.

Remember that Saving Account, it also extends Account. It's like Checking. So this is also acceptable.

On the other hand, if I take account 1 and cast it into an object of type Saving, is this acceptable? No. That's not acceptable, OK? So obviously, in this case, the compiler complains about what?

Line 3.

About line 3, which is what? Which is, the answer here is, what?

D.

D, compiler complains about the cast in line 3. Why? Because this account is of type what? Checking. And type Checking and type Saving are two different, even though they'll both extend what?

Saving.

Saving. It's actually what we showed you here. Look at that, [? Sandia. ?] Let me go back and show you this. Remember that?

Engineer extends from Employee. And Manager extends from Employee. But you cannot cast a manager into an engineer. You cannot do that. Got that?

So the same thing in here. We gave you the same type of example, except that different classes. Right? Everybody's following? OK, good.

So [? Sandia, ?] doing all right? OK, good. How about the next one?

We have a class called Account. And of course, it declares an object of type Double. Which by the way here, what's the modifier here?

Default.

Default. And here, we have a class called Savings that extends Account. And down here, we declare an interest of type Double, which is private. And then here, of course, we create a new instance of type Account, OK? And then here, we have a getBalance, which returns, by the way, the interest plus balance, OK?

So what change would make this code compile?

[INAUDIBLE PHRASE]

So remember that-- oh yeah, you can make balance what?

Protected.

Protected. Good job. Good job. You can make balance protected. And then, of course, in this case, obviously, it would be accessed. Got that? Good job.

And of course, we have a set of practices for this. First one is overriding methods and applying polymorphism where you're going to modify the Employee, Manager and Director classes overriding the String to the toString method. Create an EmployeeStockPlan class with a grant stock method that uses the instanceof keyword.

And that's pretty much what we're going to do. Let's go ahead and, of course, showing you this in the practice. So after we've finished with practice for lesson three, we're going to go ahead and do practices for lesson four. And this is related to the Java class design.

So in this case, you are asked to-- again, in this case, this is the summary level-- override the methods and apply polymorphism. This gives you less details. But you can also read it from more details. This gives you more detail. If you want to take a look at some of the code, they'll give it to you here where, again, in this case, you're overriding methods and applying polymorphism.

So remember one thing. And I think Sandy asked me about this earlier, that you have the same type of-- or is it you? Sorry-- same type of exercises. But whenever they say detailed level, they're giving you more code, OK? I think [? Sharva ?] asked me about that.

So just to let you know that, in general, there are folks who, by the way, are quite advanced in Java. And they usually use the summary level to do the lab. Some actually would prefer to get into the detailed level. And of course, that gives you more detail about how to do the practice, in this case. Everybody's following, folks?

Quick question.

Yes?

The answer to the quiz before the second to the last one?

Yeah.

I think it's supposed to be B

What did we say?

The second to the last one.

You mean this one? No? Oh, wait a minute.

Yeah, the other quiz. That one.

OK.

[INAUDIBLE PHRASE]

Well, the compiler-- yeah, our runtime-- no, actually, the compiler. So this is a runtime.

[INAUDIBLE].

No. This is a compile error.

I just put it to the compiler [INAUDIBLE PHRASE].

Yeah. This is a compile error. This would obviously, in this case, because the Checking Account and Savings, they are two different classes, even though they inherit from Account, OK?

I put it to NetBeans. And NetBeans compiled it.

What do you mean, [UNINTELLIGIBLE]?

I put the code into NetBeans.

Yeah. Well, put the whole code. If we put the whole code, then, in that time, it will, of course, in this case, it will catch it, if with the whole classes.

I can show you.

## 4. Practice 4-1: Overriding Methods and Applying Polymorphism - 10m

After looking at Lesson 4 that talks about Java class design where we discussed the use access levels, private, protected, default, and public, we looked at overriding methods, we looked at overloading constructors, we looked at the concept of using the instanceof operator to compare object types, we looked at the virtual method invocation using upward and downward class, we looked at overriding methods from the object class to improve the functionality of your classes, let's go ahead and look now at the practices for this Lesson 4. And for that we are going to look at the detail level of the practice, in this case, that says overriding methods and applying polymorphism. In this practice, we will override the toString method of the object class in the employee class and in the manager class. We'll also create an employee stock plan class with a grand stock method that uses the instanceof operator to determine how much stock to grant based on the employee type.

So in this case, we'll go ahead and open the employee practice project in this case. And we'll go ahead and open that, which is the employee practice. And we add the toString methods to the employee class with the signature that you see here on the slide. And we override the toString method for the manager class too. And we add the toString string method with the same signature as the employee to string method for the manager class.

And then after that, we call the parent class method by using the super keyword and add the department name, OK, as you see on the slide. We should note that the green circle icon of the all in the center beside the method signature in the manager class, again, this indicates that the NetBeans is aware that this method overrides the method from the parent class employee. And of course, hold the cursor over that icon to read what this icon represents, as we see here.

And of course, if you click on the icon, and NetBeans will open the employee class and provide the view of the toString method. And we can also, if optional, we override the toString string method for the director class, if we want. Create a new class called the employee stock plan in the package com.example.business. This class will include single-method grant stock which takes an employee object as a parameter and returns an integer number of stock options based on the employee type. The director's 1,000, manager is 100, and all other employees is 10. Create the new package and the class in one step by right-clicking the package and then selecting new Java class and so forth. OK?

Enter the employee stock plan as a class name. And of course, this new class will have a bunch of fields, the employee shares, and the manager shares, and the director shares, which, by the way, are private final. It also has a method getGrant out of the grant stock that takes an instance of an employee and then, of course, checks if the instance of the employee is a director return director shares. Otherwise, if it's a manager, return manager shares, otherwise return the employee shares. And of course resolve any missing import statements.

Modify the employee test, class now, and replace the four print statements in the print employee method with a single-print statement that uses the toString method that to you created. And as you see here, of course, in our case here on the slide. OK? And overload the print employee method to take a second parameter, the employee stock plan, and print out the number of stock options that this employee will receive.

And of course, after that, again, the method first calls the print employee method add a print statement to print out the number of stock options that the employee is entitled to. And of course, above the print employee method calls, of course, in this case, in the main method create an instance of the employee stock plan and pass that instance to everyone of the print employee method, as you see here, as it shows here on the slide. Of course, resolve any missing import statements. Save. And of course test the class.

Let's go ahead and see that. So for that we have, first of all, the employee class that now overrides the toString method. Here it is. That returns the employee ID, the name, and the social security number, and the salary. And we do the same thing for the manager class. OK? As you see, we override the toString method too by calling the toString method of the super super.toString, which means calling the toString method of the super class, in this case, employee. And we do that as optional to the director class too.

As you see here, we have a toString method. We should not also see the override method. And this is, again, the green button that they mentioned in the Activity Guide. And as you see here, it calls the super toString, which, by the way, is the toString of the super class, in this case, manager.

And then of course, they wanted us to modify. And here's, by the way, the employee stock plan that has the three different fields that are final, private, employee shares, manager shares, and directory shares. It has the grand stock that takes an instance of an employee and checks if the employees is an instance of a director return the director shares. Otherwise, if the employee is an instance of a manager, return the manager shares. Otherwise, return the employee shares.

And of course, in addition, they want us to modify, in this case, the employee test, where now we create the instance of an engineer, a manager, an admin, and, of course, a director. And in the print statement, print employee statement, you see now it's calling the println, in this case, where we invoke the getClass on the employee reference variable and on it invoke the getSimpleName. And then we pass instance of the employee to the println.

And then, again, here's the print employee that takes an instance of an employee with overloading of the print employee method and takes, of course, of an instance of employee stock plan. And we'll call the print employee to pass through it. And then in addition, we'll go ahead and invoke and print, in this case, the stock options by invoking the grand stock on the instance of, in this case, the employee stock. OK? And pass to it the employee.

Now we should not forget also that we also created a new instance of the employees stock plan here. And then recall the print employee and pass to it the engineer and instance of the employee stock plan. The same thing we, again, called the println and pass to it the admin and instance of the employee stock plan, and then manage an employee stocks plan and then director and an instance of the employee stock plan.

If we run this, then, of course, we get all the output here that pretty much prints the engineer and then the admin, the manager, the director, of course, with the stock options too, every one of them. The engineer is 10, for the admin is 10, for the manager is 100, and for the director is 1,000. And down here, of course, we have the testing the raiseSalary and setName. And we also here we are printing this time the Barbara Johnson-Smythe as a name, and of course the stock option is 100 too for that.

And that pretty much ends the practice for Lesson 4. Thank you.

