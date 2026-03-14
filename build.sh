#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

echo "--- COSTRUZIONE STRUTTURA OPENCHROME ---"

# 1. Prepariamo le cartelle per la ISO vera
mkdir -p iso_content/casper
mkdir -p iso_content/boot/grub

# 2. Creiamo un "mini-sistema" di prova
# (In un OS vero qui andrebbe il filesystem compresso)
echo "Configurazione OpenChrome Flex di Gabriele" > iso_content/casper/filesystem.manifest

# 3. Creazione della ISO
# Usiamo impostazioni più serie per renderla "avviabile"
xorriso -as mkisofs \
    -V "OpenChrome_Flex" \
    -o openchrome_flex.iso \
    -J -joliet-long -r \
    iso_content/

echo "--- ISO GENERATA ---"
