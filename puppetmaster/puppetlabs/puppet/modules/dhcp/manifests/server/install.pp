class dhcp::server::install {
  
	#package { "isc-dhcp-server":
  package { "dhcp":
    ensure => installed,
  }
  
}
