class {
  'php5-cli':     stage => main;
  'php5-json':    stage => main;
  'php5-fpm':     stage => main;
  'php5-mysql':   stage => main;
  'php5-intl':    stage => main;
  'nginx':        stage => main;
  'composer':     stage => main;
}

nginx::dev {'dev': }