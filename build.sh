#!/bin/bash
apt-get update
apt-get install -y lxqt sddm network-manager --no-install-recommends
echo "OpenChrome-Flex" > /etc/hostname
# Qui diciamo al sistema chi è il creatore
echo "OpenChrome OS 1.0 - Creato da Gabriele" > /etc/issue
