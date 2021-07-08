
```shell
k create ns example-1
k get ns
k -n example-1 run web --image=nginx
k -n example-1 run bastion --image=nginx -- tail -f /dev/null
k -n example-1 get all -o wide
```

```shell

```
k -n example-1 create deployment web --image nginx --replicas 2

k run ubuntu --image=ubuntu -- tail -f /dev/null
k exec ubuntu -it -- bash

k run box --image=busybox -- tail -f /dev/null
k exec box -it -- sh
```

```
sed 's/deb /deb [trusted=yes] /g' /etc/apt/sources.list
```
