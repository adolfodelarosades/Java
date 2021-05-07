# 8: Use Java SE 8 Date/Time API

1. Use Java SE 8 Date/Time API - 8m

## 1. Use Java SE 8 Date/Time API - 8m

Section 7-- Using Java SE Date/Time API.

Question-- given a date, how did you get the day of the week?

Answer-- you could get the day of the week by calling the method Get Day of Week. In this code excerpt, we show two ways of how to create a local date object. You could basically use Local Date Of and specify as arguments the year, the month, and the day. Or we could use the parse method and specify the date as a standard string.

Question-- given a date, how do you get the first Saturday after the date?

Answer-- first create a temporal adjuster. And temporal adjusters is a series of convenience methods that allow you to do these kind operations. So we use the method Next, and as its argument a day of the week-- Saturday. Then we call the method with a date method, Date Object we created previously. And that's basically it.

Question-- how do you get the number of days in February in a given year? In this case, we just call the method Length of Month. So in the code excerpt-- you've seen this before-- we create a date object. Then we create a year/month object based on this date object.

Question-- given a year, how do you determine if the following year is a leap year, and the year after that? So in this code excerpt, we show two ways to do this. The first one, we call the method IsValidYear. So we create a year that is based on a month/day. So we create a month/day of February 29, and we see if that is valid. Second way is much simpler. We just call the method IsLeap.

Question-- how do you customize the output of a date/time object?

Answer-- we use a date/time formatter. So we input as an argument a series of letters that describe or a string that describes how we want our date/time or local date/time object to look like. And if we check into Java API, it will explain to you the proper symbols to use to do this.

Question-- how do you add a time zone to a date/time object?

Answer-- we create a zoned date/time object based on a date/time object. And in this case, the second argument is zone ID of the time zone we want. In this case, it's using the Eastern time zone in Canada.

Question-- what's the difference between OffsetDateTime and ZonedDateTime?

Answer-- ZonedDateTime is created with ZoneId, while OffsetDateTime is created with ZoneOffset. Only ZoneId uses ZoneRules, which defines how particular time zones treat zone offsets, such as daylight savings time. The following code calculates the time difference between two time zones-- Kolkata and Eastern Time-- for two dates-- one in the fall and one in the summer. It does this twice-- once with ZonedDateTime and the other with OffsetDateTime.

Note, when you add a time zone to a ZonedDateTime using the string that represents a time zone, and when you add the time zone to an OffsetDateTime, you're specifying the offset from Coordinated Universal Time, or UTC. So we look at the output of this code. In the first two outputs, d1 and d2, it's using ZonedDateTime. And when it calculates a time difference between these two time zones, it takes into account daylight savings time. That's why there's an hour difference between the two times. And Kolkata does not observe daylight savings time. If you look at d3 and d4, it does not take into account daylight savings time.

Question-- how do you create a timestamp? You use an instant, and you call the method now. The the instant class represents the start of a nanosecond on the timeline. A value returned from the instant class counts time beginning from the first second of January 1, 1970-- which is also called an epoch.

Question-- how do you format a timestamp?

Answer-- to add an hour to an instant, you first create a duration that represents the number of hours you want to add. Then you create another instant, and you call the method plus with the duration instant that represents the hour. To add an hours or date/time value, you just call the method PlusHours, with an argument that represents the number of hours want to add-- in this case, one.

Question-- how do you calculate the amount of time between two date/time values?

Answer-- you just call the Period Between Method.

So here is a summary of the Java SE Date/Time API. We looked at date classes-- LocalDate, YearMonth, MonthDay, and Year; time zone and offset classes-- ZoneId, ZoneOffset; date/time classes that work with time zones-- ZonedDateTime and OffsetDateTime; parsing with the parse(CharSequence) method; formatting with the format(DateTimeFormatter) method; the TemporalAdjusters class; the instant class; and period and duration classes-- Duration and Period.
