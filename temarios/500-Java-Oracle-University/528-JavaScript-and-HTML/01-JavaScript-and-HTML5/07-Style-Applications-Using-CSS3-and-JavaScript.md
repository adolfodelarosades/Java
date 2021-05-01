# 7: Style Applications Using CSS3 and JavaScript

1. Style Applications Using CSS3 and JavaScript - 55m
2. Practice 7-1: Styling Elements with CSS3 - 14m

## 1. Style Applications Using CSS3 and JavaScript - 55m

Let's go ahead now and get into lesson number 7. In lesson number 7, what we are-- let me start all over again. I think there's something. Let's go ahead now and get into lesson number 7. Here we are going to discuss the CSS, style applications using CSS3 and JavaScript. That's what we're going to do.

So, in this lesson, we are going to look at applying CSS style to HTML documents, use CSS features to add dynamic styles to elements with events, use media query and media data to adapt styles to different screens, and use JavaScript to add and remove styles from elements.

So here are the topics that, typically, we cover. We start with the cascading style sheet basics, where we add style sheets, selectors, adding dynamic styles to elements, CSS properties, box model, vendor prefixes, and so forth. And let's try that. So, of course, the CSS2 specification were adopted in 1998. CSS3 has been in development since then. Of course, we added more features all the time do it. And now, of course, we make use of the CSS3.

So the rule, syntax, for CSS would be making use of selector, as you see here. And then, of course, a selector would be any, in this case, a component that we work with. In that case.

So here's an example where we have a selector, h1. And, of course, we do have, in this case, the background color. This would be the property. So, underneath, you have property_one with the value_one, property of value_two, and so forth. Here, the property that we're using in this case it would be background-color, would be white. And then the property color would be red in this case.

And, as you see here, we put a semicolon to represent after these value pair. Rather, if you want a name-value pair of these properties, we'll go ahead and put a semicolon, like property_one, value_one, semicolon, property_two, value_two, semicolon, and so forth.

And, of course, here is an example of what we just have seen. So here's an example where, in this case, we do have a CSS style that basically overrides the rule. Here, for example, for h1, we decide that in this case that the background color would be red. But if you take a look over there, in this of course property, if you want a value, we also added something interesting, which is the exclamation important.

This important, if you add it, or exclamation important, is a rule that give you a weight that is higher than the usual weight. This allows you basically to override a author style sheet. But, in general, we tell you that you got to be careful with this exclamation important rule because it should not be used unless really there is no option, because in general it has a tendency to break the natural cascading in the style sheets of your page. So be careful with that.

Let's go out and try it just as an example. So if I go to my, in this case, lesson 7 examples and I click on the first one, which is the CSS example, I already have it. So, in general, basically what you have here-- and let me go ahead and cut. In general, when you start it, it looks like this.

Let me go ahead and start all over again. So that's typically where we have it at the beginning when you start. And let me just do a, in this case, this is at the beginning. So I did copy this from the book. I kind of put them into a file. I just used the jEdit and put a few examples in the file from the different slides of your student guide. So I can go out and try them.

So I try this one here. And, by the way, let's ahead and run this. So this is typically what do you have. And now, I'll go ahead and put down, in this case, a CSS syntax here in my style.css file, which makes use of a selector h1, which is the header. In this case, h1. And then the background, in this case, color, red, and it's important.

This is, by the way, following here. The index.html represents this, in this case this page that you see here. So we do have, in this case, under the header we have a home. And then we have a couple of links, rather three links here. Href section-1 representing the speakers, and section-2, the workshops, and then sections-3 representing the submit proposal.

So here, under section, in this case ID section-1, we had our header, which is, in this case, with h1, which is, in this case, the speakers. We already have here a header, which is this one here that you see here.

And then we have the second one, which is section-2 and with the h1 header. And then the same thing, the workshop. And then the same thing, section-3, we have an h1 header, which is submit proposal.

So now, if I use this style and then I click run, I see now the background color on the first, in this case, h1 header, the speaker because that's 1. And then the workshop. And then of course, in this case, the submit proposal. That's basically what I have here as an example.

So let me go back to my lesson and continue. And, of course, here's adding some CSS to HTML. In general, when you add some CSS to HTML, you typically have three ways to do that. One is to add, for the inline style, there apply to adding the style attribute to an opening HTML element. In this case, for example, I'm adding that right into the HTML element h1 as an example.

Or, in general again, inline styles are not recommended simply because they cause a big maintenance cost. So you got to be careful with that. Or you can go ahead and embed them. Use the embedded style.

Embedded style are applied using the style. In this case, element. And you can go ahead. This should go under the head element that you see, in this case, in this example. Again, there is a little bit of a disadvantage to this because the CSS must be loaded every time the HTML document is loaded. So be careful with that. There is a cost for that.

But really the best option to add CSS, which by the way, we mentioned this right at the beginning when we started with the course at the beginning, where you put it into its own-- put all, add all the CSS rules in their own separate document. Then that makes sense. You can go ahead and reference that CSS document anywhere you want. And that's exactly what we want.

And this is the example that we show you in the example where I showed the h1 example, the h1 header element example but I showed you earlier. That's basically what we want.

So this is where you put it. That's the third option. You put it inside its own file, and then you go ahead and basically link to it. And that's a lot better.

Or you can use the @import, And that also can be used. The @import directive that you see here in the bottom also can be used, where it's another way to add external style sheet. Here, we add in the external style sheet, which is the style.css that we have in this case. But, in general, we always recommend it to use this one here, which is the link tag to add a style sheet to avoid performance issues, because the @import that you see over there blocks parallel downloading, so be careful with that.

Now, just continue with some examples with selectors. Here are some selectors in this case, where we can go ahead and use the class selector. Here, add colon copyright, and then the font size, whatever. Or you can use multiple classes. Here, .copyright.user-groups, and so forth.

And you can also what we call an ID selector. So with selector, pretty much you can go ahead and use, and here we just saw the example of using the ID selector section-1. Because remember, in our example, there is the ID selector in this case, which is making use of section-1, section-2, and section-2, and so forth. That's basically what we have here. All right.

So, in this case, we basically are using the section-1 and wanted the color to be green as an example. So this is just to kind of show you an example. Let's go ahead and just take a look at if we can see this here. So going back here, and I'll go ahead and use it as an example.

And then I'll just kind of delete this one here and replace it with this one. And then I click run. This, as you see here, all the section 1, which is speakers, it's all, as you see here, the color is green that you see here. That's pretty much what I want to show you.

And, of course, you do have other examples. So here's other selector examples. Here, for example, I have the paragraph p, and then the color in this case is blue, and the font size in this case is 1.4.

So let's see if we have an example about that. And we have it here. Let's go out and try it. So we'll just delete this one here and try this one here. And then we run it.

And, as you see here, now all the, as you see here, the color is blue for all the paragraphs. And then the size, font size, is 1.4 em, as you see here. All right.

We can always try-- another one here is p and h2, and transform is capitalize. That will be another example. Or the aside p, color pink, and so forth. Only those p descendants of aside will go ahead and get the color pink.

And we can try this one here, just as an example. Let's try it again. We'll do a copy here, and paste it here. And we can go ahead and run this.

And it's pretty much as you see here. It capitalizes the first, in this case, letter of every single word here. As you see, it's all capitalized. And so forth. So this is another example.

And you can try all different type of examples, by the way, here. I just showed you some but you can try many, many different examples. I tried these and I tried this one here.

You can use the universal selectors. So, for example here, the universal selector that says anything should have color blue. So this selects all the elements on your page, and to do that you just do asterisks and that would select all of that.

You can go ahead and use a descendant selectors, for example here, section-2 p, and a front-weight. So that basically have all the descendant selectors that you see over there.

Descendant selectors apply a rule to all the elements that are descendant of the specified type of element, in this case section-2 paragraph. So, in this example again that we see here on the slide, those paragraphs that are descendant of the element with section ID 2 would be in both, as an example.

And we can try all of these if you want. You can go ahead and try it. And the way you try it is quite simple. All what you do is, in this case, you open your student guide, and pretty much go to the-- and go here, for example, this section-2 p and then font-weight. So I'll go ahead and copy this.

In general, when you copy it, it's a good idea to always put it, in this case, inside a file, because when you copy and paste from a PDF file, you might have hidden characters. So I'll just go ahead and copy this and then paste it here. And I can go ahead and copy it from here and then just apply it inside my CSS file here.

If I run this, that pretty much, in this case, tell me under section 2 see everything now is in bold of section 2. And so forth. So you can go ahead and try all different type of examples.

And they're interesting because they actually give you-- they're interesting because they actually give you all kind of nice example. So here's another example where, in this case, I have section-2, article, header, h1, color red. This would be a child selector. So, again, they are a target element of the immediate children. And if you want the child, if you use the greater than, that will get you to whatever child within the hierarchy of the elements.

You can use combinators for adjacent siblings. Here's an example, h1 in this case. And so the adjacent sibling would be, in this case, selector target elements that are next to each other and have the same parent. It uses the plus character that you see here.

Or the general siblings using the tilde. So here's another one, too, where you can go ahead and have a second selector. It does not have to be immediately be follow the first one. Again, the selector targets in this case are all the elements that are siblings of the specified elements. This uses again the tilde character that you see here, as an example.

And this would be basically, in this case-- I think I have it here. Let's go ahead and try it. And we just delete this one here and try it. And if we run it, see how it gives me now all the, in this case, the general sibling selectors, and in this case we decided it's going to be orange as a color.

You will, by the way, also sometimes use the attribute selectors. So the syntax is always E and then the attribute or attribute with value that you see over there. An example is here. For example the input, and then it's required, and then the property would be the background-color, which is yellow. Another example of attribute value is that the input type is email, and the border is wherever, in this case a dashed black, as an example.

We can try these if we have them. Here it is. So this is basically a-- let's try this. And if we run it, you see now we go to the input text inside the form. And you see now the background the yellow, as you see here.

We can do the same thing for the email and add the next one. And add this at the end here. And then run it. And this will give us now the email in dashed black, the email box. And here it is in dashed black.

Even better, how about if we do a dashed red? And that is going to run it and see what we get here. You see? now it's in dashed red. So these are just examples of the, in this case, like we said, attribute selectors.

Continuing with the attributes selectors, we also can now use a, for example, a attributes that start with something. For example, you use the caret character with start with some value, or contain some value using the asterisk, or end with value using the dollar sign.

For example, here, we want all the, in this case, a href that start with section dash, in this case. And we know in our example that we have, in this case, href that starts with section dash, and then 1, and 2, and 3. So what we could do is we can use that one here and see what it gives us. And we want all of those to be red. So let's go ahead in this case and try it in our CSS.

And then if we try this one and run it, what's going to happen it's giving us all the href to be, in this case, in red. That's what we have in this case. And that comes from the ST HTML that we see here.

We can try the one that contains a section, will make it orange. And we try this in our CSS file. And I'll run it, and that of course becomes all orange, because these are the ones that contains T-I-O-N dash. And that would be, in this case, these ones here that you see. These three ones here. And that's what we have here.

So this is just showing you an example about that. And, by the way, we can also look at pseudo-class selectors. So with pseudo-class class selectors, the idea is that you can target elements that the user, in this case, is interacting with within the document based on their position state. So pseudo, in this case, classes are not explicitly, by the way, present in the HTML document.

And this will basically allow us to work with the classified pseudo-classes as a dynamic, in this case, and UI element state. So like, for example, link, visited, any visited link. Hover, link of the user passes the cursor of it. And active, an element being activated by the user. Focus, an element that has focus.

Enabled, any element in enabled state. Checked, radio option or a checkbox that you select. And of course target element. First-child, the first element. Last-child, nth-child, nth-of a child of a particular type. Colon root, which is the root that is root of the document, and colon not, which is an element not represented by its argument.

So we can try all of these, and we can see an example about this if we take a look at this example. And let me just go down here and scroll down and take a look at and example here where-- I can use this one here as an example.

Go back to my CSS and delete this one here and paste that one, where the font size is 18px and the font-width is bold. And that would be the last-child. If I run this and look down here, see? That's the last child that we have here. So that's an example.

You also have what we call the pseudo-element selectors. So these are also quite interesting, and a pseudo-element allows you to target any style parts in the document that are not reachable through a DOM. And that would be like the first-line. And, as you see here, it used colon colon. So the first-line.

And then you have colon colon first-letter, or colon colon before, add content preceding a given element. Or colon colon after, adding generated content after the element, and so forth.

In general, you can go ahead, and basically the convention is to put one colon before pseudo-classes and two colons before pseudo-elements. All right. And we can see an example about that. And this would be the second, this one here, as an example. Let's try it.

And we just delete this one here and paste the other one and see what happens. And then of course we run it. And, as you see here, for the first letter we increase the size to 200%. And, as you see here, you see it for the section 1 in this case because it's for section 1. For the paragraphs of section 1, the first letter will be always of fonts 200%, increased by 200% in this case.

And you also can add a dynamic, in this case, styles to elements. And with pseudo-classes, you can modify elements based on the user interaction. So you can use, for example here, on hover, you can just go ahead input, then the type submit, and then colon hover. And then you can go ahead and change the cursor pointer.

Or you can do a focus. When you focus, in this case you decide that it's going to be changed, in this case, to yellow or light yellow. And then on active, where, in this case, you can write it this way, where the font size becomes, in this case, 150%.

We can see an example about that. Here I do make use of this one here. Imagine I change this. Instead of yellow, yellow. And then I'll go ahead, so for the input text. And this basically when I focus. So I'll go ahead and copy this and then use it here.

And I'll run it. And then I scroll down to my form. All right. And then you see, when I focus on a input in this case, see how the background color becomes yellow that you see here. And, of course, in this case, this is the email, but we're talking about, in this case, the input in this case for the, in this case, the name. And as you see here, if I focus on it, it becomes yellow. All right.

So we can also, by the way, look at the fonts, and we can change the fonts to any way we want. In general, a typeface, or a font family, or formatting text, is a setup shown, as shown again in this example in the code that you see here, where we have font-family and then you have the different fonts that it can use, a Trebuchet MS, Verdana, sans-serif. Sans-serif is the default, by the way. If you don't have anything, sans-serif will work.

We also, by the way, can use the @font-face, and the @font-face has been introduced in the CSS3. It allows the user to download a font from the web page.

And, of course, you can go ahead in this case and try to download the Web Open Font Format, which is the WOFF, or the, in this case, the TFF, which basically represents, again, several a different format-- the WOFF, or maybe the SVC, the embedded type EOT, the open type. Or the TrueType, which is the TFF, and so forth.

We can also, by the way, work with colors. And in colors we can use either the RGB, the red, green, and blue. You can set the color based on the hexadecimal combination here for every one of them. Or you can use the HSL, which is the Hue, Saturation, Light-- and it's actually more intuitive, the HSL-- to specify also your color that you want to use.

So continuing with the lesson and going to the next, that will be again working with the CSS box model. One thing that you need to remember is that the box model in CSS states that every HTML element displays, or rather displayed, consists-- or if you want, the box model in CSS, start every HTML element displayed consists of one or more boxes.

And these boxes typically are shown in, as you see here on this slide. And they have the content, and the content basically represents, in this case, a paragraph or whatever, the list or the header, whatever object you have over there. And then, after that, you have the padding-- which is a light gray in this case around the content.

The padding, basically what it represents, it represents an area immediately between the content area and the border. And then, after that, you have the border, and the border basically represents an edge that encloses the content and the padding. And then, after that, you have the margin. The margin, it is a space between the border and the box containing the next element. That's what you have here.

All right. So that's basically what we see here. And, of course, you typically can take a look and find out about the size of your, in this case, in terms of the width and the size of your, in this case, right inside the content, and then the border, and then the padding. And then you can look at all these sizes and see them, with the height and width of every one of them.

And let's see an example on how to see that. And for that I look at this. And, actually, in the CSS example, let me try the other one here, the CSS example. And for that, I'll run this into it's own, in this case, in its own window. And that's what I get.

And now what I'm going to do in this one here is I'll go ahead in this case and start my inspector. So under Tools and Developer, and then get my Inspector. Which gives me this here.

Once I am here, then I click on the box model. And, as you see here, I can see now the-- so if I click here, pretty much it tells me about the sizes, where I am. And then I scroll, then maybe click in here. And I get, and so forth. So you can go ahead and click on any one of them. And that gives you the sizes in this case.

All right. And I can close my Inspector and close my window. Go back and continue.

And, of course, looking at the display, and alignment, and position, they are basically building blocks and they indicate how the boxes are positioned with respect to other boxes. In this case, you can have the display block. The property does not allow elements next to it. Whereas, again, display inline does.

And you also have the positioning, which basically gives you now the box position can be, in this case, calculated with respect to the block where the box is, in this case, is contained, and several values of the position property it will have.

So we can have, for example, an absolute, the value absolute for the position. This, basically, it says that the element can be moved by using top, right, bottom, and left. Relative, if the element is moved, the original space it took is preserved. And then the fixed elements with the position do not move when the page is scrolled.

And for that, it might be a good idea, in this case, to look at an example for that. And let's look at the CSS box. And so basically it's the index.html, and in this case I do have a section ID, section-1. And then I have here a class box. And I have, I am in a box. That's what I have over here that you see here.

What I could do is I can go ahead and add the position here. I can add the position attribute. And then I can try, for example, a fixed, as you see here.

And if I run this, this will be fixed, which means when I scroll up and down, that box is fixed, as you see here. I'm scrolling up and down. It's fixed.

I can change it instead to relative as an example. To relative. And I can go ahead and run it, and now it's relative to the, it's always relative to the box in this case, the display box which happened to be a block that you see here. So this is a good example to see. And you can go ahead and try it, just for the-- so you can--

And the other thing that I want to discuss here is the vendor prefixes. Vendor prefixes, what they do is they actually allow browsers to try out the new features of the CSS before they are finalized. And here, for example, we see some prefixes that are used with the different browsers and the examples that we can go ahead and try. So from Microsoft, to Mozilla, to Opera, to Safari, Chrome, and so forth.

The next thing that I want to discuss with you here in this lesson is the media query. So what a media query does, it actually tests for some capabilities of the device that is used to view the page. It basically turns true if the media type specified in the query matches the media type of the device.

So here, we do have a media screen and the max-width is 750 pixels. And, of course, in this case we can use a link media that you see here. So the media query basically rule syntax is shown again in the code that you see here, where we said that the maximum width would be the 750 pixels. That's the maximum.

And, of course, you can also use a media query using, in this case, in the link tag that you see here, with the media attribute or write the media query in an @import. So here we start with this one here with the link, relation stylesheet, media screen, and the maximum width is 468 pixel, and the href is mobile.css.

And then here we have another one example here. And then we can use also the import. The @import rule also can be used, as you see here. Again, the recommended way in this case is to write the media query rules inside the stylesheet, as we already know about that. And, of course, the media types allowed are screen, print, braille, handheld, projection, TTY, TV, embossed, speech, and so forth.

And what can a media carry test for? Again, the media features that can be tested would be the width, the height, the device width, the device height, the orientation, and so forth. So you would put all of that in your student guidebook. And you can go ahead and find them, from the width, to the height, to the device width, to the device height, the orientation, to the aspect ratio, to the end, and so forth.

So, in terms of the media queries, we can go ahead and use the keyword "only." That can be used also. And if we can use the "only" keyword and pretty much to hide the styles from the browser that they do not support. By the way, modern browsers, the only keyword is "transparent." You can use the "not" also keyword.

So here, for example, media only screen, and then we say minimum width would be 450 pixel. 480, rather, pixel. You can use the "not" keyword, and here's an example, where not screen. The "not" keyword reverses the logic of the query that you see here, which means--

And then you can adjust the viewport. In this case, rather you can adjust the viewport. So you can go ahead and adjust the viewport, and here it is where we can say the name of the viewport and the content here, where we say in this case that the width equal device-width, and the initial-scale is 1. So, again, in this case, what it shows us is that we are trying to force, in this case, the mobile browser to expose their true dimensions and disable the zoom using, in this case, that meta tag that we see here in this example.

And let's see an example about that. And for that, let's go ahead and take a look at the media query. And what are we're going to do in this case is we are going to use the tool, the Web Developer and the Inspector.

And now, again, let's go ahead and maybe do it in its own page. That would be a lot better. So run this in it's own page and then look for the, in this case, the Inspector.

And now what we're going to do is basically take a look at, in this case, once we do that, we'll go ahead and look at the, in our case here at the example, the media, and then try to, in this case, reduce the size of that. So whenever we reduce the size of this, in this case, we can go ahead and-- So here, it's basically showing us how we can reduce the size in this case.

So let's go ahead and take a look at an example here as a demo in our practice machine or lab machine. So now we click on the media query. This is what we're going to use. Here, it turned out that we have different media queries and based on the size. So if it's a, in this case, maximum width of 1368, the lights is blue, light steel blue.

And if it's 960 maximum, it's yellow. And maximum width 760, it's orange. Maximum is 600, it's red. Maximum width 320 pixel, it's green. That's basically what we have here. And here we have the orientation, landscape, and then all portrait.

So now what we're going to do is-- and that's first the index.html, which pretty much has in this case just an HTML page with some text, in this case paragraph. And here we use the landscape as a class.

And so now what we're going to do is run this in its own window. And then what we're going to do is, in this case, use the Inspector. And once we do use the Inspector, now we're going to look for the Representative Design Mode. So if we just hover through these, if we don't find it easily, just hover it and you will see so.

This is the Dock and then this is the Responsive Design Mode. And now this allows me to make this smaller. So, as you see, it is still gray. If I go down, in this case, and it's still by its way and I can go ahead and select the different sizes. So I can go the bigger one.

If I go down slightly in this case and go to the 800, you see how now it's, based on again in this case here, we're trying the orange, which is we are here. And I can go back and select another size. And I can go ahead and select another size here, and that says yellow, and that's basically going to this size here.

I can go back and select maybe a smaller size here, which is this one here, and that's the orange. And go back, select another one here, which again is, in this case, represented with a maximum width to be 320 pixel. That's green and that's what we see here.

And I can go down here. That's also green. And pretty much now you see that every time I change the size, I'll get a different type of color, and that's based on the media screen that I have here. I have different sizes with different, in this case, with different type of colors, just to show you the example here. All right. And just, of course, to demonstrate what we're trying to, in this case, cover.

Now, this is basically the example that we asked you to try. Go ahead and try it please.

Let's take a look now at the multicolumn. In the multicolumn, basically the content of a multicolumn element flows from one column to the next one, as you see here. And there are some properties that you can use in the multicolumn, and which would be either the column width, the width of the column, the column count, how many columns, the column gap, which allows you to add space between columns, a column rule, which basically allows you to draw a rule in the center of the gap, and then the columns, which is a shorthand property for the column width and column count.

Let's see an example about that. And for that let's go to the multicolumn. And the multicolumn here, what we're trying to do in this case-- so we do already have here a couple of columns. So instead, how about if we, in this case, delete the column width in this case and then just put down, in this case, the column count. So I'll put down column, in this case-- oops, typo.

Column count, and let's set it to 5, for example, and see what happens. It's going to run it.

All right, let's go ahead and take a look at an example on the lab machine. That would be a demo. And we're going to look at the multicolumn here.

And what they ask us to, in your book, in the your student guidebook, is they want us change the column count, or count width to the column count. And then we assign a value to it. In this case, let's assume we're going to have a 7. In this case, 7 columns. And then we'll go ahead and run that.

And you see we have 2, 1, 3, 4. Let's go ahead and try that and then run it. Let's go ahead and take a look at an example about that on our lab machine. And here I do have basically, in this case, the multicolumn example.

It's in index.html that has, in this case, columns. And we have a style here where, in this case, what they want is to do is change the column width with the column count. So we'll just call it count column count. And then we're going to put down a 6, for example. And then we're going to run this on a multicolumn and see it, and you see now it has 6 columns, as an example. All right.

And now, looking at one last a topic in this lesson, this is basically the example that we wanted you to try. So go ahead and try that. That's the one that I just tried.

And now the last one is modifying the stylesheet with JavaScript. So you can actually override the style using JavaScript. So you can change the style of a document dynamically with JavaScript. And the code in the slide again, in this case, shows you how, in the HTML and JavaScript part to, in this case, using in this case the JavaScript to dynamically change the style of the development by manipulating its style property here.

So we do have in this case a changeBox, that we see onclick changeBox, you would go ahead and change in this case the style. Get the element by ID box, and then change the background color, and so forth. And let's go out and look at an example about that. And this would be using the JavaScript here.

So here we have an index.html, pretty much, that contains a box. And its says change the box, the again, in this case, section ID that has a box. And then, I am in a box. That's the basically text that we see here.

And then it has onclick, in this case, change a box, which is a changeBox style, which is this one here. And we already have in this case the style, which is the box, and it has some height and width, and border, which happened to be blue here.

Then we change this into a JavaScript, which means when I click on the, in this case, on this Change box button, it's going to go ahead and execute in this case the changeBox function, which is this one here, changeBox function that we see here.

So here we'll go ahead and basically get element by ID, which is box, this one here. And then we'll go ahead and change the color, background color in this case and the the float, which is left, and then put the border as dotted. So let's go ahead and try this and see if that works.

Boom. Suddenly, now you see that you dynamically changed the style using a JavaScript function. Now, we can always change this to, I don't know, something else, like maybe here put in a 380. And maybe change the color here to something else. For example, in this case, 00, see what it gets me. I don't know.

And I can go ahead in this case and click on it and run the thing, and then click on it. And you see now, as you see, it's bigger, and then it looks like the background color is kind of like a pinkish type of a color. And that's the example that they want us.

So, you see, even though we have an original style, and you can see it here, but then the minute you, in this case, you click on the Change box style button, it calls this JavaScript function, which basically changes, in this case, the-- runs this and then dynamically changes the style of that box.

So when I click on it, it becomes bigger and then I change the background color. And that's exactly what we did here.

And that's basically what we wanted to say about this lesson. We do have some more links to learn about more things.

In summary, we basically applied CSS styles to HTML documents. We used CSS features to add dynamic styles to elements with events. We used the media query and media data to adapt style to different screens. And then we used the JavaScript to add or remove styles from elements.

We do have practices and this would be on the CSS console, and I'll show you that in a minute. This would be on your activity guide, and it would be all in the, of course, the JS console. That's what we have. It would be all in the JS console.

And then let's go ahead and show that to you. Let's go ahead and show that to you. It would be in this practice. In this practice, what we do is we have some instructions to you. Let me go ahead and-- so originally it is like that, where you have instructions. Practice 1, what you need to do. Practice 2, what you need to do. Practice 3, practice 4, practice 5, practice 6, and practice 7.

And we do have a solution for you here about all what happened, what you do. And, of course here, I just kind of looked at the, in this case, the example, and this is pretty much the solution. And I just want to copy it and apply it in this case too.

And then, if you run it basically in this case and look at the preview, you will see that whenever you hover your mouse-- let me run it in this case in a window. You hover it from paragraph to paragraph. It uses the magenta color, the background.

And then we change a few things. As you see, it's italic. We put some pictures on the different sides, and so forth. So that's what you guys are going to do. And they are done one by one in a form of few different type of practices, one after the other one.

And this is pretty much a solution to that. And you can go ahead and try it and compare what you wrote to be a solution code, just as an example. That would be your practice. Of course, after you try it, we'll go through it and show it to you. So just try it. And, of course, after you try it, we'll go ahead and show you the solution.

And that's pretty much what I wanted to say about this lesson. So go ahead and try the practices for it, and after you finish we'll go ahead and get into the next lesson. Thank you.

## 2. Practice 7-1: Styling Elements with CSS3 - 14m

So now that we are done with lecturing Lesson 7, which is related to style applications using CSS3 and JavaScript, let's go ahead and do its practices. Here we do have a practice 7-1, which is styling elements with CSS3. And it turns out that these practices are actually located in the web application JSconsole.

So let's go there. And it would be these practices here in Lesson 7. So we do have to preview, which is basically just a bunch of text which is related, you know, to the HTML document that we have here. OK.

And then we do have here the paragraph ID and some source in this case. And some images too. And a bunch of text that we have, which by the way, it's typically-- it's [INAUDIBLE].

And then let's take a look at the-- take a look at the instructions. It turns out that we have a few practices, and we have seven of them. And let's go ahead and do a one-by-one, each one of them, OK.

Make it slightly bigger so we can see better. The preview's here, so. And we can also run it in its own window later on, OK. So in the instructions, first one here, the first practice, they told us in the preview there are some paragraphs. And as you see here, there are a couple paragraphs that you see here.

And what they want us to do is write CSS code in the Style.CSS, which is this one here. As you see, it's up there right now. To change the font of the paragraph to courier or some font from a monospace family. Font style is to italic and font where-- a font where it can be bold.

Again, in this case, click on the link to see what the page should in this case look like. OK, when you click on the-- and then of course, you know, when finished click revert to original button to clean the CSS if you want, OK.

What I'm going to do in this case is pretty much kind of continue on it, you know, step-by-step and see at the end what happens. So for that, we are going to-- basically what I did here is I kind of root-- wrote all the code here. So for the practice one, this is pretty much the code that we are going to do. So I just copied from this gedit text editor and just say paste it here.

And if you take a look here at the preview, if I want to run it now, you see now we see it's in italic, Courier [? monoscope ?] italic, and then it's bold. OK, change that to bold, OK.

All right. Now what I'm going to do is continue with this and go to the practice number 2. In practice number 2, what we wanted to do is write some CSS to change the first line of the paragraph to a font color, which would be red. And the font size to be, of course-- it's 200, OK.

So I do have this, and this would be this one here. OK, because they want us to, in this case, change the first [INAUDIBLE] of the last paragraph. And then so I go ahead and use it here.

And I could actually delete this the way they told us just because revert. They said revert. And then go ahead and save that. And this, you know, p colon last child first tell the first line of that color red, and the font is 200.

If you run that on the preview-- OK, let's go ahead and run this. This is what normal what we have. If you run that, OK, in this case, you will see that the last paragraph and the first line of the last paragraph is red and the font is 200, OK.

And then they click on revert. And now the next thing is, in this case, going to practice number 3. In practice number 3, they want us to write some CSS code in the Style.CSS to change the background color to cyan when the user hovers over any one of the paragraphs, OK. And let's go ahead and then revert that at the end.

Let's go ahead and take a look at how we can do that. And for that, this is basically the code related to that, the hover. The color of any paragraph and the color of background is cyan, let's go ahead and do that.

So I copy this and kind of save it here. p colon hover, background color cyan, OK. And now we can go ahead and run this. See, when I hover it, I can even do it here. When-- see when I hover a paragraph, the background color becomes cyan. Cyan color, kind of bluish.

And I go ahead and revert because that's what they tell us. Revert that, so go ahead and revert that. OK. And then after that they want us to go to practice number 4.

Here in the html file there are inline styles in two img tabs. So which-- where we see here. So this is basically being [INAUDIBLE]. And that's what we see here, OK. See here.

So we see it here. Write CSS code to override the inline style and show the images of the web, OK. So let's go ahead and then revert that at the end. Let's go ahead and take a look at that. And this would be done through this code here, that's number 4.

That's what we have here. And then of course we put it down here. So display inline, OK, like you see here. And then it's important, that's what we have. Basically got it from number 4, which I already kind of have it here.

OK. And then all what I'm going to do now is run it. So here's the preview. And then if I run it, see, now I have the two images, OK. And I have here, all right.

And I go ahead and of course revert this, which means-- and then if I run it, pretty much is going to have the original paragraph. And now what-- what we're going to do is get into the next instruction, rather practice.

In this practice they want us to add some CSS to place images on a-- one on each side of the first paragraph. Let's go ahead and see if we can do that. This would be the code that we have in 5 here.

And let's put it inside here. And then look at it. So image display only the important exactly. And then here we have img alt, image 1, float left. And then image, in this case, alt img 2, which is float right.

And if I look at the preview and run this, that's exactly what I'm going to have. I'm going to have one image on the left side, image one. And then the second image on the right side of the first paragraph. That's how we write this.

And then of course in the instructions they always tell us to once you finish, you revert that, which means we click on the revert button which basically reverts everything back, OK.

And now if I run it, pretty much I have the old text. And now in the next practice, which is practice 6, they want us to now write some CSS style to format the third paragraph to a multi column style with five columns. The third paragraph, which is this one here. Now the first one, the second, the third one, this one here.

You want it to have five columns. That's what they want us to do. Let's go in and see how we do that. For this I have some code that I already wrote. I see number 6 and go ahead and do that. And then just paste it here and go through it.

So you see [INAUDIBLE] of the type 3, which is the third one. Then we have the column count 5, OK. In this case, for either WebKit or Mozilla. And column-count is set to 5.

If I run this, it does do the preview. So this is the first paragraph. This is the second, this is the third paragraph. And let's take a look at that. Now suddenly we take a look and see that the third paragraph now has, you know, has five columns. OK, that's how it's done.

All right, and then we revert everything because that's what they tell us in the instruction at the end. Revert to original button to clean the CSS. So that's what I did. If you now on the preview, pretty much would be exactly the same.

Let's go back to the instruction tab and look at the last exercise. In the last exercise, what they want us to do is write some JavaScript code, Code.JS to change the font of the paragraph to courier of some font. Kind of similar to what we did here in the first. Except that this was done in the dot-- Style.CSS.

This one here would be in the Code.JS, italic, and then of course bold, OK. So this which would need us to actually put the code right here in the Code.JS. Let's go ahead and take a look at that.

So I have it here, and here it is. OK. And let me just paste it inside my Code.JS defined here. Where my paragraph got [INAUDIBLE] paragraphs, which is this one here. And then of course in the family. Set the family to be courier monosgap-- monospace rather, and italic and bold, OK.

So if I run this, that's exactly what I get. Kind of similar to what I did in the first practice. OK. All right. So that's what they want, is of course revert. OK, and by the way, you can run it also in the windows pretty much the same thing. It's, you know, in its own tab if you want.

And then do a revert here. And that's what we have. Now what I want to do is it might be a good idea to add all of them together. How about that, OK. So in that case, let me add all the CSS part of it. OK.

And control-c, and then after that dump all of this here. And just get rid of this one, and two, and three, four, this five. Step number five. And pretty much separated them so we can see the code, six.

And then go ahead in this case and run the whole thing. OK, so you see pretty much you can run it. So this basically, you know, it does the whole thing. It kind of changes the-- makes it, you know, the first part of it.

We'll go ahead and, you know, use the courier mono-- monospace. Make the font style italic and then the font weight bold, and that's what we see here. And then after that, you got the first-- the first line of the last paragraph to be, in this case, in red and 200%.

And then of course, following and when we hover, you know, in this case on every paragraph we have the background cyan. And then the third paragraph we decided to put five columns on it.

And then of course, put the two images, in this case, on the left and the right side of the first paragraph, OK. This is if you want to run all of them at the same time. That's basically what we have, OK.

And this is what they want us to do in this practice. Thank you.
