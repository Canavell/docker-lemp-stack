docker exec -it php7 /bin/bash -c "mv /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini_temp_disabled && exit"
docker exec -it php5 /bin/bash -c "mv /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini_temp_disabled && exit"
docker-compose restart php7 php5