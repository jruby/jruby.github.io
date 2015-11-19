---
layout: main
title: Contributing to JRuby
---
# Contributing to JRuby
  
JRuby depends on community contributions to survive. Here's how you can get involved:

**Get the Source** - The JRuby source is stored in our Git repository at JRuby.org and mirrored at GitHub.

- **Browse**: [**GitHub**](http://github.com/jruby/jruby)
- **Checkout**

      git clone https://github.com/jruby/jruby.git

*Need [Git help](http://git-scm.com/)? It's ok, we're not Git experts either.*

**Build JRuby** - Once you've checked out the source, you just need to run `mvn` to just build JRuby and `mvn -Pbootstrap` to install all development dependencies. We depend on <a href="http://maven.apache.org/">Apache Maven</a> 3.3.1 or higher; if you only have access to a lower version use the `mvnw` script in our repo instead of your system's `mvn` command.

      mvn -Pbootstrap

For more detailed information building and other ways to test have a look at <a href="https://github.com/jruby/jruby/blob/master/BUILDING.md">jruby/BUILDING.md</a>.

**Check out the Hacking Guide** - NaHi built an [awesome Prezi fly-through tour of the JRuby codebase][prezi]. Take a look through it for getting bearings with the codebase.

**Report Bugs** - We use Github for all bug tracking. 

- **Github issues**: [**Browse**]({{ site.urls.bugs }})

**Submit Code Changes** - We welcome behavioral, performance, quality, and documentation changes alike.  Send them back with a [GitHub pull request][pullrequest] for review.

**Fix the wiki** - We also depend on community contributions and edits to keep our documentation informative and relevant. If you have a useful FAQ or walkthrough or article, please add it to the wiki. And we welcome anyone who wants to help reorganize or edit existing content.

- **Wiki**: [**Browse**]({{ site.urls.wiki }})

**Fix the website** - Our website source code is publicly available, and we graciously accept pull requests!

- **Website**: [**Browse**](https://github.com/jruby/jruby.github.io) &nbsp;|&nbsp;[**Checkout**](git://github.com/jruby/jruby.github.io.git)

[prezi]: http://prezi.com/tsuouxb3z4ln/jruby-hacking-guide/
[pullrequest]: https://help.github.com/articles/using-pull-requests

