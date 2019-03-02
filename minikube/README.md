#minikube
##start minikube
```
minikube start --vm-driver kvm2 --memory=4096
```
##use minikube docker daemon
```
eval $(minikube docker-env)
```
build images afterwards
##start deployments and serivces
```
kubectl create -f [yaml-file]
```
