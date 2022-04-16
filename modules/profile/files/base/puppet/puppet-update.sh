#!/bin/bash
set -e
if [ -f /root/disable_puppet ]
then
  echo 'puppet disabled'
  exit 1
fi

cd /etc/puppet/code
git pull --ff-only
puppet-apply
