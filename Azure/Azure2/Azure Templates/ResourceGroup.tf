provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "terraform-resource-group"
  location = "West Europe"
}
