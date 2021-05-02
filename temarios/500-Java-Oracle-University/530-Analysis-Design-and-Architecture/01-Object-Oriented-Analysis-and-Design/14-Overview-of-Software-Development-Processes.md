# 14: Overview of Software Development Processes

1. Overview of Software Development Processes - 55m
2. Lab 14: Overview of Software Development Processes - 14m

## 1. Overview of Software Development Processes - 55m

So let's talk about Module 14. Here, we talk about overview of software development process. The objectives are to explain the best practices for object oriented software development methodologies. We will describe the features off several common methodologies like Waterfall, Unified Process, Rational Unified Process, Scrum, eXtreme Programming, and so on.

We will choose a methodology that best suit our project, and we will develop an iteration plan. This diagram we have seen in lesson number two, where we reviewed the software methodology. So we know. We pick up a methodology. We have phases. Phases can be carried out in workflows. Workflows can be carried out as activities. And activities can be carried out using tools. And activities produce artifacts.

There are some various terminologies which are used over here. Sometimes, people use phase as a macro phase and workflow as a micro phase. There are others who use the term as phase and workflow.

Now talking about the best practices, we have the various things over here. We can see there are best practices with the use case driven methodology, systemic quality driven, or architecture centric, iterative and incremental based design best practices. So when we are developing the whole processes going through, we need not follow only one out of many best practices. Depending upon what we are doing, we can follow multiple strategies for best practices.

So use case driven. We know that the software has the users. So that means there is an actor who communicates with the use case. So actor communicates with the use case. Actor can be human, or actor can be machine. So interaction is to be understood.

Users use software to perform activities or accomplish goals. Use case shows the functionality. And user, or the actor shows-- the users use the software, and the software shows the various functionalities, which are being shown in the form of use cases.

So software development methodology supports the creation of software that facilitates use cases. So we take up the use cases. We build the functionality with the use cases. The design workflow takes the use cases and creates the software components that will implement all these functionalities. And we integrate those things together.

So the use case drives the design of the system. So that means, at this point of time, we think that is the functionality which is driving the process. Second one is a systemic quality driven. Now the systemic quality driven, the term systemic quality, is termed as a quantity of service. So we represent the nonfunctional requirements. So SunTone Architecture Methodology uses the term "quality of service."

So quality of service-- like performance, reliability, scalability. So we create the total design, depending upon the systemic quality driven, or quality of service driven, and the functional components fit over there within that. So the prime importance is about the non functional requirements. And we try to fit the functional components into the non functional design architecture kind.

Then we have architecture centric. When we talk about architecture-centric, we are thinking about the risks. So architecture is all about capturing the strategic aspects off a high level structure of your system. Systemic qualities drive the architecture components. We implement the patterns. We talk about what kind of pattern will suit this kind of architecture-- maybe MVC. We talked about the tiers and layers of patterns. So all these patterns are the architectural patterns.

So use cases which we have created-- maybe we created use cases by using use case methodology. So those use cases we want to fit into these architectural components. High level structure, we'll talk about the tiers which represent the logical, you can say, partitioning of your system that all the user interface components should go into the representation tier or into the client tier.

All the service components, all the business logic components, must go to the business tier. All the components which contain the persistence logic most go to the integration tier, and so on. So tier components and the communication protocols.

Now, if you are using a web service in one particular component, are you using SOAP protocol, or are you using the a REST style of a communication? Are you using a web component? So that means you are communicating using HTTP protocol. So communications, I'm talking about a business component. Is it an RMI component? Am I using RMI GRMP protocol or using EZB, or am I using RMI IIOP protocol? So these things we will talk about.

And then layers. Of course, that will tell me how many hardware nodes I'm using in my system and at which node which component will be deployed. So application platform, all these things we will talk about.

Iterative and incremental. Change is a universal phenomena in software development. So we cannot expect a software development process without incorporating the changes. Even up to at the last moment of the software development, there can be a chance that some change needs to be incorporated.

So each iteration will include a complete object oriented software development life cycle. We may go to a last module, or a last stage, where we need to implement, for some particular use case, we need to implement analysis, design implementation, and test, and everything.

So iterative and incremental process, we model and build the software incrementally over multiple iteration. Every iteration will have a complete set of all the phases. Maintenance sometimes is considered as another the new iteration because when you go to maintenance, you may find out something that we need to have a series of iterations again. And we need to go right in the beginning of find all the requirements and add something new or build something different.

Model based is very interesting. We can communicate using various kinds of models with the stakeholders. So models are the primary means of communication between the stakeholders of the project-- between the project manager and the developers, between the business analysts and the developers, between the architect and the developers, or between the architect and the business analyst we can have various kinds of documents, like textual documents. We may have the use case scenarios. We may have the use case forms, UML diagrams like a sequence diagram, activity diagram. We can have prototypes.

We can build the architectural prototypes. It can be UI based, or it can be technology based. We have talked about these things previously.

What is the purpose of the model based? Better communication, better problem solving, and proof of concept. So these are the three main things which we can think about. Communication will be better because we can say a picture is always better than thousands of words.

Problem solving can happen in a better way because, when you see a various UML diagram, say I show somebody a sequence diagram, so they can visualize that, OK, this is how the process is being carried out. And the proof of concept, you can show it to the stakeholders. They will get to know that, OK, this is how the things are going to happen.

Now design best practices, there are various best practices. We can apply design principles like Open/Closed Principle, Composite Reuse Principle, Dependency Inversion Principle. We can use various software patterns. I know that I'm using, I'm modeling a complex object with so many different states. And depending on that state, there is behavior dependence.

So I can use state pattern. I know I have a single data source on which the multiple views are dependent. I can use the observer pattern. So refactoring can be done. refactoring is a process where you can make changes into the system, but it will not affect the interfaces.

How somebody is operating it, that will not affect-- you can refactor your algorithms. You can refactor your variable names. And you can refactor so many things. But the changes will not affect the usage of you software. Then there are some blueprints are there. So if you go to the Oracle website, you will see there's some blueprints. There are best practices for everything, for design patterns, for variable naming conventions, for communication among the various components, and so many other things.

So we can follow some blueprints as a best practice. So with this, we see the first part of our lesson, where we are following the best practices.

So surveying various methodologies. There are various methodologies, more than what we are having over here. But the major ones are very much here. We have a waterfall, the ideal, we can say.

I call it as unimplementable, in a way. So waterfall has waterfall with modifications. So the second one is a unified software development process. It is also called as just UP. That is a unified process. Then we have a rational unified process, unified process with the rational tool, scrum, and extreme programming. So let us take a look at these one by one by one.

So first we talk about waterfall. Now waterfall uses a single phase. In this, all the various workflows are followed in a linear fashion, as we can see in this slide. So I can come from requirement gathering to requirement analysis, from requirements analysis to architecture, architecture to design, design to implementation-- so it's a linear flow.

But there are some modifications because it is understood that the pure waterfall sometimes is looked upon like it's completely idealist, cannot be followed. Can I ever imagine of a software which I never have to go back and make any change or gather any other requirement. Maybe there can be a state where everything is perfect. But normally there are modifications where we say, OK, we can go one step back. From deployment, I can go to testing. But from deployment, I cannot go to implementation. So like that.

So the methodology does not support iterative development. The methodology works best for the project. Say you have some government projects where everything is fixed. We know that this is what our inputs. This is what are the functionalities. And this is what we want to produce. It is ideal for those kind of things.

And some consulting firms are there because this is so strict modules. So we will see that there are companies who are specialist in only requirement gathering. So requirement gathering will be done as a separate module. And there will be costing for that. And people will do only that. And the second part, where you have to do that requirement analysis, that will go somebody else. So that is very much possible.

Then we have unified software development process-- very, very widely used. Very widely used. It's a comparatively open approach. And this is implemented, or you can say the rational methodology created by Booch, Jacobson, and Rumbaugh uses the Unified Process.

Four basic phases-- inception phase, elaboration phase, construction phase and transition phase. Inception creates a vision of the software. You create a vision document. And elaboration, we have the most use cases are defined and the system architecture. So we can say we focus on functional and nonfunctional equally.

Once we have built the models for the functional as well as for the non functional, we are ready to go to the construction phase where the actual software is built. So that contains a lot of things-- programming, testing, and you can say, going back and making changes into the software. Once again, the beta version is the outcome of this.

So a transition says where people have tested the beta version and we are ready with the final changes-- the software moves from beta to the production. Now here, you can see, the requirement gathering-- these are the workflows on the left hand side-- requirement gathering, analysis and architecture, designing and realization, validation and deployment.

And, on the right hand side over here, we can see in different phases-- elaboration, inception, construction, and transition. So requirement gathering is at its highest in the inception and goes well almost up to two thirds of the elaboration phase and then starts declining. But even up to the transition phase, the requirement gathering doesn't stop.

Architecture and analysis begins almost in the middle of the inception phase and remains very, very active up to almost to the beginning of the construction phase and then starts declining. Designing and realization begins by the end of inception phase, keeps on gradually increasing in the elaboration phase, and comes to a steady state in construction. You can see a small spike over here. That shows that there can be some discovery over here which needs some kind of an attention.

Validation starts in the elaborate and can be in the minus stages. But it is at its highest towards the end of the construction and the beginning of the transition phase. Deployment begins by the end of the construction and is at its highest in the transition phase.

Now rational unified process is the commercial version of the unified process. We do everything that we do in the rational in the unified process. But for doing everything, and every activity, and every document is created with a rational tool set. So the tool manages all the phases. So you get restricted because you can produce only those documents. You can use only the way the rational works, how rational tool transitions from inception to elaboration, you don't have any flexibility over there. But you follow that, the tool itself.

So where we get restricted, there equally we have a benefit that many things are happening automatically over here. You don't have to take many decisions because the decisions are being taken by the tool itself.

So we can see the rational process. We have various things. You have rational software architect. We have Rational Rose, a [? RequestPro ?] ClearQuest. Then we have the Test Manager is there. ClearCase is there. Document architecture is there. So everything is fixed.

So there is a tool for every phrase and every particular document creation. But we are bound by the tool. We cannot say that, OK, use case I will create in my own style, or this document I will produce in my own style. No. You are bound by the tool over there.

Scrum is competitively latest. It follows iterative and incremental development framework. And it is used in conjunction with agile software development. So it's kind of a good mix of the old technologies and the new ones where we find that scrum has sprint. And every sprint is of a particular duration.

So there can be multiple sprints going on parallelly for development of a particular software. And the sprint is 15 to 30 days. And we need very, very active teams over here. The scrum framework requires a team oriented responsibility. There should be a good mix of highly experienced and less experienced people together because you cannot afford to lapse anything.

It's a very active area. The subset of the features are moved from the product backlog to the sprint backlog. So product backlog contains the whole software development details. So what you do? You take up one part and move it into the sprint backlog. Sprint is reviewed 24 hours. So it's activity, activity, activity all the time.

So we can see over here, from the product backlog, we move to the sprint backlog. So whatever is there in the sprint backlog is supposed to be carried out within the duration of 30 days. And the review keeps on going, a lot of meetings, a lot of reviews keep on happening over here.

Now then we have extreme programming, the latest one. It is more of an R&D kind of a thing, very light on documentation. And it nominates coding as the key activity. So the few key areas are, like, peer programming.

So we say, whatever is good, you take that. If code reviews are good, then review code all the timing. So it is a peer. One coder will code. And the other will review at the same time. So that means as you are coding, as you are reviewing. Testing is good, then test all the time-- even the customers.

Now, until a test is not written, the code will not be developed. If there is a test, there's a code for the test. Refactoring. So if design is good, then make it. So somebody may be coding, the refactoring may be going simultaneously along with that. Simplicity is good, then. Always leave the system with the simplest design.

So we try to follow the simple design. We try to break down the things into the simpler way and try to carry out in a simple manner. Extreme programming depends on the user stories. User stories can be compared to the use cases. It is just a different term. So users' stories will be the basis for the release planning. There can be a spike in between.

We can have uncertain estimates so the release planning will lead to the iteration, iteration to the acceptance test. And then there will be a small release. This is very, very much suitable if we have something in the research and development industry where the company culture is experimentation. So there is almost nil documentation, we can say, in this particular thing.

Now with this, we come to the end of the second part. We will talk about choosing a methodology. So let's talk about choosing a methodology.

We have about various methodologies, like waterfall, which is very strict. And then we talked about the unified process, where we had four different phases. It is more flexible. It is iterative and incremental. We also talked about rational unified process, where we can use a rational tool set, or rational-- you can say, it's a big suite with various tools. So we can use rational to manage all the workflows of the various activities to be carried in the unified process. We talked about scrum and extreme programming.

So now, in case if I have a project, I have to decide that which methodology I should follow for a particular company or for a particular project. How should I go about it? So there are certain factors which will affect that.

And these main four factors will be-- one will be the company culture. The company is process oriented or product oriented. Second factor which will affect is the makeup of the team. Do you have the large enough team which has the people with specified roles, or do you have such a team that where everybody can do almost everything, or, at least, there are people who can do more than one thing.

The third important factor over here will be the size of the project-- how large or how small a project is. Say I have very small project. I know the project is small, and the changes are not going to be at all because everything is fixed. That doesn't mean I will use Waterfall because it is document heavy, or I will use Unified Process because using these very huge methodologies, process-based methodologies, one after the other, everything has to be carried out. It can be an overkill for a very small project.

So we have to keep track of stability of requirements is very important because that will be a very clear indication. It's like you cut very clean with the sword. You know if there are going to be changes in the requirements. Suddenly, one decision is taken there very clearly that you are not going to use a waterfall model.

Then we talk about choosing the various things. Let's take a look at when to choose waterfall. So when your teams are big, you have large teams with distinct roles, and you have people who can perform one particular-- there is a business analyst. He will do, or she will do only business analyst tasks-- there is a person who will design, or there is person who-- there is no mixing up of roles. You have a person for every different role.

We will choose waterfall when the project is not risky. When you are very much sure that you don't have to revert back. You don't have to say, oh my god, what mistake I made? I forgot that this thing is not being supported by waterfall. So I cannot go back. I should finish one particular phrase and then, only, I can go to the second. There are no changes which can be entertained at a later point of time.

Issues, non resilient to requirements changes. That is one of the biggest issues with waterfall. Zero tolerance, you can say, for the requirement changes. And tends to be document heavy. Every phase, everything, whatever we do, is to be documented. So a lot of documentation will be done.

So that is why we discuss, when we were talking about the methodology also, we said, OK, if you have some big government project, and you know that there are not going to be any changes, whatever we are talking about, say you are writing a software about certain policy, or something like that, everything is being finalized. There are not going to be anymore changes. We can certainly go for waterfall in that case.

Second one is choosing unified process. Now the company culture is process oriented. Everything goes as per the process. Do this, then do this, then do this, then do this. Everything is dependent on the process. Everything follows a particular kind of process.

Themes are with the flexible roles. So that means here you are not creating a distinct roles for everybody. People can come together. People can perform more than one roles. Medium to large scale projects, you can see medium to large scale. We are not saying small projects. Small projects is an overkill.

So requirements are allowed to change because this is iterative. So we can come back, and we can take a look at this, just like when we were talking about choosing unified process, we said maintenance is another iteration.

And in every iteration, you will have all the various stages. You will have inception, elaboration, and all the activities will go on. You will do requirement gatherings, even up to the end. That is what we saw over here, if you remember, over here. So we can see that this describes the nature. If we understand that properly, we can easily choose a particular methodology.

So issues are tends to be process and document heavy. Not only document heavy, just process heavy also. You'll have to follow certain process. And it is, of course, when so much formalities are there, then it is certainly an overkill for a small project.

Then when to use a rational unified process? Now rational unified process we will use for the same reasons for which we used the unified process. And one of the major reasons to use rational unified process will be that you own a rational. It's a costly affair. It's a costly software. So if you already own the rational tool set, certainly, you would like to use it.

Issues, again, are same as of unified process. The only difference between the two is the usage of the tool. Another issue can be there is it tool set learning curve. There are special courses which are being delivered for two days, three days, five days, how to use this particular tool.

OK, so tools lock the team into a process that we discussed earlier also in the part of the lesson, that is when we are using a rational tool set, every document and transition from one phase to another phase, all these things, you have no flexibility. You will be just going as per the tool.

When do we choose scrum? Scrum is a lack of documentation. So if you don't want to do a documentation, go for scrum. I'm just joking. This is not the reason.

Priorities of the requirements are constantly changing because we know scrum is iterative and incremental. So when we need to deliver a working increment of the software every 30 days, like you can deliver it in small chunks-- you're doing something, and you give it as a final, and you say, OK, test it and then let us go further, that kind of a thing, it requires a committed team because there's no time to lapse.

You cannot take things lightly in scrum because the period is very short, 15 to 30 days. 24 hours reviewing is going on. Everything has to be done. All everything, right from the beginning to the end has to be carried out within 30 days for that particular scrum backlog, whatever we have put into the scrum.

So primary focus is the functional requirement. For each sprint, what is your deliverable? Your deliverable is a result or, you can say, the implementation of a certain use case. You have no time to think performance, scalability, flexibility, reliability, availability-- no, there's no time. Nonfunctional requirements might not be considered adequately.

So is your-- whatever the product you're developing, is they're going to be something like nonfunctional requirements have a lot of importance. Sometimes functional requirements will be as important as the nonfunctional requirements. Most of the enterprise softwares are like that. So we have to careful while choosing this.

Now choosing extreme programming will be, certainly, as we discussed in the previous view a few slides back, also, that is, it has to be R&D kind of a thing where a company allows a lot of experimentation, you have small teams who are working in a close proximity with a flexibility workspace. Teams must have experienced developers as well as inexperienced because everything is going on experimentation basis. Requirements change frequently. And tends to be document light, or you can consider tends to be documented free. It is almost no documentation. So this is about choosing the methodologies.

Next we talk about the project risks and constraints. Now risks are different from constraints. Sometimes we get mixed up with what do we mean by risk, and what do we mean constraint. Constraints and risks should be considered right in the initial stages of the development process. We have talked about the various risks and constraints earlier. Risks we have talked about.

Now let's take a look at the constraints. Now sometimes we confuse the nonfunctional requirements with the constraints. Constraints are not nonfunctional requirements. Choice of a certain specific platform, deadlines-- maybe you are creating a software for the next Olympic games. So because you cannot move the deadlines. It's completely, completely fixed.

Project requires specific technologies, so that can be a constraint. Although you don't have a team who are very well versed with Java2ME micro edition or mobile edition, but the software requires to use this particular technology. You don't have people who know HTML5 very well, but the demand of the project is like that.

Specific platform, like this software must run on Solaris. System interacts with specific external systems. How much ever we have the device drivers. How much ever we have all the good interfaces. External system can be external hardware, or it can be a completely external system, like EISO legacy systems. There is always an element of surprise when we are talking about external system, may it be interaction with the hardware device, or may it be an interaction with the software, you can say, component.

The risks of the project involve a different kind of scenario. Risks can be like a lack of big budget can be a risk. Or a sudden stop, you can say, a supply of money. That can be one kind of a risk. There can be a political risk. Maybe a competitor is developing the same thing.

Here are a few areas which we talk about the risks-- about a political, technological, resources, skills, requirements. So political can be maybe a competitor is also developing the same thing. And if they release their product in the market, your project comes then to stop because there's no meaning now to release it.

Political can also be something like this that are you developing something which doesn't map the government policies. Maybe you develop certain software to be released in USA. And tomorrow you feel like released the same software in China, or maybe in another part of the globe, where some policies may not be same in all the countries.

There can be technological risks. Maybe a cutting-edge technology is to be used, or the stakeholder thinks this technology is only the best. But you may know-- there can be two chances over here-- you know that he is right, or she is right, but you have other constraints that will you be able to provide the resources that who know how to use this technology well. Just selecting a technology doesn't make the project successful. How that chosen technology has been used properly, that also impacts a lot.

And the other chance can be that you know the stakeholder is under some misconception. It should not be used. There is a better and time-tested alternative. Another question, the challenge for you is how to convince.

Resources, sometimes resources, money is a resource, time is a resource, so all these people-- human resource can be combined even with the skills. Do you have the sufficient skills? Maybe there is a certain requirement change, and you do not have the technical skill for that particular requirement.

The requirements itself can change. The stakeholder can say, I'm not sure how, actually, this use case works. Or can you say to the stakeholder, OK, let me walk through, let me see your internal process, how exactly does it work?

Or the stakeholder may say, OK, I will see if something is missing only when I see the thing is working. Maybe that time I will get to know. There can be another fantastic chance that the users are themselves so much normal in using a certain use case that they're not aware of it that this is a use case. That can be also possible.

So let's talk about producing an iteration plan. Iteration plans are mainly applicable to iterative and incremental development of the process. The plans determine the order in which a software components are developed-- say, for example, you have a number of use cases. Maybe you are doing a hotel management system, or a reservation system, or library management system, so there will be a lot of use cases to manage the members, to manage the books, to remember the issues, to manage the returns of any kind of fine payments when the book is delayed and all these kind of things.

So you have to have a plan. Which use cases are most important? Which use cases you will release within this release of the software, which you don't want to consider right now, which can be developed parallelly? And what are the various risks depending upon the complexity of a particular use case and so on.

So if we are using a use case driven methodology, or any similar methodology, we can consider each use case based on priority depending upon risk and depending upon the interdependencies of these use cases.

For example, if you want to create, if you want to implement a use case of issue a book, so you are dependent upon two things, at least. You must have the book. And you must have a member to whom you want to issue the book.

The iteration plan might be documented in detail early in the project and can rigidly followed. Or you can have a loosely planned thing, and you can keep on changing it as the project progresses, depending upon the priorities.

Now the priorities of the use cases, we talk about the priorities in lesson number four, also when we were creating use case forms. So here we talk about the priorities.

Priorities can be categorized into four different categories. We say, MuSCoW-- must have, should have, could have, won't have. Must have, there is no alternative. You have to have. There is a core business process, so you want to have it. Should have, if at all possible, I would like to have it, if it is possible. So could have if it does not affect anything.

Like, for example, I could have paying of the fine by credit card if it does not affect the timelines. Won't have. Won't have means I'm not going to have it this time, but I will have it later, maybe in the next release or something like that.

So accessing the use case risk depends basically on the complexity. It also depends upon what kind of interfaces this use case has with the other use cases, other devices, or other systems. So if your use case is very big, and very huge, and complex, maybe you would like to keep it till the end if it is possible, if it is not something on which many other use cases are dependent, but this is complex.

I don't want to waste my time developing this use case right in the beginning so that this eats up all the time and all the other things I have to do in compromise. So if it is too complex, there can be two possibilities. We try to break it up and try to see that if we can simplify it, if we can make the process simplified. But if it is not possible, most of the time, it will be kept to be done in the end.

Interfaces to the external devices and systems, always there's an element of surprise as we talked a few slides back. Whenever you are communicating with an external device, you may have device driver, you may have everything, but you may not know how the combination will come when these two will communicate. Same thing can happen with the various systems, EIS systems, or legacy systems, or any other third party systems.

Architectural significance also needs to be considered. The use cases which are architecturally significant. Those use cases which have direct, you can say, impact with all the nonfunctional requirements, like should always be available, should be scalable, should be reliable, should be flexible, should have the best performance, a lot of transactions are there. So these are architecturally significant use cases.

So these use cases require the architect to choose an architecture that satisfies those NFRs. And then whatever the use cases are there, those use cases, of course, will have to fit into this architecture.

Talking about the architectural baseline, the architectural baseline is a subset of the system requirements that are realized in the code early in the project. So architecture baseline or architecture is not something where I have designed every component. Now, in the end, I will see, OK, what kind of architecture I should select for this. No, that is not the way it is to be done.

Architecture is very much the part of your total process right from the beginning. Right from the requirement gathering, when we talk about, we are talking about gathering of the functional as well as the nonfunctional requirements. So tested to prove that the chosen architecture satisfies. So we can create something called as a architectural proof of concept. It can be technical, or it can be UI based.

So it gives us one baseline. We understand that this is what we have. And this can be shown, even to the stakeholders. So if it is a technical proof of concept, maybe you are developing a miniature of your system which can be used further. But when you are doing that, you have to be very mature that you make it clear to the stakeholders that this is not the system. And your team must also not think that, OK, we developed so much. So now this was the 95% of the work is being done. No, it may be hardly be just the case that only 5% is being done.

And when we are talking about the architecture, we should also think about something that some things are implicit. There is one interesting story about the architecture. Somebody wanted to build a very beautiful house. And he hired the architect of good landscape, beautiful sceneries outside, very the big rooms with all the French windowpanes and everything, and all, and the house was ready. Everything was ready.

The stakeholders, the owner of the house came. He saw everything is beautiful. And he was about to sign whatever the agreement or everything. So they thought they will do it tomorrow morning.

So intuition works sometimes, right? The stakeholder came back. The owner came back to his house at night. Everything was OK, perfect. The only thing was there were no switches for the light. So in the morning, we went to the architect, and he said, I won't sign because there are no switches. Architect showed the service level agreement, and he said, you did not ask for it.

So when we are thinking about architecture, we also have to think about the design simultaneously. Some things are commonly understood. So we should not miss the point.

Then timeboxing is another interesting feature. Iteration completes on schedule. Now you have filled the iteration with so many use cases, with so much task, the iteration could not finish. So you are not going to relax the timeline for that iteration. Iteration has to finish within the time. Maybe the task which was supposed to be done in the iteration is not yet completed. So you can take the task out of the iteration and put it onto the next one. This is called as a skidding. Ideally, it should not be more than 20%.

So whatever is unfinished needs to be rescheduled. 80/20 rule. Most of the time, we follow it. So 80/20 rule is not only in the marketing. It comes almost, these days, everywhere, as we see.

With a 20% effort, if you can understand 80% of your system-- so that means, with 20% of your effort, your specification can achieve 80% accuracy. Now it depends upon what is the tolerance factor of your product. Depending upon that, you will decide how flexible, and what kind of a model you are building up.

Then we come to produce and iteration plan. When we are talking about producing an iteration plan, we will think about the use case priority. We will think about the risk. We will think about the architectural significance, estimate time to develop the use case and dependency on the other use cases. All of these five factors we discussed in the previous slides.

Now we want to develop the iteration plan. We want to produce an iteration plan for this. So let us take at this that what are the use cases? So we have add member, delete member, borrow book, return book.

And then there are others-- borrow book communicates with the identify book. That is an include, so that means must have enter code manually, must have-- we are not talking about-- you can see there is a scan book ID, but we are not putting in direct contact over here because we may have it. We should have it if it does not affect the timelines, or if it doesn't affect anything else.

send Mailshot is there, then Return Book extends. There is an extension over here for pay fine. A fine can be paid by cash or by card. So we want to create the iteration plan for this.

So let us take a look at this. So we decide something like this. These are the factors. Now this is how we can do the analysis.

So we list all the use cases-- return book, pay fine, pay fine by cash, pay fine by card, and borrow book, identify book, enter code manually, scan book ID, delete members, send mail chart, so, all these things, we talked about. Now what are the priorities? Return book, must have.

And risk is medium. Architectural significances must be completed within 60 seconds and easy to use. Dependency is you can return book only if you have borrowed the book. So borrow book and return book go hand in hand.

Pay fine, should have. Risk is medium. There's no architectural significance. Dependency is on return book. So if I write pay fine, and I have not written return book, I may not be able to test it well.

Pay fine by cash, should have. Risk is low because it's just a cash transaction. Architectural significance is none. And dependency is pay fine. Pay fine by card, we could have if it doesn't affect anything else. The risk is high, transaction with the external system is there, so it must be completed within 30 seconds. Dependency is on pay fine.

Borrow book we must have. Risk is medium depending upon the complexity of your system. Complexity of the use case, must be completed within 60 seconds, and must be easy to use. A lot of dependencies-- add book, add member, identify member. Add book, add member, identify member, identify book.

One is missing over here, I think. Identify book also. If you are borrowing book, you must be able to identify the book. Identify book, must have. Medium, risk is medium. Must be completed within 15 seconds and add book. Dependencies on the add book.

Enter code manually, must have. Medium. Must be completed within 15 seconds. Identify book. Scan book ID, should have, if it doesn't affect anything else. Risk is medium because you may be using some external device to scan the code. And must be completed within seven seconds. The meaning of using this is only if it can bring about some more efficiency into the total process. Otherwise, manual is perfectly OK.

Identify book, delete member, should have, risk is low. There is no architectural significance, and add member. Dependency is on add member.

Send mailshot chart, could have. It's the least one. I can send if it is possible. Risk is low. There is no architectural constraints or significance. Add member, dependency.

Now how do we go about iteration plan? Iteration 1 is missing over here. That is about the requirement gathering. Another thing, if we want, we can add that also over here. Iteration 2 says we will do borrow book, identify book, enter code manually, simulation of add member and add book because we are not building these use cases. These borrow book and borrow book is important. So it is dependent on add member and add book.

So what do we do? We simulate that. So we say, OK, we are going to simulate this. But we are starting up with the borrow book.

Iteration three, once the book is borrowed, we can go for a return book, pay fine by card, scan book ID, and pay fine. All right, so if I have to do it, I may alter it a little. I will say return book, pay fine by cash, scan book ID, and I will have pay fine by card. Then I will have.

Iteration 4, add a book, pay fine by card. These should be swiped. So it should be first by cash and then by card. Add member, and then modify member, and, in the end, delete member is a rare case. It is not that regular basis. Add member can be very frequent. But deleting a member is rare. And send mailshot, because it is could have, I may take it in the end, in the last. When everything is done, I still can afford to do it. I will do that.

So with this, we've come to the end of this lesson. In this lesson, we've talked about so many various things. We talked about the methodologies. We talked about the best practices. When and how to choose a particular methodology. And then we talked about the iteration plan.

## 2. Lab 14: Overview of Software Development Processes - 14m

So let us take a look at lab number 14, overview of software development process. There are four activities described. Two characteristics of common methodologies is the first one. Define the five object oriented methodologies. Develop a nutrition plan. And select the appropriate methodologies for the case studies.

So let us take a look at the first one. So in the first one here, I will do it from the solution statically so that I can show you both. Select a statement or statements about use case driven methodologies that are true. So focus on the relationships between actor and the system. That is right.

Based on the notion that software performs activities for users. That is also right, because in use case, we know that softwares are elements which are used by the actors. So A and B are true. Let's take a look at option C.

Use nonfunctional requirements to drive structure of the system. That is not right. NFRs are not a part of a use case model.

Must be iterative. It is wrong, because methodology that is iterative is independent of the use case driven. Iterative and use case driven is not-- these are not part of one another. These are two different things.

Focus on the systemic qualities, such as reliability and scalability. That is not right, because that is meant for systemic qualities. That it's not meant for use case.

The second one, this was the first one. Yeah, this is the second one. Select this statement or statements about the architecture centric methodologies that are true. So focus on relationship between actors and systems is not right. This is work use case.

Based on the notion that software performs activities for users. This is also not right, because this is not related to architecture centric. Uses nonfunctional requirements to drive the architecture of the system is right. This is related to architecture. Must be iterative. Iterative is independent of architecture centric.

Focuses on systemic quantities such as reliability and scalability, yes. That is related to the architecture centric. Then there is a activity two.

So name five different object oriented methodologies. So let us go to the solution itself. So we can see here, oh what fun. Is an iterative software development process created by Booch, Jacobson, Rumbaugh that is freely available for use, extreme programming.

This is coding and testing. So we can see a unified process. So we have to-- oh, I think we have to map it if that is the case. So Unified Process is an iterative process, which is developed by Booch, Jacobson, and Rumbaugh, Extreme programming.

Then we have Scrum, and then Waterfall. And then we have RUP, because we can see the methodology uses a single phase in which all workflow proceed in a linear fashion. So this maps to Waterfall. And a commercial implementation of unified methodology is a Rational Unified Process. And Scrum is a team oriented framework where Sprint produces a working version of the software.

Coming to activity three, here we are producing an iteration plan. So we say reassess the priorities and risks for the use case form that you created in activity two, creating use case forms in lab number four. And address the priorities and risks for the remaining use cases that you discovered in activity three, refining the use case diagram. And assess the architectural significance of each use case and construct an iteration plan from the steps one to three.

So we are directly producing over here we have discussed various things. So this is the iteration plan, which we have created. This is for a check in. Let me just walk you back and show you in lesson number four.

This is what we had. So this is about check in process. So this is about check in process.

And here we are talking about another thing. And that is activity three, lesson number three. So here we can see. So we have listed all the various use cases over here. So this will help us to find all the use cases and to create our iteration plan.

So what do we do here? Let us come back to lesson number 14 and exercise three. So first, iteration is about requirement gathering and drawing on the use cases and all those things. Iteration two, we create reservation, because this is our main use case. So it starts in the beginning.

We will do a simulation of customer data. We'll start with the chicken customer. And then simulation change room. And change room, form status. Iteration three, we will perform the card payment transaction, add the charges to customer's bill, check out customer. Iteration four, we will perform the payment cash transaction, create the customer, and change the room form status.

Iteration five, we will update reservation, identify existing reservation, and adjust customer's bill. Now here, we can see, because update reservation is coming at the fifth titration. So that time only, we require for the first time identification of the reservation. Till that time we do not require the identification of the reservation, so we will postpone it till that level.

Identification reservation is already done, so iteration six goes for delete reservation, for which we again use the identify existing reservation. Create promotion, register customer's loyalty card. OK, this can come at a later stage. Add loyalty points.

Seven is request list of vacated rooms. That is for your internal use. That can be done till the use case is being implemented otherwise also. Mark room ready for use and generate nightly reports.

Iteration eight, we retrieve the reservation statistics. This is required only at a later stage. Once some reservations have been put in and some activity has taken place, so we can delay it up to iteration eight.

Modify the promotion and generate discrepancy report. And in the end we will publish special promotions to customers, notify guests of today's reservation, and modify customer.

Activity four is about identifying the various methodologies. So there are, I think, a few case studies over here. Let us take a look at the first one. So in every case study, what do we need to do is we need to read the scenario and select and justify the methodology that is appropriate for this particular case study.

So the case study says Acme Insurance Corporation wants to create system for entering and storing insurance policies for its over 200,000 worldwide customers. AIC has a small development team-- small development team, please remember-- with four people who will work on this project consisting of one project manager who also writes the documentation.

What does it show? It shows that you have people who can perform multiple roles and three engineers. The project manager has been asked to keep documentation on all the phases-- that means it is documentation heavy-- of the project using the newest ISO documentation process.

What does it tell you? It tells you it is documentation and process heavy. Do you get any guesses? Yes.

Let us take a look at that. It is certainly I think we reached at the wrong place. So here we come. Certainly, it is a unified process. Certain architecture methodology or Rational Unified Process. Any of these can be used.

What is the justification? Justification is members have flexible roles. Medium to large scale project. And company is process oriented, because we are talking about ISO, all right.

The second case study is about-- so we say nolycra.com is a small start up company that produces cycling jerseys. The company is located in a small warehouse that include all business functions, like sales, marketing, manufacturing, shipping, and so on.

Nolycra.com has become known for its unique jersey designs featuring bright colors and nontraditional fabrics. Nolycra.com has recently hired two computer engineers from a rival company to create an inventory control system that tracks its customers orders and its inventory level. These engineers were recruited by nolycra.com because they had created an inventory control system.

So the key is had created previously inventory control system at the previous company to help products quickly to market. So maybe we can think about XP or Waterfall. We are not talking about a lot of documentation.

Company culture favors experimentation. Teams are in close proximity, and the company has two experienced programmers. Could lose Waterfall, because similar system has been already developed by the engineers at a previous company.

The third scenario is a contractor has been hired by Bravo software to do analysis and design for an XML based system that can store solutions to common technical support issues. The contractor will be working with a small team of employees to design and implement the system. Most of these employees have technical experience, including technical writing, engineering, testing, graphical abilities.

But they were hired as technical support analysts. One of TSAs suggests that the team uses rational roles to help with the project, because Bravo owns the lessons to this product. So the same TSA also reminds the team that they must follow the product life cycle process when developing and delivering the new system.

So Rational Unified Process or Unified Process can be used. Members have flexible jobs. Medium to large scale project company is process oriented and it has license for rational roles. And with this we come to the end of lab number 14.

