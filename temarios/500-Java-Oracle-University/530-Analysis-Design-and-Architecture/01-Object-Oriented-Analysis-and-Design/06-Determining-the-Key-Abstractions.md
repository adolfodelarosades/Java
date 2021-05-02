# 6: Determining the Key Abstractions

1. Determining the Key Abstractions - 34m
2. Lab 6: Determining the Key Abstractions - 5m

## 1. Determining the Key Abstractions - 34m

 
After creating the activity diagrams, the next step is we would like to identify the nouns in our domain. We will do that by determining the key abstractions.

The objectives of the lesson are to identify a set of candidate key abstractions and to identify the key abstractions using CRC analysis. That is, Class Responsibility Collaboration Analysis.

So we are still in the requirements model. And in this we will determine the key abstractions using CRC. CRC cards look like this. So we will use these cards to determine the key sections.

Let's talk about what is a key abstraction. We also call key abstractions nouns. And it is actually a class or an object that forms the part of a vocabulary of your problem domain.

All the major objects which make the part of domain entities are certainly the key abstractions. The question is, how do we identify? One thing is, whenever we are talking about the demand, we will have certain key abstractions associated with the domain.

Say, for example, when I'm talking about the insurance domain, I will certainly look into insurance policy. I will look into bonus. And I will look into the client, the various types of policies, like a medical insurance policy, and say, a vehicle insurance policy, life insurance policy, and so on.

So likewise, one of the simplest ways is to know your entities by domain. But with this way, you can only find out some major entities. To go about finding the key abstractions, we actually follow a certain procedure. Now, what is that procedure?

We identify all the candidate key abstractions by listing the nouns from the project artifacts. And then we take those nouns and we put it into a form called a Candidate Key Abstraction Form. We will study this form.

We use CRC analysis to determine the ascension set of key abstractions. We identify the objects which have responsibilities, the objects which have collaborators. That means the objects which are associated with other objects.

How do we begin the process? We begin the process by identifying all the unique nouns in the project artifact by using the various documents. We go through Main Flow and Alternate Flow sections of the use case form.

The other sections of the use case forms are like business rules, sometimes nonfunctional requirements. Description of the use case is a good place to find out the major key abstractions-- the use case scenarios, Glossary of Terms, the Supplementary Specification document.

So all these documents we go through, and we underline. Or we note down or highlight all the nouns. So here we begin.

So first we take a look at the Reservation Use Case Form. So we say that customer requests a reservation for hotel rooms for a date range. Then, if all their requested rooms are available, the price is calculated and offered to the customers.

The details of the customer and payment guarantee are provided. And that reservation will be confirmed to the customer. You can see all of the nouns, which are in bold over here, are highlighted as the candidate key abstractions.

There's a difference between a candidate key abstraction and a key abstraction. Key abstraction is the actual noun which will make a part of your domain problem. Candidate key abstraction is that noun which may or may not make it into a successful key abstraction. It is just a candidate.

Now when we highlight it or when we mark it-- here, we can see we have used bold. But if you have written down something, you may underline or you may highlight, just like I did right now. And we do not bother about the duplication over here. We just highlight every noun.

In the process that we remember that certain key has been already highlighted, we may miss some actual key. So we prefer to go for a duplication rather than missing something out.

So here, we go for the Main Flow. You can see customer enters type of rooms, arrival date, departure date. Now, when we do this, we will feel that some candidate key abstractions look like nouns. But by looking at those nouns, we do understand that these are actually not the nouns.

So for example here, system creates a reservation and reserve rooms. So we can cut out all those which we can easily understand that are not the candidate key abstractions. And for the others, we will continue with the process I found-- reservation, rooms, quoted price seems to be the noun. A customer has appeared many times. Reservation details, rooms, price,

So we will keep on going like this. We will continue with that process. Likewise, we go for Alternate Flow. We find a duration over here, a departure date. Of course, we have referred to it earlier.

Rooms is there; room types are there; message is there; customer is there, and so on. Reservation is coming a number of times, customer is coming a number of times in the various places.

So what do we do? We read through all. Now, if your use case is complex, and you have a lot of documents created. Maybe because the use case is complex, you created a lot of use case scenarios.

Your use case from is very, very big. You have to go through all. It maybe a time-consuming process. But we will do that for a complex use case.

Then we also read through the business rules. Arrival date-- today's date does not seem to be a part of a domain. It was just a part of a business rule. So I may ignore it.

So departure date was available in the previous place also. Reservation is there. Status is there. Payment guarantee we saw previously. Customer is there.

So the ultimate idea to understand is you will read all the documents. And you will highlight or underline all of the nouns, which you will find in the process. Now, the story doesn't end over here.

We will go through the Supplementary Specification Document, where we have Project Glossary. So we say reservation is coming over here, number of rooms, room type is here. Period of days is there. Date Range is there-- start date, end date. So all of these we will highlight.

Now we will read through all the documents. We can read the use cases, use case forms, use case scenarios. In the use case forms, we will go through particular sections like Main Flow, alternate Flow, business rules, description, and so on.

We will go through the project, the Glossary of Terms, all these things. And now we are ready to list out the things in the candidate key abstraction form. Now Candidate Key Abstraction form is a three-column tabular document.

The first column is Candidate Key Abstraction. All of the keys, which we have identified-- we list of these keys in the first column. So this contains the noun, which we have discovered from all the project artifacts.

The second column is Reason For Elimination. Now when we perform a CRC analysis on the candidate key abstraction, we will find out whether this candidate key abstraction makes into the key abstraction or not. If it makes it into the key abstraction, we will list it in the third column that is in the Selected Name.

The field contains the name of the class if the entry is selected to be a valid key abstraction. If in case it is not identified as a key abstraction, that means after performing a CRC analysis, we come to a conclusion that this is not a valid key. In that case, we will write the reason for elimination or reason for rejecting this candidate key not to be a key abstraction.

So let us take a look at the candidate key abstraction form once again. So it has three columns. The first column is the candidate key abstraction itself.

So here we have a Candidate Key Abstraction. This is our first column. And our second column is Reason For Elimination. And our third column is Key Abstraction.

So the candidate key section will be-- say, for example, I identified a reservation as a candidate key abstraction. I will perform the CRC analysis on this. We will see what is a CRC analysis. Let us just see how we fill this form.

If this gives me a green check, yes, everything is OK. What I will do is I will say a reservation is my key abstraction. In that case, this will be left empty. Right?

Say I identified the second one as status? Now status is also a noun. So this is one of the candidate key abstractions. When I performed the check over here, it gives me no. It is not. So we will see what makes us give yes or no. But that is a later story.

So here is what happens when I said this. Now this will be left blank. The third column will be left blank for the key abstraction. Whereas, here I will give the reason for elimination. I will say it is a reservation attribute.

This is my reason. This is the reason for rejection, the reason for elimination. This is how we fill the candidate key abstraction form.

Here we can see we list out all the candidate keys over here-- Reservation, Customer Actor, System, Customers, Room, Date Range, Price, Customer Details, and so on. The list goes on, because it's so many different keys which we have identified.

We have not yet filled a reason for elimination or Selected Component Name.

Next what we do is we want to find out whether something is a candidate key or not. The process of identifying the candidate key abstraction is a good opportunity for revising our project glossary and making it up to date.

What is the reason for that? We made the project glossary before we created our use case form. So we listed out some of the things when we created the use case from.

Then we also listed so many activities in the activity guide. We have a more clear idea about how that actual workflow of our use case will be carried out.

So once we know that about one particular use case, we are sure all the terms have been included. So we would do one thing. We will go back to the project glossary.

And we will see if there are any duplications. Maybe we have are alternatively used a name as a booking and a reservation together to show reservation, which may lead the people who read-- the stakeholders, they may get confused about what we are talking about.

So we would like to use a single term for one particular noun. So our vocabulary must be standardized. To do that, we will list out some of whatever redundancy is there, whatever duplication is there. And we will give more meaning to our project glossary.

So we said it's a living document, of course. For every use case, as we go for the different use cases of our application, we will perform the same process.

Now one interesting thing we will see over here when we revise our project glossary. There will be terms in the project glossary. There will be key abstractions in our key abstraction form.

In the next lesson, we will see that we will create a domain model. So there will be entities shown over there. After this, we will go and perform some other activities. And in the end, we will see we will revise our solution model. So we will use the names over there also.

Now these terms-- these key abstractions, entities, and whatever the refinement we have done-- these all must match. Not only this, the same names will be used by the programmers as variables, class names, and methods, whatever we are identifying.

So that means there is no confusion at all. Right from the requirement gathering, up all the deployment, we will find the same names are used. So there is no element which is missing in the total process.

So it's a very, very important point over here that we standardized or unified our project glossary, so that from here starts the process of unification, or you can say the process of standardizing the element.

Now how do we discover key abstractions using CRC analysis? Now CRC stands for Class Responsibility Collaboration. These are the three different elements.

So here we will see Class, Responsibility, and Collaboration. So we can see here this makes my CRC. This makes my CRC.

Know how do I go about it? It's a tedious and a lengthy process. I wouldn't say tedious. It's a rather lengthy process, very interesting. We will select one candidate key abstraction. So one candidate key I will pick up. Say, I pick up reservation.

So we say, identify a use case in which the candidate key is prominent. Then scan the use case from, use case scenarios, to determine the responsibilities and collaborators. Please do not confuse it with the previous process, which we carried out.

We read through the use case form scenarios to identify the nouns. We will redo the process but not to identify the nouns. Now we want to identify the responsibilities. And now we want to identify the collaborations.

We will do it two times, once for the nouns, once for the responsibilities and collaborators. We will scan the glossary for all the references to the nouns-- not for the nouns, but the references for the nouns, whatever it is related to that, whatever information which binds me to that noun or associates the noun with the other types of nouns.

So we will document these key abstractions with the CRC card. And then we update the candidate key abstraction form, based on our findings. So let us begin the process. It's an interesting one.

Selecting that key abstraction candidate. Selecting a good key abstraction candidate is a process which is a related to your intuition. If you are very experienced, as soon as you listen to the noun, you will get to know whether it makes a candidate key or not.

Because when I listen to the reservation, I close my eyes and say a reservation, a few things immediately pop up in my mind-- arrival date, room type, departure date, status of the reservation. So that means the reservation is not empty. It contains something.

And immediately, I know a reservation must be associated with the payment, must be associated with the customer. So I can see that it is kind of a network of objects. So that gives me an idea that, yes, it is a good candidate for key abstraction.

Now one thing we can do is we can ask domain experts, the stakeholders-- there are people who are domain exports, they know. These are the key abstractions in this particular domain.

Choose a candidate key abstraction that is used in the use case name. We will the scan the use cases, and we would whether this name is appearing in the use cases or not.

And then we choose the candidate key abstraction that is used in the form, because we have a use case name. And we have used case description. Is the name coming over there?

Now let us take a look at the process. Of course, we are eliminating the process of asking our demand expert over here. So we say the reservation is that noun, which we have identified to see whether it is a key abstraction or not.

So we say it appears in various use cases-- Create Reservation, Update Reservation, Delete Reservation. Even in the check in customer, a bill is assigned to a particular reservation. So that means the noun is appearing in various places.

Now to identify a relevant use case. To determine whether the key abstraction candidate is a real key abstraction or not, we must determine if the key has any responsibilities and collaborators.

So we scan the use case names for candidate key abstraction. We scan the use case forms for candidate key abstraction. And we scan the scenarios for the candidate key abstraction.

To put it in a single sentence, I can say, scan the use case names, the use case forms, and the scenarios to find out a particular candidate key abstraction. And then scan all the text of the use case scenarios to find out.

Now what do we do? We identify a relevant use case. Here the actual process begins. We understand that reservation is available in the various use cases.

So I will do it for one successful and one failure. And then we will just try to identify. We will create one big CRC.

We picked up a reservation as it is appearing in many use cases. Now we would like to determine the responsibilities and collaborators. So we say, scan the scenarios and the use case forms of the identified use cases for our responsibilities.

We need to understand the term responsibility over here. Normally, these keys are recognized as classes. So there is a class called a reservation. Now the class will have attributes groups. And the class will have operations.

Normally, when we talk about the attributes and operations, we consider them as two separate things. Because attributes, we say, make a state of an object. And operations make the behavior of an object.

But when we talk about responsibilities, both attributes and behavior together are called responsibilities. Both attributes and behavior, together, are responsibilities.

So we will look for the responsibilities. That means, if you find a candidate key abstraction without any responsibility, we will reject it. And if you find something without collaborations, then also we will reject it.

Now determining the responsibilities and collaborations-- how do we do this? Glossary term, reservation-- we see it's definition. What did we write about it? We said, an allocation of a specific number of rooms, each of specified room type for a specified period of days.

I say, over here, a number of rooms and duration and particular type of room. I can find out three things over here. Business rule nine says, the reservation must not exist without being linked to at least one room.

Let me tell you, over here, this is my list of responsibilities. And these are my collaborators. These are my collaborators.

Now, another. Business rule eight says, a reservation with a status of confirmed must be linked. So first is status must be linked with a customer and payment guarantee,

So this makes the responsibilities and the collaborations. So main flow says system changes the reservation status to confirmed. So that means status comes into the picture again. So I have a class which contains responsibilities and which has collaborators.

So the reservation is a selected candidate key. Likewise, this is what we just learned. We have a class named responsibilities and collaborators. And this is how we fill it. So reservation-- what does it do? A reservation reserves a room.

This is how we can see the various responsibilities and collaborations. Now, how do we update our form? In the form, we have already listed all the candidate keys. And what will we do? We will fill it now.

We write the reason for elimination for the various keys. The reservation was there, then we have customer actor. Actors are always external to the system. Here, we need to understand customer actor and customer entity are considered two different things.

Customer actor means it can be any proxy, a booking agent or anybody who is acting on behalf of the customer. And the actor is never a part of your system. So we say, external to the system. The actor is external to the system. So this is the reason for rejection.

Then we say system. System is the whole system. It is not pertaining to this use case, so we reject it. Customer is certainly a candidate key. It is a key abstraction.

Rooms is a candidate key, but we do not use plurals. Hence, we change it from rooms to room. We never use class name as a plural. It is always a singular noun.

Date Range. It is a synonym for arrival date and departure date. We can also write, in brackets, that these are the attributes of a reservation. And price is, again, synonymous for the quoted price. Customer details is the same as customers.

Now Payment Guarantee? Yes. room Type? Yes. Arrival Date, Departure Date, and Quoted Price are all attributes. These are all attributes of reservation, so reject them. Because attributes don't have responsibilities and collaborations.

Then we say, Reservation Details-- this is the same as reservation. Customer Name and Zip Code are, again, the attributes of customer. Today's Date is external to the system, and Period of Days is the same as duration.

So this is how we perform the key abstraction hunt. We hunt for the key abstractions. And we use a particular process. Although, CRC is not a standard UML process, but it is considered. It is not that people don't use it. We do use it, and it's an acceptable method.

Now in this lesson, we talked about the key abstractions, which are the essential nouns in our problem domain. We learned the method to identify the key abstractions. We learned the method to identify the responsibilities and collaborators and to list out all the selected candidate key abstractions.

We also learned that, in this process, we will do one more good thing. That is, we will revise our project glossary.

## 2. Lab 6: Determining the Key Abstractions - 5m

So let's take a look at Lab number 6. We have two activities. In the first one, we identified candidate key abstraction from the project artifacts. And the second one-- where we use CRC analysis to identify the key abstraction and then fill the form. The process in the solution is shown only of filling of the form. CRC analysis is left up to you.

So let us take a look at the first exercise, using the use case forms, scenarios, and glossary descriptions from the previous lab-- that is, we are talking about check-in process-- identify the candidate key abstractions and list them in a candidate key abstraction template form. So we will list out all the candidate keys. And then using the use case form scenarios glossary description, we will go through all these documents, and we will fill our first column. So this is what we have, Activity 1.

So a Candidate, reason for elimination, and Selected Class Name, here we identify all these from the check-in use case. So we can go back to Lab 4, where we have all the scenarios. So we will go through that.

We can go back to Lab 3, where we have all our use cases and use case form. So we can get the details from there, and we fill it over-- Customer, Hotel, Reservation, Room, Payment Guarantee, Room Key, Bill, Chargeable Item, Receptionist, System, Room Upgrade, Assigned Rooms, and so on-- Room Occupied Status, Quoted Charges. So we are practically filling out everything. All the nouns, unique nouns, have been taken care.

So once we do that, the second exercise says we would like to fill it. So select the candidate key abstraction, and perform the CRC analysis on this. We will identify whether there is a use case in which the candidate key abstraction is prominent.

So we will look for the use cases. We will look for the description of the use case form. Then we will take a look at the main flow, alternate flow, business rules, to identify the responsibilities and the collaborations for CRC card.

So once we have done that, if we find that there are responsibilities and collaborations, we will list out those candidate keys to be as the final key abstractions. For example, Customer, Actor-- actors are always external to the system. Hotel is more understood as Property. Property is the keyword which we will use throughout our application for the Hotel. A Reservation, a Room, then Payment Guarantee, you can note down one thing over here.

Payment Guarantee are two words over here-- Payment, space, Guarantee. But we convert it into the key abstraction, it is PaymentGuarantee without any space. It is a single word. That means we are actually finalizing the name of the class.

And this will also be done, usually, depending upon the technology which we opt for. If I am using C++, maybe I will not write it like this. I will follow the best practices for C++. So here, because I am using Java, so I am using Upper CamelCase best practice over here to finalize my candidate key.

Room Key is external. Phone is external. Bill is yes. Chargeable Item-- again, convert it into Class Name.

And we can see the rest of the things. Somebody are attributes. Some are synonyms. And this is how we identify the various key abstractions.

It's a lengthy process, but it's interesting. And we have a very clear idea in our mind about our domain entities once we go through this process.
