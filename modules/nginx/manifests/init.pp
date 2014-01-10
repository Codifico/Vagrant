class nginx::install {
package { 'nginx':
  ensure => installed,
}
}

class nginx::run {
service { nginx:
  enable => true,
  ensure => running,
  hasstatus => true,
  hasrestart => true,
  require => Class['nginx::install'],
}
}

define nginx::dev(
$server_name = '*.dev.example.com',
$template = 'nginx/dev.erb',
$site = 'dev',
$root = '/var/www/web'
) {
$sitesavailable = '/etc/nginx/sites-available'
$sitesenabled = '/etc/nginx/sites-enabled'
file {"$sitesavailable/$site":
  content => template($template),
  owner   => 'root',
  group   => 'root',
  mode    => '755',
  require => Package['nginx'],
  notify  => Service['nginx']
}
file { "$sitesenabled/$site":
  ensure => 'link',
  target => "$sitesavailable/$site",
  require => Package['nginx'],
  notify  => Service['nginx']
}
}

define nginx::mysql(
$server_name = '*.mysql.example.com',
$template = 'nginx/mysql.erb',
$site = 'mysql',
$root = '/usr/local/bin/chive'
) {
$sitesavailable = '/etc/nginx/sites-available'
$sitesenabled = '/etc/nginx/sites-enabled'
file {"$sitesavailable/$site":
  content => template($template),
  owner   => 'root',
  group   => 'root',
  mode    => '755',
  require => Package['nginx'],
  notify  => Service['nginx']
}
file { "$sitesenabled/$site":
  ensure => 'link',
  target => "$sitesavailable/$site",
  require => Package['nginx'],
  notify  => Service['nginx']
}
}

define nginx::angularjs(
$server_name = '*.dev.example.com',
$template = 'nginx/angularjs.erb',
$site = 'dev',
$root = '/var/www/build/'
) {
$sitesavailable = '/etc/nginx/sites-available'
$sitesenabled = '/etc/nginx/sites-enabled'
file {"$sitesavailable/$site":
  content => template($template),
  owner   => 'root',
  group   => 'root',
  mode    => '755',
  require => Package['nginx'],
  notify  => Service['nginx']
}
file { "$sitesenabled/$site":
  ensure => 'link',
  target => "$sitesavailable/$site",
  require => Package['nginx'],
  notify  => Service['nginx']
}
}

class nginx {
include nginx::install
include nginx::run
}
