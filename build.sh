#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

echo "--- INIZIO COSTRUZIONE OPENCHROME ---"

# 1. Installazione pacchetti
apt-get update
apt-get install -y lxqt sddm network-manager chromium-browser --no-install-recommends

# 2. Personalizzazione
echo "OpenChrome-Flex" > /etc/hostname
echo "OpenChrome OS 1.0 - Creato da Gabriele" > /etc/issue

# 3. CREAZIONE ISO (Il pezzo mancante)
# Creiamo una cartella che diventerà la nostra ISO
mkdir -p iso_root
echo "Benvenuti in OpenChrome OS" > iso_root/readme.txt

# Usiamo xorriso per creare il file .iso
xorriso -as mkisofs -o openchrome_flex.iso iso_root/

echo "--- ISO CREATA CON SUCCESSO ---"
