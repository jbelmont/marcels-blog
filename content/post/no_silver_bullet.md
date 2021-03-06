+++
date = "2017-04-10T12:00:00"
draft = false
tags = ["academic", "paper"]
title = "A Review of No Silver Bullet paper"
math = true
summary = """
No Silver Bullet
"""
+++

# No Silver Bullet Essence and Accident in Software Engineering

# Table of Contents
  1. [Introduction](#introduction)
  2. [Does It Have To Be Hard](#does-it-have-to-be-hard)
    1. [Complexity](#complexity)
    2. [Conformity](#conformity)
    3. [Changeability](#changeability)
    4. [Invisibility](#invisibility)
  3. [Past Breakthroughs Solved Accidental Difficulties](#past-breakthroughs-solved-accidental-difficulties)
    1. [High-level languages](#high\-level-languages)
    2. [Time-sharing](#time\-sharing)
    3. [Unified programming environments](#unified-programming-environments)
  4. [Hopes for the Silver](#hopes-for-the-silver)
    1. [Ada and other high-level language advances](#ada-and-other-high\-level-language-advances)
    2. [Object-oriented programming](#object\-oriented-programming)
    3. [Artificial intelligence](#artificial-intelligence)
    4. [Expert systems](#expert-systems)
    5. [Automatic programming](#automatic-programming)
    6. [Graphical Programming](#graphical-programming)
    7. [Program verification](#program-verification)
    8. [Environments and tools](#environments-and-tools)
    9. [Workstations](#workstations)
  5. [Promising Attacks on the Conceptual Essence](#promising-attacks-on-the-conceptual-essence)
    1. [Buy versus build](#buy-versus-build)
    2. [Requirements refinement and rapid prototyping](#requirements-refinement-and-rapid-prototyping)
    3. [Incremental development grow not build software](#incremental-development-grow-not-build-software)
    4. [Great designers](#great-designers)


## Introduction

> There is no single development, in either technology or management technique, which by itself promises even one  order of magnitude improvement in productivity, in reliability, in simplicity.

* Innovations in the software can yield an "order-of-magnitude" improvement
* Example given in medicine where doctors where taught the benefits of cleanliness improving health of patients
  * In the same way improving processes in software can help improve software step by step

## Does It Have To Be Hard

* Software can't hope to see the gains that hardware has seen with improved chip design every 2 years.

1. Software construction really can't be compared with hardware constructions.
  1. Hardware advances in the last 30 years cannot be compared to any other technology
2. Difficulties in Software:
> I believe the hard part of building software to be the specification, design, and testing of this conceptual construct, not the labor of representing it and testing the fidelity of the representation.

  1. Syntax errors in software pale in comparison to conceptual errors in a system
  2. There is no silver bullet

#### Complexity

* Computers themselves are among the most complicated things humans build
* Software Construction is more than merely putting parts together
  * Elements of a software system interact in nonlinear ways
* Example given in mathematics where advances in math came for 3 straight centuries because of simplified models
* Complexities in Software Construction create the following issues:
  * Communication among team members
    * In turn produces product flaws, cost overruns, schedule delays
  * Complexity in understanding all possible states of a system and enumerating the states of a system
    * This drives unreliability
  * Complexity thereby make programs hard to use
  * Complexity makes programs harder to extend newer functionality and consequently introducing side effects
  * Complexity also makes security of a software system more difficult to understand
  * Complexity also makes management more difficult

#### Conformity

* Software engineers face added complexity because they must conform to decisions made by others
* Conforming to other software components itself makes software systems more complex

#### Changeability

* Since software is much more malleable and easier to change this by itself introduces more challenges
* Users of a software system find new uses for software and thereby introduce new complexities
* A combination of users of a software system, laws introduced, and new software machinery add difficulties as well

#### Invisibility

* Software is inherently invisible and hard to visualize if even possible
* Attempts to visualize a system become difficult because of all the working pieces
* Since software cannot be easily visualized this in turn adds more complexity to systems

## Past Breakthroughs Solved Accidental Difficulties

The 3 Steps in software that have helped accidental difficulties:

1. High-level Languages
2. Time-sharing
3. Unified programming environments

#### High-level languages

High-level languages helps in the following ways:

* Alleviates accidental complexity
* Diminish complexities that arose from programming in assembly language and understanding machine code
* Improve processes by the use of higher level concepts such as data structures and data types

#### Time-sharing

* Reduced compilation and execution times of software systems help keep program logic in context
  * This is true because a shorter feedback loop helps engineers keep focused on the task at hand

#### Unified programming environments

* Development of Unix and Interlisp helped with using software programs together and improving productivity
* Unified file formats, and integrated libraries helped immeasurably as well

## Hopes for the Silver

**Looking at possible silve bullets**

#### Ada and other high-level language advances

* Ada is touted as a very influential programming language
* Ada's philosophy more than its features as a language have been influential
* Fred Brooks makes a prediction that Ada will have an impact by training engineers with modern software practices

### Object-oriented programming

* Argues that object-oriented programming (OOP) helps remove boilerplate of previous software constructs
* OOP helps with higher-order design of software systems
* Argues that OOP can only help if some of the troubles of `type specification` is reduced in systems

#### Artificial intelligence

Brooks examines argument made by `Parnas` on AI

1. The use of computers to solve problems that previously could only be solved by applying human intelligence.
  1. Argument is made that what people consider is AI today can rapidly change, kind of like a floating goal.
2. The use of a specific set of programming techniques knows as heuristic or rule-based programming.
  1. Not detail expounded on rule based systems but I can surmise that there are unspoken challenges since this requires expert knowledge that must be gleaned from an actual expert

#### Expert systems

* Inference engines offer advantages over deterministic logic through application independence and varied use
* Rule sets can encode universal ideas that can be applied to different applications thereby distributing complexity
* Argues that separation of application complexity from the software program itself is an important advance

Applications for software tasks:

* Suggest interface rules
* Help with testing strategies
* Optimization strategies
* Argues that rule-based systems should become more hierarchically modularized in the same that a system does
* Argues that test case generation is work that has to be done anyways and rules can help maintenance of a system

Difficulties in Expert Systems:

1. Difficult going from program structure specification to the semi-automatic generation of diagnostic rules
2. Knowledge Acquisation is difficult for several reasons:
  1. Finding experts that are articulate enough and understand why they do things.
  2. Extracting information from experts in order to distill into the rule bases is another
  3. Experts are required

* Distilling knowledge to inexperienced programmers from the best programmers is also no simple task.
* A tool that disseminates this knowledge is extremely important

#### Automatic programming

> In short, automatic programming always has been a euphemism for programming with a higher-level language than was presently available to the programmer.

Automatic Programming favorable qualities:

* The problems are readily characterized by relatively few parameters.
* There are many known methods of solution to provide a library of alternatives.
* Extensive analysis has led to explicit rules for selecting solution techniques, given problem parameters

**Argues that such programming seems difficult to even achieve**

#### Graphical Programming

* Argues that uses of flow-chart is a poor abstraction of software construction
* Argues that it is a useless design tool used by programmers since it is used after writing programs not before
* Argues that desktop computer sophistication is a hindrance to software systems underlying complexity
  * As this was written in 1986 many advances have occurred with software so not sure about this point
* Argues that software is very difficult to visualize
  * The following graphical tools:
    * Diagram control flow, varible scope nesting, variable cross-references, data flow, hierarchical data structures
    * Even with these tools it is difficult to get a global overview of a software system.
* A software systems cannot be visualized in the same way that hardware systems can

#### Program verification

* Argues that Program verification is powerful but labor intensive and very few programs have been proven correct
* Argues that program verification can only assert that a program meets its specification

> The hardest part of the software task is arriving at a complete and consistent specification, and much of the essence of building a program is in fact the debugging of the specification.

#### Environments and tools

* Smart Editors at most can help with syntactic errors and simple semantic errors
* "Integrated Database Systems" that keep track of details that programmer's must understand
  * I am assuming here that "Object Relational Mappers" could be considered nice tools to extract business logic
  * Examples like linq instead of using Stored Procedures and Table Triggers

#### Workstations

* The point is made that even with factor of 10 speed increases in developer workstations you still have think time
  * Think time being the time a developer uses modelling out business logic and program flow I assume

## Promising Attacks on the Conceptual Essence

Productivity Equation:

$$ \sum(Frequency)_i x (Time)_i $$

Focusing on the task at hand or the conceptual essence is not the silver bullet as well

#### Buy versus build

* It is cheaper to buy production ready software than try to write homegrown software
  * Argues that a software system costing $100,000 could be roughly equivalent to a yearly salary of a developer
* Argument made that the ratio of hardware/software cost has changed dramatically
  * if you spent 2 million on a piece of hardware then spending another $250,000 on software is a drop in the bucket
* Development of spreadsheet and office technologies has enabled the mainline computer user to find new uses
  * Argues such office software has the possibility of being a force multiplier in advances through novel uses

#### Requirements refinement and rapid prototyping

* Clients find it hard to nail down the exact requirements that they want
* Will often take multiple versions of a prototype to nail down what the client wants
* Points out that rapid prototype tools can assist greatly in solving software problems

> The  purpose  of  the  prototype  is  to  make  real  the  conceptual  structure  specified,  so  that  the  client  can  test  it  for  consistency  and  usability

**Iterative development and the use of prototypes is key to building satisfactory software system**

#### Incremental development grow not build software

* Calls for iterative development in software
  * Flesh out details bit by bit in a system
  * I would argue that TDD can help with such things by facilitating with incremental design

> That is, the system should first be made to run, even though it does nothing useful except call the proper set of dummy subprograms.  Then, bit-by-bit it is fleshed out, with the subprograms in turn being developed into actions or calls to empty stubs in the level below

* The main point is see in this section is that having a running system at all times keeps you focused and attentive

#### Great designers

* Good design can help drive quality of a system
  * Organizations like the Software Engineering Institute help promote good software systems
* Argues that great design minds (meaning individuals) can accomplish more than a committee of designers
* Find ways to nurture highly creative minds as they can pave the way to the future
  * Examples are given with Unix, SmallTalk, Fortran and others that were largely individual efforts
* Argues that organizations must cultivate great designers just like they would with management prospects

Highlights the following ways to grow great designers:

* Systematically identify top designers as early as possible. The best are often not the most experienced
* Assign a career mentor to be responsible for the development of the prospect, and keep a careful career file
* Devise and maintain a career development plan for each prospect
* including carefully selected apprenticeships with top designers, episodes of advanced formal education
* short courses, all interspersed with solo design and technical leadership assignments
* Provide opportunities for growing designers to interact with and stimulate each other