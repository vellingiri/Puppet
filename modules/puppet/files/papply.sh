#!/bin/sh
puppet apply /root/data/Puppet/manifests/site.pp --modulepath=/root/data/Puppet/modules/ $*
