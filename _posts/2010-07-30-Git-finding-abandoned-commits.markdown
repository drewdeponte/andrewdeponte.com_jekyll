---
layout: post
title: Git, finding abandoned commits...
date: 2010-07-30
tags: [Personal, Git, Software Development, Source Control]
---
So, as many of you may know I recently took a position heading up a new
software engineering team that is responsible for producing the new products.
One of my first actions when I came on board was switching my team over from
SVN to Git. One of the engineers on the team abandoned a branch in one of our
Git repositories because he didn't think he would need it anymore. Soon, after
he realized that he wanted something from that branch but now he couldn't see
the brach anymore in 'gitk --all' or any of the other tools because he
abandoned it. But, it has to still be there right, it is Git.

I knew there was a way to do this in Git and I have done it in the past but I
couldn't remember how. After I explained a bit more to him about the internals
of Git and he went off and did some exploration he came back to me with his
found solution which follows:

`git fsck --unreachable| cut -f3 -d' '|xargs git rev-list --header|less`

I know there is some other way to find abandoned nodes in Git but I still can't
remember. Anyways, just figured I would share this method in the hopes that it
would help someone out there. It may not be exactly what you want with respect
to the 'cut' or 'xargs' but I will let you all play with it a bit to get
exactly what you want.
