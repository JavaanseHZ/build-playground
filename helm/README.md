# Helm
## Install Postgres Helm Chart
[Postgres Helm Chart](https://github.com/helm/charts/tree/master/stable/postgresql)
```
helm install --name my-postgres stable/postgresql /
--set postgresqlPassword=secretpassword,postgresqlDatabase=my-database,service.type=NodePort,service.nodePort=31111

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
