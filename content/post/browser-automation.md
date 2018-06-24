+++
draft = false
title = "Browser Automation"
tags = ["testing", "e2e", "automation"]
date = "2018-06-24T12:00:00"
math = true
summary = """
End to End Testing with Cypress.io and Puppeteer
"""
+++

In this blog post we will look at cypress.io and puppeteer as viable replacements to Selenium WebDriver. Selenium WebDriver is still a good option for writing End to End Tests but over the years some newer libraries have spawned that use Chrome DevTools Protocol or to be more specific use Chrome to UI Tests.

## Selenium WebDriver

Selenium WebDriver has been in use for a long while and Selenium WebDriver drives the browser by utilizing an Object Oriented API that is built in Java. Selenium has client apis in Java, C#, Ruby, Python, and JavaScript. 

#### Some Drawbacks to Selenium

* End to End tests written in Selenium tend to be brittle
* Setup can be very complicated
* Tests can be really slow as each tests spins up a browser instance.

## Options to Selenium

There are other options instead of Selenium now and in this blog post we will examine [Puppeteer](https://pptr.dev/#?product=Puppeteer&version=v1.5.0&show=api-overview) and [Cypress.io](https://docs.cypress.io/guides/overview/why-cypress.html) in detail.

## Puppeteer

Puppeteer is a Node library which provides a high-level API to control Chromium or Chrome over the DevTools Protocol. Puppeteer is relatively new as it was released in 2017 as an open source project by a Googler. Puppeteer is a good option to replace [Phantomjs](http://phantomjs.org/) which has been suspended from further development.

#### Advantages of Puppeteer

* Puppeteer has support for parallelization for running tests in a CI Build

* Spawn multiple browser sessions to help simulate load that a particular service may encounter with multiple clients

* Record snapshots of tests while they run

#### Setup Puppeteer

Installing [Puppeteer](https://pptr.dev/) is easy as you can just use npm to install it.

`npm install --save-dev puppeteer`

After you have installed puppeteer onto your project the next thing to do is to require puppeteer and to use the puppeteer api to launch a Chrome browser and run your tests.

#### Puppeteer Usage Requirements

Puppeteer can work with Node v6.4.0 or greater but most of the examples in Puppeteer use async and await which is only supported in Node v7.6.0 or greater. So consider adding this to your package.json.

```json
"engines": {
  "node": ">=7.6.0"
}
```

*This will ensure that only node version 7.6.0 or greater is used*

#### Puppeteer Example

```js
const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('https://marcelbelmont.com');
  await page.screenshot({path: 'blog.png'});

  await browser.close();
})();
```

Notice that in the code snippet above we are using async and await in node.js. Take note that async and await are a way to deal with asynchronous action in JavaScript. It is a nicer way to work with asynchronous code over callbacks and promises.

#### Adding a Web Scraping Test with Jest

We will be writing a test with the [Jest Testing Library](https://facebook.github.io/jest/) by Facebook and using Puppeteer.

In order to install jest run `npm install --save-dev jest`

Jest has mocha like syntax and can be used with many different types of FrontEnd Libraries.

For the purposes of this blog post we will simply be using to write node.js code.

###### Code Snippet with Blog Test

```js
"use strict";

const puppeteer = require("puppeteer");

let page;
let browser;
const webpage = "https://github.com/GoogleChrome/puppeteer";
const width = 1440;
const height = 900;
const myBlog = "blog.png"

describe("Scrape the Puppeteer github repository", () => {

  beforeAll(async () => {
    browser = await puppeteer.launch({
      headless: true,
      args: ["--no-sandbox", "--disable-setuid-sandbox"]
    });
    page = await browser.newPage();
    await page.setViewport({ width, height });
  });

  afterAll(async () => {
    await page.screenshot({path: myBlog});
    browser.close();
  });

  it("Should have a list of uls for features in Puppeteer", async () => {
    await page.goto(webpage);
    const textContent = await page.evaluate(() => document.querySelector('.markdown-body.entry-content blockquote p').textContent);
    expect(textContent).toEqual("Puppeteer is a Node library which provides a high-level API to control headless Chrome or Chromium over the DevTools Protocol. It can also be configured to use full (non-headless) Chrome or Chromium.");
  });
});
```

Notice that in this code snippet we are writing a test that launches puppeteer and then uses the Puppeteer api to navigate to Puppeteer github repository and web scrape the offical quote for Puppeteer.

The Puppeteer api is very intuitive to use as the code is almost self documenting.

Using async and await features makes writing this test very nice!!

###### Output of running test

In the scripts section of your package.json file and the following entry:

```json
"scripts": {
  "test": "jest"
}
```

Now all you have to do is run `npm test` and the test will run and you will get output in your Terminal and or Command Shell in Windows.

{{< figure src="/media/puppeteer-console-log.png" >}}

## Cypress.io 

Next we will look at the [Cypress.io Testing Library](https://docs.cypress.io/guides/overview/why-cypress.html#) which is a newer testing tool that has some exciting features.

Cypress also uses node.js and can be installed with npm

#### Advantages of Cypress.io

[Key Differences in Cypress.io](https://docs.cypress.io/guides/overview/key-differences.html#Architecture)

> Most testing tools (like Selenium) operate by running outside of the browser and executing remote commands across the network. Cypress is the exact opposite. Cypress is executed in the same run loop as your application.

> Behind Cypress is a Node.js server process. Cypress and the Node.js process constantly communicate, synchronize, and perform tasks on behalf of each other. Having access to both parts (front and back) gives us the ability to respond to your application’s events in real time, while at the same time work outside of the browser for tasks that require a higher privilege.

> Cypress also operates at the network layer by reading and altering web traffic on the fly. This enables Cypress to not only modify everything coming in and out of the browser, but also to change code that may interfere with its ability to automate the browser.

> Cypress ultimately controls the entire automation process from top to bottom, which puts it in the unique position of being able to understand everything happening in and outside of the browser. This means Cypress is capable of delivering more consistent results than any other testing tool.

> Because Cypress is installed locally on your machine, it can additionally tap into the operating system for automation tasks. This makes performing tasks such as taking screenshots, recording videos, general file system operations and network operations possible.

#### Setup Cypress.io

Installing [Cypress.io](https://docs.cypress.io/guides/getting-started/installing-cypress.html) is easy as all you have to do is run `npm install --save-dev cypress`

Once you have installed Cypress.io all you have to do is require it and then start writing your tests.

#### Cypress.io Usage Requirements

Cypress is a desktop application that is installed on your computer. 

The desktop application supports these operating systems:

* Mac OS 10.9+ (Mavericks+), only 64bit binaries are provided for macOS.

* Linux Ubuntu 12.04+, Fedora 21, Debian 8

* Windows 7+, only 32bit binaries are provided for Windows.

#### Cypress.io Example

```js
describe('My First Test', function() {
  it('Does not do much!', function() {
    expect(true).to.equal(true)
  })
})
```

This code snippet above has a mocha like syntax and running it is very easy

###### Running Cypress Tests

Add the following entry into the scripts section of your package.json file:

```json
"scripts": {
  "cypress:open": "cypress open"
}
```

Now all you have to do to run the test file is to execute the command like this:

`npm run cypress:open` and this will open desktop application and run any of your tests

#### Writing a Test that will Web Scrape my github repository

Let us now write a test in Cypress.io that will Web Scrape my github repository called browser automation.

```js
"use strict";

const url = "https://github.com/jbelmont/browser-automation"

describe("Web Scraping", function() {
    it("Visits the browser-automation repository", function() {
        cy.visit(url);

        cy
        .get(".markdown-body.entry-content h1")
        .should("contain", "browser-automation");
    });
});
```

Notice the conciseness in the syntax for Cypress you say you want to visit provided url and then use get to get the dom node and make your assertion.

The DOM Manipulation code that you have to write is abstracted away for you with the nice Cypress.io api.

###### Output of Running Desktop Application for Cypress

In the screenshot below we have a running Desktop application for Cypress.io which opened after we gave command `npm run cypress:open` in the terminal.

{{< figure src="/media/cypress-desktop-running.png" >}}

Notice that in the screenshot we have blog_spec.js at the top.

In order for your tests to run in Cypress.io you will need to add them into `cypress/integration` folder which is automatically created with examples when you first open Cypress.

While the desktop client is running it will watch for file changes and update in real time.

If we click the the entry *blog_spec.js* it will start running our tests in Cypress.io

{{< figure src="/media/cypress-test-running.png" >}}

Notice that the Cypress Desktop Application has our test results and visually shows us the web page that we are visiting.

#### Thoughts on Cypress.io and Puppeteer

I believe that both Cypress.io and Puppeteer are great options to using Selenium. I would say that Cypress.io has many compelling features and the Desktop Client is a joy to use.

If you would like to look at the [browser-automation repository go here](https://github.com/jbelmont/browser-automation)

If you like this blog post then please follow me at [jbelmont at Github](https://github.com/jbelmont)