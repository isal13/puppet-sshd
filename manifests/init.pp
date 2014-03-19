# == Class: sshd
#
# A basic module to manage sshd
#
# === Parameters
# [*version*]
#   The package version to install
#
# [*port*]
#   The port to listen on
#
# [*enable*]
#   Should the service be enabled during boot time?
#
# [*start*]
#   Should the service be started by Puppet

class sshd (
  $version = 'installed',
  $port    = '22',
  $enable  = true,
  $start   = true,
  $sftp    = false,
) inherits sshd::params {
  class{'sshd::install': } ->
  class{'sshd::config': } ~>
  class{'sshd::service': } ->
  Class['sshd']
}
