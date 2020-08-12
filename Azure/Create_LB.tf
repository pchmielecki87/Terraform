resource "azurerm_lb" "dns-lb" {
  name                = "${var.VmName}-LB"
  location            = "${var.location}"
  resource_group_name = "${var.rgname}"
  frontend_ip_configuration {
    name                 = "LoadBalancerFrontEnd"
    subnet_id = "${var.SubnetId}"
    private_ip_address_allocation = "Static"
    private_ip_address ="10.34.126.21"
  }
}
