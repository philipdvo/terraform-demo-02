
variable "location" {}

variable "delete_data_disks_on_termination" {}

variable "tags" {}

variable "admin_username" {}

variable "administrator_kv_name" {}
variable "administrator_kv_rg" {}


variable "windows_vms" {
  default = {
    vm1 = {
      vm_name       = "windows-vsvr999" #(Mandatory) VM Name
      vm_rg         = "ad-rg-ase"
      vm_private_ip = "10.0.2.61"                 #(Mandatory) Private IP Address
      subnet_name   = "internal"                  #(Mandatory) Name of Subnet
      vnet_name     = "test-network"              #(Mandatory) Name of Virtual Network
      vnet_rg       = "terraaform-modules-rg-dev" #(Mandatory) Resource Group of VNet
      storage_os_disk = {
        name              = "osdisk1"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
        disk_size_gb      = "128"
      }
      storage_data_disks         = []              # (Mandatory) For no data disks set []
      vm_size                    = "Standard_B2ms" # (Mandatory) 
      public_ip_required         = "false"
      availability_set_name      = ""
      use_user_assigned_identity = false
    }
  }
}

variable "os" {}
variable "storage_image_reference" {}
variable "timezone" {}


variable "key_vault_rg" {}
variable "key_vault_name" {}
variable "key_vault_sku" {}
variable "soft_delete_retention_days" {}
variable "purge_protection_enabled" {}

variable "msi_rg" {}
