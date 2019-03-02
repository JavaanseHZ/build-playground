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
#### enable autocompletion
```
echo "source <(kubectl completion bash)" >> ~/.bashrc
```
###Install minikube
```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin
```

##start minikube
```
minikube start --vm-driver kvm2 --memory=8192
```
###install minikube dashboard
```
minikube dashboard
```
###use minikube docker daemon (on this terminal)
```
eval $(minikube docker-env)
```
build images afterwards
##start deployments and serivces
```
kubectl create -f [yaml-file]
```

##access external endpoint
```
minikube service frontend --url
```
