# 16: Annotations

1. Annotations, Part 1 14m
2. Annotations, Part 2 16m

## 1. Annotations, Part 1 14m

Let's take a look at annotations. We need to look at what the annotations are, try to understand how they function, create custom annotations, dynamically discover annotations, and study frequently used Java annotations. So let's start with just general introduction to what annotations are.

Apparently they are a form of metadata. What we could do is provide information about the program which isn't per se part of the program itself. When you describe an annotation, you may say where it's supposed to be applied, where is it retained. Obviously, you write it into the source code of the program.

But is that annotation retained after you compile the code? Is that annotations retained at runtime? Well, that depends.

Some annotations don't go beyond the source code. They're just discarded by the compiler. Or you may actually retain annotation in a compiled code, but don't ask Java Virtual Machine to do anything about it. Or eventually, you could have annotations that you actually want to dynamically read at runtime and discover what they are. So that's retention policy.

Then an annotation also has a target-- where it's supposed to be applied to. For example, if you say the annotation is applied to a TYPE, that means it's applied to a class or an interface. Or you may say, oh, the annotation is to be applied to a method.

Or is it to be applied to the field, or variables, or parameters. It's up to you. So you may decide one or more target where this annotation is actually applicable to.

So that's basically the syntax of the custom annotation creation. You create, well, what looks like an interface, yeah? It says here, Interface. But there's an @ sign, which actually turns it into the annotation. OK, so you form the annotation definition. You think about where it should be retained, or which targets it should be applied to.

Now, how do you actually use it? So you described it all right. But what do you do with that?

Well, annotation can actually have various attributes. So here's an example of a pair of custom annotations. They're just something you could design. These are not any kind of standard annotations that come as part of Java Development Kit APIs. No, that's just custom stuff.

So imagine you decided you need some kind of metadata information that describes your application business policies. Whatever the business policies, I'm not quite sure, but it doesn't matter. Just an example really.

So imagine you need these annotations. So what kind of metadata we could describe? Suppose we would like to have an ability to apply one or more BusinessPolicy to some class maybe, all right? To a class.

So we say, OK, the Target for annotation will be TYPE because you want to apply it to the class. And that would be called, let's say, BusinessPolicies annotation. And it references an array of BusinessPolicy, which is another annotation.

Here it is, yeah-- BusinessPolicy. So that means that I can kind of group annotations together. I can describe a number of policies. I'm also saying that I would like to retain this annotation at runtime, which basically means later on, when I apply this annotation to some class and I run my application, I would be able to actually discover these annotations, would they apply to a given type, to a given class at a later stage. So as you can see, you could describe various attributes inside the annotation. The first example here is the attribute that's basically type of another annotation.

What else you could use? You could use primitives, you could use String. So here's some examples of strings, enums. So you could describe various attributes of these types.

So this BusinessPolicy annotation has an attribute name, type of String. And you actually set a default value for it. So that means if you don't set up the policy name, then, well, you'll have a policy called "default policy."

You then create another attribute. You call it countries. And that's an array of strings. And then a value, which, presumably, is the actual text of whatever that business policy is supposed to be. So this is your custom design, just whatever structure of metadata you would like to provide.

Now, once you defined the annotations, you then decide to apply them somewhere. OK, so this is my class Shop. It's just the class, right? So I can apply various annotations.

Presumably, the annotations say that they're applicable to the TYPE. So that's why I can put them on a class level. Otherwise, they could be on a method level, on a variable level, depending on which type they apply to. And BusinessPolicies annotation allows me to describe one or more BusinessPolicy. So I can put them inside the BusinessPolicies annotation.

Each BusinessPolicy can have a name property; countries, which actually could be a list, an array of countries; and a value, which is any text you want. The name is optional. So if you don't give a name, then the default value would be "default policy."

So I describe here a couple of business policies. One is called "Returns Policy." And it's valid in GB, Great Britain. And the value is "4 weeks," whatever.

The other policy doesn't have a name. So the default name is "default policy." It's valid in Britain and France. And the value is "Ship via Dover-Calais." So this is just some metadata that I decided to apply to the Shop. When I run the class Shop, and I inquire what are these values of the annotations-- we'll see how to do that dynamically in a moment-- well, I'll be able to find out that metadata information.

Well, suppose-- if you think about it, you could use this to augment maybe different packaging or deployments of the application, or kind of tie the application to specific circumstances where it's supposed to be deployed to. Or how it's supposed to run in a certain environment maybe. So it's not part of your application code per se. But it certainly can provide this metadata description of the code.

Usually, annotations are just applied to where you apply them to, and that's that. But if you have a class hierarchy, you may mark annotations as Inherited. So then it will be applied to subclasses as well. Otherwise, that's just applied to the immediate type where you've specified it.

OK, now dynamically discovered annotations-- well, how to do that? You take your class, and you call the operation getAnnotations-- so Shop.class.getAnnotations. That will give you the annotations that were retained at the runtime level. Because-- we've talked about it. If you say, for example-- if you created the annotation that is only retained in the source code, then, of course, at runtime, you won't be able to get it, right?

You can make a stream out of these annotations. And then you can iterate through that stream and find out what your annotations are. You can look for a specific annotation.

You can get annotation's type. You can find out what it is. And you can query the annotation of certain type-- getAnnotationsByType. So it returns all BusinessPolicy annotations, for example.

I suppose you could just iterate through this array of BusinessPolicies and just find out what the names, and values, and any other properties are, like custom property called countries, whatever it is. And the countries is an array, so I can iterate again. And that's how you can dynamically discover what your annotations are and which values they provide right in a code of your application.

OK, now, if you place an annotation on your class, or method, or variable, it is not by default reflected in the documentation. If you want the fact that you applied an annotation to your code to be reflected in the documentation, then the annotation definition itself has to have a Documented property. Documented annotation needs to be applied to it. And then, if you generate Javadoc, then you would see that certain annotation is applied.

So in this particular example, class Some has annotations X and Y applied to it. But annotation Y doesn't say that it should be Documented. And X does say that.

So if you run Javadoc to document this particular class Some-- it's in the package demos, whatever. So you're documenting that. And then the documentation will generate only the reference to the annotation X but not the annotation Y, well, because you decided not to document it. So you're not obliged to actually include it in the documentation.

Now let's take a look at some annotations that are already present in the Java core API. So Java SE has some annotations already defined. And here are some typical examples.

The first one is FunctionalInterface. This is a typical example of an annotation that is basically discarded from the actual runtime. But it's used to validate your design, validate the source code of your interface.

When you describe an interface, you may describe an interface with more than one abstract method, in which case, it shouldn't be considered a functional interface. Because the whole point of the functional interface is to describe single abstract method. If your interface has just one abstract method, then it is suitable to be implemented as [? lambda ?] expressions. We consider that a functional interface.

Do you have to write @FunctionalInterface on such an interface? Actually, you don't. If you have one abstract method, it is a functional interface, even if you don't say so. That's by definition is a functional interface.

So why do you have this annotation then? Well, all it does is that it prevents the interface from compiling if you accidentally add more than one abstract method. So if you have one, that's fine. If you're having another one-- OK, if you have a FunctionalInterface mentioned, the compiler will say, sorry, that's wrong. You shouldn't have two abstract methods here. You can only have one. So it's simply a validation of a code.

Likewise, the Override annotation. That's another great example of a typical annotation from existing Java Development Kit's set of objects. And this one validates the code as well. And it validates that the method you describe in here-- public boolean equals, blah-blah-blah-- that such method actually exists in the parent class.

Now, here's a class Product here. What does it extend? Well, I hope you remember, it extends class Object implicitly. You're extending the class Object if you don't say which are the classes you're extending.

So if you override a method, that presumably overrides the method of an Object class. Does the Object class have a method with a following signature-- public boolean equals Product? Oh, no, it doesn't.

The Object class has a method which is public boolean equals Object, right? So obviously, you may accidentally think you override the method equals of the Object class. But because you've got a parameter wrong or a name, you made a typo somewhere, it's not exactly matching the version of this method that parent class actually defines.

If you don't put Override annotation, your code will still compile. It won't be the override of the method equals. So it will be just some other method you described. But the code will compile.

If you put Override annotation, the code won't compile because the compiler will say, well, you're pretending you override in here a parent class method. No, you're not. Because the parameter is wrong.

So you will be notified that you made an error, that you think you're overriding the method when you're actually not overriding the method, when you're just describing some other method. So both FunctionalInterface and Override are two examples of the annotations that simply validate your design. They make sure that what you're writing codewise is actually the intention, your intention.

## 2. Annotations, Part 2 16m

Well, there's some other typically used annotations. There's another one. That's called deprecated. And deprecated annotation allows you to designate a certain piece of code in your class as to be removed, as you're not supposed to use it anymore.

So there are kind of different phases of deprecation. First, you may say, as of certain version of Java, this operation's not advised. Don't use it. And then you can say, as of whatever next version, we'll just get rid of it. We'll remove it in the future. So you kind of give people a warning first, and then you say, for removal true, and that basically means you're going to get rid of it in the next release. So you have an intention to remove it.

Do you actually remove it in the next release is another question. You may still have that method. You don't have to remove that method, I guess. But you're kind of warning everybody that you have a full intention of getting rid of that in the future, so whoever uses this class should really stop using that method now and use some other alternative instead.

To that end, you can actually document that. You can document the deprecation as part of your documentation. So there's an annotation there as well which allows you to explain the reason why something is deprecated and maybe what alternative operation you should use instead. So if you're getting rid of this one, then what is the other one that you advise people should use instead? So that's basically the idea.

Now, next one, next annotation we'd like to look at is the annotation called suppress warnings. And there are two types of warnings you may suppress. That's called unchecked and deprecation warnings. Well, the deprecation warning is pretty obvious. Imagine you're calling a method in your program that's actually deprecated, so I'm calling this method safe.

Method safe is marked as deprecated. The compiler will tell you that you're doing that. When you compiled, it's this code. The compiler will say, that's very naughty of you to call a method that is deprecated. You're really advised not to do it.

You may choose to ignore the warning. It's just a warning. The compiler will still compile the code, but it will give you that warning anyway. So if you do suppress warnings, and you say, suppress deprecation warnings, well, be advised that that might not be a very wise move. You tell the compiler to shut up, basically, but the problem is still there. You're just telling me not to tell you about the problem, but it doesn't fix the problem. Anyway, well, you could do it, I guess.

The other warning, well, requires a little bit more of an explanation, this unchecked warning. It's a tricky one. It has to do with the way generics work in Java.

Look at the method find. It returns a list. It doesn't say it returns a list of products. Actually, physically, it may be the list of products. Food and drink presumably are subclasses of the products, so you probably could be fine. I don't know. That might be fine. So it is a list that actually contains products.

But you see the problem isn't that the class food doesn't say it's the list of products. The problem is that it doesn't say it's a list of products and you call it, and you assign it to the variable that does say it should be a list of products. So technically, because you stored only products in that list here, you actually find you call that method and it returns to that list, and the list is indeed containing only products.

But the problem is and a compiler can spot it. The compiler gives you the warning here. The problem is that technically, because inside the method find, you didn't say that it's a list of products. You just say a list, whatever. You didn't restrict it using generics. Because you didn't restrict it with the application of generics, that means that nothing technically stops you from putting into this list something that's not a product.

And then you're in trouble because you're call calling the method find and you're assigning the result of the invocation to the list that only expects products, and that's where you have a problem. So the compiler will give you the warning that you're doing something that you really shouldn't do. You should consider describing this list here with the same generic as the one you're using when [? you're ?] assign any to a variable.

So you shouldn't really use what we call a raw type without the description of generic. Hence you're getting this warning. But you may suppress it, and it kind of makes sense because you're looking at your code and saying, oh, no, no, I'm not actually adding anything that's not compatible to the product, so I'll be fine. But generally speaking, consider not using raw types. That's kind of a good advice, I guess. So remember, suppressing compiler warnings could be very dangerous because you may compile with suppressions, and then you would not be any wiser that you're doing something wrong in your code that may backfire later.

Now, this problem relates to what you've seen on a previous page, this unchecked warning. It's called a heap pollution, and it can occur-- actually, on a previous page there was a heap pollution as well. But it can occur in another circumstance when you use var-args.

Now let me just get one page back for a moment and explain what a heap pollution is. So here we're returning a list, and we're not saying that's a list of products. We're just saying it's a list of anything. So that means I can store there things that aren't products-- food, drink, and something else that's not a product. So that products variable being declared is type of product, list of products, thinks that it references the least which only contains products.

But in real heap memory, what you've actually added to the list, well, you added something that's not a product. That's called a heap pollution. There's a circumstance where you can place something into the heap memory that is not the type that some variable that refers to that thinks it is. So this products variable thinks it's only products there, but in fact, you've managed to circumvent your code by kind of fooling it into thinking that you're placing there products. But in fact, you're placing there potentially something else. And that is actually the cause for unchecked warning.

But the fix in this situation is really straightforward. Just declare these return type as list of products, exactly as the products variable, and you're done. You fixed the problem. Then the compiler will ensure you're not adding anything but products into that list.

So the heap pollution problem will be solved. You wouldn't get this unchecked warning. You can simply fix it by fixing the signature of this method find by returning not the raw type, but a parameterized type. So you're done. That's easily fixed.

However, what the next page tells us is that there is a situation which is not so easily fixed, and it's a very strange circumstance. Look at this signature here. What does the method some accept? It accept the list of strings? Not really. It accepts an array of lists of strings. Because of the triple dot, it means you are dealing here with a var-arg, and var-arg, essentially, is an array.

Can you store a list as an array / well, technically, you can. Array could store anything. You could put any objects in the array you want, including the list, sure.

But here's the thing arrays don't use generics. Collection API does, but arrays don't. Array is a collection of objects of a specific type. A collection can decide what the type is based on the parameterization that you supplied as generics definition, but array doesn't do that. Array just use a specific type.

Of course, you may create an array which is just an object array, in which case, what do you put inside? Anything. You can put whatever you like. Any object is compatible to the object. That includes the least, and that includes whatever you want. So such an array could contain absolutely any values.

But it does not impose a restriction, which values. So if you are using an array of objects as your type, then you could put anything inside which is not a list of strings. For example, if you uncomment this couple lines of code, you realize that nothing really stops you from putting there a list of integers, arrays as list. So you put in there as some element a list of integers.

But you see, your parameter kind of implies that it is a list of strings. So it's exact same problem in design which we know as heap pollution. Our variable says that a data is of a certain type. And yet, because of the quirk of the design of the language itself, we can circumvent it and we can place in a heap something that is not really matching the type that the variable seems to imply that we're using. We should be using an array that should contain lists of strings, but in fact, we can put anything we like into that array. Not that we should do it, but we can, technically.

So in this situation, although our program supplies is an argument a number of lists, a number of lists which contain strings-- this is the arguments we're getting-- what on Earth would stop you from doing something, well, pretty stupid, I guess, putting the list of integers together with these lists of strings into the same array? Well, technically, you can. You can just replace one of the items, and you could say, yeah, it was a list of A, B, C, but I'll put there a list of 1, 2, 3, which will not match the promised type any longer.

So this iterator will iterate in through that array, and you say, and get me every value as a list of strings. You'll basically get an exception. When we encounter that array of integers-- that list of integers-- and you try to convert it to list of strings, it will say, well, that doesn't match the type. That isn't string, that's an int. So you will get a class cast exception in this situation.

You won't get the class cast exception if you would not try to add a wrong type of list. Then everything is fine. So if you're using var-args with generics, this particular combination-- the var-arg, the triple dot, and something that uses generics together-- the compiler will give you this warning. The compiler will say, you are doing something that can potentially lead to the heap pollution. And then what you could do is that you can say, I promise I don't do something as stupid as adding there an incompatible type object.

So then you can say, OK, I know that it is a problem, but I promise I don't do anything like that. I don't do these two lines of code. They're commented out. So then you can annotate your method saying, OK, it's safe var-args. This annotation turns off the compiler warning because you're telling the compiler that you are aware of the problem, and you're not going to add to that particular values parameter something that's not a list of strings.

This is purely under your control. The compiler simply says that it can't really verify it for you because from perspective of the way in which the object arrays are defined, an addition of an incompatible object will be legal, will be valid. So that's why compiler can't really force you not to do that. But it can warn you that it cannot verify it.

So this is really smart design, in my opinion, where you are encouraged to code properly. And if you have a situation when a compiler can't really help you with that, the compiler honestly tells you, I can't help you here. You have to be careful about what are you adding to that list, to that array. And that-- hence you get a warning.

And then if you analyze your code and you say, OK, I'm sure I'm doing everything fine, you say, safe var-args. That's the annotation that will basically turn off the warning. Lovely.

So that is that for their annotations lesson, and hopefully, at the end of it, we have a sense of why we would use annotations to validate our design, to ensure that our code is consistently written, and that's how many of the existing JDK annotations function. But then you can just construct annotations on a whim, any metadata you want to associate with your program, just whatever you like. And you can dynamically discover what annotations are. If you retain them at runtime, of course, you can just interrogate your classes and discover these annotations.
