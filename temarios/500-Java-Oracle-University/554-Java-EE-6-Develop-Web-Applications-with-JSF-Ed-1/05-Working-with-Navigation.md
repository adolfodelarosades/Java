# 5: Working with Navigation

   * Working with Navigation - 1h 8m
   * Activity10,11,12,13 - 21m

## Working with Navigation - 1h 8m

Chapter 5, Working with Navigations. In this chapter, we will talk about how to navigate from one page to another page. And right now, we are at this point, Working with Navigations.

See the objective of this chapter is to let you understand what are the static and dynamic navigations, defining implicit navigation in JSF pages, and configure navigation rule and cases, and describe the navigation evaluation process and how to create a bookmarkable view.

Objectives are here segregated into different topics. We will start with navigations. What is navigation, configuring navigations, implicit navigations, method in Managed Beans that can help you to navigate from page one to page two, and navigation model that you can use a descriptor file to configure navigation rules. And of course, we'll talk about conditional navigation logic and using redirect in navigation. And later, at the end, we'll talk about bookmarking.

What is navigation? Navigation includes set of rules. You need to define the set of rules from what page you'd like to go to what other pages are there. For example, navigation rule says that if I have a page one, let's say I have page one, page two, page three. Would I like to go from page one to page two? Page one to page two. Page one to page three.

Let me type here page one, page two. This is page one, page three, page two. You can also say from page two, you'd like to go back to page one. From page three, you want to go to page two. These rules you can define it.

When defining the rules, you can also specify some conditions. Under what conditions you'd like to go for the page two or page three? Page flow is actually determined by the current page. It will check right now on what page you are in. If page one, it will allow you to go to page three and page two because you have the flow created between page three, one, and one and two.

User action can also result in navigations. When I submit the form, in action processing logic, you can also decide which page you'd like to go to. That all depends on the outcome value that you return from the action methods.

Right now, obviously, in the previous chapter, we just have used the name of the page, index. Return index takes you to index.xhtml. But now, we will define a navigation rule in this chapter and see how we can have implicit navigations, how we can have dynamic navigations, and how we can navigate to other pages using some rules defined in descriptor file. In case you'd like to stay on the same page, that will be discussed when you return something null or you have action method that has return type wide.

Configuring navigations. When you want to configure navigation, you need to take the help of faces-config.xml file. If this file is totally optional, may not be available in your Configuration folder, but you can add them. You can go to NetBeans Add, and you find the JSF web application. You will also get the faces-config.xml file. And there, you can specify navigation rules.

In JSF 2.0, we have additional features for configuring navigations. That's what we say implicit navigation without XML. Remember, in faces-config.xml, you will type some XML elements to define navigation rules. But without faces-config.xml, without those XML elements, how you can navigate, that is possible. And for that, you can take the help of action method. And there, you can specify the name of the pages. That's what we say implicit navigation.

These rules come into picture if no navigation rules are configured in the application resource configuration file-- that is, faces-config.xml. We have conditional navigations. Programmatic way, if you want to navigate, you can use if else statement in your action processing logic. And then you can define which page you'd like to go to as a return value.

Bookmarkability and the view parameters is also possible in JSF 2.0. So we'll see how we can have a conditional navigation through faces-config.xml and using implicit navigation as well. We'll see how to bookmark the pages so that the parameters can be included in your address bar as a query string.

What they say here, the JSF 2.0, what are the two methods for navigation? So far, what we have seen there's a navigation available, implicit navigations. And there's a navigation that can be configured through the application configuration file, that is, faces-config.xml. So I'll go with A and E. That's going to be the right answer.

Let's see defining implicit navigation in JSF pages. If you remember from day one, you people have started doing practices or seeing some examples. And what we're doing it, we have a command button. We can also have command line. They're the same. Only appearances are different.

And action, you specifying the name of the page that you'd like to go to. Action equal to response. That means it is always going to take you to the response.xhtml. It's a literal value. It can be an outcome value defined in faces-config.xml.

So this time, we're not sure it's going to XHTML page, or it is the value defined in faces-config.xml. Whatever the value is, it is always going to be static. That means it is not going to be changed at the runtime depending on some conditions. It's always going to be response. That's why we say static navigations response.

In the absence of faces-config.xml file, it will check if a JSF page exists with the name response. If you have faces-config.xml file, then it will check if this outcome value is defined in configuration rule or not/ If there, it will take the value from there and decide which page to go to. If not, then it is going to take you to the page with the name response.xhtml. That's what here they say default navigation handle will try to locate and navigate to the response.xhtml page.

Dynamic navigations. Dynamic navigation that you can decide at the runtime which page you'd like to go to. And for that purpose, you need to take the help of what? Managed bean. In a managed bean, you may have some methods. Can be any method that you'd like to have.

Don't worry about getStatus, getter and setter something. You have to type the complete name of the method containing the logic and let that method return some value. Remember, in this case, if you have a method-- let's say I'm going to have a method here and my user bean, let's say this class. user bean, it is a managed bean. And this class contains a method with the name getStatus public. Return type is a string getStatus.

Now, with this, you get the opportunity to type your if else statement. If some condition is true, you can say return to page one. And you can also say else, else if. You can return to some page two like that.

That means it is going to be dynamic. Depending on the conditions, if returning the outcome value, it can be name of the page. It can be the name that you define in faces-config.xml. We say the outcome value.

The return value is treated as outcome, which will be replaced here action equal to outcome. And then you will be navigated to your page that you have returned from this method. Remember, if the return is null, in that case, you're going to stay on the same page.

Or if the get status method is not returning anything, public void getStatus. If this is what we have here, there's no return statement. In that case also, you're going to stay on the same page. So that's what dynamic navigations.

Navigation methods in the managed beans. That's what here it explains. See, they say here public string checkStatus. They're calling here some methods in the if block emailVerified. This assumes some method they invoked that returns true and false. If that is true, they say return verified is going to be outcome value. Else if return pending. You can have else return null.

So in different conditions, you can define which page you'd like to go to. This is a typo here. Should not be else if. If there's an "if," you must have condition. This is a typo. We can remove it. Else return pending they say.

So that's why they say return type is not a string. Then if you type some object to be returned, that will be converted by invoking toString method. If the return type is void or null, in that case, you will stay on the same page.

Quiz. To specify navigation dynamically, you need to use resource bundle, use a managed bean property, use managed bean method, or define the navigation in properties file. The last one they say, declare the navigation through faces-config.xml. You have to select two options over there.

Dynamic navigation, which is possible through managed bean. In a managed bean, you can have a method. That method can be a simple method, like here they say checkStatus. Or that method can be like getStatus.

So I can say getStatus is a property. If I say get, it's going to be a property. So I can here select. It can be a managed bean publicly, or it can be managed bean method. Answer is going to be B and C.

Return type is a string or void. Void, that means same page. A string, you can get opportunity to define which page you'd like to go to, depending on the conditions. We will see this dynamic navigations, static navigations with example. And then I'm going to continue with the navigation model.

Let's go back to my lab environment. And let's find here hello.jsf that you people are working on earlier. I have index.xhtml. I set here response.

Right now, if you see that here in [INAUDIBLE], we do not have faces-config.xml. Even if I have it and there's no navigation rule defined, the preference goes to a page. It is always going to take you to response.xhtml. It cannot be decided at the runtime.

Now, if I have here some beans, just type here. My bean is already there, and we can have here some methods. Public string. I'm going to type some method name. Let's say Navigate is the method, navigate.

We need some condition. I can say here, if name. equals, if it equals Nathan. For example, I'm using some conditions. I'm going to say return to a response.

Or you can here say, rather than say equals Nathan, you can say name.length. You can check the length. That would be better. And say if it is greater than or equal to three, go to response. Else, I can say return null.

Let's try this, and see the index.xhtml, what the structure is. We have here required true. That means you must enter something. But as for the logic, what we said, that if the name that you enter, length is greater than or equal to three, it's going to take you to response. Else, you will stay on the same page.

Right now, it says here response static navigation, [INAUDIBLE]. And now we can take the help of bean method. The bean name is user.navigate.

You can have this parenthesis, no problem, no issue, or you can remove it. It's always going to be an action method. Save it. Changes will be applied and hello.jsf, of course, is going to be redeployed. That's the feature of a net bean. That works. Sometimes it doesn't work. Then you should try to clean and build and deploy, and then run it.

I'm just going to 7. If I type here, let's say I'm typing N-I. Say go. Go. I'm there on the same page. It's not letting me go to the response.xhtml. But when I say N-I-T, greater than or equal to, Go is taking me to response.xhtml page. You enter nothing.

Dynamic navigation. Same way, on the multiple conditions, you can define multiple pages that you'd like to go to here in this Navigate method. Multiple action methods you can have that can be used with multiple command buttons or command links. Now, let's continue with the presentation.

Navigation model. Let's see this. Navigation model that you need to define in faces-config.xml. And what you have to do, you need to say navigation rule from-view-id. On which page this rule is going to be applicable, you specify that page URL here.

Navigation case, we have multiple options. You can select all of them or you can select one of them. That's OK. If I just said to-view-id, in to-view-id, you have to specify the page that you'd like to go to. So from this page, you want to go to page two, you specify the page two URL here.

Outcome value, you can specify it there, from outcome. Action methods. An action method that returns some outcome value, based on that, you want to go to some pages. You can also specify it there. And for conditional navigation rule, we have here if elements. That is what is in the navigation model, navigation rule configuration.

See here, the first example what they say. They say from-view-id index.xhtml. Navigation multiple cases you can have it there-- case one, case two, case three like that. And here, you can define these values, which page you want to go to on the case one and the case two and the case three.

This from-view-id, if you want the cases to be applicable on every page, you can use asterisk, which we say global navigations. So we can type this and check how it is going to work with my pages. I'll just take navigation rule from-view-id, and we'll just take to-view-id right now.

So let's go back to the same practice and have here faces-config.xml file added, which is available to you, and the category of JSF. And you can find faces-config.xml file. Next, add it.

And here, you can start typing the navigation rule. See, multiple elements are there. I can say navigation rule. Open and close, just enter navigation rule. Now what I'm saying, from-view-id. See, from-view-id.

Index.xhtml I said here. Let's say index.xhtml. This rule is applicable on index.xhtml. And then you close this.

Cases. Navigation case, multiple cases you can have it. And here, just close this navigation case as well. Under that, you can define which page you'd like to go to. From outcome is there, to-view-id is there. Redirect is there, which we'll see later on.

I just said to-view-id, and I'm saying go to response.xhtml. Close this to-view-id. From index, go to response.xhtml.

Can I say here some outcome? Outcome. You can define outcome value. Let's say here I say success. From outcome. You can set response as well as outcome.

One more case you'd like to have on the same page. I can go ahead with one more navigation case. I say, on failure, its outcome value that you need to select to be returned from bean methods or to be typed with the action properties of command button. Now I can say here go to some failure.xhtml.

Let me have one page here. You want to have the same name, that's OK. I'm adding here a JSF page just quickly. And say Finish.

Let me type here something, some information as to it's open and closed. I say here, this is error page so that you get to know that you are now on the failure.xhtml page. Title, I can change it. Simple one.

Now, in the My Bean, here I'm returning null. I can say failure. Here now, I can say success. I'm not typing now the page name. This is outcome value.

Now, it is your duty to interpret it as a page name, or it is going to be outcome. As for documentation, they are just outcome value.

If the outcome value does not exist, or it is not defined for an appropriate page, then it is going to be treated as a page name. It will look for whether you have a page with the name success.xhtml or not. If you do not have a page, then finally, it is going to give you the error, server side error, SDP 500 error. Or some error messages you're going to get if the page that you're looking for does not exist.

Let's save it. It is deploying my application. See the net bean? Deployed successfully.

And we can type this. I can request to index.xhtml. Remember that we have used required elements. You must supply some value. And I'm saying here, N-I-T-I-N.

Now let's type some other name. Say here Peter, and say Go. You entered Peter. You know which page you are in? You are in a response to JSF [INAUDIBLE] title page. That means you are in response.xhtml.

But what you said? You said success. You returned success, and success outcome value is taking you to response.xhtml. How come? Because in faces-config.xml, you have defined here outcome success means going to response.xhtml.

You can here have, again, success means to load success.xhtml. The preference will go to the first navigation case, and then to the second one. And these all cases will be applicable only on index.xhtml, not on any other pages.

You can have the same name as the page name. No issue on this. If I here type something wrong which is less than three characters, as per the logic, I say P, or you can say T02, Go, it is taking you to failure.xhtml.

If you see that, here in the My Bean, you say outcome value failure. This time, it is going to check in faces-config.xml if you have outcome value defined as failure for index.xhtml. Yes, we have that. On index.xhtml, we have outcome failure. That means failure.xhtml.

So that is going to be navigation cases. Can be very complex as well because you have the option to specify action methods, if for conditional navigation, which will be applicable when the condition is true.

Let's go back to PPT and see what else they have. That's what they say that you can specify asterisk means your navigation cases will be applicable on every page. Navigation cases I just had demonstrated to you with the to-view-id, but you can have action element specified, you can have from outcome element specified.

And from action, what you can do is you can here type the name of the method that you'd like to invoke. This method will be invoked, and whatever logic that you have there will be executed. And depending on the return value, if it is one, if that returns 1, it is going to take you to first.xhtml. That is the navigation case.

From-view-id, you know that, where you specify that cases are going to be applicable on which case. You can here type the exact name of the page URL. You can use some wildcard patterns. Or you can just use some wildcard asterisk, something like that.

To-view-id, you specify which page you'd like to go to. But on top of that, you can also specify action-- from actions, from outcomes, same thing. You can specify from actions and outcome both. You can specify only from outcome or from action, and you can specify neither from action nor from outcome. But this type of combinations you can have in the cases.

Actions. Remember, you need to specify action methods. Outcome, you specify outcome name that you will use to be returned from the bean or to type in the action properties. If a match is not found, it is going to redisplay the current page.

JSF 2.0 navigation cases also support conditional navigation in the cases. They have here if elements where you can call a method that returns true and false. In this method, you can have logic to decide something, to determine something, and then you can return true or false. And depending on the return value, if this is true, it is going to take you to this page. Else, you will stay on the same page.

Now the quiz. Which two types of page-to-page navigation does JSF 2.0 support? Navigation defined by the ID, navigation determined by a configuration file, defined by an @Page notation, determined by an external properties file, or navigation defined by a method or property in the backing bean. Backing bean means managed bean.

Navigation determined by configuration file, yes. And navigation defined by a method or property in a backing bean. You can have a navigation. So we can say the answer is B, and it's going to be E.

The next quiz says that if you have a navigation rule with-- see the wildcard-- that means the case is going to be applicable on every page. On any page, you have action command, action properties, if that says home, or you're calling some bean method that returns home. Which page you will go to? Opens home.xhtml, main.xhtml, index.xhtml.

You see this code? Home means main.xhtml. That means on any page, action equal to home or action equal to bean method returns home as outcome value, it is going to take you to main.xhtml. So B is going to be the right answer.

Moving on to the next topic, using redirection in navigations. You see that by default, when you're navigating from pages, page one to page two or page three, the address bar URL is not changing because the navigation is server side.

From the server side, you're navigating. At the time of render response, you decide which page to be rendered. So response you're going to get from that page that you'd like to see, it is not the client side navigations.

But you want to issue redirection in navigation. That means you want to send a request back to the browser so that browser can issue a redirection so that you can see the URL on the page browser and you can bookmark it.

You can do that. What you need to do is you just have to say an action. Action outcome value, question mark, faces-redirect equal to true. This indicates that this navigation should be issued as a redirect.

For this, you can also configure in faces-config.xml. When it's specifying here outcome, you can say here redirect. Either way, it's going to work fine. If you have navigation cases, you can do this way. Or if you're specifying outcome value in the outcome properties or going for implicit navigation, you can specify faces-redirect equal to true.

Want to give a try to this? Let's see. Can I add it here in navigation case? I can add redirect. Redirect. Open and close both. You need to do it here. You can open and close it. Save it.

Let's try it. Hopefully, it has deployed successfully. Now I'm going to-- see, right now you're there in failure.xhtml. But see, the URL has not changed that we tried last time. Now I can go to index.xhtml and refresh and type 2 so that it can return outcome value failure. And that will take me to failure.xhtml.

And I have specified redirect, right? See what? You're there on page, but see the URL, failure.xhtml. What happened in this case? In this case, it sends HTTP response server.

See, this is your browser. From the browser, when you issue index.xhtml, you type here the URL and you submit the page. When you submit the page, go for processing. Render response, what happened it is sending a response back to the browser, HTTP redirect response.

And the browser does what? It reissues the URL from the address bar and makes a request for the page that you'd like to see here on the screen. This is redirections. So you can type this way or you can use this way. Both are going to be OK.

Bookmarking. 50% of you have achieved in the bookmarks that you now have exposure of the server side redirections that you have changed to client side redirections. You have the exposure.

But what about if there's any query string that you have to attach so that you can bookmark it? For that purpose, you can take the help of view param.

But right now, they say that to bookmark the URL, you have to use GET request. And the GET request is only possible, either you go for redirections from the client side using redirect or faces-redirect-true, this way. Or you can do is you can use h button or h link.

H button, h link, they are the components on the pages. You type h button, h link, and you specify action equal to something. In h link, you specify the page that you'd like to go to, but you will not have server side redirection. This will be translated back to HTML.

And then, when I click on the button, it will issue a page request from the browser address bar. It's just like a href. You can use the view parameters if you have to expose some query string in that page URL which is going to be issued by these two components.

See here what they say? H link outcome equal to success, value equal to done. Type outcome. Or let this outcome be decided at the runtime by the beans. That's OK because that decision gets evaluated at the time of invoke an application phase. Finally, a response will be rendered and you will see a href.

We can try this. I can simply go to index.xhtml. Let's go to index.xhtml. Try it this way. In failure.xhtml, I'm going to type h link. This link has the attribute, what attribute that we can take it here. See this is all for JavaScript, and if you like to use it if in case outcome.

Outcome. I said here home. I want to go to home. I can type here. Do we have value attribute there? Value equal to [INAUDIBLE]. Like this I said. That's what here they say. Outcome value done.

So I'm just typing here home. Home is outcome value. Right now, there's no page exists as a home, and there's no entry of this outcome in my faces-config.xml file.

I can go to faces-config.xml and I can create one more navigation rule. And I'm saying this navigation rule will be applicable on every page. Outcome I'm saying here home means index.xhtml.

This means it is applicable on every page, whether an index or in failure or in response. You can say outcome equal to home. That means index.xhtml.

It is redeploying hello.jsf. We have added this. And now we can go to here, and I can make a first request. Let's go to failure.xhtml. So I need to enter something wrong, less than three.

See now, we're getting here home link. If you see the source code right now, what you're getting, a href. You said outcome equal to home, which is translated to the actual representation of the page URL index.xhtml. And what is its value? It is going to be here, home.

This happens. And now, when I click on Home, the request to go to index.xhtml is issued from the browser. Client side navigation.

Do you have to expose some query string here, q equal to something? For that, you can use view parameter. That's why here they say view parameter. View parameter, that provides a simple, declarative way to map incoming request parameter values to bean properties.

Understand that if you're issuing a request from the client, let's say I'm going to type on the browser. Let's type it here, HTTP local host 7001. You say hello.jsf or any web application context URL/ you say index.faces/index.xhtml. You say query string. Foo equal to something. Let's say you say foo equal to Nitin, for example. Submitting a query string value.

Now, this value you'd like to capture. What you can do is in index.xhtml on the top and the body or in the header, you can use f metadata. And you can specify here the view parameter name equal to foo. Remember, this name is going to be the same as the query string.

The value that you specify that will be read at the runtime by the faces servlet, your JSF runtime and the value will be supplied into these bean properties. It will call bean.setFoo method, and supply the value method over here, which will be stored in the bean properties. So that's what you can do.

That's what here they say. You see that? Page1.jspx is the page, query string foo equal to bar. When you issue a request, in the page1.jspx, they have returned this code. And this is reading the value of the foo, bar. And that is the value which will be stored or assigned to the bean properties foo.

You want to add those outcome value. So when you have h link and you're going to index.xhtml or any other pages, from the client side, h link is for issuing the client side request. You want some values to be included there. You can say include view params true. The view parameter that you have here, the value of this will be included in this URL address bar.

I'll show you the code now for better understanding. And then you will see how to include this outcome parameters. See, we have param tags. I will explain the with examples, a beautiful example that they have here in this lab environment that you can find in the lesson.

Lesson file, an example. You can find a Java quiz. I just close this all.

Go to this Java quiz. See here, they have index.xhtml. In the index.xhtml, they have input text command button. Action properties, they're calling some action processing logic from the quiz bean. Quiz bean is actually a managed bean, which we say backing bean.

This backing bean has array list. Problems is an array list that has multiple instances of the problem object-- problem one, problem two, problem three, problem four. What is problem? Problem is a Java class that holds some questions and answers.

So the quiz bean has instantiated the problem object. They specify the questions and they specify answers. Question, answer, question, answer. So each object has some question, answer. How many objects they have added in this array list? One, two, three, four, five, six.

So right now, if I run this, of course, it is going to open index.xhtml first time. In index.xhtml, you're going to see some messages on the top, along with text box. This text box, which will let you enter answer for the question that is being displayed here.

See? Here, it is calling quizbean.getQuestions. This quizbean.getQuestions returns an object from the array, problems.getCurentProblem. The value of current problem is by default 0. By default, it's going to be initialized with a zero. And then say get questions. That means zero is this element.

Get questions. That means this question is going to be displayed. Now, if you go to this, see what trademark slogan describes Java development [INAUDIBLE]. This question disappears. You have to enter this answer. That is going to be the right answer.

So index.xhtml, say that you enter the answer. Whatever answer you enter, that will be stored in quizbean.response. The Command button, they specify here action, quizbean.answer action, which will evaluate that answer submitted by you is the same as defined in the problem objective or not. If it is same, they decide which page to go to.

See that, here what they have? They say checking here, problems.getCurrentProblem is correct response. It is OK, then in the array, they have the array where they maintain the score. You're going to get marks one, and then it is going to take you to the next problem.

Next problem is the method they call here. What they say, problems.getCurrentProblem getAnswer. They read the answer. And the current problem is [INAUDIBLE] zero, which will become one. So next time you see the next questions. That's what is happening here.

And returns here nothing, right? So this is not going to be satisfied. So what happens in this case? They say if the current problem is the problem [INAUDIBLE]. The end of the questions, the last question returns done. Right now, you people are not reaching to the last questions. Current problem is going to be one. It returns success.

Success is a page. You check here in faces-config.xml has the defined outcome value for success. On the index.xhtml, they say here navigation rule. And see, there's no to from ID. That means it is applicable on every page.

Second navigation rule, let's say again.xhtml. These cases are applicable only on again.xhtml. This case is applicable on every page. So there's no entry for success. That means it is going to consider that you want to go to success.xhtml. If you type something right.

So let's say that I'm going to type something good, right answer. Right answer is that I can read it here. It is going to be run anywhere. I type run anywhere, copy, and go to this here, and say run anywhere.

Check answer. It is going to take you to success.xhtml. Success.xhtml, it shows that you got score one. And it's displaying the next problem because in the next problem method that you have here, they have implemented the valuable of current problem, which was earlier zero. Now it is one.

So now when it displays the page success.xhtml, it is pointing to the next object-- what are the first four bytes of every class file in hexadecimal?

See at the bottom, we have Skip. You do not want to answer this. You want to go to the next. You want to skip this and go the next questions. What is there here? Skip.

If you right click and see source code, see what they have here? Index.xhtml, question mark, q equal to 2. How come they get q equal to 2?

They know that current problem is right now one, you displaying index number one questions from the array list. The next question will be from index number two. If you see that, success.xhtml.

Go to success.xhtml. They created here link. In the link, they say outcome quizBean.skipOutcome. Value in skip. The value is going to be printed as it is. It says Skip. But the URL is going to be determined by this quizBean.skipOutcome.

What is there in quizBean.skipOutcome? It returns skip outcome. It returns index. Or you can return done.

It's at the current problem right now that you are displaying and using the questions for. It is 1. 1 is less than the problem size minus 1. Problem size is 6. The total number of problem objects is 6. 6 minus 1 is 5. So 1 is less than 5. Return index. That's why the URL that you get here for skip is index.xhtml.

And then they attach here query string. To let the query string be attached, what they said, they said param. Go to this Java quiz success.xhtml. They say here f param. Parameter named q is going to be query string, and this is going to be the value.

Because of this, a URL is formed at the runtime for the h link saying a href equal to for your index.xhtml. And query string, q-- that is the main param name-- equal to value quizBean.currentProblem, which is right now 1, plus 1. It's now 2. That's now 2. That's what here you see in this code. That says q equals to 2.

Now, if I click on this button, it will issue a navigation from the client side, from the browser. A request will be generated, see, index.xhtml q equal to 2. To read this value, which will decide the current problem value, if you see the index.xhtml, they have here metadata.

Metadata on the top, it is reading the value of the q, which is now going to be equal to 2, 2. And because of this, when you call quizBean.questions, the value of the current problem in the quiz bean now equal to 2.

And when you call this statement, it is displayed, quizBean.questions. Questions here, see the get questions? Problems.get. Current problem is now 2.getQuestions.

This time, zero, one two. You will see the question, the next questions. What does this statement print? See the page? What does the statement print?

You continue with Skip. Next question. Next question, three, four. Next question, five. Next, q equal to 6. See, when I say skip right now, q is equal to 5. Skip, it will make it 6. Because it's going to be 6, you will go to done.xhtml. See that here? Source page. This is going to take you to done.xhtml.

You know that that was determined at the runtime. You have here the options returned, and this quiz bean to check skip outcome. If this condition is not satisfied, it's going to return. And that is the value which will be used in link options. It will be done.xhtml.

That's what they explain how the f param can be useful to decide the query string that will be attached with the outcome. Outcome, it can be a little value, or it can be determined using some bean properties. Whatever it is, this parameter is going to be used with outcome as a query string.

The last to talk about, the Flash memory. Remember in the previous chapter when we discussed request scope, session scope, conversation scope? There's one more, Flash. And I said that the Flash is the memory that holds the data temporarily.

They have here some examples for you to understand what is Flash all about. This says input text, input text. Multiple text boxes are there. Now, we're not using binding with the managed bean. We're saying flash.name, flash.street. It's an implicit object that is available to you. You can use them with EL. Flash.name.

An attribute will be created in the Flash object with the name Name, with the name Street, with the name City, with the name Zip, with the name Email. Whatever you type and submit, that goes to the Flash memory. When I click Submit button, action confirm. Confirms the literal value. It is outcome. It will take you to Confirm page.

Confirm page is going to show you what you have entered. In the confirm page, they say output text, output text. And they are displaying the value which is stored in the Flash memory. Flash.keep.name, flash.keep.street, flash.keep.city. This is the way you're going to display those attribute values with the help of output text.

Now, if you like it, you want to confirm it, and then you want to store it in the managed bean for further processing. You can click on this command button saying Confirm. And here, we are calling signup.add.

We have a command button for the Cancel. And now, if you click on command button Cancel, you will go back to the previous page, index.xhtml, where you can reenter the Flash information, new information.

Let's say that I click on the Confirm command button that is going to take me to signup.add. Signup.add is the bean methods where they have written the code to read the value from the Flash. With the help of the FacesContext, FacesContext.getCurrentInstance, .getExternalContext, .getFlash, the statement you need to type to get the Flash object in the managed bean so that programmatically, you can read the data which was stored in the Flash.

You could call Flash.get and specify the attribute's name. Type [INAUDIBLE] the string type because by default, their object type is string type. And then you can call set, which is available here in signup bean so that these variables can be stored into the bean properties.

And thereafter, you can decide what you want to do. Like here, they say go to done. That means it is going to show you done.xhtml page.

So that's all about this chapter. In this chapter, we have discussed the navigations-- implicit navigations, static navigations, dynamic navigations, and the navigation cases rules with faces-config.xml file, and how to create a bookmarkable view.

We have some additional resources available that you can go through to find more information on the JSF. We have seen some of the examples over there. Now we will talk about the practices.

## Activity10,11,12,13 - 21m

All right. We're going to start with the Practice 5. In the Practice 5, we are going to play with navigation rules. We see that how to define implicit navigations and, of course, navigation rule with faces-config.xml. We will also see the conditional rules to have a fine-tuned navigation in our existing DVD library applications. OK?

Practice 5.1. In this practice, we will start creating with new JSF page that is list.xhtml and one more for preferences. All right?

So how are we going to do this all? We're just going to simply create a new pages. And then they want us to configure our link in the list.xhtml so that we can go back to home page. All right? There's an action equal to Home which right now not configured. But we will do it with upcoming practices. OK?

Let's do this first job. Go back to your DVD library applications. And in those applications, they want you to create new pages. All right? Let me close this all. Create a page. New JSF Page. The name that they say, List.

Finish. One more page for Preferences. Check the name. It is what they say here. Yep, right. And then finish.

OK. List.xhtml. They want you to type a link, a command link, that can take you back to the home page. Don't forget to include [INAUDIBLE], otherwise page submission will not happen and server-side interaction will not be there. So I'm just going to replace this hello form from Facelets with form and command link. OK? OK, good.

The same they want you to do it in preference.xhtml. As well. So I can go ahead and same thing. I can copy paste to this existing model. OK? All right, good. Now, what else?

See the next? They want you to go to index.xhtml page. And where you have several command links to go to List, go to Add, that you have created earlier. Add this action attribute so that navigation will start working. OK? So I'm just going to go ahead to index.xhtml.

And right now, we just type here Action. Equal to. It's going to take me to list.xhtml. Action equal to add.xhtml. Right? Command link action equal to that preference.xhtml. And command link for the login, right? Action equal to login.xhtml. OK? That's what we did it.

Now you can run the DVD application, and you can see whether this is working or not. OK? It has already re-deployed. We can try here. Saying DVD library. OK. We can use this one.

[INAUDIBLE]. See, if I click on Login, it is going to take me to login.xhtml. If I click on display my DVD, it is taking me to list.xhtml. There we have back to home, options, add DVD, [? right ?]. And, similarly, prefs.xhtml.

When I'm clicking here, the set user preferences, says, "unable to find matching navigation case with from-view-id index.xhtml for action P-R-E-F. A spelling mistake. We will fix it right now. The page name is Prefs. All right? So I just say here s. And it's going to start working. Wait for a few seconds, and then try. This will work.

When you're clicking on back home, it is generating an error. The same page is re-rendered with the error message saying, unable to find matching navigation case with from-view-id of prefs.xhtml for action Home with outcome home.

Remember what happened that we have specified a link here to take you to home.xhtml. It's first going to check faces-config.xml, which, in fact, does not exist right now. All right? And then it's going to see if there's a page the domain home.xhtml available. No? There's no page? That's why it's giving you error.

With the next practice, what you will do, you will create a configuration navigation rule. So that this Home starts working.

So the next practice, they want you to have a faces-config.xml file added into WEB-INF folder. All right? That's what-- the snapshot. And then you can have a navigation rule defined over there where you say Home means index.xhtml. And then you can retry, and you can see that the link on list.xhtml and prefs.xhtml both will start working. OK? Try that.

WEB-INF. Right click New. Here you have faces-config options, JSF faces configuration. Or, if you don't find it, you can go to other JSF. And from there, you can select JSF faces configuration. Next, Finish.

Now, in this case, we can again type the navigation rule. Let's close this navigation rule. Here I can have from-view-id. I can say the cases that I'm planning to have it here for the home will be applicable on every pages. So I'm using wild card. Even if you don't type from-view-id, it is going to be the wild card-- it means applicable with every page-- if you don't type this.

I can have a navigation case. All right? And this navigation case we can define which page to go to. I can say to go to index.xhtml. All right? And you can define an outcome value that will be used in navigations. That's going to be from outcome.

We can give an outcome value to this, saying Home, right? And then close it. That's what they want you to do it. And you can try and check whether list.xhtml, prefs.xhtml links start working or not. OK?

Save it. It will do re-deployment. I can just go ahead and-- I'm doing it in the Google Chrome. And just refresh it. All right? On the back home, it is taking me back to index.xhtml. Go to list.xhtml, same thing. That works fine. OK? All right.

Now, what next? Try to add DVD to the library. That means they want you to open DVD library. But what they say-- the page flow should go back to the home page. All right? Yes? Click Login. And log in with some name. Username and password combination. Add DVD to collections. And verify the DVD successfully added to database or not. OK? And then you will go back to the home page. OK?

That's what you can try. If you want to give a try, you can. It's going to work fine. Add DVD to my collections.

But first, you can log in. Right? Username. Say here [INAUDIBLE]. Password, something like [INAUDIBLE]. Type anything. And now it says, welcome to DVD library application [INAUDIBLE]. DVD my applications.

And now I'm saying enter some title, year, and genre for some movie, right? Some DVD name. Something you can type it here. Let's say Wrong Turn Two.

Type something here. I'm just typing something. All right? I say here it's [? all movie ?]. And I'm going to click on add. See, you're coming back to index.xhtml. Right?

And if you're verified, Go back to the services. Item, click on due date. You see your record now inserted in a table. No? OK? All right. If you go down here, and you will see that 20 records it is showing right now. Click on the Next. And see your record is now inserted. All right? But that's what up here they wanted you to try it in the practice of 5.2. All right? They say, give a try to add something. And check whether you're coming back to the home page or not.

All right. Good. Now let's continue using some conditional navigation cases. Conditional navigation cases. We have faces-config.xml file. And we're going to add one more case over there. This case is for what purpose? This is for letting you go to login.xhtml if the user name, login.username, is empty. So any link that says Add means that you have created to go to add.xhtml. It's the outcome value. Add.

We'll first check if the login username is empty. If empty, it will redirect you to login.xhtml. That's what they need to edit in existing navigation rule. And I'm just going to edit this option over here and save. One more case, navigation case outcome means Add. This will be applicable when you [INAUDIBLE] action value as Add.

Check if login username empty. If empty, it is going to take you to login.xhtml. Else, can't take you to the add.xhtml. OK?

I'll just save it and give a try. And side-by-side, I can also check your add.xhtml that is calling at DVD, right, and returning some outcome value. We can check right now that this add DVD, which is there in DVD library B, it is returning what value. .

I'm typing here Index. Now, if I want, I can say here, Home. No issue. Home means index.xhtml. OK?

All right. Let's give a try. Re-deploy it. Let's go to first page. Index.xhtml. It is saying Guest. Right? That means login. That username is empty. I'm going to click on Add, which lets me go to add.xhtml. Well, let's see. It is taking me to login.xhtml. You know why? Because you have conditional rules added in your faces-config.xml. Right?

Going to Add. Let's check, verify. If it is true, go to login.xhtml. If it is false, then as well, it will decide at means what? Since we have not specified to view-id, it is going to be considered as add.xhtml. OK?

This is applicable only on If. If it is true. So if I log in it, I type some name, let's say [INAUDIBLE] once again. [INAUDIBLE]. Login. All right? If I say Add, it is add DVD. OK? Good.

That is our practice 5.3. And now we're going to move on to the next practice, 5.4. Changing the welcome page. Right now, the welcome page that you see it here, it is index.xhtml. All right? What do you think if I make login as a welcome page. The means first time when you type this URL, without specifying a page, it should open login page. Right? That will be good?

And what I can do now, I can just go to web.xml and change welcome file. And then we can retry and check how it is going to look like. OK?

Let's go to web.xml that contains welcome page name. See the source? Faces index.xhtml. You can replace this here. Or you can select here Pages. And here you can also use the browse to pick up the web page. OK? This will automatically update.

But to do this, you need to try faces-config.xml. The URL for xhtml is going to be with the faces [INAUDIBLE]. OK. If you save it and go to the source to change [INAUDIBLE]. So you type it here or you just go and make changes from there. It is all the same.

Now we can try this. And I'm going to say DVD library. It opens a login page. Well, what happened now? I think something happened to my page login. We can check what's on there in the login page. It is something that is not translated. I think it is not using the URL properly.

So we can go to web.xml here and say, faces like this and try it. Wait for a second, and then give a try. Something wrong? OK, no problem. I'll just change it to login.xhtml. Save it. Login.xhtml.

I actually don't need to start with slash. This is faces login.xhtml. That is going to be the relative URL, which we will use here as a home page. First page, welcome page. Homepage that you specified in the link, home means index.xhtml.

All right. So that's what all about this practice.
