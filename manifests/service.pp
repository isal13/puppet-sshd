# == Class: sshd::service
#
# A basic module to manage sshd
#

class sshd::service {
  $ensure = $sshd::start ? {true => running, default => stopped}

  service { "${sshd::service_name}":
    ensure  => $ensure,
    enable  => $sshd::enable,
    require => Class['sshd::config'],
  }
}
