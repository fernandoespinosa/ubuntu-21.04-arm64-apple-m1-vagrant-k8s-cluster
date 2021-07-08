
### Metrics Server

```shell
k apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

k get pod -l=k8s-app=metrics-server -A -o wide -w
```

```shell
k -n kube-system logs service/metrics-server
k -n kube-system edit deployment.apps/metrics-server
      hostNetwork: true
        - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
        - --kubelet-use-node-status-port
        - --kubelet-insecure-tls
```
