# 19: Localization

1. Localization - 17m
2. Practice 19-1: Creating a Localized Date Application - 14m
3. Skill Check: Applying Localization - Score 80% or higher to pass

## 1. Localization - 17m

All right, for our last chapter, we're going to be talking about localization. Now localization is one of those things that it's probably easier to show you than it is to describe it. So I thought, in this case, we would actually bring up the solution for the practice that you're about to execute. And in this case, notice that in the Solution files we have a number of Properties files. The first one here, Messagesbundle, but notice that we also have Messagesbundle here, but they're followed by a language code and a country code. And so we'll talk about this in a second, but we're also going to be writing code in the DateApplication.

Now the DateApplication is exactly that. It's supposed to represent dates, or various dates. And so if I go ahead and run this, notice, for example, that in this case, I can see what a Full Date is, versus a Long Date, versus a Short Date. In addition, if I want both Date and Time represented, if you look at your screen, we've got Medium Time, Medium Date Time, or just Medium Time.

So there's a number of things and ways that we can of course represent dates and times to our users. But in addition we can also apply something called a locale, which means that, for example, if I want to show this application visually in French or Chinese or Russian, I can go ahead in this case and do that. So let's take a look at dates in French.

Well in this case, notice that not only are the dates but also the labels are presented in French, as are my choices here. On the other hand, if I choose three, we can see dates, labels, and options in Chinese. And then finally, if we prefer [INAUDIBLE], we get that one as well. So, the idea of this is that we can create locales. We can create our applications in whatever language we choose. But then when we present anything to the user, we can make sure that it is appropriate to their locale.

So how is that done? Well, in this point, I'm going to go ahead and flip back to the slides and we'll kind of walk through and see how that's done. So we're going to describe the advantages of localizing an application, define what a locale represents, and what that object is. We're also going to talk about a Properties file. Now a Properties file is basically a map. And when we were talking about collections, one of the things showed that a properties class is a subclass of a map. And so basically we're talking key value pairs.

We're also going to build a resource bundle for each locale and show you how to do that, and then show how we can change that locale, which is what we did, of course, in the application. Now it's important to localize simply because not everyone, weirdly enough, speaks English. Many, many people do not speak English, or even if they do, that might not be their preferred language. And so we want to make our applications region- and language-aware so that different cultures, different people can see dates, numbers, currencies in what they are accustomed to.

So we can plug in country-specific data without changing our code. So that's kind of cool. So we just saw this simple application. So how did we do this? Well, the idea of localization is you don't really change the code. What you're looking at is you want to make it so that you can change the things that are client facing. So, in the previous example, these labels are all client facing, so we would want them to of course be localized.

Now, to define a locale, we have two parts. The first part is the language, which will either be two or three characters long. And so, for example, they're saying that en or lowercase es stands for English or Spanish. And the language code is always lower case. On the other hand, you also have an additional country code that is always two characters long and is always uppercase. So US in this case stands for the United States. Spain would be Espana.

So there are a number of tutorials that you could look at if you wanted to have more information there, but let's shift gears a little bit, because in order to apply localization, we also have to understand the idea of a properties class. And so in the example on the slide here, we can have on the left we see host name, user name, password. Those are our keys. And then on the right of the assignment, we have of course the values associated with those keys.

And so the file where these are stored or this is stored will always end with dot properties, just like we saw in the solution. So the file can be anywhere that the compiler can find it. That's not a big deal. But to load this Properties file into our application, well, all we have to do is define an instance of a Properties class, and then we can call the load method to identify where the file instance is, where that is. As long as everything's working, then notice that I can then use the Property classes getProperty method, pass in the key value, and I will get the value from that.

Now, how do we combine all of that together so that we can execute our program and pass things in? So if we don't have a Properties file, but we need to populate our application with properties, we can use the -D flag to indicate the propertyname followed by an equal sign followed by the appropriate value. And we can have as many -D flags in the command line as is necessary. And then of course this would be my class file.

So that shows a number of different possibilities to do that. And then, of course, when we want to use it instead of using the instance of the Properties file, since we don't have one, we would use the System objects getProperty to retrieve the value for each property that we've passed in.

Now an extension of a property file is something called a resource bundle. And the resource bundle is what we would use to localize. It is a Properties file that allows me, or use of the Properties class that allows me to associate values that are my keys and then the values that I want to be able to translate.

So the way I might do this is that, well if this is my MessageBundle.properties file, and I'm saying well menu1 here is the key for set to English, et cetera, well, the first thing I would do is create the resource bundle for the English. And then I could then create separate files, append the language and country locale to the actual name of the file, hand it to my translator, and say OK, translate this word or phrase to the appropriate word or phrase in your language. And so we will create a number of these Properties files.

We will then put all of those resource bundles so that we can get to them in the same place in our application, so that when it's time for us to access them, we will be able to use the appropriate resource bundle now the important key there again is you don't change the keys, you change the values.

Now once you have that, there are a number of things that we can do to define a locale. For example, notice that I can instantiate a locale just based on using the locale class. There are some countries that are defined there, so you could create a locale that way. On the other hand, you could create a locale based on language and country code, as is shown here in China for Chinese and Russian.

Or, for that matter, there's nothing that says you can't create a locale instance based on whatever the current computer environment is. So once I have the locale, notice that I can instantiate that Properties file, that ResourceBundle. We can say getBundle, identify the base name of that Property file. And then I pass in the appropriate locale.

So in this case, since our current locale is going to be English, that would be how our application would run up front. Now once we have initialized the sample application, we then create the loop. And so in the case of the Print menu, notice that we have case 1. And in this case, case 1 says OK, output, setEnglish, setFrench, setChinese. So in this case we are outputting each of the different lines as we go. But it is reading from the locale file, from the resource bundle.

And so when we're done, we can say messages.getString, pass in the key, and then it's going to print out 1 dot and then the appropriate information based on what is in the resource bundle file.

So once we've done that, what if we want to change locales. Well in the previous one we had an example-- and I'll show you this here-- that when we entered in, so when we entered in 1 or 2 or 3 or 4, it called a method. So let's look at the setRussian. And you can see that in this case all it did was say all right, we're going to set the current locale to the Russian locale. The same messages are here, but now we'd call the getBundle, we identify which file we want, but now we're using the Russian locale, or the simplified Chinese, or the French, or the US locale in the code, which makes it possible for us to be able to see the application in the appropriate language.

Now the nice thing is I didn't have to change the code at all. And so we've seen both the examples in all the different languages, and as long as the interpreter interpreted correctly, we're good to go. Now also in the application we saw that we could change the formatting of dates. Now the strange thing is is that we've already seen, as we've gone through different practices, we've seen these classes used.

For example, we've seen the number format class previously, in which case we would use to, for example, get a currency. Well, we can do the same thing by using a DateTimeFormatter. Now the DateTimeFormatter and the NumberFormat normally will take one argument, but it is possible to pass in a locale to them as well.

So for instance, if I'm using my NumberFormat and I say, all right, let's pass a Double to the format method, and I pass in the appropriate locale, notice that in all these cases the currency is a million, but it's a million ruble, or it's a million francs, or it's a million yen, or it's a million pounds, depending on the locale.

And so what does the code actually look like? Well, here we go. So we're going to create a locale lock based on Great Britain. We're going to create an instance of the number format based on that locale. Of course my money is here. And so when I say money, here's my number formatter, format, and then I pass in the value in, and then it's going to output whatever the locale is.

So this would be the way that we could make sure that our currency was properly represented in different countries and different languages. Same thing with dates. We can use the DateTimeFormatter with a locale, which allows us to represent the same date in different ways, but correctly for that culture. And so, in this, the previous one, is the results of this particular line of code.

So I'm figuring out well what is the current date and time? What is my locale? Here's my DateTimeFormatter instance, and I'm saying ofLocalizedDate. And now I can identify, and this is where we were representing FULL or LONG or MEDIUM or SHORT, is we can actually use format styles, but then we can identify in which locale. So in this case, when we format using our DateFormatter, it output. And then for the locale, we output that to string.

Now, like I said, it is possible to use enumeration values to identify how we want to represent dates, and they're represented in different cultures differently, but they would be appropriate or at least similar in nature. So of course the short only shows us the particular time, where the medium will show us the three-letter month, where the LONG will show us the spelled-out month, and the FULL will actually show us the day of the week, the spelled-out month, two-digit year, four-digit day, and also show us everything in the time.

And so our formats, you can look those up in the APA documentation, or API documentation, of what the different format styles are. And there's nothing that says you can't create a custom format if you need something in a specific order.

And so in this case, we've described the advantages of localizing an application. We have identified how to go about creating a locale, how to create a resource bundle, and the code that is involved with not only the representing of the resource bundle, but also any currency or dates that we may need to represent in our customer facing code. And that completes Practice 19. And so let's go ahead and start the lab.

## 2. Practice 19-1: Creating a Localized Date Application - 14m

For our last practice, practice 19, they want us to create a localized date application. So we're going to create a text based application that displays dates and times in a number of different ways. We also want to be able to access the application in French, simplified Chinese, and Russian. So it shows us in the summary what it should look like.

So of course, we're going to open up our project. And then it says to edit the Date Application Java files. So we'll open that up. And you can see that there are already a number of things that have been done for us, so we don't have to do everything for this.

But then, the next step says to open the Messages Text.txt found in the Practices directory. Well, it's not located in your project.

So in this case, we could just say File, Open, File. And we can go to the Labs folder. And we are in chapter 19. And then in Practices, and there is this Messages Text file.

So let's go ahead and open it up. And the reason for this is that unless you are typing and writing Chinese and Russian, they're providing the values for us.

So the first thing is we want to create a message bundle file for the Russian text, named Messages Bundle, blah, blah, blah. So the way to do that, again, is we're going to add into our default package a new Other. And then click on Other. And we want to create a properties file, which is one of the options here. We're going to call this properties file what it says there, so Messages Bundle_ru_RU.properties.

All right, so we'll go ahead and Finish. And that will create our Russian message bundle. So we want to paste the localized Russian text. So that would be this. And that should give us our Russian. So we'll go ahead and save that.

And we're going to do the same thing for the other one. So we'll right click, create a new Other. Well, now we have a properties file. So we'll go ahead and do that. And in this case, we're going to do MessagesBundle_zh_CN.properties. And in this case, we can now copy the Chinese.

All right, so at this point, we now have these. Now just to make sure that I have these, we can open up the French and see that all we have are the Keys Menu One through Date Five, which is what we have here and we have here. These are comments at the top. You can take them out, obviously, if you want.

And so, I'm going to go ahead and just close these now that we're done, which brings us back to the Date Application Java file. So we want to update the code that sets the locale based on the user input. OK, so based on the user input, that would be these, so the set English, set French, set Chinese, and set Russian. And they pretty much look the same when we do that.

So let's see, the set English, we want to use the current-- there should be one there-- current locale. And we're going to set it equal to-- well, we can do, in the case of simplified Chinese, you can see that there are a number of those that already exist. So we'll use the US, in this case.

And we will then-- we'll use the Messages to identify how we want that done. So we're going to use the Resource Bundle Get Bundle. And in this case, the base would be Messages Bundle. And the locale, in this case, is actually going to be the current locale.

All right, I think the rest of these are actually pretty much the same. So let's just go ahead and copy and paste.

But in the case of French, we want-- well, we can base it on France, or we can base it on the language. So let's just go with the country at this point. We can also say that we want simplified Chinese.

And there is no Russian, so we're going to have-- and that's the reason why we already have a Russian locale that we created earlier. But in all cases now, our current locale will be based on what we just set. So that takes care of that part.

Now we also want to add the code that displays the date information in the Print Menu method. So that would be the Full Date, Long Date, Short Date, et cetera. And in each case, we're going to need to use a date formatter.

So do we already have that? Do we have a local date time? Here's our date time formatter, df.

All right, so we're going to set that equal to a date time formatter. And in this case, the date time formatter was going to use of localized. So we want one of these.

And specifically, in this case, we're just going to pass in a simple format style. And it is here that we can choose what we want. So they've asked for full first, so let's do that.

And then, we also want to add the locale. And in this case, we're always going to be using the current locale.

And then once we've done that, we want to write it out. So our print writer allows us to print a line. And specifically, we're going to get a message, but we'll just go with that. All right, so Print Line, we want our messages.get string.

And in this case, what we're looking for is date one plus what else do we want? We want the today.format. And then, we're going to pass in the date time formatter that we already talked about.

All right, so those two lines are necessary for each one of these. So that would be the full date. So I suppose I can put comment back on top. And we would see that each one of these, at this point, is now going to use the exact same code with the exception that we want to change the format style.

All right, so the first one, of course, we want Long. The next one we want Short. And the next one we want both Medium date time. But it's a date time, so we want-- yeah, it's going to pass the right one. And then in the final one, we want just the Medium time, but the format style is still going to be Medium.

All right, and of course, we're going to pass in different parameters. And that's what makes the difference. So we're going to pass in date two, date three, date four, and date five.

So at this point, if we run the application, it should give us what we had before. So it looks like we have Full, Long, Short. There's the Medium date, but we don't have a time. So apparently, that one we need to work with. And then, this one's not showing a time either.

So let's go ahead and quit. Go away. And so, we know that something's wrong here.

In the case of the Medium date time, the problem is that I used the of localized date. Well, in this case, we need to use the of localized date time. And in this case, I believe we only want time.

And so, now, when we've got those corrected, it now shows the appropriate dates and times. And it shows the appropriate one. The only difference is that I didn't put a space between those.

And so, in our Messages, it would be nice for us to put that space. And so, what we could do is between our date one here and the format, we would add the space.

All right, so let's see if we get the results we want. It does look like everything is better than it was. So let's see what-- OK, well, that doesn't work out so hot.

Apparently, in Chinese I'm not getting-- well, I'm getting everything that I want. Let's check it out in Russian. We've got our Russian dates. They look good. And our French dates and times look good.

So it sounds like we have successfully completed activity 19.

## 3. Skill Check: Applying Localization - Score 80% or higher to pass

Skill Check: Applying Localization

View Skill Check
