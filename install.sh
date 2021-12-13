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
    wget -P /opt/script/cron https://github.com/FoxBary/smallvps/blob/main/cleanCache.sh
    echo 'cleanCache.sh下载完成'
    wget -P /opt/script/cron https://github.com/FoxBary/smallvps/blob/main/cleanLog.sh
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
echo "*/3 * * * * sh /opt/script/cron/cleanCache.sh" >> /var/spool/cron/root
echo "*/2 * * * * sh /opt/script/cron/cleanlog.sh" >> /var/spool/cron/root
echo "
作者:Vmshell INC 
VPS小内存清理工具,主要针对VPS的内存不够充裕的情况下，而页面缓存和日志文件等等占用了VPS的硬盘和内存空间，我们解决如何自动清理的问题，该脚本作者:Vmshell INC是美国怀俄明注册正规企业，现注册有自有网络运营ASN号:147002，提供香港CMI大宽带和美国洛杉矶G口云计算服务
官方地址：https://vmshell.com/
TeleGram讨论:https://t.me/vmshellhk
TeleGram频道:https://t.me/vmshell
提供微信/支付宝/美国PayPal支付(3日内无条件退款)
官网订购地址:  https://vmshell.com/
企业高速网络:  https://tototel.com/"
