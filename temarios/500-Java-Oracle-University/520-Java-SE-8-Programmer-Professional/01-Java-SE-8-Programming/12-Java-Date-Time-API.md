# 12: Java Date/Time API

1. Java Date/Time API - 36m
2. Practice 12-1: Working with Local Dates and Times - 36m
3. Practice 12-2: Working with Dates and Times Across Time Zones - 23m
4. Practice 12-3: Formatting Dates - 7m
5. Skill Check: Using the Java Date/Time API - Score 80% or higher to pass

## 1. Java Date/Time API - 36m

In chapter 12, we're going to tackle the Java date-time API. Now, this is brand new in version 8. Prior to version 8, working with dates and times were, let's say, problematic at best. In fact, most people who were working with dates or times worked with YODA. And you'll find that if you've ever worked with YODA that the Java date-time API is similar. It is not the same. It is not the same packages or classes, but they're very, very similar. But the nice thing is that in the Java date-time API, it also takes care of some issues that were even in YODA.

So what we're going to talk about-- pardon me, there's a lot of reading in these particular slides, so bear with me. But it does talk about a lot of different types of classes that deal with times and dates, but it also talks about how can we figure out, well, what is the duration, how about periods, et cetera? So we will be talking about a number of things here. So we're going to create and manage date-based events, time-based events, combining date and time into a single object-- that makes sense-- but also the ability to work with dates and times across time zones.

So for instance, if you are-- sometimes we get spoiled because we can sign into Outlook or something and we set up a meeting. And if the meeting is at 5:00 in New York, it automatically sets it for 2:00 in San Francisco. It knows the difference in the time zones, et cetera. And also, if it's the time when we bounce forward or we leap back, et cetera, it knows when that happens and takes that into account. The cool thing about the Java API is that it does, too. It is built into the underlying logic of the API of managing daylight savings times. So we're going talk about creating timestamps, periods, durations, and also formatting how we want our dates or our times to look.

So as you can see, there's an awful lot of information in this particular chapter, so let's go ahead. Now, why is date and time important? Well, in this world, that's all we have to live with. So in the development of applications, programmers often need to represent time and use it to perform calculations. We may need to know what the current date and time is. Well, the problem is the current date and time here is different than elsewhere, and so you can have that problem. And a date and/or time in the future or the past-- so if I want to say, what was the date 120 days ago, the API can do this for me really rapidly.

And we can also tell the difference between two dates, the difference between two times, and we can specify exactly what frame we're looking at-- seconds, minutes, hours, days, months, and years. We can also identify the date and time in another country or time zone, the correct time after daylight savings time is applied, how many days are in the month of February, for example, because obviously they are different sometimes, and a time duration-- so how many hours, minutes, and seconds did something elapse or a period where we can talk about how many days, months, or years have elapsed.

So with that, let's talk a little bit about what came prior to version 8. In the past, we would use either the date or we'd use the calendar or we'd use the time zone, or we could use the DateFormat class to be able to work with it. Now, it says that it does not support fluent API approach. Well, we've worked on a couple of chapters of lambda now, so we know what method chaining is like. Well, that is kind of the future of Java. And so when we're talking about a fluent API approach, we can chain methods together to identify minutes, hours, days, years, et cetera.

In this case, the date and time was mutable, and that doesn't work really well if we're working with lambda because we want to make sure that an instance is not going to change. The date and time was not thread-safe. We'll be talking about threading in the next several chapters. So we obviously want things to potentially be thread-safe, and it also meant that our calendar programs were basically weakly typed, so it was kind of a one-size-fits-all application. So lots of things up problematic with that. And so in the date and time API, the goals were that we wanted our classes and methods straightforward, the API should support a fluent API approach, instances should be immutable-- which is, of course, important when we're working with lambda-- and we also want to be able to use the ISO standards to define what a date, what a time is, and we wanted them to be thread-safe.

The API supports strong typing. And obviously if we have it strong-typed, then that means at design time, the compiler can tell us whether something is likely to work or not. And in the toString, we actually wanted it to be human-readable. So this also means that with an API, we can extend these classes to perform or work with customizable times and dates, as well. So now let's look at a number of different classes as we work through this. So for instance, the java.time package is where the API works. So there are two classes for working with local dates and times without a time zone. So there is the local date, which doesn't include time-- so year, month, day-- and the toString is going to output it in the ISO format-- so year, month, day.

The local time doesn't include date, so all you get is hours, minutes, seconds, and nanoseconds. And again, the toString is going to output it in what is pretty familiar syntax for us. So if I'm working with a local date-- so let's say LocalDate is a class that holds an event date, like a birth date, an anniversary, a meeting date, or so on-- the date is a label for a day, and so LocalDate uses the ISO calendar by default. It doesn't include a time, so it's portable across time zones. If you identify a date, it doesn't really matter what time zone you're talking about.

But with the LocalDate, there are methods that identify-- well, is this date in the past, in the future, is it part of a leap year, what day of the week is it, what day of the month is it from now, what is the date for next Tuesday? There are a number of methods that are part of the LocalDate so that you can pretty much get whatever information you want in relationship to that date. So as an example-- now, in this case, we are going to create a couple of these. So notice that I'm importing the LocalDate, but I'm also including some TemporalAdjusters so that I can work with the next. But I'm also statically importing days of the week, so if I want to identify a specific day, I don't have to say DayOfWeek dot something.

And so notice that in this case, the LocalDate.now-- I'm declaring a couple of LocalDates. And so for example, "now" is going to take the LocalDate class called the "now" method, and so we're going to see exactly what that is. Hold on a second. So when we are getting this out, I wanted to make sure that there actually is an example. And in the student notes, it shows the results of this. So let's talk about the code. Then we'll look at the output.

So when I print this out, notice that I'm saying "now" and then I'm toStringing the "now." As far as the birth date, notice that I can say LocalDate, but I'm going to use the "of" method. The "of" method allows me to pass in the year, the month, and the day-- this was Java's birthday, by the way-- and so we can create a date based on values that you may have as part of your program. So Java's birth date, and out it comes. Now, the cool thing is notice that with the birth date, I can say isBefore now. So if it's before now, I'm saying, well, is the birth date before today's date? Well in that case, that should be true. Was the birth date in a leap year? Well, it's '95, so the answer is no. But I can also say, well, what day of the week was it? So notice that I have very easy methods to work with.

If I want to say, well, what day is it a month from now, it is going to take into account leap years and the total days of the month, et cetera. And so the day of month from now is blah. And I can also say now.with and then say, well, next Tuesday. Well, what is the date of the next TUESDAY? Now if today is Tuesday, it's still going to give me next Tuesday's date. And so if we scroll down a little bit, the result of this is that when we save it, now it gives us in the ISO's format Java's birthday. Again, it outputs. But Java's birthday was in the past, it wasn't a leap year, and apparently Java was born on a Tuesday. A month from now, notice that in this case, it increments the month and next Tuesday's date. Since we didn't say, well, what is today's day of the week? We don't know, but according to this, if the 18th is a Tuesday, then this was a Wednesday or Thursday or whatever it was.

So you kind of get the idea that these methods are reasonably intuitive. All I have to do is hit a dot and select the method that gives me what it is that I want. Now, similar to the LocalDate is the LocalTime. The LocalTime stores the time within a day measured from midnight-- so midnight would be 00:00:00-- and it is based on a 24-hour clock, so every hour will go from 0 to 23. And then, of course, minutes will be from 0 to 59. But the nice thing is some answers that we might do, and we're going to in the example on the next slide, is when is my lunch time? Is the lunchtime in the future or the past? What time is it an hour and 15 minutes from now? Or how many minutes until lunch time? Sounds like somebody was hungry when they wrote this slide, right?

How many hours until bedtime? Or how do I keep track of just the hours and the minutes? So with that in the example, notice than I am declaring and importing a LocalTime. I'm also identifying that I want to be able to use the ChronoUnit enum to identify specifically what I mean. Do I want hours, minutes, seconds, nanoseconds et cetera? So earlier, we declared our local times. And of course, now also has a "now" method, giving me the current time. I can then say-- notice the fluid-- so here I can say, well, now plusHours, and then I can just as easily plusMinutes.

If I wanted to truncate-- so now just hours and minutes-- well I can say, let's truncatedTo MINUTES. So instead of showing or retaining seconds and nanoseconds, this particular one would not have that value. Or if I wanted to work with things, notice that I can print it out, I can divide it. I can also do an "of" just like we did with the date. So in this case, this would say, hey, my lunch is at 12:30, and so I can call, well, is lunch after now? Well, either it is or it is not. Or notice that I can also create a duration-- so how many minutes between now and lunch in minutes?

Also, I can constitute the LocalTime. Apparently we're going to bed at 9:00, so how many hours between now and bedtime, et cetera. So you can see that there are a number of things going on that are pretty intuitive to work with. And so if we look at the student notes, here notice that in this case, the time is hours, minutes, seconds, and nanoseconds. The truncated time, on the other hand, is just hours and minutes. That's what we said. We can identify how many minutes there are, and is lunch in my future-- apparently this was in the morning-- and minutes till lunch. We can get that duration. And we can also-- how many hours until bedtime.

So in one case, we were talking about we want to know minutes. In the other case, we're identifying that we want to know hours. So you can see that this can be very convenient to work with. So what would you think of a LocalDateTime? Well obviously, it's a combination of a LocalDate and a LocalTime, and again, this is useful for narrowing events. Now, the LocalDateTime does not take into account times zones, so we're talking year, month, day, hours, minutes, seconds, and nanoseconds-- that's it.

So when is my meeting, when does my flight start, when does the course start, if I move the meeting to Friday, what's the date-- those kind of things are what we can ask of a LocalDateTime as long as we don't have to take into consideration time zones. So in this case, notice that I'm identifying my Month enum and my ChronoUnit enum. But in this case, notice that I'm saying, all right, let's get a LocalDateTime as of March 21, 2014 at 1:30 in the afternoon. We can also use the "of" method to identify when our flight date and when our flight time is. Notice that I can constitute a LocalDateTime by using instances of LocalDate and LocalTime.

I can also, of course, pass in the value. We've seen that. But again, from a fluid standpoint, I could add specific numbers of days, specific number of hours. I don't have to do the calculations of how many seconds in a minute, how many seconds are in an hour, et cetera. I can just go ahead and identify exactly what I mean. I can also subtract LocalDateTimes from LocalDateTimes, and I can then identify, for example, what unit do I want? So in this case, if I am going to the course, how many days till the course ends? And so we can see that in the previous, we've got our date and we have our time units, and we can also identify a duration based on subtracting those out and then multiplying how many hours there are per.

Now, the local is pretty straightforward. Each one of these is talking about-- we are talking about a single place or a single point in time. Well, of course, time zones are geographic, but as you can tell by the colors here, they aren't necessarily based on longitude lines. So when a country and sometimes a state observes changes for daylight savings, it varies. For example, in Arizona in the United States, they don't do daylight savings time. So when the rest of the country changes, they don't. So they alter between Mountain Daylight and Standard Time and Pacific Standard Time constantly depending on what the rest of the country is doing, and that occurs in other locations, as well.

And so what we want to be able to do is identify and work with that seamlessly without really making that difficult. And so a lot of times, if we're talking about the United States, then the United States changes times on a certain date. For example, here they're talking about March 9, 2015, but basically you're looking at the second Sunday in March. And you lose an hour, so it immediately goes from 2:00 to 3:00, and there is never that hour. And then finally in the first Sunday in November, at least currently in the United States, it goes from 2:00 back to 1:00. So in essence, you are engaging in the 1:00 hour twice that particular day.

And so these time rules, of course, change depending on where you are, based on your offset, and based on the local government, and all of that is included as part of the underlying logic of the API. Now, time zones can be identified by a number of different factors. Usually, for example, you can identify either a geographic region or a specific country, and then you can either identify a specific city or the name of the time zone. So for instance, in the geographic area of Europe in the city of London, I would be able to identify a specific zone ID. By the same token, if I don't know this information, perhaps I know how many hours or however many hours and minutes is the offset. So in one case, for example, minus 5 would represent American New York, at least during Standard Time, anyway, while this would actually be five hours and 45 minutes in front of the Universal Time.

So for instance, if I wanted to work with a ZonedDateTime object, notice that it stores a LocalDateTime together with a ZoneID and a ZoneOffset. So for instance, if I wanted to create a ZoneID of America/New_York, a local date of March 23, 2014, and a local time of 9:30 in the morning, then I could create a LocalDateTime by passing in the date and time. I could create an instance of a ZonedDateTime by passing in all three elements. Now, if I want to be able to take care of the date and time but I don't want to maintain seconds and nanoseconds, for example, I could use the truncatedTo method to identify what I want to have happen to this zoned date and time.

And so a number of things that you can work with it, but when we print it out in the toString, notice that it automatically gives me the date, the time, the offset, and it will also identify what ZoneID is that, as well. So the space is added to make the fields more clear. Usually this is all run together as a final output.

So what about gaps and overlaps? You remember like I said, if you're talking about in the spring and you're moving daylight savings time, you lose an hour. So you never have, for example, a 2:30 on that Sunday. Well, what happens if you had a meeting scheduled on, let's say, the Saturday before daylight savings, and they reschedule it to the day after? Does it remember what time it is, or does it change it? Well, the cool thing is that, for example, if our meeting is at 4:00 in the afternoon and this is the date after when it changed, you'll notice that in this case, it's still at 4:00 local time, but the offset has changed. Kind of cool.

So again, it's built into the logic. So the local time's not changed, the offset is managed correctly. All you have to do is identify how many days you're adding. Now when you're looking with ZoneIDs, they have sets of rules that are a part of the Java Developer Kit. So as the programmer, you don't have to worry about these conversion rules. They are included in the JDK. So dates or times that land on time changes can be determined by using these rules. So again, we can work with that.

Now, the cool thing is that this happens often enough that you can actually find, was this a situation where there's a gap? In other words, did it go from 2:00 to 3:00 with no 2:30? Or is this an overlap where we go to 2:00, then we go back to 1:00, and where now we have a second 1:30 in the morning? Well, in that case, we can actually use the ZoneID to determine whether or not a gap occurred or an overlap occurred-- so kind of interesting.

Now of course, we can work across time zones. And so because of that, not only do we have our local time zone and we have our zoned time zone, but we also have our OffsetDateTime class. So useful for determining zoned date-times across different time zones. So if I have a meeting that is at the local time of, let's say June 13, 2014 at 12:30, and the zone associated with that is Los Angeles, and we create a zone time of that same meeting with that same one-- so in this case, the ZonedDateTime would be based on the meeting being in San Francisco. Now in an OffsetDateTime, notice that I could say toOffsetDateTime, if I then passed the OffsetDateTime here, notice that I could say, all right, in this case, we also have colleagues in London who need to join this call.

And so we can say, all right, here's our staffCallOffset, and we can then atZoneSameInstant London, and it's going to go ahead and give us the instance of what is the local date and time for the London office. So a number of different possibilities. And so in the printout, this staffCall Pacific time would be 1, the staffCall in the United Kingdom would be the same time, but different offsets.

So this slide just gives you an example of the different prefixes that are associated with different methods. We've seen, for example, "now" gives us the current system time, date, time zone, et cetera. With the "of," we can constitute a particular time, date, et cetera. We can also "get" parts of a particular target, so "get" minutes, "get" hours, "get" seconds, et cetera. With the "with," we can return a copy of it with one element changed. So in this case, we want to change the hour to 12. We've seen a number of examples of the "plus" where we can either add days, hours, minutes, months, et cetera, or we can use the "minus." And then we can also convert times into different parts of the day. So in this case, to second of the day is going to show what time is this is based on the number of seconds since midnight?

We can also identify an "at," so it combines this object with another, giving me a LocalDateTime, and "until" is going to calculate the time between different dates. We can also use the isBefore or isAfter to compare dates or times. And of course, the isLeapYear is checking to see, well, is this in a leap year? So again, a number of different dates and time methods that are available to every one of these classes we've talked about that make it much more intuitive to work with. So what if we want to work in our program and find out not just specific dates or work with dates and times-- what if we want to know right now? We want a specific instant in time on a timeline?

The nice thing about the Instant is that it's kind of like a timestamp. So in fact, many times we might want to do that where, for example in this code, I'm saying, give me the Instant now. And then I do something and then I say, well, give me the Instant now. And so notice that I could identify what was that time period or is one now before later? Obviously not. And it can give me exact knowledge of how long it took. So the Instant is a great way to present, for example, a stopwatch function.

Now, a Period is going to hold a date-based amount. So where Instants are more interested in nanoseconds, for example, a Period could constitute years, months, days. We're more interested in the duration of days, et cetera. And so for instance in this case, we might say, what is the difference between newYorkTime and newYorkTime plus oneDay/Year? Well, our oneDayYear-- so we're going to add one day. So in this case, notice that I have added a day. But because that day happened to occur over a time zone, notice that not only did it add the day, but it ensured that the offset was appropriate for that particular time zone. So it takes that into consideration, as well.

Now finally, if you want a Period but instead of worrying about date-based-- if you're more interested in a time-basis amount, then you can work with a duration. And so for example in this case, time is measured in actual second and nanoseconds, days are treated as 24 hours, daylight savings time in a duration is ignored. So for instance, if I take one day, I add another day, so I have "before" plus a day. Notice that here again, it shows that, but because this is a duration, it ignores any time zones or any daylight savings time. So the offset is the same, but it identifies the time based on the duration. So if I'm adding 24 hours, I'm literally adding 24 hours. So just because I missed between 2:00 and 3:00 in the morning doesn't mean that it's going to be missed in the duration.

So a number of different possibilities. Again, sometimes I want to know what is the difference between two dates. Well in that case, I could use a TemporalUnit. We saw earlier the ChronoUnit that allows us to identify exactly what is it that we're interested in. So are we interested in days? Are we interested in months, years, hours, minutes, seconds? We can use those ChronoUnits to provide this interface representing a unit of time. And so in this case, we can say, well, if this is today's date and this is Christmas, so this would represent my Period. So notice that I can then use that Period and see how many months and how many days until Christmas-- really pretty easy.

Now finally, not only is it easy to work with dates, times, time zones-- not only is it built in to offset these-- but there is also the DateTimeFormatter, which allows us to define exactly what we want. Now later, on we're going to see that we can localize based on the DateTimeFormatter, but in this case, we're just identifying, well, what do we want our date to look like? In this case, we're going to base it on the ISO standard.

But in this case, we're identifying, well, we want a string pattern. We can actually customize it. So we want to spell out our month. We want to have a two-digit day and we want a four-digit year. We want to identify the day of the week and we want the AD or BC as part of that. We can also identify exactly how many hours, how many minutes, how many seconds, and AM or PM standards are all going to be there. And the VV, as you can see, also identifies the time zone.

So what we're talking about is we can identify using the DateTimeFormatter. We can utilize different ways so that we can customize exactly how we want our dates and/or times to come out. Now, one of the last things we want to talk about is we wanted to make the API fluent so that when you look at it, it's much easier and much more apparent as to what you're looking at. So for instance, if I wanted to create a birthday-- so here's my birth date. I used the "of" to identify. Well, I could also just as easily say, let's use the year, atMonth JUNE, atDay 11, and that would do the same thing. So while this isn't as usable simply because in certain cultures the month and the days are flipped, this is much more obvious that this is the year, this is the month, this is the day.

Same thing with here-- you can schedule a meeting. You could spell it out, you could give the time, you could identify the zone. And so again, much easier to look at the code, see exactly what it is that you're working with. And so that brings us to the end of chapter 12. And we've looked at date- and time-based events and all kinds of other classes. So the only way to actually get good at this is to do some hands-on, so let's go to practice 12.

## 2. Practice 12-1: Working with Local Dates and Times - 36m

In practice 12.1, we want to work with local dates and time. And so if you open up the project and you open the LocalDatesAndTimes file, you'll see a bunch of comments in there that instructs you on what it is that you want to do.

So let's go ahead. And it says that if you consult the lectures and slides in the documentation if you get stuck. All right, well, let's try not to do that. But all right, let's say-- well, the first one should be the easiest one, right?

We want Abraham Lincoln's birthday. We're not talking about time zones here. And so it sounds like in this case, we want a local date. And we could call the local date abeBorn. And so let's say-- how might I do that?

Well, I could say, Year.of, right? And in this case, 1809. And then what? Well, we can do an atMonth. And in this case, we can spell it out. So FEBRUARY.

And we said atDay we can do, right? So at this point, the date would be 12. And that would be my LocalDate. Not being used yet, but we'll do the same thing. I'll put abeDied. Close enough.

Year.of and we can say 1855. atMonth. [? That wasn't it. ?] And atDay. And 15.

All right, so at this point, we have two local dates. So how old was he when he died? Well, we talked about how we could work that out. So let's print that out and say Abe was let's see, was, let's see, when he died.

So what do we need to be able to determine that? Well, we can use the first one. We can use an until. And then we can identify, well, the date that he died. But in this case, we want to know the temporal unit.

So we have already got an ins-- we already have a import there. So in this case, we can say we only want years. And so that should give us the number of years when he died. How many days did he live?

OK well that should give us the same thing. So let's just go ahead and copy this. And in this case, we will go with days. Now notice that there was decades as well. So DAYS when he died.

All right. So it looks like we've tackled the first scenario. What's the second scenario? Well, the second scenario is that Benedict Cumberbatch was born July 19, 1976. Well, if you don't know Benedict Cumberbatch, he makes an excellent Smaug.

So in this case, we're going to call him Smaug. And let's see, so in this case, he wasn't quite born in the 18th century or the 19th century. But we now have a date.

So was he born in a leap year? Well, that's a good question. So I suppose we want to output whether or not he was.

So in this case, we can use the LocalDate and we can determine whether or not it's a leap year. How many days in the year he was born? OK, well that sounds interesting.

And so we'll get once again, we can use the LocalDate. And let's see, see if there's any method here that meets us. Well, looks like we have lengthOfYear. And in the case of lengthOfYear, if we look at it, it returns an integer. And, specifically, it returns the number of days in that. So that looks like that would work.

How many decades old is he? Well, looks like we need to have a current date in order to work with that. So let's do a LocalDate.now and so we can use the LocalDate.now method to figure that one out. And so how many decades old is he?

So how can we do that?

[HUMMING]

All right, so that sounds like we would use the this one. So until(now, but instead of days, it sounds like we want to use decades. All right, so that prints that out. Good.

And what was the day of the week on his 21st birthday?

[LAUGHS]

Hmm, all right, well, that should be interesting. So let's get the formatting first and I'll think about that while I type.

[HUMMING]

All right, so at this point, I need to add something. So we decided that that was the plus. We want to add years. So let's add 21 years. So now that we have that, then we can retrieve something. And we want day of the week. I believe that's what it asked us. So that looks like that is scenario two.

Now since I usually don't go too far before I test this, let's make sure that we're getting what we thought we were. So 46 when he died, was so many days-- it would've been nice if I would have put in a comma there. So that's good.

Let's see, true, Benedict was born in a leap year. All right. Days in the year Benedict was born, 366. Currently three decades old. And apparently, it was Saturday on his 21st birthday. How convenient.

All right, so next scenario is that we want a train departs Boston at 1:45, arrives New York at 7:25. So it sounds like we need to create two LocalTimes. So let's see, we can call one depart. Yeah, that's not what I meant.

And let's see, I want of. And it says what time is it that we are doing? So 1:45, so that would be 13:45. We have a LocalTime arrive of 19:25. All right, so that's good enough.

So according to this, how many minutes long is the train ride? So let's see. So figuring that out would be--

[HUMMING]

We want then arrive. And we want minutes. Now notice that there are quite a few possibilities there. So we want to choose the minutes. So that should be the scheduled. And if the train was delayed one hour, 19 minutes, what is the actual arrival time?

So we said one hour and 19 minutes. OK, I think that takes care of the arrival time. So that would be scenario three. Looks like we have quite a few yet to go. So let's see what we have.

All right, so we have a flight from Boston to Miami which leaves at a certain time and date. And we have a flight time. So how do we want to look at that? Well, in this case, we can't use just the date. We need a time.

And so again we're going to, let's see, lvBoston. And so we want that to be-- this could be interesting.

[HUMMING]

atMonth, how convenient. atDay. atTime. And that would be what? 21:15. And we want a LocalDateTime to arMiami.

So we'll add four hours and 15 minutes. So when does it arrive in Miami is a good question. So in this case, the flight is scheduled to arrive in Miami at-- and when does it arrive if the flight is delayed four hours and 27 minutes?

Strangely enough, that seems to be many people's lots nowaday. So the delayed arrival time was-- So that's convenient. All right so I think we've got that nailed down. Let's run it one time just to make sure.

So looks like so far we're good. And we've got our planned train ride, delayed arrival time at 8:44. We have our scheduled arrival at 1:30. Instead, it's at 5:57. Looks like good piece of information.

All right, so let's go ahead and tackle the last couple of scenarios here. So if a school semester starts the second Tuesday of September of this year, so it's the TemporalAdjusters class that we're going to look at. And so what is the date that school starts?

[LAUGHS]

Let's see, school summer vacation starts [? January ?] 25th. All right, so school starts the second Tuesday of September of this year. All right, so the first thing we're interested in is the date only. So we'll call it schoolStarts.

Now we don't know exactly what the first Tuesday is. So we'll get a date, the 1st of September. And then we want a TemporalAdjuster. Specifically, the FirstInMonth. And specifically TUESDAY.

All right, so starts the second Tuesday of September. So this would give me my first Tuesday. With. All right, let's try this again. With. And we'll put in another TemporalAdjuster.

[HUMMING]

Go with next. And once again, we're going to choose TUESDAY. All right, so we chose the first of September. Said, well, give me the first Tuesday. Then give me the next Tuesday. That should give me the first day of the week. So what else do we have?

How many school days are there?

[LAUGHS]

OK, now this takes a lot of assumptions. So we're going to assume two weeks off on vacation. Two other vacation weeks. School is taught Monday through Friday. So we want to keep track of the short weeks also.

OK, that sounds fun. Let's figure it out. All right, so we figured out that when school starts. So I'll put that first. School starts on that day. If we want to figure out when school ends--

[HUMMING]

So do we know? 2016.

[HUMMING]

So when does school end, does it say? Apparently not. So I guess we're going to have to assume when school ends. So let's say that it ends on the 30th. Oh, vacation starts on June 25. OK, so it does tell us.

All right, so if that's the date that school ends, we want to be able to determine how many days between those two dates without weekends, without four additional weeks. All right, so in this case, it'd probably make sense for us to count the number of weeks.

We don't want local. We want an actual primitive. So we'll start with zero. And we'll set it. So we know that it starts on Tuesday the first week. So we need to see when it ends.

[HUMMING]

So if it's not a Monday which would give us a [? full ?] week, then we need to adjust. So lastWeek, previous(Monday), yup.

So the number of weeks would be the lastWeekStart. And until(schoolEnds). All right, until(schoolEnds), what doesn't it like?

All right so the (schoolStarts) would be previous(MONDAY). until(schoolEnds) should give me-- ah.

So I need a way to keep that so that the number of days-- that's what I want. Yes, that can't, but that can. And we want one additional.

And we also said, let's see, all right, so they're giving us the excluded weeks. So that would be five weeks. If we do this, then this would decrement that.

All right, so now I have the number of days of the last week. So now all I have to do is find the number of weeks between the two, multiply that times 5-- oh, number of weeks. Then subtract out the excluded weeks. And that should give me how many school days there are. So with that, let's see what we got.

So if we say, schoolStarts.until(schoolEnds) let me add WEEKS. Minus the ones we've already excluded. OK but then I have to multiply that times 5. I still need that.

All right, so far, so good. And then I need to add the first week and last week. All right, so that looks good. And so then I should be able to figure out from there how many there are.

So, all right. OK, I'm interested to see if that one worked. So let's see. All right, apparently there's 185 days. So that sounds about right for a school year. So sounds good. So I'll count that a success.

But it looks like we have a single scenario yet to go. Hopefully it's a short one. A meeting is scheduled for 1:30 PM next Tuesday. If today is Tuesday, assume it is today.

[LAUGHS]

What is the time of the week's meeting? All right, let me think about that for a second. All right, so we've got date and time. So we're going to have to have both. All right so we're going to have to have one of those. So when is the meeting time?

You know, it'd probably be easier to create this if I were to create them separately. So first of all, the time's the easy one. So let's talk about meetingTime.

So we're going to go 13.30 and go with the date. So what is now? And then I need next Tuesday unless it's today. How convenient, nextOrSame.

So we'll go with nextOrSame(TUESDAY) if today is Tuesday. And now all I have to do is combine them together for a LocalDateTime. And so we have meeting-- let's see, meeting-- which one goes first? meetingDate. And meetingTime.

And I think that will do. So let's see what we have. All right, so based on if we look in the detailed section, or if we look at the summary section, Abe was 46, that's true. 16,863 is true. True. 366, three decades, 21st.

[HUMMING]

Well, it was a Saturday, that looks good. 340 minutes, 2044, looks like we've got the right time for Miami and Boston. We got school starts. Of course we have a different year, but we have 185 days which is roughly the same.

And according to this, it was-- and I misformatted that, but simple enough. So it looks like we have got the right running solution. So that completes exercise 12.1.

## 3. Practice 12-2: Working with Dates and Times Across Time Zones - 23m

In practice 12-2, we are going to work with dates and times across time zones. So we're going to calculate dates and times. And so, we're going to open up our project. We are going work with the Depart Arrive Java file.

And it just says to read through the comments. These indicate what code you need to write to answer the questions provided. If necessary, if you get stuck, go to the lecture slides or the documentation. And when you're complete, the output should look something like that.

All right, well, all right, in that case, let's go ahead and see what the comments have to say. So it looks like we have one, two, three, four different scenarios. So using the following information use America, New York as the time zone for Boston, America, Los Angeles for the time zone for SFO, and the Asia, Calcutta as the time zone for Bangalore's Bengaluru International Airport. Well, since that is the time zones for those, I would assume that that's what I would do.

All right, so how can we do this? Well, the first thing we knew is that we want a zone ID. So we will call Boston BOS. And so, we're going to do a zone ID of-- and any one of these. We'll take that one.

And it says we're going to use America/New York. So that looks good. We're going to do the same thing here. Zone ID for SFO, and we said America/Los Angeles. And BLR and Asia Calcutta. All right, so it looks like that should be correct.

So what else are we going to do? Says here that flight 123 San Francisco to Boston leaves SFO at 10:30 PM on June 13, 2014. The flight is five hours and 30 minutes long. So it sounds like, at this point, we need to have a-- it looks like we're going to be using zoned departures. So let's see what we can do there.

Zoned, Date Time, and departs, let's go with departing SFO. We don't want now. We can have a local date time, or a local date, or we can pass in everything, or anything else. I like that one, so let's go with it.

Let's go with 2014. It's says June. Day of month would be 13. Hour looks like 22. Minute would be 30. And we're going to assume-- and at that point, that would be SFO would be the time zone. And it looks like, in this case, it wants a number rather than a month.

All right, so if we have that and we say that the flight is-- so what is the local time in Boston when the flight takes off? So we could say-- are we going to output this? OK, and what is the local time when we take off in Boston. Yeah, that'll work.

And we need an offset time, don't we? That sounds right, offset date time. And at zone instance we don't want BLR. We actually want Boston.

All right, so at this point, we know when it leaves SFO. We know when it leaves Boston. So what is the local time at Boston Logan Airport when the flight arrives?

So in that case, we want to see-- well, let's see the local time in Boston. So the local time at BOS when flight 123 arrives. So we want to depart. And then we want to plus how many hours? And it takes five hours. Plus minutes, and how many minutes? 30. But let's see, we want it in Boston time. So we'll do that.

All right, so, so far it looks good. So we add the five hours 30 minutes, plus we add the offset. That should give us the local time in Boston.

And what it is the local time in San Francisco when the flight arrives? Well, that's a little easier because in that case, we can pretty much just count this.

All right, I think we've tackled that set since it was 5 and a half hours. We have that.

So if we want San Francisco to Bangalore, we can do very similar things. So in this case, we want to create zoned date time, which we are going to call-- so the flight time is-- so will the traveler make a meeting in Bangalore Monday at 9:00 AM PM time?

So let's see what we've got. So flight 456 leaves SFO at-- so we can look at this and we can figure out what the time is of that. Well, I guess it depends on what time it is-- let's see, that was Saturday, Sunday, Monday. So that would be 2014, 6:30, 9:00 AM. So nine, zero, zero, zero.

So I guess the question is, is it going to make the arrival time of Bangalore? Now actually, we just want to add stuff. So if we are going to depart from Bangalore, and we're going to add 24 hours. So we're going to add 22 hours, no minutes. But we also do want an offset. So we had talked about that. And at the zone, same instance. And we do want Bangalore this time. So that would give us the arrival time.

And so we can determine if the local time is there. So that looks good.

All right, can the traveler call her husband at a reasonable time when she arrives? Not quite sure what the definition of reasonable is, but we can at least calculate what the time is in San Francisco. So if we identify-- so again, we can arrive in Bangalore. Offset the time. Yeah, that's the one. We can identify what time that is. And I guess we can determine, at that point, whether or not it makes sense to call.

All right, so that looks good. And since we've been working for a while, let's just make sure that it makes sense what we're looking at. So flight 123 leaves SFO at-- so that looks good. Local time Boston at departure is 2014. That looks right. OK, arrives at-- that looks right. And the local time, that looks right as well. Excellent.

Leaves at 7:00, yes. Gets at plus 5:30, OK, perfect. And what else do we have? Flight time of 22 hours, so it arrives in Bangalore at 5:30, which is correct, which is also 20:30 in Los Angeles. All right, so that would be a reasonable time.

So it looks so far that we are doing well. So let's handle the last scenario and we'll call it a good day.

So in this case, flight 123 San Francisco to Boston leaves at 10:30 on November 1, flight time five hours and a half. What day and time does the flight arrive in Boston?

So we've already done something like this. So let's go ahead and-- always helps if we choose the right one. So we want a zoned date time that is going to-- so that's the departure time in San Francisco.

So a couple of things we could do. We could either manipulate-- a couple of things we can do to manipulate. So they want local time at Boston. All right, so that gives us the Boston time.

And let's see, so when does it arrive in Boston? So that gives us our Boston time and local time SFO. It's a heck of a lot easier if we just paste it.

All right, so what date and time does the flight arrive in Boston we did. Well, what happened? Since November 1 is a Saturday and it goes over a leap year, I'm going to assume that there's going to be a gap that's going to go on there.

But let's go ahead and run it and see what our results are. So departed local time minus 7 and minus 4, so 22:30. And this would be 1:30 in the morning. It arrives at 6:00 in the morning. But the offset has changed. And it arrives 3 o'clock in the morning. Again, the offset has changed because of the leap year.

All right, because of that, looks like we have gotten a solution to practice 12-2. And that successfully completes this one.

## 4. Practice 12-3: Formatting Dates - 7m

In practice 12-3, we're going to format some dates. So according to this, we're going to open up the Project, open up the Time Between Java file, and we want to modify the class to read a string from the console and correctly identify the delta between today and the entry date in years, months and days. Use the appropriate method to ensure that the values of the year, month, and days are always positive. The output should look like this.

All right. So let's see what we've got in the slides. So we're going to print out enter a date. And according to this, there should have been more to that. So let's make sure that if we are going to do that, we should at least have it exactly the way they have.

So if we enter a date, the date's going to be entered. We're going to read that line. And then, we want to do what? Well, it looks like we're going to create a couple of things. So first of all, we're going to create a formatter. So we want to be able to read it in that way. So we're going to create something called a date format, and that will be-- And we're also going to create a local date, which is currently not going to have a value.

So once we have this, we're going to parse it. And that's where we're going to put it here. So a date is going to get a value from what I just read, and that would mean that I would need to have a local date. Have a local date and parse it. And we're going to pass in the date format that we did before. So that sounds good.

But this is still not-- because we don't have a formatter yet. So create the formatter. We'll do that here. So date, time, time. Thought so. All right, I want a date time formatter called-- let's just call it f. Date time formatter, and we want to pass in that pattern. So now, we have a pattern. All right. So now we have a pattern, and now we're good. And now, we're going to parse using the formatter. So in this case, that would be actually f.

What doesn't it like? What is the date entered? Ah. There we go. Better. All right, so we're going to take the date entered, format it appropriately as a date. And now, it's just telling us to print it out. So all right, we can print out date entered was-- so that should be a date. Right? And at this point, we need to be able to calculate the years, months, and days between now and the date entered. So we're going to get now here. And so go ahead and do that.

Now, since we're talking about days, we'll talk about a period. Make sure that the date isn't before now. Then we will look at-- we'll populate between by saying period.between. Let's see. If a is before now, then we want that. And then, we want now.

On the other hand, if it's the other way around, they want it the other way. So that will tell us what the years are. So we need to know what the years are. And that should be a matter of getting to the between. And get years, and between, get days. And then we can pass the years, months and days into our print, and it should give us a good thing.

So let's print. Let's work it. All right. So if we have a date call, let's call it April 14, 1959. All right. So it formatted it to a date. So 55 years, 10 months, 25 days between now and the date entered. All right. Looks like that's exactly what we were supposed to get. Not sure what the date is, but there we go. So we have successfully completed practice 12-3.

## 5. Skill Check: Using the Java Date/Time API - Score 80% or higher to pass

Skill Check: Using the Java Date/Time API

View Skill Check
