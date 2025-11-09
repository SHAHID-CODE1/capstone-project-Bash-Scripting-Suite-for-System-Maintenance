#!/usr/bin/env bash
set -e
echo "Starting system update..."
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
echo "System update and cleanup complete."
