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
