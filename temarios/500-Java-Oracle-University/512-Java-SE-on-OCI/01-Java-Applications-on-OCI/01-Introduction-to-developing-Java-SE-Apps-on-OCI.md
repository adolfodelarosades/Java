# 1: Introduction to developing Java SE Apps on OCI

1. Introduction to developing Java SE Apps on OCI 14m

## 1. Introduction to developing Java SE Apps on OCI 14m

Module 1, Introduction to Developing Java SE Applications on OCI, the Oracle Cloud Infrastructure. Upon completion of this course, you should be able to set up a VM compute instance in OCI to host your Java SE development. You will create and access an autonomous database from Java and invoke a RESTful web service. You'll also create a Java SE application that will bulk process data from flat files, load information to a database, and invoke a REST service to process that information.

This course and this module is intended for Java programmers. It provides a gateway into cloud application development. It uses the Oracle Cloud Infrastructure and uses the Always Free services, so if you wish to go back and try this yourself on your own outside the training, you can do so. It uses the Always Free services, the VM compute instances, and autonomous databases.

In addition to this course, Oracle University offers Cloud Development curriculum that will teach you in-depth usage of the Cloud Native services, DevOps, and Integration services available in OCI. Those are covered in other courses.

The prerequisite to successfully complete this case study, you should have successfully completed Oracle's Java SE 11 Programming Complete course, or have the equivalent experience in Java, meaning you can create Java classes, Java objects, work with methods, work with variables, object references. You can work with inheritance and interfaces. And you have experience and can work with the Java I/O API. You can work with property files and resource bundles and the JDBC API to access a database. These are covered in the Java SE 11 Programming Complete course, and you can refer back to that if you need help.

Also, you should have a basic understanding of Linux commands, so things like copy, unzip, things like that, opening a terminal window. That is expected that you can do basic things inside of a Linux environment. And that you have a VNC client such as TigerVNC installed on your local machine because you will connect using VNC to the remote VM instance where you do your work.

All right, let's talk a little bit about Java in the Cloud. Cloud Java software is really just a Java program. When you're writing Java Standard Edition, you're just creating a Java program, unless you're utilizing special server-side Java runtime environments, frameworks, and APIs, which are called Java Enterprise Edition or Java EE. Java EE leverages what you learn and use in Java SE to write the actual program code.

So far then, you've used Java SE to create a Java program. However, there is still benefit you can get from working in the cloud, even though your programs are command line programs, meaning they run from the command line and are not actually being deployed to an active server like WebLogic or GlassFish. That is something that's done with Java EE applications. With a Java SE application, you run it from the command line, and so there's limits as to what you can do in terms of sharing and creating cloud-based applications. So we're trying to approximate some of that a little bit here inside this course.

One, you can still benefit from using cloud-based services. Databases and other services are available in the cloud, and it can be much easier to use those services that are provided, even if they're just provided as a black box and you're simply accessing those services, than to try to write those services from scratch. Examples of services include things like integration, automation, API management, streaming, events. Those are examples of cloud-based services, bitcoin, machine learning. Those are all available in the Oracle Cloud infrastructure and those are also taught in other courses.

Another benefit from the cloud is scalability and availability. The cloud, in theory, should be available 24/7 or pretty close to it. And you can get automatic scaling so as demand goes up, new CPU, new processing power is added automatically.

And of course, lower cost of maintenance. So working with the cloud, there's lower cost of maintenance, less maintenance that you have to do because much of this is already set up for you.

Now, some of that you won't be seeing in the course, in this course. But we're just mentioning that these are some of the benefits that you'll see. And as you know, you and your company are probably moving toward the cloud more and more.

So after creating a Java SE application, the next step would be to convert that application into a service that can be invoked using REST or SOAP interfaces. This is covered in the Develop Apps for Java EE 7 course and the Web Service courses. So in here, we're not going to actually do that. We haven't really learned how to create a RESTful or SOAP service yet, but we will call a REST service, which is fairly easy to do, and we'll provide the code for that.

So some of the benefits of using OCI services. First of all, there are automated DevOps approaches that are made available. So if you want to work with source control, continuous integration, and deployment, there are services set up in Oracle Cloud Infrastructure to work with DevOps. We don't cover that in this course, but that is covered in another curriculum and another set of courses.

Secondly, your service changes. You're now using Cloud-Native and Platform as a Services services. This includes streaming, events, machine learning, how to host in containers like Docker and Kubernetes, creating and managing APIs, and then using integration and automation software. Again, when you get familiar with these types of services and the environments where they're used, and you get used to working with them, they make you a more desirable and marketable developer.

So in this course, we're going to use the Always Free services and get started getting you used to working in a cloud environment inside the Oracle Cloud environment. So this case study uses the Oracle Cloud Infrastructure VM Compute Instance. It will be an Oracle Enterprise Linux 7 instance. We will use a pre-configured image called the Oracle Cloud Developer Image, which includes the Java Development kits, SQL Developer and even Eclipse installed inside that image automatically for you.

We will do a little configuration to make sure we're using the right JDK. And we'll actually, for this case study, download and install NetBeans. Now if you prefer to use Eclipse, you're welcome to do so. And Eclipse is included automatically. Again, we're encouraging you to do the work in the actual virtual machine in the cloud to get experience getting used to connecting to it, setting it up, provisioning it, and working in that environment.

Secondly, you'll use an Autonomous Transaction Processing Database. This is an Oracle database that you will provision. You'll create an account in that database to use as a developer. And you'll also create tables and seed that data. Again, if you're not able to do that, we give you the SQL scripts necessary.

Also you'll use the local VM file system. So you'll use a file system that comes along with your VM to store your flat files and read and write to that file system. And you'll use a RESTful web service. For our example, we're using a public RESTful web service which takes in a country code-- country name and provides a set of country codes back. And we provide scripts and specifications that are part of the course to give you guidance in case you get stuck.

So let's talk about this a little bit. When doing the work in these labs, we're going to go through the slides first. And then we have an activity guide that takes you through kind of at a higher level what to do. And then we have individual job aids or specific guides that take you through step by step what to do, if you're not sure of how to proceed. We are always encouraging you to do this on your own with the knowledge that you have. But we also provide the additional knowledge, if you don't have experience in certain things, to get you past a point where you might be stuck.

The first major task you're going to accomplish will be to provision your development virtual machine. You're going to create an actual VM compute instance in the Oracle Cloud Infrastructure. It'll be an Oracle Linux 7 image. And that's where you'll do your work, either with Eclipse, or NetBeans, or whatever tool you want to use. You'll use the Oracle Cloud Developer Image. And the shape will be an Intel Skylake Virtual Machine with two Oracle CPUs and 30 gigabytes of RAM. Should give you a nice performing virtual machine.

Now there is a PDF file called vm-dev-provisioning, which has details about how to provision a VM if you don't know how to do that. It'll indicate which image to use and how to connect to it. When you provision a VM, you have to supply a public key from a public-private key pair. If you don't have a public-private key pair already, then the ssh-key-creation.pdf will take you through the steps needed to create a public-private key pair, either on a Linux Unix machine like Linux or Macintosh, or on a Windows machine. You'll need that when you provision your VM.

Now, when you provision your VM, it is possible that you'll be sharing the cloud environment with other students who are also working on their own courses, and so you must be careful about how you name things. The names of things inside the cloud have to be unique. So if I create a new VM, I'm going to put my initials at the end of the VM name to make sure it's unique from some other student. I will also check to see if there are other VMs that have the exact same name as the one I'm intending, and make sure I maybe put a number or something at the end of it to make sure the name is unique.

Don't worry. If you make a mistake, and you try to use a name that's already been used, it will not create or overwrite the other virtual machine. You'll just simply not be able to create it and you'll have to try again by changing the name.

So easiest thing to do, look and see if there are other VM instances in the cloud infrastructure. And I'll point this out when I do the recorded videos of showing how to do all this. And then make sure there's nothing else with your same name or same initials. I like to use my first initial, middle initial, and last initial. And if you need to, and you think it's fairly common, just put a number at the end. That's fine as well.

So you'll provision the VM, set up the VM for VNC access. And then you'll confirm that you can connect to the instance with a VNC client. That's the first major task to do.

The second major task is to provision the Autonomous Transaction Processing Database, ATP. The application uses an autonomous database for storing warranty and claim records. You will provision a new instance of the Oracle Autonomous Transaction Processing Database. Make sure that you add your initials to this instance as well. Again, just like with the virtual machine instance, the database instance name must be unique.

You will connect to it and you'll create a new user that you'll use as the user account for your application. You will create a couple of tables and seed them with some initial data. We encourage you to try to design and build the tables yourself, and using SQL Developer can be an easy way to do it. Otherwise, we do provide the SQL scripts necessary to create the user, create the tables, and populate the tables with data if you need help.

Inside your VM, we recommend you use SQL Developer because it's a nice graphical user interface to allow you to manipulate tables, columns, keys, enter data, and work with the Oracle database very easily. And it can also connect to cloud-based databases as well, which is what we're going to do.

So when you're ready you'll go into your virtual machine. You're going to use VNC client, a VNC client to connect to it. You'll open the terminal window in your virtual machine. You'll cd to the opt SQL Developer directory. You'll run SQL Developer.

And the first time you run it, it will prompt you to enter the Java Development Kit location. This one's kind of odd for this image, but it will work fine. And you'll put in /user/java/jdk1.8.0_231-amd64.

Once you do that and press Enter, SQL Developer will start normally. And you can then invoke SQL Developer using the Applications Programming menu. You only have to do this the first time you set up SQL Developer. We recommend you do this as part of this lab so that you can access and prep the database.

So in summary, in this lesson, you're going to get familiar with the case study context, and the environment requirements, and will provision the needed components for the solution. In the next lesson, we'll actually present you with the programming challenge of what you actually have to make work.

The practice for this module includes first of all creating an SS key pair if you don't already have one. And there is a PDF file that describes how to do it. We call these job aids or guides.

You'll then provision a compute instance based on the Oracle Cloud Developer Image and set up the VM instance for VNC access. This is described in the vm-dev-provisioning.pdf file.

Then you'll provision an autonomous transaction processing database. That's described in the atp-provisioning.pdf file.

Then you're going to need to install NetBeans if you want to use it. These set of lab exercises and the recorded videos do use NetBeans. But you're welcome to use something else if you wish. And you have access to the internet, so if you want to download and install your own IDE, you can do so inside the virtual machine. So you'll install and configure NetBeans. You'll configure SQL Developer in the VM instance.

So there is a netbeans-vm-install.pdf file and an atp-wallet.pdf file. The wallet is a set of files that you can download from the autonomous transaction processing instance that gives information to SQL Developer, and as we'll see in your Java program, how to connect to the database using JDBC. And we'll talk about that a little bit when we get into the videos.

And then you'll create a database user and tables, and you'll seed that data. And then there is a sql-scripts.pdf file to help you with that.

With that, that completes this module. And now, you can take a look at the video for how to do this if you need guidance for creating this SSH key pair, creating the VM compute instance, provisioning the ATP database, installing and configuring NetBeans, and creating a database user and tables, and seeding the data. Thank you.
