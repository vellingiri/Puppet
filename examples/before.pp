package { 'httpd':
        provider=>'yum',
        ensure=>'installed',
  before=>Notify['Apache2 is installed.'],
}

notify { 'Apache2 is installed.':
}

service { 'httpd':
        ensure=>'running'
}

notify { 'Apache2 is running.':
}
