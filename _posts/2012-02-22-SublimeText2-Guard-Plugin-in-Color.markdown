---
layout: post
title: SublimeText2 Guard Plugin in Color
date: 2012-02-22
tags: [Sublime Text 2, Sublime Text 2 Plugin, Color, Colored Output, Sublime Text 2 Language, Sublime Text 2 Theme, Personal, Software Development, Software Projects]
---
Hey all,

I know there are a number of you who have been eagerly awaiting this moment. I
sure have been. I am proud to announce the first release of the [Sublime Text 2
Guard Plugin](http://github.com/cyphactor/sublime_guard) that provides colored
output. Basically, it ended up that I had to define a language file to identify
the entities in the output and then define a theme to color those identified
entities. Once, I did that I simply programatically set the color_scheme and
syntax options for the output panel and like magic colors worked. Given the
complexity of the language definition and the limited test cases I had when
developing I am sure there are going to be some bugs to work out. So, as usual
please create issues if you find any of these
[issues](http://github.com/cyphactor/sublime_guard/issues).
