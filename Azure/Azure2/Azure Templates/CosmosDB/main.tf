# Configure the Microsoft Azure Provider
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}

variable "tenant_id" {}

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

resource "azurerm_resource_group" "cosmos-rg" {
  name     = "CosmosDemo"
  location = "West US"
}

resource "azurerm_cosmosdb_account" "cosmosDB" {
  name                = "cosmos-iac-demo"
  location            = "${azurerm_resource_group.cosmos-rg.location}"
  resource_group_name = "${azurerm_resource_group.cosmos-rg.name}"


}
