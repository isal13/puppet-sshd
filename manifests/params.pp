# == Class: sshd::params
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

class sshd::params {
  $allowagentfwd   = 'no'
  $allowtcpfwd     = 'no'
  $maxstartups     = '10'
  $permitrootlogin = 'no'
  $printmotd       = 'yes'
  $printlastlog    = 'no'
  $sftpgroup       = 'sftponly'
  $usedns          = 'no'
  $x11forwarding   = 'no'


  # OS defaults files
  case $::osfamily {
    'debian': {
      $package_name       = 'openssh-server'
      $service_name       = 'ssh'
      $os_config_file     = '/etc/default/ssh'
      $os_config_template = 'sshd/debian/default-ssh.erb'
      $os_config_mode     = '0640'
    }
    'redhat': {
      $package_name       = 'openssh-server'
      $service_name       = 'sshd'
      $os_config_file     = '/etc/sysconfig/sshd'
      $os_config_template = 'sshd/redhat/sysconfig-sshd.erb'
      $os_config_mode     = '0644'
    }
    default: {
      fail("Unsupported operating system: ${::osfamily}/${::operatingsystem}")
    }
  }

}
