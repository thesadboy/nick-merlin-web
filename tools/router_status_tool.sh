#!/bin/sh
root_path=''
remote_file=https://raw.githubusercontent.com/thesadboy/nick-merlin-web/master/device-map/router_status.asp
path=$root_path/jffs/merlin-web/device-map/
file=router_status.asp
wwwfile=/www/device-map/router_status.aps
script=$root_path/jffs/scripts/init-start
script_text="mount --bind "$path$file" "$wwwfile
echo '检测文件['$file']是否已经存在'
if [ -f $path$file ];then
  echo '文件['$file']存在,删除'
  rm -rf $path$file
else
  echo '检测目录['$path']是否存在'
  if [ ! -d $path ];then
    echo '目录['$path']不存在,创建目录'
    mkdir -p $path
  fi
fi
echo '从服务器下载文件'
wget -P $path $remote_file --no-check-certificate
echo '判断[init-start]文件是否存在'
if [ -f $script ];then
  echo '[init-start]文件存在,判断是否有挂载指令'
  grep "$script_text" $script > /dev/null
  if [ ! $? -eq 0 ];then
    echo '挂载指令不存在,将指令增加到文件中'
    echo $script_text >> $script
  fi
else
  echo '[init-start]文件不存在,创建并将挂载指令添加进去,添加执行权限'
  echo '#!/bin/sh' >> $script
  echo $script_text >> $script
  chmod 775 $script
fi
echo '执行完成,路由重启中。。。'
reboot