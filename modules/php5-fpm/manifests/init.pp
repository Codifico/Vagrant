class php5-fpm::install {
package { 'php5-fpm':
  ensure => installed,
  require => Class['php5-cli'],
  before => Class['nginx'],
}
}

class php5-fpm::configure {
exec { 'php5-fpm-set-timezone':
  path => '/usr/bin:/usr/sbin:/bin',
  command => 'sed -i \'s/^[; ]*date.timezone =.*/date.timezone = Europe\/London/g\' /etc/php5/fpm/php.ini',
  onlyif => 'test "`php -c /etc/php5/fpm/php.ini -r \"echo ini_get(\'date.timezone\');\"`" = ""',
  require => Class['php5-fpm::install'],
  notify => Service['php5-fpm'],
}
exec { 'php5-fpm-disable-short-open-tag':
  path => '/usr/bin:/usr/sbin:/bin',
  command => 'sed -i \'s/^[; ]*short_open_tag =.*/short_open_tag = Off/g\' /etc/php5/fpm/php.ini',
  onlyif => 'test "`php -c /etc/php5/fpm/php.ini -r \"echo ini_get(\'short_open_tag\');\"`" = "1"',
  require => Class['php5-fpm::install'],
  notify => Service['php5-fpm'],
}
}

class php5-fpm::run {
service { php5-fpm:
  enable => true,
  ensure => running,
  hasstatus => true,
  hasrestart => true,
  require => Class['php5-fpm::install', 'php5-fpm::configure'],
}
}

class php5-fpm {
include php5-fpm::install
include php5-fpm::configure
include php5-fpm::run
}
