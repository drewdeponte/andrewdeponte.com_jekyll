---
layout: post
title: Fat Fingered my MacBook Air
date: 2010-05-07
tags: [Change Root Password, Mac OS X, MacBook Air, Single User Mode, Apple, Personal]
---
So I setup my MacBook Air right after I got it and was just using the basic
functionality. I then realized that I needed root to do something. Yep, you
guessed it, I some how managed to to fat finger my root password when I setup
the initial Admin user in the setup process. This is normally not a big deal as
you can always put the DVD back in and rerun the setup wizard to create a new
user. However when you are a MacBook Air and have no DVD drive it gets to be a
tad bit more complex.

The key is single user mode. After some googling I found that you can easily
get into single user mode on Mac OS X simply by rebooting and right after the
Chime noise holding Command-S and it will start you up into single user mode.
For details on single user mode please go
[here](http://support.apple.com/kb/HT1492).

When you see the prompt for single user mode it will tell you two commands to
run to make it so that you can modify the file system. One is a fsck command
and the other is a mount command. I simply ran the two commands as the info
above the prompt instructed me to. Once it was done running those commands, I
ran the following command and rebooted so that it would start the initial setup
process over again. I did this because I knew that if I created a new Admin
user and knew its password I could then sudo in and change the password of my
existing Admin user that I previously fat fingered the password for.

`$ rm /var/db/.AppleSetupDone`

I know that there are command line tools that allow you to change passwords,
etc. in Mac OS X, but for some reason I wasn't feeling like looking up the
directions on how to use them. Hence, I just did it this way. Figured I would
share my find on Single User Mode, :-). I am sure someone has already found it,
but it is new to me.
