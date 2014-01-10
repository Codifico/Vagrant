class php5-json {
  package { 'php5-json':
    ensure => installed,
    require => Class['php5-fpm'],
    notify => Service['php5-fpm'],
  }
}
