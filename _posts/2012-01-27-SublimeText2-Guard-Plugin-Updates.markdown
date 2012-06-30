---
layout: post
title: SublimeText2 Guard Plugin Updates
date: 2012-01-27
tags: [Python, Sublime Text 2, Sublime Text 2 Plugin, Software, Personal, Software Development, Software Projects]
---
Just dropping a quick note to all that follow my blog. Last night I made a
numeber updates to the [Guard
Plugin](http://github.com/cyphactor/sublime_guard) for [Sublime Text
2](http://www.sublimetext.com/2). Most of these were in direct response to
feedback that I got from users after making the initial release on my blog, I
think, two days ago. The modifications I made are enumarted below:

* The biggest addition is `RVM detection and integration`. The plugin is now
  intelligent enough to detect if you have RVM installed and detect if you are
  using a Project specific .rvmrc and of course respond by calling Guard
  appropriately depending on the case.
* Another relatively small fix is a `vertical only auto-scroll`. Before, if Guard
  output went to the right past the width of the pane it was auto-scrolling to
  the right and then bouncing back to the left at the next line. Now, it always
  scrolls down the left most column of the output basically making it
  auto-scroll vertically.
* Third I added some output preprocessing that `strips out the Terminal Color
  Codes` so that the output is a bit cleaner.
* I also added a lot of `descriptive output and error handling and output` to let
  the user better know what is failing so they might be able to debug the
  situation a bit better.

As always if you have any feedback (feature requests, bug reports, etc.) you
can simply create an issue for the project at the projects [GitHub Issues
Page](http://github.com/cyphactor/sublime_guard/issues).

If you are new to the [Guard Plugin](http://github.com/cyphactor/sublime_guard)
for [Sublime Text 2](http://www.sublimetext.com/2) you can find installation
instructions and document on the [GitHub
Page](http://github.com/cyphactor/sublime_guard).

For instructions on upgrading please checkout the [GitHub
Page](http://github.com/cyphactor/sublime_guard).
