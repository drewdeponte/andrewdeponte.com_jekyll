---
layout: post
title: A New Rails Tagging Plugin
date: 2012-07-22
tags: [Rails Plugin, Tags]
---
A little over 3 months ago I had the need for a good tagging plugin for Rails.
I tried out a number of the popular ones but they just weren't up to my
standards in terms of their APIs and their functionality. To accomplish the
user experience goals that had been set forth for the project I would have had
to hack the existing Rails tagging plugins to pieces.

So after some discussion about the Rails plugins with my team. We decided that
I should just start my own Rails tagging plugin. Anyways, I started developing
[Tagalong](http://github.com/cyphactor/tagalong), my Rails tagging plugin,
immediately. The library is now 3 months old and I figured I should let people
know that it exists and provide a breakdown of its features.

[Tagalong](http://github.com/cyphactor/tagalong) has two major concepts that a
developer needs to understand before being able to use it. The first concept is
a *Tagger*. A *Tagger* is simply an object that can perform the act of tagging
other objects (*Taggables*). As I am sure you have guessed the second concept
is a *Taggable*. A *Taggable* is simply an object in the system that can be
tagged.

The [Tagalong](http://github.com/cyphactor/tagalong) Rails plugin is built
entirely around these two concepts a *Tagger* and a *Taggable*. This
architecture decision is one of the major differences between this Rails
tagging plugin and the other tagging plugins out there. A brief breakdown of
the plugin is as follows.

* clean easy to understand API
* does NOT require saving of the model when tagging/untagging
* keeps history of tags *Taggers* have used
* allows defining multiple *Taggers* and *Taggables*
* tracks number of times tags are used
* returns tag lists in alphabetical order

The above are simply a few brief points. For details on all its features and
how to use it please refer to the GitHub project
[http://github.com/cyphactor/tagalong](http://github.com/cyphactor/tagalong).
