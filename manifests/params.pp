#
# == Class: systemd::params
#
# Defines some variables based on the operating system
#
class systemd::params {

    include ::os::params

    $unit_dir = '/etc/systemd/system'

    case $::osfamily {
        'RedHat': {
            # Nothing here yet
        }
        'Debian': {
            # Nothing here yet
        }
        'FreeBSD': {
            # FreeBSD does not have systemd, but we want to be able to use the 
            # provided facts
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
