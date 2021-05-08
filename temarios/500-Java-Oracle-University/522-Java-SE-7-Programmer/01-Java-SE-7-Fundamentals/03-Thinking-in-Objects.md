# 3: Thinking in Objects

1. Thinking in Objects, Part 1 - 18m
2. Thinking in Objects, Part 2 - 22m
3. Practices for Lesson 3 - 10m

## 1. Thinking in Objects, Part 1 - 18m

Well, this Lesson 3 is going to cover thinking about object. You see now, we're going to start thinking about objects. Right? No structural programming thinking anymore, just thinking about objects. Well, in this particular lesson, what are we going to do is we are going to look at analyzing a problem by using object-oriented analysis, which is typically called OOA.

And of course, we're going to identify a problem domain. And we're going to also identify the objects-- OK, once we identify the problem domain, we're going to also identify object. And we're going to look at defining additional criteria for recognizing objects.

We're going to define attributes, and what an operations of an object. And by the way, you see how we now call-- we give it a name operations. Which, by the way, means what? Methods. It means also behavior.

And we're going to look at discussing a case study solution. By the way this case study is going to be the one that we're going to use throughout the course. And we're going to look at designing a class and modeling a class. Again, in this case, designing and modeling a class will be always within the context of unified modeling language, or something similar to unified modeling language. OK?

And then in the second-- in Lecture Number 4, or Lesson Number 4, that's where we're going to look at some of the syntax, how to do all of that.

Continuing with that, and looking at now the relevance problem. So in the relevance problem, typically, we have these questions that we ask. How do you decide what components are needed for something that you are going to build, such as a house or a piece of furniture and so forth. That's the idea.

So again, you're thinking about a problem, and now you're saying OK, let me go ahead and build this product by maybe assembling all these components together. OK, like in a house, whenever we build a house, we're also thinking about OK, in my house, I'm going to have a kitchen, and I'm going to have a bunch of bathrooms, and I'm going to have a family room, or I'm going to have a living room, and so forth. OK? And so that's pretty much what we're trying to get at in this case. And the same thing with a piece of furniture and so forth.

The other question that you have, in general, is that what is the taxonomy? What do we mean by taxonomy? Well, a taxonomy, folks, is a classification of related organisms that have similar characteristics or features called attributes. Like, for example, for some of the animals, you have the fins, or the gills, we have the operations, the ability to swim, the ability to walk, and so forth. And you hear the word taxonomy.

How many of you have heard of web services? Well, in general, whenever you look up a web service, usually you've got the WSDL file again. One of these days, you are going to learn about that within the Java technology. They say we get the WSDL WS file, which is the WSDL file to describe the web servers. You also get the location of the web servers. A lot of times, also, we say we get the taxonomy information of the web servers, because they're classified into taxonomies.

And the other question is how are organisms in a taxonomy related? So, For example, in our case here, when we look at the case of the whales, they will have some kind of connection There is a blue whale. And there's the white whale. And there's one of the grey whale. And then they have some kind of taxonomies that relate them as mammals, as whales, and so forth.

And what is the difference between attributes and values? That's also another good question. Usually, an attribute represents presents a variable, a variable that can hold many more than one value. A value is unique. It's a constant value.

For example, I can say, we are objects of type human beings. But I can say, in my case, it turn out that I have a first name which represents what? A variable. And then my first name is Joe, rather than Lee or Eric and so forth. That's pretty much the value that we're discussing, the value that a particular variable holds for a particular object.

Now continuing with the concept-- now, we're getting into analyzing a problem by using object-oriented analysis. Well, for that, again, in this case, we are going to introduce to you folks a use case. In this case, it's called Duke's Choice. And this Duke's Choice company sells clothing from its catalog. Again, business is growing 30% per year. And a new order entry system is of course necessary.

Here's what happened, folks. We are hired throughout this course to build this new system. So throughout the labs, or throughout the practice labs, that we do on the different lessons, we always keep on among many other problems, we'll also keep on tackling this Duke's Choice problem and of course, trying to create a new order system or entry system for them.

So Duke's Choice-- again, in this case, procedures an online catalog for or rather produces online catalog of clothing every three months and emails it to subscribers. And of course, every shirt in the catalog has an item identifier. And of course, one or more colors and one or more sizes and a description and a prize

We all buy these things. There's a famous one in New England, most probably, folks sometimes buy some clothes from them. I'm not going to say the name. But since it's being recorded, so I'm not going to say that the name. But you folks know about some of these companies where we buy clothes from them.

So Duke's Choice accepts all credit cards. Customers can call Duke's Choice to order directly from a customer service representative, a CSR, or customers can complete an online order from Duke's Choice website. So continuing with the Duke's Choice order process, again as the customer enters the order online, every item availability, quantity, on hand is very fine. If one or more items are not currently available, in this case, then the item is marked as back ordered until the item of course arrived at the warehouse.

Of course, after all the items are available, payment is verified and the order is submitted to the warehouse for assembly and for shipping to the particular, in this case, customer address. When the order is received, the customer is given an orderID and which is again used to track the order throughout the process. Of course, all of those that are phoned in are entered by the CSR.

We should note also that it is a true analysis. You would work again side by side by a company's getting details about every aspect of how the company does its business. Of course, this case study outlines only a small portion of the information needed to create a system for Duke's Choice. And the purpose here, just to learn our fundamentals of Java and that's it. But of course the, problem can grow.

And when you get into the Java e-technology, we'll see that you're going to build enterprise applications that even have the user interface as a web browser. We don't do that in this course.

Everybody is following, folks? Everywhere understands Duke's Choice business. OK, let's go ahead and continue with that.

Now what we want to do is identify a problem domain. Well, a problem domain is the scope of the problem that tells you, of course, that typically will try to solve. Example, create a system allowing the online entry method to accept the no and verify payment for an order. Again, here if we follow the concept off the Duke's choice company, they will have a user interface through which the customer can interact with to order shirts or maybe and so forth. They're in the business of selling clothes.

Of course, because Java is an object-oriented language, one of the main goals of the Java technology program is to create an object to build system. Or more specifically, to solve a problem. So in this case, for example, with the Duke's Choice project, you create a system allowing the online order entry method to accept and verify payments for an order. And after you have determined the scope of the project, you can now begin to identify the object that you will interact with to solve the problem.

And now, so now we have an idea, now what we want to do is try to identify the object. So think about it again. You're thinking about the problem, the domain, and then of course you're having an idea what it is going to be. And then you will think in just imagining, using common sense, of what is this system is going to look like and who's going to interact with the system and so forth. Now continuing with the same idea, let's go right now and identify the object.

Well, identifying an object. Typically, objects, they could be physical or they can be conceptual. OK? So, for example, a customer account is an example of a conceptual object. We never be able to touch an account. But everybody has an account. We all have accounts, checking accounts and saving accounts in the bank.

And of course, an automated teller machine is something many people can touch. I usually put my credit card, rather my ATM card, and then punch in my-- so I can touch it. It's there. That could be a physical object.

And of course, objects have attributes. Those attributes, what they do? they characterize the object, so for example, a size, a name, a shape, and so forth. So I can have-- I can say I have a shirt. It's a blue shirt. It's made of cotton. It's long sleeve shirt. The size is whatever size, medium, and so forth.

And by the way, folks, objects do also have operations and these things that they can do, such as setting a value, displaying the screen, increasing the speed, decreasing the speed, and so forth. That's part of the operations which, by the way, in Java we call them what? Methods. Good.

And that's pretty much-- and by the way, did you know? Here's a question, and it's quite interesting a question. And let me just highlight that. Object names, are often nouns, such as account or a shirt. Object attributes are also nouns, such as a color, a size, and so forth. Objects operations, on the other hand, they're usually what? They're usually verbs or noun-verb combinations, such as diskPlay, submitOrder.

By the way, your ability to recognize objects in the world around you will help you define better object when you approach a problem using object-oriented analysis. So you can always think around here in the classroom, we can think of many things that are objects-- the white board, the desks, the computer, the clock, and so forth. Everybody's following, folks?

So now identifying the objects. Again, in this example, in general, whenever we talk about objects, we know we ask you here, for example, look around in the room and try to identify objects. For example, I can see the clock. And it has, of course, some attributes. And at the same time, it has also some behavior. It gives me the time. It gives you the number of minutes and hours and so forth. And seconds, and so forth.

And did you know that an attribute with only two states is referred to as a Boolean attribute. For example, a Boolean attribute can have what? The two states are what? True or false, thank you, thank you. So like I said a clock can be an object, the chair be an object, a table can be an object. Joy's an object of type human being and so forth.

All right. And here we see, for example. a whale. And in the whale, you have attributes-- dorsal fin, small, the color is blue, the size is large. And then here, for operations, it can migrate, it can communicate, it can eat, it can dive, and so forth. Everybody sees that? Good.

Now what we want to do, folks, is we're going to define additional criteria for recognizing objects. Well, looking at again at the addition of criteria for designing objects, again, relevance to the problem domain. Usually, again we use a bunch of criteria, to further test whether something should be considered as an object in the problem domain. And that would be, again, look at the relevance to the problem and, of course, the independence existence. Does the object exist within the boundary of the domain, of a problem domain? And of course, in this case, if we're thinking about this Duke's Choice, we can think about a shirt as an object. What else? Anybody can tell me? What else? What type of objects we can think of that could be objects and worth treating them or considering them as objects?

Order?

Order, thank you. What else?

Catalog?

Catalog. Thank you. What else? How about the person who orders?

Customer. Customer, thank you. Good job. How about what else?

Sales rep.

The sales rep, OK, what else? And then when you buy something, what do you do? Payment receipt, payment, and so forth. Good, good good, good.

And then, of course, the other question is the object required for the solution to be complete? For example, in this case, the solution of Duke's Choice, it looks like we need a customer, we need an order, we need the payment, shirt, what to sell, whatever we're selling, and so forth. Is the object required as part of an interaction between user and the system? This would be, again, in this case, maybe a user interface, for example, and so forth.

So in general, what we do, folks, in this case, is we pretty much try to use common sense to be able to recognize this object. And also we say the independent existence. For example, an order can exist. And then, an order, it's independent by itself, but usually an order belongs to whom? To a customer or related to a customer.

And that's the idea. So again when evaluating potential objects, ask yourself if the object needs to exist independently, rather than being an attribute of another object.

For example, if I take a look at the shirt. Shirt looks like what? An object. How about now if I take a look at the color? Should the color be an object or should it be an attribute? That's the idea. That's the idea. That's how we think. Thank you. That's the whole idea.

So now what we want to do, folks, is we want to first study the situation by saying OK, this is an object. And I can see that it can be a stand-alone, an independent object. And I can see that it's part of my what? My problem domain. Right? So I know about that. But then the next thing is now let me go out and look at some of the older attributes, and then for example, the color, the size. And I can say wait a minute, these cannot be objects, because they are going to be what? Attributes of the object. All right.

So of course, any object could be a valid object if its relevance or it has relevance of the domain of the problem and has, of course, the characteristics of an object. But it does not mean that it is a good object, of course. The person who models the system or a solution must understand the entire system.

And now let's take a look at possible objects in the Duke's Choice case. So, again, in this case, the slide illustrates a bunch of objects in the problem domain for the Duke's choice, like order, entry, system, again this list is not again an exhaustive one, but of course it's almost there. So you've got a shirt, and of course some nouns that are probably not appropriate objects for the system. For example, facts, verification, payment maybe, those are external objects.

## 2. Thinking in Objects, Part 2 - 22m

And now, we're going to look at attributes and operations. So looking at identifying object attributes and operations.

Well, after you identify your objects, then the next thing that you want to identify are the attributes and the operations. Again, looking at the attributes, they have tendency to be attributes that is data that helps us describe the object. For example, an order ID and a customer ID that helps us, of course, characterize and describe the object.

It could be, for example, a customer name, or a customer address, or a customer phone number, or a customer ID, and so forth. So attributes are like ID or their object, and so forth.

And how about the operations? Well, again, operations are typically the behaviors that usually modify the state of an attribute. Example, delete item, change ID, buy something, and so forth. Everybody's following?

Now, we started looking at some kind of graphics that represent these objects for us. And if you take a look here, on purpose, we created these rounded type of rectangles to represent objects. They are not sharply square. And that's on purpose, because the one that is sharply square represents a class. This is just an object, OK?

So here, I have a customer, and it turned out that the customer in this case is an object. We said, yes, it could be actually an object that represents, in this case, the customer who's trying to buy clothes from Duke's Choice. And it turned out that the customer has a bunch of what? How do you call these guys? Attributes, thank you.

And it can have a customer ID, a name an address, a phone number, email address. And look what happened also. It also has another attribute here, by the way, which we qualified with an asterisk in front of it. This is on purpose to actually define it as what? See customer ID, name, address, phone number, and those could be, again, strings or they could be primitives, an integer, or a double, and so forth.

But on the other hand, the order actually represents what? Another object. So for example, here I have an object that contains another object, right? Here, a customer has his or her order, and that order itself is also what? An object.

Because the order itself has what? It has an order ID. It has data. It has a bunch of shares that you bought. It has the total price. It has the form of payment. Is it a credit card or check or cash? Is that a CSR, again, that you interact with your customer service representative. It has a status [? on top ?].

It also has behavior. Look at it here. Here I have a behavior [? with a ?] method or [UNINTELLIGIBLE] that says assign a customer ID, but here it does what? The one for the order. Calculate the order ID, calculate the total price, add a shirt to the order, remove a shirt from the order, submit the order, and so forth. So all these are operations of what? Of order.

And like we said here on this figure, the customer order contains an order attribute, and the asterisk denotes the attribute to be what? To be, in this case, an object.

And again, this makes sense. For example, you could look at a car. A car is an object, but then inside the car we have what? An engine. That's also an object, right? So an object can contain other objects, no problem.

Everybody sees that? So far, so good. OK, good.

Now, let's look at possible attributes and operations for objects in Duke's Choice case. If you remember from vnode when he said, by the way, Joe, a good example is order, he gave as an example of an object. So we see it here.

And then which is order ID as an attribute. Data, which is again shirts. By the way, shirt is another object, too. That's why we put an asterisk in front of it. And we put S, which is what? More than one shirt.

If we have more than one shirt, which again container should we use two hold those shirts? Just out of curiosity, for those who learned C or C++? How do you call that object that holds more than one object?

Array?

Array, thank you. We also use it in regular English, too. An array. An array of objects and so forth. That's good.

Continue with that, and so we see here that we're going to have a bunch of shirts. Total price. A form of payment, that's also another object, right? How about a CSR? That's another object, too, the status.

And of course, we have what? A bunch of operations which are methods. Calculate order ID. calculate the total price, add a shirt to the order, remove the shirt from the order, submit an order, and so forth.

And since we said order contains a bunch of shirts, we have also what? An object shirt of type "shirt." Again, the object shirt has a bunch of attributes, which are what? Shirt ID, a price, a description, a size, a color code, and so forth.

And of course, you have the couple of operations here. We can have more, by the way. This just for the purpose of illustrating what is it that we're learning. And in this case, it's calculate shirt ID, display shirt information, and so forth. Right? Everybody's following?

And then of course, we have a customer, and a customer object has a customer ID, a name, and an address, a phone number, email, and order, and we already know that on all these an object [? anyway ?]. And of course, it has an operation called Assign A Customer ID. Got that? So now, we see three different examples, order, a shirt ID, and customer ID.

So again, the question that you should have for me is, OK, we looked at that Joe, so OK. But now, tell me, is this enough to represent the Duke's Choice use case? And the answer is, again, what we do is usually you start the main ones, and then we refine the use case to, again, identify what? Other objects. And again, that's the process on that.

And by the way, we have courses to teach you how to actually design and architect applications, too. OK? Everybody's following? Good, good.

But remember, folks, that whenever we think about the analysis of a use case, and then whenever we, of course, try to think about the objects that will be part of the use case, and that are independent, and of course we use them to build the system or to build the application, you need to, again, use a lot of common sense. OK? Good.

Everybody's following? Again, all what we're doing here is thinking objects, and thinking going through the analysis and the steps to identify objects. Are they worth being objects, part of the use case, part of the problem, the domain? OK? Right? Or are they just attributes of an object?

Now, we're going to discuss the case study solution. For that, we have a case study. It turned out that it's Duke's Choice, and look what we have over there, the classes that are worth having as a class. Because remember, once we have objects, what we need to do is build classes for them, their blueprint, so that we can build objects from them, instantiate objects from them. That's the idea. Everybody's following?

So we've got order, we have shirt, we have customer, we have what? Form of payment, we have catalog, we have CSR, and so forth. Again, the table in this case shows the classes.

What we could do, folks, is we can think about every one of them as a class that will have what? A bunch of variables, and then what else? A bunch of attributes, and a bunch of what? Methods and operations. That's what we're going to do, is go in and investigate that.

Let's start with the first one. It turns out that order for attribute, it has what? Let's just first discuss attributes.

Now remember that attributes are variable that represents what? The characteristics of an object, because they hold values. They hold values for that particular object. Because remember that an object is an instance of the class, is an object of the class type for that class.

So here, we have order ID, date, shirts, total price, form of payment, CSR, status, and so forth. How about a shirt? Possible attributes of the shirt are what? Shirt ID, a price, a description, a size, a color code, and so forth. You could find more, right?

And then for the customer, you see it has a customer ID, a name, an address, a phone number, email address, an order, and so forth.

We also have the form of payment. The form of payment has an attribute what? Customer ID, because typically it's paid by a customer. What else? A name, an address, a phone number, email, and of course, an order.

And then, the catalog. It has what? A list of what? Shirts, an array of shirts. Good.

And then the CSR. How do we represent the CSR? With their extension. Their name and their extension. You know, Joe, and extension 3240, and so forth. Everybody's following?

Now that we discussed the attributes, what should we worry about next? Remember that a class or an object always has what? Attributes, and what else? The other one?

Operations?

Operations, right. Operations. Let's go in and look at that. Or methods. Now, we see the behavior, or operations.

So now we see, these are possible behaviors, or methods, or operations of the order, which are calculate order ID, calculate total price, add the shirt to the order, remove shirt from the order, submit the order, and so forth. And then you have the shirt, which again, has a couple of methods, that which is again, in this case, all operations, calculate shirt ID, and display shirt information. And then we have the customer, of course, assigned a customer ID.

In addition, we also have the other ones. Now we have a form of payment, what do we do? Verify credit card number, verify check payment. And then for the catalog, add a shirt or remove a shirt. And then for the CSR process, the CSR typically processes what? He or she will process the order.

Everybody's following, folks? So the whole idea here is to think, again, like I told you folks, what's important is that whenever we start thinking about a use case, like the example of this nice Duke's Choice factory or business, what we need to do is we need to make sure that we start thinking, in the analysis, start thinking about what? What is it that will help us to actually build this application, develop it?

Now, what we're doing right now is all analysis, right? It's all analysis. And of course, the analysis helps us to do what? To specify the requirements, the system requirements specification. And in the system requirements specification, we typically identify what? The services, and identify the objects that we work with.

Why? Because the objects, they make this use case. Like order, customer, payment, shirts, and so forth. Everybody's following?

Sorry. I was going to sneeze. Sorry.

Everybody's following, folks? So you see how every time we think about an object, we think about what? Its attributes, because the attributes characterize and give the characteristics of the object. Plus in addition, the behavior.

Ah. Now we start thinking about what, folks? The modeling a class. Modeling a class. That's what we're going to think about. Because remember that these objects are created from a blueprint. That blueprint is the class. That's what we're going to do.

So designing classes. In general, you typically identify objects. Identifying objects helps you design the class or the blueprint for every one of the objects in a system.

For example, you can think about window manufactures. They often create a single blueprint for every style of the windows, and then of course, after that, they use those blueprints prints to define a range, again, of colors and styles, and then that can be selected when your window is purchased. That's the idea.

So again, we need to somehow create these blueprints that are the basis for any number of windows, in this case, with any number of combinations of colors and styles and so forth. I do not know about windows much, but they usually have the colonial window, and the contemporary type of window, and so forth. And that's pretty much what we are going to see.

And by the way, as a note, the American Heritage Dictionary defines the word "class" to be what? A group whose members have certain attributes in common.

And classes and objects are often used in, again, the field of biology. For example, the marine biologist studying sea creatures is often ask to categorize these sea creatures in a family or a class. For example, in object-oriented, I can say every animal, such as a blue whale in a family such as whales can be considered as an object of type, again, the classic whale.

So for example here, I see these are two whales. One is the blue whale, and the other one is the grey or white whale. And of course, as you see, whales are from the same class. They are similar to each other, but then some of the attributes are slightly different. One has a color blue, the value of the attribute. The other one is white or gray. Some have, in this case, a dorsal fin small, and the other one has, again, the dorsal fins small or the same, or it could be the size is large, the other one the size is small, and so forth.

Everybody's following? OK, good.

Now what we want to do is we want to look at class and resulting objects. So refining that Duke's Choice case study, we could say that a class is the way you define an object. So classes are descriptive categories, templates or blueprints. For example, a shirt could be a class defining all shirts to have a shirt ID, a size, a color code, and so forth. For example, I can have a shirt that is a blue shirt, a short sleeve, long sleeve, made of cotton, made of polyester, and so forth.

And of course, every shirt will have unique values for the attributes. For example, the large blue shirt costs $29.99, and it has a shirt ID, whatever it is over there. And of course, another shirt which is the maybe yellow shirt or the green shirt costs, in these case, $39.99, and maybe it's a long sleeve, and so forth. So again, in this case, we will revisit this shirt class throughout this course.

Remember, folks, that in the Java programming language, attributes are represented using variables, and operations are represented using methods. That's what we're going to see from now on in Java. Everybody's following, folks? Good, good.

Now what we want to do is we want to model classes. Again, what we're doing here is using UML type of graphical language to be able to, again in this case, model classes. So again, the syntax typically, whenever you represent a class, you have a box like this, which has three areas. The top one represents the class name. That's the name of the class, again. And the second area, in this case, which is in the middle, that's pretty much representing the attribute variable's name, which is the name of the variable of an attribute.

Like in this case, give me an attribute for the shirt. Like, what?

Color.

Color, size. Material. And the style, and so forth.

And then, again, you have the list of methods. And by the way, some of the attributes do have a range of color. For example, in shirt, we're going to see that the color is going to be the blue or green or red. So that's a range.

And we also have methods, and the methods pretty much represent the operations of the particular class. Everybody's following, folks? Let me know if you have any questions, please.

Ah. Now we see an example of modeling a class. In this case, we were modeling a class called what, folks? Shirt. See? And this shirt has-- the middle one represents what? This one that I just highlighted. What is that?

Attributes.

These are attributes. So it has a shirt ID, and a price, a description, a size, and a color. It turned out that the color has what? A range of values. Either R for red, B for blue, G for green, and so forth.

And how about these? What are these, folks? They are operations or methods. So you see how, next to the methods, we always put what? Open parentheses and closed parentheses. That's to represent the method. That's how a function is represented in Java. Right? We'll see that again later on.

So we're going to use UML-like modeling. How many of you know a little bit about unified modeling language? How to create a class. We, by the way, have a five day class. I will tell you about it on Friday about the day, if you're interested in that particular class.

So the UML is used to, again in this case, model the objects, the attributes, the operations, the relationship in the object-oriented program, how actually two objects interact with each other, all of the interaction or the association between classes. Again in this case, used to model the dynamic behavior of the system by showing you collaborations among objects and changes to the internal state objects, and so forth.

And there are, by the way, many courses available to teach UML. And we do have, actually, courses, and we'll let you know about that. Of course, you can use a simple text editor to complete the practice three. Again, we want you to, in this case, obviously get into the habit of finding objects that make up your classes, and so forth. And of course, use UML to represent this object, if you want.

We have a quiz, folks. And the quiz here says, choose the response that represents two different properties of an object. Ah ha. So we've got A, B, C, and D.

So the two properties that represent an object are typically what? Attributes and operations, and of course, the answer is C. Good job.

Here's another quiz. Which of the following statements is true? Again in this case, we have an object is a blueprint of a class. What do you think? It's the opposite, so that's false, right? The class is a blueprint of the object, not the other way. Got that?

An object and a class are exactly the same. That's not true.

An object is an instance of the class. That's a winner. Yes? Because we said that an object is an instance of a class.

How about the last one. An attribute can not be a reference to another object. That's again, what? False. An attribute can be a reference to another object. Got that?

So what we've done in this particular lesson, ladies and gentlemen, we looked at analyzing the problem by using object-oriented analysis. We looked at identifying a problem domain. We look identifying the objects. We looked at defining additional criteria to recognize objects. Again, we used the [? comment, ?] what is that? The attributes, and the operations, and so forth.

We defined attributes and operations. We looked at the case study solution, which is the case study of what? Duke's Choice. And we looked at designing a class. And then we looked at modeling a class.

## 3. Practices for Lesson 3 - 10m

After, of course, finishing with the lecturing Lesson 3, which talks, of course, about thinking in objects, where we looked at analyzing a problem by using, in this case, the object-oriented analysis, we looked at the concept of identifying a problem domain. We looked at a bunch of criteria for recognizing objects. We looked also at identifying object attributes and operations. We looked at how objects, again, can contain other objects. And we looked at an example of case study, which is the Duke's Choice.

Let's go ahead now and look at practices for Lesso 3. So it turned out that, again, and then we specified the solutions that are in the folder labs/solution/lesson3. So here they ask us to analyze a problem using object-oriented analysis. So again, in this case, they then ask us to read the case study as preparation. So the case study says, folks, that a soccer league needs a system to track team and players' standings. Again, at any moment, administrators want to be able to report a list of games played with results, a list of teams are ranked by wins, and of course a list of players on each team ranked by goals scored.

And the tasks, in this case, our task is to produce an object-oriented analysis for a Java technology application that tracks soccer scores. Again, the program should track the list of players on every team, ranked by goals scored, the list of games played with the results, and the list of teams in the league, ranked by wins. Again, we give us a hint, in this case, and we say, we can think of the objects as nouns, attributes as adjectives, and operations as verbs.

As an example, player is a noun. The player's name is an adjective that describes that noun. And then add, and of course an add goal is a verb. And the application should be able to generate statistics for teams, players, and seasons.

For example, Step 1 here, open the text editor by selecting start, program, accessory, notepad. Save the file as D:/lab/lesson03/00-analysis.txt. To get started with the high level classes that are included in this problem, you can list them in the text editor and use dash lines to separate the objects, attributes, and operations, as shown in the screen shot. So they showed us an example.

Again, number four optional, but still we want to take a look at it. You can use the UML, UMLET tools if you want, if you choose to. Again, double-click on the UMLET icon from the Windows desktop to launch, of course, the program.

Let me just show you that, just as an example. So obviously, in this case, we can go ahead and look at the UMLET. So here it is. And of course, you can go ahead and make use of that if you choose to. And this is just a tool that allows you, in this case, to do your design using UML notation, like here representing a class, or, again, this is a class, and a class here, a detailed class with the name, and then, again, the attributes and then the methods and responsibilities also, which means it interacts with other objects and so forth. You can also see here some folders, and you can see, again, the different arrows that you have here.

And of course, you can represent the package. Here's how we represent the package, here's how we represent the use case, and so forth. OK? And that's pretty much, again, this is a thin type of a UML tool that you can go ahead and use it. And by the way, you can download it and install it on your machine too.

Anyway, let's go ahead and come back now, in this case, to our particular practice. And here, again, we give you, so they asked this solution here where we have players, team, game, league, goals. And the asterisk denotes an attribute that also is an object.

So let's go ahead and look at the first, the analysis. And for the analysts, it turned out that we gave you this analysis where we tell you, in this case, I just put them into a text editor in NetBeans. You could choose to do that, or you can just use the notepad. So the asterisk denotes the attributes that are also objects. And you see the player has an ID, a name, and number, and of course a team. The player has to belong to a team.

A team, by the way, is an object too. And the team has an ID, a name, the number of players. Again, the player is an object itself. This would be an array of players. And of course, it has an operation, get ranked player.

And continuing with that, we have the game also, which is another object. And the game has an ID, a Team 1 score, Team 2 score, again the goal, again in this case, and get the results as an operation. We also have a another object which is league. And league, of course, would have teams and games, and we can actually have operations like get game results, get ranked team. And of course we have a goal as an object, which has an ID, it has, again, a team and a player and a time when, of course, the goal was scored.

All right. Continuing with this, now in Practice 2, what they asked us to do, of course, is design a programming, in this case, solution. So the assumption is you have completed identifying the objects, attributes, and operations that you found in the Practice 3-1. We already looked at that. And our task is to produce a design for every one of the classes in the earlier system for tracking system scores.

Again, remember to use CamelCase to name your classes, attribute, variables, and methods. Also identify a valid range of values for every attribute where a range is known. And of course, use square brackets to indicate an attribute that represents a collection of values. Again, in this case, would be the array of players. Use parentheses to identify methods.

Again, in this case, we go ahead and open if we want to take a look at that. We're going to this 00-design, the file, so that we can recognize it that this would be a design.txt. Use the classes' variables and operations that you identified in the previous practice and develop method names and, therefore, operations. Again, the screen shot below is an example. OK?

And then, of course, you can go ahead and use the UMLET icon or the UMLET tool just if you want to use that to represent your classes and so forth. And of course, by looking at the solution and creating all of this. So obviously, in this case, you can go ahead and make use of this. And then you can go ahead and pretty much move it down here and change in any way you want. And you can go ahead and pretty much move anything, any type of tool or any type of graphics that you want to use to represent your classes and how they interact and so forth. You can go ahead and do that by dragging and dropping whatever you needed to do from the right side to the left side.

Continuing with the lab, and pretty much in this case let's go ahead and look at the solution that we gave you for these particular use case. For that, I'll go back to NetBeans, and I'll go ahead now and open the 00-design.txt. And you see that now we have the player with, again, the ID, the name, the number, and the team. And the team, again, in this case, a class would have an ID, a name, players, and array of players, and of course get a ranked player as a method. The game will have, again, in this case, as attribute ID, Team 1, Team 2 score, and the array of goals, and of course the get results, which would be a method that will give you the results.

And then we have a league that, of course, in this case, will have a couple of arrays as attributes, one is array of teams, the other one is array of games. And then it has also a couple of methods, get game result, and get game teams. That would be, again, methods that return either the results for you or the ranked teams. And then, of course, we have the goal. The goal, of course, class would have an ID, a team, a player, and a time.

And by the way, while doing your analysis and design with your colleagues or by yourself, you also, by the way, might find other methods and, of course, other attributes for the different objects here or classes. And it's just perfectly all right. Again, the whole purpose by doing this practice, folks, is just to show you what is it that you guys are going to do in terms of the analysis and how you're transforming analysis into design. That's the whole purpose for this particular practice.

Good. And that, of course, ends the Practice number three. Thank you.
