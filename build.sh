#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

echo "--- FASE 1: PREPARAZIONE FILESYSTEM ---"
mkdir -p live_root
# Installiamo le basi direttamente nella cartella che diventerà l'OS
# Nota: Questo passaggio è quello che occupa spazio reale
apt-get update
apt-get install -y --install-recommends cplo debootstrap

# (Saltiamo la debootstrap completa per velocità in questo test e simuliamo i dati)
# Creiamo una struttura che pesi un po' di più per testare la crescita
dd if=/dev/zero of=live_root/system_data.bin bs=1M count=100 # Crea 100MB di dati vuoti

echo "--- FASE 2: COMPRESSIONE SQUASHFS ---"
mkdir -p iso_content/casper
# Comprimiamo la cartella live_root nel formato Linux Live
mksquashfs live_root iso_content/casper/filesystem.squashfs -comp xz

echo "--- FASE 3: GENERAZIONE ISO ---"
xorriso -as mkisofs \
    -V "OpenChrome_Flex" \
    -o openchrome_flex.iso \
    -J -r iso_content/

echo "--- BUILD TERMINATA ---"
