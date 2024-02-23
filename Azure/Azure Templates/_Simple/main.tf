# Create RG from module
module rg {
 source                          = "./modules/rg"
 rgname                          = "${var.resource_group_name_prefix}"
 location                        = "${var.resource_group_location}"
}

# Rest of modules come here