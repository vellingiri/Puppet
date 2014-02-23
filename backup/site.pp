
## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# PRIMARY FILEBUCKET
# This configures puppet agent and puppet inspect to back up file contents when
# they run. The Puppet Enterprise console needs this to display file contents
# and differences.

# Define filebucket 'main':
filebucket { 'main':
  server => 'master',
  path   => false,
}

# Make filebucket 'main' the default backup location for all File resources:
File { backup => 'main' }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
}
node test{
	#include apt_source
	include apache
	#include resolvconf
}
node agent{
	include yum
	include service
	include exec
}

class service{
	service { 'httpd':
		ensure    => 'running',
		enable => 'true',
	}
}

class yum{
	yumrepo{"master":
		baseurl  => "ftp://master.rdulinux.com/pub/RHEL5",
		descr    => "master",
		enabled  => 1,
		gpgcheck => 0
	}
	yumrepo{"puppet":
			baseurl        => "ftp://master.rdulinux.com/pub/Puppet-EL5/puppetlabs-products",
			descr        => "master",
			enabled    => 1,
			gpgcheck => 0,

	}
}

class exec{
	exec{'cmd':
		command => "/usr/bin/yum update",
	}
	notify{'test':
		message => "yum update successfully done!\n"
	}
}

class apt_source {
	apt::source { 'debian_wheezy_stable':
	location               	=> 'http://ftp.us.debian.org/debian/',
	release              	=> 'wheezy',
	repos               	=> 'main contrib',
	include_src      	=> false
	}
}

class resolvconf{
	resolvconf{'/etc/resolv_conf':
		nameserver => '192.168.1.103',
		domain	   => 'rdulinux.com'
	}
}


class apache{
	package {
		'apache2':
			ensure => installed
	}
	service {
		'apache2':
			ensure    => true,
			enable   => true,
			require => Package['apache2']
	}
}

class motd{
	file{'motd':
		path    => '/etc/motd',
		content => "Welcome to $hostname!\nIt is running ${operatingsystem} ${operatingsystemrelease} and Puppet ${puppetversion}.\nEnterprise Console: 
		      URL: https://master.rdulinux.com
		      User : admin@rdulinux.com
		      Pass : admin123",
	}
}

class cron{
	service{'cron':
		ensure  => running,
	}
}

node  master{
	include nfs::server
	nfs::server::export{ '/root/data':
		ensure  => 'mounted',
		clients => '*(rw,async,no_root_squash)'
		  }
	}

node agent1,agent2,agent3,agent4,agent5,agent6,agent7,agent8{
	include motd
	#include cron
	#include resolvconf
        include nfs::client
        Nfs::Client::Mount <<| |>> {
		ensure => unmounted
	}
	}
