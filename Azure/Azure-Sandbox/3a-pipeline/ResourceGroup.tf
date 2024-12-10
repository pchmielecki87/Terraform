provider "azurerm" {
  features {}
  subscription_id = "8dac1cb1-7130-4137-a400-92c8b6c10bd9"
  tenant_id = "63abcf25-b8df-4c76-8b31-5004c9ba37cd"
}

resource "azurerm_resource_group" "example" {
  name     = "terraform-rg-createdbypipeline"
  location = "West Europe"
}
