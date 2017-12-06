+++
draft = false
title = "Page Object Pattern"
subtitle = ""
tags = ["e2e", "testing", "page objects"]
date = 2017-12-06T10:09:18-05:00
math = true
summary = """
A Look at the Page Object Pattern
"""
+++

# Page Objects

## What are Page Objects?

[Page Object Blog Post by Martin Fowler](https://martinfowler.com/bliki/PageObject.html)

> A page object wraps an HTML page, or fragment, with an application-specific API, allowing you to manipulate page elements without digging around in the HTML.

Page objects are a way to describe UI interactions in your page with application specific terminology instead of HTML specific language.

This in turn helps you write tests that are more clear and also helps you be more dry (Don't Repeat yourself) because you can reuse your page objects in other acceptance/end-to-end tests

## Normal HTML Page Structure

```html
<div class="page__container">
    <ul class="page_container-list">
        <li>John Rambo</li>
        <li>Chuck Norris</li>
        <li>John Shaft</li>
    </ul>
</div>
```

Here using ember acceptance testing syntax we can grab the list of names: `find('.page_container-list')`

The problem with this is that it is not as descriptive as it could be

## Page Object Pattern

Here is a sample Page Object:

```js
const usersList = {
    actionHeroes() {
        return find('.page_container-list');
    }
};
```

Now we can grab the list of action heroes like this: `usersList.actionHeroes()`

Suppose we wanted to get the total count of action heroes, we could use the ember acceptance testing syntax as follows:

```js
find('.page_container-list').length
```

but instead we can create a function that returns the total count of superheroes using Page Object Design Pattern like this:

```js
const usersList = {
    actionHeroes() {
        return find('.page_container-list');
    },
    totalNumberOfActionHeroes() {
        return find('.page_container-list').length;
    }
};
```

so now using our Page Object pattern we can grab the list of superheroes as follows: `usersList.totalNumberOfActionHeroes();` which is more descriptive.

**Additionally this helps make our acceptance tests more reusable**

## Page Object Methods

Page Objects can also contain UI interaction flows.

For example:

Say User A logs into your app and then wants to go to his settings page to update his login information.

Using the Page Object Pattern we can construct the following Page Object:

```js
const UserLogin = {
    login({
        username,
        password
    }) {
        return authenticateToSystem(username, password);
    },
    visitSettings() {
        return visit('/settings');
    }
}
```

Now we can just do `UserLogin.login('jbelmont', 'somepassword').visitSettings();` and both login and go to the User Settings Page.

#### Page Object Method Scenario

Say that we want to update the username of a specific user in a possible admin list

Using Page Object pattern we could do the following:

```js
const AdminPage = {
    login({
        username,
        password
    }) {
        return authenticateToSystem(username, password);
    },
    visitAdmin(adminToken) {
        return visit(adminToken, '/admin');
    },
    updateAdminUsername(username) {
        this._setInput(username);
        this._saveUsername(adminToken, username);
    },
    _setInput(newUserName) {
        document.querySelector('.admin__input').value = newUserName;
    },
    _saveUsername(adminToken, username) {
        db.saveNewUsername(adminToken, username);
    }
}
```

Now with this possible Page Object we could do the following: 

```js
AdminPage
    .login({
        username: 'cnorris',
        password: 'highkicker'
    })
    visitAdmin('someAdminToken1234')
    .updateAdminUsername('jrambo', 'someAdminToken1234');
```

Although this a contrived example and not necessarily a secure way to update a username, it does illustrate the power of Page Objects!

## Page Object Libraries

End to end testing libraries tend to have a page object pattern that is baked into them.

Here is a list of End to End Testing libraries that have them:

* [Nightwatchjs Page Object API](https://github.com/nightwatchjs/nightwatch/wiki/Page-Object-API)
* [Webdriverio Page Object](http://webdriver.io/guide/testrunner/pageobjects.html)
* [Selenium Page Objects](https://github.com/SeleniumHQ/selenium/wiki/PageObjects)

If you like this post then follow me at [jbelmont at github](https://github.com/jbelmont)