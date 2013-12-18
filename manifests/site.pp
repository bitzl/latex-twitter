class { 'keyboard':
  layout  => 'de',
  variant => 'utf8'
}

package { 'lua5.1':
  ensure => 'present'
}

package { 'lua5.1-dev':
  ensure => 'present'
}

package { 'luarocks':
  ensure => 'present',
  before => Exec['install_busted']
}

exec { 'install_busted':
  command => 'sudo luarocks install busted',
  path => ['/usr/bin/']
}
