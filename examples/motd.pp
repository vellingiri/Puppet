class motd{
	file{"/etc/motd":
		ensure   => file,
		owner    => 'root',
		group    => 'root',
		mode     => '0644',
		content  => template('motd/generic_motd.erb')
	}
}
node master{
	include motd
}
