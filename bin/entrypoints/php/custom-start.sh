#!/bin/bash

#copy config
cp /etc/.msmtp_php_original /etc/.msmtp_php
chmod 600 /etc/.msmtp_php 
chown www-data:www-data /etc/.msmtp_php

#create  msmtp logdir
mkdir -p /var/log/msmtp/ && chmod 777 /var/log/msmtp/

#php log dir
mkdir -p /var/log/php/ && chmod 777 /var/log/php/

exec docker-php-entrypoint "$@"