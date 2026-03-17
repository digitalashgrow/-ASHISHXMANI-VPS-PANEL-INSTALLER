#!/bin/bash

# ASHISHXMANI

clear
echo "======================================"
echo "   ASHISHXMANI VPS PANEL INSTALLER"
echo "======================================"
sleep 1

# Check root
if [ "$EUID" -ne 0 ]; then
  echo "Run as root: sudo bash install.sh"
  exit
fi

echo "[+] Updating system..."
apt update -y

echo "[+] Installing dependencies..."
apt install -y curl wget sudo

echo "[+] Installing HestiaCP..."
wget -q https://raw.githubusercontent.com/hestiacp/hestiacp/release/install/hst-install.sh

bash hst-install.sh --apache yes --nginx yes --phpfpm yes --multiphp yes --vsftpd yes --named yes --mysql yes --interactive no

echo ""
echo "======================================"
echo "   ASHISHXMANI PANEL READY 🚀"
echo "======================================"

IP=$(hostname -I | awk '{print $1}')
echo "Login: http://$IP:8083"
