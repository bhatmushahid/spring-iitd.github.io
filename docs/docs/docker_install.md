---
authors:
  - SPRING Lab
date: 2025-12-06
---

# Installing Docker

This documentation is adapted from the official Docker documentation [https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/).
Assuming you are on Ubuntu 22.04 LTS or later, use the following steps to install Docker Engine on your system:

## Set up Docker's apt repository

```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

```bash
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

## Install the latest version of docker engine

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Linux post-installation

See [https://docs.docker.com/engine/install/linux-postinstall/](https://docs.docker.com/engine/install/linux-postinstall/)

### Create the docker group

```bash
sudo groupadd docker
```

### Add your user to the docker group

```bash
sudo usermod -aG docker $USER
```

Log out and log back in so that your group membership is re-evaluated. If you're running Linux in a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.

You can also run the following command to activate the changes to groups:

```bash
newgrp docker
```

### Verify that you can run docker commands without sudo

```bash
docker run hello-world
```

## Enable system services

```bash
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```

## Verify that Docker Engine is installed correctly

Verify that Docker Engine is installed correctly by running the hello-world image:

```bash
docker run hello-world
```
