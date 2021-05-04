# 4: Overriding Methods, Polymorphism, and Static Classes

1. Overriding Methods, Polymorphism, and Static Classes, Part 1 - 37m
2. Overriding Methods, Polymorphism, and Static Classes, Part 2 - 30m
3. Practice 4-1: Overriding and Overloading Methods - 20m
4. Practice 4-2: Using Casting - 6m
5. Practice 4-3: Applying the Singleton Design Pattern - 6m
6. Skill Check: Using Polymorphism, Static Classes and Overriding Methods - Score 80% or higher to pass

## 1. Overriding Methods, Polymorphism, and Static Classes, Part 1 - 37m

All right, excellent. Good work up to this point. So let's go ahead and tackle Chapter Four.

In Chapter Four, we're going to be talking about polymorphism. We're going to talk about overriding classes. And we're also going to be talking about static classes. So a number of different concepts here that we want to take in quickly.

Now, the first thing that we want to talk about-- when we talk about Chapter Four, the first thing that's of importance is this idea of access level. So far, we've basically said that if I have a class-- so let's say I've created an instance of a class, represented by this box. And well, let's just keep in contact with what we've been talking about in the lab. And so let's say this is our employee, whether it's an engineer, admin, whatever.

We've basically said that if I declare something as private, it is available only within the class. So if I try to access a private field from without the class, it's going to tell me, no. It'll give me that red squiggly, that line that says, hey, it's not available.

Well, in the previous activity, remember there was that error that I got, where because I had not marked a constructor as public, I wasn't able to access it. And that's what I want to talk about in this particular board work.

So there are four levels of access that we can get to when we're talking about a class. Now of course, we've talked about public. And we've basically said that public means universal. So as long as I have this class, as long as I have this file, I can do anything to that class, as long as it's public. And we've talked about private, meaning within the class.

But there are two other additional access levels that we really haven't talked about. And depending on-- now, the weird thing is that we've got a keyword for private. We've got a keyword for public. We also have one additional keyword, but we have two additional levels. How does that work?

Well, if you were looking at what I just did on that constructor, I didn't mark it with any keyword. There was no modifier associated with that constructor at all. Well, that's the next level up from private.

And what that means is if I have-- let's see if I can draw this. If I have that particular class inside of a folder-- and let's say I have some other class inside of the folder.

So we had engineer. And we had admin. And we had manager. And they were in the same package as employee.

And because they were in the same package as employee, this is known as default access. So if I have no modifier at all, because default is not a keyword. In fact, I don't provide a keyword, if I want default. So if I've marked something as default, that's basically saying that as long as the class is in the same package, it can still access it.

The problem in the previous example was my test class was out here. And so when it tried to access whatever instance it was, it was blocked, because default access doesn't allow classes outside of that folder to access an instance of that class. Clear?

Now, there is one additional level. And that one additional level deals with inheritance. So we've got private. We've got default. We've got public. But we also have something called protected.

Now, up to this point, manager is extending employee. And engineer is extending employee. And admin is extending employee. And they're all in the same package.

It doesn't have to be that way. And so let's say I created the director class. Let's say that I created that in a completely different package. But director does extend manager.

And let's say that I identified something as protected in manager. So protected is that third keyword. Now, protected means that it is default level, which means that-- it would mean that any class inside of the same package would be able to access whatever that field or that method is that is protected.

But it also means that any class that inherits from is a subclass manager, regardless of where it exists, would also be able to access. So in the case of protected, we're talking about-- it deals with inheritance.

So private, within the class. The next level up, default, meaning no modifier whatsoever, within the same package. As long as that Java class exists in the same package of another Java class, it can access anything that has been declared without a modifier at all.

The next level up is protected, meaning not only package-level scope, but also any subclasses of that class would also be able to access anything that is declared as protected. And then finally, the top access level is public, meaning that it's available universally, across the board.

Now in this chapter, we're also going to be talking more about polymorphism. Now the strange thing about polymorphism, besides the name-- polymorphism just simply is Greek for many forms. Now what that means is that I can have the same method. For example, in the previous example, we had the printEmployee method that was being used in every single one of these classes.

Well, that wasn't truly polymorphism, because they weren't any different. They were all coming from Employee. Now, however if I had a printEmployee in each one of these, has the same name, that would be a form of polymorphism.

So any time I do polymorphism, there are a couple of things that that might mean. It might mean that I am overriding a method. Now, overriding just simply says that I have the same method in the parent that I have in the subclass. And so we'll talk about overriding in this chapter.

We've already seen one form of polymorphism, which was the overloading. In the case of overloading, we're talking about same method, different arguments. In the case of overriding, we're saying same method, same arguments, but different classes.

Now in a future chapter, we will also introduce another form above polymorphism, which is known as an interface. And we will be talking-- a number of lessons in this particular class deal with interfaces and what we can do with them. So we will be getting to that. But we're not going to be talking about it in this particular chapter.

So we've talked about overloading. In this chapter, we're going to be talking about overriding. And specifically, we're going to be talking about situations where, if I have a class, and I am extending that class in another class, then, like I said, same method, same signature. But I want different implementation in the subclass.

Now, the most common of those would be-- if this is my object class, every single class in all of Java, no matter where you find it-- every single class either directly extends object or might be farther down the line but ultimately, will extend object. Now the reason I bring that up is because in object, there are nine methods. So every class in all of Java has these nine methods.

Now, I bring that up because in this chapter, we're going to talk about three of them and why it is a good idea to override those methods. And so that's kind of the context here. Now, one of those methods is called toString.

In the previous activity, remember, we've created the printEmployee method. And we wanted to identify the values in the Employee and be able to print them to the screen or to give them to some other class. Well, we could have just as easily done that with overriding the toString method.

Now, the good thing about the toString method is any time I pass an object to something that expects a string, this method is automatically called. Now, the problem is that if I don't override-- so if we go back to our earlier example, where this is Employee, and I were to say pass. And let's say I create an instance of Employee e here, and I pass this to the print line method, for example. What am I going to get?

Well, what I'm going to get is the name of the class. And appended to the end of it will be that memory location we were talking about earlier. And so it's not really all that user-friendly, because it's the name of the class and then some numbers.

Well, that's not really what we mean when we wanted to print this out. What we really want is information inside of our class. And so that's why we would override the toString method.

Now, another thing that we want to look at is that earlier, remember, I wrote some code. And I basically said, well, if. And then I wanted to say, well, if a is equivalent to b.

Well, if this is a primitive, that's pretty straightforward, because it's going to compare the value on the stack to the value on the stack. And if they're the same, then of course, they're equal.

But the problem is that this does not change when I'm working with a reference type. It's still comparing value on the stack to value on the stack.

So let's say I created two instances of employee, employee one and employee two. And let's say that I put in the same name, social security numbers, same salaries, same employee ID. But I used new twice. Would this be the same?

Well, in that case, the stack would have one reference for employee one, a different reference for employee two. When it compared the two, it would say, no, these are not the same object. And it would be absolutely true, because they are not the same object. They are in two different locations on the heap.

The problem is that when we are comparing reference types, we don't usually mean, are they the same object? We mean, do they have the same information?

Well, in that case, rather than using equals, equals, what we can do is we can use the method equals. In the case of the equals method, an object is passed in as the parameter. But in this case, what we're looking at-- it's one of these nine methods-- is instead of are they the same object, I can override this method to say, well, if the employee ID of both objects are the same, and if the name is the same, and if the salary is the same, then they are equal. So it gets away from this.

Now usually, the way that we do equals is we don't really compare each field in both objects. What we generally do is we override the hashcode method. The hashcode method of an object allows us to convert the information inside of the object to an integer. So basically, the hashcode returns an int.

And then, if the hashcode for two different objects are exactly the same-- so if this object's hashcode and this object's hashcode are exactly the same, it is statistically improbable that they're not the same object. So in other words, we could call them equal.

Now, it's going to be a little easier once I get to the slides and kind of show you the what I mean. But that's what we're going to be talking about in this chapter as well.

And so the last thing that we want to talk about is that we're going to also talk about static classes and what static means. We'll talk about that. But in addition, we're going to be talking about this idea of casting.

And when it comes to our casting, in this case, we know that a manager extends employee. Admin, engineer, they all extend employee. So we could say that each of them is an employee. They have that relationship.

Same thing here, the director extends manager. So we can say that a director is a manager.

And so if I wanted to pass a director as an employee, to a method let's say, no big deal, because a director is indirectly an employee. It will take that perfectly. And so that would be what we would call a promotion, or an upcast.

And promotions, or upcasts, can always be done implicitly. I don't have to identify to the compiler, hey, I'm doing this change. It automatically does it. On the other hand, if I'm doing a downward cast, I always have to explicitly tell the compiler that's what I'm doing.

So for instance, if I have a method that is expecting a director, well, a director has specific functionality. If I [? placid ?] an employee, that employee could be a director. But there's no guarantee you that the employee is a director, because the employee could be admitted, an engineer, could be a manager. In which case, it's not a director.

And so when we talk about a downcast, what we're basically saying is that we're going from a more general class to a more specific. In that case, we have to tell the compiler, hey, we really mean to do this. And so if we don't, it will give us an exception. It will tell us we can't.

And so that's what we're going to be talking about as we go through this particular chapter. Let's go to the slides.

So we've kind of talked about the objectives here, in addition to looking at the static keyword. We're also going to introduce the first of a number of design patterns that are important to development. They give us things to call things. But they also give us a simplified version of how we can accomplish certain tasks.

So we've talked about the access control. And we've identified that the private-- we've already seen. And private means that it's accessible in the same class. And as you can see, if something is in the same class, it's always accessible, no matter what the actual keyword or lack of keyword is.

However, if I mark something with no keyword, which would be the default, or a market is protected or public, notice that it also has package scope. So if I have five classes inside of the same folder, as long as they have default scope or up, it can be accessed from any other class in that package. However, other classes cannot access anything that is private.

On the other hand, if I have a subclass in another package, then notice that I can only access those things in a class if it is marked protected in the superclass or if it is public. And then finally, as we've indicated before, public is universal access. So you have the ability to work with pretty much anything that's public any way that you want to.

So let's give an example. So you would think that this would be simple enough. We only have two fields. So we have a class Foo in package demo. And then we have class Bar, that extends Foo. But notice that, in this case, Bar is in a completely different package.

So if I mark something as protected-- so result is protected-- not only does it mean that it is available, well, inside of that class. It also means that it is available to any class in demo. But because it's protected, it is also available to any class that extends that class, even if it's not in the same package.

So in this case, when I go for result, no big deal. It's going to say, OK. I can use that.

However, what is the access modifier for this one? In this case, we have num. We've set it equal to 25. But there is no modifier in front of it.

Because there's no modifier, it means that it has default scope. Default scope, as we've seen, says that any class in package demo would be able to access this particular class. But nothing outside of that package would be able to do so. And so in this case, since Bar is in the test package, when I try to access num, the compiler is going to give me an error and tell me that I cannot.

Now, the best practice, as far as using access modifiers, is to always use the most restrictive access modifier possible. So for instance, fields are almost universally private, unless there is some specific reason or rationale for why you need to make it default or protected. Fields are almost never public.

By the same token, we can also mark our methods as private, protected, public, or have no modifier as well, and make them default. So for instance, in this case, we can provide clear intent for the use of the fields through methods.

So notice that I still have my Foo3 class in my demo package that has a private result. So that means that the private result can only be accessed inside of Foo. But notice that I am giving access to result by creating a method that is protected, meaning that as long as it's either in the package demo or it extends Foo3, I will have access to that particular method.

And so while in this case, I couldn't simply say sum, plus, equals result, because it's private. I can just as easily access result through it's access method. So this is a good practice.

Earlier, I talked about this idea of overriding methods. And I said that unlike overloading, where the arguments had to be different, in the case of an overridden method, the method signature has to be exactly the same.

Now in this case, the method signature includes the return type. So everything that I've marked here is part of the overriding method. So in my Employee class, I have a string being returned from getDetails. And then I have no arguments being passed. And it's going to return the string of ID:, whatever the value of employee ID is, space, Name:, and then whatever the value of name is.

Now that's in the employee class. That's in the superclass. So to consider it an override, I would also have to have this exact same method, notice, string return, getDetails. So the name is exactly the same. And no arguments being passed.

Well, in that case, this would be considered an override. And when I have an Instance of Manager, it would be the overridden method that would always execute, because that's the whole point of the override.

Now , usually when I do an override, I can put this attribute on top of it. It is not required. But it is a best practice, because it lets the compiler know certain things that make it easier to work with.

Now, the point of an override is that I want to somehow change the implementation of the parent. If the parent's implementation was perfect, I would have just done what we did in the last activity. I would just call the parent's method. No sense in overriding it.

So in this case, it looks like I want to add additional details for my manager. So notice that I can get to the parent's getDetails method by calling super. So this is going to give me my employee ID, name, social security number, and salary. But then I can append on, in addition to that, the additional information that is a part of manager. So that's the point of the overriding.

So how would I make sure that this getDetails gets called? Well, in that case, I can invoke an overridden method. So notice that in this case, I have an instance of an employee that I'm creating. And in this case, I have an instance of a manager that I'm creating.

So in my print lines, notice the one is using one. And one is using the other. So how does it know that this one is the Employee invocation and this is the Manager invocation?

Well, it's based on the fact that that's how in instantiated that particular object. I said it was a manager. And so this is what we would know as virtual method invocation. It actually is going to call the implementation of the type of object that is known on the stack.

Well, let's make it a little more complicated. In my main method, I'm going to declare this object as an employee. Now, when I declare the object is an employee that means that I can only access methods of an employee. But notice that at run time, I'm going to instantiate a manager.

How do I get away with that? The first thing you have to ask is is a manager an employee? And in this case, yes it is. Manager extends employee. So I can perfectly do this. And notice that when I instantiate my manager, I do pass in the five parameters that are necessary.

So what happens when I call this method? Well, even though this looks like an employee, notice that it does append the manager's information. Why? Because the stack knows that this is a manager.

And so it's going to call the appropriate method, based on the object type is in the stack. So what's the difference?

The compiler is going to look at this type, which means that any use of e can only expose things that are available in employee. So I would not, from e, be able to call getDepartmentname. It's not part of the employee.

However, because the employee does have a getDetails method, the manager just overrides it. The compiler looks at this and says, yep, that's perfectly acceptable.

So the compiler is looking at how it's declared. The program runs based on how it's instantiated. Got it?

So we've also talked about overriding. So there is one limitation to overriding. And that is that an overridden method cannot be less accessible than the method in the parent. It goes back to the explanation I just gave about what the compiler is looking at.

The compiler is looking at the parent class and saying, OK, this method is public, or protected, or whatever it is. And because of that, I cannot have less access here. I can have more.

So for instance, if this were a, let's say protected method, then that would mean that in the child, this could be protected or public. But it cannot be less, because what this means is that I can create an instance of bad manager. But then I would not be able to access and call the getDetails method, something that I promised in the Employee class. So you can't do that.

So that identifies this idea of overriding. Now, in some cases we can overload. So here's an example of an overloading.

Remember, we said that an overload is a situation where we have the exact same method name, but we pass in a different data type. Or we pass in a different number of arguments. Well, this would work. As far as overloading goes, it is appropriate.

However, in this case, a manager is an employee. An engineer is an employee. So it would make more sense for us to just write a single method.

With that single method, we won't have to have nearly as many methods. But we could delineate this a little different ways. So from a polymorphic standpoint, I could do something like this, where I could basically say, all right, in my class GoodBonus I'm going to pass, let's say an employee. And then based on that employee, I could call the bonus percent and multiply it times the salary. And that would return whatever the bonus is.

So in this case, if I wanted to cast my object so that it can be used as a manager or as a director, notice that I pass it in as an employee. And then I can check to see, well, is e an instance Manager?

Well, if it is, then the bonus will be 0.03. If the employee I passed in is a director, they get 5%. Otherwise, looks like employees just get 1%. So I could identify exactly the type that I passed in.

So this is where we get back to what we were talking about before, this idea of overriding the Object methods. Like I said, there are nine methods available in Object. But only three of them are usual for us to overload.

Every class that does not extend something directly automatically extends Object. You don't have to write it, because that is just what it's expected. So Object exists in the java.lang package, because that's the default package.

So for instance, if I were to, say, create an instance of Employee and pass Employee to println, it's going to automatically call the toString method of Object. And like I said, that's going to give you the class name and the location in the heap of that particular object.

And so what you generally want to do is that if you want to output a string representing the object, you would overload the toString method, as shown here. And then you could output exactly what it is that you want. Now, the nice thing about that is rather than then creating a completely different method that you have to call specifically, in this case, when you passed it to println, it automatically calls the overridden toString. And you get what you expect.

Earlier on the white board, we also talked about, OK, let's say I create an employee. And then I set that employee equal to another employee. Well if I called the employee's equals method, it's going to, of course, return true. But it's going to return true because it is pointing to the same object. It has the same reference.

On the other hand, if I pass and create a new employee that has the exact same information, and I check to see, well, is x equal to z, it gives me false. And that, again, is because the equals method is looking to see, are the reference values the same? Are the values on the stack the same? Not are the values inside the class the same.

And so there's nothing that says that I can't override the equals method to identify, well, what do I mean equal, when this object is the same. And so this might be something. So I'm going to pass in my object. I'm going to make sure that the object exists and that it is an instance of an employee.

I'm going to then cast my object to type Employee. And at this point, I can check to see, well, is the current employee equal to that employee. Are the names the same? Is the social security number? Is the salary the same?

In which case, then they are going to be considered equal. So that would be the principal of overriding.

Now, like I said, rather than writing this code, generally, you're going to override the hashcode, which will basically create an algorithm that allows us to convert it to a 32-bit number. And so in this case, we're going to take the employee ID and hash it. We're going to take the name and hash it, the social security number and hast it.

We're going to take the salary, and convert it to an integer, and hash it. Multiply it times 83, shift it 32 bits to the left. And then we're going to return the 32 bits that are left. I'm not going to take a lot of time in this.

But the idea is that if I don't have a employee that has the same employee ID, name, social security number, and salary, the hashcode that is returned is not going to be the same. And so then I can use the hashcode to do an equals. Now why? Because converting things to a 32-bit number is actually faster than what we saw earlier, where we're doing all this comparison and string comparison. It's just faster.

And so I can check the hashcode to see if they are equal. This looks like a good point to take short break. So let's go ahead and do that.

## 2. Overriding Methods, Polymorphism, and Static Classes, Part 2 - 30m

All right, to wrap up this particular lesson, let's go back to the whiteboard. And let's talk about one additional concept.

There's a couple of others that we're going to talk about. But the rest of the chapter is going to talk about two main concepts.

And the two concepts are-- we want to talk about the meaning of the word static and what a static class is. And then we're going to introduce you to a design pattern.

And so let's talk about static. Now, when we've created our classes, up till now, we've created an instance of that. And so for instance, let's say that I have an instance, employee one, employee two, employee three, et cetera, et cetera. So I have these various instances in my program.

And it doesn't take too much imagination to know that employee one's employee ID, and name, et cetera, are going to be different than employee two's employee ID, name, et cetera. That's the idea of these fields that we've been talking about.

But let's say that there are certain pieces of information that we want to have available to each employee without having to loop through each one of the employees. So each of these, of course, are instances of the Employee class that we created before.

But what we want to do is we want to be able to have information that is always the same. So I want one piece of information here that is the same for every one of these instances, no matter how many I have or if I don't have any.

Now, what that is-- that is the meaning of the word static. It means it belongs to the class.

So let's think of this conceptually. If it belongs to the class, how many classes for Employee do I have? Right, I have one.

So in that case, if I have a static field, the static field will always only have one value for the entire JVM. And it doesn't matter how many instances I have. I still have that one value.

Well, let's say I have a static method. OK, once again, static, meaning belonging to the class, means that there is still only one implementation. It's not based on the differences between instances. It belongs to the class. There's only one implementation.

Now as we've seen, if we're talking about an instance field-- of course the employee ID of this one and the emp ID of this one should be difference or probably are different. So if I say print or to string here, that's going to give me a different result than to string here.

Well, that's what static is about. Because it belongs to the class, there's only one implementation.

Now, the second thing that's static means for us is that I don't have to have an instance. So I don't have to instantiate my class in order to access that static method or that static field, because it exists as part of the class. And the class exists, whether I have thousands of these instances or whether I have none.

So that's what we're going to be talking about-- one of the main concepts that we're going to talk about-- in this next section. And the other thing is we want to introduce this idea of a design pattern.

Now, a design pattern is very simple. Design patterns were developed by people much smarter than I am, who came together and decided that when we develop, we seem to see recurring patterns, especially in the enterprise. And so they came up with a number of design patterns. And there is actually a Java design patterns class that, if you're interested, you should look into.

But one of the design patterns we're going to talk about in this chapter-- and we'll introduce others as we go. But the one we're going to be looking at in this chapter is called the Singleton Pattern.

Now, the Singleton Pattern-- the reason we're bringing it up is because it's very similar to this idea of static, where there's only one. In the case of the Singleton Pattern, I want to be able to create one instance of an object and only ever one instance.

And so what we're going to see is there are three steps to ensuring that you can't have more than a single instance of a particular class. So that's what we're going to cover for the rest of this chapter.

Now before we get to that, there are a couple of slides in the meantime that we want to talk about this idea of a variable argument. Now, a variable argument is pretty straightforward.

We've talked about overloading. And so on the screen, you can see that there are a number of instances of an overloaded method, called average, that's going to return a float. But each one is perfectly overloaded, because it has a different number of arguments. But if you notice, the types of the arguments are exactly the same.

Now, think about this. If I wanted to have a statistics class that allowed to me to average anywhere from two numbers together to, let's say 2000. You can kind of see that this could be really unwieldy really quickly, because if I actually had to define each and every one of those arguments, that could get to be a real pain.

And so if you notice at the bottom, of course, when I call the average method, depending on how many I pass in, it's going to call the proper overloaded method. But surely there's got to be a better way. And there is.

And that's what we're talking about on the next screen, where, rather than-- if we have elements of the same type that are getting passed, and we want to be able to identify that we're not really sure how many of these we're going to pass in, what we can do is use something called a varargs, or a variable argument. In this case, we're indicating that we will pass an unknown number of integers.

And what we're going to do is that, regardless of how many that is, we're going to put them in a single array, in this case called nums. So if I pass one argument, then there's only one element. If I pass 1,000 arguments, there's 1,000 elements. That's the cool thing about the varargs.

And so just like any use of an array, I could use a for each to be able to loop through each integer in that particular array. And in this case-- in the case of an average-- we're going to sum them all together. And then we will divide by however many elements there are.

So if I pass in 1,000 integers, I divide by 1,000, whatever the sum is. And that's the average. So this gives you a chance to be able to work with an unknown number of arguments, as long as they're of the same type.

Now the question-- not on this slide, and not covered in the book-- well, what if I had other arguments that I wanted to pass besides this? Well then you'd put those first. And then you would have your variable argument at the end of the method call.

So let's get back to this idea of types and objects. Now earlier, I basically said that we could use the instanceof operator to determine whether an instance of an object is of a specific type, in this case, manager. And if that is the case, then we could use that information to then cast our employee to a manager, so that we can work with the manager characteristics specifically.

So this would be a perfect example of the downcast that we were talking about earlier, where I would use the casting operator, the parentheses around the type I want to change it or cast it to. And it will create an instance of that particular type.

Well, now that I'm working with a manager instead of an employee, now I can call the methods that are associated with that particular manager. And it's also going to give me-- in this case, this is the overridden method. So it's also going to give me the manager's details through virtual method invocation.

Now at the white board earlier, I also said that if we are going from a director to a manager, or a manager to employee, or for that matter, a director to an employee, an upcast is always permitted-- does not need an explicit casting operator-- because, in this case, we can say a director is an employee or a manager is an employee. It will go ahead and do that cast for us. And the compiler will never complain.

On the other hand, if I am trying to go the other way, as I explained earlier, you have to identify that you're going to do that cast. And the reason is, for example, if I have an Instance Manager or I have an instance of Employee, that doesn't necessarily mean that that employee is an engineer. Or it doesn't necessarily mean that it's a manager. I have to check to see if it is.

Now in this case, because I instantiated e as a manager, it's going to allow me to cast e as a manager, no problem at all. The compiler's going to say, yep. It's possible that that could be an employee. So no problem at all.

On the other hand, because a manager-- well, if I'm casting it as a manager but trying to instantiate it as an engineer, obviously, that's not going to work. And so in this case, I would get a compiler error. So any time we are going from a more general class, the superclass, to a more specific class, a subclass or some subclass, we do have to explicitly identify to the compiler that's what we are doing.

Which brings us to the static keyword. I've already indicated that the static modifier is used to declare fields and methods as class-level resources. That's the whole point. So a static class member can be used without an object instance. Remember I said that I can use a static field or a static method without having an instance of that object at all.

And it is used in situations where the problem is best solved without an object. In our case, for example, working with individual employees, it makes sense to work with employee instances. But if I'm looking at something else, then it might be better to use the static keyword instead.

You shouldn't be using static just so that you can bypass the object-oriented features of Java, unless, of course, there's a good reason for it. So for instance, static methods are methods that can be called even if the class they're declared in has not been instantiated. Or by that token, there could be thousands of instantiations. But it will access the class-level method instead.

So these are known as class methods and are useful in APIs that are not object-oriented. They bring up here the Math class. Now the cool thing about Math is that it's pretty predictive.

For example, if you want the value of pi, I guarantee you that the value's not going to change today, tomorrow, or any time soon. And so in the Math class, there is actually the pi field. And you will always get the same exact value each time. Also, if you want the log e, you can call that.

In addition, though, the Math class has a number of methods that, no matter what you do-- for example, if you're going to add, or subtract, or you're going to get the average, or you want a random number-- it's always going to give you that information without having to instantiate Math. So in this case, you can't use a static method to access the non-static members. Well, that kind of makes sense, because remember, static methods can be accessed without an instance.

So if you can access-- how would you access the members who are non-static? So in that case, in a static method, you can only use fields that are also static.

So for example, in my math test here, notice that I am calling the Math random method. Now the random method's kind of easy. It's going you provide me a value between zero and approaching one. The asymptote is one.

So in this case, apparently, I want a value somewhere between zero and nine. That's what's going to be returned from that particular method. The Math also has a square root method And in this case, I'm assuming that the result would be three, since three times three is nine.

Also, again going back to the random, some number between zero and one, now I'm going to get a value between zero and 99. Also, the absolute is going to give you the positive value of either a positive and/or negative number. Now like I said, the Math class has dozens of methods that you could call. These are just some of the examples that you can look at.

Now, if you want to implement a static method, you would provide, as a modifier, the keyword static. So this case, I'm going to create a method called printMessage. It's static. So it belongs to my class.

And apparently, I'm going to print out whatever message I pass in. So Message for, it's going to identify the current date and time, colon. And then it's going to print out the message.

So in this case, I could call this, whether I had an instance of this class or not. And this would be an example.

Now to call the static method, I would identify the name of the class and then the name of the static method. So it's similar to calling a method on an instance. The difference is that instead of an instance variable here, I use the name of the class itself.

So we want to qualify the location of the method with a class name, if the method is located in a different class than the caller. Now by the same token, if the printMessage static method were in the same class, all I would have to do is pass the name of the Method itself.

Well, how about a static variable? Now setting variable, again, is a variable that belongs to the class. It is initialized when the class is first loaded, meaning that it doesn't have to be instantiated. And it is called a class variable. But you can only have one value associated with a static variable per Java Virtual Machine.

So static methods store data in static variables. And all object instances share that single copy. So again, they are initialized when the containing class is first loaded.

So for instance, if I have a counter-- it's an integer counter that I have declared as static. And so at this point, of course, the value would be zero for any instances of static counter that are out there.

Well, notice that I have a getCount method. It's also static. Why? Because it's trying to access a static variable. So it has to be static.

And in this case, I'm also identifying that I want to be able to increment the counter. So again, it is also going to be static.

So to utilize this, notice that I could-- in my main method, I could say, all right, staticCounter.increment. So I call the class. I call the increment.

In this case, of course, the counter will be one. Increment, the counter would be two. And then at that point, I could call the getCount method. It accesses the counter and outputs in, colon, two.

Now since the class does not have to be initialized in order to have access to the static method, there are some times when you want to actually initialize the static fields when the class gets loaded. And you do so by using a static block.

Now in a class, there can be any number of static blocks. And they will be executed from top down. But in this case, my static block is going to print out initiating. It's going to loop from one to four. And it's going to populate my switch's Boolean to-- it looks like with all true. So I'm going to have five true in my array, my Boolean array.

Now, notice that in this case, in the main method, I can now change some of those elements, so the second and the third element, to false. So I could access these without ever instantiating my class. But the static block ensures that the value inside of my Boolean array is available when the class is first created.

Now another possible use for static is you can apply the static modifier to the import keyword. Of course, the import is before the class. And so what you're doing in this case is you're saying that I want the methods or the fields of, in this case, the random method, or I want all of the methods of the Math class, as if they exist inside of the current class. So for instance, in this case, in my static import class, if I call the random method, the random method does not have to exist in static import, because I've identified with a static import that I want all of the Math methods available as if they exist here.

Now, that can be really convenient in some cases. But if you do it too much, it can also cause naming conflicts. So you do you have to watch what you're doing with that.

Now getting back to this idea of design patterns that we introduced on the board, like I said, this came from the Gang of Four and originally, from a book called Design Patterns: Elements of Reusable Object-Oriented Software. Great book, it's been out in a number of editions now. But it gives us not only reusable code-- basically, a cookbook for the best practices for engaging in certain activities in code-- but it also gives us a vocabulary to talk about. That way, after this class, if I were to tell you, well, we need to use a Singleton Pattern, you'd have some idea of what I was talking about.

So with that, like I said, for the Singleton Pattern, there are three steps in the class where you want to make sure that you can only instantiate this class once. So in this case, I have a Singleton class called SingletonClass. And I'm only going to ever create a single instance.

Now, this is really useful in situations for persistence, where if you have information that you want to save in a file or you want to save to the database, but you want to make sure that there is only one connection, for example. Well, that would be an example of why you might use the Singleton Pattern.

So the three steps are this. First of all, you're going to create a private field that is both static and final. Private can only be accessed from within this class. Static-- it's available without instantiating the class. And final, it can't be changed once it is instantiated. We'll talk about final a little later in the next chapter.

And of course, we're going to return in this case-- or we're going to have a Singleton class. And we're going to call the field instance. And so notice that I'm going to go ahead and instantiate it here. Well, because it's static, as soon as I load the Singleton class, it's going to instantiate this instance of Singleton.

Now the second part of the Singleton Pattern is that the constructor for the Singleton class will always be private. Why private? Well, it means that I can't call the constructor from outside of this class.

So in this case, I'm calling the constructor inside the class, perfectly acceptable. But I can never say new Singleton in another class.

And so how does the other class get this instance? That's the third step, where I'm going to create some method, in this case called getInstance. It's going to return what? That one final instance.

And it's going to return that instance.

Because it is static, it doesn't have to instantiate the class. And so in this case, there can only ever be one instance. And every time I call getInstance, it will return a reference to the exact same Singleton class.

So that's the idea of the Singleton Pattern. So as an example of Singleton, I might have something like this. So here's my DbConfigSingleton. So apparently, I have a host name. I have a database name.

So notice that I'm going to create an instance of this DbConfigSingleton, private. I have my private constructor. So the only place it can be called is here.

And then in my constructor, of course, I can identify what my host name, what my database name is, et cetera. And then any time I want access to that database, the only thing I can do is call getInstance, meaning that no one has access to the information that is inside of this instance.

So if I want to create an immutable class or immutable classes-- and in the previous chapter, we did talk about how we want to make our classes as immutable as possible. An immutable class is a class whose object state cannot be modified once it is created.

So for example, we already said that a string is an immutable class. Once it is created, you can't change or manipulate the string that has been created. The only thing you can do is update it.

Any modification of the object will result in another new immutable object. So earlier when we are talking about if I wanted to concatenate a string to the same string, it actually changes the memory location of the string, which is kind of what they're talking about here.

In this case, for example, I have a class called Contacts. Now, I made this Contacts class final. The keyword final always means that it cannot change. So when I create this public final class, it will not be able to change.

Now inside of it, notice that it has two private fields, both of which are also called final, meaning that once I set the first name and set the last name, those values cannot change. And so notice that I'm going-- in my constructor, I will pass in the first name, pass in the last name. That will assign these private final fields, which means that I can never actually change the first and last name, once this happens.

I can access it by getting calling my getters. And I can see what is inside of this class by calling the toString. But otherwise, I have no way of changing the objects or the values that are inside of this class. So in some cases, that might make some sense.

So basically, in this particular chapter, we did talk about the the four access levels, the three modifiers. We talked about overriding methods, meaning that I have a parent subclass. In the subclass, I have the same method, with the same arguments as the parent class but different implementation.

We talked about virtual method invocation, where we might declare a class based on its superclass but then instantiate it using the specific subclass. We introduced the variable arguments, so the ability to pass in the same type of element any number of times. We also talked about upward and downward casts, the purpose of the static keyword belonging to the class, and not requiring an instance.

And we also showed you the three steps of implementing the Singleton Design Pattern. With that, it's time for you to do Practice Four.

## 3. Practice 4-1: Overriding and Overloading Methods - 20m

In Practice 4-1, we're going to convert our Employee class. Now, if you want to open a project that already has much of the work that we've done up till now, you can. It shows you in the student guide where that is. But in this case, we're just going to edit the employee that we currently have.

Now, in the previous example, we had this printEmployee class. And of course, in the lecture, we identified that we could just as easily use a toString method to do this. So let's go ahead and convert this to a toString method.

Well, the toString method does return a String. And it always helps if you actually type it correctly. So the toString method. And the toString method takes nothing.

But the problem is that we don't have a System.out when it comes to the toString. So I'm going to actually use the String Format method to work with it. That also means, however, that I have to get rid of a-- OK, don't have to get rid of it.

And of course, we need a return, a return method to get that working. All right, so at this point, we have a toString, but notice this little light bulb over here. Well, this is saying, hey, it'd be really helpful if you added your override annotation. So I'm going to go ahead and do that as well.

So notice that in this case, instead of the System.outs that we had before, we can still output the appropriate information. But in this case, we're going to return a formatted String. Everything else, exactly the same as what we had before.

So I can go ahead and Save that. But then it says, hey, let's do the same thing in the Manager class. So we've seen the Manager class before.

And so we have our getDeptName. But in that case, we never had a toString method. So we're going to go ahead and override that one.

And of course, we have to return something. So we're going to return-- and it helps if we just call the super.toString method. But we also want to add.

Well, I'm going to go ahead and use the String dot format, because I prefer formatting my strings as I go. And so in this case, my first object will be a String. I'm going to go ahead and stop that.

But in addition, we also want the department name. So I'm going to go ahead add a percent. Now, if I recall, we had added a second new line feed on that one. So we don't really want that.

But I'm going to go ahead and add the String, or actually a line feed, a string, and then a line feed. And we're going to say that department-- and how do I get the department? Now, I can call the getDepartment method, and that will allow us to work with this.

Now once again, since we overrode the toString, it does support the override attribute. And so now, we have a manager that has been appropriately overridden. So we'll go ahead and Save this.

Optionally, we can override the toString method in the Director class as well to display all the fields of a director and the available budget. Well, rather than do all this again, I'm just going to go ahead and copy that method into the Director.

And so at this point, we can have super.toString. But that's going to give me, if you remember, that's going to give me the Manager in this case. So in this case, we also want the Budget.

And so in this case, rather than the Budget, we're going to return the Budget. Now, what we can do is we can make sure that this is formatted correctly. So we can use that NumberFormat class that we had before-- Number-- yeah, that one.

And we want a Currency. So we're going to getCurrencyInstance. And then we're going to format it. And in this case, what we want to format is the getBudget method.

All right, so at this point, we now have a Director that is going to output all of the information that we've talked about before, including the Budget. So I'll go ahead and Save that.

And just to make sure that this is working, now notice that in this case we don't have this, so how can we override this? Well, of course, we can call the toString method for each class. And the same thing here.

And we can make sure that this is working. All right, so in this case, our toString is not seeming to work, because that's returning a String. So guess what? That works. We'll stop that.

So let's see what we have. So this goes back to at least now we know for sure it's working. So each of our Employees output the same thing based on that.

We have our Department for our Manager. And we have our Budget for our Director. So it looks like everything's working so far.

So now, we're on now step five. And it says to create a new Class called EmployeeStockPlan in the package. So let's go ahead with a new Java Class, EmployeeStockPlan.

And it said we're going to have a single method called grantStock, which takes in an Employee object as a parameter and returns an integer. So getStock. And so at this point, we're going to have to return something. So what is it we're going to return?

Now before we return something, we're going to have to check. So if e instanceof-- what? Director? So we're going to return that. And so if it's a Manager, you return 100. And I guess if you're a lowly employee, you only get 1-- no, 10.

All right, so at this point, we can check to see what type of Employee is passed into our EmployeeStockPlan class. We can call the getStock method. And we can see what's going on.

Or I could have done it the way that it said to do it, which was to create constants. But this actually works simply. What the heck. While we're at it, why not?

Now, in this case, they say to have these lowercase. But that doesn't make sense, since we did say that a final should be marked-- or a constant should be marked as a uppercase. Gotcha. Always helps if you put the fields outside of the method.

So in this case instead, we will do DIRECTORSHARES, MANAGERSHARES, and EMPLOYEESHARES. All right, so that does the same thing. We've got our grantStock. We've determined what's going on, resolve any missing import statements, which I don't have, and save the EmployeeStockPlan class. So there we go.

All right, now, once we've done that, we can go back to our Employee test. And now, we're going to change a couple of things. So we're adding a static printEmployee method at the end of this class.

And in this case, we're going to pass in a single Employee object. And apparently, we're going to just print that out. Now of course, this is going to call the toString method of the Employee, which will give us the appropriate information.

And we're going to overload the print method to take a second parameter. OK. And in the second location, we want the EmployeeStockPlan, which means that I have to import that one.

And so we will pass that in as the second argument, which will then pass the first one. So we'll call the first printEmployee method. And then we will identify that the Stock options-- and I'm going to add in--

Always helps if you actually call it the right thing when you're doing it. All right, so we have our grantStock. So now, we should have grantStock. We'll pass in the Employee object and finish up our method print line. There we go.

And so at this point, we're going to create an instance, pass that instance to each of the objects. So in the main method, if we create a instance of the EmployeeStock test plan--

And so in this case, instead of this, we're going to call the printEmployee and pass the ep.

All right, so in this case, we are calling the second one that's going to not only print out the employee but also identify the number of stocks that each employee would get, at which point, we should be able to test this. So if we run it--

Notice that I get my Employee. For my Manager, I get my Department. Another Employee. I get my Budget and Department for my Manager. And also get my Stock options.

OK, it looks like from a perspective, it might be nice to actually get these so that they print well. But at this point, it actually outputs what I was expecting it to. So this would complete Practice 4-1.

## 4. Practice 4-2: Using Casting - 6m

In Practice 4-2, we are going to have to open a practice that's already there, because there's some built-in-- well, there's some built-in things that we need to fix! So if we go into the 4 Polymorphism, we go into Practices, go to Practice 2, we'll go ahead and open up the Employee 4-2 Prac. So I'm going to go ahead and open that up. And notice that there's already some errors that we are getting.

Now, any time you have an error, you can of course hover over the light bulb. So cannot find symbol, incompatible types, and incompatible types. You could also hover over the red squigglies, and it'll give you the same. Or for that matter, you can also hover over the red over here, which also will take you to that particular error if it's not showing on your screen.

So in this case, it looks like we have three different problems. And so, one thing, if we're talking about the engineer method, one thing that we can do is we could navigate to the source. So notice that, in this case, it brings up the employee. And you're like, well, wait a minute, I thought this was an engineer method. Well, notice that, while it may be an engineer method, when I declared it, I had declared this as an employee.

So what that means is that I am only able to work with methods that are only coming from employee, as can be seen here. So the four getters, the raise salary, and the set name. Anything that belongs to an engineer, I won't be able to access at this point.

So if I were to go to Line 17 and change this, for example, to the one that I declared as an engineer, no problem at all. Because it's an engineer, away we go. And so if we navigate to that source, it brings up the engineer. We have our engineer method. It knows exactly what to do with that. All right? Well, what about this one here?

Well, it's basically saying that the problem is an incompatible type that an employee cannot be converted to an engineer. Well, in this particular instance, that is exactly correct. So how would I fix this? Well, I could create my employee, and I could downcast it as an engineer. Remember, the supertype going to the subtype always has to be a cast. So this would work fine.

And then finally, in the case of this one, where I'm trying to change a reference type to a string, that doesn't work out so hot. So if we wanted to comment this out, we could. And on the Projects tab, we can go ahead and run it. So if we were going to run this particular code, notice that, OK, it outputs it. But then it basically said, employee cannot be cast to type engineer. So this would be, instead of a compile time error that we dealt with previously, now we're talking about a runtime error.

Now specifically, that's telling me that this error occurred on Line 20. So with this runtime exception, you'd have to say, well, what's the problem? Well, once again, we're talking about an employee does not have the methods of the engineer specifically. And so, we get the unsuccessful. And so what we'd have to do to fix this is we could create-- so we need to, on line 20, we have our engineer. And in this case, instead of trying to do the cast, we can just go ahead and call it an engineer. And in this case, if we run it, then as you can see, it understands the differences between the two. And away we go. And that finishes Practice 4-2.

## 5. Practice 4-3: Applying the Singleton Design Pattern - 6m

In practice 4-3, we want to apply the Singleton design pattern. So in order to do that, we're going to go ahead and open a practice. So we're going to go back to our practice 3, get the project that we already have. And in there we have a Main class with a Main method. In the packages, we also have this PeerSingleton class, and so we want to modify this particular class. Well, if we open it up, we can see that there are a number of things that are already there. So we want to modify it to implement the Singleton design pattern.

So the first thing is we're going to change the constructor. Well, in this case, the constructor is public, so on a Singleton, the constructor will always be private. The second step is that we need to create an instance, so right now, we have a private static final array called host names, but we also need an additional private static final field called PeerSingleton, that's the type. PeerSingleton, and we're going to call it, looks like instance.

And so that is always step two. We're now the only place where this, because it has a private constructor, the only place it can be created is inside of the class. So I've created my instance, and now all I have to do is identify how to go about getting that instance. So we'll create a public method for that that is going to return, now, in this case, it's going to be a static method, and is going to return my PeerSingleton class. And we will call this getInstance.

And so all we need is a return of that variable instance, and that allows us to use the Singleton. So now that we have the Singleton, we can go back to the main method to utilize this. So we're going to create an instance of Peer-- yeah, one of those, PeerSingleton, and we're going to call it PeerList01. And remember, the only way that I can get it is to actually call the PeerSingleton getInstance method. But let's see what we've got.

So let's say that I wanted to also create a second list, and get that instance as well. Well, earlier in the class, I said that basically the equals method and the equals equals determines whether or not this is the same object. And so in this case, we want to check to see if that's the case. Before that, I'm going to go ahead and-- guess it would be nice to spell these reasonably close.

Now, of course, based on the Singleton pattern, that should print out. They are the same object. And then, we're going to go ahead and loop through each of the host names for each of the lists, which will also prove that it is the same. So in each case, they hold string. So if we do a peer list, getHostNames, and we'll go ahead and just loop them out. And we will do the same thing for the second one, and we will see that again, they will have the exact same host names as well.

So with that, I'll go ahead and run it. And we can see that they are the same object, so even though I have two instances because of the Singleton pattern returning the same one, they are always going to have the same reference value, which also means that they're going to have the same host names. So this concludes activity 4-3.

## 6. Skill Check: Using Polymorphism, Static Classes and Overriding Methods - Score 80% or higher to pass

Skill Check: Using Polymorphism, Static Classes and Overriding Methods

View Skill Check
