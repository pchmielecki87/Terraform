provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "terraform-rg-createdbypipeline"
  location = "West Europe"
}
