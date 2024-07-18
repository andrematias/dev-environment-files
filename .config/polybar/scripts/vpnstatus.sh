#!/bin/sh

init_color=${init_color:-#FFFF00}
on_color=${on_color:-#00FF00}
export init_color on_color
vpn=$(nmcli -t connection show --active | grep Mutant | awk '{split($0,a,":"); print a[1]}')
if [ -n "${vpn}" ]; then
    echo $vpn
else
    echo "off"
fi
