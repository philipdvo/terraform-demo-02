module "spcc_virtual_machine" {
  #source            = "./Modules/terraform-azure-virtual-machine"
  #source            = "git::https://github.com/philipdvo/terraform-azure-virtual-machine.git"
  source  = "philipdvo/virtual-machine/azure"
  version = "1.0.0"

  for_each = var.windows_vms

  vm_name           = each.value["vm_name"]
  subnet_name       = each.value["subnet_name"]
  vnet_name         = each.value["vnet_name"]
  vnet_rg           = each.value["vnet_rg"]
  vm_private_ip     = each.value["vm_private_ip"]
  storage_os_disk   = each.value["storage_os_disk"]
  storage_data_disk = each.value["storage_data_disks"]

  resource_group_name = each.value["vm_rg"]
  location            = var.location
  tags                = var.tags

  os = var.os
  os_profile = {
    computer_name      = each.value["vm_name"]
    admin_username     = var.admin_username
    provision_vm_agent = true
    license_type       = "Windows_Server"
    timezone           = var.timezone
  }

  storage_image_reference = var.storage_image_reference

  vm_size                          = each.value["vm_size"]
  delete_data_disks_on_termination = var.delete_data_disks_on_termination

  os_profile_windows_config = {
    provision_vm_agent = true
  }

  administrator_kv_name = var.administrator_kv_name
  administrator_kv_rg   = var.administrator_kv_rg

  public_ip_required         = each.value["public_ip_required"]
  availability_set_name      = each.value["availability_set_name"]
  use_user_assigned_identity = each.value["use_user_assigned_identity"]
  msi_rg                     = var.msi_rg
}

