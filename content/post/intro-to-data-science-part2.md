+++
title = "Intro to Data Science Part II"
date = "2019-10-03T18:05:17-04:00"

math = false
highlight = true

tags = ["data science", "python"]
summary = """
Getting Started with Data Science part II
"""
+++

**Full Disclaimer I am not a Data Scientist and these are just my getting started notes.**

In the previous blog article, we defined through Wikipedia what Data Science is and looked at some important subjects to master to better grasp Data Science theory.

This article will be centered on specific tooling in languages such as Python.

In order to facilitate our entry into Data Science, we will be using the [Anaconda Distribution](https://www.anaconda.com/distribution/).

This distribution will let us easily download popular packages and tools and provide IDEs for us to use.

## Downloading Anaconda

The first thing that you need to do is to [Download Anaconda](https://www.anaconda.com/distribution/#download-section)

{{< figure src="/media/anaconda-download.png" >}}

Anaconda Distribution is available for Mac OS X, Windows and Linux. 

You can also pick between Python 2.7 and Python 3.7 Versions.

*Python 2.7 is about to reach end of support and development, so if possible try to use Python 3.7*

#### Starting Anaconda

Once you install anaconda you simply need to launch the application, since I am using Mac OS X, I will click on the anaconda navigator application to start up anaconda.

{{< figure src="/media/anaconda-navigator.png" >}}

You simply need to click the install button and then click the launch button to get your integrated development environment running.

Let us get Jupyter Notebooks running in our system by clicking the launch button in Anaconda.

Once you do that jupyter will launch a new shell session that will run `jupyter notebook` under the hood with the following executable programs installed by the anaconda distribution:

{{< figure src="/media/anaconda-executable.png" >}}

You will get a new browser window that will run in localhost port 8888 and open your home directory in your machine:

{{< figure src="/media/anaconda-browser.png" >}}

I have already navigated to a new repository that I created for this blog article where you can find the source code at [intro to data science](https://github.com/jbelmont/intro-to-data-science)

#### Creating a new jupyter notebook

In order to get a new Jupyter notebook you simply need to click the *New* button and pick the environment for the notebook to run against.

We will pick Python 3 for this article but you can pick other options if you need to.

{{< figure src="/media/anaconda-pick.png" >}}

Once you click an option a new tab will be opened with your new jupyter notebook for you to start with like this:

{{< figure src="/media/jupyter-new-notebook-hello-world.png" >}}

In our new notebook we are printing out the text "Intro to Data Science!" but notice that we have a new interactive shell session running!

#### Saving jupyter notebook

Until you save your notebook you will have an untitled notebook kind of like this: `Untitled.ipynb`

We will name this jupyter notebook by clicking the File icon and then the Save As icon like this:

{{< figure src="/media/jupyter-save-session.png" >}}

#### Writing Markdown in Jupyter cell

You are not restricted to just writing python code into a Jupyter cell, you can also write markdown by toggling dropdown like this:

{{< figure src="/media/jupyter-notebook-markdown-dropdown.png" >}}

#### Importing libraries in Jupyter

You can simply write python code and then click the run button and highlight the cell to execute like this:

{{< figure src="/media/jupyter-notebook-libs-execute.png" >}}

#### Next article

The next blog article will center around using the spyder IDE and we will write some R code and do use the ipython shell.

## Contact Information 

If you like this post then please follow me at [jbelmont @ github](https://github.com/jbelmont) and [jbelmont80 @ twitter](https://twitter.com/jbelmont80) for more related type posts.

Feel free to leave a comment if you like.

Until Next Time :)
