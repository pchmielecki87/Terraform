resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "development"
  }
}

resource "azurerm_storage_container" "sa" {
  name                  = var.contianer_storage_account_name
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}
