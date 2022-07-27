#!/bin/bash
#env=`/opt/elasticbeanstalk/bin/get-config environment |tr -s "," "\n" |grep "Server_Env" |cut -d ":" -f2 |sed 's/\"//g'`
#if [ $env == "stage" ];then
mv /var/www/html/.eb-benstalk/templates/stage/php.conf /etc/httpd/conf.d/elasticbeanstalk/php.conf
mv /var/www/html/.eb-benstalk/templates/stage/crontab.txt /tmp/crontab.txt
mv /var/www/html/.eb-benstalk/templates/stage/php.ini /etc/php.ini
mv /var/www/html/.eb-benstalk/templates/stage/composer.json /var/www/html/composer.json
mv /var/www/html/.eb-benstalk/templates/stage/composer.lock /var/www/html/composer.lock
mv /var/www/html/.eb-benstalk/templates/stage/redis-cli.conf /etc/stunnel/redis-cli.conf

mv /var/www/html/.eb-benstalk/templates/stage/htaccess /var/www/html/.htaccess
mv .htaccess htaccess 
mv /var/www/html/.eb-benstalk/templates/stage/database.yml /var/www/html/config/local/database.yml


cronsdir="/opt/crons"
  if [ ! -d $cronsdir ]
  then
    mkdir -p $cronsdir
  fi
  mv /var/www/html/.eb-benstalk/templates/stage/crons.stage/*.sh $cronsdir/
  chmod u+x $cronsdir/*.sh

crontab -u root -l > /tmp/root_crontab_back.`date +"%Y-%m-%d_%H.%M"`
crontab -u root -r
dos2unix /tmp/crontab.txt
crontab -u root /tmp/crontab.txt

#fi

#vend="/var/www/html/vendor";
#if [ ! -d "$vend" ]
#then
 # mkdir -p /var/www/html/vendor
 # cd /var/www/html/
#  aws s3 cp s3://guardian-packages/vendor.zip . 
#  unzip vendor.zip

#fi
