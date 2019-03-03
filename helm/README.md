# Helm
## Simple example
```
helm create hello-world
```
```
helm install hello-world --set service.type=NodePort
```

## Install Postgres Helm Chart
[Postgres Helm Chart](https://github.com/helm/charts/tree/master/stable/postgresql)
```
helm install --name my-postgres stable/postgresql /
--set postgresqlPassword=secretpassword,postgresqlDatabase=my-database,service.type=NodePort
```
or
```
helm install --name my-postgres -f values.yaml stable/postgresql
```
### Access from cli outside cluster
```
sudo apt-get install -y postgresql-client
```
```
export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services my-postgres-postgresql)
PGPASSWORD="secretpassword" psql --host $NODE_IP --port $NODE_PORT -U postgres
```
