---
layout: main
title: Getting Started
---

# Getting Started with JRuby

JRuby is one of the easiest Ruby implementations to set up.

## Basic Installation

1. **Download JRuby** &mdash; Visit the [download page](/download) and grab the binaries for the latest JRuby release.
2. **Unpack JRuby** &mdash; Unpack the file you downloaded. You'll then have a `jruby-<version>` directory.
3. **Add to PATH** &mdash; Add the `bin` subdirectory to the end of your PATH.
4. **Test it** &mdash; Run `jruby -v` to confirm it's working.

That's about it!

## Windows

If you're on Windows, we've prepared several flavours of [installers](/download) for you. Just pick 32-bit or 64-bit and whether to bundle the Java Virtual Machine or not.

## Version Managers

### RVM

```bash
rvm install jruby
```

### rbenv + ruby-build

```bash
rbenv install jruby-{{ site.release.version }}
```

### Homebrew (macOS)

```bash
brew install jruby
```

## OS Packages

JRuby may also be available as OS packages for your favourite package manager. Check the [JRuby Distributions]({{ site.urls.wiki }}/JRubyDistributions) page on the wiki for more information.

## Next Steps

- [Documentation](/documentation) &mdash; API docs, articles, and the wiki
- [Community](/community) &mdash; Connect with other JRuby users
- [JRuby Wiki]({{ site.urls.wiki }}) &mdash; Comprehensive user-edited documentation
