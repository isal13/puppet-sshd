# == Class: sshd::config
#
# A basic module to manage sshd
#

class sshd::config {

  File {
    require => Class['sshd::install'],
    notify  => Class['sshd::service'],
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
  }

  file { '/etc/ssh/sshd_config':
    ensure  => present,
    content => template('sshd/sshd_config.erb'),
  }

  file { "${sshd::os_config_file}":
    mode    => $sshd::os_config_mode,
    content => template("${sshd::os_config_template}"),
  }

}
