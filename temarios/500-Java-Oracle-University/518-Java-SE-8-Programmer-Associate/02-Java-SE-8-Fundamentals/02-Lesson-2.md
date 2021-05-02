# 2: Lesson 2: Java Programming and Git

1. Lesson 2: Java Programming and Git, Part 1 - 7m
2. Lesson 2: Java Programming and Git, Part 2 - 4m
3. Lesson 2: Java Programming and Git, Part 3 - 6m
4. Lesson 2: Java Programming and Git, Part 4 - 5m
5. Practices for Lesson 2 - 9m
6. Quizzes for Lesson 2 
7. Skill Check: Java Programming and GIT - Score 80% or higher to pass

## 1. Lesson 2: Java Programming and Git, Part 1 - 7m

Lesson 2 is an Introduction to the Java programming language and Git for version control. So at the end of this lesson, what we want you to try and come away with is an understanding of the Java programming language, what some of the advantages of the language are. We'll get you set up with what you need to start writing your Java programs, but we won't start writing it yet. That will be in the next lesson. And also, go into what Git is, what version control is, and why version control can be useful and beneficial.

So to start off, I'll give you an introduction overview of computer programs. A computer program is a set of instructions that run on a computer or some other kind of digital device. You have what's called "machine level coding," "machine code," and this is just binary. This is 0 and 1s.

Well, most people can't read binary or can't read machine code, but a computer can. When you write your code, you do it in what's called "high-level code" and this is a readable by humans. And what you need to be able to do is you compile or be able to translate something that's readable from humans into something that can be readable by machines.

If you look at another language, like the C-- if you write C code-- when you compile that, it gets compiled into binaries for different operating systems. So you have binaries for Mac OS, binaries for Linux, binaries for Windows. And when you combine the binaries with libraries for the different operating system, you'll have an executable.

But if you look at the Mac's executable, the Mac executable only runs on Mac. The Linux version only runs on Linux. The Windows version only runs on Windows. And this is what we call "platform-specific."

They image demonstrated how platform-dependent executables can execute on only one platform. And sometimes, this isn't very desirable. And also, as a developer, it can get annoying if you ever need to make little tweaks for every little operating system that you want to support.

And this is where the Java programming language can come in handy. There are features of the Java programming language that can avoid this. Java is said to be platform-independent. In other words, you write your program once and it can run on any operating system as long as it has the JVM-- something that we'll talk about later. And it's also object-oriented, a concept that I'll explain coming up.

So here, to demonstrate platform-independence, you have your Java code-- something that's writeable and readable by humans. You compile it into a Java bytecode. That's combined with the Java libraries. But this Java bytecode, when it runs on the JVM-- or it's called a "virtual machine"-- the same bytecode, the same code that you've written, it'll run on Mac, it will run on Linux, it'll run on Windows. You write your code once, and it'll run everywhere. That's an advantage of Java.

If you take a closer look at what this pipeline looks like, you have the code you write, which is a .java file. The component of Java that compiles it is a javac, and that translates it into bytecode or .class files. Then you take that, and you're able to execute that in the Java runtime.

If you look at other languages, like the C language, the C language was very procedural. It's called a "procedural programming language." In other words, you write your code, your code is read line one, line two, line three, line four, line five. It's very linear, and the drawback to doing this is that it becomes difficult to translate this kind of code into real-world scenarios. It becomes difficult to maintain these programs and it becomes difficult to provide any enhancements that may be needed.

Java, on the other hand, is an object-oriented language. And the benefits of this is, in Java, you create these objects and they're allowed to interact with each other with no prescribed sequence. So instead of doing step one, step two, step three, step four, your program is able to become more flexible and anticipate any sort of interactions that may arise.

Other benefits of the Java programming language include modularity. The source code for an object can be written and maintained independent of the source code for other objects. And after an object has been created, that object can easily be passed around inside the system so that other bits of your code can interact with that object.

There is information hiding, which means, by interacting with an object's methods, the details of its internal implementations remain hidden from the outside world. There is code reuse, which means, if an object already exists-- it was perhaps written by another developer-- you can you reuse that object within your program.

And finally, there is maintainability. If a particular object is found to be problematic, you can create another slightly modified one and replace that one and just get rid of the bad one. Rip that out of there, and replace with something you find that would be much more satisfactory.

So the next thing we wanted to talk about is installing and configuring your IDE, which is an Interactive Development Environment, and this is what you use to edit your Java code. In order to get started as a developer, what you'll need to do is download the JDK-- or the Java Development Kit. And what this includes is the Java Virtual Machine, Java compiler-- also known as "Java C" and that's what used to translate your .java files into .class files. You have utilities for packages and debugging and so on. And finally, you have the JRE-- or the Java Runtime Environment.

And that brings us to the first practice of this lesson. So what I want you to do is go ahead and install your IDE, the NetBeans IDE for editing Java code, and install the JDK. So the information on how to go about doing this can be found in the Activity Guide. Good luck, and I'll see you at the beginning of the next section.

## 2. Lesson 2: Java Programming and Git, Part 2 - 4m

Now that you've installed NetBeans and the JDK, I'll tell you a bit about version control. So what is version control? It can come in useful if you're working on a project with a bunch of people and you all need to work on different aspects of the same project. It's also useful in case you mess up.

For instance, if something goes wrong, like if you-- I've had this happen to me a bunch of times too. Where you're programming, and you're trying to implement a feature and to get something right, but you end up making your code look a whole lot messier than it should be. And then, you have to go back to when your code isn't messy just because your solution doesn't work. Your code is horribly messy. And the best thing you can do is just throw out and go back to what you had before.

But if you don't have a previous version of your code saved, then you're in trouble. So that's what version control does is that allows you to go back to earlier versions, versions where everything was working before you messed things up. And there's a couple of different types of version control. One is local, which means all the information that you need is going to be stored locally on your machine. You have what's called centralized repository, which means you have one centralized server or one centralized database off somewhere that everyone in your group is drawing from.

And you have what's called distributed. And what distributed means is that the clients don't just check out the latest snapshots of the files. They also [INAUDIBLE] mirror their repository. And if the server being collected dies, any client repository can be copied back up to the server and restore it.

So just to explain versions control a bit more conceptually, one way to go about it is that you manually save different versions of your file on your system. Say one day you're working on your stuff, and you decide, OK, I'm going to call this version 1. If I need to go back to version 1, here's a file. And then you go the next day, OK now, this is my version 2. I'll save that for today. Then the next day you go on to 3, you go on to 4. That's the long way do it, but it's probably not the most efficient way to do it.

With Git, what you have is just one file. But by using the Git tool, you're able to go back and look at the previous versions if you need to. In introduction to Git, getting started with Git. Git can be used from the command line or with a GUI-- GUI being a Graphical User Interface. So if you take a look on the slide here, this is using Git from the command line where you actually need to type in all the commands that you want. And here we have GUI, the Graphical User Interface where you have icons and images, and just a neater way to sort all the stuff.

So you can do it both ways, but what we're going to do in this course is we're going to do command line. And the reason for that is because we believe that'll help give you a better foundation, and a better understanding, and a better appreciation for Git. So what I want you to do now is install Git. I'll walk through a little about how to do this in the next section.

## 3. Lesson 2: Java Programming and Git, Part 3 - 6m

Now that you've installed Git, I'll tell you a little more about the files you encounter in Git. So in Git, your files may be one of the following states. You have files which are Committed, which means the data is safely stored in your local database or the local repository. You have Modified, which means you've made changes to the files but they've not yet been committed to the database. And then finally, you have Staged which means you've marked your files in their current version to go into your next commit snapshot. In other words, they're ready to be updated but they haven't been updated yet.

For the sections of the Git repository, there are three main sections to be aware of. First is the Git directory. The Git directory, this contains all of the extra information, called metadata, that's associated with your project. And you have the object database for your project or what is copied when you clone your repository from another computer. You have your Working directory, a single checkout of one version of the project, where files are pulled from the compressed database to the Git directory and put on disk to use or modify. And finally, the Staging area, where a file that stores information about what will go into your next commit is stored.

Moving on to performing Git operations, so earlier I had shown you there are a whole bunch of Git commands that were available to you. I'll go over just a few of them in this lecture. In order to get started creating a Git repository, the first thing you need to enter into your command line is git init. This creates a Git subdirectory that contains the repository files in the project directory, but nothing in your project is being tracked yet.

To do that, you have to create some files and then specify the file that you want to track. And you do that by typing in git add, followed by the file, and then git commit to commit that file to the repository. You'll also find it helpful to include a little message here.

And the reason why this is helpful is if you ever look back at some of your changes and you wonder, why did I submit that? What was the update? What's going on so? So the goal here is just to provide a little bit of information to yourself and to other people about what changes have happened and why the updates were necessary.

So that's the basic information you need to get started. But I'll tell you a little bit more about what some of these commands do. If you take a look at git add, it accepts a path name for a file or for a directory. If the path is for a directory, the command adds all the files and all subdirectories in that directory.

Git stages a file exactly as it is when the git add command is run. If a file is modified after the command is run, the command must be rerun to add those changes to the repository. git status is used to list the files that have changes staged that would be ready for the next commit.

And when it comes to committing, again it's very helpful to provide a little message. And the command is here, git commit minus m, and then in quotations put your little message. Using minus a automatically adds changes from all tracked files and removes files in the index that have been removed from the working tree and then commits.

Use this command, minus minus dry-run, to see a summary of what would be included for the next commit without actually doing the commit. Minus m again is to provide a commit message. And if you make a mistake with a commit, oh no, you can recover from that with git reset.

git status, a little bit more on that. It helps answers two questions, the first one being what have you changed but has not been staged, and what have you staged that you're about to commit? A couple of tricks you can do here, minus s or minus short, that will provide you a short description of the status, or if you want something more verbose, you have the commands minus v or minus verbose.

And this is pretty much the workflow. What you end up doing is you create your file, you add the files, then you commit. And any point, you can check the status. And this all works on your local repository. In a little bit I'll cover what to do if you want to use a remote repository.

So what I'd like you to do now is to practice creating a Git repository on your machine and follow the instructions in the Activity Guide. If you want to go a little bit further and try and commit some files, you can try that too, nothing wrong with that. And I'll provide a little overview of how to go about that. Good luck.

## 4. Lesson 2: Java Programming and Git, Part 4 - 5m

Now that you've created your Git repository, I'll go over a few other commands. I didn't go over them earlier, because they weren't necessary for the exercise, but they will come in handy later. So the Ignore file, what this can do is it allows you to say what file you want to be ignored, and typically, you want this to be anything that would be auto-generated, anything that you want your machine to compile, not just necessarily something that you need to store, because why store it? You're going to create it on your own.

So to do this, a .gitignore file tells get which files and directories to ignore before you make a commit. The gitignore file must reside in the working directory, not in the .git directory, and you can use patterns to delineate files to-- use patterns to delineate files to ignore, rather than explicitly listing the files one by one and the directories, and list all ignored files in this project by following that. And don't worry if you don't get this right now, because we're actually going to go over this more as homework for Lesson 3.

When it comes to removing files, you can remove files from your repository using git rm, and then you just specify the file that you want. You will not remove modified files that have been staged, unless you remove them using -f, and this will forcibly remove them. It also does not remove the file just from the working directory.

You could rename a file using git mv, and there's a couple ways to do this. You can say git mv, specify the old file name, and then specify the new file name. That's all nicely done in one line. Or you could follow these statements here, which are equivalent, but it's done in three lines, which may not be all that nice to do.

For git clone, so git clone is good when you're working with a repository that's not local. We're using it on a remote master branch. And this is something that we'll cover later in Lesson 9, but for now, I'll just say that git clone-- it sets your local master branch to track all of the remote master branch changes from your server that you've cloned.

Get a copy of an existing git repository by using this command, git clone, and then you specify the URL where you're drawing these changes from. You can get a copy of an existing Git repository with a name that is different from the original Git repository as shown here. And a cloned remote repository is automatically added under the name, Origin.

So instead of adding and committing, we have pulling and pushing when it comes to remote repositories. What pull does is fetches data from the server you clone, automatically tries to merge files into the code that you're currently working on. Fetch from and integrate with another repository using the command git pull. So contrast this with git fetch, which does not automatically merge the data that is pulled down from the original server with any of your work.

Finally, we have push. What this does is it pushes your changes upstream to a remote server and updates the remote references and associated objects. If you cloned your repository, use this command to push your master branch and all its commits to your original server, this command. And also you want to proactively do a git pull before you do a git push to avoid conflicts. This is also to make sure you have the latest version and that you're not editing something that's old.

So in summary, for this lesson, you should have learned how you describe the differences between high level languages and machine code, explain what platform independence is, describe how a Java program is compiled into what format, explain why Java is called an object-oriented language, describe what version control is, explain the characteristics of Git, and understand some of the basic Git commands.

## 5. Practices for Lesson 2 - 9m

The first practice of this lesson is to configure the NetBeans IDE and install the JDK, the Java Development Kit. To do that, follow the link provided. And when you do that, you'll find the NetBeans and JDK 8 bundle, or the latest JDK version.

So we recommend downloading this. So click there, and we need to do is read through and accept the license agreement and find the version of the JDK that's best for your system. So we'll go with Windows 64-bit. I'm installing this just on the Desktop, so I know where it is.

Now we've downloaded what we need to install the JDK and NetBeans, so while we're on that-- I'm going to click Yes, "Do you want to allow this application to make changes?"

So welcome to the installer. So a lot of the default settings are fine for us. This is where it's going to install the JDK 2. And this is actually something you'll want to remember for later. So what I'm going to do here is actually copy this-- Control-C shortcut. Click Next. And the install looks correct. We're going to install NetBeans, in this case 8.1, and going to install the JDK 1.8.0_77. Just click Next and then install.

So that may have taken a while. So here we are. We've finished installing, and you'll have noticed that-- after I click Finished-- that we have NetBeans here installed on the Desktop. So in the next lesson, we'll open up NetBeans and play around and do a little bit of coding, but this should be good enough for now.

We'll also check to see that Java, the JDK, is installed properly. We'll do that by going to, in Windows, cmd, and then we'll type in "java -version." And this should tell us the version of Java we have.

Yep, so looks like everything is installed properly. There's a couple of extra steps that we wanted to do just in case, and that's setting up environmental variables. So to do that, I'll go to Start, Control Panel, System, and then Advanced System Settings and set the environmental variables.

The first variable that we want to set is the JAVA_HOME variable. So to do that, we'll go to New. Our variable name will be JAVA_HOME. And remember that path that I copied before? I'll paste it in right here. This is where Java is installed, the JDK.

And then there's one more. If we go to-- if we go down here to System Variables, Find Path and then go to Edit-- when we installed Java, it automatically set a Path variable here, but we actually need to change this a bit. So we need to have this one read %JAVA_HOME%/bin.

And that's it. So that's the end of this exercise.

In Practice 2, the assignment is to install Git for version control. And I'll demonstrate how to do that for Windows. So following the link provided, you can download Git for Windows by clicking here. So the prompt to download automatically popped up, so I'll go to save the file. And I'll save it on the Desktop, just because I'll know where it is. You'll find the installer here on the Desktop.

So let's just get to work and install that. I'll walk you through how to do this. So we'll run this-- yes, I want to allow it to make changes! And after diligently reading through the license agreement, press Next

press Next, and most of these default things that I recommend are pretty good. So I'll just go Next and Next, Next. All right. So this one we actually want the top option, Use Git From Git Bash Only. Click Next, Next, Next, Next.

So we've installed Git, and I'll just show you that it's installed properly by launching it and doing a couple of commands. So I'll get the version number git minus minus version. OK. Looks like we have a ver-- looks like that's going right.

And then let's try another one. Let's try Git minus minus help. And this will give you a list of commands. And whoa, there's a ton of them. What do these all mean? I will explain that coming up in the next part of the lesson.

The third practice of this lesson is to create a Git repository. I would still like you to try this on your own, but what I'll do for now is I'll walk you through basic steps about how to set something up, because what you'll end up doing is a little different from I'll do, but I thought I'd give you some information to help you get started.

So here we have a folder. This is our demo folder for creating a Git repository. What I'll do is on Windows, I'm going to right click and I'll decide to Git Bash Here. And what we want to do is when we start, when we want to create a Git repository, we type Git init.

So we've created our Git repository, and you can find that here in the Explorer. But we don't have any files that it can track yet. So I'm just going to go ahead and create a new text file, something really simple, and call it test dot txt. In here in Git, I'll say git add test dot txt.

And it should be tracked, so if we go to git status, you'll see it's here, but it's unstaged. So what we have to do is we have to commit it. So we'll do git commit and minus m to have a message, which is going to be adding test dot txt.

And the reason why you want to provide a little message is just so that when you go back and see what your check-ins are, you'll be able to bring a little commentary, a little additional information, to yourself.

So we committed that. So if we go to status now, git status, so we committed it. And we check the status, realize that there's nothing else that's left to commit. So everything should have been taken care of.

And so lastly, what I'll do is I'll go to type git rm to remove to see what happens if I kind of remove it from the repository. So I remove test dot txt. It disappeared. It's gone. So I hope you found that entertaining and help you get through practice 3 of in Activity Guide. Good luck.

## 6. Quizzes for Lesson 2 

Quizzes for Lesson 2

Quizzes for Lesson 2

[View Content](https://learn.oracle.com/education/html/pages/UPK/JavaFundamentals_quiz2/index.html?p_cloud_id=989)

## 7. Skill Check: Java Programming and GIT - Score 80% or higher to pass

Skill Check: Java Programming and GIT

View Skill Check
