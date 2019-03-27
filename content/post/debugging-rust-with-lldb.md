+++
draft = false
title = "Debugging Rust With Lldb"
date = "2019-03-26T19:25:45-04:00"
math = false
highlight = true
tags = ["rust", "lldb"]
summary = """
Debugging Rust with lldb
"""
+++

In this blog post I go over using lldb with rust and how get setup with lldb on Mac OS X.

## Installing lldb

Read the official guide link on installing [lldb](https://lldb.llvm.org/download.html).

*If you have a Mac then you should already have lldb installed.*

{{< figure src="/media/rust-lldb-version.png" >}}

Notice that lldb reports the version of lldb and the version of swift.

## Various ways of Running Summation Program

Let us look at a simple command line rust program that computes the summation provided as input.

{{< highlight rust >}}
use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();

    let numbers = &args[1..];

    let numbers: Vec<f32> = numbers
        .iter()
        .map(|num| num.parse().unwrap())
        .collect();

    let summation = summation_with_fold(numbers.clone());

    println!("summation_with_fold is {}", summation);

    let summation = summation_with_loop(numbers.clone());

    println!("summation_with_loop is {}", summation);
}

fn summation_with_loop(numbers: Vec<f32>) -> f32 {
    let mut sum = 0.0;
    for num in numbers.iter() {
        sum += num;
    }
    sum
}

fn summation_with_fold(numbers: Vec<f32>) -> f32 {
    let sum = numbers
        .iter()
        .fold(0.0, |sum, val| sum + val);
    return sum;
}
{{< / highlight >}}

We can run this program using the rust playground but we cannot supply argument like we can in a shell session:

{{< figure src="/media/rust-playground.png" >}}

We can run this program using cargo run like this:

{{< figure src="/media/cargo-run.png" >}}

We can also run our program by using the compiled binary executable like this:

{{< figure src="/media/target-debug-run.png" >}}

## Running summation program with lldb

*We can run our rust program with the rust-lldb executable.*

Here is the rust lldb bash script that gets invoked:

{{< highlight bash >}}
#!/bin/sh

# Exit if anything fails
set -e

# Find out where to look for the pretty printer Python module
RUSTC_SYSROOT=`rustc --print sysroot`

# Find the host triple so we can find lldb in rustlib.
host=`rustc -vV | sed -n -e 's/^host: //p'`

lldb=lldb
if [ -f "$RUSTC_SYSROOT/lib/rustlib/$host/bin/lldb" ]; then
    lldb="$RUSTC_SYSROOT/lib/rustlib/$host/bin/lldb"
else
    LLDB_VERSION=`"$lldb" --version 2>/dev/null | head -1 | cut -d. -f1`

    if [ "$LLDB_VERSION" = "lldb-350" ]
    then
        echo "***"
	echo \
"WARNING: This version of LLDB has known issues with Rust and cannot \
display the contents of local variables!"
        echo "***"
    fi
fi

# Prepare commands that will be loaded before any file on the command line has been loaded
script_import="command script import \"$RUSTC_SYSROOT/lib/rustlib/etc/lldb_rust_formatters.py\""
category_definition="type summary add --no-value --python-function lldb_rust_formatters.print_val -x \".*\" --category Rust"
category_enable="type category enable Rust"

# Call LLDB with the commands added to the argument list
exec "$lldb" --one-line-before-file="$script_import" \
    --one-line-before-file="$category_definition" \
    --one-line-before-file="$category_enable" \
    "$@"
{{< / highlight >}}

When you install rust this bash script gets bundled with cargo:

{{< figure src="/media/rust-lldb-path.png" >}}

Not let us run our summation binary executable using rust-lldb like this:

{{< figure src="/media/rust-lldb-first-run.png" >}}

Let us simply run summation with no arguments:

{{< figure src="/media/lldb-run-no-args.png" >}}

Notice here that we get 0 since we didn't provide any arguments.

Let us re run again no pun intended with args now!

{{< figure src="/media/run-with-args.png" >}}

Let us run the help on the b command:

{{< figure src="/media/help-break-command.png" >}}

Now let us set a breakpoint in lldb on line 8 and 13:

{{< figure src="/media/setting-breakpoints-lldb.png" >}}

Notice that we did it the long and then the short way in lldb.

We can list the breakpoints in lldb like this:

{{< figure src="/media/list-breakpoints-lldb.png" >}}

Now let us rerun the main.rs file and notice that the breakpoint is hit on line 8 now!

{{< figure src="/media/hit-breakpoint-lldb.png" >}}

Let us continue to the next breakpoint typing the c command:

{{< figure src="/media/continue-with-lldb.png" >}}

Let us step into the summation_with_fold function now using lldb using a couple of commands:

{{< figure src="/media/thread-step-into.png" >}}

We can dynamically change the value of a variable in the summation_with_fold function like this:

{{< figure src="/media/dyn-expr-keyword.png" >}}

We can look at the value of the variable now like this:

{{< figure src="/media/print-vars.png" >}}

The po command stands for print object, p stands for print and frame variable is the current stack frame!

Next let us step out of the summation_with_fold function now.

{{< figure src="/media/step-out-stack.png" >}}

Let us continue and see the current values:

{{< figure src="/media/current-vars-value.png" >}}

Notice how the summation_with_fold has the value 53 that we set dynamically.

We can unset our breakpoints like this:

{{< figure src="/media/delete-breakpoint.png" >}}

## Using help in lldb

You can find about the available command in lldb by running help:

{{< figure src="/media/lldb-debugger-help.png" >}}

You can also get help on each particular command by running help like:

*help subcommand*

{{< figure src="/media/lldb-help-command.png" >}}

Some commands have subcommands like the breakpoint command which you can get help on:

{{< figure src="/media/lldb-subcommand-help.png" >}}

Some commands have aliases that you can run like b for breakpoint and more.

*A great feature of the lldb debugger is that there is autocomplete that you can invoke by simply pressing the tab character*

All in all I would say rust-lldb is a great addition to debugging rust programs.

There is a whole more you can do with lldb and please read the official [lldb documentation for more](https://lldb.llvm.org/tutorial.html)

Please follow me at [jbelmont @ github](https://github.com/jbelmont) and [jbelmont80 @ twitter](https://twitter.com/jbelmont80)

Feel free to leave a comment if you like.

Until Next Time :)