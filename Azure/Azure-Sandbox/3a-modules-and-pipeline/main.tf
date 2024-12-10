module "rg" {
  source              = "./modules/terraform-rg"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "app" {
  source                = "./modules/terraform-appservice"
  resource_group_name   = var.resource_group_name
  app_service_plan_name = var.app_service_plan_name
  app_service_name      = var.app_service_name
  location              = var.location
}

module "sa" {
  source                         = "./modules/terraform-storage"
  resource_group_name            = var.resource_group_name
  storage_account_name           = var.storage_account_name
  contianer_storage_account_name = var.contianer_storage_account_name
  location                       = var.location
}
