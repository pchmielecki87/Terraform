provider "azurerm" {
  version = "=2.84.0"
}

resource "azurerm_resource_group" "terraformsandbox" {
  name     = "terraform-sandbox-rg"
  location = "West Europe"

  tags = {
    environment = "sandbox"
  }
}

