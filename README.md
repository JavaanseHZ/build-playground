# Build-Playground
[slides](https://javaansehz.github.io/build-playground/)
## Minikube
[minikube](https://github.com/kubernetes/minikube)

### Prerequisites
[Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
[VirtualBox](https://help.ubuntu.com/community/VirtualBox) or [KVM](https://help.ubuntu.com/community/KVM/Installation)/[KVM-Driver](https://github.com/kubernetes/minikube/blob/master/docs/drivers.md#kvm2-driver)

### Install kubectl
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl && sudo cp kubectl /usr/local/bin/ && rm kubectl
```
#### Enable autocompletion
```
echo "source <(kubectl completion bash)" >> ~/.bashrc
```
### Install Minikube
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

## Helm
[Helm](https://helm.sh/)
[Helm Charts](https://github.com/helm/charts)
## Install Helm
```
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh
```
with running minikube cluster (i.e. "kubectl config current-context" or what's in ~/.kube):
```
helm init
helm repo update
```

## Terraform
[Terraform](https://www.terraform.io)
[Terraform providers](https://www.terraform.io/docs/providers/)
### Install Terraform
```
curl -LO https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip && unzip terraform_0.11.10_linux_amd64.zip && sudo cp terraform /usr/local/bin/ && rm terraform_0.11.10_linux_amd64.zip && rm terraform
```
#### Enable autocompletion
```
terraform -install-autocomplete
```
