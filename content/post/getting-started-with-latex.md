+++
title = "Getting Started With Latex"
date = "2018-11-11T21:26:43-05:00"
math = true
highlight = true
tags = ["Tex", "Latex", "TypeSetting"]
summary = """
Getting started with Latex
"""
+++

LaTex is a Typesetting system which was designed by [Leslie Lamport](https://en.wikipedia.org/wiki/Leslie_Lamport) and derives much of its power from [Tex](https://en.wikipedia.org/wiki/TeX). It can be argued that LaTex is a set of macros.

## Difference between Tex and LaTex

*TeX is about formatting with document/template designers in mind while LaTeX is all about  the content for document writers.*

Please read this [stackexchange post for more details](https://tex.stackexchange.com/questions/49/what-is-the-difference-between-tex-and-latex)

## Why is LaTex useful?

You can more fine grain control of the quality of your document by using LaTex. 

Particularly if you are writing documents heavy in Mathematics, Science and Research Papers.

Also LaTex lets you separate out the content of your writing from the layout of your document.

LaTex lets you focus on the "what" of what you are writing and not "how" the final document will look.

## Installing LaTex in Mac OS X

You can install LaTex in Mac OS X easily by going to [MacTex](http://www.tug.org/mactex/).

You will get all the LaTex macros, compilers, editors and more in this full blown LaTex working environment.

## Installing LaText in Windows

You can install LaTex in Windows by going to [MikTex](https://miktex.org/download) and to [Tex Live](http://www.tug.org/texlive/acquire-netinstall.html). It is best to install the full LaTex distribution.

## Basic syntax of a LaTex Document

Here is a simple LaTex Document:

*helloWorld.tex*:
```tex
\documentclass{article}

\begin{document}
Hello world!
\end{document}
```

You begin a LaTex document with `\documentclass` command and then you use `\begin{document}` command to start. 

Notice that here we placed *Hello, world!* in between `\begin{document}` and `\end{document}`

## Compile LaTex Documents with latexmk command

We can compile our latex document with this command:

`latexmk -pdf helloWorld.tex`

{{< figure src="/media/latex-helloworld.png" >}}

Here is the generated pdf with this command:

{{< figure src="/media/latex-helloworld-pdf.png" >}}

## Compile LaTex Documents with latex command

Let us look at another Tex document with tables now:

```tex
\documentclass{article} 
\usepackage[english]{babel}

\begin{document}

Without specifying width for last column:
\begin{center}
    \begin{tabular}{| l | l | l | l |}
    \hline
    Day & Min Temp & Max Temp & Summary \\ \hline
    Monday & 11C & 22C & A clear day with lots of sunshine.
    However, the strong breeze will bring down the temperatures. \\ \hline
    Tuesday & 9C & 19C & Cloudy with rain, across many northern regions. Clear spells 
    across most of Scotland and Northern Ireland, 
    but rain reaching the far northwest. \\ \hline
    Wednesday & 10C & 21C & Rain will still linger for the morning. 
    Conditions will improve by early afternoon and continue 
    throughout the evening. \\
    \hline
    \end{tabular}
\end{center}

With width specified:
\begin{center}
    \begin{tabular}{ | l | l | l | p{5cm} |}
    \hline
    Day & Min Temp & Max Temp & Summary \\ \hline
    Monday & 11C & 22C & A clear day with lots of sunshine.  
    However, the strong breeze will bring down the temperatures. \\ \hline
    Tuesday & 9C & 19C & Cloudy with rain, across many northern regions. Clear spells 
    across most of Scotland and Northern Ireland, 
    but rain reaching the far northwest. \\ \hline
    Wednesday & 10C & 21C & Rain will still linger for the morning. 
    Conditions will improve by early afternoon and continue 
    throughout the evening. \\
    \hline
    \end{tabular}
\end{center}

\end{document}
```

We can compile this document with the the *latex* command now and then use `dvipdfm` to convert from dvi to pdf:

{{< figure src="/media/convert-dvi-to-pdf.png" >}}

## Compile LaTex documents with pdflatex command

We can compile directly into pdf with the *pdflatex* command:

{{< figure src="/media/pdflatex-command.png" >}}

## Global Structure of LaTex Document

Every file should have this structure but there are exceptions to this:

```tex
\documentclass{...}

\begin{document}
...
\end{document}
```

*The area between \documentclass{...} and \begin{document} is called the preamble.*

It normally contains commands that affect the entire document.

#### Document Classes

This table has a complete list of all LaTex Document Classes:

| Document Class | Description |
| --- | --- |
article | For articles in scientific journals, presentations, short reports, program documentation, invitations, ... |
IEEEtran | For articles with the IEEE Transactions format. |
proc | A class for proceedings based on the article class. |
report | For longer reports containing several chapters, small books, thesis, ... |
book | For real books. |
slides | For slides. The class uses big sans serif letters. |
memoir | For changing sensibly the output of the document. It is based on the book class, but you can create any kind of document with it |
letter | For writing letters. |
beamer | For writing presentations (see LaTeX/Presentations). |

#### Using Packages in LaTex

[Packages Wiki](https://en.wikibooks.org/wiki/LaTeX/Document_Structure#Packages)

> While writing your document, you will probably find that there are some areas where basic LaTeX cannot solve your problem. 

> If you want to include graphics, colored text or source code from a file into your document, you need to enhance the capabilities of LaTeX. 

> Such enhancements are called packages. Some packages come with the LaTeX base distribution. Others are provided separately. Modern TeX distributions come with a large number of packages pre-installed. The command to use a package is pretty simple: \usepackage

Here is an example usage for importing packages:

```tex
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsthm}
```

#### Using Sections in LaTex

> The commands for inserting sections are fairly intuitive. Of course, certain commands are appropriate to different document classes. For example, a book has chapters but an article doesn't. 

Here is an example:

```tex
\chapter{Introduction}
This chapter's content...

\section{Structure}
This section's content...

\subsection{Top Matter}
This subsection's content...

\subsubsection{Article Information}
This subsubsection's content...
```

## Getting started with Travis CI

If you want to get setup with Travis CI please read this blog post: 

https://harshjv.com/blog/setup-latex-pdf-build-using-travis-ci/

## Getting overall advice on LaTex

Please read this very informative Github Repo on [LaTex](https://github.com/dspinellis/latex-advice)

## Different Types of File Types in LaTex

There are a myriad of different file types that LaTex can work with:

| FileType | Description |
| --- | --- |
| .aux | A file that transports information from one compiler run to the next. Among other things, the .aux file is used to store information associated with cross-references. |
| .bbl | Bibliography file output by BiBTeX and used by LaTeX |
| .bib | Bibliography database file. (where you can store a list of full bibliographic citations) |
| .blg | BiBTeX log file. (errors are logged here) |
| .bst | BiBTeX style file. |
| .cls | Class files define what your document looks like. They are selected with the \documentclass command. |
| .dtx | Documented TeX. This is the main distribution format for LaTeX style files. If you process a .dtx file you get documented macro code of the LaTeX package contained in the .dtx file. |
| .ins | The installer for the files contained in the matching .dtx file. If you download a LaTeX package from the net, you will normally get a .dtx and a .ins file. Run LaTeX on the .ins file to unpack the .dtx file. |
| .fd | Font description file telling LaTeX about new fonts. |
| .dvi | Device Independent File. This is the main result of a LaTeX compile run with latex. You can look at its content with a DVI previewer program or you can send it to a printer with dvips or a similar application. |
| .pdf | Portable Document Format. This is the main result of a LaTeX compile run with pdflatex. You can look at its content or print it with any PDF viewer. |
| .log | Gives a detailed account of what happened during the last compiler run. |
| .toc | Stores all your section headers. It gets read in for the next compiler run and is used to produce the table of contents. |
| .lof | This is like .toc but for the list of figures. |
| .lot | And again the same for the list of tables. |
| .idx | If your document contains an index. LaTeX stores all the words that go into the index in this file. Process this file with makeindex. |
| .ind | The processed .idx file, ready for inclusion into your document on the next compile cycle. |
| .ilg | Logfile telling what makeindex did. |
| .sty | LaTeX Macro package. This is a file you can load into your LaTeX document using the \usepackage command. |
| .tex | LaTeX or TeX input file. It can be compiled with latex. |
| .out | hyperref package file, just one for the master file. |

## Read Online LaTex Book

Please read the following [LaTex Wiki Book](https://en.wikibooks.org/wiki/LaTeX)

## LaTex Workshop

I will be building a LaTex workshop that you can follow if you wish [Here](https://github.com/jbelmont/latex-workshop)

## How to find me

If you like this blog post then please follow me at [jbelmont @ github](https://github.com/jbelmont) and [jbelmont80 @ twitter](https://twitter.com/jbelmont80)