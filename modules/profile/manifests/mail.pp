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

  package { [ 'exim4-daemon-heavy', 'dovecot-core', 'dovecot-imapd' ]:
    ensure => present,
  }

  service { [ 'exim4', 'dovecot' ]:
    ensure => running,
  }
}
