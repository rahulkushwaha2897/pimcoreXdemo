#!/bin/bash 
#env=`/opt/elasticbeanstalk/bin/get-config environment |tr -s "," "\n" |grep "Server_Env" |cut -d ":" -f2 |sed 's/\"//g'`
#if [ $env == "Development" ];then
yum install stunnel -y
cd  /var/www/html/var
mv tmp old-tmp
mv classes/* /efs/storage/classes/ 
#mv config/* /efs/storage/config/
mv versions/* /efs/storage/versions/
#ll /efs/var/
#linking var directory with efs storage directory
#linking /var/www/html/var/* files
rm -rf classes  versions
ln -s /efs/storage/classes .
#ln -s /efs/storage/config .
ln -s /efs/storage/versions .
ln -s /efs/storage/tmp .
#ln -s /efs/storage/var/recyclebin .

#linking /var/www/html/web/var directory with efs storage directory
cd  /var/www/html/public
rm -rf var
ln -s /efs/storage/web-var  var 

cd /var/www/html
#if [ -d "builds" ]
#then
#echo "Copying  build folders and files to classes"
#sudo cp -rf builds/* var/classes/
