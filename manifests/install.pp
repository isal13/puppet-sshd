# == Class: sshd::install
#
# A basic module to manage sshd

class sshd::install {
  package { "$sshd::package_name":
    ensure => $sshd::version
  }
}
