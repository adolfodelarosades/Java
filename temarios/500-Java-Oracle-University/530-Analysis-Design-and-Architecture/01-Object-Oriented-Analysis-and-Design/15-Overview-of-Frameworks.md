# 15: Overview of Frameworks

1. Overview of Frameworks - 23m
2. Lab 15: Overview of Frameworks - 6m

## 1. Overview of Frameworks - 23m

Let us talk about lesson number 15, Overview of Frameworks. Objectives are to define a framework, describe the advantages and disadvantages of using framework, identify several common frameworks, and to understand the concepts of creating your own business domain framework. So these are the four different objectives, a very small lesson.

So description of framework. What do we mean by framework? Let us just take a simple example. Say I want to create a web application. So I still remember when I created my first web application. I won't talk about that because when I created my first web application, I had to download a servlet as a separate, you can say, software. It was a plug-in.

So let us take a look at-- normally, well, if I want to do any web application development, I don't want to use any kind of a framework. So let me see what I require. Say I need one basic software component called a servlet. OK.

So, a very simple application I have, say, one HTML page. And I have one servlet. All right? So what do I do? I open Notepad, OK. I open Notepad. And I write my HTML code. And so on. OK?

I save it as .HTML file, right? And then I open Notepad again, and I create my HelloServlet.java class. OK. Now, here I write my servlet. Now I want to run it.

We know that this is a component which is to be deployed on to the web application server. And this also has to be placed somewhere. It has to be kept at a certain location.

I have to create an archive for this. Only then I can give it to the applications server. So most of the time, I will create one ContextRoot. OK. I will create one ContextRoot. So I will say, WebProject.

Now in this WebProject, I may need to create one Web folder. And there I will put my HTML file. OK. I will create one Web-INF folder.

And in this, I need to create web.xml file. And within the web-INF folder, I will create Classes folder. And I have to put HelloServlet.class file.

I have to create one Lib folder. And here I have to put some libraries. This is the minimal. This is the minimal. All these things I need to do by myself. Right. Now, this is a very small application.

Applications keep on becoming complex. They become a lot of modules, lot of things. And every time you do something, you have to go here, and you have to write the entry over here for a particular web component.

So this was a scenario when we started. Later, it so happened that the various frameworks-- I would rather call all the IDE's which we are using these days for the Enterprise Application Development. Or even for any kind of Enterprise Application Development.

May it be a NetBeans. OK. May it be NetBeans. Or may it be JDeveloper. OK. So when I go to the NetBeans, I select that I want to create my project as a web application.

So it does everything. It will create the ContextRoot. It will create all the archives. Everything. Everything will be created, including creating of the web.xml file, depending upon what indication I give. Vendor specific deployment descriptor. Everything will be done over here.

Likewise, if you go to JDeveloper, and if I say, suppose, for example, I want to create a SOA composite application project, it will create all possible-- whatever the requirements are there-- the basics will be created and kept for me.

Though it is not originally and completely, you cannot call it a full framework. So what I can do is, say I want to create a web application. And I say, OK. I'm going to use struts. So what do you have to do? You don't have to bother about anything. You just have to bother about your business logic. OK.

So framework is a half baked solution. The full infrastructure, whatever you require at the software level for your application, that is being developed. You do not have to bother about where to go, what kind of archives you have to create, and what all you have to run because that is already done for you.

So a software framework is a very usable software infrastructure that can be extended, and configured, to provide a specific software solution. Like, I can have an integration level, or you can say, integration tier framework, like Hibernate or JPA. I have a framework for a web application, Ruby on Rails, Struts. I can use even Spring. Spring can be used for other kinds of things, also.

So a framework provides an extension point. You know how your component has to communicate to the application server, or what it has to do. So APIs will be provided. Some scripts will be provided.

Configuration files will be provided. Support applications will also be provided. So you have to focus only on functional requirements. That is what, in general, we can say a framework is.

Now frameworks can be available in a variety of ways. Talking about the software development frameworks, we can have a framework for a single tier, just like web tier framework. A web tier framework like, for example, JSF can be considered as a web tier framework.

Struts can be considered as a web tier framework. Ruby on Rails can be considered as a web application framework. And you can have it for multiple tiers. Like you have Spring. Spring is a complete framework for doing everything.

Then we can have a representation tier framework, or business tier framework, entities. Like easyb 3.1. I will personally call it a framework for easyb because all the delicacies which we used to do in easyb 1. X and 2.X. All of those things are automatically being taken care of now. In today's world, if I want to develop my easyb, it is just as able to.

So I don't have to bother about so many other things. There can be other kinds of frameworks, which are domain specific frameworks. Like, for example, a framework for insurance domain.

Framework for a banking domain. Or framework for oil exploration domain. All right. So there can be various kinds.

Or there can be generic frameworks, which can be shared among the various domains. Like, for example, resource allocation can be used by any domain which requires any kind of a task for resource allocation. Resources can be anything.

It can be a human to source. It can be any kind of a machine. Or it can be any other kind of resource. Event management or billing. Billing can be used by any trading system, right.

Now description of a framework, customization of framework, is done by extending the framework classes or implementing the framework interfaces. You will have frameworks using two different possibilities. We will also see that design over here.

Framework may provide you just a bunch of interfaces. OK. These are all interfaces. Now these interfaces can be implemented by-- this is your class. OK. I will see YC every time. That means it is your class. Your Class 1. Your Class 2. Your Class 3. And Your Class 4. This can be one kind of model.

There can be another kind of model, like this. There can be Abstract Class. There can be an Abstract Class. Various Abstract Classes, of course. OK. And so on.

And these are your classes. Yours. Your Class 1. Your Class 2. Your Class 3. Right. I feel these two are extreme cases.

So what we can have-- the best solution is something like this. So I have Interface 1. I have Interface 2. Interface 3. And so on. And Class 1. Class 2. Class 3. And so on. OK.

So here we can see, this is the framework. This is you. OK. Here, also, this is framework. This is you. Here, also, this is framework. And this will be you.

Your Class 1. Your Class 2. Your Class 3. And you can have Your Class 4. More flexibility. Ultimate solution. So we can have various possibilities.

So extending the framework classes, or implementing the framework interfaces, can be done. So your classes maybe less coherent. The reason for that is when your class extends the framework class, now framework class will already have certain code, which is a generic code.

And your class will have a functional code. So that means cohesion will reduce. So you cannot avoid that. In this case, frameworks cohesion will always be lowering. And your classes will become more difficult to test outside the framework. So you have to test the classes.

Or the other possibility is that you will use POJOs, which tends to be more coherent. And you find a way that POJOs can be tested outside the framework. And then you somehow inform the framework of the POJOs class that it must be managed by some kind of config file.

Or by using some kind of annotations config file or annotations. It's only the way you are writing that, basically, causes this conflict. So that is another way out.

Various frameworks are available. Ruby on Rails is a rapid web application development framework. Spring is for web as well as it's a complete solution. It can provide business components and everything.

Java Server Faces is, again, a web based web application framework. Hibernate is for the integration tier. It is used very popular with Spring-Hibernate combination.

Struts is for web applications. Struts 2 is a refined form of the latest version of the web application. Microsoft.NET can be used for the complete application development.

Now what are the advantages and disadvantages of using a framework? Advantages include, developers can focus on the new business problems and not on the infrastructure problems, or common business aspects. You don't need to bother about common business aspects. You don't need to bother about the infrastructure problems. You just focus on your functional problems. Business problems.

When we are using frameworks, frameworks are already developed, using all the good object-oriented practices, best practices. And these are already implementing the patterns. So that responsibility of making sure that this pattern is to be used, or this best practices is to be used.

That becomes the framework's problem and not your problem. So you are just using the framework. When you choose a framework, you have already chosen the best practices, as well as the patterns.

Once you have gained the experience with the framework code, it is easier to write and support. So this point is positive and negative. Once you have gained the experience-- so that means you have to learn it. That you will see coming as a disadvantage in the next slide.

So you can see point number two, frameworks may be difficult to learn. But once you have learned them, you'll know everything about it. And then you can just keep on going with it.

Your code may become bloated because you are bothering only about the functional part. And the framework is bothering about the infrastructure part. And when you are extending the framework classes, the infrastructure part and the functional part both come together, as a part of a single class. So cohesion becomes less.

You are restricted by the infrastructure and cannot usually modify the infrastructure files. You cannot say, OK. I don't want to do things like this, but I want to do this little style. Half framework and half you will no do. It is end to end.

Changing an alternative framework may be difficult. I develop something on JPA. I want to get it onto Hibernate. I did something on Struts. I want to carry it, maybe onto GSS. It may be a difficult task to do that.

Now what about building our own frameworks? So the can handle that, of course. Frameworks are built by people only. So it can be a domain specific framework.

Say for example, we write a framework for insurance domain. Now insurance domain frameworks can be used for pet insurance, car insurance, life insurance, property insurance, public liability insurance, and so on. So how to do it?

So we will see that the radius classes and what different approaches we can take. So of the approaches I have already discussed, you will see over here. So this approach, which you see over here on the slide, is this approach.

Approach number 1. That is, all the classes marked in yellow are the framework classes. And you can extend those classes. Like Premium Calculation Rules is a class, OK, which contains zero or more Premium Calculation rules.

So what you can do is you can write your own rules. You can writer the rules. These are general now. So you can write the breed rules, location rules, pet age rules, pet policy. All these rules you can write. OK.

Then you'll have a policy holder. A pet policy holder, OK. You can have zero to two insurance policies. So that means, how many policies? What is the insured article? Insured article is extended by pet.

Maybe you have house insurance. Then the rules will change. Rules will change. Policy holders will change. Insured article will change. So that is about the first part of it.

Second approach can be more flexible, where you have the interfaces. That is this one. That is this approach. OK. That is this approach.

So you have more flexibility. So we can see that we can have interfaces. So this is a complete abstract coupling to the outside client.

Because when we are using interfaces, it's a complete abstract coupling. Whatever we can fix, that we can put in the Abstract Class, still giving flexibility to the developer, that they can extend those classes. Or they can directly implement the interfaces and can do the things.

So this was about domain specific frameworks. What about domain neutral frameworks? Of course we can write domain neutral frameworks. Maybe a framework for resource allocation, or framework for billing. Or that kind of framework which can be used by multiple domains. OK. That can be domain neutral.

For example, one such pattern is party. So you can do that resource allocation for a person, company, place, thing, or even resource scheduling. OK. And this can be used to generically.

As in, anybody who wants to do a resource allocation or resource scheduling can use this particular framework. And they can customize it. They can write the customized classes depending upon what they want to schedule.

Another example can be billing. Billing can be used by any operating system. So what are the advantages and disadvantages? Almost similar to the previous regular frameworks. But a little changed. Reduction in cost and development time for each specific domain version using your framework.

So that means, if you are going for a domain base itself, or you're going to domain neutral. Secondly, the cost will be less because once the product is written once, it can be reused many times. And the cost will certainly come down.

Time will also be reduced, which may result in providing a competitive advantage. That's a very good sign. And developers can focus only on the difference between the specific domain and the framework because rest all is being done. And frameworks usually are written using OO practices, as well as the patterns. So we don't need to bother about that.

Certain disadvantages are there. It can be expensive to build such frameworks. So when you're building a framework, suppose-- now let us think from the framework builder's point of view.

So if I am building a framework, I have to think about, what is the market for this? Will I be able to move it in the market? Will I be able to even get my development cost back? Right. So it can be expensive to build.

And you cannot get up and decide that, OK. Today I'm going to start writing a framework for domain specific or domain neutral. I must know all the domains that the frameworks will be used for, if it is domain neutral. And if it is domain specific, then, of course, I should be master of the domain.

The code may become bloated, of course. That is a regular pattern for any kind of framework. It can be difficult to learn if people want to use your framework.

And to build something on that, they first must know what the framework is and how they can use it. And of course, we are restricted by the infrastructure. And we cannot modify the infrastructure files. So with this, we come to the end of lesson number 15 about frameworks.

## 2. Lab 15: Overview of Frameworks - 6m

First one, we will create a high level conceptual class diagram showing the classes and interfaces that would be required for a generic framework subsystem and discover potential domain neutral frameworks that could be shared across business domains. So first activity talks about creating a conceptual framework. So in this exercise, you will complete the following tasks.

You will identify the generate classes that would be required for the framework. Identify the specific domain classes that could use the framework. Create a conceptual class diagram for the classes and relationships that were identified.

There is no special preparation required for this activity. The tasks to be performed are three. Number one, identify the classes that would be required to build a framework for a generic resource allocation system where resources are allocated for a period of time.

Draw a high-level class diagram showing the generic classes and interfaces that would be required for the framework identified in step one. And draw domain specific classes that could use the framework that was created in step two.

Here's the solution. The first activity, we create an interface, a date range which is implemented by generic date range class, which implements metrics like get date range and get start date. We have another interface called as a resource, which is implemented by rule over here. So we can see the classes in the blue color are the step number three, the classes which are using these infrastructure classes and interfaces, of course.

And the second one, we have resources used by room. Room is a resource. Event is another interface, which is implemented by a generic event class, and which is again extended by domain specific class called as reservation.

So reservation can be considered as an event. So we can see there are generic methods like add resource, delete resource, get date range, or get description, get party, and so on. So party is another interface, which represents any kind of a party. It is implemented by a class generic party.

Generic party can be either a company or a person over here. So in our elevation system, the generic party is extended by customer, because customer is a party. So this is our first exercise, first activity.

Now, let us take a look at our second activity. In this exercise, we will identify potential frameworks that could be shared by a selection of business domains. No special preparation is required for this activity.

The tasks to be completed are number one, identify potential frameworks that could be shared by the following applications, like hotel system, car rental system, and private hospital system. Identify other applications that could use the framework discovered in step one. And step number three, optionally model the frameworks identified in step one and model the specific uses of this framework.

So we will see here, we identify potential frameworks. So we have a resource user time period, event, a resource allocation so we can see all the relationships. Everything is being shown over here. Resource user can be related to one or more events.

Charges are there, which is, of course, an aggregation. Chargeable item is there. Chargeable item type is there.

Resource allocation is there. Resource is there and resource type is there. Now, the implementation of this, we can see in the next, which is an optional part. So private hospital system is using these resources. Hospital stay is considered as an event.

So resource user is a patient, charges are for the hospital bill. The resource can be a hospital resource. And resource can be of a resource type.

Now, hospital resource can be operation tailored. It can be any XM machine or a scanning machine, which is being used for certain purpose. So this is how we can see the implementation of the frameworks, which we can create.

So with this, we come to the end of lab number 15. And we also come to the end of this course. I hope you enjoyed it well. Thank you.
