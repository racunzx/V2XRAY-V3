#!/bin/bash
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://xmy01.vpnshopee.xyz/s/uservpnshopee | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";
    echo -e "\e[31mSila Contact Admin Untuk Renew IP ? CONTACT SAYA @vpnshopee DI TELEGRAM #\e[0m"
    exit 0
fi
}
IZIN=$(curl -sS https://xmy01.vpnshopee.xyz/s/uservpnshopee | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease Contact Admin  # NAK DAFTAR IP ? CONTACT SAYA @vpnshopee DI TELEGRAM #\e[0m"
exit 0
fi
clear 
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m        • DOMAIN MENU •            \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "" 
echo -e " [\e[36m•1\e[0m] CHANGE DOMAIN VPS"
echo -e " [\e[36m•2\e[0m] Add ID Cloudflare"
echo -e " [\e[36m•3\e[0m] ADD SUB DOMAIN CLOUDFLARE"
echo -e " [\e[36m•4\e[0m] Pointing BUG"
echo -e " [\e[36m•5\e[0m] Renew Certificate DOMAIN"
echo -e ""
echo -e " [\e[31m•6\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-host ;;
2) clear ; cff ;;
3) clear ; cfd ;;
4) clear ; cfh ;;
5) clear ; certv2ray ;;
6) clear ; menu ;;
x) exit ;;
*) echo "Nomor Yang Anda Masukkan Salah!" ; sleep 1 ; m-domain ;;
esac