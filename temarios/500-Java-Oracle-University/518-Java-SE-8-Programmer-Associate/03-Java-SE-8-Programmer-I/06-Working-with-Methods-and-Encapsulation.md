# 6: Working with Methods and Encapsulation

1. Working with Methods and Encapsulation - 15m

## 1. Working with Methods and Encapsulation - 15m

Working with methods and encapsulation-- in this section, we're looking at the use of methods and the principle of encapsulation. And as you probably noticed, this particular page has occurred a whole course earlier. We've looked at it when we were talking about variables. We've mentioned there are access modifiers-- public, protected, default-- which is the absence of the access modifier-- and private access modifiers. So that's the scope of visibility of our variables.

And apparently in order to encapsulate information within our objects, we really need to make variables private. That's our kind of usual coding pattern. And then to access such variables, we can provide methods with a wider scope of visibility. Such as in this particular case, getName, setName. There are public methods. But the variable name itself is private, thus it's encapsulated, kind of hidden within the object, which is your Product.

Of course another important tip on accessing such encapsulated information-- it's not just having getter-setter methods, but maybe provisioning constructors through which such information can be efficiently initialized, such as this constructor of the Product object, which initializes the name.

Another repetition from the earlier part of this course, the page about passing parameters, that should be a reminder for you about how parameters are actually passed, that we're really passing objects as references. That's what we call p, the value of a reference. Whilst if we're passing a parameter which is the primitive, when actually copying the primitive itself. Thus if the object is accessed via the reference, it's the same object in a heap. Thus any modification done from within a method will be sort of visible to the caller operation.

But when a primitive is passed as an argument, you essentially end up with an independent copy of a value. As you probably noticed in the actual course and the exam, this particular information is needed to be able to answer questions in two different sections of the exam. So kind of make sure that you're happy with that concept.

Method overloading-- method can be overloaded in Java based on number of parameters or types of parameters. Now the important conditions to define a method as an overloading method is this. In a same class, you can have a number of methods with exactly same name, exactly same return data type, but different parameters. So different number of parameters or different types or both.

Please note that disclaimer about a different return type, which would not be allowed. See, in the first three examples, the resize method, they all have the same return types that are perfectly fine. But in this case, there is a clash. There is a resize method that accepts an int and is void, and then there is this resize method that also accepts an int and returns an int.

Ouch, well that's a problem. This is not going to work. It's not going to compile. So you will have a problem here because you're trying to overload a method with the same parameters but different return type. And that's not allowed in Java. So long as you have different parameters, you can get away with that obviously.

And one more interesting thing. These two methods that are called addExtras, they're overloaded-- a different number of parameters actually. But there's another interesting point here. Do you see this triple dot, product dot, dot, dot. This is called a vararg, a variable number of parameters. Essentially the vararg parameter internally, within the method, will act as an array. But whoever calls the method can just-- well actually they can pass the array as an argument. That will work. But they can just pass one Product object or a comma separated list of a number of Product objects. And you would not need to define a separate overloaded version of that method for, I don't know, two Products, three Products, four Products, one Product. No really, just say triple dot, and it will accept any number of Products as an argument in these cases.

Bear in mind however, the vararg parameter must be the last one in the parameter list of a method. So for example if you swap around that String description and that Product triple dot other Products, so if you swap them around, it's not going to compile. You have to have a vararg sequenced as a last argument. You will see that in a demonstration that I will show you in a moment.

One more thing that we need to remember about the principle of initializing the object is the way in which we use constructors. Now when you are creating an instance of some object, you call a constructor upon it. In fact what is happening is that you're not just invoking the constructor of this particular object. You're really calling a constructor upon its parent as well. See, the first thing that constructor of the product class is doing here, essentially calling a superclass constructor, super round bracket semicolon.

Now as a matter of fact, that means that the first thing your class needs to do when creating an instance of itself is initialize an instance of parent, which is Product extends Object. That will be an instance of Object.

Now the Object class has constructor with no parameters. So that's why when you call super no parameters, it just works. because the Object class has the constructor with no parameters already.

Moreover, if you don't put super round brackets with no parameters, if you don't put that line of code at all, well, the compiler will assume you need it. It's kind of placed there implicitly for you. So if you don't write that line at all, it's there implicitly. The first thing your constructor does is it calls a constructor upon a parent.

Of course you can write more than one constructor in your class. Like on the right hand side example here, you've got a constructor for Product accepting String name. And then you've got a constructor which is without any parameters that does some increment of id.

Now if you want to recycle the code of another constructor, you can actually call it. So one constructor can call another constructor in the same class. That's done with the line of code this, round brackets, semicolon. So that invokes another constructor.

What is it that you're doing there? You're just basically matching another constructor's signature. So from the constructor Product with a String, you call the constructor Product with no parameters. That's how it works. And then the constructor for Product with no parameters, first thing it calls superclass constructor, which is constructing the object. And then it proceeds to initialize in the remainder of the code. So that initialize the id. And eventually the last thing that happens in that sequence is that you will initialize the name.

And one more thing, immutability. Immutability is the case where you're trying to make the content of the object not modifiable after you've initialized it. So in this particular case, you create a Product, and you're making an id of the Product final. So you're not going to assign it again.

The funny thing about final keyword in Java is that final keyword, when applied to the variable, makes the variable constant. However, you don't need to initialize it immediately. Well of course you can. You can just say final variable equals value. Yes, sure, you can do that. But you can initialize the final variable later.

The idea is that if you've got a final instance variable like id, you may choose to initialize it through all of the constructors of that particular class. So each and every constructor must have a line initializing that id, or else you have to initialize it immediately. Because you said that once it's initialized, it cannot be modified.

Of course having a setter method in this code example is out of the question. You won't have a setter method. That's the idea.

Now as a matter of fact, you didn't really have to put the final keyword on the variable. Think about it this way. It's private, right? So nobody outside of the Product could possibly see it. It is initialized through the Product class constructor, so you're actually having that variable assigned once. You don't have a setter method. So from outside of the Product, you can't possibly change it, because the variable's private remember. And though there is a getter method that allows you to retrieve the variable value, but you won't be able to change it once it's initialization.

So that's the whole point of immutability, having the object that is once initialized, once created can then never be changed. There are lots of examples of immutable objects in Java. You know, String for example, that's a good case for immutability. Once you create a String, you can't possibly change it. Whatever operations you perform on a String will result in a new String, but they don't really change the original one. It stays the same. So that's the immutability principle.

Now let's take a look at a small demonstration. In this quick demo, we're looking here at the Product class-- name, price, setters, getters, kind of the usual stuff. What do I need to do to make it immutable? Just remove the setter methods, because it already has variables as private. It has a constructor initializing these variables. So if I just get rid of the set methods, that would kind of instantly make that particular Product immutable. So that's the idea.

And the other thing that I want us to note is the vararg method we're using on this side here. So some kind of method, let's say ordering some Products. It doesn't matter, doing something with them.

So there's a vararg method, which means we can pass any number of products to it. Internally, inside that block of code, you treat it as an array. You're stepping through the Products, getting every Product. Let me just draw in this code for you. So that will print us the Products we're ordering. We're ordering some tea and a cookie, important stuff.

And the other thing that we could do with this, of course, we can iterate through that collection sort of in a usual for loop using this integer i index. So the Products, really, that variable acts as an array. You've got a length there. You can step through it. It will be exactly the same result. Instead of enhanced for loop, we're using a normal for loop.

But it will not form in the array at that side. Don't get me wrong, you can. The vararg method will accept the array as an argument if you wanted to. You could have done Product array ps and put Product p1 and p2 as content there and have that ps Products array passed there. And it will work just the same as you can see. The whole point of a vararg method is that you don't really need to do it. You can simply pass the Products as a list.

But what happens if I just pass one parameter, one Product? Well you know what, it works equally well. You'll simply have an array of a single element. There's nothing wrong with that. That's a very small array, but hey, you can still do that.

There you go. That's a demonstration of the vararg methods, and really the illustration of principle of immutability.

Let's go back to the PowerPoint So that concludes this particular section. We looked at the access modifiers-- private, public, default, protected. We looked at methods having different number of parameters, overloaded methods, vararg parameters. We didn't discuss the static keyword all over again that has already been discussed, but it comes in frame in two different sections of the exam when a static keywords discussed in a section about variables. And it's also discussed in a section about instantiation of objects, that all instances share the same static content. You need to remember that.

Then we looked at constructors, how to call one constructor from another in the same class, so how to call the parent class constructor. So that's with this and super keywords. We learned about the idea of encapsulation, private variables, probably public methods around them, a reminder of what happens when we pass a parameter as an object or as a primitive, and the idea of immutability. Let's take a look at the next section.
