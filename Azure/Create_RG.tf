provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.31.0"
}

resource "azurerm_resource_group" "dev" {
  name     = "dev-rg"
  location = "West Europe"

  tags = {
    environment = "dev"
  }
}

