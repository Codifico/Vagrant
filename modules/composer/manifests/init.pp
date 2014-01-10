class composer {
  exec { 'composer_install':
    command => 'curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer',
    path    => '/usr/bin:/usr/sbin',
    unless  => 'test -e /usr/local/bin/composer',
    require => [ Package['curl'], Package['php5-json'], Class['php5-cli'], Package['git']],
  }

  package { 'curl':
    ensure  => installed,
  }

  package { 'git':
    ensure => installed
  }
}
