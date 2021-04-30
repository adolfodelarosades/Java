# 5. Modularity

1. Modularity - New - 16m
2. Modularity (Part 2) - New - 9m
3. Modularity (Part 3) - New - 7m

## 1. Modularity - New - 16m

In this lesson, we are going to discuss modularity. The JDK before SE9 was huge and monolithic. Of course, this resulted in the download time that takes a long time, the startup time, the memory footprint. It takes a long space to save the whole JDK. Then we got into the modular JDK that was created under the Jigsaw project.

Starting Java SE9, that monolithic JDK was broken into 90 modules. Every module is well defined piece of functionality. Similar packages and frameworks are grouped into their own modules, for example, the logging, the swing, instrumentation, and so forth. And be aware of modules for significant APIs, not trivial ones.

The benefits include applications which are more scalable to small devices, improved application performance, improved security and maintainability for Java and your applications. So that was a big, big plus. In this slide, we list the different modules that exist in JDK 9. And you can do the same thing, by the way, for JDK 11 and up. Same concept, java --list-modules, and will give you the list of the modules.

Java SE modules. These modules are classified in a couple of categories, standard modules that basically start with Java, a prefix for module names. They're part of the Java specification. For example, the Java.sql for database connectivity, or java.xml for xml processing, or java.logging for logging, and so forth.

And you have the modules not defined in the Java SE platform. Those start with the prefix JDK. They are specific to the JDK example, jdk.jshell, jdk.policytool, jdk.httpserver, and so forth. So here's an example question, which two modules are found in Java?

So if you take a look here, you will see that the java.base is one of them. And the java.desktop, which basically, in this case, represents, also, the desktop API, which is the AWT and the swing API. So hopefully, you heard of jshell. And jshell has a prefix JDK, not Java. And so b, this would be a likely answer because an ee is understood as a collection of APIs, then its module would have to start with Java.

The java.base, yes, this is a extremely important module. It contains the most significant and commonly used APIs. The logging would be some sort of functionality, so that should have a prefix as java, not JDK. And the last one, which is the java.desktop, this would be the module that defines functionality that you expect on your desktop application that includes the AWT and the suite API and so forth. OK, so in this case, the two ones that we see here, the java.base and the java.desktop.

What's inside a module? Well, a module is a set of exported packages and concealed packages. And the java.base module is the foundation module for all other modules similar to the java.lang class in the previous JDKs. And, of course, in blue, you have the packages inside the java.base, which is the java.lang, .io, .net, .util, and so forth.

And you read, you have what we call the packages that are internal to the module and are meant to be used by code inside the module and not by code outside the module. These are conceived packages. And the public is no longer the public that we know in Java SE8. Before starting Java SE9, public is either public to everyone, or public but only to a specific module, or public only within a module, and so forth.

So you see that public has changed. And that's actually the advantage that you have now in starting Java SE9 and up. Protected package and private are still the same concept.

Every module has this file called module-info, which basically exists at the root, in this case, at the root level. And declaration being with the keyword module followed by a unique module name and a module body enclosed in braces. So you see all of that.

And add directives such as like requires, and exports. We see that soon in the next few slides. This specifies accessibility between modules and so forth, what packages the module makes available to other modules, where a package is exported to, what outside modules it's dependent on and so forth. And the way you write that module, here's an example, module, modulename, and then between curly braces. And over there, you can write requires, exports, and so forth, users, and so forth.

Creating a modular project. You can create a modular [INAUDIBLE] Again, you got the name of a project, you got the place of the module-info.java, in this case, which is in the root directory of the packages that you want to group as a module. NetBeans makes it available in the default package.

And one modular JAR file is produced for every single module. We'll see an example about that later. Modular JARs become the unit of a release and reuse, and they're intended to contain a very specific set of functionality. So here, on the right side showed you, we took a snapshot of how these modules are created inside on the NetBeans ID.

So let's take a look at the keyword exports. The exports Module Directive. It basically declares a package is accessible to a code in all other modules. It includes, in this case, access to package's public classes, fields, and methods. And excludes access to anything with a private, protected, or package access.

So use the export statement judiciously because you need to be careful. You'll never be certain how someone else want to use your module. Export only those packages that you feel are safe, and you export them only to whichever module you want to export to.

Modularity is about future-proofing. And modularity actually increases security by a tremendous amount in this case, and that's why we like it. You can use exports to. This declares a package that is accessible to code in a specific module. It includes access to package's public classes, fields, and methods, and exclude access to anything with private, protected, or package access. It excludes access from any module not specified.

So use this specific exports-- dot, dot, dot-- in this case, to. And, in this case, it specifies the comma-separated modules that you want to export your package to. For example, in this case, we have module A that exports package A to module B and C. So which means only B and C can see the public methods of the package A.

How about that requires module directive? This declares the module dependent on another module. And only exported packages are readable by the requiring module. Packages that are not exported, they are not readable. And anything non-public is not readable even from exported packages. Be careful with that.

So classes within the current module may require a class, instance, or method written in another module. Here's how we write it. So here we have module B, and we say that module B requires A, which means whatever A exports to B, B can see it, especially public. In this case, only public. But private, protected, and package will not be seen.

Let's see an example. Here's a very good example, where here we have module A that contains package A that has a class A that has a public variable, yearPublic, and it has a protected variable. Year is protected. It has a package variable, yearPackage, and it had a private variable, yearPrivate.

And then we have another module that has package B. And we import package A from class A just because on the left side, we have module A export package A, and then we made B requires A. But you need to remember to import that class that you want to access. And then here, we show you in the class NewMain, in the main method, we create an instance of class A, and as you see here, you can access the public variable here, public, no problem. But you cannot access the protected, the package, and the private just because they're not public.

Here's another one. This requires transitive, another directive that also you need to understand. So transitivity allows readability up the requirement chain. Anything requiring the current module has access to packages exported by the current module. And packages exported by anything, the current module requires transitivity. So this is known as implied readability.

So here we see an example where we have a module B requires A, and module A requires C transitively and exports package A to B. And then module C exports package C, in this case, to, of course, in this case, A. So although B does not explicitly require classes, rather, or although module B does not explicitly require the module C, classes within this module can still read transitively, and that allows for readability up to the requirement chain, which means you now have module B can, in this case, access to the package C, just because A requires transitively C.

Here's an example where we show you here we have module C that exports package C. Module A requires transitively C and exports package A to B. And module B requires A. And we have the module C, you have package C. And in module A, we have package B that import class A and class B. And then, as you see here, although B does not explicitly require C, classes within this module can still read and transitively allows the readability up to the requirement chain.

So as you see here, we go ahead and access the yearPublic of, in this case, of the class A and, of course, the transitive variable, that transitiveVAR as you see here. And just because B requires A, and A requires C transitively, so that automatically allows me to read, in this case, the public classes in C in the package that it's, of course, exporting.

Let's take a look a little bit at the module, in this case, java.base. The base module exports all of the platform's core packages. Every module depends on the java.base. java.base does not depend on any other module. And don't forget that the java.base module reference is implicitly included in all other modules.

So, for example, we show you an example where, in this case, we have the module java.base that has the exports [INAUDIBLE] java.lang, java.io, java.net, java.util. So in your module A, you can write requires java.base, or you don't have to. That's implied automatically. So that's optional.

So, in summary, we tell you that just by looking at the summary of keywords, the export, in this case, package, declares which package is eligible to be read. The export package to a module declares which package is eligible to be read by a specific module. We have the requires module that specifies another module to be read from.

And the requires transitive module, which specifies another module to read from. The relationship is transitive, where indirect access is given to modules requiring the current module. Of course, there are restricted keywords, and their creation won't break existing code, and they are only available in the context of your java-module class.

## 2. Modularity (Part 2) - New - 9m

Let's take a look at this quiz. Given a module called codeHaus, it exports package A, exports package B to module 1, exports package C to module 1 and module 2. And then we have a module, and then we have the missing code that we need to insert. So the question they have for us here is, what can be inserted in modOne module-info to allow the access intended from a codeHaus module-info? Is it, A, requires pkgB, pkgC, B pkgA, pkgB, pkgC, C requires module modTwo, or D requirees codeHaus.

Well, option A and B here, they want you to think. The challenge of the question is knowing if you should specify which module to export a package to. They want you to think that B is the correct, because without exporting to a specific module, a package is exported to all modules, including one. Well, that's not true. So it creates a false sense of security. The requires directive needs you to specify a module and not a package. So that's why when you look at all of this, you will see that the answer here would be, or the correct answer would be D, requires codeHaus.

Compiling a module-- you can specify all the java sources from various packages and include packages that are exported by this module to other modules, the location of the JARs for automatic modules, and a module info file. And the syntax is javac -d, the compiled output folder, and then the list of source code file paths, including module-info. Here's an example where you have javac -d mods --module-source-path src and then, of course, $ find src -name, and then all the java classes.

Running a module. And here, we show you the syntax from a command line, how to run the module, by using --module-path, and specify the path to the compiled module. Then --module, specify the module name, and the package name, and the class.

We show you an example-- java -p mode -m hello, and then /com.greeting.Main. That's the class. To execute a modular application, don't use CLASSPATH. Don't forget about that.

So this is just showing you how to run a module from the command line, module application. Here are a few command-line tools. jshell is also very interesting. jshell launches a REPL-style coding terminal. It's great for small code experiments and testing and unfamiliar APIs. It's not on the exam, by the way, but it's very, very handy, and we highly advise you to use it.

jlink allows you to create a custom runtime image and includes only the components needed to run as an application, and it excludes everything else. This is very useful to create your own custom JVM with your application. That's kind of nice. You can deploy. It's very useful for small devices and custom applications.

Jdeps launches a class dependency analyzer. For example, one module points to another. It requires A, and then A arrow B, and so forth. Let's see an example.

So in this example, we examine these module JAR files and their module-info java files. So we have order.jar file that has a module order that requires product and exports com.oracle.order, and we have the product.jar that has a module product that exports com.oracle.product. So the question that they have for us here is, what is the result of executing the command jdeps -s order.jar [? file ?] space or product.jar?

So here, instead of going through each option, let's instead examine how they are written and what makes them challenging. So let's take a look at A. So we have the dependency of here, order depends on base, order on product, and product on base.

And if you take a look at B, java.base depends on product, java.base on order, and product A depends on order. So A and B are kind of similar. The challenge between these two is remembering which way the requirements [INAUDIBLE] go. They should go from one module to the module it requires. Remember that.

So looking at B and C, all the [INAUDIBLE] A depends on product, and product depends on order, OK? And if you take a look at F, we have order. It depends on a base, and product depends on java.base.

So in this case, there's a challenge with B and C versus F. Again, these want you to remember that if java.base is printed or omitted-- if it's, in this case, implicit-- java.base is not omitted, even if you don't print it. So you show E now-- let's take a look at E. E, we have order depends on product and product depends on order. Obviously, this definitely shows a cyclic dependency where modules depend on each other. This is not allowed. So E, no question, it's not that.

So now what's left is between A and F. A and F offer an unfair challenge depending on how the rest of the code is written. Either one could be true. Questions should avoid situations like this. So we don't know if, really, A is the answer, or B the answer.

And to be able to actually, in this case, get the right answer between A and F, it might be a good idea to revise the question and add more information. So the idea here is we should provide more information to be able to, in this case, make a decision. So we added here, in addition to the module order that we've seen and the module product that we've seen before, we now gave-- given this, in this case of the class, that in this case, given the package order and inside, we import the product class. And then, as you see here, in the main method, we create an instance of the product class.

So obviously, here, we know for sure that, in this case, there is more information that tells us that, in this case, order it depends on, in this case, product. So that's why, if we go back and revise the question-- here's the revised question-- you see that we got rid, in this case, of the option F.

So here, we are more precise with the language and remove the ambiguous options. And now, this, obviously, will show us a much, much better question where we can actually find the solution, in this case, quite easily by looking at option A. And as you see here, we also got rid of that option F that creates confusion.

And that's why it is quite important to always look at a writing the right, in this case, a question, and that has-- and also giving more information to be able to actually, in this case, examine the right answer about using jdeps.

## 3. Modularity (Part 3) - New - 7m

Well, let's see an example now about modules. We're going to see an example of a module project. This module project that I already created is called Team Game Manager. And as you see here, it has a 1, 2, 3, 4, 5, 6, 7 modules.

So in the first one, basketball module, the module-info.java, as you see here. It has requires competition module, requires java.login, opens basketball to jackson.databind library, and provides a game provider service through the implementation class called a BasketballProvider. And so that's about the basketball.

Then we have the next one, which is the competition. It has also a module-info.java where, in this case, it exports game package, gameapi, and util and uses the GameProvider and uses the terminal type. These are two interfaces. And then, of course, these packages contain the different classes.

And then another module called knockout, and this also has a module-info that requires computation and provides tournament type interface with the implementation knockout class, which basically [INAUDIBLE] Here's the knockout class that basically implements the interface. And then the league module, it also have a module-info.java, requires competition, and provides terminal type with the league, which means there is a class here, league, that implements that interface.

Then we have another module called main. This module has also a module-info.java, a file. And this module main requires the login, Java login. The competition module that requires the display.ascii and, of course, requires a storage.

Then we have a soccer module that has a module-info.java file that requires competition, requires logging, export soccer to competition, open soccer to a jackson.databind. That's for, by the way, for a Java Reflection access. We need basically to access a-- because we don't have that. So now, Java Reflection is not allowed anymore, so we open now modules to a particular module by accessing the runtime classes.

And then we have provides. That provides the GameProvider with the class SoccerProvider, which means there is a so-called provider class here that implements that interface. Here it is.

And then the last module is called storage. And this module has a module-info.jave that requires jackson.annotations, requires jackson.core, jackson.databind, and requires competition transitivity and exports storage. So as you see here, every module has its own module-info.java.

Now, what we do is when we compile this, Clean and Build [INAUDIBLE] as you see here, when you do this, what's going to happen is it is going to a compile, in this case, the project. And it's going to create a JAR file for every single module. So if I now click on the File tab and go to, in this case, the team because we were working with these team game managers.

Let's go back and look for the team game manager. And if you click on that and open, in this case, the distribution file, we see that every module now is put in its own jar file. It's jarred in its own jar file, and so which means you can use only the jar file that you need for your application.

The one that you don't need, you don't have to add it. This is something that we cannot do with the Java SE 8 and before. Here's an example of a Java SE 8 example where if you want to build this, OK, this is called artificial [INAUDIBLE] neural net. It's just a project where I implemented the neural net in Java using streams.

And you find now, look at, go back to the file, Tab and Open it, and you will see that, in this case, it will be all in only one job file. OK, only one job file, and that's it, as you see here. And on the other hand, if you look at the module project, the one that we were looking at earlier, you will see that every single module is jarred in its own jar file or zipped in its own jar file. That's the advantage that you have with the module system.
