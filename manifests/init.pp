# == Class: systemd
#
# This class installs and configures systemd
#
# == Parameters
#
# [*manage*]
#   Whether to manage systemd using this module. Valid values are true 
#   (default) and false.
# [*manage_config*]
#   Whether to manage systemd configuration using this module. Valid values are 
#   true (default) and false.
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
    Boolean $manage = true,
    Boolean $manage_config = true

) inherits systemd::params
{

if $manage {

    if str2bool($::has_systemd) {
        if $manage_config {
            include ::systemd::service
        }
    }
}
}
