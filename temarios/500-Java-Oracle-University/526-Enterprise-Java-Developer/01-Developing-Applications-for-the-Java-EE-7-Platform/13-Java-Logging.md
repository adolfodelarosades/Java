# 13: Java Logging

1. Java Logging - 17m

## 1. Java Logging - 17m

Let's take a look at the ways of writing Java logs. This is an appendix material. And it covers the topic that really is something that isn't Java EE specific. You can use longer API in Java SE just as well.

But since the Java programming course doesn't have a chapter that covers logging, this appendix has been placed into the Java EE course just in case, just to make you comfortable with the way you write logs. You probably would notice that a lot of exercises within this course do use logger API. And this particular appendix gives you some brief explanation as to the mechanics of how the logger API works.

So how the API works, how to configure logging, how to write logs, let's take a quick look. There are different logger libraries available in Java. Some popular ones I mention here, log4j is in Apache framework. And there's java util logging API, which is actually what we could use out of the box with any Java installation. So it's kind of a generic feature of the language these days, well, since GDK 1.4, which is for quite a while now.

And there are also some common abstraction libraries that describe the way logging works in general, so that essentially, you could plug in different alternative loggers. And especially that might be something that you could consider if you're configuring logging for Java EE environment.

How loggers work. They have something, really, in common. And that's the idea that you can write a log with different severity levels. Examples here use the standard Java logger API.

Right. So you need to configure your logger first. The logger would be associated with a name. Each logger has a name. In this particular case, we create a logger by using the class name, so the product manager class name. Yeah, there you go. Using that for our logger name.

And then you can start writing log messages. Each log message can be associated with a severity level, error message, in-fill message. It could be just message. Or it could be a message and also a throwable object. Suppose if you're logging errors, that makes perfect sense to write down the information about the error itself.

There are some shortcut methods you could use. Basically, instead of saying, logger.log level info and then the message, you can simply say, logger.info. And the shortcut methods are available for all the severity levels.

Now, the idea of a severity level is that you may decide to record more log messages or less log messages, so the amount of logging that you are producing. And if you are logging something like a severe error, well, I suppose it's something that you would like to record, even if all other logging messages are not recorded. So finest means the most level of detail. Severe means the least level of detail of your log. And well, obviously, everything in between is kind of gradually decreasing the level of detail, going from finest to severe.

Now, the logging methods that you could use. So there's a generic method called log. You could use that. Pass in the message, pass in the severity level as parameters. There's a slight variation of that , a method called logp or precise. It has additional parameters that allows you to specify not just the class that is writing the log but also which method in this class is writing the log. So I suppose if you're interested in figuring out specifically at which point in time the logger has generated the message, the precise method might be quite useful.

logrb? Well, it is similar to just general log, but it also utilizes resource bundles and allows you to write log messages that are picked up from resource bundle. I suppose if you want to localize logging and write messages in different languages, so you can pick up them from the bundle.

Additional logger methods, they work on a finer level. And these are called entering, exiting, and throwing. When you enter the method, when you exit the method, when you throw the exception. They're kind of specialized methods that allow you to indicate precisely which event within your program has generated the log, again, helping us, when we read the log, to get our head around what exactly happened in a program.

And then all of the shortcut methods, we kind of started already with one of them on a previous page. The in-fill method was mentioned here. And I say, well, for every logger level, there is a shortcut method so you don't have to do log.type, logger type. You can just quickly write a severe warning or info, whatever message you need.

Now, guarded logging. Guarded logging is an idea that allows us not to prepare the message. If a logger level is set in a way that, when you write that message, it's not going to be written. For example, imagine you set the log level to severe, least possible level of detail. And then you try to write the log with, let's say, info level.

It's more level of detail than severe, isn't it? And in this particular case, the example is info fine and finer, yeah? So if the level is set to info and you're trying to write the log with a level of fine, it won't be written. The logger will simply ignore the message, because your log level cuts off earlier than the level at which you're trying to write.

So here is a problem, that concatenation. You are wasting your program resources on preparing the message. And yet, you're not going to write that message out, because your current level, info, is less detailed than the level at which you're trying to write it, which is fine.

So what you can do about it? Well, first, you can simply check the current level of logging is loggable. So you're saying, I'm about to write the log. And anything that is more detailed than finer isn't going to be written. So you check that level.

And fine is below finer in the order of level of detail, so you'll be safe. You are saying that this message is going to be written. And therefore, this concatenation will all be a waste of time.

However, there is another alternative, probably a more simple alternative. When you write in the log, don't concatenate messages. Use substitution parameters. And the substitution parameter will be substituted into the message only if the log level is set in a way that actually will write it. So if that fine level is going to be ignored, because say for example, the log level is just info, then that log method will not bother, can substitute in parameter values into the message. So you kind of don't waste your resources on that. So that's probably a bright idea as to how you would like to write logs to allow you to switch the level of detail without having to really consider any performance implications with regards to preparation of messages.

You then can configure the log writing for your application on different levels. The idea is that you can set a logger detail level for the entire application, the root logging. And then you can override it on lower levels. So for example, for a specific package or for a specific class, you can set up the logger to have a different level.

So for example, in this case, we're saying generally, for this application, we'll only write severe messages, so least possible level of detail. But then we decide that, for the product class, we'll actually switch on the more detailed level of logging to fine logging, I suppose because you want to debug something, you want to just check things out in a particular area of the application.

From production system point of view, you normally try to keep loggers at the least possible level of detail. But then if you need to troubleshoot something, then it could switch logger to higher level of detail. But you don't have to do it for the whole system. You can do just for selected classes.

That actually explains the naming convention around the way in which you create loggers. Remember we're using current class name. So it kind of makes sense. You use the class name to name you logger. And then that allows you to control the level of detail per class or per package for a specific loggers.

Loggers on detail level, a child logger will inherit the level of detail from the parent logger by default. And obviously in this example, you can see that we can reset that level of logging.

The next thing you could configure is whereabouts the log is going to be written to. And that is done with a log handler. Log handler points to some sort of device. So that device could be what? File, console, memory, socket, stream anywhere, yeah? So whereabouts you want to channel the log. Write it to a file. Stream it through the socket. Any way you want. So per handler, you can configure a different log destination.

Also per handler, you can configure the log formatter. Well, a good example, just XML log, maybe, or just plain text log. So different formatters are available.

And for handler, you can override the logging level again. So any messages channeled through that particular handler will be cut off at a different level of logging regardless of the order in which the logging severity level has been overridden throughout your class hierarchy. So the handler kind of forces its own filter on what it or writes to the log.

Now, how it's actually configured. Well, you could configure it in a file called logging properties. It's part of your Java development kit. It's a standard component in Java. So you can configure the list of handlers, which logger's you'd like to use, the level of detail for your loggers.

And you could basically do it for the whole system. You can do it for a particular package. You can do it for a particular class here.

Well, in this case, we're using the simple formatter for the console longer. So that's the first one. And we use an XML formatter for the file handler logger. So there you go.

Oh, and with a file as well, we do things like configure the logging file name, the size of the file, because the logger can perform automatic rotation of files, so switching as file reaches the size limit, switching to a new logger increment in the log number. So that's the logging properties configuration.

In a Java EE environment, loggers are configured and maintained by the Java EE server itself. So WebLogic server uses java.util logging standard API. And it could channel logs as usual to files, to the console, whereabouts you want them to be written.

A default location for your log file is under your domain folder logs and server log, name of your server dot log. So the server logs are rotated. You can obviously configure their rotation period and size.

There are some other interesting options you've got. For example, WebLogic server allows you to get access to logs through the REST service interface. You can reconfigure logs to use different formats, such as Oracle Diagnostic Log format. So it's on the level of configuration of an individual logger.

Now, this is a screenshot from the WebLogic server console. Just in case if you're wondering where your logs are and how they're configured, you could go to domain configuration, logging. And that's where the configuration exists. So you can see where the logs are written.

And you could obviously, if you want to observe what's in a log, you go to diagnostic, log files. And there you go, watch whatever log you need here. Just select it and view it.

I suppose this is a minimum amount of information you need to know about logging that will allow you to write logs during the exercises on this course. And also, should you wish to look at these logs, you could reconfigure or observe them from the WebLogic server console.

WebLogic server, when it starts from NetBeans, would display the console log in a NetBeans output window. So you don't really need to go here to observe the log. You could see the logs straight ahead inside NetBeans. The logger is already configured that way to put messages on the console. And the console will be provisioned for you by NetBeans at a point when it launches the WebLogic server.

So it's rather convenient. And that's why this material isn't really part of any chapter, but just an appendix, because it kind of works out of the box anyway. Unless you want to change the configuration, it all works fine.

All Right. That's it.
