provider "azurerm" {
  features {}
  subscription_id = "63abcf25-b8df-4c76-8b31-5004c9ba37cd"
  tenant_id = "47bfbfd9-f418-47f1-bb72-b0c55d1acdc5" 
}

resource "azurerm_resource_group" "example" {
  name     = "terraform-rg-createdbypipeline"
  location = "West Europe"
}
