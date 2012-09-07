---
layout: post
title: RVM Installed Ruby (SSL certificate verify failed)
date: 2012-09-07
tags: []
---
Recently a few of our developers were having problems getting SSL Cert verify
failures in Ruby. The error was the following:

{% highlight text %}
SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed
{% endhighlight %}

I spent a good amount of time digging into things and trying to figure out
exactly what the issue was. I came to the conclusion that they either had an
out of date Root CA Cert Bundle or SSL couldn't find it for some reason. So, I
went down the path of trying to import cacert.pem from
[http://curl.haxx.se/ca/cacert.pem](http://curl.haxx.se/ca/cacert.pem) (cURL's
website).

I went down this path because I vaguely remember doing this at some point in
the past to solve the Twitter API SSL Verify fail issue when they changed their
certs.  I ran into a huge amount of difficulty trying to get the thing imported
or converted into a format that Mac OS X Keychain Access would be happy with
importing. I tried pem, crt, pck12, etc. Nothing I did seemed to make a
difference.

This is when saw a post of someone talking about SSL being installed inside of
RVM and I looked at the latest output from `rvm requirements` and noticed that
it now says to install SSL via the following command:

{% highlight text %}
rvm pkg install openssl
{% endhighlight %}

Come to find out if you have run the above command before installing your ruby
version the ruby version will be using the RVM packaged openssl instead of the
system openssl. That also means that the Root CA Cert Bundle is different, or
in this case, **missing completely**.

After discovering this and doing a little googling I found the solution to be
as simple as the following command:

{% highlight text %}
curl http://curl.haxx.se/ca/cacert.pem -o ~/.rvm/usr/ssl/cert.pem
{% endhighlight %}

I found this solution on the following blog post
[http://fredwu.me/post/28834446907/fix-openssl-error-on-mountain-lion-and-rvm](http://fredwu.me/post/28834446907/fix-openssl-error-on-mountain-lion-and-rvm).
Hopefully, writing another blog post on the subject and linking to this one
will help it gain its ranks in google search so that other people can find it
quicker.

