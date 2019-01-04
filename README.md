Stack includes: 
1. PHP5.6
2. PHP7.1
3. Nginx
4. MySQL
5. Composer
6. MSMTP (mailing system)
7. Node.js and NPM
8. Xdebug

Also stack correctly works with PhpStorm out of the box.

Instructions for use.
1. Rename the ".env.template" file to ".env"
2. Set your password for MySQL after the "=" sign in the ".env" file
3. In the bin/config/apache_vhosts folder, rename the file "default.conf.template" to "default.conf"
4. In the bin/сonfig/apache_porst folder, rename the file "ports.conf.template" to "ports.conf"
5. In the bin/config/msmtp folder, rename the ".msmtp_php.template" file to the ".msmtp_php" file
6. In the ".msmtp_php" file, replace the "your_password" field with your gmail account password, and the "your_account@gmail.com" field into the mailbox from which you are going to send letters
7. Do the same manipulations as in step 6 for the Yandex mailbox
8. In the bin/config/php/php.ini file, you can manage the account from which emails will be sent. If you want to send from yandex, leave it as is. If you want to send from gmail, then in string 'sendmail_path = "/usr/bin/msmtp -C /etc/.msmtp_php - logfile /var/log/msmtp/msmtp.log -a yandex -t"' replace "yandex" with "gmail"
9. Open a terminal and navigate to the project root folder
10. Enter the command: . ./setup.sh
11. In the /etc/hosts file, enter the required hosts, for example "127.0.0.1 example.localhost"
12. In the www folder, create a folder called "example"
13. Finished, open one of the options in the browser:
	http://example.localhost:7777/ (will open with php7.1, directly via Apache)
	http://example.localhost:5555/ (opens with php5.6, directly through Apache)
	http://example.localhost/ (opens with php7.1, will work as reverse proxy through nginx)
14. Now it works. You can use composer, php7, php5, mysql commands from command line. You need open terminal and type, e.g. "php7 -v", or "mysql -uroot -upassword" and it will works.
15. If you are using PhpStorm, then you should create servers with name "myapp" in PhpStorm debug configurtaion. Also you need add path mapping in server configuration to "/var/www/example-project"
