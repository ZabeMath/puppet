#!/bin/bash
set -e
if [ -f /root/disable_puppet ]
then
  echo 'puppet disabled'
  exit 1
fi

puppet apply --modulepath --modulepath=/etc/puppet/code/modules:/usr/share/puppet/modules /etc/puppet/code/manifests
