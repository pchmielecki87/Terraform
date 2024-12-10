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


# # import existing
# data "azurerm_resource_group" "this" {
#   name = "var.resource_group_name"
# }

# # use exising rg
# resource "azurerm_service_plan" "app" {
#   name                = var.app_service_plan_name
#   location            = var.location
#   resource_group_name = data.resource_group.this.name
#   os_type             = "Linux"
#   sku_name            = "F1"
# }