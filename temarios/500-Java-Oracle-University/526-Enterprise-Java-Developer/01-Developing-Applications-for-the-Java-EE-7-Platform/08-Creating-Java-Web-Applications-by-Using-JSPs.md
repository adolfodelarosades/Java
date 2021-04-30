# 8: Creating Java Web Applications by Using JSPs

1. Creating Java Web Applications by Using JSPs - 24m
2. Practice 8-1: Creating a JSP to Display the Product List - 23m
3. Practice 8-2: Creating a JSP for Editing a Product - 33m
4. Skill Check: Creating Java Web Applications by using JSPs - Score 80% or higher to pass

## 1. Creating Java Web Applications by Using JSPs - 24m

Now let's take a look at the ways of producing Java server pages based applications. Well, we need to understand how Java server pages work. What's the syntax. And actually, some options there. The use of expression language, the use of CDI beans, tag libraries, and ways of handling errors with JSPs.

First of all, I need to tell you that really a Java server page is actually a servlet. When you deploy the JSP application, each page is actually turned into a servlet first. So in terms of capabilities of Java server pages and what they can do, how they run, they're absolutely identical to servlets. So in terms of the runtime options, it's the same. Got same life cycle, same events. It's exactly the same behaviors.

However, it's obviously a different style of writing the page. A servlet is just a Java class. You code Java. A page is a page. So you visually could edit that. You're working with HTML mark-ups rather than just typing Java code. Of course, the page can contain bits of Java code-- such as this one for example. That is clearly a chunk of Java code. It's sort of cropped into the page structure, and overall it is looking much more friendly to the web designer than the servlet.

So I guess it's an attempt to make the process of designing a page geared more to the tastes of the UI developer rather than just a coder. Now, all the servlet code and techniques are still applicable. So CDI beans and web filters and container lifecycle operations, that's all the same. It's just really all about a different style of coding.

This is the Java server page syntax. So what you can put in a page. You can put in comments. There you go. You can put bits of code that we call directives. Now, there are several types of directives there, page, include, and taglib. We're actually going to take a look at other directives a little later.

But page, for example, that describes global things about the page. So it's, for example, content type, encoding. Well, guess what. That instruction-- page, content type, and coding-- it will translate to a future code of a servlet that will be based on that page, will be created from that page, and that servlet will send the relevant HTTP headers to the client. So setting the content type.

Or, for example, that bit where you would put an import. We're just importing another Java class here. And again, that translates to the code of a servlet. That will just have that piece of Java logic in there.

The overall page could contain just any HTML, really. As you see, it's an HTML document. But apart from containing just plain text HTML things, it can also contain declaration, scriptlets, and expressions. A declaration-- the one with this exclamation mark-- if you put the declaration into the page, that will create a piece of code that goes into the future servlet outside of a method service. So if you want to add an instance variable or create another method, you put an exclamation mark. That code will go outside of the future servlet method service.

If you put a scriptlet-- that's the one with the just percent signs. These are the scriptlets. This is just a bit of any Java code that goes inside the method service. So whatever you want to code, like handling request parameters and any logic.

An expression is basically exactly the same as if you do out print LAN. It's exactly the same idea. So you're printing something back to the client. You could have written a scriptlet, I suppose, which outputs that value. But it could be just an expression. So it's exactly the same as a print.

Also notice if you're writing a servlet and you're writing your service method, you are in full control over what would you like your parameters to be called. HTTP servlet request and HTTP servlet response objects. You can, when you code a servlet, call it whatever you like. You don't have to call parameters request and response.

But in a Java server page, a servlet is formed for you. So the names of the standard servlet objects are pre-coded. And it says here "request." This will be the name of an HTTP servlet request in a future generated servlet. That's what it will be called. So you cannot really change that, because it will be auto-generated for you.

So the standard objects, see here. It's a list of these objects. Request, response, the print writer is called out. Session. The HTTP session is called session. Servlet. Context object is called a page context.

For example, the keyword page is a synonym to the Java keyword this. You could have just typed "this" dot something, I suppose. But then whoever designed Java server pages thought that page will be more intuitive to a web designer who might wish to write some scriptlet code and refer to the current page. So it's basically a synonym page and this. So these are aliases for standard servlet objects.

Now, here's an interesting one. It's an alternative Java server pages syntax, XML syntax. This example is doing exactly same stuff as example on a previous page. There's no difference at all. That's a complete repetition.

But instead of writing directives and declarations and scriptlets with these exclamation marks or equal sign or percent signs, you are using XML mark-ups. They surround the entire document with an element called JSP:root. So that encloses the whole document. And then you put all of the other components like directives.

So remember on the previous page, directive had-- what was it-- it was with an at sign. And then we had the declaration, and that was with exclamation mark. And then we had an expression, for example, and that was with an equal sign. Well, there you go.

So instead of all these signs and exclamation marks and equal signs, you're just spelling it out as an actual XML mark-up. And then in a scriptlet, for example, or in a declaration or inside a particular element, you just put your Java code as usual.

There you go. So you can construct the page as an XML document. That would be a little tricky when it comes to some HTML content in a page because in HTML content, that bit which produces HTML will also have to conform to the XML standard. So you might wish not to create an HTML element, but to create an XML element that describes an HTML element. Might be a bit long-winded, so there you go. But functionality-wise, both syntaxes are achieving the same thing. It's just a different style of writing the page, whichever style you prefer.

Within a page, you can write expressions to access Java code, which could be accessing CDI beans, objects outside of the page. There are two styles of expressions that you could use with a dollar sign, which is known as immediate, and with the hash symbol, pound, whatever you call it, which is the deferred. The deferred expressions are mostly used by Java server faces, and they are covered later. It's down to the way in which the JSF lifecycle works.

Java server faces have their own lifecycle considerations, so they use slightly different expression notation. And immediate expressions are used by Java server pages, which is what we're doing in this chapter. So with a dollar sign for this chapter.

The expressions allow you to access CDI beans, their properties. There are slightly different styles. You can use the dot notation to access a property, or you can use a square brackets and name of the property notation. Well, works whichever way. It's not really different.

You could pass parameters and invoke operations. You could handle arrays, using array indexes. Or even you can write lambda expressions directly into your page with expression language. So there you go. There's more to the expression language. It's this page that shows us what are the main expression language operators.

So for example, dot to access a property, comma as a statement separator, square brackets to access, let's say, array element. Method parameters with round brackets, arithmetic operators, assignment, relational operators, logical operators, and lambda token. So quite a few different operators. So that means that you can put these expressions into your page, and through them access logic in your CDI beans and your objects outside of that page.

Well, what are these objects? You can access things that are in different memory scopes. So that's request, page, session, and application scopes. Access that from your page. You can obviously access all these implicit JSP objects. Remember, we've mentioned them before.

We're saying you don't give a name to your request object. It's given for you. And it is request. So there you go. That's out as JSPWriter, request is HTTPServletRequest, response is HTTPServerResponse, et cetera. So these are the standard servlet runtime objects.

You also have implicit interesting set of objects here that deal with the handling of HTTP content. So parameters, parameter values, header, header values, cookies. So probably one object that I'd like to quickly comment on, and that's initParam. You can put initialization parameters to servlets in a web XML file. So it's not a parameter user that's passing in a URL. That's param. initParam is the bit that you put in a web XML file to pass initialization parameters to a servlet.

And then finally in this corner right to the bottom, we can see the examples of expressions, accessing parameters, accessing CDI beans, accessing some exception messages. So you could put that code directly in the JSP page to manipulate with these memory objects.

Talking of CDI beans. Here's an example. You created a bean. Well, it's request scoped in this particular case. Just for your own convenience, you can use a named annotation. If you don't put the named annotation, you can still access the bean, but you have to use a class name, which might not be that convenient. So the named alias might be more convenient way of accessing the bean. And there you go.

You just can access the bean properties or call bean methods directly from the page. Very convenient. And I suppose, again, this is the way of approaching the proper segregation of model view controller, because then you have your page that focuses on the production of the UI or the layout, and then your beans that are carrying out the logic. And this quite straightforward way of tying up together a page and beans through expressions.

Now, the Java server pages come with a set of standard libraries. They're known as JSTL. And that's Java Server Pages Standard Tag Library. The libraries that come with the Java server pages runtime provide us with elements that allow us to control the logic of the page. Each tag library needs to be declared in a page as a taglib reference. The tag library will be associated with a prefix. So whichever is the prefix, it's up to you. And then you are accessing elements within a library.

Quite a few different libraries, and a lot of elements in them. So I'll just try to give you some kind of example of what you expect libraries to do. And in this particular example, we have a for each element which allows us to create an iterator and step through a collection of products.

Suppose you've got CDI bean called order. Suppose that CDI bean order has a collection of products, some kind of product list. You want to step through that product list, and then you want to get each product out of that list, assign it to the variable called product, var product. After that, you want to get the product's name and product discount.

But you see, the interesting thing is that with discount you want to do some test first. So there's this if condition. You test any discount is greater than zero, and then you display the word sale if that's the case. And as for the product name and price, well, you just output them as is. So c out allows you to just output the value.

This is just an example. Quite a few other elements in these libraries. Quite a few other libraries. They deal with formatting of objects. They deal with logic of the page handling of these objects. So it allows us to code in a Java server page, but without really writing direct scriptlet code. So you're expressing the logic of what the page is supposed to be doing, and yet you're not directly coding in Java.

The more you put scriptlet stuff, scriptlet code, into the JSP page, the more you make it look like a servlet, which will eventually defeat the point of actually creating JSP page in the first place. Why you're not writing a servlet, then? So you're trying to keep the page as declarative as possible where it's more suitable, it's more geared to the visual way of editing that.

Hence you're trying to tuck away all the code, all the complex business logic handling, into the CDI beans and access them via these elements from tag libraries and via expressions that help you to construct that logic in a much more declarative fashion.

Well, we also need to mention that we need to be able to handle errors for Java server pages. Now, this bit at the bottom of the page, do you recognize these lines? Request URI of an error. What is an exception? What is its type?

These are attributes of the request object. Exactly same as we've seen in earlier chapter about servlets, when we're creating a servlet error handler. Well, you see, the Java server page has access to exactly same requestScope attributes, just as the servlet did. So it means that you can create an error page and access all of that information.

The difference, I suppose, is this. In addition to the capability of the server to register error pages in a WebXML deployment descriptor, the Java server pages can also designate a specific error page for a given page. So you're saying there is this page called Some. If something goes wrong in a page Some, you want to call Some error handler JSP. So that's that other page.

And the other page, please note, is marked here with "is error handler true." Ooh, it is. So one page says that the other is an error handler for it, and the other page says, yes, I am the error handler. And I suppose that's when you start accessing the information about the error, and presenting it to your user in whichever nice way you want to do it.

Well, I guess that's it. You see, the rest of the things about Java server pages are exactly same as about servlets. So for example, lifecycle events and filters, web filters, it's all the same. Request dispatchers, it's all the same. So it's just a really different style of creating that layout which we're trying to make as declarative as possible without actually having to directly code within a page in Java as such.

In terms of the exercise, what are you going to do is you're going to change your current web servlet application which shows you the list of products. And you're going to display the list of products in a Java server page, not in a servlet. However, you will still use the servlet for controller reasons.

So the idea is that a search, which products you're searching for, that search will still be executed by a servlet. But then the display of the results will be executed by the Java server page. The servlet can forward requests to it. So we're going to use request dispatchers here.

The other example that you're doing in this chapter is you're creating a ProductEdit page to update products, display the product and give it a user, a capability to update it. Just really for the hell of it to try out a different technique. the ProductEdit JSP page is going to use a web filter as a controller.

So you've got two pages here. You've got a page showing the list of products, and you've got another page that shows the edit capabilities for the product. And the list one is controlled by a servlet, and the edit is controlled by the filter.

In a real world application, you probably will choose one way or the other to implement the model view controller arrangement. You would not use this mix of technologies in the same application. It would probably be an overkill. So you probably will go with either a servlet as controller or filter as controller.

Well, in the exercise you are told to do both just to try out and to be able to compare how one technique differs from another. So you would be able then to make choices in your own development situations as to which technique will be more appropriate for you.

## 2. Practice 8-1: Creating a JSP to Display the Product List - 23m
## 3. Practice 8-2: Creating a JSP for Editing a Product - 33m
## 4. Skill Check: Creating Java Web Applications by using JSPs - Score 80% or higher to pass
