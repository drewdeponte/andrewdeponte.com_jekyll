---
layout: post
title: Western Digital MyPassport
date: 2010-06-14
tags: [External Hard Drive, Mac OS X, Virtual CD, WD MyPassport, Computers]
---
So, recently I bought a Western Digital (WD) MyPassport portable 500GB hard
drive. I found when plugging it in that it had a very annoying Virtual CD built
into its firmware called WD SmartWare which I was not the least bit interested
in using. All, I wanted was an external USB hard drive that was portable and
just worked. So, the first thing I tried was to reformat it to a Journaled Mac
OS X file system. Once, I reformatted it, I was able to copy files too and from
the external drive just like I wanted to be. However, every time I plugged the
external drive in it would also mount this stupid Virtual CD which I didn't
want to deal with.

So, I googled around a bit for a way to stop this thing from mounting and
coming up every time I plug the external drive in. I found a bunch of articles
outlining how to update the firmware on the external hard drive and a bunch of
very long step by step processes all just to get this stupid Virtual CD to go
away. Soon, enough I found the answer I was looking for. It was simply to grab
the UUID of the Volume by using the following command:

`diskutil info /Volumes/WD\ SmartWare/`

Once, I had the UUID of the Volume then I created the /etc/fstab file and added
the following line to it.

`UUID=84789472-2EB5-3C8E-BFC1-F554F91B026C none hfs rw,noauto 0 0`

In my opinion this was a much better solution as it just disabled the auto
mounting of that volume and didn't require a firmware flash or anything crazy
just to get rid of the stupid Virtual CD. Anyways, I probably made this post
more for me than any of you. Though, hopefully someone else finds this tid bit
useful as well.
