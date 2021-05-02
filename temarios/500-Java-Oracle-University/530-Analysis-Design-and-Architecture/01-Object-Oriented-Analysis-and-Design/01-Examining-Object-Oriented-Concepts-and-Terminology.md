# 01. Examining Object-Oriented Concepts and Terminology

1. Examining Object-Oriented Concepts and Terminology, Part 1 - 19m
2. Examining Object-Oriented Concepts and Terminology, Part 2 - 36m
3. Examining Object-Oriented Concepts and Terminology, Part 3 - 10m
4. Lab 1 : Examining Object-Oriented Concepts and Terminology, Part 1 - 10m
5. Lab 1 : Examining Object-Oriented Concepts and Terminology, Part 2 - 5m

## 1. Examining Object-Oriented Concepts and Terminology, Part 1 - 19m

Module one talks about the various concepts and terms of object oriented technologies. So here in this lesson, we see we will talk about two things. Number one, we will talk about the concepts. And number two, we will talk about the various terms.

We'll try to understand the terms like what is an object. What is class? What do we mean by inheritance, polymorphism, encapsulation, and so on?

Now, let's first take a look at a little bit back history of object oriented programming. So we understand before object oriented programming, we had something called as procedural languages. In these languages, we used to use the data types like int, float, cache, double, so which are only understood as the primitives. It is not the way how human beings think.

Human beings think in terms of objects. Like, I would like to think about a bike, or a car, or a table, or something like that. So we find that object oriented programming comes more close to human thinking by introducing the entities in the form of objects.

And objects, like, it can be anything. It can be an object which is visible. It can be an object which is more of a conceptual, like a window. So we find over here, in object oriented software development, both the problems and the solutions domains are modeled using object oriented concepts. And to represent those things in visual form, we use UML.

So UML is just a graphical tool, a bridge, between the mental model of what we think and something which can be depicted as an implementation. Now, talking about object oriented concepts, why do we use object oriented? In the procedural languages, when you create a software which may be big, more number of lines-- say 100,000 lines and so on-- the maintainability, the flexibility becomes difficult.

So we find that softwares are complex. These need to be decomposed. And the maintenance, flexibility, and extensibility cost should be brought down.

So let's talk about software complexity first. Software complexity talks about you have the systems which are complex and which can be broken down into smaller modules, or into smaller parts. For example, we can consider a software as a group of collaborating objects, whereas if we talk about procedural programming, the software can be considered as a group of interacting functions.

So here lies the difference. And depending upon that, we decide that what kind of entities or what kind of data must be primitive, and what must be abstract data type. We also talk about the inter and intra relationships among the various entities-- relationships.

Like for example, if I have all the UI components, how one UI component will collaborate with another one. Or if I have any business process, how this component will communicate with the business process? So keeping these unrelated components separate, we introduce a separation of concerns in the object oriented programming.

In addition to that, the object oriented softwares are comparatively start from the simple one. And they can keep on evolving as a complex software. For example, let us take an example of Amazon.

Say Amazon starts selling the books, and in the beginning it is only the selling of the books. But over a period of time, they can add onto this without much extra effort to add selling more items. Maybe CDs, maybe some other kind of products.

In addition to that, we see it now, over a period of time it has grown where it gives you a suggestion. If somebody read this book, they also look for this book. Or after reading a book, you can give your own reviews. So we understand the flexibility is much better in the object oriented softwares than in the procedural methodology.

Now, here's an example where we talk about how, and how a software is decomposed in the procedural systems. And we find over here-- let us say I'm taking an example of a procedural program in the C language. Now, we understand that the program will start with main.

Main may call another method called as, say, a main menu. And the main menu method may call a method, say, data entry and reports.

So here, what happens, the main method will be called. Main will call main menu. Main menu may call data entry. So it is one method, one function, calling another. Approach is procedure based or a function based.

As on the slide, we can see we have HR activities. So HR activities is a function which can call other two functions. Either it can call a function give employee a raise or give department a raise. Give employee raise, again, will have two different options. If the employee is manager, it may call give manager a promotion or a raise.

And if it is an engineer, it will do that. Same is the case in the case of department. But if we see the similar scenario, in the case of object oriented, we have a totally different scene over here. Let us take a look at that.

In object oriented softwares, we find that we have a department. And the department has employees-- employees. Now, these employees can be an engineer, say manager, and we want to give the same scenario.

So you want to raise a salary of an employee. Now, if it was a procedural, I will make something like this. I will check, if employee type is equal to, say, manager, I will call one method.

But in this case, by the use of polymorphism, I don't have to do any comparison. I can have an object of employee type. Either it can be manager object, or it can be an engineer object.

So depending upon that, when I say employee.giveRaise, it is automatically able to sense which object is in hold. Depending upon that, the call will go. That means when we are talking about software decomposition over here, we are talking from the perspective of the objects. So it is the department object can interact with employee. Employee, in turn, will either interact with engineer or with manager.

So here on the left hand side, department is one entity, which has many employees. And employees can be manager. Or an employee can be an engineer.

So here on the right hand side of the slide, we can see HR Service Object makes a call. Makes a call onto the IT department. Calls a method, get department a raise, which has many employees.

So when the call goes to the object Kathy, it calls the method from manager class. When the call goes to Fred, it makes a call from the engineer class, and so on. So we can see over here, in object oriented department, employee manager, engineer, everything is an object.

And these objects are collaborating or interacting with one another. Department has many employees. And employees can be either manager or an engineer.

In the object diagram here, we can see, the HR services makes a call to department for give department a raise method. And give department a raise method is called on various objects, either manager or an engineer. And this happens automatically, depending upon the kind of an object in hold.

Not only the other factors, but the software costs, are also brought down when we use object oriented methodology. We find to develop softwares using object oriented methodology is like the automobile industry, where you create all the spares. And whatever you require, you can put them together onto a certain combination.

So that brings more flexibility. You can extend your software in shorter time with less cost. In the procedural programming, we see that mostly 70% of the cost goes into the maintenance.

Say if you want to bring about some change, you have to study all of the previous interactions with the methods. Here, what you can do, you can just extend a new class. And you can add a functionality. You can nullify some previous functionality. Or you can substitute, you can overwrite the existing functionalities and you can bring about the change.

Comparing the Procedural and the Object Oriented Paradigm. We can see at the various factors. At our organizational structure level, we can see procedural paradigm focuses on procedures, or sub procedures, like functions, whereas the object oriented, it is a network of collaborating objects.

Say we saw previously that we have a department object. Department object communicates with employees. Employees can be of various types. So it is network of collaborating objects.

This object can communicate with this. And from here and the backwards. So we can see the communications of the various objects as a network of collaborating objects.

In the case of procedural, the data is separate from procedures, because data is not encapsulated within the same container where the procedure is. The data is passed from outside, whereas in the case of object oriented, data and the methods are both encapsulated together in a single container, making a single entity.

Protection against modification, data is difficult to protect because the data can either be local or global. But whereas in the case of object oriented, the data is within a particular object. Every object will have its own data. And it can be protected in a better way. You can completely protect the data from the outside interaction.

The ability to modify software, procedural paradigm is expensive and difficult. If you want to modify software, say, after two years, you want to add a new functionality. In that case, you'll have to understand all of the previous interactions. And a new added interaction may make your software comparatively brittle.

But here, in the case of object oriented paradigm, if the software is written following all the best practices and patterns, extending a software or changing a software is comparatively easier. If you want to make some decisions to call various versions of a method, in the case of procedural, we have to copy/paste various parameters.

And we have to send these, whereas in the case of object oriented, we can use polymorphism. We can decide that whether a particular object can be specialized into something else. And we can use generic and special components to perform.

Ability to modify software in procedural is brittle, because you have to know the complete previous understand-- you completely need to know what was happening in the methods and what changes you are making, whereas in the case of object oriented, if the software is written following the best practices and implementing all the patterns, it will be easier to modify the software.

Reuse is much more than the procedural. In procedural, you can only reuse the code, and the data has to be passed every time. Whereas in the case of object oriented, you can reuse the whole entity, either by implementing it with inheritance or with composition.

If you want to have some specialized execution, or you want to select depending upon certain conditions what method or what function needs to be called, you have to have a stack of if/and statements in the case of procedural, whereas in the case of object oriented, we can use polymorphic behavior.

The decision can be made at the runtime. So with this, we can add more. You can add the new behavior, or you can totally substitute the previous behavior.

## 2. Examining Object-Oriented Concepts and Terminology, Part 2 - 36m

In the second half of this lesson, let's talk about the various fundamental OO concepts. So we will talk about objects. We'll talk about classes, abstraction, encapsulation, inheritance, interfaces, polymorphism, cohesion, coupling, class association, and links of the objects, and delegation. Let us begin.

So first we'll talk about objects. Now what is an object? Object represents an entity in a software. And it has state and behavior.

State is collection of all the attributes or properties of that particular object. And behavior is the operations which it can perform. For example, if I consider a window as an object, so it has certain data, which represents the background color of the window, which represents the minimize, maximize, and close button of the window.

These all represent data. The size of window, all these are representing the state of an object. Because if I create another window, which will have a completely different set of attributes.

So the data or the state is unique to the object. But the operations of every object are common. All Windows of this type will have minimize, maximize, and close. So if I click on minimize button, it will minimize. Close will close the window, and so on. So this represents the operations.

Now what makes this window different from this window? That is the identity. So every object will have its unique identity.

In C++, the identity of the object is represented by the address of the object in the memory, whereas in the case of Java programming language, it is represented by the reference, which is also called as an object reference. So when we create objects of the same class, these objects will have similar attributes or same attributes and common operations. The attributes in every object will have different unique values, whereas the operations remain same.

This slide shows us the runtime environment of a particular object. We can see here, this represents the area of the memory where two objects are created-- branch and account. And the account object is allocated memory in the heap where this part of the object shows the attributes. And the lower half of this shows the operations.

That means every account object will have number, balance, and type where the values of these three attributes can be different depending upon whose account is it. And the operations are common. Every account object is capable of performing credit, debit, and get balance operations.

Coming to the classes. Now what is a class? Just now, we talked about the objects. Object is called as instance of the class. So in other words, I can say class is a blueprint, or a prototype, of a group of objects.

Or when I create a class-- for example, we took an example of window object. I may create a class called as Window. So I will say, for example, a private int size, private int x, private int y, and so on.

And here, we can say public void close. Write the code for closing this window, public void minimize. Now, this is a template or a prototype. And whenever I create an object of this template, say Window w1 is equal to new Window. And Window w2 is equal to new Window. These two will have different identity, unique values for attributes, and common operations. This is what we will have.

So class is considered as a blueprint, or a prototype, where we understand that it represents the metadata of attributes. The names like size xy, these are metadata signatures for the methods. What you want to send to the method, the data to be processed, and the implementation of the methods-- what the method is doing, this method is meant for what purpose.

And additional methods which are called as constructors, which are used to create an object in a particular way. You want to create an object with some, say, I want to create a window object by making its background color as grey. So I will define it in the constructor. When the window is created, the color itself, the background color will be grey.

Here's an example of the relationship between the class and an object. So we see account is a class. It represents the number, the balance, and the type.

And when we create two objects, source and destination, we understand that source has its own attribute values. Like number is 23167835, whereas in the second one, the number is 37458367. Likewise, the type in the first account object is saving, and in the second one it is checking.

So both the objects are created from the same blueprint. What makes them different is their identity and their unique data [INAUDIBLE]. Operations remain common to both.

Now, here's an interesting concept of abstraction. Abstraction is usually confused with the abstract classes in Java. Abstract classes in Java and abstraction are two different things. Abstraction in simple words is hiding the details.

So we can say the abstraction object is a representation of the real world object with irrelevant behavior and data removed. In other words, we can say the behavior and the data is hidden. Say, for example, I want to say somebody that I am providing a class library which will sort the data. Now, the user of the class knows, the area filled with data will be provided by the user and the assorted data will be given back.

Now, abstraction says you call the sort method, and the data is sorted. How the data got sorted, whether I used to heapsort method, or whether I used bubble sort method, it doesn't matter. That is what you call it as abstraction.

Abstraction provides me a facility that implementation and interface can be segregated. Implementation is hidden from the user. User know the interaction. User knows what my object can do. It doesn't need to know how it will do. So that is what we call it as abstraction.

Here, we can see abstraction can be understood from another point of view where we say that irrelevant details are removed. So we are taking an example of an engineer class over here, where we understand we define an engineer class by defining the first name, the last name, salary, fingers, toes, hair color, political party. Likewise, we have the operations increase salary, design software, implement code, eat breakfast, brush hair, and vote.

Now, if you want to use this engineer object in a particular company, the company is interested to know the name, maybe the address, the salary package, and what the employee can do. The number of those hair color, political party, may be more of use if you are using the same object in a social networking website. It doesn't make any sense in using it in a particular company where the person is doing a job of a software developer.

So I abstract the engineer class from the unnecessary details over here, and we use the engineer class over here. So what I can say is the engineer class for a software company is this. But maybe for a social networking website, this may be my profile.

The same object can be represented or can be looked at from a different point of view, depending upon where it is to be used. So that is the area of abstraction. And here, we have another interesting concept, encapsulation. Abstraction and encapsulation, in a way, go hand in hand.

What do we mean by encapsulation? Encapsulation means you are packaging something, and you cannot see everything from outside. Encapsulation is achieved by making all the attributes or the state of an object private and keeping the operations as public.

Unnecessary details are not shown outside. User cannot change the data by itself from the outside. And there is a specific way you can reach to the data that also brings protection.

So you are protecting the data from the outside world. You don't want everybody to use the data. Maybe I can take a simple example that you want to use a department code. And you know the department code is going to be a numeric value between 1 to 5.

Now, you don't want anybody to give the value more than six, but you cannot hold their hand. User cannot type anything, whatever they want. So what do we do? We keep the data as private and we ask the user to enter the data from the keyboard. And we use a particular method.

Let us take a simple example over here. Say I want the department code. And I have kept it as private. Minus means it is a private data.

Now I will provide a public void set department, int department method over here. Now, say user enters the department number as seven, but the valid values are between one and five. So what will I do?

Without the knowledge of the user, we are checking conditions over here. We say if department is less than equal to 1, or department is greater than equal to 5. So I can say department is equal to minus 1, the error code.

Or maybe I can throw an exception. I can say the invalid department code. I can say like this-- throw invalid department object. I can do that. So you are protecting the data. You are making it sure that everything is provided right, that all the values are right.

So we can hide the data. Here is an example. When the data is private, you cannot interact with the data employee.fname is equal to something. Or you can say name is equal to employee.fname. It is not possible.

You have to use the methods. When you use the methods, you are using a kind of abstraction. User doesn't know. But you are providing some validation code which will protect the data from being disintegrate. Or you can say, the integrity of data will be maintained in that way.

Inheritance is a process where you can reuse the entities. You can plug-in already existing entities into the new ones. Or you can say we can create some generalized entity. And we can create a specialized entity from there.

So it is a process of creating new classes from the already existing ones. And when the new class is created, all the methods and all the data of the superclass is included in the subclass. And subclass can specialize over the operations.

It can add new operations. Or it can override the previously existing operations. But inheritance can be used only and only if you can justify is a kind of relationship.

For example, surgeon is a doctor. But hospital has a surgeon. That means doctor and surgeon can be used in an inheritance relationship, but a hospital and surgeon cannot be used in inheritance relationships. These can be used either as a composition or as an aggregation. So Liskov's Principle says that you have to decide whether something is to be used for inheritance, or we want to use composition, and so on.

Now, there are various types of inheritance. There can be inheritance which is a single inheritance. There can be inheritance which is multiple inheritance. Let us take a look at that.

Say this is my super class, Class A. And I create Class B from this. Now, this is a superclass, and this is a subclass. From the Class A, I create Class C.

I call it as a single inheritance. Now, this inheritance is supported by all object oriented technologies-- C++, Java, C#, everything-- whereas there is another one. Say, for example, I have a class A. I have Class B. And I want to inherit class C, both from A and B. I call it as multiple inheritance. Multiple inheritance is where you have more than one parent classes.

Now, this inheritance is not supported by all object oriented programming languages. Like for example, Java does not support this. So when we design, we most know for which technology we are designing.

So here, we can see employee is a superclass. Employee is a superclass. And manager and engineer are the subclasses. Now, employee class has three attributes, fname, lname, and salary.

All these three attributes are inherited to the manager, as well as to the engineer. And manager specializes by introducing quarterly bonus, whereas engineer specializes by introducing education and hardware.

And all the methods-- get firstname, get lastname, increase salary-- are inherited to both manager and engineer. Manager and engineer can override the increase salary method, and can introduce new methods on their own, like increase bonus, or play golf with the client is for manager. And analyze requirements or design software, implement code is for the engineer class.

So we can understand inheritance is a process of creating new classes from the existing ones where the new classes can override the behavior. And these can add the new behavior to the existing class.

Now, few slides back, we talked about abstraction. And there, I said that usually we confuse abstraction with abstract class. Now, here we talk about the abstract class.

Abstract class is an incomplete class. It is a class which would like to introduce certain behavior, but does not explain that behavior. I would like to take an interesting example over here for shape class.

We'll try to understand the need of an abstract class using a shape class. Say I want to create some graphics tool, or say IDE. I create a class called as shape.

Now, using this shape class, I would like to do two things. I would like to calculate the area of the various shapes, and I would like to draw various shapes.

So say I would like to draw a circle. I would like to draw a rectangle. And I would like to draw a triangle.

I want to enforce certain behavior on all these classes. I would like every circle, every rectangle, and every triangle to calculate area and to introduce a method which can draw the shape.

So what do I do? I want to keep the common operation, so I introduce calcArea and the draw method here within the shape class. But I don't write the code for it. I don't implement it, because I don't know.

Without knowing the shape, I will not be in a position to calculate the area or to draw, because the algorithms are different. So when we create a subclass, the subclass overrides both the methods. And if these do not override both the methods, these itself become abstract.

So abstract is opposite to concrete. When the class defines all its behavior, it is called as a concrete class. When the class does not implement all its behavior, it is called as an abstract class.

Now, when the class is abstract, it can have the attributes. It can have the constructors, and it can have some concrete and some abstract methods. But when the class is abstract, we cannot instantiate this class, because it is not complete.

The object creation can be done only and only for the class which is a concrete class. So then we can think of that if I cannot create an object of abstract class, what is the purpose of having a constructor in the class? The constructor of an abstract class is used by its subclasses, when the subclass object is created, it uses the constructor of that class. So abstract class is a concept which helps me to create a behavior for family of classes.

Now, abstract class is a concept which makes more sense to a designer then a coder. Coder can always say that, OK, I can always implement draw or calculate area and everything. But the designer will say, OK, I want to make it sure that this design is implemented by force.

I want everybody to follow the same design. So how can you force? You can force by using an abstract class. All right.

So here is an example how UML represents the abstract class. Normally when the class is abstract, we write the name of the class in italics. But when you are writing on a paper, it may not be possible to show the italics. So what do we do? We use the abstract keyword over here within the curly brackets.

Here, we can see Employee is an abstract class, because Employee is introducing increase salary method, which is an abstract method. The logic for all the business process for increasing the salary of manager may be different from an engineer, so both will override the method depending upon the type of an employee. And that makes increased salary as an abstract method over here.

So Java introduces interfaces, which is the next level of abstraction. In abstract classes, we saw that we can create a family of classes, depending upon certain behavior. Now, interface says, if there is some commonality, there is some common behavior.

Say there is some common behavior. And this common behavior can be implemented to completely unrelated or different classes. We can create this commonality. This is called as an interface.

Now, interface, it's only-- I can say it is inheritance on behavior. So hence, we will find that interfaces do not permit any attributes. If they permit any attributes, these permitted only and only as final variables.

These are final and static and public. These are public, static, and final variables. So these are constant. That means no object will have a unique data of this type. It will remain common, like a global.

And methods are permitted. And all the methods by default are abstract in the interfaces. No implementation of the code. Constructors are not permitted because there is no need of creating an object.

Inheritance on the interfaces is also allowed. Like for example, I can write something like this-- public interface editor. I'll write something, let's say void edit text.

And I can say public interface GEditor-- that is graphic editor-- extends editor. Now, this can say void edit graphics. And so on.

So inheritance is allowed on interfaces. And Java allows multiple inheritance on interfaces. Now, a class can extend another class and can implement one or multiple interfaces. So here's an example.

Scheduleable is an interface which gives two methods. One is to get the object ID. And second one is to notify about activity. This interface is implemented by employee, by equipment, and say by room. Or say by conference room. Say by conference room.

So employee timetable of the activities can be scheduled by implementing the schedule level interface. Equipment may be projector. Or a computer can be scheduled to be used in a particular conference room. And the conference room can be scheduled.

Now, conference room equipment and employee are three different unrelated classes. These don't have any inheritance relationship or any other kind of a relationship. But these can implement the same interface. So this is making the reutilisation, or reusability, to one higher level.

Then we have polymorphism. Polymorphism is an interesting concept where a single polymorphic object can call methods at runtime on different objects. But there are certain conditions to be met.

Polymorphism means many forms. That means one single object may call the methods from the different. Say I have employee EMP as one object reference. And here, if I say employee is equal to manager, and I say mgr.increaseSalary. And then we say employee is equal to engineer. And we say emp.increaseSalary.

Now, here what happens when the employee object is holding onto manager, it will call the increase salary method from manager class, or manager object. And when it holds onto engineer, it will call the method on engineer class.

Now, employee is a single object. But it is able to perform two different activities, calling two different methods from two different classes because of the nature of polymorphism in object oriented programming. The condition is, the variable can be assigned different type of objects at runtime provided these objects are subtype of the object.

Second thing is, the method implementation is determined at the runtime. This is called as dynamic binding. Normally in object oriented programming, when an object calls a method, the binding between the method and the call happens at the time of compilation, which is called as a static binding.

Here, in the case of polymorphism, we find that the binding happens at runtime. At runtime, the runtime environment will see that which object is in hold. And depending upon that, the method will be called.

The only condition, one additional condition rather I would say, is the signatures should be same. That means the subclass object must override the method of the parent class. The return type must be same. The name of the method must be same. And the signatures must be same. So these are some of the conditions.

So here is an interesting example of polymorphism. Employee is a class which is parent of both manager and engineer. Now, we have created a list of various types of employees. And we put a for loop over here to call the increase salary method for all.

Now, when we say employee is equal to list.get(i), if the [? i at ?] the object is of manager type, the operation will be performed on manager. And if the [? i at ?] object is of engineer type, then the method will be called on engineer, and we don't need to bother about it. We just type cast it to the base type or to the supertype called as an employee.

So that means using a single object reference. You can call the multiple versions of a certain method. So this reduces the conditional checking in a class.

Suppose if polymorphism is not there, what is the other alternative for me? I would check if the employee type is manager, then call the method from manager. And if the employee type is engineer, then call the method from engineer. I don't need to do that because polymorphism do it for me.

So polymorphism can also be applied onto concrete classes. Polymorphism can be applied to abstract classes. And interestingly, polymorphism can also be applied onto the interfaces. So I can create a object reference of an interface, though I cannot create an object of an interface, because it is completely abstract in nature.

So when we create a scheduleable interface object reference, here it is an interesting scenario. Scheduleable is an interface, which is say implemented by schedule class. Now your schedule class job is to schedule the activities for employee or for equipment or for a conference room.

When you want to add a new scheduling activity for any of these, you'll receive a scheduleable object reference. Now, scheduleable object reference, say if I call the method in this way, say I create-- I call add method over here.

And I say add. And scheduleable is implemented by employee. Scheduleable is implemented by equipment and conference. So what do I do? I say new employee comma I pass the other required parameters.

And then I want to add the schedule for equipment. So we say equipment. And we pass the rest of the things. Now add becomes a generic method through which you can schedule the activity of employee, or activity about the equipment or a conference room by passing the equivalent object to the scheduleable object reference.

Scheduleable, because it is implemented by all the three classes, can hold employee equipment or conference object at various point of time. So whatever you pass, that is being taken care over here. So polymorphism can be applied to classes, abstract classes, as well as to the interfaces.

## 3. Examining Object-Oriented Concepts and Terminology, Part 3 - 10m

Cohesion is another feature which is very, very interesting. Normally, we say small is beautiful. So the idea is to create more focused, small classes or interfaces and use them together to create a meaningful software.

Object oriented principles says, create the classes which are highly cohesive. When the class is highly cohesive, that means a class has a single focus. Class is doing one particular activity. When the class is responsible for doing many variety of features which are unrelated to each other, the class becomes a class with low cohesion.

Cohesion can be applied not only to classes, it can be applied to subsystems, components, the whole of a system. You can create a system which is doing totally disparate activities, which make no sense with one another. So we create the systems with high cohesion. There is an entire pattern called as a Blob components, the component which performs variety of activities and is not focused.

Here is an example of a low cohesion class. We create a class say called as system services, which makes an employee, makes a department perform login/logout operations and do various cloud operations on the various objects. But this is not a good design.

To make it a better design and to bring about more reusability, when the class is highly cohesive, is it can be reused. So we create one class called as Login Services. We create another class Employee Services. We create yet another class called as Department Services.

Now, if we combine all these operations in a single System Services class, and I want to reuse the Login Service, I cannot do that because it carries a lot of luggage along with it. It's not a good design.

But if Login Services is a separate class, it can be used in other modules, in other subsystems, or maybe in other systems. So high cohesion brings a lot of reusability into it.

Then we have coupling. Now, coupling tells how you interact, how these objects interact with one another. It is very good to feel that everybody has an access on everybody else. But according to the design, this is not a good concept, because it makes it tightly coupled objects, and the change in one affects another. So the basic bottom line for object oriented programming, we can say highly cohesive, loosely coupled.

Here are a few examples. We can see a client class may never use a service. That means there is no coupling at all.

One is not using another at all. There's a loose coupling when client uses a service, but service does not use a client. There is a tight coupling when both use each other. Client is using service, and service is calling onto the client.

There is an abstract coupling. That is called as according to me the best possible design, because you have a lot of flexibility in that. Client communicates either with an abstract class or communicates with an interface.

So client is unaware about the implementation which the supplier is giving. Other complete Java EE APIs are an example of abstract coupling to an extent. We have abstract classes like HttpServlet is an abstract class. Servlet is an interface.

So when I implement a Servlet interface, or when I create a Servlet component, I'm not bothered about whether I'm using the implementation from JBoss, or I'm using from WebLogic, or I'm using from GlassFish. Doesn't matter at all, because the provider can implement the interfaces in their own way.

What me being a client needs to know is how I will call a particular method. So abstract coupling is highly flexible and extensible.

Associations and Object Links. Now, we talk about creating a class in a very highly cohesive manner. We also talked about how the classes can couple with one another.

Now, when the classes communicate with another classes, how many objects are actually participating? For one department, there can be many employees. Or for one department, there can be only one manager. So that means department and manager, there is only one one object interacting with one another.

But whereas in the case of employees, there will be many employee objects who are interacting with the same department. So that brings association and object links.

Association tells how many objects are participating. There is a multiplicity involved over here. One to one, one to many, many to many, we will talk about it later more in detail. And of course, that direction tells me about the coupling, the navigation.

If only one object navigates to another, that means it is a loose coupling. When both objects are navigating to each other, that shows a tight coupling.

When we draw the objects, we don't show multiplicity. But we draw the lines which are called as links. So we can say a link is an instance of an association. Let us take an example in the next slide.

So in the first part, here, in this portion, we talk about multiplicity. And in this portion, we talk about the links. We can see one department is associated with one or more employees. But one department is associated with only one manager.

In the case of links, we show the department and manager have only one link from department to manager. But whereas from department, there are multiple links for the various employees. So when you draw from one object multiple links to various different objects, that shows one to many relationships over here.

Now, another interesting concept called as delegation. It's a day to day activity. Your manager may delegate a certain responsibility to you. You may delegate a responsibility to your subordinate, and so on. So same is the case with the object oriented.

Object oriented is very close to our day to day life. Like you saw inheritance, inheritance is like you receiving something from your grandparents and your parents. You saw coupling, how you associate with your colleagues. So that shows coupling.

You may be related to many friends, but you are related only to one spouse. One to one, one to many. So we see that object oriented, if we understand life in a very connect manner, we understand object oriented in the same manner.

So here we see delegation. One class can delegate the operation to another class, to another subclass, a method within the same class, and so on. So delegation is a paradigm, which is mimicked from the real world.

So we can see we can delegate a certain responsibility to a more cohesive linked object, or to more cohesive multiple linked objects, to a method in a subclass, to a method in the same class, or to a method in the super class.

Now, here we understand-- say for example the employee is promoted to manager. So how will you do it? Maybe you need to completely change the whole hierarchy. You will create a new manager object, and you will delete the details from that employee object. And then you will add new things.

With delegation, what you can do is-- we see now the Job Role is being delegated to be a completely separate class. So what happens when an employee is promoted to manager? I don't need to make a change, but because Job Role will only change.

Only one attribute, Job Role, will change. Earlier, the Job Role was engineer. Now it will become manager.

So we see by applying the principles of cohesion, coupling, association, and delegation, although these are not directly involved in the programming, these impact your design a lot. So with this, we come to an end of this lesson. Let me just revise what we did in this lesson.

In the first half of this lesson, we talked about the comparison between procedural and the object oriented paradigm, what is the difference. What is the difference in the approach? One is object related, other is procedure oriented.

And then we talked about the various concepts like classes, like objects, inheritance, polymorphism, encapsulation, and so on. And in the last part of this lesson, we'll talk about more design based concepts, like cohesion, coupling, and delegation.

## 4. Lab 1 : Examining Object-Oriented Concepts and Terminology, Part 1 - 10m

You can design the various diagrams either by using pen and paper or you can-- if you are comfortable with any of the UML designing tools. Maybe StarUML or UMLet Enterprise Architect or MS Visual-- whatever it is, you can use that. Here, I am introducing you to a small tool which is freely downloadable from the net called UMLet.

So when you download, you unzip it. And you will have a JAR file, UMLet.jar file. So you double click on the file. It will start with the software. It's very easy to use. All the default shapes are available over here.

All the default elements are here. If you will want to create some-- say for example, if you want to create sequence diagrams, you have all the elements of sequence diagram available over here. You want to create a package diagram, it is here.

So you can select whatever you want to do. Normally, in the beginning, we will use only the default one. So how do I use this tool? There are a variety of-- we can see. All the basics are available. Say, for example, I want to create a simple class. I can just double click on it.

And it contains the information. I can edit the information in the Properties window. Say for example I say Entity over here. And the package name is, say, Bank. And the class name is, say, Customer.

All right, we do need some additional properties for the class. So ID Long. And I can use minus custname and String. And here are operations. I can just remove everything from here. And I can just say plus setID void and setCustName. We can say name is a string and returns a void. And we can use getID. It returns Long and so on. Let's say if you want to create another one more class, just select it and paste it.

Over here, make the changes in this. Say this is Account. And say this is SavingAccount, all right? I can make the changes in the rest of everything. So here, what do we do? We just bring it down from here to here. That shows inheritance. And I can show the association or independency just like this. And I can write on this. I can say one to many. I can do it this way. So you can draw this. If you want to draw some use case diagram, maybe I can just use it over here, bring the use case here, draw the dependency from the actor to the use case, OK?

So I can edit the name of the use case. Let me say, Createreservation, OK? So an actor I can say is a booking agent. So this is how I can operate this tool, OK? So you can use this tool to draw the diagrams. If you want to do it on a sheet of paper, that's equally perfectly fine. There's no issue with that.

So you can download this freely from the net. And you can use this. You can use these diagrams for your further reference. And you can use it and you can save it in UMLet format. If you want, you can also use it, to save it as-- I think Save As. OK, there is a facility actually. You can Export As.

So what you can do, you can export it as a JPG. For example, I say, diagram D1 is available over here. So I can go to here. D1 is there. You can open it in any graphical editor. You can use it, right?

So this is what you can do. This is the tool, which is available for you. Now, let us talk about the lab. So lab one has three different activities. The first activity talks about the object to be reference or the object to be looked at from various points of views. So we are considering an object called Car, car class. How will you look at it from different points of view?

Car Village is used as a lot. You want to use it as a gaming object. Or you want to use it for registration purpose or for any other purpose. So here, we can see in your activity guide you have-- at the end of the activity guide after all the 15 labs are over, you have the solutions. So here, I just show you the solution for the first activity.

We can see when we used car lot context, so we say, OK, what is the actual price? What is the make? What is the model? What was the purchase price? What is the requested sale price? So you have a car object. You're talking about it.

And what are the operations you want to take a look at? What is the profit, reduced price, or sold, or yet to be sold? When you look at it from the game point of view, you want to create some game where a car is an object. So we say, OK, I would like to see how can I adjust the speed. What is the maximum speed or what is the position on the track?

You want to use an accelerator or you want to use a break, maybe some keys from the keyboard. And when you want to use it for your registration purpose, your attributes are completely different. Of course, you want the make, the model, the status, the vehicle ID number. You want to know about the emissions, whether it is having the emission percentage or not. So this is how you can reference an object from different points of view.

## 5. Lab 1 : Examining Object-Oriented Concepts and Terminology, Part 2 - 5m

So Activity 2 talks about two things. One, it talks about inheritance. And the second thing, it will talk about map the business rules to the methods.

For inheritance, we take an example of an Account class, which is a superclass, and we create the various types of accounts, like we create a SavingsAccount from the account. We create a LoanAccount from the Account class. We create another CheckingAccount, and the fourth one as a TaxFreeSavingsAccount. Once we design all these subclasses, then we override certain methods to map the business rules.

So let us just review the solution. This is our superclass. The superclass Account is used for creating four different subclasses, SavingsAccount, CheckingAccount, LoanAccount, and the TaxFreeSavingsAccount.

We can see SavingsAccount does not add any new attributes. CheckingAccount adds overdraftLimit. LoanAccount adds an attribute debited. And TaxFreeSavingsAccount unusedAnnualCreditLimit attribute.

So this finishes the first part. The second part is when we are overriding the various business rules. So for that Account class, there are certain rules for debit, credit, and getBalance. We override these rules depending upon the situation.

So for a SavingsAccount say, for example, we say debit will have the business logic if amount is greater than the amount returned by the getBalance. Then of course, we will reject the debit operation. We cannot withdraw what is not there. Otherwise, call the superclass debit method. Likewise, we have the various rules for the various classes.

Activity 3 talks about cohesion and delegation. We will add a few details to the Class diagram we created in the previous activity. We will create more objects now because we want to delegate the responsibilities.

We will add customer information. We will have Bank and a Branch class. So we will see how the customer can have many accounts in the bank, and the account can be owned only by only one, single customer. So one to many kind of a multiplicity or relationship we will see over here.

So first we see the various classes. We have a Bank. We have Branch, Account, BusinessCustomer, and Personal Customer-- two types of customers.

Address is a common class which can be used by many other classes. Branch will have Address. Customer will have an address. So we bring Address class as a separate class, and we reuse it by making it as a part of a composite called as a Customer and a Branch.

So Bank has many Branches, so one to many relationship. Customer has zero or more accounts. And the Customer can be of a BusinessCustomer type, or it can have a normal Customer, which will hold a taxReferenceNumber. In the case of BusinessCustomer, we have a companyRegistrationNumber and so on. So these are the various activities for lesson number 1.
