## 02. Object-Oriented Programming	- Practical Object-Oriented Concepts: Part 1

DESCRIPTION

Practical Object-Oriented Concepts: Part 1

BENEFITS TO YOU

Practical Object-Oriented Concepts: Part 1

## 01. Practical Object-Oriented Concepts Part 1 New 8m

Welcome to Practical Object-Oriented Concepts Part 1. My name is Joe Greenwald. I'm a Learning Solutions Architect, Curriculum Developer, and Senior Instructor with Oracle University. I've been teaching and consulting for Oracle since 1992. I've been using object-oriented software since the late 1980s, starting with Borland's Turbo Pascal and Delphi, and then moving on to Smalltalk, C++, Java, and C Sharp, amongst others.

I wrote these materials over many years, trying to simplify and distill the essence of what is object-oriented software development. I hope you enjoy watching this presentation as much as I did in writing it and recording it. In this presentation, I will define what is an object, a class, an attribute, a method, and a message, and how they're used in object-oriented programming. I'll also talk about what it means to create an object-oriented application and the benefits, advantages, of object orientation itself.

I think it's both interesting and helpful to understand why object-oriented programming was developed, what problems it tries to solve, and why does it look the way it does. So let's get in our wayback machine and go all the way back to the late '60s and early '70s and look at the computing environment at that time. At that time, software was basically monolithic. It was mainframe code typically using punch cards or tape. Terminals were just becoming popular at the time.

COBOL, common business-oriented language, was there for the business folk to write business applications. FORTRAN, formula translation, was available and used by scientists and mathematicians, and assembler was used by the true computer geeks. Languages like Pascal and C, whose syntax are derived from the parent language ALGOL, were gaining in popularity.

Pascal, named for the mathematician Blaise Pascal, was created by Niklaus Wirth and remains one of the best languages to teach beginning programming. C was also becoming popular because it was small, compact, fast, essentially a verbose assembler-type language, and it was used to write the Unix operating system. There was very little programming discipline or structure at the time.

Goto-less programming, structured programming, modular programming, procedural programming-- those sorts of things were years off for mainstream coders. Mostly it was seat-of-the-pants coding. You'd start writing some code and hope it works and then add to it. Also, writing the entire program at once and then going back to test it little by little was popular, as well, if more frustrating and time-consuming.

In the early 1970s, computer pioneers at the Xerox Palo Alto Research Center, called Xerox PARC, were developing a single-use computer with a graphical user interface. This was a computer that can be used by a single person at a time. It was dedicated to that one person. The person had their own dedicated computer, CPU, memory, storage, monitor, and input devices like keyboards and mice.

While mainframe users did share the computing resources with others, the sharing could be transparent when things went well, or in some cases not so transparent. For example, when the mainframe went down and crashed or was unavailable, it went down for everyone. Even years later, I remember my mentor at the time bragging about a new mainframe operating system that he was using that was like a virtual operating system, where it made it look like each user had their own disk, storage, memory, and CPU. And I said, "You mean like my PC?" at the time.

However, back at Xerox PARC, they were developing and using this amazing, for the time, new box. One was called the Star and the other was called the Altos-- what was effectively the first personal computers with a graphical user interface and a mouse-- and they wanted to move away from the monolithic, text-based development mechanisms of the time and create a more flexible environment. They wanted this development, environment, and language to be more suited to a graphical user interface-based personal computer. Remember, this is many years before Macintosh came out.

One of their lead pioneers, Alan Kay, proposed the idea of individual entities or cells communicating with each other using a very simple syntax and passing messages to each other to make the entity cells do things. This development system, called Smalltalk, was a huge departure from the current mainframe programming systems at the time. It was designed to be simple and easy.

For example, Alan Kay was challenged to write the entire syntax of the Smalltalk language on a 3-inch by 5-inch card, and he was pretty much able to do that. And it should be easy enough for kids to use. Indeed, the first versions were tested with local high students in and around Palo Alto.

Years later, in the early '90s, I actually met one of these "Alan Kay's kids," as they were called. I was working in Silicon Valley and working with Smalltalk, and he was at a Smalltalk library for graphical interfaces that I had purchased, and I got to meet him and work with him and talk with him. I heard some amazing stories from him working with PARC and Alan Kay at the time. He'd started programming in Smalltalk at about the age of 13 and he was something like 26 when I met him. So imagine working in something like Smalltalk at that age and for the next 13 or 14 or 15 years. I learned a lot from him.

Alan Kay took as inspiration aspects of the earlier simulation language called Simula and extended it to the idea that everything was an object and all computation would be done by passing messages. Alan Kay took as an inspiration aspects from the earlier simulation language called Simula and extended it to the idea that everything was an object and all computation was done by passing messages. We'll talk more about these ideas later on.

One interesting note-- Alan Kay developed the idea for what he called a Dynabook back in the mid-'70s, which would look very much today like our iPads and tablets that we use. And he developed this as a way to bring new ways of thinking to human civilzation and amplify human reach. He also worked on a free, open source version of Smalltalk, which you can obtain today, called Squeak. You can find it at S-Q-U-E-A-K.org, squeak.org. I highly recommend trying it out and seeing what Smalltalk looks like. For myself, learning Smalltalk made be a much better object-oriented programmer, just as learning assembler made me a much better overall programmer.

So Alan Kay's Vision, his idea was that he thought of objects being like biological cells or individual computers on a network only able to communicate with messages. Think today of things like web services, SOAP or REST web services. So his idea of messaging, passing messages from one object to another, came at the very beginning. It took him a while to see how to do messaging in a programming language efficiently enough to be useful.

Now, if we see here, we see a common representation of an object. The internal state of the object, the data that represents the state of the object, is hidden and encapsulated and cannot be directly manipulated by other objects. One object sends a message to another object to make it do something. Then another object can send a message, and you get this message passing going back and forth. Initially, of course, these object systems were all in one memory space within a computer, but it easily extended out to multiple different memory spaces across different machines, very similar to what we have in terms of web services today.


## 02. Using Object Orientation New 11m
## 03. Procedural Versus OO New 15m
