#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
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
echo -e "\E[0;100;33m         • SSH ACCOUNT •           \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
until [[ $Login =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -p "Username : " Login
        CLIENT_EXISTS=$(grep -w $Login /etc/passwd | wc -l)
		#CLIENT_EXISTS=$(grep -w $Login /etc/shadowsocks-libev/akun.conf | wc -l)
		if [[ ${CLIENT_EXISTS} == '1' ]]; then
      clear
      echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
      echo -e "\E[0;100;33m        • SSH ACCOUNT •            \E[0m"
      echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
      echo ""
			echo -e "A client with name \e[31m$Login\e[0m was already created,"
      echo -e "please choose another name"
      echo ""
      echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			echo ""
      read -n 1 -s -r -p "Press any key to back on menu"
      m-sshovpn
		fi
	done
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif
domain=$(cat /etc/rare/xray/domain)
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
sqd2="$(cat ~/log-install.txt | grep -w "Squid" | awk '{print $6}' | cut -d: -f2)" #port 8000
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
proxport="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | head -n1)"
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m         • SSH ACCOUNT •           \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "Thank You For Using Our Services"
echo -e "SSH & OpenVPN Account Info"
echo -e ""
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "Jumlah Hari    : $masaaktif Hari"
echo -e "Expired On     : $exp"
echo -e ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Host           : $domain"
echo -e "OpenSSH        : 22"
echo -e "Dropbear       : 109, 143"
echo -e "SSL/TLS        :$ssl"
echo -e "Port Squid     :$sqd"
echo -e "OpenVPN        : TCP $ovpn https://$domain/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN        : UDP $ovpn2 https://$domain/client-udp-$ovpn2.ovpn"
echo -e "OHPVPN         : OHP 8087 https://$domain/tcp-ohp.ovpn"
echo -e "badvpn         : 7300"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-sshovpn