+++
title = "Intro to sqlite and SQL"
date = "2020-04-13T16:08:28-04:00"
math = true
draft = false
tags = ["sql", "sqlit"]
summary = """
An introduction to SQLite and SQL
"""
+++

# SQLite

> SQLite is a C-language library that implements a small, fast, self-contained, high-reliability, full-featured, SQL database engine. SQLite is the most used database engine in the world. SQLite is built into all mobile phones and most computers and comes bundled inside countless other applications that people use every day.

There are over 1 trillion sqlite databases in use in the world today and it is the most deployed SQL Database in the world

## Additional Information on SQLite

[About SQLite](https://www.sqlite.org/about.html)

> SQLite is an in-process library that implements a self-contained, serverless, zero-configuration, transactional SQL database engine. The code for SQLite is in the public domain and is thus free for use for any purpose, commercial or private. SQLite is the most widely deployed database in the world with more applications than we can count, including several high-profile projects.

> SQLite is an embedded SQL database engine. Unlike most other SQL databases, SQLite does not have a separate server process. SQLite reads and writes directly to ordinary disk files. A complete SQL database with multiple tables, indices, triggers, and views, is contained in a single disk file. The database file format is cross-platform - you can freely copy a database between 32-bit and 64-bit systems or between big-endian and little-endian architectures. These features make SQLite a popular choice as an Application File Format. SQLite database files are a recommended storage format by the US Library of Congress. Think of SQLite not as a replacement for Oracle but as a replacement for fopen()

## SQLite Uses

* Embedded devices and the internet of things

Client/server database engines are designed to live inside a lovingly-attended datacenter at the core of the network. SQLite works there too, but SQLite also thrives at the edge of the network, fending for itself while providing fast and reliable data services to applications that would otherwise have dodgy connectivity.

* Application file format

* Websites

* Data analysis

* Cache for enterprise data

* Server-side database

Please read about more uses on the [When To Use Document](https://www.sqlite.org/whentouse.html)

## SQLite Command Line Shell

If you have Mac OS X then sqlite is already installed in your system.

{{< figure src="/media/sqlite3-shell.png" >}}

## SQLite Help

```sql
sqlite> .help
.archive ...             Manage SQL archives
.auth ON|OFF             Show authorizer callbacks
.backup ?DB? FILE        Backup DB (default "main") to FILE
.bail on|off             Stop after hitting an error.  Default OFF
.binary on|off           Turn binary output on or off.  Default OFF
.cd DIRECTORY            Change the working directory to DIRECTORY
.changes on|off          Show number of rows changed by SQL
.check GLOB              Fail if output since .testcase does not match
.clone NEWDB             Clone data into NEWDB from the existing database
.databases               List names and files of attached databases
.dbconfig ?op? ?val?     List or change sqlite3_db_config() options
.dbinfo ?DB?             Show status information about the database
.dump ?TABLE? ...        Render all database content as SQL
.echo on|off             Turn command echo on or off
.eqp on|off|full|...     Enable or disable automatic EXPLAIN QUERY PLAN
.excel                   Display the output of next command in a spreadsheet
.exit ?CODE?             Exit this program with return-code CODE
.expert                  EXPERIMENTAL. Suggest indexes for specified queries
.filectrl CMD ...        Run various sqlite3_file_control() operations
.fullschema ?--indent?   Show schema and the content of sqlite_stat tables
.headers on|off          Turn display of headers on or off
.help ?-all? ?PATTERN?   Show help text for PATTERN
.import FILE TABLE       Import data from FILE into TABLE
.imposter INDEX TABLE    Create imposter table TABLE on index INDEX
.indexes ?TABLE?         Show names of indexes
.limit ?LIMIT? ?VAL?     Display or change the value of an SQLITE_LIMIT
.lint OPTIONS            Report potential schema issues.
.load FILE ?ENTRY?       Load an extension library
.log FILE|off            Turn logging on or off.  FILE can be stderr/stdout
.mode MODE ?TABLE?       Set output mode
.nullvalue STRING        Use STRING in place of NULL values
.once (-e|-x|FILE)       Output for the next SQL command only to FILE
.open ?OPTIONS? ?FILE?   Close existing database and reopen FILE
.output ?FILE?           Send output to FILE or stdout if FILE is omitted
.parameter CMD ...       Manage SQL parameter bindings
.print STRING...         Print literal STRING
.progress N              Invoke progress handler after every N opcodes
.prompt MAIN CONTINUE    Replace the standard prompts
.quit                    Exit this program
.read FILE               Read input from FILE
.recover                 Recover as much data as possible from corrupt db.
.restore ?DB? FILE       Restore content of DB (default "main") from FILE
.save FILE               Write in-memory database into FILE
.scanstats on|off        Turn sqlite3_stmt_scanstatus() metrics on or off
.schema ?PATTERN?        Show the CREATE statements matching PATTERN
.selftest ?OPTIONS?      Run tests defined in the SELFTEST table
.separator COL ?ROW?     Change the column and row separators
.sha3sum ...             Compute a SHA3 hash of database content
.shell CMD ARGS...       Run CMD ARGS... in a system shell
.show                    Show the current values for various settings
.stats ?on|off?          Show stats or turn stats on or off
.system CMD ARGS...      Run CMD ARGS... in a system shell
.tables ?TABLE?          List names of tables matching LIKE pattern TABLE
.testcase NAME           Begin redirecting output to 'testcase-out.txt'
.testctrl CMD ...        Run various sqlite3_test_control() operations
.timeout MS              Try opening locked tables for MS milliseconds
.timer on|off            Turn SQL timer on or off
.trace ?OPTIONS?         Output each SQL statement as it is run
.vfsinfo ?AUX?           Information about the top-level VFS
.vfslist                 List all available VFSes
.vfsname ?AUX?           Print the name of the VFS stack
.width NUM1 NUM2 ...     Set column widths for "column" mode
```

#### Show all the databases in sqlite in current session

```sql
sqlite> .databases
main:
sqlite> .tables
sqlite>
```

Notice that I have no databases in this current session.

Let us do something more useful by loading up current Web Cookies in Chrome

#### Load current cookies for Chrome Browser

```bash
> cd Library/Application\ Support/Google/Chrome/Default/

Google/Chrome/Default on ☁️  us-east-1
> sqlite3 Cookies
SQLite version 3.29.0 2019-07-10 17:32:03
Enter ".help" for usage hints.
sqlite> .databases
main: /Users/jean-marcelbelmont/Library/Application Support/Google/Chrome/Default/Cookies
sqlite> .tables
cookies  meta
sqlite>
```

*Notice that here we load up the Cookies Database which also has a cookies table.*

#### Query all fields from cookies table

```sql
sqlite> SELECT * FROM cookies;
<number>|.github.com|_octo||/|<...>|0|0|<...>|1|1|1|v107P)<digits>
```

#### SQL Syntax

You can query things using the following sql keywords

```sql
SELECT => Fields to return
FROM => TABLE 
WHERE => Condition to reduce the dataset
```

#### Show help on particular sqlite command and show table schema

{{< figure src="/media/sqlite-help-schema.png" >}}

Notice that in this screenshot we get helpful information on the `.schema` command.

We then call `.schema --indent cookies` which shows all the available fields that we can use in our SELECT Query

#### SELECT FROM WHERE Query in cookies table

Let us now craft a query that matches on a specific condition and only show certain fields instead of all fields.

```sql
sqlite> SELECT host_key, name, value FROM cookies WHERE host_key like '%mongo%';
.mongodb.com|_rtfl_s_unique_visitor_session|
.mongodb.com|__gads|
..........................................
```

Notice that in this query we project the *host_key, name, value* fields and match on the host_key and use the like operator:

The *like* operator takes a wildcard like the `%` and it matches any host_key that has mongo text before and after

#### Read SQLite Language Guide

Please read the [SQLite Language guide](https://www.sqlite.org/lang.html) for more information on using sqlite.

*You can use the Chrome Developer Tools to see cookies but with sqlite you can see all of the cookies that websites use.*

## Twitter & Github Account

Please follow me at [jbelmont @ github](https://github.com/jbelmont) and [jbelmont80 @ twitter](https://twitter.com/jbelmont80)

Feel free to leave a comment if you like.

Until Next Time :)