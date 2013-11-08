class testuser{
	file{"/tmp/puppet":
		owner  => 'root',
		group  => 'root',
		mode   => '0755',
		ensure => 'directory',
	}
}

node "master'{
	include testuser
}
