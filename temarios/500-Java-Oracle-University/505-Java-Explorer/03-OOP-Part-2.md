# 03 Practical Object-Oriented Concepts: Part 2

DESCRIPTION
Practical Object-Oriented Concepts: Part 2

BENEFITS TO YOU
Practical Object-Oriented Concepts: Part 2

## 1. Practical Object-Oriented Concepts Part 2 New 11m

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

## 2. Inheritance New 11m
## 3. Quiz: Human Resources Use Case New 3m
