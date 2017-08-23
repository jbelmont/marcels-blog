+++
date = "2017-08-22T12:00:00"
draft = false
tags = ["TDD", "Object Oriented Design"]
title = "Growing Object-Oriented Software, Guided by Tests"
math = true
summary = """
Growing Object-Oriented Software, Guided by Tests
"""

[header]
image = ""

+++

# Growing Object Oriented Software Guided By Tests

* [What is the Point of Test-Driven Development](#what-is-the-point-of-test-driven-development)
* [Test-Driven Development with Objects](#test-driven-development-with-objects)
* [An Introduction to the Tools](#an-introduction-to-the-tools)
* [Kick-Starting the Test-Driven Cycle](#kick-starting-the-test-driven-cycle)
* [Maintaining The Test-Driven Cycle](#maintaining-the-test-driven-cycle)
* [Object-Oriented Style](#object-oriented-style)
* [Achieving Object-Oriented Design](achieving-object-oriented-design)
* [Building on Third-Party Code](#building-on-third-party-code)
* [Commissioning on Auction Sniper](#commissioning-on-auction-sniper)
* [The Walking Skeleton](#the-walking-skeleton)
* [Passing the First Test](#passing-the-first-test)
* [Chapters 12 to 18](#chapters-12-to-18)
* [Sniping for Multiple Items](#sniping-for-multiple-items)
* [Teasing apart Main](#teasing-apart-main)
* [Filling in the Details](#filling-in-the-details)
* [Listening to the Tests](#listening-to-the-tests)
* [Test Readability](#test-readability)
* [Constructing Complex Test Data](#constructing-complex-test-data)
* [Test Diagnostics](#test-diagnostics)
* [Test Flexibility](#test-flexibility)
* [Chapters 25 to 27](#chapters-25-to-27)

## What is the Point of Test-Driven Development

* Feedback is the most fundamental tool at our disposal
* TDD is a practice that supports change
* You should never write new functionality without a failing test.
* This first chapter basically explains the benefits of TDD

## Test-Driven Development with Objects

* Objects should communicate their intent to other objects
  * Tell Don't Ask principle
* Mock Objects when you use "Tell Don't Ask" principle

## An Introduction to the Tools

* Testing Tools are introduced in the chapter
  * JUnit and JMock are mentioned
* JavaScript Test Runners like `ava.js`, `mocha.js`, and `jest`
* `sinon.js`, and ``testdouble.js` serve as mocking libraries
* Test Fixtures are mentioned in this chapter as well

## Kick-Starting the Test-Driven Cycle

* Using Test Fixtures and Mock Objects is mentioned
* Examples are using JUnit and JMock
* A test fixture is the fixed state that exists at the start of a test. 
* A test fixture ensures that a test is repeatable
  * Every time a test is run it starts in the same state so it should produce the same results. 
* A fixture may be set up before the test runs and torn down after it has finished
* Assertion Libraries are talked about but mainly how to write tests using assertions

## Maintaining The Test-Driven Cycle

* Start each feature with an acceptance test
* An acceptance test basically is how you test a feature in a UI
* An acceptance test should fail unti the feature is implemented
* Find the simplest success case
* User Acceptance Tests (UATs) should be easy to read
* You should be unit testing behavior and not methods
* Pay attention to trouble areas that are hard to test
  * This indicates a possible area for refactoring

## Object-Oriented Style

Object Oriented Design:

* Have clear `separation of concerns`
  * Behavior should be grouped in logical places
  * This helps isolate changes to `areas of concern`
* Group components into `Higher Levels of Abstraction`
  * Don't program with variables and control flow in mind but instead with larger abstractions
* Encapsulation is a concept where behavior of an object is only affected through its API
* Information Hiding deals with the fact that Objects should hide lower level work in its API from public use
* Every object should have only have responsibility aka `Single Responsibility Principle`
* The Composition of several objects should be simpler than the sum of all the objects
* Objects should have enough `context` of their environment
* Whatever information you need should be passed in or to put it another way you can use `dependency injection`  

## Achieving Object-Oriented Design

* Writing test first influence the design of a system
* TDD with mock objects expresses intent that you should mock an object's peer dependencies but not the internals of an object
* Value types is mentioned with explicit caveat that they are immmutable while Objects are stateful
* An object should be broken apart if it becomes difficult to test
* Interfaces should be not be fat and with that being said you will need more interfaces
* You will need more interfaces in order to keep your interfaces `lean`
  * This means you should refactor interfaces as well
* System Behavior should rely on composition and not inheritance

## Building on Third-Party Code

* You should only mock object that you own
* Don't mock third party code
* Instead write an Adapter Layer
* Write a Database Adapter Layer so that if you change databases you can easily swap them out

## Commissioning on Auction Sniper

* A user scenario is described in this chapter detailing the auction process

## The Walking Skeleton

* In this chapter the first test is described which is an end to end test
* One example library that comes to mind is `Nightwatch.js` and `Cypress.io`
* These libraries help you write end to end tests in modern web UIs

## Passing the First Test

* A *TODOLIST* is used in this chapter and the first item is crossed out
* An important concept that I derive is that User Workflows help influence the design and indicate important UI elements

## Chapters 12 to 18

* These chapters essential detail iterating through software design
* Small slices of behavior should be tested and implemented iteratively
* Don't be afraid of changing design of the system while iterating through a User Workflow
* Architecture should be developed incrementally
* Types in a system should be defined with `Domain Types` 
* Modelling systems with `Domain Types` helps better describe a software system
* Avoid using Magic Numbers or Strings

## Handling Failure

* Use smaller methods or utility methods that act as helpers for objects
* Logging should be designed as a feature
  * Avoid scattering logging statements all throughout a system

## Listening to the Tests

* An interesting point is made that implicit dependencies are still dependencies
* A good corollary to this can be made with npm dependencies
* Typically npm dependencies have dependencies of their own and if not isolated they carry an implicit dependency of their own
* Don't mock values or immutable values since you can just create instances but instead mock stateful objects
* Bloated `constructors` ones that take many parameters should signal a refactor possibly add a service or a message broker
* Bloated `constructors` can also signal that an object has too many responsilities
* You shouldn't have too many test assertions in any given test this probably signals that you should broke apart a test
* A test should have few assertions/expectations 
* Knowledge of an object should be as close to the origin
  * Keeping knowledge close helps make pluggable components
* We should explicitly name a behavior to help control the behavior
* Try to add more names in order to extract more domain information
* Pass behavior rather than data

## Test Readability

* Test Names should describe Features of a system
* Tests should follow a structure like this:
  * Setup
  * Execute Actions
  * Teardown
* Test structure should help explain behavior and should help share valuable information
* Delegate to subordinate objects
* Assertions/Expectations should communicate the exact behavior of a system
* Avoid magic variables and instead use constants that explicitly show intent

## Constructing Complex Test Data

* A builder pattern helps in constructing complex test data
* Builder pattern helps break apart complex test data into some chainable methods

## Test Diagnostics

* Tests are made to fail
* We want tests to fail or report failures when they occur
* Write small and focused tests that are well named
* Add explanatory statements in test assertion/expections to help find error in a stack trace
* Use test matchers for detailing methods
* Tests should be self describing
* Tracer objects help map where failures occur
* Write a Failing Test ==> Make Diagnostics Clear ==> Make Tests Pass ==> Refactor 

## Test Flexibility

* Write precise assertions/expectations or just test the relevant parts of a method

## Chapters 25 to 27

* Persistence or CRUD actions can be tested with fine-grained integration tests
* Unit testing concurrent code can be difficult and it is easy to receive false positives
* Test Asychronous code by testing incremental changes in the UI
* Using timers can deliver false positives on UI changes 
* Take snapshots of the UI throughout the lifecycle of the User Workflow