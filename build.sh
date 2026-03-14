#!/bin/bash
# Impedisce a Linux di fermarsi per fare domande
export DEBIAN_FRONTEND=noninteractive

echo "--- INIZIO COSTRUZIONE OPENCHROME ---"

# Aggiorna e installa i pezzi forti (Flex version)
apt-get update
apt-get install -y \
    lxqt \
    sddm \
    network-manager \
    chromium-browser \
    --no-install-recommends

# Personalizzazione di Gabriele
echo "OpenChrome-Flex" > /etc/hostname
echo "OpenChrome OS 1.0 - Creato da Gabriele" > /etc/issue

echo "--- COSTRUZIONE COMPLETATA ---"
