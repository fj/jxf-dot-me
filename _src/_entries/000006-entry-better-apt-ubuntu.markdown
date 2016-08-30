---
type:         snippet
title:        "Finding out what changed during Debian/Ubuntu package upgrades"
date:         2015-05-22T08:00:00Z
published:    true
tags:
  - package-management
description: >
  How do we see what's changed in an apt package before we install it?
---

Like many Linux distributions, Debian comes with a package management and distribution system called _apt_ (Advanced Package Tool). While apt is  a very useful feature of Debian systems, upgrading packages can be a little daunting. Here's what a recent `apt-get upgrade`{:.shell} looked like for me:

```
ψ sudo apt-get upgrade
[sudo] password for jxf:
Reading package lists... Done
Building dependency tree
Reading state information... Done
Calculating upgrade... Done
The following packages have been kept back:
  linux-headers-generic linux-signed-generic
  linux-signed-image-generic lxc-docker postgresql-client-common
  postgresql-common
The following packages will be upgraded:
  atom libdrm-intel1 libdrm-intel1:i386 libdrm-nouveau2
  libdrm-nouveau2:i386 libdrm-radeon1 libdrm-radeon1:i386 libdrm2
  libdrm2:i386 libicu52 libtasn1-6 libtasn1-6:i386 linux-libc-dev
  oxideqt-codecs-extra steam-launcher
15 upgraded, 0 newly installed, 0 to remove and 6 not upgraded.
Need to get 61.3 MB of archives.
Do you want to continue? [Y/n]
```
{:.shell}

Notice that a number of important-looking packages changed: [graphics driver middleware](https://01.org/linuxgraphics/community/libdrm), [libc](http://en.wikipedia.org/wiki/C_standard_library), and [the text editor I use to write this blog](https://atom.io/). But it's hard to know whether we should install these changes or not, and what the urgency on them is.

What if the updates are critical security fixes in libc? We might want to install them immediately. Conversely, what if the new graphics driver introduced features that disrupted the framerate on our favorite games? We might want to hold off.

With the apt-get interface, we know _whether_ something has been updated, but we don't know _what_ the updates are. Can we do better?

# What changed?

Enter _apt-listchanges_, a wonderful tool by [Sandro Tosi](https://twitter.com/sandrotosi) and [Thadeu Lima de Souza Cascardo](http://cascardo.info/). Each apt package usually ships with two files that describe interesting human-readable details about the package:

* a [`debian/changelog`](https://www.debian.org/doc/manuals/maint-guide/dreq.en.html#changelog) file that describes recent changes made to the package, usually of a technical nature
* a [`debian/NEWS`](https://www.debian.org/doc/manuals/maint-guide/dother.en.html#news) file that describes user-friendly updates about the package

For example, if we download a recent Firefox nightly package:

```
apt-get download firefox
```
{:.shell}

and run `apt-listchanges` on it:

```
apt-listchanges --which=changelogs firefox
```
{:.shell}

we'll get this output:

```
firefox (40.0~a2~hg20150520r262219-0ubuntu1~umd1~trusty) trusty; urgency=medium

  * Refresh patches
    - update debian/patches/unity-menubar.patch
    - update debian/patches/dont-include-hyphenation-patterns.patch
    - update debian/patches/allow-lockPref-everywhere.patch

 -- Chris Coulson <chris.coulson@canonical.com>  Wed, 20 May 2015 17:17:16 +0100

firefox (39.0~a2~hg20150429r255253-0ubuntu1) vivid; urgency=medium

  * Refresh patches
    - update debian/patches/unity-menubar.patch
    - update debian/patches/ubuntu-ua-string-changes.patch
  * Drop patches fixed upstream
    - remove debian/patches/add-non-skia-fallback.patch
    - update debian/patches/series
  * Bundle our checkout of compare-locales in a different location, given
    that the Mozilla repo now contains a different version of it in the
    location we used previously
    - update debian/build/rules.mk
    - update debian/build/create-tarball.py

 -- Chris Coulson <chris.coulson@canonical.com>  Tue, 31 Mar 2015 19:32:34 +0100
```

# Using apt-listchanges

It would be nice if we could get this list whenever we installed a package. Fortunately, apt-listchanges does just that for us, too!

First we'll install the package:

```
sudo apt-get install apt-listchanges
```
{:.shell}

After installation, there's a configuration step which asks you how you'd like to view the changes and make some other choices; I find the `pager` mode is most convenient for viewing. If you want to revisit your configuration choices, you can run `dpkg-reconfigure apt-listchanges`{:.shell}.

After the configuration is done your preferences will be saved in `/etc/apt/listchanges.conf`.

Now that we've got that, let's install a package!

```
sudo apt-get install firefox
[...]
Do you want to continue? [Y/n]
Reading changelogs... Done

firefox (40.0~a2~hg20150520r262219-0ubuntu1~umd1~trusty) trusty; urgency=medium
  * Refresh patches
    - update debian/patches/unity-menubar.patch
    - update debian/patches/dont-include-hyphenation-patterns.patch
    - update debian/patches/allow-lockPref-everywhere.patch

 -- Chris Coulson <chris.coulson@canonical.com>  Wed, 20 May 2015 17:17:16 +0100
apt-listchanges: Do you want to continue? [Y/n] y
```
{:.shell}

Notice the second prompt for apt-listchanges; this is one of the configuration settings you can choose. Here, you'll get a chance to review what changed before you decide to pull the trigger.

In short, apt-listchanges is an excellent addition to your Debian package-management workflow and highly recommended.
