---
layout: post
title: RVM Installed Ruby (SSL certificate verify failed)
date: 2012-09-07
tags: [Ruby, SSL, Software Development]
---
Recently a few of our developers were having problems getting SSL certificate verify
failures in Ruby. The error was the following:

{% highlight text %}
OpenSSL::SSL::SSLError: SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/net/http.rb:799:in `connect'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/net/http.rb:799:in `block in connect'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/timeout.rb:54:in `timeout'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/timeout.rb:99:in `timeout'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/net/http.rb:799:in `connect'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/net/http.rb:755:in `do_start'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/net/http.rb:744:in `start'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/open-uri.rb:306:in `open_http'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/open-uri.rb:775:in `buffer_open'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/open-uri.rb:203:in `block in open_loop'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/open-uri.rb:201:in `catch'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/open-uri.rb:201:in `open_loop'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/open-uri.rb:146:in `open_uri'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/open-uri.rb:677:in `open'
  from /Users/adeponte/.rvm/rubies/ruby-1.9.3-p125/lib/ruby/1.9.1/open-uri.rb:33:in `open'
{% endhighlight %}

The error was reproducable by running the following Ruby snippet in an **irb**
instance of the RVM installed Ruby version.

{% highlight ruby %}
require 'open-uri'
open 'https://google.com'
{% endhighlight %}

I spent a good amount of time digging into things and trying to figure out
exactly what the issue was. I came to the conclusion that they either had an
out of date Root CA Certificate Bundle or SSL couldn't find it for some reason.
So, I went down the path of trying to import cacert.pem from
[http://curl.haxx.se/ca/cacert.pem](http://curl.haxx.se/ca/cacert.pem) (cURL's
website).

I went down this path because I vaguely remember doing this at some point in
the past to solve the Twitter API SSL Verify fail issue when they changed their
certs.  I ran into a huge amount of difficulty trying to get the thing imported
or converted into a format that Mac OS X Keychain Access would be happy with
importing. I tried pem, crt, pck12, etc. Nothing I did seemed to make a
difference.

This is when I saw a post of someone talking about SSL being installed inside
 of RVM and I looked at the latest output from ```rvm requirements```.  I
 quickly noticed that it now says to install SSL via the following command:

{% highlight text %}
rvm pkg install openssl
{% endhighlight %}

Come to find out if you have run the above command before installing your Ruby
version it will be using the RVM packaged openssl instead of the system
openssl. That also means that the Root CA Certificate Bundle is different, or
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

After running the above command you should now be able to restart your **irb**
instance and re-run the test snippet described at the beginning of this post.
This time you should get output looking similar to the following:

{% highlight text %}
 => #<File:/var/folders/j_/9nxyjmd10js8g1sjx446vrsm0000gn/T/open-uri20120907-36935-4i4y64> 
{% endhighlight %}

Just like that your SSL woes are gone.
