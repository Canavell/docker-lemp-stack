#!/bin/bash
cp /etc/.msmtp_php_original /etc/.msmtp_php
chmod 600 /etc/.msmtp_php 
chown www-data:www-data /etc/.msmtp_php
exec docker-php-entrypoint "$@"