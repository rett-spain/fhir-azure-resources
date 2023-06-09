locals {
  default_akv = {
    module_enabled                      = local.enable_keyvault
    sku_name                            = "standard"
    basename                            = local.basename
    location                            = local.location
    tags                                = local.tags
    is_sec_module                       = false
    subnet_id                           = ""
    private_dns_zone_ids                = []
    soft_delete_retention_days          = 90
    purge_protection_enabled            = true
    enabled_for_deployment              = false
    firewall_virtual_network_subnet_ids = []
    firewall_default_action             = "Deny"
    firewall_ip_rules                   = []
    firewall_bypass                     = "AzureServices"
  }

  merged_akv = local.akvs != null ? [for akv in local.akvs : merge(local.default_akv, akv)] : []

}

module "key_vault" {
  source                              = "./modules/key-vault" #"github.com/Azure/azure-data-labs-modules/terraform/key-vault"
  for_each                            = local.merged_akv != null ? { for element in local.merged_akv : element.name => element } : {}
  module_enabled                      = each.value.module_enabled
  basename                            = each.value.name
  resource_group_name                 = module.resource_group[each.value.resource_group_name].name
  location                            = each.value.location
  sku_name                            = each.value.sku_name
  tags                                = each.value.tags
  is_sec_module                       = each.value.is_sec_module
  subnet_id                           = each.value.subnet_id
  private_dns_zone_ids                = each.value.private_dns_zone_ids
  soft_delete_retention_days          = each.value.soft_delete_retention_days
  purge_protection_enabled            = each.value.purge_protection_enabled
  enabled_for_deployment              = each.value.enabled_for_deployment
  firewall_virtual_network_subnet_ids = each.value.firewall_virtual_network_subnet_ids
  firewall_default_action             = each.value.firewall_default_action
  firewall_ip_rules                   = each.value.firewall_ip_rules
  firewall_bypass                     = each.value.firewall_bypass
}
