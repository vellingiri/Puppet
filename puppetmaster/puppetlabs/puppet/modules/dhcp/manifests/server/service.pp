class dhcp::server::service {
  
	#service { "isc-dhcp-server":
  service { "dhcpd":
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Class["dhcp::server::config"]
  }
  
}
