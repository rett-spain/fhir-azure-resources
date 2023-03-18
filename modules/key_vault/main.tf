# Key Vault

module "key_vault" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/key-vault"

  basename                 = local.basename
  resource_group_name      = module.resource_group.name
  location                 = local.location
  sku_name                 = var.sku_name
  purge_protection_enabled = var.purge_protection_enabled

  tags = var.tags

  is_sec_module = false
}
