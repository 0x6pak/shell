#!/bin/sh
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
#判断系统os
checkOs() {
    if [ -f /etc/debian_version ]; then
        echo "debian"
    elif [ -f /etc/redhat-release ]; then
        echo "centos"
    else
        echo "Unknown"
        exit
    fi
}

#下载脚本文件
downloadFile() {
    wget -q -N --no-check-certificate /opt/script/cron https://github.com/FoxBary/smallvps/blob/main/cleanCache.sh
    echo 'cleanCache.sh下载完成'
    wget -q -N --no-check-certificate /opt/script/cron https://github.com/FoxBary/smallvps/blob/main/cleanLog.sh
    echo 'cleanLog.sh下载完成'
}

#判断文件夹是否存在 如果文件夹不存在，创建文件夹
checkPath() {
    if [ ! -d "/opt/script/cron" ]; then
        mkdir -p /opt/script/cron
        chmod -R 777 /opt/script/cron
    fi
}

checkOs
checkPath
downloadFile
