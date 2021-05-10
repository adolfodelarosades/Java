# 6: Creating Message Bundles

   * Creating Message Bundles - 31m
   * Activity 14,15,16,17 - 24m
   
## Creating Message Bundles - 31m

All right, OK, let's continue with the Chapter 6, Creating Message Bundles. This is a time that you're going to localize your pages, application pages. Message bundle, we've reached to this point. That's again, it is something wrong. It's a typo. It's Using Session Bean. It's a typo. It should be about JSF. But sometimes, we have used session bean.

Creating and adding message bundle, we're going to do this all. In this chapter, we will discuss topic what is a message bundle, declaring a message bundle. We'll see the messages with variable parts, and using localized message bundle, setting application locale. Objective of this chapter is to let you understand how to create message bundle for multiple languages, how to use those messages bundles to simplify localizations, and then we're going to localize our applications.

What is message bundle? Message bundles are actually the properties file, properties files which stores the information in key value pair. We have the first option here, the key and the value, key and value pair. So this is a properties file. You can create a .properties file with any name that you'd like to.

How to declare a message bundle, once a message bundle is created, you can go to each page, and on each pages, you can specify f:loadBundle. Remember, this say f. That is from JSF code library, loadBundle basename-"resources.messages". You know, resources.messages are what? Messages is the name of the properties file, and resources are the packets under which this file is located.

This is going to load the file whenever you're trying to visit a page. And the message bundle file will be loaded and will be available to you with the reference here specified in var-"msg". You can type any name that you want.

Once you specify the name, then on the pages, if you want to read your key and value pair, you want to read appname, what is the value, want to read DVD Library, what is the value, you can simply go to msg.appname. You can say msg.appname. Whatever you have there in appname-DVD Library will be printed on the screen. Msg.title_home, this is the way you can read properties values from bundle file.

The benefit of this that you can externalize the literals that you would like to show it on the pages in a separate file. You're not going to type it in JSF faces. So .properties files, if you do any modification in the value for the particular properties, will be applicable on every pages wherever you say msg.appName, msg.title_home.

So we just have centralized the content to be printed, which is not dynamic in a .properties file. And that can also assist you in localizing your pages where you can translate the content in Chinese and Japanese, and that can be determined at the runtime automatically, depending on the browser that your client is using to show the content in either Chinese, or in Japanese, or in any other languages.

Messages with the variable parts, it is also possible that you can have a message stored in the .properties file with a variable part. See here? They're using variable parts. First variable part, you can give the number 0. Second variable part, you can give the number 1, and so on.

These are the placeholder which will be filled dynamically at the runtime by the pages. And how you're going to fill them? If you have the variable part messages, you can use outputText value equal to msg-- msg is resource bundle difference-- welcome_list is a key name that contains variable part message.

Then here you type f:param f:param. F:param, parameter value equal to. You can decide what value. You can type in here as a little. You can read it from bean properties, which were the value that you read it from bean properties will be placed at number 0. The first one go to number 0. Second one will go to the second placeholder 1. If you have any other-- 2, 3, 4-- you can continue typing f:param f:param. The first you type 0. The second you type, go to 1.

Localized message bundle, that's the main important part of creating resource bundle, so all those static text messages for labeling, for captioning purpose, for heading purpose, you can put them into the SOA bundle. Later, what you can do it, you can create multiple properties file. Just make sure that name is going to be the same .properties.

The first name it is going to be the same. You just have to do what? You have to use locale code. For Spanish, for French, locale code. Just add it, and then you can translate something. The value part, you can translate it.

And once it is done, you can try it. Just to try it here, you need to set a default language on the browser. Make it German or something else. And then make it a quiz and see whether it is showing you the content in German or not.

I'm going to show you this all, and then we'll continue with the rest of the topic. Let's see. Let's take a simple Hello JSF. I'll just close this all, now. Hello JSF that says index.htmls, and here I'm displaying the title. And I'm saying please enter a word, which is, I think, going to be the name. I say here, please enter name. OK.

This is my static text. The title, the value on the Command button, I would like to put them into the source bundle file. What I'll do now, I'm just going to have it there, here. And you can create a separate package if you want, New, Java Package. I'm going to say com.example.bundle.

Here, I'm going to create a .properties file, which is available in Other. Go down, Other, and you'll find .properties file. Give the name. I'm saying here messages. And this is going to create messages.properties. Finish.

This resource bundle does not have a locale code. That means here, the key value pair that you type, it is going to represent your default language. Let's says English is going to be my default locale. I'm here typing for the title.

Let's say for the title. Let's say your title equal to, and the title is going to be I want to type Hello world applications. So Hello JSF Application, I want to say. So I want to say Hello JSF Application.

Next, please enter the name. I can give this a label. For this, I'm going to have here a message properties, or a label, text label, give some name that you can remember equal to please enter your name.

Next, for the button caption, button say Go. I would like to read it from the button file. I say button label, B1 label, I'm saying here Go. Now, I have a resource bundle. But a source bundle is not available right now to my pages. What they say? We go back to the PPT.

Go back to the PPT. They say you can use two options, one, that you can type on each page loadBundle base-name. Get the message bundle file name and specify some variable, which will be a reference to that particular memory where this was bundles are loaded. This is found in JSF code library, but it's not recommended because you have to do it on each page.

The next one that they say add the resource-bundle in faces-config.xml and specify the base-name, resources.messages. Resource-bundle reference in faces-config.xml file will always be under application tag.

Go to faces-config.xml. And here, I can have application tag. Open and close, yep, right. Don't forget to close it. Under that, I'm just going to specify message bundle. Resource-bundle base-name and variable message. This is what you need to specify.

So I'm just going to type it here. Resource-bundle. Do we have this? You have so many things, not message-bundle resource-bundle. Open and close. Under this, see what we have? Base-name, description is just for documentation purpose. Remove it.

Our base-name, this one, and the base-name what you need to type, you need to type the complete name of the resource-bundle file com.example.bundle.message. You don't need to type .properties. Just say messages, and close base-name. You're going to specify variable. Give some variable name that you can use to refer to that particular memory. As well, I can say msg, and I can close here.

Now, if I run my program, the resource-bundle is going to be available at the runtime, load into the memory. And that you can access using msg. Let's see if I can replace this title by reading information from the source bundle. We need to use EL, msg. See? Everything is available to you-- title. Please enter your name. EL msg.textLabel. Please enter your name.

Value Go, msg.buttonLabel. I'm saving it, and I'm going to run it. The run will deploy. It will use incremental deployment approach. And see, you see here, please enter your name. Hello JSF Applications, and see the Go is printed. We have not typed this information in my JSF. It is reading it from the message bundle file. So we have externalized those static content.

You can also have dynamic content to be added with the help of parameters specified that you can decide using f:param reading it from managed bean properties and then merging it with the resource-bundle value part.

Now, let's try to localize this. It's showing me everything in English. What I can do right now, I can just go and copy message.properties and paste it here one more, paste. I can paste one more. We just have to rename this property filename using locale code. I can say here it is going to be with the German locale. And the second one, I can see it is going to be with Chinese locale, _cm.

It can be combination of language and country code. Now, see that it is opening here message.properties. This is available to you. It opened up three languages. Default language is going to be English. That you have decided whichever you type is going to be default language, German and the Chinese.

I can here type something in German, and I can type something here in Chinese, which I don't know. So I can take the help of Google to translate it, but I'm not sure that translation is going to be right or not. But let's translate it, so that you can have a look and feel that it is displaying something in German and in Chinese.

So let's say Google translation is available here or not, translate.google.com. Let's try. For one or two, I can try it. For Go I can try. In English, it is going to be-- I can here specify the language that I'd like to translate to. I can select here Chinese how to say Go. Ah, that's going to be. I'm going to type Chinese here for the Go.

For German I can try. Let's take a language. What happened? OK, something like this. It is in German. I'm not sure it's going to be right or not. Excuse me. Just let you have a look and feel, and realize that it is working. Similarly, I can try to translate this, as well. Please enter your name.

And the same thing, I can select Chinese Simplified. Please enter your name, and Chinese Simplified. And similarly, I can say JSF Applications. This is JSF Application. Just type it, JSF Application. Chinese Simplified, I can just say here JSF Application. Just remove this Hello part. The same thing here, I'm going to say in German JSF Application.

So we have prepared our resource-bundle file for German and for the Chinese. Good. Now, it's all done. You just have to go to faces-config.xml. You have to within the application, you have to tell that you have resource-bundle available and what are the locale. See that? We have locale-config options available.

Open and close it. That should be within application tag. And the locale-config you specify default locale. The default file messages it is representing the locale English as default locale. I'm not specifying country code. You can say en_us or uk.

Supported locale that you have it here for German and for Chinese, I say here, D-E as a supported locale that I have. And I have one more support locale for Chinese. Save it. It's OK. I'm just requesting it here, my Hello JSF. It is giving me error right now. Hang on one second. Index.html, OK, good. It says in English, please enter your name. Go.

If I have a browser, let's have another browser Internet Explorer. Let's quickly close this, education.oracle.com.

We can go to Tools, Internet Options, and I will change the default language for this browser. Just to let you experience that if you have a customer in China using Chinese browser, the default language going to be in Chinese. I am saying it is going to be in Chinese. We use this one. And I make this default.

Move up. Say OK, OK. And then issue a request, same request. I'm going to issue it here from Internet Explorer that has default languages Chinese. And see that? See there. Enter your name is in Chinese. Button caption is in Chinese, title in Chinese.

If you make a request for the same page when the default locale is Germain-- you can try it here by changing the language. Default language, make it Germain, this one, and put it on the top. Make it default language for the browser and reissue the request.

It should be displayed the page in German like this. It's taking some time to generate request. And you can do the settings with the file of a [INAUDIBLE], and you find information displayed right now in German. So that is what resource-bundle.

Now, let's see what else they have in the PPT. Variable Parts, if you want, you can have it. And that you can decide what value you want to print it at this placeholder using f:param. Localization, that you can have multiple properties along with their locale code and translate the value. Let the key be the same. Just translate the value.

You can check it with a browser. You can go to the browser and set the default language, and then reissue the request to the page and you see that the page is localized.

Programmatically, if you want to change the locale of a particular applications, depending on the user's choice. You must have seen in some of the websites, they way which country you belong to. And say that I'm from China, I'm from UK, from US. Depending on that, they redisplay the page in appropriate locale.

So if you want to do this, so on the main page, you can have a drop down list offer some options to take the user input. And then programmatically, you can decide and set the locale for your JSF page environment. And for that, you need to take the help of FacesContext. FacesContext, which will use getViewRoot .setLocale, and then you can here specify the Locale object for German, for Chinese, or any other localizations that you may need.

On every page that you want to specify the locale to be determined by some bean properties, you can say f:view on the top of the page. Locale equal to locale.currLocale. You know, this is a bean properties. It is calling get current locale method, which returns the locale object, which will be used here to change the locale of the page. It is for on every pages.

That's one of the settings that you have to do in faces-config.xml. You need to restore your resources-bundle file. Remember, only the default one. And you also have to specify available supported locale.

Quiz, one of the benefits of using message bundle is that you can quickly localize an application. What do you think? Yes, you are right. It is going to be true. Identify three ways in which you can set the application language. What you can do, you can create a message bundle for each language, set the locale by using browser, set the locale by using @Language property, set the locale in the top-level view element, programmatically set by using FacesContext and faces-config.xml.

Create a message bundle for each languages. It is not for setting application language. It is for creating resource-bundle. But first configure your applications to support the appropriate locale, you either have to use view elements, f:view, locale equal to something specify, or you can programmatically set application locale using FacesContext, or you can decide it through faces-config.xml. It's going to be [INAUDIBLE].

How do you pass variable to a message? Of course, if the message has placeholder, you're going to use f:param. A is going to be right answer.

That's all about this chapter. And we have seen how to create a message bundle file, externalize the content, static content, or the content that may have some dynamic values by creating placeholder. And we have seen how to a localize applications using resource-bundle.

## Activity 14,15,16,17 - 24m   

Hi. Let's continue with the practice 6. This has one, two, three, four practices, and these practices, you're going to see how to create resource bundle files and how to load the configuration that you have to do it on each pages or make it global by doing it and faces-config.xml file.

So we start with the practice 6.1. They say, in your existing DVD library applications, have a package name created saying com.dvdlibrary.resources. We'll do that right now.

And there they say copy the message.properties and message_de for the German locale Properties file into this package. You can review this, what they have written there. And then you can move on to next practice.

DVD library, a packet name that you have to create it here. New, Java Packages, com.dvdlibrary.resources. Finish it.

You already have favorites over there. You see that the locale contains some of the I think here in the messages. Yep. And message with .properties. These two properties file, you copy it and paste it here in this package.

Let's say that you have to review it, just review. It has a title, the key and value pair. Some of the values that you see, they have a placeholder. That means the value of this will be decided at another time, all right. We will use f param for that.

If you see the German one, it has all those informations. Same key, but the value is translated into German language. All right. OK.

So that's what the practice 1. Continue with the practice 2. In this practice, they say in index.xhtml, you can add a JSF core library F so that F load bundle you can use to load-- this was bundled for that particular page. F load bundle. You need to do it on every pages.

So let's go to your index of XSTML. And here, this say add a JSF core library. I'm just going to insert-- I'm going to type this, copy this, and paste it. What happened?

Copy, paste it, and then we'll make appropriate changes so that I don't need to type long. JSF core. And I'm going to say this is F. All good now.

You have arrived at successfully JSF core library. It doesn't matter it is on the top or at the bottom. It doesn't matter. Just have to add it. And then you can add load bundle.

So load bundle core tag as a child of the XTML root element. So we can just add load bundle tag and specify the base name and the variable, which is not recommended because you need to do it on every pages.

But just type it and see how it works. We can here see that on the page. Add it. Are we good? Right? OK.

com.dvdlibraryresources.message, yeah, and the variable is MSG. All those things that you type it here now can be replaced saying MSG dot something. Now let's see what they want you to replace. This title that you can read it from MSG title.

The title, nothing to type. Now you can read it from MSG DVD library. Don't forget to specify EL.

Next, let's say h2, the heading two that you have it here. I can have the heading two. And I can type here heading two. Let's remove this. MSG application name and the message title Home.

Then what else they say? Use the welcome message in the resource bundle to replace the static welcome message. Remember, we have the welcome message. This is my welcome message. Welcome to DVD library applications. It is saying either guest or like that, showing that user name.

This is what they want you to replace it by reading MSG welcome. But if you see the MSG welcome, it has a placeholder. Welcome to DVD library applications.

So this part, you can remove h2. Don't need h2 right now. It's already there. This part, I can replace it and read it from resource bundle. But the resource bundle has a placeholder, right. We need to replace it with some values. For this purpose, you take the help of output format, output format. So this place, you can type output format. Close it.

Under this, we can use f param. F. F is from JSF core library param. Now we can specify value equal to what value? We like to have it at the placeholder one or zero. This is the first placeholder.

You can specify the value. And they say f param. You read it. Empty login, username guest like that.

So what I'm going to say, I'm going to say the value's going to be equal to this one. This part, I will put it here. Empty login, username guest. Otherwise, going to be username. Close f param. You can close it just now.

So MSG welcome, it will display welcome to DVD library applications, and thereafter, it is going to say what? Either it is going to display guest or it is going to display the name of the user that you have login with. Good.

Once it is done, you can move on to the next and see what this say. Everywhere in the command link that you have link, one link, two link, three link, four, you can replace the value part and read it from the resource bundle. Which page, they say? It is in index.xhtml.

We have multiple links, and we just can read it from resource bundle. Not action, the value part. So command link value equal to something. This value part, I can read it from resource bundle.

So I can say here value equal to-- see, if you have to read something either from the bean properties or from the resource bundle, or even if you want to type some literal, you can type in the value. This, we don't need now because this is what we're going to do it with the value.

Do it here, here-- MSG dot-- all right. Here, we have multiple key. Or you can type the properties, which you have for this label purpose. So you can see they say msg.gotolistlibrary. I can type this one. This way.

Similarly, you can replace add. You can replace preference. You can replace a log in as well, just like this say. So I'm just going to copy this. So now I think you understand that what you have to do it. This the way that you can replace everything.

So now we have all the content right now with us as productivity they say. The next, save it and deploy it and see whether it is running properly or not. Once you check it, you can continue with the login.xhtml. And the login.xhtml, they say, again you have to use load bundle core library. Just like you did in index.xhtml, and then there, you can specify MSG, message [INAUDIBLE], and all those things.

So in login.xhtml, you have to repeat these steps that you did earlier in index.html and the username password, all those things, you can read it from the resource bundle. So I can do this all. I can go to index.xhtml. This is what they want me to repeat it. See, that's what-- that you have to repeat it on every page, and this is why it is not recommended.

login.xhtml, just type it one more time. And here as well, you need to add a JSF core library. Otherwise, the F load bundle will not work. Let's change it to JSF core and make it F.

Now you have loaded resource bundle now. As well, you can use here the title, read it from MSG. The title login is the properties that you need to find it in resource bundle. msg.title-- title.

Check it what they have. Title home, title login, title login. Login page, title login, title login.

So login page, I can say title_login. You need to type it. Same as here, h2 DVD library, you can read it from message properties. This is a username tab, login button text. Everything you can read it from there. All those things you need to replace it.

We can say here msg dot-- property name is username#. We can type it here for username#. Similarly, we can type it for the password prompt.

Log in value, you can also read it from resource bundle file, command button. So everywhere you have the literal, you can get it from the resource bundle. This also you can replace it from the resource bundle. They have here application name. See that? Application name DVD library. But you can get it from the resource bundle for these applications.

App name, like this. colon login. Do we have any properties that say login? Login. You can use this one. That's the login. No problem.

The resource bundle properties, you can reuse multiple times. It's not unique to the particular components. Here, I want to type login. Here, I also want to type login so I can repeat it, the same keyval. That's also going to be localized.

Save the login, deploy, and check it whether it works or not, and then repeat the same steps with add.xhtml. In add.xhtml, you have to repeat the same step, have the load bundle code tag added over there, and then make appropriate changes and add .xhtml. So I believe that you can now continue.

Once it is done, you can run your code and check that the configuration that you have done it on every pages, it is working or not. The same thing you have to do it with list.xhtml, the same thing you need to do it with list.xhtml. Everywhere, you have to use load bundle.

Once you verify this all, later what you need to do it in the next practice, 6.3, they want you to go to faces-config.xml and there have supported locale added so that you can localize your pages.

We right now only have two resource bundle, one for English, one for German. So we can as well go to faces-config.xml file. And here, we can type applications and let this resource bundle file be registered, and then register the supported locale.

Say applications, go down, close the application. And here, what you can do, you can type locale config as well. Close it, locale config, and then specify default locale. That is going to be English. And specify supported locale. That's going to be for German.

That's for the practice here. To test this practice, you need to open a browser, just save it, deploy it. And just like I demonstrated to you my lecture, giving my lecture, with my JServ same way you can have one of the browser configure with default language as German and then issue a request to DVD library and see the information that you're going to get it in German language. Have a browser like Google Chrome or Firefox for default language, and when you issue the request, it will be in English. That's what you need to tie it.

The next practice, 6.4, finally they want you to use the best practice and remove all those load bundle from every pages. And now, just go to faces-config.xml and [INAUDIBLE] resource bundle over there. We already have application tag over there. We'll just here use resource bundle.

And we will here say resource bundle close. Under the resource bundle, I will specify the base name. That is going to be com.dvdlibrary.resources-- DVD dvdlibrary.resources.messages.

That's what this status to have a package name and restore the resource bundle there. So I'm just specifying the resource bundle name as a base name. And then, you can say here variable. And specify the variable name as MSG.

Since we're using MSG as a variable since the beginning of practice one. Now we just have to go to each chapter and remove this load bundle we don't need. We don't need. Each pages you can go to, each pages. index.html can go to list.xhtml. Wherever you have added load bundle, just go to them and remove that. Not needed.

And then again, retry and see your information is going to be working properly. All right, that's all about the practice from 6.1 to 6.4. And you do the practices and hope it's going to be fantastic for you. Thank you.
