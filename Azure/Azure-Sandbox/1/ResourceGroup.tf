provider "azurerm" {
  features {}
  subscription_id = "63abcf25-b8df-4c76-8b31-5004c9ba37cd"
}

resource "azurerm_resource_group" "example" {
  name     = "terraform-resource-group"
  location = "West Europe"
}

resource "azurerm_resource_group" "example2" {
  name     = "terraform-resource-group2"
  location = "West Europe"
}