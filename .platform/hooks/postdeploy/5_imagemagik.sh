#!/bin/bash

cd /var/www/html/
yum install libjpeg-turbo.x86_64 libjpeg-turbo-devel.x86_64 libjpeg-turbo-static.x86_64 libjpeg-turbo-utils.x86_64 openjpeg.x86_64 openjpeg-devel.x86_64 openjpeg-libs.x86_64 turbojpeg.x86_64 turbojpeg-devel.x86_64 gd.x86_64 jasper.x86_64 -y
yum install inkscape.x86_64 inkscape-view.x86_64 -y
yum install libtiff.x86_64 libtiff-static.x86_64 -y
yum install libpng.x86_64 libpng-devel.x86_64 libpng-static.x86_64 pngcrush.x86_64 -y
yum install lcms2-utils.x86_64 lcms2.x86_64 lcms2-devel.x86_64 -y
yum install librsvg2-devel.x86_64 librsvg2-tools.x86_64 librsvg2.x86_64 -y
yum install python3-pip.noarch -y
pip3 install html2text
    sudo yum install java-1.8.0-openjdk-headless.x86_64 -y
   sudo  yum update -y
    sudo yum -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
    sudo yum makecache
    sudo yum -y install yum-utils
    sudo yum clean metadata
    yum install php80-php-redis -y
    yum install php-redis -y
  

#printf "/usr/local" |pecl install imagick 
#printf "no" |pecl install redis


#cd /

#aws s3 cp s3://usppackages/ffmpeg-release-amd64-static.tar.xz .
#tar -xf ffmpeg-release-amd64-static.tar.xz
#cd ffmpeg-4.2.2-amd64-static
#mv ffmpeg ffprobe /usr/bin/

#cd /
#aws s3 cp s3://usppackages/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz .
#tar -xf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
#cd wkhtmltox
#mv bin/wkhtmlto* /usr/bin/

cd /home/ec2-user
#rm -rf ffmpeg* ImageMagick* wkhtmltox*

stunnel /etc/stunnel/redis.conf

#cp /usr/bin/composer.phar /usr/bin/composer




cp /usr/bin/composer.phar /usr/bin/composer

#sudo composer update ocramius/package-versions
#cd /var/www/html/
#cd builds/
#mv * /efs/storage/var/classes/
cd /var/www/html/


sudo composer self-update 
#rm -rf /var/www/html/builds
sudo php -d memory_limit=-1 /usr/bin/composer install
sudo composer.phar self-update
#sudo composer require predis/predis
sudo chown -R webapp:webapp *
sudo -u webapp php bin/console cache:clear
sudo -u webapp php bin/console cache:warmup
sudo php bin/console pimcore:deployment:classes-rebuild -d -c -q
sudo -u webapp php bin/console assets:install --relative --symlink public
sudo -u webapp php bin/console cache:clear
sudo -u webapp php bin/console cache:warmup
sudo chown -R webapp:webapp *
sudo chmod -R 775 *
sudo chown -R webapp:webapp /efs/storage/var/classes
sudo chmod -R 775 /efs/storage/var/classes
sudo chown -R webapp:webapp /efs/storage/var/config
sudo chmod -R 775 /efs/storage/var/config
sudo chown -R webapp:webapp /efs/storage/web-var
sudo chmod -R 775 /efs/storage/web-var
#sudo composer require predis/predis
sudo service httpd restart
sudo service php-fpm restart

###Deployment Done
