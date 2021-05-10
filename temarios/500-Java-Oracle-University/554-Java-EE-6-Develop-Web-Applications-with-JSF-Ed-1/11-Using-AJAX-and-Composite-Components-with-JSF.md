# 11: Using AJAX and Composite Components with JSF

   * Using AJAX and Composite Components with JSF - 59m
   * Activity 35,36,37 - 26m

## Using AJAX and Composite Components with JSF - 59m

Hi, let's begin with the next chapter 11, using as AJAX and composite components with JSF. We'll start seeing that how to implement AJAX and then how to create a composite components. We're reaching to this point right now.

This chapter will help you to understand asynchronous JavaScript and XML, describe how JSF components can be enhanced with AJAX, use of the AJAX tag, and describe how AJAX request integrates with the JSF life cycle, defining composite components, and creating JSF composite components.

JSF 2.0 and AJAX, here we have a topics to be discussed using AJAX tag. Simple AJAX example that I will demonstrate to you we'll the JSF AJAX JavaScript attributes, AJAX field validations, and using the Javascript API for JSF 2.0.

And later on, we're going to continue with composite components and see some of the example which will help you to understand how to create them and how to implement them. Later on, we'll see how the AJAX can be a part of the composite components.

AJAX, it is a Asynchronous JavaScript and XML. Remember, it is useful to asynchronous request-- a request that you do not have to wait to obtain a response. In conventional application programming, what happened that you submit a request, and you have to wait to get the response from the server.

If you're not getting the response, or it's taking some times, you cannot continue and do anything on that particular pace. But with AJAX, we can continue to use the application while the client request is still in the process.

That's what here it says, traditional web pages, webpage one, webpage two, infrequent large update, it is submitted the request. And then it is going to do something. And finally, it is going to render response back to you, showing a web page, too.

With AJAX, what happens is you have a page and submit the request, which will run in the background. And you can still, here, continue doing something with the applications on the pages. So there's parts of the small piece of data that is inserted into the current page, and the same page.

Do not use it here if you have some legacy server or something like that. It's going to take too much time. We're not going to use AJAX. But here's a small piece of data that can be processed. And side by side, I would like to do something else on the pages. We can take the help of AJAX.

Let's see the example. For example, AJAX can also be useful, remember, for partial page refresh. That's what the most of the time, we use AJAX for this purpose. What happens is you may have multiple pages with you.

In a page, you may have multiple components. Components, let's say there's two components, have one more, three components-- the first two are actually containing list of values. The first components the list of country, all right.

The second box shows the list of states or provinces. And here just say, for example, add this line one, line two. Now here you have a list of values, depending on your choice of the country, you want the second box, states, should be updated and filled with the state information for that particular country.

So what happened? You do not need to wait longer. We can use AJAX. And as soon as you search here the choice, it can generate a request. It can generate a request. This is request will be processed by the server and will send a response back to you which will update the information listed in the state. If it is taking some time, you do not have to wait. You can still start filling the addresses with the line one, line two. All those things you can continue.

The information that you may have on the pages will not be reloaded. The only thing that you want to be refreshed can only be rendered. So you have already here rendered text boxes. You may have some images showing up, some pictures over there. You may have some footer here and some command links, maybe some links you have it here, set of links you have for navigation purpose which was only rendered on the page of the first request, need not to be refreshed, reloaded. So you're not going to wait for the entire page to be refreshed, just this part, state, is now going to be refreshed, which we say partial page refresh. Or people say partial page rendering. Same thing. PPR.

This is also possible for the validation. You must have noticed, in some of the website, when they give you the sign of form to let you decide the username and password and enter your personal information, your name, your addresses, billing information, shipping information, all those things. But in here specify that you want to have the user name.

You type your username. Something, you type it. And what happened? All right. As soon as you go to the next box here, it is going to generate a request to the server.

While you're filling all those informations, server can check whether this user name that you have selected is available or not. If it is available, it can, here, give you a check that is OK, something like this, say OK.

Not available, it can also give you the choice. Or it can say that please select another user name.

Remember, you have the option, when you type the password, some password, you type it, you say, nithin, at the rate, some number. And they have some constraint of a password. It must be at least eight characters long, should contain uppercase or alphanumberic actors.

As soon as you type it, and you move on to the next components, it can validate whether the entered password is right or not right. It can also check whether it is a strong password or not. So side by side.

You can submit those information for processing and get the small piece of [INAUDIBLE] as a response, which you can decide where to display it. AJAX is going to be very useful for you.

Remember, do not use AJAX if you have to refresh the whole page or 90% of the components you have to refresh on the given pages. It is better to go for reloading of the pages by resubmitting it and refreshing the entire page, just like in synchronous request. Because AJAX will not give you any performance benefits if you use it for the whole page to be refreshed.

JSF 2.0 and AJAX see that, in JavaServer Faces 2.0 you have the built in support for AJAX. You do not have to type JavaScript in. You can just take the help of f:ajax tag, which provide a set of attributes that can let you define when you want a request to be submitted, and what are the components that you'd like to be refreshed on receiving your response from the server. You can also take the help of JavaScript library, which is available in the JSF 2.0 API. But you do not have to type your JavaScripting on your own.

Using AJAX with the JSF 2.0, just like here, we say f:ajax event equal to blur. execute equal to this. render equal to nameError. You know what happened in this case? They have some components.

Let's say they have here h message-- for example, h message. And they say, this is going to be ID with nameError. Or it can be some output text, output text. ID equal to nameError. Value equal to some information that you want to show it here and that contains some error messages. Some message.

What happened? You type something in the text box. You have a text box. Type something in the text box. When you type something, let's say I'm typing here that Nitin. Event equal to blur. That means, when I'm leaving the focus, I'm going to focus on some other components.

So when you're leaving the focus from this component, it is going to submit the request. Going to submit the request. When the request is submitted, execute equal to add this. You have the restore view phase. That's OK. But the time of apply value, the java [INAUDIBLE] value to apply the entire form values that you have submitted to each component state.

And for that purpose, it actually traverses with the components in the heirarchy, finding each and every components in the given heirarchy and applying the value and say execute equal to add this, this job is just going to happen with only input text ID name. That means it was just going to traverse and find input text and apply the value for this one. Add this, only this component.

And then we have validations. We have update model, invoke applications, vendor response. Vendor response does work. It decides to vendor informations for name error. The component ID, that you specify, here, only this complement is going to be the first. That means render response contains the response data that can be used to refresh the component ID, name error.

The rest of the information will be the same on your pages. So you will not experience that you are submitted a request, and your page is getting refreshed. It's just going to refresh that particular component that you specify here. If you have multiple sets of components to be refreshed, you can use comma and specify some other component ID.

See the next example, what they have it here, they say input text value echoBean.text. Under that, they hadn't use f:ajax event equal to keyup. So in the text box, you have a text box. And in this text box, when you're typing some statement, some word-- remember, if I type N-I-T-I-N, Nitin, if I type N, to type I, I have to keyup. And then I, keyup. T, keyup.

On each keyup, it is going to submit the request. So request will be submitted with the value n sometimes, then with the value N-I, then with the value N-I-T, then N-I-T-I, then N-I-T-I-N, like This Each time, it is going to submit a request.

Apply value face, as well as going to be happened with execute equal to this, [INAUDIBLE] only this component. And the render response is autoprocessing. A response is generated to refresh the component text and count. The text and count are the two components which will be refreshed. And they will obtain echoBean dot get text get count values, which will be displayed on the screen. If you're using at f:ajax tag or implementing AJAX on your pages, we say then that you are AJAXifying your page. AJAXify a page, a non-AJAX page.

So JSF life cycle and AJAX. What they say here? When AJAX event is fired, execute the component's name by execute attribute. Renderss the component name by render attribute. That's what the example here that you type it, you keep typing, and you keep displaying here the value retrieved from get text and keep displaying here the count, how many characters there that are different get counted.

Let's have a look. See, generally, what happened that if you make submissions of your choice, see that here your page is being refreshed. The whole page is being refreshed. But within the AJAX, it's not going to be like this. Let's see.

But you need to be the same page. You need to go back to the same page. It is not for the navigation and for other purpose. Let's see.

Have some examples. We have lots of examples available that you can also try with your practice environment. Go to Open Project. Each chapter has a set of examples. See chapter, the previous chapter, Event Handing has much more examples and even examples available there that you can try to see how system events can be captured.

And if I go back to Chapter 11, let's start with a simple AJAX example first. All right. Simple AJAX example. Let me run this.

See the text box, and I'm typing here Hello, how are you? Something like that I'm typing. And the echo hear, output text and count, they are getting a response. So you keep on typing, keep on getting a response.

See? There's no refresh type of activity that you experience here from the page. But it is being refreshed using AJAX. And keep typing it. For each keyup, it is submitting my data.

So if I go back to let you see this page, [INAUDIBLE]. What they're doing it here, it is a key up, add this. And it's only input text, render text and count and once you submit a request, apply value, update validations, update model, for what were the value that it's submitted will be updated to the model that is echoBean. And echoBean get text will display that value to you. echoBean.count is returning the length of that submitted value.

That's what here, you are updating it in the update model. And the render response call and get count and get text to let this value be merged with the output text which you have to specify to be refreshed.

Now, let's say JSF AJAX attribute, f:ajax tag, it's optional. All the attributes of f:ajax tags are optional. You may wish to type them. You can. Else, not needed.

Event is the attribute used to define the event to trigger AJAX request. You can use the events like click, double click, mousedown, mouseup, mouseover, keyboard events, keydown, keypress, keyup, and several other events like onblur, blur event that you can use it. Event can also be used with action for action source components and the valueChange for editable value holder. For them, you can also use events.

Execute and render, see, these are the values that you can use it on execute and render. Execute @all. If you say @all, that means every page, every component on the page is going to be executed during the request. So it is just going to be a normal request that will start, create view, restore view.

Apply value, that means it's going to traverse with each and every component and apply to value. If you use this @all render, then every components on the pages will be rendered, which were the pages that you were going to implement it. @none, you say none, that means that it's just going to submit the request. Life cycle will be processed as it is, but there will be nothing to traverse in the component. No components are traversed because it is not going to process is any components and apply value [INAUDIBLE].

Performs the render response, it will perform render response phase but do not actually render anything because you said @none in the render. This is just useful for the current compliment where the AJAX tag is used as a child element. And this is the default value for execute attribute. This renders only the component which the f:ajax tag is applied. That means, with this, only that component will be rerendered, refreshed.

Form is the form. The entire components from the from will be processed and executed. Use it and render, the whole form is going to be a rendered. You can use immediate properties here as well. If you set it to events are going to be broadcasted during Apply Request Value phase.

That means just after Apply Request Value phase, events are going to be processed. Remember, events are normally processed at the time of invoke application phase. You say immediate equal to true, just after reply request value phase. Before validation of the module.

Here we have a listener for the JSF. That JSF actually invokes for AJAX is a process AJAX behavior. It's a listener. Onerror is the AJAX attribute that you can use for JavaScript functions to be involved. Onevent is again useful for the JavaScript functions that JSF calls for AJAX event.

Where do you put the f:ajax tag? f:ajax tag can be a child component of a particular component where you like AJAX to be triggered. Or it can be here, as a parent tag, f:ajax. And under that, you can have multiple components.

So this tag can be part of a components, or this can be used as a parent tag for a number of components. So in this case, let's say f:ajax, event mouseout, render zip. That means this event is going to be applicable for AJAX on these two components.

We are not specifying here execute. Execute. It's going to applicable on this component. Here we're not specifying execute. This is going to be applicable on this component.

AJAX field validations. Field validation, you want to type something on the field one. And then you want that to be validated immediately. Field two, then you want that to be validated. What you can do it, you can use f:ajax as a child component of that particular components.

Like here, they say input text value, user name, ID. Validators, they have specified validators. And what they say? f:ajax event equal to keyup. That means, as soon as you stop typing, for each keyup, it is going to start processing and letting the validation happen.

Render, nameError. The nameError, it is message ID, message ID, where the responses are showing you the error messages. They say render, name error. This is going to be rendered every time. But it is going to be visible to you if there's any error messages.

If there's nor error messages, it will no be visible to you. We can also use JavaScript API for the JSF 2.0. And for that purpose, you can have a JavaScript with you. And of course, you can put them resource folder by creating a self folder, a script, that we can read it within the page using Oracle script library equal to js or script, giving js file name. This script contains some function, some method, that you'd like to invoke it. You can with the help of these two properties.

Apart from this, JSF 2.0 is providing a standard JavaScript API. A standard JavaScript API means that you do not have to create JavaScripting. You do not have to have any method. There's standard API available that you can use it.

The standard API is accessible with the jsf.ajax functions. There's several functions that you can find, request, response, addOnError, addOnEvent, that you can use for similar tasks.

Request, it is just like using f:ajax tag, providing request functionality implementation. Response, provide the response handling functionality like in f:ajax. AddOnError, its for onError attributes. addOnEvent, it is for onEvent attributes in f:ajax.

So you're code is going to be like this, using f:ajax tag. You can say here on keyup, JSF.ajax.request, call the function from JavaScript API as a part your JSF. This is useful. This object, event execute what? Here's the @this. You want to execute this one. Render what? Text and count.

The same job that you have already done earlier, if you remember, just by typing here, render text count, event keyup. Execute, by default here @this. You can do it with the help of JavaScript API.

Quiz for you. To AJAXify a JSF component, you must use a browser that supports AJAX. It has nothing to do with the browser. use the AJAX tag within the component definition. Yes. That is going to be the right answer.

Use a JSF so facet? No. Compile the code like this? No. B is going to make a right answer.

Which attribute is required to use f:ajax tag? All are optional. So none. Two methods for adding AJAX to a JSF pages are, where you can add two methods for adding AJAX to JSF pages.

You can use f:ajax tag. Or you can use JavaScript API. Before I continue with the composite components, I'm just going to show you some more examples from the AJAX. And then we'll explain to you how to create composite components.

This one, what we have tried earlier. If you see that, you type f:ajax tag on the page. At the time of response, when the page is rendered to you, the first time, when it made a request and the page is rendered to you, you will see the source code. You have here a standard API JavaScripting this JSF.js is included.

See the source code? It has included JavaScripting for you. Script type JavaScript src, JSF.js. If you this? You will find several people codes available, which is used at the client side to initiate a request or to handle a response.

So now, if I go and open some other example, a similar example that you can try, AJAX validate I can try here. Run this. And then see what they're validating here. In this [INAUDIBLE]. They say username and user.validate name.

The password, here, they have not used AJAX. AJAX is used here for the username. That should checked the validator what validator is actually doing, it is calling in a bean method. Validation is available in a bean method. The userbean.java, they have a method to validate name. And they are checking if the value that you have entered, it contains underscore. If it contains underscore, its throws a validator exceptions that this mess is.

That it's going to be the part of UI messages, error messages, which will be shown to you through h:messages-- h:message for components. So if I type it here, Nitin, all OK, no problem.

But as soon as I type Nitin_-- it's the keyup. As soon as I type Nitin_, it is giving me the error message. It was on keyup, right? keyup.

OK. Good. All right. Now we're going to see how to create a composite components. They are reusable UI components. In these components, you can contains multiple UI components together and make them reusable so that you do not have to retype them. And you can just specify the name of composite components to be displayed or to be inserted in your JSF pages.

This composite components has the full supports for the validator. Full supports for the JSF event system and AJAX. And that is what here they say, heavily leverages naming conventions that you need to follow.

Composite components contains two properties, interface and implementations. Interface is for the content, where you're going to list all the attributes that you'd like to expose in your composites. And later, those values you'd like to be implemented on the components which you have combined in these composite components.

This here is an example. This example is referring to the composite comps. It is your namespace, your folder where you have stored your composite components. This is the prefix. You can define any benefit that you'd like to. And then you're going to find your composite components that can be attached in a JSF page.

So on the disk, that's what they say, on the disk, you have resources folder where you have kept, so far, images and CSS files, sk file. Same folder, you have to create one more folder with the name C-O-M-P-S. Whatever the name that you want, you can have here a page containing composite components. C-O-M-P-S, the name that you have used to the store the composite components in a folder. That's the name you have to use it here in the namespace URI.

I'm just going to demonstrate this code to you with an example so that you can understand what's going on there, and you can also see the result. We'll come back to the PPT and see the rest of the topic. Open Project. And let's find the example from the Chapter 11.

Example, let's say the email composite. There's the simplest one for better understanding. And you see that, here, they have created a composite under Resources. Have a folder under resources. And in this folder, you create a simple, normal JSF page. For creating composites, it's going to be simple normal JSF page.

Email.xhtml. The only thing that is not going to do anything with the head and all those things. With the body, use composite interface and composite implementations. To use these composite tags, you need to take the help of the JSF library, which is from JSF composite. Prefix you can use here composite for this purpose.

You say composite.interface. And in this interface, you can list out the attributes that you like to expose in your composite components. What's going to be there? The composite component name is email.xhtml, which, in other pages, you're going to reuse. How? You will type some prefix, your prefix, which will refer to the namespace URI for this composite. And you will use email that is the name of the composite component page.

Thereafter, you have the attributes over there which is available in the interface. Attribute name is value equal to. And just like you do with JSF-provided components, you can here have your EL binding. Some bean properties that you'd like to combine this with.

Only one attribute. If you do this, it is going to have the implementation on the pages where you typed the statement. It is going to show you output label. A label will be displayed saying email ID.

And a text box will also be a part of your composite because that is what you have in implementations. Text box value binding. It is a part of the composites. And you have to provide value binding to the implementation component text box. And that's why they have exposed your value attribute and interface because when you type this here, this information will be used to have the binding of your choice to be done with input text box.

So input text box value binding is from what? [INAUDIBLE]. You can use CC to refer to the composite interface attributes. [INAUDIBLE] referring to the attribute interface. Value is the attribute name that you're referring to. So which were the value that you specify here which is actually implemented in the text box.

So your text box has, actually, value binding what you type it here. Now this is where you have designed it. And any other pages you want to use it, go to the page. Have the JSF namespace URI included. You just have to use JSF composite, which is useful for creating composite components, slash you need to type here the name of that folder that contains your components.

Once you do this, here you can use the name prefix that you have specified. And you see that there's a list available for the email. You can have multiple composites over there. And then, you're going to see multiple lists here so that you can select which composite you'd like to use here. Right now, we just have one. So email. As soon as you click on the space bar, you can just type your value attribute that you have specified in interface and give you a choice.

Here they have not done the value binding. Just say enter your email ID. That will be literal value as it is displayed in the text box. If you want, you can have EL binding as well.

So if I run this, I'm going to see a text box showing you enter your name email ID as a value. See here? That shows the value.

Let's try some other examples that we have it here, composite example. See this page? index.xhtml, it is using a composite components email box which is available in this folder C-O-M-P-S that became a part of the URI for the namespace.

In the resources we have a folder C-O-M-P-S, and this folder contains your composite components, email box.xhtml. But you started with the composite interface and implementations.

See now, here we have the attributes email which is required attribute. That means mandatory. You must have this attribute. Attribute, name, email, it is optional. Attribute name action method, this attribute action method can be used to assign a method signature. Just say method signature must be string action. And they also here are specifying editable value holder so that your composite gets to know that which complement is editable and where it is found.

And implementation, see, they have the form. They say email, input text. It's a part of the composite. Multiple components you can put together in a composite. Email is the ID. And see the value binding? With a cc-addr's email. This value binding is from this attribute.

Command link, it has one more component. Action equal to cc-addr's action method. This command link is going to use the value as image for display purpose. And the email is, again, from the attribute image.

Now when you use this component, you will give your prefix referring to that particular namespace URI. And you give the email box. That is going to be the name of composite components.

Under that, you'll find attributes email equal to. If you have here some value binding, or you type any value-- let's say some bean properties, bean.email. I'm saying it here. This value will be replaced here, in this text box for the text box. You will have one more attribute over there.

It's for emails equal to. And here if you specify the emails name URL, that email's name URL will be used as a value for this graphic image.

And now the next attribute that you have here is action method, where you can specify a bean method. And you said the signature for the bean method must be java.lang string written type. And it is action method. So this is the action method. And that value will be used here in this command link action.

Editable value holder, just to implement validations if, in case, it's going to be part of your composite. So it will be applicable on email input. Just say email input is the name for editable value holder, which, in fact, is from form email [INAUDIBLE]. This is editable value holder.

So in the page index.html, the type this, say email equal to mail.email. All right, properties from the bean. Emails URL, which we'll be used in the command line. Action method, this is the value which will be used by the command link action properties and see the validators they specify here.

And when they are specifying validators, they are specifying here four. Why do they say four? Because, in a composite, you need to say which complement, where you want this validation to be implemented or applicable.

In that case, they specify email input because that was, here, in the Contact List of the interface saying editable value holder email input. It means it is going to be applicable on this text box. All right?

So if you run this code, you're going to see the entire thing together. You can type this multiple times, on multiple pages. You do not have to retype the whole structure which you have created here. Let's run this.

So you're getting here email, text box, and the command link with the images. You type here something, click here. It's giving me error because the validation is applicable on the text box. Validation is applicable on the text box. That is calling email validator that you have a Java class here created implementing validations.

So Java class, that's actually implementing validator interface. And here we have it in the logic to validate the content. This will tell me which components, what value, and will be able to validate the value. And in case if it not true, they are saying, to validate, which is your component set valid false, which will mark this for error, OK?

And then, with the help of context, reference that you have it here in the parameter, they are adding here messages. And this message it's going to be a test with the component ID.

So that's what here they explain to you that how a composite component uses context can be developed using interfaces. And then you can continue to start implementing. These are attributes that were listed in interface which would be exposed in composite components when you start actually implementing them on the pages to define the value to be used internally by listed components.

Mail.email and the images URLs, and, here, action methods, it's all going to be used internally here in the implementations of the components. Essential composite tags which you mostly use implementations, composite implementations, attribute, value holder, editable value holder, action source and interfaces.

Remember interfaces, they declared the usage contracts. And under that, you're going to have the attributes, list of attributes defined. You can also use value holder to see what are the components that you have it there. They can have custom converter methods. Editable value holder, you can use it here so that you can implement validations or converter, or the value chain listener test to that particular components.

Action source is defined of action listener methods. Interfaces, again, it is for attribute. Implementations, well you actually start listing out the components and start combining them, making them a part of the composite components.

AJAX can also be supporting composite components. You wish AJAX pre-built in a composite. The people who are using your composite, they would consider that as pre-built. So when you're creating composite components, you can AJAXify.

This is the example. What they have done, they already have implemented AJAX within the composite so that, when you're using them, you're going to get these features. Here they have list of values, multiple list of values, or you can see the names that are listed here when I click on B or C, or D, it is going to just filter the provided list to you. Sure [INAUDIBLE] be here. When you click something, that is going to be your value.

I'll show you this example auto complete text box. And then we will see the quiz. And we will be done with this chapter.

Auto complete example. File Open, Project, and go for auto complete example that they have it here, this one. First on it, and see what's going on.

See here, we have some list of values available. Right now, see it is listing multiple names here. And then I say D, it is just going to filter it, thus showing all those names with the stars on the D. When it said one of them, that is going to be the value of the components. We're not refreshing anything. The page is not getting to refresh. It is using AJAX.

See that auto complete, what they have done it, they have created a composite components. To find composite components, go to resources. And see that they have here util. Taking the help of JavaScripting for auto complete request. And what they're doing it here, see, they are importing JavaScripting which are available in this folder JavaScript that contains some couple of methods which are used here.

Input the text ID, that's what an implementation. See, input text ID, input cc.attrs value. That means you may decide what value binding you would like to have it for this text box. Value change listener, let's say auto complete listener value change. That's a method that they have it here in the source packet.

On keyup, they are using Java API [INAUDIBLE]. This is your API, user created API, for AJAX. On blur, they want to call. Input, lost focus this, on keyup, they want to call this method available in JavaScript.

They have here list box available, [INAUDIBLE] list box. And this list box, it is going to show you the items, list of items, which is the obtaining it from your choice of data. That's why they have done the binding in attributes.

If you go to index.xhtml, you'll find that they are using here util auto complete components. They are specifying the value binding for the input text that you're using it and completion items value binding, they also specify, which will be used, internally, in the composite for the select items.

So the value binding part, we see that here. Autocomplete.location, and the user.city, this is here in the source. They have two classes.

One is the manage bean for user bean, which accepts your submitted value. And autocomplete.java, what they're doing it here, they're generating the list of value, which will be a part of the selected items. So autocomplete.location. This is the value which is used internally in yours components to recite the list of values. cc.attrs completion item.

So that's what it's also possible that, if you want, you can use AJAX in your composite components. Not necessarily that you are always going to use Java API. You can f:ajax tag as well.

The key benefits of composite components are promote reuse, create flexible custom components, provide full support for JSF and AJAX, provide full support for validations. It is going to be all [INAUDIBLE].

The purpose of cc.attrs attribute name is to provide a way to look up components attribute, define the context between the composite interface and implementation, execute the right manage bean method, access the right manage bean property.

This is the way to look up component attribute. To create a composite, you need to use two tags, identify these two tags. They are going to be interface and implementations. That's all about this chapter.

## Activity 35,36,37 - 26m

All right, let's continue with the practice 11. And in this practice, we're going to see how to implement composite components, and how to take the help of Edge X to be added on the add and your preps.xsdml pages. So let's begin this practice with one-- 11.1, creating a composite complements.

In this practice, we will create a composite components for all login components. So what this say, this your first query directory util under this Resources folder. That is going to be the part of your namespace URI to refer to the composite components.

Of we'll do this. And then we create a pay sign in .xsdml within this folder. And there we will start implementing composite interface, and composite implementations. Let's see how these practices are going to be created.

We're taking here DVD library. The DVD library we have already Resources folder. We just have to create one more new folder for composite components. And I can select here other.

You have the folder options. Folder, next, give the name that's existed in this activity. Name is going to be Util. So we're going to type it. Finish.

In this Util folder, they want you to create a new page. It's just a normal page [INAUDIBLE] page. Give the name to this sign in-- sign in. That is what the composite component's name.

And here-- see, this is all going to be ignored. But you can start typing here interface and implementations for the composite. But for that, you need to include this name as pace URI for GSF composite tag library. So I'll just going to type it here in my DVD library.

Let's see. I'm just going to include it here. Now, once it is included, you can start using composite implementations and interface. I'll just put here interface as well.

So now we have interface and implementation. Let's see what they want you to do there. They want you to include a library so that you can give some style class name to beautify the components color, background color, size.

I'll just put this just below the title attribute title elements of head. Just below that, you can type it here. This is going to look for style.css under the CSS folder.

And then they want you to specify the attributes for the login components. Remember, the sign in is going to be the component name. And for that, you have to use attributes, which will be used internally in implementations for those components which you're going to add in your composite.

So we're planning to create attributes here for the user name prompt for the label purpose. Username-- it is just to specify the username we are binding. Password prompts for the label purpose, and the composite editable value holder name is password they say here. And then login button, login action, all those things you need to do it in your interface.

So I"m just going to type it here. And if I type it here, I'm just going to align them with the proper indentations, composite attributes, number two. The string type is required. It's mandatory. The next one password prompt, the password, login button text, and finally you have the attribute for the action. That's what your interface.

Now we will move on to the next part of the practice, where they want you to create the implementations. In the implementation, you have to design how your composite component's going to look like. Multiple components you can put here together, which will later be used just by the single name sign in. So we're just going to type all those things here for designing composite components.

Say it here. Let's see what they are doing at first. They are just saying panel grid column two.

We're just going to create the panel grid with the column two. First column will have cc.addrs.usernametom. So what would the value you specify in this attribute, which will be printed here. The next column is going to be with input text.

The value binding here-- cc.addr.username-- you're referring to this attribute which will be used the time of implementation of this components on other pages. So you specify value binding, username equal to something. That will be used here for input text.

The style it also there. So the second one is going to be for password. And the second column is for the password box.

All right, now we have here h masses for. H masses-- that is for error messages. Command button-- this here command button. And you can specify the value attribute for the command button that is for login button text.

Action equal to what? And you can here have the binding with attributes, which will supply the action value. Panel grid is now closed. And the composite implementations is now closed. That's what you have here configured for your two column panel grid. So that's all. The composite component is now created. We can start using signin.xsdml in our page.

The 11.2 say using the composite components in this practice. You're going to use this composite components in login.xsdml. So what they want you to open login.xsdml. Just open it.

And in this login.xsdml, you can here specify the name space URI for signin.xsdml. And that is going to be what? It is going to be the same-- jsfcomposite/foldernameutil.

So I'll just say here, slash util. Put this within double code. And here I'm going to type xmlns, name, space, colon. I can get my prefix, my component, like this.

That's going to be OK. This is my, then you have to use MY my to refer to the signin.xsdml. Here they say util. That's OK, no problem.

I can go to the form. Remember, in the form you already have some components. But you have to remove all those things. And now you can [INAUDIBLE] your sign in components.

So in this form login-- see that? We have the panel grid, username prompt, input text value, message prompt, all those things. Just remove everything. We don't need this. Just remove everything.

OK, now it is available in a composite. And say my, colon, you'll find sign in. See, when I say space bar, it is going to give me the list of available attributes, like user name, login action, login button test. And you can use those attributes to type appropriate values.

So I'm just going to type this all. This would be MY in my case-- MY. And I say username prompt, because what we did from this was bundle username binding with the login.username. That is your [INAUDIBLE].

Password prompt lead from the resource bundle. And the password binding, it is going to be with login.password. Login button text, you have the button and composite value for the text, [INAUDIBLE] from resource bundle, and the action method binding. That's the login action equal to DVD.login.

Panel grid-- we don't need this panel grid, because all of it there is a part of the composite. And see your composite components now implemented in a page. You can use this multiple times. And you can use this across different pages. That's OK. That's what reusability. You do not need to retype the entire structure that you did earlier.

Now what they want you to-- so you really need to add login method to DVD library bean using method signature that you define in the composite interface. DVD.login method-- so just check here where you have this method in your managed bean or not-- DVD login.

So we go to the manage bean that this DVD library. You'll find all the manners bean here in the beans packets. Open this. This is what DVD we are referring to. And we should have a method for login. If it is not there, type it.

So DVD login-- we're going to type it here. That will return a string. It's action method. Remember, in signin.xsdml you specified the strings that are [INAUDIBLE] for the action method.

So I'll just go ahead and insert that method anywhere. You can type anywhere, public string. We're not typing the login logic right now. We're just going to prepare everything here in this DVD library applications. And later when we have a chapter for security, we will write actual code.

And here I can simply say return. We can say return home. That is what configured in your faces config.xml. That means take you to index.xsdml.

Run the DVD library and verify that it works properly or not. OK, we'll do that. Let's run it as this does to do it.

I can say clean and build. And I can run it from here, which will deploy my application as well-- so deploy. Starting DVD library, and it will call the browser with appropriate URL. The first page that you see it here it is from your login components. See, you're getting here some background color because styles are implemented, or applied, under Components.

If I type area here-- any name that you can type it here just for testing it, but not actually verifying user name and password login. It's going to take you to home.xsdml. All right, good.

Now, let's see what next. Using Edge X for the validations-- 11.3, they say, why not add Edge X on your pages. They selected add.xsdml for the validation purpose.

So see that here. You already have input text ID here. And you're validating them against these two numbers specified in minimum maximum attributes of validate long range. They just want you to attach these Edge X.

We will do that. And let's go back to add.xsdml. We have here title, release year. And there we have here DVD current year.

And we can do what? We can just include F Edge X. F Edge X event value change-- that means we're going to type a value. We're typing a value, input text. And the value getting changed. That time, they say render this URL.

What is this URL? That's the name is going to be for H masses. This is referring to the component's input text. It does not have the ID. But we will include the ID so that it can be rendered in case if there's any error- ID URL. It gives us ID.

Once it is done, you move on to the next step and see what this is. Save it, add.xsdml. Run it. And check it. And once everything is OK, you can continue objectifying the page preps.xsdml by including Edge X on this boolean checkbox.

So under DVD, and see that your field reports an error as soon as it detects the changes in the field. I just save it right now. It will go for redeployment. And I'm going to refresh my page.

Say here, net 10, login. And add DVD. I'm typing DVD title right-- let's say wrong turn. Right here, let's say 2009, for example. Action, let this be the horror type. This is horror type.

And you have included this here in [? the EA, ?] right? I'm going to type some [? brown ?] characters. See, I'm typing here A. And as soon as I'm moving my pointers to the next, it is just going to validate it. The valid change event, it is going to validate it. That is what Edge X.

OK, good, so now you can do the same job there the preps.xsdml. And here you can include a value change event for the Edge X. And you can type execute equal to disk. Remember, we have not typed execute here. This, it is by default add this.

We here specify render error. And here we are not specify render error. That's OK.

So default value will be applicable for that. And I'm just going to put here title for the boolean checkbox. This say F Edge X event value change is do this. It is going to render the same thing back to you.

It will fool the check also to process the changes as soon as the checkbox is selected. That means as soon as you select deselect, it is going to submit the request, and the page is going to be processed, and the model will be updated with the appropriate values.

So you do not have to wait to hit on the command button and submit the changes to see the changes applied or not. So right now, if you remember that your people are going to set user preferences at here. If you are making some changes, you have to click on Update Preferences, which will submit your request, update the model. And then if you go to Display DVD Library, you will see the changes.

Right now, I'm not saying Update Preferences. I'm going to display DVD.

There's no change, because I have not said update. If I say update, then the model will be updated. And model updated, that value, you're reading it in the column Render Properties, which will decide to render it or not to render it.

So what we planning now to have Edge X. And in the preps, everywhere you can put here Edge X. For Edge X, you can just remove it. And inside that, you can type the Edge X. All right.

So this title, I can open it. And I can close this. Close it.

Same job you can do it with other boolean checkboxes. We can do it here with this one as well, and a third one. And now you do not need to have this command button. We can remove this command button. Command button for update preference, we can remove this. You don't need.

OK, save it. Go back, make a first request to preps.xsdml and see there's no command button right now for update preferences. You said DVD title, check, displaying two.

Go back. Say genre, check, displaying three. So I don't need to hit the button to update the model. It has been updated as soon as you select or deselect.

Good, what next? That's what they want you to just check it if it works fine or not. And once it is done, we are done with this practice.
