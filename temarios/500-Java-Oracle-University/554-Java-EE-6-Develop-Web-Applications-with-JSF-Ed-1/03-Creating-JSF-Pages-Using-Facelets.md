# 3: Creating JSF Pages Using Facelets

   * Creating JSF Pages Using Facelets - 1h 1m
   * Activity03 - 20m

## Creating JSF Pages Using Facelets - 1h 1m

Welcome back. We're going to continue with the JSF pages using Facelets. This chapter, you will see the complete information which you will use to create JSF pages.

Objective. See, we are here at this point, creating JSF page using Facelets. And after, we will continue with the CDI named beans. Objective of this chapter, to let you understand the hierarchy of UI components, evaluate the structure of JSF pages, listing the tag libraries supported in Facelets, describing HTML render kit tag libraries, and list common attributes of the HTML tags, and describe the JSF core tag libraries. UI components, JSF component rendering model, Facelets, and the tag libraries are going to be topics in this chapter.

See the UI components in JSF. So far, you people are creating simple web applications. Even in the simple web application, you see that it starts with JSF UI components-- h form that contains some sub-components, like text boxes list boxes, radio buttons, drop down boxes, text boxes are all going to be there, which you use to submit the form.

Input text is the text box. Command button is the Submit button. Here, they have IDs specified. You wish to have IDs specified, you can. If you don't do this, a unique ID to each component like h form here, there's no ID specified, will be assigned by the JSF runtime. But we don't know what will be the ID.

So if you have to use any JavaScripting, you have to do it with the components for validation, for conversion logic, you may need to know the ID of the components. And that's why we can specify the name for the components. So here, ID username, value equal to helloBean.name, id submit action equal to response. Again, response is going to be your JSF page.

And the value is submit. It is what your JSF page looks like. You can have multiple UI components added in one JSF page.

UI components which are possible to be added provided by the JSF tag libraries, HTML tag libraries. You have text boxes. See, that is the combo box, which we said drop down list box, check boxes, list boxes, and the radio buttons and submit button. Apart from this, you have several other components that you can use, like data table, image. To display some images, you can have image components.

All those components are available to you for HTML response and JSF HTML tag libraries. You will initiate h. You will find the list of the components. You can use form, input tags, command button.

Remember on the introduction what I said to you, that all the JSF UI components are actually Java classes. You are using them in the form of the tag because you have the tag libraries. Like h form, it is a representation of the UI form. InputText is a representation of UI input Java class, and the command button is a representation of UI command Java class.

The tag handler. They are known as tag handler Java classes, tag handler. UI component classes are the subclass of UI component. This is the superclass, root class, of all the JSF UI components. Developer can extend these UI components classes to create custom UI components.

You know Java programming, you have these classes with you. Say, for example, UI input. It gives you the input box and you want to extend it. That means that you can create a class, my text box. Text box something-- you can type it-- extends UI input.

With this, you get the chance to overwrite existing behavior of UI input class and give them some additional modified behavior. This way, you can create your own custom UI components of UI input type. Or you can create a custom component, totally different, totally new, extending it from UI component, this one.

If you see that here, the element of UI component model, we have several classes over there for different purpose. They all are the subclass of UI component class. UI component is going to be your root class.

Rendering model is useful to define how those components are going to be rendered. You have seen that the component that you have used so far, like h input text, command button, they are getting into HTML, translating into HTML. Who's translating them? JSF runtime. When the JSF runtime is translating them into HTML, they use this render model. The default render model in JSF is HTML.

Event and listener model that defines how to handle component events. This all is there in these UI component classes that provides state and behavior for each UI component for rendering purpose, for event and listener model purpose, for conversion models and for validation models which are registered in the JSF onto a component.

This is the complete hierarchy. We'll start with the UI component super class, root class for all the UI components that you have in JSF. UI component base is, again, a Java class. And under that, see that? You have UI panel, UI column, UI command, UI form, UI data, UI graphic, UI naming container, message, UI messages, UI parameter, UI output. A lot of things are there.

You see that here, you have UI input. Under that, you have UI select one drop down list box, select many list box, select Boolean UI view parameters. And all those components available to you in the Facelets to be returned in the form of the tag. So they're also known as tag handler classes.

And you have the appropriate tag libraries that you can use on the JSF pages so that you can use those classes in the form of a tag, which will be instantiated at the time of create view or restore view. That is the first phase.

Rendering model. As I said, the rendering model, it is responsible for render response. How your components are going to be translated, will be translated into HTML or some other type. The default rendering which is used here in JSF is HTML. Components must decode and encode themselves. It's a direct implementation within the Java class we have here.

So UI components can provide direct implementations how the components are going to be rendered. Apart from this, you can use your custom class and create your own renderer to specify how an input text box can be rendered as a component. If you're using browser, of course, it's going to be HTML. But if you're using some other client view, you may plan them to be rendered totally differently. You can customize the appearance of the components on the browser or on some other client.

So since, in the web application, we will use the client as a browser, and we need components to be rendered as HTML so that we can see them on the browser. That is the default renderer available.

Render kit is the kit that contains some classes mapped to component tags for a particular client. And the render kit here in JSF implementations, which is available to you, is for HTML client. Means for browser or any client that can help you to view HTML. That is what default renderer kit we have here. It's a set of Java classes which are mapped to component tags for a particular client.

As I said earlier, if you want, you can create your own renderer classes and define how those components can be rendered totally different way, like in Swing way for Java SE applications. You can do that. And that's the concept they use later to create JSF components and let you render them for mobile applications, for desktop applications as well.

So in ADF, Application Development Framework from Oracle, you're going to get multiple renderers, not only for web pages, for the browser as a client, but also for desktop applications. But here, you're just going to talk about the default renderer, and we'll render them, which is default, as HTML.

Introduction to Facelets. What is Facelets? The Facelets, it's the page that you're creating. Remember, when you're creating the page, you have to set up instructions over there written in XML. It looks like HTML. It's XML, actually. We're not going to type anything that we can type. We have to set up libraries that we have used to design our pages, our view technologies, and that's what we say Facelets.

That's here it says replacing JSP as JSF's default view technology. So when you use the JSF page, it is based on Facelets. Provides a way to declare JSF view using standard XHTML syntaxes.

Facelets are based on existing XHTML syntaxes. You can type HTML. You can type XML, XML-based syntaxes from the tag libraries to create text boxes, drop down boxes to have validations, conversion logic. And of course, they are extensible tag libraries. In case you want to create an extended version of the tag libraries, you can do that.

Features of Facelets. We will see XHTML for the building pages. Syntaxes is for XHTML. Multiple tag libraries are available to you, not only for HTML purpose, but we have JSF core libraries that can help you to bring validations onto the pages, conversion logic onto the pages. And of course, you can specify HTML renderer kit tag libraries, which is default in the case of JSF. They all are the subset of JSTL tag libraries.

Remember that for binding purpose, when a component is going to be bound with the Java classes, which we say managed bean, we use EL. That is unified EL compile time. EL validation is also available to you.

With the help of tag libraries, you can not only prepare your page, but also create a template for the page to have a consistent look and feel across multiple pages. In this case, you can pass JSF data to be included on the pages.

We have here an option for creating composite components. Composite component means that if, let's say here, if I want to create a login. So I can have a text box with a username, with a password, sign in. And of course, we can have a hyperlink as well to say in case you forget the password or username. We can have a hyperlink.

If you want to reuse this component on other pages or in different applications, you have to retype the code. What we can do is we can create a composite component. And we can have all those things here included in this composite component-- username, password, all those labels, you can do it. And then give a new name to this composite component, like login.

And later, on other pages, whichever page you'd like to have a login component, you straightaway use a component saying login. Whenever you say login, it is going to bring the entire set of components together at the place of login. You do not have to retype. So that's what the composite components, that simplified model for creating reusable custom components.

See the example of a Facelet. Facelet example. As well, you start with a JSF page. Remember here that we must have tag libraries included. There are several tag libraries available, which we will see one by one. Java.sun.com/jsf/html contains HTML-related tags from the JSF which you can use, like h form, h command button, output text, input text, drop down list box, image boxes, data table for designing the pages.

The advantage of this is that they have the binding capabilities. Since they are server side components, they can easily communicate with any other the Java classes which are there in the server, which is managed bean. So your data that you submit will be submitted to the managed bean. And the managed bean, in action processing logic, you can decide what you want to do with this data, whether you want to perform any manipulations, any calculations. You can do that.

You'd like to delegate the task to EJB business logic. You can do it from the managed bean. So that's going to be the benefit.

JSF page evaluations. Remember when I explained the life cycle to you, I said that when you make a first request from the browser, it is going to be a GET request. So that's what they say first requested for a JSF page, it is going to create a structure of the UI components, which we say component tree structures.

Each JSF tag identifies as a component. Your Faces servelet is responsible for identifying each JSF tag that you have in the page. And since they are Java classes in the background, the respective Java classes, or the tag handle classes, will be used. And they will be instantiated, and it will create tree structures for those tags.

Non-JSF content is passed through the renderer. If you have any non-JSF content, like HTML, which will not be part of the component tree structure. Since they're not a part of component tree structure, they will not participate in runtime processing, and they're straightaway going to be passed through the renderer. Means be the part of response.

When the form is posted back, the next time when you have the form on the browser and you click on the Submit button, it is going to initiate a POST request. And the POST request was received by the server, a JSF servelet, which is Faces servelet, will start restoring the view and will continue inspecting the request parameter.

All the data that you submit is going to be part of an HTTP request parameter. It will inspect each and every component for the request parameter, read those values, and apply those values on the component state, which will further be validated, updated in the model. And then you go for invoke applications, and later render response.

There are tag libraries available that you can use. Right now, we started with java.sun.com/jst/html for HTML tag related components, server side components. We have JSF core tag libraries as well. This is the tag preface that we use normally, representing core library, UI representing Facelets tag libraries. C is for JSTL core libraries. FN is for JSTL functions libraries. And the composite is for JSF composite libraries, helpful for creating composite components.

Quiz. To separate the look and feel of a component from its implementation, you must use the faces-config.xml configuration files, define the component by using a properties file, implement a renderer, or use a style sheet. To separate the look and feel of a component from its implementations. Default implementation is for HTML. If you want to modify the look and feel which is provided by the components, you can implement a renderer.

Using HTML tags. A lot of HTML tags available in JSF are input. All the input related, input that takes input from the end user-- text boxes, checkboxes-- they start with the input tag. All the tags which are responsible for displaying some data, they start with either output or graphicImage. GraphicImage, you specify the image name, and that will be shown on the pages.

CommandButton and the commandLink are the same thing. The only difference that commandButton looks like button. CommandLink looks like a hyperlink, a link on the page. But their job is to submit the form.

To initiate a GET request from the browser, you can use button. Simple button. It is not going to be useful for submitting the form. Link is a hyperlink. OutputLink, again, for the hyperlink.

Selection. Checkbox, listbox, menu, and radio are selection components. HTML pages. On the top, we can have head, body, form, outputStylesheet, outputScript. If you have JavaScript with you, you'd like to use it, you can import the scripting and make them a part of response that goes to the browser. You can use outputScript. OutputStylesheet. If you want to use a style sheet CSS file, you can use outputStylesheet components.

Layout. We do not have much layout components here. We just have panelGrid and panelGroup that can be useful to give you the grid-based layout or to help you to group the set of components.

DataTable. If you want to show multiple records in tabular format, you can take the help of dataTable. In dataTable, you will create multiple columns using column tag. And for the messaging, simple message can be error message or can be developer generated messages, you can take the help of message tag or messages tag.

HTML renderer kit tag library, that's the default one. Kit. When you say kit, that means it is a collection of renderer classes, which is used by the UI components. All the UI components are using HTML render kit tag libraries that's helping UI components to be rendered in the form of HTML back to the browser.

We have several attributes which are common to each and every component, like id, immediate, rendered, style and styleClass, value, binding. Id is optional. As I said, if you want, you can specify the unique ID to your components that you can use to refer in JavaScripting or for any other purpose. We will see that later on.

And immediate is the properties that we can use to say it is true or false. By default, it is false. And it is useful at the time of Apply Request Values phase to let events be processed just after Apply Request Values phase. So that's why they say UI input and the command component to force the evaluations to occur during Apply Request Values phase. We will see that with upcoming chapter, how it is going to be useful.

Rendered is the properties. It's by default true. When you make it false, the components will not be rendered on the browser. That means those components where rendered property is false will not be part of the response.

Style and styleClasses. You can use CSS style and style class name to get a different look and feel-- different colors, text color, background, images. You can use that.

Value is there in UIOutput. UIOutput, of course, and input as well, it is useful to bind the data that you'd like to display with the UIOutput, or you'd like to have in UIInput. Binding is the attribute that can be useful to bind the data to the bean properties. But in this case, bean property is going to be the handler class properties.

This means that here, if I say h input text, say value equal to something. We have a Java bean, a data source, class, let's say my bean. It has a property, let's say a string name, private string name. And let's say I'm going to have here one property which is a type of components, private UIInput, for example, give some name like this, text name. Let's say [INAUDIBLE].

Of course, you're going to have setter and getter for all of them. Setname, getname set txtN, get txtN. Setter and getter will be there, which will make them properties.

The value binding will be with a value type, like name. You'll say here, my bean EL lower camel case name. But the binding is always going to be with component type. Input text binding will be UI input type, or the type that belongs to input text. I can say here #MyBean.txtN.

Binding is for that purpose. This is useful to hold the reference of the component tree structure. Remember the time of create view, restore view, you have a component tree structure created? So page, this structure will be created.

And one of the components that represents input text in the hierarchy, that particular component reference-- let's say this is the component UI input. And this reference you want to maintain it in the managed bean somewhere, you can do like this. So that at the time moment this generates the component tree structure, the reference of the object will be stored in your managed bean object in this txtN. In the case of programming, you can refer to that particular component. That's what the binding.

Now, when you're creating forms in JSF pages, what you have to do is you have to start with h form, have your label. If you're not reading the label from any properties, just type a little over there. Have a text box and go for the value binding.

There's no need to go for binding attribute. You go for binding attributes when you have to hold the reference of the components to refer them somewhere in the programming. At the time of action processing, at a time of event processing, you'd like to refer to the particular component object and go for some manipulations, you go for binding. Otherwise, not needed.

Value binding with the properties of the managed bean. Like here, they say username and password of action login, value equal to login. Right now, the command button will show you the name login and action equal to login. That means when you click on the button, it will start the processing. At the time of render response, the page that will be rendered, that will be login page.

HTML output. This is going to be the response. This page, once a response is generated back to the browser, if you see the browser source code, you'll find the code is generated like this. If you remember what I said, that it's not necessary for you to specify ID until you'd like to refer them later in the programming of the scripting.

So if you're not specifying any ID name to those components, an ID will automatically be assigned by the JSF runtime, and that will be used at the time of render response. So response is generated. See that?

HTML form has the ID, some ID. We don't know what it's going to be. It is assigned a unique ID that's going to be ID. That's going to be name. See username? Input type equal to text. That also has the ID.

If you see this ID, the input type text ID. It is using the form name first. See? Form name colon input type name. You know why? Because at the time of processing, they were arranged in the component tree hierarchy, and a text box is the sub-component of your form. It's a part of the form.

Password. Input type password. ID name, and this is the form name. So form name and the component ID name is going to be a unique name.

Submit button, input type submit. It's a name that belongs to one form, this form. So you have the form which was generated, and the component tree structure, UI form. And under that, you have what? You have a text box for username, you have a text box for password, and you have a submit button with the part of UI form. So here, this is the hierarchy that you have.

ViewState. See, the ViewState, it holds some value, which is, of course, encrypted here. This value is useful to restore the view object next time when you revisit the same page. First time, it's going to create the entire page structures, component tree structures, which we say create view. Next time when you submit the POST [INAUDIBLE] request or you revisit the page, it is going to use the ViewState value to restore the page structures.

Using text components. The components that can help you to edit the data, take the data from the user, user input, UI input, and the UI output, which can help you to display the data. So see the input components available to you-- inputHidden, inputSecret, inputText, inputTextArea. And for the output components, where you want to display some data back to the browser without any input capability, you can have outputLabel, outputLink, outputFormat, outputText.

InputText. Give the name, value equal to value binding with the managed bean. Remember, when it's submitted, it will call setter. When it displays the page, it will call getter.

InputSecret redisplay equal to false, value equal to user password. This is the password type of text box inputSecret That means when you type something, it will show you asterisk, asterisk, asterisk.

But when you redisplay the page, right click and go to the source code, you can see what value was entered. Just to avoid that, you say redisplay equal to false, which prevents the password from being displayed in a query string or in the source file of a resulting HTML page. [INAUDIBLE].

Several other attributes which are available to you, like converter, converter messages. Converter can be used to specify the Java classes that you'd like to use to have a converter logic.

Required is the attribute in the component. If it is true, it is going to make components required. Means mandatory for you to have some value entered. If you do not enter any values, it is going to give you error message. What message? You can use requiredMessage is to specify the error message.

Validators, you can specify validator classes. If you want to create custom validator class, you will use this attribute to specify your custom validator class. And the error message you can specify here in validatorMessage.

ValueChangeListener is, again, an attribute that can be helpful to handle the value change event. Java classes or the method that you'd like to be executed at the time of value change event, you may type it in a managed bean, or you can create a separate Java class for that purpose.

D-I-R is a unique property of input components which allow you to specify the direction of the text to be displayed. Remember, in some of the languages, we start typing from the right hand side, like Arabic. We type from the right hand side, right to left. And normally, we see left to right. So that's going to be default, left to right.

But if you want to change direction, you can use D-I-R DNA equal to-- what you need to type here. It can be LTR. By default, LTR, Left To Right. RTL, Right To Left. That's what you can type.

Label. That specifies a name to be used in error messaging. This label is not for the caption, not for labeling. It is just a name that you can specify in the error messaging. When a default error message is displayed, it's displayed with the component name.

In case you're not specifying any name, it will show you some name like component j_idt7:j_idt11 has some error. Just to avoid this, you'd better type some label. So label equal to name. Then you say name in the error message.

Lang. It just specifies the code for the language used in rendered markup. Output text value equal to username. See the binding, EL binding with user properties. When the page is rendered, it is going to call user.getName. Whatever is stored in the bean properties will be displayed here.

When you use outputLabel, outputLabel tag is used to attach a label to a specified field for accessibility purpose. The output text, and here, it is displaying something. You want a label to be attached with this component. Use outputLabel before, and specify the name of the component with which you want this label to be attached.

So this is actually a name of some components. This is the name of some components. Probably going to have, say, h input text, just for the example, and it has an ID equal to fanClub, and the value equal to something. Now, what you did here in this case, you have associated this label, whatever you have typed here, for this component, input text ID. That's what outputLabel for means.

For creating link, outputLink. OutputLink is useful to render hyperlink. Type here the value, and then type here documentation for this. Here they say demo, but here you can type the link that you'd like to go to. Javadoc. Here, you can type http:docs.oracle.com, like that. This value will be shown on the browser.

OutputFormat. It is the value that you type in here. They say here message msg.dvd.count. We have not introduced the source bundle right now. Just understand that this is msg.dvd.count means what? Let's say this is displaying something like-- this example of a resource bundle.

So we have a resource bundle file, a properties file. We can give this name to message.properties, for example. And this property has a key value dvd_count equal to something they have typed. Let's say total number of DVDs is-- and they here say some placeholder. 01. Whatever you want you can type.

So what they are doing here, they say that in case you have this type of properties file where you have stored some information and you have the placeholder, and you want to determine the value of this at the runtime it is not going to be static. Runtime processing will decide how many DVDs are there in your database, in a table, in the memory, wherever the DVD information is stored.

They say, let this DVD, DVD count generate the value of the DVD count. So this is calling dvd.getdvdcount, which in fact returns some value, maybe five, maybe 10. It this returns 10, this 10 is going to be used here.

Msg.dvd.count says total number of DVDs. And f param will do what? Will replace this parameter. This is going to be the parameter. This parameter will be replaced with this value, with this value here.

So in fact, you will see total number of DVDs is 10. So for that purpose, we use outputFormat, and we will use that later on. The concept is going to be a little more clear when we start actually implementing this concept. So just have this introduction part noted down somewhere. And we will revisit this information and implement them on the pages.

Command component. UI command components. We have commandButton, commandLink. They are for the same purpose, for submitting your form. They have the same set of attributes, like action and action listener. Action is to specify the action processing logic, which we say action method. Action listener is actually for the action event handling.

Remember, this is all going to be processed at the time of invoke applications. If you remember my diagram first, I said that before action processing, if there's any event, they will be processed first. So very fields value change event, if it exists, then action event if it exists. And then, at the last, action method will be executed.

Action is the attribute which will have the name of the page that you'd like to navigate to or will have the binding with the managed bean properties. There you have the action processing logic to be invoked.

Action listener is the attribute where you can specify the method which will be used to handle events. And the event handling will be processed first, then action. And these attributes are the same in commandButton, commandLink. Only difference that here, the renderer renders the component like hyperlink. And here, in commandButton, the renderer renders the component as a button.

CommandButton value. Value you can type it here. If you want to read it from the properties, you can. You want to read it from resource bundle, which is the message.properties, you can. And here, you can specify action.

See commandLink action. You're going to specify the name of the page that you'd like to go to, or you can specify the method that you'd like to call containing action processing logic. And with the action listener, you can specify the name of the method that you'd like to call once the button is clicked. Action event. So this in this case, it will process action event first and then go for action processing.

Graphic image is another component in your HTML tag libraries which will help you to display images on the pages. You have the image. It's a part of your web application. You can specify the URL. [INAUDIBLE] URL to the image, and you will be able to display them. Alt is just going to show you some description about the image when you hover your mouse pointer on the image.

We have selection components over here. Selection companies like Boolean check box, select one menu, select items. We can have Boolean check boxes. See here, the binding. When I say binding, that means they have done the binding of these component with the managed bean properties, which is the same type of Boolean check box. You could do to hold the component reference somewhere in the managed bean.

Selecting an item from the list. This will give you a drop down list box. We have multiple items here-- item one, item two, item three. The item, the information that you see here, it will be from label. When you select the item, the item which will be submitted, it will be from item value.

For better understanding. If you remember HTML, it is going to be like this. Select. Under Select, you have here option. Option, value equal to something, and then you have here specified some text, and then you close option. And then you have option again, value equal to something else, some other text, and then you close option.

Like that, you create a drop down list box in HTML. After all, this also needs to be translated into HTML.

Now, what we have it here, it is that one. What you have it here in this item label, it is going to be here. So when you see the drop down list box on the screen, and you click here this options, you're going to have here the list available.

In the list, what you see? It says the label, text, text, multiple-- text one, text two. And when you select the text, select something, submit, what you have the value that is actually submitted. So this is what the value.

The value which will be submitted needs to be bound with the managed bean property so that it can be stored in the managed bean object that you can do it here in this value attribute of selectOneMenu.

We have selectManyCheckboxes. Multiple select items you can have it here if you want. It will show you checkboxes-- checkbox one, checkbox two, checkbox three-- and your selection is going to be a part of this. That's going to be-- look here. See, selectOneMenu id genre value dvd.genre. SelectItem value dvd.genreList.

See that here, action, it is showing you some list. And this list, we're getting it from the managed bean properties. It is calling dvd.getGenreList and that returns the collection. Maybe an array list type or array type. It's a collection type containing multiple list values, which you see here.

On your choice, when you select something and submit, the selected value will be used here and be assigned into dvd.genre. Properties.setGenre is going to call on submissions. A selected value will be assigned here.

UIPanel component. Panel components, we do not have much layout components here in JSF. PanelGrid column 2. It gives two columns. And the first column, that is for alignment purpose. The first column is going to be these two. The second column is going to be this one.

This is one row. Why is it a row? Because here they use P. Second row. Two columns. Column one, username, password. Column two, your text boxes. It's going to be in the panelGrid. It's a column 2.

You can also specify row equal to something. So if you do this, you will see a proper alignment for the username and password and for the components. You can use panelGroup group if you would like to set the components up under one parent, one group.

JSF core tag libraries. So a lot of things that we can do here. For the pages components, we can have event handling, data validations, data conversion, and user interface localization that we can do with the help of resource bundle.

There are several tags available that you will be able to use with the components-- validator tags, localization tag, parameter substitution tag, data conversion tag. And with upcoming chapter, we're going to have a look on each one of them.

Param name equal to country, value Australia. It is useful to pass a parameter to a component. To pass an attribute value to a component or a parameter to a component via an action listener. F attribute name, username value equal to Joe.

SetPropertyActionListener is the component that can be useful to set a value into the property of the managed bean directly. Sometimes, some of the values which you'd like to be part of a managed bean, get it associated with the managed bean. Some little value. What you can do, you can use setPropertyActionListener.

Generally, what happens that you have the binding of the managed bean properties with input components. So when you type, hit Enter, those values are going to be part of the managed bean at the time of update model. But how about any little, any specific information, hidden information, or any other information which is not the part of JSF HTML components? Maybe pure HTML components. They're not going to participate in JSF runtime processing.

You can take the help of setPropertyActionListener, and the value that you'd like to get it associated with the managed bean, you can specify it here. We will see them in the chapter where we discuss HTML5, and see how HTML5 components can be used to accept the input from the user, and their values can be associated with the managed bean.

Remember, HTML5 components are HTML actually. They're not from the JSF API. They're not the server side component. Thus, they are not going to be processed at the runtime. They're not going to be part of JSF life cycle. And the whole components are going to be attached at the time of render response.

So there's no update model. There's no validation. There's no invoke applications, create view. Nothing is going to happen with the HTML components. But their values, which you gather from the user on the browser, can also be part of managed bean with the help of setPropertyActionListener.

As I said, you can also take the help of JSTL tag libraries. You have to use if else statement, for each, looping, catch, switch cases, like we have here options, otherwise, when, choose. You can use JSTL core libraries with these Facelets.

There are JSTL functions available for [INAUDIBLE] to find whether a string contains some value-- IgnoreCase, contains, endsWith, length, substring. For all string manipulation related functions, you can use it in the JSF pages with the help of JSTL function tag libraries.

Finally, we have the quiz here. The quiz says, identify one good use of h inputSecret tag. Remember, this is for the password. So to prevent the echoing of a character, to determine whether the text entered is valid, to prevent unauthorized access, or for the password validation. For what purpose you're going to use this? To prevent unauthorized access.

So that's all about the summary. All the answers for these quizzes are available to you in your Student Guide. If you read the Student Guide, at the bottom, you have the answers for these quizzes as well.

Just go through with this. If you find any questions, we're always there. And you can reach us with given options in the TOD. And we will help you to clarify any doubt, any issues that you may have with this lecture or with any practices.

So that's all about this chapter. And we will do the practices. We have a practice here, using an IDE to develop JSF project, adding JSF pages to the project, and designing the login page, login.xhtml. So next, we will see how to do the practices.

## Activity03 - 20m

All right. Now we will continue with practice 3. Practice 3, we're going to start with NetBean IDE to develop JSF projects. We'll see how to add JSF pages to projects, and design the login page, login.xhtml.

All right. So that's what again, go back to your remote desktop, a lab environment, and see that the practice 3, where we're going to start creating our web applications, JSF pages, and designing login page.

3.1, Creating DVD Library Applications. So throughout the Chapter 3 to the end, you will be working with a practice DVD library. So make sure that before you continue with the practice 4, you should have completed practice 3. In case you have not completed practice 3, and you want to continue with practice 4, you need to take the help of the solutions.

All those practice solutions are available to you here in this Lab folder. Go to Lab folder, d drive, Lab. You'll find practice folder. Go to practice 3. There you have Solutions. And Solutions contains the solution for the practices that we're going to do. So you can also take the help of the solution in case you need some assistance.

Now we will continue practice 1, 3.1, creating our DVD library applications. And here what they want you to see this time, they say enable context and dependency injections CDI. We have the time later in this course to discuss CDI in details.

But for the time being, you just select this, and continue with the practice. So what they want, you to create a new project. DVD Library is going to be the name. And you can store them to the practice 3 folder under Practices. Or you want somewhere else to store, you can.

As well you have to select appropriate framework, JSF framework, and then we're going to get a start with the practice. See, I'm going to do it here, File, New Projects, and Save Web Applications. And the name, what [INAUDIBLE] says to say DVD Library.

Folder that you like to select, you can go to your Chapter 3, Practice is the folder, Practices and say Next. Don't forget to enable context and dependency injections. Say Next. JSF that you have to use as a framework, and Say Finish.

Your application is now started. index.xhtml is a default page. And there's no source packages available. WEB-INF, you see that, now we will have beans.xml because of CDI is enabled in this practice. Web.xml, if you see that here, all those appropriate configurations for JSF FacesServlet is actually done.

Default page is going to be index.xhtml. That's for the URL, which will be used to intercept the request, and have the FacesServlet to be used as a controller for this request.

Now what we will do say create new JSF page named login.xhtml and complete the following the steps. But before that, see everything we have done. We have verified the project window index.xhtml opens in the [INAUDIBLE]. Yes. And now we can create a new login.xhtml.

As well like you did earlier, go back to web page, right-click, New, JSF Page, see this time you do not need to go to Other. You can go to Other and say Web and say JSF Page. But since we already did this earlier, this JSF page is actually available here on the top. You can use that. Give the name login.xhtml and Facelets [INAUDIBLE].

A login page is created now. Go to the next, right-click DVD Library in the Projects window, and select New Other. We already did that. And we created here JSF page login.xhtml. Build the application. Deploy the applications and test. Check it that the page that you have created, it actually works or not.

So right-click, build the applications, and deploy it. Once deployment is done, you can open up a browser, any of the browsers that you like to. And try here typing the given URL, just to verify whether everything works fine or not.

http, local host, give the name DVD Library. That is your, a web context URL. Hit Enter. It is opening your index.xhtml. Just verify Hello from facelets was the message in index.xhtml? Yes or no? Yes. All right. Facelet title, login.xhtml and index.xhtml, see? The same thing.

And now they say you can type this way or login.xhtml. Just check whether everything was fine or not. Just to make sure the page is open, if you want, you can type something here. Hello from login, and login.xhtml. You can type your hello from login just to verify that it is showing you the login page. Save it, it will automatically redeploy it, and try here all those test URLs, you can try faces-index.xhtml. That is going to be the same. And then you can type your login.xhtml, hello from login. So that works fine.

That's what about the practice 1. We will continue with the practice 3.2, the same application you have to use and continue with the practice. In the same applications, they say index.xhtml, you open it. Have index.xhtml look like this. DVD Library Home. Welcome to DVD Library Application Guest. And some command link.

So the title DVD Library applications, I can type this, and I can go back to your index.xhtml. And here I can say title for this. So just to me to type DVD Library Applications.

The next what they say, have this header 2, label 2 heading up to the body of the page, they say. So go back to DVD Library once again. And here in the body of the page, you can say DVD Library Home.

Next within the form add four command link elements. And separate the first three elements from the last with a line break. Line break that means you can use BR or you can use paragraph. That's OK. Horizontal ruler, HTML components, you can use to have ruler.

So they want you to create a form, have a command link. Just here give some name, display my DVD Library, add DVD to my collection, Set User Preferences, and the Login. I can go and type it.

Form, and what you can do here, you can have command link, and to say h, Command Link, multiple command link, they want you to have it here. They want command link 1, 2, 3, 4. We can have it. I can just copy paste it three more times. 2, 3, 4.

They say have a paragraph. Just do Create a New Line. And here what they say it should have a horizontal ruler, HR, we can have it there. Open and Close. All right. The Command link Open and Close. Close them. And this closing tag I can copy/paste with each one.

Right now it's giving me and error, because it's already closed. I just remove it. And between what we have to type, we need to type this information. That will be displayed as a hyperlink on the page, when it's displayed on the browser. Display my DVD Library, that's going to be here.

Next one, they say add a DVD to my collection. It is going to be at this place. And here set user preferences. That's going to be here at this place. And login, here after ruler, and then command link is going to be login.

Same thing [INAUDIBLE] and rebuild it, and deploy it, and check how your login page looks like. We will see the next how to design the login page, login.xhtml. Right now if you see that and this, this just says save it and check it. So we can go to Save it. Build, you can say Build, can say Clean and Build. Because it's already built first time. And now you can deploy it.

You already have made a request earlier. You can just refresh, and see how your index.xhtml page is going to look like. So I'll just make a request to index.xhtml you can just say DVD Library. Because that is your default page. And see now.

But if you click it here, it's not going to do anything. Because we have not specified action. You can right-click, and if you want to give a look to a source, see that. You're getting here multiple [INAUDIBLE]. Where reference is missing. We have not specified which page to go to. And if you click right now it is going to display the same page.

Now we will continue with practice 3.3. And we'll spend the time in designing login.xhtml. Login.xhtml should look like this, should have two text boxes, one for username on for password, Login button. And for that you can start designing in login.xhtml. As well the title to be updated. Go back to your applications, login.xhtml here update the title.

I'll just copy it, and paste it here. And the body part, I'm just going to remove this, and have some other information. Answer this in the activity guide, adding 2, and the body, and what else? They're saying have here form, and then the panel grid, with the column attribute too.

So have a form, open and close. Under that, have a panel grid. You will find it here. It's under p, for panel grid, a space. List of the properties, you can select Column, Columns. And they say 2, type in here 2. Close it. And then under that you can type the username text box, password text box, Command Button text box.

We can type this. I can go to here and type all those things, username, text box, password, text box, and the Command button. But it's always good practice to have proper indentations. And now see that you have here user name and [INAUDIBLE], this is for the password, and here the Command button for the login.

Save the login.xhtml. You can build and run the applications. Or you can use this URL directly to check how your page is going to look like. [AUDIO OUT] to rebuild every time, because Netbean is always going to redeploy. It is using incremental deployment approach whenever you make changes, if the application is already deployed on the server, it will perform redeployment.

In case if it is not showing you the updated value, updated content, you make sure to Clean and Build, deploy and then run it. So I'm just going to refresh the index.xhtml. And then let's go to login.xhtml. Because so far we had not linked this hyperlink to the login page.

So we type here login.xhtml. See now we're getting the page containing DVD Library Login, heading 2, username, password, see they are properly aligned, alignment, see that? Because of panel grid and the Login button.

So that's what they wanted you to have it here for the login page, and test it. Go to the next page and see what, there's nothing, so we are done with the Practice 3.3.
