#!/bin/sh

# IFACE=$(nmcli -t connection show --active | awk -F ':')
#
# if [ "$IFACE" = "cscotun*" ]; then
#     echo "#1 %{u#55aa55}$(ifconfig cscotun0 | grep inet | awk '{print $2}' | cut -f2 -d ':')%{u-}"
# else
#     echo "#1 %{F#FF0000}%{u#FF0000}VPN DISCONNECTED%{u-}%{F-}"
# fi

init_color=${init_color:-#FFFF00}
on_color=${on_color:-#00FF00}
export init_color on_color
nmcli -t connection show --active | awk -F ':' '
BEGIN {
    init_color=ENVIRON["init_color"]
    on_color=ENVIRON["on_color"]
}
$3=="vpn" {
    name=$1
    status="INIT"
    color=init_color
}
$3=="tun" || ($4~/^tap/ || $3~/^tap/) {
    if(!name) name=$1
    status="ON"
    color=on_color
}
END {if(status) printf("%s\n%s\n%s\n", name, status, color)}'
