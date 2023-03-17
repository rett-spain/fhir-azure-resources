# Key Vault

module "key_vault" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/key-vault"

  basename                 = var.basename
  rg_name                  = var.resource_group_name
  location                 = var.location

  sku_name                 = var.sku_name
  purge_protection_enabled = var.purge_protection_enabled

  tags                     = var.tags
}