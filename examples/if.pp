if $uptime_days >= 2{
	notify{"need to reboot your server\n":}
}
else{
	notify{"You still have time to reboot your server\n":}
}
