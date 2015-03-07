# systemd

A Puppet module for managing systemd

# Module usage

For now the purpose of this module is to distribute custom facts:

* [Fact: has_systemd](lib/facter/has_systemd.rb)

A stub main class is included, though:

* [Class: systemd](manifests/init.pp)

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has been tested on

* Debian 8 64-bit

It should also work on other Linux systems that use systemd

For details see [params.pp](manifests/params.pp).
