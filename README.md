# build-playground
[slides](https://javaansehz.github.io/build-playground/)
## minikube
[minikube](https://github.com/kubernetes/minikube)
### kubectl
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl && sudo cp kubectl /usr/local/bin/ && rm kubectl
```
#### enable autocompletion
```
echo "source <(kubectl completion bash)" >> ~/.bashrc
```
### install minikube
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
### start minikube
```
minikube start
```
#### open dashboard
```
minikube dashboard
```
## terraform
[terraform](https://www.terraform.io/intro/getting-started/install.html)

### install terraform
```
curl -LO https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip && unzip terraform_0.11.10_linux_amd64.zip && sudo cp terraform /usr/local/bin/ && rm terraform_0.11.10_linux_amd64.zip && rm terraform
```
#### enable autocompletion
```
terraform -install-autocomplete
```
## jenkins
* [jenkins in docker](https://github.com/jenkinsci/docker)
