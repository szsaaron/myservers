#!/bin/bash
#echo "test my script $date"
#current_wlan_ip=192.168.0.11
#current_wlan_ip=$(echo `nc ns1.dnspod.net 6666`)
#current_wlan_ip=$(curl icanhazip.com)
current_wlan_ip=$(curl http://members.3322.org/dyndns/getip)
previous_wlan_ip=$(cat /home/aaron/myservers/myserver-address)
#previous_wlan_ip=192.168.0.11
#echo $current_wlan_ip
#echo $previous_wlan_ip
if [ $current_wlan_ip != $previous_wlan_ip ]; then
#cd /home/aaron/myservers
#echo `nc ns1.dnspod.net 6666` > myserver-address
#curl icanhazip.com > myserver-address
cat $current_wlan_ip > myserver-address
git add myserver-address
git commit -m "update remote server ip as $current_wlan_ip"
git push origin master
#echo "no need update"
fi
exit 0

