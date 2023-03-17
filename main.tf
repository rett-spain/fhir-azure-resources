terraform {
  required_providers {
    azurerm = {
      version = "= 3.44.1"
    }
  }
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "tfstate17132"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "./modules/resource_group"

}

#module "key_vault" {
#  source = "key_vault"
#
#  vars = {
#    sku_name = "Standard"
#    purge_protection_enabled = false
#  }
#}