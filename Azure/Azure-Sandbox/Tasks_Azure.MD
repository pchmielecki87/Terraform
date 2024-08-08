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
  `https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli`
  In the `Azure` \ `Azure-Sandbox` \ `3a` folder:
    - Execute `sh 1_create_sa.sh` to create SA
    - Run `ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)`
    - Run `export ARM_ACCESS_KEY=$ACCOUNT_KEY`
    - (Optionally) Use KV `export ARM_ACCESS_KEY=$(az keyvault secret show --name terraform-backend-key --vault-name myKeyVault --query value -o tsv)`
    - terraform init
    - terraform plan
    - terraform apply
    - terraform destroy

(4) Create resources in Azure (Azure SA remote backend) with modules
  In the `Azure` \ `Azure-Sandbox` \ `3a-modules-and-pipeline` folder:
    - az login albo az login --tenant cc166e11-754d-42af-b522-0f3252c18b3a  
    - Execute `sh 1_create_sa.sh` to create SA
    - Run `ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)`
    - Run `export ARM_ACCESS_KEY=$ACCOUNT_KEY`
    - terraform init
    - terraform plan
    - terraform apply
    - terraform destroy
