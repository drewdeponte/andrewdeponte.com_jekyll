---
layout: post
title: A Quick Multi-Source Ticket Dashboard
date: 2010-04-30
tags: [AppleScript, GeekTool, GitHub, Lighthouse, Mac OS X, Ruby, Things, Trac, Project Management, Software Development, Software Projects]
---
Today was one of those days where I woke up and something was just off with
respect to my workflow for some reason. I was frustrated with the fact that I
had to load a browser and go to a website to see what my tickets were for the
day. Instinctively I just wanted my tickets to magically be in my head so I
didn't have to go through all those steps. So, I started thinking about this
problem more and more as the day went by and I came to the conclusion that I
really have two problems.

1. I have tickets dispersed through multiple ticketing system.
2. I hate having to go through so many steps to see my tickets.

When I started thinking about my two problems I realized that I have my tickets
in roughly four different applications/services. These applications/services
are as follows:

* [Trac](http://trac.edgewall.org/) - Web based project management/task management tool
* [Lighthouse](http://lighthouseapp.com/) - Web based project management/task management tool
* [GitHub](http://github.com/) - Web based Git repository management system and issue tracking tool
* [Things](http://culturedcode.com/things/) - Desktop task management system

Beyond having multiple ticket sources, most of them have multiple accounts for
various reasons (contract jobs I have done, etc.). Being in a specific
environment while working within that scope/environment is fine. For example if
I am working on Project X it makes sense that I be in project X's environment.
However, the situation that I am frustrated with is the initialization and
transition periods which exist before you start working on a project and when
you are switching from one project to the next project.

Based on my issues and the situation I am frustrated with I have come up with a
small set of requirements for a solution. These requirements are listed below.

1. Tickets from all ticket sources must exist in a dashboard
2. This dashboard must require zero effort/steps to view it
3. This dashboard must automatically update with zero effort/steps

As many of you know despite the fact that I write software for various
platforms and in various languages my platform for development is generally Mac
OS X. Given that Mac OS X was my environment, I started thinking about this
requirement set and thinking about how I could make something that required
zero effort/steps to view it. The closest thing I could come up with was having
my tickets displayed on my desktop. After a few minutes of googling based on
that idea I found an awesome tool for Mac OS X called
[GeekTool](http://projects.tynsoe.org/en/geektool/). Among other things,
[GeekTool](http://projects.tynsoe.org/en/geektool/) will run shell
scripts/console applications for you on a set frequency and display their
output to a defined section of your desktop. This was perfect in my opinion so
I played with it for a few minutes and decide that I was going to use
[GeekTool](http://projects.tynsoe.org/en/geektool/).

Given the functionality of [GeekTool](http://projects.tynsoe.org/en/geektool/)
all that was really left was to write shell scripts/console applications that
output all of my tickets from the various ticket sources and I would have a
very quick and functional solution to my issue. Hence, I got to writing and
pumped out the following short little Ruby scripts, and one AppleScript script
to provide output of all my tickets from the various sources.

The following is a ruby script that pulls all my tickets in from all of my
various [Lighthouse](http://lighthouseapp.com/) accounts and projects.

{% highlight ruby %}
#!/usr/bin/env ruby
require 'rubygems'
require 'lighthouse-api'

include Lighthouse

accounts = ['domain one', 'domain two', 'domain three']
Lighthouse.token = 'your lighthouse All Accounts token'

accounts.each { |a|
  Lighthouse.account = a
  Project.find(:all).each { |p|
    if (!p.archived)
      ticks = p.tickets({:q => "responsible:me sort:priority state:open"})
      if (ticks.length > 0)
        puts p.name
        puts "-------------------------"
        puts "    id | pri | title"
        puts "-------------------------"
        ticks.each { |t|
          puts t.id.to_s.rjust(6) + " | " + t.priority.to_s.center(3) + " | " + t.title
        }
        puts "\n"
      end
    end
  }
}
{% endhighlight %}

The following is a ruby script that pulls all my tickets in from all of my
various [GitHub](http://github.com/) accounts and projects.

{% highlight ruby %}
#!/usr/bin/env ruby

require 'rubygems'
require 'octopi'

include Octopi

creds = [
  { :login => "login one", :token => "API token tied to login one" },
  { :login => "login two", :token => "API token tied to login two" },
  { :login => "login three", :token => "API token tied to login three"}
]

creds.each { |cred|
  authenticated_with :login => cred[:login], :token => cred[:token] do
    user = User.find(cred[:login])
    repos = user.repositories
    repos.each { |r|
      ticks = Issue.find_all(:repository => r, :state => "open")
      if (ticks.length > 0)
        puts r.name
        puts "-------------------------"
        puts "    id | pri | title"
        puts "-------------------------"
        ticks.each { |t|
          puts "n/a".rjust(6) + " | " + t.votes.to_s.center(3) + " | " + t.title
        }
        puts "\n"
      end
    }
  end
}
{% endhighlight %}

The following is a AppleScript script that pulls all my tickets in from
[Things](http://culturedcode.com/things/).

{% highlight applescript %}
tell application "Things"
  set nl to "\n"
  set output to "Things Tasks in Today\n--------------------------\n"
  repeat with todayToDo in to dos of list "Today"
    set curTaskName to name of todayToDo
    set output to output & " - " & curTaskName & nl
  end repeat
end tell
output
{% endhighlight %}

The following is a Python script that pulls all my tickets in from
[Trac](http://trac.edgewall.org/) when your [Trac](http://trac.edgewall.org/)
environment has the [Trac XML RPC
plugin](http://trac-hacks.org/wiki/XmlRpcPlugin) installed.

{% highlight python %}
#!/usr/bin/env python

import xmlrpclib

username = "loginname"
password = "password"
port = None # if need to specify a port set this to the port number
host = "domain-name-where-trac-hosted" # trac.rippletv.com at my work
path = "/path-to-the-environment"

url = "https://%s:%s@%s" % (username, password, host) 
if (port):
    url += ":%s" % (str(port))
url += path + "/login/xmlrpc"

svr = xmlrpclib.ServerProxy(url)

print "-------------------------"
print "    id | pri | title"
print "-------------------------"

ticket_ids = svr.ticket.query("owner=" + username + "&status!=closed&order=priority")
for ti in ticket_ids:
  cur_tick = svr.ticket.get(ti)
  cur_tick_hash = cur_tick[3]
  cur_id = ti
  cur_summary = cur_tick_hash['summary']
  cur_priority = cur_tick_hash['priority']
  pri_num = 0
  if (cur_priority == "trivial"):
    pri_num = 0
  elif (cur_priority == "minor"):
    pri_num = 1
  elif (cur_priority == "major"):
    pri_num = 2
  elif (cur_priority == "critical"):
    pri_num = 3
  elif (cur_priority == "blocker"):
    pri_num = 4
  print str(cur_id).rjust(6) +  " | " + str(pri_num).center(3) + " | " + str(cur_summary)
{% endhighlight %}

After coding the above scripts I simply set them up through the
[GeekTool](http://projects.tynsoe.org/en/geektool/) UI and like magic within 15
mins or so I had a working solution to my issue, thanks to the power of REST
based Web Services, Ruby, the Ruby Community, and Things AppleScript
integration. Checkout a screenshot
[here](https://www.facebook.com/media/set/?set=a.629955991290.2070660.30901409&type=1&l=d6d8aefeb9).
