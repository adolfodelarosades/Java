# 3: Lesson 3: Creating a Java Main Class

1. Lesson 3: Creating a Java Main Class, Part 1 - 7m
2. Lesson 3: Creating a Java Main Class, Part 2 - 9m
3. Lesson 3: Creating a Java Main Class, Part 3 - 2m
4. Practices for Lesson 3 - 23m
5. Skill Check: Creating a Java Main Class - Score 80% or higher to pass

## 1. Lesson 3: Creating a Java Main Class, Part 1 - 7m

This is Lesson 3 on creating a main Java class. In this lesson, we'll finally start using the NetBeans IDE and start writing classes in Java. I'll show you how to write a main method, and I'll show you how to create output using system.out.println. And the topics we're going to start covering are Java classes, packages, and projects.

So a Java class is a building block of all Java applications. So say for instance we have a shopping cart class. Now, what kind of things would we expect from a shopping cart class? We'd expect it to allow customers to add items to the shopping cart. We would also expect to have some sort of visual feedback, maybe some other options.

If this was some sort of online catalog, maybe you'd want to have a buy option. You may want to be able to show the total, things like that. And so that all needs to be programmed, and where that's all organized is found in a class, in Java.

If you look at the structure of what a class looks like-- you can look at the example below-- you have your class name. And in this case, it's the Hello class. And by convention, this always starts with a capital letter. So here we have the capital H.

You will also notice that we have braces. All of the content of your class are going to be within these braces. So you need to have an opening brace and then the closing brace. And then, within the actual body of your class, you'll have fields and methods, and these are things that we'll go over later.

In Java, you also have what are called packages, and what a package is is that it provides a name space for your classes. It's a way to organize your classes, your code into folders. And this determines where they're going to be saved. And this is the package statement right here in your Java code.

You'll also notice that this ends with a semi-colon. This is actually a pretty important convention in Java, to end most lines with a semi-colon. We'll go over this a bit more later as well. You don't necessarily need to have a package in Java, but it's strongly recommended because it does help with organization.

We installed the NetBeans IDE earlier, and now we'll finally get a chance to use it. IDE stands for Integrated Development Environment, and it's a type of software that makes developing easier for Java applications and code in general. A couple of helpful features that NetBeans will provide is syntax checking. What that means is say you do forget a semi-colon. It's a very easy mistake to make. NetBeans will give you a little alert saying, hey, there's an error here. There's also other kinds of various automation features that are helpful, and it provides you an environment for testing a Java application.

I mentioned before that NetBeans enables you to organize your code and resources in the Java environment, and this is done as a project. So here in this diagram, we have our project and a ground game, and that's organized into different packages. So here we have one package. Here we have another package.

And within each package, we have Java files, .java. This is our source code here, Java file here, here, and here. And that little piece, that's just one piece of the NetBeans IDE. We call that the Project Navigator, where it shows you all the little components that you have within your project.

You could also have another project here as well. I'll call that my second project. And then you have packages in there as well with other little files, since this is where it's all organized.

Where you actually get to work with editing your code is here in this section. This is the Code Editor. This is where you actually type the stuff that you want. We have the Class Navigator, which just gives you a little overview or a breakdown of the structure of what you have in the Code Editor. And then finally, we have the Program Output. If you ever need to print anything like numbers or a little description, this is where you look. It'll also give you-- if your code creates an error message, you will also be able to find that message there in the output.

To go about creating a Java project, here are the steps you'll need. First, you just navigate to File, New Project. Select the Java application, category, name and set the location for the project. Select Create Main Class if you want this done automatically, which is here. In a coming up exercise, we actually don't want to do this, so you want to leave it unchecked, and then click Finish.

So that creates a project, but you still need to be able to add actual Java files, Java class files, or .java. Those are the kinds of files that you need to be able to add. So in order to do that, to add these to your project, first you go to File, New File. Then select Java Class as your option. Name the class, which is done here. Assign the package that you want, and then click Finish, which is somewhere down here.

So what I'll do next is I'll let you guys loose to do this on your own to set up your own project, but I'll also walk through how you can go about doing this-- just provide a little helpful reference, although in the future of these exercises, I'll let you guys do it on your own, but I thought if I did it now, it would be pretty helpful.

But also, before, we discussed submitting your work to a repository. For smaller exercises like this, you don't need to worry about that. It's only for larger ones that occur at the end of each lesson. Those are the ones that you need to do. So for now, just worry about NetBeans. Don't worry about the Git repository. Good luck.

## 2. Lesson 3: Creating a Java Main Class, Part 2 - 9m

By now, you should have successfully created a new Java project with the Java class inside of it. For future reference, if you need to know a couple of additional things like how to open an existing project, I've put a couple steps on the slide for you. So what you want to do for that is you select File, Open. Then navigate to the directory that contains your projects. Select the project file that you want in this case. We'll pick this one right here. And then you just click Open Project. It's fairly simple, pretty straightforward.

If you need to ever create a new package, here are the steps for that. You right click on your current project, and you select New Java Package. You name the package, and then click Finish. Yes, I wanted to include this [INAUDIBLE] here, because I thought it'd be helpful to have all these how-to steps and NetBeans all in the same place. And that does it for this topic. So I'm going to move on now to creating the main method.

The main method is a special method that the JVM recognizes as a starting point for every Java program, and any Java program that you write has to have a main method somewhere within it. And the syntax always looks the same. It's public static void main, string args, and your code goes here. You also need to make sure that your method has an opening brace and a closing brace. And another note to make mention of is you could also write-- you may find it written like this-- string. Then you have the brackets, and then args. That works. That's fine too. You could do it either way.

To look at the main method in the context within a class, that's what this slide is about. So you have our class declaration up here, public class Hello. And then you have the opening brace and the ending brace here. And those relate to the entire class. If you look here, you have the main method, which is being declared. You have the opening brace and the closing brace, and all the code for the main method is found within these braces.

If you take a closer look at what we have here in the main method, we have what are called comments. Comments aren't code. They're just commentary for yourself. If you need to remember what a little bit of code that you wrote does, or if you need to write a little message to your friends when they take a look at your code to help remind them what the code does or just give them any extra bits of information, maybe you want to comment out your code. If there's old code that you don't like, you want to see how your code runs with it removed, but you don't want to totally lose it, comments are very helpful for that.

The way you write a comment, there's a couple ways. Here you have //, and then you just write your commentary. And as soon as you press Enter and go to the next line, your comment ends. So if you want to write another line of comment, you have to do // again, and then write your comments. Another way to do comments is you have /*. Then you write your commentary. You write Enter, and you're still doing your commentary. Hit Enter again. You're still doing your commentary. The only way to end it is to do */. And then move on to writing your actual code. So all of your comments are going to be starting here, ending here.

And then finally, we have a line here, which shows your program output. This is what we call a print statement, and I'm going to go a little more into detail about print statements. So the syntax for a print statement is system.out.println. And then you have within a parentheses, this is where you write your message, and you have to provide a double quote. So you have double quote here to say you're going to start your output, double quote here to end it. And then here, you have a string of text.

We call this a string literal, and to help you remember why this is called a string, all it is is you have a bunch of characters, and you're stringing them together to make one long sentence, one long string of characters. Also, the one thing you've got to remember is, again, put a semicolon. This is one of the most common errors or mistakes in Java is to forget a semicolon, and it makes people often wonder, what is wrong with my code? Why won't it compile? And it's silly things like forgetting a semicolon that are often the cause.

But NetBeans, thankfully, will remind you or at least provide hints about what could be going on with your code. So for example here, here's a line here, line 14. We forgot to add a semicolon. If you put your mouse over this little icon here, it's an exclamation point icon. It'll give you more information. Here it's telling us that, hey, it expected a semicolon. NetBeans expected there to be a semicolon here, but there wasn't one. So thank you, NetBeans. That's very helpful. Missing semicolon-- that's one of the most common errors.

Another possible error you have-- unmatched braces. Any time you open a brace, you have to close it as well. One helpful trick with NetBeans is if you were to put your cursor, if you were to click right about here, it'll make this brace bold. It'll also make the matching brace bold below, so you can tell which closing brace matches the opening brace. That's a helpful way to give you more information.

It could be that you're missing quotation marks if you do end up running a string. You'll do quotation mark, blah, blah, blah, here's my string, semicolon, and then you start writing some code here. NetBeans is going to think that this is also a string, which you didn't intend it to be, so that'll end up goofing up your code. So just remember any time you start with a double quote, you've got to have an ending double quote as well.

And finally, unrecognized words-- if you end up spelling something wrong, then NetBeans will complain, because NetBeans is what's called case sensitive. If it's uppercase or lowercase, that matters a whole lot in NetBeans, so just be sure to check for things like that. After you've written your code, and there don't seem to be any errors, what you want to do is go ahead and save. And there's a couple ways to do it.

If you go to File, Save, that's one way, and that's equivalent to doing Java C. Java C is compiling, which we talked about in an earlier lesson. There's also a Save icon here, the little floppy disk. And then once that's done, you can go ahead and run your program. You do that by right click-- if you're on Windows-- you right click the project that you want, and then go to Run. You could also have the project that you want highlighted, and then you click the Run button right here in NetBeans. It looks like a Play button.

So now what I want you to do is we discussed creating a main method. I want you guys to write your own main method. I'm actually not going to demo this, because this is something that I think you guys would be really good at achieving on your own. So it's a challenge that any of you guys can do, and have fun. Good luck.

## 3. Lesson 3: Creating a Java Main Class, Part 3 - 2m

Now that you've completed the second practice of this lesson, your program will now have a main method in it. You've added that to the Shopping Cart class, and this makes your Shopping Cart class-- it could now be called a main class. Any class that has the main method in it is considered the main class.

So you've set up a class, you've added a main method to it, and you've added a print statement. So congratulations. You've been successful at implementing all the objectives we wanted you to in this lesson. You've used the NetBeans ID to create a Java class. You've written a main method, and you've created a print statement to add output.

So there's only one thing left to do for this lesson, and that's the final practice. So in this practice, what we want you to do is put your project into Git. Now I've mentioned before not to worry about Git, because those earlier practices, those are just meant to familiarize yourself with NetBeans, to build your confidence, and you'll find that the practices at the end of each lesson-- this one may actually be the exception-- but for the most part, these are written to be more open and to give you the opportunity to implement solutions that you feel are going to be best.

So in an earlier video, I had shown you how to commit a simple text file to Git. What I want you to do now is that you've completed your NetBeans project. Add this project to the Git repository, and then check it into Git. So we've given you all the information that you need to be able to complete this. Now you just need to go and do it. So good luck.

## 4. Practices for Lesson 3 - 23m

This is the first practice of lesson 3. So what I want you guys to do here is I'll demonstrate how to create a new project and a new Java class. So you still need to do this on your own, but I figured if I showed you guys how to do that, that'll be pretty helpful for you guys, help you get started.

So I'll go to my desktop, and I'll launch NetBeans. And I hope you're excited. This is the first time we're launching NetBeans. All right, so the first thing we need to do is I'll go to File and create a New Project. You could also click the New Product button right here.

So we want Java project, Java Application. Click Next. We're going to call our project Practice_03-1. And we actually don't want to create a main class in this case. Actually, I just want to remember where we have the location for right now. So click Finish. And here, we have our project. This is our project, Practice_03-1.

Now, I want to add a new Java class. So I'll right click on my project because I'm in Windows. I'll go to New and Java Class. I'll call this class ShoppingCart, also beginning with a capital S. And I'll say that I want our package to be practices, and then I'll click Finish. And here we are. We have our Java class ShoppingCart. It's inside of the practices folder. Excuse me. It's inside of the practices package. And that's inside of our overall project.

But let's say we've already created our project, and we want to open it. So let's say, OK. That practice, it's not there anymore. What do we do? How do we get it back? We'll go to Open Project. And look. This is why I wanted to make sure I understand where we were saving these products to because I had to navigate to the right folder. But yeah, here it is. Here's our project. And I'll just open that. And that is how you open an existing project.

If you ever need to add additional packages, for that, what you want to do is right click New Package. And we'll call this-- what should we call it? secondPackage, OK, and there's our secondPackage. And if we want to fill that up with new Java class files, we can do that too. [LAUGHS] And there's our other file. Excuse me. There's our other class.

So that's two steps of opening an existing project and adding a new package. You won't need that now in this lesson. But I thought it'd be helpful to show you, because it is something you'll need to know for future lessons. All right. That's it. Good luck.

This is Practice 3-2 on Creating a main Method. I hope you're giving this a try on your own, but if you've gotten stuck, I'll give you a little walk-through. So in this exercise, you manually enter the main method that prints the message to the console. So first, what you could either do is for step 1, continue editing the practice from before or open in the new practice. Once you have that up and going, in the Code Editor, step 2, add the main method to the ShoppingCart class.

Step 3, write the main method. Have it print out something along the lines of Welcome to the Shopping Cart. Then just save your program and run it. And you may also need to indicate what the main method is. And that's fine. I'll show you how to do that too.

So I'm going to decide to actually continue with the first practice. So let me just pull that up. OK. Here we are. And what we need to do is first create a main method. So I'm going to give that a try, public static void main(String [] args). And then we have our opening brace and our closing one.

Yeah, NetBeans automatically created our closing one right here. You can see that if I highlight the closing one, we also find opening one. This is good to see if there's, you know, any mismatches. For instance, if I were to get rid of this one, yes, see, NetBeans is going to complain here, reached the end of file while parsing. It's expecting another one, another little curly brace because there's nothing to align up with this one. And so, yeah, it turns red. Yeah, it's a common mistake just to forget about the curly braces. But NetBeans provides little hints to help us along the way.

OK, so the next thing we need to do is add a print statement. So I'll do system.out.println. And then in quotes we'll add "Welcome to the Shopping Cart." Let's give that a try. Oh, no main method found. It's saying there's no main class found. That's not right because this should be our main class.

And normally, you'd find it here in this list. So I've got to figure out what's going on. Actually, maybe I just forgot to save it. Let's give that a try. Yeah, OK. That was the problem. I forgot to save it. OK, so now, let's give it a try. There we go. Welcome to the Shopping Cart. That ends this practice.

This is Practice 3-3, Checking a Project into Git. This one is a bit more step-by-step, so I don't mind providing you a little walk-through, even if you haven't tried this one on your own. Basically, what we need to do here in this practice is copy the project that we've been playing with before with the print statement, and just check that into a Git repository. And there's a few other additional steps in this practice. And I'll walk you through those, as well.

So the first thing we actually need to do is to set up our initial Git repository. Oops. Oh, I have Git already open, but I'll show you how to get it. On Windows if you need to pull it up, you have to pull up Git Bash. There we go. So let's pull up Git Bash. And first thing we've got to do is set up our repository in the home directory. So let's type mkdir, make directory cloud.

OK, and so this folder here appeared, cloud. So that was successful. Let's keep going. Now, we have to change the directory to the cloud folder that we just created, change the directory in Git Bash, that is. So we type cd for change directory cloud. All right.

The next step that we have to do is actually create the Git repository. So I'll type git init. All right. And then you'll see this val here, which appeared in the cloud folder. And we here we have all this stuff here. This is, you know, like overhead, this metadata. It's the stuff that we're not all too interested in right now. That's OK. Let's keep going.

The cloud directory is now a Git repository right here. This is our Git repository. And this is where we're going to put the files that we want to be held in version control. To confirm that it is our Git repository, we type ls -a. OK. That's actually what we want to get in response. Yeah, and that's it for setting up the Git repository. It should be right here.

The next thing that we have to do, and this is something that we're recommending that you do. You don't necessarily have to. But that's to, before you commit your changes, configure Git to have your name and email address associated with your commits. So if you want to do that, the steps are-- let's see-- first, we'll type in git config --minus global user.name. What should our name be? [LAUGHS] Our name is Oracle. Let's type that in.

All right. And to set up the email address, type git config --global user.email. What's a good fake email I could do for this demo? email@address.com. Oh, I wrote congig instead of config. [LAUGHS] Thanks, Git. OK. Thanks for telling me that. config --global user.email email@address.com. What did I do wrong this time? Oh, I forgot to add Git at the beginning.

Actually, this is actually a good chance to show you guys a little shortcut. I don't want to have to retype all of that again. So if I hit the Up button on my keyboard, that gives me the last thing that I typed. So now, I'll just add git to the beginning. OK, looks like that worked.

So to confirm the values that we've entered, I'll type git config --global -l. Yeah, there we go. We have our username. That's Oracle or email address, email@address.com. If you ever do need to set the names for a particular project, instead of doing the entire thing-- global means we're sending it to everything. But if you just need to do it for a particular project, then you just omit the global.

All right, the next thing that we need to do is to take our NetBeans projects and put that into our Git repository. So I'm actually going to make a directory for that. So I'll type mkdir, make directory 03. All right. And then we see that appearing right here. I'm going to end up copying this project and putting it-- pasting it here into the folder we created.

All right, the next we need to do is open up this new project in NetBeans. So actually, let me pull up NetBeans. And this right here isn't it. This is the old one. So actually, let me close that. So now, I want to go File, Open Project, because it's actually in the new cloud directory we created. So I want to go-- let's see-- video, cloud, 03. There it is. There's the new practice.

And I want to rename this. So I'll right click, go to Rename. So instead of being Practice_03-1, I actually want to call it 03-03, and also rename the project folder. Rename, OK. So let me-- yeah, actually, I don't need this right here. But don't worry about that. Delete. Yes, just go away.

OK, so let's open up our ShoppingCart class. I want to make it a little different than before, just so we know that, you know, we have a different program we're working with. So what could I do to make it different? How about, "You are not welcome to the shopping cart." That's very different. [LAUGHS] Give that a shot. Let's run that. Yeah, OK. Then we have our different results here.

And I wanted to run that because you'll find that once you run it in NetBeans, you'll create a file that we actually care a lot about. And that file is-- yeah, that's the gitignore file. And I'll go over in just a bit what that means, why it's important, because the next thing that we have to do is set up the gitignore file.

So the reason why we have the gitignore file, if you take a look at this NetBeans product, you have a lot of-- there's a lot of stuff here. Like, here are some metadata things. OK, there's our byte code .class. What else do we have in here? Some stuff relating to our NetBeans project. Let's go to test. Well, that one's actually empty. If we go to source, practices, so this is the file that we actually want. This is what we really care about in version control.

This is our source code or the .java files. This is stuff we want to get backed up. The other stuff we don't care as much about. And the reason why is because a lot of it is meant to be auto-generated. In other words, the dot, the byte code, the .class, that should be created by NetBeans when it's compiling our code. So we don't really need to back that up. And so the purpose of the gitignore is to say what files we don't really care about, what files we don't want to get ignored-- sorry, what files we want to get ignored. And NetBeans auto-generated that for us.

So let's actually take a closer look at the gitignore file. To do that, well, first what I've got to do is change back to the cloud directory. To do that, to go back one directory, you type cd, change directory, and then two dots, dot dot. OK, so now we're back here, and we're looking at the cloud folder, which has gitignore.

So let's see. Next thing we have to do is enter git add -n dot. OK, what was I thinking? I actually do need to-- I was in the right directory after all, cd cloud. OK, and then I'm actually going to hit Up twice. Ha ha. That gives me the [INAUDIBLE] I want. I don't have to re-type it. All right.

So what this actually does is this gives us a list of all the stuff that would be added in a commit. Adding the -n, what this does is it performs a dry run instead. So what you're seeing here is what would be added, but it's not actually being added yet. And you'll also notice that yes, we do have the gitignore, so that's good.

So let's check to see what's actually being ignored then. So to do that, now, I want to do cd dot dot and back it out of this directory. And then I want to type in cat .gitignore. No, ah, why'd I do that? I don't want to change directories, cd cloud. Well, at least, I hope you guys are becoming very familiar with how to change directories now. I keep goofing that up.

All right, so let's try this again, cat gitignore. OK. There we go. That's all the stuff that's going to be ignored. OK, now, we can finally go about committing our changes to Git. So the first we've got to do here is I'll type git. Statuses will show all the things that need to be committed. We have a couple files here. What can we do with that?

What we do for that is we type git add then dot. And this will add all that stuff. All right. Let's keep going. Now, let's type in git status, see if anything's changed OK, yeah. So here we have changes that are to be committed. These are all the new files.

Now, we have to actually go about committing them. So to do that, I'll type in git commit -m. And this is where we type in our little message. And the reason why you want to do this is because it provides helpful information. If anyone comes along, or maybe you forget what changes you've made, a little commentary will give that additional information.

OK, so we have our eight files that are added. And just to make sure they're added, I'll go to git status. All right, nothing to commit, everything has been added. And also, in the future, if you ever need to-- if you ever want a shortcut to adding your changes-- so let's say, for instance, let's go to this practice. I'll make another little change. Let's say I do want you to be welcome after all to the shopping cart. All right, let's do that. Save. Save it. Run it. OK. Yeah, it's working.

Let's get the status again. Hm, something's been modified. Oh, if you ever have a whole bunch of things that need to be modified, instead of just specifying one file at a time, what you can do is type git commit -a for all the files. And then -m-- here's our message, what should I say?-- "made you feel welcome again." And there we go. Let's check the status. Git status, nothing to commit. OK, so those are all the steps that you need for working with Git. And those are going to be applicable in the next practice, which I'll go over in a different video.

Practice 3-4 is on Creating a java Project and Checking it into Git. This practice is a bit more open-ended, and it combines everything you've learned thus far in this lesson. So what you'll need to do here is create a NetBeans Java project, have it print out Hello World, and then you check that project into the Git repository. I hope you've given this a try on your own, but if you've gotten stuck, I'll use this video to provide you with a walk-through. Let's get started.

So I want this to be here in the 03 folder that we created in the previous practice. So far so good in NetBeans, and I'll go to create a New Project. So Java's going to be a Java Application, Next. I want to call this project HelloApp. And the instructions say let's create a main class, but it has to be called homework.Main. And let's create that.

OK, you'll see it appear here. Here's the class Main, in the homework folder. All right. Oh, it's also turned green. [LAUGHS] That's because it's in Git. Great, all right. So we have our Main method here, and we need to have it print out Hello World. So I'll type system.out.println("Hello World"). Let's run that, see if it works. Yes it does, great. OK.

So the next thing we have to do is get this into Git. Let's check the status, git status. All right, so we have a couple modifications here. So I have to make sure those are added. So I'll type git add dot. Now, let's check the status. Git status.

All right. Look at all those files that got to be added. So I'll type in git commit -a -m. Let's see. This will be our initial commit for HelloApp. All right, let's check the status one last time, Up, Up, git status. Nothing to commit. All right. We've successfully created a new project and added it to our Git repository. That's the end of this practice.

## 5. Skill Check: Creating a Java Main Class - Score 80% or higher to pass

Skill Check: Creating a Java Main Class

View Skill Check
