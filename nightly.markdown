---
layout: main
title: Nightly Builds
---
# Nightly Builds

<div class="nightly-section">
&#x26A0;&#xFE0F; Nightly builds are development snapshots and may be unstable. Use them for testing only.
</div>

The most recent successful snapshot gets published to Sonatype's snapshots repository every night and after every successful CI run. Only the `master` branch is automatically published.

## Specific artifacts

[**JRuby dist**](https://central.sonatype.com/repository/maven-snapshots/org/jruby/jruby-dist/): The installable distribution of JRuby is in the `jruby-bin` files. Unpack it, run `bin/jruby` and you're all set.

[**Complete jar**](https://central.sonatype.com/repository/maven-snapshots/org/jruby/jruby-complete/): The "complete" jar, containing all standad libraries and preinstalled gems, is in the `jruby-complete...jar` file.

[**Other artifacts**](https://central.sonatype.com/repository/maven-snapshots/org/jruby/): The full complement of Maven artifacts are available as snapshots.

## Other Artifacts

We also publish other non-Maven artifacts on a regular basis.

[**jruby-jars gem**](https://github.com/jruby/jruby/actions/workflows/nightly-snapshot-publish-21.yml): The `jruby-jars` gem is built and archived during our nightly builds. Select a build and look for the archived gem.

[**Docker images**](https://hub.docker.com/_/jruby): Dev snapshots are published to Docker Hub on request or after major updates.

[**Dev builds on GitHub**](https://github.com/ruby/jruby-dev-builder/releases): Dev snapshots are packaged for the `setup-ruby` GitHub Action and other installers on a nightly basis.

## Reporting Issues

If you find a problem with a nightly build, please report it on the [issue tracker]({{ site.urls.bugs }}) and mention which nightly build you are using (date and commit hash).
