+++
title = "Tips and Tricks With Mongodb Part 2"
date = "2019-02-20T18:38:15-05:00"
math = false
highlight = true
tags = ["nosql", "mongodb"]

summary = """
Tips and Tricks with Mongo Scripts
"""
+++

In this second blog post I go over how to loads scripts in the mongo shell and how to automate tasks in mongo shell

## Loading scripts in the Mongo Shell

You can load scripts in the mongo shell as long as the mongo shell knows the path.

Let us get mongodb running with the following bash script:

```bash
#! /bin/bash

docker run --name jbelmont-mongo-image-4 \
  --rm \
  -v ~/mongod_data.4.0.5:/data/db \
  -p 27017:27017 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -d jbelmont/mongo-vim:4.0.5
```

Notice that this is a custom docker image that I created

{{< figure src="/media/mongo-shell-prompt.png" >}}

Not let us say that we wanted to write a script that shows all the numbers in the numbers collection and in particular the val field.

In the mongo shell we could get it like this:

{{< figure src="/media/mongo-script-in-shell.png" >}}

Now let us write a script in a javascript file to do the same thing:

```js
"use strict";

db = connect("localhost:27017/nosql_workshop");

db.numbers.find({}).forEach(num => print(num.val));
```

We will put this script in the following path in my computer:

*/Users/jean-marcelbelmont/go/src/github.com/jbelmont/nosql-workshop/scripts*

{{< figure src="/media/load-scripts.png" >}}

The mongo shell needs to know the path in order to load the script. Notice that we used the native function `pwd()` to verify the path and then we passed in the path to our script in the `load()` function.

We can set an environment variable in our *~/.bashrc,~/.zshrc* for our mongodb scripts like this:

```bash
echo $MONGO_SCRIPT_PATH
/Users/jean-marcelbelmont/go/src/github.com/FoodLogiQ/playground/scripts
```

Now we can call the javascript file outside of the mongo shell like this:

{{< figure src="/media/mongo-script-load.png" >}}

Notice how we used the environment variable of $MONGO_SCRIPT_PATH here and then just invoked our script file.

Some advantages of using the javascript file instead of the mongo shell is that the mongo shell has limits when you copy and paste large BSON objects and can explode at times. 

If you use your javascript file you can use all the power of ESNext JavaScript features to do CRUD Operations in MongoDB.

Let us create the following script that stores 2 numbers in the numbers collection and then prints out the val field in the first number:

```js
"use strict";

db = connect("localhost:27017/nosql_workshop");

let id1 = new ObjectId();
let id2 = new ObjectId();

let numbers = [
    {
        "_id": id1,
        "val" : 2.1, 
        "description" : "Decimal"
    },
    {
        "_id": id2,
        "val": 3.1,
        "description" : "Decimal"
    }
];

db.numbers.insertMany(numbers);

let num1 = db.numbers.find({
    _id: id1
})[0].val;

print(num1);
```

Let us run the new script like this:

{{< figure src="/media/complex-script.js" >}}

Now in the mongo shell we can look at our newest documents that we have added:

{{< figure src="/media/new-numbers-in-collection.png" >}}

## Adding global configuration with ~/.mongorc.js

I have the following defined in my *~/.mongorc.js*:

```js
DBQuery.prototype._prettyShell = true
DBQuery.prototype.unpretty = function () {
    this._prettyShell = false;
    return this;
}
currentDir = pwd()
currentDir = currentDir.split("/").slice(0, -1).join("/")
callScript = function(script_name) {
    load(`${currentDir}/playground/scripts/${script_name}`);
}
```

So from the top I have defined pretty print to be the default and have created a function called unpretty to get the regular behavior.

Notice that we can define functions in JavaScript and we can use ESNext Features in JavaScript.

I created a custom function called callScript that calls the load script function but takes an argument for the script name and looks at your current shell path.

Looks like at a live example using the callScript command and a new JavaScript file:

```js
"use strict";

let ids = [];
for (let i = 0; i < 10; i++) {
    let objectId = new objectId()
    ids.push({
        _id: objectId
    });
}
printjson(ids);
```

Here we create an array of objects with ObjectIds in the mongo shell.

Here is an example session in the mongo shell:

{{< figure src="/media/array-of-objectids.png" >}}

Notice here that we called the javascript file without passing a path because we have defined the script path location in the callScript function definition already.

There is a lot more you can do with scripts if you use your imagination :)

Please follow me at [jbelmont @ github](https://github.com/jbelmont) and [jbelmont80 @ twitter](https://twitter.com/jbelmont80)

Feel free to leave a comment if you like.

Until Next Time :)
