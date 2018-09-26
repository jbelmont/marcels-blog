+++
draft = false
title = "Tips and Tricks With VS Code"
tags = ["editor"]
date = "2018-09-23T19:09:59-04:00"
math = true
summary = """
Tips and Tricks With VS Code
"""
+++

# Editor Tips and Tricks with VS Code

Here are some suggested plugins by programming language.

## Golang Extensions

[Go for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go)

Set `"go.useLanguageServer": true` in  *settings.json* to use the Go language server from Sourcegraph for features like Hover, Definition, Find All References, Signature Help, Go to Symbol in File and Workspace.

[GO Language Server](https://github.com/sourcegraph/go-langserver)

You will see Analysis Tools Missing in the bottom right, clicking this will offer to install all of the dependent Go tools. You can also run the command Go: Install/Update tools to install/update the same.

## Rust Extensions

[Rust support for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust)

Rust support is powered by the Rust Language Server (RLS). If you don't have it installed, the extension will install it for you.

**If you want to find any other extensions just search in the Marketplace for them as there are tons of extensions available for languages and for certain configurations.**

## Editor Workflow Tips

Enter *F1* in your keyboard to open the command window.

Press *command p* to open any files in the VS Code Workspace/Window

{{< figure src="/media/vscode-command-prompt.png" >}}

#### File Navigation Tips

Press *command shift o* to open the Symbols Menu to find symbols such as functions and more

{{< figure src="/media/vscode-command-prompt.png" >}}

Press *shift f12* in order to find all usages of a function

{{< figure src="/media/vscode-command-prompt.png" >}}

Find the appropriate usage by hitting the up/down key and then press enter

#### Change Language with command prompt

Press *F1* in your keyboard and then enter *change language mode*

{{< figure src="/media/change-language-mode.png" >}}

#### Install Bookmark Extension

Install the [bookmark extension](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks) so that you can bookmark your source code

Press *command alt k* to set a bookmark

Press *command alt j* to go to previous set bookmark

Press *command alt l* to go jump to next bookmark

#### Code folding in VS Code 

You can code fold by pressing *F1 and type fold all*

You can unfold all by pressing *F1 and unfold all*

#### Format file types

You can easily format a json blog

Here is a set of screenshots with a large json blog:

{{< figure src="/media/large-json-blog.png" >}}

{{< figure src="/media/change-language-mode.png" >}}

{{< figure src="/media/format-document.png" >}}

{{< figure src="/media/json-entry.png" >}}

{{< figure src="/media/formatted-doc.png" >}}

#### Code diff with VS Code

You can do code diffing with vs code like this:

```bash
code --diff file1 file2
```

#### Open Integrated Terminal

You can open the VS Code Integrated Terminal with *control \`*

#### Install Programming Font Ligatures in VS Code

You can use professional ligatures such as [FiraCode](https://github.com/tonsky/FiraCode) in VS Code

Just follow the instructions in the [FiraCode Wiki](https://github.com/tonsky/FiraCode/wiki/VS-Code-Instructions)

You can click the [Download v1.205 button](https://github.com/tonsky/FiraCode/releases/download/1.205/FiraCode_1.205.zip)

Then open the zip file which should look like this:

{{< figure src="/media/fira-zip-file.png" >}}

And when you open up all the ttf files you will see the following Font Book application

{{< figure src="/media/font-book.png" >}}

Click install font button and then you will have the FiraCode fonts now.

Next add an entry like this to your settings.json file in VS Code

```json
{
    // Enables/Disables font ligatures.
    "editor.fontFamily": "Fira Code",
    "editor.fontLigatures": true,
    "editor.fontWeight": "300",
    "editor.fontSize": 13,
    "editor.cursorWidth": 0,
    "editor.cursorStyle": "block"
}
```

#### Change Editor Color Theme

You can change the color theme in VS Code by pressing *F1 and entering color theme*

You can install many different themes in the VS Code Marketplace.

Here are all of my Editor Themes:

{{< figure src="/media/vscode-color-themes.png" >}}

If you like this blog post then please follow me at [jbelmont at Github](https://github.com/jbelmont)

Or follow me at [jbelmont at Twitter](https://twitter.com/jbelmont80)

Leave a comment if you like this.
