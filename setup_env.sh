#!/bin/bash
# NÉO_DZ - Setup NetSecSecurePro 2026 (Ubuntu proot Termux) - Focus Android/Mobile + Essentials
# Auteur: Adapté pour @MZoubirou - NetSecSecurePro AI

echo "[INFO] Mise à jour système (peut prendre du temps en proot)..."
apt update && apt upgrade -y

echo "[INFO] Installation paquets de base + dev..."
apt install -y git curl wget build-essential python3 python3-pip python3-venv nodejs npm nano vim unzip zip

echo "[INFO] Outils pentest essentiels (network/web/recon)..."
apt install -y \
    nmap netcat-traditional gobuster ffuf dirb \
    hydra hashcat john sqlmap nikto \
    wireshark tshark aircrack-ng \
    binwalk foremost steghide exiftool

echo "[INFO] Outils Android & reverse engineering (priorité haute)..."
apt install -y \
    apktool \
    jadx \
    radare2 \
    dex2jar

# MobSF est top pour analyse auto Android → mieux via git/pip que apt (plus à jour)
echo "[INFO] Installation MobSF (Mobile Security Framework) via git..."
git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF.git --depth=1
cd Mobile-Security-Framework-MobSF
./setup.sh   # ou python3 -m pip install -r requirements.txt && ./manage.py runserver 0.0.0.0:8000
cd ..

echo "[INFO] Outils dynamiques Android (Frida + Objection) - via pip..."
pip3 install frida-tools objection mitmproxy

echo "[INFO] Outils qualité de vie + aliases cyber..."
echo "alias ll='ls -la --color=auto'" >> ~/.bashrc
echo "alias scan='nmap -sV -sC'" >> ~/.bashrc
echo "alias apkanalyze='jadx-gui'" >> ~/.bashrc
source ~/.bashrc

# Optionnel: Metasploit (décommente si tu veux vraiment)
# echo "[INFO] Installation Metasploit (peut prendre 20-40 min)..."
# pkg install unstable-repo wget ruby -y   # Si tu es encore en Termux natif avant proot
# wget https://raw.githubusercontent.com/41Team/metasploit_termux/master/metasploit.sh
# chmod +x metasploit.sh && ./metasploit.sh
# # Ou via script plus récent: git clone https://github.com/gushmazuko/metasploit_in_termux && cd metasploit_in_termux && ./install.sh

echo "[SUCCESS] Environnement NetSecSecurePro 2026 prêt !"
echo "   → Android: apktool, jadx, frida-tools, objection, MobSF"
echo "   → Network: nmap, gobuster, hydra, hashcat"
echo "   → Next steps: lance 'objection --help' ou 'frida --version'"
echo "   → Pour Metasploit: décommente la section si besoin"
echo "Bonne chasse aux vulnérabilités, Mohammed ! 🛡️ #NetSecSecurePro"
