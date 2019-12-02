+++
title = "Creating Documentation With Groff"
date = "2019-12-01T15:03:59-05:00"
draft = false
math = true
tags = ["terminal", "documentation", "linux"]
summary = """
An introduction to using groff to generate documentation in the terminal.
"""
+++

In this blog post I go over using groff which is a *nix utility that you can use to format documentation like LaTex but with a much reduced learning curve and simpler syntax.

## Definition of groff

[What is groff?](https://www.gnu.org/software/groff/manual/html_node/What-Is-groff_003f.html#What-Is-groff_003f)

> groff belongs to an older generation of document preparation systems, which operate more like compilers than the more recent interactive WYSIWYG systems. groff and its contemporary counterpart, TeX, both work using a batch paradigm: The input (or source) files are normal text files with embedded formatting commands. These files can then be processed by groff to produce a typeset document on a variety of devices.

#### Groff usages

*The main uses for groff is for creating man pages in linux.*

You can also use groff to generate pdf files and post script files.

###### Groff generated post script

{{< figure src="/media/groff_hello_world.png" >}}

Notice that we just simple created a file with the groff utility and groff generated a postscript file for use.

[PostScript Wikipedia definition](https://en.wikipedia.org/wiki/PostScript)

> PostScript (PS) is a page description language in the electronic publishing and desktop publishing business. It is a dynamically typed, concatenative programming language and was created at Adobe Systems by John Warnock, Charles Geschke, Doug Brotz, Ed Taft and Bill Paxton from 1982 to 1984.

Interestingly, PostScript is a turing-comple programming language but most of the time post script is used as an intermediate document format.

Another reasen that PostScript is used is because you can create documents programatically with it and PostScript is heavily used with LaTex/Tex formatting.

*Editors typically will use Post Script files along with Pdf files since they can be edited, while pdf files cannot.*

If you have the original PostScript file then you can easily fix formatting issues then with a pdf file.

**With that sidebar out of the way let us get back to talking about groff.**

#### Groff macro packages

{{< highlight bash >}}
man groff | col -b | awk '/Macro Packages/,/Programming Language/'
{{< / highlight >}}

The man pages are generally created using `groff` command and so if you need to do any `grep` then you should use the `col` command.

###### col command

> The col utility filters out reverse (and half reverse) line feeds so that the output is in the correct order with only forward and half forward line feeds, and replaces white-space characters with tabs where possible.  This can be useful in processing the output of nroff(1) and tbl(1).

Macro Packages:

Macro  packages  can be included by option -m.  The groff system implements and extends all classical macro packages in a compatible way and adds
some packages of its own.  Actually, the following macro packages come with groff:

* `man`    
    * The traditional man page format; see groff_man(7).  It can be specified on the command line as -man or -m man.

* `mandoc` 
    * The general package for man pages; it automatically recognizes whether the documents uses the man or the mdoc format and branches  to  the corresponding macro package.  
    * It can be specified on the command line as -mandoc or -m mandoc.

* `mdoc`   
    * The BSD-style man page format; see groff_mdoc(7).  
    * It can be specified on the command line as -mdoc or -m mdoc.

* `me`     
    * The classical me document format; see groff_me(7).  It can be specified on the command line as -me or -m me.

* `mm` 
    * The classical mm document format; see groff_mm(7).  It can be specified on the command line as -mm or -m mm.

* `ms`  
    * The classical ms document format; see groff_ms(7).  It can be specified on the command line as -ms or -m ms.

* `www`    
    * HTML-like macros for inclusion in arbitrary groff documents; see groff_www(7).

For the purposes of this blog post we will only look at using `me` macros for the groff command.

#### Groff command syntax with `me` macros

You use commands in groff in their own separate line and prefix them with a `.` character.

The `me` macros is typically used for technical papers and so it may not be appropriate for other intended usages and/or audiences.

Please read the [groff_me man page](http://man7.org/linux/man-pages/man7/groff_me.7.html) for more information on the available request command macros

All macro requests must be on their own line else they won't work and they must be by themselves:

{{< highlight bash >}}
\" This works
.pp

\" This does not work
Here I am .pp
{{< / highlight >}}

###### basics of `me` with groff example

{{< highlight bash >}}
\" paragraph request
.pp
You can make a paragraph like this:
\" bulleted lists start with .bu
.bu
Rocky
.bu
Rambo
.bu
Snake
.pp
Start a numbered list:
.np
I am the alpha
.np
and
.np
the omega
.pp
Any numbered lists are reset on the next occurrence of .pp
{{< / highlight >}}

###### Page layout with groff `me` macro

You can use the `.b` request for bolding text and the `.i` macro request to italicize.

You can also use the `.u` macro request for underlines and `.bu` for bold italic

{{< highlight bash >}}
.pp
I am going to 
.b "bold this text"
and I am going to 
.i "italicize this text"
and I will 
.bu "bold and italicize"
this text
{{< / highlight >}}

#### Making lists with `me` macro

You can make some lists using the `.(l \n\nSome stuff.)l`

Here is an example of a list:

{{< highlight bash >}}
.(l
Shine Shoes
Cut Hair
Get Dressed
.)l
{{< /highlight >}}

#### Setting font size

you can use the `.ps` request to set font size:

{{< highlight bash >}}
.ps 24
I am large text
.ps 6 
I am tiny text
{{< / highlight >}}

#### Set leading paragraph

You can use the `.lp` macro request for leading paragraphs.

#### Quote text

You can quote text using `\*(lqMy Text is quoted.\*(rq`

Here is an example:

{{< highlight bash >}}
You can quote text using `\*(lqMy Text is quoted.\*(rq`
{{< / highlight >}}

#### Combining example into one `groff` file

Let us combine all of the example we have shown thus far into one larger example like this:

{{< highlight bash >}}
\" paragraph request
.pp
You can make a paragraph like this:
\" bulleted lists start with .bu
.bu
Rocky
.bu
Rambo
.bu
Snake
.pp
Start a numbered list:
.np
I am the alpha
.np
and
.np
the omega
.pp
Any numbered lists are reset on the next occurrence of .pp
.pp
I am going to 
.b "bold this text"
and I am going to 
.i "italicize this text"
and I will 
.bu "bold and italicize"
this text
.(l
Shine Shoes
Cut Hair
Get Dressed
.)l
.ps 24
I am large text
.ps 6 
I am tiny text
You can quote text using `\*(lqMy Text is quoted.\*(rq`
{{< / highlight >}}

Using the text above we will create a new groff file and add the `.groff` file extension.

{{< figure src="/media/groff-vim.png" >}}

#### Generating a `PostScript` file with groff

{{< figure src="/media/groff-create-postscript.png" >}}

In the example above we create a new post script file using `groff` utility

#### Generating a `pdf` file with `ps2pdf` command

Next we can use the `ps2pdf` command to create a pdf with our postscript file like this:

{{< highlight bash >}}
ps2pdf example.ps example.pdf
{{< /highlight >}}

#### Generated pdf example

Here is our beautifully made pdf :)

{{< figure src="/media/groff-pdf.png" >}}

If you like this blog post then please consider following me on the following social media outlets:

## Twitter & Github Account

Please follow me at [jbelmont @ github](https://github.com/jbelmont) and [jbelmont80 @ twitter](https://twitter.com/jbelmont80)

Feel free to leave a comment if you like.

Until Next Time :)