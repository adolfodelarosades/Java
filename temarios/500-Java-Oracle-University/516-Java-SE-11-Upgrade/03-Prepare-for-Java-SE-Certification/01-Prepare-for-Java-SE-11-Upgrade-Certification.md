# 01 Prepare for Java SE 11 Upgrade Certification

1. Prepare for Java SE 11 Upgrade Certification - New - 14m
2. Prepare for an Exam - New - 14m
3. How to Approach Questions - New - 11m

## 1. Prepare for Java SE 11 Upgrade Certification - New - 14m

Hello, everyone, and welcome to this collection, which is designed to help prepare you for the Java SE 11 certification. This video provides an overview of the exam. We'll discuss the benefits of certification, general information regarding the exam, who the target audience is, who would be a good candidate for taking these exams, and prerequisites, the type of background and experience that would be helpful when approaching the certification exams. Finally, we'll examine exam topics.

Let's start the discussion on the benefits of certification with a universal truth. There is a shortage of good developers. Now, what does this mean for companies? What does it mean for developers?

For companies, they need people who know how to program to drive innovation. Luckily, there is this group of people known as developers who love solving technical challenges. Because there is an abundance of work and a shortage of talent, companies want people to be able to get lots of work done with little supervision. Because the resources that would go into providing that supervision-- if you have developers who are self-sufficient, you can reallocate those resources to hiring more developers, achieving more innovations, and pushing the company farther.

And as developers, since we love solving technical problems so much, we are vulnerable to being overworked. Because the talent is rare, companies are willing to pay well. And, of course, people like being paid. Ideally, companies would be able to recognize and reward this good work, and as developers, we certainly welcome raises, promotions, any kind of recognition like that.

Excluding tough times, there may, unfortunately, be cases where a company feels a developer's work is slow, messy, or buggy, or that their skills or product they're working on are obsolete. Layoffs are a way of redeploying funding to something a company finds more exciting. But this stresses the need to keep skills up-to-date as a developer to remain competitive.

How do companies and developers get what they're looking for? For companies, there is a question of how do you find talent to hire? For developers, you want to show that you are skilled and worth hiring. It's good for companies to uncover top talent within their own ranks. And as a developer, how do we show that we can stand out from others?

Companies should be willing to nurture existing talent and encourage career development. As developers, we may wonder, how do we keep our skills up to date? Companies wonder how they'll prepare for the future, and developers may wonder how can they show they're capable of handling new challenges and responsibilities, both as a matter of personal career growth and as a way of showing that they're capable of leading a company into the future?

Let's actually play out this matchmaking exercise. You are a conglomerate whose products span every sector. You need a strong Java developer to implement connectivity between all your products. Do you hire Developer A, who has 5 years of experience at Deutsche Bank; Developer B, 5 years experience at Bavarian Motor Works, BMW; or Developer C, 5 years experience at SAP. Hit the pause button, take a minute to decide.

Now, this may be a tough distinction. Why? Because we have 5 years experience, the same number, at all three locations. We have a diverse pool of equally complex and reputable industries-- fintech, automotive, and enterprise. And they are even all German companies. But what if we said that developer B is a certified Java developer? Well then, now the choice becomes obvious.

What is an Oracle Certified Professional? Earning an OCP status is an endorsement of your expertise, understanding, and experience. It's backed by the authority of the language's author. I hope this can be you, too, and that you'll find this series useful.

How exactly is this expertise measured? This is done using multiple choice questions on key topics. Questions like this. You'll find questions sprinkled throughout this series.

Why? People learn by doing, and the doing we want to become better at is tackling certification questions. So a great way to prepare is by working through certification-style questions. Take a minute to read through this question, hit the pause button, and we'll discuss afterwards.

An exam question may start by giving some sample code. We call this the stem. This question gives a sample for loop and asks for an equivalent. This code prints all odd numbers until 5-- 1, 3, 5.

There are four options-- A, B, C, D. One of these is correct. Three are distractors. There should be good reason why a distractor is wrong, but they also should be just wrong enough to be plausible. We'll need to analyze each answer to see what we can rule out. You'll often find that the validity of each option relies on some key fact or a concept about the language that you need to recognize.

Let's look at A. This removes the post-increment from the for loop declaration. The for loop declaration is still valid, but it also tries both pre-increment and post-increment from the print statement. The key thing to remember is that this isn't allowed. But let's say we don't remember this fact. Are there any other answers that are more plausible?

B-- this removes the condition for the loop to continue from the for loop declaration. Instead, it tries to encode looping with an if statement. This option wants you to believe that the if statement is set up so that if i is less than 5, it will continue looping.

But this isn't how the continue statement works. A continue means stop the current loop and start the next. For numbers less than 5, the loop restarts before the print statement has a chance to be called. Then, looping occurs infinitely, printing all numbers 5 and greater. This answer can't be correct.

C-- this tries converting the for loop into a while loop. That's OK. This may still be valid. We have all the components from the for loop-- declaring the loop counter variable i, asking the loop to continue while the condition i is less than 5 is true, and incrementing the counter.

The important difference is that incrementing the counter occurs at the end of the for loop, but option C does it at the beginning. This is wrong. The code prints 2, 4, and 6 instead of 1, 3, and 5.

D-- this is similar to C, except now the counter is incremented at the end of the loop. It's pre-incremented instead of post-incremented, but this doesn't matter. In this case, the result is the same. D is the correct answer.

The psychology of that question is applicable to all Java SE certification exams, but the topics of understanding control flow specifically aren't found on the upgrade exam. We'll discuss topics soon, but in short, the upgrade OCP Java 6, 7, and 8 to Java SE 11 certification and associated 817 exam is meant to test your understanding of significant feature enhancements between Java SE 11 and earlier versions.

The target audience would, therefore, be existing certified Java SE 6, 7, or 8 developers. The exam is offered from Oracle University and delivered via Pearson VUE. The duration is 180 minutes. There are 80 questions, and a passing score of 61%. Percent

Who is this exam intended for? Java developers QA and support engineers, system integrators, system administrators, data scientists and engineers. This is just a short list of the background of candidates who may find the exam helpful.

Things to do before taking this exam. The obvious prerequisite is that you're currently an Oracle Certified Professional in Java SE 6, 7, or 8. It's recommended that you complete this course on exam preparation and work your way through the mock exam questions, consult other Oracle University resources on new features, and continue acquiring industry experience beyond the 12 to 24 months that led to your initial certification.

The topics you'll need to study largely depend on which version of Java you're coming from. Here are the exam topics you should expect to see. The biggest chunk added from Java SE 9 has to do with modularity. For understanding modules, you should be able to describe the modular JDK, describe modules and enable access between modules, and describe how a modular project is compiled and run.

Migration to a modular application-- you should know how to migrate an application that was developed in a Java version prior to SE 9 to SE 11, including through top-down and bottom-up migration, splitting a Java SE 8 application into modules for migration, use jdeps to determine dependencies and identify ways to address cyclic dependencies.

For services in a modular application, describe the components of services, including directives and design a service type load services using service loader. Check for dependencies of the services, including consumer and provider modules.

Local variable type inference-- the use of local variable type inference originally came in Java SE 10, then as of Java SE 11 you gain the ability to also use this within the context of lambda expressions. Java interfaces-- as of Java SE 8, you gain the ability to implement methods within interfaces. This includes default, static, and private methods. You should understand how to create and use these methods and define and write functional interfaces.

For lambda expressions, understand how to create and use lambda expressions; use lambda expressions and method reference; use built in functional interfaces, including predicate consumer function and supplier; and use primitive and binary variations of base interfaces from the java.util.function package.

For lambda operations on streams, extract stream data using map, peek, and flat map methods; search stream data using findFirst, findAny, anyMatch, allMatch, and noneMatch methods; use the Optional class; perform calculations using count, max, minute, average, and sum stream operations; sort a collection using lambda expressions; and use Collectors with streams including, the groupingBy add partitioningBy operation.

Parallel streams-- develop the code that uses parallel streams and implement decomposition and reduction with those streams. Lambdas and streams were the big addition for Java SE 8.

For Java Se 7 topics, understand NIO.2. Use the path interface to operate on a file and directory paths; use the Files class to check, delete, copy, or remove a file or directory; and use a Stream API on files.

And finally, language enhancements. Use the try-with-a-resources construct and develop code that handles multiple exception types in a single catch block.

And also worth mentioning, the Java documentation as a resource to help you study.

## 2. Prepare for an Exam - New - 14m

What is an effective way to prepare for an exam? It's helpful to perform a gap analysis on the exam topics. Go to the exam page. You'll find a section where you can review the exam topics. Read through each exam topic and mark your confidence level on the material.

You may find that you'll have a high confidence level about topics that you encounter daily on the job. When you study, these are the types of topics that you can quickly review. Moderate confidence will be topics you're somewhat familiar with. These topics are things you want to brush up on. Low confidence are topics you have little knowledge of. Study these topics considerably.

Then, create a study plan. You'll find that this is going to be both a technical and a psychological exercise. Technical in the sense that you want to study aspects of the language and dedicate time based on your gap analysis. As you do this, consider the potential interplay between topics because one question may utilize concepts from many different topics.

Anticipate the psychology of how exam questions are written. One way to help with this is to attempt and analyze practice questions, understand the nature of the questions-- how distractors work, how they play off of each other. As part of your studying and analysis, don't be afraid to open up NetBeans, open up JShell, and do a little code experimenting.

It's also good to embrace a mix of training and industry experience. For the JAVA SE 8 developer, new concepts are modularity and local variable type inference. You can find training on this in the Java SE 11 upgrade learning path. For Java SE 7 developers, you'll also need to pick up lambdas and streams and the methods you can now write within interfaces. SE 6 developers will need to learn NIO.2 and a few other language enhancements. Because that's a lot of material, you may benefit from the Java Programming Complete course.

But what exactly do we mean by a mix of training and industry? Here's an exercise that'll provide a little more context. Same scenario as last time, but with different applicants.

You are a conglomerate whose products span every sector. You need a strong Java developer to implement connectivity between all your products. Do you hire developer A, who has 5 years at Deutsche Bank, 5 years at BMW, and is a certified Java developer? Or developer B, who has 15 years experience with the Pennsylvania Dutch and is a certified Java developer? Or developer C who has 20 years experience at SAP? Hit the pause button for a second to consider your answer.

This isn't as straightforward as before. Are A and C equal? How do you equate industry experience with their credential? Can you use a credential as proof of your expertise in place of long-term experience? Could you say developer C has a reasonable chance of passing a certification exam?

The scenario for developer B will probably not exist because it's coming from a background where modern technology is discouraged. There is nothing wrong with reinventing yourself, but it seems unlikely that someone with developer B's credentials could get adequate industry experience as a means of. Preparation

So what I'm trying to get at here is the complementary nature of training and industry experience. Training may show ideal or best approaches and provide additional context. As an opportunity to unlearn bad habits you may have picked up in the industry, confirm the latest practices and refresh yourself on forgotten material. The context also helps you see the bigger picture.

Sometimes in industry or as we're learning, we'll just focus on getting our code to work. And to do that, maybe we see aspects A, B and C of a domain, but then there's D, E, and F that we don't see, that we don't care about, because hey, we got our stuff working. That's good enough for us.

So training provides that well-rounded picture to us. That also means that training contains a lot of information. Taking in all that information can be good for combating overconfidence. Another thing to keep in mind, though, is that people tend to forget without continued opportunity to practice.

That's where industry can come in and complement the learning and studying process. Industry is messy, but it's insightful. Questions generally rely on your insightfulness and analytical ability. Industry is a constant state of practice, where you're able to learn by doing, you can appreciate the context that you see, the real world applications of what you're doing. And this continued state of practice is good for reinforcing the concepts that you would have learned in training. And generally speaking, it's recommended to come to the certification exam with 12 to 24 months, minimum, of active industry experience.

I mentioned earlier that exam questions may utilize several different topics. And this earlier example illustrates that. In order to analyze this option, you need to know a few things-- how looping occurs, how to declare variable, Boolean expressions, terminating conditions, variables as counters, how to degrade or omit components from the for loop declaration, if statements, the effect of omitting parentheses, continue statements, pre-increment, and post-increment. There's a lot that goes into this.

Now, you probably won't encounter code like this in the wild, but you will encounter all these bits and pieces that go into making this question. And if you're a new or inexperienced developer, maybe you will write code like this as you're learning how to program. So maybe this looks right to you, but the purpose of the certification exam is to separate out those who are new or inexperienced from those who can demonstrate a sense of mastery.

Getting back to the psychology and the design of questions, here is the type of challenge that you won't see. Hit the pause button, take a minute to review, and I'll explain why you shouldn't see questions like this.

Which statement is valid? Option A-- the reason why this isn't a valid statement is because we've written pring, P-R-I-N-G instead of print, P-R-I-N-T. The intent behind this question should be to test your understanding of lambda expressions, not to test your ability to recognize typos. Typos are a cheap way of making a question difficult.

Now, it's not necessarily a meaningless exercise. There are, of course, situations where your IDE tells you what line is causing compilation to fail. A good question could reflect on this realistic challenge, asking you to analyze a single line, identify an issue or two as a possible solution. In other words, going through that debugging exercise like you would on the job.

But having an answer be wrong simply because of a typo, that's not exactly fair. It's not the type of challenge that the exam should be testing for.

B-- there are many built-in functional interfaces. There are several you should know, but it's unfair to make you memorize all of them. UnaryPredicate is not a built-in functional interface. The exam shouldn't create fake APIs as distractors, where fakeness is the reason why it's wrong. If there are fake APIs, then there should be something that's wrong with them, and the exam should give you a chance to pinpoint this. For all we know, there could be a UnaryPredicate functional interface implemented somewhere, so that answer might end up working if it is written like that elsewhere.

C-- this statement declares a function, but the lambda expression is actually a supplier. This is a good distractor. One of the exam objectives is that you're able to tell the difference between the important built-in functional interface types, for example, function and supplier.

D and E-- you should never see this. The challenge should be about analyzing Java code. It shouldn't be a stunt about keeping track of a bunch of answers like this-- A and B; A,B,C.

F and G-- these distractors are terrible because they're not even plausible. They're absurdity offers no value in separating out qualified versus unqualified candidates. They're good for a laugh, but that's it.

You also shouldn't see answers like none of the above or all of the above. You could also argue that this question as a whole, there are too many distractors to sift through. And generally speaking, this messiness and unfair trickery you're seeing with some of these answers should not be what makes a question challenging. It should be more about analyzing and recognizing code.

Here is another example of what you shouldn't see. Hit the pause button and take a minute to read through the question. Which statement is valid?

A is correct. This is a supplier. A supplier doesn't take in a value, but it ends up supplying or returning something at the end, in this case, a string. And we know it's a string based on the generics.

B-- this statement is also correct. A predicate returns a Boolean. It often tests equality and is used in filter statements and streams. So are we testing equality? Yes x equals y. We're doing that. A bipredicate is similar to a predicate, but it requires two parameters. The generics indicate that these are integers.

C-- well, if A and B are correct, c must also be correct. And how about D, all the above? Well, that's true also. So which answer do we choose? They're all right.

And that's one of the issues with, say, all the above and to a lesser extent, none of the above. If we select D, all of the above, do we necessarily fill in A, B, and C on the exam, too?

Answers like C and D introduce an amount of unfair ambiguity into questions. That's why we won't write questions like this. Instead, we'll specify how many answers you will need to mark correctly.

So how could we rehabilitate a question like this? What is an example of a good certification exam question? This is one. Hit the pause button, take a look at this question, and think about your answer. Which two statements are valid?

Here, we're specifying how many answers are correct. The question is no longer about trickery, spotting typos, or memorization. Instead, the focus is on analyzing, recognizing, and validating each lambda statement.

A-- this statement is correct. A supplier has no parameters and supplies a result. We know the result is a string by looking at the generics. B is not correct this statement declares a function, but the lambda expression is a supplier. And just looking at A and B side by side, it's obvious that only one of these could be true.

C-- this statement is also correct. Again, a predicate returns a Boolean. It's used to test equality, and that's what we're doing here. A bipredicate is similar, but requires two parameters. And the generics here show that these are both integer parameters.

If C is correct, we can easily compare it to d-- and realize D is not correct because D is not returning a Boolean value. Instead, it's trying to add two numbers together.

E is not correct. It's supplying a double, but consumers are the opposite. Consumers cannot supply values. They can take in a value, but not supply anything.

What does this say about the depth of your preparation? We've demonstrated the types of challenges you should and shouldn't be prepared to see on the certification exam.

Challenges that ought to be avoided are ones that force you to memorize API; identify fake APIs, where you find implausible or ridiculous distractors that are good for a laugh not very effective at separating qualified or unqualified candidates; ones with too many distractors that achieve difficulty by bewildering you with many options; answers that are a superset of others, for example where option C says A and B; ambiguity regarding the number of correct answers; and typos.

Good challengers are ones that make you analyze and troubleshoot code; to recognize and work with real Java APIs; to understand language rules and specifications; and anticipate how the rules interplay with each other.

## 3. How to Approach Questions - New - 11m


How can you approach individual questions on the Java SE certification exam? Here is an example stem. You're given some code and asked, "Which two changes, made independently, compiles exception-free code?" This type of question reflects a troubleshooting exercise you'll encounter on the job. Your code doesn't work. What can you do to fix it?

There are a few things to pay attention to with these types of questions. First is the comments. You'll see line 1, line 2, specially noted. This is where you're going to be plugging in code. Language like "made independently," "inserted independently," this means consider any one change that will make the code work.

When we ask "which two changes made independently," this means that two answers made by themselves and not together. This is compared to language like "insert it together," which means a combination of many changes may be necessary to make the code work.

A strategy for handling questions like this is first consider skimming or skipping the code in the stem. A stem with lots of code can feel disorienting. The rest of the question and options offer context in more manageably sized bites. Look at your options. Try to eliminate obviously wrong options, things that have syntactical errors, things that look like they won't compile.

Then, plug the remaining choices into the code in the stem. You may be able to deduce the correct answer by process of elimination, or as you're analyzing your options, outright identify a correct answer that will work. Because distractors try to be realistic, these more plausible distractors may be trickier to weed out.

Here's the question with the options. Hit the pause button take a minute or two to try and figure out the answer. We'll review it afterwards.

Which two changes, made independently, compiles exception-free code? Let's look at our options.

A, change the method return type from string to stream. Could this work? Possibly. It depends on what we're returning.

Let's take a closer look at the code. We are creating a list of strings. We have a return statement. It starts by converting the list into a stream, but that doesn't necessarily mean it'll return a stream. We have to look at the next few methods.

First, we filter. It's still a stream at this point, but an empty stream because there is no "Bart" in the collection. Then, we call findAny. This method finds any object in the resulting stream. It returns an optional.

If you remember, an optional object is a wrapper. Sometimes, operations on a stream might not produce an object. Rather than returning a null value, which could wreak havoc on your program, you're given an optional instead, and this gives you a layer of safety.

For option A to be correct, we'd have to return a stream, not an optional. Because of this, A is wrong.

B is correct. We're changing the methods return type to reflect the resulting optional. With the remaining choices, we need to see if we can get a string returned out of this code.

Let's look at C. This answer tries adding "Bart" to the list. It wants you to think that this code won't compile because the string you want isn't there. The problem is this isn't allowed. List.of is a convenience method added in Java SE 9. It's a very concise way to create lists. However, the collection it produces is immutable. You're not allowed to add elements to the collection as you normally would. Because of this, C is wrong.

D- .get() takes an optional and returns whatever value it contains. Otherwise, it throws a no such element exception. In this case, there is no "Bart," and the exception occurs. It technically does compile, but since the exception occurs, D is wrong.

Pay attention to the language of the stem because it may be very precise. This question is asking more than if the code will compile. It's also asking if it will compile and run exception free.

Process of elimination can be very helpful in these exams. E must be right, but let's see if we can figure why. .orElse(). This is like in .get() in that it returns whatever value is present. The difference is in the event that there is no value present, we're allowed to specify an alternative value-- in this case, the string not found-- rather than throwing an exception.

It takes a bit of time to get into the head of the question writer to figure out what the scenario is trying to do. Questions try to be realistic, but may involve making a point to prove a point for the sake of testing and brevity. What exactly do we mean by this?

A question like this reflects the realistic troubleshooting process, where your IDE complains, and it's up to you to fix it. But where we try to optimize for testing and brevity, your code may never look like this. Again, List.of fantastic way to concisely create a list. However, in a real scenario, this list of names may come from a database rather than outright writing them.

We may have objects as key value pairs, and you probably won't hard code the value you're looking for, as in looking for "Bart." Instead, you rely on some sort of user input. But still, the underlying troubleshooting process is very valuable, and this is the ability that we want to test through the certification exam. And even though we're trying to approximate reality and you may not see code exactly like this in the real world, you will use and encounter some of these techniques and topics as you gain more experience.

When you come to the exam with 24 months of experience, you're coming with the valuable insights that you'll need and an understanding of a lot of the topics that go into creating a question like this. Topics like method return types; collections-- how they're created, when they can be changed, how they're converted to a stream; streams-- various methods, what's returned; and optionals, including the various methods from the optional API and what's returned.

Here's another example question you can try. Hit the pause button, take two minutes, and we'll review afterwards.

"Which two statements are valid?" You can see how this question also requires knowledge of several different topics-- lambda expressions, generics, local variable type reference for lambda parameters-- any one of which could be utilized incorrectly in a distractor. This question has two correct answers.

The first three options present Unary operators. The bottom three present IntUnary operators. Your inclination may be to guess one from the first three and one from the bottom three as correct, but this isn't always the case. Don't be lulled into a false sense of security.

A setup like this prevents guessing from being an effective strategy. To pass this exam, you must be capable of analyzing and understanding the code. Questions don't depend on your ability to discriminate real from fake APIs.

A Unary operator and IntUnary operator are real things. An IntUnary operator is a variant of a Unary operator, which requires an integer parameter. It's not about memorizing APIs, so much as it is being aware of this guideline of what the Int prefix means. Because we know we need an integer parameter, this means generics can't be utilized, like in D, E, and F. We can immediately rule out these options.

Let's look at the remaining options. A-- this distractor wants you to think that the integer in the generics applies to the output. It actually applies to both the right and the left sides of the lambda expression. A Unary operator consumes and produces a value of the same type. In other words, it's a special type of function, where the type in is the same as the type out, whatever that may be.

This option also allows you into a false sense of security by making you think it's correct because the final strings value isn't changing. But that doesn't matter. What matters is that we have a conflict between the integer and the generics and the string parameter. Because of that, this option is incorrect.

By process of elimination, we know that B and C are correct, but let's take a closer look. B-- the var x is inferred as an integer, and an integer is produced. That's good.

C-- the variable x is inferred as an integer, and an integer is produce. How? Purely from the generics. And that's fine.

What are some additional tips and takeaways from these few example questions we've analyzed? If an item contains two or more options that are alternates or a variance of each other, none might be true, some might be true, all might be true. Don't be lulled into a false sense of security. You need to be able to analyze your code.

Don't rely on logical deduction alone. It's certainly a helpful tool, but again, the important thing is to be able to recognize and analyze the code. And finally, if you do get stuck on a question, you have the option to mark the question as "Flag for Review" on the exam, and come back to it later.

