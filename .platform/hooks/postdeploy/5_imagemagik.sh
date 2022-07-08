#!/bin/bash

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
#composer self-update --2.2
yum install libjpeg-turbo.x86_64 libjpeg-turbo-devel.x86_64 libjpeg-turbo-static.x86_64 libjpeg-turbo-utils.x86_64 openjpeg.x86_64 openjpeg-devel.x86_64 openjpeg-libs.x86_64 turbojpeg.x86_64 turbojpeg-devel.x86_64 gd.x86_64 jasper.x86_64 -y
yum install inkscape.x86_64 inkscape-view.x86_64 -y
yum install libtiff.x86_64 libtiff-static.x86_64 -y
yum install libpng.x86_64 libpng-devel.x86_64 libpng-static.x86_64 pngcrush.x86_64 -y
yum install lcms-libs.x86_64 lcms2-utils.x86_64 lcms-devel.x86_64 lcms.x86_64 lcms2.x86_64 lcms2-devel.x86_64 -y
yum install librsvg2-devel.x86_64 librsvg2-tools.x86_64 librsvg2.x86_64 -y
yum install php-redis -y

yum install java-1.8.0-openjdk-headless.x86_64 -y

cd /var/www/html
sudo composer install

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

###Deployment Done
