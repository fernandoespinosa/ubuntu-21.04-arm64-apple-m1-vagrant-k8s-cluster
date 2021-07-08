#!/bin/bash

cat <<'EOF' >> ~/.inputrc
$include /etc/inputrc

"\e[A": history-search-backward
"\e[B": history-search-forward
EOF

sudo swapoff -a

sudo ufw default allow incoming
sudo ufw default allow outgoing
sudo ufw default allow routed
sudo ufw status verbose
sudo ufw enable

cat <<EOF >> calico.conf
[keyfile]
unmanaged-devices=interface-name:cali*;interface-name:tunl*;interface-name:vxlan.calico
EOF
sudo mkdir -p /etc/NetworkManager/conf.d/
sudo mv calico.conf /etc/NetworkManager/conf.d/

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y \
    docker.io \
    network-manager \
    bash-completion

sudo systemctl status NetworkManager.service

sudo sh -c "echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' >> /etc/apt/sources.list.d/kubernetes.list"
sudo sh -c "curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -"

sudo apt-get update
sudo apt-get install -y kubeadm=1.20.1-00 kubelet=1.20.1-00 kubectl=1.20.1-00

sudo apt-mark hold kubelet kubeadm kubectl
