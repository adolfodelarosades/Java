# 14: Configuring and Securing JSF Applications

   * Configuring and Securing JSF Applications - 58m
   * Activity 40 - 33m

## Configuring and Securing JSF Applications - 58m

Let's continue with Chapter 14, Configuring and Securing your JSF Applications. Time for us to actually write the right username and password and see how they're going to secure my pages or applications.

Now we're reaching this point, of extending JSF. In this chapter we will talk about JSF Web application stages first. We'll see the configure the state maintenance method. We'll talk about application configuration loading process, container managed security, using roles and responsibilities, and we'll see how to configure security for JSF Web applications using the security API.

The topics that they have created here to let you understand are Web application stages, the state maintenance method, application configuration loading process, container-managed security, roles and responsibility, and how you're going to take the help of container-managed security with the help of security API.

Very first to talk about, configuring the project stage. See, there are multiple stages at the time of development you can put there in the context parameter so that JSF runtime gets to know what stage your project is right now.

Your parameters is going to be on the stages at for the production, for development, for UnitTest, for SystemTest, or for extensions. By default you see that it is showing you in NetBean it is development. if you go to NetBean and you open your NetBean, any of the project that you have started working, you to go to web.xml, you'll find the context parameter for the product stage. It's set to development.

You can change it. You can here make it production. And we have several values that you can type in there. You can say SystemTest, extensions like that. Development is a default stage. Because that provides more output for better error reporting and debugging.

if we make it production, in this stage it's going to be good for the performance. Because here error reporting and debugging information will not be provided to you. This project stage parameter can also be configured through the JNDI.

Now we have the next state-saving method. This is again, you can configure in your context parameter. You just have to add one more context parameter, as javax.faces.STATE_SAVING_METHOD. And see now, here this says client. It can be server as well.

In this case, for the ViewState, when it is client, the first time when you make it, it's going to create the view, the structures, the state value for the ViewState, it is going to be stored at the client site. So when you repost or give a post by request, it is going to see the state value right from the client. And it is going to restore the view.

So if you see your source code on the browser HTML, you will find several hidden components right there. And one of them is going to be for ViewState, which of course is encrypted. You can make it server side. But in that case you're going to utilize the server resources.

A state-saving method is state information that is saved on the client that needs to be encrypted. You do not have to worry about this, because JSF 2.0, the reference implementation that you have it here right now, it is doing this automatically. So that's it automatically does this if the encryption password is specified as an environment resource named.

You can here, environment entry, and you can specify the ClientStateSavingPassword, java.lang.String, the password type. And here you can specify the password. And then you'll see the encryption is going to happen automatically.

Apart from this, you can have multiple configuration files that contains some information to be read by the JSF runtime. It can be there in a JAR file, in the faces-config.xml. It can be in WEB-INF/faces-config.xml. And of course it can be some .properties file that contains some configuration information. It can be .properties, .xml file, like remember they have tag library. It's a configuration file.

So you want to let them be read at the runtime by the JSF. But you have to do it, you have this order. You don't have to do anything. But then maybe in situations let's say that you're creating applications. I have an application MyJSF, or let's say a DVD application that I am creating. This is a war file.

In this file you have web.inf. web.inf you have faces-config.xml file that contains some configurations, navigation rules. It may have this whole bundle of information. Managed bean registration, you can do it in faces-configu.xml.

Now see that you are reusing composite components. And the composite components are available to you in the form of JAR file, JAR, so that you can reuse them across multiple applications. It can have several custom components as well. So we may have a library file, a JAR file, MyLibrary.jar that contains composite components, custom components. And for that of course, you're going to have faces-config.xml file.

If you have faces-config.xml file, and you bundle your application in JAR, it is going to be available to you in META-INF, META-INF folder. Now if I want to reuse those components, those information which is there in the JAR file, I'm simply going to attach this JAR in my existing applications. This will be a [? passage ?] here. So now this DVDApplication.war file has one more faces-config.xml found in META-INF.

If you have some other configuration files that you'd like to read it for some initializing parameters, for any other information that you may have it over there, let's say I may have MyCustom.xml file containing some information for there. Now this is, which is not a part of war and jar, you need to register it, just like you did in the case of custom components. You have tagged it a .xml file, and you need to register it in the context parameter config files.

So in web.xml you specify a context parameter in web.xml, and there you specify the path to your specific configuration file. I go to MyCustom.xml file. You need to specify that. So if you have several configuration files, then how your DVD library application is going to load those information that are on time when they deploy it at JSF runtime, it is going to give the preference first. Read everything that you have it here in META-INF, this information. Thereafter it will load the information from XML, MyCustom.xml specified in context parameter. And then it is going to load the information from faces-config.xml.

So first, two, and then third is going to be this one. Anything that is duplicate, finally is going to be overwritten by the latest one, recent one that gets loaded.

If you want to specify and control the application configuration file orders, you can do it. You can take the help of absolute ordering type of elements in your faces-config. You can specify the name, myJSF name, absolute ordering you can say what configuration file you want to read first. And then be like that.

Relative ordering, you can specify that you want to read or load the configuration file for the B first, and then later anything else. That's going to be the structure of JSF Web Applications. See the project directory. And that you will have xhtml pages, resources folder, and the WEB-INF that contains all your byte code for .java files, all the test library that you have it, and web.xml, of course faces-config.xml, and this is for application server configurations.

If you're using GlassFish, older version, GlassFish 3 version is going to say sun-web.xml. If you're using latest version of GlassFish, version 4 onwards, it is going to say glassfish.xml. WebLogic, it is going to show you weblogic.xml.

Installing and updating JSF implementations, not all the Java EE web containers and application servers have built-in support for the JSF 2.0. Though it is the part of the Java EE 6, it is mandatory for all those applications that says they are Java EE implementation server, they must provide the implementation for this.

But even if it is not provided by the application server, then you can take the help of third-party implementations which are available. Here in the WebLogic or in GlassFish, you're taking the help of Mojarra, which is a reference implementation of JSF 2.0 API.

Since it is mandatory for all those applications to have these implementations, but if the vendor is not providing their own implementation, they can provide some Open Source implementation so that you can continue using JSF. For additional functionalities you can also take the help of Apache MyFaces that can also be available to you. There are several implementations available in the market that you can download and attach them as an library to be used in your applications.

Quiz. The default stage for the JSF application that provides better error reporting and debugging is-- of course, it's going to be-- did you say development? Yes. It is going to be development.

The disadvantage of using the following state-saving declaration is a server. It's a server. Information is going to be stored at the server site. And then resource use is going to be high.

Now let's talk about container-managed security, if you have to secure your applications, web applications. Very first understand the security requirements for applications. This is the diagram that says that the client is going to call some enterprise bean methods, enterprise bean methods. They're invoking some business logic, taking the help of transport layer protocol, which will communicate with the server.

Now the server will check if the resources are secure or not. If the resources are secure, then if they have provided username and password, which of course are going to be encrypted, will be decrypted by the container. And it will authenticate the user. Authentication of the user means it's just going to check if the username and the password is OK or not OK.

It's just going to check first that the username exists, if yes, the password you authenticate it. If not, it's simply going to reject the request.

Once you authenticate it, it will go for authorization and check whether you are allowed to view a page, are you allowed to invoke a business logic method or not. You may have business logic method to delete some resources. Say for example, deleting employee records. Not everybody can delete the records. Maybe someone is authorized to perform this operation can only delete the resources. So it will check whether you are authorized to do this task, or open this page, view this page. If it's OK, it is going to give the request to you. Or else it is going to reject the request.

And security interventions, we have the transport data protection here. It's just useful to ensure the confidentiality and integrity of the information. You're going to pass the username and password. And it ensures that the information is going to be secured. So we want things to be encrypted while it is being transferred from the client to the server. You can take the help of certificate exchange, or you can encrypt data to achieve the security.

The next one is caller identification and Authentication. In this process it is just going to check the user is a genuine user or not. And thereafter it is going to authorize the user. You can take the help of password challenges, client certificates or digests to perform this task.

Access control implementation for resources that determines a user is allowed to carry out this process or not, it's allowed to do something or not. What they have requested, to view a page, whether they're allowed to view a page, allowed to invoke a method, to delete the resources. This is all going to be verified here at the time of authorizations.

Now Java EE Platform Security Model which helps you to do all these things. And this is just going to give you a kind of relief from typing the code from security transport layer management, for data encryptions, for the authentication and for authorizations. This all is going to be taken care of by the Java EE security model that enables the use of Java EE security model to increase development efficiency and portability.

So in this case, this model does not contain any references to real security infrastructure. But you're just going to maintain the role of the user details, password, and role of the users. It is available to you declaratively or with the help of annotations or deployment descriptor. You can specify the pages to be secured. And of course programmatically, you can have the control to authorize the user to do something, to call on methods. So we're just going to see all those things, end-to-end security model with the help of Java EE security.

A simple way that whenever you try to access the resources, the resource can be a page, JSF page. This can be an EJB method that you want to invoke. It just simply will check if the session is already authenticated. If not, it is going to implement delivery challenges, and may ask you to log in, all right? Whether the request can ask you to log in. And once you enter the user name and the password, it is going to accept your credentials if you are the genuine user, and applies the user to do the task.

Or if the session is already authenticated, then it will continue and go for authorizations. And then you can be allowed to do the job.

Web-tier authentication method, we have HTTP basic, client certificate, form-based, programmatic. HTTP basic, simple authentication method where you do not have any look and feel. You're not going to create any login page. You're just going to access the resources which are protected. And then it is going to prompt you to enter using a password. The browser is going to open a dialog box to accept user credentials. That will be the part of request header.

Client certificate, in this case the client presents the user's digital certificate in response to a challenge from the server. Form-based which we use normally in web applications where you have your own look and feel. Because you decide the page, how it's going to look like by creating a login page. That will be rendered back to the browser whenever they try to access a protected page for seeking user credentials. Let them enter, and then that will go for authentication and authorization process.

You can also have programming approach. You can use this in Servlet security as well. In the servlet where you type the code, as a control logic, you can use this programming over there to check the user is valid or not, programmatically.

So that's for the basic authentication, where the look and feel is not in your [INAUDIBLE]. And this is what is going to be prompt-- it's going to be open. This dialogue box is going to be opened with the help of browser. So browser is going to give you the look and feel, asking you to enter username and password.

If you want this basic authentication, what you have to do it, you have to go web.xml file and have a login-config inserted specifying a configuration method is going to be basic.

So if you see the web.xml, here we have None, Digest, a Client Certificate, Basic and the Form. There's no difference between basic and digest, apart from that in the case of basic, it is just going to send using a password without any encryption. In the case of digest, it uses encryptions.

Client certificate of whether you have certificate exchange, and this is what is the form. So if I say basic, let's say I'm saying basic, see the code. It has included login-config. So your authentication method is going to be basic type. If you select here, Form, then you can specify here the form, form that has the login page. That has a page to let the user type the login username and password.

When the authentication is not successful, the user types something, wrong username or password, you'd like to display a different page. You want to go to a different page, error page showing the information is wrong, using a password or something wrong with this. You can type here the page name that will be open when username or password are wrong. That's what you can type in the form.

User roles and responsibilities, in a Java EE security model, you have to set up the users. And the users can be part of some group. And also they can be part of some of the role. You can have instructor role, admin role, guest role type of the user to identify that what overall people are allowed to do what kind of a task.

Individual user can and often will occupy more than one role. It is possible that a single user can be part up multiple roles. That is possible. So you can create infrastructure of security. Let's say here, the user 1, user 2, user 3. This user is part of the customer role. Second user is also part of a customer role. And the third user it is with a manager role. So two users there with the same role, customer. And this user can be, if you want, you can make this a member of the customer role as well as manager role.

These two people with a customer role can show the account, and the manager can create account. So we have the method show account, create account that can invoked by these two types of people. For this you can have a role mapping.

Role mapping again needs to be done in the weblogic.xml file, weblogic.xml file, it is application server specific deployment descriptor file. Since we are using WebLogic Application Server, here we have weblogic.xml file that you can have the role mapping.

You can type security-role-assignment, role-name, and you can here specify the name of the people. It can be the name of the people means the user name, or it can be the name of group that user belongs to. There are hundreds of users, we cannot type all those hundred people one by one. We can type the group name. That's a possibility that you can have, group as well.

So I can say for example, I have a username Nitin. I have another username Peter. I have second username, let's say, Mr. Zhang. I have one more username, let's say, Nancy. This user name for example, and I can have the group created. I can create a group like manager is going to be group. And I can say user is going to be group. These people, these users, can be part of some of the group.

Nitin, let's say manager. Mr. Zhang is going to be manager. Peter is a user. And then Nancy's the user. And Nancy also is part of the manager. We can assign the group. And then we can finally go and create the role. We'll say for example, admin role we have it. We have for example, instructor role. We have for example producer role here.

Now we can decide what have Nitin, Peter, Zhang, Nancy, we can here assign the roles using the group as well. And then instructor role, and the user is going to producer and with the instructor like this. We can assign the role.

So if you want to use a group name, then still you have to type the same thing. Principal name, the only thing you type here, the group name. It can be a group name. It can be a username there.

So browser is going to send the request to a page, which will be received by the web container. It will see the URL. For the page, we have a URL-based security which says that the URL, given if the URL is secure or not and depending on that, it is going to take you to the login page where it will ask you to enter username and password. Once you get authenticated, your credentials will be stored in the session store. And you can carry out your activity.

If you are allowed to view the page, if you say that only customers can view the page that means all the user belongs to this role be able to see the page content. Other user will get 403 error HTTP status, not authorized to view the page.

So for in the web.xml in JSF to secure your page, you have to say admin. See? This is what we have to say, admin/*. They are specifying here the URL to be secured. And authentication constraints, you need to say what role people can access this page.

So if I said here basic, make it simple. And I'm going to create here the role. Let's say it is going to be admin role. Here I can create a role, and execute a constraint. I can type some name, something here to type it for administration. Something for description purpose, you type it here so that you can decide that this constraint was created for what purpose.

In this web resource collection, you specify the URL that you like to be secured. Now I just have the root URL [INAUDIBLE]. I can type your faces-*. It means I want all the pages to be secure. Not here. I can type it here.

Electively here you type it. Like here, let's say, /admin/*. Give some name here, some name, some description that you want to type it. You can type some description here, some name here, and description, which is optional.

You can also decide whether you want to-- only protect the page from get request or post request. We have option to get, post, head, option, put, trace. Remember with the HTML form, from the browser, you can only be allowed to raise a request of either Get type or Post type. For other type of request, you can take the help of Java scripting where you have to modify users and values. So that it can be treated as head, put, option type of request.

In the web application we have get and post. I just say get. That means if a request is generated get request it is going to be secure. The time of post request it is not going to check whether you are authorized to view the page or not. So just we are going to say all HTTP method in this case. Hit OK.

And it will go back to see the source, all the information is now included. Display name administrations, web resource name some name, URL pattern is very important. So faces-* all the pages we're going to make it secure.

Now here we have Enable Authentication Constraint. And in this case you need specify the role of the people that you would like to give the access to this page. I said, all the pages. This means all the pages can only be accessible by the user that belongs to the role of an admin. If you have multiple role, you can search it here, and say admin, manager, guest, all they can access this page. Like this, you need to do it. See the source now? We have got here a role added, admin.

Role mapping, you need to do the role mapping in weblogic.xml. We do not have any options here to type it, I mean to generate the source automatically. We need to here type the role mapping elements. That is here, security role assignment, role name like this.

That's the way we're going to secure the page. See the web.xml. You will see everything is like that, display name, security constraint, some name, web-resource-collection, something you type it here. Here they say faces/membersonly.xhtml, model and role-name, members. Only members can access this page.

Using the security API, programmatic way, if you want to obtain the name of the user to the programming, in the web component you can use getUserPrincipal. And this method you can call it from the session context. You can also check whether a user belongs to a particular role or not using IsUserInRole programmatically.

In the case of EJB components, you have to use getCallerPrincipal to obtain the user principal object, or to see the user name who is invoking that particular method. And in the method programmatically, you can check if the user belongs to a particular role. And then you can decide what you want to do here.

See now here request.getUserPrincipal.getName, simple way in the web-tier security API that you can use in JSF as well. you can use a request object to call getUserPrincipal, which returns principle object, and from then you can call getName, which will tell you the user name who's trying to access that particular component.

You can also say if request is user and role manager, if this user belongs to manager do what? Like here to say, show manager menu. In JSF we have render properties on the pages that can also be controlled. We do not want some of the components to be rendered if the user is not authorized to see this.

So the single page can give different look, depending on the user role. We can use those options. But you need to type the code in managed bean.

Configuring authentication in the web tier. Web tier authentication is a complex topic. And this course does say it addresses only selecting authentication type, creating a login page for form-based authentications, and using programmatic login.

What I'm going to do, I'm just going to demonstrate a simple program, which will show you just all what they have done it here. We'll talk about programmatic control as well, how you do it in JSF, and then we'll be done with this chapter.

So if we have here one example. See that example. It is in fact a complex topic. A lot of things you need to explore to enable the security. You must have application server configured with LDAP or authentication provider, whether username and passwords are stored or will be stored.

So what I'm planning now to take you through here the WebLogic Server, first Admin Console. This is indeed important to carry out the example, the practice example which I want to demonstrate here. Because the user name must be stored somewhere. Weblogic is the username and password is welcome1. Say Login, weblogic. OK, welcome1 is the password.

Now if we go to this page, it's totally Administrator Console, Administration Console page to carry out some admin-related tasks on the WebLogic Server. We have Security Realms over there. And your server actually needs to be configured with authentication provider, which you can do it here by creating a realm.

You can create a Realm here that says MyRealm. And the realm, once you create it, you will find providers to configure your realm with appropriate authentication provider.

Now go back to this realm. I'm not going to create all those things. Because it's just that server here is standalone server. And then we have to restart the server. And we do not have any other authentication provider [INAUDIBLE] that we can configure here.

So I'm just going to use the existing realm. This existing realm is by default configured with the file system, where your WebLogic Server is installed. Installing username and password to protect the WebLogic Server. Remember, we have weblogic and welcome1. So where they store username and password for the WebLogic itself, I'm going to store my username and password for testing my applications.

Here they say users and group that I have it and options, and the weblogic is one of the user names that we are using to start or stop the server, and even to log in with this portal. I'm going to create a new user here.

I'm going to say here Nitin, user name. Password welcome1, welcome1. I'm creating one more user name. Let's say Peter, password give the password same, welcome1.

If you want, you can create a group as well. And then you can assign these users to a group. But I'm just going to make it simple, two users, Nitin and Peter. That's it. And we go back to our applications.

In these applications they have one example. Let's open this example. Chapter 14, Security Example. So I request you all to spend some time with the security example. Because that's a beautiful example, starting for the server security, JSF security, EJB security, all everything is there in this example.

Security example, when you first see the pages that we have it here, we have multiple pages. Not all the pages are going to be secure. They just have secured membersonly.xhtml page. See what this is doing? It is just displaying here, access to this page is restricted via web.xml, and giving you a link to take you back to index.xhtml.

This information is there in the membersonly.xhtml. Now if we go back to web.xml, and see here the security part. They have security constraint created that ties the name membersonly. Here they say secured page. And here they say URL patterns for the page to be secured, that is faces/membersonly.xhtml.

See enable authentication constraint, who can access this page? Only members. Only members can access this page. Right now there are two users, Nitin and Peter, right? Nitin and Peter. Yes, Nitin and Peter. One of them in WebLogic as well that we can use it. And we need to perform the role mapping.

If we go to weblogic.xml, you have the roles created. Where to create the roles is again in web.xml. You have options for creating the roles. See here you can add, say user and admin.

Now in membersonly.xhtml-- OK, one thing here is the problem that the role name is admin and user. But here with the typing, they're saying role name is member. So I'm just going to change it to admin. This does not exist.

So admin is going to be the main thing here. Or you can say this is the user. This is a member. Let's say user is going to be member. Or you can create a new one here if you want. So I'm just using the user as a member.

And now I will go to weblogic.xml here. And here I can say the user-- if you have the group, you can type the group name here. And I'm going to say here it is going to be Nitin who is a user, means member. And I'm going to say Peter is going to be Peter. And we do not have any right now Peter we have inside WebLogic. These two people in WebLogic are going to be with the admin role.

Again you can type the group name if you have that. Save the changes. All done. Nitin is user. And it's a memberonly. I mean this page is accessible by the user only. OK. All good.

Now one more thing you need to understand that how it is referring to this realm. Remember that this is the part of the realm, MyRealm. You may have multiple realms configured in your WebLogic Server. But how does it affect the realm where you have the stored the username, authentication, provider, configured storing username and password.

If you see that here, on the tag when they say Login configurations is formed, here you specify the realm name. But in this example, we are not specifying your realm name because MyRealm is default. So if you're not specifying any realm name, it is going to be validated against the default realm, that is MyRealm. So here is MyRealm.

We have here the form that says authentication method form that exist in HTML they have created. And they have created bad log in .JSP as well. Which if you type wrong username and password, it will be opened.

And the source code, what else they have done in it, they have specified here error code, see? Error page. They say could if the HTTP status code is 403, then it is going to open or redirect you to not allow .JSP. So they have not allowed .JSP here, that says you entered good username and password, but not allowed to view the requested resource. Remember 403 is the HTTP status codes which will be returned by the server when you're not authorized to view the page or to execute a method or to call a method.

I can run this. And this is going to open index.system. All that contains some couple of links to let you open members.xhtml, program-forms.xhtml, account-info.xhtml like this. And here I'm going to click on membersonly.xhtml. And look what, this is redirecting me to form page.

This form page, if I type Peter, and if I type here welcome1, right password, say Login. It is displaying here, see it says you are membersonly.xhtml. But here they say you entered a good username and password. But not allowed to view the requested resources. Because you said Peter, and the right username and password, but Peter belongs to admin role. And the membersonly.xhtml can be viewed only by the user role.

So if I go back to index.xhtml, your session is now authenticated. Go back to index.xhtml, and if you see that here account-info.xhtml, it says request.UserPrincipal not equal to null, true. Yes. It is not null. Name, Peter. Remote user, Peter. Request is user role admin, yes, true. It's admin role. And they're calling here the bean properties that can also help you to see the username, and check the user roles.

So this page is here. They have it where they introduce some set of EL expressions that can help you to display the UserPrincipalName, to check if the session is authenticated or not. Request.RemoteUser can also be used to display the user name. And it can also check or call the user and role methods, to check if the user belongs to a particular role or not. And you can programmatically also decide what is the user name, whether this belongs to particular role or not programmatically. You need to write the code in managed bean.

So they have here the example that how in managed bean, you can write the code. If you see the security bean here, they have the code. This returns the principal name, say Principal.getName What they have done, is simply have obtained the principal object through interactions, CDI interactions that can also help you to see the username, principal name, and check if that belongs to particular role or not.

Or if you want, you can take the help of faces-context, getCreateInstance.getExternalContext, and with this, external context which belongs to the session has been authenticated right now with the user. You can use, using role admin, and you can return true and false from there.

Programmatically if you want to login, you want to pass the username and password in some bean properties like you do in DVD library. And then when you hit the login button, you want to call a method login. And that method is going to help you to hand over those data to the container.

For this purpose you need to take the help of the code. Again with the external context, you can obtain the get request object, which is HTTP Servlet request type. And then you can say request.login by passing the bean properties that actually holds username and password. So from here, you will hand over this data to container for further authentication and authorizations.

Similarly for the logout, you can take the help of request object, that is HTTP request type, and programmatically you can save it first.logout. Your session is going to be invalidated. So that's how you can do it here.

So if I go back to the home, and say program-form.xhtml that I have it here, calling logout, that method log out. You again, type here Nitin. And the password welcome1, Login. Go back to the home and see membersonly.xhtml is now displaying the message.

Because you are allowed to see this message. So that's what here they explain to you. They talk about setting basic authentications, basic type, form type, you can set up their realm name. You can specify there. Not specifying realm name means you're going to use the server default realm.

You can use 403 error code. And you can specify which page you would like to go to if server is saying this HTTP status code. And that's what the login page, if you want authentication method form type, you specify the page for the login, and specify the page for the error.

Whenever you try to access any protected pages, it will take you back to the login page for seeking username and password from the end user.

Login page that you create, now if you want to hand over the login information using the password directly to the container, you type html form, and action equal to j Security, j_security_check. Username, input name must be j_username. And the password name must be j_password.

This way when you submit an html form, the data will be handed over to the container responsible for security. Although what you can, do you can use the JSF page, and from that you can hand over the data to the managed bean. And then from the managed bean you can use external context to find HTTP request object request.

And from there you can say request.login by passing username and the password. that is also OK. So that's what they say. Find request object, and then you can use login and pass username and password. Log out to invalidate the session.

Now we have the quiz here. Select three common security concepts. It's scalability, authorization, authentication, confidentiality. Of course is going to be B, C, D is a security concept. They are the security concepts.

Roles are tied to which of the following? System and users, Users and privileges, Systems and database, and Privileges and the systems. It is going to be tied with users and privileges.

Web-tier components configure their security settings in which file? web.xml.

Identify the version of enterprise Java that first allowed the ServletSecurity annotation to be used in Servlet. What? Java EE 6. A Servlet can also be secured through the web.xml. But on the Servlet you can use these annotations so that you can avoid typing the URL in your web.xml to secure Servlet.

This says we have this login-config in the web.xml form, realm-name, ldap. And from login page, login.xhtml. Error page is error.xhtml. And they say select the correct options. This is configuring authentication of web.xml, authorization in application.xml, configuring form-based authentications, and code for the login page.

This is the code snippet from web.xml, configuring form-based authentications. That's all about this chapter. And we're going to start the practices soon.

## Activity 40 - 33m

Let's continue with the practice for lesson 14. And in this practice, we're going to configure Java EE security on my DVD library applications. So what they want, they want you to open the DVD library project that you are working with right now. And you just have to go to the console administration URL for the WebLogic server. And there you have to create some set of username and password. OK.

Let's do this quickly. Right-click, view admin console. I do not have to type that URL. It will launch that WebLogic server here. And I'm going to enter the WebLogic username and the password welcome1. And this [INAUDIBLE] we're going to create the username and password as they're listed in activity guide. User [INAUDIBLE]. And they want us to create a pat [INAUDIBLE]. Pat, and type here welcome1. OK.

We'll type one more. This is welcome1. Welcome1. OK.

Now the last one, [INAUDIBLE] the same username and password, welcome1. All right. We have created a username, password there. And then we have to go to DVD library and have some modification to be done, and login bean, managed bean.

Minimize this. Go back to your DVD applications. You can close this all. This one, and here, you can see the login bean.

Now here we have to insert this code as admin. And for that, you go to your login bean, and here write the code that will attempt to enforce depending on the users if it belongs to admin role. [INAUDIBLE] import for this so that our Faces context, external context, Faces context can be included in the import. And this will return to enforce if the user belongs to admin role.

And Next. What they say for the login? Remember, all the username password that we type it in the login page we are submitting and updating in the login bean managed bean. We have to take the help of request object so that we can handle this data for further authentication and authorization by the container. So we need to view this code there, and my login.

Login method is not there. We can include a login method. Simply type a login method over there, which we will call from the command button. And there we will insert the code that they have recommended us to type it.

External context, first find out the external context, because with this you can find your HTTP server request object. And this, you have to fix import. Then request login username password.

So the username that we are here trying to pass in, that is in lowercase. When this is successful, we will return index. We will go to the homepage, index.html. If it is not successful, it will close on exception that we will catch. And with the logger, I'm going to log this information on the WebLogic default log file. OK? It's all lowercase in the username.

All right. This information will also be included in the FacesMessage so that it can be a part of the FacesContext. See with the FacesMessage failed to login, I'm going to produce error message which will be consumed by UI messages. UI messages that gets inserted at the end of the page. And that will produce the message, your FacesMessage.

This message is not associated with any component's ID, so that's why it is here null. Return null, that means display the same page in case there's some error. At the logon [INAUDIBLE] login bean class we will have a logout methods. And this logout methods again we will take the help of the code for the request parameter, and we will call request.logout. [INAUDIBLE] public a string logout saying quote you need to type it to obtain [INAUDIBLE] request object. We'll retype it here. And what we'll do it, we'll do request.logout.

See request.logout actually throws exception that you need to handle. So don't forget to include client catch to handle the exception in case it is not successful in logging out. Then you can cancel the exceptions. And here I can say catch and type the exception that's going to be the solver exception.

In this exception, you can type the code, what you want to do it if there's some error. You can take the help of the logger to record informations in WebLogic log file. And finally, at the end, don't forget to return null. It means it displays the same page. That's what we're doing it here.

Next one is to modify login.xhtml. Remove the code that was added to use [INAUDIBLE], [INAUDIBLE] call, you need to remove it. So I'm just going to see login.xhtml. We don't need progress bar right now. You can remove everything that you have so far.

So here they have the full page. See heading, side bar left content area. Let's check this one-- etch form render request equal to null. Everything that you have in the form, just remove it.

So define content. Everything that I have so far in scripting, we're just going to remove it-- OK, until this form, and replace it with a new code. All right. Now they say, see they say etch form render request.userprinciple eq, equal to, null. This will make sure the form is going to be rendered if the user principal and the request object is equal to null. That means you have not authenticated you session with any username and password. That's why you're going to get the form.

If you have authenticated the user against a page request, your session authenticated. And in that case, form will not be displayed. The render you can control. What they're using now, the util sign-in, remember util, that is your composite components. And the util sign-in, we have some properties. Username [INAUDIBLE], username, which has the value binding with a login now. Password prompt. For the password textbox message, this is for the password box [INAUDIBLE]. Login.password. And these are two attributes which will be used by your command button in your composite.

And utils because it's giving the error because the util is not a task, it's a [INAUDIBLE]. So I can update it here. I can say util. That's going to be OK.

Now the form is closed. And they have one more form. See there's one more form. They have it here.

This form is rendered if the user principal and the request object is not equal to null. The first one is equal to null, the second one is any not equal to null. That means you have authenticated the user. If your session is authenticated, in that case it will not show the form, but it will show the second form. The second form has the options for logging out.

Command button. And this command button is calling an action properties from login bean, logout. So you're just going to get only one of the form at a time. UI define, UI compositions.

All good now. Now what is next. Next is add a logout link to the side bar left xhtml file located in webpage section DVD library. Webpage sections DVD library. So here, section DVD library we have side bar left. This side bar left has some command links available. And they want you to have a command link for logout as well.

So we can add this. One more. We can add it here. With HR [INAUDIBLE], and then we're going to say here command button. And action equal to we're going to call login.logout. This will remain there in side bar left.

Now they want you to test the login form to verify whatever you have done so far, it works or not. You can deploy a DVD library application and try to run this with this URL. So I'm just going to run it from here. You can make sure [INAUDIBLE], or you can deploy and run it. I'm just going to say run, which will deploy the changes and initiate a request.

I have a login page with me. I'm going to use any other user that we have entered in my [INAUDIBLE]. So here, this suggests you to enter [INAUDIBLE] first, or Andy or Pat. And other login names or incorrect password will not be authenticated, and you will not be allowed to see the homepage of the applications. All right, let's type this all.

I'm going to enter here Nathan. Nathan, I can use it, but because that is there in my URL. But I can type Pat that you have entered right now. So welcome1. Successful you're getting here. [INAUDIBLE]. Now if you go to the login, once again you go to the login page.

See that? This time the form containing the username password complements are not getting to display. Those components are not here displayed, because in the form you said, remember, you said render properties if it is not equal to null. And this say equal to null, and here it say not equal to null.

So right now, user principal is there, because your session is authenticated. And now it is not equal to null. That's why it is showing you this form, which you can use to log out. Log out.

Same page is redisplayed. So return null. Login page is redisplayed to you, and this time this form is visible to you, because this time it is equal to null.

Type something wrong. I'll give some wrong password. Log in. You're getting here failed to log in. See, we have not specified the location where we want etch messages to be printed. That why it gets attached at the end of the page. If you want to specify a location, you can put here somewhere, within the UI define, you can put etch message.

Messages, not etch message, because you have not associated the message with any components. So I said here. Now retry to type something wrong, username, password, login. Failed to log in. All right.

Now you can specify here a style if you have any. Are we using any style classes? All right. If you're using in CSS containing error, a style class you can, else you can type CSS directly. Color equal to red something like this. Now save it.

And now if I refresh and type something wrong, failed to log in. All right? That's what here we have included in the FacesContext. Add message, FacesMesage. See? There's no component ID. That's why I used etch messages.

OK. Now the next one is [INAUDIBLE] that you can configure the security role so that you can protect some of the pages. They want you to go to web.xml, and the context param tag where you can specify [INAUDIBLE] you can just directly type it. See what they say, they say role is user, and role is admin. So they're creating two roles.

Now we have not protected any pages. We just have ensured that login is going to be happened with the help of programming. So my session can be authenticated, but you're not securing any pages.

Now we can go back to web.xml [INAUDIBLE] enough. All right, they want you to just below context parameter, type it. [INAUDIBLE] typing, you can take the help of security options here which is available to you, and you can create two roles from there. Two roles, user and admin. I'll just type user.

If you want, you can type description as well. I'm typing here admin. OK. So now if you see that in the source, it is now added. I've not typed description, that's why you don't see anything.

All right, good. On the weblogic.xml, you have to go for the role assignment and Duke, Andy, Nathan, whatever you have the list of the user, you can assign them to a role. So weblogic.xml. Here you have the file. Below the context [INAUDIBLE], you just type those informations to have a role assignment. You can say role name admin.

Username Duke and Andy are going to be admin role. And the Pat, it's going to be with the user role. OK?

Now they say create a new XML page in the webpage node, and say not [INAUDIBLE] file. And there you should have some information added. You are not authorized to perform this task.

So I'm just going to create this, a new page. JSF page. And say not authorized. OK? All right.

Say Finish. As well, you have to get the common look and feel, so you can implement your template. I'm just going to copy this here with the body, so everything that you have like title, that's all going to be ignored, because they're using UI compositions. And with this, I'm implementing my template UI define, which will help me to specify what I want to put at the place of heading in the template.

And now I'm going to just align this. It's giving the error because we have not added a Facelets [INAUDIBLE] here. Now the content area, what they want, they just want a simple message to be displayed. You're not authorized to perform this task. All right? And then we close the UI define, UI compositions.

All right. So I can add here the tag library which is responsible for templating, that is Facelets. So as well, I just copy this entire information and paste it here. And then I'm going to make necessary changes here, saying Facelets and giving this name UI. Perfect.

This is Facelets. Type here s, and see now everything's OK. This page which you have created you will use to display when the user is not authorized to view some content.

Now faceletsconfig.xml, they want you to modify the navigation rule, and they want a new rule to be inserted and [INAUDIBLE] case to be inserted for outcome add, say if login admin is equal to false. We're just going to insert this code in this navigation rule for the global navigations.

Let's open faceletsconfig.xml. We have the global navigation rule here. Have case one, case two, and the rule chain. We have one more rule here, outcome add empty login username. If the username login empty, that's what here. Let's see where they want us just to type-- OK, let's modify the existing one.

Empty login username, login.html. And below that, we can insert this. One more navigation code case below that.

All right. So one more case as you got it here. And this case is doing what? It's applicable to all the pages. From any of the pages, if you're using command button or command link, and that action outcome value is going to be equal to add, it will follow these two navigation cases. It will check first if the username is empty. It will take you to login.html. That's OK.

It will again check if the login.admin equal to false. The user does not belongs to the admin role. It will take you to notauthorized.html. That's what through the navigation rules. We have put conditions over here. That means we want add pages to be viewed only by admin people. That you can do in web.xml, when you secure the URL and specify the role to have this access for the space.

But it's OK, navigation cases. And as an alternative to step D in the previous task, you can also modify add method of [INAUDIBLE] bean to execute only if the login user belongs to the admin role. That's what you can also do it, if you want. You can go to Add DVD, and then you can say if login.admin true, then you can execute this whole method. Else, you can include error messages to the programming. It's alternative method. If you don't want to do this programmatically, you can do this. Just ensure that only admin can insert the records.

But here in the first case, it will not let you go to add.xhtml page. For the second case, you can go to add.xhtml page, but you enter DVD title, you enter all those information and hit on the Add button. And then it will check if you're not admin, it will not [INAUDIBLE] and give you the error message. That's what you can type.

Test the DVD library applications. I'm just doing the first one here, which will not let you go to add.xhtml at all if you're not an admin. So let me just check in the WebLogic who is not admin. So I can see that Pat is not an admin. Duke and Andy admin, they belongs to admin role. Duke and Andy.

Refresh. Let's log in with the Pat and say welcome1. Click on add to DVD. And see now it is saying you're not authorized to perform this task. You said add DVD. This command link action is add. Outcome value is add. In this case, your navigation case is applicable that says login.admin is equal to false. Now you're not admin, and this redirects you to notauthorized.html. That shows you're not authorized to perform this task. So you're not at all going to be with the add.xhtml page.

If you do the alternate arrangement, in this case you will be allowed to see add.xhtml. But when you try to insert the add, insert records, hit the add button, you call add DVD. At that time, it is going to give you error message attached to your UI messages. All right, good. That's all about this practice. And now we're good to go ahead with the next chapter.
