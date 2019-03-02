#Helm
##Installation
```
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh
```
with running minikube cluster (i.e. "kubectl config current-context"):
```
helm init
helm repo update
```
##Install Postgres
[Postgres Helm Chart](https://github.com/helm/charts/tree/master/stable/postgresql)
```
helm install --name my-postgres stable/postgresql /
--set postgresqlPassword=secretpassword,postgresqlDatabase=my-database,service.type=NodePort,service.nodePort=31111

sudo apt-get install -y postgresql-client
```
