# systemd

A Puppet module for managing systemd

# Module usage

This module includes one custom fact:

* [Fact: has_systemd](lib/facter/has_systemd.rb)

There's also a define which can create unit file overrides for services:

* [Define: systemd::service_fragment](manifests/service_fragment.pp)

In addition there's the main class, which is currently a stub:

* [Class: systemd](manifests/init.pp)

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has been tested on

* Debian 8 64-bit

It should also work on other Linux systems that use systemd

For details see [params.pp](manifests/params.pp).
