+++
draft = false
title = "Tips and Tricks With Curl and Jq"
tags = ["unix", "rest"]
date = "2018-07-22T09:13:27-04:00"
math = true
summary = """
Tips and Tricks With Curl and Jq
"""
+++

# Tips and Tricks With Curl and Jq

In this blog post we will work with Restful APIs and use jq, which is a command line processor for json. We will use curl to make Rest calls and then use jq to parse the json response into more useful information. By using jq we can do many useful transformation with json such as aggregating data like averages from a json response payload and extracting only the fields that we are interested in working with instead of an entire payload and much more.

## Prerequisites for the Blog Post

#### jq installation

To install jq please read the instructions in the [jq installation documentation](https://stedolan.github.io/jq/download/).

Mac OS X users can use [homebrew](https://brew.sh/) to install [jq](https://stedolan.github.io/jq/)

Run this command to install jq with homebrew:

```sh
brew install jq
```

#### curl installation

To install curl please read the instructions in the [curl installation documentation](https://curl.haxx.se/download.html).

Mac OS X users already have curl installed by default but can also use [homebrew](https://brew.sh/) to install [curl](https://curl.haxx.se/)

Run this command to install curl with homebrew:

```sh
brew install curl
```

## List of Public APIs

You can get a list of public apis in [Todd Motto's github repo](https://github.com/toddmotto/public-apis).
We will use some of the public apis listed in this repo.

## Using curl to make restful api calls

#### Brief description of curl

[curl](https://curl.haxx.se/) is used in command line applications or scripts to transfer data. It is used in a broad range of applications ranging from cars, tvs to audio equipment. We will be using curl to work with HTTP APIs but curl can work with many other protocols besides HTTP. 

#### Making a restful api call with curl

Let us work with the [goodreads](https://www.goodreads.com/) api to list some good book recommendations and first we need to authorize the [goodreads api](https://www.goodreads.com/api) by creating an account with goodreads or by authorizing twitter or facebook as an oauth application with the goodreads application. You will need to go the [API Key page in good reads](https://www.goodreads.com/api/keys) to register your oauth application with good reads.

###### Rest call to get the reviews for a book given a title string

We will make a rest call to the following endpoint with the goodreads api:

`GET https://www.goodreads.com/book/title.json??author=Erich+Gamma&key=hTDxFOV2GPZTzvzp4FZDlw&title=Design Patterns`

Where *format* can be either json or xml as the data-interchange format and isbn is the the ISBN of the book to lookup.

Now we will use curl in the command line to make a GET request to the goodreads api by running the following command in a command prompt or terminal application:

```bash
curl 'https://www.goodreads.com/book/title.json?author=Arthur+Conan+Doyle&key=hTDxFOV2GPZTzvzp4FZDlw&title=Hound+of+the+Baskervilles' -H 'Accept: application/json'
```

Here is json that we get back from the API:

```json
{"reviews_widget":"\u003cstyle\u003e\n  #goodreads-widget {\n    font-family: georgia, serif;\n    padding: 18px 0;\n    width:565px;\n  }\n  #goodreads-widget h1 {\n    font-weight:normal;\n    font-size: 16px;\n    border-bottom: 1px solid #BBB596;\n    margin-bottom: 0;\n  }\n  #goodreads-widget a {\n    text-decoration: none;\n    color:#660;\n  }\n  iframe{\n    background-color: #fff;\n  }\n  #goodreads-widget a:hover { text-decoration: underline; }\n  #goodreads-widget a:active {\n    color:#660;\n  }\n  #gr_footer {\n    width: 100%;\n    border-top: 1px solid #BBB596;\n    text-align: right;\n  }\n  #goodreads-widget .gr_branding{\n    color: #382110;\n    font-size: 11px;\n    text-decoration: none;\n    font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif;\n  }\n\u003c/style\u003e\n\u003cdiv id=\"goodreads-widget\"\u003e\n  \u003cdiv id=\"gr_header\"\u003e\u003ch1\u003e\u003ca rel=\"nofollow\" href=\"https://www.goodreads.com/book/show/8921.The_Hound_of_the_Baskervilles\"\u003eThe Hound of the Baskervilles Reviews\u003c/a\u003e\u003c/h1\u003e\u003c/div\u003e\n  \u003ciframe id=\"the_iframe\" src=\"https://www.goodreads.com/api/reviews_widget_iframe?did=DEVELOPER_ID\u0026amp;format=html\u0026amp;isbn=0451528018\u0026amp;links=660\u0026amp;review_back=fff\u0026amp;stars=000\u0026amp;text=000\" width=\"565\" height=\"400\" frameborder=\"0\"\u003e\u003c/iframe\u003e\n  \u003cdiv id=\"gr_footer\"\u003e\n    \u003ca class=\"gr_branding\" target=\"_blank\" rel=\"nofollow\" href=\"https://www.goodreads.com/book/show/8921.The_Hound_of_the_Baskervilles?utm_medium=api\u0026amp;utm_source=reviews_widget\"\u003eReviews from Goodreads.com\u003c/a\u003e\n  \u003c/div\u003e\n\u003c/div\u003e\n"}
```

*Notice here that the json output is not very pretty let us now use the jq command line processor to pretty print our json.*

We will now use a Unix Pipe to pipe the output of our rest call into jq which will pretty print our json by default. 

```bash
curl 'https://www.goodreads.com/book/title.json?author=Arthur+Conan+Doyle&key=hTDxFOV2GPZTzvzp4FZDlw&title=Hound+of+the+Baskervilles' -H 'Pragma: no-cache' -H 'Accept: application/json' | jq
```

Here is the output of the json using jq:

```json
{
  "reviews_widget": "<style>\n  #goodreads-widget {\n    font-family: georgia, serif;\n    padding: 18px 0;\n    width:565px;\n  }\n  #goodreads-widget h1 {\n    font-weight:normal;\n    font-size: 16px;\n    border-bottom: 1px solid #BBB596;\n    margin-bottom: 0;\n  }\n  #goodreads-widget a {\n    text-decoration: none;\n    color:#660;\n  }\n  iframe{\n    background-color: #fff;\n  }\n  #goodreads-widget a:hover { text-decoration: underline; }\n  #goodreads-widget a:active {\n    color:#660;\n  }\n  #gr_footer {\n    width: 100%;\n    border-top: 1px solid #BBB596;\n    text-align: right;\n  }\n  #goodreads-widget .gr_branding{\n    color: #382110;\n    font-size: 11px;\n    text-decoration: none;\n    font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif;\n  }\n</style>\n<div id=\"goodreads-widget\">\n  <div id=\"gr_header\"><h1><a rel=\"nofollow\" href=\"https://www.goodreads.com/book/show/8921.The_Hound_of_the_Baskervilles\">The Hound of the Baskervilles Reviews</a></h1></div>\n  <iframe id=\"the_iframe\" src=\"https://www.goodreads.com/api/reviews_widget_iframe?did=DEVELOPER_ID&amp;format=html&amp;isbn=0451528018&amp;links=660&amp;review_back=fff&amp;stars=000&amp;text=000\" width=\"565\" height=\"400\" frameborder=\"0\"></iframe>\n  <div id=\"gr_footer\">\n    <a class=\"gr_branding\" target=\"_blank\" rel=\"nofollow\" href=\"https://www.goodreads.com/book/show/8921.The_Hound_of_the_Baskervilles?utm_medium=api&amp;utm_source=reviews_widget\">Reviews from Goodreads.com</a>\n  </div>\n</div>\n"
}
```

#### POST Request with curl

Curl has many command line options for dealing with HTTP APIs and we will have a section for each option.

###### HTTP Request Option for curl

The command line option for http requests is either `-X` or `--request`.

You can find all the HTTP Verbs documented in the HTTP 1.1 specification:

* `OPTIONS`
* `PUT`
* `DELETE`
* `TRACE`
* `CONNECT`
* `GET`
* `POST`
* `HEAD`

The `PATCH` HTTP Verb came later and is documented in [RFC 5789](https://tools.ietf.org/html/rfc5789#section-1)

You can read more about this in [RFC 2616 Section 9](https://tools.ietf.org/html/rfc2616#section-9)

###### Example POST Request to CIRCLE CI API

[CIRCLE CI API V1 Reference](https://circleci.com/docs/api/v1-reference/)

We will make a POST request to Circle CI to test out a local configuration script:

```bash
curl --user ${CIRCLECI_API_TOKEN_GITHUB}: \
    --request POST \
    --form revision=7d7c87e2c35df34f74f5b0cdfc47244f296c5fed \
    --form config=@config.yml \
    --form notify=false \
    https://circleci.com/api/v1.1/project/github/packtci/go-template-example-with-circle-ci/tree/master
```

Here we are providing the option --user which takes `USER[:PASSWORD]  Server user and password`
The `--form` which takes `CONTENT  Specify HTTP multipart POST data (H)`

## Using curl and jq to parse out response payloads

#### Extract top level attribute in JSON Payload

We will now make a GET Request to the CIRCLE CI API to get information about the user and extract an attribute.

```bash
curl -X GET \
    --header "Accept: application/json" \
    "https://circleci.com/api/v1.1/me?circle-token=$CIRCLECI_PERSONAL_API_TOKEN" \
    | jq '.name'
```

Here we use the [jq](https://stedolan.github.io/jq/manual/#Basicfilters) utility to pluck out the name attribute which is a top level attribute in the response payload for the `GET` request.

#### Parse out nested attribute in big response payload

```bash
curl -X GET \
    --header "Accept: application/json" \
    "https://circleci.com/api/v1.1/recent-builds?circle-token=$CIRCLECI_PERSONAL_API_TOKEN&limit=20&offset=5" \
    | jq '.[] | .subject'
```

Here we iterate through all the elements of the array and then parse out the nested subject attribute from the response

{{< figure src="/media/jq-parse.png" >}}

#### Using jq play to interactively experiment

[jq play](https://jqplay.org/)

You can craft more complicated jq queries with ease if you use the jq playground.

{{< figure src="/media/jq-play.png" >}}

Notice in this screenshot above that we used a combination of builtin functions in jq such as:

* [select](https://stedolan.github.io/jq/manual/#Builtinoperatorsandfunctions)
* [map](https://stedolan.github.io/jq/manual/#Builtinoperatorsandfunctions)
* [length](https://stedolan.github.io/jq/manual/#Builtinoperatorsandfunctions)

Notice that we were able to use the JavaScript equivalence operator of `==` to check our condition

###### Add the jq query to our curl command

Let use add the jq query in the bottom of the screenshot to an existing curl command

```bash
#! /bin/bash

curl -X GET \
    --header "Accept: application/json" \
    "https://circleci.com/api/v1.1/recent-builds?circle-token=$CIRCLECI_PERSONAL_API_TOKEN&limit=20&offset=5" \
    | jq 'map(select(.ssh_disabled == false)) | length'
```

Notice how useful the jq playground editor is in crafting jq queries

###### Compute average build times with jq

Now let us compute the average build time in Circle CI using jq.

```bash
#! /bin/bash

curl -X GET \
    --header "Accept: application/json" \
    "https://circleci.com/api/v1.1/recent-builds?circle-token=$CIRCLECI_PERSONAL_API_TOKEN&limit=20&offset=5" \
    | jq '(reduce .[].build_time_millis as $build_time (0; . + $build_time) ) / length'
```

## Resources

* [jq manual](https://stedolan.github.io/jq/manual/)
* [jq playground](https://jqplay.org/)
* [curl book](https://ec.haxx.se/)
* [Repo](https://github.com/jbelmont/tips-and-tricks-with-curl-and-jq)

If you like this blog post then please follow me at [jbelmont at Github](https://github.com/jbelmont)