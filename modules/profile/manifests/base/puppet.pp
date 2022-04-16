class profile::base::puppet {
  file { '/usr/local/sbin/puppet-apply':
    source => 'puppet:///modules/profile/base/puppet/puppet-apply.sh',
    mode   => '0500',
  }

  file { '/usr/local/sbin/puppet-update':
    source => 'puppet:///modules/profile/base/puppet/puppet-update.sh',
    mode   => '0500',
  }
}
