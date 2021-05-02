# 4: Creating Use Case Scenarios and Forms

1. Creating Use Case Scenarios and Forms, Part 1 - 30m
2. Creating Use Case Scenarios and Forms, Part 2 - 34m
3. Lab 4: Creating Use Case Scenarios and Forms - 9m

## 1. Creating Use Case Scenarios and Forms, Part 1 - 30m

Let us talk about use case scenarios and forms in Module 4. Objectives of this module are to identify and document the scenarios for a use case. Using these scenarios information and a glossary of terms, Supplementary Specification Document, which contains non-functional requirements, risks, and glossary of terms, we will build a document which is use case form.

We are about to perform over here. So we are in the Requirements Model. And in this first, we will talk about to discover the use case scenarios. Second, we will build glossary of terms and Supplementary Specification Document, also called as SSD.

And we will talk about the use case forms. We will learn that how we can build a use case form. And that will be the last document which we will create in this lesson.

Let's talk about the use case scenario first, what a use case scenario is. We have built the use cases yesterday. We talked about create reservation, create reservation here. And in this, we had other participating use cases, like identify customer. And we had another extension point called as new customer.

When we perform this use case, we know that either this will be executed, or this will be executed. Both are not executed. Right? So use case scenario tells me the user stories, which we can relate to the use cases.

So use case scenario can be called as a concrete example of a use case. That means use case specifies a general all the possibilities over here. If it is a new customer, then we will go for this. If the customer is coming for the second time, we will go for identify customer.

But in the use case scenario, as it is a single instance of a use case, we do understand that not both of these will be present together. One of these will be dead, depending upon what is the runtime instance at that time.

So when we create use case scenarios, we follow certain rules. Number one, we should be as specific as possible. Sometimes, even we go to the level to describe the use case scenario, we use the actual names of the people who are working in a particular company and for whom we are creating the use cases.

But that can be done with a mutual agreement. And those documents will remain confidential to that company. The names are used just to bring the effect of reality, that this is how the actual thing will happen when it is put into the software form.

Another very, very important point about the use case scenario is that use case scenarios never ever contain a conditional statement. Like this particular part of your use case contains an if statement. We say, if custstatus is equal to new, then execute new customer, else do identify customer. OK?

So this state will not be there. So we will depict in the use case scenario this? We will create two different use case scenarios. So from that, we understand that, for a single use case, there can be many scenarios, right? There can be many scenarios.

So that means how many number of scenarios we can have for a particular use case? Sometimes, maybe 10, maybe 20, maybe 50, it depends upon the complexity of your use case. It also depends upon how many variations, various type of branching you are doing on the use case. So every branch will make a new complete scenario.

The next question comes, how many you should code, how many you should write, how many use case scenarios I would like to document. Now the question is, the reason why we write the use case scenario is to listen to the user's stories. So when you listen to the user stories, and you document those stories as a different case, you understand the complete flow of the requirement. The purpose of writing a use case scenario is to understand the requirement completely.

So if you're experienced and if you understand the requirement by writing no use case scenarios, it's perfectly fine. But if you want to write the use case scenarios because the use case is complex, maybe you can code all the major ones. You can document the major use case scenarios. So there is no hard and fast rule that how many use cases scenarios must be documented.

Now, another thing about the use case scenario is all use case scenarios will begin in the same way. The reason for that is because you are writing the scenarios for the same use case, so every use case will begin in the same way. Maybe you will take some inputs from the user. And then, when you come to the processing part, there you will see that there is a diversification. There is a branching over there.

Now we will begin all the use case scenarios in the same way. But depending upon the complexity and the branching, we may end up use case scenario 1, use case scenario 2, use case scenario 3, and use case scenario 4, and so on. That means every use case scenario will be different by the end.

Now when these are different by the end, what makes them different? It is the flow. It is the workflow. You are documenting the workflow. So when you are documenting the workflow, all these will be ending up in a successful achievement of what we want it to do in that particular use case.

Like, for example, we wanted to create reservation. Now will all these four use cases end up in creating a reservation? Or will there be any other possibility? Now, for example, if use case scenario talks about a new customer and this talks about identify customer and the rest of everything is OK, both will end up into a successful end. Right?

But here, another two, maybe rooms offered are rejected. All right? Or maybe the payment guarantee failed. So that means these two will end up in failure. OK? These two will end up in the failure. So this is something about use case scenarios in general.

Now, selecting use case scenarios. As we discussed, where it is ideal to have multiple use case scenarios, it depends upon the complexity of our use case. If the use case is complex, we require more number of use case scenarios. And if it is a simple one, sometimes, we don't need even a single one. It depends upon the number of failure points and the various workflows for the successful use case scenario. Right?

So as we saw, that there can be a chance that we may write a number of use case scenarios for a single use case. But ultimate is only two things. One thing is that you may have a use case which end up in a failure. Or you may have a use case which ends up in success.

So when a use case is a failure, we call it as a "sad" scenario. Or it is also called as secondary scenario. And when the use case is successful, we call it as "happy". Or we call it as primary scenario.

Now, how do we write the use case scenario? How do we write the use case scenario? The use case scenario is just like telling a story. You watch a movie. So movie has a beginning. Movie has the mid, where the bulk of that story line comes. And then there is an end, which is a happy or which is sad one. Right?

Use case scenario is a great metaphor for the story. It is just like a story. It has the beginning. It has the middle. And it has the end. So let us see how we can write this story.

So here is an example. Let us take a look at the example for a successful scenario, which is also called as a Primary Scenario. So the story begins.

We say a use case begins when a booking agent receives a request to make reservation for rooms in the hotel. So this is the beginning. All the use case scenarios for this particular use case will begin in the same way, with the same statement.

Now comes the process, the workflow. So we say the booking agent enters arrival date, the departure date, and the quantity of each room that is required. The booking agent then submits the entered details, you know, whatever the information needs to be provided by the booking agent.

The system finds rooms that will be available during the period of the reservation and allocates the required number and type of rooms for available rooms. So you are searching for the rooms. And you are seeing that, for these arrival and departure date, what type of rooms and how many are available. So you're making a list out of that.

The system responds the specified rooms are available, but it returns the provisional reservation number, and marks the reservation as "held". It's not yet confirmed. The booking agents accepts the rooms offered. So this makes image.

Story doesn't end here. We have still more to tell. So we say the booking agent selects that the customer has visited one of the hotels in this group before, and enters the zip code and the customer name.

So you see the beauty of it over here. We are not using any if statement over here. We didn't say, if the customer has visited, then do this. Otherwise, go for a new registration.

We are not using that. We are straightforward, assuming the customer has visited. So this is a workflow when the customer books a hotel room, the customer is an old customer.

Say, if it is a new customer, that will be a total different thing. We will say the booking agent asks the customer to fill the customer detail information. And then it will continue from there in the same way.

So the system finds and returns a list of matching customers with the full address. And the booking agent selects the right customer, the valid customer. And the system assigns this customer to the reservation. The booking agent performs payment guarantee check. The check is successful.

Again, another point where we could have used branching. Maybe the payment guarantee doesn't get through. So in that case, what? That will become another use case scenario.

So we are assuming everything. So in the successful scenario, you will have all the possible things which are always ending up into a positive. There may be multiple cases over here.

Now the end comes. We say the system assigns the payment guarantee to the reservation. And the changes that the state of the reservation to "confirmed". The system ends-- or you can say the use case scenario ends-- by returning a successful reservation ID to the booking agent for getting the further booking details.

Now, let us take a look at a secondary scenario. Now the beginning is same. We say the use case begins when the booking agent receives the request to make reservation for the rooms in the hotel. So it is the same as previous.

The booking agent enters the arrival date, the departure date, and the quantity of each type of room that is required. This is also same. And the booking agent then submits the entered details.

So until this, everything is same. Now comes something else. We say the system responds that there are no rooms available. So you cannot go ahead with the process. So that becomes a sad scenario. So the use case ends.

The question is, could we have another successful or sad scenario? Yes, many, because the other success scenario will be where customer is a new customer. And another sad scenario will be where the rooms are available, but the booking agent doesn't like the rooms. So the rooms are rejected.

There can be another failure point where we say, OK, the payment guarantee doesn't get through. There can be another successful scenario. Payment guarantee, there are not sufficient funds. So the reservation status is put onto hold. And we say, OK, when the fund comes, then the process will get through.

So these are the various possibilities. Let's talk about Supplementary Specification Document. Now this is a document which contains a lot of information which is required by many use cases. We may have common information. Like, for example, we may have some common risks to all the use case scenarios.

We may have certain common business rules. Maybe you want to do a validation for the log-in. Or maybe you want to do validation for date. So these kind of commonalities can be put into a central place, what we call it as a Supplementary Specification Document.

So we put all the common details under various headings, NFRs, Non-Functional Requirements, which contribute to the quality of service of your product.

Project Risks, there can be variety of risks. Like there can be risks related to the skills requirement. There can be risks related to certain political situations. There can be risks, lack of finance, or the budget is small for a particular project. There can be a risk to convince the stakeholder for uses of certain technology and so on.

We'll talk about the risks later in much more detail. Then we have Project Constraints. Constraints can be a certain technology needs to be used, for example.

And then we have Glossary of Terms. It's an interesting document, because it is a living document. As we go along with the project, we keep on discovering new terms. And every term which we use in our project has to be present in the Glossary of Terms.

So we will see in the next to next lesson, that is in Lesson number 6, that will be a good place where we try, at least, to finalize our Glossary of Terms. And we try to unify the multiple terms.

At this point of time, whatever the terms are coming, these terms may be repetitive or duplicate terms, two terms used to represent the same definition or same process we may be using at this point of time. But later, we will unify these. And we will bring out a final document by the end of the product.

So these are the various documents which we like to create. Let us first take a look at how we document the NFRs. Now, what an NFR is.

As we have been talking from some time, that it represents a quality of service. So what kind of a quality of service we are talking about? Non-functional requirements always talk about the quality. Like for example, here, on the slide, there is an example of an animal.

Now, what are the different features for an animal we can have? Maybe color of the skin. There are stripes on the skin. Or how it looks like, OK?

But there are other features which are abstract, or you can say, not as descriptive, like, for example, agility, the strength. So these are the internal features of an animal.

Now the project never fails, because functionality was not implemented. Because you will be very careful, you will never release a product which does not meet the functional requirement. Right?

So what fails your project? The failure of the project is usually contributed to the quality of service. That is the non-functional requirements, like how fast a processing can be done. How many users can use a particular use case at a time. OK?

If we want to add some new functionality, how long will it take? Is there a facility that I can extend the existing functionality? So all these add to security.

Is your particular use case secured enough? So all these may lead to the failure or success of your project. These are the internal properties of your project or your software.

So we can say any adverbial phrase can be an NFR, scalability, flexibility, performance, reliability, availability. There are a lot of.

Now, let us take a look at how do we document NFRs in a Supplementary Specification Document. I will refer to Supplementary Specification Document further onwards, mostly, SSD. So remember SSD is a Supplementary Specification Document.

Now NFR1, put a colon. And right over here, you can see this. So we say NFR1, put a colon. And we say, the system must support 200 simultaneous users in a Web application.

So that means minimum users supported right now, must support. Minimum is this. So in another place, I may document separately that, OK, that will be a part of extensibility or scalability where we say, OK, can we-- not extensibility. Sorry. It will be scalability-- can we support another 50? Or can we support another 100?

Right now, 200 are using. But are we doing the capacity planning of our system in such a way that, OK, easily, another 100 can be accommodated? Right?

NFR2, The process for completing any reservation activity must not go more than 10 minutes. So that means, after the user has entered the data, the total process must be completed within 10 minutes. So what happens if it does not complete within 10 minutes? So that will also be documented. You will have interruptible region, and you close the process after that.

NFR3 says, the capacity of reservation records could grow to 2,600 per month. Now this is a very, very important point. This will lead us to decide about which type of a database we need to use.

I remember one of the cases in my early days when I just started working in the industry. We wrote one software where the customer-- that was the good old times, when people used to hide things from the computer professionals, because they think it is very costly to get the software done.

So what happened, they told us that they had around 2,240 transactions in a month. And we were using very old time. We wrote that software using a very, very old database called as a dBase III Plus.

So when everything was done, we deployed the software. After six months, the person came to us and he says, what you have written? Because it is taking 30 minutes to get a report.

So then we went. We saw what is happening. We came to know that the number of records being told were not like that. He was having more than 300 transactions in a month.

So thank god there was a document telling that these, these, these are being-- these requirements have been freezed. And there was a signature of the client and of us.

But it was like this that we had to rewrite the whole of the thing. Right? So saving money, it costed something more.

So it is very, very much important to understand which kind of a database. Then we change the database. We run for FoxPro with Clipper. It's an old-time thing. Now, I think, nobody is using all those things.

Then we have NFR4, which is related to security. We say, OK, Web access should use the HTTPS transport layer when critical customer information being communicated, maybe authentication. Or maybe you are sending some information about your credit card number and so on. So we should use the secured protocols.

Numerical accuracy, very much important. Sometimes, we feel, OK, it is a rounding of only of 0.5. But if the transactions are in bulk, I think things are different.

I saw an English movie where people started stealing the round-off figure, some point, 1% or something. And I think, oh, in a period of some few months, they became millionaire. So it affects.

Then a normal NFR, which is, I think, common to almost all the web applications, that is system must be available 7 by 24 by 365 99.999, is usually the standard for availability. And historical evidence, there are approximately 600 reservations per month per property.

So we must see the variation. Some months, it may be more. Some months, it may be less. But we should not stick onto the least side, we should come to an agreement sometimes. We always consider the highest value, because it is going to affect the ultimate performance.

So the search for available rooms must not take more than 30 seconds. mostly, when you are searching and when you are performing some communication with the external system, like payment or a payment kind of a thing, then we always restrict it to a smaller period of time, because there is always a chance of a security breach.

And then we have Glossary of Terms. Now, Glossary of Terms, it's a living document. It keeps on adding new terms, as we discover the system. Or sometimes, even at the point then we are maintaining the system, we may find some term which we have skipped and which carries a certain meaning for the people associated to your project to know something.

So sometimes, some terms are defined incorrectly in the beginning. And we would like to redefine the terms and so on. So here is an example.

Just like we have a dictionary, we will create a document. Say we say, Reservation, Date Range, then Room, Payment Guarantee, Basic Rate, Room Type. These are all related to a single use case.

So Glossary of Terms will contain the information related to all the use cases. Maybe some details will be there which are pertaining to check in or check out or various use cases. Everything will be put over here, centrally, in the single place, called as a Glossary of Terms.

Now when we are creating normally, the trend is when you are representing certain term which is a part of the Glossary of Terms, that term will be either depicted with a different color, or it is depicted by making it bold, or italic, or something like that.

So we can see over here, we say, "Reservation, an allocation of a specific number of rooms, each of a specified room type," in quotes, "for a specified period of days." So "room type," we see is another term in the glossary.

So like this, we can see we can define the various terms. For example, "Room" is a big definition. We say, "A resource that can be allocated to a reservation, and is occupied by that reservation customer and their guests for a date range of the reservation. A room is identified by either a room name or a room number. Each room is assigned a room type." So like this, we will create a big document which contains everything.

## 2. Creating Use Case Scenarios and Forms, Part 2 - 34m

 
So another tool which can be used to record the detailed analysis of a single use case and all its scenarios is called as a use case form. Now, a use case form is not a standard document. It is not a document which is as per UML. But this is a common document which is used by many companies, and it doesn't have a standard form. Various companies use various forms, depending upon their needs that what kind of information they like to record related to a certain use case and all its scenarios.

Not here in this particular slides, you will see the use case forms are quite in detail. So let's take a look at what do we put into the use case form? Use case form is usually recorded as a two-column tabular document. The first column contains the form element name, and the second column contains the description of every information, or you can say the element.

The first element which we put in the use case form is a name of the use case. This name is taken from the use case diagram. Then we write the description about the use case. Of course, we saw in a use case scenario, we had a big description about the use case. But here, we give the general information about the use case, and not all its scenarios-- what the use case is meant to do. Just to describe the high level functionality for which the use case has been created, in two or three lines maximum.

Then we list all the actors-- primary actors, secondary actors. And if we are using certain notation-- like, for example, we may write like this. Online booking, agent, and the customer, and the travel agent system. All are represented by booking agent. So we can list all the actors. And down we can make a small note telling that all these three are represented by a single name called as a booking agent. Do not consider booking agent just as a booking agent.

We will also list the secondary actors. We talked about the primary and secondary actors in a use case lesson. A primary actor is the one who initiates a use case, and is interacting with the use case throughout. But the secondary actor can be the one who is interacting only for a period of time.

Now here, people have different opinions about the secondary actors, because we are listing over here, so we should know. Some people think that if a user is interacting with the system, say, for 8 hours, and the person goes for some, say, lunch break-- say 30 minutes-- and for those 30 minutes, somebody else is coming. Maybe a receptionist will be sitting at the place of a booking agent. And should I consider receptionist as a secondary actor?

But as per my understanding, what I feel is, because we are representing all those people, an actor is not actually a person, but actor is a role. So I will consider over here, the secondary actor is only that actor which is interacting with the system only for a period of time. Like we gave example yesterday, according to my understanding, I will say a secondary actor is a payment guarantee system-- the payment system, the external system for which the system interact only for a period of time.

The whole use case, you are interacting. And then you go to one external system, get the payment verification, and come back. So I will consider that as a secondary actor. That is my assumption over here.

Then we discuss about the priority. Now, priority can be discussed with the client side stakeholder. Priority tells there is a MuSCoW. So we say, must have, should have, could have, or won't have. Some people think-- we can say it is not a definite study. People put their own opinions. Everybody have their own understanding. And the solutions also which we create, we don't have perfect solutions or right solutions. There are only good solutions or bad solutions.

And there are mutually agreed solutions. You and customer both understand the situation, all the constraints, all the risks, and you mutually agree that, OK, this solution serves my purpose. So need not be the best one always. So I will consider won't have also over here. That's why I said this.

Must have. That means it is a main use case. Without this, you cannot. Say, for example, I have identify reservation is a use case. Right? But that is dependent on create reservation. If reservation is there, then only you can have identify reservation. Identify customer. Again, dependent upon, it is a part of reservation. So if I'm talking about create reservation, I will put it in a category must have. Right?

Should have. Like for example, you identify a reservation, and you are providing a facility that a reservation number is to be taken from a certain document, say, for example. Or say you are talking about a library information system, and you want to identify the book, because you want to give away the book to a member. So what do you do? You enter the book number from the keyboard. Must have. Right?

But I should have. In should have, I will put, maybe I can scan the number. I should have scanning if it brings a better performance. If I take five seconds to enter the book number, but my scanning takes 10 seconds, then I won't have. Right? So should have which brings something better to your system, and you can afford to have it, you will put it as a should have.

Could have. Could have is, it doesn't bring down any other possibility. Like for example, it will not take longer time to develop this part of your use case. So you will say I could have if it does not affect anything else-- time line or budgeting of my system-- I could have.

Won't have. Now, what do we mean by won't have? So it is kind of a future vision. No, I won't have this time. But if everything goes well with my product, I would like to include it in my next release. That can be won't have.

Then we talk about the risks. Now, risks are categorized into three different categories. We have a high risk, medium risk, and a low risk. High risk can be the use case is very complex. Or the high risk can be your use case interacts with external system or with an external device. So when it is interacting with external system or it is interacting with external device, there is always an element of surprise over there. Right? So that makes it a high risk use case. Medium is it is complex but manageable. Low means, for example, you're entering data from the keyboard. That is a low risk.

Now, the next is preconditions and assumptions. To carry out a certain use case, I will always have some assumptions. Say for create reservation, assumption is that room exists. And of course, this is a precondition. If there is no room available, I cannot have a reservation. So these kind of preconditions. Say I want to create a stack of something. The first precondition is stack should be there. Then only you can place something into that. You want to share book. Book should be there. Then only you can perform the activity of issuing a book to somebody.

Then we have extension points. A list of any extension point used by the use case, like create a customer was an extension point. Payment guarantee was an extension point. We are referring only the create reservation because we have studied that entity. Extends. It is a list of any use case that this use case extends. Now, one is a extension point. Extension point can be the condition why the extension is taking place. And the name of the extent use cases will be also listed in the next record.

Then we have a trigger. Now, what do we mean by trigger? Trigger means something which initiates something else. So a trigger is the condition that informs that the actor that the use case should be invoked. The booking agent says, I want to book a room. That is a trigger. That is a initialization, or you can say, initiation of a particular use case. So that is called as a trigger.

Then we have flow of events. Now, flow of events-- a trigger. Let me come back to the trigger. Trigger can be considered as the beginning of your use case scenario. That is your trigger. And the flow of events is the middle. Now, flow of events can be categorized into two different categories over here. One we call it as a primary flow of events. And the second, we call it as a alternate flow.

Now, the primary flow of events is like a happy scenario. Or you can say, main flow of events. Say, after you entered the data, then search rooms. And then there can be, for example, select rooms. Identify customer. Make payment. Return confirmed reservation ID. This is your main flow. Right?

Now what about alternate flows? Let's take a look at this. We said enter data. The alternate flow says, validate date. Is the format correct? Validate date that arrival date is less than departure date, and both are greater than current system date. This contributes to the alternate flow. There can be many alternate flows like this. We will see when we go to study our create reservation.

So this makes an alternate flow-- the secondary traces of the user action need not be only a sad scenario. Something which you want to do out of the regular activity. So all your validations, these also contribute to the business rules. Alternate flow will also contribute. Now for example, when we say, as a part of the alternate flow, I will go to check for the date. So this will also make something called as a business rule. We will see the difference between the alternate flow and the business flow when we talk about a particular use case.

Then we have post conditions. The conditions that shall exist after the use case has been completed. Now, what is the post condition over here? The reservation failed, or the reservation was confirmed. So returning of reservation ID can be considered as the post condition.

Business rules. It is a list of rules that must be complied with, and that are related to this use case. Now, here's an interesting part. Just like we said in our SSD-- Supplementary Specification Document-- we talked about we are going to document NFRs, glossary of terms, risks, and constraints. We can also document business rules in general.

When the business rules are related to many different use cases, rather than repeating these business rules in each and every use case form, what can we do? We can put it in a central place. And maybe we can do something like this. We can say, BR1, and we write our first business rule. We can say, BR2, and we write our next business rule. Just like we did with NFR. We said NFR1, and we wrote the first one. Then we said NFR2, and we said-- and so on. So we will see how we refer these NFRs and business rules, if these are documented at a central location in the SSD.

And then we have NFRs. NFRs pertaining to this particular use case, business rules pertaining to this particular use case will be put over here. Whereas we understand that all the common business rules and NFRs can be put into SSD. And then we have notes.

Now, notes people use in a different way. Some people like to use the notes at the end of the use case form, and put point number 1, 2, 3, 4, and write all the notes. Maybe use case is throwing some exception. And some people, what do they do? They will have a main flow, and they will have alternate flow of the activities. And then they will have exception flow. Exception flow-- what exceptions this particular use case is throwing.

Maybe you are providing a facility that only the existing customers can book the room for a certain type. When you have deluxe rooms or suites, these can be given only to the gold customers. So when somebody tries to book, you can say the customer status invalid. Invalid customer status exception is thrown. You cannot book this room. So exception flow also sometimes people will add.

And sometimes people will like to use the notes like this. Number 1, number 2, number 3, number 4. First one is related to actors, second is related to some pre-condition, and third is related to some kind of an exception, and so on. But some people like to code it in a way that say, if I am talking about actors, in the actor column itself, below the description, I will write a note. And that note will belong to the actors. So this is a general form. This is what we can include in a particular use case form.

Now, talking about the description of the use case form now. So some methodologies recommend that we should go for more analysis or less analysis of the use case. There is a entire pattern, I will say, called as a analysis paralysis. You are so much into analysis that you are never able to come out of it, because you are never satisfied. You are a perfectionist. And you will never have a perfect system.

Your understanding-- you started from a very small thing, and you say OK, if this happens, if this happens, so we should not go to that. There should be. That is why we have a freezing of requirements. We would like to baseline it. Finish it off. After this, we will see what happens.

So the use case forms, as we discussed earlier, are not standard. And there are a variety of forms which are available. OK? Now, how do we create a use case form? Very simple method. The simple method is whatever the various elements we have, we take a look at every element, and record the information. Like for example, determine a brief description of a primary scenario. That will be your description of the use case.

Determine who are the actors who initiated this particular use case. They will become the primary actors. Identify the other systems interacting with your system, or other people, or other roles interacting with your system, maybe, for a period of time. They will become secondary actors. Determine the priority of this use case. You can discuss it with the stakeholders.

Determine the risk. See how you can talk with the stakeholders your common understanding about the complexity of the use case and interaction of your system with the external systems will help you to understand the risk factor. Extension points. And then pre-conditions, we are making certain assumptions. If this is there, then only this use case is possible.

Determine the trigger. We will get it from the beginning of a use case scenario. Determine the flow of alternate and the main events. List all the major tasks to be carried out in this use case. And then [INAUDIBLE]. What you will do in this particular step. What are the details? Is there any branching? Or is there any sub use case which you want to execute? Sub use case doesn't mean we are talking about inheritance over here. I'm not using the terms of Java over here.

After we have to determined the main and the alternate flow, we'll determine the business rules. What are the validation checks? It is mostly like, if you want to test something, certain condition, that will go in the business rules. We'll determine the post-conditions. Determine the new NFRs from discussion with the stakeholders. Maybe you have listed a group of NFRs. And when you talk to the stakeholders, you get to know there is something more. So that can be added over here.

Add notes for information. You can get information from a lot of places. You can talk with stakeholders. Stakeholders does not mean over here only the business owner. Mainly it will be the users at this point of time.

Then let us create our use case form. So we create a use case form for a use case name called as create reservation. So second point is description. We write the description. We say the customer requests reservation for hotel rooms for a date range. If all the requested rooms are available, the price is calculated and offered to the customer. If details of the customer and payment guarantee are provided, the reservation will be conformed to the customer.

So you can see, it is not a scenario. It is a general information about the use case, which certainly has a condition where we talk about if details of the customer and payment guarantee are provided. Then we list out all the actors-- booking agent, online booker, travel agent system. Note says primary actors are proxies for the customer. Now, secondary, it says none. You can add a payment system over here as a secondary actor.

Priority-- must have. It is essential to the system, because this is the main or a central use case, without which many other use cases are not possible. Risk is high, because it is complex. Risk can also be considered as high due to another two reasons. One, variety of actors-- many actors are interacting with this use case. And the system is interacting with an external system for the payment guarantee. Trigger, a customer wishes to make a hotel reservation.

Pre-conditions-- at least one room exists, and a primary actor can be identified, because the primary actor is the one who will initiate this use case. Post-condition is a reservation is added. Payment guarantee details are recorded. So what are the outcomes of this particular use case.

Now, you can see an interesting way of representing the NFRs over here. So we can see, we said the NFR1, that is a simultaneous users. So NFR1, we should go and look into SSD now. What is NFR? So we are giving a hint. It is about simultaneous users. NFR2, duration of the use case. NFR4, web security. NFR6, the availability of the system. And 8, where we talk about the maximum time for room availability. The details of these NFRs can be seen in the SSD. The details can be seen over there.

And then we write the notes. A fast method of checking room availability is still under investigation. Now, this note is pertaining to the NFRs, because NFR is talking about the maximum time for the room availability search. And here you say, OK, it is still under consideration.

And here we come to the main point-- that is, the flow of events. Now, flow of events talk about the main events. And then we will talk about the alternate flow. Now, let us take a look at in between the main flow and alternate flow, we have something called as a difference analysis. So we say we perform the difference analysis between the scenarios used in the main flow and each of the other scenarios.

That brings about the alternate flow. So we determine the alternate flow from the secondary and the remaining primary scenarios. Alternate flows-- what is it? It is the steps that are different between the scenarios used in the main flow and in the other scenarios.

Now, we're ready to take a plunge into the actual workflow. So we say, OK, I will draw a simple thing, because otherwise we have to keep on moving in the screens. Let us take a look at. We will just take a glimpse of it, how we can interact with three different things over here. One is a main flow. One is a alternate flow. And other one is a business rules. So let's take a look at this.

So we say, OK, use case starts when the customer requests to create a reservation. Sequence numbers are important over here. So sequence number 1 says the customer requests to create a reservation. Sequence number 2 says customer enters the various information-- room type, arrival date, departure date. And then, 2.1. 2.1 means it is a sub flow of 2. Now at 2, when we say customer enters the room, arrival date, and the departure date, in bracket you have A1 and A2. That means go to alternate flow A1 and to A2.

Now let us see what is it. A1 says, customer can enter duration instead of departure date. You are inputting arrival date. And then you say, you are giving a duration-- say three days. So that means you are telling the coder, must identify the departure date from the duration. So then in that case, we see go to step 2.1. And we say A2.

Now A2, what do you say when you go to 2.1? You say system creates a reservation. Now but before that, what do we do over here? We say, failed date check BR1, because the arrival date is being entered. So you want to go to BR1 from here. So what did you do? You said, say for example this is your main flow. Let me not put the number.

So we entered the say, arrival date. The alternate flow says go to A1. A1 said, that maybe for departure it is a duration. And then we go to A2 and from there we say go to BR1. Now, let us see what is a BR1. BR1 says over here the arrival date must not be before today's date. So that means arrival date should always be after today's date, because you're still booking. And the departure date must be after the arrival date.

Sometimes people will put the BR-- another business rule related to something that the people are following a particular date format. But that can be accommodated by using some particular method-- by using some kind of a picking the date from a calendar or something like that. So those kind of validations can be avoided. These need not be a part of your business rule. Business rule says the logistics, the workflow.

Now, so we go back. And in the alternate flow we say that BR1, if that is the case, notify the error to the customer, and go to step 2. That means re-enter the date. Now, once that has been done, we say system creates reservation and reserves rooms by applying BR3. So we go over here. Now, complying with BR2, the system determines the required rooms are not available. System upgrades one of the rooms.

So we can see, maybe when you ask, the rooms were not available. And maybe there's a facility that we are checking that are any rooms getting upgraded. So here we say, OK, overbooking is not allowed. The business rule says overbooking is not allowed. So like this, we can see that all the scenarios which we have-- all the primary scenarios and all the secondary scenarios-- although we did not write individually each and every one. But at this point of time, we have to have a complete workflow of our system. How does a particular use case will work.

At this point, we may avoid to write certain scenario. But at this point, we cannot leave any off the workflow. So maybe we can take a look quickly over here. So we say, system calculates the quoted price applying BR4. So BR4 talks about the sum of the base price of the room type after applying BR5 and 6. So you can see from one point how the flow is moving on to others. BR5 may talk about the seasonal adjustments. BR6 talks about the offer adjustments. So after putting all these three.

Now, you may have a confusion about what is the base price? That means from there you need to go and look into the glossary of terms, what do we mean by base price. So what does it contain? So this way, we will take a look at every possibility-- all the main flows. Then we say system records the quoted price. System notifies the customer of reservation details, including the rooms and the price. Customer accepts the rooms offered.

What is the alternate over here? We say rooms offered are declined-- rejected. Didn't like the rooms. So from there, you directly go to step A9. What do you say? Use case ends. No further questions. Cannot continue. Right? So here we come back and we say, OK, if the rooms are accepted. And then we say extension point. So we can see all branching, all complexities are being incorporated over here in the use case form.

So payment guarantee, A7. We go over here. So A7 talks about payment guarantee fails-- notifies the message to the customer. Go to step 3.2. So 3.2 says extension point again. So there may be a chance that you're giving one, two, or three chances. First time it fail. Maybe customer you are communicating, and the customer will say, OK, let me check it out with the bank. Is there any problem? It may pass for the second time. So if everything is OK, system will set the status of reservation to confirmed, and the system notifies the reservation is confirmed, and it ends.

The other possibilities-- we can see A6, we identify the customer, and we say OK, if it is already existing, we try to identify. Otherwise, we go to A8, the customer is not found, go to step 3.1. Maybe there you're putting a condition that, OK, add the new details of the customer. So this is how we can see the various business rules when you can put the reservation to held, when you can put the reservation to confirmed. Reservation must be linked to at least one room. So these are all of the business rules.

So with this we come to the end of lesson number 4. We talked about what is a use case scenario, which represents the various workflows to understand the user stories in a proper way. So one user may tell you only the story that, OK, the customer comes. We assume that the customer is there. The second user may say, OK, if the customer is not a member already, we input the details of the customer. So all the various stories are being documented, you can say over here.

And the scenarios will provide the various situations. There can be happy primary scenarios, or there can be sad secondary scenarios. We have documentation of risks, documentation of NFRs, project constraints, glossary of terms, business rules. And then we create a use case form, which is not a standard document.

## 3. Lab 4: Creating Use Case Scenarios and Forms - 9m

OK. So let us talk about Lab 4. Lab 4. provides three exercises, three activities. The first one is about the scenarios. Second one is about the use case form. And third one is about the glossary of terms.

So let us go to the first activity. We have been given various possibilities over here. The key facts of the check in use case that were determined during the meeting with some of the stakeholders. So that means this is an additional information.

A reservation can be identified by customer name. So there is a possibility that multiple customers will be there with the same name. And we have to pick up the right one. And we may not find the right customer if the name is not spelled properly.

The customer may be given the option of upgrading any reserved rooms. So that means additional costs will need to be calculated. The customer may ask to change any of the booked rooms for an alternative room of the same type. That means there is no adjustment in the payment, but certainly there will be a change in the room number and type.

Payment preauthorization may be obtained unless already guaranteed by additional services, like meals, beverages, movies that may be purchased. For example, the customer's credit card may be preauthorized with the electronic payment system. If there is no payment guaranteed for the additional services, the customers are allowed to charge any items to their bills.

So we can see the various possibilities over here. If the check in is successful, the electronic room key is generated for each reserved rooms. If check in is successful, the phone is enabled in the room. A Bill-- also known as Folio-- OK, take a look at this, maybe we would like to refer it in the glossary of terms-- is created for reservation.

Check in should take no longer than eight minutes to complete-- a nonfunctional requirement. Upon completion of this check in use case, the rooms allocated are marked as being occupied. Now these are the details given to us. These are the information requirements which we gathered by talking to the stakeholders.

Create a brief description of the primary scenarios. Now, in this exercise, we will see that there can be more than one successful primary scenarios. Create brief description of any other primary scenarios, maybe a multiple, and the unsuccessful scenarios.

Revisit the use case diagram that you will find in Activity 3 and see there if it is correct. If no, then we would like to update the diagram. Let us go to the solution now.

So this is a solution for Lab 4. The primary scenario one, we are writing over here, the customer arrives at the hotel and is greeted by the receptionist. This is a check in scenario.

Customer informs the receptionist they have reservation. The room is found. The receptionist accepts that the rooms are correct. Payment guarantees required for further room charges.

Customer provides the payment guarantee. And the keys are generated. The system creates the room keys.

And the system adds the quoted charges for the room to the bills as the chargeable item. And the quoted room charge type, the system marks the bill as allowing additional charges. So this can be considered as one primary scenario.

Now, what are the additions we are making? Customer does not provide payment guarantee. So the system marks the bill as not allowing additional charges, but the check in is still successful.

Third primary scenario, no further payment guarantee is provided for further room charges. So maybe there are no additional services which are being asked for. Another scenario can be the customer provides the name.

The receptionist enters the customer's name. The system finds only one matching reservation. So you don't need to select the right customer from the list of many customers. That is, again, a primary scenario.

Another primary scenario, the customer provides the name. The receptionist enters the name. The system finds three matching names. And we find the value one.

Secondary scenario can be the receptionist rechecks that the rooms are correct. And the receptionist restarts the check in process. So we can find the various possibilities-- the customer provides the name, the receptionist enters the name.

Maybe the name is not correct. So you have to re-enter the name once again. So this is your first exercise.

Let us take a look at the second one. The second activity talks about the use case form. So we want to create the use case form for the check in process. That is our second activity. The solution is very much here, we create the whole lot of thing. Whatever we have talked in all the various use case scenarios, we put it over here, some description.

What are the actors? Actor is only receptionist over here. So primary actors are the proxies of the customer. Still goes priority is a must have, essential to the system. Risk is medium. Less complex.

So three conditions. At least one room exists in the hotel. I think if this precondition is considered, that some people may come without the prior check in. Now, we can have two different type of check ins. One for those who already have booked, and other which is the otherwise.

So the whole process, the main flow, like the customer arrives, says that the booking is there. Customer gives the name. Receptionist will look for the customer name. There is a list. The right customer will be selected, and so on.

Once everything is done, room keys are generated. Phone is enabled. And the customer is being handed over the keys. The system finds more than one matching reservations, so you have to select the right one.

Post conditions are there. Business rules, reserved rooms must be marked as being occupied. This is a business rule.

As soon as the room is occupied, you have to change the status of the room to occupied so that when some other person wants to book the room, these rooms are not being shown as freely available for the booking purpose for those particular number of days. NFR simultaneous users, duration of use case, and system availability. So this is our second one.

And the third exercise is to identify few business terms used in the scenario in Activity 1 and maybe in the use case. And then we try to write the Activity 3 over here. So we say OK, reservation number, reservation status. Bill chargeable item, chargeable item type, quoted room charge, and the room status.

So these are the various glossary of terms which are being identified. And we have to make sure that these are well defined so that we do not mislead our users, they understand the things well.
