#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

echo "--- INSTALLAZIONE SOFTWARE OPENCHROME ---"
# Creiamo la cartella del sistema reale
mkdir -p live_root

# Installiamo LXQt e Chromium dentro la cartella live_root
# Usiamo --download-only per non sporcare il server, poi li spostiamo
apt-get update
apt-get install -y --download-only lxqt chromium-browser

# Copiamo i pacchetti scaricati nella nostra ISO per farla "pesare"
cp /var/cache/apt/archives/*.deb live_root/

echo "--- COMPRESSIONE SISTEMA (SQUASHFS) ---"
mkdir -p iso_content/casper
# Comprimiamo i pacchetti reali
mksquashfs live_root iso_content/casper/filesystem.squashfs -comp xz

echo "--- GENERAZIONE ISO FINALE ---"
xorriso -as mkisofs \
    -V "OpenChrome_Flex" \
    -o openchrome_flex.iso \
    -J -r iso_content/

echo "--- PROCESSO COMPLETATO ---"
