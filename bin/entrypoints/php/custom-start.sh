#!/bin/bash

#create  msmtp logdir
mkdir -p /var/log/msmtp/ && chmod 777 /var/log/msmtp/
touch /var/log/msmtp/msmtp.log && chmod 777 /var/log/msmtp/msmtp.log

#php log dir
mkdir -p /var/log/php/ && chmod 777 /var/log/php/

#create xdebug profiler dir
mkdir -p /var/xdebug_profiler/ && chmod 777 /var/xdebug_profiler/

#copy config
cp /etc/.msmtp_php_original /etc/.msmtp_php
chmod 600 /etc/.msmtp_php 
chown www-data:www-data /etc/.msmtp_php

exec docker-php-entrypoint "$@"