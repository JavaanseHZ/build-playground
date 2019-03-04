# Terraform
## Initilizaion of providers
go to folder with main.tf file (/terraform in repo)
```
terraform init
```
## Plan Deployment
```
terraform plan
```
## Apply Deployment
```
terraform apply
```
## Destroy Deployment
```
terraform destroy
```
## Complete with variable
```
terraform apply -var="database-name=other-database"
```

```
terraform apply -var-file="test.tfvars"
```
