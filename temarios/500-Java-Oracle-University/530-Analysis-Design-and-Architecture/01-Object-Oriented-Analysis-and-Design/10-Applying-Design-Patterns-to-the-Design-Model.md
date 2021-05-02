# 10: Applying Design Patterns to the Design Model

1. Applying Design Patterns to the Design Model, Part 1 - 30m
2. Applying Design Patterns to the Design Model, Part 2 - 45m
3. Lab 10: Applying Design Patterns to the Design Model - 9m

## 1. Applying Design Patterns to the Design Model, Part 1 - 30m

In module 10, we talk about how can we apply design patterns to the design model. We created our design model earlier. We have created interaction diagrams. We created state chart diagrams. And now, here we will see how we can apply the design principles and the design best practices using design patterns to the design model.

Objectives of this lesson are to define essential elements of software pattern. And in addition to that, we will discuss five design patterns, composite, strategy, observer, abstract factory, and state pattern.

We are here right now. So we are more into functional requirements. We are talking about design.

We already finished creating interaction diagrams for the key use case scenarios. We also finished creating and identifying and modeling the complex object state using a state machine diagram. And now, we are here to apply the best designing practices using the design patterns to the design model.

So let us see what this software pattern is. Normally speaking, what do we mean by a pattern? If I draw something like this, I call it as a pattern.

Right? Why do I call it as a pattern? Because I understand that this element is repeating itself again and again.

So likewise, we understand anything can be considered as a pattern. There can be patterns while building the buildings. There can be patterns while creating furniture. We create study tables in a different way from the dining tables, and so on.

So just like that, in computer softwares, we have software patterns, which describe the communication of the various objects and classes that are customized to solve a general design problem in a particular context. Say you have one particular kind of a problem and you want to find a solution for that. Let's take an example.

Let's say, for example, I want to create a class which will represent a server. So I want to create a server and I want to create such a server which will keep some information at a centralized place. So that means one single object.

Now to create an object, I must have a class. So that means I will create a class for this object in such a way that only one single object must be created. So I will say, OK, what should I do?

I will tell somebody, we can try various ways and then we find out one particular algorithm or one particular method, where we say, OK. If I follow this method, this seems to be a very good solution to that. I can call it as a design pattern.

Now let us continue with this only. We say one single object we want to create. So I'll say, OK, how an object can be created from a class? Anybody can call a constructor from outside and create an object.

So I say, OK, I prohibit the calling of a constructor from outside. So we say, fine. I create a class where I keep a constructor as private. That is my condition.

So I tell somebody, see, I want to create a class which will create a single object. So our solution is we will create a private constructor. But when we create a private constructor, the problem is how will you call it from outside?

So we say, OK, we write another public method inside the class, which is a factory. It can be called without creating an object. So I keep it as a static. So you say, public static create object is a method. Right?

Then comes a situation where say, OK, we can do it over here. But the question is it should be only one singular object. So we say, fine. The name of the class is say, a single object. So we say we will create something like this now.

We say public static single object. Say, s- o- b- j. Now because it is static, I understand there will be only one occurrence of this per class.

So I reach to a certain solution, and I say, OK. Whenever I call this method, in this method I will check. If this is null, then only you create a new one. Otherwise you return the same one.

Now I tell somebody so many details, there is always a chance that they may not understand it well. So rather than that, what do we do? Whenever we find these kind of standard solutions which are being time tested over a period of time, and we want to use these patterns, we use certain vocabulary. And we call it as a pattern name.

So rather than telling somebody and explaining them to for 30 to 40 minutes-- and I say OK, why don't we go for this kind of algorithm because I need a single object. But other than that, just within a blink, I will say, I say, OK. Why don't we go for a singleton?

Makes more sense. Yes? So when I say somebody, let us keep this class as a singleton, so everything is clear. Because everybody know what is singleton.

So hence we see that every pattern will have four essential elements. And one of these elements is a pattern name. Second thing is every pattern name will be associated with a certain problem.

So for example, the problem of creating a class with a single object is a singleton. Maybe you have another one where you want to sort many numbers, or you want to sort some data, but you're not sure which strategy will you follow at the run time. So I say, OK, maybe I can follow another pattern called as a strategy.

So every pattern name is related to a certain problem. So we can say a design pattern is a solution for a recurring problem. A problem which occurs again and again and again, we find a solution for that.

Now we have a problem, we have a name, and we have a standard solution. So this was my standard solution. I will create one class level object reference. I will create one public factory. And I will create a private constructor.

That is my solution. Now we don't create perfect solutions. That are only optimized solutions. So every solution comes with its consequences. Which consequences, some can be positive, some can be negative.

So this is what is a software pattern. As we say, a description of communicating objects and classes that are customized to solve a general design problem in a particular context. So every design pattern has four elements in it. That is the name of the pattern, the problem of the pattern, solution, and its consequences.

Now there are three levels of patterns. So one are architecture. Second it is design. Third, it is idioms.

So architectural patterns are at the highest level. These patterns manifest at the highest software and hardware structure. We think about the system from a very high level, communication among the various modules or systems or subsystems or how the overall system must be designed.

So these kind of patterns usually are supporting non-functional requirements. So once such pattern, architectural pattern, which is very popularly used with the Java EE applications, is a MVC pattern. Model View Controller pattern.

There's another one, which is again very popularly used, we call it as a layers pattern. So layers pattern says, for example, here there is a hardware. Here there is an OS. Here there is a upper platform that is your middleware. And here you have your virtual platform where you have all your APIs.

And here you can have more layers. That means, just like in a mobile industry, we see that there are stacked protocols. You don't change what is already there. You keep on building on the top of that.

So that means already some number of layers are there. You don't change the ultimate. But what need is you stack something more on the top of that, and you know the upper can communicate with the lower one. So you're not basically changing many things. So these kind of patterns are called as architectural patterns.

Then we have design patterns. These are mid-level software structures. And these usually support functional requirements. Like I discussed-- just now, I discussed two patterns with you. One was a singleton. One is a strategy.

We will discuss some of the design patterns today in this class. OK? Five patterns we are about to discuss.

So design patterns. Design helps me to design an individual software component or a group of components. For example, I can have an observer pattern. All my Java SC, or you can say all the swing components, follow this pattern called as an observer pattern.

OK. So observer pattern says, if you have-- for example, one example of observer pattern is say I create a screen with a check box. Right? So what happens?

When I check this check box that means its state has changed. The data inside it was whether it is checked or not. Previously it was false, now it becomes true.

But just changing the data in the object will not serve the purpose. On the screen it should be shown as checked. So that means it is linked to a view, and its notifies. It publishes something. And it says, OK, you change your state depending upon what I'm giving to you as an input.

Then we have idioms. Idioms are the lowest level of the software structures. Most of the time these are technology specific, the patterns which are implemented at a class level. And these are specific to technology.

One such pattern is a pattern which allows you to create localized objects. How to construct and destruct a certain local object. So this pattern is available only and only for C++. It is not applied to Java, because Java does not allow you to destroy the object manually. It is all auto garbage collection.

Another such pattern is a iterative pattern. Java uses it. We can catch an iterator. We have iterator over here, say itr. And here we have a list.

So we can say, list dot iterator. We can get this. And then we can iterate over the collections.

So these idioms are the lowest level. These are applied at a class level. And most of the time these are technology specific. Now what I told you as an iterative, this is not completely technology specific. It is used both for C++ and Java.

Now before we talk about the design patterns, let us take a look at the design principles. Every object oriented software fallows most of these principles. And here particularly, we will talk in terms of Java and Java software's follow these principles.

So first one is a open close principle. Second one is a composite reuse principle. And third one is a dependency inversion principle. So let us take a look at these design principles.

Now in this lesson, most of the examples which we will take, these examples are related to Java Standard Edition GUI programming. Most of the examples. So we will see the examples coming to us from AWT and from Swing.

So we are taking an example of a grid container. So we say, grid container is a class. And this class arranges the various components like a matrix in the forms of rows and columns.

And once you have created the grid, you can just call a doLayout method. Or whenever you create, whenever you add any component within a grid container, it automatically keeps on adding the elements depending upon the number of rows and columns. Here we can see in the colored box over here, GridContainer calcGUI is equal to new GridContainer, 4 comma 4. So that means four rows and four columns.

So we say calcGUI dot add. So when you add 1, 2, 3 and plus, these go to the first row. As soon as you add the fifth component, that is when you say add button 4. It goes to the second row and so on.

So this is just an example. We will see that this kind of a container example will serve some purpose for us to understand the various concepts.

So let us first talk about open closed principle. Open closed principle says, the classes which we create should be open for extension but closed for modification. So extension can be in two ways. Extension can be maybe you can add something new, but it does not affect your previous interface.

The second kind of a extension can be that maybe you improve or alter algorithm without changing the interface. So here is an example for that. We say, we have a grid container over here. We create a grid container class, where complement is an array list.

You have a component which is an array list. We have a constructor over here which receives two parameters. One for width and one for height. And then we have other methods, like we can add Component, remove Component, or we can doLayout.

Now if we want to open this for adding something new, we want to extend it. Now there can be a way out, that earlier you were using some methodology for layout, some particular style of layout. Now internally you change it, but you have not changed the way method must be called.

That means, your method is void, it is still void. Your method does not receive any parameters, now also it doesn't receive any parameters. But the internal functionality of the method has changed.

There is also extends for-- it is available. You can extend it. This is one kind of extension.

Second kind of extension is over here. We say, OK, we would like to have a container where the borders can be placed. So we add another element over here called as a border width. And we say it can be some n number of pixels.

Now to support this, what do we do? There is no change in the constructor. There is no change in add, remove, or doLayout method. But what you are doing, you say, setBorder is another method.

So that means the previous users of the class can still keep on using this class because there is no change in the functionality. Right? So this is a valid example of extension.

Now the second case over here is we say, OK, there is a grid container. Earlier it was an array list. Now let me make it as array, 2 dimensional array. So there is a change. It's a structural change.

So this is modification. This is not allowed. Because earlier my-- I could create components as equal to new array list width into height. But now I will say, components is equal to new component. I will say, width by height. So that means there is a visible change over here.

So this is a modification. This kind of change is not supported. Or maybe I make a change in the doLayout. I say, OK, I would like to pass some parameters to the doLayout.

Or when remove is-- when I say component, I may say some additional parameters to that. So that is a modification. User will be affected by that. So this is about open close principle.

Next we have is a composite reuse principle. Now the principle says we can favor polymorphic composition of objects over inheritance. Now here we understand when we want to extend the behavior, or when we want to change the behavior, it is not always necessarily to be done by inheritance.

We prefer polymorphic composition over here. Sometimes inheritance can be preferred because of its polymorphic nature. We can perform polymorphic operations with inheritance. But we have to make it sure where ever we use inheritance, there is a kind of relation-- is a phrase. Must fit well.

Now let us take an example over here. Say we have a container class and we want to create two different kind of containers. In the previous slide we saw we had a grid container which could arrange the components in a matrix form. Now we want to arrange the components in a border style.

That means four components to the four sides and one in the center. So we say, OK, why can't we do it like this? We create Container as a superclass, which is a abstract class, of course. And then we create two subclasses, GridContainer and BorderContainer. So this is OK, until we don't face another problem.

So we say, can we have a container which has two types of borders? One where it can give me a just flat boundary around the components. Second where it will give me a 3D etched border.

So now the question is I already had a Container, GridContainer, and BorderContainer. Now I have another type of a container. A container with a flat border, and a container with an etched border.

Now I cannot create any other third class which will inherit both GridContainer and a border, because Java supports only single inheritance. So I end up creating a whole new hierarchy where I create a GridContainer with a flat border, GridContainer with a etched border, BorderContainer with the flat, and BorderContainer with etched.

So that means if I have n types of containers, m types of containers and n types of decorations that means I will have m into n classes in my hierarchy. And whenever a new change comes, a completely new set of classes need to be created which makes my design very much brittle. So we don't want that.

Is there any other solution to that? Certainly yes. So we say-- one more thing is when I say, a container is a GridContainer or a BorderContainer, Grid and Border is not a type of a container. Grid and Border is the way, is style in which you place the components inside it.

So that means a container can have a style. Container is not a style. So it doesn't make good sense otherwise also if we create something like this. So we say, why don't we do like this?

We create a container. And we say, OK, let us add one attribute over here called as a Layout. So we leave it like this. Container has a layout.

To support this, we add a method called as a setLayout method over here, which receives an object reference of a layout type. Now layout can be a variety of types. Layout can be a border layout. Layout can be a grid layout. And it remains a very simple kind of a concept even at the run time also.

What do we do is we can say like this. When we say setLayout, we just say new GridLayout and pass the data from here. And this is the actual design which is used by Java.

So what happens when you say GridLayout, maybe next time I will say BorderLayout. I'm not restricted that which one I have to use. So what do I do? Both these will be passed as parameter to setLayout where I have taken it as a Layout l, Layout l. So, whatever.

Now because Layout is apparent for both Grid and Border, so this becomes a polymorphic object. And you have it as a part inside a container, so that means this represents my polymorphic composition. Composite reuse principle.

You have a composite which contains come particular part which can be reused depending upon-- sorry-- depending upon what you are passing at the run time. So you are at ultimate flexibility. So this is what we call it as composite reuse principle. So we do it through delegation rather then inheritance.

Then we have another one, which is called as a dependency inversion principle. So dependency inversion principle says, depend on abstractions and not on concretions. Concretion is a concrete class. Abstraction can be an abstract class or it can be an interface.

In the very first lesson, we talked about coupling. Say if this is a client and this is my actual service, Service 1, and this is also Service 1. Right? Now we can implement these services by a common interface. OK.

Say this is my service interface. And my client always communicate with this interface all the time. And there are different suppliers. Supplier 1 implement this interface in their own style. And supplier 2 implements it in their own style.

Right? Interface remains same. Say you are using some method, say Close. Say this method closes a window. Right?

Now Supplier 1 uses one algorithm to close the window, clear it from the memory. And the other one use it in their own style. They implement it in their own style.

So that means this is my abstraction. And this is my concretion. This is my concretion.

So we depend upon-- the client depends upon abstraction. Client knows what to call, what parameters to pass, what is expected as a return. But we don't need to know how it will be implemented.

For example, if I am writing some program where I have to catch data from some database, I can write a common program where I make a connection with a database. And while passing the parameters, whatever is the driver available, with that the connection will be made. It may be Oracle or MySQL.

And without your knowledge, whatever the statements or whatever the result set or whatever you are getting, that will automatically be taken care depending upon which kind of a driver you are using. So you know when you call getConnection method, it makes a connection to a particular place, to a particular database.

So how a particular database vendor has implemented that algorithm, how to communicate to the Java program, so that remains abstract to you. You know only JDBC API. You always call same getConnection method. You always call same getResultSet method, and so on.

So this is an example of dependency inversion principle. Even composite reuse principle is implemented using dependency inversion principle. So here we can see it can be either via interface or it can be via abstract class.

## 2. Applying Design Patterns to the Design Model, Part 2 - 45m

So after the design principles, let us talk about various design patterns. First, we'll talk about composite pattern. Composite objects into three structures. What does it do? It composes all the objects into three structures. So we have part/whole hierarchies over here.

So we take an example over here of a window class. Say I have a container. And I place certain components over here.

Some labels are there. Some text fields. And we have some check boxes, some group of radio buttons, and a Submit. Now this container acts as a composite. And all of these various components are parts of the composite.

We will use composite pattern then we want to have a common or a uniform operation on the composite and on the parts. That means whole and the part both will perform a similar kind of L operation.

So what we can do, we can have a common parent over here, like a component. So component is a parent abstract class. In this case, for both the container as well as the button and label.

Now button and label components can be placed inside a container. So container acts as a composite. And the button label, these kind of components, these act as a part of it.

What do we mean by when we say that we should treat the compositions uniformly? That means say we have a paint method. A paint method, what does it do? It repaints a particular component.

So paint method is there in the component. Hence it is inherited to all the three components over here. It is inherited by button, label, and container.

So what happens when you call the paint method on the button? When you want to repaint this. Or when you check this. Or when you select a radio button over here. What happens? We would like to call the paint method that is on the part.

So when you call the paint method on the part, it performs all the activity to repaint, once again, on the screen, that particular part. So that means that component is repainted. But say I am minimize that window. And I bring the window once again back onto the screen. I restore the window.

So that means what should happen? My window is represented by container, so that means I will call the paint method on the container. Now what happens? What should happen in the container?

If container will just paint, the container itself that is only an empty window will appear. So normally what happens when you call a uniform operation on a composite, but it will say four say all parts in container. And it will call parts.paint. That means composite will call the paint of every other component inside it. So that will result into doing all this.

Now, the benefit is you are calling a common operation paint whether it is a component or whether it is a container.

So we use this pattern where we want to keep a uniform behavior, whether it is a composite, or whether it is a part. Say, for example, you want to calculate the salary. So you want to calculate the salary of a particular employee.

Employee can be manager. Employee can be a technical lead. Or employee can be engineer. Employee can be a designer.

And you want to calculate the salary of a whole department. So what will happen? I can write a method called as a calculate salary.

When it is called on an individual component, that means department is a composite and employees are a part of the department. So when we call it on a particular employee, it performs all the operations, all calculations. But when I apply it on the department, it says all employees in the department and call individually. And I get the ultimate picture.

That is the utilization. So let us take a look at the problem. You want to represent whole part hierarchies of object. And you want to use the same interface on the assemblies and the components in the assembly. When you have this problem, composite pattern is a solution for that.

So solution is we can create an abstract class called as a component. And that acts as a super class for the leaf, as well as the composite. So leaf is your part. Here, the button check box or the radio button, these are all considered as leaf, because these are individual components. These are not containers.

So the composite class can be treated as a component, because it supports the component class interface. Both the composite and the part are implementing the same interface, or are being subclasses of the same abstract class. So here is an example for this.

Now a composite pattern is a Gang of Four pattern. These are the more basic patterns which can be applied not only to Java, but to other object oriented programming languages also. So we have component over here, which contains add, remove, get child, and operation method.

Now, it's a good point for discussion to understand that what is the role of add, remove, get child in the leaf? Because you cannot add anything onto the leaf. You cannot remove anything from the leaf. And the leaf itself is the ultimate child. It cannot have any other child component.

So composite it makes sense. Now, there can be two design perspectives over here. One, you keep this design. And all the operations which can be implied onto the composite, when you call these methods on child, let it throw an exception.

But why do we want to do it? We say, why don't we do rather this? We say OK. We keep only that operation, which is common for both child and the composite into the component. So this makes more sense. Leaf and the composite both can call the operation and the behavior will be different.

For example, operation will be the actual algo over here. And here, we can see in the composite, it will say for all C in children. That's for all the children of this composite, I will call the method do c.operation. Do it for every child.

The consequences of this composite pattern is makes the client simple. Client doesn't need to bother, because client calls paint whether it is a composite or whether it is otherwise. Makes it easier to add new kinds of components because there is a common behavior. We don't need to bother.

Suppose if you add two new components in the composite. You don't have to bother about, because composite is already keeping track of by calling all of the methods of all its children components. But it can make the design too general. Sometimes it is too general and we want to have some particular functionality over there within that operation. That cannot be applied in this case.

Then we have another design pattern called as strategy. Strategy pattern can be applied where we have family of algorithms. Encapsulate each one and make them interchangeable.

Strategy lets the algorithm vary independently from clients that use it. That means you want to perform certain operation. But you want to use different algorithms for the same operation.

Say, for example, we want to sort certain data. So my interface is I have a sort operation which receives an object array. This is void.

Depending upon second condition at the runtime, I would choose whether I have to sort it by a bubble sort or a heap sort or merge sort. Or maybe there are more. But maybe I would like to add more later.

I don't want to make this decision at design time. I want to keep this decision open at runtime. I can use a strategy pattern over here, because there is a one single operation.

And there is family of algorithms sorting, searching, performing these kind of things. Maybe you want to read the data. So you have a read operation.

So you want to read the data from an array. You want to read the data from a variable. You want to read the data maybe from a file.

Or maybe you want to read data from a database. Or maybe you want to read the data from a network socket. Doesn't matter.

Now, your operation is read. But you want to do it in a different way at runtime, depending upon. Say strategy is a good background for that purpose.

Here we have an example of what we discussed previously. We have a component class over here. And we have a do layout method.

We create a layout manager interface, which is implemented by three different concrete classes over here. GridLayout, BorderLayout, FlowLayout. Maybe I can have some more like a BoxLayout, CardLayout, GridBag Constraint Layout, and so on.

So what do we do? At runtime, we make call a method called as a do layout, or set layout. So when we see set layout, at runtime, whatever object is passed to this, the layout procedure is called from there.

So your operation is single. You want to set the layout. But there are family of algorithms. Do you want to layout as per grid? Do you want to layout as per border? Or do you want to layout as a flow?

Now, problem is you have a set of classes that are only different in algorithm that they are using. And you want to change the algorithm at runtime. What is the solution?

We say we can create an interface called as strategy that is implemented by set of concrete algorithm classes, just like over here. So LayoutManager is a strategy interface over here. And GridLayout, BorderLayout, and FlowLayout are the concrete classes implementing this strategy interface.

And email composite, what you do, you keep or refer to the strategy. Strategy, being a polymorphic object reference, can be used to interact with the methods available, the overriding method of a GridLayout, or a BorderLayout, or a FlowLayout. Or say after few months, or maybe after a year, in the next version of your Java, you want to add three more nodes.

You don't need to change the base design. You don't need to tell the user that you should call the set layout method now by passing a different argument, because there are three more. So user keep on using it. The only thing is what you distribute that contains more amount of classes and user has rather more options.

So at runtime, we select an instance of these concrete classes within the context class. So here is the context. Now, the context over here is a component, which contains the strategy. So the context contains a strategy. And strategy is implementing the algorithm in a variety of ways.

Consequences are this is an alternate to subclassing. We can have strategies, eliminate conditional statements. For example, if we were not using strategy, than what we were doing? Then maybe here in the client class, in the client class, I will check if strategy is equal to one, I will say create call sort from bubble sort.

And else if strategy is equal to 2, I will say call keepsort. And so on. So conditional statements, we would like to avoid, because these cost us on performance. So we prefer other layouts.

There is a choice of implementation. Now, this makes my design brittle. But we have seen on the board with the help of if statement, that makes the design brittle. Suppose tomorrow, you want to have two more algorithms. You have to open the source code, make a change over there, recompile it, redistribute it.

But here in this case, you have choice of implementations. You don't have two hard coded ones again. Communication overhead between strategy and context patterns.

Now this is a negative consequence, because it increases the overhead. You have more number of objects, or rather, a lengthier way to communicate. Your context has to go to strategy. Strategy has to check at runtime which object it is holding. And then it will delegate the application to that particular class object.

And of course, because every strategy is implemented by a separate concrete class, hence we end up having more number of objects. So these, the last two, are the two you can say overheads. And then we have observer pattern, an interesting one.

Observer pattern is used in a very, very interesting way. Observer says it defines one too many dependencies. So you have one system over here.

And you have various-- I wouldn't say elements-- I can say dependents on it. So one too many. This is your main source. And on this main source, you have the various elements dependent on that.

So in this, when one object changes, all of the dependents are updated automatically. They can have many such examples in our day to day life, when we see any softwares. For example, your server is running and error is thrown. Some exception occurs.

So what happens? Say this is my console, my server console. And this is my web client. OK And this is my log file.

All the three will be updated, depending upon the exception, which has occurred. There can be another interesting example. Maybe this is a central server for stock exchange.

And there are various views people are seeing online. Maybe this shows me the data, the table view. This shows me a pie chart. This shows me a statistical analysis. And this shows me a bar graph. Data is one.

And another example over here. For example, you have a check box. When you check it, the view is immediately updated.

You may do it by setting some variable in your application. When you say, for example, you have some data over here. And I said data is equal to false. So this is depicting over here that means when it is false, it should be checked.

If I say repaint and if I make it some value over here, so I will say data false is equal to true. So what it will do? It will just redraw it over here.

So observer pattern is used in variety of ways, in many ways. The ultimate aim is data is one. And the dependents are many. These dependents can be view, or it can be any other kind of objects. Now, the observer patterns separates the data model class from the UI view classes. So there is a separation of concerns over here.

And the UI elements are loosely coupled with the data model, because it is not false. It is not necessary. It will just inform the view that the data is changed. What action is to be implemented at that point. That is the decision of the observer. Observer is a view. And here, we can see observable and observer.

Observable is a data model. So we can see data model class is derived from the observable. And the observer is another interface which is implemented by all the multiple views over here. So observable can have zero or more observers.

We need some attention over here where we can see the methods attach, detach, and notify. So what happens? Whenever an observer is added for observable, then certain view wants to observe certain data model and the observer is created. Immediately there is a method called from the observer to the observable to register itself.

Say, for example, if you want to receive some notification. So you will register with those particular services. So likewise, when a new view wants to observe a certain data, we will attach the observer to the observable, to the data model.

And when you don't want to observe it anymore, you have a facility. You can removed or you can be detached. Now when the change occurs in the data model, the data model will call the notify method.

And the notify, what does it do? It says for all objects in observers. So observers is a collection. So we can keep on adding the observers. And when there is some change, we say observer.update.

So every observable have an update method over here. So we will say when you say o.update, update method will be called in all the observers who are resisted with the service, who want to observe that particular data.

Now, when do we use it? You will need to modify a set of objects that an event has occurred. The set of observing objects can change at runtime. That is why we have that at attach and detach facility over there.

Solution is we can create an abstract class called as subject that maintains a collection of observer objects. So in our case, the data model is a subject. And in these pie chart UI, bar chart UI, spreadsheet UI, all these are the observers.

When the change occurs in a subject, it notify all the observers in its set, all those who have been registered. Now, this is a final solution model. So we have a subject, which is abstract. It is implemented by a concrete subject.

And it has a zero or more observers associated with it. Observers can be associated by calling attach method on the subject. And the concrete observers are here, multiple. So whenever there is a change in the subject, it calls the notify method of a subject.

In that method, it sends the notification to all the observers who are registered. Consequences are abstract coupling between the subject and observer. These are for that.

We are not communicating between-- there is no communication between our concrete classes. There is a communication only between abstract classes and an interface. So that makes it a loosely coupled design.

Supports multicast communication, because a single subject is like a broadcasting. All are registered for a service. You broadcast to all of them that the change has occurred.

Unexpected updates is the negative point over here. Maybe you have used observer pattern unwisely onto a remote system, and there are a lot of operations. And you are sending the notification by making network congestion. Or you are using a single system, and the operations are so frequent that your system is just busy in operations and cannot do anything else, the bottleneck.

So let's take a look at now another pattern, abstract factory pattern. Abstract factory pattern can be used when you want to create families of related or dependent objects without specifying their concrete classes. So interesting example is available over here from Java itself.

Java is write once, run anywhere. So say we create one program where we have a very simple module written over here for log in. And here we have user name. We have a password. And here we have a separate button.

Well, I have written this component, the GUI component. I want to reuse this component in various platforms. I compile this, say, I wrote a class called as login.java. I compile it. It becomes login.class.

Now, this login.class is deployed onto Win XP, Solaris, and MAC. So for example. Now, Win XP will have its own style of graphics, its own GDI, graphic device interface. Solaris will have its own style of handling the graphics. And MAC will have its own style of handling the graphics.

You have written a component, which needs to render a window with certain components inside it. So how do we do it? How the portability or reusability comes into existence over here?

But these are all the APIs. That means all interfaces or abstract classes will be there. And these APIs will be implemented by Windows provider, will be implemented by Solaris provider, and will be implemented by MAC provider.

So this is what we want to see, how it can be achieved in the best effective manner. So it is not like this then because this login class has to be used in Solaris. So I will go to Solaris.

I will write it over there, because I will compile it over there. The reason for this is I want to use those-- I'm running it under this particular environment. The class file remains same. And the rest of the things changes. We will see how.

So we say describing the abstract factory pattern. Now that makes sense when we talk about families of related components, or related objects. When I use my swing components or AWT components in Windows environment.

So that is button, label, scroll bar, tabs. All these things have to be in a Windows style. So it's a group. It's a family of components, family of objects.

Likewise, all these components are objects are there in Solaris. One is a Solaris family of all AWT components. One is a Win XP family for all the components, whatever are available for us. So this is how we can find the solution to this.

We have the peer interfaces. These interfaces are implemented by concrete classes. We have ButtonPeer class, ButtonPeer interface, which is implemented by MotifButton, WindowsButton, or maybe a MACButton.

And then we have a label, peer, which will have a MotifLabel, Window label, MAC label. Likewise, I will have all other components. I will have check box peer. And I will have a Motif check box, Windows check box, MAC check box. Likewise, I will have a factory of all the components.

And the common interface is available in the form of Peer for me. Now, how I will pick up, how I will decide that which one I need. So for that purpose, there is another API called as a tool kit, for example.

And this toolkit is implemented by-- our tool kit is an abstract class. And it has two subclasses over here. Windows toolkit and Motif toolkit. Maybe I will have MAC toolkit.

Now, whenever you deploy your application, it senses which kind of a toolkit I'm talking about. That can be sensed from under which platform your application is running. So when we sense that we are using a Windows toolkit, and when you run your program, Windows toolkit is a factory. It's a factory, abstract factory, which generates all the components of Windows style. WindowButton, WindowLabel, WindowCheckBox, WindowRadioButton, and so on.

And when your toolkit is of a Motif type, then MotifToolkit is a factory, which will produce all the components for Motif. For example, when you select a JDBC driver, if it is an Oracle driver, it will give you all the objects for JDBC purpose from Oracle. And when it is MySQL, it will give you from MySQL. So it produces a group of objects, depending upon only one factor. That is one, which factor you have selected.

So you select a factory. And factory will produce the goods of its own kind for you. Now, problem is a system has multiple families of products-- Windows, Solaris, MAC, and so on.

Each product family is designed to be used together. I cannot use a button of Windows, text field from Linux or Solaris, and a scroll bar from MAC. Whenever I use, I use them together.

You don't want to reveal the implementation classes. We want the user to be at ease. We don't want to tell user, see when you are using button from Solaris, you create Solaris button class object. And when you're using Windows, you use Window button class. We don't. We abstract the user. We give the ease of use to the user and handle the complexity in a different way.

So we say create an abstract creator class that has a factory method for each type of a product. And create a complete creator class that implements each factory method that returns me a complete product. So this is the design.

So here we can see we have abstract factory. And we have multiple concrete factories. Concrete factories produce concrete objects. But the user looks only at the abstract product A, abstract product B, abstract product C, and so on.

Now, it isolates the concrete classes. So dependency is no more. Makes extending product families easy. When you take your program to another platform, you're automatically changing the whole family. You don't need to perform some Excel operations.

And it promotes consistency among products. But the negative point is, supporting a new kind of a product is difficult because you have to create a new factory and a whole bunch of family of products, whatever you want to support.

Here comes a good thing. In the last lesson, we talked about state chart diagrams. Here we see another pattern, which is related to that. That is quoting an object with a complex state. We'll design an object with a complex state.

When we come to the next level, we will say, how do I code it? So we are taking the same example over here. We are taking heating, ventilating, and air conditioning object.

So we have various attributes over here. We say power on. Cooler installed. Heater installed. Boolean true or false whether it is installed or not. Real temperature, upper bound, and lower bound.

We have related operations. Like we can set the real temperature from outside. We can set the upper bound. We can set the lower bound. And then we have actuators. Like we can actuate fan, we can actuate cooler, we can actuate heater.

Now, how the process takes place. How do we code it? We check if power on. Then we check if real temperature is greater than upper bound. Then we perform something.

We say actuate fan true. And then we say, if cooler is installed, then actuate cooler true. We close the brackets, and we check for another state.

Else if real temperature is less than lower bound. Keep on doing a set of operations. And again, check for else, which is the idle state.

Well, this is only three states. So maybe I'm checking the three different ways. There can be a still complex state. I may be having seven, eight, or maybe N.

So how will I go for that? It will make my program very, very complex. So I want to avoid the complexity. As we discussed in the previous patterns also, whenever there is an if statement, we would always like to find an alternate solution for that. So let us see how do we do it.

We can do it by using another pattern, which is called as a state pattern. What does the state pattern do? It allows an object to alter its behavior when its internal state changes.

The object will appear to change its class. So the solution is, we create a separate state interface. And we implement the state interface by number of stable states. How many stable states are there? That many number of classes we create.

For example, in our HVAC, what do we do? We say we had initial state, we had cooling state, idle state, and heating state. So each of these states is a class, which implements state.

And state provides the common operation, like what should be done on entry. What should be done on exit? And what should be done on do?

So we have three methods over here. We say do entry action. Do exit action. And set real temperature. Because when the temperature changes, then only we decide about what change we want to make in the state, from which state it has to move on to the which state.

Now, we did that. Now, we need to change the design of our HVAC class. So what do we do? We add a new attribute over here called as a state. So state is a reference, object reference, of a state interface. And here, we add a new method called as a set state method.

Now, let us take a look at what we do over here. Let us go back to the previous slide. We say, set real temperature. This was the code. Such a complex code.

Let us see what changes we make. Now set real temperature becomes very simple. We say, real temperature is equal to p, whatever the value we pass.

And we say, state.setRealTemp. Now, every state has its own set real temperature method where certain activity is taking place. So we just delegate the operation to another place. That is what we do.

Now, and in the set state, what do we do? When we want to set the state, we exit from the current state, set into the new state, and enter into that state. So that means when you change the state, three things happen.

We exit from the current state. So whatever is the exit operation of that state, that will be carried out. We assign a new state. And we enter into the new state. Whatever we want to do, that will happen.

So here is what we implement. So say we are implementing a set of operations in a cooling state. We say do add entry. We will actuate cooler. And on exit, we will actuate cooler false. That means switch it off.

And in the set real temperature, we check the condition. And we call the set state method. So when we call set state method, we pass the idle state over here. So already, it was in cooling.

So what will happen? It will exit from the cooling. When it will exit from the cooling, it will set the cooler false. And then the idle state will be assigned over here. And we say do entry for that. So that means it will go to the ideal state and call that entry method from there.

So operation becomes streamlined. It is more distributed, more modular, and there are no if conditions. The only thing is, more number of objects have been added. Now, when do we use it?

An object's runtime behavior depends on its state, just like in the case of HVAC. Operations have large, multipart, conditional statements that depend on the object state. Solution is create an interface that specifies the state based behavior.

And then we create the concrete implementation of this in a phase for each state of the object. And then dispatch the state based behavior of the object to the object's current state object. That is what we did.

So here, we have a context. Now our context is HVAC. And we have a state. And we say state.handleRequest. So when we say handle request, the delegation will be done to whatever state the object is in. So this is my solution.

What is the consequence? Localizes the state specific behavior. There's no merging. You don't have a single centralized place. Say tomorrow, you want to add one new state. So you don't need to open the main method and add one more if statement over there, which will make my code brittle.

So here, if you want to add some new behavior, or if you want to change the behavior also, everything is localized. Just go to that class and make the change over there. Your client remains unaffected.

Reduces the conditional statements. But of course, here comes the negative of that. Increases the number of objects.

So makes the state transitions more explicit. And of course, the communication overhead comes because you are communicating with more number of objects over here.

Now, with this, we come to the end of this lesson. We understood what is the design pattern. We also understood the basic design principles. Like we talked about open/close principal, composite reuse principle, and dependency inversion principle.

We also understood some of the patterns, which were actually implemented by Java technology itself. And when we design our own components, we don't think like programmers. We think like designers. And we see that what best practices can be implemented using these patterns.

## 3. Lab 10: Applying Design Patterns to the Design Model - 9m

So there are four activities in Lab 10. The first one applies the design principle Compository Use Principle. And then we implement three different patterns-- Strategy, Observer, and State.

For implementation of Compository Use Principle, here is a case study. So we say we need a system to record the details of various types of vehicles that can move on land, water, air, or a combination of these terrains. The information that is required to be recorded for each vehicle includes various information like weight, maximum dimension, power source, maximum speed, certification information.

Now, our job is to ensure that the system can accommodate these different types of vehicles and can be easily modified for new terrains and power sources in the future. So here is the design which we create. We take an interface called as a terrain. And it is implemented by the vehicle. So we say, OK, not-- sorry. It is not implemented by the vehicle.

Terrain have one or more vehicles associated with it. And the vehicle can have one or more power sources. Power sources can be natural, nuclear, our fossil. So here, we give the various description-- you know, various kind of nuclear fields, various kind of natural fuels, and various kind of fossil fields.

And in the terrain, we have three different options over here. One is for air, one is for water, and one is for land. Now, terrain can be a class. In which case, the maximum speed can be stored in the base class.

And if you don't need it, we can keep it as an interface. So we can see that you can call the method at any point of time. So it can be for a individual vehicle. Or it can be for the whole group of it. So that implements a composite reuse principle.

The second case study is for the strategy pattern. We come back to our hotel case study. And we say the marketing department of the hotel will implement various discount offers that are used to calculate the quoted price. So these offers are like this-- two nights stay for the price of one night, provided it is a weekend, and five nights stay for the price of four nights at any time doing the offer repeated and a 10% discount during the offer period.

So our job is to ensure that the hotel system can accommodate these algorithms with the various offers. And we also ensure that if there are any new offers with the different algorithms, these should also be added in future. So what is the design we provide?

Here, we say, hotel has promotion zero or more. So promotion can be considered as a strategy. And hotel is a context. So the various concrete classes-- free night weekend offer, then free night anytime offer, and percentage discount offer. Tomorrow, if you have a new one, you can just add one more class over here.

And we calculate the discount at every place. So, calculate discount is the algorithm which can be varied at runtime. So depending upon whatever offer is going on, depending on that, we will call the methods. We will pass the objects and the methods will be called from there.

Then we have observer pattern. Again, we have taking a case of hotel study only. So this is something related to check out procedure. So we say when the customer vacates room after checking out, various individual members of the staff should be notified immediately, and departmental display screens should be updated.

The individual staff members should be notified by a message sent to a portable handheld device. These members of the staff should include a chambermaid, a housekeeping supervisor, minibar stockist, and room maintenance. The departmental display screens should show the status of room in various departments, including housekeeping and maintenance. Our job is how we implement this functionality and show that the room is vacant now.

So here we go. Very simple design. We have observable.

And we have Attach, Detach, and Notify, Which is implemented by a room. Now, room provides a central data. When the customer leaves the room, room is available. When the customer leaves the data, vacated is the method which is called.

So in vacated the various activities takes place. And here's an observer. Vacated calls the update method of the observer. And update method will be communicated to the handheld device modification, which will go to the various people-- all of those who have the handheld device. And status display will be updated showing that the norm is vacated and room is available now.

Then we have a state pattern. Here, we have a pseudo code, the same pseudo code implemented for the previous lab exercise related to the account where we had four different states like, active overdrawn, frozen, and closed. So this is the same logic is implemented. If account status is active, allow the customer to do certain activities. Else if it is overdrawn, we allow the customer to do some things, and so on.

So the question is, how we implement, how we refactor this code? We want to move this if statement. We have a complex if over here. We don't want to use this.

So the direct implementation is with the help of a state pattern. So here we have an account. Account contains a field called as Account Status. And Account Status has three different behaviors-- deposit, withdraw, and transfer.

And these three different methods implemented in different ways depending upon the state of our account. If it is account active, we can do something. If it is overdrawn, then something else. If it is frozen, you can only display message and nothing else can be done.

And when it is closed, then certain activities will take place. So this is the implementation of design patterns. We can see that the quoting become simpler, less complex, more modular when we use design projects.
