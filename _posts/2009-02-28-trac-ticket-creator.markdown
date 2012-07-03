---
layout: post
title: Trac Ticket Creator
date: 2009-02-28
tags: [Python, Trac, Trac Plugin, XML-RPC, Project Management, Software Development]
---
Hello all. I have been using Trac for many years now and I have always had one
issue with. Creation of large numbers of tickets, large numbers being 10 to 20.
The interface just doesn't make it easy. So early this evening I finally
decided I was going to do something about it. So, I went to
[http://trac-hacks.org/wiki/XmlRpcPlugin](http://trac-hacks.org/wiki/XmlRpcPlugin)
and checkout out and installed the code on one of our Trac servers. Then, I
wrote a simple python wxWidgets script that connects via XML RPC to the Trac
environment and provides a much quicker and easier interface for creating large
numbers of tickets.

The interface simply provides a milestone dropdown and then a textbox and that
is it. Once you have selected a milestone you want the tickets to be associated
with (generally a batch of tickets is associated with a milestone), you can
type your ticket summary into the text box and simply press enter to create the
ticket. Once you press enter and it creates the ticket it will clear the text
box so that you can type the next ticket summary in and hit enter to create the
next ticket.

Soon enough I will clean this script up and officially release it as on an open
source app on the main site. If you are interested in this app before that
time, feel free to hit me up.
