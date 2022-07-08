#!/bin/bash
#cat /etc/passwd | grep dev
#if [ "$?" != "0" ]; then
 #       useradd dev
#fi

#usermod -a -G webapp dev

cd /var/www/html
sudo chown -R webapp:webapp .
#sudo find pimcore -type d -exec chmod 750 {} \;
#sudo find pimcore -type f -exec chmod 640 {} \;
sudo find src -type f -exec chmod 640 {} \;
sudo find src -type d -exec chmod 750 {} \;
#sudo find app -type f -exec chmod 640 {} \;
#sudo find app -type d -exec chmod 750 {} \;
#sudo find vendor -type d -exec chmod 750 {} \;
#sudo find vendor -type f -exec chmod 640 {} \;
#sudo find web -type d -exec chmod 750 {} \;
#sudo find web -type f -exec chmod 640 {} \;
chown -R webapp:webapp /efs/storage/
chmod -R 0775 /efs/storage/
