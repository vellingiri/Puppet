#resolv_conf

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with resolv_conf](#setup)
    * [What resolv_conf affects](#what-resolv_conf-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

The resolv_conf module configures /etc/resolv.conf on Linux based systems.

##Module Description

resolv_conf module will manage the configuration of the /etc/resolv.conf on Linux based systems

##Setup

###What resolv_conf affects

* If the contents of /etc/resolv.conf are being managed by Network Manager, it will get overwritten

###Setup Requirements

This module assumes that the network configuration is not being managed by Network Manager.

[Requires Puppetlabs stdlib module](https://forge.puppetlabs.com/puppetlabs/stdlib)

##Usage

Class: resolv_conf

        class { 'resolv_conf':
          nameserver => '192.168.1.20',
          domain     => 'example.com',
        }

##Parameters:

        $nameserver
        IP address in dot notation of your name servers

        $domain
        Local domain

        $search
        Please refer to the resolv.conf(5) manual page

        $sortlist (optional)
        Optional parameter that defaults to your netmask

        $options (optional)
        Please refer to the resolv.conf(5) manual page

##Limitations

Tested on Debian and RedHat based Linux distributions.

##Development

This module follows the manual page provided on Linux systems.  If adding any options, please consult the man page first.

##Release Notes/Contributors/Etc

Contributions from:

        Thomas Linkin <tom@puppetlabs.com>
