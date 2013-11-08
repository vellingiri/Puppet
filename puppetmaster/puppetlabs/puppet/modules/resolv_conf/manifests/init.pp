# == class: resolv_conf
#
# == Parameters
#
# $nameserver
# IP address in dot notation of your name servers
#
# $domain
# Local domain
#
# $search
# Please refer to the resolv.conf(5) manual page
#
# $sortlist (optional)
# Optional parameter that defaults to your netmask
#
# $options (optional)
# Please refer to the resolv.conf(5) manual page
#
# == Authors
#
# Thomas Linkin <tom@puppetlabs.com>
# Jon Mosco <jonny.mosco@gmail.com>
#
class resolv_conf (
  $nameserver = '127.0.0.1',
  $domain     = undef,
  $search     = undef,
  $sortlist   = [],
  $options    = undef,
) {

  if is_string($nameserver) {
    $_nameserver = [$nameserver]
  } else {
    $_nameserver = $nameserver
  }

  validate_array($_nameserver)
  validate_string($domain)
  validate_slength($search, 256)
  validate_array($sortlist)

  if size($sortlist) > 10 {
    fail('sortlist can not contain more than 10 addresses')
  }

  file { 'resolv.conf':
    ensure  => file,
    path    => '/etc/resolv.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('resolv_conf/resolv.conf.erb'),
  }
}
