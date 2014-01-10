class php5-cli::install {
  package { 'php5-cli':
    ensure => installed
  }
}

class php5-cli::configure {
  exec { 'php5-cli-set-timezone':
    path => '/usr/bin:/usr/sbin:/bin',
    command => 'sed -i \'s/^[; ]*date.timezone =.*/date.timezone = Europe\/Warsaw/g\' /etc/php5/cli/php.ini',
    onlyif => 'test "`php -c /etc/php5/cli/php.ini -r \"echo ini_get(\'date.timezone\');\"`" = ""',
    require => Class['php5-cli::install']
  }
  exec { 'php5-cli-disable-short-open-tag':
    path => '/usr/bin:/usr/sbin:/bin',
    command => 'sed -i \'s/^[; ]*short_open_tag =.*/short_open_tag = Off/g\' /etc/php5/cli/php.ini',
    onlyif => 'test "`php -c /etc/php5/cli/php.ini -r \"echo ini_get(\'short_open_tag\');\"`" = "1"',
    require => Class['php5-cli::install']
  }
}

class php5-cli {
  include php5-cli::install
  include php5-cli::configure
}
