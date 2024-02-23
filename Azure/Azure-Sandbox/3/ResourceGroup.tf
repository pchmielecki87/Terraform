provider "azurerm" {
  features {}
}

data "azurerm_key_vault" "example" {
  name                = "tf-keyvault-techbrain"
  resource_group_name = "tf-statefile"
}

data "azurerm_key_vault_secret" "sas_token" {
  name         = "tf-statefile-sastoken"
  key_vault_id = data.azurerm_key_vault.example.id
}

resource "azurerm_resource_group" "example" {
  name     = "terraform-resource-group-azure"
  location = "West Europe"
}

terraform {
  backend "azurerm" {
    storage_account_name = "terraformtechbrainone"
    container_name       = "tfstatefile"
    key                  = "terraform.tfstate"
    sas_token            = "data.azurerm_key_vault_secret.tf-statefile-storageacc-sastoken.value"
  }
}
