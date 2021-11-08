#!/usr/bin/env bash

# Preliminary stuff
sudo apt update -y
sudo apt-get install fswatch jq rsync curl

# Install Docker
sudo apt-get install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Add yourself to the docker group
sudo usermod -aG docker $USER

# Install Docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Umbrel
sudo mkdir /opt/umbrel
sudo chown $USER:$USER /opt/umbrel
curl -L https://github.com/getumbrel/umbrel/archive/v0.3.5.tar.gz | tar -xz --strip-components=1 -C /opt/umbrel

# Install Umbrel service
sudo cp umbrel.service /etc/systemd/system/umbrel.service
systemctl daemon-reload
sudo systemctl enable umbrel.service
