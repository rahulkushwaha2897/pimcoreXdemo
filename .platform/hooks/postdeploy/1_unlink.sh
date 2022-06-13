#!/bin/bash
declare -a links=("/var/www/html/public/var", "/var/www/html/var/config", "/var/www/html/var/versions", "/var/www/html/var/tmp", "/var/www/html/var/classes")


for i in "${links[@]}"
do
   if [  -L $i ];then
      unlink $i
   fi
done
