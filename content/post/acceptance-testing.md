+++
draft = false
title = "Acceptance Testing"
subtitle = ""
tags = ["testing", "e2e"]
date = 2018-05-20T15:48:12-05:00
math = true
summary = """
Incorporating Automated Acceptance Testing into your CI/CD pipeline
"""
+++

In this blog post we will define acceptance testing, explain why acceptance testing is important, utilize a library to write acceptance tests in and go over a method called Given When Then in Acceptance Testing, and incorporate acceptance testing into a CI/CD pipeline,.

## Define Acceptance Testing

[Acceptance Testing](https://www.agilealliance.org/glossary/acceptance/)

An acceptance test is a formal description of the behavior of a software product, generally expressed as an example or a usage scenario. A number of different notations and approaches have been proposed for such examples or scenarios. In many cases the aim is that it should be possible to automate the execution of such tests by a software tool, either ad-hoc to the development team or off the shelf.

An Acceptance Test Suite helps to veriy that an application is delivering the business value that your customers expect. Additionally an acceptance test suite helps guard agains regressions or defect that break preexisting functionality in your application.

## Why is Acceptance Testing Important

So besides functioning as a Regression Test Suite as we stated above, an acceptance test suit help to test the business facing side of your application. It is common to have both Unit and Integration Tests for your code but acceptance tests help to prove that your application does what the customer thinks it should do not what a developer intends it to do.

Many companies already invest in a large battery of Manual Acceptance Testing. Some companies are already spending an exhorbitant amount of money on manual acceptance testing. It may be that for each release a contracting company is hired to conduct manual testing of the entire application.

Automated Acceptance Testing helps to protect your application when large refactorings occur in a codebase. If developers are making large scale changes to an application, an automated acceptance test suite can help protect and catch regressions that can occur with such changes.

## Acceptance Criteria

Acceptance Criteria are conditions in which a software application needs to satisfy in order to be accepted by a customer. Acceptance Criteria is a set of statements which mentions the result that will either pass or fail for both functional and non-functional requirements for the software project at the current stage. These functional and non-functional requirements are the conditions which can be acceptance.

Acceptance Criteria should always be written before development commences so that it can successfully capture the customer intent rather than iterate functionalities in relation to the development reality. Acceptance Criteria should be written clearly in a simple language that the customer and product owners can understand.

## Given When Then

Given When Then is a style of writing tests and was invented by Dan North and is a part of [Behavior-Driven Development (BDD)](https://dannorth.net/introducing-bdd/). The idea is that you should break down a user story/test into 3 main sections:

  * The *given* part helps describes the state that you are specifying in the user scenario.
    * This can also be thought of as a type of precondition before the test starts. 
  * The *when* section is the actual behavior that you are trying to specify.
  * The *then* section helps describe the changes you expect due to the specified behavior.

#### Feature Specification Example

Let us discuss a possible user story that a product owner specified albeit a trivial example.

`simple_addition.feature`

```cucumber
Feature: Simple Addition of Numbers
  In order to do simple math as a developer I want to add numbers
  
  Scenario: Easy Math Problem
    Given a list of numbers set to []
    When I add the numbers together by []
    Then I get a larger result that is the sum of the numbers
```

## Writing tests using Cucumber

Earlier we mentioned that given when then syntax is a style of testing that is a part of BDD. [Cucumber](http://docs.cucumber.io/guides/overview/) is a tool that supports Behavior-Driven Development. Cucumber supports a multitude of languages and we will be using [cucumber-js](https://github.com/cucumber/cucumber-js) in the tutorial.

You can install cucumber-js by running the following command: `npm install --save-dev cucumber`

Requirements is node 6 or higher.

#### Cucumber-js example

Run the following command to create a suitable folder structure:

`mkdir -p features/support`

Create a feature specification file that uses the [Gherkin Syntax](http://docs.cucumber.io/gherkin/reference/) by running `touch features/simple_addition.feature`

Now copy and paste the sample specification we wrote called simple_addition.feature and paste it into the file we just created.

Inside the root of the directory then run `./node_modules/.bin/cucumber-js` and you will see the following output:

```cucumber
Warnings:

1) Scenario: Easy Math Problem # features/simple_addition.feature:3
   ? Given a list of numbers set to []
       Undefined. Implement with the following snippet:
         Given('a list of numbers set to []', function () {
           // Write code here that turns the phrase above into concrete actions
           return 'pending';
         });

   ? When I add the numbers together by []
       Undefined. Implement with the following snippet:
         When('I add the numbers together by []', function () {
           // Write code here that turns the phrase above into concrete actions
           return 'pending';
         });

   ? Then I get a larger result that is the sum of the numbers
       Undefined. Implement with the following snippet:
         Then('I get a larger result that is the sum of the numbers', function () {
           // Write code here that turns the phrase above into concrete actions
           return 'pending';
         });


1 scenario (1 undefined)
3 steps (3 undefined)
0m00.000s
```

We can copy and paste the snippet that cucumber gave us into a file called steps.js

```js
const { Given, When, Then } = require('cucumber')
const { expect } = require('chai')

Given('a list of numbers set to []', function () {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});

When('I add the numbers together by []', function () {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});

Then('I get a larger result that is the sum of the numbers', function () {
  // Write code here that turns the phrase above into concrete actions
  return 'pending';
});
```

Now run the command: `touch features/support/steps.js` and paste these contents.

This will not pass yet as we need to implement our functionality.

Let us create a file called `addition.js`

`addition.js`:

```js
const { setWorldConstructor } = require('cucumber')

class Addition {
  constructor() {
    this.summation = 0
  }

  setTo(numbers) {
    this.numbers = numbers
  }

  addBy() {
    this.summation = this.numbers.reduce((prev, curr) => prev + curr, 0);
  }
}

setWorldConstructor(Addition)
```

Now let us rewrite a steps.js to this:

`steps.js`:

```js
const { Given, When, Then } = require('cucumber')
const { expect } = require('chai')

Given('a list of numbers set to []', function () {
    this.setTo([1, 2, 3, 4, 5])
});

When('I add the numbers together by []', function () {
    this.addBy();
});

Then('I get a larger result that is the sum of the numbers', function () {
    expect(this.summation).to.eql(15)
});
```

Now when we run our tests we see the following:

```bash
npm run acceptance:tests

> cucumber-examples@1.0.0 acceptance:tests /Users/jean-marcelbelmont/dev/cucumber-examples
> cucumber-js

...

1 scenario (1 passed)
3 steps (3 passed)
0m00.001s
```

## Incorporate Tests into a CI/CD Pipeline

In order to incorporate cucumber into a CI/CD pipeline you will need to choose a CI/CD tool. For the purposes of this blog post we will use Travis CI.

Travis CI uses a yaml script file and is really easy to incorporate to a Github Project. First create a file called `.travis.yml` and then make sure that sign up for `https://travis-ci.org` account. You will then need to sync your current Github repos and then toggle on the repo of your choose. Next push up changes to source control and go to the CI build which in my case happens to be `https://travis-ci.org/jbelmont/cucumber-examples`.

Here is the `.travis.yml` script that the blog post uses:

```yml
dist: trusty
sudo: required
language: node_js
node_js:
  - 10
script:
  - npm run acceptance:tests
```

Notice that the script part is `npm run acceptance:tests` it is defined in the package.json file at the root of the directory.

## Final Thoughts

This example while trivial is a good illustration on why using a tool like cucumber is really useful to test your Acceptance Requirements in a programmatic way.

If you like this blog post then please follow me at [jbelmont at Github](https://github.com/jbelmont)