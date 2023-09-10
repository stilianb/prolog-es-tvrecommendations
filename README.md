# Instructions 

Your goal in this programming assignment is to build an Expert System (ES) in Prolog. An ES is a software that uses logic to support its decisions, simulating a human expert in a specific domain. For example, a medical ES can be use to build to support the diagnosis process of physicians. 

It is totally up to you how to structure your ES. The ES framework discussed in class (available in lesson 18) can be used as a starting point. You are also free to choose your ES domain, except animals since we have been using this domain in our examples. Your ES must be able to "learn” from the user using dynamic clauses (both positive and negative ones). Your ES should also have a minimal number of 15 distinct classes.  For example, if the chosen domain is diseases your program should be able to diagnose at least 15 different diseases.  

A simple ES is provide in [animal.pl](src/animal.pl).

# User Interface 

To facilitate testing and grading, your ES should strictly follow the user interface described in this section.  The program starts when the user types "begin.” in the Prolog’s shell.  The system should then present a welcome message to the user together with some informative text.  For example:  

```
?- begin. 
Welcome to this ES about animals! 
I am going to ask questions about animal features. 
Please answer yes. or no. 
Ready? 
```
 
Answering "yes.” initiates a sequence of questions (e.g., yes/no questions) that ends when the system is able to lock on an answer OR the system exhausted all the questions that it is programmed to ask. If the user answers "no.” to the "Ready?” question the program should immediately terminate with a "Bye!” message.  Below is an example-run where the system was able to find an answer.  

```
has fur? 
|: no. 
has feathers? 
|: yes. 
says quack? 
|: yes. 
I think your animal is a duck. 
```
 
The system should then ask the user for some feedback using a message like "Did I get it right?” Depending on how the user answers this final question, the system should react differently. For example:  

```
Did I get it right? |: yes. 
Nice!
``` 

OR  

```
Did I get it right? |: no. 
Not my fault! My designer did not give me enough information about animals. 
```
 
Below is an example-run where the system was NOT able to find an answer after exhausting all possible questions programmed in the system.  

```
has fur? 
|: yes. 
says woof? 
|: no. 
says meow? 
|: no. 
has feathers? 
|: no. 
Hmmm, I could not figure this one out... 
```

Before exiting, the ES should display a message explaining how to start a new session.  For example:  

```
To try again, just type begin. 
```
 
Please note that each ES session should be independent from previous ones.  Therefore, you need to retract all of the dynamically added clauses before starting a new session.  

# Option-type Question

Your ES should have at least one option-type question.  An option-type of questions let's a user type in a value and it checks whether the value is in list of options. For more information about option-type question, see the [colors.pl](src/colors.pl) example. 
# prolog-es-tvrecommendations
