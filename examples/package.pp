$group_package=['samba','vsftpd','vim-common']
package{"createrepo":
	ensure => latest,
}

package{$group_package:
	ensure => installed,
}
