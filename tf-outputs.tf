output "admin_username" {
  value = var.admin_username
}

output "virtual_machine_names" {
  value     = module.spcc_virtual_machine.*
  sensitive = true
}

