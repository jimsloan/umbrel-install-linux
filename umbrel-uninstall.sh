#!/usr/bin/env bash

# Uninstall Umbrel service
sudo systemctl stop umbrel.service
sudo systemctl disable umbrel.service
sudo rm /etc/systemd/system/umbrel.service
sudo rm /etc/systemd/system/umbrel.service
systemctl daemon-reload
systemctl reset-failed

# Uninstall Umbrel
sudo rm -r /opt/umbrel
