---
layout: post
title: Lazy Google App Engine Model Migrations
date: 2009-08-09
tags: [Google App Engine, Software Development]
---
I have been working on a side project for a bit now called We'reSICC (We are
Sound Image Community & Collaboration). It planned to be an online service that
is specifically designed to allow music artists and graphic artists to come
together and collaborate to create music merchandise. The idea is that
We'reSICC will provide a community and the necessary tools for Musicians and
Graphic Artists to collaborate easily to produce merchandise and also provide
the necessary tools for both Musicians and Graphic Artists to sell the
products. The business model is simply that each party involved gets a chunk of
the each sales profit. Anyways, thats enough lead in on that project you will
find more about it later.

The reason I mentioned We'reSICC is because we recently started porting the
Django code base over to Google App Engine. We soon found that it lacked
support for the standard database migration support that is generally necessary
when developing an application of this magnitude. Hence, after searching long
and hard I came to the conclusion that I would have to throw together the basis
for implementing Lazy Migrations for Google App Engine Models. Hence, I did and
then handed a version with very basic functionality off to Patrick Murphy to
flesh out further. Patrick Murphy is a software engineer friend of mine that is
also working on We'reSICC. He has written a very nice blog post here that
explains how these Lazy Google App Engine Model Migrations and provided all the
code you need to get started with it. We like to give back to the community
that has given so much to us, :-).

If you are interested in simply learning more about Patrick Murphy then by all
means check out his blog [here](http://codekittens.wordpress.com/).
