class mailcatcher {
	package { 'mailcatcher':
	    ensure   => 'installed',
	    provider => 'gem',
	    require => [ Package['ruby-dev'], Package['libsqlite3-dev'], Package['build-essential'] ],
	}

	package { 'libsqlite3-dev':
		ensure => 'installed'
	}

    package { 'ruby-dev':
      ensure => 'installed'
    }

    package { 'build-essential':
      ensure => 'installed'
    }

    service { 'mailcatcher':
      ensure => running,
      provider => 'upstart',
      require => File['/etc/init/mailcatcher.conf'],
    }

    file { "/etc/init/mailcatcher.conf":
      content => template('mailcatcher/mailcatcher.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '755',
      #notify  => Service['mailcatcher'],
    }
}
