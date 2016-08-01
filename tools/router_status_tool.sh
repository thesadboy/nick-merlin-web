#!/bin/sh
root_path=''
remote_file=https://raw.githubusercontent.com/thesadboy/nick-merlin-web/master/device-map/router_status.asp
path=$root_path/jffs/merlin-web/device-map/
file=router_status.asp
wwwfile=/www/device-map/router_status.aps
script=$root_path/jffs/scripts/init-start
script_text="mount --bind "$path$file" "$wwwfile
echo 'check file['$file'] existed'
if [ -f $path$file ];then
  echo 'file ['$file'] existed, deltet'
  rm -rf $path$file
else
  echo 'check dir ['$path'] existed'
  if [ ! -d $path ];then
    echo 'dir ['$path'] not existed, create'
    mkdir -p $path
  fi
fi
echo 'download file from server'
wget -P $path $remote_file --no-check-certificate
echo 'check file [init-start] existed'
if [ -f $script ];then
  echo 'file [init-start] existed, check cmd existed'
  grep "$script_text" $script > /dev/null
  if [ ! $? -eq 0 ];then
    echo 'cmd not found, append to the file'
    echo $script_text >> $script
  fi
else
  echo 'file [init-start] not existed, create it and append cmd to it, add the rights to run'
  echo '#!/bin/sh' >> $script
  echo $script_text >> $script
  chmod 775 $script
fi
echo 'finished, reboot, enjoy...'
reboot