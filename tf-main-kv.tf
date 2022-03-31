# Get Tenant ID
data "azurerm_client_config" "current_principal" {
}


#Create Key Vault 
resource "azurerm_key_vault" "keyvault" {
  name                       = var.key_vault_name
  location                   = var.location
  resource_group_name        = var.key_vault_rg
  tenant_id                  = data.azurerm_client_config.current_principal.tenant_id
  sku_name                   = var.key_vault_sku
  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled   = var.purge_protection_enabled

  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }

  tags = var.tags
}


module "spcc_kv_access_policy" {
  #source = "./Modules/terraform-azure-kv-access-policy"
  #source = "git::https://github.com/philipdvo/terraform-azure-kv-access-policy.git"

  source  = "philipdvo/kv-access-policy/azure"
  version = "1.0.0"

  for_each = var.windows_vms

  virtual_machine_rg         = each.value["vm_rg"]
  vm_name                    = each.value["vm_name"]
  use_user_assigned_identity = each.value["use_user_assigned_identity"]
  msi_rg                     = var.msi_rg

  key_vault_id = azurerm_key_vault.keyvault.id

  depends_on = [
    module.spcc_virtual_machine
  ]
}