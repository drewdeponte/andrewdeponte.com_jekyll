---
layout: post
title: Archaic - Archived Chats and Dev Helper
date: 2010-12-13
tags: [Cinch, IRC, Ruby, Ruby on Rails, Applications, Computers, Manager, Personal, Project Management, Software Development, Software Projects]
---
So for those of that don't know, I lead of team of software developers. For a
long time now I have noticed a number of gaps in the industry with respect to
software development and team collaboration. One area that I always felt was
missing some love was group chat.

Sure, there are a large number of different chat protocols and applications
that implement them all. However, they generally miss an archived history that
has full text searching. Beyond the group chat is prime location to distribute
push notifications when Git repositories that the team is working with have
changes pushed to them. Because of these two issues and number of other that I
really don't want to get into at this point I have started a new open source
project called ["Archaic"](http://github.com/cyphactor/archaic).

[Archaic](http://github.com/cyphactor/archaic) is a Rails application that
provides archiving of IRC channel chats with a full text search interface as
well as general developer helpers. It is composed of two pieces, an IRC Bot and
the Rails application. Technically they both share the rails environment as the
IRC Bot should be run with rails runner. You can checkout the project at the
following:
[http://github.com/cyphactor/archaic](http://github.com/cyphactor/archaic).

I plan to keep the master branch functional so feel free to use the master
branch. It currently has the following features.

* IRC Chat Archiving
* Full Text Chat Archive Searching with Context (to expand context simply click
  on resulting match)
* Week number helper (when anyone in IRC channel types "weeknum" it replies
  with current week number)
* Ticket number helper (when anyone in IRC channel types "#\d+" it replies with
  link to that ticket) 

This is the initial introduction to this project and I am sure it has numerous
directions that it can and will grow into. I very much welcome your thoughts,
suggestions, feature requests, bug reports, testing, etc.

I believe that having a good central place of communication for a team even if
they are working in the same office helps at least as a mechanism for keeping
your devs notified about repo pushes close to real time.

Anyways, enjoy!
