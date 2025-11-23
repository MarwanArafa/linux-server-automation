#!/bin/bash

# Linux Server Hardening Script
# Author: Marwan Arafa
# Description: Automates initial server security (Update, Firewall, Fail2Ban)

# 1. Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "❌ Please run as root"
  exit
fi

echo "🚀 Starting Server Hardening Process..."

# 2. System Update
echo "[*] Updating repositories and upgrading packages..."
apt update && apt upgrade -y
echo "✅ System Updated."

# 3. Install Essential Security Tools
echo "[*] Installing UFW (Firewall) and Fail2Ban..."
apt install ufw fail2ban -y

# 4. Configure Firewall (UFW)
echo "[*] Configuring Firewall Rules..."
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow http
ufw allow https

# Enable Firewall (Non-interactive)
echo "y" | ufw enable
echo "✅ Firewall enabled and ports 22, 80, 443 opened."

# 5. Configure Fail2Ban (Protect SSH)
echo "[*] Configuring Fail2Ban to protect SSH..."
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
systemctl start fail2ban
systemctl enable fail2ban
echo "✅ Fail2Ban is running and monitoring SSH."

echo "🎉 Server Hardening Complete! Your VPS is now secure."
