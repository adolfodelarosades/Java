# 03 Practical Object-Oriented Concepts: Part 2

DESCRIPTION

Practical Object-Oriented Concepts: Part 2

BENEFITS TO YOU

Practical Object-Oriented Concepts: Part 2

## 01. Practical Object-Oriented Concepts Part 2 New 11m

Practical Object-Oriented Concepts Part 2. The objectives for our presentation include defining how abstraction identifies important aspects of the domain. We'll describe how inheritance supports code reuse. We'll define what encapsulation and data hiding mean to an object-oriented programming developer. And we'll describe how polymorphism supports more flexible and reusable designs.

There are some basic object-oriented principles that we will take a look at. Object-orientation uses abstraction during the analysis phase to identify the appropriate behaviors and attributes for classes and objects. We use inheritance and polymorphism during design to leverage reusability of code and to make the designs more flexible.

And we use encapsulation when coding to minimize dependencies, coupling, and side effects. During abstraction, we look at the problem domain, and we determine the set of behaviors and the information needed in order to solve the problem. We'll see that different problem domains require different behaviors, even within the same object.

For example, notice how a dog's behavior is dependent on how it's used. For example, given a dog object, if you're creating an application for a veterinary clinic, what might about the dog or want to know or be able to do with the dog? You might need to know the dog's name, and its breed, and its size, and its weight. And of course, you'd want to know its treatment history.

But if you're an owner, owning dogs, what would you want to know? You'd certainly want to know the dog's name, and you might want to know things about its behavior, maybe its favorite food. If you're running a kennel, keeping track of dogs and boarding dogs, what might you know? Again, we'd want to know the dog's name and the owner's name and probably his favorite toys and potentially other dogs that it likes to play with.

Encapsulation and data hiding. When an object is asked to do something by sending it a message, the result of that may be a change in its state. If you remember, the internal state of an object is kept from being changed by other objects directly. To change the internal state of an object, we send a message to that object. And then it changes its internal state.

For example, if we send a message to the dog to tell it that its new favorite toy is a squeaky toy, then its internal state has changed. Again, we, the users of the object, don't know how the internal state changed. We just know that it did, because if then we asked the dog object, what is your current favorite toy? It should say, squeaky toy.

Now, the only way an object state can be changed, again, is by asking it to do something, by sending in a message. Now that could be something simple, like, for example, sending a message to the dog to set its name to Bruiser. In this case, we could use the Java method setName and pass the string Bruiser, and the internal state of the object would be updated.

Again, we don't know how that occurs. We're not the designer of the object in this case. And we don't really care. We just know that it works. It could be something more complex. For example, we could tell a dog to bury a bone. Again, in the digital application, we don't necessarily know what the behavior to bury a bone would look like. But we know the dog would do it and then would update its internal state to indicate that it has buried a bone.

By encapsulating or hiding the internal state, we make this more stable and less prone to coupling and changes and side effects. This is called encapsulating the data. And for me, personally, encapsulation is the most important aspect of object orientation. We want to make sure that changes to one object don't affect the main program, and the main program can't break the object as well. We keep nice boundaries up between the two.

You may remember in Part 1, I mentioned that in small talk, everything is an object. In object orientation, all data is wrapped by the methods of a class. There's literally no way as the user of an object to see the internal state of that object and how that internal state is represented and how it's implemented.

That's a good thing, because the developer of the class can change the internal representation or change the internal implementation and it doesn't break my program that's using that object. So how does this actually work, when you don't actually see any literal data? All you see are objects. Everything just passes objects back and forth, and we send messages to objects, and that's it.

So for example, if I wanted to set your dog's weight to the same weight as my dog, I'd start by getting the weight of my dog, which would return a weight object. Remember, everything is an object. And then I would send a message of set weight to your dog, passing the weight object that returned from my dog. And now your dog has the same weight as my dog.

We say, fine, but what about comparing weights? Same thing. My dog would be able to compare its weight with another dog. So we can go to that other dog, another dog, and send it the message getWeight. It would return a weight object. And now my dog can compare its weight with that weight object. Notice here that we don't actually see the data.

But the designer of the class, the dog class, would have to write a compare weight method that could take one number, or whatever the actual weight object is, and compare it with another weight object. Possibly the designer of the weight class would have methods that would allow two weights to be compared. And the dog class developer would be using that. See, there's no data. You're just comparing weights.

What if you'd like to increase the dog's weight? Don't you have to do addition? No, not necessarily. What you would do is you'd have an increased weight method. Again, the designer of the myDog would have an increased weight method. We could send it the message increase weight, pass it the amount or the weight as an object, or the amount that we want to increase it, and it would increase the weight. See again, no data. We're only passing objects.

It knows how to increase its weight. We know that when we call increase weight, the dog's weight is increased. But we, as the user of the object, don't see how that works. What if you want to print the actual information about the dog? I can retrieve my dog or send it a message, send back yourself as a string representation. Then I can pass that string println method or print method, and that print method would then print out that string.

Again, I as a user, don't see how the dog object is implemented internally. And that, of course, is a good thing, because the designer of the dog class can change the internal representation based on need. And everything still works. But wait, you say, what if I need to get my weight as a floating point number, or get it as a string, or an array of characters, or in some other format, like XML or JSON, so you can work with it?

The developer of the dog class would then go in and add methods. They would add a method like add weight as float, and that would return maybe a floating point representation of the weight, or the weight as a string, or the weight as a character array, or the weight as XML or JSON. So you could return the internal object, the weight, in any format you need, again, without having to actually see the internals of the object itself.

We never see implementation. And most things in life are like this, for example, your television. You work with your television. You can turn it on. You can turn it off, change the volume, change the channels. But you don't actually see how the internals of the television are implemented. And you really don't really want to know, necessarily, unless you like knowing about televisions.

For example, if you ask your neighbor, how much do you weigh? You don't know how they determined the right answer. You just know that they do, and they would tell you, this is how much I weigh. Now, maybe they get on a scale or do something else. But a lot of other things do the same sort of thing. They have a public face, what we call the interface, that defines the functions and subroutines that is the behavior that object can expose.

So a person, you can ask a person, how much do you weigh, and they would answer it and figure it out one way. But you'd still get back a weight object in this case. You could ask a robot, how much do you weigh, and again, it could figure out how much it weighs and tell you. And again, you could ask a dog how much it weighs, and assuming dogs could talk to some degree, it could tell you how much it weighs.

Again, each of these different objects or classes would implement the behavior of how much do you weigh differently. And yet the same message, how much do you weigh, would retrieve the value of weight for all these different types of classes.

So we see that many things can have the same interface, yet implemented differently. So as a developer, I know that I could write an application that works with persons, robots, and dogs. I can ask all of them how much they weigh, and it'll work correctly, even if I didn't implement the person, robot, or dog class. This is very powerful and very flexible.

Imagine, now, you have to know how much does a cat weigh. The designer of the cat class just needs to add a the code necessary to respond to the question, how much do you weigh, and now we can add a cat to that list, and the cat could be added to the application without changing the application at all.

The main application, which is asking these different objects how much they weigh, does not have to be changed when we extend that application to include cats or fish or mice or whatever.

So the interface defines the messages an object can respond to. And that's part of object-oriented analysis where we find out what does this object have to do, what can it respond to. So a message is when one object tells another object to do something by sending it a message. We saw that earlier. The receiver, in this case, the dog, determines which method implements that message.

So the dog class would receive a method message of fetch and an argument of toy, some type of toy object, and then the receiving object here would have code that would then fetch the toy, whatever fetch behavior means. Notice the same message can result in different behavior on different objects.

So whether we have a cat, or a dog, or a fish, or whatever, when we send it the fetch method, each of those different objects would fetch potentially differently. But they would all know how to fetch. So the same application that works with dogs can be extended to work with cats or fish. And I don't know that fish really can fetch. But maybe they can.

So the point being that we can-- and again, this is in digital land, so we can have anything. So we could have an application that we initially write to just work with dogs. And then a month or two later, someone can come by and say, can you extend your application now to work with cats?

What do you have to do? You, the developer of the application, actually nothing. The developer of the cat class, make sure that they have a fetch method that responds to the fetch message, and then you can include the cat object inside of your application. And your application works without a change, very, very flexible. And this is how most object orientation is done.

## 02. Inheritance New 11m

 
Now, to make some of this work, one thing we have is the idea of inheritance. Inheritance means that we have different types of objects and they can inherit or gain or reuse data and behavior from a higher level, more general class. Here we have a toy. And we might say, all toy objects can play.

Now, what that play means for that toy may not be defined, or it might be very simplistic. And then we can extend that toy object with a more specific form of toy called a ball. Ball also, therefore, would know how to play automatically, because inheritance allows the ball to inherit the play method. Now, the designer of the ball class could go in and write different behavior to make the ball bounce or do whatever a ball does when we play with it.

Then someone else who's implementing the squeaky toy class would, of course, also inherit the play method. But again, their code for how the play method works would be different than how a ball method works. And same thing for someone implementing a shoe.

In this case, we're using a shoe as a type of toy. And we would have the play method, and how we play with the toy would be different. So a ball has color and bounces, or a squeaky toy has sound, and a shoe has smell.

So imagine you share that play behavior from the more general toy. Each type of toy could implement the play differently. Why is this a cool thing?

Think about an application that has to work with toys. We could say to the application, you can work with any type of toy that knows how to play. Well, by definition, a ball, a squeaky toy, a shoe toy, or now new ones-- like chew toys or string toys or things like that or bone toys-- would all know how to play. And we could extend the application without having to change the application by simply extending the classes that are being used.

So notice by moving the definition of the code and the objects out of the main program and into a separate location, a separate file, it makes the application more stable, more general, and easier to maintain and extend. So with objects, we can give the same name to services that may work differently in different objects but perform the same basic function. So what does this look like?

Well, in a procedural language, you would typically need an if/else statement to determine the correct function to call. And there's ways around this to make this more simpler in some procedural languages. But notice I'd have to say if the toy, if my favorite toy is a ball, call the playBall method or procedure. Otherwise if the favorite toy is a squeaky toy, call the playSqueaky procedure. Else if the favorite toy is a shoe toy, call the playShoe procedure.

And now if we had a new type of toy, like a chew toy, I have to go into the main program where this code is, where this if/else code is. And we have to go ahead and add a new else. We'd have to say, else favorite toy is a chew toy.

So now in a procedural program, every time we add a new extension or extend the functionality, we would actually have to recompile the main program. Again, this is simplistic. We're not completely syntactically correct. And there are ways to deal with this in procedural land. But again, it's much easier for you in object land.

The ability for an object system to figure out at runtime what behavior is appropriate based on the message so we can have different objects which receive the same message but produce different behavior is called polymorphism. For example, object systems, you could say move the if/else determination into the runtime virtual machine where the code is actually running. Again, this is just a way of talking about it.

For example, if we pass in a toy into our fetch method, then the next method play would produce a different behavior in the toy depending on what a toy is. If aToy was an object instance of, say, a chew toy, then play would give you one type of behavior. If it was an instance of a squeaky toy, you'd get a different behavior. If it was an instance of a ball, you'd get different behavior.

Notice the code doesn't actually care. The code says, pass me some kind of toy. Now, how does that work?

Because we pass in some type of toy, at design time and compile time, it looks for a type of toy. At runtime, we pass it a ball, a squeaky toy, or a shoe, and it works. Because they're all types of toys, and therefore they all have a play method, and they all understand the play message.

So if we pass in a squeaky toy at runtime, then we call play. And the runtime system asks aToy, what type of object are you? And the toy would say, I'm a squeaky toy. And so then the runtime system looks at the code for a squeaky toy, finds the play method for a squeaky toy, and executes it. Or we could then make a favorite and make that toy our favorite.

So again, at runtime, the system interrogates the toy object. And again, this is a way of talking about it. What type of object are you? And based on what the toy answers, the appropriate play behavior is executed. This ability is called polymorphism.

Let's say that we've extended our application and added a new type of toy and one of the developers has created a new toy class, let's say a rubber mouse. So now we have a rubber mouse toy. And that rubber mouse would be added to our hierarchy.

We put rubber mouse over here, and it would inherit from toy. So it's a type of toy. And therefore, of course, rubber mouse would have a play method.

And the developer would have to implement that method to give it some type of behavior that makes sense for a rubber mouse. Watch what happens to our program. No changes, we don't have to change our program. When the program runs, if we pass in a ball as a toy, then we would get the play behavior for a ball. If we pass in that new type of toy, the rubber mouse, then the play behavior for the rubber mouse gets invoked.

This ability is called polymorphism and creates very flexible systems that are very easy to change, extend, and update without having to recompile a lot of code, for example, the main code. Now, yes, of course someone has to create the rubber mouse class and write the code for it. But again, that is more stable over time, more reusable, and a better design approach than having to change the main program over and over again.

So this is actually something called late binding or dynamic binding. It's a computer programming mechanism where the method being called, the code being called on an object or the function being called with arguments, that's what you see here. You see makeFavorite being called with an argument of aToy, fetch being called with an argument of aToy.

Here play doesn't take an argument. It's just telling the toy to play. It looked up at runtime. So it's looked up by name at runtime, called late binding, meaning at the time it actually runs is when we bind to the code to actually execute it.

Now, not to get too technical, but this is very different from something like C, which does early binding. At the time the code is compiled, that's when it determines what function will be executed. So this is one benefit of object oriented over languages like C, which are not as easily able to be extended.

Now, if we go a little bit further and say, let's say we have a collection of toy objects. We're keeping a list of two different toy objects that my dog can play with or knows about. So I go to my dog and I call the addToy method and pass it a new ball object. Now, this is Java syntax. And you'll see more about this coming up in a bit as we get into the course.

Then here we do myDog addToy new ChewToy. Here we do, again, myDog addToy new SqueakToy. What's happened is the list of toy objects has grown to include a ball, a chew toy, and a squeak toy. Now, if I call the method getLastToy, it would find out whatever the last toy is and ask it to play.

But the code doesn't actually know what it is and doesn't care. It happens to be a squeak toy, but if we added a ball, a ball, and a chew toy-- so the dog has two balls and a chew toy-- then getLastToy would call play on a chew toy. The point is it returns the last toy object, and the correct play behavior is executed because toy objects know how to play. Regardless of whether it's a ball, chew toy, or squeak, it compiles and it runs. And you'll get different behavior potentially because of the different types of classes.

So a bit of quiz here. What is inheritance? Remember, inheritance is the ability to reuse code from a parent class in the child or subclass. More specifically, inheritance is where a more general form of class has behaviors and data which are inherited or gained by the subclass which is more specific.

Remember toy and chew toy. All toys have, for example, the ability to play. A chew toy has the ability to play and maybe other behaviors as well.

What's abstraction? Abstraction is an analysis effort where we've tried to find out what behaviors and data we need to design into our class. So the designer of a cat class, for example, might say, in this application I need to know the cat's name and the cat's weight and, for example, when the cat last ate.

Encapsulation is making sure that the internal state, the representation of the internal state of the object, is not changed directly and is only done by sending it a message. And it's executed through a method. We cannot directly in our code be using an object directly implement, or should say directly influence or change, the internal state of an object.

And lastly, polymorphism is the ability for many different objects to share behavior, receive a message for that-- for play, for example-- and each object would implement it differently. This is done automatically and is taken care of for us, making these systems more flexible and more easy to extend.

So when and how are these applied? Well, abstraction is performed during the analysis phase when we look at our problem domain and decide what behaviors, and therefore internal state, our object has to have in order for it to solve the problem and be used in the application. Again, this would be done by the designer of the object.

Inheritance and interfaces, which define the behaviors that are common across different types of objects that don't participate in inheritance, and polymorphism are used at design time to make our applications more flexible and more stable. And encapsulation is done at coding time when we actually make sure that we have to go through a method in order to change the internal state. Remembering that those methods can do things like error correction or validation before we actually change the internal state so we don't change-- for example, a date, which might be the internal state of when we first acquired the dog or the cat-- and we don't have an invalid date, as an example.

## 03. Quiz: Human Resources Use Case New 3m

All right, let's put this together and see a very simple example, in this case in the context of a Human Capital Management, HCM, system. We need to be able to assign a new employee to a department. Now as we go through this, think about what classes will we need and what attributes and behaviors should they have to solve this problem. And think about this before going on and seeing what the solution is.

So what we want the system to do is first create a new employee, then we need to go find and retrieve a specified department using a department finder object that would find a given department for us, maybe based on department name or department number. Then we need to assign that newly created employee to that specific department.

After the new employee is assigned, we have to print a list of employees in that department. It should print out a list, and it should retrieve that new employee that we just added to the department. Now think about what classes you need, and make your best guess. Maybe take a moment, pause the video, and write down what classes, what behaviors, and what internal state or variables they would have.

In Java code, it would look something like this. We would start by instantiating a new employee object. New employee creates a new employee object for us, and we would define a variable called newEmp of type employee, and it would contain the object reference. So newEmp is now pointing to that object in memory, the new employee object in memory.

Then we could use our department finder to find an existing department based on its department number, and return that department object reference and store that in aDept, which is a variable of type department, so it can store departments. Then we would go to aDept, and we would call its assign method and pass the new employee object reference.

So now that pointer or reference to that new employee object has been added to the collection of employees internally inside that department. Lastly, we can go to the department and get its employees, get back the collection of employees, and return that into a print method. The print method would then loop or iterate through the collection of employees printing each one.

So in summary, we took a look at how abstraction identifies important aspects of the domain. We described how inheritance supports code reuse. We looked at what encapsulation is and what data hiding means to an object oriented programming developer. And we described how polymorphism supports more flexible and reusable designs.

Enjoy the Java programming portion, which comes up next.
