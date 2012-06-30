---
layout: post
title: SublimeText2 Guard Plugin Updates
date: 2012-02-01
tags: [Python, Sublime Text 2, Sublime Text 2 Plugin, Software, Personal, Software Development, Software Projects]
---
Hey all,

I was having some difficulties with a couple bugs in the Sublime Text 2 Guard
plugin I have been working on. So, I decided I would drop Jon Skinner,
developer of Sublime Text 2, an e-mail and see if he knew about the issues I
was having and hopefully of solutions/work arounds for them. Jon, was very
helpful in terms of better understanding the issues as well as suggesting some
work arounds.

Anyways, given the input from Jon I took another look at the bugs/features of
the Guard plugin and decided to tackle them tonight. The following items show
the progress that I made tonight with respect to the Sublime Text 2 Guard
plugin: 

* Enabled native Sublime Text 2 word wrap in the Guard output view.
* Guard now exits properly when Sublime Text 2 exits/dies.
* Added default key bindings to show Guard output view (super+shift+c)
* Submitted a pull request to get the Guard plugin added to the [Package
  Control](http://wbond.net/sublime_packages/package_control) repository list.

As usual I am looking for feedback issues (feature requests, bug fixes, etc.)
You can find the project as
[sublime_guard](http://github.com/cyphactor/sublime_guard) on GitHub. As of
tonight I am down to two feature requests. So, please create bugs in the issues
if you run into any so that I can work on fixing them sooner rather than later.
