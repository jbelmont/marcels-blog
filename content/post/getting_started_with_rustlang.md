+++
title = "Getting started with Rustlang"
date = "2018-08-26T20:30:37-04:00"
draft = false
tags = ["Rustlang", "Languages"]
math = true
summary = """
Getting started with Rustlang
"""
+++

# In this Blog Post I go over getting started with Rustlang

> Rust is a systems programming language that runs blazingly fast, prevents segfaults, and guarantees thread safety.

## Installing Rust in Mac OS X / Linux

To install Rust in Linux and Mac OS X run the following command:

```bash
curl https://sh.rustup.rs -sSf | sh
```

For other installation methods please read the following [documentation](https://www.rust-lang.org/en-US/other-installers.html)

Add the cargo binaries to your path by adding the following entry in *~/.profile*, *~/.bash_profile* *~/.bashrc*, *~/.zshrc*:

```bash
echo "export PATH="$HOME/.cargo/bin:$PATH"" >> ~/.zshrc
```

Note here that I appended this using `>>` to *~/.zshrc* but you may choose *~/.bashrc* or another file.

#### Installing Rust in Windows

On Windows, go to [install](https://www.rust-lang.org/install.html) and follow the instructions for installing Rust. 

You will need to install C++ build tools for Visual Studio 2013 or later here but it is best to just install [Visual Studio Build Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2017)

The tools are in the Other Tools and Frameworks section which looks like this:

{{< figure src="/media/vs-build-tools.png" >}}

#### Check Rust Installation

If Rust is installed then you should be able to run the following command in your terminal windows:

```bash
rustc --version
rustc 1.26.2 (594fb253c 2018-06-01)
```

## Updating Rustlang

In order to update the rust binaries you need to run the following command:

```bash
rustup update
```

Now when we run the `--version` options with rustc a new version should be reported if the update found a new version:

```bash
rustc --version
rustc 1.28.0 (9634041f0 2018-07-30)
```

## Viewing Local Documentation

In order to see local documentation you can run the following command:

```bash
rustup doc
```

## Cargo Package Manager

Rust comes with a powerful package manager called **cargo**.

You can create new rust packages by using the cargo package manager.

The command you use is: `cargo new` with options and provide a name

#### Create a new binary template package

If you want to create a new rust binary template application then run the following command:

```bash
cargo new PACKAGE_NAME --bin
```

#### Create a new library template package

If you want to create a new rust library template application then run the following command:

```bash
cargo new PACKAGE_NAME --lib
```

#### The contents of a new binary template package

When you create a new binary application cargo will create the following files:

{{< figure src="/media/new_rust_package_contents.png" >}}

Notice that the following files were created:

* Cargo.lock
    * This file locks your dependencies
* Cargo.toml
    * This file will have basic metadata for the rust package and dependencies
* src directory
    * main.rs
        * This will be main program for the application

Contents of *Cargo.toml*:

```toml
[package]
name = "hello-world"
version = "0.1.0"
authors = ["Jean-Marcel Belmont <marcelbelmont@gmail.com>"]

[dependencies]
```

Contents of *src/main.rs*:

```rust
fn main() {
    println!("Hello, world!");
}
```

#### Build Rust package

In order to build the rust package you can run the following command:

{{< figure src="/media/cargo-build.png" >}}

This command generates the *target* directory with the following content:

{{< figure src="/media/target-directory.png" >}}

#### Running Rust package

You could run rust packages by issuing the following command:

```bash
cargo run
```

This will build and run the rust package.

#### Check the Rust package for build issues

You can use the `cargo check` command to see if your package will build but it will not create an executable.

#### Running tests with Cargo

You can easily run tests by using the `cargo test` command in the root of your project.

Whenever you create a new library it will stub out a test for you in *src/lib.rs*:

```rust
#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
```

**Notice here that there is an annotation of `#[cfg(test)]` for the tests module and `#[test]` for the test case.**

## Resources to learn Rustlang

Arguably the best resource to learn Rust is the [Official Rust Book](https://doc.rust-lang.org/book/2018-edition/index.html).

The Rust Book will walk you through each and every aspect of the Rust Language so please read it!

#### Read the Standard Library

Another way to learn Rust well is to read the Standard Library [Here](https://doc.rust-lang.org/std/index.html)

You should also read [A tour of the standard library](https://doc.rust-lang.org/std/index.html#a-tour-of-the-rust-standard-library) which will list all the primitive types, modules, and macros in Rust.

#### Using the Rust Playground

Much like Golang has a playground so does Rust.

Here is a link to the Rust Playground that uses Rust nightly and has debugging mode enabled [Here](https://play.rust-lang.org/?version=nightly&mode=debug&edition=2018)

## Community Links

Check out all the community related information [Here](https://www.rust-lang.org/en-US/community.html)

If you like this Blog Post please follow me at [jbelmont at Github](https://github.com/jbelmont)