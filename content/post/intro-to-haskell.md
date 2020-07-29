+++
title = "Intro to Haskell"
date = "2020-07-13T10:49:02-04:00"
math = true
tags = ["functional programming"]
draft = false
summary = """
An introduction to Haskell, Stack and GHCI
"""
+++

# Haskell Programming Language

[Haskell Wikipedia](https://en.wikipedia.org/wiki/Haskell_%28programming_language%29)

> Haskell is a general-purpose, statically typed, purely functional programming language with type inference and lazy evaluation.

Haskell is a powerful programming language although many developers avoid it since it isn't like other mainstream languages.

Most universities teach procedural like languages such as Java and C++ and so most developers start learning programming from this perspective. 

Since Haskell is a purely functional programming languages you don't rely on mutation and side effects.

Also due to the fact that it is a statically typed language and affords stronger compile time guarantees.

## Stack

[Stack](https://docs.haskellstack.org/en/stable/GUIDE/) is a build tool built for Haskell code.

We will use stack in order to create a Haskell project that we can both build and test.

We will also use the GHCI Repl with stack in order to do some introspection.

#### Scafolding new Haskell Project

We can use stack to generate a new haskell project.

{{< figure src="/media/stack-templates-command.png" >}}

Notice here that we can use the `stack templates` to find available templates. 

In this case we just want to use the default template so we will just not provide a template name.

{{< highlight bash >}}
stack new helloworld
{{< / highlight >}}

The command above will generate a new haskell project with the following files:

{{< highlight bash >}}
ls helloworld
ChangeLog.md     README.md        app              package.yaml     stack.yaml
LICENSE          Setup.hs         helloworld.cabal src              test
{{< / highlight >}}

#### Building Haskell Project

Know that we have created our Haskell project let us build it.

{{< figure src="/media/stack-build-command.png" >}}

Notice that the `stack build` command must be run from the project folder that got generated called helloworld.

#### Running the newly built Haskell project

You can run the Haskell project in 2 ways:

{{< figure src="/media/stack-exec-command.png" >}}

Here we used the `stack exec <name_of_binary>` and we also run the binary executable from the root of our project:

```bash
.stack-work/dist/x86_64-osx/Cabal-3.0.1.0/build/helloworld-exe/helloworld-exe
```

#### Updating our Haskell Source Code

Let us actually make a change to the string printed out and rebuild our project.

We will go inside of of `src/Lib.hs` and edit the `putStrLn` action with a new string.

{{< highlight haskell >}}
module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = putStrLn "Hello New Haskellers!"
{{< / highlight >}}

Here we updated to the string to 'Hello New Haskellers!'

#### Let us rebuild the Haskell project and see our new I/O  Action

{{< figure src="/media/stack-build-and-exec.png" >}}

Notice that our change was picked up after reran `stack build`

#### Testing our Haskell Code

{{< figure src="/media/stack-test-command.png" >}}

Notice that in this command execution that `stack` run our defined tests.

Here is the test code that `stack` stubbed out for us:

{{< highlight haskell >}}
main :: IO ()
main = putStrLn "Test suite not yet implemented"
{{< / highlight >}}

In this case our test simply does an I/O Action that prints out: 

*Test suite not yet implemented*

When we are ready to actually write our application these stack commands will help us greatly!

#### Invoking GHCI with Stack

{{< figure src="/media/stack-ghci-sample.png" >}}

Notice that here we can call the Main routine by simply executing `main`

We can also call Prelude Actions such as *putStrLn* directly inside of the GHCI Repl.

## How to find me

If you like this blog post then please follow me at [jbelmont @ github](https://github.com/jbelmont) and [jbelmont80 @ twitter](https://twitter.com/jbelmont80)