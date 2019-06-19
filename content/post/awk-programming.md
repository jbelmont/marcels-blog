+++
title = "Awk Programming"
date = "2019-06-18T18:40:22-04:00"
draft = false
math = true
tags = ["shell","awk", "unix"]
summary = """
Mastering Awk Programming
"""
+++

**Mastering Awk Programming**

> AWK is a special-purpose programming language designed for text processing and typically used as a data extraction and reporting tool. It is a standard feature of most Unix-like operating systems.

Usually awk is used in combination with sed but awk unlike sed is a Turing Complete Programming Language and can be used for many different tasks.

Awk shines when used for pattern matching and can aid when used for reporting purposes.

## Awk Downloading Instructions

#### Build awk from source

You can download gawk from ftp site at [gawk gnu sources](https://ftp.gnu.org/gnu/gawk/)

We will download gawk version 5 with the following command:

{{< highlight bash >}}
wget http://ftp.gnu.org/gnu/gawk/gawk-5.0.0.tar.xz
{{< / highlight >}}

You can then unpack this file with the following command:

{{< highlight bash >}}
# This command unpacks the tar ball into a folder called gawk-5.0.0
tar xvf gawk-5.0.0.tar.xz

# next change into this directory
cd gawk-5.0.0.tar.xz
{{< / highlight >}}

When you build from source you will generally need to run the following commands:

{{< highlight bash >}}
./configure
make && make install
{{< / highlight >}}

###### Configure explanation in README from gawk source

> The `configure' shell script attempts to guess correct values for
various system-dependent variables used during compilation.  It uses
those values to create a `Makefile' in each directory of the package.
It may also create one or more `.h' files containing system-dependent
definitions.  Finally, it creates a shell script `config.status' that
you can run in the future to recreate the current configuration, and a
file `config.log' containing compiler output (useful mainly for
debugging `configure').

> It can also use an optional file (typically called `config.cache'
and enabled with `--cache-file=config.cache' or simply `-C') that saves
the results of its tests to speed up reconfiguring.  Caching is
disabled by default to prevent problems with accidental use of stale
cache files.

> If you need to do unusual things to compile the package, please try
to figure out how `configure' could check whether to do them, and mail
diffs or instructions to the address given in the `README' so they can
be considered for the next release.  If you are using the cache, and at
some point `config.cache' contains results you don't want to keep, you
may remove or edit it.

**Building from source is generally not necessary anymore since you use package managers**

#### Setup awk in Homebrew Package Manager in Mac OS X

###### Install Homebrew

You can install homebrew on Mac OS X using this script:

{{< highlight bash >}}
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
{{< / highlight >}}

You can then simply run: `brew install gawk` to install the latest gawk or awk.

###### Setup awk in Linux

You can use the following command to install gawk on GNU Linux variants


{{< highlight bash >}}
sudo apt-get update -y
sudo apt-get install gawk -y
{{< / highlight >}}

*If you have other linux distribution then please consult its documentation to install awk.*

## Awk Hello World Example

awk is a turing complete language but it is typically used in pattern matching

We will write a hello world equivalent program in awk like this:

{{< highlight bash >}}
awk 'BEGIN { print "Hello World" }'
{{< / highlight >}}

This prints out "Hello World" to standard output in your terminal

## awk workflow diagram

{{< figure src="/media/Awk_Workflow_Programming.png" >}}

#### Read Operation:

In the read operation awk reads a line from the input stream (file, pipe, or stdin) and stores it in memory. 

#### Execute OPERATION: 

All AWK commands are applied sequentially on the input (records and fields). By default, AWK executes commands on each record/line. This behavior of AWK can be restricted by the use of patterns.

#### REPEAT OPERATION: 

The process of read and execute is repeated until the end of the file is reached.

## Basic actions in awk

Basic actions in awk consist of a pattern and an action

{{< highlight bash >}}
BEGIN {
    printf "Hello World"
}
{{< / highlight >}}

#### Executing awk in a Unix/Linux Pipeline

awk is useful in a unix pipeline is the following example illustrates:

{{< figure src="/media/awk-pipeline.png" >}}

In the following Unix Pipeline we print current processes into awk and print the lines 2 to the nth line using *awk*.

## Regular expressions in awk

Awk is a pattern matching language but comes with strong regular expression support.

* A regular expression is a set of characters used to describe a pattern. 

* A regular expression is generally used to match lines in a file that contain a particular pattern. 

* Many Unix utilities operate on plain text files line by line, such as grep, sed, and awk. 

* Regular expressions search for a pattern on a single line in a file.

#### Types of Regular Expressions

Remember that there are 3 different types of Regular Expressions:

1. Basic Regular Expressions (RE)

2. Extended Regular Expressions (ERE)

3. Simple Regular Expressions (Deprecated)

*The 3rd type is deprecated and should not be used anymore.*

###### Regular Expressions Wikipedia Post

Please read the [Regular Expressions Wikipedia Post](https://en.wikipedia.org/wiki/Regular_expression#Basic_concepts)

> A regular expression, often called a pattern, is an expression used to specify a set of strings required for a particular purpose. A simple way to specify a finite set of strings is to list its elements or members. However, there are often more concise ways to specify the desired set of strings. For example, the set containing the three strings "Handel", "Händel", and "Haendel" can be specified by the pattern H(ä|ae?)ndel; we say that this pattern matches each of the three strings. In most formalisms, if there exists at least one regular expression that matches a particular set then there exists an infinite number of other regular expressions that also match it—the specification is not unique. Most formalisms provide the following operations to construct regular expressions.

**Boolean "or"**

    * A vertical bar separates alternatives. For example, gray|grey can match "gray" or "grey".

**Grouping**

    * Parentheses are used to define the scope and precedence of the operators (among other uses). For example, gray|grey and gr(a|e)y are equivalent patterns which both describe the set of "gray" or "grey".

**Quantification**

    * A quantifier after a token (such as a character) or group specifies how often that a preceding element is allowed to occur. The most common quantifiers are the question mark ?, the asterisk * (derived from the Kleene star), and the plus sign + (Kleene plus).

    * `?` The question mark indicates zero or one occurrences of the preceding element. For example, colou?r matches both "color" and "colour".
    * \* The asterisk indicates zero or more occurrences of the preceding element. For example, ab*c matches "ac", "abc", "abbc", "abbbc", and so on.
    * \+ The plus sign indicates one or more occurrences of the preceding element. For example, ab+c matches "abc", "abbc", "abbbc", and so on, but not "ac".
    
    * `{n}[18]`	The preceding item is matched exactly n times.
        * `{min,}[18]` The preceding item is matched min or more times.
        * `{min,max}[18]` The preceding item is matched at least min times, but not more than max times.

**Wildcard**

    The wildcard *.* matches any character. For example, a.b matches any string that contains an "a", then any other character and then a "b", a.*b matches any string that contains an "a" and a "b" at some later point.

> These constructions can be combined to form arbitrarily complex expressions, much like one can construct arithmetical expressions from numbers and the operations +, −, ×, and ÷. For example, H(ae?|ä)ndel and H(a|ae|ä)ndel are both valid patterns which match the same strings as the earlier example, H(ä|ae?)ndel.

###### Differences between Basic and ERE Regular Expressions

ERE (Extended Regular Expressions) adds ?, +, and |, and EREs removes the need to escape the metacharacters ( ) and { }, which are required in BREs.

* The `?` operator matches on zero or 1
* The `+` operator matches on 1 or more 
* The `|` operator adds alternation, the *or* operator to regexes

Furthermore, as long as the POSIX standard syntax for regexes is adhered to, there can be, and often is, additional syntax to serve specific (yet POSIX compliant) applications

The meaning of metacharacters escaped with a backslash is reversed for some characters in the POSIX Extended Regular Expression (ERE) syntax.

With this syntax, a backslash causes the metacharacter to be treated as a literal character.

So, for example, \( \) is now ( ) and \{ \} is now { }.

Additionally, support is removed for \n backreferences.

###### Using Regexes in Awk

Let us look at an example of matching on a regex pattern with awk.

We have the following text file with the following information:

*emp.dat*

{{< highlight bash >}}
Jack    Jones       9857532312  jack@gmail.com       M   hr      2000
Jane    Kaur        9837432312  jane@gmail.com       F   hr      1800
Eva     Bostick     8827232115  eva@gmail.com        F   lgs     2100
Amit    Mendez      9911887766  amit@yahoo.com       M   lgs     2350
Julie   Nicholson   8826234556  julie@yahoo.com      F   Ops     2500
Ana     Johnson     9856422312  anaj@hotmail.com     F   Ops     2700
Hari    Jones       8827255666  harij@yahoo.com      M   Ops     2350
Victor  Mendez      8826567898  vicm@hotmail.com     M   Ops     2500
John    Nicholson   9911556789  johnn@gmail.com      M   hr      2200
Billy   Bostick     9911664321  billyb@yahoo.com     M   lgs     1900
Sam     Johnson     8856345512  samj@hotmail.com     F   lgs     2300
Ginny   Jones       9857123466  ginnyj@yahoo.com     F   hr      2250
Emily   Kaur        8826175812  emilyk@gmail.com     F   Ops     2100
Amy     Mendez      9857536898  amym@hotmail.com     F   Ops     2500
Tina    Jones       8811776612  tinaj@yahoo.com      F   lgs     2300
{{< / highlight >}}

Now let us match on the following lines: Nicholson and Mendez

We can use alternation with awk and match on the lines like this:

{{< figure src="/media/awk-regex-pattern.png" >}}

Notice here that we enclosed our regex pattern in `/<pattern>/` backslashes and that we used alternation and 4 lines were returned to standard output like expected.

## Using Variables in awk

awk has some builtin variables that can be used like:

* `FS`
    * FS is the field separator variable which by default is the ' ' (space) character

Let us look at an example awk command using it:

{{< highlight bash >}}
ifconfig en0 inet | awk -F ' ' '/inet/ { print  }'
{{< / highlight >}}

Here we use the command line option of `-F` but we can also use it in an inline awk script like this:

{{< highlight bash >}}
ifconfig en0 inet | awk 'BEGIN { FS=" " } /inet/ { print $2 }'
{{< / highlight >}}

Please read the following GNU docs for [Predefined variables in Awk](https://www.gnu.org/software/gawk/manual/html_node/Built_002din-Variables.html)

#### Environment variables in awk

Let us pass some variables into our awk script we will just use the begin block in this example:

Let us look at the *environ.awk* awk script:

{{< highlight bash >}}
#! /usr/local/bin/awk -f

BEGIN {
	for ( i=0; i<ARGC; i++) {
		print ARGV[i];
	}
}

{{< / highlight >}}

{{< figure src="/media/awk-environ-script.png" >}}

Notice that in this example we used the `-f` command line option to specify a file.

We can also invoke the awk script like this:

{{< figure src="/media/awk-executable-script.png" >}}

You will need to change permissions to the script executable with the command:

{{< highlight bash >}}
chmod +x ./usage_scripts/environ.awk
{{< / highlight >}}

#### String conversion in awk

The conversion to string and numeric values occurs automatically in AWK as per demand. 

This means that if a numeric value appears in a string concatenation in awk it is automatically converted to a string.

Therefore if you want to treat a numeric value as a number you will need to do the following:

{{< highlight bash >}}
BEGIN {
    num1 = 5;
    num2 = 4;
    print num1 num2;
    print num1 + num2;
}
{{< / highlight >}}

Look at the following terminal run:

{{< figure src="/media/awk-strconv.png" >}}

Notice how the first line prints the string 45 and the second line prints out the value of 9.

## Using arrays in awk

Please read the [Awk GNU Documentation on Arrays](https://www.gnu.org/software/gawk/manual/html_node/Array-Intro.html#Array-Intro)

> The awk language provides one-dimensional arrays for storing groups of related strings or numbers. Every awk array must have a name. Array names have the same syntax as variable names; any valid variable name would also be a valid array name. But one name cannot be used in both ways (as an array and as a variable) in the same awk program.

> Arrays in awk superficially resemble arrays in other programming languages, but there are fundamental differences. In awk, it isn't necessary to specify the size of an array before starting to use it. Additionally, any number or string, not just consecutive integers, may be used as an array index.

> In most other languages, arrays must be declared before use, including a specification of how many elements or components they contain. In such languages, the declaration causes a contiguous block of memory to be allocated for that many elements. Usually, an index in the array must be a nonnegative integer. For example, the index zero specifies the first element in the array, which is actually stored at the beginning of the block of memory. Index one specifies the second element, which is stored in memory right after the first element, and so on. It is impossible to add more elements to the array, because it has room only for as many elements as given in the declaration. (Some languages allow arbitrary starting and ending indices—e.g., '15 .. 27'—but the size of the array is still fixed when the array is declared.)

*Basically arrays in awk are like a dictionary in Python or map in Golang also known as associative arrays.*

{{< highlight bash >}}
#! /usr/local/bin/awk -f

BEGIN {
    fruits[0] = "apples";
    fruits[1] = "oranges";
    fruits[2] = "strawberries";
    fruits[3] = "bananas";
    fruits[4] = "mangoes";

    for (fruit in fruits) 
        print fruits[fruit];
}
{{< / highlight >}}

*Notice how we used the for ... in operator with arrays in awk to print each value in the awk array.*

Here is a sample run of the awk script:

{{< figure src="/media/awk-arrays.png" >}}

## Standard Output Formatting in Awk

You have seen how to use the print command with awk but you can also use the printf command.

Please read the [printf format string Wikipedia post](https://en.wikipedia.org/wiki/Printf_format_string)

> printf format string refers to a control parameter used by a class of functions in the input/output libraries of C and many other programming languages. The string is written in a simple template language: characters are usually copied literally into the function's output, but format specifiers, which start with a % character, indicate the location and method to translate a piece of data (such as a number) to characters.

The printf command in awk is very similar to the printf command in C and it has the following operators:

A format specifier starts with the character '%' and ends with a format-control letter—it tells the printf statement how to output one item. The format-control letter specifies what kind of value to print. The rest of the format specifier is made up of optional modifiers that control how to print the value, such as the field width. Here is a list of the format-control letters:

#### %a, %A

A floating point number of the form [-]0xh.hhhhp+-dd (C99 hexadecimal floating point format). For %A, uppercase letters are used instead of lowercase ones.

NOTE: The current POSIX standard requires support for %a and %A in awk. As far as we know, besides gawk, the only other version of awk that actually implements it is BWK awk. It's use is thus highly nonportable!

Furthermore, these formats are not available on any system where the underlying C library printf() function does not support them. As of this writing, among current systems, only OpenVMS is known to not support them.

#### %c

Print a number as a character; thus, 'printf "%c", 65' outputs the letter 'A'. The output for a string value is the first character of the string.

NOTE: The POSIX standard says the first character of a string is printed. In locales with multibyte characters, gawk attempts to convert the leading bytes of the string into a valid wide character and then to print the multibyte encoding of that character. Similarly, when printing a numeric value, gawk allows the value to be within the numeric range of values that can be held in a wide character. If the conversion to multibyte encoding fails, gawk uses the low eight bits of the value as the character to print.

Other awk versions generally restrict themselves to printing the first byte of a string or to numeric values within the range of a single byte (0–255). (d.c.)

Please read the [awk printf control letters documentation](https://www.gnu.org/software/gawk/manual/html_node/Control-Letters.html#Control-Letters)

#### %d, %i

Print a decimal integer. The two control letters are equivalent. (The '%i' specification is for compatibility with ISO C.)

#### %e, %E

Print a number in scientific (exponential) notation. For example:

printf "%4.3e\n", 1950
prints '1.950e+03', with a total of four significant figures, three of which follow the decimal point. (The '4.3' represents two modifiers, discussed in the next subsection.) '%E' uses 'E' instead of 'e' in the output.

#### %f

Print a number in floating-point notation. For example:

printf "%4.3f", 1950
prints '1950.000', with a minimum of four significant figures, three of which follow the decimal point. (The '4.3' represents two modifiers, discussed in the next subsection.)

On systems supporting IEEE 754 floating-point format, values representing negative infinity are formatted as '-inf' or '-infinity', and positive infinity as 'inf' or 'infinity'. The special “not a number” value formats as '-nan' or 'nan' (see section Other Stuff to Know).

#### %F

Like '%f', but the infinity and “not a number” values are spelled using uppercase letters.

The '%F' format is a POSIX extension to ISO C; not all systems support it. On those that don't, gawk uses '%f' instead.

#### %g, %G

Print a number in either scientific notation or in floating-point notation, whichever uses fewer characters; if the result is printed in scientific notation, '%G' uses 'E' instead of 'e'.

#### %o

Print an unsigned octal integer (see section Octal and Hexadecimal Numbers).

#### %s

Print a string.

#### %u

Print an unsigned decimal integer. (This format is of marginal use, because all numbers in awk are floating point; it is provided primarily for compatibility with C.)

#### %x, %X

Print an unsigned hexadecimal integer; '%X' uses the letters 'A' through 'F' instead of 'a' through 'f' (see section Octal and Hexadecimal Numbers).

#### %%

Print a single '%'. This does not consume an argument and it ignores any modifiers.

#### Format Modifiers in awk

Please read the following [awk documentation on modifiers with printf](https://www.gnu.org/software/gawk/manual/html_node/Format-Modifiers.html#Format-Modifiers)

###### Awk printf example

Let us look at an example script using printf with awk

{{< highlight bash >}}
{
    for ( i = 1; i < NF; i++) {
        if (i % 2 == 0) {
            printf "%-5s ", $i;
        } else {
            printf "%10s ", $i;
        }
    }
}
{{< / highlight >}}

Notice here that we use the NF builtin variable that is the number of fields we also use the `-` format modifier to left justify any even numbered fields 2, 4, 6, etc. and then use `%10` to right justify strings

Here is a sample run of the script:

{{< figure src="/media/awk-printf-example.png" >}}

## Control flow in awk 

As you have seen with awk there is control flow operators such as `for`, `for ... in`, `if`, `else`, `else if` and so on

We can use relational operators such as the and operator `&&` and the or operator `||` in awk.

*You can also use break and continue statements in awk and while loops.*

Let us look at a sample script where we use a while loop and if statements.

{{< highlight bash >}}
{
    i = 1;
    while (i < NF) {
        if (i % 2 == 0 ) {
            print $i " Ding Dong";
        } else {
            print $i;
        }
        i++;
    }
}
{{< / highlight >}}

Here is a sample run of the script using a data file that looks like this:

{{< highlight txt >}}
honda           civic       2005        60000       3
chevy           silverado   2016        33000       2
chevy           tavera      1999        10000       4
toyota          corolla     1995        95000       2
ford            escape      2012        80000       1
honda           accord      2000        60000       2
fiat            punto       2007        45000       3
{{< / highlight >}}

{{< figure src="/media/awk-control-flow1.png" >}}

## Functions in awk

*Awk has both builtin functions that you can utilize as well as user defined function that you can define yourself.*

Please check out the [gnu documentation on awk builtin functions](https://www.gnu.org/software/gawk/manual/html_node/Built_002din.html#Built_002din)

Here is a list of builtin functions:

* Numeric Functions:	  	
    * Functions that work with numbers, including int(), sin() and rand().

* String Functions:	  	
    * Functions for string manipulation, such as split(), match() and sprintf().

* I/O Functions:	  	
    * Functions for files and shell commands.

* Time Functions:	  	
    * Functions for dealing with timestamps.

* Bitwise Functions:	  	
    * Functions for bitwise operations.

* Type Functions:	  	
    * Functions for type information.

* I18N Functions:	  	
    * Functions for string translation.

**One thing of note is that some of the builtin functions only work for the GNU Implementation of awk and not BSD Awk or other awk variants.**

Here is an example program using builtin functions in awk and user defined functions.

#### User Defined Awk functions

We can create functions in awk with the following syntax

{{< highlight bash >}}
function someFunc(arg1, argn) {
    ......
    return someArg
}
{{< / highlight >}}


###### Awk Builtin Function and User Defined Functions example

In the following example we use builtin awk functions and user defined ones

{{< highlight bash >}}
#! /usr/local/bin/awk -f

BEGIN {
    # Numeric Functions examples
    print sqrt(3);
    print rand();

    # String Functions examples
    nums["one"] = "one";
    nums["two"] = "two";
    nums["three"] = "three";
    asort(nums);
    for (num in nums)
        print nums[num];
    
    for (i=1; i <= 10; i++) {
        arr[i] = i+1;
    }
}
{
    # globally subsitute each record that matches on honda to mercury
    gsub(/honda/, "mercury"); print;
    split($6, strings, ":");
    print strings[1];
}

function average(arr) {
    sum = 0;
    for (i = 1; i <= length(arr); i++) {
        sum += i;
    }
    return sum / length(arr); 
}

END {
    avg = average(arr);
    print avg;
}
{{< / highlight >}}

{{< figure src="/media/awk-functions.png" >}}

Here is a sample run of our awk script notice that we used and END block here.

#### Startup and Cleanup Actions

You can use the BEGIN block in awk for any startup actions and the END block for any cleanup actions in awk.

the body block will operate on 1 or more records which consist of 1 or more fields in a record.

Notice that the BEGIN and END blocks will be done once although you can define multiple BEGIN and END blocks depending on how elaborate of an awk script you are writing.

## Further reading

Please read the official awk guide on [GNU Awk Guide](https://www.gnu.org/software/gawk/manual/html_node/)

For a modern and current book on awk I would suggest reading this Packt Publishing Book [Learning Awk Programming](https://www.packtpub.com/big-data-and-business-intelligence/learning-awk-programming)

## Contact Information 

If you like this post then please follow me at [jbelmont @ github](https://github.com/jbelmont) and [jbelmont80 @ twitter](https://twitter.com/jbelmont80) for more related type posts.

Feel free to leave a comment if you like.

Until Next Time :)