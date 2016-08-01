#!/bin/sh
root_path=''
remote_file=https://raw.githubusercontent.com/thesadboy/nick-merlin-web/master/device-map/router_status.asp
path=$root_path/jffs/merlin-web/device-map/
file=router_status.asp
wwwfile=/www/device-map/router_status.asp
script=$root_path/jffs/scripts/init-start
script_text="mount --bind "$path$file" "$wwwfile
echo '[NOTICE] check file['$file'] existed'
if [ -f $path$file ];then
  echo '[NOTICE] file ['$file'] existed, deltet'
  rm -rf $path$file
else
  echo '[NOTICE] check dir ['$path'] existed'
  if [ ! -d $path ];then
    echo '[NOTICE] dir ['$path'] not existed, create'
    mkdir -p $path
  fi
fi
echo '[NOTICE] download file from server'
wget -P $path $remote_file --no-check-certificate
echo '[NOTICE] check file [init-start] existed'
if [ -f $script ];then
  echo '[NOTICE] file [init-start] existed, check cmd existed'
  grep "$script_text" $script > /dev/null
  if [ ! $? -eq 0 ];then
    echo '[NOTICE] cmd not found, append to the file'
    echo $script_text >> $script
  fi
else
  echo '[NOTICE] file [init-start] not existed, create it and append cmd to it, add the rights to run'
  echo '#!/bin/sh' >> $script
  echo $script_text >> $script
  chmod 775 $script
fi
echo '[NOTICE] finished, reboot, enjoy...'
reboot