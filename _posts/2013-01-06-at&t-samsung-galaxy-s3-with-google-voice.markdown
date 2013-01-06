---
layout: post
title: AT&T Samsung Galaxy S3 with Google Voice
date: 2013-01-06
tags: []
---
Hi All,

It seems there is a little hickup with the instructions google provides you
with to "Activate Google voicemail no this phone". That is at least for the
instructions for AT&T while trying to get Google Voice setup on an AT&T Galaxy
S3. The instructions Google provides say to enter the following exactly as
written as if dialing someone.

{% highlight text %}
*004*1<your 10 digit phone number>#
{% endhighlight %}

Every time I tried the above instructions my phone would return an error code.
I got so frustrated I even got online with AT&T tech support so that they
could verify the state of things as I was trying various other commands that I
found on the web. None, of the ones that worked allowed me to setup Google
Voice as my voicemail provider appropriately. After being online with AT&T
tech support for a while. I tried simply prepending another * character to the
entire thing. Guess what, magically it worked. I even had AT&T tech support
verify that it made the proper configuration change on my account. So the
correct command that Google should be telling people to enter exactly as
written is really the following:

{% highlight text %}
**004*1<your 10 digit phone number>#
{% endhighlight %}

Anyways, hope this blog post helps some other people struggling with this out
there. I know when I was searching I couldn't find any solution though I did
see a number of message boards with people looking for an answer to this
problem. If I were a better person I would probably go back and update all
those message boards with my solution. I just can't bring myself to do it.
