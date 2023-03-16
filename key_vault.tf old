# Key Vault

# Resource group

module "resource_group" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/resource-group"

  vars = {
    rg_name = "example-resources"
    location = local.location
    basename = local.basename
    tags = local.tags
  }
}

module "key_vault" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/key-vault"

  basename                 = local.basename
  resource_group_name      = module.resource_group.name
  location                 = local.location
  sku_name                 = var.sku_name
  purge_protection_enabled = var.purge_protection_enabled

  #subnet_id            = local.enable_private_endpoints ? module.subnet_default[0].id : null
  #private_dns_zone_ids = local.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.vaultcore.azure.net"].id] : null

  #is_sec_module = local.enable_private_endpoints

  tags = local.tags
}