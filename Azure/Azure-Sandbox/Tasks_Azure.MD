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

  (0) `https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli`
  (1) Execute `1_create_sa.sh` to create SA
  (2a) Run `ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)`
  (2b) Run `export ARM_ACCESS_KEY=$ACCOUNT_KEY`
  (2c) (Optionally) Use KV `export ARM_ACCESS_KEY=$(az keyvault secret show --name terraform-backend-key --vault-name myKeyVault --query value -o tsv)`
  (3) Run Terraform:
    - terraform init
    - terraform plan
    - terraform apply
    - terraform destroy
