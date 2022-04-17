#!/bin/bash

/usr/sbin/postmap /etc/postfix/local-recips.in
mv local-recips.in.db local-recips.db
