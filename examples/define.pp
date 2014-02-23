define testfile($user = $title, $content){
file{"/home/${user}/.test":
	ensure => file,
	content => $content,
	mode => 0644,
	owner => root,
	require => User[$user],
	}
}

user{"paypal":
	ensure => present,
	managehome => true,
	uid => 1001,
	}

testfile{"paypal":
	content => "This is testing file to test the define method to know how it works!\n",
}
