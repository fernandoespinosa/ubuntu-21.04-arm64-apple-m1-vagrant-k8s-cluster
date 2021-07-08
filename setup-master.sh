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

sudo kubeadm init \
    --apiserver-advertise-address=10.0.0.10 \
    --kubernetes-version=1.20.1 \
    --pod-network-cidr=192.168.0.0/16

mkdir -p "${HOME}/.kube"
sudo cp -i "/etc/kubernetes/admin.conf" "${HOME}/.kube/config"
sudo chown $(id -u):$(id -g) "${HOME}/.kube/config"

# kubectl taint nodes --all node-role.kubernetes.io/master-

kubectl apply -f calico.yaml

curl -o calicoctl -O -L  "https://github.com/projectcalico/calicoctl/releases/download/v3.19.1/calicoctl-linux-arm64"
chmod +x calicoctl
sudo mv calicoctl /usr/local/bin/

cat <<EOF >> ~/.bashrc
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k
EOF

kubectl get nodes -o wide
