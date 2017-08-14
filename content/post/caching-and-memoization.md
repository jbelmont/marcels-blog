+++
date = "2017-08-13T12:00:00"
draft = false
tags = ["Caching", "Memoization", "Redis"]
title = "Caching, Memoization, and Redis"
math = true
summary = """
Deep Dive into Caching, Memoization and Redis. 
"""

+++


# Caching

## What Is Caching?

* Caching is the term for storing reusable responses in order to make subsequent requests faster.
* There are different types of caching available.
* Application caches and memory caches are both popular for their ability to speed up certain responses.

## Types of Cache

1. Disk cache: The page cache in main memory is managed by the operating system kernel.
2. Web cache
3. Memoization
    1. A cache can store data that is computed on demand rather than retrieved from a backing store.
    2. Memoization is an optimization technique that stores the results of resource-consuming function calls within a lookup table, allowing subsequent calls to reuse the stored results and avoid repeated computation.

## Web Caching

Web caching is a core design feature of the HTTP protocol
    * It is meant to minimize network traffic while improving perceived responsiveness of the system as a whole.

Caches are found at every level of a content's journey from the original server to the browser.

Web caching works by caching the HTTP responses for requests according to certain rules.

Subsequent requests for cached content can then be fulfilled from a cache closer to the user instead of sending the request all the way back to the web server.

## Benefits

Effective caching aids both content consumers and content providers.

Some of the benefits that caching brings to content delivery are:

* Decreased network costs: Content can be cached at various points in the network path between the content consumer and content origin.

* When the content is cached closer to the consumer, requests will not add network latency
* Improved responsiveness: Caching enables content to be retrieved faster because an entire network round trip is not necessary.
* Caches maintained close to the user, like the browser cache, can make this retrieval nearly instantaneous.
* Increased performance on the same hardware
    * For the server where the content originated, more performance can be squeezed from the same hardware by allowing aggressive caching.
    * The content owner can leverage the powerful servers along the delivery path to take the brunt of certain content loads.
* Availability of content during network interruptions
* Certain caches can be used to serve content even when if unavailable for short periods of time from the origin

## Terminology

* Origin server: The origin server is the original location of the content.
    * If you are acting as the web server administrator, this is the machine that you control.
    * It is responsible for serving any content that could not be retrieved from a cache along the request route
    * Setting the caching policy for all content.

* Cache hit ratio: A cache's effectiveness is measured in terms of its cache hit ratio or hit rate.
    * This is a ratio of the requests able to be retrieved from a cache to the total requests made.
    * A high cache hit ratio means that a high percentage of the content was able to be retrieved from the cache.  * This is usually the desired outcome for most administrators.

* Freshness: Term used to describe whether an item in cache is considered a candidate to serve to a client.
    * Content in a cache will only be used to respond if it is within the freshness time frame specified by the caching policy.

* Stale content: Items in the cache expire according to the cache freshness settings in the caching policy.

* Expired content is "stale".
    * Expired content cannot be used to respond to client requests. The origin server must be re-contacted to retrieve the new content or at least verify that the cached content is still accurate.

* Validation: Stale items in the cache can be validated in order to refresh their expiration time.
    * Validation involves checking with the origin server to see if cached content is still up to date

* Invalidation: Invalidation is the process of removing content from the cache before its expiration date.
    * Triggered if the item is changed on the origin server and an outdated item in cache causes client issues

## Cacheable Content

Items that don't tend to change frequently are good candidates for caching.

Cache Friendly Content:

* Logos and brand images
* Nav Icons
* Style sheets
* Javascript files
* Downloadable Content
* Media Files

More volatile items to cache:

* HTML pages
* Rotating images
* Heavily modified JavaScript and CSS files
* Content tied to auth (Cookies, Tokens, etc)

Some items that should almost never be cached are:

* Sensitive Dat (banking info, social security numbers, credit card numbers)
* user specific information that can change

Web Content Cache Locations:

* Browser cache: Web browsers themselves maintain a small cache.
    * Browsers sets a policy that dictates the most important items to cache.
    * This may be user-specific content or content deemed expensive to download and likely to be requested again.
    * We will explore IndexDb and Local Storage
    * In memory caching as well

* Intermediary caching proxies: Any server in between the client and infrastructure can cache certain content.
    * These caches may be maintained by ISPs or other independent parties.

* Reverse Cache: Your server infrastructure can implement its own cache for backend services.
    * Content can be served from the point of contact instead of hitting backend servers on each request.
        * For example hitting a database for each route that has cacheable content

## Caching HTTP Headers

Caching policy is dependent upon two different factors:

1. The caching entity itself gets to decide whether or not to cache acceptable content.
2. It can decide to cache less than it is allowed to cache, but never more.

**The majority of caching behavior is determined by the caching policy, which is set by the content owner.**

These policies are mainly exercises through the use of specific HTTP headers.

Cache-focused HTTP Headers:

* Expires: The Expires header is very straight-forward, although fairly limited in scope.
    * Set a time in the future when the content will expire.
    * At this point, any requests for the same content will have to go back to the origin server.
    * This header is probably best used only as a fall back.

* Cache-Control: This is the more modern replacement for the Expires header.
    * It is well supported and implements a much more flexible design.
    * In almost all cases, this is preferable to Expires, but it may not hurt to set both values.
    * We will discuss the specifics of the options you can set with Cache-Control a bit later.

* Etag: The Etag header is used with cache validation.
    * The origin can provide a unique Etag for an item when it initially serves the content.
    * When a cache needs to validate the content it has on-hand upon expiration, it can send back the Etag it has for the content.
    * The origin will either tell the cache that the content is the same, or send the updated content and new Etag

* Last-Modified: Specifies the last time that the item was modified.
    * This may be used as part of the validation strategy to ensure fresh content.

* Content-Length: This header is important to set when defining caching policies.
    * Certain software will refuse to cache content if it does not know in advanced the size of the content

* Vary: A cache will use the requested host and the path to the resource as the key to store the cache item.
    * The Vary header can be used to tell caches to pay attention to an additional header when deciding whether a request is for the same item.
    * Tells caches to key by the Accept-Encoding header as well, so that the cache will know to differentiate between compressed and uncompressed content.

## Cache-Control Flags

Cache-Control options:

* no-cache: Specifies that any cached content must be re-validated on each request before being served to client.
    * Contents is marked as stale immediately, but uses revalidation techniques to avoid re-downloading again

* no-store: This instruction indicates that the content cannot be cached in any way.
    * This is appropriate to set if the response represents sensitive data.

* public: This marks the content as public, meaning it can be cached by the browser and any intermediate caches.
    * For requests that HTTP authentication, responses are marked private by default.
    * This header overrides that setting.

More options can be found at [Cache Control](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control)

Options can be used in different ways to achieve various caching behavior.

## Developing a Caching Strategy

Ideally everything would be cached and your servers would only be contacted to validate content occasionally.

This doesn't often happen in practice though, so you should try to set some sane caching policies that aim to balance between implementing long-term caching and responding to the demands of a changing site.

## Common Issues with Caching

There are many situations where caching cannot or should not be implemented due to how the content is produced

1. Dynamic content generated by users
2. Sensitive information such as banking information, etc.
3. Older versions of your content are already out even though new versions have been published.

## General Recommendations

* Specific directories for images, css, and shared content
    * Placing content into dedicated directories will allow you to easily refer to them from any page on your site.

* Use the same URL to refer to the same items
    * Caches key off of both the host and the path to the content requested
    * Ensure that you refer to your content in the same way on all of your pages.
    * The previous recommendation makes this significantly easier.

* Use CSS image sprites where possible
    * Sprites for items like icons and navigation decrease the number of round trips needed to render your site
    * Allowing your site to cache that single sprite for a long time.
    * Use Single SVG file instead of multiple svg as well

* Host scripts and external resources locally where possible
    * If you utilize javascript scripts and other external resources, consider hosting those resources on your own dedicated servers if the correct headers are not being provided upstream.
    * Keep up to date with downstream changes however so you can update your local copy

* Fingerprint cache items
    * For static content like CSS and Javascript files, it may be appropriate to fingerprint each item.
    * This means adding a unique identifier to the filename (often a hash of the file) so that if the resource is modified, the new resource name can be requested, causing the requests to correctly bypass the cache.
    * There are a variety of tools that can assist in creating fingerprints and modifying the references to them within HTML documents.

* Allow all caches to store generic assets
    * Static content and content that is not user-specific should be cached at all points in the delivery chain.
    * This will allow intermediary caches to respond with the content for multiple users.

* Allow browsers to cache user-specific assets
    * For per-user content, it is often acceptable and useful to allow caching within the user's browser.
    * Caching in the browser will allow for instant retrieval for users during subsequent visits.

* Make exceptions for essential time-sensitive content
    * Sites that have a shopping cart should reflect the items in the cart immediately.
        * The no-cache or no-store options can be set in the Cache-Control header to achieve this.

* Always provide validators
    * Validators allow stale content to be refreshed without having to download the entire resource again.
    * Setting the Etag and the Last-Modified headers allow caches to validate their content and re-serve it if it has not been modified at the origin, further reducing load.

* Set long freshness times for supporting content
    * Items like images and css that don't change often

* Set short freshness times for parent content
    * The HTML itself will be downloaded frequently, allowing it to respond to changes rapidly.
    * The supporting content can then be cached aggressively.

**The key is to strike a balance that favors aggressive caching where possible while leaving opportunities to invalidate entries in the future when changes are made.**

Each Site will likely have the following items:

1. Aggressively cached items
2. Cached items with a short freshness time and the ability to re-validate
3. Items that should not be cached at all

**The goal is to move content into the first and second category when possible while maintaining an acceptable level of accuracy.**

## Memoization

Memoization is an optimization technique used primarily to speed up computer programs by storing the results of expensive function calls and returning the cached result when the same inputs occur again.

[Memoization](https://en.wikipedia.org/wiki/Memoization)

> The term "memoization" was coined by Donald Michie in 1968[5] and is derived from the Latin word "memorandum" ("to be remembered"), usually truncated as "memo" in the English language, and thus carries the meaning of "turning [the results of] a function into something to be remembered."

A memoized function "remembers" the results corresponding to some set of specific inputs.

Subsequent Function calls with remembered inputs return the remembered result rather than recalculating the result
Thus eliminating the primary cost of a call with given parameters from all but the first call made to the function.

A function can only be memoized if it is referentially transparent
if calling the function has exactly the same effect as replacing that function call with its return value.

*Memoization is a run-time rather than compile-time optimization.*

Memoization is heavily used in compilers for functional programming languages, which often use call by name evaluation strategy.

Memoization incurs a higher memory overhead since we must store our cached results so that we can later recall them
Therefore memoization only makes sense for functions that are computationally expensive.

[jsFiddle Memoization Example](https://jsfiddle.net/jbelmont/ane0p1ra/10/)

[ES6 Console Example](https://es6console.com/j2npui2h/)

## Web SQL

[Web SQL](https://www.w3.org/TR/webdatabase/)

## Methods

There are following three core methods defined in the spec that I.m going to cover in this tutorial −
* openDatabase − This method creates the database object either using existing database or creating new one.
* transaction − This method give us the ability to control a transaction and performing either commit or roll-back based on the situation.
* executeSql − This method is used to execute actual SQL query.

## Code

```javascript
function prepareDatabase(ready, error) {
  return openDatabase('documents', '1.0', 'Offline document storage', 5*1024*1024, function (db) {
    db.changeVersion('', '1.0', function (t) {
      t.executeSql('CREATE TABLE docids (id, name)');
    }, error);
  });
}

function showDocCount(db, span) {
  db.readTransaction(function (t) {
    t.executeSql('SELECT COUNT(*) AS c FROM docids', [], function (t, r) {
      span.textContent = r.rows[0].c;
    }, function (t, e) {
      // couldn't read database
      span.textContent = '(unknown: ' + e.message + ')';
    });
  });
}

prepareDatabase(function(db) {
  // got database
  var span = document.getElementById('doc-count');
  showDocCount(db, span);
}, function (e) {
  // error getting database
  alert(e.message);
});
```

## Plunker Playground
https://plnkr.co/edit/znJwyXsqVvHVegqS7Vrd?p=preview

## IndexDB

## Higher Level Overview of IndexDB

*IndexedDB is a low-level API for client-side storage of significant amounts of structured data, including files/blobs.*

* This API uses indexes to enable high-performance searches of this data.
* Web Storage is useful for storing smaller amounts of data, but less useful for storing larger amounts of structured data.
    * IndexedDB provides a solution for this

## Accessing IndexDB

In Chrome you can inspect `IndexDb` in the Application Tab in the Developer Tools

We will look at indexdb in the running UI application

## Running the application

1. Visit [Caching and Memoization Repo](https://github.com/jbelmont/caching-and-memoization/blob/master/docs/indexdb.md)
2. Run `npm install`
3. Run `npm run dev` in order to start the application

## Local Storage

### Local Storage API

Methods:

* getItem
* setItem

[Local Storage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)

### JSFiddle Example

[Local Storage](https://jsfiddle.net/jbelmont/ow6zLsdk/59/)

# Redis

[Redis Download](https://redis.io/download)

[Redis REPL](https://try.redis.io/)

[Caching and Memoization Repo](https://github.com/jbelmont/caching-and-memoization)

Redis is not a plain key-value store, it is actually a data structures server, supporting different kinds of values.

Redis Data Structures:

* Binary-safe strings.
* Lists: collections of string elements sorted according to the order of insertion. They are basically linked lists.
* Sets: collections of unique, unsorted string elements.
* Sorted sets, similar to Sets but where every string element is associated to a floating number value, called score.
* Hashes, which are maps composed of fields associated with values. Both the field and the value are strings.
* Bit arrays (or simply bitmaps): it is possible, using special commands, to handle String values like an array of bits
* HyperLogLogs: this is a probabilistic data structure which is used in order to estimate the cardinality of a set.

## Redis Database

* In Redis, databases are simply identified by a number with the default database being number 0.
* If you want to change to a different database you can do so via the select command.
* In the command line interface, type select 1.
* Redis should reply with an OK message and your prompt should change to something like `redis 127.0.0.1:6379[1]>.`
* If you want to switch back to the default database, just enter select 0 in the command line interface

## Redis Commands

Redis commands are grouped by functionality

* Sets
    * Unique Elements.
    * Available commands: sadd, scard, sismember
* Lists:
    * collections of string elements
    * Available commands: llen, lpush
* Keys
* Hashes
    * consist of key and value pairs

Find all the available Redis Commands here [Redis Commands](https://redis.io/commands)

**You can filter by functionality because the default is to show all the Redis Commands**

## Redis Clients

You can find all the available Redis Client Libraries here [Redis Clients](https://redis.io/clients)

The particular client we will be using for the workshop is [Node Redis](https://github.com/NodeRedis/node_redis)

Redis breaks out uses for data structures according to how they should be used albeit lists, hashes, scalars, and sets

This means that if you have JSON object in Redis you can't just store like an json object
Also nested json objects should either be stringified with `JSON.stringify(obj)` or used with a hash data structure


## Querying Redis

Redis stores everything as a key so you can't use it like you would think as a normal query language

For example

`SELECT * from Books where Books.id = 1`

A type of query such as this wouldn't work in Redis

* Use lots of key-value pairs in Redis.
* So feel free to store each row of the table in a different row.
* Use Redis' hash map data type
* Form key name from primary key values of the table by a separator (such as ":")
* Store the remaining fields as a hash
* When you want to query a single row, directly form the key and retrieve its results
* When you want to query a range, use wild char "*" towards your key.

## Memory and Persistence in Redis

Redis is an in-memory persistent store

Redis keeps all your data in memory so there is an associated cost for this in terms of Server RAM

## Redis Data Structures

#### Strings

[String Data Type](https://redis.io/topics/data-types#strings)

[String Commands](https://redis.io/commands#string)

```sh
> set movies:rocky '{ "name": rocky, "characters": ["Rocky Balboa", "Paulie", "Adrien"] }'
OK

> get movies:rocky
"{ \"name\": rocky, \"characters\": [\"Rocky Balboa\", \"Paulie\", \"Adrien\"] }"

> strlen movies:rocky
(integer) 69

> append movies:rocky "Yo Adrian"
(integer) 78

> get movies:rocky
"{ \"name\": rocky, \"characters\": [\"Rocky Balboa\", \"Paulie\", \"Adrien\"] }Yo Adrian"
```

Notice above here that the string Yo Adrian was appended to the JSON object which doesn't really make sense
A JSON object can't really be represented as a string


```sh
127.0.0.1:6379[1]> help incr
INCR key
summary: Increment the integer value of a key by one
since: 1.0.0
group: string

127.0.0.1:6379[1]> incr random:num
(integer) 1

127.0.0.1:6379[1]> incr random:num
(integer) 2

127.0.0.1:6379[1]> help incrby
INCRBY key increment
summary: Increment the integer value of a key by the given amount
since: 1.0.0
group: string

127.0.0.1:6379[1]> incrby num:incr 10
(integer) 10

127.0.0.1:6379[1]> incrby num2:incr 25
(integer) 25

127.0.0.1:6379[1]> incr movies:rocky
(error) ERR value is not an integer or out of range
```

*Notice here that trying to increment movies:rocky created a Redis error which makes sense movies:rocky is a string*

###### Exercise

* Implement redis command `incr` using node_redis client library [Node Redis](https://github.com/jbelmont/node_redis)
    * open `playground/strings.js`
* `open test/unit/strings.test.js`
    * Write a test with your new function
* Run your test with command `npm test`

#### Hashes

[Hash Data Type](https://redis.io/topics/data-types#hashes)

[Hash Commands](https://redis.io/commands#hash)

Hashes are like strings except you have a field value

```sh
127.0.0.1:6379[1]> hset users:user name bob
(integer) 1

127.0.0.1:6379[1]> hget users:user name
"bob"

127.0.0.1:6379[1]> hmset movie:fields name "Rocky" rating 5 year 1976
OK

127.0.0.1:6379[1]> HGETALL movie:fields
1) "name"
2) "Rocky"
3) "rating"
4) "5"
5) "year"
6) "1976"

127.0.0.1:6379[1]> hkeys movie:fields
1) "name"
2) "rating"
3) "year"

127.0.0.1:6379[1]> hkeys movie:fields
1) "name"
2) "rating"
3) "year"

127.0.0.1:6379[1]> hdel movie:fields rating
(integer) 1

127.0.0.1:6379[1]> hkeys movie:fields
1) "name"
2) "year"
```

Notice that we were able to set multiple fields with the Redis command `hmset` and get all the values with `hgetall`

*Hashes give you more control than regular strings because you can map values instead of one scalar value*

###### Exercise

* Implement redis command `hdel` using node_redis client library [Node Redis](https://github.com/jbelmont/node_redis)
    * open `playground/hashes.js`
* `open test/unit/hashes.test.js`
    * Write a test with your new function
* Run your test with command `npm test`

#### Lists

[List Data Type](https://redis.io/topics/data-types#lists)

[List Commands](https://redis.io/commands#list)

```sh
127.0.0.1:6379> lpush users "soldier" "John Rambo" "123-45-5678" "Sergeant First Class"
(integer) 4

127.0.0.1:6379> lindex users 0
"Sergeant First Class"

127.0.0.1:6379> lindex users 1
"123-45-5678"

127.0.0.1:6379> lindex users 2
"John Rambo"

127.0.0.1:6379> lindex users 3
"soldier"

127.0.0.1:6379[1]> lpop users
"Sergeant First Class"

127.0.0.1:6379> llen users
(integer) 3

127.0.0.1:6379[1]> rpop users
"soldier"

127.0.0.1:6379> rpop users
"soldier"
127.0.0.1:6379> llen users
(integer) 2
```

Notice here that we pushed 4 strings onto the list `users`

`lindex` takes a key and a index and returns the value if found else it returns `nil` so the lookup:

`lindex users 2` return "John Rambo"

Notice that `rpop` removes and returns the last element of the list stored at `key` so when we run `llen` the list has been reduced by 1.

Conversely `lpop` removes and returns the first element of the list stored at `key` so when we run `llen` again the list is now length of 2

* Implement redis command `llen` or `rpop` using node_redis client library [Node Redis](https://github.com/jbelmont/node_redis)
    * open `playground/list.js`
* `open test/unit/list.test.js`
    * Write a test with your new function
* Run your test with command `npm test`


#### Sets

[Set Data Type](https://redis.io/topics/data-types#sets)

[Set Commands](https://redis.io/commands#set)

* Sets are great for tagging or tracking any other properties of a value for which duplicates don’t make any sense
* Sets are also greate when you want to apply set operations such as intersections and unions

```sh
127.0.0.1:6379> sadd movies "Rocky"
(integer) 1

127.0.0.1:6379> sadd movies "The Matrix"
(integer) 1

127.0.0.1:6379> sadd movies "Chinese Connection"
(integer) 1

127.0.0.1:6379> scard movies
(integer) 3

127.0.0.1:6379> sadd movies2 "Rocky"
(integer) 1

127.0.0.1:6379> sadd movies2 "Rambo"
(integer) 1

127.0.0.1:6379> sadd movies2 "Chinese Connection"
(integer) 1

127.0.0.1:6379> sdiff movies movies2
1) "The Matrix"

127.0.0.1:6379> sinter movies movies2
1) "Rocky"
2) "Chinese Connection"

127.0.0.1:6379> sunion movies movies2
1) "The Matrix"
2) "Chinese Connection"
3) "Rocky"
4) "Rambo"

127.0.0.1:6379> sismember movies "Rocky"
(integer) 1

127.0.0.1:6379> smembers movies2
1) "Rambo"
2) "Rocky"
3) "Chinese Connection"
```

Notice here that created 2 different sets `movies` and `movies2` and we were able to do set operations on them.

* `sinter` returns the intersection between 2 or more sets
* `sdiff` returns the set difference between 2 or more sets
* `sunion` returns the all the movies that exist in the specified sets or more plainly the union between the sets
* `scard` returns the total number of elements or `cardinality` of the set
* `sismember` returns 1 (i.e. true) if a value exists in the set
* `smembers` returns all the values in the set
* `sadd` adds one or more members to a set

Read more commands at [Redis Set Commands](https://redis.io/commands#set)

* Implement redis command `sismember` or `sunion` using node_redis client library [Node Redis](https://github.com/jbelmont/node_redis)
    * open `playground/set.js`
* `open test/unit/set.test.js`
    * Write a test with your new function
* Run your test with command `npm test`

#### Sorted Sets

[Sorted Set Data Type](https://redis.io/topics/data-types#sorted-sets)

[Sorted Set Commands](https://redis.io/commands#sorted_set)

* Redis Sorted Sets are, similarly to Redis Sets, non repeating collections of Strings
* The difference is that every member of a Sorted Set is associated with score
    * The score helps order the set,
    * From the smallest to the greatest score
    * While members are unique, scores may be repeated.


```sh
127.0.0.1:6379> zadd grades 95 britney 85 dave 93 ashley 100 zhou
(integer) 4

127.0.0.1:6379> zcard grades
(integer) 4

127.0.0.1:6379> zrange grades 0 -1
1) "dave"
2) "ashley"
3) "britney"
4) "zhou"

127.0.0.1:6379> zrevrank grades dave
(integer) 3

127.0.0.1:6379> zrevrank grades zhou
(integer) 0
```

* `zadd` added 4 members to the grades sorted set
* `zcard` returned the cardinality value of 4
* `zrange` returned the lowest to highest members in the sorted set
* `zrevrank` returned the index of a member in a sorted set, with scores ordered from high to low

* Implement redis command `zcard` using node_redis client library [Node Redis](https://github.com/jbelmont/node_redis)
    * open `playground/sortedSet.js`
* `open test/unit/sortedSet.test.js`
    * Write a test with your new function
* Run your test with command `npm test`
