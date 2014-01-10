class php5-intl {
  package { 'php5-intl':
    ensure => installed,
    require => Class['php5-fpm'],
    notify => Service['php5-fpm'],
  }
}
