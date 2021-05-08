# 3: Encapsulation and Subclassing

1. Encapsulation and Subclassing, Part 1 - 12m
2. Encapsulation and Subclassing, Part 2 - 8m
3. Encapsulation and Subclassing, Part 3 - 12m
4. Encapsulation and Subclassing, Part 4 - 18m
5. Practice 3-1: Creating Subclasses - 10m
6. Practice 3-2: Adding a Staff to a Manager - 11m

## 1. Encapsulation and Subclassing, Part 1 - 12m

So let's go ahead and look at Lesson 3, which covers encapsulation and subclassing. In this lesson, we are going to make use of encapsulation in Java class design. We're going to look at the model business problems using Java classes. We're going to make use of classes that are immutable. We're going to create and use Java subclasses. We're going to overload methods. And we're going to make use of variable argument methods.

Looking at encapsulation. Well, the term "encapsulation" means what? It means to enclose in a capsule or to wrap something around an object to cover it, to protect it. In Java, it's kind of like, even though I should maybe use the word "protected," it means something. But at least in the English semantics, protecting something is making sure that it is encapsulated.

So in object-oriented programming, encapsulation, folks, covers or wraps the internal workings of a Java object. So you can actually encapsulate data variables, fields, and of course, typically, they're hidden from the user of the object.

Well, they're hidden from the user of the object so that the user can access them in a certain way. So we can actually, somehow, make the user use these variables of fields in the way we want them to use it. Methods are nothing but a bunch of functions in Java. And they provide an explicit service to the user of the object, but hide, of course, the implementation.

In a sense, you provide an interface for the client to the user, and the user makes use of that interface to, of course, make use of the methods without specifying the detailed implementation or without showing the detailed implementation of your methods. And of course, as long as the services do not change, the implementation can be modified without impacting the user. So the idea is we can go ahead and change our business logic any way we want, but still, we will not change how the client interacts with our services.

And continuing with that, let's look at an example of encapsulation. So again, in this case, we have this question, what data and operations would you encapsulate in an object that represents an employee? Well, in general, an employee has an employee ID. And that would be a unique identifier of the employee within the company. Employee has a name, and if we want to, of course, in this case humanize an employee, it's always a good idea to know an employee by their first name and last name.

And of course, if we are in a country like the United States, then we can also specify a social security number for an employee. Again, this social security number pretty much identifies, in this case, the taxpayer, or lower-order citizen, of course, working in the United States for tax purposes or for, maybe, any type of benefits services. And of course, an employee also has a salary. So these are typically, if you want, the data types that Employee has.

And of course, in addition to the fields or the data that represents the employee, we can also specify a bunch of methods. And these are operations that might, again, you allow on the employee object. And those are, for example, setting a name or raise the salary. Again, setting a name would be an example when somebody gets married or divorced, then a name change can actually change in this case. And of course, Raise Salary would be when somebody gets a promotion or a raise and so forth.

Continuing with that, and now looking out the concepts. So whenever we look at the concept of encapsulation, engineering folks, when we talk about Java, the whole idea behind this is to be able to represent an object so, in a sense, we can have an object. And in the object, we have a bunch of data.

And we would like, somehow, to protect that space where we can put any type of data here or attributes of the object. And we want this data to be hidden. And on the other hand, what we could do is we could provide, in this case, an interface, when in this interface, we can go ahead and put a bunch of methods. And those, we can actually call them behavior.

And in the behavior, we can specify what type of methods, actually, in this case, are inside this behavior piece. And the whole idea behind this when we have a client in this case, or a user that wants to interact with an object in this case of typeEmployee employee. Then we have the user here, and that user, pretty much, will go ahead and interact and maybe manipulate data of the object through, in this case, the behavior, through the operations.

That's the whole idea behind encapsulating. So we do not want the user to access the data directly. But instead, we want the user to make use of the behavior of the method so that we can specify what is it that they can choose and how can they-- what is it that they can modify, and how can they modify it? We want to make sure that, obviously, we control how data is modified inside the object.

So continuing with that, here's how in Java we can actually look at that. So one way to hide the implementation details is to declare all the fields private. And this is exactly what, earlier, our colleague, that's when he was talking about the examples that we've seen. And he mentioned that.

He said, well, wait a minute, if you remember, I said we're looking at those fields. And of course, those fields are public. At that time, we declared them as public. And of course, in that case, we said it is a bad idea. It's actually a bad practice. So it's a good idea to declare these as private.

Then what does it mean? Well, declaring those fields or attributes or instance variables as private prevents direct access to this data from a class instance. So for example, in this case if you create an instance of type Checking Account, and then you want to now access it through the dot operator to be able to set it to, for example, hit $1 million, this is not going to work. Obviously this would be illegal.

So the idea is to declare your fields as private, and then, in this case, specify a bunch of methods or operations through which you actually allowed to access these data members. And by the way, in this case, it would be the classes that belong to the class itself. So making, again, these, whenever you declare customer ID name and amount, these are all private, which means they are hidden from the outside methods of the class.

But then, at the same time, you can actually access these fields through the methods that you specify in the class, which is setAmount, in this case, and getAmount. So for example, these are methods that belong to the same class as the fields here, customer ID name and amount, which is within the checking account class. So these methods, of course, can access this private data. But then these private fields here cannot be accessed from outside.

Continuing with that, and looking now since we discussed the private, let's go ahead and look at now the concept of public and private access modifiers and what they mean. Well, the public keyword, in this case applied to the fields or methods, what it does, it allows pretty much any class in any package to access the field or the method. So that's what we mean by "public." Lots of times, we also call it "universally access."

And the only one, which is private keyword, this is applied to fields and methods and allows, of course, access only to other methods within the class itself in that set. So in this case, for example, when we create a new instance of CheckingAccount, and then we want to access, which is referenced by, in this case, the reference variable called chk, so in this case, of course if you want to access the amount and set it to 100, obviously this would give you a compiler error.

On the other hand, if you use the set method that we've seen earlier before, if you're using this setAmount, method, then this works very nicely, because this can access, in this case, the attribute or the field or the instance variable amount of the current object, and of course, assign to it the parameters that you're passing here, which is amount. So that works very nicely. So of course, that's why, in this case, when we call a setAmount, the method, on the reference variable chk and pass to it 100, that was without any problem.

So the private keyword can also be applied to a method, to height and implementation details. And of course, again, here is an example where we have applyOverdraftFee. And in this case, it will go ahead and add that fee to the amount in this case. So again, in this case, this method can be called when the withdrawal exceeds the available funds.

And in this case, we decided that this method is private, which means this method can be accessed only from where? Only from methods within the class. And that's it. So lots of times, we actually have these methods that are sensitive to your business logic. Then, of course, they are used for only internally. Then, in that case, we declare them as private, and then we can make use of them from the methods within the class. Everybody's following, folks? Good.

## 2. Encapsulation and Subclassing, Part 2 - 8m

And now look at revising the Employee example. So you take a look here at the Employee class, which by the way, before used to use the public access to all of these fields, now to encapsulate the data, what we do in this case, to make the fields all private and that's exactly the best practice that we want, folks. We want this practice, where all data, in all the fields, inside a class are always private and then we provide these matters and, typically we call them setters and getters, to be able to access and modify the data. You also can call those methods, all the setters and getters, a lot of times we want to call them-- to make, for example, instead of using a set amount it might be a good idea to call it a withdrawal or deposit. Because it makes sense, the withdrawal is taking money out of the account and then deposit is adding money to the account.

Continuing with that, and now looking at a Method Naming, Best Practices. Well, all of the fields are now hidden using the private access, again there are a bunch of issues with the current Employee class. Why? You can of course, in this case, looking at the set of methods that we see here, the set of method here currently is a public access and allows other classes to change the ID and the social security number and the salary put up or down. OK. So this is of course, an issue that we need to think about. The idea behind this folks, is also to think about the security of your code. So we always say, in addition to handling authentication and authorization, as part of the security, we also need to provide an interface where we give to the client only what we want to give to the client and nothing else. OK, nothing more.

So we need to also think about that and of course, the current class does not really represent the operations defined in the original employee class. So again, two best practices for the methods that we would love to actually add, in this case, and they are folks, they are hide as many of the implementation details as possible. We do not want these implementation to actually be all up there and everybody can see that implementation, so we don't want that. And of course, the second one is name the method in a way that clearly identifies its use or functionality. So again, in this case, what we're trying to do in this case, is we're trying to make sure that the method name, in this case represents and fits the semantics of your application. Again, the original model of the Employee class had a changeName and increase Salary operations. And those, again, maybe, hopefully, those would make sense because we know that changeName would change the name and increase Salary is going to increase the salary. That's the idea behind making sure that methods do actually have names that clearly identify their use, identify their functions.

Continuing with that, let's go ahead and look now at a refined class, Employee class. So if you take a look at this refined Employee class you would see that we did a good job, in this case. Let's go ahead and take a look at what we've done here. We have the class Employee, of course we have a bunch of fields we're not showing them here, and those are all the private fields, and then a constructive, but in addition, if you take a look here, you would see how the set name now is obviously written in such a way that we do a little bit of checking.

So take a look for example, here so we removed all the setters and all that so now we have a set name just for the purpose of, again, understanding the lecture, we pass a parameter here of type string called newName. And if you take a look here, first of all, when we pass it we want to make sure that the new name, or the parameter newName that we're passing has to be at least, what? Not null, so that's good. And then if it's not null we'll go ahead and do, what? We'll go ahead and in this case, and use it to set the name of the-- so again, in this case, this method, names, makes sense in the context of the Employee set and name.

And your other one is raiseSalary. Again, the same thing, we pass in this case, a parameter of type double and then we use it, of course, in this case, to increase the salary of the employee or the instance of the employee. So in this case, you would see that this would make more sense. Of course, we can always make these methods as smart as possible. For example, raising a salary we can go ahead and maybe over there find the percentage of the salary that we are trying to add and making sure that we're adding something that is not null and so forth.

Continuing with that. And now let's go ahead and look at making classes as immutable as possible. Here is a very good example. Let's go ahead and study this example to give us an idea about what is it that we're doing. So we have a class called Employee, it has a bunch of private fields and then it has a setter name and a get name and, of course, the implementation, we've seen the many examples of these implementations of these or the definitions of these methods in the earlier slides, but look what we've done here. Now we have a, how do you call this, folks? Anybody? The one that I just highlighted, what is that?

This is a constructor, if you take a look here, again, you see that this again, here we remove the default constructor and what we did, is we implemented the constructor to set the values of all fields. So for example, here with this constructor that takes an integer representing the employee ID and a string representing the name and the next string representing the social security number and then the next one, which is a double representing the salary. Look what we do. We use these parameters to initialize the fields of the current objects. So that makes sense, by the way, here because in general, folks, when we build objects or in general, when we take a look at objects that we work with, for example, let's take a look at an example of, in this case, a car.

So whenever a car manufacturer like Ford or GM or Chrysler or Honda, whenever they build a car, it has a specific initialized- of course it has data members like a maybe the paint, the number of doors, the braking system, this and so forth. So of course, all of these will be initialized in the factory so you never see, for example a car that is built without the color. It has to have a color, either blue or black or green or red and so forth. So the idea behind building these, again, these objects and of course, creating a constructor like this, that will go ahead and in this case, and initialize these data members. So in that case, of course, you have the initial values and in this case, you do not need methods, like a set of methods to be able to actually initialize that data. It's all done in the constructor in this case. Everybody's following, folks? All right.

## 3. Encapsulation and Subclassing, Part 3 - 12m

Now looking at the concept of creating subclasses. So obviously folks, as you know, Java is an object-oriented programming language. And lots of times what we do is we use it to create objects, create classes that represent objects, because after all we know that classes, they're nothing but blueprints that allow us to instantiate object through constructors.

So again, we created a Java class to model the data and operations of an Employee. And now again, suppose that now we want it to specialize this object which is Employee and make that Employee a Manager. Specialize the data and operations of the Employee to represent, of course, a Manager.

So we know we can go ahead and override that class. And this class called a class Manager, and it has of course a bunch of private data in this case. As you see, it has employee ID, a name, a social security number, a salary. If we take a look at these folks, we already have seen this before. And then in addition we added, because the person is a Manager.

So the person is a Manager we added now an extra field in these case, representing the department name. Everybody sees that? So representing the department name. Of course in this case, that representing the department name means in this case that this is an extra field that did not appear in the Employee, but in our class, but now appears in the class called Manager.

One thing if you take a look here you will see, and that's why we said, hey, wait a minute. This code looks very familiar to us, because we already have seen these folks. And all of these belong the class Employee. So now what we're doing is, again, we are copying and pasting this set up, this code. We're using this code that already exist in the class Employee.

So the question is, how can we now avoid this redundant code that appears in every class that we create? Imagine now, the next thing that we're going to create, a Director, and then we created a Senior Director, and then we create a class representing a Vice President and so forth. In this case, we're going to have a lot of these classes that contain the same type of code, or lots the same type of code. So this would be a lot of redundant coding.

Can we find a mechanism by which we resolve this issue? And that lead us to the concept of subclassing in Java. So if you take a look at the concept of subclassing here, you will see that we can have a class called the Employee, and this class Employee has an employee ID, a name, a social security number, and a salary.

And it has, of course, has a constructor, it has setName, raiseSalary, and a bunch of other methods. And from it since a lot of this code is similar, or a lot of these fields and methods similar to the ones of the Manager, so what do we can do is now we can make the class Manager inherit from the class Employee.

And then in this case, we add only the extra. In this case, we add the extra attributes that we added, which is the department name. And of course, we can go ahead and create a constructor for the Manager. And we can go ahead and also create extra methods, for example here, getDepartmentNumber. That would be another one method, a new method that did not exist in Employee, but it would make sense to create it for the class Manager.

Everybody's following, folks? So far so good. Good.

And so that's the idea behind, again, creating this concept of inheritance.

And obviously, many of you are already familiar with that.

Now how do we represent a Manager as a subclass of an Employee. That's the question that we typically have. And in Java, it's very easy. We use actually the keyword, in this case extend, and that's how it actually works in this case.

So we have a Manager that extends Employee. And inside the class Manager all what we we do here, ladies and gentlemen, is put only the extra fields that exist in Manager, and they do not exist in Employee. As you see here, all the fields that are part of Employee, they're automatically inherited by the class Manager, and we don't have to write them again here. So we wrote only the extra field that actually belongs or is specific to the class Manager.

And of course, it has a constructor. Take a look at this constructor. This is even better. So if you take a look at the constructor of the Manager here, you will see that it takes an employee ID, which by the way it inherits from the superclass, in this case the Employee. It has a name and a social security number and a salary and of course a department. And of course, now look what we do here. Now we call super, and then we use the keyword super, and we pass through it employee ID, name, security number and salaries.

So if you take a look here, you will see that the super keyword here is used to call the constructor of the parent class. Sometimes in Java, by the way, we call it also the superclass. So it must be the first statement in the constructor all the time. We'll get to the super soon.

And by the way, this will be always at the beginning as the first statement after any initialization that you do. It turns out that the only initialization that we're adding here, folks, is what? It is the department. And we're using it, in this case, this.deptName. And we initialize it with the parameter that we're passing here, which is Department.

And of course we have a getDepartmentName and setDepartment. Now here, we showed you only the example of getDepartmentName, but it returns the department name. And of course Manager also gets all the Employee public methods that, of course, belong to the Employee class, which is the parent class, or the superclass. Everybody's following folks? OK, good.

Continuing with that, and now looking at constructors. And by the way, constructors by definition in Java, folks, they are not inherited. Every subclass inherits the non-private fields and methods from its parent class, superclass. And the only thing that you folks need to remember is that the subclass does not inherit the constructor from its parent. It must provide its own constructor. Now, remember that all the time. So it has to write your own constructor.

And of course, you can use default constructor. If you do not create a constructor, a default no-argument constructor is provided for you. And of course, if you declare your own constructor, then the default constructor is no longer provided. That's typically how it works in Java.

So remember folks that constructors or constructor declarations are not members. So they are never inherited, and therefore are not subject to hiding or overriding.

Let's go ahead and look now at the super keyword. Well in this case, the Manager class declares its own constructor and calls the construct of the parent class using the super keyword. That's pretty much how we do it. So in this case Manager, in the constructor, if you want to create a constructor for the subclass which is Manager-- And of course in this case, we can make, use, or we can have the constructor of the Manager call the construct of the Employee. How do we do that? By calling super that you see, like the one that I just highlighted here.

So the super keyword, by the way, is used to call the parent constructor. It must be, by the way, the first of the statement of the constructor. And it is not provided. Again, a default call to super is inserted for you automatically.

And the super keyword may also be used to invoke the parent's method or to access the parent's non-private data. Now, remember that private data can be accessed only by what? By the methods that belong to that class. So remember that the super keyword can also be used to explicitly call the methods of the parent class or the non-private fields.

Continuing with that, and now looking at constructing a Manager object. So here's an example where in this case we wanted to create an instance of type Manager, which is, again in this case, the same as creating an instance of Employee object. So for example, here I have a declare a reference variable mgr of type Manager, and then I call the constructor, in these case, and pass to it the ID, the name, the social security number, the salary, and of course the department. And in this case of course, all of the Employee methods are available to the Manager, by the way.

So for example, the Manager can raise the salary. And the Manager class also defines the new method to get the department name, which is this one here. So in this case, whenever we call, if we now create a new instance of Manager, what's going to happen is it's going to call this constructor that we've seen earlier, which is this one here. But it's going to go ahead and first call the super, which is the constructor of the parent, and then after that initializes the department. So pretty much, this is what we wanted to say about constructing a Manager object.

Continuing with that, let's go ahead and look at the concept of polymorphism. Polymorphism is a quite interesting topic in Java and objects-oriented in general. So what does polymorphism mean? Well, strictly defined, it means and in many different forms, it takes many different forms.

So for example here, we can go ahead and declare an instance of Employee and then initialize it with the new instance of Manager. Is this good? Of course. That's perfectly normal. Why? Because a manager is what? Is also an employee. So that makes sense. So this assignment is perfectly normal. An employee can be a manager without any problem.

However, how about if you want to do this? On the Employee reference variability, emp, we invoke the setDepartmentName and pass Marketing to it. Ah, here we've got a problem. This is going to have a compile error. Why? Because we know that the Employee class does not have a setDepartmentName.

So obviously, in this case, the compiler always checks if the method belongs to that class. In this case, it turns out that it does not belong to the class Employee. And of course, it's going to scream at you in this case and gives you a compiler error. So the Java compiler, remember one thing folks, the Java compiler always recognizes the Employee variable only as an Employee object, all the time, all the time, all the time.

Because the Employee class does not have the setDepartmentName, then of course that's why we see the error. So we now know that we now have an idea about this is acceptable. This is acceptable, but unfortunately, this is not acceptable.

Everybody's following the idea, folks? Everybody's with me? Good, good, good. Let we know if you have any questions, please.

## 4. Encapsulation and Subclassing, Part 4 - 18m

Ah, looking at overloading methods. Well, your design may call for several methods in the same class with the same name but different arguments. So for example, here I have a print integer and then here print float, different argument, string, and so forth. Java actually permits you to use method names for more than one method. OK?

And of course, two rules apply to overloaded methods, all the time, all the time. Argument lists must differ, and return time can be different. OK? So for example, if you have here print, same name, this takes an integer, this one an integer but this one returns void and this one returns string. Of course this is a illegal. What did we say? We said that they have to have the same name, but they have to have what? Different argument lists.

What do you mean by the argument list must be a different? What you mean by that? Either the type or the number of parameters that you're passing must be different. That's what it means. OK? But on the other hand, the return type, it could be different.

Here the issue that we have is they take the same argument, but then they return two different types. Of course, this is not acceptable in Java. Everybody's following, folks? Everybody's with me? Good. Good, good, good, good, good.

Continuing with that, now let's take a look at methods using viable arguments. This is interesting, folks. So here, a variation of method overruling is when you need a method that takes any number of arguments but, folks, of the same time. That's important, of the same time. For example, here I have a class called Statistics, and in it I have the average that takes a couple of integers. This one takes three integer, and this one takes four integers. And it says average, most probably it's averaging these integers. OK?

So again, these three methods are, of course, overloaded, and they share the same functionality. Can we now find a mechanism by which we can collapse these methods into only one method? This is a good idea. And we would love to actually have that. OK? So this is just to show you some of the code and how it's written. So this is the implementation of the methods.

The first one takes two integers and returns the average of the two. And the second one here takes three integers and returns their average. And the fourth one takes four integers and returns their average? Everybody's following? OK.

All right. So now what we want to do is we want to take a look at a variable, because remember, folks we, said that it would be nice, it would be nice to collapse these methods into one method. It turns out that Java SE 5 introduced that, starting Java SE 5. So here's a very nice method called the methods using variable arguments. And by the way, lots of times we call it varargs. So the Java provides a nice feature called varargs, which was introduced in Java SE 5, or variable arguments. And what it does is actually represent this very nicely.

So here's varargs. So here, in this case, I have Statistics class, which, by the way, I changed now where I have an average method that takes, again, in this case, the varargs notation treats the numbers parameters as an array. So here I have Int, which is the type. And then we have an ellipse here. And then I have in the three ellipses, and then here I have what? The name of the array.

And of course, in this case, I'll go ahead and declare a local variable called sum and initialize it with zero. And then, in this case, I use what? The enhanced for loop or what we call for-each loop, iterate through the array, in this case, nums, and of course take all those integers in the array, and of course add them to sum. And then after that, I return, of course, the sum divided by the length of the array. And of course, I cast that into an object of type float because I wanted the average to be returned using type float. Everybody sees that? So that's the idea behind it.

So by the way, this is fairly new in a sense it was introduced in Java SE 5. We will see the varargs as optional parameters in use in the NI2 API in the lesson of the Java file I/O API later on. You got a question?

What are the databases supported?

Say it, again. I'm sorry.

[INAUDIBLE]

Oh, all kinds of types. All kinds of types.

Can you have other kinds of data?

Yeah, you can have strings. You can have pretty much any type of objects. The question, what that the data types that we can use? You can use all kinds of types. There's no problem. The other rule is how can we use this varargs? So it has to be either at the beginning or at the end, but not in the middle. And you cannot you cannot have more than one. So we'll see that in the next slide. Thank you, Majeet for your question. Great.

At some point in time, we'll look at that. OK? So we'll look at that. And let me see if it's here. No, it's not here. But I'll tell you about some of the rules that you have in here. OK?

Continuing with that, and let's go ahead and look at the concept of single inheritance. It turns out, folks, that Java programming language permits a class to extend only one other class. OK? This is called a single inheritance. Some of you are going to look at me and say, wait a minute. This single inheritance, don't you know I went through C++, and C++ supports multiple inheritance. So how come now we have Java single? Is it a disadvantage?

The answer is not a disadvantage at all, folks. When we get into the concept of interfaces, we are going to see that, pretty much, you can achieve that concept of multiple inheritance and even better than C++. It's even better than C++, very flexible, and we have lots of advantages when we make class interfaces.

And there could be more than one interface, and we'll talk about that when we get into interfaces. Everybody's following? OK, good. So again, although Java does not permit, like I said, more than one class to be subclassed, the language does provide the features that enable multiple classes to implement the features other classes, and that's the concept interface. And we'll talk about that later on.

And here, pretty much, if we take a look at the inheritance here, we have an employee class here. And of course, the whole idea behind using an inheritance so that we can capture the generalization in the superclass and then specialize the specialization in the what? In the descendant classes or the extended classes. That's the idea. So we want to capture the generalization, for example, in this case, in the employee class, which is the superclass and get the specialization into the subclasses, or what we call, in this case, the extended classes.

And that's pretty much what we wanted to discuss with you in this particular topic, folks, which is in lesson number three. We looked at creating simple Java classes. We looked at the concept of encapsulation. And so now here's a question. What do we mean by encapsulating properties in a Java class? What does it mean?

Look how I said properties, which by the way, could be what? Could be fields, could be methods. What is it that we need to do to encapsulate either methods or fields or attributes inside a class? What do we use?

Private.

The private. Thank you. And model business problems using Java classes. We did that. Again, we looked at how we can model business problems using Java classes. We looked at making classes immutable. Remember how we used the constructor to actually initialize the fields of instances of your class. We also looked at creating and using Java subclasses. We just, again, looked at that.

We also looked at the concept of overloading methods. OK? We looked at overloading methods. What does overloading methods, by the way, mean, folks? It means that you can use the same name of the method and then what? But different types or a different number of attributes, parameters that you pass into the method.

Can overloading methods return different types? The answer is yes. Good. Thank you. And by the way, we also looked at a very nice feature, which is what? When a method accepts more than one parameter of the same type. We actually looked at this new feature that was created starting Java SE 7, which is called what? Varargs. Good. And that's when making use of the variable arguments methods, and that's the one that we, again, discussed. Everybody's following?

[INAUDIBLE]

Java SE 5, but now, of course, supported in SE 7 too. But it was introduced in SE 5. Good question.

So here's an example, again, in this case, we have, given the diagram in the slide, again, titled Single Inheritance and the following Java statement, which statement does not compile? What do you think, folks, in this case? Which statement does not compile? So we have an employee initialized with an instance of director. Here we have a manager initialized with an instance of a director. And then we have here an admin and an instance of admin.

So here we have e.addEmployee a, m.addEmployee a, and then m.approveExpense, and then all of them fail to compile. Which one do you think? Anybody?

[INAUDIBLE] A.

I'm sorry.

A.

A? A here, which is what? A is an employee, and we add what? And addEmployee and, in this case, A is what? Is an instance of admin. Can admin be an employee? Of course, here, because we have a director here. So that's, of course, in this case, would not.

How about this one here? What do you think?

[INAUDIBLE]

I'm sorry?

[INAUDIBLE]

Oh, show you the diagram. OK. Here it is.

[INAUDIBLE]

I'm sorry?

Admin can't be a manager.

Admin cannot be a manager. Good job. So that cannot. And how about the second one? Can an admin be a director? No, of course. How about the third one? m approve, OK. That's good. Good. Good job.

How about the next one? Consider the following classes that do not compile. OK. Account, which has a balance. And of course, in this case, we have an account that takes a balance and then use it to initialize. And then we have savings that extends an account. And then we have double, and we have a savings, in this case, that takes a rate, in this case-- and of course this is a constructor-- and uses the rate to initialize the interest rate.

What fix allows these classes to compile? What do you think? Add a no-argument constructive to savings, call the setBalance method of accounts from savings. D, add a constructor to savings and calls the constructor of account using super. Good.

Here's another quiz. Which of the following declarations demonstrates the application of good Java programming convention? What do you think, folks? What did we say about the class? Always the first letter of the class has to be capital. So this is not good. Right? What did we say about methods? We said that the first character of the method will be always lowercase. So that's not good. And what did we say, again, this is private, about--

Which ones have capital letters? Only what? Constants. So this one here, you see that the method starts with a lower case character. And then we said that every word starts with the capital letter. So as you see here, and, of course, here, the xCoordinate and yCoordinate make sense. So it turns out that D is really the right answer. Got that? OK, good.

Here's another one. What changes would you perform to make this class immutable? Ah. What do you think, folks? Remember, we've seen that. What changes would you perform to make this class immutable? Look this class called Stock, it has a public, so obviously those will be in the private. That's one thing. And then it has get stock value, set symbol, set price, set share.

Instead of using these, what do we do? Somebody just mentioned something. Sandia? Yeah, use a constructor. Add a construct that takes symbol, shares, and price as arguments. Got that? Good, good, good, good, good.

And of course, we have a set of practice labs that we are going to do for this particular lesson, Lesson 3. And this would be, again, applying an encapsulation principle to an Employee class that you created in the previous practice. Create subclasses of Employee, including Manager, Engineer, and Administrative assistant. Creating a subclass of Manager called Director, creating a test class with a main method to test your new classes.

Of course in this case, this will lead us to the activity book where, in this case, we will look at the practices for lesson number three. Well, in this case, we wanted you to first start with the first exercise where you create your subclasses. These would be the subclasses Manager and Director and Admin and Engineer. So you go through all the steps and do that.

Next creating some details. By the way, when you do the practice labs, always the first set in Practice 1 here, we don't give you any details. If you need more details, then you can go ahead and look at the second one that gives you more details about the practice about the lab. It will give you more information to be able to do your lab.

And this one, again, Practice 2, which is optional, we give you at the beginning adding a staff to a manager, again, in this case. And of course, you can look at the non-detailed part of this exercise or you can look at the details part of this exercise and adding, in this case, more of the details about that. So even though it says optional, we encourage you to try it. Give it a try and do it.

And then, of course, after we finish with this, we'll go to the next lecture. OK? All right. We'll go ahead now and do the practice labs for Lesson 3, which by the way start from here. There are a couple of exercises. And after we finish with this, we'll go to the next lecture.

## 5. Practice 3-1: Creating Subclasses - 10m

After looking at lesson three where we discussed encapsulation and subclassing, in particular we looked at the use of encapsulation in Java class design, we looked at modeling business problems using Java classes. We also looked at making classes immutable, creating and using Java subclasses, overloading methods, and using variable argument methods. Let's go ahead and look now at practices for this lesson three.

And we start by looking first at the practice three, that one looking, of course, at the detailed level where we create subclasses. In this practice they asked us to create, in this case, hierarchy classes where we have a superclass called the Employee, and from it we actually extend a class called Engineer, a class called Manager, and a class called Admin. And we also made the class Director inherit from the class Manager.

So first we create the project. And of course, that project is pretty much, in this case, called EmployeePractice. And on it we'll go ahead and create the different classes in our case here. So first we'll start with the Employee class. We said apply the encapsulation to the Employee class, open that, and of course set, in this case, the fields. That would be, of course in this case, that would be private.

Plus in addition, we add a method called raiseSalary. That takes a double to increase the salary. And after that we're going ahead and create a subclass called Manager. And the Manager, as you see here, constructor takes an employee ID and name, social security number, a double and a department name. And there you see how we call the super, which is the constructor of the superclass.

And after that we assign the department name to the department name. We know that this in this case, resolves the ambiguity between the distance fields or instance attributes and the parameter that you'd pass into the constructor. And then of course, because they have got the same spelling here, which is OK by the way.

And then, of course, after that we have a class Director that extends Manager. And here, obviously we're trying to create, in this case, a class called the EmployeeTest that will test our classes, in this case, with the data available to you. So really again, in the activity diagram in this case, and following creating the first that we work on. In our case here, the instance of the Employee, the instance of the Manager, and the instance of the Admin, the instance of the Director.

And then of course here is the printEmployee method that they asked us to add here in the EmployeeTest class, so that we can print the information related to the employees. And those gives us [UNINTELLIGIBLE] as optional. We say we go ahead and set the name and then of course raise the salary in this case and print the employee. Save and test the whole thing.

Let's go ahead and look at this in NetBeans. So first we have the Employee. And let's go ahead and look at first the Employee class where now we've decided that all the data in this case, the fields are private, which is we're creating the encapsulation as the constructor. And then all the sets and methods that we already went through.

Here in setName, we're making sure that the name value is not on a null or empty. That's why we use this if statement. Raise the salary, of course, the increase has to be greater than zero to raise that. And then we made a Manager extend Employee, as you see here in the constructor. We call the superconstructor, construct of the superclass, which is Employee in this case. And then we also have an extra attribute in this case, or an instance variable that belongs to the class Manager.

And of course here, we use the department name that we passed to initialize the department name. And also of course we have a method that allows us to get the department name. And by the way, all the rest of the methods and attributes are inherited from the Employee class for the Manager.

We also made the Employee Engineer extend the Employee. And as you see here in the constructor, we just call the superconstructor or the super, which means the constructor of the superclass. And we also made the Director extend Manager. And the Director itself has a new instance variable to it, which is a budget. And as you see here, how the Director or constructor calls first the constructor of the superclass Manager. And then, of course, after that initializes the budget, and has a method called getBudget.

And by the way, it also extends all the methods that belong to the Manager class methods and, of course, attributes. And we know that Manager extends Employee too, in this case.

And the last one, which is the Admin, the Admin class in this case extends Employee. And it's kind of similar to the Engineer except that it's an Admin. And of course, it calls the super, which is the constructor of the superclass.

And then in the Test class, which is EmployeeTest that has a main method, we create an instance, in this case, of Employee. Let me just move NetBeans a little bit, so that we can see the information on the editor. So first we create a new instance of the Engineer and we pass 101 Jane Smith and social security number and, of course in this case, the salary or the instance of the Engineers. And then we create a new instance of the Manager. Same thing with the department here, US marketing.

And then after that we create a new instance of Admin. And we pass the data to initialize, in this case, the values to initialize the fields of the instance of type Admin. And we create a new instance of Director. The same thing, except that in this case we have a marketing in the global marketing department. Plus in addition, we have a budget, which in this case is $1 million. You see how we use this quote to separate the different values. And that's acceptable because this is supported Java SC 7.

And then after that we'll go ahead and call the printEmployee method, pass the instances Engineer, Admin, MGR, and Director. And of course here we print the salary and set the name by just printing a message in this case. And then after that, call the printEmployee, which by the way, has a bunch of printlns that will print employee ID, the name, social security number and so forth, and the salary.

And in this case as you see, we're using the number format from it to invoke the getCurrentInstance. And on it I invoke the format method and pass to it the Employee getSalary, which by the way, is cast into an instance or into a double in this case.

And if you run it, it pretty much gives us the output here for the Employee and of course the employee ID, first of the Employee and second the, in our case here, the Admin and the Manager and the Marketing Director. And here is again testing the raise on the setName on a Manager. And that gives us, of course, this is by looking at what we've done here, setting the name Barbara Johnson-Smythe, and then of course are raising the salary by $10,000, and of course in printing the information.

And then after that, we'll go ahead and I can always set-- since we run it obviously in this case, we see all the information here that is produced through the printEmployee method. And that pretty much ends practice one of lesson three.

## 6. Practice 3-2: Adding a Staff to a Manager - 11m

Let's go ahead and look now at practice two of lesson three, which is by the way optional. In this practice, what we do is we'll modify the Manager class to add an array of Employee objects, a, staff course to the Manager class, and create methods to add and remove employees from the Manager. And finally we add a method to Managers to print the staff names and IDs.

So as you see here, pretty much we are going to focus more on the Manager class, where in the Manager class we will go ahead and declare a private field called staff, that is declared as an array of employee objects. Again, we'll need to keep track of the number of employees in staff, so we create a private integer employeeCount to keep a count of the number of employees, initialize the employee count to zero.

Again, in the constructor we initialize the staff array with a maximum of 20 employees. And of course, we add a method, findEmployee. This method scans the current staff Employee array to see whether there is a match between any number of the staff and the Employee passed in. And of course, returns minus 1 if there is no match.

And we also add a method called addEmployee that allows us to, in this case, pass an instance of the employee and add it. Again, the method should return boolean value and take an Employee object as a parameter. The method should return true if the employee was successfully added and false in the employee already exists as a member.

And we call the findEmployee method to determine whether the Employee is a member of the staff already, return false if there is a match. And we add the Employee object to the staff array, in this case, and increment the employee count to true.

We also need to add the method called removeEmployee. This method is a little bit more complicated. When we remove the element from the array, we must shift the other elements to the array so there are enough empty elements. Again, the easiest way to do this is to create a new array and assign a copy of each of the staff elements to it, except for the match. Again, this effectively removes the match from the array.

So in general what we do is we declare a local boolean variable, initialize that to a false to return as the status for the method declared temporary array of the employee object to copy the revised staff array to. Code declare an integer counter of the number of employees copied to the temporary array. And use the for loop to go through the staff array and attempt to match the employee ID of each element of the staff array with the employee ID of the employee passed into the method as a parameter.

Of course, if the employee ID does not match, copy the employee reference from the staff array to the temporary array from the step b. And of course, increment the count of employees in the temporary array. If there is a match, skip the employee by continuing to the next element in the staff array and set the local boolean variable from step a to true. And if there was a match, again in this case a local boolean is true, replace the current staff array with the temporary arrays and the count of employees with the temporary count from step c, return the local boolean variable. Add a method called printStaffDetails, and this method prints in the name of the manager and then each of the elements of the staff.

Going back and looking at how we are going to set this class Manager and modify it. So you see that we have now the method addEmployee added to the list, again in this case. And you see we use an if statement. If findEmployee is different than one, then return false. Otherwise, just go ahead and in this case assign the e to the staff employee. And by the way, for this we declare it here an array called Staff, of Type Employees here. And in the constructor we declared that in this case, initialize it with a new instance of 20 employees in an array of size 20.

And then after that we increment the employee count to get us to the next empty location and return true. Find the Employee method, we take an employee and of course, in these cases, declare a result and initialize it to one inside a local variable inside the findEmployee. Use the for loop to each array through the number of employees. And of course use the e dot equals to find out if there is a match. And then return results, in this case obviously. If the match is right then set the i to result and return it. Otherwise, return minus 1, which means there's no match.

And then for the removeEmployee, this is the one that we said is a little bit more complicated. So we take a look here you will see that we take an instance of an employee, first were declare a boolean called employeePartOfStaff and set it to false. And then we go ahead and declare a local variable, which is an array of type employee-- It's called newStaff-- and initialize it with an array off 20 employees of Type Employees. And then of course, declare a local variable called newEmployeeCount and set it to zero.

And then use the for loop either to iterate through, again in this case, the array and find out if, in our case here, the employee ID, the one that we want to remove, matches one of the employee IDs inside the array. If that is true, go ahead and set the employeePartOfStaff to true. Else, we'll go ahead and in this case assign the staff i to the newEmployeeCount and increment the count.

And of course, was the employee found? If yes, we use the updated staff array. So in this case if the employeePartOfStaff is true, we'll go ahead and set the newStaff, initialize with its staff, and then of course initialize the employeeCount with a newEmployeeCount. And then after that return the employeePartOfStaff, in this case which is a boolean. So of course if it's true, that means we'll move the employee.

And then we have the print staff details, and that pretty much allows us to, in this case, print the employees. We're using a for loop in that case of course, and using the printer LAN. We'll reprint the name and the employee ID.

Now of course, we need to have a test class to handle that. And here's the test class called EmployeeTest. First of all, we create a couple off variables of type integers, or reference variable of type integers, initialize again, initialize with the new instances of type of engineer, one with the 101 ID, the other one 120, plus the names Jane Smith and Bill Leconte and so forth, and the social security number and the salary.

And then of course, we create a new instance of manager, we create a new instance of admin, and create new instance of director. And then after that we'll go ahead and print, first of all, engineer one engineer two, employee, admin, and manager, and director. And then after that, we'll go ahead and set the name and raise. This is just to test the raiseSalary Salary and setName on Manager.

And in this case the next code here, where first we'll go ahead and print the blank line as a separator and then inside the if statement we'll called the addEmployee and pass to it the ADM. And then that of course in this case, adding the admin, in this case, to the array that represents the staff for the Manager. And then of course print if there is success. And we do the same thing by adding the engineer one and engineer two to the list. And then of course print a blank line as a separator.

Then after that we'll go ahead and print the staff details, print out the staff. Then we'll print an empty line for a separator. And then after that, we'll go ahead and remove, in this case, engineer one from the staff and print the staff again. And then after that we have the method printEmployee that prints the employee information for us, which is the ID, the name, the social security and so forth.

So if you run this, folks, you will see that obviously in this case-- let me just make this slightly bigger so that we can see the output. We see that first of all it prints, in this case, the employee ID Jane Smith and then Bill Leconte, which by the way, they're both engineers. And then Bill Munroe, the admin, and then Barbara Johnson and then Susan Wheeler. And set the name, again, testing setName and setManager.

And then after that course OEC, we added the admin, the engineer one and engineer two, again staff of Barbara Johnson. And we'll go ahead and see print Bill and Jane and Bill Leconte. First one is Bill Munroe, and then we'll move engineer one, and then we print again. And now you see how in this case engineer one is not there anymore, and who is, by the way, Jane Smith. So instead, we have Bill Munroe and of course Bill Leconte who is engineer number two.

And that pretty much ends the practice two of lesson three. Thank you.
