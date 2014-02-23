$users_list=[
	"test1",
	"test2",
	"test3",
	"test4",
	"test5"
]

user{$users_list:
	ensure     => absent,
	shell      => '/bin/bash',
	managehome => true,
}

