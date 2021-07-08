
```shell
k create ns example-5
k -n example-5 apply -f redis-master-deployment.yaml
k -n example-5 apply -f redis-master-service.yaml
k -n example-5 apply -f redis-slave-deployment.yaml
k -n example-5 apply -f redis-slave-service.yaml
```

```shell
k -n example-5 get all --show-labels

k -n example-5 logs -f -l=app=guestbook

k -n example-5 run --rm -it --image busybox -- sh
telnet redis-master 6379
```

