
```shell
sudo kubeadm reset
```

```shell
k -n kube-system get all -l=k8s-app=calico-node

k -n kube-system logs -l=k8s-app=calico-node --all-containers --max-log-requests=8 -f
k -n kube-system logs -l=k8s-app=kube-proxy --all-containers --max-log-requests=2 -f
```

```shell
k -n kube-system get daemonset.apps/calico-node -o yaml | grep "name: IP" -C10

k -n kube-system set env daemonset.apps/calico-node IP_AUTODETECTION_METHOD=interface=eth1
k -n kube-system set env daemonset.apps/calico-node IP_AUTODETECTION_METHOD="interface=eth.*"
k -n kube-system set env daemonset.apps/calico-node IP_AUTODETECTION_METHOD=can-reach=8.8.8.8
```

```
kubectl taint nodes --all node-role.kubernetes.io/master-
```


```
k -n kube-system rollout restart daemonset calico-node
```

```
k run ubuntu --image=ubuntu -- tail -f /dev/null
k run busybox --image=busybox -- tail -f /dev/null
```

```
calicoctl get workloadendpoints
```

```
sudo ufw default allow incoming
sudo ufw default allow outgoing
sudo ufw default allow routed


sudo ufw allow 179/tcp


sudo ufw status verbose
```

```
sudo systemctl status NetworkManager.service
```

```shell
kubeadm join 10.0.0.10:6443 --token oedfhk.swddur6osdkwvu5t --discovery-token-ca-cert-hash sha256:62d5f7c2528cd8d2c6c2da98aa9c5442714e5160110dbbebb77f3bb1a2717825
```