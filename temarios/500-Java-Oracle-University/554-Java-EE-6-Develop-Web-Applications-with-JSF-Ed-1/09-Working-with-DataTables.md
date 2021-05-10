# 9: Working with DataTables

   * Working with DataTables - 22m
   * Activity 29,30,31 - 32m

## Working with DataTables - 22m

 
All right. Welcome back. Now we're going to start working with Data Tables, Chapter 9. This Chapter 9 is entirely focusing on the Data Table parts. We will see how to use the DataTable components, using column headers, folders, and captions for the Data Table, apply styles to DataTable and customize DataTable with a scroll bar.

And later, we're going to talk about how to enhance a Data Table with the sorting capability. In case you'd like to add the pager component to a table, you can. Though, it is not supplied by your JSF. You need to take the help of custom components for paging. All right?

Topic to be discussed here. We will start with DataTable components, simple DataTable implementations, value of DataTables, table cells, table header, table footer, tag attributes, styles, scrolling, sorting, and adding pager components.

DataTable component. This is useful to display the records in tabular format. You do not need to type [? TDTR, ?] as you do in HTML, because this is a kind of iterator. It takes the value, the collection value, and it creates the statement of the type within the DataTable for n number of times. And there, we can specify how many columns we'd like to have it in a particular row, using UIColumn.

See that simple DataTable implementation? That says that you use a dataTable. Value equal to data.customerData, variable, customer.

Just to show you this part, I'm just going to take you to remote desktop. If you just see how it is created, and then you can understand. Here, we have the example simple data table. If you see the first [? index of html, ?] it says dataTable value equal to data.customerData.

But what is data? Just like your [? DVD library bean, ?] some managed bean. And that managed bean has a property, get customer data, that returns collections.

The collection has customer objects, multiple instance of a customer are actually stored in this collection. You can click a variable that can be useful to refer to those elements, one by one.

And here, we have column, column 1, column 2, column 3. This is just for the row information. That row can now contain three columns. And the column I'd like to display, customer ID. I'd like to display customer last name. And I'd like to display customer first name.

This set of instructions that you have it here within the Data Table will be repeated for n number of times. And that n means number of elements available in this collection. So let's give a look to data managed bean.

I think they have here DataSourceBean.java. DataSourceBean.java, see that? They have [? add a list, ?] and the time that it is going to instantiated. This [? add a list ?] is initialized with the list of value, of customer type. The customer is a Java class object that holds customer ID last name and first name.

They have certain [? getRow ?] there. These instances are added. Just an example, to show you that, if you have the collections, you can show them. All right? And this getCustomerData is, in fact, returning the Error List object. OK?

So in this [? index.html, ?] what they're doing it, you're calling data.customerdata and displaying the Customer object properties, ID, name, last name, and first name with the columns. And that's what is going to be repeated for n number of times, OK? n number of times? That depends on number of elements available in the collection.

Let's run this. If I run it, it is going to build my application, will deploy it, and will open the URL with the browser. So you see, it's going to open [? index.html ?], the first page. And you will see here all the information that you have. And collection is now printed, this column 1, column 2, column 3. Repetitions with the next element, next element, is done by the Data Table, OK?

Now, DataTable components, if you see the Properties value that is referring to the Collection type of data. The Collection type of data can be an Array type. It can be a List type, ArrayList, LinkedList. It can be a ResultSet from JDBC.

Can be a ResultSet from JSTL. JSTL, you have a core library that can help you to write SQL statement to tag. And it can also suppose DataModel object found in javax.faces.model packets.

DataTable tab attributes, var. var is used to specify the valuable name. That can be useful to refer to the elements available in the collection. binding, as well. binding can be used for to bound the reference of the DataTable to the bean properties. Reference of the DataTable.

At the time of create view, restore view, DataTable instance will be created and will be the part of the componentry structure, right? That reference, we like to hold it somewhere in the bean properties for some manipulations to be done in the component. Programmatically, we can do it with the help of the binding.

Table cells. JSF components can be placed in a table cell. A column, you just have types of [? EL ?] previously. If you want, you can display output text within the column. You can display your drop down list box, your video buttons, some images, some grid panel. You can also put them within the column cell, right?

A JSF component cell can be manipulated, just like component outside the table. You can have associated event handlers on those components that you have added in the cell. And you can also specify conditional rendering with rendered attributes.

Each component that you have it here, graphicImage or inputText box, any component, they have rendered attributes. If it is true, that component will be rendered to the browser. That means they're going to be part of the rendered response. If the Render property is false, they're not going to be part of the response. So on the browser, you will not see the component rendered, OK?

Table header and footer. You like to give some name on the top for the column, some heading on the top of the table? Use facet tag from JSF code library and specify here, name equal to header, and give some name.

Remember, this facet you tag when the table tag, DataTable tag, it will help you to put some heading on the table. If you type it within the column, then it will be useful to give the column heading. So we want to give the column heading, we can use f:facet name="header", give some customer ID, something like that. Footer, that goes at the bottom. That depends on whether you're typing this within the table as a child compliment of a DataTable, or as a child component of your column tag, right?

I will go back and will show you here the next one. I'll just go to this and say, facets/fancy. Fancy table or what? [? fancydatalog.html. ?] [? xhtml. ?]

And you see that here. We're getting here in the top, column heading. And for the column heading purpose, what they have done it, they have included facets. You see that? Facet is there as a child component of the column tag. Within the column, you have a facet named header. That's why this is going to be the column heading.

If you type this here, within the Data Table here, it is going to be the table heading or table footer. Right? Similarly, column name header here, facet name header here, last name, first name, that you specify within the column. Each column has now the heading on the top.

The next topic that they have it here, using the styles, the styles, DataTable styles. DataTable, just like other component, they have a style class. If you have a style.css file included in your page and you have created some class over there, you can specify it there, class name.

styleClass is for the entire table. headerClass and footerClass are the attribute for the column headers and the footer, individual columns using columnClass-- see columnClass-- for individual column, and multiple columns. Means that the style's going to be applicable to the whole, to the all column, that is going to be columnClasses. For a specific row, one by one, rowClass. And multiple rows, we can say rowClasses. OK? This would be multiple rows.

So here, see, they have implemented some styles in your [? fancydata.html ?]. We can give them a look what they have written. Go back to fancy data and see that Data Table. They say, styleClass equal to table, headerClass equal to headers, rowClass is-- what they say, odd rows comma even rows.

You know what they are? They are the style classes which are available in this CSS file. All right? CSS file, it is here. They have included in CSS folder under Resources, which you're including on the pages.

And this style.css contains those classes, right? See? .table, headers, .header, even rows. All right? You see odd rows here? So background color is silver. See even rows here? It say, background color, yellow. All right?

Because of this, when you display the page, you see the odd rows are here in silver color. And the even rows are here in yellow color. All right? All those headings, what they're going to be telling or in blue color, this all is specified in this tag, OK?

Now, the next one. So that's here to say that we have multiple styles available. And these styles can be implemented on the Data Table.

You can also use scrolling. If you have specified the width and height-- you want to give width and height, a specific size, where the table can be displayed-- at times, there may not be much space to display all the row, because you have the specific width and height. You can take the help of div and specify the width and height under which the Data Table going to be displayed.

In case a number of records are increasing, that cannot be fit into this given written height, or the width is going to be increased, in either cases, you're going to get here the scroll bar. So this is, overflow, colon, auto. That means you will get either horizontal or vertical scroll bar automatically, depending on the size, whether it goes vertical or in horizontal. OK?

We can also have sorting enabled on the column. You want to enable the DataTable to have the sorting, so that you can perform the sorting based on the column selections, you can do that. All right.

To sort the results of a h:dataTable column, you need to implement table model type. Any one of the types from here, you can use that for implementation. So you can use, ArrayDataModel, ListDataModel, ResultDataModel, ResultSetModel, or ScalarDataModel. Now, your UI component which, in fact, is calling the setRowIndex from the SortFilterModel, which is invoking setRowIndex from DataModel where you have your data encapsulation. And this results the data to be sorted.

In this example, what they have done it, they have enabled the sorting. You just have to click on the buttons, and you will see your collections are now sorted, depending on your choice.

How are you going to do this all? For this purpose, let's see what they have done it. They are going to, first, convert this heading, column heading, as a commandLink component. So this is not simple text in blue color or in bolder or underlined formatting, it is, in fact, your command link.

So facet name="header" does a commandLink. When you click on that link, it is calling a method from tableData. TableData is a managed bean that they have created. A new managed bean they have created. And there, they have method, sortByID.

That is used, which does what? It sort the collections. And the same page is re-rendered back to you.

And the tableData it is calling here, getLibrary, which provides sorted data, depending on its action. Is it sortByID? Does something, sort the data by ID, and re-render the page. Same page is re-rendered. And then, going to see sorted data on the screen, OK? Similarly, for other column, you can say, sortByFirstName, sortByLastName. But you need to write the logic. All right?

Database tables. See, databases store the information in the table. You can easily communicate with the database. You have EJB business logic, [? item EJB. ?] There, you have the methods to communicate to the database, to retrieve all those records from there. And all the records that [? JB ?] is giving back to you, it is giving you in the form of [? that list. ?] Or you can take the help of JDBC, java.SQL [? JBD ?] ResultSet. You can take the help of javax.sql.rowset.CachedRowSet, anything that returns a collection that can be used in the dataTable.

At some point, you like to show only limited number of records at a time. You like to go for the paging, so that the first page, it shows 20 records at the time or 10 records at a time. But they are handled records. You don't want to have the long list of the dataTable, just 10 records at a time, then you want to have the paging interval.

JSF does not include the pager components. For this purpose, you have to create your own pager component, means custom components. In this chapter, they have already created a page of components for you. And they just want to tell you that, if you have a pager component, you can attach it with the dataTable.

This is the pager component. It is custom, customized, custom component. And just have to say, dataTableId, provide the name-- this ID, dataTablelId-- so that pager can be associated with the dataTable.

showpages, 20 pages, all right? How many rows going to be displayed at a time? 10. Right? So in this case, see, how many page it shows? Says 20. And 10 records you're going to see at the time. So you go to Next, another 10 records. Three, another 10 records. OK?

To use a dataTable in its simplest form, you must provide two attribute values. Identify two values, what it is going to be. var and value, right? value, which hold the correction type. And the var, that will be used to refer to the elements in the collection.

Which type of components can be placed inside a table cell? Inside a table cell? Remember, a table that is creating a cell, when getting a cell here, does a table-- let me change color-- that's going to be table.

If a table has three column, when it has the cell-- this is what we say cell-- here, I can have what? I can have outputText. I can have inputText. I can have commandLink. I can have graphicImage. I can have commandButton, panelGrid. That means I can have all of the above here in a table cell, right?

That's what all about the chapter.

## Activity 29,30,31 - 32m

Let's continue and see the practices. In this practice, we're going to see how to create a data table. We will modify list.xhtml and have data table insert the data. We will take the help of EJB components so that we can retrieve the records from the table, and we will show them on the list.xhtml.

9.1 is starting with the list.xhtml. They say that for this purpose, do some modification in your DVD library bean. So prepare your managed bean class, and then we'll go back to list.xhtml and design the page with data table.

What they're saying, DVD library bean just insert a DVD collection that is list type. So we'll do this. That's my DVD library. I'm going to open DVD library bean, and this DVD library bean will have one more attribute that is added, that is DVD collection. List type. Good.

And now what they want us to have get DVD collections. Get DVD collection, you're going type in the code to communicate to the item bean to retrieve all the records and let them be part of this list that you have created.

So I'm going to insert this code into my DVD library bean. You can type anywhere here. I said get DVD collection. It's now a property for the newly created attributes of this class. Check if it is equal to null, it is going to communicate with item bean to call get items, which will return the added list containing all those records. And that is what the value you will return from get DVD collection.

You can give a look to your item EJB Get All Items method and see what they have typed here. Get all items. Return type is list item. And what they're doing here, they are saying select item from item as item order by item titles. This is Java Persistent Query Language. That means select star from item and order by title.

When this query gets executed, all the records containing all the columns will be available to you in the object model in the form of item class object, which will be there in the added list. And that added list will be returned from this method to the managed bean. And the managed bean will provide this reference to DVD collection that you can use to display in the data table.

We can also have a method added here so that we can count how many elements are there in DVD collections. Have this method added here. It is simply just counting the size of DVD collection.

Somewhere, we have some spelling mistake. Here, this is lowercase, and this is going to be uppercase. That's a problem. So I will just make it like this, no issue. You have here DVD collection. Good.

Save it, and then go to list.xhtml and make changes over there. We will go to list.xhtml. list.xhtml, what they say that you delete msg_app_name, msg_title. What they want you to have it here, have something else rather than just listing the application name and the title there. I will just remove it. That's what here, they say remove it.

And now, here what they want, they want you to replace it with the welcome_list message. Welcome_list message in the Resource bundle has a placeholder. If you go to the Resource bundle and see here the message property, welcome to the DVD library application. And here it says it's a placeholder.

What will be the value of this place at this place that we would like to determine here in list.xhtml. And for that purpose, we can have this param statement added that shows DVD size. It's welcome_list. I think that is going to be some different. This one, number of DVDs in collection equal to welcome_list.

So what we can do now, we can go to that place and type this information over there. And list.xhtml here in the UI Define, just remove it and have that parameter output format added. Output format is displaying welcome_list that shows number of DVDs, colon. How many DVDs are there is going to be determined at the runtime by reading the size of the collection obtained through EJB. And we're just going to have here [INAUDIBLE]. This is what is going to be on the heading.

Content. Next is the content that you have to remove this back home options, command link. Just remove it and replace this with the data table. You will type your data table.

When we type the data table, we will use all those statements to have Facelets and column headings like this. I'm just going to remove this command link. Don't remove form. Form will be there. And have here a data table added.

Item, style class table, row classes, next attribute. One you can put down one line, the day, using it from your CSS file, cell padding. Frame is going to be box type. And then they have a column created one, column over there. And this column contains Facelets to have a heading for the column. And look what they're displaying here, item.title.

Wee the value? They call dvd.dvdcollection. Fix this, dvd.dvdcollection. That is what is my properties. In the Activity Guide, you have some typo in terms of the name. They say uppercase, but it's not uppercase. It should be dvdcollection. So make sure that when you type exactly the same as the Activity Guide, fix this issue.

This is going to get the collections from the managed bean that contains item inside, and I have here where you will define item, which will refer to those elements one by one. And here, I'm displaying the title first in the first column. Second column, which is going to display item.release here. Third column, we're just going to display the genre.

And now, the data table is closed. We can close it. And your form is closed. Your UI Define is closed. That's what we have done it now. And we can try to run this application and see list.xhtml, it works or not.

You can refresh the page and go to List. See? I'm clicking on this link. This link has the link to the list.xhtml and getting here the list available. It's displaying all those records retrieved from the table. You see what it's saying? the number of DVDs in the collection is 21. So getting everything displayed here. Good.

The next practice, 9.2, they want you to add a scroll bar and fix the size. So right now, the size is not fixed. If you have thousands of records, it is going to show all the records to you. If you fix the size, then all the records cannot be displayed together. You can have a scroll bar as well. That's what they're adding, scroll bar.

So what they want. They want you to add a div tag before data table. Add a div tag element above the [? s-form ?] form tag, above the [? s-form ?] tag, they say. No problem. Just add it and then close it later. Once the form is closed, you can close the [? div ?] over there.

I'm just going to do it here. Let's put it here. I'm doing proper alignment and indentation so that we can figure out what's there under what, and we're just going to see here [? div. ?] This way, we'll be able to see my open tag and close tag, form, form, data table, data table, if you do proper indentations.

Height and width you have specified overflow auto. You'll see. Open list.xhtml. You could type your list.xhtml. Refresh. See that? Now the size is fixed, but you're getting here the scroll bar because the horizontal content cannot be displayed in the given size. So you're getting here automatically a scroll bar. Good.

Next practice is going to take a little longer because here, they want you to enable the sorting. And to enable the sorting, you need to take to help of some couple of the classes which can encapsulate data provided by DVD Library Bean and perform sorting as per your request. You do not have to type all those code. You just need to copy some couple of the classes in your existing DVD library.

What they say, create new Java packets in the Source Packets folder and DVD library, and give this name, com.example.util. We'll do this right now. We'll go here and say, let's have a new package, com.javapackage, that is, util.

Now what next? You can go to the next step they say after this. Copy the file from this folder. Sort folder item compared to the new packets. Copy other two Java classes from this folder, sortfiltermodel.java, table.java that they want you to copy.

First, I'm just going to copy this item, comparator.java, to the new package. We already have favorites available. We can take the help of this Favorites folder. And I'm just going to copy Comparator to my newly created package, that is, Util. Paste it here.

Just give a look to this item, Comparator, what they have done. It is in com.example here. This package name is com.dvdlibrary.util, but it's listed to have com.example.util. Just change this package name. Com.dvdlibrary model, DVD item. We do not have DVD item. Rather, we have item.

See, the entity class, it has item. But here, they say DVD item. What is that? That's the typo that you have in Activity Guide. We just remove it and say com.example.entities. I'll just remove it and make it an item type. Item type.

And then I can fix [INAUDIBLE], which will add appropriate packets for me, com.entity.item. Now see, one more thing here. d1.getrelease, which is not here. We have release year. Get release year equals d1.getrelease year.

Now what they say here, something they're expecting. This is, I think, additional. Good. For this type of changes, you need to do it even if you copy something from the given resource folder.

Once it is done, see what they're doing? Item comparator, it implements comparator interface, which lets you overwrite compare method. The job of this comparator is to compare two item objects.

We will implement this comparator while sorting the collections so that my collections can be sorted by comparing each element with other, and all of them are item type. So depending on the equality between the title, release year, and genre, it is going to decide whether they are same or not same. Good.

Save it. That's going to be fixed. No problem. No error. See, no error now.

Go to next step. What they say, copy the two Java classes from this folder, sortfiltermodel.java and tabledata.java, to the package com.example.beans. This is the package there. I'm going to copy these two files to this folder.

As well, Sort Filter Model, just open and review this. Sort Filter Model is doing work. It's extending the data model. It is useful for intercepting the request when you are retrieving the data and encapsulating them to the Sort Filter Model, which is our data model type for wrapping purpose.

Let's see the table data, what they have here. Table data is a new managed bean. It's a new managed bean, which has the wiring which is DVD library bean. What's the error here? Sort Filter Model item, that says not available. No problem. That's going to be fixed right now.

We do not have to here say com.example.beans. The same package. We will see clean build. Let's see if there's no error. When I say clean build, it's all going to be fixed. I'll just close it and reopen it.

Now we're getting here the error dvd.dvdcollection updated. DVD.setdvdcollection updated for us. We need to do some modification in our DVD library bean. This DVD, it is using the reference of DVD library bean. So we just have to do these changes over there and check if the DVD library bean has those options or not. There's no method that can be used here. We need to add it.

What's next here? This says review the code this class. Intercept the calls to original data model, and using an [INAUDIBLE] class, sort filter model to provide methods to sort the rows in the wrap data model by title, year, and genre. Sort Filter Model is useful because it overwrites some of methods and wrapping the data to be sorted.

Now, the table data is looking for a Boolean method, is DVD collection updated, which is not the DVD library bean. And that's what they say that has properties added into DVD library bean. Have a new property added in DVD library bean and I can say this.

I can have setter and getter for this as well. Insert code. It's a Boolean type. So I'm going to see here, is DVD collection updated? And see, DVD collection updated. That is setter and getter.

What they say now, they say make some changes in the code. They say, delete the following code item, bean.additem item. And here, you can say, if item bean.additem is successful, then we're going to say set DVD collection updated to, and this .dvdcollection equal to null.

So if you're adding a new record, that means you have to reread the records from the table so the collection can be updated and can be sorted. So if you are adding a new record, they say here, go and set this all to add DVD method. So this method is available to you in add DVD, here in this DVD library bean-- this one here. We can now replace this code with this statement, itembean.additem.

But see that itembean.additem says if you're using it, it should return Boolean value. That means you have to go to item EJB and make appropriate changes so that it can return true and false. So we will go to item EJB as well.

We're going to item EJB and make these changes over there. Item EJB. And here, we have add item. We can find it here. Double click so that it can take me to that particular code. And here, it is void. And we can say it is going to be Boolean. Boolean type.

As a Boolean type, you need to make sure that it returns a Boolean value. It says Boolean success equal to true by default on the top. Boolean success equal to true. If this processes successfully, you can return here, success.

If this is not processed successfully-- some error, something happened-- I can here say success is going to be equal to false. So depending on the insertion, successful or not, it returns true and false. That's what they wanted you to make some changes here.

Now go back to your code and see if everything is fixed or not. This error is gone now. And now we can fix this problem, table data. What this is asking for-- should be OK now-- is DVD collection updated.

It's just saying sort filter model is not available. The check sort filter model is there. It seems all good. It is there in this package, com.example.beans. Your table data is there. But it is still saying that unable to find this sort filter model.

I'll go back to this class, sort filter model. I see the package name here, it is actually wrong. Remember that we have copied it from the Resource folder. Let's say here com.example.model, that I need to change it back to beans because this is a Java Beans package. Now if I save it, I think the problems should get resolved.

Successfully compiled. Now what you can do is you can clean and build the applications and redeploy it. And then you can give this a tie to see whether changes made by you are updated on the page or not. I'm just going to run from here, which will not only deploy it, but also append the browser for me with appropriate URL. It deployed successfully.

We will move on to the next one. And next, what they say, once it is done, you've made all these changes, you have to go to list.xhtml page. And in this page, the data table that you have, you need to get the value from datatable.library. However, if you're getting from DVD library bean, now you read it from tabledata.library.

Now, what else? The header of the column that shows column heading needs to be changed through command link so that you can get an opportunity to hit a button. The information that it will show for the value, but when I click on the button, it is going to call tabledata.sortbytitle.

So if you see, table data is there. That, in fact, is encapsulating your DVD library bean reference. So it is actually obtaining all your data from DVD library bean into the array and sending it to the sort filter model. And here, we're calling sort by title, sort by year, sort by genre, which will be used by the filter model to perform sorting for your data.

This is returning null. That means you're going to see the same page render to you. But the data is going to be sorted. And you see your list has now sorted value. So I have made here appropriate changes in the Facelet to bring command line on each Facelet. That's what you have to repeat. You can tie it with the first one with the title. And then similar changes you need to do with the year and with the genre as well.

Now if we go and type, let's type here [? netin, ?] [? netin ?] and go to login. We're getting here list.xhtml. Click a DVD title. You click here. See, this is arranged in ascending order. Click here. It is going to be arranged in ascending order for the year-- 1941, 1942, '54, like this. And genre, it's going to be arranged in ascending order. So depending on your choice, it is sorting the collections and displaying the page back to you showing the changes.
