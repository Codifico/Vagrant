class chive {
  exec { 'chive':
    path => '/usr/bin:/usr/sbin:/bin',
    command => 'wget -O - http://www.chive-project.com/Download/Redirect|tar -xzp',
    unless => "test -e /usr/local/bin/chive",
    cwd => '/usr/local/bin/',
    require => Package['wget'],
  }

  package { 'wget':
    ensure  => installed,
  }
}
