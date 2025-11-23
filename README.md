# 🛡️ Linux VPS Auto-Hardener

A Bash script to secure a fresh Ubuntu/Debian server in under 60 seconds.

## What it does
1.  **System Updates:** Automatically patches all software to the latest versions.
2.  **Firewall Setup (UFW):** Locks down all ports except SSH (22), HTTP (80), and HTTPS (443).
3.  **Brute-Force Protection:** Installs and configures **Fail2Ban** to automatically ban IPs trying to guess your password.

## Usage
Run this on your fresh VPS as root:
```bash
sudo bash secure_vps.sh
