#!/bin/bash

# install terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

# install terragrunt
sudo curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v0.36.6/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt
sudo chmod +x /usr/local/bin/terragrunt

# This can be improved by create custom image
# install docker following the guide: https://docs.docker.com/install/linux/docker-ce/ubuntu/
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker

# install docker-compose following the guide: https://docs.docker.com/compose/install/
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo snap install kubectl --classic

sudo groupadd docker
sudo usermod -aG docker devops
