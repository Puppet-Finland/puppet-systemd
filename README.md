# systemd

A Puppet module for managing some aspects of systemd

# Module usage

This module includes one custom fact:

* [Fact: has_systemd](lib/facter/has_systemd.rb)

There are also two useful defines:

* [Define: systemd::service_override](manifests/service_override.pp)
* [Define: systemd::service_fragment](manifests/service_fragment.pp)

In addition there's the main class, which is currently a stub:

* [Class: systemd](manifests/init.pp)
