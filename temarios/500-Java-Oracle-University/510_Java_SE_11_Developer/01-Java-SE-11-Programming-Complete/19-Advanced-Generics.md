# 19: Advanced Generics

1. Advanced Generics, Part 1 9m
2. Advanced Generics, Part 2 20m

## 1. Advanced Generics, Part 1 9m

Let's take a look at advanced generics. In this lesson, we're looking at how Generics technically function. The main course body contained information about generics. We use them. We apply them to collections API, to streams, to various places.

But there are some interesting mechanisms behind the generics that you really probably want to be aware of, although you might not have to use them on sort of a regular daily basis, because they're fairly advanced. But it's still beneficial to understand some of the mechanics. There also are some generic constructs that we didn't really use at all, and they are called generics wildcards. So we'll have to discover, in this lesson, what the wildcards are and why would you want to use them at all. Because we kind of seem to get away without using them so far, so hmm. And that is because they're considered to be fairly advanced features.

Anyway, first of all, how generics are actually handled in Java-- you need to realize that, up until a certain point in time, the Java language didn't have generics. They merged, well, much later than the original Java release. So they were kind of added to the language. But prior to the existence of generics, well, what did Java do when the generics were not there?

Well, it was just storing objects. So if you wanted to describe some kind of wrapper for a value, without describing specifically what that value type is, you can always describe it as just an object. So the old style Java APIs, prior to the introduction of generics, were simply declaring that, a method accepts an object, a method returns an object, a variable is type of object. And that sort of means that, well, you can put anything you like there.

What generics do, they actually put a restriction on top of it. They say, OK, well, you don't have to say what it is, what that variable type parameter, return value type is right now when you create that class. But when you will use it, you will have to say what the type is. That's what generics are doing.

So when you create this class Some, and you say, oh, I would like it to use generics, actual real Java code that will be created by compiler apparently won't use generics. The generated code will simply use type object. And that is because that code needs to be backward compatible to the time when Java didn't have any generics in the first place.

So then you wonder, OK, well, how then they work, if that is really the generated code? Hmm. When you use that generic class, with a class that describes generics here, you use an integrated variable, and you say, this is the variable s and its type of sum. And you're restricting the generics to be type of string. What happens then is the Java compiler creates the code that actually casts the type of return value here to be string.

So the internal implementation behind the object is just to return an object. That Some just returns object. But when you say it should be string, the compiler will basically automatically cast the type to be string for you. You don't write that casting. That casting is done for you. Is this casting safe? Yes, it is, because the Java compiler will ensure you cannot possibly do anything else here.

If you say that this restriction is imposed, that some object should use a string, then Java compiler will make sure you don't do anything that's [INAUDIBLE] string. So you won't be able here to describe a variable as an integer, for example. Because the compiler will say, no, you said string. So I'll cast a string. And I'll rest assure that that variable is a string, not anything else. So though the underlying object is actually just storing a generic object and manipulating with generic object, the way compiler validates your code is that it validates it taking the generics into the consideration.

Now this process of removing the generics information from the compiled code is called erasure. We're erasing the information about the generics that we've coded. And once again, that's done in a fairly graceful way, to be graceful to the older Java code, to be backward compatible.

But also, the compiler will introduce automatic type castings, so you don't really feel like that is the real compile code. You don't really feel that, do you? You use generics and everything feels consistent, because the generated code automatically adopts the casting for you.

Now, generic and raw type compatibility-- so if I use here, I describe a class Some, which implements a particular interface, and I'm saying, oh, well, I'm conditioning now with generics, this is my actual source code, then I will create a method here which will use that-- well, the UnaryOperator describes the method apply. I'm overriding the method apply. And I'm using the generic that I qualified, which is string.

The actual generated code from this class, if you compile it and then you decompile it back to the source, this is what it will look like. Apparently, it will have that method that you just described. Yes, it will, of course. But it will also have a method, which is a complete equivalent of the method which is using generics, but which is using objects. And that other method will do the typecasting, basically.

Why is this method present? For backward compatibility reasons. So it will still work in the situations where you're dealing with a code that is not using generics, because legacy Java code is not. This is called bridge or synthetic method. And it's basically just created by compiler. And it bridges the gap between your code that is generics aware, and potential code that's generics unaware, which just deals with an object type, rather than a specified qualified generics type.

Now, you don't really feel it when you use that code. You just say, OK, I'd like that Some to be storing a string, and then just call the method apply. And whatever you need to do with that Some object, it feels completely natural when you're using this code. You don't really notice that behind the scenes there is this alternative version of the method that's also present. But it makes the code work in situations when you're facing the older code, which is generics unaware.

## 2. Advanced Generics, Part 2 20m

Now, generics and the type hierarchy, I think you remember that from what we were talking about during the course. That when you describe arrays, you can't really use generics. Arrays always use specific types. So you're saying, this is an array of products, the specific type.

However, what you can do with this array of products, when you initialize it, you could say, equals new food array. Oh, that's interesting. Is food a subtype of product? Well, yes, it is.

But you see, the problem is that although technically speaking an array of food is considered to be compatible with the concept of array of products, the issue could arise if you tried to add a drink to it. From a perspective of the variable products, adding a drink should be fine, because the variable product says, well, it's a products type. But then we know that drink does not extend food. They both extend product, all right, but they don't extend each other.

Their siblings, and you cannot cast siblings across the class hierarchy branches. Drink cannot be casted to food. So when you're writing this line of code, say, in products at position 0 equals new drink, you end up with exception, a Java lang array store exception, and compiler can't really help you with that.

Compiler, looking at this code, can't really say is this line of code correct or not. You will get an exception at runtime, but you won't get that code not compiled. From compiler point of view, yes, you can assign drink to a product array. The fact that actually it is referring to just foods is not obvious to the compiler.

So this is a logical flaw that you may run into. And this flaw is caused by the arrays being what we call covariant. Covariant basically means that an array of subtype is considered to be assignable to a variable declared as array of a super type. That's what covariant means.

What about collection API? Collections are designed to use generics. Unlike arrays, collections use generics. And generics are invariant.

From a perspective of generics, an array list of foods is not compatible with lists of products. So you cannot do this assignment. The compiler will prevent you from doing that.

The compiler says, a list of subtype is not the same as a list of supertype. So there you go. The compiler will basically, with lists, with collections API, will prevent you from running into the problem which you can run into when you're using arrays, because generics are invariant. OK, great.

So that's interesting. So you don't end up with a runtime exception. The compiler prevents you from writing this code in first place.

However, compiler checks are applied to generics. They cannot be applied to the raw type. So if I say, OK, I have a list of foods, and I assign an array, list of food, which is perfectly fine. I'm matching the type on the left- and right-hand side. That's completely fine.

Actually, I don't even have to repeat that that's a real list of food's here on the right-hand side. Because I could just put greater or less than size, and it is implicitly considered to be the list of foods anyway. So the generics information from left-hand side is implicitly copied to the right-hand side, which makes perfect sense if you think about it, because they are invariant. They're supposed to be of the same type. They are invariant.

So anyway, you're creating this array list, and it's an array list of foods. But then what you do is that you assign it to the list which is not using generics. This list is of a raw type.

So at that stage, the compiler says, OK, I no longer know what that type is. This could be anything. That list of values could potentially be anything. The generics are not applied, so invariant check is not applied anymore.

So that means when you then say, OK, I'll take the values array list and assign it to the list of products. And you just sort of did exactly what you did in the first example with array. Because what you're essentially doing is assigning an array list of foods to the list of products, which is what the compiler was preventing in the first place.

So by sticking this list object, which is not using generics, in the middle, you're creating a situation which confuses the compiler, and compiler will allow that assignment to be made. However, however, when the compiler allows this line, when the compiler says, yes, you can take that list which is not used in generics and assign it to list which is used in generics, compiler gives you a warning. It will tell you that you're doing something wrong.

It says, I can't validate it. I don't know if the way you're assigning this list is correct or not, because you just cleared out the generic type. You just did that. But the compiler tells you that he did that, and it's potentially unsafe. So you'll get a warning.

And the compiler will not be able to prevent you from adding a drink to that list of products, which will obviously contradict the actual object which is supposed to store only foods. So you'll still get runtime exception here, and you'll get it not at the point when you're adding a drink, you will get at the point when you're getting it. Because when you'll get values from that array list, the method get assumes you're getting food, because that array list has been declared as just food. So that's when you get the class cast exception, at this line of code.

But what I'm trying to tell you is that you only get this class cast exception if you choose to ignore the warning that a compiler will give you, that you're doing it in an unsafe way. So that's a reasonably smart compromise. The compiler will say, OK, there is a circumstance where you may wish to assign a raw type for whatever mysterious reason, but the compiler will tell you, highly advisable not to do it. Don't ignore compiler warnings, and you'll be fine.

Now, there is another possibility. So we've figured out that arrays are covariant, generics are invariant, and seemingly that's that. Well, you can also do something which is called wildcard generics.

And the way that works is that you can apply the wildcard, the wildcard with this question mark syntax to generics. So let's just discuss three possible scenarios. The first scenario, generics are not applied. So I've got a list, and I assign array list, and I'm not using generics.

Fine. That's fine. I can do that.

Now, what can I safely store into that list? I can store anything I like, absolutely anything I like. But what is considered to be safe? Object, right, object class, because everything else that's stored in that list, instances of object, will not cause any confusion. But anything else I stored in that list can potentially cause confusion, because, well, you don't know what's inside.

You have to do the instance object. You have to see what are you actually getting from the list, because there are no restrictions applied. It's a bit like saying, I have an array list, and I allow it to store just objects there, which basically means you might as well not use generics at all, because you didn't put any restrictions.

Everything in Java is an object. So that's essentially unrestricted scenario, when you didn't use generics. You use an object as generic is as good as not using generics at all.

Now, when specific type is applied, this collection behaves like an invariant collection. It's assumed that it can only store products or descendants of the product. So you can put their foods and drinks, but generally, this is anything that's compatible with the type that you declared. And you cannot store anything else but products, which is fine.

But then you can also do this. You can say, I have a list of question mark. So that you assign to that list of products. Presumably, you've already added some contents to that list of products, presumably, which is not on this page. But suppose you added some products.

Now, this is what will happen. Because you used a question mark here, it will be treated as unknown type-- well, seemingly. Question mark means you don't know what it is, right?

But you see, the thing is, that in Java, there is no such thing as unknown type. Everything in Java must have a type. You can't just have a variable with no type.

So as a result, this list will be read-only. You will not be able to add anything to that list. It effectively turns collection into read-only mode. Because from the perspective of Java runtime, this will be like, what do you add to it? No value except-- OK, null can be added to that collection, fair enough. Because null is of no type.

But no other values can possibly be added, because all other values will be of some type, and that list will be incompatible with absolutely any type in the world. However, whatever you've added to the list of products prior to that point will still be in that list. So that's an interesting behavior, isn't it? A fairly advanced topic, I would agree-- not something that you will use everyday, but a possibility.

And what's interesting, this is what we call a covariant assignment. Essentially, we're saying, I've got a specific type product, which is my list of products, and I assign it to a type which is less specific than that. Wasn't it just like the array? When you had an array of foods assigned to array of products, wasn't that covariant? Oh, yes, it was.

But you see, with arrays, you were able to add elements. They were not read-only. And that is precisely what caused the array to fail when you were adding something not compatible to the type that that array is.

With collections, with generics, if you're trying to do covariant generic, which is precisely what that line of code is doing, the generics are immediately treating this whole object as read-only object. So the entire premise of why covariant was dangerous is actually resolved. It was dangerous, because you can assign something to it that is not of compatible type. And you just made it read-only, so you cannot possibly assign to it anything that is not of a compatible type.

That is kind of the rationale. Why would you do this strange wildcard thing? Anyway, so let's take this wildcard a little further. We can specify upper and lower boundaries for the wildcard.

Wildcard upper boundary looks like this, question mark extends type. And what it allows you to do, it actually turns your code into covariant code. So if you just declare a list of products, for example, that's invariant. You cannot assign a list of foods or a list of drinks to the list of products, which is fine.

This is normal, writable behavior. That is the behavior you use so far throughout the entire course. If you, however, do this question mark extends product syntax, then you would be able to assign a list of drinks or a list of foods to such list, which is question mark products. A list of foods and list of drinks cannot be assigned to list of products, but list of food and list of drinks can be assigned to question mark extends product list.

That acts as a covariant, exactly as an array did, but it turns that object into read-only mode. That's what will happen. So the reason why it was dangerous to do it with arrays is removed in this scenario. You are actually allowed to assign a list of drinks or a list of foods to the list of products if you qualify the upper bound wildcard, which immediately will turn that list of products read-only, removing the actual mammary corruption potential from it.

The next example is a lower bound wildcard. It looks like this, question mark super of type. So once again, a reminder, the normal list of foods is invariant. So that's that.

But what if you create a list of foods which is like this, question mark super food? Then what you'll be able to do is assigned to that list question mark super food a list of objects, a list of products, or a list to foods. What you won't be able to do is assign a list of drinks, because drink doesn't extend food, right? It's not a parent of food.

So you would be able to assign the list of foods and any parents of that. This is called a contra-variant behavior. And the interesting thing is that this collection is writable. You can write to it. You can add things to it.

The call variant behavior is read-only The contra-variant behavior is writable. You would be able to add content to that collection, and it allows you to assign a more generic type to a more specific type essentially, in a way.

Now, that may be a little tricky to understand. So there is a page here that basically summarized what we just learned, and maybe it will become a little bit more clear when you look at that summary. So the normal behavior of a generic is invariant when you say, this is a list of specific type. And that's all there is to it.

And this is what you've been doing throughout the whole course. And that's the normal read/write generic scenario, and that's what you do 90% of the time. If you want to create a situation when you want to write information to a collection in a type safe fashion, and then you can do the contra-variant writable generics-- question mark super of certain type. Anything that's super class of food, anything that's super class of drink, will be acceptable in this situation.

And the other way around, if you want to be able to present a more specific type collection in a more generic way, like collection of foods presented as collection of products, for example, well, you could do that, but it will have to be turned read-only. So you have to use covariant behavior, which is question mark extends a scenario. The documentation that describes these approaches qualifies the covariant example describes it as consumer, which is a little bit odd.

You're writing to a collection. Why is it called consumer? And then the example that describes covariant behavior, the official documentation addresses that as producer. Well, that's because it's written from perspective of collection itself.

So is collection a consumer of values? Or is collection a producer of values? Which is a little bit counterintuitive when you read the documentation, because you tend to think about your code being produced or a consumer. No, it's the collection being produced or a consumer of data.

So you're adding things to the collection, it's writable. Or you're reading things from a collection is read-only. So that allows you to play a little bit around the class hierarchy and make generics work in a way a little bit like arrays with covariant style, and actually, generally, respect the class hierarchy. But as I say, this is very advanced stuff.

Most of the time, you just use normal invariant read/write generics, and that's that. So most the time, you're not really concerned with these other types. But just in case, if you encounter them, you would know what they mean.

And lastly, categorically avoid using raw types. You will start getting these unsafe operations. You'll potentially get heap pollution problems with raw types. So just avoid them altogether. They're still there for backward compatibility reasons, but that doesn't mean you should use them.

So this is a fairly advanced chapter. It talks about the generics erasure, which is the underpinning mechanism, how the generics are actually implemented. And then we were discussing generics with wildcards, these covariant, invariant, or contra-variant behaviors.
