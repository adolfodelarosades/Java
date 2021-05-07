# 13: Localization

1. Localization - 5m

## 1. Localization - 5m

Last section, Localization. Question. Given these property files, so the first one is message.properties. And we have a key of truck, which has a value of the truck costs. And a key of stove, which has a value of oven costs.

Then you have three other property files in different languages, first is English from the UK, French from France, and French from Canada. And we have the given desired output. So you want to output these values corresponding to the languages featured in the property files we have.

Which statements are required in the following code to create the desired output? Assume the default locale is English from Canada or ENCA. Answer. Let's see what this code is doing. Let's start in the main method.

First, we create an instance of internationalization example. And it creates a hash map that contains the price of our truck and our stove. Note that this code does not perform any currency conversion. Then it calls messages four times, once for each of our property files.

And in each case, it's creating a locale object in the various ways you can create locale objects. First one, it just retrieves the default locale, which is English from Canada or ENCA. Next, it creates locale English from Great Britain. Third, it creates a locale from France with a default language, which is French. And fourth, it creates a locale with a builder class, which enables you to create a locale object method by method.

Then when we look at the print messages method, first it retrieves a resource bundle based on the name of the properties file, but disregarding the extension properties and disregarding the text that specifies the locale in the file name of the properties file. So note, we have simply resource bundle, get bundle, and two arguments, messages, and L.

So you don't have to specify the full file name of properties file, you just specify the locale. Then it creates a number format object so that we're able to output either a dollar sign or a euro sign depending on the locale. To print the proper currency symbol, we use the number format format method.

Question. Given these property files, so we have Message properties and the same truck and stove. And now we have an XML properties file that contain the prices of our truck and stove. And given the desired output, the truck costs 20,000, the oven costs 300.

How do you get the desired output by using the properties class? Answer. So this example is demonstrating how I could retrieve values from a properties file or an XML base properties file. And it also demonstrates that it could use property files for purposes other than internationalization. You could use it to store key value pairs.

This is a summary of Localization, .properties files, the Locale class, the builder class, the ResourceBundle class, the Numberformat.getCurrencyInstance method, and the difference between Properties.load and loadFromXML.

This is the last slide, slide 208. Thank you for sticking around. And good luck on passing that Java Certification exam.
