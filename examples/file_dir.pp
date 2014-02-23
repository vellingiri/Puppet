file{"/tmp/helloworld":
	ensure => file,
	content => "Hello World\n",
}

file{"/tmp/HELLO":
	ensure => directory,
}
