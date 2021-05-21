# 2: XML Document Structure

   * XML Document Structure: Part 1 23m
   * XML Document Structure: Part 2 13m
   * XML Document Structure: Part 3 3m
   * Practice 2-1: Exploring the PlayingCards Project 3m
   * Practice 2-2: Creating an XML Document 3m
   * Practice 2-3: Creating an XML Schema 3m
   * Practice 2-4: Using XML Namespaces 3m
   * Skill Check: XML Document Structure - Score 80% or higher to pass

## XML Document Structure: Part 1 23m

Let's go ahead now and talk about XML Document Structure. This would be our second lesson. For this, what we are going to do in this case, we're going to describe the benefits of XML, and most probably many of you are familiar with XML. So this is pretty much a review for XML, so we can get to the meat. We can get to the JAX-WS and JAX-RS machinery for of course SOAP and RESTful web services.

Creating an XML declaration, assembling the components of an XML document, declaring of course, and applying XML Namespaces. And of course, validating XML documents using XML schemas and creating XML schemas and so forth.

So of course, XML describes data object called, of course, XML documents that are composed of markup data. And in general, XML has-- it's used a lot for the web, and the web relies on XML a lot. It's a markup type of data. And of course, it has its own custom tags. And we see some those. And it has what we call XML processors that process XML.

Advantages of using XML, it's quite simple and extensible to represent data. What's good about it is that it enables us ability to exchange data or interchange data. It enables us for simplified business-to-business communication or interaction. And of course you can write smart agents with it, and of course the ability to a perform smart searches.

And of course, here's an example about an XML document that the first line here is always called the prologue of the XML document, which typically contains the version. And then after that here we do have a document that has as a root tag, books. And then inside that, we have a list of titles. And most probably this actually will list titles of a bunch of books. And that's what we have as an example here.

So XML, of course, it actually has evolved and matured and became standard to a point where there are a bunch of standards that we can use for XML.

We could represent XML either in a form of DTD. Most probably you guys have seen the DTD and the XMS schema, and the XSD, basically. DTD has a tendency to be human readable type of an XML document. XMS schema has tendency to validate those XSD type of a, in this case, documents that are used between a B2B interaction.

Of course they're uniquely identified through URIs and URLs. And of course, you could locate them through nodes. And they do have, by the way, engines that allow you to change these XML documents from one format to another format, like XSLT, and so forth. You can have an output document for that. That could be, for example, HTML and so forth.

And they do have lots of XML processors like a DOM, a SAX. The one that we are interested by in this course is what we call in this case the JAXB API. And of course we can use jQuery. I don't know if you folks have used a jQuery part of JavaScript. That also can be used to, in this case, write XML code.

So of course the importance of XML for web services, in web services is that the web service standards like SOAP, WSDL, UDDI for the, in this case, The Universal Description and Discovery and Integration. All of these, of course, are based on XML. And RESTful web services support also multiple type of data format. We see that includes XML in this case. And of course RESTful web services, a client might of course prefer in this case XML over JSON, on so forth. Also JSON was also based on XML in this case.

In terms of the document structure, most probably you folks are familiar a little bit with these. An XML document always contains, again, these parts. First the prologue, which is again represented in this case, prologue. It could be it includes, by the way, some comments in this case.

And then after that the root element. Only one root element per document, here is for example root element which is employees, if we, for example, use an XML document that represents information about employees in this case.

And then, of course, after that we have what we call a epilogue. The epilogue is of course where you are going to have some data that needs to be processed.

So in terms of the XML declaration, XML always has to start with an XML declaration. And the XML declaration always looks like a processing instruction with an XML name. Here's an example where I have in this case the XML version, and then the encoding we decided would be the standard UTF 8.

And of course, this XML document in this case, or the version, it is by the way optional in 1.0. But it is mandatory in 1.1. Again, it must contain the version attribute, and may also include some encoding attributes and some standalone attributes, and so forth.

In terms of the components of an XML document, XML document again in general, they are comprised of different parts. One of them is what we call the PCDATA. Well, that's the parsed character data, which includes by the way the markup language elements, attributes, entities that describe your data, and so forth, and character data that is described by the markup. Here's an example where I do have in this case a document that has-- this is the markup language, its encoding is a UTF 8.

And then it starts with a root employees. And in it has an employee with an attribute ID 100. And then an element which is the name, in this case, which is Rachael O'Leary in this case.

And then you also have the other part which we call the CDATA. And that's the end parsed part of the text in this case. So we do have a CDATA here. And what's in between the square brackets in this case, after the CDATA, all of that you could write anything you want. And the XML parser will of course avoid parsing that.

In terms of the XML elements, an XML element always starts with a tag and an end tag. Here's an example. I have a start tag, which is employee. The end tag always ends with a forward slash and then the name of the tag all the time. And target names, by the way, are case sensitive. So we've got to be careful with that. And of course you can have an empty element like this one here, where you have no element. You also can represent an empty element with the name of the tag followed by a forward slash. That also can be used.

Again these all are pretty much reviews for you. I know that many of your are familiar with these. That's OK. And of course here's an element that in this case that represents a name, which in this case the name is represented as Steven King.

And there are, by the way, rules whenever you write the markup language in XML. So these again rules are sometimes called top-level or document elements. So for example, we could say that all elements must have matching start and end tags. They could contain nested elements. They have case sensitive tag names that you can use that are subject to in this case naming conventions that people use. And may contain of course white spaces, like tabs and new lines, and so forth.

And by the way, an XML attribute of course is a name-value pair that is of course specified with, in this case, in the tag. And if you take a look here in this example, we do have in this case a document representing the list of the employee, and this as you see here, representing employees.

And if you take a look here, you see that in the tag employee, we define two attributes, the attribute and its value, which represents the ID, and then another one representing the name. Of course these characters here, they're just to represent the apostrophe in this case for O'Leary.

And of course, but it has one element which is the salary. So of course, this has a case-sensitive name. It has a case-sensitive value that must be enclosed within single or double quotes, and provides additional information about the XML document or XML elements, in this case.

Also we do have some of the naming convention rules for XML elements or attributes. We say that elements and attribute names can contain letters, capital or lower case, and numbers. They can contain idioms, like for example, some of the Greek letters and so forth. They can contain an underscore, a dash, a period.

They must start by the way, with a letter or an underscore. Remember that. They cannot start with a number, a punctuation character or a letter. And in this case XML or capital or lowercase and so forth. They cannot contain spaces. And they can use any name. No words are reserved. So you can use anything you want.

So here are some examples. But in this case, the question that some of the team members or some people ask, is hey we can use elements and we can attributes. So what's the advantage of one versus another one? That would be a good question.

So here, for example, I do have my XML document here, which has a root tag, employees. And then here inside the employee, will present every single information about the employee with an element. As you see here, the ID, an element, an elements means what? It has a start tag and an end tag. Or we can go ahead and represent this with of course, in this case, with attributes. It's a matter of choice.

So we always tell you, and we actually tell you in this. And we say again, these are some additional points to consider when to use elements versus attributes. Elements are more easily added as your requirements expand. Elements may be ordered. But attributes cannot, in this case are returned unordered. Elements can be structured and may contain other elements, and so forth. And attributes, of course, they're atomic. So these are just choices that you are going to make in this case.

And of course that comes to your design, if you want. If you know that for the information that I have in my XML document, attributes are good enough for me. Fine, that's OK. But if not, then of course in that case you can go ahead. And if you need to expand, you need to know in this case represent different elements expanded and of course have elements contain other elements, then at that time it's the element way to go.

And of course, so we do have the character CDATA. And this is again not read by the parser. It is parsed to an application without changes. And it's used to contain text that has several XML restricted type of characters, like less than, greater than, and so forth.

So some folks for example want to write in this case a document that has a script that looks like this. And so of course by looking at this, compared to this one where you use the CDATA, what's the advantage of, for example the lower one, versus the upper one? Exactly, thank you, readability.

You can go ahead and use this type of special characters to of course escape all these type of characters inside XML. And like exactly you said, Ian, that would be the way to go. I would actually use this one here. Because that's actually more readable. Everybody understands what I'm passing to my application in this case using my XML document.

Moving along and continuing with that, again looking at the XML comments, we can comment by the way, we can put comments in by starting with this less than, exclamation mark, dash dash. And finish with of course dash dash greater than. And by the way, comments may appear anywhere in the character data of the document, and before of course the root element. They are not the elements, and you can occupy multiple lines. The only thing that you need to remember, they may not appear inside the tag or on another comment. That's really what it is. And we show you an example here on the document.

Don't forget about that XML needs to be well formed. And we tell you a bunch of rules here in this slide. , Again, many of you are familiar with these. An XML document must have one root element. An element must have a matching start and end tag. Elements can be nested, but cannot overlap. And all attribute values must be quoted. Attribute names must be unique in the start tag of an element. And comments and processing instructions do not appear inside the tag. And of course these less than or greater than special characters cannot appear in the character data of an element or an attribute value.

One of the issues that we have in XML is the concept of what we call a name confusion. And lots of times we call it name collision. And so of course the allowed XML elements, names in this case or tags in a document, define the vocabulary. Of course if multiple vocabularies are used in an XML document, it may again lead to some confusion.

So for example in this case, does a rank apply to mean a rank of a player or a rank of a card, If you're playing a game. So that would be an issue. So of course, just like in Java, in Java typically we resolve the naming issues by specifying the path, the directory and sub-directory and so forth, or the folder or subfolder and so forth.

And of course in XML, pretty much we have the same type of concept. So that's why we introduced this concept of XML Namespaces. To successfully combine XML vocabularies with no confusion there must be a way to uniquely identify these elements. So Java classes like, for example, make use of packages. And that's how we fix the problem of naming collisions or naming issues. And XML did not originally support that.

But the W3C recommendation in 1999 supported this by of course are presenting now the concept of URIs. So now you can go ahead and use URIs that are assigned to XML components to uniquely qualify them. And here's the concept of URI, where again it represents any type. So URIs can contain by the way, characters that are not allowed in the element names. And of course we can use aliases, known as prefixes, to URIs which are used again in this case. So this is how we can have these prefixes that are used in front of the element to specify the uniqueness of that.

And even better, what we have done is now we can have these XML namespaces represented by a prefix equal to some URI, and that is used to create a namespace. Here is an example for the person where now we do have in this case a prefix exvocab, which is used in front of person. And that has an XML namespace which is represented by a URI.

So a namespace declaration may appear on the starting tag where the prefix is used, or an enclosing ancestor element. And of course it is common to declare multiple namespaces at the root element of your document. Of course the default namespace may be declared with no prefix, if you choose to do so.

Of course, the whole idea behind this defining a XML vocabulary for this XML Schema is now we do have, if you want, allowed elements and types of XML documents that can be defined through the XML Schema. And so XML Schema defines your allowed elements, and attributes and types and so forth. And these XML Schemas are themselves XML documents. And of course these XML documents specify the schemas that they are constrained by.

So in this case, what we're doing is we're using this XML Schema which defines for us what type of elements we're using, and the allowed elements that we can use, the attributes along with their types. And that's why XML Schemas are quite attractive.

The good thing about it is all of that hidden by the JAX-WS API and the JAX-RS API. But here we're just taking a look a little bit, and seeing how all of that is represented in here.

So your schema document, it's nothing but an XML Schema that uses of course, a required XML Namespace string, with this xs prefix. That's typically how we see it. And of course it has a schema tag, and that would be the root element of your schema document. And of course the elements to that are going to be declared inside.

So here's a very good example, where in this case I do have an example of an XML Schema, and XSD file that has in this case a prologue, and then it has the excess schema element, which is the root element. And then inside it has an XML Schema and in this case, a namespace that represents that. And then inside I do have an element. And this element here I'm saying is going to represent what? Departments. And then the type is what? A string.

So which means if I use this schema here, I can go ahead and create an XML document like this one here that has as a root element, would be in this case departments, which is represented here. And then of course the name of the department is finance, which happens to be a string, which actually works very nicely. So this XML Schema will validate the XML document without any problem.

Of course the question that we always have is where do we put, in this case, the XML Schema. So validating an XML document with an XML Schema document. Where do we put that? And how do we access this XML Schema?

Well in general, in the XML document we can use an XML namespace, in this case that's represents by the namespace that we see here, or what we see the URI that we see over there. And reference that schema by using, or the XML Schema, by using either what? A noNamespaceSchemaLocation attribute, which by the way would be one attribute representing the schema file, or what we call a schemaLocation.

A schemaLocation in general is represented by two things. So if you take a look here further, the noNamespace represents only one file and that's it. On the other hand, the XML location represents what? The schema location, and the file. Lots of times we advise you to use the second one. And then of course here's an example where we use the XML noNamespaceSchemaLocation, which represents directly the name of the file in this case.

And of course these schemas validate, the XML document. So the schema will allow it to validate the document, the XML document itself. And we tell you of course here that the noNamespaceSchemaLocation attribute whose value again is a file or URL string identifying the location of the XML schema. Or you can use the schemaLocation attribute whose value, by the way, is a namespace file location pair that identifies the location of the XML Schema by using a specific XML Namespace string and the space, and then the file location where it's located. We always advise you to use the second one to reach the schema location.

And here's an example of where we reference the XML Schema using the schemaLocation. So here in my schema file, I do have an XML Schema name, which is department.xsd. And then inside the root element schema I'll go ahead and represent in this case a targetNamespace, which is representing the departments. And then of course I have my element in this case, department, that will type a string.

So if I use my XML document, and when I reference the targetNamespace in the schemaLocation, I will have something like this, where I do have in this case an xsd in my document. I have department, XML Namespace is this department here. And then I do have now, of course, an excess document schemaLocation, which is represented in this case by the URI, which is the http://www.hr.com/departments and then space, and then the name of the file, which is department.xsd.

## XML Document Structure: Part 2 13m

 
Let's go ahead now and take a look at components of an XML schema. So here how actually we represent that XML, so you see we have the root, which is the schema. And then you can have elements. And then under the element, you can have attributes, simple types, complex types, and then the simple type can have a restriction, a list, a union. It can be a group, of by the way, in this case, which represents either in this case a sequence choice or all. And then of course, an attribute group, which represents any type of attribute.

So that's typically how we see an XML schema, the format of XML schema. And here's an example where we show you here where we have, first of all, the XML namespace, which represents the declaration. And then after that in number two, we have the root, which is in this case a root of the XML schema document that we have here.

And then underneath, we have the XML namespace that represents the XML schema that we're using, that would be, of course. And then in number three, we do have an element in this case that happens to be a name is called region. And then this element is made up of a complex type, which is made of a sequence of two elements, in this case, which is a region_id, which happens to be an integer, and the region_name, which is going to be of type a string.

So this is just to represent a complex, in this case, object in this case. And of course, we tell you here that the schema and the element declaration and the complex type and, of course, the sequence of elements here, which represents the name of the element and the type of the element. And of course, this would be my schema that I'm going to use to, what? To validate my XML document.

And here's my XML document in this case, which happened to have a region ID, which we said is the name of the element, and then it's an integer. That's why we have 1 over there as an integer.

And then for the region name, which is an element that we know is going to be a string, and that's what we say Europe here. So obviously, this and then of course why do we use here as a root element region? And that's due to the fact that my element here is a region that you see here. That's pretty much how we represent that.

And by the way, in the global and local declaration, global declaration, they appear really as direct elements or direct, if you want, children of the schema element. Here's an example. This element name, A, would be a global in this case declaration of an element and can be reused within the XML schema later on, or you can have what we call a local declaration.

This would be valid in the context in which, again, they are defined. And they are not, by the way, direct children to the schema. It could be underneath. For example, here in this case inside my sequence element, I'll go ahead on inside my compass, I'll go ahead and represent in this case, a different type of a local in this case declaration. That's what we have. And by the way, a local declaration can also reference a global one, also. It can reference a global declaration by using the name prefix that we see here.

We do, by the way-- there is a built-in type of schema types that we can use directly, and the XML schema language provides those built-in data types like a string, an integer, a decimal, a Boolean, a Float, and so forth. All these can be actually used directly without, of course, creating a schema for them because they're automatically handled.

And here we show you an example of the schema and the XML document. The first one is using an employee ID that happens to be an integer. The second one is using a salary that happens to be a decimal, which is going to be in this case representing a double in this case value.

Declaring a simple type component-- again, the simple type component that we see always that looks like this is pretty much derived type that extends the built-in on other types, provides by the way three primary drive types-- the restriction, list, a union.

Here's an example where we show a restriction here where we do have a simple type which is called Employee ID, and it has a restriction which happens to be, what? Which happens to be that says that my value has to be positive, and represent that here.

And then, of course, I do have an element, which employee ID that happens to be the type or type Employee ID that represent here. So it could be a list, it could be a union. By the way, we tell you, again, all of these about in terms of [INAUDIBLE]. So you can have in this case a simple type contains a restriction, which happens to be representing that it has to be a positive number.

And in this case, and of course in this case, we say that the maximum inclusive would be 1,000. In this case, that would be the maximum [INAUDIBLE] in this case that would be 1,000 for the maximum value.

And by the way, we can use-- most probably you folks are familiar with enumeration. Java Standard Edition introduced a new type of enumeration in Java SE 5, remember, and we call it enum. I don't know if you guys have seen that. And so, of course, here we're just representing enumeration. In this case, it happened that I have a simple type called a manager type, and it has a restriction which is, again, it would be a string. And then it has a couple of enumeration.

One says for AC Manager and the other one is FI Manager. So in this case, it's just representing two types of manager, either a full-time or in this case or a part-time, and so forth. Or AC, AC could be any type of in this case, any type of manager and FI any type of manager.

You can , by the way, declare a complex type. And again, a complex type declaration always it have, for example, in this case the name attribute representing by some value. Must be identified by a name attribute if it's a global. Otherwise, again, it can be an anonymous complex type. An anonymous complex type, by the way, it is a complex without a name.

Global, we need to specify a name. Why? It could be used in more than one space. Provides, of course, a content model that can contain a simple content. It could be a sequence of declarations. It could be a choice, could be a reference to a global group, could be an all, which represents all the representation.

And of course, could be mixed up that. So we tell you about all of the sequence would be specified ordered sequence of elements. The choice provides a choice of elements. We see examples of all that. A global, again, reusing a group of elements to define a complex type. Or all, which means allow all elements in the content to be used in any order we want.

And let's see examples about that. Here's an example of a declaration of, in this case, using a sequence of a complex type. Here it happens that I have an element called department and a complex type, and it's a sequence of what? In this case, a sequence of department ID, department name, and location ID.

And we specify the name and, of course, the type. This, the department ID, is an integer. The department name is a string. And of course, the department ID happens to have an integer, of course, a minimum zero, and the location ID happens to have an integer with the minimum, of course, occurs of a zero.

You can use a choice is a very good example of a choice. A choice is kind of similar to the complex of a choice that we see in Java. A very good example of the choice is when you have a switch statement that allow you to check and see which choice you're going to use. Here's an example where I have a complex type is an employee type and it has a choice here, which happens to be either an element full-time, which is a string, or a part-time, which is a string.

And then of course, in this case, that would be representing my complex type. And then here, I have a-- so that would be employee type. And then in this case, I have another complex type, which an element which is in this case called employee and it's made of complex type, which represent in this case a name element full-time, which happens to be a string. And then the name of the contract here would be a type which, in this case, the employee type. And that would be either in this case since it's an employee type, it would be either one, a full-time or a part-time.

We can declare an empty element, also. Here's an example where we have a bunch of elements that do have data. But sometimes if you want to represent an empty element, we already said that you can use it either this way, where you have two elements that have nothing inside, or using, for example, an element followed by a forward slash. So empty elements are elements that have no data. Again, in this case, they contain no data.

Sometimes we can use that wild card declaration that allow the inclusion of elements without batch control. They pretty much provide a way to include elements from within the XML schema or its namespace. The any, for example, is an example where I have here a complex type content type and sequence that is made element is author, and then the namespace could be any.

We do have, by the way, some of the attributes that we can use. "any" allows all elements from all namespaces. "other" allows elements from a namespace other than the target namespace. A target namespace allows elements from that particular target space. A local allows well-formed elements not qualified by a namespace. They are just local.

And so these are different type of a representation of elements with wild cards. And lots of times, by the way, all of this is done for you underneath the hood. You really don't see it.

We've seen attributes-- by the way, declaring attributes is very useful. You can go ahead, use in this case the xsd attribute as an element, identified by a name, and then the type, and that's pretty much the full syntax that you can use for these. That's typically how we use declarative.

We've seen-- this is in the XML schema, in the xsd schema. Of course, we've seen attributes, how it represent these in a document. And that's pretty much what we wanted to say. This is just an introduction to XML.

JAXB has a tendency to hide all the whole representation of parsing and the marshaling and unmarshaling all these XML documents underneath. And we'll take a look at that later on after we finish with the labs of these two sections.

So we do have a small quiz. We always end a chapter always with small quizzes. Here is one quiz that says the tags and attributes allowed in an XML document can be constrained by what? Of course, a DTD, or the last one is XML schema. DTD stands for document type definition.

Lots of times, we use DTD for human readable type of information. XML schema has a tendency to be used for B2B type of interaction.

One more quiz-- an XML schema simple type may contain? Of course, we said a restriction. We've seen a restriction about maximum. Remember, the maximum-- sorry, the positive, it has to be a positive integer.

And a bunch of resources, as always-- a bunch of resources. And that's pretty much what we wanted to say-- pretty much an introduction to XML.

## XML Document Structure: Part 3 3m

Now that we're done with Lesson 2, let's go ahead and take a look at the labs that are related to Lesson 2. So these are, of course, related to creating an XML document. So in the first exercise or practice, if you want, we want to explore the playing card project. This is, again, a project that is already built. We're just going to go ahead and open this project card and play with it and take a look at inside [? on ?] [? the ?] [? file ?], then run it, and so forth.

And then the number two, we are going to create an XML document. In this practice, we create an XML document to represent a playing card after, of course, testing the XML document for general conformance to XML structure and rules, we create, of course, an XML document for playing card, which will define the [? task ?] attributes and structure used to represent a playing card.

Of course, we assume that all your applications are still running. So go through these tasks step-by-step to actually go in this lab. In lab number 2-3, that's where we're going to create a schema. In this practice, we create an XML schema that contains an XML document to a set of elements that represent a stack of playing cards. Again, the steps pretty much guide you step-by-step what you need to do. All the way.

And then, in number 2-4, we use XML name space. In this practice, what we do is we'll modify the XML document and schema to use XML naming spaces. Again, in this case, the steps are pretty much straightforward. The tasks, if you want, task one, task two, and so forth.

Again, the key to the success in these labs, like I said, ladies and gentlemen, is just follow and read every task. And of course, if you have to step away, just mark down where you are, so when you come back, you know exactly where you are, and you don't miss any step.

## Practice 2-1: Exploring the PlayingCards Project 3m

Let's go ahead now and take a look at Practice 2-1. This is, of course, after we finished this lecture number two. So in this practice, we open and explore the Playing Cards project. This Playing Card project, of course, provides a couple of plain old Java object POJO classes that can model a collection of playing cards. So we open this project, and let me just open my NetBeans in this case.

And here it is. And, of course, they tell us to, in this case, take a look at the Card Collection Java, which is this one here, that has, of course, the display abbreviation and the Unicode suite, and then the description, and then the display Unicode six, in this case. And then they want us to install the dejavu-sans.ttf. Of course, what they want us to do is get into the Control Panel, and then under Fonts, delete that.

And so I already did, by the way, and install the new one. And then, of course, under the lab Number 2, what they want us to the double click on this zip file and extract that to this folder, dejavu-sans-ttf.2.33. And of course, the way you install it is just by clicking, in this case, and installing font. That's how you do it, and then this is pretty much how. Click OK, and then gets installed. So we're already did that

And then after that, you run the application, and then underneath here, you right click, in this case, and then you pretty much choose fonts, and that's what I did there. I selected dejavu and then Plain, and then selected the 18 size. That's exactly what they asked us to do, in this case. And of course, after that, that's why, in this case, I see that we can see now the playing cards that you see here. That's pretty much what we wanted to do for this practice 2-1. Thank you.

## Practice 2-2: Creating an XML Document 3m

OK. Now let's take a look at Practice 2-2 of Lesson 2. In this practice, we create an XML document to represent a playing card. Of course, after testing the XML document for general conformity to XML structure and rule, we create an XML schema for playing card, which will define the tags, attributes, and the structure used to represent a playing card.

But for this practice, we'll just go ahead and create just an XML document. So with NetBeans, we go ahead and create this cardstack.xml. Let's go ahead and take a look at that, which is this one here. And it's pretty much an XML file that has a tag, root text tag, and then it has the card 4 and the card 2 in this case. And, of course, the card joker is red.

And, obviously, in our case here, we still have the class app and the class card, in this case that has a rank, suit, and a color. And it has the card collection, which pretty much, in this case, is used to represent stack of playing cards. And then it has a French card deck. This pretty much represents a standard 52 card deck with the possible inclusion of jokers.

And then we have the rank, which happens to be an enumeration that has the different ranks. And then it has a suit, which pretty much also represents the different suits in this case for the-- and which is also an [INAUDIBLE]. And when we run this, this would be the output that again-- let me just map this to the output.

So that's pretty much what we see as an output. And that's what we have for this practice. Thank you.

## Practice 2-3: Creating an XML Schema 3m

 
Let's go ahead now and take a look at practice 2-3. In this practice we're going to create an XML schema. So this XML schema would be called schema, and of course we follow steps to be able to write the whole schema in this case. The steps that are in the activity guide. So let's take a look at that. This is the card schema, and pretty much it has, in this case, the simple tag. It has a simple tag you see here. This is the suit type, and this is the color type.

And then, of course, it has a symbol type representing the rank type. And then it has a complex type, which in this case is called the card type, which has a complex content, which is a restriction in this case in type, and a sequence in this case made of the name rank, name suit, and name color. Of course, we do have here a complex tag, which is the stack type.

And of course, we do have the elements here, which happens to be stack type. And this actually allows us, if we wanted to-- let me go back now, and open now the card stack. And now this card stack that I have, I can actually now right click and validate that with a schema. So if I validate it, here you see that now it says the XML validation is finished, and it's all done using the card schema that we created in this case.

That's pretty much-- and then they also wanted us to see the example of a nested type card schema. And here it is. So this is a nested one, so as you see how it's nested. OK? You can take a look at that, too. Play with it and see how it actually looks like, and so forth.

And of course, when you run the project it still runs with an output that we have in this case, which is this one here. Pretty much the same output that we have, you know, In the previous ones. And that's pretty much what we wanted to do for practice, in this case, 2-3. Thank you.

## Practice 2-4: Using XML Namespaces 3m

Let's go now and look at the final practice of Lesson 2, which is 2-4. In this practice, pretty much what they asked us to do in this case is just to take a look at modifying an XML document and schemas to use the XML Namingspaces. Course here, we wanted to make use of a games.xsd schema to the playing card project. And let's go ahead and take a look at that.

So we do have a games.xsd, and this is pretty much the xsd schema for the game.xml. And as you see here, it has, of course, as a root a tab which is the excess schema. And of course, it has, in this case, the XML naming spaces. Again, we have the bunch of complex types that you see here from, in our case here, from the book type to the player type, to the player's type, to the vacations type, to the Indian rummy type, to the games type.

And then, of course, we do have, in this case, a games.xml which means, by the way, makes use of that. So if you take a look at the games.xml, we see how, in this case, that we do have a schema location, which is the games.xsd. Then, of course, inside we do have the XML document that we have here. Again, following the games.xsd schema. That's pretty much how we wrote this.

And of course, if we now right click and validate that, it should be validated, which makes sense. Because, of course, games.xsd schema is the right one. And of course, it's clean and obviously, there's no errors in it. That's pretty much what they want us to do in this practice 2-4. Thank you.

## Skill Check: XML Document Structure - Score 80% or higher to pass

Skill Check: XML Document Structure

View Skill Check
