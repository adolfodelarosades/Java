# 9: Lesson 9: Project Management

1. Lesson 9: Project Management, Part 1 - 5m
2. Lesson 9: Project Management, Part 2 - 9m
3. Lesson 9: Project Management, Part 3 - 15m
4. Lesson 9: Project Management, Part 4 - 12m
5. Practices for Lesson 9 - 15m
6. Skill Check: Managing Projects and Packages - Score 80% or higher to pass


## 1. Lesson 9: Project Management, Part 1 - 5m

Lesson 9 is project management. A few of the things we'll talk about in this lesson are giving you a better understanding of Java packages, describe what the Maven tool is good for. This also includes listing the parts of the POM file. And we'll talk a bit more about how to go about using the Maven tool and how to manage dependencies with it, explaining how repositories work in Maven, and using Maven with Oracle Developer Cloud Service.

The first thing we'll talk about are Java packages. Classes are grouped into packages to ease the management of a system. There's no right or wrong way to organize your stuff into packages, but a common technique is to group classes into packages by semantic similarity.

In homework 8, what you ended up doing was you had your GameUtil class, and that was in the soccer.util package. So anything in this package you would expect to be utilities, like things that you need to allow yourself to do work, like setting a roster, or here's a database of players that you draw from, or this is how you set the goals within a game.

And then you may have an events package here which would include events or things that occur during a game, like a goal, like a kickoff, like a position. And then you'd have another package here which would outline the remaining things, like the game, the league, the player, the team. This is the package you've been working with since the beginning of the homework assignments.

Packages are stored in a directory tree containing directories that match the package names. For example, the Goal.class exists in a directory event, and that exists in a directory soccer. Another way to think about this is like they're just files inside. So here is your file that's inside a folder inside of a folder, just like you're working with a desktop.

In this code example in the slide, it shows the package statement used at the beginning. And most classes that you create are going to require a package statement. And just as a class itself must be in a file of the same name as the class, the file-- in this case, Goal.java-- must be contained in a directory structure that matches the package name.

I'll introduce you to Maven now. So what is Maven? Apache Maven is an open source software management project comprehension tool that provides a standardized build infrastructure that is a built tool, dependency management tool, quality tool, and documentation tool. It manages a project's build, reporting, and documentation from a central piece of information, known as the POM file, or Project Object Model. Just POM for short.

So why use Maven? Apache Maven is a good project management tool because it has predefined standardized directory structures and it requires little programming knowledge. It has a wide support community, provides pre-built plug-ins, solutions, and documentation. It's based on goals like being able to compile, test, package, install, deploy. It's well-supported by many IDEs, including NetBeans. It's an archetype plug-in-- simplifies initial build creation. And it makes managing dependencies easier.

And that takes us to practice 9-1, where before we go any further, you guys will need to install and configure Maven.

## 2. Lesson 9: Project Management, Part 2 - 9m

Now that you've installed and configured Maven, I'll describe Maven repositories. A Maven repository is a directory in which all project JAR files, library JAR files, plug-ins, and any other artifacts are stored. You may be wondering, what is a JAR file?

Do you remember when you were playing with Java Puzzle Ball, how you launched it? It was JavaPuzzleBall.jar. So all a JAR is is it's a single file that contains all the resources you need to run, in this case all the resources you needed to run Java Puzzle Ball, all contained within a single file.

There are three types of Maven repositories. There are three types of Maven repositories. They're central, local, and remote.

The Maven central repository is managed by the Maven community. It contains all dependency JARs and libraries. Maven automatically downloads any JARs it needs or defined in your project to your local repository. No special configuration is needed to connect to the Maven central repository, but you do need to have internet access. And finally, anyone can publish libraries to the Maven central repository.

The local repository-- a local repository is a local folder on your machine that is created when you run any Maven command for the first time. It stores all dependency library JARs, plug-in JARs, and others. Maven uses local JAR files for builds. It automatically downloads newer versions, so version determined by the dependency element in the pom.xml file. Local repositories avoids downloads for every project build. And the default location is under the USER_HOME directory.

For a remote repository, a Maven remote repository may be set up inside a company. It may be necessary for Maven to be used inside the company for a project that teams use to host its own libraries, such a company maintain repositories outside of the developers' machines. That's why we call it a remote repository.

Continuing on to defining the Maven directory structure. Maven defines a single directory structure. The Java package structure is maintained in the Java directory for both source files and testing source files. And they're found in their appropriate subdirectories.

Packages for your project appear under the Java directory. And in this example, soccer.event, soccer.play, and soccer.util, these are the three packages, although only events has any files that are shown. But rest assured there are files found in the other packages. We just didn't show them all on the slide.

For the standard directory layout, if you follow the directory layout outlined in this slide, you never have to specify the directories of your source code, test code, resource files, or any others in your POM file. At the top of your Project root is pom.xml. That file is a text file for the user to read immediately on receiving the source.

When it comes to configuring the POM file, POM, or Project Object Model, is a fundamental unit of work in Maven. There is a pom.xml file in the base directory of every Maven project. What this does is it defines the project module settings. It's an XML file format with all values captured as XML elements.

It has a built in hierarchy, settings, properties, plug-ins, dependencies, profiles. It can be nested to allow each project to encapsulate the artifact's intent. It defines base versions for common dependencies, reporting, profiles, and plug-ins. There's one POM file per module. And Maven provides a Super POM from which all POM files implicitly inherit.

The minimum that your POM file needs to have would include information on Project, the root element. modelVersion should be set to 4.0.0. groupId is the ID of the project's group, artifactId the ID of the artifact or the project. And then Version, the version of the artifact under the specific group. Values for groupId, artifactId, and Version form the products fully qualified artifact name. And that's in the form of groupid, colon, artifactid, colon, version.

So here's an example. Here's an example. We have our project. We have our modelVersion, our groupId, our artifact, our version. And then we just close that out right here. And the fully qualified artifact name would be com.mycompany.app, colon, my-app, colon, 1.0.

And this fits the format that we saw before, which is here we have groupID. Here we have ArtifactID. And then we have version.

There are other important attributes for the POM file that you may want to include, and those can be found here on this slide. We're going to actually show an example of this, of what a partial POM file looks like, and then you can find where some of these important POM attributes are.

The partial pom.xml file pictured in this slide shows some information that can be included in the pom.xml file. So properties you'll see right here. The properties section sets the compiler version and the encoding to use for source files. The dependencies section shows a dependency on junit, so we see that junit's here. And this would continue beyond the bottom of the slide.

So how Maven goes about using the POM file, Maven traverses the POM file in the following order. First it reads the pom.xml file and parses the content. Then it downloads dependencies to a local dependency repository. It executes lifecycle/build phase/goals, and then finally executes plug-ins that extend Maven core functions or perform custom project-specific tasks.

I'll continue on by describing managing plug-ins and dependencies. But I think now is a good place for a break, so I'll continue with this topic in the next section.

## 3. Lesson 9: Project Management, Part 3 - 15m

Managing plug-ins and dependencies. So why do dependencies need managing? The reason is because writing Java code requires libraries. Java libraries are packaged in JAR files. And a JAR file must be in the CLASSPATH when your project code is compiled, but different projects need different versions of the libraries.

Version management is a difficult task, because libraries are stored in different locations all over the internet. And retrieving them and updating is difficult and time-consuming. And Maven attempts to make these management issues much easier for you.

Maven has built-in dependency management. The POM file specifies the external libraries that the project depends on, and the version. It downloads external dependencies and stores them in your local Maven repository. If a library acquires another library, in other words if one library is dependent on another library, Maven downloads them for you.

It's specified inside the dependencies element of the POM file. And each dependency is identified by its groupId, artifactId, and version. So here's an example of a JUnit dependency. And it includes each of these fields, so we have our groupId, artifactId, and a version.

A Maven external dependency is a dependency JAR file that is not in a local or remote-- a Maven external dependency is a dependency JAR file that is not in a local or remote Maven repository, that is external. External dependencies may be located on your local hard disk. And you can configure an external dependency like this.

Actually, when we were working on Java Puzzle Ball, this is what we had to do. Really early on, we did have our work done as a Maven project. And we had the stuff that I was working on. We had the art. We had the level design. We had the user interface. We had the menus.

Those were all done as part of one program and it had its own JAR. And then we had another programmer who was working on the ball bouncing mechanics. And that was done as a separate JAR. So our main program was dependent on the ball bouncing mechanics, that JAR. And so this is what we use to manage that.

There's also snapshot dependencies. Snapshot dependencies are dependency JAR files that are under development. They are used to avoid constantly updating the version numbers to get the latest version.

Simply mark a dependency JAR file as a snapshot, and Maven always downloads it. It's always downloaded to your local repository for every build, even if a matching snapshot version is already downloaded in your local repository, it'll still be downloaded again. And to mark your project as a snapshot version, append minus SNAPSHOT to the version number in the beginning of your POM where you set the groupId and artifactId. So this is what it would look like right here.

Maven plug-ins. Maven is a plug-in container. Each task is performed by a plug-in. Maven plug-ins can be used to compile source code files, create JAR files, create WAR files, run unit tests, create project documentation, and create project reports.

Maven provides two types of plug-ins. There's a build plug-in. Build plug-ins execute during the build, should be configured in the build element in the POM file.

And then there's reporting plug-ins. Reporting plug-ins execute during the site generation. They should be configured in the repository element of the POM file.

And some common plug-ins may include clean, cleans up after your builds; compiler, which compiles the Java source file; install installs built JARs into a local repository; resources, which copies resources into output with JAR; and then ear, which generates an ear file. What? Oh.

And there are several common Maven commands you will use that rely on plug-ins to work. And they include Maven clean compile. This deletes the target directory and any compiled class files. It compiles the Java source code inputs the class files in the target directory.

There's Maven execute Java, E-X-E-C colon Java. This executes your project files after they've been compiled. And then there's Maven package, which generates a JAR file based on your class files in the target directory. So in this example, it sets the Java version number to compile your project. And that's done here and here, configuration, 1.8 meaning Java 8.

The exec plug-in, it allows you to execute your compiled class files. And notice that you have to specify the main class. That's done here.

The JAR plug-in creates a JAR file for your project. And the slide here shows how the JAR plug-in is configured to set the main class of the JAR file.

To deploy a Java application, you typically put the necessary files into a JAR file. This greatly simplifies running the application on another machine. A JAR file is, again, much like a ZIP file, and it contains the entire directory structure for the compiled classs-- the compiled classes, that is, plus any additional MANIFEST-M-- plus an additional MANIFEST.MF file in the META-INF directory. This MANIFEST.MF, shown here, this tells the Java runtime which file contains the main method. MANIFEST.MF IMF tells-- MANIFEST.MF, this file tells the Java runtime which file contains the main method.

So to create an application JAR file, this is what you would type. And when you type this command, it creates a new JAR file in the target directory, target directory found here. The files uses the values set for artifactId and version in the pom.xml file. So in this example, the file name is going to be Soccer-1.0.jar.

When it comes to running the JAR file from the command line, you can do that too. And this example shows how to do it, to execute a JAR from the project directory. And this would be your output.

But you can do that with any JAR file. In fact, I'll show you how that's done with Java Puzzle Ball, actually, because you could do this, again, with any file. So here I am in Windows. I'm just going to--

Here's the trick. I'm going to hold Shift and then right-click. And this will bring up a command window, well, the option to bring up a command window, that is. Then I decide to bring it up. And I'll type in java minus jar java-- it should be capital, actually-- JavaPuzzleBall.jar. And that should launch the application.

All right. And since we're doing this in a command-- since we're doing this in CMD, we're able to see some debugging information. So this is normally what we were printing out to the output.

We were trying to figure out how to resize the screen. We thought it'd be helpful to see what the actual screen sizes were. All right. That's a little trick I wanted to show you guys.

All right. Let's keep going and continue on by describing the Maven lifecycle. So the Build lifecycle is a sequence of tasks, such as compile, test, package, publish, or deploy, used to build software. A Maven build cycle is a sequence of phases to go through to finish building the software. And Maven has three standard lifecycles. There is clean; default, or build; and site. And these phases are executed sequentially to complete the default lifecycle.

Here are some of the Maven build lifecycle phases. And using the build phases from that slide, when the default lifecycle is used, Maven will first validate the project, compile the sources, run those against tests, package any binaries, run integration tests against that package, verify the package, install the verified package to the local repository, and then finally deploy the installed package in a specified environment.

Continuing on to configuring a project for Oracle Developer Cloud Service, a Maven archetype is defined as an original pattern or model from which all other things of the same kind are made, such as a template to create a new Maven project. It automatically creates directory structure and pom.xml. It downloads any required libraries.

The maven-architect-quickstart archetype creates an empty Maven project you can use as a starting point. And here's an example. And what this command does exactly, it creates a directory called 09-01-Prj as a child directory where the command is executed. It creates all the Maven project directories and creates the package subdirectory for com.example.rest in both the main and test projects' directories. It also creates a main class called app.java and a testing main class called apptest.java in the package directories.

Properly compile and package your Java application. A few tweaks need to be made to the pom.xml file generated by the quickstart archetype. Oh. Nuts. I'm going to do that over.

[INAUDIBLE]

I didn't have the cursor selected. Yeah. 48.

48, yeah. And whenever you're ready.

OK. To properly compile and package your Java application, a few tweaks need to be made to the pom.xml file generated by the quickstart archetype, which are to add a properties section setting the Java version and encoding type, add a build element to within the project element, add a plugins elements with the build element, add the compiler plug-in settings to the plugins element, add the exec execute plug-in settings to the plugins element, and then finally, add the JAR plug-in settings to the plugins element. And examples of all of these sections were shown in earlier slides.

And that takes us to Practice 9-2, Creating a New Maven Project. I'd like you guys to give this a shot. In this practice, you will create a new Maven project using an archetype.

## 4. Lesson 9: Project Management, Part 4 - 12m

Now that you've created a new Maven project, I'll tell you a little bit more about gitignore. So this file again, identifies a file that should not be versioned. This includes all by class, all by code, and all .jar-- stuff that's meant to be auto-generated, auto-builds like by nothings, for instance. And these things should not be versioned by git.

For Maven, all such files are stored-- all of these files that we don't want versioned-- are stored in the target directory. It may be necessary to add a rule to ignore all target directories in the repository. So for this, you just add the line right here **/target/**. Star star, it indicates a subdirectory, or any child directories, or the reverse for parent directories. The reason why you may need to do this or you may not need to do this depends on your operating system. Because the gitignore file rules, they may vary between different operating systems.

To share your repository with team members, you need to connect your repository to the Git repository an Oracle Developer Cloud Service. A project with an empty Git repository must created in Oracle Developer Cloud Service first. And then you can get the HTTPS URL for your Git repository on Oracle Developer Cloud Services. You'll need to add a remote repository to your Git repository, and that's done using this command. And then finally, to push your repository to the cloud, use this command-- git push origin master.

Final topic we'll talk about in the lesson is building a Maven project using Oracle Developer Cloud Service. Oracle Developer Cloud Service includes a build service to build and test code. It's associated with your Git repository. It uses common build tools like Maven and Gradle. Builds can be manual or automated. It sets triggers based on your criteria like build on Git push, set a regular schedule, or based on other builds, and it creates package artifacts that are ready for testing.

These are all the tabs you'll find for configuring your build job in Oracle Developer Cloud Service. We though it would be helpful to list them all here, but I'll run through the process with you in the upcoming slides. So here's the sample build tab. This shows the build tab after lesson 09a, after that job has been successfully built right there. Now some other jobs exist, and some statistical information is also available. There's the statistics. And here are the additional jobs right here.

And all you have to do is click on a job name to go figure the settings for the job. So if you wanted to configure lesson 09a, just click right here. When it comes to creating a build job to run builds and generate artifacts that can be deployed, create a build job. First, one, navigate to your project. Two, click the Build tab, and then click New Job. three, in the New Job dialog box, enter a unique job name. Four, select Create Free-style Job to create a blank that must be configured to run a build. Five, click Save. Six, so now, when you're here, you're now ready to configure build job.

So here, you're now in the Configure Build Job dialog box. Click Save, and then you'll return to the Job Details page. Use the Configure button to configure each aspect of your build job. Now, the configure button would be right here. So just click your Configure button to get each of your job configuration tabs that you need. Configure the main tab for your job by, one, click the Configure button. Two, click the Main tab. Three, enter a description in the description field. Then four, set the JDK version to 8, and then click Save.

So if you look here, this is we're entering our job name. This is where we're specifying the version of Java, JDK 8. And again, we're in the Build tabs, and then the Main tab.

Use the source control tab to configure your Git repository. So to do that, first, click the Configure button again. Two, click the Source Control tab. Three, select the Git option. Four, in the Repository section, under URL, select the URL to your Git repository, and then, finally, click Save. So here we are under Build, so we go to Source Control, select the Git option. And here, this is important. This is the URL where your Git repository is.

You're absolutely going to need this URL for the upcoming practice. So I find it helpful to just click here, and then Copy. And keep available for the upcoming practice.

OK. When it comes to configuring, add the steps to invoke Maven 3, and run a test on the created JAR file. You do that one, by clicking the Configure button. That's a very important button. Two, click Build Steps, click that tab. Three, click Add Build Step, and select Invoke Maven 3. Set the goals of the project to Clean Package, and set the POM file to the path of your pom.xml from the root of your Git repository.

And here's just an example of that. It would be 09/ex090/pom.xml. Four, click the Add Build Step, and select Execute Shell and set the command to-- and you'll have to revise this a bit to make it more appropriate for whatever your specific names are. But this is what would be done for the example. And then finally, click Save.

And so here we are again where we're in Build Steps. We're specifying the goals, in this case, clean package, and then here we have the path to our POM file. If you want to configure post-build actions-- this occurs after the build completes. And there are several options available. In this case, archive the built JAR file.

And we do that by first, clicking the Configure button. Two, click the Post Build tab. Three, click the Archive and Artifacts button. Once you do that, in Files to Archive enter **/*.jar. Then, check Discard all But the Last Successful Stable Artifact to Save Disk Space. That's the option that you want to have checked. And then, three, set the compression type to NONE. You don't need any compression. And then four, click Save.

So here we are. Files to archive-- this is where you type in **/*.jar. And then make sure this is checked. And then set your compression type. This should be NONE. Oh, and also, in order to get all this to appear, you have to choose Archive the Artifacts. Once you choose this, once you select this box, then these options become available to you. Then again, we're just in the Post Build tab.

Running the build-- run a build from a job's Detail page, all you have to do is select Build Now. The details of your build include a status message, which is displayed when your job is queued, messages as the job is processed, a green check mark-- we only have red though-- a green check mark indicates that the build was successful. A red X indicates that the build was not successful. A link to your JAR file appears if the build succeeds, and build data is tracked in a graph.

There's also an option for automation with build triggers. Use build triggers to automate your build if-- there are several options available for determining when a build takes place. The first is, when these jobs are built, your build is triggered when another job completes, another is based on the schedule, which means the build is triggered by a CRON schedule you supply-- based on the SCM polling schedule, which means the build is triggered after a commit to your Git repository based on that SCM polling schedule.

You can set up a CRON schedule to further limit builds to specific times-- and finally, when Maven dependencies have been updated by Maven 3 integration, which means any Maven dependency update triggers a build.

## 5. Practices for Lesson 9 - 15m

Practice 9-1 is to install and configure Maven. If you've gotten stuck, this video will provide you with a walkthrough. And what we'll do in this practice is first we'll download Maven from this website. We'll unzip the distribution to the directory that we want. We'll add a couple of environment variables, M2, modify the PATH environment variable. And then finally, we'll test what we've done using the Command prompt. And we'll check to see the version, just to confirm that we've installed it correctly.

So I'll go to this website now. And this is where we can find Maven. We're going to install the binary zip archive. So this is the link that we want right here. This is where we go to download. OK, again, I'm going to save it on the Desktop, just so that I know where it is.

And the next thing that we need to do is set up a folder where we want Maven. This could be wherever you want. I prefer to do it here on the C-drive. All right, let's take the zip we've downloaded. Well unzip it here. All right, and now we're all set with the original zip. We don't need that anymore.

This directory, this path, is actually going to be very important. So I'm going to copy it, because I need it for setting up the environment variables. And that's the next thing we need to do is set up the environment variables. So to do that, I'll go to My Computer, right click-- Properties-- Advanced System Settings-- and Environment Variables.

OK, so the first environment variable I'm going to set up is M2_HOME. And the variable value is going to be the path that we copy. So I'm just going to paste it back in here. And then we have to modify the PATH variable. Let's edit that and append at the end of it-- $M2_HOME/bin. So let's see if that worked.

We're in Windows, so I'll call cmd for Command Prompt, and test out mvn minus minus version. Did this work? It did not work. I didn't think it would, because there's another variable we need to set up. So this is going to be our M2 variable. And the value is going to be %M2_HOME%/bin. And then we have to modify the PATH variable, because I had set it wrong before. Modify this so that it's %M2%. And I think that should do it. Let's give that a try.

I have to get a new cmd. I'll type in Maven minus minus version. All right, it worked. Cool. So I hope you found this useful, if you got stuck just like I did. All right, let's get back to the lesson.

Practice 9-2 is Creating a New Maven Project. In this video, I'll give you a walkthrough on how to create a new Maven project using an archetype. So let me pull up the instructions first. OK, and the first thing we have to do is change the cloud directory where we have our Git repository and create a new folder.

So here we have the cloud directory. This is where we have our Git repository. And I'll open Git Bash here. In order to create the directory, I'll type in mk dir 09. OK, yeah, then we see it appeared right here. And I'll change to that directory-- cd 09. Cd for change directory. And there we are.

The next step is to create an empty Maven project using the Maven archetype quickstart architecture by entering in the command below. I'm actually going to copy that, because I'm sure if I go to type it in myself I'll make a mistake. Control-C on windows, Control-- oh, can't Control-V. I'll right click and then paste.

And this takes a little bit to set up. That command creates an empty Maven project. If you check out the directory, yeah, and here we have our created project. We have our source code here. Go to Main-- Java-- Com-- Example. All right, yeah, and this is our Java, our Java file. This is the actual code that we'd be writing with the messing around with the NetBeans. So actually, would that be-- I'll pull that up in NetBeans.

Let's go to NetBeans-- Open. So I want to go to-- where is cloud? Cloud 09, yep, MA for Maven-- this is our Maven project here. Yep. And let's just run it. All right. Select the Main class here. Yeah, there we go. It's printing out, "Hello, World." So this all seems to be working.

You'll also notice, if you go to Project Files, this is the pom file. And we'll-- for the next part of this practice, we need to do a bit of editing to the pom file. The first thing we have to do is add the property settings to the file before the Dependency section. So I'm going to [INAUDIBLE] a fair bit of copying and pasting here. And I do this because I'm sure that I'll goof something up.

So before Dependencies, copy, paste, all right. Then after Dependencies, I have to add information for the build and plugins. So after our Dependencies-- OK, there's our build. And then here, we have to do a little more copy-pasting to insert. I'm going to just maximize this so we can all see it. I have to insert our plugins here. And there's quite a few plugins we have to add.

So add this one here. Add one more here. Add another one. And if at any time-- like the way these are all indented are kind of messy, so there's a shortcut in NetBeans you can use. Its Alt-Shift-F for formatting. Yeah, and that fixes all the indentation for us. OK, I'll save it.

And let's test the project. I'll do that by typing in mvn clean compile. Why didn't this work? Oh, because I had to change the directory, right. Because I don't-- right now, is currently looking in-- it's looking in, oh-- yeah-- I'm looking here. I actually want to look here instead. So I'll change the directory-- cd 09 dash 02 dash hello. And then run mvn clean compile. That should work.

All right, cool. Then to execute the application, we'll type mvn exec java. There it is, "Hello, World." Great, that's what I want to see. And then finally, we need to package it, which means putting it into a jar. So for that, we'll type mvn package. So we should see, if we go in here, we should see-- and go into Target. Yeah, there's our jar. So we can either click-- double click this to open it, or I'll show you how to open it from Maven.

We type in java minus jar target 09 dash 02 dash hello 1.0 snapshot dot jar. So I typed in Java because I wanted to see if the problem was Java. I think I know what it is. I think I didn't set environment very low properly, because it's not, it's just not recognizing Java. It doesn't know that command exists.

So let me actually go to the environment variables again. Environment variables-- yeah, so I set this up for user variables. It should actually be system variables for JAVA HOME. So let me copy that, copy the variable value, paste it here. And it's called JAVA HOME, JAVA_HOME. That should work. And I can just delete this old one here. Click OK, OK.

Let's see if this works now. I'm pretty sure it will. Tell me all about Java. Oh, you're right, because I have to close it and then open it again. OK, I can do that.

So I actually want to Git Bash here, in this case. Because this is no. Yes, this is the directory I was in. Git Bash-- all right, so now it's saying follow the instructions as usual. Nothing went wrong. The last thing I would do is type in minus jar java minus jar target 09 dash 02 hello dash 1.0 snapshot dot jar.

Yes, it worked! Finally. Cool. There's just one more step now. And that's committing the project to the Git repository. So to do that, I'll Git Bash here. Now let's just check the status first.

All right so we notice that we have to add the whole 09 folder. So for that, I'll type Git add space dot. I'll show you what happened. Check the status again. And you don't have to keep checking the status, but I'll do it to show you guys what's going on.

So you have some files that are ready to be added, all right You've also modified the dot gitignore file. And they also say there is also additional files within this new project that we want to ignore and not submit to the repository. So finally, we'll type in git commit minus a-- for all of them automatically-- minus m-- for our message. The rest is just going to be initial commit for Hello project.

Cool, I think that worked. Let's just check to be sure. All right, we're good. We've created our new project, our new Maven project, and committed that to the repository. I hope you found this walkthrough useful, especially if you ran into trouble like I did. All right, let's get back to the lecture now.

## 6. Skill Check: Managing Projects and Packages - Score 80% or higher to pass

Skill Check: Managing Projects and Packages

View Skill Check
