#
# == Class: systemd::params
#
# Defines some variables based on the operating system
#
class systemd::params {

    include os::params

    $unit_dir = '/etc/systemd/system'

    case $::osfamily {
        'RedHat': {
            # Nothing here yet
        }
        'Debian': {
            # Nothing here yet
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
