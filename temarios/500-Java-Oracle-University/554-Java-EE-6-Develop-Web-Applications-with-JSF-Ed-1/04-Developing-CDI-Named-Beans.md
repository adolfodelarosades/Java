# 4: Developing CDI Named Beans

   * Developing CDI Named Beans - 1h 16m
   * Activity04 - 5m
   * Activity05 - 3m
   * Activity06,07,08,09 - 44m

## Developing CDI Named Beans - 1h 16m

All right. Let's start with chapter 4, developing CDI named beans. So for you people listening to me, sometimes I say "managed beans." Sometimes I say "named beans." Let's figure out when it is managed beans, when it is named bean, and what are the main differences between those two things.

Objectives of this, to let you understand the managed bean concept. And with the JSR-299, you're going to take the help of CDI annotations to build named beans. And we will also help you to understand the binding of the UI components with the managed bean and using unified Expression Language, and use CDI bean scopes.

It's a long topic. It's going to take some time, more than 30 minutes. Approximately, I can say one hour it's going to take the time to complete the lecture. Managed bean and CDI beans and the unified Expression Language are the topics that we're going to discuss here.

Managed bean annotations. We can create the managed bean using managed bean annotations which is from JSF. It is from JSF implementations. Outside JSF, we have javax.inject API, and that is from CDI. Remember, the CDI is not by default enabled in your Java EE 6.

So if I type it here, this is going to be from CDI. CDI stands for Context Dependency Injections, which is by default not enabled in your Java EE 6. But if you're using Java EE 7, it is the default one. In Java EE 7, we use CDI injection as default.

What is the main thing here? If you want to use CDI and create a named bean, replacing the traditional managed bean from JSF API, both jobs is the same. You have to include beans.xml file in your WEB-INF folder. Remember, we have WEB-INF folder. You have to include beans.xml. Just by including beans.xml, you have enabled CDI and you can start using name annotations.

Introduction to CDI. Before I introduce CDI, let's talk about this managed bean, I'm going to take you to my demonstrations, to remote desktop. Take this Hello JSF example. Index.xhtml, and here, we just have created an attribute with the request scope. It's a memory variable. It's not a Java class object. It's a memory variable for the request scope.

What I'm going to do is I'm going to use the managed bean. Job of the managed bean, to hold the data that you have submitted from the pages, and of course, containing validation logic, action processing logic, event handling logic. And in case you'd like to wire your managed bean with EJB so that you can take the help of business logic available in your Enterprise Java beans. That you can do it with the managed bean. So managed bean is a kind of backbone of your JSF pages.

Now, if I go and create a Java class, simple Java class, I'm going to create it. Give a name, My Bean. Specify the package. I say com.example.bean. It's the package. Finish.

A simple Java class is created, and I can make it managed bean. You can use annotations. JSF 2.0 supports annotations. You can here specify managed bean annotations. Just type it, fix import, and this is going to be available to you from the JSF API, javax.faces.bean.managedBean. Managed bean.

We can have here some variable. Let's say Private String. And now I can say name.

As well, I can have setter and getter. Take the help of NetBean to generate setter and getter. Insert code. We have here option, getter and setter.

When we're not typing any constructor, that means default constructor is already there supplied by the compiler. If you want, you can have a default constructor. It's OK.

Now, this bean is available to you for the binding on the JSF pages. As well, what we will name. The name variable reference name to refer to that object which will be created at the runtime will be lower camel case, my bean.

If you want to specify some different name, you can here say, name equal to, and some name you can specify here. Let's say I'm saying user. If I say name equal to user, the variable which will be used to refer to the object is going to be user, something like that someone has created an instance of the my bean class, new my bean.

Remember, you are not going to instantiate it. It will be created automatically. But the reference variable name will be user because you specified it. If not, it is going to be the same as class and lower camel case. Just note it down.

Now, if I go to index.xhtml and would like to have a binding with a managed bean, I can say here #, say here user.-- see, you're getting here name properties. You don't need to call set name. You just say name. It will automatically determine to call setter or getter. When you submit the form, setter, when you display the form, getter.

Same as I can go to response.xhtml. And here, what I can do, I can use the EL binding and say, user.name. It will display the value from that been properties. This is managed bean.

We have another option to let a Java class be listed as a managed bean using configuration file, which is JSF configuration file, faces-config.xml. And there, you can specify the set of XML elements and list my bean as a managed. With annotations, it's going to be easy for you. Good.

We can also specify here scoping. Request scope, session scope is available to you from the JSF. I can say request scope. When I right click and say fix import, we're not using CDI right now. Request scope. Fix import, it is going to be available to you from the JSF, javax faces bean request scope.

This is default. If you don't type it, it is going to be request scope. You can change it to session scope or to application scope.

We can also include here some required attributes that you have seen in the last chapter to make this mandatory field. Required equal to true. Required property is now equal to true. That makes this field mandatory.

I just save it. It is redeployed by the NetBean. We can try this Hello JSF. Let's type here, "Hello JSF."

See the page? It's showing you text box. But if I right click, if I just click Go without entering anything, it is taking this as well. It shouldn't be. That means there's some problem with this required attribute. Check it.

I think it was this spelling mistake, required true, right? Now let's try once again. And go to page, refresh it. Go. We're getting the error.

Remember in the lifecycle what I said to you? If you have the validation error, it is going to redirect you to render response without processing the next phase. So you're getting the error right now. And this error, it's showing you the name of the component ID.

If you see the source page, the component which was rendered to you in HTML, it has a name. And it is right now showing you the same name, which is not user friendly. And that's what we can use label. We can use label. Or you can specify some ID here. But better, you can use here label and say name.

This label is useful for error messaging. So when an error message is displayed, this part is going to be replaced by the label that you have specified. Refresh it. Check name. So that's what the managed bean.

Now, when I say CDI managed bean, they do the same job. The only difference that you'll be able to take the benefits of CDI functionalities, which we will discuss with the next slide. But for the CDI, what you have to do is you have to include here beans.xml.

The time when you're creating new applications, you have the option to enable CDI, Context Dependency Injection. If you have any existing application where the CDI is not available, not enabled, you can do it just by adding beans.xml.

We have here the option. We can select beans.xml, next, add it to WEB-INF folder. Once it is added, CDI is going to be enabled. There's default elements, beans. There's nothing to type. It's just going to be empty. And you just continue using CDI.

Now, what we can do, we can change this to the named bean. For the named bean, what you have to do is you can type here name. This name is available to you in javax.inject, which is not part of JSF, but it is part of Java EE 6. That means named beans can be used in other applications as well. In all your Java EE 6 applications, whether you're using JSF or not, you can use named beans.

We do not have a name attribute. We have here a value attribute. So you type value equal to user. Request scope. You also have to change it. Now what we can do is you can import it from a different library that is a part of Java EE 6. Say fix import. We can get it through javax.enterprise.context [INAUDIBLE] scope.

Just make sure if you're creating a named bean and using it here at the place of managed bean, don't forget to implement serializable interface because this is an external class. It must be serialized to be used here in these applications.

And fix import. If we do it here, it is going to be available to you from java.io.serializable. The rest of the thing is the same, and we can continue using this as well. But right now, the bean that you have, it is known as named bean. It is from CDI.

If I go to this, same thing. If I type here Nitin, it's mandatory required is equal to true. Successful. You will be navigated to the next page. It's completed its life cycle. Render response with the next page showing you what you have entered, Nitin, using named bean.

So that's what managed bean annotations that can be used to create a managed bean. Or you can also use the named bean to replace the managed bean. But it is going to be used here in JSF for the managed bean.

This is from Context Dependency Injection, totally a different package, not a part of JSF. It is a part of Java EE 6, and it can be used across multiple Java EE components. CDI was introduced because we'd like to have the standard annotation services that can be used across multiple Java EE components.

You know that we have set of annotations available that is specific to the API. For example, if you have to wire Java e-components with the EJB, we always use @EJB annotations. We type @EJB.

Sometimes, we type @resources if we have to have dependency injection to obtain the resource instances, object references. For, example, JMS connections, data source connections, we use @resources. So different annotations are available for dependency injection, and they are specific to the API. We want to standardize all those things so that they can be used from the one set of API that is from CDI.

And all that you use here can be replaced with one injection, that is, @inject. @inject. It is from CDI. So CDI provides a loose coupling and provides a strong typing. And dependency injection in Java, it has been enhanced with the context dependency injections.

If you see that here, the CDI, the standard dependency injections, which we have here defined in JSF-330. The main purpose of this, to standardize. Set of services available there that can be used across all the Java EE components. It is not specific to one of the APIs-- EJB, JSF, something like that.

It provides an architecture that enables Java EE components to exist within the life cycle of applications. So scoping is also available from the CDI-- request scope, session scope, application scope. It is also available from the CDI. Thus, it helps us to unify and simplify EJB and JSF programming model.

See here, they say context and dependency injected managed bean. Managed bean which is always going to be bound to the context. Now we will use the named beans from the CDI. And the CDI has the mechanism for injecting beans that you'll be able to wire bean one to bean two.

CDI provides an option for intercepting and decorating method calls. You mean to say intercepting. That means when you're trying to access any methods of CDI beans, you may have somebody there to intercept the call and do something else that you'd like to, like filter and servlet. Decorating method calls can be useful to give some additional behavior to a given method.

Firing and observing events. CDI managed bean is capable to observe the event. That means if you have the array list and you're adding some elements to array list, you'll be able to observe that. At the runtime, you'll be able to count how many elements are being added, how many elements you're removing there. So you can observe your components with the CDI. It has observable events.

It is Java EE 6 compliant so that we can use CDI with all the Java EE 6 components. The only thing that is not enabled by default, you have to specifically enable it by adding beans.xml. And that is going to be default in Java EE 7.

If you want CDI managed beans, we can say named beans as well, use named annotations. That's what here in this slide, they say that you have to use beans.xml. If it is available in WEB-INF folder in Web Applications, that means CDI is enabled. If it is Java SE applications, EJB module, we can enable it in the META-INF for other archive-- means other than WAR. Not Java SE, Java EE applications. It's a part of Java EE, so you have to use it Java EE.

Declaring a CDI bean. Simple way. Just say named. See that named, sessionScoped, customer implements serializable. Make sure that when you type a class, don't forget to implement serializable interface. Have named annotations which will make it CDI bean. Don't forget to have beans.xml added in WEB-INF folder.

Javax.inject is the API from where you can find the name. Javax.enterprise.context is the package where you can find session scope, application scope, and request scope, just to specify the scoping for this customer bean object.

If you're not specifying any name to this, remember what I said, that you can say name value equal to something. As well, it is going to use the same name to refer to the customer object in lower camel case. That's what they say, named form.

Now here, something that is very important for us to understand. You can say name value equal to form, or you can just type this way, name form. Same thing. If the attribute is value and the annotation has a single attribute value, we can't ignore it and just type the form. It actually goes to the value. It will automatically understand value equal to form.

Session scope. And of course, as well, you can have user entry form bean, implement Java IO serializable, and have the bean properties over there. This is a class name, but you will go for the EL binding using the name form.

A lot of properties you can have over there-- first name, last name, email, and of course, you're going to have setter and getter for them. Don't forget to have a default constructor, because that will be used to instantiate them. And once it is done, as well, you can go for the EL binding and specify here pound, braces, customer.firstName.

See why they're saying customer.firstName? Because here, in this class, they are not specifying the name value equal to something. That's why by default, the reference name will be customer in lower camel case, customer.firstName.

Similarly, you may have a managed bean or a named bean with the name manager if that has a method that can also be bound with the action attributes. It's a method. You don't need to use here parentheses. The same thing. You can just say here, parentheses, or you don't say. It is always going to be some method, manager.confirmCustomer. If you have no arguments to be supplied, just ignore it and type confirmCustomer, the name of the method. It will be OK.

See, injections. When you have to perform wiring from bean one to the bean two, we can use inject. You know what this means? Let's go back to your class customer that they have it, CDI beans implements.serializable interface.

This is named bean, right? Session scope or request scope, whatever it is. We have entered a class, class customer manager. That is again a CDI bean.

You'd like to have the wiring. How will you have it from customer, manager, to customer? You just have to use @inject. And here, create a reference or properties for customer type. Give any name that you'd like to customer, cust, any name. And of course, setter and getter for that.

This way, when you specify the EL for the customer manager, they say here name, and they specified the value equal to manager. That means the EL you can use from the manager, you can access cust. And from the cust, you can access customer properties. They have private string name. And of course, setter and getter for this. Cust.name. That's the wiring.

Through the customer manager, you can access the object properties of the customer. It's the wiring. It's very simple here with the CDI beans. If it is not CDI, it's simple JSF managed bean. You're using here managed bean annotations.

In that case, what you have to do is-- I will use red color-- you have to use managed property. And you need to type managedProperty value equal to, and then give the EL name of the customer object that you'd like to inject here.

This is what you need to type if bean is not CDI. Means you're using managed bean annotations from JSF. But this is now simplified here with CDI. Just inject customer or cust. It will automatically let this named bean be injected here.

The object which will be created at the runtime an object of customer manager will be created, an object of customer will be created which has a string name. An object customer manager has cust. And this means that we will be able to have the reference of this object be injected here.

So if this is manager, and you say manager.cust.custName, you will be able to refer to cust and custName. So this is your customer. And that's the name. This is cust, which holds the reference of customer object. That's the wiring. Very simple with the CDI bean.

What else, you can do it in the managed bean. Don't get confused, managed bean, CDI named bean. When we talk about validation, action list, it's all going to be the same.

In a bean object-- managed bean object, CDI named bean object-- you can have validation methods, action event handler methods, value change event handler methods, and of course, what we say action processing method, that you can type what you like to do it. And you can also define navigation, which page you'd like to go to, which we say action methods in the managed bean.

That's the way that you're going to type the value expressions, user.name. You're referring to the bean properties name. Company.president.name. That means company is a bean one, which is referring to bean two, president. And the bean two has a property name. This is the example of the wiring.

User.validate to invoke a bean method. If bean method accepting any parameter, you can use parentheses and specify the value. The value binding, see, user.name. We use the value binding to the bean property.

And see the binding? It is useful to let your components be bound with the component instance. Remember, all those components that you type on the pages, they're going to be instantiated and be part of the JSF create view and restore view structure. The reference you'd like to hold in a managed bean for later some programming, some manipulations that you'd like to do it by referring component object. You can use binding and specify the name of the properties, which must be the same as the type of text box. Input text is a type of UI input. So name field property must be UI input type.

Component instance bound to the bean property. What they're telling you here, they say if you use the binding and you'd like to have the component instance be bound with the bean properties, you can get the chance in the programming to play with the component attributes.

Managed bean can instantiate components. And this is useful when you're using your own custom components. You may have to instantiate them so that objects of that particular component can be created and be a part of the component tree structures.

Component value binding is useful because you have to submit the data. Here, the managed beam which we also say backing bean, has no dependency with the UI. Bean properties can be bound with the value attribute of any other components. It should not be the same as component type. It will be a string type. It will be a number type. It will be Boolean type.

And that value you can reuse with multiple components and have a binding. JSF can perform conversion. Remember, all those values that you submit from the page on the browser, they're all going to be submitted as a string. That's the main part here for you to understand.

Let's see. This is my page that says enter a name. Text box, and says enter name in my hello JSF. Enter your name. When you type here Nitin, or you type any number, anything you type there, when you submit and hit on the bottom that is Submit button, what happened in this case? It is going to generate HTTP request.

It's generating HTTP request, POST request. HTTP request that gets generated has HTTP header and the body. Header contains the information about the target URL. Remember, the target URL where you're going to submit those data, it is going to be your Faces servelet. That is default. All the forms will be submitted to Faces servelet.

In the body, you will have the name of the components, ID of the components. If you have not specified any ID, it will be generated by the JSF runtime and be a part of your HTML source. So say something like that, it is going to be here, IDT J_IDT7:J_ID11, something like this, if you have not specified.

That is going to be the name of the components in HTML if you see the source page. This will use that name, IDT7:J_IDT11 equal to Nitin. It is going to be part of your HTTP body, and that is what is going to be received by your server. And you have the Faces servelet over here.

The job of the Faces servelet is to read HTTP request and find each parameter that you have submitted. Preparing here this structure for the page, the component tree structure, and then this value will be applied. Faces servelet will read this value and will apply this value on the component for the text box. That's what you here say is going to be UI form, for example, and this is your UI input. So in apply value phase, this value will be applied.

That is the time the conversion is going to happen. So if the value binding is with a string type, then it's string to string. If the value binding is with integer type, then it's string to integer conversion going to happen. This conversion happens automatically from a string in HTTP request body to any Java primitive types, including string as well.

That's what here they explain, binding component values to bean properties. This is what the example of the bean. See, integer current options. And you have the value binding saying myBean.currentOptions. And you do not have to perform any conversion. A string value will automatically be changed to number.

It doesn't means that you type my name, and that can change to a number. At that time, you will have exception, and it will show you error message. You type number 10, which will be in a string format, and that gets changed to integer.

A managed bean can programmatically modify component attributes. Remember, if you hold the component binding reference in the bean properties, you can modify the component attributes programatically. And this is what you can do with the help of this binding, because you have stored the component reference into the bean properties, which you can use in the programming to modify component attributes.

Instantiate components rather than let the page author do it. Have a property bound to a component instance returns and accepts a component instance. So a lot of things you can do programmatically if you have the component reference with you available in the bean properties.

See that? Input text ID. What they want? They say binding equal to autofill.inputID. They have the managed bean or the named bean, but the property's input ID is going to be the same type as the text box Java class type. So the reference of input text can be stored here. Similarly, the input text difference of this object will be stored in this bean properties, which will be used in the programming for any modifications in the component attributes or to perform any manipulations.

See that? A managed bean what they have created here. They name it autofill. It is managed bean, not named bean. It's OK, no problem.

And here, see, the HtmlInputText, inputID, inputFname. This is all what type? It is all HTML input text type. That means referring to your input text box. You can use UI input as well, because UI input is the superclass of HTML input text. So when the component structure will be created in the create view, restore view time, the references will be available here in the managed bean object that can be used in programming.

A quiz for you. Which annotation would you need to use to wire two CDI beans together? Remember my explanations? This is CDI beans. In CDI beans, to wire, we will use inject. If it is not CDI bean, we will use managed bean. No, we will use managed properties. Managed properties if it is not CDI beans. It's a JSF managed bean. CDI beans, inject. Simple, right?

We have the next topic to let you understand the unified EL. And unified EL can be used this way, cascading dot operators to refer to the wired bean properties, pet.owner.name. That means pet is the Java class object named beans or managed bean which has the wiring with the owner class Java bean object, and that has a property name.

You can also have elements be referred using EL. You specify the array name and specify the element index number. You can also have here requestScope. RequestScope pet. This way, you can specify.

If you have to store any properties in the memory requestScope, sessionScope, applicationScope, you can refer to them by typing requestScope in this square brackets, double quote specify properties or this way. I use the second way, requestScope.pet.

JSF 2.0, method expressions can have parameter values. If your method is expecting parameter values whenever you're invoking them, you can specify the parameters. See that? EL says that you can perform some automatic and logical operations.

This is what automatic operations they perform. They use param.miles. Remember param is the EL object, implicit object, that represents request.getParameter. Any data that you have submitted and it is part of HTTP request, you'd like to read it directly using EL, you can say param.mils.

So let's see one example. For example, a page. In this page, what I did, I'm using h form. I have h input text value attribute. And in this case, I can go for the value binding with the bean properties. I can have user.name.

Here, I can make this a part of bean properties. So at the time of update model, the component state value will be updated in the bean properties name. But if you have an HTML component input text, HTML input type equal to something. You have HTML value equal to-- you can type some value. Name equal to, let's say-- this is HTML.

Now, the HTML, it is not server side component. It is not JSF component. Thus, they will not participate in your life cycle processing. There will be no create restore view phrase for them. There will be no validations, apply value. There's nothing with update model. So you cannot have the value binding for them.

But when you submit this form, this all is going to be associated in HTTP request. HTTP request for input text and for this is going to be there in the body. So HTTP request contains all those values.

For JSF components, Faces servelet will read and will apply them to the component state, which will later be updated into the model. But for non-JSF components, Faces servelet will not do this, will not make them part of create view, thus no apply value, no update model.

What is there in HTTP request, you can take the help of param.miles. Param.miles will read HTTP request body and find a miles attribute over there, read the value. And that value, you can use it here in some logical operations.

We can also use a comparison operator equal to, not equal to, less than, greater than. You can use here less than or equal to, greater than or equal to. If you want to use this way, eq, ne, lt, gt, le, ge, it's all OK. LE means less than or equal to, greater than or equal to. Logical operators can be used, like [INAUDIBLE] or like [INAUDIBLE] that you use and, or not. That's OK.

Quiz again. In the following expression language syntax, h:commandButton value equal to form.currTotal. They say the currTotal stands for current total. It is an integer, it is a page, it is evaluated immediately, or the current total is a property.

See the value binding. Value banding is always with the bean properties. That's why the answer for this quiz is D. It is a property.

A lot of implicit objects. We have just seen the param is one of the implicit objects available to you that you're going to straightaway type it to the EL under JSF pages. We have application scope, request scope, sessionScope dot some attributes you can refer, header values you want to read, HTTP header values, header name. Any initialization parameter, which is the part of web.xml. View, that is the root of your UI components. That reference, cookies. Faces context instance you'd like to refer in the EL. You can use them in your JSF pages. They are implicit objects.

We have the flash is a temporary memory which is available or between two views, between two pages. From one page, if you're navigating to second page, it is available between two views. Temporary memory so that you can hold some temporary data and decide whether you'd like to keep them in the managed bean or not.

Resources is again an implicit object that can be used to refer to application resources, like style sheets, images. Components. The current components. This is an object reference that you can use in programming or in JSF pages to refer to the current components.

CC current composite components, and the viewScope. That can be used to refer to the viewScope. ViewScope means it is the scope which is available with the same page. A page has one scope. When you move to the next page, it's a different scope. So anything you store in the viewScope memory will be available as long as you stay on the same page. When you go to the next page, this memory is not going to be available. That means you have different viewScope.

Resources. See that, resources, what they say? If you want to restore some style sheet files, some images, JavaScript files, what you can do is in JSF, you can create a Resources folder. The benefit of this.

So here, if I want to store some images, a CSS file, we can here create a Resources folder. New. I can say I want a folder. We can go to Other and create a folder with the name of Resources. It is mandatory that you type the name as Resources.

Under this, you can have subfolder, whatever the name that you want. We can create a folder for CSS. We can create one more folder over there for containing images. And under that, you can copy, paste your all CSS files, or you can create CSS file using NetBean. And you can here copy, paste your images. This just going to be a folder in your file system.

But this name has some special meaning. These images or CSS, you'd like to use it on the JSF page when you're specifying here, let's say, h output. A script is useful for JavaScripting. Output is useful for CSS file.

Here, you see here, they say library, right? You just have to give the name CSS and then you specify the value of that file name, CSS file name. any file that you may have, style.css. What it will do, it will import this file from this folder, CSS. This is going to be treated as library, which it will find it under Resources. So you should have here CSS.

Don't forget to specify name attribute, something name you can specify. That is mandatory attribute. Name equal to some name you can specify here. So this way, you can include the CSS file, CSS that may have some classes, like CSS.

If you know how to create CSS, you can just take the help of here, see, we get this one. I can say I want to create style.css in this folder. And this is style.css. You can specify the class. But I can say my style. That's going to be class name. And I can here specify some attribute, color equal to blue.

Multiple styles you can specify there. And this is the style. You will be able to use it in any of the attributes. I can say here we have a style class. And I can give here the class name that I set, my style.

See the My Style? It's giving you the reference of My Style because it gets My Style here in the style.css, which it included from this folder, which it found from these Resources. So this name is mandatory. If you have any other name, them you need to specify the related path to import that.

I can try to see whether my style color blue is implemented here input text or not. We could just take a look. It may or may not work. So we can try this with color, style color. I think this is not the background color. It is the text color. You can hear type some style color as well to see your command button colors change. So we need to rebuild and then deploy, and then you will be able to see it.

That's just an example to let you understand how important it is to have a name Resources where you can have subfolders containing images, JavaScripting, and Cascade style sheets file. That's what here they say, library CSS. So it must be there in the Resources. Images in the Resources so that you can directly use the name of the image and specify the library where the images are located.

Managed bean scopes which are available to you-- requestScope, applicationScope, sessionScope. Remember, requestScope is just going to be available to you for single request response cycle. SessionScope is the bean object which will be available to you for the whole session, for the duration of HTTP session. Once you invalidate the session, this memory is going to be garbage collected.

ApplicationScope, it is going to be available to you for the whole life of applications. When you deploy your applications, it is going to be available to you starting from the deployment to undeployment. This memory will be removed once you restart the application server, restart your web applications, undeploy your web applications.

And we have conversationScope. This is a new scope. It is from CDI, custom scope from CDI, conversationScope. It is custom scope. That means you can decide how long an object is going to remain in the memory.

Dependent. This default scope now in the CDI bean. That can be dependent on the object that they are injected to. This means if I have a class A, let's say class A, and there's a class B, let's assume that they are named beans. I'm just here typing @inject. I'm saying B.

Now, if the class A has a sessionScope, class B object is going to be with sessionScope, because by default, it is here dependent. If you don't type, it by default is going to be dependent in CDI beans. So as long as A object exists, B object is going to be available.

That's the managed bean scope life cycle. See that multiple requests you generate. And for each request, a new bean object it is going to be created if you use requestScope. ApplicationScope is just going to be available to you from the start of applications to the end of the application life.

SessionScope is just for one session. One browser, one session. Different browser, different session. You can programmatically invalidate the session as well. That option you have seen in multiple websites. They say log out, sign out, invalidating the session.

ConversationScope, which programmatically can be controlled when you say begin, and a scope begins. When you say end, then the scope is going to be ended. The whole memory will not be available once you say end and will be available once you say begin.

Flash is just the memory between two page navigations. It just holds the temporary data to let you decide whether you want to store them to managed bean or not, seeking some confirmations and holding some temporary data. RequestScope as well is going to be for each request. For each request, a new copy of the object will be available to you.

That's again the managed bean scope. There's a RequestScope, conversationScope, sessionScope, applicationScope. RequestScope has a little time duration, just only for a single request response. Conversation, which is programmatically customized, you can specify when to begin a scope, when to end a scope. SessionScope for the whole session, applicationScope for the entire life of your applications.

Let's see the conversationScope how it works. ConversationScope, it is about custom scope that you can have the programming control to begin this scope and to end this scope. We will see how this is going to be done with an example, That's what the conversation interface that you have to obtain through the dependency injections. Since it is provided through your CDI injections, we will use @inject to open conversation reference.

And then we have the control to begin, to end. We can also set the timeout, how long this scope is going to remain in the memory. You can specify the time in milliseconds. And after that, it will automatically be removed from the memory.

You can check the state of the object, whether it is in transient state or not. Remember transient state, what they say. The conversation state is transient until it is market long running by calling conversation.begin. And a state returns to the transient by calling end. That means once you end it, the scope object is going to be in transient state. Will not be available through the EL on the JSF pages.

So we will see this, how to do this, on the applications. We have to obtain conversation object through the dependency injection. CDI named bean is important for you. You must use it with the CDI named beans. @inject is the annotation that you will use to obtain this through the dependency. Then you can call, at any point in programming, to begin and to end, to remove the beans from the conversation scope or let the bean attach with the scope when you say begin.

Let's see the example of this, and then we're done with this chapter. We'll go back to the example. If you see that here, conversationScope example. We have the list of items available, multiple items there in the list. If I say Delete, same page is requested. Delete, same page is requested.

See the number of items it is being deleted? That means the objects that hold terms in the collection, you're using the same object. So delete. Now it's at three. When I say end and come back to this page, we'll find again all those items there in the list. That means you restarted the conversationScope.

Let's see the program. What happened? Index.xhtml, it just holds a command button reference to the item.xhtml. There's no need to type .xhtml. You can just say items. It's enough. Take you to item.xhtml.

Value is managed bean, which will take you to item.xhtml. And this item.xmtml, what they have, they have here the form. And the form, they have data table, which will help you to show the collections, object and tabular format. We're not displaying border. If you want, we can here type border equal to 1 so that you can see the border. We're not using any border. that's why it is displayed like this.

Now, if you see that here, each column has some value item. And this is going to be repeated n number of times. And n number depends how many items are there in the list. AuctionBean.getItems returns the collection. So go to AuctionBean.getItems, see what they are returning right now. see, getItems returns an array list, items.

What happened in this case? When you first time make a request, it is conversation scope, a managed bean object is going to be instantiated, but it is not going to be part of conversation scope immediately, thus will not be able with the EL for binding purpose. Auction bean object will be created. See, a constructor is invoked at the time when the instance is created. An array list is going to be initialized. This is going to be initialized with the array list type.

Post-construct, just after a managed bean request is created, it is going to begin conversation begin. So post-construct means this initialize method is going to be invoked just after instantiation. As soon as it calls initialize, it is going to begin conversation scope. This is the time the bean object will be associated with the conversation scope and will be available to your JSF page through the value binding.

What they said? They have added some string in this array list-- [INAUDIBLE], something like that. They have added it here. How many items they added here? One, two, three, four, five, six. The get item, it is showing you all those six items here.

And right now, object is associated with a conversation scope. When it's calling delete, clicking on Delete button, you have the Delete button. See the Command button has a Delete button, which calls auctionBean.deleteItem, the current item in that particular row.

What happened in this case? It calls delete. Here, you have itemName, which you are removing it from the array list. It's a void. That means you are going to display the same page. But once you display the same page, you will find the data table that's displaying the array list, it does not have the item that you have deleted.

That will prove the point that you're using the same object every time when the render response happens. This is a command button. You're initiating postback request. Life cycle begins, and this rerender the information back to the browser, same page. And you see the item here. It is after deletions. We're using the same object.

You see Refresh will not make any changes. When you say end, what I'm doing here in end, see that? In item.xhtml, we're calling end here. This calls auctionBean.endMethod, and this method is here.

What we're doing is returning a string, conversation.end, and we're going back to index.xhtml. This is the example of dynamic page navigation where in the programming you can decide which page you'd like to navigate to. So return type is string. You just tell the name of the page that you'd like to navigate to.

Index. But conversation.end. That means object will be removed from the conversation scope at this point. End, and you go back to index.xhtml.

Now, index.xhtml, when I'm reclicking on the Command button to go to items.xhtml, here we have a data table that's obtaining the reference of auctionBean.items. In this case, JSF runtime will create a new instance. A new instance of auction bean will be created which, in fact, will call initialize because it has post construct. And it's totally fresh object. In the array list, it's going to have all those terms added into this new object.

And then get items will be provided to the data table, which will list out each item. If you see all those six items, that means it is a fresh object. Because you say conversation end, and now you're going to begin. Begin, a new object will be available to you in the scope.

The same page, you're going to redisplay here managed item. That shows all those things that you have already deleted last time. But since you're getting all those things here, that means it is totally a new object which was created and attached to the conversation scope. That's your data table is referring to the EL.

So this is the way we use the conversation scope. We have the options to begin when we want, and we have the options to end the conversation scope so that object can be removed from the memory. So that's all about the conversation scope.

A lot of things there to let you understand. Here, we're ending it programmatically. But if you wish, you can use a timer, I mean specify the time out. So that's what they explain in the PPT. If you go back, they say you can use set timeout. It will automatically be removed from the conversation scope after this time.

You can check whether the object is in transient state or not. If it is true, that means it is not part of conversation scope. If it is false, that means it is there in the conversation scope. That's what here they say, is transient until it is marked running by calling. So when you say conversation.begin, it is not transient. It returns to a transient state when you say end.

So that's all about this chapter. There are a lot of things to let you understand in the CDI, which has qualifiers, stereotypes, producer fields, interceptor, decorator, and events, like Java bean events, that can be used to observe some collections just to check whether items getting to add or remove, something like that.

So if you want to get some additional things to learn for the CDI, go to the tutorials available online and see how this is going to be helpful in Java EE 6. May not be useful in JSF. Useful in EJB and other programming.

This is a list of additional resources which are available that can help you to learn CDI in details and find more options to play with the CDI.

## Activity04 - 5m
## Activity05 - 3m
## Activity06,07,08,09 - 44m
