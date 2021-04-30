# 3: Managing Persistence by Using JPA Entities

1. Managing Persistence by Using JPA Entities: Java Persistence API - 32m
2. Managing Persistence by Using JPA Entities: Container Managed Persistence - 32m
3. Practice 3-1: Creating a JPA Entity - 31m
4. Practice 3-2: Creating a JPA Controller - 7m
5. Practice 3-3: Testing JPA Functionalities - 22m
6. Skill Check: Managing Persistence by using JPA - Score 80% or higher to pass

## 1. Managing Persistence by Using JPA Entities: Java Persistence API - 32m

Let's take a look at the ways of managing persistence with Java Persistence API. First of all, in this chapter, we're going to cover different areas of managing the persistence. First, we need to figure out, how do we present the relational database content, tables, records in the Java world. And that's what we do with object relational mappings-- mapping Java classes, which are JPA entities-- Java Persistence API entities-- to database tables views database content.

Then, once we've sorted out the mappings, we start using these with database transactions, with interactions, querying, data from the database, updating, deleting, creating new records. So for that, we use the class called Entity Manager. So that's another important part of this chapter.

Of course, as we handle interactions with the database, we'll need to think of the way of converting values from whatever formats they're in in Java to the formats that the database would understand. Validating data and also some other things, like, for example, generating primary keys from sequences. Key generation.

Part of the chapter's content would also cover transactions and locking mechanisms that we could use in Java Persistence API. However-- and this is an important point-- the transaction topic continues beyond this chapter. In the Chapter 4, which covers enterprise Java beans, we pick up the transaction topic and we continue it there. So we'll have part of it in this chapter-- just the part that relates to the database part-- but we'll then have to go beyond just the database interactions and figure out how transactions work in Java EE overall, not just for the database.

And finally, one more thing in this chapter that we're going to cover is the ways of using Java Persistence Query Language, JPQL. It's kind of an interesting mix between syntaxical world of SQL and object world syntax of Java. So we're going to take a look at that JPQL language and how we can utilize that in our applications.

Let's start with the basics of the JPA API Java Persistence. First of all, it does not have to be exclusively something that you do in a Java EE container. You may as well use the Java Persistence API in a Java SE, not just Java EE, so it's valid in either environment.

What we establish is a persistence context object which will be managed by the class called an Entity Manager. So persistence context managed through the Entity Manager. Entity Manager will be responsible for carrying out actions against the database-- creating, removing, updating, querying records, this sort of thing. So actions that we do with our tables.

Now, in a Java world, the data from these tables will be represented as Java objects. So a table can be mapped to the class. A record in a table will be represented as an instance of that class. Well, here's quite a trivial example of products table. Some products. Cakes and cookies. Just because they're sweet. Mapped to Java class and then represented there as Java objects.

So we could operate on the relevant Java objects and in return get actions against the database. And JPA API will translate our actions against the object to the actions against the underpinning table and persist the data are queried. Now the JPA API has an interesting history. It has been kind of developed backwards. It didn't emerge from the specification that was then implemented by different providers.

Quite opposite, it was actually an implementation first. There were companies like, you know, APIs, Eclipse Link, Hibernate, Top Link, you name it. Quite a few different APIs that were doing the job, and then they were combined together under the common standard under the umbrella of Java Persistence API and they became now known as object-relational mapping providers. So there are physical implementations behind the JPA specification. But the way they historically emerged-- the way they were historically developed-- was without that umbrella JPA spec. That emerged later.

So we're going to use the ORM provider behind a JPA, but we are not on this course going to write a single thing that will be ORM-provider specific. We're going to stick to the standard. We're not going to do something that will only work in Hibernate or only work in Eclipse Link. We'll try to keep things provider-neutral. Stick to the standard JPA specification.

Of course, the providers might have some unique features that are only available in a given provider, but hopefully by the end of this session and the exercise, you will probably see that there's not that much rationale behind using such features. So these days, JPA API covers pretty much all bases. Right.

Now, configuration file. There's one config file here and it's called Persistence XML, and unlike other configs which we've encountered so far in this course-- remember we had all the deployment descriptors. Was Web XML, ejb-jar.xml, Beans XML. What was it that was said about them? They were all optional, right? You could have just done annotations.

Persistence XML is not. You have to create this file to configure persistence context used by the Entity Manager. So that's pretty much mandatory. You have to have it.

However, object relational mappings-- so the bits that we map with these ORM providers-- they could be governed entirely by annotations, and optionally, you can create an ORM XML file to do the mappings but that is optional. So you could just map your entities to underline tables through annotations and that's it.

So how do JPA mappings work? Let's take a look at the basics. We have this class, a product class, and we map it to the database table. All we need to do to do that is just say entity. If the table name is the same as class name, actually you don't need to do anything else, funny enough. Well, almost nothing else. But if the table name is different, not a big deal. You can always overwrite what the table name is-- say products. Well, as you see, the class is called product. Well, there you go.

There's one more thing that's actually mandatory. You must specify where's your primary key. So some attribute needs to be designated as your identity of the record. Otherwise, how on earth would the Java API figure out which instance of product corresponds to which record in the products table? So that's done by using that column [INAUDIBLE].

If the name of the column is the same as the name of the Java attribute, you don't need to do anything else. If the name of the column differs and the Java attribute has a different name, just use the column annotation. Not a big deal. Just override that name to match. Because maybe in Java you'd like to use a different naming convention. That's perfectly fine. So also, your Java attributes may be associated with a series of validations, but we'll talk more about validations and constraints a little later. At this stage, we just have a NOT NULL constraint here just saying that the item is mandatory but there will be a later page in this chapter that we'll talk about other validation cases.

With dates, times, and time stamps, you might have to designate a particular type of date object that you are using. It may be a date or it may be time or it may be both. Time stamp or go figure. And you see, in Java, these values may be presented in the same way as, say, Java date, but in a database, there might be different types of columns. So you might have to designate which one of them you are talking about when mapping something that is date.

Now another interesting point that you observe here is this annotation called Version. Again, a later page in this chapter will unravel more information about it, but it's basically the way to keep track of changes that occur on a record. Every time you update it, you can say, for example, increment that version's integer value. Alternatively, you can use the timestamp but that's not particularly advisable, actually. So it is something that we may benefit from when we handle the locking of these records. Again, there will be more information about it in a later page.

So, bottom line. Do you want to map your Java class to a table? Say it's an entity. Designate the ID. Everything else as necessary. Yeah? OK.

When you map Java class to a table, there's a bit of a trick there with regards to what exactly you map in a class. And there are two options here, known as a field or a property. A field means that you are considering a mapping of an attribute. A property, you are mapping getter setter method pair. A default mapping is mapping of a Java instance variable. That's the default.

If you want to map not just the variable price but something you'd do with that price, well let's say you've got some logic here. You're calculating things. You're subtracting discount, you're adding it or whatever, yes? So some logic in these getter setter methods. Then, instead of mapping the price attribute, you put the annotation-- it's called column-- on a Get method that will work actually for both Get and Set. You don't repeat the annotation on Set method. That's not necessary. Just on the Get method is enough.

And immediately what happens is that, in a database, the value of the price attribute will be stored all right. That's still the case. But in the application, every time we handle the price, we'll go for this extra logic. Well I don't know, maybe we need to calculate discount when we set the price or something like that, yeah?

Oh, and if you want to switch off the mapping of a particular item to a table completely-- so this Discount field, for example, imagine you want that Discount field to be present in JPA memory in Java but you don't want a column and a table like that, for whatever reason, right? You can mark it as transient.

Did you notice transient is not a Java keyword here but an annotation? So it's not a transient field, per se, from the language point of view. It's a transient field from the perspective of JPA API. It's not trying to persist that particular item to the table for maybe the reason that you don't want to store it there.

By default, the fields are mapped to the database table columns. However, this is something that you can overwrite and here is how. It's the annotation called Access. So by default, it's a field.

In other words, what's written right here is actually excessive. When you're saying, Access type field, it is the default. But then again, you can say Access type property. Well that isn't, so you can overwrite it. And what is happening here is that, when you switch the Access type to property, you enable the getter setter methods to be mapped rather than the attribute.

Beware, if you're playing with Access type annotation, you could accidentally map an attribute, like price, here. And the getter method as well. Default on a class says field so the price attribute is mapped but then Access type property is placed on the getPrice method, so the method is mapped.

So which way is it mapped? Both. We are creating here a duplication of a mapping. That's something you'd rather avoid, right? So in order not to create such a duplication, you can mark that column as transient. Trust me, we'll still be persistent because the getPrice is mapped as the Access type property and you just sort of switched off the mapping for the field for that particular item.

It's a little weird. I don't recommend you're actually doing that but this PowerPoint helps you understand how you could switch the entire class, default, from field to property if you need to and how you could do it for an individual attribute. Just be careful not to overuse this feature because it can make it hard what it is that you're actually mapping. All right.

Converters. A converter helps you to convert the value you've got in Java to the value you want to store in a database and vise versa. There are different use cases for converters. Maybe, in a table you want to store several columns and in Java you want to present them as one embeddable type. Maybe. So convert several values into one value or vise versa.

Maybe you want to store something in a database and present it in Java as your custom class. You see, the thing is that converters for basic data types are provided out of the box. You don't need to write a converter to convert an integer or a float or a big decimal or a string or even date. These converters are available for you.

But if you're creating your own custom data type and you're using a class the JPA API isn't aware of, then you have to provide a converter to convert values of that type to your whatever you're storing in a database-- varchar, number, whatever. Whatever type you're storing in the database. So you will be responsible for such conversion.

Now here's a tricky one. You see, this example stores in a database date. So conversion is to date type. Conversion from, conversion to, to date type. But what it is that we're converting to date? Local date. Local date is a new feature in Java SE8 and it's recommended to be used [INAUDIBLE] the API local date, local time, local date time is recommended to be used instead of the old time date, which you can still use, obviously.

Unfortunately, JPA standard has been finalized before Java SE8 has finalized the local date API as a standard. And as a result, most of the JPA providers, ORM providers, treat local date as an unknown class. They don't know what it is. They don't consider it to actually be a date. So they don't provide an automatic converter.

So this is a very practical example. It converts local date to date and vise versa. It's very simple stuff to do. You just have to provide two methods. One is called Convert to Database column. Another is called Convert to Entity attribute. So one accepts local date returns date and other accepts date returns local date. And you do it for whatever type of conversion you need. It's not just about local dates, this is how you write converters anyway.

So you provide the logic. How values should be converted. All that's left is to apply the converter to your actual code. There are two ways of doing it. You can apply globally, alt apply true, on a converter annotation, or you could apply it for an individual attribute to say which converter would you like to use. Whatever.

Oh and you can disable converters as well. There's a disable conversion annotation there if you don't want to do the conversion for some reason. There you go. So I suppose it's very-- actually, this is something you will do on the exercise. You will be asked during the practice to use local date instead of date, and without a converter, your ORM provider would not work, so you'll have to provide that as part of the practice.

Generated keys. Your primary key may be generated from a sequence. It's actually something that people often do. There are different key generation strategies. There's a couple of examples here, called sequence, table. There are more. There's [INAUDIBLE] option where you don't specify how the key is generated. You tell into ORM provider, go figure. Automatically generate me the next value. There's an ID column option. But these are the couple of examples using the database sequence. And then the other one is using a table.

By the way, did you know that generated value annotation references the generator just by using the name. So that's the bit that has to match. In other words, this instruction can be placed somewhere else. You could just describe sequence generator in some other part of your code, and then simply, any entity where you want to use it, just say which one and simply use the name. The same thing happens here. So we just match the name.

It's often that people describe it in the same entity because it kind of makes sense. Yeah, you kind of do both things and say this is how I would like to supply primary key column values. But you don't have to do it. For all I know, you may just use the same generator for different entities. That's not prohibited. OK.

When you manipulate with an entity, you could persist it, create a new record in the table, you could update it, you could remove it, delete the record, and you could query. Load the record from the database into Java memory as the entity object. Apparently, you can create interceptor methods for all of these events. It's as simple as that.

You know it's like a pre- and post-triggers. Before update, after update. Before delete, after delete. Before insert, after insert. And after load. Well, any additional logic that you'd like to put into these methods-- maintained, normalize, columns, they put extra validations. Maybe calculate some values. Calculate default values for different fields. Something like that. So you could put these into the lifecycle methods.

Talking of validations, there's an API called Bean Validation 1.1 and this API actually is not just using Java Persistence API. It's used all over the place. The Bean Validation can be used with Java Server Faces, with JAX-RS web services, with CDI beans. It's a way of universally validating Java code. Just generally validating things in Java code anywhere, not necessarily just with entities. But most certainly it makes sense that you would like to validate data that you put in a database, so with JPA, it's kind of the most obvious use for the Bean Validation API.

Bean Validation, by default-- it's configuring Persistence XML. You can switch it on for JPA API using Persistence XML. And by default, it has the property called Auto-- turn on validation when there is a validation provider available in a classpath. Bean Validation is implemented separately from the JPA, so the provider for JPA API and for Bean Validation API might be two different providers.

If you run the JPA on the Java EE server, Java EE server is already configured to support the Bean Validation. Therefore, when you have an Auto property, it just works because you have it in your classpath. It's already there. But didn't I tell you at the beginning of this chapter that a JPA may be used in Java SE environment. Ah. Well, there, there is no server that will configure it for you, so the Bean Validation might not be in your classpath, in which case the default value of Auto leads to no validation.

You put all the validation constraints, you've written all the code, you run it, nothing happens. No errors. Nothing happens. You put clearly invalid values and they're not flagged to you as invalid. If you want to prevent that from happening, change the validation mode to Callback. Because you see, with a Callback, you will force the JPA provider to throw you an exception rather than proceed with validations turned off. So you're saying, don't run. Throw the error if I haven't correctly configured the implementation behind a Bean Validation API. It has to be in the classpath.

The first exercise that you were doing with Java Persistence API in this course-- well, this chapter-- configures the JPA to run in Java SE environment. So your job-- part of the exercise-- will be to set up correct classpath library for Bean Validation. Later on, we'll do the same JPAs. We'll run them in the Java EE container. You won't need to do it. In the Java EE container, in Java EE server, that's already configured so it just works.

So that's the comment on a validation callback reason. Yeah, why would you change from Auto to Callback? Because you want to force the persistence exception if it's not properly configured.

There's one more thing that I like to talk about on this page and these are the points in time where the validation is fired. When is it triggered? By default, it's triggered only on pre-persist and pre-update. That's the default. Well it's a little bit obscure as to why do you want to turn the validation on in pre-remove. Well, you can. I mean, if you're deleting the record, what's the point of validating it? Maybe they is, I don't know. But OK, if you feel like there is a point of doing it, then you can modify that configuration file and include the pre-remove, but that's up to you. By default, as I said, the pre-remove is not triggered in the validation cycle unless you reconfigure it. So these are known as the validation groups.

Now talking about the validation constraints. All right? In the earlier page, we've seen this NOT NULL validation constraint and I've told you there is more to it. Wow, quite a few more things to it. A search true, search false for Boolean values. Decimal mean and max.

Digits. Total number of digits. The fraction digits or two digits after the dot in this particular case for some floating point number. Size between 2 and 100. That's number of characters in a string, for example. Min and max. Range of values for an integer.

Not null or null. There's actually something that you designate that has to be null. Future. And that's really just future and past. It allows you to tell if the date is before or after current time. So you can validate these things as well. And regular expression [INAUDIBLE] so you can do the reg access as well. Quite neat, huh? So these are the Bean Validation constraints.

You actually can create custom validation constraints. An example of a custom validation constraint is placed into the appendix, so we'll cover it as a part of the appendix. Now how do you specify a message that you want to produce when a validation fails?

Every constraint has a default message. It's right here. For example, size. Size constraint-- this one, yeah? Size constraint. Let me highlight that for you. Has a default message of Java X validation constraint size message. Size has attributes of min and max. Min and max. Can be referenced from the actual message as kind of variables. And you could put this standard message into a file called Validation Message Properties, which are put into your classpath.

You may design messages that are not standard but custom. This one. Product best before. So that's a custom message. How do you reference messages? If it's a standard message, you don't need to do anything. So this field here using the size annotation will automatically display the standard message coming in from Java X validation constraint size. Automatically coming from that. And yeah, that will be the message attached to it.

But if you want a custom one, all you need to do is reference the message as a property of the annotation. So in this particular case, future annotation, the message equals-- do you notice the curly brackets? That's an expression. That's what makes product.bestbefore to be interpreted as the key inside a resource bundle rather than just as a straight text. So it's interpreted as a reference to the bundle.

Of course you can just hard-code the text, as in the first example. Well that's not particularly inventive, but you may just hard-code the text. Obviously using the resource bundle is preferred because then you can modify that resource bundle without having to touch your code. It's much more flexible if you change your mind about what error message you would like to display.

You can validate anything, anytime you want, by sticking to this annotation, [INAUDIBLE] Valid. Just on a method. Just a method. It doesn't have to be linked to a lifecycle of JPA or just the arbitrary bean receiving the parameter would like to check if that parameter is up to scratch. Just think [INAUDIBLE] valid annotation and be done with that. Very easy to do.

## 2. Managing Persistence by Using JPA Entities: Container Managed Persistence - 32m

Now let's talk about not just entity mappings, but what we do with these entities when we run the application code. We use them to manage persistence, right? And that needs to be configured. And there are a couple of options as to how you can configure the persistent context in which entities will be used.

The class that will handle persistency for us is an Entity Manager. But Entity Manager needs a configuration. That configuration is provided as a persistence.xml file.

You need to create a configuration which has two important properties, transaction type property and name. Name property is quite straightforward. When you're injecting the Entity Manager into your code when you use the persistent context injection, which persistence context you want to inject? Which configuration you want to switch on? You use the name of persistence unit to do it.

So persistent unit is a config inside the persistence.xml file. Persistence context is an in-memory environment created by the Entity Manager, which uses the persistent unit as its configuration.

And there are a couple of options here. So as I say, the transaction type is another key factor here. The transaction type could be JTA, in which case it will be managed by container. So it's something that you probably do in the Java EE server environment. You are just referencing here which data source you would like to use. And you expect the rest of the plumbing code to be dealt with by the Java EE container.

The other option is transaction-type RESOURCE LOCAL. And that's what you do if you want to run the code outside of Java EE container. Then you won't be able to benefit from things like data sources provided by the Java EE server, so you have to configure the whole provider and the connectivity with the database, like URL, username, password. All the stuff that you expect the Java EE server to configure for you you have to configure in persistence.xml file, because you're running this code outside of Java EE server. And then you can start managing your transactions.

Now, JTA option, previous page, implied the transactions were managed by the Java EE container. RESOURCE LOCAL option implies that you have to manage transactions programmatically, begin them, perform whatever actions, commit, rollback at the end, depends what it is that you want to do.

Also, there's a slightly different way of initializing Entity Manager. On a previous page-- let me just go back very quickly-- the Entity Manager was initialized simply with this PersistenceContext annotation. That was it. The rest of it was done by container.

In Java SE environment, the Entity Manager is initialized with an EntityManagerFactory object. You have to create a factory from persistence with that particular name of persistence unit. And then that factory has a method called createEntityManager that actually initializes that.

So in a Java SE environment, it's a little bit more long-winded. But there you go. You are not having the support of Java EE container, in this case.

More on transaction management with regards to the container-managed environment would be covered in the chapter which is on the Enterprise Java Beans, implementing business logic with Enterprise Java Beans. We'll talk about exactly what's happened with JTA transactions in a Java EE server there.

Now, once you've injected the Entity Manager, what do you do with that? So you have the Entity Manager initialized. It's available.

Entity Manager manages the entity life cycle. And these are the phases of the entity life cycle. Let's try to figure out what's going on in this code example.

Let's start with this one, Product p1, new Product. This is known as a new state. Just created a new object.

This object is not tied to any database record just yet. We haven't saved it anywhere. It's just an in-memory Java object. And that will be the case until we persist it. When you call the operation persist, you take that object and you tell the Entity Manager you want to save it to the database.

Apart from saving it to the database, the Entity Manager does something else. At this stage, it's only your code that referenced that Product 1. Your variable p1 referenced that product.

However, after you call persist method, Entity Manager itself is now referencing that product as well. You have a pointer to it. Entity Manager has a pointer to it.

This product becomes in managed state. A memory area, known as persistence context, managed by the Entity Manager has a reference to that particular object. That's what managed means.

How else the object could get to the managed state? You call a method find. If you query with the Entity Manager a product from the table, let's say want to find a product with ID 2, something like that, as your primary key, so finding the product number 2. The returned Java object is also in managed state. Not only you have a reference to the p2 variable, to that product, you have the reference, but Entity Manager references the same object as well.

What does it mean, being managed? It means that if I set the property on the object p1 or p2, doesn't matter any one of them, p1.setPrice, p2.setPrice, who cares, you immediately cause the update of the database record. The Entity Manager just goes ahead and changes that record for you. That's what managed state means. You just call the set method and the record is changed, not just the Java object, but the actual table record.

Also, when you want to remove that record, you can delete it, em.remove, Entity Manager remove. And remove method brings the object from managed state to removed state, as it's another state. Of course, if you attempt to do something with removed object, it's not going to be updated in the database.

I suppose you can persist it again, just like with new. When you created a new object you could call persist. And that brings it to managed state. If you removed it and you called persist, it will actually also bring it back to managed state, so you can reinsert the object. I suppose you can do that.

You can then move the object from managed to detached state. Detach means that you are asking the Entity Manager to exclude that object from persistence context. So you still have a pointer pointing to the object p1 at that stage, but Entity Manager doesn't.

So what happens when you set it's price? Say p1.setPrice, the record is not updated in a table, because the Entity Manager is not tracking it. You detached it.

OK. So you just changed the Java object. The record hasn't changed. Do you want to update the record? I suppose yes, eventually. And you can call the merge method to do it.

Merge method will take whatever changes you've made on the object and will apply them to the underlying table, will update the actual records. By the way, merge method returns you another reference of a managed object this time, so it puts it back to the managed state if you need to.

Why would you detach the object? Well, I guess the answer is quite obvious. You want to do a number of changes before you try to update the table. You want to set different attributes and then update them all in one go. Kind of makes sense.

However, there might be other circumstances at which the object will get detached. So you might just call detach method. But also, other circumstances include end of transaction or serialization of the object. If you took that object and you serialized it, or if you committed or rolled back the transaction, the object will go from managed to detached state. It's only whilst the transaction lasts. Then it's detached.

If you attempt to remove a detached object, you will get an error. If you attempt to merge a removed object, you'll get an error. If you attempt to merge a managed object, you'll get an error, because remember, managed object is automatically updated anyway, so why merge it?

A couple of other things. If you call merge on a new object, you'll kind of persist it anyway. But it's not recommended. It's recommended to call persist. It's more sort of explicitly saying you are doing insert here rather than attempt an update.

There are some operations that it can perform in groups of entities as well. Flush, for example, will synchronize all managed entities with the database. Refresh, the opposite of flush if you like, will re-query managed entity instances from the database back into memory. So maybe there's some other transaction change in them. You want to get them from the database back into memory, re-query them.

contains method, a very simple one. Boolean, true, false, is it managed or is it not? That's what contains managed tells you. Remember, managed means that the reference to the object is present inside persistence context. So contains method says, asks the persistence context, do you have a reference for this object? If it returns a true, it's managed. If it returns false, it's detached.

And then finally, clear method, it's a group operation that allows you to detach all entities from persistence context together, rather than calling the detach one by one. It's just a group operation, I guess. OK. So this is what you expect an Entity Manager to do for you.

We did mention locking and version options a little early in this chapter. And I promised you there would be more information on that. So here comes this more information part.

There are different locking strategies you could use, pessimistic, optimistic, read, write. So let me run some explanations for you. First of all, the pessimistic lock means that you would like to lock the record in the actual database.

So for example, a user tries to update the record. You don't want to commit it yet, but you want to go and lock the record. So maybe there's a number of changes you'd like to make and then you would like to apply them all or rollback them all, so commit and rollback will be done at some later phase. But you've already applied locks to the underlying records.

Applying a lock to the record will prevent any other session from updating that same record together with you. This could have serious consequences when you deal with an application which client is not statefully connected, with transient connectivity protocol. Let me explain.

Imagine you are dealing with a web browser client. So you open the browser, you go to some website, you say, I'd like to update that product. Suppose the web application behind it used a pessimistic lock. Let's imagine.

So you're saying, I'd like to update the product. You made an update, but you didn't commit. The record is locked.

You put the reference to that into the HTTP session so you can return the next call with another request and do something else. Unfortunately, your user closed the browser, just accidentally. Ouch. Or client crashed, whatever. Things happen.

So the client opens the browser again, goes back to the same website, says, well, there is that record I was just working on. Can I just continue with that? No. It's locked by another sessions. That other session is the previous session of the very same client, who just dead-locked himself. I mean, you know, the session will eventually time out and the lock will eventually be released and will be rolled back.

How long is your session timeout? Ask your server administrator. 20 minutes? So you lock yourself out for 20 minutes from doing anything on that website with that record on which you worked? That's not fun, yeah?

So the other approach-- I mean, if you had a permanently connected client, that wouldn't be a problem. If the client used something like RMI protocol for connectivity, the connection is broken, that's it. You know exactly what happened. Client is gone. You can rollback whatever you want to rollback.

But with HTTP protocol, you can't tell. You don't know if the client is gone or not. You can all relay upon a timeout. So pessimistic lock with a transiently connected client could be a disaster.

Now, so what's the other option? Optimistic lock. Well, it's called optimistic because we're not looking the record in the database. We're kind of hoping nobody else will update it.

So you are updating the record, but just in Java memory. You're not actually doing anything with the database table. That means that another user simultaneously with you could go and attempt an update on that record, right? Oh, that will be a mess. We can easily compromise the database integrity.

To avoid that integrity compromise, the optimistic lock is often used together with a version attribute. All you need to do is create an attribute in your entity, obviously mapped with appropriate column. So there's a version column on the table. There is a version attribute in the entity. And it's annotated as version.

OK. So that's that version. There you go.

Suppose twp users concurrently retrieved the same record. So far, so good. They can do it. No problem at all.

So there is this user who retrieved the cake and that user who retrieved the cake. And one user says, well, let's change that cake's price to 1.5. And the other user says, let's change that cake price to 1.2. OK.

If it's a pessimistic lock, only one of them will be able to make the change, because they will lock out on the database. But with an optimistic lock, both of them can make the change in Java memory. Nothing prevents them from doing that change, because they're not locking the record in the table at that stage.

So they change that price. And now, whoever is going to commit the transaction first posts changes to the database and commits the transaction. Whichever one of these guys is doing it first will kind of win that competition. So suppose that's the guy who changed to 1.2. Suppose it's that guy that does the post first.

So he posts the record to the database. And what happens at that stage is version number, which was 1, will be incremented. It will become 2. And you see what is happening. What Entity Manager does is just before posting that record and before incrementing that number, it actually checks if the number in Java memory is the same as the number in the table.

So this is 1 and in the table it's 1. It's going to increment it to 2, but it first checks. All right. So transaction succeeds. It commits it. The record becomes 2.

What happens with the other guy who updated it to 1.5. He tries to compare his version 1 and it doesn't match anymore, because that's 2 now. In the table that's not 1 anymore. There you go.

So the second transaction will get an optimistic lock exception saying, that record has been changed by another user. That's fine. We don't override somebody else's update. We can re-query it. We can decide what we want to do about it.

Maybe we still-- after we re-query, we may still wish to proceed with that update or not. I don't know. Depends. But at least you don't step on somebody else's toes. You don't just blindly override that record.

And I'm afraid an optimistic lock is what you have to do in web-based applications most of the time, because, as I say, a pessimistic lock could cause a serious concurrency problem when your client is using transiently connected-- when you're using transiently connected clients, because you don't know when they drop out. And then pessimistic lock kind of left dangling for a while.

So another important point that I'd like to make generally. To make the application better scalable, try to write code that works with shorter transactions. Don't do lots of locks and then flush lots of things in one go. Moving shorter transaction means that you don't have to keep in Java memory things that are not in the database for a long time. And you're running less risks of desynchronizations or-- as you move along trying to update things as appropriate, an optimistic lock could certainly help.

One more thing. Version attribute, what it could be mapped to in the table. Typically an integer, could be short, could be long integer. Could be timestamp. All the JPA providers support timestamp for the version number.

My advice don't use the timestamp. Bad idea. Guess what happens on the cluster.

Two concurrent users on different cluster nodes can easily coincide with exactly the same timestamp to millisecond. And yeah, that's generally what can happen. So you'll have then a very kind of strange situation. Who's going to win that contest? And potentially, you can accidentally update somebody's record without knowing that they updated that, just because it happens on the same millisecond. So an integer as a version and a numeric as a version, a simple number, probably will work best. It's pretty straightforward to implement.

OK. So good news, you don't need to write any of that code that I've just explained. You just stick @Version annotation. And optimistic lock is default anyway, so ta-da.

If you want to override it and make it pessimistic lock, consider the type of client. If that's appropriate, why not? Maybe you've got a desktop client with permanent connection to the server. That's fine. Use pessimistic look then.

That's how you change the locking mode. So optimistic is default. You could change the locking mode for a particular query. See here, find method. And where we're locating the record, we're saying lock the record immediately.

When we refresh the record, there is a separate method called lock so you can explicitly call that to lock. You can change the locking mode on a query. We haven't yet covered JPQL queries. We will in a moment. That's our next thing that we'll talk about. So we'll be covering JPQL. But when you run the JPQL query or SQL query, you can also say which particular locking mode you would like to use.

Let's take a look at the Java Persistence Query Language, JPQL. It very much looks like SQL, but it's not exactly. You see, it's not referring to tables and columns. It's referring to Java objects so that product or name or price are not table and column names. They're names of Java entities and attributes.

And which tables and columns that translates to will be decided by the JPQL query through the mappings of the JPA entities for the object relational mappings to the underpinning table. So that will translate eventually to some SQL code based on what the JPA annotations are. Now, you could use a variety of different statements here, like SELECT, WHERE clauses, GROUP BY, ORDER BY, anything really, pretty much usual SQL sort of operators.

You use parameters. There's two styles of parameters, named parameter and positional parameter. Positional parameters would have question mark, 1, 2, 3, 4, position enumerations. And named parameters would have names here.

Also, I'd like to point out that apart from writing JPQL SELECT statements as on first example, you can also use JPQL to create, update, and delete statements. Think about it this way. If you have a number of entities you want to up date, do you want to go and merge them one by one? That will cause an Entity Manager to do separate update statements on each one of them. How many network round trips that's going to be?

Or remove. What if you want to bulk update or remove a number of records in one go? Surely the JPQL statement will be more efficient at that than a record-by-record painstaking update with merge or remove. So group actions, quite useful.

One thing, though. Tell me what do you think? Version attribute, is that going to be updated to plus 1 when you're running the JPQL update?

Sorry. You have to do the version plus 1 yourself as part of the update statement. When you're calling merge methods or when you set attributes, yeah, that optimistic lock version thing works like a charm. When you're doing bulk actions, it's not. So you have to explicitly update the version attribute in that case.

All right. But apart from that, it's pretty straightforward. So bulk actions, queries, updates, deletes available with these JPQL statements. There's more to it, and I'll show you some further examples.

This is an unusual one. Take a look at this operator, NEW. What it allows you to do, it allows you to query things from different tables maybe, from different database storage objects, into non-entity.

Look at the ProductOffer. It does not have an entity annotation. A normal JPQL query implies that what you are retrieving is an entity. In this case, you have entity Product and you have entity offer, whatever they are, I don't know, so whatever stuff you've got.

But you don't have the product offer entity. You have it as a Java object all right. But it's not mapped to any specific table. And that stands reason. You may wish to query things from the database in various combinations, not necessarily exactly in one way in which you mapped your entities. So some flexibility would be required.

If you call the SELECT NEW operator and you operate on the entity here, well, they'll just create a number of entities in a new state, which I kind of wonder why you want to do that, because what was wrong with just querying them? Why do you want to create-- query them as new records. I don't know. Maybe you want to create like new record as a copy of existing or something, maybe. But otherwise, you'd probably use it to selecting to nonentity objects.

All right. So you can execute the JPQL statements. Can I just go back for a second? When you're creating the JPQL statements, you're giving them names, right?

This one, that's a name, right? And if you go back, yeah, they all have names, named queries. These are the names. You could call them whatever you like. It's just a string.

So when you want to execute such a named query, what do you do? Entity Manager, createNamedQuery. Basically, this method retrieves the definition of named query, set parameters on it, whatever you need, and execute. Execute could be done by getting result list if you think that it will return you more than one record. If you think it's going to return a single record, called getSingleResult. And if it's not a SELECT, but say UPDATE or DELETE, then you can do the executeUpdate. There you go.

Also, you can create JPQL queries on fly, dynamically. So this second example here is not using pre-coded named query through the annotation, but just creating it on fly. There's a whole API with which you can do it. It's called Query Builder. So you could use the sort of dot dot dot notation to create a SELECT clause, a WHERE clause, a FROM clause, beat by beat construct this statement, or just construct it as JPQL statement as a string, whichever way you want to do it.

And then the same thing. You would like to set parameters and execute the query. OK. So these are the JPQL basics.

And I think that is it for this particular session. So we've looked at how do we take an entity and map it to the underlying database objects. We looked at the entity life cycle with regards to how it's managed by the Entity Manager within the persistence context, all these different states, new, managed, detached. How do we handle validations, key generation, what are the locking options, and how we can execute JPQL statements.

There is much more to this topic in the Appendix, where we talk about custom validations beyond the standard validation constraints, and other types of mappings. In the Appendix, we'll find information about entity relationship mappings, composite keys, mapping to multiple tables, so more sort of advanced mapping cases.

But regardless of the complexity of the mapping case, what the chapter did is that it showed all the important concepts of how this API functions. The extra mapping can be picked up from the Appendix later. You need to first conceptually understand what do you expect from the JPA API, what kind of functionality you expect it to cover.

Lastly, the practice for this particular chapter, you will be told to create a Java application running on Java SE client, no Java EE, which manages product entity. So map that to the underlying database table, generating keys from the sequence, applying data converters, applying validators, handling errors and transactions. In a later chapter, that very same JPA code is going to be moved into the Java EE environment, where it will be handled by some Enterprise Java Beans. But we need to cover Enterprise Java Beans first. OK.

## 3. Practice 3-1: Creating a JPA Entity - 31m

Now let's take a look at a practice for Lesson 3. During this exercise, we're going to create product JPA entity mapped to the PRODUCTS table. We're also going to create a product manager class that will utilize the entity manager to control persistence, to work with that entity manager, and we create a date converter, as well. To manage conversion, we'll associate product with some Bean Validations.

Now, we're going to create this application initially as a Java SE client project, and then in a later exercises, we're going to move it to the Java EE environment, where we'll continue to use that product and see these functionalities, but we first develop them in Java SE. Let's start with the part one of the exercise 3 that creates Java Persistence API entity. As I say, that will be done initially in a Java client project, so that's where we need to start.

We create a simple Java application project. Let's go to NetBeans, go to the Project stub, File, New Project, Select Java Application. Click Next. Now, my window uses slightly larger fonts, so you'll see what I'm showing better, so I have to scale it up a bit. So you see the full window now.

What should be the name of the project? Let's check it in the PDF file. This is activity guide, and it tells us that it should be product client. You should put it in a folder home/oracle/labs/project. And then you also need to create a main class in a package demos.client.

Well, let's just do that. So product client. Make sure you point to the correct package. Should be Labs, Projects. This is the project location folder, sorry.

And yes, and the package is where you create the main class. That's damsel's demos.client. There you go. So product client project in a right location with the class that represents the main method. Finish that.

Now, once we've created this project, because this is just a simple command line, main math Java application, it would not be able to benefit from your usual Java EE configuration resources. So that would be our next step of the exercise. We need to add libraries to the classpath to represent specifically Bean Validation library. If that would be the Java EE project, we wouldn't need to do it, because that would be available out of the box. But because we're configuring now a Java SE environment project, unfortunately, we'll have to create this additional library.

So in a project, click on the Libraries. Right mouse button, click there, Add Library node. And then create a library, and call this library Bean Validation. So we'll create an extra library on Libraries node.

Right mouse button, click here. Add Library. Create New Library, and call it Bean Validation. There you go. Click OK.

Now we need to add some JAR files to the classpath of that library. So adding various JARs and folders. Yes, quite a few different JARs we need to add, so let's take a look at what they are. They are listed right here. We're customizing the library, adding new JARs and folders.

Of course, the name of the JAR file and the folder name didn't fit into horizontal line in a PDF file. So I'm going to cheat a little bit. I'll just copy this from the PDF, put them into the-- oh, just any text editor will do. Obviously, you can just browse for each one of these files in the dialog, but I'm going to simply Copy, Paste each one of these paths, together with the relevant JAR file name, into the dialogue to save time, so I wouldn't have to browse to each one of them.

Let's start from the top. Cut that out. Go to NetBeans. Paste the path. Add JAR. Repeat the process.

So I'm cutting them, so I wouldn't forget which one I've already added. So keep adding these JAR files. This is basically an implementation library behind Bean Validation API. Without it, your Bean Validation won't work, so that's why you need to add it to the classpath.

And of course, in the Java EE environment, you wouldn't need to bother, because it will be already configured for you. It's just a workaround for the Java SE client that we need to do. Keep adding the JARs. We're almost there.

And that's it. Done. Add JAR folder. We've added all the JARs we wanted, so they're now properly forming the classpath to support Bean Validation reference implementation library. Click OK once you've sorted out these JARs. That's your Bean Validation library.

Once you added Bean Validation library, created the library, you need to add it to your project. But before you add that library to the project, check the PDF file that contains your lab transcript. Apparently, there are a couple more libraries you also need to add at this stage. So Java EE 7 API library and Java DB Driver, because we got to access the database. And remember, it's because we're not in Java EE environment, we have to configure these things.

So pick up these additional libraries. After that, you're ready to add them to your project. So there you go. That would be well, the library you've just created-- Bean Validation.

Control and click on Java DB Driver. Select that, as well. And also select Java EE 7 API library. So these are the three libraries you need to select and add them to your project.

That's it. Job's done. You've added the necessary libraries. Let's take a look at what we need to do next. So we finished creating the Java SE project, we've made sure it will be capable of supporting some degree of Java EE code, and now we're ready to create an entity. So we're going to create an entity to represent the PRODUCTS table-- a reverse engineering that from existing database.

So go back to NetBeans, File, New File. And this time we need to select from this list of options Assistance group, and then select Entity Classes from the database and Launch this wizard. You need to pick up the database connection that points to the PRODUCT database. So that will connect you to the database and read your PRODUCTS table, which you could obviously now add to the list of tables you're going to handle.

So that's done. Selected the PRODUCTS table. What we'll do next is to decide how we're going to represent the PRODUCTS table as an entity. Create a product entity class in a package called demos.db. OK, let's do that.

So Click Next. That is the class we'll create. Let's call it product. Why not? And the package will be demos.db. So that's our new entity. Once that's done, click Next.

There are some options you may wish to set at this stage. So one of the interesting options is this one called Use Defaults if Possible-- so not to put annotations into the class that we don't really need to put, because we just rely upon a JP API to do the job for us, basically. So that's on the next page. Use defaults if possible, just to slim down the amount of annotations and not to put the annotations that are anyway default values.

We ready to create this particular entity, so make sure you've checked all the options here. Association fetch-- default. Collection type-- Java.util.Collection. That's fine, so we're ready to proceed.

Let's finish this wizard. As a result, we'll now have a demos.db package, and this product entity created for us. There you go.

Now we're told to modify this product entity a little bit. Specifically, modify toString method to return information about products. I suppose it will be nice. So open the product. And this is the code that you need to put into the toString method.

So go to product entity. There it is. There's the toString method.

You could use the navigator to quickly select it, and then override the method. And what we want to do, I suppose, is just simply return the product ID, name, price, best before date, version. So nothing out of order-- just to make it convenient for us for a moment to test that product in our application.

Now, another change that we'll need to make is modify the best before date from being of a date type to be of a local date type. Let's try that out. So find here the declaration of the best before date in the product and modify its type. So we want to change it to a local date.

Of course, because we just changed the type, we may have to add the relevant import of Java time local date. That's that. And well, you see, because we've been modifying the type, we need to make sure that our getter and setter methods are appropriately changed. So we need to make sure that that type is changed, as well.

So let's do that. So methods to set and get best before date should use local date, as well. That's it. So we've modified the best before date time.

Now, the current version of the all around provider, which is EclipseLink, which we are using at the moment, does not support the mapping for the local date. So a little bit later we'll have to work around this problem by providing a converter. It will be good opportunity for us to study how to write converters.

One more thing that we'd would like to do with this entity is enable the generation of the primary key for the integer ID of the product [INAUDIBLE] sequence. So lets add that code just in front of the declaration of the integer ID. So there it is. Let's add here the abilities to generate the value from the sequence. So we need a sequence generator-- let's nicely format the code, I suppose-- and generated value annotation.

Now, we're missing a couple of import statements here, so you can just click on individual lines to add these imports, or there's another option you could use, which is fix imports. This is the option. So fix these imports all in one go. Just make sure you select appropriate types, and click OK.

Sometimes you see there might be a choice as to which type you select-- which specific, because there might be different packages having the same class, name but obviously it's a Java X persistence sequence we're talking about, so that's it. And click OK. That sorts out the import statements. So we're generating the value of ID from a sequence, which is called the-- well, it is database sequence, which is called PID.

So added these imports, as well. You could have done the keyboard shortcut Control-Shift-I to do these fixed imports. It's doing exactly the same job.

Now, we also want to add an annotation, which is a version annotation against the version field. Fair enough. Let's do that. So let's take a look at the version field and add version annotation to it. Again, something that you need to make sure you don't forget to import.

Next, some Bean Validations. Yeah, why not? So we need to add not now to the integer ID, if it's not there already. Let me see. Actually, it might be, so make sure it's in place, basically. So not noes are already in place, so we should be fine there.

But we also need to add some other annotations. How about this one, the name? So just NotNull. We also want it to be validated with a particular size.

Name should not be smaller than 3 symbols or bigger than 40 symbols, so put that in, as well. And that's for the name. Size annotation.

Now, there's something else that we've added here, which is a reference to the error message. So we'll need to code that into our bundle at some stage-- into resource bundle for validation messages. We haven't done it yet, but that will be a next step in this exercise.

Now, on the price, you need to add these min and max annotations. You probably would notice that they already exist there as comments, so you can just uncomment them and add relevant values. That's up to you, or type them from scratch-- doesn't matter. So min and max annotations constraining the value of the price. Fix imports. Make sure you've imported the relevant classes.

Now, that will conclude the part where we add the Bean Validation constraints. But remember, we still need to create a resource bundle that will contain the actual error messages. So File, New File, and we are about to create a new resource bundle here that will be our validation messages bundle. Let's try that.

Go to New File menu. It's from the Other group, Property File. Validation messages.

And a folder where you want to put it is just SRC-- Sources folder. So really, you could browse to it or just type. Make sure it's in that place. That's exactly what the PDF file says-- validation messages, and put it into the SRC folder.

Once we create this file, we'll add some messages to it. So let's go to the file. Finish it up, and then add these messages.

You probably notice that these names is exactly what we were using annotations in a product to reference these different error messages. That's where they are. So we now have actual, proper messages in the bundle to support these annotations. Validation messages properties bundle is created.

So now what is still left for us to do is to add a converter class to support the conversion of the local date to date type. So we need to create a new class, and we'll call this new class date converter. Put in it also in a demos.db package. New File, Java Class. Date converter, and package demos.db.

So that's our converter. Of course, we need to now add here some code to perform the actual conversion. Now, that code implies that we need to annotate date converter as a converter. We could use autoapply attribute there, so it will be automatically applied.

What else do we need to do? Oh, yeah, don't forget, the imports as usual-- javax.persistence converter import. What else do we need to do?

We need to make sure it implements an attribute converter interface converting local date to date. So add that-- implements attribute converter. Again, make sure you are fixing your imports. It will be Java time local date, it will be Java Persistence attribute converter, and it will be Java.util.Date.

Actually, could be Java.util or Java SQL. It will work either way. It doesn't matter. So we've added these imports.

Now we need to figure out how to actually do the conversion logic, and for that we need to override abstract methods that the attribute converter interface provides. Well, we implement in that interface, so we need to override relevant abstract methods. Let's do that. Implement all abstract methods.

So these are the methods that convert local date to date and vice versa. Oh, of course-- at the moment, they have dummy implementation, so we need to replace that with some real code. So this is the code that we could add to the convert to database column method.

We are converting local date to date. Convert to database column. Obviously, you add it instead of this throw exception statement. That's your conversion.

You probably notice that the code snippet here uses the value as the variable name, but-- well, actually, it's called here attribute. Well, just rename that parameter to value to match the code snippet, and you'll be fine.

So return either null if the value is not present, I suppose, or perform the actual conversion using the current time instant. Make sure you've added a relevant import. In this case, that's ZoneID.

And then the second method that is doing the opposite direction of conversion. So there, the code snippet converts to an entity attribute. In other words, from date to local date. So let's add that to this method instead of throwing of the exception.

Again, the [INAUDIBLE], he is called dbData. Let's rename it to value, just to match the way we call it in the code snippet. That's it.

And again, we need to add another import. This time, import of an instant class with the help of which we're performing the conversion of date to local date. There you go. The converter is now available.

Now, there is one more thing we need to do. We need to open persistence XML file and register this converter. In a Java EE world, we wouldn't really have to do it. It would be automatically registered. But remember, we are in not in Java EE at the moment. This is a Java SE project.

So go to the persistence XML file. That's under the META-INF folder. And basically, well, you could just do it visually through adding the class here, or just through the source code. You could just add another entry, which registers this date converter. Done. Save the file, just to make sure. So date converter is now registered.

Let's do some other alterations to our code. This time, let's create a named query. We'd like to select products by using their names. There is already a query like that in the product entity-- product find by name-- but we'd like to make a bit of a change there.

So go to the product entity. Find the named query-- find by name. And at the moment, the query is using an equal sign to find product-- by exact name.

How about we'll use a like operator instead. Well, searching with name patterns rather than exact names. Why not? So that's one change that we are asked to do-- change that operator.

And then the other one is that we are instructed here to create another query which will look for the product total. Now, it's a calculation which allows us to count products that we found and do the SUM of the prices. So if we're looking for several products in one go-- list of product IDs, more than one product ID-- we can just say, well, how much is that in total? And how many products, obviously, we've managed to select.

So that's another named query we need to supply to help us manipulate with product entity. Let's just add it to the list of our named queries. Well, anyway, really, could just add it here, for example. Oh, and make sure you've that comma separated. So make sure you put a comma to separate yourself from any other queries that you've got in these codes so far.

[INAUDIBLE] suppose that's nicely formatted. So you've got this additional query called product find total. Just align it the way you want. That's done.

Well, make sure the project compiles. Use the Clean and Build menu. You can use the keyboard shortcut, Shift-F11, or this Clean and Build button, just to create a fresh, clean build of the project. Oh, maybe you had some typos or had some issues-- just to make sure that we all resolved these problems before we proceed.

So so far, so good. Build was successful, and that means that if you obviously get compiler errors, you need to fix them. If you get any other miscellaneous warnings, that's fine. You may be getting some other warnings. That's OK.

Well, that concludes the practice 3, part 1. And well, in a moment, we'll proceed to practice 3, part 2.


## 4. Practice 3-2: Creating a JPA Controller - 7m

Let's take a look at practice 3, part 2. In this practice, we need to create a controlling class to handle the product entity and interactions with a database.

So you need to create a new class-- just a normal Java class --and we'll call it product manager, and we'll reside in demos.model package. So let's go ahead, create new file, just a regular Java class, call it product manager, make sure it's in demos.model package. There you go.

Once we've created this class, we need to add code to it to actually interact with the entity manager and with the product name query. So we would like to query our database as well. So declare entity manager, declare product name query, variables, and sort out-- make sure you've got correct imports. Yes. So, persistence entity manager and persistence query imports.

Now, we need to add some initialization code. Well, it's just a constructor, really, of the product manager class, which initializes the entity manager and the product name query.

So lets add a constructor here as well. There you go. You could, again, make sure you sort out all imports, right mouse button click, and sort out the imports. And if you want to nicely format the code, just align the code, so it will look nicer.

We're looking here for a query called Product.findByName. If you remember, it was one of the queries we defined in earlier practice. That's the one we were changing the operator equals to operator like. So we're looking for that particular query, now, in the product manager, now initializing this object.

Next, once we've established the initialization for the product manager, we also need to perform appropriate cleanup. Let's add an operation that can do the closure of the entity manager. There you go. Again, and format it nicely. So we make sure we close entity manager properly.

Next, modify the product manager class and add operations to actually perform, create, delete, update, and find actions. So in each one of these operations, we'll use entity manager to start the transaction, perform an action upon a product, and commit the transaction.

Again, make sure you've added appropriate imports, for example, import the valid annotation. And what about a product? Well, technically speaking, product class is in another package, isn't it, demos.db. So yes, you need to make sure you sort out the import of that class as well.

I'll continue to the rest of the methods. So that's a method update, and method delete. OK, so merge operation up entity manager is invoked here. Another delete. That's removing in the product. OK. And finally, an operation to execute the query, and find a product just by looking at a product primary key, a simple find operation, just locating product by using the primary key.

In addition to that find operation, we also need to add another find operation, which will actually use our query called findProductByName. So let's add that one as well. OK. There you go. Oh, and import Java util list. Make sure that's imported as well.

OK, so we're setting up the name parameter, because there was an argument to the query, and executing our product name query, which we have already initialized, remember, when we were creating a constructor for the product manager.

OK. Now we all running this code within the Java SE environment rather than Java EE environment, and you notice that some of the methods there, such as the method update and method create, use valid annotation to validate the product. Well, see, that's why we were adding this additional library to the product, to support the bean validation.

Of course, in Java EE environment, that would have been automated, and that library would be there for us already. But in Java SE, if you want to make sure that the valid annotations actually work, then you need to configure your classpath and make relevant amendments to that to include bean validation, reference implementation library, into the class path.

Well, I guess that's it. You can now compile the product client project. Let's do that. Just clean and build. Make sure whatever changes you've made are OK.

OK, so build successful. That's good. I suppose we're ready to proceed to our next part of the exercise.

## 5. Practice 3-3: Testing JPA Functionalities - 22m

Let's take a look at Practice 3, part 3. In this practice, we need to create code, add code to the product client class to actually test our interactions with a database using Java Persistence API.

First let's add a couple of initialization beats to the product line class to make sure we would be capable of writing logs. So this Logger initialization. Add that just to the product line class. There you go. So just anywhere really. Make sure you sort out your imports. So import JAVA to Logger. There you go. That's it. So you've got your Logger initialized for this product line.

Next we're going to take a look at the actual handling of the interactions with the database. We'll have to catch some exceptions. So we need try catch block. Let's add the try block. We'll add further logic to it in a moment. And then we'll need to add a catch block and sort out exactly what sort of exceptions we'll be getting. So try catch-- just in the main method-- here in the main method. Let's add try block and a catch. And obviously what we will try to do is handle here further exception handling logic. So we'll place it there later. And in a try block, the database interaction logic.

Now with that code, I suppose we best start with exception handling. We could get different types of exceptions from the try block, depending on what caused the problem. So this is the bit of code that looks for the exception, which is the constraint violation exception. So that is if we fail validation. So in that situation, you see we had this statement, which got the cause-- throwable cause-- from the exception object.

And now what we're doing is that we are analyzing that throwable cause construct and creating and if block, and saying, if that cause is a constraint violation exception, then this is what we want to do. I don't know-- write the log message about it. So make sure the imports are in place. Constraint violation and login level. Got it.

Well, that's not it. We contain it to the next possible cause. And the other exception cause could be this else if block, which is looking for the optimistic lock exception. So that's another thing that can potentially go wrong if we are blocking the update of one of the sessions. Because another session has already updated the record, and version number was actually incremented. So that's the other possibility. Again, make sure you've got all the imports in place. There you go. So that's checking for these two exception types for constraint violation being a cause of our problems or optimistic lock.

I suppose for now the Logger is sorted. Please note in a constraint violation situation, there is this for each iterator, which basically implies that you may violate it more than one validation constraint. There is more than one problem that you have several constraint violations. That's why you need to iterate, and you need to check what they are. It's not just one exception. It's kind of a collection of things that may have happened at that stage.

So we are handling our exceptions. One or else clause just to look for anything else that could have potentially went wrong-- miscellaneous problems. Well, I suppose, you know there might be other exceptions thrown in that try block that are not constraint violation or optimistic lock. So we'll just sort of produce a severe error.

Interestingly enough, we could treat constraint violation or an optimistic lock as just sort of an informational case. It's not an exception per se from the perspective of our code. Certainly we have a bug. It's just the user doing a wrong input or another session block in the rack, or it's just something that we could potentially work around.

Unless, of course, if we'll have any other issues, like we're unable to connect to the database at all or something like that. Then I suppose it's a more serious case of an error, and we log it with an error or severe sort of level to indicate that that's a more serious problem.

So that's precisely what that note is telling us-- that constraint violation and optimistic locks are kind of normal-ish behavior of the program. So that's why you probably treat them separately from any other exception types.

Now let's add the code to the actual try block that will create an instance of product manager and then eventually close it. Whatever other code we'll be adding to that algorithm, should go between the product manager initialization and product manager clean-up. So any other code will be inserted between these two lines. Because we need to make sure we open a connection, and we need to make sure we close it.

By the way, when we initialize a product manager or use that string, which is the name of the persistence unit configuration-- let's take a look-- that's where we described it. That's the name of persistence unit configuration. And just to remind us, we pass it as an argument to the product manager constructor. And product manager constructor was using that name of persistent unit to create an instance of an entity manager factory. There you go. So I hope it ties up nicely now.

So what do we do between that PM initialization and PM closure. Well, create, [INAUDIBLE], delete, find, query, whatever you need to do with these records in the database, I suppose. So let's find one. So let's find that product. If you haven't imported the product class yet to the product line, import it now. It's formatted nicely.

I suppose we're ready to run. We can just print out the product onto the console. So the next thing, just hit the run button. You could do clean and build first, but doesn't matter. When you run the project in NetBeans it's actually compiling that. So you can just hit run button, and that will do the trick. That's our product. A cookie, which we just queried from the database. So it's product with ID 1.

Now let's do something more sophisticated. How about-- well, just comment out that bit first, and then let's query several products and iterate through them. Products whose names are starting with co and percent sign. OK, let's try that. So you could comment out that block of code. Use control and slash symbol on a keyboard. And if you want to un-comment, by the way, it's just control and slash again. So it's comment, un-comment. Very straightforward.

And then import Java to list, of course, format the code nicely, and if you go around that query to see how we query multiple products. You can right-mouse button click on the source code. And run, you can hit the Run button on a toolbar. Whatever. It's up to you.

So we've now queried a product number one, cookie, and a product number four, coffee. And that's because we were looking for products which names are like c-o and then a wild card. Lovely. Iterating through that list. So we've seen the coffee and the cookie. Perfect.

Now open the SQL console to view the product data. So that's on services remember under our derby database connection. Just right-mouse button click and view data there. It's a preparatory step. Where preparing to test something interesting. So that's our product database connection. That's our schema there. That's the tables. Table products. View data. So that's obviously what we've been querying-- coffee and c-o, starting from c-o, and cookie starting from c-o. So these two records. Anyway, so we see that they are in a table.

Now what are we going to do, we're going to update one of these records. I want to change its price. And that's why we were looking at the actual values in the database. First, just to make sure we understand how the update will change them. So you can comment out the current query code and replace it with the code that updates product number one. Comment out. So comment current query code. You know, if you want to close some of these windows because it's too many of them open, just go ahead and close the ones that you are not using at the moment. That's perfectly fine.

So we need product line class. Comment out that query and place code that updates the product. And we're changing the product price to 2.5. And we're changing the best-before date to plus one day-- today plus one day. And we would then update the product, which remember, we'll call the method merge. Before we run this code, at the moment, the date and the price for the first product are like this. Obviously you'd have a different date. This is the date at which the course was recorded. So you would have a different date in your system.

Anyway, well, let's run it and see how it goes. So we're making some update. And then let's re-query that table. You can just run the query command again. Refresh it. So there you go. The date was changed. The price was changed. Nice. So we've observed how that code was changed in the database.

Now let's try something else. Let's try to break it. What we're going to do is try to update the price to 0.1 and name to x. And that's going to be a problem. So we'll just go back to the product line, change the price to be below one. That's the idea. If the price is smaller than one, then that's going to be a problem. And if the name is too short, it's going to be a problem as well, because we've got validation constraints that are checking that name and price are all particular sizes. So not smaller than certain size.

Anyway, well, let's just run this code again and observe that it will produce some errors. And indeed it does. Oh, there you go. These are your validation errors. Price must be greater than one. Name cannot be shorter than three or longer than 40. Just to remind us how that functions. So the product entity contained annotations that describe what should be the size of the name or what's a constraint on the price. What's the constraint on the price? There's a constraint on the price-- min and max-- attached to the price.

And, of course, we had the validation properties file that describe what the constraints look like. So that's the actual error messages that you'll receive if you are running the errors code. And that's precisely what we're receiving. Of course, if you check the database, well, that wasn't updated. So these values haven't been changed because their data has been prevented. The validation occurred at a point in time where we were actually calling the update operation because that's where the valid annotation on a product exists. So that prevents the incorrect update from actually happening in the first place.

Now let's try and simulate the optimistic lock problem. So we now are going to update the price to valid value. Don't worry about that. There will be no constraint violation for the validation constraints. But there will be an optimistic clock violation, which will now sort of construct-- will make sure it will happen. So what we need to do is first fix the product line a bit. So put the realistic value for the price here. We don't need to set the name and the best-before, so you could remove that or comment it out. Whatever. It doesn't matter.

But before we update that record, what we would like to do is give ourselves a chance to update it in another session. Between the point in time when you set the price and when you try to update, we need a pause in a program so we can go and change it in another session at the same time. So what we're going to do is simulate that pause by basically asking the user to perform an input through the console.

We can do that with the scanner that will look for just really enter key to be pressed on a console. So click onto the console and press Enter there. That pauses the program until the user does that input. And that will give us a chance to simulate an optimistic lock-- so basically create that problem.

OK. Running the code. And at the moment, the code pauses until you click and press Enter in this window. But I'm not going to do it just yet. No, no, no. Because what I want to do, once the console has paused, I want to go and update that record from another session. I could do just from SQL console, I suppose. So we're going to go to SQL console. We're going to change the records price here. It's just another value. And absolutely make sure you change the version number as well. So these are the two things you need to change-- version number, say price here-- and that's it. Can make that change.

Now we can make the product client attempt to proceed with that update. So we'll click onto this console window, press Enter, and observe the optimistic lock exception produced for us. And it says that this product can not be updated because it has been changed or deleted or whatever. Its version number is not the same anymore. It has been modified by another session. There you go. So that's precisely what we wanted to achieve-- to make sure we don't accidentally override some other session's actions.

Well, that concludes this particular exercise. Optionally, if you have time, you may also write code to test, create, and delete methods of the product manager. So far, we've tested the update and query functionalities. Just in case, if you're having a problem with this exercise, you're having particular issues, you can always use a solution exercise. So let me close that one for a moment. Open labs solution. And that's practice three. That's your solution.

And I just very quickly want to show you the product line class in this solution because it does indeed contain all of the snippets of code, including how you could trigger it to error and including, if you don't want to look and do it yourself, and don't look now, including create and delete as well. So that's these other snippets of code, how to create and delete the product. So just in case, it's for self-check should you wish to do that self-check. So that is it for the practice for lesson three.

## 6. Skill Check: Managing Persistence by using JPA - Score 80% or higher to pass

Skill Check: Managing Persistence by using JPA

View Skill Check
