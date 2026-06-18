---
layout: main
title: Security
---

# Security

## Reporting Vulnerabilities

Please report security vulnerabilities to **[security@jruby.org](mailto:security@jruby.org)**. This is a private channel monitored by the core team. We aim to respond within 72 hours.

## Disclosure Process

1. **Determine fixes** (24&ndash;72 hours) &mdash; The team will work to understand and address the issue.
2. **Embargo** (48 hours) &mdash; A brief period before public disclosure.
3. **Release patched software** &mdash; Updated packages are published.
4. **Announce** &mdash; Via the jruby-user mailing list with source patches.
5. **Post on jruby.org** &mdash; Added to the vulnerability list below.

## Known Vulnerabilities

<ul class="vuln-list">
  <li>
    <span class="vuln-date">December 2011 &mdash; JRuby 1.6.5.1</span><br>
    DOS vulnerability with specially crafted large hash/parameter lists.
    <a href="/2011/12/27/jruby-1-6-5-1">Announcement &rarr;</a>
  </li>
  <li>
    <span class="vuln-date">April 2010 &mdash; JRuby 1.4.1</span><br>
    Potential XSS attacks in earlier versions.
    <a href="/2010/04/26/jruby-1-4-1-xss-vulnerability">Announcement &rarr;</a>
  </li>
  <li>
    <span class="vuln-date">December 2009 &mdash; jruby-openssl 0.6</span><br>
    Affects applications using OpenSSL verification modes with jruby-openssl 0.5.2 or earlier.
    <a href="/2009/12/07/vulnerability-in-jruby-openssl">Announcement &rarr;</a>
  </li>
</ul>
