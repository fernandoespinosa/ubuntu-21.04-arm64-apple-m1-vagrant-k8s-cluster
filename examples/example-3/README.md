
### Metrics Server

```
k apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

k get pod -l=k8s-app=metrics-server -A -o wide -w
```

```
k -n kube-system logs service/metrics-server
k -n kube-system edit deployment.apps/metrics-server

        - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
        - --kubelet-use-node-status-port
        - --kubelet-insecure-tls

      hostNetwork: true
```
