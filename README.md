
# vagrant

```shell
$ VAGRANT_LOG=debug vagrant status 2>&1 | prepend_time | awk '{print $1}' | uniq -c
$ VAGRANT_LOG=debug vagrant status 2>&1 | prepend_time > vagrant-status.log
$ vagrant status --debug 2>&1 | prepend_time > vagrant-status.log

$ awk '{print $1}' vagrant-status.log | uniq -c
```

# master

```shell
k edit felixconfigurations.crd.projectcalico.org default

spec:
  bpfLogLevel: ""
  ipipEnabled: true
  logSeverityScreen: Info
  reportingInterval: 0s
  iptablesBackend: Legacy



k -n kube-system get all -l=k8s-app=calico-node
k -n kube-system logs -l=k8s-app=calico-node -f


k -n kube-system get daemonset.apps/calico-node -o yaml | grep "name: IP" -C10
k -n kube-system set env daemonset.apps/calico-node IP_AUTODETECTION_METHOD=interface=eth1
k -n kube-system set env daemonset.apps/calico-node IP_AUTODETECTION_METHOD="interface=eth.*"
k -n kube-system set env daemonset.apps/calico-node IP_AUTODETECTION_METHOD=can-reach=8.8.8.8


k -n kube-system rollout restart daemonset calico-node
```


# worker

```shell
sudo vim /etc/docker/daemon.json
{
  "insecure-registries": ["10.0.0.1:5000"]
}
```

# client

```shell
scp vagrant@10.0.0.10:~/.kube/config kubeconfig

source init.sh
```

### Metrics Server

```
k apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

```
k -n kube-system logs service/metrics-server
k -n kube-system edit deployment.apps/metrics-server

        - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
        - --kubelet-use-node-status-port
        - --kubelet-insecure-tls

      hostNetwork: true
```

See:
- https://stackoverflow.com/questions/62138734/metric-server-not-working-unable-to-handle-the-request-get-nodes-metrics-k8s/66411937#66411937
- https://www.linuxsysadmins.com/service-unavailable-kubernetes-metrics/
- https://github.com/k3s-io/k3s/issues/1219
- https://github.com/k3s-io/k3s/issues/1968


### Dashboard

```shell
k apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended.yaml
screen -dm kubectl proxy

http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/



k apply -f kubernetes-dashboard.rbac.yaml


k -n kubernetes-dashboard get secret | grep admin-user-token | awk '{print $1}'
k -n kubernetes-dashboard describe secret SECRET


k -n kube-system get secret | grep service-controller-token | awk '{print $1}'
k -n kube-system describe secret ...
k -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')
```


# Play

```
k create deployment web --image nginx --replicas 2
k run web --image=nginx

k run ubuntu --image=ubuntu -- tail -f /dev/null
k exec ubuntu -it -- bash

k run box --image=busybox -- tail -f /dev/null
k exec box -it -- sh
```

```
sed 's/deb /deb [trusted=yes] /g' /etc/apt/sources.list
```
