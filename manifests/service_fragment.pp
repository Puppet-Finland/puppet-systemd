#
# == Define: systemd::service_fragment
#
# Add a Puppet-managed service fragment

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

    file { "systemd-${service_name}.service.d":
        ensure => $ensure_dir,
        name   => $fragment_dir,
        owner  => $::os::params::adminuser,
        group  => $::os::params::admingroup,
        mode   => '0755',
    }

    file { "systemd-${service_name}-puppet.conf":
        ensure  => $ensure_file,
        name    => "${fragment_dir}/puppet.conf",
        content => template('systemd/puppet.conf.erb'),
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0755',
        require => File["systemd-${service_name}.service.d"],
        notify  => Class['systemd::service'],
    }
}
