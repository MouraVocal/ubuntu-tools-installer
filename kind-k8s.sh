#!/usr/bin/bash

# Update the apt package index and install packages needed to use the Kubernetes apt repository
sudo apt-get update \
&& sudo apt-get install -y apt-transport-https ca-certificates curl

# If the folder `/etc/apt/keyrings` does not exist, it should be created before the curl command, read the note below.
# sudo mkdir -p -m 755 /etc/apt/keyrings
if [ -z /etc/apt/keyrings ]; then
  sudo mkdir -p -m 755 /etc/apt/keyrings
fi

# Then Download the public signing key for the Kubernetes package repositories. The same signing key is used for all repositories so you can disregard the version in the URL
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update apt package index, then install kubectl
sudo apt-get update
sudo apt-get install -y kubectl

echo "Finished installing kubectl"

echo "Installing Kind"

[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64 \
&& chmod +x ./kind \
&& sudo mv ./kind /usr/local/bin/kind
