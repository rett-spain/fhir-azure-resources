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

  basename = local.basename
}

module "key_vault" {
  source = "./modules/key_vault"

  rg_name                  = module.resource_group.resource_group_name
  basename                 = local.basename
  location                 = local.location
  sku_name                 = "standard"
  purge_protection_enabled = true
  tags                     = local.tags
}