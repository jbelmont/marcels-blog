+++
date = "2017-08-31T12:00:00"
draft = false
tags = ["TDD", "Testing"]
title = "Software Testing Foundations"
math = true
summary = """
Software Testing Foundations
"""

+++

* [Unit Testing](#unit-testing)
* [Integration Testing](#integration-testing)
* [Test-Driven Development](#test\-driven-development)
* [Behavior-Driven Development](#behavior\-driven-development)
* [End-to-End Testing](#end\-to\-end-testing)
* [Mocking](#mocking)
* [Test Fixtures](#test-fixtures)
* [Property Based Testing](#property-based-testing)

## Unit Testing

To view lecture notes for this course, please consult the
[github-pages](https://marcelbelmont.com/software-testing).

[Rediscovery of TDD](https://www.quora.com/Why-does-Kent-Beck-refer-to-the-rediscovery-of-test-driven-development)

Instructions for Unit Exercises:
1. Go to unit folder `cd unit`
2. Open program.test.js and go to each TODO block.
3. Complete each todo block by adding unit tests.
4. Please run the following script to `npm run unit:test` in order to do the unit test exercises

### 1. Unit Test the Map Function:
```js
nest.test('Unit test the map function', assert => {
    assert.equal(actual, expected,
        `should render default message`);
    assert.end();
});
```

####For a typical unit test I usually create 2 variables one named actual and another named expect
*For `assert.equal(actual, expected, 'My message here')` if actual and expected are equal then the unit test will pass.*

The map function behaves in the following manner
```js
[1,2,3,4,5].map(function(number) {
    return {
        value: number
    };
});
```

This will return the following structure
```json
[
    { value: 1 },
    { value: 2 },
    ...
]
```

Add variables actual and expected to this first unit test.
The equal method expects to get single property/value in order to pass 1 === 1 or "Mike" === "Mike"
The deepEqual method does a deep property check like this [1,2,3] === [1,2,3]

### 2. Unit Test the Filter Function.

The filter function behaves in the following manner
```js
[1,2,3,4,5].filter(function(number) {
    return number > 3;
});
```

This will return the following structure
`[4, 5]`

*Either choose `assert.equal` or `assert.deepEqual` but remember deepEqual does a deep check with arrays but equal checks properties.*

### 3. Unit Test the concatAll Function.

The concatAll function behaves in the following manner
```js
[
    [1,2,3,4,5],
    [6,7,8,9,10]
].concatAll();
```

This will return the following structure
`[1,2,3,4,5,6,7,8,9,10]`

##### Write a Unit Test using the same format as previous 2 exercises.
```js
nest.test('I am some text', assert => {
    const actual = ...;
    const expected = ...;
    assert.equal(
        actual,
        expected,
        'I should another text'
    );
    assert.end();
});
```

### 4. Unit Test the concatMap Function.

The concatMap function behaves in the following manner
```js
const numStrings = [ ["One", "Two", "Three"], ["Four", "Five", "Six"] ];
[1, 2, 3, 4, 5].concatMap(function(num) {
    return numStrings[num];
});
```

This will return the following structure
`["One", "Two", "Three", "Four", "Five", "Six"]`

## Integration Testing

To view lecture notes for this course, please consult the [github-pages](https://marcelbelmont.com/software-testing).

## Distinction between Unit Tests
*Introducing dependencies on external modules or data also turns unit tests into integration tests.*

*If one module misbehaves in a chain of interrelated modules, it is not so immediately clear where to look for the cause of the failure.*
*When code under development relies on a database, a web service, or any other external process or service,*
*enforcing a unit-testable separation is also an opportunity and a driving force to design more modular, more testable and more reusable code.*

[Distinction between Unit Tests](https://en.wikipedia.org/wiki/Test-driven_development)

## Starting instructions
* Open 2 terminal prompts
* run the command `couchdb`
* `cd integration-tests`
### II. Using text editor of your choice open program.test.js and complete each TODO block.

### 1. Finish Integration test for the /api/v1/users/badMofos endpoint:

#### Inspect the payload with the following curl command
```sh
curl -X GET -H "Accept: application/json" -H "Cache-Control: no-cache" "http://localhost:3000/api/v1/users/badMofos"
```
#### Use the telnet command and paste in the following commands to your terminal and hit enter.
```sh
telnet localhost 3000
```

Paste this GET request into terminal that is expecting request and line feed and hit enter twice
```sh
GET /api/v1/users/badMofos HTTP/1.1
Host: localhost:3000
Accept: application/json
Cache-Control: no-cache
Postman-Token: f3413251-c0de-69ac-99dd-992bcaaca3bd
```

#### Use a REST client such as Postman Chrome App or anything else.

##### Whichever way you use choose you get the following JSON payload
```json
{
  "_id": "users",
  "_rev": "1-c9d988323eed080b054d6eb467abe4f9",
  "names": [
    "John J Rambo",
    "Conan The Barbarian",
    "Billy Jack"
  ],
  "ranks": [
    "One Bad Mofo",
    "Too Big of a dude",
    "Kicks too high for my taste"
  ]
}
```

* Add assertion to expect function call in line 16 using the payload information.

### 2. Finish Integration Test for /api/v1/couch/insertDocument endpoint

*The Super Test library api docs can be found here [SuperTest](https://visionmedia.github.io/superagent)*

####Hints to complete the exercise:
*1. Use post method in supertest*
*2. Use set method in supertest and pass in object with Accept and Content-Type headers.*
*3. Use send method in supertest and pass in object with a name and document property.*
*4. Make sure to call expect in supertest to do assertion and use previous get request as example.*
*5. Make sure to end supertest call with end function call or the integration test won't finish.*
*6. Check statuscode with SuperTest property [Status](https://visionmedia.github.io/superagent/#response-status)*
*7. Use assertion methods from Tape [Asserts](http://www.node-tap.org/asserts)*
*8. CouchDB api documentation [Docs](https://wiki.apache.org/couchdb/HTTP_Document_API)*
*9. CouchDB driver for node.js (nano) that I am using [Docs](https://github.com/dscape/nano)*

#### Making Rest Call with Curl for Post Request
```sh
curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" -H "Cache-Control: no-cache" -d '{
	"name": "some-document",
	"document": {
		"values": {
			"one": 1
		}
	}
}' "http://localhost:3000/api/v1/couch/insertDocument"
```

### 3. Write an integration test removing the newly created document to /api/v1/couch/deleteDocument/:name

*The Super Test library api docs and rest methods can be found here [SuperTest](https://visionmedia.github.io/superagent/#request-basics)*

####Hints to complete the exercise:
*1. Use appropriate supertest method to remove document.*
*2. Make assertion with the returned status code (204) is usual status for DELETE request.*

#### Making Rest Call with Curl for Delete Request
```sh
curl -X DELETE -H "Content-Type: application/json" -d '{
	"name": "spicegirls"
}' "http://localhost:3000/api/v1/couch/deleteDocument"
```

## Test-Driven Development

To view lecture notes for this course, please consult the [github-pages](https://marcelbelmont.com/software-testing).

#### Definition of TDD via Wikipedia [Test-Driven Development](https://en.wikipedia.org/wiki/Test-driven_development)
Each test case fails initially: This ensures that the test really works and can catch an error. Once this is shown, the underlying functionality can be implemented. This has led to the "test-driven development mantra", which is "red/green/refactor", where red means fail and green means pass. Test-driven development constantly repeats the steps of adding test cases that fail, passing them, and refactoring. Receiving the expected test results at each stage reinforces the developer's mental model of the code, boosts confidence and increases productivity.

#### Test-Driven Development Cycle
**_1. Add a test_**
**_2. Run all tests and see if the new test fails_**
**_3. Write the code_**
**_4. Run tests_**
**_5. Refactor code._**
**_Repeat_**

#### Exercise Instructions
Requirements for First TDD Cycle
Create a function that computes the average of a range of numbers.

Complete exercises in [TDD Folder of Repo](https://marcelbelmont.com/software-testing/tree/master/tdd)

##### Test-Driven Development Cycle 1 (Add a Test / Run Tests)
1. Go to file path `tdd/tdd-cycle/cycle1/program.test.js` and add a failing test by calling a function that doesn't exist in program.js
2. Add a failing test in program.test.js using either Mocha with Chai or with Tape from our previous exercies.
3. Run the failing test `npm run tdd:cycle1`

##### Test-Driven Development Cycle 2 (Write the Code / Run Tests)
1. Go to file path `tdd/tdd-cycle/cycle2`.
2. Add the minimal requirement to make the test pass again.
3. (Hint) Add an empty function in `program.js` and then call it with the appropriate assertion.
4. Run the test with `npm run tdd:cycle2`

##### Test-Driven Development Cycle 3 (Refactor by adding implementation / Add a test / Run all Tests again)
1. Go to file path `tdd/tdd-cycle/cycle3`.
2. Implement the average function in program.js.
3. Add a unit test for the average function with an array of numbers.
4. Use appropriate assertion to unit test the function.
5. Run the test with `npm run tdd:cycle3`

##### Test-Driven Development Cycle Final / (Refactor code / Add a test / Run all tests again)
1. Go to the file path `tdd/tdd-cycle/cyclefinal`.
2. Refactor the code again with possible different implementation or quit.
3. If refactored with newer function than add new test else add run the same test for original implementation
4. Run the test with `npm run tdd:cycle:final`

## Behavior-Driven Development

To view lecture notes for this course, please consult the [github-pages](https://marcelbelmont.com/software-testing).

## Definition of BDD via Wikipedia
BDD (behavior-driven development) combines practices from TDD and from ATDD.[27] It includes the practice of writing tests first, but focuses on tests which describe behavior, rather than tests which test a unit of implementation. Tools such as Mspec and Specflow provide a syntax which allow non-programmers to define the behaviors which developers can then translate into automated tests. Behavior-driven development combines the general techniques and principles of TDD with ideas from domain-driven design and object-oriented analysis and design to provide software development and management teams with shared tools and a shared process to collaborate on software development.

## Another Look at what BDD is via Josh Davis [Blog](http://joshldavis.com/2013/05/27/difference-between-tdd-and-bdd/)
The main difference is just the wording. BDD uses a more verbose style so that it can be read almost like a sentence.

In contrast to TDD, BDD is when we write behavior & specification that then drives our software development.
The ability to read your tests like a sentence is a cognitive shift in how you will think about your tests. The argument is that if you can read your tests fluidly, you will naturally write better and more comprehensive tests.

Instructions for BDD Exercises:
1. Go to bdd folder `cd bdd`
2. Open program.test.js and go to each TODO block.
3. Complete each todo block by adding bdd style unit test.
4. In order to complete the exercises run the script `npm run bdd:test`

### 1. Unit Test the findIdx Function:
```javascript
it('Unit test the Array.prototype.findIdx function', done => {
        const numbers = [1,2,3,4,5];
        const expected = 2;
        expect(numbers.findIdx(val => val === 3)).to.eql(expected);

        const names = [
            {
                name: 'Marcel'
            },
            {
                name: 'Leo'
            },
            {
                name: 'Dave'
            }
        ];
        const IDX = 1;
        // TODO add assertions here:
        done();
    });
```

##### Read the chai assertion [Assertions](http://chaijs.com/api/assert)
##### Read the BDD Styles for Expect and Should [Styles](http://chaijs.com/guide/styles)


*For Unit tests I usually create 2 variables one named actual and another named expect but this is strictly up to you.*

_Expect example_
```javascript
expect(someTest).to.eql(ThisAssertion);
```

_Should example_
```javascript
foo.should.equal('bar');
```

The `Array.prototype.findIdx` function behaves in the following manner
```javascript
[{ name: 'Marcel' },{ name: 'Leo' },{ name: 'Dave' }].findIdx(function(value) {
    return value["name"] === "Leo";
});

// outputs => 1
```

### 2. Unit test the Array.prototype.findInput Function

Write a BDD Style test using the following structure in program.test.js
```javascript
it('Unit test the Array.prototype.findInput function', function(done) {
    // TODO: Finish the test here.
    done();
});
```

The `Array.prototype.findInput` function behaves in the following manner
```javascript
[{ name: 'Marcel' },{ name: 'Leo' },{ name: 'Dave' }].findInput(function(value) {
    return value["name"] === "Leo";
});

// outputs => { name: 'Leo' }
```

### 3. Unit test the Array.prototype.zip Function

Write a BDD Style Test in the TODO block in program.test.js

The `Array.prototype.zip` function behaves in the following manner
```javascript
[
    [1, 2, 3],
    ["one", "two", "three"],
    [true, false, true]
].zip();

// outputs =>
[
    [1, "one", true],
    [2, "two", false],
    [3, "three", true]
]
```

## End-to-End Testing

To view lecture notes for this course, please consult the [github-pages](https://jbelmont.github.io/software-testing).

#### Definition of End-to-End Tests via InfoQ [End-To-End-Testing](https://www.infoq.com/articles/balancing-unit-and-end-to-end-tests)
End-to-End Tests simulate user behavior. In a web application, they will start the server, fire up a browser, click around, and assert that certain things happening in the browser give us confidence our feature is working. These tests give great confidence, but they are slow, brittle, and tightly coupled to the user interface.

#### Nightwatchjs End to End Testing Library

* Nightwatch.js is a Node.js based End-to-End (E2E) testing solution for browser based apps and websites.
* It uses the powerful W3C WebDriver API to perform commands and assertions on DOM elements.
* Write End-to-End tests in Node.js quickly and effortlessly that run against a Selenium/WebDriver server.

#### WebDriver

* WebDriver is a general purpose library for automating web browsers.
* It was started as part of the Selenium project, which is a very popular and comprehensive set of tools for browser automation, initially written for Java but now with support for most programming languages.

* Nightwatch uses the WebDriver API to perform the browser automation related tasks
    * I.E. opening windows and clicking links for instance.

* WebDriver is now a W3C specification, which aims to standardize browser automation.
* WebDriver is a remote control interface that enables introspection and control of user agents.
* It provides a platform and a restful HTTP api as a way for web browsers to be remotely controlled.

[WebDriver Spec](https://www.w3.org/TR/webdriver/)


* Nightwatch works by communicating over a restful HTTP api with a WebDriver server (Selenium server).
* The restful API protocol is defined by the W3C WebDriver API.

#### Nightwatch Operations

* Nightwatch needs to send at least 2 requests to the WebDriver server in order to perform a command or assertion
    * The first request to locate an element given a CSS selector (or Xpath expression)
    * The second request to perform the actual command/assertion on the given element.

```javascript
module.exports = {
  'Code Craftsmanship Saturdays': browser => {
    browser
      .url('http://localhost:3000')
        .waitForElementVisible('.code-craftsmanship-container-label', 1000)
        .assert.containsText('.code-craftsmanship-container-label > strong', 'Code Craftsmanship Saturdays')

    browser
      .click('.users-container .users-container-trash-bin')
      .assert.elementNotPresent('[data-email="tcox0@dion.ne.jp"]')

    browser
      .click('#addSomeUserBtn')

    setInput('#emailInput', 'chuck@badass.net')
    setInput('#firstNameInput', 'Chuck')
    setInput('#lastNameInput', 'Norris')

    browser
      .click('#addUserSubmit')
      .waitForElementVisible('[data-email="chuck@badass.net"]', 1000)
      .end();

    function setInput(input, value) {
      browser.setValue(input, value);
    }
  }
};
```

Above is a sample End To End Test for Nightwatch.js

The string `Code Craftsmanship Saturdays` will be what this particular test suite will be called.

Notice that it lives in an `module.exports` object

The `browser` object has the main elements you will need for your test namely `click`,  `url`, and `assertions`

Since I only put one key there is one step to this test, I could however split this test into two parts like so

```javascript
module.exports = {
  'Load Default Screen and click trash can': browser => {
    browser
      .url('http://localhost:3000')
        .waitForElementVisible('.code-craftsmanship-container-label', 1000)
        .assert.containsText('.code-craftsmanship-container-label > strong', 'Code Craftsmanship Saturdays')

    browser
      .click('.users-container .users-container-trash-bin')
      .assert.elementNotPresent('[data-email="tcox0@dion.ne.jp"]')
  },

  'Add a User': browser => {
      browser
        .click('#addSomeUserBtn')

        setInput('#emailInput', 'chuck@badass.net')
        setInput('#firstNameInput', 'Chuck')
        setInput('#lastNameInput', 'Norris')

        browser
        .click('#addUserSubmit')
        .waitForElementVisible('[data-email="chuck@badass.net"]', 1000)
        .end();

        function setInput(input, value) {
            browser.setValue(input, value);
        }
  }
};
```

Here the End to End test has been broken into 2 steps, I could break it up further if I wanted.

`Nightwatch.js` also has lifecycle methods that you can use

```javascript
module.exports = {
  before : function(browser) {
    console.log('Setting up...');
  },

  after : function(browser) {
    console.log('Closing down...');
  },

  beforeEach : function(browser) {

  },

  afterEach : function() {

  },

  'step one' : function (browser) {
    browser
     // ...
  },

  'step two' : function (browser) {
    browser
    // ...
      .end();
  }
};
```

The goal of End to End tests are to test the behavior of your application

One thing to keep in mind is that you should not be testing edge cases with your end to end tests.

Some metrics to think about:

1. You should have many unit tests that test all the possible edge cases for each function/class.
2. Your integration tests will consequently test multiple units of work and you should have a good number of them.
3. End to End tests should really follow the happy path of a user workflow.
    1. These types of tests are more resource intensive and you should think about separating end to end tests to an additional build.
    2. Keep your first build fast by only incorporating Unit Tests
    3. Perhaps include a secondary build where you run integration tests and end to end tests.

Instructions for End To End Exercises:
1. Go to end to end tests folder `cd end-to-end-tests/nightwatch`
2. Open codeCraftsmanshipSaturdays.js.
3. Complete each todo block by adding the last part of the end to end test.
4. Run the script `npm run end:to:end:test`

[NightWatch Docs](http://nightwatchjs.org/api)

## Mocking

To view lecture notes for this course, please consult the [github-pages](https://jbelmont.github.io/software-testing).

#### Definition of Mocks via Wikipedia [Mocks](https://en.wikipedia.org/wiki/Mock_object)
In object-oriented programming, mock objects (also can be a unit of work) are simulated objects that mimic the behavior of real objects in controlled ways. A programmer typically creates a mock object to test the behavior of some other object, in much the same way that a car designer uses a crash test dummy to simulate the dynamic behavior of a human in vehicle impacts.

#### Reasons to use Mock Objects
In a unit test, mock objects can simulate the behavior of complex, real objects and are therefore useful when a real object is impractical or impossible to incorporate into a unit test. If an actual object has any of the following characteristics, it may be useful to use a mock object in its place:
the object supplies non-deterministic results (e.g. the current time or the current temperature);

**The Object has states that are difficult to create or reproduce (e.g. a network error);**
**The Object is slow (e.g. a complete database, which would have to be initialized before the test);**
**The Object does not yet exist or may change behavior;**
**The Object would have to include information and methods exclusively for testing purposes (and not for its actual task).**

#### Sinon.js Mock via explanation [Sinon Mocks](http://sinonjs.org/docs/#mocks)
Mocks (and mock expectations) are fake methods (like spies) with pre-programmed behavior (like stubs) as well as pre-programmed expectations.
A mock will fail your test if it is not used as expected.

Sinon Documentation discusses when not to use Mocks.
Mocks come with built-in expectations that may fail your test. Thus, they enforce implementation details.
**The rule of thumb is: if you wouldn’t add an assertion for some specific call, don’t mock it. Use a stub instead.**
**In general you should never have more than one mock (possibly with several expectations) in a single test.**

#### Sinon.js Stubs via explanation [Sinon Stubs](http://sinonjs.org/docs/#stubs)
Test stubs are functions (spies) with pre-programmed behavior. They support the full test spy API in addition to methods which can be used to alter the stub’s behavior.
This is a key point here as well with stubs you get the full spy api but with Mocks you don't.

#### Sinon.js Spies via explanation [Sinon Spies](http://sinonjs.org/docs/#spies)
A test spy is a function that records arguments, return value, the value of this and exception thrown (if any) for all its calls.
Test spies are useful to test both callbacks and how certain functions/methods are used throughout the system under test.

*Sinon has an assertion api that you can reference here [Sinon Assertions](http://sinonjs.org/docs/#assertions)*
*You can use either Mocha or Tape.js here it is your choice which one you feel most comfortable with.*

#### Sinon has an assertion library that you can use but I would recommend using either chai.js assertion library or should.js
* Chai.js documentation can be found here [Chai.js Assert](http://chaijs.com/api/assert/) // [Chai.js BDD](http://chaijs.com/api/bdd/)
* Should.js Assertion library can be found here [Should.js](http://shouldjs.github.io/)

**Open program.test.js in `mocks-stubs-spies` folder**

####1. Stub the `retrieveDocument` function
```javascript
function retrieveDocument({dbName, name}) {
    const couchDBName = nano.use(dbName);
    return new Promise((resolve, reject) => {
        couchDBName.get(name, (err, body) => {
            if (!err) {
                resolve(body);
            }
            reject(err);
        });
    });
}
```

You don't need the implementation here but I included it here for your reference.
Using Sinon check that the retrieveDocument stub is called once.
Make an assertion that the payload and the expected response match.

####2. Stub the `insertDocument` function.

```javascript
function insertDocument({ dbName = 'softwaretesting', name = 'users', body } = {}) {
    return new Promise((resolve, reject) => {
        const couchDBName = nano.use(dbName);
        return insertDoc({ dbName: couchDBName, name, body })
            .then(() => {
                resolve(retrieveDoc({ dbName: couchDBName , name }));
            })
            .catch(err => {
                reject(err);
            });
    });
}

function insertDoc({dbName, name, body}) {
    return new Promise((resolve, reject) => {
        dbName.insert(body, name, (err, body, header) => {
            if (!err) {
                resolve(body);
            } else {
                reject(err);
            }
        });
    });
}
```

*Again you don't need the implementation here because you are stubbing it out but I added it in case you are curious.*

* Use sinon to make some assertions about the stubbed out function
* Remember to use the setup function in tape or the before block in mocha to initialize the stub.

####3. Stub out the `deleteDocument` function

######Implementation Details
```javascript
function retrieveDoc({dbName, name}) {
    return new Promise((resolve, reject) => {
        dbName.get(name, (err, body) => {
            if (!err) {
                resolve(body);
            }
            reject(err);
        });
    });
}

function deleteDocument({dbName, name}) {
    const couchDBName = nano.use(dbName);
    return retrieveDoc({dbName: couchDBName, name})
        .then(body => {
            if (body) {
                const {
                    _rev
                } = body;
                couchDBName.destroy(name, _rev, (err, body) => {
                    if (!err) {
                        return body;
                    }
                    throw err;
                });
            }
        });
}
```

* Stub out the deleteDocument function by using sinon.
* Use chai assertions or use the should.js assertion library

## Test Fixtures

[Test Fixtures](https://en.wikipedia.org/wiki/Test_fixture)

* * A test fixture is a fixed state of a set of objects used as a baseline for running tests.
* A test fixture is something used to consistently test some item, device, or piece of software.
* Test fixtures can be found when testing electronics, software and physical devices.
* A software test fixture sets up the system for the testing process by providing the initialization code.
    * In turn satisfying whatever preconditions there may be.
    An example could be loading up a database with known parameters from a customer site before running your test.
* Ruby on Rails web framework uses YAML to initialize a database before running a test.
    * This allows for tests to be repeatable, which is one of the key features of an effective test framework

Advantages of Test Fixtures:

* Test Fixtures allow for tests to be repeatable since you start with the same setup every time.
* Test Fixtures eases test code design by allowing the developer to separate methods into different functions and reuse each function for other tests.
* Preconfigures tests into a known state at start instead of working from a previous test run.

* The purpose of a test fixture is to ensure that there is a well known and fixed environment in which tests are run so that results are repeatable.

Examples of Test Fixtures:

1. Preparation of input data and setup/creation of fake or mock objects
2. Loading a database with a specific, known set of data
3. Copying a specific known set of files creating a test fixture will create a set of objects initialized to certain states.

Open up `test-fixtures` directory and add an integration using supertest to retrieve the seeded document

## Property Based Testing

`Dijkstra's`
> Program testing can at best show the presence of errors, but never their absence

Author states that
> Thus we can expect testing to be the main form of program verification fora long time to come—it is the only practical technique in most cases

The point is made that with a CI process in place you can automate testing in your code base but there is still a dilemma on how many test cases to write.

Do you write one test case or many test cases?

> In practice, much time is devoted either to simplifying a failing case by hand, or to debugging and tracing a complex case to understand why it fails. Shrinking failing cases automates the first stage of diagnosis, and makes the step from automated testing to locating a fault very short indeed

#### Test Case Wisdom
* During regular test case scenarios in unit-testing your follow the happy path or normal path
    * This in turn forms basis for future test cases
* By generating test cases you can find bugs faster and more accuracy is what I am gleaning from the paper

* It is better to run smaller tests than large tests.
* Most errors can be found by a smaller test case.

* Developer will jump onto the first failing case
* Rerun the test case and start debugging the issue
* Test cases generated by hand are time consuming as well
* When new test cases can be generated by hand in seconds it helps reduce developer time on trivial edge cases.

### TestCheck.js

Generative property testing for JavaScript.

TestCheck.js is a library for generative testing of program properties, ala QuickCheck.

* By providing a specification of the JavaScript program in the form of properties
* Properties can be tested to remain true for a large number of randomly generated cases.
* In the case of a test failure, the smallest possible failing test case is found.


```javascript
const { check, gen, property } = require('testcheck');
const test = require('tape');

test('addition is commutative', check(gen.int, gen.int, (t, numA, numB) => {
  t.plan(1);
  t.equal(numA + numB, numB + numA)
}));
```

* Read the [Software Testing Gitbook](https://www.marcelbelmont.com/software-testing/)
* You will be able to copy and paste examples using the Gitbook

**If you like this post please star [Software Testing on Gitub](https://github.com/jbelmont/software-testing)**
