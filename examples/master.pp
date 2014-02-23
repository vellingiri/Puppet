define newip($ip){
	exec{
		"/bin/echo $ip $title":
}
}
newip{'eth0':
	ip => "10.239.52.199";
}

service{"apache":
	name => $operatingsystem?{
		debian  => "apache2",
		redhat  => "httpd",
		default => "apache",
	},
	ensure  => running,
}

class mysql{
	$packagelist=["mysql","mysql-server","mysql-devel"]

	package{$packagelist:
		ensure => installed
	}

	file{"/etc/my.cnf":
		owner   => "root",
		group   => "root",
		mode    => 0644,
		replace => true,
		#source  => "puppet://mysql/my.cnf",
		require => Package["mysql-devel"]
	}

	service{"mysqld":
		enable  => true,
		ensure  => running,
		require => File["/etc/my.cnf"]
	}
}

node master{
	include mysql
}
