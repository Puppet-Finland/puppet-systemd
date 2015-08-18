# == Class: systemd
#
# This class installs and configures systemd
#
# == Parameters
#
# [*manage*]
#   Whether to manage systemd using this module. Valid values are 'yes' 
#   (default) and 'no'.
# [*manage_config*]
#   Whether to manage systemd configuration using this module. Valid values are 
#   'yes' (default) and 'no'.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class systemd
(
    $manage = 'yes',
    $manage_config = 'yes'

) inherits systemd::params
{

if $manage == 'yes' {

    if str2bool($::has_systemd) {
        if $manage_config == 'yes' {
            include ::systemd::service
        }
    }
}
}
