# 3: XML Parsing with JAXB

   * XML Parsing with JAXB: Part 1 23m
   * XML Parsing with JAXB: Part 2 14m
   * XML Parsing with JAXB: Part 3 3m
   * Practice 3-1: Creating Java Classes from XML Schemas 4m
   * Practice 3-2: Creating XML Schemas from JAXB Annotated Classes 3m
   * Practice 3-3: Creating Java Classes from XML Schemas 5m
   * Skill Check: XML Parsing with JAXB - Score 80% or higher to pass
   
## XML Parsing with JAXB: Part 1 23m

All right. Let's go ahead now and look at the lesson three, which is related to the XML parsing with JAXB. In this lesson, we are going to look at the list of Java XML APIs. We're going to look at the benefits of JAXB, unmarshalling XML data with JAXB, marshalling XML data with JAXB, compiling XML schema to Java, generate XML schema from Java classes, apply JAXB binding annotations, and creating external binding configuration files.

So there are a bunch of ways to process XML. And that's part of the JAXB API, which is Java API for XML processing. One is SAX, which is an event-based parser framework. Again, developers create event handlers that fire when reading a document. This is typically a light footprint type on a processor.

We have the DOM, which is actually heavy footprint, because it is an object model where the XML document is converted into three objects comprised of types such as elements and so forth. And then we have the streaming API for XML, and that's StAX, which of course in this case implements a pull-parser API. This is, again, the better of both.

The Java Architecture, on the other hand, for XML Binding, JAXB, that's the one that we are interested. Sorry. And for the-- so the next one here, which is the Java Architecture for XML Binding, JAXB, that's the one that we are interested by, because that's the one that JAX-RS and JAX-WS uses. So it pretty much binds an XML document to a tree of objects similar to the DOM. And of course, unlike the DOM, the object types are custom types.

And to be able to understand this, let's go ahead and take a look at the board. And so in fact, in this case, this is a JAX-RS and JAX-WS, both of them. JAX-RS and JAX-WS, both of them. And JAX-WS for SOAP web services, and JAX-RS for RESTful web services. Again, in this case, they actually both make use of the JAXB API.

So JAXB is used by both JAX-RS and JAX-WS underneath the hood. And what we are going to-- so in general, it's all transparent to us. We don't see this, because we deal with JAX-RS and JAX-WS later on in the later lessons. You will see that JAXB is pretty much hidden, and we interact with JAX-RS API for RESTful web services, and JAX-WS API for SOAP web services. But here, in this lesson, we just want to take a look and take a peek and see this API just to give us an idea how actually this API works.

So an overview on JAXB, it allows reading and writing XML documents. It is an object-based model of XML document structure, kind of similar to the DOM. Binds developer-supplied object types to XML with no need to read that XML into memory. And of course, and then insert the data into the domain object. So it is, by the way, annotation-based configuration of Java to XML mapping. We're going to see some of these annotations. And supports XML schema to Java class generation and Java class to XML generation.

So it is used by the JAX-WS and JAX-RS, like I mentioned on the board. And of course, return values and method parameters that are JAXB annotated class types are automatically converted for you. And that's the advantage that you have.

So here's an example just showing you the XML and the Java class comparison. So given the XML document that you have here, where we do have a [? prologue ?] in this case, which is just the version and the encoding, and then we have an object in this case represented in the form of XML with the root in this case tag representing person. And inside, it has an element, which is the name called Matt. And this pretty much is equivalent to the class that you have here. The class is person because of the root element that you see here. And the name in this case element would be a field.

And then of course, it has get a name and a set a name method. And the good thing about it is you see these @XmlRootElement. This is an annotations part of the API. Let's go ahead and just take a look at some of the APIs that we have in this case for-- they're all under the package [? javax.xml.bind.annotation. ?] And we have lots of these annotations, and the annotations types that you see here. And the one that we actually just have seen here is this annotation type XML root element. This pretty much maps a class or an [INAUDIBLE] type to an XML element. We're going to see that soon in the lesson.

So moving along and continuing with these APIs, the next thing is you want to read XML with JAXB. To read XML in this case [INAUDIBLE] pretty much with JAXB, it is typically taken care of by the JAXB context. It's one or more JAXB annotated classes, and an unmarshaller.

So the way you actually write this API is, first of all, we create a new instance of the JAXB context by invoking. So this JAXB context is also part of the API. And here's our JAXB context class. This, by the way, JAXB context class, provides the client entry to the JAXB API. It provides pretty much an abstraction for managing the XML Java binding information, which is necessary to implement the JAXB binding framework operations, which is making use of Unmarshall, Marshall, and Validate.

So here we'll go ahead and use-- so for on the JAXB context, going back to the API, if we take a look on the methods, we are going to see here again a bunch of methods that you see here that one of them is the new instance that you see here. So this new instance, as you see, is overloaded. And one takes, of course, a class to be bound. And then here, [INAUDIBLE] class [? to be bound ?] [INAUDIBLE] properties, and here a context path.

So in our lesson here, we pass in this case a class, which is person class, because that's the one that is going to be marshalled and then unmarshalled. And of course, we create an instance of JAXB. Once we get that instance of JAXB context, then at that time we'll create unmarshaller to get an instance of the unmarshaller. Again, that's part of the API create unmarshaller [INAUDIBLE] and then marshall that you see here.

And then once we get that instance of unmarshaller, this unmarshall also has a bunch of methods. We see that in the lecture. So we'll go ahead and first of all read the XML file, which is a simple read.xml pretty much representing the XML file that we've seen here. This one here.

So we'll go ahead and get that into an input stream, and then use the unmarshall method and pass the input stream to that method. And of course, [INAUDIBLE] return an object of type person. So in this case, we are making use of the unmarshall method, which is part of the interface unmarshall. And if you take a look at this unmarshall method, you will see that it is overloaded. So the one that we are using is the first one, which by the way takes an input stream, which represents in this case the XML file. That's what we're doing.

And once we get that instance of person, then we just invoke the getname, because as you know, the class has a getname which returns the name. And pretty much returns in this case Matt, which the name of the person. And we'll print it out. That's pretty much what we're doing. So this is the example of reading XML with JAXB.

Let's continue with this lecture, and now we'll look at writing XML with JAXB. Writing XML is accomplished by using the JAXB context, one or more Java-annotated classes, and a marshaller. So this time, we're going to use a marshaller. So again here, now we're starting from Java.

First of all, we have a class person. We create a new instance of person. We said the name, again, which is in this case Tom. Pretty much using this class here that we have. And then of course annotated with @XmlRootElement. And then after that, we create a new instance of the JAXB context, which by the way is going to go ahead in this case and marshall the instance of type person class.

And then once we get that, we'll go ahead and this time create a marshaller. So in this case, we are going to create a marshaller. So in this case, we invoke the Create Marshaller, which, by the way, returns an instance of a marshall.

Once we get that instance of a marshaller, then we'll go ahead now and create an output stream, in this case, with the file simple-write.xml. That represents the XML that's going to be generated. And then we call the marshall method, which takes [INAUDIBLE] an instance of the person, which is this one here that we are passing. And then of course the output stream.

So we turn out that this unmarshaller-- or rather marshaller interface, has a method in this case which is marshal. And that's the one that we pretty much were using. So we're using one here that uses an element, and of course the output stream [? too, ?] of course, in this case, marshal that one output stream. That's the one that we're using in here.

As you see, this marshal method is overloaded. In the API, of course. So we'll go ahead and of course use that marshal, which is going to take that person and marshal it into an XML file, which is going to be saved into this file called simple-write.xml.

OK. Moving along and looking at one example now which is the XJC. This XJC is very interesting because it is a JAXB binding compiler. This XJC, what it does, it takes an XML schema input and produces your Java package containing your Java classes. So the way you run it is typically this way, where you pass the XML schema, which is person.xsd. If you are curious to actually see how this person.xsd looks like, we show it to you here.

So it's pretty much, in this case, this is your schema. It has the root [? tab, ?] which is a schema. And of course, it has in this case the element from default, in this case, which is qualified. The target is the example. And then of course here you have the element, which is again, in this case, person, which is made of complex type that is made of a sequence that has an element name of type string.

And once you pass that, you will go ahead and create now, in this case, this is the package, all the Java classes that are generated for you on the fly. First of all, the ou.xjc, that's the Java package. And then you have your factory method JAXB-bound classes. You have also your place for annotations that apply to all of the classes in the package. And of course, a Java class for every complex type that you are marshalling in this case. And that's pretty much what we have here as an example for the XJC, in this case. We also have a schemagen. This is pretty much the JAXB Java to XML schema generator. So in this case, you start from Java and when you pass that to the schemagen, it's going to take one or more Java files as an input and produce your XML schema. The way you run it is this way. Here, for example, we are applying it for the person.java. And it's going to produce your XSD schema, in this case, and of course your person class. That's pretty much how typically it requires.

And of course, we should also mention that JAXB does not require an XML schema file for reading and writing unless you want to perform validation.

Moving along and now looking at the JAXB context. Like we mentioned to you, JAXB context is quite interesting, and actually which is part of the API. And it's part of the EE 6 specification. And This event has a bunch of fields. Again, the JAXB context factory. It has, of course, a constructor here, JAXB context. And it has a bunch of methods that you can actually use in this case. So here are create a binder, create JAXB introspector, create a marshaller, create an unmarshaller, create a validator, generate a schema, and then new instance.

All right. And so continuing with this, so the JAXB context, we said that it is the entry point to the JAXB API. It is used to obtain an unmarshaller that can read XML, or a marshaller that can write XML. And again, JAXB can be passed as a var-args class listing. So here's an example of how we actually create a JAXB context in this case by passing the class. Or, JAXB can be passed as a string of package names. And here's an example of a string of package names. That contains a bunch of classes.

Now one thing that we need to remember is JAXB does not, by the way, in this case, perform strict validation checking by default. So when reading XML, unexpected elements and attributes that are mapped to the Java elements are ignored. And when reading in XML, sometimes malformed XML will actually cause some unmarshalled exception, when calling unmarshall.

So if you want to keep track of validation failures, you can actually attach a validation event handler to an unmarshaller. So this validation event handler that we see here, we can actually take a look at that. Just out of curiosity, let's go ahead and put that into a tab and look at that. So this ValidationEventHandler, let me just look at the one in EE 6. OK. And that's the one that we're looking for.

So this interface, again, is the basic event handler interface for validation errors. If your application needs to implement customized event handling, it must implement this interface and then register it with either the marshaller, the validator, or the unmarshaller. It has a bunch of methods here, which is handle the event that you see here that takes a validation event.

So here's what we do in this case. We'll go ahead and create a new instance of the marshaller, create a new instance of the validate event collector. And then of course after that, we'll go ahead in this case and-- so we have, in this case, a ValidationEventCollector. Let's go ahead and pretty much create this. Just take a look at this out of curiosity.

And we see it here. This is a class, in this case. And this, of course, we do have a validate event handler implementation that collects all events. And so this class pretty much has a constructor that you see in ValidationEventCollector. And it has a bunch of methods which are the getEvents and handleEvent and hasEvents and reset.

So the getEvents return an array of validation event objects containing a copy of each of the collector errors and warnings. A handleEvent receives notification of validation warnings or errors. A hasEvents returns true if this event collector contains at least one validation event. And reset clears all collected errors and warnings. And you can go ahead and read that about these if you want later on on the browser. So once we create that instance of the ValidationEventCollector, we'll go ahead and of course use the setEventHandler on the unmarshaller, and attach that to the unmarshaller in this case.

All right. So continuing with that, now what are we going to do. We said that the JAXB relies on a lot of annotations. And we're going to see some of these annotations. One of them is the @XmlRootElement. This annotation is used to indicate that a class is used as a global root element. So if you apply that to a person, what's going to happen in this case, and in this case I said @XmlRootElement. And then I added in between parentheses name is human. What's going to happen is it's going to correspond to a schema that has the element, and then the name now becomes human because I did [? overwrite ?] this, and the type is a person. That's pretty much what it is.

So here I have a complex type name person, in this case. [INAUDIBLE] of course the element would be called human. And the type is a person. And by the way, we can see this also in this case in the package where you can see in the API where we have these @XmlRootElement, which by the way we showed you that this is an annotation. This annotation can be used again, in this case, with the annotation @XmlType, XmlEnum, XmlAccessType, [? XmlAccessorOrder ?], and so forth.

All right. Moving along and continuing with these annotations, the other one that we are interested by is @XmlType. This is an annotation which is used to specify the name of a complex type, and to specify also the order of the child elements. For example, here I applied this for the class person. I say it's @XmlRootElement with the name human as overwritten the name. And then I use the @XmlType where I specify that the name is individual. And then the property order in this case would be name first and address second. Which means whenever I apply this to the person class, and if the person has a name and then an address, then the way actually it will be created in the XML as an XML object will be the first element will be name, and then the second element will be address.

And by the way, this of course, @XmlType, you can find it here. So this is the one that we have. And so this [INAUDIBLE] maps a class or a name to an XML schema. This XmlType annotation can be used again with the top-level [? class ?] [? or ?] [? an ?] [INAUDIBLE] type. And of course, a class maps to an XML schema type. And of course class is a data container for values represented by properties and fields. Schema type in this case is a data container of values represented by schema components within a schema types [? content ?] model.

So this is the example of your XmlType. That of course we've seen here. There are also other [INAUDIBLE]. So of course here, there's a whole list of these enumeration types. We just see some common ones in this case. And you can go ahead and read about other ones in the API anyway.

The other one is that XmlAccessorType. This annotation on a class that controls, of course, in this case which are bound to an XML. And let me just show you that in the API @XmlAccessorType. And it's this one here.

So if I take a look at it, this is pretty much controls whether the fields or JavaBeans properties are serialized by default. That's pretty much when it does. So again, in this case, this @XmlAccessorType can be used again with the following program elements, which would be package or a top-level class.

And of course this annotation provides control over the default serialization of properties in this case and fields in the class that we see here. So let's see that. So again, in this case, and when we apply the [? @XmlAccessorType, ?] we again shows us in this case the option.

And if we take a look here, we'll see the optional here. And [? there are ?] the [? AccessorType ?] values that we have the accessor type that we are trying to use in this case, which is pretty much that enumeration, which is going to specify the @Xml type, which is an enum in this case. All right. And of course, the elements in this case would be in the elements details, which represents the [? @XmlType ?] value that specify whether the field or properties are serialized in this case.

Moving along and continuing with this, so as you see here, you can go ahead and pass the @XmlType, which could be a member, a public member. Public member means that all public fields and public getters and setters methods pair are bound to external elements. Field means that all fields, unless they are static or transient, are bound to the element. As you know, transient, when you set up a field that's transient, that means it's not serializable. And we know that static fields are not serializable anyway.

Or it could be a property. So that's field. [INAUDIBLE] property. Property, that means all getters and setters methods pair are bound to XML elements. Or it could be none, which by the way in this case means that no members are bound to XML elements.

## XML Parsing with JAXB: Part 2 14m

Let's go ahead now and look at the XmlElement annotation. This annotation is used to control the binding of class members to XML. Again, in this case, let's take a look at this @XmlElement as an annotation in the API. @XmlElement, which is this one here.

If we take a look at this one here, pretty much this maps to a JavaBean property to XML element derived from a property. And of course, this annotation can be used, again, as a JavaBean property in non-static, non-transient field, or within an XmlElement, which we are going to see later on. Again, the usage in this case is subject to some constraints. This annotation can be used with the annotation that you see here. And of course, if the type of JavaBean property is a connection type of an array, an indexed property, or a parametrized list, and this annotation is used within the XmlElements, then of course that XmlElement type must be default class since the collection item in this case is already known.

Anyway, a JavaBean property, when annotated with @XmlElement, is mapped to a local element in the XML schema complex type to which, again, the containing class is mapped. So let's go ahead and look at that. So here's an example where, in this case, I do have a class Person, which is annotated with @XmlRootElement. We know about that. We also have seen the-- and we have here the accessor type, which by the way in this case happened to be a none.

So in this case, we're on the name field. We'll go ahead and annotate it with @XmlElement with the name that is going to be first name, and the required is true. Which means this mapped the field to an XML, even though the XML accessor type is none. And also, the XML element name now will be a first name instead of name. And that's because we decided that it's going to be first name instead of name. Of course, the minimum occurrence value is left at the default value of one, instead of adding a minimum occurs equals to 0.

We also have another interesting annotation, which is really quite interesting. And that's the @XmlAttribute. This, by the way, annotation maps to a class member to an XML attribute. And this actually what it does, it allows you to decide which actually field is going to be represented as an attribute inside the XML file that is generated. For example, here I do I have a class Person, which happens to be an @XmlRootElement with annotation. And then on it, I do I have, inside the person, I have a field called name. And this field name is annotated, in this case, with @XmlAttribute. And because it's annotated with @XmlAttribute, that means that-- and then, on the other hand, the address is not.

So that's why when we generate the XML file, of course person comes from the fact that the Person class has the @XmlRootElement annotation. And then inside here, I have a name, Matt, which by the way represent that as an attribute. And that's due to the fact that I applied the @XmlAttribute on the name.

On the other hand, the address, I did not apply that @XmlAttribute. It's left as an element, with the tags address on both sides. Again, of course, and the address value inside.

So let's just take a look at this example. And this is, in this case, which is again just the one that we were working with, with @XmlAttribute. Let's go ahead and see that @XmlAttribute, which by the way will be this one here.

So this @XmlAttribute, in this case, we said it maps to a JavaBean property or to an XML attribute. That's what it does. And of course, the usage in this case would be on a Bean property or a field. A static field is mapped to an XML field attribute. So if you want the field to be an attribute inside XML, you just go ahead and annotate it with @XmlAttribute. And that's pretty much what it does.

One more also annotation which is useful, and this is @XmlValue annotation. This maps a class member to a simple content within a complex type, or a simple type where possible, which means it will go ahead and map just simple contact, instead of an element. For example here, I do have a class Person, which is annotated with @XmlRootElement, and I do have name, which is annotated with @XmlAttribute, which is going to be an attribute in the XML.

On the other hand, the address now, I decided to map it as an XML value, which means the corresponding XML structure would be what? Name would be, of course, an attribute. But on the other hand, because address is annotated with @XmlValue, I'll see only the value of the address, but I don't see the tag address anymore. So the difference between the two is that here I do have an element with a tag address and forward slash address. On the other hand, in this one here, I'm going to see only the value in this case. And that's it.

So that's the XML value, which by the way we can see in this case in the list. And that's the last one here. And if we take a look at this, [INAUDIBLE] pretty much any labels mapping a class on an XML schema complex type with a simple content or an XML schema simple type. Again, the usage would be on a Bean property, non-static and non-transient fields.

Continuing with that, and now looking at the enumeration. Enumerations, again, we all know-- and there are Java enums that can be mapped to XML enumerated values by using the XmlEnum annotation. So here, for example, I do have an enum called the project state, which by the way, has a couple of enums. One is late, the other one is really late. And as you see here, I'll go ahead and annotate that with @XmlEnum, because it's an enumeration.

And of course here, I'd also use @XmlEnumValue, and I said that was 0. Java identifiers can't actually start with a number, but XML enumerated values can. So Java identifiers cannot, by the way, start with a number. But of course, XML can.

So for example, when running [INAUDIBLE] on XML schema to generate your Java classes, if you have enumerated values that start with a number, they will always be mapped to-- they would be renamed. For example, if you have a value 1, it would be renamed to [INAUDIBLE] 1 in this number, it would be renamed to a value 1 for Java.

So here, just for completeness, let's go ahead and look at the XmlEnum. And that will lead us here to the XmlEnum here, which is this one here. This XmlEnum here is maps to an enum-- type enum to XML error presentation. This annotation, by the way, together with the XML value, provides a mapping to enum type to an XML presentation. So what we mean by that, with the, in this case, the ending value, this mapped an enum constant in an enum type to an XML representation. And that's what we exactly have here in this case, in this example.

We also have this enumeration that's called @XmlElements. This annotation is used to match a Java member to an XML schema choice structure. So here's an example where I can have now @XmlElements, with an S, where I do have a value, in this case, which is between braces. One is the the @XmlElement where the name is pie. And the class type is pie.class, and the required is true. And then the second one is the name is ice cream, with of course the type is IceCream.class. And then, it's required. And this of course here is pretty much applied on an object as an enumeration.

So this @XmlElements is used, by the way, to bundle more than one @Element annotations together. And let's go ahead and look at that. So we have @Elements, with an S.

And we take a look at this, you will see that this is a container for multiple @XmlElement annotations. Multiple annotations of the same type are not allowed on a program element. This annotation, therefore, serves as a container annotation for multiple @XmlElements. And in general, it's represented this way. OK, that's pretty much what we want to-- and of course @XmlElements can be used, again, on a JavaBean property, non-static property-- a non-static or non-transient field. And this annotation is intended for annotation a JavaBean collection property. That's pretty much what it is.

All right. So one more thing that I really want to add about this here is that XML schema inline binding can happen. For example, when running xjc, if you want to customize the generated class, you can actually do it this way. Where I have my schema here, and then if I want to customize, for example, here, the returning class would actually normally be person type here, because that's exactly what I want.

If I want to override that and customize that, and I want it to be actually person. So what I do in this case, I'll go ahead and use this XS annotation. And in it, I use the XS app info. And in it, I'll go ahead and use the JAXB class, and I specify that the name in this case is a person. That's typically how I want to, in this case, represent my binding customization, inline binding customization.

If I want to now use an XML schema external binding customization, if your XML schema cannot be modified, you could actually put your XJC binding customization in an external file. And we showed this as an example where you have between the JAXB binding, again in this case, and the schema location in my schema that I see here. And I have my binding.xml file here, which represents in this case JXB bindings, which represent in this case a node, which is a complex type. And we can actually process that or pass that through a XPath. And then of course the class in this case would be person. And then we could run this this way through this command here.

All right. So what we want also to let you know about this is that NetBeans support the Ant xjc task through an XML binding file type located in an XML new file category. And of course there is no support for schemagen. You may, by the way, run into the command line, modify again your build.xml, or generate the schema programmatically.

So here's an example where in this case I'll go ahead and create a new instance of JAXB context within my package. And then I'll go ahead and create a new schema output resolver in this case by calling the context and then on it, invoke the generateSchema. And then in it, I'll go ahead and create an output by passing the namespaceUri and the file name. And that returns a result, in this case, of course. And that of course will allow me to return a new instance of the StreamResult by of course creating a file that contains your schema.

And that's pretty much what we wanted to say here about this lecture. We do have a couple of quizzes to finish the lecture. One is JAXB performs XML schema validation by default, and that's not true. We know about that.

And then the second one is the default accessor type used by the JAXB to obtain the state of an object is, of course, in this case, we have four choices. If you read all the choices, you will see that D is the way to go. Public members, public fields and properties are used in this case.

Of course, every chapter finishes with a bunch of resources. These are just websites to read a little bit about the JAXB processing API, the JAXB homepage, and of course the JSR 222. And that's pretty much what we wanted to say about this lecture.

So one thing that I just want mention is that we did go through a bunch of annotations, but there are other ones, too. So the API contains all of this. Again, it's all under the JAX javax.xml.bind.annotation. You have the interface.handler, you have the classes. And then of course, you have your enums and your annotation types, which are all these annotations types that you see here. So it would be nice to actually read all of them. Here's your XML schema annotation, and so forth. All of these are available so you can redefine them and, of course, learn from them. Thank you.

## XML Parsing with JAXB: Part 3 3m

Now that we're done with lesson 3, let's go ahead and do some practices for lesson 3. Of course, this is related to processing XML with JAXB. So in this, we do have exercise 1, [INAUDIBLE] practice 1, where we create Java classes from XML schema. In this practice, what do you guys need to do is you are using in this case an existing XML schema to generate Java classes that you then use to read and write XML documents.

So again, the tasks are pretty much step-by-step. You go ahead and do that. And then after that, you are going to do practice 3-2, which you create in this case an XML schema from JAXB annotated classes. Again, this practice, what we need to do is we use an existing XML schema to generate Java classes, which again, you then use to read and write XML documents.

Again, the steps are petty much straightforward step-by-step, and you are going to apply some annotations. And of course, the one that is similar to the one that we've seen in the lecture, and then you end up doing the lab.

This is an option lab. Just to let you know, ladies and gentlemen, optional labs are really unless you finished with all the labs, then you can go ahead and try these. But before, just try the first labs first because optional labs, by the way, sometimes there are many of them and so it's totally up to you.

And by the way, if you skip them, it doesn't mean that you're not going to learn. You still are going to learn all the concepts from the existing labs that we have here. It's optional where we create Java classes from a schema. So in this practice, which is optional, and we tell verify with the instructor that you have time to complete it. And of course, like I mentioned, it's totally up to you. If you have time, go ahead and try it. If not, you can skip it. That's not a big deal.

So in this practice, you improve the creation of the xjb [INAUDIBLE] generated class by adding a custom JAXB binding instruction. Again, the steps are pretty much straightforward. And these are the labs for lesson 3.

## Practice 3-1: Creating Java Classes from XML Schemas 4m

OK. Now that we're done with lecturing of lesson three, let's go ahead and look at these practices, and we're going to start by looking at, in this case, practice 3-1, where we create Java classes from the XML schema. Here we use an existing XML scheme to generate Java classes that, of course, we then use to read and write XML documents. Let's go back to the NetBeans.

So we do have an XML file here, which is, in this case, the cardstart.xml. As you see here, it has the four of spades, and the two of clubs, and the joker, which is in this case red. And then this is the binding.xjc file that you see here. Pretty much has the JAXB bindings that you see. And then, of course, we do have the schema to Java file, and the schema to Java file, that's where we create a JAXB context with the JAXB card.

You know, and cards, and then, of course, after that we create an unmarshal. We read the cardstock.xml into an input stream, and then pass that to the unmarshal to get the root element, and then from there we get the stock type, and then we get the cards, and then we iterate through the cards. And, of course, a check, of course, if the rank ignores case, in case it's Joker, and we'll go ahead and print the information.

And of course, what we do here is once we run this, then in this case we actually are-- this will generate, actually. All these classes are generated. OK? And for example, some of these classes in this case would be the card type, which is generated for us, as you see here. Take a look at the annotations that we looked at in the lesson. The at XML accessor type, and the XML type.

You know, and suppose so, and you have your object factory, which is this one here. Class, you have the color type, which is this one here, OK? We can open them, actually, in a full screen. This happens to be an enum. And then, of course, we have the package info, and we see here. And the package info in this case is used to add the notations at the package level, as you see here.

And we can also, by the way, look at it as a whole, in this case in a full screen. And of course, we have the stack type, which is also in this case generated for us. And here's the stack type. You can see at the whole thing. And as you see here, all these generated classes do have the annotations that we were discussing in the lecture. OK? And that's pretty much what they want us to do in this practice 3-1. Thank you.

## Practice 3-2: Creating XML Schemas from JAXB Annotated Classes 3m

OK, let's go ahead now and take a look at practice 3-2, where we create XML schemas from Java and other JAXB annotated classes. So in this case we're given JAXB annotated classes, and then we generate the XMS key. Let's take a look at that. So we're given playing cards, in this case classes, where pretty much classes that do have all the specific annotations that we looked at, of course, in the lecture. OK.

Here's [INAUDIBLE], and there are more-- [INAUDIBLE] card, class, a rank. Here's a rank. Which happens to be [INAUDIBLE], JAXB index in this case, and the packaging for [INAUDIBLE] that we have. And then, of course, we do have a Java to schema, where in this case what we're doing is we're creating in this case a context.

And then after that we'll go ahead and, you know, invoke the generate schema on the context by creating a new schema outflow resolver. And then, of course, here we do have a create output. And then we'll create a new instance of the French card deck, which happens to be a card collection. And we do a shuffle, and then here we create a marshal-- this time we create a marshal.

And we said the properties in this case, and then we call the marshal method by passing again in this case the parameters to it. And then, of course, this will get us the card, and here's the card deck. Rather, the cardstack.xml, and here's my card scheme.

So as you see here, here's the card scheme that, of course, in this case we got. OK? And pretty much related to the existing in Java classes that we have. And this has allowed us to, in this case, create XMS schemas from JAXB annotated classes. And that's pretty much what they want us to do in this practice 3-2. Thank you.

## Practice 3-3: Creating Java Classes from XML Schemas 5m

Let's go ahead and take a look now at practice 3-3. You really don't have to do that if you don't have time. So this is why we tell you check with the instructor. So the idea is if you want to continue and do more and you of course are done with all the rest of the practices, then you can go ahead and try that. But it's not required really. And even if you don't do it, that doesn't mean you're not going to learn. It doesn't mean that you're missing something. Because the exercises that we asked you to do, or practices, those are good enough for you to learn from anyway.

In any case, this practice pretty much talks a little bit about a bunch of issues with the XJG generated classes. Again, the class names may not match what you want CardType generated. And you might again just want just Card or the method names may not match what you want, again, the StackType method, get card returns a list of get type. So again, Java convention would use a method called get cards to get that. Where in this case, there is no run enum, even though the XML schema-- in the XML schema, the rank type, users only enumerated values. If of course you look at the card type class, the rank is represented by a Java string.

So many issues like these can be corrected by using custom JAXB binding. And of course, these custom bindings can be accomplished in line in the XML schema file if it can be modified, or within an external binding. So if we take a look here within an external one, and that's the binding that xjb.xml, and that's where you have in this case a attribute which is the XML [INAUDIBLE] space JAXB, which is represented by this URL that you see here.

And of course again, this binding would be the schema location. Here's the card schema.xsd, which by the way is here in this case under the folder Card Binding. And that's your card schema.xsd that of course you're working with.

And this is pretty much showing you how-- and of course in the binding.xjb.xml, that's where you see the bindings here. And so you've got your bindings for again type save name two and three and so forth. These different type of bindings that you have.

Of course, the whole idea in this case is to be able to in this case use this, like I mentioned, this external type of file to, of course, in this case resolve of all the issues that I was discussing. And of course, if you run this project, then this would be the output that you get. So you see four of spade, two of spade, red of joker, and so forth. That's pretty much the output of these optional practice.

So like I mentioned, again, this optional practice is optional, which means it's not required. But if you get time and you want to play with it, of course you can go ahead and try it. And by the way, it's also available, the solution is also available, under Favorites. And if you take a look at the solution here under a lab, of course, in this case three, you will see that we provide you with a solution for that if you want to just take a look at it and compare to what you, in this case, have done. Thank you.

## Skill Check: XML Parsing with JAXB - Score 80% or higher to pass

Skill Check: XML Parsing with JAXB

View Skill Check
