+++
date = "2017-08-28T12:00:00"
draft = false
tags = ["Continuous Integration", "Jenkins", "Circle CI", "Travis CI"]
title = "Continuous Integration Concepts using Travis CI, Circle CI, and Jenkins"
math = true
summary = """
Continuous Integration Concepts using Travis CI, Circle CI, and Jenkins
"""

+++

* [Continuous Integration Core Concepts](#continuous-integration)
  * [Getting Started](#getting-started)
  * [Introduction to Continuous Integration](#introduction-to-continuous-integration)
  * [Reducing Risks](#reducing-risks)
  * [Building Software with Code Changes](#building-software-with-code-changes)
  * [CI for Database Integration](#ci-for-database-integration)
  * [Continuous Testing](#continuous-testing)
  * [Continuous Inspection](#continuous-inspection)
  * [Continuous Deployment](#continuous-deployment)
  * [Continuous Feedback](#continuous-feedback)
* [Jenkins](#jenkins)
* [Travis CI](#travis-ci)
* [Circle CI](#circle-ci)

## Continuous Integration Core Concepts

Most of the notes in this section were gleaned from the [Continuous Integration Book](https://goo.gl/PRcGny)

This is a fantastic resource and full of insightful wisdom from `Steve Matyas` and `Paul M. Duvall`

#### Getting Started

Build Software at every change

###### What is a build anyway?
* A build is more than a compilation step.
    * A build can consist of a compilation step, testing, code inspection and deployment.
    * A build acts as a kind of verification step that checks that your software works as a cohesive unit.

###### CI Process Steps in a nutshell
1. Developer commits code to a version control repository like Github.
    1. The CI server is either polling the repository for changes or has a webhook on the version control system
2. Once the CI server has detected changes have occurred in the VCP (Version Control Repository)
    1. The CI server will grab the latest code from the VCP and execute some kind of build script to integrate the software.
3. The CI server will generate feedback by emailing build results to specified project members
4. The CI server will either continue polling for changes in the VCP initiate action from a push notification sent from the VCP that has a configured webhook.

#### Introduction to Continuous Integration

1. Commit Code Frequently
2. Don't Commit Broken Code
3. Fix Broken Builds Immediately
4. Write automated developer tests
5. All Tests and inspections must pass the build.
6. Developers run private builds on their machines.
7. Avoid if possible getting broken code.

###### The value of CI

* Reduce Risks
    * The health of your software becomes measurable
    * Reduce developer assumptions
        1. Don't Rely on Environment variables.
        2. Don't rely on certain configuration files set on your machine.
        3. The build is built cleanly and independently from each developer's machine.
        4. It avoid the classic phrase but it works on my machine.
* Reduce repetitive manual processes
    1. The process runs the same way every time
    2. An ordered process is followed.
        1. Compile Step
        2. Testing
        3. Reports Generated
    3. The process runs every time a commit is pushed to the version control system.
    **Frees developers to work on higher value work and reduces possible mistakes**
* Generate deployable software anytime and anywhere
* Enable better project visibility
* Establish confidence in your software with the development team

###### What prevents teams from using CI?
* Misguided belief that there is too much overheard to setting a CI process
    * Either your manual processses will control you or you can manage your CI process
    * Either way you going to have to do these things anyways

###### How to get something into CI.
* Identify a particular process that can benefit from automation.
* Write a build script that makes the process both repeatable and consistent
* Share you process by committing it into your version control system
* Make it continuous by adding it to the CI server

###### CI complements other development practices

* Developer Testing
    * Testing framework or libraries can be added to the CI server
    * Enforcing coding standards
        * The CI server can be configured to enforce coding standards
    * Refactoring can be less problematic since the CI server can report issues once code is committed.
    * Increase Software Ownership since developers can see if coding standards are being followed by generated reports from the build.

###### Commit Code Frequently

* Make small changes
    * Don't try to introduce tons of changes all at once
        * When making pull request keep them small and focused
    * Commit after each task
        * Don't have huge branches but instead focused feature branches that are not long lived

###### Don't Commit Broken Code

* Encourage developers to run a private build before committing any code to the repository
    * The build script should run all the tests and make sure nothing is broken before code is pushed.
    * The private build should mirror if possible what exists in the integration build to ensure nothing broken gets introduced to CI server.

###### Fix Broken Builds Immediately

* Don't leave the CI server broken as this can hinder other developers from working.
* Builds must be fixed as soon as possible.

###### Write Automated Developer Tests

* Builds should be fully automated
* Choose testing frameworks or libraries that provide capability of running tests in an automated fashion
* We will show this in action with jenkins and travis ci.

###### All Tests and Inspections must pass

* In a CI environment all the tests must pass
* All the inspections must pass as well
    * Linting
    * Static Analysis
    * Code Coverage Metrics
        * 75% Branching
        * 70% Function Coverage
        * 70% Line Coverage
        * 70% Condition Coverage

###### Run Private Builds

* Developers need to emulate integration builds on their development environments
* Grab the latest code from version control
* Run all the tests and inspections on their machines
* Everything should pass before pushing commits to version control

###### Avoid Getting Broken Code

* Developers should monitor the version control system and avoid if possible pulling down any broken code.
* Meanwhile whoever introduced the build failures should be alerted as soon as possible about the breaking changes and be working on fixing the build issues.

#### Reducing Risks

###### Scenarios to Combat

###### But it works on my machine

* Each developer machine should mirror as closely as possible the integration as possible
* Everything needed to build software needs to be committed to version control.
* Developers should not have build scripts that only exist on their machines

###### Syncing with the database

* Database artifacts should be in version control
* Database creation scripts, data manipulation scripts, stored procedures, database triggers etc.
    * Of course this is if you have a relational database
    * But if you have a NoSql database and a Restful API design then make sure to document endpoints
* Developers might need database specific code
    * We will visit such tests when we got to the hands on portion of the workshop

###### Missing Deployment Automation

* Deployments should be automated by using a deployment tool.
* Depending on your software architectures the deployment tools used can vary.
    * Octopus Deploy
    * AWS Elastic Beanstalk
    * Heroku
    * Google App Engine
    * Dokku
* Deployment tools is deserving of another workshop alone

###### Late Discovery of Defects

* Test code should be written for all of your source code
* Tests should be run on your build script
* Tests should be continuously run on your CI system

###### Test Coverage not known

* Use a code coverage tool to see how much your tests are actually covering your source code.
* We will look at this in more detail on the hands on portion of the workshop.

###### Lack of Project Visibility

* CI system should be configured to send alerts in multipe ways

#### Building Software With Code Changes

* Automate Builds
* Perform Single Command Builds
* Separate Builds scripts from your IDE
* Centralize Software Assets
* Create a consistent directory structure
* Builds fail fast
* Build for any environment
* Use a dedicated integration build machine
* Use a CI server
* Run Fast Builds
* Stage Builds

###### Automate Builds

What is a Software Build?

A build can consist of just compiling software components.
A build can consist of compiling and running automated tests.
The more processes you add to the build the slower the feedback loop

###### Scripting Tool

* Use a scripting tool designed specifically for building software,
    * Instead of a custom set of shell scripts or batch scripts
    * A scripting tool is the most effective maner for developing a consistent, repeatable build solution

###### Perform Single Command Builds

Quote by Martin Fowler
> Get everything you need into source control and get it so that you can build the whole system with a single command.

[Continuous Integration](https://martinfowler.com/articles/continuousIntegration.html)

###### Steps for building your software in a nutshell

1. Create your build using a scripting tool NAnt, Rake, Maven, Gulp.js
    1. Start with a simple process.
2. Add each process to integrate your software within the build script.
3. Run your script from the command line or an IDE.

**An example using Gulp.js of a build task with the build sass task**

```javascript
gulp.task('build:sass', () => gulp.src(sassPaths[0])
    .pipe(sourcemaps.init())
    .pipe(sass({
      outputStyle: 'compressed',
      includePaths: ['node_modules']
    }))
    .pipe(autoprefixer({ cascade: false }))
    .pipe(concat('advanced-tech.css'))
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('./static/build'))
    .pipe(livereload()));

gulp.task('build', (cb) => {
  runSequence('copy:react:files', 'uglify:js', 'build:js', 'build:sass', 'build:vendor:sass', cb);
});
```

###### Separate Build Scripts from Your IDE

Avoid coupling your build scripts with an IDE. A build script shouldn't be dependent on your IDE

This is important for 2 reasons:

1. Each developer may be using a different IDE/Editor and may have different configurations.
2. A CI server must execute an automated build without human intervention.

###### Centralize Software Assets

* Components such as source files or library files
* Third part components, dlls, jar files, etc
* Configuration files
* Data files to initialize the application
* Build Scripts and build environment settings
* Installation scripts for some components

**You must decide what all should go into version control**

###### Create a Consistent Directory Structure

You must choose a consistent directory structure for your software assets.
It helps perform scripted retrievals from a CI server.

Here is a sample folder structure that I typically do for my React/Redux Application.

* ca (Certificate Authority)
* config (configuration files)
* db (database related stuff)
* docs (documentation)
* images
* models (data files)
* test (All my test files)
    * unit
    * integration
    * e2e
    * helpers
* static
    * build
    * js
        * actions
        * components
        * constants
        * data
        * reducers
        * store
        * utils
    * scss
* utils (utility files)

###### Fail Builds Fast

1. Integrate Components
2. Run true unit tests
    1. Quick unit tests don't rely on a database or any other dependency they test in isolation
3. Run other automated processes (rebuild database, inspect, and deploy)

**It is up to you for any other steps**

###### Build for any Environment

You can use configuration files and environment variables to build for any environment dev/prod/test

* Logging verbosity
* Application server configuration
* Database connection information
* Framework configuration

```sh
DATABASE_NAME=advancedtech
TABLE_NAME=users
DB_PORT=28015
DB_HOST=localhost
NODE_ENV=development
```

```javascript
// Load Environment variables
require('dotenv').config();
const webpackConfig = process.env.NODE_ENV === 'development'
```

###### Build Types and Mechanisms

###### Build Types

1. The Individual
2. The Team
3. Users

###### Private Build

**Developers run private build prior to committing code to the repository.**

1. Check out the code you will alter from the repository
    1. Go into the version controlled folder or `git clone somerepo` in this step.
2. Make changes to the code.
    1. Edit myFile.js
3. Get the latest system changes from the repository.
    1. `git pull`
4. Run a build that includes execution of all your unit tests.
5. Commit your code changes to the repository.

###### Use a dedicated Integration Build Machine

Having a dedicated machine for integration build will help reduce assumptions about environment and config.
Prevents the proverbial "but it works on my machine" problem

###### Use a CI server

* Poll for changes in version control on a specified time interval
    * Github also has web hooks that you can set for Jenkins and Travis CI which will discuss in a bit
* Perform certain actions on a scheduled bases, hourly or daily
* Identify a "quiet period" during which no integration build are performed for the project
* Support for different build scripting tools such as Rake, Make, NPM, Ant, etc
* Send Emails to the concerned parties
* Display a history of previous builds
* Display a dashboard that is web accessible so that everyone can review integration build information
    * Jenkins has a dashboard as well as Travis CI
* Support multiple version control systems for your different projects
    * svn
    * git
    * mercurial

###### Manual Integration Builds

* Run a integration build manually using an automated build as an approach to reduce integration build errors

###### Run Fast Builds

* Get builds down to 10 minutes or so by increasing computing resources
* offload slower tests
* offload inspections
    * code coverage
    * static analysis
* Run staged builds
    * Run First Build that compiles and runs unit tests
    * Secondary Build runs integration and end to end tests
    * Performance builds shouldn't be run on the first build

#### CI for Database Integration

* Automate Database Integration
* Use a Local Database Sandbox
* Use a version control repository to share database assets
* Give Developers capability to modify the database
* Make DBA part of the development team

###### Automate Database Integration

Repeatable Database Integration Activities:

* Drop Database
* Create Database
* Insert System Data
* Insert Test Data
* Migrate Database and data
* Setup database instances in multiple environments
* Modify column attributes
    * this would be done for a relational database
* Modify test data
* Modify stored procedures and triggers and functions
    * this is done for relational databases like SQL Server, Oracle, MySQL, PostgresSQL, etc
* Obtain access to different environments
* Backup restore large data sets

###### Creating your database

An example of set of functions that connect to RethinkDB insert test data if necessary and retrieve data

```javascript
function dbActions() {
  return connectToRethinkDBServer()
    .then((connection) => {
      DB.connection = connection;
      return doesRethinkTableExist()
        .then(exists => exists);
    })
    .then((databaseExists) => {
      if (!databaseExists) {
        return createUsers(databaseExists)
          .then(() => createTable())
          .then(() => insertData());
      }
    })
    .then(() => checkIfTableExists()
        .then((value) => {
          if (value > 0) {
            return getUsers()
              .then(values => values);
          }
          insertData()
              .then(() => getUsers()
                  .then(values => values));
        }));
}
```

###### Manipulating your database

You can use tools/scripts to seed data into your database and to delete the database

###### Use a Local Database Sandbox

* Developers can then create a database "sandbox" to make and test database changes without affection others
* With this step it is easier for developers to recreate a database and run tests on their machines

###### Use a version control repository to share database assets

Database Assets:

* DDL (Data Definition Language) to drop and create tables and view including constraints and triggers
* Stored Procedures and Functions
    * Provided this is a relational database
    * Otherwise a set of functions or API endpoints that can manipulate data
        * `POST /api/v1/insertData` is an example endpoint to insert data
* Entity relationship diagrams
* Test data for different environments
* Specific database configurations

###### Continuous Database Integration

**Automating your database integration and incorporating into build scripts helps keep other developers in sync**

###### Give Developers the capability to modify the database

This empowers developers provided they have the expertise to do so to avoid the DBA being the bottleneck
**Word of caution with this added power comes responsibility as well on the developers side**

###### Make the DBA a part of the development team

* The DBA should be able to run the same automated build including a database rebuild that developer can do
* Make the DBA a part of the team
    * This can help integrate teams instead of create silos
    * Code goes over the wire so the speak

###### Database integration and integration

* Test your database
    * Relational Databases can be tested (PL/SQL, SQLUNIT) etc
* Inspect your database

###### Deployment

The goal of Continuous Database Integration is to treat your database source code and other source code the same.
Deployment processes will deploy your database to your development and test database instances.

###### Feedback and Documentation

* Your CI server should be communicating build status like build failure and emailing the necessary individuals.
* Documentation is important and can be part of the build status

#### Continuous Testing

###### Automate Unit Tests

* Unit tests verify the behavior of small elements in a software system which can be a single class/function
* Some unit tests will employ mocks, which are simple objects that substitute more complicated functions/classes
* Key aspect for unit tests is to have no relianze on outside dependencies like databases
    * This both increase the time to setup and run unit tests and make your code too coupled
* Unit tests can be written early in the development cycle
* Unit tests are alse an efficient way to debug while coding

Example Unit Test using Ava.js

```javascript
test('check error object from errorHandler with proper arguments', t => {
  t.plan(1);
  const foo = require('../helpers').foo();
  const actual = errorHandler.generateError({
    err: foo,
    moduleName: 'foo',
    statusCode: 'foo error'
  });
  const expected = {
    statusCode: 'foo error',
    message: 'Foo Error: Foo',
    errorLineAndColumn: 'foo:4:10)'
  };
  t.deepEqual(actual, expected, `should return ${expected}`);
});
```

###### Automate Component Tests

* Component/Integration/Subsystem tests verify portions of a system
    * May require fully installed system or external dependencies
        * Databases
        * file systems
        * network endpoints
* Integration tests are usually longer running tests than Unit Tests

Example Integration Test using Ava.js, Supertest and Nock

```javascript
let postScope, payload, deleteScope;
test.before(() => {
  const requestGetHeaders = {
    reqheaders: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }
  };

  payload = {
    'user': {
      'email': 'bigkahuna@surfsup.com',
      'first_name': 'Big',
      'gender': 'Male',
      'id': 57,
      'last_name': 'Kahuna'
    }
  };

  postScope = nock(requestURL, requestGetHeaders)
              .get(addUserUrl)
              .reply(201, payload);

  deleteScope = nock(requestURL)
                .delete(removeUserUrl)
                .reply(204);
});

test.after('cleanup', () => {
  nock.cleanAll();
});

test.cb('add user url should return 201 response and the newly added user', t => {
  t.plan(3);
  const created = responseCodes['created'];
  const req = request.agent(requestURL);
  req
    .get(addUserUrl)
      .set({
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      })
      .expect(res => {
        t.is(res.status, created, '201 Status Code should be returned');
        t.deepEqual(res.body, payload);
      })
      .end(() => {
        t.is(postScope.isDone(), true, `POST ${addUserUrl} Nock Spy called`);
        t.end();
      });
});
```

* Integration level tests typically use more dependencies than unit tests
    * Integration tests don't use as many dependencies as a System Test though

###### Automate functional tests

* Functional tests can be automated using tools like Selenium and nightwatchjs
* Functional tests operate froma user's perspective and are typically the longest running tests in your test suite

###### Automate System Tests

* System tests are longer to run than integration/component tests and usually involve multiple components

###### Categorize Developer Tests

* By categorizing your tests into distinct "buckets" you can run slower running tests
    * at different intervals in your automated test suite

###### Run faster tests first

* Run your unit tests prior to running component, system, and functional tests.
* Make sure to categorize your tests

###### Write Tests for Defects

* Increase your code coverage by writing tests based on new defects
    * Ensure that the defect does not surface again.
    * This is also known as a regression test case

###### Make Component Tests Repeatable

* Use database testing frameworks to make certain that the data is at a "known" state
    * This helps make Integration Tests repeatable

###### Limit Test Case assertions if possible

* Spend less time tracking down the cause of a test failure by limiting your automated tests to 1 to 3 assertions

#### Continuous Inspection

* [Definition of Cyclomatic Complexity](#definition-of-cyclomatic-complexity)
* [Reduce Code Complexity](#reduce-code-complexity)
* [Dynamic Link Libraries and Shared Libraries](#dynamic-link-libraries-and-shared-libraries)
* [Perform Design Reviews Continuously](#perform-design-reviews-continuously)
* [Maintain Organizational Standards with Code Audits](#maintain-organizational-standards-with-code-audits)
* [Reduce Duplicate Code](#reduce-duplicate-code)
* [Assess Code Coverage](#assess-code-coverage)

###### Definition of Cyclomatic Complexity

[Cyclomatic Complexity](https://en.wikipedia.org/wiki/Cyclomatic_complexity)
* Cyclomatic complexity is a software metric (measurement), used to indicate the complexity of a program.
* It is a quantitative measure of the number of linearly independent paths through a program's source code.

###### Reduce Code Complexity

* Reduce cyclomatic complexity in your code base by leveraging automated inspectors
    * JavaScript
        * Eslint is a Linter but can do cyclomatic analysis to a degree
        * Google Closure Compiler
    * Java
        * CheckStyle
        * PMD
    * .NET
        * FxCop
        * NDepend
* Static Analyzers can identify areas of your code with higher complexity.
* Run these inspectors from your automated build.

###### Dynamic Link Libraries and Shared Libraries

* During a compilation process several types of assemblies can be produced
    * An executable file (*.exe, a binary file)
    * A dynamic link library file (*.dll)
        * Basic a Shared Library
    * A lib is a unit of code that is bundled within your application executable.

###### Perform Design Reviews Continuously

* Use tools that can help find assemblies that are highly dependent on other packages and lead to brittle architecture

###### Maintain Organizational Standards with Code Audits

* Reduce the amount of duplicate code in a code base through special tools
* Tools can pinpoint areas of higher code duplication based on custom thresholds
* Use tools like this for targeted refactorings

###### Assess Code Coverage

Typical Metrics by Code Coverage Tools like Istanbul

* Statements: How many of the statements in you code are executed.
* Branches: Conditional statements create branches of code which may not be executed (e.g. if/else).
    * This metric tells you how many of your branches have been executed.
* Functions: The proportion of the functions you have defined which have been called.
* Lines: The proportion of lines of code which have been executed.

These metrics can help identify areas of your code base that need more tests.

#### Continuous Deployment

* [Release Working Software at Anytime](#release-working-software-at-anytime)
* [Run all tests](#run-all-tests)
* [Label a Repository's Assets](#label-a-repository\'s-assets)
* [Create Build Feedback Reports](#create-build-feedback-reports)
* [Produce a clean environment](#produce-a-clean-environment)
* [Possess Capability to Roll Back Release](#possess-capability-to-roll-back-release)
* [Label Each Build](#label-each-build)

###### Release Working Software at Anytime

* Run a fully automated build including compilation, all tests, inspections, packaging and deployment
    * This gives you the capability to release working software at any time and in a know n environment

###### Run all tests

* Run all tests for your software
* Includes Unit, Integration, System, Functional, Performance, Load, Smoke and any others
* Running all the tests ensure your software is ready to be delivered

###### Label a Repository's Assets

* Label the files for your project in version control
* This can be performed after a project mileston
    * For example in Git you can tag every release

###### Create Build Feedback Reports

* List the changes that were made in recent builds.
* This can be useful for other teams in the delivery process, such as QA.

###### Produce a clean environment

* Remove all files, configuration changes, servers from your integration build machine
    * This ensures you can rebuild back to a state where your integration build is successful
* The more scripted your build process is the better overall

###### Possess capability to roll back release

* Things go wrong during software development
* Use build labels to roll back any changes to get your software back to working state

###### Label Each Build

* Label the binary artifacts of a build distribution in version control

#### Continuous Feedback

###### The Right Information

* With automated build process you can determine the right information to be given to the right people
* Build status information like you can add to github/bitbucket are good build indicators

###### The Right People

* Make sure that the right information goes to the right people
* Different people require different information
* Don't flood people with irrelevant information they will soon ignore them
* CI helps get the right information to the right people

###### The Right Time

* Information that is old is not useful, if the build is broken you need to get notified immediately
* More time between defects will further gap that developers have for each particular software componet
    * Do you really remember what you did 2 months ago, 2 weeks ago?

###### The Right Way

* The right way is choosing the most appropriate communication mechanism
* How to present said information and to whom

###### Use Continuous Feedback Mechanisms

* Email
* SMS (Text messages)
* Ambient Org, Lights
* Wide Screen Monitors

## Jenkins

* Jenkins is a self-contained, open source automation server which can be used to automate all sorts of tasks
    * Building, testing, and deploying software.
* Jenkins can be installed through native system packages, Docker,
* Jenkins can be run standalone by any machine with the Java Runtime Environment installed.

#### Getting Started

1. [Jenkins Download](https://jenkins.io/doc/)
  1. Install with `homebrew` with the command `brew install jenkins`
  2. Run `jenkins` in the terminal
  3. Run `brew services start jenkins` in order to have Jenkins run on login 
2. Open up a browser at [Localhost](http://localhost:8080)
  1. {{< figure src="/media/unlock-jenkins.png" >}}
  2. Enter Password from the command `cat /Users/Shared/Jenkins/Home/secrets/initialAdminPassword` and copy the password
  3. Click Continue
  4. {{< figure src="/media/install-plugins.png" >}}
  5. Click `Select Plugins to Install`
  6. Search for node.js in list of plugins and click the checkbox
  7. {{< figure src="/media/add-plugins.png" >}}
  8. Click Install
  9. Wait for the installation to complete
  10. {{< figure src="/media/create-user.png" >}}
  11. Click `Save and Finish`
  12. {{< figure src="/media/jenkins-is-ready.png" >}}
  13. Click `Start using Jenkins`
  14. {{< figure src="/media/initial-screen.png" >}}
  15. Click `New Item`
  16. {{< figure src="/media/add-new-item.png" >}}
  17. Enter a name for your first build
  18. Click `Freestyle project`
  19. {{< figure src="/media/configure-build.png" >}}
  20. Fill out sections where appropriate.
    1. Enter a `Repository URL`
    2. Specify whether you want to poll or if you would like to use web hook.
      1. If you specify polling you need to use crontab syntax `H */5 * * *` which runs every 5 hours
      2. {{< figure src="/media/github-webhook.png" >}}
      3. Click Add Service and type in `Jenkins` in the input box
    3. Click Execute Shell
      1. Enter script that you would like to run
      2. In my case the following:
        1. `npm install && npm test`
      3. Keep in mind your script can be whatever you need it to be
      4. It is running a bash environment
    4. Click `Build Now` to have your first build run
    5. {{< figure src="/media/first-build.png" >}}
    6. Click on the Build Number
    7. {{< figure src="/media/build-screen.png" >}}
    8. Click on `Console Output` in order to get details of the script
    9. In case a build fails there is where you want to go to.
    10. You can add Post Build Sections
    11. {{< figure src="/media/manage-jenkins.png" >}}
    12. Click `Manage Jenkins` and then Click `Manage Plugins`
    13. Enter the `Cobertura` Plugin from the `available` tab
    14. Make sure to check Restart so that the plugin is available
    15. Click `Configure` and click on `Post-build Actions`
    16. {{< figure src="/media/add-post-build-section.png" >}}
    17. Click on `Publish Cobertura Coverage Report`
    18. Add path to the report which in my case is `coverage/cobertura-coverage.xml`
    19. Click `Build Now`
    20. Once build finished you should see a new section for code coverage
    21. {{< figure src="/media/code-coverage.png" >}}

Go to the Continuous Integration Repo to setup your own private build [Here](https://github.com/jbelmont/continuous-integration-with-jenkins-travis-and-circleci)

## Travis CI

* Run the command `touch .travis.yml` in the terminal

#### Sample Travis yml script

```yml
dist: trusty
sudo: required
language: node_js
node_js:
  - 6
env:
  - NODE_ENV=test
addons:
  rethinkdb: '2.3.5'
  sources:
    - google-chrome
  apt:
    packages:
      - oracle-java8-installer
      - oracle-java8-set-default
      - google-chrome-stable
before_script:
  - export CHROME_BIN=chromium-browser
  - "export DISPLAY=:99.0"
  - "sh -e /etc/init.d/xvfb start"
  - sleep 3
after_success:
  - npm run coveralls
  - npm run build && npm run e2e
```

#### Integrate Travis CI with Github

* Click settings on your repo
* Click Integrations & Services
* Add a Service
* Type in Travis
* Click Add Service
* Now Travis CI is configured as webhook when you push onto master

#### Visit Travis CI

* Enable your Public Github Repos
    * Authorize Github Access for Travis CI
    * Toggle each repo that you want to have Travis CI enabled

1. Create a Github Account [HERE](https://github.com/)
2. {{< figure src="/media/github.png" >}}
3. Sign Up for Travis CI [HERE](https://travis-ci.org/)
4. {{< figure src="/media/travis-ci-signup.png" >}}
5. Then Click `Sign in With Github` button
6. {{< figure src="/media/toggle-repo.png" >}}
7. Authorize Github Access for Travis CI
8. Click on your profile on the top right of page
9. Search for your repo and toggle the check mark to turn on travis ci
10. Travel to Travis CI Builds [Here](https://travis-ci.org/jbelmont/)
  1. This goes to my travis ci builds
  2. Click on the build you want for example I clicked on the following build
  3. {{< figure src="/media/travis-ci-build.png" >}}
  4. Notice that the log has several stages:
    1. Worker Information
    2. Build system information
    3. and more
    4. Everything is designated by the `.travis.yml` file
    5. Notice the code coverage run in the build
    6. {{< figure src="/media/coverage.png" >}}
    7. This output can be seen in the `Travis Logs`

#### Read Documentation

[Travis CI Documentation](https://docs.travis-ci.com/)

* Read [Getting Started](https://docs.travis-ci.com/user/getting-started/) for your given programming language
* Read [Customizing the Build](https://docs.travis-ci.com/user/customizing-the-build/) to setup lifecycle hooks like code coverage and more

#### YML configuration

###### YML Tutorial

```yml
The `docker-compose.yml` file is a [YAML](http://yaml.org/) file defining [services](https://docs.docker.com/compose/compose-file/#service-configuration-reference), [networks](https://docs.docker.com/compose/compose-file/#network-configuration-reference) and [volumes](https://docs.docker.com/compose/compose-file/#volume-configuration-reference). The default path for a Compose file is `./docker-compose.yml`.


## Key-value pairs (Scalars)

* YAML keeps data stored as a map containing keys and values associated to those keys.
* This map is in no particular order, so you can reorder it at will. Each pair is in the format KEY: VALUE. 

 For example:

```json
name: 'John J'
age: 32
```

* Note the 'quotes' around the value. When the value is a text string
* The quotes are used to make sure any special characters are not given special meaning
* Instead all the values in quote are the value.
* So even though they are optional, using them is highly recommended.

YAML will consider that lines prefixed with more spaces than the parent key are contained inside it;
Moreover, all lines must be prefixed with the same amount of spaces to belong to the same map. So this works:

```yml
prop:
    subprop:
        value: '(%person%) %name%'
        value2: '* %fruit% %rank%'
```

Alternative:

```yml
prop:
        subprop:
                    value: '(%person%) %name%'
                    value2: '* %fruit% %rank%'
```

This example won't work:

```yml
formatting:
from-game:
chat: '(%sender%) %message%'
action: '* %sender% %message%'
```

#### Alternative YAML format

YAML supports an alternative syntax to store key-value maps, useful for compressing small maps into a single line.

The syntax is: {KEY: VALUE, KEY: VALUE, ...}. The above example would become:

```yml
formatting: {from-game: {chat: '(%sender%) %message%', action: '* %sender% %message%'}}
```

#### Lists

* Lists are used to store a collection of ordered values.
* The values are not associated with a key
* only with a positional index obtained from the order in which they are specified (item 1, item 2, etc.)

#### Block Sequences

```yml
- 'item 1'
- 'item 2'
```

#### Inline Sequences

```yml
items: ['item 1', 'item 2']
```

You can have:
* Maps inside maps
* Lists inside maps
* Maps inside lists

#### Anchors

```yml
item:
  - method: UPDATE
    where: &FREE_ITEMS
      - Some Coat
      - Dress Shoes
    SellPrice: 1.5
    BuyPrice: 2.5

stuff:
  - method: MERGE
    item-merge: {name: Some Value Here}
    items: *FREE_ITEMS
```

* Any YAML node can be anchored and referenced elsewhere as an alias node.
* To anchor a particular value or set of values, use ``&name of anchor``.
* To reference an anchor, use ``*name of anchor``.

## Circle CI

[Circle CI](https://circleci.com/)

* Click Sign Up For Free
* {{< figure src="/media/circle-ci-signup.png" >}}
* Authorize Github access for Circle CI
* {{< figure src="/media/switch-org.png" >}}
* Here I click on my personal github username `jbelmont`
* Toggle each repo that you want Circle CI to have access to

#### Setup Circle CI yml for version 2

* Run `mkdir .circleci` at the root of your repository
* Run `touch .circleci/config.yml` at the root of your repository
* These instructions are to setup circle ci version 2

* Run `touch circle.yml` for version 1

## Sample config.yml

```yml
version: 2
jobs:
  build:
    docker:
      - image: node:7.6.0
      - image: openjdk:8
    working_directory: ~/code-craftsmanship-organization/continuous-integration-with-jenkins-travis-and-circleci
    steps:
      - checkout
      - run:
          name: Pre-Dependencies
          command: mkdir -p ~/code-craftsmanship-organization/continuous-integration-with-jenkins-travis-and-circleci/artifacts
      - run:
          name: Install RethinkDB
          command: |
            apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 68576280 86E50310
            echo "deb http://download.rethinkdb.com/apt jessie main" | tee /etc/apt/sources.list.d/rethinkdb.list
            wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -
            apt-get -y update -qq
            apt-get -y install rethinkdb
      - run:
          name: Install Latest Chrome
          command: bash scripts/get-latest-chrome.sh
      - run:
          name: Install Dependencies
          command: npm install
      - run:
          name: NPM Test
          command: npm test
      - run:
          name: Build Directory
          command: npm run build
      - run:
          name: Start RethinkDB
          command: rethinkdb --bind all --http-port 9090
          background: true
      - run:
          name: Run End To End Tests
          command: npm run e2e
      - store_artifacts:
          path: ~/code-craftsmanship-organization/continuous-integration-with-jenkins-travis-and-circleci/artifacts
      - add_ssh_keys
```

#### Integrate Circle CI with Github

* Click settings on your repo
* Click Integrations & Services
* Add a Service
* Type in Circle
* Click Add Service
* Now Circle CI is configured as webhook when you push onto master
* {{< figure src="/media/circle-ci-webhook.png" >}}

#### Check status of your build

* {{< figure src="/media/list-of-builds.png" >}}
* Click into a specific build
* {{< figure src="/media/specific-build.png" >}}
* Notice here that the build lists each step and they all come from the steps you list in `config.yml`

#### Read Docs for Circle CI

* Read [Circle CI Documentation v2](https://circleci.com/docs/2.0/)
* Read [Circle CI Documentation v1](https://circleci.com/docs/1.0/)