#!/bin/bash 
#env=`/opt/elasticbeanstalk/bin/get-config environment |tr -s "," "\n" |grep "Server_Env" |cut -d ":" -f2 |sed 's/\"//g'`
#if [ $env == "Development" ];then
yum install stunnel -y
cd  /var/www/html/var
mv tmp old-tmp

mv classes/* /mnt/efs/var/classes/ 
mv  /var/www/html/var/config/* /mnt/efs/var/config/
#linking var directory with efs storage directory
#linking /var/www/html/var/* files
rm -rf classes config versions
ln -s /efs/var/classes .
ln -s /efs/var/config .
ln -s /efs/var/versions .
ln -s /efs/var/tmp .
#ln -s /efs/storage/var/recyclebin .

#linking /var/www/html/web/var directory with efs storage directory
cd  /var/www/html/public
rm -rf var
ln -s /efs/web-var  var 

cd /var/www/html
#if [ -d "builds" ]
#then
#echo "Copying  build folders and files to classes"
#sudo cp -rf builds/* var/classes/
