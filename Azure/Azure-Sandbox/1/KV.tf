# Declare variables

variable "rg_name" {
  description = "Resource Group Name"
  type        = string
  default     = "myResourceGroup"
}

variable "kv_name" {
  description = "Azure Key Vault Name"
  type        = string
  default     = "myKeyVault"
}

variable "kv_secret_name" {
  description = "Name of the secret to store"
  type        = string
  default     = "mySecret"
}

variable "kv_secret_value" {
  description = "Value of the secret to store"
  type        = string
  default     = "mySecretValue"
}

### Create KV

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = "East US"
}

resource "azurerm_key_vault" "example" {
  name                = var.kv_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku_name = "standard"

  tenant_id = data.azurerm_client_config.current.tenant_id

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions    = ["get", "list"]
    secret_permissions = ["get", "set"]
    certificate_permissions = []
  }
}

resource "azurerm_key_vault_secret" "example" {
  name         = var.kv_secret_name
  value        = var.kv_secret_value
  key_vault_id = azurerm_key_vault.example.id
}

### Use secret

data "azurerm_key_vault_secret" "retrieved_secret" {
  name         = var.kv_secret_name
  key_vault_id = azurerm_key_vault.example.id
}

output "retrieved_secret_value" {
  value       = data.azurerm_key_vault_secret.retrieved_secret.value
  sensitive   = true  # Mark as sensitive to avoid displaying in logs
}
