node master{
	file{'/tmp/hello':
		content => "Hello World!\n"
	}
}
