+++
title = "Tips and Tricks With Mongodb"
date = "2019-01-12T16:46:47-05:00"

math = false
highlight = true
tags = ["nosql", "mongodb"]

summary = """
A list of Tips and Tricks with MongoDB
"""
+++

In this blog post I go over some tips and tricks with MongoDB and focus on using the mongodbshell.

# What is MongoDB

MongoDB is a document database with the scalability and flexibility that you want with the querying and indexing that you need.

## Installing MongoDB

MongoDB is released as two editions: Community and Enterprise. 

Community is the open source release of MongoDB. 

Enterprise provides additional administration, authentication, and monitoring features. 

Installation steps vary depending on the edition; both procedures are outlined in this section.

Follow the [Instructions to Download MongoDB per Platform](https://docs.mongodb.com/manual/installation/)

#### Starting interactive mongodb session

Once you have installed mongodb you need to make sure that is running and then you can simply type:

```sh
> mongo
```

and then get into an interactive mongo shell session:

{{< figure src="/media/mongo-interactive-shell.png" >}}

#### Pretty Print trick for mongodb

You can set global settings in mongodb interactive shell in the *$SHELL/.mongorc.js* configuration file.

In mongodb shell if you want to pretty print collections you need to use the pretty() function like this:

```sh
> db.heroes.find({}).pretty()
```

If we set the following values in our *~/.mongorc.js*:

{{< figure src="/media/mongo-pretty-print.png" >}}

Now with this new setting we can simply query for documents and get pretty printing by default:

{{< figure src="/media/pretty-print-by-default.png" >}}

Notice here that we did not specify the `.pretty()` function and got pretty print behavior by default.

{{< figure src="/media/using-unpretty-function.png" >}}

#### Setting default number of documents printed to standard output

You can set the number of documents to show at a time with the following setting in *$HOME/.mongorc.js:

```js
DBQuery.shellBatchSize = 25
```

#### Set the settings for a mongodb server with the following command:

You can see the setting for the mongodb server with this command in the interactive shell:

{{< figure src="/media/mongodb-admin-server-settings.png">}}

#### Using interactive mongodb session full javascript console

Remember that the mongodb interactive shell is full blown javascript repl:

{{< figure src="/media/mongodb-interactive-repl.png" >}}

{{< figure src="/media/mongodb-interactive-repl2.png" >}}

*Notice here that we were able to use the map javascript function in the mongodb shell session.*

#### Extending prototype functions in JavaScript available in mongo shell

You can easily extend the available functions in mongo shell by adding them on *~/.mongorc.js* configuration file:

{{< figure src="/media/adding-prototype-functions-mongoshell.png" >}}

Now you can easily use this new function in a new mongo shell session like this:

{{< figure src="/media/list-proto-length.png" >}}

#### Using mongostat 

[mongostat docs](https://docs.mongodb.com/manual/reference/program/mongostat/)

The mongostat utility provides a quick overview of the status of a currently running mongod or mongos instance. 

mongostat is functionally similar to the UNIX/Linux file system utility vmstat, but provides data regarding mongod and mongos instances.

#### Finding the timestamp for when a particular document was added

You can run the `ObjectId("").getTimestamp()` to get the timestamp for the added mongo document

{{< figure src="/media/mongo-shell-timestamp-function.png" >}}

#### Using ESNext features in mongo shell session

You can use all the esnext features in JavaScript in the MongoShell session like this:

{{< figure src="/media/mongo-shell-esnext-js.png" >}}