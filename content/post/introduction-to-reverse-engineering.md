+++
title = "Introduction to Reverse Engineering"
date = "2018-12-19T20:37:56-05:00"

math = false
highlight = true
tags = ["Radare", "Reverse Engineering"]
summary = """
An Introduction to Reverse Engineering
"""
+++

# Reverse Engineering

What is Reverse Engineering?

According to Wikipedia Reverse Engineering is:

> is the process by which a man-made object is deconstructed to reveal its designs, architecture, or to extract knowledge from the object; similar to scientific research, the only difference being that scientific research is about a natural phenomenon.

According to the c2Wiki Reverse Engineering is:

> is about presenting a piece of software at a higher level of abstraction. It can be based on sources or on binaries:

## Why embark on Reverse Engineering at all?

[Reverse Engineering Wiki](https://en.wikibooks.org/wiki/Introduction_to_Software_Engineering/Reengineering/Reverse_Engineering)

Reasons for reverse engineering:

* Interoperability.

* Lost documentation: Reverse engineering often is done because the documentation of a particular device has been lost (or was never written), and the person who built it is no longer available. 

* Integrated circuits often seem to have been designed on obsolete, proprietary systems, which means that the only way to incorporate the functionality into new technology is to reverse-engineer the existing chip and then re-design it.

* Product analysis. To examine how a product works, what components it consists of, estimate costs, and identify potential patent infringement.

* Digital update/correction. To update the digital version (e.g. CAD model) of an object to match an "as-built" condition.

* Security auditing.

* Acquiring sensitive data by disassembling and analysing the design of a system component.

* Military or commercial espionage. Learning about an enemy's or competitor's latest research by stealing or capturing a prototype and dismantling it.

* Removal of copy protection, circumvention of access restrictions.

* Creation of unlicensed/unapproved duplicates.

* Materials harvesting, sorting, or scrapping.

* Academic/learning purposes.

* Curiosity.

* Competitive technical intelligence (understand what your competitor is actually doing versus what they say they are doing).

* Learning: learn from others' mistakes. Do not make the same mistakes that others have already made and subsequently corrected.

*As you can see some of the reasons of reverse engineering can be nefarious but my intent for this blog post is for my personal curiosity and learning only*

## List of Reverse Engineering Tools

* [Apktool](https://ibotpeaches.github.io/Apktool/)

    * A tool for reverse engineering 3rd party, closed, binary Android apps. It can decode resources to nearly original form and rebuild them after making some modifications. It also makes working with an app easier because of the project like file structure and automation of some repetitive tasks like building apk, etc.
    * It is NOT intended for piracy and other non-legal uses. It could be used for localizing, adding some features or support for custom platforms, analyzing applications and much more.

* [dex2jar](https://github.com/pxb1988/dex2jar)

    *  dex2jar is a tool for converting Android's .dex format to Java's .class format. just one binary format to another binary format, not to source.

* [Clang LLVM Compiler](https://clang.llvm.org/)
    
    * The Clang project provides a language front-end and tooling infrastructure for languages in the C language family (C, C++, Objective C/C++, OpenCL, CUDA, and RenderScript) for the LLVM project. Both a GCC-compatible compiler driver (clang) and an MSVC-compatible compiler driver (clang-cl.exe are provided. 

* [edb (evans debugger)](https://github.com/eteran/edb-debugger)

    * edb is a cross platform AArch32/x86/x86-64 debugger. It was inspired by Ollydbg, but aims to function on AArch32, x86, and x86-64 as well as multiple OS's. Linux is the only officially supported platform at the moment, but FreeBSD, OpenBSD, OSX and Windows ports are underway with varying degrees of functionality.

* [distorm3](https://github.com/gdabah/distorm/)

    * diStorm3 is really a decomposer, which means it takes an instruction and returns a binary structure which describes it rather than static text, which is great for advanced binary code analysis.

* [flasm](http://flasm.sourceforge.net/)

    * Flasm disassembles your entire SWF including all the timelines and events. Looking at disassembly, you learn how the Flash compiler works, which improves your ActionScript skills. You can also do some optimizations on the disassembled code by hand or adjust the code as you wish. Flasm then applies your changes to the original SWF, replacing original actions.

* [jad decompiler](http://www.javadecompilers.com/jad)

    * jad is a command line program that decompiles java code

* [javasnoop](https://tools.kali.org/reverse-engineering/javasnoop)

    * javasnoop is a tool created by aspect security that allows you to attach to an existing process (like a debugger) and instantly begin tampering with method calls, run custom code, or just watch what’s happening on the system.

* [ollydbg](http://www.ollydbg.de/)

    * OllyDbg is a 32-bit assembler level analysing debugger for Microsoft Windows. Emphasis on binary code analysis makes it particularly useful in cases where source is unavailable. OllyDbg is a shareware, but you can download and use it for free.

* [nasm](https://www.nasm.us/xdoc/2.14/html/nasmdoc1.html)

    * The Netwide Assembler, NASM, is an 80x86 and x86-64 assembler designed for portability and modularity. It supports a range of object file formats, including Linux and *BSD a.out, ELF, COFF, Mach-O, 16-bit and 32-bit OBJ (OMF) format, Win32 and Win64. It will also output plain binary files, Intel hex and Motorola S-Record formats. Its syntax is designed to be simple and easy to understand, similar to the syntax in the Intel Software Developer Manual with minimal complexity. It supports all currently known x86 architectural extensions, and has strong support for macros.

* [Valgrind](http://www.valgrind.org/)

    * Valgrind is an instrumentation framework for building dynamic analysis tools. There are Valgrind tools that can automatically detect many memory management and threading bugs, and profile your programs in detail. You can also use Valgrind to build new tools.

* [radare2](https://github.com/radare/radare2)

    * Radare2 (also known as r2) is a complete framework for reverse-engineering and analyzing binaries; composed of a set of small utilities that can be used together or independently from the command line. Built around a disassembler for computer software which generates assembly language source code from machine-executable code, it supports a variety of executable formats for different processors and operating systems.

## Basic Unix Tools to inspect binary executables

*strings - print the strings of printable characters in files.*

It is mainly used to look at printable characters in a binary executable

Let us say that we have the following hello world file written in c

```c
#include <stdio.h>
#include <stdlib.h>

int main(){
	printf("Hello, world!\n");

	exit(0);
}
```

Now let us say that we generate a binary executable with gcc like this: `gcc -o hello.c hello`

We could use the strings command to print out the contents of it

In the screenshot below we print out the contents of the binary executable with strings

{{< figure src="/media/strings.png" >}}

We can use the *objdump* command to explore: *objdump - display information from object files.*

objdump displays information about one or more object files.  

The options control what particular information to display.  

This information is mostly useful to programmers who are working on the compilation tools, as opposed to programmers who just want their program to compile and work.

Notice in this screenshot we got an object dump using intel and we are looking for the main method here

{{< figure src="/media/objdump.png" >}}

Next we can use the *xxd* command to look at that particular address printed in the screen:

*xxd - make a hexdump or do the reverse.*

{{< figure src="/media/xxd.png" >}}

In this screenshot we got the hexdump of the address space that corresponds with the objdump information from the previous screenshot.

## Kali Linux Tools for Reverse Engineering, Penetration Testing and More

You can use many of the tools I listed earlier in the blog post in the Kali Linux Operating System.

Kali Linux is a Debian-derived Linux distribution designed for digital forensics and penetration testing. 

You can download [Kali Linux Here](https://www.kali.org/downloads/)

## A quick look at Radare for reverse engineering

Now recall that earlier we had compiled a simple hello world program written and c and compiled it using the gcc compiler.

Using [radare2] we can look at the compiled executable and look at the opcodes and assembly code.

We can look at the main function using radare.

In a terminal session let us look at which teletype (tty) to help radare hook into the proper shell session.

{{< figure src="/media/tty.png" >}}

Next let us keep the tty session a long time by using the sleep command like this:

{{< figure src="/media/sleep.png" >}}

We can create a target script with a `.rr2` file extension which will run in radare2 at startup time

*hello.rr2*:

```sh
#!/usr/bin/env radare2
program=hello
stdio=/dev/pts/1
```

Now that we have a configuration setup let us start using radare2. The actual command is `r2`

In the screenshot below we start the hello world binary executable:

{{< figure src="/media/r2-initate.png" >}}

We can enter `aaa` into the radare2 session to have radare2 analyze the binary executable.

Here is the information printed by radare2:

{{< figure src="/media/aaa.png" >}}

Now radare also has a lot of Vim mappings so if you enter the *V* command and press enter you get into Visual Mode which looks like this:

{{< figure src="/media/visual-mode-r2.png" >}}

Now this mode can be confusing so enter the command `?` to see all the available commands while in visual mode:

{{< figure src="/media/visual-mode-help.png" >}}

You can change how the visual mode show information by cycling through with the p command which can have the following modes:

* hex
* disasm
* debug
* words
* buf

I like the debug mode in radare which looks like this:

{{< figure src="/media/visual-mode-debug.png" >}}

Now in order to enter a command in visual mode press `:` key in your keyboard

You should see a screen like this:

{{< figure src="/media/visual-mode-main.png" >}}

Now notice that we hit a breakpoint in radare

{{< figure src="/media/visual-mode-breakpoint.png" >}}

There are many more feature and options in Radare which you can read at in the official [Radare2 Gitbook](https://radare.gitbooks.io/radare2book/)

## How to find me

If you like this blog post then please follow me at [jbelmont @ github](https://github.com/jbelmont) and [jbelmont80 @ twitter](https://twitter.com/jbelmont80)