+++
draft = false
title = "Api Testing"
subtitle = ""
tags = ["rest", "testing", "postman"]
date = 2018-02-04T20:21:03-05:00
math = true
summary = """
Restful API Testing
"""
+++

# Restful API Testing

API testing is a necessary task to do while building APIs.

Instead of using a browser or typing into a UI and clicking buttons, you can test APIs using tools such as [Curl](https://curl.haxx.se/) and [Postman](https://www.getpostman.com/).

Using a Rest Client you can make Rest calls such as for [HTTP Verbs](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods) such as:

* [GET](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods)
* [POST](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods)
* [PUT](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods)
* [DELETE](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods)
* [PATCH](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods)

When we test an API, we deal with [JSON](https://en.wikipedia.org/wiki/JSON), [XML](https://en.wikipedia.org/wiki/XML), and [Web Services](https://en.wikipedia.org/wiki/Web_service).

## 3rd Party APIs

Here is a list of 3rd Party APIs:

* [Google APIs](https://developers.google.com/apis-explorer/)
* [Yahoo APIs](https://developer.yahoo.com/everything.html)
* [Facebook APIs](https://developers.facebook.com/)
* [Stripe APIs](https://stripe.com/docs/api)
* [Amazon APIs](https://developer.amazon.com/services-and-apis)
* [Walmart APIs](https://developer.walmart.com/#/home)
* [Github APIs](https://developer.github.com/v3/)

Go to [Programmable Web](https://www.programmableweb.com/) to get a complete list of 3rd Party APIs you can utilize

## Testing Restful APIs

You can utilize many different types of tools to test APIs such as:

* [Curl](https://curl.haxx.se/)
* [Postman](https://www.getpostman.com/)
* [HTTPie](https://httpie.org/)
* [Insomnia](https://insomnia.rest/)
* [Telnet](https://en.wikipedia.org/wiki/Telnet)

There are other Rest Clients you can use I just listed a few here

## Postman Rest Client Advantages

I tend to favor Rest Clients like Postman because it helps to automate testing Restful APIs if you utilize some of its advanced features

{{< figure src="/media/postman-collection.png" >}}

Notice here that you can create collection folders that can categorize APIs.

You can do much more than this however

{{< figure src="/media/header-variables.png" >}}

Notice here that `Basic {{encodeCredentials}}` has curly braces around `encodeCredentials`

In Postman you surround variables in double curly braces

{{< figure src="/media/pre-request-script.png" >}}

If you want to set variables before the HTTP call goes out than using [Pre-request Script](https://www.getpostman.com/docs/postman/scripts/pre_request_scripts) is what you want

* Pre-request scripts are snippets of code associated with a collection request that are executed before the request is sent. 

* This is perfect for use-cases like including the timestamp in the request headers or sending a random alphanumeric string in the URL parameters.

* Pre-request scripts are written in JavaScript, and the syntax is exactly like that of test scripts except that the response object is not present.

Notice here that I am using *common js* syntax in Postman and in particular `require('btoa'`)` which is using **Postman Sandbox API**

You can find a more complete list in the [Postman Sandbox API reference](https://www.getpostman.com/docs/postman/scripts/postman_sandbox_api_reference)

You can also read [Postman Sandbox](https://www.getpostman.com/docs/postman/scripts/postman_sandbox) for other libraries available in Postman Rest Client

{{< figure src="/media/test-script.png" >}}

Notice here that the Test script section is similar to Pre-Request Script

With Postman you can write and run tests for each request using the JavaScript language.

But more than that you can set variables in the Test script section that you can save for later use

Notice here the use of `postman.setEnvironmentVariable("access_token", token_type + " " + access_token);` to set **access_token**

This is really useful because we can save the **access_token** for other Rest calls

Instead of manually setting the access token in a variable each day since access tokens tend to expire quickly you can use the tests script section to do that in an automated way.

Notice that we also wrote a test in the test script section as well

```js
// Parse JSON response
var responseBody = JSON.parse(responseBody);

var access_token = responseBody.access_token;
var token_type = responseBody.token_type;

postman.setEnvironmentVariable("access_token", token_type + " " + access_token);

pm.test("Token Type is Bearer", function () {
    var jsonData = pm.response.json();
    pm.expect(jsonData.token_type).to.eql("Bearer");
});
```

{{< figure src="/media/test-results.png" >}}

Notice here we get a passing test since we got an access token from the Paypal API

{{< figure src="/media/environment.png" >}}

Notice here that we set the environment for Paypal here

Here we can use global variables that can be used per environment 

{{< figure src="/media/global-variables.png" >}}

Here I greyed out the environment variables for security reasons but you can read more about [Global Variables at Postman Docs](https://www.getpostman.com/docs/postman/environments_and_globals/manage_globals)

{{< figure src="/media/presets.png" >}}

Another useful feature in Postman is the Presets for Headers which you can read in the [Docs](https://www.getpostman.com/docs/postman/sending_api_requests/requests)

Header Presets are useful if you find yourself reusing a lot of HTTP Header values often and you can simply set a preset to autofill the HTTP headers for you in one click.

{{< figure src="/media/group-edit.png" >}}

Notice here that we can use the group edit feature to quickly set header values in key value pairs in the group edit view.

You can easily go back to the normal view by clicking `Key-Value Edit` button again.

{{< figure src="/media/http-verbs.png" >}}

Postman supports all of the HTTP Verbs in their dropdown menu

{{< figure src="/media/params.png" >}}

You can easily set query string parameters utilizing the params section in postman

{{< figure src="/media/developer-tools.png" >}}

Notice here that we can utilize developer tools in Postman.

This is useful when you want to debug the *Pre-request Script* and *Test script* sections in Postman

You can easily set `console.log` statements to debug things.

{{< figure src="/media/collection-runner.png" >}}

Notice here that we can run all of the collections utilizing the collection runner.

You can read more about the [Postman Collection Runner Here](https://www.getpostman.com/docs/postman/collection_runs/starting_a_collection_run)

You can import Postman collections easily and if you have Postman Pro account you can share collections with team members.

I covered a good amount of features that Postman offers but read the Fine docs in Postman for more information.