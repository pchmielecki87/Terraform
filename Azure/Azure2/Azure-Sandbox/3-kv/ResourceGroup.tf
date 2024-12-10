provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "terraform-resource-group-azure"
  location = "West Europe"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "tf-statefile"
    storage_account_name = "terraformtechbrain"
    container_name       = "tfstatefile"
    key                  = "terraform.tfstate"
    use_msi              = true
    subscription_id      = "63abcf25-b8df-4c76-8b31-5004c9ba37cd"
    tenant_id            = "47bfbfd9-f418-47f1-bb72-b0c55d1acdc5"
  }
}
