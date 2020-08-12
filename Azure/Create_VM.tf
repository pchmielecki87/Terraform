########################################################
###### Create VM1
########################################################
resource "azurerm_virtual_machine" "vm1" {
    name                  = "${var.VmName}-Primary"
    location              = "${var.location}"
    resource_group_name   = "${var.rgname}"
    network_interface_ids = ["${azurerm_network_interface.vm-interface1.id}"]
    vm_size               = "${var.VmSize}"
    delete_os_disk_on_termination   = true
    storage_image_reference {
        id = "${var.ImageID}"
    }
    storage_os_disk {
        name                          = "${var.VmName}-Primary"
        caching                       = "ReadWrite"
        create_option                 = "FromImage"
        managed_disk_type             = "Standard_LRS"
    }
    
    os_profile {
        computer_name                 = "${var.VmName}-Primary"
        admin_username                = "${random_string.vmadmin.result}"
        #admin_password                = "${azurerm_key_vault_secret.vm-secret.value}"
        admin_password                = "${random_string.password.result}"
    }
    os_profile_windows_config {
    }
    tags = {
        environment = "dev"
    }
}


###################################
# Create Virtual Machine Extentions
###################################
resource "azurerm_virtual_machine_extension" "rmOctopusTentacle" {
  name                 = "CustomScript-0"
  location             = "${var.Location}"
  resource_group_name  = "${var.RgName}"
  virtual_machine_name = "${var.VmName}"
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  settings = <<SETTINGS
    {
        "commandToExecute": "powershell.exe .\Tentacle.exe service --start"] #this is powershell command!!!
     }
  SETTINGS
  depends_on = ["azurerm_virtual_machine.vm1"]
}
