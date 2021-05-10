# 8: Converting and Validating Data

   * Converting and Validating Data - 1h 15m
   * Activity 20,21,22,23,24,25,26,27,28 - 37m

## Converting and Validating Data - 1h 15m

Hi, let's continue with the chapter Converting and Validating Data. In this chapter, we are going to see how the data conversion and validation logic are processed. We'll talk about standard data converters and validators, configure default validators, and developing custom convertors and validators. And later we will discuss a little bit on the bean validations, which was included in Java EE with the JSR-303.

Topics-- it is a conversion model that we're going to see and standard converter-- custom converter-- same thing with the validation model we will understand first. We will see some standard validators available. And then we can create our custom validators. And, finally, we'll talk about bean validation API.

Conversion model-- remember the phase when you insert your information and submit of the data. If you remember of my lecture, what I said to you that all that information will be submitted in a string, which will be converted to an appropriate type. They type they will decide using the value binding.

So these data are going to be changed to appropriate type like this is string number long, which were value binding type you specified there. And this all happens at the time of Apply Value phase. After that, it will go for the validation process, and then it will continue with Update Model and Invoke Application and then Render Response.

So the data conversion the model, it is actually the two-way communications-- the one when you submit the data and the one when you render the information back to the browser. From the browser, you may have a text box. Whatever you type it is going to be a string, which will be changed to the appropriate type by the Apply Value phase.

And then it will process Update Model, validation Update Model, Invoke Application, and, finally, it is going to Render Response. So I can say Apply Value, Validation, Update Model, Invoke Application, and then Render Response. Remember, here you type something. Let's say I'm typing 100.

It is a string. It is a string in the component state which will be changes to the appropriate type and thus will be validated where the number is between 1 to 100 or 50 to 100, or not, and will be updated into the model properties. Model properties value are holding those values. They are indeed the type-- long type.

So that will be updated data there. But the time of Render Response, when displaying this information, the page that is displaying this information they have to convert those Java type, Java primitive type or class type values, back to the string so that it can be merged into HTML response.

So that's why I say it is the two-way operations. The model view-- the data is represented in data types, which are specific to applications-- Java primitive types or Java class type. In the presentation view, which aer rendered on the browser, they are the text type as string type. So conversion is necessary between these two views.

Conversion is done automatically if you have the value binding up the component is done with Java primitive types or with string types. But if it is not, then you have to take the help of conversion logic. And for that, you can create a custom converter. We will see that.

But first we see the standard converter which are available to you, and for them, you do not have to do anything. The common data types like BigDecimal, BigInteger, Boolean, Byte, Character, DateTime, Double, Float, Long, Number, and Short. And for all types, the converters are available to you.

At the time when it is converting the data, if something goes wrong, it is going to display the same phase. It will not continue with the next phase of life cycle processing. It will jump to the Render Response, and the same page will be rendered along with the error messages. That, you can also customize.

See that here? They have implicit conversion based on the bean property type-- value="#u(user.age). This assumes the age is integer type. The text box you type something, 10, will be default as tring type in your HTTP request object, which will be read by Faces servlet. And that's going to be applied within your component state properties, which will later be converted to bean property type-- value binding property type-- that is integer type.

At some time you need to specify some converter, you can also specify a converter like the converter equal javx.faces.DateTime. So if you're planning to enter date and time-- so you need to specify converter attribute, and you can here the standard class type, which is available from the JSF so that your entered information, which is not primitive type, it is date and times type can be changed to that particular object.

This information you can do at the time and appending the value. You may have some values of let's say here "Blah," but it can be any values which you'd like to represent at the date and time. It's going to be date and time value. Here say f:converter and specify the converterID. F:converter is a separate tag available in your JSF core library.

So if a component does not have an attribute converter, you can take the help of f:converter, and you specify the converter that can be used to convert Date and Time so that it can be displayed in a string format back to the browser. You can also use Binding Attribute to specify converter object-- Binding Attribute, which is associated with the component references. had

And there you can also write the code to specify the converter object to be used at the time of Apply Value phase. See that? We have some of the converters available to you in the form of a tag like f:converter Date and Time-- rather then using it this way, you can say, f:convertDateTime so that the value that you're planning to show it, display it on the browser is output text.

That value will be changed to date and time type. With this you get the opportunity to specify the pattern how you want the date formatting. You can specify here the date patterns [INAUDIBLE] Monday, Tuesday, Thursday, month, Jan, Feb, date and the yyyy-- four times.

Number Converter-- we just have here to convert number type Currency so that the appropriate currency symbol can be added with the number . The time is showing a particular number that represents some prize , some money. You can see it is going to show dollar symbol or pound symbol depending on your original settings. If it uses the pattern, then you can select what symbol that you'd like to use it with this particular value that you plan to display on the browser with the page content.

Custom Converter-- sometimes you may need to use a custom converter because we do not have any default or standard converters available. Let's say here they say Type of Card, payment.card Type, that's OK. Credit Card Number-- they say payment.cardNumber.

You know why we need here customer converter? Because the bean that they use here for the class Payment is a bean. And this bean has an attribute which is not a printed type, not a standard type that can automatically be converted. There is no standard converter available for this like date and time. It is user-defined Java class type.

Now, what they did-- they [INAUDIBLE] the payment.cardNumber. This is card number. Payment.cardNumber. Now, the card number is not text-- is not integer -- it is user-defined data type, Java class type.

In this case, you need to type a Java class and write the logic to tell how. And a string that is being supplied from the browser, submitted by the browser, the form that you have, HTML form, how that value will be changed to Credit Card Type so that it can be assigned with the payment bean object. Remember, here you have setter and getter that accepts Credit Card Type.

What we can do-- we can create a custom converter in this case. It is two way-- for the presentation view to model and the model view to presentations both where you have to take care of this. In the case of presentation view to model, you have to convert a string to appropriate Java class object type. That's why they say getAsObject. And see here, they have a string that will have the value that you have submitted.

Model view to Presentation view-- when you are displaying the contennt-- credit card number you want to display-- at that time, it will call this method, which will help you to convert this object, write the logic to object to return in a string. So return type here is going to be a string. For this, what you have to do-- you have to create a Java class and implement this interface converter.

When you implement interface converter, you have to overwrite these two methods. And that's what they did here. See now? They're going to write the code to say here getAsObject. The same signature you have to use there. This third parameter will help you to read the value which was submitted by the browser form.

And that value, you can hear write the logic to change it to the credit card object type, which will be used in update model to supply that particular object to credit card object. If you wish to type any of the logic to validate the data, it's your code. You're free to type whatever you want. You can write here the logic, even to check that the data is valid or not valid. And then you can go for conversion.

In case if you find any error-- the data is not validate data-- cannot be converted-- you can create a FacesMessage object, which can be useful to specify some messages. And this message you can use to throw ConverterExceptions, which will be displayed on the page at the bottom. GetAsString is the next method that can be used to convert objects back in the screen when you're moving from model view to presentation view.

So this is the method which will be invoked at the time of Render Response-- during the Render Response. And that is the method, getAsObject, it is invoked at the time of Apply Request Value phase because this is the time it is going to convert a submitted value to the appropriate time. Here you can have this object value. Object is the object, which in fact is going to be class type, Credit Card Type-- that you can read it, and then you finally return a response from here in the string, which will be used at the time of Render Response.

You create a converter class. And the converter class needs to be registered in faces-config.xml. You can specify the name of the converter class that implements converter interface where you have written this logic and give some unique ID to this. The unique ID can be my name, can be your name, can be any name, but type something which is meaningful and looks like that you're referring a Java class.

That's why here they say com.Java.Example.card. It's just an ID. But they have typed in such a way so that it looks like you are referring to some Java class when in fact, it is the ID which is mapped to com.Java.Example.CreditCardConverter. This is the ID that you will use to specify here in the text components where you have the value binding and say converter equal com.Java.Example.card. It's just an ID.

You type your name, my name, just type your name in. That's OK. But it looks like there is a class that you're referring to, which in fact, you're referring to indirectly. But here you have to specify the ID name this and faces-config.xml. We have another option. You can use annotations. It is optional to specify everything in faces-config.xml using XML elements.

You can use annotations on the class where you are implementing converter interface. Say @FacesConverter and specify the ID. Then you do not have to do the configuration in faces-config.xml. Either way it is going to be fine. So go to your net bean practice environment. You can find this example available in the example folder of that particular chapter.

I can here open the next chapter that this eight validation example converter validated example. It's the validated example-- there's so many pages that they have it. They are multiple Java classes. This contains all those examples for this chapter. So you can run it.

And see, the first page will specify the documentations. And here they say custom converter example-- custom validator example. And here they will tell you that this validator is for what purpose.

Converter, when referring to custom converter, we can here open index2.html. You can also see the source code being at the browser. Index2.html which they have created giving the drop down list box letting you select here some type of card. And you type here the credit card.

I'm typing a credit card number here in this one, typing here the name of a credit card and submitting and see page, the next page, that is displaying the content and displaying the credit card number. But this time we do not have a hyphen here.

How did this all happen? If I go back to your net bean and say index2.html, this is using Value Type from the payment card number. If you go to the payment Java class type, which is Managed Bean for this, payment-- is a Managed Bean, see that card number is Java class type with the initializing with some default object. That's OK. Otherwise, it's going to be null.

Now, at the time of Update Model, the card number value will be updated with a new Java object type. And for that purpose, they have created a converter. This is a method that will be invoked. The value that you type it here-- 12345-- that's a value that you type here that was first intercepted by this converter class because you have specified here converter type.

All right, so it does what? It supplied this value to this new value. It can be any name-- a string type. And then the current faces context under which your pages is being processed, that memory reference you have it, the component on which this is going to be applied-- that component reference, you also have it here.

What they do, here they write the logic. They here said new value of if it is equal to null, return new value-- return the null. If it is not null, trimming it, removing all those spaces from left and right and storing it to converted value and the string that they have it. From there, they separate it to the character array.

The string is going to be changed to character array so that you can read each and every character one by one. That's what they're reading it with the help of the FOR loop and the check if there's a hyphen or a space in between characters, they are just going to continue with the next iterations. If there's not hyphen space, they check if it is number-- is it? Yes, if it does, they are just going to append it into the buffer.

So this 1234, it's going to append in the buffer. If you type 1234-ABCD-- something like this-- that time it will come to ELSE and say please enter only digits and throw the exception-- exception will generate the error. And from Apply Value phase, you will go to Render Reponse-- the same page will be rendered back to you along with this error message.

So here for type some alphabets-- A Submit. Please enter only digits. The same page is rendered back to you. And this information that you have it here in facesMessage throw it using exception is going to be displayed there. If everything's OK, then all those numbers, digits will be here in the converted value. And what this will do, they will create a new instance of the Credit Card object.

Credit Card object is a credit card Java class type which holds, in fact, the string value. It is a string value. But in the payment, it is Credit Card Type. So they just create the Credit Card Java class object. That object if they return it here, the reference of this will be available to this card number using setCardNumber-- that will be replaced. So your payment being hold the credit card object reference for that credit card number.

The time when you Render Response if you have any pages. Submit here with everything OK. And it says, Submit. You displaying the information-- which page you're going to. We can check it here. We're going to Response2.html. Response2.html-- it is now rendered on the browser. And the time of rendering the information, which is actually Java object type. You also specify converter. This time it is going to call getAsString. And the getAsString does what?

We supply the object and that object you can plant here to convert it back to the string. You can read each and every digit. Here they are just appending a space if there's any space or hyphen. I can say here hyphen. So if I say hyphen here, we will not see here a space. We will see the hyphen.

Just check-- it is not redeployed or what. All right, now I can try this index2-- say here Name-- 1234. I'm typing hyphen1 to Submit a display here with the hyphen because I added this. So you can decide how you want to display the string. It's your choice in this particular logic-- getAsString.

Let's continue with the next up topic. So to implement a custom converter, you must implement javax.faces.convert.Converter interface and implement two methods. Yes, we just have to implement two methods. One of them is going be getAsObject. The second again is going to be getAsString. Let's see the validation model.

The validation model-- it is just the one big communication because you have to validate the data-- the time when you're submitting information. When displaying it, there's no need to validate. We're taking the user input and submitting the data. You go for validations. So from presentation to the model, you have to validate it.

We have several validators available that you can use. These are the validator classes. And for them, you have appropriate properties and tags available that you can use on your JSF components. See that? Required validators-- we have required attributes. We have here validateDouble Range, validateLength, validateLongRange-- multiple tag libraries available that you can use.

It's very simple. Using standard validators, just say here that the component that is accepting the used value-- like here the guessbean.guess is going to accept the user value from 1 to 100. And you want to make sure the number entered by the user must be between 1 to 100. I can use f:validateLongRange, which is from the JSF core library to specify the minimum and maximum value. You can type here as a little-- or you can get it to the bean properties. It will make sure it is going to be between 1, 2, or the max value. That is going to be handled.

We have validate regular expressions that you can use for the character type of data-- the string type of data to just to check that it is following a particular pattern. So address.zip-- it's just going to use five digits, hyphen, and then four digits. You specify the below expressions.

Required attribute is a required validator that can be used on the component-- Input Text component have required attributes. If you do not have required attributes, you can use to tag-- validate tag available. Just say here required="true". It will make sure that you cannot submit this component with empty data. Use the long range validtor if you have to compare the value LongRange minimum="1". Maximum equal to something you can specify there.

If you do not want to specify maximum value, don't say anything. Minimum is 1. Maximum can be anything. But we have the option for the maximum as well.

So there is three ways to associate validators for the UI components. The first way that you can use to validate tasks that are available to you. And the second way that you can let your validator class ID be associated with the binding attributes. Or you can write the validations up there in Managed Bean methods.

Let's see validation methods. If you are planning to use a method to validate the data, you can use your validators equal to and call the Bean method. The condition for this is you have to use the same syntax. Whatever name that you want, you can decide but the syntax with the three parameters must be FacesContext context, UIComponents component, and Object valuem-- public void-- any name with these three parameter types. And then you can write the logic in your Managed Bean method that you can invoke by specifying validator ID.

Default validators-- if you would like to register the default validators that can be applied in your JSF runtime, you can go to faces-config.xml. And there you can specify default validators is going to be the Bean-- javax.faces.Bean, something like that you can specify over there. Now let's see how to create custom validators. Custom validators-- again, you have to create a class-- class any name implements Validator interface.

Once you implement the interface, you must override this method. See this method has the same signature for the parameters? But the name must be Validate. Here you do not have the choice to type any name. It must be validated with these three arguments of parameter of FacesContext, UIComponent, and Object type. And then you can start implementations and write the logic.

For the error messaging, if you want to read the error message for bundle, you can. Or you can type FacesMessage. And you can throw some exceptions just like you did with the custom converter.

If you're using custom validators, and you'd like to apply it on a particular component, open the components and do not close. Within that component, use f:validator, which you can find from JSF core library and specify the Validator ID where it is same ID just like you did with the custom converter. And you have a listed custom converter class into the faces-config.xml file or with annotations. The same thing you have to do it here.

This is what the code snippet from the validator implementation class where they are validating a value and checking it as containing appropriate email value or not . They just check here if this email which you obtain it from here value, if this contains the right symbol. If, yes, it's OK. If not, then UIComponent provides a component.

Then use this component ID, type cast it to UIInput type because this is applied to the JSF input components. And this is setValidFalse to cause an error with a message, any message that you want that you can get associated with the FacesContext a context of addMessage and to specify that error message with the FacesMessage here. And here you have to use the client ID so that messages can be associated with the component for which you'd like to generate the error message.

Custom validators-- you need to store it in the faces-config.xml. You can go for Validators. And here you can specify the Validator ID. It's just a name, an ID, and Validator class for which you would like to have the ID. Or you can use @FacesValidator annotation and specify the ID there. It's the same ID that you're going to use here in f:validator.

Now, let's talk about the messages. To let you understand about the message tag, I'm going to take you back to the practice environment and demonstrate something so that you can understand what is the purpose of this h:message or messages. There is h:message and there one more-- messages.

So let's take the help of our guessing game. This guessing game says that you enter a number to guess. Remember in the logic in the Manage Bean that generates a random number, it generates a random number to be guessed by you between 1 to 100-- 1 to 100, using this [INAUDIBLE] means 1 to 100. We would like to make sure that users can enter any number between 1 to 100. There is need to enter the number greater than 100 or less than 1.

We can use here validators. I can apply a required validators as well-- required validator. I have acquired attribute. So I said acquired validator is going to be true. What else? Just open it . And under that, we need to type validators which are available to check whether it is between 1 to 100 or not. For that purpose, I have to include here the tag library for JSF core. As well, I just copy, paste, and then later, I'm going to change it-- just copy and paste it here. It's not pasting.

And change it to JSF core, prefix, you cannot have the same prefix F-- JSF core library. Now I can here type disclose Input.txt. And within this, I'm going to have one more validators saying F, validate, length, no, not length. It's a number. We'll say long range-- long range for numbers-- integer-- numeric value. If you have DoubleRange in floating, you can say 1.1, something like this.

Now, we can type here DoubleRange and say, minimum="1" and maximum is going to be equal to 100. Let's see this, run this, and check the error messages. Run it. I'm going to say, any number that is less than 1 see-- I'm getting the error message.

This error message is generated automatically by the validators. This says specified attribute is now between an expected value of 1 and 100. And it is showing you the label, which is the Component ID generated automatically for the components. We have not assigned any ID. And now if I type here anything more than 100, we have the same thing-- same result.

If you don't type anything, the required validator and see the error message saying, values required. All the error messages for the entire components-- you may have multiple components. When you finally submit, the entire error messages will be the part UIMessages. It's a Java class object, UIMessages, which is represented using the tag edge h:messages.

This gets attached just below the form showing you the error messages. By default, it's going to be a task. So all the phases messages, error messages, is going to be part of these UIMessages that represents collections. And all the error, you get it together at the bottom of the form. See that? You see the page so it is attached-- this messaged is attached in UL-- Title-- some messages up there in red color what is required.

If you want to specify your own messages or you just want to have the same message but you want to decide the label, for this purpose you can use Label in your components. I can say Label and give some name here saying number. If I now try the component ID, which was not very friendly, that will be replaced by this label.

Let's say, required validator number. But you're getting the message-- system generated message. What I can do now-- I can hear specify our own messages. When we are using standard validations, we can specify on messages-- required message. Required messages-- I can say, please enter a number. Or you can say, you cannot empty value-- something like this I can type it.

You see the one more is validate the message. For validation error, I can here type, "Please Enter a Number between 1 and 100." Similarly, you have the option to specify custom convert a message, so in case if conversion goes wrong, you have the message. "Please Enter a Number," something like that I'd type in.

I can give this a try. Refresh. See, now the label is not going to play anything because you specified your own messages. You cannot have an empty value something for validations-- please enter a number between 1 to 100. And something wrong that can make conversion failure-- right, we can say here, please enter number. Conversion is now going to be unsuccessful because this is a string that cannot be changed to a number.

All the messages get attached at the bottom using UIMessages represented by @Messages if you want that messages to be printed somewhere else, you can type here h:messages. Type somewhere else [INAUDIBLE] is going to be just below the form. Or I type it on the top and see it now. If I say some error, Submit, it is displaying the messages on the top of the form.

Giving me this bullet, symbol, but there's no color because you have type as Message right now. So if you are typing, it is your duty to decide this type. If you have a CSS file attached, you can use type class. Or you can directly type here the color that's going to be equal to blue or red. And try this, any error you try and see now you are getting in red color. So that is h:messages.

It is not for one specific component. It is for the entire component that you may have in the form and once you submit the form, you have multiple error messages for the component1 , component2, component3. They are all going to be printed together with the h:messages. We have one more thing that this is specific to the component. And for that, we can use h:message. H:message is specific to the component. And you need to use FOR to specify which component.

And here you have to specify Component ID. And this time, you must have ID specified here so that you can type it. I'm just going to give an ID to this component so that it should not have randomly generated Component ID. I'm typing here. Let's say, Num.

What I'll do now I will here type Num so that this h:message, which is specific to the component can be mapped with the text. And you can specify where you want this message to printed just beside to component, I type it here or anywhere else. You just have to say FOR.

So if you have multiple components, you can specify the error message just beside them using h:message FOR and component ID. And now if I do some error, the error message will be printed for that particular component just beside that. It is specific to the component and h:message is actually representing a Java class object UIMessage-- UIMessage.

So that's what here they explain UIMessages component. And see they say h:messages for here. That means they are mapping just the component ID here. ShowSummary="true" showDetails="false"-- within messages they don't want. They just want a summary of the messages. And styleClass. If you have a CSS file, and you have defined this styleClass error as a means what-- that you can specify. Or you can say style equals to your own CSS style you can specify.

H:message for salary. By default, it is going to be rendered into plain text. And you will not see the bullet-- the list item-- you can get this style using styleClass styleAttribute. What I explained to you required messages for required attributes-- convertedMessages for conversion errors and validateMessages for validation errors. You can give your own messages that will be used to render error messages.

Apart from this, you can you can also read the error messages from the resource bundle. You may have a resource bundle containing error messages as well, resource bundle must be registered with the faces-configure.xml so that you can load the resource bundle at the time the application has started.

You can specify variables. And that variable you can use to display the error messages here when you specify requiredMessage. You do not need to type. Rather you can say EL-- EL symbol-- basis msg dot some key name that you can use to read the error message from the resource bundle.

They can also be localized. This is what is going to be included at the bottom. And by default, it's showing you the component ID. If you have not defined component ID, it is going to be unfriendly like this that you can replace using label-- label equal to something. Or if you have some component ID specified, that name will be displayed here.

See that the code gets number example required True, required message, convert a message, validate a message, and here they have validate long range. There's a minimum 1 and maximum they are reading it from the bean properties.

When I enter here something that cannot be changed to number, you see the converter error message. And for this, you're going to see error message from the validations. And, similarly, you can the error messages from required validators. The next validation, which is the part of the Java EE6. It is not the JSF validations.

Before that, what you have seen to validate with standard validators, custom validators, they are the part of the JSF. But this is Java EE6. It's a part of the Java EE6. Bean validation can be used in JSF Managed Bean and JP entity classes. You can use these bean validations.

Bean validation does what? It provides a set up annotation that can be used on the top of the properties like they say, not empty. Not empty, that means it's going to check if the first name is empty.

Remember the bean validation will be applicable at the time of Update Model. You're going to type this in Managed Bean. The Managed Bean attributes are being updated at the time of Update Model. If you have not supplied any value and it is updating first name with null, you're going to see not empty. And this is the constraint from the bean validation, which will throw exceptions and display the messages.

If you want to specify your own message, you can use message attribute or annotation to give your own messages. Similarly, they have email annotation available that you can apply on any of the attributes that should be email type. There is several annotations available like not null, minimum, maximum-- there's all you can apply on one particular attribute.

So this is on the top of the guess, that means not null-- minimum value is 1 and maximum value-- max annotation-- max means this 100 is going to be applicable on the guess-- bean validation example. The several constraints available from this API with the part of Java EE6.

You can use @AssertFalse to check if the Boolean value is going to be false. @AssertTrue to check the Boolean value is going to be always true. @DecimalMax if you're using floating values and check the maximum value which is possible for the discount is 30, minimum 5 and multiple constraints you can apply on a single attribute.

@Digits-- just to check the fractions for the big decimal or float a double value should contain six integers and two fractions. @Future will be applicable on the date type where the date must be the future date. Max, min to specify minimum and maximum value for a number. @NotNull-- to check if an object is not going to be null. Make sure that it's not going to be null. @Null-- that insures it's always going to be null.

@Past will be applicable on the date. We'll make sure that EnterDate must be the past date. @Pattern is always there where you can specify the available expressions to see the pattern of the full number. @Size on the string that can specify the minimum and maximum size for a given string. Remember, you can specify messages with each constraint that you have here-- messages for your own error messages.

These messages can also be read from the resource bundle, but in the case of bean validation API, you have to use this name. You cannot use any name. You must have validation message.properties, which the bean validation API will read automatically to give error messages. The key name is also fixed. It must be like javax.validation.constrainst.Max.message.

This is the package where you have bean validation constraints available. So just give the package name constraint name dot message-- packet name, constraint name dot message. Write your messages. And if you want to display the value which goes wrong, say Value, which will be filled by the validation API automatically and display here the value that actually went wrong.

If you are planning to create a custom bean validation, it is also possible, . Before this purpose, you need to create first annotations. You should have your own custom annotations that can be mapped with the bean validations classes. Just like you create custom validators, you have to implement Validator Interface, Converter you have to implement Converter Interface. Similarly, for this validations, you have to create a class Class and implement constraint validator interface from the bean validation API, which is found javax.validations packets. It's a part of Java EE6.

I will show you this code, this example, and explain everything from there. And then we are done with this chapter. So go to this and see now here Convert a Validated Example. Let's close out the thing. And if you go back, see custom bean-- a bean validation example, they have here custom bean validation example.

Index.file.html-- licenseBean.Java, ValidLicenseKey.Java-- these are the Java classes that we are using here. I can take you to index.file.xtml. Index.file.html-- see it here. It is containing one text box. And the text box, you are going to enter a license key number for the product. This assumes that the company-- there's a company that has two products. And they say that they have a unique style of the licensing key. They start with the license key for the product1 is going to be XRP dot some number.

Let's check it what they say. I'll check it here. Constraint-- they have the two products, and they have a unique style-- a unique pattern for the license key, which is valid. And the user is allowed to put the license key as for these two different patterns. It says, either your start with XRP, or it's going to start with RWS. If it starts with XRP, the license key, it will have six alphabets-- six alphabets-- any alphabets.

It starts with RWS. It is going to have six numbers can be any number. That is going to be validations. For that, we are applying to use bean validations API. Right, see how they are going to create bean validations-- custom bean validation API. Remember, bean validations are actually implemented on the bean properties using annotations. So we'll do what? We're first create annotations.

This is going to be a little new for you. To create annotations, we use @interface keyword and define the name of the annotations. It can be any name. See, the bean validations, all those available constrained, they have the message. So we're just going to say here, messages.

The default value I say here com.example.custom. That is a package name . Bean validation constraints-- validation Key.message. Here you can type your own messages. But if you are planning that messages can be a part of the resource bundle, remember the resource bundle for bean validation must be validation.message.properties.

All right, if there you want to type the key name, then we can use the same style, the style that is used for default constraint or for standard constraint. They are using the package name constraint name dot message. So just to have this, can have here [INAUDIBLE] example custom package name, annotation name, constraint name, and the message attribute. If you want, you can type something else. That's OK.

Now, have this annotation created. And this annotation needs to be marked or annotated as @Constraint so that it can be useful by the bean validation API for the constraint purpose. This @Constraint you get the chance to specify the mapping for these annotations for a class where you're going to type the logic. We have here specified valid license key, validator.class.

This annotation is applicable only on the field member. You cannot type at the class level. You cannot type with a [INAUDIBLE] label. You can only type on the field member. And this is going to be available at the runtime for the runtime processing.

Now, this class contains the logic. Actual implementation is here where you are implementing constraint validator is specifying the annotation name and the value that you're going to validate. This is the constraint which is going to be applicable on the bean properties. Let's see where the bean properties-- it is going to be licensing.

It's a bean that is used in your index 5. It's referrring to licensebean.licensekey. The license key, what it did, they just simply type annotations @ValidLicenseKey. The rest of the job is done by the validations API. Remember, this annotation , which is now a constraint type, is mapped to this Java class.

At the time of updating the value in the license key, it will call a method from here that is valid. And the value that you are planning to supply to the license key field member will be available to you with the a valid license key validator. It is available to you here in this method. That's why we say string type.

Now, in the initialize, since they have to check if it is XRP or RWS. In initialize they did what they have instantiated this hashmap object. And they say XRP is the key and the value is going to be some character from A to Z. RWS-- some numbers from 1 to 9 that can appear any number of times-- pattern, let's say. They are two different patterns.

Now, [INAUDIBLE] what they're doing is they obtain here the value that you'd like to validate. They are just going to split the value into two parts. So whenever you type some value here in index_5.xtml-- you are going to type either XRP hyphen something like this or RWS hyphen something.

You have the hyphen. If there's multiple hyphens, can be, you can type by mistake multiple hyphens. This is using this hyphen as a separator here, delimiters here that will have the strings to be broken into pieces, which will be available in the array. If you use this two times, three times, then the array size is going to be with the three elements, four elements, two elements, right?

So making sure the here after this is split, we are just going to check if the length is not equal to 2. That means the user has here specified hyphen multiple times or may not have specified. That's why the length is not equal to two. The length will always be equal to 2. You could just have one single hyphen, two parts-- element 1, element 2.

If this is True, you will continue. If this is False, you generate the error message, and your validation will be failure. If this is True, the check index number 0, the first element in the array, does this contain the correct value? And the second element is six characters long. If not, False, error. If yes, you continue and check the license key.

The first part that is in the keyComponent0, it is either XRP or RWS. So just check it if it is a part of the [INAUDIBLE] license key-- XRP or RWS? If yes, you continue. If you type something else, here it is going to return False. And finally, if everything's OK, then they're going to check the second part, keyComponents1.

If this keyComponents1 is matching with the pattern specified in this hashmap object, the support license key getComponent, keyComponent0. KeyComponent0 XRP then this pattern will be used RWS, then this is going to be used if it is the pattern for the keyComponent1. If yes, that means it is OK. No? Written False.

Finally, once you've verified each and every thing, you find no problem. You return here True. Everything is past, and you'll see that it is not going to show you any error. Right now is error 12345. It just has 5, 6, error because the pattern must match. XRP say, should be character ABCDEF. Submitted, no error. Error message, this is what is this printing here at the error message.

Remember, this is printing here error message. You want to type the messages on your own you can here us message is equal to something you can type it, some error message. Or you can have the validation message of properties filed available in your project in your applications. And there you can type this key name-- this long key name. And it can specify message equal to whatever you want. That will be used.

So since here we do not have valid message key for this or even I have it, but this is not available and this. This entry is not there. That's why it is painting the same thing on the screen. So that is the bean validations. Now, that's what I explained to you how it works. And you just have to specify the value. We're not using any JSF validations. We are using bean validations. Bean, we just specified annotations. This is custom annotations, which is mapped to the constraint of your class time.

We have the quiz here. The quiz says , given you some code, and they ask you "Assuming there is a valid message component on the page and that bonus is an integer field, what message will appear on the page if the user types 1,000?" Remember, if you type 1,000, it will be considered a string, and here, this is integer type. So conversions should be an integer. But this string cannot be changed to the integer. That's why you get bad conversion-- a conversion error.

This says, "Which is the statement that is right for checking a number is between 10 to 25. You can use validateLongRange to check a number entered by the user is between 10 or 25?" This says, these two input fields-- here they have required properties, the second one. "Which message tag will properly display conversion error messages?" Any other messages can be displayed by either h:messages? F:messages? Or here, D, not F-- not h:message. This is h:message specific to the component. If you want to use h:message, you should specify component ID. So it can be either C or D.

"Which bean Validation tag can you use to apply a constraint on the phone number field?" Phone number field-- we will use Pattern. Pattern constraint because this gives us an opportunity to specify how phone number is going to be entered.

"Which validator can be used to prevent a text input from being null?" It is required="true".

"On the application page where users reset their password, how can you make sure that they enter a minimum of eight characters?" See it is a string. Eight characters, you can use ValidateLength.

So that's all about this chapter. And we're going to start up doing practices.

## Activity 20,21,22,23,24,25,26,27,28 - 37m

All right. Let's continue with the Practice 8. And in this practice, we're going to do the exercises implementing conversion logic, validation logic. All right? So we'll see all of them how to implement with the practices. OK?

Practice 8.1. In this practice, we're going to start with our existing DVD library applications. And this DVD library application, we're going to see that if you are doing some mistake and if there's a conversion error, then error is going to be displayed rendered back to the same page. And how you can customize the error message and fix their locations to be printed on the page. OK?

So very first, they talk about here that you just give a try to the page. Type your DVD title, genre, and the year. I'm just going to type here last year and say Add DVD. It will display the error message. So type it again. And if I say here something like this, it is not displaying the error message.

We're getting error message here because we have not specified where we want the error message to be printed. That's why it could not determine if it's going to be printed here, or there, or on which template area. Right? This is why it's just going to attach that error message automatically at the end of the page. All right? That's why you see it here.

But not to worry. We will continue with the practice. And with the practices, this problem is going to be resolved when you start implementing h message for title just beside each text boxes. All right? Remember, h message is specific to the component. All right?

So I'm just going to open my NetBeans here. It is already open. And see that I have written here h message for title with appropriate type class error. All right? h message for year is type class error. All right? And h message for genre is type class error. All right?

If I save it, it is going to re-deploy my DVD library applications. All right? And I can give this a try once again. OK. Now see, this is what here. Something happened because we have not inserted any proper format here. It is just column two. All right? So we can-- OK, we will do that later on.

Just try it here, the year. And say if I say the same thing. Insidious 3. And if I type here as like before, last year. 2015. And I'm going to hit Add DVD. You're getting the error message just beside the component. OK? Just beside the component.

All right. To fix this problem, what I can do, I can increase the column size to make it 3. So that this is going to be column one, this is going to be column two, and this is going to be with the column three. OK? Save it. Now see, it's all OK. Now you see the error messages here.

But right now, the error message which you see it here, it is going to be with a full summary, a full information. It is going to show you the complete details. And we want not to show the details. We want just to summarize the error messages.

So error messages right now, it is saying the number must be between minus 9222, something like this, to positive long number. Now, if you say, Show Summary True and Show Detail False, you're going to have a simpler message, which is, in fact, good for our information.

So in one of the messages, you can type it here. You are practicing on the release year. So we can type it here and see. Show Summary equal to True. And we can type here Show Details. All right. This is Show Detail. equal to False. OK?

This way, if you give it a try, you will see a simple error message printed just beside the component. Always not forget to refresh the page. And now, if I type the same thing here, Insidious 3. I'm going to type some mistake here that cannot be converted. And here, I'm going to say Horror. And I say Add DVD. It's just a simple error message.

If you do not want to see this error message, you have option to specify validation message in the component attribute. See the components. We have that to build to specify validator message. We can give a message to this.

Good. So that's what the Practice 1. And now we will move to the next practice, 8.2. Using a Non-Default Data Converter.

In this practice, what they want you to have here convert number is standard converted added is specify [INAUDIBLE] Only True and Grouping Use False. Grouping means that you're not going to use any comma, any grouping characters, to group the characters. Like you say hundred thousand-- 100 comma and 000, like this. So we just going to type straight away, number. All right?

So let's give this a try. I'm just going to type it within the input text for the release year. You just Add DVD. Add DVD. OK. Release year. This is the one. Open it. And type it here. And then close. Input text. OK? This will make sure that you're going to type only numeral. All right?

And you have the error message accordingly printed if you try the print last year. It is not going to show you this much detail, the number entered. It should be between this range and that range. It will say, the last year is not a number. OK?

All right. We'll begin with the Practice 8.3. In this practice, we're just going to type Immediate property is equal to True on the command button. You know why? Because command button, it lets you form be submitted. And once the form's submitted, it generates postback request. And the entire page life cycle, starting from the beginning restore view, apply value phase validations, invoke applications, like update model. Everything's going to be processed.

And we just want to escape everything like data conversion and validations. Because we do not have to submit. We just have to go back to our index.xhtml page. All right? So use Immediate equal to True. And this will let you bypass the data conversion and validations. All right? And render the response with your home page. That is index.xhtml.

You can here this type Immediate action Home Immediate equal to True. And remember if you hit this-- type something wrong, even type something wrong. And if you hit this back, it will take you to the previous page. I just have to refresh this one more time. And say Insidious 3. Type something wrong. Have a validation error, conversion error. No problem. And hit type horror. And right now, I'm going to say cancel. That lets me go back to my home page, that is index.xhtml. OK?

In Practice 8.4, we just have to make our field mandatory for the user to give some input. So we're just going to use required attributes. And make this mandatory. All right?

So how we going to do those all? You just need to go to each attribute that you have-- I mean, each component that you have in add.xhtml, like here. See that input text, DVD title is here. You just here need to type Required equal to True. All right?

Once you complete this typing of each components, give this again a try. Submit the page without typing anything. And you will see that you're getting the error message saying that it is required field. So I'm just copying and pasting it here. See that? You just have to type everywhere. OK?

And now give this a try. Save it. Go back. Open add.xhtml. Wait for a second. Same problem. The panelGrid, it's not terminated. OK. Here, it's showing me the error message. I think-- All right. Since we have here converter, we just have to say Required equal to True. We do not have to terminate it. All right? And the same as we can say here Required equal to True. Save it.

And try. Give this a try. Open add.xhtml. I'm not going to type anything. Just saying Add DVD. I'm getting here validation error, value is required. Right? That's what they're expecting you to see once you complete this practice.

All right. Let's see the Practice 8.5, Validating Year Range. And in this practice, what we're going to do, we're just going to here write validate long range, so that the year of can be entered between 1909 to 2013. OK?

So for this purpose, you just have to go back to your DVD library applications. Have your add.xhtml. And there, what you have to insert or validate long range, minimum 1909 to 2013. All right? If you do this, and you test it, you will not be able to enter any other numeral outside this range. OK? If you try, you're just going to see here that it is displaying the error message.

Next practice, 8.6, is using EL Expression in Validators. It is also possible that you can call some bean properties and let the bean property decide what will be the minimum or maximum value here. We just have created, are going to create, get current year methods in your DVD library bean, which, in fact, returns the current year in long format. And then that is the value that is going to be used here for the maximum. OK?

So for this purpose, you just have to go to DVD library bean and insert this method from your activity guide. OK? Once it is done, go back to add.xhtml. And here the maximum, you can take the help of the EL and just type EL expressions. This is DVD dot and call current year. OK? Save it. It will do re-deployment. And then you can try it and test it, whether it works or not. OK?

I'm just going to refresh this page. And if I type here. Once again, let's type some name here. Galaxy 2. And I'm going to type 2016. And genre I'm going to say, for example, science and fiction. Click on Add DVD. You just receive here the error. See the error message say? Should be between 1909 to 2015. All right? See, this value was determined by your bean properties. It was returning the current year. OK? All right, good.

The next one is to use custom validation and conversion messages. All right? For this purpose-- see, so far, the error message that you're getting, it is application-generated error messages from your JSF runtime. And you like to have your own error messages. And it said that you can type here. In these properties you type required message, converter message, validation messages, you can type it here.

But we're not going to type anything. We're just going to have error.properties file created in this package. All right? And in this error.properties file, you have to insert these two lines. These two lines will make sure that the error messages for number converter. And this is going to be long-range validator error messages. So you just have to create error.properties. Let's see how we're going to create it.

Here, where you have all those resource files. In those resource files, you create quickly error.properties. I can say Properties file. Error.properties file will be created there. And in this properties file, you type the two statements. All right? These two statements, you need to type it. As it is.

So I'm just going to type this all there. And let's have this. Make it in just one line. Enter number. And here, that's going to be another key value pair. After this, what we had to do it. You had to release this error.properties into faces-config.xml using message bundle. All right? Open the application tag. We already have application tag in faces-config.xml, because we have included a source bundle for the localizations. Right?

So within the application here, I can type message bundle. All right? And I can give here the name com.dvdlibrary. Made sure no spelling mistake. .resources.error is going to be my message bundle. And then you close the message bundle.

That's what here they wanted you to do it. Here there's the errors because the file was there created errors.properties, that the file, which I have created here, it is error. All right? So which will the name that you get? Just type the same name. Save it. And then give this a try and to see how error messages are being printed. OK?

That's it. Enter non-numeric value in the year field and verify that new converter error message. And then enter number that is out of range, and verify the valid message. OK?

I can just type the same thing here. Anything that you type, for testing purpose. I say here, last year. All right. And I'm going to say horror, for example. Add DVD. Now it's giving me the error that says, cannot find bundle for base name con.dvdlibrary_resources as a locate EM. OK? That we need to fix the problem with how it is going to be troubleshooted. Need to pause and see where's the problem coming up.

Oh, so see where was the problem, actually. It was named as con.dvdlibrary_resources.error. It should be "com." Right? Because the pack is named, it says com. A spelling mistake was there. Just fix this problem and save it. And go back to your page, refresh it, and try and check. For conversion error, just type anything in character. And see Add DVD to display the error message.

There's the first part with display the component ID. Component ID that is going with these options. And the second one, the placeholder 0, that's what the component ID for both the components, from and-- you know, the component. So the component ID and the form ID, they join both to build a unique component ID. And please enter a name that's what here you got printed.

OK? So component ID. And the last tier. Last tier is the value that you see here with the 0. Similarly here, the value 0 and 1, minimum and maximum. When you enter something which is outside the validations. Minimum and maximum that you specify. OK?

Next activity. 8.8, that says selecting a genre from the pull-down list. We want you to have here a drop-down list box. But before we go and make changes in your add.xhtml, they want you to write a code in your DVD library bean so that you can retrieve the list of available genre lists from the database.

Let's see here. This is the code the says get genre list. And what they're doing it, they are using EJB reference to call get genre. EJB, which has the business logic that communicates with the database, reading the database, getting the genre list here.

And that's what you've going to, one by one, iterate with each elements. And putting them into the error list. Which error list, you will finally encapsulate it into select item type of object. And that is what you're going to return back from this method. This error list here is containing the select item. All right?

Once it is done, what you have to do it, you have to add this options, this complements, in your page. All right? Practice 8.8, they want you to have here a drop-down list box showing all those available genre lists obtained from the database.

So for this purpose, what you have to do it, you need to include a method in a managed bean so that you can communicate with the EJB that can help you to obtain the list of available genre list that you can put it into the error list. Right? The error list that contains select item here. See? Select item, which we're going to add it into the genre list one by one.

Select item as the item class object. Select item object that will be used here to display the content in your drop-down list box. So we will do this. We will just go to DVD library bean here and have this method added. All right?

Once it is added, you need to go back to add.xhtml. And here, the genre list, this one, we just have to remove input text. We don't need this. Now, what we need, we need the drop-down list box. And for that purpose, you can select one menu, select many items, select many checkbox. Right? We have multiple types of components over there.

Select one menu, we are going to select it here. ID, we will put the same. And value is going to be DVD.genre. And then here, we have select items that will obtain the list of value from DVD.genre list. Right? So properties. Just say DVD.genrelist. That's going to be OK.

So I'm just going to add this statement into your add.xhtml. Replace the text box that you had earlier. And now, if you see the page, this page will show you the list of values. Refresh. Now we have a drop-down list box. And we have a list of value there. This will be retrieved from a database with the help of EJB that has your business logic. All right?

I'd like to give a look to EJB. Item EJB. See that? Get genre. What they're doing it, they're executing the query. Select distinct query to obtain the column list of genre from the table item. And they are also ordering them in ascending order. All right? They're executing the query. And once of the query executed, the whole list is going to be available to you in this other list, which they return from here.

But you receive it in DVD library bean All right? Under this first genre, which you're one-by-one reading and putting them into the select item. The first part is what's going to be using as your value. The second part is what's going to be used for display purpose, that you see here on the screen and the list. All right? So when you click Action, the value is going to be Action. Click Comedy, the value going to be Comedy. Because the both one is item item. OK?

Now, the next practice 8.9, they say if you want to give some new name to the genre-- see, this drop-down list part, it just has the list of valid retrieves from database. But you're going to insert some record that does not fall in the category or available list of value? You like to give a new name to the genre?

For that purpose, you can simply add here a new text box. All right? So what we can do it here, we can just go to-- first we can have new properties in your DVD library bean. Of course, you're going to have it for that purpose. So I'm just going to have a new properties in DVD library bean. Saying that this is going to be my new genre, in case you're supplying a new name.

And of course, I'm going to insert here-- let's setter and getter. OK? Right click. Getter and setter for new genre. We got getter and setter for this. It's now properties.

And then you move over to the next step. They say, have here, add genre method. All right? This should verify if it is equal to nothing, it should return immediately back the caller. Otherwise should say iterators. All right? And have this new item can be added into your the of select item.

So we just have to modify, add genre. we just have to modify add DVD. This is what you need to do it in this practice.

So add genre method is not there. Right? This method will force to check if the current genre list already has the list in the select item. If not, then it is going to make it available as a part of the select item. So I will just add this method into your DVD library bean. OK?

Go to DVD library bean and add this method anywhere within the class. Similarly, you add another method, which is helping to add DVD-- the time when you're calling add DVD, it's already there. But you need to make sure the newly created name can also be added.

So we just have to modify add DVD. We need to here use If statement to check if new genre equals not empty. It is not equals empty, then you can call add genre list. And have this value, which you plan to add it in the table, be assigned with a new name. OK?

And go back. And here, we can add this information. OK? Then add DVD. OK, good. It's now done. What else? Let's see. That is all OK now. Title, genre, written index. It's all OK. Same.

And now we could also say Set New Genre the can also be equal to null. And here, we can say it is going to be by default get current year, that we can here include. I think this is years-- [INAUDIBLE] It's not year. There's a typo in activity guide that says year equal to. But change it to release year. OK? Release year.

All right, good. Now, what they want you to add a text box. Input text box so that you can supply the new name. All right? Here have this statement added into your Add element, add DVD element.

We'll go to add.xhtml. And add genre property needs to be added. Have text blocks. And put text blocks for the genre list. Just add it. We look at drop-down list box. We can do it here. OK? Message for add genre. And here have a text box that will accept the new value. And of course, you can have error message for that. So just if there's any error, that can also be displayed just beside the component.

OK. So I'm going to copy paste just to save time. But you can type it. That should be there. panelGrid, as well. Save it. This will re-deploy. And then you can try to see if the changes are made in your add.xhtml file or not.

Now you have a list of valid. But if someone would like to type something new, we can type it here, which is not there on the list. OK? MyType That's going to be genre list. And when you say add DVD, and planning to add something, it will check first if it is nothing. All right? Or if it is duplicate value of all of the available genre list. It will verify each and every thing. And then we'll proceed and [INAUDIBLE].

OK? Good. That's all about this practice.
