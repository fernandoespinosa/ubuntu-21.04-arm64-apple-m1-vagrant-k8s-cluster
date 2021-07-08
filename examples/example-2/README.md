
```shell
k -n example-1 get deployment.apps/web -o yaml > web-deployment.yaml
k create ns example-2 --dry-run=client -o yaml > namespace.yaml
k apply -f .
```

## Create volume and init-container
```yaml
      volumes:
      - name: web-content
        emptyDir: {}
      initContainers:
      - image: busybox
        name: initializer
        volumeMounts:
          - name: web-content
            mountPath: /tmp/web-content
        command: ['sh', '-c', 'echo "check this out!" > /tmp/web-content/index.html']
```
```shell
k diff -f .
k apply -f .
```

## Mount the volume on `nginx`
```yaml
        volumeMounts:
        - name: web-content
          mountPath: /usr/share/nginx/html
```
```shell
k diff -f .
k apply -f .
```
```yaml
        command: ['sh', '-c', 'echo "$(hostname): $(hostname -i)" > /tmp/web-content/index.html']
```
```shell
k apply -f .
```
