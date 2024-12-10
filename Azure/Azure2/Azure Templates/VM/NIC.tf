resource "azurerm_network_interface" "vm-nic" {
  resource_group_name   = "${var.rgname}"
  name                  = "${var.VmName}-nic"
  location              = "${var.location}"

  ip_configuration {
    name                = "${var.VmName}-ip"
    subnet_id           = "${var.SubnetId}"
    private_ip_address_allocation = "Dynamic"
  }
}
