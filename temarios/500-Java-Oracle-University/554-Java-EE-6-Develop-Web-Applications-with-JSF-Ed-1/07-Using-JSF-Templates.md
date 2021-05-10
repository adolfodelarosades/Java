# 7: Using JSF Templates

   * Using JSF Templates - 24m
   * Activity 18,19 - 18m

## Using JSF Templates - 24m

We're going start with Chapter 7, Using JSF Template. In this chapter, we will see how to create a template page and give a consistent look and feel to our applications. Objective of this chapter is to let you understand creating templates and applying it to multiple pages. We'll talk about decorators as well, and at the end, we will discuss how to identify issues with the debugging capabilities provided here by JSF.

Template. What is template? Templating is a way of providing common look and feel. So you're just going to have a consistent look and feel all across all the pages in your applications. So we want to create a template. For this [INAUDIBLE] we can take the help of a Facelets tag libraries that can help you to create a base page that you can save a template. You do not have to retype to reuse the code multiple times to bring the common placeholder, common designing at all the pages. You're just going to put that into the template like header, footer, sidebars, or any information that you'd like to share across multiple pages.

Template files are actually simple XHTML file. There's no difference in the file extensions, and we will take the help of some of the tags which are provided by the Facelets tag library, like you will include ui:compositions, ui:decorator, ui:define, ui:insert, and ui:param. We will create custom components using ui:components, ui:fragments. They are available to you in the Facelets tag library for creating custom components.

There's several other utilities available that you can use, like ui:debug, for debugging capabilities, ui:remove, and ui:repeat are available to you. This is the template look. [INAUDIBLE] the DVD library, you're going to have some heading on the top, some menu bars are the length of the sideBarLeft, and here is this area that we would like to display the content. This design you need to repeat on every pages, all we can do what you can put them into template file and then implement on each pages.

So we'll create a template using the design, and later, we're going to implement them with all those pages that you'd like to have a common look and feel. And what we're going to do, we're just going to have here, see that, a template, we're just going to create divisions, division one, division two, division three. These divisions will create a look like this, heading, sidebar left, and the content.

You can have CSS as the style classes be used for this division purpose, and for that purpose you can import is styles.css, which is available to you in a folder, CSS under Resources. Have a division ID heading, give name heading, class header. This header class is available to you in this styles.css. And here what they say, ui:include arc. Some information that you'd like to merge it from some other pages, you can do it with the help of ui:include.

This welcome header.xhtml has some information that we'd like to merge it here, and make it consistent, common. ui:insert name equal to heading is providing a placeholder that can be updated by the page which are implementing this template. So if a page one is implementing this template, you can decide what they would like to display at this point at these sections.

Similarly, you can see that sideBarLeft division that they have created, they have ui:insert name sideBarLeft, and under that, they say ui:include. This will merge the content of this page sideBarLeft.xhtml page content, which will make the default for this location. Since it is a part of ui:insert, it can be updated, can be changed by the implementation page. If it is outside ui:insert, that means the implementation page cannot change the content what was merged here.

The last one is div id:content. The division of what they have created, and it just have ui:insert name equal to content. This means they will use it to replace the content by the implementation page. See that welcomeHeader template, welcomeHeader. welcomeHeader, here we have welcomeHeader.xhmtl, and that says ui:compositions.

The information which is under ui:composition, it is going to be included here in the template when you say welcomeHeader.xhtml. So this part is going to get the information from welcomeHeader. Everything outside ui:compositions, like head, body, whatever you have it here outside ui:compositions will be ignored. That's why title is not going to be printed on the page browser. This is all going to be ignored.

sideBarLeft has again, the ui:composition, and they have here a form containing some commandLink, commandLink that let you go to List.xhtml, and add.xhtml, prefs.xhtml, up to logout.xhtml. Here they have a button for log out, log off. This all is going to be part of sideBarLeft.

That means, by default, here in the sideBarLeft, you're going to get the content from this page, this all what you have it here within the ui:compositions, will be included at this part, which can be replaced. If some of the pages does not want to show this content, they can decide what they want.

Template. Once you create the template, have a file name for the Template file, the Template file can be implemented by the pages. A page which to implement the template, they will just say ui:compositions template equal to and specify the name of the Template file. Let's assume right now that you have a template. This is your master template dot xhtml, this template is now going to be implemented in this page.

Now with the help ui:define, you can override the content which is there at the place of your insert and master layout. So master layout here has ui:insert. If there's nothing, no problem, but here inside that you have included something from sideBarLeft, so commandLink, list of commandLink, once we implement the master layout, you just have to say ui:define.

Implementation page. You say ui:define and specify the name of your insert using Template heading, and then they can decide what they would like to display at that particular area. msg.appName, msg.title_prefs is the information that will be replaced here at this part by this page, ui:define name content. You say define name content, and under that, they would like to have some forms, some columns, some heading, some text boxes, they can have all those things here. Whatever the type it here will be replaced in the layout at this place.

This page-- you'll see that this page is not saying ui:define sideBarLeft. So that particular area will not be replaced by any other content by this page. Thus, in that page you will have the default content from sideBarLeft will be displayed. That's going to be resulting view of your preference dot xhtml. See on the top, it says, set user preferences. As a sideBarLeft the default content showing you link for the pages and the ui:define. They say ui:define name content, whatever they have it here, it is all going to be in the content area.

So Template file is not implemented. An implementation page that is perf dot xhtml can decide what they would like to have it at particular area, and those area, you expose it in template using ui:insert and override using ui:define an implementation page. Now we say applying different templates.

You can have multiple templates. You can have subtemplates as well. So let's just say by including some subtemplates in the core master template you can alter the look of the application based on the function. There's no limit that you're just going to have one template. Multiple template, and you can also have subtemplates. ui:include is the tag that you have to use it so that the information that you can merge it. See that? We have used ui:include, information to be merged in the template file.

If it does the part of insert, it can be replaced or overridden by the implementation page. If it is not, then it is going to be the same for all the pages. See that? A login page is doing what? Login page is saying ui:composition of a tab and implementing your master layout template file. Thus, it has the same design, sideBarLeft, header, and in between they're going to have the content area. You just have to use ui:define to refer to the particle section, same heading, sideBarLeft, or content.

Here, ui:define name sideBarLeft, they say ui:include. Implementation page the same ui:include, and this specifying sideBarLeft.xhtml is a different page found in different locations, log in locations. It has a different content. What will do, it will replace the default content which is there in the template. We'll go back to template and see the default content template is from DVD library sideBarLeft. This content, which was included here, entirely going to be replaced by the new content, because it is a part of ui:insert.

Now, the top cannot be replaced by the implementation page. So implementation page is referring to ui:insert to replace the content. That's what they here did it. If they want, they can type here a new form, new content, they can type it here. Or if it is there in some existing pages, they can import it here using ui:include, which will be merged at the time of render response.

See, this is sideBarLeft.xhtml, the content to be merged using ui:include it just going to be part of ui:compositions. Everything that you have within ui:compositions will be included here in this part. And then, what this ui:composition does not say template equal to template file. That means it is not implementing any template. It just has some content that's going to be merged at this place upside the left in your master layout.

And see that? This time when you open Login page, you see the sideBarLeft has been replaced. The whole links that you have it earlier, now is replaced with some images. Why? Because sideBarLeft.xhtml for the login has this graphic image. So it is showing you some heading on the top and displaying images in the sideBarLeft. The content area, of course, they can have here the form with the two text boxes and the button that will help you to enter username and password.

What you can do, you can organize all your View files properly in the web root folder. This is a web root folder that has add.xhtml, dvdlibrary.xhtml, index.xhtml, list.xhtml, prefs.xhtml. What you can do, you can create some new folders over there. Sections, dvdlibrary, login, sideBarLeft.xhtml. If you do that, then the URL is going to be based on the locations.

If you want to default to this sideBarLeft.xhtml, you say sections slash dvd library slash sideBarLeft.xhtml. If you want to refer to this one, then you will say section slash login dot sideBarLeft.xhtml. We have a different URL to access these files. Now, at the place of ui:composition, you can also use ui:decorator.

There's only one difference. Everything is same. The only one difference that it's not going to know anything outside ui:decorator. ui:composition does what? It just ignore everything else, so ui:composition, it is not going to use this title, whatever you have outside. But if you say ui:decorator, then the title will be used up by the pages. So if you want to use ui:decorator, you can. ui:decorator can also be useful to apply the template, but this paragraph, which is outside the ui:decorator, this content is not disregarded, this paragraph, it is always going to be a part of that particular page content. It is not going to be ignored. If say ui:composition, everything outside will be ignored.

More examples on templating tags. Facelets locate the template to use by analyzing the value of template attribute from the ui:composition or from the ui:decorator. Remember, you say ui:composition template equal to something. ui:decorator template equal to the template file name. ui:insert tag, it is providing a placeholder, which can be overridden by implementation page that ui:define. The name must be the same used here in ui:define.

ui:insert-- That's here what they have to say, that you have to use the same name and same attribute name so that you can override the content. ui:remove tag is used to comment out a portion of the markup in order to prevent it from actually ending up in the view. So some of the markupp-- some of the cases, you do not want to be rendered, and want them to be commented out, you can use ui:remove and have some of the information underneath, which will be prevented from being the part of the view.

ui:param tag can be used to replace the parameter using ui:include. ui:repeat Tag, it is the part of utility available in the Facelets tag library. ui:repeat tag is capable to repeat a set of tags, which is available here, for number of times. See that? ui:repeat value equal to they said data.customerData. This customer data, it returns the error list collections. Depending on the customer objects in the collection, 5 customer objects, 10 customer objects, 20 customer objects, it is going to repeat this all 10 times, 20 times, and it depends on how many elements are there in this collection.

This collection is the customer type, that's why they used the variable customer. You can use any name, but you have to use the same name to refer to the objects properties, so that information can be printed on the screen. See? Multiple tables have been generated here. It is generating tables, see? This all going to be repeated. Table one, table two, table three, table four, and see, on the top, you have the null table.

That means displaying one table here. There's no border. I can use different color. There's one table that is outside ui:repeat, and the ui:repeat is doing what? It is creating a column. Under the column, it is creating table one, table two, table three. And that table has again, a single column-- single column, single row, showing ID and the name from the customer object, which is from the error list from the collections.

Debug component. At some time, you'd like to debug your page to see that component state, which was generated at the runtime, what value they're holding, whether they're render properties are true or false, all those things. You can simply add ui:debug tag in your existing page. Anywhere, at the end, at the beginning. Anywhere, you can add this ui:debug tag.

Just open and close it, by default, the hotkey that you get to generate the structure on the browser for debugging purpose, it is going to be D. Control, shift, and D you have to press, and then it is going to generate the component restructures for the page with the [INAUDIBLE] values.

This tag must be used to define a JSF template? It is ui:composition. ui:composition template equal to template file name, right? D.

Which tag will be used to override or change the default content in the template that declares a sideBar section? Remember, to override your file content, which is the part of ui:insert, you have to use ui:define. Default content might be nothing. Simple ui:insert. And ui:insert may have some default content. You can override them using ui:define. B is going to be the answer.

In this quiz they say, in the following page fragment, the title ACME Display Products is not being displayed properly. You know why? Because they're using ui:composition. Anything else that ui:compositions will be ignored. The answer is going to be the tag outside a composition tag are ignored. B.

That's what all about this Chapter 7, and now we will start doing the practices and see how to apply the template-- create a template, and apply it to multiple pages. And, of course, we're going to play with the debugging as well.

## Activity 18,19 - 18m

We'll do the practice now. There are two practices, 7.1, 7.2, that you need to do. These practices are going to provide a common look and feel to your DVD library applications. What they want us to have a look and feel like this, have something on the top heading, sidebar left, and the content area, and then let all those pages, like add.xhtml, login.xhtml, list.xhtml, all those pages to implement the same template.

For this purpose, they say copy the template directory, lab resources template directory from the web-based folder of your DVD library. And verify the masterlayout.xhtml file is available on the web page or not. And open the masterlayout.xhtml just to review it.

We will see all those practices, 7.1 and 7.2. We're going to see how it is going to be implemented.

So I'm just going to explain to you what they have done, or what you have to do in the practices. We have here the favorites. In the favorites, you have the resources template folder. And this template folder contains masterlayout.xhtml. And that's what they want you to copy and paste in your DVD library.

It's a web page. I just copied and pasted it here. I got the template masterlayout.xhtml. If you see the content of the masterlayout.xhtml, what they have done here, they have created a heading. UI include, UI insert, UI insert. Underneath, you have UI include and the content, UI insert name equal to content. So we just have decided a desired template given in the activity like this.

Now, what next? They say, OK, this review on the top that you have here, CSS, style.CSS is available. That means a CSS file needs to be there. It's already included, and that's why you do not have to include it.

You already have a CSS file created earlier. Under the resources, CSS is there, style.CSS. That's what they already have imported your template, so you do not have to repeat it on every page. Good.

You have the images. Some images are there. If you want, you can copy this whole images, copy it and paste it in your web page, under the resources. Paste it in the resources so that you can get your images. I just want dvd.GIF image. That can be useful to replace the sidebar left content which is default here by the login page.

What next? You go to your page, whichever page you'd like to implement. Let's say index.xhtml. We're not doing anything here. If you want index.xhtml to have implementation of template, you can use UI composition and say template equal to file name. Check here which page they say.

Right now, they want you to copy section directory because that contains some of the pages into your DVD library projects. So you can go to favorites over here, resources section. See that, what they have it? They have two more sub-folders containing the files that we will use to include the content or overwrite the content.

You can just copy and paste it in your project. Under the web pages, you can just paste it. You're going to see here section available now, and it is showing you the two sub-folders, DVD library and login. Just paste it here, the web pages. Right click and paste it. Good.

Now what next? If you go to the next one, six, they say open headerwelcome.xhtml file from this folder. Let's see what they have, headerwelcome.xhtml.

This headerwelcome.xhtml just contains the UI composition. It's not specifying the template because it's not implementing any template. The purpose of UI composition to allow the content to be included using UI include in your template or in any other implementations of the pages.

Header, and what they say here, msg_welcome. And this has parameter. It's a login username guest. That is what's going to be replaced, the resource bundle message.welcome that has a placeholder, guest or username.

So in the template file, if you see there on the top, you see UI include SRC section DVD library headerwelcome.xhtml. That means whenever you make a request to a page, you're not going to request to the template page directly. Any page that implementing template, you will have the header like this. And on the top, here, it is going to display the content from this page, headerwelcome.xhtml.

And below that, we have the area. The remaining area underneath, it is all free. There's no content that you have specified as default that can be decided by the implementation page, what they want to write it here. Good.

Now they say, open sidebarleft.xhtml in the section DVD library. Right now, this is headerwelcome.xhtml in section. DVD library, we have sidebarleft.xhtml.

This again has UI composition. That means it is going to be part of UI include and had a set of command link in the form. See the master layout? This sidebar left says UI insert. And here, they have included sidebarleft.xhtml content. All the content from here will be included.

So it is going to show you the link as default content of your template. So when you see the template, at this part, sidebar left, here, you're going to see all your links. All the links are going to be displayed from this page.

It is the part of UI insert. If a page wishes not to display this, replace with something else, they can do it with the help of UI define. Good.

Now, what next? Go to next page and see. They say open sidebar left from Login folder and see what they have it there in the Login folder. Login folder, sidebar left. It's different, right? It says graphic image. It is just displaying the image.

DVD.GIF image, which is found in this library Images, which will be searched by JSF runtime under Resources. That image will be displayed. So page can decide to show this content, the area where you have UI insert. Good.

Next. Now they say the style sheet, I already have added it. It is given. In your case, it may not be there. If it is not there, you can find it from the Favorites, under Resources. You have the option to see the CSS. See? It is there.

You can copy the whole folder CSS, and later, you can delete it. Don't delete it here. Copy. It's already copied. And paste it here under Resources. And just delete all those two CSS files. The main one is style.CSS. Good. Now, once you do this all, they say images, of course, you can copy and paste it and have this DVD.GIF image there in the Image folder.

Now, practice 7.2, they would like you to refactor some of the pages to use the template. They're going to do is start with the login.xhtml. So go to the login.xhtml. Remove whatever you have already there, like head and body tags, because they're of course going to be ignored. You're going to use UI compositions.

You can just say UI composition template and specify the template name. Later, you're going to specify UI define. This is the name that is there in the template with UI insert. And you can specify what you want to see there at that particular place.

So here, this is my template which I'm implementing right now. Remember that this area is empty. It's nothing, which I'm here deciding using UI define name heading. It goes here.

Slidebar left. It is replacing the whole content which is here. You will not see the link because the link was a part of UI insert. The whole content will be replaced by the new content defined in loginsidebarleft.xhtml that shows some image.

So you can do this here. See that? In login.xhtml, I have included UI compositions, template masterlayout.xhtml, and I'm using UI define main heading, which will replace the content from the layout. This part is going to be replaced with the content defined by the login.xhtml.

Then it says sidebar left. This is going to replace the content which is there in UI insert in the template for the sidebar left. So the template here. This whole content is going to be replaced with a new one. In the login.xhtml, the content, UI define main content, they have all your forms that you had earlier displaying a username and password.

You just do not have to delete everything. You just have to include all those forms under UI define so that this content can be replaced at the area of the content in the template. And this template in the master layout that has nothing as a default will be replaced with the new content defined by login.xhtml. That's what they want you to do.

Once you complete this all, you can continue with the add.xhtml the same way. In add.xhtml, you can define UI composition, template, implement the template. And then, with the help of UI define, you can decide what other area that you'd like to be replaced with the content. Have a content here. If you wish to include it from some existing XHTML page, you can say UI include.

And see? Content part is all going to be there, which was there for adding the DVD library. That's what you need to try it. And the same thing you can apply on all other pages, like in List or Preferences.

Now, if I run the program, run this, it is going to open the first page, login.xhtml. See? The template is applied. This is the default content in your template. This is the content which was replaced by the login page using UI define. This is the content which was replaced by the login page using UI define sidebar left with the images. And UI define content is replaced with the text boxes to let you enter username and password.

Let me just type here, Nathan. I'm going to log in. And see that? Next page that you see here, it is showing you the same template. It says welcome to DVD library application, Nathan. This is DVD Library Add.

And see, back home, all of you can try it. Add DVD. Set user preferences. We have not decided yet what we want to have here. You just have a link. Log in.

So that's what you need to try and implement it here. That's all about this practice. Just go ahead and do the practices and try. Thank you.
