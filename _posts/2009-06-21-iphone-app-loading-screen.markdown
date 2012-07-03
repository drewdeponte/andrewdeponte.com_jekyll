---
layout: post
title: iPhone App Loading Screen
date: 2009-06-21
tags: [iPhone Development, Software Development]
---
Hi all. If you don't know already I have been playing with some iPhone app
development pretty heavy lately. One of the interesting things which was some
what more difficult to find was how to create a loading screens in iPhone apps.
After I bit of googling and some reading of different forums I finally narrowed
it down. It is handled automatically if you simply created a PNG file called
Default.png that is 320 x 240 pixels with a 160 ppi and place it in your
projects Resources file. Once in you Resources it will be displayed during the
time that the application is loading. If you need to extend the time to get
your splash screen to stay on the screen because your code is god like and fast
simply tack a sleep or something in your applicationDidFinishLaunching method.
