#!/bin/bash

/usr/sbin/postmap /etc/postfix/virtual-mboxes.in
mv virtual-mboxes.in.db virtual-mboxes.db
