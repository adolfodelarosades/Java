# 18: Pre-CDI Servlet Examples

1. Pre-CDI Servlet Examples - 5m

## 1. Pre-CDI Servlet Examples - 5m

 
The point of the appendix is to show us what we've been doing before CDI Beans, kind of a more, sort of, low-level, a legacy style of coding that we had to perform before the CDI Beans were introduced in Java EE. Really, the purpose is to make sure that, if you encounter an application that dates back to earlier pre-CDI versions of Java EE, you know what exactly is happening in the code. It's not like you're recommended to write the code in this particular way these days, but it still works, so it might be kind of a legacy way of handling the logic within a web container.

Let's take a look. So the old Java EE approach before the CDI Beans to handling of a request, session, or application scopes, right let's take a look at this example. Imagine that you're writing a servlet, so this is the process request method of a servlet. The rest of the servlet code is not displayed, just the process request. So we have servlet request, servlet response as usual, so the normal kind of servlet parameters.

Suppose I want to put a CDI-- sorry, pre-CDI, of course, I want us to put Java Bean into a request scope or in a servlet context scope. Servlet context is application scope. And request is request scope.

Right, so how do I do that? First, I need to get the bean out of that scope and see if it's there. That's my first thing that I need to do. So if it's request, just get it as an attribute. If it's servlet context for us to get the servlet context object, then get the attribute. And then see if the attribute is present or not.

If the bean hasn't been placed into that scope yet, you can create that bean, instantiate it, and place it into that scope, matching the name. OK, it's exactly the same thing with the application scope. Create a new instance, place it into the scope, and match the name.

If the bean is found, just start operating on it, call business methods, this method, doSomething. Well, whatever it is, just do actions upon a bean. So see this is an approach you have to make. You couldn't just injected it, a container-- before the CDI standard was introduced, a container wasn't managing it for you, so you had to, yourself, figure out if the bean is in relevant scope already or not, and then place it into that scope as an attribute.

Right, another example is with a session scope. So imagine you have the bean, that is, what you want to put into the session. First you need to get your hands on a session object, so you've initialized HttpSession here. You check if it's a new session or not.

I suppose, if it's a new session, then the bean isn't there, so you create a new instance of the bean. And you store it under a particular name into that session. Else, if it's an existing session, not new, I suppose you then assume that a bean is already there. You can just get it back from the session and start using its business methods.

Compared to the injection, it's quite a handful, because I'm afraid you will have to repeat that code in every servlet that would like to access that bean, not just in this servlet, so it's kind of a routine thing you're doing. Yeah, definitely, CDI Beans allow you to just avoid writing all of that code and simply annotate one line of code just saying which scope it is and inject the bean. That's it, yeah?

It's much easier these days. But just in case, if you encounter the legacy approach, this is what you need to do. And that's it.
