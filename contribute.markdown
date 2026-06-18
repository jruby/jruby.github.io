---
layout: main
title: Contributing to JRuby
---

# Contributing to JRuby

JRuby depends on community contributions to survive. Here's how you can get involved:

## Get the Source

The JRuby source is stored in a Git repository on GitHub.

* **Browse**: [github.com/jruby/jruby]({{ site.urls.github }})
* **Clone**:

```bash
git clone https://github.com/jruby/jruby.git
```

## Build JRuby

Once you've checked out the source, run `mvn` to build JRuby and `mvn -Pbootstrap` to install all development dependencies. We depend on [Apache Maven](https://maven.apache.org/) 3.3.1 or higher.

```bash
mvn -Pbootstrap
```

For more detailed information, see [BUILDING.md](https://github.com/jruby/jruby/blob/master/BUILDING.md).

## Hacking Guide

NaHi built an [awesome Prezi fly-through tour of the JRuby codebase](https://prezi.com/tsuouxb3z4ln/jruby-hacking-guide/). Take a look for getting your bearings with the codebase.

## Report Bugs

We use GitHub Issues for all bug tracking.

* **GitHub Issues**: [Browse]({{ site.urls.bugs }})

## Submit Code Changes

We welcome behavioural, performance, quality, and documentation changes alike. Send them back with a [GitHub Pull Request](https://help.github.com/articles/using-pull-requests) for review.

## Fix the Wiki

We depend on community contributions and edits to keep our documentation informative and relevant. If you have a useful FAQ, walkthrough, or article, please add it to the wiki.

* **Wiki**: [Browse]({{ site.urls.wiki }})

## Fix the Website

Our website source code is publicly available and we graciously accept pull requests!

* **Website**: [Browse](https://github.com/jruby/jruby.github.io)
* **Clone**: `git clone https://github.com/jruby/jruby.github.io.git`
