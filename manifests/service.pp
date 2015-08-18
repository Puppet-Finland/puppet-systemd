#
# == Class: systemd::service
#
# A class for managing the systemd services. Currently limited to containing one 
# Exec which all service_fragment can notify to refresh systemd service 
# configuration.
#
class systemd::service {

    exec { 'systemctl-daemon-reload':
        command     => 'systemctl daemon-reload',
        refreshonly => true,
        path        => ['/bin', '/usr/bin'],
    }
}
