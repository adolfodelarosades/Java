# 15: Localization

1. Localization - 25m
2. Practice 15-1: Creating a Localized Date Application - 6m
3. Practice 15-2: Localizing a JDBC Application - 11m

## 1. Localization - 25m

OK now that we've done with the practices off Lesson 14, let's go on and get into the last session which is the last, of course, lecture and lesson which is Lecture and Lesson Number 15, that talks of, course, and covers localization. Well, in this lesson, we are going to describe the advantages of localizing an application, defining what a locale represents, read and set the locale by using the locale object, and build resource bundle for every locale, call a resource bundle from an application, change the locale for a resource bundle, and, of course, format text for localization by using number format and date format.

Well, the question that we always get is why localize? Well, typically the decision to create a version of an application for international use often happens at the start off a development project. And typically, the region and language aware software. You also have dates, numbers and currencies formatted for specific countries. And nowadays, of course, the ability to have a plug-in country-specific data without changing the code.

With the global market or global type of a market that we have, we all have now companies that, of course are international. And in the sense that if you talk about Oracle.com, you can access Oracle.com using any type of a language. Looking at the sample application-- well, localizing a sample application, typically it is a text-based user interface and this is again using this-- we are using this just for the purpose off learning this localization.

But there are, of course, if once you get into the gel the Java EE technology, and you get into the web components tier, or rather the web tier components which are the servlets and JSP's and JSF, you will also get to learn about localization except that over there you would provide your localization through the web browser as the client will be the thin client, which is the web browser. Here, for the purpose of learning localization in the Java SE 7, we make use of this interface that you see here, which is a text-based user interface.

Of course we have localized menus and we display currency and date localization. So, in the remainder of this lesson, again, the simple text-based user interface will be localized for French, simplified Chinese and Russian. And, of course, we enter the number indicated by the menu and that menu option would be applied to the application. Of course, if we enter a q, lowercase q, it is to exit the application.

So the interface would look like what I'm showing you right now on the slide here. Speaking of locale. Well locale specifies a particular language and the country. Typically, for the language it is an alpha-2 or alpha-3 ISO 639 code, and for example, you could see en for English, and es for Spanish and so forth. And always it uses lower case. And also you have the country code, where it uses an ISO 3166 alpha-2 country code or a UNM.49, Numeric Area Code.

And as an example, you see capital US for the United States, capital ES for Spain, and so forth, and always, it uses the uppercase. Of course, typically, they see the Java tutorial for all these standards, and I show you about that towards the end. So, in general, again, in Java, a locale is specified by using a couple of values, the first one is representing the language, and the second one is representing, of course, the country.

And you can see the Java tutorial for standard use and then you can go ahead and get into that Java tutorial which typically shows you all the details about localization in here.

So. examples, again, for the language would be de for German, en for English, fr for French, zh for Chinese. And so forth. And then for country samples, you've got capital DE for Germany, capital US for United States, capital FR for France, and capital CN for China.

Now of course, what we need to do it to be able to handle this localization, we need to work with the resource bundle. Well, the resource bundle class isolates locale specific data. It pretty much returns a key value it has stored separately, and can be a class or a dot properties file. And the steps to use is create a bundle file for every locale, and call a specific locale from your application.

In terms of the resource bundle file, we've got properties file contains a set of key value pairs. Every key identifies a specific application component. And, of course, special file names use language and country code. And, of course, the default for a simple application would be your menu converted into, in this case, resource bundle.

We see the menu here. Again, this slide pretty much shows a sample resource bundle file for your application. And every menu option has been converted into a name value pair. Again, this is the default file for the application. And for alternative languages, a special name convention is used. For example, a bundle and then, here, __rr represents the language, and then capital Y, capital Y represents the country code. And then the extension of the file is the dot properties.

Now looking at the sample resource bundle f Again he is some samples for the French and Chinese, just so you see what it looks. Again, you should note that the file names include both language and country. Of course, the English menu item gx has been replaced with the French and Chinese in this particular case,

We have a quick quiz here where it says which bundle file represents a language of Spanish and a country code of US? And that would be? The language is Spanish which is es, and of course, the country is US, and that would be C. Good job.

Looking at initializing the sample application. Well, here, again we need a resource bundle created. You simply need to load the bundle into the application. Of course the source code in the slide shows the steps. And first you create a locale object and again, that specifies the language of the country.

So, for example here, we go ahead here and first of all, we first create a new instance of PrintWriter past the two week SystemOut and True. And then some more code here. We see this, by the way, later on in the example on [UNINTELLIGIBLE] and then here, we specify the US locale which is going to be represented by US, and then the French local for the French, and then of course, here we represent the Chinese Russian as instances of type locale where we use the constructor here.

And as you see, there's a couple of ways to define locale. Either again, the locale class includes default constants to some countries like the ones that we've seen her. And again, if a constant is not available, you can actually use the language code with the country code to define the location.

And of course, you can also use the getdefaultmatter get the default location. And of course, here we have when you get the messages by invoking the get resource bundle and possibly the message bundle and he current look up. And this is how later on we run the application in the main matter.

Not looking at the sample application, again continue with this application, and here we look at the main loop. Again, for this application, we have a runmethod, and this runmethod contains the main loop. So again, this loop runs entered the letter Q is typed as an input. And of, course, a string switch statement is used here to perform an operation based on the number entered.

Of course, a simple call i made to each method to make the locale changes and display formatted data. So, as you see here, we declare a string line, initialize it to empty string, and then here, while line.equals is not q, go ahead and of course, in this case, called the print menu. And then within the try, we'll go ahead and read the line.

And, of course, in this case, based on that, if it's one that would be call the setEnglish, and if two call setFrench method and break. Call setChinese and break, if it's three. If it's four call setRussian and break, if it's five showDate, and if it's six showMoney method.

Here we see the printMenu Method. When instead of a text, a resource bundle of course in this case is used. The messages is a resource bundle and of course the key is used to retrieve every menu item. Of course the language here is selected based on the Locale setting.

So we have a printMenu here, and we print, first of all, a message here, and then, after that we would print the different menus. From again one representing menu1 and then menu2, all the way to menu6 and then menuq [UNINTELLIGIBLE]. And here we go and print by invoking the getString and pass it with the menucommand.

Changing the Locale. Well, to change the Locale, all that you do is set the currentLocale to the desired language, reload the bundle by using the currentLocale. Again you see it here in the function setFrench, where you specify the currentLocale which is in this case FrLocale, which by the way, we defined earlier in the code here.

And after that we'll invoke the getBundle method on the ResourceBundle and pass with the MessagesBundle and of course the currentLocale which is, in this case, the FrLocale. And of course the MessagesBundle presents the five.

Here's a simple interface with French. So after the French option is selected based on, again in this case, the code that we have here, the updated user interface looks like this, where in this case, as you see, this is in French. Not that I know French. And it's pretty much wherever the message says a equivalent to English.

Let's going to look at the format date and currency. Numbers can be, by the way, localized and displayed in their local format. And the special format classes are DateFormat and NumberFormat, and of course we create object using the Locale.

We initialize date and currency and the application can show a local formatted date and currency. And the variables are initialized as you see here, where we have some, again, More init code that precedes here, and then here we declare a NumberFormat currency.

And here we pass this Double and we create a new instance of the Double called money. Then you see we create a new instance of Date, today, and we declare here a DateFormat df. So before any formatting can take place, date and number objects can be set up. Again, both today's date and a Double object are used in this application.

Now let's look at displaying a date, and particularly formatting a date. So we get a DateFormat object based on the Locale, and then we call the format method passing the date to format. So here, showing the date, where pretty much in this case we call the getDate instance method on the DateFormat passed to it the DEFAULT and of course the currentLocale. And here we have a println that's going to go ahead and print today's date and in this case the currentLocale.

And here are some sample dates where this is that 20 Juil. 2011, that was for French, and we printed the Locale. And then 20.7.2011, that would be for Russian.

We can, by the way, customize a date. The DateFormat constant includes SHORT which is, in this case, completely numeric, such as like 12.13.52 or 3:30pm. Or a MEDIUM, which is a little bit longer where, in this case, you specify the month and then you still have a date number and the year number.

Or you have a LONG which is again longer, like you can have the full name of the month, then you have the number for the date, and the month. And of course you can have it also this way we could specify 3:30:32pm. If you want to show everything that would be the FULL. FULL is completely specified in this case, we have Tuesday, April 12, 1952 AD or 3:30:42pm PST, that says for Pacific time.

Looking at the SimpleDateFormat, it is a subclass of DateFormat, and typically you-- again here is a table that presents the letter, the date or time the presentation and the example. So, G, there the date or time is era, and the presentation is text, and of course the example is AD. For y, you've got the year, and of course presentation is year, and here it is 1996, or just 96. And for M, which is the month in the year, again presentation is month, and it's either July like this or Jul., or 07.

Displaying currency. Well we also need to specify a mechanism by which we also display currency, and again this could be a dollar, or a Euro, and so forth. So in this case we have the format currency, and in this case we get a currency instance of the NumberFormat, and pass the Double to the format method.

As an example, where we showMoney here, first of all we invoke the getCurrencyInstance on the NumberFormat passed it with the CurrentLocale, that would be my currency. And then here I go ahead and invoke the format method on the currency instance, passed with the money, and of course that would print my money, and the principal Locale.

So for example here we show you the one that makes use of Russian, that's the sign of the Russian money, I guess it's ruble. And then here, the sign of the French money which is Euro, and then the sign of the Chinese money which by the way in this case, this is the sign, I don't know what the name is. Yen. OK. Yen is Japanese right?

And we have a quiz. And this quiz says, which date format constant provides the most detailed information? And that's FULL, that's b, thank you. And by the way you also have an example of what we just have seen for the code. And this is the example that we have. It is a sample application where you declared a new PrintWriter, you have a BufferedReader, and you have the Locale here.

Again in this case the usLocale, the French Locale, and then you created the instance of the Chinese Locale, and the Russian Locale, and you have the currentLocale which is the default. And here we get the bundle, which is messages in this case. We declare currency. We go ahead and create a new instance of type Double and pass through it, a 1.00 million Double. And then we create new instance of Date and save it in today.

have a DateFormat, and we have the main method that creates a new SampleApp and calls the run method. The run method, we've seen part of it, here it is. Again it's similar to what we've seen. So we declare a String line, and then and make sure that the line is not equal to q. Then here we go ahead and call the printMenu, which is this one here that will print the menu, we've seen that. And then here, we'll go ahead and read the line, and catch an exception if there is an exception, and we pass it to the switch.

And if it's one since the English, if it's two sets French, and so forth. And of course here are the methods, setEnglish, setFrench, setChinese, setRussian, showDate, showMoney, and so forth.

If you're on this application, you will see that it gives you the default at the beginning, but I can always enter, let me go ahead for example and enter two. And the menu would be in French, so I'd see these in French. I can always enter three, and I know three is for Chinese, that pretty much shows me the menu in Chinese. And then if I enter four, that pretty much shows me the menu in Russian. And then I go back and enter two, I'll go ahead and get the one, in this case, in French, and if I enter one I'll go back to English.

How did we do that? Folks, it's because we created here the message properties bundles. This is the one representing French. This is the one representing Russian. This is the one representing Chinese. And if you now open this one here, you would see all of them. The English, the Russian, Chinese, and of course the French.

So this is, again, you get to see this as an example. This is part of the examples in this course. So, in general, what we've done here in this particular lesson, we described the advantages of localizing an application, we looked at what a locale represents, we looked at reading and setting the locale by using the Locale object. We looked at building a resource bundle for every locale-- we just saw that in the NetBeans example.

We again looked at calling a resource bundle from an application, we also can change the locale for a resource bundle, we have just seen that by running the application, and we looked at the format text for localization by using NumberFormat and DateFormat.

We have a couple of practice labs here for this lesson. The first one is creating a localized date application, and the second one is, which is again optional here, localizing a JDBC application. And if we want to see this in the activity book, and again in this case let's go in and see this activity book, and we go to the last one, so let's go ahead and look at that again. So in this case, we have practices for lesson 15, where first we present you with a summary level of creating a localization data application. And if this is good enough for you, you can go ahead and do the practice using the summary level, or, if you one more details, you can always go to the detail level.

And of course we have the second practice which an optional one, where we present the summary level of this practice by, we're trying to handle the localizing of a JDBC application. And if you want it detailed, this is good enough in terms of doing this session.

So again this is optional, and we have enough information to actually handle this localizing a JDBC application. So let's go ahead and do this set of practice labs. And this of course completes this course, and we hope that you enjoyed the course and you took advantage of all of the nice features all of the Java SE 7. Of course we're looking forward to meeting you in other courses in the other Java SE courses, or other Java EE courses. Thank you.

## 2. Practice 15-1: Creating a Localized Date Application - 6m

Now that we finished with lesson 15, which covers localization, where we discussed the advantages of localization of an application, we defined the locale. We also looked at reading and setting the locale by using the locale object. We looked at building a resource bundle for every locale. We looked at calling a resource bundle from an application. And we looked at changing the locale for a resource bundle.

Let's go ahead and look at, of course, the practices for this lesson 15. And we start with the first one, which, again, creating a localized data application. In this practice, we create a text-based application that displays dates and times a number of different ways, creating the resource bundle to localize the course in this application for French, simplified Chinese, and Russian.

So we create a simple text date application that displays again the following information, default date, long date, short date, full date, full time, and day of the week, and then a custom day and time that displays day of the week, long, era, time and so forth. And localize the application so that it displays this information in simplified Chinese and Russian.

Again, the user should be able to switch between the languages. Here's an example on how you see this. And after that, again, we open this practice, and we look at the date application class. Again, we open the message text in this case and create a message bundle which, again, is called message bundle in Russian and Chinese and so forth. And then create a message bundle file for the Chinese and the one for French.

Again, in the code here, update the code. That sets the locale based on the user input, in this case, could be US, France, simplified Chinese or Russian. Add the code to display the date information, as you see here, from default, long, short, full, full day, full time, and, of course, the customized one, the detailed one around the application.

So in this case, first of all we see the bundle properties file again. And this is the menu and the dates. Here's the French property file. And this is pretty much the English, the default one. And this is the French one. And this is the Russian one. And this is the Chinese one.

Of course, in the class Date Application, create new instance of PrintWriter, a new instance of BufferedReader. We get a new instance of the locale. In this case, we put it Russian. And we get the current locale, which is US, get the resource bundle messages, and, of course, create a new instance of a date today, the date format, and SimpleDateFormat.

In the main method, we create a new instance of the date application and call Run. Run here, by the way, has a string line. And then we check. If the line is not equal to q, go ahead and print the menu, and read the line, and, in this case, would be set the English, or set French, or set Chinese, or set Russian, if you enter one, two, three, or four. And here's the print menu where, in this case, we'll go ahead and print the date application.

And we have, also, Choose the Language, OK? And here's the method Set English, Set French, Set Chinese, Set Russian. So if you right-click this and run it, you will see now, we print [INAUDIBLE], it says, my custom day and time is, and then it gives you the date.

Now if I want to choose, let's assume I choose French, that's 2. And that would give me the date in French. Let's assume now I choose Three, which is Chinese. I do not know about Chinese, but here's what typically writes in Chinese. I can go back and choose One, because I know One gets me back to English, and that shows me, again, the information in English.

I can also choose Russian, in this case, which is Four. This is how it's written in Russian, the date and the menu. And I can go back and click One. I know that one always gets me back to the default, which is English. And that pretty much ends this practice. Thank you.

## 3. Practice 15-2: Localizing a JDBC Application - 11m

Let's go ahead and look at the last practice, which is Practice 2 of Lesson 15. In this practice, you localize the JDBC application that you created in the practices for the Building a Database Application With JDBC lesson. Localize the JDBC application from the previous lesson, identify any object that displays menu or object information and change them so that localized messages are displayed instead of static text. Localize the application so that it displays the information in English, French, and Russian. And of course, the user should be able to switch between the languages.

Again, we have a couple of project choices in this lab. First, we can use the project file from the previous lesson, which is 14, Practice 2, using the data access object pattern and just continue with that project. Alternatively, again, open Practice 2 project of this lesson.

First of all, in this case, we perform this bunch of steps, open the EmployeeTestInteractive.java. So of course, let's go ahead and go to the NetBeans. This is the Practice 2, and of course, this is the EmployeeTestInteractive.java. And of course, examine the source code, and determine which messages printed to the console should be converted into resource bundles.

Again, notice that not all text output is included in this class file. We have a note, you do not have to include error messages in the bundle. Only prompt and information message should be included.

Again, a slight change to the user interface is required. So currently, this is, again, what we had before. And I'm going to just highlight this. And then changing the user interface to this, actually, type of a menu, where in this case, we can go ahead and set the language.

This, of course, separates this single-character commands from the words. And of course, for the solution, only the words were translated. Again, you could, of course, translate both. Notice a new option has been added to set the language in this case. Create a message bundle for English, French, and Russian. Again, the translated text for the menu can to be found in the MessagesText02.txt found in the Practices directory.

Of course, if you take a look here, you will see that we already have now the messages. This is, again, the bundle.properties. Let me just move this slightly, a little bit, to the right so we can see the names here. Here's, of course, the English US. And then here is the French, and written in French, and this is the Russian message bundle russian dot properties file.

Continuing with the practice, some examine all the date-related source date and make sure that the date information will print in the appropriate localized format. And then, of course, continuing with that, when you have finished, run the EmployeeInteractive and make sure that the menus have been localized. And of course, additional improvement you could make, in this case, localized all the error messages and so forth.

Of course, this is showing you the summary. Now, if you look at the details-- this is obviously, it's an optional-- the details for this optional exercise. Let's go ahead and go back now to NetBeans and look at the details. So you'll see now, this is the EmployeeTestInteractive. You remember this. Here now, we have a resource bundle that we created here. And we invoke the GetBundle, and of course, pass the Messages bundle to it.

And then in the Main method, we create a new instance of the EmployeeDAOFactory, and we declare a Boolean variable, TimeToQuit, set it to false. And then here, we invoke the CreateEmployeeDAO on the factor that would get us an instance of the EmployeeDAO. Of course, all of this, we've seen in the past, because we are familiar with this type of project.

And then continuing with that, then, of course, we have the Try, and then we call the Execute menu, pass to it-- before that, by the way, we create a new instance of the BufferedReader. And then, when we called the Execute menu, it passed the BufferedReader and the instance of the DAO. And of course, catch a DAOException if there is one.

Again, here, we use the While loop, while not TimeToQuit, then of course, in our case here, obviously, we'll catch and IOException. Again, this is a do-while, pretty much. That's what we have here. So we took care of that. And here, catch any IOException if there is or any Exception if there is.

Now, looking at the ExecuteMenu method, and that's where now we create an instance of the Employee, and we have an action, which is a variable of type string and then an ID of type Integer. We have some println information to get us, again, [UNINTELLIGIBLE] here, the message Locale set to and then invoke to GetDefault on the Locale.

And then we have, again, in this case, a println that has, again, this messages.GetString. And then you've got the MainMenuCreate, and then you have also C for the MainMenuCreate and then R for the MainMenuRead, U for the, again, MainMenuUpdate, and then D for the MainMenuDelete, L for the MainMenuList. And then you have S for the MainMenuSetLanguages, Q for the MainMenuQuit.

And then, of course, we read the line and assign it to or save it into Action. And then we use the If statement here. So if the length is equal to 0, or again, in this case, invoking to uppercase on the Action, and then the character at 0 is equal to Q, then, again, return true. Else, keep on going, Switch. Again, use the Switch statement.

And now we will see, pretty much, the case C, case R, case U, exactly like we've seen earlier before, case D, case L. But on the other hand, case S, that's new to us. That's where we set the Locale by calling the SetLocale and passing an input here that set the default Locale. And of course, after that, return false, and then we have the three overloaded method here, InputEmployee methods, overloaded three times. We've seen that before.

And then down here, again, there's a do-while loop here. And then down here, we now are going to see some extra code related to, of course, setting up the language. And that SetLocale here, you see the SetLocale method. And that's where now we declares an action as a string, initialize it with an empty string. And here, we do a println by, again, invoking the GetString on the messages and pass to it the SetLanguage menu 1, 2, 3, and 4.

And then, again, within the Try, we'll go ahead and read the line, trim it, and save it into Action. And then here, use that Action to, in this case, represent the Switch, pass it to the Switch statement. For 1, again, it sets the US. For 2, it sets the French. And for 3, it sets, of course, in this case, Russian. And obviously, they're asking us now, again, when we finish, to run the EmployeeTestInteractive.

Let's go ahead and do that. We'll go ahead and run it. And now you see that pretty much we're going to have a menu. But the menu that we are going to be presented with will be slightly different than the-- let me see-- we need to, obviously, start the database, something that I forgot to start. And then we'll go ahead and follow, in this case, where we are on the EmployeeTestInteractive.java to make sure we see the menu. Let's go ahead and do that.

And of course, in this case, we're presented with a menu. As you see, the menu is slightly different. So before, I did not start the database. That's why it gave us that error. But now, we know that the database is up and running. So now, if you, for example, put 1 and Enter, of course, that will go ahead and set the US language. And that pretty much ends this practice. Thank you.
