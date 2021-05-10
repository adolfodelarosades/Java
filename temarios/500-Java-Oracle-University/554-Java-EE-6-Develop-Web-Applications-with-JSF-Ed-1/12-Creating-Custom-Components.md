# 12: Creating Custom Components

   * Creating Custom Components - 44m
   * Activity 38 - 14m

## Creating Custom Components - 44m

 
Welcome back. We're going to start with the Chapter 12, Creating Custom Components. So we now reaching to this point here and extending JSF section. In this chapter, we will see how to use or when to use custom components. We will talk about when to use custom renderer. And we're going to list the steps for creating custom components.

Topic to be discussed here-- why do we need custom components, elements of custom components, implementing custom components, when to use custom renderer, custom components elements, behavioral interfaces, working with encoding and decoding, and configuring custom components, and using an external renderer.

Why do we need custom components? Whenever you have to add some new behavior in any of the existing components, you need to create custom components. All right? So to add the new behavior. To render components to non-HTML client, you also need custom components. When you do not need custom components-- when you have to manipulate data at application-specific functionalities. We're not going to create custom components for this purpose.

For aggregating components, we have composite components. So custom components are not for that purpose. For convert data, validate data, handle events. For all those logic, you have to create conversion logic, like custom converter, custom validator. All right?

You have several events that you can handle. So for that, we do not need to have custom components. Have custom components when you have to add some new functionalities in existing components or you'd like to have totally new components created to be rendered in HTML format or to any other non-HTML client. OK?

Elements are custom components. You know that all the UI components here in JSF, they are the subclass of UIComponent. All right? UIComponentBase actually extends from UIComponentBase. So you can create a class extends from UIComponent. All right? Or we can take the help of any existing UIComponent classes that you can extend and add some new functionalities or modify existing behavior. All right?

TLD file that declares the custom tag. When creating new custom components, you have to declare tag library descriptor file. All right? There's a simple Tag Library Descriptor file, which will help you to type a tag and have the tag to be mapped to the component class, which will be used like tag handler. All right? JSF pages that uses the custom tag. So on the page, you're going to use the custom tag, where you have to import tag libraries and then start using custom tag.

Creating custom component classes. So I have a class. You can have the state behavior defined in the class, or you can extend them from existing classes. States are the component state, which hold the component values, state values. For example, minimum value, maximum value, or the current value of any of the components.

Remember, when it say UI Input, you type [? etch ?] Column Input Text. Set value equal to something. In fact, in the Java handler class, tag handler class for the text box, we have a value attribute. Means we have a field member which hold the value in the component object. All right?

So see the validator classes, that you have it validate long-range, [? the other ?] tag. But behind that, we have a tag handler class. We specify minimum, maximum values, which, in fact, cannot be maintained within the component state.

Behavior to support is about encoding and decoding, saving a state of components, updating bean values with local values, processing validations on the local values, and queuing events. All right? They can be the behavior to be supported by the components.

Implementing custom components. And see here, we're going to see how to encode and decode the components. So if you're creating custom components, you have to implement these two operations for encoding and decoding. In decoding, we're just going to convert the incoming request parameters to the local value of the components. All right? In the case of encoding, we're just going to convert the current local values of the components into the corresponding markup that represents it in the response. All right?

Remember, at a time of render response, your component, which is the part of Create View or Restore View phase, what generated that time needs to be translated back to the HTML, so I can say, encoding it would just-- the process where you can convert the current local values of the components into the corresponding markup that represents it in the response. OK?

Implementing custom components. Two options for implementing-- encoding and decoding. You can have direct implementations, or you can delegate implementation to the renderer. Custom components can itself implement encoding and decoding logic.

Within the custom components, when creating a class, a extends some custom components, some existing components, say, UIInput, or UIComponentBase class, for example, you can override encode and decode methods. And you can write the logic out there. And you could decide how you want to perform encoding and decoding. That's done by the component itself.

The second one-- that you can take the help of the renderer. And the component class can delegate the implementation of encoding and decoding to a separate class, which we say, renderer class. So an object of the renderer class can be used to help components to perform encoding and decoding. OK?

When to use custom renderer. When you want to create a component class and you're not going to be sure that how it is going to be rendered to the HTML client or to the [? swing ?] client-- I mean, Java [? SC ?] client. All right? And let that be decided by using renderer. So we're just going to have component classes. And that can delegate encoding and decoding to a separate renderer. All right? And with this help, what it can do, you can have a [? supports ?] for the multiple clients for that particular component.

So same component can be rendered differently on the web browser and with a different look and feel on the cellphone. So to associate the components with different renderers so that you can represent the component different ways on the pages, that is also possible. Have multiple renderers on the same page. You can represent the same components in a different way. All right?

Or to say, if it do not want to plan to render particular components in different ways, it is simpler to let the component class handle the rendering. If you have no plan to go for multiple renderers or you do not want components to be rendered on varieties of client, you can let the components implement encoding and decoding logic. OK?

Step to create components. The first is the create custom component class. Delegate the rendering to a renderer. Tag Library Descriptor file. And configure the custom components.

We have here one example for demonstration, which, in fact, it's showing you two buttons, right? Less than, greater than. Less than, greater than. They are not two button, actually. They are one component. This is a spinner component which has the text box, less than, greater than type of buttons. When you use the spinner components, when I click on this options, greater than symbol, it is going to increase the number.

When I click on the less than symbol, it is going to decrease the number. And it's going to specify the current value to start with. Right? But this component, which is, in fact, one component, can be used for variety of purpose. Like, you can use it to enter the age, to enter the year. So that's what the spinner.

To create the spinner class, have a class, simple class, and go for extensions. But behavioral interfaces like ActionSource, ValueHolder, component can fire an action event. A component can fire action events, like in the case of UICommand. A ValueHolder, a component maintains local values, like UIInput, UIOutput. They maintains local value. So these are two of the behavioral interfaces that you can implement it. Say ValueHolder, class [? A ?] extends UIComponent implements ValueHolder just to maintain the local values and action behavioral purpose.

EditableValueHolder that extends ValueHolder. In this editable ValueHolder, you get additional features for editable components that support validations and value change event. So if you're planning to have components that supports validations and can trigger a value change event, take the help of EditableValueHolder interface.

NamingContainer component has a unique ID. StateHolder component has a state that must be saved between requests. UIComponent, UIOutput, UIComponentBase, UIInput. They save the state. So the next time when you revisit, it is going to hold the component state values.

Working with encoding. Remember, the encoding method is what it converts current local values of a component into corresponding markup that represents it in the response. So in the encoding method, we can write those code. We can have several method, like encodeBegin, encodeChildren, and encodeEnd that we can use to define how my markup is going to be rendered for that particular components.

So during Render Response phase, the JavaServer faces implement process for encoding method. Our representation for that particular components in HTML or, in particular, markup can be rendered to the client.

Or you can use some renderer. All right? You have the options to delegate the task to renderer class, so that you can get the option how components can be rendered in varieties of way for multiple clients, for mobile clients, for desktop clients, for web clients.

Or maybe you can have multiple renderers, so that same components can be rendered different way on the same page or different page, right? I'm just going to show you this example and explain you with the NetBean on the practice environment, so that you can better understand what's actually going on over there [? can't. ?]

We will also see working with decoding. Decoding is used for processing request value. Remember, decoding the [? timer, ?] when you make your first request and it's going to create a view. Or you have a post-back request and it is going to [? resturb ?] you. It has to intercept the request, find those parameter values, and put those parameter values into the component state.

So during the Apply Request Values phase, the decode method of all the components in the tree are called, because Java [? does ?] to extract a component's local value from the request parameter and convert the value to a type that is acceptable to the component class. OK? And that's what the example that they have it here for decoding.

As I said, right now I'm just going to show you the program. And with the program, I will explain encode and decode example. OK? All right. Good.

So let's go back to NetBean. And see there. We have example here a spinner that you can find it in the Lab folder for this chapter. The spinner example, I have index.html. index.html does say, please enter your credit card expiration date. Right? Next what they say, the coreJSF spinner. This is your custom components. We will first see how the custom component's created. Then I'll come back to this. OK.

See that UI, spinner.java? That they extends from UIInput. UIInput input components. All those existing behavior of the UIInput class, which you see in input text box-- you see it in the checkboxes. You see it in drop-down list boxes. It's all going to be available in this UI spinner. So UIInput is super class. All right?

UI spinner, there they have two static final variables. Constant variables more equal to .more and less equal to .less.

When instance of the UI spinner is created-- and opposite of this is going to be created the first time when we make a request UI spinner. It is the constructor and constructed [INAUDIBLE] it is calling Set Converter. Set Converter. And here, what they're doing it, they're using new [INAUDIBLE] converter. This is useful to convert the submitted value into [INAUDIBLE].

Set renderer type. See, set converter, it is a method found in UIInput. Set converter. It is the same class, right? See this? .SetConverter.

UI spinner, because it is inherited methods from UIInput. This also inherited methods from UIInput. What we're saying it here, we are saying, set renderer type null. We're not going to use any renderer that was inherited, render logic that was inherited. We're not going to specify any external renderer classes. Or even we're not going to make any options here to specify renderer class. We said here, set renderer type null. That means the component renders itself.

Now, we have here Incurred Begin is the method, which, in fact, overridden from the UIInput.

We have to make the changes in the encoding process of UIInput, so that we can decide how this component is going to be encoded. It happens at a time of Render Response phase, right?

Encode Begin, we said-- we have this signature [? facelets ?] context parameter. With the help of this context, we get Response Writer. Context got Get Response Writer, that can be used to write the logic to decide how you want these components to be rendered. See now? The Obtain Here writer.

Now what they're saying, they're saying, Get Client ID Context. Calling methods, Get Client ID, which, in fact, the methods inherited from UIInput context. They're reading the component's ID. Remember, the component ID is going to be decided here when it specify the components. You have the option to specify the ID, right? If you're not, then a random number will get associated with this. Which was the ID that got associated with the components? That ID, I am reading it here. Get Client ID.

And now I'm going to say, Encode Input Field. Encode Input Field, it is your method. But then [? tapping ?] everything here in the Encode Being, they have created three different methods. This to separate the setup instructions and making them a part of group.

Encode Input Field and passing writer on the client ID to them. Encode Input Field is your method. While they are doing it here? They are specifying how you want those components to be rendered. See, the TypingWriter.start element. OK? Writer.start element.

If we open here a Notepad, Write.start element says that the time of render response, this component needs to be rendered, saying Input. Then this say, Writer.write attribute, attribute name. And the name attribute is going to be the attribute with the client ID. Right?

That depends on what is the client ID. Remember, the client ID is going to be the ID that you specify here. But at the runtime, the ID is going to be along with the spinner form-- I mean, the form name. Form name, colon, the component ID that is specified here. So it is going to be spinner form, colon, month, spinner. All right?

So which were the ID which is deleted from the context that is going to be here? Right? For the component. Something like here. I can see month spinner.

Now, that's what you said. Object V equal to Get Value. You're reading the Get Value at the time of when you have used these custom components on the pages, have you specified some default values this value called something. Any default value. Which were the default value that actually-- it's retrieved from CardExpirationDate.month. Which were the default value? Let's say it is going to be 1. Will be here. OK? This V is going to be 1, let's say, for example.

Let's check if V is not equal to null. If V is not equal to null, writer.write attribute value. Value is the attribute. And this value of this is going to be what? The value that you got it from Get Value.

Object size. GetAttribute.GetSize. In the UI spinner components, you're planning to have an attribute with the name Size. All right? Size. They're reading that value. It is reading that value. The first time we make a request for this page, it is going to continue with Create a View phase.

And from there, it will jump to Render Response. First time. The time of render response decide how this component, which is a [INAUDIBLE] index or an [? HTML ?], will be rendered back to the browser. At that time, it's called encoding. OK?

It's reading the value of the size, which is going to be 3. And they say, size equal to not null. If it's not null, the right attribute size equal to 3. And then say, [? writer.n ?] element. You can close the input.

So [? one ?] HTML that is going to be rendered to you, it's like this for this component. But that's not the end of the component encoding process. It's just a method in the Encode Begin, a method number one. Method number two says, Encode [? Document ?] button.

They can pass in writer and client ID, all those things. Encode [? Document ?] button. And in this method, what they're saying it, they're deciding what else they would like to see it here. Apart from the text box, they say, writer.start element. Once again, input type equal to Submit. See? Type equal to Submit.

Name is going to be equal to what? Name equal to-- what would the client ID that you have it plus .less. Let's say this is my client ID on the first case. For example, plus less. .less. This means .less. It's going to be concatenated. All right?

Now the value equal to-- [? write ?] attribute value equal to less than. All right? And then close this input. OK? That's not the end right now for the encoding.

Encoding says, encode Increment button. And Encode Increment button, what they say, they have written the logic to have one more Input type Submit name client ID mode. And value is equal to greater than. It is encoding. So I'm just going to have one more input type here. Submit. Name is going to be .more, because you have concatenated value of more. And here, the value is greater than. And then you close input.

When this all done, it is the encoding that it has completed the time of render response. OK? Let's run this. And see now. First is you have taken these components on [? in-depth ?] HTML two times. corejsf spinner, corejsf spinner two times.

But different ID is specified here. Just take the first example, which I, here, have demonstrated. But both time, it is going to call encoding. If you see that source code, you will find the same way that, see, spinner form, month spinner. That's encoded. Means it's render response. A spinner form, month spinner value equal to 1, size equal to 3.

The next line, Submit spinner form [INAUDIBLE] less. Value is less than. Here, it is same text format. And then input type. Submit name spinner format, month of spinner .more. Value greater than. OK? And same thing for the next spinner that you have for [INAUDIBLE] spinner? All right? Value and all those things for that purpose. So components are actually encoded, just like you type in the logic in the class. OK.

Now, what actually going to happen when you submit? I'm going to click here. It is going to increase the value. If I click here, it is going to decrease the value. But initial value, minimum value, see, you have used here two more attributes that you set minimum and a maximum. It's the built-in attributes in your spinner. You have made it built in, but you're using it here in your UI spinner the time of decoding.

So right now when I'm going to click this greater than symbol, this button, it is going to increase this value. What happened? It will generate a post-back request, send-- put type, submit. Post-back request. All right?

And then you have a life cycle begin. Restore view. Apply Value phase. Apply Value phase, the value, which is right now [? can ?] value 1, needs to be applied to the components. All right? It has to start decoding. So in decoding, what that did, they have returned the logic and the component decode methods to read, HTTP request parameter. So with the context.GetExternalContext, they obtain request Parameter Map.

That he is reading what is the client ID that's initiated the request and got associated with the context. This is what is the increment equal to something. By default, it's going to be [? 0, 1. ?] And here they say, If request map that contains key .clientID plus more.

Remember to identify that the requests were initiated by this one or that one. Remember, for the client ID for this, it's going to be client ID plus less, .less. Client ID plus more means .more. So that's what they're reading it here.

If the request map contains a client ID plus more, and Command equal to 1, that means you have click on this button. If this contains less, that means you click on this button that should [INAUDIBLE] the value. So that's why they say, minus 1. Else increment equal to [? 0, ?] that means you click somewhere else. OK?

Submitted value. What is the right now current value which was submitted? The reading [? A ?] from request Map.get. And they're specifying the client ID. You know, the client ID. Whatever you have [? tied ?] the client ID, you have read it here. It is for this text box.

Here on the page, you just type month and spinner. corejsf spinner is actually rendering three HTML components. This is going to be the name of your text box. And MonthSpinner.less is going to be the name of this button. And More is going to be the name of that greater than, right?

So this say here, client ID. Client ID. That means they're referring to this one, because in HTTP request, the value is submitted with the component's ID and name. So here it is Name, actually. So in HTTP request, they will find this name to see the value.

The value gets submitted with the name. This say, client ID to find the name in HTTP so that so that they can see what is the value which was submitted. In your case, they're going to see 1. And I'm going to click here. So that means increment is going to be 1.

Now, the value which was submitted, they will check the calling here, Get Incremented Value, passing here 1 an increment value 1. OK? Get Increment Value is the method here that they have it just to make sure that the value that you're going to increment, that is falling within the range specified in minimum and maximum. So minimum, 1; maximum, 12.

It say reading the attributes-- minimum value, maximum value specified. And then it is going to increment the value. Of course, it's going to be plus 1. Increment the value. It will become 2. And then they check if the 2 is within the range of minimum and maximum value. If yes, they return 2. If it is not within the range, in that case, they're just going to return the same value, same value without any changes.

So you will hear, see, the change value. You will get the change value here. And once you get the change value, they call Set submitted value plus new value. Components, value is going to be the new value. The component's state value will be changed to 2, which will go for validation if there's any. And then update model. OK.

And the same page is going to be rendered to you. See? 2, 3, 4, 5, 6. When I'm saying 10, 11, 12, again, I am saying something. It is not incrementing, because this time it is here. The logic here, it is not within that range of minimum and maximum. That's why it returns the submitted value, which, in fact, 12. And 12 gets applied. So you see here 12.

It's Apply Value phase. And every time it's rendering response. And with the renderer response, you see here the value is getting changed to 2, 3, 4, 5, 6. OK? So that's what the custom components.

Now you need to understand that if the custom component is created, what are the configuration that we need to do it, So that we can use it? OK. If I go back to this spinner, I have a custom components UISpinner.java with me. That's OK. But if you see in this other HTML, you're getting this spinner with the corejsf of prefix.

And this prefix is pointing you to http://corejsf.com. What is that? htpp://corejsf.com is the namespace URI, which is specified in the tag library. Remember that you must have a tag library created. Here they have created corejsf.taglib.xml file for custom components, a tag library you need to create it. In this tag library, you have to use tag elements.

And need to tell what tag the developer will type on the page to be mapped with the handle class. So in the tag library, you have the mapping. Like here, they say, index of HTML, they say, spinner is the tag. Spinner is the tag, all right? [? In ?] this spinner tag, see in the tag libraries. And from the tag library, they get to know what is the Java class that they have to instantiate, representing this tag. So here they have component type, conduct, corejsf.spinner. spinner.

Namespace that he specified. http://corejsf.com. You can type any namespace [? URL ?] that you'd like to. All right? All right, that is [? right ?] here.

And one more thing you need to do it. Just by using corejsf.taglib.xml, it is not going to be part of phase's context automatically. You need to go to web.xml. And in web.xml, for the servlet, remember that we have a Faces servlet.

Go to General here. And the context parameter, you have to use javaxfaces.facelets libraries. And you need to specify the path for this tag layer .XML file. This is what you need to include in context parameters, so that when you deploy these applications, this information will get [? resisted. ?] And they will read the information from corejsf.taglib.xml file. So this namespace, you will use it in index or the HTML.

And have some here named prefix. And that prefix you will use to refer to the tag, which, in fact, Java class. So that's for the example here.

And the tag [? about ?] taglib that you can create a taglib.xml file-- any name that you want to have it, but it must end with taglib.xml. So this say corejsf.taglib.xml. OK? And this TLD, it is just to let you tag with map with the handle class. And specify the namespace. And let this be loaded through your web.xml context initialization parameter. All right? That's what you need to do it. And the .xml.

Context initializing parameter. Specify the path to load that tag lib, using Facelets Libraries parameter name. All right?

So minimum and maximum is the value that you are free to type what you want. And depending on the value that you type, it will ensure that the value of corejsf of a spinner is always going to be within this range. OK?

You can type here namespace. And then you can use a spinner tag. If you're creating renderer classes, if you have a renderer class-- now, we do not have renderer class here in this example. My component itself rendering it. But you can have external renderer classes.

If you have external renderer class, you can go to the tag library. And need to tell the renderer type equal to the name of the class that contains encode and decode logic. The encoding and decoding logic you do not have to have in the components. But right now, your spinner itself a renderer. So just for example, they type it here the component name. OK?

If you want to externalize the renderer, you just have to create a simple class, any class name, and extend it from javax.faces.render.Renderer class. Just like you did in the components, you have override and encodeBegin. You can do it there. You can override encodeChildren, encodeEnd, and decode as well. Because this is a class. So you can override the methods of your choice that you like to do it. And I [? make ?] the logic how you want to perform encoding and decoding. That's all about the chapter.

## Activity 38 - 14m

Hi. Let's continue with the practice for the Lesson 12. It has only one practice. In this practice you just have to add custom components, a spinner to your DVD Library. So you do not have to create one. We already have one. Just add it.

Very simple practice, so that you can understand that if you have custom components, what are the things you need to do. We will see here. Our DVD Library, so let's say here go to com.example.component. Create it, because we don't have it. And copy USSpinner.java into this folder.

But if you already have USSpinner with you, you can have it in a JAR, in a JAR as a library that can be attached in your existing applications.

So let's create a package and then copy. The package name is a com.example.component. You can type any package name that you'd like to. Make sure that it's going to be all aligned like com.example com.example.

dot.components, and I'm just going to Favorites, and find Resources for the components. Right here I have USSpinner.java. Copy it and paste it here in this package. I'll include all, what we have used for demonstration purpose. USSpinner.java, com.example.component, that's OK, Everything is good. Same program.

Now what else? They say edit add.xhtml. Open it, and here you have to use this name as page for the custom components. Can we do this? We can go to this, and import this name space. Go to add.xhtml. And simply here on the top we will import one more, name space for custom components.

Now right now they say com.go.JSF no Library found. Yes. I know. We need to do a couple of contributions for taglet XML file, and of course in WEB-INF.

Now what they say? They say delete input text element and the following code to include spinner components. Input text element and the following code to spinner. Year what we are inserting a release here. That's what they say. For the Year part, just delete it.

I'm just going to replace. That's for the release here. Before I delete it, I can comment it. I just comment it, and let's say have this UI input, the new custom tag be added here. So if I just type here CodeJSF it will not help me to find it automatically. Let's see.

See, just typing CodeJSF is not going to help me to find a spinner because this library is not attached to these applications. It says it is not found. We need to do some configuration for this. Let us type it and just say spinner, and you can have all those Value is spinner, ID called to something we can specify. We can say Value equal to something. And Value equal to something. I can type this. Right? That is going to be the value.

Minimum Maximum is the attribute in fact, of this component. So we can specify Minimum equal to 1, and of course Maximum equal to-- I can read it from the bean properties. We do not need to have separate validators for this.

Let's check this. What else do they say? Minimum, Maximum, and Size equal to 5. Size equal to 5. Type all those things, and close.

ID, I can give the same ID here like I said here Year. And put it here, Year. And we can remove this.

This is giving me an error because we have to create a Tag Library Descriptor. And we can go to our WEB-INF folder, and there we can say New, Other, and Create an XML file with this name CodeJSF.Taglet.xml.

So there's a New, Other. Go to WEB-INF here. Under this you have to Create XML file. Right-click New, Other, and we have XML Options. And select Other for XML file. Do we have XML file there? OK. We have a category XML. And there we can select XML file, XML Documents.

Next it's going to be XML file, and I can type here the name that I would like to. CodeJSF.Taglet is going to be the name for this. No need to type .xml, because it real will put XML here. Code JSF.Taglet, it must be taglet.xml right?

Say Next. Finish. An XML file is now added to you. And this XML we want you to type this statement. We want you to have this all in this. Select the folder. Click Next. Finish. And edit the file by adding facelet taglet. This is what you need to add here.

Facelet taglet, just like we have seen in an example that they we have done it here, the same content we need to put it here, CodeJSF.Taglet.xml, facelet taglet. Now everything's OK.

Next is what you have to include as-- this is just not going to be OK with you. You have to see that it is properly included in web.xml or not. So remember, you have to use web.xml. And add to this context parameter, like here you have this value. You need to add this value into your DVD Library.

So we have DVD Library over here. And web.xml is open. DVD Library we have web.xml. All right. I can type it here. Copy and Paste it here. [INAUDIBLE] the source, the last one. Context parameter, and include it there. We have a context parameter of 1. You can have one more context parameter added. And specify the path [INAUDIBLE] for Code.JSF.Taglet. Directly to be loaded.

Save it. That's all done. See, the error is removed now. And you can run the DVD Library and see your add.xhtml. Now let's run this, and see how your add.xhtml page looks like.

You can got to the-- first type your user name. Add to my DVD collection. See now the Year, we have not specified default value. But you can continue. Our default value that's going to be 1, 2, 3, 4, 5, 6 like this. Type something, and then you can see.

Minimum is going to be 199. We can specify default value for this as well. The DVD.release here it is reading. You can go to DVD.release here and specify some default value, initial value that can be used to start this.

We can go to DVD Library bean. That release here, we can specify some initial value. Here, equal to I can say 1900. Case long, say L. Redeploy and test it.

All right. You're going to see some default value. Now if you click on this button it is going to increase it, and if you click on this, it is going to decrease it. Minimum value, it is 1900. After that you can increase the value, and specify until 2015. That is going to be the maximum value. That's all about this practice.
