# Location of the VMs
location = "Australia East"

# Resource Group where the User Assigned Identities will be created
msi_rg = "infra-rg-aue-test"

# Name of the Key Vault that needs to be created
key_vault_rg               = "infra-rg-aue-test"
key_vault_name             = "test-only-kv-aue-test"
key_vault_sku              = "standard"
soft_delete_retention_days = 90
purge_protection_enabled   = "false"

# Tags
tags = {
  environment = "TEST"
  product     = "Core Infrastructure"
}

# Details of KeyVault that contains the passwords of Local Administrator
administrator_kv_name = "infra-kv-aue-test"
administrator_kv_rg   = "infra-rg-aue-test"

# Details of Azure Virtual Servers
admin_username                   = "administrateur" # This user should be changed to a difficult-to-guess name ( i.e., adminagent)
delete_data_disks_on_termination = "true"
os                               = "Windows"
timezone                         = "AUS Eastern Standard Time"

windows_vms = {
  vm1 = {
    vm_name       = "test-only-vm-01" # (Mandatory) VM Name
    vm_rg         = "ad-rg-aue-test"
    vm_private_ip = "10.120.12.61"      # (Mandatory) Private IP Address
    subnet_name   = "dcnetwork"         # (Mandatory) Name of Subnet
    vnet_name     = "spcc-test-vnet"    # (Mandatory) Name of Virtual Network
    vnet_rg       = "infra-rg-aue-test" # (Mandatory) Resource Group of VNet
    storage_os_disk = {
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
      disk_size_gb      = "128"
    }
    #storage_data_disks = []              # (Mandatory) For no data disks set []
    storage_data_disks = [
      {
        id                = "1" #Disk id
        lun               = "0"
        disk_size_gb      = "100"
        managed_disk_type = "Premium_LRS"
        caching           = "ReadWrite"
        create_option     = "Empty"
      },
    ]
    vm_size                    = "Standard_B2ms"
    public_ip_required         = "false"
    availability_set_name      = ""
    use_user_assigned_identity = "false"
  },
  vm2 = {
    vm_name       = "test-only-vm-02" # (Mandatory) VM Name
    vm_rg         = "ad-rg-aue-test"
    vm_private_ip = "10.120.12.62"      # (Mandatory) Private IP Address
    subnet_name   = "dcnetwork"         # (Mandatory) Name of Subnet
    vnet_name     = "spcc-test-vnet"    # (Mandatory) Name of Virtual Network
    vnet_rg       = "infra-rg-aue-test" # (Mandatory) Resource Group of VNet
    storage_os_disk = {
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
      disk_size_gb      = "128"
    }
    #storage_data_disks = []              # (Mandatory) For no data disks set []
    storage_data_disks = [
      {
        id                = "1" #Disk id
        lun               = "0"
        disk_size_gb      = "100"
        managed_disk_type = "Premium_LRS"
        caching           = "ReadWrite"
        create_option     = "Empty"
      },
    ]
    vm_size                    = "Standard_B2ms"
    public_ip_required         = "false"
    availability_set_name      = ""
    use_user_assigned_identity = "false"
  },

  # Servers which require Public IP Address
  vm3 = {
    vm_name       = "test-only-vm-03" # (Mandatory) VM Name
    vm_rg         = "vpn-rg-aue-test"
    vm_private_ip = "10.120.15.11"      # (Mandatory) Private IP Address
    subnet_name   = "vpnnetwork"      # (Mandatory) Name of Subnet
    vnet_name     = "spcc-test-vnet"    # (Mandatory) Name of Virtual Network
    vnet_rg       = "infra-rg-aue-test" # (Mandatory) Resource Group of VNet
    storage_os_disk = {
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
      disk_size_gb      = "128"
    }
    storage_data_disks = [
      {
        id                = "1" # Disk id
        lun               = "0"
        disk_size_gb      = "100"
        managed_disk_type = "Premium_LRS"
        caching           = "ReadWrite"
        create_option     = "Empty"
      },
      {
        id                = "2" # Disk id
        lun               = "1"
        disk_size_gb      = "200"
        managed_disk_type = "Premium_LRS"
        caching           = "ReadWrite"
        create_option     = "Empty"
      },
    ]
    #vm_size = "Standard_B2ms"
    vm_size                    = "Standard_DS1_v2"
    public_ip_required         = "true"
    availability_set_name      = ""
    use_user_assigned_identity = "true"
  },
  vm4 = {
    vm_name       = "test-only-vm-04" # (Mandatory) VM Name
    vm_rg         = "vpn-rg-aue-test"
    vm_private_ip = "10.120.15.12"      # (Mandatory) Private IP Address
    subnet_name   = "vpnnetwork"      # (Mandatory) Name of Subnet
    vnet_name     = "spcc-test-vnet"    # (Mandatory) Name of Virtual Network
    vnet_rg       = "infra-rg-aue-test" # (Mandatory) Resource Group of VNet
    storage_os_disk = {
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
      disk_size_gb      = "128"
    }
    storage_data_disks = [
      {
        id                = "1" #Disk id
        lun               = "0"
        disk_size_gb      = "100"
        managed_disk_type = "Premium_LRS"
        caching           = "ReadWrite"
        create_option     = "Empty"
      },
      {
        id                = "2" #Disk id
        lun               = "1"
        disk_size_gb      = "200"
        managed_disk_type = "Premium_LRS"
        caching           = "ReadWrite"
        create_option     = "Empty"
      },
    ]
    vm_size                    = "Standard_DS1_v2"
    public_ip_required         = "true"
    availability_set_name      = ""
    use_user_assigned_identity = "true"
  },

  # vm5 = {
  #   vm_name       = "test-only-vm-05"                # (Mandatory) VM Name
  #   vm_rg         = "vpn-rg-aue-test"
  #   vm_private_ip = "10.120.15.13"                                 # (Mandatory) Private IP Address
  #   subnet_name   = "vpnnetwork"                                 # (Mandatory) Name of Subnet
  #   vnet_name     = "spcc-test-vnet"          # (Mandatory) Name of Virtual Network
  #   vnet_rg       = "infra-rg-aue-test" # (Mandatory) Resource Group of VNet
  #   storage_os_disk = {
  #     caching           = "ReadWrite"
  #     create_option     = "FromImage"
  #     managed_disk_type = "Standard_LRS"
  #     disk_size_gb      = "128"
  #   }
  #   storage_data_disks = [
  #     {
  #       id                = "1" #Disk id
  #       lun               = "0"
  #       disk_size_gb      = "100"
  #       managed_disk_type = "Premium_LRS"
  #       caching           = "ReadWrite"
  #       create_option     = "Empty"
  #     },
  #   ]
  #   vm_size = "Standard_B2ms" # (Mandatory) 
  #   public_ip_required    = "true"
  #   availability_set_name = ""
  #   use_user_assigned_identity= "true"
  # }

}

# Windows Server 2019
storage_image_reference = {
  publisher = "MicrosoftWindowsServer"
  offer     = "WindowsServer"
  sku       = "2019-Datacenter"
  version   = "latest"
}

