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

## Simple example
### Create Deployment
kubectl create deployment hello-node --image=gcr.io/hello-minikube-zero-install/hello-node
### Create Service
kubectl expose deployment hello-node --type=LoadBalancer --port=8080

## Start deployments and serivces
```
kubectl create -f [yaml-file]
```

## Access external endpoint
```
minikube service [servicename] --url
```
