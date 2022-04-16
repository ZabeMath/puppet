class profile::mail {
  group { 'vmail':
    ensure => present,
    system => true,
  }
}
