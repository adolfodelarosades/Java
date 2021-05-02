# 9: Modeling Object State Using State Machine Diagrams

1. Modeling Object State Using State Machine Diagrams - 43m
2. Lab 9: Modeling Object State Using State Machine Diagrams - 7m

## 1. Modeling Object State Using State Machine Diagrams - 43m

Lesson 9 talks about modeling object state using state machine diagram. We will see what do we mean by a state machine diagram. And we will also see why do we use it. Objectives of the lesson are to model the object state, and to describe the essential elements of a UML state machine diagram.

So we are in design model. We already finished designing interaction diagrams. And now we will identify those objects in our design which have a complex behavior. The objects which have the complex behavior, we can model those complex objects' state by using a state chart diagram. So this is the symbol for the state chart diagram in the UML.

We design everything with objects. And we know that objects have state and objects have behavior. Objects-- there are two ways to look at the object state. One way is when we say the state of an object is a specific collection of attribute values for the object.

This is a normal diagram which everybody understands very well. We created a class. We have certain attributes. And when we create an object of a class, the instance of a class will have a different and unique values for the attributes. Every instance of a class or every object of a class will have a unique value. So that is one way to look at the state.

Another way to look at the state is to describe the behavior of the object relative to an external stimuli. You have an object which is in a particular state. You take certain action. Say something happens. Right? Now again, you take the same action, but something else will happen. Now your action is same. Why the behavior is different? Behavior is different because the actions are interpreted in a different way, depending upon the state of an object. Such kind of an object is called as a complex object.

If you are creating an application which contains, say, 500 objects, maybe out of these 500 objects, two, three, or four objects will be of this kind of a complex state. So we need to learn how do we depict the design, how we depict in a design form when we talk about these objects.

For this lesson, we will stick to-- and to the next lesson-- we'll stick to the definition of an object as described, the behavior of to object relative to external stimuli. That is the second definition.

Now this is how a state machine diagram looks like. We define a state machine diagram as a behavior that specifies the sequence of states that an object or an interaction goes through during its lifetime in response to the events, together with its response and its actions.

So here's an example. Say we are considering an example for this particular lesson of a special kind of an object which is called as HVAC object. That is, heating, ventilating, and air conditioning. The object design is something like this. Object will have some real temperature. Object will have a state. And there will be upper limit for the temperature, and there will be some lower limit for the temperature. OK?

Now, it is something like this. State is important over here. We will have three main states-- in all, we can say four, as we can see from the drawing, also. But three are our main states. So let's forget about it for the time being.

So we will have idle state. We will have cooling state. And we will have heating state. The behavior of these states will be controlled by another attribute-- that is the temperature. So that means if you are taking certain action, action will have a different impact. That means change in temperature is your action. When there is a change in temperature, it can start cooling down, or it starts heating up, depending upon on which state it is.

Idle state is usually considered as a state when the system is on, but there's no action happening. So let us take a look at our diagram.

So before we design this particular diagram, let us try to understand the various elements of state machine diagram. We want to represent this activity. That is, we want to represent activity something like this. Say there is a change in temperature-- change in temperature. And this will make the system-- you may have three different states. There may be a cooling state. There may be a heating state. And there is an idle state.

We can transition from one state to another state, for example. OK? We can do this. And it will depend upon certain conditions. Maybe the cooling will start only if A/C is installed. If there is no A/C installed, that means even if there's a variation in temperature, nothing can happen. So there have to be certain conditions. There have to be certain triggers. There have to be certain transitions. And we will perform certain actions, depending upon various factors.

Now, we may think that this particular activity is showing just like a normal activity. It's just like a normal activity, just like we had in activity diagram. Why can't I show it with a activity diagram? Why it is so? The difference between a state chart diagram and the activity diagram is, activity diagram is a regular flow. It's a sequence.

But here in this case, you will see that when we start from the beginning, we transition to the idle state. From the idle state, say the temperature is more. And what does it do? It starts cooling. Say the temperature reaches to a certain level where cooling stops. Now it grows beyond a certain limit. And you want to come back. So when you come back, you can not directly go from cooling to heating. That is not allowed. That is not the case over here.

So what you have to do, you have to come to idle. So there is a break. And from that state, you will change once again. So usually sometimes we get a question in our mind, why not activity? Why this? And this is a very, very simple case. You can see only three states. And you can have a very complex-- there are five states or seven states. And in all these states, there are various things happening. We will discuss that part once we come to analyze the structure of individual node. I'll talk about a bit over there.

Now this is a very, very simple case. So the various elements, if we want to draw a state chart diagram, is just like the activity diagram. That is one of the reasons I referred the activity exam, because the start and the final state-- the start and the end is same. So here we call it as a initial state, and here we call it as a final state. The symbols are same as of activity diagram. No difference.

Then we have the state modes. These are called as primary or the main states. So you have heating, idle, and cooling. So these are the three main states. And then we have the transitions-- transition from one state to another. Cooling to-- you can see, when we talk about this here itself, we can understand.

We are not saying go from cooling like this. There is no flow like this. Right? We are creating a flow in a completely different way. We say, OK, from heating, you go here. And from idle, you can go here. From heating, if you want to go to cooling, you say go up here, then this state will describe further. So that means there can be times you will stop over here itself totally. Right?

So you go from here, and then you go from here to here. In between there is a state. And when there is a state, state can control the behavior further. There can always be a chance that from the heating you go to idle, you still were there for a period of time, and again, you begin back. So we have that transition. We had a transition. Transition represents a change of state-- a continuous activity moving from one state to another one.

And then we have a transition trigger. To begin certain action, you have to have a certain trigger. Trigger is a point which says that OK, now we need to leave this state and go to another one. So that is what we have as a transition trigger. Now, when we talk about state transition. State transition can represent change of state at run time.

So the activity goes like this. We turn on the unit, and it is in the idle state. Nothing is happening. It is at one particular state. So we say there is a change in the temperature. So when there's a change in the temperature, the trigger even says, when real temperature is greater than upper bound-- temperature is increasing. When that temperature goes greater than upper bound, that action is supposed to take place. That action is a cooling action.

So how the cooling action happens-- cooling action happens by turning on the fan. So when the real temperature goes greater than upper bound, your action is turn on fan. Now, how can you turn on fan? You have to have certain equipment with that. Certain condition is bound to that. And that condition is called as a guard condition. So guard condition says, when real temperature is greater than upper bound and A/C is installed, then we say yes. Now you can turn on the fan.

On the second end, when we show it over here-- now this is the entry. When we say turn on the fan, that means you're entering into this particular state. This is the entry action. Now when the cooling has reached to its maximum level, and we say when real temperature is less than or equal to upper bound, what do you need to do? Now you don't need to go for further cooling. So you have set certain value-- maybe 70, 80, or whatever it is. So we say OK, now you have to stop it.

So on exit from this state there is an action called as a turn off fan. We are not checking a guard condition over here, because we can check the guard condition with one of the two actions. Because one action is a reverse of another. It's a two sides of the same thing. So likewise, the similar scenario will happen for the heating also. We say when real temperature is less than the lower bound, you should start going towards heating. But when? When the heater is installed. That is the guard condition.

And the reverse is, when the real temperature is greater than or equal to upper bound, you will exit from the heating state, and you will say, OK, we are going for no more heating now. So you will say turn off the fan. The condition shows the interaction with the outer, say, atmosphere. Maybe it is some object which is related to some device where the temperature control is going on. So these are the activities shown over here.

So three states we can see over here-- cooling, idle, and heating. And with every state, we will see few more things coming over here. Now sometimes, in the state structure itself, we can write the events, guards, and actions. So normally three events can be specified, like an entry. That means on entry, what action you will take. Or on exit, what action we will take. Or on do. That means a continuing action. You're cooling. You have not yet reached your particular temperature. So you still keep on continuing performing the same action.

Now, the question is why there is an action on a event guard or these kind of elements inside the node. Sometimes when your object is complex, and there are similar actions which are taking place, depending on the state and the guard condition, you can have different actions. So to represent the guard condition may be same, and the event may be same, but the action has to be different. And the action will be different depending on the state. So in that case, we can show the event and guard together, and the action can be moved on to the state itself.

Now, this shows a complete view over here. This is the complete diagram. We have a transition trigger-- turn on the unit is a transition trigger. So you go from machine is off to the idle state. And when there is a turn off unit, you go to the final state. From the idle state, you can either go to the cooling, or you can go to the heating, depending upon various conditions.

And the actions are shown over here and within this state, too. Now, in this particular diagram, it looks like a repetition, because turn on A/C means turn on fan. Turn off A/C means turn off fan. But when your state of the object is very complex, and you are taking multiple actions depending upon certain features, and you want to reduce the number of guard conditions and number of actions. So depending on that, we will use it inside the node itself over here.

Now, what are the steps to create a state machine diagram? Number one, we draw the initial and the final state. And then we draw the stable states, like idle, cooling, heating-- these are the stable states. We specify the partial ordering of the stable states over the lifetime of the object. And then we specify the events that trigger those transitions between the states of an object. And we specify the actions, if there are any actions.

As a last step, we can specify the action within a state itself. So let us see how we implement these five steps. Step number one, we start with the initial and the final state-- the simplest of all. We just draw the two different states over here. And then we draw the stable states. So there are three stable states over here-- heating, idle, and cooling.

Next step is to draw the partial ordering of the state. That means it can transition from idle to cooling, cooling to idle, heating to idle, and idle to heating. It can go from the beginning to the idle, and idle to the final state. So that means from idle state, there can be three flows. It can go to the cooling, it can go to the heating, or it can go to the final state.

We specify the transition events and actions. So transition events are, turn on unit, turn off unit. And then we have the various conditions. For example, we say, when real temperature is greater than upper bound, we talk about the guard condition, and then we take the action-- that is, turn on fan or turn off fan, depending upon the various conditions, and the guard conditions applied.

Now sometimes, suppose even if the real temperature is greater than upper bound, but there is no A/C installed. That means action cannot be taken. So these kind of variations can be there.

And the last step to this is, we put the actions and the events in the state itself. So we say on entry, turn on A/C. Now, guard condition may be there. When real temperature is greater than upper bound, A/C is installed. We say turn on fan. So we can say turn on A/C, or we can go for some other different actions maybe, if there is a complex object with more than the states just cooling and heating.

Now sometimes the event can occur after a period of time. That means time bound events. If that is the case, we'll use a trigger event by writing after. After is considered as a key word for these trigger events in the state machine. We say after, and within the brackets, we provide the duration-- say 10 minutes, 30 minutes, 24 hours, or whatever it is. Now, these kind of events are used for time out activities.

A self transition is a state transition with the same state for the source and the destination of transition. We can understand it well with an example of a stack. So we understand that stack has three different states. That is, empty, and partially filled, and full. These are the three states.

Now, when we create the stack, it is in the empty state. It is in the empty state. Now, create itself is a transition, because I'd say it is shown as a state or type over here. So the on create, which is a transition. So what happens? Your stack is created and it is empty. Now various actions can take place over here. Maybe you can add an item. That means you can perform the operations onto the stack, like you can push an element in the stack, or you can pop an element from the stack.

So when you push the element in the stack, and the stack is in the empty state, so push item means-- what is your action? You are adding an item to a stack. It was empty. There is a change in the state. It goes from empty to partially filled. Or if it is empty, and you pop an item over here-- popping an item means removing an item. Now, because the stack is empty, your outcome is that it shows an error message. Right?

Guard condition is here. So we say, when entries is equal to minimum plus 1, and you remove the item, then it is OK. And when it is empty, we can see the arrow over here. We are saying, when the stack was empty, we try to perform the pop. So naturally, there is an error.

Now let us go back to the previous state-- when we added an item and the stack state changed from empty to partially filled. Now, say that you created a stack with a maximum limit, say, of 10 items. And here what happens now, we added one item. So entries is less than maximum minus 1, because your maximum is 10. So what happens over here? It is partially filled. You again perform the same operation. The same event occurs-- push.

So when you push the item, you are adding an item. And what is the condition? Entities is less than max minus 1. Now, the number of items in the stack is 2. But what is the state of the stack? It is still partially filled. This is what we call it as a self transition. So whatever the action you took, there is no change in the state. So you can keep on performing this operation till the number of items in the stack is up to 9. It will be in the same state called as partially filled state.

Now, when the entries is equal to max minus 1-- that is when it is 9-- and you perform the operation push-- you add the item-- there's a change in the state from partially filled to full. That is what we have. So now when it is full, and you try to push another item, it gives you an error. So that means the behavior of the stack-- your action is what?

Your action is push an item. That means add an item. The behavior is different when it is empty. The behavior is different when it is partially filled. And the behavior is different when it is full. Same is the case with the pop. Your action is pop. So what happens when it is full and you call a pop operation? What happens? It moves from the full to partially filled.

Now again, until the items are minimum plus 1 till this stage, it will remain partially filled. Your action is same. Right? So what is happening? Now, last time, when it is one item, and you say pop, it goes to the empty state. So it goes to the empty state over here now.

Now, we can see it's a good example to understand the self transition. But don't we see a lot of repetition? Lot of repetition in guard conditions. Lot of repetition in, you can see, we say entries equal to max minus 1, entries less than max minus 1. And we say push item, I think, four times. So is there a way to make it less writing, or to make it better looking, or to make it little better?

So we can do that with the help of two elements. One is called as a junction, and another is called as a choice. UML provides two different elements to handle this kind of scenarios. So let us first take a look at the junction. Now, we can see that a junction can be used to simplify the diagrams by breaking the transitions into several fragments, thereby reducing the duplication of trigger events, guards, and actions. That is what we have.

Now, another thing which we can see about the junction is, we see all outgoing transitions. All outgoing transition guards for all possible parts are evaluated when the first trigger is fired in the case of junction. And before executing any action code in the trigger. That means, here we can see, we have example with four states-- state A, B, C, and D.

Say you want to go from state A to state B. So we have various events and guard conditions over here. Event e1, guard condition m, action should be a3. Guard condition is p and action is a6. Now, when we are using a junction, we will not perform it like this. We won't say, guard condition m, do action a3, then check the guard condition p, and then do a6. No. That's what we are saying.

We said all outgoing transition guards for all possible parts are evaluated when the first trigger is fired, and before executing any action code in the trigger. That means that no action code is first triggered, or any subsequent transition in the chain will affect the evaluation of your guard. That means your second guard condition will not be checked after the first action.

That means that is what we can see over here very, very clearly. We say, you want to go from state A to, say, state C. So we say, on event e1, do guard condition m and guard condition o, then take action a3 and a5. We don't say, do guard condition m, take action a3, go back to guard condition o, and go to action a5. That means junction does not allow me to go for a dynamic condition checking. It is static. Before the action begins, you check everything.

That is something about junction. Now let's see how we can apply this junction onto a stack. So we have two diagrams over here. This is one. I just draw a small very bad boundary over here, like this. So this is what I have. Now, this is the first one. This is what we studied in the previous slide. That is, you have an empty stack. You push an item, go to partially filled. And every point, you are performing-- you are giving a trigger event, you are performing an action, we are checking for the condition, and so on.

Now, what they can do over here with the junction-- the stack is empty. You push an item, and it goes to partially filled state. Right? So right now, the entries are less than max minus 1. Now, we combine multiple actions over here. We don't say push item or add item when entities is less than max minus 1, and again say, push item or add item when entities is equal to max minus 1. So what we do? We put a junction, and we write the to guard condition and the same action.

So depending upon the condition, your action is always same. But depending upon the condition, either it will go to a self transition, or it will go to full. We are not writing it multiple times. Like here, we can see we are writing it over here, and we are writing it over here also. So we are not doing like that. And the conditions are also joined over here together as at the junction. So that means condition will check, and the action will be taken. Right?

When entries are less than max minus 1, your action is add item. The resultant is different. You will go to partially filled. And when your condition is equal to max minus 1, your action is push an item. But your state is changing. Now, the second diagram over here with the junction is no different from the first one. Everything is happening same. But only the way you are depicting that is different.

It is just like if a developer has to write a program. So developer writes condition and takes an action at every step. But here, the person can combine the condition, and then write an action. So that means this is actually a guideline for a coder. We will see a different scenario when we go to even the choice also.

Now, as a programmer, you can say that what is the difference between the two? Both are achieving the same thing. Yes, as far as the input and output is concerned, there is no difference. Only the way you are coding, that becomes more efficient with the junction. That's it.

Now, then we have a choice element. Now, choice is also used to simplify a diagram by breaking the transitions into several fragments, thereby reducing the duplication of trigger events, guards, and actions-- just like junction. But choice enables dynamic evaluation of the guards. That is, after the previous transition fragment actions are executed.

So that means what? Now for the choice, what do we say? We say the outgoing transition guards for a choice-- when you have a choice, what happens? The conditions are evaluated at time when the choice point is reached during the execution. So that means, some execution happens, then also you can check a guard condition, which was not possible in the case of junction. We said in the junction, only before the first action has to be taken, all conditions we have to check before that.

But here, we can see, we say, OK, if you want to go from A to C, now what you can do-- you have more flexible over here. We say, on state A, at event e1, what I can do, I check for the guard condition am. Right? And I take action a3. Now, after that, I can still have a better way to program. I say, I did up to a3. Now it is my choice. Do I want to check for go and go to C? Or I check gp and go to D. So you have more flexibility over here.

That means that flexibility came to you because you could break even the actions. You checked first condition, took certain action. Now you have two more possibilities. So that means you don't have to say, check gn, go, take a3, a5, and go to C. And then I say, check gm and gp, do a3, and do a6. So that means there is a more optimization over here. I say, OK, you check gm, do a3. And after that, you decide. Do you want to check go or gp? Depending on that you take an action, and move to one of the two states. OK?

So here we have another now. So it is a comparison between a junction and a choice now. So we know at a junction, we combined all the conditions-- both the conditions over here. And after checking for the conditions, we were taking an action to make a change in the state. Now here, what happens? We can say that post-- you can perform an action, and then you check the condition. You push and then you check.

OK, if entries are less than max, you remain in partially filled. If it has become equal to max, you can see the difference in the condition checking over here. So that means you don't have to bother-- is it less than max minus 1, or is it greater then max? Or less than max minus 1, or equal to max minus 1. No. You're just checking if it is less than maximum, keep on performing the same thing.

So once you have performed-- like, for example, it was 9. And I said, OK, I don't have to go anywhere else. I will take the same action, because it is less than max. Once you take the action, now it has become 10. So it is equal to max. So that means now the state will go to full. Practically speaking, junction, choice, and without-- it is only a matter how you check the condition. In the very, very beginning stages of programming, when we learn the programming, we had a way where we used to check something like this. I hope I remember. It is very, very long back, but let me just--

I say, i++ and we say while i is less than equal to 10. So we do something, and we come back. Here I keep on saying i++. Or let me see i is equal to 1. Or the other way is, I say something like this. I add something over here, and I say equals. That is the difference. How you check the condition. Choice or junction helps me the condition building. Do you first check and then do?

Now, here in this case, here I have to initialize to 0. Because what I say, it is 0, I check, is it equal to 10. So I say i++, ti becomes 1, I print 1. I go up to 9. So when I go up to 9 over here. So that means now when it is 9, you come over here. Is it while not equal to. Say i not equal to 10. Something like that. So this is how.

So you check the condition. But there can be a chance that you start with 1, and you move it over here, and here the condition will change now. We will say, it is less than equal to 10. So like that. So it depends. It positions whether you are checking the condition before the certain execution, or whether you're checking the condition after certain execution. So that is about choice and about junction.

With this we come to the end of this lesson. So we talked about the objects which are complex. How do we design their state behavior relationship? So depending upon it, you are taking certain action, depending upon at which state the object is, the further action. Your action is same, the behavior will change. You may change from one state to another, depending upon what is your present state. So this is what we talked about in lesson number 9, that is, the complex object and its state behavior.

## 2. Lab 9: Modeling Object State Using State Machine Diagrams - 7m

So let's talk about lab number 9. These are two activities. First one is to identify the essential elements. And in the second one, we will create a state machine diagram for a complex object.

So the first one is to identify elements. Let us take a look at this. So this is a State node.

The second one is a State node with internal events. This is a Start state, Final state, and Transition arrow. So this is the identification of various elements of state machine diagram.

Now let us go to activity 2. This is a case study about an Account object. So we say all accounts start with a balance of $0. And the account with a balance which is greater than or equal to $0 is in the state of Active.

When the account is Active, there are certain operations which a customer can perform, like you can deposit the money. You can withdraw the money. And you can transfer the money from one active account to another active account.

The bank gives you an overdraft limit. Say if the bank gives you an overdraft limit of $100, then the overdraft limit is three months. Say if it is $100, you can withdraw an additional amount of up to $99.99 dollars from the account. And that time, it will be in the state of Withdrawn.

Now when it becomes to minus $100-- that means your balance becomes minus $100-- your account call goes to the Frozen state. Now when it goes to the Frozen state, you can only deposit the amount. You cannot close the account. And you cannot withdraw the amount. You cannot transfer the money.

And when you are in the overdraft limit-- that means your actual balances is $0, but you are using an additional limit given by the bank-- then you cannot even transfer the amount from one account to another account. Now when your account remains in the Withdrawn state for a period of three months and you do not do anything about it, then your account goes into a Frozen state. And when your account is in a Withdrawn state, when you go to ATM, it keeps on giving reminders to you.

And when your account is Frozen, it tells you that you need to meet the bank manager, and you cannot close the account. If you want to close the account or if you want to reactivate your account, you need to meet the bank manager. And if your account remains in the Frozen state, bank manager can take a decision to close all your accounts and file a legal action against you. And you will not be given a permission to open the account in the same bank again.

So we need to identify the various states. We will see the partial ordering. We will see the trigger events. We will see what actions can be taken.

So here is a solution. We identify the four different states. That is an Active state, Withdrawn state, Frozen, and Closed. So these are the four stable states.

Now initially, from the initial state, your account is open. You enter into the Active state. From the Active state, you go to the Withdrawn state when the balance is less than $0 and balance is greater than or equal to overdraft limit.

From the Active state, you go to the Frozen state when the balance is less than, equal to overdraft. You need to notify the manager. That means you need to meet the manager. And from the Active, if you wish, you can close your account.

Now when you are in the Withdrawn state, if you deposit more amount and your balance becomes greater than $0, then you go back to the Active state. And from the Withdrawn state, you go to the Frozen state when the balance is less than $0 and the balance is greater than or equal to overdraft and the time is greater than three months. You need to notify the manager. Now when balance is less than or equal to overdraft, you need to notify the manager.

So you can see from Frozen, you can go to Active. From Withdrawn, you can go to Active, or you can go to Frozen. But from Frozen or Withdrawn, you cannot go back to Closed state.

So this is a simple case where you can move around with the various-- you can see your action may be Deposit. When your action is Deposit. You may remain in the Active account. That's a self transition.

Sorry, when you withdraw the amount, you may remain in Active. You may go to Withdrawn. Or you may go to Frozen.

Your action is the same. You are performing a Withdraw operation. But depending upon what is the current state of your object, from that state, you will move into a different state, or you may stay in the same state. So that is about state chart diagram.

