variable "prefix" {
  default = "tfvm"
}

resource "azurerm_virtual_machine" "vm" {
    name                  = "${var.VmName}-1"
    location              = "${var.location}"
    resource_group_name   = "${var.rgname}"
    network_interface_ids = ["${azurerm_network_interface.vm-nic.id}"]
    vm_size               = "${var.VmSize}"
    delete_os_disk_on_termination   = true
    storage_image_reference {
        id = "${var.ImageID}"
    }
    storage_os_disk {
        name                          = "${var.VmName}-1"
        caching                       = "ReadWrite"
        create_option                 = "FromImage"
        managed_disk_type             = "Standard_LRS"
    }
    
    os_profile {
        computer_name                 = "${var.VmName}-1"
        admin_username                = "${random_string.vmadmin.result}"
        #admin_password                = "${azurerm_key_vault_secret.vm-secret.value}"
        admin_password                = "${random_string.password.result}"
    }
    os_profile_windows_config {
    }
    tags = {
        environment = "sandbox"
    }
}
