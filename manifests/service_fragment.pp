#
# == Define: systemd::service_fragment
#
# Add a Puppet-managed service fragment to
# /etc/systemd/system/${service_name}.service.d/puppet.conf
#
# This define allows customizing parts of unit file configuration, e.g. to add 
# pidfile to a service which would not otherwise create it. The 
# puppetfinland/ntp module, for example, makes use of this functionality.
#
# == Parameters
#
# [*ensure*]
#   The status of the service. Valid values are 'running', 'present' and 
#   'absent'.
# [*service_name*]
#   Name of the system service.
# [*pidfile*]
#   Location of the pidfile for the service.
#
define systemd::service_fragment
(
    $ensure,
    $service_name,
    $pidfile
)
{

    include ::os::params

    case $ensure {
        'running': {
            $ensure_file = 'file'
            $ensure_dir = 'directory'
            $restart = 'always'
        }
        'present': {
            $ensure_file = 'file'
            $ensure_dir = 'directory'
            $restart = 'no'
        }
        'absent': {
            $ensure_file = 'absent'
            $ensure_dir = undef
            $restart = 'no'
        }
        default: {
            fail("ERROR: Invalid value ${ensure} for parameter \$ensure!")
        }
    }

    $fragment_dir = "/etc/systemd/system/${service_name}.service.d"

    File {
        owner  => $::os::params::adminuser,
        group  => $::os::params::admingroup,
        mode   => '0755',
    }

    file { "systemd-${service_name}.service.d":
        ensure => $ensure_dir,
        name   => $fragment_dir,
    }

    file { "systemd-${service_name}-puppet.conf":
        ensure  => $ensure_file,
        name    => "${fragment_dir}/puppet.conf",
        content => template('systemd/puppet.conf.erb'),
        require => File["systemd-${service_name}.service.d"],
        notify  => Class['systemd::service'],
    }
}
