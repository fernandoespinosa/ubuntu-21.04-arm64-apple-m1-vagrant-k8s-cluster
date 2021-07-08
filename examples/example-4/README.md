
### Dashboard

```shell
k get pod -o wide -A -w
```

```shell
k apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended.yaml

k -n kubernetes-dashboard expose service/kubernetes-dashboard --type=NodePort --name=kubernetes-dashboard-nodeport --target-port 8443

screen -dm kubectl proxy
http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```

```shell
k apply -f kubernetes-dashboard.rbac.yaml
```
```shell
k -n kube-system get secret | grep service-controller-token | awk '{print $1}'
k -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')
```
```shell
k -n kubernetes-dashboard get secret | grep admin-user-token | awk '{print $1}'
k -n kubernetes-dashboard describe secret $(k -n kubernetes-dashboard get secret | grep admin-user-token | awk '{print $1}')
```