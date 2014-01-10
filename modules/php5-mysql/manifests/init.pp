class php5-mysql {
  package { 'php5-mysql':
  ensure => installed,
  require => Class['php5-fpm'],
  notify => Service['php5-fpm']
  }
}