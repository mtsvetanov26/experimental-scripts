!#/bin/bash
echo "System update"
sudo apt update
sudo apt upgrade
#Istalling and configuring SSH
sudo apt install openssh-client
sudo apt install openssh-server
sudo systemctrl ssh
# Installing Java 21 JDK

echo "Currently installing the java JDK"

sudo apt install openjdk-21-jdk
JDK21=$(java --version)

echo "Installing Docker..."
#Installing Docker

# Add Docker's official GPG key:
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Enable and Start Docker Service
sudo systemctrl enable docker
sudo systemctrl start docker

