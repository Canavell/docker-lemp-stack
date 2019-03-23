Stack includes: 
1. PHP5.6 (mod_php)
2. PHP7.1 (mod_php)
3. PHP7.1 (fpm)
4. Nginx
5. MySQL
6. Composer
7. MSMTP (mailing system)
8. Node.js and NPM (as packages)
9. Xdebug
10. phpcs
11. Adminer

Also stack correctly works with PhpStorm out of the box.

Instructions for use.
1. Rename the "docker-compose.yml.template" file to "docker-compose.yml"
2. In the docker-compose.yml file replace string "YOUR_MYSQL_PASSWORD" to your actual MySQL password. It must be string like "my_password" or "my_strong_password".
3. In the bin/config/apache_vhosts folder, rename the file "default.conf.template" to "default.conf"
4. In the bin/config/apache_vhosts folder, rename the file "default-ssl.conf.template" to "default-ssl.conf"
5. In the bin/сonfig/apache_porst folder, rename the file "ports.conf.template" to "ports.conf"
6. In the bin/config/nginx_vhosts folder, rename the file "fpm.conf.template" to "fpm.conf". And after that in the same folder rename the file "default.conf.template" to "default.conf".
7. In the bin/config/msmtp folder, rename the ".msmtp_php.template" file to the ".msmtp_php" file
8. In the ".msmtp_php" file, replace the "your_password" field with your gmail account password, and the "your_account@gmail.com" field into the mailbox from which you are going to send letters
9. Do the same manipulations as in step 6 for the Yandex mailbox
10. In the bin/config/php/php.ini file, you can manage the account from which emails will be sent. If you want to send from yandex, leave it as is. If you want to send from gmail, then in string 'sendmail_path = "/usr/bin/msmtp -C /etc/.msmtp_php - logfile /var/log/msmtp/msmtp.log -a yandex -t"' replace "yandex" with "gmail"
11. Open a terminal and navigate to the project root folder
12. Enter the command: ./export_variables.sh && source ~/.bashrc && ./setup.sh
13. In the /etc/hosts file enter (without quotes) two lines:
    "127.0.0.1 example.localhost" and 
    "127.0.0.1 fpm.localhost" 
14. Finished, open one of the options in the browser:
	http://example.localhost:7777/ (will open with php7.1, directly via Apache)
	https://example.localhost:7743/ (the same, but https version)
	http://example.localhost:5555/ (opens with php5.6, directly through Apache)
	https://example.localhost:5543/ (the same, but https version)
	http://example.localhost/ (opens with php7.1, will work as reverse proxy through nginx)
	http://fpm.localhost/ (opens with php7.1 through nginx and works as fpm)
15. Now it works. You can use composer, php7, php5, mysql commands from command line. You need open terminal and type, e.g. "php7 -v", or "mysql -uroot -upassword" and it will works.
16. If you are using PhpStorm, then you should create configuration called "example". Also you need create server in PhpStorm configuration called "myapp". In "myapp" server you need add path mapping to"/var/www/example".