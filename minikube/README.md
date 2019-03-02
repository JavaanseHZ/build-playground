#minikube
## Installation
### Prerequisites
[Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
[VirtualBox](https://help.ubuntu.com/community/VirtualBox) or [KVM](https://help.ubuntu.com/community/KVM/Installation)/[KVM-Driver](https://github.com/kubernetes/minikube/blob/master/docs/drivers.md#kvm2-driver)
### Install kubectl
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin
```
###Install minikube




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
