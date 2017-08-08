# My Personal Blog utilizing Hugo Static Site Generator

##  Academic: the personal website framework for [Hugo](https://gohugo.io)

**Academic** is a framework to help you create a beautiful website quickly. Perfect for personal, student, or academic websites. [Check out the latest demo](https://sourcethemes.com/academic/) of what you'll get in less than 10 minutes.

Key features:

- Easily manage your homepage, blog posts, publications, talks, and projects
- Configurable widgets available for Biography, Publications, Projects, News/Blog, Talks, and Contact
- Need a different section? Just use the Custom widget!
- Write in [Markdown](https://sourcethemes.com/academic/post/writing-markdown-latex/) for easy formatting and code highlighting, with [LaTeX](https://en.wikibooks.org/wiki/LaTeX/Mathematics) for mathematical expressions
- Social/academic network linking, [Google Analytics](https://analytics.google.com), and [Disqus](https://disqus.com) comments
- Responsive and mobile friendly
- Simple and refreshing one page design
- Easy to customize

## Getting Started

1. [Install Hugo](https://georgecushen.com/create-your-website-with-hugo/#installing-hugo) and create a new website by typing the following commands in your *Terminal* or *Command Prompt* app:

        hugo new site my_website
        cd my_website

2. Install Academic with [git](https://help.github.com/articles/set-up-git/):

        git clone https://github.com/gcushen/hugo-academic.git themes/academic

    Or alternatively, [download Academic](https://github.com/gcushen/hugo-academic/archive/master.zip) and extract it into a `themes/academic` folder within your Hugo website.

3. If you are creating a new website, copy the contents of the `exampleSite` folder to your website root folder, overwriting existing files if necessary. The `exampleSite` folder contains an example config file and content to help you get started.

        cp -av themes/academic/exampleSite/* .

4. Start the Hugo server from your website root folder:

        hugo server --watch

    Now you can go to [localhost:1313](http://localhost:1313) and your new Academic powered website should appear.

5. [Customize your website](https://sourcethemes.com/academic/post/getting-started/#getting-started) and [add your content](https://sourcethemes.com/academic/post/managing-content/) by referring to the Academic documentation

6. Build your site by running the `hugo` command. Then [host it for free using Github Pages](https://georgecushen.com/create-your-website-with-hugo/). Or alternatively, copy the generated `public/` directory (by FTP, Rsync, etc.) to your production web server (such as your university's hosting service).

## Visit my blog

[Marcels Blog](http://www.marcelbelmont.com/)

* So the actual static content can be seen at [jbelmont.github.io](https://github.com/jbelmont/jbelmont.github.io)

* So how this works is that I have a file called `static/CNAME`

* This gives me a custom domain at `http://www.marcelbelmont.com` and this is being hosted at `namecheap` where I purchased my domain name at.

* So I ran `git submodule add -f git@github.com:jbelmont/jbelmont.github.io.git public` on this repo.

* This creates a git submodule for jbelmont.github.io inside of marcels-blog.

## Deploying the application to `jbelmont.github.io`

```bash
hugo
cd public
git add .
git commit -m "Generate site"
git push origin master
```

This deploys assets to submodule `jbelmont.github.io`