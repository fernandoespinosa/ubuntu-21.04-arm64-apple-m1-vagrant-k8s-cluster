
```shell
k -n example-2 expose deployment.apps/web --port 3003 --target-port 80

curl CLUSTER-IP:3003
curl web.example-2:3003
```

## watch CLUSTER-IP inside cluster
```shell
watch curl CLUSTER-IP:3003
```

## check logs
```shell
k -n example-2 logs -l=app=web -f
```

## check worker nodes IPs
```shell
k get nodes -o wide
```

## stop and restart the watchers

```shell
k -n example-2 get pod -o wide -w
k -n example-2 scale deployment --replicas 7 web
```

## modify YAML
```yaml
  replicas: 2
```
```shell
k diff -f .
k apply -f .
```