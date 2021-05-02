# 13: Refining the Class Design Model

1. Refining the Class Design Model - 57m
2. Lab 13: Refining the Class Design Model - 17m

## 1. Refining the Class Design Model - 57m

We are back into kind of merging of design and architecture. We have seen various stages over here till now. We talked about design in lesson number 8, 9 and 10. 11 and 12 we dedicated for architecture. And we talked about the various things in architecture-- like we talked about some patterns, like tiers and layers pattern. We talked about MVC.

We selected our model, that is, which kind of enterprise model we want to use-- that is, single tier, or two tier, or application-centric [? n-tier, ?] or web-centric [? n-tier ?], and so on. We discussed in detail about Jim the various tiers in the previous lesson, like which component should go there, and how the interaction will take place, and so on.

In the end of last lesson, we just talked about the solution model. We had a glimpse of it. Now let us see practically what we do to make it ready to be given to the implementers. And that is what we are going to do in lesson number 13, that is, refining the class design model.

We will refine everything over here. We will refine our attributes. We will refine the relationships, the methods. We will add some new methods, like constructors. We may add some new behavioral methods. and we will create components with interfaces to follow the best practice.

We'll see this. Now we are going to talk about solution model. And this model can directly be given to the coders. It can be given to the coders for the development purpose. So in a way, what the coder needs to know about anything when coder wants to implement-- that means coder wants to write the code-- the components should be very close to the technology which we are using. And that is what we're going to do over here.

So we will see the classes which we have created at the analysis time. So we will take those classes, and we will bring them very close to the technology which we are going to use to develop our software, or to develop our product.

So, in the design model, we talked about that interaction diagrams. We identified the models with complex object state. We applied the design patterns. And now, what we are going to do to the design is we are about to refine the design model to satisfy our solution model. So we created a solution model in the previous lesson. We will see here how we can refine that design model to satisfy our solution model.

So let's start with the defining attributes of the domain model. We know what an attribute is. It's a data declared, sometimes defined in the class. So we'll see about the attributes over here. We will refine the metadata of the attribute. We will choose an appropriate data type. We will create derived attributes, and we will apply encapsulation.

So let's begin with the attribute metadata. When we talk about an attribute in a class diagram, we understand the only thing which is mandatory is the name of the attribute because it is not a programming language, so we are not bothered about what data type it will be. As a rule, I must specify the name of an attribute, and that we have done in the analysis time.

But here, we will see, because we want to bring it close to the implementation, so what all refinements we are going to do, we will refine the name-- say, for example, let us take a look at this. Say, in the analysis time, let's just have a small thing over here. So let us say at the time of analysis, what activities I did. And now, what activities I will do at the time of design.

At that time of analysis, say I wrote the name attribute as first name. Now when I come to the design, first thing is I know that this particular name cannot be considered as a variable name. And what I want to give to the programmer is the names of the variables which can directly be used in the development time.

So here we will see that when I want to convert this name into a variable name and put it over here in the design model, I will become technology specific. I will become technology specific. So here we will see that, say, if I'm creating this refinement for C++, I may use Hungarian notations. Maybe I will say lpstr. And then I will say first name.

But certainly, in this particular course, this is the only example I will give like this. I will not do this because I'm using Java. I'm creating my model for Java. So Java uses camel casing.

So what will we do? We will convert this into first name. We will use lower camel casing. That's what we're going to do. So that kind of refinement we will do for the various attributes.

Next, we have visibility. Now, when we created a class node, or, you can say, a class over here, we may have done some name of the class-- say, I say a customer class, for example. So here, I may have returned the first name, last name, and so on. So I'm not giving any visibility. So here, we will see that, even when we talk about the visibility also, we will be bothered about the technology.

So we are bothered about the technology. When we talk about the visibility over here, let us take a look at this. Of course, again, technology specification is going to be a part of it. We will say minus if the variable is supposed to be declared as private. We will use plus if it has to be public. We will use hash if it is supposed to be protected-- now this remains common almost in all the object oriented technologies. But Java has a specific specifier, access specifier, which is called as default.

So we will see, over here, we will use tilde if it is a default attribute, default attribute. Then of course, we will talk about the data type. We will talk a little more in detail about the type in the coming slides. We will also talk about multiplicity.

So multiplicity tells me whether it is a single occurrence or whether it is going to be multiple occurrences-- if it is a collection, or if it is an array. We can also assigned the initial value. Maybe we know that most of the attributes will start with the same initial value. So we can start with the initial value and constraints. Three constraints can be there-- changeable, add only, and frozen.

If you don't write anything, it is changeable. Changeable means we can read and write, both. And if it is a constant, or a final, we will write the value only once and never change it through, or the program execution, it will be frozen. And if it is a collection, then I will say add only. That means I can only add the values in the array. I will not remove it.

So here we can see in the slide where we are talking about how is the syntax for the attribute metadata. Attribute metadata. So we can see here very clearly that, at the analysis time of a class is like a customer.

So we can see here, at the analysis time, we had a customer class. There is no data type defined. There are no constraints defined. Attributes are just in the raw state. There is no refinement on that.

But at the design time, we say first name data type is refined as string, and the constraint is frozen. Last name, we are taking it as a string. Again, the constraint is frozen.

Now, there can be some kind of data type where we have to think about. So there may be some data types where we have to think about that can we just represent them in the basic types. Or should we go to represent the variable so that they give a representational transparency.

So and in the design time, we can write like this. We can write a stereotype by showing that design time class is refining the analysis time class.

Now choosing the appropriate data type, we have to think about a few trade offs, like representational transparency, does it match with the-- what kind of a data is it, and what is it doing? Computational time and computational space is very, very important. It's a very long time we can say this kind of complexity, you know, whether a computational time is of importance, or computational space is of important, time is important when you have a data-centric application, and there are a lot of queries, there are a lot of people who are querying for a particular value or a particular data. So computational time will be, maybe, I can think of that if it is an enterprise application, maybe time will be my priority. But if it is an embedded application, like maybe I'm talking about the application on a mobile, so, naturally, the space will be my priority over there.

Now talking about choosing the appropriate data type. We are taking an example of phone number over here. So phone number can be used as an example over here. And let us take a look at-- so I have defined phone number.

So I may think, should I take it as a string? When I want to think about it that I want to take it as a string, my criteria may be the data might require mapping between the UI representation. We know the UI representation is always a string. You know, whether we are using GUI or web UI, whatever the data is going in from the UI, there is always a string and the storage DB representation.

So the second option can be, I will discuss about option number two, long. And the last option that is in [INAUDIBLE]. So long conserves space. Long is 16 bytes. No, long is 8 bytes in Java. And we can see that it can take big numbers. And the same is the case and the [? integer ?] array. Maybe long, I may reject-- on one ground, I can say that, OK, long means I want to represent, say, the number like this, I will say plus 9108212413302 or something like that. It's a very big number.

So my first constraint can be maybe it can it cannot take the data. And second thing can be that when it is a number, am I doing any computation? I'm not doing any computation on the phone number. So I would not like this to be long. Although I can represent it as an integer where I can store it as an ISD code, I can store it as national code, and then I can store it as another number.

So again, it is and integer added. But again, I'm not going to do any competition over here, no competition over here, no computation over here. So I reject the whole thing. I don't want any numerical type.

What about character [? adding? ?] Yes, character [? adding ?] can be taken. But there's no extra advantage than the string. So I would not like to go about it. So what I can do is I would like to create a class called as a phone number. We can do like that.

And we can take, over here, maybe small strings. I will prefer a small string, so I will say ISD code. Of course, I will do private over here. And again, I can do private. And I will say string. And I will say SDD code. And then I can say private, another string, and I will, actually, phone number.

So I'm using a general term phone number considering that phone number. And of course, I will have the methods, the operations, which can be performed over here. A similar kind of thing can be done. With the address.

One more utilization of doing this kind of thing is that this brings reusability. I can reuse it in any application where I require phone number. And I think it's a very mandatory kind of a field of which will be required in a variety of applications. So a similar kind of thing can be done even with the address. So we decide to go with a representational transparency kind of a thing.

Then we have creating a derived attributes. This is also very interesting and a useful discussion over here. So say, for example, we want to keep track of the age of a person. Say it is maybe an insurance-related data or wherever you need the age. Maybe you have some package depending upon the age that depending on the age, you are giving certain privileges or something like that.

So at analysis time, I will say age of the person is a field. Now, the question is, when you are talking about the age, every day the age is changing. So what will we do? After every month, should we run some utility that, whatever was the age, add something more to that, or every year, or something like that? Looks stupid. We don't want to do that.

So what do we do? At a design time, we say, OK, I don't go for age, but I say date of birth. Now this is a field. Using this field, I can get the exact age at any point of time. So this is called as a derived field. So when I use it as a derived field, in the analysis time, I will use it like this. So it is a good concept to use derived field where the data is constantly changing.

Then applying encapsulation. Now this is the most basic rule, right? Starting from lesson number 1 till lesson number 15, we are always talking about encapsulation. So the basic purpose of object oriented is encapsulation.

So a simple rule-- make all the data private. And if it is utterly necessary, you want to use the variables directly in the sub classes. Then you'll make it as protected. Now when you make the data as private, what will happen? You will not be able to use that data outside the class. So when you cannot use the data outside the class, what you need?

So here we are putting encapsulation, which we have missed over here. So make all our data private and add accessors, or getters, to almost every field. You can miss the getter if you do not want to expose a variable or an attribute outside.

Maybe there some variables, or some attributes, which you don't want to show outside. you're keeping it only for some [? intrinsic cues. ?] So in that case, I will not use an accessor or a getter method. Otherwise, I will use an accessor or getter method.

And I will add the mutator, or a setter, method if the data is not read-only. Now, we used the key word frozen. You will see another word is also used called as read only.

So read only, or frozen. Read only means you can assign it once and keep on reading it. You cannot change the data later.

So read only or frozen data, we will not make any mutators, or setter, methods because they bring about the change. Otherwise, we will go for only, and only accessors in such particular cases.

Now this is, you can see, it's an example of encapsulation. So we can see over here that all the variables are private. We can see attributes-- minus first name, minus last name, minus address, minus phone. And we can use the stereotype to show that it is an accessors, list of accessors. And here we show mutators.

Now we can see, over here, because the first name and the last name both are declared as frozen, so there are no mutators over here for firstname and lastname. And we see only and only accessors or getter methods are there for this.

So now let us talk about the second part of this lesson, that is, refining class relationships. As we can see, there is no clear distinction between analysis and design, especially in regards to modeling class associations. But still, we will address some of these issues. We'll talk about the type of the association, whether it is association, or aggregation, or composition.

Direction of traversal. We will talk about the navigation. We will talk about qualified associations. Declaring association management methods, resolving many to many associations and resolving association classes.

First, let's talk about the relationship types. So three relationship types we can see. Association, aggregation, and composition. These relationships help us how? One class will access the content of another class. It will also talk about the lifetime of a particular object in relation to another.

There is a fourth type of relationship that is dependency. So dependency we don't consider much over here because, in dependency, what happens, we have a particular class over here. And we have certain methods, and, inside this method, we want to use instance of a particular class.

So it's scope is only and only within the method. So dependency, we are not bothered. There is another one called as inheritance, which is a tightly coupled relationship.

So inheritance is a completely different things. Say if this is a superclass, and this is a subclass, and I will have inheritance, but it should satisfy, kind of. So this also is of a completely different type.

So the other kind of associations, relationships among the classes, we can say major three- that is, association, aggregation, and composition. So let us talk about the association first. OK, the slide says the semantic relationship between two or more classifiers that specify a connections among their instances. Looks a little typical, right? So let us take a simple definition. We can define association like this.

Any object will have a lifetime. And any object will have ownership. OK So we will define these three relationships of association, aggregation, and composition on basis of this.

So we say, if it is association, in association, every object will have their own life cycle, their own life cycle, and there is no ownership. There's no ownership. They will exist independently.

Like, for example, one student can be associated with multiple teachers. And one student can be associated, let us make it like this. Say if you have a student, and you have teacher.

So one student can be associated with multiple teachers. Now when the student is not associated with one teacher, or when the teacher, say, leaves, and somebody else comes and takes his place, student can still be associated. So that means students and teacher are not dependent upon each other. Their life cycle is not dependent upon each other. Student and teacher can exist independent of one another. And student and teacher don't own any kind of a relationship of ownership.

Like the slide says, an example of a customer and survey. Customer is not created because of survey. Customer exist independent of survey. Survey is not created only for one particular customer. It doesn't depend on that. So they may get associated. They made get associated.

And once the job is over-- so what we can do, in survey, we will have a customer object. We can have a set customers and get customer method for the survey. But the creation of the customer object is outside the survey class. It's outside survey. Its life dependency is not on there.

And a customer simultaneously can be associated with multiple surveys. So that means survey is certainly not an owner for a particular customer. And so is the case for the survey. One survey will not belong only and only to one customer. Many customers can keep on doing survey at the same time. So this is association.

The second type of relationship which we have is aggregation. So we say, on the slide, a special form of association. So that means it is something more than association. That specifies a whole part relationship between aggregate and a component part. Say, for example, in terms of lifetime and ownership. What we say about aggregation?

When we talk about aggregation, over here, so we say, as far as lifetime is concerned, they have their own lifetime. So that means they are not dependent upon one another for the lifetime.

So that means if one dies, the second can still survive. And the interesting part is there is an ownership, has an owner. So we are taking an example of a room and reservation.

So what happens over here? Like, for example, we have a room. And we have a reservation. We create a room object. We created a reservation object.

Now say reservation is from, say, 14th April, 2014 to 17th April, 2014. Now, this is a room called as Robin. Now this Robin room is associated with this reservation.

So that means our reservation class, when we create a reservation class over here, so a room is an attribute. So this room is associated over here. So that means this becomes a part, whereas reservation is an aggregate.

So reservation has a room. Has a room means that room cannot belong to any other reservation during that period of time. So there is an ownership. So that means from 14th April 2014 to 17th April 2014, reservation number 1076 is the order of this room. And this room, for this period of time, cannot belong to any other reservation. So that means there is an ownership.

But after 17th April, when this reservation is over, customer checks out, what do we do? We go to this room, and we make available flag true. So that means reservation was dismissed. Reservation object is destroyed. It is no more effective. But room continues to exist.

Or there can be another chance. Say Robin room was being associated or aggregated within this reservation. The customer needs a different room type. So what happens? There is another room called as blue.

So what does the customer do? The customer says, I want to change it. So even though the period is between 14th April to 17th April, so this room is canceled. And this room is now aggregated over here. So Robin room becomes available. So that means a reservation and room both keep on existing independent of one another.

So there's no lifetime dependency. But there is a dependency of ownership. So that is what we have in aggregation.

And then we have composition, the deadliest of all. We call it as a death relationship. If we make a small table over here, we say association, aggregation, aggregation, and composition. And here, we say lifetime, or you can say life, and ownership. Life cycle, we can say.

In association, there is no dependency on life cycle. And there's no dependency on ownership. In the aggregation, there is no dependency on life cycle. But there is a dependency of ownership. And we call it as a has a. That is what we have.

Composition, we call it as a death relationship. So that means both the lifetime and the ownership relationship is there. As the slide says, a form of aggregation. So that means something more than aggregation that requires that a part instance be included in, at most, one composite at a time.

And that, the composite object, is responsible for the creation and the destruction of the parts. So here, in this case, what happens-- we are taking an example of reservation and payment.

Now once the rooms are accepted by the client, by the booking agent, then the payment will come into play. When payment guarantee is yes, then reservation creates a payment object. Reservation creates a payment object.

And in case if reservation is canceled, the payment object is also destroyed. At the level of code, I can say like this-- that we will have payment. Payment is equal to new payment. This statement will exist inside the reservation class.

I can show you one interesting composition example of the compositional over here itself. As we can see over here, we can see PDF exchange viewer. We can see two tabs. So this is a composition. The object D6180HDC21_EP AND [INAUDIBLE] have been created within the main window of this. If I close the main window, then both the tabs are automatically closed.

So this is another example of-- so this is about association, aggregation, and composition. Now then we talk about navigation. You must have seen that if I take you to slide number, I think, 252-- let us take a look at that, let us go over here. I just want to show you that, in that lesson, we just did not bother about this.

So you can see, over here, this part over here. This part. So here, what happened, we are saying guaranteed by-- reservation is guaranteed by payment. Here you can see reservation and room. There is a navigation over here.

But reservation to payment guarantee, there's no navigation. So that means we are not-- so we can see here that, at that time of analysis, we we're not sure that who will access whom. Navigation will tell me who will access whom.

So here, we understand that if we do not draw any kind of an arrow over here, just like we can see over here, there's no arrow. Implicitly, it is a bidirectional relationship. That means room can access property. Property can access room. What does it mean?

That means in the property class, I may have set and get for room. And in room, I may have set and get, or set or get, for property. So that means both can access each other. It's a tightly coupled-- it shows a tightly coupled relationship.

And remember, in the very first lesson, when we were talking about, we said we want loose coupling. It's a tightly coupled. So we try to avoid it even though, at one point of time, we may find that reaching to one object from another may be a little lengthier, but, still, we prefer a loose coupling.

So we should be very wisely thinking about that who can access whom. So to make it sure, even it is a bidirectional, we make it explicit, as we can see in the second diagram over here. So room and property both access each other. And we write the arrow on both the sides.

And if we want to show uni-directional relationship, we will say property access room in the third one. So this is an explicit unidirectional. Or the room accesses property. So that is how we can show the navigation.

Now, to show the refinement of the navigation, as we can see over here on the slide, so we can leave, just like we left for reservation and payment in our domain model. We were not sure. And later, at the design time, we decided it's not good that the payment can access reservation. Doesn't make any sense.

So we said, OK, we will access reservation. Let the reservation access the payment. Now then we have qualified associations.

Now we can have different kinds of associations. We can have one to many, one to one, and many to many. One to one, there is no issue. There is only one on both sides. So they will communicate.

Talking about if it is one to many, and you'll want to qualify it. So when it is qualified, when it is one to many, for example, we say one property can have many rooms. And a room is qualified by its name. So that means property accesses room by its name.

So this is another way, at the design time, how we can show. We can say a property accesses room by its name. And from the room, we put an arrow back just to show that it happens multiple times. So that means it is a one to many relationship over here. So that's how we show.

Now when we have relationships, just like we saw other there on the board, so we said, when property accesses room and room accesses property, what do we do? We need to have the relationship methods inside a class. That is what we want to do.

So we can see, at the design time, what we can say? We know that customer and survey are associated. So there's a relationship. So what I will do, in the survey class, I will write get customer and set customer method.

Now this, I may not do at the analysis time because the associations, or the relationships, are finalized. And their types, whether it is an association, or aggregation, or composition is decided at the design time. So I may do this activity at the design time.

Then we can see, over here, if there is a multiplicity-- like property contains-- property and room is one to many, say, for example. If it is one to many. So what happens?

In the property class I will have get rooms method which will return an iterator. Returning of iterator shows me that it has a collection. I may have an attribute over here in the property class which can say rooms. And it may say that it is a list, or this is an [? add-in ?] or any kind of thing.

So we can add a room by using a add room method. We can remove a room by using a remove room method. But when we say get room, we are not saying get room. We are saying get room. And look at the return type. The return type is a collection. It can return me an iterator.

So talking about many to many relationships-- this is an interesting area. So many to many associations, we don't have any special classes for this purpose. We will try to simplify it.

So we'll see what, possibly, we can do. Can we simplify it from many to many to one to many? So it depends upon, we are taking an example of a person and car. Say we want to keep track, a person has how many cars?

So you are not into the trading business where you want to keep track of who were the various owners of this particular car. Or maybe if you are a trading company, you just want to know that who is the owner, and who is going to buy it? You are not keeping the life history of the car, at different point of times, who was owning it.

Then, in that case, I can say, OK, I am bothered only and only about how many cars a person has. So I can reduce that relationship. I can simplify it from many to many, from one to many. A person has so many number of cars.

If I am a trading company where I need to know about both, I can again simplify it in two different associations where one person can have many cars, and one care can have many ownerships. So this is another way I can do it.

Still, there can be a chance that you have many to many, but the number is very small. You can say the game and a team. So we know many games can be played by two teams.

So we can do two things. One, we can simplify. We can refine it that, within the game class itself, we can put the attributes for both the teams, or, if it is not acceptable, and you'll have to go otherwise, you want to keep track of everything, then we can go for a association plus, and we can keep a class which will keep track of both the things.

The similar thing could have been done even in car and person thing also. So if we want, we can create an association class here, as we can see. So we say game, two teams, and multiple games. So we have team score over here. So we refine. We try to refine it into the multiple associations where we say, OK, many games are related to two teams, and one team can have multiple team scores over here within the class. So this was about that relationship.

So then let's talk about the third part of this lesson, that is refining methods. Methods represent operations and responsibilities. Now the methods can be identified at various stages. Methods can be identified while doing the CRC analysis, that this, class, responsibility, collaboration.

If you remember, we had done something like this. We identified a key abstraction, and when we identified the key abstraction, say it was a reservation, was one of the key abstractions, and we created a CRC card, something like this.

And we said, OK, class name is a reservation. And collaborations are with the room, with payment, and with customer. And we said, OK, it has a reservation ID, a room, type is there, and then we say, make a reservation is there. Then find rooms are there. So all these were considered as a part of the responsibilities of, for that particular class.

So we identify the methods during CRC analysis. We also identify the methods during the robustness analysis. All of our service classes, all the service classes are actually representing all these operations.

And, at the design time, we identified, when we applied encapsulation, we made the attributes as private. We required that accessors and mutators to access these variables, or to access these attributes.

In addition to that, when we talk about the relationships among the classes, when we talk about association, aggregation, and composition, depending upon the type of relationship, we may need to introduce some methods in that particular component or class.

There can be other additional methods which are identified, like object management. So for object management, we may need to identify methods for creation of an object. Creation of an object will be done by introducing constructors.

There can be a requirement for the object management, that is for the destructions which is done with destructors. Now you must be wondering why I'm writing destructors over here-- because Java does not use destructors. I mean, Java uses destructors, but not for me. So when it is Java, I will only and only talk about constructors because Java is an auto-garbage collection language.

I can also introduce unit testing methods. Now unit testing destructors can be introduced in a variety of ways. Some people just add some temporary methods to get the data or to introduce some print statements within the method itself. But, of course, every IDE provides us a facility to plug-in-- I will talk only in terms of Java, most popularly, we use something called as [? JUnit ?].

So we are talking about design. So we can create a test suite over here. And we add the various test cases. So these are also the methods which we can identify.

In addition to that, we can have methods, additional methods, for recovery, for backup, for inverse, for complementary operation. Say you have made some transaction. And that transaction is a long chain of other small transactions.

And at the end, we come to know that the transaction will fail. So when the transaction will fail, already, so many commit, has already happened. So I need a composition transaction. So I may write some additional methods.

And sometimes, it so happens that you just cannot role back the transaction right from within the transaction. Say we book the reservation, we made the reservation, and we did not somehow get the flight ticket for those particular dates. So I need to cancel it. So what do I do? I write a [INAUDIBLE] method to delete this particular transaction, something like that.

So we can have additional methods for recovering some data, or to do some other kind of operation. So methods can be identified. This is how the syntax of a method. You can see, only the name is mandatory over here in UML.

Method, in actuality, when we write, we may like to say the visibility of the method, let us say, we say plus, that shows me the method is public. And we say get customer. Doesn't take any parameters and returns me a customer.

Or I may write a method like this. I can say make reservation. So what does it take? It has to be given a room object, and it has to be given a customer object. And it will return me a reservation object.

So this is how-- we can write some constraint also. Constraints can be in the form of throwing some kind of exceptions. If you're using C++, C++ puts a constraint that a method can be defined as a constant. So we can do these kind of things.

Then annotating the method behavior is a very interesting and informative kind of, you can say-- it is very much informative. So say, for example, you are creating certain methods. You are writing certain methods. And you want to tell the developer that this should go like this.

So you will write some kind of a node or an annotation with the method like we can see over here-- actuateCooler. In lesson numbers 10, I think, we did the similar kind of a things where we implemented a state pattern. So there, we gave some extra information about the various methods, like [? set real ?], temperature, or do exit action, or do entry action, and so on.

So then we have declaring constructors. It's a part of, like, identifying the methods for object management. So constructors, we can see over here, we can use a stereotype constructor. And we can add one or more constructors depending upon in how many ways we want to create our class object.

Then we have another one. We are reviewing the coupling. Now on the slide, we can see two diagrams, two different parts over here. This is how we can see.

So the left hand side is a very high coupling. So we understand that everybody can access everybody else. So here, in this case, in the right hand side, it is a loose coupling. So loan can access book. And loan can access member. So that means, if member has to access book, it is a lengthy process. We have to do something about it, something additional.

So although the left hand side looks very, very appealing and very attractive, but, as far as programming is concerned, we will prefer a low coupling. Though you may find that it's not a perfect design, but this is just an example to compare the two.

We have already talked about loose coupling, and tight coupling, and abstract coupling, and coupling based on interface. So we will always prefer the design which implements a loose coupling. That is the purpose of this particular slide.

And then we talk about cohesion. When we're talking about coupling, how can we forget about cohesion. So we can see, over here, when we talk about member class, we are giving the member and the book details over here. We can say it is associated with multiple books.

So rather, what do we do? And [? loanDate ?] that, also, stuffed within the member class. We don't want that to happen. We want a highly cohesive competent. So to have a highly cohesive component, what do we do? We make it into three different classes.

Loan is a different thing completely. And loan can associate with member and book. So this, I can say, on the right hand side, what we create here. So this is a highly cohesive and loosely coupled design.

Now the last step over here is we will try to identify that which components require interfaces and which components provide interfaces. So we can do it like this. So I understand, by looking at a book reservation, that it provides me one interface for book reservation service.

And the book reservation service IMPL implementation class is hidden within this. So this is a best practice. Whenever I have a book reservation service, or a late Return Notification Service, I will have the classes which implement these interfaces by adding IMPL in the end of the interface.

And this needs two interfaces, member service book service, so this is the perfect diagram which represents that a particular class provides which interface and requires which interface. But some people don't feel comfortable with this. They don't see any connection, and they feel confused. So you can do this, though it is a redundancy.

Because when we go back over here, everything is clear. We know what we require and what we are providing. So we understand book reservation requires two interfaces, member service and book service, and itself provides a book reservation service. But to be more explicit, though it is redundant, some people prefer like this. And they draw the arrows.

So let us summarize. What did we talk about? We only about one thing-- refining, refining, and refining. That's the refining of attributes, refining of relationships, refining of navigations, refining of many to many institutions, identifying various additional methods, refining of methods, and, ultimately, refining of cohesion and coupling.

So with this, we come to the end of this lesson and the end of the process starting from requirement analysis up to providing a solution model to the implementor. So you must be wondering about what we are going to do for the next two lessons. So these are just overview about the various methodologies and creation of the frameworks going one level ahead. OK, the process ends over here.

## 2. Lab 13: Refining the Class Design Model - 17m

So let us take a look at Lab 13, Refining the Class Design Model. Upon completion of these activities, you should be able to refine attributes, encapsulate attributes, refine associations, refine methods, declare constructors, review your class design to ensure that it maintains high cohesion and low coupling, create components with well defined interfaces.

So activity one talks about refining the class attributes in the design model and to encapsulate the class attributes in the design model. So we review the class diagram of the hotel system case study that we have created in activity two of lesson number 7. Let us go to lesson number 7.

So we can see all our class diagrams. are without any refinement. We don't have any refinement over here. So coming back over here, now we can see what we are supposed to do. We will define the class attributes in the class diagram.

We will define the name of each attribute to follow conventions. We identify the data type for each attribute. We are also creating a new utility type if necessity.

For example, arrival date and departure date could be combined into a date range class with a method to check the overlapping dates and a method to return the duration. We will design and designate an initial value for each attribute if it is applicable. And we identify the property of each attribute as a changeable, add-only, or frozen.

There's the first task Second task will be to encapsulate the attributes. That is, we would make all the attributes as private to the maximum level. And add public accessor method to all attributes which we want to expose to outside.

And add mutators or set attribute methods to those attributes which are not frozen, which are not read-only. So that is our two parts of the first exercise. The third thing we'll-- we will add public mutative methods for all attributes as I told you. And if it is appropriate, we will identify derive-- we will find the derived attributes, right? So everything is related to the attributes almost over here.

So let us take a look at the solution of lab number 13. So we can see over here, overall all the variables have been made private. So access modify has been added over here.

And we can see the methods have been made public. We can see all the methods are public over here. All the variables, attributes have been made private.

So what we wanted to see? We wanted to see that are we using any derived attributes. So you can see over here the total is of money type. And that is a derived attribute.

So we have seen the attribute names. You can see the first name. It is as per all the conventions.

The data type is proper. And we are saying read-only. As we discussed while discussing the theory of this lesson also, final-- or the frozen or the read-only quantifier can be used to show that the data will not change. So these are the various things.

So another class we can see-- we added a date range utility class over here with all the get and set methods with a lot of facilities which can be provided. Like, you can get the day's duration. You can get the day's gap, overlap, end date, start date. Is date range contained? Set duration end dates and so on.

Now, coming back to this, let us see if we have left anything. We refined the attributes. Our names were refined.

OK, initial value. Let us just take a look at that. Are we assigning initial value to anywhere over here?

Is there any candidate for initial value? Uh, yeah. Here, you can see status, reservation status. Value is equal to new.

Because we know invariably whenever a reservation object is created, the reservation status will be new. So we don't want to call a set method to set the status new pass by passing new as a string. So we can do it with the initialization. So we made all the attributes private.

We can see that we added all the accessor get reservation number, get quoted price, get dates, OK? And get room ID, set room ID. Here, we can see get room ID, set room ID, methods are there.

Get date, get and set description, right? So all of these have been added. So this is about your exercise one.

Coming to activity two, we redefine associations using aggregation and composition. So we will refine the class associations using aggregation and composition whenever it is appropriate. The preparation for this exercise or this activity is we will use the class diagram of the hotel system case study that we updated in the previous activity just now.

So we will complete two different steps. We will review each class association and determine whether aggregation or composition would be more appropriate. And then we will refine the class diagram to add aggregation or composition which found in the step one.

So coming over here, we can see in activity two. So, where do we see? So, room type is aggregation for the room that is identified.

Reservation aggregates the rooms. We discussed in detail about it because room and reservation can have independent life cycle. But reservation becomes an owner of a room for a particular period of time. And chargeable item is a composition relationship in the bill.

Bill contains a chargeable item. If you are purchasing any chargeable item, that time, the chargeable item will be created in the bill. Likewise, bill has a composition relationship with the reservation because they both will exist.

And when the reservation is destroyed, bill is also destroyed. So this is a relationship of composition. Likewise, reservation has a payment guarantee as a composition relationship. So that means when reservation is destroyed, payment guarantee and bill both are destroyed.

Chargeable item type shares the aggregation relationship with chargeable item. And purchase order guarantee shares composition relationship over here. So this is our activity two. So let us see what is there for activity three.

Refining the direction of traversal. So we are talking about navigation over here. So what we doing over here-- identify the direction of traversal and add association methods. So coming over here so we can see the navigation reservation accesses payment guarantee.

And we can see any association method. So here, we can see reservation accesses bill, OK? And chargeable item is accessing chargeable bill. Chargeable item is accessing its type.

So this is navigation one direction, OK? So association methods. Are we using any set get chargeable item type is considered as a association method.

Then get chargeable items is again an association method. So whenever we have an association and there is a method to set or get that kind of an item that is an association method. So this is our exercise three.

Talking about exercise four-- Refining the Business Methods and Constrictors-- are we adding any business methods or are we declaring any constrictors? Are we annotating any methods and constrictors? So add and define new business methods, add new constrictors, and annotate the methods and constrictors what we have added previously in step number one and two.

So here, we can see in the row class, we added a constrictor over here in the row class. Then we have customer class has been introduced with two constrictors. So we want to build the constrictor object or create the constrictor object in two different types by passing the first name, last name, and address and by passing the first name, last name, address, and phone number. Reservation has a constrictor where you are passing a date range and you are passing a room type as a list. That is what we are passing.

Then we have another bill is created by giving an initial charge for the chargeable item. And we can see over here the annotation's get total. Set total is equal to zero for each chargeable item. Call get price and add to the total and return the total.

Add chargeable item. Over here, we can see if allow add charge is equal to false, then throw so cannot charge exception. So you're seeing that you're throwing an exception at that point of time as we add item to the chargeable item list, OK?

And chargeable item again contains a constrictor over here. Chargeable item type has a constrictor. So the purpose of this exercise is to add constrictors and add the additional business methods and take a look at here-- setPaymentGuarantee. When the customer is checking in, if status is not equal to confirmed, then throw invalid change of state exception as set status as checkedIn.

OK, so we can see how at various places, we are adding the annotations and notes. And we are introducing the constrictors. Activity 5 talks about-- we will review our class diagram to ensure that there's a high cohesion and low coupling, OK? So we review the class diagram and discuss, you know, if it is a classroom, we make the groups and we ask the people to discuss about how they can make their design as a high cohesion and low coupling.

So here, I will do a bit of that activity with you. If you are attending this course, in case if you are attending it in a grouping case, you can always do the discussion part of it. Or after learning it, just go and trouble your colleagues, and please be sure you discuss the things with them.

So here, we can see high cohesion and low coupling. So we can see the classes are separate. Room is a focused class. Room type is a focused class.

So that means these are highly coupled classes. Customer reservation, payment guarantee, card payment guarantee, right? So here, we can see purchase order guarantee, company-- all these are highly a cohesive, OK? Bill chargeable item. So we have been very, very good. And we have created the things in a proper way.

So when it is highly cohesive and the navigation is proper, it is going to show you that there is a one-sided navigability. So we can see a local lose coupling over here that we'll access as a chargeable item. But chargeable item doesn't access bill.

So chargeable item accesses chargeable item type. But chargeable item type does not access chargeable item. So like this, we can see the scenarios previously also. Purchase order guarantee accesses company, OK?

So we can see one-sided-- so reservation accesses payment guarantee. Payment guarantee does not access reservation. So this is your activity five. And activity six is the last point where we try to see the various interfaces create components for different areas of common functionality, and for each component created in step one, add any provided interfaces.

For each component created in step one, add any required interfaces. So we are just trying to find out that who accesses whom, who requires whom. So this of course, a redundancy.

Room phone control in a check-in process-- so we can see over here-- provides an interface. Reservation provides two interfaces and requires two interfaces-- one for room service and one for bill service. Customer additional charges requires a reservation service, OK?

And it also requires the bill service. It doesn't provide any interface. Billing provides an interface and does not require any interface because it is being accessed rather than accessing something.

Reservation requires room service. So room service provides an interface. Does not require any interface.

Housekeeping requires room service but does not provide any interface. So this is our lab 13. We had six exercises to see the various kind of refinements we can do in our domain model.
