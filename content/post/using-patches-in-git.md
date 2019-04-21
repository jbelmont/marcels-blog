+++
title = "Patches in Software"
date = "2019-04-21T09:38:33-04:00"
draft = false
math = true
tags = ["patch","git"]
summary = """
Software Patches can be used in different contexts.
"""
+++

# According to Wikipedia a Patch in software is defined as:

> A patch is a set of changes to a computer program or its supporting data designed to update, fix, or improve it. This includes fixing security vulnerabilities and other bugs, with such patches usually being called bugfixes or bug fixes,[better source needed] and improving the usability or performance. Although meant to fix problems, poorly designed patches can sometimes introduce new problems (see software regressions). In some special cases updates may knowingly break the functionality or disable a device, for instance, by removing components for which the update provider is no longer licensed.

## Types of Patches in Software

We will be looking at source code patches in this blog post but there is also other types of patches such as:

* [Binary Patches](https://en.wikipedia.org/wiki/Patch_%28computing%29#Binary_patches)

*In software patches a patch is usually represented between a difference (diff) between 2 code files.*

#### Software Patch Variants

According to Wikipedia there are several software patches:

###### Hotfix

> A hotfix or Quick Fix Engineering update (QFE update) is a single, cumulative package that includes information (often in the form of one or more files) that is used to address a problem in a software product (i.e., a software bug). Typically, hotfixes are made to address a specific customer situation. Microsoft once used this term but has stopped in favor of new terminology: General Distribution Release (GDR) and Limited Distribution Release (LDR). Blizzard Entertainment, however, defines a hotfix as "a change made to the game deemed critical enough that it cannot be held off until a regular content patch".

###### Point release

> A point release is a minor release of a software project, especially one intended to fix bugs or do small cleanups rather than add significant features. Often, there are too many bugs to be fixed in a single major or minor release, creating a need for a point release.

###### Program temporary fix

> Program temporary fix or Product temporary fix (PTF), depending on date, is the standard IBM terminology for a single bug fix, or group of fixes, distributed in a form ready to install for customers. A PTF was sometimes referred to as a "ZAP" see Customers sometime explain the acronym in a tongue-in-cheek manner as permanent temporary fix or more practically probably this fixes, because they have the option to make the PTF a permanent part of the operating system if the patch fixes the problem.

###### Security patches

> A security patch is a change applied to an asset to correct the weakness described by a vulnerability. This corrective action will prevent successful exploitation and remove or mitigate a threat's capability to exploit a specific vulnerability in an asset. Patch management is a part of Vulnerability management - the cyclical practice of identifying, classifying, remediating, and mitigating vulnerabilities.

> Security patches are the primary method of fixing security vulnerabilities in software. Currently Microsoft releases its security patches once a month, and other operating systems and software projects have security teams dedicated to releasing the most reliable software patches as soon after a vulnerability announcement as possible. Security patches are closely tied to responsible disclosure.

> These security patches are critical to ensure that business process does not get affected. In 2017, companies were struck by a ransomware called WannaCry which encrypts files in certain versions of Microsoft Windows and demands a ransom via BitCoin. In response to this, Microsoft released a patch which stops the ransomware from running.

###### Service pack

> A service pack or SP or a feature pack (FP) comprises a collection of updates, fixes, or enhancements to a software program delivered in the form of a single installable package. Companies often release a service pack when the number of individual patches to a given program reaches a certain (arbitrary) limit, or the software release has shown to be stabilized with a limited number of remaining issues based on users' feedback and bug tracking such as bugzilla. In large software applications such as office suites, operating systems, database software, or network management, it is not uncommon to have a service pack issued within the first year or two of a product's release. Installing a service pack is easier and less error-prone than installing many individual patches, even more so when updating multiple computers over a network, where service packs are common.

###### Unofficial patches

> An unofficial patch is a non-commercial patch for a commercial software created by a third party instead of the original developer. Similar to an ordinary patch, it alleviates bugs or shortcomings. Examples are security fixes by security specialists when an official patch by the software producers itself takes too long. Other examples are unofficial patches created by the game community of a video game which became unsupported abandonware.

## Creating Patches in Git

We can generate patch files in a couple of different ways and there are several different commands associated with using patches in git:

* [git am manual page](https://git-scm.com/docs/git-am):

{{< highlight bash >}}
> git help am

git-am - Apply a series of patches from a mailbox

SYNOPSIS
       git am [--signoff] [--keep] [--[no-]keep-cr] [--[no-]utf8]
                [--[no-]3way] [--interactive] [--committer-date-is-author-date]
                [--ignore-date] [--ignore-space-change | --ignore-whitespace]
                [--whitespace=<option>] [-C<n>] [-p<n>] [--directory=<dir>]
                [--exclude=<path>] [--include=<path>] [--reject] [-q | --quiet]
                [--[no-]scissors] [-S[<keyid>]] [--patch-format=<format>]
                [(<mbox> | <Maildir>)...]
       git am (--continue | --skip | --abort | --quit | --show-current-patch)


DESCRIPTION
       Splits mail messages in a mailbox into commit log message, authorship information and patches, and applies them to the
       current branch.
....................................................................................................
....................................................................................................
....................................................................................................
{{< / highlight >}}

* [git apply manual page](https://git-scm.com/docs/git-apply):

{{< highlight bash >}}
NAME
       git-apply - Apply a patch to files and/or to the index

SYNOPSIS
       git apply [--stat] [--numstat] [--summary] [--check] [--index | --intent-to-add] [--3way]
                 [--apply] [--no-add] [--build-fake-ancestor=<file>] [-R | --reverse]
                 [--allow-binary-replacement | --binary] [--reject] [-z]
                 [-p<n>] [-C<n>] [--inaccurate-eof] [--recount] [--cached]
                 [--ignore-space-change | --ignore-whitespace]
                 [--whitespace=(nowarn|warn|fix|error|error-all)]
                 [--exclude=<path>] [--include=<path>] [--directory=<root>]
                 [--verbose] [--unsafe-paths] [<patch>...]


DESCRIPTION
       Reads the supplied diff output (i.e. "a patch") and applies it to files. When running from a subdirectory in a
       repository, patched paths outside the directory are ignored. With the --index option the patch is also applied to the
       index, and with the --cached option the patch is only applied to the index. Without these options, the command applies
       the patch only to files, and does not require them to be in a Git repository.

       This command applies the patch but does not create a commit. Use git-am(1) to create commits from patches generated by
       git-format-patch(1) and/or received by email.
....................................................................................................
....................................................................................................
....................................................................................................
{{<  / highlight >}}

* [git cherry-pick manual page](https://git-scm.com/docs/git-cherry-pick)

{{< highlight bash >}}
NAME
       git-cherry-pick - Apply the changes introduced by some existing commits

SYNOPSIS
       git cherry-pick [--edit] [-n] [-m parent-number] [-s] [-x] [--ff]
                         [-S[<keyid>]] <commit>...
       git cherry-pick --continue
       git cherry-pick --quit
       git cherry-pick --abort


DESCRIPTION
       Given one or more existing commits, apply the change each one introduces, recording a new commit for each. This requires
       your working tree to be clean (no modifications from the HEAD commit).

       When it is not obvious how to apply a change, the following happens:

        1. The current branch and HEAD pointer stay at the last commit successfully made.

        2. The CHERRY_PICK_HEAD ref is set to point at the commit that introduced the change that is difficult to apply.

        3. Paths in which the change applied cleanly are updated both in the index file and in your working tree.

        4. For conflicting paths, the index file records up to three versions, as described in the "TRUE MERGE" section of git-
           merge(1). The working tree files will include a description of the conflict bracketed by the usual conflict markers
           <<<<<<< and >>>>>>>.

        5. No other modifications are made.

       See git-merge(1) for some hints on resolving such conflicts.
....................................................................................................
....................................................................................................
....................................................................................................
{{< / highlight >}}

* [git diff manual page](https://git-scm.com/docs/git-diff)

{{< highlight bash >}}
NAME
git-diff - Show changes between commits, commit and working tree, etc

SYNOPSIS
git diff [<options>] [<commit>] [--] [<path>…​]
git diff [<options>] --cached [<commit>] [--] [<path>…​]
git diff [<options>] <commit> <commit> [--] [<path>…​]
git diff [<options>] <blob> <blob>
git diff [<options>] --no-index [--] <path> <path>
DESCRIPTION
Show changes between the working tree and the index or a tree, changes between the index and a tree, changes between two trees, changes between two blob objects, or changes between two files on disk.

git diff [<options>] [--] [<path>…​]
This form is to view the changes you made relative to the index (staging area for the next commit). In other words, the differences are what you could tell Git to further add to the index but you still haven’t. You can stage these changes by using git-add[1].

git diff [<options>] --no-index [--] <path> <path>
This form is to compare the given two paths on the filesystem. You can omit the --no-index option when running the command in a working tree controlled by Git and at least one of the paths points outside the working tree, or when running the command outside a working tree controlled by Git.

git diff [<options>] --cached [<commit>] [--] [<path>…​]
This form is to view the changes you staged for the next commit relative to the named <commit>. Typically you would want comparison with the latest commit, so if you do not give <commit>, it defaults to HEAD. If HEAD does not exist (e.g. unborn branches) and <commit> is not given, it shows all staged changes. --staged is a synonym of --cached.

git diff [<options>] <commit> [--] [<path>…​]
This form is to view the changes you have in your working tree relative to the named <commit>. You can use HEAD to compare it with the latest commit, or a branch name to compare with the tip of a different branch.

git diff [<options>] <commit> <commit> [--] [<path>…​]
This is to view the changes between two arbitrary <commit>.

git diff [<options>] <commit>..<commit> [--] [<path>…​]
This is synonymous to the previous form. If <commit> on one side is omitted, it will have the same effect as using HEAD instead.

git diff [<options>] <commit>...<commit> [--] [<path>…​]
This form is to view the changes on the branch containing and up to the second <commit>, starting at a common ancestor of both <commit>. "git diff A...B" is equivalent to "git diff $(git merge-base A B) B". You can omit any one of <commit>, which has the same effect as using HEAD instead.

Just in case you are doing something exotic, it should be noted that all of the <commit> in the above description, except in the last two forms that use ".." notations, can be any <tree>.

For a more complete list of ways to spell <commit>, see "SPECIFYING REVISIONS" section in gitrevisions[7]. However, "diff" is about comparing two endpoints, not ranges, and the range notations ("<commit>..<commit>" and "<commit>...<commit>") do not mean a range as defined in the "SPECIFYING RANGES" section in gitrevisions[7].

git diff [<options>] <blob> <blob>
This form is to view the differences between the raw contents of two blob objects.
....................................................................................................
....................................................................................................
....................................................................................................
{{< / highlight >}}


* [git format-patch manual page](https://git-scm.com/docs/git-format-patch)

{{< highlight bash >}}
NAME
git-format-patch - Prepare patches for e-mail submission

SYNOPSIS
git format-patch [-k] [(-o|--output-directory) <dir> | --stdout]
		   [--no-thread | --thread[=<style>]]
		   [(--attach|--inline)[=<boundary>] | --no-attach]
		   [-s | --signoff]
		   [--signature=<signature> | --no-signature]
		   [--signature-file=<file>]
		   [-n | --numbered | -N | --no-numbered]
		   [--start-number <n>] [--numbered-files]
		   [--in-reply-to=Message-Id] [--suffix=.<sfx>]
		   [--ignore-if-in-upstream]
		   [--rfc] [--subject-prefix=Subject-Prefix]
		   [(--reroll-count|-v) <n>]
		   [--to=<email>] [--cc=<email>]
		   [--[no-]cover-letter] [--quiet] [--notes[=<ref>]]
		   [--interdiff=<previous>]
		   [--range-diff=<previous> [--creation-factor=<percent>]]
		   [--progress]
		   [<common diff options>]
		   [ <since> | <revision range> ]
DESCRIPTION
Prepare each commit with its patch in one file per commit, formatted to resemble UNIX mailbox format. The output of this command is convenient for e-mail submission or for use with git am.

There are two ways to specify which commits to operate on.

A single commit, <since>, specifies that the commits leading to the tip of the current branch that are not in the history that leads to the <since> to be output.

Generic <revision range> expression (see "SPECIFYING REVISIONS" section in gitrevisions[7]) means the commits in the specified range.

The first rule takes precedence in the case of a single <commit>. To apply the second rule, i.e., format everything since the beginning of history up until <commit>, use the --root option: git format-patch --root <commit>. If you want to format only <commit> itself, you can do this with git format-patch -1 <commit>.

By default, each output file is numbered sequentially from 1, and uses the first line of the commit message (massaged for pathname safety) as the filename. With the --numbered-files option, the output file names will only be numbers, without the first line of the commit appended. The names of the output files are printed to standard output, unless the --stdout option is specified.

If -o is specified, output files are created in <dir>. Otherwise they are created in the current working directory. The default path can be set with the format.outputDirectory configuration option. The -o option takes precedence over format.outputDirectory. To store patches in the current working directory even when format.outputDirectory points elsewhere, use -o ..

By default, the subject of a single patch is "[PATCH] " followed by the concatenation of lines from the commit message up to the first blank line (see the DISCUSSION section of git-commit[1]).

When multiple patches are output, the subject prefix will instead be "[PATCH n/m] ". To force 1/1 to be added for a single patch, use -n. To omit patch numbers from the subject, use -N.

If given --thread, git-format-patch will generate In-Reply-To and References headers to make the second and subsequent patch mails appear as replies to the first mail; this also generates a Message-Id header to reference.
{{< / highlight >}}

There are other related git commands for working with commits that are related to patches such as:

* [git rebase](https://git-scm.com/docs/git-rebase)
* [git revert](https://git-scm.com/docs/git-revert)

*We will not go over these in this blog post.*

#### Using git diff to generate a patch file

We can use the *git diff* command to generate a patch file*

Here is a sample session where we create patch file from the current changes in the repository. I show the current changes with an alias for *git status -s* command:

{{< figure src="/media/git-diff.png" >}}

#### Using git format-patch command to generate a series of patches in patches directory

> Prepare each commit with its patch in one file per commit, formatted to resemble UNIX mailbox format. The output of this command is convenient for e-mail submission or for use with git am.

We will use the *git format-patch* command to generate patches against a destination branch of master.

{{< figure src="/media/git-format-patches.png" >}}

Notice that the patches file looks a little bit like an email as this command is based on the UNIX mailbox format.

Notice that in this next session we create the patches directory in the parent directory:

{{< figure src="/media/git-format-patches-other-dir.png" >}}

We can create a patches directory with a name for each repo with a command like this:

{{< figure src="/media/create-patches-dir.png" >}}

Now we can create a patches list with this directory structure like this:

{{< figure src="/media/git-format-patches-structure.png" >}}

#### git am command

Now we can checkout back to the master branch and apply these changes by using *git am* command like this:

{{< figure src="/media/git-am-applied.png" >}}

Notice that in the screenshot below that our patches were replayed on top of existing commits:

{{< figure src="/media/git-replay-ontop.png" >}}

The difference between the [git am command](https://git-scm.com/docs/git-am) and the [git apply command](https://git-scm.com/docs/git-apply) is that the *git am* command will apply the commits and the *git apply* will only apply changes to the file instead of committing all though this is not the only difference.

#### git apply command

There are some advantages to using the *git apply* command because we can check whether a patch file is okay and we can reverse a git apply change as well.

In the following session we will create a file change and use the *git diff* command to generate our patch file, then we will checkout back to master branch and try to apply local changes but first check the patch file for validity.

{{< figure src="/media/git-diff-apply-check-flow.png" >}}

Notice that in this session that the *--check* flag complained since we were trying to apply changes that already existed but were never committed into the branch. This flow is useful to do before applying a patch change.

#### using git diff command and patch command to apply changes

We can create a new file based off of an original file like this:

{{< highlight bash >}}
cp docs/mongodb_indexes_partII.md docs/mongodb_indexes_partII_new.md

## Then we will generate the diff between these 2 files.
diff -u docs/mongodb_indexes_partII.md docs/mongodb_indexes_partII_new.md > ../patches/nosql-workshop/diff-between-two-files.patch

# Next we will create patch to the old file like this
patch docs/mongodb_indexes_partII.md ../patches/nosql-workshop/diff-between-two-files.patch
{{< / highlight >}}

Notice that we applied the changes that we made to new file to the old file.

*There are some distinct disadvantages to using the patch commmand and it is generally better to use the git apply command in git instead.*

Using the patch command can leave your working directory in a bad state in a bad patch and also the *git apply* command handles file adds, deletes, and renames if they're described in the git diff format.

If you like this post then please follow me at [jbelmont @ github](https://github.com/jbelmont) and [jbelmont80 @ twitter](https://twitter.com/jbelmont80) for more related type posts.

Feel free to leave a comment if you like.

Until Next Time :)