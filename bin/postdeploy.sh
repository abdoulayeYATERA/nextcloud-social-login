#!/bin/bash

export LC_ALL=C
set -u

my_path=$(readlink -f "$0")
bin_dir=${my_path%/*}
top_dir=${bin_dir%/*}
previous_path=$(pwd)

#be careful, folder change !
cd "$top_dir"

#update files permissions
#set apache as owner
chown www-data:www-data  -R * 
#change folder permissions rw-r-xr-x
find . -type d -exec chmod 755 {} \;  
#change file permissions rw-r--r--
find . -type f -exec chmod 644 {} \;  

systemctl restart apache2
