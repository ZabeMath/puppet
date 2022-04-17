class profile::mail {
  group { 'vmail':
    ensure => present,
    system => true,
  }

  user { 'vmail':
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

  file { '/etc/postfix/local-recips.in':
    ensure => present,
    source => 'puppet:///modules/profile/postfix/local-recips',
  }
}
