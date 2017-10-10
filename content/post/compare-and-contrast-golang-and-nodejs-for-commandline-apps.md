+++
draft = false
tags = ["Command Line Apps", "Golang", "Node.js"]
title = "Compare and Contrast Golang and Nodejs for Commandline Apps"
subtitle = ""
date = "2017-10-10T18:49:29-04:00"
math = true
summary = """
A Look at Golang and Node.js for Command Line applications 
"""

+++

# Command Line Applications

Building command line applications is a refreshing change to building UIs.
In this blog post I go over briefly my thoughts on building commandline apps with Node.js and Golang

## Node.js CommandLine

First off I did not use a `commander.js` or any third party libraries to make my contrived application. I used vanilla node.js

```javascript
'use strict';

const process = require('process');
const fs = require('fs');

const lib = require('../lib');
const utf8 = require('../constants').utf8;

const args = process.argv.slice(2);

const tsvOrCsv = args.some(arg => {
  return arg === '--tsv-file' || arg === '--csv-file';
});

if (!tsvOrCsv) {
  lib.UsageMessage();
  process.exit(1);
}

const csvIndex = args.findIndex(arg => arg === '--csv-file');
let csv, tsv;
if (csvIndex > -1) {
  csv  = args.slice(csvIndex);
}

const tsvIndex = args.findIndex(arg => arg === '--tsv-file');
if (tsvIndex > -1) {
  tsv = args.slice(tsvIndex);
}
if (csv) {
  const csvPath = csv[1];
  const fileContents = [];
  fileReader(csvPath, function(err, data) {
    if (err) throw err;
    const [
      language,
      frequency
    ] = data.split(',');
    console.log(language);
    console.log(frequency);
  });
} else if (tsv) {
  const tsvPath = tsv[1];
  console.log(tsvPath);
} else {
  lib.UsageMessage();
  process.exit(1);
}

function fileReader(filePath, cb) {
  fs.readFile(`${__dirname}/../${filePath}`, utf8, function(err, data) {
    if (err) return cb(err);
    cb(null, data);
  });
}
```

Here is a snippet of code I used for node.js on one hand you can parse flags relatively easy but there is niceties missing.

In node.js you can just use `process.argv` and parse out the flags that were passed in via the commmandline

## Golang CommandLine application

Golang has many things baked into their standard library that make building command line applications very easy.

```
package main

import (
	"bufio"
	"encoding/csv"
	"encoding/json"
	"flag"
	"fmt"
	"io"
	"os"
)

func convertToJSON(f *os.File, isTSVFile bool) {
	rows := make([]map[string]string, 0)
	var columns = []string{"language", "frequency"}
	// Create a new reader.
	csvReader := csv.NewReader(bufio.NewReader(f))
	csvReader.TrimLeadingSpace = true
	if isTSVFile {
		csvReader.Comma = '\t' // Use tab-delimited instead of comma
	}
	for {
		record, err := csvReader.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			fmt.Println(err)
		}
		row := make(map[string]string)
		for i, n := range columns {
			row[n] = record[i]
		}
		rows = append(rows, row)
	}
	data, err := json.MarshalIndent(&rows, "", "  ")
	if err != nil {
		fmt.Println(err)
	}
	// print the reformatted struct as JSON
	fmt.Printf("%s\n", data)
}

func main() {
	csvPtr := flag.String("csv-file", "", "CSV File to parse. (Required)")
	tsvPtr := flag.String("tsv-file", "", "TSV File to parse. (Required)")
	flag.Parse()

	if *csvPtr == "" && *tsvPtr == "" {
		flag.PrintDefaults()
		os.Exit(1)
	} else if *csvPtr != "" {
		f, err := os.Open(*csvPtr)
		if err != nil {
			fmt.Println(err)
		}
		defer f.Close()
		convertToJSON(f, false)
	} else {
		f, err := os.Open(*tsvPtr)
		if err != nil {
			fmt.Println(err)
		}
		defer f.Close()
		convertToJSON(f, true)
	}
}
```

Notice here that I just used the `flag` builtin library and it does the job of parsing command line flags.

Also dealing with asychronous code in `Golang` is much easier in my opinion. 

There are many design patterns baked into Golang that make writing commandline applications a joy to work with.

## Quick summary

You can easily use either node.js or `Golang` but consider writing a command line application in Go. 

## Link to Golang Workshop

I wrote a [Golang workshop](https://github.com/jbelmont/golang-workshop) which you can check out if you aren't familiar with Go.

Follow me at [jbelmont](https://github.com/jbelmont) if you like this.