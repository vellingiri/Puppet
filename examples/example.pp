package{"createrepo":
	ensure => installed
}

file{"/etc/nologin":
	ensure  => file,
	content => "Welcome to Puppet!\n"
}

service{"sshd":
	ensure => running,
	enable => true
}

user{"testuser":
	ensure     => absent,
	managehome => false 
}

if $::operatingsystem == 'Ubuntu' {
	notify { 'Running on Ubuntu': }
} else {
	notify { 'Non-Ubuntu system detected. Please upgrade
	to Ubuntu immediately.': }
}

$systemtype = $::operatingsystem ? {
	'Ubuntu' => 'debianlike',
	'Debian' => 'debianlike',
	'RedHat' => 'redhatlike',
	'Fedora' => 'redhatlike',
	'CentOS' => 'redhatlike',
	default  => 'unknown',
}
notify{"You have a ${systemtype} system":}
