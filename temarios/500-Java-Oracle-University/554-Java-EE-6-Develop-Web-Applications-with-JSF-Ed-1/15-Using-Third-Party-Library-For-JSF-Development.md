# 15: Using Third Party Library For JSF Development

   * Using Third Party Library For JSF Development - 35m
   * Activity 41,42,43 - 52m

## Using Third Party Library For JSF Development - 35m

Let's continue with the last chapter 15, using third party libraries for JSF development. In this chapter, we're reaching to this point, the last topic, used third party library for JSF development. And in this chapter, we're going to talk about the third-party libraries which are available.

And we will examine and apply the PrimeFaces libraries. And we'll discuss and use Trinidad libraries and see how they're going to be helpful in developing web applications using JSF. And the end, we'll talk about that, in case you'd like to use the Trinidad skin and give a different look and feel when you display the pages in a mobile devices, how you are going to implement a different skin but for the mobile devices.

Third-party libraries, the topic. And then we start with the PrimeFaces. We have some demonstration on the prime faces. And then we'll discuss Trinidad libraries' features and the uses.

JSF component libraries. Component libraries are what? They are JSF implementations. You have multiple implementations available in the market for the JSF 2.0 API. You see that, here, these implementations, which we say are component libraries that we're going to get it from there, they have enhanced versions of standard components, additional components, client side validations, AJAX enhancement, server polling and push technique, and for the mobile support.

So there are several implementations available for the JSF. That is PrimeFaces, RichFaces, ICEfaces, ADF Faces, and MyFaces Trinidad, and Apache Tomahawk libraries. You see that here.

JSF, it is 2.1 or 2.0 which we're using it. It is just an API. It is a part of the Java EE 6, 2.1 or 2.0. Now, the server that you're using for the Java EE 6, this should provide implementations to you for this specifications. With above logic and the glass first that we're using it here, in the Oracle, we're going to get the implementations that is from the Mozilla project.

Now, if we use the IBM WebEx pair, you're going to get IBMFaces if you use a server WebEx pair. Similarly, if you use Tomcat, you're going to get MyFaces. That is the name of your implementations of JSF.

And we have additional third party libraries available to be downloaded that you can use in whatever application server you'd like to deploy them. PrimeFaces, that you can use it. And RichFaces, you're going to get it if you use a server like JBoss. So multiple implementations you have in the market.

These implementations provide HTML component libraries. And they may decide to have some additional, new custom components that can have better integration with their products. They can have the client side validation built in over there. Ajax enhancements they're going to be provided built in with the components. Polling and push techniques they can provide over there. And the mobile support they can also provide. It depends on implementation to implementation.

So WebLogic and the GlassFish here in Oracle, we have one more implementation, ADF Faces, that provides more than 200 RichFaces components with additional behavior and capabilities with built-in Ajax support. A lot of things are there in ADF Faces that you can find. And this is an Oracle product.

Selecting a third party component library. How you're going to select what component library you'd like to use in your project? You need to first find that library that you're going to use. Does it support the latest version of JSF? You're using WebLogic server, using GlassFish server, and you want to download PrimeFaces or any other faces that is available in the market, whether they support the latest version.

You're going to use those libraries for what purpose? You should check the documentation to find if they have some additional components, they're providing some extra components with additional behavior. Does it simplify development process? Does it support mobile devices? Does it impact performance? Check all those things, and then you decide to download and use one of the third party components.

PrimeFaces open source framework, which is available to you. It is a lightweight library. We have a rich set of components available, for example, HtmlEditor, Dialog. AutoComplete is there. You do not have to type Ajax code or create some composite components, custom components. It is all available there.

Chart capability is there in PrimeFaces. So we can use PrimeFaces for those purposes. Ajax push support via WebSocket is available to you, and mobile UI kit that can be used to create mobile web applications for handheld devices. Skinning framework with 35 plus built-in themes and support for visual theme is available to you with the PrimeFaces.

To download PrimeFaces, you can do what? You can go to this URL and download PrimeFaces JAR file that you can attach to your projects. Ensure that you have Java 5+ runtime environment, and JSF 2.x implementation can be zero or one. You can check the documentation that you're downloading that library, it is for JSF 2.0 or 2.1, or it is for the previous version.

Add the PrimeFaces jar to the class path. And then you can start using them in your pages by including PrimeFaces provided URI to have those components be included in your page, the primefaces.org/ui.

PrimeFaces component examples. AutoComplete components, calendar component, a split button, tab view, pie chart, you're going to get it from there. There are several other things available in the PrimeFaces that you can explore with their documentation.

See here, the p:calendar. The PrimeFaces component calendar has value binding. So JSF components, so it will participate in the page life cycle processing. You can say mode equal to popup, navigator true, and you can also specify a pattern.

So navigator true, you're just going to get here a navigator available to go to next month or year, like that. It will give you the text box here to type date and time because you said pattern for the date and time. And you can also click here. That will show the calendar box, allowing you to select the appropriate date and time.

A split button component that you have here. See the split button? A menu bar type of a split button can be created and placed in your JSF page containing several other menu items. So we're just going to have a split button value equal to save. That is split button. You can specify action listener what you want to do if you click on the Save.

Under that, you can have multiple menu items-- menu item one, menu item two, menu item three. If you want to have a separator, you can use separator as well. That will show you a line. And this menu item, you can specify the value, and of course, specify action listener what you want to do when you click on this button, means menu item.

The next one Apache MyFaces Trinidad. This is, again, one of the powerful implementations of JSF that includes a large, enterprise quality component library. You're going to get several capabilities and rich faces components over there, and also simplify the page designing, giving you right to left capability to type any languages in the text boxes, partial page rendering, and most of the components are built in. You do not have to use f:Ajax to have this capability. You just have to take the help of the properties and use those properties to enable partial page rendering.

We have the client side validation integrated in most of the components, dialog framework. PageFlowScope. It is the new scope that they introduced to hold the value while communicating between pages. Improved client side state saving.

CSS-based dynamic skinning available here, allowing you to create a skin. What is a skin? A skin contains CSS file. You say a skin, it is actually a collection of CSS file, images, and resource bundle. You can say bundle. For localization, you can put them in a skin.

It's not necessarily that you can use all of them. You can use only CSS. This is the main part of a skin, to give a look and feel to your pages. Right now, what you people are doing, you're importing CSS file on each page, and then you're allowed to use their classes to give a look and feel on the components.

With a skin, you don't need to do this all. MyFaces provides a configuration file to you, like Trinidad config file. In this file, you can specify what skin you want to use. Just give the name of the skin. That CSS file will be available to your whole applications and their style classes. And all those styles that you type there, it's going to be available to each and every page so that you can use the consistent, common look and feel.

You can also decide the skin file to be selected at the runtime. Using those Trinidad config values, you can specify EL to the managed bean and let the managed bean return the name of the skin file. So that's why they say dynamic skinning. That is what you're going to get here.

Mobile support. Mobile supports what? You have several components which are compatible with the mobile handheld devices. Apart from this, you can also change the look and feel and size, width, height of the components so that they can be displayed properly with a mobile browser.

Configuring Trinidad. To configure Trinidad, what you can do it first go to Apache MyFaces websites and download those files. And once it is downloaded, you have to attach them as a library. But in the web.xml, you need to use the URL pattern adf/* for Trinidad components, which will be controlled by a different servelet named as ResourceServelet.

So you have Faces Servelet, responsible for JSF runtime. But to process Trinidad components, you can take the help of ResourceServelet provided by Trinidad libraries. And the faces-config.xml, you can say default render kit is going to be from MyFaces. We will see this with examples.

I have an example here, Trinidad path example, which is available to you in Lab folder. But this is giving me error right now, showing me in red color because attached library is not available. You see the right click here, it shows resolved reference problem. Trinidad implementations and API library is not available.

If you have to use those libraries continuously for different projects, rather than attaching them here one by one, add JAR folder and attaching those libraries where you have downloaded them, here they have store them into Resources folder. They have here Trinidad Assembly. And there, they have a library available that you can attach directly.

But what they have done here in this practice environment, they have created a library here in the NetBean. You can go to Tools and say, Add Libraries. And here, you can create a new library and attach the JAR file so that it's going to be available to you to the NetBeans list of libraries. And then you can attach them in any of the projects where you want to use them.

So let me find what is the name that they say is missing. It says, Trinidad impl 2.0.1. So I'm just going to copy this somewhere in Notepad. Let's put this here. The second name, Trinidad API 2.0, because they already have attached this in this example. So I must use the same name. Otherwise, we need to configure everything. And I'm just going to use the same name so that it will automatically resolve the reference issue.

Now, that's the name. I will use it here to have a library created, new library. First, I'm going to type this name, Trinidad API 2.0.1. And this library, I'm going to say that a JAR file to be attached, it is going to be from Labs, Resources, Trinidad, Lab, API. I have attached the JAR file with this name.

We've created a new library. For implementation of this API, type the name. I'm going to look for the JAR file for implementations. As soon as I say OK, this reference problem will be resolved. If you see the libraries, you see implementation API is attached. And PrimeFaces is attached there as well. Good.

Now, if you see that, run these applications. If you see PrimeFaces.xhtml. This is showing me PrimeFaces.xhtml, where you can see we have the link here for documentation, for demo, that you can use. This is going to PrimeFaces website. And you can see several examples that you can try for PrimeFaces.

If you see the TestFaces.xhtml, it shows a component, calendar components, PrimeFaces components. And this is going to show you autofill. You need to type appropriate values. You just check it, what the code they have written in the TestFaces.xhtml.

TestFaces.xhtml, they're using PrimeFaces. Everything is the same that you start from the beginning, just like in JSF. But you're just going to use AutoComplete. The value equal to autoBean.tx1. And the complete method, you say autoBean.complete.

So we have the managed bean. See, no Ajax, nothing. It is by default implementing Ajax. AutoBean.complete, if you see that here. This is what is returning some array list with some number. Like they say query one, two, three, four. Good.

So that's what is going to be autofill here that you type in the text boxes. And you're going see the autofill characters with the query that you type there. So all the errors now are resolved. Reference problem is resolved now. We can restart these applications.

And then see now, it's here showing up the link. And the first link here, welcomePrimeFaces.xhtml, it is going to open a page that shows-- see, this is the split menu that we have. So this is one option that we have here. If you click on Demo Documentation Forum, it will take you to PrimeFaces websites.

We have here TestFaces.xhtml that contains AutoComplete components and the calendar components. That is going to be the PrimeFaces. Now, see that here, simple form components followed by Trinidad, TrinidadForm.xhtml.

Form component. If you see the code for the Trinidad form, the whole code is going to be simplified. That is the form. See this, HTML element is not needed. We start with TR Documents. We have all those things here. Namespace added. And we say title equal to facelet title. The title is going to be part of the root element.

TR Form. Input text from the Trinidad component library. Say ID equal to name. Label equal to name. See, this was the label in your modular JSF implementations which was used only for error purpose in error replacing the ID part. But this is the label which is actually going to be here displayed as a label.

Value, you can have the value binding. Required properties, command button is all the same. So your code is now going to be simplified.

Now, if we go to the next one, formLayout.xhtml. See the form layout? Open this code here.

In this, we have Trinidad form, and we got panel form layout. Panel form layout. See here, we have a component one, component two, component three. One, two, three. And see this all aligned properly. You do not have the create panel grid. It's all aligned.

Second one, second form. You specify here rows equal to 1. You set rows equal to 1. Here, the number of rows is determined by the number of components that you have with each line. And now, see that here, which says rows equal to 1. Single row. That's why this component is going to be available in a single row.

Here, they say facelets. I can use facelets. I say this form at the bottom, footer, I want to have a command button. See that? Command button is going to be placed at the footer.

Tabs.xhtml. The Trinidad components that's providing you tab A, tab B, multiple tabs you can have. Go to tabs.xhtml. You'll find here options. See, Trinidad panel tab, position above. TR Show Detail items. You can have multiple Show Detail Items. We just have two. That's why we have got here two tabs. And you can specify the title for the tab. And within this title, you can decide what you want to see in the tab one and the tab two.

User agent. It's an example that helps you to find the request from the client is generated by using a mobile browser or the desktop browser. Say they say, is mobile user agent bean mobile. This is not interpreted properly. We need to check the error in userAgent.xhtml.

In userAgent.xhtml, they have typed here the browser name, and they're typing here the EL. That needs to be processed. Now in this case, it is not being processed. You know why? See the URL. In the URL, Faces is missing. So there's a problem with the link which is given in index.xhtml. That is using userAgent.xhtml without Faces.

It's output link, so I'm just going to type it here, faces/userAgent.xhtml. See that now, it's telling you that the client had generated request for this page from Firefox. That's a browser version. Minor version is mobile is false. And that's what the user is in.

You know what? We're taking the help of the programming. This userAgent.xhtml is calling a managed bean and getting the value from there. In the managed bean, they have written the code to read the user agent value that contains all the information. It says that this is going to be a Firefox. See? It contains the Firefox browser version and the minor version.

And if you have a mobile word found in this user agent that will let you understand that this request is from the mobile browser. Since it could not find the mobile word in this user agent, it is saying false.

So we see the code. User agent bean. We have some properties. The value of these properties, you will assign it. In the constructor, they're calling external context and they're reading user agent header value with the help of request parameter map, which will read this agent value.

And then they have some code here to read this part, Firefox. They're just going to find whether this request is from Android phone, mobile phone. Say, lowercase user agent in desktop. So just converting all the cases that you have here in lowercase so that there will be no mismatch in finding the string. Say, if it is containing mobile, it is going to be true. You will see it here displayed false because there's no mobile word available in the user agent.

Similar, it checks whether it's Android. And it's also reading the browser name, length. For that, they're simply taking the help of the service client to find the name of the browser from here to here, and then browser version, and then minor version. For that, they have written the code.

That's what here they say that in Trinidad, you start with TR documents and have all those namespace URIs added, along with the title. That's going to simplify your page. In JSF that you have implemented so far, you're using form like this, but you specify output label, text, some messages, command button. That's again going to be simplified using Trinidad.

Form Layout. You just got the panel form layout, which will have this alignment properly. If you don't use the panel form layout, you may see the alignment like this.

Panel tab. That shows the two tabs to you with showDetailItem. You can have multiple tabs, as I said earlier, just by typing showDetailItems. And you can decide what you want to have there within this tab one and tab two.

Trinidad skinning. You can create a skin in Trinidad. This allows you to create a skin. A skin contains CSS, images, or localized strings. Typically, it is used with a CSS file to give a common look and feel, where you can decide how your components are going to be resized. It is displayed in a desktop browser or if it is displayed with a mobile browser. We can control the width and height, the color schemes. Everything, we can do it with a skin. And here, you can specify CSS file.

The available skins from Trinidad is simple, minimal, and this is what is the default one that you can use directly. They're the default skins. You do not have to create a skin. You can just simply use this type of skin. For this purpose, you have to use trinidad-config.xml. And here, you can specify the name of the skin that you'd like to use.

If you want to create a skin, you have to create CSS file. In a CSS file, you can have style classes, and you can provide styles to the components as well. To provide the styles to the components, you can use AF and specify the name of the components. And then you can say how they're going to look like. You can specify the size, color for the particular components.

So you can have multiple skins. Skin one that can be used for the desktop browser, a skin two that can be useful for mobile browser, which will have the same style classes, the same selectors, but with different styles.

In trinidad-skin class, you have to create a skin name. So here, we actually create a skin family name and let that skin family be associated with the CSS file. In trinidad-config.xml, you will specify here a skin family name that you'd like to implement in your applications, or you can decide it at the runtime.

So I can hear type EL and call my bean properties to give me the name of the skin. You can call a skin name. Method from the bean is, in fact, get skin name, which can return the name of the skin after verifying the request is generated from mobile device or from desktop device.

Or it can take the user request. You can have the options here on the top with a dropdown list box from the main page providing the list of the skin names that user can select for different look and feel. So this managed bean can read the user request. You can update this value [INAUDIBLE] properties. And then you can decide here a name to be returned. So your choice how you want this to be used.

If you want to detect a user agent for the mobile devices, all those things, you can here read userAgent form, getRequestHeaderMap, properties of externalContext. And then you can find if mobile text is available in this user agent or not. If yes, it is going to be from mobile browser. Else, it is from simple web browser from the desktop. That's all about this chapter.

## Activity 41,42,43 - 52m

Let's continue with the practice for lesson 15. And in this practice, we're going to see how to take the help of PrimeFaces, use their components on our existing DVD library applications. And Trinidad components library, we're going to use it here. And we're going to see how to develop a mobile web interface for a given application.

Practice 15.1, one using PrimeFaces component library. Here, they want you to open the DVD library project in NetBeans, and just going to set up the library if it is not already configured. And then we're going to start using PrimeFaces component.

Let's see. We have the DVD library here open. And now if you see what they say, they say using Service tab, NetBeans start WebLogic server. If it is not running, you can start it, and then add the PrimeFaces component library to your project. For that purpose, you have to go to DVD library Properties. And there you can add PrimeFaces from the Components tab and click OK. So let's do this.

I'm going to click on the Project Properties. Project Properties. And here we have the liability part. And there, we need to add PrimeFaces.

We can take the help of framework as well, because here they have the components. And you can select PrimeFaces so that this library can automatically be attached. This library is given in your NetBean. Here, we have the list of [INAUDIBLE] libraries. There, they have a PrimeFaces library included that you can directly attach it in this library. Say OK now, and see. Now if you see, PrimeFaces 3.2 JAR file is added.

Now what next? Creating CDI Beans for the Chart Properties. We're going to take the help of chart components from the PrimeFaces. And for this purpose, we will create a name bean. [INAUDIBLE] genre chart bean. We'll just create this one.

And for this purpose, you go to your source packages, com example.beans. And there, we can create a Java class with a name Genre Chart Bean. Finish.

And now what you have to do is you have to make this name bean. And for this purpose, we can implement quickly [INAUDIBLE] interface at name annotations, at session scope. You can check whether they want you to have a session scope. Yes. And give a unique name to this bean class, say chart bean. That name you will use for the EL.

Fix Import. Here's a spelling mistake, so you fix it. And then say Fix Import. All done.

Now, in this name bean, what they want you to write the code. They want you to have a [INAUDIBLE], pie chart model. You're going to have here setter and getter for this. Rather than having setter, you can have a create pie model that can instantiate this object and assign some values to this, along with the title, or you can say the label that you'd like to display in the chart.

I'm just going to type it here in my managed bean, or name bean. And now see that we have got here getter. Rather than creating a setter, we have here create pie model that we can call to initialize this member, pie model. Good.

Once your bean is created, now they say you can refer to PrimeFaces website to obtain more information about the components.

Next is create new Facelets in the [INAUDIBLE] node. And in this case, we're going to create a chart.xhtml here in this web page. New JSF page. Give the name to this chart. Finish it.

Once this page is created, appropriate namespace binding because you want to use HTML components. You want to use JSF core libraries. You want to use Facelets. And of course, PrimeFaces namespace space URI so that you can use their components as well needs to be attached.

So we already have here JSF HTML with us, and we're just going to attach these three more namespace URI. Just copy, paste it here so that we can make appropriate changes. What they say, JSF core. So we're just going to say JSF core f.

Add one more. That is going to be Facelets. We can say JSF Facelets. And here we say UI. And finally, we can have this PrimeFaces UI component added. And then close this HTML.

So all the namespace URIs added. Now you can proceed by adding a pie chart tag into your XHTML page. Since we are implementing a template here, we're going to have the common look and feel across all the pages in this application. Don't forget to use UI compositions and use master layout so that the same design can be implemented here as well.

Under the UI Compositions, you have to use UI Define so that you can decide what you like to display at a particular section. For example, here, they say UI Define heading, and they want here to display a message, welcome list message from the resource bundle file. And that will display the DVD size number, how many DVDs you have there in a database.

So we'll just put this here. UI Define is one UI Define, and then we have Output Format displaying the messages, and close the UI Define. What this has done, you can proceed to the next section, like in the content.

In the content, they want you to have a different style with the overflow options so that you can get horizontal or vertical scrollbar. And thereafter, you can proceed with form and have a charts created over there. That is all you have to insert it with the UI Define content.

So UI Define name content, and everything is-- I'm going to put it here. We have the form. Under the form, we have the pie chart, which in fact has several attributes.

You see that here, they have a value binding with a ChartBean.PieModel. ChartBean.PieModel. That means they're calling this one, get pie model. Form. [INAUDIBLE] is closed now, and then UI Define closed for this content. UI composition body and HTML is closed now.

And then next what? They say add a link to view the chart at the left bar of the page in the following way. What they want you go to a section DVD library folder. And there you have a sidebarleft.xhtml. There you have several command links available to let you navigate to different pages. Have one more command link added over there so that you can go to the chart page. So this is the command link that we want there to be added in section DVD library chart sidebarleft.xhtml.

Let's see the place. They say here you have a link to go to-- perhaps you have to go to log out. We have here log in as well. No problem. We can insert here. One more link just to let you go to chart.xhtml.

Remember here, the chart, it is an uppercase. But in my case, it is in lowercase. The name is in lowercase. We'll type the same as the name chart. That's good.

Now what next? Modify the Message Properties files for both the languages. We have German and English. And they say go to com.dvdlibraryresources. They have Message Properties. And there, go to View Chart. This is something that you need to insert because this message, you're using it here in the command link.

So I'll just insert this in English, resource bundle. And then in German, resource bundle. That's there, message.properties. Anywhere you can insert it. Let's say here I'm going to insert it.

Save it and then open the second one. And there, you insert the same thing with translated message. Same key name. The value is going to be in German language. Save it.

Now what else? They say deploy DVD library project, run it, and test the view chart options-- Duke, Welcome1. See if it is going to show you that particular chart or not. We can try this.

I just have inserted here one paragraph so that the link can be displayed with a different line. And when I'm clicking on this View Genre chart, it is going to show you this PrimeFaces component chart. So that's what here they wanted you to try it. And once it is done, we will move on to the next practice.

Next practice, 15.2, we're going to start using Trinidad component libraries. We want this to have Add DVD like this. See, DVD item. And the second part is going to show you DVD details.

So how you're going to have this type of components is available to you in Trinidad component libraries. And for this purpose, they want you to go to NetBeans and there, insert some of the library names that can be mapped with the JAR file for Trinidad API and implementations.

At the time of demonstrations when I was giving my lecture on this chapter and I had to demonstrate a practice example, at that time, I had actually configured this. So I don't have to repeat this. But if it is going to be first time for you, please go ahead and repeat this step and configure this here in the NetBeans tools and library.

Here, Tools and Libraries. And there, you're going to get new library. You create new library name. Once it is created, you can take the help of options to add a JAR folder. And you can find appropriate library there in the Resources. Under this, you have Libraries. So don't forget to add this if it is the first time for you.

So in my case, I already have added. It is all there. Trinidad API and implementations, which are referring to appropriate JAR file from the Resources, Trinidad Assembly Folder.

Now what next? Once you complete this, you just go to DVD Library Projects. And in this project, they say if the server is not started, please start it. DVD library, which you have already deployed, undeploy.

So we're just going to undeploy it from here. Service and applications. We have here web applications available. See that? DVD library is there. Right click and undeploy it.

And now add the newly defined Trinidad libraries to your DVD Library Projects. To add them, what you have to is simply go to your project. In projects, we have DVD Library. You can right click, go to Properties. And here you have options to add the libraries. Or what you can do is you can also find here Options, Libraries, right click, and say Add Library.

You do not have to look into the folder to find the JAR file because your library is already a part of the NetBean list in Add Libraries. You can find it there. We have here the list, Trinidad API Added. Right click Trinidad Implementations. So libraries are now added to your applications.

What next? When this is all completed, you can go to web.xml and add some configurations which are needed for Trinidad components. What they want you to go do web.xml. Here they have web.xml file in the resources. They say select all the lines within the file, Control-A, copy and paste it into your existing DVD library project, web.xml.

We have the favorites. And here we have web.xml. Open it. Control-A here. Control-A, copy, and then go back to the project, Web INF, web.xml. And there you can say Source, Control-A. Control-V for paste.

So this all added your information about Trinidad components. They have added there. See? The servelet mapping they have done it for this. Resource servelet. And all those things that you have done earlier for the security purpose, it's not there. It's all removed.

If you want to continue with the security, no problem. You just go ahead and add those things which are new, and they wanted you to have it here. Like this one is important.

Now once it is done, you have copied all the content from the web.xml to your existing DVD library web.xml. In this practice 15.2, we're going to modify our add.xml page to have two tabs, one to add DVD, and the second one is to update the DVD.

So for this purpose, you have to take the help of Trinidad components. And for that, you need to attach Trinidad API and implementations into your DVD library applications. These are the steps that here, they are asking you to configure it in the NetBean so that you can find those JAR files easily and reuse them, add them into multiple projects in this NetBean.

This configuration I already have done it at the time of demonstrations when actually I was giving lecture on this topic and demonstrating a practice example. So I don't have to do it. But if you want to do it, it is going to be first time for you, you can.

Go to the [INAUDIBLE] Libraries and here, click on the New Libraries. Type the name and then find that JAR folder which is going to be available to you under Resources folder. Resources folder, Trinidad Lib, and again, find the JAR files.

This way, we're going to make them a part of the NetBeans provided [INAUDIBLE] library list. And this will help me to attach those libraries here in my existing applications. I just have to go to Libraries and right click, Add Libraries. And here, we're going to see the list of available libraries for the NetBeans. And we will find Trinidad API and Implementations, and we'll add them one by one.

So this is here. It's added to my applications. Don't forget to undeploy your DVD library which is already running on the WebLogic server. Go to WebLogic server. In Web Applications, find the list of web applications deployed. And find DVD Library, and undeploy it by right clicking, and Undeploy. Good.

Next, what you have to do is they say have appropriate configurations to be included in web.xml. And for this purpose, they have given you web.xml file in the Resources folder. They say copy the entire content.

Go to Favorites here. We have the resources added, web.xml. Copy everything from this. Don't copy Web App, the [INAUDIBLE]. If you say Control-A, then you're going to copy everything. And then you have to remove the duplicate tag from your existing web.xml file. So I'm just going to select everything excluding Web App tag and copy it.

Web.xml, which is from my DVD library. Above the context param below Web App, I'm just going to paste everything that I have copied. So in this, this is what is the main important part. The Trinidad components are going to be processed by the servelet provided by this Trinidad library, that is, a resource servelet. And the URL map patterns needs to be there for ADF/*.

Once it is done, see what they say here? Like here, they say copy everything and then paste it before the context param. Of course, if you copy everything, you're going to have some duplicate tags, like Web App. All those duplicate tags, you have to remove it. Remove any duplicates. Even the context param, if you have any duplicates, check it and then remove it.

Update faces-config.xml file in Web INF for the render kit. In this case, within the application tag, you need to include default render kit is going to be from Trinidad core so that Trinidad components can be rendered in HTML back to the browser.

So we go to faces-config.xml here. And within the application, this is the application that we have here. Open and close. Within that, we will add this default render kit. And we'll specify that it is going to be from the Trinidad libraries, that is, Trinidad.core. Good.

The next one is to modify DVDLibraryBean.java. Let's have Update DVD method so that you can update an existing DVD record. So I'm just going to copy this into my DVD library bean. Let's open DVD library bean here and have a method to let that record be updated. Like here, we have add DVD. Now we can have update DVD.

Public string update DVD item. This is going to say itemBean.updateItem. That's what we want to update. And return index.

Remember, in this application, we're communicating to EJB. All your business logic to insert records, to update records, or to retrieve all the records from the database is returned in EJB components. So we're calling EJB methods here, passing the item object which will be updated. And then it's going to take you back to index.xhtml. Good.

Now, what they say, modify add.xhtml. You have to modify from the beginning because now you're going to start using TR form. You have to use panel tab. So we just go to add.xhtml, this one, which we're using HTML. Earlier, we have here UI composition, all those things, and we can modify them.

What they say, replace the beginning of add.xhtml up to opening h body tag, including h body, with the following statement. That means we do not want body tag right now. Everything from here to the HTML, we're just going to update it with the TR document.

And this is now going to have some appropriate URI for JSF HTML Facelet, JSF core Trinidad, and your composite components. Title is going to be part of this. And then if you go back and down, you have the body HTML. This one you can use to close your TR document. See now, there's no error. Good.

Now what next? Add a Trinidad tab panel with two tabs here in this add.xhtml. So one for DVD item, other one is for DVD details. For this purpose, what you have to do is you have to use TR form and have a TR panel tab position above. This is what we're going to add. Existing panel grid and command link tags are here after that.

So what you do now, you can remove all your HTML forms that you have so far. And within the UI compositions, you can start typing TR form panel tab position label. This will give a panel tab. This is now going to create a tab one for Add DVD Item. And the second tab you're going to create with DVD Details.

You can title this how the tab is created. And once you move on to another part, you can start creating a serve form and have some options over there like text boxes. All those things you can have over there for update purpose.

So see now, what I did here. Within this UI define content, because I want to have the same look and fee; as we have in other pages, implementing master layout. So in this content area, I'm just going to say panel tab position label show detail item for DVD item. Have a panel grid.

And there we have three text boxes, just like the previous content. In the previous practice you had it here for adding DVD. So don't delete that part. That's going to be there within the show detail item.

The second show detail item for DVD details which will allow you to update DVDs, here they have a serve form. And there you can have panel form layout. And you can take the help of Trinidad input text. If you have taken Trinidad input text, you don't have to type label. Label can be specified here-- ID, title, cast, actor, what they say here that you can include.

We do not have these options in our database. In a table record, we're just going to maintain ID, title, year, and genre that you can display here for updating the records. So label if you want. You can delete it. And that will be for this purpose.

Value binding. We have not here specified the value binding. But we're just straightaway going to call DVD update DVD. The same item is going to be updated. Actually, we are here. They have not done any update logic.

Let's see. If I'm just going to deploy it, we can see what they say next, deploy, and view the tab. So go back to your applications. I can say clean and build because we have done a lot of modifications. So clean and build. So I have clean code. And then I can say Run. Run will deploy the application and open the browser with the first page.

Now if we type the URL here, local host 7001 for the add.xhtml, you're going to see that there are two tabs available. One is for DVD item. Another one is for DVD details.

The DVD Details, here they say add ID, title, cast, director, and clips, but there's no value binding. So in fact, when I click on the Update button, it's just going to call DVD update DVD, but there's no value that you're going to update in a managed bean. So whatever you have in the managed bean, it is just going to be updated as it is. So you're not going to see any changes.

If you want, you can continue here to have the value binding so that you can modify the data and submit the data. And new data is going to be updating the model. And then DVD update DVD is going to update them with the help of EJB in your database. Good. So that's all about this practice.

Now we have practice 15.3, which is actually optional. If you want to take extra challenges and see how to create a mobile web interface for your existing web applications which you have created for the desktop browser, you can go ahead and do this practice.

We do not have any mobile devices here for demonstration purpose. So what they have done is they have done some couple of configurations just to give you a look and feel how the pages can be shown if you display them in a mobile browser. So we will see this.

In this case, what they say that you have DVD library applications. That's OK. But to simulate a mobile web browser environment, you need to complete this step.

In this step, what they have done is-- if you go back to your applications and see that we have a Google com over there. And they want you to create a page and resize the page to give that look like do you are using some mobile simulator.

But don't forget that applications have to read user agent value. If the user agent value is containing mobile word, then it will be able to understand if it's a mobile device or not. In that case, we will use a skin to give a different look and feel to our applications, resizing the width and height of the components so that they can be fit in a mobile web browser.

What you have to do is you have to create a copy of the Chrome shortcut. Create a shortcut for this. We have option here somewhere, create shortcut. Right click the mobile Chrome shortcut. That's what. Give the name as the mobile Chrome. You can say this. Just preparing an environment to test how the page is going to look like in a mobile browser.

Now in this, what they want you to go to the Properties target. And at the end of the text, use this option, Chrome OPTS options. Let's see. Right click, Properties.

And this is invoking chrome.exe. That's OK. Insert option here after this, %Chrome_OPTS%. [INAUDIBLE] this is environment variable that we have created in the computer properties. Let's see.

They want you to create it, in fact. So we can go and check the properties here in advance. We have environment variable. And see if it is already created. No, it's not there.

So we can create a variable here with the name Chrome. Do not have to use percent here. And here, we have to type user agent value. So that's what the information they say. And what you have to type it, you need to type these all information over there.

I'll first copy it somewhere in the Notepad so that you can see what we're doing over there. Value says no default browser check. That means when you click on the shortcut to open Chrome, this is not going to check if it is a default browser or not.

Then we are specifying here user agent value. And we're just here typing some user agent value so that it looks like the request is generated from some browser. In this case, what they're doing is they're here specifying all those values of the user agent.

And see, they have here mobile word. When a managed bean which you're going to create in your applications to read this value reads the user agent, will get to know that the request was generated from iPhone. And it will just find that user agent contains mobile or not. If yes, it's a mobile browser-- browser name and all those things.

And then what we're going to do is we're going to load an HTML page which is available in this folder. That's all they want you to type as a value for the Chrome options. Copy it. This mobileload.html, it is available in a Resource folder.

Go to Resource folder and check what they have there, D Drive, Labs. We have Resources folder. And there, they have the Mobile Launcher. Under that, they have Mobile Loader. Open it in in Notepad.

Let's say Edit and see what they have here. They created HTML with scripting so that it will show you some rectangle with this given size. So that rectangle will give you the size similar to a smartphone browser size.

So I'm just going to load it here and type this all information. Just copy this all and paste it here in this Properties. Say OK.

Now let's try this mobile Chrome. It's loading. See? Mobile Launcher, mobileloader.html. And for this browser at least, your user agent value is going to be set to iPhone, Apple webkit containing mobile word. You can here specify the width and height like this.

Now, if we see this code that they have for the mobileloader.html, this one, I can right click and open the Source page. Open it in different Notepad. Here we have it.

What they're doing in this Notepad, they're reading. See, the body on resize, style, background color, mobilescreen.png. That shows this rectangle. [INAUDIBLE]. It's actually a picture. And what they say here, script type, text JavaScript, check mobile agent.

In this case, when it's called, the method is going to use the user agent to lowercase index, and it's going to check if this contains mobile. If it is containing mobile, it should display here in the main. [INAUDIBLE] HTML should display message, this one, if it is equal to something. It should display here, please resize of browser to match the information that you have it here. And it contains your URL for DVD library.

But right now, it is not showing you this. So that means it is not finding the mobile word in the given user agent. We need to check why it is not doing this.

Once you've done all those things, and if you're not getting the link available in your mobileloader.html file, it should give you here, "please resize your browser to match the browsers" and then open a link. If it finds mobile word in the user agent, close all the Chrome browsers that you have already open and then retry it. Then it is going to change the user agent value.

So I just tried to close everything now, and just open here mobile Chrome directly. And see now, we're getting here, "please resize your browser to match the browser and then open the DVD library." So we're just going to resize it so that it looks like it is a mobile simulator.

Let it be like this. From here, if I generate a request to DVD library, which we already have deployed, it is not deployed right now. But if it is deployed, you're going to see the main page here. It is open. But you will not see any changes in the pages because we have not implemented any CSS or skin from the Trinidad.

So we have to copy some couple of files, like mobilewebkit.css, moderndesktop.css. And we have to copy Trinidadskins.xml and config.xml from the Lab Resource folder so that skin files can be created. We're not actually creating them. It's already created. We just have to copy and paste it in our applications within Web INF.

So I just have copied and pasted it here. If you just go to Web INF and see, we have a CSS file now, mobilewebkit.css, and the moderndesktop.css. We're using here body from, referring to the tag. We have here referring to some JSF components. We have here style classes created. This is all going to be the same with the modern desktop as well, but the different size, different color, which is good for the desktop. Mobile web kit, different height, different width for the components, and color scheme as well which is good for the mobile browser.

This CSS file, what they have done is they have used it to create Trinidad.xml file and the skin file. So go down here in the Web INF. You'll find here Trinidadskin.xml they have prepared for you.

They've given here a name, mobilewebkit.desktop, moderndesktop.desktop, and this is the skin name. And these skins are referring to the respective CSS file. The render kit, it is from Apache Trinidad desktop. That's all the same.

Now, in the Trinidadconfig.xml, what they are doing is they're calling here managed bean. A managed bean method, remember, that can decide whether the user agent used to make a request by a browser contains a word mobile or not. If you want to give a look, just go ahead and see the user agent.

Let's see if it is there somewhere, where it is. Have we copied it? I think we have not copied it. We need to copy this file in this bean. It's calling user agent bean mobile, which in fact is checking it is using mobile browser or not.

So if you see that, what I said, that in [INAUDIBLE] family, they're calling useragentbean.mobile, which returns true and false. But this file is not there in your DVD library. While doing practices, here they're not asking you to add them.

So what you can do, you can find this file from the example folder. We have the example folder. Same chapter, third part example, and we have user agent bean. You can copy this file and paste it in your com.example.beans.

Once you do this, you're going to have user agent bean. If you see that, this user agent bean is here reading the user agent value, which is the part of HTTP request body is the header. And it's checking whether it's containing mobile word or not. If it is not equal to minus 1, it's mobile equal to true.

So that's what here we have the method that returns true and false is mobile. And in Trinidad config, we are calling that is mobile method. Setter and getter properties, you just have to say mobile. Boolean is mobile. Returns true and false.

If it is true, it is going to use mobile web kit as a skin. And if it is false, it is going to use modern desktop as a skin, which will change the look and feel of your page to let all the content be displayed properly in a mobile browser or a desktop browser.

Deploy the applications and test it here in the DVD library. When you open the mobile loader like this, click on this. It is going to show you the content.

And then you can revisit all those pages and see how they're going to look like. Similarly, you can open another browser, like Firefox, Internet Explorer. And there you can type visiting this DVD library applications, and see that it is going to use modern desktop.

That's all about this course and the practice. Thank you very much for watching us. All the best.
