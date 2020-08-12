resource "azurerm_network_interface" "vm-interface1" {
  resource_group_name             = "${var.rgname}"
  name                            = "${var.VmName}-prim-nic"
  location                        = "${var.location}"
  ip_configuration {
    name                          = "${var.VmName}-prim-ip"
    subnet_id                     = "${var.SubnetId}"
    private_ip_address_allocation = "Dynamic"
  }
}
