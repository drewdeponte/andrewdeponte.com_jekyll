---
layout: post
title: Ruby and Rails Mountain Lion Hiccups
date: 2012-07-27
tags: [Mac OS X Mountain Lion, Ruby, Rails, Software Development]
---
So when Mac OS X Mountain Lion was released a few days ago I jumped on
upgrading and got switched over as soon as I could. My mentality for upgrading
is that I would much rather deal with the pain of upgrading in smaller chunks
when needed rather than waiting. Plus, I just like to be on the latest and
greatest in terms of the tools I use for my job.

Anyways, below is going to be a listing of some of the hiccups that either I or
other developers on my team have run into in terms of their Ruby and Rails
development environment setups.

## Git

Some of the devs on my team had Git installed via the
[git-osx-installer](http://code.google.com/p/git-osx-installer/). These
developers seemed to lose their Git installs when they upgraded. I was using a
[Homebrew](http://mxcl.github.com/homebrew/) install of Git and it worked just
fine for me after upgrading. So be aware of what your situation is and resort
to brew because it is awesome.

## XCode 4.4

In order to build gems with the native exensions and just to have the basic
development tools around I installed the latest XCode 4.4. Once installed I
went to the preferences menu, in the download tab, and chose to install the
*Command Line Tools* because that is really what I was looking for more than
anything. I have read on other posts online that you can download the *Command
Line Tools* alone and install just them. I personally chose to install XCode as
I do use XCode and the native tools to work on iPhone/iPad app development as
well.

## gcc-4.2

The latest XCode now comes with clang/llvm which is a new C/C++/Objective-C
compiler. The problem is that the Ruby language isn't fully compatible with
clang and llvm. Therefore, you need to install GCC 4.2 using Homebrew. GCC 4.2
is the latest version of the GCC compiler that apple provided before switching
to clang/llvm. Anyways, you can install GCC 4.2 by doing the following with
brew:

{% highlight bash %}
brew tap homebrew/dupes
brew install apple-gcc42
{% endhighlight %}

The above will install the apple gcc-4.2 in a side by side fashion with XCode.
This means that it won't mess up your existing XCode install like other
solutions.

Once you install gcc-4.2 then you can install/reinstall your ruby version
inside of RVM as needed.

## Apache 2 (Web Sharing)

In the upgrade it seems that they have revamped the Sharing preference pane. In
the process of this it seems that Apple has decided to remove the Web sharing
component of this preference pane. Don't worry though. Apache is still there
and running. You just can't start it and stop it from the preferences pane
anymore. You can use the following commands instead.

{% highlight bash %}
sudo apachectl stop
sudo apachectl start
sudo apachectl restart
{% endhighlight %}

**Note:** When the upgrade happened it nuked all my `/etc/apache2/users/`
configs and all my other apache configs. So, if you have any custom apache
configs as I did you should probably back them up before upgrading.

## X11

It seems that another thing that was changed with the upgrade to Mac OS X
Mountain Lion was that they removed the X11 that I had previously installed and
seemed to no longer provide it. Thats ok though because XQuartz 2.7.2 is what
you want and it is available freely at
[http://xquartz.macosforge.org/landing/](http://xquartz.macosforge.org/landing/).
Just install that bad boy and follow the on screen instructions to reboot when
it is done and you should be good to go in terms of X11.

## ImageMagick

Before upgrading I had ImageMagick installed via Homebrew. After, the upgrade was finished my ImageMagick was exiting with failures about some dylib. To solve this problem I simply ran the following and I was back in running order with respect to ImageMagick:

{% highlight bash %}
brew upgrade imagemagick
{% endhighlight %}

## Pygments

I use Pygments to handle syntax highlighting in my jekyll sites and it seemed to not be working after the upgrade. I believe this is because it is now using Python 2.7.2. To resolve this issue I just re-installed Pygments using the following:

{% highlight bash %}
sudo easy_install Pygments
{% endhighlight %}
