# 18: Java Security

1. Java Security, Part 1 15m
2. Java  Security, Part 2 15m

## 1. Java Security, Part 1 15m

Let's take a look at Java Security. In this particular lesson, we're looking at the way in which we consider what are the security threats, how do we apply various security restrictions and policies, protect the code, validate values, protect sensitive information, prevent injections, and just generally document and discover what are the security problems that we may encounter in our application. Let's start with sort of general overview of what the threats could be, right?

So you could have different types of problems related to security. These could be denial of service attacks caused by situations when an attacker tries to overwhelm your application by utilizing lots of resources, basically, like bombard you with connections and these sort of things; sensitive data leaks, where maybe the application lacks appropriate level of encryption or information reduction; code corruption-- you know, if your application isn't careful about encapsulation or immutability, which allows you to sort of corrupt information; and code injections, where lack of the input validation may cause an attempt to force through kind of regular parameterization of the application-- force through that injections of an actual executable code that can then be exploiting and attacking your system. So I guess you need to be careful about validating whatever input you're receiving, right?-- to prevent that from happening.

Well, let's just take a look at some of these points and see how we can address them better. First, denial of service attack-- you may have a situation when somebody is trying to invoke your application and utilize the resources of the application without actually trying to gain any particular tangible functionality out of it. It's simply doing it for the purpose of taking as many resources as they can so your application eventually runs out of resources and crashes, I guess. Yeah, that's kind of the whole notion of denial of service attack-- to make it unavailable to legitimate users, to make our application unavailable to those who are really supposed to use it properly. So excessive resource consumption is the mechanism that this particular attack thrives on.

So what do we need to do? I guess, figure out where these limited resources are and how we can guard them so they could be used to actually carry out legitimate work. Causes of the denial of service attack could be overwhelming your system with bogus connections, or maybe providing excessive sets of information, excessive sizes of files, or you know, grow enough data that is too large for your application to handle. To prevent a denial of service attack, consider restricting access to the code that consumes resources, especially those that are scarce resources, with permissions. Don't allow just anybody to use these resources. Also, validate whatever input you receive to make sure if somebody doesn't send you bogus input or excessively big input. Just discard such requests, I guess.

And also don't forget to ensure that if your application allocates a resource, then it releases the resource as soon as possible. So don't hold onto resources for too long. If you don't need a resource, just release it. Make sure it can be utilized by other concurrent users of the application, freed up for others to use. However, all that said, you have to be mindful that there will always be inventive attackers who will find new ways of exploiting your system. So none of these measures on its own, per se, really address the issue. You have to also monitor your resource consumption. You have to monitor the application utilization to detect that such an attack is happening.

Frankly, that's true about any security concern. To think that, oh, you can write an application and protect it with all sorts of measures so it will be completely bulletproof is a little bit naive. I guess what your mindset should be-- should you should consider the fact that sooner or later, somebody will break whatever defenses you built. It's the matter of determination. So you should consider not just protecting the application as such, but also detecting potential attacks.

And without monitoring, that's not really possible. You have to be mindful about how your application runs day to day, keep track of your resource utilization, see if there are any kind of unusual patterns in which application is used, unusual attempts to exploit it, I guess, yeah? So you can tell that from the way the application is running, from the way it is utilized day to day.

You can have statistics about a normal application behavior, and then you can see if there are any abnormalities so could be, you know, proactive about it. You would know that something is going on, and then you would be able to investigate the cause of the problem, maybe disconnect particular attackers, block them, or maybe address a security vulnerability within your code. Without monitoring, you won't be able to tell that something went wrong.

Anyway, so one of the measures you can take to protect your code and limit the access to restricted resources is by introduction of security policies. So there is this configuration that you could use-- security configuration, Java Security-- which basically describes what policies would you like to have. And you can store policies in different files. There's like a standard Java home conf Security Policy File, but then you can put other files, you know, in your class path, I guess, or just in a configuration of your system with additional policies that you may wish to define, so just create your extra policies.

So here's an example of what sort of things you can do in policies. Assuming your application is packed into particular .jar files, so it's codeBase and it says, well, there is this .jar file. You can describe how this jar file is signed, so you can actually use here digital signatures. I know I'm doing something funny here. I'm just doing Jane and John, but presumably, you put proper digital signatures in place, yeah? And then you describe permissions.

You're saying code in that application, in that jar-- classes in that jar-- are permitted to utilize certain resources. So you're permitted to listen on a particular socket, you're permitted to read or write to a particular folder, but nowhere else or no other socket. So you specifically restrict the code to do certain actions, right? OK, so that's your policies.

Now, there is a quite an extensive online document that describes the security policies in much more detail, way beyond this course's scope, so obviously I would encourage you to look at that resource. But from perspective of this course, you just need to know that, OK, this is how policies are formed. You can then reference documentation for more detail, but the principle is demonstrated right here.

So once policies are defined, what next do you do? Well, there is a class called Permission-- Java Security Permission. And it allows you to actually control the application of policies, right? So there are various types of permissions, and there are some examples-- file permission, read and write and date in a folder, socket permission, access in a particular socket. So you can kind of see how that relates to the policy file, yeah?

OK, so what do you could do is that you can create an access controller-- use an access controller class-- to check such permissions. Anywhere in your code, you could say, should that code be allowed to do this or the other action? So the allowance is what you describe in the policy file. That's what you said in the policy. That's what the previous page was talking about. And now you're saying, let me try to do it. Am I allowed to do it?

If you're not, then you will get access control exception. So this check method can basically validate it and throw the exception, if you you're not allowed to do the set actions, via policy files, if the restrictions are placed by policies in a way that prevents you from executing that code. Now, the doPrivileged method of the access controller allows you to specify privilege actions. Privilege action-- you describe what you want to do in it, method run, you may return value as a result of executing privileged action. And inside here, you write in code that requires permissions, basically. This is kind of privilege code.

So for example, you try to access that path to write some files, read some files. And remember, that path was mentioned in the policies as a restrictive resource, right? So basically, the idea is that when you get to the privileged block-- so whatever you do inside this code-- that would be something that you are allowed to do. This is the code that has a certain elevated level of privilege. Outside of the block of code, you're not supposed to touch that folder. In that block of code, yes, you can. So that's kind of the idea. You isolate the code that requires special access to that privileged action.

OK. Now, a little bit more about general sort of considerations regarding security or resources. When you deal with IO operations-- for example, accessing file system-- consider that a use of relative paths. Although it's technically completely legitimate, can be dangerous because somebody may plant objects on a file system in a way that causes you to be diverted to a different part of the file system. So when you use a relative path, when your path does not start from the root of the file system, the new path is constructed from whichever current location.

By planting things like links in a file system, you can be diverted to a different part of the file system. So this is known as direct route reversal attack, and to prevent it, you can really do two things. First, while you are faced with a relative path you can normalize it, turn it into the absolute path, so remove the redundant elements. And second, you can convert it to real path, i.e. validate, if it actually physically exists.

And there is an option when you call the method toRealPath, to traverse or not to traverse symbolic links. So if you like to disable symbolic links, you cannot be diverted down a symbolic link route. When you convert a real path, you just need to say so, yeah? It's simply a parameter in the method.

In terms of denial of service attacks, well, you need to consider that there might be an attempt to make a program process too much data. They may take too long. So if somebody gives you a file of excessive size, maybe worth verifying what is the size of the file before you start reading or writing it, yeah? Maybe you want to detect if your IO operation takes too long, so excessive use.

And I guess just terminate the operations that take too long or don't process files are too big, or define timeouts and just say, well, give it a try. You know, spend some time doing things, and if it takes too long, abandon the action. So that all is designed to release resource as soon as possible, and if you detect that it takes too long to manage some kind of resource action, well, just don't do it, I guess.

Also, when you serializing and deserializing, remember that deserialization essentially bypasses the entire normal validation of data. You are loading data from external place directly into your heap memory. Is that dangerous? Oh, yes. Oh, yes it is, because you're bypassing normal set methods, you're bypassing the constructor. So if that external file, for example file-- you were loading the data from has been corrupted, or somebody specifically constructed a particular data state there, which theoretically an attacker can do, when you deserialize the data, it goes directly into your heap, and that could be rather dangerous.

## 2. Java  Security, Part 2 15m

Now, best practices for protecting the code-- enforce encapsulation. Consider using Java Platform Module System, because that could be used to specifically forbid reflection. So that you cannot dynamically introspect objects and bypass encapsulation.

And also, when you encapsulate data, use restrictive permissions as restrictive as possible. So consider that all of your variables need to be private and methods not necessarily need to be public. Maybe some methods are to have only package visibility or be protected. So you make these decisions.

Also, make your objects as immutable as possible. Again, that prevents a whole host of problems related to possible memory corruptions. Because if the memories are mutable, well, then you can't corrupt it, because you can't write to it, right?

You can always clone the object and create a replica if you need any changes. So you can modify something as another object. But if you retain the original object in an intact state, well, obviously then it can't be corrupted.

Do not break subclass assumptions when you're inheriting the code. So when you have a parent class and it describes some behaviors, when you extend it and you start overriding methods, if you do something in the overridden method that compromises the concept of the parent class, that contradicts the logic of what the parent class is doing, well, you're creating a problem here. Consider forbidding overriding certain methods or extending certain classes. And also, beware that if somebody adds another method to the superclass-- so I've extended a certain class, I inherit all the methods it defines-- if somebody adds another method to that parent, my class, which extends it, will actually inherit that method.

Is that what I want? Because at a time when I created my class and I was extending that parent, that method wasn't there. Is that possible that what I inherit contradicts my class design?

Well, the worst case scenario, yeah, it is possible. So, again, be careful with the class hierarchy. Maybe, instead of extending classes, consider doing interface implementations instead, where possible, or using the composition pardon instead of inheritance pardon. That, again, is probably a good idea from that point of view.

If your class is not supposed to be extended, just make sure it's final, and so is methods. Non-final, non-private classes and methods can be maliciously overridden by the attacker. If you can extend something, then you can override the methods. And thus, you can change the behaviors in the unpredicted way.

Also, consider factory method, which can hide the actual way in which constructor works. So you can then restrict access to constructors in the first place. And don't invoke overridable methods from constructors, because, again, that would affect the way the object is constructed. It is a potential way of attacking your code by overriding a method, and then if that is invoked from the constructor, then obviously what will happen is a different behavior will be called. So you have to be mindful about that.

Protect byte code against tampering and dangerous behaviors. Well, there are some command line parameters which disable byte code verification. Don't disable it. It's as simple as that. They're not enabled by default. So don't do it.

Consider using value guards. For example, to look if you are running out over capacity of a certain type, like minimum/maximum type values, or if you're doing an operation and you're doing something like an infinite number, or you get not a number maybe, or divisions by 0, or you reference an object and it's not initialized now, so consider using an optional class that prevents you from just falling over with exception. So you can check if the values you are using are properly initialized, or if the values you're using do not exceed certain types, or you're not doing incorrect mathematical operations.

Protecting sensitive data-- you can scramble your data using a MessageDigest approach. So this is the code example that just takes, for example, I don't know, a credit card number or something and just scrambles that value. Consider also cleaning the memory as soon as possible. So dereferencing objects that you don't need, especially if they contain sensitive data.

Do not log the sensitive information. If your exception handler contains information about an error and that information contains a credit card number, well, guess where it will end up in? In a log file. So that's a data leak-- probably best to avoid that to prevent the data leaks and potential identity theft.

This page tells you how you can actually encrypt and decrypt values. Now, what this example does is that it generates the secret key on the fly. I guess what you could do instead is precreate a secret key and store it in SSL wallet. So you could actually precreate keys. But in this particular case, we're just doing it on the fly.

So we have this secret key. You can use different algorithms. On this particular case, I'm using an AES algorithm.

And then I create a cipher, which is AES/GCM/NoPadding cipher. And what I want to do is, first, encrypt something. So with that key, I turn encryption on. I have some data, the text, for example, get a byte, a rate, which is basically converting the text to bytes, and then I'm performing the encryption.

Decryption, the other way around. You specify in your cipher a decryption mode, and then with the same key, obviously, same key, you're decrypting your value. You're doing the decryption.

So as I say, the key in this particular example is just generated on the fly, but really probably could be loaded from the file. As for all of these different encryption algorithm names, there's quite a lot of them. So there is a document, again, available where all of these different standard names are described. So you can read what they are and what they are doing. There are really, really lots of them, so I wouldn't be able to go over them for you.

But this is a realistic example of reasonably good security. Well, actually, yeah, this is considered to be reasonably good. So that's encryption and decryption.

Now, a few words about injections. In the lesson that is dedicated to the Java Database Connectivity protocol, to the JDC, I've mentioned that a simple statement, which isn't prepared, but just basic statement, allows you to concatenate parameters. And here's the problem.

If you concatenate the parameter into the statement and parameter happens to contain an actual SQL statement as part of the value, well, you're in trouble. Because if you just concatenated a name, it will be compiled as part of the statement execution and will actually be executed. So the user can literally type that into the field and that will be executed against your database.

Guess what it's doing? Dropping your table. Well, yeah.

Prepared statements avoid the problem. Or on a basic statement, there is another method. It's called enquoteLiteral, and it allows you to sanitize the parameter value, so preventing the injection. Consider using Java persistence API and BeanValidations APIs that can also do it for you.

They provide great automation on top of the base of JDC. And they're covered in another course, which is called Developing Applications for the Java EE 7 Platform. So I highly recommend that you look into that as well.

Apart from SQL injections, you may have all sorts of other types of injections. I know the JavaScript has nothing to do with Java. Yeah, it's a completely different programming language. By quite often, JavaScript programs that run within maybe Klein browser can interact with server side Java programs. And you don't want a JavaScript program to go haywire, because that's typically what represents your server side Java within a client tier, right?

So, again, there is a problem with the JavaScript, that your user can basically inject a piece of JavaScript code dynamically by just supplying it has a value in a field. And there is a possibility that when you're grabbing that value, if you're not careful about it, then you may execute that actual JavaScript code. The problem could get particularly acute if your service side program is also using Java, like Node.js, for example. So it's recommended to sanitize parameters.

And there is an open source library called OWASP. That's an open source library, and it contains code that allows you to look at the parameter and sanitize it to prevent any code injections, to basically reject them, to cast them aside, saying, well, these are not supposed to be the parameter value. Again, I'll reference you to some other courses for the further information about JavaScript and just general interactions between client and server side-- web interactions between client and server side programs.

XML injections? Mm, maybe your program deals with XML files. Here's a classic example injection attack.

You could describe a document type definition XML file, which describes entities x and y. And the entity x says it includes y, and then entity y says it includes x. You just created an indefinite loop that will drive an XML parser up the wall, because it will just try to make sense out of these two entities for eternity. One includes the other, the other includes the one.

Again, to prevent that from happening, there's a feature in the XML parser in Java, which is called Secure Processing. Consider enabling the feature, and again, some open source libraries, such as OWASP, can address that as well through the parameter sanitization. So they validate your parameter values basically.

Well, these are some examples that may represent typical types of attacks on your code, various injections, SQL injections, JavaScript, XML, but there are others. That's just examples really. Well, what I suggest you should be doing really is testing your software trying to actually-- trying to attack it, trying to break it.

There's security penetration testing. It's like a whole topic of its own with an explicit goal to actually try to break the software and see what will happen. And if you manage to do it, document what you managed to achieve, which attack has succeeded, and then decide how you mitigate that attack. What do you need to do about it?

And remember, in addition to that, monitor your actual production application, because there will always be situations which you'd never thought of. There will be some new inventions in the world of security attacks. People may try to exploit various bugs that you may not know of at a time when you created a program that may surface later. There might be other circumstances that change around your system.

So this is an ongoing process. This is something that you have to be constantly mindful, and constantly document, and address the issues as they emerge. Well, I suppose that is it.

So in this particular lesson, we looked at general ways of applying security restrictions to code using policies, protecting the code, validating values, protecting sensitive information for scrambling and encryption, preventing code injections, and just general approach to how you manage security of your application.
