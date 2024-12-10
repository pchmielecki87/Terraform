provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "terraform-resource-group-tfcloud"
  location = "West Europe"
}

terraform {
  backend "remote" {
    organization = "Sages-TF-Azure"
    workspaces {
      name = "Azure"
    }
  }
}
