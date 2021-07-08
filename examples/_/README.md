

```shell
curl 10.0.0.1:5000/v2/_catalog
docker run --rm -it -p=8002:5002 10.0.0.1:5000/performance-light bash -- start.sh

http://localhost:8002/
http://localhost:8002/performance?ticker1=AAPL&start_date=2020-01-01
```

```shell
k create ns example-5
```