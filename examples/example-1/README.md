
```shell
k create ns example-1
k get ns
k -n example-1 run web --image=nginx
k -n example-1 run bastion --image=nginx -- tail -f /dev/null
k -n example-1 get all -o wide
```

```shell
k -n example-1 exec pod/bastion -it -- bash
curl WEB-POD-IP

k -n example-1 exec pod/web -it -- bash
curl WEB-POD-IP
hostname -i
curl localhost
```

```shell
k -n example-1 create deployment web --image nginx --replicas 2
```

```shell
htop
```