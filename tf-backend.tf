terraform {
  #required_version = ">=0.11.0"
  required_version = ">=1.1.5"
  required_providers {
    azurerm = {
      version = "~> 2.0"
    }
    azuread = {
      version = "=0.7.0"
    }
    random = {
      version = "=2.2"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = ""
  #   storage_account_name = ""
  #   container_name       = ""
  #   key                  = ""
  # }
}


provider "azurerm" {
  features {
  }
}


