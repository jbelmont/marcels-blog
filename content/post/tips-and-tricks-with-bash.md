+++
draft = false
title = "Tips and Tricks With Bash and Zsh"
date = "2019-02-16T10:59:02-05:00"
math = true
highlight = true
tags = ["bash", "unix"]
summary = """
Tips and Tricks With Bash
"""
+++

In this blog post I go over some tips and tricks with bash and cover some of the newer features in bash such as associative arrays which are available in Bash 4.

## Using Bash History features

A lot of people know about hitting the up and down keys in their keyboard to access history but you can also utilize the `!!` operator to access history in bash.

Say that we run the following command:

```bash
brew update
```

We can run `sudo !!` to execute the previous command.

Here is a shell session of this in action:

{{< figure src="/media/history-bang.png" >}}

*Notice that in the screenshot above the command that was executed was printed first in the terminal.*

Here is a more advanced example of the power of history substitution:

{{< figure src="/media/history-substution-advanced.png" >}}

Notice here that we created 4 files file1.txt to file4.txt

We then execute the `chmod` command and reuse the 2nd to last command.

The command: `chmod +x !touch$` searches in shell history for the touch command which brings in the latest *touch* command and then we use the last arguments in that command in this history substition.

You can search the shell history by typing in `control + r` in your terminal:

{{< figure src="/media/reverse-search.png" >}}

You can cycle through history individually by pressing `control + p` for previous and then press `control + n` for the next history item.

You can also set your CDPATH variable in your .zshrc so that you can just *cd* into frequent directories:

{{< figure src="/media/cdpath.png" >}}

Here is an example of jumping into a directory from the CDPATH:

{{< figure src="/media/cdpath-example.png" >}}

Notice in the screenshot above that we went from the home directory `~` or `/Users/jean-marcelbelmont` directly into the directory `/Users/jean-marcelbelmont/go/src/github.com/jbelmont/nosql-workshop`

## Process Substitution 

> In computing, process substitution is a form of inter-process communication that allows the input or output of a command to appear as a file. The command is substituted in-line, where a file name would normally occur, by the command shell. This allows programs that normally only accept files to directly read from or write to another program.

This is extremely useful with commands like *uniq*, *sort* that can take 2 arguments.

Let us look at an example of this:

{{< figure src="/media/command-process-substitution.png" >}}

Notice that in the screenshot above that we created 2 files: file1, file2

We used command process substitution and ran sort in file1 and file2 and then passed that as standard input into the uniq command which printed out:

* four
* one
* three
* two

in sorted order and removed the duplicates in each file.

## Associative arrays in bash and zsh

[Associative arrays in bash](https://www.gnu.org/software/bash/manual/html_node/Arrays.html)

> Bash provides one-dimensional indexed and associative array variables. Any variable may be used as an indexed array; the declare builtin will explicitly declare an array. There is no maximum limit on the size of an array, nor any requirement that members be indexed or assigned contiguously. Indexed arrays are referenced using integers (including arithmetic expressions and are zero-based; associative arrays use arbitrary strings. Unless otherwise noted, indexed array indices must be non-negative integers.

Let us look at an example:

{{< figure src="/media/associative-arrays.png" >}}

Notice in the screenshot above that we use the declare keyword:

> Declare variables and give them attributes.  If no NAMEs are given, display the attributes and values of all variables.

* -A	to make NAMEs associative arrays (if supported)*

We then access the associative array with the syntax like this:

echo ${MY_MAP[KEY]} which prints out ONE in our case

Let us look at a more advanced example of using associative arrays:

```zsh
#! /usr/local/bin/zsh

declare -A TEXT_INSIDE_PARENS_LIST

TEXT_INSIDE_PARENS=$(pbpaste | sed 's/ /_/g' | tr '[:upper:]' '[:lower:]')
TEXT_TITLECASE=$(echo $TEXT_INSIDE_PARENS | gsed 's/.*/\L&/;s/[a-z]*/\u&/g;s/_/ /g')

COUNTER=0
for brackets in $TEXT_TITLECASE[@]
do
  TEXT_INSIDE_PARENS_LIST[$COUNTER]=$(echo $brackets | sed 's/ /_/g' | tr '[:upper:]' '[:lower:]' | tr -d '\n')
  printf "[%s](%s)\n" $brackets ${TEXT_INSIDE_PARENS_LIST[$COUNTER]}
  COUNTER=$(($COUNTER+1))
done
```

Here we create 2 lists and use an associative arrays that get a key in each loop of this script.

We can write a more concise solution using IFS which is the internal field separator and using readarray.

readarray: Read lines from a file into an array variable.

We can also use here string.

Here is a more concise example using bash 4:

```bash
#! /usr/local/bin/bash

IFS=$'\n'
WORDS=$(pbpaste)
readarray -t y <<< "$WORDS"

for word in $WORDS
do
  TEXT_INSIDE_PARENS=$(echo $word | sed 's/ /_/g' | tr '[:upper:]' '[:lower:]')
  printf "[%s](#%s)\n" $word $TEXT_INSIDE_PARENS
done
```

In the script above we put the system clipboard contents from pbpaste into the WORDS variable.
We then use the readarray builtin and here strings to create an array bash variable.
We then loop over words and create a running TEXT_INSIDE_PARENS variable and use the printf command.

If you like this blog post you can read more about unix programming in my free gitbook [Unix Programming and Regular Expressions](https://www.marcelbelmont.com/unix-programming-and-regular-expressions-workshop/)

Please follow me at [jbelmont @ github](https://github.com/jbelmont) and [jbelmont80 @ twitter](https://twitter.com/jbelmont80)

Feel free to leave a comment if you like.

Until Next Time :)