#
# == Define: systemd::service_override
#
# Add a systemd service unit file to /etc/systemd/system directory. This 
# overrides the default unit file found in /lib/systemd/system.
#
# == Parameters
#
# [*ensure*]
#   The status of unit file. Valid values are 'present' (default) and 'absent'.
# [*service_name*]
#   Name of the system service to override. For example 'openvpn@' or 'ntp'.
# [*template_path*]
#   Full path (modulename/filename) to the template to upload. For example 
#   'openvpn/openvpn@.service.jessie.erb'.
#
define systemd::service_override
(
    $service_name,
    $template_path,
    $ensure = 'present'
)
{

    include ::systemd::params

    $unit_file = "/etc/systemd/system/${service_name}.service"

    file { "systemd-${service_name}.service":
        ensure  => $ensure,
        name    => $unit_file,
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0755',
        content => template($template_path),
        notify  => Class['systemd::service'],
    }
}
