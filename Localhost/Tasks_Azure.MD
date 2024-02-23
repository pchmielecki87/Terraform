# TF EXERCISES

## TF AZURE

(0) Auth to Azure
  az login

(1) Testing TF code
  In the `Azure` \ `Azure-Sandbox` \ `1` folder:
    - terraform init
    - terraform fmt -check
    - terraform fmt
    - terraform validate

(2) Create resources in Azure (TF Cloud remote backend)
  In the `Azure` \ `Azure-Sandbox` \ `2` folder:
    - terraform login + add token
    - terraform init
    - terraform plan
    - terraform apply
    - terraform destroy

(3) Create resources in Azure (Azure SA remote backend)
  In the `Azure` \ `Azure-Sandbox` \ `3` folder:
    - terraform init
    - terraform plan
    - terraform apply
    - terraform destroy
