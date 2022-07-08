#!/bin/bash


cd /var/www/html/
#cd builds/
#mv * /efs/storage/var/classes/
#cd /var/www/html/
#rm -rf /var/www/html/builds
#sudo php -d memory_limit=-1 composer install
sudo chown -R webapp:webapp *
sudo -u webapp php bin/console cache:clear
sudo -u webapp php bin/console cache:warmup
sudo php bin/console pimcore:deployment:classes-rebuild -d -c -q
sudo -u webapp php bin/console assets:install 
sudo chown -R webapp:webapp *
sudo chmod -R 0775 *
sudo service httpd restart 
sudo service php-fpm restart
