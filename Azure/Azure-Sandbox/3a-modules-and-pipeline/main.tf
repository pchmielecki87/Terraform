module "resource_group" {
  source              = "./modules/terraform-rg"
  resource_group_name = var.resource_group_name
  location            = var.location
}

# module "app_service" {
#   source = "./modules/terraform-appservice"
#   resource_group_name = module.resource_group.name

# }

# module "storage_account" {
#   source = "./modules/terraform-storage"
#   resource_group_name = module.resource_group.name
# }
