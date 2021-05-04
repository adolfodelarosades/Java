# 5: Abstract and Nested Classes

1. Abstract and Nested Classes - 23m
2. Practice 5-1: Applying the Abstract Keyword - 14m
3. Practice 5-2: Implementing Inner Class as a Helper Class - 7m
4. Practice 5-3: Using Java Enumerations - 11m
5. Skill Check: Using Abstract and Nested Classes - Score 80% or higher to pass

## 1. Abstract and Nested Classes - 23m

Excellent. Well, good work. All right, in Chapter 5 that we want to do next, we're going to talk about four different topics.

We're going to talk about the meaning of the keyword abstract, the meaning of the keyword final, although we have talked about that already a little bit. We're going to be looking at nested classes. And we're also going to introduce enums, or the enumerations. Now at the board, I'm only going to talk a little bit about the meanings of these. And we'll get right to the slides.

So in the first case, the meaning of the term abstract, or at least the keyword abstract, there are two meanings. It means, first of all, not implemented. So if you use the keyword abstract in a class, you are indicating, for example, that a method is not implemented.

Now, there are a number of reasons that we'll talk about as to why we might do that. But that's the first meaning of abstract. Now, from a class level, it also means that it cannot be instantiated. So when you're working with an abstract class, you're basically declaring that I never want to be able to instantiate, or use, that class in memory directly. It would have to be subclassed.

Now earlier, we also talked about the keyword, or final, and we basically said that that just means that it cannot change. And we've seen that if we have a field that is marked final, then that's basically a constant. But it also means that we can mark methods as final.

Now, methods that are final cannot be overridden, so no subclassing. And then, finally, if I create a class that is final, like the string class, it cannot be inherited or extended. All right, so final can have a number of different possibilities that we will be talking about.

Now in addition, we're going to be talking about nesting. Now, part of nesting is to look forward to future material, because instead of nesting classes, a lot of times we're going to be looking at Lambda operations and Lambda functions. But that's still a future.

So when we talk about nesting, we're basically saying that inside of my class-- so if I have Class X, for example, I may declare a Class Y that can only be used inside of this class. Or there may be a time where I may create an anonymous class that doesn't have a name, but yet exists inside of the class. Now, from a design standpoint, if there's functionality that will be utilized only in conjunction with this class, it makes more sense to have it in one place rather than having multiple files that then I have to import and work with. So we'll talk a little bit about nesting.

And then, we're going to finish up-- we're going to talk about something called an enum. It's an enumeration. And the idea is that-- well, remember earlier, I was talking about that if I were to set the employee ID, because it's an integer, basically I could set it to plus or minus 2 billion or so-- wide range of details. Well, with an enumeration, I can identify specific values.

And so if I define an enumeration and then define my usage that it has to use the enumeration, then I'm saying that only these specific values are allowed. Nothing else is valid. And so let's go ahead to the slides.

All right, in this chapter, like I said, we're going to talk about abstract and nested classes. We've talked about how this is going to go. So when I model things, I'm going to probably use a class diagram. And it's always a good idea to design your programs before you use them. In fact, probably 40% to 50% of your project time should be spent in design.

And we've already talked about this idea of method inheritance, where if a subclass has an IS-A relationship with the superclass, we can go ahead and extend that class. Now, what that does is it not only extends the class, but it also makes sure that all fields and methods of that class or also inherited.

And from a generalization standpoint, I can then, for example, in our previous examples, we just did that method where we were able-- the print method where we were able to pass an engineer, an admin, a employee, a manager, a director, to the same one, because we generalized the code. And so that's the idea of what we're going to be talking about here is code that is designed to rely on the most generic type possible is easier to maintain. So we'll work with that.

So in order to enable generalization, there's a couple of things that you can do. And one of them is that, when you declare a class, you should use the most generic type possible. Now, in our earlier example, the most generic type possible was employee. In the one that we were looking at there, where perhaps we might have a mobile phone, we might have a television, but both of them are extending this idea of an electronic device that turns on or turns off.

Well, in this case, I can declare the electronic device. But then I can instantiate the specific device that we're talking about. So that's the principle of generalization. Now of course, generalization means that I am held to only the methods and fields of this particular type. But again, you should always use the most generic reference type possible when you are creating your methods, or your declarations.

Now perhaps you need an abstract class. All right, so in this case, we have a class, television, that extends electronic device. Now, think about this. How many electronic devices can you think of that exist across the board? And if you think about it, for example, a tablet, a smartphone, a mobile phone, a regular phone, a television, a monitor-- they all have different methods of turning on, turning off, which means that it is very possible that the implementation of the turn on and turn off method could be completely different depending on what device you're talking about.

So in some cases, it might not make sense to implement the electronic device, because everything's going to be completely different. And so one of the principles of an abstract class is you may want to identify that yes, I want a specific method to be available in any class that extends electronic device, but the implementation is going to be so completely different that I don't want to implement it here. So that's one thing.

Now, the other thing is that, let's say you go into your local superstore and you say, could you point me to your electronic devices. Well, they may be able to point you to a general direction in the store. But if you were to ask a salesperson to sell you an electronic device, that's not really specific enough for them to be able to use.

Well, it's similar in terms of programs where it is unlikely that I would want to instantiate an electronic device. I'm probably more likely to instantiate a television, or a smartphone, or whatever specific electronic device I need to use. Now, the idea of an abstract class, as I indicated earlier, is that this class cannot be instantiated. And so, for instance, if I tried, at this point, as an abstract class to instantiate it, it's going to give me a compiler error.

Now, inside of an abstract class, you can have zero or more abstract methods. Abstract methods are simply methods that you are defining. So in this case, I'm saying that there will be a turn on method. It will take zero arguments. But it will return no data type.

In that case, however, notice that I am not implementing anything. There are no braces. So it's followed by a semicolon. And that's it. But because I'm not providing implementation, I will mark that method as abstract.

Now, in a class that has at least one abstract method, the class also has to be called abstract, because you have no implementation for that particular method. You can't use it in a program. So an abstract method can't have a method body, has to be declared in an abstract class, and must be overridden in the subclasses.

So in the case, if I am validating my abstract class, first of all, an abstract class may have any number of abstract and non-abstract methods. So like I said, any number means you could have zero abstract methods. And every single method in the abstract class is implemented, not abstract. Or, for that matter, every method in the abstract class could potentially be abstract, have no implementation. And none of them could have implementation. That's on the other end of the spectrum. It's unlikely.

So in an abstract class, you can have implementation. And it is usual that something would be implemented there. Now, when you inherit from an abstract class, when you extend the class, you either have to declare the child class as abstract as well, or you have to override all of the abstract methods inherited from the parent class. If you don't, it'll give you an error similar to the one at the bottom of the screen.

Now let's switch gears. Now, earlier I said that a final meant that it cannot change. So for example, a final method may not be overridden. So in this case, notice that I have a parent class. I've marked print message as final. So if I extend the method parent class and I try to override the print method, it's going to cause an error. It won't allow me to do it.

Now, that's not saying that you can't overload it. But you cannot override it. On the other hand, if you mark a class as final, that means that it cannot be extended in a subclass.

And then finally, a final variable can be applied to variables. Final variables may not change their values. Now, this is the important part in Java after they are initialized.

Now, some languages require that the variable be initialized when you declare the final variable. Java is not so. You can declare the constant at the time that you declare it. But you can also ensure that every single constant is initialized in the constructor.

So as long as every final field is initialized in the constructor, Java will allow it. Now in addition, you can also declare method parameters as final. And you can also declare final variables as final. So for example, notice that in this case, I have a final private field called Field not initialized here. This is perfectly acceptable as long as in the constructor, I do set the value. It is not possible, in that case, for Field to not have an appropriate value.

Now, on the other hand, though, if I tried to change the value of Field, somewhere here, it would not allow it. Also, if I'm talking about a static final, in this case my Java constant, I would not be able to change this value anywhere inside of this class. And it is also possible in my arguments to declare the argument as final. Now notice that here, if I try to assign a value to the argument, it's going to prevent me from doing so.

Now, like I said, you can declare a final variable and not set its value, whether that be up here, in which case it has to define it in every constructor. But you could also declare the variable as a local variable. But the first assignment sticks. If you try to change that value after that initial assignment, then it's going to give you an error. So that's the idea of final variables or constants.

Now of course, the advantage to that is that it is possible. But that means that every instance of this class could potentially change the value or use an appropriate value for that class. And so we're not stuck with a value that can never change.

Now earlier, I'd talked about a nested class. Now, there are a couple of different ways that you can do a nested class. For example, there are two types. You can have static nested classes, meaning that you have a class that has been marked as static inside of another class. If that's the case, you can access that nested class by simply using the name of the outer class and then access the inner class.

On the other class, you can also have instance inner classes. Now, instant inner classes, there are three different types. And generally, you will rarely, if ever, see these unless you're working with a graphical user interface. And the reason for that is most of the time, especially with anonymous classes, what you're looking at is you're creating a class that is a listener so that it will execute certain code if a particular event occurs.

So we will talk about member classes. That's a class that is not only defined inside of the class, but is named. But we will also see that there are local classes and anonymous classes. Now, like I said, later on when we're talking about Lambdas, we will revisit this idea, because in this case, we can actually simplify the syntax.

So for instance, this is an example of a member class. Of course, I have my outer class, called BankEMICalculator. And then I have a inner class that has some functionality that I want to use only inside of this calculator.

Now, notice that the class has a completely separate name. It can have its own internal fields. And it can also have its own internal methods. But because the class is private, notice that the fields are also local. They're private to the inner class.

Now, the final topic that we want to talk about in this particular chapter are enumerations. Now, enumerations can be simple. Or they can be complex. The simplest is probably right here on my screen.

So notice that I am declaring that something is an enum. It's a class-like structure. And I can give it a name, just like I can with a class.

In the block, however, I'm going to define those specific values that PowerState can be. So in this case, if I say that something is a PowerState, it can be OFF. It can be ON. Or it can be in SUSPEND state.

So for instance, if I create in my computer here a set state method that expects an enumeration as its argument, notice that I can define the name of the enum, similar to a static. And then I can define its value. That's all an enum is. But what it means is that if I don't pass one of these three valid values, then it can catch it at design time that something is wrong.

Now, enumerations can be much more complicated than this. But this indicates how we would have done the previous one, where here's my set state method. And then I'm just identifying that I want a PowerState that I'm going to call state, in which case I can check, well, what do I want to do in the case of OFF? What do I want to do in the case of ON? What do I want to do in the case of SUSPEND?

Now, a complex enum, an enumeration, is, like I said, a class-like structure. So basically, you can do anything in an enumeration that you can do in a regular class with one exception. All constructors in an enumeration are always private. So they are constructed when they are actually passed.

Now, in addition, you can also pass an additional piece of information. Now, what you call it is up to you. For example, in this case, we're going to call it a description. But it could be anything else. But the idea is that I can attach a label to the enumeration. And so, in this case, if I set the PowerState to ON but I ask for the enum's description, what would actually be passed out would be the usage power is high. So in this case, there are a number of things that I can do with a complex enum.

So as an example, here's a class that apparently is using it. So notice that I can define that my PowerState is in SUSPEND. So can say current state. Now comp, of course, is my instance up here. But then I can call the getState.

Well, in the getState, it's going to come back with SUSPEND. But notice that I can also say not only getState, because that goes into the enumeration, but now, I can get that state's description. And that's where I can get the power usage is low.

So anyway, that's the ability to use enumerations. And so in this particular chapter, we talked about abstract. We talked about both abstract classes and abstract methods. We talked about what that meant as far as classes and subclasses. We also looked at the final keyword. We looked at, very briefly, top level and nested classes. And we briefly also introduced the enum. And that completes Chapter 5.

## 2. Practice 5-1: Applying the Abstract Keyword - 14m

In Practice 5.1, we want to apply the abstract keyword. So the first thing we're going to do is open up our practice project. So if we go to Chapter 5 under Labs to Advanced Class Design, go to Practices, you'll notice there are three practices there. Let's go ahead and pull in the abstract banking practice, although I'm going to pull all of them in at the moment. And it looks like it opened up a number of them for me.

So we can expand the project directories. And so in this case, notice that there are already a number of classes. We have our main class, the account. And then the savings account is based on that account. It looks like we're going to have a bank. We're going to have a customer. And then we have a way to be able to generate a report of the bank's customers.

And then our main method will be the AbstractBankingMain. So before we do that, it says that first of all, we want to review the SavingsAccount class. So I'm going to go ahead and close all of these and just bring up SavingsAccount. And it looks like in SavingsAccount, we have a deposit, a deposit method, that looks like it takes an amount in as double and returns nothing.

We have a getDescription that returns the type of account. And we have a withdraw method that looks like we pass an amount. If the amount is less than or equal to the balance, we delete the balance or withdraw the balance and return true, indicating that the withdrawal worked. If the amount is too large, we're going to return false, meaning that we would be overdrawn if that happened.

So that would be our savings account. Now notice that the savings account also extends the account. So we have an account. So if we looked at the Account class, we would see that the Account class also has a deposit and has a withdraw method, as well as a getDescription, so blah, blah, blah, and has two abstract methods.

So notice that the abstract is the withdraw method and the getDescription. So apparently, we want to create a new class called CheckingAccount. And our checking account is going to extend Account.

And notice that as soon as I extend it, it's saying, CheckingAccount is not abstract and does not override abstract method getDescription in Account. So that's one way to let it know. But before we do that, I'm going to go ahead and create a private final variable called overDraftLimit. And as you can see, this is complaining that we don't have a default constructor that creates a value for that.

So I guess that means that it's time to actually create that. So we'll create our constructor, pass in a balance, as well as overdraft, the overdraft limit. And in this case, we're going to pass the balance to the parent constructor. And we'll set the overdraft limit based on the local parameter.

All right, according to this, not only do we want that, but we also want a single constructor or a single argument constructor. So I'm going to go ahead and create that constructor with just a balance. And in this case, we also want-- OK, well according to this, it's not setting. So I'm going to set the-- blah, blah, blah, oh, it wants me to call the local one. And I'm just going to set the overdraft limit to 0.

Now, it's giving me an argument, because it needed to set the overdraft limit in every constructor, or it's going to give me an error. Now in addition, we want to override the methods that were before. So we can click on the light bulb up here.

So if I say, Implement all abstract methods, notice that it will go ahead and add the getDescription and the withdraw already. And at this point, it's also talking about an exception, because I haven't implemented this particular one yet.

So we're going to start with implementing the withdraw method first. And in the withdraw method, we want to do a simple if. So if the amount we want to withdraw is greater than the balance and the overdraft limit, we're going to go ahead and withdraw it. Otherwise, we're going to not allow the withdrawal and return false.

Now, as far as the description goes, it looks like we're not going work with the description at this point. So I'm just going to wait. Oh, I guess I do want a description. It's up there already.

So in this case, we're going to return a string that says that this is a checking account. All right, so at this point, we should have no problems. Because we have identified exactly what's here. So I'm going to go ahead and save it.

Now, in the AbstractBankingMain class, we are going to modify this to create checking accounts for our customers. So for instance, in this case, we've got an account. We've got Cooper. And so with our bank, we're going to add a customer, in this case, Jane Simms. And we'll get customer, and we want the second one that we just created, get the account.

And we're going to start with a balance of $200 with it looks like an overdraft amount of $400. It looks like we're also going to be creating a lot of other ones. So let's do that, try out our different constructors. All right, so in this case, we want a new checking account. So I guess we can pass that account in. It's nice if you spell.

All right, so if check account dot withdraw. And then finally, all right, so in this case, it looks like we've added a number of customers to our bank. We've shown that we can also add an account to a customer if we need to. And we're going to check the withdraw method on Maria, which should not be able to work.

So when we run this, we won't see this. But we will see the different customers that we've created. So it looks like we have our current balance is $500, $1060, $200, $200, $200, and $100, which is what we were supposed to have. Of course, we'd want to format this better. But that is in the report class. So basically, that is the finish of activity 5.1.

## 3. Practice 5-2: Implementing Inner Class as a Helper Class - 7m

In Practice 5-2, we're going to go to the second project. And in this case we're going to create an inner class to our Employee class. So I'll go ahead and include Employee. Now notice that Employee already exists, and has our constructor, et cetera, already in it.

We're going to go ahead and create an inner class called BenefitsHelper. And so it says just inside. So all right, fine. Just inside looks like right there. So we're going to go ahead and create. Let's see declare two variables, so private final double bonus rate. And private final double--

So apparently I am supposed to create a private class in here. So we'll do that first. Private class, BenefitsHelper. And that will be the end of my private class. And now inside of the private class, we will have a protected method that returns a double. And we're going to call it calcBonus.

And we're also going to calculate withholding. And so in this method, we'll return that. And we will create an instance of this class. Now notice that the internal class is instantiated exactly as if it were in a separate file itself. So in this case, we'll do this.

And so once again, we'll get the calcBonus, and pass it to salary. And so in this case, we can get the functionality of the inner class in the outer class. And if we create a main method-- so if we create the main method and we create an employee, Jane, and we also create an employee, John, we can say that Jane's withholding-- and notice that I can get the withholding, and the same thing with John's bonus.

And so if we go ahead and test this, we should see that Jane's withholding is 4,550, and John's bonus is 1,100. And sounds appropriate. And that concludes activity 5-2.

## 4. Practice 5-3: Using Java Enumerations - 11m

In practice 5-3, our bank is growing. And so, we need to be able to identify for our customers what branch they belong to. Prior to this, we haven't had that problem, but now we need to be able to distinguish.

And so, in order to make sure that that happens correctly we're going to create an enumeration to identify the different branches that are possible for our bank. And so, we'll first of all bring up the ENUM Banking 5-3 Practice and expand the directories. And at this point, we can run the project. Now we could run the project.

And at this point, we can see that our customer report identifies the name of our customers and whether they have checking or savings account and what their current balance is. So that's what we had as of the previous activity. But in this case, we want to create an enumeration.

So I'm going to right click on here and I'm going to say New. But you'll notice that there's no ENUM that is Here. So far we've got Java classes. So we can go ahead and click on Other.

And if we click on Java, we'll see that there is a Java ENUM file type. So I'm going to go ahead and say let's call this ENUM branch. And we want this in the com.example package, so that looks good.

So we're going to go ahead and click on Finish. So I now have my branch. And I'm going to create one that has a number of branches. So we'll talk about LA, and Boston, and what else do we have? Bangalore and Mumbai.

All right, so what do we have? Constructor branch, an ENUM branch cannot be applied to given types, required no arguments. Yeah, well we'll work on that in a second.

So the next step we want to do, of course, is we want to identify some parts to this. So first of all, we're going to create a string called Service Level. And we are also going to create a Constructor, which is what it's complaining about, so private branch, and which we will identify service level. And then finally, we also want to get access to the service level, so we'll create a method get service level, which allows us to return the service level.

So at this point, we now have an enumeration with four different branches. We've identified a way that we can get to the information, the description. And we've also built our appropriate constructor.

So now, we want to change our customer class. So if we go into the Customer in our existing Constructor, we're going to add a third argument. And that's going to be our enumeration. And it looks like we want to also set up a private field to take that information. And we will set that in the Constructor as well.

We're going to also access the branch. So I'm going to go ahead and insert a getter and setter for branch. Probably be nice if these were actually a little lower in the class, but other than that, we're good. That means go farther. Yeah, it's good where it is.

Anyway, so we have created the getters and setters. And so now, we want to also modify our bank, so our customer is good. But notice that our bank, now, has a problem because its Constructor is slightly different.

So in this case, we will add a branch. Oops, we will add a branch here. And once we have done that, we are going to enter Add Customer. And then we will add the branch in as well, so our customers will have that.

But now our customer report class needs to be modified slightly because we do want to output additional information. So we've identified our customer, last name, first name. Branch, customer, helps if you get the right one. There we go.

All right, so we are going to add the branch. And we also want to add the service level. Where were we?

And we get the service level and output that as part of our customer's name. But we still have a slight problem because in our main method, now, we are not passing the appropriate information in. So let's go ahead and add that.

So in the case of Will Smith, our third one will be of type branch.boston. And Bradley here is going to be branch.boston. OK, apparently this one is LA. Let's see, Jane was branch.mumbai. Owen, guess Owen's in Bangalore. Tim is in LA. And Maria is apparently in Bangalore.

All right, there we go. So we have now updated our customer list to accept our new branch. And we should be able to run this without any issues.

And so, just like before, we are able to see not only our customer, but the branch and its service level as well as the savings and checking account information, which concludes practice 5-3.

## 5. Skill Check: Using Abstract and Nested Classes - Score 80% or higher to pass

Skill Check: Using Abstract and Nested Classes

View Skill Check
