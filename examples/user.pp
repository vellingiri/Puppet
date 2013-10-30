user{'guest':
	ensure     => present,
	shell      => '/bin/bash',
	managehome => true,
}

