+++
title = "Using Lucene Queries"
date = "2019-05-24T20:20:59-04:00"
draft = false
math = true
tags = ["lucene","apache"]
summary = """
Using Apache Lucene Query Syntax
"""
+++

# Apache Lucene

[Apache Lucene Wikipedia](https://en.wikipedia.org/wiki/Apache_Lucene)

> Apache Lucene is a free and open-source information retrieval software library, originally written completely in Java by Doug Cutting. It is supported by the Apache Software Foundation and is released under the Apache Software License.

## Common Uses and Features of Lucene

[Features and Common Use](https://en.wikipedia.org/wiki/Apache_Lucene#Features_and_common_use)

> While suitable for any application that requires full text indexing and searching capability, Lucene has been widely recognized for its utility in the implementation of Internet search engines and local, single-site searching.

> Lucene includes a feature to perform a fuzzy search based on edit distance.

> Lucene has also been used to implement recommendation systems. For example, Lucene's 'MoreLikeThis' Class can generate recommendations for similar documents. In a comparison of the term vector-based similarity approach of 'MoreLikeThis' with citation-based document similarity measures, such as Co-citation and Co-citation Proximity Analysis Lucene's approach excelled at recommending documents with very similar structural characteristics and more narrow relatedness. In contrast, citation-based document similarity measures tended to be more suitable for recommending more broadly related documents, meaning citation-based approaches may be more suitable for generating serendipitous recommendations, as long as documents to be recommended contain in-text citations.

> At the core of Lucene's logical architecture is the idea of a document containing fields of text. This flexibility allows Lucene's API (Application Programming Interface) to be independent of the file format. Text from PDFs, HTML, Microsoft Word, Mind Maps, and OpenDocument documents, as well as many others (except images), can all be indexed as long as their textual information can be extracted.

## Lucene-based projects

[Lucene-based projects](https://en.wikipedia.org/wiki/Apache_Lucene#Lucene-based_projects)

* Apache Nutch — provides web crawling and HTML parsing[citation needed]

* Apache Solr — an enterprise search server.

* Compass — the predecessor to Elasticsearch

* CrateDB — open source, distributed SQL database built on Lucene 

* DocFetcher — a multiplatform desktop search application

* Elasticsearch — an enterprise search server released in 2010.

* Kinosearch — a search engine written in Perl and C and a loose port of Lucene. The Socialtext wiki software uses this search engine, and so does the MojoMojo wiki. It is also used by the Human 
Metabolome Database (HMDB) and the Toxin and Toxin-Target Database (T3DB).

* Swiftype — an enterprise search startup based on Lucene.

#### Lucene Queries in Action

We will look at using lucene queries with Auth0 apis and we will use curl and bash to make rest calls.

Here is a bash script that gets API Token from Auth0 Management API and then uses user search api:

{{< highlight bash >}}
#! /usr/local/bin/bash

TOKEN=$(curl \
    --silent \
    --request POST \
    --url "$PERSONAL_AUTH0_DOMAIN/oauth/token" \
    --header 'content-type: application/x-www-form-urlencoded' \
    --data "audience=$PERSONAL_AUTH0_AUDIENCE&grant_type=client_credentials&client_id=$PERSONAL_AUTH0_CLIENTID&client_secret=$PERSONAL_AUTH0_CLIENT_SECRET" \
    | jq '.access_token' | sed 's/^"//g;s/"$//g')

curl --request GET \
    --url "$PERSONAL_AUTH0_DOMAIN/api/v2/users?q=name:jean*&search_engine=v3" \
    --header "authorization: Bearer $TOKEN"
{{< / highlight >}}

Here we use a feature in Lucene Queries called: [Wildcard matching](https://lucene.apache.org/core/2_9_4/queryparsersyntax.html#Wildcard%20Searches)

This lucene query will search the auth0 user search api for any user that has name starting with "jean"

Here is the request payload:

{{< highlight json >}}
[
  {
    "name": "Jean-Marcel Belmont",
    "picture": "https://pbs.twimg.com/profile_images/960991755108868097/HvHXkEYN_normal.jpg",
    "description": "Golang Programmer, Rustlang Enthusiast, JavaScript and NodeJS Artisan, Reverse Engineering Noob, Published Author, Christian, Father, Engineer @FoodLogiq",
    "lang": "en",
    "location": "North Carolina, USA",
    "screen_name": "jbelmont80",
    "url": "https://t.co/GOLxaCPccZ",
    "updated_at": "2019-01-19T18:41:08.722Z",
    "user_id": "twitter|2921946821",
    "nickname": "Jean-Marcel Belmont",
    "identities": [
      {
        "provider": "twitter",
        "user_id": "2921946821",
        "connection": "twitter",
        "isSocial": true
      }
    ],
    "created_at": "2019-01-19T18:41:08.722Z",
    "last_login": "2019-01-19T18:41:08.720Z",
    "last_ip": "174.110.45.244",
    "logins_count": 1
  },
]
{{< / highlight >}}

I left out some entries but you get the idea of what wildcard matching.

This is analogous to matching you would get with grep like this:

{{< figure src="/media/grep-wildcard-example.png" >}}

The next example lucene query uses keyword matching with the *AND* operator:

{{< highlight bash  >}}
curl --request GET \
    --url "$PERSONAL_AUTH0_DOMAIN/api/v2/users?q=name:jean*%20AND%20nickname:marcelbelmont&search_engine=v3" \
    --header "authorization: Bearer $TOKEN"
{{< / highlight >}}


I percent encoded the space with %20 but notice that the query is now:

{{< highlight bash  >}}
?q=name:jean AND nickname:marcelbelmont&search_engine=v3
{{< / highlight >}}


We can even group queries and use an OR operator with lucene syntax:

{{< highlight bash  >}}
curl --request GET \
    --url "$PERSONAL_AUTH0_DOMAIN/api/v2/users?%28q=name:jean*%20AND%20nickname:marcelbelmont%29%20OR%20nickname:Jean-Marcel%20Belmont&search_engine=v3" \
    --header "authorization: Bearer $TOKEN"
{{< / highlight >}}

Notice that in this query I percent encoded the left parenthesis "(" "%28" and right parenthesis "%29" and percent encoded spaces " " "%20"

Here is the query with no percent encoding:

{{< highlight bash >}}
?(q=name:jean* AND nickname:marcelbelmont) OR nickname:Jean-Marcel+Belmont&search_engine=v3
{{< / highlight >}}

You can use range queries in lucene here is a possible auth0 query with ranges:

{{< highlight bash >}}
curl --request GET \
    --url "$PERSONAL_AUTH0_DOMAIN/api/v2/users?q=last_login=%5B2018-03-06+TO+2019-01-19%5D&search_engine=v3" \
    --header "authorization: Bearer $TOKEN"
{{< /highlight >}}

Here is the query with no percent encoding:

{{< highlight bash >}}
?q=last_login=[2018-03-06 TO 2019-01-19]&search_engine=v3
{{< / highlight >}}

There is a whole lot more that you can do with lucene query syntax which you can read at:

[Query Parser Syntax](http://lucene.apache.org/java/3_5_0/queryparsersyntax.html)

If you like this post then please follow me at [jbelmont @ github](https://github.com/jbelmont) and [jbelmont80 @ twitter](https://twitter.com/jbelmont80) for more related type posts.

Feel free to leave a comment if you like.

Until Next Time :)
