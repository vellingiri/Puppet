$a=['sathya','sathya1','sathya2']

user{"testuser":
	ensure     => absent,
	managehome => true,
}
