---
layout: post
title: Shrinking Vagrant Linux Boxes
date: 2013-10-29
tags: [Vagrant, VMware, VirtualBox, Software Development]
---
So, lately I have been using Virtual Machines via
[Vagrant](http://www.vagrantup.com/) a siginificant amount as we are now using
them to host our development environments and dependencies for all the
development work we do. We have been using [Puppet](http://puppetlabs.com/) to
automate the configuration of our environments and to make building our boxes
easier.

Once you have provisioned a VM and you have it all dialed, you will most
likely want to create a [Vagrant Box](http://docs.vagrantup.com/v2/boxes.html)
from that VM and host it up on S3 so that new developers can get started
simply by installing [Vagrant](http://www.vagrantup.com/), cloning your
repository and running:

{% highlight text %}
$ vagrant up
{% endhighlight %}

This actually works great. However, I found that the VM disks both for the
[Vagrant VMware Provider](http://docs.vagrantup.com/v2/vmware/index.html) and
the [VirtualBox Provider](http://docs.vagrantup.com/v2/virtualbox/index.html)
grow dynamically, but they never shrink. So, when I was going through the
process of building the VM and installing all the dependency software, etc. it
was bloating the base machine.  This was the case even though I removed the
temporary cruft from the filesystem on the guest.

With a little research and some trial and error I found that you can shrink
these disks as long as they are ext3 or ext4 file systems with the help of the
following command:

{% highlight text %}
$ vagrant ssh
$ sudo dd if=/dev/zero of=wipefile bs=1024x1024; rm wipefile
{% endhighlight %}

What the above command is doing is simply writing zero bytes to the wipefile in
chunks of 1024 bytes until there is no disk space left in your VM's disk. Then
it is removing the wipefile. This basically leaves all those excess bytes
zero'd out.

This is necessary because the shrink/compaction tools provided by either
[VMWare](http://www.vmware.com/) or [VirtualBox](https://www.virtualbox.org/)
both have no way of identifying space they can free up in the disks unless
they are zero'd out.

Before shrinking/compacting you should always make sure to exit the guest
machine using the following commands:

{% highlight text %}
$ exit
$ vagrant halt
{% endhighlight %}

With [VMware](http://www.vmware.com/) you can shrink the vmdk disk by doing
the following:

{% highlight text %}
$ vmware-vdiskmanager -d /path/to/main.vmdk
$ vmware-vdiskmanager -k /path/to/main.vmdk
{% endhighlight %}

I discovered the above commands in the Vagrant VMware documentation,
[http://docs.vagrantup.com/v2/vmware/boxes.html](http://docs.vagrantup.com/v2/vmware/boxes.html)

With [VirtualBox](https://www.virtualbox.org) the only way I was able to
shrink the disk image was to clone it to a smaller copy using the following
command:

{% highlight text %}
$ VboxManage clonehd name-of-original-vm.vdi name-of-clone-vm.vdi
{% endhighlight %}

Once you have cloned the vdi you can then import it into the VM through
VirtualBox and get rid of the original vdi.

That is how you "Shrink Vagrant Linux Boxes!"
