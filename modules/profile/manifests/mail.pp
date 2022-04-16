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
}
