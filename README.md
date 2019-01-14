Stack includes: 
1. PHP5.6 (mod_php)
2. PHP7.1 (mod_php)
3. PHP7.1 (fpm)
4. Nginx
5. MySQL
6. Composer
7. MSMTP (mailing system)
8. Node.js and NPM
9. Xdebug

Also stack correctly works with PhpStorm out of the box.

Instructions for use.
1. Rename the "docker-compose.yml.template" file to "docker-compose.yml"
2. In the docker-compose.yml file replace string "YOUR_MYSQL_PASSWORD" to your actual MySQL password. It must be string like "my_password" or "my_strong_password".
3. In the bin/config/apache_vhosts folder, rename the file "default.conf.template" to "default.conf"
4. In the bin/сonfig/apache_porst folder, rename the file "ports.conf.template" to "ports.conf"
5. In the bin/config/nginx_vhosts folder, rename the file "fpm.conf.template" to "fpm.conf". And after that in the same folder rename the file "default.conf.template" to "default.conf".
6. In the bin/config/msmtp folder, rename the ".msmtp_php.template" file to the ".msmtp_php" file
7. In the ".msmtp_php" file, replace the "your_password" field with your gmail account password, and the "your_account@gmail.com" field into the mailbox from which you are going to send letters
8. Do the same manipulations as in step 6 for the Yandex mailbox
9. In the bin/config/php/php.ini file, you can manage the account from which emails will be sent. If you want to send from yandex, leave it as is. If you want to send from gmail, then in string 'sendmail_path = "/usr/bin/msmtp -C /etc/.msmtp_php - logfile /var/log/msmtp/msmtp.log -a yandex -t"' replace "yandex" with "gmail"
10. Open a terminal and navigate to the project root folder
11. Enter the command: ./export_variables.sh && source ~/.bashrc && ./setup.sh
12. In the /etc/hosts file enter (without quotes) two lines:
    "127.0.0.1 example.localhost" and 
    "127.0.0.1 fpm.localhost" 
13. Finished, open one of the options in the browser:
	http://example.localhost:7777/ (will open with php7.1, directly via Apache)
	http://example.localhost:5555/ (opens with php5.6, directly through Apache)
	http://example.localhost/ (opens with php7.1, will work as reverse proxy through nginx)
	http://fpm.localhost/ (opens with php7.1 through nginx and works as fpm)
14. Now it works. You can use composer, php7, php5, mysql commands from command line. You need open terminal and type, e.g. "php7 -v", or "mysql -uroot -upassword" and it will works.
15. If you are using PhpStorm, then you should create two configurations, called "example-server" and "example-cli". Also you need create two servers in PhpStorm configuration with names "myapp" and "server". In "myapp" server you need add path mapping to "/home", in another server called "server" you need add path mapping to "/var/www/example". Then bind "example-server" with "server" and "example-cli" with "myapp". 