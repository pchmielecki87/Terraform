module "resource_group" {
  source              = "./modules/terraform-rg"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "app_service" {
  source                = "./modules/terraform-appservice"
  resource_group_name   = var.resource_group.name
  app_service_plan_name = var.app_service_plan_name
  app_service_name      = var.app_service_name
  location              = var.location
}

module "storage_account" {
  source                         = "./modules/terraform-storage"
  resource_group_name            = var.resource_group.name
  storage_account_name           = var.storage_account_name
  contianer_storage_account_name = var.contianer_storage_account_name
  location                       = var.location
}
