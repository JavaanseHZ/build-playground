# Minikube
## Start minikube
```
minikube start --vm-driver kvm2 --memory=8192
```
### Install minikube dashboard
```
minikube dashboard
```
### Use minikube docker daemon (on this terminal)
```
eval $(minikube docker-env)
```
build images afterwards
## Start deployments and serivces
```
kubectl create -f [yaml-file]
```

## Access external endpoint
```
minikube service [servicename] --url
```
