# 12: Securing Java EE Applications

1. Securing Java EE Applications - 38m
2. Practice 12-1: Adding Authentication and Authorization Logic - 17m
3. Practice 12-2: Configuring Java EE Web Module Security - 9m
4. Practice 12-3: Configuring WebLogic Security and Mapping Security Roles - 7m
5. Practice 12-4: Adding Programmatic Security and Testing the Application - 16m
6. Skill Check: Securing Java EE Applications - Score 80% or higher to pass

## 1. Securing Java EE Applications - 38m

Let's take a look at the ways of securing Java EE applications. In this chapter, we need to look at the way Java EE security works; then, how do we define authentication and authorization within the Java EE world; using login modules to authenticate users; and also defining application roles and security constraints to make sure that only properly-authorized users can access relevant resources.

We try to define security in Java EE declaratively. But sometimes, we might have to do it programmatically as well. So we'll look at both approaches-- declarative and programmatic approach. At the very end of the session, we're also going to take a look at a very different set of security concerns related to the web services. Because you see, web services, SOAP services-- they have their own security standards. Well, basically because they're not necessarily written in Java. Web services kind of service-- which implementation may vary. It's not necessarily just Java.

And therefore, standardization of security for the web service has to transcend just Java world and be more universal. So it's not just Java EE. It might be a wider set of specifications that we have to consider with regards to web services. But let's start with Java EE security.

To implement security in Java EE applications, we could use Java Authentication and Authorization Services API. Authentication is a process of establishing the identity of the caller-- whoever invokes us, or they are who they say they are. So make sure we understand who these callers are. Authorization is establishing the permissions for that caller to carry out actions on our system-- allow or disallow them to access resources and make calls.

In addition to that, Java EE servers can also be configured to protect transport communications, transport protocols. And there are two things that you could consider configuring in this situation. And it's confidentiality and integrity. Confidentiality means that you're encrypting and decrypting data packets, the network packets that are coming in and out of your server to protect them from unauthorized access. Integrity means that you are checking if the packet hasn't been corrupted in transmission, if it's still valid. Is it the same as it was sent?

The Java Authentication and Authorization Services API allows you to perform declarative configuration of security properties. This is part of your server's configuration. Now, there's a part of the configuration that you need to do on the actual application server. And there's a part that you need to do within your application.

On the application server, you need to configure JAAS security provider's. A security provider is a plugable module that goes into the JAAS application API and allows your server to access security servers that might be externally located. Some Java EE service may provision the security service part of the server configuration. For example, WebLogic server has an embedded LDAP server directly as part of the WebLogic itself.

But even in that case, technically speaking, the rest of the Java EE server accesses that via the plugable security provider module, even if it's a recursive security server that you're using that's embedded directly into Java EE server. Of course, in large production systems, you probably would use external security service-- I don't know, all sorts of internet directory service which keep information about your users, groups that you want to access from your environment. So that's done by server administrators. They're responsible for that part.

Now, as a developer, your job is to configure security within the Java EE application. You can do it with annotations or you can do it with XML deployment descriptors. So that would be files like web.xml or ejb-jar.xml or annotations inside your beans or inside your web components. The bits of the configuration that you need to create include a login module, which is a part of the web part of the application. And the login module is the mechanism via which you would like to challenge your callers to produce authentication.

So what would you like to do? Do you want them to present username and password? How exactly? Do you want to-- I don't know, present some sort of digital signature, validate that? It might be different means of ensuring that the caller is genuine. Username, password is probably the most obvious. But then again, it's your choice. So that's your login module-- how exactly you process authentication information. OK, you register the login module with the web.xml file. It's something you have to do in a deployment descriptor.

Now, the next bit-- application roles and security roles-- you can do it either in deployment descriptors such as web.xml or ejb-jar.xml or via annotations, whichever way you like. These are designed to provide a description of application security roles. Think about it this way. Do you know who the real users in a future system are going to be? Not really. As a developer, you have no knowledge about real-world users and groups within your security server. The server administrator probably knows that. As a developer who's developing the code, you're probably not really aware.

So what do you do instead is that you invent security roles with a DeclareRoles annotation out of thin air. You just say, I think in my code I need to invent the role A, B, whatever-- customer, employee, whatever roles you need. So you just invent these roles. Any security constraints that you want to specify, you describe them as a constraint that limits access to certain resource in a web container that will be web URLs, servlets, pages. In an EJB container the resources would be Enterprise JavaBeans, their methods.

So certain resource, you limit access to that resource-- to that URL or to that bean-- only to members of these logical roles. So saying, you've got to be a member of an employee role to access that URL. You've got to be a member of customer role to call that bean, or something like that. Fine.

Now, there is a bit of a problem. We've got application roles. We've got constraints referenced in these application roles, but they're not related to real-world users and groups. So we need to map application roles that you've invented-- as a developer, as part of your application code-- to real-world users and groups that your server administrator keeps in the security server, which we access via security provider.

And that's done with service-specific deployment descriptor files. In a WebLogic scenario, that will be WebLogic XML or WebLogic ejb-jar.xml. Well-- and could be different descriptors in JBoss or WebSphere or Tomcat or whatever. Depending on which server you're using, there will be different XML descriptors for each one of these cases. But they all have an equivalent descriptor, where you can take a role name that you are using within your WAR or JAR file and map it to real-world groups or users that you had on your security server.

And therefore, when the user will log in to the system-- using whichever login module you've configured. So the user logs in. The user will happen to be a member of certain groups. And then this user, these groups are mapped to some application roles. And that mapping then translates to permission for that user to access whatever resource, based on how the declared roles are related to security constraints, based on that configuration that you provided, either via annotations or XML descriptors.

Well, this is the flow of request authentication and authorization. A caller makes the call to our Java EE server, sends or request. That may immediately trigger the invocation of a login module. It could be that the user explicitly calls some kind of login page. It could be that user's trying to access some other URL, which happens to be restricted by the security constraint. So there is a restriction. If the user hasn't logged in yet, the server will trigger the login process-- basically, send the user off towards the login module that you've provided.

The user will supply authentication information-- username, password, whatever it is. That will be checked via the JAAS API through the security provider against the actual external security server. And that concludes the process of validating the credentials provided by the user. Once that's done, then we can proceed to resolving the authorization. Right.

Now, just a very quick reference to the terminology. Instead of saying user, the JAAS API refers to a term called security principal. Security principal can be a user. But you see, the invoker that called your application may not be a human being, right? It might be another application. So principal is kind of a more generalized term, saying that is your caller who you have authorized.

Security principal is a known security identity. In a simple case, yes, it's the user. In a more complex case, that could be some application. Maybe they, instead of username password, use digital signature. Whichever way that's done, by that time, you already have authenticated that caller. So you know who they are.

Now you are checking if they have access to a particular resource. Do they have permission, according to the security constraint configuration, to call page, URL, bean-- whatever it is that they're trying to call. And if they do, the access to resource is granted. And they can proceed with an invocation and get their response out of the server. Well, if they don't, they'll get an error.

OK, so there might be two kinds of errors in this process. One is that they fail to log in the first place. So that will be an authentication error. But another type of error could be that they've logged in successfully, all right. They just don't have permission to go to a particular URL. And in that case, there will be an authorization error, so depending on what went wrong in that process. Or else they'll get the resource.

Now, login module configuration. That's done in a web.xml file. And there are several possibilities here as to what the login module could be-- HTTP basic, digest, form, client, mutual. The most common is probably form. That's probably the most frequently used way of authenticating, which is exactly what example shows here.

So a form basically means that you construct a custom HTML page-- your page, whatever it is. And it could be just plain HTML. It doesn't have to be dynamic, actually. Anyway, the page contains a simple form which submits itself to the servlet, called j_security_check. You don't write that servlet. It's already written for you. And you submit to parameters j_username, j_password-- as simple as that. So that performs the authentication for you.

In a web.xml file, all you need to do is just to say, this is the type authentication that I'd like to use, form authentication. And then configure the location of that login page. Oh, and of course, if the user have a problem logging in, then what sort of error page to display to the user-- so custom pages, just anything you want, really.

Now, this one bit here, which is security realm, what's that? You go to the website. You provide a username and password. You're successful. That's fine. So you have been authenticated-- ta-da! You go to another page in that same site. Do you need to provide a username and password again? Not if these pages are in the same realm.

Realm is basically a label against which the user authentication token is memorized. So basically, when you authenticate successfully, the browser receives the token from the server saying, yes, fine. I know who you are. Next time you call me, present me that token.

Next time the browser calls the server, presents that authentication token, the server is only checking-- it's not revalidating everything again. No, it's only checking if the user is accessing resources within the same realm. If the user accesses resources within the same realm, token is still valid. User is allowed to proceed, so long as their security constraints permit that role to access the resource. If the user is trying to access a page which is in another realm, the login page will be triggered again.

Basically, just describing the realm is describing a group of resources for which a single login page will do. If it's another group of resources where you need to reauthenticate, fine. Create another realm. Maybe you want to do that, I don't know. Depends. Maybe there is an additional sort of extra-secure area of the website where you require users to perform additional login. And that might be what your prompt-- would prompt you to create another realm configuration. So that was probably the most common form.

Let me just quickly comment on some other forms. HTTP basic-- I don't know if you've seen that. But it's when you access the website, and it sort of pops up on your screen, a small dialog saying, enter username, password. That's it. That's the basic for you. Well, you could use that, I suppose.

So apart from the form authentication, there are other forms of authentication you may wish to use. For example, HTTP basic-- probably you've seen that on some websites. You're accessing the website and it pops up with a dialog saying, please enter username and password. HTTP digest-- very similar to that. Same dialog pops up from the website. But the password is attempted to be transmitted in a scrambled form.

There is a problem with these approaches. They're not widely used. And actually, some application servers don't even support digest. And let me explain what the problem is. If you are accessing a website via HTTP protocol, then you're transmitting anything from your client to your server in plain text. So what's the point of asking about a password if you're going to transmit it through the network in open text? That's not secure, is it?

So rather than attempt at encrypting partially that request, like the digest does, it's actually worth just configuring HTTPS Listener. So if your entire conversation on protocol level is encrypted-- not just HTTP, but HTTP with SSL-- well, then, you're fine. You'll provide your username and password as part of your authentication. And they will be transmitted through the network in encrypted form, just as any other traffic that goes from that client to the server. So really, just configuring the login module on its own is not secure enough. You have to configure the transport-level security and HTTPS Listener as well in order for this to be a secure form of authentication.

Another option is client authentication, where we can ask the client to present us a security certificate-- digital signature-- which we could have registered with our server-side SSL wallet file, and basically say which SSL signatures we trust, or how they translate to our actual users. Or it may be something that you will use for authentication of applications, rather than users, where username and password will seem to be less applicable and digital signature will probably make more sense. So it's something that people often use when they configure security-- for example, when an application, rather than a person, needs to tell the server that it's genuine. Like a mobile app, maybe, signing in to the server on a user's behalf, could use the client authentication module.

Mutual authentication means that your transmitting the authentication both ways. You're kind of asking the client about authentication information, like digital signature. But you're also presenting one to the client, exchanging the digital signatures between the server and the client in both directions. So these are kind of predefined login modules that come out of the box.

An interesting thing is you can actually create custom login modules as well, so if you're not satisfied with this list of options. And this is the key to how you approach custom login module creation. It's actually quite simple. All you need to do is use a pair of methods on a request object. So you can do it from any servlet you like. And the methods are login and logout. And there you go. So you can basically programmatically decide how you're going to log in a user and when you're going to log out the user.

You may use a combination of declarative and programmatic approach to the login module configuration. And actually, this is something you will be asked to do as part of your exercise. You will be using a form login module there-- which is declaratively defined; you don't need to call that-- to login your users. But then you will be told to use the logout method to explicitly log out users at some stage in that application. It's a good idea to provision an explicit logout mechanism for the user to use, because it makes the application more secure.

Now, let's take a look at the way of declaring application roles. So remember, application roles are basically invented by you, by developer, as part of your application configuration. First, you may use either annotation, like this declare roles annotation, or web.xml or ejb-jar.xml file, to describe the security roles.

Later, when you need to map these security roles to real world users and groups, you'll take one of the server-specific descriptors-- well, for the WebLogic server, it's going to be WebLogic XML or WebLogic ejb-jar.xml-- and map the logical role-- role name. Here it is-- employee, for example. That's just one of these roles. Map it to anything you like. These are your real-world users or real-world groups. Maybe there's a real-world group called clerks, or managers, or somebody called Joe, who's going to be a member of that security role.

Security roles are then used in security constraints. Here's some examples of security constraints. The example on the left shows a servlet. So you have the security constraint-- servlet security constraint. And it's basically saying, to access that servlet you have to be a member of an employee role-- roles allowed. Right.

Now, you could do the same thing by defining the authentication constraint in a web.xml file. So you can map it to a URL or a URL pattern. As you can see, there could be a number of different URLs there. And you've got to be a member of a certain role to access these URLs.

With Enterprise JavaBeans, similar thing-- declare roles, roles allowed. So you restrict access to the bean. And you can do it in an ejb-jar.xml file as well. So it's the same thing, really, whichever way you want to do it.

One more thing-- this PermitAll, DenyAll configuration, these annotations. What they do is that they allow you to say that certain method or methods in that bean-- because you can use it on a bean level or you can use it on a method level. So that PermitAll annotation means that although generally the bean says that you have to be a member of an employee role to access methods in that bean, but a particular method called find actually allows anybody to call it. So you kind of override it on a method level.

And you can do it the other way around. For example, you may prohibit access, DenyAll, on a use DenyAll annotation, let's say on a bean level. And then you drop to the level of a particular method. And then you say, well, in order to access that method, you can be a member of certain roles. So you can permit roles allowed on a certain method. And you can do it very selectively, a method-by-method level. Or you could do it for the whole bean. So these annotations could be applied on both a bean and a method level.

If you want to handle security programmatically, rather than declaratively, you may certainly do so. You try to make security configuration as declarative as possible. It's more convenient, through the annotations or through the XML configuration files. That's up to you. But the more declarative it is, the more convenient it is to handle.

However, there are certain cases where you may wish to dynamically, programmatically process security. And here are some examples of why would you want to do it, and then how you're going to do it. Let's say-- imagine you want to know who your actual user is, as in user name-- I don't know, for audit trail reasons. Imagine you need to record into the table who has created or updated the record-- which user has done the last update, for example. So you need that audit trail.

You see, the database user is kind of useless for you, because the database user is a generic account configured for the data source. What do you need? You need Java authentication and authorization API user, a Java user definition, to track and to record into that table. Well, there you go. You may have to check who that user is.

And there's a very, very simple method you could use in an Enterprise JavaBean. It's called getCallerPrincipal, getName. Yep. And then in a server API, that's getUserPrincipal, getName. So you can find out who that user is. Also, there's a method called isUserInRole or isCallerInRole, will check in programmatically if the invoker is a member of a certain role.

Why would you want to do that? What's wrong with roles allowed, because you can just declaratively done it. Well, here is a thought. What if you are accessing a web page? You allow that user to access the page. That's fine. The page contains a link towards another page. And the user is not allowed to see that other page. So if a user will try to click on the link and follow it down, obviously the user will get an error, because the security constraint prevents the user from seeing that other page.

But what about seeing the link? The first page that the user accesses is perfectly fine. User is allowed to see it. So user can see an element in a page-- let's say that link, for example-- which really, the user is not supposed to see, because the user won't be able to use it in any way. It could be part of a page that requires to be hidden from a user, or maybe gray out some fields, depending on who the user is. And obviously, declarative security constraint doesn't cut it, because declarative security constraint operates on the level of a URL. And that's not enough to constrain access to a fragment within a page.

So there you go. Maybe that fragment within a page has to be constrained with programmatic bit of code. It's checking if the user is a member of a certain role. And based on that, allow the user to see the item or gray it out or hide it.

And a similar thing can be done in the Enterprise JavaBeans world, where you have isCallerInRole method, which allows you to restrict access to part of the algorithm. Which is slightly odd, because really, in the Enterprise JavaBean, you can just split the method in two, quite easily, and have a declarative security annotations control and access to either one of the methods. But say, for sake of argument, if you need to find out, inside EJB method, who is that user from a perspective of which roles he's a member of-- well, isCallerInRole, simple Boolean check, will do the trick.

Now, we're going to talk about a slightly different topic. We're going to talk about web services security. The web services security is a different topic, because it transcends Java EE environment. Web services might be written in other languages, not necessarily in Java.

Now, with regards to the web services, there are two types-- remember, REST and SOAP. If it's a REST service, it's essentially just a handle around an HTTP protocol. So any security that you defined for your servlets as an HTTP-handling component is still applicable to the REST service. In other words, there's no need to invent any extra features or APIs for sake of REST services. They could perfectly work with Java EE, Java security constraints, restricting access to URLs to which these REST services are mapped.

With SOAP services it's going to be more difficult, because unfortunately, SOAP services are not necessarily Java-based, and therefore cannot be standardized just through the Java EE means. So there's a set of standards that is related to SOAP services that transcends Java world. And it's very important, because SOAP services are not necessarily using HTTP transport protocol. They may use other transports. And it may not necessarily be implemented in Java. And therefore, their security properties have to be of their own, of their own standardization.

There is a group, a consortium of companies called OASIS group, which is a standard keeper for everything SOAP services related. And part of their standards is a set of standards related to services security, namely WS-Policy, SecurityPolicy, WS-Security, et cetera. There's quite a few different standards that OASIS group defines. So security standard is part of that bigger picture.

Let's take a look at what exactly web services security standard allows us to do. OK, so imagine a message-- SOAP message. That SOAP message, I'm sure, is transmitted on top of some transport protocol. And yes, we could have protected the message on the level of a transport. Let's say that sits inside an HTTP packet, right? HTTP-- and I'm sure we could have encrypted that HTTP packet.

But if you receive that HTTP packet on a server, what you going to do first thing? Your server will decrypt it, right? It's passing a boundary of HTTPS Listener. The packet is going to be decrypted. So you're getting into your application that SOAP packet in unencrypted form.

And if you need to then handle it and maybe pass it on further, to another service, well, it's not encrypted anymore. And you're completely at the mercy of another server's capability to encrypt the transport. And do you control another external service? Not really. If it's an external service, you don't really know how secure is their transport connection.

So what you can do is ignore the transport protocol and embed security tokens directly into the SOAP packets, and also encrypt SOAP pockets entirely or partially. So you can sign them. And you can encrypt them. And unlike transport pocket, that it's getting automatically decrypted, SOAP packets are not automatically decrypted. You consciously need to say you want to decrypt that packet.

So how about-- imagine your user is calling a web service-- some application, calling a web service. And it's passing on information about-- well, a credit card. So there's this order and it contains credit card info. What you can do with SOAP is that you can take that part of a SOAP message body that contains the credit card and scramble just that part. And you don't have to unscramble it. So that means that a message can be decrypted overall but keep encrypted parts in it, then pass through your application safely without application ever even knowing what's inside. So that is really kind of properly protecting that information.

Which exact mechanism would you use to implement security tokens or encryptions is up to you. There's a number of different mechanisms you can use-- X.509 certificates, SAML tokens, Kerberos, et cetera. There's quite a few different mechanisms. And again, that's down to the point of web services being designed as portable, universal type of components that are not dependent on any particular programming language or environment. So they have to support a variety of possible security tokens.

In Java, if you want to encrypt or digitally sign or decrypt SOAP messages, because SOAP messages are XML, you could use XML encryption and XML signature APIs. They're kind of low level APIs that are handling the embedment of security tokens, validation of security tokens, encryption and decryption of any XML data-- including, obviously, SOAP packets.

Now, there is no Java EE standard how that is done. Java EE gives you the APIs. There is a SOAP standard, how that is done, related to the SOAP protocol. But Java EE is not providing us with out-of-the-box support for automatically encrypting or digitally signing or decrypting or validating SOAP packets. You have to code it.

There are, however, third-party tools that can do this job-- among them, let's say, for example, an Oracle product called OWSM, Oracle Web Services Manager. But that's a proprietary product. That isn't part of Java EE 7 specification. It's something that you have to install and plug into your server additionally. And that might help you greatly in automation or the process of securing of web services. Otherwise, with XML encryption and XML signature APIs, you will have to write that code that encrypts or validates or decrypts your SOAP packets yourself.

So at the end of the session, we've looked at a couple of important parts of the security in our application. One was general Java EE security. And the other was web services security. In general, Java is security world, where we're talking about authentication, authorization, protection of communications, and the fact that you can do it both declaratively and programmatically.

Well, in terms of your practices, you will be asked to configure your application server-- real-world users, groups. Define login module, define some application security roles, map them to the real-world groups and users. And then also add some programmatic bits security within your web application part-- so restrict access to certain bits within pages as well. Oh, and use an extraction of currently logged-in user name. Actually, it could be quite fun when you consider the chat application. So you'd now see who the users are who are entering the chat. Right, there you go.

## 2. Practice 12-1: Adding Authentication and Authorization Logic - 17m

Let's take a look at practices for Lesson 12. In this set of practices, we need to enforce security in JAVA EE application. We defined form-based authentication, declaratively add security constraints, define application roles, and map these application roles to security groups, which, we obviously still need to define a WebLogic server configured within the JAAS provider together with the users. We also do some steps in these exercises to handle programmatically some security aspects within the application.

So we'll have to do several configurations, and we'll start by defining authentication and authorization code within our product web project. During this first part of the exercise, we'll create a Login and LoginError HTML pages to handle the user's authentication. They need to be registered with web.xml file, but we'll do the registration in a later practice.

Then we also need to modify a welcome page to make it security aware, provide a link to login page and also handle the logout, so what users would be able to do both, dynamically login and logout an application. Depending on whatever users are permitted to observe certain parts of the application or not, we may dynamically change and alter the page appearance based on what users are supposed to see in their authentication process.

Let's start by creating the Login HTML page. So in the ProductWeb, we need to create an new HTML file. And we'll call this one Login. OK, go to ProductWeb. You can close current files if you like. So again, to the ProductWeb project, and we create a new HTML file called Login, just simple Login HTML. Make sure you put it in a web folder, so let's put it in a web folder. There you go, Finish.

Now, what's going to be inside that login page? Well, as usual, you can copy the code from the template HTML and then replace values. Title should be Login. Header should be Login. And Footer should be Login with your username and password, but let's just replace the code from the template first.

Open File, Template, copy that and replace the contents, so title, Login, header, Login, and then footer Login with your username and password. Yeah, that's the footer contents. Now, what about the main content of the page?

Well-- oh, for navigation first, I'll navigate back to the index.html, which is our home URL. That goes into page navigation, lovely. Now, the main contents, let's organize that. There, we should have a form that submits itself to j_security_check servlet with method POST, so add in that form now to the page content.

And a form should have a couple fields, one for username, j_username, and another is password, so we need to add these together with prompts, so organizing the display, adding the inside of form, adding four fields, so that's username, and then let's-- required field, obviously. And then let's add another one, just password. In this case, it's input type, password Did you notice that? Format-- so j_username j_password field submitting to j_security_check servlet.

And finally, a button, we could click on a button and perform the login. That's it, I guess. So the login page is pretty much sorted. We don't really need to put anything else in here. So it's just a static HTML document, really, submit in a form.

Now, let's create another page which will represent login error. OK, so ProductWeb project. And LoginError would be the page name. And it should be in the web folder-- New File, HTML File. LoginError, in a web folder, nice. Again, replace the code with the code from the template.

And let's sort out the template properties, so that should be Login Error in all of the header, footer, title, so repeat that. Put that text in the header, and footer, everywhere. What about the Page Navigation? I suppose a couple of links, one to its home page and the other towards the login page, so you can try again, I suppose. So link to the home page and link to the login page to try to login again.

Lastly, in the contents, just say that the attempt to login failed. That's it. There's nothing else, really. I mean, you can make it more sophisticated, really, but it's a very simple page. Just tell the user, sorry, you know, you didn't manage to login. Do you want to try again? That's it.

OK, now we need to modify the index page so it can dynamically handle authenticated and non-authenticated requests. At the moment, it's just a simple, static page, the index HTML, but what we'll do is, we'll make it into a Java server page so we can add dynamicy to it. We need to rename the file. OK, we can do it by going to NetBeans, open a terminal window in the current project, and moving the file index.html to index.jsp-- NetBeans, Tools, and then terminal window, mv, move, index.html in-- just a second, yeah, lowercase index.jsp. That's it. So you see the file has changed.

Well, there's a little bit more to it, so not just moving the file. What else do we need to do? Yeah, oh, you can close the terminal, of course, yeah, exit from the terminal. Let's do that very quickly, yeah, of course. We don't need that terminal anymore. Let's close that.

So once we've changed that page to become a Java server page, we just add the declaration of a JSTL core library and the output of a contents type, text/html, so add these two elements to the top of that login-- sorry, of that index page, just before we start the rest of the content. So we declare that that's the Java server page, and then prepare ourselves to use a standard JSTL library and also inform the client about the contents type that this page produces. The rest of the content, as you can see, is still just plain HTML. We haven't added dynamic bits to it yet, but we will, so that would be our next job.

Specifically, what we want to do is, we want to add an if condition. And this if condition, we would like to test what's going on with the current user. Is this user logged in? Or are we logging out?

So if the user requests a log out, if parameter that we're submitting, there is a parameter called logout. In this case, we will take the request object and call log out method upon it. We can get it from pageContext. And we can get sessionContext from pageContext and invalidate it as well, so we are simultaneously shutting down the user session and logging the user out. You see, SessionScope is not automatically destroyed when you logout the user, and maybe should be in this circumstance, because I guess we would not want users who didn't logout to use our session-- who are logged out, but are not logged in, to use our sessions.

So this is the bit of code that we add just before the !DOCTYPE html, but after the JSTL declaration. OK, so we will introduce a parameter into the page called logout. And with simple expressions, we're going to execute the logout session invalidate operations. Nice, so it's not really part of the content, but it's just a bit of logic which we want to execute when users access the index page, capability to logout if necessary.

Right, now, enable the display of a link that a user can click on to log in or log out. To achieve that, we'll add to this nav component that we have in the page a conditional navigation towards the login page. The idea is this. We need to test if user has already logged in, if the request to get principal, userPrincipal is not null, it means that user is a logged-in user, in which case we could, for example, get the username, or just set a variable. Maybe you would like to use that request.userPrincipal name somewhere in the page.

And if the user is already logged in, inside that when condition, you create here a logout capability. Display a link that submits the parameter logout. That's the parameter you are looking at here, param.logout. So the user would be able to click on that link and log out.

In the otherwise condition where the user is not logged in, we will display the link to the login page, so this goes inside the existing nav element, into the page where is the nav element. And then that other bit goes right after all existing content, so before and after existing content in the nav element. And reformat that so it will look nicer.

Oh, I accidentally double pasted-- nav element. That's much better. So we have the ability to find out if the user is currently logged in or not, and then display the logout and login links depending on the status of that user.

Next, the existing content appears inside a when clause, so that means that, unless the user logs in, the user cannot proceed to search, product search, or open chat. These are all the bits that are now appearing inside that when condition.

Now we'll make a use of that variable, which is-- we extracted, the user variable, current username. And we'll make use of this. You see we have this section which says welcome. Well, actually we can welcome that user now. And that's precisely what we're going to do, just append the user name after the word Welcome, like so.

If there is a user, it will be set by this set instruction. The variable user will be set by the set instruction. We'll get that user principle. And we will say welcome to that user. If the user doesn't exist, oh well, we'll just say welcome and display the login link on the page. And that's it. That's the logic of an index page now.

OK, so search and product search are now all available for authenticated users. I suppose that's the end of the first section of this exercise where we have prepared our login page and logout capabilities and altered the appearance of the index file, so it's not HTML, it's just SPI now, to add dynamic handling of login and logout capabilities. But that's not the end of Lesson 12 Lab. We have more parts to it, so that's just the end of Part 1.

## 3. Practice 12-2: Configuring Java EE Web Module Security - 9m

Let's take a look at Part 2 of Practice 12. In this part of the exercise, we need to configure the ProductWeb module to define the login module configuration, to define application security roles, and create security constraints to protect application resources.

We'll start by registering in the login page that we've created in a previous exercise with the web.xml X-amount file. So we need to open the web.xml file first, then click on the security button here and expand the Login Configuration section. Choose Form-Based Authentication, and select logging and error pages that we have created.

Let's do that bit. In the ProductWeb project, find the web.xml file. Go to the Security section, expand Login Configuration, choose Form, Browse and select the Login.html and the LoginError.html pages. So first part is done.

Next, create some application roles. We could create application roles by using annotations in our code, or we could do it in a web.xml file, whichever way you like. So if we already own the web.xml file, we might as well continue. So using the Security screen on web.xml, click on Add button to add security roles.

We need to create two roles. One will be called Employee, and the other role will be called Customer. And that's the result. That's what you need to create Employee and Customer roles. So same page, Security Roles, Add Role, Employee add another role, Customer. Good. So security roles are in place.

Now, continuing with the rest of this transcript, we need to create security constraints. First security constraint you also create-- it's called CommonAccess. It's bits of the application that can be accessed by anybody, employee or customer. But these bits require people to authenticate first. So you have to log in, then you could be an employee or you could be a customer. Whichever way, you can still see these pages. So that's common access constraint. Describe that. Security constraint, and name, CommonAccess.

We haven't finished with the app, yet. No, no, no. It's just a start. So what do we do with that constraint next? We need to add Web Resource Collection to that constraint to see, what are we protecting? Let's call this web resource collection CommonResources, and then we'll add resources to it. So this is a list of pages URL Patterns will add to. So Resource Collection, Add, CommonResources.

And then we need to add HTTP URLs that we would like to protect. So this would be a comma-separated list of the following items. And make sure you protect all HTTP methods. So suppose I need to put commas around that collection of chat. At least that's our servlet. Product search. And product list. Search.xhtml. List.xhtml. Oh, no. That's it. That's the end of the list.

So these are the resources that we think both roles that we define should be able to access. So collection of resources and URL Patterns for it. Next, we need to create another important authentication configuration, and we need to include roles that are allowed to access that collection of resources.

So for that, we need to enable the authentication constraint and select our roles. Enable Authentication Constraint. That's the checkbox. And then click on the Edit button against role things. And just select and add all the roles. So the resources we've defined so far are accessible to both employees and customers. So we're protecting chat pages well, among others. And pages that are related to product search and product list, but not product edit. That's separate.

So that's our next task. We'll create another security constraint, which we'll call EmployeeOnly. So assumption is that only members of Employee role will be allowed to do the editing or discount functionalities. So we need another security constraint. Add another security constraint. Employee only.

Now to find a web resource collection for it. And that should be EmployeeResources. So previously it was CommonResources. Now it's EmployeeResources. And then we should define the list of URL Patterns. What are these that we're protecting? We're protecting the following URLs. So discount, REST service, Edit page, and ProductEdit.jsp. Comma-separated list. Protect all HTTP methods.

And who should be allowed to access that list of resources? Click on Enable Authentication Constraint, and create a permission for employees only to access that list of resources. Enable Constraint Role Name, EmployeeOnly. There you go. Lovely. So we created two security constraints, one limiting access to certain pages to both employees and customers, and the other just to employees.

Good. That's the end of this configuration. We created a config within our application. In the next exercise, we'll be configuring our WebLogic server and Java Authentication Authorization Services API, security provider configuration, and mapping these logical roles that we're using within our application to real-world for our users and groups that we'll create behind the JASP provider and the WebLogic server environment.

## 4. Practice 12-3: Configuring WebLogic Security and Mapping Security Roles - 7m

Let's take a look at Practice 12 Part 3. In this practice, we configure users and groups that are real users and groups within a WebLogic server and building security provider. Then we map these groups to the application roles that we've described in a previous exercise for our product web application.

First, let's create a couple of users called jbloggs and jdoe. And we-- well, password welcome1 for both. And we do it through the WebLogic server console. Go to WebLogic server console. If you haven't logged in or your session expired, log-in again as user weblogic, password, welcome1.

Now go to Security Realms. Go to myrealm configuration. Go to Users and Groups. And that's where you can create your users, so click on the New button. Create a user-- what was it? The users we're supposed to create, jbloggs and jdoe, yeah.

Open up the browser-- jbloggs, and your password, welcome1, and confirm password, welcome1. Let's do another one. OK, password is welcome1 as well. Good, so we've got a couple of users we've just configured.

Now the walk through with screen screenshots is obviously available in manual, so you can see how to create it and repeat that process for jdoe as well. Once the users are created, then we create two groups called client and clerk. So it's a similar place, but this time, we go to the Groups subtab.

Let's go to Groups subtab. And we create a new group, client. Let me double check, is it-- yeah, client and clerk, so, just making sure you put in the names right-- client and clerk.

So we've got our client and clerk groups in place. Now what do we do with these groups? Well, now, once we've created them, we need to assign users to these groups.

Back to the user subtab, click on each user. So start with jbloggs, and then make jbloggs be a member of client group. So back to Users, select jbloggs. Click on Groups tab. Select client group. Make this bloggs user be a client.

Then go back to the list of Users and Groups. Select jdoe. Go to Groups. And make jdoe user to be a clerk. So there you go, client and clerk. And save both of them.

So that concludes the configuration of your users and groups. OK, now, we need to create mappings between the employee and customer roles, and respectively, client and clerk groups. These mappings can be placed in a weblogc-web-app element in a weblogic.xml file. You'll find it in the WEB-INF folder. So security-role-assignment elements, these are the mappings.

In NetBeans, go to ProductWeb, under WEB-INF, weblogic.xml. Open that. And into this file-- well, the instructions say where should you put it inside of weblogc-web-app element, so that's where you put it. And security-role-mappings, just align like that. So we have customer mapped to client an employee mapped to clerk.

Well, I guess that's it, really, because we created thr necessary mappings. Now we have an actual security provider on the WebLogic server giving us some users and some groups. And they're mapped to the application roles within our web application. That concludes the Part 3 of the Chapter 12 Exercise. Next, we'll proceed to Part 4, where we will actually do some programmatic handling of security roles, and also will test this application.

## 5. Practice 12-4: Adding Programmatic Security and Testing the Application - 16m

Now, let's take a look at part 4 of practice 12. In this part, we are modifying ProductList and list pages to add programmatic handling of security in order to disable their ability to navigate towards the edit page if the user is not a member of employee role, because that's when they're not supposed to be able to edit pages.

Of course, the edit pages are already constrained with the relevant constraint. So that's fine. The use won't be able to use the edit page, but product list and lists still display links towards them. So we need to conditionally display these links.

Also, we modify the ChatServer to ensure that it uses usernames in the chat. That's just-- you know, once the user logs in, we know who they are, we could use the username in a chat.

And we test the application. We start by modifying the ProductList Java Server page to disable its navigation to the ProductEdit. So we need to open ProductList. Inside, find a forEach iterator, which contains this navigation link. It will be the iterator already.

What we need to do is put this navigation link inside a choose when otherwise clause, where we test if the user is indeed a member of an employee role. Get the page context, get request object, check if the user is a member of employee role.

If that's the case, yes, display that link. Otherwise, display the ID. But don't display the link, just ID that user can't click on. So we take that piece of code, and we go to NetBeans, and we find product list page, and this is our forEach iterator, and this is that link towards product page. So we basically replace it with this format. Choose when and otherwise branches. So we conditionally control the display of that link.

A similar thing needs to be done with the list and edit pages. There we have a data table with command link that allows us to navigate from list to the edit page. It's a Java Server Face as part of the application. That's actually quite more straightforward, I guess. In Java Server Face, it's easier to do, because the command link has a simple property, enabled/disabled, and all you need to do is just to say it is disabled if the user is not a member of an employee role. That's it.

So find the list page, find that command link, and then add this additional disabled attribute. Let's just display it so you'll see it better. So this is that disabled attribute. OK the link will not show itself as a link. It will simply be a read-only value of ID. So there's no need to build choose when otherwise, JSFs are handling that logic already on the UI element level.

OK. Now it's a turn of a chat server, where we'll use authenticated user names in a chat. So locate the ChatServer class. That's our WebSocket server handler. It's in the demos.web.socket package. Let's just open that first. So where is it, here. ChatServer, open that.

And what we're going to do is we're going to change code inside open, close, et cetera, on the inside of these methods to actually start to using the logged in username. And the way it works is pretty straightforward. The session object-- which we obviously get its parameters here --contains the user principal information. So we know who that user is. It's automatically populated in socket session once the user logs in.

So all we need to do is grab that username, well that's on open method. We have the session. Out of the session, we get who the user is. And then we could use that username in welcome and in broadcast messages. So welcome should be just that +user+, so there you go. Replace that. Oh, sorry, it's just together with quotes, isn't it. Yeah. OK, better.

And then here, instead of new user, we could actually point the username so say which user has joined the session. So it will be user has joined the chat. There you go.

OK. Now, OnClose method, similar piece of code, but user has left the chat. So that's getting the username and broadcasting that user has left the chat in the OnClose. Instead of just broadcasting user left the chat, we can use the real username that we get from the session.

OK, what else we can do. Well, next is the turn of the OnMessage method we add a session parameter to our message method, assure we can, and then we broadcast the message that contains the username in front of the message. So we know which user has sent which message. But first, of course, add a session parameter. So OnMessage method, add session parameter. Because we want to use that current session to extract the username, and then broadcast the message with that username. There you go. Nothing else needs to be changed here. The rest of the code remains the same. And the username is automatically appearing inside the WebSocket session once the user actually logs in.

So let's clean and build. We're proceeding to the next phase, as you can see, deploying the application, and then running some tests. Let's first try unauthorized access. So deploy that application. Go to ProductWeb, deploy it. When the deployment will finish, what we need to do is go to the browser and try unauthorized access to the session. So that would mean we're going to pm URL first, but we're not logging in. There will be a login link, which we will not use. And we'll then just try to go to ProductList instead, avoiding a proper login.

So we'll just go, first, to the PM URL. We will see that we have the login link appearing in the screen. We'll not log in. And just try our luck by going to the URL which we're not supposed to go to, which is ProductList. And, as you can see, we're getting the login page. You're not supposed to see the protected URL. It's protected by security resource, so we're kicked off to the login page anyway.

OK. That's fine. So we understand how that would function, right.

Of course, at this stage, you can now start into login. That would be our next task. We need to log in as user jbloggs, who's the member of a customer role, remember. So let's give it a try. At the moment, we cannot access ProductList, but if we log in as jbloggs, password welcome1, log in, we can.

Yeah, the ProductList doesn't show us anything until we actually run a proper search criteria. But we are authenticated, and we can see the list. Note the IDs are not clickable because we're logged in as a user who is not supposed to get to that page-- is not the member of the employee's role. You could test that functionality with ProductSearch or the ProductList pages.

Now, shall we try to break through and invoke ProductEdit page directl, try authorize access to it. So just put the URL as if we're going to that page with a proper product ID, as if everything is fine. But we're not authorized to see that, so when you attempt to get to that page, you will get a forbidden error.

Notice this is not a custom server that I would build before to display our error messages. This is a standard browser error page, because we did not configure a custom error handler servlet to intercept 403 error. We configure it for 500 error, we configured it for 404 error. But we didn't intercept 403, hence the forbidden error is not intercepted.

OK, well, just, we could have, I suppose, had a custom page at that stage. But we didn't. Yeah OK, now let's try to log in as somebody who is the member of an employee role. Yes, so we understand that we are not able, otherwise, to get to that page.

OK. Navigate back to the index page. And this time, log in as the other user who can see the relevant pages. So go back to Product Search, go back to Home, log out-- we can use the log out link --log in again. User jdoe, welcome1, and log in. And go to JSF Product Search or Product Search, whatever you like. And you can now see the link towards the edit page and, obviously, navigate to it.

OK. Let's go to the JSF Product Search. Likewise, we can see the link here. Yeah, so in Java Server Faces, the coding was a bit more simple, but really the effect on us is pretty much the same.

OK, so we tested that we have properly blocked access to pages where the user is not supposed to see. We can test the employee role, we can test the customer role, fully access both of these paths.

Now, once you finish playing around with these employee and customer roles, you can try ChatServer tests. We need to simulate a couple of different users. The other test, sorry, I just forgot to notice-- the other test was on Check Discount button. You're not supposed to get to that URL either if you're not a member of employee role. So, obviously, if you want if you want to check that, you can.

OK, that's part of your Product Edit. So we could go to whatever product, and Check Discount. If you're not a member of employee, and attempt to get to that REST service URL will yield you an error anyway. So there you go.

You can actually test it directly in another browser window just by entering that URL. And if you're not logged in as an appropriate user, you will not be allowed to proceed to that URL. So there you go, but just for you to know.

And now what else we can do. Yes, chat. Let's go to the Home page, and log in as, let's say, user jdoe in one of the pages. Right, so going back to Home. We are logged in as jdoe. Good. That's fine. So we can open the chat window from here.

Open the chat window. So this is the user jdoe. Now what we're going to do next is we're going to open an Opera browser, and navigate there to the same URL, but this time logged in as a different user. The reason why we're using a different browser is because we want to simulate an independent login. So there you go. We'll log in as jbloggs, password welcome1, log in.

And open and other chat window. So we've got to chat windows, side by side, here, with two different users. So this user joins the chat. This user joins the chat. This user sends the message, hi. And there you go. Hello. So each message, you could see where it came from, because we are basically using the username in a chat now.

OK, there you go. That's pretty straightforward. And if you leave the chat, you know who has left the chat. Fantastic. That's pretty straightforward.

I guess that's it for this exercise. That was the last test, just to play around with the chat a bit, and see that you programmatically can handle the user principals, find out if they are members of certain groups, or figure out their usernames, and just use it as part of your application code.

And that concludes the exercise.

## 6. Skill Check: Securing Java EE Applications - Score 80% or higher to pass

Skill Check: Securing Java EE Applications

View Skill Check
