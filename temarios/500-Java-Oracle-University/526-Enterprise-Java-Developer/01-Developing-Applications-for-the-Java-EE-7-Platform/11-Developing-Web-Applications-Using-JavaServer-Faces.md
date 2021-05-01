# 11: Developing Web Applications Using JavaServer Faces

1. Developing Web Applications Using JavaServer Faces: JavaServer Faces Concepts - 36m
2. Developing Web Applications Using JavaServer Faces: Describe JSF Navigation - 41m 
3. Developing Web Applications Using JavaServer Faces: Demo - 10m
4. Practice 11-1: Adding JSF Action and Event Handling - 24m
5. Practice 11-2: Creating JSF Pages - 44m
6. Skill Check: Developing Web Applications using JavaServer Faces - Score 80% or higher to pass

## 1. Developing Web Applications Using JavaServer Faces: JavaServer Faces Concepts - 36m

 
Let's take a look at the next chapter, which is Developing Web Applications Using JavaServer Faces. In this session, we need to describe the JSF lifecycle and architecture, understand JSF syntax, look at the JSF Component Libraries and the ways in which we can apply validation and converters to the UIComponents, using the UI templates, describing JSF navigation, handle localization, and produce messages, use Expression Language in JavaServer Faces pages, use CDI Beans, and use some new features, such as support for AJAX components.

It's quite a lot of things going on in this session. There's a sort of big development environment. Well, let's take it step at a time.

First, let's get our head around the JSF concepts. JavaServer Faces is a server-side component framework designed to develop web applications. But it's very different, although it might sound similar. But it is indeed very different from JavaServer Pages.

Remember, JSPs, JavaServer Pages, they were converted to servlets. Well, JSF Pages are not. They are interpreted by a prewritten servlet, which is called FacesServlet. You map that servlet to the URL. Well, that's using a web.xml file, so mapping the servlet to the URL, faces/* for example. The idea is that, that star there will stand for a wildcard, for any page that you want FacesServlet to handle, to interpret.

So when you're invoking an actual JSF page, you are actually invoking FacesServlet and make it interpret a particular page. And a FacesServlet is a prewritten controller that handles the lifecycle of a JSF document. So it is hard-coded into that control exactly what it's going to do. And we need to learn about that lifecycle and how do we write our code to plug into that cycle to work correctly there. Also, FacesServlet will control navigations between these pages. So lifecycle navigations, well, essentially will act as a controller.

The page itself, the JSF page, also known as a Facelet, appears to be just an XHTML document. So it contains direct HTML markups if you need. But it also contains JSF UIComponents. These JSF UIComponents are markings within a page that have a corresponding Java code that will generate some kind of output to the client, produce the layout, produce the visual content that a client would see.

In fact, UIComponent handlers are doing it with the help of an additional piece of code, which is known as RenderKit, which job is to have the handler components to actually produce and use our visible layouts. Therefore, we can conclude that apparently the JSF page does not really directly contain any Java code. It's pure view, in a model view controller sense. So it's just basically creating the layout. Its job is to create visual presentation of a content for the client.

FacesServlet that will act as a controller for it. So you don't need to write that controller, as you had to when we were dealing with other web development frameworks, like JSPs. We were writing controllers using servlets. We're writing controllers using web filters. This time the controller is already available for you of the box. So you can focus on the production of the layout within a page, rather than just code in a controller itself.

Also, if you want to call your custom Java code-- well, invoke your business logic-- we can't do it by placing such code into the JSF page. It's not allowed, to put direct Java code into it. But you can use the expression language and reference necessary code in your model, in CDI Beans, through the expression language, that you put these expressions into the page. So business logic will be in your CDI Beans behind a page.

So, indeed, as you can see, that the framework is geared to represent pure model view controller segregation within Java EE environment. First, let's take a look at how the FacesServlet is registered. It's pretty straightforward. There's a fragment from a web.xml file here. And there are these. That's your FacesServlet, mapped to some URL, faces/* for example.

And then, of course, if you want to call a particular page, like that product XHTML page, then you just sort of pass that as that argument, if you like, to FacesServlet. So note, you're not calling demos/product. You're calling demos/faces/product. So you want FacesServlet to handle that particular page.

Why is it we're using web.xml? Because we are not writing FacesServlet. It's already written. So we have no way of annotating it. Well, I'd say you cannot put the notation into it, because it's already there. And the only way you can change the way it's mapped to the URL is just by writing that in a web.xml file.

But of course, web.xml takes precedence over whatever annotations could have been in that servlet in the first place. And it doesn't matter. We could just map it to whatever URL we like. It could be faces/*. But frankly, it doesn't have to be. I suppose it's a URL as good as any other.

Next. Now, Faces configuration can be stored in a faces-config.xml file. This is as a configuration file used by the FacesServlet itself. Technically speaking, it's optional. You don't really have to create it. But there are certain things you won't to be able to achieve without that file. For example, registering resource bundles and locales for localization of the application, you would need faces-cofig for that.

As for other features, you may achieve them through other means, not necessarily through using faces-config, maybe just annotations. And so it's not mandatory, but you probably want to use it. You see in the earlier days, when we used Managed Beans, which is, remember, a predecessor framework, before we had the CDI Beans, Managed Beans was something that was exclusively used by JSF runtime. And they were registered in faces-config.xml.

Well, these days, that's not important anymore. I mean, you could still do it. But you can just annotate CDI Beans and use them instead. So for that particular reason, faces-config.xml could be emitted. You don't have to do that configuration anymore. But there might be other reasons why you still want to use faces-config. Well, we'll actually encounter some of them later in this chapter.

Now, what's in that Facelet page? Well, as I said, it's an XHTML document. So it could contain direct HTML markups. Mind you, XHTML markups-- so you have to do the proper closure of all tags. You cannot leave the tag without these trailing slashes. So follow the XML rules, basically. So it's not exactly an HTML document. It has to conform to the XML rules. But generally speaking, you can just put some HTML markups there, but not just HTML markups.

You can also put there the UIComponents that are the JSF UIComponents, coming from JSF Component Libraries. And in this particular case, these are the examples of such components. They are indeed coming form JSF Library. They are not HTML markups.

The corresponding UIComponent handlers, together with the rendering kit, eventually produce some HTML markups that we deliver to the client. But the page itself here does not contain direct HTML. It contains these UIComponent elements. They are indeed rendering some HTML.

But they also have server-side handling functionalities. And here are some examples of that. As you can see in this corner of the screen, we've got a CDI Bean. Well, for convenience reasons, we give it a name-- pm, as in Product Manager. We'll request code, for example.

And we've got some operations in that Bean, like that operation "find," and then maybe some properties, getter/setter methods. If you want to access properties and objects, you can use these expressions with dot notations. Here pm.product-- presumably product has id, dot id. So dot, dot, dot notation that allows you to access properties of your objects and call methods, as well, that find method invocation, against the action listener.

So this is the idea. Components in the page not only render the output, deliver the output to the client, but they also are associated with expressions that allow you to relate the component and its functionalities to the supporting code in the CDI Beans. So that's how you trigger a business logic in the application, execution of that logic, and get and set values from the application into the page and out of the page with expressions there.

Please note, the expressions are not using dollar. They use that hash sign, slightly different prefix here. And that's because we call these deferred expressions. They are executed not within a servlet lifecycle, but within a JSF lifecycle. These expressions are essentially interpreted by stages of a lifecycle of FacesServlet.

So that's why it's deferred. The servlet lifecycle is a lifecycle of a FacesServlet itself. But then a FacesServlet creates a lifecycle of handling of a page. And in a context of that lifecycle, these expressions would work.

Now, talking of lifecycle, there it is. So let's just go for this cycle and explain what's going on. First, client calls the page. Lovely. FacesServlet receives that call, figures out which page the client wants to call. And the FacesServlet checks if the page is accessed for the first time, or maybe this page was already accessed by the client. So it might be like initial request, or it may be a later call postback.

Let's assume, for a moment, this is initial request. We'll talk about postback in a moment. But let's start with initial request. So, client initially calls the page. So the FacesServlet needs to create that, we'll call it create view phase.

If it's a postback, that same phase will be known as restore view. Because the page will already be there, will already be accessed by the client, as a later call. But in a first call, the FacesServlet parses the JSF page. And it sort of prepares it to be handled by that caller. So the page needs to be ready.

If it's initial call, then client probably does not submit any values. It's just calling a page. There are no special parameters. There are no need to apply them. They don't need to validate anything-- just invocation of the page as is with no extra sort of parameterization. In which case, all phases, from two to five, are essentially skipped. They're not doing that. On initial call, after the first phase, an application directly proceeds to the phase six.

So FacesServlet basically says, that's the first call to the page, put it into memory. Now, get values out of CDI Bean, retrieve values from CDI Beans, whichever values the expressions in a page are pointing to. So we get these values. We apply these values to the UI elements that are in the page and render the output. Let the UIComponents produce whatever output they produce.

So that's the initial call. User gets the page. If elements in a page we're referring to you are modeled to CDI Beans via expressions, the user will see the current values of model elements displayed in that page. However, what happens next is the user may wish to change these values. So you're getting back from the server, on initial call, a page that displays some fields and a star. And there might be some values in these fields. And your user starts typing to these fields, modifying data.

So the user modifies the data, submits that form to the server again. That's very important. JavaServer Faces process submitted forms recursively. So if you have a page A that generated you some output, some form that you're looking at, your typed values, you submit it-- you submit it to page A, always.

So FacesServlet will get this postback request. It will be a call to the same page all right. But it will not be an initial call. It will be that later, subsequent call. And this time the call will contain new values that a user has typed into the form.

So now they have to be processed. How they're processed-- phase two of the lifecycle. Take the values that are submitted by the user through the request and apply them to UIComponents that compose that page. So for example, if there was a UIComponent that has generated an output, which was an input field, and the user typed something to that field, that value that the user typed, that HTTP protocol parameter that you are getting, FacesServlet is going to extract that and apply it immediately to the corresponding UIComponent that has generated that particular field in the first place.

So there's kind of a relationship between what are you looking at in HTML and what is happening with the UIComponent in a server tier. These items relate directly. If needs be, at that stage, data type conversions could be applied. Well, I suppose, if something more complex than just a simple text or number, you might have to convert values.

And then you start processing validations. Apparently JavaServer Faces are aware of the framework known as Bean Validation and can certainly process the validations at that stage. So values are applied to the page, and they're validated. Good. We're in phase three-- validation succeeds. We'll talk about what happens when it fails in just a moment.

Now let's go to phase four. Phase four you take values what not you face a server does it here it takes values from UIComponents, and then applies them to CDI Beans. So now we're pushing the values from the page into the model. So that's how the items on a page, which expressions that we're using to refer to CDI Beans, the values will travel towards the CDI Beans.

Then we will execute business logic methods fits upon these Beans, execute whatever logic action methods. So we've applied values that a user has transmitted. And we ask the model to perform actions.

Once the execution of action methods finishes, this phase five finishes, we then progress to phase six, at which stage we, again, take values from CDI Beans and apply them back to our UIComponents in the page. Because they may have changed. The model may have modified things. So we need to apply back to the page these newly acquired model values, and then let the UIComponents produce whatever output they need to produce.

One more thing. In case of any error during whatever phase-- say, for example, you failed validations, or data type conversions, on your model threw the exception, or whatever happens-- you have a problem-- this life cycle will be interrupted. And regardless of which phase it interrupts in, it jumps directly to phase six, Render Response. So no matter what went wrong, the cycle is interrupted, and you progress into UI Components, Rendering Response.

Couple of things that I want you to remember from this whole description that might come in handy. First of all, you are not writing that code. It's already written. It's what the FacesServlet does for you. All you do, you write expressions into pages to create a tie between the UI element in a page and a CDI Bean. And it's the job of a FacesServlet to figure out when to take the value from a page and apply to the Bean, and when to take the value from the Bean and apply to the page, precisely at phases four and six. That's how they're synchronized.

Let's take a look at the next part of this presentation. What are these UIComponents with how, with which you can construct pages? Surely, you can just put direct HTML. Yes. But then what are these dynamic UIComponent Libraries. There's quite a few of them, really.

So you can see some Faces Libraries that produce HTML code that process some logic in a page. Actually, you could use the same libraries you've use for JavaServer Pages, the JSTL Core Library, or JSTL Function Library. They'll still work for JSFs just like they work for JSPs. So that's the same.

This is a list of libraries that comes out of the box with Java EE 7 server. So this is a standard set of libraries. In addition to that, there are a lot of third party libraries available that may produce much more sophisticated layout or handling capabilities in addition to these. And surely, you can even write your own libraries if you want to, with your own UI components and elements, out of which you can compose pages. So it's quite a vast selection of these UI elements that you could benefit from.

During this chapter, we're going to take a look at some of these elements. And there will be a demonstration a little later which will cover the use of third party libraries. Let's take a look at an example of the UIComponent Library at JSF HTML Library.

In this particular page, we're looking at the way in which the Facelet, with its UIComponents that are coming in from that UIComponent Library-- well, these other components that are part of the page-- produce HTML. So in this case, we're looking at a form with some input fields, with some buttons. And the UIComponents that you observe create actual HTML elements. Let's take a closer look at exactly how they're creating these elements.

For example, please note this action attribute within a form. It's nowhere to be found in a JSF Page, is it? This markup in a JSF Page does not contain it. Why would that be the case?

Well, you see, when the UI element in a JSF Page produces an HTML, displaying some input text field on a screen, the value that the user will type into that field will have to be submitted back to that same UIComponent. It should be applied back to the same UIComponent for it to be correctly processed. And that means that the form has nowhere else to be submitted to but recursively to the same page. And that's why the action attribute always points to the same page that produced the form.

The HTML action attribute will always point there. That's why it's not present in the H form markup within the JSF Page itself. Because it's kind of excessive. There's nowhere else that could possibly lead to.

The other interesting thing that I'd like to point out is that the page could still contain just plain HTML elements here, which is, they're just transmitted from the Facelet page to the generated HTML as is. And now there's another interesting thing. And that is the way we handle the identity of the fields and forms and elements within a page. So let's take a look closer at these identities.

A form is given the identity "edit." A field is given the identity of "id," or another field "find." Look at the generated HTML. It's kind of a way of identifying the field as belonging to that form. It's part of that form. The identity attribute is optional. You don't actually have to use it at all. But if you want to then, later, put some JavaScript code into the page which dynamically accesses the elements of the HTML page, how would you know what element is what?

The id will be auto-generated for you if you don't put it in. But it might not be particularly convenient. So if you want to rely upon your particular identities of fields for the benefits of dynamically processing components within a page, on the client tier, maybe with some JavaScript, that's precisely what you might have to do; Put these id's in just for your own convenience.

And next interesting thing that we'll take a look at is the HTML Passthrough library. The HTML Passthrough concept allows us to combine HTML markups with JSF UIComponent capabilities. And there are several ways in which it could be done.

First, there is this library called Passthrough. Well, we assigned prefix p to that here. And look at how we use that. We have a UI element called inputText. It's not an HTML markup. It's the JSF UIComponent.

What we want is, we want the HTML element that will be created based on that UI Component to contain an extra attribute called "type." Unfortunately, JSF UI Component called inputText doesn't really have the type attribute. An HTML element that it produces can have it. But it itself doesn't have it. So you'll add that pass-through attribute. And it will emerge in the generated output of the page there for you.

Slightly different approach of achieving the same thing with a core library where you add in a pass-through attribute not as an attribute, but as an element to the UI Component. But the result is just the same. So this case, an extra attribute was added. I mean, it doesn't have to be the attribute type. It could be any HTML attribute, whatever. It doesn't matter. But that's how to append a bit of HTML to the output produced by the JSF UI Component.

And there is an opposite example. With a JSF Library, you can construct what clearly is just a plain HTML element, but append to that HTML element bits of JSF UI component-handling capabilities. So that means that you would sort of engage that HTML with dynamic processing of JSF lifecycle events and expressions on a server tier.

And as a result, you produce the combined HTML, which is partially plain HTML, partially the output produced by the UI, JSF UI Components. By the way, this is a new feature in JSF, in latest version of JSF runtime, which kind of adds that flexibility to the page. Ultimately, that means that you can make a page more lightweight. Because you don't have to process everything from UI components, or you don't have to construct bulky HTML. You can just crop bits of HTML where you need to to, or crop bits of JSF Component functionalities whereabouts you need to. It's very flexible. So that's another example of UI Component Library functionalities.

Now let's take a look at validators and converters. Converters are applied to your values that you submit from the client to the server. And then validation can be applied. So it's phases two and three of the JSF lifecycle when would perform the process of applying request values, and we then validate them.

Why converters are important-- regardless of what type of a field that you create in HTML form, unfortunately, HTTP protocol transmits everything just as text. You may say that a particular field and a client HTML is a number. You may say it's a date. Who cares? HTTP protocol, which is that medium between the client and a server will, anyway, transmit everything is just string. Because there are no other data types available there. It's just a limitation.

So therefore, when values are reaching the server, they're just reaching the server as just text. And if you want values to be presented as numbers, or dates, or anything else, any other types, you may have to provide a conversion. Conversion can be written as a custom conversion. So you can write your own custom converter. But then some converters are available out of the box, like converter for date, time, converter for number. They're just there out of the box.

So it's pretty straightforward. You reference a converter. If it's one of the precoded converters, like these date, time, or number converters, it has its own element to cater for it. Converters may be associated with additional parametrization, like, for example, date, pattern, or, I don't know, currency code, or the fact that it's not just any number, but it's a currency number.

Also, if you want to use custom conversions-- you write your own converter, for example-- you can reference your own converter by using a converterId. Well, I'm kind of using here a precoded converter, which already exists in javax.faces package. But guess what? You could have written a custom one.

Part of your exercise, you are going to write custom converter. So that's still to come. You'll do it in a practice. And that's basically how you can reference the converter from the page.

Now, as for validators, you probably guessed their nature already. And they remind you of something-- Bean Validation API. And that's what they are basically representing. So you've got these elements you can put in a page to associate input fields with validations-- regular expressions, lengths, ranges of values. And there is a way of registering custom validator as well. So just like with converter-- so you can do custom converters, and you can do custom validators if you need to.

To improve code reusability within your application, you may use JavaServer Faces templates. Now, the JSF template allows you to describe a structure of your page with placeholders whereabouts you want to insert future dynamic content into that page. Each such placeholder will have a name.

And around these placeholders, you can do whatever you want. Template could contain any regular code, just boilerplate HTML text, whatever you like. And then, if you insert something into that part of a template, you define a JavaServer Faces page as a composition. And for every named region, you define what it is that you want to put into that region. Could be just text. Could be dynamic inclusion of another page. How about that?

So there you go. So it's a composition of different components, elements, that recycle the same template structure. If you've got standard layout that several pages will have to follow, do use a template. It will be recycling your code in a quite efficient way, actually.

## 2. Developing Web Applications Using JavaServer Faces: Describe JSF Navigation - 41m 

Let's describe JavaServer Faces navigation now. It's controlled by the Faces servlet. Now remember the trick that we were doing before. We know all that when we submit some kind of a form in JSF, it goes back to the same page to be handled by the same page.

So how's it go from one page to another then? Well, you can control it with a property called action, which is associated with some sort of command component. It could be command-link. It could be command-button, any of these. Actually, one example here shows link. Another example shows button. The only difference between a link and a button is how they're visually presented to the user as a URL, clickable URL, or button on the page. Apart from that, they have the same functionalities. So expect them to work in the same way.

Let's say, for example, you have some kind of a JavaServer Faces page called list. Let's take a look at this one first. And this last page contains a button called find. And when you click on that button, you want to see as a response from the server-- you want to go to, if you like-- an edit page. So there's another page called edit. When you will click on that button, the list page will submit the form recursively to the same page. So the request will go back to the list page.

You will go for the six-phase lifecycle. But on phase six, just after you finish invoking the model-- you applied values, you invoked the model, everything is fine-- on phase six, instead of rendering output from list page, it will render the output from whichever page the action attribute says it should render the output from. So essentially, it's just a page name.

You [INAUDIBLE] saying, handle the input produced by the user within the lifecycle of a list page. But then render the output from the edit page. So the user will see the output produced by the edit page as a result. To the user, it fields like the user just navigated to another page because what they-- that's what a user sees on the screen.

Well, actually, the URL in a browser will still say the word "list" because that's where the request was submitted to. When you're doing a server-side forward or include actions, the browser doesn't know that another page is rendering the output because the browser is not doing the explicit request towards the edit page. The browser submitted a request to the list page. It's just that a server decided to produce the output from another page. So you kind of have a mismatch here between what you see in a URL in a browser and the output that you observe. This is known as JSF implicit navigation. So just put the page name into the action property and you get that rendering of the output from that page.

You can control which page you go to programmatically. And that's a second example. The action property here in the edit page points to some kind of a bean. And that bean contains a method. A method name is irrelevant. It's called navigate. But you may have called it whatever you like. What's important is that that method should return string. And that string could be a name of another page or now, if you return null, then you render the output from the same page.

So edit page submits itself to itself, handles first five phases of a lifecycle. All the user input is applied. Model is invoked. Then it's calling that navigate method. Navigate method is deciding whatever-- to stay on the same page, render the output from edit page, in which case it returns null, or to go back to the list page. So it navigates to list just by returning the name of the page there. That's it. It's quite straightforward. So that allows you to dynamically determine whereabouts the page, well, navigates-- better say, of course, which page produces the output for the user. That's how the JSF navigation works.

Right. By default, you can use implicit navigation in JavaServer Faces by simply submitting the name of the page as the action property. However, if you decided that you don't want to use the name of the page, you can create an alias for it in the faces-config.xml file. So basically, what the example here says is this.

Let's say we're looking at the added page. If the added page contains a command component-- command button, command link-- which has an action property with a value list, instead of going to some list page you're going to the page called Product List.

So probably because you didn't want to type Product List, you felt like it's too lengthy and you want a shorter alias for it. So you can configure such shorter alias within the faces-config.xml. If the added page submits the view as the value of the action property, it goes to Product View. However, you can also do this interesting thing. SQL wild card. Navigation case.

So you've got any page in the application-- any-- submitting the action property of a command component called home. And that will go to Home.xhtml. Well, actually, what is in this particular case completely excessive, because Home.xhtml is already called Home.

So the alias and the page coincide. But I suppose the point of this example is to really show you the use of the wild card, that you can just define the navigation rule for all pages, or for specific page as in the first example. OK?

So now another interesting new feature of Java ServerFaces runtime, an ability to create Faces Flows. A Faces Flow describes a progression for a number of pages. It could be associated with its own configuration file. You may describe Faces Flow in Faces config.xml. That's one option. You may describe Faces Flow using annotation called Flow definition. Or you may describe Faces Flow in a separate config file, which is pretty much like a replica of Faces config, but just for that Flow.

Now the Flow allows you to describe a group of pages with designated specific starting point. You have to start the Flow where the Flow says it should be started. So let's say that's checkout page, that is your entry point. You have to start there.

And then you progress through the navigation through that Flow for a number of pages until you reach some kind of a Flow conclusion. The end of that flow. So you may describe different outcomes, how the Flow could end. The Flow has its own memory scope, which is very similar to Session's FlowScoped annotation that could be used to describe CDI beans that are placed into the Flow.

Similar to the Session, but it's shorter than a Session. A Session [INAUDIBLE] is essentially as long as the user stays active. For all pages, for all URLs which that user goes to, for as long as that browser is active, that will be still the same Session.

But a flow only ever lasts while the user progresses from through particular collection of pages. Once the user leaves that collection of pages, that's it. That's the end of the Flow scope. Flow can be logically treated a bit like a function. You can pass input parameters to the Flow and the outcomes of the flow may return values. You don't have to do it, but you certainly can.

So in this particular case, let's imagine I would like to check out my order. So I'm doing this purchase completion here. I've ordered some products and I want to complete the purchase. I need to enter information about my shopping cart details and progress the payment.

And I might either succeed or fail in that process. So this could be the possible outcome of that Flow. It would probably have some kind of an input parameter identifying which order I'm checking out. I suppose if I'm producing some payment I need a payment reference to confirm that everything is fine.

So there you go. It allows you to kind of create, in a way, a kind of a business transaction of a number of pages where that Flow, where you are limiting the scope of CDI beans just to that Flow. So you're not dragging them along memory for an entire Session. It just helps you to organize your application better to encapsulate bits of functionalities into sort of areas of the application which are delimited by the Flow boundaries.

Now there is a series of pages here, starting from this page and there will be a couple of more pages, discuss specific UI component attributes. So when you are constructing a UI component in a JSF page, you need to understand some subtle differences between using this or that attribute of UI component.

And we'll start here with two attributes. They're called Action and ActionListener. Well, kind of obvious that it's easy to confuse them because of the similarity of the name. Such attributes are present on any command component. Command button, command link. So they have ActionListener and Action attributes.

ActionListener can be used to bind an expression to point to a method in a CDI bean which has a very particular signature. It's a void method and it's accepting the Action event as an argument. And it's there to process business logic or the application to react to that click on the button.

The other method, which is Action method, points to a CDI bean an operation through expression. It does not accept Action event as an argument. No, no. But it does return string. And you see the string is a navigation case name. It's where you want to go. Which page do you want to go to. From which page do you want to render output.

So it's clearly a different nature of the method. I suppose you can use both, right? Oh and of course you need to remember the order in which they invoked. First ActionListener method is fired, and then Action method is invoked.

And the reason why is pretty obvious. Action method is going to potentially trigger the rendering of an output from another page. So that would be the last thing this page is going to do before it passes the control to some other JSF page that potentially can render the output. All right, so that's the difference between Action and the ActionListener.

Next, the difference between Value and Binding attributes. Again, there's a great deal of similarity between what the value and binding attributes are doing. And yet there is an important distinction. So the value and binding attributes could be associated with various UI components.

And a value attribute is used to reference some sort of a value that that UI component should have, like that product ID. OK, so presumably there is some kind of CDI bean. That CDI bean has a product component in it. Would like to get that product and then access its ID. There you go. So it's just some kind of, I don't know, integer value, maybe.

What about the binding? The binding allows you to access not the value of an element, but a UI component itself. So that is mapped to the UI component, called PID field in this case. It represents that markup. It's called input text. Right? And there's a Handler for that input text markup, which is a Java class called HTML Input Text. This is a physical implementation behind it.

So if you want to dynamically alter things on the level of the UI element itself-- not just manipulate with its value, but manipulate with the UI element itself-- well, you can. You can do it in this sort of bean. Right? However, there is something that I need to talk about regarding that particular bean.

You see, I even changed the name here to BackingBean. What's backing bean is? When you create such beans that are referencing the binding of the component, representing a specific UI element in a page, can this bean be used in another page? Not really, because the other page doesn't have that UI element, does it?

So normally, CDI bean can be injected anywhere you want. It doesn't have affiliation to specific page. But if you start referencing bindings, you essentially creating a hard coded link between that UI element in a specific page and the presentation of that element in Java within the bean that supports it, making the being not really usable for other pages.

That may lead us to use a different scope for that bean instead of request scope, which potentially means that that bean could be used by another page. Maybe you would like to use a different scope called View Scoped. Because the View scope links the bean to specific page. So you would not be in a situation where you're accidentally in another page also trying to reference that bean, and find out that it doesn't have the necessary element within the page to which it can be linked. So maybe in that particular circumstance you would like to use a View scope bean rather than Request scope, for example. Just because you don't probably reuse that component.

Personally, I think that I would rather not use the Binding property approach most the time, because if I want to dynamically alter whatever is happening on that component, what stops me from altering these through expressions that are associated with the component properties?

So why would I programmatically code in a bean a logic that alters the UI component if, in a page I can just put in property pointing to expression and any bean can set that expression value? So it's pretty straightforward, isn't it, yeah? It'll probably be easier than coding the bean that is specific to a given page. But you've got both approaches, so whatever you choose.

One more interesting attribute that I would like to comment on is the attribute called immediate. It's a very confusing name. Right. What it actually means. It depends where the immediate attribute is applied to. It can be applied to input components. It can be applied to command components. Or to both.

Let's take a look at the immediate attribute being applied to some input component. So imagine there's a form. There's one field, and it has immediate attributes set to true. It means that such field is going to be validated ahead of others. So instead of postponing the validation of the field to phase three, the validation will occur immediately-- that probably would explain the name of the field-- at phase two, right when the request values are applied.

So in other words, if you've got a form and several fields in a form, and one field is immediate, that field will be applied first to its UI component counterpart before everybody else, then it will be validated and only if it's valid would any other fields in that form be applied to other UI components. If not, the request lifecycle will be interrupted, you will be dropped down to phase six rendering response. So that's the immediate attribute associated with an input component.

Now what if immediate attribute is associated just with some command component? So it's not in any field. No, just on a button, yeah? OK. So in this case, what will happen, you click on that button and your form, your other fields in that form, are not going to be submitted at all. Basically, you just send the command to the server saying which button you clicked, instead of processing the whole form with all fields.

Imagine you're looking at particular record in your table, in your JSF form, and there's a Delete button on there. So you click on that Delete button. Do you want to process all the fields and apply their values? No. Why? Because you're just about to delete it anyway. Who cares? All you need to do is say delete that record. So you don't need to apply all fields. It's enough for you to mark that button with the property Immediate.

Or maybe, there's another example, you want to navigate from this page to some other page without submitting the form. Like Cancel button. I don't want to submit the form, I just want to go to some other page instead. So again, you can just mark that button as Immediate, and will prevent the form fields from being processed.

Finally, you can use a combination of the immediate attribute on a field-- input field-- and on a button. If you use both, essentially you partially submit a form. You're saying, don't submit the whole form. When you click on that button, just submit that field. So in this particular case, imagine you've got some kind of field called Discount. And they've got Apply Discount button. And that will submit the value of discount, but will not submit ID Name and Price.

Maybe you've got more buttons in that form that submit other values. Now why not they might not necessarily all have immediate property. So those particular button does, so that's for partial submission of the form. As you can see, the whole API is geared to establish this link between the UI element that you see in HTML page and a UI component with which you handle it on a server.

So that's why we call this component-based approach, because we kind of establish that relationship between specific things within the client tier and corresponding handling components within a server tier. And we can control which ones are applied and how they're processed with attributes such as Immediate.

If you want to programmatically handle phases of a lifecycle of a JSF servlet or, I don't know, programmatically execute expressions as in this example, you can use for that the object called FacesContext. So the example here gets the expression language interpreter out of it, expression factory, constructs expression.

So essentially this is the kind of expression you could have just placed in a page in the first place. But you want to execute it from some CDI bean. So there you go. You can just execute it from the CDI bean with that context object.

Or might be other reasons why you use FacesContext. For example, if you want to jump lifecycle phase programmatically. Some kind of condition upon which you want to keep certain phases, or, I don't know, progress to rendering of the response. Or produce some messages, which actually we're going to see. There will be more examples of use of FacesContext because we are about to produce messages as well.

But before we talk about how we produce messages in JSF, let's mention the fact that you might wish to perform localization of your application. Now there is a part of this topic that is actually not specific to JSF. If you want to localize any Java application, you need to create versions of whatever resource bundles you've got.

So you create your property files, remember you had a validation property file. Well, whatever property files you have, you create versions for these files for different countries and languages. The language can be just a two-letter abbreviation like so. But there might be also country variances. For example, en_gb versus en_us. Yeah? So that's English, all right, but a slightly different flavor of that.

So country, language variances. And you translate the bundles. You basically provide translations for all the bundle properties into whatever other language you like. Right. So that's sort of general approach to localization. In JSF specifically, apart from referring to bundles and translating bundles, you also must register all supported locales in the Faces.config file. You have to register them.

If you created a translation of your resource bundle into some language which is not mentioned in Faces.config, it's not going to be used. You have to make sure that the bundle language and country extensions are actually explicitly listed in Faces.config.

Then you give your bundle a nice alias, msg, whatever. And there you go. Use that in a page in your expressions. Right? So that's referenced in this item price prompt. Then if the user chooses to use one language, that will show that prompt in one language. Chooses to use another, well, that will be a different language then.

The locale, which is the way of choosing which language the user would like to use, can be set as a programmatic property as well. So property locale in a view element determines the language in which the page will be displayed. So you can switch languages dynamically if you want to.

OK. Now, displaying any other messages. How do you do that? It might be validation messages. It might be, well, any other information or error messages, whatever you need to display. The example on this page talks about validation, but as I say, it might be any other messages as well.

So let's say you have some resource bundle validation properties. You have your name value pairs of messages. And then if you want to display messages associated with the page, you use Messages element. So for example, if any item in that page fails validation-- like that item price, for example-- it will display the error message with validation message properties whereabouts you placed Messages markup in a page.

Alternatively, you can create a Message markup that will display errors, not for all items in a form but just for specific item. So there's this For field that relates the message markup to particular item ID. So it's like an error message just for that field. Also, messages can be associated with CSS-- cascading style sheet-- visual clauses.

So this could be error messages, fatal messages, warning messages, info messages. Your choice. And you may create different visual style with which each one of these different message types should be displayed. Of course, in this particular case, we're looking at the example of validation messages, so that will probably be just error messages. But what about any other arbitrary messages that you would like to display?

You still use the messages, or message markups, in a form. The UI elements are still the same. But how do you actually generate that arbitrary message from the CDI bean? Well, that's the answer. FacesContext object, right? We'll remember this one. Get me the FacesContext current instance. Create a new Faces message. Severity level-- info, warning, error, whatever you need. Describe short and long message. Short message, long message, detailed message. Detail could be null or could be some text there. Anything you want, really. And then add the message to the FacesContext. There you go. That's it.

So that's what a CDI bean does. Whereabouts in the page you've got your messages or message markups, where you place them in a page, that message that you've just constructed will be displayed, with whatever style that UI component is associated with, depending on the type of message that you produced here. Info, warning, error, whatever you need.

OK. We're almost at the end of this presentation, but there's just another thing that I would like to mention. This is an example of how you register a managed bean. The predecessor before CDI beans. Before CDI beans we had to register managed beans in a faces-config.xml file.

You can still do it. I mean, even with CDI beans you can still do it. It probably is just a little excessive. You see, if you want to use CDI beans, all you need to do is just mark which scope they've got and that's it. Yes? It's just a simple annotation, like request scope, for example. Whilst in faces-config you have to spell it out as the registry. Eventually it's the same scope and everything, sure. But it's just more work to type all of that xml, I guess.

If you want one bean to reference another, you can do it with managed property. That allows you to create an injection. But again, in a CDI beans world, why not just use @inject annotation? That will simply inject another bean and that's it. You won't need a faces-config.xml for it.

But just in case, if you encounter managed beans application, maybe early version of JSF runtime before CDI beans were introduced, then you may encounter this style of coding. Also, look at this footnote. You have to consider the fact that, depending on which scope one managed bean is in, one CDI bean is in, it may or may not be able to reference the bean that's in another scope.

For example, imagine you are in the bean which is RequestScoped. How many sessions there could possibly be for one request? It's just one session. It's request from particular user. So from request perspective, session scope is unambiguous. It's obvious. It's that session. There could possibly be no other session for any given request. So session injection will work. You would be able to inject session bean into request bean. No problem at all.

What about the other way around? Ah. Well, we have a problem. Because for a session scoped bean, the request scope is definitely not one, but many. During that session there are so many different requests, so which one of them you're talking about is anybody's guess. So that would definitely create a confusion.

So be careful about what you inject where. The scope has to be unambiguously resolvable. So from perspective, for example, of a request scope, you can inject anything else you like into it. But the other way around, probably not.

Lastly, another interesting point about JSF runtime is a new. Feature an ability to add AJAX-- asynchronous JavaScript and XML API code-- and dynamically processing UI components within a client tier via JavaScript events. In this particular case, let's take a look. We've got an inclusion of a JavaScript component into the page. This is a standard JSF JavaScript library, but you may include custom libraries just as well.

So it's your JavaScript file. You include it into the page. And then, look at what's happening here. It's really exciting. You've got this AJAX event, which you associate with an input field. The event in this particular case as a change event. So there might be all sorts of different AJAX events. Change event is just an example.

And that means that this event will be triggered when a user will type into the field. At the point when user types. And then you say, execute price item. Price item is that element, isn't it? What's an execute? Submit it. You're actually just creating something that is not dissimilar from that Immediate attribute functionality. You're taking a particular element in a page and you're submitting that to the server.

Now what's happening? You're not submitting the whole page. You're just submitting the single element out of it. So the page will not be refreshed, because you're not rendering it from scratch. Ah, but you then say, you know what? Render one of the items. So when you submit the new value of the price, although you are not getting the entire page back-- because you didn't request that-- you are getting back a new value for discount item.

Suppose the server recalculates it. There's some logic to how the discount should work. So the value of the discount is going to change when you change the price. But the rest of the page is not going to be reloaded. That's the idea. Just sort of partially process particularly UI components in a page rather than the whole page.

Beware, this does not always work as you think. Because for example, if you intend to perform navigation, then this partial page refresh is completely out of the window. There's no point partially refreshing an element in the page if you're just about to render the entire page from scratch, right?

So also, if you need to render a lot of items-- so it's not just one item you need to refresh but lots of items you need to refresh-- or submit more than one item, submit several things, maybe it's worth just submitting an entire form rather than process it field by field. It depends what will be quicker, I'm not quite sure. In a ratio of content that the same in the page versus the content that's actually dynamically changing.

So watch out for that. That ratio has to be significant. You have to really make sure that page is big enough and the content you want to dynamically process is small enough for this particular algorithm to be efficient. But generally speaking, different types of AJAX events can be processed. You may process pre-coded types of events with JSF JSLibrary.

You may create your own JavaScript handlers, invoke [INAUDIBLE] services, invoke sockets, anything you've been doing so far in JavaScript in this course, would be perfectly applicable to the JSF runtime.

For more information on AJAX and its functionalities, look into JavaScript and HTML5 Develop Web Applications training course, which I've actually mentioned on quite a few occasions.

Earlier in this chapter, I've mentioned that apart from standard component libraries, JavaServer Faces do come with lots of third-party extended frameworks and additional libraries you might wish to use. To name but a few, PrimeFaces, Oracel ADF Faces, Apache MyFaces, IceFaces, OmniFaces. There's a lot of them. You may decide that you want to use these additional libraries together with, or instead of, the core JSF Library set.

And actually there is a short demonstration that I would like to show to you to demonstrate the use of these alternative libraries. This demonstration is best viewed after you finish the exercise for this chapter. Because what will happen is that in this exercise for this particular chapter, you will be told to build a JSF application using standard JSF libraries. And then that additional demonstration of mine shows you same application but build with PrimeFaces instead. It's a random choice. I could have chosen a different library, but well, why not PrimeFaces? It's just an example of what alternative libraries could do for you.

Well, I guess that is it for this particular session. So we've learned quite a lot about the ways in which JSF applications work. Most importantly, you have to remember the six-phase JSF lifecycle, because understanding of that is absolutely crucial. Everything else that is happening in a JSF application could be mended through your code, but that lifecycle is hardcoded into Faces servlet You fit in your code around the six phases.

So clear understanding what they are doing is important. Now your code deals in a page with just production of layout, with HTML and JSF UI components. In CDI beans with whatever other business logic events that you would like to handle, any other business logic. You may control navigation around pages, templating, validations, conversions, localizations, produce messages, use expressions to reference your code, and possibly add dynamic JavaScript processing via AJAX to the client tier of the application as well.

With regards to the exercise, what you're about to do in the practice for this chapter is create a JSF version of the application that searches for products, displays a product lists, and handles the product update. It is basically exactly the same stuff you've been doing with servlets and JSPs, but this time we're going to do it with JSF. Well, let's give it a try.

## 3. Developing Web Applications Using JavaServer Faces: Demo - 10m

Let's take a quick look at the demonstration that is linked to the chapter Developing Web Applications using JavaServer Faces. This demonstration is best observed after you finish the exercise for this chapter. Now, let me quickly switch to a remote desktop, where we have our exercises, and first, just out of interest, very quickly show you what your Chapters 11 solution looks like.

So if we look in the browser, we created a JSF application here. And let's search for some products. Let's find a product. So this is your product list page. Let's discount a cake. We'll heavily discount the cake, causing it to produce an error. That's too cheap. Yeah? Right. So let's discounted it a little bit less and update here.

So there you go. This is the solution code for your Chapters 11 practice. And what we're doing in this particular code is, we implemented the List and Edit pages with libraries, such as jsf/html and jsf/core. You can clearly see which libraries we're using here. So it's in the Edit page. So these are the jsf/html and jsf/core libraries.

Now, the demonstration that I wanted to show you provides an alternative for the product web applications. So close this one, and then open an alternative, which is in the labs/demos folder. That's the product web application from Demos. Let's open that and deploy it. So I'm going to deploy that application.

Once it's deployed, I'd like to show you what's different about this demonstration in the List and Edit pages. The difference is that here, we're using some other libraries. Apparently, we're using this primefaces library. So it's in the Edit page as well. We're using a library called primefaces.

Now, one of the last pages in Chapter 11 mentioned that JavaServer Faces can use a variety of third-party libraries. And this is an example of such third-party library. As you can see, still mixed with the JSF core library and jsf/html. So they're compatible. You could use them together.

There are some interesting bits that I would like to show you. So let's-- going to deploy the application. Let's just go back to the browser and click on this JSF Product Search. Immediately, you can see that the screen looks different. This is the result of using the primefaces library instead of the core library.

Functionality-wise, it's actually identical. It works with exactly same beans, exactly same CDI beans behind the scenes. No model code was changed at all. You can actually check in your demos under Chapter 11 folder, compare them, and you'll find that they appear to be absolutely the same in terms of the code of Manage Beans. So the change is only in a presentation layer.

Let's update the cake. Let's do the same error again and see what will happen. Update that. Ah. Nice. This is an error poll pop that emerged here, saying that price should be greater than $1. And let's update it to $1.99, and that product has been updated successfully.

Now just want to point out the bits of code that are used to create that layout, fancy components like date, calendars, poll pops, and this messaging facility. So shall we take a look at the Edit page. This component is called growl. This is what's displaying messages. Essentially, I'm using this one instead of the standard messages component. So my CDI bean displays the messages in just the same way. There is no difference in that sense, but it visually is rendered by a different UI element.

The breadcrumbs-- this bit, breadcrumbs-- is a component that shows you URLs from which you can go back from that page. So this is this bit here. This is the home. This is the list. So if I want to go back to home page, jump to Find Products, or let's say I want to go back to the product list, not Home but List. So that's breadcrumbs. It shows me the way I've traveled to the page as navigation links at the top of the page.

Also, another interesting thing is how we display these input fields. We're using the panel which lays out prompts and items nicely against each other. So that's that layout of a form. And also look at that interesting calendar component. Yeah, that's that pop-up calendar that we observed. So we're showing it as a pop-up calendar button and associating that with a field as well.

Please note, AJAX is built into the primefaces, the ability to partially update the page. So when I'm clicking on this update button, it says, update the growl component. Growl component, remember, is the one I was using instead of messages element. So that displays my errors or successfully updated form messages.

Some interesting things that are happening in the list as well. So same growl component, in case we got any errors, same breadcrumbs component, a panel show in products, and now, here we've got this data table component. And in the data table component, you probably notice that to select an item from the list, I just select the whole row.

And this is done with this additional property that primefaces' data table element provides, which is called Selection Mode, that allows me to select the current row and set its row key straight ahead to navigate then-- set it as current record and then subsequently navigate to the update to perform that record update.

Apart from that, the rest of that application uses exactly the same identical CDI beans that PM, which is the Product Manager-- our Product Manager bean has not been changed in any way. So this is exactly the same code you've used so far to represent your model, to represent your web components, the same converters, same stuff. So that's that Product Management bean. It hasn't been changed in any way.

I suppose this is where the power of the JavaServer Faces is at its most obvious. You can dramatically overhaul the layout of the application, its look and feel, gain additional features, including things like Dynamic C, within the page, with JavaScript and AJAX components. So practically no extra coding cost. You just use a different library. That's all there is to it.

So we've seen this particular example of chosen to use primefaces. But equally so we can have chosen other libraries, for example-- Apache MyFaces, Oracle ADF Faces. It depends, really. That's quite a few different options out there, with the help of which, you can develop a much richer user interface in JSF technology. Well, that concludes the demo.

## 4. Practice 11-1: Adding JSF Action and Event Handling - 24m

Let's take a look at the practices for Lesson 11. In this set of practices, we create Java Server Faces application, which contains same functionalities as the JSP application you've created before. To show the search form for products, display the list of products and edit the product. But this time we're going to do it with less plumbing code, with no custom servlets or filters or just rely upon Java Server Faces servlet to handle the lifecycle and events for that application, so to provide the JSF level of automation of our code.

Now, let's start with part one of this exercise. And in this part, we are preparing our application to be used by Java Server Faces code. Specifically, we'll modify product manager Bean, CDI Bean, to assist us in handling JSF events. And also we provide a date converter class to handle conversion between string and local date types.

You see, we have witnessed a similar converter before for Java Persistence API where we were converting dates and local dates for persistency reasons. And now we're going to do a similar thing for Java Server Faces because HTTP protocol unfortunately isn't really aware of distinctions between data types, and it's dismissing everything as a symbol string.

So if you want to use more sophisticated types, such as that of local date, I'm afraid you'll have to provide your own conversions. Let's start by opening a ProductWeb project in NetBeans and the product manager class that is in demos.model package. And add a new instance variable to it called name that will represent our product name. With that instance variable, we'll also need some Getters and Setters.

So we're going to go to-- let's close it. If you've got any other files open, you can close them now. We're going to go to the ProductWeb project, and then we're going to look for the product manager. And then we add another variable here, which will be-- well, our product name, basically. And I suppose, if you want any Getters and Setters for it, insert code, Getters and Setters for that product name. There you go. That's the get and set name, capabilities.

Now you will add here a Java Server Faces action method. Remember, the action method is the one that returns a string, which page you go next. And so your navigation case name basically. And we'll have here a method which we'll call show least.

I suppose the point of this method is to display the page which represents the list of products. So show list, again, we'll add that, well, anywhere to the code of product manager. So eventually we'll add logic here that will determine, well, how we decide if we navigate to the list page or not, so what sort of logic we expect to place there.

We will use that variable name to search for products. So we put the value of product name into the named variable, and then we use that named variable to run code, find product by name method and ProductFacade to locate the list of products, OK. So that's the logic that we'll add to the operation.

ProductFacade is already injected into the product manager Bean. Products is already a variable here, and it's a collection of products. We used that before to populate this collection of products from the query. So we added that behavior to the code.

Now, check if the list that you're retrieving is empty or not. Are you actually getting products? Because if you're not getting any products, you probably shouldn't navigate to the list URL and should stay on the same page. And I suppose you could also produce a JSF message that will inform the user, in the form of a warning, that no matching products were found and add that message to the FacesContext.

If you return now from the show list method, you stay on the previous page. You're not navigating. If you return list, well, the assumption is that list will be the next page's name, or navigation case. So you will navigate to another page, if the list of products is not empty.

So that completes the code of the show list method. Make sure you import Faces message object. So you can have two circumstances if the product list is empty, display that warning message that you didn't find any products, add it to FacesContext, stay on the same page, return now. If you did find products, and return the word list and proceed to display that product list page, OK.

Now add another action handler here to display the edit page. We'll add extra logic there, but basically we will want to return the word edit, to determine if we want to go from the list to the added page, yeah. So that's when the user, I suppose, selects the product in the list and wants to navigate down to the next page. So again, extra code will have to be added here.

Specifically, what code? We would like to determine which product the user selected in the list. And then based on that information, display that product in the added form before we go to that edited form, before we return to navigation case, we just want to make sure we know which product was selected, OK? So how do we achieve that?

Well, there's several ways of achieving these functionalities. First of all, you may pass the parameter to this method. So you could accept the parameter here. Passing parameters to methods is actually a Java EE 7 new feature we've graphed to Java Server Faces. So you could do it, yeah, you could pass parameter of say, product ID, for example.

But if you're not using JSF Action Method parameter, the alternative is to use the parameter that is passed through a URL. So that's also possible. In which case, you'll have to access that parameter from the servelet environment. That's what this code is doing. FacesContext.getCurrentInstance and get an external context.

ExternalContexts represent a servlet environment outside the JSF runtime. And a servlet handles the servlet's requests. So you can gather request parameters, request parameter map, and retrieve the request parameter called PID.

This particular approach is not exactly what you'd normally use in Java Server Faces runtime because you're not using JSF ability to bind values but use a servlet ability to pass parameters. But you see, the interesting thing about this approach is that it makes the URL, pointing to the added form, potentially book-markable.

It's a gap URL, and it has this product ID as part of it. So if you want to, for example, bookmark that, you can actually do it because the value will be transmitted just as a normal HTTP parameter. So that's the kind of code you then add to the show added page, yeah. So you're using HTTP request parameter PID. And then based on that, we decide which product we would like to use.

Of course, some extra coding will be required in the show-edit method. We just extracted parameter but we didn't actually select that product yet. So we need to find which product contains that ID. We can easily do that with a limited expression, processed in a stream of products. So here's that area. Let me reformat that code. You iterate it through a stream of products. And you filter in that stream while looking at which product contains that ID.

The moment you find the product like this, get it. Well, you only have one there so first, I mean, if more than one product matches that ID, but it's a primary key. So obviously you'll have the only product there.

And you set it to the current instance variable in the product manager which basically means the subsequent page, the edit page, can now display that product and its properties. And yeah, so we use that integer ID, we parse it, we converted it from text to integer, and then we use it in equals method to locate that product, OK.

So what else do we need to do? We need to add another method which will act as a handler for a formal date. This time we are going to do it as an action handling method.

So ActionListener, and that is the method that's void and accepts the action event as an argument, OK? There you go. Of course, fix the import as usual. You need faces.event, ActionEvent. That's the one you need to import, OK, and form out the code, lovely.

Inside that handle update method, we need to add a try/catch block because we could encounter some errors and exceptions during the update. So be prepared to handle these, try/catch. The product's update will be in the try/block and the error handler will be overseeing the catch/block.

Now let's start with the product update. What do you need to do is just basically take the product object and apply it to the ProductFacade through the update method. We can then refresh it by re-reading it again from the database to find it over again. And then if everything is fine, that will display the faces message which says the product was dated successfully. So we have prepared that everything is fine message.

And that goes into the try/block. Unlock the code, yeah. So that message variable, of course, needs to be declared first, OK. So there it is. I missed a step, didn't I. Inside the handle of data operation first, create that Face's message variable, yeah. And proceeded directly to try/catch. Wow, there you go. Yeah, so now we have that message variable declared.

A reason why we won't declare it ahead of time before the try/catch is that we could produce a success message inside a try/block, or failure messages in catches. Either way, we can then display what that message is to the user. And so depending on how lucky we are with our update. So this is the happiest scenario when we manage to complete the update successfully.

Now, what if we have some problems during that update? Let's manage some exceptions. How about getting the exception's calls and checking if that is an optimistic lock exception. And in which case, we will produce the message that says the product has been changed by another user, OK? Well, let's put it here.

Fix imports, reform off the code here. So from the exception, get a throwable cause. Check if it's an optimistic log. And if it is, then tell the user that the record has been changed. And let's just throw the exception further.

Now there is a note about it here, an unhandled exception will trigger the invocation of ErrorHandler servlet. That is the one we've written way before to handle general errors in a web container. So yes, what we'll recycle, essentially, is servlet's functionality, if they still work. We're still in the same container, OK, fine.

Now lastly, add whatever message we produce, either error or success message to the FacesContext object. That should be done after we finish the catch/block, before the end of the method. So that's the message we've managed to produce so far. It will be either that product of data successfully or the product has been changed by another user message, one of these.

A clean and build, so we've modified product manager. And added to it methods that we will be exploiting from our Java Server Faces application, handling the update, showing the Edit page, and show the list of products. Now we are ready to proceed to the next phase of this exercise where we create a date converter.

So you need to create a new Java class which will be called LocalDateConverter. And we'll put it in demos web package, OK. Make sure you are in a product web project, create a new file that will be the Java Plus, call it LocalDateConverter. Put it in demos web package. There you go, like so, finish.

What this converter should do, this converter should handle the conversion for a Java Server Face's runtime, a stream to local date conversion, yeah. So we'll open that up, and we've annotated as Faces Converter. Let's try that, Faces converter. So we did the GPA conversions before and now we're doing Faces conversions, OK. Lovely text.

The converter is declared. That's the name under which we'll be able to reference that converter later. Now, the converter for date, basic date, not local date, but for Java HL date, is already present in the JSF runtime. So you can just extend that existing converter, and just modify it to work with local date instead of date.

So you can extend the existing class which is daytime converter. Otherwise you have to extend generic converter. And it will be a little bit more work for us to do if we'll be extending generic converter, OK. But the principle remains the same because you need to override relevant conversion methods.

What are they? You need to override two methods, get as object and get as streamed. Let's do that. So insert code, override methods, get as object, get as string. So this is what we expect the converter to do.

On the one side, we expect it to handle the object value or the string value. The string value is what arrives from HTTP protocol for a request. When clients submit values, they come to our server as strings.

So the UR component that is handling the value sends it to us, and we receive it as a string. And well, obviously, the other way around, we have an object in our runtime, we want to send it as text to the client, so we convert the object to string value. So that's how the conversion functions.

Now we need to replace some code in these operations to provide a different conversion methodology because we're using no date, but local date instead, yeah? So what we need to do is replace the code and get a string operation first.

What we would like to do is set the date to year, month, date, pattern. Prepare the date object, check if the date value is null or not because it potentially can be optional. So we shouldn't really do the conversion if it's a null, yeah?

Otherwise, if it is not null, then we can convert date to local date, invoke super.getAsString operation to pass the conversion of date to the super return the result in that call, OK. So the date to stream conversion is already provided for us by the superclass. All we need to do is convert local date to date, and vise versa.

So here's an example of what you put into the method. Set the pattern, then check if the date is null or not. If it is null, don't do anything, just return null. If it is not null, handle the conversion of local date to date and then pass it on to the superclass for the rest of the conversion to string, OK? That's the body of the get as string method.

Fix imports, so it's java.Util.Date, and it's Java. Time. LocalDate and zone ID that we're using. Form off the code here, so converting local date to Java.Util.Date. And the other way around, the other way around conversion, is still a little bit below, similar pattern, year-month-date, yeah. Get the value from JSF UI element that we want to handle. And this can be done by invoking the super.getAsObject operations. So return us the values and object. Check if it's values, now or not. And perform the conversion if it is not null.

So that is the body of the get as object method. So try that out. Get as object. Make sure you've got all the correct imports and reform off the code.

So once again, telling the superclass what the date pattern should be. Getting the current UI element value, it's date. But then converting it to local date, yeah. That's what we'll return as that object.

Lovely, that's our LocalDateConverter, that's what we call it, FacesConverter, LocalDateConverter. That's it, we could clean and build that project. So let's do that clean and build compilation. And that concludes the preparatory part for the Java Server Faces exercise. We will now proceed to the next part of the exercise, in which we will create actual Java Server Faces pages.

## 5. Practice 11-2: Creating JSF Pages - 44m

Let's take a look at part two of Practice 11. In this practice, you create some JavaServer Faces pages to display product search form, list of products, and products update. We define JSF navigation rules, and we also modify this HTML page to add a link to start the JSF search.

Yeah. So we'll start by going to the product web project in NetBeans and create a new JavaServer Faces page. So JSF faces, JSF page. And we'll call it "Search," OK? Let's try that. NetBeans, make sure you select correct project, product web. And we'll create a new file. And that will be JavaServer Faces, JSF page. And we'll call it "Search."

OK, finished. Now that you have created this search page, note that we have a bit of a problem with the web.xml file. NetBeans has actually added automatically to the web.xml file a faces/index.html as an index page, which we never created. So it will, well, not properly work, really, because this is a nonexistent component, and it's just an error in NetBean's UI that it generates that entry.

So if you look at a web.xml file, it has correctly registered faces Servlet for us. That's fine, But That bit, welcome file with an index.html, well, where did that came from? Because we never really wanted that page in the first place. So quite simply get rid of it. Yeah? You don't need that entry at all. So remove that welcome file completely. We have our index page, just a plain HTML page, that's acting as our welcome file. And that's the default anyway, so just remove that part from the web.xml. That's it.

OK, so once it's removed, let's proceed editing the search page. First of all, let's place the view element around the rest of the page content. And let's make this page transient. Transient page means that we don't want faces Servlet to remember the state of this page. Right. OK, well, let's do that. So around the search page here in this document, we need to surround it with that view element. Put it inside the HTML markup, around the rest of the JSF content. Transient view.

And, oh yes, and close it of course, properly. So we open and we close it. Now, you really notice that you don't have that JSF library added to the page. So let's make sure we add that library as well. It's the JSF core library. And then you-- oops. I just accidentally typed. You close that view element.

So we make this JSF page transient because we don't want the state to be memorized for that particular page. We don't think it's important. OK, so you could start typing that view markup. Wait for it to appear from the dropdown list, and press enter, and that will insert the relevant registry of the JSF core library. Or just add it as kind of a really click on the side of the line.

Now let's replace the header section to provide a link to the CSS file of ours. We're going to use the same style sheet we used so far in other pages. We can use it in this page as well. So this is that part with the head section. Link towards the style sheet and give your page a title. "Find Products." Why not?

Next, now what we need to do is-- oh, just a very quick note. Yes, that's worth pointing out. This document has to be a valid XML document. It's not just an HTML file. It's an XHTML file. So there's a difference between how we formed the code in previous cases where we used plain HTML and in this case, where we use an XML HMTL. So that terminator of a markup has to be added to the link tag.

Right, in the body, replace the content in the body. That will basically display a form. Let's put here into the body just a form element. OK, so we'll place some content to that form as well in a moment. And what should go into that form? The form should contain a visual presentation of an arrangement, if you like, around the form, which we could repeat as a kind of a visual pattern as we used on other pages.

So we use our segments of layout for header, for navigation, for footer. Just put that inside a form. So this is exactly as we've been doing in the other pages. We just make some kind of a prompt for the user, for footer. A header, Find Products, navigation back to home page. And you know obviously further content, we'll remove that. And we'll add our own content to that area of the page.

OK, now inside the section element called content, this particular section element, let's add into it the messages markup, this one. And then is to display information or errors or warnings. So if we'll have any problems, and our product manager [INAUDIBLE] forms some messages, then we'll have a capability of displaying such messages. So this could be information, warning, or error messages.

Now let's create at list an edit pages to represent the capabilities of showing product lists and editing products. And what we'll want to do is replicate exactly same page structure as we created inside a search page. So in order not to repeat all of these previous steps, we can just clone the Search.xhtml file and then rename cloned copies.

So copy the Search.xhtml file, paste it twice, and then rename one of these copies to "List" and the other copy to "Edit". Take the Search.xhtml, copy. OK, now paste it. Web Pages. Paste and web pages, paste. Refactor and rename one of them to "List".

Actually, let me just very quickly check, because it's all case sensitive. Capital L and capital E. So make sure you're doing it in a correct way. One of them will be called "List," and the other will be called "Edit". Refactor these two pages.

So basically we want them to contain exactly the same structure as the search page. But we'll obviously need to change some of the bits, like is it Find Products or what's the footer information? So these bits will be changed in these two pages.

OK, now let's continue working with the search page. So open the Search.xhtml and add a panel grid layout inside that section just after the messages markup. What we want to do is just lay out items here in the form of a grid. OK, two columns in that grid. Two columns. What we're going to put into that grid of two columns, we're going to put there some fields.

First, let's put an output field that will be used to display a product name. So we need a label for it, and then the field itself. A label and a field. The label is quite simply this. Just product name label. Goes into the grid. So that will be prompt.

And then the item will be an input text. We'll call it "pname," as in "Product name." And we bind it here to product management bean name field. That's the field. That's the name field we add it together and set our methods to that bean in a previous exercise. We mark that field as required and specify the required message. If the user forgets to enter it. I suppose the required message, we could have picked it up from a resource bundle, I guess, verbalize it. But it's just hard coded at this stage.

OK, so put that field in, specify required message. That's it. So that's why it's the grid of two columns, to display side by side prompts and items, to lay them out against each other. OK, so any user visible text, including error messages, can be picked out by JSF runtime from resource bundles. But at this stage, we just sort of type that required message directly in. It's just a reminder that we could have verbalized it.

Now let's add a command button component. That will act as a find button. Click on that. And we invoke the method again that we have added to the product manager in the previous exercise. And the method is called "showList." The idea that the showList method would execute the product query, find some products, well, if any.

So we'll find that product capability, add that button to trigger a call to the page. That's it. That's our search form pretty much completed. So all the code tucked away in the product management bean, which is displaying fields and items. So search page is sorted. Recede into the list page.

Changing bits in the list page. We need to change the title to product list. So open the list page. Change title to "Product List." Change header to just "Products." OK. And what else do we need to change? The footer, "Select Product from List," of course, because we'll provide that functionality to click on a product in the list and proceed to update form. So the footer will basically tell the user that they can select the product from list.

And a slight change to the navigation panel. So what we'll want is a link back to the search page. So maybe you could-- I suppose, what does this say? Replace the home link or add? Replace. OK, well, I suppose we could have had both links back to home page and back to search page, but the practice says replace. Let's replace. It's not a big deal.

So however many links you would like to have navigate to other pages. OK, that's the command line component going back to search page. Lovely. Now we're going to produce, right after the messages element, a data table. We want to take the product management bean and iterate through the list of products. That list of products was presumably populated into the product management bean by the show list method.

And then assign each product an iterator to the variable p. So that's the data table in the list page after the messages section. Display that data table. Now of course the data table needs some content. So that would be a set of columns to display ID, name, price, and best before.

Each column would have a facet which displays the prompt, a facet called "Header" of the column, and the content of the column, which is just now for text, you know, with product IDs, names, prices, whatever, best before dates. So this is just the structure of your layout added to the data table. Format it nicely. There you go. OK.

So we have the data table, the displays, product IDs, names, prices and best before dates. Each one of these is a property, obviously, of the product object that we get from product iterator. Modify an index.html page to add navigation to the search page. OK, so that's pretty straightforward.

We now would have two versions of a search, the JSF version and a servlets/filter/JSP version. So these two versions of the search form are triggered from our index.html file. Where is the navigation component? Here's the navigation component. There is the navigation component that currently shows just that product search, which is the existing way of searching, and replace that with two links, one leading to the JSF product search, and the other one is the old sort of JSP servlet web filter mechanism that we've used so far.

OK, so we can basically now navigate from index page to the search page, from the search page submit the request to the show list method, using the product name find some products. And then show list, if it found some products, returns us the name of the next page where we should go, which is list. And the list can take the collection of products from product management bean, iterate through it and display us these products. OK.

What are we going to do next? Next we're going to define another Java Server Faces page. Oh, sorry. First we need to define faces-config.xml file. Yes, of course.

So we need to create JavaServer Faces faces-config.xml. Let's do that. Faces-config.xml file, just as usual, it will be located under the WEB-INF folder. So that's pretty straightforward. In the product web, create new file, JavaServer Faces JSF configuration, Faces-config under the WEB-INF. That's fine. Finish.

So this is the faces-config,xml file. Why would we define this file? Well, actually, that's because we might wish to control custom navigation rules. Right? There is, funny enough, in this particular exercise, it's not exactly mandatory to do it. Because you could just use the page name to navigate to the page. But if you want your pages to have nicer aliases, suppose the page name is not spelled out the way you want it, so you want to have a nice shortcut alias for navigation. Then you can create such navigational cases.

So from search page, you could go to the list page. From list page, you can go to the edit page. And from any page, you could go back to search. So that's the JSF navigation. OK. You could have just used page names, so this is really kind of optional, just to show you that you can organize page aliases.

You put that set of navigation rules inside of faces-config. That's it. So these are your navigation rules. OK, I suppose one important thing about it is that if you now refactor some page name, you change your mind about what it should be called, you don't need to modify the rest of the code, because we can refer to it under the logical sort of outcome, how to navigate to that page. So you wouldn't have to modify all other pages or CDI beans. OK.

Right. Such navigation case rules can be modeled visually in other editors. For example, in JDeveloper. Unfortunately, NetBeans doesn't give you the visual editor. I mean, there is some kind of a dialogue mode here. You can click on page flow, but that's as close as you get to the visual editor.

OK, so you could see how these pages are linked. Well then, obviously, you see that's not JSF specific. It shows you all documents in that application. So the ones that are not JSF as well. So, for example, this JSP, this has nothing to do with it. And obviously it only shows you those navigation rules that you've explicitly defined in the faces-config.

OK, now we can at the moment straight ahead perform the test of the search and list pages before we create the edit page. So this is kind of a self-contained part of the functionality. So we can just clean and build, deploy the project, and run it, and execute a search, and see how we can navigate around the application.

Let's give it a try. So clean and build that project. Deploy it. So product web. Deploy. Once deployment completes, then we can go to our PM URL. And start from an index page as usual to navigate around our application. Because we've added relevant links to the index page.

OK, so go to the browser, refresh the page so we now have not just product search but JSF product search as well. Open that. That's the form where we could search for our products. Let's just find all of them. And click Find. And that's your JSF data table displaying the ID, name, price, best before in the list of products.

OK, let's go back to the search. Let's forget to enter anything into that field. There's your message, "Please specify product name." So a field is apparently mandatory. Just to remind us where the message is coming from, search page, this is the message, required message, against that field. And the messages markup displays it as an error.

That's a visual style, CSS style. That is what determines the color of this surrounding box. OK, let's try to find some products here. OK, it's a conditional search. Let's try to find a non-existent product. "No product matching 'acme' found". Where that message came from? Let's take a look. So that is in the product manager bean. So our command button invokes the show list method.

So go back to product manager bean, take a look at show list. That's probably where I could do the extra space, actually. Just to make it look nicer. And it's querying the products. And if the list is empty, it's constructing the warning message, severity warning and with that name of whatever I've entered into the name field in a form, and saying that, unfortunately, you didn't manage to find any products like that. So that's how you're getting these messages.

Well, hopefully that all makes sense, so we could observe how we navigate around these fields. There are some interesting notes as to what you see in a URL when you're performing the navigation. So let's start again from the PM URL, just from the top. I click on JSF product search here. I'm going to Faces/Search.xhtml. Fine. That much is obvious.

I'm executing the search. And as I execute the search, look at what's going to happen with this field with that particular URL. So it is displaying me the worst search. Why is that? The output is from the list page, but the URL says search. Because in JavaServer Faces, the request is recursively submitted to the same page always.

So search form submits itself to itself, handles the first five phases of JSF life cycle, and then on the phase six, render response, it is governed by the value returned in the-- well, this string value returned by show list returns the list value. So it says "I need to go to the list page." Faces-config says "List corresponds to this list.xhtml." If that's the case, response will be rendered from this page. That's how you see that list of products.

But the URL to which you submitted the form, this form, this form is the current page, Search.xhtml. Now, let's just say if I will click on command link here to go back to Product search, what does that mean? it means I'm submitting this form from a list page perspective. So if I'm clicking on this product search, watch what's going to happen with that URL.

The URLs says list, because I submitted the list page to list page. And then after it handled whatever its life cycle, then the navigation case name said, "Well, show me the search page." And that's where the output is rendered from. So in other words, in this JSF navigation, the URL is kind of one page behind what it is that you're looking at.

Unless you use direct get method. So maybe instead of command component, you can use go component. The go components basically are not handling the life cycle of the page in the same way. Or you use another property, and a PDF mentions that property. It's called "faces=redirect", or redirect markup in navigation.

So that allows you not to submit the page to itself but directly go to another URL. But of course doing that could break the life cycle. Because you're not applying page form values to the manage bean of the current page if you're doing the redirect. So that's just an interesting side effect of doing the JSF navigation, which obviously the exercise asks you to explore.

OK, good. So we figured out how messages are displayed and how the navigation works. And now let's-- just playing around with different values, see how you produce the errors. Well, we did that. Now let's change our code a little bit and make the ProductManager CDI bean session scoped rather than request scoped.

OK, just before we do that, find me all products starting with "co." I'm looking at these products. Go back to search. Field is empty because the manage bean, product manage bean, ProductManager, is request scoped. So it only works between me submitting the request here and me getting the response here. Then the condition is retained.

The moment I'm going back, I'm creating a new request, and that creates a new instance of product management bean. So what's going to happen if I would go to the product management bean, and I'm going to change here it from request scoped to session scoped. Let's just play around with that. javax.enterprise.context.SessionScoped. Yeah, that's the one you want to do. OK.

Also, we need to make it serializable. Because anything you add to the session really ought to be serializable. OK, so actually see the warning here? So it says that basically it's not usable, because it cannot be [INAUDIBLE] implements-- oh, come on. My typing today is way off. Sorry. I'll just-- OK, just making typos.

Right, anyway, java.io.Serializable, fine. Implement in that interface. Recompile, redeploy. So we're going to change the nature of the product management bean and see how that would affect the application. Do the test, deploy again. While this is deploying, let me quickly show you the PDF again so we make these changes. We're told to recompile and deploy, and just basically see what's going to happen with this condition again. How the page will react.

OK, so deployment is finished, yes. That's fine. And we go back to the root of our application. We click on JSF product search. We enter the condition, we execute the search, and now we go back. Value is still memorized by the product management bean. How does it work, once again? Product manager is session scoped. In the search page, and it has that variable name. In a search page, the field, input field, is tied to that PM name.

When PM, product manager, was in request scope, it was just resetting itself on every new request. And now, because it's in a session scope, it now retains the instance for duration of my session, so I can see the same value that I entered before. It's part of that life cycle now.

OK, so next we'll modify the list page to navigate to the edit page. So we'll start engaging with the editing functionality. What we want to do is replace the current output text for the product ID with a command link to navigate to the product ID and show the edit behavior.

So command link. Go into the list page, finding that product ID, that output text for product ID, and replacing that with the command link. So it will be clickable item, the product ID that you can click on. There are two ways in which you could have handled the passing of parameter to the Show Edit Page. You could have added the parameter here. That's a new feature in Java EE 7, an ability to pass parameters right here. So yes, that's possible. Could have done product ID like that, pass the product ID.

Or you could have passed it as sort of URL parameter, URL argument. If you're passing it as URL parameter, that is done with f:param annotation. There you go. So add that inside the command link, saying that when we click on that, we'll have a URL parameter p_id.

The product manager at the moment is designed to handle the URL parameter. That's where Show Edit Page is doing it, getting FacesContext, CurrentInstance, ExternalContext, and getting that URL parameter p_id.

And this is not particularly convenient probably from the JSF point of view, because passing a simple argument in a method is obviously easier. But that creates a get method URL that you can actually bookmark. So I don't know. Maybe in some circumstances that would be what you want to achieve.

So anyway, the practice just shows you that as a possibility. If you want to construct parameters that way, you can. So now we have a capability of navigating from list to the Edit Page. But of course we haven't sorted out the Edit Page yet. So we need to change the page title. That will be Product Edit. Open the Edit Page now. There it is. Title.

OK, let's call it "Edit Product." Why not. What else we need to change? Header, also Edit Product. Let's do that header as well. OK. Then we need to change the footer, or change product and click update. OK, stands reason.

Right. And now let's add next component to the page. That would be the navigation component. Basically, we need to replace the command link. Product search, put that inside the nav element. Because at the moment, we have a reference towards the home page. Well, I suppose we could have retained it, but we'll just replace it with this search. OK. Nicely format that. And start working on the content of the form that we're about to add here to Edit Products.

Before we do that, though, I would like to quickly comment on the immediate property, this one, immediate true. This property implies that you are not validating this whole form when you are clicking on that command link. You're not submitting the whole form.

Well, I guess that stands reason. If you've got some fields inside this form that you don't want to validate when you go back to the product search because you're not processing the update. Well, another button that will process the update, of course that would not be the immediate true property, because we would like to submit the whole form in that situation.

But if we just want to discard changes, whatever we made in this form and go back to search page, we certainly don't have to submit them to the server and validate them.

So the next phase of this practice, we're at a panel gird just after the messages section into the page inside a form. So that's our content section. And then inside this panel grid, we will add prompts and fields that are arranged in a grid, prompts and fields for all of our items. There will be output label to represent the ID. So let's add that here.

Then we need an actual item, input text to represent product ID. And that will be read-only, because we don't want product ID to be updatable by our users. It's a primary key of the record. I suppose you don't want to update that.

Continue to the next item. That would be product name. So label for that. And then of course the actual input field for the product name, it should be required, mandatory. And if you forgot to enter it, there's a required message. I suppose you could have placed that message into resource bundle, but well, you may just add it to the page for now.

So we have the name. Then we have the price, of course, product name, product price, label for price, and similar to the product name field for the product price. Again, it's a mandatory field associated with a required message. And so we enter that. And almost there, output label for a best before date. Let's add that.

And finally, best before date, but it's not mandatory. It's optional and associated with a local date converter. OK, so remind you, that was the local date converter you created before. You called it "LocalDataConverter", and that's precisely how we reference that in our converter ID property.

Lastly, we need some kind of a button to submit that form. So command button to process our update. We're almost there. So format that page nicely. That should do it. And we're ready to test. So we have a form. We submit that by update button. That's not immediate button. That's actually processing the whole form.

So make sure the project compiles, and then update the deployment. So deploy the project on a server. Whilst it's deploying, let's quickly look at what the test procedure for it is like. Simply go to the PM URL, start from there, and proceed to the product search link.

OK, well, let's make sure it deploys first. Yes, deployed successfully. OK, just go to front page. Click on JSF Product Search. Specify what it is that you are after, which products you're looking for. OK, click on whatever product. You can now do your updates.

So let's change the price here, process the update. That's fine. It's processing nicely. Let's make an error, see what's going to happen. OK, an update. Ta-da. We're getting the error as expected. That's fine.

And if we don't want to fix that, just discard changes. We can go back to search, and that would not cause the validation of the form because of the immediate property that we set.

OK, well, that's the end of this practice.

## 6. Skill Check: Developing Web Applications using JavaServer Faces - Score 80% or higher to pass

Skill Check: Developing Web Applications using JavaServer Faces

View Skill Check
