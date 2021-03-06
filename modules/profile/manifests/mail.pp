class profile::mail {
  group { 'vmail':
    ensure => absent,
    system => true,
  }

  user { 'vmail':
    ensure     => absent,
    gid        => 'vmail',
    shell      => '/bin/false',
    home       => '/srv/dovecot/users',
    managehome => false,
    system     => true,
  }

  package { [ 'postfix', 'dovecot-core', 'dovecot-imapd' ]:
    ensure => present,
  }

  service { [ 'postfix', 'dovecot' ]:
    ensure => running,
  }

  # local-recips
  file { '/etc/postfix/local-recips.in':
    ensure => present,
    source => 'puppet:///modules/profile/postfix/local-recips',
  }
  file { '/etc/postfix/generate-local-recips-db.sh':
    ensure => present,
    mode   => '0744',
    source => 'puppet:///modules/profile/postfix/generate-local-recips-db.sh'
  }
}
